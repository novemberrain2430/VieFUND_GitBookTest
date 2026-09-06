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

| File | Thay đổi | Status |
|---|---|---|
| `PopupPlanAdd.aspx.cs` | UI + Validation cho Plan Add/Edit | ✅ Done |
| `COnBoarding.cs` | Auto-correct JointType khi onboarding | ✅ Done |
| `spOnboarding.sql` | SP defense-in-depth enforcement | ✅ Done |
| `PopupAccountAdd.aspx.cs` | Không áp dụng (Popup này để add/edit fund position/account, không có joint account setup) | ✅ N/A |
| `PopupPlanAddBody.aspx` / `_FR.aspx` | Không cần sửa markup (xử lý bằng code-behind) | ✅ N/A |

#### Chi tiết đã thực hiện:

**A. PopupPlanAdd.aspx.cs** ✅

1. **`OnPlanRecipient1(int bReset)`** — Xử lý khi chọn/load Recipient Code
   - `bReset = 0` (user chọn mới): Nếu QC + RecipientCode = 2 → auto-set `cbJointType = "T"` + disable
   - `bReset = 1` (load data từ DB): Nếu QC + RecipientCode = 2 → chỉ disable nếu giá trị đã đúng `"T"`, ngược lại giữ enabled cho user sửa legacy data
   - Non-QC: `cbJointType.Enabled = true`

2. **`ShowPlanInfo`** — Load plan để edit
   - Set `cbJointType` từ DB (hiển thị giá trị thật)
   - Logic lock/unlock được delegate cho `OnPlanRecipient1(bReset=1)` gọi phía sau

3. **`OnAdd`** — Server-side validation khi Save
   - Nếu `RecipientCode = "2"` + `Province = QC` + `cbJointType ≠ "T"` → block save + hiện lỗi song ngữ EN/FR

**B. COnBoarding.cs (VFOnBoarding)** ✅

4. **`ProcessClientInfo_Plan`** — Auto-correct trước khi ghi DB
   - Lấy `TaxCode` từ `Item.ClientKYC?.ExtraInfo?.TaxCode`
   - Nếu QC + RecipientCode = 2 + JointType ≠ "T" → tự sửa `Item.PlanPtr[i].JointType = "T"`
   - Lý do auto-correct (không block): dữ liệu onboarding đến từ hệ thống ngoài, không thể yêu cầu user sửa tương tác

**C. spOnboarding.sql (UBOBItemProcessClientInfo_Plan)** ✅

5. **Defense-in-depth ở DB level**
   - Lookup `TaxCode` từ `UB_Client` bằng `@iClientID`
   - Nếu QC + RecipientCode = 2 → force `@JointType = 'T'`
   - Đặt ngay sau rule hiện tại `IF(@RecipientCode = '1') SET @JointType = ''`

#### Xử lý dữ liệu cũ (legacy):

| Trường hợp | Hiển thị | Dropdown | Khi Save |
|---|---|---|---|
| QC + Joint + JointType = "T" (đúng) | "T" | Disabled | Cho phép |
| QC + Joint + JointType = "J" (sai legacy) | "J" (hiện thật) | Enabled | Block + báo lỗi |
| Non-QC + Joint + JointType = "J" | "J" | Enabled | Cho phép |


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

**Lý do thay đổi**: Do sự phát triển của quy định và thay đổi cấu trúc phí, ngành yêu cầu mở rộng để cũng xử lý Fee Redemptions cho **Client Name accounts** (AcctDesig = 1).

### 4.2 Yêu cầu V36

1. **Mở AcctDesig validation** cho Fee Redemption (4/blank/blank): cho phép Client Name (AcctDesig=1)
2. **Bắt buộc N$M settlement** cho Client Name Fee Redemptions.
3. **Thêm EPA Eligible** cho Fee Redemption Client Name.
4. **Hỗ trợ error corrections** (AOTs và reversals) cho Client Name Fee Redemptions, settling via N$M.
5. **Sales tax rule**: Bao gồm sales tax khi đặt Fee Redemption cho non-registered account.

### 4.3 Thay đổi cần thực hiện

