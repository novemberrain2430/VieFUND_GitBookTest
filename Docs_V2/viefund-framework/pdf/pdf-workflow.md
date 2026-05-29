# PDF Generation Framework

> VieFUNDPdf là thư viện tạo và xử lý PDF cho toàn bộ hệ thống VieFUND. Sử dụng wrapper `PdfBase.dll` (dựa trên iTextSharp) để vẽ PDF programmatically — bao gồm reports, forms, tax slips, compliance documents, và trade confirmations.

---

## 1. Tổng quan kiến trúc

### Hai chế độ tạo PDF

| Chế độ | Class | Mô tả |
|---|---|---|
| **Report Mode** | `PdfBuilder` + `CReport` | Vẽ PDF từ đầu: tạo document, tables, text, images, charts |
| **Form Fill Mode** | `CForm` | Điền dữ liệu vào PDF template có sẵn (AcroForm fields) |

### Project Structure (59 files, ~2.7MB source)

```
VieFUNDPdf/
├── CPDF.cs                  ← Core: PdfBuilder (19,075 lines, 916KB)
│                               + TwoColumnHeaderFooter (page events)
│                               + CustomCellLayout (form fields in tables)
├── CForm.cs                 ← Form filling: AcroForm PDF templates (3,096 lines, 136KB)
│
├── CReport.cs               ← partial class CReport — base reports (466KB)
├── AccountSummary.cs         ← partial class CReport — Account statement
├── FamilyReport.cs           ← partial class CReport — Family report
├── ClientPerformance.cs      ← partial class CReport — Performance report
├── Compliance.cs             ← partial class CReport — Compliance docs
├── Commission.cs             ← partial class CReport — Commission reports
├── Orders.cs                 ← partial class CReport — Order reports
├── CAssetByFund.cs           ← partial class CReport — Asset allocation
├── CClientKYC.cs             ← partial class CReport — KYC documents
├── CPayroll.cs               ← partial class CReport — Payroll reports
│
├── TradeConfirmation.cs      ← Trade confirmation PDF
├── OrderReceipt.cs           ← Order receipt PDF
├── GIC.cs                    ← GIC report
├── GICConfirmation.cs        ← GIC confirmation
├── CRRSPReceipt.cs           ← RRSP receipt
├── CTransferDoc.cs           ← Transfer documents
├── CBulkConversionBasket.cs  ← Bulk conversion
├── CBulkSwitchBasket.cs      ← Bulk switch
├── ChargeCompensation.cs     ← Charge/Compensation reports
├── CSettlementFile.cs        ← Settlement file
├── CTradeBlotter.cs          ← Trade blotter
├── CTrxRecap.cs              ← Transaction recap
├── SysPlan.cs                ← partial class PdfBuilder — Systematic plans
│
├── T4RSPPdf.cs               ← Tax slip: T4RSP
├── T4RIFPdf.cs               ← Tax slip: T4RIF
├── T4APdf.cs                 ← Tax slip: T4A
├── T4FHSAPdf.cs              ← Tax slip: T4FHSA
├── T5Pdf.cs                  ← Tax slip: T5
├── T3Pdf.cs                  ← Tax slip: T3
├── T5008Pdf.cs               ← Tax slip: T5008
├── NR4Pdf.cs                 ← Tax slip: NR4
├── RL1Pdf.cs                 ← Relevé: RL1 (Quebec)
├── RL2Pdf.cs                 ← Relevé: RL2
├── RL3Pdf.cs                 ← Relevé: RL3
├── RL16Pdf.cs                ← Relevé: RL16
├── RL18Pdf.cs                ← Relevé: RL18
│
├── BarCode.cs                ← Barcode generation for PDFs
├── ClientLabel.cs            ← Client mailing labels
├── PdfNote.cs                ← PDF annotations/notes
├── DashBoard.cs              ← Dashboard PDF export
├── Uniformity.cs             ← Uniformity reports
├── CPortfolioFundFact.cs     ← Fund fact sheets
├── CRiskAssessmentPdf.cs     ← Risk assessment
├── CTrustAccountPdf.cs       ← Trust account
├── CLSFile.cs                ← LS file reports
├── CCommFile.cs              ← Commission file
├── PSPFileReport.cs          ← PSP file reports
├── QuarterAUA.cs             ← Quarterly AUA reports
├── AUACurrent.cs             ← Current AUA
├── ClientReportAdhoc.cs      ← Ad-hoc client reports
└── bin/PdfBase.dll           ← iTextSharp wrapper (referenced from WebApp/bin)
```

