# Tax & Year-End — Module Guide

> Mục tiêu: giúp developer lần theo nghiệp vụ cuối năm từ màn hình WebForms đến BLL, stored procedure, bảng dữ liệu và file đầu ra. Nội dung dưới đây được đối chiếu trực tiếp với source C# và SQL trong workspace; `VFCsvExport` không thuộc phạm vi.

## 1. Kết luận nhanh

Tax & Year-End không phải một job duy nhất. Đây là một workbench chứa 18 loại báo cáo, dùng chung mô hình xử lý nhưng mỗi loại có bảng và stored procedure riêng:

```text
Giao dịch/plan/client
  → Pending: chọn nguồn và tạo slip/receipt
  → Approved: rà soát, sửa, trả về Pending, cancel hoặc release cho client
  → Create XML: lưu T619 + tạo export request + đánh dấu slip đang xử lý
  → Generator ngoài request: sinh file và gọi UBExportSet
  → File: download, đánh dấu Filed/Submitted và lưu confirmation
```

Ba trục trạng thái phải được hiểu riêng:

1. `iStatus` của slip: vòng đời electronic filing (`Pending`, `In progress`, `Filed`, `Submitted`).
2. `iApproved`: slip đã được release/hiển thị cho client hay chưa.
3. `rpt_tcd` hoặc `slip_type_code`: loại báo cáo `O` (Original), `A` (Amended), `C` (Cancelled).

Ngoài ra, `UB_ExportRequest.iStatus` và `iSubmissionStatus` theo dõi trạng thái file/request, không đồng nghĩa với `iStatus` của slip.

## 2. Điểm vào và phạm vi thực tế

- Menu gọi `OnYearEndReport()` trong `WebApp/Js/MenuFunctions.js`, mở trang `YearEnd`.
- `WebApp/Main/YearEnd.aspx` khai báo danh sách report type tĩnh và include 18 fragment `YearEnd_*.aspx`.
- `WebApp/Main/YearEnd.aspx.cs` nạp tax year qua `UBYearEndComboList`, nạp intermediary và chuyển report type sang đúng view.
- Các file có hậu tố `_Old`, `_TBD`, `.bak` không được include vào trang active nên không được dùng để kết luận hành vi hiện tại.

### 2.1. Ma trận 18 loại báo cáo

| UI ID | Báo cáo | View | Export type | Nhóm XML | Lưu trữ chính |
|---:|---|---:|---:|---|---|
| 0 | RRSP tax receipt/XML | 0 | 22 | CRA | `UB_RRSP_SLP`, `_ARC`, `_TRX`; receipt dùng `UB_TaxReceipt`, `UB_RRSPTaxReceipt*` |
| 1 | T4A | 1 | 30 | CRA | `UB_T4A`, `_SLP`, `_SLP_ARC`, `_TRX` |
| 2 | T5 | 2 | 35 | CRA | `UB_T5_SLP`, `_SLP_ARC`, `_TRX`, `_Omnibus`, `_PlanFund` |
| 3 | T3 | 3 | 26 | CRA | `UB_T3_SLP`, `_SLP_ARC`, `_TRX`, `_Omnibus`, `_PlanFund` |
| 5 | TFSA | 5 | 21 | CRA | `UB_TFSA`, `_Ident`, `_ARC`, `_Trans`, `_Trans_ARC` |
| 6 | T4RSP | 6 | 23 | CRA | `UB_T4RSP`, `_SLP`, `_SLP_ARC`, `_TRX` |
| 8 | T4RIF | 8 | 24 | CRA | `UB_T4RIF`, `_SLP`, `_SLP_ARC`, `_TRX` |
| 10 | T5008 | 10 | 27 | CRA | `UB_T5008`, `_Detail`, `_SLP`, `_SLP_ARC`, `_TRX`, `_Obj` |
| 11 | T550 | 11 | 20 | CRA | `UB_T550`, `_ARC` |
| 12 | Part XVIII (P18) | 12 | 28 | CRA/CRS-FATCA | `UB_P18_SLP`, `_SLP_ARC`, `_Summary`, `_AcctHolder`, `_ControllingPerson` |
| 13 | Part XIX (P19) | 13 | 29 | CRA/CRS-FATCA | `UB_P19_SLP`, `_SLP_ARC`, `_Summary`, `_AcctHolder`, `_ControllingPerson` |
| 14 | NR4 | 14 | 25 | CRA | `UB_NR4_SLP`, `_SLP_ARC`, `_TRX` |
| 31 | Relevé 1 | 7 | 31 | Québec | `UB_Releve1`, `UB_RL1_SLP`, `_SLP_ARC`, `_TRX` |
| 32 | Relevé 2 | 9 | 32 | Québec | `UB_RL2_SLP`, `_SLP_ARC`, `_TRX`, `_Obj` |
| 33 | Relevé 16 | 4 | 33 | Québec | `UB_RL16_SLP`, `_SLP_ARC`, `_TRX` |
| 34 | Relevé 18 | 16 | 34 | Québec | `UB_RL18_SLP`, `_SLP_ARC`, `_TRX` |
| 36 | Relevé 3 | 15 | 36 | Québec | `UB_RL3_SLP`, `_SLP_ARC`, `_TRX` |
| 37 | T4FHSA | 17 | 37 | CRA | `UB_T4FHSA_SLP`, `_SLP_ARC`, `_TRX`, `_TRX_ARC` |

