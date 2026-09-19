# Fundserv Standards V36 — current assessment và verification plan

> [!IMPORTANT]
> Đây là assessment của repository snapshot, không phải tracker deployment. Trạng thái canonical phải nằm tại [V36 Compliance Matrix](v36-compliance-matrix.md). [V36 Requirements](v36-requirements.md) chỉ là extract không đầy đủ đến trang 80/179; mọi quyết định implementation phải được đối chiếu với bộ requirement/XSD V36 đầy đủ do Fundserv phát hành.

Tất cả requirement dưới đây mang nhãn **Historical requirement**. Mọi trạng thái deployment đều là **Deployment unverified** cho đến khi có build/DB/config/UAT evidence. Tài liệu này cố ý không dùng checkbox “Pending/Done”, vì source snapshot hoặc SQL patch không chứng minh một thay đổi đã deploy.

Các path source tính từ thư mục gốc `SourceCode/`, theo [Fundserv README](README.md).

## 1. Quy tắc đánh giá

| Evidence class | Được phép kết luận | Không được phép kết luận |
|---|---|---|
| **Verified source** | Call path hoặc hành vi hiện diện trong source snapshot. | Binary production được build từ source đó hoặc behavior đã deploy. |
| **DB/SP-dependent** | Tên SP, parameter và điểm giao giữa C# với DB. | Filename, body XML, mapping/persistence/state cuối nếu chưa có current deployed SP/schema/record definition. |
| **Historical requirement** | Nội dung chuẩn cần đáp ứng và fixture cần xây dựng. | Runtime hiện tại đã hoặc chưa compliant chỉ từ requirement. |
| **Deployment unverified** | Thiếu một hoặc nhiều artifact deployment bắt buộc. | “Done”, “compatible”, “production-ready” hoặc “Out of Scope”. |

SQL snapshot tại `MyPortfolioNew/VieFUND-Platform/src/SQLScript/000_4_CreateSP.sql` và các SQL patch rời dưới `Docs_V2/topics/fundserv/` có thể mâu thuẫn. Không artifact nào tự chứng minh SP production nếu thiếu migration/deployment linkage.

## 2. Current assessment

| Scope | Repository assessment | Evidence class |
|---|---|---|
| DOT 149 — Deductions | Bốn V36 fields chưa thấy trong source model đã rà soát; mapping/persistence còn phụ thuộc DB/SP. Không có requirement tự gán vào outbound TFS. | Verified source gap; DB/SP-dependent; Deployment unverified |
| DOT 153 — Quebec Joint | Account Setup generator snapshot chưa thể hiện đầy đủ rule `QC/T` và exactly-one owner. | Verified source gap; DB/SP-dependent; Deployment unverified |
| DOT 175 — ID Type C wording | Code lưu value qua SP; wording có khả năng là lookup data. | DB/lookup-dependent; Deployment unverified |
| DOT 155 — Client Name Fee Redemption | UI còn disable AOT cho type 4; SQL snapshot còn filter/return Client Name ở fee generation. | Verified source gap; DB/SP-dependent; Deployment unverified |
| DOT 163 — RRIF/FHSA Successor | Internal UI có RRIF một phần, thiếu FHSA; outbound vẫn dùng TFSA-only gate/tag cũ. | Verified source/protocol gap; DB/SP-dependent; Deployment unverified |
| DOT 178 — Product Type | Allowable values lấy từ DB lookup; current production values chưa biết. | DB/lookup-dependent; Deployment unverified |
| DOT 180 — CustomDate 500 | Parser/persistence path không thấy hard cap 250. | Source-visible capacity; schema/deployment unverified |
| DOT 158 — Terminated PS account | Parser có nguy cơ bỏ account không có Fund Position. | Verified source risk; DB/SP-dependent; Deployment unverified |
| DOT 183 — GS AmtValue | ASM/ASP parser và SQL amount path có vẻ đủ width. | Source-visible capacity; schema/deployment unverified |
| DOT 165 — myserv privacy | Không có source-visible myserv artifact đủ để quyết định applicability. | Architecture/deployment unverified |

## 3. Cross-cutting boundary — V36 envelope cutoff

**Requirement / intent (Historical).** Outbound TFS phải dùng đúng V36 envelope tại cutover và body phải đáp ứng các business/schema rule V36 tương ứng.

