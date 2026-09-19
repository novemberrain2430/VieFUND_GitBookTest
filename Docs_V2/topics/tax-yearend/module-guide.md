# Tax & Year-End — Module Guide

> Mục tiêu: giúp developer lần theo nghiệp vụ cuối năm từ WebForms đến BLL, stored procedure, bảng dữ liệu, Windows worker và file đầu ra.
>
> Phạm vi audit: source C# và SQL **đang có trong workspace**. Không có kết nối tới database đang deploy/production. SQL snapshot hiện nằm tại `MyPortfolioNew/VieFUND-Platform/src/SQLScript`; repo không có DDL Tax/Year-End đầy đủ để xác minh PK/FK/index hoặc schema production.

## 1. Kết luận nhanh

Tax & Year-End không phải một job duy nhất. Đây là một workbench chứa 18 loại báo cáo, dùng chung mô hình xử lý nhưng mỗi loại có bảng và stored procedure riêng:

```text
Giao dịch/plan/client
  → Pending: chọn nguồn và tạo slip/receipt
  → Approved: rà soát, sửa, trả về Pending, cancel hoặc release cho client
  → Create XML: WebForms lưu T619; SQL tạo request/item và đánh dấu slip In progress
  → VieFUND File Export Service: poll queue, sinh XML, ZIP và gọi UBExportSet
  → File: download, đánh dấu Filed/Submitted và lưu confirmation
```

Ba trục trạng thái thường gặp phải được hiểu riêng:

1. `iStatus` của slip: vòng đời electronic filing (`Pending`, `In progress`, `Filed`, `Submitted`).
2. `iApproved`: cờ release/hiển thị cho client.
3. `rpt_tcd` hoặc `slip_type_code`: `O` (Original), `A` (Amended), `C` (Cancelled).

Đây không phải schema chung bắt buộc cho mọi form. RRSP XML slip, TFSA Ident, T550 và P18/P19 thiếu một hoặc nhiều trục trên; P18/P19 dùng `RefDocID`/`RefDocIDOld` thay cho lineage kiểu `iOrgID`. Ngoài ra, `UB_ExportRequest.iStatus` và `iSubmissionStatus` theo dõi request/file, không đồng nghĩa với `iStatus` của slip.

## 2. Điểm vào và phạm vi thực tế

- `WebApp/Js/UBMenuContent_EN.js` và `UBMenuContent_FR.js` đăng ký menu Year-End khi quyền `YearEndReport` là 1 hoặc 2.
- Menu gọi callback `OnYearEndReport()` trong `WebApp/Js/MenuFunctions.js`; callback mở trang `YearEnd`.
- `WebApp/Main/YearEnd.aspx` có đúng 18 option. RRSP được include trong nested view riêng; 17 fragment còn lại được include ở outer `MultiView`.
- `WebApp/Main/YearEnd.aspx.cs` nạp tax year, intermediary và chuyển report type sang đúng view.
- Các file có hậu tố `_Old`, `_TBD`, `.bak` không được dùng làm bằng chứng cho luồng active, trừ khi tài liệu ghi rõ đó là code chết hoặc code chưa wiring.

### 2.1. Ma trận 18 loại báo cáo

