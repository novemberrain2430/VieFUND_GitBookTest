# Security — Module Guide

> Bản đồ bảo mật của VieFUND WebApp: authentication, session, authorization, tenant isolation, upload/download, mã hóa, HTTP/TLS và audit.
> **Phạm vi**: mô tả trạng thái source trong workspace ngày 2026-09-04; không đồng nghĩa các finding đã được khắc phục trên môi trường chạy thật.

---

## 1. Kết luận nhanh

Hệ thống có cơ chế đăng nhập, session/GUID validation, role/access flags, stored procedure filtering và mã hóa legacy. Tuy nhiên các lớp bảo vệ không đồng đều giữa các page và phần remediation của security audit hiện mới nằm trong tài liệu đề xuất.

Các điểm đã xác minh trực tiếp từ source:

- `CBase.IsPageValid()` kiểm tra session, GUID và trạng thái session trong DB; **không tự kiểm tra role của page**.
- Role/access được `CMember.SessionLoginX()` lấy từ `UBMemberLogin` rồi lưu vào Session.
- Nhiều page chỉ ẩn/disable control dựa trên `TMPUserAdmin`; cách này không phải server-side authorization đầy đủ.
- Không tìm thấy `SecureBasePage`, `AdminPageGuardModule` hoặc `FileUploadValidator` trong source hiện tại.
- `FundSetup.FFProcessUpload()` nhận filename, content length và browser MIME type rồi lưu stream; chưa whitelist extension/magic bytes.
- `Web.config` mới cấu hình `X-Frame-Options: SAMEORIGIN`; các header đề xuất khác chưa xuất hiện.
- Trong 477 page endpoint dưới `WebApp/Main`, 276 page đặt `validateRequest="false"`; request validation bị tắt ở phạm vi rộng và phải được bù bằng validation/sanitization theo field cùng output encoding.
- `CEncryption8` là thuật toán DES tùy chỉnh/reversible encryption, không phải password hashing hiện đại.
- TLS version/cipher là cấu hình IIS/load balancer; không thể kết luận đã sửa chỉ từ repository.

Do đó trạng thái của deliverable tài liệu là **hoàn thành**, còn trạng thái remediation bảo mật vẫn phải theo dõi riêng.

---

## 2. Mô hình phòng thủ hiện tại

```text
Browser
  │
  ├─ HTTPS / IIS / headers                 ← một phần nằm ngoài repository
  │
  ├─ Default.aspx + CMember.SessionLoginX  ← xác thực, 2FA, SSO
  │
  ├─ ASP.NET Session + TMPGUID             ← nhận diện phiên đăng nhập
  │
  ├─ CBase.IsPageValid                     ← session/GUID/DB-expiry guard
  │
  ├─ role/access flags trên từng page      ← authorization phân tán
  │
  ├─ CDatabase + stored procedures         ← DSID/user filtering
  │
  └─ upload/download/report endpoints      ← vùng input/output rủi ro cao
```

Không có một policy engine tập trung bao phủ toàn bộ Web Forms. Khi review một chức năng, phải kiểm tra đủ cả page load, từng postback handler, BLL call và stored procedure.

---

## 3. Authentication và session

Tài liệu chi tiết nằm tại [Authentication & Authorization](../../viefund-framework/auth.md). Phần dưới chỉ tóm tắt các điểm cần nhớ khi review security.

### 3.1. Login

```text
Default.aspx.cs
  → CMember.SessionLoginX()
  → CEncryption8.GetEncPW()
  → UBMemberLogin
  → đọc identity/role/access/feature flags
  → lưu Session
  → redirect vào WebApp/Main
```

Ngoài username/password, login flow còn có 2FA và hai cơ chế SSO legacy. Quyết định cuối cùng nằm trong stored procedure `UBMemberLogin`, không chỉ trong `Default.aspx.cs`.

### 3.2. Session namespace

Các key của user thường được prefix bằng `iLoginID` thông qua `CFunctions.SetSessionValue()`/`GetSessionValue()`. Những key quan trọng:

| Nhóm | Session key tiêu biểu |
|---|---|
| Connection/tenant | `TMPDBID`, `TMPDSID`, `TMPDSIDSub` |
| Identity | `TMPiMemberID`, `TMPLoginID`, `TMPUserName` |
| Session guard | `TMPGUID`, `TMPREFERRER` |
| Role | `TMPUserAdmin`, `TMPUserManager`, `TMPUserRep`, `TMPUserAssistant`, `TMPUserDealer`, `TMPUserCompOfficer` |
| Access | `TMPiAccessClient`, `TMPiAccessPlan`, `TMPiAccessAccount`, `TMPReadOnly`, `TMPDataEntryOnly`, `TMPMask` |
| Action permission | `TMPbCanAddTrx`, `TMPiManualTrx`, `TMPProcessCommission`, `TMPModifyAttachment`, `TMPbSetupUser` |

