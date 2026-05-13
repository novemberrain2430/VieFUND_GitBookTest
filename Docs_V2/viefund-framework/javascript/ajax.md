# Xử lý AJAX trong WebApp

Hệ thống VieFUND không sử dụng hàm `fetch` hay `$.ajax` của jQuery cho các nghiệp vụ lõi, mà dùng một Custom Class là **`sack`** nằm trong file `WebApp/Js/ajax.js`.

## 1. Sack AJAX Class
`sack` (Simple AJAX Code-Kit) là một object wrapper cho `ActiveXObject` (MSXML) và `XMLHttpRequest`. Nó cho phép gọi AJAX theo phương thức POST hoặc GET, và tự động xử lý DOM update từ response.

## 2. Các thuộc tính và sự kiện

| Thuộc tính / Sự kiện | Kiểu | Mô tả |
|---|---|---|
| `method` | String | `"POST"` hoặc `"GET"` (Mặc định là POST). |
| `encodeURIString` | Boolean | Có encode URI và thêm `rndval` (random value để tránh cache) hay không. Mặc định `true`. |
| `element` | String | ID của phần tử DOM muốn đổ dữ liệu response vào. |
| `onLoading()`, `onLoaded()`, `onInteractive()`, `onCompletion()` | Function | Các hooks tương ứng với trạng thái của request. |

## 3. Cách sử dụng (Ví dụ)

Khai báo một request bằng cách tạo biến `sack` mới và trỏ đến URL của endpoint.

```javascript
// 1. Khởi tạo đối tượng AJAX với URL cần gọi
var ajax = new sack("MyHandler.aspx");

// 2. Định nghĩa hàm xử lý khi hoàn tất
ajax.onCompletion = function() {
    var response = ajax.response;
    // Xử lý dữ liệu response ở đây
    alert("Dữ liệu nhận được: " + response);
};

// 3. (Tùy chọn) Gán element DOM để tự động update innerHTML hoặc value
// ajax.element = "divResultID"; 

// 4. Thêm tham số POST/GET
ajax.setVar("action", "GetData");
ajax.setVar("clientId", 12345);

// 5. Chạy request
ajax.runAJAX();
```

## 4. Xử lý Evaluated Code
`sack` có hỗ trợ thực thi trực tiếp mã JavaScript từ server thông qua:
```javascript
ajax.execute = true; // Sẽ gọi eval(ajax.response) sau khi Completion
```
Tuy nhiên, cần hạn chế thiết lập `execute = true` để đảm bảo an toàn bảo mật (tránh XSS).
