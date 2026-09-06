# Table Description - VieFUND Database

> Schema snapshot gồm 1.127 bảng: column, kiểu dữ liệu, nullable, identity và mô tả dựa trên naming convention.
> Xem [Data Dictionary](../reference/data-dictionary.md) để hiểu phạm vi, độ tin cậy, quan hệ lõi và cách tra cứu trước khi dùng file này.

File này được tạo tự động từ `Tables.sql`. Input `Tables.sql` không có trong workspace hiện tại, vì vậy cần đối chiếu database đang deploy nếu thay đổi schema hoặc cần độ chính xác tuyệt đối.

## How to Add Notes

Khi tim hieu duoc y nghia cu the cua mot column, ghi chu theo convention sau:

**Buoc 1:** Trong bang, them marker `[1]`, `[2]`... vao cot Description:

```
| `iStatus` | tinyint | NOT NULL |  | Account status code [1] |
```

**Buoc 2:** Ngay ben duoi bang, them block **Notes** voi noi dung chi tiet:

```markdown
> **Notes**
>
> **[1] `iStatus`** - Trang thai tai khoan khach hang:
> - `0` = Inactive
> - `1` = Active
> - `2` = Locked (bi khoa sau qua nhieu lan dang nhap sai)
>
> Xem them: SP `UBClientLogin_Validate`, screen `PopupSetupDealer.aspx`
```

**Quy tac:**
- Marker `[N]` danh so tu `1` cho moi bang (reset moi bang)
- Ghi chu ngan: sua truc tiep cot Description (khong can marker)
- Ghi chu dai (enum values, tham chieu SP/screen, giai thich logic): dung marker + Notes block
- Co the them link den file doc khac: `Xem [fundserv-order-flow.md](../business-logic-topics/fundserv-order-flow.md)`
## Naming Conventions

### Table Prefixes
| Prefix | Meaning |
|--------|---------|
| `UB_` | **VieFUND Core** - Main business tables (>93% of all tables) |
| `AAA` | **Development/Testing** - Temporary tables for debugging |
| `Ag_` | **Agent Integration** - External system mapping |
| `AGRA_` | **AGRA Transfer** - Account transfer management |
| `VF_` | **VieFUND App** - Application-specific tables |

### Column Prefixes (Hungarian Notation)
| Prefix | Type | Example |
|--------|------|---------|
| `i` | Integer/ID | `iClientID`, `iStatus` |
| `dt` | DateTime | `dtCreated`, `dtTrade` |
| `f` | Float/Decimal | `fPrice`, `fUnit` |
| `m` | Money/Amount | `mAmount` |
| `b` | Boolean/Bit | `bActive` |
| `s` | String | `sNote` |

### Table Suffix Patterns
| Suffix | Meaning |
|--------|---------|
| `ARC` | Archive table - stores historical/archived records |
| `TMP` | Temporary table - used during data processing |
| `_SLP` | Slip data (tax slips like T4, T5, RL1, etc.) |
| `_TRX` | Transaction data associated with slips |
| `Def` | Definition/lookup table |
| `Detail` | Detail/line-item table (child of a header) |
| `SearchList` | Pre-computed search/listing cache |

---

## Table of Contents

1. [Address Data (2 tables)](#address-data)
2. [Agent/External System Integration (1 tables)](#agent-external-system-integration)
3. [AGRA Transfer Management (5 tables)](#agra-transfer-management)
4. [Transaction Confirmation (4 tables)](#transaction-confirmation)
5. [Fund Conversion (1 tables)](#fund-conversion)
6. [CRS/FATCA Reporting (10 tables)](#crs-fatca-reporting)
7. [Dealership Management (14 tables)](#dealership-management)
8. [Definition/Lookup Tables (286 tables)](#definition-lookup-tables)
9. [Development/Testing (6 tables)](#development-testing)
10. [FundServ Configuration (71 tables)](#fundserv-configuration)
11. [Fund Definition & Transactions (63 tables)](#fund-definition-transactions)
12. [GIA (Guaranteed Interest Account) (6 tables)](#gia-guaranteed-interest-account-)
13. [GIC (Guaranteed Investment Certificate) (14 tables)](#gic-guaranteed-investment-certificate-)
14. [Help System (1 tables)](#help-system)
15. [Identification Documents (1 tables)](#identification-documents)
16. [Insurance Products (4 tables)](#insurance-products)
17. [Intermediary Management (2 tables)](#intermediary-management)
18. [KYP (Know Your Product) Compliance (14 tables)](#kyp-know-your-product-compliance)
19. [LAP (Leveraged Asset Program) (3 tables)](#lap-leveraged-asset-program-)
20. [Loan Management (7 tables)](#loan-management)
21. [Logo Management (1 tables)](#logo-management)
22. [Member/Advisor Management (18 tables)](#member-advisor-management)
23. [MER (Management Expense Ratio) Reporting (6 tables)](#mer-management-expense-ratio-reporting)
24. [MFDA Compliance (29 tables)](#mfda-compliance)
25. [Management Company (2 tables)](#management-company)
26. [Message Queue (IBM MQ / FundServ Real-Time) (4 tables)](#message-queue-ibm-mq-fundserv-real-time-)
27. [NFU (Network Fund Update) via FundServ (3 tables)](#nfu-network-fund-update-via-fundserv)
28. [Notes/Comments (2 tables)](#notes-comments)
29. [Notification System (1 tables)](#notification-system)
30. [Onboarding (1 tables)](#onboarding)
31. [Order Processing (FundServ) (8 tables)](#order-processing-fundserv-)
32. [Person/Individual Data (2 tables)](#person-individual-data)
33. [Phone/Contact Data (2 tables)](#phone-contact-data)
34. [Investment Plan/Account Management (29 tables)](#investment-plan-account-management)
35. [Fund Price Data (34 tables)](#fund-price-data)
36. [Province/Region Lookup (1 tables)](#province-region-lookup)
37. [Redemption Schedule Processing (2 tables)](#redemption-schedule-processing)
38. [Representative/Advisor (25 tables)](#representative-advisor)
39. [RESP (Registered Education Savings Plan) (13 tables)](#resp-registered-education-savings-plan-)
40. [RRIF (Registered Retirement Income Fund) (15 tables)](#rrif-registered-retirement-income-fund-)
41. [RRSP (Registered Retirement Savings Plan) (6 tables)](#rrsp-registered-retirement-savings-plan-)
42. [Scheduled Processing (2 tables)](#scheduled-processing)
43. [Segregated Fund (1 tables)](#segregated-fund)
44. [Service Task Management (2 tables)](#service-task-management)
45. [Application Settings (1 tables)](#application-settings)
46. [Stock/ETF Management (2 tables)](#stock-etf-management)
47. [System Configuration & Sequences (19 tables)](#system-configuration-sequences)
48. [NR4 Non-Resident Tax (44 tables)](#nr4-non-resident-tax)
49. [Quebec Releve Tax Slip (19 tables)](#quebec-releve-tax-slip)
50. [TFSA (Tax-Free Savings Account) (5 tables)](#tfsa-tax-free-savings-account-)
51. [Trust Account Management (5 tables)](#trust-account-management)
52. [TS File Processing (FundServ) (3 tables)](#ts-file-processing-fundserv-)
53. [VieFUND Core (295 tables)](#viefund-core)
54. [UCI (Universal Client Identifier) (3 tables)](#uci-universal-client-identifier-)
55. [Uniformity Review (4 tables)](#uniformity-review)
56. [VieFUND Application (1 tables)](#viefund-application)
57. [View Settings (1 tables)](#view-settings)
58. [Web Client Portal (1 tables)](#web-client-portal)

---

## Address Data

### `UB_Address`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `Type` | smallint | NOT NULL |  |  |
| `LinkedID` | int | NOT NULL |  |  |
| `Line1` | varchar(140) | NULL |  |  |
| `Line2` | varchar(140) | NULL |  |  |
| `Line3` | varchar(140) | NULL |  |  |
| `City` | varchar(50) | NULL |  |  |
| `ProvinceCode` | varchar(3) | NULL |  |  |
| `CountryCode` | varchar(3) | NULL |  |  |
| `PostalCode` | varchar(12) | NULL |  |  |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `dtLastModified` | datetime | NULL |  | Timestamp when record was last modified |
| `iCreatedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `iLastModifiedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who last modified this record |

### `UB_AddressARC`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL |  | Primary key, auto-increment identifier |
| `Type` | smallint | NOT NULL |  |  |
| `LinkedID` | int | NOT NULL |  |  |
| `Line1` | varchar(140) | NULL |  |  |
| `Line2` | varchar(140) | NULL |  |  |
| `Line3` | varchar(140) | NULL |  |  |
| `City` | varchar(50) | NULL |  |  |
| `ProvinceCode` | varchar(3) | NULL |  |  |
| `CountryCode` | varchar(3) | NULL |  |  |
| `PostalCode` | varchar(12) | NULL |  |  |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `dtLastModified` | datetime | NULL |  | Timestamp when record was last modified |
| `iCreatedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `iLastModifiedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who last modified this record |
| `bDeleted` | tinyint | NULL |  |  |

---

## Agent/External System Integration

### `Ag_Client_VieFUND`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `VIEFUNDID` | int | NOT NULL |  |  |
| `AGEmanID` | int | NOT NULL |  |  |
| `FirstName` | varchar(40) | NULL |  | First name |
| `LastName` | varchar(80) | NULL |  | Last name |
| `Sex` | char(1) | NULL |  | Gender (M/F) |
| `MainPhone` | varchar(15) | NULL |  | Primary phone number |
| `dtDOB` | datetime | NULL |  | Date of birth |
| `SIN_BN` | varchar(15) | NULL |  | Social Insurance Number or Business Number (Canada) |

---

## AGRA Transfer Management

### `AGRA_TransferFund`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iHeaderID` | int | NULL |  | FK to parent header record |
| `iPlanID` | int | NULL |  | FK to UB_Plan table - identifies the investment plan/account |
| `iPosID` | int | NULL |  | FK to position record (fund holding) |
| `MgmtCode` | varchar(5) | NULL |  | Management company code |
| `FundID` | varchar(6) | NULL |  | Fund identifier code (e.g., DYN 3056) |
| `iFileIDOUT` | int | NULL |  | FK to file record (FundServ file) |
| `iStatusOUT` | tinyint | NULL |  | Status code (specific to this context) |
| `dtTrade` | datetime | NULL |  | Trade date |
| `fPrice` | float | NULL |  | Unit price of fund |
| `SourceID` | varchar(15) | NULL |  | Source identifier |
| `iFileIDIN` | int | NULL |  | FK to file record (FundServ file) |
| `iStatusIN` | tinyint | NULL |  | Status code (specific to this context) |
| `iType` | tinyint | NULL |  | Type/category code |
| `fUnit` | float | NULL |  | Number of units |

### `AGRA_TransferHeader`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iStatus` | tinyint | NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `iCreatedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `DealerCodeFrom` | varchar(4) | NULL |  | Dealer code identifier |
| `RepCodeFrom` | varchar(5) | NULL |  | Representative/advisor code |
| `DealerCodeTo` | varchar(4) | NULL |  | Dealer code identifier |
| `RepcodeTo` | varchar(4) | NULL |  | Representative/advisor code |

### `AGRA_TransferPlan`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iHeaderID` | int | NULL |  | FK to parent header record |
| `iPlanID` | int | NULL |  | FK to UB_Plan table - identifies the investment plan/account |
| `iStatus` | tinyint | NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `dtEffective` | datetime | NULL |  | Effective date |
| `iUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `DealerCodeFrom` | varchar(4) | NULL |  | Dealer code identifier |
| `RepCodeFrom` | varchar(5) | NULL |  | Representative/advisor code |
| `DealerCodeTo` | varchar(4) | NULL |  | Dealer code identifier |
| `RepCodeTo` | varchar(5) | NULL |  | Representative/advisor code |

### `AGRA_TS_ExportTask`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iHeaderID` | int | NULL |  | FK to parent header record |
| `iType` | tinyint | NULL |  | Type/category code |
| `iStatus` | tinyint | NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `DealerCode` | varchar(4) | NULL |  | Dealer code identifier |
| `MgmtCode` | varchar(4) | NULL |  | Management company code |
| `iSequence` | int | NULL |  | Sequence number |
| `dtEffective` | datetime | NULL |  | Effective date |
| `FileName` | varchar(80) | NULL |  | File name |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `iCreatedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `iMode` | tinyint | NULL |  | Processing mode |

### `AGRA_TS_ExportTaskDetail`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iTaskID` | int | NULL |  | Integer field |
| `iAGRA_TransferFundID` | int | NULL |  | Integer field |

---

## Transaction Confirmation

### `UB_TrxConfFileARC`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL |  | Primary key, auto-increment identifier |
| `iConfirmationID` | int | NULL |  | Integer field |
| `iStatus` | tinyint | NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `FileName` | varchar(50) | NULL |  | File name |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `DealerCode` | varchar(4) | NULL |  | Dealer code identifier |

### `UB_TrxConfFileWaiting`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iConfirmationID` | int | NULL |  | Integer field |
| `iStatus` | tinyint | NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `FileName` | varchar(50) | NULL |  | File name |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `DealerCode` | varchar(4) | NULL |  | Dealer code identifier |

### `UB_TrxConfirmation`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `iTrxID` | int | NOT NULL |  | Integer field |
| `iObjID` | int | NOT NULL |  | Integer field |
| `iClientID` | int | NULL |  | FK to UB_Client table - identifies the client/investor |

### `UB_TrxConfirmationClient`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iClientID` | int | NULL |  | FK to UB_Client table - identifies the client/investor |
| `iObjID` | int | NULL |  | Integer field |
| `iStatus` | tinyint | NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `iClientReviewed` | tinyint | NULL |  | Small integer/flag field |
| `dtClientReviewed` | datetime | NULL |  | Date/time field |
| `dtSent` | datetime | NULL |  | Date/time field |
| `iSentUserID` | int | NULL |  | Integer field |
| `iDeleted` | tinyint | NULL |  | Small integer/flag field |
| `iEmailOutBoxID` | int | NULL |  | Integer field |
| `iNotificationID` | int | NULL |  | Integer field |
| `iCreatedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `iLastModifiedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who last modified this record |
| `dtLastModified` | datetime | NULL |  | Timestamp when record was last modified |
| `iSequence` | int | NULL |  | Sequence number |

---

## Fund Conversion

### `UB_ConversionBulkBasket`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iStatus` | tinyint | NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `iFundAccountPosIDFrom` | int | NOT NULL |  | Integer field |
| `iBasketIDFrom` | int | NOT NULL |  | Integer field |
| `iFundAccountPosIDTo` | int | NULL |  | Integer field |
| `MgmtCodeTo` | varchar(5) | NOT NULL |  |  |
| `FundIDTo` | varchar(6) | NOT NULL |  |  |
| `iSplitBy` | tinyint | NOT NULL |  | Small integer/flag field |
| `mAmount` | money | NULL |  | Monetary amount |
| `fCLPaidCommRate` | float | NULL |  | Decimal/float value |
| `dtCompleted` | datetime | NULL |  | Date/time field |
| `iCreatedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `iSuitable` | tinyint | NULL |  | Small integer/flag field |
| `iRebateFundPosID` | int | NULL |  | Integer field |
| `mRebateAmount` | money | NULL |  |  |

---

## CRS/FATCA Reporting

### `UB_P18_SLP`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iYear` | int | NULL |  | Integer field |
| `iPlanID` | int | NULL |  | FK to UB_Plan table - identifies the investment plan/account |
| `iStatus` | tinyint | NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `iVoid` | tinyint | NULL |  | Small integer/flag field |
| `iVoidUserID` | int | NULL |  | Integer field |
| `dtVoid` | datetime | NULL |  | Date/time field |
| `Notes` | varchar(200) | NULL |  |  |
| `iPrinted` | tinyint | NULL |  | Small integer/flag field |
| `dtPrinted` | datetime | NULL |  | Date/time field |
| `iFileID` | int | NULL |  | FK to file record (FundServ file) |
| `iUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `slip_type_code` | char(1) | NULL |  |  |
| `iFlag` | tinyint | NULL |  | Small integer/flag field |
| `RefDocID` | varchar(34) | NULL |  |  |
| `RefDocIDOld` | varchar(34) | NULL |  |  |
| `AccountType` | char(2) | NULL |  |  |
| `ClientAccountNumber` | varchar(30) | NULL |  |  |
| `ClientAccountNumberTypeCode` | char(1) | NULL |  |  |
| `ClosedClientAccountIndicator` | char(1) | NULL |  |  |
| `mMKV` | money | NULL |  |  |
| `mDividend` | money | NULL |  |  |
| `mRedemption` | money | NULL |  |  |
| `mInterest` | money | NULL |  |  |
| `mOther` | money | NULL |  |  |
| `iMainHolderID` | int | NULL |  | Integer field |
| `iSummaryID` | int | NULL |  | Integer field |

### `UB_P18_SLP_ARC`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL |  | Primary key, auto-increment identifier |
| `iYear` | int | NULL |  | Integer field |
| `iPlanID` | int | NULL |  | FK to UB_Plan table - identifies the investment plan/account |
| `iStatus` | tinyint | NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `iVoid` | tinyint | NULL |  | Small integer/flag field |
| `iVoidUserID` | int | NULL |  | Integer field |
| `dtVoid` | datetime | NULL |  | Date/time field |
| `Notes` | varchar(200) | NULL |  |  |
| `iPrinted` | tinyint | NULL |  | Small integer/flag field |
| `dtPrinted` | datetime | NULL |  | Date/time field |
| `iFileID` | int | NULL |  | FK to file record (FundServ file) |
| `iUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `slip_type_code` | char(1) | NULL |  |  |
| `iFlag` | tinyint | NULL |  | Small integer/flag field |
| `RefDocID` | varchar(34) | NULL |  |  |
| `RefDocIDOld` | varchar(34) | NULL |  |  |
| `AccountType` | char(2) | NULL |  |  |
| `ClientAccountNumber` | varchar(30) | NULL |  |  |
| `ClientAccountNumberTypeCode` | char(1) | NULL |  |  |
| `ClosedClientAccountIndicator` | char(1) | NULL |  |  |
| `mMKV` | money | NULL |  |  |
| `mDividend` | money | NULL |  |  |
| `mRedemption` | money | NULL |  |  |
| `mInterest` | money | NULL |  |  |
| `mOther` | money | NULL |  |  |
| `iMainHolderID` | int | NULL |  | Integer field |
| `iSummaryID` | int | NULL |  | Integer field |

### `UB_P18_Summary`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iTaxYear` | int | NULL |  | Integer field |
| `slip_type_code` | char(1) | NULL |  |  |
| `RefDocID` | varchar(34) | NULL |  |  |
| `RefDocIDOld` | varchar(34) | NULL |  |  |
| `iSlipCount` | int | NULL |  | Integer field |
| `mMKV` | money | NULL |  |  |
| `mDividend` | money | NULL |  |  |
| `mRedemption` | money | NULL |  |  |
| `mInterest` | money | NULL |  |  |
| `mOther` | money | NULL |  |  |
| `iFileID` | int | NULL |  | FK to file record (FundServ file) |

### `UB_P18AcctHolder`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iSlipID` | int | NULL |  | Integer field |
| `iClientID` | int | NULL |  | FK to UB_Client table - identifies the client/investor |
| `TypeCode` | char(1) | NULL |  |  |
| `CountryCode` | char(2) | NULL |  |  |
| `TIN` | varchar(30) | NULL |  |  |
| `TINIssueCountryCode` | char(2) | NULL |  |  |
| `NoTINReasonCode` | char(1) | NULL |  |  |
| `TINType` | varchar(20) | NULL |  |  |
| `SIN_BN` | varchar(15) | NULL |  | Social Insurance Number or Business Number (Canada) |
| `FirstName` | varchar(80) | NULL |  | First name |
| `LastName` | varchar(80) | NULL |  | Last name |
| `dtDOB` | datetime | NULL |  | Date of birth |
| `OrganizationTypeCode` | varchar(6) | NULL |  |  |
| `AddressLine1Text` | varchar(30) | NULL |  |  |
| `AddressLine2Text` | varchar(30) | NULL |  |  |
| `AddressCity` | varchar(28) | NULL |  |  |
| `AddressProvince` | varchar(30) | NULL |  |  |
| `AddressCountryCode` | char(2) | NULL |  |  |
| `AddressPostalCode` | varchar(10) | NULL |  |  |

### `UB_P18ControllingPerson`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iType` | tinyint | NULL |  | Type/category code |
| `iLinkedID` | int | NULL |  | Integer field |
| `CountryCode` | char(2) | NULL |  |  |
| `TIN` | varchar(30) | NULL |  |  |
| `TINIssueCountryCode` | char(2) | NULL |  |  |
| `NoTINReasonCode` | char(1) | NULL |  |  |
| `TINType` | varchar(20) | NULL |  |  |
| `SIN` | varchar(9) | NULL |  |  |
| `FirstName` | varchar(80) | NULL |  | First name |
| `LastName` | varchar(80) | NULL |  | Last name |
| `AddressLine1Text` | varchar(30) | NULL |  |  |
| `AddressLine2Text` | varchar(30) | NULL |  |  |
| `AddressCity` | varchar(28) | NULL |  |  |
| `AddressProvince` | varchar(30) | NULL |  |  |
| `AddressCountryCode` | char(2) | NULL |  |  |
| `AddressPostalCode` | varchar(10) | NULL |  |  |
| `dtDOB` | datetime | NULL |  | Date of birth |
| `ControllingPersonType` | varchar(6) | NULL |  |  |

### `UB_P19_SLP`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iYear` | int | NULL |  | Integer field |
| `iPlanID` | int | NULL |  | FK to UB_Plan table - identifies the investment plan/account |
| `iStatus` | tinyint | NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `iVoid` | tinyint | NULL |  | Small integer/flag field |
| `iVoidUserID` | int | NULL |  | Integer field |
| `dtVoid` | datetime | NULL |  | Date/time field |
| `Notes` | varchar(200) | NULL |  |  |
| `iPrinted` | tinyint | NULL |  | Small integer/flag field |
| `dtPrinted` | datetime | NULL |  | Date/time field |
| `iFileID` | int | NULL |  | FK to file record (FundServ file) |
| `iUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `slip_type_code` | char(1) | NULL |  |  |
| `iFlag` | tinyint | NULL |  | Small integer/flag field |
| `RefDocID` | varchar(34) | NULL |  |  |
| `RefDocIDOld` | varchar(34) | NULL |  |  |
| `AccountType` | char(2) | NULL |  |  |
| `ClientAccountNumber` | varchar(30) | NULL |  |  |
| `ClientAccountNumberTypeCode` | varchar(7) | NULL |  |  |
| `ClosedClientAccountIndicator` | char(1) | NULL |  |  |
| `mMKV` | money | NULL |  |  |
| `mDividend` | money | NULL |  |  |
| `mRedemption` | money | NULL |  |  |
| `mInterest` | money | NULL |  |  |
| `mOther` | money | NULL |  |  |
| `iMainHolderID` | int | NULL |  | Integer field |
| `iSummaryID` | int | NULL |  | Integer field |
| `iUndocumented` | tinyint | NULL |  | Small integer/flag field |

### `UB_P19_SLP_ARC`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL |  | Primary key, auto-increment identifier |
| `iYear` | int | NULL |  | Integer field |
| `iPlanID` | int | NULL |  | FK to UB_Plan table - identifies the investment plan/account |
| `iStatus` | tinyint | NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `iVoid` | tinyint | NULL |  | Small integer/flag field |
| `iVoidUserID` | int | NULL |  | Integer field |
| `dtVoid` | datetime | NULL |  | Date/time field |
| `Notes` | varchar(200) | NULL |  |  |
| `iPrinted` | tinyint | NULL |  | Small integer/flag field |
| `dtPrinted` | datetime | NULL |  | Date/time field |
| `iFileID` | int | NULL |  | FK to file record (FundServ file) |
| `iUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `slip_type_code` | char(1) | NULL |  |  |
| `iFlag` | tinyint | NULL |  | Small integer/flag field |
| `RefDocID` | varchar(34) | NULL |  |  |
| `RefDocIDOld` | varchar(34) | NULL |  |  |
| `AccountType` | char(2) | NULL |  |  |
| `ClientAccountNumber` | varchar(30) | NULL |  |  |
| `ClientAccountNumberTypeCode` | varchar(7) | NULL |  |  |
| `ClosedClientAccountIndicator` | char(1) | NULL |  |  |
| `mMKV` | money | NULL |  |  |
| `mDividend` | money | NULL |  |  |
| `mRedemption` | money | NULL |  |  |
| `mInterest` | money | NULL |  |  |
| `mOther` | money | NULL |  |  |
| `iMainHolderID` | int | NULL |  | Integer field |
| `iSummaryID` | int | NULL |  | Integer field |
| `iUndocumented` | tinyint | NULL |  | Small integer/flag field |

### `UB_P19_Summary`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iTaxYear` | int | NULL |  | Integer field |
| `slip_type_code` | char(1) | NULL |  |  |
| `RefDocID` | varchar(34) | NULL |  |  |
| `RefDocIDOld` | varchar(34) | NULL |  |  |
| `iSlipCount` | int | NULL |  | Integer field |
| `mMKV` | money | NULL |  |  |
| `mDividend` | money | NULL |  |  |
| `mRedemption` | money | NULL |  |  |
| `mInterest` | money | NULL |  |  |
| `mOther` | money | NULL |  |  |
| `iFileID` | int | NULL |  | FK to file record (FundServ file) |

### `UB_P19AcctHolder`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iSlipID` | int | NULL |  | Integer field |
| `iClientID` | int | NULL |  | FK to UB_Client table - identifies the client/investor |
| `TypeCode` | char(1) | NULL |  |  |
| `CountryCode` | char(2) | NULL |  |  |
| `TIN` | varchar(30) | NULL |  |  |
| `TINIssueCountryCode` | char(2) | NULL |  |  |
| `NoTINReasonCode` | char(1) | NULL |  |  |
| `TINType` | varchar(20) | NULL |  |  |
| `SIN_BN` | varchar(15) | NULL |  | Social Insurance Number or Business Number (Canada) |
| `FirstName` | varchar(80) | NULL |  | First name |
| `LastName` | varchar(80) | NULL |  | Last name |
| `dtDOB` | datetime | NULL |  | Date of birth |
| `OrganizationTypeCode` | varchar(6) | NULL |  |  |
| `AddressLine1Text` | varchar(30) | NULL |  |  |
| `AddressLine2Text` | varchar(30) | NULL |  |  |
| `AddressCity` | varchar(28) | NULL |  |  |
| `AddressProvince` | varchar(30) | NULL |  |  |
| `AddressCountryCode` | char(2) | NULL |  |  |
| `AddressPostalCode` | varchar(10) | NULL |  |  |

### `UB_P19ControllingPerson`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iType` | tinyint | NULL |  | Type/category code |
| `iLinkedID` | int | NULL |  | Integer field |
| `CountryCode` | char(2) | NULL |  |  |
| `TIN` | varchar(30) | NULL |  |  |
| `TINIssueCountryCode` | char(2) | NULL |  |  |
| `NoTINReasonCode` | char(1) | NULL |  |  |
| `TINType` | varchar(20) | NULL |  |  |
| `SIN` | varchar(9) | NULL |  |  |
| `FirstName` | varchar(80) | NULL |  | First name |
| `LastName` | varchar(80) | NULL |  | Last name |
| `AddressLine1Text` | varchar(30) | NULL |  |  |
| `AddressLine2Text` | varchar(30) | NULL |  |  |
| `AddressCity` | varchar(28) | NULL |  |  |
| `AddressProvince` | varchar(30) | NULL |  |  |
| `AddressCountryCode` | char(2) | NULL |  |  |
| `AddressPostalCode` | varchar(10) | NULL |  |  |
| `dtDOB` | datetime | NULL |  | Date of birth |
| `ControllingPersonType` | varchar(6) | NULL |  |  |

---

## Dealership Management

### `UB_DealerBankAccount`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `Code` | varchar(5) | NOT NULL |  |  |
| `BranchID` | int | NOT NULL |  |  |
| `AccountNumber` | varchar(40) | NOT NULL |  |  |
| `CurrencyCode` | varchar(3) | NULL |  |  |
| `AccountType` | char(1) | NULL |  |  |
| `iStatus` | smallint | NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `Description` | varchar(80) | NULL |  |  |
| `bAllPurpose` | tinyint | NOT NULL |  |  |
| `bClientDeposit` | tinyint | NOT NULL |  |  |
| `bPayoutClient` | tinyint | NOT NULL |  |  |
| `bPayoutRep` | tinyint | NOT NULL |  |  |
| `bSD` | tinyint | NOT NULL |  |  |
| `bNonSDNotAllow` | tinyint | NOT NULL |  |  |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `iCreatedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `dtLastModified` | datetime | NULL |  | Timestamp when record was last modified |
| `iLastModifiedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who last modified this record |
| `mBalanceSettled` | money | NULL |  |  |
| `dtBalanceSettled` | datetime | NULL |  | Date/time field |
| `mBalance` | money | NULL |  |  |
| `dtBalance` | datetime | NULL |  | Date/time field |
| `iLastChequeNumber` | int | NOT NULL |  | Integer field |
| `OriginatorID` | varchar(10) | NULL |  |  |
| `DataCenterID` | varchar(5) | NULL |  |  |
| `OriginatorNameShort` | varchar(15) | NULL |  |  |
| `OriginatorNameLong` | varchar(30) | NULL |  |  |
| `EFTFilePath` | varchar(250) | NULL |  |  |
| `iEFTFileSequence` | int | NULL |  | Integer field |
| `DealerCode` | varchar(5) | NULL |  | Dealer code identifier |
| `iEFTFormat` | tinyint | NULL |  | Small integer/flag field |
| `iEFTRouting` | tinyint | NULL |  | Small integer/flag field |
| `OriginatorID2` | varchar(10) | NULL |  |  |
| `BankCode` | varchar(5) | NULL |  |  |
| `TransitNumber` | varchar(10) | NULL |  |  |
| `iFlag` | tinyint | NULL |  | Small integer/flag field |

### `UB_DealerBankAccountTrx`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iBankAccID` | int | NOT NULL |  | Integer field |
| `dtEffective` | datetime | NOT NULL |  | Effective date |
| `TrxDescription` | varchar(80) | NOT NULL |  |  |
| `mWithdrawal` | money | NOT NULL |  |  |
| `mDeposit` | money | NOT NULL |  |  |
| `mBalance` | money | NOT NULL |  |  |
| `dtCreated` | datetime | NOT NULL |  | Timestamp when record was created |
| `iLinkedID1` | int | NOT NULL |  | Integer field |
| `iLinkedID2` | int | NOT NULL |  | Integer field |
| `iStatus` | tinyint | NOT NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |

### `UB_DealerBranch`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iDealershipID` | int | NULL |  | Integer field |
| `Code` | varchar(6) | NULL |  |  |
| `NameEN` | varchar(50) | NULL |  | English name |
| `NameFR` | varchar(50) | NULL |  | French name |
| `iAddressID` | int | NULL |  | Integer field |
| `iPhoneID` | int | NULL |  | Integer field |
| `iRegionID` | int | NULL |  | Integer field |
| `iManagerID` | int | NULL |  | Integer field |
| `iSubstituteID` | int | NULL |  | Integer field |
| `iComplianceDeployed` | tinyint | NULL |  | Small integer/flag field |
| `Website` | varchar(255) | NULL |  |  |
| `Notes` | varchar(max) | NULL |  |  |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `dtLastModified` | datetime | NULL |  | Timestamp when record was last modified |
| `iCreatedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `iLastModifiedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who last modified this record |
| `iStatus` | tinyint | NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `iSubstituteID2` | int | NULL |  | Integer field |
| `iSubstituteID3` | int | NULL |  | Integer field |
| `iSubstituteID4` | int | NULL |  | Integer field |
| `iSubstituteID5` | int | NULL |  | Integer field |

### `UB_DealerBranchARC`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL |  | Primary key, auto-increment identifier |
| `iDealershipID` | int | NULL |  | Integer field |
| `Code` | varchar(6) | NULL |  |  |
| `NameEN` | varchar(50) | NULL |  | English name |
| `NameFR` | varchar(50) | NULL |  | French name |
| `iAddressID` | int | NULL |  | Integer field |
| `iPhoneID` | int | NULL |  | Integer field |
| `iRegionID` | int | NULL |  | Integer field |
| `iManagerID` | int | NULL |  | Integer field |
| `bDeleted` | tinyint | NULL |  |  |
| `iSubstituteID` | int | NULL |  | Integer field |
| `iComplianceDeployed` | tinyint | NULL |  | Small integer/flag field |
| `Website` | varchar(255) | NULL |  |  |
| `Notes` | varchar(max) | NULL |  |  |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `dtLastModified` | datetime | NULL |  | Timestamp when record was last modified |
| `iCreatedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `iLastModifiedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who last modified this record |
| `iStatus` | tinyint | NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `iSubstituteID2` | int | NULL |  | Integer field |
| `iSubstituteID3` | int | NULL |  | Integer field |
| `iSubstituteID4` | int | NULL |  | Integer field |
| `iSubstituteID5` | int | NULL |  | Integer field |

### `UB_DealerCode`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iDealershipID` | int | NOT NULL |  | Integer field |
| `Code` | varchar(6) | NOT NULL |  |  |
| `bRealTime` | tinyint | NOT NULL |  |  |
| `Description` | varchar(80) | NULL |  |  |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `dtLastModified` | datetime | NULL |  | Timestamp when record was last modified |
| `iCreatedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `iLastModifiedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who last modified this record |
| `bMF` | tinyint | NULL |  |  |
| `bGIC` | tinyint | NULL |  |  |
| `bSF` | tinyint | NULL |  |  |
| `bHF` | tinyint | NULL |  |  |
| `bPF` | tinyint | NULL |  |  |
| `bLS` | tinyint | NULL |  |  |
| `bLP` | tinyint | NULL |  |  |
| `bSN` | tinyint | NULL |  |  |
| `bLN` | tinyint | NULL |  |  |
| `bWP` | tinyint | NULL |  |  |
| `bOther` | tinyint | NULL |  |  |
| `bSD` | tinyint | NULL |  |  |
| `iCommThresholdType` | tinyint | NOT NULL |  | Small integer/flag field |
| `bOffBook` | tinyint | NULL |  |  |
| `iOrder` | tinyint | NULL |  | Small integer/flag field |
| `bExempt` | tinyint | NULL |  |  |
| `iExcludeCompensation` | tinyint | NULL |  | Small integer/flag field |
| `iExcludeReportRep` | tinyint | NULL |  | Small integer/flag field |
| `iExcludeReportAdmin` | tinyint | NULL |  | Small integer/flag field |
| `iFeeAUAExclude` | tinyint | NULL |  | Small integer/flag field |
| `iExcludePerformance` | tinyint | NULL |  | Small integer/flag field |
| `T4A_ReportBox` | varchar(3) | NULL |  |  |
| `T4A_061` | varchar(15) | NULL |  |  |
| `RL1_ReportBox` | char(1) | NULL |  |  |
| `DescriptionFR` | varchar(80) | NULL |  |  |
| `CRACode` | varchar(6) | NULL |  |  |
| `NomineeCode` | varchar(6) | NULL |  |  |
| `iOmnibusOpt` | tinyint | NULL |  | Small integer/flag field |
| `CarryingDealerCode` | varchar(5) | NULL |  | Dealer code identifier |
| `CRACodeP` | varchar(6) | NULL |  |  |
| `CRASpecimenRSP` | varchar(20) | NULL |  |  |
| `CRASpecimenRIF` | varchar(20) | NULL |  |  |
| `CRASpecimenTFSA` | varchar(20) | NULL |  |  |
| `QCSpecimenRSP` | varchar(20) | NULL |  |  |
| `QCSpecimenRIF` | varchar(20) | NULL |  |  |
| `CRASpecimenNR` | varchar(20) | NULL |  |  |
| `iAddressID` | int | NULL |  | Integer field |
| `iPhoneID` | int | NULL |  | Integer field |
| `ContactInfo` | varchar(100) | NULL |  |  |
| `iExcludeMFDALogo` | tinyint | NULL |  | Small integer/flag field |
| `iPACAWDOpt` | tinyint | NULL |  | Small integer/flag field |
| `iNetInvestedOpt` | tinyint | NULL |  | Small integer/flag field |
| `iFlag` | int | NULL |  | Integer field |
| `LEI` | varchar(20) | NULL |  |  |
| `bAlternative` | tinyint | NULL |  |  |
| `bETF` | tinyint | NULL |  |  |
| `bExemptProduct` | tinyint | NULL |  |  |
| `ClientSummaryDescriptionEN` | varchar(50) | NULL |  |  |
| `ClientSummaryDescriptionFR` | varchar(50) | NULL |  |  |

### `UB_DealerGroupDetail`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `iGroupID` | int | NULL |  | Integer field |
| `DealerCode` | varchar(5) | NULL |  | Dealer code identifier |

### `UB_DealerRegion`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iDealershipID` | int | NULL |  | Integer field |
| `NameEN` | varchar(50) | NULL |  | English name |
| `NameFR` | varchar(50) | NULL |  | French name |
| `VPName` | varchar(50) | NULL |  |  |
| `Notes` | text | NULL |  |  |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `dtLastModified` | datetime | NULL |  | Timestamp when record was last modified |
| `iCreatedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `iLastModifiedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who last modified this record |

### `UB_Dealership`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL |  | Primary key, auto-increment identifier |
| `NameEN` | varchar(200) | NULL |  | English name |
| `NameFR` | varchar(200) | NULL |  | French name |
| `bNSM` | tinyint | NULL |  |  |
| `iMember` | tinyint | NULL |  | Small integer/flag field |
| `Website` | varchar(255) | NULL |  |  |
| `iAddressID` | int | NULL |  | Integer field |
| `iPhoneID` | int | NULL |  | Integer field |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `dtLastModified` | datetime | NULL |  | Timestamp when record was last modified |
| `iCreatedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `iLastModifiedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who last modified this record |
| `dtStart` | datetime | NULL |  | Date/time field |
| `dtStop` | datetime | NULL |  | Date/time field |
| `iLicenseType` | smallint | NULL |  |  |
| `KeyStr` | varchar(200) | NULL |  |  |
| `iLevel` | tinyint | NULL |  | Small integer/flag field |
| `SmtpServer` | varchar(100) | NULL |  |  |
| `SmtpUser` | varchar(100) | NULL |  |  |
| `SmtpPW` | varchar(400) | NULL |  |  |
| `iSmtpPort` | int | NOT NULL |  | Integer field |
| `bTrust` | tinyint | NULL |  |  |
| `iLockAddress4Rep` | tinyint | NULL |  | Small integer/flag field |
| `iAnnualIncomeValue` | tinyint | NULL |  | Small integer/flag field |
| `iWebClientVersion` | tinyint | NULL |  | Small integer/flag field |
| `iSmtpSSL` | tinyint | NULL |  | Small integer/flag field |
| `bCANNEX` | tinyint | NULL |  |  |
| `bGICServ` | tinyint | NULL |  |  |
| `bReportInception` | tinyint | NULL |  |  |
| `dtReportInception` | datetime | NULL |  | Date/time field |
| `EmailAddressComp` | varchar(100) | NULL |  |  |
| `T4A_061` | varchar(15) | NULL |  |  |
| `T4A_ReportBox` | char(3) | NULL |  |  |
| `iWebClientFlag` | int | NULL |  | Integer field |
| `bReportInceptionAdhoc` | tinyint | NULL |  |  |
| `dtReportInceptionAdhoc` | datetime | NULL |  | Date/time field |
| `iInvestmentObjOpt` | tinyint | NULL |  | Small integer/flag field |
| `DocFilePath` | varchar(400) | NULL |  |  |
| `DocFileUserID` | varchar(80) | NULL |  |  |
| `DocFilePW` | varchar(80) | NULL |  |  |
| `DocFileDomainName` | varchar(80) | NULL |  |  |
| `bRESPNominee` | tinyint | NULL |  |  |
| `bUseMailingAddress` | tinyint | NULL |  |  |
| `bTest` | tinyint | NULL |  |  |
| `iRIFFlag` | int | NULL |  | Integer field |

### `UB_DealershipARC`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL |  | Primary key, auto-increment identifier |
| `NameEN` | varchar(200) | NULL |  | English name |
| `NameFR` | varchar(200) | NULL |  | French name |
| `bNSM` | tinyint | NULL |  |  |
| `iMember` | tinyint | NULL |  | Small integer/flag field |
| `Website` | varchar(255) | NULL |  |  |
| `iAddressID` | int | NULL |  | Integer field |
| `iPhoneID` | int | NULL |  | Integer field |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `dtLastModified` | datetime | NULL |  | Timestamp when record was last modified |
| `iCreatedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `iLastModifiedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who last modified this record |
| `dtStart` | datetime | NULL |  | Date/time field |
| `dtStop` | datetime | NULL |  | Date/time field |
| `iLicenseType` | smallint | NULL |  |  |
| `KeyStr` | varchar(200) | NULL |  |  |
| `iLevel` | tinyint | NULL |  | Small integer/flag field |
| `SmtpServer` | varchar(100) | NULL |  |  |
| `SmtpUser` | varchar(100) | NULL |  |  |
| `SmtpPW` | varchar(400) | NULL |  |  |
| `iSmtpPort` | int | NOT NULL |  | Integer field |
| `bTrust` | tinyint | NULL |  |  |
| `iLockAddress4Rep` | tinyint | NULL |  | Small integer/flag field |
| `iAnnualIncomeValue` | tinyint | NULL |  | Small integer/flag field |
| `iWebClientVersion` | tinyint | NULL |  | Small integer/flag field |
| `iSmtpSSL` | tinyint | NULL |  | Small integer/flag field |
| `bCANNEX` | tinyint | NULL |  |  |
| `bGICServ` | tinyint | NULL |  |  |
| `bReportInception` | tinyint | NULL |  |  |
| `dtReportInception` | datetime | NULL |  | Date/time field |
| `EmailAddressComp` | varchar(100) | NULL |  |  |
| `T4A_061` | varchar(15) | NULL |  |  |
| `T4A_ReportBox` | char(3) | NULL |  |  |
| `iWebClientFlag` | int | NULL |  | Integer field |
| `bReportInceptionAdhoc` | tinyint | NULL |  |  |
| `dtReportInceptionAdhoc` | datetime | NULL |  | Date/time field |
| `iInvestmentObjOpt` | tinyint | NULL |  | Small integer/flag field |

### `UB_DealershipEmailExtra`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `SmtpServer` | varchar(100) | NULL |  |  |
| `SmtpUser` | varchar(100) | NULL |  |  |
| `SmtpPW` | varchar(400) | NULL |  |  |
| `iSmtpPort` | int | NULL |  | Integer field |
| `iSmtpSSL` | tinyint | NULL |  | Small integer/flag field |
| `Notes` | varchar(80) | NULL |  |  |
| `iPrimaryPurpose` | tinyint | NULL |  | Small integer/flag field |
| `FromName` | varchar(100) | NULL |  |  |
| `FromEmail` | varchar(100) | NULL |  |  |
| `iFromEmailEnforced` | tinyint | NULL |  | Small integer/flag field |

### `UB_DealershipLookup`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `Name` | varchar(50) | NULL |  |  |
| `bWinfund` | tinyint | NULL |  |  |
| `bRPM` | tinyint | NULL |  |  |
| `bURISK` | tinyint | NULL |  |  |
| `Flag1` | char(1) | NULL |  |  |
| `Flag2` | char(1) | NULL |  |  |
| `DealerNameEN` | varchar(200) | NULL |  |  |
| `DealerNameFR` | varchar(200) | NULL |  |  |
| `bNSM` | tinyint | NULL |  |  |
| `DealerCodes` | varchar(100) | NULL |  | Dealer code identifier |
| `bCCB` | tinyint | NULL |  |  |
| `bAxis` | tinyint | NULL |  |  |
| `bVieFUND` | tinyint | NULL |  |  |
| `Currency` | varchar(10) | NULL |  |  |

### `UB_DealerSubBranch`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iDealershipID` | int | NULL |  | Integer field |
| `iDealerBranchID` | int | NULL |  | Integer field |
| `Code` | varchar(6) | NULL |  |  |
| `NameEN` | varchar(50) | NULL |  | English name |
| `NameFR` | varchar(50) | NULL |  | French name |
| `iAddressID` | int | NULL |  | Integer field |
| `iPhoneID` | int | NULL |  | Integer field |
| `iRegionID` | int | NULL |  | Integer field |
| `iManagerID` | int | NULL |  | Integer field |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `dtLastModified` | datetime | NULL |  | Timestamp when record was last modified |
| `iCreatedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `iLastModifiedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who last modified this record |
| `Notes` | varchar(400) | NULL |  |  |

### `UB_DealerSubBranchARC`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL |  | Primary key, auto-increment identifier |
| `iDealershipID` | int | NULL |  | Integer field |
| `iDealerBranchID` | int | NULL |  | Integer field |
| `Code` | varchar(6) | NULL |  |  |
| `NameEN` | varchar(50) | NULL |  | English name |
| `NameFR` | varchar(50) | NULL |  | French name |
| `iAddressID` | int | NULL |  | Integer field |
| `iPhoneID` | int | NULL |  | Integer field |
| `iRegionID` | int | NULL |  | Integer field |
| `iManagerID` | int | NULL |  | Integer field |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `dtLastModified` | datetime | NULL |  | Timestamp when record was last modified |
| `iCreatedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `iLastModifiedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who last modified this record |
| `Notes` | varchar(400) | NULL |  |  |
| `bDeleted` | tinyint | NULL |  |  |

### `UB_DealerTwilio`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `ServiceName` | varchar(100) | NULL |  |  |
| `AccountServiceID` | varchar(100) | NULL |  |  |
| `AccessToken` | varchar(max) | NULL |  |  |
| `TwilioPhoneNumber` | varchar(30) | NULL |  |  |
| `MSG_EN` | varchar(max) | NULL |  |  |
| `MSG_FR` | varchar(max) | NULL |  |  |

---

## Definition/Lookup Tables

### `UB_Def_AccountAddressCode`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | smallint | NOT NULL |  | Primary key, auto-increment identifier |
| `FSCode` | char(1) | NOT NULL |  |  |
| `NameEN` | varchar(80) | NULL |  | English name |
| `NameFR` | varchar(80) | NULL |  | French name |
| `iOrder` | smallint | NULL |  |  |

### `UB_Def_AccountDesignation`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | smallint | NOT NULL |  | Primary key, auto-increment identifier |
| `FSCode` | char(1) | NOT NULL |  |  |
| `NameEN` | varchar(50) | NULL |  | English name |
| `NameFR` | varchar(50) | NULL |  | French name |
| `iOrder` | smallint | NULL |  |  |

### `UB_Def_AccountGroupFlag`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | smallint | NOT NULL |  | Primary key, auto-increment identifier |
| `FSCode` | char(1) | NOT NULL |  |  |
| `NameEN` | varchar(80) | NULL |  | English name |
| `NameFR` | varchar(80) | NULL |  | French name |
| `iOrder` | smallint | NULL |  |  |

### `UB_Def_AccountJointSurvivorType`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | smallint | NOT NULL |  | Primary key, auto-increment identifier |
| `FSCode` | char(1) | NOT NULL |  |  |
| `NameEN` | varchar(80) | NULL |  | English name |
| `NameFR` | varchar(80) | NULL |  | French name |
| `iOrder` | smallint | NULL |  |  |

### `UB_Def_AccountRecipientCode`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | smallint | NOT NULL |  | Primary key, auto-increment identifier |
| `FSCode` | char(1) | NOT NULL |  |  |
| `NameEN` | varchar(120) | NULL |  | English name |
| `NameFR` | varchar(120) | NULL |  | French name |
| `iOrder` | smallint | NULL |  |  |

### `UB_Def_AccountStatus`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | smallint | NOT NULL |  | Primary key, auto-increment identifier |
| `FSCode` | char(1) | NOT NULL |  |  |
| `NameEN` | varchar(30) | NULL |  | English name |
| `NameFR` | varchar(30) | NULL |  | French name |
| `iOrder` | smallint | NULL |  |  |

### `UB_Def_AccountSystematicDestination`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | smallint | NOT NULL |  | Primary key, auto-increment identifier |
| `NameEN` | varchar(50) | NULL |  | English name |
| `NameFR` | varchar(50) | NULL |  | French name |
| `iOrder` | smallint | NULL |  |  |

### `UB_Def_AccountSystematicFrequency`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | smallint | NOT NULL |  | Primary key, auto-increment identifier |
| `FSCode` | char(1) | NOT NULL |  |  |
| `NameEN` | varchar(40) | NULL |  | English name |
| `NameFR` | varchar(40) | NULL |  | French name |
| `iOrder` | smallint | NULL |  |  |

### `UB_Def_AccountSystematicIndicator`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | smallint | NOT NULL |  | Primary key, auto-increment identifier |
| `FSCode` | char(1) | NOT NULL |  |  |
| `NameEN` | varchar(120) | NULL |  | English name |
| `NameFR` | varchar(120) | NULL |  | French name |
| `iOrder` | smallint | NULL |  |  |

### `UB_Def_AccountType`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | smallint | NOT NULL |  | Primary key, auto-increment identifier |
| `FSCode` | char(2) | NOT NULL |  |  |
| `SymbolEN` | varchar(30) | NULL |  |  |
| `SymbolFR` | varchar(30) | NULL |  |  |
| `NameEN` | varchar(80) | NULL |  | English name |
| `NameFR` | varchar(80) | NULL |  | French name |
| `iOrder` | smallint | NULL |  |  |
| `iGroup` | tinyint | NULL |  | Small integer/flag field |
| `iLockedIn` | tinyint | NULL |  | Small integer/flag field |
| `iSpousal` | tinyint | NULL |  | Small integer/flag field |
| `iInTrust` | tinyint | NULL |  | Small integer/flag field |
| `CANNEX` | varchar(4) | NULL |  |  |

### `UB_Def_AccountTypeDetail`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | smallint | NOT NULL |  | Primary key, auto-increment identifier |
| `FSCode` | char(1) | NOT NULL |  |  |
| `NameEN` | varchar(80) | NULL |  | English name |
| `NameFR` | varchar(80) | NULL |  | French name |
| `iOrder` | smallint | NULL |  |  |

### `UB_Def_AddressType`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | smallint | NOT NULL |  | Primary key, auto-increment identifier |
| `NameEN` | varchar(50) | NULL |  | English name |
| `NameFR` | varchar(50) | NULL |  | French name |
| `iOrder` | smallint | NULL |  |  |

### `UB_Def_AppExport`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | smallint | NOT NULL |  | Primary key, auto-increment identifier |
| `NameEN` | varchar(80) | NULL |  | English name |
| `NameFR` | varchar(80) | NULL |  | French name |
| `iOrder` | smallint | NULL |  |  |
| `URL` | varchar(200) | NULL |  |  |
| `CUID` | varchar(200) | NULL |  |  |
| `iLicensed` | tinyint | NULL |  | Small integer/flag field |
| `returnURL` | varchar(200) | NULL |  |  |
| `CertStr` | varchar(max) | NULL |  |  |
| `CertPW` | varchar(100) | NULL |  |  |
| `Issuer` | varchar(200) | NULL |  |  |
| `Audience` | varchar(200) | NULL |  |  |
| `CertFileName` | varchar(255) | NULL |  |  |
| `bSign` | tinyint | NULL |  |  |
| `CertFileNamePub` | varchar(255) | NULL |  |  |
| `CertFileNamePriv` | varchar(255) | NULL |  |  |

### `UB_Def_AppType`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | smallint | NOT NULL |  | Primary key, auto-increment identifier |
| `NameEN` | varchar(30) | NULL |  | English name |
| `NameFR` | varchar(30) | NULL |  | French name |
| `iOrder` | smallint | NULL |  |  |

### `UB_Def_AttachmentDescription`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `Description` | varchar(200) | NULL |  |  |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `iUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `Lg` | tinyint | NULL |  |  |

### `UB_Def_AttachmentType`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | smallint | NOT NULL |  | Primary key, auto-increment identifier |
| `NameEN` | varchar(80) | NULL |  | English name |
| `NameFR` | varchar(80) | NULL |  | French name |
| `iOrder` | smallint | NULL |  |  |

### `UB_Def_AUAChangeGroup`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | smallint | NOT NULL |  | Primary key, auto-increment identifier |
| `NameEN` | varchar(50) | NULL |  | English name |
| `NameFR` | varchar(50) | NULL |  | French name |
| `iFrom` | int | NULL |  | Integer field |
| `iTo` | int | NULL |  | Integer field |
| `ColorStr` | varchar(30) | NULL |  |  |
| `iOrder` | smallint | NULL |  |  |

### `UB_Def_BankAccType`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | smallint | NOT NULL |  | Primary key, auto-increment identifier |
| `FSCode` | char(1) | NOT NULL |  |  |
| `NameEN` | varchar(40) | NULL |  | English name |
| `NameFR` | varchar(40) | NULL |  | French name |
| `iOrder` | smallint | NULL |  |  |

### `UB_Def_BankTrxStatus`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | smallint | NOT NULL |  | Primary key, auto-increment identifier |
| `NameEN` | varchar(30) | NOT NULL |  | English name |
| `NameFR` | varchar(30) | NOT NULL |  | French name |
| `iOrder` | tinyint | NOT NULL |  | Small integer/flag field |

### `UB_Def_BenRecordType`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | smallint | NOT NULL |  | Primary key, auto-increment identifier |
| `NameEN` | varchar(50) | NULL |  | English name |
| `NameFR` | varchar(50) | NULL |  | French name |
| `iOrder` | smallint | NULL |  |  |

### `UB_Def_BenType`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | smallint | NOT NULL |  | Primary key, auto-increment identifier |
| `FSCode` | char(1) | NULL |  |  |
| `NameEN` | varchar(40) | NULL |  | English name |
| `NameFR` | varchar(40) | NULL |  | French name |
| `iOrder` | smallint | NULL |  |  |

### `UB_Def_BulkSwitchBasketStatus`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | smallint | NOT NULL |  | Primary key, auto-increment identifier |
| `NameEN` | varchar(50) | NULL |  | English name |
| `NameFR` | varchar(50) | NULL |  | French name |
| `iOrder` | smallint | NULL |  |  |

### `UB_Def_BusinessType`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | smallint | NOT NULL |  | Primary key, auto-increment identifier |
| `FSCode` | varchar(2) | NOT NULL |  |  |
| `NameEN` | varchar(80) | NULL |  | English name |
| `NameFR` | varchar(80) | NULL |  | French name |
| `iOrder` | smallint | NULL |  |  |

### `UB_Def_CertificateInd`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | tinyint | NOT NULL |  | Primary key, auto-increment identifier |
| `FSCode` | char(1) | NOT NULL |  |  |
| `NameEN` | varchar(40) | NULL |  | English name |
| `NameFR` | varchar(40) | NULL |  | French name |
| `iOrder` | tinyint | NULL |  | Small integer/flag field |

### `UB_Def_ChequeStatus`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | smallint | NOT NULL |  | Primary key, auto-increment identifier |
| `NameEN` | varchar(50) | NULL |  | English name |
| `NameFR` | varchar(50) | NULL |  | French name |
| `iOrder` | smallint | NULL |  |  |

### `UB_Def_ClientAssetGroup`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | smallint | NOT NULL |  | Primary key, auto-increment identifier |
| `NameEN` | varchar(50) | NULL |  | English name |
| `NameFR` | varchar(50) | NULL |  | French name |
| `iFrom` | int | NULL |  | Integer field |
| `iTo` | int | NULL |  | Integer field |
| `iOrder` | smallint | NULL |  |  |

### `UB_Def_ClientImport`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `FieldName` | varchar(80) | NOT NULL |  | Field name reference |
| `SPParamName` | varchar(50) | NULL |  |  |

### `UB_Def_ClientRating`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | smallint | NOT NULL |  | Primary key, auto-increment identifier |
| `NameEN` | varchar(40) | NULL |  | English name |
| `NameFR` | varchar(40) | NULL |  | French name |
| `iOrder` | smallint | NULL |  |  |

### `UB_Def_ClientRepRelationshipLength`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | smallint | NOT NULL |  | Primary key, auto-increment identifier |
| `NameEN` | varchar(50) | NULL |  | English name |
| `NameFR` | varchar(50) | NULL |  | French name |
| `iOrder` | smallint | NULL |  |  |

### `UB_Def_ClientRepRelationshipSource`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | smallint | NOT NULL |  | Primary key, auto-increment identifier |
| `NameEN` | varchar(50) | NULL |  | English name |
| `NameFR` | varchar(50) | NULL |  | French name |
| `iOrder` | smallint | NULL |  |  |

### `UB_Def_ClientStatus`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | smallint | NOT NULL |  | Primary key, auto-increment identifier |
| `NameEN` | varchar(20) | NULL |  | English name |
| `NameFR` | varchar(20) | NULL |  | French name |
| `iOrder` | smallint | NULL |  |  |

### `UB_Def_ClientTitle`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | smallint | NOT NULL |  | Primary key, auto-increment identifier |
| `FSCode` | char(1) | NOT NULL |  |  |
| `NameEN` | varchar(30) | NULL |  | English name |
| `NameFR` | varchar(30) | NULL |  | French name |
| `iOrder` | smallint | NULL |  |  |

### `UB_Def_CommCategory`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | smallint | NOT NULL |  | Primary key, auto-increment identifier |
| `NameEN` | varchar(80) | NULL |  | English name |
| `NameFR` | varchar(80) | NULL |  | French name |
| `iOrder` | smallint | NULL |  |  |

### `UB_Def_CommChangeGroup`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | smallint | NOT NULL |  | Primary key, auto-increment identifier |
| `NameEN` | varchar(50) | NULL |  | English name |
| `NameFR` | varchar(50) | NULL |  | French name |
| `iFrom` | int | NULL |  | Integer field |
| `iTo` | int | NULL |  | Integer field |
| `ColorStr` | varchar(30) | NULL |  |  |
| `iOrder` | smallint | NULL |  |  |

### `UB_Def_CommCompensationType`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | smallint | NOT NULL |  | Primary key, auto-increment identifier |
| `NameEN` | varchar(80) | NOT NULL |  | English name |
| `NameFR` | varchar(80) | NOT NULL |  | French name |
| `iOrder` | smallint | NOT NULL |  |  |
| `iDirect` | tinyint | NULL |  | Small integer/flag field |
| `iAlwaysShow` | tinyint | NULL |  | Small integer/flag field |
| `iSection` | tinyint | NULL |  | Small integer/flag field |

### `UB_Def_CommCompensationType1912`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | smallint | NOT NULL |  | Primary key, auto-increment identifier |
| `NameEN` | varchar(80) | NOT NULL |  | English name |
| `NameFR` | varchar(80) | NOT NULL |  | French name |
| `iOrder` | smallint | NOT NULL |  |  |
| `iDirect` | tinyint | NULL |  | Small integer/flag field |
| `iAlwaysShow` | tinyint | NULL |  | Small integer/flag field |
| `iSection` | tinyint | NULL |  | Small integer/flag field |

### `UB_Def_CommEntryType`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | tinyint | NOT NULL |  | Primary key, auto-increment identifier |
| `NameEN` | varchar(50) | NOT NULL |  | English name |
| `NameFR` | varchar(50) | NOT NULL |  | French name |
| `iOrder` | tinyint | NOT NULL |  | Small integer/flag field |

### `UB_Def_CommGridType`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | smallint | NOT NULL |  | Primary key, auto-increment identifier |
| `NameEN` | varchar(50) | NULL |  | English name |
| `NameFR` | varchar(50) | NULL |  | French name |
| `iOrder` | smallint | NULL |  |  |

### `UB_Def_CommIncomeCategory`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | smallint | NOT NULL |  | Primary key, auto-increment identifier |
| `NameEN` | varchar(50) | NOT NULL |  | English name |
| `NameFR` | varchar(50) | NOT NULL |  | French name |
| `iOrder` | smallint | NOT NULL |  |  |

### `UB_Def_CommIncomeType`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | smallint | NOT NULL |  | Primary key, auto-increment identifier |
| `FSCode` | char(1) | NOT NULL |  |  |
| `NameEN` | varchar(50) | NOT NULL |  | English name |
| `NameFR` | varchar(50) | NOT NULL |  | French name |
| `iOrder` | smallint | NOT NULL |  |  |

### `UB_Def_CommOverrideMemberType`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | smallint | NOT NULL |  | Primary key, auto-increment identifier |
| `NameEN` | varchar(80) | NULL |  | English name |
| `NameFR` | varchar(80) | NULL |  | French name |
| `iOrder` | smallint | NULL |  |  |

### `UB_Def_CommPayableStatus`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | smallint | NOT NULL |  | Primary key, auto-increment identifier |
| `NameEN` | varchar(50) | NOT NULL |  | English name |
| `NameFR` | varchar(50) | NOT NULL |  | French name |
| `iOrder` | smallint | NOT NULL |  |  |

### `UB_Def_CommRateType`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | smallint | NOT NULL |  | Primary key, auto-increment identifier |
| `NameEN` | varchar(50) | NOT NULL |  | English name |
| `NameFR` | varchar(50) | NOT NULL |  | French name |
| `iOrder` | smallint | NOT NULL |  |  |

### `UB_Def_CommReceivableStatus`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | smallint | NOT NULL |  | Primary key, auto-increment identifier |
| `NameEN` | varchar(50) | NOT NULL |  | English name |
| `NameFR` | varchar(50) | NOT NULL |  | French name |
| `iOrder` | smallint | NOT NULL |  |  |

### `UB_Def_CommType`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | smallint | NOT NULL |  | Primary key, auto-increment identifier |
| `FSCode` | char(1) | NOT NULL |  |  |
| `NameEN` | varchar(50) | NOT NULL |  | English name |
| `NameFR` | varchar(50) | NOT NULL |  | French name |
| `iOrder` | smallint | NOT NULL |  |  |

### `UB_Def_CompanyExec`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | smallint | NOT NULL |  | Primary key, auto-increment identifier |
| `NameEN` | varchar(40) | NULL |  | English name |
| `NameFR` | varchar(40) | NULL |  | French name |
| `iOrder` | smallint | NULL |  |  |

### `UB_Def_CompApprovalLevel`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | smallint | NOT NULL |  | Primary key, auto-increment identifier |
| `NameEN` | varchar(50) | NULL |  | English name |
| `NameFR` | varchar(50) | NULL |  | French name |
| `iOrder` | smallint | NULL |  |  |

### `UB_Def_CompStatus`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | smallint | NOT NULL |  | Primary key, auto-increment identifier |
| `NameEN` | varchar(80) | NULL |  | English name |
| `NameFR` | varchar(80) | NULL |  | French name |
| `iOrder` | smallint | NULL |  |  |

### `UB_Def_CompSupervisoryLevel`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | smallint | NOT NULL |  | Primary key, auto-increment identifier |
| `NameEN` | varchar(80) | NOT NULL |  | English name |
| `NameFR` | varchar(80) | NOT NULL |  | French name |
| `iOrder` | smallint | NOT NULL |  |  |

### `UB_Def_ContactPrefMethod`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | smallint | NOT NULL |  | Primary key, auto-increment identifier |
| `NameEN` | varchar(50) | NULL |  | English name |
| `NameFR` | varchar(50) | NULL |  | French name |
| `iOrder` | smallint | NULL |  |  |

### `UB_Def_ContactPrefTime`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | smallint | NOT NULL |  | Primary key, auto-increment identifier |
| `NameEN` | varchar(50) | NULL |  | English name |
| `NameFR` | varchar(50) | NULL |  | French name |
| `iOrder` | smallint | NULL |  |  |

### `UB_Def_ContributionPeriod`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | tinyint | NOT NULL |  | Primary key, auto-increment identifier |
| `FSCode` | char(1) | NOT NULL |  |  |
| `NameEN` | varchar(40) | NULL |  | English name |
| `NameFR` | varchar(40) | NULL |  | French name |
| `iOrder` | tinyint | NULL |  | Small integer/flag field |

### `UB_Def_ContributionReceipt`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | tinyint | NOT NULL |  | Primary key, auto-increment identifier |
| `NameEN` | varchar(80) | NULL |  | English name |
| `NameFR` | varchar(80) | NULL |  | French name |
| `iOrder` | tinyint | NOT NULL |  | Small integer/flag field |

### `UB_Def_ContrWdrCode`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | tinyint | NOT NULL |  | Primary key, auto-increment identifier |
| `FSCode` | char(1) | NOT NULL |  |  |
| `NameEN` | varchar(80) | NULL |  | English name |
| `NameFR` | varchar(80) | NULL |  | French name |
| `iOrder` | tinyint | NULL |  | Small integer/flag field |

### `UB_Def_CRSClass`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | smallint | NOT NULL |  | Primary key, auto-increment identifier |
| `FSCode` | char(6) | NOT NULL |  |  |
| `NameEN` | varchar(120) | NULL |  | English name |
| `NameFR` | varchar(120) | NULL |  | French name |
| `iOrder` | smallint | NULL |  |  |

### `UB_Def_DealerGroup`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | smallint | NOT NULL |  | Primary key, auto-increment identifier |
| `NameEN` | varchar(80) | NOT NULL |  | English name |
| `NameFR` | varchar(80) | NOT NULL |  | French name |
| `iOrder` | smallint | NOT NULL |  |  |
| `iExcludeCompensation` | tinyint | NULL |  | Small integer/flag field |
| `iExcludePerformance` | tinyint | NULL |  | Small integer/flag field |
| `iExcludeReportRep` | tinyint | NULL |  | Small integer/flag field |
| `iExcludeReportAdmin` | tinyint | NULL |  | Small integer/flag field |

### `UB_Def_DefaultOrder`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `TrxType` | varchar(20) | NOT NULL |  |  |
| `AccountDesignation` | char(1) | NOT NULL |  |  |
| `SettlSrc` | char(1) | NULL |  |  |
| `SettlMethod` | char(1) | NULL |  |  |
| `SettlInd` | char(1) | NULL |  |  |
| `bUseTrust` | tinyint | NULL |  |  |

### `UB_Def_DefaultOrder1108`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `TrxType` | varchar(20) | NOT NULL |  |  |
| `AccountDesignation` | char(1) | NOT NULL |  |  |
| `SettlSrc` | char(1) | NULL |  |  |
| `SettlMethod` | char(1) | NULL |  |  |
| `SettlInd` | char(1) | NULL |  |  |

### `UB_Def_DefaultOrder1138`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `TrxType` | varchar(20) | NOT NULL |  |  |
| `AccountDesignation` | char(1) | NOT NULL |  |  |
| `SettlSrc` | char(1) | NULL |  |  |
| `SettlMethod` | char(1) | NULL |  |  |
| `SettlInd` | char(1) | NULL |  |  |

### `UB_Def_DefaultOrder1194`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `TrxType` | varchar(20) | NOT NULL |  |  |
| `AccountDesignation` | char(1) | NOT NULL |  |  |
| `SettlSrc` | char(1) | NULL |  |  |
| `SettlMethod` | char(1) | NULL |  |  |
| `SettlInd` | char(1) | NULL |  |  |

### `UB_Def_DefaultOrder1214`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `TrxType` | varchar(20) | NOT NULL |  |  |
| `AccountDesignation` | char(1) | NOT NULL |  |  |
| `SettlSrc` | char(1) | NULL |  |  |
| `SettlMethod` | char(1) | NULL |  |  |
| `SettlInd` | char(1) | NULL |  |  |

### `UB_Def_DefaultOrder1256`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `TrxType` | varchar(20) | NOT NULL |  |  |
| `AccountDesignation` | char(1) | NOT NULL |  |  |
| `SettlSrc` | char(1) | NULL |  |  |
| `SettlMethod` | char(1) | NULL |  |  |
| `SettlInd` | char(1) | NULL |  |  |

### `UB_Def_DisclaimerTarget`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | smallint | NOT NULL |  | Primary key, auto-increment identifier |
| `NameEN` | varchar(50) | NOT NULL |  | English name |
| `NameFR` | varchar(50) | NOT NULL |  | French name |
| `iOrder` | smallint | NOT NULL |  |  |

### `UB_Def_DIVCIImport`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `FieldName` | varchar(80) | NOT NULL |  | Field name reference |
| `SPParamName` | varchar(50) | NULL |  |  |

### `UB_Def_DividendOpt`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | smallint | NOT NULL |  | Primary key, auto-increment identifier |
| `FSCode` | char(1) | NOT NULL |  |  |
| `NameEN` | varchar(80) | NULL |  | English name |
| `NameFR` | varchar(80) | NULL |  | French name |
| `iOrder` | smallint | NULL |  |  |

### `UB_Def_DocLinkedType`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | smallint | NOT NULL |  | Primary key, auto-increment identifier |
| `iSubID` | tinyint | NOT NULL |  | Small integer/flag field |
| `NameEN` | varchar(50) | NULL |  | English name |
| `NameFR` | varchar(50) | NULL |  | French name |
| `iOrder` | smallint | NULL |  |  |

### `UB_Def_DocReceived`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | smallint | NOT NULL |  | Primary key, auto-increment identifier |
| `NameEN` | varchar(50) | NULL |  | English name |
| `NameFR` | varchar(50) | NULL |  | French name |
| `iOrder` | smallint | NULL |  |  |

### `UB_Def_DocType`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | smallint | NOT NULL |  | Primary key, auto-increment identifier |
| `NameEN` | varchar(50) | NULL |  | English name |
| `NameFR` | varchar(50) | NULL |  | French name |
| `iOrder` | smallint | NULL |  |  |

### `UB_Def_EFTSource`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | smallint | NOT NULL |  | Primary key, auto-increment identifier |
| `FSCode` | char(1) | NOT NULL |  |  |
| `NameEN` | varchar(50) | NULL |  | English name |
| `NameFR` | varchar(50) | NULL |  | French name |
| `iOrder` | smallint | NULL |  |  |

### `UB_Def_EFTType`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | smallint | NOT NULL |  | Primary key, auto-increment identifier |
| `NameEN` | varchar(80) | NOT NULL |  | English name |
| `NameFR` | varchar(80) | NOT NULL |  | French name |
| `iOrder` | smallint | NOT NULL |  |  |

### `UB_Def_EmailStatus`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | smallint | NOT NULL |  | Primary key, auto-increment identifier |
| `NameEN` | varchar(50) | NULL |  | English name |
| `NameFR` | varchar(50) | NULL |  | French name |
| `iOrder` | smallint | NULL |  |  |

### `UB_Def_EmailSubjectType`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL |  | Primary key, auto-increment identifier |
| `NameEN` | varchar(100) | NULL |  | English name |
| `NameFR` | varchar(100) | NULL |  | French name |
| `iOrder` | int | NULL |  | Integer field |

### `UB_Def_EmailTemplateType`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | smallint | NOT NULL |  | Primary key, auto-increment identifier |
| `NameEN` | varchar(80) | NULL |  | English name |
| `NameFR` | varchar(80) | NULL |  | French name |
| `iOrder` | smallint | NULL |  |  |

### `UB_Def_EMDQualifier`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | smallint | NOT NULL |  | Primary key, auto-increment identifier |
| `NameEN` | varchar(50) | NOT NULL |  | English name |
| `NameFR` | varchar(50) | NOT NULL |  | French name |
| `iOrder` | smallint | NOT NULL |  |  |

### `UB_Def_EmployerSector`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | smallint | NOT NULL |  | Primary key, auto-increment identifier |
| `NameEN` | varchar(80) | NULL |  | English name |
| `NameFR` | varchar(80) | NULL |  | French name |
| `iOrder` | smallint | NULL |  |  |

### `UB_Def_EmploymentType`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | smallint | NOT NULL |  | Primary key, auto-increment identifier |
| `NameEN` | varchar(50) | NULL |  | English name |
| `NameFR` | varchar(50) | NULL |  | French name |
| `iOrder` | smallint | NULL |  |  |

### `UB_Def_EnvelopeRoutingOrder`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | smallint | NOT NULL |  | Primary key, auto-increment identifier |
| `NameEN` | varchar(50) | NOT NULL |  | English name |
| `NameFR` | varchar(50) | NOT NULL |  | French name |
| `iOrder` | smallint | NOT NULL |  |  |

### `UB_Def_EnvelopeStatus`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | smallint | NOT NULL |  | Primary key, auto-increment identifier |
| `FSCode` | varchar(30) | NOT NULL |  |  |
| `NameEN` | varchar(50) | NOT NULL |  | English name |
| `NameFR` | varchar(50) | NOT NULL |  | French name |
| `iOrder` | smallint | NOT NULL |  |  |

### `UB_Def_EnvelopeStatusOneSpan`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL |  | Primary key, auto-increment identifier |
| `FSCode` | varchar(30) | NOT NULL |  |  |
| `NameEN` | varchar(50) | NOT NULL |  | English name |
| `NameFR` | varchar(50) | NOT NULL |  | French name |
| `iOrder` | smallint | NOT NULL |  |  |

### `UB_Def_EnvelopeStatusSignority`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL |  | Primary key, auto-increment identifier |
| `FSCode` | varchar(30) | NOT NULL |  |  |
| `NameEN` | varchar(50) | NOT NULL |  | English name |
| `NameFR` | varchar(50) | NOT NULL |  | French name |
| `iOrder` | smallint | NOT NULL |  |  |

### `UB_Def_ErrorMSG`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL |  | Primary key, auto-increment identifier |
| `Code` | varchar(30) | NOT NULL |  |  |
| `MSGEN` | varchar(max) | NULL |  |  |
| `MSGFR` | varchar(max) | NULL |  |  |

### `UB_Def_ESignatureSourceType`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL |  | Primary key, auto-increment identifier |
| `NameEN` | varchar(50) | NULL |  | English name |
| `NameFR` | varchar(50) | NULL |  | French name |
| `iOrder` | smallint | NULL |  |  |

### `UB_Def_ETFPriceImport`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `FieldName` | varchar(80) | NOT NULL |  | Field name reference |
| `SPParamName` | varchar(50) | NULL |  |  |

### `UB_Def_ETFPriceImportNEO`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `FieldName` | varchar(80) | NOT NULL |  | Field name reference |
| `SPParamName` | varchar(50) | NULL |  |  |

### `UB_Def_ExceptionReport`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | smallint | NOT NULL |  | Primary key, auto-increment identifier |
| `NameEN` | varchar(100) | NOT NULL |  | English name |
| `NameFR` | varchar(100) | NOT NULL |  | French name |
| `iOrder` | smallint | NOT NULL |  |  |
| `iFlag` | tinyint | NULL |  | Small integer/flag field |

### `UB_Def_ExpiryDateCategory`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | smallint | NOT NULL |  | Primary key, auto-increment identifier |
| `NameEN` | varchar(50) | NULL |  | English name |
| `NameFR` | varchar(50) | NULL |  | French name |
| `NameShortEN` | varchar(30) | NULL |  |  |
| `NameShortFR` | varchar(30) | NULL |  |  |
| `iFrom` | int | NULL |  | Integer field |
| `iTo` | int | NULL |  | Integer field |
| `iOrder` | smallint | NULL |  |  |

### `UB_Def_FATCAClass`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | smallint | NOT NULL |  | Primary key, auto-increment identifier |
| `FSCode` | char(1) | NOT NULL |  |  |
| `NameEN` | varchar(120) | NULL |  | English name |
| `NameFR` | varchar(120) | NULL |  | French name |
| `iOrder` | smallint | NULL |  |  |

### `UB_Def_FATCAControllingPersonType`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | smallint | NOT NULL |  | Primary key, auto-increment identifier |
| `FSCode` | char(6) | NOT NULL |  |  |
| `NameEN` | varchar(120) | NULL |  | English name |
| `NameFR` | varchar(120) | NULL |  | French name |
| `iOrder` | smallint | NULL |  |  |

### `UB_Def_FATCAEntityType`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | smallint | NOT NULL |  | Primary key, auto-increment identifier |
| `FSCode` | char(1) | NOT NULL |  |  |
| `NameEN` | varchar(100) | NULL |  | English name |
| `NameFR` | varchar(100) | NULL |  | French name |
| `iOrder` | smallint | NULL |  |  |

### `UB_Def_FATCAIDType`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | smallint | NOT NULL |  | Primary key, auto-increment identifier |
| `FSCode` | char(1) | NOT NULL |  |  |
| `NameEN` | varchar(50) | NULL |  | English name |
| `NameFR` | varchar(50) | NULL |  | French name |
| `iOrder` | smallint | NULL |  |  |

### `UB_Def_FATCALinkType`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | smallint | NOT NULL |  | Primary key, auto-increment identifier |
| `NameEN` | varchar(80) | NULL |  | English name |
| `NameFR` | varchar(80) | NULL |  | French name |

### `UB_Def_FATCANoTINReason`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | smallint | NOT NULL |  | Primary key, auto-increment identifier |
| `FSCode` | char(1) | NOT NULL |  |  |
| `NameEN` | varchar(120) | NULL |  | English name |
| `NameFR` | varchar(120) | NULL |  | French name |
| `iOrder` | smallint | NULL |  |  |

### `UB_Def_FATCAStatus`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | smallint | NOT NULL |  | Primary key, auto-increment identifier |
| `FSCode` | char(1) | NOT NULL |  |  |
| `NameEN` | varchar(50) | NULL |  | English name |
| `NameFR` | varchar(50) | NULL |  | French name |
| `iOrder` | smallint | NULL |  |  |

### `UB_Def_FeeDetail`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iInvestObj` | tinyint | NULL |  | Small integer/flag field |
| `iTier` | tinyint | NULL |  | Small integer/flag field |
| `GridID` | varchar(15) | NULL |  |  |
| `iBpFixed` | int | NULL |  | Integer field |
| `iBpHouse` | int | NULL |  | Integer field |
| `Description` | varchar(80) | NULL |  |  |
| `Code` | varchar(15) | NULL |  |  |

### `UB_Def_FeePmtType`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | tinyint | NOT NULL |  | Primary key, auto-increment identifier |
| `NameEN` | varchar(50) | NOT NULL |  | English name |
| `NameFR` | varchar(50) | NOT NULL |  | French name |
| `iOrder` | tinyint | NOT NULL |  | Small integer/flag field |

### `UB_Def_FeeTaxOption`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | smallint | NOT NULL |  | Primary key, auto-increment identifier |
| `NameEN` | varchar(80) | NULL |  | English name |
| `NameFR` | varchar(80) | NULL |  | French name |
| `iOrder` | smallint | NULL |  |  |

### `UB_Def_FeeTier`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `Code` | varchar(15) | NOT NULL |  |  |
| `iTier` | tinyint | NOT NULL |  | Small integer/flag field |
| `mFloor` | money | NULL |  |  |
| `mCeiling` | money | NULL |  |  |
| `mHeight` | money | NULL |  |  |
| `mTriggerUp` | money | NULL |  |  |
| `mTriggerDown` | money | NULL |  |  |

### `UB_Def_FeeTierCode`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `Code` | varchar(15) | NOT NULL |  |  |
| `NameEN` | varchar(50) | NOT NULL |  | English name |
| `NameFR` | varchar(50) | NOT NULL |  | French name |
| `iOrder` | int | NOT NULL |  | Integer field |

### `UB_Def_FeeTrusteeCode`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | tinyint | NOT NULL |  | Primary key, auto-increment identifier |
| `NameEN` | varchar(50) | NOT NULL |  | English name |
| `NameFR` | varchar(50) | NOT NULL |  | French name |
| `iOrder` | tinyint | NOT NULL |  | Small integer/flag field |

### `UB_Def_FeeType`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | tinyint | NOT NULL |  | Primary key, auto-increment identifier |
| `NameEN` | varchar(50) | NOT NULL |  | English name |
| `NameFR` | varchar(50) | NOT NULL |  | French name |
| `iOrder` | tinyint | NOT NULL |  | Small integer/flag field |
| `iOptions` | tinyint | NOT NULL |  | Small integer/flag field |

### `UB_Def_FeeType_FS`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | tinyint | NOT NULL |  | Primary key, auto-increment identifier |
| `FSCode` | char(2) | NOT NULL |  |  |
| `NameEN` | varchar(80) | NOT NULL |  | English name |
| `NameFR` | varchar(80) | NOT NULL |  | French name |
| `iOrder` | tinyint | NOT NULL |  | Small integer/flag field |
| `iOptions` | tinyint | NULL |  | Small integer/flag field |

### `UB_Def_FeeTypeDetail`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iType` | tinyint | NULL |  | Type/category code |
| `iStatus` | tinyint | NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `NameEN` | varchar(80) | NULL |  | English name |
| `NameFR` | varchar(80) | NULL |  | French name |
| `mAmount1` | money | NULL |  | Monetary amount |
| `mAmount2` | money | NULL |  | Monetary amount |
| `bRegistered` | tinyint | NULL |  |  |
| `bNonRegistered` | tinyint | NULL |  |  |
| `bTFSA` | tinyint | NULL |  |  |
| `bFee4Service` | tinyint | NULL |  |  |
| `bPortfolio` | tinyint | NULL |  |  |
| `dtStart` | datetime | NULL |  | Date/time field |
| `dtStop` | datetime | NULL |  | Date/time field |
| `DealerCode` | varchar(5) | NULL |  | Dealer code identifier |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `dtLastModified` | datetime | NULL |  | Timestamp when record was last modified |
| `iCreatedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `iLastModifiedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who last modified this record |
| `iOrder` | int | NULL |  | Integer field |
| `iTrusteeFeeCode` | tinyint | NULL |  | Small integer/flag field |

### `UB_Def_FINTRACDocType`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | tinyint | NOT NULL |  | Primary key, auto-increment identifier |
| `NameEN` | varchar(200) | NULL |  | English name |
| `NameFR` | varchar(200) | NULL |  | French name |
| `iOrder` | tinyint | NULL |  | Small integer/flag field |

### `UB_Def_FormType`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | smallint | NOT NULL |  | Primary key, auto-increment identifier |
| `NameEN` | varchar(50) | NULL |  | English name |
| `NameFR` | varchar(50) | NULL |  | French name |
| `iOrder` | smallint | NULL |  |  |

### `UB_Def_FSRVError`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `Code` | varchar(4) | NOT NULL |  |  |
| `NameEN` | varchar(200) | NULL |  | English name |
| `NameFR` | varchar(200) | NULL |  | French name |

### `UB_Def_FSTrxProdEventInd`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | smallint | NOT NULL |  | Primary key, auto-increment identifier |
| `FSCode` | varchar(2) | NOT NULL |  |  |
| `NameEN` | varchar(200) | NULL |  | English name |
| `NameFR` | varchar(200) | NULL |  | French name |
| `iOrder` | smallint | NULL |  |  |

### `UB_Def_FSTrxType`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | smallint | NOT NULL |  | Primary key, auto-increment identifier |
| `FSCode` | char(1) | NOT NULL |  |  |
| `NameEN` | varchar(80) | NULL |  | English name |
| `NameFR` | varchar(80) | NULL |  | French name |
| `iOrder` | smallint | NULL |  |  |
| `bEO` | tinyint | NULL |  |  |

### `UB_Def_FSTrxTypeDetail`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | smallint | NOT NULL |  | Primary key, auto-increment identifier |
| `FSCode` | char(1) | NOT NULL |  |  |
| `NameEN` | varchar(80) | NULL |  | English name |
| `NameFR` | varchar(80) | NULL |  | French name |
| `iOrder` | smallint | NULL |  |  |

### `UB_Def_FundAllocationDesc`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `iType` | tinyint | NOT NULL |  | Type/category code |
| `NameEN` | varchar(80) | NULL |  | English name |
| `NameFR` | varchar(80) | NULL |  | French name |

### `UB_Def_FundAllocationType`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | smallint | NOT NULL | Y | Primary key, auto-increment identifier |
| `KeyStr` | varchar(30) | NULL |  |  |
| `NameEN` | varchar(50) | NULL |  | English name |
| `NameFR` | varchar(50) | NULL |  | French name |
| `iOrder` | smallint | NULL |  |  |

### `UB_Def_FundBareTrustee`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | tinyint | NOT NULL |  | Primary key, auto-increment identifier |
| `FSCode` | char(1) | NULL |  |  |
| `NameEN` | varchar(40) | NULL |  | English name |
| `NameFR` | varchar(40) | NULL |  | French name |
| `iOrder` | tinyint | NULL |  | Small integer/flag field |

### `UB_Def_FundClass`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `FSCode` | char(2) | NULL |  |  |
| `NameEN` | varchar(80) | NULL |  | English name |
| `NameFR` | varchar(80) | NULL |  | French name |
| `iOrder` | smallint | NULL |  |  |
| `iFundataCode` | smallint | NULL |  |  |
| `iStatus` | tinyint | NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `iExempt` | tinyint | NULL |  | Small integer/flag field |

### `UB_Def_FundefPropName`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | smallint | NOT NULL |  | Primary key, auto-increment identifier |
| `NameEN` | varchar(80) | NULL |  | English name |
| `NameFR` | varchar(80) | NULL |  | French name |
| `iOrder` | smallint | NULL |  |  |
| `iFlag` | tinyint | NULL |  | Small integer/flag field |
| `FieldName` | varchar(50) | NULL |  | Field name reference |
| `TableName` | varchar(50) | NULL |  |  |
| `bAuditTrail` | tinyint | NULL |  |  |
| `FunctionKey` | varchar(50) | NULL |  |  |
| `FieldType` | varchar(10) | NULL |  |  |
| `iSignificantType` | tinyint | NULL |  | Small integer/flag field |
| `iShowOpt` | tinyint | NULL |  | Small integer/flag field |

### `UB_Def_FundElig`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | tinyint | NOT NULL |  | Primary key, auto-increment identifier |
| `FSCode` | char(1) | NULL |  |  |
| `NameEN` | varchar(40) | NULL |  | English name |
| `NameFR` | varchar(40) | NULL |  | French name |
| `iOrder` | tinyint | NULL |  | Small integer/flag field |

### `UB_Def_FundFactDeliveryMethod`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | smallint | NOT NULL |  | Primary key, auto-increment identifier |
| `NameEN` | varchar(40) | NULL |  | English name |
| `NameFR` | varchar(40) | NULL |  | French name |
| `iOrder` | smallint | NULL |  |  |

### `UB_Def_FundFeeFreq`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | tinyint | NOT NULL |  | Primary key, auto-increment identifier |
| `FSCode` | char(1) | NULL |  |  |
| `NameEN` | varchar(40) | NULL |  | English name |
| `NameFR` | varchar(40) | NULL |  | French name |
| `iOrder` | tinyint | NULL |  | Small integer/flag field |

### `UB_Def_FundLoadType`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | smallint | NOT NULL |  | Primary key, auto-increment identifier |
| `FSCode` | varchar(4) | NULL |  |  |
| `NameEN` | varchar(80) | NULL |  | English name |
| `NameFR` | varchar(80) | NULL |  | French name |
| `iOrder` | smallint | NULL |  |  |
| `SymbolEN` | varchar(4) | NULL |  |  |
| `SymbolFR` | varchar(4) | NULL |  |  |

### `UB_Def_FundRegion`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | smallint | NOT NULL |  | Primary key, auto-increment identifier |
| `NameEN` | varchar(80) | NULL |  | English name |
| `NameFR` | varchar(80) | NULL |  | French name |
| `iOrder` | smallint | NULL |  |  |

### `UB_Def_FundReqDocType`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | tinyint | NOT NULL |  | Primary key, auto-increment identifier |
| `FSCode` | char(1) | NULL |  |  |
| `NameEN` | varchar(40) | NULL |  | English name |
| `NameFR` | varchar(40) | NULL |  | French name |
| `iOrder` | tinyint | NULL |  | Small integer/flag field |

### `UB_Def_FundStatus`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | tinyint | NOT NULL |  | Primary key, auto-increment identifier |
| `FSCode` | char(1) | NULL |  |  |
| `NameEN` | varchar(40) | NULL |  | English name |
| `NameFR` | varchar(40) | NULL |  | French name |
| `iOrder` | tinyint | NULL |  | Small integer/flag field |

### `UB_Def_FundTaxStructure`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | tinyint | NOT NULL |  | Primary key, auto-increment identifier |
| `FSCode` | char(1) | NULL |  |  |
| `NameEN` | varchar(40) | NULL |  | English name |
| `NameFR` | varchar(40) | NULL |  | French name |
| `iOrder` | tinyint | NULL |  | Small integer/flag field |

### `UB_Def_FundType`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | smallint | NOT NULL |  | Primary key, auto-increment identifier |
| `FSCode` | char(1) | NULL |  |  |
| `NameEN` | varchar(80) | NULL |  | English name |
| `NameFR` | varchar(80) | NULL |  | French name |
| `NameShortEN` | varchar(10) | NULL |  |  |
| `NameShortFR` | varchar(10) | NULL |  |  |
| `iOrder` | smallint | NULL |  |  |
| `iFundataCode` | smallint | NULL |  |  |

### `UB_Def_GICAccountStatus`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | smallint | NOT NULL |  | Primary key, auto-increment identifier |
| `FSCode` | char(1) | NOT NULL |  |  |
| `NameEN` | varchar(30) | NULL |  | English name |
| `NameFR` | varchar(30) | NULL |  | French name |
| `iOrder` | smallint | NULL |  |  |

### `UB_Def_GICAnnuitantType`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | smallint | NOT NULL |  | Primary key, auto-increment identifier |
| `FSCode` | varchar(1) | NULL |  |  |
| `NameEN` | varchar(40) | NULL |  | English name |
| `NameFR` | varchar(40) | NULL |  | French name |
| `iOrder` | smallint | NULL |  |  |

### `UB_Def_GICDuration`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | smallint | NOT NULL |  | Primary key, auto-increment identifier |
| `FSCode` | varchar(1) | NULL |  |  |
| `NameEN` | varchar(40) | NULL |  | English name |
| `NameFR` | varchar(40) | NULL |  | French name |
| `iOrder` | smallint | NULL |  |  |

### `UB_Def_GICFrequency`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | smallint | NOT NULL |  | Primary key, auto-increment identifier |
| `FSCode` | char(1) | NULL |  |  |
| `NameEN` | varchar(50) | NULL |  | English name |
| `NameFR` | varchar(50) | NULL |  | French name |
| `iOrder` | smallint | NULL |  |  |

### `UB_Def_GICImport`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `FieldName` | varchar(80) | NOT NULL |  | Field name reference |
| `SPParamName` | varchar(50) | NULL |  |  |

### `UB_Def_GICIntCompound`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | smallint | NOT NULL |  | Primary key, auto-increment identifier |
| `FSCode` | char(1) | NULL |  |  |
| `NameEN` | varchar(50) | NULL |  | English name |
| `NameFR` | varchar(50) | NULL |  | French name |
| `iOrder` | smallint | NULL |  |  |

### `UB_Def_GICInterestAccrual`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | smallint | NOT NULL |  | Primary key, auto-increment identifier |
| `FSCode` | char(1) | NULL |  |  |
| `NameEN` | varchar(40) | NULL |  | English name |
| `NameFR` | varchar(40) | NULL |  | French name |
| `iOrder` | smallint | NULL |  |  |

### `UB_Def_GICInterestCalc`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | smallint | NOT NULL |  | Primary key, auto-increment identifier |
| `FSCode` | char(1) | NULL |  |  |
| `NameEN` | varchar(40) | NULL |  | English name |
| `NameFR` | varchar(40) | NULL |  | French name |
| `iOrder` | smallint | NULL |  |  |

### `UB_Def_GICInterestPaidOn`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | smallint | NOT NULL |  | Primary key, auto-increment identifier |
| `NameEN` | varchar(50) | NULL |  | English name |
| `NameFR` | varchar(50) | NULL |  | French name |
| `iOrder` | smallint | NULL |  |  |

### `UB_Def_GICMaturityInstruction`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | smallint | NOT NULL |  | Primary key, auto-increment identifier |
| `CFNCode` | char(2) | NOT NULL |  |  |
| `NameEN` | varchar(150) | NULL |  | English name |
| `NameFR` | varchar(150) | NULL |  | French name |
| `iOrder` | smallint | NULL |  |  |

### `UB_Def_GICOwnershipType`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | smallint | NOT NULL |  | Primary key, auto-increment identifier |
| `CFNCode` | varchar(8) | NOT NULL |  |  |
| `NameEN` | varchar(150) | NULL |  | English name |
| `NameFR` | varchar(150) | NULL |  | French name |
| `iOrder` | smallint | NULL |  |  |

### `UB_Def_GICPMTMethod`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | smallint | NOT NULL |  | Primary key, auto-increment identifier |
| `FSCode` | char(1) | NULL |  |  |
| `NameEN` | varchar(50) | NULL |  | English name |
| `NameFR` | varchar(50) | NULL |  | French name |
| `iOrder` | smallint | NULL |  |  |

### `UB_Def_GICProdType`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | smallint | NOT NULL |  | Primary key, auto-increment identifier |
| `FSCode` | varchar(3) | NULL |  |  |
| `NameENShort` | varchar(3) | NULL |  |  |
| `NameFRShort` | varchar(3) | NULL |  |  |
| `NameEN` | varchar(20) | NULL |  | English name |
| `NameFR` | varchar(20) | NULL |  | French name |
| `iOrder` | smallint | NULL |  |  |

### `UB_Def_GICRateType`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | smallint | NOT NULL |  | Primary key, auto-increment identifier |
| `FSCode` | char(1) | NULL |  |  |
| `NameEN` | varchar(30) | NULL |  | English name |
| `NameFR` | varchar(30) | NULL |  | French name |
| `iOrder` | smallint | NULL |  |  |

### `UB_Def_GICRedeemable`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | smallint | NOT NULL |  | Primary key, auto-increment identifier |
| `FSCode` | char(1) | NULL |  |  |
| `NameEN` | varchar(30) | NULL |  | English name |
| `NameFR` | varchar(30) | NULL |  | French name |
| `iOrder` | smallint | NULL |  |  |

### `UB_Def_GICSettlementSource`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | tinyint | NOT NULL |  | Primary key, auto-increment identifier |
| `FSCode` | char(1) | NOT NULL |  |  |
| `NameEN` | varchar(40) | NULL |  | English name |
| `NameFR` | varchar(40) | NULL |  | French name |
| `iOrder` | tinyint | NULL |  | Small integer/flag field |

### `UB_Def_GICTermType`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | smallint | NOT NULL |  | Primary key, auto-increment identifier |
| `FSCode` | char(1) | NULL |  |  |
| `NameEN` | varchar(20) | NULL |  | English name |
| `NameFR` | varchar(20) | NULL |  | French name |
| `iOrder` | smallint | NULL |  |  |

### `UB_Def_GICTermUnit`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | smallint | NOT NULL |  | Primary key, auto-increment identifier |
| `FSCode` | char(1) | NULL |  |  |
| `NameEN` | varchar(20) | NULL |  | English name |
| `NameFR` | varchar(20) | NULL |  | French name |
| `iOrder` | smallint | NULL |  |  |

### `UB_Def_GICTrxType`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | smallint | NOT NULL |  | Primary key, auto-increment identifier |
| `NameEN` | varchar(80) | NULL |  | English name |
| `NameFR` | varchar(80) | NULL |  | French name |
| `iOrder` | smallint | NULL |  |  |

### `UB_Def_Holiday`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `Province` | varchar(3) | NOT NULL |  |  |
| `iYear` | smallint | NOT NULL |  |  |
| `iMonth` | smallint | NOT NULL |  |  |
| `iDay` | smallint | NOT NULL |  |  |
| `NameEN` | varchar(200) | NULL |  | English name |
| `NameFR` | varchar(200) | NULL |  | French name |

### `UB_Def_Identification`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | smallint | NOT NULL |  | Primary key, auto-increment identifier |
| `FSCode` | char(1) | NOT NULL |  |  |
| `NameEN` | varchar(80) | NULL |  | English name |
| `NameFR` | varchar(80) | NULL |  | French name |
| `iOrder` | smallint | NULL |  |  |
| `NameENShort` | varchar(10) | NULL |  |  |
| `NameFRShort` | varchar(10) | NULL |  |  |

### `UB_Def_IDRecordedMethod`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | smallint | NOT NULL |  | Primary key, auto-increment identifier |
| `NameEN` | varchar(120) | NULL |  | English name |
| `NameFR` | varchar(120) | NULL |  | French name |
| `iOrder` | smallint | NULL |  |  |
| `FSCode` | varchar(10) | NULL |  |  |

### `UB_Def_InsRelationship`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | smallint | NOT NULL |  | Primary key, auto-increment identifier |
| `FSCode` | varchar(2) | NULL |  |  |
| `NameEN` | varchar(50) | NULL |  | English name |
| `NameFR` | varchar(50) | NULL |  | French name |
| `iOrder` | smallint | NULL |  |  |
| `Gender` | char(1) | NULL |  |  |

### `UB_Def_InsuranceApprovalType`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | smallint | NOT NULL |  | Primary key, auto-increment identifier |
| `NameEN` | varchar(80) | NULL |  | English name |
| `NameFR` | varchar(80) | NULL |  | French name |
| `iOrder` | smallint | NULL |  |  |

### `UB_Def_InsuranceBenefitPeriod`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | smallint | NOT NULL |  | Primary key, auto-increment identifier |
| `NameEN` | varchar(80) | NULL |  | English name |
| `NameFR` | varchar(80) | NULL |  | French name |
| `iOrder` | smallint | NULL |  |  |

### `UB_Def_InsuranceBenefitType`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | smallint | NOT NULL |  | Primary key, auto-increment identifier |
| `NameEN` | varchar(80) | NULL |  | English name |
| `NameFR` | varchar(80) | NULL |  | French name |
| `iOrder` | smallint | NULL |  |  |

### `UB_Def_InsuranceClass`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | smallint | NOT NULL |  | Primary key, auto-increment identifier |
| `NameEN` | varchar(80) | NULL |  | English name |
| `NameFR` | varchar(80) | NULL |  | French name |
| `iOrder` | smallint | NULL |  |  |

### `UB_Def_InsuranceCostType`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | smallint | NOT NULL |  | Primary key, auto-increment identifier |
| `NameEN` | varchar(80) | NULL |  | English name |
| `NameFR` | varchar(80) | NULL |  | French name |
| `iOrder` | smallint | NULL |  |  |

### `UB_Def_InsuranceCoverageType`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | smallint | NOT NULL |  | Primary key, auto-increment identifier |
| `NameEN` | varchar(80) | NULL |  | English name |
| `NameFR` | varchar(80) | NULL |  | French name |
| `iOrder` | smallint | NULL |  |  |

### `UB_Def_InsuranceLifeStyle`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | smallint | NOT NULL |  | Primary key, auto-increment identifier |
| `NameEN` | varchar(80) | NULL |  | English name |
| `NameFR` | varchar(80) | NULL |  | French name |
| `iOrder` | smallint | NULL |  |  |

### `UB_Def_InsurancePremiumMode`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | smallint | NOT NULL |  | Primary key, auto-increment identifier |
| `NameEN` | varchar(80) | NULL |  | English name |
| `NameFR` | varchar(80) | NULL |  | French name |
| `iOrder` | smallint | NULL |  |  |

### `UB_Def_InsurancePremiumPeriod`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | smallint | NOT NULL |  | Primary key, auto-increment identifier |
| `NameEN` | varchar(80) | NULL |  | English name |
| `NameFR` | varchar(80) | NULL |  | French name |
| `iOrder` | smallint | NULL |  |  |

### `UB_Def_InsuranceStatus`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | smallint | NOT NULL |  | Primary key, auto-increment identifier |
| `NameEN` | varchar(80) | NULL |  | English name |
| `NameFR` | varchar(80) | NULL |  | French name |
| `iOrder` | smallint | NULL |  |  |

### `UB_Def_InsuranceType`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | smallint | NOT NULL |  | Primary key, auto-increment identifier |
| `NameEN` | varchar(80) | NULL |  | English name |
| `NameFR` | varchar(80) | NULL |  | French name |
| `iOrder` | smallint | NULL |  |  |

### `UB_Def_InvestmentKnowledge`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | smallint | NOT NULL |  | Primary key, auto-increment identifier |
| `NameEN` | varchar(50) | NULL |  | English name |
| `NameFR` | varchar(50) | NULL |  | French name |
| `iOrder` | smallint | NULL |  |  |

### `UB_Def_InvestmentLimit`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL |  | Primary key, auto-increment identifier |
| `NameEN` | varchar(50) | NULL |  | English name |
| `NameFR` | varchar(50) | NULL |  | French name |
| `iOrder` | smallint | NULL |  |  |

### `UB_Def_InvestmentObjectives`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | smallint | NOT NULL |  | Primary key, auto-increment identifier |
| `NameEN` | varchar(50) | NULL |  | English name |
| `NameFR` | varchar(50) | NULL |  | French name |
| `iOrder` | smallint | NULL |  |  |
| `bHide` | tinyint | NULL |  |  |
| `iIndex` | tinyint | NULL |  | Small integer/flag field |

### `UB_Def_InvestmentObjectives2nd`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | smallint | NOT NULL |  | Primary key, auto-increment identifier |
| `NameEN` | varchar(50) | NULL |  | English name |
| `NameFR` | varchar(50) | NULL |  | French name |
| `iOrder` | smallint | NULL |  |  |
| `bHide` | tinyint | NULL |  |  |

### `UB_Def_JointSignatureOpt`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | smallint | NOT NULL |  | Primary key, auto-increment identifier |
| `FSCode` | char(1) | NOT NULL |  |  |
| `NameEN` | varchar(40) | NULL |  | English name |
| `NameFR` | varchar(40) | NULL |  | French name |
| `iOrder` | smallint | NULL |  |  |

### `UB_Def_JointType`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | smallint | NOT NULL |  | Primary key, auto-increment identifier |
| `NameEN` | varchar(40) | NULL |  | English name |
| `NameFR` | varchar(40) | NULL |  | French name |
| `iOrder` | smallint | NULL |  |  |
| `FSCode` | char(1) | NULL |  |  |

### `UB_Def_Lg`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | smallint | NOT NULL |  | Primary key, auto-increment identifier |
| `FSCode` | char(1) | NOT NULL |  |  |
| `NameEN` | varchar(20) | NULL |  | English name |
| `NameFR` | varchar(20) | NULL |  | French name |
| `iOrder` | smallint | NULL |  |  |

### `UB_Def_LoanAssetLiquidType`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | smallint | NOT NULL |  | Primary key, auto-increment identifier |
| `NameEN` | varchar(80) | NULL |  | English name |
| `NameFR` | varchar(80) | NULL |  | French name |
| `iType` | tinyint | NULL |  | Type/category code |
| `iOrder` | smallint | NULL |  |  |
| `LinkType` | char(2) | NULL |  |  |
| `TagName` | varchar(30) | NULL |  |  |

### `UB_Def_LoanAssetType`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | smallint | NOT NULL |  | Primary key, auto-increment identifier |
| `NameEN` | varchar(80) | NULL |  | English name |
| `NameFR` | varchar(80) | NULL |  | French name |
| `iType` | tinyint | NULL |  | Type/category code |
| `iOrder` | smallint | NULL |  |  |
| `LinkType` | char(2) | NULL |  |  |
| `TagName` | varchar(30) | NULL |  |  |

### `UB_Def_LoanIncomeType`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | smallint | NOT NULL |  | Primary key, auto-increment identifier |
| `NameEN` | varchar(80) | NULL |  | English name |
| `NameFR` | varchar(80) | NULL |  | French name |
| `iOrder` | smallint | NULL |  |  |

### `UB_Def_LoanLiabilityType`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | smallint | NOT NULL |  | Primary key, auto-increment identifier |
| `NameEN` | varchar(80) | NULL |  | English name |
| `NameFR` | varchar(80) | NULL |  | French name |
| `iOrder` | smallint | NULL |  |  |
| `LinkType` | char(2) | NULL |  |  |
| `TagName` | varchar(30) | NULL |  |  |

### `UB_Def_LoanStatus`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | smallint | NOT NULL |  | Primary key, auto-increment identifier |
| `NameEN` | varchar(80) | NULL |  | English name |
| `NameFR` | varchar(80) | NULL |  | French name |
| `iOrder` | smallint | NULL |  |  |

### `UB_Def_LoanSupportDoc`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | smallint | NOT NULL |  | Primary key, auto-increment identifier |
| `NameEN` | varchar(80) | NULL |  | English name |
| `NameFR` | varchar(80) | NULL |  | French name |
| `iType` | tinyint | NULL |  | Type/category code |
| `iOrder` | smallint | NULL |  |  |

### `UB_Def_MaritalStatus`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | smallint | NOT NULL |  | Primary key, auto-increment identifier |
| `NameEN` | varchar(20) | NULL |  | English name |
| `NameFR` | varchar(20) | NULL |  | French name |
| `iOrder` | smallint | NULL |  |  |

### `UB_Def_MemberGroup`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | smallint | NOT NULL |  | Primary key, auto-increment identifier |
| `NameEN` | varchar(80) | NULL |  | English name |
| `NameFR` | varchar(80) | NULL |  | French name |
| `iOrder` | smallint | NULL |  |  |

### `UB_Def_MemberLicenseType`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | smallint | NOT NULL |  | Primary key, auto-increment identifier |
| `NameEN` | varchar(80) | NULL |  | English name |
| `NameFR` | varchar(80) | NULL |  | French name |
| `iOrder` | smallint | NULL |  |  |

### `UB_Def_MemberStatus`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | smallint | NOT NULL |  | Primary key, auto-increment identifier |
| `NameEN` | varchar(50) | NULL |  | English name |
| `NameFR` | varchar(50) | NULL |  | French name |
| `iOrder` | smallint | NULL |  |  |

### `UB_Def_MgmtType`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | smallint | NOT NULL |  | Primary key, auto-increment identifier |
| `NameEN` | varchar(80) | NULL |  | English name |
| `NameFR` | varchar(80) | NULL |  | French name |
| `iOrder` | smallint | NULL |  |  |

### `UB_Def_ModifiedMethod`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | tinyint | NOT NULL |  | Primary key, auto-increment identifier |
| `NameEN` | varchar(80) | NULL |  | English name |
| `NameFR` | varchar(80) | NULL |  | French name |

### `UB_Def_MoneyMovementType`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | smallint | NOT NULL |  | Primary key, auto-increment identifier |
| `FSCode` | varchar(3) | NOT NULL |  |  |
| `NameEN` | varchar(80) | NOT NULL |  | English name |
| `NameFR` | varchar(80) | NOT NULL |  | French name |
| `iOrder` | smallint | NOT NULL |  |  |

### `UB_Def_Network`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | tinyint | NOT NULL |  | Primary key, auto-increment identifier |
| `NameEN` | varchar(80) | NULL |  | English name |
| `NameFR` | varchar(80) | NULL |  | French name |
| `iOrder` | tinyint | NULL |  | Small integer/flag field |

### `UB_Def_NetWorth`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | smallint | NOT NULL |  | Primary key, auto-increment identifier |
| `NameEN` | varchar(50) | NULL |  | English name |
| `NameFR` | varchar(50) | NULL |  | French name |
| `iOrder` | smallint | NULL |  |  |
| `iFrom` | int | NULL |  | Integer field |
| `iTo` | int | NULL |  | Integer field |

### `UB_Def_NFUType`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | smallint | NOT NULL |  | Primary key, auto-increment identifier |
| `NameEN` | varchar(80) | NULL |  | English name |
| `NameFR` | varchar(80) | NULL |  | French name |
| `iOrder` | smallint | NULL |  |  |

### `UB_Def_NoteType`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | smallint | NOT NULL |  | Primary key, auto-increment identifier |
| `iSubID` | smallint | NOT NULL |  |  |
| `NameEN` | varchar(50) | NULL |  | English name |
| `NameFR` | varchar(50) | NULL |  | French name |
| `iOrder` | smallint | NULL |  |  |

### `UB_Def_NotificationDestType`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | smallint | NOT NULL |  | Primary key, auto-increment identifier |
| `NameEN` | varchar(50) | NULL |  | English name |
| `NameFR` | varchar(50) | NULL |  | French name |
| `iOrder` | smallint | NULL |  |  |

### `UB_Def_NotificationMSGType`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | smallint | NOT NULL |  | Primary key, auto-increment identifier |
| `NameEN` | varchar(50) | NULL |  | English name |
| `NameFR` | varchar(50) | NULL |  | French name |
| `iOrder` | smallint | NULL |  |  |

### `UB_Def_NotificationSourceType`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | smallint | NOT NULL |  | Primary key, auto-increment identifier |
| `NameEN` | varchar(50) | NULL |  | English name |
| `NameFR` | varchar(50) | NULL |  | French name |
| `iOrder` | smallint | NULL |  |  |

### `UB_Def_OBAType`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | smallint | NOT NULL |  | Primary key, auto-increment identifier |
| `NameEN` | varchar(120) | NULL |  | English name |
| `NameFR` | varchar(120) | NULL |  | French name |
| `iType` | tinyint | NULL |  | Type/category code |
| `iOrder` | smallint | NULL |  |  |

### `UB_Def_Occupation`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | smallint | NOT NULL |  | Primary key, auto-increment identifier |
| `IndustryEN` | varchar(100) | NULL |  |  |
| `IndustryFR` | varchar(100) | NULL |  |  |
| `NameEN` | varchar(100) | NULL |  | English name |
| `NameFR` | varchar(100) | NULL |  | French name |
| `iOrder` | smallint | NULL |  |  |

### `UB_Def_OneSpanEnvelopeRecipientStatus`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL |  | Primary key, auto-increment identifier |
| `FSCode` | varchar(30) | NOT NULL |  |  |
| `NameEN` | varchar(50) | NOT NULL |  | English name |
| `NameFR` | varchar(50) | NOT NULL |  | French name |
| `iOrder` | smallint | NOT NULL |  |  |

### `UB_Def_PageSize`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `PageID` | varchar(50) | NOT NULL |  |  |
| `PageValue` | int | NOT NULL |  |  |

### `UB_Def_PayeeType`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL |  | Primary key, auto-increment identifier |
| `FSCode` | char(1) | NOT NULL |  |  |
| `NameEN` | varchar(50) | NOT NULL |  | English name |
| `NameFR` | varchar(50) | NOT NULL |  | French name |
| `iOrder` | smallint | NOT NULL |  |  |
| `iStatus` | tinyint | NOT NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |

### `UB_Def_PersonalIncome`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | smallint | NOT NULL |  | Primary key, auto-increment identifier |
| `NameEN` | varchar(50) | NULL |  | English name |
| `NameFR` | varchar(50) | NULL |  | French name |
| `iOrder` | smallint | NULL |  |  |
| `iFrom` | int | NULL |  | Integer field |
| `iTo` | int | NULL |  | Integer field |

### `UB_Def_PersonType`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | smallint | NOT NULL |  | Primary key, auto-increment identifier |
| `NameEN` | varchar(50) | NULL |  | English name |
| `NameFR` | varchar(50) | NULL |  | French name |
| `iOrder` | smallint | NULL |  |  |

### `UB_Def_PhoneType`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | smallint | NOT NULL |  | Primary key, auto-increment identifier |
| `NameEN` | varchar(50) | NULL |  | English name |
| `NameFR` | varchar(50) | NULL |  | French name |
| `iOrder` | smallint | NULL |  |  |

### `UB_Def_PriceStatus`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | tinyint | NOT NULL |  | Primary key, auto-increment identifier |
| `FSCode` | char(1) | NOT NULL |  |  |
| `NameEN` | varchar(80) | NULL |  | English name |
| `NameFR` | varchar(80) | NULL |  | French name |
| `iOrder` | tinyint | NULL |  | Small integer/flag field |

### `UB_Def_PriceType`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | tinyint | NOT NULL |  | Primary key, auto-increment identifier |
| `FSCode` | varchar(3) | NOT NULL |  |  |
| `NameEN` | varchar(50) | NULL |  | English name |
| `NameFR` | varchar(50) | NULL |  | French name |
| `LabelEN` | varchar(30) | NULL |  |  |
| `LabelFR` | varchar(30) | NULL |  |  |
| `iOrder` | tinyint | NULL |  | Small integer/flag field |

### `UB_Def_Priority`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | smallint | NOT NULL |  | Primary key, auto-increment identifier |
| `NameEN` | varchar(50) | NULL |  | English name |
| `NameFR` | varchar(50) | NULL |  | French name |
| `iOrder` | smallint | NULL |  |  |

### `UB_Def_Privacy`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | tinyint | NOT NULL |  | Primary key, auto-increment identifier |
| `NameEN` | varchar(50) | NOT NULL |  | English name |
| `NameFR` | varchar(50) | NOT NULL |  | French name |
| `iOrder` | tinyint | NOT NULL |  | Small integer/flag field |

### `UB_Def_PWOption`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | smallint | NOT NULL |  | Primary key, auto-increment identifier |
| `NameEN` | varchar(80) | NULL |  | English name |
| `NameFR` | varchar(80) | NULL |  | French name |
| `iOrder` | smallint | NULL |  |  |

### `UB_Def_PymtType`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `FSCode` | char(2) | NOT NULL |  |  |
| `NameEN` | varchar(80) | NULL |  | English name |
| `NameFR` | varchar(80) | NULL |  | French name |
| `iType` | tinyint | NULL |  | Type/category code |
| `iOrder` | int | NULL |  | Integer field |

### `UB_Def_Questionair`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iType` | smallint | NOT NULL |  | Type/category code |
| `iReg` | smallint | NOT NULL |  |  |
| `iStatus` | smallint | NOT NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `iOptions` | smallint | NOT NULL |  |  |
| `iOrder` | int | NULL |  | Integer field |
| `NameEN` | varchar(350) | NOT NULL |  | English name |
| `NameFR` | varchar(350) | NOT NULL |  | French name |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `iCreatedUserID` | int | NOT NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `dtLastModified` | datetime | NULL |  | Timestamp when record was last modified |
| `iLastModifiedUserID` | int | NOT NULL |  | FK to UB_MemberLogin - internal user who last modified this record |
| `iAML` | tinyint | NOT NULL |  | Small integer/flag field |
| `iPEFP` | tinyint | NOT NULL |  | Small integer/flag field |
| `iClientType` | tinyint | NOT NULL |  | Small integer/flag field |
| `iThirdParty` | tinyint | NULL |  | Small integer/flag field |
| `iPEDP` | tinyint | NULL |  | Small integer/flag field |
| `iHIO` | tinyint | NULL |  | Small integer/flag field |
| `iFamilyFlag` | tinyint | NULL |  | Small integer/flag field |
| `KeyCode` | varchar(50) | NULL |  |  |
| `iFlag` | int | NULL |  | Integer field |

### `UB_Def_QuestionairX`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iType` | tinyint | NULL |  | Type/category code |
| `iStatus` | tinyint | NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `NameEN` | varchar(350) | NULL |  | English name |
| `NameFR` | varchar(350) | NULL |  | French name |
| `iOrder` | int | NULL |  | Integer field |
| `TagName` | varchar(30) | NULL |  |  |

### `UB_Def_QuestionairXAnswer`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iQuestionID` | int | NULL |  | Integer field |
| `iStatus` | tinyint | NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `iAnswerValue` | tinyint | NULL |  | Small integer/flag field |
| `NameEN` | varchar(200) | NULL |  | English name |
| `NameFR` | varchar(200) | NULL |  | French name |
| `iOrder` | tinyint | NULL |  | Small integer/flag field |
| `iScore` | int | NULL |  | Integer field |

### `UB_Def_RDSPRel`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | smallint | NOT NULL |  | Primary key, auto-increment identifier |
| `FSCode` | char(2) | NOT NULL |  |  |
| `NameEN` | varchar(80) | NULL |  | English name |
| `NameFR` | varchar(80) | NULL |  | French name |
| `iOrder` | smallint | NULL |  |  |

### `UB_Def_ReceiptStatus`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | smallint | NOT NULL |  | Primary key, auto-increment identifier |
| `NameEN` | varchar(50) | NULL |  | English name |
| `NameFR` | varchar(50) | NULL |  | French name |
| `iOrder` | smallint | NULL |  |  |
| `iFlag` | tinyint | NULL |  | Small integer/flag field |

### `UB_Def_Relationship`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | smallint | NOT NULL |  | Primary key, auto-increment identifier |
| `FSCode` | varchar(2) | NULL |  |  |
| `NameEN` | varchar(50) | NULL |  | English name |
| `NameFR` | varchar(50) | NULL |  | French name |
| `iOrder` | smallint | NULL |  |  |
| `Gender` | char(1) | NULL |  |  |
| `iCRAValue` | smallint | NULL |  |  |

### `UB_Def_RelationshipTCP`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | smallint | NOT NULL |  | Primary key, auto-increment identifier |
| `FSCode` | varchar(2) | NULL |  |  |
| `NameEN` | varchar(50) | NULL |  | English name |
| `NameFR` | varchar(50) | NULL |  | French name |
| `iOrder` | smallint | NULL |  |  |
| `Gender` | char(1) | NULL |  |  |

### `UB_Def_RelationshipTo`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | smallint | NOT NULL |  | Primary key, auto-increment identifier |
| `FSCode` | varchar(2) | NULL |  |  |
| `NameEN` | varchar(50) | NULL |  | English name |
| `NameFR` | varchar(50) | NULL |  | French name |
| `iOrder` | smallint | NULL |  |  |

### `UB_Def_Report`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL |  | Primary key, auto-increment identifier |
| `iType` | tinyint | NULL |  | Type/category code |
| `NameEN` | varchar(100) | NULL |  | English name |
| `NameFR` | varchar(100) | NULL |  | French name |
| `iStatus` | tinyint | NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `iOrder` | tinyint | NULL |  | Small integer/flag field |
| `TitleEN` | varchar(100) | NULL |  |  |
| `TitleFR` | varchar(100) | NULL |  |  |
| `iShow` | tinyint | NULL |  | Small integer/flag field |
| `iExcludeTimeStamp` | tinyint | NULL |  | Small integer/flag field |
| `iExcludeXRate` | tinyint | NULL |  | Small integer/flag field |
| `iDisclaimerNewPage` | tinyint | NULL |  | Small integer/flag field |

### `UB_Def_ReportErrorReason`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `iReasonID` | int | NOT NULL |  | Integer field |
| `ReasonEN` | varchar(200) | NULL |  |  |
| `ReasonFR` | varchar(200) | NULL |  |  |

### `UB_Def_ReportFrequency`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | smallint | NOT NULL |  | Primary key, auto-increment identifier |
| `NameEN` | varchar(50) | NULL |  | English name |
| `NameFR` | varchar(50) | NULL |  | French name |
| `iOrder` | smallint | NULL |  |  |

### `UB_Def_ReportKYCDef`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `TopicCode` | varchar(50) | NULL |  |  |
| `iRecordType` | tinyint | NULL |  | Small integer/flag field |
| `iOrder` | smallint | NULL |  |  |
| `TitleEN` | varchar(100) | NULL |  |  |
| `TitleFR` | varchar(100) | NULL |  |  |
| `ContentEN` | varchar(max) | NULL |  |  |
| `ContentFR` | varchar(max) | NULL |  |  |
| `iTitleFontSize` | tinyint | NULL |  | Small integer/flag field |
| `iTitleFontStyle` | tinyint | NULL |  | Small integer/flag field |
| `iContentFontSize` | tinyint | NULL |  | Small integer/flag field |
| `iContentFontStyle` | tinyint | NULL |  | Small integer/flag field |
| `iBorder` | tinyint | NULL |  | Small integer/flag field |

### `UB_Def_ReportTypeClient`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | smallint | NOT NULL |  | Primary key, auto-increment identifier |
| `NameEN` | varchar(80) | NULL |  | English name |
| `NameFR` | varchar(80) | NULL |  | French name |
| `iOrder` | smallint | NULL |  |  |

### `UB_Def_RESP_001`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `FieldName` | varchar(50) | NOT NULL |  | Field name reference |
| `SPParamName` | varchar(50) | NULL |  |  |
| `iStartPos` | smallint | NOT NULL |  |  |
| `iEndPos` | smallint | NOT NULL |  |  |
| `iAlign` | tinyint | NULL |  | Small integer/flag field |
| `FormatStr` | varchar(50) | NULL |  |  |

### `UB_Def_RESP_002`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `FieldName` | varchar(50) | NOT NULL |  | Field name reference |
| `SPParamName` | varchar(50) | NULL |  |  |
| `iStartPos` | smallint | NOT NULL |  |  |
| `iEndPos` | smallint | NOT NULL |  |  |
| `iAlign` | tinyint | NULL |  | Small integer/flag field |
| `FormatStr` | varchar(50) | NULL |  |  |

### `UB_Def_RESP_003`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `FieldName` | varchar(50) | NOT NULL |  | Field name reference |
| `SPParamName` | varchar(50) | NULL |  |  |
| `iStartPos` | smallint | NOT NULL |  |  |
| `iEndPos` | smallint | NOT NULL |  |  |
| `iAlign` | tinyint | NULL |  | Small integer/flag field |
| `FormatStr` | varchar(50) | NULL |  |  |

### `UB_Def_RESP_100`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `FieldName` | varchar(50) | NOT NULL |  | Field name reference |
| `SPParamName` | varchar(50) | NULL |  |  |
| `iStartPos` | smallint | NOT NULL |  |  |
| `iEndPos` | smallint | NOT NULL |  |  |
| `iAlign` | tinyint | NULL |  | Small integer/flag field |
| `FormatStr` | varchar(50) | NULL |  |  |

### `UB_Def_RESP_200`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `FieldName` | varchar(50) | NOT NULL |  | Field name reference |
| `SPParamName` | varchar(50) | NULL |  |  |
| `iStartPos` | smallint | NOT NULL |  |  |
| `iEndPos` | smallint | NOT NULL |  |  |
| `iAlign` | tinyint | NULL |  | Small integer/flag field |
| `FormatStr` | varchar(50) | NULL |  |  |

### `UB_Def_RESP_400`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `FieldName` | varchar(50) | NOT NULL |  | Field name reference |
| `SPParamName` | varchar(50) | NULL |  |  |
| `iStartPos` | smallint | NOT NULL |  |  |
| `iEndPos` | smallint | NOT NULL |  |  |
| `iAlign` | tinyint | NULL |  | Small integer/flag field |
| `FormatStr` | varchar(50) | NULL |  |  |

### `UB_Def_RESP_410`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `FieldName` | varchar(50) | NOT NULL |  | Field name reference |
| `SPParamName` | varchar(50) | NULL |  |  |
| `iStartPos` | smallint | NOT NULL |  |  |
| `iEndPos` | smallint | NOT NULL |  |  |
| `iAlign` | tinyint | NULL |  | Small integer/flag field |
| `FormatStr` | varchar(50) | NULL |  |  |

### `UB_Def_RESP_411`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `FieldName` | varchar(50) | NOT NULL |  | Field name reference |
| `SPParamName` | varchar(50) | NULL |  |  |
| `iStartPos` | smallint | NOT NULL |  |  |
| `iEndPos` | smallint | NOT NULL |  |  |
| `iAlign` | tinyint | NULL |  | Small integer/flag field |
| `FormatStr` | varchar(50) | NULL |  |  |

### `UB_Def_RESP_511`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `FieldName` | varchar(50) | NOT NULL |  | Field name reference |
| `SPParamName` | varchar(50) | NULL |  |  |
| `iStartPos` | smallint | NOT NULL |  |  |
| `iEndPos` | smallint | NOT NULL |  |  |
| `iAlign` | tinyint | NULL |  | Small integer/flag field |
| `FormatStr` | varchar(50) | NULL |  |  |

### `UB_Def_RESP_700`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `FieldName` | varchar(50) | NOT NULL |  | Field name reference |
| `SPParamName` | varchar(50) | NULL |  |  |
| `iStartPos` | smallint | NOT NULL |  |  |
| `iEndPos` | smallint | NOT NULL |  |  |
| `iAlign` | tinyint | NULL |  | Small integer/flag field |
| `FormatStr` | varchar(50) | NULL |  |  |

### `UB_Def_RESP_800`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `FieldName` | varchar(50) | NOT NULL |  | Field name reference |
| `SPParamName` | varchar(50) | NULL |  |  |
| `iStartPos` | smallint | NOT NULL |  |  |
| `iEndPos` | smallint | NOT NULL |  |  |
| `iAlign` | tinyint | NULL |  | Small integer/flag field |
| `FormatStr` | varchar(50) | NULL |  |  |

### `UB_Def_RESP_900`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `FieldName` | varchar(50) | NOT NULL |  | Field name reference |
| `SPParamName` | varchar(50) | NULL |  |  |
| `iStartPos` | smallint | NOT NULL |  |  |
| `iEndPos` | smallint | NOT NULL |  |  |
| `iAlign` | tinyint | NULL |  | Small integer/flag field |
| `FormatStr` | varchar(50) | NULL |  |  |

### `UB_Def_RESP_910`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `FieldName` | varchar(50) | NOT NULL |  | Field name reference |
| `SPParamName` | varchar(50) | NULL |  |  |
| `iStartPos` | smallint | NOT NULL |  |  |
| `iEndPos` | smallint | NOT NULL |  |  |
| `iAlign` | tinyint | NULL |  | Small integer/flag field |
| `FormatStr` | varchar(50) | NULL |  |  |

### `UB_Def_RESP_911`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `FieldName` | varchar(50) | NOT NULL |  | Field name reference |
| `SPParamName` | varchar(50) | NULL |  |  |
| `iStartPos` | smallint | NOT NULL |  |  |
| `iEndPos` | smallint | NOT NULL |  |  |
| `iAlign` | tinyint | NULL |  | Small integer/flag field |
| `FormatStr` | varchar(50) | NULL |  |  |

### `UB_Def_RESP_950`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `FieldName` | varchar(50) | NOT NULL |  | Field name reference |
| `SPParamName` | varchar(50) | NULL |  |  |
| `iStartPos` | smallint | NOT NULL |  |  |
| `iEndPos` | smallint | NOT NULL |  |  |
| `iAlign` | tinyint | NULL |  | Small integer/flag field |
| `FormatStr` | varchar(50) | NULL |  |  |

### `UB_Def_RESP_CESGRejectReason`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `FSCode` | char(1) | NOT NULL |  |  |
| `NameEN` | varchar(80) | NULL |  | English name |
| `NameFR` | varchar(80) | NULL |  | French name |
| `iOrder` | int | NULL |  | Integer field |

### `UB_Def_RESP_Error`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `FSCode` | varchar(9) | NOT NULL |  |  |
| `NameEN` | varchar(200) | NULL |  | English name |
| `NameFR` | varchar(200) | NULL |  | French name |
| `iOrder` | int | NULL |  | Integer field |

### `UB_Def_RESP_IncentiveType`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | smallint | NOT NULL |  | Primary key, auto-increment identifier |
| `FSCode` | varchar(8) | NULL |  |  |
| `NameEN` | varchar(80) | NULL |  | English name |
| `NameFR` | varchar(80) | NULL |  | French name |
| `Province` | char(2) | NULL |  |  |
| `iOrder` | smallint | NULL |  |  |

### `UB_Def_RESP_TrxOrigin`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `FSCode` | char(1) | NOT NULL |  |  |
| `NameEN` | varchar(80) | NULL |  | English name |
| `NameFR` | varchar(80) | NULL |  | French name |
| `iOrder` | int | NULL |  | Integer field |

### `UB_Def_RESP_TrxType`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | smallint | NOT NULL |  | Primary key, auto-increment identifier |
| `iRecordType` | int | NULL |  | Integer field |
| `iTrxType` | int | NULL |  | Integer field |
| `NameEN` | varchar(80) | NULL |  | English name |
| `NameFR` | varchar(80) | NULL |  | French name |
| `iOrder` | smallint | NULL |  |  |

### `UB_Def_RevenueThreshold`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `iMinEarning` | int | NOT NULL |  | Integer field |

### `UB_Def_RIFPaymentOpt`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | smallint | NOT NULL |  | Primary key, auto-increment identifier |
| `NameEN` | varchar(50) | NULL |  | English name |
| `NameFR` | varchar(50) | NULL |  | French name |
| `iOrder` | smallint | NULL |  |  |
| `iClientName` | tinyint | NULL |  | Small integer/flag field |
| `iNominee` | tinyint | NULL |  | Small integer/flag field |
| `iIntermediary` | tinyint | NULL |  | Small integer/flag field |
| `iStatus` | tinyint | NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |

### `UB_Def_Risk`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | smallint | NOT NULL |  | Primary key, auto-increment identifier |
| `FSCode` | char(1) | NULL |  |  |
| `NameEN` | varchar(50) | NULL |  | English name |
| `NameFR` | varchar(50) | NULL |  | French name |
| `iOrder` | smallint | NULL |  |  |
| `NameENShort` | char(3) | NULL |  |  |
| `NameFRShort` | char(3) | NULL |  |  |
| `FSCodeV28` | char(1) | NULL |  |  |

### `UB_Def_RoR`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL |  | Primary key, auto-increment identifier |
| `iType` | tinyint | NULL |  | Type/category code |
| `NameEN` | varchar(100) | NULL |  | English name |
| `NameFR` | varchar(100) | NULL |  | French name |
| `iOrder` | tinyint | NULL |  | Small integer/flag field |

### `UB_Def_RRIFProcessingError`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | smallint | NOT NULL |  | Primary key, auto-increment identifier |
| `NameEN` | varchar(80) | NULL |  | English name |
| `NameFR` | varchar(80) | NULL |  | French name |

### `UB_Def_SegGMWBPeriod`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | smallint | NOT NULL |  | Primary key, auto-increment identifier |
| `FSCode` | char(1) | NOT NULL |  |  |
| `NameEN` | varchar(30) | NULL |  | English name |
| `NameFR` | varchar(30) | NULL |  | French name |
| `iOrder` | smallint | NULL |  |  |

### `UB_Def_Sex`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | smallint | NOT NULL |  | Primary key, auto-increment identifier |
| `FSCode` | char(1) | NULL |  |  |
| `NameEN` | varchar(20) | NULL |  | English name |
| `NameFR` | varchar(20) | NULL |  | French name |
| `iOrder` | smallint | NULL |  |  |

### `UB_Def_SignorityEnvelopeRecipientStatus`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL |  | Primary key, auto-increment identifier |
| `FSCode` | varchar(30) | NOT NULL |  |  |
| `NameEN` | varchar(50) | NOT NULL |  | English name |
| `NameFR` | varchar(50) | NOT NULL |  | French name |
| `iOrder` | smallint | NOT NULL |  |  |

### `UB_Def_StartPage`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | varchar(50) | NOT NULL |  | Primary key, auto-increment identifier |
| `iType` | tinyint | NULL |  | Type/category code |
| `NameEN` | varchar(80) | NULL |  | English name |
| `NameFR` | varchar(80) | NULL |  | French name |
| `iOrder` | tinyint | NULL |  | Small integer/flag field |

### `UB_Def_StatementType`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | smallint | NOT NULL |  | Primary key, auto-increment identifier |
| `NameEN` | varchar(80) | NULL |  | English name |
| `NameFR` | varchar(80) | NULL |  | French name |
| `iOrder` | smallint | NULL |  |  |

### `UB_Def_StaticText`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `KeyStr` | varchar(50) | NOT NULL |  |  |
| `ContentEN` | varchar(400) | NULL |  |  |
| `ContentFR` | varchar(400) | NULL |  |  |

### `UB_Def_StmtDeliveryMethod`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | smallint | NOT NULL |  | Primary key, auto-increment identifier |
| `NameEN` | varchar(40) | NULL |  | English name |
| `NameFR` | varchar(40) | NULL |  | French name |
| `iOrder` | smallint | NULL |  |  |

### `UB_Def_StockFeeOpt`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | smallint | NOT NULL |  | Primary key, auto-increment identifier |
| `NameEN` | varchar(40) | NULL |  | English name |
| `NameFR` | varchar(40) | NULL |  | French name |
| `iOrder` | smallint | NULL |  |  |

### `UB_Def_StockMarket`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `Code` | varchar(6) | NOT NULL |  |  |
| `NameEN` | varchar(80) | NULL |  | English name |
| `NameFR` | varchar(80) | NULL |  | French name |

### `UB_Def_StockOrderType`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | smallint | NOT NULL |  | Primary key, auto-increment identifier |
| `FSCode` | char(1) | NOT NULL |  |  |
| `NameEN` | varchar(40) | NULL |  | English name |
| `NameFR` | varchar(40) | NULL |  | French name |
| `iOrder` | smallint | NULL |  |  |

### `UB_Def_StockSide`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | smallint | NOT NULL |  | Primary key, auto-increment identifier |
| `FSCode` | char(1) | NOT NULL |  |  |
| `NameEN` | varchar(40) | NULL |  | English name |
| `NameFR` | varchar(40) | NULL |  | French name |
| `iOrder` | smallint | NULL |  |  |

### `UB_Def_StockTimeInForce`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | smallint | NOT NULL |  | Primary key, auto-increment identifier |
| `FSCode` | char(1) | NOT NULL |  |  |
| `NameEN` | varchar(40) | NULL |  | English name |
| `NameFR` | varchar(40) | NULL |  | French name |
| `iOrder` | smallint | NULL |  |  |

### `UB_Def_Suitability`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | smallint | NOT NULL |  | Primary key, auto-increment identifier |
| `NameEN` | varchar(20) | NULL |  | English name |
| `NameFR` | varchar(20) | NULL |  | French name |
| `iOrder` | smallint | NULL |  |  |

### `UB_Def_SysPlanStatus`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | smallint | NOT NULL |  | Primary key, auto-increment identifier |
| `FSCode` | char(1) | NOT NULL |  |  |
| `NameEN` | varchar(30) | NULL |  | English name |
| `NameFR` | varchar(30) | NULL |  | French name |
| `iOrder` | smallint | NULL |  |  |

### `UB_Def_Table`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL |  | Primary key, auto-increment identifier |
| `GroupName` | varchar(50) | NULL |  |  |
| `TableName` | varchar(50) | NULL |  |  |
| `ColumnName` | varchar(50) | NULL |  |  |
| `DescriptionEN` | varchar(100) | NULL |  |  |
| `DescriptionFR` | varchar(100) | NULL |  |  |
| `FieldType` | varchar(10) | NULL |  |  |
| `FunctionStr` | varchar(50) | NULL |  |  |
| `bKYC` | tinyint | NULL |  |  |

### `UB_Def_TaxAction`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | smallint | NOT NULL |  | Primary key, auto-increment identifier |
| `FSCode` | char(1) | NOT NULL |  |  |
| `NameEN` | varchar(50) | NULL |  | English name |
| `NameFR` | varchar(50) | NULL |  | French name |
| `iOrder` | smallint | NULL |  |  |

### `UB_Def_TaxEventInd`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | tinyint | NOT NULL |  | Primary key, auto-increment identifier |
| `FSCode` | char(1) | NOT NULL |  |  |
| `NameEN` | varchar(40) | NULL |  | English name |
| `NameFR` | varchar(40) | NULL |  | French name |
| `iOrder` | tinyint | NULL |  | Small integer/flag field |

### `UB_Def_TimeHorizon`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | smallint | NOT NULL |  | Primary key, auto-increment identifier |
| `NameEN` | varchar(50) | NULL |  | English name |
| `NameFR` | varchar(50) | NULL |  | French name |
| `iOrder` | smallint | NULL |  |  |
| `iFrom` | tinyint | NULL |  | Small integer/flag field |
| `iTo` | tinyint | NULL |  | Small integer/flag field |

### `UB_Def_TotalInvestment`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | smallint | NOT NULL |  | Primary key, auto-increment identifier |
| `NameEN` | varchar(50) | NULL |  | English name |
| `NameFR` | varchar(50) | NULL |  | French name |
| `iOrder` | smallint | NULL |  |  |

### `UB_Def_TransferStatus`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | smallint | NOT NULL |  | Primary key, auto-increment identifier |
| `NameEN` | varchar(20) | NULL |  | English name |
| `NameFR` | varchar(20) | NULL |  | French name |
| `iOrder` | smallint | NULL |  |  |

### `UB_Def_TransferType`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | smallint | NOT NULL |  | Primary key, auto-increment identifier |
| `NameEN` | varchar(150) | NULL |  | English name |
| `NameFR` | varchar(150) | NULL |  | French name |
| `iOrder` | smallint | NULL |  |  |

### `UB_Def_TrnsfRemiderCategory`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | smallint | NOT NULL |  | Primary key, auto-increment identifier |
| `NameEN` | varchar(50) | NULL |  | English name |
| `NameFR` | varchar(50) | NULL |  | French name |
| `iOrder` | smallint | NULL |  |  |

### `UB_Def_TrustDepositType`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | smallint | NOT NULL |  | Primary key, auto-increment identifier |
| `NameEN` | varchar(80) | NULL |  | English name |
| `NameFR` | varchar(80) | NULL |  | French name |
| `iOrder` | smallint | NULL |  |  |
| `iReceiptID` | smallint | NULL |  |  |

### `UB_Def_TrusteeFeeAmount`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | smallint | NOT NULL |  | Primary key, auto-increment identifier |
| `NameEN` | varchar(30) | NOT NULL |  | English name |
| `NameFR` | varchar(30) | NOT NULL |  | French name |
| `iOrder` | smallint | NOT NULL |  |  |

### `UB_Def_TrustStatus`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | smallint | NOT NULL |  | Primary key, auto-increment identifier |
| `NameEN` | varchar(20) | NULL |  | English name |
| `NameFR` | varchar(20) | NULL |  | French name |
| `iOrder` | smallint | NULL |  |  |

### `UB_Def_TrustType`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | smallint | NOT NULL |  | Primary key, auto-increment identifier |
| `NameEN` | varchar(80) | NULL |  | English name |
| `NameFR` | varchar(80) | NULL |  | French name |
| `iOrder` | smallint | NULL |  |  |
| `iFlag` | tinyint | NULL |  | Small integer/flag field |
| `iCashTrxType` | int | NULL |  | Integer field |

### `UB_Def_TrustType2`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | smallint | NOT NULL |  | Primary key, auto-increment identifier |
| `NameEN` | varchar(80) | NULL |  | English name |
| `NameFR` | varchar(80) | NULL |  | French name |
| `iOrder` | smallint | NULL |  |  |

### `UB_Def_TrustTypeX`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iTrustTypeID` | smallint | NOT NULL |  |  |
| `SourceCode` | char(1) | NULL |  |  |
| `NameEN` | varchar(80) | NULL |  | English name |
| `NameFR` | varchar(80) | NULL |  | French name |
| `iOrder` | smallint | NULL |  |  |

### `UB_Def_TrxActionCode`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | smallint | NOT NULL |  | Primary key, auto-increment identifier |
| `FSCode` | varchar(3) | NULL |  |  |
| `NameEN` | varchar(20) | NULL |  | English name |
| `NameFR` | varchar(20) | NULL |  | French name |
| `iOrder` | smallint | NULL |  |  |

### `UB_Def_TrxAmtType`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | tinyint | NOT NULL |  | Primary key, auto-increment identifier |
| `FSCode` | char(1) | NOT NULL |  |  |
| `NameEN` | varchar(80) | NOT NULL |  | English name |
| `NameFR` | varchar(80) | NOT NULL |  | French name |
| `iOrder` | tinyint | NOT NULL |  | Small integer/flag field |

### `UB_Def_TrxCertificateOpt`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | tinyint | NOT NULL |  | Primary key, auto-increment identifier |
| `NameEN` | varchar(80) | NULL |  | English name |
| `NameFR` | varchar(80) | NULL |  | French name |
| `iOrder` | tinyint | NULL |  | Small integer/flag field |
| `FSCode` | char(1) | NULL |  |  |

### `UB_Def_TrxDilutionInd`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | tinyint | NOT NULL |  | Primary key, auto-increment identifier |
| `FSCode` | char(1) | NOT NULL |  |  |
| `NameEN` | varchar(40) | NULL |  | English name |
| `NameFR` | varchar(40) | NULL |  | French name |
| `iOrder` | tinyint | NULL |  | Small integer/flag field |

### `UB_Def_TrxFeeType`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | smallint | NOT NULL |  | Primary key, auto-increment identifier |
| `FSCode` | char(2) | NOT NULL |  |  |
| `NameEN` | varchar(80) | NULL |  | English name |
| `NameFR` | varchar(80) | NULL |  | French name |
| `iOrder` | smallint | NULL |  |  |

### `UB_Def_TrxOrderSource`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | tinyint | NOT NULL |  | Primary key, auto-increment identifier |
| `FSCode` | char(1) | NOT NULL |  |  |
| `NameEN` | varchar(40) | NULL |  | English name |
| `NameFR` | varchar(40) | NULL |  | French name |
| `iOrder` | tinyint | NULL |  | Small integer/flag field |

### `UB_Def_TrxOrderStatus`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | smallint | NOT NULL |  | Primary key, auto-increment identifier |
| `iStatusID` | smallint | NOT NULL |  | Status code (specific to this context) |
| `NameEN` | varchar(50) | NOT NULL |  | English name |
| `NameFR` | varchar(50) | NOT NULL |  | French name |
| `bClientReport` | bit | NULL |  |  |
| `iOrder` | smallint | NOT NULL |  |  |

### `UB_Def_TrxOrderType`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | smallint | NOT NULL |  | Primary key, auto-increment identifier |
| `FSCode` | char(1) | NOT NULL |  |  |
| `NameEN` | varchar(20) | NOT NULL |  | English name |
| `NameFR` | varchar(20) | NOT NULL |  | French name |
| `iOrder` | smallint | NOT NULL |  |  |
| `bComplianceWire` | bit | NOT NULL |  |  |

### `UB_Def_TrxRecordType`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | smallint | NOT NULL |  | Primary key, auto-increment identifier |
| `FSCode` | char(3) | NOT NULL |  |  |
| `NameEN` | varchar(80) | NULL |  | English name |
| `NameFR` | varchar(80) | NULL |  | French name |
| `iOrder` | smallint | NULL |  |  |

### `UB_Def_TrxResponseSource`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | tinyint | NOT NULL |  | Primary key, auto-increment identifier |
| `FSCode` | char(1) | NOT NULL |  |  |
| `NameEN` | varchar(40) | NOT NULL |  | English name |
| `NameFR` | varchar(40) | NOT NULL |  | French name |
| `iOrder` | tinyint | NOT NULL |  | Small integer/flag field |

### `UB_Def_TrxSettlementInd`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | tinyint | NOT NULL |  | Primary key, auto-increment identifier |
| `FSCode` | char(1) | NOT NULL |  |  |
| `NameEN` | varchar(40) | NULL |  | English name |
| `NameFR` | varchar(40) | NULL |  | French name |
| `iOrder` | tinyint | NULL |  | Small integer/flag field |

### `UB_Def_TrxSettlementMethod`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | tinyint | NOT NULL |  | Primary key, auto-increment identifier |
| `FSCode` | char(1) | NOT NULL |  |  |
| `iStatus` | tinyint | NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `NameEN` | varchar(40) | NULL |  | English name |
| `NameFR` | varchar(40) | NULL |  | French name |
| `iOrder` | tinyint | NULL |  | Small integer/flag field |

### `UB_Def_TrxSettlementSource`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | tinyint | NOT NULL |  | Primary key, auto-increment identifier |
| `FSCode` | char(1) | NOT NULL |  |  |
| `NameEN` | varchar(40) | NULL |  | English name |
| `NameFR` | varchar(40) | NULL |  | French name |
| `iOrder` | tinyint | NULL |  | Small integer/flag field |

### `UB_Def_TrxSettlementStatus`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | tinyint | NOT NULL |  | Primary key, auto-increment identifier |
| `FSCode` | char(1) | NOT NULL |  |  |
| `NameEN` | varchar(80) | NULL |  | English name |
| `NameFR` | varchar(80) | NULL |  | French name |
| `iOrder` | tinyint | NULL |  | Small integer/flag field |

### `UB_Def_TrxStatus`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | smallint | NOT NULL |  | Primary key, auto-increment identifier |
| `NameEN` | varchar(20) | NULL |  | English name |
| `NameFR` | varchar(20) | NULL |  | French name |
| `iOrder` | smallint | NULL |  |  |

### `UB_Def_TrxType`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | smallint | NOT NULL |  | Primary key, auto-increment identifier |
| `Type` | char(1) | NOT NULL |  |  |
| `TypeDetail` | char(1) | NOT NULL |  |  |
| `iPlanCount` | tinyint | NULL |  | Small integer/flag field |
| `ProdEventInd` | varchar(2) | NOT NULL |  |  |
| `bNegative` | tinyint | NULL |  |  |
| `NameEN` | varchar(120) | NULL |  | English name |
| `NameFR` | varchar(120) | NULL |  | French name |
| `iOrder` | smallint | NULL |  |  |
| `bClientReport` | tinyint | NULL |  |  |
| `bIncludeROR` | tinyint | NULL |  |  |
| `bCompliance` | tinyint | NULL |  |  |
| `bAF` | tinyint | NULL |  |  |
| `bAT` | tinyint | NULL |  |  |
| `bAW` | tinyint | NULL |  |  |
| `bAG` | tinyint | NULL |  |  |
| `bTFS` | tinyint | NULL |  |  |
| `AmountType` | varchar(50) | NULL |  |  |
| `bOrder` | tinyint | NULL |  |  |
| `bCharge` | tinyint | NULL |  |  |
| `iCashTrxType` | smallint | NULL |  |  |
| `iDays` | smallint | NULL |  |  |
| `iConfirmation` | tinyint | NULL |  | Small integer/flag field |

### `UB_Def_UniformityField`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL |  | Primary key, auto-increment identifier |
| `NameEN` | varchar(150) | NULL |  | English name |
| `NameFR` | varchar(150) | NULL |  | French name |
| `iFieldID` | int | NULL |  | Integer field |
| `iSubFieldID1` | int | NULL |  | Integer field |
| `iSubFieldID2` | int | NULL |  | Integer field |
| `iSubFieldID3` | int | NULL |  | Integer field |
| `iStatus` | int | NOT NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |

### `UB_Def_UserDef`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `DSID` | int | NULL |  |  |
| `iType` | smallint | NULL |  | Type/category code |
| `NameEN` | varchar(40) | NULL |  | English name |
| `NameFR` | varchar(40) | NULL |  | French name |
| `iOrder` | int | NULL |  | Integer field |
| `iStatus` | tinyint | NOT NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `iCreatedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `dtLastModified` | datetime | NULL |  | Timestamp when record was last modified |
| `iLastModifiedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who last modified this record |

### `UB_Def_ViewColumn`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `ViewID` | varchar(50) | NOT NULL |  |  |
| `ColumnID` | varchar(100) | NOT NULL |  |  |
| `iColSpan` | tinyint | NOT NULL |  | Small integer/flag field |
| `NameEN` | varchar(100) | NOT NULL |  | English name |
| `NameFR` | varchar(100) | NOT NULL |  | French name |
| `iShow` | tinyint | NOT NULL |  | Small integer/flag field |
| `iSize` | smallint | NOT NULL |  |  |
| `iAlign` | tinyint | NOT NULL |  | Small integer/flag field |
| `iOrder` | int | NOT NULL |  | Integer field |
| `iType` | tinyint | NULL |  | Type/category code |
| `iSortable` | tinyint | NULL |  | Small integer/flag field |
| `iTable` | tinyint | NULL |  | Small integer/flag field |
| `iDuplicate` | tinyint | NULL |  | Small integer/flag field |
| `iTotal` | tinyint | NULL |  | Small integer/flag field |

### `UB_Def_Volatility`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | smallint | NOT NULL |  | Primary key, auto-increment identifier |
| `NameEN` | varchar(50) | NULL |  | English name |
| `NameFR` | varchar(50) | NULL |  | French name |
| `iOrder` | smallint | NULL |  |  |

### `UB_Def_WebClientStatus`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | smallint | NOT NULL |  | Primary key, auto-increment identifier |
| `NameEN` | varchar(80) | NULL |  | English name |
| `NameFR` | varchar(80) | NULL |  | French name |
| `iOrder` | smallint | NULL |  |  |

### `UB_Def_WeekDay`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL |  | Primary key, auto-increment identifier |
| `NameEN` | varchar(50) | NULL |  | English name |
| `NameFR` | varchar(50) | NULL |  | French name |
| `iOrder` | int | NULL |  | Integer field |

### `UB_DefReportDef`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | smallint | NOT NULL |  | Primary key, auto-increment identifier |
| `NameEN` | varchar(30) | NULL |  | English name |
| `NameFR` | varchar(30) | NULL |  | French name |
| `iOrder` | smallint | NULL |  |  |

---

## Development/Testing

### `AAA_Log`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `LogStr` | varchar(max) | NULL |  | Log string/message |

### `AAA_TEMP`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NULL |  | Primary key, auto-increment identifier |
| `FieldName` | varchar(100) | NULL |  | Field name reference |
| `NameEN` | varchar(200) | NULL |  | English name |
| `NameFR` | varchar(200) | NULL |  | French name |

### `AAA_Test`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `dtTrade` | datetime | NULL |  | Trade date |
| `mAmount` | float | NULL |  | Monetary amount |

### `AAA_Test2`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `dtTrade` | datetime | NULL |  | Trade date |
| `mAmount` | float | NULL |  | Monetary amount |

### `AAAADummy`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `aaaaa` | varchar(50) | NULL |  |  |

### `AAACustomerLogin`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iClientID` | int | NOT NULL |  | FK to UB_Client table - identifies the client/investor |
| `LoginID` | varchar(50) | NOT NULL |  | Login username |
| `EncPW` | varchar(100) | NULL |  | Encrypted/hashed password |
| `iStatus` | tinyint | NOT NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `iPWStatus` | tinyint | NOT NULL |  | Password status code |
| `iMaxLoginAllow` | tinyint | NOT NULL |  | Maximum allowed login attempts before lockout |
| `iTryCount` | tinyint | NOT NULL |  | Current failed login attempt count |
| `dtCreated` | datetime | NOT NULL |  | Timestamp when record was created |
| `iCreatedUserID` | int | NOT NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `dtLastModified` | datetime | NOT NULL |  | Timestamp when record was last modified |
| `iLastModifiedUserID` | int | NOT NULL |  | FK to UB_MemberLogin - internal user who last modified this record |
| `dtLastLoginOK` | datetime | NULL |  | Last successful login timestamp |
| `dtLastLoginTry` | datetime | NULL |  | Last login attempt timestamp |
| `dtLastPW` | datetime | NULL |  | Last password change timestamp |
| `dtEffective` | datetime | NULL |  | Effective date |
| `WFPassword` | varchar(100) | NULL |  | Encrypted/hashed password |

---

## FundServ Configuration

### `UB_FS_AA_ARC`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL |  | Primary key, auto-increment identifier |
| `iFileID` | int | NOT NULL |  | FK to file record (FundServ file) |
| `iSysID` | int | NULL |  | Integer field |
| `dtSystem` | datetime | NULL |  | Date/time field |
| `iLineNumber` | int | NULL |  | Integer field |
| `iUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `iImportStatus` | tinyint | NULL |  | Small integer/flag field |
| `MgmtCode_H` | varchar(3) | NULL |  |  |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `dtEffective` | datetime | NULL |  | Effective date |
| `MgmtCompanySpec_H` | varchar(3) | NULL |  |  |
| `Version` | varchar(2) | NULL |  |  |
| `iRecLen` | int | NULL |  | Integer field |
| `MgmtCode` | varchar(4) | NULL |  | Management company code |
| `FundID` | varchar(5) | NULL |  | Fund identifier code (e.g., DYN 3056) |
| `FundAccountID` | varchar(15) | NULL |  |  |
| `DealerAccountID` | varchar(15) | NULL |  |  |
| `RepCode` | varchar(5) | NULL |  | Representative/advisor code |
| `AccountDesig` | char(1) | NULL |  |  |
| `AccountType` | char(2) | NULL |  |  |
| `AccountStatus` | char(1) | NULL |  |  |
| `dtAccCreationDate` | datetime | NULL |  | Date/time field |
| `TaxCode` | varchar(3) | NULL |  |  |
| `RecipientCode` | char(1) | NULL |  |  |
| `AddressCode1` | char(1) | NULL |  |  |
| `TitleCode1` | char(1) | NULL |  |  |
| `LastName1` | varchar(20) | NULL |  |  |
| `FirstName1` | varchar(20) | NULL |  |  |
| `AddressLine1_1` | varchar(40) | NULL |  |  |
| `AddressLine2_1` | varchar(40) | NULL |  |  |
| `AddressLine3_1` | varchar(40) | NULL |  |  |
| `TrustTitleCode` | char(1) | NULL |  |  |
| `TrustLastName` | varchar(20) | NULL |  |  |
| `TrustFirstName` | varchar(20) | NULL |  |  |
| `TaxCalcDOBFlag` | char(1) | NULL |  |  |
| `iEstateFlag` | tinyint | NULL |  | Small integer/flag field |
| `dtBenDOB` | datetime | NULL |  | Date/time field |
| `BenSIN` | varchar(9) | NULL |  |  |
| `JointSignatureType` | char(1) | NULL |  |  |
| `City1` | varchar(30) | NULL |  |  |
| `Province1` | varchar(2) | NULL |  |  |
| `CountryCode1` | varchar(3) | NULL |  |  |
| `PostalCode1` | varchar(10) | NULL |  |  |
| `iRetMailIndicator1` | tinyint | NULL |  | Small integer/flag field |
| `LanguageCode` | char(1) | NULL |  |  |
| `AddressCode2` | char(1) | NULL |  |  |
| `TitleCode2` | char(1) | NULL |  |  |
| `LastName2` | varchar(20) | NULL |  |  |
| `FirstName2` | varchar(20) | NULL |  |  |
| `AddressLine1_2` | varchar(40) | NULL |  |  |
| `AddressLine2_2` | varchar(40) | NULL |  |  |
| `AddressLine3_2` | varchar(40) | NULL |  |  |
| `City2` | varchar(30) | NULL |  |  |
| `Province2` | varchar(2) | NULL |  |  |
| `CountryCode2` | varchar(3) | NULL |  |  |
| `PostalCode2` | varchar(10) | NULL |  |  |
| `iRetMailIndicator2` | tinyint | NULL |  | Small integer/flag field |
| `dtBenOwnerDOB` | datetime | NULL |  | Date/time field |
| `BenOwnerSIN` | varchar(9) | NULL |  |  |
| `iSpousalFlag` | tinyint | NULL |  | Small integer/flag field |
| `JointSpousalSIN` | varchar(9) | NULL |  |  |
| `JointSpousalTitleCode` | char(1) | NULL |  |  |
| `JointSpousalLastName` | varchar(20) | NULL |  |  |
| `JointSpousalFirstName` | varchar(20) | NULL |  |  |
| `fTotalUnissued` | float | NULL |  | Decimal/float value |
| `fTotalIssued` | float | NULL |  | Decimal/float value |
| `SystematicIndicator` | char(1) | NULL |  |  |
| `dtSystematicStartDate` | datetime | NULL |  | Date/time field |
| `dtSystematicStopDate` | datetime | NULL |  | Date/time field |
| `dtSystematicRestartDate` | datetime | NULL |  | Date/time field |
| `SystematicFrequency` | char(1) | NULL |  |  |
| `mSystematicAmount` | money | NULL |  |  |
| `fSystematicCommissionPer` | float | NULL |  | Decimal/float value |
| `DividendOption` | char(1) | NULL |  |  |
| `MngtCompanySpecific` | varchar(36) | NULL |  |  |
| `GroupIdentifier` | varchar(15) | NULL |  |  |
| `IntCode` | varchar(4) | NULL |  |  |
| `IntermediaryAccID` | varchar(15) | NULL |  |  |
| `DealerCode` | varchar(4) | NULL |  | Dealer code identifier |
| `AddressCode3` | varchar(40) | NULL |  |  |
| `AdditionalInfo` | varchar(40) | NULL |  |  |
| `iLockedInCode` | tinyint | NULL |  | Small integer/flag field |
| `mAverageCostFC` | money | NULL |  |  |
| `GroupFlag` | char(1) | NULL |  |  |
| `JointSurvivorType` | char(1) | NULL |  |  |
| `iInTrustForFlag` | tinyint | NULL |  | Small integer/flag field |
| `dtJointSpousalDOB` | datetime | NULL |  | Date/time field |
| `iStatusClient` | tinyint | NULL |  | Status code (specific to this context) |
| `iStatusPlan` | tinyint | NULL |  | Status code (specific to this context) |
| `iStatusAccount` | tinyint | NULL |  | Status code (specific to this context) |
| `iStatusAccountPos` | tinyint | NULL |  | Status code (specific to this context) |
| `iFundAccountID` | int | NULL |  | Integer field |
| `iFundAccountPosID` | int | NULL |  | Integer field |
| `iPlanID` | int | NULL |  | FK to UB_Plan table - identifies the investment plan/account |
| `iClientID` | int | NULL |  | FK to UB_Client table - identifies the client/investor |
| `iClientID2` | int | NULL |  | Integer field |
| `iSpouseID` | int | NULL |  | Integer field |

### `UB_FS_AA_TMP`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iFileID` | int | NOT NULL |  | FK to file record (FundServ file) |
| `iSysID` | int | NULL |  | Integer field |
| `dtSystem` | datetime | NULL |  | Date/time field |
| `iLineNumber` | int | NULL |  | Integer field |
| `iUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `iImportStatus` | tinyint | NULL |  | Small integer/flag field |
| `MgmtCode_H` | varchar(3) | NULL |  |  |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `dtEffective` | datetime | NULL |  | Effective date |
| `MgmtCompanySpec_H` | varchar(3) | NULL |  |  |
| `Version` | varchar(2) | NULL |  |  |
| `iRecLen` | int | NULL |  | Integer field |
| `MgmtCode` | varchar(4) | NULL |  | Management company code |
| `FundID` | varchar(5) | NULL |  | Fund identifier code (e.g., DYN 3056) |
| `FundAccountID` | varchar(15) | NULL |  |  |
| `DealerAccountID` | varchar(15) | NULL |  |  |
| `RepCode` | varchar(5) | NULL |  | Representative/advisor code |
| `AccountDesig` | char(1) | NULL |  |  |
| `AccountType` | char(2) | NULL |  |  |
| `AccountStatus` | char(1) | NULL |  |  |
| `dtAccCreationDate` | datetime | NULL |  | Date/time field |
| `TaxCode` | varchar(3) | NULL |  |  |
| `RecipientCode` | char(1) | NULL |  |  |
| `AddressCode1` | char(1) | NULL |  |  |
| `TitleCode1` | char(1) | NULL |  |  |
| `LastName1` | varchar(20) | NULL |  |  |
| `FirstName1` | varchar(20) | NULL |  |  |
| `AddressLine1_1` | varchar(40) | NULL |  |  |
| `AddressLine2_1` | varchar(40) | NULL |  |  |
| `AddressLine3_1` | varchar(40) | NULL |  |  |
| `TrustTitleCode` | char(1) | NULL |  |  |
| `TrustLastName` | varchar(20) | NULL |  |  |
| `TrustFirstName` | varchar(20) | NULL |  |  |
| `TaxCalcDOBFlag` | char(1) | NULL |  |  |
| `iEstateFlag` | tinyint | NULL |  | Small integer/flag field |
| `dtBenDOB` | datetime | NULL |  | Date/time field |
| `BenSIN` | varchar(9) | NULL |  |  |
| `JointSignatureType` | char(1) | NULL |  |  |
| `City1` | varchar(30) | NULL |  |  |
| `Province1` | varchar(2) | NULL |  |  |
| `CountryCode1` | varchar(3) | NULL |  |  |
| `PostalCode1` | varchar(10) | NULL |  |  |
| `iRetMailIndicator1` | tinyint | NULL |  | Small integer/flag field |
| `LanguageCode` | char(1) | NULL |  |  |
| `AddressCode2` | char(1) | NULL |  |  |
| `TitleCode2` | char(1) | NULL |  |  |
| `LastName2` | varchar(20) | NULL |  |  |
| `FirstName2` | varchar(20) | NULL |  |  |
| `AddressLine1_2` | varchar(40) | NULL |  |  |
| `AddressLine2_2` | varchar(40) | NULL |  |  |
| `AddressLine3_2` | varchar(40) | NULL |  |  |
| `City2` | varchar(30) | NULL |  |  |
| `Province2` | varchar(2) | NULL |  |  |
| `CountryCode2` | varchar(3) | NULL |  |  |
| `PostalCode2` | varchar(10) | NULL |  |  |
| `iRetMailIndicator2` | tinyint | NULL |  | Small integer/flag field |
| `dtBenOwnerDOB` | datetime | NULL |  | Date/time field |
| `BenOwnerSIN` | varchar(9) | NULL |  |  |
| `iSpousalFlag` | tinyint | NULL |  | Small integer/flag field |
| `JointSpousalSIN` | varchar(9) | NULL |  |  |
| `JointSpousalTitleCode` | char(1) | NULL |  |  |
| `JointSpousalLastName` | varchar(20) | NULL |  |  |
| `JointSpousalFirstName` | varchar(20) | NULL |  |  |
| `fTotalUnissued` | float | NULL |  | Decimal/float value |
| `fTotalIssued` | float | NULL |  | Decimal/float value |
| `SystematicIndicator` | char(1) | NULL |  |  |
| `dtSystematicStartDate` | datetime | NULL |  | Date/time field |
| `dtSystematicStopDate` | datetime | NULL |  | Date/time field |
| `dtSystematicRestartDate` | datetime | NULL |  | Date/time field |
| `SystematicFrequency` | char(1) | NULL |  |  |
| `mSystematicAmount` | money | NULL |  |  |
| `fSystematicCommissionPer` | float | NULL |  | Decimal/float value |
| `DividendOption` | char(1) | NULL |  |  |
| `MngtCompanySpecific` | varchar(36) | NULL |  |  |
| `GroupIdentifier` | varchar(15) | NULL |  |  |
| `IntCode` | varchar(4) | NULL |  |  |
| `IntermediaryAccID` | varchar(15) | NULL |  |  |
| `DealerCode` | varchar(4) | NULL |  | Dealer code identifier |
| `AddressCode3` | varchar(40) | NULL |  |  |
| `AdditionalInfo` | varchar(40) | NULL |  |  |
| `iLockedInCode` | tinyint | NULL |  | Small integer/flag field |
| `mAverageCostFC` | money | NULL |  |  |
| `GroupFlag` | char(1) | NULL |  |  |
| `JointSurvivorType` | char(1) | NULL |  |  |
| `iInTrustForFlag` | tinyint | NULL |  | Small integer/flag field |
| `dtJointSpousalDOB` | datetime | NULL |  | Date/time field |

### `UB_FS_AS_ARC`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL |  | Primary key, auto-increment identifier |
| `iFileID` | int | NOT NULL |  | FK to file record (FundServ file) |
| `iSysID` | int | NULL |  | Integer field |
| `dtSystem` | datetime | NULL |  | Date/time field |
| `iLineNumber` | int | NULL |  | Integer field |
| `iUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `iImportStatus` | tinyint | NULL |  | Small integer/flag field |
| `MgmtCode_H` | varchar(4) | NULL |  |  |
| `DlrCode` | varchar(4) | NULL |  |  |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `dtSettlement` | datetime | NULL |  | Settlement date |
| `dtStart` | datetime | NULL |  | Date/time field |
| `dtEnd` | datetime | NULL |  | Date/time field |
| `CurrencyIndicator` | varchar(2) | NULL |  |  |
| `MgmtCompanySpec_H` | varchar(3) | NULL |  |  |
| `Version` | varchar(2) | NULL |  |  |
| `iRecLen` | int | NULL |  | Integer field |
| `PaymentID` | varchar(15) | NULL |  |  |
| `IncomeType` | char(1) | NULL |  |  |
| `RepCode` | varchar(5) | NULL |  | Representative/advisor code |
| `mCommPayable` | money | NULL |  |  |
| `PNIndicator` | char(1) | NULL |  |  |
| `MCSpecific` | varchar(3) | NULL |  |  |
| `CommissionType` | char(1) | NULL |  |  |
| `iCommRevID` | int | NOT NULL |  | Integer field |

### `UB_FS_AS_FND_ARC`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL |  | Primary key, auto-increment identifier |
| `iFileID` | int | NOT NULL |  | FK to file record (FundServ file) |
| `iSysID` | int | NULL |  | Integer field |
| `dtSystem` | datetime | NULL |  | Date/time field |
| `iLineNumber` | int | NULL |  | Integer field |
| `iUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `iImportStatus` | tinyint | NULL |  | Small integer/flag field |
| `MgmtCode_H` | varchar(4) | NULL |  |  |
| `DlrCode` | varchar(4) | NULL |  |  |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `dtSettlement` | datetime | NULL |  | Settlement date |
| `dtStart` | datetime | NULL |  | Date/time field |
| `dtEnd` | datetime | NULL |  | Date/time field |
| `CurrencyIndicator` | varchar(2) | NULL |  |  |
| `MgmtCompanySpec_H` | varchar(3) | NULL |  |  |
| `Version` | varchar(2) | NULL |  |  |
| `iRecLen` | int | NULL |  | Integer field |
| `PaymentID` | varchar(15) | NULL |  |  |
| `IncomeType` | char(1) | NULL |  |  |
| `RepCode` | varchar(5) | NULL |  | Representative/advisor code |
| `FundID` | varchar(5) | NULL |  | Fund identifier code (e.g., DYN 3056) |
| `fFundBalanceUnit` | float | NULL |  | Decimal/float value |
| `mFundValue` | money | NULL |  |  |
| `mPrice` | money | NULL |  |  |
| `mCommPayable` | money | NULL |  |  |
| `AssetIDCode` | char(1) | NULL |  |  |
| `PNIndicator` | char(1) | NULL |  |  |
| `MCSpecific` | varchar(3) | NULL |  |  |
| `MgmtCode` | varchar(4) | NULL |  | Management company code |
| `iCommRevID` | int | NOT NULL |  | Integer field |

### `UB_FS_AS_FND_TMP`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iFileID` | int | NOT NULL |  | FK to file record (FundServ file) |
| `iSysID` | int | NOT NULL |  | Integer field |
| `dtSystem` | datetime | NOT NULL |  | Date/time field |
| `iLineNumber` | int | NOT NULL |  | Integer field |
| `iUserID` | int | NOT NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `iImportStatus` | tinyint | NOT NULL |  | Small integer/flag field |
| `MgmtCode_H` | varchar(4) | NULL |  |  |
| `DlrCode` | varchar(4) | NULL |  |  |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `dtSettlement` | datetime | NULL |  | Settlement date |
| `dtStart` | datetime | NULL |  | Date/time field |
| `dtEnd` | datetime | NULL |  | Date/time field |
| `CurrencyIndicator` | varchar(2) | NULL |  |  |
| `MgmtCompanySpec_H` | varchar(3) | NULL |  |  |
| `Version` | varchar(2) | NULL |  |  |
| `iRecLen` | int | NULL |  | Integer field |
| `PaymentID` | varchar(15) | NULL |  |  |
| `IncomeType` | char(1) | NULL |  |  |
| `RepCode` | varchar(5) | NULL |  | Representative/advisor code |
| `FundID` | varchar(5) | NULL |  | Fund identifier code (e.g., DYN 3056) |
| `fFundBalanceUnit` | float | NULL |  | Decimal/float value |
| `mFundValue` | money | NULL |  |  |
| `mPrice` | money | NULL |  |  |
| `mCommPayable` | money | NULL |  |  |
| `AssetIDCode` | char(1) | NULL |  |  |
| `PNIndicator` | char(1) | NULL |  |  |
| `MCSpecific` | varchar(3) | NULL |  |  |
| `MgmtCode` | varchar(4) | NULL |  | Management company code |

### `UB_FS_AS_TMP`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iFileID` | int | NOT NULL |  | FK to file record (FundServ file) |
| `iSysID` | int | NOT NULL |  | Integer field |
| `dtSystem` | datetime | NOT NULL |  | Date/time field |
| `iLineNumber` | int | NOT NULL |  | Integer field |
| `iUserID` | int | NOT NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `iImportStatus` | tinyint | NOT NULL |  | Small integer/flag field |
| `MgmtCode_H` | varchar(4) | NULL |  |  |
| `DlrCode` | varchar(4) | NULL |  |  |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `dtSettlement` | datetime | NULL |  | Settlement date |
| `dtStart` | datetime | NULL |  | Date/time field |
| `dtEnd` | datetime | NULL |  | Date/time field |
| `CurrencyIndicator` | varchar(2) | NULL |  |  |
| `MgmtCompanySpec_H` | varchar(3) | NULL |  |  |
| `Version` | varchar(2) | NULL |  |  |
| `iRecLen` | int | NULL |  | Integer field |
| `PaymentID` | varchar(15) | NULL |  |  |
| `IncomeType` | char(1) | NULL |  |  |
| `RepCode` | varchar(5) | NULL |  | Representative/advisor code |
| `mCommPayable` | money | NULL |  |  |
| `PNIndicator` | char(1) | NULL |  |  |
| `MCSpecific` | varchar(3) | NULL |  |  |
| `CommissionType` | char(1) | NULL |  |  |

### `UB_FS_AT_ARC`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL |  | Primary key, auto-increment identifier |
| `iFileID` | int | NOT NULL |  | FK to file record (FundServ file) |
| `iSysID` | int | NULL |  | Integer field |
| `dtSystem` | datetime | NULL |  | Date/time field |
| `iLineNumber` | int | NULL |  | Integer field |
| `iUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `iImportStatus` | tinyint | NULL |  | Small integer/flag field |
| `MgmtCode_H` | varchar(3) | NULL |  |  |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `dtEffective` | datetime | NULL |  | Effective date |
| `dtStart` | datetime | NULL |  | Date/time field |
| `dtEnd` | datetime | NULL |  | Date/time field |
| `MgmtCompanySpec_H` | varchar(3) | NULL |  |  |
| `Version` | varchar(2) | NULL |  |  |
| `iRecLen` | int | NULL |  | Integer field |
| `iSequenceNumber` | int | NULL |  | Integer field |
| `MgmtCode` | varchar(4) | NULL |  | Management company code |
| `FundID` | varchar(5) | NULL |  | Fund identifier code (e.g., DYN 3056) |
| `FundAccountID` | varchar(15) | NULL |  |  |
| `RepCode` | varchar(5) | NULL |  | Representative/advisor code |
| `PmtID` | varchar(15) | NULL |  |  |
| `mLSIFProvTax` | money | NULL |  |  |
| `mLSIFFedTax` | money | NULL |  |  |
| `AdditionalInfo` | varchar(40) | NULL |  |  |
| `DealerAccountID` | varchar(15) | NULL |  |  |
| `LastName1` | varchar(20) | NULL |  |  |
| `FirstName1` | varchar(20) | NULL |  |  |
| `AccountDesig` | char(1) | NULL |  |  |
| `AccountType` | char(2) | NULL |  |  |
| `AccountStatus` | char(1) | NULL |  |  |
| `RecordType` | char(3) | NULL |  |  |
| `TrxType` | char(1) | NULL |  |  |
| `TrxTypeDetail` | char(1) | NULL |  |  |
| `ProdEventInd` | char(1) | NULL |  |  |
| `ConWdrCode` | char(1) | NULL |  |  |
| `dtTrade` | datetime | NULL |  | Trade date |
| `dtSettlement` | datetime | NULL |  | Settlement date |
| `SettlementStatus` | char(1) | NULL |  |  |
| `OrderID` | varchar(7) | NULL |  |  |
| `WOStatus` | char(1) | NULL |  |  |
| `CertificateInd` | char(1) | NULL |  |  |
| `DlrCode2` | varchar(4) | NULL |  |  |
| `FundID2` | varchar(5) | NULL |  |  |
| `FundAccountID2` | varchar(15) | NULL |  |  |
| `DealerAccountID2` | varchar(15) | NULL |  |  |
| `PNIndicator` | char(1) | NULL |  |  |
| `mGAmount` | money | NULL |  |  |
| `fCPCommissionPer` | float | NULL |  | Decimal/float value |
| `mMCHoldback` | money | NULL |  |  |
| `mCPDealerComm` | money | NULL |  |  |
| `fFPCommissionPer` | float | NULL |  | Decimal/float value |
| `mMCHoldback2` | money | NULL |  |  |
| `mFPDealerComm` | money | NULL |  |  |
| `mFees` | money | NULL |  |  |
| `mGST` | money | NULL |  |  |
| `mDSC` | money | NULL |  |  |
| `mWHTax1` | money | NULL |  |  |
| `mWHTax2` | money | NULL |  |  |
| `mNAmount` | money | NULL |  |  |
| `mSAmount` | money | NULL |  |  |
| `mPrice` | money | NULL |  |  |
| `fUnits` | float | NULL |  | Decimal/float value |
| `fUnitsTotalIssued` | float | NULL |  | Decimal/float value |
| `fUnitsTotalUnissued` | float | NULL |  | Decimal/float value |
| `CurrencyInd` | char(2) | NULL |  |  |
| `OriginatorID` | varchar(15) | NULL |  |  |
| `MCSpecific` | varchar(3) | NULL |  |  |
| `iProspectusInd` | tinyint | NULL |  | Small integer/flag field |
| `IntermediaryCode` | varchar(4) | NULL |  |  |
| `IntermediaryAccId` | varchar(15) | NULL |  |  |
| `LockedInCode` | char(1) | NULL |  |  |
| `SettlementMethod` | char(1) | NULL |  |  |
| `SettlementSource` | char(1) | NULL |  |  |
| `OrderType` | char(1) | NULL |  |  |
| `BenOwnerSIN` | varchar(9) | NULL |  |  |
| `DlrCode` | varchar(4) | NULL |  |  |
| `MCSpecific2` | varchar(45) | NULL |  |  |
| `TaxCode` | varchar(3) | NULL |  |  |
| `SourceID` | varchar(15) | NULL |  | Source identifier |
| `DividendOpt` | char(1) | NULL |  |  |
| `PurchaseSettlementInd` | char(1) | NULL |  |  |
| `TaxableEventInd` | char(1) | NULL |  |  |
| `DilutionInd` | char(1) | NULL |  |  |
| `mDilutionAmount` | money | NULL |  |  |
| `OriginalOrderId` | varchar(7) | NULL |  |  |
| `MgmtCode2` | varchar(3) | NULL |  |  |
| `iMultiLnRecNumber` | tinyint | NULL |  | Small integer/flag field |
| `iRevisionNumber` | tinyint | NULL |  | Small integer/flag field |
| `OrderSource` | char(1) | NULL |  |  |
| `iMultiLnRecTotal` | tinyint | NULL |  | Small integer/flag field |
| `ReturnCode` | char(2) | NULL |  |  |
| `ReturnCodeDetail` | char(3) | NULL |  |  |
| `ResponseSource` | char(1) | NULL |  |  |
| `iSuppressConfirmInd` | tinyint | NULL |  | Small integer/flag field |
| `mAverageCostD` | money | NULL |  |  |
| `mAverageCostF` | money | NULL |  |  |
| `AccountDesig2` | char(1) | NULL |  |  |
| `AccountType2` | char(2) | NULL |  |  |
| `dtProcessingFC` | datetime | NULL |  | Date/time field |
| `GroupFlag` | char(1) | NULL |  |  |
| `iSpousalFlag` | tinyint | NULL |  | Small integer/flag field |
| `ContributionPeriod` | char(1) | NULL |  |  |
| `AltPayeeInd` | char(1) | NULL |  |  |
| `AltDeliveryPmtInd` | char(1) | NULL |  |  |
| `IntermediaryAccId2` | varchar(15) | NULL |  |  |
| `iSpousalFlag2` | tinyint | NULL |  | Small integer/flag field |
| `GroupFlag2` | char(1) | NULL |  |  |
| `RedemptionProceedsInd` | char(1) | NULL |  |  |
| `IntermediaryCode2` | varchar(4) | NULL |  |  |
| `fExchangeRate` | float | NULL |  | Decimal/float value |
| `iFundAccountID` | int | NULL |  | Integer field |
| `iFundAccountPosID` | int | NULL |  | Integer field |
| `iTrxID` | int | NULL |  | Integer field |

### `UB_FS_AT_TMP`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iFileID` | int | NOT NULL |  | FK to file record (FundServ file) |
| `iSysID` | int | NULL |  | Integer field |
| `dtSystem` | datetime | NULL |  | Date/time field |
| `iLineNumber` | int | NULL |  | Integer field |
| `iUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `iImportStatus` | tinyint | NULL |  | Small integer/flag field |
| `MgmtCode_H` | varchar(3) | NULL |  |  |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `dtEffective` | datetime | NULL |  | Effective date |
| `dtStart` | datetime | NULL |  | Date/time field |
| `dtEnd` | datetime | NULL |  | Date/time field |
| `MgmtCompanySpec_H` | varchar(3) | NULL |  |  |
| `Version` | varchar(2) | NULL |  |  |
| `iRecLen` | int | NULL |  | Integer field |
| `iSequenceNumber` | int | NULL |  | Integer field |
| `MgmtCode` | varchar(4) | NULL |  | Management company code |
| `FundID` | varchar(5) | NULL |  | Fund identifier code (e.g., DYN 3056) |
| `FundAccountID` | varchar(15) | NULL |  |  |
| `RepCode` | varchar(5) | NULL |  | Representative/advisor code |
| `PmtID` | varchar(15) | NULL |  |  |
| `mLSIFProvTax` | money | NULL |  |  |
| `mLSIFFedTax` | money | NULL |  |  |
| `AdditionalInfo` | varchar(40) | NULL |  |  |
| `DealerAccountID` | varchar(15) | NULL |  |  |
| `LastName1` | varchar(20) | NULL |  |  |
| `FirstName1` | varchar(20) | NULL |  |  |
| `AccountDesig` | char(1) | NULL |  |  |
| `AccountType` | char(2) | NULL |  |  |
| `AccountStatus` | char(1) | NULL |  |  |
| `RecordType` | char(3) | NULL |  |  |
| `TrxType` | char(1) | NULL |  |  |
| `TrxTypeDetail` | char(1) | NULL |  |  |
| `ProdEventInd` | char(1) | NULL |  |  |
| `ConWdrCode` | char(1) | NULL |  |  |
| `dtTrade` | datetime | NULL |  | Trade date |
| `dtSettlement` | datetime | NULL |  | Settlement date |
| `SettlementStatus` | char(1) | NULL |  |  |
| `OrderID` | varchar(7) | NULL |  |  |
| `WOStatus` | char(1) | NULL |  |  |
| `CertificateInd` | char(1) | NULL |  |  |
| `DlrCode2` | varchar(4) | NULL |  |  |
| `FundID2` | varchar(5) | NULL |  |  |
| `FundAccountID2` | varchar(15) | NULL |  |  |
| `DealerAccountID2` | varchar(15) | NULL |  |  |
| `PNIndicator` | char(1) | NULL |  |  |
| `mGAmount` | money | NULL |  |  |
| `fCPCommissionPer` | float | NULL |  | Decimal/float value |
| `mMCHoldback` | money | NULL |  |  |
| `mCPDealerComm` | money | NULL |  |  |
| `fFPCommissionPer` | float | NULL |  | Decimal/float value |
| `mMCHoldback2` | money | NULL |  |  |
| `mFPDealerComm` | money | NULL |  |  |
| `mFees` | money | NULL |  |  |
| `mGST` | money | NULL |  |  |
| `mDSC` | money | NULL |  |  |
| `mWHTax1` | money | NULL |  |  |
| `mWHTax2` | money | NULL |  |  |
| `mNAmount` | money | NULL |  |  |
| `mSAmount` | money | NULL |  |  |
| `mPrice` | money | NULL |  |  |
| `fUnits` | float | NULL |  | Decimal/float value |
| `fUnitsTotalIssued` | float | NULL |  | Decimal/float value |
| `fUnitsTotalUnissued` | float | NULL |  | Decimal/float value |
| `CurrencyInd` | char(2) | NULL |  |  |
| `OriginatorID` | varchar(15) | NULL |  |  |
| `MCSpecific` | varchar(3) | NULL |  |  |
| `iProspectusInd` | tinyint | NULL |  | Small integer/flag field |
| `IntermediaryCode` | varchar(4) | NULL |  |  |
| `IntermediaryAccId` | varchar(15) | NULL |  |  |
| `LockedInCode` | char(1) | NULL |  |  |
| `SettlementMethod` | char(1) | NULL |  |  |
| `SettlementSource` | char(1) | NULL |  |  |
| `OrderType` | char(1) | NULL |  |  |
| `BenOwnerSIN` | varchar(9) | NULL |  |  |
| `DlrCode` | varchar(4) | NULL |  |  |
| `MCSpecific2` | varchar(45) | NULL |  |  |
| `TaxCode` | varchar(3) | NULL |  |  |
| `SourceID` | varchar(15) | NULL |  | Source identifier |
| `DividendOpt` | char(1) | NULL |  |  |
| `PurchaseSettlementInd` | char(1) | NULL |  |  |
| `TaxableEventInd` | char(1) | NULL |  |  |
| `DilutionInd` | char(1) | NULL |  |  |
| `mDilutionAmount` | money | NULL |  |  |
| `OriginalOrderId` | varchar(7) | NULL |  |  |
| `MgmtCode2` | varchar(3) | NULL |  |  |
| `iMultiLnRecNumber` | tinyint | NULL |  | Small integer/flag field |
| `iRevisionNumber` | tinyint | NULL |  | Small integer/flag field |
| `OrderSource` | char(1) | NULL |  |  |
| `iMultiLnRecTotal` | tinyint | NULL |  | Small integer/flag field |
| `ReturnCode` | char(2) | NULL |  |  |
| `ReturnCodeDetail` | char(3) | NULL |  |  |
| `ResponseSource` | char(1) | NULL |  |  |
| `iSuppressConfirmInd` | tinyint | NULL |  | Small integer/flag field |
| `mAverageCostD` | money | NULL |  |  |
| `mAverageCostF` | money | NULL |  |  |
| `AccountDesig2` | char(1) | NULL |  |  |
| `AccountType2` | char(2) | NULL |  |  |
| `dtProcessingFC` | datetime | NULL |  | Date/time field |
| `GroupFlag` | char(1) | NULL |  |  |
| `iSpousalFlag` | tinyint | NULL |  | Small integer/flag field |
| `ContributionPeriod` | char(1) | NULL |  |  |
| `AltPayeeInd` | char(1) | NULL |  |  |
| `AltDeliveryPmtInd` | char(1) | NULL |  |  |
| `IntermediaryAccId2` | varchar(15) | NULL |  |  |
| `iSpousalFlag2` | tinyint | NULL |  | Small integer/flag field |
| `GroupFlag2` | char(1) | NULL |  |  |
| `RedemptionProceedsInd` | char(1) | NULL |  |  |
| `IntermediaryCode2` | varchar(4) | NULL |  |  |
| `fExchangeRate` | float | NULL |  | Decimal/float value |

### `UB_FS_AW_ARC`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL |  | Primary key, auto-increment identifier |
| `iFileID` | int | NOT NULL |  | FK to file record (FundServ file) |
| `iSysID` | int | NULL |  | Integer field |
| `dtSystem` | datetime | NULL |  | Date/time field |
| `iLineNumber` | int | NULL |  | Integer field |
| `iUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `iImportStatus` | tinyint | NULL |  | Small integer/flag field |
| `MgmtCode_H` | varchar(3) | NULL |  |  |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `dtSettlement` | datetime | NULL |  | Settlement date |
| `dtStart` | datetime | NULL |  | Date/time field |
| `dtEnd` | datetime | NULL |  | Date/time field |
| `CurrencyIndicator` | varchar(2) | NULL |  |  |
| `MgmtCompanySpec_H` | varchar(3) | NULL |  |  |
| `Version` | varchar(2) | NULL |  |  |
| `iRecLen` | int | NULL |  | Integer field |
| `PaymentID` | varchar(15) | NULL |  |  |
| `IncomeType` | char(1) | NULL |  |  |
| `MgmtCode` | varchar(4) | NULL |  | Management company code |
| `DlrCode` | varchar(4) | NULL |  |  |
| `RepCode` | varchar(5) | NULL |  | Representative/advisor code |
| `OwnerLastName` | varchar(20) | NULL |  |  |
| `OwnerFirstName` | varchar(20) | NULL |  |  |
| `FundAccountID` | varchar(15) | NULL |  |  |
| `ClientSIN` | varchar(9) | NULL |  |  |
| `FundID` | varchar(5) | NULL |  | Fund identifier code (e.g., DYN 3056) |
| `DealerAccountID` | varchar(15) | NULL |  |  |
| `IntermediaryCode` | varchar(4) | NULL |  |  |
| `IntermediaryAccId` | varchar(15) | NULL |  |  |
| `dtTrade` | datetime | NULL |  | Trade date |
| `TrxType` | char(1) | NULL |  |  |
| `TrxTypeDetail` | char(1) | NULL |  |  |
| `ProdEventInd` | char(1) | NULL |  |  |
| `OrderID` | varchar(7) | NULL |  |  |
| `PNIndicator` | char(1) | NULL |  |  |
| `mGAmount` | money | NULL |  |  |
| `fCommissionPer` | float | NULL |  | Decimal/float value |
| `mDealerComm` | money | NULL |  |  |
| `mCommPayable` | money | NULL |  |  |
| `mNAmount` | money | NULL |  |  |
| `MCSpecific` | varchar(3) | NULL |  |  |
| `OriginatorID` | varchar(15) | NULL |  |  |
| `AccountDesig` | char(1) | NULL |  |  |
| `CommissionType` | char(1) | NULL |  |  |
| `OrderSource` | char(1) | NULL |  |  |
| `SourceID` | varchar(15) | NULL |  | Source identifier |
| `GNSettlementInd` | char(1) | NULL |  |  |
| `iCommRevID` | int | NOT NULL |  | Integer field |
| `iTrxID` | int | NOT NULL |  | Integer field |
| `iAccountPosID` | int | NOT NULL |  | Integer field |

### `UB_FS_AW_TMP`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iFileID` | int | NOT NULL |  | FK to file record (FundServ file) |
| `iSysID` | int | NOT NULL |  | Integer field |
| `dtSystem` | datetime | NOT NULL |  | Date/time field |
| `iLineNumber` | int | NOT NULL |  | Integer field |
| `iUserID` | int | NOT NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `iImportStatus` | tinyint | NOT NULL |  | Small integer/flag field |
| `MgmtCode_H` | varchar(3) | NULL |  |  |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `dtSettlement` | datetime | NULL |  | Settlement date |
| `dtStart` | datetime | NULL |  | Date/time field |
| `dtEnd` | datetime | NULL |  | Date/time field |
| `CurrencyIndicator` | varchar(2) | NULL |  |  |
| `MgmtCompanySpec_H` | varchar(3) | NULL |  |  |
| `Version` | varchar(2) | NULL |  |  |
| `iRecLen` | int | NULL |  | Integer field |
| `PaymentID` | varchar(15) | NULL |  |  |
| `IncomeType` | char(1) | NULL |  |  |
| `MgmtCode` | varchar(4) | NULL |  | Management company code |
| `DlrCode` | varchar(4) | NULL |  |  |
| `RepCode` | varchar(5) | NULL |  | Representative/advisor code |
| `OwnerLastName` | varchar(20) | NULL |  |  |
| `OwnerFirstName` | varchar(20) | NULL |  |  |
| `FundAccountID` | varchar(15) | NULL |  |  |
| `ClientSIN` | varchar(9) | NULL |  |  |
| `FundID` | varchar(5) | NULL |  | Fund identifier code (e.g., DYN 3056) |
| `DealerAccountID` | varchar(15) | NULL |  |  |
| `IntermediaryCode` | varchar(4) | NULL |  |  |
| `IntermediaryAccId` | varchar(15) | NULL |  |  |
| `dtTrade` | datetime | NULL |  | Trade date |
| `TrxType` | char(1) | NULL |  |  |
| `TrxTypeDetail` | char(1) | NULL |  |  |
| `ProdEventInd` | char(1) | NULL |  |  |
| `OrderID` | varchar(7) | NULL |  |  |
| `PNIndicator` | char(1) | NULL |  |  |
| `mGAmount` | money | NULL |  |  |
| `fCommissionPer` | float | NULL |  | Decimal/float value |
| `mDealerComm` | money | NULL |  |  |
| `mCommPayable` | money | NULL |  |  |
| `mNAmount` | money | NULL |  |  |
| `MCSpecific` | varchar(3) | NULL |  |  |
| `OriginatorID` | varchar(15) | NULL |  |  |
| `AccountDesig` | char(1) | NULL |  |  |
| `CommissionType` | char(1) | NULL |  |  |
| `OrderSource` | char(1) | NULL |  |  |
| `SourceID` | varchar(15) | NULL |  | Source identifier |
| `GNSettlementInd` | char(1) | NULL |  |  |

### `UB_FS_DefAccountRec`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `FieldName` | varchar(50) | NOT NULL |  | Field name reference |
| `SPParamName` | varchar(50) | NULL |  |  |
| `iStartPos` | smallint | NOT NULL |  |  |
| `iLength` | smallint | NOT NULL |  |  |
| `iType` | tinyint | NULL |  | Type/category code |
| `bRequired` | tinyint | NOT NULL |  |  |
| `iErrorID` | int | NULL |  | Integer field |
| `LimitStr` | varchar(100) | NULL |  |  |
| `FSName` | varchar(100) | NULL |  |  |
| `bHeader` | tinyint | NOT NULL |  |  |

### `UB_FS_DefAddress`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `FieldName` | varchar(80) | NOT NULL |  | Field name reference |
| `SPParamName` | varchar(50) | NULL |  |  |
| `iType` | tinyint | NULL |  | Type/category code |
| `bRequired` | tinyint | NULL |  |  |
| `iErrorID` | int | NULL |  | Integer field |
| `LimitStr` | varchar(100) | NULL |  |  |

### `UB_FS_DefAERec`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `FieldName` | varchar(50) | NOT NULL |  | Field name reference |
| `SPParamName` | varchar(50) | NULL |  |  |
| `iStartPos` | smallint | NOT NULL |  |  |
| `iLength` | smallint | NOT NULL |  |  |
| `iType` | tinyint | NULL |  | Type/category code |
| `bRequired` | tinyint | NOT NULL |  |  |
| `iErrorID` | int | NULL |  | Integer field |
| `LimitStr` | varchar(100) | NOT NULL |  |  |
| `FSName` | varchar(100) | NULL |  |  |
| `bHeader` | tinyint | NOT NULL |  |  |

### `UB_FS_DefAFMoneyMovement`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `FieldName` | varchar(50) | NOT NULL |  | Field name reference |
| `SPParamName` | varchar(50) | NULL |  |  |
| `iStartPos` | smallint | NOT NULL |  |  |
| `iLength` | smallint | NOT NULL |  |  |
| `iType` | tinyint | NULL |  | Type/category code |
| `bRequired` | tinyint | NOT NULL |  |  |
| `iErrorID` | int | NULL |  | Integer field |
| `LimitStr` | varchar(100) | NULL |  |  |
| `FSName` | varchar(100) | NULL |  |  |
| `bHeader` | tinyint | NOT NULL |  |  |

### `UB_FS_DefASFNDRec`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `FieldName` | varchar(50) | NOT NULL |  | Field name reference |
| `SPParamName` | varchar(50) | NULL |  |  |
| `iStartPos` | smallint | NOT NULL |  |  |
| `iLength` | smallint | NOT NULL |  |  |
| `iType` | tinyint | NULL |  | Type/category code |
| `bRequired` | tinyint | NOT NULL |  |  |
| `iErrorID` | int | NULL |  | Integer field |
| `LimitStr` | varchar(100) | NOT NULL |  |  |
| `FSName` | varchar(100) | NULL |  |  |
| `bHeader` | tinyint | NOT NULL |  |  |

### `UB_FS_DefASMByPartRec`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `FieldName` | varchar(80) | NOT NULL |  | Field name reference |
| `SPParamName` | varchar(50) | NULL |  |  |
| `iType` | tinyint | NULL |  | Type/category code |
| `bRequired` | tinyint | NULL |  |  |
| `iErrorID` | int | NULL |  | Integer field |
| `LimitStr` | varchar(100) | NULL |  |  |

### `UB_FS_DefASMHeaderRec`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `FieldName` | varchar(80) | NOT NULL |  | Field name reference |
| `SPParamName` | varchar(50) | NULL |  |  |
| `iType` | tinyint | NULL |  | Type/category code |
| `bRequired` | tinyint | NULL |  |  |
| `iErrorID` | int | NULL |  | Integer field |
| `LimitStr` | varchar(100) | NULL |  |  |

### `UB_FS_DefASMPymtRec`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `FieldName` | varchar(80) | NOT NULL |  | Field name reference |
| `SPParamName` | varchar(50) | NULL |  |  |
| `iType` | tinyint | NULL |  | Type/category code |
| `bRequired` | tinyint | NULL |  |  |
| `iErrorID` | int | NULL |  | Integer field |
| `LimitStr` | varchar(100) | NULL |  |  |

### `UB_FS_DefASRec`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `FieldName` | varchar(50) | NOT NULL |  | Field name reference |
| `SPParamName` | varchar(50) | NULL |  |  |
| `iStartPos` | smallint | NOT NULL |  |  |
| `iLength` | smallint | NOT NULL |  |  |
| `iType` | tinyint | NULL |  | Type/category code |
| `bRequired` | tinyint | NOT NULL |  |  |
| `iErrorID` | int | NULL |  | Integer field |
| `LimitStr` | varchar(100) | NOT NULL |  |  |
| `FSName` | varchar(100) | NULL |  |  |
| `bHeader` | tinyint | NOT NULL |  |  |

### `UB_FS_DefAWRec`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `FieldName` | varchar(50) | NOT NULL |  | Field name reference |
| `SPParamName` | varchar(50) | NULL |  |  |
| `iStartPos` | smallint | NOT NULL |  |  |
| `iLength` | smallint | NOT NULL |  |  |
| `iType` | tinyint | NULL |  | Type/category code |
| `bRequired` | tinyint | NOT NULL |  |  |
| `iErrorID` | int | NULL |  | Integer field |
| `LimitStr` | varchar(100) | NOT NULL |  |  |
| `FSName` | varchar(100) | NULL |  |  |
| `bHeader` | tinyint | NOT NULL |  |  |

### `UB_FS_DefBankInfo`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `FieldName` | varchar(80) | NOT NULL |  | Field name reference |
| `SPParamName` | varchar(50) | NULL |  |  |
| `iType` | tinyint | NULL |  | Type/category code |
| `bRequired` | tinyint | NULL |  |  |
| `iErrorID` | int | NULL |  | Integer field |
| `LimitStr` | varchar(100) | NULL |  |  |

### `UB_FS_DefBSRec`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `FieldName` | varchar(80) | NOT NULL |  | Field name reference |
| `SPParamName` | varchar(50) | NULL |  |  |
| `iType` | tinyint | NULL |  | Type/category code |
| `bRequired` | tinyint | NULL |  |  |
| `iErrorID` | int | NULL |  | Integer field |
| `LimitStr` | varchar(100) | NULL |  |  |

### `UB_FS_DefChequeInfo`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `FieldName` | varchar(80) | NOT NULL |  | Field name reference |
| `SPParamName` | varchar(50) | NULL |  |  |
| `iType` | tinyint | NULL |  | Type/category code |
| `bRequired` | tinyint | NULL |  |  |
| `iErrorID` | int | NULL |  | Integer field |
| `LimitStr` | varchar(100) | NULL |  |  |

### `UB_FS_DefClientInfo`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `FieldName` | varchar(80) | NOT NULL |  | Field name reference |
| `SPParamName` | varchar(50) | NULL |  |  |
| `iType` | tinyint | NULL |  | Type/category code |
| `bRequired` | tinyint | NULL |  |  |
| `iErrorID` | int | NULL |  | Integer field |
| `LimitStr` | varchar(100) | NULL |  |  |

### `UB_FS_DefClientInfoEx`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `FieldName` | varchar(80) | NOT NULL |  | Field name reference |
| `SPParamName` | varchar(50) | NULL |  |  |
| `iType` | tinyint | NULL |  | Type/category code |
| `bRequired` | tinyint | NULL |  |  |
| `iErrorID` | int | NULL |  | Integer field |
| `LimitStr` | varchar(100) | NULL |  |  |

### `UB_FS_DefCtrlPerson`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `FieldName` | varchar(80) | NOT NULL |  | Field name reference |
| `SPParamName` | varchar(50) | NULL |  |  |
| `iType` | tinyint | NULL |  | Type/category code |
| `bRequired` | tinyint | NULL |  |  |
| `iErrorID` | int | NULL |  | Integer field |
| `LimitStr` | varchar(100) | NULL |  |  |

### `UB_FS_DefFERec`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `FieldName` | varchar(50) | NOT NULL |  | Field name reference |
| `SPParamName` | varchar(50) | NULL |  |  |
| `iStartPos` | smallint | NOT NULL |  |  |
| `iLength` | smallint | NOT NULL |  |  |
| `iType` | tinyint | NULL |  | Type/category code |
| `bRequired` | tinyint | NOT NULL |  |  |
| `iErrorID` | int | NULL |  | Integer field |
| `LimitStr` | varchar(100) | NULL |  |  |
| `FSName` | varchar(100) | NULL |  |  |
| `bHeader` | tinyint | NOT NULL |  |  |
| `iTable` | tinyint | NULL |  | Small integer/flag field |

### `UB_FS_DefFFRec`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `FieldName` | varchar(50) | NOT NULL |  | Field name reference |
| `SPParamName` | varchar(50) | NULL |  |  |
| `iStartPos` | smallint | NOT NULL |  |  |
| `iLength` | smallint | NOT NULL |  |  |
| `iType` | tinyint | NULL |  | Type/category code |
| `bRequired` | tinyint | NOT NULL |  |  |
| `iErrorID` | int | NULL |  | Integer field |
| `LimitStr` | varchar(100) | NULL |  |  |
| `FSName` | varchar(100) | NULL |  |  |
| `bHeader` | tinyint | NOT NULL |  |  |

### `UB_FS_DefFGRec`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `FieldName` | varchar(50) | NOT NULL |  | Field name reference |
| `SPParamName` | varchar(50) | NULL |  |  |
| `iStartPos` | smallint | NOT NULL |  |  |
| `iLength` | smallint | NOT NULL |  |  |
| `iType` | tinyint | NULL |  | Type/category code |
| `bRequired` | tinyint | NOT NULL |  |  |
| `iErrorID` | int | NULL |  | Integer field |
| `LimitStr` | varchar(100) | NULL |  |  |
| `FSName` | varchar(100) | NULL |  |  |
| `bHeader` | tinyint | NOT NULL |  |  |
| `iTable` | tinyint | NULL |  | Small integer/flag field |

### `UB_FS_DefFSRec`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `FieldName` | varchar(80) | NOT NULL |  | Field name reference |
| `SPParamName` | varchar(50) | NULL |  |  |
| `iType` | tinyint | NULL |  | Type/category code |
| `bRequired` | tinyint | NULL |  |  |
| `iErrorID` | int | NULL |  | Integer field |
| `LimitStr` | varchar(100) | NULL |  |  |

### `UB_FS_DefFundAccount`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `FieldName` | varchar(80) | NOT NULL |  | Field name reference |
| `SPParamName` | varchar(50) | NULL |  |  |
| `iType` | tinyint | NULL |  | Type/category code |
| `bRequired` | tinyint | NULL |  |  |
| `iErrorID` | int | NULL |  | Integer field |
| `LimitStr` | varchar(100) | NULL |  |  |

### `UB_FS_DefFundAccountDivRedirect`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `FieldName` | varchar(80) | NOT NULL |  | Field name reference |
| `SPParamName` | varchar(50) | NULL |  |  |
| `iType` | tinyint | NULL |  | Type/category code |
| `bRequired` | tinyint | NULL |  |  |
| `iErrorID` | int | NULL |  | Integer field |
| `LimitStr` | varchar(100) | NULL |  |  |

### `UB_FS_DefFundAccountExtra`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `FieldName` | varchar(80) | NOT NULL |  | Field name reference |
| `SPParamName` | varchar(50) | NULL |  |  |
| `iType` | tinyint | NULL |  | Type/category code |
| `bRequired` | tinyint | NULL |  |  |
| `iErrorID` | int | NULL |  | Integer field |
| `LimitStr` | varchar(100) | NULL |  |  |

### `UB_FS_DefFundAccountPos`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `FieldName` | varchar(80) | NOT NULL |  | Field name reference |
| `SPParamName` | varchar(50) | NULL |  |  |
| `iType` | tinyint | NULL |  | Type/category code |
| `bRequired` | tinyint | NULL |  |  |
| `iErrorID` | int | NULL |  | Integer field |
| `LimitStr` | varchar(100) | NULL |  |  |

### `UB_FS_DefFundPrice`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `FieldName` | varchar(80) | NOT NULL |  | Field name reference |
| `SPParamName` | varchar(50) | NULL |  |  |
| `iType` | tinyint | NULL |  | Type/category code |
| `bRequired` | tinyint | NULL |  |  |
| `iErrorID` | int | NULL |  | Integer field |
| `LimitStr` | varchar(100) | NULL |  |  |

### `UB_FS_DefFundSetup`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `FieldName` | varchar(80) | NOT NULL |  | Field name reference |
| `SPParamName` | varchar(50) | NULL |  |  |
| `iType` | tinyint | NULL |  | Type/category code |
| `bRequired` | tinyint | NULL |  |  |
| `iErrorID` | int | NULL |  | Integer field |
| `LimitStr` | varchar(100) | NULL |  |  |

### `UB_FS_DefFundSetupAA`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `FieldName` | varchar(80) | NOT NULL |  | Field name reference |
| `SPParamName` | varchar(50) | NULL |  |  |
| `iType` | tinyint | NULL |  | Type/category code |
| `bRequired` | tinyint | NULL |  |  |
| `iErrorID` | int | NULL |  | Integer field |
| `LimitStr` | varchar(100) | NULL |  |  |

### `UB_FS_DefFundSetupCAA`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `FieldName` | varchar(80) | NOT NULL |  | Field name reference |
| `SPParamName` | varchar(50) | NULL |  |  |
| `iType` | tinyint | NULL |  | Type/category code |
| `bRequired` | tinyint | NULL |  |  |
| `iErrorID` | int | NULL |  | Integer field |
| `LimitStr` | varchar(100) | NULL |  |  |

### `UB_FS_DefFundSetupModel`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `FieldName` | varchar(80) | NOT NULL |  | Field name reference |
| `SPParamName` | varchar(50) | NULL |  |  |
| `iType` | tinyint | NULL |  | Type/category code |
| `bRequired` | tinyint | NULL |  |  |
| `iErrorID` | int | NULL |  | Integer field |
| `LimitStr` | varchar(100) | NULL |  |  |

### `UB_FS_DefIDVerify`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `FieldName` | varchar(80) | NOT NULL |  | Field name reference |
| `SPParamName` | varchar(50) | NULL |  |  |
| `iType` | tinyint | NULL |  | Type/category code |
| `bRequired` | tinyint | NULL |  |  |
| `iErrorID` | int | NULL |  | Integer field |
| `LimitStr` | varchar(100) | NULL |  |  |

### `UB_FS_DefIndTIN`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `FieldName` | varchar(80) | NOT NULL |  | Field name reference |
| `SPParamName` | varchar(50) | NULL |  |  |
| `iType` | tinyint | NULL |  | Type/category code |
| `bRequired` | tinyint | NULL |  |  |
| `iErrorID` | int | NULL |  | Integer field |
| `LimitStr` | varchar(100) | NULL |  |  |

### `UB_FS_DefLARec`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `FieldName` | varchar(80) | NOT NULL |  | Field name reference |
| `SPParamName` | varchar(50) | NULL |  |  |
| `iType` | tinyint | NULL |  | Type/category code |
| `bRequired` | tinyint | NULL |  |  |
| `iErrorID` | int | NULL |  | Integer field |
| `LimitStr` | varchar(100) | NULL |  |  |

### `UB_FS_DefLSRec`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `FieldName` | varchar(80) | NOT NULL |  | Field name reference |
| `SPParamName` | varchar(50) | NULL |  |  |
| `iType` | tinyint | NULL |  | Type/category code |
| `bRequired` | tinyint | NULL |  |  |
| `iErrorID` | int | NULL |  | Integer field |
| `LimitStr` | varchar(100) | NULL |  |  |

### `UB_FS_DefLSRecDetail`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `FieldName` | varchar(80) | NOT NULL |  | Field name reference |
| `SPParamName` | varchar(50) | NULL |  |  |
| `iType` | tinyint | NULL |  | Type/category code |
| `bRequired` | tinyint | NULL |  |  |
| `iErrorID` | int | NULL |  | Integer field |
| `LimitStr` | varchar(100) | NULL |  |  |

### `UB_FS_DefNFURespn`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `FieldName` | varchar(80) | NOT NULL |  | Field name reference |
| `SPParamName` | varchar(50) | NULL |  |  |
| `iType` | tinyint | NULL |  | Type/category code |
| `bRequired` | tinyint | NULL |  |  |
| `iErrorID` | int | NULL |  | Integer field |
| `LimitStr` | varchar(100) | NULL |  |  |

### `UB_FS_DefOrderRespn`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `FieldName` | varchar(80) | NOT NULL |  | Field name reference |
| `SPParamName` | varchar(50) | NULL |  |  |
| `iType` | tinyint | NULL |  | Type/category code |
| `bRequired` | tinyint | NULL |  |  |
| `iErrorID` | int | NULL |  | Integer field |
| `LimitStr` | varchar(100) | NULL |  |  |

### `UB_FS_DefOrgTIN`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `FieldName` | varchar(80) | NOT NULL |  | Field name reference |
| `SPParamName` | varchar(50) | NULL |  |  |
| `iType` | tinyint | NULL |  | Type/category code |
| `bRequired` | tinyint | NULL |  |  |
| `iErrorID` | int | NULL |  | Integer field |
| `LimitStr` | varchar(100) | NULL |  |  |

### `UB_FS_DefPriceRec`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `FieldName` | varchar(50) | NOT NULL |  | Field name reference |
| `SPParamName` | varchar(50) | NULL |  |  |
| `iStartPos` | smallint | NOT NULL |  |  |
| `iLength` | smallint | NOT NULL |  |  |
| `iType` | tinyint | NULL |  | Type/category code |
| `bRequired` | tinyint | NULL |  |  |
| `iErrorID` | int | NULL |  | Integer field |
| `LimitStr` | varchar(100) | NULL |  |  |
| `FSName` | varchar(100) | NULL |  |  |
| `bHeader` | tinyint | NULL |  |  |

### `UB_FS_DefRule_FD`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `KeyStr` | varchar(50) | NOT NULL |  |  |
| `iValue` | tinyint | NOT NULL |  | Small integer/flag field |
| `CtrlStr` | varchar(50) | NOT NULL |  |  |

### `UB_FS_DefServiceParam`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `KeyStr` | varchar(50) | NOT NULL |  |  |
| `ValueStr` | varchar(300) | NULL |  |  |
| `CtrlStr` | varchar(50) | NOT NULL |  |  |

### `UB_FS_DefSysPlan`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `FieldName` | varchar(80) | NOT NULL |  | Field name reference |
| `SPParamName` | varchar(50) | NULL |  |  |
| `iType` | tinyint | NULL |  | Type/category code |
| `bRequired` | tinyint | NULL |  |  |
| `iErrorID` | int | NULL |  | Integer field |
| `LimitStr` | varchar(100) | NULL |  |  |

### `UB_FS_DefSysPlanDetail`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `FieldName` | varchar(80) | NOT NULL |  | Field name reference |
| `SPParamName` | varchar(50) | NULL |  |  |
| `iType` | tinyint | NULL |  | Type/category code |
| `bRequired` | tinyint | NULL |  |  |
| `iErrorID` | int | NULL |  | Integer field |
| `LimitStr` | varchar(100) | NULL |  |  |

### `UB_FS_DefTCR`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `FieldName` | varchar(80) | NOT NULL |  | Field name reference |
| `SPParamName` | varchar(50) | NULL |  |  |
| `iType` | tinyint | NULL |  | Type/category code |
| `bRequired` | tinyint | NULL |  |  |
| `iErrorID` | int | NULL |  | Integer field |
| `LimitStr` | varchar(100) | NULL |  |  |

### `UB_FS_DefTrxRec`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `FieldName` | varchar(50) | NOT NULL |  | Field name reference |
| `SPParamName` | varchar(50) | NULL |  |  |
| `iStartPos` | smallint | NOT NULL |  |  |
| `iLength` | smallint | NOT NULL |  |  |
| `iType` | tinyint | NULL |  | Type/category code |
| `bRequired` | tinyint | NOT NULL |  |  |
| `iErrorID` | int | NULL |  | Integer field |
| `LimitStr` | varchar(100) | NULL |  |  |
| `FSName` | varchar(100) | NULL |  |  |
| `bHeader` | tinyint | NOT NULL |  |  |

### `UB_FS_DefUCIData`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `FieldName` | varchar(80) | NOT NULL |  | Field name reference |
| `SPParamName` | varchar(50) | NULL |  |  |
| `iType` | tinyint | NULL |  | Type/category code |
| `bRequired` | tinyint | NULL |  |  |
| `iErrorID` | int | NULL |  | Integer field |
| `LimitStr` | varchar(100) | NULL |  |  |

### `UB_FS_DefWSRec`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `FieldName` | varchar(80) | NOT NULL |  | Field name reference |
| `SPParamName` | varchar(50) | NULL |  |  |
| `iType` | tinyint | NULL |  | Type/category code |
| `bRequired` | tinyint | NULL |  |  |
| `iErrorID` | int | NULL |  | Integer field |
| `LimitStr` | varchar(100) | NULL |  |  |

### `UB_FS_DefXMLBulkRec`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `FieldName` | varchar(80) | NOT NULL |  | Field name reference |
| `SPParamName` | varchar(50) | NULL |  |  |
| `iType` | tinyint | NULL |  | Type/category code |
| `bRequired` | tinyint | NULL |  |  |
| `iErrorID` | int | NULL |  | Integer field |
| `LimitStr` | varchar(100) | NULL |  |  |

### `UB_FS_DefXMLTrxRec`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `FieldName` | varchar(80) | NOT NULL |  | Field name reference |
| `SPParamName` | varchar(50) | NULL |  |  |
| `iType` | tinyint | NULL |  | Type/category code |
| `bRequired` | tinyint | NULL |  |  |
| `iErrorID` | int | NULL |  | Integer field |
| `LimitStr` | varchar(100) | NULL |  |  |

### `UB_FS_DefXMLTrxRecDetail`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `FieldName` | varchar(80) | NOT NULL |  | Field name reference |
| `SPParamName` | varchar(50) | NULL |  |  |
| `iType` | tinyint | NULL |  | Type/category code |
| `bRequired` | tinyint | NULL |  |  |
| `iErrorID` | int | NULL |  | Integer field |
| `LimitStr` | varchar(100) | NULL |  |  |

### `UB_FS_DefXMLTrxRecDetailFee`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `FieldName` | varchar(80) | NOT NULL |  | Field name reference |
| `SPParamName` | varchar(50) | NULL |  |  |
| `iType` | tinyint | NULL |  | Type/category code |
| `bRequired` | tinyint | NULL |  |  |
| `iErrorID` | int | NULL |  | Integer field |
| `LimitStr` | varchar(100) | NULL |  |  |

### `UB_FS_DefXMLTrxRecReject`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `FieldName` | varchar(80) | NOT NULL |  | Field name reference |
| `SPParamName` | varchar(50) | NULL |  |  |
| `iType` | tinyint | NULL |  | Type/category code |
| `bRequired` | tinyint | NULL |  |  |
| `iErrorID` | int | NULL |  | Integer field |
| `LimitStr` | varchar(100) | NULL |  |  |

### `UB_FS_ErrorLog`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iFileID` | int | NOT NULL |  | FK to file record (FundServ file) |
| `iRecID` | int | NOT NULL |  | Integer field |
| `iErrorID` | int | NOT NULL |  | Integer field |
| `iLevel` | tinyint | NOT NULL |  | Small integer/flag field |
| `iRefType` | smallint | NOT NULL |  |  |
| `iRefID` | int | NOT NULL |  | Integer field |
| `Notes` | varchar(max) | NULL |  |  |
| `dtCreated` | datetime | NOT NULL |  | Timestamp when record was created |
| `MgmtCode` | varchar(5) | NULL |  | Management company code |
| `FundID` | varchar(5) | NULL |  | Fund identifier code (e.g., DYN 3056) |
| `FundAccountID` | varchar(15) | NULL |  |  |
| `iStatus` | tinyint | NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |

### `UB_FS_ErrorLogLevel`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | smallint | NOT NULL |  | Primary key, auto-increment identifier |
| `NameEN` | varchar(50) | NULL |  | English name |
| `NameFR` | varchar(50) | NULL |  | French name |
| `iOrder` | smallint | NULL |  |  |

### `UB_FS_File`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `FileCode` | varchar(8) | NULL |  |  |
| `FileName` | varchar(80) | NULL |  | File name |
| `FileNameFull` | varchar(400) | NULL |  |  |
| `iStatus` | smallint | NOT NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `dtImportStart` | datetime | NULL |  | Date/time field |
| `dtImportEnd` | datetime | NULL |  | Date/time field |
| `iRecordTotal` | int | NULL |  | Integer field |
| `iRecordError` | int | NULL |  | Integer field |
| `iRecordWarning` | int | NULL |  | Integer field |
| `iRecordOK` | int | NULL |  | Integer field |
| `dtEffective` | datetime | NULL |  | Effective date |
| `iRecordDetail` | int | NULL |  | Integer field |
| `iRecordHeader` | int | NULL |  | Integer field |
| `iRecordTrailer` | int | NULL |  | Integer field |

### `UB_FS_File_Record`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `FileID` | int | NOT NULL |  |  |
| `iStatus` | smallint | NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `iLineNumber` | smallint | NULL |  |  |
| `iErrorID` | int | NULL |  | Integer field |
| `ErrorMSG` | varchar(max) | NULL |  |  |
| `Record` | varchar(max) | NOT NULL |  |  |

### `UB_FS_File_Record_FD`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iFileID` | int | NOT NULL |  | FK to file record (FundServ file) |
| `iImportStatus` | tinyint | NOT NULL |  | Small integer/flag field |
| `MgmtCode` | varchar(6) | NOT NULL |  | Management company code |
| `FundID` | varchar(6) | NOT NULL |  | Fund identifier code (e.g., DYN 3056) |
| `iReasonID` | tinyint | NOT NULL |  | Small integer/flag field |
| `XMLStr` | varchar(max) | NOT NULL |  |  |

### `UB_FS_FileCode`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `FileCode` | varchar(8) | NOT NULL |  |  |
| `iOrder` | smallint | NULL |  |  |
| `Description` | varchar(200) | NULL |  |  |
| `FileCodeTest` | varchar(8) | NULL |  |  |
| `iRecordLen` | smallint | NULL |  |  |
| `HeaderID` | varchar(6) | NULL |  |  |
| `DetailID` | varchar(60) | NULL |  |  |
| `TrailerID` | varchar(6) | NULL |  |  |
| `NumRecPos` | smallint | NULL |  |  |
| `iVersion` | int | NULL |  | Integer field |
| `iStatus` | tinyint | NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |

### `UB_FS_FileStatus`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | smallint | NOT NULL |  | Primary key, auto-increment identifier |
| `NameEN` | varchar(50) | NULL |  | English name |
| `NameFR` | varchar(50) | NULL |  | French name |
| `iOrder` | smallint | NULL |  |  |

### `UB_FS_MoneyMovement`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iFileID` | int | NULL |  | FK to file record (FundServ file) |
| `RecordType` | varchar(3) | NULL |  |  |
| `DealerCode` | varchar(5) | NULL |  | Dealer code identifier |
| `MgmtCode` | varchar(5) | NULL |  | Management company code |
| `PaymentID` | varchar(20) | NULL |  |  |
| `dtSettlement` | datetime | NULL |  | Settlement date |
| `iStatus` | tinyint | NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `SettlementStatus` | char(1) | NULL |  |  |
| `SettlementMethod` | char(1) | NULL |  |  |
| `SettlementSource` | char(1) | NULL |  |  |
| `mSettlementAmount` | money | NULL |  |  |
| `CurrencyCode` | varchar(3) | NULL |  |  |
| `iSequence` | int | NULL |  | Sequence number |
| `IntermediaryCode` | varchar(5) | NULL |  |  |
| `OrderSource` | char(1) | NULL |  |  |

### `UB_FS_RecordStatus`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | smallint | NOT NULL |  | Primary key, auto-increment identifier |
| `NameEN` | varchar(50) | NULL |  | English name |
| `NameFR` | varchar(50) | NULL |  | French name |
| `iOrder` | smallint | NULL |  |  |

### `UB_FS_TrxRecSkip`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `iTMPTrxRecID` | int | NOT NULL |  | Integer field |
| `iStatus` | tinyint | NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `Notes` | varchar(120) | NULL |  |  |
| `dtLastModified` | datetime | NULL |  | Timestamp when record was last modified |
| `iUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |

---

## Fund Definition & Transactions

### `UB_FundAccount`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `MgmtCode` | varchar(6) | NULL |  | Management company code |
| `FundAccountID` | varchar(15) | NOT NULL |  |  |
| `iPlanID` | int | NOT NULL |  | FK to UB_Plan table - identifies the investment plan/account |
| `dtEffective` | datetime | NULL |  | Effective date |
| `iModifiedMethod` | tinyint | NULL |  | Small integer/flag field |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `iCreatedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `dtLastModified` | datetime | NULL |  | Timestamp when record was last modified |
| `iLastModifiedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who last modified this record |
| `iReturnMail` | tinyint | NULL |  | Small integer/flag field |
| `dtAccCreation` | datetime | NULL |  | Date/time field |
| `dtAccTermination` | datetime | NULL |  | Date/time field |
| `Description` | varchar(80) | NULL |  |  |
| `Status` | char(1) | NULL |  |  |
| `iFileID` | int | NULL |  | FK to file record (FundServ file) |
| `iProductType` | tinyint | NULL |  | Small integer/flag field |
| `AcctTypeDtl` | char(1) | NULL |  |  |
| `MgmtLnkID` | varchar(15) | NULL |  |  |

### `UB_FundAccountID`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iFundAccountID` | int | NULL |  | Integer field |

### `UB_FundAccountIncome`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iFundAccountID` | int | NULL |  | Integer field |
| `iTaxYear` | int | NULL |  | Integer field |
| `mCapGain` | money | NULL |  |  |
| `mTotalDividend` | money | NULL |  |  |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |

### `UB_FundAccountPosition`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iFundAccountID` | int | NOT NULL |  | Integer field |
| `iPlanID` | int | NOT NULL |  | FK to UB_Plan table - identifies the investment plan/account |
| `MgmtCode` | varchar(6) | NULL |  | Management company code |
| `FundID` | varchar(6) | NULL |  | Fund identifier code (e.g., DYN 3056) |
| `fUnitU` | float | NULL |  | Decimal/float value |
| `fUnitA` | float | NULL |  | Decimal/float value |
| `fUnitTotal` | float | NULL |  | Decimal/float value |
| `mAvgCostFC` | float | NULL |  | Monetary value |
| `dtEffective` | datetime | NULL |  | Effective date |
| `iModifiedMethod` | tinyint | NULL |  | Small integer/flag field |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `iCreatedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `dtLastModified` | datetime | NULL |  | Timestamp when record was last modified |
| `iLastModifiedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who last modified this record |
| `bXMLDividend` | tinyint | NULL |  |  |
| `bSystematic` | tinyint | NULL |  |  |
| `Notes` | varchar(max) | NULL |  |  |
| `mPrice` | money | NULL |  |  |
| `CertificateInd` | char(1) | NULL |  |  |
| `DividendOpt` | char(1) | NULL |  |  |
| `iPMTInfo` | tinyint | NULL |  | Small integer/flag field |
| `Status` | char(1) | NULL |  |  |
| `iFileID` | int | NULL |  | FK to file record (FundServ file) |
| `iWFID` | int | NULL |  | Integer field |
| `CurrencyCode` | varchar(3) | NULL |  |  |
| `dtEnd` | datetime | NULL |  | Date/time field |
| `dtStart` | datetime | NULL |  | Date/time field |
| `iFlag1` | tinyint | NULL |  | Small integer/flag field |
| `iFlag2` | tinyint | NULL |  | Small integer/flag field |
| `iSwitchYear` | int | NULL |  | Integer field |
| `iFileIDPSP` | int | NULL |  | FK to file record (FundServ file) |
| `iFeeAUAExclude` | tinyint | NULL |  | Small integer/flag field |
| `iFeeRedemptionOrder` | int | NULL |  | Integer field |
| `iProductType` | tinyint | NULL |  | Small integer/flag field |
| `iAvgFlag` | tinyint | NULL |  | Small integer/flag field |
| `Symbol` | varchar(15) | NULL |  |  |
| `iOmnibusFlag` | tinyint | NULL |  | Small integer/flag field |
| `ExtraInfo` | varchar(15) | NULL |  |  |

### `UB_FundAccountPositionBank`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `iPositionID` | int | NOT NULL |  | Integer field |
| `iAccountID` | int | NULL |  | Integer field |
| `HolderName` | varchar(40) | NULL |  |  |
| `AccountType` | char(1) | NULL |  |  |
| `Code` | varchar(3) | NULL |  |  |
| `TransitNumber` | varchar(5) | NULL |  |  |
| `AccountNumber` | varchar(12) | NULL |  |  |
| `CurrencyCode` | varchar(2) | NULL |  |  |

### `UB_FundAccountPositionCheque`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `iPositionID` | int | NOT NULL |  | Integer field |
| `Type` | char(1) | NULL |  |  |
| `Title` | char(1) | NULL |  |  |
| `LastName` | varchar(20) | NULL |  | Last name |
| `FirstName` | varchar(20) | NULL |  | First name |
| `Address` | varchar(120) | NULL |  |  |
| `City` | varchar(30) | NULL |  |  |
| `Province` | varchar(2) | NULL |  |  |
| `Country` | varchar(3) | NULL |  |  |
| `PostalCode` | varchar(10) | NULL |  |  |

### `UB_FundAccountPositionFeeRate`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `iPosID` | int | NOT NULL |  | FK to position record (fund holding) |
| `iType` | tinyint | NULL |  | Type/category code |
| `fFeeRate` | float | NULL |  | Decimal/float value |
| `dtLastModified` | datetime | NULL |  | Timestamp when record was last modified |
| `iUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `iNFUStatus` | tinyint | NULL |  | Small integer/flag field |

### `UB_FundAccountPosServiceFee`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iPosID` | int | NOT NULL |  | FK to position record (fund holding) |
| `iDayStart` | int | NOT NULL |  | Integer field |
| `iDayEnd` | int | NOT NULL |  | Integer field |
| `CommType` | char(1) | NOT NULL |  |  |
| `mTotCommPd` | money | NULL |  |  |
| `iFileID` | int | NULL |  | FK to file record (FundServ file) |
| `CurrencyCode` | char(2) | NULL |  |  |
| `mTaxCollected` | money | NULL |  |  |
| `mTotPaid` | money | NULL |  |  |
| `iUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `dtLastModified` | datetime | NULL |  | Timestamp when record was last modified |
| `iRevenueDetailID` | int | NULL |  | Integer field |
| `JurTaxCode` | varchar(3) | NULL |  |  |

### `UB_FundAccountSchedule`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iFundAccountID` | int | NOT NULL |  | Integer field |
| `iPlanID` | int | NOT NULL |  | FK to UB_Plan table - identifies the investment plan/account |
| `PlanIndicator` | char(1) | NULL |  |  |
| `Frequency` | char(1) | NULL |  |  |
| `dtStart` | datetime | NULL |  | Date/time field |
| `dtStop` | datetime | NULL |  | Date/time field |
| `dtRestart` | datetime | NULL |  | Date/time field |
| `mAmount` | money | NOT NULL |  | Monetary amount |
| `bLargeAmount` | tinyint | NOT NULL |  |  |
| `fCommissionPer` | float | NOT NULL |  | Decimal/float value |
| `bXMLAddPAC` | tinyint | NULL |  |  |
| `AmountType` | char(1) | NULL |  |  |
| `dtNextRun` | datetime | NULL |  | Date/time field |
| `SysPlanStatus` | char(1) | NULL |  |  |
| `fAnnualIncrease` | float | NULL |  | Decimal/float value |
| `iSupConfirm` | tinyint | NULL |  | Small integer/flag field |
| `GrossNet` | char(1) | NULL |  |  |
| `SettMethod` | char(1) | NULL |  |  |
| `iFileID` | int | NULL |  | FK to file record (FundServ file) |
| `iNoSync` | tinyint | NULL |  | Small integer/flag field |
| `dt2ndDate` | datetime | NULL |  | Date/time field |
| `iRRIFID` | int | NULL |  | Integer field |
| `iRunID` | int | NULL |  | Integer field |
| `dtLastRun` | datetime | NULL |  | Date/time field |
| `iPMTInfo` | tinyint | NULL |  | Small integer/flag field |
| `iTrustBankID` | int | NULL |  | Integer field |
| `mTaxFed` | money | NULL |  |  |
| `mTaxProv` | money | NULL |  |  |
| `iCashOpt` | tinyint | NULL |  | Small integer/flag field |
| `iProcessingStatus` | tinyint | NULL |  | Small integer/flag field |
| `dtLastProcessing` | datetime | NULL |  | Date/time field |
| `iLastEFTID` | int | NULL |  | Integer field |
| `iLastChequeID` | int | NULL |  | Integer field |
| `iLastModifiedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who last modified this record |
| `dtLastModified` | datetime | NULL |  | Timestamp when record was last modified |
| `iRestrictionFlag` | tinyint | NULL |  | Small integer/flag field |
| `dtLastReview` | datetime | NULL |  | Date/time field |
| `iLastReviewUserID` | int | NULL |  | Integer field |
| `Notes` | varchar(max) | NULL |  |  |
| `iWarning` | tinyint | NULL |  | Small integer/flag field |

### `UB_FundAccountScheduleDetail`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iSysPlanID` | int | NOT NULL |  | Integer field |
| `iDestination` | tinyint | NOT NULL |  | Small integer/flag field |
| `iFundAccountID` | int | NULL |  | Integer field |
| `iFundAccountPosID` | int | NULL |  | Integer field |
| `FundAccountID` | varchar(20) | NULL |  |  |
| `FundID` | varchar(6) | NOT NULL |  | Fund identifier code (e.g., DYN 3056) |
| `fSysPlanSplit` | float | NULL |  | Decimal/float value |
| `iLastTrxID` | int | NULL |  | Integer field |
| `AmountType` | char(1) | NULL |  |  |
| `iWarning` | tinyint | NULL |  | Small integer/flag field |

### `UB_FundAccountSeg`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `iFundAccountID` | int | NOT NULL |  | Integer field |
| `LIBOpt` | char(1) | NULL |  |  |
| `LIBFundID` | varchar(5) | NULL |  |  |
| `iMatGuaResetOpt` | tinyint | NULL |  | Small integer/flag field |
| `MatGuaResetFundID` | varchar(5) | NULL |  |  |
| `iDthBnftResetOpt` | tinyint | NULL |  | Small integer/flag field |
| `DthBnftResetFundID` | varchar(5) | NULL |  | Date/time field |
| `fEstateSplit` | float | NULL |  | Decimal/float value |

### `UB_FundAccountSupplierRepCode`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `MgmtCode` | varchar(5) | NULL |  | Management company code |
| `iFileID` | int | NULL |  | FK to file record (FundServ file) |
| `dtEffective` | datetime | NULL |  | Effective date |
| `DealerCode` | varchar(5) | NULL |  | Dealer code identifier |
| `RepCode` | varchar(5) | NULL |  | Representative/advisor code |
| `iFundAccountID` | int | NULL |  | Integer field |

### `UB_FundAccountUCIData`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iFileID` | int | NULL |  | FK to file record (FundServ file) |
| `iFundAccountID` | int | NULL |  | Integer field |
| `LEI` | varchar(20) | NULL |  |  |
| `UCI` | varchar(20) | NULL |  |  |
| `SIAIndividualFlg` | char(1) | NULL |  |  |
| `fInterestInDeposit` | float | NULL |  | Decimal/float value |

### `UB_FundataDownloadCount`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `iMemberID` | int | NOT NULL |  | FK to UB_Member - identifies the member/advisor |
| `iMonths` | int | NOT NULL |  | Integer field |
| `iCount` | int | NULL |  | Integer field |

### `UB_FundataFile`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `dtImport` | datetime | NULL |  | Date/time field |
| `FileName` | varchar(255) | NULL |  | File name |
| `iFileType` | tinyint | NULL |  | Small integer/flag field |

### `UB_FundataFileDef`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `FieldName` | varchar(100) | NULL |  | Field name reference |
| `SPParamName` | varchar(100) | NULL |  |  |
| `iType` | tinyint | NULL |  | Type/category code |
| `iPos` | smallint | NULL |  |  |

### `UB_FundataFundInfoDef`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `FieldName` | varchar(100) | NULL |  | Field name reference |
| `SPParamName` | varchar(100) | NULL |  |  |
| `iType` | tinyint | NULL |  | Type/category code |
| `iPos` | smallint | NULL |  |  |

### `UB_FundAveragedCost`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `iPosID` | int | NOT NULL |  | FK to position record (fund holding) |
| `iDays` | int | NOT NULL |  | Integer field |
| `mAvgCost` | float | NULL |  | Monetary value |
| `iSource` | tinyint | NULL |  | Small integer/flag field |
| `iTrxID` | int | NULL |  | Integer field |
| `iFileID` | int | NULL |  | FK to file record (FundServ file) |

### `UB_FundCompareListCurrent`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iMemberID` | int | NOT NULL |  | FK to UB_Member - identifies the member/advisor |
| `iFundDefID` | int | NOT NULL |  | Integer field |
| `iOrder` | int | NULL |  | Integer field |

### `UB_FundCompareListCurrentClient`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iClientID` | int | NOT NULL |  | FK to UB_Client table - identifies the client/investor |
| `iFundDefID` | int | NOT NULL |  | Integer field |
| `iCreatedUserID` | int | NOT NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `iOrder` | int | NULL |  | Integer field |

### `UB_FundDef`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iSegFund` | tinyint | NOT NULL |  | Small integer/flag field |
| `MgmtCode` | varchar(6) | NULL |  | Management company code |
| `FundID` | varchar(6) | NULL |  | Fund identifier code (e.g., DYN 3056) |
| `dtEffectDate` | datetime | NOT NULL |  | Date/time field |
| `CUSIP` | varchar(12) | NULL |  |  |
| `ISIN` | varchar(15) | NULL |  |  |
| `EngNameShort` | varchar(50) | NOT NULL |  |  |
| `EngNameLong` | varchar(80) | NOT NULL |  |  |
| `FreNameShort` | varchar(50) | NOT NULL |  |  |
| `FreNameLong` | varchar(80) | NOT NULL |  |  |
| `bMoneyMrktFlg` | tinyint | NOT NULL |  |  |
| `bRRSPFlg` | tinyint | NOT NULL |  |  |
| `Series` | varchar(5) | NULL |  |  |
| `Brand` | varchar(15) | NOT NULL |  |  |
| `EligProv` | varchar(80) | NOT NULL |  |  |
| `iEligBuy` | tinyint | NOT NULL |  | Small integer/flag field |
| `iEligComReb` | tinyint | NOT NULL |  | Small integer/flag field |
| `iEligSwIn` | tinyint | NOT NULL |  | Small integer/flag field |
| `iEligSwOut` | tinyint | NOT NULL |  | Small integer/flag field |
| `iEligSell` | tinyint | NOT NULL |  | Small integer/flag field |
| `iEligItIn` | tinyint | NOT NULL |  | Small integer/flag field |
| `iEligItOut` | tinyint | NOT NULL |  | Small integer/flag field |
| `iEligEtIn` | tinyint | NOT NULL |  | Small integer/flag field |
| `iEligEtOut` | tinyint | NOT NULL |  | Small integer/flag field |
| `iEligLROIn` | tinyint | NOT NULL |  | Small integer/flag field |
| `iEligLROOut` | tinyint | NOT NULL |  | Small integer/flag field |
| `iEligFee` | tinyint | NOT NULL |  | Small integer/flag field |
| `iEligReset` | tinyint | NOT NULL |  | Small integer/flag field |
| `iEligICTIn` | tinyint | NOT NULL |  | Small integer/flag field |
| `iEligICTOut` | tinyint | NOT NULL |  | Small integer/flag field |
| `iEligSegMature` | tinyint | NULL |  | Small integer/flag field |
| `bEligUS` | tinyint | NOT NULL |  |  |
| `bEligOffshore` | tinyint | NOT NULL |  |  |
| `bEligRESP` | tinyint | NOT NULL |  |  |
| `bEligReg` | tinyint | NULL |  |  |
| `bEligTFSA` | tinyint | NULL |  |  |
| `bEligPAC` | tinyint | NOT NULL |  |  |
| `bEligSWP` | tinyint | NOT NULL |  |  |
| `bEligFeeAcct` | tinyint | NULL |  |  |
| `iFileID` | int | NOT NULL |  | FK to file record (FundServ file) |
| `fPrice` | float | NULL |  | Unit price of fund |
| `dtPrice` | datetime | NULL |  | Date/time field |
| `bApproved` | tinyint | NOT NULL |  |  |
| `bDirectSettle` | tinyint | NOT NULL |  |  |
| `dtRiskModified` | datetime | NULL |  | Date/time field |
| `iNetWork` | tinyint | NOT NULL |  | Small integer/flag field |
| `iRiskLocked` | tinyint | NOT NULL |  | Small integer/flag field |
| `bNotificationBuy` | tinyint | NOT NULL |  |  |
| `bNotificationSell` | tinyint | NOT NULL |  |  |
| `bNotificationSwitch` | tinyint | NOT NULL |  |  |
| `bNotificationIT` | tinyint | NOT NULL |  |  |
| `bNotificationREV` | tinyint | NOT NULL |  |  |
| `bNotificationAOT` | tinyint | NOT NULL |  |  |
| `bCapped` | tinyint | NOT NULL |  |  |
| `bElectronic` | tinyint | NOT NULL |  |  |
| `bSelfDirected` | tinyint | NOT NULL |  |  |
| `iExemptSecurity` | tinyint | NOT NULL |  | Small integer/flag field |
| `ProductType` | char(1) | NOT NULL |  |  |
| `Currency` | varchar(3) | NOT NULL |  |  |
| `LoadType` | varchar(4) | NULL |  |  |
| `LoadTypeDtl` | varchar(5) | NOT NULL |  |  |
| `Classification` | varchar(2) | NOT NULL |  |  |
| `TaxStructure` | char(1) | NOT NULL |  |  |
| `MoneyMrktFlg` | char(1) | NOT NULL |  |  |
| `BareTrusteeFlg` | char(1) | NOT NULL |  |  |
| `RiskRating` | char(1) | NOT NULL |  |  |
| `ReqDocType` | char(1) | NOT NULL |  |  |
| `Status` | char(1) | NOT NULL |  |  |
| `StatusPending` | char(1) | NOT NULL |  |  |
| `dtCreated` | datetime | NOT NULL |  | Timestamp when record was created |
| `dtLastModified` | datetime | NOT NULL |  | Timestamp when record was last modified |
| `iCreatedUserID` | int | NOT NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `iLastModifiedUserID` | int | NOT NULL |  | FK to UB_MemberLogin - internal user who last modified this record |
| `iTempFlag` | tinyint | NOT NULL |  | Small integer/flag field |
| `ParentFundID` | varchar(5) | NOT NULL |  |  |
| `iType` | smallint | NOT NULL |  | Type/category code |
| `iCashDeposit` | tinyint | NULL |  | Small integer/flag field |
| `iRegion` | smallint | NULL |  |  |
| `bWrap` | tinyint | NULL |  |  |
| `bETF` | tinyint | NULL |  |  |
| `FundID2` | varchar(6) | NULL |  |  |
| `CFNProdCode` | varchar(12) | NULL |  |  |
| `iFFObjIDEN` | int | NULL |  | Integer field |
| `iFFObjIDFR` | int | NULL |  | Integer field |
| `iUndefinedMKV` | tinyint | NULL |  | Small integer/flag field |
| `Class` | varchar(5) | NULL |  |  |
| `SerClassSeq` | char(2) | NULL |  |  |
| `iDiscBrokerOnly` | tinyint | NULL |  | Small integer/flag field |
| `iNegotiateTrail` | tinyint | NULL |  | Small integer/flag field |
| `iNegotiateFee` | tinyint | NULL |  | Small integer/flag field |
| `iInvObj` | tinyint | NULL |  | Small integer/flag field |
| `iSpecial` | tinyint | NULL |  | Small integer/flag field |
| `StockMarket` | varchar(6) | NULL |  |  |
| `Symbol` | varchar(15) | NULL |  |  |
| `bEligFeeAcctLock` | tinyint | NULL |  |  |
| `iCheckRiskObj` | tinyint | NULL |  | Small integer/flag field |
| `bAlternative` | tinyint | NULL |  |  |
| `bCDICFlg` | tinyint | NULL |  |  |
| `CDICMI` | varchar(4) | NULL |  |  |
| `bUSHoliday` | tinyint | NULL |  |  |
| `iTPlus` | tinyint | NULL |  | Small integer/flag field |
| `OEOEquivalent` | varchar(5) | NULL |  |  |
| `UserDefined1` | varchar(6) | NULL |  |  |
| `UserDefined2` | char(6) | NULL |  |  |
| `UserDefined3` | char(6) | NULL |  |  |

### `UB_FundDefAA`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iFundID` | int | NOT NULL |  | Integer field |
| `ParentFundID` | varchar(5) | NULL |  |  |
| `FrmParentFundID` | varchar(5) | NULL |  |  |
| `dtModified` | datetime | NULL |  | Date/time field |
| `iUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `iStatus` | tinyint | NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |

### `UB_FundDefAATMP`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `SessionID` | varchar(50) | NOT NULL |  |  |
| `iMode` | tinyint | NOT NULL |  | Processing mode |
| `iAAID` | int | NOT NULL |  | Integer field |
| `iFundID` | int | NOT NULL |  | Integer field |
| `ParentFundID` | varchar(5) | NULL |  |  |
| `FrmParentFundID` | varchar(5) | NULL |  |  |
| `dtModified` | datetime | NULL |  | Date/time field |
| `iUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |

### `UB_FundDefAllocation`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iFundDefID` | int | NULL |  | Integer field |
| `iAllocType` | smallint | NULL |  |  |
| `AllocDescription` | varchar(80) | NULL |  |  |
| `fAllocValue` | float | NULL |  | Decimal/float value |
| `dtEffective` | datetime | NULL |  | Effective date |
| `iFileID` | int | NULL |  | FK to file record (FundServ file) |
| `iUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |

### `UB_FundDefCAA`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iFundID` | int | NOT NULL |  | Integer field |
| `ChildFundID` | varchar(5) | NULL |  |  |
| `ChildAllocateModel` | char(1) | NULL |  |  |
| `dtModified` | datetime | NULL |  | Date/time field |
| `iUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `iStatus` | tinyint | NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |

### `UB_FundDefCurPrice`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `iFundDefID` | int | NOT NULL |  | Integer field |
| `MgmtCode` | varchar(6) | NULL |  | Management company code |
| `FundID` | varchar(6) | NULL |  | Fund identifier code (e.g., DYN 3056) |
| `fPrice` | float | NULL |  | Unit price of fund |
| `dtPrice` | datetime | NULL |  | Date/time field |
| `Currency` | varchar(2) | NULL |  |  |

### `UB_FundDefCusModel`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iFundID` | int | NOT NULL |  | Integer field |
| `iModelType` | tinyint | NOT NULL |  | Small integer/flag field |
| `dtCutoffDate` | datetime | NULL |  | Date/time field |
| `dtPriceDate` | datetime | NULL |  | Date/time field |
| `dtSettlDate` | datetime | NULL |  | Date/time field |
| `dtModified` | datetime | NULL |  | Date/time field |
| `iUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `iStatus` | tinyint | NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |

### `UB_FundDefCusModelTMP`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `SessionID` | varchar(50) | NOT NULL |  |  |
| `iMode` | tinyint | NOT NULL |  | Processing mode |
| `iModelID` | int | NOT NULL |  | Integer field |
| `iFundID` | int | NOT NULL |  | Integer field |
| `iModelType` | tinyint | NOT NULL |  | Small integer/flag field |
| `dtCutoffDate` | datetime | NULL |  | Date/time field |
| `dtPriceDate` | datetime | NULL |  | Date/time field |
| `dtSettlDate` | datetime | NULL |  | Date/time field |
| `dtModified` | datetime | NULL |  | Date/time field |
| `iUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |

### `UB_FundDefDetail`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL |  | Primary key, auto-increment identifier |
| `iModelTypeF` | tinyint | NULL |  | Small integer/flag field |
| `iSettlPeriodF` | tinyint | NULL |  | Small integer/flag field |
| `iCutoffDay1F` | tinyint | NULL |  | Small integer/flag field |
| `iCutoffDay2F` | tinyint | NULL |  | Small integer/flag field |
| `iPriceDay1F` | tinyint | NULL |  | Small integer/flag field |
| `iPriceDay2F` | tinyint | NULL |  | Small integer/flag field |
| `iModelTypeB` | tinyint | NULL |  | Small integer/flag field |
| `iSettlPeriodB` | tinyint | NULL |  | Small integer/flag field |
| `iCutoffDay1B` | tinyint | NULL |  | Small integer/flag field |
| `iCutoffDay2B` | tinyint | NULL |  | Small integer/flag field |
| `iPriceDay1B` | tinyint | NULL |  | Small integer/flag field |
| `iPriceDay2B` | tinyint | NULL |  | Small integer/flag field |
| `iModelTypeS` | tinyint | NULL |  | Small integer/flag field |
| `iSettlPeriodS` | tinyint | NULL |  | Small integer/flag field |
| `iCutoffDay1S` | tinyint | NULL |  | Small integer/flag field |
| `iCutoffDay2S` | tinyint | NULL |  | Small integer/flag field |
| `iPriceDay1S` | tinyint | NULL |  | Small integer/flag field |
| `iPriceDay2S` | tinyint | NULL |  | Small integer/flag field |
| `mAcctSetupFee` | money | NULL |  |  |
| `fServFeeRate` | float | NULL |  | Decimal/float value |
| `ServFeeFreq` | char(1) | NULL |  |  |
| `fDSCRate` | float | NULL |  | Decimal/float value |
| `iDSCDuration` | smallint | NULL |  |  |
| `fMaxCommRate` | float | NULL |  | Decimal/float value |
| `fMaxSwitchCommRate` | float | NULL |  | Decimal/float value |
| `AllocateModel` | char(1) | NULL |  |  |
| `dtMatureDate` | datetime | NULL |  | Date/time field |
| `mMinFirst` | money | NULL |  |  |
| `mMinNext` | money | NULL |  |  |
| `mMinSell` | money | NULL |  |  |
| `mMinSwitch` | money | NULL |  |  |
| `mMinTrnsfr` | money | NULL |  |  |
| `mMinBalance` | money | NULL |  |  |
| `mMinPAC` | money | NULL |  |  |
| `DivFrequency` | char(1) | NULL |  |  |
| `bDivOpt1` | bit | NULL |  |  |
| `bDivOpt4` | bit | NULL |  |  |
| `bDivOpt5` | bit | NULL |  |  |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `dtModified` | datetime | NULL |  | Date/time field |
| `fGrowthPortion` | float | NULL |  | Decimal/float value |
| `fHorizon` | float | NULL |  | Decimal/float value |
| `URL_EN` | varchar(500) | NULL |  |  |
| `URL_FR` | varchar(500) | NULL |  |  |
| `MSG_EN` | varchar(260) | NULL |  |  |
| `MSG_FR` | varchar(260) | NULL |  |  |
| `Notes` | varchar(max) | NULL |  |  |
| `InvestmentObjEN` | varchar(max) | NULL |  |  |
| `InvestmentObjFR` | varchar(max) | NULL |  |  |
| `fObj1` | float | NULL |  | Decimal/float value |
| `fObj2` | float | NULL |  | Decimal/float value |
| `fObj3` | float | NULL |  | Decimal/float value |
| `fObj4` | float | NULL |  | Decimal/float value |
| `fObj5` | float | NULL |  | Decimal/float value |
| `iUndefinedMKV` | tinyint | NULL |  | Small integer/flag field |
| `iLockObj` | tinyint | NULL |  | Small integer/flag field |
| `iLockHorizon` | tinyint | NULL |  | Small integer/flag field |
| `fAdminFee` | float | NULL |  | Decimal/float value |
| `fOtherFee` | float | NULL |  | Decimal/float value |
| `ClientNameAcctTypes` | varchar(80) | NULL |  |  |
| `NomineeAcctTypes` | varchar(80) | NULL |  |  |
| `mMinSWP` | money | NULL |  |  |
| `fMER` | float | NULL |  | Decimal/float value |

### `UB_FundDefFavorite`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `MgmtCode` | varchar(5) | NULL |  | Management company code |
| `FundID` | varchar(6) | NULL |  | Fund identifier code (e.g., DYN 3056) |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |

### `UB_FundDefManager`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `FundServCode` | varchar(15) | NULL |  |  |
| `Ticker` | varchar(15) | NULL |  |  |
| `ManagerType` | varchar(30) | NULL |  |  |
| `ManagerName` | varchar(80) | NULL |  |  |
| `Company` | varchar(80) | NULL |  |  |
| `Biography` | varchar(max) | NULL |  |  |
| `FrenchBiography` | varchar(max) | NULL |  |  |
| `iFileID` | int | NULL |  | FK to file record (FundServ file) |
| `dtEffective` | datetime | NULL |  | Effective date |
| `iFlag` | tinyint | NULL |  | Small integer/flag field |
| `MgmtCode` | varchar(5) | NULL |  | Management company code |
| `FundID` | varchar(5) | NULL |  | Fund identifier code (e.g., DYN 3056) |

### `UB_FundDefMergePending`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `MgmtCodeFrom` | varchar(5) | NULL |  |  |
| `FundIDFrom` | varchar(5) | NULL |  |  |
| `MgmtCodeTo` | varchar(5) | NULL |  |  |
| `FundIDTo` | varchar(5) | NULL |  |  |
| `dtEffective` | datetime | NULL |  | Effective date |
| `iStatus` | tinyint | NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |

### `UB_FundDefObjMatrix`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `FundClass` | char(2) | NULL |  |  |
| `Risk` | char(1) | NULL |  |  |
| `fObj1` | float | NULL |  | Decimal/float value |
| `fObj2` | float | NULL |  | Decimal/float value |
| `fObj3` | float | NULL |  | Decimal/float value |
| `fObj4` | float | NULL |  | Decimal/float value |
| `fObj5` | float | NULL |  | Decimal/float value |
| `fHorizon` | float | NULL |  | Decimal/float value |
| `iObj` | tinyint | NULL |  | Small integer/flag field |

### `UB_FundDefPerformance`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `iFundDefID` | int | NULL |  | Integer field |
| `MgmtCode` | varchar(5) | NULL |  | Management company code |
| `FundID` | varchar(5) | NULL |  | Fund identifier code (e.g., DYN 3056) |
| `FundservCode` | varchar(10) | NULL |  |  |
| `FundGrade` | char(2) | NULL |  |  |
| `SortinoRatio` | float | NULL |  |  |
| `StandardDeviation` | float | NULL |  |  |
| `DownSideDeviation` | float | NULL |  |  |
| `iVolatilityRanking` | int | NULL |  | Integer field |
| `i10YearVolatility` | int | NULL |  |  |
| `f1MonthReturn` | float | NULL |  | Decimal/float value |
| `f3MonthReturn` | float | NULL |  | Decimal/float value |
| `f6MonthReturn` | float | NULL |  | Decimal/float value |
| `fYTDReturn` | float | NULL |  | Decimal/float value |
| `fInceptionReturn` | float | NULL |  | Decimal/float value |
| `f1YrSimpleReturn` | float | NULL |  | Decimal/float value |
| `f2YrSimpleReturn` | float | NULL |  | Decimal/float value |
| `f3YrSimpleReturn` | float | NULL |  | Decimal/float value |
| `f4YrSimpleReturn` | float | NULL |  | Decimal/float value |
| `f5YrSimpleReturn` | float | NULL |  | Decimal/float value |
| `f6YrSimpleReturn` | float | NULL |  | Decimal/float value |
| `f7YrSimpleReturn` | float | NULL |  | Decimal/float value |
| `f8YrSimpleReturn` | float | NULL |  | Decimal/float value |
| `f9YrSimpleReturn` | float | NULL |  | Decimal/float value |
| `f10YrSimpleReturn` | float | NULL |  | Decimal/float value |
| `f15YrSimpleReturn` | float | NULL |  | Decimal/float value |
| `f20YrSimpleReturn` | float | NULL |  | Decimal/float value |
| `f1YrCompoundReturn` | float | NULL |  | Decimal/float value |
| `f2YrCompoundReturn` | float | NULL |  | Decimal/float value |
| `f3YrCompoundReturn` | float | NULL |  | Decimal/float value |
| `f4YrCompoundReturn` | float | NULL |  | Decimal/float value |
| `f5YrCompoundReturn` | float | NULL |  | Decimal/float value |
| `f6YrCompoundReturn` | float | NULL |  | Decimal/float value |
| `f7YrCompoundReturn` | float | NULL |  | Decimal/float value |
| `f8YrCompoundReturn` | float | NULL |  | Decimal/float value |
| `f9YrCompoundReturn` | float | NULL |  | Decimal/float value |
| `f10YrCompoundReturn` | float | NULL |  | Decimal/float value |
| `f15YrCompoundReturn` | float | NULL |  | Decimal/float value |
| `f20YrCompoundReturn` | float | NULL |  | Decimal/float value |
| `f1YrCalendarSimpleReturn` | float | NULL |  | Decimal/float value |
| `f2YrCalendarSimpleReturn` | float | NULL |  | Decimal/float value |
| `f3YrCalendarSimpleReturn` | float | NULL |  | Decimal/float value |
| `f4YrCalendarSimpleReturn` | float | NULL |  | Decimal/float value |
| `f5YrCalendarSimpleReturn` | float | NULL |  | Decimal/float value |
| `f6YrCalendarSimpleReturn` | float | NULL |  | Decimal/float value |
| `f7YrCalendarSimpleReturn` | float | NULL |  | Decimal/float value |
| `f8YrCalendarSimpleReturn` | float | NULL |  | Decimal/float value |
| `f9YrCalendarSimpleReturn` | float | NULL |  | Decimal/float value |
| `f10YrCalendarSimpleReturn` | float | NULL |  | Decimal/float value |
| `f15YrCalendarSimpleReturn` | float | NULL |  | Decimal/float value |
| `f20YrCalendarSimpleReturn` | float | NULL |  | Decimal/float value |
| `i1MonthQuartile` | int | NULL |  |  |
| `i3MonthQuartile` | int | NULL |  |  |
| `i6MonthQuartile` | int | NULL |  |  |
| `iYTDQuartile` | int | NULL |  | Integer field |
| `iInceptionQuartile` | int | NULL |  | Integer field |
| `i1YrSimpleQuartile` | int | NULL |  |  |
| `i2YrSimpleQuartile` | int | NULL |  |  |
| `i3YrSimpleQuartile` | int | NULL |  |  |
| `i4YrSimpleQuartile` | int | NULL |  |  |
| `i5YrSimpleQuartile` | int | NULL |  |  |
| `i6YrSimpleQuartile` | int | NULL |  |  |
| `i7YrSimpleQuartile` | int | NULL |  |  |
| `i8YrSimpleQuartile` | int | NULL |  |  |
| `i9YrSimpleQuartile` | int | NULL |  |  |
| `i10YrSimpleQuartile` | int | NULL |  |  |
| `i15YrSimpleQuartile` | int | NULL |  |  |
| `i20YrSimpleQuartile` | int | NULL |  |  |
| `i1YrCompoundQuartile` | int | NULL |  |  |
| `i2YrCompoundQuartile` | int | NULL |  |  |
| `i3YrCompoundQuartile` | int | NULL |  |  |
| `i4YrCompoundQuartile` | int | NULL |  |  |
| `i5YrCompoundQuartile` | int | NULL |  |  |
| `i6YrCompoundQuartile` | int | NULL |  |  |
| `i7YrCompoundQuartile` | int | NULL |  |  |
| `i8YrCompoundQuartile` | int | NULL |  |  |
| `i9YrCompoundQuartile` | int | NULL |  |  |
| `i10YrCompoundQuartile` | int | NULL |  |  |
| `i15YrCompoundQuartile` | int | NULL |  |  |
| `i20YrCompoundQuartile` | int | NULL |  |  |
| `i1YrCalendarSimpleQuartile` | int | NULL |  |  |
| `i2YrCalendarSimpleQuartile` | int | NULL |  |  |
| `i3YrCalendarSimpleQuartile` | int | NULL |  |  |
| `i4YrCalendarSimpleQuartile` | int | NULL |  |  |
| `i5YrCalendarSimpleQuartile` | int | NULL |  |  |
| `i6YrCalendarSimpleQuartile` | int | NULL |  |  |
| `i7YrCalendarSimpleQuartile` | int | NULL |  |  |
| `i8YrCalendarSimpleQuartile` | int | NULL |  |  |
| `i9YrCalendarSimpleQuartile` | int | NULL |  |  |
| `i10YrCalendarSimpleQuartile` | int | NULL |  |  |
| `i15YrCalendarSimpleQuartile` | int | NULL |  |  |
| `i20YrCalendarSimpleQuartile` | int | NULL |  |  |
| `i1MonthFundCount` | int | NULL |  |  |
| `i3MonthFundCount` | int | NULL |  |  |
| `i6MonthFundCount` | int | NULL |  |  |
| `iYTDFundCount` | int | NULL |  | Integer field |
| `iInceptionFundCount` | int | NULL |  | Integer field |
| `i1MonthRanking` | int | NULL |  |  |
| `i3MonthRanking` | int | NULL |  |  |
| `i6MonthRanking` | int | NULL |  |  |
| `iYTDRanking` | int | NULL |  | Integer field |
| `iInceptionRanking` | int | NULL |  | Integer field |
| `i1YrSimpleRanking` | int | NULL |  |  |
| `i2YrSimpleRanking` | int | NULL |  |  |
| `i3YrSimpleRanking` | int | NULL |  |  |
| `i4YrSimpleRanking` | int | NULL |  |  |
| `i5YrSimpleRanking` | int | NULL |  |  |
| `i6YrSimpleRanking` | int | NULL |  |  |
| `i7YrSimpleRanking` | int | NULL |  |  |
| `i8YrSimpleRanking` | int | NULL |  |  |
| `i9YrSimpleRanking` | int | NULL |  |  |
| `i10YrSimpleRanking` | int | NULL |  |  |
| `i15YrSimpleRanking` | int | NULL |  |  |
| `i20YrSimpleRanking` | int | NULL |  |  |
| `i1YrCompoundRanking` | int | NULL |  |  |
| `i2YrCompoundRanking` | int | NULL |  |  |
| `i3YrCompoundRanking` | int | NULL |  |  |
| `i4YrCompoundRanking` | int | NULL |  |  |
| `i5YrCompoundRanking` | int | NULL |  |  |
| `i6YrCompoundRanking` | int | NULL |  |  |
| `i7YrCompoundRanking` | int | NULL |  |  |
| `i8YrCompoundRanking` | int | NULL |  |  |
| `i9YrCompoundRanking` | int | NULL |  |  |
| `i10YrCompoundRanking` | int | NULL |  |  |
| `i15YrCompoundRanking` | int | NULL |  |  |
| `i20YrCompoundRanking` | int | NULL |  |  |
| `i1YrCalendarSimpleRanking` | int | NULL |  |  |
| `i2YrCalendarSimpleRanking` | int | NULL |  |  |
| `i3YrCalendarSimpleRanking` | int | NULL |  |  |
| `i4YrCalendarSimpleRanking` | int | NULL |  |  |
| `i5YrCalendarSimpleRanking` | int | NULL |  |  |
| `i6YrCalendarSimpleRanking` | int | NULL |  |  |
| `i7YrCalendarSimpleRanking` | int | NULL |  |  |
| `i8YrCalendarSimpleRanking` | int | NULL |  |  |
| `i9YrCalendarSimpleRanking` | int | NULL |  |  |
| `i10YrCalendarSimpleRanking` | int | NULL |  |  |
| `i15YrCalendarSimpleRanking` | int | NULL |  |  |
| `i20YrCalendarSimpleRanking` | int | NULL |  |  |
| `dtLastModified` | datetime | NULL |  | Timestamp when record was last modified |
| `iFileID` | int | NULL |  | FK to file record (FundServ file) |
| `iUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |

### `UB_FundDefRiskHistory`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `iFundDefID` | int | NULL |  | Integer field |
| `RiskRating` | char(1) | NULL |  |  |
| `dtRiskDate` | datetime | NULL |  | Date/time field |
| `dtLastModified` | datetime | NULL |  | Timestamp when record was last modified |
| `iUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |

### `UB_FundDefTCR`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iFundDefID` | int | NOT NULL |  | Integer field |
| `MgmtCode` | varchar(6) | NULL |  | Management company code |
| `FundID` | varchar(6) | NULL |  | Fund identifier code (e.g., DYN 3056) |
| `dtRecord` | datetime | NULL |  | Date/time field |
| `StatusInd` | char(1) | NULL |  |  |
| `fFERPercent` | decimal(5, 2) | NULL |  |  |
| `fDailyCostFactor` | decimal(15, 10) | NULL |  |  |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `dtLastModified` | datetime | NULL |  | Timestamp when record was last modified |
| `iFileID` | int | NULL |  | FK to file record (FundServ file) |
| `iLastModifiedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who last modified this record |

### `UB_FundFact`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iClientID` | int | NULL |  | FK to UB_Client table - identifies the client/investor |
| `MgmtCode` | varchar(6) | NULL |  | Management company code |
| `FundID` | varchar(15) | NULL |  | Fund identifier code (e.g., DYN 3056) |
| `iStatus` | tinyint | NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `iMethod` | tinyint | NULL |  | Small integer/flag field |
| `dtSent` | datetime | NULL |  | Date/time field |
| `iSentUserID` | int | NULL |  | Integer field |
| `dtClientViewed` | datetime | NULL |  | Date/time field |
| `dtLastModified` | datetime | NULL |  | Timestamp when record was last modified |
| `iLastModifiedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who last modified this record |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `iCreatedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `iFundFactObjID` | int | NULL |  | Integer field |
| `iDeleted` | tinyint | NULL |  | Small integer/flag field |
| `iEmailOutBoxID` | int | NULL |  | Integer field |
| `iNotificationID` | int | NULL |  | Integer field |
| `iPortfolioDefID` | int | NULL |  | Integer field |

### `UB_FundPriceIssue`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `iFundDefID` | int | NOT NULL |  | Integer field |
| `dtEfectiveDate` | datetime | NOT NULL |  | Date/time field |
| `MgmtCode` | varchar(6) | NULL |  | Management company code |
| `FundID` | varchar(6) | NULL |  | Fund identifier code (e.g., DYN 3056) |
| `bNoDef` | tinyint | NULL |  |  |
| `bNoPrice` | tinyint | NULL |  |  |
| `dtLastPrice` | datetime | NULL |  | Date/time field |
| `fPrice` | float | NULL |  | Unit price of fund |
| `dtCreated` | datetime | NOT NULL |  | Timestamp when record was created |

### `UB_FundPropMember`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iMemberID` | int | NOT NULL |  | FK to UB_Member - identifies the member/advisor |
| `iFundPropID` | smallint | NOT NULL |  |  |
| `iOrder` | smallint | NULL |  |  |

### `UB_FundTrx`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iPlanID` | int | NOT NULL |  | FK to UB_Plan table - identifies the investment plan/account |
| `iFundAccID` | int | NOT NULL |  | Integer field |
| `iFundAccPosID` | int | NOT NULL |  | Integer field |
| `iActionCode` | tinyint | NOT NULL |  | Small integer/flag field |
| `iStatus` | tinyint | NOT NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `iType` | smallint | NOT NULL |  | Type/category code |
| `Type` | char(1) | NOT NULL |  |  |
| `TypeDetail` | char(1) | NOT NULL |  |  |
| `ProdEventInd` | varchar(2) | NOT NULL |  |  |
| `iSequence` | int | NOT NULL |  | Sequence number |
| `iOrderType` | tinyint | NOT NULL |  | Small integer/flag field |
| `iOrderStatus` | tinyint | NOT NULL |  | Small integer/flag field |
| `OrderSource` | char(1) | NOT NULL |  |  |
| `OrderID` | varchar(20) | NULL |  |  |
| `SourceID` | varchar(30) | NOT NULL |  | Source identifier |
| `ResponseSource` | char(1) | NOT NULL |  |  |
| `dtTrade` | datetime | NULL |  | Trade date |
| `dtProcessing` | datetime | NULL |  | Date/time field |
| `dtSettlement` | datetime | NULL |  | Settlement date |
| `mGAmount` | money | NOT NULL |  |  |
| `mGAmountOrigin` | money | NOT NULL |  |  |
| `mNAmount` | money | NOT NULL |  |  |
| `fUnits` | float | NOT NULL |  | Decimal/float value |
| `fUnitsOrigin` | float | NOT NULL |  | Decimal/float value |
| `mPrice` | float | NULL |  | Monetary value |
| `fUnitsTotalUnIssued` | float | NOT NULL |  | Decimal/float value |
| `fUnitsTotalIssued` | float | NOT NULL |  | Decimal/float value |
| `fUnitsTotal` | float | NOT NULL |  | Decimal/float value |
| `PNIndicator` | char(1) | NOT NULL |  |  |
| `dtCreated` | datetime | NOT NULL |  | Timestamp when record was created |
| `dtLastModified` | datetime | NOT NULL |  | Timestamp when record was last modified |
| `iCreatedUserID` | int | NOT NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `iLastModifiedUserID` | int | NOT NULL |  | FK to UB_MemberLogin - internal user who last modified this record |
| `iModifiedMethod` | tinyint | NOT NULL |  | Small integer/flag field |
| `bDSC` | tinyint | NOT NULL |  |  |
| `bFEL` | tinyint | NOT NULL |  |  |
| `bTax` | tinyint | NOT NULL |  |  |
| `bHoldback` | tinyint | NOT NULL |  |  |
| `bFee` | tinyint | NOT NULL |  |  |
| `iFileID` | int | NOT NULL |  | FK to file record (FundServ file) |
| `iRepCode` | int | NOT NULL |  | Representative/advisor code |
| `RepCode` | varchar(5) | NOT NULL |  | Representative/advisor code |
| `DealerCode` | varchar(6) | NULL |  | Dealer code identifier |
| `SettlementStatus` | char(1) | NOT NULL |  |  |
| `SettlementSource` | char(1) | NOT NULL |  |  |
| `SettlementMethod` | char(1) | NOT NULL |  |  |
| `SettlementInd` | char(1) | NOT NULL |  |  |
| `Currency` | varchar(2) | NOT NULL |  |  |
| `TaxEventInd` | char(1) | NOT NULL |  |  |
| `ContributionPeriod` | char(1) | NOT NULL |  |  |
| `ContrWdrCode` | char(1) | NOT NULL |  |  |
| `CertificateInd` | char(1) | NOT NULL |  |  |
| `iProspectusInd` | tinyint | NOT NULL |  | Small integer/flag field |
| `iPlanID2` | int | NOT NULL |  | Integer field |
| `iFundAccID2` | int | NOT NULL |  | Integer field |
| `iFundAccPosID2` | int | NOT NULL |  | Integer field |
| `iTrxID2` | int | NOT NULL |  | Integer field |
| `bBookValueReset` | tinyint | NOT NULL |  |  |
| `bBookValueExclude` | tinyint | NOT NULL |  |  |
| `bInvestedAmountExclude` | tinyint | NOT NULL |  |  |
| `bFirstTrx` | tinyint | NOT NULL |  |  |
| `bUnsolicited` | tinyint | NOT NULL |  |  |
| `iTrustAccountID` | int | NOT NULL |  | Integer field |
| `iTrustBankID` | int | NOT NULL |  | Integer field |
| `bRealTime` | tinyint | NOT NULL |  |  |
| `bLeveraged` | tinyint | NOT NULL |  |  |
| `bOrderReceipt` | tinyint | NOT NULL |  |  |
| `DealerRepCode` | varchar(12) | NULL |  | Representative/advisor code |
| `AmountType` | char(1) | NOT NULL |  |  |
| `FundAccID` | varchar(30) | NULL |  |  |
| `fOrderAmount` | float | NULL |  | Decimal/float value |
| `iOrderID` | int | NOT NULL |  | Integer field |
| `bCommRebateAble` | tinyint | NOT NULL |  |  |
| `bPEFP` | tinyint | NOT NULL |  |  |
| `bAOT` | tinyint | NULL |  |  |
| `iAsOfTradeTrx` | int | NULL |  | Integer field |
| `bAcceptRiskHigher` | tinyint | NULL |  |  |
| `fAvgCost` | float | NULL |  | Decimal/float value |
| `iWFID` | int | NULL |  | Integer field |
| `iApplicationID` | int | NULL |  | Integer field |
| `iNetwork` | tinyint | NULL |  | Small integer/flag field |
| `iEMDQualifier` | tinyint | NULL |  | Small integer/flag field |
| `iCRAFlag` | tinyint | NULL |  | Small integer/flag field |
| `iFlag` | tinyint | NULL |  | Small integer/flag field |

### `UB_FundTrxBank`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `iTrxID` | int | NOT NULL |  | Integer field |
| `HolderName` | varchar(40) | NULL |  |  |
| `AccountType` | char(1) | NULL |  |  |
| `Code` | varchar(3) | NULL |  |  |
| `TransitNumber` | varchar(5) | NULL |  |  |
| `AccountNumber` | varchar(12) | NULL |  |  |
| `CurrencyCode` | varchar(2) | NULL |  |  |

### `UB_FundTrxBasketICTFrom`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iBasketID` | int | NOT NULL |  | Integer field |
| `iPositionID` | int | NOT NULL |  | Integer field |
| `AmountType` | char(1) | NULL |  |  |
| `fAmount` | float | NULL |  | Decimal/float value |
| `MgmtCode` | varchar(5) | NULL |  | Management company code |
| `FundID` | varchar(6) | NULL |  | Fund identifier code (e.g., DYN 3056) |

### `UB_FundTrxBasketICTTMP`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `SessionID` | varchar(50) | NOT NULL |  |  |
| `iClientID` | int | NOT NULL |  | FK to UB_Client table - identifies the client/investor |
| `iType` | tinyint | NOT NULL |  | Type/category code |
| `iPositionID` | int | NOT NULL |  | Integer field |
| `MgmtCode` | varchar(5) | NULL |  | Management company code |
| `FundID` | varchar(6) | NOT NULL |  | Fund identifier code (e.g., DYN 3056) |
| `AmountType` | char(1) | NOT NULL |  |  |
| `fAmount` | float | NOT NULL |  | Decimal/float value |
| `dtCreate` | datetime | NOT NULL |  | Date/time field |
| `iCreatedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |

### `UB_FundTrxBasketICTTo`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iBasketID` | int | NOT NULL |  | Integer field |
| `iPositionID` | int | NOT NULL |  | Integer field |
| `fAmount` | float | NULL |  | Decimal/float value |
| `MgmtCode` | varchar(5) | NULL |  | Management company code |
| `FundID` | varchar(6) | NULL |  | Fund identifier code (e.g., DYN 3056) |

### `UB_FundTrxCash`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `iTrxID` | int | NOT NULL |  | Integer field |
| `iCashTrxID` | int | NOT NULL |  | Integer field |

### `UB_FundTrxCheque`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `iTrxID` | int | NOT NULL |  | Integer field |
| `Type` | char(1) | NULL |  |  |
| `Title` | char(1) | NULL |  |  |
| `LastName` | varchar(80) | NULL |  | Last name |
| `FirstName` | varchar(20) | NULL |  | First name |
| `Address` | varchar(120) | NULL |  |  |
| `City` | varchar(30) | NULL |  |  |
| `Province` | varchar(2) | NULL |  |  |
| `Country` | varchar(3) | NULL |  |  |
| `PostalCode` | varchar(10) | NULL |  |  |

### `UB_FundTrxConversion`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iStatus` | tinyint | NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `iFundAccountPosIDFrom` | int | NOT NULL |  | Integer field |
| `iTrxIDFrom` | int | NOT NULL |  | Integer field |
| `iFundAccountPosIDTo` | int | NULL |  | Integer field |
| `iTrxIDTo` | int | NULL |  | Integer field |
| `MgmtCodeTo` | varchar(5) | NOT NULL |  |  |
| `FundIDTo` | varchar(6) | NOT NULL |  |  |
| `iSplitBy` | tinyint | NOT NULL |  | Small integer/flag field |
| `mAmount` | money | NULL |  | Monetary amount |
| `iOrderIDTo` | int | NULL |  | Integer field |
| `fCLPaidCommRate` | float | NULL |  | Decimal/float value |
| `dtCompleted` | datetime | NULL |  | Date/time field |
| `iCreatedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `iSuitable` | tinyint | NULL |  | Small integer/flag field |
| `iRebateFundPosID` | int | NULL |  | Integer field |
| `mRebateAmount` | money | NULL |  |  |

### `UB_FundTrxDetail`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL |  | Primary key, auto-increment identifier |
| `mSettlemtAmount` | money | NOT NULL |  |  |
| `fExchangeRate` | float | NOT NULL |  | Decimal/float value |
| `PaymentID` | varchar(15) | NOT NULL |  |  |
| `fCLPaidCommRate` | float | NOT NULL |  | Decimal/float value |
| `fFCPaidCommRate` | float | NOT NULL |  | Decimal/float value |
| `mDealerCommCL` | money | NOT NULL |  |  |
| `mDealerCommFC` | money | NOT NULL |  |  |
| `mDealerCommTotal` | money | NOT NULL |  |  |
| `mDSC` | money | NOT NULL |  |  |
| `mFees` | money | NOT NULL |  |  |
| `mGST` | money | NOT NULL |  |  |
| `mTax1` | money | NOT NULL |  |  |
| `mTax2` | money | NOT NULL |  |  |
| `mHoldback1` | money | NOT NULL |  |  |
| `mHoldback2` | money | NOT NULL |  |  |
| `mTaxTotal` | money | NOT NULL |  |  |
| `mHoldbackTotal` | money | NOT NULL |  |  |
| `mLSIFProvince` | money | NOT NULL |  |  |
| `mLSIFFederal` | money | NOT NULL |  |  |
| `DilutionInd` | char(1) | NOT NULL |  |  |
| `mDilutionAmount` | money | NOT NULL |  |  |
| `mAvgCostDealer` | money | NOT NULL |  |  |
| `mAvgCostFC` | money | NOT NULL |  |  |
| `MgmtCode` | varchar(6) | NULL |  | Management company code |
| `FundID` | varchar(6) | NULL |  | Fund identifier code (e.g., DYN 3056) |
| `FundAccountID` | varchar(15) | NOT NULL |  |  |
| `MgmtCode2` | varchar(6) | NULL |  |  |
| `FundID2` | varchar(6) | NULL |  |  |
| `FundAccountID2` | varchar(15) | NOT NULL |  |  |
| `Notes` | varchar(max) | NULL |  |  |
| `dtAsOfTrade` | datetime | NULL |  | Date/time field |
| `PEFPNotes` | varchar(100) | NULL |  |  |
| `iConversion` | tinyint | NULL |  | Small integer/flag field |
| `mShortTermFee` | money | NULL |  |  |
| `mAdminFee` | money | NULL |  |  |
| `mPerformFee` | money | NULL |  |  |
| `mOtherFee` | money | NULL |  |  |
| `mPenalty` | money | NULL |  |  |
| `mClawback` | money | NULL |  |  |
| `mDeductionTotal` | money | NULL |  |  |
| `AltPayeeFlg` | char(1) | NULL |  |  |
| `AltDeliverFlg` | char(1) | NULL |  |  |
| `OrigNtwrk` | char(4) | NULL |  |  |
| `iFeeDisclosed` | tinyint | NULL |  | Small integer/flag field |
| `fAdminFeeRate` | float | NULL |  | Decimal/float value |
| `fOtherFeeRate` | float | NULL |  | Decimal/float value |
| `DlrCode2` | varchar(5) | NULL |  |  |
| `AcctDesig2` | char(1) | NULL |  |  |
| `IntCode2` | varchar(5) | NULL |  |  |
| `IntAcctID2` | varchar(15) | NULL |  |  |
| `AcctType2` | char(2) | NULL |  |  |
| `DlrAcctID2` | varchar(15) | NULL |  |  |
| `StockMarket` | varchar(6) | NULL |  |  |
| `SecRole` | char(1) | NULL |  |  |
| `bProtrader` | tinyint | NULL |  |  |
| `mSecExAmount` | money | NULL |  |  |
| `DilLinkID` | varchar(15) | NULL |  |  |
| `bConfirmed` | tinyint | NULL |  |  |
| `iOmnibusProcessID` | int | NULL |  | Integer field |
| `iExportTaskID` | int | NULL |  | Integer field |
| `iREVOrderID` | int | NULL |  | Integer field |
| `TradeContext` | char(1) | NULL |  |  |

### `UB_FundTrxFeeInfo`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iTrxID` | int | NULL |  | Integer field |
| `FeeType` | char(2) | NULL |  |  |
| `mAmount` | money | NULL |  | Monetary amount |
| `mTax` | money | NULL |  |  |

### `UB_FundTrxLookup`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `iTrxID` | int | NOT NULL |  | Integer field |
| `iOrderID` | int | NOT NULL |  | Integer field |
| `OrderID` | varchar(20) | NULL |  |  |
| `SourceID` | varchar(30) | NOT NULL |  | Source identifier |
| `iPlanID` | int | NOT NULL |  | FK to UB_Plan table - identifies the investment plan/account |
| `iFundAccID` | int | NOT NULL |  | Integer field |
| `iFundAccPosID` | int | NOT NULL |  | Integer field |
| `iStatus` | tinyint | NOT NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `iType` | smallint | NOT NULL |  | Type/category code |
| `Type` | char(1) | NOT NULL |  |  |
| `TypeDetail` | char(1) | NOT NULL |  |  |
| `ProdEventInd` | varchar(2) | NOT NULL |  |  |
| `iSequence` | int | NOT NULL |  | Sequence number |
| `iOrderType` | tinyint | NOT NULL |  | Small integer/flag field |
| `iOrderStatus` | tinyint | NOT NULL |  | Small integer/flag field |
| `dtTrade` | datetime | NULL |  | Trade date |
| `mGAmountOrigin` | money | NOT NULL |  |  |
| `fUnitsOrigin` | float | NOT NULL |  | Decimal/float value |
| `fUnitsTotalUnIssued` | float | NOT NULL |  | Decimal/float value |
| `fUnitsTotalIssued` | float | NOT NULL |  | Decimal/float value |
| `PNIndicator` | char(1) | NOT NULL |  |  |
| `dtCreated` | datetime | NOT NULL |  | Timestamp when record was created |
| `iFileID` | int | NOT NULL |  | FK to file record (FundServ file) |
| `iRepCode` | int | NOT NULL |  | Representative/advisor code |
| `DealerRepCode` | varchar(9) | NOT NULL |  | Representative/advisor code |
| `FundID` | varchar(10) | NULL |  | Fund identifier code (e.g., DYN 3056) |
| `FundAccIDLong` | varchar(30) | NULL |  |  |
| `AccountDesignation` | char(1) | NULL |  |  |
| `PlanType` | char(2) | NULL |  |  |
| `DealerAccountID` | varchar(15) | NULL |  |  |
| `IntermediaryCode` | varchar(5) | NULL |  |  |
| `IntermediaryAccountID` | varchar(15) | NULL |  |  |
| `dtProcessing` | datetime | NULL |  | Date/time field |
| `dtSettlement` | datetime | NULL |  | Settlement date |
| `SettlementInd` | char(1) | NULL |  |  |

### `UB_FundTrxOrder`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `ActnCode` | varchar(3) | NOT NULL |  |  |
| `iOrderStatus` | tinyint | NOT NULL |  | Small integer/flag field |
| `OrderID` | varchar(20) | NULL |  |  |
| `SourceID` | varchar(30) | NOT NULL |  | Source identifier |
| `iPlanID` | int | NOT NULL |  | FK to UB_Plan table - identifies the investment plan/account |
| `iAccountID` | int | NOT NULL |  | Integer field |
| `iPositionID` | int | NOT NULL |  | Integer field |
| `iPlanIDFrom` | int | NOT NULL |  | Integer field |
| `iAccountIDFrom` | int | NOT NULL |  | Integer field |
| `iPositionIDFrom` | int | NOT NULL |  | Integer field |
| `iType` | smallint | NOT NULL |  | Type/category code |
| `Type` | char(1) | NOT NULL |  |  |
| `TypeDetail` | char(1) | NOT NULL |  |  |
| `AmountType` | char(1) | NOT NULL |  |  |
| `fAmount` | float | NOT NULL |  | Decimal/float value |
| `DealerCode` | varchar(5) | NULL |  | Dealer code identifier |
| `RepCode` | varchar(5) | NOT NULL |  | Representative/advisor code |
| `SettlementStatus` | char(1) | NOT NULL |  |  |
| `SettlementSource` | char(1) | NOT NULL |  |  |
| `SettlementMethod` | char(1) | NOT NULL |  |  |
| `SettlementInd` | char(1) | NOT NULL |  |  |
| `TaxEventInd` | char(1) | NOT NULL |  |  |
| `ContributionPeriod` | char(1) | NOT NULL |  |  |
| `ContrWdrCode` | char(1) | NOT NULL |  |  |
| `CertificateInd` | char(1) | NOT NULL |  |  |
| `bFirstTrx` | tinyint | NOT NULL |  |  |
| `bUnsolicited` | tinyint | NOT NULL |  |  |
| `bRealTime` | tinyint | NOT NULL |  |  |
| `bLeveraged` | tinyint | NOT NULL |  |  |
| `bOrderReceipt` | tinyint | NOT NULL |  |  |
| `bAOT` | tinyint | NOT NULL |  |  |
| `iOriginalOrderID` | int | NOT NULL |  | Integer field |
| `OriginalOrderID` | varchar(15) | NOT NULL |  |  |
| `dtAOTDate` | datetime | NULL |  | Date/time field |
| `fCommissionRate` | float | NOT NULL |  | Decimal/float value |
| `Sequence` | int | NULL |  |  |
| `DealerRepCode` | varchar(12) | NULL |  | Representative/advisor code |
| `FundAccountPosID` | varchar(30) | NOT NULL |  |  |
| `DealerAccountID` | varchar(15) | NOT NULL |  |  |
| `IntermediaryAccountID` | varchar(20) | NOT NULL |  |  |
| `iPMTInfo` | tinyint | NOT NULL |  | Small integer/flag field |
| `bPEFP` | tinyint | NOT NULL |  |  |
| `PEFPNotes` | varchar(100) | NULL |  |  |
| `bUseTrustAccount` | tinyint | NOT NULL |  |  |
| `iTrustID` | int | NOT NULL |  | Integer field |
| `iTrustBankID` | int | NULL |  | Integer field |
| `iApplicationID` | int | NOT NULL |  | Integer field |
| `Notes` | varchar(max) | NULL |  |  |
| `iUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `dtCreated` | datetime | NOT NULL |  | Timestamp when record was created |
| `iMethod` | tinyint | NULL |  | Small integer/flag field |
| `FundAccountPosIDFrom` | varchar(30) | NULL |  |  |
| `dtLastModified` | datetime | NULL |  | Timestamp when record was last modified |
| `iLastModifiedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who last modified this record |
| `iOrderStatusLast` | tinyint | NULL |  | Small integer/flag field |
| `iWarning` | tinyint | NULL |  | Small integer/flag field |
| `iFeeDisclosed` | tinyint | NULL |  | Small integer/flag field |
| `iRRIFSetting` | tinyint | NULL |  | Small integer/flag field |
| `fFedWHoldTaxRt` | float | NULL |  | Decimal/float value |
| `iDocReqdFlg` | tinyint | NULL |  | Small integer/flag field |
| `dtTrade` | datetime | NULL |  | Trade date |
| `dtSent` | datetime | NULL |  | Date/time field |
| `iNetwork` | tinyint | NULL |  | Small integer/flag field |
| `Symbol` | varchar(15) | NULL |  |  |
| `Exchange` | varchar(6) | NULL |  |  |
| `OrderSide` | char(1) | NULL |  |  |
| `OrderType` | char(1) | NULL |  |  |
| `TimeInforce` | char(1) | NULL |  |  |
| `mPriceLimit` | money | NULL |  |  |
| `mPriceStop` | money | NULL |  |  |
| `iBBSOrderID` | int | NULL |  | Integer field |
| `dtExpiry` | datetime | NULL |  | Date/time field |
| `iScheduleID` | int | NULL |  | Integer field |
| `iFlag` | tinyint | NULL |  | Small integer/flag field |

### `UB_FundTrxOrderARC`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `iOrderID` | int | NOT NULL |  | Integer field |
| `ActnCode` | varchar(3) | NOT NULL |  |  |
| `iOrderStatus` | tinyint | NOT NULL |  | Small integer/flag field |
| `OrderID` | varchar(20) | NULL |  |  |
| `SourceID` | varchar(30) | NOT NULL |  | Source identifier |
| `iPlanID` | int | NOT NULL |  | FK to UB_Plan table - identifies the investment plan/account |
| `iAccountID` | int | NOT NULL |  | Integer field |
| `iPositionID` | int | NOT NULL |  | Integer field |
| `iPlanIDFrom` | int | NOT NULL |  | Integer field |
| `iAccountIDFrom` | int | NOT NULL |  | Integer field |
| `iPositionIDFrom` | int | NOT NULL |  | Integer field |
| `iType` | smallint | NOT NULL |  | Type/category code |
| `Type` | char(1) | NOT NULL |  |  |
| `TypeDetail` | char(1) | NOT NULL |  |  |
| `AmountType` | char(1) | NOT NULL |  |  |
| `fAmount` | float | NOT NULL |  | Decimal/float value |
| `DealerCode` | varchar(5) | NULL |  | Dealer code identifier |
| `RepCode` | varchar(5) | NOT NULL |  | Representative/advisor code |
| `SettlementStatus` | char(1) | NOT NULL |  |  |
| `SettlementSource` | char(1) | NOT NULL |  |  |
| `SettlementMethod` | char(1) | NOT NULL |  |  |
| `SettlementInd` | char(1) | NOT NULL |  |  |
| `TaxEventInd` | char(1) | NOT NULL |  |  |
| `ContributionPeriod` | char(1) | NOT NULL |  |  |
| `ContrWdrCode` | char(1) | NOT NULL |  |  |
| `CertificateInd` | char(1) | NOT NULL |  |  |
| `bFirstTrx` | bit | NOT NULL |  |  |
| `bUnsolicited` | bit | NOT NULL |  |  |
| `bRealTime` | bit | NOT NULL |  |  |
| `bLeveraged` | bit | NOT NULL |  |  |
| `bOrderReceipt` | bit | NOT NULL |  |  |
| `bAOT` | bit | NOT NULL |  |  |
| `iOriginalOrderID` | int | NOT NULL |  | Integer field |
| `OriginalOrderID` | varchar(15) | NOT NULL |  |  |
| `dtAOTDate` | datetime | NULL |  | Date/time field |
| `fCommissionRate` | float | NOT NULL |  | Decimal/float value |
| `Sequence` | int | NULL |  |  |
| `DealerRepCode` | varchar(12) | NULL |  | Representative/advisor code |
| `FundAccountPosID` | varchar(30) | NOT NULL |  |  |
| `DealerAccountID` | varchar(15) | NOT NULL |  |  |
| `IntermediaryAccountID` | varchar(20) | NOT NULL |  |  |
| `iPMTInfo` | tinyint | NOT NULL |  | Small integer/flag field |
| `bPEFP` | bit | NOT NULL |  |  |
| `PEFPNotes` | varchar(100) | NULL |  |  |
| `bUseTrustAccount` | bit | NOT NULL |  |  |
| `iTrustID` | int | NOT NULL |  | Integer field |
| `iTrustBankID` | int | NULL |  | Integer field |
| `iApplicationID` | int | NOT NULL |  | Integer field |
| `Notes` | varchar(max) | NULL |  |  |
| `iUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `dtCreated` | datetime | NOT NULL |  | Timestamp when record was created |
| `iMethod` | tinyint | NULL |  | Small integer/flag field |
| `FundAccountPosIDFrom` | varchar(30) | NULL |  |  |
| `dtLastModified` | datetime | NULL |  | Timestamp when record was last modified |
| `iLastModifiedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who last modified this record |
| `iOrderStatusLast` | tinyint | NULL |  | Small integer/flag field |
| `iWarning` | tinyint | NULL |  | Small integer/flag field |
| `iFeeDisclosed` | tinyint | NULL |  | Small integer/flag field |
| `iRRIFSetting` | tinyint | NULL |  | Small integer/flag field |
| `fFedWHoldTaxRt` | float | NULL |  | Decimal/float value |
| `iDocReqdFlg` | tinyint | NULL |  | Small integer/flag field |
| `dtTrade` | datetime | NULL |  | Trade date |
| `dtSent` | datetime | NULL |  | Date/time field |
| `iNetwork` | tinyint | NULL |  | Small integer/flag field |
| `OrderSide` | char(1) | NULL |  |  |
| `OrderType` | char(1) | NULL |  |  |
| `TimeInforce` | char(1) | NULL |  |  |
| `mPriceLimit` | money | NULL |  |  |
| `mPriceStop` | money | NULL |  |  |
| `Exchange` | varchar(6) | NULL |  |  |
| `iBBSOrderID` | int | NULL |  | Integer field |
| `Symbol` | varchar(15) | NULL |  |  |
| `dtExpiry` | datetime | NULL |  | Date/time field |
| `iScheduleID` | int | NULL |  | Integer field |

### `UB_FundTrxOrderBank`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `iOrderID` | int | NOT NULL |  | Integer field |
| `iAccountID` | int | NULL |  | Integer field |
| `HolderName` | varchar(40) | NULL |  |  |
| `AccountType` | char(1) | NULL |  |  |
| `Code` | varchar(3) | NULL |  |  |
| `TransitNumber` | varchar(5) | NULL |  |  |
| `AccountNumber` | varchar(12) | NULL |  |  |
| `CurrencyCode` | varchar(2) | NULL |  |  |

### `UB_FundTrxOrderCheque`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `iOrderID` | int | NOT NULL |  | Integer field |
| `Type` | char(1) | NULL |  |  |
| `Title` | char(1) | NULL |  |  |
| `LastName` | varchar(80) | NULL |  | Last name |
| `FirstName` | varchar(20) | NULL |  | First name |
| `Address` | varchar(120) | NULL |  |  |
| `City` | varchar(30) | NULL |  |  |
| `Province` | varchar(2) | NULL |  |  |
| `Country` | varchar(3) | NULL |  |  |
| `PostalCode` | varchar(10) | NULL |  |  |

### `UB_FundTrxOrderICTFrom`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iOrderID` | int | NOT NULL |  | Integer field |
| `iPositionID` | int | NOT NULL |  | Integer field |
| `AmountType` | char(1) | NULL |  |  |
| `fAmount` | float | NULL |  | Decimal/float value |
| `MgmtCode` | varchar(4) | NULL |  | Management company code |
| `FundID` | varchar(6) | NULL |  | Fund identifier code (e.g., DYN 3056) |

### `UB_FundTrxOrderICTTMP`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `SessionID` | varchar(50) | NOT NULL |  |  |
| `iClientID` | int | NOT NULL |  | FK to UB_Client table - identifies the client/investor |
| `iType` | tinyint | NOT NULL |  | Type/category code |
| `iPositionID` | int | NOT NULL |  | Integer field |
| `MgmtCode` | varchar(6) | NULL |  | Management company code |
| `FundID` | varchar(6) | NOT NULL |  | Fund identifier code (e.g., DYN 3056) |
| `AmountType` | char(1) | NOT NULL |  |  |
| `fAmount` | float | NOT NULL |  | Decimal/float value |
| `dtCreate` | datetime | NOT NULL |  | Date/time field |
| `iCreatedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |

### `UB_FundTrxOrderICTTo`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iOrderID` | int | NOT NULL |  | Integer field |
| `iPositionID` | int | NOT NULL |  | Integer field |
| `fAmount` | float | NULL |  | Decimal/float value |
| `MgmtCode` | varchar(6) | NULL |  | Management company code |
| `FundID` | varchar(6) | NULL |  | Fund identifier code (e.g., DYN 3056) |

### `UB_FundTrxOrderMSG_2BDeleted`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iOrderID` | int | NOT NULL |  | Integer field |
| `MSG` | varchar(max) | NOT NULL |  |  |
| `iStatus` | tinyint | NOT NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `dtCreate` | datetime | NULL |  | Date/time field |
| `OrderID` | varchar(10) | NULL |  |  |
| `RtnCode` | varchar(4) | NULL |  |  |
| `iFileID` | int | NULL |  | FK to file record (FundServ file) |

### `UB_FundTrxOrderSearchList`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `iUserID` | int | NOT NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `iOrderID` | int | NOT NULL |  | Integer field |

### `UB_FundTrxOrderSelection`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `iUserID` | int | NOT NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `ID` | int | NOT NULL |  | Primary key, auto-increment identifier |

### `UB_FundTrxOrderTransfer`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `iOrderID` | int | NOT NULL |  | Integer field |
| `PlanTypeFrom` | varchar(50) | NULL |  |  |
| `DealerCodeFrom` | varchar(4) | NULL |  | Dealer code identifier |
| `DealerAcctIDFrom` | varchar(15) | NULL |  |  |
| `FundAcctIDFrom` | varchar(15) | NULL |  |  |
| `FundIDFrom` | varchar(6) | NULL |  |  |
| `SIN1From` | varchar(15) | NULL |  |  |
| `SIN2From` | varchar(11) | NULL |  |  |
| `PlanDesignationFrom` | char(10) | NULL |  |  |
| `IntermediaryCodeFrom` | varchar(5) | NULL |  |  |
| `IntermediaryAcctIDFrom` | varchar(15) | NULL |  |  |
| `OwnerDOB` | varchar(10) | NULL |  |  |
| `OrgFlg` | char(1) | NULL |  |  |

### `UB_FundTrxOrderTrx`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `iOrderID` | int | NOT NULL |  | Integer field |
| `iTrxID` | int | NOT NULL |  | Integer field |

### `UB_FundTrxRebateWaiting`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `iOrgOrderID` | int | NOT NULL |  | Integer field |
| `iStatus` | tinyint | NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `iFundAccountPosID` | int | NULL |  | Integer field |
| `mAmount` | money | NULL |  | Monetary amount |
| `iOrderID` | int | NULL |  | Integer field |

---

## GIA (Guaranteed Interest Account)

### `UB_GIAAnnuitant`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iClientID` | int | NOT NULL |  | FK to UB_Client table - identifies the client/investor |
| `iPlanID` | int | NOT NULL |  | FK to UB_Plan table - identifies the investment plan/account |
| `iGICID` | int | NOT NULL |  | Integer field |
| `iType` | int | NOT NULL |  | Type/category code |
| `iStatus` | tinyint | NOT NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `FirstName` | varchar(40) | NOT NULL |  | First name |
| `LastName` | varchar(40) | NOT NULL |  | Last name |
| `Language` | char(1) | NOT NULL |  |  |
| `Title` | char(1) | NOT NULL |  |  |
| `Sex` | char(1) | NOT NULL |  | Gender (M/F) |
| `dtDOB` | datetime | NULL |  | Date of birth |
| `SIN_BN` | varchar(9) | NOT NULL |  | Social Insurance Number or Business Number (Canada) |
| `iAddressID` | int | NOT NULL |  | Integer field |
| `iPhoneID` | int | NOT NULL |  | Integer field |
| `dtCreated` | datetime | NOT NULL |  | Timestamp when record was created |
| `dtLastModified` | datetime | NOT NULL |  | Timestamp when record was last modified |
| `iCreatedUserID` | int | NOT NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `iLastModifiedUserID` | int | NOT NULL |  | FK to UB_MemberLogin - internal user who last modified this record |
| `bCopyOwner` | tinyint | NULL |  |  |
| `Citizenship1` | varchar(3) | NULL |  |  |
| `Citizenship2` | varchar(3) | NULL |  |  |

### `UB_GIAAnnuitantTMP`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `SessionID` | varchar(50) | NOT NULL |  |  |
| `iClientID` | int | NOT NULL |  | FK to UB_Client table - identifies the client/investor |
| `iPlanID` | int | NOT NULL |  | FK to UB_Plan table - identifies the investment plan/account |
| `iGICID` | int | NOT NULL |  | Integer field |
| `iType` | int | NOT NULL |  | Type/category code |
| `iStatus` | tinyint | NOT NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `FirstName` | varchar(40) | NOT NULL |  | First name |
| `LastName` | varchar(40) | NOT NULL |  | Last name |
| `Language` | char(1) | NOT NULL |  |  |
| `Title` | char(1) | NOT NULL |  |  |
| `Sex` | char(1) | NOT NULL |  | Gender (M/F) |
| `dtDOB` | datetime | NULL |  | Date of birth |
| `SIN_BN` | varchar(9) | NOT NULL |  | Social Insurance Number or Business Number (Canada) |
| `dtCreated` | datetime | NOT NULL |  | Timestamp when record was created |
| `dtLastModified` | datetime | NOT NULL |  | Timestamp when record was last modified |
| `iCreatedUserID` | int | NOT NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `iLastModifiedUserID` | int | NOT NULL |  | FK to UB_MemberLogin - internal user who last modified this record |
| `Address` | varchar(120) | NULL |  |  |
| `City` | varchar(30) | NULL |  |  |
| `ProvinceCode` | varchar(2) | NULL |  |  |
| `CountryCode` | varchar(3) | NULL |  |  |
| `PostalCode` | varchar(50) | NULL |  |  |
| `MainPhone` | varchar(15) | NULL |  | Primary phone number |
| `CellPhone` | varchar(15) | NULL |  |  |
| `EmailAddress` | varchar(40) | NULL |  |  |
| `bCopyOwner` | tinyint | NULL |  |  |
| `Citizenship1` | varchar(3) | NULL |  |  |
| `Citizenship2` | varchar(3) | NULL |  |  |

### `UB_GIAContingentDBeneficiary`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iClientID` | int | NOT NULL |  | FK to UB_Client table - identifies the client/investor |
| `iPlanID` | int | NOT NULL |  | FK to UB_Plan table - identifies the investment plan/account |
| `iGICID` | int | NOT NULL |  | Integer field |
| `iStatus` | tinyint | NOT NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `iType` | tinyint | NOT NULL |  | Type/category code |
| `iRelationship` | tinyint | NOT NULL |  | Small integer/flag field |
| `fAllocation` | float | NOT NULL |  | Decimal/float value |
| `FirstName` | varchar(40) | NOT NULL |  | First name |
| `LastName` | varchar(40) | NOT NULL |  | Last name |
| `Title` | char(1) | NOT NULL |  |  |
| `Sex` | char(1) | NOT NULL |  | Gender (M/F) |
| `Language` | char(1) | NOT NULL |  |  |
| `dtDOB` | datetime | NULL |  | Date of birth |
| `SIN_BN` | varchar(15) | NOT NULL |  | Social Insurance Number or Business Number (Canada) |
| `ProvincialBN` | varchar(10) | NOT NULL |  |  |
| `BusinessName` | varchar(80) | NULL |  |  |
| `CountryInc` | varchar(3) | NULL |  |  |
| `ProvinceInc` | varchar(2) | NULL |  |  |
| `BusinessTypeCode` | varchar(2) | NULL |  |  |
| `dtExpiry` | datetime | NULL |  | Date/time field |
| `iAddressID` | int | NOT NULL |  | Integer field |
| `iPhoneID` | int | NOT NULL |  | Integer field |
| `dtCreated` | datetime | NOT NULL |  | Timestamp when record was created |
| `dtLastModified` | datetime | NOT NULL |  | Timestamp when record was last modified |
| `iCreatedUserID` | int | NOT NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `iLastModifiedUserID` | int | NOT NULL |  | FK to UB_MemberLogin - internal user who last modified this record |
| `bSuccessorAnnuitant` | tinyint | NULL |  |  |
| `Citizenship1` | varchar(3) | NULL |  |  |
| `Citizenship2` | varchar(3) | NULL |  |  |

### `UB_GIAContingentDBeneficiaryTMP`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `SessionID` | varchar(50) | NOT NULL |  |  |
| `iClientID` | int | NOT NULL |  | FK to UB_Client table - identifies the client/investor |
| `iPlanID` | int | NOT NULL |  | FK to UB_Plan table - identifies the investment plan/account |
| `iGICID` | int | NOT NULL |  | Integer field |
| `iStatus` | tinyint | NOT NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `iType` | tinyint | NOT NULL |  | Type/category code |
| `iRelationship` | tinyint | NOT NULL |  | Small integer/flag field |
| `fAllocation` | float | NOT NULL |  | Decimal/float value |
| `FirstName` | varchar(40) | NOT NULL |  | First name |
| `LastName` | varchar(40) | NOT NULL |  | Last name |
| `Title` | char(1) | NOT NULL |  |  |
| `Sex` | char(1) | NOT NULL |  | Gender (M/F) |
| `Language` | char(1) | NOT NULL |  |  |
| `dtDOB` | datetime | NULL |  | Date of birth |
| `SIN_BN` | varchar(15) | NOT NULL |  | Social Insurance Number or Business Number (Canada) |
| `ProvincialBN` | varchar(10) | NOT NULL |  |  |
| `BusinessName` | varchar(80) | NULL |  |  |
| `CountryInc` | varchar(3) | NULL |  |  |
| `ProvinceInc` | varchar(2) | NULL |  |  |
| `BusinessTypeCode` | varchar(2) | NULL |  |  |
| `dtExpiry` | datetime | NULL |  | Date/time field |
| `Address` | varchar(120) | NULL |  |  |
| `City` | varchar(30) | NULL |  |  |
| `ProvinceCode` | varchar(2) | NULL |  |  |
| `CountryCode` | varchar(3) | NULL |  |  |
| `PostalCode` | varchar(50) | NULL |  |  |
| `MainPhone` | varchar(15) | NULL |  | Primary phone number |
| `CellPhone` | varchar(15) | NULL |  |  |
| `EmailAddress` | varchar(40) | NULL |  |  |
| `dtCreated` | datetime | NOT NULL |  | Timestamp when record was created |
| `dtLastModified` | datetime | NOT NULL |  | Timestamp when record was last modified |
| `iCreatedUserID` | int | NOT NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `iLastModifiedUserID` | int | NOT NULL |  | FK to UB_MemberLogin - internal user who last modified this record |
| `iIDExist` | int | NOT NULL |  | Integer field |
| `bSuccessorAnnuitant` | tinyint | NULL |  |  |
| `iMode` | tinyint | NULL |  | Processing mode |
| `Citizenship1` | varchar(3) | NULL |  |  |
| `Citizenship2` | varchar(3) | NULL |  |  |

### `UB_GIASuccessorOwner`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iClientID` | int | NOT NULL |  | FK to UB_Client table - identifies the client/investor |
| `iPlanID` | int | NOT NULL |  | FK to UB_Plan table - identifies the investment plan/account |
| `iGICID` | int | NOT NULL |  | Integer field |
| `iStatus` | tinyint | NOT NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `iRelationship` | tinyint | NOT NULL |  | Small integer/flag field |
| `FirstName` | varchar(40) | NOT NULL |  | First name |
| `LastName` | varchar(40) | NOT NULL |  | Last name |
| `Title` | char(1) | NOT NULL |  |  |
| `Sex` | char(1) | NOT NULL |  | Gender (M/F) |
| `Language` | char(1) | NOT NULL |  |  |
| `dtDOB` | datetime | NULL |  | Date of birth |
| `SIN_BN` | varchar(15) | NOT NULL |  | Social Insurance Number or Business Number (Canada) |
| `ProvincialBN` | varchar(10) | NOT NULL |  |  |
| `BusinessName` | varchar(80) | NULL |  |  |
| `CountryInc` | varchar(3) | NULL |  |  |
| `ProvinceInc` | varchar(2) | NULL |  |  |
| `BusinessTypeCode` | varchar(2) | NULL |  |  |
| `dtExpiry` | datetime | NULL |  | Date/time field |
| `iAddressID` | int | NOT NULL |  | Integer field |
| `iPhoneID` | int | NOT NULL |  | Integer field |
| `dtCreated` | datetime | NOT NULL |  | Timestamp when record was created |
| `dtLastModified` | datetime | NOT NULL |  | Timestamp when record was last modified |
| `iCreatedUserID` | int | NOT NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `iLastModifiedUserID` | int | NOT NULL |  | FK to UB_MemberLogin - internal user who last modified this record |
| `Citizenship1` | varchar(3) | NULL |  |  |
| `Citizenship2` | varchar(3) | NULL |  |  |

### `UB_GIASuccessorOwnerTMP`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `SessionID` | varchar(50) | NOT NULL |  |  |
| `iClientID` | int | NOT NULL |  | FK to UB_Client table - identifies the client/investor |
| `iPlanID` | int | NOT NULL |  | FK to UB_Plan table - identifies the investment plan/account |
| `iGICID` | int | NOT NULL |  | Integer field |
| `iStatus` | tinyint | NOT NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `iRelationship` | tinyint | NOT NULL |  | Small integer/flag field |
| `FirstName` | varchar(40) | NOT NULL |  | First name |
| `LastName` | varchar(40) | NOT NULL |  | Last name |
| `Title` | char(1) | NOT NULL |  |  |
| `Sex` | char(1) | NOT NULL |  | Gender (M/F) |
| `Language` | char(1) | NOT NULL |  |  |
| `dtDOB` | datetime | NULL |  | Date of birth |
| `SIN_BN` | varchar(15) | NOT NULL |  | Social Insurance Number or Business Number (Canada) |
| `ProvincialBN` | varchar(10) | NOT NULL |  |  |
| `BusinessName` | varchar(80) | NULL |  |  |
| `CountryInc` | varchar(3) | NULL |  |  |
| `ProvinceInc` | varchar(2) | NULL |  |  |
| `BusinessTypeCode` | varchar(2) | NULL |  |  |
| `dtExpiry` | datetime | NULL |  | Date/time field |
| `dtCreated` | datetime | NOT NULL |  | Timestamp when record was created |
| `dtLastModified` | datetime | NOT NULL |  | Timestamp when record was last modified |
| `iCreatedUserID` | int | NOT NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `iLastModifiedUserID` | int | NOT NULL |  | FK to UB_MemberLogin - internal user who last modified this record |
| `Address` | varchar(120) | NULL |  |  |
| `City` | varchar(30) | NULL |  |  |
| `ProvinceCode` | varchar(2) | NULL |  |  |
| `CountryCode` | varchar(3) | NULL |  |  |
| `PostalCode` | varchar(50) | NULL |  |  |
| `MainPhone` | varchar(15) | NULL |  | Primary phone number |
| `CellPhone` | varchar(15) | NULL |  |  |
| `EmailAddress` | varchar(40) | NULL |  |  |
| `Citizenship1` | varchar(3) | NULL |  |  |
| `Citizenship2` | varchar(3) | NULL |  |  |

---

## GIC (Guaranteed Investment Certificate)

### `UB_GICAccount`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iClientID` | int | NULL |  | FK to UB_Client table - identifies the client/investor |
| `iPlanID` | int | NOT NULL |  | FK to UB_Plan table - identifies the investment plan/account |
| `iRepID` | int | NULL |  | FK to UB_Rep - identifies the representative/advisor |
| `Status` | char(1) | NULL |  |  |
| `IssuerCode` | varchar(6) | NULL |  |  |
| `ProductCode` | varchar(6) | NULL |  |  |
| `ProductType` | varchar(3) | NULL |  |  |
| `CurrencyCode` | varchar(3) | NULL |  |  |
| `mAmountOrg` | money | NULL |  | Monetary amount |
| `mAmount` | money | NULL |  | Monetary amount |
| `fRate` | float | NULL |  | Decimal/float value |
| `iTerm` | smallint | NULL |  |  |
| `TermUnit` | char(1) | NULL |  |  |
| `dtIssue` | datetime | NULL |  | Date/time field |
| `dtMaturity` | datetime | NULL |  | Date/time field |
| `dtIssueCurrent` | datetime | NULL |  | Date/time field |
| `dtMaturityCurrent` | datetime | NULL |  | Date/time field |
| `mMaturity` | money | NULL |  |  |
| `CertificateID` | varchar(20) | NULL |  |  |
| `RateAuthorization` | varchar(30) | NULL |  |  |
| `fCommRate` | float | NULL |  | Decimal/float value |
| `GrossNetFlag` | char(1) | NULL |  |  |
| `SettlementMode` | char(1) | NULL |  |  |
| `SettlementSource` | char(1) | NULL |  |  |
| `SettlementMethod` | char(1) | NULL |  |  |
| `RateCompoundFreq` | char(1) | NULL |  |  |
| `Description` | varchar(80) | NULL |  |  |
| `mTotalWithdrawal` | money | NULL |  |  |
| `mTotalInterest` | money | NULL |  |  |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `iCreatedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `dtLastModified` | datetime | NULL |  | Timestamp when record was last modified |
| `iLastModifiedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who last modified this record |
| `iModifiedMethod` | tinyint | NULL |  | Small integer/flag field |
| `IntPaymentFreq` | char(1) | NULL |  |  |
| `IntPaymentMethod` | char(1) | NULL |  |  |
| `dtIntPaymentStart` | datetime | NULL |  | Date/time field |
| `iIntPaymentBankID` | int | NULL |  | Integer field |
| `MatInstMethodPrin` | char(1) | NULL |  |  |
| `iMatInstBankAccIDPrin` | int | NULL |  | Integer field |
| `bMatInsCopyPrin` | tinyint | NULL |  |  |
| `MatInstMethodInt` | char(1) | NULL |  |  |
| `iMatInstBankAccIDInt` | int | NULL |  | Integer field |
| `bRedeemable` | tinyint | NULL |  |  |
| `iRedeemDays` | smallint | NULL |  |  |
| `mDealerCommission` | money | NULL |  |  |
| `iWFID` | int | NULL |  | Integer field |
| `iWFID2` | int | NULL |  | Integer field |
| `MaturityInstruction` | char(2) | NULL |  |  |
| `OwnershipType` | varchar(8) | NULL |  |  |
| `iReceipt` | tinyint | NULL |  | Small integer/flag field |
| `iFileID` | int | NULL |  | FK to file record (FundServ file) |
| `dtCashout` | datetime | NULL |  | Date/time field |
| `mCashout` | money | NULL |  |  |
| `iReinvested` | tinyint | NULL |  | Small integer/flag field |
| `mPYMTAmount` | money | NULL |  |  |
| `iPYMTInterestOnly` | tinyint | NULL |  | Small integer/flag field |
| `iPYMTAutoTrx` | tinyint | NULL |  | Small integer/flag field |
| `dtNextPYMT` | datetime | NULL |  | Date/time field |
| `iPYMTMonthEnd` | tinyint | NULL |  | Small integer/flag field |
| `dtPYMTStop` | datetime | NULL |  | Date/time field |
| `iAcceptHoliday` | tinyint | NULL |  | Small integer/flag field |
| `dtTermination` | datetime | NULL |  | Date/time field |
| `iFlag` | tinyint | NULL |  | Small integer/flag field |
| `iReview` | tinyint | NULL |  | Small integer/flag field |
| `iReviewUserID` | int | NULL |  | Integer field |
| `dtReview` | datetime | NULL |  | Date/time field |
| `iTransferFlag` | tinyint | NULL |  | Small integer/flag field |
| `dtStart` | datetime | NULL |  | Date/time field |
| `dtStop` | datetime | NULL |  | Date/time field |
| `iCommRebate` | tinyint | NULL |  | Small integer/flag field |
| `bF4S` | tinyint | NULL |  |  |
| `iEnvDocID` | int | NULL |  | Integer field |
| `iEnvDocStatus` | tinyint | NULL |  | Small integer/flag field |
| `Redeemability` | char(1) | NULL |  |  |
| `fCommRebateRate` | float | NULL |  | Decimal/float value |
| `fCommRateOrg` | float | NULL |  | Decimal/float value |
| `iSourceOfFund` | tinyint | NULL |  | Small integer/flag field |
| `iClientBankAccountID` | int | NULL |  | Integer field |
| `iTrustTrxDepositID` | int | NULL |  | Integer field |
| `iMatProcessStatus` | tinyint | NULL |  | Small integer/flag field |
| `mInterestPaidAtMat` | money | NULL |  |  |

### `UB_GICAccountEsc`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iAccountID` | int | NOT NULL |  | Integer field |
| `Unit` | char(1) | NOT NULL |  |  |
| `iFrom` | smallint | NULL |  |  |
| `iTo` | smallint | NULL |  |  |
| `fRate` | float | NULL |  | Decimal/float value |

### `UB_GICAccountEscalating_2bDelete?`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL |  | Primary key, auto-increment identifier |
| `iFrom1` | smallint | NULL |  |  |
| `iTo1` | smallint | NULL |  |  |
| `fRate1` | float | NULL |  | Decimal/float value |
| `iFrom2` | smallint | NULL |  |  |
| `iTo2` | smallint | NULL |  |  |
| `fRate2` | float | NULL |  | Decimal/float value |
| `iFrom3` | smallint | NULL |  |  |
| `iTo3` | smallint | NULL |  |  |
| `fRate3` | float | NULL |  | Decimal/float value |
| `iFrom4` | smallint | NULL |  |  |
| `iTo4` | smallint | NULL |  |  |
| `fRate4` | float | NULL |  | Decimal/float value |
| `iFrom5` | smallint | NULL |  |  |
| `iTo5` | smallint | NULL |  |  |
| `fRate5` | float | NULL |  | Decimal/float value |

### `UB_GICAccountExtra`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL |  | Primary key, auto-increment identifier |
| `JurisdictionProvince` | varchar(3) | NULL |  |  |
| `TermType` | char(1) | NULL |  |  |
| `TermDuration` | char(1) | NULL |  |  |
| `bIndexLinked` | tinyint | NULL |  |  |
| `IndexLinkedDescription` | varchar(80) | NULL |  |  |
| `RateType` | char(1) | NULL |  |  |
| `RateAccrual` | char(1) | NULL |  |  |
| `PaymentCalculation` | char(1) | NULL |  |  |
| `FIReference` | varchar(30) | NULL |  |  |
| `Notes` | varchar(max) | NULL |  |  |
| `mPADAmount` | money | NULL |  |  |
| `iPADDay` | tinyint | NULL |  | Small integer/flag field |
| `iRollOverTimes` | tinyint | NULL |  | Small integer/flag field |
| `iSignedForm` | tinyint | NULL |  | Small integer/flag field |
| `TrnsfMgmtCode` | char(6) | NULL |  |  |
| `TrnsfType` | varchar(20) | NULL |  |  |
| `iPADDay2` | tinyint | NULL |  | Small integer/flag field |
| `PADFrequency` | char(2) | NULL |  |  |
| `dtPADStart` | datetime | NULL |  | Date/time field |
| `iThirdPartyFlag` | tinyint | NULL |  | Small integer/flag field |
| `iThirdPartyTrx` | tinyint | NULL |  | Small integer/flag field |
| `iRolloverDays` | int | NULL |  | Integer field |
| `iRolloverMonths` | tinyint | NULL |  | Small integer/flag field |
| `iRolloverYears` | tinyint | NULL |  | Small integer/flag field |
| `iCertificateFlag` | tinyint | NULL |  | Small integer/flag field |

### `UB_GICAccountTrx`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iAccountID` | int | NOT NULL |  | Integer field |
| `iSequence` | int | NULL |  | Sequence number |
| `iClientID` | int | NULL |  | FK to UB_Client table - identifies the client/investor |
| `iPlanID` | int | NULL |  | FK to UB_Plan table - identifies the investment plan/account |
| `iRepID` | int | NULL |  | FK to UB_Rep - identifies the representative/advisor |
| `SourceID` | varchar(15) | NULL |  | Source identifier |
| `iTrxType` | tinyint | NULL |  | Small integer/flag field |
| `AmountType` | char(1) | NULL |  |  |
| `fAmount` | float | NULL |  | Decimal/float value |
| `mAmount` | money | NULL |  | Monetary amount |
| `mInterest` | money | NULL |  |  |
| `mTotalAmount` | money | NULL |  |  |
| `iStatus` | tinyint | NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `iOrderStatus` | tinyint | NULL |  | Small integer/flag field |
| `iTerm` | smallint | NULL |  |  |
| `TermUnit` | char(1) | NULL |  |  |
| `fRate` | float | NULL |  | Decimal/float value |
| `dtIssue` | datetime | NULL |  | Date/time field |
| `dtMaturity` | datetime | NULL |  | Date/time field |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `dtLastModified` | datetime | NULL |  | Timestamp when record was last modified |
| `iCreatedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `iLastModifiedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who last modified this record |
| `Notes` | varchar(max) | NULL |  |  |
| `dtEffective` | datetime | NULL |  | Effective date |
| `dtSettlement` | datetime | NULL |  | Settlement date |
| `mGrossAmount` | money | NULL |  |  |
| `mBonus` | money | NULL |  |  |
| `WithdrawalCode` | char(1) | NULL |  |  |
| `mWHTaxProv` | money | NULL |  |  |
| `mWHTaxFed` | money | NULL |  |  |
| `mServiceCharge` | money | NULL |  |  |
| `mNetAmount` | money | NULL |  |  |
| `GrossNetFlag` | char(1) | NULL |  |  |
| `SettlementMode` | char(1) | NULL |  |  |
| `SettlementSource` | char(1) | NULL |  |  |
| `SettlementMethod` | char(1) | NULL |  |  |
| `ChequeNumber` | varchar(20) | NULL |  |  |
| `iBankAccID` | int | NULL |  | Integer field |
| `CFNOrderID` | varchar(10) | NULL |  |  |
| `COMOrderID` | varchar(10) | NULL |  |  |
| `dtDeposit` | datetime | NULL |  | Date/time field |
| `iFundingFlag` | tinyint | NULL |  | Small integer/flag field |
| `CPARoutingNumber` | varchar(10) | NULL |  |  |
| `iCommOpt` | tinyint | NULL |  | Small integer/flag field |
| `iTrustID` | int | NULL |  | Integer field |
| `CFNRedemptionID` | varchar(10) | NULL |  |  |
| `ClawbackPrincipal` | char(1) | NULL |  |  |
| `iFileID` | int | NULL |  | FK to file record (FundServ file) |
| `iExportTaskID` | int | NULL |  | Integer field |

### `UB_GICCommRate`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `iProdID` | int | NOT NULL |  | Integer field |
| `fCommRate1` | float | NULL |  | Decimal/float value |
| `fCommRate2` | float | NULL |  | Decimal/float value |
| `fCommRate3` | float | NULL |  | Decimal/float value |
| `fCommRate4` | float | NULL |  | Decimal/float value |
| `fCommRate5` | float | NULL |  | Decimal/float value |
| `fCommRate6` | float | NULL |  | Decimal/float value |
| `fCommRate7` | float | NULL |  | Decimal/float value |
| `fCommRate8` | float | NULL |  | Decimal/float value |
| `fCommRate9` | float | NULL |  | Decimal/float value |
| `fCommRate10` | float | NULL |  | Decimal/float value |
| `fCommRate11` | float | NULL |  | Decimal/float value |
| `fCommRate12` | float | NULL |  | Decimal/float value |
| `fCommRate13` | float | NULL |  | Decimal/float value |
| `fCommRate14` | float | NULL |  | Decimal/float value |
| `fCommRate15` | float | NULL |  | Decimal/float value |
| `fCommRate16` | float | NULL |  | Decimal/float value |
| `fCommRate17` | float | NULL |  | Decimal/float value |
| `fCommRate18` | float | NULL |  | Decimal/float value |

### `UB_GICConfirmation`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `iTrxID` | int | NOT NULL |  | Integer field |
| `iObjID` | int | NOT NULL |  | Integer field |

### `UB_GICOrderFileCannex`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iDays` | int | NOT NULL |  | Integer field |
| `iSequence` | smallint | NOT NULL |  | Sequence number |
| `FileName` | varchar(50) | NOT NULL |  | File name |
| `iStatus` | tinyint | NOT NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |

### `UB_GICOrderSentCannex`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iOrderID` | int | NOT NULL |  | Integer field |
| `iStatus` | tinyint | NOT NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `iMSGID` | int | NOT NULL |  | Integer field |
| `dtCreated` | datetime | NOT NULL |  | Timestamp when record was created |
| `SourceID` | varchar(30) | NOT NULL |  | Source identifier |
| `MgmtCode` | varchar(6) | NOT NULL |  | Management company code |
| `DealerCode` | varchar(6) | NULL |  | Dealer code identifier |

### `UB_GICProdDef`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `iProdID` | int | NOT NULL |  | Integer field |
| `MgmtCode` | varchar(6) | NULL |  | Management company code |
| `ProductCode` | varchar(10) | NULL |  |  |
| `ProductNameEN` | varchar(80) | NULL |  |  |
| `ProductNameFR` | varchar(80) | NULL |  |  |
| `ProductUniqueID` | varchar(10) | NULL |  |  |
| `TaxStatus` | char(1) | NULL |  |  |
| `Redeemability` | char(1) | NULL |  |  |
| `iYears` | smallint | NULL |  |  |
| `iMonths` | smallint | NULL |  |  |
| `iDays` | smallint | NULL |  |  |
| `InterestCpdFreq` | char(2) | NULL |  |  |
| `InterestPayFreq` | char(1) | NULL |  |  |
| `dtChangeProd` | datetime | NULL |  | Date/time field |
| `iFileID` | int | NULL |  | FK to file record (FundServ file) |

### `UB_GICPYMTSchedule`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iGICID` | int | NULL |  | Integer field |
| `dtStart` | datetime | NULL |  | Date/time field |
| `mStart` | money | NULL |  |  |
| `dtEnd` | datetime | NULL |  | Date/time field |
| `mEnd` | money | NULL |  |  |
| `mPYMTAmount` | money | NULL |  |  |
| `mPYMTInterest` | money | NULL |  |  |
| `mPYMTPrincipal` | money | NULL |  |  |
| `mInterestLeft` | money | NULL |  |  |
| `mInterestTotal` | money | NULL |  |  |
| `mMaturity` | money | NULL |  |  |
| `iTrxID` | int | NULL |  | Integer field |

### `UB_GICRate`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `iProdID` | int | NOT NULL |  | Integer field |
| `IntRateUniqueId` | varchar(10) | NULL |  |  |
| `mDepositMin` | money | NULL |  |  |
| `mDepositMax` | money | NULL |  |  |
| `fIntRate` | float | NULL |  | Decimal/float value |
| `fIntRateChange` | float | NULL |  | Decimal/float value |
| `dtChangeRate` | datetime | NULL |  | Date/time field |
| `iYearMin` | smallint | NULL |  |  |
| `iMonthMin` | smallint | NULL |  |  |
| `iDayMin` | smallint | NULL |  |  |
| `MinType` | char(1) | NULL |  |  |
| `iYearMax` | smallint | NULL |  |  |
| `iMonthMax` | smallint | NULL |  |  |
| `iDayMax` | smallint | NULL |  |  |
| `MaxType` | char(1) | NULL |  |  |

### `UB_GICSearchList`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `iUserID` | int | NOT NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `iGICID` | int | NOT NULL |  | Integer field |

### `UB_GICTrxSearchList`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `UserID` | int | NOT NULL |  |  |
| `TrxID` | int | NOT NULL |  |  |

---

## Help System

### `UB_Help`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `ControlID` | varchar(50) | NULL |  |  |
| `DescriptionEN` | varchar(80) | NULL |  |  |
| `DescriptionFR` | varchar(80) | NULL |  |  |
| `FileNameEN` | varchar(300) | NULL |  |  |
| `FileNameFR` | varchar(300) | NULL |  |  |
| `iStatus` | tinyint | NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `GroupID` | varchar(5) | NULL |  |  |
| `iRole` | tinyint | NULL |  | Small integer/flag field |
| `iOrder` | int | NULL |  | Integer field |

---

## Identification Documents

### `UB_Identification`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `LinkedID` | int | NOT NULL |  |  |
| `IDType` | char(1) | NULL |  |  |
| `Description` | varchar(80) | NULL |  |  |
| `IDNumber` | varchar(50) | NULL |  |  |
| `IssuedPlace` | varchar(40) | NULL |  |  |
| `IssuedProvince` | varchar(3) | NULL |  |  |
| `IssuedCountry` | varchar(5) | NULL |  |  |
| `dtIssued` | datetime | NULL |  | Date/time field |
| `dtExpiry` | datetime | NULL |  | Date/time field |
| `iRecordedMethod` | smallint | NULL |  |  |
| `dtRecorded` | datetime | NULL |  | Date/time field |
| `iCreatedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `iLastModifiedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who last modified this record |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `dtLastModified` | datetime | NULL |  | Timestamp when record was last modified |
| `iCopyProvided` | tinyint | NULL |  | Small integer/flag field |
| `bVerified` | tinyint | NULL |  |  |
| `dtVerified` | datetime | NULL |  | Date/time field |

---

## Insurance Products

### `UB_InsuranceDetail`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `iInsuranceID` | int | NOT NULL |  | Integer field |
| `ReviewDescription` | varchar(20) | NULL |  |  |
| `InvestmentOption` | varchar(20) | NULL |  |  |
| `EliminationPeriod1` | varchar(20) | NULL |  |  |
| `EliminationPeriod2` | varchar(20) | NULL |  |  |
| `EliminationPeriod3` | varchar(20) | NULL |  |  |
| `mCashWithApp` | money | NULL |  |  |
| `mBalanceDue` | money | NULL |  |  |
| `mAdditionalDeposit` | money | NULL |  |  |
| `iCostOfInsurance` | smallint | NULL |  |  |
| `iLifeStyle` | smallint | NULL |  |  |
| `dtSentToHO` | datetime | NULL |  | Date/time field |
| `dtApproved` | datetime | NULL |  | Date/time field |
| `dtSentToSupplier` | datetime | NULL |  | Date/time field |
| `dtPolicyReview` | datetime | NULL |  | Date/time field |
| `dtParamedic` | datetime | NULL |  | Date/time field |
| `dtPlaced` | datetime | NULL |  | Date/time field |
| `dtCancelled` | datetime | NULL |  | Date/time field |
| `dtReceivedSupplier` | datetime | NULL |  | Date/time field |
| `mAnnualPremium` | money | NULL |  |  |
| `iPremiumMode` | smallint | NULL |  |  |
| `mPremiumAmount` | money | NULL |  |  |
| `iPremiumForOpt` | smallint | NULL |  |  |
| `iPremiumForValue` | smallint | NULL |  |  |
| `mPremiumMin` | money | NULL |  |  |
| `mPremiumMax` | money | NULL |  |  |
| `mPremiumExcess` | money | NULL |  |  |
| `PremiumDrawDate` | varchar(20) | NULL |  |  |
| `bIndexedPremium` | tinyint | NULL |  |  |
| `bRenewPremium` | tinyint | NULL |  |  |
| `bSteppedPremium` | tinyint | NULL |  |  |
| `mIndexedAmount` | money | NULL |  |  |
| `dtPremium1` | datetime | NULL |  | Date/time field |
| `mPremium1` | money | NULL |  |  |
| `dtPremium2` | datetime | NULL |  | Date/time field |
| `mPremium2` | money | NULL |  |  |
| `dtPremium3` | datetime | NULL |  | Date/time field |
| `mPremium3` | money | NULL |  |  |
| `dtPremium4` | datetime | NULL |  | Date/time field |
| `mPremium4` | money | NULL |  |  |
| `dtPremium5` | datetime | NULL |  | Date/time field |
| `mPremium5` | money | NULL |  |  |
| `mCommY1` | money | NULL |  |  |
| `mCommY2` | money | NULL |  |  |
| `mCommY3` | money | NULL |  |  |
| `mCommY4` | money | NULL |  |  |
| `mCommY5` | money | NULL |  |  |
| `mCommY6` | money | NULL |  |  |
| `mCommY7` | money | NULL |  |  |
| `mCommY8` | money | NULL |  |  |
| `mCommY9` | money | NULL |  |  |
| `mCommY10` | money | NULL |  |  |
| `mCommY11` | money | NULL |  |  |
| `mCommY12` | money | NULL |  |  |
| `mCommBonus` | money | NULL |  |  |
| `mCommMax` | money | NULL |  |  |
| `mCommExcess` | money | NULL |  |  |
| `mLifeFYC` | money | NULL |  |  |
| `mLifeBonus` | money | NULL |  |  |
| `mDisabilityFYC` | money | NULL |  |  |
| `mDisabilityBonus` | money | NULL |  |  |
| `mSegFYC` | money | NULL |  |  |
| `mSegBonus` | money | NULL |  |  |
| `mAnnuityFYC` | money | NULL |  |  |
| `mAnnuityBonus` | money | NULL |  |  |
| `iPayoutBenefitOpt` | smallint | NULL |  |  |
| `mMonthlyBenefit` | money | NULL |  |  |
| `bBenefitTaxable` | tinyint | NULL |  |  |
| `iBenefitPeriod1Opt` | tinyint | NULL |  | Small integer/flag field |
| `iBenefitPeriod1Value` | smallint | NULL |  |  |
| `iBenefitPeriod2Opt` | tinyint | NULL |  | Small integer/flag field |
| `iBenefitPeriod2Value` | smallint | NULL |  |  |
| `iBenefitPeriod3Opt` | tinyint | NULL |  | Small integer/flag field |
| `iBenefitPeriod3Value` | smallint | NULL |  |  |
| `iYRTYears` | smallint | NULL |  |  |
| `iLevelYears` | smallint | NULL |  |  |
| `iClass` | tinyint | NULL |  | Small integer/flag field |
| `iApprovalType` | tinyint | NULL |  | Small integer/flag field |
| `ApprovalType1` | varchar(100) | NULL |  |  |
| `ApprovalType2` | varchar(100) | NULL |  |  |
| `UnderWriterName` | varchar(100) | NULL |  |  |
| `iCoveragedType` | tinyint | NULL |  | Small integer/flag field |
| `Notes` | varchar(max) | NULL |  |  |
| `iPYMTStatus` | smallint | NULL |  |  |

### `UB_InsuranceMain`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iPlanID` | int | NOT NULL |  | FK to UB_Plan table - identifies the investment plan/account |
| `IssuerCode` | varchar(5) | NULL |  |  |
| `ProductCode` | varchar(5) | NULL |  |  |
| `iType` | tinyint | NULL |  | Type/category code |
| `iStatus` | tinyint | NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `PolicyNumber` | varchar(20) | NULL |  |  |
| `ApplicationNumber` | varchar(20) | NULL |  |  |
| `FirstInsuredName` | varchar(80) | NULL |  |  |
| `FirstInsuredSIN` | varchar(15) | NULL |  |  |
| `bFirstInsuredSmoker` | tinyint | NULL |  |  |
| `iFirstInsuredRelationship` | tinyint | NULL |  | Small integer/flag field |
| `mFirstInsuredFaceValue` | money | NULL |  |  |
| `dtFirstInsuredDOB` | datetime | NULL |  | Date/time field |
| `SecondInsuredName` | varchar(80) | NULL |  |  |
| `SecondInsuredSIN` | varchar(15) | NULL |  |  |
| `bSecondInsuredSmoker` | tinyint | NULL |  |  |
| `iSecondInsuredRelationship` | tinyint | NULL |  | Small integer/flag field |
| `mSecondInsuredFaceValue` | money | NULL |  |  |
| `dtSecondInsuredDOB` | datetime | NULL |  | Date/time field |
| `dtApplication` | datetime | NULL |  | Date/time field |
| `dtEffective` | datetime | NULL |  | Effective date |
| `dtContract` | datetime | NULL |  | Date/time field |
| `mCashValue` | money | NULL |  |  |
| `mLoanValue` | money | NULL |  |  |
| `iCreatedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `iLastModifiedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who last modified this record |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `dtLastModified` | datetime | NULL |  | Timestamp when record was last modified |
| `iWFID` | int | NULL |  | Integer field |
| `ProductDescription` | varchar(80) | NULL |  |  |

### `UB_InsuranceProduct`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `IssuerCode` | varchar(5) | NULL |  |  |
| `ProductCode` | varchar(5) | NULL |  |  |
| `NameEN` | varchar(80) | NULL |  | English name |
| `NameFR` | varchar(80) | NULL |  | French name |

### `UB_InsuranceRider`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iInsuranceID` | int | NULL |  | Integer field |
| `Name` | varchar(80) | NULL |  |  |
| `SIN` | varchar(15) | NULL |  |  |
| `bSmoker` | tinyint | NULL |  |  |
| `iRelationship` | tinyint | NULL |  | Small integer/flag field |
| `dtDOB` | datetime | NULL |  | Date of birth |
| `mFaceValue` | money | NULL |  |  |

---

## Intermediary Management

### `UB_Intermediary`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iType` | smallint | NOT NULL |  | Type/category code |
| `Code` | varchar(6) | NULL |  |  |
| `NameEN` | varchar(100) | NULL |  | English name |
| `NameFR` | varchar(100) | NULL |  | French name |
| `Registration` | varchar(40) | NULL |  |  |
| `iStatus` | smallint | NOT NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `iAddressID` | int | NOT NULL |  | Integer field |
| `iPhoneID` | int | NOT NULL |  | Integer field |
| `iEFTID` | int | NOT NULL |  | Integer field |
| `Notes` | varchar(250) | NULL |  |  |
| `iCreatedUserID` | int | NOT NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `iLastModifiedUserID` | int | NOT NULL |  | FK to UB_MemberLogin - internal user who last modified this record |
| `dtLastModified` | datetime | NULL |  | Timestamp when record was last modified |
| `bNSM` | tinyint | NULL |  |  |
| `iExcludeReportRep` | tinyint | NULL |  | Small integer/flag field |
| `iExcludeReportAdmin` | tinyint | NULL |  | Small integer/flag field |
| `iExcludeReportCompensation` | tinyint | NULL |  | Small integer/flag field |
| `BankCodeCAD` | varchar(4) | NULL |  |  |
| `BankTransitCAD` | varchar(5) | NULL |  |  |
| `BankAccountNumberCAD` | varchar(12) | NULL |  |  |
| `BankCodeUSD` | varchar(4) | NULL |  |  |
| `BankTransitUSD` | varchar(5) | NULL |  |  |
| `BankAccountNumberUSD` | varchar(12) | NULL |  |  |

### `UB_IntermediaryARC`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL |  | Primary key, auto-increment identifier |
| `iType` | smallint | NOT NULL |  | Type/category code |
| `Code` | varchar(4) | NOT NULL |  |  |
| `NameEN` | varchar(100) | NULL |  | English name |
| `NameFR` | varchar(100) | NULL |  | French name |
| `Registration` | varchar(40) | NULL |  |  |
| `iStatus` | smallint | NOT NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `iAddressID` | int | NOT NULL |  | Integer field |
| `iPhoneID` | int | NOT NULL |  | Integer field |
| `iEFTID` | int | NOT NULL |  | Integer field |
| `Notes` | varchar(250) | NULL |  |  |
| `iCreatedUserID` | int | NOT NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `iLastModifiedUserID` | int | NOT NULL |  | FK to UB_MemberLogin - internal user who last modified this record |
| `dtLastModified` | datetime | NULL |  | Timestamp when record was last modified |
| `bDeleted` | tinyint | NOT NULL |  |  |
| `bNSM` | tinyint | NULL |  |  |
| `BankCodeCAD` | varchar(4) | NULL |  |  |
| `BankTransitCAD` | varchar(5) | NULL |  |  |
| `BankAccountNumberCAD` | varchar(12) | NULL |  |  |
| `BankCodeUSD` | varchar(4) | NULL |  |  |
| `BankTransitUSD` | varchar(5) | NULL |  |  |
| `BankAccountNumberUSD` | varchar(12) | NULL |  |  |

---

## KYP (Know Your Product) Compliance

### `UB_KYPAuditTrailBase`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iFundDefID` | int | NULL |  | Integer field |
| `iFundPropID` | int | NULL |  | Integer field |
| `ValueStr` | varchar(80) | NULL |  |  |
| `dtEffective` | datetime | NULL |  | Effective date |

### `UB_KYPAuditTrailReview`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iMemberID` | int | NULL |  | FK to UB_Member - identifies the member/advisor |
| `iStatus` | tinyint | NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `dtReview` | datetime | NULL |  | Date/time field |
| `Code` | varchar(50) | NULL |  |  |
| `Notes` | varchar(max) | NULL |  |  |
| `iLg` | tinyint | NULL |  | Small integer/flag field |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `dtLastModified` | datetime | NULL |  | Timestamp when record was last modified |
| `iLastModifiedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who last modified this record |
| `DateFrom` | varchar(10) | NULL |  |  |
| `DateTo` | varchar(10) | NULL |  |  |
| `MgmtCode` | varchar(6) | NULL |  | Management company code |
| `FundID` | varchar(6) | NULL |  | Fund identifier code (e.g., DYN 3056) |
| `iFieldID` | int | NULL |  | Integer field |
| `bApproved` | tinyint | NULL |  |  |
| `iPdfObjID` | int | NULL |  | Integer field |

### `UB_KYPCompareFundList`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iCompareHeaderID` | int | NULL |  | Integer field |
| `iFundDefID` | int | NULL |  | Integer field |
| `MgmtCode` | varchar(6) | NULL |  | Management company code |
| `FundID` | varchar(6) | NULL |  | Fund identifier code (e.g., DYN 3056) |
| `iOrder` | tinyint | NULL |  | Small integer/flag field |
| `iFFObjID` | int | NULL |  | Integer field |

### `UB_KYPCompareFundListClient`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iCompareHeaderID` | int | NULL |  | Integer field |
| `iFundDefID` | int | NULL |  | Integer field |
| `MgmtCode` | varchar(6) | NULL |  | Management company code |
| `FundID` | varchar(6) | NULL |  | Fund identifier code (e.g., DYN 3056) |
| `iOrder` | tinyint | NULL |  | Small integer/flag field |
| `iFFObjID` | int | NULL |  | Integer field |

### `UB_KYPCompareHeader`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iMemberID` | int | NULL |  | FK to UB_Member - identifies the member/advisor |
| `iStatus` | tinyint | NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `dtReview` | datetime | NULL |  | Date/time field |
| `Code` | varchar(50) | NULL |  |  |
| `Notes` | varchar(max) | NULL |  |  |
| `iLg` | tinyint | NULL |  | Small integer/flag field |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `dtLastModified` | datetime | NULL |  | Timestamp when record was last modified |
| `iLastModifiedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who last modified this record |
| `iPdfObjID` | int | NULL |  | Integer field |

### `UB_KYPCompareHeaderClient`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iClientID` | int | NULL |  | FK to UB_Client table - identifies the client/investor |
| `iPlanID` | int | NULL |  | FK to UB_Plan table - identifies the investment plan/account |
| `AccountType` | char(2) | NULL |  |  |
| `DealerAccountID` | varchar(15) | NULL |  |  |
| `iStatus` | tinyint | NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `dtReview` | datetime | NULL |  | Date/time field |
| `Code` | varchar(80) | NULL |  |  |
| `Notes` | varchar(max) | NULL |  |  |
| `iLg` | tinyint | NULL |  | Small integer/flag field |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `iCreatedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `dtLastModified` | datetime | NULL |  | Timestamp when record was last modified |
| `iLastModifiedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who last modified this record |
| `iPdfObjID` | int | NULL |  | Integer field |
| `bClientSigEnable` | tinyint | NULL |  |  |
| `iDocumentFileID` | int | NULL |  | Integer field |

### `UB_KYPCompareItemDetail`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iCompareHeaderID` | int | NULL |  | Integer field |
| `iItemFundID` | int | NULL |  | Integer field |
| `LeftStr` | varchar(max) | NULL |  |  |
| `RightStr` | varchar(max) | NULL |  |  |
| `RadioBtn` | varchar(300) | NULL |  |  |
| `StartLeft` | varchar(80) | NULL |  |  |
| `EndLeft` | varchar(20) | NULL |  |  |
| `StartRight` | varchar(80) | NULL |  |  |
| `EndRight` | varchar(80) | NULL |  |  |
| `iFontStyleLeft` | tinyint | NULL |  | Small integer/flag field |
| `iFontStyleRight` | tinyint | NULL |  | Small integer/flag field |
| `iTextColorLeft` | int | NULL |  | Integer field |
| `iTextColorRight` | int | NULL |  | Integer field |

### `UB_KYPCompareItemDetailClient`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iCompareHeaderID` | int | NULL |  | Integer field |
| `iItemFundID` | int | NULL |  | Integer field |
| `LeftStr` | varchar(max) | NULL |  |  |
| `RightStr` | varchar(max) | NULL |  |  |
| `RadioBtn` | varchar(300) | NULL |  |  |
| `StartLeft` | varchar(80) | NULL |  |  |
| `EndLeft` | varchar(20) | NULL |  |  |
| `StartRight` | varchar(80) | NULL |  |  |
| `EndRight` | varchar(80) | NULL |  |  |
| `iFontStyleLeft` | tinyint | NULL |  | Small integer/flag field |
| `iFontStyleRight` | tinyint | NULL |  | Small integer/flag field |
| `iTextColorLeft` | int | NULL |  | Integer field |
| `iTextColorRight` | int | NULL |  | Integer field |

### `UB_KYPCompareItemFundList`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iCompareHeaderID` | int | NULL |  | Integer field |
| `iItemID` | int | NULL |  | Integer field |
| `iItemFundID` | int | NULL |  | Integer field |
| `iFundDefID` | int | NULL |  | Integer field |

### `UB_KYPCompareItemFundListClient`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iCompareHeaderID` | int | NULL |  | Integer field |
| `iItemID` | int | NULL |  | Integer field |
| `iItemFundID` | int | NULL |  | Integer field |
| `iFundDefID` | int | NULL |  | Integer field |

### `UB_KYPCompareItemList`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iCompareHeaderID` | int | NULL |  | Integer field |
| `iItemID` | int | NULL |  | Integer field |
| `ItemName` | varchar(80) | NULL |  |  |

### `UB_KYPCompareItemListClient`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iCompareHeaderID` | int | NULL |  | Integer field |
| `iItemID` | int | NULL |  | Integer field |
| `ItemName` | varchar(80) | NULL |  |  |

### `UB_KYPFundAuditTrailHeader`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iFundDefID` | int | NULL |  | Integer field |
| `iUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `iUserType` | tinyint | NULL |  | Small integer/flag field |
| `iAction` | tinyint | NULL |  | Small integer/flag field |
| `ExtraInfo` | varchar(50) | NULL |  |  |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |

### `UB_KYPFundAuditTrailLog`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iGroupID` | int | NULL |  | Integer field |
| `iUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `iFundDefID` | int | NULL |  | Integer field |
| `iFundPropID` | int | NULL |  | Integer field |
| `ValueFromStr` | varchar(80) | NULL |  |  |
| `ValueToStr` | varchar(80) | NULL |  |  |
| `dtEffective` | datetime | NULL |  | Effective date |
| `ExtraInfo` | varchar(20) | NULL |  |  |
| `iSignificantChange` | tinyint | NULL |  | Small integer/flag field |

---

## LAP (Leveraged Asset Program)

### `UB_LAP_AdvisorFeePymt`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iAvisorFeesID` | int | NULL |  | Integer field |
| `iPayrollID` | int | NULL |  | Integer field |
| `Currency` | char(2) | NULL |  |  |
| `dtSettlDate` | datetime | NULL |  | Date/time field |
| `mTotCommPd` | money | NULL |  |  |
| `mTotTaxCollctd` | money | NULL |  |  |
| `mTotExpense` | money | NULL |  |  |
| `mTotAdvisorFeePymt` | money | NULL |  |  |

### `UB_LAP_AdvisorFeeRec`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iAvisorFeesID` | int | NULL |  | Integer field |
| `iAdvisorFeePymtID` | int | NULL |  | Integer field |
| `iPayableID` | int | NULL |  | Integer field |
| `IntCode` | varchar(5) | NULL |  |  |
| `IntAcctID` | varchar(15) | NULL |  |  |
| `RepCode` | varchar(5) | NULL |  | Representative/advisor code |
| `JurTaxCode` | char(3) | NULL |  |  |
| `CommissionType` | char(1) | NULL |  |  |
| `IncomeType` | char(1) | NULL |  |  |
| `mCommPd` | money | NULL |  |  |
| `mTaxCollctd` | money | NULL |  |  |
| `mTotPymt` | money | NULL |  |  |

### `UB_LAP_AdvisorFees`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `FileName` | varchar(260) | NULL |  | File name |
| `dtCreateDate` | datetime | NULL |  | Date/time field |
| `dtPerStartDate` | datetime | NULL |  | Date/time field |
| `dtPerEndDate` | datetime | NULL |  | Date/time field |
| `DlrCode` | varchar(5) | NULL |  |  |
| `iSequence` | int | NULL |  | Sequence number |
| `iStatus` | tinyint | NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `iItemID` | int | NULL |  | Integer field |
| `dtStart` | datetime | NULL |  | Date/time field |
| `dtEnd` | datetime | NULL |  | Date/time field |

---

## Loan Management

### `UB_Loan`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iPlanID` | int | NOT NULL |  | FK to UB_Plan table - identifies the investment plan/account |
| `iStatus` | tinyint | NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `iBankID` | int | NULL |  | Integer field |
| `Description` | varchar(80) | NULL |  |  |
| `iLoanSource` | tinyint | NULL |  | Small integer/flag field |
| `iLoanType` | tinyint | NULL |  | Small integer/flag field |
| `iPaymentType` | tinyint | NULL |  | Small integer/flag field |
| `iMarginCall` | tinyint | NULL |  | Small integer/flag field |
| `mLoanAmount` | money | NULL |  |  |
| `iTerm` | smallint | NULL |  |  |
| `TermType` | char(1) | NULL |  |  |
| `fRate` | float | NULL |  | Decimal/float value |
| `dtStart` | datetime | NULL |  | Date/time field |
| `dtEnd` | datetime | NULL |  | Date/time field |
| `dtFirstPayment` | datetime | NULL |  | Date/time field |
| `mPayment` | money | NULL |  |  |
| `iPaymentFrequency` | tinyint | NULL |  | Small integer/flag field |
| `mRequiredAmount` | money | NULL |  |  |
| `iApprovalStatusInitial` | tinyint | NULL |  | Small integer/flag field |
| `iApprovalUserIDInitial` | int | NULL |  | Integer field |
| `dtApprovalInitial` | datetime | NULL |  | Date/time field |
| `iApprovalStatusLender` | tinyint | NULL |  | Small integer/flag field |
| `dtApprovalLender` | datetime | NULL |  | Date/time field |
| `iApprovalStatusFinal` | tinyint | NULL |  | Small integer/flag field |
| `iApprovalUserIDFinal` | int | NULL |  | Integer field |
| `dtApprovalFinal` | datetime | NULL |  | Date/time field |
| `iAssessmentFlag` | tinyint | NULL |  | Small integer/flag field |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `iCreatedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `dtLastModified` | datetime | NULL |  | Timestamp when record was last modified |
| `iLastModifiedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who last modified this record |
| `iWFID` | int | NULL |  | Integer field |
| `iRateType` | tinyint | NULL |  | Small integer/flag field |
| `mOutStanding` | money | NULL |  |  |
| `dtOutStanding` | datetime | NULL |  | Date/time field |
| `Notes` | varchar(250) | NULL |  |  |
| `bFileImport` | tinyint | NULL |  |  |
| `iStatus2` | tinyint | NULL |  | Status code (specific to this context) |

### `UB_LoanAction`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iLoanID` | int | NULL |  | Integer field |
| `iActionID` | tinyint | NULL |  | Small integer/flag field |
| `iPlanID` | int | NULL |  | FK to UB_Plan table - identifies the investment plan/account |
| `iUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `dtInquiry` | datetime | NULL |  | Date/time field |
| `ContactName` | varchar(100) | NULL |  |  |
| `InquiryDetail` | varchar(200) | NULL |  |  |
| `Resolution` | varchar(200) | NULL |  |  |
| `dtResolution` | datetime | NULL |  | Date/time field |

### `UB_LoanAssetLiquid`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iLoanID` | int | NULL |  | Integer field |
| `iPlanID` | int | NULL |  | FK to UB_Plan table - identifies the investment plan/account |
| `iDefID` | int | NULL |  | Integer field |
| `DefDescription` | varchar(100) | NULL |  |  |
| `mMKV` | money | NULL |  |  |
| `iUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |

### `UB_LoanAssetOther`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iLoanID` | int | NULL |  | Integer field |
| `iPlanID` | int | NULL |  | FK to UB_Plan table - identifies the investment plan/account |
| `iUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `iDefID` | int | NULL |  | Integer field |
| `DefDescription` | varchar(100) | NULL |  |  |
| `mMKV` | money | NULL |  |  |

### `UB_LoanIncome`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iLoanID` | int | NULL |  | Integer field |
| `iPlanID` | int | NULL |  | FK to UB_Plan table - identifies the investment plan/account |
| `iUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `iDefID` | int | NULL |  | Integer field |
| `DefDescription` | varchar(100) | NULL |  |  |
| `mAnnually` | money | NULL |  |  |
| `mMonthly` | money | NULL |  |  |

### `UB_LoanLiability`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iLoanID` | int | NULL |  | Integer field |
| `iPlanID` | int | NULL |  | FK to UB_Plan table - identifies the investment plan/account |
| `iUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `iDefID` | int | NULL |  | Integer field |
| `DefDescription` | varchar(100) | NULL |  |  |
| `mBalance` | money | NULL |  |  |
| `mPayment` | money | NULL |  |  |

### `UB_LoanSupportDoc`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iLoanID` | int | NULL |  | Integer field |
| `iPlanID` | int | NULL |  | FK to UB_Plan table - identifies the investment plan/account |
| `iUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `iDocID` | int | NULL |  | Integer field |
| `DocDescription` | varchar(100) | NULL |  |  |
| `iReceived` | tinyint | NULL |  | Small integer/flag field |
| `dtReceived` | datetime | NULL |  | Date/time field |
| `FileName` | varchar(250) | NULL |  | File name |
| `FileData` | varbinary(max) | NULL |  |  |
| `iFileSize` | int | NULL |  | Integer field |
| `FileType` | varchar(80) | NULL |  |  |

---

## Logo Management

### `UB_Logos`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iType` | smallint | NULL |  | Type/category code |
| `iLinkedID` | int | NULL |  | Integer field |
| `FileName` | varchar(255) | NULL |  | File name |
| `FileData` | varbinary(max) | NULL |  |  |
| `iFileSize` | int | NULL |  | Integer field |
| `FileType` | varchar(80) | NULL |  |  |
| `iPosX` | int | NULL |  | Integer field |
| `iPosY` | int | NULL |  | Integer field |
| `iWidth` | int | NULL |  | Integer field |
| `iHeight` | int | NULL |  | Integer field |
| `iLg` | tinyint | NULL |  | Small integer/flag field |
| `iHeaderOffsetY` | int | NULL |  | Integer field |
| `WebSite` | varchar(100) | NULL |  |  |
| `iType2` | tinyint | NULL |  | Small integer/flag field |
| `iLinkedID2` | int | NULL |  | Integer field |

---

## Member/Advisor Management

### `UB_Member`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iDealershipID` | int | NOT NULL |  | Integer field |
| `iLoginID` | int | NULL |  | Integer field |
| `FileID` | varchar(20) | NOT NULL |  |  |
| `SIN` | varchar(9) | NOT NULL |  |  |
| `iStatus` | tinyint | NOT NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `FirstName` | varchar(40) | NOT NULL |  | First name |
| `LastName` | varchar(80) | NULL |  | Last name |
| `Title` | char(1) | NOT NULL |  |  |
| `iSex` | tinyint | NOT NULL |  | Small integer/flag field |
| `Language` | char(1) | NOT NULL |  |  |
| `dtDOB` | datetime | NULL |  | Date of birth |
| `Salutation` | varchar(50) | NULL |  |  |
| `iMaritalStatus` | tinyint | NULL |  | Small integer/flag field |
| `Website` | varchar(100) | NULL |  |  |
| `dtCreated` | datetime | NOT NULL |  | Timestamp when record was created |
| `dtLastModified` | datetime | NOT NULL |  | Timestamp when record was last modified |
| `iCreatedUserID` | int | NOT NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `iLastModifiedUserID` | int | NOT NULL |  | FK to UB_MemberLogin - internal user who last modified this record |
| `iAddressID` | int | NULL |  | Integer field |
| `iPhoneID` | int | NULL |  | Integer field |
| `dtStart` | datetime | NULL |  | Date/time field |
| `bAdmin` | tinyint | NULL |  |  |
| `bManager` | tinyint | NULL |  |  |
| `bRep` | tinyint | NULL |  |  |
| `bAssistant` | tinyint | NULL |  |  |
| `bDealer` | tinyint | NULL |  |  |
| `bCompOfficer` | tinyint | NULL |  |  |
| `bRegionalVP` | tinyint | NULL |  |  |
| `bMF` | tinyint | NULL |  |  |
| `bGIC` | tinyint | NULL |  |  |
| `bSF` | tinyint | NULL |  |  |
| `bHF` | tinyint | NULL |  |  |
| `bPF` | tinyint | NULL |  |  |
| `bLS` | tinyint | NULL |  |  |
| `bLP` | tinyint | NULL |  |  |
| `bSN` | tinyint | NULL |  |  |
| `bLN` | tinyint | NULL |  |  |
| `bWP` | tinyint | NULL |  |  |
| `bOther` | tinyint | NULL |  |  |
| `CompanyName` | varchar(80) | NULL |  |  |
| `FederalBN` | varchar(15) | NULL |  |  |
| `ProvincialBN` | varchar(15) | NULL |  |  |
| `ForeignSSN` | varchar(15) | NULL |  |  |
| `iDependants` | smallint | NULL |  |  |
| `Notes` | varchar(max) | NULL |  |  |
| `iTradingPermissionID` | int | NULL |  | Integer field |
| `iTradingComplianceID` | int | NULL |  | Integer field |
| `Sex` | char(1) | NULL |  | Gender (M/F) |
| `mLastEarning` | money | NULL |  |  |
| `dtLastEarning` | datetime | NULL |  | Date/time field |
| `mEarningYTD` | money | NULL |  |  |
| `dtEarningYTD` | datetime | NULL |  | Date/time field |
| `bProcessCommission` | tinyint | NOT NULL |  |  |
| `bModifyAttachment` | tinyint | NOT NULL |  |  |
| `iWFID` | int | NOT NULL |  | Integer field |
| `WFPassword` | varchar(120) | NOT NULL |  | Encrypted/hashed password |
| `bExtraRestrictedAccess` | tinyint | NULL |  |  |
| `bPermitSettleDeposit` | tinyint | NULL |  |  |
| `bPermitSettleTrx` | tinyint | NULL |  |  |
| `bDeleteNotification` | tinyint | NULL |  |  |
| `bSetupUser` | tinyint | NULL |  |  |
| `Credential` | varchar(50) | NULL |  |  |
| `Description` | varchar(80) | NULL |  |  |
| `Identification` | varchar(80) | NULL |  |  |
| `DealerCodeX` | varchar(100) | NULL |  | Dealer code identifier |
| `LinkedIn` | varchar(200) | NULL |  |  |
| `FaceBook` | varchar(200) | NULL |  |  |
| `Tweeter` | varchar(200) | NULL |  |  |
| `iSpecial` | tinyint | NULL |  | Small integer/flag field |
| `RDBANumber` | varchar(15) | NULL |  |  |
| `NRDNumber` | varchar(20) | NULL |  |  |
| `iESigOpt` | tinyint | NULL |  | Small integer/flag field |
| `iRestrictionFlag` | int | NULL |  | Integer field |
| `TradeName` | varchar(80) | NULL |  |  |
| `iSaleManagerID` | int | NULL |  | Integer field |
| `iLAP` | tinyint | NULL |  | Small integer/flag field |
| `iGroupID` | tinyint | NULL |  | Small integer/flag field |
| `AltEmail` | varchar(100) | NULL |  |  |
| `iTrusteeFeeCode` | tinyint | NULL |  | Small integer/flag field |
| `eSignAccessCode` | varchar(50) | NULL |  |  |
| `WorkGroup` | varchar(15) | NULL |  |  |
| `bAlternative` | tinyint | NULL |  |  |
| `bETF` | tinyint | NULL |  |  |
| `bExempt` | tinyint | NULL |  |  |
| `ieSign2FAOpt` | tinyint | NULL |  | Small integer/flag field |
| `ExtraName1` | varchar(80) | NULL |  |  |
| `ExtraName2` | varchar(80) | NULL |  |  |
| `ExtraName3` | varchar(80) | NULL |  |  |
| `ExtraName4` | varchar(80) | NULL |  |  |
| `ExtraName5` | varchar(80) | NULL |  |  |
| `StmtSubFolder` | varchar(50) | NULL |  |  |

### `UB_MemberAgentID`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iMemberID` | int | NOT NULL |  | FK to UB_Member - identifies the member/advisor |
| `MgmtCode` | varchar(6) | NOT NULL |  | Management company code |
| `AgentID` | varchar(12) | NULL |  |  |

### `UB_MemberAppExport`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iAppID` | int | NULL |  | Integer field |
| `iMemberID` | int | NULL |  | FK to UB_Member - identifies the member/advisor |
| `AppUserID` | varchar(80) | NULL |  |  |
| `AppPW` | varchar(200) | NULL |  |  |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `dtLastModified` | datetime | NULL |  | Timestamp when record was last modified |
| `iCreatedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `iLastModifiedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who last modified this record |
| `TokenStr` | varchar(max) | NULL |  |  |
| `dtTokenExpiry` | datetime | NULL |  | Date/time field |

### `UB_MemberAssistant`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iAssistantID` | int | NULL |  | Integer field |
| `iMemberID` | int | NULL |  | FK to UB_Member - identifies the member/advisor |
| `iFlag` | tinyint | NULL |  | Small integer/flag field |

### `UB_MemberBankAccount`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iMemberID` | int | NOT NULL |  | FK to UB_Member - identifies the member/advisor |
| `iType` | smallint | NOT NULL |  | Type/category code |
| `LinkedID` | int | NOT NULL |  |  |
| `iBankID` | int | NOT NULL |  | Integer field |
| `iBranchID` | int | NOT NULL |  | Integer field |
| `AccountType` | char(1) | NOT NULL |  |  |
| `AccountNumber` | varchar(40) | NOT NULL |  |  |
| `CurrencyID` | char(2) | NOT NULL |  |  |
| `iStatus` | smallint | NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `FirstName` | varchar(40) | NULL |  | First name |
| `LastName` | varchar(40) | NULL |  | Last name |
| `ContactName` | varchar(50) | NULL |  |  |
| `ContactPhone` | varchar(15) | NULL |  |  |
| `ContactPhoneExt` | varchar(8) | NULL |  |  |
| `bDefault` | tinyint | NOT NULL |  |  |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `dtLastModified` | datetime | NULL |  | Timestamp when record was last modified |
| `iCreatedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `iLastModifiedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who last modified this record |
| `Notes` | varchar(max) | NULL |  |  |
| `DealerCode` | varchar(5) | NULL |  | Dealer code identifier |
| `BankCode` | varchar(4) | NULL |  |  |
| `TransitNumber` | varchar(10) | NULL |  |  |

### `UB_MemberCommRate_2bDeleted`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iMemberID` | int | NULL |  | FK to UB_Member - identifies the member/advisor |
| `iRepID` | int | NULL |  | FK to UB_Rep - identifies the representative/advisor |
| `iCommTemplateID` | int | NULL |  | Integer field |
| `fRepRate` | float | NULL |  | Decimal/float value |
| `fBranchOverride` | float | NULL |  | Decimal/float value |
| `dtRateSince` | datetime | NULL |  | Date/time field |
| `fSplitRepRate` | float | NULL |  | Decimal/float value |
| `iSplitRepID1` | int | NULL |  | Integer field |
| `iSplitRepID2` | int | NULL |  | Integer field |
| `iSplitRepID3` | int | NULL |  | Integer field |
| `fSplitRepRate1` | float | NULL |  | Decimal/float value |
| `fSplitRepRate2` | float | NULL |  | Decimal/float value |
| `fSplitRepRate3` | float | NULL |  | Decimal/float value |
| `fSplitMemberRate` | float | NULL |  | Decimal/float value |
| `iSplitMemberID1` | int | NULL |  | Integer field |
| `iSplitMemberID2` | int | NULL |  | Integer field |
| `iSplitMemberID3` | int | NULL |  | Integer field |
| `fSplitMemberRate1` | float | NULL |  | Decimal/float value |
| `fSplitMemberRate2` | float | NULL |  | Decimal/float value |
| `fSplitMemberRate3` | float | NULL |  | Decimal/float value |
| `iCreatedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `iLastModifiedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who last modified this record |
| `dtLastModified` | datetime | NULL |  | Timestamp when record was last modified |

### `UB_MemberComplianceSetting`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iMemberID` | int | NOT NULL |  | FK to UB_Member - identifies the member/advisor |
| `iSupervisoryLevel` | tinyint | NOT NULL |  | Small integer/flag field |
| `dtStart` | datetime | NULL |  | Date/time field |
| `iNoFSPlanUnapproved` | tinyint | NOT NULL |  | Small integer/flag field |
| `iNoFSDoc25Missing` | tinyint | NOT NULL |  | Small integer/flag field |
| `iWithholdingCommission` | tinyint | NOT NULL |  | Small integer/flag field |
| `iRejectEmail` | tinyint | NULL |  | Small integer/flag field |
| `iPreTrade` | tinyint | NULL |  | Small integer/flag field |

### `UB_MemberDoc`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iType` | tinyint | NULL |  | Type/category code |
| `iLinkedID` | int | NULL |  | Integer field |
| `Description` | varchar(80) | NULL |  |  |
| `FileName` | varchar(250) | NULL |  | File name |
| `FileType` | varchar(80) | NULL |  |  |
| `iFileSize` | int | NULL |  | Integer field |
| `FileData` | varbinary(max) | NULL |  |  |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `dtLastModified` | datetime | NULL |  | Timestamp when record was last modified |
| `iCreatedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `iLastModifiedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who last modified this record |

### `UB_MemberLicense`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iMemberID` | int | NOT NULL |  | FK to UB_Member - identifies the member/advisor |
| `iRepID` | int | NULL |  | FK to UB_Rep - identifies the representative/advisor |
| `iStatus` | tinyint | NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `Province` | varchar(3) | NULL |  |  |
| `LicenseNumber` | varchar(30) | NULL |  |  |
| `dtEffective` | datetime | NULL |  | Effective date |
| `dtExpiry` | datetime | NULL |  | Date/time field |
| `iCreatedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `iLastModifiedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who last modified this record |
| `dtLastModified` | datetime | NULL |  | Timestamp when record was last modified |
| `iLevel` | tinyint | NULL |  | Small integer/flag field |
| `iType` | tinyint | NULL |  | Type/category code |
| `iInsPremiumMode` | tinyint | NULL |  | Small integer/flag field |
| `iInsCoverageType` | tinyint | NULL |  | Small integer/flag field |
| `dtInsEffective` | datetime | NULL |  | Date/time field |
| `dtInsExpiry` | datetime | NULL |  | Date/time field |
| `InsPolicyNumber` | varchar(30) | NULL |  |  |
| `InsCompany` | varchar(80) | NULL |  |  |
| `mInsPremium` | money | NULL |  |  |
| `mInsDeductable` | money | NULL |  |  |
| `mInsCoverage` | money | NULL |  |  |
| `fCoInsured` | float | NULL |  | Decimal/float value |

### `UB_MemberLogin`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iMemberID` | int | NOT NULL |  | FK to UB_Member - identifies the member/advisor |
| `LoginID` | varchar(100) | NOT NULL |  | Login username |
| `EncPW` | varchar(200) | NULL |  | Encrypted/hashed password |
| `iStatus` | tinyint | NOT NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `iPWStatus` | smallint | NOT NULL |  | Password status code |
| `dtEffective` | datetime | NULL |  | Effective date |
| `iMaxLoginAllow` | smallint | NOT NULL |  | Maximum allowed login attempts before lockout |
| `iUserProfile` | int | NOT NULL |  | Integer field |
| `iUserProfileDetail` | int | NOT NULL |  | Integer field |
| `dtLastLoginTry` | datetime | NULL |  | Last login attempt timestamp |
| `dtLastLoginOK` | datetime | NULL |  | Last successful login timestamp |
| `dtCreated` | datetime | NOT NULL |  | Timestamp when record was created |
| `dtLastModified` | datetime | NOT NULL |  | Timestamp when record was last modified |
| `iCreatedUserID` | int | NOT NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `iLastModifiedUserID` | int | NOT NULL |  | FK to UB_MemberLogin - internal user who last modified this record |
| `iTryCount` | tinyint | NOT NULL |  | Current failed login attempt count |
| `dtLastPW` | datetime | NULL |  | Last password change timestamp |
| `iStartupOpt` | int | NULL |  | Integer field |
| `i2FactorOpt` | tinyint | NULL |  |  |
| `LastIP` | varchar(50) | NULL |  |  |
| `VerificationCode` | varchar(15) | NULL |  |  |
| `dtVCCreated` | datetime | NULL |  | Date/time field |
| `iRestrictFlag` | int | NULL |  | Integer field |

### `UB_MemberLoginHistory`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `SessionID` | varchar(50) | NOT NULL |  |  |
| `iMemberID` | int | NOT NULL |  | FK to UB_Member - identifies the member/advisor |
| `iLoginID` | int | NOT NULL |  | Integer field |
| `dtLogin` | datetime | NOT NULL |  | Date/time field |
| `dtLogout` | datetime | NULL |  | Date/time field |
| `bExpired` | tinyint | NULL |  |  |
| `ClientIP` | varchar(50) | NULL |  |  |

### `UB_MemberNotes`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iMemberID` | int | NOT NULL |  | FK to UB_Member - identifies the member/advisor |
| `Notes` | varchar(max) | NULL |  |  |
| `iCreatedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `iLastModifiedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who last modified this record |
| `dtLastModified` | datetime | NULL |  | Timestamp when record was last modified |

### `UB_MemberOBA`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iMemberID` | int | NULL |  | FK to UB_Member - identifies the member/advisor |
| `iStatus` | tinyint | NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `iDefID` | int | NULL |  | Integer field |
| `DefDescription` | varchar(200) | NULL |  |  |

### `UB_MemberPWHis`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `iMemberID` | int | NOT NULL |  | FK to UB_Member - identifies the member/advisor |
| `EncPW` | varchar(200) | NOT NULL |  | Encrypted/hashed password |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |

### `UB_MemberRepAccess`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iMemberID` | int | NOT NULL |  | FK to UB_Member - identifies the member/advisor |
| `iRepID` | int | NOT NULL |  | FK to UB_Rep - identifies the representative/advisor |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `iCreatedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `iCreatedMethod` | tinyint | NULL |  | Small integer/flag field |

### `UB_MemberRepAccessEx`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iMemberID` | int | NOT NULL |  | FK to UB_Member - identifies the member/advisor |
| `iLevel` | tinyint | NOT NULL |  | Small integer/flag field |
| `DealerCode` | varchar(5) | NOT NULL |  | Dealer code identifier |
| `RepCode` | varchar(8) | NOT NULL |  | Representative/advisor code |
| `iCreatedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |

### `UB_MemberT4Adjust`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `DealerCode` | varchar(5) | NULL |  | Dealer code identifier |
| `iMemberID` | int | NULL |  | FK to UB_Member - identifies the member/advisor |
| `iYear` | int | NULL |  | Integer field |
| `mAmount` | money | NULL |  | Monetary amount |
| `DescStr` | varchar(80) | NULL |  |  |
| `iCreatedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `iSlipID` | int | NULL |  | Integer field |
| `iRL1ID` | int | NULL |  | Integer field |

### `UB_MemberTradingPermission`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iMemberID` | int | NOT NULL |  | FK to UB_Member - identifies the member/advisor |
| `iBuy` | tinyint | NOT NULL |  | Small integer/flag field |
| `iSell` | tinyint | NOT NULL |  | Small integer/flag field |
| `iSwitch` | tinyint | NOT NULL |  | Small integer/flag field |
| `iCommRebate` | tinyint | NOT NULL |  | Small integer/flag field |
| `iInternalTransfer` | tinyint | NOT NULL |  | Small integer/flag field |
| `iExternalTransfer` | tinyint | NOT NULL |  | Small integer/flag field |
| `iReversal` | tinyint | NOT NULL |  | Small integer/flag field |
| `iAOT` | tinyint | NOT NULL |  | Small integer/flag field |
| `iCAX` | tinyint | NOT NULL |  | Small integer/flag field |
| `iICT` | tinyint | NOT NULL |  | Small integer/flag field |
| `iBackDate` | tinyint | NOT NULL |  | Small integer/flag field |
| `iBulkSwitch` | tinyint | NOT NULL |  | Small integer/flag field |
| `iModSettled` | tinyint | NOT NULL |  | Small integer/flag field |
| `iManualTrx` | tinyint | NOT NULL |  | Small integer/flag field |
| `iOrderFile` | tinyint | NOT NULL |  | Small integer/flag field |
| `iTrxView` | tinyint | NOT NULL |  | Small integer/flag field |
| `iAccessClient` | tinyint | NULL |  | Small integer/flag field |
| `iAccessPlan` | tinyint | NULL |  | Small integer/flag field |
| `iAccessAccount` | tinyint | NULL |  | Small integer/flag field |
| `iDashboard` | tinyint | NULL |  | Small integer/flag field |
| `iExport` | tinyint | NULL |  | Small integer/flag field |
| `iBasket` | tinyint | NULL |  | Small integer/flag field |
| `iApproveStmt` | tinyint | NULL |  | Small integer/flag field |
| `iChangeDealerAccountID` | tinyint | NULL |  | Small integer/flag field |
| `iChangeAccountUnit` | tinyint | NULL |  | Small integer/flag field |
| `iViewCommissionDue` | tinyint | NULL |  | Small integer/flag field |
| `iNoTradeKYCMissing` | tinyint | NULL |  | Small integer/flag field |
| `iDisableFlag1` | tinyint | NULL |  | Small integer/flag field |
| `iCAN` | tinyint | NULL |  | Small integer/flag field |
| `iGICFlag` | tinyint | NULL |  | Small integer/flag field |
| `iDisableFlag2` | int | NULL |  | Integer field |
| `iGICTrx` | tinyint | NULL |  | Small integer/flag field |

---

## MER (Management Expense Ratio) Reporting

### `UB_MER_HouseHold`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iStatus` | tinyint | NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `iAddressCheck` | int | NULL |  | Integer field |
| `AddressStr` | varchar(400) | NULL |  |  |
| `iMainClientID` | int | NULL |  | Integer field |
| `iMainAddressID` | int | NULL |  | Integer field |
| `HouseholdName` | varchar(200) | NULL |  |  |

### `UB_MER_HouseHoldDetail`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iClientID` | int | NULL |  | FK to UB_Client table - identifies the client/investor |
| `iHouseHoldID` | int | NULL |  | Integer field |
| `iStatus` | tinyint | NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |

### `UB_MER_MKVPos`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iMER_ReportID` | int | NULL |  | Integer field |
| `iPosID` | int | NULL |  | FK to position record (fund holding) |
| `mMKV` | money | NULL |  |  |
| `iStatus` | tinyint | NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |

### `UB_MER_Report`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iStatus` | tinyint | NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `dtEffective` | datetime | NULL |  | Effective date |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `dtCompleted` | datetime | NULL |  | Date/time field |
| `Notes` | varchar(max) | NULL |  |  |

### `UB_MER_ReportClient`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iMER_ReportID` | int | NULL |  | Integer field |
| `iClientID` | int | NULL |  | FK to UB_Client table - identifies the client/investor |
| `MgmtCode` | varchar(5) | NULL |  | Management company code |
| `iMKV` | int | NULL |  | Integer field |
| `mMKV` | money | NULL |  |  |
| `iHouseHoldID` | int | NULL |  | Integer field |
| `iHouseholdReportID` | int | NULL |  | Integer field |

### `UB_MER_ReportHouseHold`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iMER_ReportID` | int | NULL |  | Integer field |
| `iHouseHoldID` | int | NULL |  | Integer field |
| `MgmtCode` | varchar(5) | NULL |  | Management company code |
| `iMKV` | int | NULL |  | Integer field |
| `mMKV` | money | NULL |  |  |

---

## MFDA Compliance

### `UB_MFDA_Account`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iPlanID` | int | NULL |  | FK to UB_Plan table - identifies the investment plan/account |
| `AccountType` | varchar(30) | NULL |  |  |
| `Leveraged` | char(1) | NULL |  |  |
| `dtInception` | datetime | NULL |  | Date/time field |
| `iHouseHoldID` | int | NULL |  | Integer field |
| `iClientID1` | int | NULL |  | Integer field |
| `iClientID2` | int | NULL |  | Integer field |
| `DOBY1` | varchar(4) | NULL |  |  |
| `DOBY2` | varchar(4) | NULL |  |  |
| `iRepID` | int | NULL |  | FK to UB_Rep - identifies the representative/advisor |
| `DealerCode` | varchar(5) | NULL |  | Dealer code identifier |
| `RepCode` | varchar(5) | NULL |  | Representative/advisor code |
| `fRoR` | float | NULL |  | Decimal/float value |
| `mCommission` | money | NULL |  |  |
| `mMKVB` | money | NULL |  |  |
| `mMKVE` | money | NULL |  |  |
| `fRoR1Y` | float | NULL |  | Decimal/float value |
| `fRoR3Y` | float | NULL |  | Decimal/float value |
| `mDeposit1Y` | money | NULL |  |  |
| `mWithdrawal1Y` | money | NULL |  |  |
| `mDepositInception` | money | NULL |  |  |
| `mWithdrawalInception` | money | NULL |  |  |

### `UB_MFDA_AccountList`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `iIndex` | int | NOT NULL | Y | Integer field |
| `iPlanID` | int | NULL |  | FK to UB_Plan table - identifies the investment plan/account |
| `iStatus` | tinyint | NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |

### `UB_MFDA_AccountPosition`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `iMFDAAccountID` | int | NULL |  | Integer field |
| `FundID` | varchar(12) | NULL |  | Fund identifier code (e.g., DYN 3056) |
| `mMKV` | money | NULL |  |  |

### `UB_MFDA_ClientPosition`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `DealerCode` | varchar(5) | NULL |  | Dealer code identifier |
| `iStatus` | tinyint | NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `dtRequest` | datetime | NULL |  | Date/time field |
| `dtCompleted` | datetime | NULL |  | Date/time field |
| `FileName` | varchar(250) | NULL |  | File name |
| `dtDownloaded` | datetime | NULL |  | Date/time field |
| `iUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `iOptPW` | tinyint | NULL |  | Small integer/flag field |
| `fXRate` | float | NULL |  | Decimal/float value |
| `iOptions` | int | NULL |  | Integer field |

### `UB_MFDA_ClientPositionDetail`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iTaskID` | int | NOT NULL |  | Integer field |
| `iProductType` | int | NOT NULL |  | Integer field |
| `iPlanID` | int | NOT NULL |  | FK to UB_Plan table - identifies the investment plan/account |
| `AddressStreetNumber` | varchar(10) | NULL |  |  |
| `AddressStreetName` | varchar(140) | NULL |  |  |
| `AddressUnit` | varchar(10) | NULL |  |  |
| `City` | varchar(50) | NULL |  |  |
| `Province` | char(4) | NULL |  |  |
| `PostalCode` | varchar(10) | NULL |  |  |
| `dtDOB1` | datetime | NULL |  | Date/time field |
| `dtDOB2` | datetime | NULL |  | Date/time field |
| `PlanID` | varchar(20) | NULL |  |  |
| `AccountType` | varchar(20) | NULL |  |  |
| `DealerCode` | varchar(5) | NULL |  | Dealer code identifier |
| `RepCode` | varchar(6) | NULL |  | Representative/advisor code |
| `MgmtCode` | varchar(6) | NULL |  | Management company code |
| `FundID` | varchar(6) | NULL |  | Fund identifier code (e.g., DYN 3056) |
| `Currency` | char(3) | NULL |  |  |
| `mMKV` | money | NULL |  |  |

### `UB_MFDA_HouseHold`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `City` | varchar(80) | NULL |  |  |
| `Province` | char(3) | NULL |  |  |
| `Country` | char(3) | NULL |  |  |
| `FSA` | char(3) | NULL |  |  |
| `AddressStr` | varchar(200) | NULL |  |  |

### `UB_MFDA_HouseHoldClient`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `iHouseHoldID` | int | NOT NULL |  | Integer field |
| `iClientID` | int | NOT NULL |  | FK to UB_Client table - identifies the client/investor |

### `UB_MFDA_Rep`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iMemberID` | int | NULL |  | FK to UB_Member - identifies the member/advisor |
| `RepCode` | varchar(10) | NULL |  | Representative/advisor code |
| `RepName` | varchar(100) | NULL |  |  |
| `NRD` | varchar(50) | NULL |  |  |

### `UB_MFDA_ReportParameters`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `ReportRequestID` | int | NOT NULL |  |  |
| `ParameterName` | varchar(20) | NOT NULL |  |  |
| `ParameterValue` | varchar(80) | NOT NULL |  |  |

### `UB_MFDA_ReportRequests`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `DealerCode` | varchar(5) | NOT NULL |  | Dealer code identifier |
| `ReportTypeID` | int | NOT NULL |  |  |
| `Status` | int | NOT NULL |  |  |
| `RequestDate` | datetime | NOT NULL |  |  |
| `CompleteDate` | datetime | NULL |  |  |
| `FileName` | varchar(80) | NULL |  | File name |
| `FullFilePath` | varchar(500) | NULL |  |  |
| `CurrentExportPage` | int | NOT NULL |  |  |

### `UB_MFDA_Reports_ExemptAccount`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `ReportRequestID` | int | NOT NULL |  |  |
| `LastName` | varchar(80) | NULL |  | Last name |
| `FirstName` | varchar(40) | NULL |  | First name |
| `SIN_BN` | varchar(15) | NULL |  | Social Insurance Number or Business Number (Canada) |
| `Age` | int | NULL |  |  |
| `AccountType` | varchar(120) | NULL |  |  |
| `PlanID` | varchar(15) | NULL |  |  |
| `OpenDate` | varchar(50) | NULL |  |  |
| `RepCode` | varchar(15) | NULL |  | Representative/advisor code |
| `RepName` | varchar(max) | NULL |  |  |
| `Fund` | varchar(15) | NULL |  |  |
| `FundAccountID` | varchar(15) | NULL |  |  |
| `MKV` | money | NULL |  |  |
| `BookValue` | money | NULL |  |  |

### `UB_MFDA_Reports_ExemptActivity`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `ReportRequestID` | int | NOT NULL |  |  |
| `LastName` | varchar(80) | NULL |  | Last name |
| `FirstName` | varchar(40) | NULL |  | First name |
| `SIN_BN` | varchar(15) | NULL |  | Social Insurance Number or Business Number (Canada) |
| `Age` | int | NULL |  |  |
| `AccountType` | varchar(120) | NULL |  |  |
| `PlanID` | varchar(15) | NULL |  |  |
| `OpenDate` | varchar(50) | NULL |  |  |
| `RepCode` | varchar(15) | NULL |  | Representative/advisor code |
| `RepName` | varchar(max) | NULL |  |  |
| `Fund` | varchar(15) | NULL |  |  |
| `FundAccountID` | varchar(15) | NULL |  |  |
| `TrxDate` | varchar(50) | NULL |  |  |
| `TrxType` | varchar(200) | NULL |  |  |
| `GrossAmount` | money | NULL |  |  |
| `NetAmount` | money | NULL |  |  |

### `UB_MFDA_Reports_TradeBlotter`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `ReportRequestID` | int | NOT NULL |  |  |
| `LastName` | varchar(80) | NULL |  | Last name |
| `FirstName` | varchar(40) | NULL |  | First name |
| `SIN_BN` | varchar(15) | NULL |  | Social Insurance Number or Business Number (Canada) |
| `Province` | varchar(3) | NULL |  |  |
| `AccountType` | varchar(120) | NULL |  |  |
| `PlanID` | varchar(15) | NULL |  |  |
| `RepCode` | varchar(15) | NULL |  | Representative/advisor code |
| `RepName` | varchar(max) | NULL |  |  |
| `Fund` | varchar(15) | NULL |  |  |
| `FundAccountID` | varchar(15) | NULL |  |  |
| `FundName` | varchar(80) | NULL |  |  |
| `LoadType` | varchar(4) | NULL |  |  |
| `TrxDate` | varchar(50) | NULL |  |  |
| `TrxType` | varchar(200) | NULL |  |  |
| `GrossAmount` | money | NULL |  |  |
| `NetAmount` | money | NULL |  |  |
| `Commission` | money | NULL |  |  |

### `UB_MFDA_Reports_TradeBlotter2500MidHigh`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `ReportRequestID` | int | NOT NULL |  |  |
| `LastName` | varchar(80) | NULL |  | Last name |
| `FirstName` | varchar(40) | NULL |  | First name |
| `SIN_BN` | varchar(15) | NULL |  | Social Insurance Number or Business Number (Canada) |
| `Province` | varchar(3) | NULL |  |  |
| `Age` | int | NULL |  |  |
| `AnnualIncome` | varchar(100) | NULL |  |  |
| `InvestmentKnowledge` | varchar(50) | NULL |  |  |
| `Networth` | money | NULL |  |  |
| `AccountType` | varchar(120) | NULL |  |  |
| `PlanID` | varchar(15) | NULL |  |  |
| `RiskTolerance` | varchar(100) | NULL |  |  |
| `InvestmentObjective` | varchar(200) | NULL |  |  |
| `TimeHorizon` | varchar(50) | NULL |  |  |
| `RepCode` | varchar(15) | NULL |  | Representative/advisor code |
| `RepName` | varchar(max) | NULL |  |  |
| `Fund` | varchar(15) | NULL |  |  |
| `FundAccountID` | varchar(15) | NULL |  |  |
| `FundName` | varchar(80) | NULL |  |  |
| `LoadType` | varchar(4) | NULL |  |  |
| `RiskRating` | varchar(50) | NULL |  |  |
| `TradeDate` | varchar(50) | NULL |  |  |
| `TrxType` | varchar(200) | NULL |  |  |
| `GrossAmount` | money | NULL |  |  |
| `NetAmount` | money | NULL |  |  |
| `DSCCharge` | money | NULL |  |  |
| `Commission` | money | NULL |  |  |

### `UB_MFDA_Reports_TradeBlotter5000Mid`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `ReportRequestID` | int | NOT NULL |  |  |
| `LastName` | varchar(80) | NULL |  | Last name |
| `FirstName` | varchar(40) | NULL |  | First name |
| `SIN_BN` | varchar(15) | NULL |  | Social Insurance Number or Business Number (Canada) |
| `Province` | varchar(3) | NULL |  |  |
| `Age` | int | NULL |  |  |
| `AnnualIncome` | varchar(100) | NULL |  |  |
| `InvestmentKnowledge` | varchar(50) | NULL |  |  |
| `Networth` | money | NULL |  |  |
| `AccountType` | varchar(120) | NULL |  |  |
| `PlanID` | varchar(15) | NULL |  |  |
| `RiskTolerance` | varchar(100) | NULL |  |  |
| `InvestmentObjective` | varchar(200) | NULL |  |  |
| `TimeHorizon` | varchar(50) | NULL |  |  |
| `RepCode` | varchar(15) | NULL |  | Representative/advisor code |
| `RepName` | varchar(max) | NULL |  |  |
| `Fund` | varchar(15) | NULL |  |  |
| `FundAccountID` | varchar(15) | NULL |  |  |
| `FundName` | varchar(80) | NULL |  |  |
| `LoadType` | varchar(4) | NULL |  |  |
| `RiskRating` | varchar(50) | NULL |  |  |
| `TradeDate` | varchar(50) | NULL |  |  |
| `TrxType` | varchar(200) | NULL |  |  |
| `GrossAmount` | money | NULL |  |  |
| `NetAmount` | money | NULL |  |  |
| `DSCCharge` | money | NULL |  |  |
| `Commission` | money | NULL |  |  |

### `UB_MFDA_Reports_TradeBlotter50K`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `ReportRequestID` | int | NOT NULL |  |  |
| `LastName` | varchar(80) | NULL |  | Last name |
| `FirstName` | varchar(40) | NULL |  | First name |
| `SIN_BN` | varchar(15) | NULL |  | Social Insurance Number or Business Number (Canada) |
| `Province` | varchar(3) | NULL |  |  |
| `Age` | int | NULL |  |  |
| `AnnualIncome` | varchar(100) | NULL |  |  |
| `InvestmentKnowledge` | varchar(50) | NULL |  |  |
| `Networth` | money | NULL |  |  |
| `AccountType` | varchar(120) | NULL |  |  |
| `PlanID` | varchar(15) | NULL |  |  |
| `RiskTolerance` | varchar(100) | NULL |  |  |
| `InvestmentObjective` | varchar(200) | NULL |  |  |
| `TimeHorizon` | varchar(50) | NULL |  |  |
| `RepCode` | varchar(15) | NULL |  | Representative/advisor code |
| `RepName` | varchar(max) | NULL |  |  |
| `Fund` | varchar(15) | NULL |  |  |
| `FundAccountID` | varchar(15) | NULL |  |  |
| `FundName` | varchar(80) | NULL |  |  |
| `LoadType` | varchar(4) | NULL |  |  |
| `RiskRating` | varchar(50) | NULL |  |  |
| `TradeDate` | varchar(50) | NULL |  |  |
| `TrxType` | varchar(200) | NULL |  |  |
| `GrossAmount` | money | NULL |  |  |
| `NetAmount` | money | NULL |  |  |
| `DSCCharge` | money | NULL |  |  |
| `Commission` | money | NULL |  |  |

### `UB_MFDA_Reports_TradeBlotterBuyLev`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `ReportRequestID` | int | NOT NULL |  |  |
| `LastName` | varchar(80) | NOT NULL |  | Last name |
| `FirstName` | varchar(40) | NOT NULL |  | First name |
| `Age` | int | NOT NULL |  |  |
| `AccountType` | varchar(120) | NOT NULL |  |  |
| `PlanID` | varchar(15) | NOT NULL |  |  |
| `IntCode` | varchar(4) | NOT NULL |  |  |
| `IntAccountID` | varchar(15) | NOT NULL |  |  |
| `OpenDate` | varchar(50) | NOT NULL |  |  |
| `RepCode` | varchar(15) | NOT NULL |  | Representative/advisor code |
| `RepName` | varchar(max) | NOT NULL |  |  |
| `Fund` | varchar(15) | NOT NULL |  |  |
| `FundAccountID` | varchar(15) | NOT NULL |  |  |
| `FundName` | varchar(80) | NOT NULL |  |  |
| `LoadType` | varchar(4) | NOT NULL |  |  |
| `TrxDate` | varchar(50) | NOT NULL |  |  |
| `TrxType` | varchar(200) | NOT NULL |  |  |
| `GrossAmount` | money | NOT NULL |  |  |
| `NetAmount` | money | NOT NULL |  |  |
| `DealerCommission` | money | NOT NULL |  |  |

### `UB_MFDA_Reports_TradeBlotterBySeries`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `ReportRequestID` | int | NOT NULL |  |  |
| `LastName` | varchar(80) | NULL |  | Last name |
| `FirstName` | varchar(40) | NULL |  | First name |
| `SIN_BN` | varchar(15) | NULL |  | Social Insurance Number or Business Number (Canada) |
| `Province` | varchar(3) | NULL |  |  |
| `AccountType` | varchar(120) | NULL |  |  |
| `FundName` | varchar(80) | NULL |  |  |
| `PlanID` | varchar(15) | NULL |  |  |
| `RepCode` | varchar(15) | NULL |  | Representative/advisor code |
| `RepName` | varchar(max) | NULL |  |  |
| `Fund` | varchar(15) | NULL |  |  |
| `FundAccountID` | varchar(15) | NULL |  |  |
| `LoadType` | varchar(4) | NULL |  |  |
| `TrxDate` | varchar(50) | NULL |  |  |
| `TrxType` | varchar(200) | NULL |  |  |
| `GrossAmount` | money | NULL |  |  |
| `NetAmount` | money | NULL |  |  |
| `Commission` | money | NULL |  |  |

### `UB_MFDA_Reports_TradeBlotterExempt`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `ReportRequestID` | int | NOT NULL |  |  |
| `LastName` | varchar(80) | NULL |  | Last name |
| `FirstName` | varchar(40) | NULL |  | First name |
| `SIN_BN` | varchar(15) | NULL |  | Social Insurance Number or Business Number (Canada) |
| `Province` | varchar(3) | NULL |  |  |
| `Age` | int | NULL |  |  |
| `AnnualIncome` | varchar(100) | NULL |  |  |
| `InvestmentKnowledge` | varchar(50) | NULL |  |  |
| `Networth` | money | NULL |  |  |
| `AccountType` | varchar(120) | NULL |  |  |
| `PlanID` | varchar(15) | NULL |  |  |
| `RiskTolerance` | varchar(100) | NULL |  |  |
| `InvestmentObjective` | varchar(200) | NULL |  |  |
| `TimeHorizon` | varchar(50) | NULL |  |  |
| `RepCode` | varchar(15) | NULL |  | Representative/advisor code |
| `RepName` | varchar(max) | NULL |  |  |
| `Fund` | varchar(15) | NULL |  |  |
| `FundAccountID` | varchar(15) | NULL |  |  |
| `FundName` | varchar(80) | NULL |  |  |
| `LoadType` | varchar(4) | NULL |  |  |
| `RiskRating` | varchar(50) | NULL |  |  |
| `TradeDate` | varchar(50) | NULL |  |  |
| `TrxType` | varchar(200) | NULL |  |  |
| `GrossAmount` | money | NULL |  |  |
| `NetAmount` | money | NULL |  |  |
| `DSCCharge` | money | NULL |  |  |
| `Commission` | money | NULL |  |  |

### `UB_MFDA_Reports_TradeBlotterLevOPEN`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `ReportRequestID` | int | NOT NULL |  |  |
| `LastName` | varchar(80) | NULL |  | Last name |
| `FirstName` | varchar(40) | NULL |  | First name |
| `SIN_BN` | varchar(15) | NULL |  | Social Insurance Number or Business Number (Canada) |
| `Province` | varchar(3) | NULL |  |  |
| `Age` | int | NULL |  |  |
| `AnnualIncome` | varchar(100) | NULL |  |  |
| `InvestmentKnowledge` | varchar(50) | NULL |  |  |
| `Networth` | money | NULL |  |  |
| `AccountType` | varchar(120) | NULL |  |  |
| `PlanID` | varchar(15) | NULL |  |  |
| `RiskTolerance` | varchar(100) | NULL |  |  |
| `InvestmentObjective` | varchar(200) | NULL |  |  |
| `TimeHorizon` | varchar(50) | NULL |  |  |
| `RepCode` | varchar(15) | NULL |  | Representative/advisor code |
| `RepName` | varchar(max) | NULL |  |  |
| `Fund` | varchar(15) | NULL |  |  |
| `FundAccountID` | varchar(15) | NULL |  |  |
| `FundName` | varchar(80) | NULL |  |  |
| `LoadType` | varchar(4) | NULL |  |  |
| `RiskRating` | varchar(50) | NULL |  |  |
| `TradeDate` | varchar(50) | NULL |  |  |
| `TrxType` | varchar(200) | NULL |  |  |
| `GrossAmount` | money | NULL |  |  |
| `NetAmount` | money | NULL |  |  |
| `DSCCharge` | money | NULL |  |  |
| `Commission` | money | NULL |  |  |

### `UB_MFDA_Reports_TradeBlotterPOA`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `ReportRequestID` | int | NOT NULL |  |  |
| `LastName` | varchar(80) | NULL |  | Last name |
| `FirstName` | varchar(40) | NULL |  | First name |
| `SIN_BN` | varchar(15) | NULL |  | Social Insurance Number or Business Number (Canada) |
| `Province` | varchar(3) | NULL |  |  |
| `Age` | int | NULL |  |  |
| `AnnualIncome` | varchar(100) | NULL |  |  |
| `InvestmentKnowledge` | varchar(50) | NULL |  |  |
| `Networth` | money | NULL |  |  |
| `AccountType` | varchar(120) | NULL |  |  |
| `PlanID` | varchar(15) | NULL |  |  |
| `RiskTolerance` | varchar(100) | NULL |  |  |
| `InvestmentObjective` | varchar(200) | NULL |  |  |
| `TimeHorizon` | varchar(50) | NULL |  |  |
| `RepCode` | varchar(15) | NULL |  | Representative/advisor code |
| `RepName` | varchar(max) | NULL |  |  |
| `Fund` | varchar(15) | NULL |  |  |
| `FundAccountID` | varchar(15) | NULL |  |  |
| `FundName` | varchar(80) | NULL |  |  |
| `LoadType` | varchar(4) | NULL |  |  |
| `RiskRating` | varchar(50) | NULL |  |  |
| `TradeDate` | varchar(50) | NULL |  |  |
| `TrxType` | varchar(200) | NULL |  |  |
| `GrossAmount` | money | NULL |  |  |
| `NetAmount` | money | NULL |  |  |
| `DSCCharge` | money | NULL |  |  |
| `Commission` | money | NULL |  |  |

### `UB_MFDA_Reports_TradeBlotterSellWithPYMT`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `ReportRequestID` | int | NOT NULL |  |  |
| `LastName` | varchar(80) | NOT NULL |  | Last name |
| `FirstName` | varchar(40) | NOT NULL |  | First name |
| `SIN_BN` | varchar(15) | NOT NULL |  | Social Insurance Number or Business Number (Canada) |
| `Province` | varchar(3) | NOT NULL |  |  |
| `AccountType` | varchar(120) | NOT NULL |  |  |
| `PlanID` | varchar(15) | NOT NULL |  |  |
| `RepCode` | varchar(15) | NOT NULL |  | Representative/advisor code |
| `RepName` | varchar(max) | NOT NULL |  |  |
| `Fund` | varchar(13) | NOT NULL |  |  |
| `FundAccountID` | varchar(15) | NOT NULL |  |  |
| `FundName` | varchar(80) | NOT NULL |  |  |
| `LoadType` | varchar(4) | NULL |  |  |
| `TrxDate` | varchar(50) | NOT NULL |  |  |
| `WONUmber` | varchar(7) | NOT NULL |  |  |
| `TrxType` | varchar(200) | NOT NULL |  |  |
| `Electronic` | char(1) | NULL |  |  |
| `GrossAmount` | money | NOT NULL |  |  |
| `NetAmount` | money | NOT NULL |  |  |
| `DealerCommission` | money | NOT NULL |  |  |
| `SettlementMethod` | varchar(50) | NOT NULL |  |  |
| `PayeeType` | varchar(50) | NOT NULL |  |  |
| `PayeeLastName` | varchar(80) | NOT NULL |  |  |
| `PayeeFirstName` | varchar(20) | NOT NULL |  |  |
| `PayeeAddress` | varchar(120) | NOT NULL |  |  |
| `PayeeCity` | varchar(30) | NOT NULL |  |  |
| `PayeeProvince` | varchar(2) | NOT NULL |  |  |
| `PayeePostalCode` | varchar(20) | NOT NULL |  |  |
| `PayeeCountry` | varchar(3) | NOT NULL |  |  |
| `PayeeBankHolderName` | varchar(40) | NOT NULL |  |  |
| `PayeeBankType` | char(1) | NOT NULL |  |  |
| `PayeeBankCode` | varchar(3) | NOT NULL |  |  |
| `PayeeBankBranch` | varchar(5) | NOT NULL |  |  |
| `PayeeBankAccountNumber` | char(1) | NOT NULL |  |  |

### `UB_MFDA_Reports_TradeBlotterWithKYC`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `ReportRequestID` | int | NOT NULL |  |  |
| `LastName` | varchar(80) | NOT NULL |  | Last name |
| `FirstName` | varchar(40) | NOT NULL |  | First name |
| `SIN_BN` | varchar(15) | NULL |  | Social Insurance Number or Business Number (Canada) |
| `ProvinceCode` | varchar(3) | NULL |  |  |
| `Age` | int | NULL |  |  |
| `AnnualIncomeStr` | varchar(100) | NULL |  |  |
| `InvestmentKnowledgeStr` | varchar(50) | NULL |  |  |
| `mLiquidityAsset` | money | NULL |  |  |
| `mFixedAsset` | money | NULL |  |  |
| `mLiability` | money | NULL |  |  |
| `mNetworth` | money | NULL |  |  |
| `KYCOnFileDateStr` | varchar(50) | NULL |  |  |
| `LastReviewDateStr` | varchar(50) | NULL |  |  |
| `AccountTypeStr` | varchar(120) | NULL |  |  |
| `PlanID` | varchar(15) | NULL |  |  |
| `RiskToleranceStr` | varchar(100) | NULL |  |  |
| `InvestmentObjectiveStr` | varchar(200) | NULL |  |  |
| `TimeHorizonStr` | varchar(50) | NULL |  |  |
| `RepCode` | varchar(15) | NULL |  | Representative/advisor code |
| `RepNameStr` | varchar(max) | NULL |  |  |
| `FundStr` | varchar(15) | NULL |  |  |
| `FundAccountID` | varchar(15) | NULL |  |  |
| `FundNameStr` | varchar(80) | NULL |  |  |
| `LoadType` | varchar(4) | NULL |  |  |
| `RiskRatingStr` | varchar(50) | NULL |  |  |
| `FundClassStr` | varchar(200) | NULL |  |  |
| `TradeDateStr` | varchar(50) | NULL |  |  |
| `TrxTypeStr` | varchar(200) | NULL |  |  |
| `WireOrderNumber` | varchar(7) | NULL |  |  |
| `mGrossAmount` | money | NULL |  |  |
| `mNetAmount` | money | NULL |  |  |
| `mDSCCharge` | money | NULL |  |  |
| `mCommission` | money | NULL |  |  |

### `UB_MFDA_Reports_TradeBlotterWithKYC_BuySwitchIn_DSC`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `ReportRequestID` | int | NOT NULL |  |  |
| `LastName` | varchar(80) | NULL |  | Last name |
| `FirstName` | varchar(40) | NULL |  | First name |
| `SIN_BN` | varchar(15) | NULL |  | Social Insurance Number or Business Number (Canada) |
| `Province` | varchar(3) | NULL |  |  |
| `Age` | int | NULL |  |  |
| `AnnualIncome` | varchar(100) | NULL |  |  |
| `InvestmentKnowledge` | varchar(50) | NULL |  |  |
| `LiquidityAsset` | money | NULL |  |  |
| `FixedAsset` | money | NULL |  |  |
| `Liability` | money | NULL |  |  |
| `Networth` | money | NULL |  |  |
| `KYCOnFileDate` | varchar(50) | NULL |  |  |
| `LastReviewDate` | varchar(50) | NULL |  |  |
| `AccountType` | varchar(120) | NULL |  |  |
| `PlanID` | varchar(15) | NULL |  |  |
| `RiskTolerance` | varchar(100) | NULL |  |  |
| `InvestmentObjective` | varchar(200) | NULL |  |  |
| `TimeHorizon` | varchar(50) | NULL |  |  |
| `RepCode` | varchar(15) | NULL |  | Representative/advisor code |
| `RepName` | varchar(max) | NULL |  |  |
| `Fund` | varchar(15) | NULL |  |  |
| `FundAccountID` | varchar(15) | NULL |  |  |
| `FundName` | varchar(80) | NULL |  |  |
| `LoadType` | varchar(4) | NULL |  |  |
| `RiskRating` | varchar(50) | NULL |  |  |
| `FundClass` | varchar(200) | NULL |  |  |
| `TradeDate` | varchar(50) | NULL |  |  |
| `TrxType` | varchar(200) | NULL |  |  |
| `WireOrderNumber` | varchar(7) | NULL |  |  |
| `GrossAmount` | money | NULL |  |  |
| `NetAmount` | money | NULL |  |  |
| `DSCCharge` | money | NULL |  |  |
| `Commission` | money | NULL |  |  |

### `UB_MFDA_Reports_TradeBlotterWithKYCByProv`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `ReportRequestID` | int | NOT NULL |  |  |
| `LastName` | varchar(80) | NULL |  | Last name |
| `FirstName` | varchar(40) | NULL |  | First name |
| `SIN_BN` | varchar(15) | NULL |  | Social Insurance Number or Business Number (Canada) |
| `Province` | varchar(3) | NULL |  |  |
| `Age` | int | NULL |  |  |
| `AnnualIncome` | varchar(100) | NULL |  |  |
| `InvestmentKnowledge` | varchar(50) | NULL |  |  |
| `Networth` | money | NULL |  |  |
| `AccountType` | varchar(120) | NULL |  |  |
| `PlanID` | varchar(15) | NULL |  |  |
| `RiskTolerance` | varchar(100) | NULL |  |  |
| `InvestmentObjective` | varchar(200) | NULL |  |  |
| `TimeHorizon` | varchar(50) | NULL |  |  |
| `RepCode` | varchar(15) | NULL |  | Representative/advisor code |
| `RepName` | varchar(max) | NULL |  |  |
| `Fund` | varchar(15) | NULL |  |  |
| `FundAccountID` | varchar(15) | NULL |  |  |
| `FundName` | varchar(80) | NULL |  |  |
| `LoadType` | varchar(4) | NULL |  |  |
| `RiskRating` | varchar(50) | NULL |  |  |
| `TradeDate` | varchar(50) | NULL |  |  |
| `TrxType` | varchar(200) | NULL |  |  |
| `GrossAmount` | money | NULL |  |  |
| `NetAmount` | money | NULL |  |  |
| `DSCCharge` | money | NULL |  |  |
| `Commission` | money | NULL |  |  |

### `UB_MFDA_Reports_TradeBlotterWithMinAmount`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `ReportRequestID` | int | NOT NULL |  |  |
| `LastName` | varchar(80) | NULL |  | Last name |
| `FirstName` | varchar(40) | NULL |  | First name |
| `SIN_BN` | varchar(15) | NULL |  | Social Insurance Number or Business Number (Canada) |
| `Province` | varchar(3) | NULL |  |  |
| `AccountType` | varchar(120) | NULL |  |  |
| `PlanID` | varchar(15) | NULL |  |  |
| `RepCode` | varchar(15) | NULL |  | Representative/advisor code |
| `RepName` | varchar(max) | NULL |  |  |
| `Fund` | varchar(15) | NULL |  |  |
| `FundAccountID` | varchar(15) | NULL |  |  |
| `FundName` | varchar(80) | NULL |  |  |
| `LoadType` | varchar(4) | NULL |  |  |
| `TradeDate` | varchar(50) | NULL |  |  |
| `TrxType` | varchar(200) | NULL |  |  |
| `GrossAmount` | money | NULL |  |  |
| `NetAmount` | money | NULL |  |  |
| `Commission` | money | NULL |  |  |

### `UB_MFDA_ReportStatuses`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL |  | Primary key, auto-increment identifier |
| `NameEN` | varchar(50) | NOT NULL |  | English name |
| `NameFR` | varchar(50) | NOT NULL |  | French name |

### `UB_MFDA_ReportTypes`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | smallint | NOT NULL |  | Primary key, auto-increment identifier |
| `NameEN` | varchar(80) | NOT NULL |  | English name |
| `NameFR` | varchar(80) | NOT NULL |  | French name |
| `iOrder` | smallint | NOT NULL |  |  |

### `UB_MFDA_Step`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `iStep` | tinyint | NOT NULL |  | Small integer/flag field |
| `Description` | varchar(50) | NULL |  |  |
| `iStatus` | tinyint | NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `dtStart` | datetime | NULL |  | Date/time field |
| `dtEnd` | datetime | NULL |  | Date/time field |

---

## Management Company

### `UB_MGMT`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `Code` | varchar(6) | NULL |  |  |
| `NameEN` | varchar(80) | NOT NULL |  | English name |
| `NameFR` | varchar(80) | NOT NULL |  | French name |
| `bMF` | tinyint | NOT NULL |  |  |
| `bGIC` | tinyint | NOT NULL |  |  |
| `bSeg` | tinyint | NOT NULL |  |  |
| `bHedge` | tinyint | NOT NULL |  |  |
| `bPool` | tinyint | NOT NULL |  |  |
| `bLSIF` | tinyint | NOT NULL |  |  |
| `bLP` | tinyint | NOT NULL |  |  |
| `bSN` | tinyint | NOT NULL |  |  |
| `bLN` | tinyint | NOT NULL |  |  |
| `bWrap` | tinyint | NOT NULL |  |  |
| `bOther` | tinyint | NOT NULL |  |  |
| `FundType` | varchar(50) | NOT NULL |  |  |
| `iAddressID` | int | NULL |  | Integer field |
| `iPhoneID` | int | NULL |  | Integer field |
| `bApproved` | tinyint | NULL |  |  |
| `iStatus` | tinyint | NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `bFundServ` | tinyint | NULL |  |  |
| `bNSM` | tinyint | NULL |  |  |
| `bPrintConfirmation` | tinyint | NULL |  |  |
| `iEFTID` | int | NULL |  | Integer field |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `dtLastModified` | datetime | NULL |  | Timestamp when record was last modified |
| `iCreatedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `iLastModifiedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who last modified this record |
| `Notes` | varchar(250) | NULL |  |  |
| `FundFactEN` | varchar(500) | NULL |  |  |
| `FundFactFR` | varchar(500) | NULL |  |  |
| `bCannex` | tinyint | NULL |  |  |
| `bGICServ` | tinyint | NULL |  |  |
| `AgentID` | varchar(12) | NULL |  |  |
| `CompType` | char(2) | NULL |  |  |
| `NameSE` | varchar(30) | NULL |  |  |
| `NameSF` | varchar(30) | NULL |  |  |
| `bStock` | tinyint | NULL |  |  |
| `bBond` | tinyint | NULL |  |  |
| `bMortgage` | tinyint | NULL |  |  |
| `BankCodeCAD` | varchar(4) | NULL |  |  |
| `BankTransitCAD` | varchar(5) | NULL |  |  |
| `BankAccountNumberCAD` | varchar(12) | NULL |  |  |
| `BankCodeUSD` | varchar(4) | NULL |  |  |
| `BankTransitUSD` | varchar(5) | NULL |  |  |
| `BankAccountNumberUSD` | varchar(12) | NULL |  |  |
| `WebSite` | varchar(200) | NULL |  |  |
| `bNominee` | tinyint | NULL |  |  |
| `bSuppressPSFile` | tinyint | NULL |  |  |
| `bCustodianAgreementSigned` | tinyint | NULL |  |  |
| `bEPA` | tinyint | NULL |  |  |
| `mIndividual` | money | NULL |  |  |
| `mHouseHold` | money | NULL |  |  |
| `iMERFlag` | tinyint | NULL |  | Small integer/flag field |
| `iGICFlag` | tinyint | NULL |  | Small integer/flag field |
| `iGICTPlus` | tinyint | NULL |  | Small integer/flag field |
| `GICMaturityInstruction` | char(2) | NULL |  |  |
| `iDealerBankAccountID_CAD` | int | NULL |  | Integer field |
| `iDealerBankAccountID_USD` | int | NULL |  | Integer field |

### `UB_MGMTARC`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL |  | Primary key, auto-increment identifier |
| `Code` | varchar(6) | NULL |  |  |
| `NameEN` | varchar(80) | NOT NULL |  | English name |
| `NameFR` | varchar(80) | NOT NULL |  | French name |
| `bMF` | tinyint | NOT NULL |  |  |
| `bGIC` | tinyint | NOT NULL |  |  |
| `bSeg` | tinyint | NOT NULL |  |  |
| `bHedge` | tinyint | NOT NULL |  |  |
| `bPool` | tinyint | NOT NULL |  |  |
| `bLSIF` | tinyint | NOT NULL |  |  |
| `bLP` | tinyint | NOT NULL |  |  |
| `bSN` | tinyint | NOT NULL |  |  |
| `bLN` | tinyint | NOT NULL |  |  |
| `bWrap` | tinyint | NOT NULL |  |  |
| `bOther` | tinyint | NOT NULL |  |  |
| `FundType` | varchar(50) | NOT NULL |  |  |
| `iAddressID` | int | NULL |  | Integer field |
| `iPhoneID` | int | NULL |  | Integer field |
| `bApproved` | tinyint | NULL |  |  |
| `iStatus` | tinyint | NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `bFundServ` | tinyint | NULL |  |  |
| `bNSM` | tinyint | NULL |  |  |
| `bPrintConfirmation` | tinyint | NULL |  |  |
| `iEFTID` | int | NULL |  | Integer field |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `dtLastModified` | datetime | NULL |  | Timestamp when record was last modified |
| `iCreatedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `iLastModifiedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who last modified this record |
| `Notes` | varchar(250) | NULL |  |  |
| `bDeleted` | tinyint | NULL |  |  |
| `BankCodeCAD` | varchar(4) | NULL |  |  |
| `BankTransitCAD` | varchar(5) | NULL |  |  |
| `BankAccountNumberCAD` | varchar(12) | NULL |  |  |
| `BankCodeUSD` | varchar(4) | NULL |  |  |
| `BankTransitUSD` | varchar(5) | NULL |  |  |
| `BankAccountNumberUSD` | varchar(12) | NULL |  |  |
| `bEPA` | tinyint | NULL |  |  |
| `mIndividual` | money | NULL |  |  |
| `mHouseHold` | money | NULL |  |  |
| `iMERFlag` | tinyint | NULL |  | Small integer/flag field |
| `iGICFlag` | tinyint | NULL |  | Small integer/flag field |
| `iGICTPlus` | tinyint | NULL |  | Small integer/flag field |

---

## Message Queue (IBM MQ / FundServ Real-Time)

### `UB_MQ_InBox`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `MsgID` | varchar(80) | NULL |  |  |
| `MsgContent` | varchar(max) | NULL |  |  |
| `iStatus` | tinyint | NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `iType` | tinyint | NULL |  | Type/category code |
| `iSource` | tinyint | NULL |  | Small integer/flag field |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `MsgContentOrg` | varchar(max) | NULL |  |  |

### `UB_MQ_OutBox`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `MsgID` | varchar(80) | NULL |  |  |
| `MsgContent` | varchar(max) | NULL |  |  |
| `iStatus` | tinyint | NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `iType` | tinyint | NULL |  | Type/category code |
| `iSource` | tinyint | NULL |  | Small integer/flag field |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |

### `UB_MQManager`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `HostName` | varchar(100) | NULL |  |  |
| `ManagerName` | varchar(100) | NULL |  |  |
| `ChannelName` | varchar(100) | NULL |  |  |
| `ConnectionName` | varchar(100) | NULL |  |  |
| `iPortNumber` | int | NULL |  | Integer field |
| `QNameReceive` | varchar(100) | NULL |  |  |
| `QNameResponse` | varchar(100) | NULL |  |  |
| `QNameSend` | varchar(100) | NULL |  |  |
| `iStatus` | tinyint | NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `iResponseWaitingTime` | int | NULL |  | Integer field |
| `iSendExpiryTime` | int | NULL |  | Integer field |
| `SSLCipherSpec` | varchar(100) | NULL |  |  |
| `SSLKeyRepository` | varchar(250) | NULL |  |  |
| `iSSLUsed` | tinyint | NULL |  | Small integer/flag field |
| `iCharacterSet` | int | NULL |  | Integer field |
| `iAsynchronous` | tinyint | NULL |  | Small integer/flag field |
| `iTimerInterval` | int | NULL |  | Integer field |

### `UB_MQParams`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iMatchOption` | tinyint | NULL |  | Small integer/flag field |
| `SchemaPathSend` | varchar(250) | NULL |  |  |
| `SchemaPathResponse` | varchar(250) | NULL |  |  |
| `SchemaPathError` | varchar(250) | NULL |  |  |
| `iSchemaCheck` | tinyint | NULL |  | Small integer/flag field |
| `WebServerDomain` | varchar(100) | NULL |  |  |
| `WebServerUser` | varchar(100) | NULL |  |  |
| `WebServerUserPW` | varchar(100) | NULL |  |  |
| `WebServerUserPW_Enc` | varchar(200) | NULL |  |  |
| `iStatus` | tinyint | NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |

---

## NFU (Network Fund Update) via FundServ

### `UB_NFUFile`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iDays` | int | NOT NULL |  | Integer field |
| `iSequence` | smallint | NOT NULL |  | Sequence number |
| `FileName` | varchar(50) | NOT NULL |  | File name |
| `iStatus` | tinyint | NOT NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |

### `UB_NFUMSG`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iLinkedID` | int | NOT NULL |  | Integer field |
| `iLinkedType` | tinyint | NULL |  | Small integer/flag field |
| `iStatus` | tinyint | NOT NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `dtCreated` | datetime | NOT NULL |  | Timestamp when record was created |
| `iUserID` | int | NOT NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `DealerCode` | varchar(4) | NOT NULL |  | Dealer code identifier |
| `RepCode` | varchar(6) | NULL |  | Representative/advisor code |
| `SourceID` | varchar(30) | NULL |  | Source identifier |
| `MgmtCode` | varchar(4) | NULL |  | Management company code |
| `Description` | varchar(100) | NULL |  |  |
| `MSG` | varchar(max) | NOT NULL |  |  |
| `iFileID` | int | NOT NULL |  | FK to file record (FundServ file) |
| `RtnCode` | varchar(4) | NOT NULL |  |  |
| `FundServMSGID` | varchar(30) | NULL |  |  |
| `iPlanID` | int | NULL |  | FK to UB_Plan table - identifies the investment plan/account |
| `iFundAccountID` | int | NULL |  | Integer field |
| `iExtraType` | tinyint | NULL |  | Small integer/flag field |
| `DealerCodeFrom` | varchar(4) | NULL |  | Dealer code identifier |
| `RepCodeFrom` | varchar(6) | NULL |  | Representative/advisor code |

### `UB_NFUMSGError`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `iNFUID` | int | NOT NULL |  | Integer field |
| `ErrorCode` | varchar(4) | NOT NULL |  |  |
| `iFileID` | int | NOT NULL |  | FK to file record (FundServ file) |
| `ErrorField` | varchar(50) | NULL |  |  |
| `iType` | tinyint | NOT NULL |  | Type/category code |

---

## Notes/Comments

### `UB_Notes`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iType` | tinyint | NULL |  | Type/category code |
| `iSubType` | tinyint | NULL |  | Small integer/flag field |
| `iStatus` | tinyint | NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `iLinkedID` | int | NULL |  | Integer field |
| `Notes` | varchar(max) | NULL |  |  |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `iCreatedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `dtLastModified` | datetime | NULL |  | Timestamp when record was last modified |
| `iLastModifiedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who last modified this record |
| `iModifiedMethod` | tinyint | NULL |  | Small integer/flag field |
| `Description` | varchar(50) | NULL |  |  |
| `iClientID` | int | NULL |  | FK to UB_Client table - identifies the client/investor |
| `iPlanID` | int | NULL |  | FK to UB_Plan table - identifies the investment plan/account |
| `iFundAccountPosID` | int | NULL |  | Integer field |
| `iGICAccountID` | int | NULL |  | Integer field |
| `iTrxID` | int | NULL |  | Integer field |
| `iGICTrxID` | int | NULL |  | Integer field |
| `iPrivate` | tinyint | NULL |  | Small integer/flag field |
| `iYear` | smallint | NULL |  |  |
| `iOrgID` | int | NULL |  | Integer field |
| `iCashAccountID` | int | NULL |  | Integer field |
| `iCashTrxID` | int | NULL |  | Integer field |
| `iWFID` | int | NULL |  | Integer field |

### `UB_NotesRef`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `iLinkedType` | tinyint | NOT NULL |  | Small integer/flag field |
| `iLinkedID` | int | NOT NULL |  | Integer field |
| `iNoteID` | int | NOT NULL |  | Integer field |

---

## Notification System

### `UB_Notification`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iCreationType` | tinyint | NOT NULL |  | Small integer/flag field |
| `iStatus` | tinyint | NOT NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `iMessageType` | tinyint | NOT NULL |  | Small integer/flag field |
| `iNotified` | tinyint | NOT NULL |  | Small integer/flag field |
| `iPriority` | tinyint | NOT NULL |  | Small integer/flag field |
| `iCreatedUserID` | int | NOT NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `dtCreated` | datetime | NOT NULL |  | Timestamp when record was created |
| `dtEffective` | datetime | NOT NULL |  | Effective date |
| `iEmailStatus` | tinyint | NOT NULL |  | Small integer/flag field |
| `dtSend` | datetime | NULL |  | Date/time field |
| `iFromIDType` | smallint | NOT NULL |  |  |
| `iFromID` | int | NOT NULL |  | Integer field |
| `FromDescription` | varchar(100) | NULL |  |  |
| `Subject` | varchar(100) | NULL |  |  |
| `iToIDType` | smallint | NOT NULL |  |  |
| `iToID` | int | NOT NULL |  | Integer field |
| `ToDescription` | varchar(100) | NULL |  |  |
| `ToEmail` | varchar(200) | NULL |  |  |
| `EmailContent` | varchar(max) | NULL |  |  |
| `iClientID` | int | NOT NULL |  | FK to UB_Client table - identifies the client/investor |
| `iPlanID` | int | NOT NULL |  | FK to UB_Plan table - identifies the investment plan/account |
| `iFundAccountID` | int | NOT NULL |  | Integer field |
| `iFundAccountPosID` | int | NOT NULL |  | Integer field |
| `iFundTrxID` | int | NOT NULL |  | Integer field |
| `iGICAccountID` | int | NOT NULL |  | Integer field |
| `iGICTrxID` | int | NOT NULL |  | Integer field |
| `RepCode` | varchar(6) | NOT NULL |  | Representative/advisor code |
| `DealerCode` | varchar(6) | NOT NULL |  | Dealer code identifier |
| `EmailReply` | varchar(100) | NOT NULL |  |  |
| `iReportID` | int | NOT NULL |  | Integer field |
| `iDocFileID` | int | NOT NULL |  | Integer field |
| `bFromDeleted` | tinyint | NULL |  |  |
| `bToDeleted` | tinyint | NULL |  |  |
| `iFormerID` | int | NULL |  | Integer field |
| `iNoteID` | int | NULL |  | Integer field |
| `bView` | tinyint | NULL |  |  |
| `dtView` | datetime | NULL |  | Date/time field |

---

## Onboarding

### `UB_OBItem`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iStatus` | tinyint | NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `dtProcess` | datetime | NULL |  | Date/time field |
| `iFromUserType` | tinyint | NULL |  | Small integer/flag field |
| `iFromUserID` | int | NULL |  | Integer field |
| `iProcessUserID` | int | NULL |  | Integer field |
| `ItemStr` | varchar(max) | NULL |  |  |
| `LastName` | varchar(80) | NULL |  | Last name |
| `FirstName` | varchar(40) | NULL |  | First name |
| `SIN_BN` | varchar(15) | NULL |  | Social Insurance Number or Business Number (Canada) |
| `iClient` | tinyint | NULL |  | Small integer/flag field |
| `iAddress` | tinyint | NULL |  | Small integer/flag field |
| `iSpouse` | tinyint | NULL |  | Small integer/flag field |
| `iPhone` | tinyint | NULL |  | Small integer/flag field |
| `iIdentification` | tinyint | NULL |  | Small integer/flag field |
| `iEmployment` | tinyint | NULL |  | Small integer/flag field |
| `iClientKYC` | tinyint | NULL |  | Small integer/flag field |
| `iPlanCount` | int | NULL |  | Integer field |
| `DealerCode` | varchar(5) | NULL |  | Dealer code identifier |
| `RepCode` | varchar(5) | NULL |  | Representative/advisor code |
| `Notes` | varchar(max) | NULL |  |  |
| `iType` | tinyint | NULL |  | Type/category code |
| `iQuestion` | tinyint | NULL |  | Small integer/flag field |

---

## Order Processing (FundServ)

### `UB_OrderConversionBulkBasket`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iClientID` | int | NULL |  | FK to UB_Client table - identifies the client/investor |
| `iPlanID` | int | NULL |  | FK to UB_Plan table - identifies the investment plan/account |
| `iFundAccountPosID` | int | NULL |  | Integer field |
| `MgmtCode` | varchar(5) | NULL |  | Management company code |
| `FundID` | varchar(6) | NULL |  | Fund identifier code (e.g., DYN 3056) |
| `FundAccountID` | varchar(20) | NULL |  |  |
| `AmountType` | char(1) | NULL |  |  |
| `fAmount` | float | NULL |  | Decimal/float value |
| `Notes` | varchar(max) | NULL |  |  |
| `iDocID` | int | NULL |  | Integer field |
| `iUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `iStatus` | tinyint | NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |

### `UB_OrderFile`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iDays` | int | NOT NULL |  | Integer field |
| `iSequence` | smallint | NOT NULL |  | Sequence number |
| `FileName` | varchar(100) | NULL |  | File name |
| `iStatus` | tinyint | NOT NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |

### `UB_OrderMSG`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iRequestID` | int | NOT NULL |  | Integer field |
| `iOrderID` | int | NOT NULL |  | Integer field |
| `MSG` | varchar(max) | NOT NULL |  |  |
| `iStatus` | tinyint | NOT NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `dtCreated` | datetime | NOT NULL |  | Timestamp when record was created |
| `OrderID` | varchar(10) | NOT NULL |  |  |
| `RtnCode` | varchar(4) | NOT NULL |  |  |
| `iFileID` | int | NOT NULL |  | FK to file record (FundServ file) |
| `DealerCode` | varchar(4) | NOT NULL |  | Dealer code identifier |
| `SourceID` | varchar(30) | NULL |  | Source identifier |
| `MgmtCode` | varchar(4) | NULL |  | Management company code |
| `MsgID` | varchar(100) | NULL |  |  |

### `UB_OrderMSGError`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `iMSGID` | int | NOT NULL |  | Integer field |
| `ErrorCode` | varchar(4) | NOT NULL |  |  |
| `iOrderID` | int | NOT NULL |  | Integer field |
| `iFileID` | int | NOT NULL |  | FK to file record (FundServ file) |
| `iType` | tinyint | NOT NULL |  | Type/category code |

### `UB_OrderMSGResponse`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iMode` | tinyint | NOT NULL |  | Processing mode |
| `MsgID` | varchar(100) | NULL |  |  |
| `FileName` | varchar(100) | NULL |  | File name |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `MsgContent` | varchar(max) | NULL |  |  |

### `UB_OrderSent`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iOrderID` | int | NOT NULL |  | Integer field |
| `iStatus` | tinyint | NOT NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `iMSGID` | int | NOT NULL |  | Integer field |
| `dtCreated` | datetime | NOT NULL |  | Timestamp when record was created |
| `SourceID` | varchar(30) | NOT NULL |  | Source identifier |
| `MgmtCode` | varchar(4) | NOT NULL |  | Management company code |
| `DealerCode` | varchar(4) | NULL |  | Dealer code identifier |

### `UB_OrderWaiting2Omnibus`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iOrderID` | int | NOT NULL |  | Integer field |
| `iStatus` | tinyint | NOT NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `iOrderIDOmnibus` | int | NOT NULL |  | Integer field |
| `ActnCode` | char(3) | NULL |  |  |

### `UB_OrderWaiting2Send`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iOrderID` | int | NOT NULL |  | Integer field |
| `iStatus` | tinyint | NOT NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `iMSGID` | int | NOT NULL |  | Integer field |
| `iMode` | tinyint | NULL |  | Processing mode |

---

## Person/Individual Data

### `UB_Person`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iStatus` | tinyint | NOT NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `Title` | char(1) | NOT NULL |  |  |
| `Sex` | char(1) | NULL |  | Gender (M/F) |
| `FirstName` | varchar(40) | NOT NULL |  | First name |
| `LastName` | varchar(80) | NOT NULL |  | Last name |
| `SIN_BN` | varchar(15) | NOT NULL |  | Social Insurance Number or Business Number (Canada) |
| `ProvincialBN` | varchar(15) | NOT NULL |  |  |
| `dtDOB` | datetime | NULL |  | Date of birth |
| `iMaritalStatus` | tinyint | NULL |  | Small integer/flag field |
| `iRelationship` | tinyint | NULL |  | Small integer/flag field |
| `Language` | char(1) | NULL |  |  |
| `iAddressID` | int | NULL |  | Integer field |
| `iPhoneID` | int | NULL |  | Integer field |
| `Occupation` | varchar(80) | NULL |  |  |
| `Citizenship` | varchar(50) | NULL |  |  |
| `dtCreated` | datetime | NOT NULL |  | Timestamp when record was created |
| `dtLastModified` | datetime | NOT NULL |  | Timestamp when record was last modified |
| `iCreatedUserID` | int | NOT NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `iLastModifiedUserID` | int | NOT NULL |  | FK to UB_MemberLogin - internal user who last modified this record |
| `RelationshipOther` | varchar(50) | NULL |  |  |

### `UB_PersonLink`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iType` | tinyint | NOT NULL |  | Type/category code |
| `iSubType` | int | NOT NULL |  | Integer field |
| `iPersonID` | int | NOT NULL |  | Integer field |
| `iLinkedID` | int | NOT NULL |  | Integer field |

---

## Phone/Contact Data

### `UB_Phone`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `Type` | smallint | NOT NULL |  |  |
| `LinkedID` | int | NOT NULL |  |  |
| `MainPhone` | varchar(15) | NOT NULL |  | Primary phone number |
| `BusPhone` | varchar(15) | NOT NULL |  |  |
| `CellPhone` | varchar(15) | NOT NULL |  |  |
| `Fax` | varchar(15) | NOT NULL |  |  |
| `EmailAddress` | varchar(100) | NOT NULL |  |  |
| `BusExt` | varchar(10) | NULL |  |  |
| `iCreatedUserID` | int | NOT NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `dtCreated` | datetime | NOT NULL |  | Timestamp when record was created |
| `iLastModifiedUserID` | int | NOT NULL |  | FK to UB_MemberLogin - internal user who last modified this record |
| `dtLastModified` | datetime | NOT NULL |  | Timestamp when record was last modified |
| `iContactPrefMethod` | tinyint | NULL |  | Small integer/flag field |
| `iContactPrefTime` | tinyint | NULL |  | Small integer/flag field |

### `UB_PhoneARC`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL |  | Primary key, auto-increment identifier |
| `Type` | smallint | NOT NULL |  |  |
| `LinkedID` | int | NULL |  |  |
| `MainPhone` | varchar(15) | NULL |  | Primary phone number |
| `BusPhone` | varchar(15) | NULL |  |  |
| `CellPhone` | varchar(15) | NULL |  |  |
| `Fax` | varchar(15) | NULL |  |  |
| `EmailAddress` | varchar(100) | NULL |  |  |
| `BusExt` | varchar(10) | NULL |  |  |
| `iCreatedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `iLastModifiedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who last modified this record |
| `dtLastModified` | datetime | NULL |  | Timestamp when record was last modified |
| `bDeleted` | tinyint | NOT NULL |  |  |
| `iContactPrefMethod` | tinyint | NULL |  | Small integer/flag field |
| `iContactPrefTime` | tinyint | NULL |  | Small integer/flag field |

---

## Investment Plan/Account Management

### `UB_Plan`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `DSID` | int | NOT NULL |  |  |
| `iClientID` | int | NULL |  | FK to UB_Client table - identifies the client/investor |
| `DealerAccountID` | varchar(15) | NOT NULL |  |  |
| `iSpousal` | tinyint | NOT NULL |  | Small integer/flag field |
| `GroupAccountID` | varchar(15) | NULL |  |  |
| `iLockedIn` | tinyint | NOT NULL |  | Small integer/flag field |
| `LockedInProv` | varchar(3) | NOT NULL |  |  |
| `iInTrust` | tinyint | NOT NULL |  | Small integer/flag field |
| `iSD` | tinyint | NOT NULL |  | Small integer/flag field |
| `dtStartDate` | datetime | NULL |  | Date/time field |
| `dtEndDate` | datetime | NULL |  | Date/time field |
| `mMKV` | money | NULL |  |  |
| `dtMKV` | datetime | NULL |  | Date/time field |
| `iRepID` | int | NULL |  | FK to UB_Rep - identifies the representative/advisor |
| `DealerCode` | varchar(6) | NULL |  | Dealer code identifier |
| `SaleRepCode` | varchar(8) | NULL |  | Representative/advisor code |
| `ThirdPartyCode` | varchar(4) | NULL |  |  |
| `ThirdPartyAccount` | varchar(15) | NULL |  |  |
| `iBeneficiary` | tinyint | NOT NULL |  | Small integer/flag field |
| `iBankAccID` | int | NOT NULL |  | Integer field |
| `iSpouseID` | int | NOT NULL |  | Integer field |
| `iParentID` | int | NOT NULL |  | Integer field |
| `iCustody` | tinyint | NOT NULL |  | Small integer/flag field |
| `iEstate` | tinyint | NULL |  | Small integer/flag field |
| `iDOBUsed` | tinyint | NULL |  | Small integer/flag field |
| `BenSIN` | varchar(9) | NULL |  |  |
| `dtBenDOB` | datetime | NULL |  | Date/time field |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `iCreatedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `dtLastModified` | datetime | NULL |  | Timestamp when record was last modified |
| `iLastModifiedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who last modified this record |
| `iModifiedMethod` | tinyint | NULL |  | Small integer/flag field |
| `iIncompleteKYC` | tinyint | NULL |  | Small integer/flag field |
| `iIncompleteQuestion` | tinyint | NULL |  | Small integer/flag field |
| `AccountDesignation` | char(1) | NULL |  |  |
| `RecipientCode` | char(1) | NULL |  |  |
| `GroupFlag` | char(1) | NULL |  |  |
| `AccountType` | char(2) | NULL |  |  |
| `AccountStatus` | char(1) | NULL |  |  |
| `bDocReceived` | tinyint | NULL |  |  |
| `iWFID` | int | NULL |  | Integer field |
| `dtRIFDOB` | datetime | NULL |  | Date/time field |
| `iOffBook` | tinyint | NULL |  | Small integer/flag field |
| `JointType` | char(1) | NULL |  |  |
| `JointSignatureOpt` | char(1) | NULL |  |  |
| `RDSPRel` | char(2) | NULL |  |  |
| `bAnnuitantOwner` | tinyint | NULL |  |  |
| `Description` | varchar(80) | NULL |  |  |
| `iFee4Service` | tinyint | NULL |  | Small integer/flag field |
| `eDeliverFlg` | char(1) | NULL |  |  |
| `Currency` | char(2) | NULL |  |  |
| `iLastKYCExpiredNotificationID` | int | NULL |  | Integer field |
| `dtLastKYCExpiredNotification` | datetime | NULL |  | Date/time field |
| `iStopFeeSchedule` | tinyint | NULL |  | Small integer/flag field |
| `dtStopFeeSchedule` | datetime | NULL |  | Date/time field |
| `iStopFeeScheduleUserID` | int | NULL |  | Integer field |
| `iCashDividendOpt` | tinyint | NULL |  | Small integer/flag field |
| `bTaxDifferFlag` | tinyint | NULL |  |  |
| `bRESPSiblingOnly` | tinyint | NULL |  |  |
| `iLockActivityFlag` | tinyint | NULL |  | Small integer/flag field |
| `iFlag` | tinyint | NULL |  | Small integer/flag field |
| `iTrnsfFeeRebateApplied` | tinyint | NULL |  | Small integer/flag field |
| `iHISA_GICOnly` | tinyint | NULL |  | Small integer/flag field |

### `UB_Plan3rdParty`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iType` | tinyint | NOT NULL |  | Type/category code |
| `iPlanID` | int | NOT NULL |  | FK to UB_Plan table - identifies the investment plan/account |
| `iStatus` | tinyint | NOT NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `Title` | char(1) | NOT NULL |  |  |
| `Sex` | char(1) | NULL |  | Gender (M/F) |
| `FirstName` | varchar(40) | NOT NULL |  | First name |
| `LastName` | varchar(40) | NOT NULL |  | Last name |
| `IDOther` | varchar(20) | NOT NULL |  |  |
| `SIN_BN` | varchar(15) | NOT NULL |  | Social Insurance Number or Business Number (Canada) |
| `dtDOB` | datetime | NULL |  | Date of birth |
| `iRelationship` | tinyint | NULL |  | Small integer/flag field |
| `Occupation` | varchar(80) | NULL |  |  |
| `PrincipalBusiness` | varchar(80) | NULL |  |  |
| `PlaceOfIncorporation` | varchar(80) | NULL |  |  |
| `ProvincialBN` | varchar(15) | NULL |  |  |
| `Salutation` | varchar(50) | NULL |  |  |
| `ContactPosition` | varchar(50) | NULL |  |  |
| `iPhoneID` | int | NULL |  | Integer field |
| `EmployerName` | varchar(80) | NULL |  |  |
| `iEmployerAddressID` | int | NULL |  | Integer field |
| `iEmploymentYear` | tinyint | NULL |  | Small integer/flag field |
| `dtCreated` | datetime | NOT NULL |  | Timestamp when record was created |
| `dtLastModified` | datetime | NOT NULL |  | Timestamp when record was last modified |
| `iCreatedUserID` | int | NOT NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `iLastModifiedUserID` | int | NOT NULL |  | FK to UB_MemberLogin - internal user who last modified this record |
| `iModifiedMethod` | tinyint | NULL |  | Small integer/flag field |
| `iAddressID` | int | NULL |  | Integer field |
| `iWFID` | int | NULL |  | Integer field |

### `UB_PlanBen`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iClientID` | int | NULL |  | FK to UB_Client table - identifies the client/investor |
| `LinkedID` | int | NOT NULL |  |  |
| `iStatus` | tinyint | NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `iRelationship` | tinyint | NOT NULL |  | Small integer/flag field |
| `FirstName` | varchar(40) | NOT NULL |  | First name |
| `LastName` | varchar(80) | NULL |  | Last name |
| `Title` | char(1) | NOT NULL |  |  |
| `Sex` | char(1) | NOT NULL |  | Gender (M/F) |
| `dtDOB` | datetime | NULL |  | Date of birth |
| `fAllocation` | float | NULL |  | Decimal/float value |
| `iPrimary` | tinyint | NULL |  | Small integer/flag field |
| `iAddressID` | int | NULL |  | Integer field |
| `iPhoneID` | int | NULL |  | Integer field |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `dtLastModified` | datetime | NULL |  | Timestamp when record was last modified |
| `iCreatedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `iLastModifiedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who last modified this record |
| `iBenType` | tinyint | NULL |  | Small integer/flag field |
| `iCopyAddress` | tinyint | NULL |  | Small integer/flag field |
| `iRecordType` | tinyint | NULL |  | Small integer/flag field |
| `Language` | char(1) | NULL |  |  |
| `iMaritalStatus` | tinyint | NULL |  | Small integer/flag field |
| `dtDeceased` | nchar(10) | NULL |  | Date/time field |
| `ProvincialBN` | varchar(15) | NULL |  |  |
| `SIN_BN` | varchar(15) | NULL |  | Social Insurance Number or Business Number (Canada) |
| `JointAnnuitantBenOpt` | char(1) | NULL |  |  |
| `bFATCA` | tinyint | NULL |  |  |
| `bNFUFATCA` | tinyint | NULL |  |  |
| `Description` | varchar(100) | NULL |  |  |
| `iWFID` | int | NULL |  | Integer field |
| `iPrimaryCaregiverID` | int | NULL |  | Integer field |
| `bCLB` | tinyint | NULL |  |  |
| `bBCTESG` | tinyint | NULL |  |  |
| `iLastRequestIDCLB` | int | NULL |  | Integer field |
| `iLastRequestIDBCTESG` | int | NULL |  | Integer field |
| `bCESG` | tinyint | NULL |  |  |
| `fContributionAllocation` | float | NULL |  | Decimal/float value |

### `UB_PlanBenCon`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iClientID` | int | NULL |  | FK to UB_Client table - identifies the client/investor |
| `iParentID` | int | NULL |  | Integer field |
| `LinkedID` | int | NOT NULL |  |  |
| `iStatus` | tinyint | NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `iRelationship` | tinyint | NOT NULL |  | Small integer/flag field |
| `FirstName` | varchar(40) | NOT NULL |  | First name |
| `LastName` | varchar(40) | NOT NULL |  | Last name |
| `Title` | char(1) | NOT NULL |  |  |
| `Sex` | char(1) | NOT NULL |  | Gender (M/F) |
| `dtDOB` | datetime | NULL |  | Date of birth |
| `fAllocation` | float | NULL |  | Decimal/float value |
| `iAddressID` | int | NULL |  | Integer field |
| `iPhoneID` | int | NULL |  | Integer field |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `dtLastModified` | datetime | NULL |  | Timestamp when record was last modified |
| `iCreatedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `iLastModifiedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who last modified this record |
| `iBenType` | tinyint | NULL |  | Small integer/flag field |
| `iCopyAddress` | tinyint | NULL |  | Small integer/flag field |
| `Language` | char(1) | NULL |  |  |
| `iMaritalStatus` | tinyint | NULL |  | Small integer/flag field |
| `dtDeceased` | nchar(10) | NULL |  | Date/time field |
| `ProvincialBN` | varchar(15) | NULL |  |  |
| `SIN_BN` | varchar(15) | NULL |  | Social Insurance Number or Business Number (Canada) |

### `UB_PlanCreateDate`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `iPlanID` | int | NOT NULL |  | FK to UB_Plan table - identifies the investment plan/account |
| `iDays` | int | NULL |  | Integer field |
| `iTrxID` | int | NULL |  | Integer field |
| `iTradeDays` | int | NULL |  | Integer field |
| `iReportDays` | int | NULL |  | Integer field |
| `bWired` | tinyint | NULL |  |  |

### `UB_PlanExtraInfo`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `LinkedID` | int | NOT NULL |  |  |
| `iXMLClientInfo` | tinyint | NULL |  | Small integer/flag field |
| `iXMLClientAddress` | tinyint | NULL |  | Small integer/flag field |
| `iXMLAttribute` | tinyint | NULL |  | Small integer/flag field |
| `iXMLBeneficiary` | tinyint | NULL |  | Small integer/flag field |
| `iFeePMTType` | smallint | NULL |  |  |
| `FeeCode` | varchar(15) | NULL |  |  |
| `dtFeeDate` | datetime | NULL |  | Date/time field |
| `Notes` | varchar(max) | NULL |  |  |
| `iXMLNewAccount` | tinyint | NULL |  | Small integer/flag field |
| `iXMLFATCA` | tinyint | NULL |  | Small integer/flag field |
| `iCommFlag` | tinyint | NULL |  | Small integer/flag field |
| `iFeeTemplateID` | int | NULL |  | Integer field |
| `FeeFrequency` | char(1) | NULL |  |  |
| `iFeeAUAExclude` | tinyint | NULL |  | Small integer/flag field |
| `iFreeUnitForm` | tinyint | NULL |  | Small integer/flag field |
| `dtFreeUnitFormSig` | datetime | NULL |  | Date/time field |
| `dtFreeUnitFormSigExpiry` | datetime | NULL |  | Date/time field |
| `iTFSASuccessorInd` | tinyint | NULL |  | Small integer/flag field |
| `dtTFSASuccessorEffective` | datetime | NULL |  | Date/time field |
| `iTFSADeceasedClientID` | int | NULL |  | Integer field |
| `TFSADeceasedFName` | varchar(30) | NULL |  |  |
| `TFSADeceasedLName` | varchar(30) | NULL |  |  |
| `TFSADeceasedSIN` | varchar(9) | NULL |  |  |
| `dtTFSADeceasedDOD` | datetime | NULL |  | Date/time field |

### `UB_PlanFee`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iPlanID` | int | NULL |  | FK to UB_Plan table - identifies the investment plan/account |
| `iStatus` | tinyint | NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `iFeePMTType` | tinyint | NULL |  | Small integer/flag field |
| `iFeeTemplateID` | int | NULL |  | Integer field |
| `FeeFrequency` | char(1) | NULL |  |  |
| `dtLastFeeDate` | datetime | NULL |  | Date/time field |
| `iCreatedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `dtLastModified` | datetime | NULL |  | Timestamp when record was last modified |
| `iLastModifiedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who last modified this record |
| `iLastFeeHistoryID` | int | NULL |  | Integer field |
| `iFeeType` | tinyint | NULL |  | Small integer/flag field |
| `dtNextFeeDate` | datetime | NULL |  | Date/time field |
| `iFeeRate` | float | NULL |  |  |
| `iFeeRateType` | tinyint | NULL |  | Small integer/flag field |
| `iFeeDiscount` | float | NULL |  |  |
| `iBankAccountID` | int | NULL |  | Integer field |
| `iRank` | int | NULL |  | Integer field |
| `iFeeTypeDetail` | int | NULL |  | Integer field |
| `iPreferred` | tinyint | NULL |  | Small integer/flag field |
| `iDiscountCapped` | tinyint | NULL |  | Small integer/flag field |
| `mDiscountCappedAmount` | money | NULL |  |  |
| `iAdvisorFeeTier` | tinyint | NULL |  | Small integer/flag field |
| `iFeeRate1` | float | NULL |  |  |
| `iMinMKV1` | int | NULL |  | Integer field |
| `iFeeRate2` | float | NULL |  |  |
| `iMinMKV2` | int | NULL |  | Integer field |
| `iFeeRate3` | float | NULL |  |  |
| `iMinMKV3` | int | NULL |  | Integer field |
| `iFeeRate4` | float | NULL |  |  |
| `iMinMKV4` | int | NULL |  | Integer field |
| `iTrusteeFeeCode` | tinyint | NULL |  | Small integer/flag field |
| `dtStart` | datetime | NULL |  | Date/time field |
| `dtStop` | datetime | NULL |  | Date/time field |
| `CurrencyCode` | char(2) | NULL |  |  |
| `Notes` | varchar(200) | NULL |  |  |
| `FeeDiscountAmountType` | char(1) | NULL |  |  |

### `UB_PlanFeePYMTOpt`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iPlanID` | int | NOT NULL |  | FK to UB_Plan table - identifies the investment plan/account |
| `iPlanFeeID` | int | NOT NULL |  | Integer field |
| `iCashOpt` | tinyint | NULL |  | Small integer/flag field |
| `iLoadOpt` | tinyint | NULL |  | Small integer/flag field |
| `iRiskOpt` | tinyint | NULL |  | Small integer/flag field |
| `iMKVOpt` | tinyint | NULL |  | Small integer/flag field |
| `iLockedPosID` | int | NULL |  | Integer field |
| `dtLastModified` | datetime | NULL |  | Timestamp when record was last modified |
| `iLastModifiedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who last modified this record |

### `UB_PlanInTrust`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iClientID` | int | NULL |  | FK to UB_Client table - identifies the client/investor |
| `LinkedID` | int | NOT NULL |  |  |
| `iStatus` | tinyint | NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `iRelationship` | tinyint | NOT NULL |  | Small integer/flag field |
| `FirstName` | varchar(40) | NOT NULL |  | First name |
| `LastName` | varchar(80) | NULL |  | Last name |
| `Title` | char(1) | NOT NULL |  |  |
| `Sex` | char(1) | NOT NULL |  | Gender (M/F) |
| `dtDOB` | datetime | NULL |  | Date of birth |
| `SIN_BN` | varchar(9) | NOT NULL |  | Social Insurance Number or Business Number (Canada) |
| `iAddressID` | int | NULL |  | Integer field |
| `iPhoneID` | int | NULL |  | Integer field |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `dtLastModified` | datetime | NULL |  | Timestamp when record was last modified |
| `iCreatedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `iLastModifiedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who last modified this record |
| `bFATCA` | tinyint | NULL |  |  |
| `bNFUFATCA` | tinyint | NULL |  |  |

### `UB_PlanInTrustTMP`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `SessionID` | varchar(50) | NOT NULL |  |  |
| `iMode` | tinyint | NOT NULL |  | Processing mode |
| `iTrustID` | int | NOT NULL |  | Integer field |
| `iClientID` | int | NOT NULL |  | FK to UB_Client table - identifies the client/investor |
| `LinkedID` | int | NOT NULL |  |  |
| `iRelationship` | tinyint | NOT NULL |  | Small integer/flag field |
| `FirstName` | varchar(40) | NOT NULL |  | First name |
| `LastName` | varchar(40) | NOT NULL |  | Last name |
| `Title` | char(1) | NOT NULL |  |  |
| `Sex` | char(1) | NOT NULL |  | Gender (M/F) |
| `dtDOB` | datetime | NULL |  | Date of birth |
| `SIN_BN` | varchar(9) | NOT NULL |  | Social Insurance Number or Business Number (Canada) |
| `iStatus` | smallint | NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `dtLastModified` | datetime | NULL |  | Timestamp when record was last modified |
| `iCreatedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `iLastModifiedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who last modified this record |
| `Address` | varchar(120) | NULL |  |  |
| `City` | varchar(30) | NULL |  |  |
| `ProvinceCode` | varchar(2) | NULL |  |  |
| `CountryCode` | varchar(3) | NULL |  |  |
| `PostalCode` | varchar(10) | NULL |  |  |
| `MainPhone` | varchar(15) | NULL |  | Primary phone number |
| `CellPhone` | varchar(15) | NULL |  |  |
| `EmailAddress` | varchar(100) | NULL |  |  |

### `UB_PlanInvestInfo`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `LinkedID` | int | NOT NULL |  |  |
| `iPrimaryObj` | smallint | NULL |  |  |
| `fPrimaryObj1` | float | NULL |  | Decimal/float value |
| `fPrimaryObj2` | float | NULL |  | Decimal/float value |
| `fPrimaryObj3` | float | NULL |  | Decimal/float value |
| `fPrimaryObj4` | float | NULL |  | Decimal/float value |
| `fPrimaryObj5` | float | NULL |  | Decimal/float value |
| `Risk` | char(1) | NULL |  |  |
| `fRisk1` | float | NULL |  | Decimal/float value |
| `fRisk2` | float | NULL |  | Decimal/float value |
| `fRisk3` | float | NULL |  | Decimal/float value |
| `fRisk4` | float | NULL |  | Decimal/float value |
| `fRisk5` | float | NULL |  | Decimal/float value |
| `fRisk6` | float | NULL |  | Decimal/float value |
| `iSecondaryObj1` | tinyint | NULL |  | Small integer/flag field |
| `iSecondaryObj2` | tinyint | NULL |  | Small integer/flag field |
| `iSecondaryObj3` | tinyint | NULL |  | Small integer/flag field |
| `iSecondaryObj4` | tinyint | NULL |  | Small integer/flag field |
| `iSecondaryObj5` | tinyint | NULL |  | Small integer/flag field |
| `iTimeHorizon` | smallint | NULL |  |  |
| `iLeveraged` | tinyint | NULL |  | Small integer/flag field |
| `iFreezed` | tinyint | NULL |  | Small integer/flag field |
| `iLTA` | tinyint | NULL |  | Small integer/flag field |
| `dtLTA` | datetime | NULL |  | Date/time field |
| `dtLastKYCSent` | datetime | NULL |  | Date/time field |
| `dtKYCOnFile` | datetime | NULL |  | Date/time field |
| `dtLastReview` | datetime | NULL |  | Date/time field |
| `iPOA` | tinyint | NULL |  | Small integer/flag field |
| `iAccreditedInvestor` | tinyint | NULL |  | Small integer/flag field |
| `iAccreditedInvestorDoc` | tinyint | NULL |  | Small integer/flag field |
| `iKYCLocked` | tinyint | NULL |  | Small integer/flag field |
| `iInfoLocked` | tinyint | NULL |  | Small integer/flag field |
| `iStopCommission` | tinyint | NULL |  | Small integer/flag field |
| `iStopFundServ` | tinyint | NULL |  | Small integer/flag field |
| `dtNextReview` | datetime | NULL |  | Date/time field |
| `dtFrozen` | datetime | NULL |  | Date/time field |
| `iFrozenUserID` | int | NULL |  | Integer field |
| `dtUnfrozen` | datetime | NULL |  | Date/time field |
| `iUnfrozenUserID` | int | NULL |  | Integer field |
| `iSecondaryObj6` | tinyint | NULL |  | Small integer/flag field |
| `iSecondaryObj7` | tinyint | NULL |  | Small integer/flag field |
| `iSecondaryObj8` | tinyint | NULL |  | Small integer/flag field |
| `SecondaryObj8Text` | varchar(80) | NULL |  |  |
| `iRiskAttitude` | tinyint | NULL |  | Small integer/flag field |
| `iRiskCapacity` | tinyint | NULL |  | Small integer/flag field |
| `SecondaryObj5Text` | varchar(80) | NULL |  |  |
| `iSecondaryObj9` | tinyint | NULL |  | Small integer/flag field |
| `iSecondaryObj10` | tinyint | NULL |  | Small integer/flag field |
| `iSecondaryObj11` | tinyint | NULL |  | Small integer/flag field |

### `UB_PlanJointWFExtra`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `iPlanID` | int | NOT NULL |  | FK to UB_Plan table - identifies the investment plan/account |
| `Title` | char(1) | NULL |  |  |
| `FirstName` | varchar(40) | NULL |  | First name |
| `LastName` | varchar(80) | NULL |  | Last name |
| `dtDOB` | datetime | NULL |  | Date of birth |
| `SIN_BN` | varchar(15) | NULL |  | Social Insurance Number or Business Number (Canada) |
| `Sex` | char(1) | NULL |  | Gender (M/F) |

### `UB_PlanKYCUpdateDetail`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iGroupID` | int | NULL |  | Integer field |
| `iDefFieldID` | int | NULL |  | Integer field |
| `iPlanID` | int | NULL |  | FK to UB_Plan table - identifies the investment plan/account |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `iCreatedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `OldValue` | varchar(max) | NULL |  |  |
| `NewValue` | varchar(max) | NULL |  |  |
| `TypeExtra` | varchar(50) | NULL |  |  |

### `UB_PlanKYCUpdateGroup`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iPlanID` | int | NULL |  | FK to UB_Plan table - identifies the investment plan/account |
| `iStatus` | tinyint | NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `dtLastModified` | datetime | NULL |  | Timestamp when record was last modified |

### `UB_PlanKYCUpdateGroupARC`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `iGroupID` | int | NOT NULL |  | Integer field |
| `iPlanID` | int | NOT NULL |  | FK to UB_Plan table - identifies the investment plan/account |
| `iStatus` | tinyint | NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `dtLastModified` | datetime | NULL |  | Timestamp when record was last modified |
| `iApprovalStatusUpdate1` | tinyint | NULL |  | Small integer/flag field |
| `iApprovalUserIDUpdate1` | int | NULL |  | Integer field |
| `dtApprovalUpdate1` | datetime | NULL |  | Date/time field |
| `iApprovalStatusUpdate2` | tinyint | NULL |  | Small integer/flag field |
| `iApprovalUserIDUpdate2` | int | NULL |  | Integer field |
| `dtApprovalUpdate2` | datetime | NULL |  | Date/time field |
| `WFBatchCode` | int | NULL |  |  |

### `UB_PlanModelPortfolio`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `iPlanID` | int | NOT NULL |  | FK to UB_Plan table - identifies the investment plan/account |
| `iModelID` | int | NOT NULL |  | Integer field |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `iCreatedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `dtLastModified` | datetime | NULL |  | Timestamp when record was last modified |
| `iLastModifiedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who last modified this record |
| `iModelIDLast` | int | NULL |  | Integer field |
| `bBuyOnHold` | tinyint | NULL |  |  |

### `UB_PlanPMT`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iPlanID` | int | NULL |  | FK to UB_Plan table - identifies the investment plan/account |
| `iFiscalYear` | int | NULL |  | Integer field |
| `iStatus` | tinyint | NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `mGAmount` | money | NULL |  |  |
| `mTaxFed` | money | NULL |  |  |
| `mTaxProv` | money | NULL |  |  |
| `mNAmount` | money | NULL |  |  |
| `iType` | tinyint | NULL |  | Type/category code |
| `iLinkedID` | int | NULL |  | Integer field |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `dtEffective` | datetime | NULL |  | Effective date |
| `iCreatedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |

### `UB_PlanQuestionair`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `LinkedID` | int | NOT NULL |  |  |
| `QuestionID` | int | NOT NULL |  |  |
| `iAnswer` | tinyint | NOT NULL |  | Small integer/flag field |
| `Answer` | varchar(100) | NULL |  |  |

### `UB_PlanQuestionairTMP`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `LinkedID` | int | NOT NULL |  |  |
| `SessionID` | varchar(50) | NOT NULL |  |  |
| `iClientID` | int | NOT NULL |  | FK to UB_Client table - identifies the client/investor |
| `QuestionID` | int | NOT NULL |  |  |
| `iAnswer` | tinyint | NULL |  | Small integer/flag field |
| `Answer` | varchar(100) | NULL |  |  |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `iCreatedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |

### `UB_PlanRedemption`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iPlanID` | int | NULL |  | FK to UB_Plan table - identifies the investment plan/account |
| `iStatus` | tinyint | NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `mAmount` | money | NULL |  | Monetary amount |
| `iDestType` | tinyint | NULL |  | Small integer/flag field |
| `MgmtCode` | varchar(4) | NULL |  | Management company code |
| `FundID` | varchar(5) | NULL |  | Fund identifier code (e.g., DYN 3056) |
| `FundAccountID` | varchar(15) | NULL |  |  |
| `BankCode` | varchar(5) | NULL |  |  |
| `TransitNumber` | varchar(10) | NULL |  |  |
| `BankAccountNumber` | varchar(20) | NULL |  |  |
| `dtProcessing` | datetime | NULL |  | Date/time field |
| `mProcessAmount` | money | NULL |  |  |
| `iUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `iFundPosID` | int | NULL |  | Integer field |
| `iTrustBankID` | int | NULL |  | Integer field |

### `UB_PlanRedemptionDef`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iPlanID` | int | NULL |  | FK to UB_Plan table - identifies the investment plan/account |
| `mAmount` | money | NULL |  | Monetary amount |
| `iDestType` | tinyint | NULL |  | Small integer/flag field |
| `iFundPosID` | int | NULL |  | Integer field |
| `iTrustBankID` | int | NULL |  | Integer field |
| `iFrequency` | tinyint | NULL |  | Small integer/flag field |
| `dtLastProcess` | datetime | NULL |  | Date/time field |
| `iLastProcessUserID` | int | NULL |  | Integer field |

### `UB_PlanRedemptionDetail`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iPlanRedemptionHistoryID` | int | NULL |  | Integer field |
| `iPlanID` | int | NULL |  | FK to UB_Plan table - identifies the investment plan/account |
| `iFundAccountPosID` | int | NULL |  | Integer field |
| `mAmount` | money | NULL |  | Monetary amount |
| `iMethod` | tinyint | NULL |  | Small integer/flag field |
| `iOrderID` | int | NULL |  | Integer field |

### `UB_PlanReviewDate`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `iPlanID` | int | NOT NULL |  | FK to UB_Plan table - identifies the investment plan/account |
| `iDays` | int | NULL |  | Integer field |

### `UB_PlanRoRDetail`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iRunID` | int | NULL |  | Integer field |
| `iStatus` | tinyint | NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `iPlanID` | int | NULL |  | FK to UB_Plan table - identifies the investment plan/account |
| `fRoR` | float | NULL |  | Decimal/float value |
| `mMKV` | money | NULL |  |  |

### `UB_PlanRoRRun`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `DealerCode` | varchar(5) | NULL |  | Dealer code identifier |
| `RunDescription` | varchar(80) | NULL |  |  |
| `dtStart` | datetime | NULL |  | Date/time field |
| `dtEnd` | datetime | NULL |  | Date/time field |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `iCreatedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `iStatus` | tinyint | NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |

### `UB_PlanSearchList`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `UserID` | int | NOT NULL |  |  |
| `PlanID` | int | NOT NULL |  |  |

### `UB_PlanTFSASucsr`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iPlanID` | int | NOT NULL |  | FK to UB_Plan table - identifies the investment plan/account |
| `FileID` | varchar(20) | NOT NULL |  |  |
| `SIN_BN` | varchar(15) | NOT NULL |  | Social Insurance Number or Business Number (Canada) |
| `iStatus` | tinyint | NOT NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `FirstName` | varchar(40) | NOT NULL |  | First name |
| `LastName` | varchar(40) | NOT NULL |  | Last name |
| `Title` | char(1) | NOT NULL |  |  |
| `Sex` | char(1) | NULL |  | Gender (M/F) |
| `Language` | char(1) | NOT NULL |  |  |
| `dtDOB` | datetime | NULL |  | Date of birth |
| `Salutation` | varchar(50) | NULL |  |  |
| `dtCreated` | datetime | NOT NULL |  | Timestamp when record was created |
| `dtLastModified` | datetime | NOT NULL |  | Timestamp when record was last modified |
| `iCreatedUserID` | int | NOT NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `iLastModifiedUserID` | int | NOT NULL |  | FK to UB_MemberLogin - internal user who last modified this record |
| `iModifiedMethod` | tinyint | NULL |  | Small integer/flag field |
| `iAddressID` | int | NULL |  | Integer field |
| `iPhoneID` | int | NULL |  | Integer field |
| `iMainClientID` | int | NOT NULL |  | Integer field |

### `UB_PlanUserDef`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `LinkedID` | int | NOT NULL |  |  |
| `iFieldID` | int | NOT NULL |  | Integer field |
| `FieldContent` | varchar(200) | NULL |  |  |

### `UB_PlanUserDefTMP`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `LinkedID` | int | NOT NULL |  |  |
| `SessionID` | varchar(50) | NOT NULL |  |  |
| `iClientID` | int | NOT NULL |  | FK to UB_Client table - identifies the client/investor |
| `iFieldID` | int | NOT NULL |  | Integer field |
| `FieldContent` | varchar(200) | NULL |  |  |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `iCreatedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |

---

## Fund Price Data

### `UB_Price1900`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL |  | Primary key, auto-increment identifier |
| `iFundID` | int | NOT NULL |  | Integer field |
| `iType` | tinyint | NOT NULL |  | Type/category code |
| `iStatus` | tinyint | NOT NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `dtEffective` | datetime | NOT NULL |  | Effective date |
| `fPrice` | float | NOT NULL |  | Unit price of fund |
| `Currency` | varchar(2) | NOT NULL |  |  |
| `dtPayment` | datetime | NULL |  | Date/time field |

### `UB_Price2000`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL |  | Primary key, auto-increment identifier |
| `iFundID` | int | NOT NULL |  | Integer field |
| `iType` | tinyint | NOT NULL |  | Type/category code |
| `iStatus` | tinyint | NOT NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `dtEffective` | datetime | NOT NULL |  | Effective date |
| `fPrice` | float | NOT NULL |  | Unit price of fund |
| `Currency` | varchar(2) | NOT NULL |  |  |
| `dtPayment` | datetime | NULL |  | Date/time field |

### `UB_Price2001`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL |  | Primary key, auto-increment identifier |
| `iFundID` | int | NOT NULL |  | Integer field |
| `iType` | tinyint | NOT NULL |  | Type/category code |
| `iStatus` | tinyint | NOT NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `dtEffective` | datetime | NOT NULL |  | Effective date |
| `fPrice` | float | NOT NULL |  | Unit price of fund |
| `Currency` | varchar(2) | NOT NULL |  |  |
| `dtPayment` | datetime | NULL |  | Date/time field |

### `UB_Price2002`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL |  | Primary key, auto-increment identifier |
| `iFundID` | int | NOT NULL |  | Integer field |
| `iType` | tinyint | NOT NULL |  | Type/category code |
| `iStatus` | tinyint | NOT NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `dtEffective` | datetime | NOT NULL |  | Effective date |
| `fPrice` | float | NOT NULL |  | Unit price of fund |
| `Currency` | varchar(2) | NOT NULL |  |  |
| `dtPayment` | datetime | NULL |  | Date/time field |

### `UB_Price2003`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL |  | Primary key, auto-increment identifier |
| `iFundID` | int | NOT NULL |  | Integer field |
| `iType` | tinyint | NOT NULL |  | Type/category code |
| `iStatus` | tinyint | NOT NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `dtEffective` | datetime | NOT NULL |  | Effective date |
| `fPrice` | float | NOT NULL |  | Unit price of fund |
| `Currency` | varchar(2) | NOT NULL |  |  |
| `dtPayment` | datetime | NULL |  | Date/time field |

### `UB_Price2004`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL |  | Primary key, auto-increment identifier |
| `iFundID` | int | NOT NULL |  | Integer field |
| `iType` | tinyint | NOT NULL |  | Type/category code |
| `iStatus` | tinyint | NOT NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `dtEffective` | datetime | NOT NULL |  | Effective date |
| `fPrice` | float | NOT NULL |  | Unit price of fund |
| `Currency` | varchar(2) | NOT NULL |  |  |
| `dtPayment` | datetime | NULL |  | Date/time field |

### `UB_Price2005`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL |  | Primary key, auto-increment identifier |
| `iFundID` | int | NOT NULL |  | Integer field |
| `iType` | tinyint | NOT NULL |  | Type/category code |
| `iStatus` | tinyint | NOT NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `dtEffective` | datetime | NOT NULL |  | Effective date |
| `fPrice` | float | NOT NULL |  | Unit price of fund |
| `Currency` | varchar(2) | NOT NULL |  |  |
| `dtPayment` | datetime | NULL |  | Date/time field |

### `UB_Price2006`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL |  | Primary key, auto-increment identifier |
| `iFundID` | int | NOT NULL |  | Integer field |
| `iType` | tinyint | NOT NULL |  | Type/category code |
| `iStatus` | tinyint | NOT NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `dtEffective` | datetime | NOT NULL |  | Effective date |
| `fPrice` | float | NOT NULL |  | Unit price of fund |
| `Currency` | varchar(2) | NOT NULL |  |  |
| `dtPayment` | datetime | NULL |  | Date/time field |

### `UB_Price2007`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL |  | Primary key, auto-increment identifier |
| `iFundID` | int | NOT NULL |  | Integer field |
| `iType` | tinyint | NOT NULL |  | Type/category code |
| `iStatus` | tinyint | NOT NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `dtEffective` | datetime | NOT NULL |  | Effective date |
| `fPrice` | float | NOT NULL |  | Unit price of fund |
| `Currency` | varchar(2) | NOT NULL |  |  |
| `dtPayment` | datetime | NULL |  | Date/time field |

### `UB_Price2008`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL |  | Primary key, auto-increment identifier |
| `iFundID` | int | NOT NULL |  | Integer field |
| `iType` | tinyint | NOT NULL |  | Type/category code |
| `iStatus` | tinyint | NOT NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `dtEffective` | datetime | NOT NULL |  | Effective date |
| `fPrice` | float | NOT NULL |  | Unit price of fund |
| `Currency` | varchar(2) | NOT NULL |  |  |
| `dtPayment` | datetime | NULL |  | Date/time field |

### `UB_Price2009`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL |  | Primary key, auto-increment identifier |
| `iFundID` | int | NOT NULL |  | Integer field |
| `iType` | tinyint | NOT NULL |  | Type/category code |
| `iStatus` | tinyint | NOT NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `dtEffective` | datetime | NOT NULL |  | Effective date |
| `fPrice` | float | NOT NULL |  | Unit price of fund |
| `Currency` | varchar(2) | NOT NULL |  |  |
| `dtPayment` | datetime | NULL |  | Date/time field |

### `UB_Price2010`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL |  | Primary key, auto-increment identifier |
| `iFundID` | int | NOT NULL |  | Integer field |
| `iType` | tinyint | NOT NULL |  | Type/category code |
| `iStatus` | tinyint | NOT NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `dtEffective` | datetime | NOT NULL |  | Effective date |
| `fPrice` | float | NOT NULL |  | Unit price of fund |
| `Currency` | varchar(2) | NOT NULL |  |  |
| `dtPayment` | datetime | NULL |  | Date/time field |

### `UB_Price2011`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL |  | Primary key, auto-increment identifier |
| `iFundID` | int | NOT NULL |  | Integer field |
| `iType` | tinyint | NOT NULL |  | Type/category code |
| `iStatus` | tinyint | NOT NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `dtEffective` | datetime | NOT NULL |  | Effective date |
| `fPrice` | float | NOT NULL |  | Unit price of fund |
| `Currency` | varchar(2) | NOT NULL |  |  |
| `dtPayment` | datetime | NULL |  | Date/time field |

### `UB_Price2012`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL |  | Primary key, auto-increment identifier |
| `iFundID` | int | NOT NULL |  | Integer field |
| `iType` | tinyint | NOT NULL |  | Type/category code |
| `iStatus` | tinyint | NOT NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `dtEffective` | datetime | NOT NULL |  | Effective date |
| `fPrice` | float | NOT NULL |  | Unit price of fund |
| `Currency` | varchar(2) | NOT NULL |  |  |
| `dtPayment` | datetime | NULL |  | Date/time field |

### `UB_Price2013`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL |  | Primary key, auto-increment identifier |
| `iFundID` | int | NOT NULL |  | Integer field |
| `iType` | tinyint | NOT NULL |  | Type/category code |
| `iStatus` | tinyint | NOT NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `dtEffective` | datetime | NOT NULL |  | Effective date |
| `fPrice` | float | NOT NULL |  | Unit price of fund |
| `Currency` | varchar(2) | NOT NULL |  |  |
| `dtPayment` | datetime | NULL |  | Date/time field |

### `UB_Price2014`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL |  | Primary key, auto-increment identifier |
| `iFundID` | int | NOT NULL |  | Integer field |
| `iType` | tinyint | NOT NULL |  | Type/category code |
| `iStatus` | tinyint | NOT NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `dtEffective` | datetime | NOT NULL |  | Effective date |
| `fPrice` | float | NOT NULL |  | Unit price of fund |
| `Currency` | varchar(2) | NOT NULL |  |  |
| `dtPayment` | datetime | NULL |  | Date/time field |

### `UB_Price2015`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL |  | Primary key, auto-increment identifier |
| `iFundID` | int | NOT NULL |  | Integer field |
| `iType` | tinyint | NOT NULL |  | Type/category code |
| `iStatus` | tinyint | NOT NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `dtEffective` | datetime | NOT NULL |  | Effective date |
| `fPrice` | float | NOT NULL |  | Unit price of fund |
| `Currency` | varchar(2) | NOT NULL |  |  |
| `dtPayment` | datetime | NULL |  | Date/time field |

### `UB_Price2016`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL |  | Primary key, auto-increment identifier |
| `iFundID` | int | NOT NULL |  | Integer field |
| `iType` | tinyint | NOT NULL |  | Type/category code |
| `iStatus` | tinyint | NOT NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `dtEffective` | datetime | NOT NULL |  | Effective date |
| `fPrice` | float | NOT NULL |  | Unit price of fund |
| `Currency` | varchar(2) | NOT NULL |  |  |
| `dtPayment` | datetime | NULL |  | Date/time field |

### `UB_Price2017`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL |  | Primary key, auto-increment identifier |
| `iFundID` | int | NOT NULL |  | Integer field |
| `iType` | tinyint | NOT NULL |  | Type/category code |
| `iStatus` | tinyint | NOT NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `dtEffective` | datetime | NOT NULL |  | Effective date |
| `fPrice` | float | NOT NULL |  | Unit price of fund |
| `Currency` | varchar(2) | NOT NULL |  |  |
| `dtPayment` | datetime | NULL |  | Date/time field |

### `UB_Price2018`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL |  | Primary key, auto-increment identifier |
| `iFundID` | int | NOT NULL |  | Integer field |
| `iType` | tinyint | NOT NULL |  | Type/category code |
| `iStatus` | tinyint | NOT NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `dtEffective` | datetime | NOT NULL |  | Effective date |
| `fPrice` | float | NOT NULL |  | Unit price of fund |
| `Currency` | varchar(2) | NOT NULL |  |  |
| `dtPayment` | datetime | NULL |  | Date/time field |

### `UB_Price2019`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL |  | Primary key, auto-increment identifier |
| `iFundID` | int | NOT NULL |  | Integer field |
| `iType` | tinyint | NOT NULL |  | Type/category code |
| `iStatus` | tinyint | NOT NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `dtEffective` | datetime | NOT NULL |  | Effective date |
| `fPrice` | float | NOT NULL |  | Unit price of fund |
| `Currency` | varchar(2) | NOT NULL |  |  |
| `dtPayment` | datetime | NULL |  | Date/time field |

### `UB_Price2020`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL |  | Primary key, auto-increment identifier |
| `iFundID` | int | NOT NULL |  | Integer field |
| `iType` | tinyint | NOT NULL |  | Type/category code |
| `iStatus` | tinyint | NOT NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `dtEffective` | datetime | NOT NULL |  | Effective date |
| `fPrice` | float | NOT NULL |  | Unit price of fund |
| `Currency` | varchar(2) | NOT NULL |  |  |
| `dtPayment` | datetime | NULL |  | Date/time field |

### `UB_Price2021`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL |  | Primary key, auto-increment identifier |
| `iFundID` | int | NOT NULL |  | Integer field |
| `iType` | tinyint | NOT NULL |  | Type/category code |
| `iStatus` | tinyint | NOT NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `dtEffective` | datetime | NOT NULL |  | Effective date |
| `fPrice` | float | NOT NULL |  | Unit price of fund |
| `Currency` | varchar(2) | NOT NULL |  |  |
| `dtPayment` | datetime | NULL |  | Date/time field |

### `UB_Price2022`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL |  | Primary key, auto-increment identifier |
| `iFundID` | int | NOT NULL |  | Integer field |
| `iType` | tinyint | NOT NULL |  | Type/category code |
| `iStatus` | tinyint | NOT NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `dtEffective` | datetime | NOT NULL |  | Effective date |
| `fPrice` | float | NOT NULL |  | Unit price of fund |
| `Currency` | varchar(2) | NOT NULL |  |  |
| `dtPayment` | datetime | NULL |  | Date/time field |

### `UB_Price2023`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL |  | Primary key, auto-increment identifier |
| `iFundID` | int | NOT NULL |  | Integer field |
| `iType` | tinyint | NOT NULL |  | Type/category code |
| `iStatus` | tinyint | NOT NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `dtEffective` | datetime | NOT NULL |  | Effective date |
| `fPrice` | float | NOT NULL |  | Unit price of fund |
| `Currency` | varchar(2) | NOT NULL |  |  |
| `dtPayment` | datetime | NULL |  | Date/time field |

### `UB_Price2024`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL |  | Primary key, auto-increment identifier |
| `iFundID` | int | NOT NULL |  | Integer field |
| `iType` | tinyint | NOT NULL |  | Type/category code |
| `iStatus` | tinyint | NOT NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `dtEffective` | datetime | NOT NULL |  | Effective date |
| `fPrice` | float | NOT NULL |  | Unit price of fund |
| `Currency` | varchar(2) | NOT NULL |  |  |
| `dtPayment` | datetime | NULL |  | Date/time field |

### `UB_Price2025`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL |  | Primary key, auto-increment identifier |
| `iFundID` | int | NOT NULL |  | Integer field |
| `iType` | tinyint | NOT NULL |  | Type/category code |
| `iStatus` | tinyint | NOT NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `dtEffective` | datetime | NOT NULL |  | Effective date |
| `fPrice` | float | NOT NULL |  | Unit price of fund |
| `Currency` | varchar(2) | NOT NULL |  |  |
| `dtPayment` | datetime | NULL |  | Date/time field |

### `UB_Price2026`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL |  | Primary key, auto-increment identifier |
| `iFundID` | int | NOT NULL |  | Integer field |
| `iType` | tinyint | NOT NULL |  | Type/category code |
| `iStatus` | tinyint | NOT NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `dtEffective` | datetime | NOT NULL |  | Effective date |
| `fPrice` | float | NOT NULL |  | Unit price of fund |
| `Currency` | varchar(2) | NOT NULL |  |  |
| `dtPayment` | datetime | NULL |  | Date/time field |

### `UB_Price2027`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL |  | Primary key, auto-increment identifier |
| `iFundID` | int | NOT NULL |  | Integer field |
| `iType` | tinyint | NOT NULL |  | Type/category code |
| `iStatus` | tinyint | NOT NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `dtEffective` | datetime | NOT NULL |  | Effective date |
| `fPrice` | float | NOT NULL |  | Unit price of fund |
| `Currency` | varchar(2) | NOT NULL |  |  |
| `dtPayment` | datetime | NULL |  | Date/time field |

### `UB_Price2028`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL |  | Primary key, auto-increment identifier |
| `iFundID` | int | NOT NULL |  | Integer field |
| `iType` | tinyint | NOT NULL |  | Type/category code |
| `iStatus` | tinyint | NOT NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `dtEffective` | datetime | NOT NULL |  | Effective date |
| `fPrice` | float | NOT NULL |  | Unit price of fund |
| `Currency` | varchar(2) | NOT NULL |  |  |
| `dtPayment` | datetime | NULL |  | Date/time field |

### `UB_Price2029`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL |  | Primary key, auto-increment identifier |
| `iFundID` | int | NOT NULL |  | Integer field |
| `iType` | tinyint | NOT NULL |  | Type/category code |
| `iStatus` | tinyint | NOT NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `dtEffective` | datetime | NOT NULL |  | Effective date |
| `fPrice` | float | NOT NULL |  | Unit price of fund |
| `Currency` | varchar(2) | NOT NULL |  |  |
| `dtPayment` | datetime | NULL |  | Date/time field |

### `UB_Price2030`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL |  | Primary key, auto-increment identifier |
| `iFundID` | int | NOT NULL |  | Integer field |
| `iType` | tinyint | NOT NULL |  | Type/category code |
| `iStatus` | tinyint | NOT NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `dtEffective` | datetime | NOT NULL |  | Effective date |
| `fPrice` | float | NOT NULL |  | Unit price of fund |
| `Currency` | varchar(2) | NOT NULL |  |  |
| `dtPayment` | datetime | NULL |  | Date/time field |

### `UB_PriceAll`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iFundID` | int | NOT NULL |  | Integer field |
| `iType` | tinyint | NOT NULL |  | Type/category code |
| `iStatus` | tinyint | NOT NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `dtEffective` | datetime | NOT NULL |  | Effective date |
| `fPrice` | float | NOT NULL |  | Unit price of fund |
| `Currency` | varchar(2) | NOT NULL |  |  |
| `dtPayment` | datetime | NULL |  | Date/time field |
| `iFileID` | int | NULL |  | FK to file record (FundServ file) |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |

### `UB_PriceAllIndex`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iPriceID` | int | NULL |  | Integer field |
| `iStatus` | tinyint | NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |

---

## Province/Region Lookup

### `UB_Province`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `Code` | varchar(3) | NOT NULL |  |  |
| `NameEN` | varchar(80) | NULL |  | English name |
| `NameFR` | varchar(80) | NULL |  | French name |
| `iOrder` | smallint | NULL |  |  |
| `TaxCode` | varchar(3) | NULL |  |  |
| `CountryCode` | varchar(3) | NULL |  |  |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `dtLastModified` | datetime | NULL |  | Timestamp when record was last modified |
| `iCreatedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `iLastModifiedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who last modified this record |
| `iLicense` | tinyint | NULL |  | Small integer/flag field |
| `fPST` | float | NULL |  | Decimal/float value |
| `fGST` | float | NULL |  | Decimal/float value |
| `fHST` | float | NULL |  | Decimal/float value |

---

## Redemption Schedule Processing

### `UB_RedemptionScheduleProcessD`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iProcessedID` | int | NULL |  | Integer field |
| `iPlanID` | int | NULL |  | FK to UB_Plan table - identifies the investment plan/account |
| `iFundAccountPosID` | int | NULL |  | Integer field |
| `mAmount` | money | NULL |  | Monetary amount |
| `iMethod` | tinyint | NULL |  | Small integer/flag field |
| `iOrderID` | int | NULL |  | Integer field |
| `iStatus` | tinyint | NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |

### `UB_RedemptionScheduleProcessH`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iRRIFSettingFundID` | int | NOT NULL |  | Integer field |
| `iPlanID` | int | NULL |  | FK to UB_Plan table - identifies the investment plan/account |
| `iFundPosID` | int | NULL |  | Integer field |
| `iStatus` | tinyint | NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `mAmount` | money | NULL |  | Monetary amount |
| `dtProcessing` | datetime | NULL |  | Date/time field |
| `iUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |

---

## Representative/Advisor

### `UB_Rep`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iDSID` | int | NOT NULL |  | Integer field |
| `iMemberID` | int | NOT NULL |  | FK to UB_Member - identifies the member/advisor |
| `iDealerCode` | int | NOT NULL |  | Dealer code identifier |
| `iBranchID` | int | NULL |  | Integer field |
| `iStatus` | smallint | NOT NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `DealerCode` | varchar(5) | NOT NULL |  | Dealer code identifier |
| `RepCode` | varchar(8) | NOT NULL |  | Representative/advisor code |
| `iCreatedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `iLastModifiedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who last modified this record |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `dtLastModified` | datetime | NULL |  | Timestamp when record was last modified |
| `mRevenue` | money | NOT NULL |  |  |
| `dtEffective` | datetime | NOT NULL |  | Effective date |
| `iWFID` | int | NOT NULL |  | Integer field |
| `iNFUAdvisorInfo` | tinyint | NULL |  | Small integer/flag field |
| `iNFUDeactivate` | tinyint | NULL |  | Small integer/flag field |
| `iCount` | int | NULL |  | Integer field |
| `iFlag` | int | NULL |  | Integer field |

### `UB_RepConversion`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `RepID` | int | NOT NULL |  |  |
| `DealerCode` | varchar(6) | NOT NULL |  | Dealer code identifier |
| `RepCode` | varchar(8) | NOT NULL |  | Representative/advisor code |
| `iUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |

### `UB_RepConversion_ARC`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `RepID` | int | NOT NULL |  |  |
| `DealerCode` | varchar(6) | NOT NULL |  | Dealer code identifier |
| `RepCode` | varchar(8) | NOT NULL |  | Representative/advisor code |
| `iUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |

### `UB_ReportAccount`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iReportID` | int | NULL |  | Integer field |
| `iReportPlanID` | int | NULL |  | Integer field |
| `iClientID` | int | NULL |  | FK to UB_Client table - identifies the client/investor |
| `iPlanID` | int | NULL |  | FK to UB_Plan table - identifies the investment plan/account |
| `iAccountID` | int | NULL |  | Integer field |
| `iType` | tinyint | NULL |  | Type/category code |
| `fUnitStart` | float | NULL |  | Decimal/float value |
| `fPriceStart` | float | NULL |  | Decimal/float value |
| `fUnitEnd` | float | NULL |  | Decimal/float value |
| `fPriceEnd` | float | NULL |  | Decimal/float value |
| `mBuy` | money | NULL |  |  |
| `mSell` | money | NULL |  |  |
| `FundCode` | varchar(10) | NULL |  |  |
| `FundAccountID` | varchar(20) | NULL |  |  |
| `FundNameEN` | varchar(100) | NULL |  |  |
| `FundNameFR` | varchar(100) | NULL |  |  |
| `iPriceFlag` | tinyint | NULL |  | Small integer/flag field |
| `LoadType` | varchar(4) | NULL |  |  |
| `GICProdType` | varchar(3) | NULL |  |  |
| `fPercent` | float | NULL |  | Decimal/float value |
| `Risk` | char(1) | NULL |  |  |
| `AssetClass` | varchar(2) | NULL |  |  |
| `mNetBuyOnStart` | money | NULL |  |  |
| `fXRate` | float | NULL |  | Decimal/float value |
| `Currency` | char(2) | NULL |  |  |

### `UB_ReportClient`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iReportID` | int | NULL |  | Integer field |
| `iClientID` | int | NULL |  | FK to UB_Client table - identifies the client/investor |
| `ClientNameEN` | varchar(100) | NULL |  |  |
| `ClientNameFR` | varchar(100) | NULL |  |  |
| `ClientAddress` | varchar(200) | NULL |  |  |
| `ClientCityProv` | varchar(100) | NULL |  |  |

### `UB_ReportDef`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL |  | Primary key, auto-increment identifier |
| `NameEN` | varchar(100) | NULL |  | English name |
| `NameFR` | varchar(100) | NULL |  | French name |
| `iFrequency` | smallint | NULL |  |  |
| `iReview` | smallint | NULL |  |  |
| `iMethod` | smallint | NULL |  |  |

### `UB_ReportDefColumn`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `ReportSectionID` | varchar(50) | NOT NULL |  |  |
| `ColumnID` | varchar(100) | NOT NULL |  |  |
| `HeaderLabelEN` | varchar(50) | NOT NULL |  |  |
| `HeaderLabelFR` | varchar(50) | NOT NULL |  |  |
| `iContentType` | tinyint | NOT NULL |  | Small integer/flag field |
| `iHAlign` | tinyint | NOT NULL |  | Small integer/flag field |
| `fWidth` | float | NOT NULL |  | Decimal/float value |
| `iColSpan` | smallint | NOT NULL |  |  |
| `iOrder` | smallint | NOT NULL |  |  |
| `iHide` | tinyint | NOT NULL |  | Small integer/flag field |
| `iTotal` | tinyint | NOT NULL |  | Small integer/flag field |
| `iSplitNewLine` | tinyint | NOT NULL |  | Small integer/flag field |
| `ColumnID2` | varchar(50) | NOT NULL |  |  |

### `UB_ReportDefDisclaimer`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `ReportSectionID` | varchar(50) | NOT NULL |  |  |
| `ContentEN` | varchar(max) | NOT NULL |  |  |
| `ContentFR` | varchar(max) | NOT NULL |  |  |
| `iFontSize` | tinyint | NOT NULL |  | Small integer/flag field |
| `iTextColor` | int | NOT NULL |  | Integer field |
| `iTextStyle` | int | NOT NULL |  | Integer field |
| `fBorderTop` | float | NOT NULL |  | Decimal/float value |
| `iBorderTopColor` | int | NOT NULL |  | Integer field |
| `fBorderBottom` | float | NOT NULL |  | Decimal/float value |
| `iBorderBottomColor` | int | NOT NULL |  | Integer field |
| `iBkColor` | int | NOT NULL |  | Integer field |
| `iExcludeTimeStamp` | tinyint | NULL |  | Small integer/flag field |
| `iExcludeXRate` | tinyint | NULL |  | Small integer/flag field |

### `UB_ReportDefPieChart`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `PieChartID` | varchar(50) | NOT NULL |  |  |
| `DataSource` | varchar(50) | NOT NULL |  |  |
| `ColumnIDX` | varchar(100) | NOT NULL |  |  |
| `ColumnIDY` | varchar(50) | NOT NULL |  |  |
| `iWidth` | int | NOT NULL |  | Integer field |
| `iHeight` | int | NOT NULL |  | Integer field |
| `bLegend` | tinyint | NOT NULL |  |  |
| `iLegendNumCol` | tinyint | NOT NULL |  | Small integer/flag field |
| `LegendHeader1EN` | varchar(50) | NOT NULL |  |  |
| `LegendHeader1FR` | varchar(50) | NOT NULL |  |  |
| `LegendHeader2EN` | varchar(50) | NOT NULL |  |  |
| `LegendHeader2FR` | varchar(50) | NOT NULL |  |  |
| `LegendHeader3EN` | varchar(50) | NOT NULL |  |  |
| `LegendHeader3FR` | varchar(50) | NOT NULL |  |  |
| `iLegendBkColor` | int | NOT NULL |  | Integer field |
| `iLegendLineColor` | int | NOT NULL |  | Integer field |
| `bLabel` | tinyint | NOT NULL |  |  |
| `bLabelOutSide` | tinyint | NOT NULL |  |  |
| `fBorderWidth` | float | NOT NULL |  | Decimal/float value |
| `iBorderColor` | int | NOT NULL |  | Integer field |

### `UB_ReportDefSection`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ReportSectionID` | varchar(50) | NOT NULL |  |  |
| `iHeaderFontSize` | tinyint | NOT NULL |  | Small integer/flag field |
| `iHeaderStyle` | int | NOT NULL |  | Integer field |
| `iHeaderBkColor` | int | NOT NULL |  | Integer field |
| `iHeaderTextColor` | int | NOT NULL |  | Integer field |
| `fHeaderBorderTop` | float | NOT NULL |  | Decimal/float value |
| `iHeaderBorderTopColor` | int | NOT NULL |  | Integer field |
| `fHeaderBorderBottom` | float | NOT NULL |  | Decimal/float value |
| `iHeaderBorderBottomColor` | int | NOT NULL |  | Integer field |
| `iContentFontSize` | tinyint | NOT NULL |  | Small integer/flag field |
| `iBKContentColor1` | int | NOT NULL |  | Integer field |
| `iBKContentColor2` | int | NOT NULL |  | Integer field |
| `TitleEN` | varchar(80) | NOT NULL |  |  |
| `TitleFR` | varchar(80) | NOT NULL |  |  |
| `iTitleFontSize` | tinyint | NOT NULL |  | Small integer/flag field |
| `iTitleStyle` | int | NOT NULL |  | Integer field |
| `iShowTotal` | tinyint | NOT NULL |  | Small integer/flag field |
| `iContentFontStyle` | int | NOT NULL |  | Integer field |
| `TotalStrEN` | varchar(100) | NOT NULL |  |  |
| `TotalStrFR` | varchar(100) | NOT NULL |  |  |
| `iTotalStrAlign` | tinyint | NOT NULL |  | Small integer/flag field |
| `fBorder` | float | NOT NULL |  | Decimal/float value |

### `UB_ReportErrorReason`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iReportObjID` | int | NULL |  | Integer field |
| `iReportType` | int | NULL |  | Integer field |
| `iClientID` | int | NULL |  | FK to UB_Client table - identifies the client/investor |
| `iReason` | int | NULL |  | Integer field |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `iCreatedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `ExtraDescription` | varchar(80) | NULL |  |  |

### `UB_ReportImg`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `KeyStr` | varchar(30) | NULL |  |  |
| `FileName` | varchar(255) | NULL |  | File name |
| `FileData` | varbinary(max) | NULL |  |  |
| `iFileSize` | int | NULL |  | Integer field |
| `FileType` | varchar(80) | NULL |  |  |
| `iOffsetX` | int | NULL |  | Integer field |
| `iOffsetY` | int | NULL |  | Integer field |
| `iWidth` | int | NULL |  | Integer field |
| `iHeight` | int | NULL |  | Integer field |

### `UB_ReportInsertObj`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `Description` | varchar(100) | NULL |  |  |
| `FileName` | varchar(250) | NULL |  | File name |
| `FileData` | varbinary(max) | NULL |  |  |
| `iStatus` | tinyint | NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `iCreatedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `iFileSize` | int | NULL |  | Integer field |
| `FileType` | varchar(80) | NULL |  |  |

### `UB_ReportMaster`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `iType` | int | NULL |  | Type/category code |
| `dtStart` | datetime | NULL |  | Date/time field |
| `dtEnd` | datetime | NULL |  | Date/time field |

### `UB_ReportOption`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iRequestID` | int | NOT NULL |  | Integer field |
| `KeyID` | varchar(50) | NOT NULL |  |  |
| `KeyValue` | varchar(max) | NOT NULL |  |  |
| `iTaskID` | int | NULL |  | Integer field |

### `UB_ReportPlan`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iReportID` | int | NULL |  | Integer field |
| `iClientID` | int | NULL |  | FK to UB_Client table - identifies the client/investor |
| `iPlanID` | int | NULL |  | FK to UB_Plan table - identifies the investment plan/account |
| `mMKVStart` | money | NULL |  |  |
| `mMKVEnd` | money | NULL |  |  |
| `mBuy` | money | NULL |  |  |
| `mSell` | money | NULL |  |  |
| `PlanType` | varchar(2) | NULL |  |  |
| `PlanNameEN` | varchar(100) | NULL |  |  |
| `PlanNameFR` | varchar(100) | NULL |  |  |
| `DealerAccountID` | varchar(20) | NULL |  |  |
| `Owner` | varchar(200) | NULL |  |  |
| `Intermediary` | varchar(100) | NULL |  |  |
| `fPercent` | float | NULL |  | Decimal/float value |
| `mNetBuyOnStart` | money | NULL |  |  |

### `UB_ReportPlanRoR`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iTaskID` | int | NULL |  | Integer field |
| `iPlanID` | int | NULL |  | FK to UB_Plan table - identifies the investment plan/account |
| `fRoR` | float | NULL |  | Decimal/float value |

### `UB_ReportRequest`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iTaskID` | int | NOT NULL |  | Integer field |
| `iReportType` | smallint | NOT NULL |  |  |
| `iStatus` | tinyint | NOT NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `dtRequest` | datetime | NOT NULL |  | Date/time field |
| `dtEffective` | datetime | NOT NULL |  | Effective date |
| `dtComplete` | datetime | NULL |  | Date/time field |
| `iPriority` | tinyint | NOT NULL |  | Small integer/flag field |
| `iUserID` | int | NOT NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `iFrequency` | tinyint | NOT NULL |  | Small integer/flag field |
| `dtCreated` | datetime | NOT NULL |  | Timestamp when record was created |
| `dtEffectiveFrom` | datetime | NULL |  | Date/time field |
| `Description` | varchar(100) | NULL |  |  |
| `iSaveObj` | tinyint | NULL |  | Small integer/flag field |
| `dtTrxFrom` | datetime | NULL |  | Date/time field |

### `UB_ReportRequestARC`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL |  | Primary key, auto-increment identifier |
| `iTaskID` | int | NOT NULL |  | Integer field |
| `iReportType` | smallint | NOT NULL |  |  |
| `iStatus` | tinyint | NOT NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `dtRequest` | datetime | NOT NULL |  | Date/time field |
| `dtEffective` | datetime | NOT NULL |  | Effective date |
| `dtComplete` | datetime | NULL |  | Date/time field |
| `iPriority` | tinyint | NOT NULL |  | Small integer/flag field |
| `iUserID` | int | NOT NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `iFrequency` | tinyint | NOT NULL |  | Small integer/flag field |
| `dtCreated` | datetime | NOT NULL |  | Timestamp when record was created |
| `dtEffectiveFrom` | datetime | NULL |  | Date/time field |
| `Description` | varchar(50) | NULL |  |  |
| `dtTrxFrom` | datetime | NULL |  | Date/time field |

### `UB_ReportTask`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iReportType` | int | NOT NULL |  | Integer field |
| `Description` | varchar(100) | NOT NULL |  |  |
| `iStatus` | tinyint | NOT NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `dtFirstRun` | datetime | NULL |  | Date/time field |
| `dtNextRun` | datetime | NULL |  | Date/time field |
| `iFrequency` | tinyint | NOT NULL |  | Small integer/flag field |
| `iPriority` | tinyint | NOT NULL |  | Small integer/flag field |
| `dtEffective` | datetime | NULL |  | Effective date |
| `dtEffectiveFrom` | datetime | NULL |  | Date/time field |
| `iCreatedUserID` | int | NOT NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `dtCreated` | datetime | NOT NULL |  | Timestamp when record was created |
| `iLastModifiedUserID` | int | NOT NULL |  | FK to UB_MemberLogin - internal user who last modified this record |
| `dtLastModified` | datetime | NOT NULL |  | Timestamp when record was last modified |
| `iLastRun` | int | NOT NULL |  | Integer field |
| `dtComplete` | datetime | NULL |  | Date/time field |
| `StatementLabel` | varchar(100) | NULL |  |  |
| `StatementLabelFR` | varchar(100) | NULL |  |  |
| `dtTrxFrom` | datetime | NULL |  | Date/time field |
| `iFlag` | int | NULL |  | Integer field |

### `UB_ReportTaskRep`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iReportTaskID` | int | NULL |  | Integer field |
| `iRepID` | int | NULL |  | FK to UB_Rep - identifies the representative/advisor |

### `UB_ReportText`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `ReportType` | varchar(30) | NULL |  |  |
| `KeyStr` | varchar(30) | NULL |  |  |
| `TextENStr` | varchar(max) | NULL |  |  |
| `TextFRStr` | varchar(max) | NULL |  |  |
| `iOrder` | int | NULL |  | Integer field |
| `iFlag` | int | NULL |  | Integer field |
| `iFontSize` | int | NULL |  | Integer field |
| `iFontStyle` | int | NULL |  | Integer field |
| `iIndent` | int | NULL |  | Integer field |
| `iTextColor` | int | NULL |  | Integer field |
| `iBkColor` | int | NULL |  | Integer field |
| `iHAlign` | int | NULL |  | Integer field |
| `iVAlign` | int | NULL |  | Integer field |
| `IndentText` | varchar(50) | NULL |  |  |
| `iMinHeight` | int | NULL |  | Integer field |
| `iBorder` | int | NULL |  | Integer field |
| `iBorderColor` | int | NULL |  | Integer field |
| `fBorderSize` | float | NULL |  | Decimal/float value |
| `iNewLineBefore` | tinyint | NULL |  | Small integer/flag field |
| `iNewLineAfter` | tinyint | NULL |  | Small integer/flag field |

### `UB_ReportTrx`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iReportID` | int | NULL |  | Integer field |
| `iClientID` | int | NULL |  | FK to UB_Client table - identifies the client/investor |
| `iPlanID` | int | NULL |  | FK to UB_Plan table - identifies the investment plan/account |
| `iAccountID` | int | NULL |  | Integer field |
| `iAccountType` | tinyint | NULL |  | Small integer/flag field |
| `iReportAccountID` | int | NULL |  | Integer field |
| `iTrxID` | nchar(10) | NULL |  |  |
| `iTrxType` | smallint | NULL |  |  |
| `dtTrade` | datetime | NULL |  | Trade date |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `dtProcessing` | datetime | NULL |  | Date/time field |
| `mGross` | money | NULL |  |  |
| `mNet` | money | NULL |  |  |
| `mPrice` | money | NULL |  |  |
| `fUnit` | float | NULL |  | Number of units |
| `fUnitTotal` | float | NULL |  | Decimal/float value |

### `UB_RepWorkGroup`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `WorkGroupCode` | varchar(15) | NULL |  |  |
| `DealerCode` | varchar(5) | NULL |  | Dealer code identifier |
| `RepCode` | varchar(5) | NULL |  | Representative/advisor code |
| `iStatus` | tinyint | NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |

### `UB_RepWorkGroupDef`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `WorkGroupCode` | varchar(15) | NULL |  |  |
| `NameEN` | varchar(80) | NULL |  | English name |
| `NameFR` | varchar(80) | NULL |  | French name |

---

## RESP (Registered Education Savings Plan)

### `UB_RESP_002`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `DealerBN` | varchar(15) | NULL |  |  |
| `dtStartDate` | datetime | NULL |  | Date/time field |
| `dtEndDate` | datetime | NULL |  | Date/time field |
| `mSummaryAmount` | money | NULL |  |  |
| `mPaymentAmount` | money | NULL |  |  |
| `PaymentID` | varchar(10) | NULL |  |  |
| `iFileID` | int | NULL |  | FK to file record (FundServ file) |
| `iLineNumber` | int | NULL |  | Integer field |
| `iStatus` | tinyint | NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |

### `UB_RESP_100`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iRequestID` | int | NULL |  | Integer field |
| `iPlanID` | int | NULL |  | FK to UB_Plan table - identifies the investment plan/account |
| `SourceID` | varchar(15) | NULL |  | Source identifier |
| `iStatus` | tinyint | NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |

### `UB_RESP_200`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iRequestID` | int | NULL |  | Integer field |
| `TrxType` | char(2) | NULL |  |  |
| `iTrxID` | int | NULL |  | Integer field |
| `SourceID` | varchar(15) | NULL |  | Source identifier |
| `iStatus` | tinyint | NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `iPlanID` | int | NULL |  | FK to UB_Plan table - identifies the investment plan/account |

### `UB_RESP_400`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iRequestID` | int | NULL |  | Integer field |
| `iRESPTrxID` | int | NULL |  | Integer field |
| `DepSourceID` | varchar(15) | NULL |  |  |
| `SourceID` | varchar(15) | NULL |  | Source identifier |
| `iStatus` | tinyint | NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `iTrxType` | int | NULL |  | Integer field |

### `UB_RESP_410`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iRequestID` | int | NULL |  | Integer field |
| `iRESPTrxID` | int | NULL |  | Integer field |
| `DepSourceID` | varchar(15) | NULL |  |  |
| `SourceID` | varchar(15) | NULL |  | Source identifier |
| `iStatus` | tinyint | NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `iTrxType` | int | NULL |  | Integer field |

### `UB_RESP_411`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iRequestID` | int | NULL |  | Integer field |
| `iRESPTrxID` | int | NULL |  | Integer field |
| `DepSourceID` | varchar(15) | NULL |  |  |
| `SourceID` | varchar(15) | NULL |  | Source identifier |
| `iStatus` | tinyint | NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `iTrxType` | int | NULL |  | Integer field |

### `UB_RESP_800`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `dtTrxDate` | datetime | NULL |  | Date/time field |
| `SourceID` | varchar(15) | NULL |  | Source identifier |
| `DealerBN` | varchar(15) | NULL |  |  |
| `FieldName` | varchar(30) | NULL |  | Field name reference |
| `iErrorCode` | int | NULL |  | Integer field |
| `RecordTypeFrom` | char(3) | NULL |  |  |
| `iRecordIDFrom` | int | NULL |  | Integer field |
| `iClientID` | int | NULL |  | FK to UB_Client table - identifies the client/investor |
| `iPlanID` | int | NULL |  | FK to UB_Plan table - identifies the investment plan/account |
| `iPlanBenID` | int | NULL |  | Integer field |
| `iTrustTrxID` | int | NULL |  | Integer field |
| `iRESPTrxID` | int | NULL |  | Integer field |
| `iStatus` | tinyint | NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `iFileID` | int | NULL |  | FK to file record (FundServ file) |
| `iLineNumber` | int | NULL |  | Integer field |
| `bSIN` | char(1) | NULL |  |  |
| `bFirstName` | char(1) | NULL |  |  |
| `bLastName` | char(1) | NULL |  |  |
| `bDOB` | char(1) | NULL |  |  |
| `bSex` | char(1) | NULL |  |  |
| `dtEffective` | datetime | NULL |  | Effective date |

### `UB_RESP_900`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iStatus` | tinyint | NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `mGrantAmount` | money | NULL |  |  |
| `DealerBN` | varchar(15) | NULL |  |  |
| `SourceID` | varchar(15) | NULL |  | Source identifier |
| `RejectReason` | char(1) | NULL |  |  |
| `TrxOrigin` | char(1) | NULL |  |  |
| `OriginalPromoterBN` | varchar(15) | NULL |  |  |
| `PYMTRequisitioned` | char(1) | NULL |  |  |
| `SpecimenPlanID` | varchar(10) | NULL |  |  |
| `ContractID` | varchar(15) | NULL |  |  |
| `dtCESPTrxDate` | datetime | NULL |  | Date/time field |
| `SINNumber` | varchar(9) | NULL |  |  |
| `mCLBAmount` | money | NULL |  |  |
| `mCESGAmount` | money | NULL |  |  |
| `mCLBFee` | money | NULL |  |  |
| `mAssistedContrAmount` | money | NULL |  |  |
| `CESGRejectReason2` | char(1) | NULL |  |  |
| `iClientID` | int | NULL |  | FK to UB_Client table - identifies the client/investor |
| `iPlanID` | int | NULL |  | FK to UB_Plan table - identifies the investment plan/account |
| `iPlanBenID` | int | NULL |  | Integer field |
| `iTrustTrxID` | int | NULL |  | Integer field |
| `iRESPTrxID` | int | NULL |  | Integer field |
| `iFileID` | int | NULL |  | FK to file record (FundServ file) |
| `iLineNumber` | int | NULL |  | Integer field |
| `RecordTypeFrom` | char(3) | NULL |  |  |
| `iRecordIDFrom` | int | NULL |  | Integer field |
| `dtEffective` | datetime | NULL |  | Effective date |
| `iRecordType` | int | NULL |  | Integer field |
| `mBCTESGAmount` | money | NULL |  |  |
| `mSAGESAmount` | money | NULL |  |  |

### `UB_RESP_950`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iStatus` | tinyint | NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `DealerBN` | varchar(15) | NULL |  |  |
| `SpecimenPlanID` | varchar(10) | NULL |  |  |
| `ContractID` | varchar(15) | NULL |  |  |
| `dtEffective` | datetime | NULL |  | Effective date |
| `dtProcessing` | datetime | NULL |  | Date/time field |
| `RegistrationStatus` | char(1) | NULL |  |  |
| `RejectReason` | char(1) | NULL |  |  |
| `iClientID` | int | NULL |  | FK to UB_Client table - identifies the client/investor |
| `iPlanID` | int | NULL |  | FK to UB_Plan table - identifies the investment plan/account |
| `iFileID` | int | NULL |  | FK to file record (FundServ file) |
| `iLineNumber` | int | NULL |  | Integer field |
| `iBatchFileID` | int | NULL |  | Integer field |

### `UB_RESP_Rec001`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iFileID` | int | NULL |  | FK to file record (FundServ file) |
| `RecordType` | char(3) | NULL |  |  |
| `SenderBN` | varchar(15) | NULL |  |  |
| `DateSent` | datetime | NULL |  |  |
| `FileNumber` | char(2) | NULL |  |  |
| `DataVersion` | char(3) | NULL |  |  |

### `UB_RESPBatchFileContent`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iTaskID` | int | NULL |  | Integer field |
| `FileContent` | varchar(max) | NULL |  |  |

### `UB_RESPBatchFileStats`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iTaskID` | int | NULL |  | Integer field |
| `iRecordType` | int | NULL |  | Integer field |
| `iTrxType` | int | NULL |  | Integer field |
| `iRecordCount` | int | NULL |  | Integer field |

### `UB_RESPTrx`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iTrustTrxID` | int | NULL |  | Integer field |
| `iPlanBenID` | int | NULL |  | Integer field |
| `FirstName` | varchar(40) | NULL |  | First name |
| `LastName` | varchar(40) | NULL |  | Last name |
| `SIN` | varchar(15) | NULL |  |  |
| `dtDOB` | datetime | NULL |  | Date of birth |
| `mAmount` | money | NULL |  | Monetary amount |
| `bSAGES` | tinyint | NULL |  |  |
| `bBCTESG` | tinyint | NULL |  |  |
| `bCLB` | tinyint | NULL |  |  |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `iCreatedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `iFlag` | tinyint | NULL |  | Small integer/flag field |
| `mEAPGrantAmount` | money | NULL |  |  |
| `mCLBGrantAmount` | money | NULL |  |  |
| `mBCTESGGrantAmount` | money | NULL |  |  |
| `mGrantAmount` | money | NULL |  |  |
| `mAdditionalGrantAmount` | money | NULL |  |  |
| `mEAPAmount` | money | NULL |  |  |
| `mPSEAmount` | money | NULL |  |  |
| `mCLBEAPAmount` | money | NULL |  |  |
| `mBCTESGEAPAmount` | money | NULL |  |  |
| `mCLBFee` | money | NULL |  |  |
| `mLifeTimeContribution` | money | NULL |  |  |
| `mAssistedContribution` | money | NULL |  |  |
| `mUnassistedContribution` | money | NULL |  |  |
| `iFileID` | int | NULL |  | FK to file record (FundServ file) |
| `iFileStatus` | tinyint | NULL |  | Small integer/flag field |
| `OtherSpecimenID` | varchar(15) | NULL |  |  |
| `OtherContractID` | varchar(15) | NULL |  |  |
| `RepaymentReasonCode` | char(2) | NULL |  |  |
| `SchoolName` | varchar(100) | NULL |  |  |
| `dtSchoolStartDate` | datetime | NULL |  | Date/time field |
| `SchoolPostalCode` | varchar(10) | NULL |  |  |
| `iSchoolWeek` | int | NULL |  | Integer field |
| `ProgramTypeCode` | char(2) | NULL |  |  |
| `ProgramLengthCode` | char(1) | NULL |  |  |
| `iProgramYear` | tinyint | NULL |  | Small integer/flag field |
| `iReversalFlag` | tinyint | NULL |  | Small integer/flag field |
| `iRESPTrxIDOrg` | int | NULL |  | Integer field |
| `iClientID` | int | NULL |  | FK to UB_Client table - identifies the client/investor |
| `iPlanID` | int | NULL |  | FK to UB_Plan table - identifies the investment plan/account |
| `iRESPRecordType` | int | NULL |  | Integer field |
| `iRESPTrxType` | int | NULL |  | Integer field |
| `SourceID` | varchar(15) | NULL |  | Source identifier |
| `iRESPStatus` | tinyint | NULL |  | Small integer/flag field |
| `iBatchFileID` | int | NULL |  | Integer field |
| `iResponseFileID` | int | NULL |  | Integer field |
| `iLastErrorCode` | int | NULL |  | Integer field |
| `bCESG` | tinyint | NULL |  |  |
| `bTransferCompleted` | tinyint | NULL |  |  |
| `dtOrgOpening` | datetime | NULL |  | Date/time field |
| `RejectReason` | char(1) | NULL |  |  |
| `RejectReason2` | char(1) | NULL |  |  |
| `iErrorCode` | int | NULL |  | Integer field |
| `bGrant` | tinyint | NULL |  |  |
| `bResendFlag` | tinyint | NULL |  |  |

---

## RRIF (Registered Retirement Income Fund)

### `UB_RRIFPlanHistory`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iRRIFID` | int | NULL |  | Integer field |
| `iTrustTrxID` | int | NULL |  | Integer field |
| `iEFTID` | int | NULL |  | Integer field |
| `iCashTrxID` | int | NULL |  | Integer field |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `iCreatedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `iChequeID` | int | NULL |  | Integer field |

### `UB_RRIFPlanWaiting`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `iRRIFID` | int | NOT NULL |  | Integer field |
| `iTrustTrxID` | int | NULL |  | Integer field |
| `iEFTID` | int | NULL |  | Integer field |
| `iCashTrxID` | int | NULL |  | Integer field |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `iCreatedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |

### `UB_RRIFRun`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `IntCode` | varchar(5) | NULL |  |  |
| `dtEffective` | datetime | NULL |  | Effective date |
| `iEffectiveDate` | int | NULL |  | Integer field |
| `iCreatedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `iLastModifiedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who last modified this record |
| `dtLastModified` | datetime | NULL |  | Timestamp when record was last modified |
| `mAmount` | money | NULL |  | Monetary amount |
| `iStatus` | tinyint | NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `iTrxCount` | int | NULL |  | Integer field |

### `UB_RRIFRunDetail`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iRRIFSettingID` | int | NULL |  | Integer field |
| `iRRIFRunID` | int | NULL |  | Integer field |
| `iTrxID` | int | NULL |  | Integer field |
| `iGICID` | int | NULL |  | Integer field |
| `iCashAccountID` | int | NULL |  | Integer field |
| `iStatus` | tinyint | NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `dtProcessing` | datetime | NULL |  | Date/time field |

### `UB_RRIFSetting`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iClientID` | int | NULL |  | FK to UB_Client table - identifies the client/investor |
| `MgmtCode` | varchar(5) | NULL |  | Management company code |
| `dtStart` | datetime | NULL |  | Date/time field |
| `Frequency` | char(1) | NULL |  |  |
| `iMinimumAmount` | tinyint | NULL |  | Small integer/flag field |
| `mAmount` | money | NULL |  | Monetary amount |
| `fAnnualIncrease` | float | NULL |  | Decimal/float value |
| `iSpouseDOB` | tinyint | NULL |  | Small integer/flag field |
| `dtSpouseDOB` | datetime | NULL |  | Date/time field |
| `SettlementInd` | char(1) | NULL |  |  |
| `iPMTInfo` | tinyint | NULL |  | Small integer/flag field |
| `Notes` | varchar(max) | NULL |  |  |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `iCreatedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `dtLastModified` | datetime | NULL |  | Timestamp when record was last modified |
| `iLastModifiedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who last modified this record |
| `iPlanID` | int | NULL |  | FK to UB_Plan table - identifies the investment plan/account |
| `iYearlyReview` | tinyint | NULL |  | Small integer/flag field |
| `iFedQualified` | tinyint | NULL |  | Small integer/flag field |
| `mMin` | money | NULL |  |  |
| `mMax` | money | NULL |  |  |
| `mYOB` | money | NULL |  |  |
| `iComboPYMT` | tinyint | NULL |  | Small integer/flag field |
| `fTaxRateFed` | float | NULL |  | Decimal/float value |
| `fTaxRateProv` | float | NULL |  | Decimal/float value |
| `mMinPerPMT` | money | NULL |  |  |
| `TaxCode` | varchar(3) | NULL |  |  |
| `mTaxFed` | money | NULL |  |  |
| `mTaxProv` | money | NULL |  |  |
| `iTransferLinkID` | int | NULL |  | Integer field |
| `iDealerTrustBankID` | int | NULL |  | Integer field |
| `dtNextRun` | datetime | NULL |  | Date/time field |
| `dtLastRun` | datetime | NULL |  | Date/time field |
| `iProcessingStatus` | tinyint | NULL |  | Small integer/flag field |
| `bWHTRequest` | tinyint | NULL |  |  |
| `fWHTRequestFed` | float | NULL |  | Decimal/float value |
| `fWHTRequestProv` | float | NULL |  | Decimal/float value |
| `dtStop` | datetime | NULL |  | Date/time field |
| `iTransferInYear` | int | NULL |  | Integer field |
| `iTMPIncome` | tinyint | NULL |  | Small integer/flag field |
| `iTMPIncomeYear` | int | NULL |  | Integer field |
| `mTMPIncomeAmount` | money | NULL |  |  |
| `iFutureAmountType` | tinyint | NULL |  | Small integer/flag field |
| `iFutureYear` | int | NULL |  | Integer field |
| `iTransferDepositType` | int | NULL |  | Integer field |
| `mTransferInMin` | money | NULL |  |  |
| `mTransferInMax` | money | NULL |  |  |
| `bCoronaFlag` | tinyint | NULL |  |  |
| `iRestrictionFlag` | tinyint | NULL |  | Small integer/flag field |
| `dtLastReview` | datetime | NULL |  | Date/time field |
| `iLastReviewUserID` | int | NULL |  | Integer field |
| `iWarning` | tinyint | NULL |  | Small integer/flag field |
| `mNAmount` | money | NULL |  |  |
| `dt2ndDate` | datetime | NULL |  | Date/time field |
| `RIFRedirectFundAcctID` | varchar(15) | NULL |  |  |

### `UB_RRIFSetting_2024`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL |  | Primary key, auto-increment identifier |
| `iClientID` | int | NULL |  | FK to UB_Client table - identifies the client/investor |
| `MgmtCode` | varchar(5) | NULL |  | Management company code |
| `dtStart` | datetime | NULL |  | Date/time field |
| `Frequency` | char(1) | NULL |  |  |
| `iMinimumAmount` | tinyint | NULL |  | Small integer/flag field |
| `mAmount` | money | NULL |  | Monetary amount |
| `fAnnualIncrease` | float | NULL |  | Decimal/float value |
| `iSpouseDOB` | tinyint | NULL |  | Small integer/flag field |
| `dtSpouseDOB` | datetime | NULL |  | Date/time field |
| `SettlementInd` | char(1) | NULL |  |  |
| `iPMTInfo` | tinyint | NULL |  | Small integer/flag field |
| `Notes` | varchar(max) | NULL |  |  |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `iCreatedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `dtLastModified` | datetime | NULL |  | Timestamp when record was last modified |
| `iLastModifiedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who last modified this record |
| `iPlanID` | int | NULL |  | FK to UB_Plan table - identifies the investment plan/account |
| `iYearlyReview` | tinyint | NULL |  | Small integer/flag field |
| `iFedQualified` | tinyint | NULL |  | Small integer/flag field |
| `mMin` | money | NULL |  |  |
| `mMax` | money | NULL |  |  |
| `mYOB` | money | NULL |  |  |
| `iComboPYMT` | tinyint | NULL |  | Small integer/flag field |
| `fTaxRateFed` | float | NULL |  | Decimal/float value |
| `fTaxRateProv` | float | NULL |  | Decimal/float value |
| `mMinPerPMT` | money | NULL |  |  |
| `TaxCode` | varchar(3) | NULL |  |  |
| `mTaxFed` | money | NULL |  |  |
| `mTaxProv` | money | NULL |  |  |
| `iTransferLinkID` | int | NULL |  | Integer field |
| `iDealerTrustBankID` | int | NULL |  | Integer field |
| `dtNextRun` | datetime | NULL |  | Date/time field |
| `dtLastRun` | datetime | NULL |  | Date/time field |
| `iProcessingStatus` | tinyint | NULL |  | Small integer/flag field |
| `bWHTRequest` | tinyint | NULL |  |  |
| `fWHTRequestFed` | float | NULL |  | Decimal/float value |
| `fWHTRequestProv` | float | NULL |  | Decimal/float value |
| `dtStop` | datetime | NULL |  | Date/time field |
| `iTransferInYear` | int | NULL |  | Integer field |
| `iTMPIncome` | tinyint | NULL |  | Small integer/flag field |
| `iTMPIncomeYear` | int | NULL |  | Integer field |
| `mTMPIncomeAmount` | money | NULL |  |  |
| `iFutureAmountType` | tinyint | NULL |  | Small integer/flag field |
| `iFutureYear` | int | NULL |  | Integer field |
| `iTransferDepositType` | int | NULL |  | Integer field |
| `mTransferInMin` | money | NULL |  |  |
| `mTransferInMax` | money | NULL |  |  |
| `bCoronaFlag` | tinyint | NULL |  |  |
| `iRestrictionFlag` | tinyint | NULL |  | Small integer/flag field |
| `dtLastReview` | datetime | NULL |  | Date/time field |
| `iLastReviewUserID` | int | NULL |  | Integer field |
| `iWarning` | tinyint | NULL |  | Small integer/flag field |
| `mNAmount` | money | NULL |  |  |
| `dt2ndDate` | datetime | NULL |  | Date/time field |
| `RIFRedirectFundAcctID` | varchar(15) | NULL |  |  |

### `UB_RRIFSetting_ARC`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `iIndex` | int | NOT NULL | Y | Integer field |
| `iAction` | tinyint | NULL |  | Small integer/flag field |
| `ID` | int | NOT NULL |  | Primary key, auto-increment identifier |
| `iClientID` | int | NULL |  | FK to UB_Client table - identifies the client/investor |
| `MgmtCode` | varchar(5) | NULL |  | Management company code |
| `dtStart` | datetime | NULL |  | Date/time field |
| `Frequency` | char(1) | NULL |  |  |
| `iMinimumAmount` | tinyint | NULL |  | Small integer/flag field |
| `mAmount` | money | NULL |  | Monetary amount |
| `fAnnualIncrease` | float | NULL |  | Decimal/float value |
| `iSpouseDOB` | tinyint | NULL |  | Small integer/flag field |
| `dtSpouseDOB` | datetime | NULL |  | Date/time field |
| `SettlementInd` | char(1) | NULL |  |  |
| `iPMTInfo` | tinyint | NULL |  | Small integer/flag field |
| `Notes` | varchar(max) | NULL |  |  |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `iCreatedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `dtLastModified` | datetime | NULL |  | Timestamp when record was last modified |
| `iLastModifiedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who last modified this record |
| `iPlanID` | int | NULL |  | FK to UB_Plan table - identifies the investment plan/account |
| `iYearlyReview` | tinyint | NULL |  | Small integer/flag field |
| `iFedQualified` | tinyint | NULL |  | Small integer/flag field |
| `mMin` | money | NULL |  |  |
| `mMax` | money | NULL |  |  |
| `mYOB` | money | NULL |  |  |
| `iComboPYMT` | tinyint | NULL |  | Small integer/flag field |
| `fTaxRateFed` | float | NULL |  | Decimal/float value |
| `fTaxRateProv` | float | NULL |  | Decimal/float value |
| `mMinPerPMT` | money | NULL |  |  |
| `TaxCode` | varchar(3) | NULL |  |  |
| `mTaxFed` | money | NULL |  |  |
| `mTaxProv` | money | NULL |  |  |
| `iTransferLinkID` | int | NULL |  | Integer field |
| `iDealerTrustBankID` | int | NULL |  | Integer field |
| `dtNextRun` | datetime | NULL |  | Date/time field |
| `dtLastRun` | datetime | NULL |  | Date/time field |
| `iProcessingStatus` | tinyint | NULL |  | Small integer/flag field |
| `bWHTRequest` | tinyint | NULL |  |  |
| `fWHTRequestFed` | float | NULL |  | Decimal/float value |
| `fWHTRequestProv` | float | NULL |  | Decimal/float value |
| `dtStop` | datetime | NULL |  | Date/time field |
| `iTransferInYear` | int | NULL |  | Integer field |
| `iTMPIncome` | tinyint | NULL |  | Small integer/flag field |
| `iTMPIncomeYear` | int | NULL |  | Integer field |
| `mTMPIncomeAmount` | money | NULL |  |  |
| `iFutureAmountType` | tinyint | NULL |  | Small integer/flag field |
| `iFutureYear` | int | NULL |  | Integer field |
| `iTransferDepositType` | int | NULL |  | Integer field |
| `mTransferInMin` | money | NULL |  |  |
| `mTransferInMax` | money | NULL |  |  |
| `bCoronaFlag` | tinyint | NULL |  |  |
| `iRestrictionFlag` | tinyint | NULL |  | Small integer/flag field |
| `dtLastReview` | datetime | NULL |  | Date/time field |
| `iLastReviewUserID` | int | NULL |  | Integer field |
| `iWarning` | tinyint | NULL |  | Small integer/flag field |
| `mNAmount` | money | NULL |  |  |
| `dt2ndDate` | datetime | NULL |  | Date/time field |
| `RIFRedirectFundAcctID` | varchar(15) | NULL |  |  |

### `UB_RRIFSettingBank`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `iRRIFSettingID` | int | NOT NULL |  | Integer field |
| `iAccountID` | int | NULL |  | Integer field |
| `HolderName` | varchar(80) | NULL |  |  |
| `AccountType` | char(1) | NULL |  |  |
| `Code` | varchar(3) | NULL |  |  |
| `TransitNumber` | varchar(5) | NULL |  |  |
| `AccountNumber` | varchar(12) | NULL |  |  |
| `CurrencyCode` | varchar(2) | NULL |  |  |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `iCreatedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `dtLastModified` | datetime | NULL |  | Timestamp when record was last modified |
| `iLastModifiedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who last modified this record |

### `UB_RRIFSettingBank_ARC`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `iIndex` | int | NOT NULL | Y | Integer field |
| `iAction` | tinyint | NULL |  | Small integer/flag field |
| `iRRIFSettingID` | int | NOT NULL |  | Integer field |
| `iAccountID` | int | NULL |  | Integer field |
| `HolderName` | varchar(80) | NULL |  |  |
| `AccountType` | char(1) | NULL |  |  |
| `Code` | varchar(3) | NULL |  |  |
| `TransitNumber` | varchar(5) | NULL |  |  |
| `AccountNumber` | varchar(12) | NULL |  |  |
| `CurrencyCode` | varchar(2) | NULL |  |  |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `iCreatedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `dtLastModified` | datetime | NULL |  | Timestamp when record was last modified |
| `iLastModifiedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who last modified this record |

### `UB_RRIFSettingCheque`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `iRRIFSettingID` | int | NOT NULL |  | Integer field |
| `Type` | char(1) | NULL |  |  |
| `Title` | char(1) | NULL |  |  |
| `LastName` | varchar(80) | NULL |  | Last name |
| `FirstName` | varchar(40) | NULL |  | First name |
| `Address` | varchar(120) | NULL |  |  |
| `City` | varchar(30) | NULL |  |  |
| `Province` | varchar(2) | NULL |  |  |
| `Country` | varchar(3) | NULL |  |  |
| `PostalCode` | varchar(10) | NULL |  |  |

### `UB_RRIFSettingExtra`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iRRIFSettingID` | int | NULL |  | Integer field |
| `AmountType` | char(1) | NULL |  |  |
| `mAmount` | money | NULL |  | Monetary amount |
| `iPMTInfo` | tinyint | NULL |  | Small integer/flag field |
| `iBankAccountID` | int | NULL |  | Integer field |
| `iTransferLinkID` | int | NULL |  | Integer field |
| `iTransferDepositType` | int | NULL |  | Integer field |
| `dtCreate` | datetime | NULL |  | Date/time field |

### `UB_RRIFSettingFund`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iRRIFSettingID` | int | NULL |  | Integer field |
| `FundID` | varchar(5) | NULL |  | Fund identifier code (e.g., DYN 3056) |
| `fSplit` | float | NULL |  | Decimal/float value |
| `iFundPosID` | int | NULL |  | Integer field |
| `mLastAmount` | money | NULL |  |  |
| `iProdType` | tinyint | NULL |  | Small integer/flag field |
| `MgmtCode` | varchar(5) | NULL |  | Management company code |
| `iGICAccountID` | int | NULL |  | Integer field |
| `iCashAccountID` | int | NULL |  | Integer field |
| `AmountType` | char(1) | NULL |  |  |
| `iWarning` | tinyint | NULL |  | Small integer/flag field |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `iCreatedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `dtLastModified` | datetime | NULL |  | Timestamp when record was last modified |
| `iLastModifiedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who last modified this record |

### `UB_RRIFSettingFund_2024`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL |  | Primary key, auto-increment identifier |
| `iRRIFSettingID` | int | NULL |  | Integer field |
| `FundID` | varchar(5) | NULL |  | Fund identifier code (e.g., DYN 3056) |
| `fSplit` | float | NULL |  | Decimal/float value |
| `iFundPosID` | int | NULL |  | Integer field |
| `mLastAmount` | money | NULL |  |  |
| `iProdType` | tinyint | NULL |  | Small integer/flag field |
| `MgmtCode` | varchar(5) | NULL |  | Management company code |
| `iGICAccountID` | int | NULL |  | Integer field |
| `iCashAccountID` | int | NULL |  | Integer field |
| `AmountType` | char(1) | NULL |  |  |
| `iWarning` | tinyint | NULL |  | Small integer/flag field |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `iCreatedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `dtLastModified` | datetime | NULL |  | Timestamp when record was last modified |
| `iLastModifiedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who last modified this record |

### `UB_RRIFSettingFund_ARC`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `iIndex` | int | NOT NULL | Y | Integer field |
| `iAction` | tinyint | NULL |  | Small integer/flag field |
| `ID` | int | NOT NULL |  | Primary key, auto-increment identifier |
| `iRRIFSettingID` | int | NULL |  | Integer field |
| `FundID` | varchar(5) | NULL |  | Fund identifier code (e.g., DYN 3056) |
| `fSplit` | float | NULL |  | Decimal/float value |
| `iFundPosID` | int | NULL |  | Integer field |
| `mLastAmount` | money | NULL |  |  |
| `iProdType` | tinyint | NULL |  | Small integer/flag field |
| `MgmtCode` | varchar(5) | NULL |  | Management company code |
| `iGICAccountID` | int | NULL |  | Integer field |
| `iCashAccountID` | int | NULL |  | Integer field |
| `AmountType` | char(1) | NULL |  |  |
| `iWarning` | tinyint | NULL |  | Small integer/flag field |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `iCreatedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `dtLastModified` | datetime | NULL |  | Timestamp when record was last modified |
| `iLastModifiedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who last modified this record |

### `UB_RRIFYOB`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `iYear` | int | NOT NULL |  | Integer field |
| `iPlanID` | int | NOT NULL |  | FK to UB_Plan table - identifies the investment plan/account |
| `mYOB` | money | NULL |  |  |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `bSpouseDOB` | tinyint | NULL |  |  |
| `iAge` | int | NULL |  | Integer field |
| `mMax` | money | NULL |  |  |
| `mMin` | money | NULL |  |  |
| `Prov` | char(3) | NULL |  |  |

---

## RRSP (Registered Retirement Savings Plan)

### `UB_RRSP_SLP`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `iFileID` | int | NULL |  | FK to file record (FundServ file) |
| `iUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `iStatus` | tinyint | NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `iTaxYear` | int | NULL |  | Integer field |
| `iPlanID` | int | NULL |  | FK to UB_Plan table - identifies the investment plan/account |
| `ClientSIN` | varchar(15) | NULL |  |  |
| `ContributorSIN` | varchar(15) | NULL |  |  |
| `snm` | varchar(20) | NULL |  |  |
| `gvn_nm` | varchar(20) | NULL |  |  |
| `init` | char(1) | NULL |  |  |
| `addr_l1_txt` | varchar(30) | NULL |  |  |
| `addr_l2_txt` | varchar(30) | NULL |  |  |
| `cty_nm` | varchar(28) | NULL |  |  |
| `prov_cd` | char(2) | NULL |  |  |
| `cntry_cd` | char(3) | NULL |  |  |
| `pstl_cd` | varchar(10) | NULL |  |  |
| `sec_snm` | varchar(20) | NULL |  |  |
| `sec_gvn_nm` | varchar(20) | NULL |  |  |
| `sec_init` | char(1) | NULL |  |  |
| `ctrct_nbr` | varchar(12) | NULL |  |  |
| `rpt_tcd` | char(1) | NULL |  |  |
| `sps_cntrb_ind` | char(1) | NULL |  |  |
| `m_rrsp_pyr_amt` | money | NULL |  |  |
| `m_rrsp_cyr_amt` | money | NULL |  |  |
| `iFlag` | tinyint | NULL |  | Small integer/flag field |
| `Notes` | varchar(max) | NULL |  |  |
| `bRRIF` | tinyint | NULL |  |  |
| `iOrgID` | int | NULL |  | Integer field |
| `rpt_tcd_org` | char(1) | NULL |  |  |

### `UB_RRSP_SLP_ARC`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL |  | Primary key, auto-increment identifier |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `iFileID` | int | NULL |  | FK to file record (FundServ file) |
| `iUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `iStatus` | tinyint | NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `iTaxYear` | int | NULL |  | Integer field |
| `iPlanID` | int | NULL |  | FK to UB_Plan table - identifies the investment plan/account |
| `ClientSIN` | varchar(15) | NULL |  |  |
| `ContributorSIN` | varchar(15) | NULL |  |  |
| `snm` | varchar(20) | NULL |  |  |
| `gvn_nm` | varchar(20) | NULL |  |  |
| `init` | char(1) | NULL |  |  |
| `addr_l1_txt` | varchar(30) | NULL |  |  |
| `addr_l2_txt` | varchar(30) | NULL |  |  |
| `cty_nm` | varchar(28) | NULL |  |  |
| `prov_cd` | char(2) | NULL |  |  |
| `cntry_cd` | char(3) | NULL |  |  |
| `pstl_cd` | varchar(10) | NULL |  |  |
| `sec_snm` | varchar(20) | NULL |  |  |
| `sec_gvn_nm` | varchar(20) | NULL |  |  |
| `sec_init` | char(1) | NULL |  |  |
| `ctrct_nbr` | varchar(12) | NULL |  |  |
| `rpt_tcd` | char(1) | NULL |  |  |
| `sps_cntrb_ind` | char(1) | NULL |  |  |
| `m_rrsp_pyr_amt` | money | NULL |  |  |
| `m_rrsp_cyr_amt` | money | NULL |  |  |
| `iFlag` | tinyint | NULL |  | Small integer/flag field |
| `Notes` | varchar(max) | NULL |  |  |
| `bRRIF` | tinyint | NULL |  |  |
| `iOrgID` | int | NULL |  | Integer field |
| `rpt_tcd_org` | char(1) | NULL |  |  |

### `UB_RRSP_TRX`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `iSlipID` | int | NOT NULL |  | Integer field |
| `iTrustTrxID` | int | NOT NULL |  | Integer field |

### `UB_RRSPDeadLine`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `iTaxYear` | int | NOT NULL |  | Integer field |
| `DeadLine` | varchar(10) | NOT NULL |  |  |

### `UB_RRSPTaxReceipt`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `iVoid` | tinyint | NULL |  | Small integer/flag field |
| `iVoidUserID` | int | NULL |  | Integer field |
| `dtVoid` | datetime | NULL |  | Date/time field |
| `Notes` | varchar(200) | NULL |  |  |
| `iPrinted` | tinyint | NULL |  | Small integer/flag field |
| `dtPrinted` | datetime | NULL |  | Date/time field |
| `iFileID` | int | NULL |  | FK to file record (FundServ file) |
| `iObjData` | int | NULL |  | Integer field |
| `iUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `mAmount` | money | NULL |  | Monetary amount |
| `mAmount60` | money | NULL |  | Monetary amount |
| `mAmountTotal` | money | NULL |  | Monetary amount |
| `ReceiptID` | varchar(15) | NULL |  |  |
| `iStatus` | tinyint | NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `iTaxYear` | int | NULL |  | Integer field |
| `iPlanID` | int | NULL |  | FK to UB_Plan table - identifies the investment plan/account |
| `ClientName` | varchar(100) | NULL |  |  |
| `ClientAddressLine1` | varchar(100) | NULL |  |  |
| `ClientAddressLine2` | varchar(100) | NULL |  |  |
| `ClientAddressLine3` | varchar(100) | NULL |  |  |
| `ClientSIN` | varchar(15) | NULL |  |  |
| `AccountNumber` | varchar(15) | NULL |  |  |
| `ContributorSIN` | varchar(15) | NULL |  |  |
| `iInKind` | tinyint | NULL |  | Small integer/flag field |
| `ContributorName` | varchar(100) | NULL |  |  |
| `i60j` | tinyint | NULL |  |  |
| `i60l` | tinyint | NULL |  |  |
| `iLg` | tinyint | NULL |  | Small integer/flag field |
| `iPrintedUserID` | int | NULL |  | Integer field |
| `iReceiptType` | tinyint | NULL |  | Small integer/flag field |
| `iSubmissionStatus` | tinyint | NULL |  | Small integer/flag field |
| `iSlipID` | int | NULL |  | Integer field |
| `bSpousal` | tinyint | NULL |  |  |
| `ContributorFName` | varchar(40) | NULL |  |  |
| `ClientFName` | varchar(40) | NULL |  |  |
| `iObjDataOrg` | int | NULL |  | Integer field |
| `iApproved` | tinyint | NULL |  | Small integer/flag field |
| `iApprovedUserID` | int | NULL |  | Integer field |
| `dtApproved` | datetime | NULL |  | Date/time field |
| `iClientViewed` | tinyint | NULL |  | Small integer/flag field |
| `dtClientViewed` | datetime | NULL |  | Date/time field |

### `UB_RRSPTaxReceiptTrx`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iReceiptID` | int | NULL |  | Integer field |
| `mAmount` | money | NULL |  | Monetary amount |
| `iFirst60` | tinyint | NULL |  | Small integer/flag field |
| `iTrustID` | int | NULL |  | Integer field |

---

## Scheduled Processing

### `UB_ScheduleRun`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `DealerCode` | varchar(5) | NULL |  | Dealer code identifier |
| `dtEffective` | datetime | NULL |  | Effective date |
| `iEffectiveDate` | int | NULL |  | Integer field |
| `iCreatedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `iLastModifiedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who last modified this record |
| `dtLastModified` | datetime | NULL |  | Timestamp when record was last modified |
| `Type` | char(1) | NULL |  |  |
| `mAmount` | money | NULL |  | Monetary amount |
| `iStatus` | tinyint | NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `iTrxCount` | int | NULL |  | Integer field |
| `IntCode` | varchar(5) | NULL |  |  |

### `UB_ScheduleRunDetail`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iScheduleRunID` | int | NULL |  | Integer field |
| `iTrxID` | int | NULL |  | Integer field |
| `iGICID` | int | NULL |  | Integer field |
| `iRRIFSettingID` | int | NULL |  | Integer field |
| `iSysPlanID` | int | NULL |  | Integer field |
| `iStatus` | tinyint | NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `dtProcessing` | datetime | NULL |  | Date/time field |

---

## Segregated Fund

### `UB_SegFundInfo`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `iPositionID` | int | NOT NULL |  | Integer field |
| `JurProv` | char(3) | NULL |  |  |
| `dtMaturity` | datetime | NULL |  | Date/time field |
| `mMaturityValue` | money | NULL |  |  |
| `mDeathValue` | money | NULL |  |  |
| `DepositID` | varchar(20) | NULL |  |  |
| `mLWA` | money | NULL |  |  |
| `mLWARemaining` | money | NULL |  |  |
| `mLWAExceeded` | money | NULL |  |  |
| `mLWAAdjusted` | money | NULL |  |  |
| `mGMWB` | money | NULL |  |  |
| `mGMWBMax` | money | NULL |  |  |
| `mGMWBRemaining` | money | NULL |  |  |
| `mGMWBExceeded` | money | NULL |  |  |
| `mGMWBAdjusted` | money | NULL |  |  |
| `mGMWBBonus` | money | NULL |  |  |
| `dtGMWBAnniversary` | datetime | NULL |  | Date/time field |
| `GMWBPeriod` | char(1) | NULL |  |  |
| `iCreatedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `iLastModifiedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who last modified this record |
| `dtLastModified` | datetime | NULL |  | Timestamp when record was last modified |

---

## Service Task Management

### `UB_ServiceTask`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iType` | smallint | NULL |  | Type/category code |
| `iPriority` | tinyint | NULL |  | Small integer/flag field |
| `iFrequency` | tinyint | NULL |  | Small integer/flag field |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `QueryStr` | varchar(max) | NULL |  |  |
| `iStatus` | tinyint | NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `iLastRun` | int | NULL |  | Integer field |
| `dtLastRun` | datetime | NULL |  | Date/time field |

### `UB_ServiceTaskFreq`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | tinyint | NULL |  | Primary key, auto-increment identifier |
| `NameEN` | varchar(100) | NULL |  | English name |
| `NameFR` | varchar(100) | NULL |  | French name |
| `iOrder` | tinyint | NULL |  | Small integer/flag field |

---

## Application Settings

### `UB_Settings`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `DSID` | int | NOT NULL |  |  |
| `UserID` | int | NULL |  |  |
| `KeyStr` | varchar(80) | NOT NULL |  |  |
| `ValStr` | varchar(max) | NOT NULL |  |  |
| `dtDate` | datetime | NULL |  | Date/time field |

---

## Stock/ETF Management

### `UB_Stock`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iPlanID` | int | NULL |  | FK to UB_Plan table - identifies the investment plan/account |
| `MgmtCode` | varchar(6) | NULL |  | Management company code |
| `FundID` | varchar(6) | NULL |  | Fund identifier code (e.g., DYN 3056) |
| `FundAccountID` | varchar(20) | NULL |  |  |
| `InvestmentID` | varchar(20) | NULL |  |  |
| `Status` | char(1) | NULL |  |  |
| `fUnit` | float | NULL |  | Number of units |
| `mPrice` | money | NULL |  |  |
| `dtEffective` | datetime | NULL |  | Effective date |
| `CurrencyCode` | char(2) | NULL |  |  |
| `InstrumentType` | char(3) | NULL |  |  |
| `iCreatedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `iLastModifiedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who last modified this record |
| `dtLastModified` | datetime | NULL |  | Timestamp when record was last modified |
| `iFileID` | int | NULL |  | FK to file record (FundServ file) |
| `iModifiedMethod` | tinyint | NULL |  | Small integer/flag field |
| `Description` | varchar(80) | NULL |  |  |
| `mAverageCost` | money | NULL |  |  |
| `dtStart` | datetime | NULL |  | Date/time field |
| `dtEnd` | datetime | NULL |  | Date/time field |

### `UB_StockTrx`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iType` | int | NULL |  | Type/category code |
| `Type` | char(1) | NULL |  |  |
| `TypeDetail` | char(1) | NULL |  |  |
| `iStockAccountID` | int | NULL |  | Integer field |
| `iStatus` | tinyint | NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `Role` | char(1) | NULL |  |  |
| `Protrader` | char(1) | NULL |  |  |
| `fXRate` | float | NULL |  | Decimal/float value |
| `mXAmount` | money | NULL |  |  |
| `mClientPaidCommission` | money | NULL |  |  |
| `mFee` | money | NULL |  |  |
| `fUnit` | float | NULL |  | Number of units |
| `mPrice` | money | NULL |  |  |
| `mGAmount` | money | NULL |  |  |
| `mNAmount` | money | NULL |  |  |
| `fUnitBalance` | float | NULL |  | Decimal/float value |
| `dtTrade` | datetime | NULL |  | Trade date |
| `dtProcessing` | datetime | NULL |  | Date/time field |
| `dtSettled` | datetime | NULL |  | Date/time field |
| `iTrustAccountID` | int | NULL |  | Integer field |
| `iTrustBankID` | int | NULL |  | Integer field |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `iCreatedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `iLastModifiedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who last modified this record |
| `dtLastModified` | datetime | NULL |  | Timestamp when record was last modified |

---

## System Configuration & Sequences

### `UB_SysID`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `Code` | int | NOT NULL | Y |  |
| `Date` | datetime | NULL |  |  |

### `UB_SysID0`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `Code` | tinyint | NULL |  |  |

### `UB_SysID2`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `Code` | int | NOT NULL | Y |  |
| `bValue` | tinyint | NULL |  |  |

### `UB_SysID3`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `Code` | int | NOT NULL | Y |  |
| `bValue` | tinyint | NULL |  |  |

### `UB_SysID4`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `Code` | int | NOT NULL | Y |  |
| `bValue` | tinyint | NULL |  |  |

### `UB_SysID5`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `Code` | int | NOT NULL | Y |  |
| `bValue` | tinyint | NULL |  |  |

### `UB_SysID6`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `Code` | int | NOT NULL | Y |  |
| `bValue` | tinyint | NULL |  |  |

### `UB_SysID7`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `Code` | int | NOT NULL | Y |  |
| `bValue` | tinyint | NULL |  |  |

### `UB_SysID8`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `Code` | int | NOT NULL | Y |  |
| `bValue` | tinyint | NULL |  |  |

### `UB_SysID9`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `Code` | int | NOT NULL | Y |  |
| `bValue` | tinyint | NULL |  |  |

### `UB_SysIDGICTrx`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `Code` | int | NOT NULL | Y |  |
| `bValue` | tinyint | NULL |  |  |

### `UB_SysIDTrx`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `Code` | int | NOT NULL | Y |  |
| `bValue` | tinyint | NULL |  |  |

### `UB_SysScheduleAWDHistory`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iSysPlanID` | int | NULL |  | Integer field |
| `iTrustTrxID` | int | NULL |  | Integer field |
| `iEFTID` | int | NULL |  | Integer field |
| `iCashTrxID` | int | NULL |  | Integer field |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `iCreatedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `iChequeID` | int | NULL |  | Integer field |

### `UB_SysScheduleAWDWaiting`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `iSysPlanID` | int | NOT NULL |  | Integer field |
| `iTrustTrxID` | int | NULL |  | Integer field |
| `iEFTID` | int | NULL |  | Integer field |
| `iCashTrxID` | int | NULL |  | Integer field |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `iCreatedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |

### `UB_SysScheduleBank`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `iSysPlanID` | int | NOT NULL |  | Integer field |
| `iAccountID` | int | NULL |  | Integer field |
| `HolderName` | varchar(80) | NULL |  |  |
| `AccountType` | char(1) | NULL |  |  |
| `Code` | varchar(3) | NULL |  |  |
| `TransitNumber` | varchar(5) | NULL |  |  |
| `AccountNumber` | varchar(12) | NULL |  |  |
| `CurrencyCode` | varchar(2) | NULL |  |  |
| `iUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |

### `UB_SysScheduleBankARC`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iSysPlanID` | int | NOT NULL |  | Integer field |
| `iAccountID` | int | NULL |  | Integer field |
| `HolderName` | varchar(80) | NULL |  |  |
| `AccountType` | char(1) | NULL |  |  |
| `Code` | varchar(3) | NULL |  |  |
| `TransitNumber` | varchar(5) | NULL |  |  |
| `AccountNumber` | varchar(12) | NULL |  |  |
| `CurrencyCode` | varchar(2) | NULL |  |  |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `iUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |

### `UB_SysScheduleCheque`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `iSysPlanID` | int | NOT NULL |  | Integer field |
| `Type` | char(1) | NULL |  |  |
| `Title` | char(1) | NULL |  |  |
| `LastName` | varchar(80) | NULL |  | Last name |
| `FirstName` | varchar(40) | NULL |  | First name |
| `Address` | varchar(120) | NULL |  |  |
| `City` | varchar(30) | NULL |  |  |
| `Province` | varchar(2) | NULL |  |  |
| `Country` | varchar(3) | NULL |  |  |
| `PostalCode` | varchar(10) | NULL |  |  |

### `UB_SysSchedulePACHistory`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iSysPlanID` | int | NULL |  | Integer field |
| `iTrustTrxID` | int | NULL |  | Integer field |
| `iEFTID` | int | NULL |  | Integer field |
| `iCashTrxID` | int | NULL |  | Integer field |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `iCreatedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |

### `UB_SysSchedulePACWaiting`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `iSysPlanID` | int | NOT NULL |  | Integer field |
| `iTrustTrxID` | int | NULL |  | Integer field |
| `iEFTID` | int | NULL |  | Integer field |
| `iCashTrxID` | int | NULL |  | Integer field |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `iCreatedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |

---

## NR4 Non-Resident Tax

### `UB_NR4_SLP`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iTaxYear` | int | NULL |  | Integer field |
| `iPlanID` | int | NULL |  | FK to UB_Plan table - identifies the investment plan/account |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `iUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `iFileID` | int | NULL |  | FK to file record (FundServ file) |
| `iStatus` | tinyint | NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `iSubmissionStatus` | tinyint | NULL |  | Small integer/flag field |
| `iFlag` | tinyint | NULL |  | Small integer/flag field |
| `iVoid` | tinyint | NULL |  | Small integer/flag field |
| `iVoidUserID` | int | NULL |  | Integer field |
| `dtVoid` | datetime | NULL |  | Date/time field |
| `iPrinted` | tinyint | NULL |  | Small integer/flag field |
| `dtPrinted` | datetime | NULL |  | Date/time field |
| `iPrintedUserID` | int | NULL |  | Integer field |
| `iObjData` | int | NULL |  | Integer field |
| `iObjDataOrg` | int | NULL |  | Integer field |
| `iApproved` | tinyint | NULL |  | Small integer/flag field |
| `iApprovedUserID` | int | NULL |  | Integer field |
| `dtApproved` | datetime | NULL |  | Date/time field |
| `iClientViewed` | tinyint | NULL |  | Small integer/flag field |
| `dtClientViewed` | datetime | NULL |  | Date/time field |
| `Notes` | varchar(max) | NULL |  |  |
| `snm` | varchar(20) | NULL |  |  |
| `gvn_nm` | varchar(20) | NULL |  |  |
| `init` | char(1) | NULL |  |  |
| `ClientSIN` | varchar(15) | NULL |  |  |
| `addr_l1_txt` | varchar(30) | NULL |  |  |
| `addr_l2_txt` | varchar(30) | NULL |  |  |
| `cty_nm` | varchar(28) | NULL |  |  |
| `prov_cd` | char(2) | NULL |  |  |
| `cntry_cd` | char(3) | NULL |  |  |
| `pstl_cd` | varchar(10) | NULL |  |  |
| `ctrct_nbr` | varchar(12) | NULL |  |  |
| `rpt_tcd` | char(1) | NULL |  |  |
| `sps_cntrb_ind` | char(1) | NULL |  |  |
| `sps_sin` | varchar(15) | NULL |  |  |
| `inc_1_tcd` | char(2) | NULL |  |  |
| `crcy_1_cd` | char(3) | NULL |  |  |
| `m_gro_1_incamt` | money | NULL |  |  |
| `m_nr_tx_1_amt` | money | NULL |  |  |
| `tx_xmpt_1_cd` | char(1) | NULL |  |  |
| `inc_2_tcd` | char(2) | NULL |  |  |
| `crcy_2_cd` | char(3) | NULL |  |  |
| `m_gro_2_incamt` | money | NULL |  |  |
| `m_nr_tx_2_amt` | money | NULL |  |  |
| `tx_xmpt_2_cd` | char(1) | NULL |  |  |
| `dtLastModified` | datetime | NULL |  | Timestamp when record was last modified |
| `iLastModifiedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who last modified this record |
| `ClientAddressPDF` | varchar(340) | NULL |  |  |
| `FirstNamePDF` | varchar(80) | NULL |  |  |
| `LastNamePDF` | varchar(80) | NULL |  |  |
| `RecipientCode` | char(1) | NULL |  |  |
| `TaxCode` | varchar(3) | NULL |  |  |
| `sec_snm` | varchar(20) | NULL |  |  |
| `sec_gvn_nm` | varchar(20) | NULL |  |  |
| `LastNamePDF2` | varchar(80) | NULL |  |  |
| `FirstNamePDF2` | varchar(80) | NULL |  |  |
| `PlanType` | char(2) | NULL |  |  |
| `bCorp` | tinyint | NULL |  |  |

### `UB_NR4_SLP_ARC`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL |  | Primary key, auto-increment identifier |
| `iTaxYear` | int | NULL |  | Integer field |
| `iPlanID` | int | NULL |  | FK to UB_Plan table - identifies the investment plan/account |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `iUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `iFileID` | int | NULL |  | FK to file record (FundServ file) |
| `iStatus` | tinyint | NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `iSubmissionStatus` | tinyint | NULL |  | Small integer/flag field |
| `iFlag` | tinyint | NULL |  | Small integer/flag field |
| `iVoid` | tinyint | NULL |  | Small integer/flag field |
| `iVoidUserID` | int | NULL |  | Integer field |
| `dtVoid` | datetime | NULL |  | Date/time field |
| `iPrinted` | tinyint | NULL |  | Small integer/flag field |
| `dtPrinted` | datetime | NULL |  | Date/time field |
| `iPrintedUserID` | int | NULL |  | Integer field |
| `iObjData` | int | NULL |  | Integer field |
| `iObjDataOrg` | int | NULL |  | Integer field |
| `iApproved` | tinyint | NULL |  | Small integer/flag field |
| `iApprovedUserID` | int | NULL |  | Integer field |
| `dtApproved` | datetime | NULL |  | Date/time field |
| `iClientViewed` | tinyint | NULL |  | Small integer/flag field |
| `dtClientViewed` | datetime | NULL |  | Date/time field |
| `Notes` | varchar(max) | NULL |  |  |
| `snm` | varchar(20) | NULL |  |  |
| `gvn_nm` | varchar(20) | NULL |  |  |
| `init` | char(1) | NULL |  |  |
| `ClientSIN` | varchar(15) | NULL |  |  |
| `addr_l1_txt` | varchar(30) | NULL |  |  |
| `addr_l2_txt` | varchar(30) | NULL |  |  |
| `cty_nm` | varchar(28) | NULL |  |  |
| `prov_cd` | char(2) | NULL |  |  |
| `cntry_cd` | char(3) | NULL |  |  |
| `pstl_cd` | varchar(10) | NULL |  |  |
| `ctrct_nbr` | varchar(12) | NULL |  |  |
| `rpt_tcd` | char(1) | NULL |  |  |
| `sps_cntrb_ind` | char(1) | NULL |  |  |
| `sps_sin` | varchar(15) | NULL |  |  |
| `inc_1_tcd` | char(2) | NULL |  |  |
| `crcy_1_cd` | char(3) | NULL |  |  |
| `m_gro_1_incamt` | money | NULL |  |  |
| `m_nr_tx_1_amt` | money | NULL |  |  |
| `tx_xmpt_1_cd` | char(1) | NULL |  |  |
| `inc_2_tcd` | char(2) | NULL |  |  |
| `crcy_2_cd` | char(3) | NULL |  |  |
| `m_gro_2_incamt` | money | NULL |  |  |
| `m_nr_tx_2_amt` | money | NULL |  |  |
| `tx_xmpt_2_cd` | char(1) | NULL |  |  |
| `dtLastModified` | datetime | NULL |  | Timestamp when record was last modified |
| `iLastModifiedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who last modified this record |
| `ClientAddressPDF` | varchar(340) | NULL |  |  |
| `FirstNamePDF` | varchar(80) | NULL |  |  |
| `LastNamePDF` | varchar(80) | NULL |  |  |
| `RecipientCode` | char(1) | NULL |  |  |
| `TaxCode` | varchar(3) | NULL |  |  |
| `sec_snm` | varchar(20) | NULL |  |  |
| `sec_gvn_nm` | varchar(20) | NULL |  |  |
| `LastNamePDF2` | varchar(80) | NULL |  |  |
| `FirstNamePDF2` | varchar(80) | NULL |  |  |
| `PlanType` | char(2) | NULL |  |  |
| `bCorp` | tinyint | NULL |  |  |

### `UB_NR4_TRX`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `iSlipID` | int | NOT NULL |  | Integer field |
| `iTrustTrxID` | int | NOT NULL |  | Integer field |

### `UB_T3_Omnibus`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iTaxYear` | int | NULL |  | Integer field |
| `MgmtCode` | varchar(5) | NULL |  | Management company code |
| `FundID` | varchar(8) | NULL |  | Fund identifier code (e.g., DYN 3056) |
| `mBox21` | money | NULL |  |  |
| `mBox25` | money | NULL |  |  |
| `mBox26` | money | NULL |  |  |
| `mBox34` | money | NULL |  |  |
| `mBox42` | money | NULL |  |  |
| `mBox49` | money | NULL |  |  |
| `mBox50` | money | NULL |  |  |
| `mBox51` | money | NULL |  |  |
| `mTotalDividend` | money | NULL |  |  |
| `fFactor_21` | float | NULL |  | Decimal/float value |
| `fFactor_25` | float | NULL |  | Decimal/float value |
| `fFactor_26` | float | NULL |  | Decimal/float value |
| `fFactor_34` | float | NULL |  | Decimal/float value |
| `fFactor_42` | float | NULL |  | Decimal/float value |
| `fFactor_49` | float | NULL |  | Decimal/float value |
| `fFactor_50` | float | NULL |  | Decimal/float value |
| `fFactor_51` | float | NULL |  | Decimal/float value |
| `dtProcess` | datetime | NULL |  | Date/time field |
| `dtLastModified` | datetime | NULL |  | Timestamp when record was last modified |
| `iLastModifiedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who last modified this record |
| `iStatus` | tinyint | NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `mBox23` | money | NULL |  |  |
| `fFactor_23` | float | NULL |  | Decimal/float value |
| `mBox52` | money | NULL |  |  |
| `mBox53` | money | NULL |  |  |
| `mBox54` | money | NULL |  |  |
| `mBox55` | money | NULL |  |  |
| `mBox56` | money | NULL |  |  |
| `mBox57` | money | NULL |  |  |
| `mBox58` | money | NULL |  |  |
| `mBox59` | money | NULL |  |  |
| `fFactor_52` | float | NULL |  | Decimal/float value |
| `fFactor_53` | float | NULL |  | Decimal/float value |
| `fFactor_54` | float | NULL |  | Decimal/float value |
| `fFactor_55` | float | NULL |  | Decimal/float value |
| `fFactor_56` | float | NULL |  | Decimal/float value |
| `fFactor_57` | float | NULL |  | Decimal/float value |
| `fFactor_58` | float | NULL |  | Decimal/float value |
| `fFactor_59` | float | NULL |  | Decimal/float value |
| `mTotalUnit` | float | NULL |  | Monetary value |

### `UB_T3_PlanFund`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iTaxYear` | int | NULL |  | Integer field |
| `iPlanID` | int | NULL |  | FK to UB_Plan table - identifies the investment plan/account |
| `iStatus` | tinyint | NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `iStatusRL16` | tinyint | NULL |  | Status code (specific to this context) |
| `MgmtCode` | varchar(5) | NULL |  | Management company code |
| `FundID` | varchar(8) | NULL |  | Fund identifier code (e.g., DYN 3056) |
| `mBox21` | money | NULL |  |  |
| `mBox25` | money | NULL |  |  |
| `mBox26` | money | NULL |  |  |
| `mBox34` | money | NULL |  |  |
| `mBox42` | money | NULL |  |  |
| `mBox49` | money | NULL |  |  |
| `mBox50` | money | NULL |  |  |
| `mBox51` | money | NULL |  |  |
| `mTotalDividend` | money | NULL |  |  |
| `dtProcess` | datetime | NULL |  | Date/time field |
| `dtProcessRL16` | datetime | NULL |  | Date/time field |
| `dtLastModified` | datetime | NULL |  | Timestamp when record was last modified |
| `iLastModifiedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who last modified this record |
| `mTotalDividend2` | money | NULL |  |  |
| `fFactor2` | float | NULL |  | Decimal/float value |
| `mBox23` | money | NULL |  |  |
| `mBox32` | money | NULL |  |  |
| `bDeleted` | tinyint | NULL |  |  |
| `mBox52` | money | NULL |  |  |
| `mBox53` | money | NULL |  |  |
| `mBox54` | money | NULL |  |  |
| `mBox55` | money | NULL |  |  |
| `mBox56` | money | NULL |  |  |
| `mBox57` | money | NULL |  |  |
| `mBox58` | money | NULL |  |  |
| `mBox59` | money | NULL |  |  |
| `fTotalUnit` | float | NULL |  | Decimal/float value |

### `UB_T3_SLP`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iTaxYear` | int | NULL |  | Integer field |
| `iPlanID` | int | NULL |  | FK to UB_Plan table - identifies the investment plan/account |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `iUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `iFileID` | int | NULL |  | FK to file record (FundServ file) |
| `iStatus` | tinyint | NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `iSubmissionStatus` | tinyint | NULL |  | Small integer/flag field |
| `iFlag` | tinyint | NULL |  | Small integer/flag field |
| `iVoid` | tinyint | NULL |  | Small integer/flag field |
| `iVoidUserID` | int | NULL |  | Integer field |
| `dtVoid` | datetime | NULL |  | Date/time field |
| `iPrinted` | tinyint | NULL |  | Small integer/flag field |
| `dtPrinted` | datetime | NULL |  | Date/time field |
| `iPrintedUserID` | int | NULL |  | Integer field |
| `iObjData` | int | NULL |  | Integer field |
| `iObjDataOrg` | int | NULL |  | Integer field |
| `iApproved` | tinyint | NULL |  | Small integer/flag field |
| `iApprovedUserID` | int | NULL |  | Integer field |
| `dtApproved` | datetime | NULL |  | Date/time field |
| `iClientViewed` | tinyint | NULL |  | Small integer/flag field |
| `dtClientViewed` | datetime | NULL |  | Date/time field |
| `Notes` | varchar(max) | NULL |  |  |
| `snm` | varchar(30) | NULL |  |  |
| `gvn_nm` | varchar(30) | NULL |  |  |
| `init` | char(1) | NULL |  |  |
| `ClientSIN` | varchar(15) | NULL |  |  |
| `addr_l1_txt` | varchar(30) | NULL |  |  |
| `addr_l2_txt` | varchar(30) | NULL |  |  |
| `cty_nm` | varchar(28) | NULL |  |  |
| `prov_cd` | char(2) | NULL |  |  |
| `cntry_cd` | char(3) | NULL |  |  |
| `pstl_cd` | varchar(10) | NULL |  |  |
| `ctrct_nbr` | varchar(12) | NULL |  |  |
| `rpt_tcd` | char(1) | NULL |  |  |
| `RecipientCode` | char(1) | NULL |  |  |
| `joint_sin` | varchar(15) | NULL |  |  |
| `mBox21` | money | NULL |  |  |
| `mBox25` | money | NULL |  |  |
| `mBox26` | money | NULL |  |  |
| `mBox34` | money | NULL |  |  |
| `mBox42` | money | NULL |  |  |
| `mBox49` | money | NULL |  |  |
| `mBox50` | money | NULL |  |  |
| `mBox51` | money | NULL |  |  |
| `dtLastModified` | datetime | NULL |  | Timestamp when record was last modified |
| `iLastModifiedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who last modified this record |
| `ClientAddressPDF` | varchar(340) | NULL |  |  |
| `FirstNamePDF` | varchar(80) | NULL |  |  |
| `LastNamePDF` | varchar(80) | NULL |  |  |
| `iType` | tinyint | NULL |  | Type/category code |
| `iClientID` | int | NULL |  | FK to UB_Client table - identifies the client/investor |
| `bCorp` | tinyint | NULL |  |  |
| `sec_snm` | varchar(20) | NULL |  |  |
| `sec_gvn_nm` | varchar(12) | NULL |  |  |
| `mBox23` | money | NULL |  |  |
| `mBox32` | money | NULL |  |  |
| `iOrgID` | int | NULL |  | Integer field |
| `rpt_tcd_org` | char(1) | NULL |  |  |
| `mBox52` | money | NULL |  |  |
| `mBox53` | money | NULL |  |  |
| `mBox54` | money | NULL |  |  |
| `mBox55` | money | NULL |  |  |
| `mBox56` | money | NULL |  |  |
| `mBox57` | money | NULL |  |  |
| `mBox58` | money | NULL |  |  |
| `mBox59` | money | NULL |  |  |

### `UB_T3_SLP_ARC`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL |  | Primary key, auto-increment identifier |
| `iTaxYear` | int | NULL |  | Integer field |
| `iPlanID` | int | NULL |  | FK to UB_Plan table - identifies the investment plan/account |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `iUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `iFileID` | int | NULL |  | FK to file record (FundServ file) |
| `iStatus` | tinyint | NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `iSubmissionStatus` | tinyint | NULL |  | Small integer/flag field |
| `iFlag` | tinyint | NULL |  | Small integer/flag field |
| `iVoid` | tinyint | NULL |  | Small integer/flag field |
| `iVoidUserID` | int | NULL |  | Integer field |
| `dtVoid` | datetime | NULL |  | Date/time field |
| `iPrinted` | tinyint | NULL |  | Small integer/flag field |
| `dtPrinted` | datetime | NULL |  | Date/time field |
| `iPrintedUserID` | int | NULL |  | Integer field |
| `iObjData` | int | NULL |  | Integer field |
| `iObjDataOrg` | int | NULL |  | Integer field |
| `iApproved` | tinyint | NULL |  | Small integer/flag field |
| `iApprovedUserID` | int | NULL |  | Integer field |
| `dtApproved` | datetime | NULL |  | Date/time field |
| `iClientViewed` | tinyint | NULL |  | Small integer/flag field |
| `dtClientViewed` | datetime | NULL |  | Date/time field |
| `Notes` | varchar(max) | NULL |  |  |
| `snm` | varchar(30) | NULL |  |  |
| `gvn_nm` | varchar(30) | NULL |  |  |
| `init` | char(1) | NULL |  |  |
| `ClientSIN` | varchar(15) | NULL |  |  |
| `addr_l1_txt` | varchar(30) | NULL |  |  |
| `addr_l2_txt` | varchar(30) | NULL |  |  |
| `cty_nm` | varchar(28) | NULL |  |  |
| `prov_cd` | char(2) | NULL |  |  |
| `cntry_cd` | char(3) | NULL |  |  |
| `pstl_cd` | varchar(10) | NULL |  |  |
| `ctrct_nbr` | varchar(12) | NULL |  |  |
| `rpt_tcd` | char(1) | NULL |  |  |
| `RecipientCode` | char(1) | NULL |  |  |
| `joint_sin` | varchar(15) | NULL |  |  |
| `mBox21` | money | NULL |  |  |
| `mBox25` | money | NULL |  |  |
| `mBox26` | money | NULL |  |  |
| `mBox34` | money | NULL |  |  |
| `mBox42` | money | NULL |  |  |
| `mBox49` | money | NULL |  |  |
| `mBox50` | money | NULL |  |  |
| `mBox51` | money | NULL |  |  |
| `dtLastModified` | datetime | NULL |  | Timestamp when record was last modified |
| `iLastModifiedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who last modified this record |
| `ClientAddressPDF` | varchar(340) | NULL |  |  |
| `FirstNamePDF` | varchar(80) | NULL |  |  |
| `LastNamePDF` | varchar(80) | NULL |  |  |
| `iType` | tinyint | NULL |  | Type/category code |
| `iClientID` | int | NULL |  | FK to UB_Client table - identifies the client/investor |
| `bCorp` | tinyint | NULL |  |  |
| `sec_snm` | varchar(20) | NULL |  |  |
| `sec_gvn_nm` | varchar(12) | NULL |  |  |
| `mBox23` | money | NULL |  |  |
| `mBox32` | money | NULL |  |  |
| `iOrgID` | int | NULL |  | Integer field |
| `rpt_tcd_org` | char(1) | NULL |  |  |
| `mBox52` | money | NULL |  |  |
| `mBox53` | money | NULL |  |  |
| `mBox54` | money | NULL |  |  |
| `mBox55` | money | NULL |  |  |
| `mBox56` | money | NULL |  |  |
| `mBox57` | money | NULL |  |  |
| `mBox58` | money | NULL |  |  |
| `mBox59` | money | NULL |  |  |

### `UB_T3_TRX`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `iSlipID` | int | NOT NULL |  | Integer field |
| `iPlanFundID` | int | NOT NULL |  | Integer field |
| `bDOD` | tinyint | NULL |  |  |

### `UB_T4A`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iMemberID` | int | NULL |  | FK to UB_Member - identifies the member/advisor |
| `iYear` | int | NULL |  | Integer field |
| `CurrencyCode` | char(3) | NULL |  |  |
| `iStatus` | tinyint | NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `iCreatedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `dtProcessing` | datetime | NULL |  | Date/time field |
| `Notes` | varchar(100) | NULL |  |  |
| `dtLastModify` | datetime | NULL |  | Date/time field |
| `iLastModifiedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who last modified this record |
| `iObjData` | int | NULL |  | Integer field |
| `Box061` | varchar(30) | NULL |  |  |
| `Box013` | varchar(30) | NULL |  |  |
| `mBox020` | money | NULL |  |  |
| `mBox048` | money | NULL |  |  |
| `mBox016` | money | NULL |  |  |
| `mBox018` | money | NULL |  |  |
| `mBox022` | money | NULL |  |  |
| `mBox024` | money | NULL |  |  |
| `BoxCase1` | varchar(3) | NULL |  |  |
| `mBoxCase1Val` | money | NULL |  |  |
| `BoxCase2` | varchar(3) | NULL |  |  |
| `mBoxCase2Val` | money | NULL |  |  |
| `BoxCase3` | varchar(3) | NULL |  |  |
| `mBoxCase3Val` | money | NULL |  |  |
| `iPrinted` | tinyint | NULL |  | Small integer/flag field |
| `dtPrinted` | datetime | NULL |  | Date/time field |
| `iSubmitted` | tinyint | NULL |  | Small integer/flag field |
| `dtSubmitted` | datetime | NULL |  | Date/time field |
| `iFileID` | int | NULL |  | FK to file record (FundServ file) |
| `DealerCode` | varchar(5) | NULL |  | Dealer code identifier |
| `ActionCode` | char(1) | NULL |  |  |

### `UB_T4A_SLP`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iTaxYear` | int | NULL |  | Integer field |
| `DealerCode` | varchar(5) | NULL |  | Dealer code identifier |
| `iMemberID` | int | NULL |  | FK to UB_Member - identifies the member/advisor |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `iUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `iFileID` | int | NULL |  | FK to file record (FundServ file) |
| `iStatus` | tinyint | NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `iSubmissionStatus` | tinyint | NULL |  | Small integer/flag field |
| `iFlag` | tinyint | NULL |  | Small integer/flag field |
| `iVoid` | tinyint | NULL |  | Small integer/flag field |
| `iVoidUserID` | int | NULL |  | Integer field |
| `dtVoid` | datetime | NULL |  | Date/time field |
| `iPrinted` | tinyint | NULL |  | Small integer/flag field |
| `dtPrinted` | datetime | NULL |  | Date/time field |
| `iPrintedUserID` | int | NULL |  | Integer field |
| `iObjData` | int | NULL |  | Integer field |
| `iObjDataOrg` | int | NULL |  | Integer field |
| `iApproved` | tinyint | NULL |  | Small integer/flag field |
| `iApprovedUserID` | int | NULL |  | Integer field |
| `dtApproved` | datetime | NULL |  | Date/time field |
| `iClientViewed` | tinyint | NULL |  | Small integer/flag field |
| `dtClientViewed` | datetime | NULL |  | Date/time field |
| `Notes` | varchar(max) | NULL |  |  |
| `FirstNamePDF` | varchar(80) | NULL |  |  |
| `LastNamePDF` | varchar(80) | NULL |  |  |
| `ClientAddressPDF` | varchar(340) | NULL |  |  |
| `dtLastModified` | datetime | NULL |  | Timestamp when record was last modified |
| `iLastModifiedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who last modified this record |
| `ClientFirstName` | varchar(30) | NULL |  |  |
| `ClientLastName` | varchar(30) | NULL |  |  |
| `ClientSIN` | varchar(15) | NULL |  |  |
| `ContractNumber` | varchar(20) | NULL |  |  |
| `Line1` | varchar(80) | NULL |  |  |
| `Line2` | varchar(80) | NULL |  |  |
| `Line3` | varchar(80) | NULL |  |  |
| `City` | varchar(50) | NULL |  |  |
| `ProvinceCode` | varchar(3) | NULL |  |  |
| `CountryCode` | varchar(3) | NULL |  |  |
| `PostalCode` | varchar(12) | NULL |  |  |
| `Box013` | varchar(30) | NULL |  |  |
| `mBox020` | money | NULL |  |  |
| `mBox048` | money | NULL |  |  |
| `mBox016` | money | NULL |  |  |
| `mBox018` | money | NULL |  |  |
| `mBox022` | money | NULL |  |  |
| `mBox024` | money | NULL |  |  |
| `BoxCase1` | varchar(3) | NULL |  |  |
| `mBoxCase1Val` | money | NULL |  |  |
| `BoxCase2` | varchar(3) | NULL |  |  |
| `mBoxCase2Val` | money | NULL |  |  |
| `BoxCase3` | varchar(3) | NULL |  |  |
| `mBoxCase3Val` | money | NULL |  |  |
| `rpt_tcd` | char(1) | NULL |  |  |
| `iSubmitted` | tinyint | NULL |  | Small integer/flag field |
| `dtSubmitted` | datetime | NULL |  | Date/time field |
| `CurrencyCode` | char(2) | NULL |  |  |
| `fXRate` | float | NULL |  | Decimal/float value |
| `bCorp` | tinyint | NULL |  |  |
| `bClient` | tinyint | NULL |  |  |
| `iOrgID` | int | NULL |  | Integer field |
| `rpt_tcd_org` | char(1) | NULL |  |  |

### `UB_T4A_SLP_ARC`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL |  | Primary key, auto-increment identifier |
| `iTaxYear` | int | NULL |  | Integer field |
| `DealerCode` | varchar(5) | NULL |  | Dealer code identifier |
| `iMemberID` | int | NULL |  | FK to UB_Member - identifies the member/advisor |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `iUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `iFileID` | int | NULL |  | FK to file record (FundServ file) |
| `iStatus` | tinyint | NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `iSubmissionStatus` | tinyint | NULL |  | Small integer/flag field |
| `iFlag` | tinyint | NULL |  | Small integer/flag field |
| `iVoid` | tinyint | NULL |  | Small integer/flag field |
| `iVoidUserID` | int | NULL |  | Integer field |
| `dtVoid` | datetime | NULL |  | Date/time field |
| `iPrinted` | tinyint | NULL |  | Small integer/flag field |
| `dtPrinted` | datetime | NULL |  | Date/time field |
| `iPrintedUserID` | int | NULL |  | Integer field |
| `iObjData` | int | NULL |  | Integer field |
| `iObjDataOrg` | int | NULL |  | Integer field |
| `iApproved` | tinyint | NULL |  | Small integer/flag field |
| `iApprovedUserID` | int | NULL |  | Integer field |
| `dtApproved` | datetime | NULL |  | Date/time field |
| `iClientViewed` | tinyint | NULL |  | Small integer/flag field |
| `dtClientViewed` | datetime | NULL |  | Date/time field |
| `Notes` | varchar(max) | NULL |  |  |
| `FirstNamePDF` | varchar(80) | NULL |  |  |
| `LastNamePDF` | varchar(80) | NULL |  |  |
| `ClientAddressPDF` | varchar(340) | NULL |  |  |
| `dtLastModified` | datetime | NULL |  | Timestamp when record was last modified |
| `iLastModifiedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who last modified this record |
| `ClientFirstName` | varchar(30) | NULL |  |  |
| `ClientLastName` | varchar(30) | NULL |  |  |
| `ClientSIN` | varchar(15) | NULL |  |  |
| `ContractNumber` | varchar(20) | NULL |  |  |
| `Line1` | varchar(80) | NULL |  |  |
| `Line2` | varchar(80) | NULL |  |  |
| `Line3` | varchar(80) | NULL |  |  |
| `City` | varchar(50) | NULL |  |  |
| `ProvinceCode` | varchar(3) | NULL |  |  |
| `CountryCode` | varchar(3) | NULL |  |  |
| `PostalCode` | varchar(12) | NULL |  |  |
| `Box013` | varchar(30) | NULL |  |  |
| `mBox020` | money | NULL |  |  |
| `mBox048` | money | NULL |  |  |
| `mBox016` | money | NULL |  |  |
| `mBox018` | money | NULL |  |  |
| `mBox022` | money | NULL |  |  |
| `mBox024` | money | NULL |  |  |
| `BoxCase1` | varchar(3) | NULL |  |  |
| `mBoxCase1Val` | money | NULL |  |  |
| `BoxCase2` | varchar(3) | NULL |  |  |
| `mBoxCase2Val` | money | NULL |  |  |
| `BoxCase3` | varchar(3) | NULL |  |  |
| `mBoxCase3Val` | money | NULL |  |  |
| `rpt_tcd` | char(1) | NULL |  |  |
| `iSubmitted` | tinyint | NULL |  | Small integer/flag field |
| `dtSubmitted` | datetime | NULL |  | Date/time field |
| `CurrencyCode` | char(2) | NULL |  |  |
| `fXRate` | float | NULL |  | Decimal/float value |
| `bCorp` | tinyint | NULL |  |  |
| `bClient` | tinyint | NULL |  |  |
| `iOrgID` | int | NULL |  | Integer field |
| `rpt_tcd_org` | char(1) | NULL |  |  |

### `UB_T4A_TRX`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `iSlipID` | int | NOT NULL |  | Integer field |
| `iSourceType` | tinyint | NOT NULL |  | Small integer/flag field |
| `iTrxID` | int | NOT NULL |  | Integer field |
| `fXRate` | float | NULL |  | Decimal/float value |

### `UB_T4AAction`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `iT4AID` | int | NULL |  | Integer field |
| `ActionCode` | char(1) | NULL |  |  |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `iUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |

### `UB_T4ADetail`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iT4AID` | int | NULL |  | Integer field |
| `mAmount` | money | NULL |  | Monetary amount |
| `dtEffective` | datetime | NULL |  | Effective date |
| `Description` | varchar(100) | NULL |  |  |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `iCreatedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |

### `UB_T4FHSA_SLP`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iTaxYear` | int | NULL |  | Integer field |
| `iPlanID` | int | NULL |  | FK to UB_Plan table - identifies the investment plan/account |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `iUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `iFileID` | int | NULL |  | FK to file record (FundServ file) |
| `iStatus` | tinyint | NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `iSubmissionStatus` | tinyint | NULL |  | Small integer/flag field |
| `iFlag` | tinyint | NULL |  | Small integer/flag field |
| `iVoid` | tinyint | NULL |  | Small integer/flag field |
| `iVoidUserID` | int | NULL |  | Integer field |
| `dtVoid` | datetime | NULL |  | Date/time field |
| `iPrinted` | tinyint | NULL |  | Small integer/flag field |
| `dtPrinted` | datetime | NULL |  | Date/time field |
| `iPrintedUserID` | int | NULL |  | Integer field |
| `iObjData` | int | NULL |  | Integer field |
| `iObjDataOrg` | int | NULL |  | Integer field |
| `iApproved` | tinyint | NULL |  | Small integer/flag field |
| `iApprovedUserID` | int | NULL |  | Integer field |
| `dtApproved` | datetime | NULL |  | Date/time field |
| `iClientViewed` | tinyint | NULL |  | Small integer/flag field |
| `dtClientViewed` | datetime | NULL |  | Date/time field |
| `Notes` | varchar(max) | NULL |  |  |
| `snm` | varchar(20) | NULL |  |  |
| `gvn_nm` | varchar(20) | NULL |  |  |
| `init` | char(1) | NULL |  |  |
| `ClientSIN` | varchar(15) | NULL |  |  |
| `addr_l1_txt` | varchar(30) | NULL |  |  |
| `addr_l2_txt` | varchar(30) | NULL |  |  |
| `cty_nm` | varchar(28) | NULL |  |  |
| `prov_cd` | char(2) | NULL |  |  |
| `cntry_cd` | char(3) | NULL |  |  |
| `pstl_cd` | varchar(10) | NULL |  |  |
| `ctrct_nbr` | varchar(12) | NULL |  |  |
| `rpt_tcd` | char(1) | NULL |  |  |
| `m_ContributionAmount` | money | NULL |  |  |
| `m_FHSADeemedTransferAmount` | money | NULL |  |  |
| `m_QualifyingWithdrawalAmount` | money | NULL |  |  |
| `m_TaxableWithdrawalAmount` | money | NULL |  |  |
| `m_IncomeTaxDeductedAmount` | money | NULL |  |  |
| `m_FHSATransferInAmount` | money | NULL |  |  |
| `m_FHSATransferOutAmount` | money | NULL |  |  |
| `m_RRSPTransferInAmount` | money | NULL |  |  |
| `m_SpousalRRSPTransferInAmount` | money | NULL |  |  |
| `m_RRSPRRIFTransferOutAmount` | money | NULL |  |  |
| `m_DesignatedRRSPRRIFTransferOutAmount` | money | NULL |  |  |
| `m_DesignatedWithdrawalAmount` | money | NULL |  |  |
| `m_FHSABeneficiaryDistributionOutAmount` | money | NULL |  |  |
| `m_FHSABeneficiaryDistributionReceivedAmount` | money | NULL |  |  |
| `m_FHSATransferOutToSurvivorAmount` | money | NULL |  |  |
| `m_RRSPRRIFTransferOutToSurvivorAmount` | money | NULL |  |  |
| `m_SurvivorFHSATransferInAmount` | money | NULL |  |  |
| `m_FHSACessationHolderDeemedReceivedAmount` | money | NULL |  |  |
| `m_SecurityForALoanAmount` | money | NULL |  |  |
| `m_NonQualifiedInvestmentAcquisitionAmount` | money | NULL |  |  |
| `m_NonQualifiedInvestmentDispositionAmount` | money | NULL |  |  |
| `m_MarriageBreakdownFHSATransferInAmount` | money | NULL |  |  |
| `m_MarriageBreakdownFHSATransferOutAmount` | money | NULL |  |  |
| `m_MarriageBreakdownRRSPRRIFTransferOutAmount` | money | NULL |  |  |
| `dtLastModified` | datetime | NULL |  | Timestamp when record was last modified |
| `iLastModifiedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who last modified this record |
| `ClientAddressPDF` | varchar(340) | NULL |  |  |
| `FirstNamePDF` | varchar(80) | NULL |  |  |
| `LastNamePDF` | varchar(80) | NULL |  |  |
| `iType` | tinyint | NULL |  | Type/category code |
| `iClientID` | int | NULL |  | FK to UB_Client table - identifies the client/investor |
| `iTrustID` | int | NULL |  | Integer field |
| `iPlanID2` | int | NULL |  | Integer field |
| `iOrgID` | int | NULL |  | Integer field |
| `rpt_tcd_org` | char(1) | NULL |  |  |
| `mMKV` | money | NULL |  |  |
| `dtDOB` | datetime | NULL |  | Date of birth |
| `dtDOD` | datetime | NULL |  | Date/time field |
| `NewAccount` | char(1) | NULL |  |  |
| `iTrxCount` | int | NULL |  | Integer field |
| `CloseAccount` | char(1) | NULL |  |  |
| `mMKVD` | money | NULL |  |  |
| `dtClose` | datetime | NULL |  | Date/time field |

### `UB_T4FHSA_SLP_ARC`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL |  | Primary key, auto-increment identifier |
| `iTaxYear` | int | NULL |  | Integer field |
| `iPlanID` | int | NULL |  | FK to UB_Plan table - identifies the investment plan/account |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `iUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `iFileID` | int | NULL |  | FK to file record (FundServ file) |
| `iStatus` | tinyint | NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `iSubmissionStatus` | tinyint | NULL |  | Small integer/flag field |
| `iFlag` | tinyint | NULL |  | Small integer/flag field |
| `iVoid` | tinyint | NULL |  | Small integer/flag field |
| `iVoidUserID` | int | NULL |  | Integer field |
| `dtVoid` | datetime | NULL |  | Date/time field |
| `iPrinted` | tinyint | NULL |  | Small integer/flag field |
| `dtPrinted` | datetime | NULL |  | Date/time field |
| `iPrintedUserID` | int | NULL |  | Integer field |
| `iObjData` | int | NULL |  | Integer field |
| `iObjDataOrg` | int | NULL |  | Integer field |
| `iApproved` | tinyint | NULL |  | Small integer/flag field |
| `iApprovedUserID` | int | NULL |  | Integer field |
| `dtApproved` | datetime | NULL |  | Date/time field |
| `iClientViewed` | tinyint | NULL |  | Small integer/flag field |
| `dtClientViewed` | datetime | NULL |  | Date/time field |
| `Notes` | varchar(max) | NULL |  |  |
| `snm` | varchar(20) | NULL |  |  |
| `gvn_nm` | varchar(20) | NULL |  |  |
| `init` | char(1) | NULL |  |  |
| `ClientSIN` | varchar(15) | NULL |  |  |
| `addr_l1_txt` | varchar(30) | NULL |  |  |
| `addr_l2_txt` | varchar(30) | NULL |  |  |
| `cty_nm` | varchar(28) | NULL |  |  |
| `prov_cd` | char(2) | NULL |  |  |
| `cntry_cd` | char(3) | NULL |  |  |
| `pstl_cd` | varchar(10) | NULL |  |  |
| `ctrct_nbr` | varchar(12) | NULL |  |  |
| `rpt_tcd` | char(1) | NULL |  |  |
| `m_ContributionAmount` | money | NULL |  |  |
| `m_FHSADeemedTransferAmount` | money | NULL |  |  |
| `m_QualifyingWithdrawalAmount` | money | NULL |  |  |
| `m_TaxableWithdrawalAmount` | money | NULL |  |  |
| `m_IncomeTaxDeductedAmount` | money | NULL |  |  |
| `m_FHSATransferInAmount` | money | NULL |  |  |
| `m_FHSATransferOutAmount` | money | NULL |  |  |
| `m_RRSPTransferInAmount` | money | NULL |  |  |
| `m_SpousalRRSPTransferInAmount` | money | NULL |  |  |
| `m_RRSPRRIFTransferOutAmount` | money | NULL |  |  |
| `m_DesignatedRRSPRRIFTransferOutAmount` | money | NULL |  |  |
| `m_DesignatedWithdrawalAmount` | money | NULL |  |  |
| `m_FHSABeneficiaryDistributionOutAmount` | money | NULL |  |  |
| `m_FHSABeneficiaryDistributionReceivedAmount` | money | NULL |  |  |
| `m_FHSATransferOutToSurvivorAmount` | money | NULL |  |  |
| `m_RRSPRRIFTransferOutToSurvivorAmount` | money | NULL |  |  |
| `m_SurvivorFHSATransferInAmount` | money | NULL |  |  |
| `m_FHSACessationHolderDeemedReceivedAmount` | money | NULL |  |  |
| `m_SecurityForALoanAmount` | money | NULL |  |  |
| `m_NonQualifiedInvestmentAcquisitionAmount` | money | NULL |  |  |
| `m_NonQualifiedInvestmentDispositionAmount` | money | NULL |  |  |
| `m_MarriageBreakdownFHSATransferInAmount` | money | NULL |  |  |
| `m_MarriageBreakdownFHSATransferOutAmount` | money | NULL |  |  |
| `m_MarriageBreakdownRRSPRRIFTransferOutAmount` | money | NULL |  |  |
| `dtLastModified` | datetime | NULL |  | Timestamp when record was last modified |
| `iLastModifiedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who last modified this record |
| `ClientAddressPDF` | varchar(340) | NULL |  |  |
| `FirstNamePDF` | varchar(80) | NULL |  |  |
| `LastNamePDF` | varchar(80) | NULL |  |  |
| `iType` | tinyint | NULL |  | Type/category code |
| `iClientID` | int | NULL |  | FK to UB_Client table - identifies the client/investor |
| `iTrustID` | int | NULL |  | Integer field |
| `iPlanID2` | int | NULL |  | Integer field |
| `iOrgID` | int | NULL |  | Integer field |
| `rpt_tcd_org` | char(1) | NULL |  |  |
| `mMKV` | money | NULL |  |  |
| `dtDOB` | datetime | NULL |  | Date of birth |
| `dtDOD` | datetime | NULL |  | Date/time field |
| `NewAccount` | char(1) | NULL |  |  |
| `iTrxCount` | int | NULL |  | Integer field |
| `CloseAccount` | char(1) | NULL |  |  |
| `mMKVD` | money | NULL |  |  |
| `dtClose` | datetime | NULL |  | Date/time field |

### `UB_T4FHSA_TRX`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iSlipID` | int | NULL |  | Integer field |
| `iYear` | int | NULL |  | Integer field |
| `iPlanID` | int | NULL |  | FK to UB_Plan table - identifies the investment plan/account |
| `dtTrx` | datetime | NULL |  | Date/time field |
| `iTrustTrxID` | int | NULL |  | Integer field |
| `iType` | tinyint | NULL |  | Type/category code |
| `iType2` | tinyint | NULL |  | Small integer/flag field |
| `iDepositType` | tinyint | NULL |  | Small integer/flag field |
| `ContrWdrCode` | char(1) | NULL |  |  |
| `mAmount` | money | NULL |  | Monetary amount |
| `mMKVBeforeTrnsf` | money | NULL |  |  |
| `AccountHolderFormerSpouseLName` | varchar(30) | NULL |  |  |
| `AccountHolderFormerSpouseFName` | varchar(30) | NULL |  |  |
| `AccountHolderFormerSpouseSIN` | varchar(15) | NULL |  |  |

### `UB_T4FHSA_TRX_ARC`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL |  | Primary key, auto-increment identifier |
| `iSlipID` | int | NULL |  | Integer field |
| `iYear` | int | NULL |  | Integer field |
| `iPlanID` | int | NULL |  | FK to UB_Plan table - identifies the investment plan/account |
| `dtTrx` | datetime | NULL |  | Date/time field |
| `m_ContributionAmount` | money | NULL |  |  |
| `m_FHSADeemedTransferAmount` | money | NULL |  |  |
| `m_QualifyingWithdrawalAmount` | money | NULL |  |  |
| `m_TaxableWithdrawalAmount` | money | NULL |  |  |
| `m_IncomeTaxDeductedAmount` | money | NULL |  |  |
| `m_FHSATransferInAmount` | money | NULL |  |  |
| `m_FairMarketValueImmediatelyPriorTransferOut` | money | NULL |  |  |
| `m_FHSATransferOutAmount` | money | NULL |  |  |
| `m_RRSPTransferInAmount` | money | NULL |  |  |
| `m_SpousalRRSPTransferInAmount` | money | NULL |  |  |
| `m_RRSPRRIFTransferOutAmount` | money | NULL |  |  |
| `m_DesignatedRRSPRRIFTransferOutAmount` | money | NULL |  |  |
| `m_DesignatedWithdrawalAmount` | money | NULL |  |  |
| `m_FHSABeneficiaryDistributionOutAmount` | money | NULL |  |  |
| `m_FHSABeneficiaryDistributionReceivedAmount` | money | NULL |  |  |
| `m_FHSATransferOutToSurvivorAmount` | money | NULL |  |  |
| `m_RRSPRRIFTransferOutToSurvivorAmount` | money | NULL |  |  |
| `m_SurvivorFHSATransferInAmount` | money | NULL |  |  |
| `m_FHSACessationHolderDeemedReceivedAmount` | money | NULL |  |  |
| `m_SecurityForALoanAmount` | money | NULL |  |  |
| `m_NonQualifiedInvestmentAcquisitionAmount` | money | NULL |  |  |
| `m_NonQualifiedInvestmentDispositionAmount` | money | NULL |  |  |
| `m_AccountHolderFormerSpouseLName` | varchar(30) | NULL |  |  |
| `m_AccountHolderFormerSpouseFName` | varchar(30) | NULL |  |  |
| `m_AccountHolderFormerSpouseSIN` | varchar(15) | NULL |  |  |
| `m_MarriageBreakdownFHSATransferInAmount` | money | NULL |  |  |
| `m_MarriageBreakdownFHSATransferOutAmount` | money | NULL |  |  |
| `m_MarriageBreakdownRRSPRRIFTransferOutAmount` | money | NULL |  |  |

### `UB_T4RIF`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iPlanID` | int | NULL |  | FK to UB_Plan table - identifies the investment plan/account |
| `iYear` | int | NULL |  | Integer field |
| `CurrencyCode` | char(3) | NULL |  |  |
| `iStatus` | tinyint | NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `iCreatedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `dtProcessing` | datetime | NULL |  | Date/time field |
| `Notes` | varchar(100) | NULL |  |  |
| `dtLastModify` | datetime | NULL |  | Date/time field |
| `iLastModifiedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who last modified this record |
| `iObjData` | int | NULL |  | Integer field |
| `mGross` | money | NULL |  |  |
| `mNet` | money | NULL |  |  |
| `mTax` | money | NULL |  |  |
| `iPrinted` | tinyint | NULL |  | Small integer/flag field |
| `dtPrinted` | datetime | NULL |  | Date/time field |
| `iSubmitted` | tinyint | NULL |  | Small integer/flag field |
| `dtSubmitted` | datetime | NULL |  | Date/time field |
| `iFileID` | int | NULL |  | FK to file record (FundServ file) |
| `DealerCode` | varchar(5) | NULL |  | Dealer code identifier |
| `ActionCode` | char(1) | NULL |  |  |
| `SIN` | varchar(15) | NULL |  |  |
| `bSpouse` | tinyint | NULL |  |  |
| `SpouseSIN` | varchar(15) | NULL |  |  |
| `ClientFirstName` | varchar(80) | NULL |  |  |
| `ClientLastName` | varchar(80) | NULL |  |  |
| `ClientAddress` | varchar(340) | NULL |  |  |
| `ContractNumber` | varchar(20) | NULL |  |  |
| `AccountNumber` | varchar(20) | NULL |  |  |
| `dtDOD` | datetime | NULL |  | Date/time field |
| `mBox16` | money | NULL |  |  |
| `mBox18` | money | NULL |  |  |
| `mBox20` | money | NULL |  |  |
| `mBox22` | money | NULL |  |  |
| `mBox24` | money | NULL |  |  |
| `mBox28` | money | NULL |  |  |
| `mBox35` | money | NULL |  |  |
| `mBox36` | money | NULL |  |  |
| `mTaxP` | money | NULL |  |  |

### `UB_T4RIF_SLP`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iTaxYear` | int | NULL |  | Integer field |
| `iPlanID` | int | NULL |  | FK to UB_Plan table - identifies the investment plan/account |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `iUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `iFileID` | int | NULL |  | FK to file record (FundServ file) |
| `iStatus` | tinyint | NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `iSubmissionStatus` | tinyint | NULL |  | Small integer/flag field |
| `iFlag` | tinyint | NULL |  | Small integer/flag field |
| `iVoid` | tinyint | NULL |  | Small integer/flag field |
| `iVoidUserID` | int | NULL |  | Integer field |
| `dtVoid` | datetime | NULL |  | Date/time field |
| `iPrinted` | tinyint | NULL |  | Small integer/flag field |
| `dtPrinted` | datetime | NULL |  | Date/time field |
| `iPrintedUserID` | int | NULL |  | Integer field |
| `iObjData` | int | NULL |  | Integer field |
| `iObjDataOrg` | int | NULL |  | Integer field |
| `iApproved` | tinyint | NULL |  | Small integer/flag field |
| `iApprovedUserID` | int | NULL |  | Integer field |
| `dtApproved` | datetime | NULL |  | Date/time field |
| `iClientViewed` | tinyint | NULL |  | Small integer/flag field |
| `dtClientViewed` | datetime | NULL |  | Date/time field |
| `Notes` | varchar(max) | NULL |  |  |
| `snm` | varchar(20) | NULL |  |  |
| `gvn_nm` | varchar(20) | NULL |  |  |
| `init` | char(1) | NULL |  |  |
| `ClientSIN` | varchar(15) | NULL |  |  |
| `addr_l1_txt` | varchar(30) | NULL |  |  |
| `addr_l2_txt` | varchar(30) | NULL |  |  |
| `cty_nm` | varchar(28) | NULL |  |  |
| `prov_cd` | char(2) | NULL |  |  |
| `cntry_cd` | char(3) | NULL |  |  |
| `pstl_cd` | varchar(10) | NULL |  |  |
| `ctrct_nbr` | varchar(12) | NULL |  |  |
| `rpt_tcd` | char(1) | NULL |  |  |
| `sps_cntrb_ind` | char(1) | NULL |  |  |
| `sps_sin` | varchar(15) | NULL |  |  |
| `dtDOB` | datetime | NULL |  | Date of birth |
| `dtDOD` | datetime | NULL |  | Date/time field |
| `m_tx_amt` | money | NULL |  |  |
| `m_deem_dces_amt` | money | NULL |  |  |
| `m_deem_drgst_amt` | money | NULL |  |  |
| `m_oth_inc_dedn_amt` | money | NULL |  |  |
| `m_excs_amt` | money | NULL |  |  |
| `m_tx_ddct_amt` | money | NULL |  |  |
| `m_tx_pay_amt` | money | NULL |  |  |
| `m_mrrg_bkdn_tramt` | money | NULL |  |  |
| `FirstNamePDF` | varchar(80) | NULL |  |  |
| `LastNamePDF` | varchar(80) | NULL |  |  |
| `ClientAddressPDF` | varchar(340) | NULL |  |  |
| `mMinAmount` | money | NULL |  |  |
| `dtLastModified` | datetime | NULL |  | Timestamp when record was last modified |
| `iLastModifiedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who last modified this record |
| `m_rrif_alda_amt` | money | NULL |  |  |
| `iTrustID` | int | NULL |  | Integer field |
| `iType` | tinyint | NULL |  | Type/category code |
| `iPlanID2` | int | NULL |  | Integer field |
| `iOrgID` | int | NULL |  | Integer field |
| `rpt_tcd_org` | char(1) | NULL |  |  |
| `mMKV` | money | NULL |  |  |
| `iNoTrx` | tinyint | NULL |  | Small integer/flag field |

### `UB_T4RIF_SLP_ARC`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL |  | Primary key, auto-increment identifier |
| `iTaxYear` | int | NULL |  | Integer field |
| `iPlanID` | int | NULL |  | FK to UB_Plan table - identifies the investment plan/account |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `iUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `iFileID` | int | NULL |  | FK to file record (FundServ file) |
| `iStatus` | tinyint | NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `iSubmissionStatus` | tinyint | NULL |  | Small integer/flag field |
| `iFlag` | tinyint | NULL |  | Small integer/flag field |
| `iVoid` | tinyint | NULL |  | Small integer/flag field |
| `iVoidUserID` | int | NULL |  | Integer field |
| `dtVoid` | datetime | NULL |  | Date/time field |
| `iPrinted` | tinyint | NULL |  | Small integer/flag field |
| `dtPrinted` | datetime | NULL |  | Date/time field |
| `iPrintedUserID` | int | NULL |  | Integer field |
| `iObjData` | int | NULL |  | Integer field |
| `iObjDataOrg` | int | NULL |  | Integer field |
| `iApproved` | tinyint | NULL |  | Small integer/flag field |
| `iApprovedUserID` | int | NULL |  | Integer field |
| `dtApproved` | datetime | NULL |  | Date/time field |
| `iClientViewed` | tinyint | NULL |  | Small integer/flag field |
| `dtClientViewed` | datetime | NULL |  | Date/time field |
| `Notes` | varchar(max) | NULL |  |  |
| `snm` | varchar(20) | NULL |  |  |
| `gvn_nm` | varchar(20) | NULL |  |  |
| `init` | char(1) | NULL |  |  |
| `ClientSIN` | varchar(15) | NULL |  |  |
| `addr_l1_txt` | varchar(30) | NULL |  |  |
| `addr_l2_txt` | varchar(30) | NULL |  |  |
| `cty_nm` | varchar(28) | NULL |  |  |
| `prov_cd` | char(2) | NULL |  |  |
| `cntry_cd` | char(3) | NULL |  |  |
| `pstl_cd` | varchar(10) | NULL |  |  |
| `ctrct_nbr` | varchar(12) | NULL |  |  |
| `rpt_tcd` | char(1) | NULL |  |  |
| `sps_cntrb_ind` | char(1) | NULL |  |  |
| `sps_sin` | varchar(15) | NULL |  |  |
| `dtDOB` | datetime | NULL |  | Date of birth |
| `dtDOD` | datetime | NULL |  | Date/time field |
| `m_tx_amt` | money | NULL |  |  |
| `m_deem_dces_amt` | money | NULL |  |  |
| `m_deem_drgst_amt` | money | NULL |  |  |
| `m_oth_inc_dedn_amt` | money | NULL |  |  |
| `m_excs_amt` | money | NULL |  |  |
| `m_tx_ddct_amt` | money | NULL |  |  |
| `m_tx_pay_amt` | money | NULL |  |  |
| `m_mrrg_bkdn_tramt` | money | NULL |  |  |
| `FirstNamePDF` | varchar(80) | NULL |  |  |
| `LastNamePDF` | varchar(80) | NULL |  |  |
| `ClientAddressPDF` | varchar(340) | NULL |  |  |
| `mMinAmount` | money | NULL |  |  |
| `dtLastModified` | datetime | NULL |  | Timestamp when record was last modified |
| `iLastModifiedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who last modified this record |
| `m_rrif_alda_amt` | money | NULL |  |  |
| `iTrustID` | int | NULL |  | Integer field |
| `iType` | tinyint | NULL |  | Type/category code |
| `iPlanID2` | int | NULL |  | Integer field |
| `iOrgID` | int | NULL |  | Integer field |
| `rpt_tcd_org` | char(1) | NULL |  |  |
| `mMKV` | money | NULL |  |  |
| `iNoTrx` | tinyint | NULL |  | Small integer/flag field |

### `UB_T4RIF_TRX`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `iSlipID` | int | NOT NULL |  | Integer field |
| `iTrustTrxID` | int | NOT NULL |  | Integer field |

### `UB_T4RIFAction`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `iT4RIFID` | int | NULL |  | Integer field |
| `ActionCode` | char(1) | NULL |  |  |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `iUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |

### `UB_T4RIFObj`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL |  | Primary key, auto-increment identifier |
| `iObjData` | int | NOT NULL |  | Integer field |
| `iUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |

### `UB_T4RSP`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iPlanID` | int | NULL |  | FK to UB_Plan table - identifies the investment plan/account |
| `iYear` | int | NULL |  | Integer field |
| `CurrencyCode` | char(3) | NULL |  |  |
| `iStatus` | tinyint | NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `iCreatedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `dtProcessing` | datetime | NULL |  | Date/time field |
| `Notes` | varchar(100) | NULL |  |  |
| `dtLastModify` | datetime | NULL |  | Date/time field |
| `iLastModifiedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who last modified this record |
| `iObjData` | int | NULL |  | Integer field |
| `mGross` | money | NULL |  |  |
| `mNet` | money | NULL |  |  |
| `mTax` | money | NULL |  |  |
| `iPrinted` | tinyint | NULL |  | Small integer/flag field |
| `dtPrinted` | datetime | NULL |  | Date/time field |
| `iSubmitted` | tinyint | NULL |  | Small integer/flag field |
| `dtSubmitted` | datetime | NULL |  | Date/time field |
| `iFileID` | int | NULL |  | FK to file record (FundServ file) |
| `DealerCode` | varchar(5) | NULL |  | Dealer code identifier |
| `ActionCode` | char(1) | NULL |  |  |
| `SIN` | varchar(15) | NULL |  |  |
| `bSpouse` | tinyint | NULL |  |  |
| `SpouseSIN` | varchar(15) | NULL |  |  |
| `ClientFirstName` | varchar(80) | NULL |  |  |
| `ClientLastName` | varchar(80) | NULL |  |  |
| `ClientAddress` | varchar(340) | NULL |  |  |
| `AccountNumber` | varchar(20) | NULL |  |  |
| `mBox16` | money | NULL |  |  |
| `mBox18` | money | NULL |  |  |
| `mBox20` | money | NULL |  |  |
| `mBox22` | money | NULL |  |  |
| `mBox25` | money | NULL |  |  |
| `mBox26` | money | NULL |  |  |
| `mBox27` | money | NULL |  |  |
| `mBox28` | money | NULL |  |  |
| `mBox30` | money | NULL |  |  |
| `mBox34` | money | NULL |  |  |
| `mBox35` | money | NULL |  |  |
| `mBox40` | money | NULL |  |  |
| `ContractNumber` | varchar(20) | NULL |  |  |
| `mTaxP` | money | NULL |  |  |

### `UB_T4RSP_SLP`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iTaxYear` | int | NULL |  | Integer field |
| `iPlanID` | int | NULL |  | FK to UB_Plan table - identifies the investment plan/account |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `iUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `iFileID` | int | NULL |  | FK to file record (FundServ file) |
| `iStatus` | tinyint | NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `iSubmissionStatus` | tinyint | NULL |  | Small integer/flag field |
| `iFlag` | tinyint | NULL |  | Small integer/flag field |
| `iVoid` | tinyint | NULL |  | Small integer/flag field |
| `iVoidUserID` | int | NULL |  | Integer field |
| `dtVoid` | datetime | NULL |  | Date/time field |
| `iPrinted` | tinyint | NULL |  | Small integer/flag field |
| `dtPrinted` | datetime | NULL |  | Date/time field |
| `iPrintedUserID` | int | NULL |  | Integer field |
| `iObjData` | int | NULL |  | Integer field |
| `iObjDataOrg` | int | NULL |  | Integer field |
| `iApproved` | tinyint | NULL |  | Small integer/flag field |
| `iApprovedUserID` | int | NULL |  | Integer field |
| `dtApproved` | datetime | NULL |  | Date/time field |
| `iClientViewed` | tinyint | NULL |  | Small integer/flag field |
| `dtClientViewed` | datetime | NULL |  | Date/time field |
| `Notes` | varchar(max) | NULL |  |  |
| `snm` | varchar(20) | NULL |  |  |
| `gvn_nm` | varchar(20) | NULL |  |  |
| `init` | char(1) | NULL |  |  |
| `ClientSIN` | varchar(15) | NULL |  |  |
| `addr_l1_txt` | varchar(30) | NULL |  |  |
| `addr_l2_txt` | varchar(30) | NULL |  |  |
| `cty_nm` | varchar(28) | NULL |  |  |
| `prov_cd` | char(2) | NULL |  |  |
| `cntry_cd` | char(3) | NULL |  |  |
| `pstl_cd` | varchar(10) | NULL |  |  |
| `ctrct_nbr` | varchar(12) | NULL |  |  |
| `rpt_tcd` | char(1) | NULL |  |  |
| `sps_cntrb_ind` | char(1) | NULL |  |  |
| `sps_sin` | varchar(15) | NULL |  |  |
| `m_annty_pay_amt` | money | NULL |  |  |
| `m_rfnd_prem_amt` | money | NULL |  |  |
| `m_rfnd_excs_amt` | money | NULL |  |  |
| `m_wdrw_pay_amt` | money | NULL |  |  |
| `m_deem_rcpt_dth_amt` | money | NULL |  |  |
| `m_deem_drgst_amt` | money | NULL |  |  |
| `m_oth_inc_dedn_amt` | money | NULL |  |  |
| `m_tx_ddct_amt` | money | NULL |  |  |
| `m_tx_pay_amt` | money | NULL |  |  |
| `m_llp_wdrw_amt` | money | NULL |  |  |
| `m_hbp_rrsp_wdrw_amt` | money | NULL |  |  |
| `m_mrrg_bkdn_tramt` | money | NULL |  |  |
| `dtLastModified` | datetime | NULL |  | Timestamp when record was last modified |
| `iLastModifiedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who last modified this record |
| `ClientAddressPDF` | varchar(340) | NULL |  |  |
| `FirstNamePDF` | varchar(80) | NULL |  |  |
| `LastNamePDF` | varchar(80) | NULL |  |  |
| `iType` | tinyint | NULL |  | Type/category code |
| `iClientID` | int | NULL |  | FK to UB_Client table - identifies the client/investor |
| `m_rrsp_alda_amt` | money | NULL |  |  |
| `iTrustID` | int | NULL |  | Integer field |
| `iPlanID2` | int | NULL |  | Integer field |
| `iOrgID` | int | NULL |  | Integer field |
| `rpt_tcd_org` | char(1) | NULL |  |  |
| `mMKV` | money | NULL |  |  |
| `iNoTrx` | tinyint | NULL |  | Small integer/flag field |

### `UB_T4RSP_SLP_ARC`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL |  | Primary key, auto-increment identifier |
| `iTaxYear` | int | NULL |  | Integer field |
| `iPlanID` | int | NULL |  | FK to UB_Plan table - identifies the investment plan/account |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `iUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `iFileID` | int | NULL |  | FK to file record (FundServ file) |
| `iStatus` | tinyint | NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `iSubmissionStatus` | tinyint | NULL |  | Small integer/flag field |
| `iFlag` | tinyint | NULL |  | Small integer/flag field |
| `iVoid` | tinyint | NULL |  | Small integer/flag field |
| `iVoidUserID` | int | NULL |  | Integer field |
| `dtVoid` | datetime | NULL |  | Date/time field |
| `iPrinted` | tinyint | NULL |  | Small integer/flag field |
| `dtPrinted` | datetime | NULL |  | Date/time field |
| `iPrintedUserID` | int | NULL |  | Integer field |
| `iObjData` | int | NULL |  | Integer field |
| `iObjDataOrg` | int | NULL |  | Integer field |
| `iApproved` | tinyint | NULL |  | Small integer/flag field |
| `iApprovedUserID` | int | NULL |  | Integer field |
| `dtApproved` | datetime | NULL |  | Date/time field |
| `iClientViewed` | tinyint | NULL |  | Small integer/flag field |
| `dtClientViewed` | datetime | NULL |  | Date/time field |
| `Notes` | varchar(max) | NULL |  |  |
| `snm` | varchar(20) | NULL |  |  |
| `gvn_nm` | varchar(20) | NULL |  |  |
| `init` | char(1) | NULL |  |  |
| `ClientSIN` | varchar(15) | NULL |  |  |
| `addr_l1_txt` | varchar(30) | NULL |  |  |
| `addr_l2_txt` | varchar(30) | NULL |  |  |
| `cty_nm` | varchar(28) | NULL |  |  |
| `prov_cd` | char(2) | NULL |  |  |
| `cntry_cd` | char(3) | NULL |  |  |
| `pstl_cd` | varchar(10) | NULL |  |  |
| `ctrct_nbr` | varchar(12) | NULL |  |  |
| `rpt_tcd` | char(1) | NULL |  |  |
| `sps_cntrb_ind` | char(1) | NULL |  |  |
| `sps_sin` | varchar(15) | NULL |  |  |
| `m_annty_pay_amt` | money | NULL |  |  |
| `m_rfnd_prem_amt` | money | NULL |  |  |
| `m_rfnd_excs_amt` | money | NULL |  |  |
| `m_wdrw_pay_amt` | money | NULL |  |  |
| `m_deem_rcpt_dth_amt` | money | NULL |  |  |
| `m_deem_drgst_amt` | money | NULL |  |  |
| `m_oth_inc_dedn_amt` | money | NULL |  |  |
| `m_tx_ddct_amt` | money | NULL |  |  |
| `m_tx_pay_amt` | money | NULL |  |  |
| `m_llp_wdrw_amt` | money | NULL |  |  |
| `m_hbp_rrsp_wdrw_amt` | money | NULL |  |  |
| `m_mrrg_bkdn_tramt` | money | NULL |  |  |
| `ClientAddressPDF` | varchar(340) | NULL |  |  |
| `FirstNamePDF` | varchar(80) | NULL |  |  |
| `LastNamePDF` | varchar(80) | NULL |  |  |
| `dtLastModified` | datetime | NULL |  | Timestamp when record was last modified |
| `iLastModifiedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who last modified this record |
| `iType` | tinyint | NULL |  | Type/category code |
| `iClientID` | int | NULL |  | FK to UB_Client table - identifies the client/investor |
| `m_rrsp_alda_amt` | money | NULL |  |  |
| `iTrustID` | int | NULL |  | Integer field |
| `iPlanID2` | int | NULL |  | Integer field |
| `iOrgID` | int | NULL |  | Integer field |
| `rpt_tcd_org` | char(1) | NULL |  |  |
| `mMKV` | money | NULL |  |  |
| `iNoTrx` | tinyint | NULL |  | Small integer/flag field |

### `UB_T4RSP_TRX`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `iSlipID` | int | NOT NULL |  | Integer field |
| `iTrustTrxID` | int | NOT NULL |  | Integer field |

### `UB_T4RSPAction`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `iT4RSPID` | int | NULL |  | Integer field |
| `ActionCode` | char(1) | NULL |  |  |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `iUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |

### `UB_T5_Omnibus`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iTaxYear` | int | NULL |  | Integer field |
| `MgmtCode` | varchar(5) | NULL |  | Management company code |
| `FundID` | varchar(8) | NULL |  | Fund identifier code (e.g., DYN 3056) |
| `mBox10` | money | NULL |  |  |
| `mBox11` | money | NULL |  |  |
| `mBox12` | money | NULL |  |  |
| `mBox13` | money | NULL |  |  |
| `mBox14` | money | NULL |  |  |
| `mBox15` | money | NULL |  |  |
| `mBox16` | money | NULL |  |  |
| `mBox17` | money | NULL |  |  |
| `mBox18` | money | NULL |  |  |
| `mBox19` | money | NULL |  |  |
| `mBox20` | money | NULL |  |  |
| `mBox24` | money | NULL |  |  |
| `mBox25` | money | NULL |  |  |
| `mBox26` | money | NULL |  |  |
| `mBox30` | money | NULL |  |  |
| `mBox40` | money | NULL |  |  |
| `mBox41` | money | NULL |  |  |
| `mTotalDividend` | money | NULL |  |  |
| `fFactor_10` | float | NULL |  | Decimal/float value |
| `fFactor_11` | float | NULL |  | Decimal/float value |
| `fFactor_12` | float | NULL |  | Decimal/float value |
| `fFactor_13` | float | NULL |  | Decimal/float value |
| `fFactor_14` | float | NULL |  | Decimal/float value |
| `fFactor_15` | float | NULL |  | Decimal/float value |
| `fFactor_16` | float | NULL |  | Decimal/float value |
| `fFactor_17` | float | NULL |  | Decimal/float value |
| `fFactor_18` | float | NULL |  | Decimal/float value |
| `fFactor_19` | float | NULL |  | Decimal/float value |
| `fFactor_20` | float | NULL |  | Decimal/float value |
| `fFactor_24` | float | NULL |  | Decimal/float value |
| `fFactor_25` | float | NULL |  | Decimal/float value |
| `fFactor_26` | float | NULL |  | Decimal/float value |
| `fFactor_30` | float | NULL |  | Decimal/float value |
| `fFactor_40` | float | NULL |  | Decimal/float value |
| `fFactor_41` | float | NULL |  | Decimal/float value |
| `dtProcess` | datetime | NULL |  | Date/time field |
| `dtLastModified` | datetime | NULL |  | Timestamp when record was last modified |
| `iLastModifiedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who last modified this record |
| `iStatus` | tinyint | NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `mBox34` | money | NULL |  |  |
| `fFactor_34` | float | NULL |  | Decimal/float value |
| `mTotalUnit` | float | NULL |  | Monetary value |

### `UB_T5_PlanFund`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iTaxYear` | int | NULL |  | Integer field |
| `iPlanID` | int | NULL |  | FK to UB_Plan table - identifies the investment plan/account |
| `iStatus` | tinyint | NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `MgmtCode` | varchar(5) | NULL |  | Management company code |
| `FundID` | varchar(8) | NULL |  | Fund identifier code (e.g., DYN 3056) |
| `mBox10` | money | NULL |  |  |
| `mBox11` | money | NULL |  |  |
| `mBox12` | money | NULL |  |  |
| `mBox13` | money | NULL |  |  |
| `mBox14` | money | NULL |  |  |
| `mBox15` | money | NULL |  |  |
| `mBox16` | money | NULL |  |  |
| `mBox17` | money | NULL |  |  |
| `mBox18` | money | NULL |  |  |
| `mBox19` | money | NULL |  |  |
| `mBox20` | money | NULL |  |  |
| `mBox24` | money | NULL |  |  |
| `mBox25` | money | NULL |  |  |
| `mBox26` | money | NULL |  |  |
| `mBox30` | money | NULL |  |  |
| `mBox40` | money | NULL |  |  |
| `mBox41` | money | NULL |  |  |
| `mTotalDividend` | money | NULL |  |  |
| `dtProcess` | datetime | NULL |  | Date/time field |
| `dtLastModified` | datetime | NULL |  | Timestamp when record was last modified |
| `iLastModifiedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who last modified this record |
| `iStatusRL3` | tinyint | NULL |  | Status code (specific to this context) |
| `dtProcessRL3` | datetime | NULL |  | Date/time field |
| `mTotalDividend2` | money | NULL |  |  |
| `fFactor2` | float | NULL |  | Decimal/float value |
| `mBox34` | money | NULL |  |  |
| `fTotalUnit` | float | NULL |  | Decimal/float value |

### `UB_T5_SLP`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iTaxYear` | int | NULL |  | Integer field |
| `iPlanID` | int | NULL |  | FK to UB_Plan table - identifies the investment plan/account |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `iUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `iFileID` | int | NULL |  | FK to file record (FundServ file) |
| `iStatus` | tinyint | NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `iSubmissionStatus` | tinyint | NULL |  | Small integer/flag field |
| `iFlag` | tinyint | NULL |  | Small integer/flag field |
| `iVoid` | tinyint | NULL |  | Small integer/flag field |
| `iVoidUserID` | int | NULL |  | Integer field |
| `dtVoid` | datetime | NULL |  | Date/time field |
| `iPrinted` | tinyint | NULL |  | Small integer/flag field |
| `dtPrinted` | datetime | NULL |  | Date/time field |
| `iPrintedUserID` | int | NULL |  | Integer field |
| `iObjData` | int | NULL |  | Integer field |
| `iObjDataOrg` | int | NULL |  | Integer field |
| `iApproved` | tinyint | NULL |  | Small integer/flag field |
| `iApprovedUserID` | int | NULL |  | Integer field |
| `dtApproved` | datetime | NULL |  | Date/time field |
| `iClientViewed` | tinyint | NULL |  | Small integer/flag field |
| `dtClientViewed` | datetime | NULL |  | Date/time field |
| `Notes` | varchar(max) | NULL |  |  |
| `snm` | varchar(30) | NULL |  |  |
| `gvn_nm` | varchar(30) | NULL |  |  |
| `init` | char(1) | NULL |  |  |
| `ClientSIN` | varchar(15) | NULL |  |  |
| `addr_l1_txt` | varchar(30) | NULL |  |  |
| `addr_l2_txt` | varchar(30) | NULL |  |  |
| `cty_nm` | varchar(28) | NULL |  |  |
| `prov_cd` | char(2) | NULL |  |  |
| `cntry_cd` | char(3) | NULL |  |  |
| `pstl_cd` | varchar(10) | NULL |  |  |
| `ctrct_nbr` | varchar(12) | NULL |  |  |
| `rpt_tcd` | char(1) | NULL |  |  |
| `RecipientCode` | char(1) | NULL |  |  |
| `joint_sin` | varchar(15) | NULL |  |  |
| `mBox10` | money | NULL |  |  |
| `mBox11` | money | NULL |  |  |
| `mBox12` | money | NULL |  |  |
| `mBox13` | money | NULL |  |  |
| `mBox14` | money | NULL |  |  |
| `mBox15` | money | NULL |  |  |
| `mBox16` | money | NULL |  |  |
| `mBox17` | money | NULL |  |  |
| `mBox18` | money | NULL |  |  |
| `mBox19` | money | NULL |  |  |
| `mBox20` | money | NULL |  |  |
| `mBox24` | money | NULL |  |  |
| `mBox25` | money | NULL |  |  |
| `mBox26` | money | NULL |  |  |
| `mBox30` | money | NULL |  |  |
| `mBox40` | money | NULL |  |  |
| `mBox41` | money | NULL |  |  |
| `dtLastModified` | datetime | NULL |  | Timestamp when record was last modified |
| `iLastModifiedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who last modified this record |
| `ClientAddressPDF` | varchar(340) | NULL |  |  |
| `FirstNamePDF` | varchar(80) | NULL |  |  |
| `LastNamePDF` | varchar(80) | NULL |  |  |
| `iType` | tinyint | NULL |  | Type/category code |
| `iClientID` | int | NULL |  | FK to UB_Client table - identifies the client/investor |
| `bCorp` | tinyint | NULL |  |  |
| `sec_snm` | varchar(20) | NULL |  |  |
| `sec_gvn_nm` | varchar(12) | NULL |  |  |
| `CurrencySymbol` | char(3) | NULL |  |  |
| `iOrgID` | int | NULL |  | Integer field |
| `rpt_tcd_org` | char(1) | NULL |  |  |
| `mBox34` | money | NULL |  |  |

### `UB_T5_SLP_ARC`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL |  | Primary key, auto-increment identifier |
| `iTaxYear` | int | NULL |  | Integer field |
| `iPlanID` | int | NULL |  | FK to UB_Plan table - identifies the investment plan/account |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `iUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `iFileID` | int | NULL |  | FK to file record (FundServ file) |
| `iStatus` | tinyint | NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `iSubmissionStatus` | tinyint | NULL |  | Small integer/flag field |
| `iFlag` | tinyint | NULL |  | Small integer/flag field |
| `iVoid` | tinyint | NULL |  | Small integer/flag field |
| `iVoidUserID` | int | NULL |  | Integer field |
| `dtVoid` | datetime | NULL |  | Date/time field |
| `iPrinted` | tinyint | NULL |  | Small integer/flag field |
| `dtPrinted` | datetime | NULL |  | Date/time field |
| `iPrintedUserID` | int | NULL |  | Integer field |
| `iObjData` | int | NULL |  | Integer field |
| `iObjDataOrg` | int | NULL |  | Integer field |
| `iApproved` | tinyint | NULL |  | Small integer/flag field |
| `iApprovedUserID` | int | NULL |  | Integer field |
| `dtApproved` | datetime | NULL |  | Date/time field |
| `iClientViewed` | tinyint | NULL |  | Small integer/flag field |
| `dtClientViewed` | datetime | NULL |  | Date/time field |
| `Notes` | varchar(max) | NULL |  |  |
| `snm` | varchar(30) | NULL |  |  |
| `gvn_nm` | varchar(30) | NULL |  |  |
| `init` | char(1) | NULL |  |  |
| `ClientSIN` | varchar(15) | NULL |  |  |
| `addr_l1_txt` | varchar(30) | NULL |  |  |
| `addr_l2_txt` | varchar(30) | NULL |  |  |
| `cty_nm` | varchar(28) | NULL |  |  |
| `prov_cd` | char(2) | NULL |  |  |
| `cntry_cd` | char(3) | NULL |  |  |
| `pstl_cd` | varchar(10) | NULL |  |  |
| `ctrct_nbr` | varchar(12) | NULL |  |  |
| `rpt_tcd` | char(1) | NULL |  |  |
| `RecipientCode` | char(1) | NULL |  |  |
| `joint_sin` | varchar(15) | NULL |  |  |
| `mBox10` | money | NULL |  |  |
| `mBox11` | money | NULL |  |  |
| `mBox12` | money | NULL |  |  |
| `mBox13` | money | NULL |  |  |
| `mBox14` | money | NULL |  |  |
| `mBox15` | money | NULL |  |  |
| `mBox16` | money | NULL |  |  |
| `mBox17` | money | NULL |  |  |
| `mBox18` | money | NULL |  |  |
| `mBox19` | money | NULL |  |  |
| `mBox20` | money | NULL |  |  |
| `mBox24` | money | NULL |  |  |
| `mBox25` | money | NULL |  |  |
| `mBox26` | money | NULL |  |  |
| `mBox30` | money | NULL |  |  |
| `mBox40` | money | NULL |  |  |
| `mBox41` | money | NULL |  |  |
| `dtLastModified` | datetime | NULL |  | Timestamp when record was last modified |
| `iLastModifiedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who last modified this record |
| `ClientAddressPDF` | varchar(340) | NULL |  |  |
| `FirstNamePDF` | varchar(80) | NULL |  |  |
| `LastNamePDF` | varchar(80) | NULL |  |  |
| `iType` | tinyint | NULL |  | Type/category code |
| `iClientID` | int | NULL |  | FK to UB_Client table - identifies the client/investor |
| `bCorp` | tinyint | NULL |  |  |
| `sec_snm` | varchar(20) | NULL |  |  |
| `sec_gvn_nm` | varchar(12) | NULL |  |  |
| `CurrencySymbol` | char(3) | NULL |  |  |
| `iOrgID` | int | NULL |  | Integer field |
| `rpt_tcd_org` | char(1) | NULL |  |  |
| `mBox34` | money | NULL |  |  |

### `UB_T5_TRX`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `iSlipID` | int | NOT NULL |  | Integer field |
| `iPlanFundID` | int | NOT NULL |  | Integer field |
| `bDOD` | tinyint | NULL |  |  |

### `UB_T5008`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iPlanID` | int | NULL |  | FK to UB_Plan table - identifies the investment plan/account |
| `iYear` | int | NULL |  | Integer field |
| `CurrencyCode` | char(3) | NULL |  |  |
| `iStatus` | tinyint | NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `iCreatedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `dtProcessing` | datetime | NULL |  | Date/time field |
| `Notes` | varchar(100) | NULL |  |  |
| `dtLastModify` | datetime | NULL |  | Date/time field |
| `iLastModifiedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who last modified this record |
| `iObjData` | int | NULL |  | Integer field |
| `iPrinted` | tinyint | NULL |  | Small integer/flag field |
| `dtPrinted` | datetime | NULL |  | Date/time field |
| `iSubmitted` | tinyint | NULL |  | Small integer/flag field |
| `dtSubmitted` | datetime | NULL |  | Date/time field |
| `iFileID` | int | NULL |  | FK to file record (FundServ file) |
| `DealerCode` | varchar(5) | NULL |  | Dealer code identifier |
| `ActionCode` | char(1) | NULL |  |  |
| `SIN` | varchar(15) | NULL |  |  |
| `ClientFirstName` | varchar(80) | NULL |  |  |
| `ClientLastName` | varchar(80) | NULL |  |  |
| `AccountNumber` | varchar(20) | NULL |  |  |
| `mAmount` | money | NULL |  | Monetary amount |
| `mBookValue` | money | NULL |  |  |
| `ContractNumber` | varchar(20) | NULL |  |  |
| `Line1` | varchar(80) | NULL |  |  |
| `Line2` | varchar(80) | NULL |  |  |
| `Line3` | varchar(80) | NULL |  |  |
| `City` | varchar(50) | NULL |  |  |
| `ProvinceCode` | varchar(3) | NULL |  |  |
| `CountryCode` | varchar(3) | NULL |  |  |
| `PostalCode` | varchar(12) | NULL |  |  |
| `RecipientCode` | char(1) | NULL |  |  |
| `ClientFirstName2` | varchar(80) | NULL |  |  |
| `ClientLastName2` | varchar(80) | NULL |  |  |

### `UB_T5008_Detail`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iT5008ID` | int | NULL |  | Integer field |
| `MgmtCode` | varchar(5) | NULL |  | Management company code |
| `FundID` | varchar(5) | NULL |  | Fund identifier code (e.g., DYN 3056) |
| `FundAccountID` | varchar(15) | NULL |  |  |
| `FundName` | varchar(80) | NULL |  |  |
| `mAmount` | money | NULL |  | Monetary amount |
| `mBookValue` | money | NULL |  |  |
| `SecurityType` | char(3) | NULL |  |  |
| `fUnit` | float | NULL |  | Number of units |
| `CUSIP` | varchar(15) | NULL |  |  |

### `UB_T5008_SLP`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iTaxYear` | int | NULL |  | Integer field |
| `iPlanID` | int | NULL |  | FK to UB_Plan table - identifies the investment plan/account |
| `iFundPosID` | int | NULL |  | Integer field |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `iUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `iFileID` | int | NULL |  | FK to file record (FundServ file) |
| `iStatus` | tinyint | NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `iSubmissionStatus` | tinyint | NULL |  | Small integer/flag field |
| `iFlag` | tinyint | NULL |  | Small integer/flag field |
| `iVoid` | tinyint | NULL |  | Small integer/flag field |
| `iVoidUserID` | int | NULL |  | Integer field |
| `dtVoid` | datetime | NULL |  | Date/time field |
| `iPrinted` | tinyint | NULL |  | Small integer/flag field |
| `dtPrinted` | datetime | NULL |  | Date/time field |
| `iPrintedUserID` | int | NULL |  | Integer field |
| `iObjData` | int | NULL |  | Integer field |
| `iObjDataOrg` | int | NULL |  | Integer field |
| `iApproved` | tinyint | NULL |  | Small integer/flag field |
| `iApprovedUserID` | int | NULL |  | Integer field |
| `dtApproved` | datetime | NULL |  | Date/time field |
| `iClientViewed` | tinyint | NULL |  | Small integer/flag field |
| `dtClientViewed` | datetime | NULL |  | Date/time field |
| `Notes` | varchar(max) | NULL |  |  |
| `snm` | varchar(20) | NULL |  |  |
| `gvn_nm` | varchar(20) | NULL |  |  |
| `init` | char(1) | NULL |  |  |
| `ClientSIN` | varchar(15) | NULL |  |  |
| `addr_l1_txt` | varchar(30) | NULL |  |  |
| `addr_l2_txt` | varchar(30) | NULL |  |  |
| `cty_nm` | varchar(28) | NULL |  |  |
| `prov_cd` | char(2) | NULL |  |  |
| `cntry_cd` | char(3) | NULL |  |  |
| `pstl_cd` | varchar(10) | NULL |  |  |
| `RecipientCode` | char(1) | NULL |  |  |
| `ctrct_nbr` | varchar(12) | NULL |  |  |
| `rpt_tcd` | char(1) | NULL |  |  |
| `bJoint` | char(1) | NULL |  |  |
| `sec_snm` | varchar(20) | NULL |  |  |
| `sec_gvn_nm` | varchar(20) | NULL |  |  |
| `ClientSIN2` | varchar(15) | NULL |  |  |
| `ClientAddressPDF` | varchar(340) | NULL |  |  |
| `FirstNamePDF` | varchar(80) | NULL |  |  |
| `LastNamePDF` | varchar(80) | NULL |  |  |
| `LastNamePDF2` | varchar(80) | NULL |  |  |
| `FirstNamePDF2` | varchar(80) | NULL |  |  |
| `bCorp` | tinyint | NULL |  |  |
| `dtLastModified` | datetime | NULL |  | Timestamp when record was last modified |
| `iLastModifiedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who last modified this record |
| `FundName` | varchar(80) | NULL |  |  |
| `CurrencyCode` | char(3) | NULL |  |  |
| `mGross` | money | NULL |  |  |
| `mNet` | money | NULL |  |  |
| `mUnit` | money | NULL |  |  |
| `mBookValue` | money | NULL |  |  |
| `mCapGain` | money | NULL |  |  |
| `SecurityType` | char(3) | NULL |  |  |
| `CUSIP` | varchar(12) | NULL |  |  |
| `ISIN` | varchar(15) | NULL |  |  |
| `FundAccountID` | varchar(15) | NULL |  |  |
| `iPosID2` | int | NULL |  | Integer field |
| `iOrgID` | int | NULL |  | Integer field |
| `rpt_tcd_org` | char(1) | NULL |  |  |

### `UB_T5008_SLP_ARC`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL |  | Primary key, auto-increment identifier |
| `iTaxYear` | int | NULL |  | Integer field |
| `iPlanID` | int | NULL |  | FK to UB_Plan table - identifies the investment plan/account |
| `iFundPosID` | int | NULL |  | Integer field |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `iUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `iFileID` | int | NULL |  | FK to file record (FundServ file) |
| `iStatus` | tinyint | NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `iSubmissionStatus` | tinyint | NULL |  | Small integer/flag field |
| `iFlag` | tinyint | NULL |  | Small integer/flag field |
| `iVoid` | tinyint | NULL |  | Small integer/flag field |
| `iVoidUserID` | int | NULL |  | Integer field |
| `dtVoid` | datetime | NULL |  | Date/time field |
| `iPrinted` | tinyint | NULL |  | Small integer/flag field |
| `dtPrinted` | datetime | NULL |  | Date/time field |
| `iPrintedUserID` | int | NULL |  | Integer field |
| `iObjData` | int | NULL |  | Integer field |
| `iObjDataOrg` | int | NULL |  | Integer field |
| `iApproved` | tinyint | NULL |  | Small integer/flag field |
| `iApprovedUserID` | int | NULL |  | Integer field |
| `dtApproved` | datetime | NULL |  | Date/time field |
| `iClientViewed` | tinyint | NULL |  | Small integer/flag field |
| `dtClientViewed` | datetime | NULL |  | Date/time field |
| `Notes` | varchar(max) | NULL |  |  |
| `snm` | varchar(20) | NULL |  |  |
| `gvn_nm` | varchar(20) | NULL |  |  |
| `init` | char(1) | NULL |  |  |
| `ClientSIN` | varchar(15) | NULL |  |  |
| `addr_l1_txt` | varchar(30) | NULL |  |  |
| `addr_l2_txt` | varchar(30) | NULL |  |  |
| `cty_nm` | varchar(28) | NULL |  |  |
| `prov_cd` | char(2) | NULL |  |  |
| `cntry_cd` | char(3) | NULL |  |  |
| `pstl_cd` | varchar(10) | NULL |  |  |
| `RecipientCode` | char(1) | NULL |  |  |
| `ctrct_nbr` | varchar(12) | NULL |  |  |
| `rpt_tcd` | char(1) | NULL |  |  |
| `bJoint` | char(1) | NULL |  |  |
| `sec_snm` | varchar(20) | NULL |  |  |
| `sec_gvn_nm` | varchar(20) | NULL |  |  |
| `ClientSIN2` | varchar(15) | NULL |  |  |
| `ClientAddressPDF` | varchar(340) | NULL |  |  |
| `FirstNamePDF` | varchar(80) | NULL |  |  |
| `LastNamePDF` | varchar(80) | NULL |  |  |
| `LastNamePDF2` | varchar(80) | NULL |  |  |
| `FirstNamePDF2` | varchar(80) | NULL |  |  |
| `bCorp` | tinyint | NULL |  |  |
| `dtLastModified` | datetime | NULL |  | Timestamp when record was last modified |
| `iLastModifiedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who last modified this record |
| `FundName` | varchar(80) | NULL |  |  |
| `CurrencyCode` | char(3) | NULL |  |  |
| `mGross` | money | NULL |  |  |
| `mNet` | money | NULL |  |  |
| `mBookValue` | money | NULL |  |  |
| `mCapGain` | money | NULL |  |  |
| `mUnit` | money | NULL |  |  |
| `SecurityType` | char(3) | NULL |  |  |
| `CUSIP` | varchar(12) | NULL |  |  |
| `ISIN` | varchar(15) | NULL |  |  |
| `FundAccountID` | varchar(15) | NULL |  |  |
| `iPosID2` | int | NULL |  | Integer field |
| `iOrgID` | int | NULL |  | Integer field |
| `rpt_tcd_org` | char(1) | NULL |  |  |

### `UB_T5008_TRX`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `iSlipID` | int | NOT NULL |  | Integer field |
| `iTrxID` | int | NOT NULL |  | Integer field |

### `UB_T5008Obj`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL |  | Primary key, auto-increment identifier |
| `iObjData` | int | NOT NULL |  | Integer field |
| `iUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |

### `UB_T550`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iYear` | int | NULL |  | Integer field |
| `iPlanID` | int | NULL |  | FK to UB_Plan table - identifies the investment plan/account |
| `AccountType` | char(2) | NULL |  |  |
| `dtStart` | datetime | NULL |  | Date/time field |
| `iStatus` | tinyint | NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `iFileID` | int | NULL |  | FK to file record (FundServ file) |
| `iUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `iFlag` | tinyint | NULL |  | Small integer/flag field |
| `iSpecimenType` | tinyint | NULL |  | Small integer/flag field |
| `dtFirstTrx` | datetime | NULL |  | Date/time field |
| `contractNumber` | varchar(20) | NULL |  |  |
| `annuitantSIN` | varchar(9) | NULL |  |  |
| `annuitantSalutation` | char(1) | NULL |  |  |
| `annuitantFirstName` | varchar(80) | NULL |  |  |
| `annuitantLastName` | varchar(80) | NULL |  |  |
| `annuitantAddress1` | varchar(60) | NULL |  |  |
| `annuitantAddress2` | varchar(60) | NULL |  |  |
| `annuitantCity` | varchar(80) | NULL |  |  |
| `annuitantProvince` | char(2) | NULL |  |  |
| `annuitantPostalCode` | varchar(10) | NULL |  |  |

### `UB_T550_ARC`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL |  | Primary key, auto-increment identifier |
| `iYear` | int | NULL |  | Integer field |
| `iPlanID` | int | NULL |  | FK to UB_Plan table - identifies the investment plan/account |
| `AccountType` | char(2) | NULL |  |  |
| `dtStart` | datetime | NULL |  | Date/time field |
| `iStatus` | tinyint | NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `iFileID` | int | NULL |  | FK to file record (FundServ file) |
| `iUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `iFlag` | tinyint | NULL |  | Small integer/flag field |
| `iSpecimenType` | tinyint | NULL |  | Small integer/flag field |
| `dtFirstTrx` | datetime | NULL |  | Date/time field |
| `contractNumber` | varchar(20) | NULL |  |  |
| `annuitantSIN` | varchar(9) | NULL |  |  |
| `annuitantSalutation` | char(1) | NULL |  |  |
| `annuitantFirstName` | varchar(80) | NULL |  |  |
| `annuitantLastName` | varchar(80) | NULL |  |  |
| `annuitantAddress1` | varchar(60) | NULL |  |  |
| `annuitantAddress2` | varchar(60) | NULL |  |  |
| `annuitantCity` | varchar(80) | NULL |  |  |
| `annuitantProvince` | char(2) | NULL |  |  |
| `annuitantPostalCode` | varchar(10) | NULL |  |  |

### `UB_T619Contact`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `TransmitterName1` | varchar(30) | NULL |  |  |
| `TransmitterName2` | varchar(30) | NULL |  |  |
| `ContactFName` | varchar(30) | NULL |  |  |
| `ContactLName` | varchar(30) | NULL |  |  |
| `ContactAddressL1` | varchar(30) | NULL |  |  |
| `ContactAddressL2` | varchar(30) | NULL |  |  |
| `ContactCity` | varchar(28) | NULL |  |  |
| `ContactProv` | char(2) | NULL |  |  |
| `ContactPostal` | varchar(10) | NULL |  |  |
| `ContactCountry` | char(3) | NULL |  |  |
| `ContactAreaCode` | char(3) | NULL |  |  |
| `ContactPhone` | varchar(8) | NULL |  |  |
| `ContactExt` | varchar(7) | NULL |  |  |
| `ContactEmail1` | varchar(60) | NULL |  |  |
| `ContactEmail2` | varchar(60) | NULL |  |  |
| `ContactLg` | char(1) | NULL |  |  |

### `UB_T619TRM`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `TransmitterNumber` | varchar(8) | NULL |  |  |
| `TransmitterIndicator` | char(1) | NULL |  |  |
| `dtLastModified` | datetime | NULL |  | Timestamp when record was last modified |
| `iPWOpt` | tinyint | NULL |  | Small integer/flag field |
| `SpecimenNumberRSP` | varchar(13) | NULL |  |  |
| `SpecimenNumberRIF` | varchar(13) | NULL |  |  |
| `SpecimenNumberTFSA` | varchar(13) | NULL |  |  |
| `SpecimenNumberNR` | varchar(13) | NULL |  |  |
| `SpecimenNameRSP` | varchar(250) | NULL |  |  |
| `SpecimenNameRIF` | varchar(250) | NULL |  |  |
| `SpecimenNameTFSA` | varchar(250) | NULL |  |  |
| `SpecimenNameNR` | varchar(250) | NULL |  |  |
| `BusinessNumberRSP` | varchar(15) | NULL |  |  |
| `BusinessNumberRIF` | varchar(15) | NULL |  |  |
| `BusinessNumberTFSA` | varchar(15) | NULL |  |  |
| `BusinessNumberNR` | varchar(15) | NULL |  |  |
| `IssuerName` | varchar(250) | NULL |  |  |
| `TransmitterName1` | varchar(35) | NULL |  |  |
| `TransmitterName2` | varchar(30) | NULL |  |  |
| `ContactFName` | varchar(30) | NULL |  |  |
| `ContactLName` | varchar(30) | NULL |  |  |
| `ContactAddressL1` | varchar(30) | NULL |  |  |
| `ContactAddressL2` | varchar(30) | NULL |  |  |
| `ContactCity` | varchar(28) | NULL |  |  |
| `ContactProv` | char(2) | NULL |  |  |
| `ContactPostal` | varchar(10) | NULL |  |  |
| `ContactCountry` | char(3) | NULL |  |  |
| `ContactAreaCode` | char(3) | NULL |  |  |
| `ContactPhone` | varchar(8) | NULL |  |  |
| `ContactExt` | varchar(7) | NULL |  |  |
| `ContactEmail1` | varchar(60) | NULL |  |  |
| `ContactEmail2` | varchar(60) | NULL |  |  |
| `ContactLg` | char(1) | NULL |  |  |
| `FilerID` | varchar(15) | NULL |  |  |
| `FilerName` | varchar(120) | NULL |  |  |
| `FilerContactFName` | varchar(30) | NULL |  |  |
| `FilerContactLName` | varchar(30) | NULL |  |  |
| `FilerContactAddressL1` | varchar(60) | NULL |  |  |
| `FilerContactAddressL2` | varchar(60) | NULL |  |  |
| `FilerContactCity` | varchar(60) | NULL |  |  |
| `FilerContactProv` | char(2) | NULL |  |  |
| `FilerContactPostal` | varchar(10) | NULL |  |  |
| `FilerContactCountry` | char(3) | NULL |  |  |
| `FilerContactAreaCode` | char(3) | NULL |  |  |
| `FilerContactPhone` | varchar(8) | NULL |  |  |
| `FilerContactExt` | varchar(7) | NULL |  |  |
| `FilerContactEmail1` | varchar(60) | NULL |  |  |
| `FilerContactEmail2` | varchar(60) | NULL |  |  |
| `FilerContactLg` | char(1) | NULL |  |  |
| `GIIN` | varchar(20) | NULL |  |  |
| `P19FilerID` | varchar(15) | NULL |  |  |
| `RL_NEQ` | varchar(10) | NULL |  |  |
| `RL_TransmitterNumber` | varchar(8) | NULL |  |  |
| `RL_FileNumber` | char(4) | NULL |  |  |
| `RL2_SeqStart` | int | NULL |  |  |
| `RL2_SeqEnd` | int | NULL |  |  |
| `RL2_LastUsed` | int | NULL |  |  |
| `RL3_SeqStart` | int | NULL |  |  |
| `RL3_SeqEnd` | int | NULL |  |  |
| `RL3_LastUsed` | int | NULL |  |  |
| `RL18_SeqStart` | int | NULL |  |  |
| `RL18_SeqEnd` | int | NULL |  |  |
| `RL18_LastUsed` | int | NULL |  |  |
| `RL_ComputerResourceName` | varchar(80) | NULL |  |  |
| `RL_ComputerResourcePhone` | varchar(15) | NULL |  |  |
| `RL_AccountingResourceName` | varchar(80) | NULL |  |  |
| `RL_AccountingResourcePhone` | varchar(15) | NULL |  |  |
| `BusinessNumberT5` | varchar(15) | NULL |  |  |
| `RL1_SeqStart` | int | NULL |  |  |
| `RL1_SeqEnd` | int | NULL |  |  |
| `RL1_LastUsed` | int | NULL |  |  |
| `RL_ComputerResourcePhoneArea` | char(3) | NULL |  |  |
| `RL_ComputerResourcePhoneExt` | varchar(7) | NULL |  |  |
| `RL_ComputerResourceLg` | char(1) | NULL |  |  |
| `RL_AccountingResourcePhoneArea` | char(3) | NULL |  |  |
| `RL_AccountingResourcePhoneExt` | varchar(7) | NULL |  |  |
| `RL_AccountingResourceLg` | char(1) | NULL |  |  |
| `RL_SoftwareName` | varchar(40) | NULL |  |  |
| `RL_SoftwareVersion` | varchar(15) | NULL |  |  |
| `RL_PartnerID` | varchar(16) | NULL |  |  |
| `RL_ProductID` | varchar(16) | NULL |  |  |
| `RL_TestCaseNumber` | varchar(25) | NULL |  |  |
| `RL_FileType` | char(2) | NULL |  |  |
| `RL_FileID` | varchar(10) | NULL |  |  |
| `RL1_Cert` | varchar(12) | NULL |  |  |
| `RL2_Cert` | varchar(12) | NULL |  |  |
| `RL3_Cert` | varchar(12) | NULL |  |  |
| `RL18_Cert` | varchar(12) | NULL |  |  |
| `RL16_LastUsed` | int | NULL |  |  |
| `RL16_Cert` | varchar(12) | NULL |  |  |
| `T3TrustAccount` | varchar(9) | NULL |  |  |
| `BusinessNumberRESP` | varchar(15) | NULL |  |  |
| `SpecimenNumberRESP` | varchar(13) | NULL |  |  |
| `SpecimenNameRESP` | varchar(250) | NULL |  |  |
| `BusinessNumberRESP_FAM` | varchar(15) | NULL |  |  |
| `SpecimenNumberRESP_FAM` | varchar(13) | NULL |  |  |
| `SpecimenNameRESP_FAM` | varchar(250) | NULL |  |  |
| `RL_NoIdFiducieProvincial` | varchar(10) | NULL |  |  |
| `RL_NoCompteFiducieFederal` | varchar(9) | NULL |  |  |
| `RL_FiducieNom` | varchar(60) | NULL |  |  |
| `RL1_Max` | int | NULL |  |  |
| `RL2_Max` | int | NULL |  |  |
| `RL16_Max` | int | NULL |  |  |
| `RL3_Max` | int | NULL |  |  |
| `RL18_Max` | int | NULL |  |  |
| `SpecimenNumberFHSA` | varchar(13) | NULL |  |  |
| `SpecimenNameFHSA` | varchar(250) | NULL |  |  |
| `BusinessNumberFHSA` | varchar(15) | NULL |  |  |
| `TransmitterAccountNumber` | varchar(15) | NULL |  |  |
| `TransmitterRepID` | varchar(7) | NULL |  |  |
| `SpecimenNameT4RSP` | varchar(250) | NULL |  |  |
| `BusinessNumberT4RSP` | varchar(15) | NULL |  |  |
| `SpecimenNumberT4RSP` | varchar(13) | NULL |  |  |
| `TransmitterAccountNumberRRSP` | varchar(15) | NULL |  |  |
| `TransmitterAccountNumberT4A` | varchar(15) | NULL |  |  |
| `TransmitterAccountNumberT4RSP` | varchar(15) | NULL |  |  |
| `TransmitterAccountNumberT4RIF` | varchar(15) | NULL |  |  |
| `TransmitterAccountNumberT3` | varchar(15) | NULL |  |  |
| `TransmitterAccountNumberT5` | varchar(15) | NULL |  |  |
| `TransmitterAccountNumberT5008` | varchar(15) | NULL |  |  |
| `TransmitterAccountNumberNR4` | varchar(15) | NULL |  |  |
| `TransmitterAccountNumberTFSA` | varchar(15) | NULL |  |  |
| `TransmitterAccountNumberFHSA` | varchar(15) | NULL |  |  |
| `TransmitterAccountNumberP18` | varchar(15) | NULL |  |  |
| `TransmitterAccountNumberP19` | varchar(15) | NULL |  |  |

---

## Quebec Releve Tax Slip

### `UB_Releve1`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iMemberID` | int | NULL |  | FK to UB_Member - identifies the member/advisor |
| `iYear` | int | NULL |  | Integer field |
| `CurrencyCode` | char(3) | NULL |  |  |
| `iStatus` | tinyint | NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `iTransmitterNumber` | int | NULL |  | Integer field |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `iCreatedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `dtProcessing` | datetime | NULL |  | Date/time field |
| `Notes` | varchar(100) | NULL |  |  |
| `dtLastModify` | datetime | NULL |  | Date/time field |
| `iLastModifiedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who last modified this record |
| `iObjData` | int | NULL |  | Integer field |
| `mBoxA` | money | NULL |  |  |
| `mBoxO` | money | NULL |  |  |
| `mBoxB` | money | NULL |  |  |
| `mBoxC` | money | NULL |  |  |
| `mBoxD` | money | NULL |  |  |
| `mBoxE` | money | NULL |  |  |
| `mBoxF` | money | NULL |  |  |
| `mBoxG` | money | NULL |  |  |
| `mBoxH` | money | NULL |  |  |
| `mBoxI` | money | NULL |  |  |
| `mBoxJ` | money | NULL |  |  |
| `mBoxK` | money | NULL |  |  |
| `mBoxL` | money | NULL |  |  |
| `mBoxM` | money | NULL |  |  |
| `mBoxN` | money | NULL |  |  |
| `mBoxP` | money | NULL |  |  |
| `mBoxQ` | money | NULL |  |  |
| `mBoxR` | money | NULL |  |  |
| `mBoxS` | money | NULL |  |  |
| `mBoxT` | money | NULL |  |  |
| `mBoxU` | money | NULL |  |  |
| `mBoxV` | money | NULL |  |  |
| `mBoxW` | money | NULL |  |  |
| `iPrinted` | tinyint | NULL |  | Small integer/flag field |
| `dtPrinted` | datetime | NULL |  | Date/time field |
| `iSubmitted` | tinyint | NULL |  | Small integer/flag field |
| `dtSubmitted` | datetime | NULL |  | Date/time field |
| `iFileID` | int | NULL |  | FK to file record (FundServ file) |
| `ActionCode` | char(1) | NULL |  |  |
| `DealerCode` | varchar(5) | NULL |  | Dealer code identifier |
| `BoxCode` | varchar(20) | NULL |  |  |

### `UB_RL1_SLP`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iTaxYear` | int | NULL |  | Integer field |
| `DealerCode` | varchar(5) | NULL |  | Dealer code identifier |
| `iMemberID` | int | NULL |  | FK to UB_Member - identifies the member/advisor |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `iUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `iFileID` | int | NULL |  | FK to file record (FundServ file) |
| `iStatus` | tinyint | NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `iSubmissionStatus` | tinyint | NULL |  | Small integer/flag field |
| `iFlag` | tinyint | NULL |  | Small integer/flag field |
| `iVoid` | tinyint | NULL |  | Small integer/flag field |
| `iVoidUserID` | int | NULL |  | Integer field |
| `dtVoid` | datetime | NULL |  | Date/time field |
| `iPrinted` | tinyint | NULL |  | Small integer/flag field |
| `dtPrinted` | datetime | NULL |  | Date/time field |
| `iPrintedUserID` | int | NULL |  | Integer field |
| `iObjData` | int | NULL |  | Integer field |
| `iObjDataOrg` | int | NULL |  | Integer field |
| `iApproved` | tinyint | NULL |  | Small integer/flag field |
| `iApprovedUserID` | int | NULL |  | Integer field |
| `dtApproved` | datetime | NULL |  | Date/time field |
| `iClientViewed` | tinyint | NULL |  | Small integer/flag field |
| `dtClientViewed` | datetime | NULL |  | Date/time field |
| `Notes` | varchar(max) | NULL |  |  |
| `FirstNamePDF` | varchar(80) | NULL |  |  |
| `LastNamePDF` | varchar(80) | NULL |  |  |
| `ClientAddressPDF` | varchar(340) | NULL |  |  |
| `dtLastModified` | datetime | NULL |  | Timestamp when record was last modified |
| `iLastModifiedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who last modified this record |
| `ClientFirstName` | varchar(30) | NULL |  |  |
| `ClientLastName` | varchar(30) | NULL |  |  |
| `ClientSIN` | varchar(15) | NULL |  |  |
| `ContractNumber` | varchar(20) | NULL |  |  |
| `Line1` | varchar(80) | NULL |  |  |
| `Line2` | varchar(80) | NULL |  |  |
| `Line3` | varchar(80) | NULL |  |  |
| `City` | varchar(50) | NULL |  |  |
| `ProvinceCode` | varchar(3) | NULL |  |  |
| `CountryCode` | varchar(3) | NULL |  |  |
| `PostalCode` | varchar(12) | NULL |  |  |
| `mBoxA` | money | NULL |  |  |
| `mBoxB` | money | NULL |  |  |
| `mBoxC` | money | NULL |  |  |
| `mBoxD` | money | NULL |  |  |
| `mBoxE` | money | NULL |  |  |
| `mBoxF` | money | NULL |  |  |
| `mBoxG` | money | NULL |  |  |
| `mBoxH` | money | NULL |  |  |
| `mBoxI` | money | NULL |  |  |
| `mBoxJ` | money | NULL |  |  |
| `mBoxK` | money | NULL |  |  |
| `mBoxL` | money | NULL |  |  |
| `mBoxO` | money | NULL |  |  |
| `mBoxM` | money | NULL |  |  |
| `mBoxN` | money | NULL |  |  |
| `mBoxP` | money | NULL |  |  |
| `mBoxQ` | money | NULL |  |  |
| `mBoxR` | money | NULL |  |  |
| `mBoxS` | money | NULL |  |  |
| `mBoxT` | money | NULL |  |  |
| `mBoxU` | money | NULL |  |  |
| `mBoxV` | money | NULL |  |  |
| `mBoxW` | money | NULL |  |  |
| `BoxCode` | varchar(20) | NULL |  |  |
| `rpt_tcd` | char(1) | NULL |  |  |
| `iSubmitted` | tinyint | NULL |  | Small integer/flag field |
| `dtSubmitted` | datetime | NULL |  | Date/time field |
| `iNoReleve` | int | NULL |  | Integer field |
| `iNoRelevePrev` | int | NULL |  | Integer field |
| `IncomeSource` | varchar(6) | NULL |  |  |
| `CurrencyCode` | char(2) | NULL |  |  |
| `fXRate` | float | NULL |  | Decimal/float value |
| `bCorp` | tinyint | NULL |  |  |

### `UB_RL1_SLP_ARC`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL |  | Primary key, auto-increment identifier |
| `iTaxYear` | int | NULL |  | Integer field |
| `DealerCode` | varchar(5) | NULL |  | Dealer code identifier |
| `iMemberID` | int | NULL |  | FK to UB_Member - identifies the member/advisor |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `iUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `iFileID` | int | NULL |  | FK to file record (FundServ file) |
| `iStatus` | tinyint | NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `iSubmissionStatus` | tinyint | NULL |  | Small integer/flag field |
| `iFlag` | tinyint | NULL |  | Small integer/flag field |
| `iVoid` | tinyint | NULL |  | Small integer/flag field |
| `iVoidUserID` | int | NULL |  | Integer field |
| `dtVoid` | datetime | NULL |  | Date/time field |
| `iPrinted` | tinyint | NULL |  | Small integer/flag field |
| `dtPrinted` | datetime | NULL |  | Date/time field |
| `iPrintedUserID` | int | NULL |  | Integer field |
| `iObjData` | int | NULL |  | Integer field |
| `iObjDataOrg` | int | NULL |  | Integer field |
| `iApproved` | tinyint | NULL |  | Small integer/flag field |
| `iApprovedUserID` | int | NULL |  | Integer field |
| `dtApproved` | datetime | NULL |  | Date/time field |
| `iClientViewed` | tinyint | NULL |  | Small integer/flag field |
| `dtClientViewed` | datetime | NULL |  | Date/time field |
| `Notes` | varchar(max) | NULL |  |  |
| `FirstNamePDF` | varchar(80) | NULL |  |  |
| `LastNamePDF` | varchar(80) | NULL |  |  |
| `ClientAddressPDF` | varchar(340) | NULL |  |  |
| `dtLastModified` | datetime | NULL |  | Timestamp when record was last modified |
| `iLastModifiedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who last modified this record |
| `ClientFirstName` | varchar(30) | NULL |  |  |
| `ClientLastName` | varchar(30) | NULL |  |  |
| `ClientSIN` | varchar(15) | NULL |  |  |
| `ContractNumber` | varchar(20) | NULL |  |  |
| `Line1` | varchar(80) | NULL |  |  |
| `Line2` | varchar(80) | NULL |  |  |
| `Line3` | varchar(80) | NULL |  |  |
| `City` | varchar(50) | NULL |  |  |
| `ProvinceCode` | varchar(3) | NULL |  |  |
| `CountryCode` | varchar(3) | NULL |  |  |
| `PostalCode` | varchar(12) | NULL |  |  |
| `mBoxA` | money | NULL |  |  |
| `mBoxB` | money | NULL |  |  |
| `mBoxC` | money | NULL |  |  |
| `mBoxD` | money | NULL |  |  |
| `mBoxE` | money | NULL |  |  |
| `mBoxF` | money | NULL |  |  |
| `mBoxG` | money | NULL |  |  |
| `mBoxH` | money | NULL |  |  |
| `mBoxI` | money | NULL |  |  |
| `mBoxJ` | money | NULL |  |  |
| `mBoxK` | money | NULL |  |  |
| `mBoxL` | money | NULL |  |  |
| `mBoxO` | money | NULL |  |  |
| `mBoxM` | money | NULL |  |  |
| `mBoxN` | money | NULL |  |  |
| `mBoxP` | money | NULL |  |  |
| `mBoxQ` | money | NULL |  |  |
| `mBoxR` | money | NULL |  |  |
| `mBoxS` | money | NULL |  |  |
| `mBoxT` | money | NULL |  |  |
| `mBoxU` | money | NULL |  |  |
| `mBoxV` | money | NULL |  |  |
| `mBoxW` | money | NULL |  |  |
| `BoxCode` | varchar(20) | NULL |  |  |
| `rpt_tcd` | char(1) | NULL |  |  |
| `iSubmitted` | tinyint | NULL |  | Small integer/flag field |
| `dtSubmitted` | datetime | NULL |  | Date/time field |
| `iNoReleve` | int | NULL |  | Integer field |
| `iNoRelevePrev` | int | NULL |  | Integer field |
| `IncomeSource` | varchar(6) | NULL |  |  |
| `CurrencyCode` | char(2) | NULL |  |  |
| `fXRate` | float | NULL |  | Decimal/float value |
| `bCorp` | tinyint | NULL |  |  |

### `UB_RL1_TRX`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `iSlipID` | int | NOT NULL |  | Integer field |
| `iSourceType` | tinyint | NOT NULL |  | Small integer/flag field |
| `iTrxID` | int | NOT NULL |  | Integer field |

### `UB_RL16_SLP`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iTaxYear` | int | NULL |  | Integer field |
| `iPlanID` | int | NULL |  | FK to UB_Plan table - identifies the investment plan/account |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `iUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `iFileID` | int | NULL |  | FK to file record (FundServ file) |
| `iStatus` | tinyint | NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `iSubmissionStatus` | tinyint | NULL |  | Small integer/flag field |
| `iFlag` | tinyint | NULL |  | Small integer/flag field |
| `iVoid` | tinyint | NULL |  | Small integer/flag field |
| `iVoidUserID` | int | NULL |  | Integer field |
| `dtVoid` | datetime | NULL |  | Date/time field |
| `iPrinted` | tinyint | NULL |  | Small integer/flag field |
| `dtPrinted` | datetime | NULL |  | Date/time field |
| `iPrintedUserID` | int | NULL |  | Integer field |
| `iObjData` | int | NULL |  | Integer field |
| `iObjDataOrg` | int | NULL |  | Integer field |
| `iApproved` | tinyint | NULL |  | Small integer/flag field |
| `iApprovedUserID` | int | NULL |  | Integer field |
| `dtApproved` | datetime | NULL |  | Date/time field |
| `iClientViewed` | tinyint | NULL |  | Small integer/flag field |
| `dtClientViewed` | datetime | NULL |  | Date/time field |
| `Notes` | varchar(max) | NULL |  |  |
| `snm` | varchar(30) | NULL |  |  |
| `gvn_nm` | varchar(30) | NULL |  |  |
| `init` | char(1) | NULL |  |  |
| `ClientSIN` | varchar(15) | NULL |  |  |
| `addr_l1_txt` | varchar(30) | NULL |  |  |
| `addr_l2_txt` | varchar(30) | NULL |  |  |
| `cty_nm` | varchar(28) | NULL |  |  |
| `prov_cd` | char(2) | NULL |  |  |
| `cntry_cd` | char(3) | NULL |  |  |
| `pstl_cd` | varchar(10) | NULL |  |  |
| `ctrct_nbr` | varchar(12) | NULL |  |  |
| `rpt_tcd` | char(1) | NULL |  |  |
| `RecipientCode` | char(1) | NULL |  |  |
| `joint_sin` | varchar(15) | NULL |  |  |
| `mBox21_A` | money | NULL |  |  |
| `mBox25_F` | money | NULL |  |  |
| `mBox26_G` | money | NULL |  |  |
| `mBox34_L` | money | NULL |  |  |
| `mBox42_M` | money | NULL |  |  |
| `mBox49_C1` | money | NULL |  |  |
| `mBox50_I` | money | NULL |  |  |
| `mBox51_J` | money | NULL |  |  |
| `dtLastModified` | datetime | NULL |  | Timestamp when record was last modified |
| `iLastModifiedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who last modified this record |
| `ClientAddressPDF` | varchar(340) | NULL |  |  |
| `FirstNamePDF` | varchar(80) | NULL |  |  |
| `LastNamePDF` | varchar(80) | NULL |  |  |
| `iType` | tinyint | NULL |  | Type/category code |
| `iClientID` | int | NULL |  | FK to UB_Client table - identifies the client/investor |
| `bCorp` | tinyint | NULL |  |  |
| `sec_snm` | varchar(20) | NULL |  |  |
| `sec_gvn_nm` | varchar(12) | NULL |  |  |
| `iNoReleve` | int | NULL |  | Integer field |
| `iNoRelevePrev` | int | NULL |  | Integer field |
| `mBox52_A_5` | money | NULL |  |  |
| `mBox53_A_6` | money | NULL |  |  |

### `UB_RL16_SLP_ARC`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL |  | Primary key, auto-increment identifier |
| `iTaxYear` | int | NULL |  | Integer field |
| `iPlanID` | int | NULL |  | FK to UB_Plan table - identifies the investment plan/account |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `iUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `iFileID` | int | NULL |  | FK to file record (FundServ file) |
| `iStatus` | tinyint | NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `iSubmissionStatus` | tinyint | NULL |  | Small integer/flag field |
| `iFlag` | tinyint | NULL |  | Small integer/flag field |
| `iVoid` | tinyint | NULL |  | Small integer/flag field |
| `iVoidUserID` | int | NULL |  | Integer field |
| `dtVoid` | datetime | NULL |  | Date/time field |
| `iPrinted` | tinyint | NULL |  | Small integer/flag field |
| `dtPrinted` | datetime | NULL |  | Date/time field |
| `iPrintedUserID` | int | NULL |  | Integer field |
| `iObjData` | int | NULL |  | Integer field |
| `iObjDataOrg` | int | NULL |  | Integer field |
| `iApproved` | tinyint | NULL |  | Small integer/flag field |
| `iApprovedUserID` | int | NULL |  | Integer field |
| `dtApproved` | datetime | NULL |  | Date/time field |
| `iClientViewed` | tinyint | NULL |  | Small integer/flag field |
| `dtClientViewed` | datetime | NULL |  | Date/time field |
| `Notes` | varchar(max) | NULL |  |  |
| `snm` | varchar(30) | NULL |  |  |
| `gvn_nm` | varchar(30) | NULL |  |  |
| `init` | char(1) | NULL |  |  |
| `ClientSIN` | varchar(15) | NULL |  |  |
| `addr_l1_txt` | varchar(30) | NULL |  |  |
| `addr_l2_txt` | varchar(30) | NULL |  |  |
| `cty_nm` | varchar(28) | NULL |  |  |
| `prov_cd` | char(2) | NULL |  |  |
| `cntry_cd` | char(3) | NULL |  |  |
| `pstl_cd` | varchar(10) | NULL |  |  |
| `ctrct_nbr` | varchar(12) | NULL |  |  |
| `rpt_tcd` | char(1) | NULL |  |  |
| `RecipientCode` | char(1) | NULL |  |  |
| `joint_sin` | varchar(15) | NULL |  |  |
| `mBox21_A` | money | NULL |  |  |
| `mBox25_F` | money | NULL |  |  |
| `mBox26_G` | money | NULL |  |  |
| `mBox34_L` | money | NULL |  |  |
| `mBox42_M` | money | NULL |  |  |
| `mBox49_C1` | money | NULL |  |  |
| `mBox50_I` | money | NULL |  |  |
| `mBox51_J` | money | NULL |  |  |
| `dtLastModified` | datetime | NULL |  | Timestamp when record was last modified |
| `iLastModifiedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who last modified this record |
| `ClientAddressPDF` | varchar(340) | NULL |  |  |
| `FirstNamePDF` | varchar(80) | NULL |  |  |
| `LastNamePDF` | varchar(80) | NULL |  |  |
| `iType` | tinyint | NULL |  | Type/category code |
| `iClientID` | int | NULL |  | FK to UB_Client table - identifies the client/investor |
| `bCorp` | tinyint | NULL |  |  |
| `sec_snm` | varchar(20) | NULL |  |  |
| `sec_gvn_nm` | varchar(12) | NULL |  |  |
| `iNoReleve` | int | NULL |  | Integer field |
| `iNoRelevePrev` | int | NULL |  | Integer field |
| `mBox52_A_5` | money | NULL |  |  |
| `mBox53_A_6` | money | NULL |  |  |

### `UB_RL16_TRX`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `iSlipID` | int | NOT NULL |  | Integer field |
| `iPlanFundID` | int | NOT NULL |  | Integer field |

### `UB_RL18_SLP`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iTaxYear` | int | NULL |  | Integer field |
| `iPlanID` | int | NULL |  | FK to UB_Plan table - identifies the investment plan/account |
| `iFundPosID` | int | NULL |  | Integer field |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `iUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `iFileID` | int | NULL |  | FK to file record (FundServ file) |
| `iStatus` | tinyint | NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `iSubmissionStatus` | tinyint | NULL |  | Small integer/flag field |
| `iFlag` | tinyint | NULL |  | Small integer/flag field |
| `iVoid` | tinyint | NULL |  | Small integer/flag field |
| `iVoidUserID` | int | NULL |  | Integer field |
| `dtVoid` | datetime | NULL |  | Date/time field |
| `iPrinted` | tinyint | NULL |  | Small integer/flag field |
| `dtPrinted` | datetime | NULL |  | Date/time field |
| `iPrintedUserID` | int | NULL |  | Integer field |
| `iObjData` | int | NULL |  | Integer field |
| `iObjDataOrg` | int | NULL |  | Integer field |
| `iApproved` | tinyint | NULL |  | Small integer/flag field |
| `iApprovedUserID` | int | NULL |  | Integer field |
| `dtApproved` | datetime | NULL |  | Date/time field |
| `iClientViewed` | tinyint | NULL |  | Small integer/flag field |
| `dtClientViewed` | datetime | NULL |  | Date/time field |
| `Notes` | varchar(max) | NULL |  |  |
| `snm` | varchar(30) | NULL |  |  |
| `gvn_nm` | varchar(30) | NULL |  |  |
| `init` | char(1) | NULL |  |  |
| `ClientSIN` | varchar(15) | NULL |  |  |
| `addr_l1_txt` | varchar(30) | NULL |  |  |
| `addr_l2_txt` | varchar(30) | NULL |  |  |
| `cty_nm` | varchar(28) | NULL |  |  |
| `prov_cd` | char(2) | NULL |  |  |
| `cntry_cd` | char(3) | NULL |  |  |
| `pstl_cd` | varchar(10) | NULL |  |  |
| `ctrct_nbr` | varchar(12) | NULL |  |  |
| `rpt_tcd` | char(1) | NULL |  |  |
| `RecipientCode` | char(1) | NULL |  |  |
| `joint_sin` | varchar(15) | NULL |  |  |
| `dtLastModified` | datetime | NULL |  | Timestamp when record was last modified |
| `iLastModifiedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who last modified this record |
| `ClientAddressPDF` | varchar(340) | NULL |  |  |
| `FirstNamePDF` | varchar(80) | NULL |  |  |
| `LastNamePDF` | varchar(80) | NULL |  |  |
| `iType` | tinyint | NULL |  | Type/category code |
| `iClientID` | int | NULL |  | FK to UB_Client table - identifies the client/investor |
| `bCorp` | tinyint | NULL |  |  |
| `sec_snm` | varchar(20) | NULL |  |  |
| `sec_gvn_nm` | varchar(12) | NULL |  |  |
| `iNoReleve` | int | NULL |  | Integer field |
| `iNoRelevePrev` | int | NULL |  | Integer field |
| `FundName` | varchar(80) | NULL |  |  |
| `CurrencyCode` | char(3) | NULL |  |  |
| `mGross` | money | NULL |  |  |
| `mNet` | money | NULL |  |  |
| `mUnit` | money | NULL |  |  |
| `mBookValue` | money | NULL |  |  |
| `mCapGain` | money | NULL |  |  |
| `SecurityType` | char(3) | NULL |  |  |
| `CUSIP` | varchar(12) | NULL |  |  |
| `ISIN` | varchar(15) | NULL |  |  |
| `FundAccountID` | varchar(15) | NULL |  |  |
| `FirstNamePDF2` | varchar(80) | NULL |  |  |
| `LastNamePDF2` | varchar(80) | NULL |  |  |

### `UB_RL18_SLP_ARC`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL |  | Primary key, auto-increment identifier |
| `iTaxYear` | int | NULL |  | Integer field |
| `iPlanID` | int | NULL |  | FK to UB_Plan table - identifies the investment plan/account |
| `iFundPosID` | int | NULL |  | Integer field |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `iUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `iFileID` | int | NULL |  | FK to file record (FundServ file) |
| `iStatus` | tinyint | NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `iSubmissionStatus` | tinyint | NULL |  | Small integer/flag field |
| `iFlag` | tinyint | NULL |  | Small integer/flag field |
| `iVoid` | tinyint | NULL |  | Small integer/flag field |
| `iVoidUserID` | int | NULL |  | Integer field |
| `dtVoid` | datetime | NULL |  | Date/time field |
| `iPrinted` | tinyint | NULL |  | Small integer/flag field |
| `dtPrinted` | datetime | NULL |  | Date/time field |
| `iPrintedUserID` | int | NULL |  | Integer field |
| `iObjData` | int | NULL |  | Integer field |
| `iObjDataOrg` | int | NULL |  | Integer field |
| `iApproved` | tinyint | NULL |  | Small integer/flag field |
| `iApprovedUserID` | int | NULL |  | Integer field |
| `dtApproved` | datetime | NULL |  | Date/time field |
| `iClientViewed` | tinyint | NULL |  | Small integer/flag field |
| `dtClientViewed` | datetime | NULL |  | Date/time field |
| `Notes` | varchar(max) | NULL |  |  |
| `snm` | varchar(30) | NULL |  |  |
| `gvn_nm` | varchar(30) | NULL |  |  |
| `init` | char(1) | NULL |  |  |
| `ClientSIN` | varchar(15) | NULL |  |  |
| `addr_l1_txt` | varchar(30) | NULL |  |  |
| `addr_l2_txt` | varchar(30) | NULL |  |  |
| `cty_nm` | varchar(28) | NULL |  |  |
| `prov_cd` | char(2) | NULL |  |  |
| `cntry_cd` | char(3) | NULL |  |  |
| `pstl_cd` | varchar(10) | NULL |  |  |
| `ctrct_nbr` | varchar(12) | NULL |  |  |
| `rpt_tcd` | char(1) | NULL |  |  |
| `RecipientCode` | char(1) | NULL |  |  |
| `joint_sin` | varchar(15) | NULL |  |  |
| `dtLastModified` | datetime | NULL |  | Timestamp when record was last modified |
| `iLastModifiedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who last modified this record |
| `ClientAddressPDF` | varchar(340) | NULL |  |  |
| `FirstNamePDF` | varchar(80) | NULL |  |  |
| `LastNamePDF` | varchar(80) | NULL |  |  |
| `iType` | tinyint | NULL |  | Type/category code |
| `iClientID` | int | NULL |  | FK to UB_Client table - identifies the client/investor |
| `bCorp` | tinyint | NULL |  |  |
| `sec_snm` | varchar(20) | NULL |  |  |
| `sec_gvn_nm` | varchar(12) | NULL |  |  |
| `iNoReleve` | int | NULL |  | Integer field |
| `iNoRelevePrev` | int | NULL |  | Integer field |
| `FundName` | varchar(80) | NULL |  |  |
| `CurrencyCode` | char(3) | NULL |  |  |
| `mGross` | money | NULL |  |  |
| `mNet` | money | NULL |  |  |
| `mUnit` | money | NULL |  |  |
| `mBookValue` | money | NULL |  |  |
| `mCapGain` | money | NULL |  |  |
| `SecurityType` | char(3) | NULL |  |  |
| `CUSIP` | varchar(12) | NULL |  |  |
| `ISIN` | varchar(15) | NULL |  |  |
| `FundAccountID` | varchar(15) | NULL |  |  |
| `FirstNamePDF2` | varchar(80) | NULL |  |  |
| `LastNamePDF2` | varchar(80) | NULL |  |  |

### `UB_RL18_TRX`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `iSlipID` | int | NOT NULL |  | Integer field |
| `iTrxID` | int | NOT NULL |  | Integer field |

### `UB_RL1Action`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `iRL1ID` | int | NULL |  | Integer field |
| `ActionCode` | char(1) | NULL |  |  |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `iUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |

### `UB_RL2`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iPlanID` | int | NULL |  | FK to UB_Plan table - identifies the investment plan/account |
| `iYear` | int | NULL |  | Integer field |
| `CurrencyCode` | char(3) | NULL |  |  |
| `iStatus` | tinyint | NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `iCreatedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `dtProcessing` | datetime | NULL |  | Date/time field |
| `Notes` | varchar(100) | NULL |  |  |
| `dtLastModify` | datetime | NULL |  | Date/time field |
| `iLastModifiedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who last modified this record |
| `iObjData` | int | NULL |  | Integer field |
| `mGross` | money | NULL |  |  |
| `mNet` | money | NULL |  |  |
| `mTax` | money | NULL |  |  |
| `iPrinted` | tinyint | NULL |  | Small integer/flag field |
| `dtPrinted` | datetime | NULL |  | Date/time field |
| `iSubmitted` | tinyint | NULL |  | Small integer/flag field |
| `dtSubmitted` | datetime | NULL |  | Date/time field |
| `iFileID` | int | NULL |  | FK to file record (FundServ file) |
| `DealerCode` | varchar(5) | NULL |  | Dealer code identifier |
| `ActionCode` | char(1) | NULL |  |  |
| `SIN` | varchar(15) | NULL |  |  |
| `bSpouse` | tinyint | NULL |  |  |
| `SpouseSIN` | varchar(15) | NULL |  |  |
| `ClientFirstName` | varchar(80) | NULL |  |  |
| `ClientLastName` | varchar(80) | NULL |  |  |
| `AccountNumber` | varchar(20) | NULL |  |  |
| `mBoxA` | money | NULL |  |  |
| `mBoxB` | money | NULL |  |  |
| `mBoxC` | money | NULL |  |  |
| `mBoxD` | money | NULL |  |  |
| `mBoxE` | money | NULL |  |  |
| `mBoxF` | money | NULL |  |  |
| `mBoxG` | money | NULL |  |  |
| `mBoxH` | money | NULL |  |  |
| `mBoxI` | money | NULL |  |  |
| `mBoxJ` | money | NULL |  |  |
| `mBoxK` | money | NULL |  |  |
| `mBoxL` | money | NULL |  |  |
| `mBoxO` | money | NULL |  |  |
| `mBoxM` | money | NULL |  |  |
| `ContractNumber` | varchar(20) | NULL |  |  |
| `mTaxFed` | money | NULL |  |  |
| `Line1` | varchar(80) | NULL |  |  |
| `Line2` | varchar(80) | NULL |  |  |
| `Line3` | varchar(80) | NULL |  |  |
| `City` | varchar(50) | NULL |  |  |
| `ProvinceCode` | varchar(3) | NULL |  |  |
| `CountryCode` | varchar(3) | NULL |  |  |
| `PostalCode` | varchar(12) | NULL |  |  |

### `UB_RL2_SLP`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iTaxYear` | int | NULL |  | Integer field |
| `iPlanID` | int | NULL |  | FK to UB_Plan table - identifies the investment plan/account |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `iUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `iFileID` | int | NULL |  | FK to file record (FundServ file) |
| `iStatus` | tinyint | NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `iSubmissionStatus` | tinyint | NULL |  | Small integer/flag field |
| `iFlag` | tinyint | NULL |  | Small integer/flag field |
| `iVoid` | tinyint | NULL |  | Small integer/flag field |
| `iVoidUserID` | int | NULL |  | Integer field |
| `dtVoid` | datetime | NULL |  | Date/time field |
| `iPrinted` | tinyint | NULL |  | Small integer/flag field |
| `dtPrinted` | datetime | NULL |  | Date/time field |
| `iPrintedUserID` | int | NULL |  | Integer field |
| `iObjData` | int | NULL |  | Integer field |
| `iObjDataOrg` | int | NULL |  | Integer field |
| `iApproved` | tinyint | NULL |  | Small integer/flag field |
| `iApprovedUserID` | int | NULL |  | Integer field |
| `dtApproved` | datetime | NULL |  | Date/time field |
| `iClientViewed` | tinyint | NULL |  | Small integer/flag field |
| `dtClientViewed` | datetime | NULL |  | Date/time field |
| `Notes` | varchar(max) | NULL |  |  |
| `FirstNamePDF` | varchar(80) | NULL |  |  |
| `LastNamePDF` | varchar(80) | NULL |  |  |
| `ClientAddressPDF` | varchar(340) | NULL |  |  |
| `dtLastModified` | datetime | NULL |  | Timestamp when record was last modified |
| `iLastModifiedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who last modified this record |
| `ClientFirstName` | varchar(30) | NULL |  |  |
| `ClientLastName` | varchar(30) | NULL |  |  |
| `ClientSIN` | varchar(15) | NULL |  |  |
| `ContractNumber` | varchar(20) | NULL |  |  |
| `bSpouse` | tinyint | NULL |  |  |
| `SpouseSIN` | varchar(15) | NULL |  |  |
| `Line1` | varchar(80) | NULL |  |  |
| `Line2` | varchar(80) | NULL |  |  |
| `Line3` | varchar(80) | NULL |  |  |
| `City` | varchar(50) | NULL |  |  |
| `ProvinceCode` | varchar(3) | NULL |  |  |
| `CountryCode` | varchar(3) | NULL |  |  |
| `PostalCode` | varchar(12) | NULL |  |  |
| `mGross` | money | NULL |  |  |
| `mNet` | money | NULL |  |  |
| `mTaxProv` | money | NULL |  |  |
| `mTaxFed` | money | NULL |  |  |
| `mBoxA` | money | NULL |  |  |
| `mBoxB` | money | NULL |  |  |
| `mBoxC` | money | NULL |  |  |
| `mBoxD` | money | NULL |  |  |
| `mBoxE` | money | NULL |  |  |
| `mBoxF` | money | NULL |  |  |
| `mBoxG` | money | NULL |  |  |
| `mBoxH` | money | NULL |  |  |
| `mBoxI` | money | NULL |  |  |
| `mBoxJ` | money | NULL |  |  |
| `mBoxK` | money | NULL |  |  |
| `mBoxL` | money | NULL |  |  |
| `mBoxO` | money | NULL |  |  |
| `mBoxM` | money | NULL |  |  |
| `dtDOD` | datetime | NULL |  | Date/time field |
| `mDODMKV` | money | NULL |  |  |
| `rpt_tcd` | char(1) | NULL |  |  |
| `iSubmitted` | tinyint | NULL |  | Small integer/flag field |
| `dtSubmitted` | datetime | NULL |  | Date/time field |
| `iNoReleve` | int | NULL |  | Integer field |
| `iNoRelevePrev` | int | NULL |  | Integer field |
| `IncomeSource` | varchar(6) | NULL |  |  |
| `AccountType` | char(2) | NULL |  |  |
| `mBoxB1` | money | NULL |  |  |

### `UB_RL2_SLP_ARC`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL |  | Primary key, auto-increment identifier |
| `iTaxYear` | int | NULL |  | Integer field |
| `iPlanID` | int | NULL |  | FK to UB_Plan table - identifies the investment plan/account |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `iUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `iFileID` | int | NULL |  | FK to file record (FundServ file) |
| `iStatus` | tinyint | NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `iSubmissionStatus` | tinyint | NULL |  | Small integer/flag field |
| `iFlag` | tinyint | NULL |  | Small integer/flag field |
| `iVoid` | tinyint | NULL |  | Small integer/flag field |
| `iVoidUserID` | int | NULL |  | Integer field |
| `dtVoid` | datetime | NULL |  | Date/time field |
| `iPrinted` | tinyint | NULL |  | Small integer/flag field |
| `dtPrinted` | datetime | NULL |  | Date/time field |
| `iPrintedUserID` | int | NULL |  | Integer field |
| `iObjData` | int | NULL |  | Integer field |
| `iObjDataOrg` | int | NULL |  | Integer field |
| `iApproved` | tinyint | NULL |  | Small integer/flag field |
| `iApprovedUserID` | int | NULL |  | Integer field |
| `dtApproved` | datetime | NULL |  | Date/time field |
| `iClientViewed` | tinyint | NULL |  | Small integer/flag field |
| `dtClientViewed` | datetime | NULL |  | Date/time field |
| `Notes` | varchar(max) | NULL |  |  |
| `FirstNamePDF` | varchar(80) | NULL |  |  |
| `LastNamePDF` | varchar(80) | NULL |  |  |
| `ClientAddressPDF` | varchar(340) | NULL |  |  |
| `dtLastModified` | datetime | NULL |  | Timestamp when record was last modified |
| `iLastModifiedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who last modified this record |
| `ClientFirstName` | varchar(30) | NULL |  |  |
| `ClientLastName` | varchar(30) | NULL |  |  |
| `ClientSIN` | varchar(15) | NULL |  |  |
| `ContractNumber` | varchar(20) | NULL |  |  |
| `bSpouse` | tinyint | NULL |  |  |
| `SpouseSIN` | varchar(15) | NULL |  |  |
| `Line1` | varchar(80) | NULL |  |  |
| `Line2` | varchar(80) | NULL |  |  |
| `Line3` | varchar(80) | NULL |  |  |
| `City` | varchar(50) | NULL |  |  |
| `ProvinceCode` | varchar(3) | NULL |  |  |
| `CountryCode` | varchar(3) | NULL |  |  |
| `PostalCode` | varchar(12) | NULL |  |  |
| `mGross` | money | NULL |  |  |
| `mNet` | money | NULL |  |  |
| `mTaxProv` | money | NULL |  |  |
| `mTaxFed` | money | NULL |  |  |
| `mBoxA` | money | NULL |  |  |
| `mBoxB` | money | NULL |  |  |
| `mBoxC` | money | NULL |  |  |
| `mBoxD` | money | NULL |  |  |
| `mBoxE` | money | NULL |  |  |
| `mBoxF` | money | NULL |  |  |
| `mBoxG` | money | NULL |  |  |
| `mBoxH` | money | NULL |  |  |
| `mBoxI` | money | NULL |  |  |
| `mBoxJ` | money | NULL |  |  |
| `mBoxK` | money | NULL |  |  |
| `mBoxL` | money | NULL |  |  |
| `mBoxO` | money | NULL |  |  |
| `mBoxM` | money | NULL |  |  |
| `dtDOD` | datetime | NULL |  | Date/time field |
| `mDODMKV` | money | NULL |  |  |
| `rpt_tcd` | char(1) | NULL |  |  |
| `iSubmitted` | tinyint | NULL |  | Small integer/flag field |
| `dtSubmitted` | datetime | NULL |  | Date/time field |
| `iNoReleve` | int | NULL |  | Integer field |
| `iNoRelevePrev` | int | NULL |  | Integer field |
| `IncomeSource` | varchar(6) | NULL |  |  |
| `AccountType` | char(2) | NULL |  |  |
| `mBoxB1` | money | NULL |  |  |

### `UB_RL2_TRX`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `iSlipID` | int | NOT NULL |  | Integer field |
| `iTrustTrxID` | int | NOT NULL |  | Integer field |

### `UB_RL2Obj`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL |  | Primary key, auto-increment identifier |
| `iObjData` | int | NOT NULL |  | Integer field |
| `iUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |

### `UB_RL3_SLP`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iTaxYear` | int | NULL |  | Integer field |
| `iPlanID` | int | NULL |  | FK to UB_Plan table - identifies the investment plan/account |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `iUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `iFileID` | int | NULL |  | FK to file record (FundServ file) |
| `iStatus` | tinyint | NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `iSubmissionStatus` | tinyint | NULL |  | Small integer/flag field |
| `iFlag` | tinyint | NULL |  | Small integer/flag field |
| `iVoid` | tinyint | NULL |  | Small integer/flag field |
| `iVoidUserID` | int | NULL |  | Integer field |
| `dtVoid` | datetime | NULL |  | Date/time field |
| `iPrinted` | tinyint | NULL |  | Small integer/flag field |
| `dtPrinted` | datetime | NULL |  | Date/time field |
| `iPrintedUserID` | int | NULL |  | Integer field |
| `iObjData` | int | NULL |  | Integer field |
| `iObjDataOrg` | int | NULL |  | Integer field |
| `iApproved` | tinyint | NULL |  | Small integer/flag field |
| `iApprovedUserID` | int | NULL |  | Integer field |
| `dtApproved` | datetime | NULL |  | Date/time field |
| `iClientViewed` | tinyint | NULL |  | Small integer/flag field |
| `dtClientViewed` | datetime | NULL |  | Date/time field |
| `Notes` | varchar(max) | NULL |  |  |
| `snm` | varchar(30) | NULL |  |  |
| `gvn_nm` | varchar(30) | NULL |  |  |
| `init` | char(1) | NULL |  |  |
| `ClientSIN` | varchar(15) | NULL |  |  |
| `addr_l1_txt` | varchar(30) | NULL |  |  |
| `addr_l2_txt` | varchar(30) | NULL |  |  |
| `cty_nm` | varchar(28) | NULL |  |  |
| `prov_cd` | char(2) | NULL |  |  |
| `cntry_cd` | char(3) | NULL |  |  |
| `pstl_cd` | varchar(10) | NULL |  |  |
| `ctrct_nbr` | varchar(12) | NULL |  |  |
| `rpt_tcd` | char(1) | NULL |  |  |
| `RecipientCode` | char(1) | NULL |  |  |
| `joint_sin` | varchar(15) | NULL |  |  |
| `mBox24_A1` | money | NULL |  |  |
| `mBox10_A2` | money | NULL |  |  |
| `mBox11_25_B` | money | NULL |  |  |
| `mBox12_26_C` | money | NULL |  |  |
| `mBox13_D` | money | NULL |  |  |
| `mBox14_E` | money | NULL |  |  |
| `mBox15_F` | money | NULL |  |  |
| `mBox16_G` | money | NULL |  |  |
| `mBox17_H` | money | NULL |  |  |
| `mBox18_I` | money | NULL |  |  |
| `mBox19_J` | money | NULL |  |  |
| `mBox30_K` | money | NULL |  |  |
| `dtLastModified` | datetime | NULL |  | Timestamp when record was last modified |
| `iLastModifiedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who last modified this record |
| `ClientAddressPDF` | varchar(340) | NULL |  |  |
| `FirstNamePDF` | varchar(80) | NULL |  |  |
| `LastNamePDF` | varchar(80) | NULL |  |  |
| `iType` | tinyint | NULL |  | Type/category code |
| `iClientID` | int | NULL |  | FK to UB_Client table - identifies the client/investor |
| `bCorp` | tinyint | NULL |  |  |
| `sec_snm` | varchar(20) | NULL |  |  |
| `sec_gvn_nm` | varchar(12) | NULL |  |  |
| `iNoReleve` | int | NULL |  | Integer field |
| `iNoRelevePrev` | int | NULL |  | Integer field |
| `CurrencySymbol` | char(3) | NULL |  |  |
| `mBox34_I1` | money | NULL |  |  |

### `UB_RL3_SLP_ARC`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL |  | Primary key, auto-increment identifier |
| `iTaxYear` | int | NULL |  | Integer field |
| `iPlanID` | int | NULL |  | FK to UB_Plan table - identifies the investment plan/account |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `iUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `iFileID` | int | NULL |  | FK to file record (FundServ file) |
| `iStatus` | tinyint | NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `iSubmissionStatus` | tinyint | NULL |  | Small integer/flag field |
| `iFlag` | tinyint | NULL |  | Small integer/flag field |
| `iVoid` | tinyint | NULL |  | Small integer/flag field |
| `iVoidUserID` | int | NULL |  | Integer field |
| `dtVoid` | datetime | NULL |  | Date/time field |
| `iPrinted` | tinyint | NULL |  | Small integer/flag field |
| `dtPrinted` | datetime | NULL |  | Date/time field |
| `iPrintedUserID` | int | NULL |  | Integer field |
| `iObjData` | int | NULL |  | Integer field |
| `iObjDataOrg` | int | NULL |  | Integer field |
| `iApproved` | tinyint | NULL |  | Small integer/flag field |
| `iApprovedUserID` | int | NULL |  | Integer field |
| `dtApproved` | datetime | NULL |  | Date/time field |
| `iClientViewed` | tinyint | NULL |  | Small integer/flag field |
| `dtClientViewed` | datetime | NULL |  | Date/time field |
| `Notes` | varchar(max) | NULL |  |  |
| `snm` | varchar(30) | NULL |  |  |
| `gvn_nm` | varchar(30) | NULL |  |  |
| `init` | char(1) | NULL |  |  |
| `ClientSIN` | varchar(15) | NULL |  |  |
| `addr_l1_txt` | varchar(30) | NULL |  |  |
| `addr_l2_txt` | varchar(30) | NULL |  |  |
| `cty_nm` | varchar(28) | NULL |  |  |
| `prov_cd` | char(2) | NULL |  |  |
| `cntry_cd` | char(3) | NULL |  |  |
| `pstl_cd` | varchar(10) | NULL |  |  |
| `ctrct_nbr` | varchar(12) | NULL |  |  |
| `rpt_tcd` | char(1) | NULL |  |  |
| `RecipientCode` | char(1) | NULL |  |  |
| `joint_sin` | varchar(15) | NULL |  |  |
| `mBox24_A1` | money | NULL |  |  |
| `mBox10_A2` | money | NULL |  |  |
| `mBox11_25_B` | money | NULL |  |  |
| `mBox12_26_C` | money | NULL |  |  |
| `mBox13_D` | money | NULL |  |  |
| `mBox14_E` | money | NULL |  |  |
| `mBox15_F` | money | NULL |  |  |
| `mBox16_G` | money | NULL |  |  |
| `mBox17_H` | money | NULL |  |  |
| `mBox18_I` | money | NULL |  |  |
| `mBox19_J` | money | NULL |  |  |
| `mBox30_K` | money | NULL |  |  |
| `dtLastModified` | datetime | NULL |  | Timestamp when record was last modified |
| `iLastModifiedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who last modified this record |
| `ClientAddressPDF` | varchar(340) | NULL |  |  |
| `FirstNamePDF` | varchar(80) | NULL |  |  |
| `LastNamePDF` | varchar(80) | NULL |  |  |
| `iType` | tinyint | NULL |  | Type/category code |
| `iClientID` | int | NULL |  | FK to UB_Client table - identifies the client/investor |
| `bCorp` | tinyint | NULL |  |  |
| `sec_snm` | varchar(20) | NULL |  |  |
| `sec_gvn_nm` | varchar(12) | NULL |  |  |
| `iNoReleve` | int | NULL |  | Integer field |
| `iNoRelevePrev` | int | NULL |  | Integer field |
| `CurrencySymbol` | char(3) | NULL |  |  |
| `mBox34_I1` | money | NULL |  |  |

### `UB_RL3_TRX`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `iSlipID` | int | NOT NULL |  | Integer field |
| `iPlanFundID` | int | NOT NULL |  | Integer field |

---

## TFSA (Tax-Free Savings Account)

### `UB_TFSA`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iTrustID` | int | NOT NULL |  | Integer field |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `iVoid` | tinyint | NULL |  | Small integer/flag field |
| `iVoidUserID` | int | NULL |  | Integer field |
| `dtVoid` | datetime | NULL |  | Date/time field |
| `Notes` | varchar(200) | NULL |  |  |
| `iPrinted` | tinyint | NULL |  | Small integer/flag field |
| `dtPrinted` | datetime | NULL |  | Date/time field |
| `iFileID` | int | NULL |  | FK to file record (FundServ file) |
| `iObjData` | int | NULL |  | Integer field |
| `iUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `mAmount` | money | NULL |  | Monetary amount |
| `ReceiptID` | varchar(15) | NULL |  |  |
| `iStatus` | tinyint | NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `iYear` | int | NULL |  | Integer field |
| `iPlanID` | int | NULL |  | FK to UB_Plan table - identifies the investment plan/account |

### `UB_TFSA_Ident`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iYear` | int | NULL |  | Integer field |
| `iPlanID` | int | NULL |  | FK to UB_Plan table - identifies the investment plan/account |
| `iStatus` | tinyint | NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `iVoid` | tinyint | NULL |  | Small integer/flag field |
| `iVoidUserID` | int | NULL |  | Integer field |
| `dtVoid` | datetime | NULL |  | Date/time field |
| `Notes` | varchar(200) | NULL |  |  |
| `iPrinted` | tinyint | NULL |  | Small integer/flag field |
| `dtPrinted` | datetime | NULL |  | Date/time field |
| `iFileID` | int | NULL |  | FK to file record (FundServ file) |
| `iObjData` | int | NULL |  | Integer field |
| `iUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `tfsa_ctrct_nbr` | varchar(30) | NULL |  |  |
| `tfsa_hldr_sin` | varchar(9) | NULL |  |  |
| `tfsa_hldr_snm` | varchar(30) | NULL |  |  |
| `tfsa_hldr_gvn_nm` | varchar(30) | NULL |  |  |
| `tfsa_hldr_init` | char(1) | NULL |  |  |
| `tfsa_hldr_addr_l1_txt` | varchar(30) | NULL |  |  |
| `tfsa_hldr_addr_l2_txt` | varchar(30) | NULL |  |  |
| `tfsa_hldr_cty_nm` | varchar(28) | NULL |  |  |
| `tfsa_hldr_pvst_cd` | char(2) | NULL |  |  |
| `tfsa_hldr_cntry_cd` | char(3) | NULL |  |  |
| `hldr_pstl_zip_cd` | varchar(10) | NULL |  |  |
| `dtDOB` | datetime | NULL |  | Date of birth |
| `dtDOD` | datetime | NULL |  | Date/time field |
| `m_fmv_at_dthamt` | money | NULL |  |  |
| `tfsa_new_ctrct_ind` | char(1) | NULL |  |  |
| `dtStart` | datetime | NULL |  | Date/time field |
| `ctrct_trmnt_ind` | char(1) | NULL |  |  |
| `dtClose` | datetime | NULL |  | Date/time field |
| `tfsa_scsr_ind` | char(1) | NULL |  |  |
| `dces_tfsa_snm` | varchar(30) | NULL |  |  |
| `dces_tfsa_gvn_nm` | varchar(30) | NULL |  |  |
| `dces_tfsa_init` | char(1) | NULL |  |  |
| `dces_tfsa_sin` | varchar(9) | NULL |  |  |
| `dtDeceasedDOD` | datetime | NULL |  | Date/time field |
| `m_cye_fmv_amt` | money | NULL |  |  |
| `i_stot_trans_cnt` | int | NULL |  |  |
| `m_stot_cnamt` | money | NULL |  |  |
| `m_stot_wdamt` | money | NULL |  |  |
| `m_stot_mbk_out_amt` | money | NULL |  |  |
| `m_stot_mbk_in_amt` | money | NULL |  |  |
| `slip_type_code` | char(1) | NULL |  |  |
| `iFlag` | tinyint | NULL |  | Small integer/flag field |
| `iPlanID2` | int | NULL |  | Integer field |
| `iOrgID` | int | NULL |  | Integer field |
| `slip_type_code_org` | char(1) | NULL |  |  |

### `UB_TFSA_Ident_ARC`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL |  | Primary key, auto-increment identifier |
| `iYear` | int | NULL |  | Integer field |
| `iPlanID` | int | NULL |  | FK to UB_Plan table - identifies the investment plan/account |
| `iStatus` | tinyint | NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `iVoid` | tinyint | NULL |  | Small integer/flag field |
| `iVoidUserID` | int | NULL |  | Integer field |
| `dtVoid` | datetime | NULL |  | Date/time field |
| `Notes` | varchar(200) | NULL |  |  |
| `iPrinted` | tinyint | NULL |  | Small integer/flag field |
| `dtPrinted` | datetime | NULL |  | Date/time field |
| `iFileID` | int | NULL |  | FK to file record (FundServ file) |
| `iObjData` | int | NULL |  | Integer field |
| `iUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `tfsa_ctrct_nbr` | varchar(30) | NULL |  |  |
| `tfsa_hldr_sin` | varchar(9) | NULL |  |  |
| `tfsa_hldr_snm` | varchar(30) | NULL |  |  |
| `tfsa_hldr_gvn_nm` | varchar(30) | NULL |  |  |
| `tfsa_hldr_init` | char(1) | NULL |  |  |
| `tfsa_hldr_addr_l1_txt` | varchar(30) | NULL |  |  |
| `tfsa_hldr_addr_l2_txt` | varchar(30) | NULL |  |  |
| `tfsa_hldr_cty_nm` | varchar(28) | NULL |  |  |
| `tfsa_hldr_pvst_cd` | char(2) | NULL |  |  |
| `tfsa_hldr_cntry_cd` | char(3) | NULL |  |  |
| `hldr_pstl_zip_cd` | varchar(10) | NULL |  |  |
| `dtDOB` | datetime | NULL |  | Date of birth |
| `dtDOD` | datetime | NULL |  | Date/time field |
| `m_fmv_at_dthamt` | money | NULL |  |  |
| `tfsa_new_ctrct_ind` | char(1) | NULL |  |  |
| `dtStart` | datetime | NULL |  | Date/time field |
| `ctrct_trmnt_ind` | char(1) | NULL |  |  |
| `dtClose` | datetime | NULL |  | Date/time field |
| `tfsa_scsr_ind` | char(1) | NULL |  |  |
| `dces_tfsa_snm` | varchar(30) | NULL |  |  |
| `dces_tfsa_gvn_nm` | varchar(30) | NULL |  |  |
| `dces_tfsa_init` | char(1) | NULL |  |  |
| `dces_tfsa_sin` | varchar(9) | NULL |  |  |
| `dtDeceasedDOD` | datetime | NULL |  | Date/time field |
| `m_cye_fmv_amt` | money | NULL |  |  |
| `i_stot_trans_cnt` | int | NULL |  |  |
| `m_stot_cnamt` | money | NULL |  |  |
| `m_stot_wdamt` | money | NULL |  |  |
| `m_stot_mbk_out_amt` | money | NULL |  |  |
| `m_stot_mbk_in_amt` | money | NULL |  |  |
| `slip_type_code` | char(1) | NULL |  |  |
| `iFlag` | tinyint | NULL |  | Small integer/flag field |
| `iOrgID` | int | NULL |  | Integer field |
| `slip_type_code_org` | char(1) | NULL |  |  |

### `UB_TFSA_Trans`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iIdentID` | int | NULL |  | Integer field |
| `iYear` | int | NULL |  | Integer field |
| `iPlanID` | int | NULL |  | FK to UB_Plan table - identifies the investment plan/account |
| `dtTrx` | datetime | NULL |  | Date/time field |
| `m_cnamt` | money | NULL |  |  |
| `m_wdamt` | money | NULL |  |  |
| `m_mbk_trnsf_out_amt` | money | NULL |  |  |
| `m_mbk_trnsf_in_amt` | money | NULL |  |  |
| `frmr_sps_snm` | varchar(30) | NULL |  |  |
| `frmr_sps_gvn_nm` | varchar(30) | NULL |  |  |
| `frmr_sps_sin` | varchar(9) | NULL |  |  |
| `m_aqstn_nqlf_fmv_amt` | money | NULL |  |  |
| `m_dispn_nqlf_fmv_amt` | money | NULL |  |  |

### `UB_TFSA_Trans_ARC`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL |  | Primary key, auto-increment identifier |
| `iIdentID` | int | NULL |  | Integer field |
| `iYear` | int | NULL |  | Integer field |
| `iPlanID` | int | NULL |  | FK to UB_Plan table - identifies the investment plan/account |
| `dtTrx` | datetime | NULL |  | Date/time field |
| `m_cnamt` | money | NULL |  |  |
| `m_wdamt` | money | NULL |  |  |
| `m_mbk_trnsf_out_amt` | money | NULL |  |  |
| `m_mbk_trnsf_in_amt` | money | NULL |  |  |
| `frmr_sps_snm` | varchar(30) | NULL |  |  |
| `frmr_sps_gvn_nm` | varchar(30) | NULL |  |  |
| `frmr_sps_sin` | varchar(9) | NULL |  |  |
| `m_aqstn_nqlf_fmv_amt` | money | NULL |  |  |
| `m_dispn_nqlf_fmv_amt` | money | NULL |  |  |

---

## Trust Account Management

### `UB_TrustTrx`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iClientID` | int | NULL |  | FK to UB_Client table - identifies the client/investor |
| `iPlanID` | int | NULL |  | FK to UB_Plan table - identifies the investment plan/account |
| `iType` | tinyint | NULL |  | Type/category code |
| `iType2` | tinyint | NULL |  | Small integer/flag field |
| `iDepositType` | tinyint | NULL |  | Small integer/flag field |
| `iStatus` | tinyint | NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `iTrustDepositID` | int | NULL |  | Integer field |
| `iTrxID` | int | NULL |  | Integer field |
| `iOrderID` | int | NULL |  | Integer field |
| `iAccountID` | int | NULL |  | Integer field |
| `iAccountPosID` | int | NULL |  | Integer field |
| `CurrencyCode` | varchar(3) | NULL |  |  |
| `iBankAccID` | int | NULL |  | Integer field |
| `mAmount` | money | NULL |  | Monetary amount |
| `mAmountCredit` | money | NULL |  | Monetary amount |
| `mAmountDebit` | money | NULL |  | Monetary amount |
| `dtEffective` | datetime | NULL |  | Effective date |
| `dtSettlement` | datetime | NULL |  | Settlement date |
| `iSettledUserID` | int | NULL |  | Integer field |
| `mAmountERR` | money | NULL |  | Monetary amount |
| `mAmountERV` | money | NULL |  | Monetary amount |
| `mAmountEER` | money | NULL |  | Monetary amount |
| `mAmountEEV` | money | NULL |  | Monetary amount |
| `mAmountUsed` | money | NULL |  | Monetary amount |
| `mAmountLeft` | money | NULL |  | Monetary amount |
| `bUsed` | tinyint | NULL |  |  |
| `bPlanSpecific` | tinyint | NULL |  |  |
| `bRRSP60` | tinyint | NULL |  |  |
| `Notes` | varchar(max) | NULL |  |  |
| `iCreatedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `iLastModifiedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who last modified this record |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `dtLastModified` | datetime | NULL |  | Timestamp when record was last modified |
| `MgmtCode` | varchar(12) | NULL |  | Management company code |
| `iWFID` | int | NULL |  | Integer field |
| `iRepID` | int | NULL |  | FK to UB_Rep - identifies the representative/advisor |
| `DealerCode` | varchar(5) | NULL |  | Dealer code identifier |
| `RepCode` | varchar(5) | NULL |  | Representative/advisor code |
| `iReceiptOption` | tinyint | NULL |  | Small integer/flag field |
| `BDR` | varchar(20) | NULL |  |  |
| `iBDRUserID` | int | NULL |  | Integer field |
| `dtBDR` | datetime | NULL |  | Date/time field |
| `iChequeID` | int | NULL |  | Integer field |
| `ContrWdrCode` | char(1) | NULL |  |  |
| `iLastTaxReceiptID` | int | NULL |  | Integer field |
| `iEFTID` | int | NULL |  | Integer field |
| `mTax` | money | NULL |  |  |
| `iTrustIDLink` | int | NULL |  | Integer field |
| `iTrustIDLinkP` | int | NULL |  | Integer field |
| `mTaxP` | money | NULL |  |  |
| `iProvincial` | tinyint | NULL |  | Small integer/flag field |
| `mGAmount` | money | NULL |  |  |
| `iPYMTMethod` | tinyint | NULL |  | Small integer/flag field |
| `iFeeID` | int | NULL |  | Integer field |
| `fmrSpouseFName` | varchar(30) | NULL |  |  |
| `fmrSpouseLName` | varchar(30) | NULL |  |  |
| `fmrSpouseSIN` | varchar(9) | NULL |  |  |
| `iLastRL2ReceiptID` | int | NULL |  | Integer field |
| `iLastNR4ReceiptID` | int | NULL |  | Integer field |
| `fmrSpouseAddressID` | int | NULL |  |  |
| `SourceCode` | char(1) | NULL |  |  |
| `iXRateOpt` | tinyint | NULL |  | Small integer/flag field |
| `fXRate` | float | NULL |  | Decimal/float value |
| `iEstateFlag` | tinyint | NULL |  | Small integer/flag field |
| `iGICTrxID` | int | NULL |  | Integer field |
| `iGICAccountID` | int | NULL |  | Integer field |
| `bLocked` | tinyint | NULL |  |  |
| `TaxCode` | varchar(3) | NULL |  |  |
| `iEFTID2` | int | NULL |  | Integer field |
| `iEFTID3` | int | NULL |  | Integer field |
| `iEFTID4` | int | NULL |  | Integer field |

### `UB_TrustTrxBank`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `iTrxID` | int | NOT NULL |  | Integer field |
| `HolderName` | varchar(40) | NULL |  |  |
| `AccountType` | char(1) | NULL |  |  |
| `Code` | varchar(3) | NULL |  |  |
| `TransitNumber` | varchar(5) | NULL |  |  |
| `AccountNumber` | varchar(12) | NULL |  |  |
| `CurrencyCode` | varchar(2) | NULL |  |  |

### `UB_TrustTrxCheque`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `iTrxID` | int | NOT NULL |  | Integer field |
| `Type` | char(1) | NULL |  |  |
| `Title` | char(1) | NULL |  |  |
| `LastName` | varchar(80) | NULL |  | Last name |
| `FirstName` | varchar(20) | NULL |  | First name |
| `Address` | varchar(120) | NULL |  |  |
| `City` | varchar(30) | NULL |  |  |
| `Province` | varchar(2) | NULL |  |  |
| `Country` | varchar(3) | NULL |  |  |
| `PostalCode` | varchar(10) | NULL |  |  |

### `UB_TrustTrxDetail`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iTrustID` | int | NOT NULL |  | Integer field |
| `iTrustDepositID` | int | NOT NULL |  | Integer field |
| `mAmount` | money | NOT NULL |  | Monetary amount |

### `UB_TrustTrxEstate`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iTrustTrxID` | int | NULL |  | Integer field |
| `LastName` | varchar(80) | NULL |  | Last name |
| `FirstName` | varchar(40) | NULL |  | First name |
| `SIN` | varchar(15) | NULL |  |  |
| `iAddressID` | int | NULL |  | Integer field |
| `mBox16` | money | NULL |  |  |
| `mBox22` | money | NULL |  |  |
| `mBox24` | money | NULL |  |  |
| `mBox28` | money | NULL |  |  |

---

## TS File Processing (FundServ)

### `UB_TSFile_Detail`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iHeaderID` | int | NULL |  | FK to parent header record |
| `iTrxID` | int | NULL |  | Integer field |
| `iTrxIDFrom` | int | NULL |  | Integer field |

### `UB_TSFile_Header`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `DealerCode` | varchar(4) | NULL |  | Dealer code identifier |
| `iStatus` | tinyint | NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `FileName` | varchar(80) | NULL |  | File name |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `MgmtCode` | varchar(4) | NULL |  | Management company code |
| `iSequence` | int | NULL |  | Sequence number |
| `dtEffective` | datetime | NULL |  | Effective date |

### `UB_TSFile_TrxWaiting`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iTrxID` | int | NULL |  | Integer field |
| `iTrxIDFrom` | int | NULL |  | Integer field |
| `DealerCode` | varchar(4) | NULL |  | Dealer code identifier |
| `MgmtCode` | varchar(5) | NULL |  | Management company code |

---

## VieFUND Core

### `CON_ClientID`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `iWFID` | int | NOT NULL |  | Integer field |
| `iConversionID` | int | NOT NULL |  | Integer field |
| `iClientID` | int | NULL |  | FK to UB_Client table - identifies the client/investor |

### `CON_FundPos4AUA`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `iID` | int | NOT NULL | Y | Integer field |
| `iPosID` | int | NOT NULL |  | FK to position record (fund holding) |
| `iStatus` | tinyint | NOT NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |

### `CON_ID`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `iConversionID` | int | NOT NULL |  | Integer field |
| `ConversionDescription` | varchar(50) | NULL |  |  |
| `iSource` | tinyint | NULL |  | Small integer/flag field |
| `DealerRepCodeArray` | varchar(max) | NULL |  | Representative/advisor code |

### `CON_PlanID`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `iConversionID` | int | NOT NULL |  | Integer field |
| `iWFID` | int | NOT NULL |  | Integer field |
| `iPlanID` | int | NULL |  | FK to UB_Plan table - identifies the investment plan/account |

### `CON_PosID`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `iConversionID` | int | NOT NULL |  | Integer field |
| `iWFID` | int | NOT NULL |  | Integer field |
| `iPosID` | int | NULL |  | FK to position record (fund holding) |

### `CON_RepCode`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `DealerCode` | varchar(4) | NULL |  | Dealer code identifier |
| `RepCode` | varchar(5) | NULL |  | Representative/advisor code |

### `CON_RepListExclude`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `DealerRepCode` | varchar(15) | NOT NULL |  | Representative/advisor code |

### `CON_RepListMap`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `DealerRepCodeSource` | varchar(15) | NOT NULL |  | Representative/advisor code |
| `DealerCode` | varchar(5) | NOT NULL |  | Dealer code identifier |
| `RepCode` | varchar(6) | NOT NULL |  | Representative/advisor code |

### `CON_RepMap`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `DealerRepCode` | varchar(15) | NOT NULL |  | Representative/advisor code |
| `FirstName` | varchar(80) | NULL |  | First name |
| `LastName` | varchar(80) | NULL |  | Last name |

### `CON_Result`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `Code` | varchar(50) | NOT NULL |  |  |
| `iCount` | int | NULL |  | Integer field |

### `CON_TrxID`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `iConversionID` | int | NOT NULL |  | Integer field |
| `iWFID` | int | NOT NULL |  | Integer field |
| `iTrxID` | int | NULL |  | Integer field |

### `CON_WF_DefFieldID`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `WFGroupID` | smallint | NULL |  |  |
| `WFObjectID` | int | NULL |  |  |
| `iDefFieldID` | int | NULL |  | Integer field |

### `CON_WF_FundPos`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `iID` | int | NOT NULL | Y | Integer field |
| `iWFPlanID` | int | NULL |  | Integer field |
| `iWFPosID` | int | NOT NULL |  | Integer field |
| `iStatus` | tinyint | NOT NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |

### `CON_WF_Log`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `iID` | int | NOT NULL | Y | Integer field |
| `MSG` | varchar(max) | NULL |  |  |

### `CON_WF_Rep`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `iWFRepID` | int | NULL |  | Integer field |

### `CON_WF_Step`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `iStep` | int | NOT NULL |  | Integer field |
| `Description` | varchar(100) | NOT NULL |  |  |
| `iStatus` | tinyint | NOT NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `dtEffective` | datetime | NOT NULL |  | Effective date |

### `Dealer_TMP1`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `DealerCode` | varchar(5) | NULL |  | Dealer code identifier |
| `DealerName` | varchar(200) | NULL |  |  |
| `Currency` | varchar(20) | NULL |  |  |

### `Dealer_TMP2`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `DealerCode` | varchar(5) | NULL |  | Dealer code identifier |
| `DealerName` | varchar(200) | NULL |  |  |

### `DianeKYC`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `PLAN_ID` | int | NULL |  |  |
| `PLAN_FPRIMARYOBJ1` | float | NULL |  |  |
| `PLAN_FPRIMARYOBJ2` | float | NULL |  |  |
| `PLAN_FPRIMARYOBJ3` | float | NULL |  |  |
| `PLAN_FPRIMARYOBJ4` | float | NULL |  |  |
| `PLAN_FPRIMARYOBJ5` | float | NULL |  |  |
| `PLAN_FRISK1` | float | NULL |  |  |
| `PLAN_FRISK2` | float | NULL |  |  |
| `PLAN_FRISK3` | float | NULL |  |  |
| `PLAN_FRISK4` | float | NULL |  |  |
| `PLAN_FRISK5` | float | NULL |  |  |
| `PLAN_FRISK6` | float | NULL |  |  |
| `PLAN_SECONDARYOBJ1` | varchar(255) | NULL |  |  |
| `PLAN_SECONDARYOBJ2` | varchar(255) | NULL |  |  |
| `PLAN_SECONDARYOBJ3` | varchar(255) | NULL |  |  |
| `PLAN_SECONDARYOBJ4` | varchar(255) | NULL |  |  |
| `PLAN_SECONDARYOBJ5` | varchar(255) | NULL |  |  |
| `PLAN_TIMEHORIZON` | varchar(255) | NULL |  |  |

### `IniFundClass`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `Code` | char(2) | NULL |  |  |
| `NameEN` | varchar(200) | NULL |  | English name |
| `NameFR` | varchar(200) | NULL |  | French name |

### `InitDataBank`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `BankCode` | varchar(20) | NULL |  |  |
| `BankSymbol` | varchar(50) | NULL |  |  |
| `BankNameEN` | varchar(200) | NULL |  |  |
| `BankNameFR` | varchar(200) | NULL |  |  |
| `BankAddress` | varchar(140) | NULL |  |  |
| `BankCity` | varchar(50) | NULL |  |  |
| `BankProvince` | varchar(50) | NULL |  |  |
| `BankPostalCode` | varchar(20) | NULL |  |  |
| `BankCountry` | varchar(20) | NULL |  |  |

### `InitDataBankBranch`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `BankCode` | varchar(50) | NULL |  |  |
| `TransitNumber` | varchar(50) | NULL |  |  |
| `NameEN` | varchar(200) | NULL |  | English name |
| `NameFR` | varchar(200) | NULL |  | French name |
| `Address` | varchar(140) | NULL |  |  |
| `City` | varchar(50) | NULL |  |  |
| `Province` | varchar(50) | NULL |  |  |
| `PostalCode` | varchar(20) | NULL |  |  |
| `Phone` | varchar(20) | NULL |  |  |
| `Fax` | varchar(20) | NULL |  |  |

### `InitDataBankBranch2`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `BankCode` | varchar(50) | NULL |  |  |
| `TransitNumber` | varchar(50) | NULL |  |  |
| `NameEN` | varchar(200) | NULL |  | English name |
| `NameFR` | varchar(200) | NULL |  | French name |
| `Address` | varchar(140) | NULL |  |  |
| `City` | varchar(50) | NULL |  |  |
| `Province` | varchar(50) | NULL |  |  |
| `PostalCode` | varchar(20) | NULL |  |  |
| `Phone` | varchar(20) | NULL |  |  |
| `Fax` | varchar(20) | NULL |  |  |

### `InitForms`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `Type` | int | NULL |  |  |
| `PathEN` | varchar(max) | NULL |  |  |
| `PathFR` | varchar(max) | NULL |  |  |
| `DescEN` | varchar(max) | NULL |  |  |
| `DescFR` | varchar(max) | NULL |  |  |
| `FC` | varchar(20) | NULL |  |  |

### `KBOS_GICProductMap`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `Supplier` | varchar(200) | NULL |  |  |
| `MgmtCode` | varchar(5) | NULL |  | Management company code |
| `FundID` | varchar(5) | NULL |  | Fund identifier code (e.g., DYN 3056) |

### `KBOS_TrxType`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `Trade_Type` | varchar(60) | NOT NULL |  |  |
| `Type` | varchar(60) | NOT NULL |  |  |
| `Type_Detail` | varchar(60) | NOT NULL |  |  |
| `Product_Event` | varchar(60) | NOT NULL |  |  |
| `iTrxType` | int | NULL |  | Integer field |

### `OB_KYCApproval`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL |  | Primary key, auto-increment identifier |
| `iAttachedID` | int | NULL |  | Integer field |
| `iApprovalStatus` | tinyint | NULL |  | Small integer/flag field |
| `UserName` | varchar(255) | NULL |  |  |
| `dtApprove` | datetime | NULL |  | Date/time field |
| `Notes` | varchar(max) | NULL |  |  |
| `iLevel` | tinyint | NULL |  | Small integer/flag field |
| `iNotificationStatus` | tinyint | NULL |  | Small integer/flag field |
| `iCategory` | tinyint | NULL |  | Small integer/flag field |
| `iClientID` | int | NULL |  | FK to UB_Client table - identifies the client/investor |
| `iPlanID` | int | NULL |  | FK to UB_Plan table - identifies the investment plan/account |
| `iObjID` | int | NULL |  | Integer field |

### `OB_PlanApproval`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL |  | Primary key, auto-increment identifier |
| `iPlanID` | int | NULL |  | FK to UB_Plan table - identifies the investment plan/account |
| `iApprovalStatus` | tinyint | NULL |  | Small integer/flag field |
| `UserName` | varchar(255) | NULL |  |  |
| `dtApprove` | datetime | NULL |  | Date/time field |
| `Notes` | varchar(max) | NULL |  |  |
| `iLevel` | tinyint | NULL |  | Small integer/flag field |
| `iNotificationStatus` | tinyint | NULL |  | Small integer/flag field |
| `iCategory` | tinyint | NULL |  | Small integer/flag field |

### `OB_TrxApproval`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL |  | Primary key, auto-increment identifier |
| `iTrxID` | int | NULL |  | Integer field |
| `iApprovalStatus` | tinyint | NULL |  | Small integer/flag field |
| `UserName` | varchar(255) | NULL |  |  |
| `dtApprove` | datetime | NULL |  | Date/time field |
| `Notes` | varchar(max) | NULL |  |  |
| `iLevel` | tinyint | NULL |  | Small integer/flag field |
| `iNotificationStatus` | tinyint | NULL |  | Small integer/flag field |
| `iCategory` | tinyint | NULL |  | Small integer/flag field |
| `iTrxType` | smallint | NULL |  |  |

### `OM_ConversionDetail`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iConversionHeaderID` | int | NULL |  | Integer field |
| `iPosIDFrom` | int | NULL |  | Integer field |
| `iTrxIDFrom` | int | NULL |  | Integer field |
| `fUnitFrom` | float | NULL |  | Decimal/float value |
| `mAmountFrom` | money | NULL |  | Monetary amount |
| `iPosIDTo` | int | NULL |  | Integer field |
| `iTrxIDTo` | int | NULL |  | Integer field |
| `fUnitTo` | float | NULL |  | Decimal/float value |
| `mAmountTo` | money | NULL |  | Monetary amount |
| `mAverageCostFrom` | money | NULL |  |  |
| `mAverageCostTo` | money | NULL |  |  |
| `PortfolioCode` | varchar(15) | NULL |  |  |

### `OM_ConversionHeader`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iStatus` | tinyint | NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `iOmnibusTrxIDFrom` | int | NULL |  | Integer field |
| `iOmnibusTrxIDTo` | int | NULL |  | Integer field |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `MgmtCodeFrom` | varchar(5) | NULL |  |  |
| `FundIDFrom` | varchar(5) | NULL |  |  |
| `MgmtCodeTo` | varchar(5) | NULL |  |  |
| `FundIDTo` | varchar(5) | NULL |  |  |
| `iTrxTypeFrom` | int | NULL |  | Integer field |
| `iTrxTypeTo` | int | NULL |  | Integer field |
| `iCreatedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `fUnitFrom` | float | NULL |  | Decimal/float value |
| `mAmountFrom` | money | NULL |  | Monetary amount |
| `fPriceFrom` | float | NULL |  | Decimal/float value |
| `fUnitTo` | float | NULL |  | Decimal/float value |
| `mAmountTo` | money | NULL |  | Monetary amount |
| `fPriceTo` | float | NULL |  | Decimal/float value |
| `iClientPositionCount` | int | NULL |  | Integer field |
| `fUnitFromClient` | float | NULL |  | Decimal/float value |
| `mAmountFromClient` | money | NULL |  | Monetary amount |
| `fUnitToClient` | float | NULL |  | Decimal/float value |
| `mAmountToClient` | money | NULL |  | Monetary amount |
| `PortfolioCodeStr` | varchar(200) | NULL |  |  |
| `iOmnibusProcessIDFrom` | int | NULL |  | Integer field |
| `iOmnibusProcessIDTo` | int | NULL |  | Integer field |

### `OM_Def_Portfolio`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL |  | Primary key, auto-increment identifier |
| `PortfolioCode` | varchar(15) | NULL |  |  |
| `PortfolioNameEN` | varchar(80) | NULL |  |  |
| `PortfolioNameFR` | varchar(80) | NULL |  |  |
| `iOrder` | int | NULL |  | Integer field |

### `OM_OmnibusOrder`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iOrderID` | int | NOT NULL |  | Integer field |
| `iTrxID` | int | NOT NULL |  | Integer field |
| `iOrderStatus` | tinyint | NULL |  | Small integer/flag field |
| `iSyncStatus` | tinyint | NULL |  | Small integer/flag field |
| `dtSync` | datetime | NULL |  | Date/time field |
| `iSyncUserID` | int | NULL |  | Integer field |
| `mGAmountBreakage` | money | NULL |  |  |
| `mNAmountBreakage` | money | NULL |  |  |
| `mSAmountBreakage` | money | NULL |  |  |
| `fUnitsBreakage` | float | NULL |  | Decimal/float value |

### `OM_OmnibusProcess`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iOrderStatus` | tinyint | NULL |  | Small integer/flag field |
| `iSyncStatus` | tinyint | NULL |  | Small integer/flag field |
| `dtSync` | datetime | NULL |  | Date/time field |
| `iSyncUserID` | int | NULL |  | Integer field |
| `fUnitBreakage` | float | NULL |  | Decimal/float value |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `mGAmountBreakage` | money | NULL |  |  |
| `mNAmountBreakage` | money | NULL |  |  |
| `iType` | tinyint | NULL |  | Type/category code |
| `Notes` | varchar(200) | NULL |  |  |

### `OM_OmnibusProcessTrx`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iOmnibusProcessID` | int | NOT NULL |  | Integer field |
| `iTrxID` | int | NOT NULL |  | Integer field |
| `iOrderID` | int | NOT NULL |  | Integer field |

### `OM_OmnibusTrxDetail`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iOmnibusProcessID` | int | NULL |  | Integer field |
| `iOmnibusTrxID` | int | NULL |  | Integer field |
| `iOmnibusOrderID` | int | NULL |  | Integer field |
| `iFundPosID` | int | NULL |  | Integer field |
| `iOrderID` | int | NULL |  | Integer field |
| `iTrxID` | int | NULL |  | Integer field |
| `DealerCode` | varchar(5) | NULL |  | Dealer code identifier |
| `RepCode` | varchar(5) | NULL |  | Representative/advisor code |
| `LastName` | varchar(80) | NULL |  | Last name |
| `FirstName` | varchar(40) | NULL |  | First name |
| `PlanType` | char(2) | NULL |  |  |
| `DealerAccountID` | varchar(15) | NULL |  |  |
| `MgmtCode` | varchar(5) | NULL |  | Management company code |
| `FundID` | varchar(5) | NULL |  | Fund identifier code (e.g., DYN 3056) |
| `FundAccountID` | varchar(15) | NULL |  |  |
| `iTrxType` | smallint | NULL |  |  |
| `TrxType` | char(1) | NULL |  |  |
| `TrxTypeDetail` | char(1) | NULL |  |  |
| `AmountType` | char(1) | NULL |  |  |
| `fAmount` | float | NULL |  | Decimal/float value |
| `mTrxAmount` | money | NULL |  |  |
| `mTrxPrice` | money | NULL |  |  |
| `fTrxUnit` | float | NULL |  | Decimal/float value |
| `iTrxStatus` | tinyint | NULL |  | Small integer/flag field |
| `mGAmount` | money | NULL |  |  |
| `mNAmount` | money | NULL |  |  |
| `mSAmount` | money | NULL |  |  |
| `dtTrade` | datetime | NULL |  | Trade date |
| `dtProcessing` | datetime | NULL |  | Date/time field |
| `dtSettlement` | datetime | NULL |  | Settlement date |
| `ActnCode` | char(3) | NULL |  |  |
| `iNoOmnibus` | tinyint | NULL |  | Small integer/flag field |
| `iSequence` | int | NULL |  | Sequence number |
| `fAvgCost` | float | NULL |  | Decimal/float value |
| `fUnitsTotalUnIssued` | float | NULL |  | Decimal/float value |
| `fUnitsTotalIssued` | float | NULL |  | Decimal/float value |
| `fUnitsTotal` | float | NULL |  | Decimal/float value |
| `iFromID` | int | NULL |  | Integer field |
| `iTransferID` | int | NULL |  | Integer field |
| `PortfolioCode` | varchar(15) | NULL |  |  |

### `OM_ReportActivityByRep`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iReportHeaderID` | int | NULL |  | Integer field |
| `DealerCode` | varchar(5) | NULL |  | Dealer code identifier |
| `RepCode` | varchar(5) | NULL |  | Representative/advisor code |
| `PortfolioCode` | varchar(15) | NULL |  |  |
| `mBuy` | money | NULL |  |  |
| `mSell` | money | NULL |  |  |
| `mAUA` | money | NULL |  |  |
| `iPlanCount` | int | NULL |  | Integer field |
| `iPlanCountNew` | int | NULL |  | Integer field |

### `OM_ReportDataMonthly`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iYear` | int | NULL |  | Integer field |
| `iMonth` | int | NULL |  | Integer field |
| `iPlanCount` | int | NULL |  | Integer field |
| `iClientCountInd` | int | NULL |  | Integer field |
| `iClientCountCorp` | int | NULL |  | Integer field |
| `mDAV` | money | NULL |  |  |
| `mMKV` | money | NULL |  |  |
| `mMKVChange` | money | NULL |  |  |
| `mBuy` | money | NULL |  |  |
| `mSell` | money | NULL |  |  |
| `iRepCount` | int | NULL |  | Integer field |
| `iRepCountNew` | int | NULL |  | Integer field |
| `mPortfolioFee` | money | NULL |  |  |
| `dtLastModified` | datetime | NULL |  | Timestamp when record was last modified |
| `iUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |

### `OM_ReportDAVPortfolio`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iReportHeaderID` | int | NULL |  | Integer field |
| `PortfolioCode` | varchar(15) | NULL |  |  |
| `PortfolioName` | varchar(80) | NULL |  |  |
| `mPortfolioDAV` | money | NULL |  |  |

### `OM_ReportDAVPortfolioDetail`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iReportDAVPortfolioID` | int | NULL |  | Integer field |
| `MgmtCode` | varchar(5) | NULL |  | Management company code |
| `FundID` | varchar(5) | NULL |  | Fund identifier code (e.g., DYN 3056) |
| `mDAV` | money | NULL |  |  |

### `OM_ReportFundAUA`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iReportHeaderID` | int | NULL |  | Integer field |
| `DealerCode` | varchar(5) | NULL |  | Dealer code identifier |
| `RepCode` | varchar(5) | NULL |  | Representative/advisor code |
| `PortfolioCode` | varchar(15) | NULL |  |  |
| `MgmtCode` | varchar(5) | NULL |  | Management company code |
| `FundID` | varchar(5) | NULL |  | Fund identifier code (e.g., DYN 3056) |
| `fUnits` | float | NULL |  | Decimal/float value |
| `fPrice` | float | NULL |  | Unit price of fund |
| `mMKV` | money | NULL |  |  |
| `dtPrice` | datetime | NULL |  | Date/time field |
| `mBuy` | money | NULL |  |  |
| `mSell` | money | NULL |  |  |

### `OM_ReportHeader`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iType` | int | NULL |  | Type/category code |
| `iNumber` | int | NULL |  | Integer field |
| `dtFrom` | datetime | NULL |  | Date/time field |
| `dtTo` | datetime | NULL |  | Date/time field |
| `iStatus` | tinyint | NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `DescriptionEN` | varchar(80) | NULL |  |  |
| `DescriptionFR` | varchar(80) | NULL |  |  |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `iCreatedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |

### `OM_ReversalDetail`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iReversalHeaderID` | int | NULL |  | Integer field |
| `iPosID` | int | NULL |  | FK to position record (fund holding) |
| `iTrxType` | int | NULL |  | Integer field |
| `fUnit` | float | NULL |  | Number of units |
| `fPrice` | float | NULL |  | Unit price of fund |
| `mAmount` | money | NULL |  | Monetary amount |
| `iStatus` | tinyint | NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `iClientTrxID` | int | NULL |  | Integer field |

### `OM_ReversalHeader`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iStatus` | tinyint | NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `iPlanID` | int | NULL |  | FK to UB_Plan table - identifies the investment plan/account |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `iCreatedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `dtTrade` | datetime | NULL |  | Trade date |
| `mRevAmount` | money | NULL |  |  |
| `iAOTTrxType` | tinyint | NULL |  | Small integer/flag field |
| `AOTAmountType` | char(1) | NULL |  |  |
| `fAOTAmount` | float | NULL |  | Decimal/float value |
| `Notes` | varchar(max) | NULL |  |  |

### `OM_ReversalTrxDest`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iReversalHeaderID` | int | NULL |  | Integer field |
| `iType` | tinyint | NULL |  | Type/category code |
| `iPosID` | int | NULL |  | FK to position record (fund holding) |
| `iTrxIDSource` | int | NULL |  | Integer field |
| `iStatus` | tinyint | NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `iTrxType` | int | NULL |  | Integer field |
| `AmountType` | char(1) | NULL |  |  |
| `mAmount` | money | NULL |  | Monetary amount |
| `dtTrade` | datetime | NULL |  | Trade date |
| `dtSettlement` | datetime | NULL |  | Settlement date |
| `dtProcessing` | datetime | NULL |  | Date/time field |
| `iClientTrxID` | int | NULL |  | Integer field |
| `fPrice` | float | NULL |  | Unit price of fund |
| `fUnits` | float | NULL |  | Decimal/float value |
| `OrderID` | varchar(15) | NULL |  |  |
| `iOmnibusTrxDetailID` | int | NULL |  | Integer field |
| `iOmnibusTrxID` | int | NULL |  | Integer field |

### `OM_ReversalTrxSource`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iReversalHeaderID` | int | NULL |  | Integer field |
| `iPosID` | int | NULL |  | FK to position record (fund holding) |
| `iClientTrxID` | int | NULL |  | Integer field |

### `OM_SwitchDetail`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iSwitchHeaderID` | int | NULL |  | Integer field |
| `iPosID` | int | NULL |  | FK to position record (fund holding) |
| `iTrxID` | int | NULL |  | Integer field |
| `MgmtCode` | varchar(5) | NULL |  | Management company code |
| `FundID` | varchar(5) | NULL |  | Fund identifier code (e.g., DYN 3056) |
| `AmountType` | char(1) | NULL |  |  |
| `TrxType` | char(1) | NULL |  |  |
| `mAmount` | money | NULL |  | Monetary amount |
| `mGAmount` | money | NULL |  |  |
| `iFlag` | tinyint | NULL |  | Small integer/flag field |

### `OM_SwitchHeader`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iPlanID` | int | NULL |  | FK to UB_Plan table - identifies the investment plan/account |
| `iModelIDFrom` | int | NULL |  | Integer field |
| `iModelIDTo` | int | NULL |  | Integer field |
| `iStatus` | tinyint | NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `dtTrade` | datetime | NULL |  | Trade date |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `iCreatedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `iStatusBuy` | tinyint | NULL |  | Status code (specific to this context) |

### `OM_TransferDetail`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iTransferHeaderID` | int | NULL |  | Integer field |
| `bTo` | tinyint | NULL |  |  |
| `iPosID` | int | NULL |  | FK to position record (fund holding) |
| `MgmtCode` | varchar(5) | NULL |  | Management company code |
| `FundID` | varchar(5) | NULL |  | Fund identifier code (e.g., DYN 3056) |
| `AmountType` | char(1) | NULL |  |  |
| `fUnits` | float | NULL |  | Decimal/float value |
| `fPrice` | float | NULL |  | Unit price of fund |
| `mAmount` | money | NULL |  | Monetary amount |
| `iTrxID` | int | NULL |  | Integer field |
| `iStatus` | tinyint | NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `iPosID2` | int | NULL |  | Integer field |
| `iTrxType` | int | NULL |  | Integer field |
| `dtTrade` | datetime | NULL |  | Trade date |

### `OM_TransferHeader`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iStatus` | tinyint | NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `iPlanIDFrom` | int | NULL |  | Integer field |
| `iPlanIDTo` | int | NULL |  | Integer field |
| `PlanDescFrom` | varchar(20) | NULL |  |  |
| `PlanDescTo` | varchar(20) | NULL |  |  |
| `AmountType` | char(1) | NULL |  |  |
| `mAmount` | money | NULL |  | Monetary amount |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `iCreatedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `dtTrade` | datetime | NULL |  | Trade date |
| `iCRA` | tinyint | NULL |  | Small integer/flag field |
| `bInCash` | tinyint | NULL |  |  |
| `iModelIDFrom` | int | NULL |  | Integer field |
| `iModelIDTo` | int | NULL |  | Integer field |

### `RA_ClientDraft`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `Id` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `FirstName` | varchar(40) | NULL |  | First name |
| `LastName` | varchar(80) | NULL |  | Last name |
| `Phone` | varchar(15) | NULL |  |  |
| `Email` | varchar(100) | NULL |  | Email address |
| `ClientId` | int | NULL |  |  |
| `iDealerShipID` | int | NULL |  | Integer field |
| `iUserId` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `Data` | varchar(max) | NULL |  |  |
| `Submit` | tinyint | NULL |  |  |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `dtLastModified` | datetime | NULL |  | Timestamp when record was last modified |

### `SK_Account`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `DealerCode` | varchar(5) | NULL |  | Dealer code identifier |
| `Ticker` | varchar(15) | NULL |  |  |
| `Currency` | char(2) | NULL |  |  |
| `AccountStatus` | char(1) | NULL |  |  |
| `fUnits` | float | NULL |  | Decimal/float value |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `iCreatedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `dtLastModified` | datetime | NULL |  | Timestamp when record was last modified |
| `iLastModifiedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who last modified this record |
| `Description` | varchar(80) | NULL |  |  |

### `SK_Config`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `Description` | varchar(50) | NULL |  |  |
| `CfgFileName` | varchar(250) | NULL |  |  |
| `DealerCodes` | varchar(80) | NULL |  | Dealer code identifier |

### `SK_ExecReport`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iMSGID` | int | NULL |  | Integer field |
| `iOrderID` | int | NULL |  | Integer field |
| `OrderID` | varchar(20) | NULL |  |  |
| `ClOrdID` | varchar(20) | NULL |  |  |
| `OrigClOrdID` | varchar(20) | NULL |  |  |
| `ExecID` | varchar(20) | NULL |  |  |
| `ExecTransType` | varchar(20) | NULL |  |  |
| `OrdStatus` | char(1) | NULL |  |  |
| `Account` | varchar(20) | NULL |  |  |
| `SettlmntTyp` | char(1) | NULL |  |  |
| `FutSettDate` | varchar(30) | NULL |  |  |
| `Symbol` | varchar(20) | NULL |  |  |
| `SecurityType` | varchar(20) | NULL |  |  |
| `OrderQty` | float | NULL |  |  |
| `OrdType` | char(1) | NULL |  |  |
| `Price` | float | NULL |  |  |
| `StopPx` | float | NULL |  |  |
| `Currency` | varchar(20) | NULL |  |  |
| `TimeInForce` | char(1) | NULL |  |  |
| `ExpireDate` | varchar(20) | NULL |  |  |
| `ExecInst` | char(1) | NULL |  |  |
| `LastShares` | float | NULL |  |  |
| `LastPx` | float | NULL |  |  |
| `LastMkt` | varchar(20) | NULL |  |  |
| `LeavesQty` | float | NULL |  |  |
| `CumQty` | float | NULL |  |  |
| `AvgPx` | float | NULL |  |  |
| `TransactTime` | varchar(20) | NULL |  |  |
| `MinQty` | float | NULL |  | Monetary value |
| `MaxFloor` | float | NULL |  | Monetary value |
| `Text` | varchar(80) | NULL |  |  |

### `SK_Order`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iAccountID` | int | NULL |  | Integer field |
| `DealerCode` | varchar(5) | NULL |  | Dealer code identifier |
| `ActionCode` | varchar(3) | NULL |  |  |
| `Ticker` | varchar(15) | NULL |  |  |
| `iStatus` | tinyint | NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `OrderType` | char(1) | NULL |  |  |
| `Side` | char(1) | NULL |  |  |
| `TimeInForce` | char(1) | NULL |  |  |
| `mPriceLimit` | money | NULL |  |  |
| `mPriceStop` | money | NULL |  |  |
| `OrderID` | varchar(20) | NULL |  |  |
| `fUnits` | float | NULL |  | Decimal/float value |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `iCreatedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `dtAccepted` | datetime | NULL |  | Date/time field |
| `mPrice` | float | NULL |  | Monetary value |
| `fUnitsDistributed` | float | NULL |  | Decimal/float value |
| `iProcessingStatus` | tinyint | NULL |  | Small integer/flag field |
| `iTrxID` | int | NULL |  | Integer field |
| `SourceID` | varchar(15) | NULL |  | Source identifier |
| `OrdStatus` | char(1) | NULL |  |  |
| `iMSGID` | int | NULL |  | Integer field |
| `RejectReason` | varchar(80) | NULL |  |  |
| `OrgSourceID` | varchar(15) | NULL |  |  |
| `OrgOrdID` | varchar(20) | NULL |  |  |
| `iRevNumber` | tinyint | NULL |  | Small integer/flag field |
| `Exchange` | char(4) | NULL |  |  |
| `dtExpiry` | datetime | NULL |  | Date/time field |
| `mAmount` | money | NULL |  | Monetary amount |
| `mFee` | money | NULL |  |  |
| `mSAmount` | money | NULL |  |  |
| `dtFill` | datetime | NULL |  | Date/time field |

### `SK_Order_Converted`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iTrxID` | int | NOT NULL |  | Integer field |
| `Symbol` | varchar(8) | NULL |  |  |
| `dtTrade` | datetime | NULL |  | Trade date |
| `fUnit` | float | NULL |  | Number of units |
| `iTrxType` | int | NULL |  | Integer field |
| `TrxType` | char(1) | NULL |  |  |
| `TrxTypeDetail` | char(1) | NULL |  |  |

### `SK_OrderWaiting2Send`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iOrderID` | int | NOT NULL |  | Integer field |
| `iStatus` | tinyint | NOT NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |

### `SK_PriceRequest`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iStatus` | tinyint | NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `Symbol` | varchar(15) | NULL |  |  |
| `ReqID` | varchar(15) | NULL |  |  |
| `fPrice` | float | NULL |  | Unit price of fund |
| `dtPrice` | datetime | NULL |  | Date/time field |
| `fAsked` | float | NULL |  | Decimal/float value |

### `SK_QFixDef`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `Version` | varchar(10) | NULL |  |  |
| `XMLContent` | varchar(max) | NULL |  |  |

### `SK_QFixField42`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL |  | Primary key, auto-increment identifier |
| `FieldName` | varchar(50) | NULL |  | Field name reference |
| `FieldType` | varchar(50) | NULL |  |  |
| `DescriptionEN` | varchar(80) | NULL |  |  |
| `DescriptionFR` | varchar(80) | NULL |  |  |

### `SK_QFixField44`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL |  | Primary key, auto-increment identifier |
| `FieldName` | varchar(50) | NULL |  | Field name reference |
| `FieldType` | varchar(50) | NULL |  |  |
| `DescriptionEN` | varchar(80) | NULL |  |  |
| `DescriptionFR` | varchar(80) | NULL |  |  |

### `SK_QFixFieldValue42`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `iFieldID` | int | NOT NULL |  | Integer field |
| `ValueID` | varchar(50) | NOT NULL |  |  |
| `Description` | varchar(200) | NULL |  |  |
| `NameEN` | varchar(200) | NULL |  | English name |
| `NameFR` | varchar(200) | NULL |  | French name |

### `SK_QFixFieldValue44`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `iFieldID` | int | NOT NULL |  | Integer field |
| `ValueID` | varchar(50) | NOT NULL |  |  |
| `Description` | varchar(200) | NULL |  |  |
| `NameEN` | varchar(200) | NULL |  | English name |
| `NameFR` | varchar(200) | NULL |  | French name |

### `SK_QFixMSG`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `dtDate` | datetime | NULL |  | Date/time field |
| `Type` | char(2) | NULL |  |  |
| `iSequence` | int | NULL |  | Sequence number |
| `Description` | varchar(50) | NULL |  |  |
| `MSG` | varchar(max) | NULL |  |  |
| `iStatus` | tinyint | NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `bOUT` | tinyint | NULL |  |  |
| `iOrderID` | int | NULL |  | Integer field |
| `b2BProcess` | tinyint | NULL |  |  |

### `UB_AccountScheduleDetail`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iScheduleID` | int | NULL |  | Integer field |
| `iFundAccountID` | int | NULL |  | Integer field |
| `iDestination` | tinyint | NULL |  | Small integer/flag field |
| `FundID` | varchar(6) | NULL |  | Fund identifier code (e.g., DYN 3056) |
| `fSysPlanSplit` | float | NULL |  | Decimal/float value |
| `FundAccountID2` | varchar(20) | NULL |  |  |

### `UB_AccountSearchList`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `UserID` | int | NOT NULL |  |  |
| `AccountID` | int | NOT NULL |  |  |

### `UB_AccountUserDef`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `LinkedID` | int | NOT NULL |  |  |
| `iFieldID` | int | NOT NULL |  | Integer field |
| `FieldContent` | varchar(200) | NULL |  |  |

### `UB_AccountUserDefTMP`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `SessionID` | varchar(50) | NOT NULL |  |  |
| `iClientID` | int | NOT NULL |  | FK to UB_Client table - identifies the client/investor |
| `LinkedID` | int | NOT NULL |  |  |
| `iFieldID` | int | NOT NULL |  | Integer field |
| `FieldContent` | varchar(200) | NULL |  |  |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `iCreatedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |

### `UB_Application`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iClientID` | int | NOT NULL |  | FK to UB_Client table - identifies the client/investor |
| `AppCode` | varchar(20) | NOT NULL |  |  |
| `dtDate` | datetime | NOT NULL |  | Date/time field |
| `Notes` | varchar(max) | NULL |  |  |
| `iType` | smallint | NOT NULL |  | Type/category code |
| `iStatus` | smallint | NOT NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `iCreatedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `iLastModifiedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who last modified this record |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `dtLastModified` | datetime | NULL |  | Timestamp when record was last modified |

### `UB_ASM_Header`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iFileID` | int | NULL |  | FK to file record (FundServ file) |
| `dtSettlement` | datetime | NULL |  | Settlement date |
| `ParticipantCode` | varchar(4) | NULL |  |  |
| `ParticipantType` | char(1) | NULL |  |  |
| `CurrencyCode` | char(2) | NULL |  |  |
| `iType` | tinyint | NULL |  | Type/category code |
| `mPayable` | money | NULL |  |  |
| `iPayable` | int | NULL |  | Integer field |
| `mReceivable` | money | NULL |  |  |
| `iReceivable` | int | NULL |  | Integer field |
| `mNetSettlement` | money | NULL |  |  |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |

### `UB_ASM_Item`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iPymtbyPartID` | int | NULL |  | Integer field |
| `ParticipantCode` | varchar(4) | NULL |  |  |
| `ParticipantType` | char(1) | NULL |  |  |
| `PymtID` | varchar(15) | NULL |  |  |
| `PymtType` | char(2) | NULL |  |  |
| `DlrAcctID` | varchar(15) | NULL |  |  |
| `FundAcctID` | varchar(15) | NULL |  |  |
| `IntAcctID` | varchar(15) | NULL |  |  |
| `AcctType` | char(2) | NULL |  |  |
| `AcctHolder` | varchar(80) | NULL |  |  |
| `mSettlAmt` | money | NULL |  |  |
| `dtSettlement` | datetime | NULL |  | Settlement date |
| `iPlanID` | int | NULL |  | FK to UB_Plan table - identifies the investment plan/account |
| `iFundAccountID` | int | NULL |  | Integer field |
| `ReceiverRepCode` | varchar(5) | NULL |  | Representative/advisor code |
| `SenderDealerCode` | varchar(4) | NULL |  | Dealer code identifier |
| `SenderIntCode` | varchar(4) | NULL |  |  |
| `SenderMgmtCode` | varchar(4) | NULL |  |  |
| `SenderAcctID` | varchar(15) | NULL |  |  |
| `SenderAcctHolder` | varchar(80) | NULL |  |  |
| `SenderSIN` | varchar(15) | NULL |  |  |
| `SenderRepCode` | varchar(5) | NULL |  | Representative/advisor code |
| `SenderLckInJur` | char(3) | NULL |  |  |
| `SenderSpousalName` | varchar(80) | NULL |  |  |
| `SenderSpousalSIN` | varchar(15) | NULL |  |  |
| `SenderAddInfo` | varchar(200) | NULL |  |  |
| `SenderAttachment` | char(1) | NULL |  |  |

### `UB_ASM_Part`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iHeaderID` | int | NULL |  | FK to parent header record |
| `CounterPartyCode` | varchar(4) | NULL |  |  |
| `CounterPartyType` | char(1) | NULL |  |  |
| `mPayable` | money | NULL |  |  |
| `iPayable` | int | NULL |  | Integer field |
| `mReceivable` | money | NULL |  |  |
| `iReceivable` | int | NULL |  | Integer field |
| `mNetSettlement` | money | NULL |  |  |

### `UB_AssetAllocationDetail`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iFolderID` | int | NULL |  | Integer field |
| `iType` | tinyint | NULL |  | Type/category code |
| `MgmtCode` | varchar(5) | NULL |  | Management company code |
| `FundID` | varchar(6) | NULL |  | Fund identifier code (e.g., DYN 3056) |
| `fPercent` | float | NULL |  | Decimal/float value |
| `dtFFEffective` | datetime | NULL |  | Date/time field |

### `UB_AssetAllocationFolder`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `NameEN` | varchar(80) | NULL |  | English name |
| `NameFR` | varchar(80) | NULL |  | French name |
| `fTolerance` | float | NULL |  | Decimal/float value |
| `Frequency` | char(1) | NULL |  |  |
| `iRunDay` | int | NULL |  | Integer field |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `iCreatedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `dtLastModified` | datetime | NULL |  | Timestamp when record was last modified |
| `iLastModifiedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who last modified this record |
| `iStatus` | tinyint | NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `iSplitMethod` | tinyint | NULL |  | Small integer/flag field |
| `CurrencyCode` | varchar(3) | NULL |  |  |
| `iInvestObj` | tinyint | NULL |  | Small integer/flag field |
| `DealerCode` | varchar(6) | NULL |  | Dealer code identifier |
| `Code` | varchar(15) | NULL |  |  |
| `dtStart` | datetime | NULL |  | Date/time field |
| `dtLastRun` | datetime | NULL |  | Date/time field |
| `dtNextRun` | datetime | NULL |  | Date/time field |
| `dtFFUpdate` | datetime | NULL |  | Date/time field |
| `iFFObjIDEN` | int | NULL |  | Integer field |
| `iFFObjIDFR` | int | NULL |  | Integer field |
| `TierCode` | varchar(15) | NULL |  |  |
| `fMER` | float | NULL |  | Decimal/float value |
| `iFlag` | int | NULL |  | Integer field |

### `UB_AssetAllocationTrxDetail`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iAATrxHeader` | int | NULL |  | Integer field |
| `iTrxID` | int | NULL |  | Integer field |
| `iBasketID` | int | NULL |  | Integer field |
| `iOrderID` | int | NULL |  | Integer field |

### `UB_AssetAllocationTrxHeader`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iPlanID` | int | NULL |  | FK to UB_Plan table - identifies the investment plan/account |
| `iModelID` | int | NULL |  | Integer field |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `iCreatedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `bBasket` | tinyint | NULL |  |  |
| `mAmount` | money | NULL |  | Monetary amount |
| `ContributionPeriod` | char(1) | NULL |  |  |
| `ContrWdrCode` | char(1) | NULL |  |  |
| `SettlementInd` | char(1) | NULL |  |  |
| `SettlementSource` | char(1) | NULL |  |  |
| `SettlementMethod` | char(1) | NULL |  |  |
| `bFirstTrx` | tinyint | NULL |  |  |
| `bPEFP` | tinyint | NULL |  |  |
| `PEFPNotes` | varchar(100) | NULL |  |  |
| `bUseTrustAccount` | tinyint | NULL |  |  |
| `iPMTType` | smallint | NULL |  |  |
| `iBankAccountID` | int | NULL |  | Integer field |
| `BankHolderName` | varchar(80) | NULL |  |  |
| `BankAccountType` | char(1) | NULL |  |  |
| `BankCode` | varchar(3) | NULL |  |  |
| `BankTransitNumber` | varchar(5) | NULL |  |  |
| `BankAccountNumber` | varchar(12) | NULL |  |  |
| `BankCurrencyCode` | varchar(3) | NULL |  |  |
| `bRealTime` | tinyint | NULL |  |  |
| `iTrxType` | int | NULL |  | Integer field |
| `iCashOut` | tinyint | NULL |  | Small integer/flag field |
| `iTrustTrxID` | int | NULL |  | Integer field |

### `UB_AssetClient`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `iClientID` | int | NOT NULL |  | FK to UB_Client table - identifies the client/investor |
| `iDays` | int | NULL |  | Integer field |
| `dtEffective` | datetime | NULL |  | Effective date |
| `iTotalAsset` | int | NULL |  | Integer field |
| `mTotalAsset` | money | NULL |  |  |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `iCategory` | smallint | NULL |  |  |

### `UB_AssetFund`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iPlanID` | int | NULL |  | FK to UB_Plan table - identifies the investment plan/account |
| `iFundPositionID` | int | NULL |  | Integer field |
| `iDays` | int | NULL |  | Integer field |
| `dtEffective` | datetime | NULL |  | Effective date |
| `fUnit` | float | NULL |  | Number of units |
| `fPrice` | float | NULL |  | Unit price of fund |
| `fAverageCost` | float | NULL |  | Decimal/float value |
| `mAsset` | money | NULL |  |  |
| `fExRate` | float | NULL |  | Decimal/float value |
| `bNeedRecalc` | tinyint | NULL |  |  |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |

### `UB_AssetGIC`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iPlanID` | int | NULL |  | FK to UB_Plan table - identifies the investment plan/account |
| `iGICID` | int | NULL |  | Integer field |
| `mAsset` | money | NULL |  |  |
| `mBookValue` | money | NULL |  |  |
| `fExRate` | float | NULL |  | Decimal/float value |
| `iDays` | int | NULL |  | Integer field |
| `dtEffective` | datetime | NULL |  | Effective date |

### `UB_AssetPlan`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `iPlanID` | int | NOT NULL |  | FK to UB_Plan table - identifies the investment plan/account |
| `iDays` | int | NULL |  | Integer field |
| `dtEffective` | datetime | NULL |  | Effective date |
| `mTotalAsset` | money | NULL |  |  |
| `bNeedRecalc` | tinyint | NULL |  |  |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |

### `UB_AuditTrail`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iFieldID` | int | NOT NULL |  | Integer field |
| `iRecordID` | int | NOT NULL |  | Integer field |
| `iFromID` | int | NULL |  | Integer field |
| `Value` | varchar(max) | NULL |  |  |
| `dtChanged` | datetime | NULL |  | Date/time field |
| `iUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `bLast` | tinyint | NULL |  |  |
| `iParentID` | int | NULL |  | Integer field |
| `iGroupID` | int | NULL |  | Integer field |
| `TypeExtra` | varchar(50) | NULL |  |  |

### `UB_AuditTrailGroup`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `dtCreated` | datetime | NOT NULL |  | Timestamp when record was created |
| `iUserID` | int | NOT NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `iUserType` | tinyint | NOT NULL |  | Small integer/flag field |
| `iAction` | tinyint | NOT NULL |  | Small integer/flag field |
| `TableName` | varchar(50) | NULL |  |  |
| `DescriptionEN` | varchar(200) | NULL |  |  |
| `DescriptionFR` | varchar(200) | NULL |  |  |
| `iRecordID` | int | NOT NULL |  | Integer field |
| `iClientID` | int | NOT NULL |  | FK to UB_Client table - identifies the client/investor |
| `iPlanID` | int | NOT NULL |  | FK to UB_Plan table - identifies the investment plan/account |
| `iFundAcctID` | int | NOT NULL |  | Integer field |
| `iGICID` | int | NOT NULL |  | Integer field |
| `iMemberID` | int | NOT NULL |  | FK to UB_Member - identifies the member/advisor |
| `iRepID` | int | NOT NULL |  | FK to UB_Rep - identifies the representative/advisor |
| `DealerCode` | varchar(5) | NOT NULL |  | Dealer code identifier |
| `RepCode` | varchar(8) | NOT NULL |  | Representative/advisor code |
| `ExtraInfoEN` | varchar(80) | NULL |  |  |
| `ExtraInfoFR` | varchar(80) | NULL |  |  |

### `UB_B2BLoanPending`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `DealerCode` | varchar(6) | NULL |  | Dealer code identifier |
| `RepCode` | varchar(8) | NULL |  | Representative/advisor code |
| `ClientName` | varchar(150) | NULL |  |  |
| `AccountID` | varchar(50) | NULL |  |  |
| `AcctType` | varchar(50) | NULL |  |  |
| `OriginalAmt` | money | NULL |  |  |
| `DateOpen` | varchar(20) | NULL |  |  |
| `OutstandingAmt` | money | NULL |  |  |
| `Princ_or_Int` | varchar(30) | NULL |  |  |
| `CollateralAmt` | money | NULL |  |  |
| `LoanPmt` | money | NULL |  |  |
| `Freq` | varchar(30) | NULL |  |  |
| `Rate` | float | NULL |  |  |
| `Term` | float | NULL |  |  |
| `IntAcctID` | varchar(50) | NULL |  |  |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |

### `UB_Bank`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `Code` | varchar(5) | NULL |  |  |
| `NameSEN` | varchar(25) | NULL |  |  |
| `NameSFR` | varchar(25) | NULL |  |  |
| `NameEN` | varchar(80) | NULL |  | English name |
| `NameFR` | varchar(80) | NULL |  | French name |
| `iAddressID` | int | NULL |  | Integer field |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `dtLastModified` | datetime | NULL |  | Timestamp when record was last modified |
| `iCreatedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `iLastModifiedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who last modified this record |

### `UB_BankARC`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL |  | Primary key, auto-increment identifier |
| `NameEN` | varchar(80) | NULL |  | English name |
| `NameFR` | varchar(80) | NULL |  | French name |
| `Code` | varchar(5) | NULL |  |  |
| `iAddressID` | int | NULL |  | Integer field |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `dtLastModified` | datetime | NULL |  | Timestamp when record was last modified |
| `iCreatedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `iLastModifiedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who last modified this record |
| `bDeleted` | tinyint | NULL |  |  |

### `UB_BankBranch`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iBankID` | int | NULL |  | Integer field |
| `BankCode` | varchar(5) | NULL |  |  |
| `TransitNumber` | varchar(10) | NULL |  |  |
| `SubBranchCode` | varchar(10) | NULL |  |  |
| `NameEN` | varchar(80) | NULL |  | English name |
| `NameFR` | varchar(80) | NULL |  | French name |
| `iAddressID` | int | NULL |  | Integer field |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `dtLastModified` | datetime | NULL |  | Timestamp when record was last modified |
| `iCreatedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `iLastModifiedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who last modified this record |
| `CPARoutingNumber` | varchar(20) | NULL |  |  |

### `UB_BankBranchARC`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL |  | Primary key, auto-increment identifier |
| `iBankID` | int | NULL |  | Integer field |
| `BankCode` | varchar(5) | NULL |  |  |
| `TransitNumber` | varchar(10) | NULL |  |  |
| `SubBranchCode` | varchar(10) | NULL |  |  |
| `NameEN` | varchar(80) | NULL |  | English name |
| `NameFR` | varchar(80) | NULL |  | French name |
| `iAddressID` | int | NULL |  | Integer field |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `dtLastModified` | datetime | NULL |  | Timestamp when record was last modified |
| `iCreatedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `iLastModifiedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who last modified this record |
| `bDeleted` | tinyint | NULL |  |  |

### `UB_BSP`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iPlanID` | int | NULL |  | FK to UB_Plan table - identifies the investment plan/account |
| `iFundAccountID` | int | NULL |  | Integer field |
| `dtCreate` | datetime | NULL |  | Date/time field |
| `iFileID` | int | NULL |  | FK to file record (FundServ file) |
| `dtImported` | datetime | NULL |  | Date/time field |
| `iTaxYear` | int | NULL |  | Integer field |
| `MgmtCode` | varchar(5) | NULL |  | Management company code |
| `FundAcctID` | varchar(15) | NULL |  |  |
| `DlrCode` | varchar(5) | NULL |  |  |
| `AcctDesig` | char(1) | NULL |  |  |
| `DlrAcctID` | varchar(15) | NULL |  |  |
| `IntCode` | varchar(5) | NULL |  |  |
| `IntAcctID` | varchar(15) | NULL |  |  |
| `mOtherAmount` | money | NULL |  |  |
| `mDividendAmount` | money | NULL |  |  |
| `mInterestAmount` | money | NULL |  |  |
| `Action` | char(1) | NULL |  |  |

### `UB_BulkSwitch`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `MgmtCode` | varchar(4) | NULL |  | Management company code |
| `AmountType` | char(1) | NULL |  |  |
| `fAmount` | float | NULL |  | Decimal/float value |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `iUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `FundIDTo` | varchar(5) | NULL |  |  |

### `UB_BulkSwitchBasket`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iPlanID` | int | NOT NULL |  | FK to UB_Plan table - identifies the investment plan/account |
| `iStatus` | tinyint | NOT NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `dtTrade` | datetime | NULL |  | Trade date |
| `iDocID` | int | NULL |  | Integer field |
| `iDocStatus` | tinyint | NULL |  | Small integer/flag field |
| `dtDocComplete` | datetime | NULL |  | Date/time field |
| `iCreatedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `iBasketIDFrom` | int | NULL |  | Integer field |
| `iClientID` | int | NULL |  | FK to UB_Client table - identifies the client/investor |
| `iFundAccountPosID` | int | NULL |  | Integer field |
| `MgmtCode` | varchar(5) | NULL |  | Management company code |
| `FundID` | varchar(6) | NULL |  | Fund identifier code (e.g., DYN 3056) |
| `FundAccountID` | varchar(20) | NULL |  |  |
| `AmountType` | char(1) | NULL |  |  |
| `fAmount` | float | NULL |  | Decimal/float value |
| `Notes` | varchar(max) | NULL |  |  |

### `UB_BulkSwitchBasketItem`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `iBulkSwitchBasketID` | int | NOT NULL |  | Integer field |
| `iFundPosID` | int | NULL |  | Integer field |
| `FundIDTo` | varchar(5) | NULL |  |  |
| `fCommRate` | float | NULL |  | Decimal/float value |
| `iOrderID` | int | NULL |  | Integer field |
| `AmountType` | char(1) | NULL |  |  |
| `fAmount` | float | NULL |  | Decimal/float value |
| `iType` | tinyint | NULL |  | Type/category code |
| `iFundPosIDTo` | int | NULL |  | Integer field |
| `MgmtCodeTo` | varchar(5) | NULL |  |  |
| `dtCompleted` | datetime | NULL |  | Date/time field |
| `iCreatedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `iSuitable` | tinyint | NULL |  | Small integer/flag field |

### `UB_BulkSwitchDetail`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iParentID` | int | NULL |  | Integer field |
| `iFundPosIDFrom` | int | NULL |  | Integer field |
| `iFundIDTo` | int | NULL |  | Integer field |
| `iTrxIDFrom` | int | NULL |  | Integer field |
| `iTrxIDTo` | int | NULL |  | Integer field |

### `UB_Cannex_DefA`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `FieldName` | varchar(50) | NOT NULL |  | Field name reference |
| `SPParamName` | varchar(50) | NULL |  |  |
| `iStartPos` | smallint | NOT NULL |  |  |
| `iEndPos` | smallint | NOT NULL |  |  |
| `iAlign` | tinyint | NULL |  | Small integer/flag field |
| `FormatStr` | varchar(50) | NULL |  |  |

### `UB_Cannex_DefC`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `FieldName` | varchar(50) | NOT NULL |  | Field name reference |
| `SPParamName` | varchar(50) | NULL |  |  |
| `iStartPos` | smallint | NOT NULL |  |  |
| `iEndPos` | smallint | NOT NULL |  |  |
| `iAlign` | tinyint | NULL |  | Small integer/flag field |
| `FormatStr` | varchar(50) | NULL |  |  |

### `UB_Cannex_DefCA`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `FieldName` | varchar(50) | NOT NULL |  | Field name reference |
| `SPParamName` | varchar(50) | NULL |  |  |
| `iStartPos` | smallint | NOT NULL |  |  |
| `iEndPos` | smallint | NOT NULL |  |  |
| `iAlign` | tinyint | NULL |  | Small integer/flag field |
| `FormatStr` | varchar(50) | NULL |  |  |

### `UB_Cannex_DefCN`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `FieldName` | varchar(50) | NOT NULL |  | Field name reference |
| `SPParamName` | varchar(50) | NULL |  |  |
| `iStartPos` | smallint | NOT NULL |  |  |
| `iEndPos` | smallint | NOT NULL |  |  |
| `iAlign` | tinyint | NULL |  | Small integer/flag field |
| `FormatStr` | varchar(50) | NULL |  |  |

### `UB_Cannex_DefG`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `FieldName` | varchar(50) | NOT NULL |  | Field name reference |
| `SPParamName` | varchar(50) | NULL |  |  |
| `iStartPos` | smallint | NOT NULL |  |  |
| `iEndPos` | smallint | NOT NULL |  |  |
| `iAlign` | tinyint | NULL |  | Small integer/flag field |
| `FormatStr` | varchar(50) | NULL |  |  |

### `UB_Cannex_DefII`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `FieldName` | varchar(50) | NOT NULL |  | Field name reference |
| `SPParamName` | varchar(50) | NULL |  |  |
| `iStartPos` | smallint | NOT NULL |  |  |
| `iEndPos` | smallint | NOT NULL |  |  |
| `iAlign` | tinyint | NULL |  | Small integer/flag field |
| `FormatStr` | varchar(50) | NULL |  |  |

### `UB_Cannex_DefO`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `FieldName` | varchar(50) | NOT NULL |  | Field name reference |
| `SPParamName` | varchar(50) | NULL |  |  |
| `iStartPos` | smallint | NOT NULL |  |  |
| `iEndPos` | smallint | NOT NULL |  |  |
| `iAlign` | tinyint | NULL |  | Small integer/flag field |
| `FormatStr` | varchar(50) | NULL |  |  |

### `UB_Cannex_DefProd`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `FieldName` | varchar(50) | NULL |  | Field name reference |
| `SPParamName` | varchar(50) | NULL |  |  |
| `iType` | tinyint | NULL |  | Type/category code |
| `iPos` | smallint | NULL |  |  |

### `UB_Cannex_DefR`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `FieldName` | varchar(50) | NOT NULL |  | Field name reference |
| `SPParamName` | varchar(50) | NULL |  |  |
| `iStartPos` | smallint | NOT NULL |  |  |
| `iEndPos` | smallint | NOT NULL |  |  |
| `iAlign` | tinyint | NULL |  | Small integer/flag field |
| `FormatStr` | varchar(50) | NULL |  |  |

### `UB_Cannex_DefRecon`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `FieldName` | varchar(50) | NOT NULL |  | Field name reference |
| `SPParamName` | varchar(50) | NULL |  |  |
| `iStartPos` | smallint | NOT NULL |  |  |
| `iEndPos` | smallint | NOT NULL |  |  |
| `iAlign` | tinyint | NULL |  | Small integer/flag field |
| `FormatStr` | varchar(50) | NULL |  |  |

### `UB_Cannex_DefReconW`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `FieldName` | varchar(50) | NOT NULL |  | Field name reference |
| `SPParamName` | varchar(50) | NULL |  |  |
| `iStartPos` | smallint | NOT NULL |  |  |
| `iEndPos` | smallint | NOT NULL |  |  |
| `iAlign` | tinyint | NULL |  | Small integer/flag field |
| `FormatStr` | varchar(50) | NULL |  |  |

### `UB_Cannex_DefWA`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `FieldName` | varchar(50) | NOT NULL |  | Field name reference |
| `SPParamName` | varchar(50) | NULL |  |  |
| `iStartPos` | smallint | NOT NULL |  |  |
| `iEndPos` | smallint | NOT NULL |  |  |
| `iAlign` | tinyint | NULL |  | Small integer/flag field |
| `FormatStr` | varchar(50) | NULL |  |  |

### `UB_CannexOrderFile`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iDays` | int | NOT NULL |  | Integer field |
| `iSequence` | smallint | NOT NULL |  | Sequence number |
| `FileName` | varchar(50) | NOT NULL |  | File name |
| `iStatus` | tinyint | NOT NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |

### `UB_CannexRejectReason`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iGICTrxID` | int | NULL |  | Integer field |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `iResponseID` | int | NULL |  | Integer field |
| `Reason` | varchar(max) | NULL |  |  |

### `UB_CannexResponse`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `iStatus` | tinyint | NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `ResponseMSG` | varchar(max) | NULL |  |  |

### `UB_CANSIM`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `iYear` | int | NOT NULL |  | Integer field |
| `iType` | tinyint | NOT NULL |  | Type/category code |
| `fMaxRate` | float | NULL |  | Decimal/float value |
| `fMinRate` | float | NULL |  | Decimal/float value |

### `UB_CANSIMFactor`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `iAge` | int | NOT NULL |  | Integer field |
| `fMin` | float | NULL |  | Decimal/float value |

### `UB_CANSIMFactorAB`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `iAge` | int | NOT NULL |  | Integer field |
| `fFactor` | float | NULL |  | Decimal/float value |
| `fFactorP` | float | NULL |  | Decimal/float value |

### `UB_CANSIMFactorBC`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `iAge` | int | NOT NULL |  | Integer field |
| `fFactor` | float | NULL |  | Decimal/float value |
| `fFactorP` | float | NULL |  | Decimal/float value |

### `UB_CANSIMFactorFED`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `iAge` | int | NOT NULL |  | Integer field |
| `fFactor` | float | NULL |  | Decimal/float value |
| `fFactorP` | float | NULL |  | Decimal/float value |

### `UB_CANSIMFactorFED_2024`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `iAge` | int | NOT NULL |  | Integer field |
| `fFactor` | float | NULL |  | Decimal/float value |
| `fFactorP` | float | NULL |  | Decimal/float value |

### `UB_CANSIMFactorFED_2025`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `iAge` | int | NOT NULL |  | Integer field |
| `fFactor` | float | NULL |  | Decimal/float value |
| `fFactorP` | float | NULL |  | Decimal/float value |

### `UB_CANSIMFactorMB`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `iAge` | int | NOT NULL |  | Integer field |
| `fFactor` | float | NULL |  | Decimal/float value |
| `fFactorP` | float | NULL |  | Decimal/float value |

### `UB_CANSIMFactorNB`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `iAge` | int | NOT NULL |  | Integer field |
| `fFactor` | float | NULL |  | Decimal/float value |
| `fFactorP` | float | NULL |  | Decimal/float value |

### `UB_CANSIMFactorNL`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `iAge` | int | NOT NULL |  | Integer field |
| `fFactor` | float | NULL |  | Decimal/float value |
| `fFactorP` | float | NULL |  | Decimal/float value |

### `UB_CANSIMFactorNS`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `iAge` | int | NOT NULL |  | Integer field |
| `fFactor` | float | NULL |  | Decimal/float value |
| `fFactorP` | float | NULL |  | Decimal/float value |

### `UB_CANSIMFactorON`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `iAge` | int | NOT NULL |  | Integer field |
| `fFactor` | float | NULL |  | Decimal/float value |
| `fFactorP` | float | NULL |  | Decimal/float value |

### `UB_CANSIMFactorQC`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `iAge` | int | NOT NULL |  | Integer field |
| `fFactor` | float | NULL |  | Decimal/float value |
| `fFactorP` | float | NULL |  | Decimal/float value |
| `fFactorD` | float | NULL |  | Decimal/float value |

### `UB_CANSIMFactorSK`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `iAge` | int | NOT NULL |  | Integer field |
| `fFactor` | float | NULL |  | Decimal/float value |
| `fFactorP` | float | NULL |  | Decimal/float value |

### `UB_CashAccount`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iPlanID` | int | NOT NULL |  | FK to UB_Plan table - identifies the investment plan/account |
| `InstitutionCode` | varchar(4) | NOT NULL |  |  |
| `TransitNumber` | varchar(5) | NULL |  |  |
| `AccountID` | varchar(20) | NOT NULL |  |  |
| `AccountStatus` | char(1) | NOT NULL |  |  |
| `dtEffective` | datetime | NULL |  | Effective date |
| `dtOpen` | datetime | NULL |  | Date/time field |
| `dtClose` | datetime | NULL |  | Date/time field |
| `mBalance` | money | NOT NULL |  |  |
| `iCreatedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `iLastModifiedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who last modified this record |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `dtLastModified` | datetime | NULL |  | Timestamp when record was last modified |
| `iFileID` | int | NULL |  | FK to file record (FundServ file) |
| `iWFID` | int | NULL |  | Integer field |
| `Description` | varchar(50) | NULL |  |  |
| `CurrencyCode` | char(2) | NULL |  |  |
| `iExportTaskID` | int | NULL |  | Integer field |

### `UB_CASHExportTask`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iType` | tinyint | NULL |  | Type/category code |
| `iStatus` | tinyint | NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `DealerCode` | varchar(4) | NULL |  | Dealer code identifier |
| `iSequence` | int | NULL |  | Sequence number |
| `dtStart` | datetime | NULL |  | Date/time field |
| `dtEffective` | datetime | NULL |  | Effective date |

### `UB_CashTrx`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iPlanID` | int | NOT NULL |  | FK to UB_Plan table - identifies the investment plan/account |
| `iCashAccountID` | int | NOT NULL |  | Integer field |
| `iType` | smallint | NOT NULL |  | Type/category code |
| `Type` | char(1) | NOT NULL |  |  |
| `TypeDetail` | char(1) | NOT NULL |  |  |
| `iSequence` | int | NULL |  | Sequence number |
| `iStatus` | tinyint | NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `dtTrade` | datetime | NULL |  | Trade date |
| `dtProcessing` | datetime | NULL |  | Date/time field |
| `dtSettlement` | datetime | NULL |  | Settlement date |
| `mAmount` | money | NULL |  | Monetary amount |
| `mSAmount` | money | NULL |  |  |
| `mGAmount` | money | NULL |  |  |
| `mNAmount` | money | NULL |  |  |
| `mBalance` | money | NULL |  |  |
| `SourceID` | varchar(20) | NULL |  | Source identifier |
| `iFileID` | int | NULL |  | FK to file record (FundServ file) |
| `iRepID` | int | NULL |  | FK to UB_Rep - identifies the representative/advisor |
| `iCreatedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `iLastModifiedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who last modified this record |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `dtLastModified` | datetime | NULL |  | Timestamp when record was last modified |
| `iWFID` | int | NULL |  | Integer field |
| `bInvestedAmountExclude` | tinyint | NULL |  |  |
| `Notes` | varchar(80) | NULL |  |  |
| `iTrustTrxID` | int | NULL |  | Integer field |
| `iSourceTrxType` | tinyint | NULL |  | Small integer/flag field |
| `iSourceTrxID` | int | NULL |  | Integer field |
| `iReceiptOption` | tinyint | NULL |  | Small integer/flag field |
| `ContrWdrCode` | char(1) | NULL |  |  |
| `bRRSP60` | tinyint | NULL |  |  |
| `iLastTaxReceiptID` | int | NULL |  | Integer field |
| `bReversal` | tinyint | NULL |  |  |
| `iDepositType` | tinyint | NULL |  | Small integer/flag field |
| `mTax` | money | NULL |  |  |
| `iTrustTrxIDTax` | int | NULL |  | Integer field |
| `mTaxP` | money | NULL |  |  |
| `iTrustTrxIDTaxP` | int | NULL |  | Integer field |
| `iExportTaskID` | int | NULL |  | Integer field |
| `mDealerFee` | money | NULL |  |  |
| `mB2BFee` | money | NULL |  |  |
| `JurProv` | varchar(3) | NULL |  |  |
| `iReceivableID` | int | NULL |  | Integer field |

### `UB_Cheque`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iStatus` | tinyint | NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `iBankAccountID` | int | NULL |  | Integer field |
| `BankCode` | varchar(5) | NULL |  |  |
| `ChequeNumber` | varchar(20) | NULL |  |  |
| `iType` | tinyint | NULL |  | Type/category code |
| `iLinkedID` | int | NULL |  | Integer field |
| `MgmtCode` | varchar(12) | NULL |  | Management company code |
| `Payee` | varchar(80) | NULL |  |  |
| `mAmount` | money | NULL |  | Monetary amount |
| `Currency` | char(2) | NULL |  |  |
| `Address` | varchar(200) | NULL |  |  |
| `Memo` | varchar(50) | NULL |  |  |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `iCreatedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `dtClear` | datetime | NULL |  | Date/time field |
| `iClearUserID` | int | NULL |  | Integer field |
| `dtEffective` | datetime | NULL |  | Effective date |
| `iLastModifiedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who last modified this record |
| `dtLastModified` | datetime | NULL |  | Timestamp when record was last modified |
| `iEFTID` | int | NULL |  | Integer field |
| `iLinkedType` | tinyint | NULL |  | Small integer/flag field |

### `UB_ChequeDetail`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iChequeID` | int | NULL |  | Integer field |
| `iType` | tinyint | NULL |  | Type/category code |
| `mAmount` | money | NULL |  | Monetary amount |
| `Memo` | varchar(80) | NULL |  |  |
| `dtEffective` | datetime | NULL |  | Effective date |
| `ClientName` | varchar(80) | NULL |  |  |
| `AddressLine1` | varchar(80) | NULL |  |  |
| `AddressLine2` | varchar(80) | NULL |  |  |
| `PlanID` | varchar(20) | NULL |  |  |
| `PlanDescription` | varchar(80) | NULL |  |  |
| `DealerCode` | varchar(5) | NULL |  | Dealer code identifier |
| `RepCode` | varchar(5) | NULL |  | Representative/advisor code |
| `MgmtCode` | varchar(12) | NULL |  | Management company code |
| `FundID` | varchar(5) | NULL |  | Fund identifier code (e.g., DYN 3056) |
| `FundAccountID` | varchar(15) | NULL |  |  |
| `TrxDescription` | varchar(80) | NULL |  |  |
| `OrderID` | varchar(10) | NULL |  |  |
| `mGAmount` | money | NULL |  |  |
| `mCommission` | money | NULL |  |  |
| `mSAmount` | money | NULL |  |  |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `iCreatedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `dtModified` | datetime | NULL |  | Date/time field |
| `iModifiedUserID` | int | NULL |  | Integer field |

### `UB_ChequeParams`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `iPosition` | tinyint | NULL |  | Small integer/flag field |
| `bDollarSign` | tinyint | NULL |  |  |
| `iCol1` | int | NULL |  | Integer field |
| `iCol2` | int | NULL |  | Integer field |
| `iCol3` | int | NULL |  | Integer field |
| `iCol4` | int | NULL |  | Integer field |
| `iCheckHeight` | int | NULL |  | Integer field |
| `iDetailHeight` | int | NULL |  | Integer field |
| `iHeight1_2` | int | NULL |  | Integer field |
| `iHeight2_3` | int | NULL |  | Integer field |
| `bDollarB4Name` | tinyint | NULL |  |  |
| `iOffset_V1` | int | NULL |  | Integer field |
| `iOffset_H1` | int | NULL |  | Integer field |
| `iOffset_V2` | int | NULL |  | Integer field |
| `iOffset_H2` | int | NULL |  | Integer field |
| `bNoChequeNumber` | tinyint | NULL |  |  |
| `iFlag` | int | NULL |  | Integer field |
| `iSigEnable` | tinyint | NULL |  | Small integer/flag field |
| `iSigPosX1` | int | NULL |  | Integer field |
| `iSigPosY1` | int | NULL |  | Integer field |
| `iSigPosX2` | int | NULL |  | Integer field |
| `iSigPosY2` | int | NULL |  | Integer field |
| `iSigWidth1` | int | NULL |  | Integer field |
| `iSigWidth2` | int | NULL |  | Integer field |
| `iSigHeight1` | int | NULL |  | Integer field |
| `iSigHeight2` | int | NULL |  | Integer field |
| `SigObj1` | varbinary(max) | NULL |  |  |
| `SigObj2` | varbinary(max) | NULL |  |  |
| `iMarginRight` | int | NULL |  | Integer field |

### `UB_City`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `CountryCode` | varchar(3) | NULL |  |  |
| `ProvinceCode` | varchar(3) | NULL |  |  |
| `CityName` | varchar(80) | NULL |  |  |

### `UB_CommBatchCodeExp`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `Description` | varchar(80) | NULL |  |  |

### `UB_CommBatchDef`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `DescriptionEN` | varchar(80) | NULL |  |  |
| `DescriptionFR` | varchar(80) | NULL |  |  |
| `iStatus` | tinyint | NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `dtLastRun` | datetime | NULL |  | Date/time field |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `iCreatedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |

### `UB_CommBatchItem`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iCommBatchDefID` | int | NULL |  | Integer field |
| `iStatus` | tinyint | NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `iIncomeCategory` | int | NULL |  | Integer field |
| `IncomeType` | char(1) | NULL |  |  |
| `CommissionType` | char(1) | NULL |  |  |
| `iClientID` | int | NULL |  | FK to UB_Client table - identifies the client/investor |
| `iPlanID` | int | NULL |  | FK to UB_Plan table - identifies the investment plan/account |
| `iAccountID` | int | NULL |  | Integer field |
| `iRepID` | int | NULL |  | FK to UB_Rep - identifies the representative/advisor |
| `DealerCode` | varchar(5) | NULL |  | Dealer code identifier |
| `RepCode` | varchar(5) | NULL |  | Representative/advisor code |
| `dtLastRun` | datetime | NULL |  | Date/time field |
| `CurrencyCode` | char(3) | NULL |  |  |
| `mAmount` | money | NULL |  | Monetary amount |
| `mTaxCollected` | money | NULL |  |  |
| `MgmtCode` | varchar(6) | NULL |  | Management company code |
| `FundID` | varchar(5) | NULL |  | Fund identifier code (e.g., DYN 3056) |
| `FundAccountID` | varchar(15) | NULL |  |  |
| `RefSourceName` | varchar(80) | NULL |  |  |
| `DealerAccountID` | varchar(15) | NULL |  |  |
| `IntCode` | varchar(4) | NULL |  |  |
| `IntAccountID` | varchar(15) | NULL |  |  |
| `iFlag` | tinyint | NULL |  | Small integer/flag field |
| `FirstName` | varchar(80) | NULL |  | First name |
| `LastName` | varchar(80) | NULL |  | Last name |
| `SIN_BN` | varchar(15) | NULL |  | Social Insurance Number or Business Number (Canada) |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `iCreatedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `AccountDesignation` | char(1) | NULL |  |  |

### `UB_CommCategoryDetail`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iCommCategory` | smallint | NULL |  |  |
| `NameEN` | varchar(80) | NULL |  | English name |
| `NameFR` | varchar(80) | NULL |  | French name |
| `ExpenseAccount` | varchar(15) | NULL |  |  |
| `iOrder` | int | NULL |  | Integer field |

### `UB_CommExtraFeeTrx`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `iOrderID` | int | NULL |  | Integer field |
| `iCommPayableID` | int | NULL |  | Integer field |

### `UB_CommFundTotal`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iRepID` | int | NOT NULL |  | FK to UB_Rep - identifies the representative/advisor |
| `DealerCode` | varchar(5) | NOT NULL |  | Dealer code identifier |
| `RepCode` | varchar(8) | NOT NULL |  | Representative/advisor code |
| `iFileID` | int | NOT NULL |  | FK to file record (FundServ file) |
| `iIncomeCategory` | tinyint | NOT NULL |  | Small integer/flag field |
| `iEntryType` | tinyint | NOT NULL |  | Small integer/flag field |
| `IncomeType` | char(1) | NOT NULL |  |  |
| `CommissionType` | char(1) | NOT NULL |  |  |
| `MgmtCode` | varchar(4) | NULL |  | Management company code |
| `FundID` | varchar(8) | NOT NULL |  | Fund identifier code (e.g., DYN 3056) |
| `dtSettlement` | datetime | NULL |  | Settlement date |
| `dtStart` | datetime | NULL |  | Date/time field |
| `dtEnd` | datetime | NULL |  | Date/time field |
| `CurrencyCode` | varchar(3) | NOT NULL |  |  |
| `PaymentID` | varchar(15) | NOT NULL |  |  |
| `PNIndicator` | char(1) | NULL |  |  |
| `mCommPayable` | money | NOT NULL |  |  |
| `MCSpecific` | varchar(3) | NULL |  |  |
| `fFundBalanceUnit` | float | NOT NULL |  | Decimal/float value |
| `mFundValue` | money | NOT NULL |  |  |
| `mPrice` | money | NOT NULL |  |  |
| `AssetIDCode` | char(1) | NOT NULL |  |  |

### `UB_CommissionSchedule`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iCategory` | int | NULL |  | Integer field |
| `DealerCode` | varchar(6) | NULL |  | Dealer code identifier |
| `CurrencyCode` | char(3) | NULL |  |  |
| `Frequency` | char(1) | NULL |  |  |
| `iRunDay` | int | NULL |  | Integer field |
| `mAmount` | money | NULL |  | Monetary amount |
| `Description` | varchar(80) | NULL |  |  |
| `dtStartDate` | datetime | NULL |  | Date/time field |
| `dtLastRun` | datetime | NULL |  | Date/time field |
| `dtNextRun` | datetime | NULL |  | Date/time field |
| `iCreatedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `iModifiedUserID` | int | NULL |  | Integer field |
| `dtLastModified` | datetime | NULL |  | Timestamp when record was last modified |
| `BatchCode` | varchar(80) | NULL |  |  |
| `mTaxFed` | money | NULL |  |  |
| `mTaxProv` | money | NULL |  |  |
| `mTotal` | money | NULL |  |  |
| `iTaxOpt` | tinyint | NULL |  | Small integer/flag field |
| `iTaxProvOpt` | tinyint | NULL |  | Small integer/flag field |

### `UB_CommissionScheduleDetail`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iCommissionScheduleID` | int | NULL |  | Integer field |
| `iMemberID` | int | NULL |  | FK to UB_Member - identifies the member/advisor |
| `mAmount` | money | NULL |  | Monetary amount |
| `mTaxFed` | money | NULL |  |  |
| `mTaxProv` | money | NULL |  |  |
| `mTotal` | money | NULL |  |  |

### `UB_CommMatrix`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iMemberID` | int | NOT NULL |  | FK to UB_Member - identifies the member/advisor |
| `iRepID` | int | NOT NULL |  | FK to UB_Rep - identifies the representative/advisor |
| `iMinEarning` | int | NOT NULL |  | Integer field |
| `iOverrideMemberID` | int | NOT NULL |  | Integer field |
| `iOverrideMemberType` | tinyint | NOT NULL |  | Small integer/flag field |
| `fRegular` | float | NOT NULL |  | Decimal/float value |
| `fServiceFee` | float | NOT NULL |  | Decimal/float value |
| `fPAC` | float | NOT NULL |  | Decimal/float value |
| `fInternalTrx` | float | NOT NULL |  | Decimal/float value |
| `fTermDeposit` | float | NOT NULL |  | Decimal/float value |
| `fInsurance` | float | NOT NULL |  | Decimal/float value |
| `fOther` | float | NOT NULL |  | Decimal/float value |
| `iTemplateID` | int | NOT NULL |  | Integer field |
| `iCreatedUserID` | int | NOT NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `dtCreated` | datetime | NOT NULL |  | Timestamp when record was created |
| `iLastModifiedUserID` | int | NOT NULL |  | FK to UB_MemberLogin - internal user who last modified this record |
| `dtLastModified` | datetime | NOT NULL |  | Timestamp when record was last modified |
| `MgmtCode` | varchar(6) | NULL |  | Management company code |
| `fTaxCollected` | float | NULL |  | Decimal/float value |
| `fTrxAdminFee` | float | NULL |  | Decimal/float value |
| `iTaxOpt` | tinyint | NULL |  | Small integer/flag field |
| `fExpense` | float | NULL |  | Decimal/float value |

### `UB_CommPayable`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iEntryType` | tinyint | NOT NULL |  | Small integer/flag field |
| `iReceivableID` | int | NOT NULL |  | Integer field |
| `iStatus` | tinyint | NOT NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `CommTrxType` | varchar(3) | NOT NULL |  |  |
| `iCommRateType` | tinyint | NOT NULL |  | Small integer/flag field |
| `dtEffective` | datetime | NULL |  | Effective date |
| `iMainRepID` | int | NOT NULL |  | Integer field |
| `iMainMemberID` | int | NOT NULL |  | Integer field |
| `mTotalCommission` | money | NOT NULL |  |  |
| `iMaxtrixID` | int | NOT NULL |  | Integer field |
| `iPayableMemberID` | int | NOT NULL |  | Integer field |
| `iOverrideMemberType` | tinyint | NOT NULL |  | Small integer/flag field |
| `fCommRate` | float | NOT NULL |  | Decimal/float value |
| `mPayableAmount` | money | NOT NULL |  |  |
| `dtPaid` | datetime | NULL |  | Date/time field |
| `iPaidUserID` | int | NOT NULL |  | Integer field |
| `dtCreated` | datetime | NOT NULL |  | Timestamp when record was created |
| `iCreatedUserID` | int | NOT NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `iIncomeCategory` | tinyint | NOT NULL |  | Small integer/flag field |
| `IncomeType` | char(1) | NOT NULL |  |  |
| `CommissionType` | char(1) | NOT NULL |  |  |
| `DealerCode` | varchar(5) | NOT NULL |  | Dealer code identifier |
| `RepCode` | varchar(8) | NOT NULL |  | Representative/advisor code |
| `CurrencyCode` | varchar(3) | NOT NULL |  |  |
| `MgmtCode` | varchar(6) | NULL |  | Management company code |
| `iPayrollID` | int | NOT NULL |  | Integer field |
| `iLastModifiedUserID` | int | NOT NULL |  | FK to UB_MemberLogin - internal user who last modified this record |
| `dtLastModified` | datetime | NULL |  | Timestamp when record was last modified |
| `Notes` | varchar(max) | NOT NULL |  |  |
| `iCategory` | int | NOT NULL |  | Integer field |
| `iScheduleID` | int | NULL |  | Integer field |
| `iWFID` | int | NULL |  | Integer field |
| `FundID` | varchar(8) | NULL |  | Fund identifier code (e.g., DYN 3056) |
| `mTaxCollected` | money | NULL |  |  |
| `fTaxCollectedRate` | float | NULL |  | Decimal/float value |
| `mTaxCollectedPayable` | money | NULL |  |  |
| `mTrxAdminFee` | money | NULL |  |  |
| `fTrxAdminFeeRate` | float | NULL |  | Decimal/float value |
| `mTrxAdminFeePayable` | money | NULL |  |  |
| `mTrxOtherFee` | money | NULL |  |  |
| `fTrxOtherFeeRate` | float | NULL |  | Decimal/float value |
| `mTrxOtherFeePayable` | money | NULL |  |  |
| `iRevenueGroupID` | int | NULL |  | Integer field |
| `fXRate` | float | NULL |  | Decimal/float value |
| `iExported` | tinyint | NULL |  | Small integer/flag field |
| `mTaxFed` | money | NULL |  |  |
| `mTaxProv` | money | NULL |  |  |
| `iTrustTrxID` | int | NULL |  | Integer field |
| `iOrgPayableID` | int | NULL |  | Integer field |
| `iFeeType` | tinyint | NULL |  | Small integer/flag field |

### `UB_CommPayableSearchList`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `iUserID` | int | NOT NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `iCommPayableID` | int | NOT NULL |  | Integer field |

### `UB_CommPayableSelection`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `iUserID` | int | NOT NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `ID` | int | NOT NULL |  | Primary key, auto-increment identifier |

### `UB_CommPayroll`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `CurrencyCode` | varchar(3) | NOT NULL |  |  |
| `DealerCode` | varchar(5) | NOT NULL |  | Dealer code identifier |
| `iPaidMemberID` | int | NOT NULL |  | Integer field |
| `mPaidAmount` | money | NOT NULL |  |  |
| `mYTD` | money | NOT NULL |  |  |
| `iCreatedUserID` | int | NOT NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `iStatus` | tinyint | NOT NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `dtPaid` | datetime | NULL |  | Date/time field |
| `iBankAccountID` | int | NOT NULL |  | Integer field |
| `iCheckNumber` | int | NOT NULL |  | Integer field |
| `PaidMethod` | char(1) | NOT NULL |  |  |
| `ObjData` | varbinary(max) | NULL |  |  |
| `iObjStatus` | tinyint | NOT NULL |  | Small integer/flag field |
| `iEFTStatus` | tinyint | NULL |  | Small integer/flag field |
| `fXRate` | float | NULL |  | Decimal/float value |
| `iFiscalYear` | int | NULL |  | Integer field |
| `mBalance` | money | NULL |  |  |
| `mLastBalance` | money | NULL |  |  |
| `mPayable` | money | NULL |  |  |
| `mTaxCollected` | money | NULL |  |  |
| `mTaxYTD` | money | NULL |  |  |
| `mTaxCollectedNet` | money | NULL |  |  |
| `mExpense` | money | NULL |  |  |
| `mExpenseYTD` | money | NULL |  |  |
| `mCommission` | money | NULL |  |  |
| `mCommissionYTD` | money | NULL |  |  |
| `iEFTID` | int | NULL |  | Integer field |
| `iXRateOpt` | tinyint | NULL |  | Small integer/flag field |
| `iFileID` | int | NULL |  | FK to file record (FundServ file) |
| `iSlipID` | int | NULL |  | Integer field |
| `iRL1ID` | int | NULL |  | Integer field |

### `UB_CommPayrollDetail`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `iPayrollID` | int | NOT NULL |  | Integer field |
| `iPayableID` | int | NOT NULL |  | Integer field |

### `UB_CommPayrollExportTask`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iType` | tinyint | NULL |  | Type/category code |
| `CurrencyCode` | char(2) | NULL |  |  |
| `iStatus` | tinyint | NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `DealerCodes` | varchar(80) | NULL |  | Dealer code identifier |
| `iSequence` | int | NULL |  | Sequence number |
| `dtStart` | datetime | NULL |  | Date/time field |
| `dtEffective` | datetime | NULL |  | Effective date |

### `UB_CommPayrollObjPending`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `iPayrollID` | int | NOT NULL |  | Integer field |

### `UB_CommPayrollSearchList`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `iUserID` | int | NOT NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `iPayrollID` | int | NOT NULL |  | Integer field |

### `UB_CommPayrollSelection`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `iUserID` | int | NOT NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `ID` | int | NOT NULL |  | Primary key, auto-increment identifier |

### `UB_CommRevenue`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iStatus` | tinyint | NOT NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `iRepID` | int | NOT NULL |  | FK to UB_Rep - identifies the representative/advisor |
| `MgmtCode` | varchar(6) | NULL |  | Management company code |
| `DealerCode` | varchar(5) | NOT NULL |  | Dealer code identifier |
| `RepCode` | varchar(8) | NOT NULL |  | Representative/advisor code |
| `iFileID` | int | NOT NULL |  | FK to file record (FundServ file) |
| `iHeaderID` | int | NULL |  | FK to parent header record |
| `CurrencyCode` | varchar(3) | NOT NULL |  |  |
| `IncomeType` | char(1) | NOT NULL |  |  |
| `dtSettlement` | datetime | NULL |  | Settlement date |
| `PaymentID` | varchar(15) | NOT NULL |  |  |
| `iIncomeCategory` | tinyint | NOT NULL |  | Small integer/flag field |
| `iEntryType` | tinyint | NOT NULL |  | Small integer/flag field |
| `CommissionType` | char(1) | NOT NULL |  |  |
| `iFundPosID` | int | NOT NULL |  | Integer field |
| `FundID` | varchar(8) | NOT NULL |  | Fund identifier code (e.g., DYN 3056) |
| `iProductType` | tinyint | NOT NULL |  | Small integer/flag field |
| `FundAccountID` | varchar(20) | NULL |  |  |
| `dtStart` | datetime | NULL |  | Date/time field |
| `dtEnd` | datetime | NULL |  | Date/time field |
| `dtTrade` | datetime | NULL |  | Trade date |
| `DealerAccountID` | varchar(15) | NOT NULL |  |  |
| `IntermediaryCode` | varchar(4) | NOT NULL |  |  |
| `IntermediaryAccID` | varchar(15) | NOT NULL |  |  |
| `iTrxID` | int | NOT NULL |  | Integer field |
| `iTrustTrxID` | int | NOT NULL |  | Integer field |
| `iTrxType` | int | NOT NULL |  | Integer field |
| `TrxType` | char(1) | NULL |  |  |
| `TrxTypeDetail` | char(1) | NULL |  |  |
| `ProdEventInd` | varchar(2) | NOT NULL |  |  |
| `OrderID` | varchar(7) | NULL |  |  |
| `PNIndicator` | char(1) | NULL |  |  |
| `mGAmount` | money | NULL |  |  |
| `fCommissionPer` | float | NOT NULL |  | Decimal/float value |
| `mDealerComm` | money | NOT NULL |  |  |
| `mCommPayable` | money | NOT NULL |  |  |
| `mNAmount` | money | NOT NULL |  |  |
| `MCSpecific` | varchar(3) | NULL |  |  |
| `OriginatorID` | varchar(15) | NOT NULL |  |  |
| `AccountDesig` | char(1) | NOT NULL |  |  |
| `OrderSource` | char(1) | NOT NULL |  |  |
| `SourceID` | varchar(30) | NULL |  | Source identifier |
| `GNSettlementInd` | char(1) | NOT NULL |  |  |
| `iPaymentStatus` | tinyint | NOT NULL |  | Small integer/flag field |
| `dtPaid` | datetime | NULL |  | Date/time field |
| `iPaidUserID` | int | NOT NULL |  | Integer field |
| `dtCreated` | datetime | NOT NULL |  | Timestamp when record was created |
| `iCreatedUserID` | int | NOT NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `dtLastModified` | datetime | NOT NULL |  | Timestamp when record was last modified |
| `iLastModifiedUserID` | int | NOT NULL |  | FK to UB_MemberLogin - internal user who last modified this record |
| `OwnerLastName` | varchar(80) | NOT NULL |  |  |
| `OwnerFirstName` | varchar(40) | NOT NULL |  |  |
| `OwnerSIN` | varchar(15) | NOT NULL |  |  |
| `DealerRepCode` | varchar(10) | NULL |  | Representative/advisor code |
| `iRepID2` | int | NULL |  | Integer field |
| `iPlanID` | int | NULL |  | FK to UB_Plan table - identifies the investment plan/account |
| `iClientID` | int | NULL |  | FK to UB_Client table - identifies the client/investor |
| `mTaxCollected` | money | NULL |  |  |
| `mTotalPayable` | money | NULL |  |  |
| `iTrxTypeX` | tinyint | NULL |  | Small integer/flag field |
| `mTrxAdminFee` | money | NULL |  |  |
| `mTrxOtherFee` | money | NULL |  |  |
| `iWFID` | int | NULL |  | Integer field |
| `RefSourceName` | varchar(80) | NULL |  |  |
| `iCommissionTypeX` | int | NULL |  | Integer field |
| `iAccountID` | int | NULL |  | Integer field |
| `iRevenueGroupID` | int | NULL |  | Integer field |
| `dtDeposit` | datetime | NULL |  | Date/time field |
| `fXRate` | float | NULL |  | Decimal/float value |
| `iAgoraID` | int | NULL |  | Integer field |
| `JurTaxCode` | varchar(3) | NULL |  |  |
| `iExported` | tinyint | NULL |  | Small integer/flag field |
| `iFeeType` | tinyint | NULL |  | Small integer/flag field |
| `fRateRep` | float | NULL |  | Decimal/float value |
| `fRateRep2` | float | NULL |  | Decimal/float value |
| `fRateRep3` | float | NULL |  | Decimal/float value |
| `fRateRep4` | float | NULL |  | Decimal/float value |
| `fRateM` | float | NULL |  | Decimal/float value |
| `fRateM2` | float | NULL |  | Decimal/float value |
| `fRateM3` | float | NULL |  | Decimal/float value |

### `UB_CommRevenue_Detail`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iRevenueID` | int | NULL |  | Integer field |
| `FundID` | varchar(5) | NULL |  | Fund identifier code (e.g., DYN 3056) |
| `iAccountPosID` | int | NULL |  | Integer field |
| `CommType` | char(1) | NULL |  |  |
| `mTotCommPd` | money | NULL |  |  |
| `mTaxCollected` | money | NULL |  |  |
| `mTotalPd` | money | NULL |  |  |

### `UB_CommRevenueBalance`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iRepID` | int | NOT NULL |  | FK to UB_Rep - identifies the representative/advisor |
| `mRevenue` | money | NOT NULL |  |  |
| `mServiceFee` | money | NOT NULL |  |  |
| `dtEffective` | datetime | NOT NULL |  | Effective date |

### `UB_CommRevenueGroup`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `DealerCode` | varchar(6) | NULL |  | Dealer code identifier |
| `RepCode` | varchar(6) | NULL |  | Representative/advisor code |
| `iRepID` | int | NULL |  | FK to UB_Rep - identifies the representative/advisor |
| `MgmtCode` | varchar(6) | NULL |  | Management company code |
| `iHeaderID` | int | NULL |  | FK to parent header record |
| `mCommission` | money | NULL |  |  |
| `mTaxCollected` | money | NULL |  |  |
| `fRateRep` | float | NULL |  | Decimal/float value |
| `fRateRep2` | float | NULL |  | Decimal/float value |
| `fRateRep3` | float | NULL |  | Decimal/float value |
| `fRateRep4` | float | NULL |  | Decimal/float value |
| `fRateM` | float | NULL |  | Decimal/float value |
| `fRateM2` | float | NULL |  | Decimal/float value |
| `fRateM3` | float | NULL |  | Decimal/float value |

### `UB_CommRevenueHeader`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iFileID` | int | NULL |  | FK to file record (FundServ file) |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `dtStart` | datetime | NULL |  | Date/time field |
| `dtEnd` | datetime | NULL |  | Date/time field |
| `MgmtCode` | varchar(5) | NULL |  | Management company code |
| `DealerCode` | varchar(5) | NULL |  | Dealer code identifier |
| `iIncomeCategory` | tinyint | NULL |  | Small integer/flag field |
| `iEntryType` | tinyint | NULL |  | Small integer/flag field |
| `CurrencyCode` | varchar(3) | NULL |  |  |
| `IncomeType` | char(1) | NULL |  |  |
| `iProductType` | tinyint | NULL |  | Small integer/flag field |
| `PaymentID` | varchar(15) | NULL |  |  |
| `mTotalCommPayable` | money | NULL |  |  |
| `mTotalCommission` | money | NULL |  |  |
| `dtSettlement` | datetime | NULL |  | Settlement date |
| `iStatus` | tinyint | NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `mTotalTaxCollected` | money | NULL |  |  |
| `mTotalServiceFee` | money | NULL |  |  |
| `iExtraType` | tinyint | NULL |  | Small integer/flag field |
| `dtDeposit` | datetime | NULL |  | Date/time field |
| `fXRate` | float | NULL |  | Decimal/float value |

### `UB_CommRevenueHeaderEx`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iHeaderID` | int | NULL |  | FK to parent header record |
| `JurCode` | varchar(3) | NULL |  |  |
| `mTaxCollected` | money | NULL |  |  |

### `UB_CommTemplate`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iCommCategoryDetail` | int | NOT NULL |  | Integer field |
| `NameEN` | varchar(80) | NULL |  | English name |
| `NameFR` | varchar(80) | NULL |  | French name |
| `fRegular` | float | NOT NULL |  | Decimal/float value |
| `fPAC` | float | NOT NULL |  | Decimal/float value |
| `fInternalTrx` | float | NOT NULL |  | Decimal/float value |
| `fServiceFee` | float | NOT NULL |  | Decimal/float value |
| `fTermDeposit` | float | NOT NULL |  | Decimal/float value |
| `fInsurance` | float | NOT NULL |  | Decimal/float value |
| `fOther` | float | NOT NULL |  | Decimal/float value |
| `iWFID` | int | NULL |  | Integer field |
| `fTrxAdminFee` | float | NULL |  | Decimal/float value |
| `fTaxCollected` | float | NULL |  | Decimal/float value |

### `UB_CompCheckClient`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `iClientID` | int | NOT NULL |  | FK to UB_Client table - identifies the client/investor |
| `iFlag` | tinyint | NULL |  | Small integer/flag field |
| `iAddress` | tinyint | NULL |  | Small integer/flag field |
| `iEmployment` | tinyint | NULL |  | Small integer/flag field |
| `iDependant` | tinyint | NULL |  | Small integer/flag field |
| `iQuestionnaire` | tinyint | NULL |  | Small integer/flag field |
| `iDOB` | tinyint | NULL |  | Small integer/flag field |
| `iKnowledge` | tinyint | NULL |  | Small integer/flag field |
| `iIncome` | tinyint | NULL |  | Small integer/flag field |
| `iNetworth` | tinyint | NULL |  | Small integer/flag field |
| `dtLastModified` | datetime | NULL |  | Timestamp when record was last modified |
| `iLastModifiedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who last modified this record |

### `UB_CompCheckClientARC`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iFlag` | tinyint | NULL |  | Small integer/flag field |
| `iClientID` | int | NOT NULL |  | FK to UB_Client table - identifies the client/investor |
| `iAddress` | tinyint | NULL |  | Small integer/flag field |
| `iEmployment` | tinyint | NULL |  | Small integer/flag field |
| `iDependant` | tinyint | NULL |  | Small integer/flag field |
| `iQuestionnaire` | tinyint | NULL |  | Small integer/flag field |
| `iDOB` | tinyint | NULL |  | Small integer/flag field |
| `iKnowledge` | tinyint | NULL |  | Small integer/flag field |
| `iIncome` | tinyint | NULL |  | Small integer/flag field |
| `iNetworth` | tinyint | NULL |  | Small integer/flag field |
| `dtLastModified` | datetime | NULL |  | Timestamp when record was last modified |
| `iLastModifiedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who last modified this record |

### `UB_CompCheckPlan`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `iPlanID` | int | NOT NULL |  | FK to UB_Plan table - identifies the investment plan/account |
| `iFlag` | tinyint | NULL |  | Small integer/flag field |
| `iRisk` | tinyint | NULL |  | Small integer/flag field |
| `iHorizon` | tinyint | NULL |  | Small integer/flag field |
| `iQuestionnaire` | tinyint | NULL |  | Small integer/flag field |
| `iObjective` | tinyint | NULL |  | Small integer/flag field |
| `iJointIncome` | tinyint | NULL |  | Small integer/flag field |
| `iJointNetworth` | tinyint | NULL |  | Small integer/flag field |
| `iLeveragedFlag` | tinyint | NULL |  | Small integer/flag field |
| `iLeveragedNetworthDetails` | tinyint | NULL |  | Small integer/flag field |
| `iLeveragedObjective` | tinyint | NULL |  | Small integer/flag field |
| `iLeveragedAge` | tinyint | NULL |  | Small integer/flag field |
| `iLeveragedOccupation` | tinyint | NULL |  | Small integer/flag field |
| `iLeveragedRiskLow` | tinyint | NULL |  | Small integer/flag field |
| `iLeveragedKnowledge` | tinyint | NULL |  | Small integer/flag field |
| `iLeveragedHorizon` | tinyint | NULL |  | Small integer/flag field |
| `dtLastModified` | datetime | NULL |  | Timestamp when record was last modified |
| `iLastModifiedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who last modified this record |

### `UB_CompCheckPlanARC`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iPlanID` | int | NOT NULL |  | FK to UB_Plan table - identifies the investment plan/account |
| `iFlag` | tinyint | NULL |  | Small integer/flag field |
| `iRisk` | tinyint | NULL |  | Small integer/flag field |
| `iHorizon` | tinyint | NULL |  | Small integer/flag field |
| `iQuestionnaire` | tinyint | NULL |  | Small integer/flag field |
| `iObjective` | tinyint | NULL |  | Small integer/flag field |
| `iJointIncome` | tinyint | NULL |  | Small integer/flag field |
| `iJointNetworth` | tinyint | NULL |  | Small integer/flag field |
| `iLeveragedFlag` | tinyint | NULL |  | Small integer/flag field |
| `iLeveragedNetworthDetails` | tinyint | NULL |  | Small integer/flag field |
| `iLeveragedObjective` | tinyint | NULL |  | Small integer/flag field |
| `iLeveragedAge` | tinyint | NULL |  | Small integer/flag field |
| `iLeveragedOccupation` | tinyint | NULL |  | Small integer/flag field |
| `iLeveragedRiskLow` | tinyint | NULL |  | Small integer/flag field |
| `iLeveragedKnowledge` | tinyint | NULL |  | Small integer/flag field |
| `iLeveragedHorizon` | tinyint | NULL |  | Small integer/flag field |
| `dtLastModified` | datetime | NULL |  | Timestamp when record was last modified |
| `iLastModifiedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who last modified this record |

### `UB_CompensationExtra`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `PlanID` | varchar(15) | NULL |  |  |
| `mAmount` | money | NULL |  | Monetary amount |
| `iFiscalYear` | int | NULL |  | Integer field |
| `iPlanID` | int | NULL |  | FK to UB_Plan table - identifies the investment plan/account |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `iType` | int | NULL |  | Type/category code |

### `UB_CompliancePlanCommFee`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iMonthIndex` | int | NOT NULL |  | Integer field |
| `iPlanID` | int | NOT NULL |  | FK to UB_Plan table - identifies the investment plan/account |
| `iCategory` | tinyint | NOT NULL |  | Small integer/flag field |
| `mAmountIn` | money | NULL |  | Monetary amount |
| `mAmountOut` | money | NULL |  | Monetary amount |
| `mCommission` | money | NULL |  |  |
| `mFee` | money | NULL |  |  |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |

### `UB_CompliancePlanCommFeeTrx`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `iPlanCommFeeID` | int | NOT NULL |  | Integer field |
| `iTrxID` | int | NOT NULL |  | Integer field |
| `iCategory` | tinyint | NULL |  | Small integer/flag field |
| `iMonthIndex` | int | NULL |  | Integer field |
| `iPlanID` | int | NULL |  | FK to UB_Plan table - identifies the investment plan/account |

### `UB_CompliancePlanTrend`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iPlanID` | int | NULL |  | FK to UB_Plan table - identifies the investment plan/account |
| `iMonthIndex` | int | NULL |  | Integer field |
| `iNumTrx` | smallint | NULL |  |  |
| `mCommission` | money | NULL |  |  |
| `iCommission` | int | NULL |  | Integer field |
| `iNumTrxFlag` | tinyint | NULL |  | Small integer/flag field |
| `iCommFlag` | tinyint | NULL |  | Small integer/flag field |

### `UB_ComplianceTrxTrend`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `iTrxID` | int | NOT NULL |  | Integer field |
| `iMonthIndex` | int | NOT NULL |  | Integer field |
| `iTrxID2` | int | NOT NULL |  | Integer field |
| `iShortTerm` | tinyint | NOT NULL |  | Small integer/flag field |
| `iDSCIssue` | tinyint | NOT NULL |  | Small integer/flag field |
| `iRedemptionFee` | tinyint | NOT NULL |  | Small integer/flag field |
| `iSwitchFee` | tinyint | NOT NULL |  | Small integer/flag field |
| `iSwitchLoad` | tinyint | NOT NULL |  | Small integer/flag field |

### `UB_ComplianceTrxTrendShortTerm`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `iTrxID` | int | NOT NULL |  | Integer field |
| `iMonthIndex` | int | NULL |  | Integer field |
| `iTrxID2` | int | NULL |  | Integer field |

### `UB_CompPlanApprovalStatus`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `iPlanID` | int | NOT NULL |  | FK to UB_Plan table - identifies the investment plan/account |
| `iApprovalStatus1` | tinyint | NULL |  | Small integer/flag field |
| `iApprovalUserID1` | int | NULL |  | Integer field |
| `dtDue1` | datetime | NULL |  | Date/time field |
| `dtApproval1` | datetime | NULL |  | Date/time field |
| `bLate1` | tinyint | NULL |  |  |
| `bLockDecision1` | tinyint | NULL |  |  |
| `iApprovalStatus2` | tinyint | NULL |  | Small integer/flag field |
| `iApprovalUserID2` | int | NULL |  | Integer field |
| `dtDue2` | datetime | NULL |  | Date/time field |
| `dtApproval2` | datetime | NULL |  | Date/time field |
| `bLate2` | tinyint | NULL |  |  |
| `bLockDecision2` | tinyint | NULL |  |  |
| `ApprovalNotes` | varchar(max) | NULL |  |  |
| `bUpdate` | tinyint | NULL |  |  |
| `iApprovalStatusUpdate1` | tinyint | NULL |  | Small integer/flag field |
| `iApprovalUserIDUpdate1` | int | NULL |  | Integer field |
| `dtDueUpdate1` | datetime | NULL |  | Date/time field |
| `dtApprovalUpdate1` | datetime | NULL |  | Date/time field |
| `bLateUpdate1` | tinyint | NULL |  |  |
| `iApprovalStatusUpdate2` | tinyint | NULL |  | Small integer/flag field |
| `iApprovalUserIDUpdate2` | int | NULL |  | Integer field |
| `dtApprovalUpdate2` | datetime | NULL |  | Date/time field |
| `dtDueUpdate2` | datetime | NULL |  | Date/time field |
| `bLateUpdate2` | tinyint | NULL |  |  |
| `bLockDecisionUpdate1` | tinyint | NULL |  |  |
| `bLockDecisionUpdate2` | tinyint | NULL |  |  |
| `iGroupID` | int | NULL |  | Integer field |

### `UB_CompPlanApprovalStatusHistory`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iPlanID` | int | NOT NULL |  | FK to UB_Plan table - identifies the investment plan/account |
| `bAccountUpdate` | tinyint | NULL |  |  |
| `iApprovalLevel` | tinyint | NULL |  | Small integer/flag field |
| `iApprovalStatus` | tinyint | NULL |  | Small integer/flag field |
| `dtApproval` | datetime | NULL |  | Date/time field |
| `iApprovalUserID` | int | NULL |  | Integer field |
| `dtDue` | datetime | NULL |  | Date/time field |
| `bLate` | tinyint | NULL |  |  |
| `iNoteID` | int | NULL |  | Integer field |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `iRepID` | int | NULL |  | FK to UB_Rep - identifies the representative/advisor |
| `RepCode` | varchar(50) | NULL |  | Representative/advisor code |
| `RepName` | varchar(80) | NULL |  |  |
| `PlanType` | varchar(2) | NULL |  |  |
| `iSpousal` | tinyint | NULL |  | Small integer/flag field |
| `iSD` | tinyint | NULL |  | Small integer/flag field |
| `iInTrust` | tinyint | NULL |  | Small integer/flag field |
| `RecipientCode` | char(1) | NULL |  |  |
| `DealerAccountID` | varchar(20) | NULL |  |  |
| `bLeveraged` | tinyint | NULL |  |  |
| `bDocReceived` | tinyint | NULL |  |  |
| `ClientName` | varchar(150) | NULL |  |  |
| `AgeStr` | varchar(20) | NULL |  |  |
| `iTimeHorizon` | tinyint | NULL |  | Small integer/flag field |
| `iIncome` | tinyint | NULL |  | Small integer/flag field |
| `iInvestmentKnowledge` | tinyint | NULL |  | Small integer/flag field |
| `mAssetLiquidity` | money | NULL |  |  |
| `mAssetFixed` | money | NULL |  |  |
| `mLiability` | money | NULL |  |  |
| `fRisk1` | float | NULL |  | Decimal/float value |
| `fRisk2` | float | NULL |  | Decimal/float value |
| `fRisk3` | float | NULL |  | Decimal/float value |
| `fRisk4` | float | NULL |  | Decimal/float value |
| `fRisk5` | float | NULL |  | Decimal/float value |
| `fRisk6` | float | NULL |  | Decimal/float value |
| `fPrimaryObj1` | float | NULL |  | Decimal/float value |
| `fPrimaryObj2` | float | NULL |  | Decimal/float value |
| `fPrimaryObj3` | float | NULL |  | Decimal/float value |
| `fPrimaryObj4` | float | NULL |  | Decimal/float value |
| `fPrimaryObj5` | float | NULL |  | Decimal/float value |
| `iGroupID` | int | NULL |  | Integer field |
| `LoginID` | varchar(100) | NULL |  | Login username |
| `mAnnualIncome` | money | NULL |  |  |
| `bPOA` | tinyint | NULL |  |  |
| `bLTA` | tinyint | NULL |  |  |
| `dtPOA` | datetime | NULL |  | Date/time field |
| `iAML` | tinyint | NULL |  | Small integer/flag field |
| `iPEFP` | tinyint | NULL |  | Small integer/flag field |

### `UB_CompPlanDoc`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iPlanID` | int | NULL |  | FK to UB_Plan table - identifies the investment plan/account |
| `iDocDefID` | int | NULL |  | Integer field |
| `iStatus` | tinyint | NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `dtDue` | datetime | NULL |  | Date/time field |
| `dtReceived` | datetime | NULL |  | Date/time field |
| `iUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `dtLastModified` | datetime | NULL |  | Timestamp when record was last modified |

### `UB_CompReportType`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | smallint | NOT NULL |  | Primary key, auto-increment identifier |
| `NameEN` | varchar(100) | NULL |  | English name |
| `NameFR` | varchar(100) | NULL |  | French name |
| `iType` | tinyint | NULL |  | Type/category code |
| `iOrder` | smallint | NULL |  |  |

### `UB_CompSetting`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `DSID` | int | NOT NULL |  |  |
| `iModelPercentage` | tinyint | NULL |  | Small integer/flag field |
| `iIncludeGIC` | tinyint | NULL |  | Small integer/flag field |
| `iPreTrade` | tinyint | NULL |  | Small integer/flag field |
| `iNoFSPlanNotApproved` | tinyint | NULL |  | Small integer/flag field |
| `iNoFSDocNotReceived25` | tinyint | NULL |  | Small integer/flag field |
| `iNoCommDocNotReceived25` | tinyint | NULL |  | Small integer/flag field |
| `dtLastModifiedDate` | datetime | NULL |  | Date/time field |
| `iLastModifiedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who last modified this record |
| `iKYCUpdatePeriod` | int | NULL |  | Integer field |
| `iApproveTrxBothSide` | tinyint | NULL |  | Small integer/flag field |
| `iCompKYCOpt` | tinyint | NULL |  | Small integer/flag field |
| `iRiskOpt` | tinyint | NULL |  | Small integer/flag field |
| `iNonWiredDueOpt` | tinyint | NULL |  | Small integer/flag field |
| `iFrozenOpt` | tinyint | NULL |  | Small integer/flag field |
| `iKYCUpdatePeriodLeveraged` | int | NULL |  | Integer field |
| `iKYCUpdatePeriodDealer1` | int | NULL |  | Integer field |
| `DealerCode1` | varchar(6) | NULL |  | Dealer code identifier |
| `iPACMinAmount` | int | NULL |  | Integer field |
| `iBalanceIncome` | int | NULL |  | Integer field |
| `iBalanceGrowth` | int | NULL |  | Integer field |
| `iFlag` | int | NULL |  | Integer field |
| `fRiskVariant` | float | NULL |  | Decimal/float value |
| `fObjVariant` | float | NULL |  | Decimal/float value |
| `iEFTConsentRequired` | tinyint | NULL |  | Small integer/flag field |
| `iFlag2` | int | NULL |  | Integer field |
| `iKYCUpdatePeriodExempt` | int | NULL |  | Integer field |
| `iETFTrxFeeOpt` | tinyint | NULL |  | Small integer/flag field |
| `mETFTrxFeeAmount` | money | NULL |  |  |
| `mETFTrxFeeMax` | money | NULL |  |  |
| `mPreTradeSellAmount` | money | NULL |  |  |
| `iEFTDepositOpt` | tinyint | NULL |  | Small integer/flag field |

### `UB_CompSettingARC`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `DSID` | int | NOT NULL |  |  |
| `iModelPercentage` | tinyint | NULL |  | Small integer/flag field |
| `iPreTrade` | tinyint | NULL |  | Small integer/flag field |
| `iIncludeGIC` | tinyint | NULL |  | Small integer/flag field |
| `iNoFSPlanNotApproved` | tinyint | NULL |  | Small integer/flag field |
| `iNoFSDocNotReceived25` | tinyint | NULL |  | Small integer/flag field |
| `iNoCommDocNotReceived25` | tinyint | NULL |  | Small integer/flag field |
| `dtLastModifiedDate` | datetime | NULL |  | Date/time field |
| `iLastModifiedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who last modified this record |
| `iKYCUpdatePeriod` | int | NULL |  | Integer field |
| `iApproveTrxBothSide` | tinyint | NULL |  | Small integer/flag field |
| `iCompKYCOpt` | tinyint | NULL |  | Small integer/flag field |
| `iRiskOpt` | tinyint | NULL |  | Small integer/flag field |
| `iNonWiredDueOpt` | tinyint | NULL |  | Small integer/flag field |
| `iFrozenOpt` | tinyint | NULL |  | Small integer/flag field |
| `iKYCUpdatePeriodLeveraged` | int | NULL |  | Integer field |
| `iKYCUpdatePeriodDealer1` | int | NULL |  | Integer field |
| `DealerCode1` | varchar(6) | NULL |  | Dealer code identifier |
| `iPACMinAmount` | int | NULL |  | Integer field |
| `iBalanceIncome` | int | NULL |  | Integer field |
| `iBalanceGrowth` | int | NULL |  | Integer field |
| `iFlag` | int | NULL |  | Integer field |
| `fRiskVariant` | float | NULL |  | Decimal/float value |
| `fObjVariant` | float | NULL |  | Decimal/float value |
| `iEFTConsentRequired` | tinyint | NULL |  | Small integer/flag field |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `iFlag2` | int | NULL |  | Integer field |
| `iKYCUpdatePeriodExempt` | int | NULL |  | Integer field |
| `iETFTrxFeeOpt` | tinyint | NULL |  | Small integer/flag field |
| `mETFTrxFeeAmount` | money | NULL |  |  |
| `mETFTrxFeeMax` | money | NULL |  |  |
| `mPreTradeSellAmount` | money | NULL |  |  |
| `iEFTDepositOpt` | tinyint | NULL |  | Small integer/flag field |

### `UB_CompTrendReviewObj`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iType` | tinyint | NULL |  | Type/category code |
| `iReportID` | int | NOT NULL |  | Integer field |
| `iUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `dtReview` | datetime | NULL |  | Date/time field |
| `ReviewNotes` | varchar(max) | NULL |  |  |
| `SearchCriteria` | varchar(max) | NULL |  |  |
| `ObjData` | varbinary(max) | NULL |  |  |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |

### `UB_CompTrxApprovalPlanInfo`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iRecordLock` | tinyint | NULL |  | Small integer/flag field |
| `iPlanID` | int | NULL |  | FK to UB_Plan table - identifies the investment plan/account |
| `DealerCode` | varchar(5) | NULL |  | Dealer code identifier |
| `RepCode` | varchar(8) | NULL |  | Representative/advisor code |
| `AdvisorName` | varchar(100) | NULL |  |  |
| `ClientName` | varchar(140) | NULL |  |  |
| `AgeStr` | varchar(20) | NULL |  |  |
| `iIncome` | tinyint | NULL |  | Small integer/flag field |
| `iKnowledge` | tinyint | NULL |  | Small integer/flag field |
| `mAssetLiquid` | money | NULL |  |  |
| `mAssetFixed` | money | NULL |  |  |
| `mLiability` | money | NULL |  |  |
| `mNetWorth` | money | NULL |  |  |
| `AccountType` | char(2) | NULL |  |  |
| `DealerAccountID` | varchar(15) | NULL |  |  |
| `iSpousal` | tinyint | NULL |  | Small integer/flag field |
| `iInTrust` | tinyint | NULL |  | Small integer/flag field |
| `RecipientCode` | char(1) | NULL |  |  |
| `iSD` | tinyint | NULL |  | Small integer/flag field |
| `bDocReceived` | tinyint | NULL |  |  |
| `fPrimaryObj1` | float | NULL |  | Decimal/float value |
| `fPrimaryObj2` | float | NULL |  | Decimal/float value |
| `fPrimaryObj3` | float | NULL |  | Decimal/float value |
| `fPrimaryObj4` | float | NULL |  | Decimal/float value |
| `fPrimaryObj5` | float | NULL |  | Decimal/float value |
| `fRisk1` | float | NULL |  | Decimal/float value |
| `fRisk2` | float | NULL |  | Decimal/float value |
| `fRisk3` | float | NULL |  | Decimal/float value |
| `fRisk4` | float | NULL |  | Decimal/float value |
| `fRisk5` | float | NULL |  | Decimal/float value |
| `fRisk6` | float | NULL |  | Decimal/float value |
| `iPrimaryObj` | smallint | NULL |  |  |
| `Risk` | char(1) | NULL |  |  |
| `iTimeHorizon` | smallint | NULL |  |  |
| `iLeveraged` | tinyint | NULL |  | Small integer/flag field |
| `iLTA` | tinyint | NULL |  | Small integer/flag field |
| `iPOA` | tinyint | NULL |  | Small integer/flag field |
| `iAML` | tinyint | NULL |  | Small integer/flag field |
| `iPEFP` | tinyint | NULL |  | Small integer/flag field |
| `iKYCIncomplete` | tinyint | NULL |  | Small integer/flag field |
| `iApprovalStatus1` | tinyint | NULL |  | Small integer/flag field |
| `iApprovalStatus2` | tinyint | NULL |  | Small integer/flag field |
| `iApprovalUserID1` | int | NULL |  | Integer field |
| `iApprovalUserID2` | int | NULL |  | Integer field |
| `dtApproval1` | datetime | NULL |  | Date/time field |
| `dtApproval2` | datetime | NULL |  | Date/time field |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `mAnnualIncome` | money | NULL |  |  |
| `iFreezed` | tinyint | NULL |  | Small integer/flag field |

### `UB_CompTrxApprovalStatus`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iTrxID` | int | NULL |  | Integer field |
| `iTrxID2` | int | NULL |  | Integer field |
| `iOrderID` | int | NULL |  | Integer field |
| `iPlanID` | int | NULL |  | FK to UB_Plan table - identifies the investment plan/account |
| `iPlanInfoID` | int | NULL |  | Integer field |
| `iAccountPosID` | int | NULL |  | Integer field |
| `iAccountID` | int | NULL |  | Integer field |
| `iFlag1` | tinyint | NULL |  | Small integer/flag field |
| `iFlag2` | tinyint | NULL |  | Small integer/flag field |
| `iApprovalStatus1` | tinyint | NULL |  | Small integer/flag field |
| `dtDue1` | datetime | NULL |  | Date/time field |
| `iApprovalUserID1` | int | NULL |  | Integer field |
| `dtApproval1` | datetime | NULL |  | Date/time field |
| `bLate1` | tinyint | NULL |  |  |
| `bLockDecision1` | tinyint | NULL |  |  |
| `iApprovalStatus2` | tinyint | NULL |  | Small integer/flag field |
| `dtDue2` | datetime | NULL |  | Date/time field |
| `dtApproval2` | datetime | NULL |  | Date/time field |
| `bLate2` | tinyint | NULL |  |  |
| `bLockDecision2` | tinyint | NULL |  |  |
| `iApprovalUserID2` | int | NULL |  | Integer field |
| `ApprovalNotes` | varchar(max) | NULL |  |  |
| `iRiskObjTime` | tinyint | NULL |  | Small integer/flag field |
| `iL1RiskAmount25` | tinyint | NULL |  | Small integer/flag field |
| `iL1RiskAmount50` | tinyint | NULL |  | Small integer/flag field |
| `iL1Amount100` | tinyint | NULL |  | Small integer/flag field |
| `iL1Unsolicited` | tinyint | NULL |  | Small integer/flag field |
| `iL1ExemptSecurity` | tinyint | NULL |  | Small integer/flag field |
| `iLeveragedOpen` | tinyint | NULL |  | Small integer/flag field |
| `iL1Initial` | tinyint | NULL |  | Small integer/flag field |
| `iL1POAAP` | tinyint | NULL |  | Small integer/flag field |
| `iL2RiskAmount50` | tinyint | NULL |  | Small integer/flag field |
| `iL2RiskAmount100` | tinyint | NULL |  | Small integer/flag field |
| `iL2ExemptSecurity50` | tinyint | NULL |  | Small integer/flag field |
| `iL2Amount500` | tinyint | NULL |  | Small integer/flag field |
| `iPlanLeveraged` | tinyint | NULL |  | Small integer/flag field |
| `iSuitable` | tinyint | NULL |  | Small integer/flag field |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `FundRisk` | char(1) | NULL |  |  |
| `iTrxLeveraged` | tinyint | NULL |  | Small integer/flag field |
| `iRepLicense` | tinyint | NULL |  | Small integer/flag field |
| `iPlanNotApproved` | tinyint | NULL |  | Small integer/flag field |
| `iNonWired` | tinyint | NULL |  | Small integer/flag field |
| `iTrxAmount` | int | NULL |  | Integer field |
| `iGICAccountID` | int | NULL |  | Integer field |
| `iGICTrxID` | int | NULL |  | Integer field |
| `bApprovedWithOutstanding` | tinyint | NULL |  |  |

### `UB_CompTrxApprovalStatusARC`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL |  | Primary key, auto-increment identifier |
| `iTrxID` | int | NULL |  | Integer field |
| `iTrxID2` | int | NULL |  | Integer field |
| `iOrderID` | int | NULL |  | Integer field |
| `iPlanID` | int | NULL |  | FK to UB_Plan table - identifies the investment plan/account |
| `iPlanInfoID` | int | NULL |  | Integer field |
| `iAccountPosID` | int | NULL |  | Integer field |
| `iAccountID` | int | NULL |  | Integer field |
| `iFlag1` | tinyint | NULL |  | Small integer/flag field |
| `iFlag2` | tinyint | NULL |  | Small integer/flag field |
| `iApprovalStatus1` | tinyint | NULL |  | Small integer/flag field |
| `dtDue1` | datetime | NULL |  | Date/time field |
| `iApprovalUserID1` | int | NULL |  | Integer field |
| `dtApproval1` | datetime | NULL |  | Date/time field |
| `bLate1` | tinyint | NULL |  |  |
| `bLockDecision1` | tinyint | NULL |  |  |
| `iApprovalStatus2` | tinyint | NULL |  | Small integer/flag field |
| `dtDue2` | datetime | NULL |  | Date/time field |
| `dtApproval2` | datetime | NULL |  | Date/time field |
| `bLate2` | tinyint | NULL |  |  |
| `bLockDecision2` | tinyint | NULL |  |  |
| `iApprovalUserID2` | int | NULL |  | Integer field |
| `ApprovalNotes` | varchar(max) | NULL |  |  |
| `iRiskObjTime` | tinyint | NULL |  | Small integer/flag field |
| `iL1RiskAmount25` | tinyint | NULL |  | Small integer/flag field |
| `iL1RiskAmount50` | tinyint | NULL |  | Small integer/flag field |
| `iL1Amount100` | tinyint | NULL |  | Small integer/flag field |
| `iL1Unsolicited` | tinyint | NULL |  | Small integer/flag field |
| `iL1ExemptSecurity` | tinyint | NULL |  | Small integer/flag field |
| `iLeveragedOpen` | tinyint | NULL |  | Small integer/flag field |
| `iL1Initial` | tinyint | NULL |  | Small integer/flag field |
| `iL1POAAP` | tinyint | NULL |  | Small integer/flag field |
| `iL2RiskAmount50` | tinyint | NULL |  | Small integer/flag field |
| `iL2RiskAmount100` | tinyint | NULL |  | Small integer/flag field |
| `iL2ExemptSecurity50` | tinyint | NULL |  | Small integer/flag field |
| `iL2Amount500` | tinyint | NULL |  | Small integer/flag field |
| `iPlanLeveraged` | tinyint | NULL |  | Small integer/flag field |
| `iSuitable` | tinyint | NULL |  | Small integer/flag field |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `FundRisk` | char(1) | NULL |  |  |
| `iTrxLeveraged` | tinyint | NULL |  | Small integer/flag field |
| `iRepLicense` | tinyint | NULL |  | Small integer/flag field |
| `iPlanNotApproved` | tinyint | NULL |  | Small integer/flag field |
| `iTrendShortTerm` | tinyint | NULL |  | Small integer/flag field |
| `iTrendShortTermDSC` | tinyint | NULL |  | Small integer/flag field |
| `iTrendRedemptionCharge` | tinyint | NULL |  | Small integer/flag field |
| `iTrendSwitchFee` | tinyint | NULL |  | Small integer/flag field |
| `iTrendSwitchLoad` | tinyint | NULL |  | Small integer/flag field |
| `iNonWired` | tinyint | NULL |  | Small integer/flag field |
| `iTrxAmount` | int | NULL |  | Integer field |
| `iGICAccountID` | int | NULL |  | Integer field |
| `iGICTrxID` | int | NULL |  | Integer field |
| `bApprovedWithOutstanding` | tinyint | NULL |  |  |

### `UB_CompTrxApprovalStatusHistory`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iTrxID` | int | NOT NULL |  | Integer field |
| `iOrderID` | int | NOT NULL |  | Integer field |
| `iCompTrxStatusID` | int | NOT NULL |  | Integer field |
| `iPlanID` | int | NOT NULL |  | FK to UB_Plan table - identifies the investment plan/account |
| `iAccountPosID` | int | NOT NULL |  | Integer field |
| `iApprovalLevel` | tinyint | NULL |  | Small integer/flag field |
| `iApprovalStatus` | tinyint | NULL |  | Small integer/flag field |
| `dtApproval` | datetime | NULL |  | Date/time field |
| `iApprovalUserID` | int | NULL |  | Integer field |
| `dtDue` | datetime | NULL |  | Date/time field |
| `bLate` | tinyint | NULL |  |  |
| `iNoteID` | int | NULL |  | Integer field |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `iGICAccountID` | int | NULL |  | Integer field |
| `iGICTrxID` | int | NULL |  | Integer field |
| `bApprovedWithOutstanding` | tinyint | NULL |  |  |

### `UB_CompTrxTypeARC`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iTrxType` | smallint | NOT NULL |  |  |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `iCreatedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `dtDeleted` | datetime | NULL |  | Date/time field |
| `iDeletedUserID` | int | NULL |  | Integer field |

### `UB_Country`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `Code` | varchar(3) | NOT NULL |  |  |
| `bClosed` | tinyint | NOT NULL |  |  |
| `NameEN` | varchar(80) | NULL |  | English name |
| `NameFR` | varchar(80) | NULL |  | French name |
| `iOrder` | smallint | NULL |  |  |
| `ClosedReasonEN` | varchar(200) | NULL |  |  |
| `ClosedReasonFR` | varchar(200) | NULL |  |  |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `dtLastModified` | datetime | NULL |  | Timestamp when record was last modified |
| `iCreatedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `iLastModifiedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who last modified this record |
| `fWHTRate` | float | NULL |  | Decimal/float value |
| `fWHTRateLumpSum` | float | NULL |  | Decimal/float value |
| `PostCode` | char(2) | NULL |  |  |

### `UB_CRA_RESP_Rec`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iLinkedType` | tinyint | NULL |  | Small integer/flag field |
| `iLinkedID` | int | NULL |  | Integer field |

### `UB_CtrlValues`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `UserID` | int | NOT NULL |  |  |
| `PageID` | varchar(50) | NOT NULL |  |  |
| `CtrlID` | varchar(50) | NOT NULL |  |  |
| `ValueStr` | varchar(50) | NOT NULL |  |  |
| `dtCreated` | datetime | NOT NULL |  | Timestamp when record was created |

### `UB_Currency`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `Code` | varchar(3) | NOT NULL |  |  |
| `Symbol` | varchar(4) | NOT NULL |  |  |
| `NameEN` | varchar(40) | NULL |  | English name |
| `NameFR` | varchar(40) | NULL |  | French name |
| `iOrder` | smallint | NULL |  |  |
| `dtLastExRate` | datetime | NULL |  | Date/time field |
| `fLastExRate` | float | NULL |  | Decimal/float value |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `iCreatedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `dtLastModified` | datetime | NULL |  | Timestamp when record was last modified |
| `iLastModifiedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who last modified this record |

### `UB_CurrencyARC`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL |  | Primary key, auto-increment identifier |
| `Code` | varchar(3) | NOT NULL |  |  |
| `Symbol` | varchar(4) | NOT NULL |  |  |
| `NameEN` | varchar(40) | NULL |  | English name |
| `NameFR` | varchar(40) | NULL |  | French name |
| `iOrder` | smallint | NULL |  |  |
| `dtLastExRate` | datetime | NULL |  | Date/time field |
| `fLastExRate` | float | NULL |  | Decimal/float value |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `iCreatedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `dtLastModified` | datetime | NULL |  | Timestamp when record was last modified |
| `iLastModifiedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who last modified this record |
| `bDeleted` | tinyint | NULL |  |  |

### `UB_CurrencyExRate`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iCurrencyID` | int | NOT NULL |  | Integer field |
| `dtEffective` | datetime | NOT NULL |  | Effective date |
| `fRate` | float | NOT NULL |  | Decimal/float value |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `iCreatedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `dtLastModified` | datetime | NULL |  | Timestamp when record was last modified |
| `iLastModifiedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who last modified this record |

### `UB_CurrencyExRateARC`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL |  | Primary key, auto-increment identifier |
| `iCurrencyID` | int | NOT NULL |  | Integer field |
| `dtEffective` | datetime | NOT NULL |  | Effective date |
| `fRate` | float | NOT NULL |  | Decimal/float value |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `iCreatedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `dtLastModified` | datetime | NULL |  | Timestamp when record was last modified |
| `iLastModifiedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who last modified this record |
| `bDeleted` | tinyint | NULL |  |  |

### `UB_Customer`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iDealershipID` | int | NOT NULL |  | Integer field |
| `FileID` | varchar(20) | NOT NULL |  |  |
| `SIN_BN` | varchar(15) | NOT NULL |  | Social Insurance Number or Business Number (Canada) |
| `iStatus` | tinyint | NOT NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `FirstName` | varchar(40) | NOT NULL |  | First name |
| `LastName` | varchar(80) | NOT NULL |  | Last name |
| `MainPhone` | varchar(15) | NULL |  | Primary phone number |
| `Title` | char(1) | NOT NULL |  |  |
| `Sex` | char(1) | NULL |  | Gender (M/F) |
| `Language` | char(1) | NOT NULL |  |  |
| `dtDOB` | datetime | NULL |  | Date of birth |
| `Salutation` | varchar(50) | NULL |  |  |
| `iMaritalStatus` | tinyint | NULL |  | Small integer/flag field |
| `iDependants` | tinyint | NULL |  | Small integer/flag field |
| `ContactPosition` | varchar(50) | NULL |  |  |
| `ProvincialBN` | varchar(15) | NULL |  |  |
| `Website` | varchar(100) | NULL |  |  |
| `iSpouseID` | int | NULL |  | Integer field |
| `dtLastTrade` | datetime | NULL |  | Date/time field |
| `dtCreated` | datetime | NOT NULL |  | Timestamp when record was created |
| `dtLastModified` | datetime | NOT NULL |  | Timestamp when record was last modified |
| `iCreatedUserID` | int | NOT NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `iLastModifiedUserID` | int | NOT NULL |  | FK to UB_MemberLogin - internal user who last modified this record |
| `iModifiedMethod` | tinyint | NULL |  | Small integer/flag field |
| `iAddressID` | int | NULL |  | Integer field |
| `iAddressMailID` | int | NULL |  | Integer field |
| `iAddressFlag` | tinyint | NULL |  | Small integer/flag field |
| `iPhoneID` | int | NULL |  | Integer field |
| `iExtraInfoID` | int | NULL |  | Integer field |
| `iEmploymentID` | int | NULL |  | Integer field |
| `iFinInfoID` | int | NULL |  | Integer field |
| `iIncompleteKYC` | tinyint | NULL |  | Small integer/flag field |
| `iIncompleteQuestion` | tinyint | NULL |  | Small integer/flag field |
| `iMemberID` | int | NULL |  | FK to UB_Member - identifies the member/advisor |
| `bEmail` | tinyint | NULL |  |  |
| `iWFID` | int | NOT NULL |  | Integer field |
| `CorpBusinessType` | varchar(100) | NULL |  |  |
| `iCorpType` | tinyint | NULL |  | Small integer/flag field |
| `dtDeceased` | datetime | NULL |  | Date/time field |
| `RepCodeDef` | varchar(8) | NULL |  | Representative/advisor code |
| `iFlag` | tinyint | NULL |  | Small integer/flag field |
| `iMainPhoneOpt` | tinyint | NULL |  | Small integer/flag field |

### `UB_CustomerAddress`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `Type` | smallint | NOT NULL |  |  |
| `LinkedID` | int | NOT NULL |  |  |
| `Line1` | varchar(80) | NULL |  |  |
| `Line2` | varchar(80) | NULL |  |  |
| `Line3` | varchar(80) | NULL |  |  |
| `City` | varchar(50) | NULL |  |  |
| `ProvinceCode` | varchar(3) | NULL |  |  |
| `CountryCode` | varchar(3) | NULL |  |  |
| `PostalCode` | varchar(12) | NULL |  |  |
| `bDefault` | tinyint | NOT NULL |  |  |
| `bMailing` | tinyint | NOT NULL |  |  |
| `bPOBOX` | tinyint | NULL |  |  |
| `iCreatedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `iLastModifiedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who last modified this record |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `dtLastModified` | datetime | NULL |  | Timestamp when record was last modified |

### `UB_CustomerAddressLog`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iClientID` | int | NOT NULL |  | FK to UB_Client table - identifies the client/investor |
| `iDay` | int | NULL |  | Integer field |
| `iType` | tinyint | NULL |  | Type/category code |
| `ValueOld` | varchar(300) | NULL |  |  |
| `ValueNew` | varchar(300) | NULL |  |  |
| `iUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `UserID` | varchar(100) | NULL |  |  |
| `UserName` | varchar(100) | NULL |  |  |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `iCount` | tinyint | NULL |  | Small integer/flag field |
| `iUserType` | tinyint | NULL |  | Small integer/flag field |
| `iFlag` | int | NULL |  | Integer field |

### `UB_CustomerAddressLogX`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `iCustomerAddressLogID` | int | NOT NULL |  | Integer field |
| `RepAddress` | varchar(300) | NULL |  |  |

### `UB_CustomerAddressRequest`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iClientID` | int | NULL |  | FK to UB_Client table - identifies the client/investor |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `iStatus` | tinyint | NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `dtApproved` | datetime | NULL |  | Date/time field |
| `iApprovedUserID` | int | NULL |  | Integer field |
| `Line1` | varchar(80) | NULL |  |  |
| `Line2` | varchar(80) | NULL |  |  |
| `Line3` | varchar(80) | NULL |  |  |
| `City` | varchar(50) | NULL |  |  |
| `ProvinceCode` | varchar(3) | NULL |  |  |
| `CountryCode` | varchar(3) | NULL |  |  |
| `PostalCode` | varchar(15) | NULL |  |  |
| `iCreatedClientID` | int | NULL |  | Integer field |
| `dtLastModified` | datetime | NULL |  | Timestamp when record was last modified |
| `iLastModifiedClientID` | int | NULL |  | Integer field |
| `bMailing` | tinyint | NULL |  |  |

### `UB_CustomerAddressRequestX`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `iRequestID` | int | NULL |  | Integer field |
| `iType` | tinyint | NULL |  | Type/category code |
| `Line1` | varchar(80) | NULL |  |  |
| `Line2` | varchar(80) | NULL |  |  |
| `Line3` | varchar(80) | NULL |  |  |
| `City` | varchar(50) | NULL |  |  |
| `ProvinceCode` | varchar(3) | NULL |  |  |
| `CountryCode` | varchar(3) | NULL |  |  |
| `PostalCode` | varchar(15) | NULL |  |  |

### `UB_CustomerAddressSupplier`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iClientID` | int | NULL |  | FK to UB_Client table - identifies the client/investor |
| `iFileID` | int | NULL |  | FK to file record (FundServ file) |
| `MgmtCode` | varchar(5) | NULL |  | Management company code |
| `iType` | tinyint | NULL |  | Type/category code |
| `Line1` | varchar(80) | NULL |  |  |
| `Line2` | varchar(80) | NULL |  |  |
| `Line3` | varchar(80) | NULL |  |  |
| `City` | varchar(50) | NULL |  |  |
| `ProvinceCode` | varchar(3) | NULL |  |  |
| `CountryCode` | varchar(3) | NULL |  |  |
| `PostalCode` | varchar(15) | NULL |  |  |
| `iNFU` | tinyint | NULL |  | Small integer/flag field |

### `UB_CustomerAssetLiquid`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iClientID` | int | NULL |  | FK to UB_Client table - identifies the client/investor |
| `iDefID` | int | NULL |  | Integer field |
| `DefDescription` | varchar(100) | NULL |  |  |
| `mMKV` | money | NULL |  |  |

### `UB_CustomerAssetOther`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iClientID` | int | NULL |  | FK to UB_Client table - identifies the client/investor |
| `iDefID` | int | NULL |  | Integer field |
| `DefDescription` | varchar(100) | NULL |  |  |
| `mMKV` | money | NULL |  |  |

### `UB_CustomerBankAccount`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iClientID` | int | NOT NULL |  | FK to UB_Client table - identifies the client/investor |
| `iType` | smallint | NOT NULL |  | Type/category code |
| `LinkedID` | int | NOT NULL |  |  |
| `iBankID` | int | NOT NULL |  | Integer field |
| `iBranchID` | int | NOT NULL |  | Integer field |
| `AccountType` | char(1) | NOT NULL |  |  |
| `AccountNumber` | varchar(40) | NOT NULL |  |  |
| `CurrencyID` | char(2) | NOT NULL |  |  |
| `iStatus` | smallint | NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `FirstName` | varchar(40) | NULL |  | First name |
| `LastName` | varchar(40) | NULL |  | Last name |
| `ContactName` | varchar(50) | NULL |  |  |
| `ContactPhone` | varchar(15) | NULL |  |  |
| `ContactPhoneExt` | varchar(8) | NULL |  |  |
| `bDefault` | tinyint | NOT NULL |  |  |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `dtLastModified` | datetime | NULL |  | Timestamp when record was last modified |
| `iCreatedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `iLastModifiedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who last modified this record |
| `Notes` | varchar(max) | NULL |  |  |
| `BankCode` | varchar(5) | NULL |  |  |
| `TransitNumber` | varchar(10) | NULL |  |  |
| `bJoint` | tinyint | NULL |  |  |
| `bPAC` | tinyint | NULL |  |  |
| `bSWP` | tinyint | NULL |  |  |
| `bRRIF` | tinyint | NULL |  |  |
| `bFee` | tinyint | NULL |  |  |

### `UB_CustomerBirthDay`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `iClientID` | int | NOT NULL |  | FK to UB_Client table - identifies the client/investor |
| `iMonth` | smallint | NULL |  |  |
| `iDay` | smallint | NULL |  |  |
| `iYear` | smallint | NULL |  |  |

### `UB_CustomerCompanyInfo`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `LinkedID` | int | NULL |  |  |
| `FirstName` | varchar(50) | NULL |  | First name |
| `LastName` | varchar(50) | NULL |  | Last name |
| `iRole` | smallint | NULL |  |  |
| `fOwnership` | float | NULL |  | Decimal/float value |
| `SINNumber` | varchar(9) | NULL |  |  |
| `Occupation` | varchar(50) | NULL |  |  |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `dtLastModified` | datetime | NULL |  | Timestamp when record was last modified |
| `iCreatedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `iLastModifiedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who last modified this record |
| `Address` | varchar(255) | NULL |  |  |
| `iSignature` | tinyint | NULL |  | Small integer/flag field |

### `UB_CustomerCreateDate`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `iClientID` | int | NOT NULL |  | FK to UB_Client table - identifies the client/investor |
| `iDays` | int | NULL |  | Integer field |

### `UB_CustomerExtraInfo`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `LinkedID` | int | NOT NULL |  |  |
| `iReferralAuth` | tinyint | NULL |  | Small integer/flag field |
| `iLTA` | tinyint | NULL |  | Small integer/flag field |
| `dtLTADate` | datetime | NULL |  | Date/time field |
| `iPOA` | tinyint | NULL |  | Small integer/flag field |
| `dtPOADate` | datetime | NULL |  | Date/time field |
| `iEstateFlag` | tinyint | NULL |  | Small integer/flag field |
| `dtReviewDate` | datetime | NULL |  | Date/time field |
| `dtLastPortfolioReviewDate` | datetime | NULL |  | Date/time field |
| `iPrivacyFlag` | smallint | NULL |  |  |
| `iDonotCallList` | tinyint | NULL |  | Small integer/flag field |
| `iDonotCallListDlr` | tinyint | NULL |  | Small integer/flag field |
| `AccountantName` | varchar(80) | NULL |  |  |
| `LawyerName` | varchar(80) | NULL |  |  |
| `iLockClientInfo` | tinyint | NULL |  | Small integer/flag field |
| `iLockSpouseInfo` | tinyint | NULL |  | Small integer/flag field |
| `iLockBankingInfo` | tinyint | NULL |  | Small integer/flag field |
| `iLockFinancialInfo` | tinyint | NULL |  | Small integer/flag field |
| `iStatementDeliveryMethod` | smallint | NULL |  |  |
| `StatementDeliveryNote` | varchar(80) | NULL |  |  |
| `iReturnMail` | tinyint | NULL |  | Small integer/flag field |
| `TaxCode` | varchar(6) | NULL |  |  |
| `Citizenship` | varchar(50) | NULL |  |  |
| `GeneralNote` | varchar(max) | NULL |  |  |
| `iClientFreezed` | tinyint | NULL |  | Small integer/flag field |
| `iClientRating` | smallint | NULL |  |  |
| `dtReturnMail` | datetime | NULL |  | Date/time field |
| `iFATCA` | tinyint | NULL |  | Small integer/flag field |
| `iMobilityEx` | tinyint | NULL |  | Small integer/flag field |
| `bNFUFATCA` | tinyint | NULL |  |  |
| `iTransferred` | tinyint | NULL |  | Small integer/flag field |
| `dtTransferred` | datetime | NULL |  | Date/time field |
| `dtLastKYCOnFile` | datetime | NULL |  | Date/time field |
| `iReturnEmail` | tinyint | NULL |  | Small integer/flag field |
| `dtReturnEmail` | datetime | NULL |  | Date/time field |
| `iInvestLimit` | int | NULL |  | Integer field |
| `dtStatementDeliveryMethod` | datetime | NULL |  | Date/time field |
| `iStatementDeliveryMethodUserID` | int | NULL |  | Integer field |
| `iStatementDeliveryMethodUserType` | tinyint | NULL |  | Small integer/flag field |
| `iFreeUnitForm` | tinyint | NULL |  | Small integer/flag field |
| `dtFreeUnitFormSig` | datetime | NULL |  | Date/time field |
| `dtFreeUnitFormSigExpiry` | datetime | NULL |  | Date/time field |
| `iRCFlag` | tinyint | NULL |  | Small integer/flag field |
| `iStatementFrequency` | tinyint | NULL |  | Small integer/flag field |
| `iMultipleTaxJur` | tinyint | NULL |  | Small integer/flag field |
| `iRepRelationshipSource` | smallint | NULL |  |  |
| `RepRelationshipSource` | varchar(50) | NULL |  |  |
| `iRepRelationshipLength` | tinyint | NULL |  | Small integer/flag field |
| `iDocDeliveryMethod` | tinyint | NULL |  | Small integer/flag field |
| `dtDocDeliveryMethod` | datetime | NULL |  | Date/time field |
| `iDocDeliveryMethodUserID` | int | NULL |  | Integer field |
| `iDocDeliveryMethodUserType` | tinyint | NULL |  | Small integer/flag field |
| `iDualOccupancyNotice` | tinyint | NULL |  | Small integer/flag field |
| `iEFTConsent` | tinyint | NULL |  | Small integer/flag field |
| `dtEFTConsent` | datetime | NULL |  | Date/time field |
| `iJointStatementOpt` | tinyint | NULL |  | Small integer/flag field |
| `iAMLRiskRanking` | tinyint | NULL |  | Small integer/flag field |
| `iTCPStatus` | tinyint | NULL |  | Small integer/flag field |
| `eSignAccessCode` | varchar(50) | NULL |  |  |
| `ieSign2FAOpt` | tinyint | NULL |  | Small integer/flag field |
| `iTaxResidence` | tinyint | NULL |  | Small integer/flag field |

### `UB_CustomerFavoriteList`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `UserID` | int | NOT NULL |  |  |
| `ClientID` | int | NOT NULL |  |  |
| `dtDate` | datetime | NOT NULL |  | Date/time field |

### `UB_CustomerFinInfo`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `LinkedID` | int | NULL |  |  |
| `iAnnualIncome` | smallint | NULL |  |  |
| `bAnnualIncomeIncSP` | tinyint | NULL |  |  |
| `iInvestmentValue` | smallint | NULL |  |  |
| `iNetworth` | smallint | NULL |  |  |
| `bNetworthIncSP` | tinyint | NULL |  |  |
| `iInvestmentKnowledge` | smallint | NULL |  |  |
| `iInvestmentExpMF` | tinyint | NULL |  | Small integer/flag field |
| `iInvestmentExpST` | tinyint | NULL |  | Small integer/flag field |
| `iInvestmentExpGIC` | tinyint | NULL |  | Small integer/flag field |
| `iInvestmentExpBo` | tinyint | NULL |  | Small integer/flag field |
| `iInvestmentExpMo` | tinyint | NULL |  | Small integer/flag field |
| `iInvestmentExpRE` | tinyint | NULL |  | Small integer/flag field |
| `mLiquidityAsset` | money | NULL |  |  |
| `mFixedAsset` | money | NULL |  |  |
| `mLiability` | money | NULL |  |  |
| `mInvestment` | money | NULL |  |  |
| `mRRSP` | money | NULL |  |  |
| `mMortgage` | money | NULL |  |  |
| `mLoan` | money | NULL |  |  |
| `iAML` | tinyint | NULL |  | Small integer/flag field |
| `iPEFP` | tinyint | NULL |  | Small integer/flag field |
| `iInvestmentExpETF` | tinyint | NULL |  | Small integer/flag field |
| `iInvestmentExpExP` | tinyint | NULL |  | Small integer/flag field |
| `iInvestmentExpOpt` | tinyint | NULL |  | Small integer/flag field |
| `iInvestmentExpNone` | tinyint | NULL |  | Small integer/flag field |
| `mAmountMF` | money | NULL |  | Monetary amount |
| `mAmountGIC` | money | NULL |  | Monetary amount |
| `mAmountStock` | money | NULL |  | Monetary amount |
| `mAmountBond` | money | NULL |  | Monetary amount |
| `mAmountMortgage` | money | NULL |  | Monetary amount |
| `mAmountETF` | money | NULL |  | Monetary amount |
| `mAmountExempt` | money | NULL |  | Monetary amount |
| `mAmountOption` | money | NULL |  | Monetary amount |
| `mAmountEstate` | money | NULL |  | Monetary amount |
| `mAnnualIncome` | money | NULL |  |  |
| `mTFSA` | money | NULL |  |  |
| `mLiabilityFinancial` | money | NULL |  |  |
| `mExemptAsset` | money | NULL |  |  |

### `UB_CustomerLiability`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iClientID` | int | NULL |  | FK to UB_Client table - identifies the client/investor |
| `iDefID` | int | NULL |  | Integer field |
| `DefDescription` | varchar(100) | NULL |  |  |
| `mBalance` | money | NULL |  |  |
| `mPayment` | money | NULL |  |  |

### `UB_CustomerLogin`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iClientID` | int | NOT NULL |  | FK to UB_Client table - identifies the client/investor |
| `LoginID` | varchar(50) | NOT NULL |  | Login username |
| `EncPW` | varchar(100) | NULL |  | Encrypted/hashed password |
| `iStatus` | tinyint | NOT NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `iPWStatus` | tinyint | NOT NULL |  | Password status code |
| `iMaxLoginAllow` | tinyint | NOT NULL |  | Maximum allowed login attempts before lockout |
| `iTryCount` | tinyint | NOT NULL |  | Current failed login attempt count |
| `dtCreated` | datetime | NOT NULL |  | Timestamp when record was created |
| `iCreatedUserID` | int | NOT NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `dtLastModified` | datetime | NOT NULL |  | Timestamp when record was last modified |
| `iLastModifiedUserID` | int | NOT NULL |  | FK to UB_MemberLogin - internal user who last modified this record |
| `dtLastLoginOK` | datetime | NULL |  | Last successful login timestamp |
| `dtLastLoginTry` | datetime | NULL |  | Last login attempt timestamp |
| `dtLastPW` | datetime | NULL |  | Last password change timestamp |
| `dtEffective` | datetime | NULL |  | Effective date |
| `WFPassword` | varchar(100) | NULL |  | Encrypted/hashed password |
| `bMobile` | tinyint | NULL |  |  |
| `bQuickAccess` | tinyint | NULL |  |  |
| `LastToken` | varchar(200) | NULL |  |  |
| `bTokenStatus` | tinyint | NULL |  |  |
| `i2FactorOpt` | tinyint | NULL |  |  |
| `LastIP` | varchar(50) | NULL |  |  |
| `VerificationCode` | varchar(15) | NULL |  |  |
| `dtVCCreated` | datetime | NULL |  | Date/time field |
| `iRestrictFlag` | int | NULL |  | Integer field |

### `UB_CustomerLoginHistory`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `SessionID` | varchar(50) | NOT NULL |  |  |
| `iClientID` | int | NOT NULL |  | FK to UB_Client table - identifies the client/investor |
| `iLoginID` | int | NOT NULL |  | Integer field |
| `dtLogin` | datetime | NOT NULL |  | Date/time field |
| `dtLogout` | datetime | NULL |  | Date/time field |
| `bExpired` | tinyint | NULL |  |  |
| `iType` | tinyint | NULL |  | Type/category code |
| `DeviceInfo` | varchar(200) | NULL |  |  |
| `ClientIP` | varchar(50) | NULL |  |  |

### `UB_CustomerLoginOther`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `iAppID` | tinyint | NOT NULL |  | Small integer/flag field |
| `iClientID` | int | NOT NULL |  | FK to UB_Client table - identifies the client/investor |
| `UserID` | varchar(50) | NOT NULL |  |  |
| `UserPW` | varchar(100) | NOT NULL |  |  |
| `dtCreate` | datetime | NULL |  | Date/time field |
| `dtLastModified` | datetime | NULL |  | Timestamp when record was last modified |

### `UB_CustomerMFDA`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `iClientID` | int | NOT NULL |  | FK to UB_Client table - identifies the client/investor |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `iUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |

### `UB_CustomerName`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `Customer_ID` | int | NOT NULL |  |  |
| `CusName` | varchar(100) | NOT NULL |  |  |

### `UB_CustomerOBA`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iClientID` | int | NULL |  | FK to UB_Client table - identifies the client/investor |
| `iStatus` | tinyint | NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `iDefID` | int | NULL |  | Integer field |
| `DefDescription` | varchar(200) | NULL |  |  |

### `UB_CustomerPlan`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iClientID` | int | NOT NULL |  | FK to UB_Client table - identifies the client/investor |
| `iPlanID` | int | NOT NULL |  | FK to UB_Plan table - identifies the investment plan/account |
| `Status` | char(1) | NULL |  |  |
| `bPrimary` | tinyint | NOT NULL |  |  |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `dtLastModified` | datetime | NULL |  | Timestamp when record was last modified |
| `iCreatedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `iLastModifiedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who last modified this record |

### `UB_CustomerPlanDeleted`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `iClientID` | int | NOT NULL |  | FK to UB_Client table - identifies the client/investor |
| `iPlanID` | int | NOT NULL |  | FK to UB_Plan table - identifies the investment plan/account |
| `iRepID` | int | NULL |  | FK to UB_Rep - identifies the representative/advisor |

### `UB_CustomerPlanTMP`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iCustomerPlanID` | int | NOT NULL |  | Integer field |
| `iMainClientID` | int | NOT NULL |  | Integer field |
| `iClientID` | int | NOT NULL |  | FK to UB_Client table - identifies the client/investor |
| `iPlanID` | int | NOT NULL |  | FK to UB_Plan table - identifies the investment plan/account |
| `bPrimary` | tinyint | NOT NULL |  |  |
| `Status` | char(1) | NULL |  |  |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `dtLastModified` | datetime | NULL |  | Timestamp when record was last modified |
| `iCreatedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `iLastModifiedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who last modified this record |
| `SessionID` | varchar(50) | NULL |  |  |

### `UB_CustomerPWHis`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `iClientID` | int | NOT NULL |  | FK to UB_Client table - identifies the client/investor |
| `EncPW` | varchar(200) | NOT NULL |  | Encrypted/hashed password |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |

### `UB_CustomerQuestionair`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `QuestionID` | int | NOT NULL |  |  |
| `iAnswer` | tinyint | NOT NULL |  | Small integer/flag field |
| `Answer` | varchar(100) | NULL |  |  |
| `LinkedID` | int | NULL |  |  |

### `UB_CustomerQuestionairTMP`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `SessionID` | varchar(50) | NOT NULL |  |  |
| `QuestionID` | int | NOT NULL |  |  |
| `iAnswer` | tinyint | NOT NULL |  | Small integer/flag field |
| `Answer` | varchar(100) | NULL |  |  |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `iCreatedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `LinkedID` | int | NULL |  |  |

### `UB_CustomerQuestionairX`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iClientID` | int | NULL |  | FK to UB_Client table - identifies the client/investor |
| `iQuestionID` | int | NULL |  | Integer field |
| `iAnswerValue` | tinyint | NULL |  | Small integer/flag field |

### `UB_CustomerRep`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iClientID` | int | NOT NULL |  | FK to UB_Client table - identifies the client/investor |
| `iRepID` | int | NOT NULL |  | FK to UB_Rep - identifies the representative/advisor |
| `DealerCode` | varchar(5) | NOT NULL |  | Dealer code identifier |
| `RepCode` | varchar(8) | NULL |  | Representative/advisor code |
| `iPlanCount` | smallint | NOT NULL |  |  |

### `UB_CustomerReviewDate`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `iClientID` | int | NOT NULL |  | FK to UB_Client table - identifies the client/investor |
| `iDays` | int | NULL |  | Integer field |

### `UB_CustomerSpouse`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iClientID` | int | NOT NULL |  | FK to UB_Client table - identifies the client/investor |
| `FileID` | varchar(20) | NOT NULL |  |  |
| `SIN_BN` | varchar(15) | NOT NULL |  | Social Insurance Number or Business Number (Canada) |
| `iStatus` | tinyint | NOT NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `FirstName` | varchar(40) | NOT NULL |  | First name |
| `LastName` | varchar(80) | NULL |  | Last name |
| `Title` | char(1) | NOT NULL |  |  |
| `Sex` | char(1) | NULL |  | Gender (M/F) |
| `Language` | char(1) | NOT NULL |  |  |
| `dtDOB` | datetime | NULL |  | Date of birth |
| `Salutation` | varchar(50) | NULL |  |  |
| `ContactPosition` | varchar(50) | NULL |  |  |
| `dtCreated` | datetime | NOT NULL |  | Timestamp when record was created |
| `dtLastModified` | datetime | NOT NULL |  | Timestamp when record was last modified |
| `iCreatedUserID` | int | NOT NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `iLastModifiedUserID` | int | NOT NULL |  | FK to UB_MemberLogin - internal user who last modified this record |
| `iModifiedMethod` | tinyint | NULL |  | Small integer/flag field |
| `iAddressID` | int | NULL |  | Integer field |
| `iPhoneID` | int | NULL |  | Integer field |
| `dtDeactivation` | datetime | NULL |  | Date/time field |
| `Occupation` | varchar(80) | NULL |  |  |
| `EmployerName` | varchar(80) | NULL |  |  |
| `iEmployerAddressID` | int | NULL |  | Integer field |
| `iEmploymentYear` | tinyint | NULL |  | Small integer/flag field |
| `iMainClientID` | int | NOT NULL |  | Integer field |

### `UB_CustomerTaxCode`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iClientID` | int | NOT NULL |  | FK to UB_Client table - identifies the client/investor |
| `iTaxYear` | int | NOT NULL |  | Integer field |
| `TaxCode` | char(3) | NULL |  |  |

### `UB_CustomerTest`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `iClientID` | int | NOT NULL |  | FK to UB_Client table - identifies the client/investor |

### `UB_CustomerUserDef`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `LinkedID` | int | NOT NULL |  |  |
| `iFieldID` | int | NOT NULL |  | Integer field |
| `FieldContent` | varchar(200) | NULL |  |  |

### `UB_CustomerUserDefTMP`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `LinkedID` | int | NOT NULL |  |  |
| `SessionID` | varchar(50) | NOT NULL |  |  |
| `iFieldID` | int | NOT NULL |  | Integer field |
| `FieldContent` | varchar(200) | NULL |  |  |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `iCreatedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |

### `UB_DashBoardAssetAccount`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iDashBoardAssetID` | int | NULL |  | Integer field |
| `iPlanID` | int | NULL |  | FK to UB_Plan table - identifies the investment plan/account |
| `iAccountID` | int | NULL |  | Integer field |
| `iAccountType` | tinyint | NULL |  | Small integer/flag field |
| `mNetInvested` | money | NULL |  |  |
| `mGainLoss` | money | NULL |  |  |
| `mBookValue` | money | NULL |  |  |
| `mMKV` | money | NULL |  |  |
| `mMKVStart` | money | NULL |  |  |
| `MgmtCode` | varchar(5) | NULL |  | Management company code |
| `ProductType` | char(1) | NULL |  |  |
| `CurrencyCode` | char(2) | NULL |  |  |
| `fUnits` | float | NULL |  | Decimal/float value |
| `fPrice` | float | NULL |  | Unit price of fund |
| `mMKVOrg` | money | NULL |  |  |

### `UB_DashBoardAssetAccountSum`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iDashBoardAssetID` | int | NULL |  | Integer field |
| `iRepID` | int | NULL |  | FK to UB_Rep - identifies the representative/advisor |
| `ProductType` | char(1) | NULL |  |  |
| `mBookValue` | money | NULL |  |  |
| `mMKV` | money | NULL |  |  |

### `UB_DashBoardAssetMain`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `dtReportAsOf` | datetime | NULL |  | Date/time field |
| `iStatus` | tinyint | NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `dtRequest` | datetime | NULL |  | Date/time field |
| `dtComplete` | datetime | NULL |  | Date/time field |
| `bIncludeCash` | tinyint | NULL |  |  |
| `bIncludeGIC` | tinyint | NULL |  |  |
| `bIncludeExempt` | tinyint | NULL |  |  |
| `iTrxDateOpt` | tinyint | NULL |  | Small integer/flag field |
| `dtTrxFrom` | datetime | NULL |  | Date/time field |
| `dtStartRun` | datetime | NULL |  | Date/time field |
| `iLinkedID` | int | NULL |  | Integer field |
| `Notes` | varchar(50) | NULL |  |  |
| `fUSDXRate` | float | NULL |  | Decimal/float value |

### `UB_DashBoardAssetPlan`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iDashBoardAssetID` | int | NULL |  | Integer field |
| `iPlanID` | int | NULL |  | FK to UB_Plan table - identifies the investment plan/account |
| `mMKV` | money | NULL |  |  |
| `iStatus` | tinyint | NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `mNetInvested` | money | NULL |  |  |
| `mGainLoss` | money | NULL |  |  |
| `mBookValue` | money | NULL |  |  |
| `mMKVStart` | money | NULL |  |  |
| `ProvinceCode` | varchar(3) | NULL |  |  |
| `DealerCode` | varchar(5) | NULL |  | Dealer code identifier |
| `RepCode` | varchar(5) | NULL |  | Representative/advisor code |

### `UB_DashBoardAssetPlanSum`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iDashBoardAssetID` | int | NULL |  | Integer field |
| `iRepID` | int | NULL |  | FK to UB_Rep - identifies the representative/advisor |
| `PlanType` | char(2) | NULL |  |  |
| `AccountDesignation` | char(1) | NULL |  |  |
| `mMKV` | money | NULL |  |  |

### `UB_DashBoardAssetRep`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iDashBoardAssetID` | int | NULL |  | Integer field |
| `iRepID` | int | NULL |  | FK to UB_Rep - identifies the representative/advisor |

### `UB_DD`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `TableName` | varchar(50) | NOT NULL |  |  |
| `FieldName` | varchar(50) | NOT NULL |  | Field name reference |
| `FieldValue` | varchar(20) | NOT NULL |  |  |
| `Decription` | varchar(200) | NULL |  |  |

### `UB_Disclaimer`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iReportTypeID` | int | NULL |  | Integer field |
| `iReportHO` | tinyint | NULL |  | Small integer/flag field |
| `iCategory` | tinyint | NULL |  | Small integer/flag field |
| `iStatus` | tinyint | NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `iTargetRestriction` | tinyint | NULL |  | Small integer/flag field |
| `iDealerSpecific` | tinyint | NULL |  | Small integer/flag field |
| `DescriptionEN` | varchar(80) | NULL |  |  |
| `DescriptionFR` | varchar(80) | NULL |  |  |
| `ContentEN` | varchar(max) | NULL |  |  |
| `ContentFR` | varchar(max) | NULL |  |  |
| `iFontSize` | tinyint | NULL |  | Small integer/flag field |
| `iTextColor` | int | NULL |  | Integer field |
| `iTextStyle` | int | NULL |  | Integer field |
| `fBorderTop` | float | NULL |  | Decimal/float value |
| `iBorderTopColor` | int | NULL |  | Integer field |
| `fBorderBottom` | float | NULL |  | Decimal/float value |
| `iBorderBottomColor` | int | NULL |  | Integer field |
| `iBkColor` | int | NULL |  | Integer field |
| `iOrder` | int | NULL |  | Integer field |
| `iCreatedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `iLastModifiedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who last modified this record |
| `dtLastModified` | datetime | NULL |  | Timestamp when record was last modified |
| `iHAlign` | tinyint | NULL |  | Small integer/flag field |
| `iMemberGroupID` | tinyint | NULL |  | Small integer/flag field |

### `UB_DisclaimerDealerCode`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `iDisclaimerID` | int | NOT NULL |  | Integer field |
| `DealerCode` | varchar(5) | NOT NULL |  | Dealer code identifier |

### `UB_Document`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `NameEN` | varchar(80) | NULL |  | English name |
| `NameFR` | varchar(80) | NULL |  | French name |
| `iStatus` | tinyint | NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `iType` | tinyint | NULL |  | Type/category code |
| `dtEffective` | datetime | NULL |  | Effective date |
| `dtEnd` | datetime | NULL |  | Date/time field |
| `bPlanRegistrationAll` | tinyint | NULL |  |  |
| `bClientName` | tinyint | NULL |  |  |
| `bBrokerNominee` | tinyint | NULL |  |  |
| `bIntermediary` | tinyint | NULL |  |  |
| `bPlanPropertiesAll` | tinyint | NULL |  |  |
| `PlanPropertyList` | varchar(80) | NULL |  |  |
| `bPlanTypeAll` | tinyint | NULL |  |  |
| `PlanTypeCodes` | varchar(80) | NULL |  |  |
| `MgmtCode` | varchar(6) | NULL |  | Management company code |
| `Notes` | varchar(250) | NULL |  |  |
| `FileName` | varchar(250) | NULL |  | File name |
| `FileData` | varbinary(max) | NULL |  |  |
| `iFileSize` | int | NULL |  | Integer field |
| `FileType` | varchar(80) | NULL |  |  |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `iCreatedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `iLastModifiedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who last modified this record |
| `dtLastModified` | datetime | NULL |  | Timestamp when record was last modified |
| `iWFID` | int | NULL |  | Integer field |

### `UB_DocumentFileLink`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iLinkedType` | tinyint | NULL |  | Small integer/flag field |
| `iSubLinkedType` | tinyint | NULL |  | Small integer/flag field |
| `iLinkedID` | int | NULL |  | Integer field |
| `Description` | varchar(80) | NULL |  |  |
| `iDocumentFileID` | int | NULL |  | Integer field |
| `dtEffective` | datetime | NULL |  | Effective date |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `dtLastModified` | datetime | NULL |  | Timestamp when record was last modified |
| `iCreatedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `iLastModifiedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who last modified this record |
| `iClientID` | int | NULL |  | FK to UB_Client table - identifies the client/investor |
| `iPlanID` | int | NULL |  | FK to UB_Plan table - identifies the investment plan/account |
| `iFundAccPosID` | int | NULL |  | Integer field |
| `iTrxID` | int | NULL |  | Integer field |
| `iWFID` | int | NULL |  | Integer field |
| `iGICAccountID` | int | NULL |  | Integer field |
| `iGICTrxID` | int | NULL |  | Integer field |
| `iPrivate` | tinyint | NULL |  | Small integer/flag field |
| `iType` | smallint | NULL |  | Type/category code |
| `iCashAccountID` | int | NULL |  | Integer field |
| `iCashTrxID` | int | NULL |  | Integer field |
| `iStatus` | tinyint | NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |

### `UB_DocumentFileLog`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `FileName` | varchar(250) | NULL |  | File name |
| `iStatus` | tinyint | NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |

### `UB_EasyServParams`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `SSOCertPath` | varchar(250) | NULL |  |  |
| `SSOTarget` | varchar(250) | NULL |  |  |
| `SSORecipient` | varchar(250) | NULL |  |  |
| `SSOIssuer` | varchar(250) | NULL |  |  |
| `SSONameQualifier` | varchar(250) | NULL |  |  |
| `iSSOCertFileType` | tinyint | NULL |  | Small integer/flag field |
| `iStatus` | tinyint | NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |

### `UB_EFTFile`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iTrustBankAccountID` | int | NULL |  | Integer field |
| `mTotalAmount` | money | NULL |  |  |
| `iStatus` | tinyint | NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `FileName` | varchar(260) | NULL |  | File name |
| `Notes` | varchar(200) | NULL |  |  |
| `iCreatedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `iType` | tinyint | NULL |  | Type/category code |
| `iSequenceNumber` | int | NULL |  | Integer field |
| `dtEffective` | datetime | NULL |  | Effective date |
| `FileData` | varbinary(max) | NULL |  |  |
| `iOption` | tinyint | NULL |  | Small integer/flag field |

### `UB_EFTItem`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iLinkedType` | tinyint | NULL |  | Small integer/flag field |
| `iLinkedID` | int | NULL |  | Integer field |
| `iStatus` | tinyint | NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `dtEffective` | datetime | NULL |  | Effective date |
| `mAmount` | money | NULL |  | Monetary amount |
| `iTrustBankAccountID` | int | NULL |  | Integer field |
| `TrustBankCode` | varchar(5) | NULL |  |  |
| `TrustBankTransit` | varchar(10) | NULL |  |  |
| `TrustBankAccountNumber` | varchar(40) | NULL |  |  |
| `iBankAccountID` | int | NULL |  | Integer field |
| `BankCode` | varchar(5) | NULL |  |  |
| `BankTransit` | varchar(10) | NULL |  |  |
| `BankAccountNumber` | varchar(40) | NULL |  |  |
| `HolderName` | varchar(80) | NULL |  |  |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `iCreatedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `iProcessingID` | int | NULL |  | Integer field |
| `HolderID` | varchar(30) | NULL |  |  |
| `SourceCode` | char(1) | NULL |  |  |
| `Notes` | varchar(80) | NULL |  |  |

### `UB_EFTItem_ARC`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL |  | Primary key, auto-increment identifier |
| `iLinkedType` | tinyint | NULL |  | Small integer/flag field |
| `iLinkedID` | int | NULL |  | Integer field |
| `iStatus` | tinyint | NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `dtEffective` | datetime | NULL |  | Effective date |
| `mAmount` | money | NULL |  | Monetary amount |
| `iTrustBankAccountID` | int | NULL |  | Integer field |
| `TrustBankCode` | varchar(5) | NULL |  |  |
| `TrustBankTransit` | varchar(10) | NULL |  |  |
| `TrustBankAccountNumber` | varchar(40) | NULL |  |  |
| `iBankAccountID` | int | NULL |  | Integer field |
| `BankCode` | varchar(5) | NULL |  |  |
| `BankTransit` | varchar(10) | NULL |  |  |
| `BankAccountNumber` | varchar(40) | NULL |  |  |
| `HolderName` | varchar(80) | NULL |  |  |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `iCreatedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `iProcessingID` | int | NULL |  | Integer field |
| `HolderID` | varchar(30) | NULL |  |  |
| `SourceCode` | char(1) | NULL |  |  |

### `UB_EFTReminderHeader`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iPlanID` | int | NULL |  | FK to UB_Plan table - identifies the investment plan/account |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `iUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |

### `UB_EFTReminderItem`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iHeaderID` | int | NULL |  | FK to parent header record |
| `iTrustTrxID` | int | NULL |  | Integer field |

### `UB_EmailOutBox`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `sFrom` | varchar(100) | NULL |  |  |
| `sFromName` | varchar(100) | NULL |  |  |
| `sTo` | varchar(200) | NULL |  |  |
| `sToName` | varchar(100) | NULL |  |  |
| `sBcc` | varchar(100) | NULL |  |  |
| `sCC` | varchar(100) | NULL |  |  |
| `sSubject` | varchar(100) | NULL |  |  |
| `sBody` | varchar(max) | NULL |  |  |
| `iPriority` | tinyint | NOT NULL |  | Small integer/flag field |
| `iMailFormat` | tinyint | NOT NULL |  | Small integer/flag field |
| `AttachFile` | varchar(255) | NULL |  |  |
| `iStatus` | tinyint | NOT NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `iNotificationID` | int | NOT NULL |  | Integer field |
| `ReplyEmail` | varchar(100) | NOT NULL |  |  |
| `dtEffective` | datetime | NOT NULL |  | Effective date |
| `iDocFileID` | int | NOT NULL |  | Integer field |
| `iFileType` | tinyint | NULL |  | Small integer/flag field |
| `iType` | tinyint | NULL |  | Type/category code |

### `UB_EmailOutBox_ARC`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL |  | Primary key, auto-increment identifier |
| `sFrom` | varchar(100) | NULL |  |  |
| `sFromName` | varchar(100) | NULL |  |  |
| `sTo` | varchar(200) | NULL |  |  |
| `sToName` | varchar(100) | NULL |  |  |
| `sBcc` | varchar(100) | NULL |  |  |
| `sCC` | varchar(100) | NULL |  |  |
| `sSubject` | varchar(100) | NULL |  |  |
| `sBody` | varchar(max) | NULL |  |  |
| `iPriority` | tinyint | NOT NULL |  | Small integer/flag field |
| `iMailFormat` | tinyint | NOT NULL |  | Small integer/flag field |
| `AttachFile` | varchar(255) | NULL |  |  |
| `iStatus` | tinyint | NOT NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `iNotificationID` | int | NOT NULL |  | Integer field |
| `ReplyEmail` | varchar(100) | NOT NULL |  |  |
| `dtEffective` | datetime | NOT NULL |  | Effective date |
| `iDocFileID` | int | NOT NULL |  | Integer field |
| `iFileType` | tinyint | NULL |  | Small integer/flag field |
| `iType` | tinyint | NULL |  | Type/category code |

### `UB_EmailOutBoxAtt`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iEmailOutBoxID` | int | NULL |  | Integer field |
| `AttachFile` | varchar(255) | NULL |  |  |
| `iDocFileID` | int | NULL |  | Integer field |
| `iFileType` | tinyint | NULL |  | Small integer/flag field |
| `iFileSize` | int | NULL |  | Integer field |
| `FileType` | varchar(80) | NULL |  |  |
| `FileData` | varbinary(max) | NULL |  |  |

### `UB_EmailOutBoxAtt_ARC`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL |  | Primary key, auto-increment identifier |
| `iEmailOutBoxID` | int | NULL |  | Integer field |
| `AttachFile` | varchar(255) | NULL |  |  |
| `iDocFileID` | int | NULL |  | Integer field |
| `iFileType` | tinyint | NULL |  | Small integer/flag field |
| `iFileSize` | int | NULL |  | Integer field |
| `FileType` | varchar(80) | NULL |  |  |
| `FileData` | varbinary(max) | NULL |  |  |

### `UB_EmailSent`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL |  | Primary key, auto-increment identifier |
| `sFrom` | varchar(100) | NULL |  |  |
| `sFromName` | varchar(100) | NULL |  |  |
| `sTo` | varchar(100) | NULL |  |  |
| `sToName` | varchar(100) | NULL |  |  |
| `sBcc` | varchar(100) | NULL |  |  |
| `sCC` | varchar(100) | NULL |  |  |
| `sSubject` | varchar(100) | NULL |  |  |
| `sBody` | varchar(max) | NULL |  |  |
| `iPriority` | tinyint | NULL |  | Small integer/flag field |
| `iMailFormat` | tinyint | NULL |  | Small integer/flag field |
| `AttachFile` | varchar(255) | NULL |  |  |
| `iStatus` | tinyint | NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `iNotificationID` | int | NULL |  | Integer field |
| `ReplyEmail` | varchar(100) | NULL |  |  |
| `dtEffective` | datetime | NULL |  | Effective date |
| `iDocFileID` | int | NOT NULL |  | Integer field |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `iFileType` | tinyint | NULL |  | Small integer/flag field |
| `iEmailOutBoxID` | int | NULL |  | Integer field |

### `UB_EmailTask`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | smallint | NOT NULL |  | Primary key, auto-increment identifier |
| `NameEN` | varchar(80) | NULL |  | English name |
| `NameFR` | varchar(80) | NULL |  | French name |
| `iStatus` | tinyint | NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `dtLastRun` | datetime | NULL |  | Date/time field |
| `iEmailStatus` | tinyint | NULL |  | Small integer/flag field |
| `EmailAddress` | varchar(400) | NULL |  |  |
| `dtLastEmailSent` | datetime | NULL |  | Date/time field |
| `Notes` | varchar(100) | NULL |  |  |
| `FromText` | varchar(100) | NULL |  |  |
| `FileName` | varchar(100) | NULL |  | File name |
| `dtFrom` | datetime | NULL |  | Date/time field |
| `dtTo` | datetime | NULL |  | Date/time field |
| `MemberIDStr` | varchar(100) | NULL |  |  |

### `UB_EmailTemplate`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `Name` | varchar(100) | NOT NULL |  |  |
| `Description` | varchar(100) | NULL |  |  |
| `SubjectEN` | varchar(100) | NULL |  |  |
| `SubjectFR` | varchar(100) | NULL |  |  |
| `ContentEN` | varchar(max) | NULL |  |  |
| `ContentFR` | varchar(max) | NULL |  |  |
| `iType` | smallint | NULL |  | Type/category code |
| `iStatus` | tinyint | NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `dtLastModified` | datetime | NULL |  | Timestamp when record was last modified |
| `iUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `iMemberGroupID` | tinyint | NULL |  | Small integer/flag field |

### `UB_Employer`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `Code` | varchar(15) | NOT NULL |  |  |
| `NameEN` | varchar(80) | NULL |  | English name |
| `NameFR` | varchar(80) | NULL |  | French name |
| `Website` | varchar(100) | NULL |  |  |
| `CategoryID` | int | NULL |  |  |

### `UB_Employment`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `LinkedID` | int | NOT NULL |  |  |
| `TypeID` | int | NULL |  |  |
| `Position` | varchar(80) | NULL |  |  |
| `Department` | varchar(40) | NULL |  |  |
| `EmployerID` | int | NULL |  |  |
| `EmployerCode` | varchar(15) | NULL |  |  |
| `EmployerName` | varchar(80) | NULL |  |  |
| `BusinessType` | varchar(80) | NULL |  |  |
| `fYear` | float | NULL |  | Decimal/float value |
| `RetirementDate` | varchar(30) | NULL |  |  |

### `UB_Envelope`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `iCreatedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `dtLastModified` | datetime | NULL |  | Timestamp when record was last modified |
| `iLastModifiedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who last modified this record |
| `dtSent` | datetime | NULL |  | Date/time field |
| `iSentUserID` | int | NULL |  | Integer field |
| `iStatus` | tinyint | NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `dtStatus` | datetime | NULL |  | Date/time field |
| `EnvelopeId` | varchar(300) | NULL |  |  |
| `AccountId` | varchar(300) | NULL |  |  |
| `EmailSubject` | varchar(200) | NULL |  |  |
| `iRecipientType` | tinyint | NULL |  | Small integer/flag field |
| `iLinkedID` | int | NULL |  | Integer field |
| `StatusCode` | varchar(50) | NULL |  |  |
| `iAttachmentStatus` | tinyint | NULL |  | Small integer/flag field |
| `dtVoid` | datetime | NULL |  | Date/time field |
| `VoidReason` | varchar(300) | NULL |  |  |
| `iVoidUserID` | int | NULL |  | Integer field |
| `iNoAuto` | tinyint | NULL |  | Small integer/flag field |
| `iLastCheck` | bigint | NULL |  |  |
| `iESignatureType` | tinyint | NOT NULL |  | Small integer/flag field |
| `bInPerson` | tinyint | NULL |  |  |

### `UB_EnvelopeDoc`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iEnvelopeID` | int | NULL |  | Integer field |
| `iFormID` | int | NULL |  | Integer field |
| `iObjID` | int | NULL |  | Integer field |
| `bClient` | tinyint | NULL |  |  |
| `bClient2` | tinyint | NULL |  |  |
| `bClient3` | tinyint | NULL |  |  |
| `bMember` | tinyint | NULL |  |  |
| `bComp` | tinyint | NULL |  |  |
| `Description` | varchar(250) | NULL |  |  |
| `iFormLg` | tinyint | NULL |  | Small integer/flag field |
| `iCount` | int | NULL |  | Integer field |
| `iAttachmentStatus` | tinyint | NULL |  | Small integer/flag field |
| `iType` | int | NULL |  | Type/category code |
| `ItemListStr` | varchar(max) | NULL |  |  |

### `UB_EnvelopeDocSigPos`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iEnvelopeID` | int | NULL |  | Integer field |
| `iDocID` | int | NULL |  | Integer field |
| `iType` | tinyint | NULL |  | Type/category code |
| `iRecipientID` | int | NULL |  | Integer field |
| `iPage` | int | NULL |  | Integer field |
| `iPosX` | int | NULL |  | Integer field |
| `iPosY` | int | NULL |  | Integer field |
| `iOptional` | tinyint | NULL |  | Small integer/flag field |
| `iStatus` | tinyint | NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `iWidth` | int | NULL |  | Integer field |
| `iHeight` | int | NULL |  | Integer field |

### `UB_EnvelopeRecipient`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iEnvelopeID` | int | NULL |  | Integer field |
| `iRecipientType` | tinyint | NULL |  | Small integer/flag field |
| `iLinkedID` | int | NULL |  | Integer field |
| `LinkedName` | varchar(200) | NULL |  |  |
| `LinkedEmail` | varchar(200) | NULL |  |  |
| `Status` | varchar(50) | NULL |  |  |
| `dtLastModified` | datetime | NULL |  | Timestamp when record was last modified |
| `ESignatureID` | varchar(40) | NULL |  |  |
| `iStatus` | int | NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `CellPhone` | varchar(15) | NULL |  |  |
| `bEditor` | tinyint | NULL |  |  |
| `b2FA` | tinyint | NULL |  |  |

### `UB_EnvelopeStatusHistory`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `iEnvelopeID` | int | NULL |  | Integer field |
| `iStatus` | tinyint | NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `dtStatus` | datetime | NULL |  | Date/time field |

### `UB_ETFPrice`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `Ticker` | varchar(8) | NULL |  |  |
| `dtPriceDate` | date | NULL |  | Date/time field |
| `fClosing` | float | NULL |  | Decimal/float value |
| `fLastBid` | float | NULL |  | Decimal/float value |
| `fLastAsk` | float | NULL |  | Decimal/float value |

### `UB_EventLog`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `EventID` | int | NULL |  |  |
| `EventStatus` | varchar(100) | NULL |  |  |
| `Content` | varchar(max) | NULL |  |  |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `iFileID` | int | NULL |  | FK to file record (FundServ file) |
| `AppID` | varchar(50) | NULL |  |  |

### `UB_ExportRequest`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `DealerCode` | varchar(5) | NULL |  | Dealer code identifier |
| `RepCode` | varchar(6) | NULL |  | Representative/advisor code |
| `iStatus` | tinyint | NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `Lg` | tinyint | NULL |  |  |
| `dtRequest` | datetime | NULL |  | Date/time field |
| `dtCompleted` | datetime | NULL |  | Date/time field |
| `FileName` | varchar(250) | NULL |  | File name |
| `dtDownloaded` | datetime | NULL |  | Date/time field |
| `iUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `iClientInfo` | tinyint | NULL |  | Small integer/flag field |
| `iPlanInfo` | tinyint | NULL |  | Small integer/flag field |
| `iAccountInfo` | tinyint | NULL |  | Small integer/flag field |
| `iTrxInfo` | tinyint | NULL |  | Small integer/flag field |
| `iOptClient` | tinyint | NULL |  | Small integer/flag field |
| `iOptPlan` | tinyint | NULL |  | Small integer/flag field |
| `iOptAccount` | tinyint | NULL |  | Small integer/flag field |
| `iOptTrx` | tinyint | NULL |  | Small integer/flag field |
| `dtFromClient` | datetime | NULL |  | Date/time field |
| `dtFromPlan` | datetime | NULL |  | Date/time field |
| `dtFromAccount` | datetime | NULL |  | Date/time field |
| `dtFromTrx` | datetime | NULL |  | Date/time field |
| `iOptPW` | tinyint | NULL |  | Small integer/flag field |
| `iActiveClientOnly` | tinyint | NULL |  | Small integer/flag field |
| `iActivePlanOnly` | tinyint | NULL |  | Small integer/flag field |
| `iActiveAccountOnly` | tinyint | NULL |  | Small integer/flag field |
| `iConfirmTrxOnly` | tinyint | NULL |  | Small integer/flag field |
| `iExportType` | tinyint | NULL |  | Small integer/flag field |
| `dtEffective` | datetime | NULL |  | Effective date |
| `MgmtCode` | varchar(6) | NULL |  | Management company code |
| `Notes` | varchar(max) | NULL |  |  |
| `FundID` | varchar(6) | NULL |  | Fund identifier code (e.g., DYN 3056) |
| `iTaxYear` | int | NULL |  | Integer field |
| `SubmissionType` | char(1) | NULL |  |  |
| `iSubmissionStatus` | tinyint | NULL |  | Small integer/flag field |
| `SubmissionConfNumber` | varchar(20) | NULL |  |  |
| `dtSubmitted` | datetime | NULL |  | Date/time field |
| `dtLastModified` | datetime | NULL |  | Timestamp when record was last modified |
| `iLastModifiedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who last modified this record |

### `UB_ExportRequestItem`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `iRequestID` | int | NULL |  | Integer field |
| `iItemID` | int | NULL |  | Integer field |

### `UB_FamilyDetail`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iFamilyID` | int | NULL |  | Integer field |
| `iClientID` | int | NULL |  | FK to UB_Client table - identifies the client/investor |
| `iUseName` | tinyint | NULL |  | Small integer/flag field |
| `iCreatedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `iOrder` | int | NULL |  | Integer field |
| `iRestricted` | tinyint | NULL |  | Small integer/flag field |

### `UB_FamilyHeader`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `Code` | varchar(20) | NULL |  |  |
| `Description` | varchar(100) | NULL |  |  |
| `iUseAddressClientID` | int | NULL |  | Integer field |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `iCreatedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `dtLastModified` | datetime | NULL |  | Timestamp when record was last modified |
| `iLastModifiedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who last modified this record |

### `UB_FamilyRelation`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `iClientID1` | int | NOT NULL |  | Integer field |
| `iClientID2` | int | NOT NULL |  | Integer field |
| `iRelationship` | tinyint | NULL |  | Small integer/flag field |

### `UB_FATCA`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iLinkedType` | tinyint | NOT NULL |  | Small integer/flag field |
| `iLinkedID` | int | NOT NULL |  | Integer field |
| `Country` | char(3) | NOT NULL |  |  |
| `Status` | char(1) | NOT NULL |  |  |
| `dtEffective` | datetime | NULL |  | Effective date |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `dtLastModified` | datetime | NULL |  | Timestamp when record was last modified |
| `iCreatedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `iLastModifiedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who last modified this record |
| `LastName` | varchar(40) | NULL |  | Last name |
| `FirstName` | varchar(40) | NULL |  | First name |
| `iAddressID` | int | NULL |  | Integer field |

### `UB_FATCAControllingPerson`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iForeignEntityID` | int | NOT NULL |  | Integer field |
| `ControllingPersonType` | varchar(6) | NULL |  |  |
| `LastName` | varchar(40) | NULL |  | Last name |
| `FirstName` | varchar(40) | NULL |  | First name |
| `dtBirthDate` | datetime | NULL |  | Date/time field |
| `iAddressID` | int | NULL |  | Integer field |
| `iForeignPersonID` | int | NULL |  | Integer field |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `iCreatedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `dtLastModified` | datetime | NULL |  | Timestamp when record was last modified |
| `iLastModifiedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who last modified this record |
| `SINNumber` | varchar(9) | NULL |  |  |

### `UB_FATCAEntity`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iLinkedType` | tinyint | NULL |  | Small integer/flag field |
| `iLinkedID` | int | NULL |  | Integer field |
| `Country` | char(3) | NULL |  |  |
| `EntityType` | char(1) | NULL |  |  |
| `ForeignID` | varchar(15) | NULL |  |  |
| `GIIN` | varchar(20) | NULL |  |  |
| `dtEffective` | datetime | NULL |  | Effective date |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `dtLastModified` | datetime | NULL |  | Timestamp when record was last modified |
| `iCreatedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `iLastModifiedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who last modified this record |
| `ForeignIDType` | char(1) | NULL |  |  |

### `UB_FATCAForeignEntity`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iLinkedID` | int | NULL |  | Integer field |
| `iLinkedType` | tinyint | NULL |  | Small integer/flag field |
| `dtEffective` | datetime | NULL |  | Effective date |
| `GIIN` | varchar(19) | NULL |  |  |
| `iCreatedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `dtLastModified` | datetime | NULL |  | Timestamp when record was last modified |
| `iLastModifiedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who last modified this record |

### `UB_FATCAForeignID`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iFATCAID` | int | NULL |  | Integer field |
| `IDTyp` | char(1) | NULL |  |  |
| `ForeignID` | varchar(15) | NULL |  |  |

### `UB_FATCAForeignPerson`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iLinkedID` | int | NULL |  | Integer field |
| `iLinkedType` | tinyint | NULL |  | Small integer/flag field |
| `dtEffective` | datetime | NULL |  | Effective date |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `iCreatedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `dtLastModified` | datetime | NULL |  | Timestamp when record was last modified |
| `iLastModifiedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who last modified this record |

### `UB_FATCAIndTIN`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iForeignPersonID` | int | NOT NULL |  | Integer field |
| `CountryCode` | char(3) | NOT NULL |  |  |
| `PersonStatus` | char(1) | NOT NULL |  |  |
| `TINType` | varchar(20) | NULL |  |  |
| `TIN` | varchar(30) | NULL |  |  |
| `NoTINReasonCode` | char(1) | NULL |  |  |
| `dtEffective` | datetime | NULL |  | Effective date |
| `NoTINReasonOther` | varchar(80) | NULL |  |  |

### `UB_FATCAOrgTIN`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iForeignEntityID` | int | NOT NULL |  | Integer field |
| `CountryCode` | char(3) | NOT NULL |  |  |
| `TINType` | varchar(20) | NULL |  |  |
| `TIN` | varchar(30) | NULL |  |  |
| `NoTINReasonCode` | char(1) | NULL |  |  |
| `FATCAClassification` | char(1) | NULL |  |  |
| `CRSClassification` | varchar(6) | NULL |  |  |
| `iClassType` | tinyint | NULL |  | Small integer/flag field |
| `dtEffective` | datetime | NULL |  | Effective date |
| `NoTINReasonOther` | varchar(80) | NULL |  |  |
| `iQuestion1` | tinyint | NULL |  | Small integer/flag field |
| `iQuestion2` | tinyint | NULL |  | Small integer/flag field |
| `iQuestion3` | tinyint | NULL |  | Small integer/flag field |
| `iQuestion4` | tinyint | NULL |  | Small integer/flag field |
| `iQuestion5` | tinyint | NULL |  | Small integer/flag field |
| `iQuestion6` | tinyint | NULL |  | Small integer/flag field |

### `UB_FDFile`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `dtUpload` | datetime | NULL |  | Date/time field |
| `FileName` | varchar(255) | NULL |  | File name |
| `Description` | varchar(100) | NULL |  |  |
| `FileData` | varbinary(max) | NULL |  |  |
| `iFileSize` | int | NULL |  | Integer field |
| `FileType` | varchar(80) | NULL |  |  |
| `iStatus` | tinyint | NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `iUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |

### `UB_FDFileDef`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `FieldName` | varchar(100) | NULL |  | Field name reference |
| `SPParamName` | varchar(100) | NULL |  |  |
| `iType` | tinyint | NULL |  | Type/category code |
| `iPos` | smallint | NULL |  |  |

### `UB_FDFileDetail`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iFileID` | int | NOT NULL |  | FK to file record (FundServ file) |
| `EngName` | varchar(80) | NULL |  |  |
| `FreName` | varchar(80) | NULL |  |  |
| `FundServCode` | varchar(8) | NULL |  |  |
| `iCategory` | smallint | NULL |  |  |
| `Category` | varchar(80) | NULL |  |  |
| `Currency` | varchar(3) | NULL |  |  |
| `iRRSPFlg` | tinyint | NULL |  | Small integer/flag field |
| `iForeign` | tinyint | NULL |  | Small integer/flag field |
| `iSegFund` | tinyint | NULL |  | Small integer/flag field |
| `iLSVCC` | tinyint | NULL |  | Small integer/flag field |
| `fDSC` | float | NULL |  | Decimal/float value |
| `fFEL` | float | NULL |  | Decimal/float value |
| `LoadType` | varchar(4) | NULL |  |  |
| `dtPrice` | datetime | NULL |  | Date/time field |
| `fPrice` | float | NULL |  | Unit price of fund |
| `fStandardDeviation` | float | NULL |  | Decimal/float value |
| `iStandardDeviationRank` | int | NULL |  | Integer field |
| `fDownsideDeviation` | float | NULL |  | Decimal/float value |
| `iDownsideDeviationRank` | int | NULL |  | Integer field |
| `iSortinoRank` | int | NULL |  | Integer field |
| `fSortino` | float | NULL |  | Decimal/float value |
| `fTenYearVolatility` | float | NULL |  | Decimal/float value |
| `iProspectusRisk` | smallint | NULL |  |  |
| `dtProspectusRisk` | datetime | NULL |  | Date/time field |
| `Classification` | char(2) | NULL |  |  |
| `ClassificationNameEN` | varchar(80) | NULL |  |  |
| `ClassificationNameFR` | varchar(80) | NULL |  |  |
| `InvestmentObjEN` | varchar(500) | NULL |  |  |
| `InvestmentObjFR` | varchar(500) | NULL |  |  |
| `fExRateUS` | float | NULL |  | Decimal/float value |
| `MgmtCode` | varchar(6) | NULL |  | Management company code |
| `FundID` | varchar(6) | NULL |  | Fund identifier code (e.g., DYN 3056) |
| `iStatus` | tinyint | NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `dtProcessed` | datetime | NULL |  | Date/time field |
| `iRiskOld` | tinyint | NULL |  | Small integer/flag field |
| `dtRiskOld` | datetime | NULL |  | Date/time field |
| `Risk_SD` | char(1) | NULL |  |  |
| `Risk_SO` | char(1) | NULL |  |  |
| `Risk_DD` | char(1) | NULL |  |  |
| `Risk_PR` | char(1) | NULL |  |  |
| `Risk_FD` | char(1) | NULL |  |  |
| `dtRisk` | datetime | NULL |  | Date/time field |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |

### `UB_FDImportOption`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iFundProperties` | tinyint | NULL |  | Small integer/flag field |
| `iNameEN` | tinyint | NULL |  | Small integer/flag field |
| `iNameFR` | tinyint | NULL |  | Small integer/flag field |
| `iPrice` | tinyint | NULL |  | Small integer/flag field |
| `iRisk` | tinyint | NULL |  | Small integer/flag field |
| `iFundObjectiveEN` | tinyint | NULL |  | Small integer/flag field |
| `iFundObjectiveFR` | tinyint | NULL |  | Small integer/flag field |
| `iUSExchange` | tinyint | NULL |  | Small integer/flag field |
| `iCreateNewFund` | tinyint | NULL |  | Small integer/flag field |
| `iNewFundApproved` | tinyint | NULL |  | Small integer/flag field |
| `iNameCAP` | tinyint | NULL |  | Small integer/flag field |
| `iFundCategory` | tinyint | NULL |  | Small integer/flag field |
| `iRiskMethod` | tinyint | NULL |  | Small integer/flag field |
| `ExcludeRunTime` | varchar(200) | NULL |  |  |
| `ExcludeWeekDay` | varchar(30) | NULL |  |  |
| `ExcludeMonthDay` | varchar(30) | NULL |  |  |
| `iImportAndProcess` | tinyint | NULL |  | Small integer/flag field |
| `iEmail` | tinyint | NULL |  | Small integer/flag field |
| `EmailAddress` | varchar(200) | NULL |  |  |
| `FilePath` | varchar(250) | NULL |  |  |

### `UB_FDRankRiskDef`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `Risk` | char(1) | NULL |  |  |
| `iRankFrom_SD` | int | NULL |  | Integer field |
| `iRankTo_SD` | int | NULL |  | Integer field |
| `iRankFrom_SO` | int | NULL |  | Integer field |
| `iRankTo_SO` | int | NULL |  | Integer field |
| `iRankFrom_DD` | int | NULL |  | Integer field |
| `iRankTo_DD` | int | NULL |  | Integer field |

### `UB_FE_FileDetail`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iAccountID` | int | NULL |  | Integer field |
| `iTrxID` | int | NULL |  | Integer field |
| `iStatus` | tinyint | NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `iType` | tinyint | NULL |  | Type/category code |
| `mBalance` | float | NULL |  | Monetary value |
| `iFileID` | int | NULL |  | FK to file record (FundServ file) |
| `DealerCode` | varchar(4) | NULL |  | Dealer code identifier |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |

### `UB_FE_FileDetail_ARC`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL |  | Primary key, auto-increment identifier |
| `iAccountID` | int | NULL |  | Integer field |
| `iTrxID` | int | NULL |  | Integer field |
| `iStatus` | tinyint | NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `iType` | tinyint | NULL |  | Type/category code |
| `mBalance` | float | NULL |  | Monetary value |
| `iFileID` | int | NULL |  | FK to file record (FundServ file) |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `DealerCode` | varchar(4) | NULL |  | Dealer code identifier |

### `UB_Fee`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iFeeProcessingID` | int | NULL |  | Integer field |
| `iStatus` | tinyint | NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `Province` | char(3) | NULL |  |  |
| `mFee` | money | NULL |  |  |
| `mPST` | money | NULL |  |  |
| `mGST` | money | NULL |  |  |
| `mHST` | money | NULL |  |  |
| `mFeeTotal` | money | NULL |  |  |
| `iPlanID` | int | NULL |  | FK to UB_Plan table - identifies the investment plan/account |
| `iPosID` | int | NULL |  | FK to position record (fund holding) |
| `iTrxID` | int | NULL |  | Integer field |
| `iTrustTrxID` | int | NULL |  | Integer field |
| `iCommID` | int | NULL |  | Integer field |
| `iAccountType` | tinyint | NULL |  | Small integer/flag field |
| `iFeeType` | tinyint | NULL |  | Small integer/flag field |
| `iFeeProcessHouseHoldDAVID` | int | NULL |  | Integer field |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `iCreatedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `iPYMTOpt` | tinyint | NULL |  | Small integer/flag field |
| `iBankAccountID` | int | NULL |  | Integer field |
| `iFeeTypeDetail` | int | NULL |  | Integer field |
| `mDiscount` | money | NULL |  |  |
| `CurrencyCode` | char(2) | NULL |  |  |
| `iTrustFeeID` | int | NULL |  | Integer field |
| `iTrustTaxID` | int | NULL |  | Integer field |
| `iLastModifiedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who last modified this record |
| `dtLastModified` | datetime | NULL |  | Timestamp when record was last modified |

### `UB_FeeDetail`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iFeeID` | int | NULL |  | Integer field |
| `iFeeTemplateID` | int | NULL |  | Integer field |
| `mDAV` | money | NULL |  |  |
| `mFeeRate` | money | NULL |  |  |
| `FeeType` | char(1) | NULL |  |  |
| `mFee` | money | NULL |  |  |
| `iCommGridType` | smallint | NULL |  |  |
| `iPlanFeeID` | int | NULL |  | Integer field |
| `iDAVOpt` | tinyint | NULL |  | Small integer/flag field |
| `mFeeRateDAV` | money | NULL |  |  |

### `UB_FeeProcess`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `DealerCode` | varchar(5) | NULL |  | Dealer code identifier |
| `iStatus` | tinyint | NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `Description` | varchar(80) | NULL |  |  |
| `dtStart` | datetime | NULL |  | Date/time field |
| `dtEnd` | datetime | NULL |  | Date/time field |
| `iTrxType` | int | NULL |  | Integer field |
| `dtTrade` | datetime | NULL |  | Trade date |
| `iRealTime` | tinyint | NULL |  | Small integer/flag field |
| `iFeeProcessIndv` | tinyint | NULL |  | Small integer/flag field |
| `iCreatedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `iPlanCount` | int | NULL |  | Integer field |
| `iDoneCount` | int | NULL |  | Integer field |
| `dtCompleted` | datetime | NULL |  | Date/time field |
| `TemplateIDList` | varchar(400) | NULL |  |  |
| `iAssetOptions` | tinyint | NULL |  | Small integer/flag field |
| `iAssetAllDealer` | tinyint | NULL |  | Small integer/flag field |
| `iAssetCalcOpt` | tinyint | NULL |  | Small integer/flag field |
| `iFeeType` | tinyint | NULL |  | Small integer/flag field |
| `iTierBase` | tinyint | NULL |  | Small integer/flag field |
| `Frequency` | char(1) | NULL |  |  |
| `iTrusteePlanOpt` | tinyint | NULL |  | Small integer/flag field |
| `iNoLastRunCheck` | tinyint | NULL |  | Small integer/flag field |
| `CurrencyCode` | char(2) | NULL |  |  |
| `FundDefIDList` | varchar(100) | NULL |  |  |
| `iLastModifiedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who last modified this record |
| `dtLastModified` | datetime | NULL |  | Timestamp when record was last modified |

### `UB_FeeProcessHouseHoldDAV`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iFeeProcessID` | int | NULL |  | Integer field |
| `iLinkedType` | tinyint | NULL |  | Small integer/flag field |
| `iLinkedID` | int | NULL |  | Integer field |
| `mDAV` | money | NULL |  |  |
| `iTier` | tinyint | NULL |  | Small integer/flag field |

### `UB_FeeProcessPlanDAV`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iFeeProcessID` | int | NULL |  | Integer field |
| `iPlanID` | int | NULL |  | FK to UB_Plan table - identifies the investment plan/account |
| `mDAV` | money | NULL |  |  |

### `UB_FeeSource`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iFeeID` | int | NULL |  | Integer field |
| `iSourceType` | tinyint | NULL |  | Small integer/flag field |
| `iSourceAccountID` | int | NULL |  | Integer field |
| `mAmount` | money | NULL |  | Monetary amount |
| `iTrustTrxID` | int | NULL |  | Integer field |
| `iTrxID` | int | NULL |  | Integer field |
| `mFee` | money | NULL |  |  |
| `mTax` | money | NULL |  |  |
| `iTrustFeeID` | int | NULL |  | Integer field |
| `iTrustTaxID` | int | NULL |  | Integer field |

### `UB_FeeSpecialRunFundList`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `MgmtCode` | varchar(4) | NULL |  | Management company code |
| `FundID` | varchar(5) | NULL |  | Fund identifier code (e.g., DYN 3056) |

### `UB_FeeTemplate`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `Code` | varchar(20) | NULL |  |  |
| `iStatus` | tinyint | NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `NameEN` | varchar(80) | NULL |  | English name |
| `NameFR` | varchar(80) | NULL |  | French name |
| `iIncludeGIC` | tinyint | NULL |  | Small integer/flag field |
| `iIncludeCash` | tinyint | NULL |  | Small integer/flag field |
| `iIncludeFEL` | tinyint | NULL |  | Small integer/flag field |
| `iIncludeDSC` | tinyint | NULL |  | Small integer/flag field |
| `iIncludeNL` | tinyint | NULL |  | Small integer/flag field |
| `iExcludeServiceFee` | tinyint | NULL |  | Small integer/flag field |
| `iClientAUA` | tinyint | NULL |  | Small integer/flag field |
| `iExcludeFSeries` | tinyint | NULL |  | Small integer/flag field |
| `iExcludeMoneyMK` | tinyint | NULL |  | Small integer/flag field |
| `iCommGridType` | smallint | NULL |  |  |
| `mAUA1_1` | money | NULL |  |  |
| `mFee1` | money | NULL |  |  |
| `FeeType1` | char(1) | NULL |  |  |
| `mAUA2_1` | money | NULL |  |  |
| `mAUA2_2` | money | NULL |  |  |
| `mFee2` | money | NULL |  |  |
| `FeeType2` | char(1) | NULL |  |  |
| `mAUA3_1` | money | NULL |  |  |
| `mAUA3_2` | money | NULL |  |  |
| `mFee3` | money | NULL |  |  |
| `FeeType3` | char(1) | NULL |  |  |
| `mAUA4_1` | money | NULL |  |  |
| `mAUA4_2` | money | NULL |  |  |
| `mFee4` | money | NULL |  |  |
| `FeeType4` | char(1) | NULL |  |  |
| `mAUA5_1` | money | NULL |  |  |
| `mFee5` | money | NULL |  |  |
| `FeeType5` | char(1) | NULL |  |  |
| `iOrder` | int | NULL |  | Integer field |
| `iTaxOption` | tinyint | NULL |  | Small integer/flag field |
| `iTierBase` | tinyint | NULL |  | Small integer/flag field |
| `TierCode` | varchar(15) | NULL |  |  |
| `DealerCode` | varchar(6) | NULL |  | Dealer code identifier |
| `iIncludeETF` | tinyint | NULL |  | Small integer/flag field |
| `iIncludeExempt` | tinyint | NULL |  | Small integer/flag field |
| `mYearlyCap` | money | NULL |  |  |

### `UB_FINTRAC`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iStatus` | tinyint | NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `iDocumentType` | tinyint | NULL |  | Small integer/flag field |
| `iRecordType` | tinyint | NULL |  | Small integer/flag field |
| `FINTRAC_ID` | varchar(20) | NULL |  |  |
| `LastName` | varchar(200) | NULL |  | Last name |
| `AddressInfo` | nvarchar(max) | NULL |  |  |
| `Basis` | varchar(200) | NULL |  |  |
| `FirstName` | varchar(100) | NULL |  | First name |
| `SecondName` | varchar(100) | NULL |  |  |
| `ThirdName` | varchar(100) | NULL |  |  |
| `FourthName` | varchar(100) | NULL |  |  |
| `POB` | varchar(100) | NULL |  |  |
| `POB_ALT1` | varchar(100) | NULL |  |  |
| `DOB` | varchar(100) | NULL |  |  |
| `DOB_ALT1` | varchar(100) | NULL |  |  |
| `DOB_ALT2` | varchar(100) | NULL |  |  |
| `DOB_ALT3` | varchar(100) | NULL |  |  |
| `Nationality` | varchar(100) | NULL |  |  |
| `Nationality_ALT1` | varchar(100) | NULL |  |  |
| `Nationality_ALT2` | varchar(100) | NULL |  |  |
| `Nationality_ALT3` | varchar(100) | NULL |  |  |
| `dtLastModified` | datetime | NULL |  | Timestamp when record was last modified |
| `iLastModifiedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who last modified this record |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |

### `UB_FINTRAC_CCASL_Group`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `CountryCode` | varchar(15) | NULL |  |  |
| `CountryEN` | varchar(100) | NULL |  |  |
| `CountryFR` | varchar(100) | NULL |  |  |
| `iOrder` | int | NULL |  | Integer field |

### `UB_FINTRAC_REC`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iStatus` | tinyint | NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `iDocumentType` | tinyint | NULL |  | Small integer/flag field |
| `iEntity` | tinyint | NULL |  | Small integer/flag field |
| `CountryCode` | varchar(15) | NULL |  |  |
| `FINTRAC_ID` | varchar(20) | NULL |  |  |
| `FirstName` | varchar(200) | NULL |  | First name |
| `SecondName` | varchar(100) | NULL |  |  |
| `ThirdName` | varchar(100) | NULL |  |  |
| `FourthName` | varchar(100) | NULL |  |  |
| `ListType` | varchar(100) | NULL |  |  |
| `RefNumber` | varchar(100) | NULL |  |  |
| `Info` | nvarchar(max) | NULL |  |  |
| `Designation` | varchar(100) | NULL |  |  |
| `Nationality` | varchar(200) | NULL |  |  |
| `Published` | varchar(100) | NULL |  |  |
| `Updated` | varchar(100) | NULL |  |  |
| `Alias` | varchar(max) | NULL |  |  |
| `POB` | varchar(200) | NULL |  |  |
| `DOB` | varchar(100) | NULL |  |  |
| `Address` | varchar(200) | NULL |  |  |
| `Document` | varchar(200) | NULL |  |  |
| `Schedule` | varchar(100) | NULL |  |  |
| `dtLastModified` | datetime | NULL |  | Timestamp when record was last modified |
| `iLastModifiedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who last modified this record |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `Country` | varchar(200) | NULL |  |  |
| `Lg` | char(1) | NULL |  |  |

### `UB_FormFile`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iFormID` | int | NOT NULL |  | Integer field |
| `FileNameEN` | varchar(255) | NULL |  |  |
| `FileNameFR` | varchar(255) | NULL |  |  |
| `iOrder` | tinyint | NULL |  | Small integer/flag field |

### `UB_Forms`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iDealershipID` | int | NOT NULL |  | Integer field |
| `iType` | tinyint | NOT NULL |  | Type/category code |
| `InstitutionCode` | varchar(50) | NULL |  |  |
| `MgmtCode` | varchar(10) | NULL |  | Management company code |
| `FileNameEN` | varchar(255) | NULL |  |  |
| `FileNameFR` | varchar(255) | NULL |  |  |
| `NameEN` | varchar(200) | NULL |  | English name |
| `NameFR` | varchar(200) | NULL |  | French name |
| `DescriptionEN` | varchar(200) | NULL |  |  |
| `DescriptionFR` | varchar(200) | NULL |  |  |
| `iOrder` | int | NULL |  | Integer field |
| `VersionStr` | varchar(50) | NULL |  |  |
| `iTarget` | tinyint | NULL |  | Small integer/flag field |
| `iTradeTicket` | tinyint | NULL |  | Small integer/flag field |
| `iBarCode` | tinyint | NULL |  | Small integer/flag field |
| `iSignature` | tinyint | NULL |  | Small integer/flag field |
| `dtLastSigPosUpdate` | datetime | NULL |  | Date/time field |

### `UB_FormSigPos`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iFormID` | int | NULL |  | Integer field |
| `iType` | tinyint | NULL |  | Type/category code |
| `iRecipientType` | tinyint | NULL |  | Small integer/flag field |
| `iRecipientID` | tinyint | NULL |  | Small integer/flag field |
| `iPage` | int | NULL |  | Integer field |
| `iPosX` | int | NULL |  | Integer field |
| `iPosY` | int | NULL |  | Integer field |
| `iOptional` | tinyint | NULL |  | Small integer/flag field |
| `Lg` | tinyint | NULL |  |  |
| `iWidth` | int | NULL |  | Integer field |
| `iHeight` | int | NULL |  | Integer field |

### `UB_FormSigSetting`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `AccountID` | varchar(50) | NULL |  |  |
| `UserID` | varchar(100) | NULL |  |  |
| `UserPassword` | varchar(100) | NULL |  |  |
| `AccessToken` | varchar(max) | NULL |  |  |
| `RestApiUrl` | varchar(250) | NULL |  |  |
| `IntegratorKey` | varchar(1000) | NULL |  |  |
| `iAppType` | tinyint | NULL |  | Small integer/flag field |
| `iUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `AccessCode` | varchar(max) | NULL |  |  |
| `PrivateKeyPath` | varchar(400) | NULL |  |  |
| `OAuthBasePath` | varchar(400) | NULL |  |  |
| `RefreshToken` | varchar(max) | NULL |  |  |
| `ReturnURL` | varchar(200) | NULL |  |  |
| `TokenType` | varchar(100) | NULL |  |  |
| `dtExpiry` | datetime | NULL |  | Date/time field |
| `APIUserName` | varchar(100) | NULL |  |  |
| `APISecretKey` | varchar(100) | NULL |  |  |
| `iAccessCodeOpt` | tinyint | NULL |  | Small integer/flag field |
| `EmailAddress` | varchar(300) | NULL |  |  |
| `EmailName` | varchar(80) | NULL |  |  |

### `UB_FrenchTextLookup`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `TextEN` | varchar(80) | NULL |  |  |
| `TextFR` | varchar(80) | NULL |  |  |

### `UB_SC_DefTrxRec`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `FieldName` | varchar(50) | NOT NULL |  | Field name reference |
| `SPParamName` | varchar(50) | NULL |  |  |
| `iStartPos` | smallint | NOT NULL |  |  |
| `iLength` | smallint | NOT NULL |  |  |
| `iType` | tinyint | NULL |  | Type/category code |
| `bRequired` | tinyint | NOT NULL |  |  |
| `iErrorID` | int | NULL |  | Integer field |
| `LimitStr` | varchar(100) | NULL |  |  |
| `FSName` | varchar(100) | NULL |  |  |
| `bHeader` | tinyint | NOT NULL |  |  |

### `UB_TASearchList`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `UserID` | int | NOT NULL |  |  |
| `TAID` | int | NOT NULL |  |  |

### `UB_TaxFile`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `FileName` | varchar(250) | NULL |  | File name |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `iUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `iStatus` | tinyint | NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `ConfirmationID` | varchar(30) | NULL |  |  |
| `dtConfirmation` | datetime | NULL |  | Date/time field |

### `UB_TaxReceipt`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iTrustID` | int | NOT NULL |  | Integer field |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `iVoid` | tinyint | NULL |  | Small integer/flag field |
| `iVoidUserID` | int | NULL |  | Integer field |
| `dtVoid` | datetime | NULL |  | Date/time field |
| `Notes` | varchar(200) | NULL |  |  |
| `iPrinted` | tinyint | NULL |  | Small integer/flag field |
| `dtPrinted` | datetime | NULL |  | Date/time field |
| `iFileID` | int | NULL |  | FK to file record (FundServ file) |
| `iObjData` | int | NULL |  | Integer field |
| `iUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `mAmount` | money | NULL |  | Monetary amount |
| `ReceiptID` | varchar(15) | NULL |  |  |
| `iStatus` | tinyint | NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `iTaxYear` | int | NULL |  | Integer field |
| `iCurrentYear` | tinyint | NULL |  | Small integer/flag field |
| `iPlanID` | int | NULL |  | FK to UB_Plan table - identifies the investment plan/account |

### `UB_TMP_Remove`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NULL |  | Primary key, auto-increment identifier |
| `Str` | text | NULL |  |  |

### `UB_TransferReminder`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iPlanID` | int | NULL |  | FK to UB_Plan table - identifies the investment plan/account |
| `iStatus` | tinyint | NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `iType` | int | NULL |  | Type/category code |
| `InstitutionFrom` | varchar(50) | NULL |  |  |
| `AccountIDFrom` | varchar(20) | NULL |  |  |
| `AccountTypeFrom` | char(2) | NULL |  |  |
| `AccountDesignationFrom` | char(1) | NULL |  |  |
| `IntermediaryCodeFrom` | varchar(6) | NULL |  |  |
| `IntermediaryAccountIDFrom` | varchar(20) | NULL |  |  |
| `mAmountEst` | money | NULL |  | Monetary amount |
| `mAmountActual` | money | NULL |  | Monetary amount |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `dtCompleted` | datetime | NULL |  | Date/time field |
| `iCreatedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `iLastModifiedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who last modified this record |
| `dtLastModified` | datetime | NULL |  | Timestamp when record was last modified |
| `Notes` | varchar(max) | NULL |  |  |
| `dtFollowup` | datetime | NULL |  | Date/time field |
| `iNotificationOpt` | tinyint | NULL |  | Small integer/flag field |
| `MgmtCode` | varchar(5) | NULL |  | Management company code |
| `FundIDs` | varchar(80) | NULL |  |  |
| `DealerAccountIDFrom` | varchar(15) | NULL |  |  |
| `AmountType` | char(1) | NULL |  |  |
| `mAmount` | money | NULL |  | Monetary amount |
| `iCategory` | tinyint | NULL |  | Small integer/flag field |
| `iPlanIDFrom` | int | NULL |  | Integer field |
| `InstitutionTo` | varchar(50) | NULL |  |  |
| `iFlag` | tinyint | NULL |  | Small integer/flag field |

---

## UCI (Universal Client Identifier)

### `UB_UCI`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `SIN_BN` | varchar(20) | NULL |  | Social Insurance Number or Business Number (Canada) |
| `UCID` | varchar(20) | NULL |  |  |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `iCreatedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `dtLastModified` | datetime | NULL |  | Timestamp when record was last modified |
| `iLastModifiedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who last modified this record |

### `UB_UCI_ARC`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL |  | Primary key, auto-increment identifier |
| `SIN_BN` | varchar(20) | NULL |  | Social Insurance Number or Business Number (Canada) |
| `UCID` | varchar(20) | NULL |  |  |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `iCreatedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `dtLastModified` | datetime | NULL |  | Timestamp when record was last modified |
| `iLastModifiedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who last modified this record |

### `UB_UCILink`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iUCI_ID` | int | NULL |  | Integer field |
| `iLinkedID` | int | NULL |  | Integer field |
| `iLinkedType` | tinyint | NULL |  | Small integer/flag field |

---

## Uniformity Review

### `UB_UniformityHeader`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `dtCreatedDate` | datetime | NULL |  | Date/time field |
| `iCreatedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `DealerCode` | varchar(6) | NULL |  | Dealer code identifier |
| `RepCode` | varchar(8) | NULL |  | Representative/advisor code |
| `iStatus` | tinyint | NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `iYear` | int | NULL |  | Integer field |
| `iMonth` | int | NULL |  | Integer field |

### `UB_UniformityPlanSnapshot`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iUniformityHeaderID` | int | NOT NULL |  | Integer field |
| `iPlanID` | int | NULL |  | FK to UB_Plan table - identifies the investment plan/account |
| `ClientFirstName` | varchar(40) | NULL |  |  |
| `ClientLastName` | varchar(80) | NULL |  |  |
| `iAge` | int | NULL |  | Integer field |
| `ClientFirstName2` | varchar(40) | NULL |  |  |
| `ClientLastName2` | varchar(80) | NULL |  |  |
| `iAge2` | int | NULL |  | Integer field |
| `TaxCode` | varchar(6) | NULL |  |  |
| `iAnnualIncome` | smallint | NULL |  |  |
| `mAnnualIncome` | money | NULL |  |  |
| `iNetWorth` | smallint | NULL |  |  |
| `mNetWorth` | money | NULL |  |  |
| `iInvestmentKnowledge` | smallint | NULL |  |  |
| `mLiquidAsset` | money | NULL |  |  |
| `mLiability` | money | NULL |  |  |
| `mFixedAsset` | money | NULL |  |  |
| `mLiquidityAsset` | money | NULL |  |  |
| `DealerAccountID` | varchar(15) | NULL |  |  |
| `ThirdPartyCode` | varchar(4) | NULL |  |  |
| `ThirdPartyAccount` | varchar(15) | NULL |  |  |
| `AccountType` | char(2) | NULL |  |  |
| `DealerCode` | varchar(6) | NULL |  | Dealer code identifier |
| `SaleRepCode` | varchar(8) | NULL |  | Representative/advisor code |
| `RepName` | varchar(300) | NULL |  |  |
| `dtKYCOnFile` | datetime | NULL |  | Date/time field |
| `iPrimaryObj` | smallint | NULL |  |  |
| `fPrimaryObj1` | float | NULL |  | Decimal/float value |
| `fPrimaryObj2` | float | NULL |  | Decimal/float value |
| `fPrimaryObj3` | float | NULL |  | Decimal/float value |
| `fPrimaryObj4` | float | NULL |  | Decimal/float value |
| `fPrimaryObj5` | float | NULL |  | Decimal/float value |
| `Risk` | char(1) | NULL |  |  |
| `fRisk1` | float | NULL |  | Decimal/float value |
| `fRisk2` | float | NULL |  | Decimal/float value |
| `fRisk3` | float | NULL |  | Decimal/float value |
| `fRisk4` | float | NULL |  | Decimal/float value |
| `fRisk5` | float | NULL |  | Decimal/float value |
| `fRisk6` | float | NULL |  | Decimal/float value |
| `iLeveraged` | tinyint | NULL |  | Small integer/flag field |
| `iTimeHorizon` | smallint | NULL |  |  |

### `UB_UniformityReviewObj`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iType` | tinyint | NULL |  | Type/category code |
| `iReportID` | int | NOT NULL |  | Integer field |
| `iUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who created this record |
| `dtReview` | datetime | NULL |  | Date/time field |
| `ReviewNotes` | varchar(max) | NULL |  |  |
| `ObjData` | varbinary(max) | NULL |  |  |
| `dtCreated` | datetime | NULL |  | Timestamp when record was created |
| `iYear` | int | NULL |  | Integer field |
| `iMonth` | int | NULL |  | Integer field |
| `DealerCode` | varchar(5) | NULL |  | Dealer code identifier |
| `RepCode` | varchar(5) | NULL |  | Representative/advisor code |

### `UB_UniformitySummary`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iUniformityHeaderID` | int | NOT NULL |  | Integer field |
| `iFieldID` | int | NULL |  | Integer field |
| `iSubFieldID1` | int | NULL |  | Integer field |
| `iSubFieldID2` | int | NULL |  | Integer field |
| `iSubFieldID3` | int | NULL |  | Integer field |
| `iNumPlan` | int | NULL |  | Integer field |
| `iNumPlanSenior` | int | NULL |  | Integer field |
| `iNumPlanTotal` | int | NULL |  | Integer field |
| `Description` | varchar(250) | NULL |  |  |
| `iNumPlanTotalSenior` | int | NULL |  | Integer field |

---

## VieFUND Application

### `VF_VF_Notifications`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iIDSource` | int | NULL |  | Integer field |
| `iIDDest` | int | NULL |  | Integer field |

---

## View Settings

### `UB_ViewSetting`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `iLoginID` | int | NOT NULL |  | Integer field |
| `iColumnID` | int | NOT NULL |  | Integer field |
| `iOrder` | int | NOT NULL |  | Integer field |

---

## Web Client Portal

### `UB_WebClientRegistrationRequest`

| Column | Type | Nullable | Identity | Description |
|--------|------|----------|----------|-------------|
| `ID` | int | NOT NULL | Y | Primary key, auto-increment identifier |
| `FirstName` | varchar(40) | NULL |  | First name |
| `LastName` | varchar(40) | NULL |  | Last name |
| `EmailAddress` | varchar(100) | NULL |  |  |
| `LoginID` | varchar(50) | NULL |  | Login username |
| `dtDOB` | datetime | NULL |  | Date of birth |
| `PhoneNumber` | varchar(20) | NULL |  |  |
| `iElectronicStmt` | tinyint | NOT NULL |  | Small integer/flag field |
| `iStatus` | tinyint | NOT NULL |  | Status code for this record (see UB_Def_TrxStatus or related lookup) |
| `dtCreated` | datetime | NOT NULL |  | Timestamp when record was created |
| `dtProcessed` | datetime | NULL |  | Date/time field |
| `iClientID` | int | NOT NULL |  | FK to UB_Client table - identifies the client/investor |
| `iProcessedUserID` | int | NOT NULL |  | Integer field |
| `iDeleted` | tinyint | NULL |  | Small integer/flag field |
| `dtLastModified` | datetime | NULL |  | Timestamp when record was last modified |
| `iLastModifiedUserID` | int | NULL |  | FK to UB_MemberLogin - internal user who last modified this record |

---