Không đọc `Session["TMPUserAdmin"]` trực tiếp trong code mới; phải dùng helper để lấy đúng namespace login.

### 3.3. `IsPageValid()` thực sự kiểm tra gì

`UBStatic.CFunctions.IsPageValid()` kiểm tra session và so sánh hidden `hdGUID` với `TMPGUID`. Wrapper `UBClasses.CBase.IsPageValid(..., bCheckDB)` có thể gọi thêm `UBSessionExpired` để xác minh phiên trong DB.

Hàm này giúp chống stale/invalid postback và session hết hạn, nhưng không biết page nào là AdminOnly hay action nào là write. Vì vậy:

```csharp
if (!CBase.IsPageValid(...)) return;
```

không thể thay cho:

```csharp
if (!CMember.IsAdmin(this, Lg, true)) return;
```

hoặc một policy authorization tương đương ở phía server.

---

## 4. Authorization

### 4.1. Ba lớp cần phân biệt

| Lớp | Câu hỏi | Cơ chế hiện có |
|---|---|---|
| Page access | User có được mở page không? | Menu visibility và check phân tán trong page |
| Action access | User có được Add/Edit/Delete/Approve không? | Role/access flag, enable/visible control, đôi khi helper trong handler |
| Data scope | User được thấy/sửa record nào? | UserID/DSID/rep access truyền xuống SP |

Ẩn menu chỉ là UX. Disable button chỉ là presentation. Quyền thật phải được kiểm tra server-side trước mutation và tiếp tục được giới hạn trong SP.

### 4.2. Role không phải permission

`TMPUserAdmin` hoặc `TMPUserRep` trả lời user thuộc nhóm nào. Các flag như `TMPiAccessClient`, `TMPbCanAddTrx`, `TMPModifyAttachment` mới gần với permission thao tác. Không nên thay một permission cụ thể bằng điều kiện “admin hoặc không admin” nếu nghiệp vụ đã có flag riêng.

### 4.3. Broken access control đã được audit

Red Sentry xác định advisor có thể force-browse các page quản trị như:

- `FundSetup.aspx`
- `OnBoardView.aspx`
- `RESPView.aspx`

Source hiện tại vẫn có pattern disable control trong `!IsPostBack`; chưa có base page/HTTP module tập trung. Vì vậy finding này phải được coi là **chưa có bằng chứng đóng**.

### 4.4. Mẫu kiểm tra cho mutation

Mọi event có side effect cần thực hiện theo thứ tự:

```text
1. Validate session/GUID
2. Resolve user + DBID + DSID từ server-side Session
3. Check permission cho action
4. Validate record thuộc data scope của user/tenant
5. Validate input/business state
6. Gọi SP với iUserID + DSID
7. Ghi audit/history
```

Không tin hidden field/query string cho user ID, DSID, role hoặc ownership nếu có thể lấy lại từ Session/DB.

---

## 5. Tenant và data isolation

VieFUND có hai tầng ngữ cảnh:

- `DBID`: chọn database/connection.
- `DSID`: dealership context; việc giới hạn dữ liệu phải được enforce qua predicate, ownership chain hoặc access-list của từng SP.
- `DSIDSub`: source hiện có chỉ chứng minh vai trò session/custom asset suffix, không phải security boundary hay mapping trực tiếp tới `UB_DealerSubBranch`.

`CBase.GetConnectionParam()` lấy các giá trị này từ session context và hầu hết BLL truyền `DSID`, `iUserID` vào SP. Đây là boundary bảo mật quan trọng.

Checklist khi review SP:

- Có nhận `@DSID` và/hoặc `@iUserID` không?
- Mọi nhánh query/update có dùng filter tenant không?
- ID truyền từ UI có được join ngược qua plan/client/dealership để xác minh ownership không?
- Dynamic SQL có giữ filter DSID không?
- Export/report có dùng cùng data scope như screen không?
- Archive/TMP table có mang đủ DSID hoặc liên kết tới record có DSID không?

Một query đúng nghiệp vụ nhưng thiếu tenant filter vẫn là security bug.

---

## 6. File upload

### 6.1. Bề mặt tấn công