### Dependencies

| DLL | Mô tả |
|---|---|
| `PdfBase.dll` | Wrapper around iTextSharp. Cung cấp: `Document`, `PdfWriter`, `PdfPTable`, `PdfPCell`, `PdfContentByte`, `BaseFont`, `PdfReader`, `PdfStamper`, `AcroFields`, `Image`, etc. |
| `UBConnection.dll` | Database access (`CDatabase.WriteLog`) |
| `UBStatic.dll` | Utility functions (`CFunctions.ToInt`, `CFunctions.ToDbl`) |
| `System.Web.UI.DataVisualization` | Chart generation for performance reports |

---

## 2. Report Mode — Vẽ PDF từ đầu

### 2.1 Workflow cơ bản

```csharp
// 1. Tạo Document
Document doc = PdfBuilder.CreateDoc(bLandScape);
// hoặc với margins custom:
Document doc = PdfBuilder.CreateDoc(bLandScape, marginLeft, marginRight, marginTop, marginBottom);

// 2. Tạo Writer → MemoryStream
MemoryStream ms = new MemoryStream();
PdfWriter wr = PdfBuilder.CreateWriter(doc, ms);

// 3. Cấu hình Header/Footer → Mở document
PdfBuilder.StartPdf(doc, wr, title, titleRight, creator, author, subject,
    Lg, fontStyleTopLeft, fontSizeTopLeft, fontStyleTopRight,
    fontSizeTopRight, fontSizeBottom, showUser,
    headerFirstPage, footerFirstPage,
    dealerName, extraLine, showCreatedTime, mfdaLogo);

// 4. Vẽ nội dung (tables, text, images)
PdfPTable table = PdfBuilder.CreateDefTable(numColumns, spacingBefore, spacingAfter);
PdfBuilder.AddTextToTableCell(table, "Text", fontSize, fontStyle,
    hAlign, vAlign, colSpan, borderTop, borderRight, borderBottom, borderLeft,
    textColor, bgColor, minHeight);
doc.Add(table);

// 5. Đóng document → Lấy bytes
doc.Close();
byte[] pdfBytes = ms.ToArray();
```

### 2.2 Font System

```
iFontStyle Constants:
  0 = Normal
  1 = Bold
  2 = Italic
  3 = Bold Italic
  4 = Underline
  8 = Strikethrough

Alignment Constants:
  0 = ALIGN_LEFT
  1 = ALIGN_CENTER
  2 = ALIGN_RIGHT
  4 = ALIGN_TOP
  5 = ALIGN_MIDDLE
  6 = ALIGN_BOTTOM
```

Default font: **Helvetica** (BaseFont.HELVETICA, CP1252 encoding).

### 2.3 Color System

Colors biểu diễn bằng integer (RGB packed):

```csharp
// Predefined colors trong PdfBuilder
BkColorHeader()  → 16777152  (light yellow)
BkColor2()       → 15790320  (light gray)
BkYellow()       → RGB(255,255,192)
BkLTGray()       → RGB(225,225,225)
BkGray()         → RGB(192,192,192)
BkDarkGray()     → RGB(128,128,128)
BkLTBlue()       → RGB(231,248,250)
BkBlue()         → RGB(64,64,192)
BkLTGreen()      → RGB(128,250,128)
BkGreen()        → RGB(64,192,64)
BkRed()          → RGB(225,64,64)
BkWhite()        → RGB(255,255,255)
```

### 2.4 Page Setup

| Constant | Value |
|---|---|
| Default page size | `PageSize.LETTER` (8.5" x 11") |
| Default margin left | 50 |
| Default margin right | 30 |
| Default margin top | 50 (86 nếu có MFDA logo) |
| Default margin bottom | 45 |
| Landscape | `PageSize.LETTER.Rotate()` |

### 2.5 Header/Footer System (`TwoColumnHeaderFooter`)

Page events tự động render header/footer trên mỗi trang:

| HeaderType | Mô tả |
|---|---|
| 0 | Default |
| 1 | Standard: Title left + Title right + Line separator |
| 2 | No header (skip) |
| 3 | Two-line header with report name/period |
| 4 | Header with dealer logo (loaded from DB) |
| 5 | Account statement header (Merici style) |

