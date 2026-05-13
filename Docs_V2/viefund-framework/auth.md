# Authentication & Authorization — Developer Reference

> **Scope:** WebApp (ASP.NET Web Forms, .NET 4.5.2). Không dùng FormsAuthentication, ASP.NET Identity, hay cookie-based auth. Toàn bộ là custom session-based auth kết hợp SQL Stored Procedure.

---

## 1. Kiến trúc tổng quan

```
Browser ──POST──▶ Default.aspx.cs (LogIn)
                      │
                      ▼
              CMember.SessionLoginX()          ← UBClasses/Member.cs
                      │
              CEncryption8.GetEncPW()          ← UBConnection/CEncryption.cs
                      │
              CDatabase → SP: UBMemberLogin    ← SQL Server
                      │
              Đọc roles, flags, last page từ SP result
                      │
              CFunctions.SetSessionValue()     ← UBStatic/CFunctions.cs
              (lưu toàn bộ context vào Session)
                      │
              Response.Redirect(NextPage)
```

Mỗi request tiếp theo:

```
Page_Load (bất kỳ trang nào trong /Main/)
    │
    ├─ CBase.IsPageValid()   → kiểm tra Session + GUID, redirect nếu expire
    └─ CFunctions.PageLoad1() → load iLoginID từ Session vào hidden field
```

---

## 2. Mã hóa mật khẩu (`CEncryption8`)

**File:** `UBConnection/CEncryption.cs`

Hệ thống dùng DES tùy chỉnh (custom S-box, hardcoded key tables). **Không phải bcrypt, không phải SHA**.

```csharp
// Cách mã hóa mật khẩu trước khi gửi vào SP
string PWEnc    = CEncryption8.GetEncPW(LoginID, PW);     // key = 8 ký tự đầu của LoginID (lowercase)
string PWEnc_WF = CEncryption8.GetEncPW_WF(PW);           // WinFund legacy — key cố định trong m_PWKeys1_E
```

**Chi tiết `GetEncPW`:**
```csharp
static public string GetEncPW(string ID, string pw)
{
    string keyStr = GetKeyStr(ID.ToLower()); // lấy 8 ký tự đầu, pad bằng "20110601" nếu ngắn hơn
    return GetEncStr(keyStr, pw);            // DES encrypt, output là hex string
}
```

> ⚠️ **Key phụ thuộc vào `LoginID`** — cùng password nhưng 2 user khác nhau sẽ có `PWEnc` khác nhau. SP so sánh `PWEnc` stored trong DB với giá trị gửi lên.

**Forgot Password** sinh temporary password:
```csharp
string ID   = (DateTime.Now.Ticks % 10000000).ToString();
string PW   = CEncryption8.GetEncPW(ID, "VieFUND");  // ticks làm key
string PWEnc = CEncryption8.GetEncPW(LoginID, PW);   // rồi re-encrypt với LoginID
// Gọi SP UBMemberForgotPW — SP tự gửi email temp password
```

---

## 3. Luồng Login chi tiết

**File:** `WebApp/Default.aspx.cs` → `LogIn(int Lg)`  
**Core function:** `CMember.SessionLoginX()` — `UBClasses/Member.cs:1112`

### 3.1. Validate đầu vào (client-side)
```csharp
if (LoginID.Length < 3) errorCode = 4;
if (PW.Length < 3)      errorCode = 5;
if (DBIDStr.Length == 0 || DSIDStr.Length == 0) errorCode = 3;
```

### 3.2. Gọi SP `UBMemberLogin`
```csharp
db.SetSP("UBMemberLogin");
db.AddParam("DSID",             DSIDStr);
db.AddParam("SessionID",        p.Session.SessionID);   // ASP.NET session ID để audit
db.AddParam("LoginID",          LoginID);
db.AddParam("PWEnc",            PWEnc);                 // DES-encrypted password
db.AddParam("PWEnc_WF",         PWEnc_WF);              // WinFund legacy password
db.AddParam("iOptions",         Options);               // 1 = đang đổi password
db.AddParam("PWEncNew",         PWEncNew);              // nếu Options=1
db.AddParam("ClientIP",         ClientIP);              // log audit
db.AddParam("VerificationCode", VerificationCode);      // 2FA code (rỗng nếu chưa nhập)
db.AddParam("i2FASendMethod",   iSMSOpt > 0);           // true = gửi SMS, false = gửi email
```

