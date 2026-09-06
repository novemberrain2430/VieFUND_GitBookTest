# Trading & Orders

> Module giao dịch — nhập lệnh, xử lý order, error correction (AOT/REV/CAX), và lifecycle từ Pending → Confirmed.

## Tài liệu trong topic này

| File | Nội dung | Nguồn |
|---|---|---|
| [Module Guide](module-guide.md) | Hướng dẫn chi tiết: trade entry, order types, SP, error correction | Tự viết |
| [Order end-to-end](order-end-to-end.md) | Luồng đã source-audit: UI → BLL → SP → queue → XML/MQ → response → contracted/confirmed | C#, SP, DB snapshot |
| [Order Code Dictionary](code-dictionary.md) | `Ret`, FundServ return/error/warning, status/action/type, DSID/dealer hard-code và defect candidate | C#, SP, UDF, DB lookup |

## Tài liệu liên quan

| Folder | File | Nội dung |
|---|---|---|
| [FundServ](../fundserv/) | [TFS/NFU Flow](../fundserv/tfs-nfu-flow.md) | Luồng gửi order qua FundServ |
| [Settlement](../settlement/) | [Settlement Guide](../settlement/README.md) | N$M, trust, cheque, EFT sau giao dịch |
| [Business Logic Topics](../../business-logic-topics/) | [Error Correction](../../business-logic-topics/error-correction.md) | AOT, REV, CAX, Dilution |
| [Business Logic Topics](../../business-logic-topics/) | [ETF Transfer](../../business-logic-topics/etf-transfer.md) | Chuyển ETF |

## Key Files trong codebase

| File | Size | Vai trò |
|---|---|---|
| `UBClasses/Trx.cs` | 264KB | BLL chính — Transaction processing |
| `WebApp/Main/PopupTradeAdd.aspx.cs` | 238KB | UI nhập lệnh giao dịch |
| `WebApp/Main/PopupOrderBatch.aspx.cs` | — | Batch order submission |
| `WebApp/Main/TrxView.aspx.cs` | — | Transaction view |

## Nên đọc theo thứ tự nào?

1. Đọc [Order end-to-end](order-end-to-end.md) để hiểu một order chạy qua hệ thống.
2. Mở [Order Code Dictionary](code-dictionary.md) khi gặp số/mã hard-code hoặc cần đọc trạng thái DB.
3. Dùng [Module Guide](module-guide.md) để tra UI, loại giao dịch, ETF, pricing và các chi tiết module rộng hơn.
