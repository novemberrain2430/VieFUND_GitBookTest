# Screen Catalog — Khoảng trống source và tín hiệu audit

> Đây là kết quả kiểm kê tĩnh, không phải kết luận về artifact đang chạy ở production.

## 1. Code-behind được khai báo nhưng file đích không tồn tại

| Markup | Khai báo | Inherits | Có resolve bằng class/companion khác? |
|---|---|---|:---:|
| [WebApp/Main/ATest.aspx](../../../WebApp/Main/ATest.aspx) | `ATest.aspx.cs` | `WebApp.Main.ATest` | Không |
| [WebApp/Main/ComplianceTrendRedFeeIssue.aspx](../../../WebApp/Main/ComplianceTrendRedFeeIssue.aspx) | `ComplianceTrendRedFee.aspx.cs` | `WebApp.Main.CompTrendRedFee` | Có |
| [WebApp/Main/RedemptionScheduleView.aspx](../../../WebApp/Main/RedemptionScheduleView.aspx) | `RemdemptionScheduleView.aspx.cs` | `WebApp.Main.RemdemptionScheduleView` | Có |
| [WebApp/Main/UBCalendar.aspx](../../../WebApp/Main/UBCalendar.aspx) | `UBCalendar.aspx.cs` | `WebApp.Main.CCalendar` | Không |

## 2. Endpoint có Inherits nhưng không resolve được class source

| Markup | Inherits | Project item |
|---|---|:---:|
| [WebApp/Dash2_FR.aspx](../../../WebApp/Dash2_FR.aspx) | `W.connect.Dashboard` | — |
| [WebApp/Dash2.aspx](../../../WebApp/Dash2.aspx) | `W.connect.Dashboard` | — |
| [WebApp/Main/ATest.aspx](../../../WebApp/Main/ATest.aspx) | `WebApp.Main.ATest` | — |
| [WebApp/Main/CommPayrollHistoryPrn_FR.aspx](../../../WebApp/Main/CommPayrollHistoryPrn_FR.aspx) | `WebApp.Main.CommrollHistoryPrn` | ✅ |
| [WebApp/Main/PlanKYCRpt.aspx](../../../WebApp/Main/PlanKYCRpt.aspx) | `WebApp.Main.ClientKYCRpt` | — |
| [WebApp/Main/PopupTrxManualBuy.aspx](../../../WebApp/Main/PopupTrxManualBuy.aspx) | `WebApp.Main.PopupTrxManualBuy` | — |
| [WebApp/Main/UBCalendar.aspx](../../../WebApp/Main/UBCalendar.aspx) | `WebApp.Main.CCalendar` | — |
| [WebApp/Test/DropDownWithAutoComplete/TestAppForDropDown/Default.aspx](../../../WebApp/Test/DropDownWithAutoComplete/TestAppForDropDown/Default.aspx) | `TestAppForDropDown._Default` | — |

## 3. Content item của project nhưng file ASPX không tồn tại

