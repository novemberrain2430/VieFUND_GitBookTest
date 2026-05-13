# Phân tích: Tạo file phản hồi FundServ giả lập (Mock Response Files)

## Kết luận: **CÓ THỂ** tạo file phản hồi giả lập

Hệ thống **hoàn toàn hỗ trợ** việc đặt file XML giả lập vào thư mục `FILE_PATH` (thư mục IN) để VieFUNDIE service tự động pick up và import. Pipeline import hoạt động dựa trên **file-based polling** — service chỉ quét thư mục tìm file theo pattern, không quan tâm nguồn gốc file.

---

## 1. Kiến trúc Import Pipeline

### Entry Point

```
VieFUNDIE :: OnTimer() (mỗi ~60s)
└── FFImport.ProcessAllX()
    ├── GetFirstFileNameX()  — Quét thư mục FILE_PATH tìm file theo pattern
    │   └── File pattern: "{FileCode}*.{YYYYMMDD}*" (ví dụ: "DR*.20260430*")
    │
    ├── ImportXMLFile()  — Dispatch theo FileCode
    │   ├── DR/CK/WR/VR → COrder.ImportXML()  ← TFS response
    │   ├── XR/XK/UR    → CXM.ImportXML()     ← NFU response  
    │   ├── TSP/HSP/FST  → CAT.ImportXML()     ← TS/HS/FS files
    │   ├── FD/MD/ZD    → CFD.ImportXML()      ← Fund Definition
    │   ├── RSP         → CAP.ImportXML()      ← Price files
    │   ├── NSP/PSP     → CAA.ImportXML()      ← NS/PS files
    │   ├── SSP/WSP     → CAW.ImportXML()      ← Commission files
    │   ├── CSP/CST     → CTCRFile.ImportXML() ← TCR files
    │   └── BSP/BST     → CBS.ImportXML()      ← Balance Sheet
    │
    └── MoveFile() — Sau import:
        ├── Success → Imported/{SubDir}/{YYYY}/{MM}/{DD}/
        ├── Error   → Error/
        └── Skip    → Skipped/
```

### Quan trọng: File Discovery Logic

Từ `FFImport.GetFirstFileNameX()` (L1240+), service tìm file bằng cách:

1. Lấy danh sách `FileCodeList` từ DB (SP: `UBFSFileCodeList`)
2. Mỗi FileCode có pattern tìm kiếm: `{FileCode}*.{datepart}*`
3. Kiểm tra file có thể đọc được (`TestFile()`)
4. Nếu DB name chứa "TEST", cũng tìm thêm `FileCodeTest` pattern

**→ Chỉ cần đặt file đúng naming convention vào thư mục FILE_PATH là service sẽ tự pick up.**

---

## 2. Hai loại Response chính cần giả lập

### 2.1 DR Response — Phản hồi TFS (Order Response)

**File Code**: `DR` (hoặc `CK`, `WR`, `VR`)  
**Handler**: `COrder.ImportXML()` (COrder.cs L168)  
**SP xử lý**: `UBXMLRecOrderRespnProcess`  
**Record Def**: `UBXMLRecDefDR`

#### Cấu trúc XML — DR Response (OrdSet)