> [!WARNING]
> Qua rà soát thực tế mã nguồn, logic chặn thu phí tài khoản Client Name (AcctDesig = 1) nằm chủ yếu ở mức Database Stored Procedures (đặc biệt là SP `UBFeeGenerateTrxOneItem` và bộ lọc trong `UBFeeGenerateTrx_Start`), chứ không nằm ở các C# panel UI như `PanelFeeRedemptionOrder`, `PanelFeeProcess`, `PanelFeeAddItem` hay `PanelPlanFeeSetting`. Các Panel UI phí chỉ hiển thị dữ liệu và gọi SP ở backend. Giao diện `PopupTradeAdd.aspx.cs` đã được xây dựng sẵn logic khống chế N$M và validate phòng thủ nên không cần sửa đổi C# UI. Việc sửa đổi cần tập trung vào SP `UBFeeGenerateTrx_Start`, validate trong các stored procedure đặt lệnh bán (`UBFundTrxSell`, `UBFundTrxSellShort`), và bổ sung định nghĩa mã lỗi trong `CMSG.cs`.

| File / Component | Vị trí thay đổi | Mô tả chi tiết thay đổi | Trạng thái |
|---|---|---|---|
| **WebApp (UI)** | `PopupTradeAdd.aspx.cs` | **Không cần thay đổi (Đã có sẵn)**. Logic thiết lập N$M, disable dropdown `cbSettlMethodSell`, ẩn `chPayToClient` và validate trong `OnSell` đã được triển khai đầy đủ và chính xác trong source code hiện tại. | ✅ Đã có |
| **WebApp (UI)** | `PopupTradeBasket.aspx.cs` | **Không áp dụng (Out of Scope)**. Hệ thống đã block Fee Redemption trên Basket trade từ trước (Line 740). | ➖ N/A |
| **WebApp (UI)** | Các Panel Fee UI | `PanelFeeRedemptionOrder.aspx.cs`, `PanelFeeProcess.aspx.cs`, `PanelFeeAddItem.aspx.cs` **không cần sửa C# code** vì không chứa logic chặn Client Name. | ➖ N/A |
| **WebApp (UI)** | `TrxView.aspx.cs` | Cập nhật filter hiển thị và search để đảm bảo không bị vô tình lọc bỏ lệnh Fee Redemptions của tài khoản Client Name. | ⬜ Pending |
| **WebApp (Shared)** | `CMSG.cs` | Bổ sung định nghĩa thông báo lỗi cho mã lỗi `104` (index `94` trong mảng `m_MSG_Trx_EN` và `m_MSG_Trx_FR`) cho việc chặn giao dịch Fee Redemption Client Name khi không chọn N$M. | ⬜ Pending |
| **VieFUNDIE Service** | `VieFUNDIE.cs` | **Không cần thay đổi**. Service chỉ đóng vai trò Timer chạy nền, tương thích 100%. | ➖ N/A |
| **UBFFImport Library** | `COrder.cs` / `CAT.cs` | **Không cần thay đổi**. Ủy quyền sinh XML và import cho database SPs. | ➖ N/A |
| **Database (SPs & UDFs)** | Stored Procedures | - **`UBFeeGenerateTrx_Start`**: Loại bỏ điều kiện `AND PL.AccountDesignation <> '1'` để cho phép nạp tài khoản Client Name vào hàng đợi tiến trình chạy phí tự động.<br>- **`UBFeeGenerateTrx`**: Không có bộ lọc designation nào, không cần sửa đổi.<br>- **`UBFeeGenerateTrxOneItem`**: **[CRITICAL]** Xác nhận dòng `IF(@AccountDesignation = '1') RETURN;` đã được comment trong mã nguồn SP hiện tại để cho phép xử lý phí cho Client Name.<br>- **`UBFundTrxSell`**: Thêm validation phòng thủ ở mức database: chặn lưu nếu `@Type = '4'` & `@AccountDesignation = '1'` nhưng `@SettlementMethod <> '1'` (N$M), trả về `@Ret = 104`.<br>- **`UBFundTrxSellShort`**: Thêm validation tương tự như `UBFundTrxSell` để bảo đảm tính nhất quán trong luồng chạy tự động, trả về `@Ret = 104`. | ⬜ Pending |

#### Chi tiết kỹ thuật cần thực hiện:

1. **Bổ sung mã lỗi giao dịch trong `CMSG.cs` (Đã có sẵn)**:
   - Đã được định nghĩa tại index `94` của mảng `m_MSG_Trx_EN` và `m_MSG_Trx_FR` (dòng 282 và 367):
     - EN: `"Settlement method for Client Name Fee Redemption must be N$M."`
     - FR: `"La méthode de règlement pour le rachat de frais Client Name doit être N$M."`
   - Điều này đảm bảo khi SP trả về `@Ret = 104`, WebApp sẽ tự động giải mã thành mã lỗi index `94` (`104 - 10 = 94`) và hiển thị đúng thông báo lỗi song ngữ.

2. **Database Stored Procedures (Đã có sẵn)**:
   - Cập nhật SP `UBFeeGenerateTrx_Start` (ở dòng 332062 của `000_4_CreateSP.sql`):
     Loại bỏ điều kiện `AND PL.AccountDesignation <> '1'` (đã comment thành `-- AND PL.AccountDesignation <> '1'`) để cho phép nạp tài khoản Client Name vào hàng đợi.
   - Cập nhật SP `UBFeeGenerateTrxOneItem` (ở dòng 332192 của `000_4_CreateSP.sql`):
     Loại bỏ điều kiện chặn `IF(@AccountDesignation = '1') RETURN;` (đã comment thành `-- IF(@AccountDesignation = '1') RETURN;`) để cho phép chạy chạy phí tự động cho Client Name.
   - Cập nhật SP `UBFundTrxSell` (ở dòng 397734 của `000_4_CreateSP.sql`):
     Thêm validation check trước phần sinh transaction (đã có sẵn):
     ```sql
     IF(@Type = '4' AND @AccountDesignation = '1' AND @SettlementMethod <> '1')
     BEGIN
         SET @Ret = 104; -- Error code for invalid settlement method
         GOTO leave;
     END
     ```
   - Cập nhật SP `UBFundTrxSellShort` (ở dòng 399671 của `000_4_CreateSP.sql`):
     Thêm validation check tương tự (đã có sẵn):
     ```sql
     IF(@Type = '4' AND @AccountDesignation = '1' AND @SettlementMethod <> '1')
     BEGIN
         SET @Ret = 104; -- Error code for invalid settlement method
         GOTO leave;
     END
     ```

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

### 5.3 Impact Trace & Hướng dẫn chi tiết

Dưới đây là kết quả trace impact chi tiết trên toàn bộ codebase và hướng dẫn sửa đổi cụ thể cho từng thành phần.

#### 1. WebApp UI & Logic kiểm tra dữ liệu (`PopupPlanAdd.aspx.cs` & ASPX)

*   **File cần sửa**:
    *   [PopupPlanAdd.aspx.cs](../../../WebApp/Main/PopupPlanAdd.aspx.cs)
    *   [PopupPlanAddBody.aspx](../../../WebApp/Main/PopupPlanAddBody.aspx)
    *   [PopupPlanAddBody_FR.aspx](../../../WebApp/Main/PopupPlanAddBody_FR.aspx)

