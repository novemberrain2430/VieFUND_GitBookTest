# SP Catalog — Compliance

> Phân nhóm gợi ý theo tên procedure. Các cột caller mới là bằng chứng truy vết; `—` không có nghĩa procedure không được dùng.

**Tổng**: 235 definition; 30 có tên tĩnh từ C#; 52 được procedure khác gọi qua EXEC/EXECUTE.

| Procedure | Definition | C# tĩnh | SQL gọi vào / gọi ra | Caller C# mẫu |
|---|---:|---:|---:|---|
| `CIRO_ClientAMLRiskRanking` | [L21734](../../../../ScriptDB/000_4_CreateSP.sql#L21734) | — | 0 / 0 | — |
| `CIRO_EFTSummary` | [L21753](../../../../ScriptDB/000_4_CreateSP.sql#L21753) | — | 0 / 0 | — |
| `CIRO_FPEP` | [L21834](../../../../ScriptDB/000_4_CreateSP.sql#L21834) | — | 0 / 0 | — |
| `CIRO_NewClients` | [L21868](../../../../ScriptDB/000_4_CreateSP.sql#L21868) | — | 0 / 0 | — |
| `CIRO_NumberOfAccounts` | [L21897](../../../../ScriptDB/000_4_CreateSP.sql#L21897) | — | 0 / 0 | — |
| `CON_InitComplianceTrx` | [L28060](../../../../ScriptDB/000_4_CreateSP.sql#L28060) | — | 0 / 2 | — |
| `CON_WF_Compliance1Trx` | [L47197](../../../../ScriptDB/000_4_CreateSP.sql#L47197) | — | 6 / 1 | — |
| `FINTRAC_EFTCount` | [L112629](../../../../ScriptDB/000_4_CreateSP.sql#L112629) | — | 0 / 0 | — |
| `FINTRAC_Process_SEM_JVC` | [L112713](../../../../ScriptDB/000_4_CreateSP.sql#L112713) | — | 0 / 0 | — |
| `Init_CompliancePlanTrend` | [L117342](../../../../ScriptDB/000_4_CreateSP.sql#L117342) | — | 0 / 1 | — |
| `Init_ComplianceTrxTrend` | [L117379](../../../../ScriptDB/000_4_CreateSP.sql#L117379) | — | 0 / 1 | — |
| `Init_CompTrxSuitability_CreateMissing` | [L117419](../../../../ScriptDB/000_4_CreateSP.sql#L117419) | — | 0 / 1 | — |
| `Init_CompTrxSuitability_CreateMissingOne` | [L117471](../../../../ScriptDB/000_4_CreateSP.sql#L117471) | — | 1 / 1 | — |
| `Init_RecreateSuitabilityTrxStatusRecord` | [L121958](../../../../ScriptDB/000_4_CreateSP.sql#L121958) | — | 0 / 2 | — |
| `MFDA_AccountMKVList` | [L124285](../../../../ScriptDB/000_4_CreateSP.sql#L124285) | — | 0 / 0 | — |
| `MFDA_AccountOpening` | [L124332](../../../../ScriptDB/000_4_CreateSP.sql#L124332) | — | 0 / 0 | — |
| `MFDA_AccountOpening_Get` | [L124441](../../../../ScriptDB/000_4_CreateSP.sql#L124441) | — | 0 / 0 | — |
| `MFDA_AccountOpening_OPEN_With_ID` | [L124556](../../../../ScriptDB/000_4_CreateSP.sql#L124556) | — | 0 / 0 | — |
| `MFDA_AccountOpening_OPEN_With_ID_Get` | [L124683](../../../../ScriptDB/000_4_CreateSP.sql#L124683) | — | 0 / 0 | — |
| `MFDA_AccountOpening_OPEN_With_ID_Save` | [L124812](../../../../ScriptDB/000_4_CreateSP.sql#L124812) | — | 1 / 0 | — |
| `MFDA_AccountOpening_Save` | [L125032](../../../../ScriptDB/000_4_CreateSP.sql#L125032) | — | 1 / 0 | — |
| `MFDA_AccountUnitList` | [L125228](../../../../ScriptDB/000_4_CreateSP.sql#L125228) | — | 0 / 0 | — |
| `MFDA_AccountUpdate` | [L125365](../../../../ScriptDB/000_4_CreateSP.sql#L125365) | — | 0 / 0 | — |
| `MFDA_AltProdAccount` | [L125419](../../../../ScriptDB/000_4_CreateSP.sql#L125419) | — | 0 / 1 | — |
| `MFDA_AltProdAccount_12f` | [L125503](../../../../ScriptDB/000_4_CreateSP.sql#L125503) | — | 0 / 1 | — |
| `MFDA_AssetOneSupplierPerAccountDesignation` | [L125587](../../../../ScriptDB/000_4_CreateSP.sql#L125587) | — | 0 / 0 | — |
| `MFDA_AUASurveyLine2100Details` | [L125670](../../../../ScriptDB/000_4_CreateSP.sql#L125670) | — | 0 / 0 | — |
| `MFDA_CashTrxList` | [L125730](../../../../ScriptDB/000_4_CreateSP.sql#L125730) | — | 0 / 0 | — |
| `MFDA_CheckForPendingReports` | [L125762](../../../../ScriptDB/000_4_CreateSP.sql#L125762) | — | 0 / 18 | — |
| `MFDA_ClientFreeze` | [L125866](../../../../ScriptDB/000_4_CreateSP.sql#L125866) | — | 0 / 0 | — |
| `MFDA_ClientFreezeAsOf` | [L125919](../../../../ScriptDB/000_4_CreateSP.sql#L125919) | — | 0 / 0 | — |
| `MFDA_ClientList_AddressEmp` | [L125985](../../../../ScriptDB/000_4_CreateSP.sql#L125985) | — | 0 / 0 | — |
| `MFDA_ClientOPEN_NoFATCA` | [L126063](../../../../ScriptDB/000_4_CreateSP.sql#L126063) | — | 0 / 0 | — |
| `MFDA_ClientPosAdd` | [L126131](../../../../ScriptDB/000_4_CreateSP.sql#L126131) | 1 / 1 file | 0 / 0 | [Export.cs:501](../../../../UBClasses/Export.cs#L501) |
| `MFDA_ClientPosGet` | [L126196](../../../../ScriptDB/000_4_CreateSP.sql#L126196) | — | 0 / 0 | — |
| `MFDA_ClientPosInfo` | [L126327](../../../../ScriptDB/000_4_CreateSP.sql#L126327) | — | 0 / 0 | — |
| `MFDA_ClientPosList` | [L126358](../../../../ScriptDB/000_4_CreateSP.sql#L126358) | — | 0 / 0 | — |
| `MFDA_ClientPosOnePlan` | [L126419](../../../../ScriptDB/000_4_CreateSP.sql#L126419) | — | 1 / 1 | — |
| `MFDA_ClientPosProcess` | [L126631](../../../../ScriptDB/000_4_CreateSP.sql#L126631) | — | 0 / 1 | — |
| `MFDA_ClientPosRemove` | [L126690](../../../../ScriptDB/000_4_CreateSP.sql#L126690) | — | 0 / 0 | — |
| `MFDA_ClientPosSet` | [L126727](../../../../ScriptDB/000_4_CreateSP.sql#L126727) | — | 0 / 0 | — |
| `MFDA_ClientZeroBalanceWithStatement` | [L126751](../../../../ScriptDB/000_4_CreateSP.sql#L126751) | — | 0 / 0 | — |
| `MFDA_ComboList` | [L126791](../../../../ScriptDB/000_4_CreateSP.sql#L126791) | — | 0 / 2 | — |
| `MFDA_CommEarnBySupplier` | [L126805](../../../../ScriptDB/000_4_CreateSP.sql#L126805) | — | 0 / 0 | — |
| `MFDA_CommEarnClientProv` | [L126939](../../../../ScriptDB/000_4_CreateSP.sql#L126939) | — | 0 / 0 | — |
| `MFDA_CommEarnRep` | [L127126](../../../../ScriptDB/000_4_CreateSP.sql#L127126) | — | 0 / 0 | — |
| `MFDA_CR_Data` | [L127252](../../../../ScriptDB/000_4_CreateSP.sql#L127252) | — | 0 / 0 | — |
| `MFDA_CR_FixingHouseHoldIssue` | [L127323](../../../../ScriptDB/000_4_CreateSP.sql#L127323) | — | 0 / 1 | — |
| `MFDA_CR_Step1` | [L127383](../../../../ScriptDB/000_4_CreateSP.sql#L127383) | — | 0 / 0 | — |
| `MFDA_CR_Step2` | [L127462](../../../../ScriptDB/000_4_CreateSP.sql#L127462) | — | 0 / 1 | — |
| `MFDA_CR_Step3` | [L127673](../../../../ScriptDB/000_4_CreateSP.sql#L127673) | — | 0 / 1 | — |
| `MFDA_CR_Step3_OnePlan` | [L127742](../../../../ScriptDB/000_4_CreateSP.sql#L127742) | — | 1 / 3 | — |
| `MFDA_CR_Step3_OnePlanPos` | [L127955](../../../../ScriptDB/000_4_CreateSP.sql#L127955) | — | 1 / 1 | — |
| `MFDA_CR_Step3_Start` | [L128078](../../../../ScriptDB/000_4_CreateSP.sql#L128078) | — | 0 / 1 | — |
| `MFDA_CR_Step4` | [L128121](../../../../ScriptDB/000_4_CreateSP.sql#L128121) | — | 0 / 1 | — |
| `MFDA_CR_Step4_1Client` | [L128180](../../../../ScriptDB/000_4_CreateSP.sql#L128180) | — | 2 / 0 | — |
| `MFDA_CR_Step5` | [L128232](../../../../ScriptDB/000_4_CreateSP.sql#L128232) | — | 0 / 0 | — |
| `MFDA_DeleteReportRequest` | [L128284](../../../../ScriptDB/000_4_CreateSP.sql#L128284) | 1 / 1 file | 0 / 0 | [MFDAReports.cs:480](../../../../UBClasses/MFDAReports.cs#L480) |
| `MFDA_ETF_AUAStats_15` | [L128325](../../../../ScriptDB/000_4_CreateSP.sql#L128325) | — | 0 / 2 | — |
| `MFDA_ExemptAccount` | [L128432](../../../../ScriptDB/000_4_CreateSP.sql#L128432) | — | 0 / 1 | — |
| `MFDA_ExemptAccount_Get` | [L128517](../../../../ScriptDB/000_4_CreateSP.sql#L128517) | — | 0 / 0 | — |
| `MFDA_ExemptAccount_Save` | [L128634](../../../../ScriptDB/000_4_CreateSP.sql#L128634) | — | 1 / 1 | — |
| `MFDA_ExemptActivity` | [L128807](../../../../ScriptDB/000_4_CreateSP.sql#L128807) | — | 0 / 0 | — |
| `MFDA_ExemptActivity_Get` | [L128901](../../../../ScriptDB/000_4_CreateSP.sql#L128901) | — | 0 / 0 | — |
| `MFDA_ExemptActivity_Save` | [L129024](../../../../ScriptDB/000_4_CreateSP.sql#L129024) | — | 1 / 0 | — |
| `MFDA_ExemptAUAStats` | [L129213](../../../../ScriptDB/000_4_CreateSP.sql#L129213) | — | 0 / 2 | — |
| `MFDA_ExemptAUAStats_12d` | [L129324](../../../../ScriptDB/000_4_CreateSP.sql#L129324) | — | 0 / 2 | — |
| `MFDA_ExemptClientStats` | [L129433](../../../../ScriptDB/000_4_CreateSP.sql#L129433) | — | 0 / 0 | — |
| `MFDA_FeeBasePlan_9c` | [L129572](../../../../ScriptDB/000_4_CreateSP.sql#L129572) | — | 0 / 0 | — |
| `MFDA_FinalizeReportRequest` | [L129611](../../../../ScriptDB/000_4_CreateSP.sql#L129611) | — | 0 / 0 | — |
| `MFDA_FormatAddressLine` | [L129655](../../../../ScriptDB/000_4_CreateSP.sql#L129655) | — | 1 / 0 | — |
| `MFDA_FundAccountByType` | [L129730](../../../../ScriptDB/000_4_CreateSP.sql#L129730) | — | 0 / 1 | — |
| `MFDA_FundAccountMailReturnClient` | [L129838](../../../../ScriptDB/000_4_CreateSP.sql#L129838) | — | 0 / 0 | — |
| `MFDA_FundAccountWithKYCList` | [L129881](../../../../ScriptDB/000_4_CreateSP.sql#L129881) | — | 0 / 0 | — |
| `MFDA_FundListHistorical` | [L129967](../../../../ScriptDB/000_4_CreateSP.sql#L129967) | — | 0 / 0 | — |
| `MFDA_FundListHistorical_12a` | [L130078](../../../../ScriptDB/000_4_CreateSP.sql#L130078) | — | 0 / 0 | — |
| `MFDA_FundRiskChangeCheckPlan` | [L130189](../../../../ScriptDB/000_4_CreateSP.sql#L130189) | — | 0 / 1 | — |
| `MFDA_FundRiskChangeCheckPlanEmailEnd` | [L130305](../../../../ScriptDB/000_4_CreateSP.sql#L130305) | — | 0 / 0 | — |
| `MFDA_FundRiskChangeCheckPlanList` | [L130319](../../../../ScriptDB/000_4_CreateSP.sql#L130319) | — | 0 / 0 | — |
| `MFDA_GetReportRequestInfo` | [L130423](../../../../ScriptDB/000_4_CreateSP.sql#L130423) | 1 / 1 file | 0 / 0 | [MFDAReports.cs:589](../../../../UBClasses/MFDAReports.cs#L589) |
| `MFDA_GetReportRequests` | [L130469](../../../../ScriptDB/000_4_CreateSP.sql#L130469) | 1 / 1 file | 0 / 0 | [MFDAReports.cs:524](../../../../UBClasses/MFDAReports.cs#L524) |
| `MFDA_MakeReportRequest` | [L130545](../../../../ScriptDB/000_4_CreateSP.sql#L130545) | 9 / 1 file | 0 / 0 | [MFDAReports.cs:58](../../../../UBClasses/MFDAReports.cs#L58) |
| `MFDA_NetSale` | [L130621](../../../../ScriptDB/000_4_CreateSP.sql#L130621) | 1 / 1 file | 0 / 0 | [Compliance.cs:6067](../../../../UBClasses/Compliance.cs#L6067) |
| `MFDA_NewMoney` | [L130844](../../../../ScriptDB/000_4_CreateSP.sql#L130844) | — | 0 / 0 | — |
| `MFDA_NewMoney_Get` | [L130965](../../../../ScriptDB/000_4_CreateSP.sql#L130965) | — | 0 / 0 | — |
| `MFDA_NewMoney_Save` | [L131072](../../../../ScriptDB/000_4_CreateSP.sql#L131072) | — | 0 / 0 | — |
| `MFDA_NewPuchase` | [L131282](../../../../ScriptDB/000_4_CreateSP.sql#L131282) | — | 0 / 0 | — |
| `MFDA_NewPuchaseMonthly` | [L131368](../../../../ScriptDB/000_4_CreateSP.sql#L131368) | — | 0 / 0 | — |
| `MFDA_NewPuchaseSummary` | [L131470](../../../../ScriptDB/000_4_CreateSP.sql#L131470) | — | 0 / 0 | — |
| `MFDA_NewPuchaseSummaryNet` | [L131594](../../../../ScriptDB/000_4_CreateSP.sql#L131594) | — | 0 / 0 | — |
| `MFDA_PEP_HIO_8c` | [L131807](../../../../ScriptDB/000_4_CreateSP.sql#L131807) | — | 0 / 0 | — |
| `MFDA_PlanLeverageList` | [L131860](../../../../ScriptDB/000_4_CreateSP.sql#L131860) | — | 0 / 0 | — |
| `MFDA_PlanLeverageListOneRep` | [L131912](../../../../ScriptDB/000_4_CreateSP.sql#L131912) | — | 0 / 0 | — |
| `MFDA_PlanListByUserDefined1` | [L131967](../../../../ScriptDB/000_4_CreateSP.sql#L131967) | — | 0 / 0 | — |
| `MFDA_PlanListFrozen` | [L131998](../../../../ScriptDB/000_4_CreateSP.sql#L131998) | — | 0 / 0 | — |
| `MFDA_PlanListInactive` | [L132039](../../../../ScriptDB/000_4_CreateSP.sql#L132039) | — | 0 / 0 | — |
| `MFDA_PlanListReturnMail` | [L132091](../../../../ScriptDB/000_4_CreateSP.sql#L132091) | — | 0 / 0 | — |
| `MFDA_PlanStatsMonthly` | [L132146](../../../../ScriptDB/000_4_CreateSP.sql#L132146) | — | 0 / 1 | — |
| `MFDA_PlanStatsMonthlyList` | [L132216](../../../../ScriptDB/000_4_CreateSP.sql#L132216) | 1 / 1 file | 0 / 0 | [Compliance.cs:5826](../../../../UBClasses/Compliance.cs#L5826) |
| `MFDA_PlanStatsMonthlyOne` | [L132499](../../../../ScriptDB/000_4_CreateSP.sql#L132499) | — | 1 / 2 | — |
| `MFDA_PlanStatsMonthlyOneOneMgmtCode` | [L132700](../../../../ScriptDB/000_4_CreateSP.sql#L132700) | — | 1 / 0 | — |
| `MFDA_PoliticalExposeClientList` | [L132906](../../../../ScriptDB/000_4_CreateSP.sql#L132906) | — | 0 / 0 | — |
| `MFDA_PooledFundList` | [L132934](../../../../ScriptDB/000_4_CreateSP.sql#L132934) | — | 0 / 1 | — |
| `MFDA_PositionBySeries` | [L133013](../../../../ScriptDB/000_4_CreateSP.sql#L133013) | — | 0 / 0 | — |
| `MFDA_PositionFeeBased` | [L133059](../../../../ScriptDB/000_4_CreateSP.sql#L133059) | — | 0 / 0 | — |
| `MFDA_PositionFSFile1Fund` | [L133105](../../../../ScriptDB/000_4_CreateSP.sql#L133105) | — | 0 / 0 | — |
| `MFDA_PositionNotInFile` | [L133182](../../../../ScriptDB/000_4_CreateSP.sql#L133182) | — | 0 / 0 | — |
| `MFDA_PreciousMetalOnlyAccount` | [L133251](../../../../ScriptDB/000_4_CreateSP.sql#L133251) | — | 0 / 1 | — |
| `MFDA_PreciousMetalResourceAccount` | [L133335](../../../../ScriptDB/000_4_CreateSP.sql#L133335) | — | 0 / 1 | — |
| `MFDA_PreciousMetalResourceAccount_12b` | [L133419](../../../../ScriptDB/000_4_CreateSP.sql#L133419) | — | 0 / 1 | — |
| `MFDA_RepAssetCommList` | [L133507](../../../../ScriptDB/000_4_CreateSP.sql#L133507) | — | 0 / 1 | — |
| `MFDA_RepLeverageRatio` | [L133639](../../../../ScriptDB/000_4_CreateSP.sql#L133639) | — | 1 / 0 | — |
| `MFDA_RepLeverageRatioList` | [L133758](../../../../ScriptDB/000_4_CreateSP.sql#L133758) | 1 / 1 file | 0 / 2 | [Loan.cs:1439](../../../../UBClasses/Loan.cs#L1439) |
| `MFDA_ReportTypeList` | [L133930](../../../../ScriptDB/000_4_CreateSP.sql#L133930) | — | 1 / 0 | — |
| `MFDA_ReturnMail` | [L133950](../../../../ScriptDB/000_4_CreateSP.sql#L133950) | — | 0 / 0 | — |
| `MFDA_ReturnMail_ClientMKV` | [L134002](../../../../ScriptDB/000_4_CreateSP.sql#L134002) | — | 0 / 0 | — |
| `MFDA_RoR_AllPlan` | [L134044](../../../../ScriptDB/000_4_CreateSP.sql#L134044) | — | 0 / 4 | — |
| `MFDA_RoR_AllPlan_Step1` | [L134068](../../../../ScriptDB/000_4_CreateSP.sql#L134068) | — | 1 / 0 | — |
| `MFDA_RoR_AllPlan_Step2` | [L134099](../../../../ScriptDB/000_4_CreateSP.sql#L134099) | — | 1 / 2 | — |
| `MFDA_RoR_AllPlan_Step3` | [L134183](../../../../ScriptDB/000_4_CreateSP.sql#L134183) | — | 1 / 0 | — |
| `MFDA_RoR_AllPlan_Step4` | [L134216](../../../../ScriptDB/000_4_CreateSP.sql#L134216) | — | 1 / 0 | — |
| `MFDA_TradeBlotter` | [L134250](../../../../ScriptDB/000_4_CreateSP.sql#L134250) | — | 0 / 0 | — |
| `MFDA_TradeBlotter_ETF_18` | [L134380](../../../../ScriptDB/000_4_CreateSP.sql#L134380) | — | 0 / 0 | — |
| `MFDA_TradeBlotter_Get` | [L134508](../../../../ScriptDB/000_4_CreateSP.sql#L134508) | — | 0 / 0 | — |
| `MFDA_TradeBlotter_Leveraged` | [L134633](../../../../ScriptDB/000_4_CreateSP.sql#L134633) | — | 0 / 0 | — |
| `MFDA_TradeBlotter_Save` | [L134702](../../../../ScriptDB/000_4_CreateSP.sql#L134702) | — | 1 / 0 | — |
| `MFDA_TradeBlotter_Specific` | [L134957](../../../../ScriptDB/000_4_CreateSP.sql#L134957) | — | 0 / 0 | — |
| `MFDA_TradeBlotter2500MidHigh` | [L135055](../../../../ScriptDB/000_4_CreateSP.sql#L135055) | — | 0 / 0 | — |
| `MFDA_TradeBlotter2500MidHigh_Get` | [L135180](../../../../ScriptDB/000_4_CreateSP.sql#L135180) | — | 0 / 0 | — |
| `MFDA_TradeBlotter2500MidHigh_Save` | [L135323](../../../../ScriptDB/000_4_CreateSP.sql#L135323) | — | 1 / 0 | — |
| `MFDA_TradeBlotter5000Mid` | [L135545](../../../../ScriptDB/000_4_CreateSP.sql#L135545) | — | 0 / 0 | — |
| `MFDA_TradeBlotter5000Mid_Get` | [L135670](../../../../ScriptDB/000_4_CreateSP.sql#L135670) | — | 0 / 0 | — |
| `MFDA_TradeBlotter5000Mid_Save` | [L135813](../../../../ScriptDB/000_4_CreateSP.sql#L135813) | — | 1 / 0 | — |
| `MFDA_TradeBlotter50K` | [L136034](../../../../ScriptDB/000_4_CreateSP.sql#L136034) | — | 0 / 0 | — |
| `MFDA_TradeBlotter50K_Get` | [L136159](../../../../ScriptDB/000_4_CreateSP.sql#L136159) | — | 0 / 0 | — |
| `MFDA_TradeBlotter50K_Save` | [L136302](../../../../ScriptDB/000_4_CreateSP.sql#L136302) | — | 1 / 0 | — |
| `MFDA_TradeBlotterBuyLev` | [L136522](../../../../ScriptDB/000_4_CreateSP.sql#L136522) | — | 0 / 0 | — |
| `MFDA_TradeBlotterBuyLev_Get` | [L136666](../../../../ScriptDB/000_4_CreateSP.sql#L136666) | — | 0 / 0 | — |
| `MFDA_TradeBlotterBuyLev_Save` | [L136795](../../../../ScriptDB/000_4_CreateSP.sql#L136795) | — | 1 / 0 | — |
| `MFDA_TradeBlotterBySeries` | [L137067](../../../../ScriptDB/000_4_CreateSP.sql#L137067) | — | 0 / 0 | — |
| `MFDA_TradeBlotterBySeries_Get` | [L137138](../../../../ScriptDB/000_4_CreateSP.sql#L137138) | — | 0 / 0 | — |
| `MFDA_TradeBlotterBySeries_Save` | [L137261](../../../../ScriptDB/000_4_CreateSP.sql#L137261) | — | 1 / 0 | — |
| `MFDA_TradeBlotterExempt` | [L137430](../../../../ScriptDB/000_4_CreateSP.sql#L137430) | — | 0 / 0 | — |
| `MFDA_TradeBlotterExempt_Get` | [L137562](../../../../ScriptDB/000_4_CreateSP.sql#L137562) | — | 0 / 0 | — |
| `MFDA_TradeBlotterExempt_Save` | [L137705](../../../../ScriptDB/000_4_CreateSP.sql#L137705) | — | 1 / 0 | — |
| `MFDA_TradeBlotterLevOPEN` | [L137896](../../../../ScriptDB/000_4_CreateSP.sql#L137896) | — | 0 / 0 | — |
| `MFDA_TradeBlotterLevOPEN_Get` | [L138021](../../../../ScriptDB/000_4_CreateSP.sql#L138021) | — | 0 / 0 | — |
| `MFDA_TradeBlotterLevOPEN_Save` | [L138164](../../../../ScriptDB/000_4_CreateSP.sql#L138164) | — | 1 / 0 | — |
| `MFDA_TradeBlotterPOA` | [L138384](../../../../ScriptDB/000_4_CreateSP.sql#L138384) | — | 0 / 0 | — |
| `MFDA_TradeBlotterPOA_Get` | [L138509](../../../../ScriptDB/000_4_CreateSP.sql#L138509) | — | 0 / 0 | — |
| `MFDA_TradeBlotterPOA_Save` | [L138652](../../../../ScriptDB/000_4_CreateSP.sql#L138652) | — | 1 / 0 | — |
| `MFDA_TradeBlotterSellWithPYMT` | [L138872](../../../../ScriptDB/000_4_CreateSP.sql#L138872) | — | 0 / 0 | — |
| `MFDA_TradeBlotterSellWithPYMT_Get` | [L139042](../../../../ScriptDB/000_4_CreateSP.sql#L139042) | — | 0 / 0 | — |
| `MFDA_TradeBlotterSellWithPYMT_Save` | [L139200](../../../../ScriptDB/000_4_CreateSP.sql#L139200) | — | 1 / 0 | — |
| `MFDA_TradeBlotterWithKYC` | [L139530](../../../../ScriptDB/000_4_CreateSP.sql#L139530) | — | 0 / 0 | — |
| `MFDA_TradeBlotterWithKYC_BM` | [L139675](../../../../ScriptDB/000_4_CreateSP.sql#L139675) | — | 0 / 0 | — |
| `MFDA_TradeBlotterWithKYC_BuySwitchIn_DSC` | [L139811](../../../../ScriptDB/000_4_CreateSP.sql#L139811) | — | 0 / 0 | — |
| `MFDA_TradeBlotterWithKYC_BuySwitchIn_DSC_Get` | [L139945](../../../../ScriptDB/000_4_CreateSP.sql#L139945) | — | 0 / 0 | — |
| `MFDA_TradeBlotterWithKYC_BuySwitchIn_DSC_Save` | [L140102](../../../../ScriptDB/000_4_CreateSP.sql#L140102) | — | 1 / 0 | — |
| `MFDA_TradeBlotterWithKYC_Get` | [L140341](../../../../ScriptDB/000_4_CreateSP.sql#L140341) | — | 0 / 0 | — |
| `MFDA_TradeBlotterWithKYC_Save` | [L140493](../../../../ScriptDB/000_4_CreateSP.sql#L140493) | — | 1 / 0 | — |
| `MFDA_TradeBlotterWithKYCByProv` | [L140727](../../../../ScriptDB/000_4_CreateSP.sql#L140727) | — | 0 / 0 | — |
| `MFDA_TradeBlotterWithKYCByProv_Get` | [L140861](../../../../ScriptDB/000_4_CreateSP.sql#L140861) | — | 0 / 0 | — |
| `MFDA_TradeBlotterWithKYCByProv_Save` | [L141004](../../../../ScriptDB/000_4_CreateSP.sql#L141004) | — | 1 / 0 | — |
| `MFDA_TradeBlotterWithMinAmount` | [L141237](../../../../ScriptDB/000_4_CreateSP.sql#L141237) | — | 0 / 0 | — |
| `MFDA_TradeBlotterWithMinAmount_Get` | [L141308](../../../../ScriptDB/000_4_CreateSP.sql#L141308) | — | 0 / 0 | — |
| `MFDA_TradeBlotterWithMinAmount_Save` | [L141433](../../../../ScriptDB/000_4_CreateSP.sql#L141433) | — | 1 / 0 | — |
| `MFDA_TradeBlotterX` | [L141600](../../../../ScriptDB/000_4_CreateSP.sql#L141600) | — | 1 / 1 | — |
| `MFDA_TrustCashBalance` | [L141986](../../../../ScriptDB/000_4_CreateSP.sql#L141986) | — | 1 / 0 | — |
| `MFDA_TrxTradeVSSettlementList` | [L142170](../../../../ScriptDB/000_4_CreateSP.sql#L142170) | — | 1 / 0 | — |
| `MFDA_WeeklyNewPuchase` | [L142389](../../../../ScriptDB/000_4_CreateSP.sql#L142389) | — | 0 / 0 | — |
| `MFDAPSPFileCompare` | [L142494](../../../../ScriptDB/000_4_CreateSP.sql#L142494) | — | 0 / 0 | — |
| `UBAMLCheckNameTitle` | [L183394](../../../../ScriptDB/000_4_CreateSP.sql#L183394) | 1 / 1 file | 0 / 0 | [FINTRAC.cs:857](../../../../UBClasses/FINTRAC.cs#L857) |
| `UBAMLCheckNameTitleAll` | [L183425](../../../../ScriptDB/000_4_CreateSP.sql#L183425) | — | 0 / 0 | — |
| `UBAMLScanAll` | [L183479](../../../../ScriptDB/000_4_CreateSP.sql#L183479) | — | 0 / 0 | — |
| `UBClientInfoCompliance` | [L218637](../../../../ScriptDB/000_4_CreateSP.sql#L218637) | — | 3 / 1 | — |
| `UBClientMFDAAdd` | [L225009](../../../../ScriptDB/000_4_CreateSP.sql#L225009) | — | 0 / 0 | — |
| `UBClientMFDAUpdate` | [L225030](../../../../ScriptDB/000_4_CreateSP.sql#L225030) | — | 2 / 0 | — |
| `UBCompBasketSuitabilityCheck` | [L271601](../../../../ScriptDB/000_4_CreateSP.sql#L271601) | — | 1 / 1 | — |
| `UBCompBasketSuitabilityCheckConv` | [L271951](../../../../ScriptDB/000_4_CreateSP.sql#L271951) | — | 1 / 0 | — |
| `UBCompBasketSuitabilityCheckConvRisk` | [L272151](../../../../ScriptDB/000_4_CreateSP.sql#L272151) | — | 1 / 0 | — |
| `UBCompBasketSuitabilityCheckRisk` | [L272314](../../../../ScriptDB/000_4_CreateSP.sql#L272314) | — | 0 / 1 | — |
| `UBCompBasketSuitabilityDetail` | [L272516](../../../../ScriptDB/000_4_CreateSP.sql#L272516) | 1 / 1 file | 0 / 1 | [Compliance.cs:1280](../../../../UBClasses/Compliance.cs#L1280) |
| `UBCompGICSuitabilityCheck` | [L277065](../../../../ScriptDB/000_4_CreateSP.sql#L277065) | — | 0 / 1 | — |
| `UBCompGICSuitabilityCheck4Update` | [L277325](../../../../ScriptDB/000_4_CreateSP.sql#L277325) | — | 0 / 0 | — |
| `UBCompSuitabilityCheckConv` | [L279924](../../../../ScriptDB/000_4_CreateSP.sql#L279924) | — | 4 / 0 | — |
| `UBCompTrxSuitabilityApproveAll` | [L287325](../../../../ScriptDB/000_4_CreateSP.sql#L287325) | 1 / 1 file | 0 / 1 | [Compliance.cs:988](../../../../UBClasses/Compliance.cs#L988) |
| `UBCompTrxSuitabilityApproveAllX` | [L287699](../../../../ScriptDB/000_4_CreateSP.sql#L287699) | 1 / 1 file | 0 / 1 | [Compliance.cs:1109](../../../../UBClasses/Compliance.cs#L1109) |
| `UBCompTrxSuitabilityCheckOrder` | [L288085](../../../../ScriptDB/000_4_CreateSP.sql#L288085) | — | 0 / 2 | — |
| `UBCompTrxSuitabilityCheckTrx` | [L288499](../../../../ScriptDB/000_4_CreateSP.sql#L288499) | — | 1 / 2 | — |
| `UBCompTrxSuitabilityCheckTrx4Update` | [L288962](../../../../ScriptDB/000_4_CreateSP.sql#L288962) | — | 4 / 1 | — |
| `UBCompTrxSuitabilityComboList` | [L289369](../../../../ScriptDB/000_4_CreateSP.sql#L289369) | — | 0 / 5 | — |
| `UBCompTrxSuitabilityCount` | [L289397](../../../../ScriptDB/000_4_CreateSP.sql#L289397) | — | 1 / 0 | — |
| `UBCompTrxSuitabilityDetail` | [L289551](../../../../ScriptDB/000_4_CreateSP.sql#L289551) | 1 / 1 file | 0 / 5 | [Compliance.cs:1225](../../../../UBClasses/Compliance.cs#L1225) |
| `UBCompTrxSuitabilityListByPlan` | [L289733](../../../../ScriptDB/000_4_CreateSP.sql#L289733) | 1 / 1 file | 0 / 3 | [Compliance.cs:636](../../../../UBClasses/Compliance.cs#L636) |
| `UBCompTrxSuitabilityPendingCount` | [L291247](../../../../ScriptDB/000_4_CreateSP.sql#L291247) | 1 / 1 file | 0 / 0 | [Compliance.cs:874](../../../../UBClasses/Compliance.cs#L874) |
| `UBCompTrxSuitabilitySearchCriteriaSave` | [L291572](../../../../ScriptDB/000_4_CreateSP.sql#L291572) | — | 1 / 1 | — |
| `UBCompTrxSuitabilitySummary` | [L291871](../../../../ScriptDB/000_4_CreateSP.sql#L291871) | 1 / 1 file | 0 / 0 | [Compliance.cs:766](../../../../UBClasses/Compliance.cs#L766) |
| `UBFINTRAC_CCASL_Add` | [L351227](../../../../ScriptDB/000_4_CreateSP.sql#L351227) | — | 0 / 1 | — |
| `UBFINTRAC_CCASL_CountryCode` | [L351265](../../../../ScriptDB/000_4_CreateSP.sql#L351265) | — | 2 / 0 | — |
| `UBFINTRAC_CCASL_End` | [L351326](../../../../ScriptDB/000_4_CreateSP.sql#L351326) | — | 0 / 0 | — |
| `UBFINTRACAdd` | [L351350](../../../../ScriptDB/000_4_CreateSP.sql#L351350) | — | 0 / 1 | — |
| `UBFintracCCASLGroupList` | [L351452](../../../../ScriptDB/000_4_CreateSP.sql#L351452) | — | 1 / 0 | — |
| `UBFINTRACClear` | [L351478](../../../../ScriptDB/000_4_CreateSP.sql#L351478) | — | 0 / 0 | — |
| `UBFINTRACComboList` | [L351501](../../../../ScriptDB/000_4_CreateSP.sql#L351501) | — | 0 / 3 | — |
| `UBFintracDocTypeList` | [L351528](../../../../ScriptDB/000_4_CreateSP.sql#L351528) | — | 2 / 0 | — |
| `UBFINTRACEnd` | [L351554](../../../../ScriptDB/000_4_CreateSP.sql#L351554) | — | 0 / 0 | — |
| `UBFINTRACList` | [L351588](../../../../ScriptDB/000_4_CreateSP.sql#L351588) | 2 / 1 file | 0 / 0 | [FINTRAC.cs:748](../../../../UBClasses/FINTRAC.cs#L748) |
| `UBFINTRACRemoveItem` | [L351699](../../../../ScriptDB/000_4_CreateSP.sql#L351699) | — | 0 / 0 | — |
| `UBFINTRACScan50` | [L351724](../../../../ScriptDB/000_4_CreateSP.sql#L351724) | — | 0 / 0 | — |
| `UBFINTRACScanStart` | [L351748](../../../../ScriptDB/000_4_CreateSP.sql#L351748) | — | 0 / 0 | — |
| `UBFINTRACUpdate` | [L351779](../../../../ScriptDB/000_4_CreateSP.sql#L351779) | — | 0 / 0 | — |
| `UBGetUniformitySnapshot` | [L405207](../../../../ScriptDB/000_4_CreateSP.sql#L405207) | 3 / 2 file | 1 / 0 | [Uniformity.cs:309](../../../../UBClasses/Uniformity.cs#L309) |
| `UBMemberComplianceSettingAdd` | [L440732](../../../../ScriptDB/000_4_CreateSP.sql#L440732) | 1 / 1 file | 0 / 0 | [PopupMemberAdd.aspx.cs:1157](../../../../WebApp/Main/PopupMemberAdd.aspx.cs#L1157) |
| `UBMFDAFeeProcess` | [L447641](../../../../ScriptDB/000_4_CreateSP.sql#L447641) | 1 / 1 file | 0 / 0 | [CMFDAFee.cs:178](../../../../UBClasses/CMFDAFee.cs#L178) |
| `UBMFDAFeeProcessUndo` | [L447708](../../../../ScriptDB/000_4_CreateSP.sql#L447708) | 1 / 1 file | 0 / 0 | [CMFDAFee.cs:227](../../../../UBClasses/CMFDAFee.cs#L227) |
| `UBMFDAFeeReportDetailList` | [L447752](../../../../ScriptDB/000_4_CreateSP.sql#L447752) | 1 / 1 file | 0 / 0 | [CMFDAFee.cs:101](../../../../UBClasses/CMFDAFee.cs#L101) |
| `UBMFDAFeeReportHeaderList` | [L447927](../../../../ScriptDB/000_4_CreateSP.sql#L447927) | 1 / 1 file | 0 / 0 | [CMFDAFee.cs:46](../../../../UBClasses/CMFDAFee.cs#L46) |
| `UBPlanInfoCompliance` | [L491802](../../../../ScriptDB/000_4_CreateSP.sql#L491802) | — | 4 / 0 | — |
| `UBReportPlanSuitability` | [L564454](../../../../ScriptDB/000_4_CreateSP.sql#L564454) | — | 0 / 1 | — |
| `UBSetupComplianceComboList` | [L600377](../../../../ScriptDB/000_4_CreateSP.sql#L600377) | — | 0 / 7 | — |
| `UBUniformityComboList` | [L681544](../../../../ScriptDB/000_4_CreateSP.sql#L681544) | — | 0 / 2 | — |
| `UBUniformityReport` | [L681564](../../../../ScriptDB/000_4_CreateSP.sql#L681564) | 2 / 1 file | 0 / 1 | [Uniformity.cs:38](../../../../UBClasses/Uniformity.cs#L38) |
| `UBUniformityReport1Rep` | [L681679](../../../../ScriptDB/000_4_CreateSP.sql#L681679) | — | 1 / 0 | — |
| `UBUniformityReviewList` | [L682435](../../../../ScriptDB/000_4_CreateSP.sql#L682435) | 1 / 1 file | 0 / 0 | [Uniformity.cs:366](../../../../UBClasses/Uniformity.cs#L366) |
| `UBUniformityReviewObj` | [L682510](../../../../ScriptDB/000_4_CreateSP.sql#L682510) | 1 / 1 file | 0 / 0 | [Uniformity.cs:480](../../../../UBClasses/Uniformity.cs#L480) |
| `UBUniformityReviewObjAdd` | [L682545](../../../../ScriptDB/000_4_CreateSP.sql#L682545) | 1 / 1 file | 0 / 0 | [Uniformity.cs:626](../../../../VieFUNDPdf/Uniformity.cs#L626) |
| `UBUniformityReviewRemove` | [L682604](../../../../ScriptDB/000_4_CreateSP.sql#L682604) | 1 / 1 file | 0 / 0 | [Uniformity.cs:434](../../../../UBClasses/Uniformity.cs#L434) |
| `UBUniformitySelectionUpdateIN` | [L682622](../../../../ScriptDB/000_4_CreateSP.sql#L682622) | 1 / 1 file | 0 / 0 | [Uniformity.cs:522](../../../../UBClasses/Uniformity.cs#L522) |
| `UBUniformitySnapshots` | [L682668](../../../../ScriptDB/000_4_CreateSP.sql#L682668) | 1 / 1 file | 0 / 1 | [Uniformity.cs:152](../../../../UBClasses/Uniformity.cs#L152) |
| `UBWFConversionFINTRAC` | [L685726](../../../../ScriptDB/000_4_CreateSP.sql#L685726) | — | 0 / 0 | — |
| `VF_VF_AllCompliancePlanCommFee` | [L707934](../../../../ScriptDB/000_4_CreateSP.sql#L707934) | — | 0 / 0 | — |
| `VF_VF_AllCompliancePlanTrend` | [L707982](../../../../ScriptDB/000_4_CreateSP.sql#L707982) | — | 0 / 0 | — |
| `VF_VF_AllComplianceTrxTrend` | [L708024](../../../../ScriptDB/000_4_CreateSP.sql#L708024) | — | 0 / 0 | — |
| `VF_VF_AllComplianceTrxTrendShortTerm` | [L708065](../../../../ScriptDB/000_4_CreateSP.sql#L708065) | — | 0 / 0 | — |