### 3.3. Return codes từ SP (`errorCode`)

| Code | Ý nghĩa |
|------|---------|
| `0` | Login thành công |
| `1` | SP error |
| `2` | Không mở được DB |
| `11` | LoginID không tồn tại |
| `13` | Sai password |
| `17` | Password hết hạn (buộc đổi mật khẩu) |
| `18` | Password mới trùng password cũ |
| `19` | Confirm password không khớp |
| `25` | 2FA required — chưa nhập code (lần đầu) |
| `26` | 2FA code sai |

> Các code `>= 10` được map qua `CMSG.GetLoginErrorMSG(Lg, errorCode - 10)` để lấy thông báo lỗi theo ngôn ngữ.

### 3.4. SP trả về các fields
```
iLoginID, iMemberID, FirstName, LastName,
bAdmin, bManager, bRep, bAssistant, bDealer, bCompOfficer, bRegionalVP,
bProcessCommission, bModifyAttachment, bSetupUser,
iAccessClient, iAccessPlan, iAccessAccount,
bCanAddTrx, iManualTrx, bTrustAccount, bNSM,
iLockAddress4Rep, iAnnualIncomeValue, iFundfactFundata,
iPWPolicy, iNetworthMode, FundServVersion, WebAppMode,
bMFDAUser, iYearEndReport, bReadOnly, bMask, bDataEntryOnly,
iRestrictionFlag, iOrderFile,
bOmnibusProcessingEnable, bEnableUniformity, bBulkSwitchBasket,
bEnableLowMER, bEnableProdReport, bRESP, bSuitabilityGICEnabled,
iETFTrading, iETFTransfer, LastPage, ParamStr, LinkedIn, FaceBook, Tweeter
```

### 3.5. Lưu vào Session sau khi login thành công

```csharp
// Session key format: "{iLoginID}_{KeyName}"
// Ví dụ: "42_TMPUserAdmin" nếu iLoginID = 42

CFunctions.SetSessionValue(p, 0,         "iLoginID",    iLoginID.ToString());  // global key (không prefix)
CFunctions.SetSessionValue(p, iLoginID,  "TMPDBID",     DBIDStr);
CFunctions.SetSessionValue(p, iLoginID,  "TMPDSID",     DSIDStr);
CFunctions.SetSessionValue(p, iLoginID,  "TMPDSIDSub",  DSIDSubStr);
CFunctions.SetSessionValue(p, iLoginID,  "TMPiMemberID", iUserID.ToString());
CFunctions.SetSessionValue(p, iLoginID,  "TMPLoginID",  LoginID);
CFunctions.SetSessionValue(p, iLoginID,  "TMPGUID",     iLoginIDHistory.ToString()); // dùng để validate mỗi request
CFunctions.SetSessionValue(p, iLoginID,  "TMPUserName", UserName);
CFunctions.SetSessionValue(p, iLoginID,  "TMPUserAdmin",      bAdmin.ToString());
CFunctions.SetSessionValue(p, iLoginID,  "TMPUserManager",    bManager.ToString());
CFunctions.SetSessionValue(p, iLoginID,  "TMPUserRep",        bRep.ToString());
CFunctions.SetSessionValue(p, iLoginID,  "TMPUserAssistant",  bAssistant.ToString());
CFunctions.SetSessionValue(p, iLoginID,  "TMPUserDealer",     bDealer.ToString());
CFunctions.SetSessionValue(p, iLoginID,  "TMPUserCompOfficer",bCompOfficer.ToString());
CFunctions.SetSessionValue(p, iLoginID,  "TMPReadOnly",       bReadOnly.ToString());
CFunctions.SetSessionValue(p, iLoginID,  "TMPMask",           bMask.ToString());
CFunctions.SetSessionValue(p, iLoginID,  "TMPDataEntryOnly",  bDataEntryOnly.ToString());
// ... và ~20 keys khác
```

**Session key naming:**
```csharp
static public string GetSessionKey(int iLoginID, string KeyStr)
{
    if (iLoginID != 0)
        return iLoginID.ToString() + "_" + KeyStr;  // "42_TMPUserAdmin"
    else
        return KeyStr;                              // "iLoginID" (global)
}
```

