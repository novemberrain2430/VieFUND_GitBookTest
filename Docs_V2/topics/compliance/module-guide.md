# 06 — Compliance (Module Guide)

> Hướng dẫn nghiệp vụ và kỹ thuật cho kiểm soát suitability, phê duyệt tài khoản/KYC, giám sát xu hướng giao dịch và AML/FINTRAC.
> **Đối tượng**: Developer cần lần theo luồng từ màn hình Web Forms đến C# và stored procedure.

---

## 1. Phạm vi module

Compliance không phải một bước kiểm tra đơn lẻ. Trong VieFUND, module này gồm bốn nhóm nghiệp vụ có liên hệ nhưng vòng đời dữ liệu khác nhau:

1. **Trade suitability**: đánh giá giao dịch so với hồ sơ KYC, risk tolerance, investment objectives và các cờ giám sát.
2. **Account/KYC approval**: phê duyệt plan mới, account opening và thay đổi KYC qua tối đa hai cấp.
3. **Trend surveillance**: phát hiện mẫu giao dịch cần review như frequent trading, excessive commission, short-term, DSC/redemption fee, two-sided và switch khác load.
4. **AML/FINTRAC**: nạp danh sách theo dõi, so khớp tên khách hàng và xuất báo cáo rà soát.

Các phần KYP, document receipt, licensing và FundServ có giao điểm với Compliance nhưng vẫn là subsystem riêng. Guide này chỉ mô tả điểm giao và không coi `Compliance.cs` là nơi duy nhất chứa toàn bộ quy tắc.

---

## 2. Bản đồ thành phần

```text
WebApp/Main/*.aspx(.cs)
        │
        ├── UBClasses/Compliance.cs
        │       ├── truy vấn danh sách/chi tiết
        │       ├── cập nhật trạng thái phê duyệt
        │       ├── tính lại risk/objective
        │       └── dựng PDF/Excel báo cáo
        │
        ├── UBClasses/FINTRAC.cs
        │       ├── import/parse watchlist
        │       ├── AML name check
        │       └── scan/report
        │
        └── ScriptDB/000_4_CreateSP.sql
                ├── UBComp*
                ├── UBInvestObjMatrix*
                ├── UBFINTRACList / UBAMLCheckNameTitle
                └── MFDA_*
```

### File đầu mối

| Thành phần | File | Vai trò |
|---|---|---|
| Business façade | `UBClasses/Compliance.cs` | Cầu nối Web Forms với SP; xử lý DataSet, PDF và Excel |
| AML/FINTRAC | `UBClasses/FINTRAC.cs` | Parse/import danh sách, scan và truy vấn kết quả |
| Trade review | `WebApp/Main/ComplianceTrx.aspx.cs` | Danh sách, lọc, xem chi tiết và phê duyệt suitability |
| Account opening | `WebApp/Main/ComplianceAccount.aspx.cs` | Review account/plan mới |
| KYC update | `WebApp/Main/ComplianceAccountUpdate.aspx.cs` | Review thay đổi KYC |
| New plan | `WebApp/Main/ComplianceNewPlan.aspx.cs` | Danh sách và phê duyệt plan mới |
| Missing KYC | `WebApp/Main/ComplianceIncompleteKYC.aspx.cs` | Theo dõi hồ sơ KYC thiếu/chưa hoàn chỉnh |
| Compliance setup | `WebApp/Main/PopupSetupCompliance.aspx.cs` | Cấu hình rule ở cấp dealership |
| AML setup | `WebApp/Main/PopupSetupCompAML.aspx.cs` | Cấu hình và vận hành AML |
| Risk assessment | `WebApp/Main/PopupRiskAssessment.aspx.cs` | Mô phỏng/tính lại risk của plan |
| Menu routing | `WebApp/Js/MenuFunctions.js` | Ánh xạ menu sang các page Compliance |
| Stored procedures | `ScriptDB/000_4_CreateSP.sql` | Phần lớn logic truy vấn và cập nhật trạng thái |

`Compliance.cs` trả về nhiều `DataSet`. Khi result set có cột `RecType`, code dùng giá trị hàng đầu tiên để đặt `DataTable.TableName`. Vì vậy tên bảng trong C# thường không cố định theo thứ tự; khi debug cần kiểm tra cả `RecType` lẫn số lượng bảng.

