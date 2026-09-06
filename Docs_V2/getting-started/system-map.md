# 00 — System Map (Bản đồ hệ thống)

> **Mục tiêu**: Trả lời câu hỏi "Hệ thống gồm những gì? Cái gì ở đâu?"
>
> **Đối tượng**: Developer .NET có kinh nghiệm, chưa biết nghiệp vụ quỹ đầu tư Canada.

---

## 1. Tổng quan hệ thống

**VieFUND** là hệ thống quản lý quỹ đầu tư (Investment Fund Management System) dành cho thị trường Canada. Hệ thống xây dựng trên nền tảng **ASP.NET Web Forms** (.NET Framework 4.5.2) + **SQL Server** với stored procedures chứa phần lớn business logic.

### Quy mô

| Metric | Giá trị |
|---|---|
| Tổng số projects | 26 |
| ASPX pages (WebApp/Main) | ~1,907 files |
| BLL classes (UBClasses) | 113 .cs files (~5,137 KB) |
| Stored Procedures script | ~62 MB (000_4_CreateSP.sql) |
| UDFs script | ~9 MB (000_3_CreateUDF.sql) |
| PDF generation code | ~3,425 KB (54 files) |
| JavaScript (core) | ~300 KB (CommonFunctions + MenuFunctions + Library) |
| CSS files (per-tenant) | 75 files |

---

## 2. Kiến trúc phân lớp (Layer Architecture)

```
┌─────────────────────────────────────────────────────────────┐
│                    PRESENTATION LAYER                       │
│  WebApp (ASP.NET Web Forms)    WebClient (Client Portal)    │
│  1,907 ASPX + code-behind     Client-facing portal          │
└────────────────────────┬────────────────────────────────────┘
                         │
┌────────────────────────▼────────────────────────────────────┐
│                  BUSINESS LOGIC LAYER (BLL)                  │
│  UBClasses (113 files, 5.1MB)  — Domain entities + logic     │
│  VFOmnibus (6 files)           — Omnibus processing          │
│  VFOnBoarding (29 files)       — Onboarding services         │
└────────────────────────┬────────────────────────────────────┘
                         │
┌────────────────────────▼────────────────────────────────────┐
│                 DATA ACCESS LAYER (DAL)                       │
│  UBConnection — CDatabase.cs (94KB): SP execution, conn mgmt │
│               — CEncryption.cs (32KB): AES encryption         │
│               — CRegistry.cs (8KB): Registry-based config     │
│               — CXML.cs (30KB): XML handling                  │
└────────────────────────┬────────────────────────────────────┘
                         │
┌────────────────────────▼────────────────────────────────────┐
│                    DATABASE LAYER                             │
│  SQL Server — Stored Procedures (62MB script)                │
│             — User-Defined Functions (9MB script)             │
│             — Multi-tenant: DBID → connection, DSID → data   │
└─────────────────────────────────────────────────────────────┘
```

### Cross-cutting Libraries

```
┌─────────────────────────────────────────────────────────────┐
│                  CROSS-CUTTING CONCERNS                      │
│                                                              │
│  UBStatic ──── CFunctions.cs (131KB): Utility functions      │
│            ├── SendEmail.cs (84KB): SMTP email                │
│            ├── CMSG.cs (114KB): Message templates EN/FR       │
│            └── Data.cs (15KB): Data helpers                   │
│                                                              │
│  VFStatic ──── Language.cs: Multi-language support            │
│            └── CodeExpressionBuilder.cs: <%$ MultiLg:key %>   │
│                                                              │
│  VieFUNDPdf ── CPDF.cs (916KB): Master PDF generator         │
│            └── CReport.cs (466KB): Client reports             │
│                                                              │
│  UBExport ──── 58 files: Tax XML, CRA, client export         │
│  UBFFImport ── FFImport.cs (163KB): Fundserv import          │
└─────────────────────────────────────────────────────────────┘
```

### External Integration Libraries