**Logo from DB**: `SetLogoOnHeader(DataSet ds)` đọc từ table `"Logo"`:
- `bShowLogoHeader` — Hiển thị hay không
- `FileData` — Image bytes
- `iPosX`, `iPosY`, `iWidth`, `iHeight` — Vị trí và kích thước
- `iHeaderOffsetY` — Offset Y cho content bên dưới logo

**Footer** hiển thị: Page number ("Page X of Y"), User name, Created time, Dealer name.

### 2.6 Key PdfBuilder Methods

#### Document Creation

| Method | Mô tả |
|---|---|
| `CreateDoc(bLandScape)` | Tạo Document với page size Letter |
| `CreateDocWithMargin(bLandScape, L, R, T, B, bMStyle)` | Tạo Document với custom margins |
| `CreateWriter(doc, stream)` | Tạo PdfWriter cho MemoryStream hoặc FileStream |
| `StartPdf(...)` | Cấu hình header/footer và mở document |
| `StartPdfLogo(...)` | Như trên + load dealer logo từ DataSet |
| `StartPdf2(...)` | Variant khác cho report format |

#### Table Building

| Method | Mô tả |
|---|---|
| `AddTextToTableCell(table, text, size, style, hAlign, vAlign, colspan, borderT, borderR, borderB, borderL, textColor, bgColor, minHeight)` | Thêm text cell vào table |
| `AddTextToTableCell2Lines(table, str1, size1, style1, str2, size2, style2, ...)` | Cell 2 dòng text |
| `Add2TextToTableCell(table, str1, size1, style1, str2, size2, style2, ...)` | 2 text cùng 1 cell |
| `Add2TextToTableRow(table, strLeft, strRight, ...)` | Thêm row với 2 cột |
| `AddTextToTableCellEditable(table, ...)` | Cell với editable AcroForm field |
| `FillColumn2Values(dr, tbDef, datatable, bgColor, Lg, bExport)` | Fill table từ DataRow |

#### Images

| Method | Mô tả |
|---|---|
| `AddImageBytesPos(doc, x, y, imgBytes, width, height)` | Đặt image tại vị trí tuyệt đối |
| `AddImageBytesPos(doc, cb, x, y, imgBytes, w, h)` | Như trên, dùng ContentByte |
| `AddImageBytesPos2(doc, x, y, imgBytes, w, h)` | Variant khác |

#### Utilities

| Method | Mô tả |
|---|---|
| `GetNumberOfPages(byte[] pdf)` | Đếm số trang PDF |
| `Merge2PdfObjs(pdf1, pdf2, bVF1, bVF2, bPrint2Side)` | Ghép 2 PDF thành 1 |
| `FormatText(value, iType, bExport, Lg)` | Format số/tiền/% theo locale |
| `FixNumberCulture(strIn, Lg)` | Fix format số cho EN-CA / FR-CA |
| `GetDataRowText(dr, colName, iType, bExport, Lg)` | Đọc + format dữ liệu từ DataRow |

### 2.7 Number Formatting Types (`FormatText`)

| iType | Format | Ví dụ |
|---|---|---|
| 0 | Raw text | "Hello" |
| 1 | Currency 4 decimals (no $) | "1,234.5678" |
| 3 | Currency 2 decimals (no $) | "1,234.56" |
| 4 | Currency 0 decimals (no $) | "1,235" |
| 5 | Float 2 decimals | "1234.56" |
| 6 | Percentage 2 decimals | "12.34%" |
| 7 | Float generic | "1234.5" |
| 9 | Percentage 1 decimal | "12.3%" |
| 21 | Currency 4 decimals (with $) | "$1,234.5678" |
| 23 | Currency 2 decimals (with $) | "$1,234.56" |
| 24 | Currency 0 decimals (with $) | "$1,235" |

**Bilingual support**: `FixNumberCulture()` tự động convert giữa EN (1,234.56) và FR (1 234,56$) dựa trên `Lg` parameter và `CultureInfo.CurrentCulture`.

---

## 3. Form Fill Mode — Điền PDF Template

### 3.1 Workflow

```csharp
// CForm.CreatePDF():
// 1. Đọc PDF template
PdfReader reader = new PdfReader(pdfTemplatePath);

// 2. Tạo stamper
PdfStamper stamper = new PdfStamper(reader, memoryStream);

// 3. Lấy AcroFields
AcroFields form = stamper.AcroFields;

// 4. Điền dữ liệu từ DataSet
FillFromDataSet(form, ds);
// → Loop qua tất cả tables trong DataSet
// → Mỗi row → map column names thành field names
// → form.SetField(fieldName, value)

// 5. Optionally remove signature fields
if (bRemoveSig)
    // Remove: sigClient, initClient, dateClient, sigRep, initRep, dateRep, ...

// 6. Rename fields (for merge)
if (bRenameTag)
    // Append postfix to avoid field name conflicts khi merge

// 7. Close → Return bytes
stamper.Close();
return ms.ToArray();
```

