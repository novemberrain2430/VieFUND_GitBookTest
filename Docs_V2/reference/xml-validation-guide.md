# XML Schema & Validation — cơ chế, phạm vi và cách bảo trì

> Trạng thái: **đã đối chiếu source ngày 2026-09-05**. Kết luận dựa trên SQL snapshot và C# trong workspace; chưa đối chiếu `sys.xml_schema_collections` hoặc XSD đang cài ở database production.

## 1. Kết luận điều hành

VieFUND có hai cơ chế XML khác nhau:

- XML Order/TFS và NFU gửi đi được tạo chủ yếu trong stored procedure. Hai SP `UBXMLCheckOrderSchema` và `UBXMLCheckNFUSchema` validate bằng typed XML của SQL Server.
- XML nhận vào được các class trong `UBFFImport` đọc bằng `XmlReader` và mapping theo định nghĩa record trong DB. Không tìm thấy đường gọi schema validation đang hoạt động cho luồng import Fundserv.

Quan trọng: không thể kết luận “mọi file gửi đi đều được validate”. NFU có validation theo setting và một số ngoại lệ; Order chỉ gọi validation ở nhánh `iOptions=2`, trong khi luồng tạo file thực tế gọi `UBOrderCreateMSGXML` với `iOptions=0`.

Snapshot hiện chỉ tham chiếu schema collection phiên bản **32, 34 và 35**. Không có `FundServOrder36`, `FundServNFU36`, nhánh version 36 hay DDL tạo schema collection trong workspace. V36 vì vậy là yêu cầu/chưa triển khai ở phần validation, không phải trạng thái đã có.

## 2. Bản đồ thành phần

