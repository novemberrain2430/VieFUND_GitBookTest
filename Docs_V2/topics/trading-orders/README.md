# Trading & Orders

> Module giao dịch — nhập lệnh, xử lý order, error correction (AOT/REV/CAX), và lifecycle từ Pending → Confirmed.

## Tài liệu trong topic này

| File | Nội dung | Nguồn |
|---|---|---|
| [Module Guide](module-guide.md) | Hướng dẫn chi tiết: trade entry, order types, SP, error correction | Tự viết |

## Tài liệu liên quan

| Folder | File | Nội dung |
|---|---|---|
| [FundServ](../fundserv/) | [TFS/NFU Flow](../fundserv/tfs-nfu-flow.md) | Luồng gửi order qua FundServ |
| [Business Logic Topics](../../business-logic-topics/) | [Error Correction](../../business-logic-topics/error-correction.md) | AOT, REV, CAX, Dilution |
| [Business Logic Topics](../../business-logic-topics/) | [ETF Transfer](../../business-logic-topics/etf-transfer.md) | Chuyển ETF |

## Key Files trong codebase

| File | Size | Vai trò |
|---|---|---|
| `UBClasses/Trx.cs` | 264KB | BLL chính — Transaction processing |
| `WebApp/Main/PopupTradeAdd.aspx.cs` | 238KB | UI nhập lệnh giao dịch |
| `WebApp/Main/PopupOrderBatch.aspx.cs` | — | Batch order submission |
| `WebApp/Main/TrxView.aspx.cs` | — | Transaction view |
