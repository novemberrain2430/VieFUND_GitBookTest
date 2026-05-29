# Signority E-Signature Integration

> Tài liệu kỹ thuật chi tiết cho module tích hợp Signority — Canadian e-signature provider. Signority sử dụng **HTTP Basic Auth** (username/password) thay vì OAuth, giao tiếp qua REST API v1/v2.

---

## 1. Tổng quan

### So sánh với DocuSign

| Đặc điểm | DocuSign | Signority |
|---|---|---|
| **Authentication** | OAuth 2.0 (Authorization Code + Refresh Token) | HTTP Basic Auth (username:password) |
| **SDK** | Official .NET SDK (`DocuSign.eSign.dll`) | Custom REST client (`VFSignority.Classes.Signority`) |
| **Thuật ngữ** | Envelope → Recipients → Tabs | Document → Invitations → Tags |
| **Status codes** | String (`"sent"`, `"completed"`) | Integer (`52`, `53`) |
| **Document download** | Per-document via API | ZIP archive chứa tất cả files |
| **In-Person signing** | Embedded signing URL | Hosted Signer model |
| **Editor role** | Recipient type = Editor | Invitation type = Editor (23) |

### Kiến trúc Project

```
VFSignority/
├── CSignority.cs              ← Business logic chính (1268 lines, 54KB)
├── Classes/
│   ├── Signority.cs           ← REST API client wrapper (464 lines)
│   └── Exceptions.cs          ← Custom exception classes
├── Model/
│   ├── Code.cs                ← Constants (status codes, tag types, invitation types)
│   ├── Document.cs            ← Documents, file, page models
│   ├── Invitaion.cs           ← Invitation (signer) model
│   ├── Tag.cs                 ← Signature/Initial/Date tag positioning
│   ├── Authentications.cs     ← 2FA auth + HostedSigner models
│   ├── DocumentSetting.cs     ← Expiry, language settings
│   ├── DocumentCancel.cs      ← Cancellation request model
│   ├── DocumentDetails.cs     ← AccountID + SignorityEnvelopeID
│   ├── InvitaionUpdate.cs     ← Email update for re-notification
│   ├── DocumentAnchorTag.cs   ← Anchor-based tag positioning
│   ├── DocumentWithoutSignerTag.cs ← Document without signer tags
│   ├── JsonResultDocument.cs  ← Single document API response
│   ├── JsonResultDocumentList.cs ← List documents API response
│   ├── JsonResultTags.cs      ← Tags API response
│   ├── Client.cs              ← User account info
│   ├── File.cs                ← File model (name, body, pages)
│   ├── Error.cs               ← Error response model
│   └── Warning.cs             ← Warning response model
└── packages/                  ← NuGet: RestSharp, Newtonsoft.Json
```

---

## 2. Authentication

Signority sử dụng **HTTP Basic Authentication**. Không cần OAuth flow.

### Cấu hình

Cài đặt lưu trong DB, đọc qua SP `UBESignatureSignorityGet`:

| Field | Mô tả | Ví dụ |
|---|---|---|
| `RestApiUrl` | Base URL cho REST API | `https://sign.signority.com/api/` |
| `DocApiUrl` | URL template download documents | `https://sign.signority.com/api/v1/documents/{Envelope.document.id}/download?content=archive` |
| `ApiUserID` | Username (email) | `user@company.com` |
| `ApiUserPassword` | Password | `********` |

### Connection Flow

```csharp
// CSignority.cs → GetClient()
DataSet ds = CeSignature.GetSettingsSignority(m_DBIDStr, ref errorMessage, ref errorCode);
// Đọc từ table "Signority"
var baseUrl  = dr["RestApiUrl"].ToString();
var username = dr["ApiUserID"].ToString();
var password = dr["ApiUserPassword"].ToString();

client = new Signority(username, password);  // HTTP Basic Auth
client.baseUrl = baseUrl;
```

### Validate Connection

