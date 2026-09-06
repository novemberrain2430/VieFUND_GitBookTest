# Quản lý UI và Popup (MenuFunctions.js)

`MenuFunctions.js` là trái tim của điều hướng hệ thống (Navigation) và tạo giao diện cửa sổ con (Popup) mà không cần chuyển trang (Page Refresh).

## 1. Điều hướng Trang (Page Navigation)

Sử dụng hàm `OnChangePage2(Lg, PageName)` để chuyển sang một Master view khác trong cùng tab.
- `Lg`: Flag ngôn ngữ (1 cho tiếng Pháp - French, khác 1 cho tiếng Anh - English).
- `PageName`: Tên của `.aspx` file (không kèm đuôi).

```javascript
function OnViewAccount(Lg) { 
    OnChangePage2(Lg, 'AccountView'); 
}
// Hành động này sẽ tự động bật con trỏ chờ (wait cursor) và load trang mới.
```

## 2. Popup ModalLess (Cửa sổ độc lập)

Do tính chất đa nhiệm của hệ thống tài chính, người dùng thường phải thao tác trên nhiều Client hoặc Account cùng lúc. Hệ thống ưu tiên sử dụng các cửa sổ popup phi phương thức (ModalLess) thông qua hàm `PopupWindow1` hoặc `PopupModalLessWindow`.

### Khởi tạo Popup
```javascript
PopupModalLessWindow(wname, pageLink, params, xPos, yPos, width, height, status, scroll, maximize, resizable)
```

### Cách sử dụng mẫu
Ví dụ mở form tạo mới Giao dịch (Add Trade):

```javascript
function OnAddTradeDlg(Lg, Options) {
    // 1. Kiểm tra phân quyền từ biến toàn cục
    if (typeof (CanAddTrx) != 'undefined' && CanAddTrx == 0) {
        alert(msg_access_denied_str);
        return;
    }

    // 2. Xác định ngôn ngữ để render file aspx tương ứng
    var pageLink = Lg == 1 ? "../Main/PopupTradeAdd_FR.aspx" : "../Main/PopupTradeAdd.aspx";
    var params = '';

    // 3. Khởi tạo Popup
    PopupModalLessWindow('VieFUND', pageLink, params, 0, 0, 1100, 740, 0, 1, 0, 1);
}
```

**Lưu ý quan trọng về định danh (Window Name `wname`):** 
`wname` (`'VieFUND'` hoặc `'VieFUND1'`) quyết định cửa sổ popup sẽ ghi đè lên cửa sổ popup cũ (nếu cùng tên), hay tạo ra một instance hoàn toàn mới. Ví dụ: Để mở song song 2 popup, chúng phải có tên khác nhau.

**Giới hạn đã xác minh trong source hiện tại:** `PopupModalLessWindow` quản lý ba cấp `VieFUND`/`VieFUND1`/`VieFUND2`; đối số `params` không được dùng và `resizable` không thay đổi feature string vì helper luôn mở `resizable=yes`. Nếu cần truyền dữ liệu, hãy nối query parameter đã encode vào `pageLink` hoặc dùng contract opener/hidden field đang có. Xem bản đồ đầy đủ tại [UI Patterns](../ui-patterns.md).

## 3. Quản lý trạng thái con trỏ (Loading Cursors)
Khi cần thông báo hệ thống đang xử lý thay vì dùng overlay spinner, VieFUND sử dụng con trỏ chuột:
```javascript
cursor_wait();   // Chuyển con trỏ thành biểu tượng đồng hồ cát
cursor_clear();  // Trả con trỏ về trạng thái mặc định
```