### 3.2 Signature Field Naming Convention

PDF templates sử dụng convention cho signature fields:

| Prefix | Recipient | Fields |
|---|---|---|
| `sig` | Signature | `sigClient1`, `sigRep1`, `sigWitness1`, `sigBene1`, `sigCG1`, `sigComp1`, `sigSelf1` |
| `init` | Initials | `initClient1`, `initRep1`, ... |
| `date` | Date signed | `dateClient1`, `dateRep1`, ... |
| `o` prefix | Alternate | `osigClient1`, `oinitClient1`, `odateClient1`, ... |

**Max counts per type:**
- Joint Client: 4
- Joint Rep: 4
- Witness: 2
- Beneficiary: 4
- Compliance: 2

### 3.3 DataSet → PDF Field Mapping

Data từ SPs trả về DataSet với named tables. Mỗi table được map theo quy tắc:

| Table Name | Mapping Rule |
|---|---|
| `TagName/ValStr` format | Direct: field name = TagName, value = ValStr |
| `Identification`, `JointIdentification` | Postfix: `fieldName + rowIndex` (1, 2, 3...) |
| `PlanInfo`, `BenInfo`, `CGInfo` | Prefix: `Prefix + fieldName` |
| `JointInfo` | Prefix mode |
| Other tables | Direct column name → field name |

---

## 4. CReport — Partial Class Architecture

`CReport` là **partial class** chia thành 13 files, mỗi file xử lý 1 nhóm reports:

| File | Mô tả | Size |
|---|---|---|
| `CReport.cs` | Base methods, common report helpers | 466KB |
| `AccountSummary.cs` | Client account statement | 41KB |
| `FamilyReport.cs` | Family/household consolidated report | 110KB |
| `ClientPerformance.cs` | Portfolio performance + charts | 104KB |
| `Compliance.cs` | Compliance documents (KYC, suitability) | 161KB |
| `Commission.cs` | Commission/trailer fee reports | 74KB |
| `Orders.cs` | Order management reports | 77KB |
| `CAssetByFund.cs` | Asset allocation by fund | 159KB |
| `CClientKYC.cs` | KYC (Know Your Client) forms | 132KB |
| `CPayroll.cs` | Payroll deduction reports | 89KB |
| `CReport → QuarterAUA.cs` | Quarterly AUA (Assets Under Admin) | 40KB |
| `PSPFileReport.cs` | PSP file reports | 41KB |
| `ClientReportAdhoc.cs` | Ad-hoc client reports | 17KB |
| `AUACurrent.cs` | Current AUA snapshot | 7KB |

---

## 5. Editable PDF Cells (`CustomCellLayout`)

Tạo các form fields (text, checkbox) bên trong table cells:

```csharp
CustomCellLayout layout = new CustomCellLayout(
    fieldName,      // "txtAmount"
    iFieldType,     // AcroFields.FIELD_TYPE_TEXT or FIELD_TYPE_CHECKBOX
    fieldText,      // Default text
    iSize,          // Font size
    iStyle,         // Font style
    iTextColor,     // Text color (int)
    iBkColor,       // Background color (int)
    iStatus,        // 0=normal, 1=readonly, 2=hidden
    iRotation       // Text rotation
);

PdfPCell cell = new PdfPCell();
cell.CellEvent = layout;
table.AddCell(cell);
```

---

## 6. PDF Merge & Utilities

### Merge 2 PDFs

```csharp
byte[] merged = PdfBuilder.Merge2PdfObjs(pdf1, pdf2, bVieFUND1, bVieFUND2, bPrint2Side);
// bPrint2Side: thêm blank page giữa 2 docs nếu pdf1 có số trang lẻ
```

### Đếm trang

```csharp
int pages = PdfBuilder.GetNumberOfPages(pdfBytes);
```

### Xóa restrictions

```csharp
PdfBuilder.RemoveRestrictions(sourcePath, outputPath, password);
```

### Barcode

```csharp
// BarCode.cs — Generate barcode image cho PDF (client labels, envelopes)
```

