# Sơ đồ luồng dữ liệu các loại file Fundserv

## 1. Tổng quan hệ sinh thái

Trong hệ thống Fundserv, có 3 vai trò chính:

| Vai trò | Mô tả | Ví dụ |
|---|---|---|
| **Dealer/Distributor** | Đại lý phân phối quỹ đầu tư | VieFund (hệ thống WebApp này) |
| **Manufacturer** | Công ty quỹ đầu tư (tạo/quản lý quỹ) | Fidelity, Manulife, CI, AGF... |
| **Fundserv** | Mạng lưới trung gian (clearing house) | Fundserv Inc. |

```
┌──────────────┐           ┌──────────────┐           ┌──────────────┐
│   DEALER     │  ◄─────►  │  FUNDSERV    │  ◄─────►  │ MANUFACTURER │
│  (VieFund)   │   MQ/File  │  (Network)   │   MQ/File  │  (Fund Co.)  │
└──────────────┘           └──────────────┘           └──────────────┘
```

---

## 2. Phân loại file theo hướng truyền

### 2.1 Dealer GỬI ĐI → Fundserv → Manufacturer

| File | Tên đầy đủ | Mục đích |
|---|---|---|
| **TFS** | Transaction/Financial Submission | Gửi lệnh mua/bán/chuyển đổi |
| **NFU** | Non-Financial Update | Cập nhật thông tin phi tài chính |

### 2.2 Manufacturer GỬI VỀ → Fundserv → Dealer

| File | Tên đầy đủ | Mục đích |
|---|---|---|
| **TS** | Transaction Reconciliation | Xác nhận giao dịch đã xử lý |
| **HS** | Historical Transaction Reconciliation | Lịch sử giao dịch đã xử lý |
| **NS** | Account Demographic Reconciliation | Đối soát thông tin tài khoản |
| **PS** | Position Statement | Báo cáo vị thế/holdings |
| **FS** | Settlement Instruction | Chỉ dẫn thanh toán |
| **GS** | Settlement Report | Báo cáo thanh toán (N$M) |
| **FD** | Fund Setup / Fund Definition | Thông tin quỹ đầu tư mới |
| **MD** | Product Update | Cập nhật thông tin quỹ |

> **Ghi chú**: Trong WebApp, file gửi đi gọi là **CO file** (Confirmation Order) – đây là format output của hệ thống khi đóng gói TFS thành XML để gửi.

---

## 3. Luồng chi tiết từng loại file

### 3.1 CO / TFS – Lệnh giao dịch (Dealer → Fundserv)

**CO (Confirmation Order)** là file XML chứa các lệnh TFS mà Dealer gửi cho Manufacturer thông qua Fundserv.

```mermaid
sequenceDiagram
    participant User as Advisor/Admin
    participant Web as WebApp
    participant DB as SQL Server
    participant SVC as VieFUNDIE Service
    participant FS as Fundserv Network
    participant MFR as Manufacturer

    Note over User,Web: Bước 1: Tạo lệnh giao dịch
    User->>Web: Nhập lệnh Buy/Sell/Switch
    Web->>Web: PopupTradeAdd.aspx.cs
    Web->>DB: INSERT Order (status=Pending)

    Note over User,Web: Bước 2: Xét duyệt batch
    User->>Web: Mở PopupOrderBatch
    Web->>DB: CTrx.GetOrderPendingSet()
    DB-->>Web: Danh sách pending orders
    User->>Web: Tag orders → Click "Generate"

    alt Real-time Mode (MQ)
        Web->>DB: CTrx.OrderPendingMove2Waiting() [status=Waiting]
        SVC->>DB: COrder.OrderFileGenerate() [poll mỗi 60s]
        DB-->>SVC: Orders status=Waiting
        SVC->>SVC: Generate CO XML file
        SVC->>FS: Gửi qua IBM MQ (MQ_NAMESEND)
    else Batch Mode (File)
        Web->>DB: CTrx.OrderPendingMove2Waiting() [status=Waiting]
        SVC->>DB: COrder.OrderFileGenerate() [poll mỗi 60s]
        DB-->>SVC: Orders status=Waiting
        SVC->>SVC: Generate CO XML file
        SVC->>SVC: Ghi vào FILE_PATH_UPLOAD
        Note over SVC: File server đẩy lên Fundserv
    else Manual Confirm (No Fundserv)
        Web->>DB: CTrx.OrderPending2Confirm() [status=Confirmed]
        Note over Web: Không gửi file, chỉ đổi status
    end

    FS->>MFR: Forward lệnh đến Manufacturer
    MFR-->>FS: Xử lý → Gửi TS file phản hồi
```

