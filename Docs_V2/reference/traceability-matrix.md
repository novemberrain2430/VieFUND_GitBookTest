# Traceability Matrix — UI/API → Code → SP → Database

> Ma trận truy vết 50 luồng quan trọng, sinh từ manifest đã kiểm tra trực tiếp với source C# và `ScriptDB/000_4_CreateSP.sql` ngày 2026-09-05. `VFCsvExport` không nằm trong phạm vi.

## 1. Cách đọc và ranh giới

Mỗi dòng trả lời bốn câu hỏi: action bắt đầu ở đâu, code nào điều phối, procedure nào thực thi và đối tượng DB trọng yếu nào nằm trong call graph SQL. Generator chỉ sinh file khi entry token, logic token, procedure definition và DB object khai báo đều tồn tại.

Ma trận này tập trung vào luồng nghiệp vụ/trục kỹ thuật quan trọng. Inventory toàn bộ Web Forms nằm ở [Screen Catalog](screen-catalog.md); inventory toàn bộ procedure nằm ở [SP Catalog](sp-catalog/).

Các giới hạn:

- DB object được xác minh trong procedure hoặc procedure con gọi qua `EXEC/EXECUTE`; đây không phải danh sách mọi bảng phụ.
- “Có reference” không chứng minh route được bật ở production; cần kiểm tra menu/setting/quyền/runtime.
- Tên SP động, dynamic SQL, SQL Agent và integration ngoài workspace có thể tạo thêm cạnh chưa biểu diễn.
- Bảng temporary/selection theo user vẫn là DB state, không phải browser-only state.

## 2. Tổng quan coverage

