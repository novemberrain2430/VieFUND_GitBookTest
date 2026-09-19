# Fundserv V36 — Compliance Matrix

> **Canonical assessment, không phải chứng nhận compliance.** Requirement extract trong repository dừng ở trang 80/179; mọi quyết định phải đối chiếu bộ Fundserv V36 requirement/XSD đầy đủ và artifacts đang deploy.

## 1. Status vocabulary

| Status | Ý nghĩa |
|---|---|
| **Evidence only** | Có source/snapshot liên quan nhưng chưa đủ kết luận implementation. |
| **Open gap/risk** | Source-visible behavior mâu thuẫn hoặc có khả năng bỏ sót requirement. |
| **Capacity observed** | Không thấy hard cap tại path đã đọc; chưa chứng minh schema/deployment/UAT. |
| **Deployment unverified** | Thiếu build/SP/schema/config/UAT evidence production. |
| **Out of scope — proven** | Chỉ dùng khi có architecture/owner/deployment evidence xác nhận không áp dụng. |

Không dùng “Done/Compliant” chỉ vì code compile, parser không throw hoặc envelope có `Version="36"`.

## 2. Cross-cutting envelope evidence

`COrder`/`CXM` chuyển input `<=35` thành version 36 từ 2026-06-13. Đây chỉ là envelope cutoff; filename/body/final mutation vẫn DB/SP-dependent.

> Source evidence: `DLLs/UBFFImport/COrder.cs:20-49,86-167`; `DLLs/UBFFImport/CXM.cs:36-150`.

Status: **Evidence only; Deployment unverified**.

## 3. DOT matrix

| DOT | Requirement tóm tắt | Repository evidence | Assessment | Evidence/test còn cần |
|---|---|---|---|---|
| **149** | Thêm `EarlyRdmtnFee`, `DlrAdvsrFee`, `MVA`, `IRSTax` cho TS/HS/FS deductions; giới hạn `OtherFee`. | `CDedns` snapshot chưa có bốn field; TFS outbound C# chỉ wrap `OrderMSG`. | **Open gap; DB/SP-dependent** | Official XSD; deployed record definitions/SP; TS/HS/FS fixtures; không inject vào TFS order. |
| **153** | Quebec new joint setup dùng `JntSurType=T`; recipient 2 cần đúng một joint owner. | Conflicting SQL artifacts; patch `spOnboarding.sql` không chứng minh deployed generator/UI paths. | **Open gap; Deployment unverified** | Trace UI/onboarding/SP/generator; QC 0/1/2-owner negative/positive tests. |
| **175** | Đổi mô tả ID Type `C`; code/process không đổi. | UI đọc/lưu code qua SP; text có khả năng lookup-driven. | **Evidence only; DB/lookup-dependent** | Lookup EN/FR và all-consumer inventory; round-trip tests. |
| **155** | Client Name fee redemption, bắt buộc N$M, EPA, AOT/reversal/tax guidance. | Manual và auto fee paths riêng; candidate SQL mở Client Name/N$M nhưng SQL tổng còn chặn; UI chưa force N$M. | **Open gap; snapshot divergence** | Deployed SP diff; manual/auto/AOT/reversal/export/response tests. |
| **163** | Successor cho RRIF và FHSA; rename protocol tags và mở rộng setup/transfer/NFU/reconciliation. | Internal UI hỗ trợ một phần RRIF; FHSA/protocol tags còn gap trong snapshots. | **Open protocol gap** | RRIF/FHSA/TFSA matrix; QC/locked-in rules; deployed XML fixtures. |
| **178** | Add Bullion `B`; bỏ ETF `E`/Other `O`; schema single-letter pattern. | Values/validation lookup-driven. | **Evidence only; DB/lookup-dependent** | Lookup migration; historical read vs new-write tests; FD/MD/Fund List XSD. |
| **180** | `CustomDate` max 250→500 cho FD/MD model sections. | Parser/persistence path không thấy hard cap 250. | **Capacity observed** | 250/251/500/501 fixtures, all sections, deployed XSD/SP/performance. |
| **158** | Terminated account report hai tháng; không bắt buộc zero-balance Fund Position. | Parser có path chỉ process khi account và position tables đều có rows. | **Open functional risk** | Account-only PS fixture; persistence/audit/replay assertions. |
| **183** | GS `AmtValue` integer digits 9→11, maxLength 14→16, decimals vẫn 2–4. | ASM/ASP parser/SQL path có vẻ đủ width. | **Capacity observed** | Xác nhận GS mapping/all columns; boundary/overflow/precision tests. |
| **165** | myserv privacy/data minimization phase 1. | Không đủ myserv artifacts trong snapshot để quyết định applicability. | **Architecture unknown** | Owner/system inventory, endpoint/schema/deployment evidence; chỉ mark out-of-scope khi proven. |

