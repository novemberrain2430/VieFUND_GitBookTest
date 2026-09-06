# PDF Workflow — Luồng tạo, lưu và phân phối tài liệu

> Trạng thái: đã đối chiếu trực tiếp với source ngày 2026-09-04. Tài liệu này mô tả code đang tồn tại, không suy diễn từ tên màn hình. `VFCsvExport` nằm ngoài phạm vi theo yêu cầu.

## 1. Kết luận nhanh

PDF trong VieFUND không đi qua một pipeline duy nhất. Có bốn kiểu xử lý cùng tồn tại:

1. Vẽ report từ đầu bằng `PdfBuilder`, `CReport` và các generator chuyên biệt.
2. Điền hoặc flatten AcroForm template bằng `CForm`.
3. Ghép nhiều PDF, thêm barcode/watermark hoặc sửa PDF đã có.
4. Lấy binary đã lưu trong DB/TMP rồi trả thẳng về browser.

Hai endpoint cùng tên nhưng khác chức năng:

- `WebApp/Main/PdfView.aspx.cs`: router chính, có 98 nhãn `case` và còn phục vụ file/XML ở một số route.
- `WebClient/Main/PdfView.aspx.cs`: router rút gọn, chỉ có `98`, `99`, `26`, `1`; route mặc định cũng đọc report object.

Các điểm quan trọng đã sửa so với bản tài liệu cũ:

- Không phải mọi generator đều chỉ dùng `MemoryStream`; merge và một số utility có ghi file vật lý rồi đọc lại.
- `CreateDoc(bool)` dùng bottom margin `50`, không phải `45`.
- `HeaderType`/`FooterType` có nhiều biến thể hơn bảng cũ.
- Font phổ biến là Helvetica/Verdana, nhưng code có hỗ trợ embed custom font.
- `T4RSP` là slip thu nhập RRSP; receipt đóng góp RRSP là luồng `CRRSPReceipt`, route `45`.
- `ClientPerformance.cs` không phải một phần của partial class `CReport`.
- `CBulkConversionBasket.cs` và `TransferDoc.cs` có trên disk nhưng không được compile trong project hiện tại.

## 2. Phạm vi source và dependency

Project [`VieFUNDPdf.csproj`](../../../VieFUNDPdf/VieFUNDPdf.csproj) là class library .NET Framework 4.5.

| Hạng mục | Kết quả kiểm kê |
|---|---:|
| File `.cs` ngay dưới `VieFUNDPdf/` | 54 |
| Tổng dung lượng source ở cấp này | 3.629.639 byte, khoảng 3,46 MiB |
| File nghiệp vụ được compile | 52 |
| Compile item nếu tính `Properties/AssemblyInfo.cs` | 53 |
| File có trên disk nhưng không compile | `CBulkConversionBasket.cs`, `TransferDoc.cs` |

`CPDF.cs` có 19.074 dòng và chứa ba thành phần lõi:

- `CustomCellLayout`: tạo field tương tác trong cell.
- `TwoColumnHeaderFooter`: page event cho header/footer.
- partial class `PdfBuilder`: helper tạo, định dạng, ghép và sửa PDF.

`SysPlan.cs` là phần còn lại của partial class `PdfBuilder`. `CForm.cs` có 3.095 dòng, phụ trách AcroForm/template.

Dependency được khai báo trực tiếp trong project:

| Dependency | Vai trò thấy trong source |
|---|---|
| `PdfBase.dll` | API PDF kiểu `Document`, `PdfWriter`, `PdfReader`, `PdfStamper`, `AcroFields`, `PdfCopy` |
| `Spire.Barcode.dll` | Tạo barcode |
| `System.Web.DataVisualization` | Vẽ chart thành ảnh để nhúng vào report |
| `UBConnection.dll` | `CDatabase`, gọi stored procedure |
| `UBStatic.dll` | Convert/format và utility chung |

Không có source của `PdfBase.dll` trong project này. Vì vậy tài liệu chỉ khẳng định API mà caller đang dùng, không khẳng định nội bộ DLL ngoài những gì có thể quan sát từ binary/reference.

## 3. Kiến trúc thực tế

