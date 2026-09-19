# 03 — Trading & Orders (Module Guide)

> Module giao dịch mutual fund, ETF/stock và transaction thủ công trong VieFUND. Đối tượng chính là developer .NET cần hiểu entry point, routing và ranh giới giữa behavior đã trace với narrative nghiệp vụ.

## 0. Baseline và cách đọc bằng chứng

Audit này dùng:

- `WebApp/`, `DLLs/`, `Services/` cho source C# legacy;
- `MyPortfolioNew/VieFUND-Platform/src/SQLScript/000_3_CreateUDF.sql` và `000_4_CreateSP.sql` cho SQL snapshot.

Repository có source copy gần trùng dưới `MyPortfolioNew/VieFUND-Platform/src`; không có artefact xác định copy/binary/DB nào đang deploy. SQL snapshot không chứa base `CREATE TABLE` hoặc seed cho các lookup chính, nên tài liệu chỉ gọi một table/column là **đã quan sát qua usage**, không suy ra schema constraint hay label production.

[Order end-to-end](order-end-to-end.md) là trace pipeline chi tiết. [Order Code Dictionary](code-dictionary.md) là nguồn ưu tiên khi đọc `Ret`, FundServ code, status/action/type và hard-code.

---

## 1. Phạm vi module

Source cho thấy các đường chính:

1. UI tạo Buy/Sell/Switch/Transfer/ICT gọi `CTrx` và các SP `UBFundTrx*`.
2. Mutual-fund electronic order được đưa qua validation, queue, CO file hoặc realtime IBM MQ, rồi nhận order response và CAT confirmation.
3. Network `4` dùng BBS/FIX routing, nhưng có nhiều entry point tạo order khác nhau.
4. Manual transaction và network `2` có contract khác electronic FundServ order.

Không nên áp một lifecycle duy nhất cho mọi order chỉ vì cùng dùng `UB_FundTrxOrder`.

## 2. Các loại giao dịch và entry point

| Loại | Entry point → BLL | SP chính | Ghi chú đã source-verify |
|---|---|---|---|
| Buy | `PopupTradeAdd.OnBuy` → `CTrx.Buy` | `UBFundTrxBuy` | Regular buy, rebate và network-specific branch nằm trong SP. |
| Buy Edit | `CTrx.BuyEdit` | `UBFundTrxBuyEdit` | Sửa order hiện hữu. |
| Sell | `PopupTradeAdd.OnSell` → `CTrx.Sell` | `UBFundTrxSell` | Main `Type='4'` path collapse về `iType=20`; không dùng riêng value này như label toàn cục cho fee redemption. Canonical `UBFundTrxSellShort` phân biệt blank `ProdEventInd` → `iType=20` (`fee`) và `ProdEventInd='O'` → `iType=90` (`fee redemption`). |
| Sell Edit | `CTrx.SellEdit` | `UBFundTrxSellEdit` | Sửa Sell. |
| Switch | `PopupTradeAdd.OnSwitch` → `CTrx.Switch` | `UBFundTrxSwitch` | Có source/destination position và tax/force options. |
| Switch Edit/Basket | `CTrx.SwitchEdit` / `BasketSwitch` | `UBFundTrxSwitchEdit` / `UBFundTrxSwitchBasket` | Basket là flow riêng. |
| Transfer | `PopupTradeAdd.OnTransfer` → `CTrx.Transfer` | `UBFundTrxTransfer` | Internal/external branch; không có một `iType` duy nhất. |
| Transfer Edit | `CTrx.TransferEdit` | `UBFundTrxTransferEdit` | Sửa Transfer. |
| ICT | `PopupTradeAdd.OnICT` → `CTrx.ICT` | `UBFundTrxICT` | Account-to-account flow, stage source/destination funds qua session. Tên mở rộng và constraint “cùng plan” cần lookup/business owner để xác nhận. |
| ICT Edit | `CTrx.ICTEdit` | `UBFundTrxICTEdit` | Sửa ICT. |
| ETF qua trade tabs | `PopupTradeAdd.OnBuy/OnSell` → `CTrx.Buy/Sell` | `UBFundTrxBuy/Sell` | Khi `iNetwork=4`, UI truyền ETF fields; order đi BBS/FIX route ở bước sau. |
| Standalone stock order | `PanelStockOrder` → `CTrx.StockOrderAdd` | `UBStockOrderAdd` | Entry point riêng; không đại diện cho mọi ETF order. |
| Manual transaction | `PopupTrxManualAdd` → `CTrx.ManualUpdate` | `UBFundTrxManualAdd/Update` | Access được kiểm bằng `IsAccessible(..., "ADD", "ACCOUNT")`; không có bằng chứng đây luôn là quyền admin. |