| UI ID | Báo cáo | View | Export type | Nhóm XML | Lưu trữ chính đã xác minh trong schema inventory/SP |
|---:|---|---:|---:|---|---|
| 0 | RRSP tax receipt/XML | 0 | 22 | CRA | `UB_RRSP_SLP`, `UB_RRSP_SLP_ARC`, `UB_RRSP_TRX`; receipt active dùng `UB_RRSPTaxReceipt`, `UB_RRSPTaxReceiptTrx` |
| 1 | T4A | 1 | 30 | CRA | `UB_T4A`, `UB_T4A_SLP`, `UB_T4A_SLP_ARC`, `UB_T4A_TRX` |
| 2 | T5 | 2 | 35 | CRA | `UB_T5_SLP`, `UB_T5_SLP_ARC`, `UB_T5_TRX`, `UB_T5_Omnibus`, `UB_T5_PlanFund` |
| 3 | T3 | 3 | 26 | CRA | `UB_T3_SLP`, `UB_T3_SLP_ARC`, `UB_T3_TRX`, `UB_T3_Omnibus`, `UB_T3_PlanFund` |
| 5 | TFSA | 5 | 21 | CRA | `UB_TFSA`, `UB_TFSA_Ident`, `UB_TFSA_Ident_ARC`, `UB_TFSA_Trans`, `UB_TFSA_Trans_ARC` |
| 6 | T4RSP | 6 | 23 | CRA | `UB_T4RSP`, `UB_T4RSP_SLP`, `UB_T4RSP_SLP_ARC`, `UB_T4RSP_TRX` |
| 8 | T4RIF | 8 | 24 | CRA | `UB_T4RIF`, `UB_T4RIF_SLP`, `UB_T4RIF_SLP_ARC`, `UB_T4RIF_TRX`, `UB_T4RIFObj` |
| 10 | T5008 | 10 | 27 | CRA | `UB_T5008`, `UB_T5008_SLP`, `UB_T5008_SLP_ARC`, `UB_T5008_TRX`, `UB_T5008Obj` |
| 11 | T550 | 11 | 20 | CRA | `UB_T550`, `UB_T550_ARC` |
| 12 | Part XVIII (P18) | 12 | 28 | CRA/FATCA | `UB_P18_SLP`, `UB_P18_SLP_ARC`, `UB_P18_Summary`, `UB_P18AcctHolder`, `UB_P18ControllingPerson` |
| 13 | Part XIX (P19) | 13 | 29 | CRA/CRS | `UB_P19_SLP`, `UB_P19_SLP_ARC`, `UB_P19_Summary`, `UB_P19AcctHolder`, `UB_P19ControllingPerson` |
| 14 | NR4 | 14 | 25 | CRA | `UB_NR4_SLP`, `UB_NR4_SLP_ARC`, `UB_NR4_TRX` |
| 31 | Relevé 1 | 7 | 31 | Québec | `UB_Releve1`, `UB_RL1_SLP`, `UB_RL1_SLP_ARC`, `UB_RL1_TRX` |
| 32 | Relevé 2 | 9 | 32 | Québec | `UB_RL2`, `UB_RL2_SLP`, `UB_RL2_SLP_ARC`, `UB_RL2_TRX`, `UB_RL2Obj` |
| 33 | Relevé 16 | 4 | 33 | Québec | `UB_RL16_SLP`, `UB_RL16_SLP_ARC`, `UB_RL16_TRX` |
| 34 | Relevé 18 | 16 | 34 | Québec | `UB_RL18_SLP`, `UB_RL18_SLP_ARC`, `UB_RL18_TRX` |
| 36 | Relevé 3 | 15 | 36 | Québec | `UB_RL3_SLP`, `UB_RL3_SLP_ARC`, `UB_RL3_TRX` |
| 37 | T4FHSA | 17 | 37 | CRA | `UB_T4FHSA_SLP`, `UB_T4FHSA_SLP_ARC`, `UB_T4FHSA_TRX`, `UB_T4FHSA_TRX_ARC` |

Nguồn mapping: `YearEnd.aspx`, `YearEnd.aspx.cs::GetViewIndex`, `UBT619InfoUpdate`, `UBCRASubmissionUpdate`, `DLLs/UBExport/CRASubmission.cs` và `DLLs/UBExport/CReleve.cs`.

Tên trong bảng là exact name thay vì shorthand. Ví dụ object table là `UB_T5008Obj`/`UB_RL2Obj`, còn account-holder table là `UB_P18AcctHolder`/`UB_P19AcctHolder`, không có underscore trước `Obj` hoặc `AcctHolder`.

## 3. Điều khiển màn hình

### 3.1. Tax year

`Page_Load` gọi `CBase.LoadSimpleDropDownListArray(..., "UBYearEndComboList")`. C# tính `LastYear = currentYear - 1` và từ tháng 11 (`Month > 10`) đổi thành năm hiện tại, rồi explicit-select giá trị này cho phần lớn dropdown.

Các ngoại lệ quan trọng:

- T550, P18 và P19 không được C# explicit-select theo rule tháng 11; item đầu do SP trả quyết định default.
- `UBYearEndComboList` tạo dải năm từ 2017 đến năm hiện tại; DSID 1274/1256 bắt đầu từ 2020.
- P18/P19 nhận **toàn bộ các năm `<= iLastYear`**, không phải chỉ một năm. `iLastYear` là năm trước trong tháng 1–4 và là năm hiện tại từ tháng 5.
- T550 trả danh sách giảm dần nên item đầu thường là năm mới nhất trong tập DB.

Hệ quả: “năm C# chọn trên trang” và “tập năm DB cho phép” là hai rule khác nhau. Khi dropdown rỗng/sai năm phải kiểm tra cả code-behind, thứ tự result set và `UBYearEndComboList`.

### 3.2. Tabs và thao tác

`OnReportTypeChanged` chọn view và cấu hình tab theo report type:

- Phần lớn có `Pending`, `Approved`, `File`.
- RRSP có 5 tab hiển thị: hai tab receipt (`Pending`, `Tax Receipts`) và ba tab CRA (`CRA Pending`, `CRA RRSP Slips`, `CRA RRSP XML Files`). State nội bộ tương ứng gồm `Pending`, `Approve`, `PendingXML`, `ApproveXML`, `File`.
- T3/T5 có tab `Omnibus`.
- T550 có đủ Pending/Approved/XML Files trong markup; đổi report type luôn reset về Pending.

