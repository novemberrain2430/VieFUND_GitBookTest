# Account & Plan — Module Guide

> Hướng dẫn kỹ thuật cho mô hình Plan, các luồng add/update/delete, beneficiary, joint holder, RRIF, RESP, TFSA và payment/redemption.
>
> **Phạm vi bằng chứng**: source được project `MyPortfolioNew/VieFUND-Platform/src/apps/WebApp/WebApp.csproj` tham chiếu và SQL snapshot trong `src/SQLScript`. Đây không phải xác nhận schema hay dữ liệu của live database.

---

## 1. Mô hình Client → Plan → Account → Position

Mô hình logic và object vật lý đã thấy trong SQL:

```text
UB_Customer (ID)
 ├── UB_Plan (ID, iClientID)
 │    ├── UB_FundAccount (ID, iPlanID)
 │    │    └── UB_FundAccountPosition (iFundAccountID, iPlanID)
 │    ├── UB_CashAccount (iPlanID)
 │    ├── UB_GICAccount (iPlanID)
 │    ├── UB_PlanBen (LinkedID → Plan.ID)
 │    └── UB_RRIFSetting / UB_RRIFSettingFund / UB_RRIFSettingCheque
 └── UB_CustomerPlan (iClientID, iPlanID)   ← liên kết client/joint holder với Plan
```

| Object | Vai trò đã xác nhận từ query/SP | Ghi chú |
|---|---|---|
| `UB_Plan` | Plan master | PK được suy ra là `ID`; `iPlanID` thường là tên parameter/FK ở object khác |
| `UB_CustomerPlan` | Liên kết Client–Plan, gồm joint holder | Không thấy bằng chứng cho một bảng vật lý riêng tên `tPlanJoint` |
| `UB_CustomerPlanTMP` | Staging joint holder theo session/user | Dùng khi Plan chưa lưu hoàn tất |
| `UB_FundAccount` | Account thuộc Plan | Có `iPlanID`; external account identifier là `FundAccountID` |
| `UB_FundAccountPosition` | Fund position thuộc account/Plan | `MgmtCode`, `FundID`, units/status và average-cost evidence nằm ở position, không phải toàn bộ ở `UB_FundAccount` |
| `UB_CashAccount`, `UB_GICAccount` | Cash/GIC children của Plan | Là các nhánh song song được delete logic xét riêng |
| `UB_PlanBen` | Beneficiary/related person | Link tới Plan bằng `LinkedID` |
| `UB_PlanBenTMP` | Staging beneficiary theo session/user | Không phải master data |

> **Đính chính**: các tên `tPlan`, `tFundAccount`, `tFundPosition`, `tPlanBeneficiary`, `tPlanJoint` trong bản cũ không khớp object được dùng trong SQL snapshot. Không có static synonym map chứng minh các tên đó là alias.

Repository không chứa base-table DDL, do đó các khóa và quan hệ trên được suy ra từ join/DML; không nên diễn giải là PK/FK constraint đã được xác nhận.

---

## 2. AccountType, display symbol và FSCode

Ba khái niệm phải được tách riêng:

| Khái niệm | Contract hiện có |
|---|---|
| `AccountType` | `UBPlanAdd` nhận `varchar(2)`; UI truyền selected value vào Plan save |
| Tên/symbol như `OPEN`, `RRSP`, `TFSA`, `RESP` | Lookup/display data từ `UB_Def_AccountType`; không phải raw value đã chứng minh của `UB_Plan.AccountType` |
| `FSCode` | Metadata từ `UB_Def_AccountType` hoặc output của procedure; không thấy bằng chứng là column trực tiếp của `UB_Plan` |

`Plan.GetPlanTypeInfo()` gọi `UBPlanTypeInfo` và trả về các capability flags `bGroup`, `bSpousal`, `bInTrust`, `bLockedIn` cùng `FSCode`. UI dùng các flags này để bật/tắt control; method không định nghĩa chính sách thuế của từng loại Plan.

Một số raw value có branch rõ trong source/SQL:

| Value | Hành vi quan sát được |
|---|---|
| `01` | Được xử lý như OPEN trong rule in-trust của `UBPlanAdd` |
| `05`, `06` | Đi vào các nhánh RESP |
| `17` | Đi vào nhánh TFSA/successor |
| `18` | Được UI xử lý như RDSP |
| `04`, `12`, `14` | Được `PopupPlanAdd.IsRIFPlan()` nhận là RIF-like |

