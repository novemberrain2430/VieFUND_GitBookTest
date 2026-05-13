# Broken Access Control — Chiến lược bảo vệ tập trung

## Vấn đề gốc

Bạn đã phát hiện đúng: **Advisor có thể truy cập trực tiếp nhiều trang admin qua URL** mà bình thường menu không hiển thị cho họ. Hiện tại hệ thống chỉ dựa vào:

1. **Menu ẩn** — không hiển thị link cho advisor → **không phải bảo mật**, chỉ là UI
2. **`CBase.IsPageValid()`** — chỉ kiểm tra **session hợp lệ** (đã login), **KHÔNG kiểm tra role**
3. **`Enabled = false`** trong `if (!IsPostBack)` — chỉ disable UI lần đầu load, **bypass được bằng POST request**

## Câu hỏi: "Vậy phải sửa từng file một?"

### Trả lời ngắn: **Có, nhưng có cách giảm thiểu công sức đáng kể**

Có **3 phương án**, từ đơn giản nhất đến tối ưu nhất:

---

## Phương án 1: WriteProtect từng trang (Đề xuất hiện tại)

Đây là phương án đã viết trong [SolvedResult.md](file:///c:/Users/NR/Desktop/VieFundAG/Docs/Fix%20Security%20Issue/SolvedResult.md).

**Ưu điểm:**
- An toàn ở mức event handler (chặn postback)
- Kiểm soát chính xác từng button nào cần protect

**Nhược điểm:**
- Phải mở từng file, tìm từng button write control, thêm `WriteProtect(...)`
- Dễ bỏ sót trang

**Công sức:** Cao — phải audit ~40+ trang có `TMPUserAdmin` check

---

## Phương án 2: `IHttpModule` — Chặn tại cổng vào (★ ĐỀ XUẤT THÊM)

> [!IMPORTANT]
> Thay vì sửa từng page, tạo **một HttpModule** chặn advisor truy cập **toàn bộ URL** của các trang admin-only.

### Ý tưởng

Tạo file `AdminPageGuardModule` — khi **BẤT KỲ request nào** đến một trang trong danh sách "admin-only", module sẽ kiểm tra session `TMPUserAdmin`. Nếu giá trị = 0 (advisor), **redirect** hoặc **block** ngay lập tức → trang không bao giờ được load.

### File mới: `WebApp/AdminPageGuardModule.cs`

```csharp
using System;
using System.Collections.Generic;
using System.Web;
using UBStatic;

namespace WebApp
{
    /// <summary>
    /// HTTP Module that blocks non-admin users from accessing admin-only pages.
    /// Runs BEFORE any page code — advisors never even see the page.
    /// </summary>
    public class AdminPageGuardModule : IHttpModule
    {
        // ★ Danh sách trang CHỈ admin mới được xem/truy cập
        // Nếu business cho phép advisor XEM thì KHÔNG thêm vào đây
        private static readonly HashSet<string> AdminOnlyPages = new HashSet<string>(
            StringComparer.OrdinalIgnoreCase)
        {
            // Thêm các trang mà advisor HOÀN TOÀN không được phép vào
            // Ví dụ:
            // "/Main/MemberSetup.aspx",
            // "/Main/PopupSetupCompliance.aspx",
            // "/Main/PopupMiscellaneousSetting.aspx",
        };

        // ★ Danh sách trang advisor ĐƯỢC XEM nhưng KHÔNG được SỬA
        // → Các trang này cần WriteProtect() trong code-behind
        private static readonly HashSet<string> ReadOnlyForAdvisor = new HashSet<string>(
            StringComparer.OrdinalIgnoreCase)
        {
            "/Main/FundSetup.aspx",
            "/Main/OnBoardView.aspx",
            "/Main/RESPView.aspx",
            // Thêm các trang khác...
        };

        public void Init(HttpApplication context)
        {
            context.PostAuthenticateRequest += OnPostAuthenticate;
        }

        private void OnPostAuthenticate(object sender, EventArgs e)
        {
            var app = (HttpApplication)sender;
            var ctx = app.Context;
            var session = ctx.Session;

            // Bỏ qua nếu chưa có session (trang login, static files...)
            if (session == null) return;

            string path = ctx.Request.AppRelativeCurrentExecutionFilePath
                          .Replace("~/", "/");

            // Check 1: Trang cấm hoàn toàn cho advisor
            if (AdminOnlyPages.Contains(path))
            {
                int isAdmin = 0;
                try
                {
                    object val = session["TMPUserAdmin"];
                    if (val != null) isAdmin = Convert.ToInt32(val);
                }
                catch { }

                if (isAdmin == 0)
                {
                    // Log security event
                    try
                    {
                        string userId = session["TMPLoginID"]?.ToString() ?? "unknown";
                        UBConnection.CDatabase.WriteLog(string.Format(
                            "SECURITY: Blocked page access | User={0} | Page={1}",
                            userId, path));
                    }
                    catch { }

                    // Redirect to dashboard hoặc show error
                    ctx.Response.Redirect("~/Main/DashBoard.aspx", true);
                }
            }
        }

        public void Dispose() { }
    }
}
```

### Đăng ký trong `Web.config`

```xml
<system.webServer>
  <modules>
    <add name="AdminPageGuard" type="WebApp.AdminPageGuardModule" />
  </modules>
</system.webServer>
```

### Phân loại trang

Dựa trên grep `TMPUserAdmin` trong codebase, đây là **tất cả các trang sử dụng admin check**:

| Trang | Kiểu hiện tại | Đề xuất |
|---|---|---|
| `FundSetup.aspx` | Disable buttons | **ReadOnly** (WriteProtect) |
| `OnBoardView.aspx` | Disable buttons | **ReadOnly** (WriteProtect) |
| `RESPView.aspx` | Disable buttons | **ReadOnly** (WriteProtect) |
| `MemberSetup.aspx` | Admin check | **AdminOnly** hoặc ReadOnly |
| `CommissionView.aspx` | Admin check | **ReadOnly** (WriteProtect) |
| `ComplianceAccount.aspx` | Admin check | **ReadOnly** (WriteProtect) |
| `ComplianceAccountUpdate.aspx` | Admin check | **ReadOnly** (WriteProtect) |
| `ComplianceNewPlan.aspx` | Admin check | **ReadOnly** (WriteProtect) |
| `ComplianceTrx.aspx` | Admin check | **ReadOnly** (WriteProtect) |
| `FINTRACView.aspx` | Admin check | **ReadOnly** (WriteProtect) |
| `ClientStatement.aspx` | Admin check | Cần xem lagi |
| `AccountView.aspx` | Admin check | **ReadOnly** (WriteProtect) |
| `Client.aspx` | Admin check | **ReadOnly** (WriteProtect) |
| `PlanView.aspx` | Admin check | **ReadOnly** (WriteProtect) |
| `PortfolioView.aspx` | Admin check | **ReadOnly** (WriteProtect) |
| `RRIFRedemptionView.aspx` | Admin check | **ReadOnly** (WriteProtect) |
| `SysPlanView.aspx` | Admin check | **ReadOnly** (WriteProtect) |
| `TrxView.aspx` | Admin check | **ReadOnly** (WriteProtect) |
| `PopupAccountAdd.aspx` | Admin check | **AdminOnly** |
| `PopupClientAdd.aspx` | Admin check | **ReadOnly** |
| `PopupClientReportTypes.aspx` | Admin check | **ReadOnly** |
| `PopupForms.aspx` | Admin check | **ReadOnly** |
| `PopupNotificationAdd.aspx` | Admin check | **ReadOnly** |
| `PopupOrderBatch.aspx` | Admin check | **AdminOnly** hoặc ReadOnly |
| `PopupSysPlanAdd.aspx` | Admin check | **AdminOnly** |
| `PopupTrustDepositAdd.aspx` | Admin check | **ReadOnly** |
| `PanelFeeEdit.aspx` | Admin check | **ReadOnly** |
| `PanelRRIFPayment.aspx` | Admin check | **ReadOnly** |
| `PanelSysPlanCashAdd.aspx` | Admin check | **AdminOnly** |
| `PanelCannexOrder.aspx` | Admin check | **AdminOnly** |

---

## Phương án 3: Hybrid (★★ TỐI ƯU NHẤT)

> [!TIP]
> **Kết hợp cả hai**: HttpModule để chặn truy cập trang + WriteProtect để chặn postback events.

### Chiến lược 2 lớp

```
Layer 1: AdminPageGuardModule
  └─ Trang AdminOnly → Block hoàn toàn → Advisor không vào được
  └─ Trang ReadOnly  → Cho vào nhưng đánh dấu

Layer 2: SecureBasePage + WriteProtect()
  └─ Chặn mọi write postback event cho advisor
  └─ CHỈ cần thêm cho các trang "ReadOnly" (~15 trang)
```

### Lộ trình thực hiện

```
Bước 1: Tạo AdminPageGuardModule.cs
        → Thêm tất cả trang AdminOnly vào blacklist
        → Đăng ký trong Web.config
        → ✅ Ngay lập tức chặn advisor truy cập ~10 trang admin-only

Bước 2: Tạo SecureBasePage.cs (đã có trong SolvedResult.md)

Bước 3: Chỉ sửa ~15 trang "ReadOnly" (advisor xem được, không sửa được)
        → Đổi base class: System.Web.UI.Page → SecureBasePage
        → Thêm WriteProtect(button1, button2, ...)
```

### So sánh tổng hợp

| Tiêu chí | Chỉ WriteProtect | Chỉ HttpModule | **Hybrid** |
|---|---|---|---|
| Chặn truy cập trang | ❌ | ✅ | ✅ |
| Chặn write postback | ✅ | ❌ | ✅ |
| Số file cần sửa | ~30+ | 2 (module + config) | **~17** |
| Bảo vệ trang mới tự động | ❌ | ✅ (nếu thêm vào list) | ✅ |
| Audit trail | ✅ | ✅ | ✅ |
| Defense-in-depth | 1 lớp | 1 lớp | **2 lớp** |

---

## Proposed Changes

### 1. Tạo HttpModule (Chặn truy cập)

#### [NEW] AdminPageGuardModule.cs
- Kiểm tra `TMPUserAdmin` session trước khi trang được load
- Danh sách `AdminOnlyPages`: advisor bị redirect về DashBoard
- Logging security events

#### [MODIFY] Web.config
- Đăng ký module trong `<system.webServer><modules>`

### 2. Tạo SecureBasePage (Chặn write events)

#### [NEW] SecureBasePage.cs
- Đã mô tả chi tiết trong SolvedResult.md
- Override `RaisePostBackEvent` để chặn postback tới write-protected controls

### 3. Sửa các trang ReadOnly (~15 trang)

Chỉ cần sửa các trang mà advisor **được xem nhưng không được sửa**:
- Đổi `class FundSetup : System.Web.UI.Page` → `: SecureBasePage`
- Thêm `WriteProtect(...)` trong `Page_Load`

---

## Open Questions

> [!IMPORTANT]
> **Cần xác nhận business rule cho từng nhóm trang:**
> 1. Trang nào advisor **HOÀN TOÀN không được vào** (AdminOnly)?
> 2. Trang nào advisor **được xem nhưng không sửa** (ReadOnly + WriteProtect)?
> 3. Trang nào advisor **được xem và cũng được sửa** (No restriction)?

> [!WARNING]
> **Session Access trong HttpModule:** `IHttpModule.PostAuthenticateRequest` có thể chưa có Session ready trong một số cấu hình. Cần dùng event `PostAcquireRequestState` hoặc `BeginRequest` kết hợp check `HttpContext.Current.Session != null`. Tôi sẽ verify khi triển khai.

---

## Verification Plan

### Build & Smoke Test
- [ ] Compile `AdminPageGuardModule.cs` thành công
- [ ] Web.config đăng ký module không gây lỗi startup

### Functional Test
- [ ] Login admin → truy cập FundSetup → tất cả buttons hoạt động
- [ ] Login advisor → truy cập FundSetup → buttons disabled, postback bị chặn
- [ ] Login advisor → gõ URL trang AdminOnly → bị redirect về DashBoard
- [ ] Kiểm tra log "SECURITY: Blocked" xuất hiện đúng

### Regression Test
- [ ] Tất cả trang hiện tại vẫn hoạt động bình thường cho admin
- [ ] Không ảnh hưởng đến trang login, public pages