> **Tại sao prefix `iLoginID`?** Để hỗ trợ multi-tab — mỗi tab có thể load trang khác nhau nhưng cùng session. `iLoginID` được dùng như namespace. Không bao giờ dùng `Session["TMPUserAdmin"]` trực tiếp — phải qua `CFunctions.GetSessionValue(page, iLoginID, "TMPUserAdmin")`.

---

## 4. Two-Factor Authentication (2FA)

### 4.1. Trigger

SP `UBMemberLogin` trả `errorCode = 25` nếu dealer bật 2FA cho user này và `VerificationCode` rỗng.

```csharp
// Default.aspx.cs — khi nhận Ret == 25
hdUserID.Value = iUserID.ToString();   // lưu iUserID tạm vào hidden field
ShowVcode2(true);                      // hiện UI nhập mã
```

### 4.2. Gửi mã (On2FASendCode)

```csharp
DataSet ds = CMember.GetNew2FACode(DBIDStr, DSIDStr, iUserID, Lg, iOptions);
// SP: UB2FAGetCode4User
// Params: DSID, iUserID, iDefLg, iOptions (0=email, 1=SMS), UserID
// Returns tables: "TwoFAInfo" (code, EmailAddress, PhoneNumber, Msg2Send)
//                 "TwilioInfo" (AccountServiceID, AccessToken, TwilioPhoneNumber, ServiceName)
```

**Gửi SMS qua Twilio:**
```csharp
CTextMsg obj = CTextMsg.TextMsgInit(AccountSid, AuthToken, TwilioPhoneNumber, ServiceName);
obj.SendSms(PhoneNumber, txtMsg, Lg, ref errorMessage, ref errorCode);
```

**Gửi Email:** SP tự xử lý trong `UB2FAGetCode4User` (gọi email service ở backend).

### 4.3. Verify

User nhập code → submit lại form → `LogIn(Lg)` chạy lại với `VerificationCode != ""` → SP `UBMemberLogin` check code.

- `Ret == 26`: code sai → show lại form
- `Ret == 0`: thành công → ghi session, redirect

---

## 5. Single Sign-On (SSO)

**File:** `WebApp/Default.aspx.cs::Page_Load`

Có 2 loại SSO:

**SSO kiểu 1** — `Param1` + `Param2` (legacy internal):
```csharp
// URL: Default.aspx?DSID=xxx&Param1=xxx&Param2=xxx
iRet = CMember.GetSingleSignOnPW(DSIDStr, Param1, Param2, ref LoginID, ref PW, ref Lg);
// Nếu lấy được PW → gọi SessionLogin() như bình thường
```

**SSO kiểu 2** — `UserID` + `KeyStr` + `AppID` (cross-app):
```csharp
// URL: Default.aspx?AppID=99&UserID=xxx&KeyStr=xxx
iRet = CMember.GetSingleSignOnPW2(DSIDStr, DBIDStr, iAppID, LoginID, KeyStr, ref LoginID, ref PW, ref Lg, 0);
```

---

## 6. Bảo vệ từng trang — Page Guard

### 6.1. `CFunctions.PageLoad1` — đọc LoginID

**File:** `UBStatic/CFunctions.cs:325`

```csharp
static public int PageLoad1(Page p)
{
    HtmlInputHidden ctrl = (HtmlInputHidden)p.FindControl("hdiLoginID");
    if (ctrl == null) return 0;

    // Lần đầu load trang (từ redirect), hidden field rỗng → đọc từ Session
    if ((ctrl.Value == "0" || ctrl.Value == "") && p.Session["iLoginID"] != null)
    {
        string Str1 = p.Session["iLoginID"].ToString();
        ctrl.Value = Str1;                  // gán vào hidden field để persist qua postbacks
        iLoginID = ToInt(Str1);

        // Load thêm GUID và PageID
        ctrl = p.FindControl("hdGUID");
        if (ctrl != null)
            ctrl.Value = GetSessionValue(p, iLoginID, "TMPGUID");

        ctrl = p.FindControl("PreviousPageStr");
        if (ctrl != null && ctrl.Value == "")
            ctrl.Value = GetSessionValue(p, iLoginID, "TMPREFERRER");
    }
    else
        iLoginID = ToInt(ctrl.Value, 0);    // postback — đọc từ hidden field luôn

    if (iLoginID > 0)
        ActionReset(p, iLoginID);           // reset TMPACTION flag
    return iLoginID;
}
```

