# 03 — Trading & Orders (Module Guide)

> Module giao dịch mua/bán quỹ đầu tư — trái tim của hệ thống VieFUND.
> **Đối tượng**: Developer .NET cần hiểu flow giao dịch end-to-end.

> **Tài liệu source-audit chuyên sâu**: [Order end-to-end](order-end-to-end.md) nối UI/BLL/SP/DB và [Order Code Dictionary](code-dictionary.md) giải thích `Ret`, FundServ code, status/action/type cùng DSID/dealer hard-code. Hai file này là nguồn ưu tiên khi cần xác minh runtime behavior; phần narrative cũ bên dưới dùng để đọc tổng quan module.

---

## 1. Tổng quan nghiệp vụ

Hệ thống xử lý giao dịch mutual fund, ETF và stock cho các investment dealers tại Canada. Mỗi giao dịch đi qua vòng đời: tạo order → compliance check → gửi FundServ/FIX → nhận phản hồi → settlement.

> **Nguồn**: `business-logic-topics/fundserv-order-flow.md` — "Fund Companies ⬄ FundServ ⬄ Back Office System (like VieFUND)"

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

> **Nguồn**: `UBClasses/Trx.cs` — methods `Buy()` (L598-740), `Sell()` (L985-1114), `Switch()` (L1232-1357), `Transfer()` (L1592-1708), `ICT()` (L1816-1895), `StockOrderAdd()` (L741-806), `ManualUpdate()` (L3058-3075)

---

## 3. Vòng đời giao dịch (Order Lifecycle)

```
┌─────────┐     ┌──────────────────┐     ┌──────────┐     ┌────────────┐     ┌───────────┐
│ Pending │────▶│Pending to Receive│────▶│ Accepted │────▶│ Contracted │────▶│ Confirmed │
└─────────┘     └──────────────────┘     └──────────┘     └────────────┘     └───────────┘
     │                  │                     │            T+1 (FS file)     T+2 (TS file)
     │             ┌────┘                ┌────┘                                    ▲
     ▼             ▼                     ▼                                         │
 [Delete]      [Rejected]           [Rejected]         non-cash trx: T+1 ──────────┘
                                                       (bỏ qua Contracted)
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

> ⚠️ **Ngoại lệ non-cash trx**: khi xử lý FS file ở T+1, chỉ cash trx mới chuyển sang `Contracted`. **Non-cash trx nhảy thẳng sang `Confirmed`**, không đi qua `Contracted` và không chờ TS file ở T+2.

> **Nguồn**: `business-logic-topics/fundserv-order-flow.md` — "FS file is the settlement file. The trx will have the status 'Contracted' except non-cash trx, which will have the Status 'Confirmed'... On T+2 TS file comes and the trx status changed to 'Confirmed'"

### Hai chế độ gửi order

| Chế độ | Cách thức | Mô tả |
|---|---|---|
| **Interactive** (Real-time) | IBM MQ | Gửi từng order, response gần như ngay lập tức. Project: `VieFUNDMQLib` |
| **Batch** | XML file (CO file) | Gom orders thành file, upload lên FundServ cuối ngày |

> **Nguồn**: `business-logic-topics/fundserv-order-flow.md` — "Interactive (real time): using IBM Websphere Msg Queue... Batch: order file (called CO file)"

---

## 4. Error Correction (Sửa lỗi giao dịch)

### 4.1. CAX — Cancel

Hủy giao dịch đã **Contracted nhưng chưa settle**.

Lưu ý phân biệt: order còn ở trạng thái `Pending` thì dùng **DEL** (xóa) hoặc **CAN** (cancel), không phải CAX. `AllowableAction()` trả về `iCanDEL`, `iCanCAN`, `iCanCAX` là ba flag riêng biệt — mỗi trạng thái order cho phép một tập action khác nhau.

> **Nguồn**: `business-logic-topics/error-correction.md` — "When cancelling a contract trade (not settled yet), then that action is CAX"

### 4.2. REV — Reversal

Đảo ngược giao dịch **đã settle**. Tạo giao dịch ngược lại.

> **Nguồn**: `business-logic-topics/error-correction.md` — "REV: reversal is a cancellation of a valid trade. The trade is already settled"

### 4.3. AOT — As of Trade

Order "back-dated" — dùng giá (NAV) của ngày trước đó.

> **Nguồn**: `business-logic-topics/error-correction.md` — "AOT: As of Trade: basically it is a back dated order. For example: Today is April 25 but I order for April 15 trade date."

### 4.4. Dilution

Chênh lệch giá mà dealer phải chịu khi AOT/REV/CAX:

> **Ví dụ** (từ `business-logic-topics/error-correction.md`):
> April 15: Joe mua fund "A" 50 units × $10 = $500
> April 25: REV → giá $8 → shortfall = $100 → **dilution = $100** dealer phải trả.

### Code xử lý

```
AllowableAction() → SP UBFundTrxOrderCANCAX
  Returns: iCanDEL, iCanCAN, iCanCAX, iCanREV, iCanCHG, iCanUndo
