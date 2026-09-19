# Luồng runtime TFS/NFU

Đây là trang canonical cho cơ chế gửi/nhận TFS và NFU. Bản chỉ có diagram: [TFS/NFU flow chart](tfs-nfu-flow-chart.md). Nhãn bằng chứng theo [README](README.md).

## 1. Flow matrix

| Flow | Runtime path | Boundary |
|---|---|---|
| TFS batch request | DB → `VieFUNDIE` → `COrder` → file `OrdSet` | Filesystem OUT → external gateway. |
| TFS real-time request | DB → `VieFUNDMQ` → `MQMessage` | IBM MQ trực tiếp. |
| TFS real-time response | IBM MQ response queue → `VieFUNDMQ` → `SaveMSGResponse`/`COrder.ImportXMLResp` → SP | Không qua filesystem, `FFImport` hay file archive. |
| NFU batch request | DB → `VieFUNDIE` → `CXM` → file `MessageSet` | Filesystem OUT → external gateway. |
| TFS/NFU batch response | External drop → filesystem IN → `FFImport` → `COrder`/`CXM` → SP | Final DB mutation phụ thuộc SP. |

TFS batch và TFS real-time là hai pipeline song song qua DB, không phải chuỗi “file rồi MQ”. Source MQ không mở file OUT; response real-time cũng được đọc trực tiếp từ queue thay vì qua `FFImport`. Source đã kiểm tra không có NFU MQ sender.

> Source evidence: `Services/VieFUNDIE/VieFUNDIE.cs:745-797`
>
> Source evidence: `Services/VieFUNDMQ/VieFUNDMQ.cs:997-1193`
>
> Source evidence: `Services/VieFUNDMQ/Order.cs:20-34`
>
> Source evidence: `Services/VieFUNDMQ/Order.cs:37-147`

## 2. WebApp → DB boundary

### TFS order

`PopupOrderBatch` truyền `iMode=0` cho batch hoặc `iMode=1` cho real-time vào `CTrx.OrderPendingMove2Waiting`. Call-site chỉ chứng minh mode đi vào business/DB layer; row/status transition cuối là **DB/SP-dependent**.

### NFU

UI gọi `CNFU.PendingMove2Waiting`; batch service sau đó dùng `CXM.FileGenerate`. Không suy diễn NFU-over-MQ khi không có sender call path tương ứng.

> Source evidence: `WebApp/Main/PopupOrderBatch.aspx.cs:320-377`
>
> Source evidence: `WebApp/Main/PopupOrderBatch.aspx.cs:864-903`

## 3. TFS batch filesystem

1. Trong timer cycle hợp lệ, `VieFUNDIE` gọi `COrder.OrderFileGenerate`.
2. `COrder` gọi `UBOrderCreateFile` và đọc `FileName`, `OrderMSG`, `iVersion`, `iFileID`, `bLTI` cùng flags liên quan.
3. C# normalize version, tạo UTF-8 `OrdSet` envelope và ghi file dưới configured upload path với filename do SP trả về.
4. Sau write, C# gọi `UBOrderFileUpdateStatus`; mutation chính xác của SP chưa được chứng minh.
5. Source-visible flow dừng ở filesystem OUT; external gateway chịu trách nhiệm pickup.

```xml
<?xml version="1.0" encoding="UTF-8"?>
<OrdSet xmlns="tfs" Version="35|36">
  <!-- OrderMSG: DB/SP-dependent -->
</OrdSet>
```

Filename, body, order selection và final status là **DB/SP-dependent**. Repository không chứa FTP/SFTP client implementation cho hop batch; không gán transport, actor, schedule hay ACK cho `VieFUNDIE`.

> Source evidence: `Services/VieFUNDIE/VieFUNDIE.cs:745-758`
>
> Source evidence: `DLLs/UBFFImport/COrder.cs:20-84`
>
> Source evidence: `DLLs/UBFFImport/COrder.cs:86-166`

