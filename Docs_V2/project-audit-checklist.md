# Rà soát tổng thể tài liệu — Checklist và phần việc còn lại

> Rà soát ngày 2026-09-05 trên nguồn tài liệu chính `Docs_V2/`, đối chiếu design spec v3, tracker, ba worklog, source code/SQL trong workspace và các generator hiện hành. `VFCsvExport` tiếp tục bị loại khỏi phạm vi theo yêu cầu.

## 1. Kết luận điều hành

Kế hoạch gốc có **26 deliverable**:

- **25 deliverable hoàn thành về mặt tài liệu**;
- **1 deliverable bỏ qua có chủ đích**: Export/`VFCsvExport` (#15);
- **0 deliverable trong kế hoạch gốc còn dở**.

“Hoàn thành tài liệu” không đồng nghĩa mọi bug đã sửa, mọi route đang chạy đã được smoke test, hoặc schema snapshot giống production. Kết quả hiện tại đủ để developer đi từ hệ thống → domain → UI/code → stored procedure → database; các xác minh cần môi trường thật và backlog remediation được tách ở [phần 7](#7-phần-việc-còn-lại-sau-kế-hoạch-gốc).

Nguồn trạng thái chuẩn:

- [Tracker hiện hành](../.agents/worklog/progress.md)
- [Worklog khởi tạo và các deliverable đầu](../.agents/worklog/2026-04-26.md)
- [Worklog source-audit framework/module](../.agents/worklog/2026-09-04.md)
- [Worklog Onboarding và ba catalog cuối](../.agents/worklog/2026-09-05.md)

## 2. Cách rà soát và mức bằng chứng

Checklist lần này không chỉ đọc dấu ✅ trong tracker. Các kiểm tra đã thực hiện:

- đối chiếu đủ 26 mục với design spec và file/folder thực tế;
- kiểm tra file có nội dung, heading, phạm vi và không còn marker “Chưa có nội dung” trong 25 deliverable hoàn thành;
- quét toàn bộ Markdown trong `Docs_V2`, gồm cả các topic bổ sung sau audit;
- kiểm tra lại **24.164 link cục bộ** sau khi hoàn thiện ba topic bổ sung và audit sâu Order: không có target file bị thiếu;
- quét heuristic **989 token tên file/source** trong 42 guide chính/phụ: 974 resolve được; 15 còn lại đều là pattern tổng quát, filename ví dụ hoặc input đã được tài liệu ghi rõ là không có (`Tables.sql`, XSD Fundserv);
- chạy lại SP Catalog, Traceability Matrix và Screen Catalog từ source hiện tại;
- kiểm tra PowerShell parser của cả ba generator;
- đối chiếu findings trong tracker với nội dung guide liên quan.

Mức bằng chứng dùng trong bảng:

| Mức | Ý nghĩa |
|---|---|
| **A+** | Có generator/validator tái tạo từ source hoặc SQL và vừa chạy lại thành công. |
| **A** | Đã source-audit trực tiếp, có số liệu/flow/findings và ranh giới bằng chứng rõ. |
| **B** | Guide sử dụng được và source path hiện còn hợp lệ; chưa re-trace mọi nhánh với runtime/DB production trong lượt audit này. |
| **Skip** | Loại khỏi phạm vi theo quyết định của user, không phải thiếu sót vô tình. |

## 3. Checklist 26 deliverable

| # | Trạng thái | Deliverable | Nội dung đã có | Mức | Ghi chú audit |
|---:|:---:|---|---|:---:|---|
| 1 | ✅ | [System Map](getting-started/system-map.md) | 26 project, layer, dependency, WebApp structure, naming, navigation, build/deploy | B | File đầy đủ; inventory là source-repository map, không phải deployment inventory. |
| 2 | ✅ | [Domain Glossary](getting-started/domain-glossary.md) | 121 dòng thuật ngữ, 13 nhóm, entity relationship và transaction lifecycle | B | Thuật ngữ kỹ thuật đã đủ dùng; định nghĩa chính sách vẫn cần business owner khi có thay đổi. |
| 3 | ✅ | [Trading & Orders](topics/trading-orders/README.md) | Module guide, [Order end-to-end](topics/trading-orders/order-end-to-end.md), [Code Dictionary](topics/trading-orders/code-dictionary.md), error correction | A | Đã re-trace UI/BLL/SP/DB cho create → queue → send → response → confirmation; tách rõ khoảng trống MQ transport. |
| 4 | ✅ | [Client & KYC](topics/client-kyc/module-guide.md) | Client, KYC/AML, quyền truy cập, UI/BLL/SP/DB | B | Các luồng search/add/update được bổ sung bằng trace `CL-01..05`. |
| 5 | ✅ | [Commission & Fee](topics/commission-fee/module-guide.md) | Revenue → payable → payroll; fee processing | B | Trace `CM-01..05` xác minh các boundary chính. |
| 6 | ✅ | [Fund & GIC](topics/fund-gic/module-guide.md) | Mutual Fund, NAV/KYP, GIC, CANNEX, search/rate | B | Trace `FG-01..03` xác minh picker/favorite/GIC rate. |
| 7 | ✅ | [Account & Plan](topics/account-plan/module-guide.md) | Client → Plan → Account → Position, plan type, beneficiary, RRIF | B | Trace `AP-01..05` xác minh add/update/delete/beneficiary/RRIF. |
| 8 | ✅ | [Compliance](topics/compliance/module-guide.md) | Suitability, account/KYC approval, missing KYC, AML/FINTRAC, SP map | A | Đã đối chiếu toàn bộ SP active của `Compliance.cs` với SQL snapshot. |
| 9 | ✅ | [Tax & Year-End](topics/tax-yearend/module-guide.md) | Workbench 18 report type, pending/approved/XML/release/submission, schema và PDF | A | Đã phân biệt status slip, approval và export request; trace `TX-01..05`. |
| 10 | ✅ | [Authentication & Authorization](viefund-framework/auth.md) | Login, session, SSO/SAML, 2FA, permission và password policy | B | Guide chi tiết; deployment SSO/2FA và secret/config cần xác minh theo môi trường. |
| 11 | ✅ | [UI Patterns](viefund-framework/ui-patterns.md) | Page/popup/panel/include, lifecycle, menu, AJAX control, EN/FR, theme | A | Đã quét trực tiếp `WebApp/Main`; Screen Catalog mở rộng inventory sang WebClient. |
| 12 | ✅ | [JavaScript Framework](viefund-framework/javascript.md) | Tổng quan và 5 guide con về AJAX, bridge, popup và utilities | B | Source path hợp lệ; global JS coupling vẫn cần test theo screen khi sửa. |
| 13 | ✅ | [Database Access](viefund-framework/database-access.md) | `CDatabase`, Registry, DBID/DSID, result contract, transaction/error pattern | A | Đã sửa các giả định cũ về API và xác minh call pattern từ source. |
| 14 | ✅ | [PDF Workflow](viefund-framework/pdf/pdf-workflow.md) | Generator/form/merge/stored binary, hai `PdfView`, route map và debug | A | Đã audit trực tiếp 98 route labels WebApp và router WebClient; findings còn mở. |
| 15 | ⏭️ | Export / `VFCsvExport` | Không thực hiện | Skip | Bỏ qua đúng yêu cầu; không được tính là deliverable thiếu. |
| 16 | ✅ | [Charts](viefund-framework/charts.md) | Web Forms/`ChartImg.axd` và PDF/PNG, chart type, binding, EN/FR | A | Inventory và defect candidates đã đối chiếu source. |
| 17 | ✅ | [Email & Notifications](viefund-framework/email-notifications.md) | Internal notification, outbox, SMTP, template, SMS/Twilio và 2FA | A | Đã tách rõ queue khỏi transport và ghi nhận sender runtime còn thiếu source. |
| 18 | ✅ | [E-Signature](viefund-framework/esignature.md) | DocuSign, Signority, OneSpan, routing theo dealer và workflow | B | Audit này sửa source path `CPlanDoc` về class trong `UBClasses/Document.cs`. Runtime provider/OAuth vẫn theo config. |
| 19 | ✅ | [Security](topics/security/module-guide.md) | Auth/session, authorization, tenant, upload/download, encryption, HTTP/TLS và audit | A | “Hoàn thành guide” không có nghĩa mọi Red Sentry finding đã remediation. |
| 20 | ✅ | [Multi-tenancy & Localization](viefund-framework/multitenancy.md) | DBID, DSID/access graph, session, settings, branding và EN/FR | A | Đã ghi rõ DAL không tự enforce DSID và các tenant gaps cần xử lý. |
| 21 | ✅ | [Fundserv](topics/fundserv/README.md) | 13 guide: file/dataflow, TFS/NFU, import/export, debug, mock, V36 và AcctDesig | B | Source/link hợp lệ; XSD chuẩn được nhắc trong tài liệu nhưng không có trong workspace. |
| 22 | ✅ | [Onboarding](topics/onboarding/README.md) | 2 ASMX tree, 54/38 WebMethod, client/plan/order flow, manual approval và DB | A | 52/52 routine active đã khớp SQL snapshot; deployment đang dùng assembly nào chưa xác minh được từ repo. |
| 23 | ✅ | [Data Dictionary](reference/data-dictionary.md) | 1.127 bảng, 58 nhóm, schema conventions, 12 bảng lõi và workflow xác minh | A | Là schema snapshot; `Tables.sql` nguồn và DB production không có trong workspace. |
| 24 | ✅ | [SP Catalog](reference/sp-catalog/README.md) | 5.544 definition, 5.377 SQL edge, caller C#, 14 topic, source gaps và dynamic call | A+ | Generator vừa chạy lại: 1.583 tên tĩnh khớp, 33 không khớp, 693 call site động. |
| 25 | ✅ | [Traceability Matrix](reference/traceability-matrix.md) | 50 flow thuộc 11 miền: UI/API/service → logic → SP → DB object | A+ | Validator vừa chạy lại: 0 issue; 29 entry file, 22 logic file, 54 procedure, 50 DB object. |
| 26 | ✅ | [Screen Catalog](reference/screen-catalog.md) | 1.358 ASPX artifact, endpoint/fragment, project/code/include/direct SP/trace map | A+ | Generator vừa chạy lại: 581 endpoint, 777 fragment, 452 code-behind duy nhất. |

## 4. Những gì đã đạt được theo mục tiêu ban đầu

### 4.1. Hiểu hệ thống và nơi đặt code

- [x] Có project/layer map và thứ tự đọc source.
- [x] Có bản đồ WebApp/WebClient, page/popup/panel, menu, session và localization.
- [x] Có guide cho DAL, PDF, chart, email, e-signature, security và multi-tenancy.
- [x] Có inventory UI diện rộng và trace end-to-end cho luồng trọng yếu.

### 4.2. Hiểu nghiệp vụ

- [x] Có glossary 100+ thuật ngữ và mô hình entity/lifecycle.
- [x] Có 7 module guide gốc: Trading, Client/KYC, Commission/Fee, Fund/GIC, Account/Plan, Compliance, Tax/Year-End.
- [x] Có bộ Fundserv, Onboarding, Security, Omnibus và các business-logic topic bổ sung.
- [x] Business rule được gắn với class/SP/table khi source cho phép; phần suy luận hoặc phụ thuộc business owner được ghi rõ.

### 4.3. Hiểu database

- [x] Có schema inventory 1.127 bảng và ERD 12 bảng lõi.
- [x] Có catalog đủ 5.544 stored procedure và SQL call graph.
- [x] Có caller map C# tĩnh, danh sách tên động và danh sách không khớp snapshot.
- [x] Có phương pháp đi từ domain/UI tới field/table thay vì đoán theo tên.

### 4.4. Theo dõi và tái tạo

- [x] `Docs_V2/` là nguồn tài liệu chính; `Docs_EN/` không dùng làm trạng thái.
- [x] Có tracker, worklog theo ngày và design spec.
- [x] SP Catalog, Traceability Matrix và Screen Catalog có generator chạy lại được.
- [x] Findings được giữ trong tracker, không trộn “đã document” với “đã sửa bug”.

## 5. Kết quả kiểm tra kỹ thuật của lượt audit này

| Kiểm tra | Kết quả |
|---|---:|
| Markdown trong `Docs_V2` | 110 file |
| Link cục bộ đã kiểm tra | 24.164 |
| Link cục bộ trỏ tới target không tồn tại | 0 |
| Link `file:///C:/...` không portable còn lại | 0 |
| Token source/file trong 42 guide chính/phụ | 989 |
| Token resolve được tới workspace | 974 |
| Token còn lại | 15 — pattern, filename ví dụ, `Tables.sql` hoặc XSD đã biết là thiếu |
| SP Catalog generator | Thành công — 5.544 SP, 5.377 edge |
| Traceability validator | Thành công — 50 trace, 0 issue |
| Screen Catalog generator | Thành công — 1.358 row |
| PowerShell parser của ba generator | 0 lỗi |

Các con số link có thể tăng khi tài liệu mới được thêm. Mục tiêu của phép kiểm tra là phát hiện target local bị mất, không xác nhận nội dung của website bên ngoài.

## 6. Sai lệch đã sửa trong lúc rà soát

1. Chuẩn hóa **17 link `file:///C:/...`** trong Fundserv, GS import và XML Validation thành link tương đối portable.
2. Sửa E-Signature guide: class `CPlanDoc` nằm trong `UBClasses/Document.cs`, không có file `UBClasses/CPlanDoc.cs`.
3. Làm rõ bốn file SDK example của DocuSign thay cho pseudo-path `VFDocSign/Example1-4.cs`.
4. Chạy lại ba generator để tránh tracker đúng nhưng catalog đã lệch source.
5. Sửa mock FundServ cũ: DR response Accepted chưa phải Confirmed; `RtnCode=01` không mặc định là reject và các mã `E001/E002/W001` không có dữ liệu seed chứng minh trong workspace.

Lượt audit Order sau đó ghi nhận thêm các defect candidate có bằng chứng source tại [Order Code Dictionary](topics/trading-orders/code-dictionary.md#9-defect-candidate-liên-quan-tới-mã); chưa có thay đổi code runtime.

## 7. Phần việc còn lại sau kế hoạch gốc

### 7.1. Tài liệu ngoài 26 deliverable

- [x] [Settlement](topics/settlement/README.md): đã viết flow N$M/cheque/EFT và đối chiếu UI/BLL/SP/DB snapshot.
- [x] [XML Schema & Validation](reference/xml-validation-guide.md): đã xác minh XSD source/runtime, version/flag, outgoing/incoming và trạng thái V36.
- [x] [PDF & Reports topic](topics/pdf-reports/README.md): đã có [report catalog](topics/pdf-reports/report-catalog.md), audit Client Report Ad-hoc và nối với PDF Workflow kỹ thuật.
- [x] [Order end-to-end](topics/trading-orders/order-end-to-end.md) và [Order Code Dictionary](topics/trading-orders/code-dictionary.md): đã đối chiếu WebForms, BLL, parser C#, SP/UDF và bảng DB; gồm status/action/type, internal `Ret`, FundServ code và hard-code DSID/dealer.
- [ ] Business overview/chính sách vận hành: cần business owner bổ sung cho các rule không thể suy ra chắc chắn từ code.

### 7.2. Xác minh cần môi trường hoặc nguồn ngoài workspace

- [ ] So sánh schema/procedure snapshot với database production; `Tables.sql` không có trong workspace.
- [ ] Xác định IIS/deployment đang host `VFOnBoarding` hay `OnboardingWebServices`.
- [ ] Bổ sung/đối chiếu XSD Fundserv (`tfs.xsd`, `nfu.xsd`, `FStypes.xsd`) và version thực tế.
- [ ] Xác minh menu, role, DSID setting, publish profile và route active theo từng môi trường/dealer.
- [ ] Xác định runtime worker thực sự gửi `UB_EmailOutBox` và contract retry/monitoring.

### 7.3. Khoảng trống source/catalog cần xử lý dần

- [ ] Phân loại 33 tên SP tĩnh trong C# không có definition khớp SQL snapshot.
- [ ] Lần theo 693 call site `SetSP` dùng tên động theo từng flow; không resolve bằng phép gom assignment toàn file.
- [ ] Phân loại 3.961 SQL definition chưa thấy tên tĩnh từ C# theo SQL nội bộ/job/integration/legacy.
- [ ] Xác minh 44 `Content Include` của `WebClient.csproj` trỏ tới ASPX thiếu.
- [ ] Phân loại 202 ASPX có trên disk nhưng ngoài project trước khi xóa hoặc phục hồi.
- [ ] Xem xét 4 code-file directive thiếu và 8 `Inherits` không khớp; ưu tiên page nằm trong project/menu active.

### 7.4. Remediation bug/risk — thứ tự đề xuất

Chi tiết đầy đủ nằm trong [tracker](../.agents/worklog/progress.md). Thứ tự dưới đây dựa trên ảnh hưởng tiềm năng, chưa thay cho threat model hoặc test production.

**Ưu tiên 1 — authorization, tenant và secret**

- [ ] Sửa/kiểm thử `Is2URLEqual` của Onboarding trước khi token được gửi qua callback URL.
- [ ] Enforce DSID/user/role cho các SP Onboarding list/info/remove/reject.
- [ ] Audit authorization của PDF route `888` và `CWFPayable.GetPdf`.
- [ ] Rà soát các notification/settings/login SP không scope hoặc không bind DSID đầy đủ.
- [ ] Di chuyển Twilio access token khỏi plaintext và thu hẹp TLS protocol cũ.

**Ưu tiên 2 — sai logic nghiệp vụ hoặc route**

- [ ] Sửa order Switch bị stage với `iOrderType=Sell`.
- [ ] Sửa mapping `Ret=104` của fee redemption Client Name để message N$M không rơi về generic; đồng thời sửa bounds check `GetTrxErrorMSG` và chuẩn hóa ngưỡng `>=10`/`>10` giữa các handler.
- [ ] Sửa parser Order response chỉ nhận 4/5 error-warning slot và điều kiện retry bất khả thi `ErrorCode == "98" && ErrorCode == "003"`.
- [ ] Xác minh/sửa nhánh import trả success khi XML stream/reader null và biến `@iTrxStatus` chưa khởi tạo trong retry SP.
- [ ] Đồng bộ setting/column contract của manual onboarding.
- [ ] Xử lý PDF route `47` rỗng và validate shape của route payload.
- [ ] Sửa `CommPayrollHistoryPrn_FR.aspx` khai báo sai `Inherits` sau khi smoke test route FR.
- [ ] Xác minh/sửa các lỗi chart đã ghi: `FindMinP`, sample data hard-code và markup `MajorGrid` WebClient.

**Ưu tiên 3 — độ bền và vận hành**

- [ ] Sửa các bất thường email/outbox/resend/template đã liệt kê trong tracker.
- [ ] Kiểm tra collision/cleanup/quyền thư mục `TMP` của PDF merge.
- [ ] Bổ sung error contract, content type và trạng thái failure cho Onboarding.
- [ ] Thêm smoke/integration test cho login, tenant boundary, order, tax export, notification và PDF route trọng yếu.

## 8. Cách tiếp tục từ đây

Ba topic tài liệu bổ sung Settlement → XML Validation → PDF & Reports và lượt audit sâu Trading & Orders đã hoàn thành. Phần tài liệu còn phụ thuộc business owner là business overview/chính sách vận hành không thể suy ra chắc chắn từ code.

Nếu mục tiêu là **giảm rủi ro hệ thống**, bắt đầu từ nhóm ưu tiên 1 ở trên, mỗi finding nên có: source proof, reproducible scenario, expected behavior, test bảo vệ và thay đổi code/SQL tách riêng.

Nếu mục tiêu là **onboard developer**, đọc theo thứ tự:

1. [System Map](getting-started/system-map.md)
2. [Domain Glossary](getting-started/domain-glossary.md)
3. [Framework index](viefund-framework/README.md)
4. [Topic cần làm](topics/README.md)
5. [Screen Catalog](reference/screen-catalog.md) hoặc [Traceability Matrix](reference/traceability-matrix.md)
6. [SP Catalog](reference/sp-catalog/README.md) và [Data Dictionary](reference/data-dictionary.md)
