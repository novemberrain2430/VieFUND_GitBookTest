# Fund & GIC — Module Guide

> Module quản lý danh mục sản phẩm đầu tư: Mutual Fund và GIC (Guaranteed Investment Certificate).
> **Đối tượng**: Developer cần hiểu cấu trúc sản phẩm, cơ chế tìm kiếm, giá, KYP và CANNEX integration.

---

## 1. Loại sản phẩm

| FundType | Tên | Mô tả |
|---|---|---|
| `M` | Mutual Fund | Quỹ tương hỗ (open-end funds) |
| `G` | GIC | Guaranteed Investment Certificate — lãi suất cố định |
| `E` | ETF | Exchange Traded Fund — giao dịch như cổ phiếu |
| `S` | Segregated Fund | Quỹ tách biệt (bảo hiểm) |

Mỗi sản phẩm định danh bằng `MgmtCode` (fund company) + `FundID`.

---

## 2. Fund Definition

### 2.1. Fields chính

| Nhóm | Fields |
|---|---|
| **Định danh** | `MgmtCode`, `FundID`, `FundName`, `Symbol` |
| **Phân loại** | `FundType`, `FundClass` (FSCode), `FundLoadType` (FEL/DSC/NL/LL) |
| **Trạng thái** | `FundStatus`, `bApproved`, `bNomineeApproved` |
| **Tài chính** | `fPrice`, `Currency`, `MER`, `fRoR1/2/3` |
| **Đặc tính** | `bRRSP`, `bUS`, `bFeeBased`, `bOffShore` |
| **Rủi ro** | `RiskRating`, `InvestmentObjective` |

> **Nguồn**: `UBClasses/FundDef.cs` L897-1029 — `GetFundList()`

### 2.2. Fund Info Dataset

SP `UBFundInfo` trả về multi-table DataSet:

| Table | Nội dung |
|---|---|
| `FundInfo` | Thông tin cơ bản (tên, giá, load type, MER) |
| `FundRisk` | Risk profile |
| `FundAA` | Asset Allocation (% Equity, Bond, Cash) |
| `FundPrice` | Lịch sử giá gần nhất |
| `FundFact` | Fund Fact Sheet params |

### 2.3. Fund Search

```
CFundDef.GetFundListSearch()  → SP UBFundSearchList
  Params: FundType, FundLoadType, MgmtCode, FundID, FundName, RiskRating

CFundDef.GetFundListSearchX() → SP UBFundSearchXList
  Thêm: iInvestmentObjective, iMERRange, iPageSize, iPage
```

### 2.4. Fund Price Management

| PriceType | Mô tả |
|---|---|
| 1 | NAV Price |
| 2 | Distribution Rate |
| 3 | Distribution |
| 5 | Income Distribution |
| 8 | Yield |

```csharp
CFundDef.GetFundPriceListSet(..., iFundID, iPriceType, DateFrom, DateTo)
// → SP: UBFundPriceList
```

### 2.5. Fund Approval

```csharp
CFundDef.ApproveFundList(..., bApproved, bNomineeApproved)
// → SP: UBFundListSetNomineeApprove
```

### 2.6. Fund Favorites

```
CFundDef.AddFavorite()    → SP UBFundFavoriteAdd
CFundDef.RemoveFavorite() → SP UBFundFavoriteRemove
CFundDef.GetFundListFavorite() → SP UBFundFavoriteList
```

---

## 3. GIC (Guaranteed Investment Certificate)

### 3.1. Đặc điểm

- Có **Maturity Date** (ngày đáo hạn)
- Có **Interest Rate** cố định từ nhà phát hành
- Đặt mua qua hệ thống CANNEX (sàn GIC điện tử Canada)

### 3.2. GIC Rate Search (CANNEX)

```
CFundDef.GICProdRateSearch() → SP UBGICProdRateSearch
  Params: MgmtCode, Term, RateType, MinRate, iSortOpt, iPageSize

CFundDef.GICProdRateInfo()   → SP UBGICProdRateInfo
  Returns: rate, term, maturity details per product
```

### 3.3. GIC Order