```csharp
if (client.GetAccount().id == null)
{
    errorMessage = "One or both of Username and Password are invalid";
    // Lưu ý: Account bị lock sau nhiều lần login sai (đợi 20 phút)
}
```

> ⚠️ **Account Lockout**: Signority lock account sau nhiều lần login thất bại. Phải đợi 20 phút trước khi thử lại.

---

## 3. Status Codes

### Document (Envelope) Status

| Code | Constant | Mô tả |
|---|---|---|
| 51 | `SIGNING_STATUS_DRAFT` | Bản nháp |
| 52 | `SIGNING_STATUS_IN_PROGRESS` | Đang trong quá trình ký |
| 53 | `SIGNING_STATUS_COMPLETED` | Hoàn tất |
| 54 | `SIGNING_STATUS_REJECTED` | Bị từ chối |
| 55 | `SIGNING_STATUS_REACH_DEADLINE` | Hết hạn |
| 56 | `SIGNING_STATUS_SIGNING_CANCELED` | Đã hủy |

### Recipient (Invitation) Status

| Code | Constant | Mô tả |
|---|---|---|
| 60 | `RECIPIENT_STATUS_NOT_SENT` | Chưa gửi |
| 61 | `RECIPIENT_STATUS_WAIT_TO_OPEN` | Đã gửi, chờ mở |
| 62 | `RECIPIENT_STATUS_REACH_DEADLINE` | Hết hạn |
| 63 | `RECIPIENT_STATUS_WORK_IN_PROGRESS` | Đang xem/ký |
| 64 | `RECIPIENT_STATUS_VIEWED` | Đã xem |
| 65 | `RECIPIENT_STATUS_RECIPIENT_REJECTED` | Từ chối |
| 67 | `RECIPIENT_STATUS_FINALIZED` | Đã hoàn tất ký |
| 68 | `RECIPIENT_STATUS_CANCELED` | Đã bị hủy |

### Invitation (Recipient) Types

| Code | Constant | Mô tả |
|---|---|---|
| 15 | `INVITATION_TYPE_SIGNER` | Người ký |
| 16 | `INVITATION_TYPE_VIEWER` | Chỉ xem |
| 17 | `INVITATION_TYPE_REVIEWER` | Review |
| 18 | `INVITATION_TYPE_SIGNING_HOST` | Host cho In-Person signing |
| 21 | `INVITATION_TYPE_OPEN_SIGNER` | Open signer |
| 23 | `INVITATION_TYPE_EDITOR` | Editor (chỉnh sửa trước khi ký) |

### Tag Types

| Code | Constant | Internal Code | Mô tả |
|---|---|---|---|
| `sign` | `TAG_SIGN` | 250 | Chữ ký |
| `init` | `TAG_INIT` | 251 | Ký tắt (initials) |
| `date` | `TAG_DATE` | 270 | Ngày ký (auto-fill) |
| `text` | `TAG_TEXT` | 252 | Text field |
| `checkbox` | `TAG_CHECKBOX` | 253 | Checkbox |
| `radio` | `TAG_RADIO` | 254 | Radio button |

---

## 4. Envelope Lifecycle

### 4.1 Tạo và Gửi (`CreateEnvelop`)

