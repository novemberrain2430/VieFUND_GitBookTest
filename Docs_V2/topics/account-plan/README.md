# Account & Plan

> Tài khoản đầu tư (Plan) — RRSP, TFSA, RRIF, FHSA, OPEN, RESP, LIRA... và quan hệ Client → Plan → Fund Position.

## Trạng thái: ✅ Có module guide

- [Module Guide](module-guide.md) — mô hình Client → Plan → account/position, plan types, tạo/sửa plan và các stored procedure chính.

### Key Files trong codebase

| File | Size | Vai trò |
|---|---|---|
| `UBClasses/Plan.cs` | 207KB | BLL chính — Plan management |
| `UBClasses/FundAccount.cs` | 132KB | Fund account processing |
| `WebApp/Main/PopupPlanAdd.aspx.cs` | — | UI thêm/sửa Plan |
| `WebApp/Main/AccountView.aspx.cs` | — | Account view |

### Tài liệu liên quan
- [Client Access Rights](../../business-logic-topics/client-access-rights.md) — giải thích plan types, account designation
