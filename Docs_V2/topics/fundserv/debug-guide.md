# Debug Guide: TFS/NFU File Generation Flow

Hướng dẫn từng bước tạo file TFS (Order) và NFU (Non-Financial Update) gửi FundServ — từ giao diện đến file output — phục vụ debug và kiểm tra.

---

## Mục lục

1. [TFS — Tạo Order File từ A đến Z](#1-tfs--tạo-order-file)
2. [NFU — Tạo NFU File từ A đến Z](#2-nfu--tạo-nfu-file)
3. [Kiểm tra Output File](#3-kiểm-tra-output-file)
4. [Debug Breakpoints](#4-debug-breakpoints)
5. [SQL Queries kiểm tra trạng thái](#5-sql-queries-kiểm-tra-trạng-thái)
6. [Troubleshooting](#6-troubleshooting)

---

## 1. TFS — Tạo Order File

### Bước 1: Tạo Order (UI)

**Page**: `PopupTradeAdd.aspx`  
**Code-behind**: `WebApp/Main/PopupTradeAdd.aspx.cs`

1. Mở client profile → click **"Trade"** hoặc **"Order Entry"**
2. Chọn Plan + Account từ dropdown
3. Chọn loại lệnh (tab):
   - **Buy** — mua fund
   - **Sell** — bán/rút fund
   - **Switch** — chuyển đổi giữa các fund
   - **Transfer** — chuyển ra ngoài dealer
   - **ICT** — Inter-Company Transfer
4. Điền thông tin lệnh (amount, settlement method, etc.)
5. Click **"Add Trade"** button

**Code flow khi click Add Trade:**
```
PopupTradeAdd.aspx.cs :: OnAddTrade() (L4237)
├── switch(hdActionType.Value)
│   ├── "Buy"     → OnBuy()      (L2985)
│   ├── "Sell"    → OnSell()
│   ├── "Switch"  → OnSwitch()
│   ├── "Transfer"→ OnTransfer()
│   └── "ICT"     → OnICT()
└── Mỗi method gọi SP "UBOrderAdd" hoặc tương tự
    → Tạo record trong bảng Orders với status = "Pending"
```

> **Debug**: Breakpoint tại `OnAddTrade()` (L4237) để xem action type, sau đó step into `OnBuy()` etc.

### Bước 2: Tag và Generate Order (UI)

**Page**: `PopupOrderBatch.aspx`  
**Code-behind**: `WebApp/Main/PopupOrderBatch.aspx.cs`

1. Mở **Order Entry** page (từ menu chính)
2. Tab **"Pending"** → hiện danh sách orders chờ gửi
3. Chọn **Dealer Code** và **Network** (FundServ=default, Manual=2, ETF=4)
4. **Tag** (checkbox) các orders cần gửi → gọi `CTrx.OrderPendingSelectionUpdate()` (SP: `UBOrderSelectionUpdate`)
5. Chọn mode:
   - **Real-time**: radio `rdModeRT` — gửi ngay qua MQ
   - **Batch**: radio `rdModeBatch` — đợi service poll
6. Click **"Generate Order"** → `OnGenerateOrderFile()` (L295)
   - Hiện confirm dialog
7. Click OK → `OnGenerateOrderFileBtn()` (L320)

**Code flow khi confirm:**
```
PopupOrderBatch.aspx.cs :: OnGenerateOrderFileBtn() (L320)
├── if(network == FundServ)
│   └── CTrx.OrderPendingMove2Waiting() 
│       → SP: "UBOrderWaiting2SendAdd"
│       → Chuyển tagged orders → status = "Waiting"
│       → Return: iCount (số order), iCountFailed, ErrorMSG
├── if(network == Manual/2)
│   └── CTrx.OrderPending2Confirm()
│       → SP: "UBOrderSetConfirmTaggedItems"
└── if(network == ETF/4)
    └── CTrx.OrderPendingMove2BBS()
        → SP: "UBOrderWaiting2BBSOrder"
```

**Stored Procedures quan trọng:**

| SP Name | Chức năng |
|---------|-----------|
| `UBOrderPendingList` | Load danh sách pending |
| `UBOrderSelectionUpdate` | Tag/untag orders |
| `UBOrderWaiting2SendAdd` | Chuyển Pending → Waiting |
| `UBOrderCreateFile` | Tạo XML body cho file |
| `UBOrderFileUpdateStatus` | Cập nhật status sau khi ghi file |

> **Debug**: Breakpoint tại `OnGenerateOrderFileBtn()` (L320). Xem giá trị `iMode`, `iNetwork`, `iCount`.

### Bước 3: Service tạo file (VieFUNDIE)

**File**: `VieFUNDIE/VieFUNDIE.cs`  

Service chạy nền, poll mỗi ~60 giây:

```
OnTimer() (L654)
├── GetDBIDStr() — lấy DB connection
├── LoadSettings(DSID) — load paths (FILE_PATH_UPLOAD etc.)
├── IsIgnore(dtServer) — check schedule (no-run times)
├── COrder.OrderFileGenerate() (L754)    ← TFS
│   └── [xem bước 3a]
├── Thread.Sleep(100)
├── CXM.FileGenerate() (L758)           ← NFU
│   └── [xem bước NFU]
├── Thread.Sleep(100)
├── CannexOrder.OrderFileGenerate()      ← GIC
└── FFImport.ProcessAllX()               ← Import response files
```

### Bước 3a: COrder.OrderFileGenerate()

**File**: `UBFFImport/COrder.cs` → `OrderFileGenerate()` (L86)

```
OrderFileGenerate(AppID, ComputerName, eLog, DBIDStr, DSID, FileUploadPath)
│
├── GetFSVersion(32)           → xác định version (hiện: 35)
│
├── db.SetSP("UBOrderCreateFile")
│   db.AddParam("iOptions", 0)
│   db.ExecuteSQL()
│
├── while(db.Read())           → loop qua các file cần tạo
│   ├── FileName    = db.GetStr("FileName")     // e.g. "CO_1274_20260430_001.xml"
│   ├── OrderMSG    = db.GetStr("OrderMSG")     // XML body string
│   ├── iVersion    = db.GetInt32("iVersion")   // 35
│   ├── bLTI        = db.GetBool("bLTI")        // LTI namespace flag
│   └── iFileID     = db.GetInt32("iFileID")
│
├── OrderFileCreate(FileUploadPath, FileName, OrderMSG, iVersion, bLTI)
│   ├── Gọi OrderMsgCreate() → wrap XML body:
│   │   <?xml version="1.0" encoding="UTF-8"?>
│   │   <OrdSet xmlns="tfs" ... Version="35">
│   │     {OrderMSG body}
│   │   </OrdSet>
│   ├── FileStream → ghi ra: {FileUploadPath}\{FileName}
│   └── Return true/false
│
└── if(success && iFileID > 0)
    └── SP: "UBOrderFileUpdateStatus" → iStatus = 1 (đã ghi file)
```

> **Debug**: Breakpoint tại `OrderFileGenerate()` (L86). Kiểm tra `FileUploadPath` có đúng không, `FileContentStr` có data không.

---

## 2. NFU — Tạo NFU File

### Bước 1: Tạo NFU record (UI)

NFU records được tạo từ nhiều page khác nhau:

| Page | File | Khi nào |
|------|------|---------|
| Plan Add | `PopupPlanAdd.aspx.cs` | Tạo account mới, đổi successor |
| Account Add | `PopupAccountAdd.aspx.cs` | Thay đổi account attributes |
| TFSA Edit | `PanelTFSAEdit.aspx.cs` | Chỉnh sửa TFSA successor |
| Beneficiary | `PanelPlanBenAdd.aspx.cs` | Thêm/sửa beneficiary |
| Client Edit | Nhiều pages | Đổi tên, địa chỉ client |

Tất cả đều gọi:
```
CNFU.AddNFU(DBIDStr, DSIDStr, iUserID, iLinkedID, iLinkedType, ...)
→ SP: "UBNFUAdd"
→ Tạo record NFU với status = "Pending"
```

**Code**: `UBClasses/NFU.cs` → `AddNFU()` (L458)

### Bước 2: Tag và Generate NFU (UI)

**Page**: `PopupOrderBatch.aspx` — Tab **"NFU"** (index 2)

1. Chọn loại NFU cần gửi (checkboxes):
   - `chNFUClientName` — Client Name change
   - `chNFUClientAddress` — Address change
   - `chNFUNewAcct` — New Account setup
   - `chNFUBeneficiary` — Beneficiary update
   - `chNFUAcctAttr` — Account Attributes
   - `chNFUDistributionOpt` — Distribution Options
   - `chNFUAddPAC` — Pre-Authorized Chequing
   - `chNFUAdvisorInfo` — Advisor Info
   - `chNFUDeactivateAdvisor` — Deactivate Advisor
   - `chNFURepTransfer` — Rep Transfer
   - `chNFUFATCA` — FATCA reporting
   - `chNFUAddModFee` — Fee modification
   - `chNFUAddModCDIC` — CDIC
2. **Tag** items → `CNFU.PendingSelectionUpdate()` (SP: `UBNFUSelectionUpdate`)
3. Click **"Generate NFU"** → `OnGenerateNFUFile()` (L873)

**Code flow:**
```
PopupOrderBatch.aspx.cs :: OnGenerateNFUFile() (L873)
└── CNFU.PendingMove2Waiting(DBIDStr, DSIDStr, iUserID, ...)
    → SP: "UBNFUPendingMove2Waiting"
    → Chuyển tagged NFUs → status = "Waiting"
    → Return: iCount
```

**Stored Procedures quan trọng:**

| SP Name | Chức năng |
|---------|-----------|
| `UBNFUPendingList` | Load danh sách NFU pending |
| `UBNFUSelectionUpdate` | Tag/untag NFU items |
| `UBNFUPendingMove2Waiting` | Chuyển Pending → Waiting |
| `UBNFUAdd` | Tạo NFU record mới |
| `UBNFUCreateFile` | Tạo XML body cho file |

### Bước 3: Service tạo file (VieFUNDIE)

**File**: `UBFFImport/CXM.cs` → `FileGenerate()` (L77)

```
FileGenerate(AppID, ComputerName, eLog, DBIDStr, DSID, FileUploadPath)
│
├── iDefVersion = COrder.GetFSVersion(35)
│
├── db.SetSP("UBNFUCreateFile")
│   db.AddParam("iOptions", 0)
│   db.ExecuteSQL()
│
├── while(db.Read())
│   ├── FileName    = db.GetStr("FileName")     // e.g. "NFU_1274_20260430_001.xml"
│   ├── MSG         = db.GetStr("MSG")          // XML body
│   ├── iVersion    = db.GetInt32("iVersion")   // 35
│   └── iFileID     = db.GetInt32("iFileID")
│
└── NFUFileCreate(FileUploadPath, FileName, MSG, iVersion)
    ├── Version capping:
    │   if(iVersion < 34) iVersion = 34
    │   if(dtToday >= 2025-09-06) iVersion = 35
    ├── Wrap XML:
    │   <?xml version="1.0" encoding="UTF-8"?>
    │   <MessageSet xmlns="nfu" ... Version="35">
    │     {MSG body}
    │   </MessageSet>
    └── FileStream → ghi ra: {FileUploadPath}\{FileName}
```

---

## 3. Kiểm tra Output File

### Tìm Output Directory

Có 3 cách xác định thư mục output:

**Cách 1: Từ WebApp**
- Mở `PopupFundServ.aspx` → field `idFundServUploadPath`
- Thường là: `\\<server>\VieFUND\FF\OUT\` hoặc `C:\VieFUND\FF\OUT\`

**Cách 2: Từ VieFUNDIE App.config**
- File: `VieFUNDIE/App.config` → key `FILE_PATH` 
- Hoặc check DB: SP `GetVieFundIESettings` trả về `FILE_PATH_UPLOAD`

**Cách 3: Từ DB**
```sql
-- Check settings lưu trong DB
EXEC dbo.UBVieFundIESettingsGet @DSID=1001, @TopicStr='Service'
-- Look for FILE_PATH_UPLOAD row
```

### Verify File Content

Sau khi generate, check thư mục OUT cho file mới:

**TFS file** (ví dụ `CO_1274_20260430_001.xml`):
```xml
<?xml version="1.0" encoding="UTF-8"?>
<OrdSet xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" 
        xmlns="tfs" xsi:schemaLocation="tfs tfs.xsd" Version="35">
  <Msg>
    <MsgCreate>...</MsgCreate>
    <MsgType>
      <OrdEntry>
        <BuyFund>...</BuyFund>
      </OrdEntry>
    </MsgType>
  </Msg>
</OrdSet>
```

**NFU file** (ví dụ `NFU_1274_20260430_001.xml`):
```xml
<?xml version="1.0" encoding="UTF-8"?>
<MessageSet xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" 
            xmlns="nfu" xsi:schemaLocation="nfu nfu.xsd" Version="35">
  <Msg>
    <MsgCreate>...</MsgCreate>
    <MsgType>
      <Reqst>
        <AcctSetup>...</AcctSetup>
      </Reqst>
    </MsgType>
  </Msg>
</MessageSet>
```

---

## 4. Debug Breakpoints

### Recommended Breakpoints cho TFS

| # | File | Method | Line | Mục đích |
|---|------|--------|------|----------|
| 1 | `PopupTradeAdd.aspx.cs` | `OnAddTrade()` | L4237 | Xem order data trước khi save |
| 2 | `PopupOrderBatch.aspx.cs` | `OnGenerateOrderFileBtn()` | L320 | Xem mode, network, count |
| 3 | `Trx.cs` | `OrderPendingMove2Waiting()` | L3968 | Xem SP params & result |
| 4 | `COrder.cs` | `OrderFileGenerate()` | L86 | Xem XML body từ SP |
| 5 | `COrder.cs` | `OrderFileCreate()` | L50 | Xem file path & content trước khi ghi |
| 6 | `COrder.cs` | `OrderMsgCreate()` | L32 | Xem version & envelope XML |
| 7 | `VieFUNDIE.cs` | `OnTimer()` | L754 | Service poll — xem có gọi không |

### Recommended Breakpoints cho NFU

| # | File | Method | Line | Mục đích |
|---|------|--------|------|----------|
| 1 | `NFU.cs` | `AddNFU()` | L458 | Xem NFU data khi tạo |
| 2 | `PopupOrderBatch.aspx.cs` | `OnGenerateNFUFile()` | L873 | Xem count move to waiting |
| 3 | `NFU.cs` | `PendingMove2Waiting()` | L282 | Xem SP result |
| 4 | `CXM.cs` | `FileGenerate()` | L77 | Xem XML body từ SP |
| 5 | `CXM.cs` | `NFUFileCreate()` | L36 | Xem file path & version |
| 6 | `VieFUNDIE.cs` | `OnTimer()` | L758 | Service poll cho NFU |

### Debug VieFUNDIE Service

Service chạy dưới dạng Windows Service → không attach debugger trực tiếp được.

**Cách 1: Chạy Console mode** (dev only)
```
VieFundIE.exe  (chạy trực tiếp từ cmd)
```

**Cách 2: Attach to Process**
1. Build VieFUNDIE trong Debug mode
2. Start service: `net start VieFundIE`
3. Visual Studio → Debug → Attach to Process → `VieFundIE.exe`
4. Đặt breakpoint tại `OnTimer()` (L654)

**Cách 3: Check Event Log**
- Windows Event Viewer → Application → source "VieFundIE"
- Hoặc check trong DB: service ghi log via `CDatabase.StoreEventLog()`

---

## 5. SQL Queries kiểm tra trạng thái

### Check Orders đang Pending
```sql
-- Xem tất cả orders đang chờ gửi
EXEC UBOrderPendingList 
    @iUserID = <userID>,
    @Lg = 0,
    @iOrderStatus = 1,     -- 1=Pending, 2=Waiting
    @DealerCode = '<code>',
    @iPageSize = 100,
    @iPage = 0,
    @iOptions = 0,
    @iNetwork = 0
```

### Check Orders đã chuyển sang Waiting
```sql
-- Xem orders đã tagged và waiting
EXEC UBOrderPendingList 
    @iUserID = <userID>,
    @Lg = 0,
    @iOrderStatus = 2,     -- Waiting to send
    @DealerCode = '<code>',
    @iPageSize = 100,
    @iPage = 0,
    @iOptions = 0,
    @iNetwork = 0
```

### Preview XML sẽ được tạo
```sql
-- Chạy SP tạo file (read-only test)
EXEC UBOrderCreateFile @iOptions = 0
-- Returns: FileName, OrderMSG (XML body), iVersion, bLTI, iFileID
```

### Check NFU Pending
```sql
EXEC UBNFUPendingList
    @iUserID = <userID>,
    @Lg = 0,
    @DealerCode = '<code>',
    @iPageSize = 100,
    @iPage = 0,
    @iOptions = 0,
    @bClientName = 1,
    @bClientAddress = 1,
    @bNewAcct = 1
-- Thêm các flags @bXXX tùy loại NFU cần check
```

### Check File đã tạo trong DB
```sql
-- Xem lịch sử file đã generate
EXEC UBOrderHistoryList
    @iUserID = <userID>,
    @Lg = 0,
    @iPageSize = 50,
    @iPage = 0,
    @iOptions = 0,
    @DealerCode = '<code>'
```

### Check VieFUNDIE Service Settings
```sql
-- Xem service config (file paths)
EXEC UBVieFundIESettingsGet @DSID=1001, @TopicStr='Service'
-- Look for: FILE_PATH_UPLOAD → thư mục output
```

---

## 6. Troubleshooting

### File không được tạo ra

| Nguyên nhân | Cách check | Fix |
|-------------|------------|-----|
| Service không chạy | `sc query VieFundIE` | `net start VieFundIE` |
| Thư mục OUT không tồn tại | Check `FILE_PATH_UPLOAD` in DB | Tạo folder |
| IsIgnore() return true | Check time/day vs no-run schedule | Chờ đúng giờ hoặc set `TEST_RUN=Y` |
| No orders in Waiting status | Query `UBOrderPendingList` @iOrderStatus=2 | Re-generate từ UI |
| SP trả về empty | Run `UBOrderCreateFile` manually | Check SP logic |
| Permission denied | Check folder write permission for service account | Grant NTFS permissions |

### Order không hiện trong Pending list

| Nguyên nhân | Cách check |
|-------------|------------|
| Wrong dealer code selected | Check `cbDealerCodeList` giá trị |
| Order status sai | Check `cbOrderStatus2Send` value |
| Different network | Check `cbNetwork` selected value |
| User permission | Check `CMember.IsFundServCOFile()` |

### XML version sai

Check `COrder.GetFSVersion()` (COrder.cs L20):
```csharp
// Hiện tại:
if (iVersion < 34) iVersion = 34;
if (iVersion <= 34) {
    if (DateTime.Now >= new DateTime(2025, 9, 6)) iVersion = 35;
}
// V36 chưa có → cần thêm cutoff cho V36
```

Và `CXM.NFUFileCreate()` (CXM.cs L36):
```csharp
if (iVersion < 34) iVersion = 34;
if (iVersion <= 34) {
    if (DateTime.Now >= new DateTime(2025, 9, 6)) iVersion = 35;
}
// Tương tự — cần thêm V36 cutoff
```

### Response file không import

1. Check thư mục IN (`m_FilePath`): có file DR/XR mới không?
2. Check Event Log: tìm error entries từ "VieFundIE"
3. Check `FFImport.ProcessAllX()` trong `VieFUNDIE.cs` (L787)
4. Check `COrder.ImportXML()` và `CXM.ImportXML()` cho parse errors

---

## Quick Reference: File Lifecycle

```
                    ┌──── PopupTradeAdd.aspx ────┐
                    │  OnBuy/OnSell/OnSwitch()   │
                    │  → SP: UBOrderAdd          │
                    │  → status = "Pending"       │
                    └─────────────┬───────────────┘
                                  │
                    ┌─────────────▼───────────────┐
                    │  PopupOrderBatch.aspx       │
                    │  Tag orders + Generate      │
                    │  → SP: UBOrderWaiting2Send  │
                    │  → status = "Waiting"       │
                    └─────────────┬───────────────┘
                                  │
                    ┌─────────────▼───────────────┐
                    │  VieFUNDIE :: OnTimer()     │
                    │  → COrder.OrderFileGenerate │
                    │  → SP: UBOrderCreateFile    │
                    │  → OrderFileCreate()        │
                    │  → ghi XML ra FF\OUT\       │
                    │  → SP: UBOrderFileUpdate    │
                    │  → status = "Sent"          │
                    └─────────────┬───────────────┘
                                  │
                    ┌─────────────▼───────────────┐
                    │  FundServ Gateway           │
                    │  Pick up file → transmit    │
                    └─────────────┬───────────────┘
                                  │
                    ┌─────────────▼───────────────┐
                    │  FundServ processes         │
                    │  → Returns DR/XR file       │
                    └─────────────┬───────────────┘
                                  │
                    ┌─────────────▼───────────────┐
                    │  VieFUNDIE :: OnTimer()     │
                    │  → FFImport.ProcessAllX()   │
                    │  → COrder.ImportXML() [DR]  │
                    │  → CXM.ImportXML()   [XR]   │
                    │  → Update DB status         │
                    └─────────────────────────────┘
```
