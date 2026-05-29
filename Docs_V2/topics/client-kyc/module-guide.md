# 01 — Client & KYC (Module Guide)

> Module quản lý thông tin khách hàng (Client) và quy trình KYC (Know Your Client) — nền tảng dữ liệu của toàn bộ hệ thống VieFUND.
> **Đối tượng**: Developer .NET cần hiểu cấu trúc Client, Plan, KYC và quyền truy cập.

---

## 1. Tổng quan nghiệp vụ

Mỗi Client (nhà đầu tư) được quản lý bởi một Rep (Representative/Advisor). Client có thể có nhiều Plan (tài khoản đầu tư), mỗi Plan chứa nhiều Fund Position (vị thế quỹ). Hệ thống tuân thủ quy định KYC của Canada — mọi thông tin tài chính, rủi ro, và nhận dạng phải được thu thập và cập nhật định kỳ.

> **Nguồn**: `Client Access Right, Plan's account type.md`

### Quan hệ Client — Rep — Dealership

```
Dealership (DSID)
  └── Dealer Code
       └── Rep Code (Representative)
            └── Advisor Code
                 └── Client(s)
```

- Mỗi Rep chỉ nhìn thấy Client của mình (trừ Admin).
- Một Rep có thể có nhiều Rep Codes.
- Một Client có thể có nhiều instances (records) khác nhau — ví dụ: một với home address, một với P.O. Box.

> **Nguồn**: `RepCode Explained` — "Mỗi Client gắn với 1 repcode"

---

## 2. Phân loại Client

### Client Status

| Giá trị | Ý nghĩa | Ghi chú |
|---|---|---|
| `1` | Active (A) | Industry standard |
| `2` | Terminated (T) | Industry standard |
| `3` | Prospect (P) | Internal — chưa có plan |
| `4` | Deceased | Yêu cầu ngày mất (`DeceasedDate`) |

> **Nguồn**: `Client Access Right.md` — "A and T are industry standard value for Account Status"

### Client Type: Individual vs Corporation

Phân biệt qua field `Title`:
- `Title != "7"` → **Individual** (cá nhân): có SIN, DOB, Marital Status, Spouse info
- `Title == "7"` → **Corporation** (doanh nghiệp): có Contact Name, Contact Position, FedBN, ProvBN, Website, CorpType

> **Nguồn**: `PopupClientAdd.aspx.cs` L2362-2384 — logic phân nhánh theo `Title`

### Account Designation Types

| Loại | Mô tả | Trách nhiệm thuế |
|---|---|---|
| **Client Name** | Tài khoản tại fund company dưới tên client | Fund company gửi tax forms |
| **Nominee** | Tài khoản dưới tên dealer, client là beneficiary owner | Dealer gửi tax forms |
| **Intermediary** | Tài khoản dưới tên intermediary, client là beneficiary owner | Intermediary gửi tax forms |

> **Nguồn**: `Client Access Right.md`

---

## 3. Cấu trúc dữ liệu Client

### BLL Class chính

| Class | File | Size | Vai trò |
|---|---|---|---|
| `CCustomer` | `UBClasses/Customer.cs` | 251KB (~6,200 lines) | Toàn bộ logic CRUD Client, Plan, KYC, Fund Position |

### Các SP chính — Client CRUD

| Thao tác | BLL Method | SP | Ghi chú |
|---|---|---|---|
| **Tìm kiếm** | `GetClientList()` | `UBClientSearch` | Search theo FileID, Name, Phone, PlanNumber, AccountNumber |
| **Load danh sách đã search** | `GetClientSearchList()` | `UBClientSearchLoad` | Phân trang server-side |
| **Load chi tiết** | `GetClientDataSet()` | `UBClientInfo` | Trả về DataSet multi-table: Client, ClientAddress, MailingAddress, ClientPhone, FinInfo, WebClient |
| **Thêm mới** | `ClientAddUI()` | `UBClientAddUI` | 50+ parameters, xử lý cả individual và corporation |
| **Cập nhật** | `ClientAddUI()` | `UBClientUpdateUI` | Cùng method, phân nhánh bởi `iClientID > 0` |
| **Xóa** | `ClientDeleteUI()` | `UBClientRemoveUI` | Xóa client |
| **Favorite** | `ClientFavoriteAdd()` | `UBClientFavoriteAdd` | Đánh dấu client quan trọng |

