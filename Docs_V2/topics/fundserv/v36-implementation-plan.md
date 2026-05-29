# Fundserv Standards V36 – Danh sách thay đổi cần thiết cho Dealer (WebApp)

> [!IMPORTANT]
> **Go-live date**: June 15, 2026. Tất cả thay đổi dưới đây phải hoàn tất trước ngày triển khai.
> **External UAT**: March 25, 2026.
> **Tài liệu tham chiếu chính**: `V36_req.md` (Fundserv Standards V36 Requirements, Final Version 1.0, October 7, 2025)

## Tóm tắt

Dựa trên phân tích đối chiếu giữa **V36_req.md**, **Guide.md** (kiến trúc WebApp/VieFUNDIE), và **source code hiện tại** trong `WebApp/Main/`, dưới đây là **10 thay đổi** cần thiết cho ứng dụng Dealer, được sắp xếp theo thứ tự ưu tiên.

---

## 1. TCR – Deductions Update (DOT 149)

📄 **Ref**: V36_req.md – Section 1.1 (pages 13-16), Section 6.1 (pages 43-48), Appendices 1-4 (pages 69-73)

### 1.1 Background

Theo yêu cầu quy định **Total Cost Reporting (TCR)** từ Canadian Securities Administrators (CSA), các nhà phân phối (distributors) phải báo cáo tất cả phí đầu tư trực tiếp cho nhà đầu tư, kèm giải thích rõ loại phí.

V35.1 đã cập nhật **Fee Details section** cho fee transactions. Tuy nhiên, các thành viên yêu cầu cập nhật tương tự cho **Deductions section** – phần dùng để báo cáo tất cả khoản khấu trừ (deductions) từ Gross Amount cho redemptions, switches, transfers, distributions và fee transactions.

**Mục tiêu**: Giảm thiểu sử dụng "Other Fee" (quá chung chung, không đáp ứng TCR) bằng cách thêm 4 loại phí mới có mô tả rõ ràng.

### 1.2 Yêu cầu V36

Thêm **4 deduction types mới** vào Deductions section:

| Field Name | Element Name | Type | Length | Data Type | Parent |
|---|---|---|---|---|---|
| Early Redemption Fee | `EarlyRdmtnFee` | Optional 0-1 | 4-13 | amt9v2n | Dedns |
| Dealer Advisory Fee | `DlrAdvsrFee` | Optional 0-1 | 4-13 | amt9v2n | Dedns |
| Market Value Adjustment | `MVA` | Optional 0-1 | 4-13 | amt9v2n | Dedns |
| IRS Tax | `IRSTax` | Optional 0-1 | 4-13 | amt9v2n | Dedns |

**Schema ảnh hưởng** (shared schema `FStypes.xsd`):
- **TS file** (Transaction Reconciliation): SellFund (App. 1), TrnsfrFund (App. 2), DistribFund (App. 3)
- **HS file** (Historical Settlement): Cùng schema với TS
- **FS file** (Settlement Instruction): SellFund (App. 4)
- **myserv** (fundcom.xsd): TrxnDtl, AcctRedeem, RedemptionCalculator (Section 6.1, pages 43-48)

**Quy tắc mới cho OtherFee** (page 15-16):
- FS file: "Other Fee must only be used for **segregated fund accounts**, or for new fee types not yet defined within the Deductions Section"
- TS file: "Other Fee must only be used for segregated fund accounts, **historical transactions placed prior to June 15, 2026**, or for new deduction types not yet defined"

**Công thức tính toán** (myserv section, page 48):
- `TotFees = ShortTermFee + AdminFee + MgmtFee + PerformFee + EarlyRdmtnFee + DlrAdvsrFee + OtherFee + Penalty + DSCAmount`
- `TotTaxClawback = SalesTax + FedWHoldTax + ProvWHoldTax + LSIFClawbackFed + LSIFClawbackProv + MVA + IRSTax + Clawback`

### 1.3 Thay đổi cần thực hiện

> [!WARNING]
> Source code hiện chỉ có `OtherFee` và `AdminFee`. **Chưa có** `EarlyRdmtnFee`, `DlrAdvsrFee`, `MVA`, `IRSTax`.