**Repository evidence (Verified source + DB/SP-dependent).** `GetFSVersion` chuyển mặc định sang 36 từ 2026-06-13; `OrderMsgCreate` chỉ đặt `OrdSet Version`. `UBOrderCreateFile` cung cấp `FileName`, `OrderMSG`, `iVersion`, `bLTI`, `iFileID`; sau khi C# ghi file, `UBOrderFileUpdateStatus` thực hiện state mutation.

Source evidence: `DLLs/UBFFImport/COrder.cs:20-49, 89-142`.

**Gap/test.** Phải xác minh current deployed SP sinh filename/body, record definitions, ordering/conditional elements, status transition và gateway handoff. Fixture chỉ assert `Version="36"` không đủ để pass bất kỳ DOT nào bên dưới. Test boundary tối thiểu gồm trước cutoff, đúng cutoff, SP override version, empty body, write failure và status update chỉ sau write thành công.

## 4. DOT-by-DOT requirement, evidence và gap/test

### DOT 149 — TCR Deductions

**Requirement (Historical).** Thêm `EarlyRdmtnFee`, `DlrAdvsrFee`, `MVA`, `IRSTax` trong `Dedns` cho TS/HS Sell/Transfer/Distribution và FS Sell; align myserv; áp dụng rule hạn chế `OtherFee` theo V36.

**Repository evidence.** `CDedns` source model còn các field cũ và chưa có bốn field V36. Outbound TFS C# nhận `OrderMSG` từ SP và không synthesize deduction fields.

Source evidence: `DLLs/UBExport/TS_Export.cs:467-483`; `DLLs/UBFFImport/COrder.cs:103-142`.

**Gap/test.**

- Lấy official V36 XSD và deployed DB record definitions/SP trước khi thiết kế column/type; không suy ra schema production từ C# model.
- Tạo fixture TS, HS và FS cho từng field, field combinations, absent optional fields, precision/length boundary và invalid values.
- Trace XML → record definition → SP → DB → UI/report/calculation; kiểm tra `TotFees`/`TotTaxClawback` ở đúng channel nếu hệ thống thực sự consume chúng.
- Test `OtherFee` rule riêng cho FS, TS historical pre-cutover và segregated fund cases.
- Assert outbound TFS không tự inject bốn deduction chỉ vì envelope là V36.

### DOT 153 — Quebec Joint Account Setup

**Requirement (Historical).** New Account Setup với Tax Code `QC` chỉ chấp nhận `JntSurType=T`; `RecipientCode=2` + `QC` yêu cầu đúng một `JntOwner`.

**Repository evidence.** Account Setup SQL snapshot lấy Tax Code nhưng vẫn có default `JntSurType='J'` và loop tối đa năm joint owners; không thấy V36 QC guard ở đoạn generator.

Source evidence: `MyPortfolioNew/VieFUND-Platform/src/SQLScript/000_4_CreateSP.sql:353327-353420`.

**Gap/test.** Trace mọi entry path (UI, onboarding/import, direct SP, file generator). Fixture phải cover QC recipient 2 với 0/1/2 owners, `T` và non-`T`; non-QC control cases; edit legacy data; generated TFS/NFU body và expected error handling. So sánh deployed SP với snapshot/patch trước khi gắn status compliance.

### DOT 175 — Client Identity Verification wording

**Requirement (Historical).** Description của ID Type `C` đổi thành “Provincial or territorial identity card”; code `C` và process không đổi.

**Repository evidence.** UI đọc/lưu `IDType` qua SP và giữ value riêng với description.

Source evidence: `WebApp/Main/PanelClientIdentAdd.aspx.cs:75-88, 132-186`.

**Gap/test.** Inventory lookup seed/current rows và mọi consumer EN/FR; xác minh add/edit/read round-trip vẫn lưu `C`; text mới hiển thị ở tất cả màn hình/report liên quan; text cũ không còn ở active lookup. Không đổi business validation ngoài wording nếu full requirement không yêu cầu.

### DOT 155 — Client Name Distributor-Placed Fee Redemption

**Requirement (Historical).** Cho phép `4/blank/blank` trên Client Name, bắt buộc N$M, EPA eligible, hỗ trợ **As-of-trade (AOT)** backdating và reversal, cùng sales-tax/Gross-Net guidance. AOT không phải Account Ownership Transfer.

**Repository evidence.** UI hiện disable AOT cho sell type `4`. Canonical SQL snapshot còn loại `AccountDesignation='1'` khỏi fee batch và return Client Account trong one-item path.