| Tầng | Thành phần | Vai trò |
|---|---|---|
| Version DB | [`GetFundServVersion`](../../ScriptDB/000_3_CreateUDF.sql#L70535) | Chọn 34/35 theo cutoff và môi trường test. |
| Feature flag | [`IsOrderSchema`](../../ScriptDB/000_3_CreateUDF.sql#L114349), [`IsNFUSchema`](../../ScriptDB/000_3_CreateUDF.sql#L112980) | Đọc `UB_FS_DefServiceParam`. |
| Tạo Order XML | [`UBOrderCreateMSGXML`](../../ScriptDB/000_4_CreateSP.sql#L473728) | Tạo body/message; có nhánh gọi Order validator. |
| Tạo NFU XML | [`UBNFUCreateMSGXML`](../../ScriptDB/000_4_CreateSP.sql#L451912) | Tạo body/message; có nhánh gọi NFU validator. |
| Validate DB | [`UBXMLCheckOrderSchema`](../../ScriptDB/000_4_CreateSP.sql#L687823), [`UBXMLCheckNFUSchema`](../../ScriptDB/000_4_CreateSP.sql#L687755) | Bọc fragment vào root rồi gán vào typed XML. |
| Ghi file | [`COrder`](../../UBFFImport/COrder.cs#L20), [`CXM`](../../UBFFImport/CXM.cs#L36) | Bọc root/declaration và ghi file vật lý. |
| XML helper | [`CXML`](../../UBConnection/CXML.cs#L11) | Mở stream, tạo reader; có helper schema nhưng không thấy caller active. |
| Import | `UBFFImport/C*.cs` | Parse file nhận về bằng `XmlReader`, ghi staging/business tables qua SP. |

## 3. Schema collection có thể chứng minh từ snapshot

SQL snapshot tham chiếu sáu collection sau:

| Nhóm | Version | Schema collection | SP dùng |
|---|---:|---|---|
| NFU | 32 | `FundServNFU32` | `UBXMLCheckNFUSchema32` |
| NFU | 34 | `FundServNFU34` | `UBXMLCheckNFUSchema` |
| NFU | 35 | `FundServNFU35` | `UBXMLCheckNFUSchema` |
| Order | 32 | `FundServOrder32` | `UBXMLCheckOrderSchema32` |
| Order | 34 | `FundServOrder34` | `UBXMLCheckOrderSchema` |
| Order | 35 | `FundServOrder35` | `UBXMLCheckOrderSchema` |

Không có câu `CREATE XML SCHEMA COLLECTION` trong repository. Điều đó có hai hệ quả:

1. Có thể suy ra tên collection mà SP cần, nhưng không thể kiểm tra nội dung XSD, dependency/import hoặc collection có thực sự tồn tại ở một môi trường cụ thể.
2. Không thể tái tạo database mới chỉ từ `ScriptDB` hiện tại nếu không lấy thêm script/schema từ môi trường chuẩn.

Các XSD Fundserv như `tfs.xsd`, `nfu.xsd`, `FStypes.xsd` cũng không có trong workspace. Các file `.xsd` tìm thấy thuộc Onboarding, SAML, Fundata hoặc tool sinh schema từ class, không thay thế được bộ XSD Fundserv.

## 4. Validation trong SQL hoạt động thế nào

Hai validator nhận **fragment** XML, tự bọc root có namespace/version rồi gán chuỗi vào biến typed XML:

```sql
DECLARE @Order35 XML(FundServOrder35);
SELECT TOP 1 @Order35 = @MSG;
```

Nếu XML sai cấu trúc/type/facet theo collection, phép gán ném lỗi; `TRY/CATCH` bắt `ERROR_MESSAGE()` vào output `@ErrorMsg`. Validator không trả result set success/failure riêng: chuỗi rỗng là hợp lệ, chuỗi khác rỗng là lỗi.

### 4.1. NFU

`UBXMLCheckNFUSchema` bọc dữ liệu trong:

```xml
<MessageSet xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
            xmlns="nfu"
            xsi:schemaLocation="nfu nfu.xsd"
            Version="35">...</MessageSet>
```

- Version `34` dùng `FundServNFU34`.
- Mọi version khác đi vào nhánh `FundServNFU35`.
- Nếu input version `NULL` hoặc `<=34`, SP gọi `GetFundServVersion()`.
- Sau cutoff hard-code, SP cưỡng bức version `35`.

`UBNFUCreateMSGXML` gọi validator khi `IsNFUSchema()=1`. Linked type `22` tắt validation vì schema LTI không áp dụng; một số omnibus/LTI đặt `bCheckSchema=2` nhưng không đi vào validator NFU chuẩn ([source](../../ScriptDB/000_4_CreateSP.sql#L452646)). Khi có lỗi, creator trả `Ret=6` và không cập nhật `UB_NFUMSG.MSG`.

### 4.2. Order/TFS

`UBXMLCheckOrderSchema` bọc fragment trong `OrdSet` namespace `tfs`:

- Version `34` dùng `FundServOrder34`.
- Mọi version khác dùng `FundServOrder35`.
- Version `NULL` hoặc `<=34` được thay bằng `GetFundServVersion()`; sau cutoff lại bị cưỡng bức `35`.

`UBOrderCreateMSGXML` chỉ gọi validator khi đồng thời `bCheckSchema=1` **và** `iOptions=2` ([source](../../ScriptDB/000_4_CreateSP.sql#L474244)). Nếu lỗi, creator đặt `Ret=6` và trả `ErrorMSG`.

Trong luồng tạo file, `UBOrderCreateFile` gọi `UBOrderCreateMSGXML @iRequestID, 0, ...` ([source](../../ScriptDB/000_4_CreateSP.sql#L473555)). Do đó nhánh validation trên không chạy cho lời gọi tạo file này.

## 5. Version và cutoff

### 5.1. SQL

`GetFundServVersion()` trả `35` sau cutoff được viết là `'09/06/2025'`; comment “Saturday” cho thấy ý định là **2025-09-06**. Trước cutoff, production mặc định `34`, còn DSID test hoặc `UB_Dealership.bTest=1` nhận `35`.

Hai validator cũng lặp lại date literal và cưỡng bức `35`. Dùng literal không theo ISO khiến ý nghĩa phụ thuộc `DATEFORMAT/LANGUAGE` của SQL session; nên thay bằng `DATEFROMPARTS(2025,9,6)` hoặc `'20250906'`.

### 5.2. C#

`COrder.GetFSVersion()` dùng `new DateTime(2025, 9, 6)` nên không mơ hồ. `COrder.OrderMsgCreate()` và `CXM.NFUFileCreate()` cũng nâng version lên 35 từ cutoff này.

Version được quyết định ở cả DB lẫn C#. Khi nâng chuẩn, phải cập nhật đồng bộ; nếu không, fragment có thể validate theo một version nhưng file wrapper ghi version khác.

### 5.3. V36

[Yêu cầu V36](../topics/fundserv/v36-requirements.md) nêu go-live 2026-06-15, nhưng source snapshot vẫn dừng ở 35:

- không có collection `FundServOrder36`/`FundServNFU36` được tham chiếu;
- validator không có nhánh 36;
- `GetFundServVersion()` và C# chỉ biết 34/35;
- XSD V36 không có trong workspace.

Vì vậy không được chỉ sửa `Version="36"`; cần deploy đủ XSD collection, validator và version selection trước.

## 6. Incoming XML

Các importer `CAA`, `CAT`, `CASM`, `CBS`, `CFD`, `CLA`, `CLS`, `COrder`, `CXM`... thường gọi:

```csharp
xmlStream = UBConnection.CXML.GetXmlStream(FileName, ref errorMessage, true);
reader = UBConnection.CXML.GetXMLReader(xmlStream, ref errorMessage);
```

`GetXMLReader` dùng `XmlReader.Create(xmlStream)` mà không gắn `XmlSchemaSet` ([source](../../UBConnection/CXML.cs#L165)). Nó đảm bảo XML phải đọc được/well-formed, sau đó importer tự dispatch theo element và record definition; đó không phải XSD validation.

Repository có hai helper schema tổng quát:

- `UBConnection.CXML.GetSchemaSetting/ValidateXML`;
- `UBFFImport.CXM.CheckSchema`.

Quét caller cho thấy chúng chỉ xuất hiện tại nơi định nghĩa, không được luồng Fundserv active gọi. Vì vậy nhận định đúng là **incoming Fundserv hiện không có XSD gate chứng minh được từ source**, chứ không phải “không cần validate vì nguồn luôn đúng”. Parser và SP vẫn có thể reject/log theo lỗi parse, field hoặc business rule.

## 7. Data và error contract

| Đối tượng | Vai trò |
|---|---|
| `UB_FS_DefServiceParam` | Giữ `ORDER_SCHEMA`, `NFU_SCHEMA`. |
| `UB_NFUMSG` | Lưu NFU message sau khi sinh/validate thành công. |
| `UB_OrderMSG` | Lưu order message gắn request/file. |
| `UB_OrderWaiting2Send` | Queue order chuẩn bị gửi. |
| `UB_FundTrxOrder` | Nguồn dữ liệu order XML và trạng thái/action. |
| `UB_FS_File` và các bảng import | Metadata file nhận/gửi và kết quả xử lý tùy loại file. |

Error contract chính:

- validator: output `@ErrorMsg`; rỗng = pass;
- creator Order/NFU: `Ret=6` khi schema error;
- C# writer: trả `false` khi ghi file lỗi, không thực hiện XSD validation lần hai;
- importer: log parse/process error qua `FFImport.WriteEventLog` và cập nhật trạng thái file bằng SP tương ứng.

`UBNFUCreateMSGXML` khai báo local `@ErrorMSG varchar(200)`, nên thông báo schema SQL dài có thể bị cắt; Order dùng `varchar(MAX)`.

## 8. Findings phát hiện khi đối chiếu

### XML-01 — Order production path bỏ qua schema validation

`UBOrderCreateMSGXML` chỉ validate khi `iOptions=2`, trong khi `UBOrderCreateFile` gọi với `iOptions=0`. Setting `ORDER_SCHEMA=1` vì vậy chưa đủ để bảo đảm file outgoing được validate. Cần test lại ý định của `iOptions`; nếu validation phải là pre-send gate, tách điều kiện khỏi mode “test/return message” và thêm regression test cho đúng entry point tạo file.

### XML-02 — NFU validation tự tắt lặp lại mỗi tháng 6

`IsNFUSchema()` trả `0` khi tháng là 6 và ngày >10, không giới hạn năm ([source](../../ScriptDB/000_3_CreateUDF.sql#L112987)). Nghĩa là NFU validation bị tắt từ 11–30/06 **hằng năm** dù `NFU_SCHEMA=1`. Nếu đây chỉ là workaround cho một lần nâng chuẩn, cần thay bằng cửa sổ ngày có năm rõ ràng hoặc bỏ hoàn toàn sau migration.

### XML-03 — điều kiện retry response Order không thể đúng

Trong `COrder.ProcessXMLErrorSet`, điều kiện `ErrorCode == "98" && ErrorCode == "003"` không thể đồng thời đúng ([source](../../UBFFImport/COrder.cs#L313)). Nhánh comment “DB busy... send again” vì vậy không chạy. Cần xác nhận hai mã thuộc hai field khác nhau hay điều kiện dự kiến là `||` trước khi sửa.

### XML-04 — date literal SQL mơ hồ

`'09/06/2025'` xuất hiện trong version UDF/validator. Kết quả có thể khác nếu session dùng `mdy` và `dmy`; C# lại cố định 2025-09-06. Chuẩn hóa literal là thay đổi nhỏ nhưng cần test version trả về quanh cutoff.

### XML-05 — schema deployment không tái tạo được từ repository

SP phụ thuộc sáu XML schema collection nhưng workspace không có DDL/XSD Fundserv. Đây là khoảng trống release/recovery: database mới hoặc DR restore từng phần không thể dựng validator từ repo. Nên version-control script collection hoặc quy trình lấy artifact đã kiểm checksum, nếu license của Fundserv cho phép.

## 9. Cách kiểm tra một database thật

Chạy read-only trên đúng database môi trường:

```sql
SELECT name, create_date, modify_date
FROM sys.xml_schema_collections
WHERE name LIKE 'FundServ%'
ORDER BY name;

SELECT KeyStr, ValueStr
FROM dbo.UB_FS_DefServiceParam
WHERE KeyStr IN ('ORDER_SCHEMA', 'NFU_SCHEMA');

SELECT dbo.GetFundServVersion() AS FundServVersion,
       dbo.IsOrderSchema() AS OrderSchemaEnabled,
       dbo.IsNFUSchema() AS NFUSchemaEnabled;
```

Sau đó gọi validator bằng một mẫu pass và một mẫu fail đã được Fundserv phê duyệt; không dùng dữ liệu khách hàng thật trong log/test artifact.

## 10. Quy trình thêm version schema mới

1. Nhận đúng bộ XSD chính thức và dependency, ghi version/checksum/nguồn artifact.
2. Dựng XML Schema Collection trên database test. SQL Server có giới hạn XSD riêng; phải test toàn bộ import/include/type được dùng, không chỉ copy một file vào câu `CREATE` mẫu.
3. Thêm collection mới với tên bất biến, ví dụ `FundServOrder36`; không sửa nội dung collection 35 đang phục vụ rollback.
4. Sửa validator bằng nhánh **explicit** cho 34/35/36. Version không hỗ trợ phải trả lỗi, không mặc định rơi vào collection mới nhất.
5. Sửa `GetFundServVersion`, `COrder.GetFSVersion`, `CXM.NFUFileCreate` và mọi cutoff trùng lặp bằng ngày ISO/`DateTime` rõ ràng.
6. Kiểm tra feature flag và ngoại lệ LTI/omnibus.
7. Test đúng production call path: create request → create message → validate → save `UB_OrderMSG`/`UB_NFUMSG` → bọc root → ghi file.
8. Test incoming parser riêng với sample cũ/mới; XSD outgoing không tự bảo vệ importer.
9. Deploy theo thứ tự collection → SP/UDF → service binary → bật flag. Chuẩn bị rollback về version cũ trước cutoff.
10. Sau deploy, kiểm tra version/flag/collection bằng query ở mục 9 và lưu evidence không chứa PII.

## 11. Checklist test tối thiểu

- [ ] Order hợp lệ/sai schema qua đúng lời gọi `iOptions=0` dùng khi tạo file.
- [ ] NFU hợp lệ/sai schema khi flag on/off và trong/ngoài tháng 6.
- [ ] Version trước, đúng ngày và sau cutoff ở SQL lẫn C#.
- [ ] Version không hỗ trợ phải fail rõ ràng.
- [ ] LTI/omnibus đi đúng schema hoặc ngoại lệ đã phê duyệt.
- [ ] Ký tự EN/FR và ký tự ngoài code page qua chuỗi `varchar`/file UTF-8.
- [ ] File incoming malformed, thiếu element, element lạ và business field sai.
- [ ] Error message không bị cắt trước khi tới log/UI.

## 12. Tài liệu liên quan

- [Fundserv — TFS/NFU flow](../topics/fundserv/tfs-nfu-flow.md)
- [Fundserv V36 requirements](../topics/fundserv/v36-requirements.md)
- [Fundserv V36 implementation plan](../topics/fundserv/v36-implementation-plan.md)
- [Fundserv source/import guide](../topics/fundserv/source-code-guide.md)
- [Database Access](../viefund-framework/database-access.md)
- [SP Catalog](sp-catalog/README.md)