Danh sách type đầy đủ và mapping tên ↔ code phụ thuộc lookup data của từng database. Các giới hạn contribution, tax treatment, CESG/CLB rate hoặc CRA withdrawal formula không được định nghĩa đầy đủ trong source đã audit; khi cần mô tả nghiệp vụ pháp lý phải dùng nguồn regulator có ngày hiệu lực, không suy ra từ `GetPlanTypeInfo()`.

---

## 3. Plan fields và tên vật lý

| Nhóm | API/SP contract | Database evidence/ghi chú |
|---|---|---|
| Plan ID | `iPlanID` | Master key là `UB_Plan.ID`; `iPlanID` là parameter hoặc FK phổ biến |
| Client/rep/spouse | `iClientID`, `iRepID`, `iSpouseID` | Được truyền qua `PlanAddUI`; nơi lưu của toàn bộ field cần base DDL để xác nhận |
| Type | `AccountType`, `FSCode` | `AccountType` nằm trên `UB_Plan`; `FSCode` là lookup/output metadata |
| Designation | `AccountDesignation` | UI/SQL xử lý `1` = client name, `2` = nominee, `3` = intermediary; localized label vẫn phụ thuộc lookup |
| Status/date | UI dùng status, start/end date | SQL dùng `UB_Plan.AccountStatus`, `dtStartDate`, `dtEndDate`, không phải `Status`, `StartDate`, `EndDate` |
| Joint | `JointType`, `JointSignatureOpt` | Joint clients được đọc qua `UB_CustomerPlan` |
| RESP | `RecipientCode`, `bRESPSiblingFlag` | Có trong add/update contract; flag không tự chứng minh cách phân bổ grant |
| Successor/deceased | C# `bTFSASuccessorInd`, effective date, deceased name/SIN/DOD | SQL parameter dùng tên `iTFSASuccessorInd`; UI bật workflow cho TFSA và một số RIF-like type |
| Lock-in/trust | `iLockedIn`, `LockedInProv`, `iInTrust` | Có rule theo type/capability và dealer trong UI/SP |
| Compliance | C# boolean/integer values cho incomplete KYC/question, `iCommFlag` | SP boundary dùng tên như `iIncompleteKYC`, `iIncompleteQuestion` |
| Fee/model | `iAAModelID`, `iFeeAUAExclude` | Có trong save contract; persistence location đầy đủ chưa thể dựng khi thiếu base DDL |

Nguồn contract chính là signature và parameter mapping của `UBClass.Plan.PlanAddUI()`, không phải một data model khai báo schema.

---

## 4. Entry points và Plan CRUD

### 4.1 Luồng Web Forms chính

```text
Client.aspx.cs
  ├── mở PopupPlanAdd.aspx.cs cho Add/Edit
  ├── PopupPlanAdd.OnOK()
  │     ├── validate advisor/relationship và acquire action guard
  │     ├── lưu investment information, questions và UDF
  │     └── PopupPlanAdd.OnAdd()
  │            └── Plan.PlanAddUI()
  │                  ├── iPlanID == 0 → UBPlanAdd
  │                  └── iPlanID != 0 → UBPlanUpdate (+ LMD)
  └── delete → Plan.PlanDeleteUI() → UBPlanDelete
```

`PopupPlanAdd.OnAdd()` truyền hơn 50 values và map các `Ret` code của SP sang thông báo nghiệp vụ. Các validation quan sát được gồm intermediary code, spouse/joint context, TFSA/RIF successor data, SIN/date và một số rule theo dealer/type/designation.

Các bước lưu investment information/questions/UDF diễn ra trước Plan add/update; source đã audit không cho thấy một transaction bao trùm toàn bộ chuỗi này. Khi sửa flow cần tính đến khả năng partial save.

### 4.2 Method/SP map chính xác

