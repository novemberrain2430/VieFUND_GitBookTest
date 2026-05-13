# VieFund WebApp — Security Remediation Results

> **Báo cáo:** Red Sentry Penetration Test (viefund_sx.md)  
> **Framework:** ASP.NET Web Forms, .NET Framework 4.5.2  
> **Ngày phân tích:** 2026-04-17  
> **Trạng thái:** Đề xuất sửa (chưa deploy)

---

## Tổng quan

| # | Finding ID | Severity | Mô tả | Trạng thái |
|---|-----------|----------|-------|------------|
| 1 | TYHX33P-F0001 | **HIGH** | Broken Access Control — FundSetup, OnBoardView, RESPView | ✅ Đề xuất fix |
| 2 | TYHX33P-F0002 | **MEDIUM** | Stored XSS via SVG File Upload (Fund Fact) | ✅ Đề xuất fix |
| 3 | TYHX33P-F0003 | INFO | Missing Security Headers | ✅ Đề xuất fix |
| 4 | TYHX33P-F0004 | INFO | Server Version Banner Exposure | ✅ Đề xuất fix |
| 5 | TYHX33P-F0005 | INFO | Content-Disposition: inline cho uploaded files | ✅ Đề xuất fix |

---

## Finding 1: Broken Access Control (HIGH)

### Vấn đề

Các trang admin (`FundSetup.aspx`, `OnBoardView.aspx`, `RESPView.aspx`) chỉ kiểm tra vai trò admin trong `if (!IsPostBack)` và chỉ **disable UI controls** (buttons). Điều này dẫn đến:

1. **Non-admin advisor vẫn xem được toàn bộ data** quản trị (fund setup, pricing, approval status...)
2. **Advisor có thể bypass** bằng cách craft POST request trực tiếp vì `Enabled = false` **KHÔNG** ngăn server-side event handler được gọi trong ASP.NET Web Forms
3. Code disable controls chỉ chạy lần đầu load trang, **không chạy lại trên postback**

### Quyết định Business

> **Advisor được phép XEM nhưng KHÔNG được phép SỬA data trên các trang admin.**

### Giải pháp: `SecureBasePage` + Override `RaisePostBackEvent`

Thay vì thêm guard vào từng event handler (~50 handlers mỗi trang), giải pháp tối ưu là tạo một base class chặn tập trung tại **framework-level**.

ASP.NET Web Forms có method virtual `Page.RaisePostBackEvent(IPostBackEventHandler, string)` — đây là **cổng duy nhất** mà MỌI postback event phải đi qua. Override method này cho phép chặn tất cả write events cho non-admin tại **một điểm duy nhất**.

#### File mới: `WebApp/App_Code/SecureBasePage.cs`