*   **Chi tiết sửa đổi**:
    *   **Hiển thị hàng Successor**: Cập nhật hàm `LoadOther` (dòng 560) và sự kiện `OnPlanType1` (dòng 2199) để hiển thị phần Successor cho TFSA (`17`), FHSA (`22`) và RRIF (sử dụng hàm `IsRIFPlan` trả về true cho `04`, `12`, `14`):
        ```csharp
        // Trong LoadOther
        bool bShow = (PlanType == "17" || PlanType == "22" || IsRIFPlan(PlanType));
        // Trong OnPlanType1
        if (FSCode == "17" || FSCode == "22" || IsRIFPlan(FSCode))
        ```
    *   **Xử lý lưu trữ dữ liệu**: Cập nhật hàm `OnAdd` (dòng 2524) để giữ lại giá trị Successor nếu tài khoản là FHSA:
        ```csharp
        if (AccountType != "17" && AccountType != "22" && !IsRIFPlan(AccountType)) bTFSASuccessorInd = false;
        ```
    *   **Thêm validation cho Quebec (QC)**: Trong `OnAdd`, nếu tỉnh cư trú là Quebec ("QC") và tài khoản là Client Name (`AccountDesignation == "1"`), và tài khoản không bị khóa (`!chLockedIn.Checked`), thì không cho phép chỉ định Successor (theo quy định của Luật dân sự QC đối với tài khoản không phân bổ/không khóa):
        ```csharp
        if (bTFSASuccessorInd && hdClientProv.Value.ToUpper().Trim() == "QC" && !chLockedIn.Checked && AccountDesignation == "1")
        {
            CBase.DisplayAlert(chTFSASucessorHolder, MSGID,
                Lg == 0 ? "Successor designation is prohibited for Quebec residents on non-locked-in accounts."
                        : "La désignation de successeur est interdite pour les résidents du Québec sur les comptes non immobilisés.",
                true);
            return 0;
        }
        ```
    *   **Thêm validation bắt buộc ngoài Quebec**: Đối với các tỉnh ngoài Quebec, tài khoản Client Name thuộc nhóm cho phép Successor bắt buộc phải có ít nhất một **Death Beneficiary** HOẶC chỉ định **Successor**:
        ```csharp
        bool bSuccessorEligiblePlan = (AccountType == "17" || AccountType == "22" || IsRIFPlan(AccountType));
        if (bSuccessorEligiblePlan && AccountDesignation == "1" && hdClientProv.Value.ToUpper().Trim() != "QC")
        {
            int tempCurrentID = 0;
            string[] tempCtrlStr = new string[] { "", "", "" };
            DataSet dsBen = Plan.PlanBenListSet(this, tempCtrlStr, Lg, iClientID, iPlanID, ref tempCurrentID, 0, 0);
            int benCount = 0;
            if (dsBen != null && dsBen.Tables.Contains("BenList"))
            {
                foreach (DataRow row in dsBen.Tables["BenList"].Rows)
                {
                    if (CFunctions.ToInt(row["iRecordType"], 0) == 1) // Death Beneficiary
                    {
                        benCount++;
                    }
                }
            }

            if (benCount == 0 && !bTFSASuccessorInd)
            {
                CBase.DisplayAlert(chTFSASucessorHolder, MSGID,
                    Lg == 0 ? "A Client Name account for non-Quebec residents must designate either a Death Beneficiary or a Successor."
                            : "Un compte Client Name pour les résidents hors Québec doit désigner soit un bénéficiaire en cas de décès, soit un successeur.",
                    true);
                return 0;
            }
        }
        ```
    *   **Thay đổi UI Checkbox Label**:
        *   Trong `PopupPlanAddBody.aspx` (dòng 1576): Đổi `text="TFSA/RRIF Successor holder account"` thành `text="Successor holder account"`.
        *   Trong `PopupPlanAddBody_FR.aspx` (dòng 1564): Đổi `text="Compte titulaire CELI/FERR successeur"` thành `text="Compte titulaire successeur"`.

#### 2. Database Stored Procedures (`ScriptDB/000_4_CreateSP.sql`)

*   **File cần sửa**:
    *   [000_4_CreateSP.sql](../../../ScriptDB/000_4_CreateSP.sql)

