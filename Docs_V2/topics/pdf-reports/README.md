# PDF & Reports

> Trạng thái: **hoàn thành topic guide, đã đối chiếu source/SP/DB snapshot ngày 2026-09-05**. `VFCsvExport` không thuộc phạm vi.

## Nên đọc file nào?

| Câu hỏi | Tài liệu |
|---|---|
| Report nghiệp vụ nằm ở UI/class/SP/table nào? | [Report Catalog](report-catalog.md) |
| “Run now” nhiều client tạo và lưu PDF thế nào? | [Client Report Ad-hoc](client-report-adhoc.md) |
| `PdfBuilder`, `CForm`, template, merge, route và response hoạt động ra sao? | [PDF Workflow](../../viefund-framework/pdf/pdf-workflow.md) |
| Chart Web Forms/PDF lấy data và render thế nào? | [Charts](../../viefund-framework/charts.md) |
| Fill một PDF form cụ thể ra sao? | [PDF Form Guide](../../business-logic-topics/pdf-form-guide.md) |
| Tax slip đi từ workbench tới PDF/XML/release thế nào? | [Tax & Year-End](../tax-yearend/module-guide.md) |

## Phạm vi đã phủ

- 98 nhãn route trong WebApp `PdfView` và router rút gọn của WebClient;
- report vẽ từ đầu, AcroForm/template, merge và object đã lưu;
- client/advisor statements, performance, portfolio, family;
- order, receipt, trade confirmation, ticket và basket;
- settlement, cheque, commission và payroll;
- compliance/KYC/risk/uniformity;
- tax slips/year-end;
- GIC, AUA, dashboard, transfer, document và e-sign;
- request TMP/scheduled, persistence và download boundary;
- findings về route, authorization, file mode, temp file và concurrency.

## Source map chính

| Thành phần | Quy mô/vai trò đã xác minh |
|---|---|
| [`VieFUNDPdf/CPDF.cs`](../../../VieFUNDPdf/CPDF.cs) | Primitive/helper PDF lớn; không phải nơi duy nhất chứa business generator. |
| [`VieFUNDPdf/CReport.cs`](../../../VieFUNDPdf/CReport.cs) | Partial class cho statements, report request, storage và nhiều generator. |
| [`VieFUNDPdf/ClientReportAdhoc.cs`](../../../VieFUNDPdf/ClientReportAdhoc.cs) | Background thread và dispatch report nhiều client. |
| [`VieFUNDPdf/VieFUNDPdf.csproj`](../../../VieFUNDPdf/VieFUNDPdf.csproj#L64) | 52 file business `.cs` được compile, 53 nếu tính `AssemblyInfo.cs`. |
| [`WebApp/Main/PdfView.aspx.cs`](../../../WebApp/Main/PdfView.aspx.cs#L109) | Router chính, 98 nhãn `case`. |
| [`WebClient/Main/PdfView.aspx.cs`](../../../WebClient/Main/PdfView.aspx.cs#L20) | Router client chỉ có `98`, `99`, `26`, `1/default`. |
| [`VieFUNDPdf/CPDF.cs`](../../../VieFUNDPdf/CPDF.cs#L1480), [`SysPlan.cs`](../../../VieFUNDPdf/SysPlan.cs#L20) và `PdfBase/` | Hai phần của `PdfBuilder` cùng các primitive PDF cho document/page/header/footer/merge/form. |
| [`WebApp/Pdf`](../../../WebApp/Pdf) | Template/static PDF; cần kiểm tra publish output khi thêm file. |

## Kết luận kiến trúc

“Report” không phải một pipeline duy nhất. Hệ thống có ít nhất ba lifecycle dữ liệu:

1. preview/run-now lưu `UB_ReportObjTMP` theo user/type;
2. report bền dùng nhóm `UB_ReportRequest`, `UB_ReportTask`, `UB_ReportMaster/Client/Plan/Account/Trx`;
3. object theo domain lưu ở confirmation, tax, document, payroll hoặc bảng riêng.

Mọi thay đổi report nên bắt đầu từ caller UI và kết thúc ở SQL/table + nơi lưu output; chỉ sửa generator PDF thường chưa đủ.

## Findings ưu tiên từ lần hoàn thiện này

- `PDF-ADHOC-01`: file mode (`>5` client) thiếu type `11,12,14,50,104`.
- `PDF-ADHOC-02`: file mode đọc `stream.Length - 1`, cắt byte cuối PDF.
- `PDF-ADHOC-03`: abort/exception có thể để lại handle/file tạm.
- `PDF-ADHOC-04`: output TMP upsert theo user/type, có rủi ro chạy chồng request.
- Các finding route `47`, `888` và `CommPayrollHistoryPrn_FR` đã được giữ trong PDF Workflow/catalog.

Đây là ghi nhận bug/risk trong lúc phân tích; chưa sửa code runtime theo đúng mục tiêu hiện tại là hoàn thiện tài liệu.