Source evidence: `WebApp/Main/PopupTradeAdd.aspx.cs:943-1012`; `MyPortfolioNew/VieFUND-Platform/src/SQLScript/000_4_CreateSP.sql:324007-324045, 324184-324187`.

**Gap/test.** Lập call-path matrix cho manual trade, scheduled/automatic fee, short path, basket restriction, correction/reversal và outbound generation. Test Client Name + N$M success; non-N$M rejection ở UI và SP; AOT date accepted; reversal; EPA eligibility; tax/Gross-Net cases; non-Client Name regressions. So sánh generated XML và return/error mapping với official schema. Không coi SQL patch rời hoặc một message code là end-to-end completion.

### DOT 163 — Successor on RRIF and FHSA

**Requirement (Historical).** Mở rộng Successor từ segregated/Client Name TFSA sang **cả Client Name RRIF và FHSA**; rename `TFSASucsr→Sucsr`, `AddTFSASucsr→AddSucsr`; cover Account Setup, Account Transfer, NFU Add, TS/HS/NS reconciliation và myserv; áp dụng Death Beneficiary/Successor cùng Quebec/segregated/locked-in validations.

**Repository evidence.** `PopupPlanAdd` hiển thị/lưu cho TFSA và `IsRIFPlan`, nhưng không nhận FHSA `22`. Outbound setup/transfer SQL còn gate bằng `@bTFSA`, gọi `UBFSXMLTFSASucsr` và sinh `<TFSASucsr>`.

Source evidence: `WebApp/Main/PopupPlanAdd.aspx.cs:572-576, 2199-2216, 2453-2456, 2510-2527`; `MyPortfolioNew/VieFUND-Platform/src/SQLScript/000_4_CreateSP.sql:353327-353355, 353522-353588, 353744-353875, 354620-354664`.

**Gap/test.** Trace storage, audit, UI, setup generator, transfer generator, NFU Add Successor, inbound TS/HS/NS parser/export model và myserv boundary. Fixture matrix phải cover RRIF/FHSA/TFSA; QC/non-QC; segregated/non-segregated; locked-in/non-locked-in; Death Beneficiary only, Successor only, neither và both. Assert V36 emits/accepts `Sucsr`/`AddSucsr` where required and does not silently use old TFSA tags. Internal RRIF UI support không được dùng làm bằng chứng protocol compliance.

### DOT 178 — Fund Setup Product Type

**Requirement (Historical).** Add `B — Bullion`, remove `E — ETF` và `O — Other` khỏi allowable values; use `[A-Z]{1}` schema type for FD/MD/Fund List.

**Repository evidence.** `UBFundTypeList` trả rows từ `UB_Def_FundType`; snapshot không chứng minh current deployed lookup values hoặc validation cho new records.

Source evidence: `MyPortfolioNew/VieFUND-Platform/src/SQLScript/000_4_CreateSP.sql:395164-395183`.

**Gap/test.** Xác minh official XSD, lookup migration và add/update/import validation. Test `B` accepted; `E/O` rejected theo V36 tại boundary cần enforce; unknown single-letter behavior theo full standard; historical E/O records vẫn read/display an toàn mà không tái-cho phép tạo dữ liệu invalid. Cover FD, MD và Fund List consumers.

### DOT 180 — CustomDate 250 to 500

**Requirement (Historical).** Maximum occurrence `CustomDate` tăng **250→500** cho Fund Model, Buy Model và Sell Model trong FD/MD/Fund List.

**Repository evidence.** `CFD` loop và append một row cho mỗi `CUSTOMDATE` mà không thấy hard cap 250; SQL snapshot insert/update từng custom-date row.

Source evidence: `DLLs/UBFFImport/CFD.cs:173-225`; `MyPortfolioNew/VieFUND-Platform/src/SQLScript/000_4_CreateSP.sql:367785-367798`.

**Gap/test.** Chạy fixture riêng cho 250, 251, 500 và 501 occurrences trên cả FD và MD, cả ba model sections. Verify schema/record definition, all rows persisted, transaction/rollback behavior, duplicate date semantics, memory/time và deployed binary/SP parity. Expected 501 behavior phải lấy từ official V36 XSD. Source loop không có cap chỉ là capacity evidence, không phải production compatibility.

### DOT 158 — Terminated account/position in PS