*   **Chi tiết sửa đổi**:
    *   **UBPlanAdd & UBPlanUpdate**: Cho phép lưu trữ và ghi nhận Audit Trail cho tài khoản FHSA (type='22').
        *   Trong `UBPlanAdd` (dòng 484319) và `UBPlanUpdate` (dòng 501529), sửa:
            ```sql
            IF(@AccountType <> '17' AND @AccountType <> '22' AND dbo.IsRRIFT4Type(@AccountType) = 0) SET @iTFSASuccessorInd = 0;
            ```
        *   Trong phần Audit Trail của `UBPlanAdd` (dòng 484868) và `UBPlanUpdate` (dòng 502143), sửa:
            ```sql
            IF(@AccountType <> '17' AND @AccountType <> '22' AND dbo.IsRRIFT4Type(@AccountType) = 0) SET @iTFSASuccessorInd = null;
            ```
    *   **UBFSXMLTSFASucsr (Đổi tên thành UBFSXMLSucsr)**:
        *   Đổi tên procedure từ `UBFSXMLTSFASucsr` $\rightarrow$ `UBFSXMLSucsr` ở cả lệnh `DROP` (dòng 7618) và `CREATE` (dòng 362720).
        *   Sửa các thẻ XML cứng bên trong từ `<TFSASucsr>` $\rightarrow$ `<Sucsr>`:
            ```sql
            SET @RetMSG = '<Sucsr>';
            -- ...
            SET @RetMSG = @RetMSG + '</Sucsr>';
            ```
    *   **UBFSXMLAcctSetup**:
        *   Khai báo biến `@bSuccessorEligible tinyint = 0;` ở đầu SP.
        *   Thiết lập: `IF(@AccountType = '17' OR @AccountType = '22' OR dbo.IsRRIFT4Type(@AccountType) = 1) SET @bSuccessorEligible = 1;`
        *   Sửa lỗi thông báo lỗi ở kiểm tra Beneficiary/Successor (dòng 361628):
            ```sql
            IF(@bSuccessorEligible = 1 AND @AccountDesignation = '1' AND (@TaxCode <> 'QC' OR @bSeg = 1 OR @LckdInCode = 'L') )
            BEGIN
                SELECT TOP 1 @iTFSASucsrID = ID FROM UB_PlanBen WITH (NOLOCK) WHERE LinkedID = @iPlanID AND iRecordType = 2;
                IF(@iTFSASucsrID is null) SET @iTFSASucsrID = 0;
                IF(@iTFSASucsrID = 0 AND @iBenCount = 0 AND @Estate <> 'Y')
                BEGIN
                    SET @RetMSG = '';
                    SET @ErrorMSG = 'Missing beneficiary or Successor for client name ' + (CASE WHEN @AccountType = '17' THEN 'TFSA' WHEN @AccountType = '22' THEN 'FHSA' ELSE 'RRIF' END);
                    RETURN;
                END
                -- ...
            END
            ```
        *   Gọi procedure đổi tên để sinh thẻ XML `<Sucsr>`:
            ```sql
            ------ Successor -----
            IF(@bSuccessorEligible = 1 AND @AccountDesignation = '1' AND (@TaxCode <> 'QC' OR @bSeg = 1 OR @LckdInCode = 'L') )
            BEGIN
                IF(@iTFSASucsrID is not null AND @iTFSASucsrID > 0)
                BEGIN
                    SET @MSGTMP = '';
                    EXEC [dbo].[UBFSXMLSucsr] @iTFSASucsrID, @MSGTMP OUTPUT;
                    SET @RetMSG = @RetMSG + @MSGTMP;
                END
            END
            ```
    *   **UBFSXMLAcctTrnsfr (Sửa bug cũ + Nâng cấp V36)**:
        *   *Phát hiện bug cũ*: Biến `@bTFSA` được khởi tạo là `0` nhưng không bao giờ gán thành `1` cho tài khoản TFSA, khiến Successor không bao giờ được xuất ra file transfer XML.
        *   *Giải pháp*: Khai báo biến `@bSuccessorEligible tinyint = 0;` ở đầu SP. Gán giá trị: `IF(@AccountType = '17' OR @AccountType = '22' OR dbo.IsRRIFT4Type(@AccountType) = 1) SET @bSuccessorEligible = 1;`
        *   Sửa khối logic export Successor (dòng 361964):
            ```sql
            ------ Successor -----
            IF(@bSuccessorEligible = 1 AND @AccountDesignation = '1' AND (@TaxCode <> 'QC' OR @bSeg = 1 OR @LckdInCode = 'L') )
            BEGIN
                SET @iTFSASucsrID = 0;
                SELECT TOP 1 @iTFSASucsrID = ID FROM UB_PlanBen WITH (NOLOCK) WHERE LinkedID = @iPlanID AND iRecordType = 2;
                IF(@iTFSASucsrID is not null AND @iTFSASucsrID > 0)
                BEGIN
                    SET @MSGTMP = '';
                    EXEC [dbo].[UBFSXMLSucsr] @iTFSASucsrID, @MSGTMP OUTPUT;
                    SET @RetMSG = @RetMSG + @MSGTMP;
                END
            END
            ```

#### 3. XML Import Parser (`UBFFImport/CAA.cs`)

*   **File cần sửa**:
    *   [CAA.cs](../../../UBFFImport/CAA.cs)

*   **Chi tiết sửa đổi**:
    *   Đổi tên hàm helper từ `ImportXMLGetTFSASucsr` $\rightarrow$ `ImportXMLGetSucsr` (dòng 798 và dòng 1052).
    *   Đổi case khớp thẻ XML từ `"TFSASUCSR"` $\rightarrow$ `"SUCSR"` (dòng 1050):
        ```csharp
        case "SUCSR":
            if (reader.NodeType == XmlNodeType.Element)
                Ret = ImportXMLGetSucsr(DBIDStr, FileName, eLog, Options, reader,
                         DefSet, DataSetTB, ElemName, "");
            break;
        ```

