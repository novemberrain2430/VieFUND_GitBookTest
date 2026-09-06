# Screen Catalog — UI → Code và dữ liệu

> Catalog được tái tạo từ **1358** file ASPX trong `WebApp` và `WebClient`, đối chiếu `.csproj`, Page directive, server-side include, code-behind và Traceability Matrix ngày 2026-09-05. `VFCsvExport` không nằm trong phạm vi.

## 1. Kết luận nhanh

- **581 endpoint** có `<%@ Page>`; **777 fragment** không phải URL độc lập.
- **1156/1358** markup có `Content Include` trong project; **202** file chỉ có trên disk và phải coi là legacy/deployment gap cho tới khi có bằng chứng runtime.
- Resolve được code-behind cho **922** artifact, quy về **452** file code-behind; endpoint có **259** giá trị `Inherits` duy nhất.
- **494** artifact là `_FR` hoặc có culture FR; nhiều cặp EN/FR chia sẻ cùng class/code-behind.
- **75** artifact có ít nhất một literal SP gọi trực tiếp trong code-behind; **137** artifact nối được với trace source-audited. Các màn hình khác không được tự động gán bảng/SP nếu code đi qua BLL hoặc tên động.

Điểm vào tra cứu:

- [Inventory đầy đủ 1.358 ASPX](screen-catalog/inventory.md) — path, loại, project membership, code-behind, parent include, direct SP clue và trace ID.
- [Khoảng trống source và tín hiệu audit](screen-catalog/source-gaps.md) — target code thiếu, class không resolve và file ngoài project.
- [Traceability Matrix](traceability-matrix.md) — 50 action quan trọng đã đi sâu UI/API → BLL → SP → DB.
- [UI Patterns](../viefund-framework/ui-patterns.md) — lifecycle, include, popup/panel, localization và menu architecture.

## 2. Phạm vi và đơn vị đếm

“ASPX artifact” không đồng nghĩa “màn hình người dùng”. Một business screen có thể gồm page EN/FR, panel, body, JS callback và print view; ngược lại nhiều dealer login page dùng chung một class. Catalog giữ nguyên từng artifact để không mất đường dẫn source, đồng thời phân loại endpoint/fragment để tránh đếm sai.

| Loại | Số file | Ý nghĩa |
|---|---:|---|
| Lookup endpoint | 56 | Có Page directive; có thể là request endpoint, nhưng availability còn phụ thuộc deploy/menu/quyền. |
| Other fragment | 254 | Không có Page directive; thường được include vào page/class cha. |
| Page endpoint | 274 | Có Page directive; có thể là request endpoint, nhưng availability còn phụ thuộc deploy/menu/quyền. |
| Panel fragment | 443 | Không có Page directive; thường được include vào page/class cha. |
| PDF endpoint | 6 | Có Page directive; có thể là request endpoint, nhưng availability còn phụ thuộc deploy/menu/quyền. |
| Popup endpoint | 191 | Có Page directive; có thể là request endpoint, nhưng availability còn phụ thuộc deploy/menu/quyền. |
| Popup/body/JS fragment | 80 | Không có Page directive; thường được include vào page/class cha. |
| Print endpoint | 54 | Có Page directive; có thể là request endpoint, nhưng availability còn phụ thuộc deploy/menu/quyền. |
| **Tổng** | **1358** | `WebApp` + `WebClient`, đã loại thư mục build và `VFCsvExport`. |

## 3. Phân bố theo miền gợi ý

Miền dưới đây được gán theo tên file để **tìm kiếm**, không phải kết luận ownership nghiệp vụ. Các page dùng chung như `Client.aspx`, PDF, notification có thể chạm nhiều miền.

| Miền gợi ý | ASPX artifact | Endpoint | Fragment |
|---|---:|---:|---:|
| Account & Plan | 126 | 47 | 79 |
| Administration | 83 | 25 | 58 |
| Auth / shell | 117 | 94 | 23 |
| Client & KYC | 176 | 43 | 133 |
| Commission & Fee | 78 | 30 | 48 |
| Compliance | 124 | 89 | 35 |
| Fund & GIC | 101 | 28 | 73 |
| Onboarding | 3 | 2 | 1 |
| Other | 305 | 141 | 164 |
| Report / Export | 61 | 26 | 35 |
| Tax & Year-End | 60 | 6 | 54 |
| Trading & Orders | 124 | 50 | 74 |

## 4. Bản đồ màn hình nghiệp vụ trọng tâm

Bảng này chỉ chọn screen/boundary có giá trị định hướng cao. Link `Trace` là bằng chứng chi tiết tới method, SP và DB object; screen không có trace không bị coi là “không dùng dữ liệu”.

