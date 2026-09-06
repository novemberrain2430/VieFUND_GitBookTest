# UI Patterns — Kiến trúc giao diện WebApp

> Hướng dẫn đọc và mở rộng UI ASP.NET Web Forms của VieFUND. Nội dung được kiểm tra trực tiếp trên source trong `WebApp`, `UBClasses` và `UBStatic` ngày 2026-09-04.

## 1. Kết luận nhanh

WebApp là ASP.NET Web Application .NET Framework 4.5.2, dùng Web Forms và AjaxControlToolkit. Kiến trúc UI không dùng ASP.NET Master Page và cũng không dùng component framework hiện đại. Một màn hình thường được ghép từ nhiều file bằng server-side include:

```text
Page .aspx + code-behind dùng chung cho EN/FR
  ├─ Inc/PageHeaderFull.aspx hoặc PopupHeader.aspx
  ├─ hidden fields làm hợp đồng server ↔ JavaScript
  ├─ Inc/UBMenuInit.aspx + SessionVars.aspx + UBMenuContent.aspx
  ├─ body/Panel/*.aspx được include trực tiếp
  ├─ UpdatePanel + MultiView/TabContainer + Repeater
  └─ Inc/PageFooter.aspx hoặc PopupFooter.aspx
```

Các điểm quan trọng nhất:

- Tên `Panel*.aspx` chủ yếu chỉ một fragment markup, không phải `UserControl`.
- Tên `Popup*.aspx` có thể là page độc lập hoặc fragment; phải đọc Page directive để phân biệt.
- EN/FR thường có hai file markup nhưng dùng chung một class code-behind qua `Inherits`.
- Điều hướng page dùng POST vào hidden field rồi server redirect, không chỉ gán `window.location`.
- Popup độc lập giao tiếp với opener bằng DOM/hidden button; modal trong cùng page dùng `ModalPopupExtender`.
- `UpdatePanel` và `Repeater` là pattern chính; không tìm thấy `GridView`/`DataGrid` trong markup `WebApp/Main`.
- Menu visibility dựa trên biến Session render xuống JavaScript chỉ là lớp UX, không phải authorization boundary.

## 2. Inventory source hiện tại

Số liệu dưới đây được tính trên `WebApp/Main` và có cả page đang dùng lẫn fragment/legacy còn nằm trong project:

| Thành phần | Số lượng | Ý nghĩa |
|---|---:|---|
| File `.aspx` | 1.193 | Bao gồm page hoàn chỉnh, body, panel, JS fragment và print page |
| File có `<%@ Page ... %>` | 477 | Page có thể được ASP.NET xử lý như endpoint |
| File `.aspx.cs` | 434 | Nhiều FR page dùng chung code-behind; nhiều fragment không có code-behind |
| File `.designer.cs` | 210 | Nhiều class còn khai báo control thủ công trong `.aspx.cs` |
| `Panel*.aspx` | 431 | Cả 431 đều không có Page directive: fragment include |
| `Popup*.aspx` | 312 | 186 page độc lập, 126 fragment/body/helper |
| `*_FR.aspx` | 465 | 461 có file EN cùng tên; 4 fragment không có base tương ứng |
| `*Prn.aspx` | 28 | Biến thể print-friendly trong inventory tên file |
| Server include target duy nhất | 620 | Cho thấy mức ghép file rất cao |
| `.master` | 0 | Source không dùng ASP.NET Master Page |

ASP.NET UserControl thật chỉ xuất hiện tập trung ở `WebApp/Controls/Main/PanelMFDAReportsNew`: 38 file `.ascx`, gồm 19 cặp EN/FR và 19 code-behind/designer.

Số liệu control trong toàn bộ markup `WebApp/Main`:

| Control/pattern | File có dùng | Số occurrence |
|---|---:|---:|
| `asp:Repeater` | 555 | 1.636 |
| `asp:UpdatePanel` | 880 | 5.522 |
| `asp:MultiView` | 230 | 237 |
| `asp:View` | 231 | 943 |
| `ajaxToolkit:TabContainer` | 84 | 99 |
| `ajaxToolkit:ModalPopupExtender` | 200 | 735 |
| `asp:Timer` | 68 | 76 |
| Hidden `<input runat="server">` | 834 | 8.368 |
| `GridView`, `DataGrid`, `ListView`, `DataList` | 0 | 0 |

