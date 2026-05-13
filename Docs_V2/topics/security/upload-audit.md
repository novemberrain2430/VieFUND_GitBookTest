# Audit: Tất cả điểm Upload trong VieFund WebApp

> **SolvedResult.md chỉ cover 1 điểm:** `FFProcessUpload` trong `FundSetup.aspx.cs`  
> **Thực tế codebase có 27+ điểm upload**, tất cả đều **KHÔNG** có validation file type / magic bytes.

---

## Tổng hợp tất cả Upload Handlers

### 1. Document Upload (user-uploaded content — rủi ro CAO)

| # | File | Method | Dòng | Mô tả |
|---|------|--------|------|-------|
| 1 | [FundSetup.aspx.cs](file:///c:/Users/NR/Desktop/VieFundAG/WebApp/Main/FundSetup.aspx.cs#L2059) | `FFProcessUpload` | 2059 | Fund Fact upload (**đã cover trong SolvedResult.md**) |
| 2 | [FundSetup.aspx.cs](file:///c:/Users/NR/Desktop/VieFundAG/WebApp/Main/FundSetup.aspx.cs#L340) | (sync fallback `idFileUploadControlX`) | 340 | Fallback upload khi async không hoạt động |
| 3 | [ComplianceDocView.aspx.cs](file:///c:/Users/NR/Desktop/VieFundAG/WebApp/Main/ComplianceDocView.aspx.cs#L1362) | `ProcessUploadGeneral` | 1362 | Compliance document upload (async) |
| 4 | [ComplianceDocView.aspx.cs](file:///c:/Users/NR/Desktop/VieFundAG/WebApp/Main/ComplianceDocView.aspx.cs#L1260) | (sync fallback `idFileUploadGeneralControlX`) | 1260 | Compliance doc — sync fallback |
| 5 | [ComplianceDocView.aspx.cs](file:///c:/Users/NR/Desktop/VieFundAG/WebApp/Main/ComplianceDocView.aspx.cs#L1804) | `ProcessUploadFFAdd` | 1804 | Fund Fact bổ sung trong Compliance |
| 6 | [PanelDocFileUpload.aspx.cs](file:///c:/Users/NR/Desktop/VieFundAG/WebApp/Main/PanelDocFileUpload.aspx.cs#L97) | `ProcessUpload` | 97 | Panel upload document dùng chung |
| 7 | [PanelDocFileUpload2.aspx.cs](file:///c:/Users/NR/Desktop/VieFundAG/WebApp/Main/PanelDocFileUpload2.aspx.cs#L109) | `ProcessUpload` | 109 | Panel upload document phiên bản 2 |
| 8 | [PanelDocFileUploadWithDesc.aspx.cs](file:///c:/Users/NR/Desktop/VieFundAG/WebApp/Main/PanelDocFileUploadWithDesc.aspx.cs#L295) | `ProcessUpload` | 295 | Upload document kèm description (async) |
| 9 | [PanelDocFileUploadWithDesc.aspx.cs](file:///c:/Users/NR/Desktop/VieFundAG/WebApp/Main/PanelDocFileUploadWithDesc.aspx.cs#L138) | (sync fallback `idFileUploadControlX`) | 138 | Upload document kèm description (sync) |
| 10 | [PanelDocUploadPlan.aspx.cs](file:///c:/Users/NR/Desktop/VieFundAG/WebApp/Main/PanelDocUploadPlan.aspx.cs#L93) | `ProcessUpload` | 93 | Upload plan document |
| 11 | [PanelFFAddTrx.aspx.cs](file:///c:/Users/NR/Desktop/VieFundAG/WebApp/Main/PanelFFAddTrx.aspx.cs#L218) | `ProcessUploadFFAddTrx` | 218 | Fund Fact add transaction (bản 1) |
| 12 | [PanelFFAddTrx.aspx.cs](file:///c:/Users/NR/Desktop/VieFundAG/WebApp/Main/PanelFFAddTrx.aspx.cs#L1177) | `ProcessUploadFFAddTrx` | 1177 | Fund Fact add transaction (bản 2) |
| 13 | [PopupNotificationAdd.aspx.cs](file:///c:/Users/NR/Desktop/VieFundAG/WebApp/Main/PopupNotificationAdd.aspx.cs#L586) | `FileProcessUpload` | 586 | Upload file đính kèm notification |

### 2. Logo / Image Upload (rủi ro TRUNG BÌNH)

| # | File | Method | Dòng | Mô tả |
|---|------|--------|------|-------|
| 14 | [MemberSetup.aspx.cs](file:///c:/Users/NR/Desktop/VieFundAG/WebApp/Main/MemberSetup.aspx.cs#L1837) | `LogoProcessUpload` | 1837 | Upload logo member |
| 15 | [PanelLogoUpload.aspx.cs](file:///c:/Users/NR/Desktop/VieFundAG/WebApp/Main/PanelLogoUpload.aspx.cs#L56) | `LogoProcessUpload` | 56 | Panel logo upload (bản 1) |
| 16 | [PanelLogoUpload.aspx.cs](file:///c:/Users/NR/Desktop/VieFundAG/WebApp/Main/PanelLogoUpload.aspx.cs#L133) | `LogoProcessUpload` | 133 | Panel logo upload (bản 2) |
| 17 | [PanelLogoUpload.aspx.cs](file:///c:/Users/NR/Desktop/VieFundAG/WebApp/Main/PanelLogoUpload.aspx.cs#L193) | `LogoProcessUpload` | 193 | Panel logo upload (bản 3) |
| 18 | [PopupAssetAllocationDef.aspx.cs](file:///c:/Users/NR/Desktop/VieFundAG/WebApp/Main/PopupAssetAllocationDef.aspx.cs#L808) | `FFProcessUpload` | 808 | Asset allocation document upload |

### 3. Member Document Upload (rủi ro CAO)

| # | File | Method | Dòng | Mô tả |
|---|------|--------|------|-------|
| 19 | [MemberSetup.aspx.cs](file:///c:/Users/NR/Desktop/VieFundAG/WebApp/Main/MemberSetup.aspx.cs#L2135) | `ProcessUpload` | 2135 | Member document upload (async) |
| 20 | [MemberSetup.aspx.cs](file:///c:/Users/NR/Desktop/VieFundAG/WebApp/Main/MemberSetup.aspx.cs#L2108) | (sync fallback `idFileUploadControlX`) | 2108 | Member document upload (sync) |

### 4. Data Import Upload (rủi ro TRUNG BÌNH — dữ liệu, không serve lại)

| # | File | Method | Dòng | Mô tả |
|---|------|--------|------|-------|
| 21 | [FINTRACView.aspx.cs](file:///c:/Users/NR/Desktop/VieFundAG/WebApp/Main/FINTRACView.aspx.cs#L632) | `AMLProcessUpload` | 632 | FINTRAC/AML data import |
| 22 | [PanelAMLFileUpload.aspx.cs](file:///c:/Users/NR/Desktop/VieFundAG/WebApp/Main/PanelAMLFileUpload.aspx.cs#L201) | `AMLProcessUpload` | 201 | AML file upload panel |
| 23 | [PanelAMLFileUpload_TBD.aspx.cs](file:///c:/Users/NR/Desktop/VieFundAG/WebApp/Main/PanelAMLFileUpload_TBD.aspx.cs#L200) | `AMLProcessUpload` | 200 | AML file upload (TBD version) |
| 24 | [PanelInsertList.aspx.cs](file:///c:/Users/NR/Desktop/VieFundAG/WebApp/Main/PanelInsertList.aspx.cs#L36) | `ProcessUpload1` | 36 | Bulk insert list upload |
| 25 | [PanelFundataFileUpload.aspx.cs](file:///c:/Users/NR/Desktop/VieFundAG/WebApp/Main/PanelFundataFileUpload.aspx.cs#L195) | `FileProcessUpload` | 195 | Fundata file import |
| 26 | [ClientImportView.aspx.cs](file:///c:/Users/NR/Desktop/VieFundAG/WebApp/Main/ClientImportView.aspx.cs#L467) | `FileProcessUpload` | 467 | Client data import |
| 27 | [TSHImportView.aspx.cs](file:///c:/Users/NR/Desktop/VieFundAG/WebApp/Main/TSHImportView.aspx.cs#L222) | `FileProcessUpload` | 222 | TSH data import |

### 5. Các điểm khác

| # | File | Method | Dòng | Mô tả |
|---|------|--------|------|-------|
| 28 | [PanelLoanFileUpload.aspx.cs](file:///c:/Users/NR/Desktop/VieFundAG/WebApp/Main/PanelLoanFileUpload.aspx.cs#L221) | `LoanProcessUpload` | 221 | Loan document upload |
| 29 | [PopupLoanAdd.aspx.cs](file:///c:/Users/NR/Desktop/VieFundAG/WebApp/Main/PopupLoanAdd.aspx.cs#L1992) | `FileProcessUpload` | 1992 | Loan file upload (popup) |
| 30 | [ClientStatement.aspx.cs](file:///c:/Users/NR/Desktop/VieFundAG/WebApp/Main/ClientStatement.aspx.cs#L1763) | `ProcessUpload` | 1763 | Client statement upload |
| 31 | [UploadDocument.aspx.cs](file:///c:/Users/NR/Desktop/VieFundAG/WebApp/Plugins/DocumentScanner/UploadDocument.aspx.cs#L130) | `HttpPostedFile` trực tiếp | 130 | Document scanner plugin |

---

## Phân tích rủi ro

> [!CAUTION]
> **Tất cả 31 điểm upload đều KHÔNG có validation file type hay magic bytes.** SolvedResult.md chỉ fix cho 1 điểm duy nhất (`FFProcessUpload` trong `FundSetup.aspx.cs`).

### Rủi ro cao nhất (file được serve lại cho user khác)

Các điểm upload document thông thường (#1-#13, #19-#20) lưu file qua `CDocumentDef.SaveTMPFileData()` và sau đó serve lại qua `PdfView.aspx` hoặc tương tự. Đây là attack vector XSS giống hệt Finding F0002.

### Rủi ro trung bình (logo/image)

Logo upload (#14-#18) lưu qua `CBase.AddLogo()`. Nếu serve inline, SVG chứa script vẫn có thể thực thi.

### Rủi ro thấp hơn (data import)

Data import (#21-#27) thường đọc-parse-bỏ file, không serve lại. Nhưng vẫn nên validate để tránh server-side attack (XXE với XML, macro với Excel...).

---

## Đề xuất: Centralize validation vào helper

Thay vì copy-paste validation code vào 31 chỗ, nên tạo **một helper class dùng chung**:

```csharp
// App_Code/FileUploadValidator.cs
public static class FileUploadValidator
{
    // Whitelist duy nhất — tất cả các extension an toàn được phép upload
    // Gom chung để tránh phải rà soát từng màn hình dùng profile nào
    public static readonly string[] AllowedExts = {
        ".pdf", ".doc", ".docx", ".xls", ".xlsx",       // Documents
        ".jpg", ".jpeg", ".png", ".gif", ".bmp",         // Images
        ".csv", ".txt", ".xml"                            // Data / text
    };

    // Mapping: extension → magic bytes hợp lệ
    // Dùng để verify nội dung file khớp với extension (chặn renamed file)
    private static readonly Dictionary<string, string[]> MagicBytes = new Dictionary<string, string[]>
    {
        { ".pdf",  new[] { "25504446" } },          // %PDF-
        { ".doc",  new[] { "D0CF11E0" } },          // OLE2 Compound
        { ".xls",  new[] { "D0CF11E0" } },          // OLE2 Compound
        { ".docx", new[] { "504B0304" } },          // ZIP (Office Open XML)
        { ".xlsx", new[] { "504B0304" } },          // ZIP (Office Open XML)
        { ".jpg",  new[] { "FFD8FF" } },            // JPEG
        { ".jpeg", new[] { "FFD8FF" } },            // JPEG
        { ".png",  new[] { "89504E47" } },          // PNG
        { ".gif",  new[] { "47494638" } },          // GIF
        { ".bmp",  new[] { "424D" } },              // BMP
        { ".csv",  null },                          // Text — no fixed signature
        { ".txt",  null },                          // Text — no fixed signature
        { ".xml",  null },                          // XML — no reliable fixed signature
                                                    // ⚠ XML an toàn NẾU serve với attachment + nosniff (F0005)
    };

    /// <summary>
    /// Validate uploaded file. Returns null if valid, error message if invalid.
    /// 
    /// Strategy: WHITELIST ONLY (no blacklist).
    ///   Layer 1: Extension phải nằm trong AllowedExts → chặn mọi loại file không mong muốn
    ///   Layer 2: Magic bytes phải khớp với extension → chặn file đổi đuôi (malware.svg → .pdf)
    /// </summary>
    public static string Validate(string fileName, System.IO.Stream fileStream)
    {
        string ext = System.IO.Path.GetExtension(fileName).ToLowerInvariant();

        // Layer 1: WHITELIST — chỉ cho phép extension đã biết
        if (!Array.Exists(AllowedExts, e => e == ext))
            return "File type not allowed. Accepted: " + string.Join(", ", AllowedExts);

        // Layer 2: MAGIC BYTES — verify nội dung thật sự khớp extension
        if (MagicBytes.TryGetValue(ext, out string[] validSignatures) && validSignatures != null)
        {
            byte[] header = new byte[5];
            fileStream.Read(header, 0, header.Length);
            fileStream.Position = 0; // CRITICAL: reset cho downstream processing

            string hex = BitConverter.ToString(header).Replace("-", "").ToUpper();
            bool matched = Array.Exists(validSignatures, sig => hex.StartsWith(sig));

            if (!matched)
                return "File content does not match expected format.";
        }

        return null; // Valid
    }
}
```

### Cách dùng tại mỗi upload handler

```csharp
// Chỉ cần 4 dòng, không cần chọn profile:
string error = FileUploadValidator.Validate(
    uploadControl.PostedFile.FileName,
    uploadControl.PostedFile.InputStream
);
if (error != null)
{
    CBase.DisplayAlert(this, "Comp", error, false);
    uploadControl.Dispose();
    return;
}
```

---

## Checklist áp dụng

- [ ] Tạo `FileUploadValidator.cs` trong `App_Code`
- [ ] **FundSetup.aspx.cs** — `FFProcessUpload` (đã plan trong SolvedResult.md, đổi sang dùng helper)
- [ ] **ComplianceDocView.aspx.cs** — `ProcessUploadGeneral` + sync fallback + `ProcessUploadFFAdd`
- [ ] **MemberSetup.aspx.cs** — `LogoProcessUpload` + `ProcessUpload` + sync fallback
- [ ] **PanelDocFileUpload.aspx.cs** — `ProcessUpload`
- [ ] **PanelDocFileUpload2.aspx.cs** — `ProcessUpload`
- [ ] **PanelDocFileUploadWithDesc.aspx.cs** — `ProcessUpload` + sync fallback
- [ ] **PanelDocUploadPlan.aspx.cs** — `ProcessUpload`
- [ ] **PanelFFAddTrx.aspx.cs** — `ProcessUploadFFAddTrx` (cả 2 bản)
- [ ] **PanelLogoUpload.aspx.cs** — `LogoProcessUpload` (cả 3 bản)
- [ ] **PanelLoanFileUpload.aspx.cs** — `LoanProcessUpload`
- [ ] **PanelFundataFileUpload.aspx.cs** — `FileProcessUpload`
- [ ] **PanelAMLFileUpload.aspx.cs** — `AMLProcessUpload`
- [ ] **PanelInsertList.aspx.cs** — `ProcessUpload1`
- [ ] **PopupAssetAllocationDef.aspx.cs** — `FFProcessUpload`
- [ ] **PopupNotificationAdd.aspx.cs** — `FileProcessUpload`
- [ ] **PopupLoanAdd.aspx.cs** — `FileProcessUpload`
- [ ] **ClientStatement.aspx.cs** — `ProcessUpload`
- [ ] **ClientImportView.aspx.cs** — `FileProcessUpload`
- [ ] **TSHImportView.aspx.cs** — `FileProcessUpload`
- [ ] **FINTRACView.aspx.cs** — `AMLProcessUpload`
- [ ] **UploadDocument.aspx.cs** (Plugin) — `HttpPostedFile` handler