```text
WebApp/WebClient page
  -> tạo URL PdfView với Param1..Param6
  -> PdfView xác thực session/connection và giải mã ID
  -> chọn một trong các nhánh
       a. đọc binary đã lưu
       b. gọi report generator
       c. điền PDF template
       d. ghép/sửa/watermark/barcode
       e. đọc file hoặc XML không phải PDF
  -> nhận byte[] + tên file + MIME type
  -> inline hoặc attachment
```

### 3.1 Report vẽ từ đầu

Mẫu phổ biến:

```csharp
MemoryStream stream = new MemoryStream();
Document doc = PdfBuilder.CreateDoc(isLandscape);
PdfWriter writer = PdfBuilder.CreateWriter(doc, stream);

PdfBuilder.StartPdf(/* metadata, header/footer, language, logo... */);
// Thêm PdfPTable, PdfPCell, Phrase, Image, chart...
doc.Close();

byte[] result = stream.ToArray();
```

Các generator không hoàn toàn đồng nhất. Một số tự mở/đóng document; một số nhận `DataSet`, một số tự gọi SP; một số lưu kết quả vào DB/TMP ngay trong generator.

### 3.2 Form/template

`CForm` đọc physical path bằng `PdfReader`, điền `AcroFields` bằng `PdfStamper`, sau đó trả `byte[]`.

| API | Hành vi |
|---|---|
| `CreatePDF` | Điền dữ liệu; giữ field editable; có thể xóa signature field và rename field |
| `CreatePDFFlat` | Điền dữ liệu; `FormFlattening = bFlat`; nếu flatten thì tắt rename |
| `CreatePDFBlank` | Trả template trắng; có thể rename field; không flatten |
| `CreateFormPdfObj*` | Lấy dataset/template từ DB rồi chọn cách fill/merge phù hợp nghiệp vụ |

### 3.3 Đọc lại object đã lưu

`PdfBuilder.GetPdfObjDataX` gọi `UBGetPdfObj` với:

- `iItemID`
- `iType`
- `iLinkedID`
- `iOptions`

Kết quả đọc từ cột `ObjData`. Với một số loại object và `iOptions` từ `2` đến `4`, method còn thêm watermark `DUPLICATE`, `SPECIMEN` hoặc `VOID` sau khi đọc.

### 3.4 Merge và file tạm

`MemoryStream` là cách phổ biến nhưng không phải quy tắc tuyệt đối:

- `PdfBuilder.CreateWriter` có overload cho cả `MemoryStream` và `FileStream`.
- `CForm` dùng `PdfCopyFields(new FileStream(...))` khi ghép nhiều form, đọc file về `byte[]`, rồi `File.Delete`.
- `WebApp.PdfView.FormFileName` sinh path dưới `TMP\` cho nhiều route merge/report.
- Một số generator khác cũng có cặp ghi file/đọc lại/xóa file.

Do đó host phải có quyền ghi thư mục TMP và cần xử lý file sót nếu exception xảy ra giữa chừng.

## 4. `PdfBuilder`: page, writer, header/footer và font

### 4.1 Page setup

| API | Mặc định thực tế |
|---|---|
| `CreateDoc(false)` | Letter portrait, margins `50, 30, 50, 50` |
| `CreateDoc(true)` | Letter landscape, cùng margins |
| `CreateDocWithMargin(...)` | Giá trị `0` được thay bằng left `50`, right `30`, top `50` hoặc `86` khi `bMStyle`, bottom `45` |
| `CreateDoc(..., L, R, T, B)` | Dùng đúng margins caller truyền |

Các overload `CreateWriter` hiện không bật encryption. Những lệnh `SetEncryption` trong `CPDF.cs` đều đang comment.

### 4.2 HeaderType

`TwoColumnHeaderFooter.DisplayHeader` ánh xạ như sau:

| `HeaderType` | Handler/hành vi |
|---:|---|
| 0 | `StartPage1`: title trái/phải và separator line |
| 1 | `StartPage2`: layout review/report riêng |
| 2 | Không render header |
| 3 | `StartPage3` |
| 4 | `StartPage4`: logo/header từ dataset |
| 5 | `StartPage5`: account-statement style; được gọi ở `OnEndPage` |
| 6 | `StartPage6` |
| 7 | `StartPage_FundFact`; `OnEndPage` cũng bỏ footer |

`SetLogoOnHeader(DataSet)` chỉ kích hoạt nếu dataset có table `Logo`, có ít nhất một row và `bShowLogoHeader == 1`. Contract đọc các cột `FileData`, `iHeaderOffsetY`, `iPosX`, `iPosY`, `iWidth`, `iHeight`, rồi đổi `HeaderType` thành `4`.

### 4.3 FooterType

| `FooterType` | Handler/hành vi |
|---:|---|
| 0 | `EndPage1`: footer thường, page X of Y, user/time/dealer tùy cờ |
| 1 | `EndPage2`: footer chuyên biệt cho review |
| 6 | `EndPage6`: bỏ footer trang đầu |
| 7 | `EndPage_NoFooter`: tên gây nhầm; vẫn có thể vẽ message/dealer và hai line |
| 8 | `EndPage_8`: vùng text Verdana phía cuối trang |
| khác | Không có handler |

### 4.4 Font và ngôn ngữ

- Header/footer mặc định tạo Helvetica và Helvetica Bold với CP1252, không embed.
- Nhiều helper/report gọi `FontFactory.GetFont("Verdana", ...)`.
- `PdfBuilder.GetCustomFont(path)` tạo font CP1252 với `EMBEDDED`; nếu lỗi thì trả `null`.
- Chuỗi song ngữ thường chọn bằng `Lg`: `0` English, `1` French.
- `FormatText`/`FixNumberCulture` được dùng để format số, tiền và phần trăm theo ngôn ngữ/context.

Không nên kết luận rằng toàn bộ PDF chỉ dùng Helvetica hoặc mọi ký tự Unicode đều được hỗ trợ. CP1252 và font có trên host vẫn là giới hạn thực tế của nhiều nhánh.

## 5. `CForm`: contract DataSet -> AcroForm

### 5.1 Nguồn dữ liệu/template

`GetFormSet` gọi `UBFormClientSet` với `DBID`, `iUserID`, `Lg`, `iClientID`, `iPlanID`, `iFormID`, `iOptions`. Sau khi nhận `DataSet`, mỗi table có row được đổi tên bằng giá trị `RecType` của row đầu.

`CreateFormPdfObj` kỳ vọng tối thiểu:

- table `FormData`, gồm `FullFileName`, `VersionStr`, `iFileCount`, `iBarCode`, `FileName`;
- table `FormFile` khi một form gồm nhiều PDF template;
- các table dữ liệu khác để map vào AcroForm fields.

`FullFileName` được truyền trực tiếp vào `PdfReader`; đây là physical path, không phải virtual URL.

### 5.2 Quy tắc map field

`FillFromDataSet` bỏ qua table `FormData`, còn lại chuyển từng table qua `FillFromTable`.

| Trường hợp | Quy tắc |
|---|---|
| Table có tối đa 3 cột và chứa `TagName`, `ValStr` | Gán trực tiếp `TagName -> ValStr` |
| `Identification`, `JointIdentification`, `CorpDirector`, `CorpOwner`, `ClientFATCA`, `JointClientFATCA`, `TrxListTax` | Bắt đầu postfix row từ `1` |
| Table có cột `Prefix` | Prefix tên field |
| `PlanInfo`, `BenInfo`, `CGInfo`, `JointInfo`, `JointIdentification`, `PlanSpouse` | Ép dùng prefix |
| Có `PlanIndex` | Đồng thời tạo tên field kiểu WinFUND cũ và tên có sub-index |
| Cột `RecType`, cột bắt đầu bằng `i`, `Prefix`, `PlanIndex` | Không gán vào form |

Việc bỏ mọi cột bắt đầu bằng `i` là convention hard-code; thêm field PDF mới có tên như vậy sẽ không được fill bởi pipeline này.

### 5.3 Signature field

Các nhóm tên được nhận diện gồm `sig`, `init`, `date` và biến thể `o...` cho:

- client/joint client: tối đa 4;
- representative: tối đa 4;
- witness: tối đa 2;
- beneficiary và contingent guardian: tối đa 4;
- compliance: tối đa 2;
- self: một bộ.

Khi `bRemoveSig = true`, `CreatePDF` xóa các field trong giới hạn trên. Khi merge form editable, `RenameFieldForm` thêm hậu tố `_X_<iPostFix>` cho field thường nhưng giữ nguyên field được nhận diện là signature/e-sign field.

## 6. Partial class và nhóm generator

### 6.1 Partial class `CReport`

Có đúng 13 file khai báo `partial class CReport`:

`CReport.cs`, `AccountSummary.cs`, `AUACurrent.cs`, `CAssetByFund.cs`, `CClientKYC.cs`, `ClientReportAdhoc.cs`, `Commission.cs`, `Compliance.cs`, `CPayroll.cs`, `FamilyReport.cs`, `Orders.cs`, `PSPFileReport.cs`, `QuarterAUA.cs`.

`ClientPerformance.cs` khai báo partial class riêng tên `ClientPerformance`; không được tính vào `CReport`.

### 6.2 Generator độc lập đáng chú ý

| Nhóm | Source chính |
|---|---|
| Order/trading | `OrderReceipt.cs`, `TradeConfirmation.cs`, `CTradeBlotter.cs`, `CTrxRecap.cs`, `CBulkSwitchBasket.cs` |
| Form/GIC/transfer | `CForm.cs`, `GIC.cs`, `GICConfirmation.cs`, `CTransferDoc.cs` |
| Trust/cash | `CTrustAccountPdf.cs`, các handler BLL gọi từ `PdfView` |
| Compliance/KYC | các phần `Compliance.cs`, `CClientKYC.cs`, `CRiskAssessmentPdf.cs`, `Uniformity.cs` |
| Report/AUA | các phần `CReport`, `ClientPerformance.cs`, `FamilyReport.cs`, `CAssetByFund.cs` |
| Tax | 13 class slip liệt kê ở mục 8 |

`CBulkConversionBasket.cs` dù có source nhưng không nằm trong `VieFUNDPdf.csproj`; không được coi là chức năng active chỉ dựa trên việc file tồn tại.

## 7. Endpoint `PdfView`

### 7.1 Query contract chung

| Param | Ý nghĩa thực tế |
|---|---|
| `Param1` | Mã route dạng string |
| `Param2` | Thường là chuỗi mã hóa chứa ba số `iID`, `iRequestID`, `iClientID` |
| `Param3` | Session ID do caller truyền |
| `Param4` | Payload route-specific; rất nhiều route yêu cầu chuỗi bắt đầu bằng `_`, sau đó tách bằng `|` |
| `Param5` | Option route-specific |
| `Param6` | Option/ngôn ngữ hoặc điều khiển inline/attachment tùy route |

`Param4..6` không có DTO/schema chung. Ý nghĩa chỉ xác định được theo từng `case`.

### 7.2 Xác thực ở WebApp

Luồng [`WebApp/Main/PdfView.aspx.cs`](../../../WebApp/Main/PdfView.aspx.cs):

1. Đọc `Param1..6`.
2. Riêng route `888`, parse `Param2` thẳng thành `iID` rồi xóa `ObjID`.
3. Mọi route khác `888` yêu cầu `Param3 == Session.SessionID.ToUpper()` và `ObjID` không rỗng.
4. Mọi route, kể cả `888`, phải qua `CBase.GetConnectionParam` để lấy `iUserID`, `DBIDStr`, `DSIDStr`.
5. Nếu còn `ObjID`, gọi `CBase.GetDec3Number` để giải mã bộ ba ID.
6. Chỉ nhóm có numeric route `< 4` bị generic check rằng cả ba ID không đồng thời bằng `0`.

Session-ID check không thay thế authorization ở BLL/SP. Đặc biệt route `888` bỏ qua check token session truyền qua URL; quyền truy cập object cần được xác minh trong `CWFPayable.GetPdf` và tầng DB.

### 7.3 Catalog route WebApp

Bảng dưới đây nhóm đủ các nhãn `case` hiện có; route dùng chung một block được ghi chung.

| Route | Nghiệp vụ/handler chính |
|---|---|
| `98`, `99` | Đọc `PdfObj`; `98` có language/options và watermark tùy option |
| `1` | `CReport.GetObjData` |
| `2` | Commission payroll đơn hoặc list |
| `3` | Client statement list với nhiều option |
| `4`, `5`, `6`, `21`, `32` | Các loại object TMP của `CReport` |
| `7`, `12` | Pending/sent order reports |
| `8`, `9`, `10`, `11`, `14`, `23` | Trust deposit/transaction/supplier/settlement/cheque |
| `13`, `22`, `50` | Plan KYC/suitability/compliance object |
| `15`, `25`, `29`, `38` | Commission payable/expense/preview/tagged file |
| `16`, `17`, `26` | Current AUA, family TMP, client summary |
| `18`, `39`, `42`, `43`, `44` | GIC reports, ticket, rate file, application, confirmation |
| `19`, `20`, `33` | Order receipt thường/basket/RRIF schedule |
| `24` | Client notes |
| `27`, `34`, `36`, `37`, `40`, `41` | Form RRIF, loan, trade ticket, general form, blank form |
| `28`, `35`, `46`, `55`, `56`, `57`, `58`, `59`, `200` | Order/trade confirmation/blotter/recap/cash/bulk basket |
| `30`, `31` | Client/family labels |
| `45` | RRSP contribution receipt (`CRRSPReceipt`) |
| `47` | Có `case` nhưng block rỗng; hiện trả no-data |
| `60`, `61` | New-account/opening detail và summary |
| `62`, `63` | KYC/account update detail và summary |
| `64`, `65` | New-plan detail và summary |
| `66`, `67` | Trade suitability detail và summary |
| `68` | Incomplete KYC |
| `70`-`77`, `79`-`85` | Tax slips/summaries; xem mục 8 |
| `90`-`97` | Compliance trend reports: frequent/excessive commission/short-term/DSC/redemption fee/two-sided/switch load/low MER |
| `100` | Đọc imported file; MIME không bắt buộc là PDF |
| `101` | Onboarding content XML (`text/xml`) |
| `102`, `103` | Uniformity snapshot/review |
| `104` | Risk assessment PDF |
| `105` | Plan trust/cash balance |
| `150`, `151` | Transfer document generate/read |
| `888` | Workflow payable file qua `CWFPayable.GetPdf` |
| `999` | TMP document qua `CDocumentDef.GetTMP` |

Không có route `78`. Comment trong source ghi TFSA không nên có route này.

### 7.4 WebClient khác WebApp

[`WebClient/Main/PdfView.aspx.cs`](../../../WebClient/Main/PdfView.aspx.cs) luôn kiểm tra session ID và ObjID, dùng `GetConnectionParamWC`, rồi hỗ trợ:

| Route | Hành vi |
|---|---|
| `98` | `GetPdfObjDataX` |
| `99` | `GetPdfObjData` |
| `26` | Generate client summary |
| `1` và default | `CReport.GetObjData(..., true)` |

Không được copy giả định route từ WebApp sang WebClient.

### 7.5 Response behavior

WebApp:

- attachment nếu `Extra3 == "1"`;
- hoặc file lớn hơn 16 MiB và `Extra3 != "2"`;
- còn lại inline.

WebClient:

- attachment nếu `Extra3 == "1"` hoặc file lớn hơn 5 MiB;
- không có override `"2"` để ép inline file lớn.

Cả hai dùng `Content-Disposition: ...;filename=` bằng nối chuỗi, rồi `BinaryWrite`, `Flush`, `Close`, `End`. WebApp hiện alert `Cannot generate pdf file` khi không có data; WebClient chỉ đóng cửa sổ.

## 8. Tax slip PDF

### 8.1 Route active

| Route | Class | Tài liệu |
|---:|---|---|
| 70 | `CT4APdf` | T4A |
| 71 | `CT4APdf.PdfObjSummary` | T4A summary |
| 72 | `CRL1Pdf` | RL-1 |
| 73 | `CRL1Pdf.PdfObjSummary` | RL-1 summary |
| 74 | `CT4RSPPdf` | T4RSP — RRSP income slip |
| 75 | `CT4RIFPdf` | T4RIF |
| 76 | `CRL2Pdf` | RL-2 |
| 77 | `CT5008Pdf` | T5008 |
| 79 | `CNR4Pdf` | NR4 |
| 80 | `CT3Pdf` | T3 |
| 81 | `CRL16Pdf` | RL-16 |
| 82 | `CT5Pdf` | T5 |
| 83 | `CRL3Pdf` | RL-3 |
| 84 | `CRL18Pdf` | RL-18 |
| 85 | `CT4FHSAPdf` | T4FHSA |

Các source tương ứng là `T4APdf.cs`, `RL1Pdf.cs`, `T4RSPPdf.cs`, `T4RIFPdf.cs`, `RL2Pdf.cs`, `T5008Pdf.cs`, `NR4Pdf.cs`, `T3Pdf.cs`, `RL16Pdf.cs`, `T5Pdf.cs`, `RL3Pdf.cs`, `RL18Pdf.cs`, `T4FHSAPdf.cs`.

### 8.2 Pattern đã xác minh

Ví dụ `T4RSPPdf.cs`:

1. Gọi SP lấy item/template data và đặt tên table theo `RecType`.
2. Nếu có cached `ObjData` và không force, có thể trả lại object cũ.
3. Nếu cần regenerate, gọi `CForm.CreatePDFFlat` với template path.
4. Có thể thêm watermark `SPECIMEN` hoặc `DUPLICATE`.
5. Lưu binary bằng `UBT4RSPSavePdfObj` trong nhánh option cho phép cache.
6. `ListPdfObj` ghép nhiều slip bằng `PdfCopy`; summary cũng điền template.

Các class khác dùng cùng mô hình tổng quát nhưng SP và chi tiết page không hoàn toàn giống nhau. `T5008Pdf.cs` và `RL18Pdf.cs` còn có nhánh `X` để tạo/ghép nhiều trang detail và summary.

Tax Year-End nghiệp vụ đầy đủ nằm tại [Tax & Year-End module guide](../../topics/tax-yearend/module-guide.md). Không đồng nhất `T4RSP` với route `45`: route `45` là receipt đóng góp RRSP, route `74` là T4RSP income slip.

## 9. Lưu trữ, tenant và lifecycle

| Giai đoạn | Cơ chế thấy trong source |
|---|---|
| Input | `DataSet` từ SP, PDF template path, binary DB/TMP hoặc file path |
| Build | `Document`/`PdfWriter`, `PdfStamper`, `PdfCopy`/`PdfCopyFields` |
| Intermediate | `MemoryStream` và/hoặc file trong `TMP\` |
| Persist | SP riêng từng nghiệp vụ hoặc `UBGetPdfObj`/TMP object framework |
| Delivery | `PdfView` trả MIME, disposition, length và bytes |

`CDatabase` chọn database từ `DBIDStr`; `DSID` được truyền riêng vào nhiều SP/generator. Vì vậy tenant isolation không do thư viện PDF tự enforce. Caller và SP phải giữ đúng cặp DBID/DSID/user/object.

## 10. Error handling và điểm cần theo dõi

### 10.1 Quan sát trực tiếp

1. `WebApp.PdfView` chỉ bọc phần đọc query string trong `try/catch`; phần switch lớn không có catch tổng.
2. Nhiều route gọi `Extra1.Substring(1)` và truy cập `SearchStrArray[index]`; mức guard khác nhau theo từng route.
3. Nhiều helper/generator bắt exception rồi trả `null`, `false` hoặc giá trị mặc định mà không log đầy đủ.
4. Route `47` là case rỗng.
5. Lệnh bật PDF encryption trong các overload writer đang bị comment.
6. Tên file tạm do `FormFileName` ghép user ID với timestamp không zero-pad và chỉ đến giây.
7. `Content-Disposition` nối filename trực tiếp, không quote/encode tại endpoint.
8. `TwoColumnHeaderFooter.OnOpenDocument` bắt `DocumentException`/`IOException` nhưng bỏ qua exception.

### 10.2 Rủi ro/suy luận cần xác minh trước khi sửa

- Payload thiếu `_`, thiếu phần tử hoặc `null` có thể gây exception ngoài luồng no-data thông thường.
- Hai request cùng user/prefix trong một giây có khả năng đụng tên file tạm; cần test trên host thật vì prefix khác nhau theo route.
- Exception giữa ghi và xóa có thể để lại file trong `TMP\`; cần kiểm tra job dọn rác/deployment config.
- Route `888` cần audit authorization sâu hơn vì bỏ qua token session truyền qua URL.
- Filename từ object/DB có thể ảnh hưởng response header; cần chuẩn hóa CR/LF, quote và RFC-compatible encoding.
- Không nên giả định PDF được bảo vệ bằng password/encryption chỉ vì helper có code mẫu đã comment.

## 11. Checklist khi thêm hoặc sửa PDF

### Thêm report vẽ từ đầu

- Xác định generator có tự gọi SP hay chỉ nhận `DataSet`.
- Chọn page size/margins và `StartPdf*` đúng layout.
- Đóng `Document` trước khi đọc `MemoryStream`.
- Nếu thêm file source mới, kiểm tra `VieFUNDPdf.csproj` có `Compile Include`.
- Quyết định rõ cache/persist: SP nào, key gồm những ID nào, khi nào force refresh.

### Thêm form template

- Xác nhận `FullFileName` là physical path tồn tại trên host.
- Đối chiếu chính xác tên AcroForm field với `FillFromTable`.
- Không dùng prefix `i...` cho field cần fill nếu vẫn dùng mapper hiện tại.
- Chọn editable hay flatten; nếu merge editable thì xử lý trùng field name.
- Kiểm tra giới hạn signer và convention `sig/init/date`.

### Thêm route

- Ghi contract `Param2`, `Param4..6`; không tái sử dụng `Extra3` cho cả language lẫn disposition nếu có thể tránh.
- Validate độ dài mảng trước mọi index và validate string trước `Substring(1)`.
- Thực thi authorization theo user/DSID/object trong BLL/SP, không chỉ session-ID equality.
- Xác định route cần có ở WebApp, WebClient hay cả hai.
- Chuẩn hóa output filename/MIME và xóa file tạm trong `finally`.
- Test inline, attachment, file lớn, null data và concurrent request.

### Sửa tax slip

- Kiểm tra cả single, list, summary và nhánh `X` nếu class có.
- Test cached object và force-regenerate.
- Test option original/duplicate/specimen/void.
- Kiểm tra language, template version, nhiều trang và save-object SP.
- Đối chiếu với [Tax & Year-End](../../topics/tax-yearend/module-guide.md), không chỉ với `PdfView`.

## 12. Checklist debug production

1. Xác nhận request đi vào WebApp hay WebClient.
2. Ghi lại `Param1` và shape của payload, nhưng không log dữ liệu nhạy cảm/ID mã hóa nguyên văn nếu policy cấm.
3. Kiểm tra session, `GetConnectionParam*`, DBID, DSID và user.
4. Giải mã và đối chiếu vai trò thực tế của `iID`, `iRequestID`, `iClientID` theo route.
5. Kiểm tra SP trả đúng table name/`RecType`/cột contract.
6. Với form, kiểm tra template path, permission và AcroForm field names.
7. Với merge, kiểm tra TMP permission, collision và file sót.
8. Với cached PDF, thử force-regenerate trước khi kết luận template lỗi.
9. Với browser, kiểm tra MIME, filename, threshold inline/attachment và response đã bắt đầu hay chưa.
10. Nếu generator trả `null`, đọc catch block bên trong vì nhiều nơi không propagate exception.

## 13. Bằng chứng source chính

| Kết luận | Source đối chiếu |
|---|---|
| Project/compile/dependency | [`VieFUNDPdf.csproj`](../../../VieFUNDPdf/VieFUNDPdf.csproj) |
| Core builder, header/footer, font, merge, PdfObj | [`CPDF.cs`](../../../VieFUNDPdf/CPDF.cs), [`SysPlan.cs`](../../../VieFUNDPdf/SysPlan.cs) |
| Template/form/signature mapping | [`CForm.cs`](../../../VieFUNDPdf/CForm.cs) |
| Router đầy đủ | [`WebApp/Main/PdfView.aspx.cs`](../../../WebApp/Main/PdfView.aspx.cs) |
| Router web-client | [`WebClient/Main/PdfView.aspx.cs`](../../../WebClient/Main/PdfView.aspx.cs) |
| Tax pattern cơ bản | [`T4RSPPdf.cs`](../../../VieFUNDPdf/T4RSPPdf.cs) |
| Tax nhiều trang/extended | [`T5008Pdf.cs`](../../../VieFUNDPdf/T5008Pdf.cs), [`RL18Pdf.cs`](../../../VieFUNDPdf/RL18Pdf.cs) |
| RRSP contribution receipt | [`CRRSPReceipt.cs`](../../../VieFUNDPdf/CRRSPReceipt.cs) |

## 14. Tài liệu liên quan

- [Tax & Year-End](../../topics/tax-yearend/module-guide.md)
- [Database Access](../database-access.md)
- [Security](../../topics/security/module-guide.md)
- [E-signature](../esignature.md)
- [Charts](../charts.md)