```
ComplianceDocView.OnSignorityEmail2Sign()
  │
  ├── Forms.GetEnvelopeDetailX()
  │     → SP trả về: EnvInfo, DocList, RecipientList, SigPos, FormSetting
  │
  ├── CSignority sigObj = new CSignority(DBIDStr, DSIDStr, iUserID, UserName, UserEmail)
  │
  └── sigObj.CreateEnvelop(ds, bNoChange4Signer, IDType, ref AccountID, ref errorMessage)
        │
        ├── 1. Validate: GetClient() → GetAccount() → Kiểm tra auth
        │
        ├── 2. Validate: Kiểm tra 2FA (phone required nếu b2FA=1)
        │
        ├── 3. Prepare Documents:
        │     └── Đọc tbDoc → tạo List<File> (name, body=bytes, index=iDocID)
        │     └── CountPages() → PdfBuilder.GetNumberOfPages() cho mỗi file
        │
        ├── 4. Build Document object:
        │     ├── doc.title = emailSubject
        │     ├── doc.senderName / senderEmail (per-dealer config)
        │     ├── doc.documentType = 5 (DOCUMENT)
        │     ├── doc.signingStatus = 52 (IN_PROGRESS)
        │     ├── doc.addTagsOfPDF = !bNoChange4Signer
        │     └── CreateDocumentSettings(doc, Lg)
        │           └── expireDaysAfterSent = 3650 (~10 years)
        │           └── languageCode = 550 (EN) or 551 (FR)
        │
        ├── 5. Create Signers:
        │     ├── If bInPerson → CreateSigners_Hosted()
        │     └── Else → CreateSigners()
        │
        ├── 6. Send: client.sendDocument(doc, Files)
        │
        ├── 7. Post-send:
        │     ├── CeSignature.SetEnvelopeToSignority(m_DBIDStr, iEnvelopeID)
        │     ├── UpdateSigners() → Save Signority invitation IDs to DB
        │     └── Return doc_new.document.id (Signority document ID)
        │
        └── 8. Caller saves: Forms.SaveEnvelope(DBIDStr, DSIDStr, iUserID, iEnvelopeID, envId, AccountID)
```

### 4.2 Sender Configuration

Mỗi dealer (DSID) có sender name/email riêng:

```csharp
// SetDefSender() — hardcoded per-dealer
DSID "1256" → "Equity Associates Inc." / "complianceteam@equityassociates.ca"
DSID "2301" → "Global Maxfin Investments Inc." / "esign@gmii.ca"  
DSID "1001" → "VieFUND" / "support@viefund.com"
Default     → "VieFUND" / "support@viefund.com"
```

### 4.3 Tạo Signers — Normal Mode (`CreateSigners`)

Mỗi recipient trong `RecipientList` → tạo 1 `Invitation`:

```csharp
var invitation = new Invitation();
invitation.id = RecipientID;
invitation.setSigner(RecipientName, RecipientEmail, iRecipientRoutingOrder, bEditorRecipient, bInPersonSigner);

// 2FA (nếu b2FA=1 và có phone)
if (AuthOpt == AuthenticationOptions.SMS && phone != "")
{
    authentication.type = 132;  // SMS
    authentication.phone = RecipientCellPhone;
    authentication.phoneCountryCode = CountryCode;
}
```

Signature positions (Tags) được tạo từ `SigPos` table:

```csharp
// Mỗi position row → 1 Tag
iType == 1 → tag.setTag("sign", "Sign Here", pageIndex, invitationIndex, x, y, w, h, true)
iType == 2 → tag.setTag("init", "Initial Here", ...)
iType == 3 → tag.setTag("date", "Date Here", ...)
```

**Multi-file page calculation**: Signority nhận tất cả files thành 1 document liên tục. `GetPageNumberOfCombinedFile()` tính offset trang cho mỗi file để đặt tags đúng vị trí.

### 4.4 Tạo Signers — In-Person/Hosted Mode (`CreateSigners_Hosted`)

Khi `bInPerson = true`:
- **Chỉ tạo 1 Invitation** cho signer đầu tiên (routing order thấp nhất) với type = `SIGNING_HOST` (18)
- Các signers còn lại → `HostedSigner` objects gắn vào invitation đầu
- HostedSigner hỗ trợ photo ID authentication (`photoIdAuthentication = true`)
- Tags vẫn tạo cho tất cả signers, nhưng reference qua `hostedSignerIndex`

```csharp
// Signer đầu tiên = Host
invitation.actionType = INVITATION_TYPE_SIGNING_HOST;  // 18
invitation.hostedSigners = new List<HostedSigner>();

// Signers còn lại = Hosted
for (i = 1; i < tbRec.Rows.Count; i++)
{
    HostedSigner hosted = new HostedSigner();
    hosted.name = recipientName;
    hosted.email = recipientEmail;
    hosted.photoIdAuthentication = true;
    hosted.identificationType = iDType;  // e.g. "passport", "driver_license"
    invitation.hostedSigners.Add(hosted);
}
```

