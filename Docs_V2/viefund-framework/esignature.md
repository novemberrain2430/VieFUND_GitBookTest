# E-Signature Integration

> Hệ thống ký điện tử hỗ trợ 3 providers: **DocuSign**, **Signority**, **OneSpan**. Mỗi dealer (DSID) cấu hình sử dụng 1 provider duy nhất, được xác định qua SP `UBGetESignatureSourceType`.

---

## 1. Tổng quan kiến trúc

### Provider Selection

Hệ thống sử dụng enum `ESignatureSourceTypes` để xác định provider cho mỗi dealer:

```csharp
// UBClasses/ESignature.cs
public enum ESignatureSourceTypes
{
    DocuSign  = 1,  // Mặc định
    Signority = 2,
    OneSpan   = 3
}
```

**Luồng xác định provider:**
```
User login → ESignature.GetESignatureSourceType(DBIDStr, UserID)
           → SP "UBGetESignatureSourceType"
           → Trả về 1, 2, hoặc 3
           → UI hiển thị buttons/panels tương ứng
```

### Kiến trúc phân lớp

```
┌─────────────────────────────────────────────────────┐
│  WebApp (UI Layer)                                  │
│  ├── PopupForms.aspx        — Ký tài liệu client   │
│  ├── ComplianceDocView.aspx — Quản lý e-sign docs   │
│  ├── PopupMiscellaneousSetting.aspx — Cài đặt API   │
│  ├── PopupMemberAdd.aspx    — Kiểm tra user DocuSign│
│  ├── DocuSignCode.aspx      — OAuth callback        │
│  └── Default.aspx           — Token check on login  │
├─────────────────────────────────────────────────────┤
│  BLL Layer                                          │
│  ├── UBClasses/ESignature.cs  — Provider routing    │
│  ├── UBClasses/Forms.cs       — Envelope CRUD       │
│  └── UBClasses/CPlanDoc.cs    — E-Sign doc queries  │
├─────────────────────────────────────────────────────┤
│  Provider Libraries                                 │
│  ├── VFDocSign/CVFDocSign.cs  (109KB) — DocuSign    │
│  ├── VFSignority/CSignority.cs (54KB) — Signority   │
│  └── VFOneSpan/COneSpan.cs    (35KB) — OneSpan      │
├─────────────────────────────────────────────────────┤
│  Database (SP Layer)                                │
│  ├── UBGetESignatureSourceType                      │
│  ├── UBFormSettingInfo / UBFormSettingSaveToken      │
│  ├── UBFormSigFieldList                             │
│  ├── UBESignatureSignority[Get|Save]                │
│  ├── UBESignatureOneSpan[Get|Save]                  │
│  ├── UBEnvelopeInfo / UBEnvelopeSetErrorStatus      │
│  ├── UB[Signority|OneSpan]EnvelopeListOneClient     │
│  └── UB[Signority|OneSpan]EnvelopeSetStatus         │
└─────────────────────────────────────────────────────┘
```

---

## 2. DocuSign — Chi tiết (`VFDocSign/CVFDocSign.cs`)

### 2.1 Authentication

DocuSign sử dụng **OAuth 2.0 Authorization Code Grant**:

```
                                    ┌──────────────┐
                                    │  DocuSign     │
                                    │  OAuth Server │
                                    └──────┬───────┘
                                           │
  ┌────────────┐  1. AuthCodeRequest()     │  2. User grants consent
  │ PopupMisc  │ ──────────────────────────►│     (browser redirect)
  │ Setting    │                            │
  └────────────┘                            │
                                           │
  ┌────────────┐  3. Callback with code    │
  │ DocuSign   │ ◄─────────────────────────┤
  │ Code.aspx  │                            │
  └─────┬──────┘                            │
        │ 4. AuthTokenRequest()             │
        │    Exchange code → token          │
        │ 5. SaveCodeToken() → DB           │
        └───────────────────────────────────┘
```

**Bước 1 — Generate OAuth URL** (`AuthCodeRequest`):
```
https://{OAuthBasePath}/oauth/auth?
  response_type=code
  &scope=signature
  &client_id={IntegratorKey}
  &state=DOCUSIGN_{DSID}
  &redirect_uri={ReturnURL}
```

**Bước 2 — Callback** (`DocuSignCode.aspx.cs`):
- DocuSign redirect về `DocuSignCode.aspx?code=...&state=DOCUSIGN_{DSID}`
- Validate `state` chứa DSID
- Gọi `sigObj.AuthTokenRequest(DBIDStr, DSIDStr, 0, CodeStr)` để exchange code → token