Nguồn mapping: `YearEnd.aspx`, `YearEnd.aspx.cs::GetViewIndex`, `UBT619InfoUpdate`, `UBCRASubmissionUpdate`, `UBExport/CRASubmission.cs` và `UBExport/CReleve.cs`.

## 3. Điều khiển màn hình

### 3.1. Tax year

`Page_Load` gọi `CBase.LoadSimpleDropDownListArray(..., "UBYearEndComboList")`. UI mặc định năm trước, nhưng từ tháng 11 trở đi mặc định năm hiện tại. Stored procedure lại xây danh sách theo rule riêng: phần lớn bắt đầu từ 2017; một số DSID bắt đầu từ 2020; P18/P19 chỉ trả về `iLastYear`, với mốc đổi năm nằm ở tháng 5.

Hệ quả: “năm mặc định trên trang” và “tập năm DB cho phép” là hai rule khác nhau. Khi debug dropdown rỗng/sai năm phải kiểm tra cả C# lẫn `UBYearEndComboList`.

### 3.2. Tabs và thao tác

`OnReportTypeChanged` chọn view và cấu hình tab theo report type:

- Phần lớn có `Pending`, `Approved`, `File`.
- RRSP có thêm luồng tax receipt riêng và các tab `PendingXML`, `ApproveXML`, `File`.
- T3/T5 có tab `Omnibus`.
- T550 có đủ tab trong markup; code đổi report type đưa nó về `Pending`.

Intermediary được nạp qua `Intermediary.UpdateDropDownList`. `Page_Load` cũng gọi `CBase.IsPageValid`; quyền hành động chi tiết còn nằm rải rác trong page/BLL/SP, không nên suy ra rằng chỉ qua được page validation là có mọi quyền.

## 4. Luồng Pending → tạo slip

Các BLL như `CT3`, `CT4A`, `CT4RSP`, `CT4RIF`, `CT5`, `CT5008`, `CNR4`, `CRL*`, `CP18`, `CP19` có chung một họ hàm:

- `PendingList`: lấy nguồn đủ điều kiện.
- `PendingSelectionUpdate`: ghi trạng thái chọn theo user.
- `ProcessPendingTaggedItems`/`ProcessPendingItems`: xử lý các dòng đã tag.
- `ApprovedList`, `ApprovedSelectionUpdate`: quản lý danh sách slip đã tạo.
- `ItemInfo`/`ItemUpdate`: xem và sửa chi tiết.
- `ScanAll`: rà lại dữ liệu nguồn.

Các lựa chọn Pending/Approved được lưu trong bảng vật lý dạng `UB_<Type>PendingSelectionTMP` và `UB_<Type>ApprovedSelectionTMP`, khóa theo `iUserID`. Vì vậy trạng thái checkbox có tính theo user nhưng vẫn là dữ liệu DB, không phải chỉ nằm trong browser session.

### 4.1. Ví dụ đã truy vết: T4RSP

