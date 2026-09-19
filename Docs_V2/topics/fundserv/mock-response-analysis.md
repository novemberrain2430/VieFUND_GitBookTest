# Phân tích mock physical DR/XR — TEST ONLY

> [!CAUTION]
> **CHỈ DÙNG TRONG MÔI TRƯỜNG TEST CÔ LẬP. KHÔNG ĐẶT MOCK FILE VÀO PRODUCTION.**
>
> Import DR/XR gọi stored procedure nghiệp vụ và có thể thay đổi order, NFU, file audit và các row liên quan. Đây không phải parser demo không side effect. Mọi lần chạy cần test owner/DBA phê duyệt, có baseline, rollback/reconcile plan và dữ liệu không nhạy cảm.

## 1. Phạm vi và kết luận

Trang này chỉ đánh giá **physical batch response** được `VieFUNDIE` phát hiện trong IN:

- physical `DR` → `COrder.ImportXML`;
- physical `XR` → `CXM.ImportXML`.

Mapping chỉ đi qua XML handler khi DB file-code row phù hợp có `HeaderID == "XML"`. File code/pattern, DB definition, body hợp lệ và business outcome đều phụ thuộc environment/SP/XSD đang deploy.

Source evidence: `DLLs/UBFFImport/FFImport.cs:1849-1885,2389-2471`.