[Upload Audit](upload-audit.md) đã kiểm kê các handler thành bốn nhóm:

1. Document/fund fact upload — rủi ro cao vì file có thể được serve lại.
2. Logo/image upload — rủi ro XSS/content spoofing.
3. Member document upload — chứa PII và có quyền truy cập nhạy cảm.
4. Data import — rủi ro parser, XXE, macro/format bomb dù thường không serve lại.

### 6.2. Trạng thái source hiện tại

`FundSetup.aspx.cs::FFProcessUpload()` hiện lấy:

- `PostedFile.FileName`
- `PostedFile.ContentLength`
- `PostedFile.ContentType`
- `PostedFile.InputStream`

rồi chuyển thẳng sang `CPlanDoc.AddFFObjDef()`. Chưa thấy whitelist extension, magic-byte validation hay validator dùng chung. `ContentType` từ browser không phải bằng chứng nội dung file an toàn.

### 6.3. Policy tối thiểu cần có

| Kiểm soát | Yêu cầu |
|---|---|
| Filename | Dùng basename, không tin path từ client, tạo storage name riêng |
| Extension | Whitelist theo từng use case, không dùng một whitelist quá rộng cho mọi handler |
| Signature | Kiểm tra magic bytes/container; Office Open XML cần kiểm tra ZIP entries phù hợp |
| Size | Giới hạn tại IIS/ASP.NET và kiểm tra lại theo profile nghiệp vụ |
| Parser | Tắt external entity/DTD khi đọc XML; giới hạn decompression/resources |
| Storage | Ưu tiên ngoài web root hoặc lưu binary trong DB/object store |
| Serving | `attachment` cho user content; thêm `nosniff`; encode filename |
| Authorization | Check quyền upload, xem, thay thế và xóa độc lập |
| Audit | Ghi user, tenant, original name, size, type, hash và record owner |

Không nên cho `.xml` vào whitelist document chung chỉ vì extension là text; XML import và document download có threat model khác nhau.

---

## 7. File download và output

`PdfView.aspx.cs` có thể trả `Content-Disposition: inline` hoặc `attachment` tùy `Extra3`/kích thước. `PopupFileView.aspx.cs` chỉ đặt `filename=...` mà không chỉ rõ disposition. Nhiều `*Prn.aspx.cs` trả PDF inline.

Phân loại cần giữ:

| Nội dung | Policy đề xuất |
|---|---|
| PDF do hệ thống tự sinh | Có thể inline nếu `Content-Type` đúng và có `nosniff` |
| File do user upload | Mặc định attachment; không render active content cùng origin |
| Image/logo đã validate | Có thể inline theo whitelist format raster |
| SVG/HTML/XML user upload | Không inline cùng application origin |

Filename đưa vào `Content-Disposition` cần loại CR/LF và encode an toàn để tránh header injection.

Web Forms output vẫn cần đúng context encoding:

- HTML text → HTML encode.
- HTML attribute → attribute encode.
- JavaScript string → JavaScript encode hoặc truyền qua JSON serializer.
- URL/query → URL encode từng component.
- SQL → parameterized stored procedure; không nối chuỗi input vào dynamic SQL.

### 7.1. Request validation ở page scope

Inventory source ngày 2026-09-04 cho thấy 477 file có `<%@ Page>` trong `WebApp/Main`; 276 file khai báo `validateRequest="false"`. Đây không tự động chứng minh có XSS, nhưng làm mất một lớp phòng thủ mặc định trên phần lớn endpoint và tăng hậu quả của output không encode.

Không bật lại đồng loạt khi chưa inventory field cần nhận markup. Hướng xử lý an toàn là thu hẹp `validateRequest="false"` tới đúng page/field cần thiết, sanitize dữ liệu được phép chứa HTML, và encode tại mọi output context. Xem thêm [UI Patterns](../../viefund-framework/ui-patterns.md).

---

## 8. Mã hóa và dữ liệu nhạy cảm

### 8.1. `CEncryption8`

`UBConnection/CEncryption.cs` triển khai DES tùy chỉnh với các hàm:

- `GetEncPW()` / `GetDecPW()`
- `GetEncStr()` / `GetDecStr()`
- các hàm chuyển đổi password legacy WinFund/WebClient

Đây là reversible encryption. Password có thể được giải mã bởi code có key logic tương ứng, nên không đạt mô hình password hashing hiện đại như PBKDF2/bcrypt/Argon2.

### 8.2. Quy tắc bảo trì