---

## 3. Cấu hình điều khiển hành vi

Cấu hình dealership nằm chủ yếu trong `UB_CompSetting`; cấu hình theo member/supervisor nằm trong `UB_MemberComplianceSetting`.

`Compliance.GetSettings()` gọi `UBCompGetSettings`; `Compliance.SaveSettings()` gọi `UBCompSaveSettings`. Các nhóm cờ quan trọng gồm:

| Nhóm | Ví dụ field/parameter | Ảnh hưởng |
|---|---|---|
| Mô hình tính | `iModelPercentage`, `fRiskVariant`, `fObjVariant`, `iRiskOpt` | Cách so sánh tỷ trọng thực tế với KYC/model |
| Phạm vi tài sản | `iIncludeGIC`, các cờ include pending | Có tính GIC và lệnh chưa hoàn tất hay không |
| Pre-trade | `iPreTrade`, `mPreTradeSellAmount` | Bật kiểm tra trước khi lưu/gửi giao dịch |
| Chặn luồng | `iNoFSPlanNotApproved`, `iNoFSDocNotReceived25` | Có cho phép giao dịch/FundServ khi plan hoặc tài liệu chưa đạt |
| Approval | `iApproveTrxBothSide`, `iCompForceReviewLevel`, `iCompForceReviewGICLevel` | Quyết định giao dịch nào phải review và ở cấp nào |
| KYC | `iKYCUpdatePeriod`, `iKYCUpdatePeriodLeveraged`, `iKYCUpdatePeriodDealer`, `iKYCUpdatePeriodExempt` | Chu kỳ cập nhật KYC theo loại trường hợp |
| Ngoại lệ | `iNonWiredDueOpt`, `iFrozenOpt`, `iCompKYCOpt` | Cách xử lý non-wired, frozen và tình trạng KYC |

Không nên suy luận một rule chỉ từ tên checkbox trên UI. Giá trị cuối cùng còn bị chi phối bởi DSID, quyền user, supervisory level và logic trong SP.

---

## 4. Trạng thái phê duyệt

Chuỗi hiển thị trạng thái được lấy từ `UB_Def_CompStatus` thông qua UDF `GetApprovalStatusStr`; không hard-code label ở code mới.

| Mã | Ý nghĩa đã xác minh từ SQL | Ghi chú |
|---|---|---|
| `1` | Chờ review | Trạng thái pending/to be reviewed |
| `2` | Deficiency | Cần bổ sung hoặc xử lý thiếu sót |
| `3` | Declined/Rejected | Không phê duyệt |
| `4` | Approved | Đã phê duyệt |
| `5` | Trạng thái ngoại lệ/không cần review tùy cấu hình | Tên hiển thị phụ thuộc dữ liệu DB, cần tra `UB_Def_CompStatus` trên môi trường cụ thể |

Trong nhiều SP, giá trị `>= 4` được xem là đã có quyết định, nhưng chỉ `4` được xác nhận rõ là Approved. Cờ `bApprovedWithOutstanding` có thể làm chuỗi hiển thị có dấu `(*)`; không nên đồng nhất cờ này với một status code mới.

Hai cấp phê duyệt được lưu riêng (`iApprovalStatus1`, `iApprovalStatus2`, user/date/due date tương ứng). Account/KYC và trade dùng bảng trạng thái khác nhau nhưng cùng mô hình tổng quát:

```text
Pending → reviewer cấp 1 → (nếu cấu hình yêu cầu) reviewer cấp 2 → quyết định cuối
              │
              └── Deficiency / Declined → lưu history + notes
```

---

## 5. Trade suitability end-to-end

### 5.1. Trước khi ghi giao dịch

Các luồng Buy/Switch và một số luồng trade khác kiểm tra:

- plan có bị frozen hay không;
- KYC có hết hạn/thiếu hay không;
- risk của fund/giao dịch có vượt profile của plan hay không;
- rep có license phù hợp không;
- plan đã được phê duyệt chưa;
- có thuộc nhóm leveraged, initial, POA, unsolicited, non-wired hoặc GIC cần review không.

