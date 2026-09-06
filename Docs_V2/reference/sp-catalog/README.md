# SP Catalog — Stored Procedures Reference

> Điểm vào để tra cứu stored procedure từ SQL snapshot sang C# caller và quan hệ procedure gọi procedure. Catalog được dựng từ source ngày 2026-09-05; `VFCsvExport` không nằm trong phạm vi.

## 1. Kết luận nhanh

Catalog không còn dựa trên ước lượng `1.132+ SP references` của placeholder. Phép quét có thể tái tạo hiện cho kết quả:

| Chỉ số | Số lượng | Cách hiểu |
|---|---:|---|
| Procedure definition duy nhất trong SQL snapshot | 5.544 | `CREATE PROC/PROCEDURE` trong `ScriptDB/000_4_CreateSP.sql` |
| Quan hệ SQL `procedure → procedure` | 5.377 | Cạnh duy nhất nhận diện qua `EXEC/EXECUTE` giữa các procedure có trong snapshot |
| `.SetSP(...)` trong C# source thô | 2.463 | Giữ cùng cách đếm với Database Access; gồm cả call nằm trong comment |
| `.SetSP(...)` trong C# sau khi bỏ comment | 2.422 | Call site dùng cho catalog hiện hành |
| Tên procedure tĩnh duy nhất trong C# active | 1.616 | Gồm literal trực tiếp và các literal trong biểu thức như ternary |
| Tên tĩnh khớp SQL snapshot | 1.583 | Có definition cùng tên sau khi chuẩn hóa `[dbo].[Name]` về `Name` |
| Tên tĩnh không khớp SQL snapshot | 33 | Tín hiệu cần xác minh source/deployment/snapshot, chưa phải bug đã kết luận |
| Call site dùng tên động | 693 | Đối số là biến, mảng hoặc parameter; không thể kết luận tên runtime chỉ bằng regex |
| SQL definition chưa thấy tên tĩnh từ C# | 3.961 | Không được gọi là “unused”: có thể do SQL nội bộ, job, app ngoài repo hoặc tên động |

## 2. Bộ tài liệu