#### Nội dung CO file

```
CO XML file chứa:
├── Header: Dealer Code, File Date, Sequence
├── Order Records (1..N):
│   ├── Action Code: Buy (PUR), Sell (RED), Switch (SW), Transfer (TFR)
│   ├── Fund ID (CUSIP/Fund Code)
│   ├── Account Info: Account #, Plan Type, AcctDesig
│   ├── Amount / Units
│   ├── Settlement Method
│   ├── Source ID (tracking number)
│   └── Special Instructions
└── Trailer: Record Count, Total Amount
```

#### Source code liên quan

| File | Function | Vai trò |
|---|---|---|
| `PopupTradeAdd.aspx.cs` | `OnSaveOrder()` | Lưu lệnh vào DB (Pending) |
| `PopupOrderBatch.aspx.cs` | `OnGenerateOrderFileBtn()` | Chuyển status sang Waiting |
| `UBFFImport.COrder` | `OrderFileGenerate()` | Sinh CO XML file (trong service) |
| `UBFFImport.CXM` | `FileGenerate()` | Sinh NFU/Transfer file |

---

### 3.2 NFU – Cập nhật phi tài chính (Dealer → Fundserv)

**NFU (Non-Financial Update)** gửi cập nhật thông tin tài khoản mà không liên quan đến tiền.

```mermaid
sequenceDiagram
    participant User as Advisor/Admin
    participant Web as WebApp
    participant DB as SQL Server
    participant SVC as VieFUNDIE Service
    participant FS as Fundserv Network
    participant MFR as Manufacturer

    Note over User,Web: Tạo NFU Request
    User->>Web: Cập nhật Client Name/Address/Beneficiary
    Web->>Web: PopupOrderBatch (Tab NFU)
    Web->>DB: CNFU.PendingSelectionUpdate()

    User->>Web: Tag NFU items → "Generate NFU"
    Web->>DB: Status = Waiting

    SVC->>DB: CXM.FileGenerate() [poll 60s]
    DB-->>SVC: NFU items waiting
    SVC->>SVC: Generate NFU XML
    SVC->>FS: Gửi qua MQ hoặc file
    FS->>MFR: Forward NFU
    MFR-->>FS: Xác nhận → NS file
```

#### Các loại NFU

| NFU Type | Mô tả |
|---|---|
| Client Name | Cập nhật tên khách hàng |
| Client Address | Cập nhật địa chỉ |
| New Account | Tạo tài khoản mới |
| Beneficiary | Cập nhật người thụ hưởng |
| Account Attributes | Thay đổi thuộc tính tài khoản |
| Add Successor | Thêm Successor Annuitant (TFSA/RRIF/FHSA) |

---

### 3.3 TS – Xác nhận giao dịch (Manufacturer → Dealer)

**TS (Transaction Reconciliation)** là file Manufacturer gửi để xác nhận giao dịch đã xử lý.

