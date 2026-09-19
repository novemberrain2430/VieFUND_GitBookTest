# Integration Index — Fundserv và hệ thống ngoài

> Trang này xác định system boundary. Không phải mọi flow dùng `VieFUNDIE` hoặc file đều là Fundserv integration.

## 1. Status vocabulary

- **Runtime-wired:** có entry point/timer/Web handler và call path trong repository.
- **Source/reference present:** có source hoặc DLL reference nhưng deployment chưa xác nhận.
- **Legacy/partial:** branch stub, unreachable/commented hoặc source tự ghi feed không còn.
- **External boundary:** transfer agent/provider/endpoint thực tế không nằm trong repository.

## 2. Integration inventory

| Integration | Hướng | Component | Transport/artifact | Phân loại và documentation boundary |
|---|---|---|---|---|
| Fundserv batch TFS/NFU | Hai chiều | `VieFUNDIE`, `UBFFImport` | IN/OUT filesystem; external gateway | **Runtime-wired**. Canonical trong topic này. |
| Fundserv realtime order | Hai chiều | `VieFUNDMQ` | IBM MQ string messages | **Runtime-wired**. Không phải file transport. |
| Cannex GIC | Hai chiều | `VieFUNDIE`, `CannexOrder` | Flat files/folder | **Runtime-wired sibling**; nên có topic Cannex riêng. |
| Fundata/ETF/CI market data | Inbound | `VieFUNDIE`, `VieFUNDFF`, WebApp upload | Folder feeds, HTTP download, manual upload | **Runtime-wired**; provider/transfer của một số feed là external/unknown. |
| RESP/CESP | Hai chiều | `VieFUNDExport`, `CRESPFile`, `VieFUNDIE` | Outbound files/ZIP; inbound `.err/.pro/.reg` | **Runtime-wired**; nên có topic CESP riêng. |
| CRA/FHSA/RQ/CDIC | Outbound | `VieFUNDExport`, `UBExport` | XML/ZIP vào configured folder | **Runtime-wired**; final submission agent ngoài repo. |
| Concentra/Monarch/OPEN/Agora/MFDA/commission exports | Outbound | `VieFUNDExport` | CSV/XML/PDF/ZIP/filesystem | **Runtime-wired hoặc task-specific**; destination ownership DB/external. |
| Bank EFT | Outbound | `VieFUNDEFT` | Bank fixed-width/ZIP/DB blob | **Runtime-wired** cho BMO/RBC/TD/CIBC/CPA; Scotia branch là stub. |
| SMTP email attachments | Outbound | `VieFUNDEmail`, `SendEmail` | SMTP + DB BLOB attachments | **Runtime-wired**; không có inbound mailbox ingestion. |
| Document drop-folder | Inbound | `VieFUNDDoc` | Folder scanner → DB document | **Runtime-wired**; source party không xác định. |
| Onboarding | Hai chiều | `WebServices/OnBoarding` | SOAP/JSON HTTP | **Runtime-wired API**, không phải file exchange. |
| DocuSign/Signority/OneSpan | Hai chiều | e-sign services/DLLs | Vendor APIs/SDKs + PDF bytes | DocuSign/Signority **runtime-wired**; OneSpan source/reference, schedule unverified. |
| BBS | Hai chiều | `VieFUNDQFix` | FIX 4.4 | **Runtime-wired message integration**, không phải file. |
| Omnibus | Nội bộ/order origin | `DLLs/Omnibus` | DB/business processing | Source present; không tìm thấy standalone external file transport. |
| VieDOCS/VExport stubs | Hai chiều/partial | WebService projects | SOAP/WCF | **Legacy/partial**; không dùng làm bằng chứng active file integration. |

## 3. Source evidence theo nhóm

### Fundserv và shared inbox

> Source evidence: `Services/VieFUNDIE/VieFUNDIE.cs:654-818`; `DLLs/UBFFImport/FFImport.cs:910-1930`; `Services/VieFUNDMQ/VieFUNDMQ.cs:951-1536`.

### Cannex và market data

> Source evidence: `DLLs/UBFFImport/CannexOrder.cs:536-1233`; `DLLs/UBFFImport/FFImport.cs:910-1501,1712-1849`; `Services/VieFUNDFF/VieFUNDFF.cs:297-616`.

### Scheduled/regulatory exports

> Source evidence: `Services/VieFUNDExport/VieFUNDExport.cs:760-943,1902-2445,3505-4786`; `DLLs/UBExport/CRASubmission.cs:305-433`.

### EFT, email và documents

> Source evidence: `Services/VieFUNDEFT/VieFUNDEFT.cs:282-661`; `Services/VieFUNDEmail/VieFundEmail.cs:279-685`; `Services/VieFUNDDoc/VieFUNDDoc.cs:199-907`.

### APIs, e-sign và FIX

> Source evidence: `WebServices/OnBoarding/VieFUNDOnBoarding.cs:25-252,852-1016`; `Services/VieFUNDDocuSign/VieFUNDDocuSign/VieFUNDDocuSign.cs:189-747`; `Services/VieFUNDeSignority/VieFUNDeSignority.cs:190-435`; `Services/VieFUNDQFix/VieFUNDQFix.cs:265-650`.

## 4. Cách cross-link từ topic Fundserv

Giữ trong Fundserv:

- batch/MQ system boundary;
- TFS/NFU generation và DR/XR responses;
- shared-inbox warning;
- link đến integration owner/topic khác.

Không đặt chi tiết nghiệp vụ/file layout đầy đủ của Cannex, CESP, tax export, EFT, e-sign hoặc FIX vào Fundserv. Việc dùng chung service/folder không làm chúng thành Fundserv file.

## 5. Deployment caveats

- Nhiều service reference DLL trong `WebApp/bin`; source `DLLs/*` có thể lệch binary deploy.
- Provider/party và final transfer agent cho configured folder thường không encoded trong source.
- Project/source tồn tại không chứng minh service đã cài hoặc chạy production.
- Không tìm thấy standalone FTP/SFTP client cho các batch handoff đã rà soát.

Mỗi integration topic tương lai nên ghi: owner, direction, trigger, format, transport boundary, config source, audit/error/retry, security/retention, build/SP version và runbook.