#### Files cần sửa:

| File | Thay đổi |
|---|---|
| `PopupFundServ.aspx.cs` | Parse và hiển thị 4 deduction fields mới khi import TS/FS file data |
| `PopupFundServ_FR.aspx` | Bản FR tương ứng |
| `CommissionView.aspx` / `.aspx.cs` | Thêm rows cho 4 loại fee mới trong Payable summary |
| `CommissionView_FR.aspx` | Bản FR tương ứng |
| `SettlementView.aspx.cs` | Parse new deduction fields từ Settlement data |
| `TSHImportView.aspx.cs` | Import TS/HS file – parse 4 fields mới |
| `FundSetup.aspx.cs` | Nếu hiển thị deduction breakdown |
| **Database** | Thêm columns: `EarlyRdmtnFee`, `DlrAdvsrFee`, `MVA`, `IRSTax` vào bảng deductions/transactions |

#### Chi tiết:
1. **Thêm 4 labels/controls** trên UI: Early Redemption Fee, Dealer Advisory Fee, MVA, IRS Tax
2. **Cập nhật XML parsing** để đọc 4 elements từ TS/HS/FS files
3. **Cập nhật database schema** cho 4 deduction types mới
4. **Thêm validation OtherFee**: cảnh báo nếu dùng OtherFee cho fee có type phù hợp hơn
5. **Cập nhật TotFees / TotTaxClawback**: theo công thức chính xác ở trên

---

## 2. Quebec Joint Account Setup (DOT 153)

📄 **Ref**: V36_req.md – Section 1.2 (page 17), Appendix 5 (pages 74-75)

### 2.1 Background

Các Manufacturers phản ánh họ nhận được yêu cầu Account Setup qua Fundserv cho **Quebec Joint Accounts** với **Joint Survivor Type không hợp lệ**. Theo luật Quebec, Joint accounts chỉ được phép set up với Joint Survivor Type = **"Tenants in Common"** (value `T`).

Dữ liệu không hợp lệ gây ra trade rejections và cần follow-up thủ công. Manufacturers yêu cầu Fundserv thêm validation edit để chặn từ đầu.

### 2.2 Yêu cầu V36

Thêm edit cho TFS/NFU Account Setup Joint Owner Section:
- **IF** Tax Code = QC → Joint Survivor Type **must = T** (Tenants in Common)
- Error code: **115**

Thêm edit cho Quebec joint accounts:
- **IF** Recipient Code = 2 AND Tax Code = QC → Joint Owner section must occur **1 time** only
- Error code: **351**

### 2.3 Thay đổi cần thực hiện

| File | Thay đổi |
|---|---|
| `PopupPlanAdd.aspx.cs` | Validation: nếu jurisdiction = QC & Joint → restrict Survivor Type = "T" only |
| `PopupAccountAdd.aspx.cs` | Tương tự validation |
| `PopupPlanAddBody.aspx` / `_FR.aspx` | UI warning cho QC Joint |

#### Chi tiết:
1. **Client-side**: Khi Province = QC và Account type = Joint → auto-set & lock Joint Survivor Type = "T"
2. **Server-side**: Reject nếu Quebec Joint account có Survivor Type ≠ "T"

---

## 3. Update Client Identity Verification Options (DOT 175)

📄 **Ref**: V36_req.md – Section 2.1 (pages 19)

### 3.1 Background

Fundserv phát hiện sự **không nhất quán về thuật ngữ** giữa process xác minh danh tính trên Fundserv với hướng dẫn của **FINTRAC** (Financial Transactions and Reports Analysis Centre of Canada).

Hiện tại Fundserv dùng "provincial health card" làm phương thức xác minh, nhưng chỉ một số tỉnh cho phép dùng health card cho mục đích tài chính. Để phù hợp với FINTRAC, cần đổi thành **"provincial or territorial identity card"** – bao quát hơn cho các tỉnh không chấp nhận health card.

