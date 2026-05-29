# PDF & Reports

> Sinh PDF (reports, tax slips, trade confirmations), Excel export, charts.

## Tài liệu trong topic này

| Tài liệu | Mô tả |
|---|---|
| [Client Report Ad-hoc](client-report-adhoc.md) | Pipeline tạo PDF báo cáo khách hàng (thread, memory/file mode, switch/case dispatch) |

### Tài liệu liên quan
- [PDF Form Guide](../../business-logic-topics/pdf-form-guide.md) — hướng dẫn xử lý PDF form

### Key Files trong codebase

| File | Size | Vai trò |
|---|---|---|
| `VieFUNDPdf/CPDF.cs` | 916KB | Master PDF generator |
| `VieFUNDPdf/CReport.cs` | 466KB | Client reports, statements |
| `VieFUNDPdf/ClientReportAdhoc.cs` | — | Ad-hoc report dispatcher |
| `WebApp/Main/PdfView.aspx.cs` | 138KB | PDF endpoint |
| `UBExport/` | 58 files | Excel/CSV/XML export |