| C# method | Stored procedure | Vai trò |
|---|---|---|
| `Plan.PlanAddUI()` | `UBPlanAdd` / `UBPlanUpdate` | Chọn add/update theo `iPlanID` |
| `Plan.PlanDeleteUI()` | `UBPlanDelete` | Delete và trả `Ret` |
| `Plan.GetPlanInfo()` | `UBPlanInfo2` | Có overload lấy field đơn và overload multi-result `DataSet` |
| `Plan.PlanInfo4Header()` | `UBPlanInfo4Header` | Header info; không có method `GetPlanInfo4Header()` |
| `Plan.GetPlanTypeFSCode()` | `UBPlanInfoType` | Resolve type/FSCode từ Plan/account/position |
| `Plan.GetPlanTypeInfo()` | `UBPlanTypeInfo` | Capability flags và FSCode |
| `Plan.GetSearchList()` | `UBPlanViewSearchLoad` | Load search metadata/data; procedure body có trong SQL snapshot |
| `Plan.GetPlanViewList()` | `UBPlanViewSearch` | Plan search multi-result |

### 4.3 Delete semantics

Không dùng rule đơn giản “chỉ delete khi không còn `UB_FundAccount`”. Body `UBPlanDelete` trong SQL snapshot:

- trả `Ret = 1` khi còn cash transaction, fund position hoặc GIC account liên quan;
- có thể xóa cash/fund account rỗng trước khi xóa Plan;
- UI map `Ret = 1` thành thông báo account linked;
- comment của procedure nhắc đến trigger dọn dữ liệu liên quan, nhưng repository không có trigger definition để xác minh cascade thực tế.

Vì vậy delete precondition thuộc database procedure và phải được kiểm tra lại trên live DB nếu thay đổi rule.

### 4.4 Alternate service path

`RespApp4Rep/VieFund/Services/OnboardingService.SavePlan()` gọi trực tiếp `UBPlanAdd`, default blank status thành `A`; nhánh update trong method đang bị comment. Không tìm thấy controller caller cho method này trong audit, nên không coi đây là confirmed live HTTP entry point. Method này cũng khởi tạo result bằng `0`, không phân biệt được DB failure với SP success nếu không đọc được result row.

### 4.5 Contract `Ret` và Plan ID

`UBPlanAdd` và `UBPlanUpdate` trả hai column độc lập:

```text
Ret = business result code
ID  = Plan ID vừa tạo hoặc Plan ID đang update
```

`Plan.PlanAddUI()` trả `Ret` và sửa `iPlanID` qua `ref`. Sau đó `PopupPlanAdd.OnAdd()` đổi contract lần nữa: trả Plan ID khi `Ret == 0`, trả `0` khi `Ret != 0`. Vì vậy giá trị trả về của `OnAdd()` không phải SP `Ret`.

`UBPlanDelete` chỉ trả `Ret`; UI delete chỉ có xử lý riêng cho `0` và `1`.

Bảng dưới phản ánh procedure body trong SQL snapshot và switch hiện tại của `PopupPlanAdd`, không phải cam kết của live DB:

| `Ret` | Phạm vi phát sinh | Ý nghĩa trong SQL snapshot | UI handling |
|---:|---|---|---|
| `0` | Add/Update/Delete | Success của SP; delete Plan không tồn tại cũng rơi về `0` | Save trả `ID`; delete clear current Plan và reload |
| `1` | Add; Update SP khi caller truyền `iAcceptDuplication = 0` | Duplicate active `DealerAccountID`; Web Forms `PlanAddUI` không truyền option này nên update branch đó không reachable từ flow đã audit | `MSG_AlreadyExist` trên dealer account |
| `1` | Delete | Còn cash transaction, fund position hoặc GIC account | `MSG_CannotDeletePlan_AccLinked` |
| `2` | Update | `CheckClientIDPlan` không resolve được client-plan | UI gọi `MSG_SPError(..., "UBPlanAdd")`, dù operation là update |
| `3` | Add/Update | Duplicate intermediary pair; một số branch dealer-level dùng cùng code cho duplicate dealer account | `MSG_AlreadyExist` trên intermediary number |
| `4` | Add/Update | Thiếu in-trust data tương ứng | `MSG_InTrustInfo` |
| `5` | Không có live SQL emitter | Missing-joint checks trong SP đang comment; UI có pre-SP joint guard riêng | Case vẫn tồn tại: `MSG_JointInfo` |
| `6–9` | Không có contract đã thấy | Không được emit và không có UI case | Unknown nonzero: không alert, save trả `0` |
| `10` | Update | Chỉ khi LMD parse được: DB LMD lớn hơn input LMD cộng một giây; blank/unparseable input bỏ qua check | `MSG_LMD` |
| `11` | Update | Không cho `A → T` khi còn active fund position/GIC/cash account | `MSG_AccountMustBInactive` |
| `12` | Add/Update | Corporate client dùng recipient code không hợp lệ | `MSG_RecipientCode` |
| `13` | Add/Update | Nominee designation nhưng dealer không được cấu hình nominee | `MSG_NomineeDealerCode` |
| `14` | Update | Không cho `A → P` khi Plan còn position có units | `MSG_CannotChangeToPendingPlan` |
| `15` | Add/Update | Non-corporate client dưới 18 cho TFSA hoặc RIF-type predicate hiện hành | `MSG_UnderAge` |
| `16` | Không có live SQL emitter | Header/comment cũ nói về under-age POA; validation block không active | Case vẫn tồn tại: `MSG_UnderAgePOA` |
| `17` | Add/Update | Thiếu SIN cho các TFSA/RRSP-type branch; update có thêm điều kiện DSID ở TFSA branch | `MSG_SINNumberRequired` |
| `18` | Add/Update | Rule DSID `1912`, type `14`, province phải là MB/SK; update chỉ xét khi active | `MSG_PlanMBSKOnly` |
| `19` | Không có live SQL emitter | Federal-only validation tương ứng đang comment | Case vẫn tồn tại: `MSG_PlanFedOnly` |
| `20` | Add/Update | Deceased date null hoặc ở tương lai trong successor flow | `MSG_InvalidInput` tại deceased date |
| `21` | Add/Update | Successor effective date null hoặc sớm hơn deceased date | `MSG_InvalidInput` tại successor date |
| `22` | Add/Update | Nominee-account-only/restricted dealer-type rules; add có thêm emitter cho type `51/52/53` | `MSG_NomineeAccountOnly` |
| `23` | Add/Update | DSID `1912` không cho client-name designation | `MSG_ClientNameNotAllow` |
| `24` | Add/Update | Thiếu currency hoặc vi phạm dealer/type currency rule; nhiều condition dùng chung code | `MSG_CurrencyMixNotAllow` |
| `25` | Update | Currency mới nonblank, không có active position nào cùng currency và có ít nhất một active position khác currency | `MSG_CurrencyMixNotAllowFund` |
| `26` | Add/Update | Joint recipient (`2/7`) không hợp lệ cho type ngoài `01/05/06/18` | `MSG_JointPlanType` |
| `27` | Add/Update | In-trust chỉ được phép với OPEN (`01`) | `MSG_JointPlanTrust` |
| `28` | Update | Không được đổi client-name sang nominee theo user/DSID capability | `MSG_ClientName2NomineeNotAllow` |
| `29` | Add/Update | HISA/GIC-only từ chối client-name và thông thường từ chối intermediary; DSID `1912` là exception cho intermediary | `MSG_PlanHISA_GICNomineeOnly` |
| `30` | Update | HISA/GIC-only gặp position có fund `ProductType <> 'A'` và `Classification NOT IN ('01','02')`; query không lọc position status | `MSG_PlanHISA_GICOnly` |
| `31` | Update | Old/new model ID đều dương, khác nhau, và model mới bị `IsCappedNoNewPlan` | `MSG_ModelCappedPlan` |

Các điểm cần lưu ý khi dùng contract này:

- `1` bị overload: duplicate khi save, nhưng là linked-asset blocker khi delete. Update duplicate-dealer branch còn phụ thuộc `iAcceptDuplication = 0`; Web Forms wrapper đã audit không truyền parameter này.
- `5`, `16`, `19` có UI case nhưng không có live `SET @Ret` trong snapshot; `6–9` không tồn tại ở cả hai phía.
- `2` có message sai ngữ cảnh trên update. Local `errorCode = 2` của BLL khi DB open thất bại không được trả ra thành `Ret = 2`.
- Switch save không có `default`; unknown nonzero code chỉ làm `OnAdd()` trả `0` mà không hiển thị lỗi.
- Delete UI không xử lý unknown code ngoài `0/1`.

### 4.6 Infrastructure failure bị collapse thành success code