Các con số occurrence tính cả fragment được include vào page; không dùng chúng để suy ra số màn hình active.

## 3. Phân loại file UI đúng cách

| Loại | Cách nhận diện | Ví dụ | Vai trò |
|---|---|---|---|
| Main page | Có `<%@ Page>`; include page header/menu/footer | `TrxView.aspx` | Màn hình điều hướng chính |
| Popup page | Có `<%@ Page>`; include `PopupHeader`/`PopupFooter` | `PopupClientAdd.aspx` | Cửa sổ browser con độc lập |
| Panel fragment | Không có Page directive; thường bắt đầu bằng `<asp:Panel>` | `PanelClientSearch.aspx` | Modal/dialog nằm trong control tree của page cha |
| Body fragment | Không có Page directive; chỉ chứa một phần form | `PopupClientAddBody.aspx` | Tách markup lớn để tái sử dụng/dễ quản lý |
| JS fragment | `.aspx` nhưng chứa `<script>` callback | `PopupClientAddEdit_js.aspx` | Popup gọi ngược opener sau save/close |
| Lookup page | Có Page directive, include `ListHeader` | `CityList.aspx` | HTML nhỏ được AJAX load vào dropdown động |
| Print page | Thường hậu tố `Prn` và có cặp EN/FR | `CommViewPrn.aspx` | Render giao diện in/report |
| UserControl thật | `<%@ Control>` trong `.ascx` | `AccountOpening.ascx` | Component có class `UserControl` |

Quy tắc: không quyết định loại file chỉ từ prefix. Đọc dòng đầu, các include và `Inherits` trước.

## 4. Page composition: thay Master Page bằng include

### 4.1. Main page

`TrxView.aspx`, `Client.aspx` và `AccountView.aspx` thể hiện cấu trúc phổ biến:

1. Page directive và đăng ký AjaxControlToolkit.
2. Include `~/Inc/PageHeaderFull.aspx`.
3. Mở `<form id="frmMain" runat="server">`.
4. Khai báo các hidden field chuẩn.
5. Đặt `szPageTitle`.
6. Include `UBMenuInit.aspx`, gọi `SetCurrentMenu(...)`.
7. Include `SessionVars.aspx` rồi `UBMenuContent.aspx`.
8. Nạp JS theo module; render tabs, list, detail và modal panel.
9. Include `TimerMSGRefresh.aspx`/hidden refresh buttons nếu cần.
10. Đóng form và include `PageFooter.aspx`.

Các shell chính:

| Include | Vai trò đã xác minh |
|---|---|
| `Inc/PageHeader.aspx` | Mở HTML/body và wrapper fixed-width cũ |
| `Inc/PageHeaderFull.aspx` | Mở HTML/body và wrapper rộng 100%; shell chính phổ biến hơn |
| `Inc/PageFooter.aspx` | Đóng wrapper/HTML, reset busy cursor, resize và đóng popup con khi unload |
| `Inc/PopupHeader.aspx` | CSS + JavaScript nền cho popup độc lập |
| `Inc/PopupFooter.aspx` | Resize/focus và cleanup popup cấp con |
| `Inc/ListHeader.aspx` | Header tối giản cho lookup HTML được AJAX load |
| `Inc/ToolTipHeader.aspx` | CSS/JS bổ sung thường đi với popup |
| `Inc/SessionVars.aspx` | Render role/access/feature flags từ Session thành biến JS global |
| `Inc/UBMenuInit.aspx` | Nạp Date/TopPage/MenuConst theo `PageLg`, menu engine và status bar |
| `Inc/UBMenuContent.aspx` | Chọn `UBMenuContent_EN.js` hoặc `_FR.js` |
| `Inc/TimerMSGRefresh.aspx` | Timer 60 giây và hidden buttons bật/tắt timer |

