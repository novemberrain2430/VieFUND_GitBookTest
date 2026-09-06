# SP Catalog — Fundserv & Import

> Phân nhóm gợi ý theo tên procedure. Các cột caller mới là bằng chứng truy vết; `—` không có nghĩa procedure không được dùng.

**Tổng**: 54 definition; 17 có tên tĩnh từ C#; 15 được procedure khác gọi qua EXEC/EXECUTE.

| Procedure | Definition | C# tĩnh | SQL gọi vào / gọi ra | Caller C# mẫu |
|---|---:|---:|---:|---|
| `UBAAPlanFundPositionVerify` | [L175969](../../../../ScriptDB/000_4_CreateSP.sql#L175969) | — | 4 / 1 | — |
| `UBClientAddressSupplierNFU` | [L212750](../../../../ScriptDB/000_4_CreateSP.sql#L212750) | 1 / 1 file | 0 / 1 | [CAddress.cs:511](../../../../UBClasses/CAddress.cs#L511) |
| `UBFundataAuthInfo` | [L370684](../../../../ScriptDB/000_4_CreateSP.sql#L370684) | — | 1 / 0 | — |
| `UBFundataAuthUpdate` | [L370704](../../../../ScriptDB/000_4_CreateSP.sql#L370704) | — | 0 / 0 | — |
| `UBFundataComboList` | [L370729](../../../../ScriptDB/000_4_CreateSP.sql#L370729) | — | 0 / 1 | — |
| `UBFundataDLCountAdd` | [L370754](../../../../ScriptDB/000_4_CreateSP.sql#L370754) | — | 0 / 0 | — |
| `UBFundataLog` | [L370796](../../../../ScriptDB/000_4_CreateSP.sql#L370796) | — | 0 / 0 | — |
| `UBFundServComboList` | [L387287](../../../../ScriptDB/000_4_CreateSP.sql#L387287) | — | 0 / 5 | — |
| `UBFundServErrorDescription` | [L387448](../../../../ScriptDB/000_4_CreateSP.sql#L387448) | 1 / 1 file | 0 / 0 | [FundServ.cs:346](../../../../UBClasses/FundServ.cs#L346) |
| `UBFundServErrorLogLevelList` | [L387886](../../../../ScriptDB/000_4_CreateSP.sql#L387886) | — | 1 / 0 | — |
| `UBFundServErrorLogList` | [L387911](../../../../ScriptDB/000_4_CreateSP.sql#L387911) | 1 / 1 file | 0 / 0 | [FundServ.cs:498](../../../../UBClasses/FundServ.cs#L498) |
| `UBFundServErrorLogRemove` | [L388113](../../../../ScriptDB/000_4_CreateSP.sql#L388113) | 1 / 1 file | 0 / 0 | [FundServ.cs:259](../../../../UBClasses/FundServ.cs#L259) |
| `UBFundServErrorProcess` | [L388176](../../../../ScriptDB/000_4_CreateSP.sql#L388176) | 1 / 1 file | 1 / 4 | [FundServ.cs:305](../../../../UBClasses/FundServ.cs#L305) |
| `UBFundServErrorProcess_HS` | [L388346](../../../../ScriptDB/000_4_CreateSP.sql#L388346) | — | 0 / 1 | — |
| `UBFundServErrorProcessWithMap` | [L388417](../../../../ScriptDB/000_4_CreateSP.sql#L388417) | 1 / 1 file | 0 / 4 | [FundServ.cs:391](../../../../UBClasses/FundServ.cs#L391) |
| `UBFundServEventLogList` | [L388666](../../../../ScriptDB/000_4_CreateSP.sql#L388666) | 1 / 1 file | 0 / 0 | [FundServ.cs:190](../../../../UBClasses/FundServ.cs#L190) |
| `UBFundServEventLogRemove` | [L388743](../../../../ScriptDB/000_4_CreateSP.sql#L388743) | 1 / 1 file | 0 / 0 | [FundServ.cs:259](../../../../UBClasses/FundServ.cs#L259) |
| `UBFundServFileInfo` | [L388789](../../../../ScriptDB/000_4_CreateSP.sql#L388789) | 1 / 1 file | 0 / 0 | [FundServ.cs:632](../../../../UBClasses/FundServ.cs#L632) |
| `UBFundServFileStatusList` | [L388873](../../../../ScriptDB/000_4_CreateSP.sql#L388873) | — | 1 / 0 | — |
| `UBFundServFileTypeList` | [L388898](../../../../ScriptDB/000_4_CreateSP.sql#L388898) | — | 1 / 0 | — |
| `UBFundServImportedFileList` | [L388923](../../../../ScriptDB/000_4_CreateSP.sql#L388923) | 1 / 1 file | 0 / 0 | [FundServ.cs:70](../../../../UBClasses/FundServ.cs#L70) |
| `UBFundServProcessErrorLogOneFile` | [L389075](../../../../ScriptDB/000_4_CreateSP.sql#L389075) | — | 0 / 1 | — |
| `UBFundServTSPSummary` | [L389101](../../../../ScriptDB/000_4_CreateSP.sql#L389101) | — | 0 / 0 | — |
| `UBNFU_CUI_Daily4Intermediary` | [L451118](../../../../ScriptDB/000_4_CreateSP.sql#L451118) | — | 0 / 4 | — |
| `UBNFUAdd` | [L451245](../../../../ScriptDB/000_4_CreateSP.sql#L451245) | — | 20 / 1 | — |
| `UBNFUAdd_CUI_All` | [L451499](../../../../ScriptDB/000_4_CreateSP.sql#L451499) | — | 0 / 2 | — |
| `UBNFUAddOne` | [L451538](../../../../ScriptDB/000_4_CreateSP.sql#L451538) | — | 2 / 0 | — |
| `UBNFUBenFATCAAdd` | [L451599](../../../../ScriptDB/000_4_CreateSP.sql#L451599) | — | 0 / 1 | — |
| `UBNFUClientAddressChangeAdd` | [L451649](../../../../ScriptDB/000_4_CreateSP.sql#L451649) | — | 3 / 1 | — |
| `UBNFUClientFATCAAdd` | [L451703](../../../../ScriptDB/000_4_CreateSP.sql#L451703) | — | 1 / 1 | — |
| `UBNFUCreateFile` | [L451761](../../../../ScriptDB/000_4_CreateSP.sql#L451761) | 1 / 1 file | 0 / 1 | [CXM.cs:94](../../../../UBFFImport/CXM.cs#L94) |
| `UBNFUCreateFileName` | [L451802](../../../../ScriptDB/000_4_CreateSP.sql#L451802) | — | 2 / 0 | — |
| `UBNFUCreateMSGXML` | [L451912](../../../../ScriptDB/000_4_CreateSP.sql#L451912) | — | 2 / 4 | — |
| `UBNFUCreateOneFileMSG` | [L452688](../../../../ScriptDB/000_4_CreateSP.sql#L452688) | — | 1 / 0 | — |
| `UBNFUHistoryList` | [L452730](../../../../ScriptDB/000_4_CreateSP.sql#L452730) | 1 / 1 file | 0 / 1 | [NFU.cs:134](../../../../UBClasses/NFU.cs#L134) |
| `UBNFUInTrustFATCAAdd` | [L452955](../../../../ScriptDB/000_4_CreateSP.sql#L452955) | — | 1 / 1 | — |
| `UBNFUPendingList` | [L453013](../../../../ScriptDB/000_4_CreateSP.sql#L453013) | 1 / 1 file | 0 / 1 | [NFU.cs:51](../../../../UBClasses/NFU.cs#L51) |
| `UBNFUPendingMove2Waiting` | [L453306](../../../../ScriptDB/000_4_CreateSP.sql#L453306) | — | 0 / 2 | — |
| `UBNFURemove` | [L453404](../../../../ScriptDB/000_4_CreateSP.sql#L453404) | — | 0 / 0 | — |
| `UBNFURemoveTagged` | [L453430](../../../../ScriptDB/000_4_CreateSP.sql#L453430) | — | 0 / 0 | — |
| `UBNFURepTransfer` | [L453466](../../../../ScriptDB/000_4_CreateSP.sql#L453466) | — | 0 / 3 | — |
| `UBNFUSelectionUpdate` | [L453600](../../../../ScriptDB/000_4_CreateSP.sql#L453600) | — | 0 / 0 | — |
| `UBNFUStatusDetail` | [L453647](../../../../ScriptDB/000_4_CreateSP.sql#L453647) | — | 0 / 0 | — |
| `UBPlanFundAccountList` | [L489962](../../../../ScriptDB/000_4_CreateSP.sql#L489962) | 1 / 1 file | 0 / 0 | [FundAccount.cs:3202](../../../../UBClasses/FundAccount.cs#L3202) |
| `UBPlanFundList` | [L490066](../../../../ScriptDB/000_4_CreateSP.sql#L490066) | 1 / 1 file | 0 / 2 | [Plan.cs:2991](../../../../UBClasses/Plan.cs#L2991) |
| `UBSysPlanFundIDAdd` | [L606175](../../../../ScriptDB/000_4_CreateSP.sql#L606175) | — | 0 / 1 | — |
| `UBSysPlanFundIDRemove` | [L606402](../../../../ScriptDB/000_4_CreateSP.sql#L606402) | — | 0 / 1 | — |
| `UBTrxConfUndoDeliverTagged` | [L668753](../../../../ScriptDB/000_4_CreateSP.sql#L668753) | — | 0 / 0 | — |
| `UBTSFile_EndTask` | [L680443](../../../../ScriptDB/000_4_CreateSP.sql#L680443) | — | 0 / 0 | — |
| `UBTSFileAddTrx2Waiting` | [L680456](../../../../ScriptDB/000_4_CreateSP.sql#L680456) | 1 / 1 file | 0 / 0 | [Trx.cs:6512](../../../../UBClasses/Trx.cs#L6512) |
| `UBTSFileGetOneSet` | [L680496](../../../../ScriptDB/000_4_CreateSP.sql#L680496) | — | 0 / 0 | — |
| `UBXMLCheckNFUSchema` | [L687755](../../../../ScriptDB/000_4_CreateSP.sql#L687755) | — | 1 / 0 | — |
| `UBXMLCheckNFUSchema32` | [L687798](../../../../ScriptDB/000_4_CreateSP.sql#L687798) | — | 0 / 0 | — |
| `UBXMLRecNFURespnProcess` | [L692974](../../../../ScriptDB/000_4_CreateSP.sql#L692974) | 1 / 1 file | 0 / 0 | [CXM.cs:604](../../../../UBFFImport/CXM.cs#L604) |
