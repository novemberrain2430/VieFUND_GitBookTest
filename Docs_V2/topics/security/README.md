# Security

> Bảo mật hệ thống — audit results, access control fixes, encryption.

## Trạng thái: ✅ Có module guide tổng hợp

## Tài liệu trong topic này

| File | Nội dung |
|---|---|
| [Module Guide](module-guide.md) | Kiến trúc bảo mật hiện tại, trạng thái finding, checklist code review và verification |
| [Red Sentry Report](red-sentry-report.md) | Kết quả kiểm tra bảo mật Red Sentry (penetration test) |
| [Solved Result](solved-result.md) | Kết quả xử lý các lỗ hổng đã phát hiện |
| [Implementation Plan](implementation-plan.md) | Kế hoạch triển khai bảo mật: HttpModule + SecureBasePage |
| [Upload Audit](upload-audit.md) | Audit file upload functionality |

## Key Files trong codebase

| File | Size | Vai trò |
|---|---|---|
| `UBConnection/CEncryption.cs` | 32KB | DES-based reversible encryption legacy cho password/string |
| `WebApp/Default.aspx.cs` | — | Login flow, password policy |
| `VieFUNDSaml/Saml20.cs` | 53KB | SAML 2.0 SSO |
| `VFTwilio/CTwilio2FA.cs` | 5KB | 2FA via Twilio |
