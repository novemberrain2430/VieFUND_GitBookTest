# PDF & Reports

> Audit baseline: **2026-09-18**, source commit `06c586b78`. Source chuẩn dùng cho topic này là cây legacy [`DLLs/VieFUNDPdf`](../../../DLLs/VieFUNDPdf); SQL chỉ được đối chiếu với artifact trong repo, **chưa xác minh database live**. `VFCsvExport` không thuộc phạm vi.

## Mức độ kiểm chứng

| Ký hiệu | Ý nghĩa |
|---|---|
| **[S] Source** | Đã thấy call site, branch hoặc contract trong source đang checkout. |
| **[A] Artifact DB** | Đã thấy definition trong SQL/UDF dump hoặc schema snapshot của repo. |
| **[L] Live DB** | Cần metadata/dependency/constraint trên database đang deploy; audit này chưa có kết nối read-only được phê duyệt. |

Không suy diễn **[A]** thành **[L]**: SQL dump có script date `2025-11-02`, có thể khác database production. Hai cây `DLLs/VieFUNDPdf` và `MyPortfolioNew/.../libs/VieFUNDPdf` cũng đã drift; không trộn line number hoặc dispatch matrix giữa hai cây.

## Nên đọc file nào?

| Câu hỏi | Tài liệu |
|---|---|
| Report nghiệp vụ nằm ở UI/class/SP/table nào? | [Report Catalog](report-catalog.md) |
| “Run now” nhiều client tạo và lưu PDF thế nào? | [Client Report Ad-hoc](client-report-adhoc.md) |
| `PdfBuilder`, `CForm`, template, merge, route và response hoạt động ra sao? | [PDF Workflow](../../viefund-framework/pdf/pdf-workflow.md) |
| Chart Web Forms/PDF lấy data và render thế nào? | [Charts](../../viefund-framework/charts.md) |
| Fill một PDF form cụ thể ra sao? | [PDF Form Guide](../../business-logic-topics/pdf-form-guide.md) |
| Tax slip đi từ workbench tới PDF/XML/release thế nào? | [Tax & Year-End](../tax-yearend/module-guide.md) |

## Phạm vi đã audit

- router WebApp/WebClient, route PDF và các route trả content không phải PDF;
- report vẽ từ đầu, AcroForm/template, merge và object đã lưu;
- client/advisor statements, performance, portfolio, family;
- order, receipt, trade confirmation, ticket, basket, settlement, cheque, commission và payroll;
- compliance/KYC/risk/uniformity, tax/year-end, GIC, AUA, dashboard và transfer;
- request TMP, report service, persistence và HTTP download boundary;
- caller ngoài Web Forms như `VieFUNDReport` service và `RespApp4Rep`;
- SP/UDF/table contract có artifact trong repo và các điểm còn phải kiểm tra DB live.

## Source map chính

| Thành phần | Vai trò đã xác minh |
|---|---|
| [`DLLs/PdfBase/PdfBase.csproj`](../../../DLLs/PdfBase/PdfBase.csproj) | PDF engine vendored/fork dùng namespace `PdfBase`; project không reference package/namespace `iTextSharp`. |
| [`DLLs/VieFUNDPdf/CPDF.cs`](../../../DLLs/VieFUNDPdf/CPDF.cs) | Phần chính của partial `PdfBuilder`: document/page, render, chart, merge, font, file và object helper. |
| [`DLLs/VieFUNDPdf/SysPlan.cs`](../../../DLLs/VieFUNDPdf/SysPlan.cs) | Phần còn lại của partial `PdfBuilder`. |
| [`DLLs/VieFUNDPdf/CReport.cs`](../../../DLLs/VieFUNDPdf/CReport.cs) | Request lifecycle, statement/report generator, persistence và scheduled dispatcher. |
| [`DLLs/VieFUNDPdf/ClientReportAdhoc.cs`](../../../DLLs/VieFUNDPdf/ClientReportAdhoc.cs) | Raw background thread và dispatch report nhiều client. |
| [`DLLs/VieFUNDPdf/CForm.cs`](../../../DLLs/VieFUNDPdf/CForm.cs) | Đọc template path từ DB, fill/rename/remove field, flatten và merge AcroForm. |
| [`DLLs/VieFUNDPdf/VieFUNDPdf.csproj`](../../../DLLs/VieFUNDPdf/VieFUNDPdf.csproj) | Compile 52 file business `.cs`, 53 nếu tính `AssemblyInfo.cs`; `CBulkConversionBasket.cs` không được compile. |
| [`WebApp/Main/PdfView.aspx.cs`](../../../WebApp/Main/PdfView.aspx.cs) | Router/HTTP boundary chính; route `888` có security contract khác và route `100/101` không trả PDF. |
| [`WebClient/Main/PdfView.aspx.cs`](../../../WebClient/Main/PdfView.aspx.cs) | Router client rút gọn: `98`, `99`, `26`, `1/default`. |
| [`Services/VieFUNDReport/VieFundReport.cs`](../../../Services/VieFUNDReport/VieFundReport.cs) | Windows service poll request bền và gọi `CReport.ServiceCall`; đồng thời gọi dashboard service. |
| [`RespApp4Rep/VieFund/Services/OnboardingV2Service.cs`](../../../RespApp4Rep/VieFund/Services/OnboardingV2Service.cs) | Caller API/onboarding dùng `CReport`, `PdfBuilder` và form helpers ngoài router Web Forms. |
| [`WebApp/Pdf`](../../../WebApp/Pdf) | Tập static PDF/reference file được publish; template runtime thực tế có thể đến từ `FullFileName` do DB trả về. |
| [`000_4_CreateSP.sql`](../../../MyPortfolioNew/VieFUND-Platform/src/SQLScript/000_4_CreateSP.sql) | SQL artifact dùng để kiểm tra core request/TMP SP; không phải bằng chứng database live. |
| [`Table_Description.md`](../../Database/Table_Description.md) | Snapshot column cho nhóm report bền; không có DDL đầy đủ cho TMP tables. |