| File | Dùng khi nào |
|---|---|
| [Inventory đầy đủ](inventory.md) | Tìm một trong 5.544 procedure, mở đúng dòng definition, xem số caller C# và quan hệ SQL gọi vào/gọi ra |
| [Danh mục theo chủ đề](by-topic/) | Thu hẹp theo Account/Plan, Client/KYC, Trading, Tax/Year-End, Onboarding, Omnibus... |
| [Chênh lệch C# ↔ SQL](source-gaps.md) | Xem đủ 33 tên tĩnh không có definition khớp trong snapshot và caller mẫu |
| [Call site tên động](dynamic-calls.md) | Lần ngược 693 `SetSP(variable/expression)` chưa thể resolve tĩnh |
| [`generate-catalog.ps1`](generate-catalog.ps1) | Tái tạo catalog sau khi source hoặc SQL snapshot thay đổi |

Mỗi dòng inventory có:

- tên procedure và link tới đúng dòng trong SQL snapshot;
- chủ đề gợi ý theo naming heuristic;
- số call site/số file C# chứa tên tĩnh và một caller mẫu;
- số procedure SQL gọi vào và số procedure mà procedure hiện tại gọi ra.

## 3. Cách tra cứu

### Biết tên procedure

Tìm trong [inventory.md](inventory.md), ví dụ `UBPlanAdd`. Từ một dòng có thể mở definition SQL và caller C# mẫu. Nếu cột C# là `—`, kiểm tra tiếp quan hệ SQL và [dynamic-calls.md](dynamic-calls.md); không kết luận procedure đã chết.

Tra nhanh tại terminal:

```powershell
rg -n 'UBPlanAdd' Docs_V2/reference/sp-catalog
rg -n 'UBPlanAdd' --glob '*.cs' --glob '!VFCsvExport/**' --glob '!**/Backup/**' --glob '!**/obj/**'
```

### Chỉ biết module nghiệp vụ

Mở [by-topic/README.md](by-topic/README.md), chọn nhóm rồi dùng tên/caller để xác minh. Phân nhóm là heuristic theo tên, không phải ownership chính thức; procedure có tên chung có thể nằm trong `Shared / Other` dù được module cụ thể sử dụng.

### Đi từ code sang SQL

1. Với `SetSP("Name")` hoặc ternary chứa literal, tìm `Name` trong inventory.
2. Với `SetSP(SPName)`, mở dòng tương ứng trong [dynamic-calls.md](dynamic-calls.md), lần ngược parameter/assignment/caller.
3. Kiểm tra definition, parameter, DSID/user scope, result set và return code trực tiếp trong SQL; catalog chỉ lập chỉ mục, không thay thế contract review.

## 4. Phạm vi và độ tin cậy

Nguồn quét:

- `ScriptDB/000_4_CreateSP.sql` cho procedure definition và lời gọi `EXEC/EXECUTE`;
- toàn bộ `.cs` trong workspace, loại thư mục `Backup`, `obj` và toàn bộ `VFCsvExport`;
- comment block và dòng comment C# được bỏ trước khi lập inventory active.

Các giới hạn cần giữ khi đọc:

- Đây là snapshot repo, không chứng minh schema production đang giống hệt.
- Regex không resolve được tên được truyền qua nhiều tầng method, cấu hình DB, reflection hay dynamic SQL.
- Quan hệ `EXEC/EXECUTE` là phân tích cú pháp tĩnh, không thay thế dependency metadata của SQL Server.
- “Có caller” chỉ chứng minh có reference trong source; không chứng minh route đang được người dùng chạy.
- “Không thấy caller C# tĩnh” không chứng minh procedure không dùng.

## 5. Liên kết sang phân tích nghiệp vụ

Catalog phục vụ tra cứu diện rộng; ý nghĩa và workflow của các SP trọng yếu nằm trong các guide đã đối chiếu source:

- [Trading & Orders](../../topics/trading-orders/module-guide.md)
- [Client & KYC](../../topics/client-kyc/module-guide.md)
- [Commission & Fee](../../topics/commission-fee/module-guide.md)
- [Fund & GIC](../../topics/fund-gic/module-guide.md)
- [Account & Plan](../../topics/account-plan/module-guide.md)
- [Compliance](../../topics/compliance/module-guide.md)
- [Tax & Year-End](../../topics/tax-yearend/module-guide.md)
- [Onboarding](../../topics/onboarding/README.md)
- [Fundserv](../../topics/fundserv/README.md)
- [Database Access](../../viefund-framework/database-access.md)

## 6. Tín hiệu cần theo dõi

1. Có 33 tên procedure tĩnh trong C# active chưa có definition khớp snapshot. Nhóm này gồm Omnibus, CIRO, fee, tax/year-end, password và một số utility; cần xác minh deployment DB trước khi sửa code.
2. Có 693 call site tên động. Muốn tăng coverage phải phân tích theo method/call graph, không nên gom mọi assignment cùng file vì sẽ tạo mapping giả.
3. 3.961 definition chưa thấy tên tĩnh từ C# vẫn có thể được procedure khác, SQL Agent, integration hoặc application ngoài workspace gọi.

Chưa có bug mới được kết luận chỉ từ catalog. Ba mục trên là khoảng trống truy vết cần kiểm tra có mục tiêu trong Traceability Matrix, không phải bằng chứng lỗi production.

## 7. Tái tạo

Chạy từ repository root:

```powershell
& Docs_V2/reference/sp-catalog/generate-catalog.ps1
```

Script sinh lại `inventory.md`, `source-gaps.md`, `dynamic-calls.md` và toàn bộ file trong `by-topic/`. Không sửa tay các file sinh tự động.