#### 4. Export Structs (`UBExport/TS_Export.cs`)

*   **File cần sửa**:
    *   [TS_Export.cs](../../../UBExport/TS_Export.cs)

*   **Chi tiết sửa đổi**:
    *   Đổi tên class `CTFSASucsr` $\rightarrow$ `CSucsr` (dòng 288) để tổng quát hóa.
    *   Đổi tên trường trong `CDemo` (dòng 308) từ `public CTFSASucsr TFSASucsr;` $\rightarrow$ `public CSucsr Sucsr;` để khớp cấu trúc XML mới:
        ```csharp
        public class CSucsr
        {
            public CClientInfoTS ClientInfo;
            public CAddress Address;
        }

        public class CDemo
        {
            // ... các trường khác ...
            public CSucsr Sucsr;
        }
        ```

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

| File / Component | Vị trí thay đổi | Mô tả chi tiết thay đổi | Trạng thái |
|---|---|---|---|
| **Database (Lookup)** | Bảng `UB_Def_FundType` | **Chỉ thêm mới** mã `B – Bullion` (không xóa `E` và `O` để bảo vệ liên kết dữ liệu cũ). | ⬜ Pending |
| **Database (SP)** | `UBFundTypeList` | **Không thay đổi (Giữ nguyên)** để dropdown luôn sẵn các giá trị `E` và `O`, tránh crash giao diện khi load các quỹ cũ. | ➖ N/A |
| **Database (SP)** | `UBFundDefAdd` | Thêm validation chặn lưu nếu `@iOptions = 0` và `@ProductType` là `E` hoặc `O` (trả về `@Ret = 12`). | ⬜ Pending |
| **Database (SP)** | `UBFundDefUpdate` | Thêm validation chặn lưu nếu `@ProductType` là `E` hoặc `O` (trả về `@Ret = 12`). | ⬜ Pending |
| **WebApp (UI)** | `PopupFundDefEdit.aspx.cs` | Bổ sung `case 12:` khi gọi SP cập nhật, hiển thị thông báo cảnh báo song ngữ và chặn không cho lưu. | ⬜ Pending |
| **WebApp (UI)** | `PopupFundDefAdd.aspx.cs` | Bổ sung `case 12:` khi gọi SP thêm mới, hiển thị thông báo cảnh báo song ngữ và chặn không cho lưu. | ⬜ Pending |
| **WebApp (UI)** | `FundSetup.aspx.cs` / `FundSetupBody.aspx` | Đảm bảo hiển thị đúng nhãn mô tả cũ cho `Other` / `ETF` nhờ liên kết JOIN trong DB vẫn tồn tại. | ⬜ Pending |

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

| Component / File | Thay đổi thực tế | Trạng thái |
|---|---|---|
| **C# Parser (`CFD.cs`)** | **Không cần thay đổi**. Bộ parser phân tích thẻ `<CustomDate>` trong vòng lặp động (`while (reader.Read())`) và nạp vào `DataTable` mà không có bất kỳ dòng check limit cứng nào (như check `> 250`). | ✅ Đã đáp ứng |
| **Database (SP & Table)** | **Không cần thay đổi**. Bảng `UB_FundDefCusModel` lưu trữ mỗi Custom Date là 1 dòng riêng biệt và SP `UBXMLRecFDProcessModel` thực hiện insert/update từng dòng một. Không có ràng buộc giới hạn số dòng ở DB. | ✅ Đã đáp ứng |
| **Database (XML Schema)** | **Không cần thay đổi**. Hệ thống Dealer chỉ **import** file FD/MD và không validate schema (do Fundserv đã validate ở đầu Manufacturers), vì vậy database không lưu Schema Collection cho FD/MD. | ✅ Đã đáp ứng |

> [!NOTE]
> Kết quả rà soát mã nguồn C# và Database SP cho thấy hệ thống hiện tại đã xử lý hoàn toàn động đối với danh sách Custom Date. Do đó, mục này **đã tự động tương thích** và không cần thực hiện thêm thay đổi nào.

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