```
CannexOrder.GetPending()        → SP UBCannexGetPending
CannexOrder.GetOneItemAddress() → SP UBCannexGetOneItemAddress
SP UBGICCalcMaturity            → Tính toán maturity value
```

**UI**: `PopupGICAdd.aspx` (104KB), `GICView.aspx`, `PanelCannexOrder.aspx`

### 3.4. GIC Maturity Tracking

```
FundAccount.GetDailyMaturityCount() → SP UBDailyMaturityGetCount
```

---

## 4. Fund Account & Position

### 4.1. Fund Account

```
FundAccount.GetFundAccInfo()         → SP UBFundAccInfo
FundAccount.GetAccountViewSearch()   → SP UBAccountViewSearch
FundAccount.GetFundAccountPlanList() → SP UBPlanFundAccountList
```

### 4.2. Fund Position (Holdings)

```
FundAccount.GetFundAccountPosList()  → SP UBFundAccountPosList
FundAccount.GetFundPosInfo()         → SP UBFundPosInfo
```

Mỗi position: `iFundPosID`, `MgmtCode`, `FundID`, số units, market value, `AvgCostBasis`.

### 4.3. Average Cost Basis (ACB)

```
FundAccount.GetFundAccountPosAvCostList() → SP UBFundAccountPosAvCostList
FundAccount.UpdateAvgCostItem()           → SP UBFundAccountPosAvgCostItemUpdate
FundAccount.RemoveAvgCostItem()           → SP UBFundAccountPosAvgCostItemRemove
```

---

## 5. KYP — Know Your Product

Compliance: Rep phải review và chứng minh hiểu sản phẩm trước khi bán cho client.

### 5.1. Fund Compare List

```
CFundDef.GetCurrentCompareList()         → SP UBKYPCompareListCurrent
CFundDef.GetCurrentCompareList_Client()  → SP UBKYPCompareListCurrent_Client
  Params: iClientID, iPlanID, iFundPosID, PlanType, bSave, ReviewDate, SaveCode
```

Khi `bSave = true`, review được lưu kèm `ReviewDate` và `SaveCode`.

### 5.2. Fund Change Audit Trail

```
CFundDef.GetProductAuditTrailSet()    → SP UBKYPFundDefChangeList
CFundDef.GetProductAuditTrailSetX()   → SP UBKYPFundDefChangeListX
```

### 5.3. Compliance Update

```csharp
CFundDef.ComplianceUpdate(..., bObjApproved, Risk, iObj, iObj1..iObj5)
// → SP: UBFundUpdateInvObj
// Trigger audit trail khi Risk hoặc Investment Objective thay đổi
```

---

## 6. External Integrations

### 6.1. Fundata Canada (Price & Performance)

```
Fundata.GetFDFileList()        → SP UBFDFileList
Fundata.UpdateOneDoc()         → SP UBFundFactFDUpdateOneDoc
// Import workflow: Download → UBFDFileAdd → Process → UBFundDefPerformanceUpdate
```

### 6.2. CANNEX (GIC Orders)

Điện tử submit GIC orders qua CANNEX API.

---

## 7. Fund Fact Sheet (PDF)

```
CFundDef.FundFactInfoSet()     → SP UBFundFactInfo
  Params: MgmtCode, FundID, iOptions, iClientLg (EN=2/FR=1)

// VieFUNDPdf/CAssetByFund.cs — sinh PDF Fund Fact Sheet
```

---

## 8. UI Entry Points

| Page | Size (KB) | Vai trò |
|---|---|---|
| `FundSetup.aspx(.cs)` | —/151 | Quản lý Fund Definition |
| `PopupFundDefEdit.aspx(.cs)` | —/64 | Edit thông tin fund |
| `GICView.aspx(.cs)` | —/94 | Xem GIC positions |
| `PopupGICAdd.aspx(.cs)` | —/104 | Thêm GIC order (CANNEX) |
| `PanelCannexOrder.aspx(.cs)` | —/48 | CANNEX pending orders |
| `PanelFundPicker.aspx(.cs)` | —/30 | Fund picker popup (dùng chung) |
| `PanelFundCompareAdd.aspx(.cs)` | —/26 | Thêm fund vào compare list |

