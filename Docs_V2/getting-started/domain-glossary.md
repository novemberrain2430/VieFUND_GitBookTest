# 01 — Domain Glossary (Bảng thuật ngữ nghiệp vụ)

> Tài liệu này tổng hợp các thuật ngữ nghiệp vụ dùng trong hệ thống VieFUND.  
> **Đối tượng**: Developer .NET có kinh nghiệm, chưa biết nghiệp vụ quỹ đầu tư Canada.

---

## 1. Entities (Thực thể chính)

| Thuật ngữ | Tên trong code | Định nghĩa | BLL Class |
|---|---|---|---|
| **Client** | `CCustomer` | Nhà đầu tư (investor) — người sở hữu tài khoản. Có thể là cá nhân hoặc pháp nhân. Mỗi client có `ClientID`, `FileID` (mã hồ sơ riêng). | `Customer.cs` (251KB) |
| **Plan** | `Plan` | Tài khoản đầu tư (investment account) thuộc về một client. Một client có thể có nhiều plans (RRSP, TFSA, Open...). Mỗi plan có `PlanID`, `DealerAccountID`. | `Plan.cs` (207KB) |
| **Fund Account (Position)** | `CFundAccount` | Một vị thế (position) cụ thể trong một plan — tức là client đang hold một fund cụ thể. Chứa: số units, giá trị thị trường (MKV), trung bình giá vốn (AvgCost). | `FundAccount.cs` (132KB) |
| **Fund (Fund Definition)** | `CFundDef` | Định nghĩa quỹ đầu tư: tên, mã (`FundID`), công ty quản lý (`MgmtCode`), loại load (FE/DSC/NL), rủi ro (RiskRating), giá (NAV/Price), đồng tiền. | `FundDef.cs` (189KB) |
| **Transaction (Trx)** | `CTrx` | Một giao dịch mua/bán/chuyển fund. Là đơn vị công việc chính của hệ thống. Chứa: loại (Buy/Sell/Switch/Transfer), số tiền, units, trạng thái, ngày xử lý. | `Trx.cs` (264KB) |
| **Dealer** | `Dealer` | Công ty môi giới (brokerage firm). Quản lý nhiều advisors và clients. Có `DealerCode`. | `Dealer.cs` (32KB) |
| **Dealer Branch** | `DealerBranch` | Chi nhánh của dealer. | `DealerBranch.cs` (21KB) |
| **Dealer Sub-Branch** | `DealerSubBranch` | Chi nhánh con. Mapped bởi `DSIDSub`. | `DealerSubBranch.cs` (15KB) |
| **Member** | `Member` | Người dùng hệ thống (user account). Có `UserID`, `LoginID`, `MemberType`. Không nhầm với client (investor). | `Member.cs` (214KB) |
| **Advisor** | `Advisor` | Cố vấn tài chính — người tư vấn cho client. Thuộc về một dealer. | `Advisor.cs` (24KB) |
| **Trust Account** | `TrustAccount` | Tài khoản ủy thác (trust) — dealer giữ tiền hộ trước khi gửi đến fund company. | `TrustAccount.cs` (218KB) |
| **Intermediary** | `Intermediary` | Bên trung gian (third-party) được ủy quyền trên plan. VD: Power of Attorney, Trading Authority. | `Intermediary.cs` (23KB) |
| **Beneficiary** | (trong Plan.cs) | Người thụ hưởng — được chỉ định trên plan, nhận tài sản khi client qua đời. Có allocation %. | `Plan.cs` |
| **Spouse** | (trong Customer.cs) | Vợ/chồng của client — relevant cho Spousal plans (RRSP/RRIF). | `Customer.cs` |

---

## 2. Plan Types (Loại tài khoản đầu tư)

Đây là các loại tài khoản theo quy định Canada (CRA — Canada Revenue Agency):