> **Nguồn**: `Customer.cs` L38-147 (Search), L197-244 (GetClientDataSet), L2261-2751 (ClientAddUI)

### DataSet từ `UBClientInfo` — Multi-table Result

SP `UBClientInfo` trả về DataSet với nhiều tables, mỗi table được đặt tên theo cột `RecType`:

| Table Name | Nội dung |
|---|---|
| `Client` | Thông tin cơ bản: FirstName, LastName, DOB, SIN, Status, bCorp, iMemberID, RepCodeDef |
| `ClientAddress` | Địa chỉ chính: Line1, Line2, City, ProvinceCode, PostalCode, CountryCode |
| `MailingAddress` | Địa chỉ gửi thư (nếu khác địa chỉ chính) |
| `ExtraAddress` | Địa chỉ bổ sung |
| `ClientPhone` | MainPhone, BusPhone, CellPhone, Fax, EmailAddress |
| `FinInfo` | Thông tin tài chính: AnnualIncome, NetWorth, LiquidityAsset, FixedAsset, Liability... |
| `WebClient` | Thông tin Web Client portal: LoginID, EncPW, iStatus |

> **Nguồn**: `Customer.cs` L197-244 — `GetClientDataSet()` và L234-242 (table naming logic)

---

## 4. KYC (Know Your Client)

### KYC ở 2 cấp độ

| Cấp độ | Nội dung | Nguồn |
|---|---|---|
| **Client-level** | Annual Income, Net Worth, Investment Knowledge, Investment Experience, Employment | Tab Financial trong PopupClientAdd |
| **Plan-level** | Investment Objective, Risk Tolerance | Plan-level KYC form |

> **Nguồn**: `Client Access Right.md` — "KYC info on the plan level is for the plan, and the KYC info on the client level is for the client"

### SP liên quan KYC

| SP | Vai trò |
|---|---|
| `UBClientKYC` | Load KYC data cho Client + Plan |
| `UBClientKYCExtraList` | Load extended KYC questions |
| `UBClientKYCExtraSaveEnd` | Lưu extended KYC answers |
| `UBClientInfoFinancial` | Load thông tin tài chính |

> **Nguồn**: `Customer.cs` L245-291 — `GetClientKYCSet()`

### Financial Information Fields

| Field | Mô tả |
|---|---|
| `iAnnualIncome` | Range thu nhập hàng năm (dropdown) |
| `mAnnualIncome` | Số tiền thu nhập cụ thể |
| `iNetworth` | Range giá trị ròng |
| `iInvestmentKnowledge` | Mức độ kiến thức đầu tư |
| `mLiquidityAsset` | Tài sản thanh khoản |
| `mFixedAsset` | Tài sản cố định |
| `mLiability` | Nợ phải trả |
| `mNetworth` | Giá trị ròng (tính toán) |
| Investment Experience | MF, GIC, Stock, Bond, Mortgage, RealEstate, ETF, ExemptProduct, Option |

> **Nguồn**: `PopupClientAdd.aspx.cs` L687-800 — FinInfo table loading

### Risk Profile Questions

Hệ thống hỗ trợ tới 8 câu hỏi Risk Profile (configurable per dealer):
- `iRiskProfileQ_ID1` → `iRiskProfileQ_A1` (câu hỏi 1 và câu trả lời)
- ... tới `iRiskProfileQ_ID8` → `iRiskProfileQ_A8`

> **Nguồn**: `Customer.cs` L2643-2699

---

## 5. Plan (Tài khoản đầu tư)

### Quan hệ Client → Plan → Fund Position

```
Client
  └── Plan (RRSP, TFSA, OPEN, RRIF...)
       └── Fund Position (units of a specific fund)
            └── Transaction History
```

### Khái niệm Plan vs Account

| Thuật ngữ | Ngữ cảnh | Ý nghĩa |
|---|---|---|
| **Account** | Fund company | Tài khoản tại fund company |
| **Plan** | Dealer level | Nhóm các accounts cùng loại, cùng investment objective, cùng beneficiaries |

> **Nguồn**: `Client Access Right.md` — "Plan is a group of accounts with similar characteristics"