> [!NOTE]
> Đây chỉ là thay đổi **thuật ngữ**, không thay đổi quy trình xác minh. Theo Proceeds of Crime Act Section 61.1(a), members vẫn phải tuân thủ luật từng tỉnh.

### 3.2 Yêu cầu V36

Cập nhật IDType allowable value `"C"`:
- **Cũ**: `C – Provincial health card`
- **Mới**: `C – Provincial or territorial identity card`

### 3.3 Thay đổi cần thực hiện

| File | Thay đổi |
|---|---|
| `PanelClientIdentAdd.aspx` / `_FR.aspx` | Cập nhật dropdown text cho value "C" |
| `PanelClientIdentAdd.aspx.cs` | Nếu dropdown populate programmatically |
| `FINTRACView.aspx` / `_FR.aspx` | Cập nhật display label |
| **Database** | Cập nhật lookup table cho IDType "C" description |

---

## 4. Client Name Distributor Placed Fee Redemptions (DOT 155)

📄 **Ref**: V36_req.md – Section 3.1 (pages 21-22), Appendices 6-9 (pages 76-85)

### 4.1 Background

**Fee Redemptions** (Transaction Type = 4/blank/blank) là loại giao dịch mà dealer/intermediary đặt trên Fundserv để rút phí từ tài khoản nhà đầu tư. Toàn bộ số tiền (sau khấu trừ) được trả cho dealer/intermediary dưới dạng trade activity.

**Hiện trạng**: Fee Redemptions chỉ hỗ trợ **Intermediary/Nominee accounts** (AcctDesig = 2, 3).

**Lý do thay đổi**: Do sự phát triển của quy định và thay đổi cấu trúc phí, ngành yêu cầu mở rộng để cũng xử lý Fee Redemptions cho **Client Name accounts** (AcctDesig = 1). Để hỗ trợ Client Name, cần:
1. Mở rộng scope cho transaction type
2. Thêm vào danh sách **EPA (Electronic Processing Agreement) Eligible Transactions** – vì Client Name cần investor signed authorization, EPA giúp dealer không phải submit authorization mỗi lần

### 4.2 Yêu cầu V36

1. **Mở AcctDesig validation** cho Fee Redemption (4/blank/blank): cho phép Client Name (AcctDesig=1)
2. **Bắt buộc N$M settlement** cho Client Name Fee Redemptions (Appendix 8)
3. **Thêm EPA Eligible** cho Fee Redemption Client Name (page 22)
4. **Hỗ trợ error corrections**: AOTs và reversals cho Client Name Fee Redemptions, settling via N$M (Appendix 9)
5. **Sales tax rule**: Dealer phải bao gồm sales tax khi đặt Fee Redemption cho non-registered account
6. **Gross/Net rule**: Nếu Gross/Net = "G", deductions có thể áp dụng → dealer nhận ít hơn; khuyến cáo dùng "N"

### 4.3 Thay đổi cần thực hiện

> [!WARNING]
> Source code có nhiều nơi check `AcctDesig`. Cần review tất cả để mở rộng.

| File | Thay đổi |
|---|---|
| `PanelFeeRedemptionOrder.aspx.cs` | Bỏ restriction chỉ Nominee/Intermediary – cho phép Client Name |
| `PanelFeeProcess.aspx.cs` | Fee processing – mở rộng scope |
| `PanelFeeAddItem.aspx.cs` | Fee add – mở rộng scope |
| `PopupTradeAdd.aspx.cs` | Trade placement – allow fee redemption for AcctDesig=1 |
| `PopupTradeBasket.aspx.cs` | Trade basket – allow Client Name fee redemptions |
| `TrxView.aspx.cs` | Transaction view filter |

#### Chi tiết:
1. **Mở rộng AcctDesig validation**: Cho phép AcctDesig=1 cho Fee Redemption
2. **Thêm Settlement Method validation**: Client Name Fee Redemptions → bắt buộc N$M
3. **Thêm error correction support**: AOTs và reversals cho Client Name Fee Redemptions
4. **Thêm processing rules**: Sales tax, Gross/Net guidance
5. **Cập nhật EPA eligible transactions list**

---