`YearEnd_T4RSP.aspx.cs` gọi BLL `CT4RSP`, BLL gọi `UBT4RSPProcessPendingTaggedItems`. SP đọc `UB_T4RSPPendingSelectionTMP`, lặp từng dòng và gọi `UBT4RSPProcessOneItem`.

Rule trong T4RSP SP gồm:

- Không cho tax year tương lai.
- Với tax year hiện tại, chỉ tiếp tục cho plan inactive.
- Yêu cầu nominee plan.
- Client phải hợp lệ; SIN đủ 9 chữ số; địa chỉ và postal code phải có.
- Loại giao dịch đã liên kết với slip chưa cancel.
- Quy đổi amount sang CAD bằng `GetTrustAmountCAD`.
- Tính taxable amount, withholding tax, excess, HBP, LLP, marriage breakdown và ALDA.

Đây là rule xác minh riêng cho T4RSP. Không mặc định rằng mọi form đều dùng đúng các điều kiện này; từng `ProcessOneItem` phải được đọc riêng khi sửa nghiệp vụ.

### 4.2. TFSA không chạy background thread trong luồng active

`UBClasses/TFSAProcessing.cs` có class thread xử lý batch 5, callback và `Abort`, dùng `UBYearEndTagList`. Tuy nhiên block khởi tạo class này trong `YearEnd_TFSA.aspx.cs` đang bị comment. Luồng active gọi đồng bộ `CTFSA.ProcessPendingItems`.

## 5. Approved, sửa, cancel và release

Từ danh sách Approved, tùy report, user có thể mở item, sửa dữ liệu, đưa về Pending, cancel hoặc release.

### 5.1. Release cho client khác với filing

`UBT4RSPSlipRelease` cho thấy `iApproved` là cờ phát hành:

- Release chọn dòng `iApproved = 0`, có object data và không ở trạng thái no-transaction; sau đó ghi `iApproved = 1`, ngày và user.
- Nếu client chọn electronic delivery, SP tạo `UBNotifyInternal` với message type 13, trừ trường hợp cấu hình không gửi notification.
- Unrelease đưa `iApproved` về 0.

Do đó một slip có thể đã tạo nhưng chưa release cho client, hoặc đã release nhưng electronic filing vẫn chưa Submitted.

### 5.2. Original/Amended/Cancelled

`GetCRASubmissionType` ánh xạ `O/A/C`. Ví dụ `UBT4RSPCancelItem` chỉ nhận slip đã Submitted (`iStatus = 4`), tạo slip mới trạng thái Pending với `rpt_tcd = 'C'`, lưu liên kết bản gốc (`iOrgID`/original type), sao chép transaction mapping và bỏ dòng hiện hành cũ.

Đây tiếp tục là bằng chứng cụ thể của T4RSP; cần kiểm tra SP tương ứng trước khi áp cùng cách xử lý cho form khác.

## 6. Create XML và hàng đợi export

Nút “Create XML” trong các fragment không tự render file. Handler mở `PanelT619`.

`PanelT619.aspx.cs::SaveT619` thực hiện:

1. Validate thông tin transmitter/contact.
2. Gọi `CT619.UpdateInfo` → `UBT619InfoUpdate`, lưu `UB_T619TRM`.
3. Kiểm tra có Approved item được tag; không có thì trả mã 10.
4. Ánh xạ report type sang export type 20–37.
5. Gọi `UBExportAddRequestT`, tạo `UB_ExportRequest` và `UB_ExportRequestItem`.
6. Chuyển các slip liên quan sang `iStatus = 2` (In progress).

Option save-only chỉ lưu transmitter, không tạo request. Mã trả về lớn hơn 20 biểu thị lỗi request/quyền.

### 6.1. Bộ sinh XML

- `UBExport/CRASubmission.cs` tạo root `<Submission>`, khối `<T619>`, `<Return>` và dispatch export type 20–30, 35, 37 đến serializer tương ứng. T550 là phần tử trực tiếp trong submission.
- `UBExport/CReleve.cs` tạo `<Transmission>` và dispatch Relevé 1/2/3/16/18 theo export type 31/32/36/33/34.
- P18/P19 được xác nhận là Part XVIII/Part XIX của nhóm CRS/FATCA qua element `PartXVIIISlip`, `PartXIXSlip` và các summary tương ứng.