| Component / File | Thay đổi thực tế | Trạng thái |
|---|---|---|
| **C# Parser (`CASM.cs`)** | **Không cần thay đổi**. Bộ parser phân tích thẻ XML của Asymmetric Settlement Report (`ASM`/`ASP` files) bằng `XmlReader` động thông qua hàm helper `CXML.GetOneElement`. Các cột trong `DataTable` trung gian được định nghĩa kiểu `string` và không bị giới hạn độ dài cứng trong mã nguồn C#. | ✅ Đã đáp ứng |
| **Database (Stored Procedures)** | **Không cần thay đổi**. Các Stored Procedure nhận dữ liệu (`UBASMHeaderAdd`, `UBASMPymtByPartAdd`, `UBASMPymtAdd`) khai báo các tham số số tiền dưới dạng `varchar(20)`. Khai báo này hoàn toàn đủ để chứa chuỗi số tiền 16 ký tự mới của V36 (ví dụ: `99999999999.9999`). | ✅ Đã đáp ứng |
| **Database (Tables & Columns)** | **Không cần thay đổi**. Dữ liệu số tiền được chuyển đổi bằng `CONVERT(money, @Amount)` và lưu vào các cột có kiểu dữ liệu `MONEY` trong bảng `UB_ASM_Header`, `UB_ASM_Part`, và `UB_ASM_Item`. Kiểu dữ liệu `MONEY` trong SQL Server hỗ trợ lưu trữ số tiền lên đến 15 chữ số phần nguyên (922 nghìn tỷ), hoàn toàn đáp ứng mức tối đa mới của V36 là 11 chữ số phần nguyên (`99,999,999,999.9999`). | ✅ Đã đáp ứng |
| **Database (XML Schema)** | **Không cần thay đổi**. Tương tự các file nhận về khác, file GS (`ASM`/`ASP`) chỉ phục vụ import đối soát, không thực hiện validate XML Schema Collection trong database. | ✅ Đã đáp ứng |

> [!NOTE]
> Kết quả rà soát chi tiết mã nguồn C# parser (`CASM.cs`) và thiết kế database cho thấy hệ thống VieFund đã sử dụng kiểu dữ liệu `MONEY` cùng tham số đầu vào `varchar(20)` rộng rãi từ trước. Do đó, cấu trúc dữ liệu và mã nguồn hiện tại **đã tự động tương thích** với thay đổi mở rộng trường số tiền trong file GS của V36 mà không cần chỉnh sửa gì thêm.

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

| Component / File | Thay đổi thực tế | Trạng thái |
|---|---|---|
| **C# Parser (`CAA.cs`)** | **Không cần thay đổi**. Bộ parser `CAA.cs` khi phân tích file PS (`ACCTFNCL` block) sẽ đọc thông tin tài khoản và danh sách các vị thế (`FUNDPOSITION`). Nếu tài khoản không chứa vị thế nào (`DataPosTB.Rows.Count == 0`), hàm `ImportXMLPSPProcess` sẽ tự động bỏ qua và trả về `true` (không báo lỗi). Do đó, việc manufacturer không gửi vị thế zero-balance đối với quỹ terminated sẽ không gây lỗi hệ thống. | ✅ Đã đáp ứng |
| **Database (XML Schema)** | **Không cần thay đổi**. Hệ thống không lưu trữ hay xác thực XML Schema Collection đối với file PS nhận về từ Fundserv. | ✅ Đã đáp ứng |

> [!NOTE]
> Kết quả rà soát mã nguồn parser `CAA.cs` cho thấy hệ thống không bắt buộc sự hiện diện của phần tử `<FUNDPOSITION>` trong bản ghi tài khoản PS. Nếu không có vị thế, parser sẽ tự động bỏ qua một cách an toàn mà không làm gián đoạn tiến trình import. Do đó, mục này **đã tự động tương thích** và không cần thực hiện thêm thay đổi nào.

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
| 8 | Custom Date Expansion | 🟢 Đã tương thích | **Không cần sửa** – Code hiện tại đã xử lý động |
| 9 | GS File Amount Value | 🟢 Đã tương thích | **Không cần sửa** – DB dùng kiểu `MONEY` và C# dùng string |
| 10 | PS File Terminated | 🟢 Đã tương thích | **Không cần sửa** – Parser tự động bỏ qua khi không có vị thế |

## Quyết định & Thống nhất (Resolved Decisions)