> **Không dùng quy trình này để test MQ response.** `VieFUNDMQ` đọc response queue trực tiếp rồi gọi adapter/parser; pipeline đó không có filename discovery, IN hay archive. Xem [mục 8](#8-mq-response-là-pipeline-riêng).

## 2. Safety gate trước khi tạo file

Chỉ tiếp tục khi **tất cả** điều kiện sau được đáp ứng:

| Điều kiện | Bằng chứng cần giữ |
|---|---|
| Đúng test DB/DSID và test service instance | DBID/DSID, host, service binary/version |
| Không có route từ test IN/gateway sang production | xác nhận của environment owner |
| File code/pattern được đọc từ target environment | snapshot read-only của `FileCode`, `FileCodeTest`, `HeaderID`, test flags |
| Có response thật đã sanitize của đúng flow | nguồn, correlation/business keys đã thay bằng test data hợp lệ |
| Có XSD/version đúng environment | XSD deployment hoặc xác nhận schema owner |
| Có order/NFU test được phép thay đổi | baseline các row/audit liên quan |
| Có kế hoạch kiểm tra và rollback/reconcile | owner, time window, success criteria, stop condition |
| Có forensic copy | file gốc sanitize, hash, timestamp, ticket/run ID |

Không dùng dữ liệu khách hàng thật trong mock. Không tự đoán dealer code, source ID, account ID, action, return code hoặc error code.

## 3. Runtime discovery: không invent filename convention

### 3.1 Paths đến từ DB settings

`VieFUNDIE.LoadSettings` đọc `FILE_PATH` (IN), `FILE_PATH_IMPORTED`, `FILE_PATH_ERROR`, `FILE_PATH_SKIPPED`, `FILE_PATH_UPLOAD` và `FILE_ENCODING` từ DB topic `Service`. Các key này **không nằm trong `Services/VieFUNDIE/App.config`**. `OnTimer` truyền DSID vào wrapper, nhưng source-visible wrapper chỉ bind `TopicStr`; do đó phải lấy path từ đúng DB/environment và không khẳng định DB đã filter theo DSID nếu chưa kiểm tra SP deploy. Nếu thiếu, code có fallback theo thư mục executable, nhưng fallback không chứng minh cấu hình test/production thực tế.

Source evidence: `Services/VieFUNDIE/VieFUNDIE.cs:442-615`; `Services/VieFUNDIE/App.config:1-8`; `DLLs/UBConnection/CDatabase.cs:1906-1923`.

### 3.2 Code/pattern đến từ DB/environment

Runtime có hai nguồn file-code table tương đương theo call path:

- `ServiceOnTimerFirstTime` trả table `FileCode` cho timer;
- fallback/helper gọi `UBFSFileCodeList`.

Generic discovery dùng:

```text
FileCode + "*"
FileCodeTest + "*"   # chỉ khi runtime xác định test mode
```

Trước generic loop, source còn xét nhiều **special patterns** riêng như RESP, ETF, TCR, FUNDLIST, NEO và Cannex. Vì vậy:

- không có một convention universal dạng `{code}{dealer}.{YYYYMMDD}...`;
- date không phải điều kiện bắt buộc toàn cục;
- không lấy ví dụ filename trong tài liệu cũ làm canonical;
- phải lấy code/pattern từ DB và runbook/sample đã xác nhận của chính environment.

`GetFileParam` parse một số legacy date forms, trong khi các special branch có cách lấy/gán date khác. Archive chỉ thêm date folders khi parse ra chuỗi date đủ dài.

Source evidence: `DLLs/UBFFImport/FFImport.cs:293-400,722-760,792-1500`; `Services/VieFUNDIE/VieFUNDIE.cs:687-708`.

### 3.3 Điều kiện discovery cần kiểm tra

1. File nằm trong configured `FILE_PATH` của đúng test DB/environment; ghi lại DSID context nhưng không suy ra path đã được SP filter theo DSID.
2. Prefix/pattern match `FileCode` hoặc `FileCodeTest` runtime; test mode phụ thuộc `DBName`/`VieFUNDCode` trong file-code data.
3. File readable/không còn bị writer giữ và lớn hơn threshold source dùng khi scan.
4. Selected file code map tới row đúng; với DR/XR physical XML, `HeaderID` phải là `XML`.
5. Thứ tự `iOrder` và special-pattern priority có thể khiến file khác được lấy trước.

Source evidence: `DLLs/UBFFImport/FFImport.cs:1327-1500,1728-1885`.

## 4. XML: chỉ root được xác minh từ parser; body phải lấy từ evidence

### 4.1 Root và handler

| Physical response | Root parser nhận | DB field definition | Business processor |
|---|---|---|---|
| `DR` | `OrdSet` | `UBXMLRecDefDR` | `UBXMLRecOrderRespnProcess` |
| `XR` | `MessageSet` | `UBXMLRecDefXR` | `UBXMLRecNFURespnProcess` |

Source normalizes element names khi so sánh, nhưng namespace, version, ordering, cardinality và field contract cuối cùng phải theo sanitized response/XSD của environment.

Source evidence: `DLLs/UBFFImport/COrder.cs:323-425,475-640,759-824`; `DLLs/UBFFImport/CXM.cs:151-271,385-636`.

Bảng trên mô tả envelope response thông thường. Order parser còn có nhánh root `ErrorSet`; nếu cần test network/error response, phải lấy **sanitized sample + XSD/contract đã duyệt cho chính nhánh đó**, không thay root rồi tái sử dụng body `OrdSet`. Việc parser nhận tên root không chứng minh body tự dựng là schema-valid hoặc business-valid.

> **Known source risk khi đánh giá mock:** cả `COrder.ImportXML` và `CXM.ImportXML` khởi tạo `Ret = true`. Khi không mở được XML stream/reader, code log rồi vẫn có thể trả `true`; khi không gặp root được nhận diện, vòng đọc cũng có thể kết thúc với `true`. Vì `UBFF_Add` chạy trước dispatch còn `UBFF_End` nằm trong root processor, file có thể có Add nhưng không có End và vẫn bị `ProcessAllX` move theo nhánh success. Một test phải coi `Imported` + thiếu End/counters/business mutation mong đợi là **inconclusive/failed**, không phải pass.
>
> Source evidence: `DLLs/UBFFImport/COrder.cs:168-208,323-425`; `DLLs/UBFFImport/CXM.cs:151-271`; `DLLs/UBFFImport/FFImport.cs:1888-1930,2060-2153,2389-2471`.

### 4.2 Không dựng body từ tài liệu này

Repository chứng minh parser DR đọc các vùng như `Msg`, `MsgCreate`, `Ntwrk`, `MsgType`/`OrdRspn`, reject/warning; parser XR tìm `MsgType`/`Response` và lấy mapping qua DB definition. Điều đó **không đủ** để chứng minh một XML tự viết là schema-valid hoặc business-valid.

Quy tắc tạo payload:

1. Lấy **một response thật của đúng physical code và đúng XSD/version**, từ test hoặc production sample đã được owner cho phép.
2. Sanitize theo quy trình bảo mật nhưng giữ cấu trúc, namespace, ordering và cardinality.
3. Thay correlation/business keys bằng keys của test record đã được phép; owner phải xác nhận chúng vẫn match logic SP.
4. Validate offline bằng XSD đang deploy và tooling được phê duyệt.
5. Peer review payload trước khi đưa vào IN.

Không có `tfs.xsd`/`nfu.xsd` canonical được xác minh trong repository cho flow này; đây là kết quả inventory review, không phải claim được chứng minh bởi một line source. `CXM.CheckSchema` tồn tại nhưng inbound `CXM.ImportXML` không gọi nó; không được coi C# import path là XSD validation đầy đủ.

Source evidence: `DLLs/UBFFImport/CXM.cs:20-33,151-205`.

> Tài liệu này cố ý **không cung cấp ready-to-run XML body**. Đặc biệt không dùng `<Rspn>`, `ActnCode`, `FundAcctID` hoặc field tự đoán để dựng XR; source hiện tại tìm element `Response`, còn mapping cuối phụ thuộc `UBXMLRecDefXR` và XSD deploy.

### 4.3 Version và encoding

- Không hard-code “V35” hoặc “V36” cho inbound mock. Giữ version từ approved sanitized response và xác nhận bằng XSD/environment owner.
- Outbound source hiện chuyển default/minimum path từ V35 sang V36 tại `2026-06-13`, nhưng điều đó không chứng minh mọi inbound deployment đã dùng cùng version.
- XML declaration phải khớp bytes thực tế. `FILE_ENCODING=1252` là setting inbound handling chung/flat-file path, không phải lý do để đổi XML UTF-8 sample thành Windows-1252.

Source evidence: `DLLs/UBFFImport/COrder.cs:20-83`; `DLLs/UBFFImport/CXM.cs:36-64`; `Services/VieFUNDIE/VieFUNDIE.cs:35-43,514-577`.

## 5. Quy trình test physical DR/XR an toàn

### Bước 1 — Chụp baseline read-only

Ghi lại:

- DBID/DSID, service host/binary và time window;
- settings paths và file-code row;
- business keys/status/last-modified của test order hoặc NFU;
- file/event/raw-message audit liên quan trước test;
- archive contents có cùng filename/prefix để tránh collision.

### Bước 2 — Chuẩn bị payload ngoài IN

- Bắt đầu từ approved sanitized response + deployed XSD, không từ XML mẫu tự dựng.
- Chỉ dùng test identifiers được owner cung cấp.
- Validate schema và review expected DB side effects.
- Đặt filename theo code/pattern vừa đọc từ target environment; không thêm date/dealer/sequence vì “convention” suy đoán.
- Tính hash và giữ immutable copy.

### Bước 3 — Phối hợp service và đặt đúng một file

Theo runbook test environment, bảo đảm không có writer khác và chỉ đưa một artifact đã review vào đúng `FILE_PATH`. Không thực hiện thao tác này trên shared/production IN.

### Bước 4 — Quan sát đủ bốn lớp

1. **Filesystem:** IN → Imported/Error/Skipped; ghi lại exact destination.
2. **Windows Event Log:** filename, FileID, parser/move error và timestamps.
3. **DB audit:** record tạo/kết thúc file, counters và raw response nếu flow có lưu.
4. **Business state:** order/NFU rows, correlation IDs, error/warning rows và last-modified.

### Bước 5 — Đánh giá theo tiêu chí đã phê duyệt

Không dùng “file biến mất khỏi IN” hoặc “file ở Imported” làm success criterion duy nhất. So sánh toàn bộ post-state với baseline. Nếu có bất thường, dừng test; không tự động tạo file thứ hai hay replay.

## 6. `UBFF_Add`, `UBFF_End` và archive

### 6.1 File audit lifecycle

Physical XML đi qua call path:

```text
ImportXMLFile
  -> GetFileID
     -> UBFF_Add   # đăng ký filename/full path/effective date/counters, lấy FileID
  -> COrder.ImportXML hoặc CXM.ImportXML
     -> business SP theo record/batch
     -> UBFF_End   # handler root được nhận cập nhật status/counters
  -> ProcessAllX move file theo Ret
```

Source evidence: `DLLs/UBFFImport/FFImport.cs:2060-2153,2389-2471`; `DLLs/UBFFImport/COrder.cs:360-425`; `DLLs/UBFFImport/CXM.cs:207-271`.

Không gọi `UBFF_Add`/`UBFF_End` thủ công để “sửa audit”. Nếu root không được nhận, reader fail, SP fail hoặc process dừng giữa chừng, cần đối chiếu audit thực tế thay vì giả định lifecycle đã hoàn tất.

Physical DR gọi `SaveMSGResponse` trước parse; physical XR path đã review không có call tương đương trong `CXM.ImportXML`. Vì vậy không hứa mọi XR đều có raw XML audit giống DR.

Source evidence: `DLLs/UBFFImport/COrder.cs:168-208`; `DLLs/UBFFImport/CXM.cs:151-205`.

### 6.2 Archive routing

| `Ret` tại `ProcessAllX` | Destination |
|---|---|
| `1` | `FILE_PATH_IMPORTED`, cộng category/date nếu source tính được |
| `3` | `FILE_PATH_ERROR` |
| khác `1/3` | `FILE_PATH_SKIPPED` theo code hiện tại |

`DR` có category `TRX`. `XR` không có case trong `GetImportedSubDir`, nên XR thành công không mặc định vào `Imported/TRX`; nó có thể ở imported root và date subfolders nếu date parse được.

Source evidence: `DLLs/UBFFImport/FFImport.cs:1562-1688,1888-1924`.

Archive là dấu hiệu control flow, không phải Fundserv ACK và không bảo đảm mọi DB mutation đúng/đủ.

## 7. Known source risk: không hứa automatic retry

Tại `FFImport.cs` khoảng `1888-1930`:

1. Comment nói `Ret == 2` là system error và **không move** file.
2. Code thực tế: `Ret == 1` → Imported; `Ret == 3` → Error; nhánh `else` move mọi Ret khác, gồm `2`, → Skipped.
3. Nếu `TotalNumRecords` dưới threshold, code tiếp tục gán `Ret = 1` và `goto First_Step`.

Source evidence: `DLLs/UBFFImport/FFImport.cs:1888-1930`.

Do DR/XR đăng ký file và gọi business SP theo record/batch mà không có transaction C# bao trùm toàn file, một lần lỗi có thể đã để lại DB side effects một phần. Vì vậy:

- **không** mô tả Skipped như retry queue;
- **không** hứa service sẽ tự retry `Ret == 2`;
- **không** copy file từ Skipped/Error về IN theo mặc định;
- trước replay phải xác minh `UBFF` audit, event audit, raw response nếu có, từng business row/correlation key và idempotency của SP deploy;
- replay chỉ sau approval và có rollback/reconcile plan.

Source evidence: `DLLs/UBFFImport/COrder.cs:759-824`; `DLLs/UBFFImport/CXM.cs:507-636`; `DLLs/UBFFImport/FFImport.cs:2060-2153`.

## 8. MQ response là pipeline riêng

`VieFUNDMQ.GetMsgData` mở response queue, đọc MQ string rồi gọi `VieFUNDMQ.COrder.ProcessResponseMsg`. Adapter lưu raw message và gọi `UBFFImport.COrder.ImportXMLResp(..., Options=1)`. Nó không gọi batch discovery, không cần `FileCode`/`FileCodeTest`, không dùng IN và không move file vào Imported/Error/Skipped.

Source evidence: `Services/VieFUNDMQ/VieFUNDMQ.cs:1149-1209`; `Services/VieFUNDMQ/Order.cs:18-33`.

Muốn test MQ phải có test queue manager/queue/service configuration, test payload và approval riêng. Thả physical DR vào IN chỉ test batch parser/business path; nó không test MQ connect/open/get, charset, MsgID/correlation, queue retry hay MQ audit semantics.

## 9. Query templates — phải xác nhận schema trước

> [!CAUTION]
> **TEMPLATE ONLY.** Không chạy trước khi DBA/application owner xác nhận tên object, parameters, quyền và side effects trên đúng DB. SQL snapshot trong repository không chứng minh production parity.

```sql
/* TEMPLATE ONLY — approved read-only settings contract */
EXEC <approved_settings_reader>
     @DSID = <test_dsid>,
     @Topic = N'Service';
-- Lấy FILE_PATH/archives và các test-mode settings.
```

```sql
/* TEMPLATE ONLY — approved read model */
SELECT <file_code>, <file_code_test>, <header_id>, <order>, <environment_flags>
FROM <approved_file_code_view>
WHERE <physical_code_predicate>;

SELECT <file_id>, <file_name>, <status>, <counters>, <timestamps>
FROM <approved_file_audit_view>
WHERE <test_run_predicate>;

SELECT <business_key>, <status>, <last_modified>, <response_reference>
FROM <approved_order_or_nfu_read_view>
WHERE <approved_test_key_predicate>;
```

Các SP `UBFF_Add`, `UBFF_End`, `UBXMLRecOrderRespnProcess` và `UBXMLRecNFURespnProcess` là mutation path, không phải query preview.

## 10. Điều chưa thể xác minh từ repository

- FileCode/FileCodeTest rows và paths của environment đang chạy.
- XSD/version response canonical và sanitized sample được phép dùng.
- SP/schema/binary deploy có trùng source snapshot hay không.
- Duplicate suppression/idempotency và approved replay procedure.
- Gateway pickup/drop/ACK, retention và purge.
- Dealer/DSID nào route batch, MQ hoặc cả hai.

Nếu thiếu một trong các evidence trên, dừng ở phân tích/read-only verification thay vì tạo mock.
