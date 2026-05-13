# Client Report PDF — Ad-hoc Generation

> Module tạo báo cáo PDF theo yêu cầu (ad-hoc) cho khách hàng — bao gồm toàn bộ pipeline từ lúc user nhấn "Generate" đến khi file PDF được lưu vào DB.
> **Đối tượng**: Developer .NET cần hiểu kiến trúc, thêm loại report mới, hoặc debug vấn đề PDF.

---

## 1. Tổng quan nghiệp vụ

Chức năng "Client Report" cho phép Advisor/Admin in báo cáo đầu tư cho một hoặc nhiều khách hàng cùng lúc. Mỗi lần in tạo ra một **Request** trong DB, một background thread sẽ xử lý bất đồng bộ, tổng hợp PDF cho từng client, sau đó lưu kết quả để user download.

### Các loại report hiện có

| `iReportType` | Tên nghiệp vụ | Hàm BLL |
|---|---|---|
| `1` | Account Statement | `ClientAccountStatementPdfObj` |
| `2` | Investor Statement | `ClientInvestorStatementPdfObj(..., false)` |
| `3` | Asset Mix | `ClientAssetMixPdfObj` |
| `5` | Account Statement + XIRR Since Inception | `ClientAccountStatementPdfObj_XIRR` |
| `6` | Investor Statement (Nominee) | `ClientInvestorStatementPdfObj(..., true)` |
| `7` | Investor Statement + XIRR | `ClientInvestorStatementPdfObj_XIRR` |
| `8` | Account Statement + Capital Gain | `ClientAccountStatementPdfObj_CG` |
| `9` | Account Statement 2015 format | `ClientAccountStatementPdfObj_2015` |
| `10` | Account Statement + Daily Graph | `ClientAccountStatementPdfObj_DailyGraph` |
| `11` | Commission Disclosure | `ClientCommission` |
| `12` | Investment Performance | `ClientInvestmentPerformance` |
| `13` | Account Summary by Supplier | `AccountSummaryBySupplierPdfObj` |
| `14` | Portfolio Performance | `ClientPortfolioPerformance` |
| `50` | Account Statement (Transactions Only) | `ClientAccountStatementPdfObjTrxOnly` |
| `104` | Holding Performance + Portfolio Summary | `ClientHoldingPerformanceAndPortfolioSummary` |

> **Nguồn**: `VieFUNDPdf/ClientReportAdhoc.cs` L55-118

---

## 2. Kiến trúc tổng thể

```
User nhấn "Generate Report"
        │
        ▼
[WebApp] Tạo Request trong DB (SP: UBReportAdd + UBReportRequestTMP)
        │
        ▼
[CReport] StartCreatePdfObjClientReportAdhoc()
        │  (khởi động Thread riêng, Priority = Normal)
        ▼
[CReport] CreatePdfObjClientReportAdhoc()  ← chạy trong background thread
        │
        ├── Đọc metadata từ DB: SP UBReportRequestTMP
        │     → ReportType, EffectiveDate, ClientList, Options
        │
        ├── [count ≤ 5 clients] CreatePdfObjClientReportAdhocMemory()
        │         Xử lý hoàn toàn trong RAM (byte[])
        │
        └── [count > 5 clients] CreatePdfObjClientReportAdhocFile()
                  Ghi qua file tạm → đọc lại → xóa file
        │
        ▼
SavePdfObj2TMP(TMPFILE_CLIENT)  ← lưu byte[] PDF vào bảng TMP
        │
        ▼
ClientReportAdhocEnd()  ← đánh dấu Request hoàn thành (SP: UBReportRequestTMPEnd)
        │
        ▼
m_FinishCallback(iRet)  ← thông báo cho WebApp
```

> **Nguồn**: `VieFUNDPdf/ClientReportAdhoc.cs` L239-305

---

## 3. Hai chế độ tạo PDF

### 3.1 Memory Mode — `CreatePdfObjClientReportAdhocMemory()`

Dùng khi **số client ≤ 5**. Toàn bộ xử lý trong RAM.