```mermaid
sequenceDiagram
    participant MFR as Manufacturer
    participant FS as Fundserv Network
    participant SVC as VieFUNDIE Service
    participant DB as SQL Server
    participant Web as WebApp
    participant User as Admin

    MFR->>FS: Gửi TS file (giao dịch đã xử lý)
    FS->>SVC: File đặt vào FILE_PATH (hoặc MQ)
    
    Note over SVC: Timer loop mỗi 60 giây
    SVC->>SVC: FFImport.ProcessAllX()
    SVC->>SVC: Parse TS XML → Xác định loại record
    
    alt Giao dịch thành công
        SVC->>DB: Cập nhật Order status = Confirmed
        SVC->>DB: Tạo Transaction record (holdings update)
        SVC->>DB: Cập nhật units/NAV/amount
        SVC->>SVC: Di chuyển file → Imported/TRX/
    else Giao dịch bị từ chối
        SVC->>DB: Cập nhật Order status = Rejected
        SVC->>DB: Lưu error code + message
        SVC->>SVC: Di chuyển file → Imported/TRX/
    else Lỗi xử lý (dealer/rep code không match)
        SVC->>DB: Ghi Error Log
        SVC->>SVC: Di chuyển file → Error/
    end

    User->>Web: Xem PopupFundServ → History tab
    Web->>DB: FundServ.GetImportFileList()
    DB-->>Web: Danh sách file + status

    User->>Web: Xem Error Log tab
    Web->>DB: FundServ.GetErrorLogList()
    Note over User,Web: Map lại Dealer/Rep code nếu cần
```

#### Nội dung TS file

```
TS XML file chứa:
├── Header: Manufacturer Code, File Date
├── Transaction Records:
│   ├── Buy Section: Units purchased, NAV, Amount, Trade Date, Settlement Date
│   ├── Sell Section: Units redeemed, NAV, Amount, Deductions (TCR V36: 4 loại mới)
│   ├── Switch Section: From Fund, To Fund, Units, NAV
│   ├── Transfer Section: Transfer In/Out, Units, From/To Dealer
│   └── Distribution Section: Dividend, Capital Gain, Return of Capital
├── Commission Data: Trailer Fee, Front-End Load, DSC
└── Trailer: Record Count
```

#### V36 Changes cho TS file
- **4 deduction mới** (DOT 149): `EarlyRdmtnFee`, `DlrAdvsrFee`, `MVA`, `IRSTax`
- **Client Name Fee Redemptions** (DOT 155): Hỗ trợ AcctDesig=1

---

### 3.4 HS – Lịch sử giao dịch (Manufacturer → Dealer)

**HS (Historical Transaction Reconciliation)** tương tự TS nhưng cho dữ liệu lịch sử.

```mermaid
flowchart LR
    MFR[Manufacturer] -->|HS file| FS[Fundserv]
    FS -->|FILE_PATH| SVC[VieFUNDIE]
    SVC -->|FFImport.ProcessAllX| DB[(Database)]
    SVC -->|Imported/TRX/| ARCH[Archive]
    DB -->|Query| Web[WebApp]
    Web -->|TrxView.aspx| User[Admin]
    
    style MFR fill:#4a90d9
    style FS fill:#f5a623
    style SVC fill:#7ed321
    style DB fill:#9013fe,color:#fff
```

| So sánh | TS | HS |
|---|---|---|
| Tần suất | Hàng ngày (end-of-day) | Theo yêu cầu hoặc định kỳ |
| Nội dung | Giao dịch mới nhất | Giao dịch lịch sử (có thể nhiều tháng) |
| Xử lý | Cập nhật holdings real-time | Reconciliation / kiểm tra |
| V36 impact | Thêm 4 deduction fields | Thêm 4 deduction fields (giống TS) |

---

### 3.5 FS – Chỉ dẫn thanh toán (Manufacturer → Dealer)

**FS (Settlement Instruction)** chứa thông tin thanh toán cho các giao dịch đã confirm.

```mermaid
sequenceDiagram
    participant MFR as Manufacturer
    participant FS as Fundserv Network
    participant SVC as VieFUNDIE Service
    participant DB as SQL Server
    participant Web as WebApp

    MFR->>FS: Gửi FS file (settlement instructions)
    FS->>SVC: Đặt vào FILE_PATH
    SVC->>SVC: FFImport.ProcessAllX()
    SVC->>DB: Tạo Settlement records
    SVC->>DB: Link settlement với transaction

    Web->>DB: SettlementView.aspx → Query
    Note over Web: Hiển thị settlement details
    Note over Web: Net settlement amount (buy - sell)
```