## 5. Successor Annuitant on RRIF and FHSA Accounts (DOT 163)

📄 **Ref**: V36_req.md – Section 3.2 (pages 23-31), Section 6.2 (pages 49-50), Appendices 10-17 (pages 86-120)

### 5.1 Background

Hiện tại, **Successor** (người kế thừa) trên Fundserv chỉ có thể được chỉ định cho:
- Segregated funds (quỹ phân biệt)
- Client Name **TFSA** accounts (type=17)

Tuy nhiên, đơn đăng ký **RRIF** và **FHSA** cũng có mục chỉ định successor nhưng Fundserv **chưa hỗ trợ**.

Với sự mở rộng của EPA, distributors và manufacturers cần tất cả các trường được hỗ trợ khi tạo hoặc chuyển tài khoản trên Fundserv, để tránh phải yêu cầu tài liệu bổ sung.

**Mục tiêu**: Mở rộng phạm vi Successor section từ TFSA-only sang **TFSA + RRIF (type=04) + FHSA (type=22)**.

### 5.2 Yêu cầu V36

**Schema changes**:
- **Đổi tên**: `TFSASucsr` → `Sucsr` (trong tfs.xsd, nfu.xsd, AcctDemoRec.xsd, fundcom.xsd)
- **Đổi tên**: `AddTFSASucsr` → `AddSucsr` (trong nfu.xsd)
- Mở rộng scope cho AcctSetup, AcctTrnsfr, Demo sections, Add Successor NFU

**Validation changes** (pages 28-29):
- **Cho phép** Successor cho Client Name RRIF (type=04) và Client Name FHSA (type=22)
- **Yêu cầu** Death Beneficiary HOẶC Successor cho non-QC, non-segregated Client Name RRIF/FHSA mới
- **Cấm** Successor cho QC non-segregated, non-locked-in Client Name RRIF/FHSA

**Warning/Error codes cập nhật** (page 31): 251, 403, 404, 405, 406, 407 – bỏ prefix "TFSA"

### 5.3 Thay đổi cần thực hiện

> [!IMPORTANT]
> Source code đã hỗ trợ TFSA Successor (type=17) và RRIF (type=04) nhưng **chưa có FHSA** (type=22).

| File | Thay đổi |
|---|---|
| `PopupPlanAdd.aspx.cs` | **Quan trọng nhất**: Thêm FHSA (type=22) vào account type check cho successor |
| `PopupPlanAddBody.aspx` / `_FR.aspx` | Đổi label "TFSA/RRIF Successor" → "Successor" |
| `PanelTFSAEdit.aspx` / `.aspx.cs` | Đổi tên references, mở rộng scope |
| `PopupPlanViewAccInfo.aspx.cs` | Hiển thị successor cho RRIF/FHSA |
| `PanelPlanBenAdd.aspx.cs` | Death Beneficiary validation cho RRIF/FHSA requirement |
| `PopupFundServ.aspx.cs` | Parse renamed `Sucsr` (thay vì `TFSASucsr`) từ TS/HS/NS files |
| **Database** | Rename hoặc alias references từ `TFSASuccessor*` → `Successor*` |

#### Chi tiết:
1. **Mở rộng account type check** tại `PopupPlanAdd.aspx.cs`:
   ```diff
   - if (AccountType != "17" && !IsRIFPlan(AccountType)) bTFSASuccessorInd = false;
   + if (AccountType != "17" && AccountType != "22" && !IsRIFPlan(AccountType)) bTFSASuccessorInd = false;
   ```
2. **Đổi tên UI labels**: "TFSA Successor" → "Successor"
3. **Validation QC**: Non-segregated RRIF/FHSA ở Quebec, non-locked-in → không cho Successor
4. **Validation non-QC**: Non-segregated RRIF/FHSA → bắt buộc Death Beneficiary HOẶC Successor
5. **Update error codes**: 251, 403-407 – bỏ "TFSA" prefix
6. **Parse renamed elements**: `Sucsr` thay vì `TFSASucsr`

---

## 6. Minimizing Data Exchange – Phase 1 (DOT 165) – myserv only (KHÔNG ÁP DỤNG / OUT OF SCOPE)

