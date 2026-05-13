# Tổng quan Kiến trúc JavaScript

Hệ thống WebApp của VieFUND xử lý nghiệp vụ máy khách (client-side) bằng **Vanilla JavaScript (ES5)**. Mọi file script được lưu trữ tại thư mục `WebApp/Js/` và được include vào các file `.aspx`, `.inc`.

## 1. Vai trò của jQuery
- Mặc dù jQuery tồn tại trong project (tại `Plugins/` hoặc `Css/skin/jquery/`), hệ thống cốt lõi **không phụ thuộc vào jQuery** cho các nghiệp vụ chính. 
- Bạn chỉ nên sử dụng jQuery khi thao tác với một số plugin UI cụ thể (ví dụ: Bootstrap UI, DocumentScanner). Các thao tác DOM (ẩn/hiện, lấy giá trị) và Form validation được thực thi thông qua các hàm tiện ích được thiết kế sẵn.

## 2. Cấu trúc File Chính

| File | Kích thước | Chức năng |
|---|---|---|
| `CommonFunctions.js` | ~128KB | File lõi chứa phần lớn các tiện ích: Form validation, string/number manipulation, thao tác DOM cơ bản. |
| `MenuFunctions.js` | ~52KB | Quản lý điều hướng, các chức năng menu, gọi cửa sổ Popup (`PopupModalLessWindow`) cho từng module (VD: Trade, Account, Client). |
| `Library.js` | ~60KB | Chứa các thư viện dùng chung cho UI, cấu hình cookie, xử lý hiển thị thời gian, tiền tệ và các script mở rộng. |
| `ajax.js` | ~4KB | Động cơ AJAX do VieFUND tự định nghĩa (`sack` object), xử lý XML HTTP Request tương thích ngược với các trình duyệt cũ. |

## 3. Quy ước viết code
- **Biến toàn cục (Global Variables):** Có rất nhiều biến toàn cục (ví dụ `CurrentClientID`, `IsUseTrustAccount`) được gán từ Server thông qua `Response.Write` trong ASP.NET.
- **Tên hàm:** Thông thường bắt đầu bằng chữ hoa (PascalCase) như `CheckNumeric`, `SetDisable`, `OnChangePage2`.
- **Cấu trúc:** Sử dụng các từ khóa cơ bản của ES5 như `var`, `function()`, không dùng Arrow functions `=>` hay `let`/`const` để đảm bảo tương thích ngược trên môi trường hệ thống kế thừa (legacy).
