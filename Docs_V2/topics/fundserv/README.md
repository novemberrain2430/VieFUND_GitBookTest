# Fundserv — Hướng dẫn đọc tài liệu

> Tài liệu về các kênh trao đổi order/message và file giữa VieFUND, Fundserv và các hệ thống liên quan.
>
> **Rà soát theo source:** 2026-09-15. Các đường dẫn source trong topic này tính từ thư mục gốc `SourceCode/`.

## 1. Bắt đầu từ đâu?

Không đọc các file theo thứ tự alphabet. Chọn lộ trình phù hợp:

### Developer mới

1. [System Boundary](system-boundary.md) — phân biệt batch filesystem, IBM MQ và gateway ngoài repository.
2. [Source Code Guide](source-code-guide.md) — entry point, project và dependency chính.
3. [Batch File Flow](batch-file-flow.md) — cách tạo outbound và nhận inbound.
4. [Inbound Dispatch Matrix](inbound-dispatch-matrix.md) — file code nào đi vào handler nào.
5. [State, Error & Recovery](state-error-recovery.md) — trạng thái, lỗi và cách replay an toàn.

### Support / vận hành

1. [System Boundary](system-boundary.md).
2. [State, Error & Recovery](state-error-recovery.md).
3. [Operations & Security](operations-security.md).
4. [Debug Guide](debug-guide.md).
5. [Mock Response Analysis](mock-response-analysis.md) — chỉ dùng trong môi trường test.

### Phát triển hoặc review V36

1. [V36 Compliance Matrix](v36-compliance-matrix.md) — trang canonical về phạm vi và bằng chứng triển khai.
2. [V36 Requirements](v36-requirements.md) — **bản trích không đầy đủ, chỉ đến trang 80/179**.
3. [V36 Explanation](v36-explanation.md) — diễn giải nghiệp vụ đã hiệu chỉnh.
4. [V36 Implementation Plan](v36-implementation-plan.md) — kế hoạch/historical tracker, không phải bằng chứng deployment.
5. [Fee Redemption](fee-redemption.md) và [AcctDesig implementation notes](4.AcctDesig/README.md).

### Tìm hiểu tích hợp ngoài Fundserv

Đọc [Integration Index](integration-index.md). Các luồng Cannex, Fundata, CESP, regulatory export, EFT, email, document ingestion, e-sign và FIX chỉ được cross-link tại đây; chúng không phải tất cả đều là file Fundserv.

## 2. Kiến trúc cần nhớ

VieFUND có **hai kênh Fundserv độc lập**:

```text
                       +-- VieFUNDIE --> OUT folder --> gateway ngoài repo --> Fundserv
WebApp --> Database ---+
                       +-- VieFUNDMQ --> IBM MQ trực tiếp -------------> Fundserv
```

- `VieFUNDIE` sinh TFS/order, NFU và Cannex GIC output, sau đó quét inbound folder.
- `VieFUNDMQ` lấy order message riêng từ DB và gửi trực tiếp vào MQ; service này không upload file do `VieFUNDIE` tạo.
- Repository không chứa FTP/SFTP client cho hop từ OUT folder đến Fundserv. Không được mô tả hop này là do `VieFUNDIE` thực hiện.

> **Source evidence:** orchestration batch nằm tại `Services/VieFUNDIE/VieFUNDIE.cs:654-818`; MQ gửi/nhận message trực tiếp tại `Services/VieFUNDMQ/VieFUNDMQ.cs:951-1210`.

## 3. Thứ tự ưu tiên khi tài liệu mâu thuẫn

1. **Runtime source và SQL/config đã xác nhận đang deploy**.
2. Các trang canonical trong bảng dưới đây.
3. Source snapshot trong repository nhưng chưa xác nhận binary/deployment parity.
4. Requirement extract, implementation plan và tài liệu lịch sử.
5. Sample hoặc diagram minh họa.

Lưu ý:

- Một số service reference DLL trong `WebApp/bin`; source trong `DLLs/*` có thể không trùng binary production.
- Filename, XML body và nhiều state transition nằm trong stored procedure. Nếu không có đúng version SQL production, tài liệu phải ghi `DB/SP-dependent`, không suy đoán.
- `v36-requirements.md` là text extract bị thiếu phần sau trang 80; không dùng như bản tiêu chuẩn hoàn chỉnh.