```
┌─────────────────────────────────────────────────────────────┐
│                 EXTERNAL INTEGRATIONS                         │
│                                                              │
│  VFDocSign ──── CVFDocSign.cs (109KB): DocuSign e-signature   │
│  VFSignority ── CSignority.cs (54KB): Signority e-signature  │
│  VFOneSpan ──── COneSpan.cs (35KB): OneSpan e-signature      │
│  VFTwilio ───── CTwilio2FA.cs (5KB): 2FA via Twilio          │
│  VieFUNDSmS ─── CTextMsgs.cs: SMS legacy                    │
│  VieFUNDSaml ── Saml20.cs (53KB): SAML SSO                  │
│  VieFUNDMQLib ─ (compiled DLL): IBM MQ for Fundserv          │
│  VieFUNDIE ──── VieFUNDIE.cs (39KB): Timer service           │
│  PdfBase ────── (compiled): Low-level PDF rendering           │
└─────────────────────────────────────────────────────────────┘
```

---

## 3. Project Inventory (26 Projects)

### 3.1 Web Applications

| # | Project | Type | Mô tả | Files chính |
|---|---|---|---|---|
| 1 | **WebApp** | ASP.NET Web Forms | Ứng dụng chính — back-office cho advisor/admin | 1,907 ASPX, Default.aspx.cs (login) |
| 2 | **WebClient** | ASP.NET Web Forms | Client portal — investor self-service | Default.aspx, Main/ folder |

### 3.2 Business Logic Layer

| # | Project | C# Files | Size | Mô tả |
|---|---|---|---|---|
| 3 | **UBClasses** | 113 | 5,137 KB | Domain entities: Customer, Plan, Trx, Compliance, Fee... |
| 4 | **VFOmnibus** | 6 | 181 KB | Omnibus account processing, switches, conversions |
| 5 | **VFOnBoarding** | 29 | 409 KB | Onboarding web services (ASMX), 54 WebMethod active |
| 6 | **OnboardingWebServices** | 26 | 282 KB | Older onboarding WS, 38 WebMethod active |

### 3.3 Data Access Layer

| # | Project | C# Files | Size | Mô tả |
|---|---|---|---|---|
| 7 | **UBConnection** | 6 | 197 KB | Core DAL: CDatabase, CEncryption, CRegistry, CXML |

### 3.4 Utility Libraries

| # | Project | C# Files | Size | Mô tả |
|---|---|---|---|---|
| 8 | **UBStatic** | 5 | 338 KB | Utilities: CFunctions, SendEmail, CMSG, Data |
| 9 | **VFStatic** | 2 | 3 KB | Multi-language: Language.cs, CodeExpressionBuilder |

### 3.5 Report & Export

| # | Project | C# Files | Size | Mô tả |
|---|---|---|---|---|
| 10 | **VieFUNDPdf** | 54 | 3,425 KB | PDF generation: reports, tax slips, trade confirms |
| 11 | **PdfBase** | 1 | — | Low-level PDF rendering engine (compiled) |
| 12 | **UBExport** | 47 | 717 KB | Tax XML export (CRA), client data export |

### 3.6 Fundserv & Import

| # | Project | C# Files | Size | Mô tả |
|---|---|---|---|---|
| 13 | **UBFFImport** | 28 | 924 KB | Fundserv file import, order generation |
| 14 | **VieFUNDIE** | 3 | 40 KB | Windows Service — timer-based import/export |
| 15 | **VieFUNDMQLib** | — | — | IBM MQ connection library (compiled DLL only) |

### 3.7 E-Signature Integration

| # | Project | C# Files | Size | Mô tả |
|---|---|---|---|---|
| 16 | **VFDocSign** | 1 | 109 KB | DocuSign OAuth + signing ceremony |
| 17 | **VFSignority** | 1 | 53 KB | Signority e-signature |
| 18 | **VFOneSpan** | 2 | 35 KB | OneSpan e-signature |

### 3.8 Authentication & Security

| # | Project | C# Files | Size | Mô tả |
|---|---|---|---|---|
| 19 | **VieFUNDSaml** | 2 | 194 KB | SAML 2.0 SSO |
| 20 | **VFTwilio** | 5 | 20 KB | Twilio 2FA, SMS |
| 21 | **VieFUNDSmS** | 2 | 11 KB | Legacy SMS |

### 3.9 Specialized / Misc

| # | Project | C# Files | Size | Mô tả |
|---|---|---|---|---|
| 22 | **VFQuickFix** | — | — | Ad-hoc fix utilities |
| 23 | **VFDocVerification** | — | — | Empty project (không sử dụng) |