```

Ngoài các flag trên, SP còn trả `iReasonID`, `iOrderStatus`, `WONumber`.

> **Nguồn**: `Trx.cs` L807-858 — `AllowableAction()` method (SP set tại L820)

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

> **Nguồn**: `WebApp/Main/PopupTradeAdd.aspx.cs` L42-54 — tab declarations `idTabBuy`, `idTabSell`, `idTabSwitch`, `idTabTransfer`, `idTabICT`. Có thêm `idTabRisk` (L59) không thuộc nhóm trade type.

#### 5.2. Page_Load flow

Toàn bộ phần dưới đây nằm trong nhánh `if (!IsPostBack)`:

```
L427  1. Validate page   → CBase.IsPageValid(this, "PageClose.aspx", 0, Lg, 0, false)
L469  2. Load combos     → CBase.LoadSimpleDropDownListArray(this, "UBTrxAddComboList", ...)
L472  3. Dealer settings  → Dealer.GetDealershipData(ref iLevel, ref bNSM, ref iMember, ref iTrustAccount)
L445+ 4. Dealer-specific customizations theo DSID (xem 5.3)
L564  5. Load client info → CCustomer.UpdateClientInfoHeader()
L614  6. Load plan list   → CCustomer.UpdateClientPlanListCB()
L617  7. Set defaults     → UpdateSettlementMethodBox(0), ReloadBankAccountList()
L620  8. Load pending     → UpdatePendingOrderList() + UpdateTrxList(0) + UpdateTrxList(1)
L638  9. Check access     → CBase.IsAccessible(this, Lg, "ADD", "ACCOUNT", true)
                          + CBase.IsDisable(this, Lg, "", "TRADING", true)