**Luồng xử lý:**
1. Duyệt từng `iClientID` trong `ClientList`.
2. Kiểm tra `m_Abort` trước mỗi iteration — cho phép user hủy giữa chừng.
3. Gọi hàm report tương ứng với `m_iReportType` → nhận `byte[] PdfObj`.
4. Merge tích lũy: `MainPdfObj = PdfBuilder.Merge2PdfObjs(MainPdfObj, PdfObj, ...)`.
5. Trả về `MainPdfObj` (toàn bộ PDF đã merge).

> **Nguồn**: `VieFUNDPdf/ClientReportAdhoc.cs` L33-135

### 3.2 File Mode — `CreatePdfObjClientReportAdhocFile()`

Dùng khi **số client > 5**. Tránh tràn RAM với tập client lớn.

**Luồng xử lý:**
1. Tạo `PdfBase.Document` + `PdfBase.PdfCopy` ghi vào `FileStream` (file tạm).
2. Duyệt từng client, gọi hàm report → `byte[] PdfObj`.
3. `PdfBuilder.AddPdfObjToPdfCopy()` — ghi trực tiếp vào file thay vì merge vào RAM.
4. `pdfDoc.Close()`.
5. Đọc lại file → `byte[] MainPdfObj`.
6. `File.Delete()` xóa file tạm.

> **Nguồn**: `VieFUNDPdf/ClientReportAdhoc.cs` L137-237

---

## 4. Report Type 5: Account Statement + XIRR

### 4.1 Điểm vào — `ClientAccountStatementPdfObj_XIRR()`

**File**: `CReport.cs` L3287

Là **orchestrator** — không tự tính toán, chỉ điều phối.

**3 tùy chọn nghiệp vụ đọc từ `tbOption`:**

| Option Key | Kiểu | Mô tả |
|---|---|---|
| `SplitByDealerCode` | int | `0` = gộp tất cả; `1+` = tách theo dealer |
| `SplitGroupID` | int | Nhóm dealer cụ thể khi split |
| `IncludeCostDisclosure` | int | Mức độ công khai chi phí (xem bảng bên dưới) |

### 4.2 Phân nhánh: Tách hay gộp theo Dealer

**Không tách** (`SplitByDealerCode == 0`):
```
XIRROne(DealerCode = "") → MainPdfObj
```

**Tách theo dealer** (`SplitByDealerCode != 0`):
```
GetClientDealerCodeListX()  → danh sách Dealer của client
  ↓ for each Dealer:
    XIRROne(DealerCode = "D1") → PdfObj
    Merge(MainPdfObj, PdfObj)
```

> Lý do tách theo dealer: quy định tuân thủ (compliance) yêu cầu mỗi đại lý phân phối nhận báo cáo riêng cho phần tài sản mình quản lý.

Lưu ý: cờ `bExcludeCompensation` trên từng dealer — nếu `true`, bỏ qua phụ lục hoa hồng cho dealer đó.

### 4.3 Logic `IncludeCostDisclosure` — Phụ lục bắt buộc theo luật

| Giá trị | Phụ lục được ghép vào PDF |
|---|---|
| `0` | Không thêm gì (chỉ Statement chính) |
| `1` | + **Commission** (hoa hồng) |
| `2` | + **Commission** + **Investment Performance** |
| `3` | + **Investment Performance** + **Commission** (thứ tự đảo) |
| `4` | + **Investment Performance** only |

> **Nguồn**: `VieFUNDPdf/CReport.cs` L3291-3385

### 4.4 Hàm con — `ClientAccountStatementPdfObj_XIRROne()`

**File**: `CReport.cs` L3387

Đây là nơi **thực sự tạo PDF**. Nhận thêm tham số `DealerCodeSpec` để lọc dữ liệu theo dealer.

**Luồng:**
1. Đọc toàn bộ các display option từ `tbOption` (~30 options).
2. Gọi `DSClientAccountStatement_XIRR()` → lấy `DataSet` từ DB (bao gồm dữ liệu portfolio, XIRR, lịch sử tỷ suất).
3. Gọi `PdfObjClientAccountStatement_XIRR(dsClient, tbOption)` → dựng PDF.
4. Nếu có `XMLFileName`: extract dữ liệu ra XML song song.
5. Trả về `byte[] PdfObj`.

