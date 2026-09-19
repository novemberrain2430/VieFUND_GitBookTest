# Fundserv Standards V36 — diễn giải nghiệp vụ đã hiệu chỉnh

> [!IMPORTANT]
> Đây là tài liệu diễn giải và đánh giá **source snapshot**, không phải chứng nhận tuân thủ hay bằng chứng đã deploy. Trạng thái canonical phải được quản lý tại [V36 Compliance Matrix](v36-compliance-matrix.md). Bản [V36 Requirements](v36-requirements.md) trong repository chỉ là extract không đầy đủ, dừng ở trang 80/179 và còn lỗi encoding; các image assets đã được nối lại nhưng không khôi phục phần text bị thiếu. Khi quyết định triển khai phải dùng bộ requirement/XSD V36 đầy đủ do Fundserv phát hành.

Các path source dưới đây tính từ thư mục gốc `SourceCode/`, theo quy ước của [Fundserv README](README.md).

## 1. Cách đọc bằng chứng

| Nhãn | Ý nghĩa trong tài liệu này |
|---|---|
| **Historical requirement** | Nội dung/mốc thời gian lấy từ requirement V36 ngày 2025-10-07. Đây là yêu cầu cần đối chiếu, không chứng minh code hoặc production đã thay đổi. |
| **Verified source** | Hành vi nhìn thấy trực tiếp trong source snapshot của repository. Nhãn này không đồng nghĩa binary đó đã build hoặc deploy. |
| **DB/SP-dependent** | C# chỉ chuyển dữ liệu hoặc gọi stored procedure/lookup; filename, XML body, mapping, persistence hay state cuối phụ thuộc DB/SP/record definition. |
| **Deployment unverified** | Không có deployed commit/build hash, DLL hash, current production schema/SP/config hoặc UAT evidence để xác nhận parity với snapshot. |

Requirement extract ghi External UAT là 2026-03-25 và go-live là 2026-06-15. Đây là **Historical requirement milestone**; không được dùng các ngày này để suy ra deployment đã xảy ra.

## 2. Ranh giới quan trọng của outbound TFS V36

`COrder.GetFSVersion` chuyển version mặc định sang 36 từ ngày 2026-06-13, và `OrderMsgCreate` chỉ đặt giá trị đó vào attribute `OrdSet Version`. Điều này chỉ chứng minh source snapshot có **version-envelope cutoff**, không chứng minh body đáp ứng các business rule V36.

`UBOrderCreateFile` trả về `FileName`, `OrderMSG`, `iVersion`, `bLTI` và `iFileID`; C# wrap body rồi ghi file. Sau khi ghi thành công, C# gọi `UBOrderFileUpdateStatus`. Vì vậy filename, body trước khi wrap và final state mutation đều **DB/SP-dependent**.

Source evidence: `DLLs/UBFFImport/COrder.cs:20-49, 89-142`.

Không được suy ra parser, DB schema, stored procedure production hoặc gateway tương thích V36 chỉ vì output có `Version="36"`.

## 3. Diễn giải các thay đổi V36

### DOT 149 — TCR Deductions

**Historical requirement.** Thêm bốn element trong `Dedns`: `EarlyRdmtnFee`, `DlrAdvsrFee`, `MVA`, `IRSTax`. Phạm vi requirement là shared schema của TS/HS (`SellFund`, `TrnsfrFund`, `DistribFund`), FS (`SellFund`) và phần align myserv. Quy tắc `OtherFee` cũng bị thu hẹp theo từng file/process.

**Điểm hiệu chỉnh quan trọng.** Requirement này **không yêu cầu tự gán bốn deduction vào outbound TFS Order**. C# outbound nhận nguyên `OrderMSG` từ SP và chỉ bọc envelope; không có căn cứ để thêm hoặc tự suy diễn deduction vào TFS body.

**Verified source.** Model `CDedns` hiện có các field cũ như `ShortTermFee`, `AdminFee`, `OtherFee`, nhưng chưa có bốn symbol V36. Đây là dấu hiệu source snapshot chưa cung cấp bằng chứng implementation đầy đủ, không tự động chứng minh DB chưa hỗ trợ vì import/persistence còn phụ thuộc record definition và SP.

Source evidence: `DLLs/UBExport/TS_Export.cs:467-483`; `DLLs/UBFFImport/COrder.cs:103-142`.

**Phân loại:** Historical requirement; Verified source gap; DB/SP-dependent; Deployment unverified.

### DOT 153 — Quebec Joint Account Setup

**Historical requirement.** Với Account Setup mới có Tax Code `QC`, Joint Survivor Type chỉ được là `T` (Tenants in Common). Khi `RecipientCode=2` và Tax Code `QC`, `JntOwner` phải xuất hiện đúng một lần.

**Verified source.** SQL snapshot đọc Tax Code, nhưng flow Account Setup vẫn có thể default `JntSurType` thành `J` và xử lý tối đa năm joint owners; không thấy rule QC tương ứng trong đoạn generator. Do đó không thể coi các patch SQL rời dưới `Docs_V2/` là bằng chứng runtime hoặc deployment.