| Mã | Tên đầy đủ | Mô tả | BLL Class |
|---|---|---|---|
| **OPEN** | Open (Non-registered) | Tài khoản đầu tư thông thường, không có ưu đãi thuế. | `Plan.cs` |
| **RRSP** | Registered Retirement Savings Plan | Tài khoản tiết kiệm hưu trí. Tiền đóng vào được khấu trừ thuế, rút ra sẽ bị đánh thuế. | `RRSP.cs` (23KB) |
| **RRIF** | Registered Retirement Income Fund | Quỹ thu nhập hưu trí. Chuyển từ RRSP khi đến tuổi. Bắt buộc rút tối thiểu hàng năm. | `RRIFSetting.cs` (99KB) |
| **TFSA** | Tax-Free Savings Account | Tài khoản tiết kiệm miễn thuế. Thu nhập đầu tư không bị đánh thuế. | `TFSA.cs` (31KB) |
| **RESP** | Registered Education Savings Plan | Tài khoản tiết kiệm giáo dục cho con. Có government grant (CESG). | `CRESP.cs` (48KB) |
| **FHSA** | First Home Savings Account | Tài khoản tiết kiệm mua nhà lần đầu (mới, từ 2023). | `T4FHSA.cs` (35KB) |
| **LIRA** | Locked-In Retirement Account | Tài khoản hưu trí bị khóa. Không thể rút trước tuổi. | `Plan.cs` (`bLockedIn`) |
| **LIF** | Life Income Fund | Quỹ thu nhập suốt đời — chuyển từ LIRA. | `Plan.cs` |
| **RDSP** | Registered Disability Savings Plan | Tài khoản tiết kiệm cho người khuyết tật. | — |
| **Spousal** | Spousal Plan | Phiên bản spousal (vợ/chồng) của RRSP/RRIF — tài khoản đứng tên vợ/chồng nhưng do client đóng. Ảnh hưởng thuế. | `Plan.cs` (`bSpousal`) |
| **Group** | Group Plan | Plan nhóm — nhiều client cùng thuộc một group plan (thường do employer tổ chức). | `Plan.cs` (`bGroup`) |
| **In Trust** | In Trust Plan | Plan "in trust for" — đứng tên người giám hộ cho trẻ vị thành niên. | `Plan.cs` (`bInTrust`) |

---

## 3. Account Designation (Chỉ định tài khoản)

Quy định ai có quyền trên plan — xem chi tiết tại [Client Access Rights](../business-logic-topics/client-access-rights.md).

| Mã (AccountDesignation) | Tên | Mô tả |
|---|---|---|
| **1** — Client Name | Tên khách hàng | Plan chỉ thuộc một client duy nhất. Client có toàn quyền. |
| **2** — Nominee | Đại diện | Plan đứng tên nominee (thường là dealer). Client không trực tiếp sở hữu. |
| **3** — Intermediary | Trung gian | Có bên thứ ba (intermediary) được ủy quyền trên plan. VD: luật sư, công ty quản lý tài sản. |

---

## 4. RepCode (Representative Code) — Hệ thống phân quyền

Xem chi tiết tại [RepCode Explained](../business-logic-topics/repcode-explained.md).

| Thuật ngữ | Mô tả |
|---|---|
| **RepCode** | Mã đại diện (representative code). Mỗi advisor có một hoặc nhiều rep codes. Rep code quyết định advisor nào quản lý client nào. |
| **DealerCode** | Mã dealer (công ty môi giới). Cấp trên của RepCode. |
| **Joint Rep** | Nhiều rep codes cùng chia sẻ quyền quản lý trên một plan. Commission được chia theo tỷ lệ. Bảng: `Customer_Rep`. |
| **Customer_Rep** | Bảng DB quan hệ N-N giữa Customer và Rep. Chứa: `ClientID`, `RepCode`, `fSplit` (% chia commission). |

---

## 5. Transaction Types (Loại giao dịch)

| Loại | Code | Mô tả | SP liên quan |
|---|---|---|---|
| **Buy (Mua)** | Buy | Mua units của fund. Client đưa tiền → nhận units. | `UBFundTrxBuy` |
| **Sell (Bán)** | Sell | Bán units ra tiền mặt. | `UBFundTrxSell` (dự kiến) |
| **Switch** | Switch | Chuyển từ fund A sang fund B trong cùng fund company. Thực chất là bán A + mua B. | — |
| **Transfer** | Transfer | Chuyển units/tiền giữa các plan. Có 2 loại: Internal (cùng dealer) và External (khác dealer, qua FundServ). | — |
| **ETF Order** | ETF | Giao dịch ETF qua FIX protocol (không qua FundServ). Có thêm params: `ETFOrderType` (Market/Limit/Stop), `ETFTimeInForce`, `ETFExpiryDate`. | `UBStockOrderAdd` |
| **Stock Order** | Stock | Giao dịch cổ phiếu trên sàn. Tương tự ETF. | `UBStockOrderAdd` |
| **Systematic** | (flag) | Giao dịch tự động định kỳ (PAC — Pre-Authorized Contribution, hoặc SWP — Systematic Withdrawal Plan). Đánh dấu bằng `bSystematic`. | — |
| **Bulk Switch** | Basket | Chuyển đổi hàng loạt fund cho nhiều clients cùng lúc. | `BulkSwitchBasket.cs` (67KB) |

---