**Các option hiển thị chính:**

| Option Key | Default | Mô tả |
|---|---|---|
| `IncludeGIC` | 1 | Hiển thị GIC trong report |
| `IncludeCash` | 1 | Hiển thị tài khoản tiền mặt |
| `IncludeStock` | 1 | Hiển thị cổ phiếu |
| `NoZeroUnitAccount` | 1 | Ẩn account có 0 units |
| `ShowBVAccount` | 0 | Hiển thị Book Value cấp Account |
| `ShowBVPlan` | 0 | Hiển thị Book Value cấp Plan |
| `ShowPercentagePlan` | 0 | Hiển thị phần trăm allocation theo plan |
| `RORHistorical` | 1 | Hiển thị bảng tỷ suất lịch sử |
| `RORHistoricalGraph` | 1 | Hiển thị biểu đồ tỷ suất lịch sử |
| `ShowROR` | 0 | Option hiển thị Rate of Return |
| `ShowTrx` | 1 | Hiển thị giao dịch |
| `PlanPieChart` | 0 | Biểu đồ tròn phân bổ theo plan |
| `Plan3QBarChart` | 1 | Biểu đồ cột 3 quý |
| `ExInactivePlan` | 1 | Ẩn plan không hoạt động |
| `ExcludeSegFund` | 0 | Loại trừ Segregated Fund |
| `TaggedPlanOnly` | 0 | Chỉ in plan được đánh dấu |
| `IncludeRisk` | 0 | Bao gồm Risk Summary |
| `NoXRate` | 0 | Không hiển thị Exchange Rate |
| `LogoOption` | 0 | Tùy chọn logo trên report |
| `MFDALogo` | false | Hiển thị logo MFDA |
| `UseClientLg` | 1 | Dùng ngôn ngữ của client |
| `RecalcAssetAlways` | 1 | Luôn recalculate asset |

> **Nguồn**: `VieFUNDPdf/CReport.cs` L3391-3461

---

## 5. Stored Procedures liên quan

| SP | Vai trò | Gọi từ |
|---|---|---|
| `UBReportRequestTMP` | Lấy metadata request (ClientList, Options, Dates) | `ClientReportAdhocHeaderSet()` |
| `UBReportRequestTMPEnd` | Đánh dấu request hoàn thành | `ClientReportAdhocEnd()` |
| `DSClientAccountStatement_XIRR` | Lấy toàn bộ dữ liệu portfolio + XIRR cho report | `XIRROne()` |
| `UBReportAdd` | Tạo report request mới từ UI | WebApp |
| `SavePdfObj2TMP` | Lưu byte[] PDF vào bảng TMP | `CreatePdfObjClientReportAdhoc()` |

> **Nguồn**: `VieFUNDPdf/ClientReportAdhoc.cs` L306-388

---

## 6. Cách thêm loại report mới

Để thêm một `iReportType` mới (ví dụ: `case 15`), cần thực hiện theo thứ tự:

### Bước 1 — Tạo hàm Orchestrator

Tạo hàm theo mẫu `ClientAccountStatementPdfObj_XIRR`:

```csharp
static public byte[] ClientYourReportPdfObj(string DBIDStr, int iUserID, int iClientID,
    DataTable tbOption, string EffectiveDate, string EffectiveDateFrom,
    int iRecordID, string XMLFileName, string TrxDateFrom, int iObjID)
{
    int iSplitByDealerCode = GetReportOptionInt(tbOption, "SplitByDealerCode", 0);
    int iSplitGroup = GetReportOptionInt(tbOption, "SplitGroupID", 0);
    int iIncludeCostDisclosure = GetReportOptionInt(tbOption, "IncludeCostDisclosure", 0);

    byte[] MainPdfObj = null;
    byte[] PdfObj = null;
    bool bFirst = true;

    if (iSplitByDealerCode == 0)
    {
        MainPdfObj = ClientYourReportPdfObjOne(DBIDStr, iUserID, iClientID,
            tbOption, EffectiveDate, EffectiveDateFrom, iRecordID, XMLFileName, "", TrxDateFrom, iObjID, true);
        // ghép phụ lục nếu cần (iIncludeCostDisclosure)
    }
    else
    {
        // split by dealer — xem pattern trong ClientAccountStatementPdfObj_XIRR L3329-3384
    }
    return MainPdfObj;
}
```