**Requirement (Historical).** Manufacturer report terminated account với Account Status `Terminated` trong hai tháng liên tiếp; zero-balance Fund Position không còn bắt buộc. Rule thuộc **terminated account reporting**.

**Repository evidence.** Parser chỉ process khi `DataAcctTB` và `DataPosTB` đều có row; account-only record sau đó bị clear. Đây là risk trực tiếp đối với V36 account-without-position case.

Source evidence: `DLLs/UBFFImport/CAA.cs:2258-2348`.

**Gap/test.** Tạo PS fixture cho terminated account không có `FundPosition`, có optional zero position, nhiều accounts hỗn hợp và active-account controls. Assert account status được process/persist/audit dù position list rỗng; không tạo phantom position; counters và replay không bỏ record. Trace `ImportXMLPSPProcess` đến deployed SP/schema trước khi quyết định fix location.

### DOT 183 — GS AmtValue width

**Requirement (Historical).** GS-only `AmtValue`: integer digits **9→11**, `maxLength 14→16`, `value14→value16`, pattern `\d{1,11}\.\d{2,4}`, max `99,999,999,999.9999`.

**Repository evidence.** Physical codes `ASM/ASP` dispatch vào `CASM`; generic element read không có local length guard ở path đã đọc. `UBASMHeaderAdd` nhận amount bằng `varchar(20)` rồi convert sang `money`.

Source evidence: `DLLs/UBFFImport/FFImport.cs:2492-2497`; `DLLs/UBFFImport/CASM.cs:444-503`; `MyPortfolioNew/VieFUND-Platform/src/SQLScript/000_4_CreateSP.sql:177688-177724`.

**Gap/test.** Xác nhận mapping GS↔ASM/ASP, local record definitions, all header/participant/payment SPs và actual DB columns. Test 9-digit legacy, 10/11-digit values, exact max, 2/3/4 decimals, malformed values và 12 integer digits. Verify precision không bị truncate/round ngoài rule. Capacity của `varchar(20)`/`money` không chứng minh deployed schema hoặc parser production compliant.

### DOT 165 — myserv Minimizing Data Exchange Phase 1

**Requirement (Historical).** myserv V36 removes SIN search, returns `SINPartial`, removes relevant `IDVerify`, returns `BkAcctNumPartial`, and supports permitted PDF masking behavior. TFS/NFU Phase 2 chỉ được requirement mô tả là anticipated V37 work.

**Repository evidence.** Snapshot không có đủ source-visible `fundcom.xsd`/myserv implementation để xác nhận behavior hoặc applicability.

**Gap/test.** Lấy architecture inventory, endpoint ownership, gateway/vendor contract, deployed schema/version và traffic/config evidence. Nếu có myserv consumer/provider, test omitted full SIN/bank data, exactly-four partial values, removed search/IDVerify and backward/error handling. Nếu xác nhận không áp dụng, ghi owner, system boundary và deployment evidence vào compliance matrix; không dùng “không tìm thấy trong repo” làm bằng chứng Out of Scope.

## 5. Evidence gate trước khi công bố compliant/deployed

Chỉ cập nhật trạng thái canonical khi có đủ evidence phù hợp với từng DOT:

1. Bộ Fundserv V36 requirement/XSD/layout đầy đủ, không chỉ extract đến trang 80.
2. Commit/build identifier và hash của DLL/service/WebApp artifact thực sự deploy.
3. Current production DB schema, record definitions, lookup rows và exact SP definitions.
4. Config/routing chứng minh channel được dùng (batch, MQ, myserv, external gateway).
5. Automated fixture results và Fundserv UAT evidence cho positive, negative và boundary cases.
6. Rollback/compatibility decision cho coexistence V35/V36 nếu deployment window yêu cầu.
7. Mapping requirement → evidence → residual gap được cập nhật tại [V36 Compliance Matrix](v36-compliance-matrix.md).

Nếu thiếu các artifact trên, kết luận đúng vẫn là **Deployment unverified**, kể cả khi source compile, parser không throw hoặc envelope ghi version 36.

## 6. Tài liệu liên quan

- [Fundserv topic guide](README.md)
- [V36 Compliance Matrix — canonical](v36-compliance-matrix.md)
- [V36 Requirements — incomplete extract](v36-requirements.md)
- [V36 Explanation](v36-explanation.md)
- [Source Code Guide](source-code-guide.md)
- [Fee Redemption](fee-redemption.md)
- [AcctDesig implementation notes](4.AcctDesig/README.md)