#### Nội dung FS file

```
FS file chứa:
├── Settlement Date
├── Fund ID
├── Net Amount (Buy amount - Sell amount)
├── Settlement Method (Cheque, EFT, N$M)
├── Dealer/Account Info
└── V36: Thêm deduction fields trong Sell section
```

---

### 3.6 GS – Báo cáo thanh toán (Manufacturer → Dealer)

**GS (Settlement Report)** cung cấp chi tiết thanh toán net settlement giữa các bên.

```mermaid
flowchart TD
    MFR[Manufacturer] -->|GS file| FS[Fundserv]
    FS -->|FILE_PATH| SVC[VieFUNDIE]
    SVC -->|Parse XML| PROC[Process Settlement]
    PROC -->|Amount Precision: V36 = 4 decimal| DB[(Database)]
    DB --> WEB[SettlementView.aspx]
    WEB --> RPT[Settlement Reports]
```

#### V36 Changes cho GS file
- **DOT 183**: Amount fields mở rộng từ 2 → 4 decimal places (schema alignment)

---

### 3.7 NS – Đối soát tài khoản (Manufacturer → Dealer)

**NS (Account Demographic Reconciliation)** để đồng bộ thông tin tài khoản.

```mermaid
sequenceDiagram
    participant MFR as Manufacturer
    participant FS as Fundserv
    participant SVC as VieFUNDIE
    participant DB as SQL Server
    participant Web as WebApp

    MFR->>FS: Gửi NS file
    FS->>SVC: FILE_PATH
    SVC->>SVC: FFImport.ProcessAllX()

    alt Tài khoản đã tồn tại
        SVC->>DB: Cập nhật demographics (name, address, SIN)
    else Tài khoản mới (setting: CreateNewClient=1)
        SVC->>DB: Tạo Client + Plan + Account mới
        Note over SVC: Theo cấu hình NSP trong PopupFundServ Settings
    end

    User->>Web: PopupFundServ → History
    Note over Web: Xem file NSP import status
    User->>Web: PopupFundServ → Report
    Note over Web: Export NSP report (Excel/PDF)
```

#### Cấu hình import NSP (trong PopupFundServ Settings)

| Setting | Control | Mô tả |
|---|---|---|
| `CreateNewClient` | `chNSPCreateClient` | Tự động tạo Client mới? |
| `CreateNewPlan` | `chNSPCreatePlan` | Tự động tạo Plan mới? |
| `CreateNewClientStatus` | `cbNSPClientStatus` | Status mặc định cho client mới |

---

### 3.8 PS – Báo cáo vị thế (Manufacturer → Dealer)

**PS (Position Statement)** báo cáo holdings (số units, NAV) của tất cả tài khoản.

```mermaid
flowchart LR
    MFR[Manufacturer] -->|PS file hàng tháng| FS[Fundserv]
    FS -->|FILE_PATH| SVC[VieFUNDIE]
    SVC -->|FFImport.ProcessAllX| PROC{So sánh<br/>Holdings}
    PROC -->|Match| DB[(Database OK)]
    PROC -->|Mismatch| ERR[Error Log<br/>Reconciliation Break]
    DB --> WEB[AccountView.aspx]
    ERR --> WEB2[PopupFundServ<br>Error Log]
```

#### V36 Changes cho PS file
- **DOT 158**: Thêm category **Terminated** funds (fund đã đóng nhưng còn units)

---

### 3.9 FD / MD – Thông tin quỹ (Manufacturer → Dealer)

**FD (Fund Setup)** và **MD (Product Update)** cung cấp/cập nhật thông tin quỹ đầu tư.

