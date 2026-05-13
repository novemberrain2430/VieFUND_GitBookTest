# Client & KYC

> Module quản lý thông tin khách hàng (Client) và quy trình KYC (Know Your Client) — nền tảng dữ liệu của toàn bộ hệ thống VieFUND.

## Tài liệu trong topic này

| File | Nội dung | Nguồn |
|---|---|---|
| [Module Guide](module-guide.md) | Hướng dẫn chi tiết: cấu trúc dữ liệu, SP, UI, quyền truy cập | Tự viết |

## Tài liệu liên quan (Business Logic Topics)

| File | Nội dung |
|---|---|
| [Client Access Rights](../../business-logic-topics/client-access-rights.md) | Giải thích quyền truy cập, plan types, account designation |
| [RepCode Explained](../../business-logic-topics/repcode-explained.md) | Giải thích hệ thống RepCode (Representative Code) |

## Key Files trong codebase

| File | Size | Vai trò |
|---|---|---|
| `UBClasses/Customer.cs` | 251KB | BLL chính — Client CRUD, Plan, KYC |
| `WebApp/Main/Client.aspx.cs` | 505KB | UI chính — search, view, navigate |
| `WebApp/Main/PopupClientAdd.aspx.cs` | 158KB | Popup thêm/sửa Client (10 tabs) |