## 6. Transaction Statuses (Trạng thái giao dịch)

Xem chi tiết tại [FundServ Order Flow](../business-logic-topics/fundserv-order-flow.md).

| Trạng thái | Mô tả |
|---|---|
| **Pending** | Order đã tạo, chưa gửi đến fund company. |
| **Pending to Receive** | Order đã gửi, đang chờ fund company xác nhận. |
| **Accepted** | Fund company đã nhận order. |
| **Rejected** | Fund company từ chối (VD: fund đóng, thông tin sai). |
| **Contracted** | Order đã được confirm với giá chính thức (NAV date). |
| **Confirmed** | Settlement hoàn tất — units đã vào tài khoản hoặc tiền đã trả. |

---

## 7. Error Correction (Sửa lỗi giao dịch)

Xem chi tiết tại [Error Correction](../business-logic-topics/error-correction.md).

| Thuật ngữ | Mô tả |
|---|---|
| **AOT (As of Trade)** | Giao dịch "as of" — thực hiện ở ngày hiện tại nhưng dùng giá (NAV) của ngày trước đó. Dùng khi order bị lỡ deadline. Param: `bAOT`, `AOTDateStr`. |
| **REV (Reversal)** | Đảo ngược giao dịch đã confirm. Tạo giao dịch ngược lại để triệt tiêu giao dịch gốc. |
| **CAX (Cancel)** | Hủy giao dịch chưa confirm (đang Pending). |
| **Dilution** | Số tiền dealer phải chịu khi thực hiện AOT mà giá đã thay đổi so với ngày gốc. VD: mua AOT với NAV cũ thấp hơn NAV hiện tại → dealer bù chênh lệch. Param: `AOTDilution`. |

---

## 8. Financial Terms (Thuật ngữ tài chính)

| Thuật ngữ | Mô tả | Code reference |
|---|---|---|
| **NAV (Net Asset Value)** | Giá trị tài sản ròng mỗi unit. Được fund company công bố hàng ngày. Dùng để tính giá mua/bán. | `fPrice`, `Price` |
| **MKV (Market Value)** | Giá trị thị trường = Units × NAV. Tổng giá trị của một position. | `MKV` field |
| **Units** | Số đơn vị quỹ client đang sở hữu. VD: 1500.2345 units. | `fUnits`, `Units` |
| **AvgCost (Average Cost)** | Giá vốn trung bình — dùng để tính lãi/lỗ (capital gain/loss). | `fAvgCost` |
| **Commission** | Hoa hồng advisor nhận từ giao dịch hoặc holding. | `CommissionRevenue.cs` (177KB) |
| **DSC (Deferred Sales Charge)** | Phí bán chậm — nếu bán fund trong vòng X năm, bị phạt phí. | `LoadType = "DSC"` |
| **FE (Front-End Load)** | Phí mua — trả trước khi mua fund. | `LoadType = "FE"` |
| **NL (No Load)** | Không phí — fund không tính phí mua/bán. | `LoadType = "NL"` |
| **MER (Management Expense Ratio)** | Tỷ lệ chi phí quản lý fund. Trừ tự động từ NAV. | `iMERRange` |
| **Settlement** | Thanh toán — quá trình chuyển tiền/units sau khi giao dịch được confirm. | `SettlementInd`, `SettlementStatus`, `SettlementSource`, `SettlementMethod` |
| **N$M (Net Settlement Method)** | Phương thức thanh toán ròng giữa dealer và fund company. Thay vì thanh toán từng giao dịch, gom lại tính net. | `bNSM` |
| **Leveraged** | Đầu tư bằng tiền vay. Đánh dấu `iLeveraged = 1`. Có quy định compliance riêng. | `bTrxLeveraged`, `iLeveraged` |
| **PEFP** | Pre-Existing Financial Plan — giao dịch theo kế hoạch tài chính đã có từ trước. Ảnh hưởng compliance check. | `bPEFP`, `PEFPNotes` |
| **Unsolicited** | Giao dịch do client tự yêu cầu, không phải advisor đề xuất. Giảm trách nhiệm compliance cho advisor. | `bUnsolicited` |
| **RoR (Rate of Return)** | Tỷ suất sinh lợi. Dùng trong fund search/comparison. | `fRoR1`, `fRoR2`, `fRoR3` |
| **KYP (Know Your Product)** | Biết sản phẩm — advisor phải review và so sánh fund trước khi bán cho client. Compliance requirement. | `UBKYPCompareList*` SPs |
| **Suitability** | Đánh giá mức phù hợp giữa sản phẩm đầu tư và hồ sơ rủi ro (risk profile) của client. | `Compliance.cs` (269KB) |
| **Risk Rating** | Xếp hạng rủi ro fund (Low/Medium/High). Phải match với risk tolerance của client. | `RiskStr`, `RiskRating` |