```mermaid
sequenceDiagram
    participant MFR as Manufacturer
    participant FS as Fundserv
    participant SVC as VieFUNDIE
    participant DB as SQL Server
    participant Web as WebApp

    MFR->>FS: Gửi FD file (Fund Definition)
    FS->>SVC: FILE_PATH
    SVC->>SVC: FFImport.ProcessAllX()
    SVC->>SVC: Di chuyển → Imported/FUND/

    alt Fund chưa tồn tại (setting: CanCreateFund=1)
        SVC->>DB: Tạo Fund mới
        Note over SVC: Status theo cấu hình (Approved/Active)
    else Fund đã tồn tại
        alt UpdateFundName=1
            SVC->>DB: Cập nhật tên quỹ
        end
        SVC->>DB: Cập nhật NAV, MER, Risk, Category
    end

    Note over MFR,Web: MD file tương tự FD nhưng chỉ cập nhật
    
    User->>Web: FundSetup.aspx → Xem/Edit fund
```

#### Cấu hình FD import (trong PopupFundServ Settings)

| Setting | Control | Mô tả |
|---|---|---|
| `CanCreateFund` | `chFDCanCreate` | Cho phép tạo fund mới? |
| `MgmtMustExist` | `chFDMgmtMustExist` | Management Company phải tồn tại? |
| `UpdateFundName` | `chFDUpdateName` | Cập nhật tên fund? |
| `CreateFundApproved` | `chFDCreateApproved` | Fund mới = Approved? |
| `CreateFundActive` | `chFDCreateActive` | Fund mới = Active? |
| `IgnoreEffectiveDate` | `chFDIgnoreEffectiveDate` | Bỏ qua Effective Date? |
| `SaveSkippedRecord` | `chFDSaveSkippedRecordFund` | Lưu record bị skip? |

#### V36 Changes cho FD file
- **DOT 178**: Thêm Product Type = **Bullion**, xóa **ETF** và **Other**
- **DOT 180**: Custom Date mở rộng từ 2 → 10 entries

---

### 3.10 DR – Tái đầu tư cổ tức (Manufacturer → Dealer)

**DR (Dividend/Distribution Reinvestment)** thông báo cổ tức đã được tái đầu tư.

```mermaid
sequenceDiagram
    participant MFR as Manufacturer
    participant FS as Fundserv
    participant SVC as VieFUNDIE Service
    participant DB as SQL Server
    participant Web as WebApp

    Note over MFR: Quỹ chia cổ tức/phân phối lợi nhuận
    MFR->>MFR: Tính distribution cho mỗi account
    MFR->>FS: Gửi distribution records (trong TS/HS file)
    FS->>SVC: FILE_PATH

    SVC->>SVC: FFImport.ProcessAllX()
    SVC->>SVC: Parse Distribution Section của TS/HS

    SVC->>DB: Tạo Transaction record (type=Distribution)
    SVC->>DB: Cập nhật units (nếu DRIP - Reinvestment)
    SVC->>DB: Ghi breakdown: Dividend, Cap Gain, ROC
    SVC->>SVC: Di chuyển → Imported/TRX/

    User->>Web: TrxView.aspx → Xem distribution transactions
    User->>Web: CommissionView.aspx → Xem trailing commission
```

> **Lưu ý**: DR không phải là file riêng biệt mà là **Distribution section** nằm bên trong TS/HS file. Trong hệ thống, records loại distribution được xử lý và lưu trữ trong thư mục `Imported/TRX/`.

#### Loại Distribution

| Loại | Mô tả |
|---|---|
| **Dividend** | Cổ tức từ income |
| **Capital Gain** | Lợi nhuận vốn |
| **Return of Capital (ROC)** | Hoàn vốn |
| **Foreign Income** | Thu nhập nước ngoài |
| **DRIP** | Dividend Reinvestment Plan (tái đầu tư tự động) |

---

### 3.11 COM – Hoa hồng (Manufacturer → Dealer)

**COM (Commission)** file chứa thông tin hoa hồng Manufacturer trả cho Dealer.