📄 **Ref**: V36_req.md – Section 6.3 (pages 51-67), Appendices 26-32 (pages 142-179)

> [!NOTE]
> **Trạng thái**: **KHÔNG ÁP DỤNG** cho dự án này do WebApp không tích hợp trực tiếp với myserv API. Toàn bộ thay đổi trong phần này được lược bỏ khỏi phạm vi triển khai V36. Phase 2 (TFS/NFU) sẽ được thực hiện khi nâng cấp lên V37 (2027).

### 6.1 Background

Trong bối cảnh luật bảo mật Canada phát triển (Law 25, v.v.), Fundserv thành lập **Personal Information Review (PIR) Working Group** vào tháng 11/2024 với các thành viên ngành để đánh giá thông tin cá nhân nhà đầu tư truyền qua Fundserv.

Working Group tập trung vào 3 loại dữ liệu nhạy cảm:
1. **Social Insurance Number (SIN)**
2. **Client Identity Verification** (ID type, ID number, place of issue)
3. **Banking Information** (Bank Account Number)

Các khuyến nghị được SSC (Standard Steering Committee) phê duyệt. **Phase 1** (V36) chỉ ảnh hưởng **myserv**. **Phase 2** (TFS/NFU changes) dự kiến trong **V37 release năm 2027**.

### 6.2 Yêu cầu V36

1. **Xóa SIN search** khỏi Account Inquiry (fundcom.xsd) – page 52-53
2. **SIN → SIN Partial** (last 4 digits, type `sinpartial-typ: \d{4}`) trên AcctInqResults và Demographics – pages 53-55
3. **Xóa Client Identity Verification** (IDVerify compound element) khỏi AcctInqResults và Demographics cho Owner và JntOwner – pages 55-57
4. **BkAcctNum → BkAcctNumPartial** (last 4 chars, type `length4`) trên Distribution và Automatic Activity Plan Detail – pages 57-58
5. **SIN masking trên tax receipt PDFs**: Manufacturers có thể mask SIN (toàn bộ hoặc một phần) tùy ý – page 60

### 6.3 Thay đổi cần thực hiện

> [!NOTE]
> Tất cả thay đổi này chỉ ảnh hưởng **myserv schema** (fundcom.xsd). TFS/NFU files **không thay đổi** trong V36.
> Không cần thay đổi phía Dealer do WebApp không tích hợp trực tiếp với myserv.

| File/Area | Thay đổi |
|---|---|
| Không có myserv integration | Không cần thực hiện |
| Privacy best practice | Xem xét mask SIN trên tax receipt PDFs (nếu phát sinh từ hệ thống WebApp) |


---

## 7. Fund Setup Product Type Updates (DOT 178)

📄 **Ref**: V36_req.md – Section 4.1 (pages 33-34), Appendices 18-22 (pages 121-135)

### 7.1 Background

Để cung cấp dữ liệu quỹ rõ ràng cho distributors thực hiện **Know Your Product (KYP)** reviews, Fundserv đã vận động giảm số quỹ sử dụng Product Type = "Other" chung chung.

Sau khi liên hệ tất cả manufacturers sử dụng "Other", kết quả:
- **Thêm** Product Type mới: `B – Bullion`
- **Xóa**: `E – ETF` (không giao dịch trên Fundserv) và `O – Other` (quá chung chung)
- **Thay đổi data type**: Từ enum sang string pattern `[A-Z]{1}` (linh hoạt hơn, không cần schema change khi thêm values)

### 7.2 Yêu cầu V36

| Thay đổi | Chi tiết |
|---|---|
| Thêm | `B – Bullion` |
| Xóa | `E – Exchange-traded Fund (ETF)` |
| Xóa | `O – Other` |
| Data type mới | `producttype` (pattern `[A-Z]{1}`) |

Processing rule mới: "Manufacturers must assign the Product Type that is the best available match. Manufacturers can request addition of new values through Fundserv."

### 7.3 Thay đổi cần thực hiện

