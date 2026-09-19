# Hướng dẫn debug Fundserv — batch file và IBM MQ

> **Phạm vi:** debug hai kênh Fundserv độc lập trong source hiện tại. Tài liệu không chứng minh binary, stored procedure (SP), schema hay cấu hình production đang trùng repository.
>
> **Nguyên tắc an toàn:** bắt đầu bằng quan sát read-only. Không chạy SP tạo/import/replay trực tiếp, không sửa trạng thái và không chép file archive trở lại IN nếu chưa có phê duyệt của application owner/DBA.

Các nhãn dùng trong trang này theo [README của topic](README.md): **Verified**, **DB/SP-dependent**, **External boundary** và **Historical**.

## 1. Chọn đúng pipeline trước khi debug

| Kênh | Service | Outbound | Response | Có dùng IN/OUT/archive? |
|---|---|---|---|---|
| **Batch filesystem** | `VieFUNDIE` | DB → `COrder.OrderFileGenerate`/`CXM.FileGenerate` → OUT | Gateway ngoài repository đặt physical file vào IN → `FFImport.ProcessAllX` | Có |
| **IBM MQ realtime** | `VieFUNDMQ` | DB → MQ send queue | MQ response queue → `COrder.ProcessResponseMsg` → order response parser | Không |

**Verified:** `VieFUNDIE.OnTimer` sinh order/NFU rồi quét inbound; `VieFUNDMQ.OnTimer` mở queue, nhận, gửi và nhận lại. Hai service không phải hai bước của cùng một pipeline.

Source evidence: `Services/VieFUNDIE/VieFUNDIE.cs:654-818`; `Services/VieFUNDMQ/VieFUNDMQ.cs:1306-1499`.

```text
Batch: DB -> VieFUNDIE -> OUT -> [gateway ngoài repo] -> Fundserv
       DB <- DR/XR parser <- IN <- [gateway ngoài repo] <- Fundserv

MQ:    DB -> VieFUNDMQ -> send queue -> Fundserv
       DB <- response parser <- response queue <- Fundserv
```

> **Không suy diễn ACK:** một file xuất hiện trong OUT hoặc DB được cập nhật sau khi ghi file chỉ chứng minh bước local đã chạy. Nó không chứng minh gateway đã pickup, Fundserv đã nhận, hay nghiệp vụ đã được chấp nhận.

## 2. Debug batch filesystem (`VieFUNDIE`)

### 2.1 Xác định DBID, DSID và paths thực tế

Các paths runtime được nạp từ topic DB settings `Service` qua `CDatabase.GetVieFundIESettings`:

| Key | Vai trò runtime |
|---|---|
| `FILE_PATH` | IN/root được quét |
| `FILE_PATH_UPLOAD` | OUT cho TFS/NFU |
| `FILE_PATH_IMPORTED` | archive thành công |
| `FILE_PATH_ERROR` | archive khi có lỗi record/parser |
| `FILE_PATH_SKIPPED` | file bỏ qua/không xử lý được |
| `FILE_ENCODING` | code page phục vụ inbound discovery/flat-file handling; mặc định source là `1252` |

**Không lấy các key này từ `Services/VieFUNDIE/App.config`.** File đó chỉ có `DEBUGMODE`, `QUERYINTERVAL` và service URI. DB được chọn qua danh sách registry; `OnTimer` lặp qua DSID và truyền DSID vào wrapper settings. Tuy nhiên, implementation wrapper nhìn thấy trong repository chỉ bind `TopicStr` khi gọi `UBFSRuleList`, nên không được khẳng định settings được lọc theo DSID nếu chưa kiểm tra SP deploy. Nếu DB settings thiếu hoặc path không tồn tại, source dựng fallback từ thư mục executable (`FF`, `Imported`, `Error`, `Skipped`, `OUT`) và có thể ghi lại settings. Fallback là hành vi code, không phải bằng chứng path production.

