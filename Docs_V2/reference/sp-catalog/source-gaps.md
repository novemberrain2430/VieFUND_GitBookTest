# Chênh lệch giữa C# và SQL snapshot

> Đây là danh sách cần xác minh, không phải kết luận production DB thiếu procedure. Source, snapshot, deployment riêng hoặc tên sinh động có thể khác nhau.

Có **33** tên procedure tĩnh trong C# active không có definition khớp sau khi chuẩn hóa [dbo].[Name] về Name.

| Tên procedure | Loại biểu thức | Call sites | Caller mẫu | Biểu thức mẫu |
|---|---|---:|---|---|
| `OMDividendTrxProcessSynch` | literal trực tiếp | 1 | [Omnibus.cs:1256](../../../VFOmnibus/Omnibus.cs#L1256) | `"OMDividendTrxProcessSynch"` |
| `OMReportWeeklyHeaderList` | literal trực tiếp | 1 | [OMReport.cs:192](../../../VFOmnibus/OMReport.cs#L192) | `"OMReportWeeklyHeaderList"` |
| `UBCiroReportFileAdd` | literal trực tiếp | 1 | [CIRO.cs:947](../../../CIROExport/CIRO.cs#L947) | `"UBCiroReportFileAdd"` |
| `UBCiroReportFileDelete` | literal trực tiếp | 1 | [CIRO.cs:110](../../../CIROExport/CIRO.cs#L110) | `"UBCiroReportFileDelete"` |
| `UBCiroReportGetFileName` | literal trực tiếp | 1 | [CIRO.cs:769](../../../CIROExport/CIRO.cs#L769) | `"UBCiroReportGetFileName"` |
| `UBCiroReportGetPathFile` | literal trực tiếp | 1 | [CIRO.cs:153](../../../CIROExport/CIRO.cs#L153) | `"UBCiroReportGetPathFile"` |
| `UBCiroReportGetSPName` | literal trực tiếp | 1 | [CIRO.cs:707](../../../CIROExport/CIRO.cs#L707) | `"UBCiroReportGetSPName"` |
| `UBCiroReportGetSPNote` | literal trực tiếp | 1 | [CIRO.cs:421](../../../CIROExport/CIRO.cs#L421) | `"UBCiroReportGetSPNote"` |
| `UBCiroReportParamUpdate` | literal trực tiếp | 1 | [PopupEditParams.cs:174](../../../CIROExport/PopupEditParams.cs#L174) | `"UBCiroReportParamUpdate"` |
| `UBCiroReportSPAdd` | literal trực tiếp | 1 | [PopupAddSP.cs:61](../../../CIROExport/PopupAddSP.cs#L61) | `"UBCiroReportSPAdd"` |
| `UBClientChangePW` | literal trực tiếp | 1 | [CDatabase.cs:2563](../../../UBConnection/CDatabase.cs#L2563) | `"UBClientChangePW"` |
| `UBCompanyInfo` | literal trực tiếp | 1 | [Company.cs:131](../../../UBClasses/Company.cs#L131) | `"UBCompanyInfo"` |
| `UBEasyServSearchAccount` | literal trực tiếp | 1 | [ClientInfo.cs:1415](../../../UBExport/ClientInfo.cs#L1415) | `"UBEasyServSearchAccount"` |
| `UBFeeGenerateCommUI` | literal trực tiếp | 1 | [Fee.cs:2435](../../../UBClasses/Fee.cs#L2435) | `"UBFeeGenerateCommUI"` |
| `UBFeeRunDetailIDList` | literal trực tiếp | 1 | [Fee.cs:2797](../../../UBClasses/Fee.cs#L2797) | `"UBFeeRunDetailIDList"` |
| `UBFormSigFieldList` | literal trực tiếp | 1 | [CVFDocSign.cs:75](../../../VFDocSign/CVFDocSign.cs#L75) | `"UBFormSigFieldList"` |
| `UBFundRecentPurchaseList` | literal trực tiếp | 1 | [FundDef.cs:2418](../../../UBClasses/FundDef.cs#L2418) | `"UBFundRecentPurchaseList"` |
| `UBGICAccountMoveTrx` | literal trực tiếp | 1 | [TermDeposit.cs:1396](../../../UBClasses/TermDeposit.cs#L1396) | `"UBGICAccountMoveTrx"` |
| `UBMemberCommRepList` | literal trực tiếp | 2 | [Member.cs:2037](../../../UBClasses/Member.cs#L2037) | `"UBMemberCommRepList"` |
| `UBNR4PlanID` | literal trực tiếp | 1 | [NR4.cs:190](../../../UBClasses/NR4.cs#L190) | `"UBNR4PlanID"` |
| `UBPlanChange4Order` | literal trực tiếp | 1 | [Plan.cs:3741](../../../UBClasses/Plan.cs#L3741) | `"UBPlanChange4Order"` |
| `UBRESPBatchFileContentSave` | literal trực tiếp | 1 | [RESP_File.cs:1684](../../../UBExport/RESP_File.cs#L1684) | `"UBRESPBatchFileContentSave"` |
| `UBRESPBatchFileStatsSaveOne` | literal trực tiếp | 1 | [RESP_File.cs:1728](../../../UBExport/RESP_File.cs#L1728) | `"UBRESPBatchFileStatsSaveOne"` |
| `UBT4FHSAPlanID` | literal trực tiếp | 1 | [T4FHSA.cs:260](../../../UBClasses/T4FHSA.cs#L260) | `"UBT4FHSAPlanID"` |
| `UBTrustRESPTrxVerifyBen` | literal trực tiếp | 1 | [PopupTrustDepositAdd.aspx.cs:1786](../../../WebApp/Main/PopupTrustDepositAdd.aspx.cs#L1786) | `"UBTrustRESPTrxVerifyBen"` |
| `UBTrxType` | literal trong biểu thức | 1 | [Trx.cs:461](../../../UBClasses/Trx.cs#L461) | `bDetail == true ? "UBTrxTypeDetail" : "UBTrxType"` |
| `UBTrxTypeDetail` | literal trong biểu thức | 1 | [Trx.cs:461](../../../UBClasses/Trx.cs#L461) | `bDetail == true ? "UBTrxTypeDetail" : "UBTrxType"` |
| `UBUniformityReview` | literal trực tiếp | 1 | [Uniformity.cs:357](../../../VieFUNDPdf/Uniformity.cs#L357) | `"UBUniformityReview"` |
| `UBWebClientUserListDummy` | literal trực tiếp | 1 | [WFPassword.aspx.cs:340](../../../WebApp/Main/WFPassword.aspx.cs#L340) | `"UBWebClientUserListDummy"` |
| `UBWebClientUserUpdatePWDummy` | literal trực tiếp | 1 | [WFPassword.aspx.cs:240](../../../WebApp/Main/WFPassword.aspx.cs#L240) | `"UBWebClientUserUpdatePWDummy"` |
| `UBYearEndTagList` | literal trực tiếp | 1 | [TFSAProcessing.cs:124](../../../UBClasses/TFSAProcessing.cs#L124) | `"UBYearEndTagList"` |
| `WXServiceStatusBusy` | literal trực tiếp | 1 | [CDatabase.cs:2122](../../../UBConnection/CDatabase.cs#L2122) | `"WXServiceStatusBusy"` |
| `WXServiceStatusUpdate` | literal trực tiếp | 1 | [CDatabase.cs:2100](../../../UBConnection/CDatabase.cs#L2100) | `"WXServiceStatusUpdate"` |

## Đối chiếu với số liệu source thô trước đây

- Source thô có **2463** .SetSP(...) và **1529** literal trực tiếp duy nhất.
- Sau khi chuẩn hóa schema/bracket, có **34** literal source thô không khớp tên SQL; số này giữ cách tính của Database Access và vẫn gồm code comment.
- Sau khi bỏ comment và lấy cả literal trong biểu thức tĩnh, có **1616** candidate duy nhất; **33** không khớp snapshot.