| Miền | Số luồng |
|---|---:|
| [Account & Plan](#account-plan) | 5 |
| [Auth & Session](#auth-session) | 5 |
| [Client & KYC](#client-kyc) | 5 |
| [Commission & Fee](#commission-fee) | 5 |
| [Compliance](#compliance) | 5 |
| [Cross-cutting](#cross-cutting) | 2 |
| [Fund & GIC](#fund-gic) | 3 |
| [Fundserv](#fundserv) | 4 |
| [Onboarding](#onboarding) | 5 |
| [Tax & Year-End](#tax-year-end) | 5 |
| [Trading & Orders](#trading-orders) | 6 |
| **Tổng** | **50** |

## 3. Ma trận

<a id="account-plan"></a>

### Account & Plan

| ID | Boundary / action | Entry point | Logic | Stored procedure | DB objects trọng yếu | Ghi chú |
|---|---|---|---|---|---|---|
| `AP-01` | **WebApp UI**<br>Thêm plan | [OnSave](../../WebApp/Main/PopupPlanAdd.aspx.cs#L2537)<br>`WebApp\Main\PopupPlanAdd.aspx.cs` | [Plan.PlanAddUI](../../UBClasses/Plan.cs#L939)<br>`UBClasses\Plan.cs` | [`UBPlanAdd`](../../ScriptDB/000_4_CreateSP.sql#L484219) | `UB_Plan`, `UB_CustomerPlan` | Nhánh iPlanID bằng 0. |
| `AP-02` | **WebApp UI**<br>Cập nhật plan | [OnSave](../../WebApp/Main/PopupPlanAdd.aspx.cs#L2537)<br>`WebApp\Main\PopupPlanAdd.aspx.cs` | [Plan.PlanAddUI](../../UBClasses/Plan.cs#L939)<br>`UBClasses\Plan.cs` | [`UBPlanUpdate`](../../ScriptDB/000_4_CreateSP.sql#L501437) | `UB_Plan`, `UB_CustomerPlan` | Nhánh iPlanID khác 0. |
| `AP-03` | **WebApp UI**<br>Xóa plan | [OnPlanDelete](../../WebApp/Main/Client.aspx.cs#L3866)<br>`WebApp\Main\Client.aspx.cs` | [Plan.PlanDeleteUI](../../UBClasses/Plan.cs#L1058)<br>`UBClasses\Plan.cs` | [`UBPlanDelete`](../../ScriptDB/000_4_CreateSP.sql#L488265) | `UB_Plan`, `UB_FundAccount` | SP kiểm tra dữ liệu account/position trước khi xóa. |
| `AP-04` | **WebApp panel**<br>Đọc/sửa beneficiary | [PanelPlanBenAdd](../../WebApp/Main/PanelPlanBenAdd.aspx.cs#L94)<br>`WebApp\Main\PanelPlanBenAdd.aspx.cs` | [CDatabase trực tiếp](../../WebApp/Main/PanelPlanBenAdd.aspx.cs#L94)<br>`WebApp\Main\PanelPlanBenAdd.aspx.cs` | [`UBPlanInfoBenEdit`](../../ScriptDB/000_4_CreateSP.sql#L491618) | `UB_PlanBen`, `UB_Address` | Panel gọi CDatabase trực tiếp, không qua Plan BLL cho action này. |
| `AP-05` | **WebApp panel**<br>Lưu RRIF payment setting | [OnSave](../../WebApp/Main/PanelRRIFPayment.aspx.cs#L2028)<br>`WebApp\Main\PanelRRIFPayment.aspx.cs` | [RRIFSetting.PlanRRIFSettingUpdate](../../UBClasses/RRIFSetting.cs#L495)<br>`UBClasses\RRIFSetting.cs` | [`UBRRIFSettingSave`](../../ScriptDB/000_4_CreateSP.sql#L593927) | `UB_RRIFSetting`, `UB_RRIFSettingFund` | Gồm bank/cheque/fund allocation và waiting state. |

<a id="auth-session"></a>

### Auth & Session

| ID | Boundary / action | Entry point | Logic | Stored procedure | DB objects trọng yếu | Ghi chú |
|---|---|---|---|---|---|---|
| `AUTH-01` | **WebApp UI**<br>Đăng nhập nhân viên/advisor | [Default.LogIn](../../WebApp/Default.aspx.cs#L349)<br>`WebApp\Default.aspx.cs` | [CMember.SessionLoginX](../../UBClasses/Member.cs#L1206)<br>`UBClasses\Member.cs` | [`UBMemberLogin`](../../ScriptDB/000_4_CreateSP.sql#L442823) | `UB_Member`, `UB_MemberLogin` | SP trả quyền, dealer context và trạng thái 2FA. |
| `AUTH-02` | **WebClient UI**<br>Đăng nhập client portal | [Default.LogIn](../../WebClient/Default.aspx.cs#L220)<br>`WebClient\Default.aspx.cs` | [CCustomer.SessionLoginX](../../UBClasses/Customer.cs#L3781)<br>`UBClasses\Customer.cs` | [`UBClientLogin`](../../ScriptDB/000_4_CreateSP.sql#L223875) | `UB_Customer`, `UB_CustomerLogin` | Luồng portal dùng session key WC riêng. |
| `AUTH-03` | **WebApp UI**<br>Quên mật khẩu nhân viên | [OnForgotPW](../../WebApp/Default.aspx.cs#L278)<br>`WebApp\Default.aspx.cs` | [CDatabase.MemberForgotPW](../../UBConnection/CDatabase.cs#L2621)<br>`UBConnection\CDatabase.cs` | [`UBMemberForgotPW`](../../ScriptDB/000_4_CreateSP.sql#L441012) | `UB_Member`, `UB_EmailOutBox` | SP tạo mật khẩu tạm và email outbox. |
| `AUTH-04` | **WebApp UI**<br>Sinh/gửi mã 2FA | [On2FASendCode](../../WebApp/Default.aspx.cs#L532)<br>`WebApp\Default.aspx.cs` | [CDatabase.GetNew2FACode](../../UBConnection/CDatabase.cs#L2677)<br>`UBConnection\CDatabase.cs` | [`UB2FAGetCode4User`](../../ScriptDB/000_4_CreateSP.sql#L173204) | `UB_Member`, `UB_MemberLogin` | Email do DB chuẩn bị; SMS đi qua Twilio ở code-behind. |
| `AUTH-05` | **WebApp UI**<br>Đăng xuất và đóng session | [OnLogout](../../WebApp/Main/Logout.aspx.cs#L75)<br>`WebApp\Main\Logout.aspx.cs` | [CBase.SessionLogout](../../UBClasses/CBase.cs#L3066)<br>`UBClasses\CBase.cs` | [`UBSessionEnd`](../../ScriptDB/000_4_CreateSP.sql#L599932) | `UB_MemberLogin` | Có bước lưu setting trước khi kết thúc session. |

<a id="client-kyc"></a>

### Client & KYC

| ID | Boundary / action | Entry point | Logic | Stored procedure | DB objects trọng yếu | Ghi chú |
|---|---|---|---|---|---|---|
| `CL-01` | **WebApp UI**<br>Tìm client | [UpdateClientSearchList](../../WebApp/Main/Client.aspx.cs#L3389)<br>`WebApp\Main\Client.aspx.cs` | [CCustomer.GetClientSearchList](../../UBClasses/Customer.cs#L397)<br>`UBClasses\Customer.cs` | [`UBClientSearchLoad`](../../ScriptDB/000_4_CreateSP.sql#L231749) | `UB_Customer`, `UB_CustomerSearchList` | Search list được materialize theo user. |
| `CL-02` | **WebApp UI**<br>Mở hồ sơ client | [UpdateClientInfo](../../WebApp/Main/PopupClientAdd.aspx.cs#L489)<br>`WebApp\Main\PopupClientAdd.aspx.cs` | [CCustomer.GetClientDataSet](../../UBClasses/Customer.cs#L212)<br>`UBClasses\Customer.cs` | [`UBClientInfo`](../../ScriptDB/000_4_CreateSP.sql#L217806) | `UB_Customer`, `UB_CustomerRep` | SP trả DataSet nhiều result table theo RecType. |
| `CL-03` | **WebApp UI**<br>Thêm client | [OnSave](../../WebApp/Main/PopupClientAdd.aspx.cs#L2241)<br>`WebApp\Main\PopupClientAdd.aspx.cs` | [CCustomer.ClientAddUI](../../UBClasses/Customer.cs#L2342)<br>`UBClasses\Customer.cs` | [`UBClientAddUI`](../../ScriptDB/000_4_CreateSP.sql#L212952) | `UB_Customer`, `UB_CustomerFinInfo` | Nhánh iClientID bằng 0. |
| `CL-04` | **WebApp UI**<br>Cập nhật client | [OnSave](../../WebApp/Main/PopupClientAdd.aspx.cs#L2241)<br>`WebApp\Main\PopupClientAdd.aspx.cs` | [CCustomer.ClientAddUI](../../UBClasses/Customer.cs#L2342)<br>`UBClasses\Customer.cs` | [`UBClientUpdateUI`](../../ScriptDB/000_4_CreateSP.sql#L234882) | `UB_Customer`, `UB_CustomerFinInfo` | Nhánh iClientID lớn hơn 0; dùng cùng method với add. |
| `CL-05` | **BLL/shared UI**<br>Đọc bộ KYC client/plan | [CCustomer.GetClientKYCSet](../../UBClasses/Customer.cs#L245)<br>`UBClasses\Customer.cs` | [CCustomer.GetClientKYCSet](../../UBClasses/Customer.cs#L259)<br>`UBClasses\Customer.cs` | [`UBClientKYC`](../../ScriptDB/000_4_CreateSP.sql#L221861) | `UB_Customer`, `UB_CustomerExtraInfo` | Caller UI thay đổi theo màn hình; contract DB nằm ở BLL này. |

<a id="commission-fee"></a>

### Commission & Fee

| ID | Boundary / action | Entry point | Logic | Stored procedure | DB objects trọng yếu | Ghi chú |
|---|---|---|---|---|---|---|
| `CM-01` | **WebApp UI**<br>Tìm commission revenue | [UpdateViewList](../../WebApp/Main/CommissionView.aspx.cs#L854)<br>`WebApp\Main\CommissionView.aspx.cs` | [CommissionRevenue.GetViewList](../../UBClasses/CommissionRevenue.cs#L407)<br>`UBClasses\CommissionRevenue.cs` | [`UBCommissionViewSearch`](../../ScriptDB/000_4_CreateSP.sql#L258172) | `UB_CommRevenue`, `UB_CommRevenueSearchListTMP` | Danh sách, total, paging và selection theo user. |
| `CM-02` | **WebApp UI**<br>Chuyển revenue sang payable | [OnMoveToPayable](../../WebApp/Main/CommissionView.aspx.cs#L1369)<br>`WebApp\Main\CommissionView.aspx.cs` | [CommissionRevenue.MoveTagged2Payable](../../UBClasses/CommissionRevenue.cs#L268)<br>`UBClasses\CommissionRevenue.cs` | [`UBCommissionMove2Payable`](../../ScriptDB/000_4_CreateSP.sql#L242713) | `UB_CommRevenue`, `UB_CommRevenueHeader` | Xử lý các dòng đã tag và grouping header. |
| `CM-03` | **WebApp UI**<br>Chạy payroll | [OnPayrollProcess](../../WebApp/Main/CommissionView.aspx.cs#L2328)<br>`WebApp\Main\CommissionView.aspx.cs` | [CommissionRevenue.PayrollProcess](../../UBClasses/CommissionRevenue.cs#L1416)<br>`UBClasses\CommissionRevenue.cs` | [`UBCommPayrollProcess`](../../ScriptDB/000_4_CreateSP.sql#L262330) | `UB_CommPayroll`, `UB_CommPayable` | Tên SP nằm trong biến cục bộ nhưng giá trị tĩnh. |
| `CM-04` | **WebApp UI**<br>Xem payroll history | [UpdatePayrollHistory](../../WebApp/Main/CommissionView.aspx.cs#L2478)<br>`WebApp\Main\CommissionView.aspx.cs` | [CommissionRevenue.GetPayrollHistoryList](../../UBClasses/CommissionRevenue.cs#L1499)<br>`UBClasses\CommissionRevenue.cs` | [`UBCommissionPayrollSearchHistory`](../../ScriptDB/000_4_CreateSP.sql#L255000) | `UB_CommPayroll`, `UB_CommPayable` | Có filter/paging và balance-forward option. |
| `CM-05` | **WebApp panel**<br>Khởi tạo/kết thúc fee processing | [OnProcess](../../WebApp/Main/PanelFeeProcess.aspx.cs#L283)<br>`WebApp\Main\PanelFeeProcess.aspx.cs` | [CFeeProcessing worker](../../UBClasses/FeeProcessing.cs#L265)<br>`UBClasses\FeeProcessing.cs` | [`UBFeeProcessStart`](../../ScriptDB/000_4_CreateSP.sql#L338966)<br>[`UBFeeProcessEnd`](../../ScriptDB/000_4_CreateSP.sql#L335419) | `UB_FeeProcess`, `UB_PlanFee` | Worker chạy nhiều bước; matrix ghi boundary start/end. |

<a id="compliance"></a>

### Compliance

| ID | Boundary / action | Entry point | Logic | Stored procedure | DB objects trọng yếu | Ghi chú |
|---|---|---|---|---|---|---|
| `CO-01` | **WebApp UI**<br>Danh sách trade suitability | [UpdateList](../../WebApp/Main/ComplianceTrx.aspx.cs#L368)<br>`WebApp\Main\ComplianceTrx.aspx.cs` | [Compliance.TrxSuitabilitySet](../../UBClasses/Compliance.cs#L636)<br>`UBClasses\Compliance.cs` | [`UBCompTrxSuitabilityListByPlan`](../../ScriptDB/000_4_CreateSP.sql#L289733) | `UB_CompTrxApprovalStatusARC`, `UB_FundTrx` | Có filter cấp review/status/plan/rep. |
| `CO-02` | **WebApp UI**<br>Approve trade đã tag | [OnApproveTagged](../../WebApp/Main/ComplianceTrx.aspx.cs#L1033)<br>`WebApp\Main\ComplianceTrx.aspx.cs` | [Compliance.TrxApproveTagged](../../UBClasses/Compliance.cs#L1432)<br>`UBClasses\Compliance.cs` | [`UBCompTrxApproveTaggedItems`](../../ScriptDB/000_4_CreateSP.sql#L285406) | `UB_CompTrxApprovalStatusARC` | Wrapper SQL dispatch từng trade sang status update. |
| `CO-03` | **WebApp UI**<br>Approve account opening đã tag | [OnApproveTagged](../../WebApp/Main/ComplianceAccount.aspx.cs#L694)<br>`WebApp\Main\ComplianceAccount.aspx.cs` | [Compliance.AccountOpeningApproveTagged](../../UBClasses/Compliance.cs#L6037)<br>`UBClasses\Compliance.cs` | [`UBCompAccountOpeningApproveTaggedItems`](../../ScriptDB/000_4_CreateSP.sql#L269575) | `UB_CompPlanApprovalStatus` | Có approval level và deficiency notes. |
| `CO-04` | **WebApp UI**<br>Approve KYC update đã tag | [OnApproveTagged](../../WebApp/Main/ComplianceAccountUpdate.aspx.cs#L627)<br>`WebApp\Main\ComplianceAccountUpdate.aspx.cs` | [Compliance.AccountKYCUpdateApproveTagged](../../UBClasses/Compliance.cs#L5982)<br>`UBClasses\Compliance.cs` | [`UBCompAccountKYCUpdateApproveTaggedItems`](../../ScriptDB/000_4_CreateSP.sql#L266865) | `UB_CompPlanApprovalStatus` | Tách khỏi account-opening queue. |
| `CO-05` | **WebApp UI**<br>Theo dõi missing KYC | [UpdateList](../../WebApp/Main/ComplianceIncompleteKYC.aspx.cs#L152)<br>`WebApp\Main\ComplianceIncompleteKYC.aspx.cs` | [Plan.MissingKYCSet](../../UBClasses/Plan.cs#L2775)<br>`UBClasses\Plan.cs` | [`UBCompMissingKYCList`](../../ScriptDB/000_4_CreateSP.sql#L277576) | `UB_CompCheckClient`, `UB_CompCheckPlan` | Queue tổng hợp client và plan chưa đủ KYC. |

<a id="cross-cutting"></a>

### Cross-cutting

| ID | Boundary / action | Entry point | Logic | Stored procedure | DB objects trọng yếu | Ghi chú |
|---|---|---|---|---|---|---|
| `XF-01` | **WebApp endpoint**<br>Đọc PDF object đã lưu | [PdfView route](../../WebApp/Main/PdfView.aspx.cs#L368)<br>`WebApp\Main\PdfView.aspx.cs` | [PdfBuilder.GetPdfObjDataX](../../VieFUNDPdf/CPDF.cs#L18763)<br>`VieFUNDPdf\CPDF.cs` | [`UBGetPdfObj`](../../ScriptDB/000_4_CreateSP.sql#L404157) | `UB_PdfObj` | Route/type quyết định thêm các bảng slip archive. |
| `XF-02` | **WebApp popup**<br>Tạo notification | [OnSave](../../WebApp/Main/PopupNotificationAdd.aspx.cs#L282)<br>`WebApp\Main\PopupNotificationAdd.aspx.cs` | [CNotification.Add](../../UBClasses/Notification.cs#L30)<br>`UBClasses\Notification.cs` | [`UBNotifyAdd`](../../ScriptDB/000_4_CreateSP.sql#L455589) | `UB_Notification`, `UB_EmailOutBox` | Một action có thể vừa tạo inbox notification vừa queue email. |

<a id="fund-gic"></a>

### Fund & GIC

| ID | Boundary / action | Entry point | Logic | Stored procedure | DB objects trọng yếu | Ghi chú |
|---|---|---|---|---|---|---|
| `FG-01` | **WebApp panel**<br>Tìm fund | [UpdateFundList](../../WebApp/Main/PanelFundPicker.aspx.cs#L202)<br>`WebApp\Main\PanelFundPicker.aspx.cs` | [CFundDef.GetFundListSearch](../../UBClasses/FundDef.cs#L300)<br>`UBClasses\FundDef.cs` | [`UBFundSearchList`](../../ScriptDB/000_4_CreateSP.sql#L385648) | `UB_FundDef`, `UB_FundDefDetail` | Fund picker dùng chung ở nhiều popup. |
| `FG-02` | **WebApp panel**<br>Thêm fund favorite | [OnFavoriteAdd](../../WebApp/Main/PanelFundPicker.aspx.cs#L148)<br>`WebApp\Main\PanelFundPicker.aspx.cs` | [CFundDef.AddFavorite](../../UBClasses/FundDef.cs#L2278)<br>`UBClasses\FundDef.cs` | [`UBFundFavoriteAdd`](../../ScriptDB/000_4_CreateSP.sql#L381931) | `UB_FundDef`, `UB_FundDefFavorite` | Favorite gắn với user. |
| `FG-03` | **WebApp panel**<br>Tìm rate sản phẩm GIC | [UpdateGICRateList](../../WebApp/Main/PanelCannexOrder.aspx.cs#L450)<br>`WebApp\Main\PanelCannexOrder.aspx.cs` | [CFundDef.GICProdRateSearch](../../UBClasses/FundDef.cs#L4415)<br>`UBClasses\FundDef.cs` | [`UBGICDefLookup`](../../ScriptDB/000_4_CreateSP.sql#L414515) | `UB_GICProdDef`, `UB_GICRate` | Tên method cũ nói RateSearch, SP thực tế là UBGICDefLookup. |

<a id="fundserv"></a>

### Fundserv

| ID | Boundary / action | Entry point | Logic | Stored procedure | DB objects trọng yếu | Ghi chú |
|---|---|---|---|---|---|---|
| `FS-01` | **WebApp UI**<br>Queue NFU thay đổi account/client | [Client NFU action](../../WebApp/Main/Client.aspx.cs#L10901)<br>`WebApp\Main\Client.aspx.cs` | [CNFU.AddNFU](../../UBClasses/NFU.cs#L462)<br>`UBClasses\NFU.cs` | [`UBNFUAdd`](../../ScriptDB/000_4_CreateSP.sql#L451245) | `UB_FundAccount`, `UB_Plan` | NFU được ghi vào DB để service sinh file sau. |
| `FS-02` | **Windows Service**<br>Sinh order file CO | [UBImportFS.OnTimer](../../VieFUNDIE/VieFUNDIE.cs#L754)<br>`VieFUNDIE\VieFUNDIE.cs` | [COrder.OrderFileGenerate](../../UBFFImport/COrder.cs#L103)<br>`UBFFImport\COrder.cs` | [`UBOrderCreateFile`](../../ScriptDB/000_4_CreateSP.sql#L473439)<br>[`UBOrderFileUpdateStatus`](../../ScriptDB/000_4_CreateSP.sql#L474356) | `UB_OrderWaiting2Send`, `UB_OrderMSG` | Service đọc waiting orders, ghi file rồi cập nhật status. |
| `FS-03` | **Windows Service**<br>Sinh NFU file | [UBImportFS.OnTimer](../../VieFUNDIE/VieFUNDIE.cs#L758)<br>`VieFUNDIE\VieFUNDIE.cs` | [CXM.FileGenerate](../../UBFFImport/CXM.cs#L94)<br>`UBFFImport\CXM.cs` | [`UBNFUCreateFile`](../../ScriptDB/000_4_CreateSP.sql#L451761) | `UB_NFUFile`, `UB_NFUMSG` | Cùng timer service với order export. |
| `FS-04` | **Import handler**<br>Nhập order response DR | [COrder.ImportXML](../../UBFFImport/COrder.cs#L168)<br>`UBFFImport\COrder.cs` | [COrder.ImportXMLOrderProcess](../../UBFFImport/COrder.cs#L787)<br>`UBFFImport\COrder.cs` | [`UBXMLRecOrderRespnProcess`](../../ScriptDB/000_4_CreateSP.sql#L694547) | `UB_OrderSent`, `UB_FundTrxOrder` | Parser XML chuẩn hóa record rồi SP cập nhật order/trx. |

<a id="onboarding"></a>

### Onboarding

| ID | Boundary / action | Entry point | Logic | Stored procedure | DB objects trọng yếu | Ghi chú |
|---|---|---|---|---|---|---|
| `OB-01` | **ASMX API**<br>Stage payload client | [ImportClient/ImportClientJSON](../../VFOnBoarding/VieFUNDOnBoarding.cs#L390)<br>`VFOnBoarding\VieFUNDOnBoarding.cs` | [COnBoarding.SaveOneRecord](../../VFOnBoarding/COnBoarding.cs#L112)<br>`VFOnBoarding\COnBoarding.cs` | [`UBOBItemAdd`](../../ScriptDB/000_4_CreateSP.sql#L466106) | `UB_OBItem` | Payload luôn vào staging trước khi xử lý. |
| `OB-02` | **ASMX API**<br>Xử lý và đóng item onboarding | [ImportClient/ImportClientJSON](../../VFOnBoarding/VieFUNDOnBoarding.cs#L390)<br>`VFOnBoarding\VieFUNDOnBoarding.cs` | [COnBoarding.ProcessOneItem](../../VFOnBoarding/COnBoarding.cs#L175)<br>`VFOnBoarding\COnBoarding.cs` | [`UBOBItemProcessEnd`](../../ScriptDB/000_4_CreateSP.sql#L468168) | `UB_OBItem` | Core client/plan xử lý trước khi cập nhật trạng thái tổng. |
| `OB-03` | **WebApp UI**<br>Danh sách onboarding item | [UpdatePendingList](../../WebApp/Main/OnBoardView.aspx.cs#L123)<br>`WebApp\Main\OnBoardView.aspx.cs` | [COnBoard.GetSet](../../UBClasses/COnBoard.cs#L34)<br>`UBClasses\COnBoard.cs` | [`UBOBItemList`](../../ScriptDB/000_4_CreateSP.sql#L466189) | `UB_OBItem` | SP hiện không filter đầy đủ DSID/user như guide đã ghi. |
| `OB-04` | **WebApp UI**<br>Reject onboarding item | [OnReject](../../WebApp/Main/OnBoardView.aspx.cs#L2327)<br>`WebApp\Main\OnBoardView.aspx.cs` | [COnBoard.ItemReject](../../UBClasses/COnBoard.cs#L237)<br>`UBClasses\COnBoard.cs` | [`UBOBItemReject`](../../ScriptDB/000_4_CreateSP.sql#L470184)<br>[`UBNotifyAdd`](../../ScriptDB/000_4_CreateSP.sql#L455589) | `UB_OBItem`, `UB_Notification` | SP reject gọi notification khi đủ dữ liệu email. |
| `OB-05` | **ASMX API**<br>Stage order import | [ImportBuy/Sell/Switch](../../VFOnBoarding/VieFUNDOnBoarding.cs#L799)<br>`VFOnBoarding\VieFUNDOnBoarding.cs` | [COnBoardingOrders.Process](../../VFOnBoarding/COnBoardingOrders.cs#L233)<br>`VFOnBoarding\COnBoardingOrders.cs` | [`UBOBOrderAdd`](../../ScriptDB/000_4_CreateSP.sql#L470531) | `UB_OBOrder` | Sau staging mới gọi UBOBFundTrxBuy/Sell/Switch. |

<a id="tax-year-end"></a>

### Tax & Year-End

| ID | Boundary / action | Entry point | Logic | Stored procedure | DB objects trọng yếu | Ghi chú |
|---|---|---|---|---|---|---|
| `TX-01` | **WebApp fragment**<br>Danh sách T4RSP Pending | [UpdatePendingList](../../WebApp/Main/YearEnd_T4RSP.aspx.cs#L566)<br>`WebApp\Main\YearEnd_T4RSP.aspx.cs` | [CT4RSP.GetPendingSet](../../UBClasses/T4RSP.cs#L486)<br>`UBClasses\T4RSP.cs` | [`UBT4RSPPendingList`](../../ScriptDB/000_4_CreateSP.sql#L622376) | `UB_T4RSPPendingSelectionTMP`, `UB_T4RSP_SLP` | Selection Pending được lưu theo user. |
| `TX-02` | **WebApp fragment**<br>Tạo T4RSP từ các dòng Pending | [OnProcessPending](../../WebApp/Main/YearEnd_T4RSP.aspx.cs#L470)<br>`WebApp\Main\YearEnd_T4RSP.aspx.cs` | [CT4RSP.ProcessPendingItems](../../UBClasses/T4RSP.cs#L202)<br>`UBClasses\T4RSP.cs` | [`UBT4RSPProcessPendingTaggedItems`](../../ScriptDB/000_4_CreateSP.sql#L623887)<br>[`UBT4RSPProcessOneItem`](../../ScriptDB/000_4_CreateSP.sql#L623406) | `UB_T4RSPPendingSelectionTMP`, `UB_T4RSP_SLP` | Wrapper lặp selection và gọi ProcessOneItem. |
| `TX-03` | **WebApp panel**<br>Lưu transmitter/T619 | [SaveT619](../../WebApp/Main/PanelT619.aspx.cs#L900)<br>`WebApp\Main\PanelT619.aspx.cs` | [CT619.UpdateInfo](../../UBClasses/T619.cs#L189)<br>`UBClasses\T619.cs` | [`UBT619InfoUpdate`](../../ScriptDB/000_4_CreateSP.sql#L632351) | `UB_T619TRM` | Option save-only không tạo export request. |
| `TX-04` | **WebApp panel**<br>Tạo request XML tax | [SaveT619](../../WebApp/Main/PanelT619.aspx.cs#L900)<br>`WebApp\Main\PanelT619.aspx.cs` | [CT619.UpdateInfo](../../UBClasses/T619.cs#L189)<br>`UBClasses\T619.cs` | [`UBT619InfoUpdate`](../../ScriptDB/000_4_CreateSP.sql#L632351)<br>[`UBExportAddRequestT`](../../ScriptDB/000_4_CreateSP.sql#L322702) | `UB_ExportRequest`, `UB_ExportRequestItem` | UBT619InfoUpdate gọi UBExportAddRequestT khi không phải save-only. |
| `TX-05` | **WebApp UI**<br>Đánh dấu Filed/Submitted | [OnSubmissionUpdate](../../WebApp/Main/YearEnd.aspx.cs#L1532)<br>`WebApp\Main\YearEnd.aspx.cs` | [CT619.SubmissionUpdate](../../UBClasses/T619.cs#L95)<br>`UBClasses\T619.cs` | [`UBCRASubmissionUpdate`](../../ScriptDB/000_4_CreateSP.sql#L294462) | `UB_ExportRequest`, `UB_T4RSP_SLP` | Cập nhật request và slip/current archive theo export type. |

<a id="trading-orders"></a>

### Trading & Orders

| ID | Boundary / action | Entry point | Logic | Stored procedure | DB objects trọng yếu | Ghi chú |
|---|---|---|---|---|---|---|
| `TR-01` | **WebApp popup**<br>Tạo lệnh Buy | [OnBuy](../../WebApp/Main/PopupTradeAdd.aspx.cs#L3244)<br>`WebApp\Main\PopupTradeAdd.aspx.cs` | [CTrx.Buy](../../UBClasses/Trx.cs#L633)<br>`UBClasses\Trx.cs` | [`UBFundTrxBuy`](../../ScriptDB/000_4_CreateSP.sql#L389772) | `UB_FundTrxOrder`, `UB_FundAccountPosition` | Rule plan, fund, compliance và settlement nằm trong SP. |
| `TR-02` | **WebApp popup**<br>Tạo lệnh Sell | [OnSell](../../WebApp/Main/PopupTradeAdd.aspx.cs#L3651)<br>`WebApp\Main\PopupTradeAdd.aspx.cs` | [CTrx.Sell](../../UBClasses/Trx.cs#L1019)<br>`UBClasses\Trx.cs` | [`UBFundTrxSell`](../../ScriptDB/000_4_CreateSP.sql#L397587) | `UB_FundTrxOrder`, `UB_FundAccountPosition` | Có nhánh cheque/bank và conversion. |
| `TR-03` | **WebApp popup**<br>Tạo lệnh Switch | [OnSwitch](../../WebApp/Main/PopupTradeAdd.aspx.cs#L3859)<br>`WebApp\Main\PopupTradeAdd.aspx.cs` | [CTrx.Switch](../../UBClasses/Trx.cs#L1267)<br>`UBClasses\Trx.cs` | [`UBFundTrxSwitch`](../../ScriptDB/000_4_CreateSP.sql#L400027) | `UB_FundTrxOrder`, `UB_FundTrx` | Ghi quan hệ from/to và audit order. |
| `TR-04` | **WebApp popup**<br>Xem pending orders | [UpdatePendingOrderList](../../WebApp/Main/PopupTradeAdd.aspx.cs#L4776)<br>`WebApp\Main\PopupTradeAdd.aspx.cs` | [CTrx.GetPendingOrderList](../../UBClasses/Trx.cs#L2498)<br>`UBClasses\Trx.cs` | [`UBTrxPendingOrderList`](../../ScriptDB/000_4_CreateSP.sql#L671518) | `UB_FundTrxOrder`, `UB_FundTrx` | Cùng BLL còn được Client.aspx tái sử dụng. |
| `TR-05` | **WebApp UI**<br>Tìm giao dịch | [UpdateViewList](../../WebApp/Main/TrxView.aspx.cs#L785)<br>`WebApp\Main\TrxView.aspx.cs` | [CTrx.GetViewList](../../UBClasses/Trx.cs#L2082)<br>`UBClasses\Trx.cs` | [`UBTrxViewSearch`](../../ScriptDB/000_4_CreateSP.sql#L674384) | `UB_FundTrx`, `UB_TrxSearchList` | Search/paging/sort và view setting theo user. |
| `TR-06` | **WebApp popup**<br>Thêm/sửa manual transaction | [OnSave](../../WebApp/Main/PopupTrxManualAdd.aspx.cs#L660)<br>`WebApp\Main\PopupTrxManualAdd.aspx.cs` | [CTrx.ManualUpdate](../../UBClasses/Trx.cs#L3080)<br>`UBClasses\Trx.cs` | [`UBFundTrxManualAdd`](../../ScriptDB/000_4_CreateSP.sql#L394947)<br>[`UBFundTrxManualUpdate`](../../ScriptDB/000_4_CreateSP.sql#L395604) | `UB_FundTrx`, `UB_FundAccountPosition` | SP được chọn bằng ternary theo iTrxID. |

## 4. Chuỗi end-to-end nên nhớ

```text
Browser/API/Service
  → code-behind / ASMX / timer service
  → UBClasses hoặc UBFFImport/VieFUNDPdf
  → CDatabase.SetSP + parameters
  → stored procedure chính
  → procedure con / tables / selection TMP / audit / outbox
```

Khi debug, không nhảy thẳng từ màn hình sang bảng: cần giữ nguyên DBID/DSID/user/session, option, status và result-set contract qua từng tầng.

## 5. Khoảng trống và findings liên quan

1. Catalog này xác minh 50 trace; không tuyên bố bao phủ toàn bộ 1.358 ASPX artifact hay 5.544 procedure. [Screen Catalog](screen-catalog.md) cung cấp breadth, còn matrix này cung cấp depth.
2. Các trace `AP-04` và một số page legacy gọi `CDatabase` trực tiếp, nên kiến trúc thực tế không luôn có một BLL riêng.
3. `FG-03` cho thấy tên method và SP có thể lệch (`GICProdRateSearch` → `UBGICDefLookup`); tìm theo business name thôi có thể bỏ sót.
4. `CM-03`, Tax wrappers và nhiều BLL dùng tên SP qua biến tĩnh; phải đọc assignment trong phạm vi method, không chỉ tìm `SetSP("...")`.
5. Các finding đã xác minh như Onboarding thiếu scope DSID, callback URL luôn pass, T4 export gap, ODBC và notification scope vẫn giữ ở module/framework guide; matrix chỉ chỉ ra đường ảnh hưởng, không lặp remediation.

Không phát hiện bug mới độc lập trong quá trình dựng 50 trace; các bất thường thấy lại đều đã có trong tracker/module guides.

## 6. Cách mở rộng an toàn

1. Thêm row vào `generate-traceability.ps1`, gồm entry token, logic token, procedure và DB object trọng yếu.
2. Chạy generator. Nếu một mắt xích không tồn tại, script dừng và báo ID lỗi.
3. Đọc toàn bộ SP contract để bổ sung status/permission/DSID; validator chỉ xác nhận liên kết tĩnh.
4. Cập nhật module guide nếu phát hiện business rule mới, và Screen Catalog nếu entry point UI thay đổi.

```powershell
& Docs_V2/reference/generate-traceability.ps1
```

## 7. Tài liệu liên quan

- [System Map](../getting-started/system-map.md)
- [Database Access](../viefund-framework/database-access.md)
- [Data Dictionary](data-dictionary.md)
- [SP Catalog](sp-catalog/)
- [Screen Catalog](screen-catalog.md)
- [Topics](../topics/)