`Plan.PlanAddUI()` và `Plan.PlanDeleteUI()` đều khởi tạo `Ret = 0`. Các lỗi sau không được chuyển thành một result code riêng:

- không lấy được connection parameters;
- `CDatabase.Open()` thất bại;
- `ExecuteSQL()` hoặc `Read()` thất bại/không có result row;
- exception bị wrapper catch.

`CDatabase` chủ yếu trả status (`Open`: số âm; `ExecuteSQL`/`Read`: `0`) và giữ message trong local variable. `Plan` wrapper gán `errorCode`/`errorMessage` cục bộ nhưng cuối cùng vẫn trả `Ret` mặc định; không thấy log hoặc rethrow trên flow này.

| Operation | Khi infrastructure failure để lại `Ret = 0` | Hành vi UI có thể xảy ra |
|---|---|---|
| Add | `ID` ban đầu vẫn là `0` | Dialog không close nhưng không có business alert; nếu DB đã commit nhưng result read bị mất, retry có thể tạo duplicate/ambiguous state |
| Update | `ref ID` vẫn giữ existing positive Plan ID | `OnAdd()` trả existing ID và `OnOK()` có thể close như save thành công |
| Delete | BLL trả `0` | UI clear `CurrentPlanID` và reload như delete thành công |

Đây là implementation risk đã xác nhận từ control flow, không phải bằng chứng rằng production đã xảy ra incident.

### 4.7 Transaction, staging và concurrency boundaries

Ba procedure snapshot `UBPlanAdd`, `UBPlanUpdate`, `UBPlanDelete` không có explicit `BEGIN TRAN/COMMIT/ROLLBACK` hoặc `TRY/CATCH`. Chúng thực hiện nhiều DML/nested-SP calls trước khi trả result. Không có bằng chứng trong repository cho một transaction bao trùm từ Web Forms tới toàn bộ procedure chain.

Các boundary quan trọng:

1. `PopupPlanAdd.OnOK()` lưu investment information, questions và UDF trước; sau đó đóng connection này rồi `OnAdd()` mở flow/connection khác để add/update Plan.
2. Một số TMP writers chạy trước validation cuối; questionnaire save còn bỏ qua return của helper write. Batch sau thất bại có thể để lại batch trước.
3. `ActionStart` dùng session flag `TMPACTION`, không phải database idempotency key. Reset không nằm trong `finally`; delete không dùng guard này.
4. `UBPlanAdd` thực hiện duplicate checks với `NOLOCK` tách rời khỏi insert. Unique constraints của live schema chưa được biết.
5. `UBPlanUpdate` dùng LMD theo kiểu check-then-write với tolerance một giây; blank hoặc value mà `UBDate120` trả null sẽ bypass check, còn final `UPDATE` không đặt LMD trong `WHERE`. Snapshot còn có branch sửa `UB_CustomerPlan` trước LMD check, nên request stale có thể đã tạo side effect rồi mới trả `Ret = 10`.
6. `UBPlanDelete` có thể xóa empty cash/fund-account rows trước audit và delete Plan. Nếu bước sau lỗi, wrapper vẫn có nguy cơ trả default `0`.
7. `OnCancel()` của new Plan lưu draft TMP values thay vì xóa; helper `RemoveTMP()`/`UBClearAllTMP` có definition nhưng không tìm thấy caller trong page flow đã audit.

Theo SQL Server autocommit thông thường, statement đã thành công trước một lỗi sau đó có thể tồn tại khi không có transaction bao ngoài. Tuy nhiên ambient transaction, nested procedure/trigger behavior và live connection settings chưa được xác minh; vì vậy tài liệu không khẳng định chính xác row nào sẽ persist trong production.

### 4.8 Authorization boundary

- Add/update kiểm tra `ADD/PLAN` hoặc `MOD/PLAN` trong initial `!IsPostBack` load; `OnOK()` không lặp lại authorization check ngay trước commit.
- Delete gọi lại `IsPageValid()` và `IsAccessible(..., "DEL", "PLAN")` trong server action trước SP call.
- BLL wrappers và ba procedure body đã đọc không thực hiện general ADD/MOD/DEL authorization; `iUserID` chủ yếu phục vụ audit và một số rule capability.

Policy thực tế của `IsAccessible`, session serialization và quyền DB vẫn phụ thuộc deployment.

---