Trong inventory, `PageHeaderFull` được include 153 lần, `PopupHeader` 196 lần, `ListHeader` 57 lần và `TimerMSGRefresh` 99 lần.

### 4.2. Hệ quả của include dạng text

`<!-- #include file="PanelClientSearch.aspx" -->` ghép fragment vào page trước khi ASP.NET hoàn tất control tree. Vì vậy:

- Server control trong fragment thuộc class page cha, không có lifecycle/class riêng.
- Event handler của control nằm trong code-behind page cha hoặc partial class liên quan.
- Control ID phải duy nhất sau khi ghép toàn bộ fragment.
- Thay đổi fragment có thể làm lỗi nhiều page cùng include nó.
- Không thể unit-test/khởi tạo fragment như một `UserControl` nếu chưa refactor thành `.ascx`.

## 5. Hợp đồng hidden field và page lifecycle

Các hidden field xuất hiện lặp lại:

| Control | Vai trò |
|---|---|
| `hdiLoginID` | Namespace của login/session hiện hành |
| `hdGUID` | Token đối chiếu với `TMPGUID` khi validate request |
| `PageLg` | `0` EN, `1` FR; code-behind và JS đều đọc |
| `szFileName` | Đích điều hướng do JavaScript đặt trước khi submit |
| `szFileName_ME` | Tên page ngôn ngữ đối ứng |
| `PreviousPageStr` | Trang trước, được lấy từ `TMPREFERRER` |
| `hdPageIDStr`/`hdPageID` | Page-instance guard cho stale/double postback |
| `hdLastTabID` | Tab cần khôi phục |
| `hdSelectedItemID`, `hdSelectID`, `hdSelectFlag` | Selection bridge giữa row/JS/server event |
| `hdSortField*`, `hdSortDir*` | Sorting state của list |
| `hdScrollPos*` | Vị trí cuộn cần khôi phục |

Pattern `Page_Load` thường là:

```csharp
int lg = CFunctions.ToInt16(PageLg.Value);
if (!CBase.IsPageValid(this, "", 0, lg, 0, false)) return;

if (szFileName.Value != "")
{
    saveAllHidden(0);
    CBase.ClosePopup(this);
    CFunctions.PageChange(this, 0, lg, "TrxView", szFileName.Value);
    return;
}

if (!IsPostBack)
{
    int loginId = CFunctions.PageLoad1(this);
    if (loginId == 0) return;
    // load dropdown, restore filters, bind list, apply dealer/role rules
}
```

`CFunctions.PageLoad1` lấy login ID/GUID/referrer/page ID từ Session vào hidden field ở lần load đầu và reset action guard. Các postback handler thường gọi lại `CBase.IsPageValid(..., true)` trước khi xử lý.

Chi tiết security/session nằm trong [Authentication & Authorization](auth.md).

## 6. Điều hướng main page

Luồng menu không gán URL trực tiếp cho browser:

```text
UBMenuContent_EN/FR.js
  → OnViewTrade(Lg)
  → OnChangePage2(Lg, "TrxView")
  → chọn TrxView.aspx hoặc TrxView_FR.aspx
  → ChangePage(file)
  → đặt frmMain.szFileName + submit form
  → Page_Load lưu state và gọi CFunctions.PageChange
  → server ghi TMPREFERRER + Response.Redirect
```

`ChangePage` dùng global `bPageBusy` để chặn điều hướng lặp. Header khởi tạo `bPageBusy = 1`; footer trả về 0 khi trang load xong và reset cursor.

### 6.1. Menu được tạo thế nào

- `SessionVars.aspx` xuất role/access/feature flags như `IsUserAdmin`, `ClientAccessValue`, `YearEndReport`, `DealershipID`.
- `UBMenuContent_EN.js` và `_FR.js` gọi `addMSMenu`/`addMSSubMenu` có điều kiện.
- `UBMenuDropdown.js` dựng HTML menu bằng string và `document.write`.
- Page gọi `SetCurrentMenu("MS_VIEW", "3")` để đánh dấu main/submenu hiện tại.
- Action function trong `MenuFunctions.js` chọn page EN/FR, kiểm tra điều kiện UX và mở page/popup.

