# API Reference — VFOmnibus

Tham chiếu chi tiết tất cả public methods trong VFOmnibus library.

> **Quy ước chung**: Tất cả method đều là `public static`. Hai tham số đầu tiên luôn là `DBIDStr` (database connection ID) và `DSIDStr` (data source ID). `iUserID` là user hiện tại.

---

## COmnibus — Order Lifecycle

### GetOrderPendingSet

Lấy danh sách lệnh client pending, **chưa** gộp thành omnibus.

```csharp
public static DataSet GetOrderPendingSet(
    string DBIDStr, string DSIDStr, int iUserID, int Lg,
    string DealerCode, string RepCode,
    string MgmtCode, string FundID, string FundAccountID,
    int iOrderStatus,
    string LastName, string FirstName,
    string PlanID, string PlanType, string AmountType,
    int iModelID,
    ref string errorMessage, ref int errorCode,
    int iPageSize, int iPage,
    int iOptions, int iSortOpt)
```

**SP**: `OMOrderPendingSet`

| Param | Mô tả | Bắt buộc |
|-------|-------|----------|
| `DealerCode` | Lọc theo dealer | Có |
| `RepCode` | Lọc theo rep code | Không (skip nếu empty) |
| `MgmtCode` | Lọc theo management company | Không |
| `FundID` | Lọc theo fund | Không |
| `FundAccountID` | Lọc theo fund account | Không |
| `iModelID` | Lọc theo model portfolio | Không (skip nếu 0) |
| `LastName`, `FirstName` | Lọc theo tên client | Không |
| `PlanID`, `PlanType` | Lọc theo plan | Không |
| `AmountType` | Loại amount (Dollar/Unit/All) | Có |
| `iSortOpt` | Tùy chọn sắp xếp | Có |

**Return DataSet tables**: `OrderList`, `Summary`, `SelectList`

---

### GetOmnibusOrderPendingSet

Lấy danh sách omnibus orders đã gộp nhưng chưa gửi FundServ.

```csharp
public static DataSet GetOmnibusOrderPendingSet(
    string DBIDStr, string DSIDStr, int iUserID, int Lg,
    string MgmtCode, string FundID,
    int iOrderStatus,
    ref string errorMessage, ref int errorCode,
    int iPageSize, int iPage, int iOptions)
```

**SP**: `OMOmnibusOrderPendingSet`

---

### GetOmnibusOrderSet

Lấy lịch sử omnibus orders với bộ lọc ngày.

```csharp
public static DataSet GetOmnibusOrderSet(
    string DBIDStr, string DSIDStr, int iUserID, int Lg,
    string MgmtCode, string FundID,
    int iOrderStatus, int iDateType, string StartDate, string EndDate,
    ref string errorMessage, ref int errorCode,
    int iPageSize, int iPage, int iOptions, bool bPendingOnly)
```

**SP**: `OMOmnibusOrderSet`

| Param đặc biệt | Mô tả |
|-----------------|-------|
| `iDateType` | Loại ngày lọc (trade date, settlement date, ...) |
| `bPendingOnly` | `true` = chỉ lấy pending, `false` = tất cả |

---

### GenerateOmnibusFromPending

Gộp các lệnh client pending đã chọn thành omnibus orders.

```csharp
public static int GenerateOmnibusFromPending(
    string DBIDStr, string DSIDStr, int iUserID,
    int iOptions,
    ref int iOmnibusTrxCount, ref int iDetailCount)
```

**SP**: `OMOrderPending2OmnibusProcess`

**Return**: `0` = success, `2` = exception

**Output**: 
- `iOmnibusTrxCount` — số omnibus transactions tạo được
- `iDetailCount` — tổng số client details

---

### OmnibusOrderAdd

Thêm trực tiếp một omnibus order (không qua pending).

```csharp
public static int OmnibusOrderAdd(
    string DBIDStr, string DSIDStr, int iUserID,
    int Lg, int iOptions, int iPosID, string TrxType, string TrxTypeDetail,
    string AmountType, double fAmount,
    ref int iOrderID, ref int iTrxID)
```

**SP**: `OMOmnibusOrderAdd`

| Param | Mô tả |
|-------|-------|
| `iPosID` | Fund Account Position ID |
| `TrxType` | Loại giao dịch (Buy/Sell) |
| `TrxTypeDetail` | Chi tiết loại GD |
| `AmountType` | Dollar hoặc Unit |
| `fAmount` | Số tiền/unit |

---

### SendTaggedItems2FundServ

Gửi các omnibus orders đã tag đến FundServ.

```csharp
public static int SendTaggedItems2FundServ(
    string DBIDStr, string DSIDStr, int iUserID,
    int Lg, int iOptions, bool bNewSourceID,
    ref int iCountDone, ref string errorMessage)
```

**SP**: `OMOmnibusOrderSend2FundServ`

| Param | Mô tả |
|-------|-------|
| `bNewSourceID` | `true` = tạo SourceID mới (dùng khi re-send, status=3) |

---