```

> ⚠️ Combos và dealer settings được load **trước** client info, không phải sau. Nhiều đoạn customization theo DSID chạy xen giữa các bước này nên thứ tự dòng không liên tục.

> **Nguồn**: `WebApp/Main/PopupTradeAdd.aspx.cs` L424-728 — `Page_Load()` method

#### 5.3. Dealer-specific customizations

Code chứa nhiều DSID hardcode cho từng dealer:

| DSID | Dealer | Customization |
|---|---|---|
| `1911`, `2262` | — | Disable ETF price type/time in force |
| `1256` | EA | Hide SIN/DOB trên order receipt, remove Bulk Cheque/EFT |
| `1623` | — | Hide Fund Fact requirement |
| `1853`, `2301` | Merici, Global | Auto-check CR518_519 |
| `1274`, `1001` | CWM | Show Extra Admin Fee (admin only) |

DSID `1911` còn xuất hiện ở nhiều chỗ khác ngoài `Page_Load` — luôn force Gross khi Buy (`ForceGrossBuy()` tại L536, L734, L1146, L1730, L1760). DSID `1912` force Intermediary settled khi dùng trust account (L748).

> **Nguồn**: `PopupTradeAdd.aspx.cs` L445-677 (`Page_Load`), L5251 (`1853`/`2301` skip validation)

---

## 6. Tham số giao dịch quan trọng

### 6.1. Buy parameters (CTrx.Buy — ~62 params)

| Nhóm | Params | Mô tả |
|---|---|---|
| **Core** | `iClientID`, `iPlanID`, `iPositionID`, `fAmount`, `AmtType` | Ai mua, ở plan nào, fund nào, bao nhiêu |
| **Settlement** | `SettlementInd` (G/N), `SettlementStatus`, `SettlementSource` (D/I/F), `SettlementMethod` | Thanh toán gross/net, dealer/intermediary/fund settled |
| **Compliance** | `bTrxLeveraged`, `bPEFP`, `bUnsolicited`, `bForceApproved`, `bForceRisk` | Flags compliance |
| **AOT** | `bAOT`, `AOTDateStr`, `bAOTOrginalOrder`, `AOTDilution` | As-of-trade params |
| **Trust** | `bTrust`, `iTrustID` | Trust account settlement |
| **Payment** | `iPMTType`, `iBankAccountID`, `BankCode`, `BankTransitNumber`... | EFT/Cheque details |
| **ETF** | `ETFOrderType`, `ETFTimeInForce`, `ETFExpiryDate`, `mETFPriceLimit`, `mETFPriceStop` | ETF-specific |

> **Nguồn**: `Trx.cs` L598-616 — `Buy()` method signature; L633-710 — `AddParam()` mapping sang SP `UBFundTrxBuy`

### 6.2. Switch đặc biệt

Switch có thêm: `iPositionIDFrom`, `iPositionIDTo`, `TaxEventInd`, `iForceOpt`

```csharp
// iForceOpt: 1 switch from DSC to FEL, 2 currency switch
```

> **Nguồn**: `Trx.cs` L1250 — comment trong `Switch()` method

### 6.3. Transfer đặc biệt

Transfer có `iMethod` (internal/external) và thông tin bên nhận: `DealerCodeFrom`, `DealerAcctIDFrom`, `FundAcctIDFrom`, `SIN1From`, `PlanDesignationFrom`, `IntermediaryCodeFrom`...

> **Nguồn**: `Trx.cs` L1592-1609 — `Transfer()` method signature

---

## 7. ETF/Stock Trading

ETF không đi qua FundServ mà qua **FIX protocol** đến stock exchange.

### Đặc điểm

- Dealer có **omnibus account** tại trading company
- Orders có thể gộp (bundled) nếu cùng symbol + properties
- Chỉ whole units (không fraction)
- Fund products có `MgmtCode = "ETF"`, `FundID = Symbol/Ticker`
- Order side: bảng `UB_Def_StockSide` (chỉ dùng Buy/Sell, không dùng hết các side)
- Order types: bảng `UB_Def_StockOrderType` — dealers **chỉ dùng** Market, Limit, Stop, Stop-Limit (bảng còn nhiều loại khác)
- TimeInForce: bảng `UB_Def_StockTimeInForce` — dealers **chỉ dùng** Day, Good Till Cancel, Good Till Day

> **Nguồn**: `business-logic-topics/etf-transfer.md` — "ETF is traded on stock exchange... the trades do not go through FundServ, instead it goes via a third-party stock trading company"

### ETF Transfer rules

- Transfer giữa nominee plans cùng client
- Chỉ cho phép trade date = last business date
- Amount type: Units, %, $
- Tạo 2-sided trx: Transfer Out + Transfer In
- Cross plan-type transfer có tax implications:
  - OPEN → Registered: set Taxable flag trên To side
  - Registered → OPEN: flag trên Transfer Out
  - TFSA → RRSP: flag cả 2 sides

> **Nguồn**: `business-logic-topics/etf-transfer.md` — phần "Transfer:" trở xuống

---

## 8. Pending Orders Management

### Xem pending orders

```
CTrx.GetPendingOrderList() → SP UBTrxPendingOrderList   (L2447, SP tại L2498)
CTrx.GetOrderPendingSet()  → SP UBOrderPendingList      (L3855, SP tại L3879)
```

### Actions trên pending orders

| Method | SP | Mô tả |
|---|---|---|
| `OrderPendingMove2Waiting()` | `UBOrderWaiting2SendAdd` | Chuyển orders sang trạng thái Waiting |
| `OrderPending2Confirm()` | `UBOrderSetConfirmTaggedItems` | Confirm orders (admin) |
| `OrderPendingMove2BBS()` | `UBOrderWaiting2BBSOrder` | Chuyển sang BBS (Batch) |
| `TrxOrderDelete()` | `UBTrxOrderRemove` | Xóa order |
| `TrxDeleteOrUndo()` / `TrxDeleteOrUndo2()` | `UBTrxDeleteOrUndo` | Toggle: valid ⬄ deleted |
| `TrxOrderCANCAX()` | `UBFundTrxCancel` | Cancel/CAX order (`iOptions` = action) |
| `AllowableAction()` | `UBFundTrxOrderCANCAX` | **Chỉ query** action nào được phép, không thực thi |

> ⚠️ Dễ nhầm: `UBFundTrxOrderCANCAX` **không** phải SP của `TrxOrderCANCAX()`. Nó thuộc `AllowableAction()` (L820) và chỉ trả về các flag cho phép. SP thực thi cancel là `UBFundTrxCancel` (L3338).

> **Nguồn**: `Trx.cs` — `TrxOrderDelete()` L3228, `TrxDeleteOrUndo()` L3280, `TrxOrderCANCAX()` L3335, `OrderPendingMove2Waiting()` L3968, `OrderPending2Confirm()` L4026, `OrderPendingMove2BBS()` L4084

---

## 9. Transaction View & Search

| Page | Size | Chức năng |
|---|---|---|
| `TrxView.aspx` | 104KB/96KB | Xem danh sách transactions với search, sort, paging |
| `TrxConfirmationView.aspx` | 66KB/69KB | Xem chi tiết confirmation |
| `PopupTradeEdit.aspx` | 79KB/151KB | Sửa order đang pending |
| `PopupPlanTrx.aspx` | 40KB/34KB | Xem transactions của plan |

Search flow: `CTrx.GetViewList()` → SP `UBTrxViewSearch` với params: FileID, Name, Phone, PlanNumber, AccountNumber, WONumber, DateRange, TrxStatus, TrxType, Currency, paging/sorting.

> **Nguồn**: `Trx.cs` L2054-2062 — `GetViewList()` signature; SP `UBTrxViewSearch` set tại L2082

---

## 10. Manual Transactions

Admin có thể nhập giao dịch thủ công (VD: import từ hệ thống cũ, adjustment):

```
CTrx.ManualUpdate() → SP UBFundTrxManualAdd (new) / UBFundTrxManualUpdate (edit)
```

Manual trx có thêm: `fGAmount`, `fNAmount`, `fPrice`, `fUnits`, `fSettledAmount`, `TradeDate`, `ProcessingDate`, `SettlementDate`, commission fields, DSC, fees, tax, dilution...

> **Nguồn**: `Trx.cs` L3058-3075 — `ManualUpdate()` signature. SP name chọn tại L3080: `iTrxID > 0 ? "UBFundTrxManualUpdate" : "UBFundTrxManualAdd"`. Ngoài ra có `UBFundTrxManualCalc` (L3012) để tính trước units/amount.

---

## 11. Stored Procedures liên quan

**81 SP** duy nhất được gọi từ `Trx.cs`. Các nhóm chính:

| Prefix | Số lượng | Chức năng |
|---|---|---|
| `UBTrx*` | 26 | View, search, pending list, info, status, schedule |
| `UBFundTrx*` | 20 | Core trading: Buy/Sell/Switch/Transfer/ICT + Edit/Basket/Manual variants |
| `UBOrder*` | 19 | Order management: pending, waiting, conversion, history, status |
| `UBBasket*` | 7 | Basket operations |
| `UBStock*` | 1 | Stock/ETF order (`UBStockOrderAdd`) |
| Khác | 8 | `UBPlanTrxList`, `UBPlanMFList`, `UBMFTrxListWithAvgCost`, `UBScheduleRunList`, `UBTradePermissionData`, `UBTrustTransferTrxRefresh`, `UBTSFileAddTrx2Waiting`, `UBPlanTrx2SidedWithFeeCommList` |

> ⚠️ **Không có SP `UBAA*` nào trong `Trx.cs`.** Các SP Asset Allocation / Rebalancing nằm ở `UBClasses/AssetAllocation.cs`, là module riêng.

> **Nguồn**: `Trx.cs` gọi SP theo 2 cách, cần grep cả hai mới đủ:
> - `db.SetSP("...")` với literal — 64 SP
> - `string SPName = "..."` rồi `db.SetSP(SPName)` — 17 SP (VD L3231, L3287, L3338, L3974, L4033, L4090)
>
> Chỉ grep `db.SetSP` sẽ bỏ sót 17 SP thuộc nhóm thứ hai.

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

> ⚠️ Bất đối xứng Buy vs Sell: tab Buy có đủ 3 radio `rbSettlSrcBuy_D/_I/_F`, nhưng tab Sell **chỉ có D và I** (`rbSettlSrcSell_D`, `rbSettlSrcSell_I`) — không có option Fund settled khi bán.

### Settlement Method

| Value | Method | Ghi chú |
|---|---|---|
| 1 | Net Settlement (N$M) | |
| 2 | Bulk Cheque | Bị remove với DSID `1256` (EA) |
| 3 | Individual Cheque | |
| 4 | Bulk EFT | Bị remove với DSID `1256` (EA) |
| 5 | Individual EFT | |
| 6 | Other | **Luôn bị remove** khỏi dropdown Buy và Sell |
| 7 | A$M | **Luôn bị remove** khỏi dropdown Buy và Sell |

Danh sách gốc lấy từ DB qua `CBase.DisplaySettlementMethodDropDownList()` → SP `UBTrxSettleMethodListByPlanID` (lọc theo plan), sau đó code-behind mới remove item 6/7.

> **Nguồn**: `PopupTradeAdd.aspx.cs` L679-689 — `CBase.RemoveDropdownItem()` cho value 6 (Other), 7 (A$M), và 2/4 riêng cho DSID 1256; `CBase.cs` L8201 — `DisplaySettlementMethodDropDownList()`; `Trx.cs` — params `SettlementInd`, `SettlementStatus`, `SettlementSource`, `SettlementMethod`
>
> Lưu ý: comment ở `PopupTradeAdd.aspx.cs` L678 (`// remove A$M, Bulk check and bulk EFT`) đã lỗi thời — code bên dưới chỉ remove 6 và 7.