Ẩn menu hoặc alert “access denied” trong JavaScript không ngăn direct URL/crafted POST. Page handler và SP vẫn phải enforce quyền server-side.

## 7. Bốn pattern popup/dialog

### 7.1. Browser popup độc lập

`PopupModalLessWindow` trong `CommonFunctions.js` dùng `window.open`, canh giữa cửa sổ và lưu reference theo ba cấp:

- `VieFUND` → `popupWindow`.
- `VieFUND1` → `popupWindow1`.
- `VieFUND2` → `popupWindow2`.

Mở popup mới cùng cấp sẽ đóng popup cũ. Nếu caller đang là `VieFUND1`, helper tự chuyển child thành `VieFUND2`. `ClosePopup`, `ClosePopup1`, `ClosePopup2` cleanup theo cây này.

Popup dùng `PopupHeader.aspx`, form riêng, `CBase.IsPageValid(..., "PageClose.aspx", ...)`, `PageLoad1`, và thường có iframe ẩn `KeepSession.aspx`.

### 7.2. Callback từ popup về opener

Các fragment như `PopupClientAddEdit_js.aspx` và `PopupTradeAdd_js.aspx`:

1. Lấy `window.opener.document`.
2. Đóng popup.
3. Tìm hidden server button như `BTUpdateList`, `BTPlanUpdate1`, `BtnPageReload`.
4. Gọi `.click()` để page cha postback/refresh đúng vùng.

Đây là coupling bằng DOM ID. Khi đổi ID ở page cha phải tìm toàn bộ `Popup*_js.aspx` và JavaScript tham chiếu ID đó.

### 7.3. Modal panel trong cùng page

Page include `Panel*.aspx`, khai báo hidden `asp:Button` làm `TargetControlID`, rồi gắn `ajaxToolkit:ModalPopupExtender`:

```text
hidden button
  → ModalPopupExtender
      ├─ PopupControlID = asp:Panel trong fragment
      ├─ PopupDragHandleControlID = header của panel
      └─ BackgroundCssClass = DlgBox
```

Event OK/Cancel nằm ở page cha. Vì panel nằm trong cùng control tree, nested `UpdatePanel` và trigger phải được wiring chính xác.

### 7.4. Lookup/dropdown AJAX

`ShowDropDownBox1` tạo động `div#idUBDropDown`, build URL có `Lg`, `iLoginID`, `GUID`, client/plan/member/trx và `Param1..3`, sau đó gọi `ajax_loadContent`.

Endpoint như `CityList.aspx` include `ListHeader`, validate bằng `IsPageValid2`, bind `ListBox`; click option gọi `OnCitySelected` trên JavaScript của page cha để điền lại control và ẩn box.

Đây là HTML-over-AJAX, không phải JSON API. Xem thêm [AJAX Engine](javascript/ajax.md).

## 8. Partial postback và tab

### 8.1. UpdatePanel

Pattern chủ đạo là:

```aspx
<asp:UpdatePanel runat="server"
    UpdateMode="Conditional"
    ChildrenAsTriggers="false">
  <ContentTemplate>...</ContentTemplate>
  <Triggers>
    <asp:AsyncPostBackTrigger ControlID="idSearch" EventName="Click" />
  </Triggers>
</asp:UpdatePanel>
```

Inventory có 5.522 `UpdatePanel`, 13.632 `AsyncPostBackTrigger`, nhưng chỉ 12 `PostBackTrigger`. Khi download file, upload hoặc thay response headers, cần full postback; async postback thường không trả file đúng cách.

Sau async postback, script inline hoặc event handler gắn trong vùng thay thế có thể cần đăng ký lại qua `ScriptManager`/helper thay vì giả định `window.onload` chạy lại.

### 8.2. Hai kiểu tab

1. Manual tab: cặp cell `TD...Sel`/`TD...`, `LinkButton`, `asp:MultiView`, `hdLastTabID`; code-behind reset visibility rồi đổi `ActiveViewIndex`.
2. AjaxControlToolkit: `TabContainer`/`TabPanel`, thường dùng cho form edit nhiều nhóm dữ liệu.