### OmnibusOrderSetAsProcessed

Đánh dấu omnibus order đã được xử lý (sau khi nhận confirm từ FundServ).

```csharp
public static int OmnibusOrderSetAsProcessed(
    string DBIDStr, string DSIDStr, int iUserID,
    int iOmnibusTrxID,
    ref string errorMessage, ref int errorCode)
```

**SP**: `OMOmnibusOrderSetAsProcessed`

---

### SynchronizeTaggedItems

Đồng bộ kết quả omnibus về từng client transaction.

```csharp
public static int SynchronizeTaggedItems(
    string DBIDStr, string DSIDStr, int iUserID,
    int iOptions,
    ref int iCountDone, ref int iCount, ref int iTrxCount)
```

**SP**: `OMOmnibusSynchTaggedItems`

---

### SynchronizeSelectedItem

Đồng bộ MỘT omnibus transaction cụ thể.

```csharp
public static int SynchronizeSelectedItem(
    string DBIDStr, string DSIDStr, int iUserID,
    int iOptions, int iOmnibusTrxID, ref int iTrxCount)
```

**SP**: `OMOmnibusSynchSelectedItem`

**Chú thích trong code**: `/// update UB_FundTrx based on OM_OmnibusTrxDetail`

---

## COmnibus — Dividend

### OMDividendTrxProcess

Tính toán và phân bổ cổ tức cho các client.

```csharp
public static int OMDividendTrxProcess(
    string DBIDStr, string DSIDStr, int iUserID,
    int iOptions, double fBreakageUnitMax,
    double fDividendRate, string DividendDate,
    int iMethod, string DateFrom, string DateTo, int iTrxTypeOpt)
```

**SP**: `OMDividendTrxProcess`

| Param | Mô tả |
|-------|-------|
| `fBreakageUnitMax` | Ngưỡng breakage unit tối đa cho phép |
| `fDividendRate` | Tỷ lệ cổ tức |
| `DividendDate` | Ngày cổ tức |
| `iMethod` | 1 = theo rate, 2 = theo khoảng thời gian |
| `DateFrom`, `DateTo` | Chỉ dùng khi `iMethod == 2` |
| `iTrxTypeOpt` | Chỉ dùng khi `iMethod == 2` — loại transaction lọc |

---

### OMDividendTrxProcessUndo

Hoàn tác phân bổ cổ tức.

```csharp
public static int OMDividendTrxProcessUndo(
    string DBIDStr, string DSIDStr, int iUserID,
    int iOptions, int iOmnibusTrxID)
```

**SP**: `OMDividendTrxProcessUndo`

---

### OmnibusDividendTrxInfoX

Lấy thông tin chi tiết cổ tức (phiên bản mở rộng với RecordDate và DividendRateInput).

```csharp
public static DataSet OmnibusDividendTrxInfoX(
    string DBIDStr, string DSIDStr, int iUserID,
    int iOptions, int iOmnibusTrxID, int iMethod, string DateFrom,
    string DateTo, int iTrxTypeOpt, string RecordDate, double fDividendRateInput)
```

**SP**: `OMDividendTrxInfo`

> **Lưu ý**: `RecordDate` chỉ được truyền nếu length == 10 (format `yyyy-MM-dd`). `fDividendRateInput` chỉ truyền nếu != 0.

---

## COmnibus — Reversal (REV)

### OmnibusREVAddFromTrxList

Thêm reversal pending từ danh sách transaction IDs.

```csharp
public static int OmnibusREVAddFromTrxList(
    string DBIDStr, int iUserID, int Lg, string TrxList, int iOptions,
    string PlanID, string TradeDate, int iAOTType, double fAOTAmount,
    string Notes)
```

**SP**: `OmnibusREVAddFromTrxList`

| Param | Mô tả |
|-------|-------|
| `TrxList` | Comma-separated list of transaction IDs |
| `iAOTType` | Loại AOT (Amount-on-Trade) |
| `fAOTAmount` | Số tiền AOT |

---

### REVTrxStatusUpdate

Cập nhật status cho reversal transaction.

```csharp
public static int REVTrxStatusUpdate(
    string DBIDStr, string DSIDStr, int iUserID,
    int iItemID, int iTrxStatus,
    string TradeDate, string SettlementDate, string ProcessingDate,
    double mAmount, double fPrice, double fUnits, string OrderID,
    ref string errorMessage, ref int errorCode, int iOptions,
    bool bApplAll)
```

**SP**: `OMREVTrxStatusUpdate`

| Param | Mô tả |
|-------|-------|
| `bApplAll` | `true` = áp dụng cho tất cả items cùng header |

---

### OmnibusOrderMerge

Gộp nhiều omnibus transactions cùng ngày thành một.

```csharp
public static int OmnibusOrderMerge(
    string DBIDStr, string DSIDStr, int iUserID,
    string MgmtCode, string TradeDate, int iStatusFrom, int iStatusTo,
    int iOptions, ref string errorMessage, ref int errorCode)
```