### 4.5 Y-Position Offset Logic

Signority có hệ tọa độ khác DocuSign. Constants offset:

```csharp
const int m_PositionYOffsetSignature = 8;   // Signature
const int m_PositionYOffsetDate = -2;       // Date
const int m_PositionYOffsetInitials = 15;   // Initials

const int m_DefHeight_Sig = 30;   // Default height cho Sign/Initial
const int m_DefWidth_Sig = 107;   // Default width
const int m_DefHeight_Other = 18; // Default height cho Date/Text
const int m_DefWidth_Other = 107; // Default width
```

Nếu height được chỉ định trong DB:
```
YPosition += h - (iHeight / 2) + (h / 2) + 6
```
Nếu không (height=0): sử dụng offset constants.

---

## 5. Sync (Đồng bộ trạng thái)

### 5.1 Sync 1 Envelope (`SyncEnvelope`)

```
ComplianceDocView.EnvelopeRefresh()
  → CSignority.SyncEnvelope(iEnvelopeID, ref errorMessage, ref bChanged, Lg, bAlwaysDownLoad)

Flow:
  1. GetClient() → Validate auth
  2. CeSignature.GetEnvelopeDetail() → Lấy data VieFUND (EnvInfo, RecipientList)
  3. GetDocumentDetails() → Lấy Signority document ID
  4. client.GetOneDocument(iSignorityEnvelopeID) → Lấy status từ Signority API
  5. CeSignature.SaveSignorityEnvelopeStatus() → Update envelope status trong DB
  6. UpdateRecipientsStatus() → Update từng recipient status
  7. Nếu status changed hoặc bAlwaysDownLoad:
     → DownloadDocuments() → SaveDocuments()
```

### 5.2 Sync Batch (`UpdateEnvelopes`)

Chạy batch cho tất cả envelopes chưa hoàn tất:

```csharp
public bool UpdateEnvelopes()
{
    DataSet ds = CeSignature.GetSignorityEnvelopeList(m_DBIDStr);
    // SP: UBEnvelopeListNonCompleteSignority
    // Lấy tất cả envelopes chưa complete

    Signority client = GetClient();
    for (int i = 0; i < ds.Tables["List"].Rows.Count; i++)
    {
        int iEnvID = dr["ID"];
        SyncEnvelope(iEnvID, ref errorMessage, ref bChanged, Lg);
    }
}
```

### 5.3 Download Documents

Chỉ download khi envelope **Completed** (status=53):

```csharp
// URL pattern:
// https://sign.signority.com/api/v1/documents/{docId}/download?content=archive
// Sandbox: https://sandbox.signority.com/api/v1/documents/{docId}/download?content=archive

// Response = ZIP archive chứa PDF files
// → Extract mỗi file → Match với DB records theo filename
// → CDocumentObj.UpdateDocFileObj() → Lưu signed PDF vào DB
```

### 5.4 Update Recipient Status

```csharp
foreach (recipient in tbRec)
{
    // Match VieFUND recipient với Signority invitation qua ESignatureID
    var Invitation = Envelope.document.invitations.FirstOrDefault(x => x.id == iESignatureID);
    string StatusStr = Invitation.status.Value.ToString();
    CeSignature.SignorityRecipientStatusUpdate(DBIDStr, DBIDStr, iUserID, iRecipientID, StatusStr, bInPerson);
}
```

---

## 6. Operations

### 6.1 Void/Cancel Envelope (`VoidEnvelope`)

```csharp
// Chỉ cancel được khi status = IN_PROGRESS (52)
DocumentCancel EnvelopeToCancel = new DocumentCancel();
EnvelopeToCancel.document.signingStatus = SIGNING_STATUS_SIGNING_CANCELED;  // 56
EnvelopeToCancel.document.reason = ReasonStr;
client.cancelDocument(iCancelEnvelopeID, EnvelopeToCancel);
```