`PopupTradeAdd.aspx.cs`, `PopupTradeBasket.aspx.cs` và `PopupRiskAssessment.aspx.cs` gọi các hàm tính lại risk trong `Compliance.cs` để hiển thị tác động trước khi người dùng hoàn tất trade.

### 5.2. Tạo snapshot và status

Khi giao dịch đi vào quy trình compliance, SP tạo snapshot thông tin plan và trạng thái tại thời điểm kiểm tra. Đây là điểm quan trọng: màn hình review phải phản ánh dữ liệu khi quyết định được tạo, không chỉ profile hiện tại.

Các bảng chính:

- `UB_CompTrxApprovalPlanInfo`: snapshot plan/KYC/risk/objective/frozen.
- `UB_CompTrxApprovalStatus`: liên kết transaction/order/plan và trạng thái approval hiện hành.
- `UB_CompTrxApprovalStatusHistory`: lịch sử quyết định.
- `UB_CompTrxApprovalStatusARC`: dữ liệu archive, có thêm cờ trend.

`UB_CompTrxApprovalStatus` còn giữ các cờ nghiệp vụ như risk/amount, unsolicited, exempt, leveraged, initial, POA, suitable, rep license, plan not approved, non-wired, GIC và approved-with-outstanding.

### 5.3. Review trên UI

Luồng chính ở `ComplianceTrx.aspx.cs`:

1. `TrxSuitabilitySet()` → `UBCompTrxSuitabilityListByPlan` để lọc/paging theo plan, rep, branch, ngày, cấp review và status.
2. `SuitabilityDetailSet()` hoặc `SuitabilityDetailBasketSet()` lấy chi tiết một trade/basket.
3. `TrxApprovalStatusSet()` → `UBCompTrxApprovalStatusInfo` lấy trạng thái hiện tại trước khi quyết định.
4. Update một item hoặc approve tagged/all thông qua nhóm `UBCompTrxStatusUpdate`, `UBCompTrxApproveTaggedItems*`, `UBCompTrxSuitabilityApproveAll*`.
5. Xuất báo cáo bằng các hàm PDF/Excel trong `Compliance.cs`.

Các biến thể menu như Leveraged, POA, Initial, Unsolicited, Licensing, Non-wired và GIC chủ yếu là view/filter chuyên biệt trên cùng tập dữ liệu approval.

### 5.4. Liên hệ với vòng đời order

Compliance không thay thế order status. Một order có vòng đời FundServ/settlement riêng, trong khi compliance status mô tả quyết định giám sát. Khi điều tra một giao dịch, luôn kiểm tra cả:

- transaction/order status;
- compliance approval status cấp 1/cấp 2;
- snapshot plan tại thời điểm review;
- cấu hình dealership có chặn gửi FundServ hay chỉ cảnh báo.

Xem thêm [Trading & Orders](../trading-orders/module-guide.md) và [FundServ](../fundserv/README.md).

---

## 6. Tính risk và investment objectives

Ba entry point chính:

| Hàm C# | Stored procedure | Trường hợp dùng |
|---|---|---|
| `RecalcPlanRiskTMP()` | `UBCompCalcRiskTMP` | Mô phỏng plan với tối đa 10 fund/amount đề xuất |
| `RecalcPlanRiskBasket()` | `UBCompCalcRiskBasket` | Tính cho basket trade |
| `RecalcPlanRiskTrx()` | `UBCompCalcRiskTrx` | Tính lại tác động của transaction cụ thể |

`UBCompCalcRiskTMP` tập hợp tài sản từ vị thế fund hiện tại, cash, GIC, pending orders và các khoản đề xuất; sau đó quy đổi giá trị bằng exchange rate và phân bổ theo risk/objective của fund.

Profile mục tiêu của plan nằm trong `UB_PlanInvestInfo`, gồm các tỷ lệ objective (`fPrimaryObj1..5`), risk (`fRisk1..6`), time horizon, leveraged flag, freeze flag, KYC dates/locks và một số cờ dừng commission/FundServ.

Ma trận ánh xạ product → objective/risk nằm trong `UB_FundDefObjMatrix` và được quản lý qua:

- `UBInvestObjMatrixList`
- `UBInvestObjMatrixItemInfo`
- `UBInvestObjMatrixItemUpdate`
- `UBInvestObjMatrixItemRemove`
- `UBInvestObjMatrixApply`

