# Cầu nối Server-Client: Biến toàn cục từ C# → JavaScript

Đây là tài liệu chi tiết nhất về cơ chế truyền dữ liệu từ phía server (ASP.NET C#) sang phía client (JavaScript) trong hệ thống VieFUND WebApp. Hiểu rõ cơ chế này là điều kiện tiên quyết để có thể debug, bảo trì, hoặc phát triển thêm bất kỳ tính năng nào.

---

## 1. Tổng quan kiến trúc truyền biến

Hệ thống VieFUND **không sử dụng REST API hay JSON endpoint** để truyền dữ liệu trạng thái từ server xuống client. Thay vào đó, nó dùng **Server-Side Rendering (SSR)** kết hợp với kỹ thuật **Server-Side Include (SSI)** của ASP.NET WebForms.

Dữ liệu từ C# được "nhúng" (embed) trực tiếp vào HTML/JavaScript output khi trang được render. Khi browser nhận được trang, các biến toàn cục JS đã có sẵn giá trị.

### Sơ đồ luồng dữ liệu

```
┌─────────────────────────────────────────────────────────────────┐
│                        SERVER (ASP.NET)                         │
│                                                                 │
│  1. User login → Session["TMPLoginID"] = "john_doe"             │
│  2. Session["TMPbCanAddTrx"] = 1                                │
│  3. Session["TMPiAccessClient"] = 7  (bitwise permission)       │
│                                                                 │
│  ┌────────────────────────────────────────────────────────────┐  │
│  │          Khi render trang .aspx (VD: Client.aspx)         │  │
│  │                                                            │  │
│  │  <!-- #include file="~/Inc/PageHeader.aspx" -->            │  │
│  │  <!-- #include file="~/Inc/SessionVars.aspx" -->  ◄────── │──│── FILE THEN CHỐT
│  │  <!-- #include file="~/Inc/UBMenuInit.aspx" -->            │  │
│  │  ... nội dung trang ...                                    │  │
│  │  <!-- #include file="~/Inc/PageFooter.aspx" -->            │  │
│  └────────────────────────────────────────────────────────────┘  │
│                             │                                    │
│                             ▼                                    │
│              ASP.NET render <%=...%> thành giá trị thực          │
└─────────────────────────────────────────────────────────────────┘
                              │
                              ▼  (HTTP Response)
┌─────────────────────────────────────────────────────────────────┐
│                      CLIENT (Browser)                           │
│                                                                 │
│  <script>                                                       │
│    var LoginID = 'john_doe';          // đã được render          │
│    var CanAddTrx = '1';              // đã được render          │
│    var ClientAccessValue = '7';      // đã được render          │
│  </script>                                                      │
│                                                                 │
│  → MenuFunctions.js đọc các biến này để quyết định hiển thị    │
│  → CommonFunctions.js dùng để validate, enable/disable control  │
└─────────────────────────────────────────────────────────────────┘
```

---

## 2. File then chốt: `Inc/SessionVars.aspx`

Đây là file **quan trọng nhất** trong toàn bộ cơ chế. Nó là một file `.aspx` được **include** vào mọi trang chính (thông qua SSI directive), chứa một block `<script>` khai báo tất cả biến toàn cục JavaScript cần thiết.

### Nội dung file (trích nguyên văn)

```html
<!-- File: WebApp/Inc/SessionVars.aspx -->
<script type="text/javascript" >
    var LoginID = '<%=CFunctions.GetSessionValue(this, -1, "TMPLoginID")%>';
    var IsSetupUser = '<%=CFunctions.GetSessionValueInt(this, -1, "TMPbSetupUser", 0)%>';
    var IsUserAdmin = '<%=CFunctions.GetSessionValueInt(this, -1, "TMPUserAdmin", 0)%>';
    var IsUserManager = '<%=CFunctions.GetSessionValue(this, -1, "TMPUserManager")%>';
    var IsUserRep = '<%=CFunctions.GetSessionValue(this, -1, "TMPUserRep")%>';
    var IsUserCompOfficer = '<%=CFunctions.GetSessionValueInt(this, -1, "TMPUserCompOfficer", 0)%>';
    var CanAddTrx = '<%=CFunctions.GetSessionValueInt(this, -1, "TMPbCanAddTrx", 0)%>';
    var ClientAccessValue = '<%=CFunctions.GetSessionValueInt(this, -1, "TMPiAccessClient", 0)%>';
    var PlanAccessValue = '<%=CFunctions.GetSessionValueInt(this, -1, "TMPiAccessPlan", 0)%>';
    var AccountAccessValue = '<%=CFunctions.GetSessionValueInt(this, -1, "TMPiAccessAccount", 0)%>';
    var IsUseTrustAccount = '<%=CFunctions.GetSessionValueInt(this, -1, "TMPbTrustAccount", 0)%>';
    var DealershipID = '<%=CFunctions.GetSessionValue(this, -1, "TMPDSID")%>';
    var WebAppMode = '<%=CFunctions.GetSessionValue(this, -1, "TMPWebAppMode")%>';
    var IsUserReadOnly = '<%=CFunctions.GetSessionValue(this, -1, "TMPReadOnly")%>';
    // ... khoảng 36 biến tổng cộng
</script>
```

### Giải thích cơ chế

1. **`<%=...%>`** là cú pháp **ASP.NET inline expression**. Khi server render trang, nó thay thế `<%=CFunctions.GetSessionValue(this, -1, "TMPLoginID")%>` bằng giá trị thực từ `Session["TMPLoginID"]`.
2. **`CFunctions.GetSessionValue(this, -1, "TMPLoginID")`** là hàm tiện ích C# trong namespace `UBStatic`. Tham số `-1` biểu thị lấy từ Session hiện hành.
3. Kết quả: Browser nhận được `var LoginID = 'john_doe';` — một biến JS toàn cục bình thường.

---

## 3. Danh sách đầy đủ biến toàn cục

### 3.1 Nhóm Xác thực & Phân quyền (Authentication & Authorization)

| Biến JS | Session Key | Kiểu | Mục đích |
|---|---|---|---|
| `LoginID` | `TMPLoginID` | String | ID đăng nhập của user hiện tại |
| `IsSetupUser` | `TMPbSetupUser` | Int (0/1) | User có quyền thiết lập hệ thống không |
| `IsUserAdmin` | `TMPUserAdmin` | Int (0/1) | User có phải Admin không |
| `IsUserManager` | `TMPUserManager` | String | Cờ Manager |
| `IsUserRep` | `TMPUserRep` | String | Cờ Representative (Đại diện kinh doanh) |
| `IsUserCompOfficer` | `TMPUserCompOfficer` | Int (0/1) | Compliance Officer (Nhân viên tuân thủ) |
| `IsUserReadOnly` | `TMPReadOnly` | String | User chỉ có quyền xem |
| `IsUserDataEntryOnly` | `TMPDataEntryOnly` | String | User chỉ nhập liệu |
| `IsAssistantOnly` | `TMPbAssistantOnly` | String | Trợ lý, quyền hạn chế |

### 3.2 Nhóm Quyền truy cập Module (Access Control - Bitwise)

| Biến JS | Session Key | Kiểu | Mô tả Bitwise |
|---|---|---|---|
| `ClientAccessValue` | `TMPiAccessClient` | Int | Bit 0=Add, Bit 2=Edit, Bit 4=Delete |
| `PlanAccessValue` | `TMPiAccessPlan` | Int | Tương tự cho Plan (Kế hoạch đầu tư) |
| `AccountAccessValue` | `TMPiAccessAccount` | Int | Tương tự cho Account (Tài khoản quỹ) |
| `CanAddTrx` | `TMPbCanAddTrx` | Int (0/1) | Quyền tạo giao dịch mới |
| `ManualTrxValue` | `TMPiManualTrx` | Int (0/1) | Quyền nhập giao dịch thủ công |

**Cách JS sử dụng bitwise để kiểm tra quyền:**

```javascript
// Trong MenuFunctions.js — kiểm tra quyền Add Plan
function OnAddPlanDlg(Lg, Options) {
    // Bit 0 (giá trị 1) = quyền Add
    if (typeof (PlanAccessValue) != 'undefined' && (PlanAccessValue & 1) == 0) {
        alert(msg_access_denied_str);  // Từ chối truy cập
        return;
    }
    // ... mở popup thêm Plan
}

// Kiểm tra quyền Edit Plan (bit 2 = giá trị 4)
function OnEditPlanDlg(Lg, Options) {
    if (typeof (PlanAccessValue) != 'undefined' && (PlanAccessValue & 4) == 0) {
        alert(msg_access_denied_str);
        return;
    }
    // ... mở popup sửa Plan
}
```

### 3.3 Nhóm Cấu hình Tính năng (Feature Flags)

| Biến JS | Session Key | Mục đích |
|---|---|---|
| `IsUseTrustAccount` | `TMPbTrustAccount` | Bật/tắt module Trust Account |
| `IsOmnibusProcessing` | `TMPOmnibusProcessingEnable` | Bật/tắt xử lý Omnibus |
| `IsRESPEnabled` | `TMPEnableRESP` | Bật/tắt module RESP (tiết kiệm giáo dục) |
| `IsETFEnable` | `TMPiETFTrading` | Bật/tắt giao dịch ETF |
| `IsBulkSwitchBasket` | `TMPBulkSwitchBasket` | Bật/tắt chuyển đổi hàng loạt |
| `WebAppMode` | `TMPWebAppMode` | Chế độ app (0=Standard, 1=GC mode) |
| `DealerLevel` | `TMPDealerLevel` | Cấp độ Dealer (ảnh hưởng giao diện) |
| `DealershipID` | `TMPDSID` | Mã đại lý hiện tại |

---

## 4. Các kỹ thuật truyền biến khác (ngoài SessionVars)

### 4.1 Inline Expression trực tiếp trong `.aspx`

Ngoài `SessionVars.aspx`, nhiều trang `.aspx` cũng nhúng trực tiếp giá trị C# vào HTML:

```html
<!-- File: Inc/PageHeader.aspx -->
<script type="text/javascript">
    var bPageBusy = 1;
    var AltCSSTitle = '<%=CFunctions.GetSessionValue(this, 0, "CustomSS")%>';
    if (AltCSSTitle.length > 0)
        setActiveStyleSheet(AltCSSTitle);
</script>
```

### 4.2 Hidden Fields (`<input type="hidden" runat="server">`)

Server gán giá trị cho các hidden input trong code-behind (`.cs`), rồi JS đọc từ DOM:

```html
<!-- Trong Default.aspx -->
<input type="hidden" id="hdCustomSS" value="CS_1001" runat="server" />
<input type="hidden" id="DBID" value="1001" runat="server" />
<input type="hidden" id="DSID" value="1001" runat="server" />
<input type="hidden" id="DefLg" value="0" runat="server" />
```

JS đọc hidden field như sau:
```javascript
var elem = document.getElementById('DefLg');
if (elem != null && typeof(elem) != 'undefined') {
    var langValue = elem.value;  // "0" hoặc "1"
}
```

### 4.3 Conditional Script Loading (nạp file JS theo điều kiện)

Server quyết định file JS nào được include dựa trên trạng thái Session:

```html
<!-- File: Inc/UBMenuInit.aspx -->
<% if (PageLg.Value == "1") { %>
    <script src="<%=CFunctions.GetPath(this, "js", "DateStr_FR.js")%>"></script>
    <script src="<%=CFunctions.GetPath(this, "js", "TopPage_FR.js")%>"></script>
    <script src="<%=CFunctions.GetPath(this, "js", "UBMenuConst_FR.js")%>"></script>
<% } else { %>
    <script src="<%=CFunctions.GetPath(this, "js", "DateStr_EN.js")%>"></script>
    <script src="<%=CFunctions.GetPath(this, "js", "TopPage_EN.js")%>"></script>
    <script src="<%=CFunctions.GetPath(this, "js", "UBMenuConst_EN.js")%>"></script>
<% } %>
```

Hệ thống dùng kỹ thuật này để **thay đổi ngôn ngữ** (EN/FR) mà không cần gọi API riêng.

### 4.4 ASP.NET Resource Expression `<%$ ... %>`

Dùng cho nội dung đa ngôn ngữ (Multilingual) trong markup:

```html
<!-- Trong Default.aspx -->
<asp:Button Text='<%$ MultiLg: VFStatic.Language.getString("login") %>' ... />
<h3><%= VFStatic.Language.getString("signIn") %></h3>
```

---

## 5. Thứ tự nạp (Load Order) — Rất quan trọng

Mỗi trang `.aspx` chính được ghép từ nhiều file include. Thứ tự phổ biến đã xác minh trên `Client.aspx`, `AccountView.aspx` và `TrxView.aspx` là:

```
1. Inc/PageHeader.aspx
   ├── Khai báo CSS, meta tags
   ├── Include CommonFunctions.js
   ├── Include MenuFunctions.js
   └── Khai báo bPageBusy, AltCSSTitle

2. form + hidden fields
   └── PageLg, hdiLoginID, hdGUID, szFileName...

3. Inc/UBMenuInit.aspx
   ├── Include DateStr_EN.js hoặc DateStr_FR.js (theo ngôn ngữ)
   ├── Include UBMenuConst_EN.js hoặc UBMenuConst_FR.js
   ├── Include UBMenuDropdown.js
   └── Include StatusBar.js

4. SetCurrentMenu(...) + Inc/SessionVars.aspx
   └── các biến LoginID, IsSetupUser, CanAddTrx...

5. Inc/UBMenuContent.aspx
   └── nạp menu EN/FR và dùng các biến Session ở bước 4

6. [Nội dung trang chính]
   └── Các <script> inline, hidden fields, form controls

7. Inc/PageFooter.aspx
   ├── Reset cursor = default
   ├── Hàm CheckLoaded()
   ├── Hàm resizeDlg800()
   └── Set bPageBusy = 0
```

**Hệ quả:** `MenuFunctions.js` được parse trước khi `SessionVars.aspx` khai báo biến, còn action chỉ chạy sau khi trang đã render. Code vẫn thường kiểm tra `typeof` để có thể dùng trên page/popup không include đầy đủ SessionVars và để chịu được khác biệt cấu hình:

```javascript
// Pattern bắt buộc: luôn check typeof
if (typeof (CanAddTrx) != 'undefined' && CanAddTrx == 0) {
    alert(msg_access_denied_str);
    return;
}
```

---

## 6. Pattern phổ biến: JS đọc biến → Quyết định hành vi

### 6.1 Kiểm tra quyền trước khi mở Popup

```javascript
function OnAddClientDlg(Lg, Options) {
    // 1. Kiểm tra quyền (từ biến toàn cục)
    if (typeof (ClientAccessValue) != 'undefined' && (ClientAccessValue & 1) == 0) {
        alert(msg_access_denied_str);
        return;
    }

    // 2. Chọn file .aspx theo ngôn ngữ (từ biến Lg)
    var pageLink = (Lg == 1
        ? "../Main/PopupClientAdd_FR.aspx"
        : "../Main/PopupClientAdd.aspx");

    // 3. Chọn layout theo WebAppMode (từ biến toàn cục)
    if (typeof (WebAppMode) != 'undefined' && (WebAppMode == '1'))
        pageLink = (Lg == 1
            ? "../Main/PopupClientAddGC_FR.aspx"
            : "../Main/PopupClientAddGC.aspx");

    // 4. Mở cửa sổ
    PopupModalLessWindow('VieFUND', pageLink, '', 0, 0, 1050, 800, 0, 1, 0, 1);
}
```

### 6.2 Kiểm tra Feature Flag trước khi cho phép thao tác

```javascript
function OnAddDepositDlg(Lg, Options) {
    // Feature flag: Trust Account có được bật không?
    if (typeof (IsUseTrustAccount) != 'undefined' && IsUseTrustAccount == 0) {
        alert(msg_access_denied_str);
        return;
    }
    // ... tiếp tục mở popup
}
```

### 6.3 JS đặt biến runtime → Server đọc lại (Ngược chiều)

```javascript
// Trong Default_js_X.inc — JS ghi cookie, server đọc ở lần request sau
function SaveUserIDX() {
    var frm = GetFrm();
    var uStr = frm.UserID.value;
    var Lg = frm.DefLg.value;

    if (frm.remember.checked) {
        createCookie('UserID', uStr, 3);
    }
    createCookie('DefLg', Lg, 3);
}
```

---

## 7. Lưu ý quan trọng khi bảo trì

### ⚠️ Tất cả biến đều là String

Mặc dù gọi `GetSessionValueInt`, giá trị vẫn được wrap trong dấu nháy đơn `'...'` nên **kiểu dữ liệu thực sự trên JS là String**. So sánh `CanAddTrx == 0` hoạt động nhờ type coercion của JavaScript, nhưng so sánh strict `===` sẽ fail:

```javascript
CanAddTrx == 0    // true (type coercion: '0' == 0)
CanAddTrx === 0   // false ('0' !== 0)
```

### ⚠️ Biến toàn cục = Chia sẻ giữa các frame/popup

Vì mỗi popup (ModalLess Window) là một `window.open()` riêng, chúng có `SessionVars.aspx` riêng. Tuy nhiên, parent window và child popup có thể giao tiếp qua `window.opener`:

```javascript
// Từ popup con, gọi lại parent:
window.opener.location.reload();  // Refresh parent sau khi save
```

### ⚠️ Không có cơ chế reactive/real-time

Biến chỉ được render **một lần** khi trang load. Nếu Session thay đổi (VD: admin thay đổi quyền user), biến JS sẽ **không tự cập nhật** cho đến khi user refresh trang.
