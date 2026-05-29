# VFOmnibus — Quản lý Omnibus Account

> Module xử lý **Omnibus Account** — tập trung quản lý lệnh mua/bán quỹ ở cấp dealer (gộp nhiều client thành một lệnh FundServ), đối soát unit giữa omnibus và client, xử lý cổ tức, reversal, conversion và transfer giữa các portfolio.

## Mục lục

| # | Tài liệu | Nội dung |
|---|----------|----------|
| 1 | [Kiến trúc tổng quan](01-architecture.md) | Class diagram, data flow, stored procedures |
| 2 | [API Reference](02-api-reference.md) | Tất cả public methods, tham số, return values |
| 3 | [Troubleshooting & Debug](03-troubleshooting.md) | Các lỗi thường gặp, cách fix, code smells |

## Tổng quan nhanh

### VFOmnibus là gì?

VFOmnibus là một **class library** (.NET Framework 4.5) cung cấp tầng business logic cho module Omnibus trên WebApp. Nó đóng vai trò **trung gian** giữa UI (`OmnibusView.aspx`) và database (thông qua stored procedures `OM*`).

```
┌─────────────────────────┐
│   OmnibusView.aspx.cs   │  ← UI (5000+ dòng code-behind)
│   (WebApp/Main)          │
└───────────┬─────────────┘
            │ gọi static methods
            ▼
┌─────────────────────────┐
│      VFOmnibus.dll      │  ← Business Logic Library
│                          │
│  COmnibus (partial)     │  ← Omnibus.cs: Order, Dividend, REV, Merge, ...
│  COmnibusCompareList    │  ← AccountCompare.cs: Đối soát unit
│  CPortfolioConversion   │  ← Conversion.cs: Chuyển đổi quỹ
│  CPortfolioSwitch       │  ← Switch.cs: Đổi model portfolio
│  CPortfolioTransfer     │  ← Transfer.cs: Chuyển tiền giữa plans
│  COMReport              │  ← OMReport.cs: Báo cáo tuần/tháng
└───────────┬─────────────┘
            │ CDatabase → Stored Procedures
            ▼
┌─────────────────────────┐
│    SQL Server Database   │
│  OM_OmnibusOrder        │
│  OM_OmnibusTrx          │
│  OM_OmnibusTrxDetail    │
│  UB_FundTrx             │
│  ...                     │
└─────────────────────────┘
```

### Các chức năng chính

| Chức năng | Class | Mô tả |
|-----------|-------|-------|
| **Order Pending** | `COmnibus` | Quản lý lệnh chờ ở cấp client → gộp thành omnibus order |
| **Omnibus Order** | `COmnibus` | Quản lý lệnh omnibus đã gộp, gửi FundServ |
| **Dividend** | `COmnibus` | Xử lý phân bổ cổ tức cho từng client theo unit |
| **Reversal (REV)** | `COmnibus` | Hoàn giao dịch omnibus (AOT/REV) |
| **Account Compare** | `COmnibusCompareList` | Đối soát unit giữa omnibus account và tổng client |
| **Conversion** | `CPortfolioConversion` | Chuyển đổi quỹ (fund-to-fund conversion) |
| **Switch** | `CPortfolioSwitch` | Đổi model portfolio cho client |
| **Transfer** | `CPortfolioTransfer` | Chuyển tiền/unit giữa các plan |
| **Report** | `COMReport` | Báo cáo weekly/monthly theo advisor, branch, fund, portfolio |

### Dependencies

```xml
<!-- Từ csproj -->
<Reference Include="UBClass" />       <!-- Utility: CBase, CFunctions, CMSG -->
<Reference Include="UBConnection" />   <!-- CDatabase: DB access layer -->
<Reference Include="UBStatic" />       <!-- Shared constants -->
```

> **Output path**: `..\..\WebApp\bin\` — DLL build trực tiếp vào thư mục bin của WebApp.

### Naming Convention — Stored Procedures

Tất cả SP liên quan omnibus đều có prefix:

| Prefix | Phạm vi |
|--------|---------|
| `OM*` | Chung cho module omnibus |
| `OMOmnibus*` | Xử lý lệnh omnibus (gộp, gửi FundServ) |
| `OMOrder*` | Xử lý lệnh ở cấp client |
| `OMConversion*` | Chuyển đổi quỹ |
| `OMTransfer*` | Chuyển tiền giữa plans |
| `OMSwitch*` | Đổi model portfolio |
| `OMReport*` | Báo cáo |
| `OMDividend*` | Xử lý cổ tức |
| `OMAccount*` | Đối soát tài khoản |
| `OMREV*` | Reversal |
| `OmnibusREV*` | Reversal ở cấp omnibus |

### UI Entry Point

Module được truy cập qua page `WebApp/Main/OmnibusView.aspx` — một page duy nhất với `MultiView` chứa nhiều tab:

| Tab ID | Chức năng | View Index |
|--------|-----------|------------|
| `OrderPending` (default) | Danh sách lệnh chờ client | 0 |
| `OmnibusOrderPending` | Omnibus orders pending | 1 |
| `OmnibusOrder` | Lịch sử omnibus orders | 2 |
| `OmnibusDividend` | Cổ tức omnibus | 3 |
| `OmnibusREV` | Reversal history | — |
| `OmnibusConversion` | Conversion | — |
| `OmnibusTRANS` | Transfer | — |
| `OmnibusOther` | Account Compare | — |
| `OmnibusReport` | Reports | — |