**Bước 3 — Token Storage** (`SaveCodeToken` → SP `UBFormSettingSaveToken`):
- AccessToken, RefreshToken, TokenType, ExpiresIn, AccountID → lưu DB

**Bước 4 — Token Refresh** (`RefreshToken`):
- Sử dụng `grant_type=refresh_token` khi token hết hạn
- `CheckToken()` kiểm tra `m_iExpiry`: 0=invalid, 1=cần refresh, 2=còn valid

**Cấu hình lưu trong DB** (đọc qua SP `UBFormSettingInfo`):

| Field | Mô tả |
|---|---|
| `RestApiUrl` | `https://demo.docusign.net/restapi` (demo) hoặc production |
| `OAuthBasePath` | `account-d.docusign.com` (demo) hoặc `account.docusign.com` |
| `IntegratorKey` | Client ID từ DocuSign Admin Console |
| `APISecretKey` | Client Secret |
| `APIUserName` | API User GUID |
| `AccountID` | DocuSign Account ID |
| `AccessToken` | Bearer token hiện tại |
| `RefreshToken` | Token dùng để renew |
| `ReturnURL` | Callback URL (DocuSignCode.aspx) |
| `UserID` | DocuSign username (email) |
| `UserPassword` | DocuSign password |
| `PrivateKeyPath` | Path tới RSA private key (cho JWT flow) |

### 2.2 Envelope Lifecycle

**Tạo và gửi Envelope:**

```
PopupForms.OnEnvPendingSendBtn()
  │
  ├── Forms.GetEnvelopeDetailX()   ← SP lấy data (EnvInfo, DocList, RecipientList, SigPos, FormSetting)
  │
  ├── CVFDocSign sigObj = new CVFDocSign()
  ├── sigObj.SetAccountInfo(...)    ← Load credentials từ FormSetting
  │
  ├── sigObj.CreateEnvelop(ds, ref errorMsg, bNoChange4Signer, Lg, iAccessCodeOpt)
  │     │
  │     ├── GetEditors() → tạo List<Editor> (nếu có Editor role)
  │     ├── GetSigners() → tạo List<Signer> với tabs:
  │     │     ├── iType=1 → SignHere tab
  │     │     ├── iType=2 → InitialHere tab
  │     │     └── iType=3 → DateSigned tab
  │     │
  │     ├── Tạo Document[] từ tbDoc (PDF bytes → Base64)
  │     ├── Tạo EnvelopeDefinition (Status="sent")
  │     └── envelopesApi.CreateEnvelope() → trả về EnvelopeId
  │
  └── Forms.SaveEnvelope()  ← Lưu EnvelopeId vào DB
```

**DocuSign Envelope Statuses:**

| Code | Status | Mô tả |
|---|---|---|
| 0 | Created | Draft, chưa gửi |
| 1 | Sent | Đã gửi tới recipients |
| 2 | Delivered | Recipients đã mở và chấp nhận |
| 3 | Signed | Tất cả đã ký (transient) |
| 4 | Completed | Hoàn tất |
| 5 | Declined | Recipient từ chối |
| 6 | Voided | Sender hủy |
| 7 | Deleted | Đã xóa |

### 2.3 Signing Modes

| Mode | `iMode` | Mô tả |
|---|---|---|
| Normal | 0 | Gửi email cho từng signer riêng lẻ |
| Editor | 1 | Signer đầu tiên là Editor (có thể chỉnh sửa trước khi ký) |
| In-Person | 2 | Ký tại chỗ trên cùng thiết bị |

**Editor Mode** yêu cầu:
- User (Editor) phải tồn tại trên DocuSign account (`IsUserExist()`)
- Nếu chưa có → có thể tự động tạo qua `AddOneUser()` (tùy config)
- `CheckUserEditor()` kiểm tra và add user nếu cần

### 2.4 Signature Position (Tabs)

Vị trí ký được lưu trong DB, lấy qua SP `UBFormSigFieldList`:

```
Table: SigPos
├── iRecipientID  — ID người ký
├── iDocID        — Document ID
├── iPage         — Số trang
├── iPosX         — Tọa độ X
├── iPosY         — Tọa độ Y
└── iType         — Loại tab (1=Sign, 2=Initial, 3=Date)
```

### 2.5 Các operations khác