```csharp
using System;
using System.Collections.Generic;
using System.Web.UI;
using System.Web.UI.WebControls;
using UBClass;
using UBStatic;
using UBConnection;

namespace WebApp
{
    /// <summary>
    /// Base page providing centralized write-protection for admin pages.
    /// Non-admin users can VIEW data but cannot trigger any registered write events.
    /// 
    /// HOW IT WORKS:
    /// 1. OnInit: Reads TMPUserAdmin session → sets IsAdminUser
    /// 2. WriteProtect(): Called in Page_Load to register + disable write controls
    /// 3. RaisePostBackEvent(): Framework-level intercept blocks ALL postback events
    ///    targeting write-protected controls for non-admin users.
    /// 
    /// This prevents bypass via crafted POST requests because the interception
    /// happens BEFORE any event handler code executes.
    /// </summary>
    public class SecureBasePage : System.Web.UI.Page
    {
        private readonly HashSet<string> _writeProtectedIDs = new HashSet<string>();

        /// <summary>
        /// True if current user has admin role (TMPUserAdmin != 0).
        /// Computed once in OnInit, available throughout page lifecycle.
        /// </summary>
        protected bool IsAdminUser { get; private set; }

        protected override void OnInit(EventArgs e)
        {
            base.OnInit(e);
            IsAdminUser = (CFunctions.GetSessionValueInt(this, -1, "TMPUserAdmin", 0) != 0);
        }

        /// <summary>
        /// Register controls that require admin privileges to interact with.
        /// For non-admin users: controls are visually disabled AND postback events are blocked.
        /// 
        /// MUST be called in Page_Load OUTSIDE of if(!IsPostBack) so it runs on every request.
        /// </summary>
        /// <param name="controls">WebControls to protect (buttons, links, etc.)</param>
        protected void WriteProtect(params WebControl[] controls)
        {
            if (IsAdminUser) return; // Admin can do everything, skip

            foreach (var ctrl in controls)
            {
                if (ctrl != null)
                {
                    ctrl.Enabled = false;            // Visual: disabled in browser
                    _writeProtectedIDs.Add(ctrl.UniqueID); // Register for server-side block
                }
            }
        }

        /// <summary>
        /// Overload: Register controls by UniqueID string (for dynamically created controls).
        /// </summary>
        protected void WriteProtectByID(params string[] uniqueIDs)
        {
            if (IsAdminUser) return;

            foreach (var id in uniqueIDs)
            {
                if (!string.IsNullOrEmpty(id))
                    _writeProtectedIDs.Add(id);
            }
        }

        /// <summary>
        /// FRAMEWORK-LEVEL INTERCEPT.
        /// Every postback event in ASP.NET Web Forms passes through this method
        /// before reaching the actual event handler (OnClick, etc.).
        /// 
        /// If the user is NOT admin AND the source control is write-protected,
        /// the event is silently blocked — the handler code NEVER executes.
        /// </summary>
        protected override void RaisePostBackEvent(
            IPostBackEventHandler sourceControl, string eventArgument)
        {
            if (!IsAdminUser
                && sourceControl is Control ctrl
                && _writeProtectedIDs.Contains(ctrl.UniqueID))
            {
                // Log the security event for audit trail
                try
                {
                    string userId = CFunctions.GetSessionValue(this, -1, "TMPLoginID");
                    CDatabase.WriteLog(string.Format(
                        "SECURITY: Blocked write attempt | User={0} | Control={1} | Page={2}",
                        userId, ctrl.UniqueID, this.Request.Url.AbsolutePath));
                }
                catch { /* logging should never break the app */ }

                return; // DO NOT call base → event handler never fires
            }

            base.RaisePostBackEvent(sourceControl, eventArgument);
        }
    }
}
```

#### Thay đổi trong `FundSetup.aspx.cs`

```diff
 // === Class Declaration ===
-public partial class FundSetup : System.Web.UI.Page
+public partial class FundSetup : SecureBasePage

 // === Page_Load ===
 protected void Page_Load(object sender, EventArgs e)
 {
     int Lg = CFunctions.ToInt16(PageLg.Value);
     if (CBase.IsPageValid(this, "", 0, Lg, 0, false) == false)
         return;
     if (szFileName.Value != "")
     {
         saveAllHidden();
         CFunctions.PageChange(this, 0, Lg, "FundSetup", szFileName.Value);
         return;
     }

+    // ★ SECURITY FIX (F0001): Write-protect admin controls.
+    // Runs on EVERY request including postbacks.
+    // Non-admin: controls disabled + postback events blocked at framework level.
+    WriteProtect(
+        idFundAdd, idFundRemove, idFundEdit,
+        idAddPX, idRemovePX, idModPX,
+        idObjOK,
+        idAddTCR, idRemoveTCR, idEditTCR
+    );
+    if (!IsAdminUser)
+    {
+        chApprovedOnly.Checked = true;
+        chApprovedOnly.Enabled = false;
+        divFundApprove.Visible = false;
+    }

     if (!IsPostBack)
     {
         CFunctions.PageLoad1(this);
         LoadSearchCriteria();
         // ...

-        bool bAdmin = CMember.IsAdmin(this, Lg, false);
-        if (!bAdmin)
-        {
-            chApprovedOnly.Checked = true;
-            chApprovedOnly.Enabled = false;
-            idObjOK.Enabled = false;
-            divFundApprove.Visible = false;
-            idAddTCR.Visible = false;
-            idRemoveTCR.Visible = false;
-            idEditTCR.Visible = false;
-        }
         // ...
-        int iSetupUser = CFunctions.GetSessionValueInt(this, -1, "TMPUserAdmin", 0);
-        if (iSetupUser == 0)
-        {
-            idFundAdd.Enabled = false;
-            idFundRemove.Enabled = false;
-            idFundEdit.Enabled = false;
-            idAddPX.Enabled = false;
-            idRemovePX.Enabled = false;
-            idModPX.Enabled = false;
-            divFundApprove.Visible = false;
-        }

         // allow editing for compliance officer (giữ nguyên logic)
         int iCompOfficer = CFunctions.GetSessionValueInt(this, -1, "TMPUserCompOfficer", 0);
         if (iCompOfficer > 0)
         {
             idFundEdit.Enabled = true;
         }
     }
 }

 // ★ KHÔNG CẦN SỬA BẤT KỲ EVENT HANDLER NÀO
 // OnFundAdd, OnFundRemove, OnFundEdit, OnAddPX, OnRemovePX, ...
 // Tất cả đều được bảo vệ tự động bởi SecureBasePage.RaisePostBackEvent()
```

