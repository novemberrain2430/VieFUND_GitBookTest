# 03 — Trading & Orders (Module Guide)

> Module giao dịch mua/bán quỹ đầu tư — trái tim của hệ thống VieFUND.
> **Đối tượng**: Developer .NET cần hiểu flow giao dịch end-to-end.

---

## 1. Tổng quan nghiệp vụ

Hệ thống xử lý giao dịch mutual fund, ETF và stock cho các investment dealers tại Canada. Mỗi giao dịch đi qua vòng đời: tạo order → compliance check → gửi FundServ/FIX → nhận phản hồi → settlement.

> **Nguồn**: `FundServ_OrderFlow.docx.md` — "Fund Companies ⬄ FundServ ⬄ Back Office System (like VieFUND)"

---

## 2. Các loại giao dịch (Transaction Types)

| Loại | BLL Method | SP | Mô tả |
|---|---|---|---|
| **Buy** | `CTrx.Buy()` | `UBFundTrxBuy` | Mua units. Client đưa tiền → nhận units |
| **Buy Edit** | `CTrx.BuyEdit()` | `UBFundTrxBuyEdit` | Sửa order Buy đang pending |
| **Sell** | `CTrx.Sell()` | `UBFundTrxSell` | Bán units → nhận tiền |
| **Sell Edit** | `CTrx.SellEdit()` | `UBFundTrxSellEdit` | Sửa order Sell |
| **Switch** | `CTrx.Switch()` | `UBFundTrxSwitch` | Chuyển fund A → fund B cùng company |
| **Switch Edit** | `CTrx.SwitchEdit()` | `UBFundTrxSwitchEdit` | Sửa order Switch |
| **BasketSwitch** | `CTrx.BasketSwitch()` | `UBFundTrxSwitchBasket` | Switch hàng loạt cho nhiều clients |
| **Transfer** | `CTrx.Transfer()` | `UBFundTrxTransfer` | Chuyển giữa plans (internal/external) |
| **Transfer Edit** | `CTrx.TransferEdit()` | `UBFundTrxTransferEdit` | Sửa order Transfer |
| **ICT** | `CTrx.ICT()` | `UBFundTrxICT` | Inter-Company Transfer — chuyển giữa accounts cùng plan |
| **ICT Edit** | `CTrx.ICTEdit()` | `UBFundTrxICTEdit` | Sửa order ICT |
| **Stock/ETF** | `CTrx.StockOrderAdd()` | `UBStockOrderAdd` | Order ETF/stock qua FIX protocol |
| **Manual Trx** | `CTrx.ManualUpdate()` | `UBFundTrxManualAdd/Update` | Nhập giao dịch thủ công (admin) |

> **Nguồn**: `Trx.cs` — methods `Buy()` (L611-739), `Sell()` (L985-1114), `Switch()` (L1232-1356), `Transfer()` (L1592-1707), `ICT()` (L1816-1895), `StockOrderAdd()` (L741-805)

---

## 3. Vòng đời giao dịch (Order Lifecycle)

```
┌─────────┐     ┌──────────────────┐     ┌──────────┐     ┌────────────┐     ┌───────────┐
│ Pending  │────▶│Pending to Receive│────▶│ Accepted │────▶│ Contracted │────▶│ Confirmed │
└─────────┘     └──────────────────┘     └──────────┘     └────────────┘     └───────────┘
    │                   │                      │
    │              ┌────┘                 ┌────┘
    ▼              ▼                      ▼
 [Delete]     [Rejected]             [Rejected]
```

### Chi tiết từng bước

| Bước | Trạng thái | Trigger | Mô tả |
|---|---|---|---|
| 1 | **Pending** | User submit trade | Order được tạo trong DB |
| 2 | **Pending to Receive** | Gửi qua FundServ (Interactive/Batch) | Order rời hệ thống |
| 3a | **Accepted** | Response từ FundServ | Fund company chấp nhận |
| 3b | **Rejected** | Response từ FundServ/Fund Co | Bị từ chối — có error code |
| 4 | **Contracted** | T+1: FS file (settlement file) | Giá (NAV) đã xác định, units tính được |
| 5 | **Confirmed** | T+2: TS file | Settlement hoàn tất |

> **Nguồn**: `FundServ_OrderFlow.docx.md` — "When an order is created: it has 'Pending' status... At T+1... the trx will have the status 'Contracted'... On T+2 TS file comes and the trx status changed to 'Confirmed'"

### Hai chế độ gửi order

| Chế độ | Cách thức | Mô tả |
|---|---|---|
| **Interactive** (Real-time) | IBM MQ | Gửi từng order, response gần như ngay lập tức. Project: `VieFUNDMQLib` |
| **Batch** | XML file (CO file) | Gom orders thành file, upload lên FundServ cuối ngày |