### Rủi ro khi sửa logic tính

- Không bỏ qua pending trade nếu UI/cấu hình yêu cầu include pending.
- GIC có thể được tính hoặc loại ra theo dealership setting.
- Không dùng giá trị hiện tại của plan thay cho snapshot khi audit quyết định cũ.
- Kết quả có nhiều result set theo `RecType`; thay đổi schema một result set có thể làm hỏng PDF/UI dù phép tính đúng.
- Phải kiểm thử Buy, Sell, Switch, Basket và multi-currency riêng biệt.

---

## 7. Account opening, new plan và KYC update

Đây là ba queue gần nhau nhưng không hoàn toàn đồng nhất:

| Queue | Màn hình | Các SP tiêu biểu |
|---|---|---|
| Account opening / plan created | `ComplianceAccount.aspx.cs` | `UBCompAccountOpeningPendingCount`, `UBCompAccountOpeningApproveAll`, `UBCompAccountOpeningApproveTaggedItems` |
| New plan opening | `ComplianceNewPlan.aspx.cs` | `UBCompPlanDetail`, `UBCompNewPlanPendingCount`, `UBCompNewPlanApproveAll` |
| KYC update | `ComplianceAccountUpdate.aspx.cs` | `UBCompAccountKYCUpdatePendingCount`, `UBCompAccountKYCUpdateApproveAll`, `UBCompAccountKYCUpdateApproveTaggedItems` |

Dữ liệu trạng thái chính nằm trong `UB_CompPlanApprovalStatus`; lịch sử nằm trong `UB_CompPlanApprovalStatusHistory`. KYC update còn liên hệ `UB_PlanKYCUpdateGroup` và bảng archive tương ứng.

Khi review, cần phân biệt:

- trạng thái approval ban đầu với trạng thái approval cho KYC update;
- cấp review 1 và cấp review 2;
- due date/late flag với approval date;
- decision lock với quyền truy cập màn hình;
- tài liệu chưa nhận với KYC thiếu dữ liệu.

`PlanDetailInfo()` gọi `UBCompAccountApprovalDetail`; `ClientDetailInfo()` gọi `UBCompAccountClientDetail` để dựng màn hình chi tiết. PDF tương ứng được tạo bởi `AccountOpeningPdfDoc()`, `AccountUpdatePdfDoc()` và `NewPlanPdfDoc()`.

Xem thêm [Client & KYC](../client-kyc/module-guide.md) và [Account & Plan](../account-plan/module-guide.md).

---

## 8. Missing KYC và deficiency logs

`ComplianceIncompleteKYC.aspx.cs` phục vụ việc tìm hồ sơ thiếu/chưa hợp lệ. Đây không nhất thiết là cùng một trạng thái với `Deficiency` trong approval queue.

Ba nhóm log được tách riêng:

| Hàm | Stored procedure | Phạm vi |
|---|---|---|
| `TrxSuitabilityDeficiencyLogSet()` | `UBCompDeficiencyLogTrx` | Giao dịch |
| `PlanNewDeficiencyLogSet()` | `UBCompDeficiencyLogPlanNew` | Plan/account mới |
| `PlanUpdateDeficiencyLogSet()` | `UBCompDeficiencyLogPlanUpdate` | KYC/account update |

Mỗi nhóm có hàm export Excel riêng. Khi đối soát, cần dùng đúng log theo loại queue; gộp cả ba chỉ dựa trên status text sẽ làm mất ngữ cảnh nghiệp vụ.

---

## 9. Trend surveillance

Trend report tìm mẫu cần con người review; nó không tự chứng minh một vi phạm. Menu và code hiện có các nhóm chính:

| Nhóm | Page/entry point | SP/bảng liên quan |
|---|---|---|
| Excessive/frequent trading | `ComplianceTrendPlan` | `UBCompTrendFrequentTrading`, `UB_CompliancePlanTrend` |
| Excessive commission | `ComplianceTrendExComm` | `UBCompTrendExCommTrading`, `UB_CompliancePlanTrend` |
| Short-term trading | `ComplianceTrendShortTerm` | `UBCompTrendTrxShortTerm`, `UB_ComplianceTrxTrend` |
| DSC issue | `ComplianceTrendDSCIssue` | `UBCompTrendTrxDSCIssue` |
| Redemption with fee | `ComplianceTrendRedFeeIssue` | `UBCompTrendTrxRedemptionFee` |
| Switch with fee/load | `ComplianceTrendSwitchFeeIssue`, `ComplianceTrendSwitchLoad` | `UBCompTrendTrxSwitchFee`, `UBCompTrendTrxSwitchLoad` |
| Two-sided | `ComplianceTrend2Sided` | `UBCompTrend2SidedClientList`, `UBCompTrend2SidedPlanID` |
| Quarterly AUA / sales commission | `ComplianceTrendAUA`, `ComplianceTrendComm` | Nhóm report trend |
| Low MER | `ComplianceTrendLowMER` | `UBCompTrend_LowMER_*`, `UB_MER_Report*` |
| Production / net sales | `ComplianceTrendProduction` | `MFDA_PlanStatsMonthlyList`, `MFDA_NetSale` |

Kết quả review report được lưu qua `UB_CompTrendReviewObj`, có search criteria, notes và binary PDF object. Vì vậy thay đổi filter cần giữ khả năng tái hiện báo cáo đã review.

---

## 10. AML/FINTRAC

### Vai trò của `FINTRAC.cs`

- `FINTRACRecord`: chuẩn hóa record từ nhiều định dạng document/list.
- `FINTRACImport`: chạy import/scan, hỗ trợ callback tiến độ/lỗi và abort.
- `FINTRAC.GetList()` / `GetData()`: gọi `UBFINTRACList`.
- `ClientCheckFINRAC()`: gọi `UBAMLCheckNameTitle` để so khớp tên/title.
- Nhóm loader parse các nguồn như CCASL, JVCFOR, UN sanctions và terrorist list từ URL cấu hình.

### Luồng tổng quát

```text
Nguồn watchlist → download/upload → parse + normalize → lưu/import
                                                │
Khách hàng mới/cũ → AML name check ─────────────┤
                                                ▼
                                      hit/candidate → review/report
```

`FINTRACView.aspx.cs` là màn hình xem kết quả; `PopupSetupCompAML.aspx.cs` quản lý setup/upload. Một số màn hình tạo/sửa client cũng gọi AML name check, nên lỗi AML có thể xuất hiện ngoài menu Compliance.

Tên class/method cũ có lỗi chính tả `ClientCheckFINRAC` (thiếu chữ `T`). Khi tìm call site phải dùng đúng tên hiện hữu.

### Lưu ý vận hành

- URL và format nguồn bên ngoài có thể thay đổi; lỗi parse không đồng nghĩa danh sách trống hợp lệ.
- Phải ghi nhận document type và record type trước khi import.
- Name matching tạo candidate để review, không nên tự coi là xác nhận cùng một người.
- Khi debug môi trường không có network, tách lỗi download khỏi lỗi parser và lỗi DB.

---

## 11. Bảng dữ liệu trọng yếu

| Bảng | Vai trò |
|---|---|
| `UB_CompSetting` | Cấu hình compliance theo DSID/dealership |
| `UB_MemberComplianceSetting` | Cấu hình supervisory/pre-trade theo member |
| `UB_CompPlanApprovalStatus` | Trạng thái account/new plan/KYC update hiện hành |
| `UB_CompPlanApprovalStatusHistory` | Snapshot/lịch sử quyết định plan/KYC |
| `UB_CompTrxApprovalPlanInfo` | Snapshot plan khi tạo review giao dịch |
| `UB_CompTrxApprovalStatus` | Trạng thái và cờ suitability của giao dịch |
| `UB_CompTrxApprovalStatusHistory` | Lịch sử quyết định giao dịch |
| `UB_CompTrxApprovalStatusARC` | Archive approval/trend của giao dịch |
| `UB_CompliancePlanTrend` | Dữ liệu trend tổng hợp theo plan/tháng |
| `UB_ComplianceTrxTrend` | Cờ trend theo transaction |
| `UB_CompTrendReviewObj` | Criteria, notes và PDF của lần review trend |
| `UB_PlanInvestInfo` | KYC investment profile, risk/objective và control flags |
| `UB_FundDefObjMatrix` | Ma trận risk/objective theo fund class |
| `UB_MER_Report*` | Dữ liệu Low MER report ở các cấp report/client/household |

