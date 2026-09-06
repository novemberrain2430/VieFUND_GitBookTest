# Account & Plan — Module Guide

> Module quản lý cấu trúc tài khoản đầu tư (Plan) — trung tâm của toàn bộ hệ thống VieFund.
> **Đối tượng**: Developer cần hiểu cấu trúc Plan, các loại tài khoản đặc thù Canada, và quản lý người thụ hưởng.

---

## 1. Kiến trúc: Client → Plan → Account → Position

```
Client
 └── Plan (iPlanID)          ← AccountType: RRSP, TFSA, RESP, OPEN...
      ├── FundAccount         ← MgmtCode + FundID, hoặc GIC
      │    └── FundPosition   ← số units, thị giá, ACB
      ├── Beneficiary list
      ├── Joint holder list
      └── RRIF Setting (nếu là RRIF)
```

Bảng DB: `tPlan`, `tFundAccount`, `tFundPosition`, `tPlanBeneficiary`, `tPlanJoint`

---

## 2. Plan Types (AccountType)

| Mã | Tên | Đặc điểm |
|---|---|---|
| `OPEN` | Non-registered Open Account | Không giới hạn contribution |
| `RRSP` | Registered Retirement Savings Plan | Defer tax, giới hạn contribution hàng năm |
| `SPOUSAL` | Spousal RRSP | RRSP của vợ/chồng |
| `RRIF` | Registered Retirement Income Fund | Phải rút minimum withdrawal hàng năm |
| `LIF` | Life Income Fund | RRSP locked-in, có max withdrawal |
| `LIRA` | Locked-In Retirement Account | Tài khoản khóa từ pension |
| `TFSA` | Tax-Free Savings Account | Lãi và rút tiền miễn thuế |
| `RESP` | Registered Education Savings Plan | Tiết kiệm giáo dục; CESG từ chính phủ |
| `RDSP` | Registered Disability Savings Plan | Hỗ trợ người khuyết tật |
| `FHSA` | First Home Savings Account | Mua nhà lần đầu |

> **Nguồn**: `UBClasses/Plan.cs` L23 — `GetPlanTypeInfo()` trả về `bGroup`, `bSpousal`, `bInTrust`, `bLockedIn`, `FSCode`

---

## 3. Plan Fields chính

| Nhóm | Fields |
|---|---|
| **Định danh** | `iPlanID`, `DealerAccountID`, `AccountType`, `FSCode` |
| **Client liên quan** | `iClientID`, `iRepID`, `iSpouseID` |
| **Designation** | `AccountDesignation` (1=Client Name, 2=Nominee, 3=Intermediary trong Order/report SQL hiện hành) |
| **Trạng thái** | `Status` (A=Active, T=Terminated), `StartDate`, `EndDate` |
| **Joint** | `JointType`, `JointSignatureOpt` |
| **RESP** | `RecipientCode`, `bRESPSiblingFlag` |
| **TFSA** | `bTFSASuccessorInd`, `TFSASuccessorEffective`, `TFSADeceasedFName/LName/SIN/DOD` |
| **Lock-in** | `iLockedIn`, `LockedInProv` |
| **Trust** | `iInTrust` |
| **Compliance** | `bIncompleteKYC`, `bIncompleteQuestion`, `iCommFlag` |
| **Fee** | `iAAModelID`, `iFeeAUAExclude` |

> **Nguồn**: `UBClasses/Plan.cs` L902-1009 — `PlanAddUI()` param list đầy đủ

---

## 4. Plan CRUD

```csharp
// Add/Update
db.SetSP(iPlanID == 0 ? "UBPlanAdd" : "UBPlanUpdate");

// Delete (chỉ khi không còn Fund Accounts)
Plan.PlanDeleteUI(p, Lg, iPlanID)  // → SP: UBPlanDelete
```

| Method | SP | Mô tả |
|---|---|---|
| `Plan.GetPlanInfo()` | `UBPlanInfo2` | Full plan info (DataSet multi-table) |
| `Plan.GetPlanInfo4Header()` | `UBPlanInfo4Header` | Abbreviated info cho page header |
| `Plan.GetPlanTypeFSCode()` | `UBPlanInfoType` | Lấy FSCode từ iPlanID/iAccountID/iPosID |
| `Plan.GetPlanTypeInfo()` | `UBPlanTypeInfo` | bGroup/bSpousal/bInTrust/bLockedIn |

---

## 5. Beneficiaries

Mỗi beneficiary: `Name`, `DOB`, `SIN`, `Relationship`, `fAllocation` (%), `BenType` (Primary/Contingent).

> **Validation**: Tổng `fAllocation` phải = 100%.

```csharp
Plan.PlanBenListSet()        → SP UBPlanInfoBenList        // Full list
Plan.PlanBenListShortSet()   → SP UBPlanInfoBenListShort   // Abbreviated
Plan.PlanBenConListSet()     → SP UBPlanBenConList          // Contingent
// SP UBBenItemInfo4RESP, UBRESPSummaryOneBen               // RESP special
```

---

## 6. Joint Holders

```csharp
Plan.UpdatePlanJointList()   → SP UBPlanInfoJointList
Plan.PlanJointSwapRole()     → SP UBPlanJointSwapRole  // Đổi Primary/Secondary
```

---

## 7. RRIF Module

RRIF là RRSP chuyển đổi — phải rút tiền mỗi năm theo tỷ lệ CRA.