Trong phạm vi source còn lại sau khi loại `VFCsvExport`, không tìm thấy call site gọi `CRASubmission.GetXML()` hoặc `CReleveXML.GetXML()`. Có đủ code tạo request, serializer và SP đóng request, nhưng runtime worker/host thực sự gọi serializer chưa được chứng minh trong snapshot này. Không nên đoán tên service/job; cần kiểm tra artefact deploy hoặc scheduler ở môi trường chạy.

### 6.2. Hoàn tất và download file

`UBExportSet` cập nhật request sang trạng thái hoàn tất (mặc định 2), lưu filename/ngày, rồi chuyển linked slips sang `iStatus = 3` và gắn `iFileID`.

`YearEnd.aspx.cs` chỉ download khi:

- `Export.GetInfo` trả request có `iStatus == 2`;
- filename không rỗng;
- file thực sự tồn tại tại full path.

Response dùng content type `application/x-zip-compressed`.

`UBCRAFileList` chỉ trả danh sách cho admin (`IsMemberAdmin(@iUserID) = 1`). `Export.Remove`/`UBExportRemove` từ chối xóa request đã Submitted, và mặc định cũng từ chối khi file chưa ready; nếu xóa hợp lệ, linked slips được trả về trạng thái 1 rồi request/item bị xóa.

### 6.3. Filed/Submitted

`CT619.SubmissionUpdate` gọi `UBCRASubmissionUpdate`. SP yêu cầu file request đã ready (`iStatus = 2`):

- chưa xác nhận nộp: đặt `iSubmissionStatus = 3`;
- đã nộp: đặt `iSubmissionStatus = 4`, bắt buộc ngày không ở tương lai và confirmation number;
- cập nhật cả slip hiện hành và archive theo export type 20–37.

Các mapping status trong UDF:

| Hàm | Mapping |
|---|---|
| `GetCRASubmissionStatus` | 0 Deleted, 1 Pending, 2 In progress, 3 Filed, 4 Submitted |
| `GetCRAFileSubmissionStatus` | 0 Deleted, 1 Pending, 2 Ready, 4 Submitted |

## 7. PDF, receipt và Excel

`WebApp/Main/PdfView.aspx.cs` route các report number active:

| Report no. | Output |
|---:|---|
| 45 | RRSP receipt (`CRRSPReceipt`) |
| 70/71 | T4A/detail và summary |
| 72/73 | Relevé 1/detail và summary |
| 74 | T4RSP |
| 75 | T4RIF |
| 76 | Relevé 2 |
| 77 | T5008 |
| 79 | NR4 |
| 80 | T3 |
| 81 | Relevé 16 |
| 82 | T5 |
| 83 | Relevé 3 |
| 84 | Relevé 18 |
| 85 | T4FHSA |

Các trang TFSA, T550, P18 và P19 không có control PDF active trong markup. Một số code-behind P18/P19/TFSA còn method copy/paste trỏ report 79 (NR4), nhưng không được wiring từ markup; không xem đó là chức năng PDF đang hoạt động.

Một số danh sách có export Excel từ grid. Excel này phục vụ kiểm tra dữ liệu, không thay thế CRA/Revenu Québec XML.

## 8. Bản đồ dữ liệu

| Nhóm | Bảng/đối tượng chính | Vai trò |
|---|---|---|
| Slip hiện hành | `UB_<Type>_SLP` hoặc bảng đặc thù như `UB_TFSA`, `UB_T550` | Snapshot dữ liệu khai thuế đang xử lý |
| Archive | `*_SLP_ARC`, `*_ARC`, `*_TRX_ARC` | Lưu lịch sử/version |
| Transaction mapping | `*_TRX` | Liên kết slip với giao dịch nguồn |
| Tạm chọn theo user | `*PendingSelectionTMP`, `*ApprovedSelectionTMP` | Persist checkbox/tag trước thao tác hàng loạt |
| T619 | `UB_T619Contact`, `UB_T619TRM` | Transmitter/contact metadata |
| Export queue | `UB_ExportRequest`, `UB_ExportRequestItem` | Request, file, export type, tax year, submission status và item |
| RRSP receipt | `UB_TaxReceipt`, `UB_RRSPTaxReceipt`, `UB_RRSPTaxReceiptTrx` | Biên lai contribution tách khỏi RRSP XML slip |
| CRS/FATCA | `UB_P18_*`, `UB_P19_*` | Slip, summary, account holder, controlling person |
| Omnibus | `UB_T3_Omnibus`, `UB_T5_Omnibus`, `*_PlanFund` | Điều chỉnh/phân bổ T3/T5 theo omnibus |