Các bảng còn liên hệ chặt với `UB_Plan`, `UB_Customer`, `UB_CustomerPlan`, `UB_FundTrx`, `UB_FundTrxOrder`, `UB_FundAccount`, `UB_FundAccountPosition`, `UB_FundDef`, `UB_GICAccount` và `UB_GICAccountTrx`.

---

## 12. Danh mục stored procedure theo nhóm

### Cấu hình và summary

- `UBCompSummaryList`
- `UBCompGetSettings`
- `UBCompSaveSettings`
- `UBCompAccountApprovalDetail`
- `UBCompAccountClientDetail`

### Risk/suitability

- `UBCompCalcRiskTMP`
- `UBCompCalcRiskBasket`
- `UBCompCalcRiskTrx`
- `UBCompTrxSuitabilityListByPlan`
- `UBCompTrxSuitabilitySummary`
- `UBCompTrxSuitabilityPendingCount`
- `UBCompTrxSuitabilityDetail`
- `UBCompBasketSuitabilityDetail`
- `UBCompTrxApprovalStatusInfo`
- `UBCompTrxStatusUpdate`
- `UBCompTrxApproveTaggedItems*`
- `UBCompTrxSuitabilityApproveAll*`

### Account/KYC

- `UBCompAccountOpeningPendingCount`
- `UBCompAccountOpeningApproveAll`
- `UBCompAccountOpeningApproveTaggedItems`
- `UBCompAccountKYCUpdatePendingCount`
- `UBCompAccountKYCUpdateApproveAll`
- `UBCompAccountKYCUpdateApproveTaggedItems`
- `UBCompPlanDetail`
- `UBCompNewPlanPendingCount`
- `UBCompNewPlanApproveAll`

### Trend, matrix và reporting

- `UBCompTrendFrequentTrading`
- `UBCompTrendExCommTrading`
- `UBCompTrendTrxShortTerm`
- `UBCompTrendTrxDSCIssue`
- `UBCompTrendTrxRedemptionFee`
- `UBCompTrendTrxSwitchFee`
- `UBCompTrendTrxSwitchLoad`
- `UBCompTrendReview*`
- `UBCompTrend2Sided*`
- `UBCompTrend_LowMER_*`
- `UBInvestObjMatrix*`
- `MFDA_PlanStatsMonthlyList`
- `MFDA_NetSale`

Trong đợt phân tích này, 51 chuỗi `SetSP(...)` trong `Compliance.cs` đã được đối chiếu với `ScriptDB/000_4_CreateSP.sql`: 50 SP đang hoạt động có definition; tên còn lại là `UBCompTrxSuitabilityList` đã bị comment và được thay bằng `UBCompTrxSuitabilityListByPlan`.

---

## 13. Cách lần theo một lỗi Compliance

### Lỗi một trade không xuất hiện trong queue

1. Xác định `iTrxID`, order ID, plan ID và DSID.
2. Kiểm tra order đã tạo thành công và trạng thái order hiện tại.
3. Kiểm tra record trong `UB_CompTrxApprovalStatus` và snapshot `UB_CompTrxApprovalPlanInfo`.
4. Đối chiếu các cờ rule với `UB_CompSetting` và `UB_MemberComplianceSetting`.
5. Chạy cùng filter/cấp approval như `UBCompTrxSuitabilityListByPlan`.
6. Kiểm tra branch/rep access, inactive account, non-deployed/non-assigned filter.

### Kết quả risk trên popup khác màn hình review

1. Xác nhận hàm đang gọi: TMP, Basket hay Trx.
2. So sánh `bIncludePendingTrx`, `bShowPendingTrx` và `iIncludeGIC`.
3. Kiểm tra exchange rate, fund risk/objective matrix và vị thế tại ngày tính.
4. Phân biệt KYC hiện tại với snapshot lúc tạo approval.
5. Kiểm tra từng result set/`RecType`, không chỉ bảng đầu tiên.

### Approval không cập nhật