Intermediary được nạp qua `Intermediary.UpdateDropDownList` cho các form có filter này; T550 còn thêm item `All/Tout`. `Page_Load` gọi `CBase.IsPageValid`, nhưng quyền chi tiết còn nằm ở UI, BLL, SP helper và có thể cả DB grants. Không suy ra rằng qua được page validation là có mọi quyền.

## 4. Luồng Pending → tạo slip

Các BLL như `CT3`, `CT4A`, `CT4RSP`, `CT4RIF`, `CT5`, `CT5008`, `CNR4`, `CRL*`, `CP18`, `CP19` có cùng **nhóm capability**, nhưng tên method C# không thống nhất. Wrapper thường map tới SP suffix:

- `*PendingList`, `*PendingSelectionUpdate`, `*ProcessPendingTaggedItems`, `*ProcessOneItem`.
- `*ApprovedList`, `*ApprovedSelectionUpdate`, `*ItemInfo`, `*ItemInfoUpdate`, `*ScanAll`.
- `*Approve2Pending`, `*CancelItem`, `*SlipRelease`, `*FileList` tùy report.

Ví dụ `CT4RSP.SelectionUpdate` gọi `UBT4RSPPendingSelectionUpdate`; `ProcessPendingItems` gọi `UBT4RSPProcessPendingTaggedItems`; `GetItemInfo`/`SetItemInfo` gọi `UBT4RSPItemInfo`/`UBT4RSPItemInfoUpdate`. Không nên dùng tên SP như thể đó luôn là tên method C#.

Các lựa chọn Pending/Approved được SP lưu trong bảng dạng `UB_<Type>PendingSelectionTMP` và `UB_<Type>ApprovedSelectionTMP`. Normal CRUD/list/batch filter theo `iUserID`, nên checkbox không chỉ nằm trong browser session. Tuy nhiên một số cleanup/cancel/remap update hoặc delete theo item `ID` mà không filter user; không được mô tả isolation theo user là tuyệt đối.

### 4.1. Ví dụ đã truy vết: T4RSP

Luồng active là:

```text
YearEnd_T4RSP.aspx.cs
  → CT4RSP.ProcessPendingItems
  → UBT4RSPProcessPendingTaggedItems
  → đọc UB_T4RSPPendingSelectionTMP theo iUserID
  → gọi UBT4RSPProcessOneItem cho từng item
```

Rule đã xác minh trong `UBT4RSPProcessOneItem` gồm:

- Không cho tax year tương lai; nếu là tax year hiện tại thì plan active không được xử lý.
- Yêu cầu nominee plan và client/plan hợp lệ.
- SIN phải có đúng 9 ký tự.
- Phải resolve được address record và postal code phải qua `IsPostalCodeOK`; SP không có một check tương đương buộc mọi address text field đều non-empty.
- Loại **transaction ID** đã nằm trên slip cùng plan/year có `rpt_tcd <> 'C'`.
- Quy đổi amount sang CAD bằng `GetTrustAmountCAD`.
- Tính gross/net, federal/provincial withholding, taxable amount, excess, HBP, LLP, marriage breakdown, ALDA và các box death/estate.
- Xử lý thêm grouping/in-kind transfer, return of premium, spouse/contributor, estate recipient, loại NR4 tax code, duplicate race check và chuyển `O → A` theo submitted/in-progress archive trước đó.

Đây là rule riêng của T4RSP. Không mặc định form khác có cùng eligibility hoặc cách tính; phải đọc `ProcessOneItem` tương ứng.

### 4.2. TFSA không chạy background thread trong luồng active

`DLLs/UBClasses/TFSAProcessing.cs` vẫn compile class thread xử lý batch 5, callback, `Abort` và `UBYearEndTagList`. Tuy nhiên block khởi tạo class này trong `YearEnd_TFSA.aspx.cs` bị comment. Handler active gọi đồng bộ `CTFSA.ProcessPendingItems`.

## 5. Approved, sửa, cancel và release

Từ Approved, tùy report, user có thể mở item, sửa dữ liệu, đưa về Pending, cancel hoặc release.

### 5.1. Release cho client khác với filing

`UBT4RSPSlipRelease` cho thấy `iApproved` là cờ phát hành:

- Release chọn dòng `iApproved = 0`, có object data và không ở trạng thái no-transaction; sau đó ghi `iApproved = 1`, ngày và user.
- Với electronic delivery, SP gọi `UBNotifyInternal` message type 13. Nếu không bypass notification, row chỉ được approve sau khi notification tạo thành công.
- Option no-notification bypass notify và approve trực tiếp. Delivery field được chọn theo dealer configuration, không phải một field cố định.
- Unrelease chỉ đặt `iApproved = 0`; snapshot không clear `dtApproved`, `iApprovedUserID` và không thu hồi notification đã tạo.