### Bước 2 — Tạo hàm `...One`

Hàm này nhận thêm `DealerCodeSpec` và `bObjIDFirst`, thực hiện:
1. Đọc options từ `tbOption`.
2. Gọi SP lấy dữ liệu → `DataSet`.
3. Gọi `PdfObj...()` dựng PDF → trả về `byte[]`.

### Bước 3 — Đăng ký trong switch/case

Trong **`ClientReportAdhoc.cs`**, thêm vào **cả hai** hàm:
- `CreatePdfObjClientReportAdhocMemory()` — L55-118
- `CreatePdfObjClientReportAdhocFile()` — L179-222

```csharp
case 15:
    PdfObj = ClientYourReportPdfObj(DBIDStr, UserID, iClientID,
                tbOption, EffectiveDate, EffectiveDateFrom, iRequestID, XMLFileStr, TrxDateFrom, 0);
    break;
```

### Bước 4 — Cập nhật UI

Thêm option `iReportType = 15` vào dropdown chọn loại report trong WebApp (trang `ClientStatement.aspx` hoặc tương đương).

---

## 7. Cấu trúc file code

| File | Namespace | Vai trò |
|---|---|---|
| `VieFUNDPdf/ClientReportAdhoc.cs` | `VieFUNDPdf` | Entry point, thread, switch/case dispatch |
| `VieFUNDPdf/CReport.cs` | `VieFUNDPdf` | Toàn bộ hàm tạo PDF (~9,200 dòng) |
| `PdfBase/PdfBuilder.cs` | `PdfBase` | Utility tạo/merge PDF (iTextSharp wrapper) |

---

## 8. Xử lý lỗi và hủy

- **Hủy giữa chừng**: `m_Abort = true` → vòng lặp client sẽ phát hiện và thoát với `iRet = 2`.
- **Exception**: bắt tại `CreatePdfObjClientReportAdhoc()` L299, gọi `m_ErrorCallback(ex)`.
- **iRet conventions**:

| Giá trị | Ý nghĩa |
|---|---|
| `0` | Thành công |
| `1` | Lỗi lưu PDF |
| `2` | Bị hủy bởi user |

---

## 9. Sơ đồ kiến trúc module

```
┌─────────────────────────────────────────────────────┐
│                     WebApp Layer                    │
│  ClientStatement.aspx                               │
│  ├── Chọn Report Type, Date Range, Client List      │
│  ├── Gọi SP: UBReportAdd                            │
│  └── Poll kết quả → Download PDF từ TMP             │
└──────────────────────┬──────────────────────────────┘
                       │ Request ID
                       ▼
┌─────────────────────────────────────────────────────┐
│               VieFUNDPdf Layer                      │
│  CReport (partial)                                  │
│  ├── ClientReportAdhoc.cs                           │
│  │    ├── StartCreatePdfObjClientReportAdhoc()      │
│  │    ├── CreatePdfObjClientReportAdhoc()           │
│  │    ├── CreatePdfObjClientReportAdhocMemory()     │
│  │    └── CreatePdfObjClientReportAdhocFile()       │
│  └── CReport.cs                                     │
│       ├── ClientAccountStatementPdfObj_XIRR()       │
│       ├── ClientAccountStatementPdfObj_XIRROne()    │
│       ├── ClientInvestorStatementPdfObj_XIRR()      │
│       ├── ClientCommissionOne()                     │
│       └── ClientInvestmentPerformanceOne()          │
└──────────────────────┬──────────────────────────────┘
                       │ DataSet
                       ▼
┌─────────────────────────────────────────────────────┐
│                    Database Layer                   │
│  UBReportRequestTMP → ClientList + Options + Dates  │
│  DSClientAccountStatement_XIRR → Portfolio data     │
│  UBReportRequestTMPEnd → Mark complete              │
│  SavePdfObj2TMP → Store final PDF bytes             │
└─────────────────────────────────────────────────────┘
```
