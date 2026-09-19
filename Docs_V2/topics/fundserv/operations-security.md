# Fundserv — Operations & Security

> Checklist vận hành/bảo mật dựa trên source snapshot. Không ghi secrets hoặc production endpoints vào repository.

## 1. Configuration ownership

| Nguồn | Nội dung source-visible | Kiểm tra vận hành |
|---|---|---|
| Registry `HKLM` | DBID và connection string; code ưu tiên plaintext rồi mới encrypted fallback. | ACL registry, plaintext exposure, rotation và service identity. |
| DB `UBFSRuleList('Service')` | Paths, inbound encoding, blackout/test settings. | Exact values theo DB/environment, ownership và change audit. |
| `VieFUNDIE/App.config` | `QUERYINTERVAL`, debug/provider settings. | Binary-adjacent config và restart/change procedure. |
| MQ DB settings | Host/port/manager/channel/queues/charset/user/password/TLS/window. | Secret store, certificate expiry, queue ACL và environment separation. |

> Source evidence: `DLLs/UBConnection/CRegistry.cs:18-250`; `DLLs/UBConnection/CDatabase.cs:1906-1955`; `Services/VieFUNDIE/VieFUNDIE.cs:442-620`.

## 2. Scheduling và concurrency

- Timer stop/start và `m_JustEntered` chỉ ngăn re-entry trong cùng process.
- Không thấy named/distributed mutex trong batch path.
- Multi-DB/DSID được xử lý tuần tự.
- `m_FileCodeList` và path/settings là fields dùng lại; source có nguy cơ cache từ DB trước khi rotate DB.
- `m_FileUploadPath.Replace(...)` không gán lại kết quả.
- Comment “2 minutes” nhưng error delay source là 60000 ms.

Không chạy nhiều instance nếu chưa chứng minh SP claim/dequeue atomic và settings isolation.

> Source evidence: `Services/VieFUNDIE/VieFUNDIE.cs:654-818`; `Services/VieFUNDIE/VieFUNDIE.cs:442-620`.

## 3. Filesystem controls

Cho từng IN/OUT/Imported/Error/Skipped/GIC path:

- xác nhận local/UNC path và service account thực tế;
- áp dụng least-privilege ACL;
- tách test/prod và ngăn route chéo;
- monitor free space, file age, partial/zero-byte artifacts;
- bảo vệ PII trong XML/flat files và archive;
- ghi retention/purge owner và legal requirement;
- giữ immutable forensic copy khi incident;
- không cho operator sửa file tại chỗ.

Source tạo/move folder nhưng không chứng minh encryption-at-rest, malware scan, DLP, retention hoặc purge.

> Source evidence: `Services/VieFUNDIE/VieFUNDIE.cs:442-620`; `DLLs/UBFFImport/FFImport.cs:1957-2006`.

## 4. External gateway evidence

Repository chỉ chứng minh OUT/IN filesystem boundary. Runbook deployment phải bổ sung:

- gateway/service name và owner;
- protocol, host và network zone;
- pickup/drop frequency;
- authentication, host-key/certificate validation và rotation;
- ACK semantics và correlation;
- retry/dead-letter/duplicate behavior;
- maintenance window, SLA và escalation;
- logs/metrics để chứng minh delivery;
- retention trên gateway staging folders.

Nếu thiếu evidence này, không ghi “VieFUNDIE upload bằng SFTP/MQ”.

## 5. MQ security

Source wrapper có user/password, TLS cipher, certificate label/store và optional FIPS/peer settings. Review production phải xác nhận:

- TLS version/cipher policy hiện hành;
- certificate/key-store ACL và expiry;
- queue/channel authorization;
- secret encryption/rotation;
- test/prod queue isolation;
- message persistence/dead-letter policy;
- logging không làm lộ payload/PII.

Source snapshot còn tham chiếu protocol legacy; security owner phải xác nhận runtime/framework behavior và remediation.

> Source evidence: `Services/VieFUNDMQ/VieFUNDMQ.cs:133-283,481-858`.

## 6. Logging và monitoring

`VieFUNDIE` ghi Windows Event Log và DB event audit; file lifecycle dùng `UBFF_Add`/`UBFF_End`. Exception khi chính thao tác logging lỗi có thể bị nuốt, nên “không có log” không chứng minh không có lỗi.

Monitor tối thiểu:

- service heartbeat/timer duration;
- DB connectivity/SP failures;
- file counts/age theo folder;
- audit Add không có End;
- Error/Skipped tăng bất thường;
- gateway delivery lag;
- MQ connect/put/get và queue depth;
- disk/ACL/certificate expiry;
- stuck business states.

> Source evidence: `Services/VieFUNDIE/VieFUNDIE.cs:62-88`; `DLLs/UBFFImport/FFImport.cs:72-92,2060-2154`.

## 7. Data integrity và privacy gaps

Không thấy contract C# đầy đủ cho checksum/signature, duplicate content hash, archive encryption, PII redaction hoặc purge. `sample-co.xml` chỉ là envelope minh họa và không được chứa dữ liệu khách hàng thật.

Mọi production design cần xác định:

- field nào chứa SIN, account/bank hoặc identity data;
- encryption in transit/at rest;
- authorized roles;
- audit access/download/replay;
- data minimization và masking;
- retention/destruction;
- incident notification.

## 8. Production readiness gate

Trước release/change:

1. Gắn commit/build/DLL hash với deployment.
2. Snapshot exact SP/schema/lookup/config versions.
3. Xác nhận route batch/MQ theo dealer/DSID.
4. Test write/read/archive dưới service account.
5. Test gateway/MQ delivery và response correlation.
6. Test negative cases: disk full, ACL denied, DB timeout, malformed/duplicate file, MQ disconnect.
7. Chứng minh replay/idempotency hoặc có reconcile procedure.
8. Thiết lập alert/SLA/owner/escalation.
9. Review security, PII, certificate và retention.
10. Lưu evidence/UAT; source compile hoặc envelope V36 không đủ làm release evidence.