```xml
<?xml version="1.0" encoding="UTF-8"?>
<OrdSet xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" 
        xmlns="tfs" xsi:schemaLocation="tfs tfs.xsd" Version="35">
  <Msg>
    <MsgCreate>
      <Src>
        <DlrCode>1234</DlrCode>          <!-- Manufacturer dealer code -->
      </Src>
      <Target>
        <DlrCode>5678</DlrCode>          <!-- YOUR dealer code -->
      </Target>
    </MsgCreate>
    <Ntwrk>
      <OrdID>ORD123456789</OrdID>        <!-- FundServ assigned Order ID -->
      <TradeDate>20260430</TradeDate>
      <SettlDate>20260502</SettlDate>
    </Ntwrk>
    <MsgType>
      <OrdRspn>
        <ActnCode>PUR</ActnCode>          <!-- PUR/RED/SW/TFR -->
        <SrcID>SRC00001</SrcID>           <!-- Source ID from original order -->
        <FundAcctID>ACCT12345</FundAcctID>
        <OrdID>ORD123456789</OrdID>
        <TradeDate>20260430</TradeDate>
        <SettlDate>20260502</SettlDate>
        <RtnCode>00</RtnCode>             <!-- 00=Accept, 01+=Reject -->
        <RspnSrc>M</RspnSrc>             <!-- M=Manufacturer, N=Network -->
        <DlrCode>5678</DlrCode>

        <!-- Chỉ khi RtnCode != 00 (Rejected) -->
        <!-- <Reject>
          <ErrorCode>E001</ErrorCode>
          <ErrorCode>E002</ErrorCode>
        </Reject> -->
      </OrdRspn>
    </MsgType>
  </Msg>
</OrdSet>
```

#### Import Flow

```
COrder.ImportXML() (L168)
├── CXML.GetXmlStream()       — Đọc file XML
├── FFImport.SaveMSGResponse() — Lưu raw XML vào DB
├── ImportXMLResp()            — Parse root element:
│   ├── <OrdSet>  → ImportXMLOrderResponse()
│   │   ├── GetRecordDef("UBXMLRecDefDR") — Lấy field definitions
│   │   ├── Foreach <Msg>:
│   │   │   └── ImportXMLGetOne() — Parse MsgCreate/Ntwrk/MsgType
│   │   │       ├── ImportXMLMsgCreate() — Parse Src/Target DlrCode
│   │   │       ├── ImportXMLNtwrk()     — Parse OrdID/TradeDate/SettlDate
│   │   │       └── ImportXMLMsgType()   — Parse OrdRspn
│   │   │           └── ImportXMLOrdRspn() — Parse ActnCode/SrcID/RtnCode...
│   │   │               ├── nếu <Reject> → ImportXMLGetReject()
│   │   │               └── nếu <Warning> → ImportXMLGetReject()
│   │   └── ImportXMLOrderProcess()
│   │       └── SP: "UBXMLRecOrderRespnProcess" ← CẬP NHẬT STATUS ORDER
│   │           └── Return: iImportStatus (0=updated, 1=added, 2=skipped, 3=error)
│   │
│   └── <ErrorSet> → ProcessXMLErrorSet()
│       └── GetErrorSet() — Parse NtwrkError
│           ├── ErrorCode 98+003 → DB busy, retry
│           └── ErrorCode 99    → Schema error
│               └── SP: "UBXMLRecOrderRespnProcessError"
│
└── FFImport.ImportFileEnd() — SP: "UBFF_End" — Cập nhật status file import
```

### 2.2 XR Response — Phản hồi NFU (Non-Financial Update Response)

**File Code**: `XR` (hoặc `XK`, `UR`)  
**Handler**: `CXM.ImportXML()` (CXM.cs L151)  
**SP xử lý**: `UBXMLRecNFURespnProcess`  
**Record Def**: `UBXMLRecDefXR`

#### Cấu trúc XML — XR Response (MessageSet)

```xml
<?xml version="1.0" encoding="UTF-8"?>
<MessageSet xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" 
            xmlns="nfu" xsi:schemaLocation="nfu nfu.xsd" Version="35">
  <Msg>
    <MsgCreate>
      <Src>
        <DlrCode>1234</DlrCode>          <!-- Manufacturer -->
      </Src>
      <Target>
        <DlrCode>5678</DlrCode>          <!-- YOUR dealer code -->
      </Target>
    </MsgCreate>
    <MsgType>
      <Rspn>
        <ActnCode>NEW</ActnCode>          <!-- NEW/CHG/DEL -->
        <SrcID>NFUSRC001</SrcID>          <!-- Source ID from original NFU -->
        <FundAcctID>ACCT12345</FundAcctID>
        <RtnCode>00</RtnCode>             <!-- 00=Accept, 01+=Reject -->
        <RspnSrc>M</RspnSrc>

        <!-- Chỉ khi RtnCode != 00 -->
        <!-- <Reject>
          <ErrorCode>E100</ErrorCode>
        </Reject> -->
      </Rspn>
    </MsgType>
  </Msg>
</MessageSet>
```