Source evidence: `MyPortfolioNew/VieFUND-Platform/src/SQLScript/000_4_CreateSP.sql:353327-353420`.

**Phân loại:** Historical requirement; source gap/conflicting artifacts; DB/SP-dependent; Deployment unverified.

### DOT 175 — Client Identity Verification terminology

**Historical requirement.** Chỉ đổi description của ID Type `C` từ “Provincial health card” thành “Provincial or territorial identity card”. Giá trị `C` và quy trình xác minh không đổi.

**Verified source / DB boundary.** UI đọc và lưu `IDType` qua SP; description/allowable list không được chứng minh là hard-coded tại màn hình này. Cần xác minh lookup data và mọi consumer EN/FR thay vì chỉ đổi một label ASPX.

Source evidence: `WebApp/Main/PanelClientIdentAdd.aspx.cs:75-88, 132-186`.

**Phân loại:** Historical requirement; DB/lookup-dependent; Deployment unverified.

### DOT 155 — Client Name Distributor-Placed Fee Redemption

**Historical requirement.** Mở Fee Redemption `4/blank/blank` cho Client Name, bắt buộc N$M settlement, bổ sung EPA eligibility, và hỗ trợ error correction bằng **As-of-trades (AOTs)** cùng reversals. AOT ở đây là **As-of-trade** — giao dịch backdated — không phải “Account Ownership Transfer”. Requirement còn có hướng dẫn sales tax và Gross/Net.

**Verified source.** `PopupTradeAdd` hiện gọi `Enable_AOT(false)` khi sell transaction type là `4`, trái với nhu cầu cho phép backdated Client Name Fee Redemption. SQL snapshot còn lọc `AccountDesignation <> '1'` trong batch fee generation và còn return cho Client Account trong one-item path.

Source evidence: `WebApp/Main/PopupTradeAdd.aspx.cs:943-1012`; `MyPortfolioNew/VieFUND-Platform/src/SQLScript/000_4_CreateSP.sql:324007-324045, 324184-324187`.

Các SQL patch rời có rule N$M/error code không đủ để chứng minh mọi entry path, EPA, AOT, reversal, sales tax và deployed SP đã đồng bộ.

**Phân loại:** Historical requirement; Verified source gap; DB/SP-dependent; Deployment unverified.

### DOT 163 — Successor cho RRIF và FHSA

**Historical requirement.** Trước V36, Fundserv chỉ hỗ trợ Successor cho segregated funds hoặc Client Name TFSA. V36 mở rộng protocol cho **cả Client Name RRIF và Client Name FHSA**, không phải chỉ FHSA. Scope gồm:

- đổi `TFSASucsr` thành `Sucsr` và `AddTFSASucsr` thành `AddSucsr`;
- Account Setup, Account Transfer và NFU Add Successor;
- TS/HS/NS reconciliation/demographic output và myserv alignment;
- validation Death Beneficiary hoặc Successor cho account mới phù hợp;
- rule riêng cho Quebec, non-segregated và locked-in cases theo requirement.

**Verified source.** UI/storage nội bộ có một phần logic cho TFSA và các type mà `IsRIFPlan` nhận diện, nhưng chưa có FHSA `22`. Điều đó không làm RRIF compliant end-to-end: outbound SQL vẫn gate successor bằng cờ TFSA, gọi `UBFSXMLTFSASucsr` và sinh tag `<TFSASucsr>` cũ. Transfer path cũng dùng gate cũ.

Source evidence: `WebApp/Main/PopupPlanAdd.aspx.cs:572-576, 2199-2216, 2453-2456, 2510-2527`; `MyPortfolioNew/VieFUND-Platform/src/SQLScript/000_4_CreateSP.sql:353327-353355, 353522-353588, 353744-353875, 354620-354664`.

**Phân loại:** Historical requirement; partial internal source support but protocol gap; DB/SP-dependent; Deployment unverified.

### DOT 178 — Fund Setup Product Type

**Historical requirement.** Thêm `B — Bullion`, loại `E — ETF` và `O — Other` khỏi allowable values, đồng thời đổi schema type sang pattern `[A-Z]{1}` cho FD/MD/Fund List.

**Verified source / DB boundary.** `UBFundTypeList` trả dữ liệu từ `UB_Def_FundType`; source snapshot không đủ để biết lookup production hiện có `B` hay đang expose `E/O`. Việc giữ historical records để đọc và việc chặn `E/O` cho dữ liệu V36 mới là hai concern khác nhau, cần test riêng.

Source evidence: `MyPortfolioNew/VieFUND-Platform/src/SQLScript/000_4_CreateSP.sql:395164-395183`.

**Phân loại:** Historical requirement; DB/lookup-dependent; Deployment unverified.

### DOT 180 — Fund Setup Custom Date Expansion

