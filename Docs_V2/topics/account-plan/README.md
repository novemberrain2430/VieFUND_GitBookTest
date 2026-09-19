# Account & Plan

> Tài khoản đầu tư (Plan) và quan hệ Client → Plan → account/position, bao gồm beneficiary, joint holder, RRIF, RESP, TFSA và các luồng payment/redemption liên quan.

## Tài liệu

| File | Nội dung | Trạng thái đối chiếu |
|---|---|---|
| [Module Guide](module-guide.md) | Mô hình dữ liệu, CRUD, business flow, method/SP, UI entry point và giới hạn database evidence | Đã audit với source và SQL snapshot trong repository |

## Source chính đã đối chiếu

| Khu vực | Source được project tham chiếu |
|---|---|
| Plan BLL | `MyPortfolioNew/VieFUND-Platform/src/libs/UBClasses/Plan.cs` |
| RRIF BLL | `MyPortfolioNew/VieFUND-Platform/src/libs/UBClasses/RRIFSetting.cs` |
| Add/Edit Plan | `MyPortfolioNew/VieFUND-Platform/src/apps/WebApp/Main/PopupPlanAdd.aspx.cs` |
| Client-level Plan CRUD | `MyPortfolioNew/VieFUND-Platform/src/apps/WebApp/Main/Client.aspx.cs` |
| Plan search/report | `MyPortfolioNew/VieFUND-Platform/src/apps/WebApp/Main/PlanView.aspx.cs` |
| Database procedures | `MyPortfolioNew/VieFUND-Platform/src/SQLScript/000_4_CreateSP.sql` |

`DLLs/UBClasses/*` và cây `WebApp/*` ở cấp repository chứa các bản song song/legacy. Khi tra cứu hành vi hiện tại trong tài liệu này, ưu tiên cây `MyPortfolioNew/VieFUND-Platform/src` vì `WebApp.csproj` tham chiếu project `src/libs/UBClasses/UBClass.csproj`. Điều này không chứng minh phiên bản đang chạy ở production.

## Giới hạn xác minh database

Repository có procedure/UDF/deployment scripts nhưng không có đầy đủ base-table DDL, PK/FK/check constraints, lookup seed data, trigger definitions hoặc migration history. Vì vậy tài liệu phân biệt rõ:

- object/column đã thấy trong SQL;
- quan hệ được suy ra từ join và DML, chưa khẳng định là FK vật lý;
- hành vi cần kiểm tra lại trên live database theo đúng environment/DSID.

### Tài liệu liên quan

- [Client Access Rights](../../business-logic-topics/client-access-rights.md)
- [Client & KYC](../client-kyc/module-guide.md)
- [Trading & Orders](../trading-orders/module-guide.md)
- [Fund & GIC](../fund-gic/module-guide.md)
