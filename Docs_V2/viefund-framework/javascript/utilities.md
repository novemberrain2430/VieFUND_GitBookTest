# Core Utilities & Form Controls

Phần lớn các thao tác DOM, thao tác dữ liệu cơ bản (Data manipulation) của WebApp được cung cấp thông qua `CommonFunctions.js` và `Library.js`. Các hàm này thay thế vai trò phổ biến của jQuery trong việc validate và format dữ liệu.

## 1. Thao tác với Control / DOM

Hệ thống xây dựng một tập hợp các wrapper functions để thiết lập thuộc tính nhanh chóng.

### Ẩn / Hiện phần tử (Hide / Show)
```javascript
// Thay đổi thuộc tính style.display của phần tử
HideControl(ptr, bhide);

// Ví dụ:
var elem = document.getElementById('txtAmount');
HideControl(elem, true);  // Ẩn (display: none)
HideControl(elem, false); // Hiện (display: block/inline)
```

### Bật / Tắt (Enable / Disable)
```javascript
SetDisable(ptr, str); // Sử dụng cờ 'T' (Disable), hoặc 'F' (Enable)

EnableControl(ptr, bEnable); // Tương đương: bEnable = true/false
```

### Đặt giá trị và lấy Focus (Set Value / Focus)
```javascript
SetText(elemID, strContent);
// Tự động kiểm tra xem elemID có tồn tại không trước khi gán nội dung (value / innerHTML)

SetFocus(itemid);
// Giúp tự động focus vào một control cụ thể
```

## 2. Xử lý Chuỗi & Số liệu (String / Number)

Các hàm định dạng chuỗi theo chuẩn của VieFUND:
- `Trim(iStr)`: Cắt khoảng trắng 2 đầu.
- `Left(str, n)`, `Right(str, n)`: Lấy `n` ký tự từ bên trái hoặc phải.
- `CheckAlphaNumeric(str)`: Đảm bảo chuỗi chỉ chứa số và chữ cái.
- `CheckNumeric(str)`: Đảm bảo chuỗi chỉ chứa ký tự số.

### Format Số liệu (Currency / Decimal)
Hệ thống sử dụng hàm `numberFormat` để xử lý định dạng hiển thị cho các trường tài chính:
```javascript
numberFormat(num, decimalNum, bolLeadingZero, bolParens, bolCommas)
// Ví dụ: format số tiền 1234567.89 -> "1,234,567.89"
```

### Kiểm tra SIN (Social Insurance Number) Canada
Do nghiệp vụ đặc thù cho thị trường Canada, hệ thống tích hợp sẵn hàm checksum (thuật toán Luhn) để kiểm tra SIN:
```javascript
CheckSIN(SIN_Text); // Trả về true nếu hợp lệ
SINFilter(ctrl);    // Hàm event listener lọc các ký tự không hợp lệ khi user gõ vào
```

## 3. Cookie Management
Chức năng quản lý Cookie gốc được lưu tại `Library.js`:
```javascript
setCookie(Name, Path, Expires, Value);
getCookie(Name, Default);
```
Sử dụng rộng rãi trong lưu trữ cấu hình người dùng (ngôn ngữ, tùy chọn hiển thị).