- Không dùng `CEncryption8` cho feature mới nếu không bị ràng buộc tương thích legacy.
- Không log plaintext password, SIN, token, connection string hoặc verification code.
- Tách key khỏi source/config có thể đọc được; dùng secret store của môi trường.
- Nếu migrate password, dùng chiến lược verify-legacy-then-rehash để tránh reset hàng loạt.
- Dữ liệu cần truy hồi plaintext phải dùng authenticated encryption hiện đại và key rotation.
- Dữ liệu chỉ cần so sánh, đặc biệt password, phải dùng salted one-way hash.

`Docs_V2/topics/security/README.md` trước đây mô tả `CEncryption.cs` là AES; source cho thấy đó là DES tùy chỉnh và guide này là thông tin chuẩn đã kiểm chứng.

---

## 9. HTTP, TLS và cấu hình môi trường

### 9.1. Trạng thái `Web.config`

Đã có:

- `X-Frame-Options: SAMEORIGIN`
- request size limit
- WCF transport security cho endpoint Fundata

Chưa thấy trong file hiện tại:

- `X-Content-Type-Options: nosniff`
- `Strict-Transport-Security`
- `Content-Security-Policy`
- `Referrer-Policy`
- `Permissions-Policy`
- `enableVersionHeader="false"`
- `removeServerHeader="true"`

Ngoài ra `compilation debug="true"` đang xuất hiện trong `Web.config`; production deployment phải override/tắt debug.

### 9.2. Phần không nằm hoàn toàn trong repo

TLS 1.0/1.1, RC4/3DES cipher, IIS Server header và reverse-proxy behavior có thể do OS/IIS/load balancer quản lý. Phải xác minh bằng scan endpoint thật sau deployment; review file config không đủ.

### 9.3. Lưu ý CSP cho Web Forms

Web Forms sinh inline script và `__doPostBack`; áp CSP nghiêm ngay lập tức có thể làm hỏng UI. Cần triển khai theo pha:

1. `Content-Security-Policy-Report-Only`.
2. Thu thập violation theo các luồng EN/FR, popup, AJAX và report.
3. Loại inline/eval dần hoặc dùng nonce/hash nếu khả thi.
4. Chuyển sang enforcement sau regression test.

---

## 10. Kết quả penetration test và trạng thái xác minh

Red Sentry report ghi nhận 8 issue instances thuộc 6 finding category:

| ID | Mức độ | Finding | Trạng thái trong workspace |
|---|---|---|---|
| F0001 | High | Broken Access Control | Có thiết kế remediation; source chưa có guard tập trung |
| F0002 | Medium | Stored XSS qua SVG Fund Fact upload | Có đề xuất validation; handler hiện tại chưa áp dụng |
| F0003 | Info | Missing Security Headers | Mới có `X-Frame-Options`; chưa đủ bộ đề xuất |
| F0004 | Info | Server Banner Disclosure | Chưa thấy config suppress banner/version |
| F0005 | Info | Deprecated TLS 1.0/1.1 | Phải xác minh tại IIS/endpoint thật |
| F0006 | Info | RC4/3DES cipher suites | Phải xác minh tại IIS/endpoint thật |

Tên file `solved-result.md` dễ gây hiểu nhầm. Header trong chính file ghi “Đề xuất sửa (chưa deploy)”; khi báo cáo trạng thái phải dùng nội dung này, không dùng tên file để kết luận finding đã đóng.

Tài liệu liên quan:

- [Red Sentry Report](red-sentry-report.md) — báo cáo gốc đã chuyển sang Markdown.
- [Remediation Proposal](solved-result.md) — code/config đề xuất, chưa xác minh triển khai.
- [Implementation Plan](implementation-plan.md) — so sánh WriteProtect, HTTP module và hybrid.
- [Upload Audit](upload-audit.md) — inventory upload handler và checklist.

---

## 11. Kiến trúc mục tiêu cho authorization

Thiết kế hybrid trong tài liệu hiện có vẫn hợp lý về nguyên tắc, nhưng phải chốt business matrix trước khi code:

```text
Request
  ├─ Page policy: AdminOnly / ReadOnly / Allowed
  ├─ Action policy: Add / Edit / Delete / Approve / Upload / Export
  ├─ Record scope: DSID + branch + rep/client/plan ownership
  └─ SP enforcement + audit/history
```

Nên dùng allowlist/policy mapping thay vì blacklist URL. Trang mới không có policy phải fail closed trong khu vực quản trị. ReadOnly cần chặn server-side event, không chỉ disable control.

Business matrix tối thiểu:

| Resource/page | View | Add | Edit | Delete | Approve | Upload/Download | Data scope |
|---|---|---|---|---|---|---|---|
| Fund setup | role? | role? | role? | role? | role? | role? | DSID |
| Onboarding | role? | role? | role? | role? | role? | role? | DSID/rep |
| RESP | role? | role? | role? | role? | role? | role? | DSID/rep |
| Compliance | role/level? | — | decision? | — | level 1/2 | report | branch/rep |

Các dấu `?` phải được business owner xác nhận; tài liệu kỹ thuật không tự quyết định quyền nghiệp vụ.

---

## 12. Checklist code review

### Page/event handler

- [ ] Có validate session/GUID trước action không?
- [ ] Có check permission server-side cho mutation không?
- [ ] Có tin role/DSID/user ID từ hidden field/query string không?
- [ ] IDOR: record ID có được xác minh thuộc data scope không?
- [ ] Cả EN và FR page/code path đã được kiểm tra chưa?
- [ ] ReadOnly có chặn POST/event thật hay chỉ disable UI?

### Stored procedure

- [ ] Có `@DSID`, `@iUserID` và filter phù hợp mọi nhánh không?
- [ ] Dynamic SQL có parameterized và giữ tenant filter không?
- [ ] Update/Delete có kiểm tra trạng thái hiện hành để tránh stale write không?
- [ ] Có audit/history cho action nhạy cảm không?
- [ ] Error message có lộ SQL/schema/PII không?

### Upload/download

- [ ] Whitelist đúng use case, không chỉ blacklist?
- [ ] Extension, signature, size và parser đều được kiểm tra?
- [ ] Stream được reset sau khi đọc signature?
- [ ] File nằm ngoài web root hoặc không thể execute?
- [ ] User content dùng attachment + nosniff?
- [ ] Filename/header được encode?

### Secrets/crypto

- [ ] Không thêm secret/key/token vào source hoặc log?
- [ ] Không dùng reversible encryption cho password mới?
- [ ] Có kế hoạch rotation/revocation?
- [ ] Dữ liệu nhạy cảm trong report/export có theo `TMPMask` và access scope?

---

## 13. Verification sau remediation

### Access control

1. Lập account test cho từng role và supervisory level.
2. Test direct URL, GET, normal POST và crafted POST.
3. Test record cùng tenant, khác branch/rep và khác tenant.
4. Xác minh response, DB không đổi và audit log có record khi bị chặn.

### Upload/XSS

1. File hợp lệ cho từng profile.
2. `.svg`, `.html`, double extension và content đổi đuôi.
3. Polyglot/container bất thường, XML external entity và oversized file.
4. Download lại file và kiểm tra disposition/content-type/nosniff.

### Headers/TLS

1. Dùng browser DevTools và `curl -I` trên endpoint thật.
2. Kiểm tra cả 200, redirect, 4xx, 5xx và static/uploaded file.
3. Chạy TLS scanner ngoài mạng ứng dụng.
4. Regression test Web Forms/AJAX sau CSP và cookie policy.

Không đóng finding chỉ vì code đã merge; cần evidence trên môi trường triển khai.

---

## 14. File đầu mối

| File | Vai trò |
|---|---|
| `WebApp/Default.aspx.cs` | Login/2FA/SSO entry point |
| `UBClasses/Member.cs` | Session login, role/access flags và permission helpers |
| `UBStatic/CFunctions.cs` | Session namespace, PageLoad và GUID validation |
| `UBClasses/CBase.cs` | Connection context và DB-backed session validation |
| `UBConnection/CDatabase.cs` | DB access, login/password flows và logging helpers |
| `UBConnection/CEncryption.cs` | DES-based reversible encryption legacy |
| `WebApp/Web.config` | ASP.NET/IIS headers, limits và runtime settings |
| `WebApp/Main/FundSetup.aspx.cs` | Fund Fact upload được nêu trong finding XSS |
| `WebApp/Main/PdfView.aspx.cs` | Output PDF/file với inline/attachment behavior |
| `ScriptDB/000_4_CreateSP.sql` | Login, session, permission/data-scope logic trong DB |

---

## 15. Quy tắc cập nhật tài liệu

Khi một remediation được triển khai:

1. Ghi commit/release hoặc deployment evidence.
2. Cập nhật finding table trong guide này.
3. Đổi checklist trong `upload-audit.md`/`solved-result.md` từ đề xuất sang đã xác minh.
4. Ghi test account/role, endpoint và ngày kiểm tra; không lưu credential.
5. Nếu behavior khác giữa source và production config, ghi cả hai rõ ràng.