Manual tab có cả state của view lẫn state CSS/visibility. Chỉ đổi `ActiveViewIndex` có thể để header tab hiển thị sai.

## 9. List, binding và control naming

### 9.1. Repeater thay cho GridView

List thường là HTML `<table>` tự viết và `asp:Repeater` render row. Code-behind lấy `DataTable`, gán `DataView`, rồi `DataBind()`.

Ưu điểm là kiểm soát markup chặt; đổi lại sorting, paging, selection và empty state đều phải tự xử lý bằng hidden field, JavaScript và SP.

Khi bind text do user/data nhập, dùng `CFunctions.HtmlEncode` theo đúng context. Một số field như icon/radio/status HTML được SP hoặc BLL dựng sẵn và render raw; phải xác minh nguồn trước khi bỏ encode.

### 9.2. Dropdown từ nhiều result set

`CBase.LoadSimpleDropDownListArray` gọi một SP trả nhiều table. Row đầu mỗi table cung cấp `RecType`; `CBase` đặt `DataTable.TableName = RecType`, tìm `DropDownList` có ID trùng tên đó, rồi bind `ID`/`FSCode` và `Description`.

Đây là contract chặt giữa SQL và control ID. Đổi `cb...` trong markup mà không sửa `RecType` của SP sẽ khiến dropdown không được bind nhưng có thể không có lỗi rõ ràng.

### 9.3. Tự restore control theo prefix

`CBase.UpdateControlsFromTable` tìm control theo `CtrlStr` và prefix:

| Prefix | Control kỳ vọng |
|---|---|
| `cb` | `DropDownList` |
| `ch` | `CheckBox` |
| `hd` | hidden input |
| `rb` | `RadioButton`/`RadioButtonList` |
| `id` | ưu tiên `TextBox` |

`CBase.SaveHiddenValueArray` lưu state qua `UBHiddenValueArraySave`; `SetHiddenValues` đọc `UBHiddenValueList` rồi khôi phục control. Một số filter/sort/page state vì thế được persist trong DB theo user, không chỉ nằm trong ViewState.

## 10. Localization EN/FR

### 10.1. Pattern chính: hai markup, một code-behind

Ví dụ:

- `TrxView.aspx`: `culture="en-US"`, `PageLg=0`, `szFileName_ME=TrxView_FR.aspx`.
- `TrxView_FR.aspx`: `culture="fr-CA"`, `PageLg=1`, `szFileName_ME=TrxView.aspx`.
- Cả hai `Inherits="WebApp.Main.TrxView"`.

Trong 461 cặp EN/FR hiện có:

- 190 cặp page dùng cùng `Inherits`.
- 270 cặp đều là fragment không có Page directive.
- 1 cặp page có `Inherits` khác nhau, ghi tại mục finding.

`ChangeLanguage()` lấy `szFileName_ME`, đặt vào `szFileName` rồi submit; code-behind chung đọc `PageLg` để chọn text, SP language và page/popup tiếp theo.

### 10.2. Các lớp localization cùng tồn tại

- Markup EN/FR tách đôi.
- JS tách đôi: `CommonMSG.js/_FR.js`, `DateStr_EN/FR.js`, `TopPage_EN/FR.js`, `UBMenuConst_EN/FR.js`, `UBMenuContent_EN/FR.js`.
- Code-behind dùng `Lg == 1 ? French : English`.
- SP nhận `@Lg` và trả `Description` đã localize.
- Resource expression `MultiLg` có tồn tại nhưng trong source markup hiện tại chỉ `Default.aspx` sử dụng: 48 occurrence trong một file.

Vì vậy không được giả định thêm resource key là đủ cho main UI. Feature mới phải cập nhật cả hai markup/JS/SP nếu đi theo pattern legacy.

## 11. CSS và dealer theme

Header luôn nạp `Css/UBStyle.css`, sau đó khai báo nhiều alternate stylesheet dạng `UBStyle_<DSID>.css`. Login page đưa `hdCustomSS` vào `CMember.SessionLogin`, session lưu `CustomSS`; header render giá trị này thành `AltCSSTitle` và gọi `setActiveStyleSheet`.