### Source evidence chính

- DOT 149: `DLLs/UBExport/TS_Export.cs:467-483`; `DLLs/UBFFImport/COrder.cs:103-142`.
- DOT 153: `Docs_V2/topics/fundserv/spOnboarding.sql:68-76`; `MyPortfolioNew/VieFUND-Platform/src/SQLScript/000_4_CreateSP.sql:353327-353420`.
- DOT 175: `WebApp/Main/PanelClientIdentAdd.aspx.cs:75-88,132-186`.
- DOT 155: `WebApp/Main/PopupTradeAdd.aspx.cs:848-1055,3448-3469`; `Docs_V2/topics/fundserv/4.AcctDesig/UBFeeGenerateTrxOneItem.sql:103-247`; `MyPortfolioNew/VieFUND-Platform/src/SQLScript/000_4_CreateSP.sql:324042-324045,324184-324188`.
- DOT 163: `WebApp/Main/PopupPlanAdd.aspx.cs:572-576,2199-2216,2453-2527`; `MyPortfolioNew/VieFUND-Platform/src/SQLScript/000_4_CreateSP.sql:353327-353355,353522-353588,353744-353875,354620-354664`.
- DOT 178: `MyPortfolioNew/VieFUND-Platform/src/SQLScript/000_4_CreateSP.sql:395164-395183`.
- DOT 180: `DLLs/UBFFImport/CFD.cs:173-225`; `MyPortfolioNew/VieFUND-Platform/src/SQLScript/000_4_CreateSP.sql:367785-367798`.
- DOT 158: `DLLs/UBFFImport/CAA.cs:2258-2348`.
- DOT 183: `DLLs/UBFFImport/FFImport.cs:2492-2497`; `DLLs/UBFFImport/CASM.cs:444-503`; `MyPortfolioNew/VieFUND-Platform/src/SQLScript/000_4_CreateSP.sql:177688-177724`.
- DOT 165: kết quả inventory không xác định được executable myserv artifact; đây là **negative repository review**, không phải claim có thể chứng minh bằng một line source. Requirement được dẫn bên dưới và applicability cần architecture/deployment evidence.

Requirement citations:

- DOT 149: `Docs_V2/topics/fundserv/v36-requirements.md:127-215,833-1076`.
- DOT 153: `Docs_V2/topics/fundserv/v36-requirements.md:216-230`.
- DOT 175: `Docs_V2/topics/fundserv/v36-requirements.md:231-274`.
- DOT 155: `Docs_V2/topics/fundserv/v36-requirements.md:275-330`.
- DOT 163: `Docs_V2/topics/fundserv/v36-requirements.md:331-613,1077-1120`.
- DOT 178: `Docs_V2/topics/fundserv/v36-requirements.md:614-677`.
- DOT 180: `Docs_V2/topics/fundserv/v36-requirements.md:678-729`.
- DOT 158: `Docs_V2/topics/fundserv/v36-requirements.md:730-793`.
- DOT 183: `Docs_V2/topics/fundserv/v36-requirements.md:794-832`.
- DOT 165: `Docs_V2/topics/fundserv/v36-requirements.md:1121-1385`.

## 4. Evidence gate để đổi trạng thái

Mỗi DOT chỉ được nâng trạng thái khi có đủ phần áp dụng:

1. Official full V36 requirement/XSD/layout.
2. Deployed commit/build/DLL hash.
3. Exact deployed SP/schema/record definition/lookup version.
4. Routing/config/channel evidence.
5. Positive, negative và boundary fixture results.
6. Fundserv UAT/response evidence nếu flow qua Fundserv.
7. Regression/backward-compatibility evidence.
8. Owner sign-off và residual-risk decision.

## 5. Quan hệ tài liệu

- [V36 Explanation](v36-explanation.md): diễn giải nghiệp vụ và source gaps.
- [V36 Implementation Assessment](v36-implementation-plan.md): verification plan chi tiết.
- [V36 Requirements](v36-requirements.md): incomplete historical extract.
- [Fee Redemption](fee-redemption.md): DOT 155 call paths/snapshot divergence.

Ngày assessment hiện tại: **2026-09-15**. Cập nhật ngày và evidence links khi trạng thái thay đổi.