Do đó release cho client độc lập với trạng thái electronic filing Submitted.

### 5.2. Original/Amended/Cancelled

`GetCRASubmissionType` ánh xạ `O/A/C`. `UBT4RSPCancelItem` chỉ nhận slip Submitted (`iStatus = 4`), clone thành slip current mới `iStatus = 1`, `rpt_tcd = 'C'`, giữ `iOrgID`/original type, copy transaction mapping, xóa current row cũ và remap selection ID.

Đây là bằng chứng cụ thể của T4RSP; kiểm tra SP của form tương ứng trước khi áp cùng cách xử lý.

## 6. Create XML và hàng đợi export

Nút “Create XML” chỉ mở `PanelT619`; Web request không serialize XML.

Ranh giới trách nhiệm chính xác:

1. `PanelT619.aspx.cs::SaveT619` normalize report name, lấy dealer/intermediary/tax year, validate UI và gọi `CT619.UpdateInfo`. `iOptions = 1` là create; `iOptions = 2` là save-only.
2. `CT619.UpdateInfo` bind parameter và gọi `UBT619InfoUpdate`.
3. `UBT619InfoUpdate` validate lại và update singleton-style `UB_T619TRM` (câu `UPDATE` không có `WHERE`).
4. Save-only dừng sau khi lưu toàn bộ metadata T619/filer/specimen/Relevé, không tạo request.
5. Create mode map report sang type 20–37, đếm `ApprovedSelectionTMP` theo user, gọi `UBExportAddRequestT`, insert `UB_ExportRequestItem` và chuyển **current slip** sang `iStatus = 2`.

`UBExportAddRequestT` chỉ tạo request header; item rows và slip transition do `UBT619InfoUpdate` thực hiện. Tax request yêu cầu `GetUserPermission(user, '', 'EXPORT') <> 0` và `IsMemberAdmin(user) = 1`. Request mới có `iStatus = 0`, `iSubmissionStatus = 1`.

Return code đáng chú ý:

- 3–7: lỗi validation transmitter/contact trong SP.
- 10: không có Approved selection của user.
- 23–25: `20 +` lỗi 3–5 từ `UBExportAddRequestT`; code lớn hơn 20 không nên được mô tả chung là chỉ lỗi permission.

Các mutation metadata → request → item → slip không nằm trong transaction/`TRY...CATCH` trong snapshot.

### 6.1. Serializer và Windows worker

Serializer đã xác minh:

- `DLLs/UBExport/CRASubmission.cs` tạo `<Submission>`, `<T619>`, `<Return>` và dispatch type 20–30, 35, 37. T550 là phần tử trực tiếp dưới `<Submission>`.
- `DLLs/UBExport/CReleve.cs` tạo `<Transmission>` và dispatch 31 (RL1), 32 (RL2), 33 (RL16), 34 (RL18), 36 (RL3).
- P18/P19 có cấu trúc `<Submission><Return><PartXVIII|PartXIX>...`; slip/summary là `PartXVIIISlip`/`PartXVIIISummary` và `PartXIXSlip`/`PartXIXSummary`.

Call site/host **có trong source** tại `Services/VieFUNDExport`:

1. `Program.Main` chạy Windows Service tên `VieFUND File Export Service`.
2. Timer poll type 20–40. `UBExportGet` lấy request pending, đặt request In progress và trả `ExportParams` cùng dataset.
3. Worker gọi `CRASubmission.GetXML()` cho CRA hoặc `CReleveXML.GetXML()` cho Québec.
4. CRA được ghi UTF-8 không BOM; Relevé được ghi ISO-8859-1; worker ZIP file.
5. Worker gọi `UBExportSet` với request status 2 khi thành công hoặc 3 khi lỗi.

Giới hạn deployment còn lại:

- Service project reference binary `WebApp/bin/UBExport.dll`, không project-reference trực tiếp `DLLs/UBExport`.
- Hai source copy `CReleve.cs` đang lệch schema version (`2025.1` ở `DLLs`, `2024.1` ở mirror MyPortfolioNew).
- Static source chứng minh host/call flow, nhưng không chứng minh service đang installed/running hoặc deployed `UBExport.dll` khớp source copy nào.

### 6.2. Hoàn tất, download và remove

`UBExportSet` luôn update request header (`iStatus`, stored filename, `dtCompleted`). Với type 20–35, SP update **current slip** có `iStatus < 3` sang 3 và gắn `iFileID = requestID`. Snapshot có lỗi range 36/37 nêu ở mục 10.