---

## 3. Về T+1 và thời điểm tạo mock file

> [!IMPORTANT]
> **T+1 là quy trình nghiệp vụ phía Manufacturer, KHÔNG phải validation kỹ thuật trong import pipeline.**

Trong thực tế, luồng T+1 hoạt động như sau:

| Thời điểm | Sự kiện |
|---|---|
| **Ngày T** | Dealer gửi CO file (lệnh mua/bán) → FundServ → Manufacturer |
| **Cuối ngày T** | Manufacturer tính NAV, xử lý giao dịch |
| **Ngày T+1** | Manufacturer gửi DR/TS response về → FundServ → Dealer |

Tuy nhiên, khi kiểm tra code import (`COrder.ImportXMLOrdRspn()` L577-640):

- `TradeDate` và `SettlDate` được **đọc từ XML** và truyền thẳng vào SP
- **Không có validation ngày** ở C# layer — không check T+1, không so sánh với ngày gửi order
- SP `UBXMLRecOrderRespnProcess` nhận ngày từ XML và lưu trực tiếp

**→ Mock file hoạt động ngay lập tức, không cần đợi T+1.** Bạn tự điền `TradeDate`/`SettlDate` hợp lý trong XML là đủ.

### Gợi ý giá trị ngày cho mock file

```xml
<!-- Giả sử tạo order ngày 2026-04-30 -->
<TradeDate>20260430</TradeDate>    <!-- Ngày trade = ngày gửi order -->
<SettlDate>20260502</SettlDate>    <!-- Settlement = T+2 (bỏ qua weekend) -->
```

Quy trình test không bị ảnh hưởng bởi T+1 vì:
1. Bạn **tự tạo** file response (thay vì đợi Manufacturer)
2. Bạn **tự điền** ngày trong XML
3. Import pipeline **không enforce** business rules về timing
4. SP chỉ match response với order gốc qua `SrcID` + `DlrCode`

---

## 4. Cách tạo file giả lập (Step-by-step)

### Bước 1: Xác định thư mục FILE_PATH

```sql
-- Tìm thư mục nhận file
EXEC UBVieFundIESettingsGet @DSID=1001, @TopicStr='Service'
-- Tìm row FILE_PATH → ví dụ: C:\VieFUND\FF\IN\
```

Hoặc xem trong `VieFUNDIE/App.config` hoặc Registry.

### Bước 2: Xác định thông tin order gốc

```sql
-- Tìm orders đang ở status "Waiting" hoặc "Sent" (cần response)
EXEC UBOrderPendingList 
    @iUserID = 1,
    @Lg = 0,
    @iOrderStatus = 2,     -- 2 = Waiting/Sent
    @DealerCode = '5678',
    @iPageSize = 100,
    @iPage = 0,
    @iOptions = 0,
    @iNetwork = 0

-- Kết quả chứa: OrderID, SrcID, FundAcctID, ActnCode, DealerCode
```

### Bước 3: Tạo mock DR file (Order Response)

**Naming convention**: `DR{DealerCode}FSRV.{YYYYMMDD}XXX9.Z01`

Ví dụ: `DR5678FSRV.20260430AAA9.Z01`