Source chính: `DLLs/UBClasses/Trx.cs`, `WebApp/Main/PopupTradeAdd.aspx.cs`, `WebApp/Main/PanelStockOrder.aspx.cs`, `WebApp/Main/PopupTrxManualAdd.aspx.cs`.

## 3. Status và lifecycle

### 3.1. Hai namespace status

| Order status: `UB_FundTrxOrder.iOrderStatus` | Transaction status: `UB_FundTrx.iStatus` |
|---|---|
| `0` Deleted/null | `0` Deleted |
| `1` Pending To Send | `1` Rejected |
| `2` Pending to Receive | `2` Cancelled |
| `3` Rejected | `3` Pending |
| `4` Accepted | `4` In Progress |
| `5` Contracted | `5` Contracted |
| `6` Confirmed | `6` Confirmed |

`UB_FundTrx` còn có cột integration `iOrderStatus`; khi gửi, SQL có thể đổi cột này sang `2` trong khi business `iStatus` vẫn là `3`. Không map các cột chỉ dựa vào cùng tên/số.

### 3.2. Transition được code/SQL chứng minh

```text
Order 1 Pending To Send
  → 2 Pending to Receive khi send-status SP chạy
  → 4 Accepted hoặc 3 Rejected khi ORDSET được xử lý
  → 5 Contracted / 6 Confirmed / 3 Rejected khi CAT record được xử lý
```

Trước CAT dispatch, SQL normalize status trống theo record type:

- `SETTLREC` trống → `A` → Contracted (`5`);
- `TRXNREC` trống → `S` → Confirmed (`6`).

UDF `FSUBGetTrxStatus`/`FSUBGetTrxWOStatus` map `A`, `S`/blank và `R`. Label hiển thị production vẫn phụ thuộc lookup data không có seed trong repository.

### 3.3. T+1/T+2 là bối cảnh vận hành

Các tài liệu nghiệp vụ cũ mô tả FS ở T+1, TS ở T+2 và non-cash có thể bỏ qua Contracted. Source/SQL snapshot được audit chỉ chứng minh message type, normalization và mapping status; không có scheduler hoặc branch đủ để khẳng định lịch này là DB-enforced. Khi troubleshooting production, phải đối chiếu lịch/file thực tế của môi trường.

### 3.4. Hai chế độ gửi

| Chế độ | Trace source |
|---|---|
| Batch/CO file | `Services/VieFUNDIE/VieFUNDIE.cs` → `DLLs/UBFFImport/COrder.OrderFileGenerate` → `UBOrderCreateFile`/`UBOrderFileUpdateStatus` |
| Realtime/IBM MQ | `Services/VieFUNDMQ/Order.cs` → `UBOrderGetMSG`; `VieFUNDMQ.SendMsg` put XML; `Order.UpdateOrderSet` → `UBOrderSetMsgStatus` |

Source realtime có trong repository. Việc service/binary nào được cài, queue configuration, acknowledgement và retry policy ở production vẫn cần deployment/runtime evidence.

## 4. UI tạo giao dịch

### 4.1. Tabs

`PopupTradeAdd.aspx` khai báo Buy, Sell, Switch, Transfer, ICT và Risk tabs. Risk là tab hỗ trợ, không phải transaction type độc lập.

### 4.2. `Page_Load`

`CBase.IsPageValid(...)` chạy trước `if (!IsPostBack)`, nên không đúng khi nói toàn bộ flow chỉ chạy lần đầu. Nhánh first-load thực hiện, theo các branch xen kẽ:

1. đọc DSID/client và đóng page sớm nếu context không hợp lệ;
2. load title và trade combo;
3. load dealership/config;
4. load client header/address, plan/account/bank/pending lists;
5. cấu hình realtime, basket-only, access và trading-disabled;
6. áp customization theo DSID và FundServ version/date branch.