```mermaid
flowchart TD
    MFR[Manufacturer] -->|COM file| FS[Fundserv]
    FS -->|FILE_PATH| SVC[VieFUNDIE]
    SVC -->|FFImport.ProcessAllX| DB[(Database)]
    SVC -->|Imported/COM/| ARCH[Archive]
    DB --> CV[CommissionView.aspx]
    CV --> TRAIL[Trailing Commission]
    CV --> FEE[Fee-based Commission]
    CV --> DSC[DSC Schedule]
```

---

### 3.12 PRICE – Giá NAV (Manufacturer → Dealer)

**PRICE** file cung cấp giá NAV (Net Asset Value) hàng ngày cho mỗi fund.

```mermaid
flowchart LR
    MFR[Manufacturer] -->|PRICE file hàng ngày| FS[Fundserv]
    FS -->|FILE_PATH| SVC[VieFUNDIE]
    SVC -->|FFImport.ProcessAllX| DB[(Database)]
    SVC -->|Imported/PRICE/| ARCH[Archive]
    DB --> FV[Fund NAV Display]
    DB --> MV[Market Value Calc]
    DB --> RPT[Client Reports]
```

---

## 4. Sơ đồ tổng hợp – Vòng đời giao dịch

```mermaid
flowchart TD
    subgraph DEALER["DEALER (WebApp)"]
        A1[Advisor nhập lệnh<br/>PopupTradeAdd] --> A2[Order Pending]
        A2 --> A3[Batch Review<br/>PopupOrderBatch]
        A3 --> A4{Mode?}
        A4 -->|Real-time| A5[MQ Send]
        A4 -->|Batch| A6[CO File]
    end

    subgraph SERVICE["VieFUNDIE Service"]
        B1[Timer 60s] --> B2[COrder.OrderFileGenerate]
        B2 --> B3[Generate CO XML]
        B1 --> B4[FFImport.ProcessAllX]
        B4 --> B5[Parse incoming files]
    end

    subgraph FUNDSERV["Fundserv Network"]
        C1[Message Queue<br/>IBM MQ]
        C2[File Exchange]
    end

    subgraph MANUFACTURER["Manufacturer"]
        D1[Process Order]
        D2[Generate Response Files]
    end

    A5 --> C1
    A6 --> B3
    B3 --> C2

    C1 --> D1
    C2 --> D1
    D1 --> D2

    D2 -->|TS file| C2
    D2 -->|FS file| C2
    D2 -->|NS file| C2
    D2 -->|PS file hàng tháng| C2
    D2 -->|FD/MD file| C2
    D2 -->|COM file| C2
    D2 -->|PRICE file hàng ngày| C2

    C2 -->|FILE_PATH| B4
    B5 -->|Update DB| DB[(SQL Server)]
    DB --> WEB[WebApp hiển thị kết quả]
```

---

## 5. Bảng tổng hợp – File lifecycle