> **Nguồn**: `FundServ_OrderFlow.docx.md` — "Interactive (real time): using IBM Websphere Msg Queue... Batch: order file (called CO file)"

---

## 4. Error Correction (Sửa lỗi giao dịch)

### 4.1. CAX — Cancel

Hủy giao dịch **chưa confirm** (đang Pending/Accepted/Contracted).

### 4.2. REV — Reversal

Đảo ngược giao dịch **đã confirm**. Tạo giao dịch ngược lại.

> **Nguồn**: `ERROR CORRECTION.md` — "REV: reversal is a cancellation of a valid trade. The trade is already settled"

### 4.3. AOT — As of Trade

Order "back-dated" — dùng giá (NAV) của ngày trước đó.

> **Nguồn**: `ERROR CORRECTION.md` — "AOT: As of Trade: basically it is a back dated order. For example: Today is April 25 but I order for April 15 trade date."

### 4.4. Dilution

Chênh lệch giá mà dealer phải chịu khi AOT/REV/CAX:

> **Ví dụ** (từ `ERROR CORRECTION.md`):
> April 15: Joe mua fund "A" 50 units × $10 = $500
> April 25: REV → giá $8 → shortfall = $100 → **dilution = $100** dealer phải trả.

### Code xử lý

```
AllowableAction() → SP UBFundTrxOrderCANCAX
  Returns: iCanDEL, iCanCAN, iCanCAX, iCanREV, iCanCHG, iCanUndo
```

> **Nguồn**: `Trx.cs` L807-858 — `AllowableAction()` method

---

## 5. UI Flow — Tạo giao dịch mới

### Entry point: `PopupTradeAdd.aspx` (156KB markup + 233KB code-behind)

#### 5.1. Layout chính

UI là popup window, chia thành **tabs** cho từng loại giao dịch:

| Tab | View | Controls chính |
|---|---|---|
| **Buy** | `ViewBuy` | Fund account, Amount type, Amount, Settlement, Payment info, Trust account |
| **Sell** | `ViewSell` | Trx type (Sell/Redeem), Amount, Cheque payee info |
| **Switch** | `ViewSwitch` | Account From (current), Account To (dropdown), Amount |
| **Transfer** | `ViewTransfer` | Transfer type, Dealer code, Plan type, SIN, Fund info |
| **ICT** | `ViewICT` | Account From list, Account To list (multi-fund selection) |

> **Nguồn**: `PopupTradeAdd.aspx.cs` L42-54 — tab declarations `idTabBuy`, `idTabSell`, `idTabSwitch`, `idTabTransfer`, `idTabICT`

#### 5.2. Page_Load flow

```
1. Validate page → CBase.IsPageValid()
2. Load client info → CCustomer.UpdateClientInfoHeader()
3. Load dealer settings → Dealer.GetDealershipData()
   → Trả về: iLevel, bNSM, iMember, iTrustAccount
4. Load combos → CBase.LoadSimpleDropDownListArray() with "UBTrxAddComboList"
5. Load plan list → CCustomer.UpdateClientPlanListCB()
6. Set defaults → Settlement, Trust account, Gross/Net
7. Load pending orders → UpdatePendingOrderList()
8. Check access → CBase.IsAccessible("ADD", "ACCOUNT")
```

> **Nguồn**: `PopupTradeAdd.aspx.cs` L424-727 — `Page_Load()` method

#### 5.3. Dealer-specific customizations

Code chứa nhiều DSID hardcode cho từng dealer:

| DSID | Dealer | Customization |
|---|---|---|
| `1911`, `2262` | — | Disable ETF price type/time in force |
| `1256` | EA | Hide SIN/DOB trên order receipt, remove Bulk Cheque/EFT |
| `1623` | — | Hide Fund Fact requirement |
| `1853`, `2301` | Merici, Global | Auto-check CR518_519 |
| `1274`, `1001` | CWM | Show Extra Admin Fee (admin only) |

> **Nguồn**: `PopupTradeAdd.aspx.cs` L445-677

---

## 6. Tham số giao dịch quan trọng

### 6.1. Buy parameters (CTrx.Buy — 40+ params)