Không nên dùng số dòng hoặc thứ tự rút gọn như một contract vì hai source tree có line offset khác nhau.

### 4.3. DSID customization đã quan sát

| DSID | Behavior trong branch đã trace |
|---|---|
| `1911`, `2262` | Khóa/điều chỉnh ETF price type/time-in-force; `1911` còn force Gross ở một số Buy path. |
| `1256` | Active code ẩn SIN/DOB trên receipt, remove settlement item `2`/`4`; block checkbox cũ là comment/dead code. |
| `1623` | Ẩn Fund Fact requirement ở UI branch. |
| `1853`, `2301`, `2501` | Form/confirmation customization; phải giữ đủ cả ba literal khi mô tả branch. |
| `1274`, `1001` | Extra fee/options trong các branch tương ứng. |
| `1912` | Trust branch chọn settlement source `I`; comment cũ nói dealer-settled không phản ánh active assignment. |

Đây là behavior tại call-site, không phải định nghĩa dealer lấy từ DB config.

## 5. Error correction

### 5.1. Query action và thực thi action

```text
CTrx.AllowableAction
  → UBFundTrxOrderCANCAX
  → trả iCanDelete, iCanCAN, iCanCAX, iCanREV, iCanCHG, iCanUndo,
    iReasonID, iOrderStatus, WONumber

CTrx.TrxOrderCANCAX
  → UBFundTrxCancel
  → thực thi CAN/CAX/REV theo iOptions
```

C# đặt biến `iCanDEL`, nhưng result column của SP là `iCanDelete`. Hai SP có tên gần giống nhưng không cùng nhiệm vụ.

Wrapper hiện ghi CAN áp cho Accepted và CAX áp cho Accepted hoặc Contracted. Vì vậy không hard-code “CAX chỉ Contracted chưa settle” ở UI; availability phải lấy từ `AllowableAction` và rule DB của môi trường.

### 5.2. Narrative nghiệp vụ

- REV: reversal của trade hợp lệ; source có `iOptions=2` và tạo reversal order.
- AOT: as-of/back-dated order; source có date/original-order validation và XML fields.
- Dilution: business amount liên quan AOT/REV/CAX, nhưng xem lỗi forwarding ở mục 6.2 trước khi giả định giá trị đã được persist.

## 6. Parameter contract

### 6.1. Nhóm parameter chính của Buy

| Nhóm | Ví dụ |
|---|---|
| Core | `iClientID`, `iPlanID`, `iPositionID`, `fAmount`, `AmtType` |
| Settlement | `SettlementInd`, `SettlementStatus`, `SettlementSource`, `SettlementMethod` |
| Compliance | `bTrxLeveraged`, `bPEFP`, `bUnsolicited`, `bForceApproved`, `bForceRisk` |
| AOT | `bAOT`, `AOTDateStr`, `bAOTOrginalOrder` |
| Trust/payment | `bTrust`, `iTrustID`, PMT/bank/cheque fields |
| ETF | `ETFOrderType`, `ETFTimeInForce`, `ETFExpiryDate`, price limit/stop |

`CTrx.Buy` bind các nhóm trên vào `UBFundTrxBuy`, ngoại trừ caveat bên dưới. Parameter presence chỉ chứng minh C#/SP contract, không chứng minh column schema.

### 6.2. `AOTDilution` đang bị drop

UI truyền `AOTDilution` vào `CTrx.Buy/Sell/Switch`; method signatures nhận value nhưng implementation không `AddParam` value này vào SP. Transfer handler còn tính value nhưng `CTrx.Transfer` không có parameter tương ứng. Đây là defect candidate, không được mô tả như persistence đã xác minh.

### 6.3. Switch/Transfer

- Switch có source/destination position, `TaxEventInd`, `iForceOpt`; comment hiện mô tả option DSC→FEL và currency switch.
- Transfer có `iMethod` và thông tin dealer/account/fund/SIN/plan/intermediary phía nguồn. Các nhánh SQL dùng nhiều `iType`; không gán một label chung cho tất cả.

## 7. ETF/stock và FIX

### 7.1. Hai create path khác nhau