## 4. TFS real-time qua IBM MQ

`VieFUNDMQ` là service độc lập, xử lý cả hai chiều mà không dùng batch filesystem.

**Request:**

1. Provider gọi `UBOrderGetMSG` với `iMode=1` và lấy `OrderMSG` từ DB.
2. Service tạo order envelope/`MQMessage`, rồi `Put` trực tiếp vào send queue.
3. Service gọi status SP theo kết quả send; final row/status mutation vẫn **DB/SP-dependent**.

**Response:**

1. `GetMsgData` đọc trực tiếp response queue bằng `MQQueue.Get`.
2. `ProcessResponseMsg` gọi `SaveMSGResponse`, tạo XML reader và chuyển message vào `COrder.ImportXMLResp`.
3. Các call này đi tới DB/SP boundary; final mutation không suy diễn từ tên method/SP.

Không bước nào đọc file do `COrder.OrderFileGenerate` tạo. MQ response không qua filesystem IN, `FFImport` discovery hay file archive.

> Source evidence: `Services/VieFUNDMQ/Order.cs:20-34`
>
> Source evidence: `Services/VieFUNDMQ/Order.cs:37-139`
>
> Source evidence: `Services/VieFUNDMQ/VieFUNDMQ.cs:997-1193`
>
> Source evidence: `Services/VieFUNDMQ/VieFUNDMQ.cs:1420-1442`
>
> Source evidence: `Services/VieFUNDMQ/VieFUNDMQ.cs:1479-1498`

## 5. NFU batch filesystem

1. `VieFUNDIE` gọi `CXM.FileGenerate`.
2. `UBNFUCreateFile` trả `FileName`, `MSG`, `iVersion`, `iFileID`.
3. C# áp dụng version rule inline, tạo UTF-8 `MessageSet` envelope và ghi file dưới configured upload path.
4. File dừng ở external pickup boundary giống batch filesystem; không gán MQ/FTP/SFTP nếu thiếu deployment evidence.

```xml
<?xml version="1.0" encoding="UTF-8"?>
<MessageSet xmlns="nfu" Version="35|36">
  <!-- MSG: DB/SP-dependent -->
</MessageSet>
```

Filename, body và NFU row selection là **DB/SP-dependent**. Trong method đã đọc không có post-write status SP riêng; không copy hành vi status của TFS sang NFU.

> Source evidence: `Services/VieFUNDIE/VieFUNDIE.cs:754-762`
>
> Source evidence: `DLLs/UBFFImport/CXM.cs:36-75`
>
> Source evidence: `DLLs/UBFFImport/CXM.cs:77-128`

## 6. Encoding, version và runtime settings

### Encoding/version outbound

TFS `OrdSet` và NFU `MessageSet` đều khai báo UTF-8 và dùng UTF-8 writer. DB setting `FILE_ENCODING` không được truyền vào hai writer này.

Output version luôn `>=35`:

```text
input <= 35, trước 2026-06-13 00:00:00 local time -> 35
input <= 35, từ    2026-06-13 00:00:00 local time -> 36
input >  35                                           -> giữ nguyên
```

TFS dùng `COrder.GetFSVersion`; NFU áp dụng cùng rule inline trong `CXM.NFUFileCreate`. Cutover chỉ xác nhận envelope version, không tự xác nhận các DOT/parser/business changes V36.

> Source evidence: `DLLs/UBFFImport/COrder.cs:20-84`
>
> Source evidence: `DLLs/UBFFImport/CXM.cs:36-75`

### Settings ownership

| Nguồn | Vai trò |
|---|---|
| DB `UBFSRuleList('Service')` | `FILE_PATH*`, upload/GIC path, inbound `FILE_ENCODING`, `NO_RUNTIME`, `NO_WRUNDAY`, `NO_MRUNDAY`, `TEST_RUN`. |
| Registry | Chọn DBID và connection string. |
| `App.config` | Chủ yếu `QUERYINTERVAL`; file hiện có `60000` ms. |