---

## 9. BLL Classes

| Class | File | Size | Vai trò |
|---|---|---|---|
| `CFundDef` | `UBClasses/FundDef.cs` | 185KB | Fund/GIC definition, KYP, price |
| `FundAccount` | `UBClasses/FundAccount.cs` | 129KB | Account, position, ACB management |
| `Fundata` | `UBClasses/Fundata.cs` | 59KB | Fundata data import |
| `CannexOrder` | `UBFFImport/CannexOrder.cs` | 51KB | CANNEX GIC order submission |

**PDF Classes**: `CAssetByFund.cs` (155KB), `GIC.cs` (58KB), `GICConfirmation.cs` (44KB)

---

## 10. Stored Procedures chính

### Fund Definition (~60 SPs)

| Nhóm | SPs |
|---|---|
| **List/Search** | `UBFundList`, `UBFundSearchList`, `UBFundSearchXList`, `UBFundListGIC`, `UBFundListETF` |
| **Info** | `UBFundInfo`, `UBFundInfoEdit`, `UBFundInfoShort` |
| **Price** | `UBFundPriceList`, `UBFundDefPerformanceUpdate` |
| **GIC** | `UBGICDefInfo`, `UBGICCalcMaturity`, `UBGICProdRateSearch`, `UBGICProdRateInfo` |
| **Risk** | `UBFundDefRiskList`, `UBFundUpdateInvObj` |
| **Favorites** | `UBFundFavoriteAdd`, `UBFundFavoriteList`, `UBFundFavoriteRemove` |
| **Fund Fact** | `UBFundFactInfo`, `UBFundFactInfoByID` |

### KYP (~20 SPs)

| Nhóm | SPs |
|---|---|
| **Compare List** | `UBKYPCompareListCurrent`, `UBKYPCompareListCurrent_Client`, `UBKYPCompareListHistory` |
| **Audit** | `UBKYPFundDefChangeList`, `UBKYPFundDefChangeListX`, `UBKYPFundDefChangeListXAccount` |
| **Audit Trail Review** | `UBKYPAuditTrailReviewAdd`, `UBKYPAuditTrailReviewListHistory` |

### Fund Account & Position (~40 SPs)

| Nhóm | SPs |
|---|---|
| **Account** | `UBFundAccInfo`, `UBPlanFundAccountList`, `UBAccountViewSearch` |
| **Position** | `UBFundAccountPosList`, `UBFundPosInfo`, `UBFundAccountPositionActivate` |
| **ACB** | `UBFundAccountPosAvCostList`, `UBFundAccountPosAvgCostItemUpdate/Remove` |
| **Maturity** | `UBDailyMaturityGetCount` |

---

## 11. Kiến trúc tổng kết

```
UI Layer
  FundSetup.aspx ── Fund search, edit, KYP, price
  GICView.aspx   ── GIC positions + CANNEX orders
        │
BLL Layer
  CFundDef     ── Fund/GIC definition, KYP, price, favorites
  FundAccount  ── Account, position, ACB, service fee
  Fundata      ── Price/performance import (Fundata Canada)
  CannexOrder  ── GIC order submission via CANNEX
        │
DB Layer
  ~120 SPs (UBFund*, UBGIC*, UBKYP*, UBFD*)

External Systems:
  Fundata Canada ── Price, MER, RoR data feed
  CANNEX ─────────── GIC rate feed + electronic order submission
```

---

## 12. Cross-references

| Tài liệu | Liên quan |
|---|---|
| [Domain Glossary](../../getting-started/domain-glossary.md) | MgmtCode, FundID, GIC, FEL/DSC/NL, KYP |
| [Trading & Orders](../trading-orders/module-guide.md) | Trading dùng FundID/MgmtCode để tạo Buy/Sell |
| [Commission & Fee](../commission-fee/module-guide.md) | Fee for Service tính trên AUA của Fund Positions |
| [Client & KYC](../client-kyc/module-guide.md) | KYP gắn với Client Plan — iPlanID trong Compare List |
| [System Map](../../getting-started/system-map.md) | Vị trí `FundDef.cs`, `FundAccount.cs` trong architecture |
