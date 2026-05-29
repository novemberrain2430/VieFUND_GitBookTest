# Commission & Fee — Module Guide

> Module quản lý hoa hồng (Commission) nhận từ fund company và phí dịch vụ (Fee) thu từ client.
> **Đối tượng**: Developer .NET cần hiểu cơ chế tính và giải ngân commission/fee end-to-end.

---

## 1. Tổng quan — Hai luồng tiền

| Luồng | Chiều tiền | Mô tả |
|---|---|---|
| **Commission** | Fund Company → Dealer | Hoa hồng từ fund company trả cho dealer khi client giao dịch |
| **Fee for Service** | Client → Dealer | Phí dịch vụ mà dealer thu từ client (MER, AUM-based) |

---

## 2. Các loại Commission

| Loại | Mô tả | Trường |
|---|---|---|
| **Regular** | Hoa hồng từ giao dịch mua thường (FEL/NL) | `fRegular` |
| **PAC** | Hoa hồng từ Pre-Authorized Contribution | `fPAC` |
| **Internal (Switch)** | Hoa hồng từ giao dịch Switch | `fInternal` |
| **Service Fee** | Trailing commission hàng năm | `fServiceFee` |
| **GIC** | Hoa hồng từ sản phẩm GIC | `fGIC` |
| **Insurance** | Hoa hồng từ bảo hiểm | `fInsurance` |

> **Nguồn**: `UBClasses/CommissionDef.cs` L499-534 — `TemplateUpdate()`

---

## 3. Vòng đời Commission

```
Commission (Revenue)
    │ Tag → Move2Payable
    ▼
Payable (Chờ trả)
    │ PayrollProcess
    ▼
Payroll TMP
    │ Complete
    ▼
Paid (History)
```

### Bước 1 — Import / Add Revenue

```csharp
CommissionRevenue.Update()  // → SP UBCommissionAdd / UBCommissionUpdate
```

Params chính: `iRepCode`, `IncomeType`, `TradeDate`, `MgmtCode`, `FundID`, `fCommAmountGross`, `iClientID`, `iPlanID`.

### Bước 2 — Move to Payable

```
CommissionRevenue.MoveTagged2Payable() → SP UBCommissionMove2Payable
  Returns: iCount, iCountDeleted, iCountAlreadyMoved, iCountSkipped
```

Variants: `UBCommissionMove2Payable1HeaderNoGroup`, `UBCommissionMove2PayableX_Step1..4`

### Bước 3 — Payroll Processing

```
CommissionRevenue.PayrollProcess() → SP UBCommPayrollProcess
  Params: PaidMethod (Cheque/EFT), iBankAccountID, PaidDate,
          iChequeNumberStart, iFiscalYear, bConvert2CAD, fXRate
```

### Bước 4 — Payroll History

```
CommissionRevenue.GetPayrollHistoryList() → SP UBCommissionPayrollSearchHistory
```

---

## 4. Commission View & Search (CommissionView.aspx)

| Tab | SP | Mô tả |
|---|---|---|
| **Revenue** | `UBCommissionViewSearch` | Commission nhận từ fund company |
| **Payable** | `UBCommissionPayableSearch` | Sẵn sàng trả cho Rep |
| **Payroll TMP** | `UBCommissionPayrollSearchTMP` | Đang xử lý |
| **Payroll History** | `UBCommissionPayrollSearchHistory` | Lịch sử đã thanh toán |

**Totals**:
```
GetTotals(iSP=0) → UBCommissionViewTotal
GetTotals(iSP=1) → UBCommissionPayableTotal
GetTotals(iSP=2) → UBCommissionPayrollTotalTMP
GetTotals(iSP=3) → UBCommissionPayrollTotal
```

---

## 5. Fee for Service

### 5.1. Fee Template (Biểu phí tiered)

| Field | Mô tả |
|---|---|
| `FeeTemplateCode` | Mã template |
| `iClientAUA` | Tính AUA theo client hay plan |
| **Tier 1-5** | `mAUA1_1`, `mFee1`, `FeeType1` → `mAUA5_1`, `mFee5`, `FeeType5` |
| **Include/Exclude** | `iIncludeCash`, `iIncludeGIC`, `iIncludeFEL`, `iExcludeFSeries` |

> **Nguồn**: `UBClasses/Fee.cs` L515-628 — `TemplateUpdate()`

### 5.2. Plan Fee Setting

```
Fee.GetPlanFeeList()         → SP UBPlanFeeList
Fee.GetPlanFeeSettingInfo()  → SP UBPlanFeeSettingInfo
Fee.PlanFeeSettingAdd/Update() → SP UBPlanFeeSettingAdd/Update
```

### 5.3. Fee Processing Flow (Thread-based)

```
1. UBFeeProcessStart        → Khởi tạo processing run (iProcessingID)
2. UBFeeGenerateTrx_Start   → Lấy danh sách fees cần generate
3. UBFeeGenerateTrxOne      → Tạo Sell transaction cho từng fee (loop)
4. UBFeeGenerateComm        → Generate commission từ fee transactions
5. UBFeeProcessEnd          → Kết thúc processing run
```

```csharp
Fee obj = new Fee();
obj.SetParams(DBIDStr, iDSID, iUserID, iProcessingID, Lg);
obj.StartGenerateTrxProcess(); // background thread
```

### 5.4. Fee Redemption Order