```csharp
RRIFSetting.GetInfo()       → SP UBRRIFSettingInfo
RRIFSetting.Save()          → SP UBRRIFSettingSave
RRIFSetting.GetFundList()   → SP UBRRIFSettingFundList
RRIFSetting.GetRedemptionList() → SP UBRRIFRedemptionList
```

**UI**: `RRIFView.aspx`, `RRIFRedemptionView.aspx`, `PanelRRIFPayment.aspx`

**YOB Rule**: `RRIFSetting.GetYOBPlan()` → `UBRRIFYOBPlan` — tính minimum withdrawal theo tuổi.

---

## 8. RESP Module

- **CESG**: Chính phủ match 20% contribution (max $500/năm)
- **CLB**: Canada Learning Bond cho gia đình thu nhập thấp
- **Sibling Flag**: `bRESPSiblingFlag` — cho phép CESG chia cho anh/em

```
UBRESPSummaryOneBen        — Tóm tắt CESG, CLB cho 1 beneficiary
UBBenNewContributionList   — Contributions mới chờ gửi CRA
UBRESPBatchFileContentSave — Lưu CRA XML batch file
```

**UI**: `RESPView.aspx` (88KB)

---

## 9. TFSA Module

XML Export: `TFSAXml.cs` → CRA T1028 reporting.
Fields: `bTFSASuccessorInd`, `TFSASuccessorEffective`, `TFSADeceasedSIN`, `TFSADeceasedDOD`.

---

## 10. PAC / SWP (Fund Redemption)

```csharp
Plan.AddRedemption()       → SP UBPlanRedemptionAdd
Plan.GetRedemptionList()   → SP UBPlanRedemptionList
Plan.GenerateSchedule()    → SP UBScheduleGenerateOneUI
```

---

## 11. Plan Move / Merge / SysPlan

```csharp
Plan.Move2AnotherClient()           → SP UBPlanMove2AnotherClientID
Plan.MergeClientInfo()              → SP UBMergeClientInfo
Plan.FundAccountMoveFromPlan2Plan() → SP UBFundAccountMoveFromPlan2Plan
Plan.GetSysPlanList()               → SP UBSysPlanList  // System Plans (internal dealer accounts)
```

---

## 12. UI Entry Points

| Page | Size (KB) | Vai trò |
|---|---|---|
| `PlanView.aspx(.cs)` | 100.6 | Trang chính Plan management |
| `PopupPlanAdd.aspx(.cs)` | 126.7 | Thêm/Edit Plan |
| `RESPView.aspx(.cs)` | 88.1 | RESP management |
| `RRIFView.aspx(.cs)` | 15.0 | RRIF Plan View |
| `PanelRRIFPayment.aspx(.cs)` | 130.8 | RRIF Payment processing |
| `PanelPlanBenAdd.aspx(.cs)` | 65.3 | Thêm/Edit Beneficiary |
| `SysPlanView.aspx(.cs)` | 73.3 | System Plan view |

---

## 13. BLL Classes

| Class | File | Size | Vai trò |
|---|---|---|---|
| `Plan` | `UBClasses/Plan.cs` | 202KB | Core Plan CRUD, Ben, Joint, Trust, Transfer |
| `RRIFSetting` | `UBClasses/RRIFSetting.cs` | 96KB | RRIF setting, payment, schedule |
| `TFSA` | `UBClasses/TFSA.cs` | 30KB | TFSA room tracking, XML reporting |
| `AccountSummary` | `VieFUNDPdf/AccountSummary.cs` | 40KB | Account Summary PDF |

---

## 14. Stored Procedures chính

| Nhóm | SPs |
|---|---|
| **Plan CRUD** | `UBPlanAdd`, `UBPlanUpdate`, `UBPlanDelete`, `UBPlanInfo2`, `UBPlanInfo4Header` |
| **Search** | `UBPlanViewSearch`, `UBPlanViewSearchLoad` |
| **Beneficiary** | `UBPlanInfoBenList`, `UBPlanBenConList`, `UBRESPSummaryOneBen` |
| **Joint** | `UBPlanInfoJointList`, `UBPlanJointSwapRole` |
| **RRIF** | `UBRRIFSettingInfo`, `UBRRIFSettingSave`, `UBRRIFRedemptionList`, `UBRRIFYOBPlan` |
| **Redemption** | `UBPlanRedemptionAdd`, `UBPlanRedemptionList`, `UBScheduleGenerateOneUI` |
| **Compliance** | `UBCompAccountOpeningList`, `UBCompAccountKYCUpdateList`, `UBCompMissingKYCList` |
| **Move/Merge** | `UBPlanMove2AnotherClientID`, `UBMergeClientInfo`, `UBFundAccountMoveFromPlan2Plan` |
| **SysPlan** | `UBSysPlanList`, `UBSysPlanDelete`, `UBSysPlanTrxList` |

---

## 15. Cross-references

| Tài liệu | Liên quan |
|---|---|
| [Domain Glossary](../../getting-started/domain-glossary.md) | RRSP, TFSA, RESP, RRIF, LIF, PAC, SWP, KYC |
| [Client & KYC](../client-kyc/module-guide.md) | KYC gắn với Client — Plan link qua iClientID |
| [Trading & Orders](../trading-orders/module-guide.md) | Tất cả trades gắn vào iPlanID |
| [Commission & Fee](../commission-fee/module-guide.md) | Fee for Service tính trên plan AUA |
| [Fund & GIC](../fund-gic/module-guide.md) | Fund Accounts và Fund Positions thuộc Plan |
| [System Map](../../getting-started/system-map.md) | Plan.cs là class trung tâm của hệ thống |