1. Buy/Sell ETF trong `PopupTradeAdd` vẫn gọi `CTrx.Buy/Sell`; khi network `4`, UI truyền order type, time-in-force, expiry, price limit/stop và queue step route sang BBS/FIX.
2. `PanelStockOrder` gọi `CTrx.StockOrderAdd` → `UBStockOrderAdd` cho standalone stock-order UI.

`Services/VieFUNDQFix/` chứng minh FIX service path tồn tại trong source. Deployment cụ thể vẫn cần kiểm tra môi trường.

### 7.2. Lookup và validation

SQL query `UB_Def_StockSide`, `UB_Def_StockOrderType`, `UB_Def_StockTimeInForce`; repository không có DDL/seed nên không thể chứng minh authoritative ID/label production. UI hiện xử lý order-type values `1..4`, price-limit/stop requirements và expiry khi time-in-force `6`, nhưng allowed set còn phụ thuộc lookup/config.

Các mô tả “dealer chỉ dùng Market/Limit/Stop/Stop-Limit” hoặc “chỉ Day/GTC/GTD” phải được coi là convention vận hành cho đến khi đối chiếu lookup production.

### 7.3. ETF transfer

Các rule về last-business-date, tax impact và two-sided transfer nằm trong business narrative/feature UI. Chỉ gọi chúng là code-enforced sau khi trace `PanelETFTransferEdit`, feature flag `TMPiETFTransfer` và SP tương ứng ở version đang deploy.

## 8. Pending orders và enqueue

### 8.1. UI routing

`PopupOrderBatch` chọn wrapper theo network:

- network `2` → `OrderPending2Confirm`;
- network `4` → `OrderPendingMove2BBS`;
- còn lại → `OrderPendingMove2Waiting`.

Do đó không quy mọi special route cho `UBOrderWaiting2SendAddInternal`.

### 8.2. Wrapper/SP

| Method | SP | Vai trò |
|---|---|---|
| `GetPendingOrderList` | `UBTrxPendingOrderList` | Pending transaction list. |
| `GetOrderPendingSet` | `UBOrderPendingList` | Pending order set. |
| `OrderPendingMove2Waiting` | `UBOrderWaiting2SendAdd` | Normal FundServ enqueue. |
| `OrderPending2Confirm` | `UBOrderSetConfirmTaggedItems` | Confirm path; permission/config-dependent, không mặc định “admin”. |
| `OrderPendingMove2BBS` | `UBOrderWaiting2BBSOrder` | BBS/network-4 path. |
| `TrxOrderDelete` | `UBTrxOrderRemove` | Xóa order. |
| `TrxDeleteOrUndo*` | `UBTrxDeleteOrUndo` | Toggle valid/deleted. |

### 8.3. Gate của single-order normal enqueue

WebForms route gọi `CTrx.OrderPendingMove2Waiting`, nhưng wrapper này không bind/expose `bForced`; vì vậy SP dùng default `0`. Trên UI/CTrx default path, thứ tự gate là:

1. `IsFundFactOKOrder`.
2. `IsOrderOK4FS`.
3. `UBOrderCreateMSGXML(..., iOptions=2)` XML preflight.
4. `IsOrderOK4Cash` trong `UBOrderWaiting2SendAddOne` trước insert.

Direct/internal SP semantics khác default path: `bForced=1` bỏ qua cả `IsFundFactOKOrder` và các kết quả `IsOrderOK4FS` code `2..5`, nhưng code `6` (insufficient settled cash) vẫn chặn. `IsOrderOK4Cash` vẫn áp dụng cho normal queue type. Condition hiện cũng không chặn code `0`; bulk selection lại lọc `IsOrderOK4FS(...)=1`, nên default single, forced internal và bulk path không tương đương.

`CTrx.OrderPendingMove2Waiting` truyền `bNewSourceID`, nhưng wrapper SQL `UBOrderWaiting2SendAdd` gọi internal bằng literal `0`; flag hiện không có hiệu lực qua path này. Insert queue còn có `TRY/CATCH` nuốt lỗi trong `...AddOne`, trong khi caller vẫn có thể tăng count, nên count trả về không phải bằng chứng chắc chắn row đã enqueue.

## 9. View, search và manual transaction

