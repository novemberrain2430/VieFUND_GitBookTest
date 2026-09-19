# Tax & Year-End

> Xử lý cuối năm: lập tax slip/receipt, duyệt và phát hành cho khách hàng, tạo file XML CRA hoặc Revenu Québec, theo dõi trạng thái nộp.

## Trạng thái: ✅ Đã audit source và SQL snapshot

- [Module Guide](module-guide.md) — phạm vi 18 loại báo cáo, luồng Pending → Approved → export/submission, bản đồ UI/BLL/SP/bảng/worker, PDF/CSV và các finding đã xác minh.
- Audit dựa trên source và SQL tracked trong workspace; chưa truy cập database đang deploy/production, DB grants, service runtime hoặc dữ liệu production.
- Generator thực tế trong source là Windows Service `Services/VieFUNDExport`; trạng thái deploy/running và version binary vẫn phải kiểm tra theo environment.

## Khu vực chức năng

| Khu vực | Nội dung |
|---|---|
| Year-End UI | Chọn tax year, report type, intermediary; xử lý Pending/Approved/File và Omnibus |
| Slip/receipt | Tạo tax slip từ giao dịch, rà soát, sửa, trả về Pending, hủy hoặc phát hành cho client |
| Electronic filing | Lưu T619, SQL tạo export request/item, worker sinh CRA/Québec XML + ZIP, cập nhật Filed/Submitted |
| Output | Tax-slip PDF, RRSP tax receipt, XML/ZIP và các filtered CSV mở bằng Excel |

## File đầu mối

| File/thư mục | Vai trò |
|---|---|
| `WebApp/Js/UBMenuContent_*.js`, `MenuFunctions.js` | Menu permission và callback mở Year-End |
| `WebApp/Main/YearEnd.aspx` | Màn hình điều phối 18 loại báo cáo |
| `WebApp/Main/YearEnd.aspx.cs` | View/tab, tax year/intermediary, download/remove/submission |
| `WebApp/Main/YearEnd_*.aspx(.cs)` | UI và event handler riêng cho từng loại báo cáo |
| `WebApp/Main/PanelT619.aspx.cs` | Validate/gom input T619 và gọi BLL; không trực tiếp tạo queue/XML |
| `DLLs/UBClasses/<Type>.cs` | BLL gọi stored procedure của từng loại slip |
| `DLLs/UBClasses/T619.cs`, `Export.cs` | BLL transmitter/submission và queue export |
| `DLLs/UBExport/CRASubmission.cs` | Đóng gói XML CRA |
| `DLLs/UBExport/CReleve.cs` | Đóng gói XML Revenu Québec |
| `Services/VieFUNDExport/` | Windows worker poll `UBExportGet`, sinh XML/ZIP và gọi `UBExportSet` |
| `VieFUNDPdf/`, `WebApp/Main/PdfView.aspx.cs` | Render tax-slip PDF |
| `MyPortfolioNew/VieFUND-Platform/src/SQLScript/000_4_CreateSP.sql` | Version-controlled SP snapshot |
| `MyPortfolioNew/VieFUND-Platform/src/SQLScript/000_3_CreateUDF.sql` | Version-controlled UDF snapshot |
| `Docs_V2/Database/Table_Description.md` | Generated column inventory; không thay thế DDL/deployed schema |
