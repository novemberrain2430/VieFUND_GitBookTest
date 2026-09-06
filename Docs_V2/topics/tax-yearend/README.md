# Tax & Year-End

> Xử lý cuối năm: lập tax slip/receipt, duyệt và phát hành cho khách hàng, tạo file XML CRA hoặc Revenu Québec, theo dõi trạng thái nộp.

## Trạng thái: ✅ Có module guide

- [Module Guide](module-guide.md) — phạm vi 18 loại báo cáo, luồng Pending → Approved → file/submission, bản đồ C#/SP/bảng, PDF và các điểm bất nhất đã xác minh.
- Phân tích này chủ động loại `VFCsvExport` khỏi phạm vi theo yêu cầu.

## Khu vực chức năng

| Khu vực | Nội dung |
|---|---|
| Year-End UI | Chọn tax year, report type, intermediary; xử lý Pending/Approved/File và Omnibus |
| Slip/receipt | Tạo tax slip từ giao dịch, rà soát, sửa, trả về Pending, hủy hoặc phát hành cho client |
| Electronic filing | Lưu transmitter T619, tạo export request, sinh CRA/Québec XML và cập nhật submission |
| Output | Tax-slip PDF, RRSP tax receipt, XML và một số danh sách Excel |

## File đầu mối

| File/thư mục | Vai trò |
|---|---|
| `WebApp/Main/YearEnd.aspx` | Màn hình điều phối 18 loại báo cáo |
| `WebApp/Main/YearEnd.aspx.cs` | Chuyển report type sang view, download file export |
| `WebApp/Main/YearEnd_*.aspx(.cs)` | UI và event handler riêng cho từng loại báo cáo |
| `WebApp/Main/PanelT619.aspx.cs` | Lưu T619 và tạo export request |
| `UBClasses/T3.cs`, `T4A.cs`, `T4RSP.cs`, ... | BLL gọi stored procedure của từng loại slip |
| `UBClasses/T619.cs`, `Export.cs` | BLL của transmitter/submission và hàng đợi export |
| `UBExport/CRASubmission.cs` | Đóng gói XML gửi CRA |
| `UBExport/CReleve.cs` | Đóng gói XML Revenu Québec |
| `VieFUNDPdf/` và `WebApp/Main/PdfView.aspx.cs` | Render tax-slip PDF |
| `ScriptDB/000_4_CreateSP.sql` | Stored procedure tạo slip, export request và cập nhật submission |