- `CTrx.GetViewList` → `UBTrxViewSearch`, với filter client/plan/account/work-order/date/status/type/currency và paging/sort.
- `TrxView.aspx` là WebForms view; không có SQL `VIEW` cùng tên được chứng minh.
- `PopupPlanTrx.aspx.cs` tự ghi `// This file is not in use`; không liệt kê như page active nếu chưa có runtime/navigation evidence.
- `CTrx.ManualUpdate` chọn `UBFundTrxManualAdd` hoặc `UBFundTrxManualUpdate` theo `iTrxID`; `UBFundTrxManualCalc` tính trước. Page dùng account-add permission, không chứng minh “admin only”.

Không dùng file size làm identifier vì generated output/copy source thay đổi theo branch.

## 10. Database behavior và transaction boundary

### 10.1. SP inventory lõi

- Create/edit: `UBFundTrxBuy*`, `Sell*`, `Switch*`, `Transfer*`, `ICT*`, manual variants.
- Pending/action: `UBTrxPendingOrderList`, `UBOrderPendingList`, `UBFundTrxOrderCANCAX`, `UBFundTrxCancel`, queue wrappers.
- Send: `UBOrderCreateFile`, `UBOrderCreateMSGXML`, `UBOrderFileUpdateStatus`, `UBOrderGetMSG`, `UBOrderSetMsgStatus`.
- Response/CAT: `UBXMLRecOrderRespnProcess*`, `UBXMLRecTrxRecordProcess*`.

Không giữ con số “81 SP duy nhất” như invariant: repository có duplicate source và không pin commit/canonical file. Nếu cần inventory chính xác, generate từ đúng `Trx.cs` đang build.

### 10.2. Atomicity và silent failure

SQL snapshot cho thấy:

- `UBFundTrxBuy` có `BEGIN/COMMIT TRAN` bị comment; Sell/Switch/Transfer không có outer transaction tương đương; ICT có explicit transaction.
- Queue/send/response update nhiều table nhưng không có outer transaction end-to-end.
- Nhiều validation/correlation query dùng `WITH (NOLOCK)`.
- Một số `TRY/CATCH` hoặc C# import path nuốt lỗi/false-success.

Vì vậy không được diễn đạt một multi-table “state transition” như atomic guarantee. Khi điều tra lỗi phải kiểm tra từng table và side effect.

## 11. Settlement

### 11.1. Source và indicator

- `SettlementInd`: observed `G`/`N` = Gross/Net.
- Buy UI có source `D`/`I`/`F`; Sell UI chỉ có `D`/`I`.
- `SettlementMethod=1` được các SQL rule dùng như N$M.

### 11.2. Dropdown runtime data

`CBase.DisplaySettlementMethodDropDownList` gọi `UBTrxSettleMethodListByPlanID`, bind `FSCode`/description. UI luôn remove values `6`, `7`; DSID `1256` còn remove `2`, `4`.

Repository không có lookup seed, nên tên của values `2..7` không được coi là DB-verified chỉ từ comment/vị trí dropdown. Comment cũ gần đoạn remove cũng không khớp hoàn toàn active code.

## 12. Pricing và lịch vận hành

Mutual-fund NAV sau market close, ETF market price, GIC daily rate, RS/Fundata/CANNEX và lịch T+1/T+2 là kiến thức vận hành hữu ích từ tài liệu nghiệp vụ cũ. Các timing này không được các method/SP audit ở trên cưỡng chế đầy đủ. Khi dùng cho support/SLA, cần xác nhận scheduler, integration config và file arrival của production.

## 13. Cross-reference

| Nội dung | Nguồn |
|---|---|
| Pipeline source-audit | [Order end-to-end](order-end-to-end.md) |
| Namespace mã và defect | [Order Code Dictionary](code-dictionary.md) |
| Settlement | [Settlement Guide](../settlement/README.md) |
| Error correction narrative | `Docs_V2/business-logic-topics/error-correction.md` |
| ETF transfer narrative | `Docs_V2/business-logic-topics/etf-transfer.md` |
| SQL definitions được audit | `MyPortfolioNew/VieFUND-Platform/src/SQLScript/000_3_CreateUDF.sql`, `000_4_CreateSP.sql` |

`Docs_V2/Database/Table_Description.md` là tài liệu tham khảo, không thay thế base DDL/seed khi xác minh schema production.
