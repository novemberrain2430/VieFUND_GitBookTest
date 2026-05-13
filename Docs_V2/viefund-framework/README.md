# Framework — Cách codebase hoạt động

> Tài liệu kỹ thuật cross-cutting — những patterns và components mà MỌI developer cần hiểu, không thuộc riêng topic nghiệp vụ nào.

## Tài liệu

| # | Guide | Nội dung | Trạng thái |
|---|---|---|---|
| 1 | [Auth](auth.md) | Login, SSO (SAML), 2FA (Twilio), Session management, Permissions | 📝 |
| 2 | [UI Patterns](ui-patterns.md) | Page/Panel/Popup patterns, Menu system, Layout, _FR suffix | 📝 |
| 3 | [JavaScript](javascript.md) | CommonFunctions.js (128KB), AJAX engine, client-side validation | 📝 |
| 4 | [Database Access](database-access.md) | CDatabase.cs, CBase.cs, SP execution, transactions, multi-tenant | 📝 |
| 5 | [Multi-tenancy](multitenancy.md) | DBID/DSID/DSIDSub, per-dealer CSS/logos, i18n (EN/FR) | 📝 |
| 6 | [Email & Notifications](email-notifications.md) | SendEmail.cs (84KB), CMSG.cs templates, SMS via Twilio | 📝 |
| 7 | [E-Signature](esignature.md) | DocuSign, Signority, OneSpan — khi nào dùng cái nào | 📝 |
| 8 | [Charts](charts.md) | ASP.NET Chart Control, chart types, data binding | 📝 |
| 9 | [Omnibus](omnibus/README.md) | VFOmnibus: Order lifecycle, Dividend, REV, Account Compare, Reports | ✅ |

> 📝 = Placeholder — nội dung sẽ được viết dần.

## Tại sao tách riêng?

Những patterns này **xuyên suốt toàn bộ codebase**:
- Mọi page đều dùng UI Patterns (Page/Panel/Popup)
- Mọi data access đều qua CDatabase
- Mọi trang đều có phiên bản _FR (i18n)
- Mọi trang đều cần Auth/Session

Developer cần hiểu những patterns này TRƯỚC KHI đọc business topics.