**Historical requirement.** Tăng maximum occurrence của `CustomDate` từ **250 lên 500** (`1-250` → `1-500`) cho Fund Model, Buy Model và Sell Model trong FD/MD/Fund List.

**Verified source.** Parser loop từng `CUSTOMDATE` và tạo một row, không thấy hard cap 250. SQL snapshot insert/update từng row và cũng không thấy count cap tại đoạn persistence đã đọc.

Source evidence: `DLLs/UBFFImport/CFD.cs:173-225`; `MyPortfolioNew/VieFUND-Platform/src/SQLScript/000_4_CreateSP.sql:367785-367798`.

Đây chỉ là **source-visible capacity**. Nó không chứng minh XSD/record definition, transaction behavior, performance, deployed DLL hay deployed SP chấp nhận 500.

**Phân loại:** Historical requirement; Verified source capacity; DB/schema-dependent; Deployment unverified.

### DOT 158 — Reporting Terminated Funds in PS

**Historical requirement.** Khi account bị terminated, manufacturer vẫn phải report account với Account Status `Terminated` trong **hai tháng liên tiếp**, nhưng cụm “with a zero balance” bị loại. Vì vậy không còn bắt buộc gửi zero-balance Fund Position cho terminated fund. Đây là rule về **terminated account reporting**, không chỉ là “terminated position”.

**Verified source risk.** Parser đọc `ACCTDTL` và optional `FUNDPOSITION`, nhưng chỉ gọi process khi cả account rows và position rows đều có dữ liệu; sau đó clear các table. Một terminated account không có Fund Position có thể bị bỏ khỏi process path. Việc parser không throw không đồng nghĩa compliant.

Source evidence: `DLLs/UBFFImport/CAA.cs:2258-2348`.

**Phân loại:** Historical requirement; open functional risk; DB/SP-dependent; Deployment unverified.

### DOT 183 — GS Amount Value expansion

**Historical requirement.** Chỉ cho GS `AmtValue`: phần nguyên tăng từ **9 lên 11 chữ số**, `maxLength` tăng từ **14 lên 16**, type đổi `value14` → `value16`, pattern `\d{1,11}\.\d{2,4}`; maximum được nêu là `99,999,999,999.9999`.

**Verified source.** Repository dispatch physical code `ASM/ASP` vào `CASM`; parser lấy element theo record definition mà không có length check tại đoạn đọc. SQL header nhận amount qua `varchar(20)` rồi convert sang `money`, nên path đã đọc có vẻ đủ capacity cho 11.4 digits.

Source evidence: `DLLs/UBFFImport/FFImport.cs:2492-2497`; `DLLs/UBFFImport/CASM.cs:444-503`; `MyPortfolioNew/VieFUND-Platform/src/SQLScript/000_4_CreateSP.sql:177688-177724`.

“Có vẻ đủ capacity” không chứng minh local record definition/XSD, tất cả GS sections, production DB type hoặc deployed binary đã tương thích.

**Phân loại:** Historical requirement; Verified source capacity; DB/schema-dependent; Deployment unverified.

### DOT 165 — Minimizing Data Exchange Phase 1

**Historical requirement.** V36 Phase 1 tập trung vào myserv: bỏ SIN search, dùng `SINPartial`, bỏ `IDVerify` trong các result liên quan, dùng `BkAcctNumPartial`, và cho phép masking SIN trên tax receipt PDF. TFS/NFU Phase 2 được mô tả là dự kiến cho V37/2027, không phải cam kết deployment trong repository này.

Không tìm thấy source-visible `fundcom.xsd`, `SINPartial` hoặc `BkAcctNumPartial` trong snapshot đã rà soát. Sự vắng mặt đó **không chứng minh production không tích hợp myserv** và không đủ để tự gắn “Out of Scope”. Cần architecture/deployment evidence bên ngoài snapshot.

**Phân loại:** Historical requirement; repository evidence absent; architecture/deployment unverified.

## 4. Kết luận hiện tại

| Nhóm | DOT | Kết luận an toàn từ snapshot |
|---|---|---|
| Gap/risk nhìn thấy | 153, 155, 163, 158 | Có source evidence mâu thuẫn hoặc bỏ sót requirement; cần implementation review và fixture test. |
| Chủ yếu DB/lookup-dependent | 149, 175, 178 | Source C# không đủ để kết luận schema/lookup/SP production đã hỗ trợ. |
| Có capacity nhìn thấy, chưa chứng minh compliance | 180, 183 | Không thấy hard cap tại path đã đọc, nhưng schema/deployment/UAT chưa xác minh. |
| Cần xác nhận architecture ngoài snapshot | 165 | Không được suy ra “Out of Scope” chỉ vì repository không có artifact myserv. |

Không mục nào trong bảng trên được hiểu là “production compatible” hoặc “deployed”. Xem [V36 Implementation Assessment](v36-implementation-plan.md) cho gap/test cụ thể và cập nhật kết quả cuối vào [V36 Compliance Matrix](v36-compliance-matrix.md).