#### Áp dụng tương tự cho `OnBoardView.aspx.cs` và `RESPView.aspx.cs`

```diff
-public partial class OnBoardView : System.Web.UI.Page
+public partial class OnBoardView : SecureBasePage

 protected void Page_Load(...)
 {
+    // ★ SECURITY FIX (F0001)
+    WriteProtect(/* list of write controls on this page */);
     // ... existing code ...
 }
```

```diff
-public partial class RESPView : System.Web.UI.Page
+public partial class RESPView : SecureBasePage

 protected void Page_Load(...)
 {
+    // ★ SECURITY FIX (F0001)
+    WriteProtect(/* list of write controls on this page */);
     // ... existing code ...
 }
```

### So sánh phương án

| Tiêu chí | Guard từng handler | Chỉ `Enabled=false` | **SecureBasePage (đã chọn)** |
|---|---|---|---|
| Số method cần sửa / trang | ~50 | 1 block | **1 block** |
| Chống craft POST request | ✅ | ❌ | **✅** |
| Có thể bỏ sót handler | ❌ Rất dễ | N/A | **✅ Không thể** |
| Reusable cho trang khác | ❌ | ❌ | **✅ Chỉ `inherits`** |
| Audit / code review | Khó (50+ nơi) | 1 nơi | **1 nơi** |
| Cần sửa event handler | Tất cả | Không | **Không** |

---

## Finding 2: Stored XSS via SVG File Upload (MEDIUM)

### Vấn đề

Hệ thống cho phép upload file Fund Fact qua `FundSetup.aspx` → method `FFProcessUpload()` (dòng 2059). Hiện tại **KHÔNG** validate loại file — attacker có thể upload file `.svg` chứa mã JavaScript độc hại. Khi file này được serve lại cho user khác (inline rendering), mã XSS sẽ thực thi.

### Giải pháp: 3 lớp bảo vệ

#### Lớp 1: Block extension nguy hiểm + Validate Magic Bytes

Thêm validation vào method `FFProcessUpload` trong `FundSetup.aspx.cs`:

```diff
 protected void FFProcessUpload(object sender, AjaxControlToolkit.AsyncFileUploadEventArgs e)
 {
     try
     {
         if (idFFFileUploadControl.HasFile)
         {
+            // ★ SECURITY FIX (F0002): Validate file before processing
+            string FileName = idFFFileUploadControl.PostedFile.FileName;
+            string FileExt = System.IO.Path.GetExtension(FileName).ToLowerInvariant();
+
+            // Layer 1: Block dangerous extensions explicitly
+            string[] blockedExts = { ".svg", ".html", ".htm", ".xml",
+                                     ".xhtml", ".js", ".exe", ".bat", ".cmd" };
+            if (Array.Exists(blockedExts, ext => ext == FileExt))
+            {
+                CBase.DisplayAlert(this, "Comp",
+                    "Security: This file type is not allowed.", false);
+                idFFFileUploadControl.Dispose();
+                return;
+            }
+
+            // Layer 2: Whitelist allowed extensions
+            string[] allowedExts = { ".pdf", ".doc", ".docx", ".xls", ".xlsx" };
+            if (!Array.Exists(allowedExts, ext => ext == FileExt))
+            {
+                CBase.DisplayAlert(this, "Comp",
+                    "Only PDF, DOC, DOCX, XLS, XLSX files are allowed.", false);
+                idFFFileUploadControl.Dispose();
+                return;
+            }
+
+            // Layer 3: Validate magic bytes (file signature)
+            // Prevents renamed files (e.g. malware.svg → malware.pdf)
+            byte[] header = new byte[5];
+            var stream = idFFFileUploadControl.PostedFile.InputStream;
+            stream.Read(header, 0, header.Length);
+            stream.Position = 0; // CRITICAL: reset stream for downstream processing
+
+            string hex = BitConverter.ToString(header).Replace("-", "").ToUpper();
+            bool validSignature =
+                hex.StartsWith("25504446") ||  // %PDF- (PDF)
+                hex.StartsWith("504B0304") ||  // PK.. (DOCX/XLSX = ZIP)
+                hex.StartsWith("D0CF11E0");    // ÐÏ.à (DOC/XLS = OLE2)
+
+            if (!validSignature)
+            {
+                CBase.DisplayAlert(this, "Comp",
+                    "File content does not match expected format.", false);
+                idFFFileUploadControl.Dispose();
+                return;
+            }

-            int iSource = 1;
-            int iFundID = CFunctions.ToInt(hdCurrentFD.Value);
-            string FileName = idFFFileUploadControl.PostedFile.FileName;
+            int iSource = 1;
+            int iFundID = CFunctions.ToInt(hdCurrentFD.Value);
             int iFileSize = idFFFileUploadControl.PostedFile.ContentLength;
             string FileType = idFFFileUploadControl.PostedFile.ContentType;
             // ... rest of existing code unchanged ...
```

