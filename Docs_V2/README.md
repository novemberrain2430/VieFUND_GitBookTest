# VieFundAG — Hệ thống tài liệu kỹ thuật & nghiệp vụ

> **Mục tiêu**: Developer mới tiếp cận → có hệ thống tài liệu rõ ràng → tự mình tìm hiểu, nắm bắt hệ thống.
>
> **Đối tượng**: Developer .NET có kinh nghiệm, chưa biết nghiệp vụ quỹ đầu tư / quy định Canada.

---

## 📚 Cách sử dụng tài liệu

### Tầng 1 — Bắt đầu từ đây (Getting Started)

Đọc tuần tự khi mới vào dự án:

| # | Tài liệu | Nội dung |
|---|---|---|
| 1 | [System Map](getting-started/system-map.md) | Bản đồ hệ thống: 26 projects, kiến trúc, conventions |
| 2 | [Domain Glossary](getting-started/domain-glossary.md) | 100+ thuật ngữ nghiệp vụ quỹ đầu tư Canada |

### Tầng 2A — Tra cứu theo chủ đề nghiệp vụ (Topics)

Khi làm việc trên một lĩnh vực cụ thể → vào [topics/](topics/README.md):

| Topic | Mô tả |
|---|---|
| [Client & KYC](topics/client-kyc/) | Quản lý khách hàng, KYC, AML |
| [Account & Plan](topics/account-plan/) | Tài khoản đầu tư, plan types |
| [Trading & Orders](topics/trading-orders/) | Giao dịch, order lifecycle |
| [FundServ](topics/fundserv/) | Tích hợp FundServ, file I/E, V36 |
| [Commission & Fee](topics/commission-fee/) | Hoa hồng, phí |
| [Fund & GIC](topics/fund-gic/) | Quỹ đầu tư, GIC |
| [Compliance](topics/compliance/) | Tuân thủ quy định |
| [Tax & Year-End](topics/tax-yearend/) | Thuế, year-end processing |
| [Settlement](topics/settlement/) | Thanh toán |
| [Security](topics/security/) | Bảo mật, audit, encryption |
| [PDF & Reports](topics/pdf-reports/) | Sinh PDF, export Excel |
| [Onboarding](topics/onboarding/) | WebClient portal, onboarding |

### Tầng 2B — Kỹ thuật Cross-cutting (Framework)

Hiểu cách codebase hoạt động → vào [viefund-framework/](viefund-framework/README.md):

| Guide | Nội dung |
|---|---|
| [Auth](viefund-framework/auth.md) | Login, SSO, 2FA, Session, Permissions |
| [UI Patterns](viefund-framework/ui-patterns.md) | Page/Panel/Popup, Menu, Layout |
| [JavaScript](viefund-framework/javascript.md) | CommonFunctions.js, AJAX |
| [Database Access](viefund-framework/database-access.md) | CDatabase, CBase, SP execution |
| [Multi-tenancy](viefund-framework/multitenancy.md) | DBID/DSID, i18n |
| [Email & Notifications](viefund-framework/email-notifications.md) | SendEmail, SMS, Twilio |
| [E-Signature](viefund-framework/esignature.md) | DocuSign, Signority, OneSpan |
| [Charts](viefund-framework/charts.md) | Chart controls |

### Tầng 3 — Tra cứu nhanh (Reference)

Tìm kiếm nhanh → vào [reference/](reference/README.md):

| Reference | Nội dung |
|---|---|
| [Data Dictionary](reference/data-dictionary.md) | Bảng, columns, data types |
| [SP Catalog](reference/sp-catalog/) | Stored Procedures theo module |
| [Screen Catalog](reference/screen-catalog.md) | UI screens → data mapping |
| [Traceability Matrix](reference/traceability-matrix.md) | UI → Database tracing |

### Tài liệu bổ sung

| Folder | Nội dung |
|---|---|
| [Business Logic Topics](business-logic-topics/) | Tài liệu giải thích từ người phát triển gốc |
| [Tools](tools/) | Scripts testing, mock FundServ responses |

---

## 🗂️ Quy tắc thêm tài liệu mới

```
Tôi có nội dung mới →
├── Thuộc chủ đề nghiệp vụ cụ thể? → topics/<topic>/<file>.md
├── Kỹ thuật cross-cutting? → viefund-framework/<file>.md
├── Legacy/ghi chú thô? → business-logic-topics/<file>.md
├── Công cụ/script? → tools/<file>
└── Dữ liệu tra cứu? → reference/<file>.md
```