## 5. Beneficiaries

### 5.1 Data contract

`UB_PlanBen` dùng các field đã thấy như `FirstName`, `LastName`, `dtDOB`, `SIN_BN`, `iRelationship`, `iRecordType`, `iBenType`, `fAllocation`, `fContributionAllocation`, `bCLB`, `bBCTESG`, `bCESG`. Các label như relationship/type được format qua lookup/function; không nên coi `Name`, `DOB`, `SIN`, `BenType` là tên column vật lý.

| C# method | Stored procedure |
|---|---|
| `Plan.PlanBenListSet()` | `UBPlanInfoBenList` |
| `Plan.PlanBenListShortSet()` | `UBPlanInfoBenListShort` |
| `Plan.PlanBenConListSet()` | `UBPlanBenConList` |
| `Plan.PlanBenInfoSet4RESP()` | `UBBenItemInfo4RESP` |
| `Plan.PlanRESPSummaryOneBen()` | `UBRESPSummaryOneBen` |

### 5.2 Allocation rule

Source hiện tại có hai mức kiểm tra khác nhau:

- `PanelPlanBenAdd` chặn primary allocation ngoài khoảng `0 < fAllocation <= 100`;
- list UI cộng allocation và hiển thị cảnh báo đỏ khi tổng khác 100%; đoạn code này không chặn save chỉ vì aggregate khác 100.

Không tìm thấy CHECK constraint, trigger hoặc SP enforcement chứng minh “tổng luôn phải bằng 100” là database invariant. Tài liệu và code mới không nên dựa vào invariant này nếu chưa kiểm tra live DB.

---

## 6. Joint holders

Joint holder được biểu diễn qua `UB_CustomerPlan`, không phải một bảng `tPlanJoint` đã xác nhận.

| C# method | Stored procedure | Ghi chú |
|---|---|---|
| `Plan.UpdatePlanJointList()` | `UBPlanInfoJointList` | Tên method có “Update” nhưng flow quan sát được là đọc/build list |
| `Plan.OnSwapJointRole()` | `UBPlanJointSwapRole` | Đổi primary/secondary; không có method `PlanJointSwapRole()` |

Popup removal còn gọi `UBPlanNewJointInfoRemove` trực tiếp cho staged/new joint information.

---

## 7. RRIF

| C# method thực tế trong `RRIFSetting.cs` | Stored procedure |
|---|---|
| `RRIFSetting.PlanRRIFFundList()` | `UBRRIFSettingFundList` |
| `RRIFSetting.PlanRRIFInfo()` | `UBRRIFSettingInfo` |
| `RRIFSetting.PlanRRIFSettingUpdate()` | `UBRRIFSettingSave` |
| `RRIFSetting.RedemptionScheduleSearch()` | `UBRRIFRedemptionList` |
| `RRIFSetting.GetPlanMaxMin()` | `UBRRIFYOBPlan` |

`GetPlanMaxMin()`/`UBRRIFYOBPlan` nhận nhiều input ngoài year of birth, gồm amount/frequency, spouse DOB, withholding/transfer và các option khác. Không mô tả method này là “chỉ tính minimum theo tuổi”; formula thực nằm trong database và chưa được chứng nhận với live lookup/configuration.

UI liên quan: `RRIFView.aspx`, `RRIFRedemptionView.aspx`, `PanelRRIFPayment.aspx`.

---

## 8. RESP

Các contract đã xác nhận:

| Method/object | Database/export behavior |
|---|---|
| `bRESPSiblingFlag` | Được lưu/update; exact grant-sharing semantics chưa chứng minh từ flag |
| `Plan.RESPBenNewContributionList()` | Gọi `UBBenNewContributionList` |
| `Plan.PlanRESPSummaryOneBen()` | Gọi `UBRESPSummaryOneBen` |
| `libs/UBExport/RESP_File.cs` | Header có độ dài riêng; các data record được pad fixed-width 500 ký tự |
| `UBRESPBatchFileContentSave` | Có caller lưu file content; không tìm thấy checked-in procedure body |

Bản cũ mô tả `UBRESPBatchFileContentSave` là lưu “CRA XML”. Source exporter đã đọc tạo header không pad và các data record fixed-width 500 ký tự, nên không thể mô tả toàn bộ file là XML hoặc mọi record đều dài 500 ký tự. CESG/CLB rate, annual cap và income eligibility không được xác minh từ code/SQL đã audit; đây là policy bên ngoài và cần nguồn regulator có effective date.