| File | Thay đổi |
|---|---|
| `FundSetup.aspx.cs` | Cập nhật Product Type dropdown/validation |
| `FundSetupBody.aspx` / `_FR.aspx` | UI updates |
| `PopupFundDefAdd.aspx.cs` | Fund definition add |
| `PopupFundDefEdit.aspx.cs` | Fund definition edit |
| **Database** | Cập nhật lookup table: +B, -E, -O |

---

## 8. Fund Setup Custom Date Expansion (DOT 180)

📄 **Ref**: V36_req.md – Section 4.2 (pages 35-36), Appendices 20-22 (pages 126-135)

### 8.1 Background

Khi manufacturers mở rộng sang **exempt market và alternative products**, xuất hiện loại quỹ mới: daily fund với cut-off date nằm trước Trade Date một số ngày cố định (30, 60, hoặc 90 ngày). Để set up loại product này, manufacturers phải dùng **custom priced fund model** với Cutoff Date, Price Date, Settlement Date cho **mỗi ngày làm việc** trong năm.

Hiện tại FD/MD files hỗ trợ **tối đa 250** Custom Date sections – quá ít cho manufacturers muốn define 1-2 năm dates.

### 8.2 Yêu cầu V36

- Tăng max Custom Date sections từ **250 → 500** (trong fd.xsd, md.xsd, Fund List)
- Áp dụng cho: Fund Model, Buy Model, Sell Model sections

### 8.3 Thay đổi cần thực hiện

| Area | Thay đổi |
|---|---|
| FD/MD file parser | Tăng limit từ 250 → 500 Custom Date sections |
| Database | Nếu có limit cứng 250 records → tăng lên 500 |

> [!NOTE]
> Chỉ cần thay đổi nếu WebApp/VieFUNDIE xử lý FD/MD files.

---

## 9. Settlement Report (GS) File – Amount Value Expansion (DOT 183)

📄 **Ref**: V36_req.md – Section 5.2 (pages 40-41)

### 9.1 Background

Khi volume giao dịch tăng đột biến (ví dụ: fund rebalancing, same-to-same order processing), giá trị settlement hàng ngày có thể **vượt quá** giới hạn hiện tại của field Amount Value trong GS file.

V35 đã giải quyết vấn đề về số lượng transactions tối đa. V36 giải quyết vấn đề **Amount Value field length maximum**.

> [!NOTE]
> Thay đổi này **chỉ áp dụng cho GS file** (SettlReport.xsd), không áp dụng cho TFS, NFU, myserv, hay NS file – vì đây là issue với **consolidated daily settlement amount**, không phải single transaction amount.

### 9.2 Yêu cầu V36

| Field | Cũ | Mới |
|---|---|---|
| AmtValue (GS file only) | maxLength = 14 (9 digits.4 decimals) | maxLength = **16** (11 digits.4 decimals) |
| Data type | value14 | **value16** (pattern `\d{1,11}\.\d{2,4}`) |
| Max value | 999,999,999.9999 | **99,999,999,999.9999** |

### 9.3 Thay đổi cần thực hiện

| File | Thay đổi |
|---|---|
| `SettlementView.aspx.cs` | GS file parser – tăng field length cho AmtValue |
| **Database** | Column width cho settlement amounts: tăng precision |

---

## 10. Position Reconciliation (PS) – Terminated Funds (DOT 158)

📄 **Ref**: V36_req.md – Section 5.1 (pages 38-39)

### 10.1 Background

Manufacturers phát hiện **gap trong Standards** về cách báo cáo account trong PS file khi funds bị terminated. Khi fund terminated, manufacturer có thể:
- Bỏ Fund Position section
- Hoặc include Fund Position với balance = 0

Vấn đề: Khi **tất cả funds** trong account đã terminated trước khi account đóng, manufacturer phải include ít nhất 1 terminated fund để đáp ứng quy tắc "zero balance reporting 2 months" cho terminated account. Nhưng fund đã terminated không active trên Fundserv nữa, nên **không nên bắt buộc** include.

### 10.2 Yêu cầu V36