---

## 9. External Systems & Integrations

| Thuật ngữ | Mô tả | BLL/Project |
|---|---|---|
| **FundServ** | Hệ thống clearing trung tâm của Canada — trung gian giữa dealer và fund company để xử lý orders, prices, settlements. Tương tự SWIFT nhưng cho mutual funds. | `FundServ.cs`, `UBFFImport` |
| **Interactive Mode** | Gửi order đến FundServ qua **IBM MQ** (real-time, từng order). | `VieFUNDMQLib` |
| **Batch Mode** | Gửi order đến FundServ qua **file XML** (batch, cuối ngày). | `UBFFImport/FFImport.cs` |
| **FundServ File Types** | CO (Client Order), NFU (New Fund Update), CA (Commission Adjustment), PR (Price), AT (Asset Transfer). | `Docs/Các loại file Fundserv/` |
| **FIX Protocol** | Giao thức giao dịch điện tử cho ETF/Stock orders (không phải FundServ). | `VFQuickFix` project |
| **DocuSign** | E-signature provider — cho ký điện tử documents. | `VFDocSign/CVFDocSign.cs` (109KB) |
| **Signority** | E-signature provider (Canada-based). | `VFSignority/CSignority.cs` (54KB) |
| **OneSpan** | E-signature provider. | `VFOneSpan/COneSpan.cs` (35KB) |
| **Twilio** | SMS/2FA service — dùng cho xác thực 2 bước. | `VFTwilio/CTwilio2FA.cs` |
| **CRA (Canada Revenue Agency)** | Cơ quan thuế Canada — nhận báo cáo thuế (T5, T4RSP, T3...) từ hệ thống. | `UBExport/` (58 files) |
| **MFDA** | Mutual Fund Dealers Association — hiệp hội ngành, đặt ra quy định compliance. | `MFDAReports.cs`, `CMFDAFee.cs` |
| **Fundata** | Nhà cung cấp dữ liệu fund — import NAV, fund info. | `Fundata.cs` (61KB) |
| **Omnibus** | Tài khoản omnibus — dealer gộp nhiều client orders thành một order lớn gửi cho fund company. Tối ưu fee/settlement. | `VFOmnibus` project |

---

## 10. Tax & Year-End (Thuế & Năm tài chính)

| Thuật ngữ | Mô tả | BLL Class |
|---|---|---|
| **T5** | Tax slip — Khai báo thu nhập đầu tư (dividends, interest). | `T5.cs` (43KB) |
| **T3** | Tax slip — Thu nhập từ trust (income allocations). | `T3.cs` (44KB) |
| **T4RSP** | Tax slip — Rút tiền từ RRSP. | `T4RSP.cs` (36KB) |
| **T4RIF** | Tax slip — Rút tiền từ RRIF. | `T4RIF.cs` (37KB) |
| **T4A** | Tax slip — Thanh toán từ nhiều nguồn (pension, annuity...). | `T4A.cs` (43KB) |
| **T4FHSA** | Tax slip — FHSA. | `T4FHSA.cs` (35KB) |
| **T5008** | Tax slip — Bán chứng khoán (securities transactions). | `T5008.cs` (31KB) |
| **T619** | File truyền dữ liệu thuế đến CRA (electronic filing). | `T619.cs` (18KB) |
| **T550** | File báo cáo RRSP/RRIF contributions. | `T550.cs` (20KB) |
| **NR4** | Tax slip — Thu nhập trả cho người không cư trú (non-resident). | `NR4.cs` (31KB) |
| **RL-2** | Relevé (Quebec) — Tương đương T4RSP/T4RIF cho Quebec. | `RL2.cs` (31KB) |
| **RL-3** | Relevé (Quebec) — Tương đương T5 cho Quebec. | `RL3.cs` (32KB) |
| **RL-16** | Relevé (Quebec) — Tương đương T3. | `RL16.cs` (31KB) |
| **RL-18** | Relevé (Quebec) — Tương đương T5008. | `RL18.cs` (46KB) |
| **Relevé 1** | Relevé (Quebec) — Thu nhập. | `Releve1.cs` (29KB) |
| **Tax Receipt** | Biên lai thuế — receipt cho RRSP contributions. | `TaxReceipt.cs` (25KB) |
| **Year-End** | Quy trình cuối năm — tạo tất cả tax slips, gửi CRA, gửi cho client. | `YearEnd.aspx.cs` |