Không nên hiểu mô tả `iStatus` chung trong data dictionary là đúng cho mọi bảng. Với tax slip, dùng UDF và SP cụ thể của module làm chuẩn khi phân tích trạng thái.

## 9. Các họ stored procedure cần biết

Tên chính xác thay đổi theo prefix report, nhưng thường có:

- `*PendingList`, `*PendingSelectionUpdate`, `*ProcessPendingTaggedItems`, `*ProcessOneItem`.
- `*ApprovedList`, `*ApprovedSelectionUpdate`, `*ItemInfo`, `*ItemInfoUpdate`.
- `*Approve2Pending`, `*CancelItem`, `*SlipRelease`, `*ScanAll`.
- `*FileList`, `*FileDetailList`.
- T3/T5: `*OmnibusList`, `*OmnibusInfo`, update dividend/boxes, process và undo.
- Chung: `UBYearEndComboList`, `UBT619InfoUpdate`, `UBExportAddRequestT`, `UBExportSet`, `UBExportRemove`, `UBCRAFileList`, `UBCRASubmissionUpdate`.

## 10. Phát hiện đã xác minh cần xử lý

### 10.1. `UBExportSet` không thể chạy nhánh export type 36–37

Điều kiện ngoài của `UBExportSet` là `iExportType >= 20 AND iExportType <= 35`, nhưng bên trong lại có nhánh cho 36 (RL3) và 37 (T4FHSA). Hai nhánh này không thể tới được. Theo script hiện tại, RL3/T4FHSA có nguy cơ không được chuyển slip sang trạng thái 3 và không gắn `iFileID` qua SP này.

Đây là lỗi logic rõ trong snapshot SQL; trước khi sửa production phải xác nhận stored procedure đang deploy có cùng phiên bản.

### 10.2. Status 3 hiển thị `Unknown` ở file list

`UBCRASubmissionUpdate` đặt request `iSubmissionStatus = 3` cho trạng thái filed/chưa submitted. SP có biến riêng `iSubmissionFileStatus` được đặt 2/4 nhưng biến này không được dùng; câu `UPDATE UB_ExportRequest` ghi `iSubmissionStatus` 3/4. `UBCRAFileList` lại hiển thị qua `GetCRAFileSubmissionStatus`, trong khi UDF này không có nhánh 3. Kết quả là status 3 hiển thị `Unknown`; `GetCRASubmissionStatus` mới định nghĩa 3 là `Filed`.

Cần thống nhất intended label và UDF dùng cho file list trước khi sửa.

### 10.3. C# gọi 32 SP không có definition trong ScriptDB snapshot

Quét các literal SP name được gán cho `SPName` hoặc truyền thẳng vào `SetSP` trong 22 BLL Tax/Year-End cho kết quả 294 tên duy nhất; 262 tên có `CREATE PROCEDURE` trong các file `.sql`; 32 tên không có definition trong workspace:

```text
UBNR4ItemInfoUpdate, UBNR4PlanID,
UBP18ItemInfo, UBP18ItemInfoUpdate, UBP18MemberInfo, UBP18ScanAll,
UBP19ItemInfo, UBP19ItemInfoUpdate, UBP19MemberInfo, UBP19ScanAll,
UBRL1ScanAll, UBRL16ScanAll,
UBRL18ItemInfoUpdate, UBRL18ItemSetProcessed, UBRL18List, UBRL18SelectionUpdate,
UBRL2ScanAll, UBRL3ScanAll,
UBT3ScanAll, UBT4AScanAll,
UBT4FHSAItemInfoUpdate, UBT4FHSAList, UBT4FHSAPlanID, UBT4FHSAScanAll,
UBT4RIFList, UBT4RSPList, UBT5ScanAll, UBT5008ItemInfoUpdate,
UBTFSAItemInfoUpdate, UBTFSAList, UBTFSAMemberInfo,
UBYearEndTagList
```