## Kết luận kiến trúc

“Report” không phải một pipeline duy nhất. Có ít nhất ba lifecycle dữ liệu:

1. preview/run-now lưu `UB_ReportObjTMP` theo user/type;
2. report bền dùng `UB_ReportRequest`, `UB_ReportTask`, `UB_ReportMaster/Client/Plan/Account/Trx` và được service poll;
3. object theo domain lưu ở confirmation, tax, document, payroll hoặc bảng riêng.

Source chủ yếu truyền untyped `DataSet`; nhiều SP đặt tên result set bằng column `RecType`, còn options là cặp chuỗi `KeyID/KeyValue`. Vì vậy mọi thay đổi phải trace từ caller/URL hoặc request creator đến generator, SP result contract, storage và download authorization; chỉ sửa code vẽ PDF thường chưa đủ.

## Findings ưu tiên

| ID | Bằng chứng | Nội dung |
|---|---|---|
| `PDF-ADHOC-01` | [S] | File mode (`>5` client) thiếu type `11,12,14,15,50`; source chuẩn không có ad-hoc type `104`. |
| `PDF-ADHOC-02` | [S] | File mode đọc `stream.Length - 1`, cắt byte cuối PDF; pattern còn xuất hiện trong `CForm` và `CPortfolioFundFact`. |
| `PDF-ADHOC-03` | [S] | Abort/exception có thể bỏ qua close/delete; `OpenOrCreate` còn có nguy cơ giữ stale tail khi reuse filename. |
| `PDF-ADHOC-04` | [A]/[L] | `UBReportPdfObjTMPAdd` dùng slot user/type, `TOP 1` không `ORDER BY`; chưa có DDL live để chứng minh unique constraint. |
| `PDF-ADHOC-05` | [A]/[L] | Core TMP SP trộn tên local `dbo` và `VieFUNDTMP.dbo`; cần kiểm tra synonym/physical object live. |
| `PDF-ADHOC-06` | [A]/[L] | Artifact `UBReportRequestTMP` nhận `iUserID` nhưng select request chỉ theo `iRequestID`; phải chứng minh owner check ở lớp khác/live DB. |
| `PDF-ROUTE-47` | [S] | Có case label nhưng block rỗng, trả no-data. |
| `PDF-ROUTE-888` | [S]/[L] | Bỏ session-token URL chuẩn; cần chứng minh authorization trong BLL/SP. |

Chi tiết nằm trong [Report Catalog](report-catalog.md#6-findings-xuyên-topic), [Client Report Ad-hoc](client-report-adhoc.md#8-findings) và [PDF Workflow](../../viefund-framework/pdf/pdf-workflow.md#10-error-handling-và-điểm-cần-theo-dõi).

## Ranh giới audit

- Không kết nối registry/DB live, không chạy report SP vì một số SP có side effect.
- Chưa render/smoke-test route bằng dữ liệu thật và chưa chứng minh DLL deployed khớp source checkout.
- Tên SP động được ghi theo family; giá trị thực phụ thuộc option/data runtime.
- Table nêu trong catalog có thể mới chỉ là schema snapshot hoặc suy ra theo domain; muốn kết luận dependency phải xem SP definition hoặc `sys.sql_expression_dependencies` trên DB live.