### 3.10 Database

| # | File | Size | Mô tả |
|---|---|---|---|
| 24 | `ScriptDB/000_2_FieldAdded.sql` | 30 KB | Schema changes (ALTER TABLE) |
| 25 | `ScriptDB/000_3_CreateUDF.sql` | 9 MB | User-Defined Functions |
| 26 | `ScriptDB/000_4_CreateSP.sql` | 62 MB | Stored Procedures |

---

## 4. Cấu trúc thư mục WebApp

```
WebApp/
├── Default.aspx(.cs)          ← Entry point (Login page)
├── Web.config                 ← App configuration
├── Library.js                 ← Shared JS library (60KB)
│
├── Main/                      ← TẤT CẢ pages nằm ở đây (~1,907 files)
│   ├── DashBoard.aspx         ← Trang chính sau login
│   ├── Client.aspx            ← Client management (380KB markup!)
│   ├── PlanView.aspx          ← Account/Plan view
│   ├── TrxView.aspx           ← Transaction view
│   ├── CommissionView.aspx    ← Commission management
│   ├── SettlementView.aspx    ← Settlement processing
│   ├── FundSetup.aspx         ← Fund management
│   ├── GICView.aspx           ← GIC (Term Deposit) view
│   ├── YearEnd.aspx           ← Year-end tax processing
│   ├── ComplianceTrx.aspx     ← Compliance review
│   ├── OmnibusView.aspx       ← Omnibus accounts
│   ├── PdfView.aspx(.cs)      ← PDF endpoint (138KB code-behind)
│   │
│   ├── Panel*.aspx            ← Embedded panels (user controls)
│   ├── Popup*.aspx            ← Modal dialog windows
│   ├── *View.aspx             ← Main data display pages
│   ├── *List.aspx             ← Lookup dropdown pages
│   ├── *Prn.aspx              ← Print-friendly versions
│   ├── *_FR.aspx              ← French versions (shared code-behind)
│   ├── *Chart*.aspx           ← Chart/graph pages
│   └── *Search*.aspx          ← Search panels
│
├── Inc/                       ← Shared includes
│   ├── PageHeader.aspx        ← Page layout header
│   ├── PageFooter.aspx        ← Page layout footer
│   ├── PopupHeader.aspx       ← Popup layout header
│   ├── PopupFooter.aspx       ← Popup layout footer
│   ├── ListHeader.aspx        ← List page header
│   ├── SessionVars.aspx       ← Session variable declarations
│   ├── UBMenuContent.aspx     ← Menu loader
│   └── UBVersion.inc          ← Version string
│
├── Js/                        ← JavaScript files
│   ├── CommonFunctions.js     ← Core utilities (128KB)
│   ├── MenuFunctions.js       ← Menu rendering (52KB)
│   ├── UBMenuContent_EN.js    ← Menu structure — English (19KB)
│   ├── UBMenuContent_FR.js    ← Menu structure — French (17KB)
│   ├── UBMenuDropdown.js      ← Dropdown behavior (17KB)
│   ├── ajax.js                ← AJAX engine (4KB)
│   ├── RightMouseMenu.js      ← Context menu
│   └── [module-specific].js   ← ClientAddEdit, PlanAddEdit, etc.
│
├── Css/                       ← Stylesheets
│   ├── UBStyle.css            ← Base stylesheet (37KB)
│   ├── StyleSheet.css         ← Additional styles (55KB)
│   ├── UBStyle_XXXX.css       ← Per-tenant overrides (XXXX = DSID)
│   └── skin/                  ← Skin assets
│
├── Img/                       ← Images & logos
│   ├── [shared images]        ← ~300 shared image files
│   └── XXXX/                  ← Per-tenant logos (XXXX = DSID)
│
├── Controls/Main/             ← Shared controls
├── Plugins/                   ← Third-party plugins
├── Fonts/                     ← Font files
├── App_GlobalResources/       ← Localization resources
│   ├── Language.EN.resx       ← English strings (18KB)
│   └── Language.FR.resx       ← French strings (19KB)
└── bin/                       ← Compiled DLLs
```

---

## 5. File Naming Conventions