Theme thực tế được chọn bằng title `CS_<DSID>`, không phải bằng ASP.NET theme/master page. Asset logo/background cũng nằm theo dealer trong `WebApp/Img/<DSID>/`.

Khi thêm CSS:

- Ưu tiên class trong base stylesheet nếu hành vi dùng chung.
- Kiểm tra override ở stylesheet dealer trước khi đổi selector/global spacing.
- Test cả shell full, popup, print và EN/FR.
- Không dựa vào `customCSS.Href`; nhiều assignment trong code-behind hiện đang comment, còn alternate stylesheet + `CustomSS` là luồng active đã quan sát.

## 12. Findings và rủi ro đã xác minh

### 12.1. `CommPayrollHistoryPrn_FR.aspx` sai `Inherits`

Page EN và code-behind dùng `WebApp.Main.CommPayrollHistoryPrn`, nhưng FR markup dùng `WebApp.Main.CommrollHistoryPrn`. Không tìm thấy class `CommrollHistoryPrn` trong source. `MenuFunctions.js` vẫn route user FR tới page này.

Đây là mismatch source rõ ràng và có khả năng gây parser/runtime error. Cần xác nhận assembly đang deploy rồi sửa FR `Inherits` về class thật.

### 12.2. `PopupModalLessWindow` có tham số không có tác dụng

Trong implementation hiện tại:

- `params` không được dùng hoặc gắn vào URL.
- `resizable` không quyết định feature string; helper luôn ghi `resizable=yes`.

Các caller active thường tự nối query string vào `pageLink` hoặc truyền `params=''`. Không truyền dữ liệu mới qua đối số `params` nếu chưa sửa helper và regression-test toàn bộ popup stack.

### 12.3. Request validation bị tắt rộng

Trong 477 file có Page directive ở `WebApp/Main`, 276 file đặt `validateRequest="false"`. Một số form có thể cần nhận HTML/encoded content, nhưng việc tắt ở page scope mở rộng bề mặt XSS.

Không bật lại hàng loạt vì có thể phá luồng legacy. Với page sửa mới, cần inventory input thật sự cần markup, validate/sanitize theo field và encode output theo context. Finding này cũng được ghi bổ sung trong Security module guide.

### 12.4. Naming convention không phải type system

- 431 `Panel*.aspx` là fragment, không phải UserControl.
- 126 `Popup*.aspx` cũng là fragment.
- 4 FR fragment không có base EN cùng tên.
- Chỉ 210/434 code-behind có designer file; nhiều control được khai báo thủ công.

Tool/refactor tự động dựa vào prefix hoặc giả định mọi page có designer sẽ bỏ sót hoặc sửa sai.

### 12.5. Coupling và duplicate markup

Control ID là contract xuyên qua markup, JS, popup opener, code-behind, `RecType` và settings DB. EN/FR duplication làm tăng nguy cơ chỉ sửa một ngôn ngữ. Mọi đổi tên ID hoặc tách fragment cần `rg` toàn workspace trước khi sửa.

## 13. Checklist thêm một main page

- [ ] Tạo cặp EN/FR nếu module theo pattern legacy; dùng cùng `Inherits`.
- [ ] Include đúng `PageHeaderFull`/`PageFooter`; không tạo master page giả định.
- [ ] Có `frmMain`, `PageLg`, `hdiLoginID`, `hdGUID`; thêm navigation/page ID fields khi cần.
- [ ] Gọi `PageLoad1` ở initial load và `IsPageValid` trước mỗi action.
- [ ] Include menu theo đúng thứ tự và gọi `SetCurrentMenu`.
- [ ] Enforce permission ở server/SP; JS/menu chỉ hỗ trợ UX.
- [ ] Với MultiView, cập nhật cả `ActiveViewIndex`, selected/unselected tab và `hdLastTabID`.
- [ ] Với UpdatePanel, khai báo trigger rõ; dùng full postback cho upload/download.
- [ ] Nếu SP bind dropdown theo `RecType`, giữ control ID đồng bộ.
- [ ] Encode field của Repeater theo context; chỉ render raw HTML khi nguồn đã kiểm soát.
- [ ] Kiểm tra dealer theme, EN/FR, resize, timer, popup cleanup và session expiry.