| # | File | Hướng | Nguồn sinh | Engine xử lý | Lưu trữ | UI hiển thị |
|---|---|---|---|---|---|---|
| 1 | **CO/TFS** | Dealer → FS | `PopupOrderBatch` → `COrder.OrderFileGenerate()` | VieFUNDIE | `FILE_PATH_UPLOAD/` | PopupOrderBatch (History tab) |
| 2 | **NFU** | Dealer → FS | `PopupOrderBatch` (NFU tab) → `CXM.FileGenerate()` | VieFUNDIE | `FILE_PATH_UPLOAD/` | PopupOrderBatch (NFU History) |
| 3 | **GIC** | Dealer → FS | `PopupGICTrxAdd` → `CannexOrder.OrderFileGenerate()` | VieFUNDIE | `FILE_PATH_UPLOAD/GIC/` | GIC Order screen |
| 4 | **TS** | FS → Dealer | Manufacturer | `FFImport.ProcessAllX()` | `Imported/TRX/` | TrxView, CommissionView |
| 5 | **HS** | FS → Dealer | Manufacturer | `FFImport.ProcessAllX()` | `Imported/TRX/` | TrxView (historical) |
| 6 | **FS** | FS → Dealer | Manufacturer | `FFImport.ProcessAllX()` | `Imported/TRX/` | SettlementView |
| 7 | **GS** | FS → Dealer | Manufacturer | `FFImport.ProcessAllX()` | `Imported/` | SettlementView |
| 8 | **NS** | FS → Dealer | Manufacturer | `FFImport.ProcessAllX()` | `Imported/` | PopupFundServ (NSP report) |
| 9 | **PS** | FS → Dealer | Manufacturer (monthly) | `FFImport.ProcessAllX()` | `Imported/` | AccountView (reconciliation) |
| 10 | **FD** | FS → Dealer | Manufacturer | `FFImport.ProcessAllX()` | `Imported/FUND/` | FundSetup |
| 11 | **MD** | FS → Dealer | Manufacturer | `FFImport.ProcessAllX()` | `Imported/FUND/` | FundSetup |
| 12 | **COM** | FS → Dealer | Manufacturer | `FFImport.ProcessAllX()` | `Imported/COM/` | CommissionView |
| 13 | **PRICE** | FS → Dealer | Manufacturer (daily) | `FFImport.ProcessAllX()` | `Imported/PRICE/` | Fund NAV display |

---

## 6. Xử lý lỗi trong luồng Import

```mermaid
flowchart TD
    FILE[File nhận từ Fundserv] --> PARSE{FFImport<br/>Parse OK?}
    
    PARSE -->|Yes| MATCH{Dealer/Rep<br/>Code match?}
    PARSE -->|No| ERR1[Error folder<br/>+ Error Log]
    
    MATCH -->|Yes| PROC{Business<br/>rules OK?}
    MATCH -->|No| ERR2[Error Log<br/>Level 1]
    
    PROC -->|Yes| DB[Import vào DB<br/>→ Imported/]
    PROC -->|No| SKIP[Skipped folder]
    
    ERR2 --> MAP{Admin map<br/>Rep Code?}
    MAP -->|ProcessRepMapping| REPROCESS[Reprocess<br/>with new mapping]
    MAP -->|ProcessNoMapping| REPROCESS2[Reprocess<br/>without mapping]
    
    REPROCESS --> PROC
    REPROCESS2 --> PROC

    style ERR1 fill:#d32f2f,color:#fff
    style ERR2 fill:#f57c00,color:#fff
    style SKIP fill:#fbc02d
    style DB fill:#388e3c,color:#fff
```

### Các level error

| Level | Mô tả | Xử lý |
|---|---|---|
| **0** | Info/Warning | Tự động skip, ghi log |
| **1** | Recoverable Error | Admin có thể map lại Dealer/Rep code rồi reprocess |
| **2** | Fatal Error | File bị chuyển sang Error folder, cần can thiệp manual |

---

## 7. Thay đổi V36 ảnh hưởng đến Data Flow

| DOT | Thay đổi | Files bị ảnh hưởng | Impact |
|---|---|---|---|
| 149 | Thêm 4 deduction types (TCR) | TS, HS, FS (import) | Parse thêm 4 fields mới |
| 153 | Quebec Joint Account restriction | TFS, NFU (export) | Validate trước khi gửi CO |
| 155 | Client Name Fee Redemptions | TFS (export), TS (import) | Mở rộng AcctDesig=1 cho fee redemption |
| 158 | PS Terminated funds | PS (import) | Xử lý thêm category Terminated |
| 163 | Successor Annuitant RRIF/FHSA | NFU (export), NS (import) | Mở rộng AddSucsr cho RRIF/FHSA |
| 178 | Product Type: +Bullion, -ETF/-Other | FD, MD (import) | Cập nhật dropdown/validation |
| 180 | FD Custom Date 2→10 | FD (import) | Parse thêm 8 custom date fields |
| 183 | GS Amount 2→4 decimals | GS (import) | Đổi precision parsing |