```xml
<?xml version="1.0" encoding="UTF-8"?>
<OrdSet xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" 
        xmlns="tfs" xsi:schemaLocation="tfs tfs.xsd" Version="35">
  <Msg>
    <MsgCreate>
      <Src>
        <DlrCode>MFR001</DlrCode>
      </Src>
      <Target>
        <DlrCode>5678</DlrCode>
      </Target>
    </MsgCreate>
    <MsgType>
      <OrdRspn>
        <ActnCode>PUR</ActnCode>
        <SrcID>SRC00001</SrcID>
        <FundAcctID>ACCT12345</FundAcctID>
        <OrdID>MOCK-ORD-001</OrdID>
        <TradeDate>20260430</TradeDate>
        <SettlDate>20260502</SettlDate>
        <RtnCode>00</RtnCode>
        <RspnSrc>M</RspnSrc>
        <DlrCode>5678</DlrCode>
      </OrdRspn>
    </MsgType>
  </Msg>
</OrdSet>
```

### Bước 4: Tạo mock XR file (NFU Response)

**Naming convention**: `XR{DealerCode}FSRV.{YYYYMMDD}XXX9.Z01`

Ví dụ: `XR5678FSRV.20260430AAA9.Z01`

```xml
<?xml version="1.0" encoding="UTF-8"?>
<MessageSet xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" 
            xmlns="nfu" xsi:schemaLocation="nfu nfu.xsd" Version="35">
  <Msg>
    <MsgCreate>
      <Src>
        <DlrCode>MFR001</DlrCode>
      </Src>
      <Target>
        <DlrCode>5678</DlrCode>
      </Target>
    </MsgCreate>
    <MsgType>
      <Rspn>
        <ActnCode>NEW</ActnCode>
        <SrcID>NFUSRC001</SrcID>
        <FundAcctID>ACCT12345</FundAcctID>
        <RtnCode>00</RtnCode>
        <RspnSrc>M</RspnSrc>
      </Rspn>
    </MsgType>
  </Msg>
</MessageSet>
```

### Bước 5: Đặt file vào thư mục và đợi service

1. Copy file mock vào `FILE_PATH` (thư mục IN)
2. Đợi VieFUNDIE service poll (60 giây)
3. Kiểm tra:
   - Event Log: `Windows Event Viewer → Application → source "VieFundIE"`
   - File đã move vào `Imported/TRX/` (success) hoặc `Error/` (lỗi)
   - DB: order status đã thay đổi

### Bước 6: Verify trong DB

```sql
-- Xem file import history
EXEC UBFF_List @iOptions=0, @iPageSize=50, @iPage=0

-- Xem order status đã thay đổi chưa
-- (Sau khi DR import, order phải chuyển từ Waiting → Confirmed/Rejected)
```

---

## 5. Các kịch bản test quan trọng

### 5.1 Accept (RtnCode=00)

```xml
<RtnCode>00</RtnCode>
<RspnSrc>M</RspnSrc>
<!-- Không có <Reject> -->
```
**Kỳ vọng**: Order status → Confirmed

### 5.2 Reject (RtnCode=01+)

```xml
<RtnCode>01</RtnCode>
<RspnSrc>M</RspnSrc>
<Reject>
  <ErrorCode>E001</ErrorCode>
  <ErrorCode>E002</ErrorCode>
</Reject>
```
**Kỳ vọng**: Order status → Rejected, error codes lưu trong DB

### 5.3 Warning

```xml
<RtnCode>00</RtnCode>
<RspnSrc>M</RspnSrc>
<Warning>
  <ErrorCode>W001</ErrorCode>
</Warning>
```
**Kỳ vọng**: Order status → Confirmed (nhưng có warning)

### 5.4 Network Error (ErrorSet)

```xml
<?xml version="1.0" encoding="UTF-8"?>
<ErrorSet>
  <NtwrkError>
    <RspnSrc>N</RspnSrc>
    <RtnCode>99</RtnCode>
    <ErrorCode>999</ErrorCode>
    <CorrlatnID>414D51...</CorrlatnID>
  </NtwrkError>
</ErrorSet>
```
**Kỳ vọng**: SP `UBXMLRecOrderRespnProcessError` được gọi

### 5.5 Multiple Msg records