## 14. Checklist thêm popup hoặc panel

### Popup độc lập

- [ ] Có Page directive và `PopupHeader`/`PopupFooter`.
- [ ] Chọn đúng window level `VieFUND`, `VieFUND1` hoặc `VieFUND2`.
- [ ] Gắn query parameter vào URL và encode từng giá trị; không dựa vào `params` của `PopupModalLessWindow`.
- [ ] Validate session/GUID và permission server-side.
- [ ] Xác định callback về opener, hidden button cần click và hành vi khi user đóng bằng nút X.
- [ ] Test child popup, focus, resize và cleanup khi parent unload.

### Panel trong page

- [ ] Fragment không có Page directive/`html`/`form` riêng.
- [ ] ID duy nhất sau khi include vào page cha.
- [ ] `TargetControlID`, `PopupControlID`, drag handle và OK/Cancel event khớp.
- [ ] Khai báo server control trong partial class/designer của page cha.
- [ ] Wiring UpdatePanel trigger cho cả open, validate, save, cancel và refresh list.

## 15. Cách debug theo triệu chứng

| Triệu chứng | Kiểm tra đầu tiên |
|---|---|
| Click menu không chuyển page | `bPageBusy`, `szFileName`, form submit, nhánh `Page_Load` và `PageChange` |
| Page FR parser error | `Inherits`, class compile, cặp EN/FR và project Content/Compile entries |
| Popup mở sai/stale | window name, popup level, reference `popupWindow*`, query string |
| Save popup xong parent không refresh | `window.opener`, ID hidden refresh button, unload callback |
| Modal panel không hiện | hidden target button, `PopupControlID`, panel `display:none`, extender `.Show()` |
| Async action không cập nhật UI | đúng UpdatePanel, trigger, `Update()` và đăng ký script sau postback |
| Download không chạy | action đang ở async postback; chuyển sang `PostBackTrigger`/full postback |
| Dropdown rỗng | `RecType` của result set có trùng ID `cb...`, `ID/FSCode`, `Description` hay không |
| Filter/tab mất state | `hdLastTabID`, hidden sort/page fields, `SaveHiddenValueArray`/`SetHiddenValues` |
| Chỉ lỗi một ngôn ngữ | file `_FR`, JS `_FR`, `PageLg`, `culture`, ternary C# và label từ SP |
| Style sai một dealer | `CustomSS`, title stylesheet, `UBStyle_<DSID>.css` và asset dealer |

## 16. Thứ tự đọc source đề xuất

1. `WebApp/Main/TrxView.aspx` và `TrxView.aspx.cs` — main page đầy đủ pattern.
2. `WebApp/Inc/PageHeaderFull.aspx`, `PageFooter.aspx`, `SessionVars.aspx`.
3. `WebApp/Inc/UBMenuInit.aspx`, `UBMenuContent.aspx`.
4. `WebApp/Js/UBMenuDropdown.js`, `UBMenuContent_EN.js`, `MenuFunctions.js`.
5. `WebApp/Main/PopupClientAdd.aspx` và code-behind.
6. `WebApp/Main/PanelClientSearch.aspx`, `PopupClientAddEdit_js.aspx`.
7. `WebApp/Js/CommonFunctions.js`: `ChangePage`, popup stack, `ShowDropDownBox1`.
8. `UBStatic/CFunctions.cs`: `PageChange`, `PageLoad1`.
9. `UBClasses/CBase.cs`: page validation, dropdown/control binding, hidden-state persistence.

## 17. Tài liệu liên quan

- [JavaScript Framework](javascript.md)
- [UI & Popup Management](javascript/ui-popups.md)
- [Server–Client Bridge](javascript/server-client-bridge.md)
- [AJAX Engine](javascript/ajax.md)
- [Authentication & Authorization](auth.md)
- [Multi-tenancy](multitenancy.md)
- [Security Module Guide](../topics/security/module-guide.md)
- [Screen Catalog](../reference/screen-catalog.md)