| Method | Mô tả |
|---|---|
| `VoidEnvelope()` | Hủy envelope (status → voided) |
| `RenotifyEnvelope()` | Gửi lại email cho recipients chưa ký |
| `RenotifyEnvelopeX()` | Gửi lại + cập nhật email/AccessCode mới |
| `GetEnvelopeStatus()` | Lấy trạng thái envelope hiện tại |
| `GetRecipientStatus()` | Lấy trạng thái từng recipient |
| `GetEnvDocObj()` | Download PDF đã ký (byte[]) |
| `IsDocSigned()` | Kiểm tra tất cả tabs đã ký chưa |
| `GetUserList()` | Liệt kê users trên DocuSign account |

---

## 3. Signority (`VFSignority/CSignority.cs`)

### Cấu hình (SP `UBESignatureSignorityGet`)

| Field | Mô tả |
|---|---|
| `RestApiUrl` | Signority REST API URL |
| `DocApiUrl` | Document API URL (riêng biệt) |
| `ApiUserID` | Username đăng nhập |
| `ApiUserPassword` | Password |

### Luồng gửi

```
PopupForms.OnEnvSignorityPendingSendBtn()
  → CSignority sigObj = new CSignority(DBIDStr, DSIDStr, iUserID, UserName, UserEmail)
  → sigObj.CreateEnvelop(ds, bNoChange4Signer, ref AccountID, ref errorMessage)
  → Forms.SaveEnvelope(...)
```

### Sync trạng thái

```csharp
// ComplianceDocView.cs
CSignority Signority = new CSignority(DBIDStr, DSIDStr, iUserID);
bSuccess = Signority.SyncEnvelope(iEnvelopeID, ref errorMessage, ref bEnvelopeChanged, Lg, true);
```

SPs liên quan:
- `UBSignorityEnvelopeListOneClient` — Danh sách envelopes theo client
- `UBSignorityEnvelopeSetStatus` — Cập nhật status
- `UBSignorityEnvelopeRecipientStatusUpdate` — Cập nhật recipient status
- `UBSetEnvelopeToSignority` — Đánh dấu envelope là Signority
- `UBEnvelopeListNonCompleteSignority` — Envelopes chưa hoàn tất (cho auto-sync)

---

## 4. OneSpan (`VFOneSpan/COneSpan.cs`)

### Cấu hình (SP `UBESignatureOneSpanGet`)

| Field | Mô tả |
|---|---|
| `RestApiUrl` | OneSpan API URL |
| `RestApiKey` | API Key |

### Luồng gửi

```
PopupForms.OnEnvOneSpanPendingSendBtn()
  → COneSpan sigObj = new COneSpan(DBIDStr, DSIDStr, iUserID, Lg)
  → sigObj.CreateEnvelop(iEnvelopeID, ref AccountID, ref errorMessage,
                         iRoutingOrderOpt, AltRepEmail, false, bNoChange4Signer)
  → Forms.SaveEnvelope(...)
```

SPs liên quan:
- `UBOneSpanEnvelopeListOneClient`
- `UBOneSpanEnvelopeSetStatus`
- `UBOneSpanEnvelopeRecipientStatusUpdate`

---

## 5. UI — Các trang sử dụng E-Signature

### 5.1 `PopupForms.aspx` — Gửi tài liệu cho Client ký

**Chức năng chính:** Quản lý envelope lifecycle cho từng client.

| Tab/Panel | Mô tả |
|---|---|
| Pending Envelopes | Danh sách envelopes chưa gửi (`cbFormEnvPendingList`) |
| Pending Doc List | Documents trong envelope đang chọn |
| Send Options | Chọn mode: Normal/Editor/In-Person, routing order |
| Sent Envelopes | Danh sách đã gửi, xem status |

**Luồng UI gửi envelope:**
```
1. User chọn Pending Envelope từ dropdown
2. Click "Send" → OnEnvPendingSend()
   → CheckRepEmail() → Kiểm tra Rep có nhiều email?
     → Nếu có → Popup chọn email (Joint Rep)
3. Hiển thị loading indicator (divDocuSignSend/divSignoritySend/divOneSpanSend)
4. Gọi OnEmail2Sign() / OnSignorityEmail2Sign() / OnOneSpanEmail2Sign()
   tùy theo provider type
5. Cập nhật danh sách
```

**Send options:**

| Control | Mô tả |
|---|---|
| `chEditorRole` | Bật Editor mode (chỉ DocuSign) |
| `chInPersonMode` | Bật In-Person signing |
| `chNoChange4Signer` | Không cho signer chỉnh sửa |
| `cbRoutingOrderOpt` | Thứ tự ký (0=client trước, 1=rep trước) |