### Joint Plan vs Spousal Plan

| Loại | Mô tả | Áp dụng |
|---|---|---|
| **Joint Plan** | Đồng sở hữu (thường vợ chồng) | Chỉ plan type OPEN |
| **Spousal Plan** | Người phối ngẫu đóng góp vào plan | Chỉ registered plans (RRSP) |

> **Nguồn**: `Client Access Right.md` — "Joint Plan and Spousal Plan have nothing to do with each other"

### SP liên quan Plan

| SP | BLL Method | Vai trò |
|---|---|---|
| `UBClientPlanList` | `GetClientPlanList()` | Danh sách Plans của Client |
| `UBClientPlan` | `GetClientPlanSet()` | Chi tiết Plan |
| `UBPlanInfo` | `GetPlanDataSet()` | DataSet chi tiết Plan |
| `UBPlanMFList` | `GetPlanMFList()` | Danh sách Mutual Fund positions trong Plan |
| `UBPlanGICList` | `GetPlanGICList()` | Danh sách GIC positions trong Plan |
| `UBClientPlanCB` | `GetClientPlanListCB()` | Plans cho ComboBox/Dropdown |

> **Nguồn**: `Customer.cs` — methods `GetClientPlanList()`, `GetPlanDataSet()`, `GetPlanMFList()`

---

## 6. Spouse (Thông tin người phối ngẫu)

Khi Client là cá nhân (`Title != "7"`) và có trạng thái hôn nhân (`iMaritalStatus > 1`), hệ thống cho phép nhập thông tin Spouse:

| Field | Mô tả |
|---|---|
| `iSpouseClientID` | ID của Spouse (nếu Spouse cũng là Client trong hệ thống) |
| `SpouseFName/LName` | Họ tên Spouse |
| `SpouseDOB` | Ngày sinh |
| `SpouseSIN` | SIN (Social Insurance Number) |
| `SpouseOccupation` | Nghề nghiệp |
| `SpouseEmpAddress...` | Địa chỉ nơi làm việc |

### SP liên quan

| SP | Vai trò |
|---|---|
| `UBClientInfoSpouse` | Load Spouse info by SpouseID |
| `UBClientInfoSpouseByPlanID` | Load Spouse info by PlanID |

> **Nguồn**: `Customer.cs` L293-378

---

## 7. UI Entry Points

### Trang chính

| Page | File | Vai trò | Size |
|---|---|---|---|
| **Client** | `Client.aspx.cs` | Trang chính quản lý Client — search, view, navigate | 505KB |
| **PopupClientAdd** | `PopupClientAdd.aspx.cs` | Popup thêm/sửa Client (tất cả tabs) | 158KB |
| **ClientStatement** | `ClientStatement.aspx.cs` | Xem statements | 119KB |
| **ClientImportView** | `ClientImportView.aspx.cs` | Import clients | 45KB |
| **WebClientRequest** | `WebClientRequest.aspx.cs` | Quản lý yêu cầu Web Client | 22KB |

### Tabs trong PopupClientAdd

| Tab | Nội dung |
|---|---|
| **Main** (default) | FileID, Status, Title, Name, DOB, SIN, Address, Phone, Email |
| **TabClientFinancial** | Annual Income, Net Worth, Investment Knowledge, Investment Experience, Asset/Liability |
| **TabClientBank** | Danh sách tài khoản ngân hàng (Banking info) |
| **TabClientID** | Identification documents (Citizenship, ID cards) |
| **TabClientQuestion** | KYC questionnaire |
| **TabClientSpouse** | Thông tin Spouse |
| **TabClientRiskQuestion** | Risk Profile questions (4-8 câu hỏi) |
| **TabClientCompany** | Company Executives (cho Corporation) |
| **TabClientAdmin** | Estate flag, LTA, POA, Privacy, Rating, Delivery, Freeze, Lock |
| **TabClientOther** | Mailing address, Extra address, Notes, User-Defined fields |

> **Nguồn**: `PopupClientAdd.aspx.cs` L97-373 — Tab declarations

---

## 8. Quyền truy cập & Bảo mật

### Read-Only Mode

