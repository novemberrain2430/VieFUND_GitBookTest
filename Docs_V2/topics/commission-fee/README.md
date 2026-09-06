# Commission & Fee

> Hoa hồng (trailing commission, DSC, front-end load) và phí (management fee, advisory fee, fee redemptions).

## Trạng thái: ✅ Có module guide

- [Module Guide](module-guide.md) — hai luồng Commission/Fee, processing pipeline, cấu hình và stored procedure chính.

### Key Files trong codebase

| File | Size | Vai trò |
|---|---|---|
| `UBClasses/CommissionRevenue.cs` | 176KB | Commission processing |
| `UBClasses/Fee.cs` | 108KB | Fee management |
| `WebApp/Main/CommissionView.aspx.cs` | 250KB | Commission UI |
