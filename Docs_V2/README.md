# VieFundAG — Hệ thống tài liệu kỹ thuật & nghiệp vụ

> **Mục tiêu**: Developer mới tiếp cận → có hệ thống tài liệu rõ ràng → tự mình tìm hiểu, nắm bắt hệ thống.
>
> **Đối tượng**: Developer .NET có kinh nghiệm, chưa biết nghiệp vụ quỹ đầu tư / quy định Canada.

**Trạng thái tổng thể**: xem [Rà soát tổng thể — Checklist và phần việc còn lại](project-audit-checklist.md). Kế hoạch gốc có 25 deliverable hoàn thành và 1 deliverable `VFCsvExport` được bỏ qua theo yêu cầu; các topic ngoài kế hoạch và backlog bug được liệt kê riêng.

---

## 📚 Cách sử dụng tài liệu

### Tầng 1 — Bắt đầu từ đây (Getting Started)

Đọc tuần tự khi mới vào dự án:

| # | Tài liệu | Nội dung |
|---|---|---|
| 1 | [System Map](getting-started/system-map.md) | Bản đồ hệ thống: 26 projects, kiến trúc, conventions |
| 2 | [Domain Glossary](getting-started/domain-glossary.md) | thuật ngữ nghiệp vụ quỹ đầu tư Canada |

### Tầng 2A — Tra cứu theo chủ đề nghiệp vụ (Topics)

Khi làm việc trên một lĩnh vực cụ thể → vào [topics/](topics/README.md):

| Topic | Mô tả |
|---|---|
| [Client & KYC](topics/client-kyc/) | Quản lý khách hàng, KYC, AML |
| [Account & Plan](topics/account-plan/) | Tài khoản đầu tư, plan types |
| [Trading & Orders](topics/trading-orders/) | Giao dịch, order lifecycle, từ điển status/error/hard-code |
| [FundServ](topics/fundserv/) | Tích hợp FundServ, file I/E, V36 |
| [Commission & Fee](topics/commission-fee/) | Hoa hồng, phí |
| [Fund & GIC](topics/fund-gic/) | Quỹ đầu tư, GIC |
| [Compliance](topics/compliance/) | Tuân thủ quy định |
| [Tax & Year-End](topics/tax-yearend/) | Thuế, year-end processing |
| [Settlement](topics/settlement/) | Thanh toán |
| [Security](topics/security/) | Bảo mật, audit, encryption |
| [PDF & Reports](topics/pdf-reports/) | Report catalog, PDF, form, tax slip và confirmation |
| [Onboarding](topics/onboarding/) | WebClient portal, onboarding |

### Tầng 2B — Kỹ thuật CodeBase (VieFUND Framework)

Hiểu cách codebase hoạt động → vào [viefund-framework/](viefund-framework/README.md):

| Guide | Nội dung |
|---|---|
| [Auth](viefund-framework/auth.md) | Login, SSO/SAML, 2FA, Session và Permissions |
| [UI Patterns](viefund-framework/ui-patterns.md) | Page/Panel/Popup, include layout, menu, UpdatePanel và EN/FR |
| [JavaScript](viefund-framework/javascript.md) | CommonFunctions.js, AJAX engine và client-side validation |
| [Database Access](viefund-framework/database-access.md) | DBID/Registry, CDatabase, SP/result contract, transaction và lỗi |
| [Multi-tenancy](viefund-framework/multitenancy.md) | DBID/DSID, data scope, settings, branding và i18n EN/FR |
| [Email & Notifications](viefund-framework/email-notifications.md) | Notification/outbox, SMTP, template, SMS/2FA và vận hành |
| [E-Signature](viefund-framework/esignature.md) | DocuSign, Signority, OneSpan và routing theo dealer |
| [Signority Workflow](viefund-framework/signority/esignority-workflow.md) | Luồng Signority chi tiết |
| [Charts](viefund-framework/charts.md) | Hai pipeline Web Forms/PDF, data binding và debug |
| [PDF Workflow](viefund-framework/pdf/pdf-workflow.md) | VieFUNDPdf, PdfView routing, form/report/tax, lưu trữ và debug |
| [Omnibus](viefund-framework/omnibus/README.md) | Kiến trúc VFOmnibus, order, dividend, REV, account compare và reports |
| [Onboarding](topics/onboarding/README.md) | ASMX contract, client/plan/order import, manual approval và DB map |

### Tầng 3 — Tra cứu nhanh (Reference)

Tìm kiếm nhanh → vào [reference/](reference/README.md):

| Reference | Nội dung |
|---|---|
| [Data Dictionary](reference/data-dictionary.md) | Bản đồ 1.127 bảng, conventions, quan hệ lõi và cách xác minh |
| [ERD — 12 bảng cốt lõi](reference/12 bảng cốt lõi.md) | Quan hệ giữa các entity dữ liệu trọng yếu |
| [SP Catalog](reference/sp-catalog/README.md) | 5.544 stored procedure, caller map, SQL call graph và source gaps |
| [Screen Catalog](reference/screen-catalog.md) | 1.358 ASPX artifact → endpoint/fragment → code-behind/include → trace dữ liệu |
| [Traceability Matrix](reference/traceability-matrix.md) | 50 luồng UI/API/service → code → SP → Database |
| [XML Schema & Validation](reference/xml-validation-guide.md) | XML outgoing/incoming, version, XSD Collections và findings |

### Tài liệu và công cụ bổ sung

| Tài liệu | Nội dung |
|---|---|
| [Rà soát tổng thể](project-audit-checklist.md) | Trạng thái deliverable, mức bằng chứng, giới hạn và backlog còn lại |
| [Business Logic Topics](business-logic-topics/README.md) | Tài liệu giải thích từ người phát triển gốc |
| [Database — Table Description](Database/Table_Description.md) | Tài liệu mô tả bảng dữ liệu bổ sung |
| [Tools](tools/README.md) | Scripts testing và mock FundServ responses |
| [Triển khai GitBook](GitBook/GitBookDeploy.md) | Hướng dẫn build và publish hệ thống tài liệu |

---

## 🗂️ Quy tắc thêm tài liệu mới

```
Tôi có nội dung mới →
├── Thuộc chủ đề nghiệp vụ cụ thể? → topics/<topic>/<file>.md
├── Framework ? → viefund-framework/<file>.md
├── Legacy/ghi chú thô? → business-logic-topics/<file>.md
├── Công cụ/script? → tools/<file>
└── Dữ liệu tra cứu? → reference/<file>.md
```