---

## 14. Pricing

| Loại sản phẩm | Cách định giá | Thời điểm |
|---|---|---|
| **Mutual Fund** | NAV (fund company đánh giá sau 4pm) | Tối cùng ngày hoặc sáng hôm sau |
| **ETF** | Giá sàn (market price) | Real-time khi order executed |
| **GIC** | Rate hàng ngày (từ CANNEX) | Import sáng, valid cả ngày |

Nguồn price file: mutual fund qua **RS file** từ FundServ; ETF qua **Fundata** (một số dealer import format riêng); GIC rate qua **CANNEX** (sftp).

> **Nguồn**: `business-logic-topics/fundserv-order-flow.md` — "Mutual fund price is evaluated after 4 pm... ETF: it is like stock... GIC: the product rate is updated on a daily basis"

---

## 15. Cross-references

| Tài liệu | Liên quan |
|---|---|
| `Domain Glossary` | Định nghĩa thuật ngữ: Trx, NAV, Settlement, AOT, REV... |
| `System Map` | Vị trí `Trx.cs` trong architecture |
| `business-logic-topics/error-correction.md` | AOT/REV/CAX chi tiết + ví dụ dilution |
| `business-logic-topics/fundserv-order-flow.md` | Order lifecycle, pricing, FundServ modes |
| `business-logic-topics/etf-transfer.md` | ETF transfer rules, omnibus, FIX protocol |
| `Database/Table_Description.md` | Schema `UB_Def_StockOrderType`, `UB_Def_StockTimeInForce`, `UB_Def_TrxStatus` |