### 5.2 `ComplianceDocView.aspx` — Quản lý E-Sign Documents

**Chức năng:** Xem, tìm kiếm, gửi, sync tất cả e-sign envelopes trong hệ thống.

| Feature | Mô tả |
|---|---|
| Search | Tìm theo tên, ngày, DealerCode, RepCode, status |
| Send | Gửi envelope chưa gửi (cùng logic 3 providers) |
| Sync | Đồng bộ status từ provider API (`EnvelopeRefresh`) |
| Export Excel | Xuất danh sách ra Excel |
| Attach to Client | Gắn tài liệu đã ký vào hồ sơ client |

**Sync logic (EnvelopeRefresh):**
```
Xác định provider type → switch:
├── DocuSign  → PopupForms.EnvelopeSyncDocusign()
├── Signority → CSignority.SyncEnvelope()
└── OneSpan   → COneSpan.SyncEnvelope() (tương tự)
```

### 5.3 `PopupMiscellaneousSetting.aspx` — Cài đặt API

**Chức năng:** Admin cấu hình thông tin kết nối cho từng provider.

**Panel theo provider** (hiển thị tùy `GetESignatureSourceType`):

| Provider | Panel | Fields |
|---|---|---|
| DocuSign | `idPanelFormSettingDlg` | RestApiUrl, IntegratorKey, OAuthBasePath, ReturnURL, UserID, Password, AccountID, AccessToken, RefreshToken, PrivateKeyPath, APIUserName, APISecretKey |
| Signority | `idPanelFormSettingSignorityDlg` | RestApiUrl, DocApiUrl, ApiUserID, ApiUserPassword |
| OneSpan | `idPanelFormSettingOneSpanDlg` | RestApiUrl, RestApiKey |

**Buttons đặc biệt (DocuSign):**
- **Get Token** (`OnFormSettingGetToken`) → Generate OAuth URL → User copy URL vào browser → Consent → Callback
- **Refresh Token** (`OnFormSettingGetTokenRefresh`) → Gọi `RefreshToken()` khi token hết hạn
- **Access Token Refresh** (`OnFormSettingAccessTokenRefresh`) → Reload settings từ DB

### 5.4 `PopupMemberAdd.aspx` — Kiểm tra User DocuSign

Khi thêm/sửa member (advisor), kiểm tra email tồn tại trên DocuSign account:
```csharp
CVFDocSign.CheckUserEditor(DBIDStr, DSIDStr, UserID,
    email, firstName, lastName, password, accessCode, bAdd);
```
- `bAdd=true`: Tự động tạo user trên DocuSign nếu chưa tồn tại

### 5.5 `Default.aspx` — Token Check on Login

Khi user login, hệ thống kiểm tra DocuSign token:
```csharp
CVFDocSign sigObj = new CVFDocSign();
// Check and refresh token if needed
```

---

## 6. Database Schema (Key SPs)

### Provider Configuration

| SP | Chức năng |
|---|---|
| `UBGetESignatureSourceType` | Xác định provider cho user |
| `UBFormSettingInfo` | Lấy DocuSign config (FormSetting table) |
| `UBFormSettingSaveToken` | Lưu access/refresh token DocuSign |
| `UBESignatureSignorityGet` | Lấy Signority config |
| `UBESignatureSignoritySave` | Lưu Signority config |
| `UBESignatureOneSpanGet` | Lấy OneSpan config |
| `UBESignatureOneSpanSave` | Lưu OneSpan config |

### Envelope Management

| SP | Chức năng |
|---|---|
| `UBFormSigFieldList` | Lấy vị trí ký (tabs) cho form |
| `UBEnvelopeInfo` | Chi tiết envelope + pending recipients |
| `UBEnvelopeSetErrorStatus` | Đánh dấu envelope lỗi |
| `UBEnvelopeSetUpdateFlag` | Đánh dấu đã check (bNoAuto) |
| `UBRecipientESignatureIDUpdate` | Lưu e-signature ID cho recipient |

### Provider-specific Envelope

| SP Pattern | DocuSign | Signority | OneSpan |
|---|---|---|---|
| Envelope List | `Forms.GetClientEnvelopeList` | `UBSignorityEnvelopeListOneClient` | `UBOneSpanEnvelopeListOneClient` |
| Set Status | (via DocuSign API) | `UBSignorityEnvelopeSetStatus` | `UBOneSpanEnvelopeSetStatus` |
| Recipient Status | (via DocuSign API) | `UBSignorityEnvelopeRecipientStatusUpdate` | `UBOneSpanEnvelopeRecipientStatusUpdate` |
| Non-complete List | (via DocuSign API) | `UBEnvelopeListNonCompleteSignority` | (tương tự) |