### 6.2 Resend Notifications (`RenotifyEnvelope`)

```
1. Validate: Chỉ cho phép nếu envelope đã gửi (không phải draft/completed/voided)
2. Validate: Chỉ creator, sender, hoặc admin mới được resend
3. Update emails nếu thay đổi:
   → client.updateInvitaionEmails() (PUT /documents/{id}/invitations)
4. Resend:
   → client.ResendEmailNotifications()
   → POST /documents/{id}/resend/{invitation.GUID} cho mỗi invitation
```

---

## 7. REST API Endpoints

Tất cả endpoints sử dụng base URL: `{RestApiUrl}` (mặc định `https://sign.signority.com/api/`)

| Method | Endpoint | Version | Mô tả |
|---|---|---|---|
| GET | `user` | v1 | Lấy account info (validate auth) |
| POST | `documents` | v1 | Tạo + gửi document (multipart: JSON + PDF files) |
| GET | `documents/{id}` | v1 | Lấy chi tiết 1 document |
| PUT | `documents/{id}` | v1 | Update document (cancel, modify) |
| PUT | `documents/{id}/invitations` | v1 | Update invitation emails |
| POST | `documents/{id}/resend/{GUID}` | v1 | Resend email notification |
| GET | `documents/{id}/download?content=archive` | v1 | Download signed PDFs (ZIP) |
| PUT | `documents/{id}/tags` | v1 | Update tags |
| POST | `documents/{id}/files.html` | v1 | Upload additional files |
| GET | `documents/search2` | v2 | Search documents (paginated) |

### Send Document Request Format

```
POST /api/v1/documents
Content-Type: multipart/form-data

Parts:
  - "document" (string): JSON payload
  - "files[]" (file): PDF files (appended ".pdf")
```

JSON payload (simplified):
```json
{
  "title": "Envelope Subject",
  "senderName": "VieFUND",
  "senderEmail": "support@viefund.com",
  "documentType": 5,
  "signingStatus": 52,
  "addTagsOfPDF": true,
  "documentSetting": {
    "expireDaysAfterSent": 3650,
    "languageCode": 550
  },
  "invitations": [
    {
      "id": -1,
      "recipientName": "John Doe",
      "recipientEmail": "john@example.com",
      "actionType": 15,
      "sequence": 1,
      "status": 60,
      "authentications": [
        { "type": 132, "phone": "4165551234", "phoneCountryCode": "1" }
      ]
    }
  ],
  "tags": [
    {
      "name": "Sign Here",
      "type": 250,
      "pageIndex": 1,
      "invitationIndex": 1,
      "left": 100,
      "top": 500,
      "width": 107,
      "height": 34,
      "isMandatory": true
    }
  ]
}
```

---

## 8. 2FA (Two-Factor Authentication)

Signority hỗ trợ 2 loại 2FA:

| Option | Code | Mô tả |
|---|---|---|
| None | 0 | Không xác thực |
| SMS | 1 (→ `RECIPIENT_AUTHENTICATION_SMS = 132`) | OTP qua SMS |
| Email | 2 (→ `RECIPIENT_AUTHENTICATION_EMAIL = 131`) | OTP qua Email |

**Cấu hình per-recipient**: Field `b2FA` trong `RecipientList` table.

```csharp
// Nếu 2FA=SMS mà không có phone → reject envelope
if (ieSign2FAOpt == 1 && string.IsNullOrEmpty(RecipientCellPhone))
{
    errorMessage = "Phone missing while 2FA enabled for recipient: ...";
    return "0";
}
```

Phone number format: `PhoneNumberSplit4CountryCode()` tách country code (mặc định "1" = Canada/US).

---

## 9. Database (SPs liên quan)

### Configuration

| SP | Mô tả |
|---|---|
| `UBESignatureSignorityGet` | Lấy cài đặt Signority (RestApiUrl, DocApiUrl, username, password) |
| `UBESignatureSignoritySave` | Lưu cài đặt Signority |