`UBExportInfo` dựng `FullFileName` từ setting `EXPORT_FILE_PATH` cộng basename của stored filename. `YearEnd.aspx.cs` chỉ download khi:

- request `iStatus == 2`;
- `FullFileName` không rỗng;
- `File.Exists(FullFileName)` trả true.

Display `FileName` không phải field được dùng cho existence check. Response dùng `application/x-zip-compressed`. Không tìm thấy code ghi `dtDownloaded` sau download.

`UBCRAFileList` silent-return nếu `IsMemberAdmin(iUserID) != 1`. Helper này còn coi dealer member tại DSID 2262 là admin theo rule riêng.

Tax remove (`UBExportRemove`, type 20–37):

- Mặc định chỉ cho request ready (`iStatus = 2`) và từ chối `iSubmissionStatus = 4`; `bForce` bypass hai guard.
- Reset current slip về `iStatus = 1`; P18/P19 còn clear `iSummaryID`.
- Không reset archive, không clear current `iFileID`, không xóa physical ZIP.
- Hard-delete `UB_ExportRequestItem` và `UB_ExportRequest`.
- Không có user/admin guard riêng hoặc transaction trong thân SP.

### 6.3. Filed/Submitted

`CT619.SubmissionUpdate` gọi `UBCRASubmissionUpdate`. SP yêu cầu request header `iStatus = 2`:

- `iSubmitted = 0`: target `iSubmissionStatus = 3` (Filed/not submitted).
- `iSubmitted = 1`: target 4, bắt buộc ngày hợp lệ/không tương lai và confirmation number.
- Chuyển 4 → 3 clear submission date và confirmation.
- Khi target khác status cũ, update `iStatus` ở cả current và archive cho type 20–37.

Return code: 4 future date, 5 invalid/missing date, 6 missing confirmation, 7 request chưa ready. Các input `DSID`, `iUserID`, `bForced` không được dùng làm permission/force guard trong thân SP; missing file ID có thể rơi qua và trả success 0.

| Hàm | Mapping trong SQL snapshot |
|---|---|
| `GetCRASubmissionStatus` | 0 Deleted, 1 Pending, 2 In progress, 3 Filed, 4 Submitted |
| `GetCRAFileSubmissionStatus` | 0 Deleted, 1 Pending, 2 Ready, 4 Submitted; thiếu 3 nên trả `Unknown` |

## 7. PDF, receipt và CSV mở bằng Excel

`WebApp/Main/PdfView.aspx.cs` có các route active:

| Report no. | Output |
|---:|---|
| 45 | RRSP receipt (`CRRSPReceipt`) |
| 70/71 | T4A detail/summary |
| 72/73 | Relevé 1 detail/summary |
| 74 | T4RSP |
| 75 | T4RIF |
| 76 | Relevé 2 |
| 77 | T5008 |
| 79 | NR4 |
| 80 | T3 |
| 81 | Relevé 16 |
| 82 | T5 |
| 83 | Relevé 3 |
| 84 | Relevé 18 |
| 85 | T4FHSA |

TFSA, T550, P18 và P19 không có control PDF active trong markup. P18/P19/TFSA còn protected method copy/paste trỏ report 79 (NR4), nhưng không có markup/call site wiring.

Các nút “Excel” ở Pending/Approved không serialize grid đang render. BLL re-query list với filter hiện tại và `CBase.TextToExcel` xuất CSV để mở bằng Excel. Đây là luồng riêng, không tạo CRA/Revenu Québec XML.

## 8. Bản đồ dữ liệu và giới hạn schema

| Nhóm | Bảng/đối tượng chính | Vai trò/caveat |
|---|---|---|
| Current filing row | `UB_<Type>_SLP`; TFSA dùng `UB_TFSA_Ident`, T550 dùng `UB_T550` | Snapshot đang xử lý; không phải form nào cũng có `iApproved` hoặc O/A/C |
| Archive | `*_SLP_ARC`, `*_ARC`; TFSA/T4FHSA có transaction archive | Lưu version/history |
| Transaction mapping | `*_TRX`; TFSA dùng `UB_TFSA_Trans` | Link logical tới giao dịch/PlanFund; T550/P18/P19 không dùng TRX cùng kiểu |
| Selection | `*PendingSelectionTMP`, `*ApprovedSelectionTMP`; còn có `*ListTMP` | Persist tag theo user trong normal path; DDL/key không có trong repo |
| T619 | `UB_T619TRM`, `UB_T619Contact` | Active update path đã trace ghi `UB_T619TRM`; chưa chứng minh active writer cho `UB_T619Contact` |
| Export queue | `UB_ExportRequest`, `UB_ExportRequestItem` | Item chỉ có request ID + numeric item ID; report discriminator nằm ở header |
| RRSP receipt | `UB_RRSPTaxReceipt`, `UB_RRSPTaxReceiptTrx` | Active receipt storage; `UB_TaxReceipt` tồn tại nhưng vai trò active trong flow này chưa được chứng minh |
| P18/P19 | Summary, Slip, AcctHolder, ControllingPerson | `iSummaryID`, `iSlipID` và polymorphic `iType + iLinkedID`; amendment dùng `RefDocID*` |
| Omnibus | `UB_T3_Omnibus`, `UB_T5_Omnibus`, `UB_T3_PlanFund`, `UB_T5_PlanFund` | RL16 dùng logical source `UB_T3_PlanFund`; RL3 dùng `UB_T5_PlanFund` |