```xml
<OrdSet ...>
  <Msg><!-- Accept order 1 --></Msg>
  <Msg><!-- Reject order 2 --></Msg>
  <Msg><!-- Accept order 3 --></Msg>
</OrdSet>
```
**Kỳ vọng**: Mỗi Msg xử lý độc lập, batch lên đến 100 records/lần

---

## 6. Lưu ý quan trọng khi test

> [!CAUTION]
> **KHÔNG CHẠY TRÊN MÔI TRƯỜNG PRODUCTION!**
> Mock files sẽ thay đổi trạng thái order thật trong DB.

> [!IMPORTANT]
> - **DealerCode**: Phải khớp với dealer code trong hệ thống test
> - **SrcID**: Phải khớp với Source ID của order gốc — đây là key để SP match response với order
> - **File naming**: Pattern phải đúng để service nhận diện (ví dụ: `DR` prefix cho TFS response)
> - **Version**: XML Version phải khớp với version hiện tại (35, sắp tới 36)
> - **Encoding**: UTF-8

> [!TIP]
> - Backup DB trước khi test
> - Dùng SQL Profiler để xem chính xác SP nào được gọi khi service import
> - Kiểm tra `UBXMLRecDefDR` và `UBXMLRecDefXR` trong DB để biết chính xác field mapping
> - Check thư mục `Error/` nếu file không được import

---

## 7. Stored Procedures quan trọng trong luồng import

| SP | Mục đích | Gọi bởi |
|---|---|---|
| `UBFF_Add` | Đăng ký file mới vào DB, trả về FileID | `FFImport.GetFileID()` |
| `UBFF_End` | Cập nhật status file sau import | `FFImport.ImportFileEnd()` |
| `UBXMLRecDefDR` | Lấy field definitions cho DR response | `COrder.ImportXMLOrderResponse()` |
| `UBXMLRecDefXR` | Lấy field definitions cho XR response | `CXM.ImportXMLResponse()` |
| `UBXMLRecOrderRespnProcess` | **Xử lý DR response → cập nhật order status** | `COrder.ImportXMLOrderProcess()` |
| `UBXMLRecOrderRespnProcessError` | Xử lý network error | `COrder.ImportXMLOrderProcessError()` |
| `UBXMLRecNFURespnProcess` | **Xử lý XR response → cập nhật NFU status** | `CXM.ImportXMLProcess()` |
| `UBFSFileCodeList` | Danh sách file codes + search patterns | `FFImport.GetFileCodeList()` |

---

## 8. Source code tham chiếu

| File | Vị trí | Vai trò |
|---|---|---|
| `UBFFImport/FFImport.cs` | `ProcessAllX()` L1712 | Entry point — quét thư mục, dispatch theo FileCode |
| `UBFFImport/FFImport.cs` | `ImportXMLFile()` L2389 | Dispatch XML files theo FileCode |
| `UBFFImport/FFImport.cs` | `GetFirstFileNameX()` L1240 | File discovery — matching patterns |
| `UBFFImport/COrder.cs` | `ImportXML()` L168 | Parse DR/CK/WR/VR response XML |
| `UBFFImport/COrder.cs` | `ImportXMLResp()` L323 | Detect OrdSet vs ErrorSet |
| `UBFFImport/COrder.cs` | `ImportXMLOrdRspn()` L577 | Parse individual order response fields |
| `UBFFImport/COrder.cs` | `ImportXMLOrderProcess()` L759 | Gọi SP cập nhật DB |
| `UBFFImport/CXM.cs` | `ImportXML()` L151 | Parse XR/XK/UR response XML |
| `UBFFImport/CXM.cs` | `ImportXMLResponse()` L207 | Parse MessageSet response |
| `UBFFImport/CXM.cs` | `ImportXMLProcess()` L576 | Gọi SP cập nhật DB |
| `VieFUNDIE/VieFUNDIE.cs` | `OnTimer()` L654 | Timer loop gọi import |