**Pattern bắt buộc** trong `Page_Load` của mọi trang nội bộ:
```csharp
protected void Page_Load(object sender, EventArgs e)
{
    if (!IsPostBack)
    {
        int iLoginID = CFunctions.PageLoad1(this);
        if (iLoginID == 0) return;   // session hết hạn, PageLoad1 đã không redirect — trang tự thoát
        // ... load data
    }
}
```

### 6.2. `CBase.IsPageValid` — validate mỗi postback

**File:** `UBStatic/CFunctions.cs:441`

Được gọi ở **đầu mọi event handler** (button click, dropdown change, v.v.):

```csharp
// Signature
static public bool IsPageValid(Page p, string RedirectStr, int Options, int Lg, int Level, bool bCheckPageID = false)

// Ví dụ thực tế
if (CBase.IsPageValid(this, "", 0, Lg, 0, true) == false) return;
```

**Bên trong `IsPageValid`:**
```
1. CheckSession(p) → xem Session["iLoginID"] còn không
   → Nếu null: Session.Abandon() + redirect "PageExpired.aspx"

2. Lấy iLoginID từ hidden field hdiLoginID

3. So sánh hdGUID (hidden field) với Session["{iLoginID}_TMPGUID"]
   → Nếu không khớp: redirect PageExpired (ngăn CSRF / tab confusion)

4. Nếu bCheckPageID=true: kiểm tra thêm hdPageID vs Session[PageIDStr]
   → Phát hiện double-submit / stale postback
```

**`Level` param** xác định số `../` cần prefix vào redirect URL (trang trong `/Main/` dùng `Level=1`).

### 6.3. Sự khác biệt WebApp vs WebClient

| | WebApp (Advisor) | WebClient (Client Portal) |
|---|---|---|
| Session key global | `Session["iLoginID"]` | `Session["iLoginIDWC"]` |
| GUID key | `TMPGUID` | `TMPGUIDWC` |
| Referrer key | `TMPREFERRER` | `TMPREFERRERWC` |
| PageLoad helper | `CFunctions.PageLoad1()` | `CFunctions.PageLoad1WC()` |
| IsPageValid | `CBase.IsPageValid()` | `CBase.IsPageValidWC()` |
| CheckSession | `CheckSession()` | `CheckSessionWC()` |

---

## 7. Session Variables — Bảng tra cứu đầy đủ

Tất cả các key đều có format `"{iLoginID}_{Key}"`. Đọc bằng:
```csharp
CFunctions.GetSessionValue(this, -1, "TMPUserAdmin")
// iLoginID = -1 → tự động đọc từ hdiLoginID hidden field
```

### 7.1. Identity & Connection

| Session Key | Kiểu | Mô tả |
|---|---|---|
| `iLoginID` | global (no prefix) | ID của login session, dùng làm namespace |
| `TMPDBID` | string | Connection string ID đến DB |
| `TMPDSID` | string | Dealer/Sub-dealer ID |
| `TMPDSIDSub` | string | Sub-dealer ID |
| `TMPiMemberID` | int | User's member record ID |
| `TMPLoginID` | string | Username đã login |
| `TMPUserName` | string | Full name (FirstName + LastName) |
| `TMPGUID` | string | `iLoginIDHistory` từ SP — dùng validate page |
| `TMPREFERRER` | string | Tên trang trước đó (để back navigation) |
| `TMPLg` | int | Language (0=EN, 1=FR) |
| `LogPage` | string | Login page URL (để redirect khi logout) |

### 7.2. Role Flags

| Session Key | Giá trị | Mô tả |
|---|---|---|
| `TMPUserAdmin` | "0"/"1" | System Admin |
| `TMPUserManager` | "0"/"1" | Branch Manager |
| `TMPUserRep` | "0"/"1" | Representative (Advisor) |
| `TMPUserAssistant` | "0"/"1" | Assistant |
| `TMPUserDealer` | "0"/"1" | Dealer-level user |
| `TMPUserCompOfficer` | "0"/"1"/"2"/"3" | Compliance Officer (level) |
| `TMPUserRegionalVP` | "0"/"1" | Regional VP |
| `TMPbAssistantOnly` | "0"/"1" | `1` nếu chỉ là Assistant, không có role nào khác |
| `TMPbMFDAUser` | "0"/"1" | MFDA regulatory user — override nhiều flag khác |

### 7.3. Access Control Flags