#### Giải thích Magic Bytes

| Định dạng | Magic Bytes (Hex) | ASCII | Ý nghĩa |
|---|---|---|---|
| PDF | `25 50 44 46 2D` | `%PDF-` | File PDF chuẩn luôn bắt đầu bằng chuỗi này |
| DOCX/XLSX | `50 4B 03 04` | `PK..` | File Office 2007+ thực chất là ZIP archive |
| DOC/XLS | `D0 CF 11 E0` | `ÐÏ.à` | File Office 97-2003 dùng format OLE2 Compound |
| SVG/XML | `3C 3F 78 6D 6C` | `<?xml` | ⚠️ File SVG/XML bắt đầu bằng XML declaration |
| SVG | `3C 73 76 67` | `<svg` | ⚠️ File SVG trực tiếp |

Dù attacker đổi tên `malware.svg` → `malware.pdf`, magic bytes vẫn là `3C 3F 78 6D 6C` hoặc `3C 73 76 67` → bị chặn.

---

## Finding 3 & 4 & 5: Security Headers + Server Banner + Content-Disposition

### Thay đổi trong `Web.config`

```diff
 <system.webServer>
   <validation validateIntegratedModeConfiguration="false" />
+
+  <!-- ★ SECURITY FIX (F0004): Suppress server version banners -->
+  <httpErrors errorMode="Custom" existingResponse="Replace">
+    <remove statusCode="404" />
+    <error statusCode="404" path="/PageNotFound.aspx" responseMode="ExecuteURL" />
+  </httpErrors>
+  <security>
+    <requestFiltering removeServerHeader="true">
+      <requestLimits maxAllowedContentLength="1024000000" />
+    </requestFiltering>
+  </security>
+
   <handlers>
     <remove name="ChartImageHandler" />
     <add name="ChartImageHandler" ... />
   </handlers>
   <defaultDocument>
     <files>
       <clear />
       <add value="Default.aspx" />
     </files>
   </defaultDocument>
   <httpProtocol>
     <customHeaders>
       <clear />
       <add name="X-Frame-Options" value="SAMEORIGIN" />
+
+      <!-- ★ SECURITY FIX (F0003): Add missing security headers -->
+      <add name="X-Content-Type-Options" value="nosniff" />
+      <add name="X-XSS-Protection" value="1; mode=block" />
+      <add name="Referrer-Policy" value="strict-origin-when-cross-origin" />
+      <add name="Permissions-Policy" value="camera=(), microphone=(), geolocation=()" />
+      <add name="Strict-Transport-Security" value="max-age=31536000; includeSubDomains" />
+      <add name="Content-Security-Policy" value="default-src 'self'; script-src 'self' 'unsafe-inline' 'unsafe-eval'; style-src 'self' 'unsafe-inline'; img-src 'self' data:; font-src 'self'; frame-ancestors 'self'; form-action 'self'; base-uri 'self';" />
+
+      <!-- ★ SECURITY FIX (F0004): Remove server identification -->
+      <remove name="X-Powered-By" />
     </customHeaders>
   </httpProtocol>
-  <security>
-    <requestFiltering>
-      <requestLimits maxAllowedContentLength="1024000000" />
-    </requestFiltering>
-  </security>
   <staticContent>
     <clientCache cacheControlMode="UseMaxAge" cacheControlMaxAge="30.00:00:00" />
   </staticContent>
 </system.webServer>
```

