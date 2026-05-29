# JavaScript Framework trong WebApp

Hệ thống Front-end của VieFUND (WebApp) chủ yếu được xây dựng dựa trên kiến trúc **Vanilla JavaScript truyền thống (ES5)**. Thay vì sử dụng các framework hiện đại như React, Vue hay Angular, hệ thống sử dụng các tập lệnh tiện ích toàn cục (global utility scripts) để xử lý logic giao diện, form, và điều hướng. 

jQuery có xuất hiện trong một số thư viện plugin hoặc bootstrap, nhưng **không phải là nền tảng chính** cho các thao tác DOM hay nghiệp vụ cốt lõi.

Do nội dung hướng dẫn lớn, tài liệu được chia nhỏ thành các module chức năng riêng biệt. Vui lòng xem chi tiết tại các mục dưới đây:

## 📚 Danh mục Hướng dẫn

1. [⭐ Cầu nối Server-Client: Biến toàn cục từ C# → JavaScript](./javascript/server-client-bridge.md)
   - **Tài liệu quan trọng nhất.** Giải thích chi tiết cách `SessionVars.aspx` truyền ~36 biến toàn cục từ ASP.NET Session xuống JavaScript.
   - Cơ chế inline expression `<%=...%>`, hidden fields, conditional script loading.
   - Thứ tự nạp file (Load Order) và lý do mọi hàm JS đều phải check `typeof` trước khi dùng biến.
   - Phân quyền bitwise (`ClientAccessValue & 1`), Feature Flags, và lưu ý bảo trì.
2. [Tổng quan Kiến trúc & Cấu trúc File](./javascript/overview.md)
   - Tìm hiểu các file JS chính (`CommonFunctions.js`, `Library.js`, `MenuFunctions.js`).
   - Phạm vi sử dụng Vanilla JS vs jQuery.
3. [AJAX Engine & sack class](./javascript/ajax.md)
   - Cách hệ thống xử lý giao tiếp bất đồng bộ (Asynchronous) thông qua `ajax.js`.
4. [UI & Popup Management](./javascript/ui-popups.md)
   - Quản lý cửa sổ popup đa nhiệm (Modalless Window).
   - Xử lý navigation (`ChangePage`, `OnChangePage2`).
5. [Core Utilities & Form Validation](./javascript/utilities.md)
   - Các hàm xử lý chuỗi, số liệu, định dạng hiển thị.
   - Các hàm ẩn/hiện, bật/tắt (disable/enable) form controls.
