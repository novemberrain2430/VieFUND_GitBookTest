# Fundserv — State, Error & Recovery

> Trang canonical cho cách diễn giải trạng thái và replay. Không chạy SP mutation hoặc đưa file archive trở lại IN chỉ dựa trên tài liệu này; cần application owner/DBA phê duyệt.

## 1. Không gộp các milestone

```text
Local request created
  -> local file written / MQ put
  -> external delivery
  -> response received
  -> business response applied
  -> confirmation/settlement/reconciliation completed
```

| Milestone | Bằng chứng phù hợp |
|---|---|
| Local file written | File OUT + C# write result + local status call. |
| MQ put | Queue result + `MsgID` + DB send-status update. |
| External delivery | Gateway/MQ infrastructure log hoặc ACK ngoài application source. |
| Response received | Physical DR/XR audit hoặc MQ raw-response audit. |
| Business response applied | Response SP result + affected business rows. |
| Settlement/reconciliation | Các downstream inbound files và business reconciliation evidence. |

Không gọi local `iStatus=1`, file trong OUT hoặc `MQQueue.Put` thành công là “Fundserv accepted”.

> Source evidence: `DLLs/UBFFImport/COrder.cs:86-167`; `Services/VieFUNDMQ/VieFUNDMQ.cs:997-1209`.

## 2. Batch file audit và archive

Physical file thường đi qua `UBFF_Add`, parser/record SP và `UBFF_End`. Comment trong source mô tả file audit status: imported, system error, data error và skipped; exact DB values/meaning phải xác minh trên deployed SP/schema.

Archive source-visible:

| Handler result | Move hiện tại |
|---|---|
| `Ret == 1` | Imported, có thể thêm category/date |
| `Ret == 3` | Error |
| Khác `1/3` | Skipped |

File location chỉ phản ánh branch C#; không chứng minh transaction-level success.

> Source evidence: `DLLs/UBFFImport/FFImport.cs:1888-1930,2060-2154`.

## 3. Known error risks

### 3.1 `Ret == 2` không khớp comment

Comment nói system error `Ret == 2` không move file, nhưng code `else` đưa mọi giá trị ngoài `1/3` sang Skipped. Một path sau đó còn reset `Ret=1` và tiếp tục scan. Vì vậy:

- Skipped không phải retry queue đáng tin cậy;
- không hứa automatic retry;
- alert/return status có thể không phản ánh đúng file vừa lỗi.

> Source evidence: `DLLs/UBFFImport/FFImport.cs:1888-1930`.

### 3.2 Parser có thể trả success không đầy đủ

`COrder.ImportXML` và `CXM.ImportXML` khởi tạo return là `true`. Stream/reader failure hoặc không gặp root được nhận diện có path trả về mà không chứng minh `UBFF_End` và business processing hoàn tất. Một file có thể được move theo success branch dù audit/counters không đầy đủ.

> Source evidence: `DLLs/UBFFImport/COrder.cs:168-208,323-425`; `DLLs/UBFFImport/CXM.cs:151-271`.

### 3.3 Outbound write/state atomicity

- TFS chỉ gọi `UBOrderFileUpdateStatus` sau local write; vẫn chưa có transaction giữa filesystem và DB.
- NFU comment cho thấy create SP có thể advance state trước C# write.
- Cannex có path remove/advance pending item trong lúc dựng content trước final write.

> Source evidence: `DLLs/UBFFImport/COrder.cs:86-167`; `DLLs/UBFFImport/CXM.cs:77-150`; `DLLs/UBFFImport/CannexOrder.cs:271-347,507-619`.

## 4. Những bảo đảm không tìm thấy trong file flow

Source C# đã rà soát không cung cấp contract hoàn chỉnh cho:

- file-level ACK từ gateway/Fundserv;
- retry count/backoff/dead-letter;
- resend API;
- checksum/signature verification;
- content-hash duplicate suppression;
- transaction bao trùm toàn file;
- archive retention/purge.

Một phần duplicate/idempotency có thể nằm trong SP production, nhưng phải ghi **DB/SP-dependent** cho đến khi có definition/test evidence.

## 5. Quy trình điều tra an toàn

1. Xác định đúng pipeline: batch hay MQ.
2. Chụp DBID/DSID, host, binary/build, config và time window.
3. Giữ immutable copy, filename, size, timestamps và hash của artifact.
4. Đối chiếu Windows Event Log và DB event audit.
5. Với batch: đối chiếu `UBFF_Add`, `UBFF_End`, counters, raw response nếu có và exact archive destination.
6. Với MQ: đối chiếu queue, `MsgID`, put/get time, raw response và DB message row.
7. Kiểm tra từng affected business key/status; xác định mutation đã commit một phần hay chưa.
8. Lấy deployed SP definition để đánh giá duplicate/idempotency.
9. Quyết định reconcile, rollback hoặc replay cùng owner/DBA.

## 6. Replay approval checklist

Chỉ replay khi có đủ:

- test/production environment được xác định rõ;
- root cause và blast radius;
- baseline/post-state business rows;
- idempotency hoặc duplicate-handling evidence;
- rollback/reconciliation plan;
- owner và DBA approval;
- gateway/MQ coordination nếu artifact đã rời application boundary;
- tiêu chí success bao gồm DB business state, không chỉ file location.

Không sửa filename/body hoặc copy Error/Skipped về IN theo thói quen. Mock procedure chỉ dùng test environment: [Mock Response Analysis](mock-response-analysis.md).

## 7. Monitoring tối thiểu

- OUT file age và pickup evidence.
- IN/Error/Skipped file count/age.
- `UBFF_Add` không có matching `UBFF_End`.
- File Imported nhưng counters/business mutation rỗng.
- MQ queue depth, connect/open/put/get errors và stale message rows.
- Orders/NFU ở trạng thái trung gian quá SLA.
- Disk space và folder ACL failures.

Threshold/SLA production phải do owner xác nhận; repository không chứa giá trị canonical.