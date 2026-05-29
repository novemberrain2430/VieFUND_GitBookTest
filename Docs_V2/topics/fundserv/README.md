# FundServ

> Tích hợp FundServ — mạng lưới trao đổi giao dịch quỹ đầu tư Canada. Bao gồm: file types, luồng TFS/NFU, import/export, V36 upgrade.

## Tài liệu trong topic này

### Tổng quan & Kiến trúc
| File | Nội dung |
|---|---|
| [Files DataFlow](files-dataflow.md) | Sơ đồ luồng dữ liệu 13 loại file FundServ (CO, TS, HS, NS, PS, FS, GS, FD, MD...) |
| [Source Code Guide](source-code-guide.md) | Hướng dẫn cấu trúc source code: WebApp, VieFUNDIE, VieFUNDMQLib |
| [Sample CO File](sample-co.xml) | File XML mẫu CO (Confirmation Order) |

### Luồng TFS/NFU (Order Sending & Response)
| File | Nội dung |
|---|---|
| [TFS/NFU Flow](tfs-nfu-flow.md) | Luồng gửi TFS/NFU chi tiết: WebApp → VieFUNDIE → FundServ → Response |
| [TFS/NFU Flow Chart](tfs-nfu-flow-chart.md) | Mermaid diagrams cho luồng TFS/NFU |
| [Debug Guide](debug-guide.md) | Hướng dẫn debug TFS/NFU: breakpoints, SQL queries, common issues |
| [Mock Response Analysis](mock-response-analysis.md) | Phân tích cấu trúc DR/XR response files |

### V36 Upgrade (Go-live: June 15, 2026)
| File | Nội dung |
|---|---|
| [V36 Requirements](v36-requirements.md) | Tài liệu yêu cầu V36 đầy đủ (Fundserv Standards) |
| [V36 Implementation Plan](v36-implementation-plan.md) | 10 thay đổi cần thiết cho Dealer WebApp |
| [V36 Explanation](v36-explanation.md) | Giải thích chi tiết plan V36 |

## Key Files trong codebase

| File | Size | Vai trò |
|---|---|---|
| `UBFFImport/FFImport.cs` | 163KB | Master import processor |
| `UBFFImport/COrder.cs` | — | CO file generation (TFS) |
| `UBFFImport/CXM.cs` | — | NFU file generation |
| `UBExport/TS_Export.cs` | — | TFS XML serialization classes |
| `VieFUNDIE/VieFUNDIE.cs` | 39KB | Windows Service — timer-based I/E |
| `WebApp/Main/PopupFundServ.aspx.cs` | — | FundServ settings & history UI |
| `WebApp/Main/PopupOrderBatch.aspx.cs` | — | Order batch submission |