**SP**: `OMOmnibusMergeTrxOneDay`

---

## COmnibusCompareList — Account Compare

### Constructor

```csharp
public COmnibusCompareList(
    string sDBIDStr, int iDSID, int iUserID,
    int iDefLg, string sEffectiveDate, bool bIncludeInactive,
    bool bRecalc, int iFundPosID)
```

### StartProcess

Chạy đối soát trên background thread.

```csharp
public void StartProcess()
```

### Callbacks

```csharp
public void AddCallBack(FinishCallback finish, ErrorCallback error)
public void AddCallBack(FinishCallback finish, ErrorCallback error, InfoCallback info)
public void AddInfoCallBack(InfoCallback info)
```

### OmnibusCompareListSet (static)

Lấy kết quả đối soát đã tính (Step 3).

```csharp
public static DataSet OmnibusCompareListSet(
    string DBIDStr, int DSID,
    int iUserID, int Lg, string EffectiveDate,
    ref string errorMessage, ref int errorCode, int iOptions)
```

**SP**: `OMAccountCompareStep3`

---

## CPortfolioConversion — Chuyển đổi quỹ

### GetSummaryPendingSet

Xem preview trước khi thực hiện conversion. Có option `bSave` để lưu hoặc chỉ xem.

```csharp
public static DataSet GetSummaryPendingSet(
    string DBIDStr, string DSIDStr,
    int iUserID, int Lg,
    int iOmnibusTrxFrom, int iOmnibusTrxTo,
    ref string errorMessage, ref int errorCode,
    int iOptions, bool bSave, double fBreakageMax)
```

**SP**: `OMConversionAddRefresh`

### ProcessItem / SynchItem / RemoveItem

```csharp
public static int ProcessItem(DBIDStr, DSIDStr, iUserID, Lg, iHeaderID, ...)
public static int SynchItem(DBIDStr, DSIDStr, iUserID, Lg, iHeaderID, ...)
public static int RemoveItem(DBIDStr, DSIDStr, iUserID, Lg, iHeaderID, ...)
```

---

## CPortfolioTransfer — Chuyển tiền

### Add

Tạo transfer mới giữa hai plans.

```csharp
public static int Add(
    string DBIDStr, string DSIDStr, int iUserID, int Lg,
    int iPlanIDFrom, int iPlanIDTo, string TradeDate, string AmountType,
    double fAmount, int iInCash,
    ref string errorMessage, ref int errorCode)
```

**SP**: `OMTransferAdd`

| Param | Mô tả |
|-------|-------|
| `iInCash` | 1 = chuyển bằng tiền mặt, 0 = chuyển in-kind (units) |

### CreateOrder

Tạo orders thực tế từ transfer header.

```csharp
public static int CreateOrder(
    string DBIDStr, string DSIDStr, int iUserID,
    int iTransferHeaderID,
    ref string errorMessage, ref int errorCode, int iOptions)
```

**SP**: `OMTransferProcess`

---

## CPortfolioSwitch — Đổi model portfolio

### SwitchTMPSet

Lấy preview khi switch portfolio model cho một plan.

```csharp
public static DataSet SwitchTMPSet(
    string DBIDStr, string DSIDStr,
    int iUserID, int Lg, int iPlanID, int iSwitchToModelID,
    ref string errorMessage, ref int errorCode, int iOptions)
```

**SP**: `OMPlanSwitchPortfolio`

---

## COMReport — Báo cáo

### WeeklyCalculate

Tính toán báo cáo tuần.

```csharp
public static int WeeklyCalculate(
    string DBIDStr, string DSIDStr,
    int iUserID, int Lg, int iYear, int iWeek, int iOptions,
    bool bRecalc, bool bIncludeTransfer, bool bIncludeFee)
```

**SP**: `OMReportWeeklyCalc`

### MonthlyDAVCalculate

Tính toán Daily Average Value hàng tháng.

```csharp
public static int MonthlyDAVCalculate(
    string DBIDStr, string DSIDStr,
    int iUserID, int Lg, int iYear, int iMonth, int iOptions,
    bool bRecalc)
```

**SP**: `OMReportDAVPortfolioCalc`

### ReportAdvisorSaleSet

Báo cáo doanh số theo advisor.

```csharp
public static DataSet ReportAdvisorSaleSet(
    string DBIDStr, string DSIDStr, int iUserID, int Lg,
    string MgmtCode, string FundID, string FromDate, string ToDate,
    bool bExDividend, bool bExFee,
    ref string errorMessage, ref int errorCode, int iOptions)
```

**SP**: `OMReportSaleByAdvisor`

### ReportAssetByProvSet

Báo cáo tài sản theo tỉnh/bang.

```csharp
public static DataSet ReportAssetByProvSet(
    string DBIDStr, string DSIDStr, int iUserID, int Lg,
    string MgmtCode, string FundID, string EffectiveDate, int iDateOpt,
    string DealerCode,
    ref string errorMessage, ref int errorCode, int iOptions)
```

**SP**: `OMReportAssetByProvince`