---

## 7. Key Files Reference

| File | Size | Vai trò |
|---|---|---|
| `VFDocSign/CVFDocSign.cs` | 109KB | DocuSign SDK wrapper — auth, envelope, user mgmt |
| `VFSignority/CSignority.cs` | 54KB | Signority REST API wrapper |
| `VFOneSpan/COneSpan.cs` | 35KB | OneSpan REST API wrapper |
| `UBClasses/ESignature.cs` | 27KB | BLL — provider routing, status updates, settings |
| `UBClasses/Forms.cs` | — | BLL — envelope CRUD, doc management |
| `UBClasses/CPlanDoc.cs` | — | BLL — e-sign doc queries, Excel export |
| `WebApp/Main/PopupForms.aspx.cs` | 103KB | UI — envelope send/receive cho client |
| `WebApp/Main/ComplianceDocView.aspx.cs` | 198KB | UI — quản lý e-sign docs (search, sync, attach) |
| `WebApp/Main/PopupMiscellaneousSetting.aspx.cs` | 143KB | UI — cài đặt API credentials |
| `WebApp/Main/PopupMemberAdd.aspx.cs` | — | UI — check/add DocuSign user |
| `WebApp/DocuSignCode.aspx.cs` | 2KB | OAuth callback page |
| `WebApp/Main/DocuSignTest.aspx.cs` | — | Test page |
| `VFDocSign/Example1-4.cs` | 12-91KB | DocuSign SDK examples (reference) |

### Dependencies (DLLs trong VFDocSign/)

| DLL | Mô tả |
|---|---|
| `DocuSign.eSign.dll` | DocuSign eSignature .NET SDK (5.3MB) |
| `RestSharp.dll` | HTTP client (191KB) |
| `Newtonsoft.Json.dll` | JSON serialization (663KB) |
| `BouncyCastle.Crypto.dll` | Crypto cho JWT auth (2.6MB) |
| `System.IdentityModel.Tokens.Jwt.dll` | JWT token handling |

---

## 8. Common Error Codes

Errors được xử lý trong `CreateEnvelop()`:

| Error | Mô tả | Nguyên nhân |
|---|---|---|
| `ENVELOPE_HAS_DUPLICATE_RECIPIENTS` | Trùng email recipients | 2 signers cùng email |
| `CANNOT_ASSIGN_TAB_TO_MANAGERROLE` | Tabs trên Editor role | Editor không được có signature tabs |
| `USER_AUTHENTICATION_FAILED` | Auth failed | Token hết hạn hoặc sai credentials |
| `PARTNER_AUTHENTICATION_FAILED` | IntegratorKey invalid | Key bị disable hoặc sai |
| `TAB_OUT_OF_BOUNDS` | Tab ngoài trang | Tọa độ ký vượt kích thước PDF |
| `ENVELOPE_DOES_NOT_EXIST` | Envelope không tồn tại | Đã bị xóa trên DocuSign |

---

## 9. Lưu ý cho Developer

1. **Token Expiry**: DocuSign access token hết hạn sau ~8 giờ. `CheckToken()` trên login sẽ auto-refresh. Nếu gặp `USER_AUTHENTICATION_FAILED`, vào Settings → Refresh Token.

2. **Demo vs Production**: Thay đổi `OAuthBasePath`:
   - Demo: `account-d.docusign.com` + `https://demo.docusign.net/restapi`
   - Prod: `account.docusign.com` + `https://na2.docusign.net/restapi` (hoặc region khác)

3. **Multi-provider**: Code UI (PopupForms, ComplianceDocView) chứa 3 bộ methods gần giống nhau cho 3 providers. Khi sửa logic, phải sửa cả 3.

4. **Editor Role**: Chỉ hỗ trợ DocuSign. Editor phải là DocuSign account member (`CheckUserEditor`). Signority/OneSpan không có Editor mode.

5. **Routing Order**: `iRoutingOrderOpt=0` → Client ký trước, Rep sau. `iRoutingOrderOpt>0` → Rep trước.

6. **Access Code**: Optional security — mỗi signer có thể được yêu cầu nhập access code trước khi ký (`iSecureCodeOpt` trong DocuSign, `AccessCode` field trong recipient).