| Nhóm | Params | Mô tả |
|---|---|---|
| **Core** | `iClientID`, `iPlanID`, `iPositionID`, `fAmount`, `AmtType` | Ai mua, ở plan nào, fund nào, bao nhiêu |
| **Settlement** | `SettlementInd` (G/N), `SettlementStatus`, `SettlementSource` (D/I/F), `SettlementMethod` | Thanh toán gross/net, dealer/intermediary/fund settled |
| **Compliance** | `bTrxLeveraged`, `bPEFP`, `bUnsolicited`, `bForceApproved`, `bForceRisk` | Flags compliance |
| **AOT** | `bAOT`, `AOTDateStr`, `bAOTOrginalOrder`, `AOTDilution` | As-of-trade params |
| **Trust** | `bTrust`, `iTrustID` | Trust account settlement |
| **Payment** | `iPMTType`, `iBankAccountID`, `BankCode`, `BankTransitNumber`... | EFT/Cheque details |
| **ETF** | `ETFOrderType`, `ETFTimeInForce`, `ETFExpiryDate`, `mETFPriceLimit`, `mETFPriceStop` | ETF-specific |

> **Nguồn**: `Trx.cs` L611-710 — `Buy()` method signature và SP params

### 6.2. Switch đặc biệt

Switch có thêm: `iPositionIDFrom`, `iPositionIDTo`, `TaxEventInd`, `iForceOpt`

```csharp
// iForceOpt: 1 switch from DSC to FEL, 2 currency switch
```

> **Nguồn**: `Trx.cs` L1249 — comment trong `Switch()` method

### 6.3. Transfer đặc biệt

Transfer có `iMethod` (internal/external) và thông tin bên nhận: `DealerCodeFrom`, `DealerAcctIDFrom`, `FundAcctIDFrom`, `SIN1From`, `PlanDesignationFrom`, `IntermediaryCodeFrom`...

> **Nguồn**: `Trx.cs` L1592-1607 — `Transfer()` method signature

---

## 7. ETF/Stock Trading

ETF không đi qua FundServ mà qua **FIX protocol** đến stock exchange.

### Đặc điểm

- Dealer có **omnibus account** tại trading company
- Orders có thể gộp (bundled) nếu cùng symbol + properties
- Chỉ whole units (không fraction)
- Fund products có `MgmtCode = "ETF"`, `FundID = Symbol/Ticker`
- Order types: Market, Limit, Stop, Stop-Limit (bảng `UB_Def_StockOrderType`)
- TimeInForce: Day, Good Till Cancel, Good Till Day (bảng `UB_Def_StockTimeInForce`)

> **Nguồn**: `ETF Transfer.docx.md` — "ETF is traded on stock exchange... the trades do not go through FundServ, instead it goes via a third-party stock trading company"

### ETF Transfer rules

- Transfer giữa nominee plans cùng client
- Chỉ cho phép trade date = last business date
- Amount type: Units, %, $
- Tạo 2-sided trx: Transfer Out + Transfer In
- Cross plan-type transfer có tax implications:
  - OPEN → Registered: set Taxable flag trên To side
  - Registered → OPEN: flag trên Transfer Out
  - TFSA → RRSP: flag cả 2 sides

> **Nguồn**: `ETF Transfer.docx.md` L23-81

---

## 8. Pending Orders Management

### Xem pending orders

```
CTrx.GetPendingOrderList() → SP UBTrxPendingOrderList
CTrx.GetOrderPendingSet()  → SP UBOrderPendingList
```

### Actions trên pending orders

| Method | SP | Mô tả |
|---|---|---|
| `OrderPendingMove2Waiting()` | — | Chuyển orders sang trạng thái Waiting |
| `OrderPending2Confirm()` | — | Confirm orders (admin) |
| `OrderPendingMove2BBS()` | — | Chuyển sang BBS (Batch) |
| `TrxOrderDelete()` | — | Xóa order |
| `TrxDeleteOrUndo()` | — | Xóa hoặc undo order |
| `TrxOrderCANCAX()` | `UBFundTrxOrderCANCAX` | Cancel/CAX order |

> **Nguồn**: `Trx.cs` — public method signatures (extracted via grep)

---

## 9. Transaction View & Search

| Page | Size | Chức năng |
|---|---|---|
| `TrxView.aspx` | 104KB/96KB | Xem danh sách transactions với search, sort, paging |
| `TrxConfirmationView.aspx` | 66KB/69KB | Xem chi tiết confirmation |
| `PopupTradeEdit.aspx` | 79KB/151KB | Sửa order đang pending |
| `PopupPlanTrx.aspx` | 40KB/34KB | Xem transactions của plan |

Search flow: `CTrx.GetViewList()` → SP `UBTrxViewSearch` với params: FileID, Name, Phone, PlanNumber, AccountNumber, WONumber, DateRange, TrxStatus, TrxType, Currency, paging/sorting.

> **Nguồn**: `Trx.cs` L2040-2165 — `GetViewList()` method

---

## 10. Manual Transactions

Admin có thể nhập giao dịch thủ công (VD: import từ hệ thống cũ, adjustment):