`QUERYINTERVAL` là polling interval, không phải business schedule. Wrapper nhận `DSID` nhưng implementation thấy trong repository chỉ bind `TopicStr`; không khẳng định DB settings được lọc theo DSID nếu chưa kiểm tra SP production.

> Source evidence: `Services/VieFUNDIE/App.config:3-8`
>
> Source evidence: `Services/VieFUNDIE/VieFUNDIE.cs:243-271`
>
> Source evidence: `Services/VieFUNDIE/VieFUNDIE.cs:299-325`
>
> Source evidence: `Services/VieFUNDIE/VieFUNDIE.cs:352-610`
>
> Source evidence: `DLLs/UBConnection/CDatabase.cs:1906-1923`
>
> Source evidence: `DLLs/UBConnection/CRegistry.cs:69-125`
>
> Source evidence: `DLLs/UBConnection/CRegistry.cs:221-250`

### Encoding inbound

DB-backed `FILE_ENCODING` được truyền vào `FFImport.ProcessAllX`; default code dùng code page 1252 khi setting thiếu/không hợp lệ. Đây là parser setting cho inbound, không phải encoding của outbound `OrdSet`/`MessageSet`.

> Source evidence: `Services/VieFUNDIE/VieFUNDIE.cs:443-610`
>
> Source evidence: `Services/VieFUNDIE/VieFUNDIE.cs:785-790`

## 7. Inbound DR/XR responses

1. External process drop response vào configured IN path.
2. `FFImport` lấy DB file-code metadata, dùng generic `FileCode*`/`FileCodeTest*` và special patterns.
3. C# dispatch physical order-response codes như `DR` vào `COrder.ImportXML`; `XR`/NFU response vào `CXM.ImportXML`.
4. Handler gọi response SP và đọc `iImportStatus`.
5. File được move/archive theo integration-specific branch; không có một archive invariant chung.

| Physical flow | Handler | SP boundary |
|---|---|---|
| `DR` và order-response family | `COrder.ImportXML` | `UBXMLRecOrderRespnProcess` |
| `XR`/NFU response | `CXM.ImportXML` | `UBXMLRecNFURespnProcess` |

Call-site không đủ để tuyên bố order được confirm/reject ra sao hoặc transaction, holding, NAV, status nào được tạo/cập nhật. Mọi final DB mutation là **DB/SP-dependent** nếu chưa có đúng production SP source/version.

`DR` là physical order response. Distribution trong TS/HS là luồng CAT/transaction-reconciliation khác, không phải ý nghĩa của `DR`.

> Source evidence: `DLLs/UBFFImport/FFImport.cs:721-760`
>
> Source evidence: `DLLs/UBFFImport/FFImport.cs:904-1499`
>
> Source evidence: `DLLs/UBFFImport/FFImport.cs:2166-2518`
>
> Source evidence: `DLLs/UBFFImport/COrder.cs:713-824`
>
> Source evidence: `DLLs/UBFFImport/CXM.cs:575-644`
>
> Source evidence: `DLLs/UBFFImport/FFImport.cs:2435-2472`
>
> Source evidence: `DLLs/UBFFImport/CAT.cs:1141-1175`

## 8. Ngoài phạm vi flow TFS/NFU

Cannex GIC là integration riêng dùng chung service/timer `VieFUNDIE`, với GIC path, generator và inbound/archive branches riêng. Source không chứng minh Cannex đi qua Fundserv hay cùng external gateway TFS/NFU.

> Source evidence: `Services/VieFUNDIE/VieFUNDIE.cs:763-782`
>
> Source evidence: `DLLs/UBFFImport/CannexOrder.cs:536-618`
>
> Source evidence: `DLLs/UBFFImport/FFImport.cs:1123-1328`

Identity/protocol của batch gateway, production SP parity và deployed binary parity cần evidence ngoài repository; không biến các khoảng trống này thành khẳng định.