Source evidence: `Services/VieFUNDIE/VieFUNDIE.cs:35-43,90-121,442-615`; `Services/VieFUNDIE/App.config:1-8`; `DLLs/UBConnection/CDatabase.cs:1906-1923`.

Checklist read-only:

1. Xác nhận đúng host/service binary, DBID và DSID; source DLL trong repository có thể khác binary deploy.
2. Đọc topic `Service` bằng công cụ quản trị/query đã được môi trường phê duyệt.
3. Ghi lại năm path trên, service account, ACL và free space.
4. Xác nhận path là local hay UNC và kiểm tra quyền dưới **service account**, không chỉ tài khoản cá nhân.
5. Kiểm tra schedule (`NO_RUNTIME`, `NO_WRUNDAY`, `NO_MRUNDAY`, `TEST_RUN`) trước khi kết luận timer hỏng.

### 2.2 Outbound order/TFS

Call path đã xác minh:

```text
VieFUNDIE.OnTimer
  -> COrder.OrderFileGenerate
     -> UBOrderCreateFile                 [DB/SP-dependent, có thể có side effect]
     -> OrderFileCreate                   [ghi local vào FILE_PATH_UPLOAD]
     -> UBOrderFileUpdateStatus(iStatus=1) [chỉ sau khi C# ghi thành công]
```

Source evidence: `DLLs/UBFFImport/COrder.cs:86-166`; `Services/VieFUNDIE/VieFUNDIE.cs:735-803`.

Kiểm tra theo thứ tự:

1. Windows service đang chạy và timer không bị schedule bỏ qua.
2. Event log có lỗi từ `UBOrderCreateFile`, tạo file hoặc quyền filesystem không.
3. OUT có filename/body do SP trả về không; so sánh timestamp với lần timer và giữ hash/copy forensic nếu điều tra incident.
4. DB audit/status có `iFileID` tương ứng không; diễn giải status theo SP/schema đang deploy.
5. Sau OUT là **external boundary**: repository-wide source review không tìm thấy FTP/SFTP/gateway pickup client cho hop này. Đây là negative inventory finding, không phải line-local proof hoặc bằng chứng về deployment ngoài repository. Dùng log/ACK của gateway hoặc Fundserv do owner cung cấp để chứng minh delivery.

`iStatus=1` trong `UBOrderFileUpdateStatus` xảy ra ngay sau local write. Không gọi trạng thái này là “Fundserv ACK”, “delivered” hay “accepted” nếu chưa có bằng chứng ngoài repository.

### 2.3 Outbound NFU

Call path:

```text
VieFUNDIE.OnTimer
  -> CXM.FileGenerate
     -> UBNFUCreateFile
     -> NFUFileCreate [ghi local vào FILE_PATH_UPLOAD]
```

Comment tại call SP nói `UBNFUCreateFile` thay đổi file/message status trước bước ghi của C#; method không có post-write ACK call tương đương order. Vì vậy càng không được suy trạng thái DB là ACK từ Fundserv.

Source evidence: `DLLs/UBFFImport/CXM.cs:77-149`.

Kiểm tra cùng OUT path, ACL, EventLog và DB state như TFS, nhưng xác nhận contract/side effect của `UBNFUCreateFile` trên đúng DB deploy trước khi kết luận hay chạy thủ công.

### 2.4 Inbound physical files

`VieFUNDIE` truyền IN và ba archive paths vào `FFImport.ProcessAllX`. Runtime lấy file-code definitions từ DB. Generic discovery dùng `FileCode + "*"`; test mode còn dùng `FileCodeTest + "*"`; ngoài ra source có nhiều special patterns được xét riêng. Không áp một filename/date convention duy nhất cho mọi file.

Source evidence: `DLLs/UBFFImport/FFImport.cs:722-760,792-1500,1728-1885`.

Với physical XML response chính:

- `DR` → `COrder.ImportXML`.
- `XR` → `CXM.ImportXML`.
- Row file-code phải map đúng và có `HeaderID == "XML"`; nếu không, dispatcher chọn flat-file path.

Source evidence: `DLLs/UBFFImport/FFImport.cs:1849-1885,2389-2471`.

Checklist:

1. **IN:** file có nằm trong configured `FILE_PATH` của đúng DB/environment, readable, ổn định và match code/pattern runtime không; ghi lại DSID context của timer nhưng không suy ra path đã được SP filter theo DSID.
2. **File-code row:** kiểm tra `FileCode`, `FileCodeTest`, `HeaderID`, thứ tự và test-mode flags trên đúng DB.
3. **Event logs:** tìm cùng time window, filename, FileID và DSID ở cả Windows Event Log lẫn DB event audit.
4. **DB file audit:** đối chiếu record do `UBFF_Add` tạo và kết quả/counters do `UBFF_End` ghi.
5. **Business audit:** kiểm tra order/NFU rows bị tác động bởi SP, không chỉ vị trí file.
6. **Archive:** tìm cả `Imported`, `Error` và `Skipped`; path thành công có thể thêm category/date tùy file code và date parse được.

`WriteEventLog` gọi cả `EventLog.WriteEntry` và `CDatabase.StoreEventLog`; khi đã có DB context, audit được ghi vào DB hiện tại. Tên table/view phía sau `StoreEventLog` là **DB/SP-dependent**. Cả wrapper log của service và import DLL đều nuốt exception khi chính thao tác ghi log lỗi, nên **không thấy log không chứng minh không có lỗi**.

Source evidence: `Services/VieFUNDIE/VieFUNDIE.cs:62-85`; `DLLs/UBFFImport/FFImport.cs:72-92,2060-2153`.

> **Known source risk — có thể trả success trước khi parser root chạy:** `COrder.ImportXML` và `CXM.ImportXML` đều khởi tạo `Ret = true`. Nếu không mở được XML stream/reader, code ghi log rồi trả lại `true`; nếu đọc hết mà không gặp root được nhận diện (`OrdSet`/`ErrorSet` cho order, `MessageSet` cho NFU), `Ret` cũng có thể vẫn là `true`. `UBFF_Add` đã chạy trước khi dispatch, còn `UBFF_End` chỉ chạy trong processor của root được nhận diện. Vì vậy có thể tồn tại record Add không có End và `ProcessAllX` vẫn move file theo nhánh success. Khi debug phải đối chiếu cặp Add/End, counters và business rows; `Imported`, không có error log hoặc chỉ có FileID đều chưa đủ chứng minh import hoàn tất.
>
> Source evidence: `DLLs/UBFFImport/COrder.cs:168-208,323-425`; `DLLs/UBFFImport/CXM.cs:151-271`; `DLLs/UBFFImport/FFImport.cs:1888-1930,2389-2471`.

### 2.5 Diễn giải archive đúng mức

| Kết quả C# | Move dự kiến | Điều có thể kết luận |
|---|---|---|
| `Ret == 1` | `Imported[/category][/YYYY/MM/DD]` | Handler trả success theo call path hiện tại |
| `Ret == 3` | `Error` | Có lỗi parser/record theo handler |
| Các giá trị khác | `Skipped` | Không được coi là “chưa xử lý, chắc chắn sẽ retry” |

`DR` map category `TRX`; `XR` không có category trong `GetImportedSubDir`, nên không mặc định tìm XR ở `Imported/TRX`. Date folders chỉ được thêm khi `FileDateStr` đủ dài.

Source evidence: `DLLs/UBFFImport/FFImport.cs:1562-1688,1888-1924`.

> File nằm trong `Imported` cũng không tự chứng minh mọi business row đã cập nhật đúng. Luôn đối chiếu `UBFF` audit, event audit và trạng thái nghiệp vụ trên DB deploy.