Cập nhật PS Processing Rule #5: Khi account terminated, manufacturer report account với **"Terminated" Account Status** cho 2 tháng liên tiếp – **không bắt buộc** include zero balance Fund Position cho terminated funds.

### 10.3 Thay đổi cần thực hiện

- **Chỉ documentation/processing logic** – nếu Dealer có logic validate PS file, cần relax validation cho terminated funds

---

## Tổng kết ưu tiên

| # | Thay đổi | Mức độ | Độ phức tạp |
|---|---|---|---|
| 1 | TCR Deductions (4 fields mới) | 🔴 Bắt buộc | **Cao** – Multiple files, DB schema, parsing |
| 2 | Quebec Joint Account | 🔴 Bắt buộc | **Thấp** – Validation logic |
| 3 | ID Verification terminology | 🟡 Text change | **Thấp** – Label/text updates |
| 4 | Client Name Fee Redemptions | 🔴 Bắt buộc | **Cao** – Business logic, validation, EPA |
| 5 | Successor RRIF/FHSA | 🔴 Bắt buộc | **Trung bình** – Extend existing TFSA logic |
| 6 | Minimizing Data Exchange | 🟡 myserv only | **Thấp-TB** – Chỉ nếu có myserv integration |
| 7 | Product Type Updates | 🔴 Bắt buộc | **Thấp** – Lookup table + validation |
| 8 | Custom Date Expansion | 🟡 Nếu xử lý FD | **Thấp** – Limit change |
| 9 | GS File Amount Value | 🔴 Bắt buộc | **Thấp** – Field width |
| 10 | PS File Terminated | 📝 Documentation | **Thấp** – Logic relaxation |

## Quyết định & Thống nhất (Resolved Decisions)

> [!NOTE]
> Các câu hỏi mở trước đây đã được phản hồi và thống nhất với các quyết định kỹ thuật cụ thể dưới đây:
>
> 1. **Tích hợp myserv**: **KHÔNG** $\rightarrow$ Hệ thống WebApp không tích hợp trực tiếp với myserv API. Do đó, toàn bộ **Mục 6 (DOT 165 - myserv changes)** được đánh dấu là **Out of Scope** (không cần thực hiện trong release này). Phase 2 (TFS/NFU) sẽ được chuẩn bị cho V37 (2027).
> 2. **Database Schema cho Deductions**: **CHƯA CÓ** $\rightarrow$ Bảng lưu trữ Deductions/Transactions hiện tại chưa có sẵn cột cho 4 loại phí mới. Chúng ta cần bổ sung script SQL để thêm mới 4 cột: `EarlyRdmtnFee`, `DlrAdvsrFee`, `MVA`, `IRSTax` (kiểu `DECIMAL(13, 2)`).
> 3. **Hệ thống xử lý file FD/MD**: **Windows Service (VieFUNDIE)** $\rightarrow$ Tiến trình xử lý file thiết lập quỹ (FD/MD) do dịch vụ chạy nền đảm nhiệm thông qua thư viện shared `UBFFImport.dll`. Việc nâng giới hạn từ 250 lên 500 Custom Dates sẽ được thực hiện trực tiếp trong code của thư viện này.
> 4. **Tương thích ngược (Backward Compatibility)**: **KHÔNG** $\rightarrow$ Không cần hỗ trợ chạy song song cả V35 và V36 cùng một lúc khi phân tích file XML. Parser sẽ được cập nhật trực tiếp theo chuẩn V36 để chạy từ ngày Go-live (15/06/2026).
> 5. **Phase 2 (Data Minimization)**: Xác nhận không thay đổi TFS/NFU data fields trong đợt release V36 này.

---

## Tài liệu tham chiếu

| Tài liệu | Mô tả |
|---|---|
| **V36_req.md** | Fundserv Standards V36 Requirements – nguồn chính (179 pages) |
| **Guide.md** | Hướng dẫn kiến trúc WebApp + VieFUNDIE |
| **DataFlow.md** | Sơ đồ luồng dữ liệu các loại file (CO, TS, HS, FS, etc.) |
| **SampleCO.xml** | Mẫu file CO/TFS với V36 annotations |