---

## 7. Tax Slip PDFs

Mỗi loại tax slip có file riêng, đều sử dụng **Form Fill Mode**:

| File | Tax Slip | Mô tả |
|---|---|---|
| `T4RSPPdf.cs` | T4RSP | RRSP contribution receipt |
| `T4RIFPdf.cs` | T4RIF | RRIF income |
| `T4APdf.cs` | T4A | Pension/annuity income |
| `T4FHSAPdf.cs` | T4FHSA | First Home Savings Account |
| `T5Pdf.cs` | T5 | Investment income |
| `T3Pdf.cs` | T3 | Trust income |
| `T5008Pdf.cs` | T5008 | Securities transactions |
| `NR4Pdf.cs` | NR4 | Non-resident withholding |
| `RL1Pdf.cs` | RL-1 | Quebec employment income |
| `RL2Pdf.cs` | RL-2 | Quebec retirement income |
| `RL3Pdf.cs` | RL-3 | Quebec investment income |
| `RL16Pdf.cs` | RL-16 | Quebec trust income |
| `RL18Pdf.cs` | RL-18 | Quebec securities transactions |

---

## 8. Luồng từ WebApp → PDF

### 8.1 Report Generation

```
WebApp (ASPX page)
  → BLL layer (UBClasses)
  → CReport.GenerateXXXReport(DataSet ds)
     ├── PdfBuilder.CreateDoc()
     ├── PdfBuilder.CreateWriter()
     ├── PdfBuilder.StartPdfLogo()   ← load dealer logo
     ├── [Vẽ tables, text, images, charts]
     ├── doc.Close()
     └── return byte[]
  → Response.BinaryWrite() hoặc lưu DB
```

### 8.2 Form Generation (KYC, Applications, etc.)

```
WebApp (PopupForms.aspx, etc.)
  → UBClasses.Forms.GetFormData(formID)
     → SP trả về DataSet (ClientInfo, PlanInfo, BenInfo, etc.)
  → CForm.CreatePDF(ds, pdfTemplatePath, bRenameTag, ref iPostFix)
     ├── PdfReader(templatePath)     ← đọc PDF template từ disk
     ├── PdfStamper                  ← tạo stamper
     ├── FillFromDataSet(form, ds)   ← map data → fields
     ├── [Remove/rename sig fields nếu cần]
     └── return byte[]
  → Merge nhiều forms: Merge2PdfObjs()
  → Gửi cho e-signature hoặc download
```

---

## 9. Bilingual Support (EN/FR)

Hệ thống PDF hỗ trợ song ngữ Anh-Pháp (Canada):

| Lg | Language | Number Format | Currency |
|---|---|---|---|
| 0 | English | 1,234.56 | $1,234.56 |
| 1 | French | 1 234,56 | 1 234,56$ |

`FixNumberCulture()` xử lý:
- Swap `,` and `.` 
- Move `$` sign (prefix EN → suffix FR)
- Negative: `-1,234.56` → `(1,234.56)`

`DocumentSetting.languageCode`:
- 550 = English
- 551 = French (trong Signority context)

---

## 10. Lưu ý cho Developer

1. **PdfBase.dll**: Là wrapper tùy chỉnh trên iTextSharp. Không phải iTextSharp gốc. Reference từ `WebApp/bin/PdfBase.dll`.

2. **Partial class pattern**: `CReport` split thành 13 files. Khi thêm report mới, tạo file mới với `public partial class CReport` trong namespace `VieFUNDPdf`.

3. **MemoryStream pattern**: Luôn dùng `MemoryStream` → `byte[]`. Không ghi file trực tiếp. PDF được return dưới dạng byte array để WebApp xử lý (stream to browser hoặc lưu DB).

4. **Template paths**: `CForm.CreatePDF()` nhận physical path. WebApp phải convert virtual path → physical path trước khi gọi.

5. **Font**: Chỉ dùng Helvetica (built-in). Không embed custom fonts. Tiếng Pháp accented characters (é, è, ê) hoạt động nhờ CP1252 encoding.

6. **Charts**: `ClientPerformance.cs` sử dụng `System.Web.UI.DataVisualization.Charting` để tạo chart images, sau đó embed vào PDF dưới dạng image bytes.

7. **Merge cẩn thận**: Khi merge PDF có AcroForm fields, phải rename fields (`bRenameTag=true`) để tránh conflict. `iPostFix` counter được truyền qua `ref` để track.