```
CTrx.ManualUpdate() → SP UBFundTrxManualAdd (new) / UBFundTrxManualUpdate (edit)
```

Manual trx có thêm: `fGAmount`, `fNAmount`, `fPrice`, `fUnits`, `fSettledAmount`, `TradeDate`, `ProcessingDate`, `SettlementDate`, commission fields, DSC, fees, tax, dilution...

> **Nguồn**: `Trx.cs` L3056-3075 — `ManualUpdate()` signature. SP name selected at L3080: `iTrxID > 0 ? "UBFundTrxManualUpdate" : "UBFundTrxManualAdd"`

---

## 11. Stored Procedures liên quan

65 SPs được gọi từ `Trx.cs`. Các nhóm chính:

| Prefix | Số lượng | Chức năng |
|---|---|---|
| `UBFundTrx*` | 18 | Core trading: Buy/Sell/Switch/Transfer/ICT + Edit/Basket variants |
| `UBTrx*` | 18 | View, search, pending list, info, status |
| `UBOrder*` | 7 | Order management: pending, conversion, history |
| `UBAA*` | 15 | Asset Allocation & Rebalancing |
| `UBBasket*` | 5 | Basket operations |
| `UBStock*` | 1 | Stock/ETF order |

> **Nguồn**: Extracted via `Select-String -Pattern 'db.SetSP' Trx.cs` — 65 unique SP names

---

## 12. Related UI Pages

| Page | Size (KB) | Chức năng |
|---|---|---|
| `PopupTradeAdd.aspx(.cs)` | 156 / 233 | **Tạo trade mới** — entry point chính |
| `PopupTradeEdit.aspx(.cs)` | 79 / 151 | Sửa trade pending |
| `PopupTradeBasket.aspx(.cs)` | 116 / 174 | Basket trading (multi-client switch) |
| `TrxView.aspx(.cs)` | 104 / 96 | Transaction search & view |
| `TrxConfirmationView.aspx(.cs)` | 66 / 69 | Chi tiết confirmation |
| `PopupTrxManualAdd.aspx(.cs)` | 1 / 57 | Nhập manual transaction |
| `PopupPlanTrx.aspx(.cs)` | 40 / 34 | Plan transactions |
| `TrxApprovalBox.aspx(.cs)` | 4 / 5 | Compliance approval |
| `PanelTrxViewSearch.aspx(.cs)` | 16 / 8 | Search panel |
| `PanelStockTrxEdit.aspx(.cs)` | 12 / 17 | ETF/Stock order edit |

> **Nguồn**: File listing từ `WebApp/Main/` directory

---

## 13. Settlement (Thanh toán)

### Settlement Indicator (Gross/Net)

- **G (Gross)**: Dealer thanh toán toàn bộ số tiền cho fund company
- **N (Net)**: Trừ commission trước khi thanh toán

### Settlement Source

- **D (Dealer)**: Dealer settled — tiền đi qua dealer
- **I (Intermediary)**: Intermediary settled
- **F (Fund)**: Fund company settled trực tiếp

### Settlement Method

| Value | Method |
|---|---|
| 1 | Net Settlement (N$M) |
| 2 | Bulk Cheque |
| 3 | Individual Cheque |
| 4 | Bulk EFT |
| 5 | Individual EFT |

> **Nguồn**: `PopupTradeAdd.aspx.cs` L679-689 — settlement method dropdown manipulation; `Trx.cs` — `SettlementInd`, `SettlementSource`, `SettlementMethod` params

---

## 14. Pricing

| Loại sản phẩm | Cách định giá | Thời điểm |
|---|---|---|
| **Mutual Fund** | NAV (fund company đánh giá sau 4pm) | Tối cùng ngày hoặc sáng hôm sau |
| **ETF** | Giá sàn (market price) | Real-time khi order executed |
| **GIC** | Rate hàng ngày (từ CANNEX) | Import sáng, valid cả ngày |

> **Nguồn**: `FundServ_OrderFlow.docx.md` — "Mutual fund price is evaluated after 4 pm... ETF: it is like stock... GIC: the product rate is updated on a daily basis"

---

## 15. Cross-references

| Tài liệu | Liên quan |
|---|---|
| `Domain Glossary` | Định nghĩa thuật ngữ: Trx, NAV, Settlement, AOT, REV... |
| `System Map` | Vị trí `Trx.cs` trong architecture |
| `ERROR CORRECTION.md` | AOT/REV/CAX chi tiết + ví dụ dilution |
| `FundServ_OrderFlow.docx.md` | Order lifecycle, pricing, FundServ modes |
| `ETF Transfer.docx.md` | ETF transfer rules, omnibus, FIX protocol |