Điều này chứng minh code package và SQL snapshot không khớp hoàn toàn; chưa đủ bằng chứng kết luận production DB thiếu các SP. Cần đối chiếu schema deploy trước khi debug lỗi “could not find stored procedure”.

### 10.4. Generator host chưa có trong phạm vi

WebApp tạo queue; serializer XML có sẵn; `UBExportSet` đóng queue. Tuy nhiên call site chạy serializer không xuất hiện trong source còn lại sau khi loại `VFCsvExport`. Đây là khoảng trống artefact/deployment cần điều tra, không phải chỗ để suy đoán business logic.

## 11. Cách debug một case Tax/Year-End

1. Xác định report type UI, view index và export type theo ma trận mục 2.1.
2. Kiểm tra tax year/intermediary và row trong `PendingSelectionTMP` theo `iUserID`.
3. Từ event handler, lần sang BLL và đúng `*ProcessPendingTaggedItems`/`*ProcessOneItem`.
4. Kiểm tra dữ liệu nguồn, điều kiện eligibility và transaction đã map vào slip khác chưa.
5. Kiểm tra slip hiện hành, archive và `*_TRX`; phân biệt `iStatus`, `iApproved`, `O/A/C`.
6. Nếu lỗi create XML, kiểm tra `UB_T619TRM`, `UB_ExportRequest`, `UB_ExportRequestItem` và quyền admin/file list.
7. Nếu request treo In progress, xác minh generator host ngoài WebApp và xem request có được `UBExportSet` cập nhật hay không.
8. Nếu download lỗi, kiểm tra request status 2, filename và file vật lý.
9. Nếu submit lỗi, kiểm tra ngày, confirmation number và `iSubmissionStatus`.

## 12. Checklist khi bổ sung/sửa một report

- Cập nhật static dropdown và `GetViewIndex`.
- Include đúng `YearEnd_<Type>.aspx`; wiring control/event trong code-behind.
- Bổ sung BLL và đầy đủ SP Pending/Approved/File/Release/Cancel theo nhu cầu.
- Tạo bảng slip, archive, transaction mapping và selection TMP.
- Bổ sung mapping export type đồng nhất trong `UBT619InfoUpdate`, `UBCRASubmissionUpdate`, `UBExportSet`, `UBExportRemove`.
- Bổ sung serializer và dispatch trong `CRASubmission` hoặc `CReleve`.
- Nếu có PDF, thêm route trong `PdfView.aspx.cs` và kiểm tra control thật sự active.
- Kiểm tra status UDF, quyền action, client delivery/notification và migration SQL deploy.
- Test Original, Amended, Cancelled; release/unrelease; create/remove request; ready/filed/submitted.

## 13. Thứ tự đọc source đề xuất

1. `WebApp/Main/YearEnd.aspx` và `YearEnd.aspx.cs`.
2. Fragment `WebApp/Main/YearEnd_<Type>.aspx(.cs)` của form cần điều tra.
3. BLL tương ứng trong `UBClasses/<Type>.cs`.
4. Stored procedure tương ứng trong `ScriptDB/000_4_CreateSP.sql` và UDF trong `000_3_CreateUDF.sql`.
5. `WebApp/Main/PanelT619.aspx.cs`, `UBClasses/T619.cs`, `UBClasses/Export.cs`.
6. `UBExport/CRASubmission.cs` hoặc `UBExport/CReleve.cs`, rồi serializer cụ thể.
7. `WebApp/Main/PdfView.aspx.cs` và `VieFUNDPdf/` nếu điều tra PDF.

## 14. Tài liệu liên quan

- [Domain Glossary](../../getting-started/domain-glossary.md)
- [Table Description](../../Database/Table_Description.md)
- [Database Access](../../viefund-framework/database-access.md)
- [PDF Workflow](../../viefund-framework/pdf/pdf-workflow.md)
- [SP Catalog](../../reference/sp-catalog/README.md)