> [!NOTE]
> Các câu hỏi mở trước đây đã được phản hồi và thống nhất với các quyết định kỹ thuật cụ thể dưới đây:
>
> 1. **Tích hợp myserv**: **KHÔNG** $\rightarrow$ Hệ thống WebApp không tích hợp trực tiếp với myserv API. Do đó, toàn bộ **Mục 6 (DOT 165 - myserv changes)** được đánh dấu là **Out of Scope** (không cần thực hiện trong release này). Phase 2 (TFS/NFU) sẽ được chuẩn bị cho V37 (2027).
> 2. **Database Schema cho Deductions**: **CHƯA CÓ** $\rightarrow$ Bảng lưu trữ Deductions/Transactions hiện tại chưa có sẵn cột cho 4 loại phí mới. Chúng ta cần bổ sung script SQL để thêm mới 4 cột: `EarlyRdmtnFee`, `DlrAdvsrFee`, `MVA`, `IRSTax` (kiểu `DECIMAL(13, 2)`).
> 3. **Hệ thống xử lý file FD/MD**: **Windows Service (VieFUNDIE)** $\rightarrow$ Tiến trình xử lý file thiết lập quỹ (FD/MD) do dịch vụ chạy nền đảm nhiệm thông qua thư viện shared `UBFFImport.dll`. Việc nâng giới hạn từ 250 lên 500 Custom Dates sẽ được thực hiện trực tiếp trong code của thư viện này.
> 4. **Tương thích ngược (Backward Compatibility)**: **KHÔNG** $\rightarrow$ Không cần hỗ trợ chạy song song cả V35 và V36 cùng một lúc khi phân tích file XML. Parser sẽ được cập nhật trực tiếp theo chuẩn V36 để chạy từ ngày Go-live (15/06/2026).
> 5. **Phase 2 (Data Minimization)**: Xác nhận không thay đổi TFS/NFU data fields trong đợt release V36 này.
> 6. **Xử lý Product Type cũ (Other và ETF)**: **Chỉ thêm mới, không thay đổi dữ liệu cũ** $\rightarrow$ Thống nhất giữ nguyên mã `E` và `O` trong bảng tra cứu `UB_Def_FundType` để phục vụ đối soát lịch sử. Thay vì lọc bỏ `E` và `O` trong `UBFundTypeList` (điều này đòi hỏi lập trình phòng thủ trong C# để tránh crash UI khi tải dữ liệu cũ), chúng ta giữ nguyên danh sách dropdown. Thay vào đó, việc chặn chọn mới/sửa đổi sang mã `E` hoặc `O` sẽ được thực hiện trực tiếp thông qua validation tại Stored Procedure `UBFundDefAdd` và `UBFundDefUpdate` (trả về `@Ret = 12`), phía WebApp UI (`PopupFundDefAdd.aspx.cs` và `PopupFundDefEdit.aspx.cs`) sẽ bắt mã lỗi này để hiển thị cảnh báo chặn lưu.
> 7. **Mở rộng giá trị trường số tiền file GS (DOT 183)**: **Không cần thay đổi** $\rightarrow$ Hệ thống đã sử dụng kiểu dữ liệu `MONEY` ở database (hỗ trợ tới 15 chữ số phần nguyên) cùng các tham số stored procedure kiểu `varchar(20)`. Parser C# (`CASM.cs`) nạp động dữ liệu dạng chuỗi và không kiểm tra độ dài cứng. Vì vậy, hệ thống tự động tương thích với sự mở rộng này.
> 8. **Bỏ qua vị thế zero-balance của tài khoản bị Terminate trong PS (DOT 158)**: **Không cần thay đổi** $\rightarrow$ Parser `CAA.cs` khi xử lý block tài khoản không chứa phần tử vị thế sẽ tự động bỏ qua an toàn mà không báo lỗi hay crash. Vì vậy, hệ thống tự động tương thích với quy tắc báo cáo mới này.

---

## Tài liệu tham chiếu

| Tài liệu | Mô tả |
|---|---|
| **V36_req.md** | Fundserv Standards V36 Requirements – nguồn chính (179 pages) |
| **Guide.md** | Hướng dẫn kiến trúc WebApp + VieFUNDIE |
| **DataFlow.md** | Sơ đồ luồng dữ liệu các loại file (CO, TS, HS, FS, etc.) |
| **SampleCO.xml** | Mẫu file CO/TFS với V36 annotations |