Bảng phụ đáng biết gồm `UB_T4AAction`, `UB_T4ADetail`, `UB_T4RSPAction`, `UB_T4RIFAction`, `UB_T4RIFObj`, `UB_T5008Obj`, `UB_RL1Action`, `UB_RL2Obj`, `UB_RRSPDeadLine`.

### 8.1. Database evidence có gì và thiếu gì

- `Docs_V2/Database/Table_Description.md` là generated inventory từ `Tables.sql`, nhưng `Tables.sql` không có trong workspace.
- Không tìm thấy `CREATE TABLE`/`ALTER TABLE` cho các bảng Tax/Year-End trong SQL tracked.
- Selection/list TMP tables chỉ được SP tham chiếu; chúng không có entry trong table inventory.
- Không thể xác minh PK/FK/index, uniqueness `(iUserID, ID)`, cascade hoặc migration history từ checkout này.
- Vì vậy tên bảng/column và relationship trong guide là **source/SP/schema-inventory evidence**, không phải chứng nhận DDL hay production schema.

## 9. Các stored procedure/UDF cần biết

Theo report thường có:

- `*PendingList`, `*PendingSelectionUpdate`, `*ProcessPendingTaggedItems`, `*ProcessOneItem`.
- `*ApprovedList`, `*ApprovedSelectionUpdate`, `*ItemInfo`, `*ItemInfoUpdate`.
- `*Approve2Pending`, `*CancelItem`, `*SlipRelease`, `*ScanAll`.
- `*FileList`, `*FileDetailList`; T3/T5 còn có `*Omnibus*`.

Dùng chung:

- Tax year/T619: `UBYearEndComboList`, `UBT619InfoUpdate`.
- Queue: `UBExportAddRequestT`, `UBExportGet`, `UBExportSet`, `UBExportInfo`, `UBExportRemove`.
- File/submission: `UBCRAFileList`, `UBCRASubmissionUpdate`.
- UDF: `GetCRASubmissionType`, `GetCRASubmissionStatus`, `GetCRAFileSubmissionStatus`, `GetUserPermission`, `IsMemberAdmin`.

Version-controlled definitions nằm trong:

- `MyPortfolioNew/VieFUND-Platform/src/SQLScript/000_4_CreateSP.sql`.
- `MyPortfolioNew/VieFUND-Platform/src/SQLScript/000_3_CreateUDF.sql`.

## 10. Phát hiện đã xác minh cần xử lý

Tất cả finding dưới đây áp dụng cho snapshot trong repo; phải query đúng environment trước khi sửa production.

### 10.1. `UBExportSet` không thể chạy nhánh export type 36–37 và không xét status thành công khi update slip

Outer condition của `UBExportSet` chỉ nhận export type 20–35, nhưng bên trong có branch 36 (RL3) và 37 (T4FHSA). Active create path có thể tạo request type 36/37 và chuyển current slip sang status 2; worker cũng có dispatch cho cả hai type. Khi `UBExportSet` hoàn tất request, header có thể thành ready nhưng các branch current-slip 36/37 không chạy, nên slip còn status 2 và không có `iFileID`.

Ngoài ra, với type 20–35, side effect slip luôn set `iStatus = 3` dù caller truyền request status 3 để báo lỗi. Cần ràng buộc slip transition vào status thành công và mở đúng range 20–37.

### 10.2. Submission status 3 hiển thị `Unknown`

`UBCRASubmissionUpdate` ghi `iSubmissionStatus = 3` cho Filed. `GetCRAFileSubmissionStatus` chỉ map 0, 1, 2, 4; do đó `UBCRAFileList` hiển thị `Unknown`. Biến `iSubmissionFileStatus` 2/4 trong SP được set nhưng không dùng.

### 10.3. 22 BLL chứa 32 SP literal không có tracked SQL definition

Với canonical tree `DLLs/UBClasses` (không double-count mirror MyPortfolioNew), phép đo tái lập là:

- 22 BLL files;
- 294 unique static SP literals;
- 262 có `CREATE PROC/PROCEDURE` trong 16 SQL files tracked;
- 32 không có tracked definition:

```text
UBNR4ItemInfoUpdate, UBNR4PlanID,
UBP18ItemInfo, UBP18ItemInfoUpdate, UBP18MemberInfo, UBP18ScanAll,
UBP19ItemInfo, UBP19ItemInfoUpdate, UBP19MemberInfo, UBP19ScanAll,
UBRL1ScanAll, UBRL16ScanAll,
UBRL18ItemInfoUpdate, UBRL18ItemSetProcessed, UBRL18List, UBRL18SelectionUpdate,
UBRL2ScanAll, UBRL3ScanAll,
UBT3ScanAll, UBT4AScanAll,
UBT4FHSAItemInfoUpdate, UBT4FHSAList, UBT4FHSAPlanID, UBT4FHSAScanAll,
UBT4RIFList, UBT4RSPList, UBT5ScanAll, UBT5008ItemInfoUpdate,
UBTFSAItemInfoUpdate, UBTFSAList, UBTFSAMemberInfo,
UBYearEndTagList
```

Đây là lexical catalog, không phải reachability catalog. Một số literal nằm trong commented/dead/TBD flow (`UBRL18List`, `UBRL18SelectionUpdate`, `UBRL18ItemSetProcessed`, `UBTFSAList`, `UBT4RIFList`, `UBYearEndTagList`, ...); `UBRL18ItemInfoUpdate` vẫn có active occurrence. Kết luận đúng là source package và tracked SQL snapshot không đồng bộ, **không phải** production chắc chắn thiếu 32 SP.

### 10.4. Worker source đã có; deployment vẫn chưa được chứng minh

Assertion cũ “không tìm thấy generator host/call site” là sai. `Services/VieFUNDExport` có Windows Service gọi `UBExportGet`, hai serializer, ZIP và `UBExportSet`.

Khoảng trống thực tế là trạng thái install/running, service configuration, output permission và version của binary `WebApp/bin/UBExport.dll` ở từng environment.

### 10.5. `UBT619InfoUpdate` không persist P19 transmitter account

Trong `UPDATE UB_T619TRM`, snapshot viết:

```sql
@TransmitterAccountNumberP19 = @TransmitterAccountNumberP19
```

Target là parameter, không phải column `TransmitterAccountNumberP19`; assignment là no-op. Cần sửa target column sau khi xác minh deployed SP. Cùng proc update `UB_T619TRM` không có `WHERE`, nên phải xác nhận invariant singleton.

### 10.6. Remove để lại state/reference không nhất quán

Tax remove reset current slip `iStatus = 1` nhưng không clear `iFileID`; archive reset/delete bị comment; physical ZIP không bị xóa. Sau đó request/item bị hard-delete. Điều này có thể để lại reference tới request không còn tồn tại và archive ở status cũ.

### 10.7. Pipeline nhiều bảng không atomic; missing ID có thể trả success

`UBT619InfoUpdate`, `UBExportGet`, `UBExportSet`, `UBExportRemove` và `UBCRASubmissionUpdate` không có transaction/`TRY...CATCH` bao quanh transition nhiều bảng. Lỗi giữa chừng có thể để request, request item và slip lệch nhau.

`UBExportRemove` và `UBCRASubmissionUpdate` cũng có đường missing request/file ID rơi qua và trả 0. Cần explicit existence guard, idempotency rule và transaction boundary.

### 10.8. Authorization trong SP không đồng nhất

Create request kiểm `EXPORT` permission + `IsMemberAdmin`; file list kiểm admin. Nhưng `UBExportInfo`, tax branch của `UBExportRemove`, `UBCRASubmissionUpdate` và `UBExportSet` không có owner/admin guard trong thân proc; một số input user/DSID không được dùng.

Đây là finding ở procedure layer, chưa phải kết luận exploit: DB `EXECUTE` grants, service account và UI gate của environment chưa được audit. Cần xác minh cả các lớp đó trước khi thay đổi.

### 10.9. Selection cleanup/remap có thể chạm tag của user khác

Happy path filter selection theo `iUserID`, nhưng nhiều cleanup/delete/remap chỉ dùng item `ID`. Nếu nhiều user cùng tag một item, thao tác của một user có thể đổi/xóa selection row của user khác. Repo không có DDL để xác minh unique key hoặc isolation bổ sung.

### 10.10. Serializer/deployment có rủi ro version và empty output

- Serializer trả chuỗi rỗng khi type không hỗ trợ hoặc thiếu `T619TRM`; worker không check content length và bỏ qua return của một số hàm write trước khi ZIP.
- Relevé được write ISO-8859-1 trong khi đoạn replace XML declaration đang comment; cần kiểm file thực tế có declaration khớp encoding.
- `CReleve.cs` ở hai source tree lệch schema version 2025.1/2024.1; service dùng binary reference nên source tree không đủ xác định runtime version.