UI chính: `RESPView.aspx`.

---

## 9. TFSA/successor export

Project `libs/UBExport/UBExport.csproj` compile `TFSAXML.cs`; file này định nghĩa `UBExport.CXMLTFSA`. Không tìm thấy reference `T1028` trong source đã audit, nên không gắn exporter với form/report đó nếu chưa có bằng chứng bổ sung.

| Type/file thực tế | Vai trò quan sát được |
|---|---|
| `UBClass.CTFSA` trong `libs/UBClasses/TFSA.cs` | Quản lý pending/approved items và file-related operations |
| `UBExport.CXMLTFSA` trong `libs/UBExport/TFSAXML.cs` | Xây dựng object cho TFSA XML export |

Các successor/deceased fields được truyền trong Plan add/update, nhưng UI cũng bật workflow này cho một số RIF-like type. Vì vậy không nên mô tả chúng tuyệt đối là physical “TFSA-only columns” khi chưa có base DDL và lookup data.

---

## 10. Payment/redemption và schedule

| C# method thực tế | Stored procedure | Vai trò quan sát được |
|---|---|---|
| `Plan.PlanPYMTAdd()` | `UBPlanRedemptionAdd` | Thêm plan payment/redemption setup |
| `Plan.PlanPYMTHistorySet()` | `UBPlanRedemptionList` | Lấy history/list |
| `Plan.SysPlanTrxGenerateOne()` | `UBScheduleGenerateOneUI` | Generate một scheduled system-plan transaction |

Không có các method `AddRedemption()`, `GetRedemptionList()` hoặc `GenerateSchedule()` trong `Plan` snapshot đã audit. Ba mapping trên cũng không đủ để kết luận toàn bộ PAC và SWP dùng chung một flow.

---

## 11. Move, client-plan refresh và SysPlan

| C# method thực tế | Stored procedure | Ý nghĩa đúng theo caller/SP evidence |
|---|---|---|
| `Plan.GetClientPlanAccountSet()` | `UBMergeClientInfo` | Load/refresh client-plan-account data; không phải một merge mutation đã chứng minh |
| `Plan.MovePlan()` | `UBPlanMove2AnotherClientID` | Move Plan sang client khác |
| `Plan.MoveFundAccount()` | `UBFundAccountMoveFromPlan2Plan` | Move toàn bộ Fund Account hoặc một Fund Account Position giữa Plans, tùy `bOnePositionOnly` |
| `Plan.SysPlanListOnePlan()` | `UBSysPlanList` | Lấy SysPlan cho một Plan |

`Plan.SysPlanList()` dùng `UBPlanSysSearch`, không phải `UBSysPlanList`. Ý nghĩa “SysPlan = internal dealer account” chưa được chứng minh là database invariant nên không dùng làm định nghĩa.

---

## 12. UI entry points

| Page/source | Vai trò |
|---|---|
| `Main/Client.aspx.cs` | Host client-level Add/Edit/Delete Plan, authorization và selected-plan context |
| `Main/PopupPlanAdd.aspx.cs` | Add/Edit Plan validation và save orchestration |
| `Main/PlanView.aspx.cs` | Search/report hub nhiều tab; không phải sole CRUD owner |
| `Main/AccountView.aspx.cs` | Account/position search và resolve ngược về Plan/Client |
| `Main/PanelPlanBenAdd.aspx.cs` | Add/Edit beneficiary và per-item allocation validation |
| `Main/RESPView.aspx.cs` | RESP operations |
| `Main/RRIFView.aspx.cs` | RRIF view |
| `Main/RRIFRedemptionView.aspx.cs` | RRIF redemption view |
| `Main/PanelRRIFPayment.aspx.cs` | RRIF payment processing |
| `Main/SysPlanView.aspx.cs` | SysPlan view |

Không lưu kích thước file trong guide vì có nhiều source tree song song và size thay đổi không phản ánh contract.

---

## 13. BLL/export/report types