### 2.6 Known source risk: `Ret == 2`, Skipped và replay

Có mâu thuẫn trực tiếp trong `FFImport.ProcessAllX`:

- Comment nói system error `Ret == 2` **không được move file**.
- Code chỉ tách `Ret == 1` sang Imported và `Ret == 3` sang Error; nhánh `else` move mọi giá trị khác, gồm `2`, sang Skipped.
- Sau đó, nếu tổng record dưới threshold, code gán lại `Ret = 1` và `goto First_Step`.

Source evidence: `DLLs/UBFFImport/FFImport.cs:1888-1930`.

Hệ quả vận hành:

- Không hứa automatic retry cho file system error.
- `Skipped` không đồng nghĩa “an toàn để copy lại vào IN”.
- DR/XR có thể đã gọi SP theo record/batch và ghi `UBFF_Add`/`UBFF_End`; source không tạo transaction bao trùm toàn file. Replay có nguy cơ duplicate hoặc tiếp tục trên side effects đã commit một phần.

Quy trình recovery tối thiểu:

1. Giữ nguyên/copy forensic file, timestamps và hash; không chỉnh body tại chỗ.
2. Tra Windows Event Log, DB event audit, FileID (`UBFF` audit), raw response nếu có và affected business rows.
3. Xác định record nào chưa/chưa chắc/đã apply và kiểm tra idempotency của SP đang deploy.
4. Lập rollback/reconcile plan.
5. Chỉ restore/replay sau phê duyệt của application owner/DBA và theo runbook môi trường.

Source evidence: `DLLs/UBFFImport/COrder.cs:360-425,759-824`; `DLLs/UBFFImport/CXM.cs:207-271,507-636`; `DLLs/UBFFImport/FFImport.cs:2060-2153`.

## 3. Version và encoding thực tế

### 3.1 Batch XML outbound

Theo source snapshot:

- Order: giá trị dưới `35` được nâng lên `35`; với giá trị `<= 35`, dùng V35 trước `2026-06-13` và V36 từ ngày đó. Giá trị SP trả lớn hơn 35 không bị đoạn code này hạ xuống.
- NFU áp dụng cùng cutoff trong `NFUFileCreate`.
- Envelope khai báo `encoding="UTF-8"`; writer dùng `new StreamWriter(stream)` mà không truyền encoding explicit. Khi debug encoding, kiểm tra bytes/BOM thực tế, không chỉ nhìn XML declaration.

Source evidence: `DLLs/UBFFImport/COrder.cs:20-83`; `DLLs/UBFFImport/CXM.cs:36-64`.

`FILE_ENCODING` mặc định `1252` là setting của inbound handling; nó không điều khiển cách `OrderFileCreate`/`NFUFileCreate` dựng outbound XML. Không dùng nó để giải thích MQ charset.

### 3.2 MQ encoding

MQ có setting riêng `MQ_CHARACTERSET`, mặc định source `1208`, và được gán vào `MQMessage.CharacterSet`. Đây không phải `FILE_ENCODING`.

Source evidence: `Services/VieFUNDMQ/VieFUNDMQ.cs:481-858,997-1018`.

## 4. Debug IBM MQ (`VieFUNDMQ`) — pipeline riêng

`VieFUNDMQ` đọc host/port/manager/channel/send queue/response queue/charset từ DB settings. Outbound gọi `UBOrderGetMSG`, tạo `OrdSet`, put vào send queue, rồi gọi `UBOrderSetMsgStatus`. Response được đọc trực tiếp từ response queue, lưu raw message và gọi `COrder.ImportXMLResp(..., Options=1)`; không qua IN, `FileCode*`, `UBFF_Add` physical-file lifecycle hay archive folders.

Source evidence: `Services/VieFUNDMQ/VieFUNDMQ.cs:481-858,997-1209`; `Services/VieFUNDMQ/Order.cs:18-139`.

Checklist MQ:

1. Xác nhận đang debug đúng mode/DSID và đúng service `VieFUNDMQ`, không phải `VieFUNDIE`.
2. Đọc DB settings đã phê duyệt cho queue manager, channel, send/response queue, TLS/key path và charset; không chép secrets vào ticket/tài liệu.
3. Kiểm tra service/EventLog và observability của queue manager: connect/open/put/get errors, queue depth và timestamps.
4. Đối chiếu DB message row, MQ `MsgID`, raw response audit và affected order rows.
5. Phân biệt ba mốc: `Put` vào queue thành công, nhận response transport, và business response được SP áp dụng. Không dùng một mốc thay cho mốc khác.

> **MQ response là pipeline riêng.** Thả DR/XR vào batch IN không kiểm thử MQ receive path, queue configuration, MQ message metadata hay MQ retry behavior.

## 5. Query quan sát — chỉ là template

> [!CAUTION]
> **TEMPLATE ONLY.** Tên schema/SP/view, parameter, quyền và side effect phải được DBA/application owner xác nhận trên đúng DB deploy. Source chỉ chứng minh C# gọi các API/SP nhất định; không chứng minh query dưới đây chạy được trên mọi môi trường.

```sql
/* TEMPLATE ONLY — read-only sau khi đã xác nhận contract */
EXEC <approved_settings_reader>
     @DSID = <target_dsid>,
     @Topic = N'Service';
-- Lọc các key FILE_PATH*, FILE_ENCODING hoặc MQ_* phù hợp pipeline.
```

```sql
/* TEMPLATE ONLY — thay bằng approved read model của môi trường */
SELECT <file_id>, <file_name>, <status>, <record_counters>, <timestamps>
FROM <approved_file_audit_view>
WHERE <dsid_predicate> AND <time_window_predicate>;

SELECT <event_time>, <severity>, <message>
FROM <approved_event_audit_view>
WHERE <service_predicate> AND <time_window_predicate>;

SELECT <business_key>, <status>, <last_modified>, <response_reference>
FROM <approved_order_or_nfu_read_view>
WHERE <known_test_or_incident_key_predicate>;
```

Không gọi `UBOrderCreateFile`, `UBNFUCreateFile`, `UBFF_Add`, `UBFF_End` hoặc response-processing SP như “preview”: chúng nằm trên production mutation path và có thể claim/create/update state.

## 6. Breakpoints trọng tâm

| Pipeline | Điểm đặt breakpoint | Mục đích |
|---|---|---|
| Batch orchestration | `VieFUNDIE.OnTimer` | DBID/DSID, settings, schedule, paths |
| Batch TFS OUT | `COrder.OrderFileGenerate`, `OrderFileCreate` | SP result, filename/body, local write/status |
| Batch NFU OUT | `CXM.FileGenerate`, `NFUFileCreate` | SP result, local write/version |
| Batch discovery | `FFImport.GetFirstFileNameX`, `ProcessAllX` | code/pattern, selected file, `Ret`, archive |
| Batch DR/XR | `FFImport.ImportXMLFile`, `COrder.ImportXML`, `CXM.ImportXML` | FileID, root, DB definition, SP result |
| MQ send | `VieFUNDMQ.SendMsg`, `PutMsg` | queue, charset, MsgID, local put result |
| MQ response | `VieFUNDMQ.GetMsgData`, `VieFUNDMQ.COrder.ProcessResponseMsg` | response queue, raw payload audit, business parser |

## 7. Những điểm repository không thể xác nhận

Cần evidence từ deployment/owner trước khi kết luận:

- path/file-code/settings thực tế của production;
- SP/schema/binary deploy có trùng source snapshot không;
- gateway nào pickup/drop batch file, delivery ACK và retry của gateway;
- XSD và response sample canonical;
- retention/purge, duplicate suppression và quy trình replay được phê duyệt;
- dealer/DSID được route batch, MQ hay cả hai.