1. Kiểm tra approval level hiện tại và quyền supervisory của user.
2. Kiểm tra decision lock, status hiện tại và record đã được user khác xử lý chưa.
3. Xác định đang update một item, tagged items hay approve all.
4. Kiểm tra history được ghi cùng transaction DB hay không.
5. Không chỉ nhìn label; đọc code status thật trong bảng.

### AML scan không có kết quả

1. Kiểm tra document type/record type và tên file.
2. Kiểm tra download/upload có dữ liệu thực, không chỉ HTTP/process thành công.
3. Kiểm tra parser tạo record và normalize tên/ngày sinh/quốc tịch.
4. Kiểm tra import DB rồi mới chạy `UBAMLCheckNameTitle`.
5. Tách biệt “không match” với “không nạp được watchlist”.

---

## 14. Điểm dễ hiểu sai

- **Compliance status khác order status**: Approved không có nghĩa order đã accepted/settled.
- **Deficiency khác missing KYC**: có thể liên quan nhưng là hai khái niệm/queue khác nhau.
- **Hai approval level không phải hai record độc lập**: nhiều bảng giữ cả hai cấp trong cùng trạng thái nghiệp vụ.
- **Dữ liệu review có snapshot**: dùng profile hiện tại để giải thích quyết định cũ có thể sai.
- **Trend là tín hiệu review**: cờ trend không tự kết luận vi phạm.
- **Status `5` không được đặt tên cứng**: phải tra definition table trên DB mục tiêu.
- **UI filter ảnh hưởng mạnh kết quả**: branch, rep, inactive account, pending/all và supervisory level đều có thể làm record “biến mất”.
- **Song ngữ EN/FR**: menu/page có biến thể ngôn ngữ; sửa label hoặc route phải kiểm tra cả hai.

---

## 15. Checklist khi thay đổi code

- [ ] Xác định rule thuộc pre-trade, post-trade, account/KYC, trend hay AML.
- [ ] Xác định phạm vi tenant (`DBID`, `DSID`) và quyền user/supervisory level.
- [ ] Đối chiếu cả C# caller và definition SP.
- [ ] Giữ tương thích result set, cột và `RecType`.
- [ ] Kiểm tra snapshot/history, không chỉ bảng trạng thái hiện hành.
- [ ] Test cả approval level 1 và level 2 nếu dealership bật hai cấp.
- [ ] Test Approved, Deficiency, Declined và outstanding flags.
- [ ] Test EN/FR và PDF/Excel nếu thay đổi cột/label.
- [ ] Với risk: test current position, pending trade, GIC, basket và multi-currency.
- [ ] Với AML: test lỗi nguồn, lỗi parse, import rỗng và false-positive review.

---

## 16. Phạm vi đã xác minh và phần cần làm tiếp

Đã xác minh từ source hiện tại:

- entry point UI/menu chính;
- mapping giữa các method `Compliance.cs` và stored procedure;
- cấu trúc nhóm bảng approval/snapshot/trend;
- luồng tính risk chính;
- queue account opening/KYC/new plan;
- vai trò của `FINTRAC.cs` và AML name check.

Chưa hoàn tất ở mức data dictionary đầy đủ:

- mô tả từng cột của toàn bộ bảng Compliance;
- bảng giá trị chính thức của mọi status/option theo dữ liệu từng môi trường;
- traceability từng màn hình → method → SP → table;
- test case hồi quy tự động cho các biến thể cấu hình dealership.

Các phần này đã được bổ sung trong [Data Dictionary](../../reference/data-dictionary.md), [SP Catalog](../../reference/sp-catalog/) và [Traceability Matrix](../../reference/traceability-matrix.md) thay vì lặp lại toàn bộ trong module guide.

---

## 17. Tài liệu liên quan

- [Client & KYC](../client-kyc/module-guide.md)
- [Account & Plan](../account-plan/module-guide.md)
- [Trading & Orders](../trading-orders/module-guide.md)
- [Commission & Fee](../commission-fee/module-guide.md)
- [Fund & GIC](../fund-gic/module-guide.md)
- [Database Table Description](../../Database/Table_Description.md)
- [SP Catalog](../../reference/sp-catalog/README.md)
- [Data Dictionary](../../reference/data-dictionary.md)