Xác định fund nào cần bán để trả fee:
```
Fee.RedemptionOrderSet() → SP UBFundPos4RedemptionList
  Params: iPlanID, iPlanFeeID, iCashOpt, iLoadOpt, iRiskOpt, iMKVOpt
```

---

## 6. Commission Templates & Categories

```
CommissionDef.GetCategoryList()   → SP UBCommCategoryDetailList
CommissionDef.UpdateCategory()    → SP UBCommCategoryDetailAdd/Modify
CommissionDef.TemplateUpdate()    → SP UBCommTemplateAdd/Modify
```

**Revenue Threshold** — ngưỡng tối thiểu để xử lý:
```
CommissionDef.RevenueThresholdAdd()    → SP UBRevenueThresholdAdd
CommissionDef.RevenueThresholdSet()    → SP UBRevenueThresholdList
```

---

## 7. UI Entry Points

| Page | Size (KB) | Vai trò |
|---|---|---|
| `CommissionView.aspx(.cs)` | 170/245 | Tổng hợp commission — Revenue, Payable, Payroll |
| `MemberSetupCommission.aspx(.cs)` | —/19 | Setup Categories và Templates cho Rep |
| `PopupCommissionAdd.aspx(.cs)` | —/44 | Thêm commission thủ công |
| `Fee4Service.aspx(.cs)` | 79/83 | Quản lý Fee for Service |
| `PanelPlanFeeSetting.aspx(.cs)` | —/27 | Cài đặt fee cho plan |
| `PanelFeeProcess.aspx(.cs)` | —/24 | Chạy Fee processing |
| `PopupSetupFeeTemplate.aspx(.cs)` | —/23 | Tạo/sửa Fee Template |

---

## 8. BLL Classes

| Class | File | Size | Vai trò |
|---|---|---|---|
| `CommissionRevenue` | `UBClasses/CommissionRevenue.cs` | 172KB | Revenue → Payable → Payroll → Paid |
| `CommissionDef` | `UBClasses/CommissionDef.cs` | 43KB | Category, Template, Batch, Threshold |
| `Fee` | `UBClasses/Fee.cs` | 106KB | Fee for Service: Template, Processing |
| `FeeProcessing` | `UBClasses/FeeProcessing.cs` | 22KB | Fee processing chi tiết |

---

## 9. Stored Procedures chính

### Commission Revenue (~40 SPs)

| Nhóm | SPs |
|---|---|
| **View/Search** | `UBCommissionViewSearch`, `UBCommissionPayableSearch`, `UBCommissionPayrollSearchHistory` |
| **Move2Payable** | `UBCommissionMove2Payable`, `UBCommissionMove2Payable1HeaderNoGroup` |
| **CRUD** | `UBCommissionAdd`, `UBCommissionUpdate`, `UBCommissionManualRemove` |
| **Payroll** | `UBCommPayablePrn`, `UBCommPayrollProcess` |
| **Remove** | `UBCommissionRemoveFromPayableTagged`, `UBCommissionPayableRemove` |

### Fee (~50 SPs)

| Nhóm | SPs |
|---|---|
| **Template** | `UBFeeTemplateList`, `UBFeeTemplateAdd`, `UBFeeTemplateModify`, `UBFeeTemplateRemove` |
| **Plan Fee** | `UBPlanFeeList`, `UBPlanFeeSettingAdd`, `UBPlanFeeSettingUpdate`, `UBPlanFeeSettingInfo` |
| **Processing** | `UBFeeProcessStart`, `UBFeeGenerateTrx_Start`, `UBFeeGenerateTrxOne`, `UBFeeProcessEnd` |
| **Commission Gen** | `UBFeeGenerateComm`, `UBFeeGenerateCommTaggedItems` |
| **Undo** | `UBFeeProcessUndoCommission`, `UBFeeProcessUndoCommissionTaggedItems` |

### CommissionDef (~20 SPs)

| Nhóm | SPs |
|---|---|
| **Category** | `UBCommCategoryDetailList`, `UBCommCategoryDetailAdd/Modify/Remove` |
| **Template** | `UBCommTemplateList`, `UBCommTemplateAdd/Modify/Remove` |
| **Batch** | `UBCommBatchDefAdd/Update/Remove`, `UBCommBatchProcess` |
| **Threshold** | `UBRevenueThresholdList`, `UBRevenueThresholdAdd/Remove` |

---

## 10. Kiến trúc tổng kết

```
UI Layer
  CommissionView.aspx ── Revenue | Payable | Payroll TMP | History
  Fee4Service.aspx ────── Fee List, Processing, Template
        │
        ▼
BLL Layer
  CommissionRevenue.cs ── Revenue → Payable → Payroll → Paid
  CommissionDef.cs ─────── Category → Template → Batch
  Fee.cs ───────────────── Template → Plan Setting → Process
        │
        ▼
DB Layer
  ~110 SPs (UBComm*, UBFee*, CON_WF_*)
```

---

## 11. Cross-references

| Tài liệu | Liên quan |
|---|---|
| [Domain Glossary](../../getting-started/domain-glossary.md) | Commission, Rep, Dealer, AUA, PAC, FEL, DSC |
| [Trading & Orders](../trading-orders/module-guide.md) | CommissionType, CommissionRate trong giao dịch Buy/Sell |
| [Client & KYC](../client-kyc/module-guide.md) | RepCode, Dealership — hierarchy ảnh hưởng commission routing |
| [System Map](../../getting-started/system-map.md) | Vị trí `CommissionRevenue.cs`, `Fee.cs` trong architecture |