| Pattern | Ý nghĩa | Ví dụ |
|---|---|---|
| `*View.aspx` | Main data display page | `TrxView.aspx`, `AccountView.aspx` |
| `Panel*.aspx` | Embedded user control (loaded into page/popup) | `PanelClientSearch.aspx` |
| `Popup*.aspx` | Standalone modal dialog | `PopupClientAdd.aspx`, `PopupTradeAdd.aspx` |
| `*_FR.aspx` | French version (same code-behind) | `Client_FR.aspx`, `DashBoard_FR.aspx` |
| `*Prn.aspx` | Print-friendly version | `TrxViewPrn.aspx`, `CommViewPrn.aspx` |
| `*List.aspx` | Simple lookup/dropdown page | `CityList.aspx`, `CountryList.aspx` |
| `*Body.aspx` | Partial content (loaded dynamically) | `PopupClientAddBody.aspx` |
| `*Chart*.aspx` | Chart/graph page | `PieChart1.aspx`, `RiskColumnChart.aspx` |
| `*Search*.aspx` | Search panel | `PanelClientSearch.aspx` |
| `*_js.aspx` | JavaScript include via ASPX | `PopupTradeAdd_js.aspx` |
| `*.inc` | Server-side include | `UBVersion.inc`, `Default_js.inc` |

### BLL Class Naming (UBClasses)

| Pattern | Ý nghĩa | Ví dụ |
|---|---|---|
| `C*.cs` | Core utility class | `CBase.cs`, `CExcel.cs`, `CAddress.cs` |
| `[Entity].cs` | Domain entity | `Customer.cs`, `Plan.cs`, `Trx.cs` |
| `[Tax].cs` | Tax form class | `T5.cs`, `T4RSP.cs`, `RL16.cs` |
| `*.cs.bak` | Backup file (ignore) | `Trx.cs.bak` |

---

## 6. Navigation Flow

```
                    ┌─────────────┐
                    │ Default.aspx│ ← Login page
                    │   (Login)   │
                    └──────┬──────┘
                           │ Authentication
                           │ → Session vars set (DBID, DSID, UserID, Lg...)
                           ▼
                    ┌─────────────┐
                    │  DashBoard  │ ← Main page after login
                    │   .aspx     │
                    └──────┬──────┘
                           │
              ┌────────────┼────────────┐
              ▼            ▼            ▼
        ┌──────────┐ ┌──────────┐ ┌──────────┐
        │ JS Menu  │ │ Tabs     │ │ Panels   │
        │ (top bar)│ │ (in page)│ │ (search) │
        └────┬─────┘ └──────────┘ └──────────┘
             │
    ┌────────┼────────┬────────────┬──────────────┐
    ▼        ▼        ▼            ▼              ▼
 Client   TrxView  PlanView  CommissionView  SettlementView
 .aspx    .aspx    .aspx     .aspx           .aspx
    │
    ├──► PopupClientAdd.aspx (Add/Edit in popup)
    ├──► PanelClientSearch.aspx (Search panel)
    ├──► PopupAttachmentNotes.aspx (Documents)
    └──► PdfView.aspx (Reports/PDF)
```

### Menu System
- Menu structure defined in: `Js/UBMenuContent_EN.js` (EN) / `UBMenuContent_FR.js` (FR)
- Menu rendering: `Js/MenuFunctions.js` (52KB)
- Menu initialization: `Inc/UBMenuInit.aspx`
- Menu constants: `Js/UBMenuConst.js`, `UBMenuConstColor.js`

---

## 7. Key Entry Points (Top 15 files theo size)

