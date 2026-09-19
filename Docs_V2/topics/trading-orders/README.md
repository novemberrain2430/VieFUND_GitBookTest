# Trading & Orders

> Module giao dịch — nhập lệnh, xử lý order, error correction (AOT/REV/CAX) và lifecycle từ Pending đến Confirmed.

## Phạm vi audit và mức bằng chứng

Tài liệu trong topic này được đối chiếu theo baseline sau:

- C# legacy: `WebApp/`, `DLLs/`, `Services/`.
- SQL snapshot: `MyPortfolioNew/VieFUND-Platform/src/SQLScript/000_3_CreateUDF.sql` và `000_4_CreateSP.sql`.
- Repository còn một cây source gần trùng dưới `MyPortfolioNew/VieFUND-Platform/src`; số dòng giữa hai cây không hoán đổi cho nhau.
- Không có deployment manifest để xác định binary/service hoặc DB production đang chạy đúng copy/commit nào.
- Không tìm thấy base `CREATE TABLE` hay lookup seed cho các bảng Order lõi. Vì vậy tài liệu xác minh được SP/UDF và table/column usage qua query/insert/update, nhưng không khẳng định type, nullability, PK/FK/index/constraint hoặc label production.

Các mô tả T+1/T+2, pricing và một số rule ETF transfer được giữ như bối cảnh vận hành khi cần, không được coi là behavior do source hiện tại cưỡng chế nếu không có trace tương ứng.

## Tài liệu trong topic này

| File | Nội dung | Mức bằng chứng |
|---|---|---|
| [Module Guide](module-guide.md) | UI, loại giao dịch, routing, pending, settlement và phạm vi nghiệp vụ | C# + SP/UDF; phần vận hành được gắn caveat |
| [Order end-to-end](order-end-to-end.md) | UI → BLL → SP → gate/queue → batch/MQ → response → contracted/confirmed | Source-audit theo symbol và SQL snapshot |
| [Order Code Dictionary](code-dictionary.md) | `Ret`, FundServ code, status/action/type, queue code, hard-code và defect candidate | C# + SP/UDF + lookup usage; không có lookup seed |

## Tài liệu liên quan

| Folder | File | Nội dung |
|---|---|---|
| [FundServ](../fundserv/) | [TFS/NFU Flow](../fundserv/tfs-nfu-flow.md) | Luồng gửi order qua FundServ |
| [Settlement](../settlement/) | [Settlement Guide](../settlement/README.md) | N$M, trust, cheque, EFT sau giao dịch |
| [Business Logic Topics](../../business-logic-topics/) | [Error Correction](../../business-logic-topics/error-correction.md) | AOT, REV, CAX, Dilution |
| [Business Logic Topics](../../business-logic-topics/) | [ETF Transfer](../../business-logic-topics/etf-transfer.md) | Chuyển ETF; cần phân biệt narrative nghiệp vụ với rule đã trace |

## Source map chính

| File/symbol | Vai trò đã xác minh |
|---|---|
| `WebApp/Main/PopupTradeAdd.aspx.cs` | UI Buy/Sell/Switch/Transfer/ICT, validation, DSID customization và gọi `CTrx` |
| `WebApp/Main/PopupOrderBatch.aspx.cs` | Chọn nhánh confirm, BBS hoặc queue FundServ theo network |
| `DLLs/UBClasses/Trx.cs` | BLL chính; bind parameter, gọi SP, trả `ID`/`Ret`, thao tác pending/action |
| `DLLs/UBFFImport/COrder.cs` | Tạo CO file, parse `ORDSET`/`ERRORSET` |
| `DLLs/UBFFImport/CAT.cs` | Parse confirmation/reconciliation/history |
| `Services/VieFUNDIE/VieFUNDIE.cs` | Caller của batch CO-file generation |
| `Services/VieFUNDMQ/Order.cs`, `VieFUNDMQ.cs` | Realtime DB contract, IBM MQ put và cập nhật trạng thái message |
| `Services/VieFUNDQFix/` | FIX transport path; không đồng nghĩa mọi ETF được tạo qua `StockOrderAdd` |
| `MyPortfolioNew/VieFUND-Platform/src/SQLScript/000_3_CreateUDF.sql` | Status mapping, gate và lookup UDF |
| `MyPortfolioNew/VieFUND-Platform/src/SQLScript/000_4_CreateSP.sql` | Core create, queue/send, response và confirmation SP snapshot |

> Mutual-fund electronic order thường đi qua order status `1 → 2 → 3/4 → 5/6`, nhưng transaction status là namespace riêng. Manual, network 2, network 4/BBS, omnibus và internal-cash paths không được giả định có cùng lifecycle.

## Nên đọc theo thứ tự nào?

1. Đọc [Order end-to-end](order-end-to-end.md) để trace một order qua code và SQL.
2. Mở [Order Code Dictionary](code-dictionary.md) khi gặp mã số, status hoặc hard-code.
3. Dùng [Module Guide](module-guide.md) để tra UI, transaction type, ETF/stock, settlement và bối cảnh vận hành.