### 10.11. Hai lỗi nhỏ ở CSV/UI

- `YearEnd_T550.aspx.cs` đặt filename Approved export thành `TFSA`.
- `YearEnd_RRSP.aspx.cs` còn debug alert hiển thị `hdActionTypeTax.Value` trước khi export.

## 11. Cách debug một case Tax/Year-End

1. Xác định UI report ID, view index, export type và exact storage theo ma trận 2.1.
2. Xác định source tree/deployed version; không trộn root `DLLs` với mirror MyPortfolioNew.
3. Kiểm tra tax year/intermediary và selection row theo `iUserID`; lưu ý cleanup/remap cross-user.
4. Từ event handler lần sang đúng BLL method và `*ProcessPendingTaggedItems`/`*ProcessOneItem`.
5. Kiểm tra dữ liệu nguồn, eligibility, duplicate mapping, current/archive/TRX và ba status axis nếu form có chúng.
6. Create XML: kiểm `UB_T619TRM`, permission helpers, `UB_ExportRequest`, `UB_ExportRequestItem`, current slip status 2.
7. Request treo: kiểm Windows service `VieFUND File Export Service`, config/registry DB selection, event log, `UBExportGet`, output directory permission, serializer binary/version, ZIP và `UBExportSet`.
8. Với RL3/T4FHSA, kiểm riêng lỗi range 36/37 trong deployed `UBExportSet`.
9. Download: kiểm request status 2, `EXPORT_FILE_PATH`, basename, `FullFileName` và file vật lý.
10. Remove/submit: kiểm stale `iFileID`, archive status, date, confirmation, `iSubmissionStatus` và UDF display.
11. Nếu runtime báo thiếu SP/column, query metadata của đúng database environment; tracked SQL không phải deploy manifest.

## 12. Checklist khi bổ sung/sửa một report

- Cập nhật dropdown, `GetViewIndex` và menu permission nếu cần.
- Include đúng `YearEnd_<Type>.aspx`; wiring control/event trong code-behind.
- Bổ sung BLL capability và SP Pending/Approved/File/Release/Cancel theo nhu cầu.
- Cung cấp DDL/migration cho current, archive, transaction, selection/list TMP, key/index và rollback.
- Đồng bộ mapping type trong `UBT619InfoUpdate`, `UBExportGet`, `UBCRASubmissionUpdate`, `UBExportSet`, `UBExportRemove`.
- Bổ sung serializer dispatch, schema version, encoding và validation empty output.
- Cập nhật `Services/VieFUNDExport` dispatch/packaging; deploy đúng `UBExport.dll` và service config.
- Nếu có PDF, thêm route và xác nhận control thật sự active.
- Kiểm tra UDF status, permission ở UI/SP/DB grant, notification và ownership.
- Thiết kế transaction/idempotency cho mọi transition nhiều bảng.
- Test O/A/C; release/unrelease; create/remove; success/failure worker; ready/filed/submitted; concurrent users; missing ID; retry.

## 13. Thứ tự đọc source đề xuất

1. `WebApp/Main/YearEnd.aspx`, `YearEnd.aspx.cs` và `WebApp/Js/UBMenuContent_*.js`.
2. `WebApp/Main/YearEnd_<Type>.aspx(.cs)` của form cần điều tra.
3. BLL tương ứng trong `DLLs/UBClasses/<Type>.cs`.
4. `MyPortfolioNew/VieFUND-Platform/src/SQLScript/000_4_CreateSP.sql` và `000_3_CreateUDF.sql`.
5. `WebApp/Main/PanelT619.aspx.cs`, `DLLs/UBClasses/T619.cs`, `DLLs/UBClasses/Export.cs`.
6. `DLLs/UBExport/CRASubmission.cs` hoặc `DLLs/UBExport/CReleve.cs`, rồi serializer cụ thể.
7. `Services/VieFUNDExport/Program.cs`, `VieFUNDExport.cs` và `.csproj`.
8. `WebApp/Main/PdfView.aspx.cs` và `VieFUNDPdf/` nếu điều tra PDF.
9. `Docs_V2/Database/Table_Description.md` để tra column, với caveat không thay thế DDL/deployed schema.

## 14. Tài liệu liên quan

- [Domain Glossary](../../getting-started/domain-glossary.md)
- [Table Description](../../Database/Table_Description.md)
- [Database Access](../../viefund-framework/database-access.md)
- [PDF Workflow](../../viefund-framework/pdf/pdf-workflow.md)
- [SP Catalog](../../reference/sp-catalog/README.md)
