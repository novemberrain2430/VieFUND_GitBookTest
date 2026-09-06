# Compliance

> Tuân thủ quy định — trade suitability, account/KYC approval, trend surveillance và AML/FINTRAC.

## Trạng thái: ✅ Có module guide

- [Module Guide](module-guide.md) — bản đồ nghiệp vụ, luồng phê duyệt, risk/objective, bảng dữ liệu, stored procedure và checklist debug.

## Các vùng chức năng chính

| Vùng | Mô tả |
|---|---|
| Trade suitability | Kiểm tra trước/sau giao dịch và queue phê duyệt hai cấp |
| Account/KYC approval | New plan, account opening, KYC update và deficiency |
| Trend surveillance | Frequent trading, commission, short-term, DSC/fee, two-sided, Low MER |
| AML/FINTRAC | Import watchlist, name matching, scan và review report |

## Key files trong codebase

| File | Vai trò |
|---|---|
| `UBClasses/Compliance.cs` | Business façade, DB calls, PDF/Excel |
| `UBClasses/FINTRAC.cs` | Watchlist parser/import và AML check |
| `WebApp/Main/ComplianceTrx.aspx.cs` | Trade compliance review UI |
| `WebApp/Main/ComplianceAccount.aspx.cs` | Account opening review UI |
| `WebApp/Main/ComplianceAccountUpdate.aspx.cs` | KYC update review UI |
| `WebApp/Main/ComplianceNewPlan.aspx.cs` | New plan approval UI |
| `WebApp/Main/FINTRACView.aspx.cs` | FINTRAC reporting UI |
| `ScriptDB/000_4_CreateSP.sql` | Stored procedures và logic DB chính |