Có **44** item, toàn bộ thuộc [`WebClient.csproj`](../../../WebClient/WebClient.csproj#L154). Đây là source/project gap có thể làm publish hoặc build phụ thuộc cấu hình thất bại; cần xác minh project file hiện hành trước khi xóa item hay phục hồi markup.

- `WebClient/Default1108.aspx`
- `WebClient/Default1109.aspx`
- `WebClient/Default1112.aspx`
- `WebClient/Default1120.aspx`
- `WebClient/Default1138.aspx`
- `WebClient/Default1145.aspx`
- `WebClient/Default1167.aspx`
- `WebClient/Default1200WC.aspx`
- `WebClient/Default1214.aspx`
- `WebClient/Default1216.aspx`
- `WebClient/Default1256.aspx`
- `WebClient/Default1274.aspx`
- `WebClient/Default1307.aspx`
- `WebClient/Default1450.aspx`
- `WebClient/Default1514.aspx`
- `WebClient/Default1608.aspx`
- `WebClient/Default1623.aspx`
- `WebClient/Default1634.aspx`
- `WebClient/Default1675.aspx`
- `WebClient/Default1696.aspx`
- `WebClient/Default1697.aspx`
- `WebClient/Default1707_0206.aspx`
- `WebClient/Default1707.aspx`
- `WebClient/Default1711.aspx`
- `WebClient/Default1722.aspx`
- `WebClient/Default1723.aspx`
- `WebClient/Default1734.aspx`
- `WebClient/Default1765.aspx`
- `WebClient/Default1776.aspx`
- `WebClient/Default1800.aspx`
- `WebClient/Default1817.aspx`
- `WebClient/Default1818.aspx`
- `WebClient/Default1829.aspx`
- `WebClient/Default1841.aspx`
- `WebClient/Default1842.aspx`
- `WebClient/Default1853.aspx`
- `WebClient/Default1854.aspx`
- `WebClient/Default1865.aspx`
- `WebClient/Default1876.aspx`
- `WebClient/Default1911.aspx`
- `WebClient/Default2031.aspx`
- `WebClient/Default2092.aspx`
- `WebClient/Default2093.aspx`
- `WebClient/Default5555.aspx`

## 4. ASPX có trên disk nhưng không nằm trong Content item của project

Có **202** file. Đây là tín hiệu legacy/dealer copy hoặc artifact bị bỏ khỏi project; không tự động kết luận là dead code vì Web Site/runtime packaging có thể khác source project.

<details>
<summary>Danh sách đầy đủ</summary>

- [WebApp/Dash2_FR.aspx](../../../WebApp/Dash2_FR.aspx)
- [WebApp/Dash2.aspx](../../../WebApp/Dash2.aspx)
- [WebApp/Default_1.aspx](../../../WebApp/Default_1.aspx)
- [WebApp/Default_1108.aspx](../../../WebApp/Default_1108.aspx)
- [WebApp/Default_1911.aspx](../../../WebApp/Default_1911.aspx)
- [WebApp/Default_Old.aspx](../../../WebApp/Default_Old.aspx)
- [WebApp/Default1001_Old.aspx](../../../WebApp/Default1001_Old.aspx)
- [WebApp/Default1001.aspx](../../../WebApp/Default1001.aspx)
- [WebApp/Default1002.aspx](../../../WebApp/Default1002.aspx)
- [WebApp/Default101.aspx](../../../WebApp/Default101.aspx)
- [WebApp/Default1107.aspx](../../../WebApp/Default1107.aspx)
- [WebApp/Default1108.aspx](../../../WebApp/Default1108.aspx)
- [WebApp/Default1109.aspx](../../../WebApp/Default1109.aspx)
- [WebApp/Default1120.aspx](../../../WebApp/Default1120.aspx)
- [WebApp/Default1138.aspx](../../../WebApp/Default1138.aspx)
- [WebApp/Default1145.aspx](../../../WebApp/Default1145.aspx)
- [WebApp/Default1167.aspx](../../../WebApp/Default1167.aspx)
- [WebApp/Default1194.aspx](../../../WebApp/Default1194.aspx)
- [WebApp/Default1200.aspx](../../../WebApp/Default1200.aspx)
- [WebApp/Default1206.aspx](../../../WebApp/Default1206.aspx)
- [WebApp/Default1214.aspx](../../../WebApp/Default1214.aspx)
- [WebApp/Default1216.aspx](../../../WebApp/Default1216.aspx)
- [WebApp/Default1256.aspx](../../../WebApp/Default1256.aspx)
- [WebApp/Default1274.aspx](../../../WebApp/Default1274.aspx)
- [WebApp/Default1292.aspx](../../../WebApp/Default1292.aspx)
- [WebApp/Default1307.aspx](../../../WebApp/Default1307.aspx)
- [WebApp/Default1450.aspx](../../../WebApp/Default1450.aspx)
- [WebApp/Default1514.aspx](../../../WebApp/Default1514.aspx)
- [WebApp/Default1608.aspx](../../../WebApp/Default1608.aspx)
- [WebApp/Default1623.aspx](../../../WebApp/Default1623.aspx)
- [WebApp/Default1634.aspx](../../../WebApp/Default1634.aspx)
- [WebApp/Default1675.aspx](../../../WebApp/Default1675.aspx)
- [WebApp/Default1696.aspx](../../../WebApp/Default1696.aspx)
- [WebApp/Default1697.aspx](../../../WebApp/Default1697.aspx)
- [WebApp/Default1707.aspx](../../../WebApp/Default1707.aspx)
- [WebApp/Default1711.aspx](../../../WebApp/Default1711.aspx)
- [WebApp/Default1722.aspx](../../../WebApp/Default1722.aspx)
- [WebApp/Default1723.aspx](../../../WebApp/Default1723.aspx)
- [WebApp/Default1734.aspx](../../../WebApp/Default1734.aspx)
- [WebApp/Default1765.aspx](../../../WebApp/Default1765.aspx)
- [WebApp/Default1766.aspx](../../../WebApp/Default1766.aspx)
- [WebApp/Default1776.aspx](../../../WebApp/Default1776.aspx)
- [WebApp/Default1800.aspx](../../../WebApp/Default1800.aspx)
- [WebApp/Default1817.aspx](../../../WebApp/Default1817.aspx)
- [WebApp/Default1818.aspx](../../../WebApp/Default1818.aspx)
- [WebApp/Default1829.aspx](../../../WebApp/Default1829.aspx)
- [WebApp/Default1841.aspx](../../../WebApp/Default1841.aspx)
- [WebApp/Default1842.aspx](../../../WebApp/Default1842.aspx)
- [WebApp/Default1853.aspx](../../../WebApp/Default1853.aspx)
- [WebApp/Default1854.aspx](../../../WebApp/Default1854.aspx)
- [WebApp/Default1865.aspx](../../../WebApp/Default1865.aspx)
- [WebApp/Default1876.aspx](../../../WebApp/Default1876.aspx)
- [WebApp/Default1911.aspx](../../../WebApp/Default1911.aspx)
- [WebApp/Default1912.aspx](../../../WebApp/Default1912.aspx)
- [WebApp/Default2031.aspx](../../../WebApp/Default2031.aspx)
- [WebApp/Default2092.aspx](../../../WebApp/Default2092.aspx)
- [WebApp/Default2093.aspx](../../../WebApp/Default2093.aspx)
- [WebApp/Default2131.aspx](../../../WebApp/Default2131.aspx)
- [WebApp/Default2182.aspx](../../../WebApp/Default2182.aspx)
- [WebApp/Default2193.aspx](../../../WebApp/Default2193.aspx)
- [WebApp/Default2201.aspx](../../../WebApp/Default2201.aspx)
- [WebApp/Default2225.aspx](../../../WebApp/Default2225.aspx)
- [WebApp/Default2262.aspx](../../../WebApp/Default2262.aspx)
- [WebApp/Default2301.aspx](../../../WebApp/Default2301.aspx)
- [WebApp/Default2392.aspx](../../../WebApp/Default2392.aspx)
- [WebApp/Default2393.aspx](../../../WebApp/Default2393.aspx)
- [WebApp/Default2394.aspx](../../../WebApp/Default2394.aspx)
- [WebApp/Default2501.aspx](../../../WebApp/Default2501.aspx)
- [WebApp/Default5256.aspx](../../../WebApp/Default5256.aspx)
- [WebApp/Default5555.aspx](../../../WebApp/Default5555.aspx)
- [WebApp/DefaultGP.aspx](../../../WebApp/DefaultGP.aspx)
- [WebApp/DefaultOld.aspx](../../../WebApp/DefaultOld.aspx)
- [WebApp/Inc/CustomLoginPage_GP.aspx](../../../WebApp/Inc/CustomLoginPage_GP.aspx)
- [WebApp/Main/ATest.aspx](../../../WebApp/Main/ATest.aspx)
- [WebApp/Main/BarChart1_2.aspx](../../../WebApp/Main/BarChart1_2.aspx)
- [WebApp/Main/Client_PlanInvObj_Old.aspx](../../../WebApp/Main/Client_PlanInvObj_Old.aspx)
- [WebApp/Main/Client_ViewFATCA_FR_TBD.aspx](../../../WebApp/Main/Client_ViewFATCA_FR_TBD.aspx)
- [WebApp/Main/Client_ViewFATCA_TBD.aspx](../../../WebApp/Main/Client_ViewFATCA_TBD.aspx)
- [WebApp/Main/ClientSummaryPrn_FR.aspx](../../../WebApp/Main/ClientSummaryPrn_FR.aspx)
- [WebApp/Main/ClientSummaryPrn.aspx](../../../WebApp/Main/ClientSummaryPrn.aspx)
- [WebApp/Main/CommFilePrn_FR.aspx](../../../WebApp/Main/CommFilePrn_FR.aspx)
- [WebApp/Main/CommFilePrn.aspx](../../../WebApp/Main/CommFilePrn.aspx)
- [WebApp/Main/ComplianceAccountPrn_FR.aspx](../../../WebApp/Main/ComplianceAccountPrn_FR.aspx)
- [WebApp/Main/ComplianceAccountPrn.aspx](../../../WebApp/Main/ComplianceAccountPrn.aspx)
- [WebApp/Main/ComplianceAccountUpdatePrn_FR.aspx](../../../WebApp/Main/ComplianceAccountUpdatePrn_FR.aspx)
- [WebApp/Main/ComplianceAccountUpdatePrn.aspx](../../../WebApp/Main/ComplianceAccountUpdatePrn.aspx)
- [WebApp/Main/ComplianceIncompleteKYCPrn_FR.aspx](../../../WebApp/Main/ComplianceIncompleteKYCPrn_FR.aspx)
- [WebApp/Main/ComplianceIncompleteKYCPrn.aspx](../../../WebApp/Main/ComplianceIncompleteKYCPrn.aspx)
- [WebApp/Main/ComplianceTrend2SidedPrn_FR.aspx](../../../WebApp/Main/ComplianceTrend2SidedPrn_FR.aspx)
- [WebApp/Main/ComplianceTrend2SidedPrn.aspx](../../../WebApp/Main/ComplianceTrend2SidedPrn.aspx)
- [WebApp/Main/ComplianceTrendDSCIssuePrn_FR.aspx](../../../WebApp/Main/ComplianceTrendDSCIssuePrn_FR.aspx)
- [WebApp/Main/ComplianceTrendDSCIssuePrn.aspx](../../../WebApp/Main/ComplianceTrendDSCIssuePrn.aspx)
- [WebApp/Main/ComplianceTrendExCommPrn_FR.aspx](../../../WebApp/Main/ComplianceTrendExCommPrn_FR.aspx)
- [WebApp/Main/ComplianceTrendExCommPrn.aspx](../../../WebApp/Main/ComplianceTrendExCommPrn.aspx)
- [WebApp/Main/ComplianceTrendPlanPrn_FR.aspx](../../../WebApp/Main/ComplianceTrendPlanPrn_FR.aspx)
- [WebApp/Main/ComplianceTrendPlanPrn.aspx](../../../WebApp/Main/ComplianceTrendPlanPrn.aspx)
- [WebApp/Main/ComplianceTrendRedFeeIssuePrn_FR.aspx](../../../WebApp/Main/ComplianceTrendRedFeeIssuePrn_FR.aspx)
- [WebApp/Main/ComplianceTrendRedFeeIssuePrn.aspx](../../../WebApp/Main/ComplianceTrendRedFeeIssuePrn.aspx)
- [WebApp/Main/ComplianceTrendShortTermPrn_FR.aspx](../../../WebApp/Main/ComplianceTrendShortTermPrn_FR.aspx)
- [WebApp/Main/ComplianceTrendShortTermPrn.aspx](../../../WebApp/Main/ComplianceTrendShortTermPrn.aspx)
- [WebApp/Main/ComplianceTrendSwitchFeeIssuePrn_FR.aspx](../../../WebApp/Main/ComplianceTrendSwitchFeeIssuePrn_FR.aspx)
- [WebApp/Main/ComplianceTrendSwitchFeeIssuePrn.aspx](../../../WebApp/Main/ComplianceTrendSwitchFeeIssuePrn.aspx)
- [WebApp/Main/ComplianceTrendSwitchLoadPrn_FR.aspx](../../../WebApp/Main/ComplianceTrendSwitchLoadPrn_FR.aspx)
- [WebApp/Main/ComplianceTrendSwitchLoadPrn.aspx](../../../WebApp/Main/ComplianceTrendSwitchLoadPrn.aspx)
- [WebApp/Main/ComplianceTrxBody_FROld.aspx](../../../WebApp/Main/ComplianceTrxBody_FROld.aspx)
- [WebApp/Main/ComplianceTrxBodyOld.aspx](../../../WebApp/Main/ComplianceTrxBodyOld.aspx)
- [WebApp/Main/ComplianceTrxPrn.aspx](../../../WebApp/Main/ComplianceTrxPrn.aspx)
- [WebApp/Main/DashBoard_Client.aspx](../../../WebApp/Main/DashBoard_Client.aspx)
- [WebApp/Main/DashBoard_FR_Old.aspx](../../../WebApp/Main/DashBoard_FR_Old.aspx)
- [WebApp/Main/DocuSignTest.aspx](../../../WebApp/Main/DocuSignTest.aspx)
- [WebApp/Main/EasyServ.aspx](../../../WebApp/Main/EasyServ.aspx)
- [WebApp/Main/GICView_FR_Old.aspx](../../../WebApp/Main/GICView_FR_Old.aspx)
- [WebApp/Main/GICView_old.aspx](../../../WebApp/Main/GICView_old.aspx)
- [WebApp/Main/MemberSetupCommission_FR.aspx](../../../WebApp/Main/MemberSetupCommission_FR.aspx)
- [WebApp/Main/MemberSetupCommission.aspx](../../../WebApp/Main/MemberSetupCommission.aspx)
- [WebApp/Main/ModalPopup.aspx](../../../WebApp/Main/ModalPopup.aspx)
- [WebApp/Main/PanelAMLFileUpload_FR_TBD.aspx](../../../WebApp/Main/PanelAMLFileUpload_FR_TBD.aspx)
- [WebApp/Main/PanelAMLFileUpload_TBD.aspx](../../../WebApp/Main/PanelAMLFileUpload_TBD.aspx)
- [WebApp/Main/PanelBulkSwitchBasketEdit_FR.aspx](../../../WebApp/Main/PanelBulkSwitchBasketEdit_FR.aspx)
- [WebApp/Main/PanelBulkSwitchBasketEdit.aspx](../../../WebApp/Main/PanelBulkSwitchBasketEdit.aspx)
- [WebApp/Main/PanelClientAddress_FR.aspx](../../../WebApp/Main/PanelClientAddress_FR.aspx)
- [WebApp/Main/PanelClientAddress.aspx](../../../WebApp/Main/PanelClientAddress.aspx)
- [WebApp/Main/PanelClientReportOptions.aspx](../../../WebApp/Main/PanelClientReportOptions.aspx)
- [WebApp/Main/PanelConversionBulkBasket.aspx](../../../WebApp/Main/PanelConversionBulkBasket.aspx)
- [WebApp/Main/PanelDocFileUpload2.aspx](../../../WebApp/Main/PanelDocFileUpload2.aspx)
- [WebApp/Main/PanelEditFundLocations.aspx](../../../WebApp/Main/PanelEditFundLocations.aspx)
- [WebApp/Main/PanelEditFundReturns.aspx](../../../WebApp/Main/PanelEditFundReturns.aspx)
- [WebApp/Main/PanelETFProcessDividend.aspx](../../../WebApp/Main/PanelETFProcessDividend.aspx)
- [WebApp/Main/PanelGICMatProcessError.aspx](../../../WebApp/Main/PanelGICMatProcessError.aspx)
- [WebApp/Main/PanelGICTransferEdit.aspx](../../../WebApp/Main/PanelGICTransferEdit.aspx)
- [WebApp/Main/PanelGICViewSearchAcct_FR.aspx](../../../WebApp/Main/PanelGICViewSearchAcct_FR.aspx)
- [WebApp/Main/PanelGICViewSearchAcct.aspx](../../../WebApp/Main/PanelGICViewSearchAcct.aspx)
- [WebApp/Main/PanelNR4Edit.aspx](../../../WebApp/Main/PanelNR4Edit.aspx)
- [WebApp/Main/PanelOmniTrxProcessStatusChange.aspx](../../../WebApp/Main/PanelOmniTrxProcessStatusChange.aspx)
- [WebApp/Main/PanelPdfOrderReceiptOptTradeAdd.aspx](../../../WebApp/Main/PanelPdfOrderReceiptOptTradeAdd.aspx)
- [WebApp/Main/PanelPlanPayment.aspx](../../../WebApp/Main/PanelPlanPayment.aspx)
- [WebApp/Main/PanelPlanTrustAdd_FR_TBD.aspx](../../../WebApp/Main/PanelPlanTrustAdd_FR_TBD.aspx)
- [WebApp/Main/PanelPlanTrustAdd_TBD.aspx](../../../WebApp/Main/PanelPlanTrustAdd_TBD.aspx)
- [WebApp/Main/PanelReportClientOptions2.aspx](../../../WebApp/Main/PanelReportClientOptions2.aspx)
- [WebApp/Main/PanelRESPRecord900Edit.aspx](../../../WebApp/Main/PanelRESPRecord900Edit.aspx)
- [WebApp/Main/PanelSession_FR.aspx](../../../WebApp/Main/PanelSession_FR.aspx)
- [WebApp/Main/PanelSession.aspx](../../../WebApp/Main/PanelSession.aspx)
- [WebApp/Main/PanelSigPos.aspx](../../../WebApp/Main/PanelSigPos.aspx)
- [WebApp/Main/PanelTrustDepositExtra.aspx](../../../WebApp/Main/PanelTrustDepositExtra.aspx)
- [WebApp/Main/PanelTrustRESPPYMT_PSE_TBD.aspx](../../../WebApp/Main/PanelTrustRESPPYMT_PSE_TBD.aspx)
- [WebApp/Main/PdfFormLoading.aspx](../../../WebApp/Main/PdfFormLoading.aspx)
- [WebApp/Main/PieChart1.aspx](../../../WebApp/Main/PieChart1.aspx)
- [WebApp/Main/PieChart2.aspx](../../../WebApp/Main/PieChart2.aspx)
- [WebApp/Main/PlanApprovalBox_TBD.aspx](../../../WebApp/Main/PlanApprovalBox_TBD.aspx)
- [WebApp/Main/PlanKYCRpt.aspx](../../../WebApp/Main/PlanKYCRpt.aspx)
- [WebApp/Main/PlanView_FR - Copy.aspx](../../../WebApp/Main/PlanView_FR%20-%20Copy.aspx)
- [WebApp/Main/PopupAccountAddBody_FR2.aspx](../../../WebApp/Main/PopupAccountAddBody_FR2.aspx)
- [WebApp/Main/PopupAFFilePrn_FR.aspx](../../../WebApp/Main/PopupAFFilePrn_FR.aspx)
- [WebApp/Main/PopupAFFilePrn.aspx](../../../WebApp/Main/PopupAFFilePrn.aspx)
- [WebApp/Main/PopupClientReportTypes2.aspx](../../../WebApp/Main/PopupClientReportTypes2.aspx)
- [WebApp/Main/PopupEmptyAddBody.aspx](../../../WebApp/Main/PopupEmptyAddBody.aspx)
- [WebApp/Main/PopupExport.aspx](../../../WebApp/Main/PopupExport.aspx)
- [WebApp/Main/PopupLSFilePrn_FR.aspx](../../../WebApp/Main/PopupLSFilePrn_FR.aspx)
- [WebApp/Main/PopupLSFilePrn.aspx](../../../WebApp/Main/PopupLSFilePrn.aspx)
- [WebApp/Main/PopupMiscellaneousSetting_FR_TBD.aspx](../../../WebApp/Main/PopupMiscellaneousSetting_FR_TBD.aspx)
- [WebApp/Main/PopupMiscellaneousSetting_TBD.aspx](../../../WebApp/Main/PopupMiscellaneousSetting_TBD.aspx)
- [WebApp/Main/PopupOrderBatch_1.aspx](../../../WebApp/Main/PopupOrderBatch_1.aspx)
- [WebApp/Main/PopupPlanAddBody1_FR.aspx](../../../WebApp/Main/PopupPlanAddBody1_FR.aspx)
- [WebApp/Main/PopupRSAccountStmt.aspx](../../../WebApp/Main/PopupRSAccountStmt.aspx)
- [WebApp/Main/PopupTrxManualBuy.aspx](../../../WebApp/Main/PopupTrxManualBuy.aspx)
- [WebApp/Main/PopupTrxManualBuyBody.aspx](../../../WebApp/Main/PopupTrxManualBuyBody.aspx)
- [WebApp/Main/PopupWebClientRequest1_panel_FR.aspx](../../../WebApp/Main/PopupWebClientRequest1_panel_FR.aspx)
- [WebApp/Main/RoundedPanel.aspx](../../../WebApp/Main/RoundedPanel.aspx)
- [WebApp/Main/RRIFView.aspx](../../../WebApp/Main/RRIFView.aspx)
- [WebApp/Main/SettlementView_Reminder_FR__.aspx](../../../WebApp/Main/SettlementView_Reminder_FR__.aspx)
- [WebApp/Main/TAView_FR.aspx](../../../WebApp/Main/TAView_FR.aspx)
- [WebApp/Main/TAView.aspx](../../../WebApp/Main/TAView.aspx)
- [WebApp/Main/Test.aspx](../../../WebApp/Main/Test.aspx)
- [WebApp/Main/Test1.aspx](../../../WebApp/Main/Test1.aspx)
- [WebApp/Main/Test123.aspx](../../../WebApp/Main/Test123.aspx)
- [WebApp/Main/Test1234.aspx](../../../WebApp/Main/Test1234.aspx)
- [WebApp/Main/Test2.aspx](../../../WebApp/Main/Test2.aspx)
- [WebApp/Main/TrxViewPrn_FR_Old.aspx](../../../WebApp/Main/TrxViewPrn_FR_Old.aspx)
- [WebApp/Main/TrxViewPrn_Old.aspx](../../../WebApp/Main/TrxViewPrn_Old.aspx)
- [WebApp/Main/UBCalendar.aspx](../../../WebApp/Main/UBCalendar.aspx)
- [WebApp/Main/UBGate.aspx](../../../WebApp/Main/UBGate.aspx)
- [WebApp/Main/View.aspx](../../../WebApp/Main/View.aspx)
- [WebApp/Main/YearEnd_RL18_FR.aspx](../../../WebApp/Main/YearEnd_RL18_FR.aspx)
- [WebApp/Main/YearEnd_T4A_FR_Old.aspx](../../../WebApp/Main/YearEnd_T4A_FR_Old.aspx)
- [WebApp/Main/YearEnd_T4A_Old.aspx](../../../WebApp/Main/YearEnd_T4A_Old.aspx)
- [WebApp/Main/YearEnd_T4RIF_TBD.aspx](../../../WebApp/Main/YearEnd_T4RIF_TBD.aspx)
- [WebApp/Main/YearEnd_T5008_FR_Old.aspx](../../../WebApp/Main/YearEnd_T5008_FR_Old.aspx)
- [WebApp/Main/YearEnd_T5008_Old.aspx](../../../WebApp/Main/YearEnd_T5008_Old.aspx)
- [WebApp/Test/DropDownWithAutoComplete/TestAppForDropDown/Default.aspx](../../../WebApp/Test/DropDownWithAutoComplete/TestAppForDropDown/Default.aspx)
- [WebClient/DefaultWC2392.aspx](../../../WebClient/DefaultWC2392.aspx)
- [WebClient/DefaultWC2393.aspx](../../../WebClient/DefaultWC2393.aspx)
- [WebClient/DefaultWC2394.aspx](../../../WebClient/DefaultWC2394.aspx)
- [WebClient/Main/Client_Summary_Cash_FR.aspx](../../../WebClient/Main/Client_Summary_Cash_FR.aspx)
- [WebClient/Main/Client_Summary_Cash.aspx](../../../WebClient/Main/Client_Summary_Cash.aspx)
- [WebClient/Main/Client_Summary_Fund_FR.aspx](../../../WebClient/Main/Client_Summary_Fund_FR.aspx)
- [WebClient/Main/Client_Summary_Fund.aspx](../../../WebClient/Main/Client_Summary_Fund.aspx)
- [WebClient/Main/Client_Summary_GIC_FR.aspx](../../../WebClient/Main/Client_Summary_GIC_FR.aspx)
- [WebClient/Main/Client_Summary_GIC.aspx](../../../WebClient/Main/Client_Summary_GIC.aspx)
- [WebClient/Main/ClientSummaryPrn_FR.aspx](../../../WebClient/Main/ClientSummaryPrn_FR.aspx)
- [WebClient/Main/ClientSummaryPrn.aspx](../../../WebClient/Main/ClientSummaryPrn.aspx)
- [WebClient/Main/PopupNotificationBody.aspx](../../../WebClient/Main/PopupNotificationBody.aspx)
- [WebClient/Main/PopupNotificationReply.aspx](../../../WebClient/Main/PopupNotificationReply.aspx)

</details>

## 5. Findings đã xác minh liên quan trực tiếp tới UI inventory

1. [`CommPayrollHistoryPrn_FR.aspx`](../../../WebApp/Main/CommPayrollHistoryPrn_FR.aspx#L1) khai báo `Inherits="WebApp.Main.CommrollHistoryPrn"`; source chỉ có class [`WebApp.Main.CommPayrollHistoryPrn`](../../../WebApp/Main/CommPayrollHistoryPrn.aspx.cs#L22). [`MenuFunctions.js`](../../../WebApp/Js/MenuFunctions.js#L975) vẫn route tiếng Pháp tới page này. Đây là lỗi mapping class đã được ghi trong UI Patterns.
2. Có **286/581** endpoint đặt `validateRequest="false"`; đây là bề mặt cần review theo input/output context, không nên bật lại hàng loạt.
3. File không có direct SP literal không chứng minh không truy cập dữ liệu. Phần lớn screen gọi qua `UBClasses`; catalog cố ý không suy diễn tên SP từ toàn file hoặc từ tên method.

## 6. Cách xử lý từng loại khoảng trống

- Với route nghi active: kiểm tra menu/JS, project publish profile, setting theo DSID và request log trước khi sửa/xóa.
- Với class mismatch: xác minh route bằng compile/publish hoặc smoke test đúng language/dealer.
- Với fragment: lần ngược `Included by`; nếu không có parent tĩnh, tìm dynamic include/copy trong build/deploy.
- Với dữ liệu: đi từ trace ID hoặc code-behind → BLL → `SetSP` → SP Catalog; không nhảy thẳng từ tên màn hình sang bảng.