### Envelope Management

| SP | Mô tả |
|---|---|
| `UBSetEnvelopeToSignority` | Đánh dấu envelope là Signority type |
| `UBSignorityEnvelopeSetStatus` | Update envelope status |
| `UBSignorityEnvelopeRecipientStatusUpdate` | Update recipient status |
| `UBSignorityEnvelopeListOneClient` | Danh sách envelopes theo client |
| `UBEnvelopeListNonCompleteSignority` | Envelopes chưa hoàn tất (cho batch sync) |
| `UBRecipientESignatureIDUpdate` | Lưu Signority invitation ID cho recipient |
| `UBEnvelopeSetErrorStatus` | Đánh dấu envelope lỗi (khi download fail) |

---

## 10. Error Handling

### Exception Hierarchy

```
ErrorException (base)
├── BadRequestException        (400)
├── UnauthorizedException      (401)
├── PaymentRequiredException   (402)
├── ForbiddenException         (403)
├── NotFoundException          (404)
├── MethodNotAllowedException  (405)
├── ConflictException          (409)
├── GoneException              (410)
├── UnknownException           (500)
├── ServiceUnavailableException (503)
└── ExceededRateLimitException
```

### Common Error Scenarios

| Scenario | Xử lý |
|---|---|
| Auth failed | "One or both of Username and Password are invalid. Account locked..." |
| Envelope not found | "The envelope specified either does not exist or you have no rights" |
| Envelope not IN_PROGRESS | `VoidEnvelope()` returns false |
| Download failed (file not found) | `SetEnvelopeError()` → đánh dấu lỗi trong DB |
| 2FA phone missing | Reject trước khi gửi |

---

## 11. Key Differences vs DocuSign

| Aspect | DocuSign | Signority |
|---|---|---|
| **Token management** | Access/Refresh token, auto-refresh | Stateless — mỗi request gửi credentials |
| **File upload** | Base64 trong JSON | Multipart form-data (binary files) |
| **Page numbering** | Per-document | Combined file (tất cả files = 1 document) |
| **Download signed docs** | Per-document API | ZIP archive chứa tất cả |
| **Status check** | `envelopesApi.GetEnvelope()` | `client.GetOneDocument()` |
| **Void** | Update envelope status = "voided" | PUT với `signingStatus = 56` |
| **Resend** | `UpdateRecipients` with `resendEnvelope=true` | `POST /documents/{id}/resend/{GUID}` per invitation |
| **Expiry** | Token-based (8h) | Session-based (no token expiry) |
| **Account lockout** | Rate limiting | Login lockout (20 min wait) |

---

## 12. Lưu ý cho Developer

1. **Sandbox vs Production**: 
   - Prod: `https://sign.signority.com/api/`
   - Sandbox: `https://sandbox.signority.com/api/`
   - `SetAsTest()` switches download URL to sandbox

2. **Sender Email Hardcoded**: `SetDefSender()` có hardcoded sender info per-DSID. Khi thêm dealer mới, cần update method này hoặc truyền SenderName/SenderEmail vào constructor.

3. **Page Offset**: `CountPages()` dùng `PdfBuilder.GetNumberOfPages()` (từ `VieFUNDPdf` library) để đếm trang. Nếu PDF corrupt → page count sai → tags đặt sai vị trí.

4. **ZIP Download**: Signority chỉ cho download khi envelope `COMPLETED` (53). Download trả về ZIP archive, filename = `{original_name}.pdf`.

5. **File Name Matching**: `GetOneFile()` match file theo tên (case-insensitive, thêm ".pdf"). Nếu filename thay đổi trên Signority → `SetEnvelopeError()`.

6. **In-Person**: Khi chỉ có 1 signer, fallback về Normal mode (`CreateSigners` thay vì `CreateSigners_Hosted`).

7. **Concurrent Access**: Không có retry/backoff logic. Nếu API timeout hoặc rate limit, lỗi sẽ bubble up as exception.