Khi user không phải Admin, `PopupClientAdd` hoạt động ở chế độ Read-Only:
- Nếu Client status **không phải** Prospect (`!= "3"`): tất cả nút OK bị disable, các nút Add/Remove/Edit cho Bank, Identification, Company Executives bị ẩn.
- Nếu Client status **là** Prospect: cho phép sửa.

> **Nguồn**: `PopupClientAdd.aspx.cs` L374-451 — `SetDefault()`

### Lock Fields

| Lock | Ý nghĩa |
|---|---|
| `bLockClient` | Khóa thông tin Client (Admin lock) |
| `bLockSpouse` | Khóa thông tin Spouse |
| `bLockBank` | Khóa thông tin Banking |
| `bLockFinance` | Khóa thông tin Financial |

### Address Lock

Khi Client đã có asset (`iHasAsset == 1`), các field Address bị lock — không cho phép thay đổi địa chỉ vì ảnh hưởng đến tax reporting.

> **Nguồn**: `PopupClientAdd.aspx.cs` L606-608 — `LockAddressField()`

### Client Freeze

`bClientFreezed` — khi Client bị freeze, các giao dịch bị chặn. Quyền freeze/unfreeze được kiểm soát bởi `bCanFreeze`/`bCanUnFreeze` từ SP.

---

## 9. Web Client Portal

Hệ thống hỗ trợ portal cho Client tự đăng nhập xem thông tin:

| SP | Vai trò |
|---|---|
| `UBWebClientPreLogin` | Pre-login validation |
| `UBWebClientUserIDVerify` | Xác thực UserID |
| `UBWebClientUserUpdate` | Cập nhật thông tin WebClient |
| `UBWebClientUserUpdatePW` | Đổi mật khẩu |
| `UBClientLogin` | Client login |
| `UBClientLogout` | Client logout |
| `UBWCRegistrationRequestAdd` | Đăng ký tài khoản WebClient |
| `UBWCRegistrationApprove` | Admin duyệt đăng ký |

### Single Sign-On (SSO)

| Method | SP | Vai trò |
|---|---|---|
| `GetSingleSignOnPW()` | — | SSO authentication (legacy) |
| `GetSingleSignOnPW2()` | — | SSO authentication (new) |
| `CreateWCParamStr()` | — | Tạo parameter string cho WebClient |

> **Nguồn**: `Customer.cs` — methods cuối file

---

## 10. Duplicate Detection

Khi thêm Client mới, hệ thống kiểm tra trùng lặp:

| Check | Parameter | Mô tả |
|---|---|---|
| Duplicate SIN | `bAcceptDuplicateSIN` | Cho phép bỏ qua SIN trùng |
| Duplicate Name | `bAcceptDuplicateFNameLName` | Cho phép bỏ qua tên trùng |
| Duplicate FileID | `bAcceptDuplicateFileID` | Cho phép bỏ qua FileID trùng |

User phải tích checkbox xác nhận nếu muốn tạo Client trùng.

> **Nguồn**: `PopupClientAdd.aspx.cs` L270-274, `Customer.cs` L2545-2547

---

## 11. Danh sách đầy đủ Stored Procedures

Tổng hợp 70 SP được sử dụng trong `Customer.cs`:

| Nhóm | SP |
|---|---|
| **Client CRUD** | `UBClientSearch`, `UBClientSearchLoad`, `UBClientInfo`, `UBClientAddUI`/`UBClientUpdateUI`, `UBClientRemoveUI` |
| **Client Lookup** | `UBClientLookup`, `UBClientInfoByEmail`, `UBClientListSetSelection`, `UBClientListSetSelectionByType`, `UBClientListSetSelectionGIC` |
| **Favorite** | `UBClientFavoriteLoad`, `UBClientFavoriteAdd`, `UBClientFavoriteRemove` |
| **KYC** | `UBClientKYC`, `UBClientKYCExtraList`, `UBClientKYCExtraSaveEnd`, `UBClientInfoFinancial` |
| **Plan** | `UBClientPlan`, `UBClientPlan4Doc`, `UBClientPlanCB`, `UBClientPlanList`, `UBPlanInfo`, `UBPlanMFList`, `UBPlanGICList` |
| **Spouse** | `UBClientInfoSpouse`, `UBClientInfoSpouseByPlanID` |
| **Fund/GIC Position** | `UBMFInfo`, `UBGICInfo`, `UBMFTrxList`, `UBMFTrxList4Doc`, `UBMFTrxListWC`, `UBTrxInfo` |
| **Address** | `UBClientAddressList` |
| **Banking** | *(managed via PanelClientBankAdd.aspx)* |
| **Identification** | *(managed via PanelClientIdentAdd.aspx)* |
| **Person (Joint Rep, Beneficiary)** | `UBPersonList`, `UBPersonUpdate`, `UBPersonRemove` |
| **Web Client** | `UBWebClientPreLogin`, `UBWebClientUserIDVerify`, `UBWebClientUserUpdate`, `UBWebClientUserUpdatePW`, `UBWebClientUserUpdatePWEx`, `UBWebClientUserUpdatePWEx2`, `UBClientLogin`, `UBClientLoginOther`, `UBClientLogout` |
| **Web Client Registration** | `UBWCRegistrationRequestAdd`, `UBWCRegistrationApprove`, `UBWCRequestInfo`, `UBWCRequestList`, `UBWCRequestRemove` |
| **Security** | `UBClientPWChanged`, `UB2FAGetCode4Client`, `UBClienteDocAccessCode`, `UBClienteDocAccessCodeUpdate` |
| **Statement/Delivery** | `UBClientStmtDeliveryList`, `UBClientElectronicStmtUpdate` |
| **Other** | `UBClientInfoWebClient`, `UBClientJointRepList`, `UBClientRRSPLIRAList`, `UBClientOBASave`, `UBClientLiabilitySave`, `UBCustomerListWithEmail`, `UBCustomerTotalAsset`, `UBCDICDataListUCI` |
| **Freeze** | `DI_ClientFreezeTaggedItems`, `DI_ClientZeroMKVInactivate`, `DI_FreezeClientList` |
| **Summary/Report** | `UBClientSummary`, `UBNetworthIndex`, `UBCalcRetirement`, `UBReportAdd` |

> **Nguồn**: `Customer.cs` — extracted via `db.SetSP("...")` pattern

---

## 12. Commission: Joint Reps

Khi 2 hoặc nhiều Reps chia sẻ commission từ một account:

```
Rep 1: 30%
Rep 2: 50%
→ Account earns $100 → Rep1 gets $30, Rep2 gets $50
```

> **Nguồn**: `Client Access Right.md` — "Joint reps: when 2 or more reps share commissions"

---

## 13. AML (Anti-Money Laundering)

| Field | Mô tả |
|---|---|
| `iAMLRiskRanking` | AML Risk ranking (dropdown) |
| `iAMLCheckResult` | Kết quả kiểm tra AML |

> **Nguồn**: `PopupClientAdd.aspx.cs` L99, L361-362

---

## 14. Tổng kết kiến trúc module

```
┌──────────────────────────────────────────────────────┐
│                    UI Layer                          │
│  Client.aspx ──▶ PopupClientAdd.aspx                │
│  (Search, View)   (Add/Edit: 10 tabs)               │
│                    ├── PanelClientBankAdd.aspx        │
│                    ├── PanelClientIdentAdd.aspx       │
│                    ├── PanelClientAddress.aspx        │
│                    └── PanelClientCompExecAdd.aspx    │
└──────────────────────┬───────────────────────────────┘
                       │
                       ▼
┌──────────────────────────────────────────────────────┐
│                   BLL Layer                          │
│  CCustomer (Customer.cs — 251KB, 6,200+ lines)      │
│  ├── Client CRUD (Search, Add, Update, Delete)       │
│  ├── Plan Management (List, Detail, MF/GIC)          │
│  ├── KYC (Financial, Risk Profile, Questions)        │
│  ├── Spouse Management                               │
│  ├── Web Client Portal (Login, SSO, Registration)    │
│  └── Summary/Report                                  │
└──────────────────────┬───────────────────────────────┘
                       │
                       ▼
┌──────────────────────────────────────────────────────┐
│                   DAL Layer                           │
│  70+ Stored Procedures (UBClient*, UBPlan*,          │
│  UBMF*, UBGIC*, UBWebClient*, UBPerson*, DI_*)       │
└──────────────────────────────────────────────────────┘
```