## 4. Nhãn và quy ước dẫn chứng

| Nhãn | Ý nghĩa |
|---|---|
| **Verified** | Có call path hoặc hành vi thấy trực tiếp trong source repository. |
| **DB/SP-dependent** | C# chỉ cho biết tên SP/parameter; logic cuối nằm trong SQL chưa xác nhận deployment. |
| **External boundary** | Hành vi thuộc gateway, scheduler hoặc hệ thống ngoài repository. |
| **Historical** | Kế hoạch/snapshot cũ; không chứng minh trạng thái production hiện tại. |

Dẫn chứng được viết ngắn gọn theo mẫu:

```text
Source evidence: DLLs/UBFFImport/COrder.cs:20-85
```

Line range dùng để định vị nhanh, không thay thế code review. Khi source thay đổi, cập nhật ngày rà soát và line range liên quan.

## 5. Bản đồ tài liệu

### Canonical — dùng làm điểm tham chiếu chính

| Tài liệu | Nội dung |
|---|---|
| [System Boundary](system-boundary.md) | Actors, trust boundary và hai kênh batch/MQ. |
| [Source Code Guide](source-code-guide.md) | Entry points và repository map. |
| [Batch File Flow](batch-file-flow.md) | Outbound TFS/NFU/GIC và inbound polling. |
| [MQ Realtime Flow](mq-realtime-flow.md) | IBM MQ send/receive, status và TLS/config. |
| [Inbound Dispatch Matrix](inbound-dispatch-matrix.md) | Physical code/pattern → parser → archive category. |
| [State, Error & Recovery](state-error-recovery.md) | State machine, audit, retry/replay và known risks. |
| [Operations & Security](operations-security.md) | Paths, schedule, monitoring, ACL, secrets và retention gaps. |
| [V36 Compliance Matrix](v36-compliance-matrix.md) | Requirement → code evidence → trạng thái xác minh. |
| [Integration Index](integration-index.md) | Ranh giới với các hệ thống ngoài khác. |

### Chuyên đề bổ trợ

| Tài liệu | Cách sử dụng |
|---|---|
| [Files Dataflow](files-dataflow.md) | Góc nhìn nghiệp vụ và vòng đời dữ liệu; dùng cùng dispatch matrix. |
| [TFS/NFU Flow](tfs-nfu-flow.md) | Trace UI → DB → batch/MQ → response. |
| [TFS/NFU Flow Chart](tfs-nfu-flow-chart.md) | Diagram tóm tắt; nội dung chữ nằm ở trang flow chính. |
| [Debug Guide](debug-guide.md) | Breakpoint, query và kiểm tra filesystem/MQ. |
| [Mock Response Analysis](mock-response-analysis.md) | Tạo DR/XR test; không chạy trên production. |
| [Fee Redemption](fee-redemption.md) | DOT 155 và call chain fee redemption. |
| [Sample Order Envelope](sample-co.xml) | Chỉ minh họa envelope do C# tạo; body/filename là DB/SP-dependent. |

### Reference / historical

| Tài liệu | Cảnh báo |
|---|---|
| [V36 Requirements](v36-requirements.md) | Extract không đầy đủ, dừng ở trang 80/179. |
| [V36 Explanation](v36-explanation.md) | Diễn giải; luôn đối chiếu compliance matrix. |
| [V36 Implementation Plan](v36-implementation-plan.md) | Historical tracker, không đồng nghĩa đã deploy. |
| [AcctDesig notes](4.AcctDesig/README.md) | SQL snapshot và checklist riêng cho DOT 155. |

## 6. Các giới hạn chưa thể xác minh từ repository

- Gateway nào pickup/drop batch files, lịch chạy, ACK và credentials của gateway.
- SP production có đúng với SQL snapshot trong repository hay không.
- Binary trong `WebApp/bin` có trùng source `DLLs/*` hay không.
- Chính sách production về retention, purge, duplicate suppression và manual replay.
- Dealer/DSID nào được route batch, MQ hoặc cả hai.

Không biến các điểm trên thành khẳng định. Ghi rõ owner và bằng chứng deployment khi bổ sung.