### Thay đổi trong `system.web` section

```diff
 <system.web>
+  <!-- ★ SECURITY FIX (F0004): Suppress ASP.NET version header -->
+  <httpRuntime enableVersionHeader="false"
+               executionTimeout="300"
+               maxRequestLength="104856"
+               useFullyQualifiedRedirectUrl="false"
+               minFreeThreads="8"
+               minLocalRequestFreeThreads="4"
+               appRequestQueueLimit="1000"
+               requestValidationMode="2.0" />
-  <httpRuntime executionTimeout="300" maxRequestLength="104856"
-               useFullyQualifiedRedirectUrl="false" minFreeThreads="8"
-               minLocalRequestFreeThreads="4" appRequestQueueLimit="1000"
-               requestValidationMode="2.0" />
 </system.web>
```

### Giải thích các header

| Header | Giá trị | Tác dụng |
|---|---|---|
| `X-Content-Type-Options` | `nosniff` | Chặn trình duyệt tự đoán MIME type (ngăn SVG được render là HTML) |
| `X-XSS-Protection` | `1; mode=block` | Bật bộ lọc XSS tích hợp của trình duyệt |
| `Strict-Transport-Security` | `max-age=31536000` | Ép tất cả kết nối phải dùng HTTPS trong 1 năm |
| `Referrer-Policy` | `strict-origin-when-cross-origin` | Giới hạn thông tin referrer gửi ra ngoài |
| `Permissions-Policy` | `camera=(), microphone=()...` | Chặn truy cập các API nhạy cảm không cần thiết |
| `Content-Security-Policy` | `default-src 'self'; script-src 'self' 'unsafe-inline' 'unsafe-eval'; ...` | Giới hạn nguồn load script/style/image — tuyến phòng thủ chính chống XSS. Cần `unsafe-inline`/`unsafe-eval` vì Web Forms tạo inline JS (`__doPostBack`, `ScriptResource.axd`) |
| `enableVersionHeader="false"` | — | Xóa header `X-AspNet-Version` khỏi response |
| `removeServerHeader="true"` | — | Xóa header `Server: Microsoft-IIS/x.x` |

---

## Finding 5: Content-Disposition cho Uploaded Files

### Vấn đề

Nhiều endpoint serve file dùng `Content-Disposition: inline` — trình duyệt sẽ **mở file trực tiếp** thay vì tải xuống. Nếu file chứa mã độc (SVG với XSS), malware sẽ thực thi.

### Giải pháp

#### Thay đổi trong `PdfView.aspx.cs` (dòng 2524-2527)

```diff
 if (FileData != null && FileData.Length > 0)
 {
     // ...
     Response.ClearHeaders();
-    if (Extra3 == "1" || (iFileSize > iFiveMB && Extra3 != "2"))
-        Response.AppendHeader("Content-Disposition", "attachment;filename=" + FileName);
-    else
-        Response.AppendHeader("Content-Disposition", "inline;filename=" + FileName);
+
+    // ★ SECURITY FIX (F0005): Force download for user-uploaded content
+    Response.AppendHeader("Content-Disposition", "attachment;filename=" + FileName);
+    Response.AppendHeader("X-Content-Type-Options", "nosniff");
+
     Response.ContentType = FileType;
     // ...
 }
```

#### Các file khác cần sửa `inline` → `attachment`

Các file sau đang dùng `Content-Disposition: inline` và cần đổi thành `attachment`:

| File | Dòng | Hiện tại |
|---|---|---|
| `PopupAFFilePrn.aspx.cs` | 62 | `inline` |
| `PopupLSFilePrn.aspx.cs` | 62 | `inline` |
| `PopupFileView.aspx.cs` | 109 | Thiếu `attachment`/`inline` keyword |
| `ClientStatementPdf1.aspx.cs` | 88 | `inline` |
| `DocViewPrn.aspx.cs` | 124 | `inline` |
| `CommFilePrn.aspx.cs` | 62 | `inline` |
| `SettlementFilePrn.aspx.cs` | 62 | `inline` |
| `TradeBlotterPrn.aspx.cs` | 103 | `inline` |
| `TradeRecapPrn.aspx.cs` | 110 | `inline` |
| `TrxViewPrn.aspx.cs` | 98 | `inline` |
| `ComplianceTrendDSCIssuePrn.aspx.cs` | 104 | `inline` |
| `ComplianceTrendExCommPrn.aspx.cs` | 105 | `inline` |
| `ComplianceTrendPlanPrn.aspx.cs` | 106 | `inline` |
| `ComplianceTrendShortTermPrn.aspx.cs` | 107 | `inline` |
| `ComplianceTrend2SidedPrn.aspx.cs` | 113 | `inline` |
| `ComplianceTrendSwitchLoadPrn.aspx.cs` | 107 | `inline` |
| `ComplianceTrendSwitchFeeIssuePrn.aspx.cs` | 106 | `inline` |
| `ComplianceTrendRedFeeIssuePrn.aspx.cs` | 107 | `inline` |
| `ComplianceIncompleteKYCPrn.aspx.cs` | 87 | `inline` |
| `ComplianceAccountPrn.aspx.cs` | 95 | `inline` |
| `ComplianceAccountUpdatePrn.aspx.cs` | 95 | `inline` |
| `ComplianceTrxPrn.aspx.cs` | 107 | `inline` |

> **Lưu ý:** Các file `*Prn.aspx.cs` (Print views) là report hệ thống tạo ra (không phải user-uploaded content). Rủi ro XSS thấp hơn nhưng vẫn nên đổi thành `attachment` theo nguyên tắc defense-in-depth. Nếu business cần hiển thị inline cho báo cáo PDF, có thể giữ `inline` cho riêng các file `*Prn.aspx.cs` nhưng **BẮT BUỘC** phải kèm header `X-Content-Type-Options: nosniff`.

---

## Tóm tắt File cần thay đổi

### File mới (1 file)

| File | Mô tả |
|---|---|
| `WebApp/App_Code/SecureBasePage.cs` | Base page class với write-protection framework |

### File cần sửa (4 file chính + ~22 file `Content-Disposition`)

| File | Thay đổi |
|---|---|
| `WebApp/Main/FundSetup.aspx.cs` | Đổi base class + thêm `WriteProtect()` + validate upload |
| `WebApp/Main/OnBoardView.aspx.cs` | Đổi base class + thêm `WriteProtect()` |
| `WebApp/Main/RESPView.aspx.cs` | Đổi base class + thêm `WriteProtect()` |
| `WebApp/Web.config` | Thêm security headers + suppress version banners |
| `WebApp/Main/PdfView.aspx.cs` | Đổi `inline` → `attachment` |
| `WebApp/Main/PopupFileView.aspx.cs` | Thêm `attachment` keyword |
| *(22 file *Prn.aspx.cs)* | Đổi `inline` → `attachment` (hoặc thêm `nosniff`) |

---

## Kế hoạch kiểm tra (Verification Plan)

### 1. Kiểm tra Broken Access Control (F0001)
- [ ] Login với tài khoản **admin** → vào FundSetup → confirm tất cả buttons hoạt động bình thường
- [ ] Login với tài khoản **advisor** → vào FundSetup → confirm:
  - Trang load bình thường, hiển thị data
  - Tất cả buttons Add/Remove/Edit bị disabled
  - Craft POST request thủ công → confirm event bị chặn (kiểm tra log "SECURITY: Blocked write attempt")
- [ ] Lặp lại cho OnBoardView và RESPView

### 2. Kiểm tra File Upload (F0002)
- [ ] Upload file `.pdf` hợp lệ → confirm thành công
- [ ] Upload file `.svg` → confirm bị chặn với thông báo lỗi
- [ ] Upload file `.pdf` thực chất là SVG đổi đuôi → confirm bị chặn bởi magic bytes
- [ ] Upload file `.docx` hợp lệ → confirm thành công

### 3. Kiểm tra Security Headers (F0003, F0004)
- [ ] Dùng `curl -I https://<domain>` hoặc browser DevTools → confirm:
  - `X-Content-Type-Options: nosniff` có mặt
  - `Strict-Transport-Security` có mặt
  - `X-Powered-By` KHÔNG có
  - `Server: Microsoft-IIS/x.x` KHÔNG có (hoặc trống)
  - `X-AspNet-Version` KHÔNG có

### 4. Kiểm tra Content-Disposition (F0005)
- [ ] Tải Fund Fact document → confirm trình duyệt download file thay vì mở inline
- [ ] Kiểm tra các report print views nếu giữ inline → confirm có `X-Content-Type-Options: nosniff`