| # | File | Size | Vai trò |
|---|---|---|---|
| 1 | `UBClasses/CBase.cs` | 341 KB | Base class — common DB ops, UI helpers |
| 2 | `UBClasses/Compliance.cs` | 269 KB | Compliance logic |
| 3 | `UBClasses/Trx.cs` | 264 KB | Transaction processing |
| 4 | `UBClasses/Customer.cs` | 251 KB | Client/Customer entity |
| 5 | `UBClasses/TrustAccount.cs` | 217 KB | Trust account management |
| 6 | `UBClasses/Member.cs` | 213 KB | User/advisor management |
| 7 | `UBClasses/Plan.cs` | 207 KB | Account/Plan entity |
| 8 | `UBClasses/Document.cs` | 191 KB | Document management |
| 9 | `UBClasses/FundDef.cs` | 189 KB | Fund definitions |
| 10 | `UBClasses/CommissionRevenue.cs` | 176 KB | Commission processing |
| 11 | `Main/PopupTradeAdd.aspx.cs` | 238 KB | Trade entry (code-behind) |
| 12 | `Main/PopupTrustDepositAdd.aspx.cs` | 233 KB | Trust deposit (code-behind) |
| 13 | `Main/CommissionView.aspx.cs` | 250 KB | Commission view (code-behind) |
| 14 | `Main/Client.aspx` | 380 KB | Client page (markup!) |
| 15 | `VieFUNDPdf/CPDF.cs` | 916 KB | Master PDF generator |

---

## 8. Technology Stack

| Component | Technology |
|---|---|
| **Web Framework** | ASP.NET Web Forms (.NET Framework 4.5.2) |
| **Language** | C# |
| **Database** | SQL Server (Stored Procedures + UDFs) |
| **JavaScript** | Vanilla JS (custom AJAX, no jQuery framework) |
| **PDF Generation** | Custom engine (PdfBase + VieFUNDPdf) |
| **Excel Export** | EPPlus library |
| **Charts** | System.Web.UI.DataVisualization.Charting |
| **E-Signature** | DocuSign SDK, Signority API, OneSpan SDK |
| **SSO** | SAML 2.0 (custom implementation) |
| **2FA** | Twilio SMS + Email |
| **Messaging** | IBM MQ (Fundserv) |
| **Localization** | .resx files + custom `<%$ MultiLg:key %>` expression |
| **Multi-tenancy** | DBID/DSID session-based isolation |
| **Deployment** | IIS (Windows Server) |

### Web.config Highlights

- **Target Framework**: .NET 4.5.2
- **Chart Handler**: `ChartImg.axd` registered for chart image rendering
- **Expression Builder**: `MultiLg` type registered → `VFStatic.CodeExpressionBuilder`
- **Security**: `X-Frame-Options: SAMEORIGIN`
- **Upload limit**: 1GB (`maxAllowedContentLength`)
- **Execution timeout**: 300 seconds
- **External service**: Fundata Document Library (HTTPS WCF endpoint)

---

## 9. Tài liệu hiện có

| Folder | Nội dung |
|---|---|
| `Docs/Các loại file Fundserv/` | Tài liệu về các loại file Fundserv I/E |
| `Docs/Fix Security Issue/` | Báo cáo bảo mật Red Sentry + fixes |
| `Docs/Update V36/` | Release notes V36 |

---

## 10. Tham chiếu nhanh cho Developer mới

### Bắt đầu từ đâu?

1. **Hiểu kiến trúc**: Đọc document này (System Map)
2. **Hiểu thuật ngữ**: Đọc `01-domain-glossary.md` (sẽ tạo tiếp)
3. **Hiểu framework**: Đọc `framework/` guides (auth, UI patterns, database)
4. **Tìm code**: Dùng file naming conventions ở Section 5
5. **Tìm SP**: Xem `sp-catalog/` (sẽ tạo tiếp)

### Câu hỏi thường gặp

| Câu hỏi | Trả lời nhanh |
|---|---|
| Login flow ở đâu? | `WebApp/Default.aspx.cs` → xem `framework/01-auth.md` |
| Trang chính sau login? | `Main/DashBoard.aspx` |
| Client page ở đâu? | `Main/Client.aspx` + `UBClasses/Customer.cs` |
| Trading ở đâu? | `Main/PopupTradeAdd.aspx` + `UBClasses/Trx.cs` |
| PDF reports? | `Main/PdfView.aspx.cs` → `VieFUNDPdf/CPDF.cs` |
| Menu system? | `Js/UBMenuContent_EN.js` + `Js/MenuFunctions.js` |
| DB access? | `UBConnection/CDatabase.cs` |
| Session vars? | `Inc/SessionVars.aspx` |
| Multi-language? | `App_GlobalResources/Language.*.resx` + `VFStatic/` |
| Per-tenant CSS? | `Css/UBStyle_XXXX.css` (XXXX = DSID number) |