---

## 11. Compliance & Regulatory

| Thuật ngữ | Mô tả | BLL Class |
|---|---|---|
| **KYC (Know Your Client)** | Quy trình "biết khách hàng" — thu thập thông tin cá nhân, mục tiêu đầu tư, khả năng chịu rủi ro. | `Customer.cs` → `UBClientKYC` SP |
| **FATCA** | Foreign Account Tax Compliance Act (Mỹ) — khai báo tài khoản của US persons. | `FATCA.cs` (45KB) |
| **FINTRAC** | Financial Transactions and Reports Analysis Centre of Canada — chống rửa tiền (AML). Báo cáo giao dịch lớn/đáng ngờ. | `FINTRAC.cs` (78KB) |
| **AML** | Anti-Money Laundering — chống rửa tiền. Liên quan FINTRAC. | `UBAMLCheckNameTitle` SP |
| **Compliance Officer** | Người phụ trách compliance — xét duyệt giao dịch trước khi gửi ra ngoài. | `Compliance.cs` (269KB) |
| **Suitability Check** | Kiểm tra mức phù hợp: risk profile client vs risk rating fund. Tự động hoặc manual. | `Compliance.cs` |
| **Force Approved** | Bypass compliance check — admin ép duyệt giao dịch. | `bForceApproved` param |
| **Force Risk** | Bypass risk check. | `bForceRisk` param |
| **Questionnaire** | Bảng câu hỏi KYC — đánh giá risk profile, investment knowledge, time horizon. | `Questionair.cs` (28KB) |
| **Exception Report** | Báo cáo ngoại lệ — giao dịch vi phạm rules. | `ExceptionReport.cs` (21KB) |

---

## 12. Infrastructure & Multi-tenancy

| Thuật ngữ | Mô tả | Code reference |
|---|---|---|
| **DBID** | Database ID — xác định database instance. Mỗi DBID = 1 connection string. Dùng cho multi-tenant ở tầng database. | Session var, `CDatabase(DBIDStr)` |
| **DSID** | Dealership ID — xác định dealer trong database. Dùng cho multi-tenant ở tầng data. WHERE clause: `DSID = @DSID`. | Session var, SP param |
| **DSIDSub** | Sub-dealership ID — phân cấp dealer con. | Session var |
| **Lg** | Language: `0` = English, `1` = French. Dùng khắp nơi trong code. | SP param, Session var |
| **UserID** | ID người dùng đang login (từ bảng Member). Không nhầm với ClientID. | Session var |
| **LoginID** | ID phiên login (session-level). Khác UserID (user-level). | Session var |
| **MemberType** | Loại người dùng: Admin, Advisor, Compliance Officer, Client... | Session var |
| **iOptions** | Cờ tùy chọn — truyền vào SP để điều khiển behavior (bitwise flags hoặc integer). Pattern rất phổ biến trong codebase. | Mọi SP đều có |

---

## 13. UI & Document Terms

| Thuật ngữ | Mô tả |
|---|---|
| **Order Receipt** | Biên nhận order — PDF tạo cho client sau mỗi giao dịch. |
| **Trade Confirmation** | Xác nhận giao dịch — PDF gửi sau khi order được confirm. |
| **Statement** | Sao kê tài khoản — báo cáo định kỳ cho client. |
| **Fund Fact** | Tài liệu thông tin fund — bắt buộc cung cấp cho client trước khi mua. |
| **Application** | Đơn mở tài khoản — form mà client ký để mở plan mới. |

---

## Quick Reference: Quan hệ giữa các entity

```
Dealer (DealerCode)
  └── Dealer Branch
       └── Dealer Sub-Branch
            └── Advisor(s) ←──→ RepCode(s)
                                    │
                                    ├──→ Client(s)  ← via Customer_Rep table
                                    │      │
                                    │      └── Plan(s)  (RRSP, TFSA, Open...)
                                    │            │
                                    │            ├── Fund Account / Position(s)
                                    │            │     └── Fund (via FundDef)
                                    │            │           └── Transaction(s)
                                    │            │
                                    │            ├── Beneficiary(s)
                                    │            ├── Third Party / Intermediary
                                    │            └── Joint Holder(s)
                                    │
                                    └── Trust Account(s)
```

```
Transaction Lifecycle:
  Create → Pending → [Compliance Check] → Send to FundServ
    → Pending to Receive → Accepted → Contracted (with NAV)
    → Confirmed → Settled

Error Correction:
  - CAX: Cancel (before Confirm)
  - REV: Reverse (after Confirm)
  - AOT: As-of Trade (use old NAV date)
```