| Miền | Screen / component | Người dùng làm gì | Data mapping đã xác minh |
|---|---|---|---|
| Auth & Session | [WebApp/Default.aspx](../../WebApp/Default.aspx) | Đăng nhập nhân viên/advisor, quên mật khẩu, 2FA | [AUTH-01](traceability-matrix.md#auth-session), [AUTH-03](traceability-matrix.md#auth-session), [AUTH-04](traceability-matrix.md#auth-session) |
| Auth & Session | [WebClient/Default.aspx](../../WebClient/Default.aspx) | Đăng nhập client portal | [AUTH-02](traceability-matrix.md#auth-session) |
| Auth & Session | [WebApp/Main/Logout.aspx](../../WebApp/Main/Logout.aspx) | Lưu setting và đóng session | [AUTH-05](traceability-matrix.md#auth-session) |
| Client & KYC | [WebApp/Main/Client.aspx](../../WebApp/Main/Client.aspx) | Tìm client, mở context client/plan; queue NFU | [CL-01](traceability-matrix.md#client-kyc), [AP-03](traceability-matrix.md#account-plan), [FS-01](traceability-matrix.md#fundserv) |
| Client & KYC | [WebApp/Main/PopupClientAdd.aspx](../../WebApp/Main/PopupClientAdd.aspx) | Đọc, thêm và cập nhật hồ sơ client | [CL-02](traceability-matrix.md#client-kyc), [CL-03](traceability-matrix.md#client-kyc), [CL-04](traceability-matrix.md#client-kyc) |
| Account & Plan | [WebApp/Main/PopupPlanAdd.aspx](../../WebApp/Main/PopupPlanAdd.aspx) | Thêm/cập nhật plan | [AP-01](traceability-matrix.md#account-plan), [AP-02](traceability-matrix.md#account-plan) |
| Account & Plan | [WebApp/Main/PanelPlanBenAdd.aspx](../../WebApp/Main/PanelPlanBenAdd.aspx) | Đọc/sửa beneficiary trong dialog | [AP-04](traceability-matrix.md#account-plan) |
| Account & Plan | [WebApp/Main/PanelRRIFPayment.aspx](../../WebApp/Main/PanelRRIFPayment.aspx) | Cấu hình RRIF payment | [AP-05](traceability-matrix.md#account-plan) |
| Trading & Orders | [WebApp/Main/PopupTradeAdd.aspx](../../WebApp/Main/PopupTradeAdd.aspx) | Buy/Sell/Switch và pending order | [TR-01](traceability-matrix.md#trading-orders), [TR-02](traceability-matrix.md#trading-orders), [TR-03](traceability-matrix.md#trading-orders), [TR-04](traceability-matrix.md#trading-orders) |
| Trading & Orders | [WebApp/Main/TrxView.aspx](../../WebApp/Main/TrxView.aspx) | Tìm/paging/sort giao dịch | [TR-05](traceability-matrix.md#trading-orders) |
| Trading & Orders | [WebApp/Main/PopupTrxManualAdd.aspx](../../WebApp/Main/PopupTrxManualAdd.aspx) | Thêm/sửa manual transaction | [TR-06](traceability-matrix.md#trading-orders) |
| Commission & Fee | [WebApp/Main/CommissionView.aspx](../../WebApp/Main/CommissionView.aspx) | Revenue search, move payable, payroll/history | [CM-01](traceability-matrix.md#commission-fee), [CM-02](traceability-matrix.md#commission-fee), [CM-03](traceability-matrix.md#commission-fee), [CM-04](traceability-matrix.md#commission-fee) |
| Commission & Fee | [WebApp/Main/PanelFeeProcess.aspx](../../WebApp/Main/PanelFeeProcess.aspx) | Khởi tạo và kết thúc fee processing | [CM-05](traceability-matrix.md#commission-fee) |
| Compliance | [WebApp/Main/ComplianceTrx.aspx](../../WebApp/Main/ComplianceTrx.aspx) | Review/approve trade suitability | [CO-01](traceability-matrix.md#compliance), [CO-02](traceability-matrix.md#compliance) |
| Compliance | [WebApp/Main/ComplianceAccount.aspx](../../WebApp/Main/ComplianceAccount.aspx) | Approve account opening | [CO-03](traceability-matrix.md#compliance) |
| Compliance | [WebApp/Main/ComplianceAccountUpdate.aspx](../../WebApp/Main/ComplianceAccountUpdate.aspx) | Approve KYC update | [CO-04](traceability-matrix.md#compliance) |
| Compliance | [WebApp/Main/ComplianceIncompleteKYC.aspx](../../WebApp/Main/ComplianceIncompleteKYC.aspx) | Theo dõi client/plan thiếu KYC | [CO-05](traceability-matrix.md#compliance) |
| Fund & GIC | [WebApp/Main/PanelFundPicker.aspx](../../WebApp/Main/PanelFundPicker.aspx) | Tìm fund và favorite | [FG-01](traceability-matrix.md#fund-gic), [FG-02](traceability-matrix.md#fund-gic) |
| Fund & GIC | [WebApp/Main/PanelCannexOrder.aspx](../../WebApp/Main/PanelCannexOrder.aspx) | Tìm rate sản phẩm GIC | [FG-03](traceability-matrix.md#fund-gic) |
| Tax & Year-End | [WebApp/Main/YearEnd.aspx](../../WebApp/Main/YearEnd.aspx) | Điều phối year-end và submission | [TX-05](traceability-matrix.md#tax-year-end) |
| Tax & Year-End | [WebApp/Main/YearEnd_T4RSP.aspx](../../WebApp/Main/YearEnd_T4RSP.aspx) | Pending/process T4RSP | [TX-01](traceability-matrix.md#tax-year-end), [TX-02](traceability-matrix.md#tax-year-end) |
| Tax & Year-End | [WebApp/Main/PanelT619.aspx](../../WebApp/Main/PanelT619.aspx) | Lưu transmitter và tạo export request | [TX-03](traceability-matrix.md#tax-year-end), [TX-04](traceability-matrix.md#tax-year-end) |
| Onboarding | [WebApp/Main/OnBoardView.aspx](../../WebApp/Main/OnBoardView.aspx) | Review/reject onboarding item | [OB-03](traceability-matrix.md#onboarding), [OB-04](traceability-matrix.md#onboarding) |
| Cross-cutting | [WebApp/Main/PdfView.aspx](../../WebApp/Main/PdfView.aspx) | Route và trả PDF | [XF-01](traceability-matrix.md#cross-cutting) |
| Cross-cutting | [WebApp/Main/PopupNotificationAdd.aspx](../../WebApp/Main/PopupNotificationAdd.aspx) | Tạo notification/email outbox | [XF-02](traceability-matrix.md#cross-cutting) |

## 5. Cách tìm một chức năng từ UI tới DB

1. Tìm filename/text/control trong inventory; xác định đó là endpoint hay fragment.
2. Nếu là fragment, dùng `Included by` để tìm page cha. Nếu là `_FR`, kiểm tra class/code-behind EN được chia sẻ.
3. Mở code-behind đã resolve; tìm event handler, `On...`, `Update...`, `Get...`, `Save...` và lời gọi `UBClasses`.
4. Nếu inventory có trace ID, dùng Traceability Matrix. Nếu chưa có, theo method scope tới `CDatabase.SetSP`, rồi tra procedure trong SP Catalog.
5. Đọc SP và procedure con để xác nhận table/status/selection/audit; luôn giữ DBID, DSID, user/session và option trong trace.
6. Cuối cùng mới xác minh menu/setting/quyền/publish/runtime log để kết luận user nào thực sự nhìn thấy route.

## 6. Giới hạn của catalog

- Không chứng minh screen được deploy hoặc xuất hiện trên menu production.
- Không coi prefix `Panel`/`Popup` là type system; Page directive và include graph có ưu tiên cao hơn tên file.
- Direct SP clue chỉ lấy literal trong code-behind; không gán SP theo tên tương tự và không gom biến ngoài method scope.
- UserControl `.ascx`, ASMX, Windows Service và client-side route ngoài ASPX không nằm trong inventory này; chúng đã được mô tả ở UI Patterns, Onboarding, Fundserv và Traceability Matrix.
- Phân nhóm miền là heuristic tìm kiếm. Ownership/chức năng chính xác phải quay lại code và module guide.

## 7. Findings cần theo dõi

- **4** markup khai báo code file không tồn tại tại path đã ghi; **8** endpoint có Inherits không khớp class source. Xem [chi tiết](screen-catalog/source-gaps.md).
- **44** Content item của [`WebClient.csproj`](../../WebClient/WebClient.csproj#L154) trỏ tới ASPX không còn trên disk; cần xác minh project/publish configuration.
- [`CommPayrollHistoryPrn_FR.aspx`](../../WebApp/Main/CommPayrollHistoryPrn_FR.aspx#L1) có `Inherits` sai class; source class đúng nằm ở [`CommPayrollHistoryPrn.aspx.cs`](../../WebApp/Main/CommPayrollHistoryPrn.aspx.cs#L22), và [`MenuFunctions.js`](../../WebApp/Js/MenuFunctions.js#L975) vẫn route FR tới page lỗi. Đây là bug đã xác minh, không phải suy đoán từ naming.
- **286/581** endpoint tắt request validation; cần review theo field/context khi sửa màn hình.
- **202** file ASPX không nằm trong project Content item; cần phân biệt artifact legacy với file được publish trước khi sửa/xóa.

## 8. Tái tạo

Chạy từ repository root:

```powershell
pwsh -File Docs_V2/reference/generate-screen-catalog.ps1
```

Generator dừng nếu một critical screen bị thiếu. Inventory và source gaps được ghi lại hoàn toàn từ source hiện tại.

## 9. Tài liệu liên quan

- [Reference index](README.md)
- [SP Catalog](sp-catalog/README.md)
- [Data Dictionary](data-dictionary.md)
- [Traceability Matrix](traceability-matrix.md)
- [UI Patterns](../viefund-framework/ui-patterns.md)