| Type thực tế | File | Vai trò |
|---|---|---|
| `UBClass.Plan` | `libs/UBClasses/Plan.cs` | Plan CRUD, search, beneficiary, joint, payment, move và SysPlan wrappers |
| `UBClass.RRIFSetting` | `libs/UBClasses/RRIFSetting.cs` | RRIF setting/fund/redemption/max-min wrappers |
| `UBClass.CTFSA` | `libs/UBClasses/TFSA.cs` | TFSA workflow/data operations |
| `UBExport.CXMLTFSA` | `libs/UBExport/TFSAXML.cs` | TFSA XML object generation; đây là file được `UBExport.csproj` compile |
| `VieFUNDPdf.CReport` | `libs/VieFUNDPdf/AccountSummary.cs` | Account summary report/PDF implementation; không có class tên `AccountSummary` trong file |

---

## 14. Stored procedure evidence

Các procedure sau có body trong `src/SQLScript/000_4_CreateSP.sql`:

| Nhóm | Procedures |
|---|---|
| Plan CRUD/info | `UBPlanAdd`, `UBPlanUpdate`, `UBPlanDelete`, `UBPlanInfo2`, `UBPlanInfo4Header`, `UBPlanInfoType`, `UBPlanTypeInfo` |
| Search | `UBPlanViewSearch`, `UBPlanViewSearchLoad` |
| Beneficiary/RESP | `UBBenItemInfo4RESP`, `UBBenNewContributionList`, `UBPlanBenConList`, `UBPlanInfoBenList`, `UBPlanInfoBenListShort`, `UBRESPSummaryOneBen` |
| Joint | `UBPlanInfoJointList`, `UBPlanJointSwapRole` |
| RRIF | `UBRRIFRedemptionList`, `UBRRIFSettingFundList`, `UBRRIFSettingInfo`, `UBRRIFSettingSave`, `UBRRIFYOBPlan` |
| Payment/schedule | `UBPlanRedemptionAdd`, `UBPlanRedemptionList`, `UBScheduleGenerateOneUI` |
| Compliance | `UBCompAccountOpeningList`, `UBCompAccountKYCUpdateList`, `UBCompMissingKYCList` |
| Move/client data | `UBPlanMove2AnotherClientID`, `UBMergeClientInfo`, `UBFundAccountMoveFromPlan2Plan` |
| SysPlan | `UBSysPlanList`, `UBSysPlanDelete`, `UBSysPlanTrxList` |

Evidence yếu hơn:

- `UBRESPBatchFileContentSave`: có C# caller; không tìm thấy checked-in procedure definition.

Procedure snapshot dùng `USE [VieFUND]`, có branch theo `DSID`/dealer và repository có `CreateSynonymsForTargetDatabase()` để tạo synonym động sang target database. Object resolution và hành vi có thể khác giữa environment.

---

## 15. Database verification còn cần trên live environment

Trước khi coi guide là schema contract, cần chạy read-only catalog checks trên đúng database/DSID để xác nhận:

1. object type/schema và definition hiện hành của toàn bộ SP trên;
2. base columns, PK/FK/index/check/default của `UB_Plan`, account/position, beneficiary, customer-plan và RRIF tables;
3. trigger/cascade thực sự chạy khi delete Plan;
4. lookup rows cho account type, designation, status, beneficiary/record type;
5. synonym targets và cross-database dependencies;
6. sự tồn tại/body trên live DB của `UBRESPBatchFileContentSave`;
7. deployed source/database version có khớp SQL snapshot trong repository hay không.

Cho đến khi có kết quả trên, các relationship trong guide là **code/SQL evidence**, không phải chứng nhận live schema.

---

## 16. Cross-references

| Tài liệu | Liên quan |
|---|---|
| [Domain Glossary](../../getting-started/domain-glossary.md) | Thuật ngữ RRSP, TFSA, RESP, RRIF, LIF, PAC, SWP, KYC |
| [Client & KYC](../client-kyc/module-guide.md) | Client/KYC và liên kết Plan |
| [Trading & Orders](../trading-orders/module-guide.md) | Order/transaction linkage với Plan/account/position |
| [Commission & Fee](../commission-fee/module-guide.md) | Fee/model fields và AUA-related flows |
| [Fund & GIC](../fund-gic/module-guide.md) | Fund Account, Position, Cash và GIC |
| [System Map](../../getting-started/system-map.md) | Vị trí các module trong hệ thống |
