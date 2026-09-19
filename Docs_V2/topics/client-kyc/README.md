# Client & KYC

> **Trạng thái bằng chứng:** đã audit lại ngày **2026-09-18** bằng source C# legacy/MyPortfolioNew, SQL snapshot trong repository và catalog bảng. Chưa query được database đang deploy, vì workspace không có DBID/connection read-only hoặc local VieFUND database.

## Tài liệu trong topic này

| File | Nội dung | Trạng thái |
|---|---|---|
| [Module Guide](module-guide.md) | Data model, Client CRUD, KYC, Plan, UI, quyền, Web Client và inventory SP | Đã đối chiếu source + SQL snapshot |

## Tài liệu liên quan

| File | Nội dung | Lưu ý |
|---|---|---|
| [Client Access Rights](../../business-logic-topics/client-access-rights.md) | Khái niệm quyền, plan type và account designation | Nguồn business; không thay thế implementation/DB evidence |
| [RepCode Explained](../../business-logic-topics/repcode-explained.md) | Khái niệm RepCode | Đối chiếu thêm với filter thực tế trong SP |
| [Table Description](../../Database/Table_Description.md) | Catalog bảng/cột được sinh từ schema snapshot | `Tables.sql` gốc không còn trong workspace |
| [Stored Procedure Catalog](../../reference/sp-catalog/README.md) | Catalog SP được sinh từ SQL snapshot | Một số path/line trong catalog có thể đã stale |

## Key files trong codebase

| File | Vai trò |
|---|---|
| [`DLLs/UBClasses/Customer.cs`](../../../DLLs/UBClasses/Customer.cs) | Baseline legacy của `CCustomer`; chứa 76 tên SP tĩnh có thể được gọi |
| [`WebApp/Main/Client.aspx.cs`](../../../WebApp/Main/Client.aspx.cs) | UI legacy chính: search, selection và navigation |
| [`WebApp/Main/PopupClientAdd.aspx.cs`](../../../WebApp/Main/PopupClientAdd.aspx.cs) | Add/edit workflow, validation, permissions và persistence |
| [`WebApp/Main/PopupClientAddBody.aspx`](../../../WebApp/Main/PopupClientAddBody.aspx) | Markup authoritative: Main section + 9 top-level tabs |
| [`MyPortfolioNew/.../UBClasses/Customer.cs`](../../../MyPortfolioNew/VieFUND-Platform/src/libs/UBClasses/Customer.cs) | Bản `CCustomer` được MyPortfolioNew compile trực tiếp; có drift so với legacy |
| [`MyPortfolioNew/.../000_4_CreateSP.sql`](../../../MyPortfolioNew/VieFUND-Platform/src/SQLScript/000_4_CreateSP.sql) | SQL snapshot chứa definitions của 76 SP trên |

Không dùng file size hoặc line count như contract. Legacy `WebApp` reference `bin/UBClass.dll`, còn MyPortfolioNew reference source project; khi sửa code phải xác định đúng runtime tree.