| Session Key | Kiểu | Mô tả |
|---|---|---|
| `TMPReadOnly` | "0"/"1" | Chỉ đọc toàn bộ hệ thống |
| `TMPDataEntryOnly` | "0"/"1" | Chỉ nhập liệu, không xem báo cáo |
| `TMPMask` | "0"/"1" | Che SIN/confidential data |
| `TMPiAccessClient` | int | Mức truy cập Client records |
| `TMPiAccessPlan` | int | Mức truy cập Plan records |
| `TMPiAccessAccount` | int | Mức truy cập Account records |
| `TMPbCanAddTrx` | "0"/"1" | Được phép tạo transaction |
| `TMPiManualTrx` | int | Mức quyền manual transaction |
| `TMPbSetupUser` | "0"/"1" | Được phép vào Member Setup |
| `TMPProcessCommission` | "0"/"1" | Xử lý hoa hồng |
| `TMPModifyAttachment` | "0"/"1" | Sửa/xóa attachments |
| `TMPbTrustAccount` | "0"/"1" | Truy cập Trust accounts |
| `TMPiLockAddress4Rep` | int | Rep không được sửa địa chỉ nếu `=1` (admin override) |

### 7.4. Feature Flags (cấu hình theo Dealer)

| Session Key | Mô tả |
|---|---|
| `TMPOmnibusProcessingEnable` | Bật Omnibus processing |
| `TMPEnableUniformity` | Bật uniformity feature |
| `TMPBulkSwitchBasket` | Bật bulk switch basket |
| `TMPEnableLowMER` | Bật Low MER compliance |
| `TMPEnableRESP` | RESP accounts enabled |
| `TMPEnableProdReport` | Production report enabled |
| `TMPEnableSuitabilityGIC` | Suitability GIC enabled |
| `TMPiETFTrading` | ETF trading level |
| `TMPiETFTransfer` | ETF transfer level |
| `TMPGICOnlyUser` | User chỉ thấy GIC products |
| `TMPFundfactFundata` | Fundata integration enabled |
| `TMPPWPolicy` | Password complexity policy |
| `TMPFUNDSERVVERSION` | FundServ protocol version |
| `TMPWebAppMode` | App mode string |
| `TMPYearEndReport` | Year-end report access |

### 7.5. Restriction Flags (bitmask `iRestrictionFlag`)

| Bit | Session Key | Mô tả |
|---|---|---|
| `& 32` | `TMPNoWebClientRequest` | Không hiện WebClient request button |
| `& 64` | `TMPNoAdminStatement` | Không cho admin xem statement |
| `& 4096` | `TMPCanUnlockCash` | Được phép unlock cash |
| `& 8192` | `TMPGICOnlyUser` | GIC only user |
| `& 1` | `TMPbUserCOFile` | User có quyền CO file |

---

## 8. Authorization trong Code

### 8.1. Pattern đọc quyền

```csharp
// Đọc bool flag
bool bAdmin = (CFunctions.GetSessionValue(this, -1, "TMPUserAdmin") != "0");

// Đọc int flag
int iAccessClient = CFunctions.GetSessionValueInt(this, -1, "TMPiAccessClient", 0);

// Shorthand cho các role thường dùng
bool isReadOnly = (CFunctions.GetSessionValue(this, -1, "TMPReadOnly") == "1");
```

### 8.2. Pattern UI conditional

```csharp
// Ví dụ: AccountView.aspx.cs
protected void DealerSpecifics()
{
    bool bAdmin  = (CFunctions.GetSessionValue(this, -1, "TMPUserAdmin") != "0");
    string ReadOnly = CFunctions.GetSessionValue(this, -1, "TMPReadOnly");

    if (!bAdmin)
    {
        chNFUAdvisorInfoHistory.Enabled = false;
        chNFUDeactivateAdvisorHistory.Enabled = false;
    }

    if (ReadOnly == "1")
        idBulkSwitchProcess.Visible = false;
}
```

### 8.3. Data-level authorization qua SP

Không filter trong C# — filter trong SP. Mọi SP đều nhận `iUserID` và `DSID`:

```csharp
// CBase.GetConnectionParam() — helper lấy 3 tham số chuẩn
static public bool GetConnectionParam(Page p, ref int iUserID, ref string DBIDStr, ref string DSIDStr)
{
    iUserID  = CFunctions.GetLoginID(p, false);      // từ hdiLoginID hidden field
    DBIDStr  = CFunctions.GetSessionValue(p, iUserID, "TMPDBID");
    DSIDStr  = CFunctions.GetSessionValue(p, iUserID, "TMPDSID");
    return (iUserID > 0 && DBIDStr.Length > 0);
}

// Gọi SP — SP tự filter theo quyền của user
db.AddParam("DSID",    DSIDStr);   // phạm vi dealer
db.AddParam("iUserID", iUserID);   // SP dùng để check permission
db.AddParam("bAdmin",  bAdmin);    // pass role để SP biết filter thế nào
```

Ví dụ: `UBMemberSetupList` nhận `bAdmin`, `bRep`, `bDealer` và trả về chỉ những members mà caller có quyền xem.

---

## 9. Logout

**File:** `WebApp/Main/Logout.aspx.cs::OnLogout`

```csharp
protected void OnLogout(object sender, EventArgs e)
{
    int iLoginID = CFunctions.ToInt(hdiLoginID.Value);
    string LogPage = CFunctions.GetSessionValue(this, iLoginID, "LogPage");

    CBase.SessionLogout(this, iLoginID, true, 0);  // bLogout = true

    Response.Redirect(LogPage.Length == 0 ? "~/" : LogPage);
}
```

**Bên trong `CBase.SessionLogout`:**
```
1. Scan toàn bộ Session.Keys tìm key có prefix "{iLoginID}_"
2. Thu thập các key không phải TMP* vào XMLStr (là UI prefs / user settings)
3. Session.RemoveAt() xóa từng key
4. Gọi SP UBSessionEnd với XMLStr → SP lưu settings lại DB (audit + restore)
5. bLogout=true: SP đánh dấu session là "đã logout" trong DB
```

**Session tự hết hạn** (timeout): `Session_End` trong `Global.asax.cs` → `SessionSaveAll()` — tương tự nhưng không set `bLogout=true`.

---

## 10. Thêm trang mới — Checklist

1. **ASPX file:** Đảm bảo có `<input type="hidden" id="hdiLoginID" runat="server" />` và `<input type="hidden" id="hdGUID" runat="server" />`

2. **Page_Load:**
```csharp
protected void Page_Load(object sender, EventArgs e)
{
    int Lg = CFunctions.ToInt(PageLg.Value);
    if (!IsPostBack)
    {
        int iLoginID = CFunctions.PageLoad1(this);
        if (iLoginID == 0) return;
        // load data...
    }
}
```

3. **Mọi event handler:**
```csharp
protected void OnSomething(object sender, EventArgs e)
{
    int Lg = CFunctions.ToInt(PageLg.Value);
    if (CBase.IsPageValid(this, "", 0, Lg, 1, true) == false) return;
    // Level = 1 nếu trang trong /Main/
    // ...
}
```

4. **Lấy connection params:**
```csharp
string DBIDStr = "", DSIDStr = "";
int UserID = 0;
if (CBase.GetConnectionParam(this, ref UserID, ref DBIDStr, ref DSIDStr) == false) return;
```

5. **Đọc quyền:**
```csharp
bool bAdmin = (CFunctions.GetSessionValue(this, -1, "TMPUserAdmin") != "0");
bool isReadOnly = CFunctions.GetSessionValue(this, -1, "TMPReadOnly") == "1";
```

---

## 11. Các lỗi thường gặp

| Triệu chứng | Nguyên nhân | Fix |
|---|---|---|
| Redirect liên tục về PageExpired | Không gọi `PageLoad1()` trước event | Thêm `PageLoad1` vào `!IsPostBack` block |
| `hdGUID` mismatch sau postback | Không `Session["iLoginID"] = hdiLoginID.Value` khi thay iLoginID | Gọi `Session["iLoginID"] = hdiLoginID.Value` hoặc dùng `CFunctions.GetLoginID` |
| SP trả dữ liệu rỗng dù có data | Không truyền `iUserID` đúng vào SP | Check `GetConnectionParam` trả false không |
| 2FA loop vô tận | `VerificationCode` bị clear khi postback | Đảm bảo hidden field `hdUserID` giữ giá trị qua postback |
| Mở tab mới bị expire ngay | `hdGUID` của tab cũ không được load | Mỗi tab cần `PageLoad1()` chạy lại, check `hdGUID != ""` |
