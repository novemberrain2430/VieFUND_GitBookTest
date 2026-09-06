# SP Catalog — Account & Plan

> Phân nhóm gợi ý theo tên procedure. Các cột caller mới là bằng chứng truy vết; `—` không có nghĩa procedure không được dùng.

**Tổng**: 1144 definition; 268 có tên tĩnh từ C#; 381 được procedure khác gọi qua EXEC/EXECUTE.

| Procedure | Definition | C# tĩnh | SQL gọi vào / gọi ra | Caller C# mẫu |
|---|---:|---:|---:|---|
| `AGRA_ContractedCashTrx` | [L16775](../../../../ScriptDB/000_4_CreateSP.sql#L16775) | — | 0 / 0 | — |
| `AGRA_DeletedCash_ValidTrx` | [L16945](../../../../ScriptDB/000_4_CreateSP.sql#L16945) | — | 0 / 0 | — |
| `AGRA_DeletedCashTrx` | [L16983](../../../../ScriptDB/000_4_CreateSP.sql#L16983) | — | 0 / 0 | — |
| `AGRARepTransferCash4AGRA` | [L17563](../../../../ScriptDB/000_4_CreateSP.sql#L17563) | — | 0 / 0 | — |
| `AGRARepTransferCash4AGRA_Old` | [L17843](../../../../ScriptDB/000_4_CreateSP.sql#L17843) | — | 0 / 0 | — |
| `AGRATrustEntryDeletedButLinkedToTrxList` | [L19094](../../../../ScriptDB/000_4_CreateSP.sql#L19094) | — | 0 / 0 | — |
| `AGRP_AccountList` | [L19132](../../../../ScriptDB/000_4_CreateSP.sql#L19132) | — | 0 / 0 | — |
| `AGRP_ConvOmnibusCASH_AGCH` | [L19213](../../../../ScriptDB/000_4_CreateSP.sql#L19213) | — | 0 / 1 | — |
| `AGRP_ListPlanPACFirstTrx` | [L19417](../../../../ScriptDB/000_4_CreateSP.sql#L19417) | — | 0 / 1 | — |
| `AGRP_OrderReplace2CASH` | [L19466](../../../../ScriptDB/000_4_CreateSP.sql#L19466) | — | 0 / 2 | — |
| `AGRP_OrderReplace2CASHOne` | [L19509](../../../../ScriptDB/000_4_CreateSP.sql#L19509) | — | 1 / 0 | — |
| `AGRP_RemoveOmnibusCash` | [L19799](../../../../ScriptDB/000_4_CreateSP.sql#L19799) | — | 0 / 0 | — |
| `AGRP_SetAccountAvg2TrxAvgCost` | [L19821](../../../../ScriptDB/000_4_CreateSP.sql#L19821) | — | 2 / 0 | — |
| `AGRP_SetAccountAvg2TrxAvgCost_All` | [L19846](../../../../ScriptDB/000_4_CreateSP.sql#L19846) | — | 0 / 1 | — |
| `AGRP_TrxAvg2AccountAvg_All` | [L19878](../../../../ScriptDB/000_4_CreateSP.sql#L19878) | — | 0 / 1 | — |
| `AGRP_TrxDetailsAllPlans` | [L19910](../../../../ScriptDB/000_4_CreateSP.sql#L19910) | — | 0 / 1 | — |
| `AGRP_TrxDetailsOnePlan` | [L19944](../../../../ScriptDB/000_4_CreateSP.sql#L19944) | — | 1 / 0 | — |
| `AL_ConvAccounts` | [L19987](../../../../ScriptDB/000_4_CreateSP.sql#L19987) | — | 0 / 0 | — |
| `AL_ConvOmnibusTrxDetailsOneAccount` | [L20318](../../../../ScriptDB/000_4_CreateSP.sql#L20318) | — | 1 / 0 | — |
| `AMF_AccountOpening` | [L20742](../../../../ScriptDB/000_4_CreateSP.sql#L20742) | — | 0 / 0 | — |
| `AMF_NumberOfActivePlans` | [L21141](../../../../ScriptDB/000_4_CreateSP.sql#L21141) | — | 0 / 0 | — |
| `AMF_PlanLeverageList` | [L21184](../../../../ScriptDB/000_4_CreateSP.sql#L21184) | — | 0 / 0 | — |
| `AMF_PlanPOALTAList` | [L21240](../../../../ScriptDB/000_4_CreateSP.sql#L21240) | — | 0 / 0 | — |
| `B2BAccountScan` | [L21603](../../../../ScriptDB/000_4_CreateSP.sql#L21603) | — | 0 / 2 | — |
| `CON_AuditTrailInitFixPlan` | [L23668](../../../../ScriptDB/000_4_CreateSP.sql#L23668) | — | 0 / 1 | — |
| `CON_Axis_CalcAverageCostFromAccountLevel` | [L23745](../../../../ScriptDB/000_4_CreateSP.sql#L23745) | — | 0 / 0 | — |
| `CON_Axis_VF_Plan_All` | [L24578](../../../../ScriptDB/000_4_CreateSP.sql#L24578) | — | 0 / 1 | — |
| `CON_Axis_VF_Plan_One` | [L24620](../../../../ScriptDB/000_4_CreateSP.sql#L24620) | — | 1 / 0 | — |
| `CON_CompareAccountWF_VF` | [L25701](../../../../ScriptDB/000_4_CreateSP.sql#L25701) | — | 0 / 0 | — |
| `CON_CopyPlanKYC` | [L26194](../../../../ScriptDB/000_4_CreateSP.sql#L26194) | — | 1 / 0 | — |
| `CON_CopyPlanKYC_All` | [L26390](../../../../ScriptDB/000_4_CreateSP.sql#L26390) | — | 0 / 1 | — |
| `CON_CWM_LoanImport_RRSP` | [L26883](../../../../ScriptDB/000_4_CreateSP.sql#L26883) | — | 0 / 1 | — |
| `CON_FixDuplicateAccountOne` | [L27234](../../../../ScriptDB/000_4_CreateSP.sql#L27234) | — | 0 / 0 | — |
| `CON_ListPlanWithLastKYCLaterThenApproval` | [L28275](../../../../ScriptDB/000_4_CreateSP.sql#L28275) | — | 0 / 0 | — |
| `CON_MoveTrx2CashTrx` | [L28726](../../../../ScriptDB/000_4_CreateSP.sql#L28726) | — | 3 / 0 | — |
| `CON_OB_OnePlan_AddJoint` | [L31746](../../../../ScriptDB/000_4_CreateSP.sql#L31746) | — | 1 / 1 | — |
| `CON_OB_Plan` | [L31803](../../../../ScriptDB/000_4_CreateSP.sql#L31803) | — | 0 / 8 | — |
| `CON_OB_PlanBen` | [L32648](../../../../ScriptDB/000_4_CreateSP.sql#L32648) | — | 1 / 2 | — |
| `CON_OB_PlanInTrust` | [L32724](../../../../ScriptDB/000_4_CreateSP.sql#L32724) | — | 1 / 0 | — |
| `CON_PHX_AccountNoTransfer` | [L33794](../../../../ScriptDB/000_4_CreateSP.sql#L33794) | — | 0 / 0 | — |
| `CON_RefreshPrimaryPlanClient` | [L35021](../../../../ScriptDB/000_4_CreateSP.sql#L35021) | — | 0 / 0 | — |
| `CON_SetPlanApproved_Attach` | [L35157](../../../../ScriptDB/000_4_CreateSP.sql#L35157) | — | 0 / 2 | — |
| `CON_SetPlanPercentagetoTickBox` | [L35213](../../../../ScriptDB/000_4_CreateSP.sql#L35213) | — | 0 / 0 | — |
| `CON_UN_Ben_OnePlan` | [L35751](../../../../ScriptDB/000_4_CreateSP.sql#L35751) | — | 1 / 0 | — |
| `CON_UN_InTrust_OnePlan` | [L37009](../../../../ScriptDB/000_4_CreateSP.sql#L37009) | — | 1 / 0 | — |
| `CON_UN_Plan` | [L37200](../../../../ScriptDB/000_4_CreateSP.sql#L37200) | — | 0 / 1 | — |
| `CON_UN_Plan_One` | [L37239](../../../../ScriptDB/000_4_CreateSP.sql#L37239) | — | 1 / 3 | — |
| `CON_UN_TFSASucc_OnePlan` | [L37550](../../../../ScriptDB/000_4_CreateSP.sql#L37550) | — | 1 / 0 | — |
| `CON_UN_TrxAllAccount` | [L37656](../../../../ScriptDB/000_4_CreateSP.sql#L37656) | — | 0 / 1 | — |
| `CON_UN_TrxOneAccount` | [L37909](../../../../ScriptDB/000_4_CreateSP.sql#L37909) | — | 1 / 1 | — |
| `CON_VerifyPlanSetEndDate` | [L38337](../../../../ScriptDB/000_4_CreateSP.sql#L38337) | — | 0 / 0 | — |
| `CON_VerifyPlanStatus` | [L38383](../../../../ScriptDB/000_4_CreateSP.sql#L38383) | — | 0 / 0 | — |
| `CON_WF_AuditTrailResetPlanOneRep` | [L39531](../../../../ScriptDB/000_4_CreateSP.sql#L39531) | — | 1 / 1 | — |
| `CON_WF_AveragedCost1Plan` | [L39599](../../../../ScriptDB/000_4_CreateSP.sql#L39599) | — | 1 / 1 | — |
| `CON_WF_Cash1Plan` | [L39805](../../../../ScriptDB/000_4_CreateSP.sql#L39805) | — | 1 / 0 | — |
| `CON_WF_CashPlan` | [L39928](../../../../ScriptDB/000_4_CreateSP.sql#L39928) | — | 0 / 1 | — |
| `CON_WF_CashRecalcBalanceNomineeAfterTrustDone` | [L39962](../../../../ScriptDB/000_4_CreateSP.sql#L39962) | — | 0 / 1 | — |
| `CON_WF_CashTrx` | [L39996](../../../../ScriptDB/000_4_CreateSP.sql#L39996) | — | 2 / 0 | — |
| `CON_WF_CashTrx_One` | [L40198](../../../../ScriptDB/000_4_CreateSP.sql#L40198) | — | 0 / 0 | — |
| `CON_WF_CashTrx_Step2` | [L40401](../../../../ScriptDB/000_4_CreateSP.sql#L40401) | — | 0 / 0 | — |
| `CON_WF_CashTrx_Topup` | [L40608](../../../../ScriptDB/000_4_CreateSP.sql#L40608) | — | 0 / 0 | — |
| `CON_WF_CheckPlanClientLink` | [L40804](../../../../ScriptDB/000_4_CreateSP.sql#L40804) | — | 0 / 0 | — |
| `CON_WF_ClearRRSPReceipt` | [L40843](../../../../ScriptDB/000_4_CreateSP.sql#L40843) | — | 0 / 0 | — |
| `CON_WF_FixDoc1Plan` | [L48597](../../../../ScriptDB/000_4_CreateSP.sql#L48597) | — | 1 / 1 | — |
| `CON_WF_FixDoc1PlanDoc` | [L48632](../../../../ScriptDB/000_4_CreateSP.sql#L48632) | — | 1 / 0 | — |
| `CON_WF_FixDocAllPlanDuplicates` | [L48673](../../../../ScriptDB/000_4_CreateSP.sql#L48673) | — | 0 / 1 | — |
| `CON_WF_KYCUpdateAllPlan` | [L57304](../../../../ScriptDB/000_4_CreateSP.sql#L57304) | — | 0 / 1 | — |
| `CON_WF_KYCUpdateOnePlan` | [L57744](../../../../ScriptDB/000_4_CreateSP.sql#L57744) | — | 9 / 1 | — |
| `CON_WF_KYCUpdateOnePlan_Update` | [L58030](../../../../ScriptDB/000_4_CreateSP.sql#L58030) | — | 1 / 1 | — |
| `CON_WF_KYCUpdateOnePlan1Group` | [L58320](../../../../ScriptDB/000_4_CreateSP.sql#L58320) | — | 5 / 1 | — |
| `CON_WF_KYCUpdateOnePlanPending` | [L58402](../../../../ScriptDB/000_4_CreateSP.sql#L58402) | — | 1 / 1 | — |
| `CON_WF_KYCUpdateOnePlanPendingAll` | [L58460](../../../../ScriptDB/000_4_CreateSP.sql#L58460) | — | 0 / 1 | — |
| `CON_WF_KYCUpdatesTableOnePlan` | [L58530](../../../../ScriptDB/000_4_CreateSP.sql#L58530) | — | 1 / 1 | — |
| `CON_WF_MON_SysPlan7908` | [L59297](../../../../ScriptDB/000_4_CreateSP.sql#L59297) | — | 0 / 1 | — |
| `CON_WF_MON_SysPlan7952` | [L59394](../../../../ScriptDB/000_4_CreateSP.sql#L59394) | — | 0 / 1 | — |
| `CON_WF_MRSAccount` | [L59796](../../../../ScriptDB/000_4_CreateSP.sql#L59796) | — | 0 / 1 | — |
| `CON_WF_MRSAccount_Topup` | [L60010](../../../../ScriptDB/000_4_CreateSP.sql#L60010) | — | 0 / 0 | — |
| `CON_WF_OnePlan_AddJoint` | [L61325](../../../../ScriptDB/000_4_CreateSP.sql#L61325) | — | 5 / 1 | — |
| `CON_WF_OneRep_MergeAccountTrx` | [L62338](../../../../ScriptDB/000_4_CreateSP.sql#L62338) | — | 0 / 1 | — |
| `CON_WF_OneRep_OneMFAccount` | [L64998](../../../../ScriptDB/000_4_CreateSP.sql#L64998) | — | 2 / 3 | — |
| `CON_WF_OneRep_OneMFAccount_1` | [L65221](../../../../ScriptDB/000_4_CreateSP.sql#L65221) | — | 0 / 0 | — |
| `CON_WF_OneRep_OneMFAccount_Update` | [L65434](../../../../ScriptDB/000_4_CreateSP.sql#L65434) | — | 0 / 0 | — |
| `CON_WF_OneRep_OneMRSCash` | [L65591](../../../../ScriptDB/000_4_CreateSP.sql#L65591) | — | 2 / 1 | — |
| `CON_WF_OneRep_OneMRSCash_Update` | [L65765](../../../../ScriptDB/000_4_CreateSP.sql#L65765) | — | 0 / 0 | — |
| `CON_WF_OneRep_OnePlan` | [L66089](../../../../ScriptDB/000_4_CreateSP.sql#L66089) | — | 1 / 15 | — |
| `CON_WF_OneRep_OnePlan_1` | [L66918](../../../../ScriptDB/000_4_CreateSP.sql#L66918) | — | 1 / 9 | — |
| `CON_WF_OneRep_OnePlan_AddJoint` | [L67712](../../../../ScriptDB/000_4_CreateSP.sql#L67712) | — | 2 / 1 | — |
| `CON_WF_OneRep_OnePlan_Update` | [L67773](../../../../ScriptDB/000_4_CreateSP.sql#L67773) | — | 0 / 7 | — |
| `CON_WF_OneRep_Step6_1_Plan` | [L69576](../../../../ScriptDB/000_4_CreateSP.sql#L69576) | — | 0 / 1 | — |
| `CON_WF_OneRep_Step6_1_Plan_End` | [L69616](../../../../ScriptDB/000_4_CreateSP.sql#L69616) | — | 0 / 0 | — |
| `CON_WF_OneRep_Step6_2_Account_Start` | [L69648](../../../../ScriptDB/000_4_CreateSP.sql#L69648) | — | 0 / 0 | — |
| `CON_WF_OneRep_Step6_3_Account_Run` | [L69669](../../../../ScriptDB/000_4_CreateSP.sql#L69669) | — | 0 / 3 | — |
| `CON_WF_OneRep_Step6_6_SysPlan` | [L69782](../../../../ScriptDB/000_4_CreateSP.sql#L69782) | — | 0 / 1 | — |
| `CON_WF_Plan` | [L70398](../../../../ScriptDB/000_4_CreateSP.sql#L70398) | — | 2 / 9 | — |
| `CON_WF_Plan_One` | [L71263](../../../../ScriptDB/000_4_CreateSP.sql#L71263) | — | 1 / 9 | — |
| `CON_WF_Plan_Step1_Init` | [L72042](../../../../ScriptDB/000_4_CreateSP.sql#L72042) | — | 0 / 0 | — |
| `CON_WF_Plan_Step2` | [L72059](../../../../ScriptDB/000_4_CreateSP.sql#L72059) | — | 0 / 1 | — |
| `CON_WF_Plan_Topup` | [L72089](../../../../ScriptDB/000_4_CreateSP.sql#L72089) | — | 0 / 9 | — |
| `CON_WF_Plan_Topup_Step1` | [L73072](../../../../ScriptDB/000_4_CreateSP.sql#L73072) | — | 0 / 0 | — |
| `CON_WF_Plan_Topup_Step2` | [L73100](../../../../ScriptDB/000_4_CreateSP.sql#L73100) | — | 0 / 4 | — |
| `CON_WF_Plan_Topup_Step3` | [L73916](../../../../ScriptDB/000_4_CreateSP.sql#L73916) | — | 0 / 7 | — |
| `CON_WF_PlanBen` | [L74795](../../../../ScriptDB/000_4_CreateSP.sql#L74795) | — | 6 / 2 | — |
| `CON_WF_PlanBen_New` | [L74881](../../../../ScriptDB/000_4_CreateSP.sql#L74881) | — | 1 / 1 | — |
| `CON_WF_PlanBen_Topup_One` | [L75055](../../../../ScriptDB/000_4_CreateSP.sql#L75055) | — | 0 / 2 | — |
| `CON_WF_PlanBen_Update` | [L75223](../../../../ScriptDB/000_4_CreateSP.sql#L75223) | — | 2 / 2 | — |
| `CON_WF_PlanFix` | [L75301](../../../../ScriptDB/000_4_CreateSP.sql#L75301) | — | 0 / 9 | — |
| `CON_WF_PlanFixJointOld` | [L76043](../../../../ScriptDB/000_4_CreateSP.sql#L76043) | — | 0 / 1 | — |
| `CON_WF_PlanFixJointOld_2` | [L76159](../../../../ScriptDB/000_4_CreateSP.sql#L76159) | — | 0 / 2 | — |
| `CON_WF_PlanInTrust` | [L76241](../../../../ScriptDB/000_4_CreateSP.sql#L76241) | — | 7 / 0 | — |
| `CON_WF_PlanInTrust_Update` | [L76357](../../../../ScriptDB/000_4_CreateSP.sql#L76357) | — | 1 / 0 | — |
| `CON_WF_PlanKYCUpdateDetail_Fix_Step1` | [L76477](../../../../ScriptDB/000_4_CreateSP.sql#L76477) | — | 0 / 0 | — |
| `CON_WF_PlanKYCUpdateDetail_Fix_Step2` | [L76501](../../../../ScriptDB/000_4_CreateSP.sql#L76501) | — | 0 / 1 | — |
| `CON_WF_PlanStatusChangeStr` | [L76616](../../../../ScriptDB/000_4_CreateSP.sql#L76616) | — | 0 / 0 | — |
| `CON_WF_RemoveInactiveClientNoPlan` | [L78029](../../../../ScriptDB/000_4_CreateSP.sql#L78029) | — | 0 / 0 | — |
| `CON_WF_RRIFSetting` | [L79020](../../../../ScriptDB/000_4_CreateSP.sql#L79020) | — | 0 / 1 | — |
| `CON_WF_RRIFSetting_Topup_Add` | [L79056](../../../../ScriptDB/000_4_CreateSP.sql#L79056) | — | 0 / 1 | — |
| `CON_WF_RRIFSetting_Topup_Update` | [L79086](../../../../ScriptDB/000_4_CreateSP.sql#L79086) | — | 0 / 1 | — |
| `CON_WF_RRIFSettingOne` | [L79116](../../../../ScriptDB/000_4_CreateSP.sql#L79116) | — | 3 / 2 | — |
| `CON_WF_SetMaxIdentity_Plan` | [L80855](../../../../ScriptDB/000_4_CreateSP.sql#L80855) | — | 1 / 0 | — |
| `CON_WF_SysPlanFixBankingInfo` | [L81447](../../../../ScriptDB/000_4_CreateSP.sql#L81447) | — | 0 / 0 | — |
| `CON_WF_TFSASuccessorOnePlan` | [L81796](../../../../ScriptDB/000_4_CreateSP.sql#L81796) | — | 1 / 0 | — |
| `CON_WF_TrustAccount_Step1` | [L82160](../../../../ScriptDB/000_4_CreateSP.sql#L82160) | — | 0 / 0 | — |
| `CON_WF_TrustAccount_Step1_Init` | [L82179](../../../../ScriptDB/000_4_CreateSP.sql#L82179) | — | 0 / 0 | — |
| `CON_WF_TrustAccount_Step2` | [L82199](../../../../ScriptDB/000_4_CreateSP.sql#L82199) | — | 0 / 1 | — |
| `CON_WF_TrustAccount_Step3` | [L82227](../../../../ScriptDB/000_4_CreateSP.sql#L82227) | — | 0 / 1 | — |
| `CON_WF_TrustAccountAll_AddOnly` | [L82259](../../../../ScriptDB/000_4_CreateSP.sql#L82259) | — | 0 / 1 | — |
| `CON_WF_TrustAccountAll_Dep` | [L82295](../../../../ScriptDB/000_4_CreateSP.sql#L82295) | — | 0 / 1 | — |
| `CON_WF_TrustAccountAll_Other` | [L82330](../../../../ScriptDB/000_4_CreateSP.sql#L82330) | — | 0 / 1 | — |
| `CON_WF_TrustAccountAll_Other_After` | [L82365](../../../../ScriptDB/000_4_CreateSP.sql#L82365) | — | 0 / 0 | — |
| `CON_WF_TrustAccountAll_UpdateOnly` | [L82434](../../../../ScriptDB/000_4_CreateSP.sql#L82434) | — | 0 / 0 | — |
| `CON_WF_TrustAccountOne_Dep` | [L82458](../../../../ScriptDB/000_4_CreateSP.sql#L82458) | — | 2 / 2 | — |
| `CON_WF_TrustAccountOne_Other` | [L82764](../../../../ScriptDB/000_4_CreateSP.sql#L82764) | — | 2 / 0 | — |
| `CON_WF_TrustAccountOne_Topup` | [L83003](../../../../ScriptDB/000_4_CreateSP.sql#L83003) | — | 1 / 0 | — |
| `CON_WF_TrustCalc1Plan` | [L83243](../../../../ScriptDB/000_4_CreateSP.sql#L83243) | — | 1 / 0 | — |
| `CON_WF_TrustCalcPlanAfter` | [L83304](../../../../ScriptDB/000_4_CreateSP.sql#L83304) | — | 0 / 1 | — |
| `CON_WF_TrustClientNameClearOldItems` | [L83346](../../../../ScriptDB/000_4_CreateSP.sql#L83346) | — | 0 / 0 | — |
| `CON_WF_Trx_Cash_Step1_Init` | [L83392](../../../../ScriptDB/000_4_CreateSP.sql#L83392) | — | 0 / 0 | — |
| `CON_WF_TrxConversion1Plan` | [L83752](../../../../ScriptDB/000_4_CreateSP.sql#L83752) | — | 5 / 1 | — |
| `CON_WFront_Plan` | [L88795](../../../../ScriptDB/000_4_CreateSP.sql#L88795) | — | 1 / 5 | — |
| `CON_WHS_ImportCash` | [L90187](../../../../ScriptDB/000_4_CreateSP.sql#L90187) | — | 0 / 1 | — |
| `CON_WHS_ImportCashOne` | [L90217](../../../../ScriptDB/000_4_CreateSP.sql#L90217) | — | 1 / 0 | — |
| `DashBoardAssetPlanSumCalc1Rep` | [L91520](../../../../ScriptDB/000_4_CreateSP.sql#L91520) | — | 0 / 0 | — |
| `DI_AccountActiveNotApprovedList` | [L91685](../../../../ScriptDB/000_4_CreateSP.sql#L91685) | — | 0 / 1 | — |
| `DI_AccountActivePositionInactive` | [L92015](../../../../ScriptDB/000_4_CreateSP.sql#L92015) | — | 0 / 0 | — |
| `DI_AccountActiveZeroPlanInactiveSet` | [L92068](../../../../ScriptDB/000_4_CreateSP.sql#L92068) | — | 0 / 0 | — |
| `DI_AccountActiveZeroUnit` | [L92101](../../../../ScriptDB/000_4_CreateSP.sql#L92101) | — | 0 / 0 | — |
| `DI_AccountActiveZeroUnitInactivate` | [L92168](../../../../ScriptDB/000_4_CreateSP.sql#L92168) | — | 0 / 5 | — |
| `DI_AccountActiveZeroUnitList` | [L92300](../../../../ScriptDB/000_4_CreateSP.sql#L92300) | — | 0 / 1 | — |
| `DI_AccountActiveZeroUnitList2` | [L92654](../../../../ScriptDB/000_4_CreateSP.sql#L92654) | — | 0 / 0 | — |
| `DI_AccountActiveZeroUnitListSelUpdate` | [L92850](../../../../ScriptDB/000_4_CreateSP.sql#L92850) | — | 0 / 0 | — |
| `DI_AccountAssignUnitWithTrxUnit` | [L92896](../../../../ScriptDB/000_4_CreateSP.sql#L92896) | — | 0 / 0 | — |
| `DI_AccountAvgCostVSTrxAvgCost` | [L92955](../../../../ScriptDB/000_4_CreateSP.sql#L92955) | — | 0 / 0 | — |
| `DI_AccountAvgCostVSTrxAvgCost_Refresh` | [L93001](../../../../ScriptDB/000_4_CreateSP.sql#L93001) | — | 0 / 0 | — |
| `DI_AccountAvgCostVSTrxAvgCost_Set2LastTrx` | [L93055](../../../../ScriptDB/000_4_CreateSP.sql#L93055) | — | 0 / 0 | — |
| `DI_AccountAvgCostVSTrxAvgCostList` | [L93100](../../../../ScriptDB/000_4_CreateSP.sql#L93100) | — | 0 / 0 | — |
| `DI_AccountDuplication` | [L93327](../../../../ScriptDB/000_4_CreateSP.sql#L93327) | — | 0 / 0 | — |
| `DI_AccountDuplicationLeadingZero` | [L93372](../../../../ScriptDB/000_4_CreateSP.sql#L93372) | — | 0 / 0 | — |
| `DI_AccountDuplicationList` | [L93427](../../../../ScriptDB/000_4_CreateSP.sql#L93427) | — | 0 / 1 | — |
| `DI_AccountFirstTrxIssue` | [L94063](../../../../ScriptDB/000_4_CreateSP.sql#L94063) | — | 0 / 0 | — |
| `DI_AccountFirstTrxIssueList` | [L94110](../../../../ScriptDB/000_4_CreateSP.sql#L94110) | — | 0 / 0 | — |
| `DI_AccountFixSequence` | [L94192](../../../../ScriptDB/000_4_CreateSP.sql#L94192) | — | 0 / 1 | — |
| `DI_AccountIDWithZeroes2NoZero` | [L94226](../../../../ScriptDB/000_4_CreateSP.sql#L94226) | — | 0 / 0 | — |
| `DI_AccountInactiveNoEndDate` | [L94315](../../../../ScriptDB/000_4_CreateSP.sql#L94315) | — | 0 / 0 | — |
| `DI_AccountInActiveNoEndDateList` | [L94343](../../../../ScriptDB/000_4_CreateSP.sql#L94343) | — | 0 / 0 | — |
| `DI_AccountInactiveNotZero` | [L94481](../../../../ScriptDB/000_4_CreateSP.sql#L94481) | — | 0 / 0 | — |
| `DI_AccountInactiveWithUnit` | [L94520](../../../../ScriptDB/000_4_CreateSP.sql#L94520) | — | 0 / 0 | — |
| `DI_AccountInActiveWithUnitList` | [L94556](../../../../ScriptDB/000_4_CreateSP.sql#L94556) | — | 0 / 1 | — |
| `DI_AccountInactiveWithUnitTrx` | [L94849](../../../../ScriptDB/000_4_CreateSP.sql#L94849) | — | 0 / 0 | — |
| `DI_AccountInActiveWithUnitTrx_RemoveTrx` | [L94932](../../../../ScriptDB/000_4_CreateSP.sql#L94932) | — | 0 / 0 | — |
| `DI_AccountInActiveWithUnitTrxList` | [L94970](../../../../ScriptDB/000_4_CreateSP.sql#L94970) | — | 0 / 0 | — |
| `DI_AccountNoActivitySince` | [L95189](../../../../ScriptDB/000_4_CreateSP.sql#L95189) | — | 0 / 0 | — |
| `DI_AccountNoPosition` | [L95243](../../../../ScriptDB/000_4_CreateSP.sql#L95243) | — | 0 / 0 | — |
| `DI_AccountNoTrxList` | [L95295](../../../../ScriptDB/000_4_CreateSP.sql#L95295) | — | 0 / 0 | — |
| `DI_AccountSetAverageCost` | [L95331](../../../../ScriptDB/000_4_CreateSP.sql#L95331) | — | 0 / 0 | — |
| `DI_AccountTrxOutOfSequence` | [L95373](../../../../ScriptDB/000_4_CreateSP.sql#L95373) | — | 0 / 0 | — |
| `DI_AccountTrxOutOfSequence_SetCalcUnit` | [L95430](../../../../ScriptDB/000_4_CreateSP.sql#L95430) | — | 0 / 2 | — |
| `DI_AccountTrxOutOfSequenceList` | [L95463](../../../../ScriptDB/000_4_CreateSP.sql#L95463) | — | 0 / 0 | — |
| `DI_AccountUnitVSTrxUnit` | [L95916](../../../../ScriptDB/000_4_CreateSP.sql#L95916) | — | 0 / 0 | — |
| `DI_AccountUnitVSTrxUnitList` | [L95974](../../../../ScriptDB/000_4_CreateSP.sql#L95974) | — | 0 / 0 | — |
| `DI_AccountZeroSetInactive` | [L96354](../../../../ScriptDB/000_4_CreateSP.sql#L96354) | — | 0 / 0 | — |
| `DI_ActiveCashAccountNoActivitySince` | [L96593](../../../../ScriptDB/000_4_CreateSP.sql#L96593) | — | 0 / 0 | — |
| `DI_ActiveClientNoBankAccount` | [L96737](../../../../ScriptDB/000_4_CreateSP.sql#L96737) | — | 0 / 0 | — |
| `DI_CalcAverageCostFromAccountLevel` | [L96921](../../../../ScriptDB/000_4_CreateSP.sql#L96921) | — | 2 / 0 | — |
| `DI_CalcAverageCostFromPlanLevel` | [L97015](../../../../ScriptDB/000_4_CreateSP.sql#L97015) | — | 1 / 1 | — |
| `DI_CalcShareBalanceAveFromAccountLevelAll` | [L97329](../../../../ScriptDB/000_4_CreateSP.sql#L97329) | — | 0 / 2 | — |
| `DI_CalcShareBalanceFromAccountLevel` | [L97360](../../../../ScriptDB/000_4_CreateSP.sql#L97360) | — | 1 / 0 | — |
| `DI_CashAccountDuplication` | [L98085](../../../../ScriptDB/000_4_CreateSP.sql#L98085) | — | 0 / 0 | — |
| `DI_CashAccountInactiveWithUnit` | [L98121](../../../../ScriptDB/000_4_CreateSP.sql#L98121) | — | 0 / 0 | — |
| `DI_CashAccountTrxOutOfSequence` | [L98154](../../../../ScriptDB/000_4_CreateSP.sql#L98154) | — | 0 / 0 | — |
| `DI_CashAccountTrxOutOfSequenceForce2CalcVal` | [L98216](../../../../ScriptDB/000_4_CreateSP.sql#L98216) | — | 0 / 1 | — |
| `DI_CashAccountTrxOutOfSequenceList` | [L98248](../../../../ScriptDB/000_4_CreateSP.sql#L98248) | — | 0 / 0 | — |
| `DI_CashCheckOutOfSequence` | [L98474](../../../../ScriptDB/000_4_CreateSP.sql#L98474) | — | 0 / 0 | — |
| `DI_CashZeroTrxNotZeroActive` | [L98566](../../../../ScriptDB/000_4_CreateSP.sql#L98566) | — | 0 / 0 | — |
| `DI_CheckAccountVSTrxUnit` | [L98662](../../../../ScriptDB/000_4_CreateSP.sql#L98662) | — | 0 / 0 | — |
| `DI_CheckCustomerPlanTB` | [L98791](../../../../ScriptDB/000_4_CreateSP.sql#L98791) | — | 0 / 0 | — |
| `DI_CheckPlanRepFSFile` | [L99000](../../../../ScriptDB/000_4_CreateSP.sql#L99000) | — | 0 / 0 | — |
| `DI_ClientActiveAllPlanInactive` | [L99227](../../../../ScriptDB/000_4_CreateSP.sql#L99227) | — | 0 / 0 | — |
| `DI_ClientBankAccountDuplication` | [L99372](../../../../ScriptDB/000_4_CreateSP.sql#L99372) | — | 0 / 0 | — |
| `DI_ClientInactiveAccountActive` | [L99879](../../../../ScriptDB/000_4_CreateSP.sql#L99879) | — | 0 / 1 | — |
| `DI_ClientNoPlan` | [L100837](../../../../ScriptDB/000_4_CreateSP.sql#L100837) | — | 0 / 0 | — |
| `DI_CompareTotalUnitAccountVSTrx` | [L101535](../../../../ScriptDB/000_4_CreateSP.sql#L101535) | — | 0 / 0 | — |
| `DI_CreatePlanUniqueID` | [L101562](../../../../ScriptDB/000_4_CreateSP.sql#L101562) | — | 0 / 1 | — |
| `DI_CustomerPlanScan` | [L101641](../../../../ScriptDB/000_4_CreateSP.sql#L101641) | — | 0 / 0 | — |
| `DI_FixAccountUnit_TrxTypeA` | [L101829](../../../../ScriptDB/000_4_CreateSP.sql#L101829) | — | 0 / 0 | — |
| `DI_FixDuplicateAccount` | [L102098](../../../../ScriptDB/000_4_CreateSP.sql#L102098) | — | 0 / 1 | — |
| `DI_FixDuplicateAccountOne` | [L102144](../../../../ScriptDB/000_4_CreateSP.sql#L102144) | — | 1 / 0 | — |
| `DI_FreezePlanClientOneRep` | [L102292](../../../../ScriptDB/000_4_CreateSP.sql#L102292) | — | 0 / 2 | — |
| `DI_FreezePlanWithDeficientStatus` | [L102341](../../../../ScriptDB/000_4_CreateSP.sql#L102341) | — | 0 / 1 | — |
| `DI_InactiveAccountWithTrxUnitProcess` | [L102370](../../../../ScriptDB/000_4_CreateSP.sql#L102370) | — | 0 / 0 | — |
| `DI_InactiveAccountWithTrxUnitScan` | [L102435](../../../../ScriptDB/000_4_CreateSP.sql#L102435) | — | 0 / 0 | — |
| `DI_LevPlanLoan` | [L102689](../../../../ScriptDB/000_4_CreateSP.sql#L102689) | — | 0 / 0 | — |
| `DI_PlanActiveAccountInactive` | [L103016](../../../../ScriptDB/000_4_CreateSP.sql#L103016) | — | 0 / 0 | — |
| `DI_PlanDuplication` | [L103084](../../../../ScriptDB/000_4_CreateSP.sql#L103084) | — | 0 / 0 | — |
| `DI_PlanDuplicationIntOnly` | [L103138](../../../../ScriptDB/000_4_CreateSP.sql#L103138) | — | 0 / 0 | — |
| `DI_PlanDuplicationList` | [L103184](../../../../ScriptDB/000_4_CreateSP.sql#L103184) | — | 0 / 0 | — |
| `DI_PlanFreezeTaggedItems` | [L103367](../../../../ScriptDB/000_4_CreateSP.sql#L103367) | 1 / 1 file | 0 / 1 | [Plan.cs:4054](../../../../UBClasses/Plan.cs#L4054) |
| `DI_PlanFrozenAsOf` | [L103419](../../../../ScriptDB/000_4_CreateSP.sql#L103419) | — | 0 / 0 | — |
| `DI_PlanInactiveAccountActive` | [L103464](../../../../ScriptDB/000_4_CreateSP.sql#L103464) | — | 0 / 1 | — |
| `DI_PlanInactiveAsOf` | [L103577](../../../../ScriptDB/000_4_CreateSP.sql#L103577) | — | 0 / 0 | — |
| `DI_PlanInvObjIssueList` | [L103615](../../../../ScriptDB/000_4_CreateSP.sql#L103615) | — | 0 / 1 | — |
| `DI_PlanInvObjOffSelUpdate` | [L103980](../../../../ScriptDB/000_4_CreateSP.sql#L103980) | — | 0 / 0 | — |
| `DI_PlanKYCExpiredList` | [L104016](../../../../ScriptDB/000_4_CreateSP.sql#L104016) | — | 1 / 1 | — |
| `DI_PlanKYCExpiredSelUpdate` | [L105310](../../../../ScriptDB/000_4_CreateSP.sql#L105310) | — | 0 / 0 | — |
| `DI_PlanNoAccount` | [L105358](../../../../ScriptDB/000_4_CreateSP.sql#L105358) | — | 0 / 0 | — |
| `DI_PlanNoAccountByDateRep` | [L105420](../../../../ScriptDB/000_4_CreateSP.sql#L105420) | — | 0 / 0 | — |
| `DI_PlanNoBenList` | [L105495](../../../../ScriptDB/000_4_CreateSP.sql#L105495) | — | 0 / 1 | — |
| `DI_PlanNoKYCList` | [L105730](../../../../ScriptDB/000_4_CreateSP.sql#L105730) | — | 0 / 1 | — |
| `DI_PlanNoKYCSelUpdate` | [L106091](../../../../ScriptDB/000_4_CreateSP.sql#L106091) | — | 0 / 0 | — |
| `DI_PlanRiskCalcAll` | [L106138](../../../../ScriptDB/000_4_CreateSP.sql#L106138) | — | 0 / 1 | — |
| `DI_PlanRiskCalcOne` | [L106182](../../../../ScriptDB/000_4_CreateSP.sql#L106182) | — | 1 / 1 | — |
| `DI_PlanRiskIssueList` | [L106245](../../../../ScriptDB/000_4_CreateSP.sql#L106245) | — | 0 / 1 | — |
| `DI_PlanRiskListAll` | [L106639](../../../../ScriptDB/000_4_CreateSP.sql#L106639) | — | 0 / 0 | — |
| `DI_PlanRiskOffSelUpdate` | [L106677](../../../../ScriptDB/000_4_CreateSP.sql#L106677) | — | 0 / 0 | — |
| `DI_PlanScan4MissingSwitch` | [L106724](../../../../ScriptDB/000_4_CreateSP.sql#L106724) | — | 0 / 1 | — |
| `DI_PlanUnfreezeTaggedItems` | [L106790](../../../../ScriptDB/000_4_CreateSP.sql#L106790) | 1 / 1 file | 0 / 1 | [Plan.cs:4098](../../../../UBClasses/Plan.cs#L4098) |
| `DI_PlanZeroMKV` | [L106838](../../../../ScriptDB/000_4_CreateSP.sql#L106838) | — | 0 / 1 | — |
| `DI_PlanZeroMKVAsOf` | [L107051](../../../../ScriptDB/000_4_CreateSP.sql#L107051) | — | 0 / 0 | — |
| `DI_PlanZeroMKVInactivate` | [L107097](../../../../ScriptDB/000_4_CreateSP.sql#L107097) | — | 0 / 1 | — |
| `DI_PlanZeroMKVSelUpdate` | [L107144](../../../../ScriptDB/000_4_CreateSP.sql#L107144) | — | 0 / 0 | — |
| `DI_PSPFileReport_AccountNotFound` | [L107400](../../../../ScriptDB/000_4_CreateSP.sql#L107400) | — | 0 / 0 | — |
| `DI_RemoveZeroPlanDealerAccountID` | [L108343](../../../../ScriptDB/000_4_CreateSP.sql#L108343) | — | 0 / 0 | — |
| `DI_ScanInactiveAccountWithTrxUnit` | [L108434](../../../../ScriptDB/000_4_CreateSP.sql#L108434) | — | 0 / 0 | — |
| `DI_SetAccountInactiveZeroUnit4InactivePlan` | [L108735](../../../../ScriptDB/000_4_CreateSP.sql#L108735) | — | 0 / 0 | — |
| `DI_SetAccountInactiveZeroUnitByDate` | [L108772](../../../../ScriptDB/000_4_CreateSP.sql#L108772) | — | 0 / 0 | — |
| `DI_SetAccountPos2TrxAvgCost` | [L108865](../../../../ScriptDB/000_4_CreateSP.sql#L108865) | — | 0 / 0 | — |
| `DI_SetAccountPos2TrxBalance` | [L108939](../../../../ScriptDB/000_4_CreateSP.sql#L108939) | — | 0 / 0 | — |
| `DI_SetAccountPos2TrxBalance1Day` | [L109012](../../../../ScriptDB/000_4_CreateSP.sql#L109012) | — | 1 / 0 | — |
| `DI_StatsClientRepPlan` | [L109162](../../../../ScriptDB/000_4_CreateSP.sql#L109162) | — | 0 / 0 | — |
| `DI_SysPlanScanAccount` | [L109218](../../../../ScriptDB/000_4_CreateSP.sql#L109218) | — | 0 / 1 | — |
| `DI_TrustCashAccountDiscrepancies` | [L109464](../../../../ScriptDB/000_4_CreateSP.sql#L109464) | — | 0 / 0 | — |
| `DI_TrustCashAccountDiscrepanciesRefresh1` | [L109497](../../../../ScriptDB/000_4_CreateSP.sql#L109497) | — | 0 / 1 | — |
| `FMPlanAdd` | [L113602](../../../../ScriptDB/000_4_CreateSP.sql#L113602) | — | 0 / 8 | — |
| `FMPlanBenAdd` | [L113842](../../../../ScriptDB/000_4_CreateSP.sql#L113842) | — | 0 / 9 | — |
| `FMPlanBenRemove` | [L114064](../../../../ScriptDB/000_4_CreateSP.sql#L114064) | — | 0 / 1 | — |
| `FMPlanBenUpdate` | [L114103](../../../../ScriptDB/000_4_CreateSP.sql#L114103) | — | 0 / 7 | — |
| `FSXMLOrderRRIFPYMT_TBD` | [L114253](../../../../ScriptDB/000_4_CreateSP.sql#L114253) | — | 0 / 0 | — |
| `GenerateAccountNumber` | [L114553](../../../../ScriptDB/000_4_CreateSP.sql#L114553) | — | 0 / 0 | — |
| `Init_AccountPosCalcOne` | [L115782](../../../../ScriptDB/000_4_CreateSP.sql#L115782) | — | 1 / 1 | — |
| `Init_AccountPosCalcOne_Step1` | [L115839](../../../../ScriptDB/000_4_CreateSP.sql#L115839) | — | 0 / 0 | — |
| `Init_AccountPosCalcOne_Step2` | [L115864](../../../../ScriptDB/000_4_CreateSP.sql#L115864) | — | 0 / 1 | — |
| `Init_CashAccountWithBalanceNoTrx` | [L116124](../../../../ScriptDB/000_4_CreateSP.sql#L116124) | — | 0 / 0 | — |
| `Init_CheckAccountPosUnit` | [L116217](../../../../ScriptDB/000_4_CreateSP.sql#L116217) | — | 0 / 0 | — |
| `Init_CheckAccountPosUnitBecauseTrnsf` | [L116296](../../../../ScriptDB/000_4_CreateSP.sql#L116296) | — | 0 / 0 | — |
| `Init_CheckAccountTradeDateProcessingDateDiff` | [L116377](../../../../ScriptDB/000_4_CreateSP.sql#L116377) | — | 0 / 0 | — |
| `Init_CompCheckPlanInfoScanQuestion` | [L117263](../../../../ScriptDB/000_4_CreateSP.sql#L117263) | — | 0 / 0 | — |
| `Init_CompCheckPlanInfoScanQuestionFlag` | [L117304](../../../../ScriptDB/000_4_CreateSP.sql#L117304) | — | 0 / 0 | — |
| `Init_DealerAccountIDUpdate` | [L117867](../../../../ScriptDB/000_4_CreateSP.sql#L117867) | — | 0 / 0 | — |
| `Init_FindAccountSpousalDiscrepancy` | [L118384](../../../../ScriptDB/000_4_CreateSP.sql#L118384) | — | 0 / 0 | — |
| `Init_FindAccountZero` | [L118431](../../../../ScriptDB/000_4_CreateSP.sql#L118431) | — | 0 / 0 | — |
| `Init_FirstTrxOnPlanAll` | [L118511](../../../../ScriptDB/000_4_CreateSP.sql#L118511) | — | 0 / 1 | — |
| `Init_FirstTrxOnPlanAll2` | [L118561](../../../../ScriptDB/000_4_CreateSP.sql#L118561) | — | 0 / 1 | — |
| `Init_FixingTrustCashTrx` | [L119114](../../../../ScriptDB/000_4_CreateSP.sql#L119114) | — | 0 / 0 | — |
| `Init_FixPlanClientLink` | [L119158](../../../../ScriptDB/000_4_CreateSP.sql#L119158) | — | 0 / 0 | — |
| `Init_FixTransferInAccountUnitIssue` | [L119253](../../../../ScriptDB/000_4_CreateSP.sql#L119253) | — | 0 / 1 | — |
| `Init_FreezePlanPrior` | [L119315](../../../../ScriptDB/000_4_CreateSP.sql#L119315) | — | 0 / 1 | — |
| `Init_ListSupplierBasedClientAccount` | [L119683](../../../../ScriptDB/000_4_CreateSP.sql#L119683) | — | 0 / 0 | — |
| `Init_MarkDeleteXTransferInOutAllPlan` | [L120216](../../../../ScriptDB/000_4_CreateSP.sql#L120216) | — | 0 / 1 | — |
| `Init_MarkDeleteXTransferInOutAllPlan2` | [L120377](../../../../ScriptDB/000_4_CreateSP.sql#L120377) | — | 0 / 1 | — |
| `Init_MarkDeleteXTransferInOutOnePlan` | [L120412](../../../../ScriptDB/000_4_CreateSP.sql#L120412) | — | 2 / 1 | — |
| `Init_MON_CheckTrustTrxCash` | [L120776](../../../../ScriptDB/000_4_CreateSP.sql#L120776) | — | 0 / 1 | — |
| `Init_MoveMRS2Cash` | [L121008](../../../../ScriptDB/000_4_CreateSP.sql#L121008) | — | 0 / 1 | — |
| `Init_MoveMRS2CashAddTrx` | [L121049](../../../../ScriptDB/000_4_CreateSP.sql#L121049) | — | 1 / 0 | — |
| `Init_MoveMRS2CashDeleteAfter` | [L121113](../../../../ScriptDB/000_4_CreateSP.sql#L121113) | — | 0 / 0 | — |
| `Init_MoveMRS2CashOneAccount` | [L121152](../../../../ScriptDB/000_4_CreateSP.sql#L121152) | — | 1 / 1 | — |
| `Init_MoveMRS2CashOnePlan` | [L121221](../../../../ScriptDB/000_4_CreateSP.sql#L121221) | — | 1 / 1 | — |
| `Init_MovePlan2Rep` | [L121295](../../../../ScriptDB/000_4_CreateSP.sql#L121295) | — | 0 / 0 | — |
| `Init_PlanQuestionDef` | [L121398](../../../../ScriptDB/000_4_CreateSP.sql#L121398) | — | 1 / 1 | — |
| `Init_PlanQuestionDefAll` | [L121480](../../../../ScriptDB/000_4_CreateSP.sql#L121480) | — | 0 / 1 | — |
| `Init_PlanQuestionPurpose_25` | [L121519](../../../../ScriptDB/000_4_CreateSP.sql#L121519) | — | 1 / 0 | — |
| `Init_PlanQuestionPurpose_25_All` | [L121635](../../../../ScriptDB/000_4_CreateSP.sql#L121635) | — | 0 / 1 | — |
| `Init_PlanStartDate` | [L121673](../../../../ScriptDB/000_4_CreateSP.sql#L121673) | — | 0 / 0 | — |
| `Init_ScanClientPlanLink` | [L122820](../../../../ScriptDB/000_4_CreateSP.sql#L122820) | — | 0 / 0 | — |
| `Init_SetInactiveAccountEndDate` | [L123347](../../../../ScriptDB/000_4_CreateSP.sql#L123347) | — | 0 / 0 | — |
| `Init_SetPlanFrozen4MissingKYC` | [L123418](../../../../ScriptDB/000_4_CreateSP.sql#L123418) | — | 0 / 1 | — |
| `Init_SetPlanFrozen4RepCodes` | [L123476](../../../../ScriptDB/000_4_CreateSP.sql#L123476) | — | 0 / 1 | — |
| `Init_SetPlanStartDate` | [L123528](../../../../ScriptDB/000_4_CreateSP.sql#L123528) | — | 0 / 0 | — |
| `Init_UpdateCashBalance` | [L123871](../../../../ScriptDB/000_4_CreateSP.sql#L123871) | — | 0 / 0 | — |
| `InitFixTrustWHTMgmtCode` | [L124134](../../../../ScriptDB/000_4_CreateSP.sql#L124134) | — | 0 / 0 | — |
| `MemberBankAccountVerify` | [L124252](../../../../ScriptDB/000_4_CreateSP.sql#L124252) | — | 1 / 0 | — |
| `PHX_CON_Plan` | [L162914](../../../../ScriptDB/000_4_CreateSP.sql#L162914) | — | 0 / 2 | — |
| `PHX_CON_PlanBen` | [L163138](../../../../ScriptDB/000_4_CreateSP.sql#L163138) | — | 1 / 2 | — |
| `PHX_CON_Trust_All` | [L163412](../../../../ScriptDB/000_4_CreateSP.sql#L163412) | — | 0 / 1 | — |
| `PHX_CON_Trust_All_Excel` | [L163437](../../../../ScriptDB/000_4_CreateSP.sql#L163437) | — | 0 / 1 | — |
| `PHX_CON_Trust_One` | [L163462](../../../../ScriptDB/000_4_CreateSP.sql#L163462) | — | 1 / 0 | — |
| `PHX_CON_Trust_One_Excel` | [L163577](../../../../ScriptDB/000_4_CreateSP.sql#L163577) | — | 1 / 0 | — |
| `PlanLoanList` | [L165124](../../../../ScriptDB/000_4_CreateSP.sql#L165124) | — | 0 / 1 | — |
| `PSC_Conv_MergeAccount` | [L165372](../../../../ScriptDB/000_4_CreateSP.sql#L165372) | — | 0 / 1 | — |
| `PSC_Conv_MergeAccount_Step1` | [L165427](../../../../ScriptDB/000_4_CreateSP.sql#L165427) | — | 0 / 0 | — |
| `PSC_Conv_MergeAccount_Step2` | [L165468](../../../../ScriptDB/000_4_CreateSP.sql#L165468) | — | 0 / 1 | — |
| `PSC_Conv_MergeAccount_Step3` | [L165512](../../../../ScriptDB/000_4_CreateSP.sql#L165512) | — | 0 / 1 | — |
| `PSC_Conv_MergeAccountOne` | [L165539](../../../../ScriptDB/000_4_CreateSP.sql#L165539) | — | 2 / 0 | — |
| `PSC_Move1CashAccount` | [L165617](../../../../ScriptDB/000_4_CreateSP.sql#L165617) | — | 1 / 0 | — |
| `PSC_Move1Plan` | [L165765](../../../../ScriptDB/000_4_CreateSP.sql#L165765) | — | 1 / 2 | — |
| `RESP_Plan300` | [L165979](../../../../ScriptDB/000_4_CreateSP.sql#L165979) | — | 0 / 1 | — |
| `RESP_PlanOne` | [L166006](../../../../ScriptDB/000_4_CreateSP.sql#L166006) | — | 1 / 2 | — |
| `SKOmnibusAccountDetailList` | [L166549](../../../../ScriptDB/000_4_CreateSP.sql#L166549) | 1 / 1 file | 1 / 0 | [Stock.cs:854](../../../../UBClasses/Stock.cs#L854) |
| `SKOmnibusAccountList` | [L166739](../../../../ScriptDB/000_4_CreateSP.sql#L166739) | 1 / 1 file | 0 / 1 | [Stock.cs:795](../../../../UBClasses/Stock.cs#L795) |
| `SKOmnibusAccountSelectionUpdate` | [L166881](../../../../ScriptDB/000_4_CreateSP.sql#L166881) | — | 0 / 0 | — |
| `TrustTrxDetailUpdate` | [L170797](../../../../ScriptDB/000_4_CreateSP.sql#L170797) | — | 3 / 0 | — |
| `UBAACashTrxSetConfirmStatus` | [L173766](../../../../ScriptDB/000_4_CreateSP.sql#L173766) | — | 6 / 0 | — |
| `UBAADetailListPlan` | [L174057](../../../../ScriptDB/000_4_CreateSP.sql#L174057) | — | 1 / 0 | — |
| `UBAAItemInfoPlan` | [L175535](../../../../ScriptDB/000_4_CreateSP.sql#L175535) | 1 / 1 file | 0 / 1 | [AssetAllocation.cs:622](../../../../UBClasses/AssetAllocation.cs#L622) |
| `UBAAPlanList` | [L176018](../../../../ScriptDB/000_4_CreateSP.sql#L176018) | 1 / 1 file | 0 / 2 | [AssetAllocation.cs:1379](../../../../UBClasses/AssetAllocation.cs#L1379) |
| `UBAAPlanModelAssigned` | [L176325](../../../../ScriptDB/000_4_CreateSP.sql#L176325) | 1 / 1 file | 0 / 0 | [AssetAllocation.cs:478](../../../../UBClasses/AssetAllocation.cs#L478) |
| `UBAAPlanRebalanceVerifyAfter` | [L176360](../../../../ScriptDB/000_4_CreateSP.sql#L176360) | — | 1 / 0 | — |
| `UBAAPlanRebalanceVerifyAfterV2` | [L176520](../../../../ScriptDB/000_4_CreateSP.sql#L176520) | — | 0 / 0 | — |
| `UBAAPlanRebalanceVerifyAllAfter` | [L176596](../../../../ScriptDB/000_4_CreateSP.sql#L176596) | 1 / 1 file | 0 / 1 | [AssetAllocation.cs:306](../../../../UBClasses/AssetAllocation.cs#L306) |
| `UBAARebalancePlanList` | [L176698](../../../../ScriptDB/000_4_CreateSP.sql#L176698) | 1 / 1 file | 0 / 0 | [AssetAllocation.cs:168](../../../../UBClasses/AssetAllocation.cs#L168) |
| `UBAARebalancingOnePlan` | [L176789](../../../../ScriptDB/000_4_CreateSP.sql#L176789) | — | 2 / 0 | — |
| `UBAARebalancingPlan` | [L176935](../../../../ScriptDB/000_4_CreateSP.sql#L176935) | 1 / 1 file | 0 / 1 | [AssetAllocation.cs:1279](../../../../UBClasses/AssetAllocation.cs#L1279) |
| `UBAARebalancingPlanTrx` | [L176992](../../../../ScriptDB/000_4_CreateSP.sql#L176992) | 1 / 1 file | 0 / 5 | [AssetAllocation.cs:1325](../../../../UBClasses/AssetAllocation.cs#L1325) |
| `UBAARebalancingPlanTrxUndo` | [L177260](../../../../ScriptDB/000_4_CreateSP.sql#L177260) | — | 1 / 2 | — |
| `UBAARebalancingPlanUndo` | [L177340](../../../../ScriptDB/000_4_CreateSP.sql#L177340) | 1 / 1 file | 0 / 1 | [AssetAllocation.cs:1525](../../../../UBClasses/AssetAllocation.cs#L1525) |
| `UBAARebalancingScan4BuyAllPlan` | [L177380](../../../../ScriptDB/000_4_CreateSP.sql#L177380) | — | 0 / 1 | — |
| `UBAARebalancingScan4BuyOnePlan` | [L177409](../../../../ScriptDB/000_4_CreateSP.sql#L177409) | — | 1 / 0 | — |
| `UBAccountClientList` | [L177773](../../../../ScriptDB/000_4_CreateSP.sql#L177773) | 1 / 1 file | 0 / 0 | [FundAccount.cs:1532](../../../../UBClasses/FundAccount.cs#L1532) |
| `UBAccountEditComboList` | [L177837](../../../../ScriptDB/000_4_CreateSP.sql#L177837) | — | 0 / 17 | — |
| `UBAccountInfoUD` | [L177884](../../../../ScriptDB/000_4_CreateSP.sql#L177884) | 1 / 1 file | 0 / 0 | [UserDefinedField.cs:213](../../../../UBClasses/UserDefinedField.cs#L213) |
| `UBAccountListICTFrom` | [L177949](../../../../ScriptDB/000_4_CreateSP.sql#L177949) | 1 / 1 file | 0 / 0 | [FundAccount.cs:674](../../../../UBClasses/FundAccount.cs#L674) |
| `UBAccountListICTTo` | [L177996](../../../../ScriptDB/000_4_CreateSP.sql#L177996) | 1 / 1 file | 0 / 0 | [FundAccount.cs:767](../../../../UBClasses/FundAccount.cs#L767) |
| `UBAccountPlanID` | [L178085](../../../../ScriptDB/000_4_CreateSP.sql#L178085) | 2 / 1 file | 0 / 0 | [FundAccount.cs:1577](../../../../UBClasses/FundAccount.cs#L1577) |
| `UBAccountStatusList` | [L178124](../../../../ScriptDB/000_4_CreateSP.sql#L178124) | — | 5 / 0 | — |
| `UBAccountTypeDetailList` | [L178154](../../../../ScriptDB/000_4_CreateSP.sql#L178154) | — | 1 / 0 | — |
| `UBAccountUDAdd` | [L178183](../../../../ScriptDB/000_4_CreateSP.sql#L178183) | — | 2 / 1 | — |
| `UBAccountUDAddTMP` | [L178246](../../../../ScriptDB/000_4_CreateSP.sql#L178246) | — | 0 / 0 | — |
| `UBAccountUserDefTMPEnd` | [L178307](../../../../ScriptDB/000_4_CreateSP.sql#L178307) | 1 / 1 file | 1 / 0 | [UserDefinedField.cs:274](../../../../UBClasses/UserDefinedField.cs#L274) |
| `UBAccountViewComboList` | [L178336](../../../../ScriptDB/000_4_CreateSP.sql#L178336) | — | 0 / 19 | — |
| `UBAccountViewSearch` | [L178387](../../../../ScriptDB/000_4_CreateSP.sql#L178387) | 1 / 1 file | 0 / 4 | [FundAccount.cs:1382](../../../../UBClasses/FundAccount.cs#L1382) |
| `UBAccountViewSearchCriteriaSave` | [L180643](../../../../ScriptDB/000_4_CreateSP.sql#L180643) | — | 1 / 1 | — |
| `UBAccountViewSearchEx` | [L180977](../../../../ScriptDB/000_4_CreateSP.sql#L180977) | — | 1 / 1 | — |
| `UBAssetCashOneMgmt` | [L184676](../../../../ScriptDB/000_4_CreateSP.sql#L184676) | — | 1 / 1 | — |
| `UBAssetRecalcPlanCurrent` | [L186583](../../../../ScriptDB/000_4_CreateSP.sql#L186583) | — | 8 / 0 | — |
| `UBAssetRecalcPlanCurrentAll` | [L186620](../../../../ScriptDB/000_4_CreateSP.sql#L186620) | — | 2 / 1 | — |
| `UBAssetSetRecalcPlan` | [L186656](../../../../ScriptDB/000_4_CreateSP.sql#L186656) | — | 12 / 0 | — |
| `UBAuditTrailClientPlanBank` | [L188807](../../../../ScriptDB/000_4_CreateSP.sql#L188807) | — | 4 / 4 | — |
| `UBAuditTrailClientPlanBankAccount` | [L188884](../../../../ScriptDB/000_4_CreateSP.sql#L188884) | — | 6 / 2 | — |
| `UBAuditTrailInitAllPlans` | [L189902](../../../../ScriptDB/000_4_CreateSP.sql#L189902) | — | 1 / 1 | — |
| `UBAuditTrailInitOnePlan` | [L190712](../../../../ScriptDB/000_4_CreateSP.sql#L190712) | — | 3 / 8 | — |
| `UBAuditTrailInitPlanInvestInfo` | [L190975](../../../../ScriptDB/000_4_CreateSP.sql#L190975) | — | 1 / 4 | — |
| `UBAuditTrailPlanBen` | [L191170](../../../../ScriptDB/000_4_CreateSP.sql#L191170) | — | 9 / 6 | — |
| `UBAuditTrailPlanBenCon` | [L191218](../../../../ScriptDB/000_4_CreateSP.sql#L191218) | — | 2 / 6 | — |
| `UBAuditTrailPlanBenNameList` | [L191267](../../../../ScriptDB/000_4_CreateSP.sql#L191267) | — | 0 / 0 | — |
| `UBAuditTrailPlanExtraInfo` | [L191319](../../../../ScriptDB/000_4_CreateSP.sql#L191319) | — | 4 / 5 | — |
| `UBAuditTrailPlanInTrust` | [L191382](../../../../ScriptDB/000_4_CreateSP.sql#L191382) | — | 6 / 5 | — |
| `UBAuditTrailPlanThirdParty` | [L191430](../../../../ScriptDB/000_4_CreateSP.sql#L191430) | — | 3 / 5 | — |
| `UBAveragedCostCalc1Plan` | [L192236](../../../../ScriptDB/000_4_CreateSP.sql#L192236) | — | 1 / 1 | — |
| `UBBankAccountTypeList` | [L192647](../../../../ScriptDB/000_4_CreateSP.sql#L192647) | — | 7 / 0 | — |
| `UBBasketPlanID` | [L193541](../../../../ScriptDB/000_4_CreateSP.sql#L193541) | 1 / 1 file | 0 / 0 | [Trx.cs:6466](../../../../UBClasses/Trx.cs#L6466) |
| `UBBenItemInfo4RESP` | [L194791](../../../../ScriptDB/000_4_CreateSP.sql#L194791) | 1 / 1 file | 0 / 1 | [Plan.cs:5139](../../../../UBClasses/Plan.cs#L5139) |
| `UBBulkSwitchBasketPlanAdd` | [L197902](../../../../ScriptDB/000_4_CreateSP.sql#L197902) | — | 1 / 0 | — |
| `UBCannexProcessResponse` | [L201830](../../../../ScriptDB/000_4_CreateSP.sql#L201830) | — | 0 / 1 | — |
| `UBCashAccountAdd` | [L202305](../../../../ScriptDB/000_4_CreateSP.sql#L202305) | 1 / 1 file | 0 / 4 | [CashAccount.cs:237](../../../../UBClasses/CashAccount.cs#L237) |
| `UBCashAccountClientList` | [L202405](../../../../ScriptDB/000_4_CreateSP.sql#L202405) | 1 / 1 file | 0 / 0 | [CashAccount.cs:1014](../../../../UBClasses/CashAccount.cs#L1014) |
| `UBCashAccountContribution` | [L202475](../../../../ScriptDB/000_4_CreateSP.sql#L202475) | — | 1 / 1 | — |
| `UBCashAccountDeposit` | [L202579](../../../../ScriptDB/000_4_CreateSP.sql#L202579) | — | 1 / 1 | — |
| `UBCashAccountDetailX` | [L202787](../../../../ScriptDB/000_4_CreateSP.sql#L202787) | — | 0 / 0 | — |
| `UBCashAccountFixByAddingExternalTrx` | [L202881](../../../../ScriptDB/000_4_CreateSP.sql#L202881) | — | 0 / 1 | — |
| `UBCashAccountInactivate` | [L202969](../../../../ScriptDB/000_4_CreateSP.sql#L202969) | — | 1 / 4 | — |
| `UBCashAccountInfo` | [L203022](../../../../ScriptDB/000_4_CreateSP.sql#L203022) | 1 / 1 file | 0 / 1 | [CashAccount.cs:185](../../../../UBClasses/CashAccount.cs#L185) |
| `UBCashAccountList` | [L203095](../../../../ScriptDB/000_4_CreateSP.sql#L203095) | 1 / 1 file | 0 / 4 | [CashAccount.cs:842](../../../../UBClasses/CashAccount.cs#L842) |
| `UBCashAccountListFromTrust` | [L203986](../../../../ScriptDB/000_4_CreateSP.sql#L203986) | — | 1 / 3 | — |
| `UBCashAccountMoveAllFromPlan2Plan` | [L204568](../../../../ScriptDB/000_4_CreateSP.sql#L204568) | — | 0 / 1 | — |
| `UBCashAccountMoveFromPlan2Plan` | [L204605](../../../../ScriptDB/000_4_CreateSP.sql#L204605) | 1 / 1 file | 1 / 0 | [Plan.cs:3456](../../../../UBClasses/Plan.cs#L3456) |
| `UBCashAccountMoveOneTrx` | [L204634](../../../../ScriptDB/000_4_CreateSP.sql#L204634) | — | 1 / 1 | — |
| `UBCashAccountMoveTrx` | [L204653](../../../../ScriptDB/000_4_CreateSP.sql#L204653) | 1 / 1 file | 0 / 0 | [Plan.cs:3502](../../../../UBClasses/Plan.cs#L3502) |
| `UBCashAccountPlanID` | [L204706](../../../../ScriptDB/000_4_CreateSP.sql#L204706) | 1 / 1 file | 0 / 0 | [CashAccount.cs:1108](../../../../UBClasses/CashAccount.cs#L1108) |
| `UBCashAccountRemove` | [L204740](../../../../ScriptDB/000_4_CreateSP.sql#L204740) | 1 / 1 file | 0 / 0 | [CashAccount.cs:299](../../../../UBClasses/CashAccount.cs#L299) |
| `UBCashAccountSearchCriteriaSave` | [L204800](../../../../ScriptDB/000_4_CreateSP.sql#L204800) | — | 2 / 3 | — |
| `UBCashAccountSyncBalance` | [L204878](../../../../ScriptDB/000_4_CreateSP.sql#L204878) | — | 0 / 0 | — |
| `UBCashAccountSyncTrustTrx` | [L204931](../../../../ScriptDB/000_4_CreateSP.sql#L204931) | — | 2 / 4 | — |
| `UBCashAccountSyncTrustTrx1Plan` | [L205124](../../../../ScriptDB/000_4_CreateSP.sql#L205124) | — | 0 / 1 | — |
| `UBCashAccountTrxAdd` | [L205196](../../../../ScriptDB/000_4_CreateSP.sql#L205196) | 1 / 1 file | 1 / 0 | [CashAccount.cs:540](../../../../UBClasses/CashAccount.cs#L540) |
| `UBCashAccountTrxAddInternal` | [L205391](../../../../ScriptDB/000_4_CreateSP.sql#L205391) | — | 2 / 1 | — |
| `UBCashAccountTrxAddTrx` | [L205505](../../../../ScriptDB/000_4_CreateSP.sql#L205505) | — | 2 / 2 | — |
| `UBCashAccountTrxComboList` | [L205667](../../../../ScriptDB/000_4_CreateSP.sql#L205667) | — | 0 / 3 | — |
| `UBCashAccountTrxDeleteTrx` | [L205694](../../../../ScriptDB/000_4_CreateSP.sql#L205694) | — | 0 / 2 | — |
| `UBCashAccountTrxInfo` | [L205762](../../../../ScriptDB/000_4_CreateSP.sql#L205762) | 1 / 1 file | 0 / 0 | [CashAccount.cs:484](../../../../UBClasses/CashAccount.cs#L484) |
| `UBCashAccountTrxList` | [L205860](../../../../ScriptDB/000_4_CreateSP.sql#L205860) | 1 / 1 file | 0 / 3 | [CashAccount.cs:929](../../../../UBClasses/CashAccount.cs#L929) |
| `UBCashAccountTrxList_Daily` | [L206624](../../../../ScriptDB/000_4_CreateSP.sql#L206624) | — | 0 / 0 | — |
| `UBCashAccountTrxList_Monthly` | [L206759](../../../../ScriptDB/000_4_CreateSP.sql#L206759) | — | 1 / 0 | — |
| `UBCashAccountTrxListAll` | [L206947](../../../../ScriptDB/000_4_CreateSP.sql#L206947) | — | 0 / 0 | — |
| `UBCashAccountTrxListX` | [L207258](../../../../ScriptDB/000_4_CreateSP.sql#L207258) | — | 0 / 0 | — |
| `UBCashAccountTrxRemove` | [L207341](../../../../ScriptDB/000_4_CreateSP.sql#L207341) | 1 / 1 file | 1 / 1 | [CashAccount.cs:612](../../../../UBClasses/CashAccount.cs#L612) |
| `UBCashAccountTrxRemoveByTrustID` | [L207409](../../../../ScriptDB/000_4_CreateSP.sql#L207409) | — | 0 / 1 | — |
| `UBCashAccountTrxReversal` | [L207451](../../../../ScriptDB/000_4_CreateSP.sql#L207451) | — | 1 / 0 | — |
| `UBCashAccountTrxStatusUpdate` | [L207493](../../../../ScriptDB/000_4_CreateSP.sql#L207493) | — | 1 / 1 | — |
| `UBCashAccountTrxUpdate` | [L207557](../../../../ScriptDB/000_4_CreateSP.sql#L207557) | 1 / 1 file | 0 / 0 | [CashAccount.cs:540](../../../../UBClasses/CashAccount.cs#L540) |
| `UBCashAccountUnitBalanceMKV` | [L207650](../../../../ScriptDB/000_4_CreateSP.sql#L207650) | — | 1 / 0 | — |
| `UBCashAccountUpdate` | [L207711](../../../../ScriptDB/000_4_CreateSP.sql#L207711) | 1 / 1 file | 0 / 4 | [CashAccount.cs:237](../../../../UBClasses/CashAccount.cs#L237) |
| `UBCashAccountVerifyNominee` | [L207812](../../../../ScriptDB/000_4_CreateSP.sql#L207812) | — | 5 / 0 | — |
| `UBCashAccountZeroOut` | [L207894](../../../../ScriptDB/000_4_CreateSP.sql#L207894) | — | 0 / 0 | — |
| `UBCashAcctDesc` | [L207938](../../../../ScriptDB/000_4_CreateSP.sql#L207938) | 1 / 1 file | 0 / 0 | [CashAccount.cs:661](../../../../UBClasses/CashAccount.cs#L661) |
| `UBCashCompareFG` | [L207965](../../../../ScriptDB/000_4_CreateSP.sql#L207965) | — | 0 / 0 | — |
| `UBCashListOneAccountTrx` | [L208006](../../../../ScriptDB/000_4_CreateSP.sql#L208006) | 1 / 1 file | 0 / 0 | [CashAccount.cs:432](../../../../UBClasses/CashAccount.cs#L432) |
| `UBCashListOnePlan` | [L208396](../../../../ScriptDB/000_4_CreateSP.sql#L208396) | 1 / 1 file | 1 / 1 | [CashAccount.cs:135](../../../../UBClasses/CashAccount.cs#L135) |
| `UBCashListOnePlanShort` | [L208555](../../../../ScriptDB/000_4_CreateSP.sql#L208555) | 1 / 1 file | 0 / 0 | [CashAccount.cs:757](../../../../UBClasses/CashAccount.cs#L757) |
| `UBCashTrxCleanupDuplication` | [L208595](../../../../ScriptDB/000_4_CreateSP.sql#L208595) | — | 0 / 0 | — |
| `UBCashTrxClientList` | [L208647](../../../../ScriptDB/000_4_CreateSP.sql#L208647) | 1 / 1 file | 0 / 0 | [CashAccount.cs:1064](../../../../UBClasses/CashAccount.cs#L1064) |
| `UBCashTrxDesc` | [L208697](../../../../ScriptDB/000_4_CreateSP.sql#L208697) | 1 / 1 file | 0 / 0 | [CashAccount.cs:712](../../../../UBClasses/CashAccount.cs#L712) |
| `UBCashTrxMoveFromCAD2USD` | [L208725](../../../../ScriptDB/000_4_CreateSP.sql#L208725) | — | 0 / 1 | — |
| `UBCashTrxSearchCriteriaSave` | [L208764](../../../../ScriptDB/000_4_CreateSP.sql#L208764) | — | 1 / 3 | — |
| `UBCashTrxSyncTrustTrx` | [L208828](../../../../ScriptDB/000_4_CreateSP.sql#L208828) | — | 0 / 0 | — |
| `UBCashTrxTypeList` | [L208851](../../../../ScriptDB/000_4_CreateSP.sql#L208851) | — | 1 / 0 | — |
| `UBCashUpdateBalanceWithCalc` | [L208885](../../../../ScriptDB/000_4_CreateSP.sql#L208885) | 1 / 1 file | 20 / 0 | [CashAccount.cs:386](../../../../UBClasses/CashAccount.cs#L386) |
| `UBCashUpdateBalanceWithCalcAll` | [L208965](../../../../ScriptDB/000_4_CreateSP.sql#L208965) | — | 0 / 1 | — |
| `UBCashUpdateBalanceWithCalcAll_Agra_Ex` | [L209018](../../../../ScriptDB/000_4_CreateSP.sql#L209018) | — | 0 / 1 | — |
| `UBCashUpdateBalanceWithCalcByIntCode` | [L209048](../../../../ScriptDB/000_4_CreateSP.sql#L209048) | — | 0 / 1 | — |
| `UBCashUpdateBalanceWithCalcRev` | [L209086](../../../../ScriptDB/000_4_CreateSP.sql#L209086) | — | 1 / 0 | — |
| `UBCashUpdateBalanceWithCalcRevA` | [L209150](../../../../ScriptDB/000_4_CreateSP.sql#L209150) | — | 1 / 0 | — |
| `UBCashUpdateBalanceWithCalcRevAll` | [L209208](../../../../ScriptDB/000_4_CreateSP.sql#L209208) | — | 0 / 2 | — |
| `UBCashViewComboList` | [L209256](../../../../ScriptDB/000_4_CreateSP.sql#L209256) | — | 0 / 4 | — |
| `UBCDICDataInitUCIOnePlan` | [L209709](../../../../ScriptDB/000_4_CreateSP.sql#L209709) | — | 3 / 0 | — |
| `UBCDICDataInitUCIOnePlanX` | [L209980](../../../../ScriptDB/000_4_CreateSP.sql#L209980) | — | 1 / 0 | — |
| `UBCDICPlanList` | [L210281](../../../../ScriptDB/000_4_CreateSP.sql#L210281) | — | 0 / 0 | — |
| `UBClientBankAccountDuplicate` | [L213979](../../../../ScriptDB/000_4_CreateSP.sql#L213979) | — | 3 / 0 | — |
| `UBClientBankAccountID` | [L214021](../../../../ScriptDB/000_4_CreateSP.sql#L214021) | — | 2 / 0 | — |
| `UBClientCashPosExport` | [L214331](../../../../ScriptDB/000_4_CreateSP.sql#L214331) | 1 / 1 file | 0 / 0 | [CCashAccount.cs:89](../../../../UBExport/CCashAccount.cs#L89) |
| `UBClientInfoSpouseByPlanID` | [L221428](../../../../ScriptDB/000_4_CreateSP.sql#L221428) | 1 / 1 file | 0 / 0 | [Customer.cs:351](../../../../UBClasses/Customer.cs#L351) |
| `UBClientKYCSetCashAndCashEquivalent` | [L222974](../../../../ScriptDB/000_4_CreateSP.sql#L222974) | — | 3 / 0 | — |
| `UBClientNamesByPlanID` | [L225104](../../../../ScriptDB/000_4_CreateSP.sql#L225104) | 1 / 1 file | 0 / 0 | [Plan.cs:5016](../../../../UBClasses/Plan.cs#L5016) |
| `UBClientPlan` | [L225777](../../../../ScriptDB/000_4_CreateSP.sql#L225777) | 1 / 1 file | 0 / 1 | [Customer.cs:627](../../../../UBClasses/Customer.cs#L627) |
| `UBClientPlan4Doc` | [L226017](../../../../ScriptDB/000_4_CreateSP.sql#L226017) | 1 / 1 file | 0 / 1 | [Customer.cs:940](../../../../UBClasses/Customer.cs#L940) |
| `UBClientPlanCB` | [L226142](../../../../ScriptDB/000_4_CreateSP.sql#L226142) | 2 / 1 file | 0 / 1 | [Customer.cs:868](../../../../UBClasses/Customer.cs#L868) |
| `UBClientPlanExport` | [L226336](../../../../ScriptDB/000_4_CreateSP.sql#L226336) | 1 / 1 file | 0 / 2 | [ClientList.cs:237](../../../../UBExport/ClientList.cs#L237) |
| `UBClientPlanExport4Global` | [L226600](../../../../ScriptDB/000_4_CreateSP.sql#L226600) | — | 0 / 1 | — |
| `UBClientPlanExportAll` | [L226820](../../../../ScriptDB/000_4_CreateSP.sql#L226820) | — | 0 / 1 | — |
| `UBClientPlanExportAll_Init` | [L227442](../../../../ScriptDB/000_4_CreateSP.sql#L227442) | — | 0 / 1 | — |
| `UBClientPlanList` | [L227841](../../../../ScriptDB/000_4_CreateSP.sql#L227841) | 1 / 1 file | 0 / 2 | [Customer.cs:736](../../../../UBClasses/Customer.cs#L736) |
| `UBClientPlanListX` | [L228034](../../../../ScriptDB/000_4_CreateSP.sql#L228034) | — | 0 / 0 | — |
| `UBClientPlanNomineeList` | [L228181](../../../../ScriptDB/000_4_CreateSP.sql#L228181) | 1 / 1 file | 0 / 0 | [Plan.cs:4791](../../../../UBClasses/Plan.cs#L4791) |
| `UBClientPlanPortfolioList` | [L228255](../../../../ScriptDB/000_4_CreateSP.sql#L228255) | 1 / 1 file | 0 / 0 | [Plan.cs:4722](../../../../UBClasses/Plan.cs#L4722) |
| `UBClientPlanQuestion4Form` | [L228279](../../../../ScriptDB/000_4_CreateSP.sql#L228279) | — | 1 / 0 | — |
| `UBClientRRSPLIRAList` | [L229005](../../../../ScriptDB/000_4_CreateSP.sql#L229005) | 1 / 1 file | 0 / 0 | [Customer.cs:6117](../../../../UBClasses/Customer.cs#L6117) |
| `UBClientSpouseAddByPlan` | [L232178](../../../../ScriptDB/000_4_CreateSP.sql#L232178) | — | 1 / 0 | — |
| `UBCompAccountApprovalDetail` | [L265430](../../../../ScriptDB/000_4_CreateSP.sql#L265430) | 1 / 1 file | 0 / 19 | [Compliance.cs:258](../../../../UBClasses/Compliance.cs#L258) |
| `UBCompAccountAssign1Doc` | [L265673](../../../../ScriptDB/000_4_CreateSP.sql#L265673) | — | 1 / 0 | — |
| `UBCompAccountAssign1DocAllPlan` | [L265777](../../../../ScriptDB/000_4_CreateSP.sql#L265777) | — | 2 / 1 | — |
| `UBCompAccountAssignDoc` | [L265818](../../../../ScriptDB/000_4_CreateSP.sql#L265818) | — | 5 / 0 | — |
| `UBCompAccountAssignDocAll` | [L265943](../../../../ScriptDB/000_4_CreateSP.sql#L265943) | — | 0 / 1 | — |
| `UBCompAccountAssignDocAll_ActivePlan` | [L265979](../../../../ScriptDB/000_4_CreateSP.sql#L265979) | — | 0 / 1 | — |
| `UBCompAccountClientDetail` | [L266016](../../../../ScriptDB/000_4_CreateSP.sql#L266016) | 1 / 1 file | 0 / 7 | [Compliance.cs:313](../../../../UBClasses/Compliance.cs#L313) |
| `UBCompAccountDocGetDefID` | [L266100](../../../../ScriptDB/000_4_CreateSP.sql#L266100) | 1 / 1 file | 0 / 0 | [Document.cs:1526](../../../../UBClasses/Document.cs#L1526) |
| `UBCompAccountDocGetReceived` | [L266127](../../../../ScriptDB/000_4_CreateSP.sql#L266127) | 1 / 1 file | 0 / 0 | [Document.cs:1414](../../../../UBClasses/Document.cs#L1414) |
| `UBCompAccountDocList` | [L266154](../../../../ScriptDB/000_4_CreateSP.sql#L266154) | 1 / 1 file | 1 / 0 | [Document.cs:1333](../../../../UBClasses/Document.cs#L1333) |
| `UBCompAccountDocRemoveAttach` | [L266234](../../../../ScriptDB/000_4_CreateSP.sql#L266234) | 1 / 1 file | 0 / 0 | [Document.cs:1629](../../../../UBClasses/Document.cs#L1629) |
| `UBCompAccountDocSetReceived` | [L266286](../../../../ScriptDB/000_4_CreateSP.sql#L266286) | 1 / 1 file | 0 / 1 | [Document.cs:1466](../../../../UBClasses/Document.cs#L1466) |
| `UBCompAccountDocSetReceivedOne` | [L266346](../../../../ScriptDB/000_4_CreateSP.sql#L266346) | — | 1 / 1 | — |
| `UBCompAccountDocUpload` | [L266429](../../../../ScriptDB/000_4_CreateSP.sql#L266429) | 1 / 1 file | 0 / 1 | [Document.cs:1574](../../../../UBClasses/Document.cs#L1574) |
| `UBCompAccountKYCUpdateApproveAll` | [L266484](../../../../ScriptDB/000_4_CreateSP.sql#L266484) | 1 / 1 file | 0 / 1 | [Compliance.cs:4006](../../../../UBClasses/Compliance.cs#L4006) |
| `UBCompAccountKYCUpdateApproveTaggedItems` | [L266865](../../../../ScriptDB/000_4_CreateSP.sql#L266865) | 1 / 1 file | 0 / 1 | [Compliance.cs:5962](../../../../UBClasses/Compliance.cs#L5962) |
| `UBCompAccountKYCUpdateCount` | [L266910](../../../../ScriptDB/000_4_CreateSP.sql#L266910) | — | 1 / 0 | — |
| `UBCompAccountKYCUpdateList` | [L266978](../../../../ScriptDB/000_4_CreateSP.sql#L266978) | 1 / 1 file | 0 / 2 | [Plan.cs:2857](../../../../UBClasses/Plan.cs#L2857) |
| `UBCompAccountKYCUpdatePendingCount` | [L267983](../../../../ScriptDB/000_4_CreateSP.sql#L267983) | 1 / 1 file | 0 / 0 | [Compliance.cs:3836](../../../../UBClasses/Compliance.cs#L3836) |
| `UBCompAccountKYCUpdateStatusInfo` | [L268337](../../../../ScriptDB/000_4_CreateSP.sql#L268337) | 1 / 1 file | 1 / 0 | [Plan.cs:2666](../../../../UBClasses/Plan.cs#L2666) |
| `UBCompAccountKYCUpdateStatusUpdate` | [L268394](../../../../ScriptDB/000_4_CreateSP.sql#L268394) | 1 / 1 file | 2 / 1 | [Plan.cs:2709](../../../../UBClasses/Plan.cs#L2709) |
| `UBCompAccountKYCUpdateStatusUpdateClient` | [L268415](../../../../ScriptDB/000_4_CreateSP.sql#L268415) | 1 / 1 file | 0 / 1 | [Plan.cs:2711](../../../../UBClasses/Plan.cs#L2711) |
| `UBCompAccountKYCUpdateStatusUpdateOne` | [L268479](../../../../ScriptDB/000_4_CreateSP.sql#L268479) | — | 3 / 3 | — |
| `UBCompAccountKYCUpdateSummary` | [L268836](../../../../ScriptDB/000_4_CreateSP.sql#L268836) | 1 / 1 file | 0 / 0 | [Plan.cs:2556](../../../../UBClasses/Plan.cs#L2556) |
| `UBCompAccountOpenComboList` | [L269215](../../../../ScriptDB/000_4_CreateSP.sql#L269215) | — | 0 / 5 | — |
| `UBCompAccountOpeningApproveAll` | [L269239](../../../../ScriptDB/000_4_CreateSP.sql#L269239) | 1 / 1 file | 0 / 1 | [Compliance.cs:3919](../../../../UBClasses/Compliance.cs#L3919) |
| `UBCompAccountOpeningApproveTaggedItems` | [L269575](../../../../ScriptDB/000_4_CreateSP.sql#L269575) | 1 / 1 file | 0 / 1 | [Compliance.cs:6017](../../../../UBClasses/Compliance.cs#L6017) |
| `UBCompAccountOpeningCount` | [L269620](../../../../ScriptDB/000_4_CreateSP.sql#L269620) | — | 1 / 0 | — |
| `UBCompAccountOpeningList` | [L269686](../../../../ScriptDB/000_4_CreateSP.sql#L269686) | 1 / 1 file | 0 / 2 | [Plan.cs:2397](../../../../UBClasses/Plan.cs#L2397) |
| `UBCompAccountOpeningPendingCount` | [L270232](../../../../ScriptDB/000_4_CreateSP.sql#L270232) | 1 / 1 file | 0 / 0 | [Compliance.cs:3755](../../../../UBClasses/Compliance.cs#L3755) |
| `UBCompAccountOpeningSearchCriteriaSave` | [L270548](../../../../ScriptDB/000_4_CreateSP.sql#L270548) | — | 1 / 1 | — |
| `UBCompAccountOpeningStatusInfo` | [L270702](../../../../ScriptDB/000_4_CreateSP.sql#L270702) | 1 / 1 file | 1 / 0 | [Plan.cs:2294](../../../../UBClasses/Plan.cs#L2294) |
| `UBCompAccountOpeningSummary` | [L270753](../../../../ScriptDB/000_4_CreateSP.sql#L270753) | 1 / 1 file | 0 / 0 | [Plan.cs:2484](../../../../UBClasses/Plan.cs#L2484) |
| `UBCompAccountOpenStatusUpdate` | [L270976](../../../../ScriptDB/000_4_CreateSP.sql#L270976) | 1 / 1 file | 1 / 1 | [Plan.cs:2335](../../../../UBClasses/Plan.cs#L2335) |
| `UBCompAccountOpenStatusUpdateOne` | [L270999](../../../../ScriptDB/000_4_CreateSP.sql#L270999) | — | 4 / 3 | — |
| `UBCompAccountUpdateSearchCriteriaSave` | [L271345](../../../../ScriptDB/000_4_CreateSP.sql#L271345) | — | 1 / 1 | — |
| `UBCompCalcPlanRiskCurrent` | [L272560](../../../../ScriptDB/000_4_CreateSP.sql#L272560) | — | 1 / 0 | — |
| `UBCompCalcPlanRiskObjCurrent` | [L272809](../../../../ScriptDB/000_4_CreateSP.sql#L272809) | — | 2 / 0 | — |
| `UBCompCheckPlanInfo` | [L275782](../../../../ScriptDB/000_4_CreateSP.sql#L275782) | — | 17 / 1 | — |
| `UBCompCheckPlanInfo1Client` | [L276047](../../../../ScriptDB/000_4_CreateSP.sql#L276047) | — | 1 / 1 | — |
| `UBCompCheckPlanInfoAll` | [L276081](../../../../ScriptDB/000_4_CreateSP.sql#L276081) | — | 0 / 1 | — |
| `UBCompDeficiencyLogPlanNew` | [L276115](../../../../ScriptDB/000_4_CreateSP.sql#L276115) | 1 / 1 file | 0 / 0 | [Compliance.cs:4957](../../../../UBClasses/Compliance.cs#L4957) |
| `UBCompDeficiencyLogPlanUpdate` | [L276280](../../../../ScriptDB/000_4_CreateSP.sql#L276280) | 1 / 1 file | 0 / 0 | [Compliance.cs:5059](../../../../UBClasses/Compliance.cs#L5059) |
| `UBCompDocRemoveDeletedDocFromPlan` | [L276740](../../../../ScriptDB/000_4_CreateSP.sql#L276740) | — | 0 / 0 | — |
| `UBCompDocRescanPlan` | [L276777](../../../../ScriptDB/000_4_CreateSP.sql#L276777) | — | 0 / 0 | — |
| `UBCompNewPlanApproveAll` | [L278039](../../../../ScriptDB/000_4_CreateSP.sql#L278039) | 1 / 1 file | 0 / 1 | [Compliance.cs:5317](../../../../UBClasses/Compliance.cs#L5317) |
| `UBCompNewPlanList` | [L278246](../../../../ScriptDB/000_4_CreateSP.sql#L278246) | 1 / 1 file | 0 / 1 | [Plan.cs:4201](../../../../UBClasses/Plan.cs#L4201) |
| `UBCompNewPlanPendingCount` | [L278675](../../../../ScriptDB/000_4_CreateSP.sql#L278675) | 1 / 1 file | 0 / 0 | [Compliance.cs:5246](../../../../UBClasses/Compliance.cs#L5246) |
| `UBCompNewPlanSummary` | [L278866](../../../../ScriptDB/000_4_CreateSP.sql#L278866) | 1 / 1 file | 0 / 0 | [Plan.cs:4284](../../../../UBClasses/Plan.cs#L4284) |
| `UBCompPlanDetail` | [L279132](../../../../ScriptDB/000_4_CreateSP.sql#L279132) | 1 / 1 file | 0 / 4 | [Compliance.cs:5191](../../../../UBClasses/Compliance.cs#L5191) |
| `UBCompPlanDocInfo` | [L279184](../../../../ScriptDB/000_4_CreateSP.sql#L279184) | — | 0 / 0 | — |
| `UBCompPlanReviewHistory` | [L279209](../../../../ScriptDB/000_4_CreateSP.sql#L279209) | — | 2 / 0 | — |
| `UBCompPlanReviewHistoryShort` | [L279358](../../../../ScriptDB/000_4_CreateSP.sql#L279358) | — | 1 / 0 | — |
| `UBCompPlanTrendComboList` | [L279466](../../../../ScriptDB/000_4_CreateSP.sql#L279466) | — | 0 / 4 | — |
| `UBCompPlanTrendRecalc` | [L279495](../../../../ScriptDB/000_4_CreateSP.sql#L279495) | — | 2 / 1 | — |
| `UBCompPlanTrendRecalcByMonth` | [L279552](../../../../ScriptDB/000_4_CreateSP.sql#L279552) | — | 4 / 1 | — |
| `UBCompPlanTrxCountAdd` | [L279650](../../../../ScriptDB/000_4_CreateSP.sql#L279650) | — | 0 / 0 | — |
| `UBCompTrend2SidedPlanID` | [L281318](../../../../ScriptDB/000_4_CreateSP.sql#L281318) | 1 / 1 file | 0 / 0 | [Compliance.cs:4241](../../../../UBClasses/Compliance.cs#L4241) |
| `UBCompTrendScanPlanAll` | [L282440](../../../../ScriptDB/000_4_CreateSP.sql#L282440) | — | 0 / 2 | — |
| `UBCompTrendScanPlanChunk` | [L282522](../../../../ScriptDB/000_4_CreateSP.sql#L282522) | 1 / 1 file | 0 / 2 | [Compliance.cs:3131](../../../../VieFUNDPdf/Compliance.cs#L3131) |
| `UBCompTrendScanPlanOne` | [L282621](../../../../ScriptDB/000_4_CreateSP.sql#L282621) | — | 2 / 1 | — |
| `UBCompTrendScanPlanOneClear` | [L282870](../../../../ScriptDB/000_4_CreateSP.sql#L282870) | — | 1 / 0 | — |
| `UBCompTrxAddPlanInfo` | [L284978](../../../../ScriptDB/000_4_CreateSP.sql#L284978) | — | 4 / 0 | — |
| `UBCompTrxPlanInfoAdd` | [L285582](../../../../ScriptDB/000_4_CreateSP.sql#L285582) | — | 2 / 0 | — |
| `UBCompTrxPlanInfoChanged` | [L285726](../../../../ScriptDB/000_4_CreateSP.sql#L285726) | — | 0 / 0 | — |
| `UBCompTrxRefreshPlanInfo` | [L285891](../../../../ScriptDB/000_4_CreateSP.sql#L285891) | — | 4 / 0 | — |
| `UBCompTrxUpdatePlanInfo` | [L292932](../../../../ScriptDB/000_4_CreateSP.sql#L292932) | — | 2 / 2 | — |
| `UBCustomerBankAccountTMPEnd` | [L295244](../../../../ScriptDB/000_4_CreateSP.sql#L295244) | — | 1 / 0 | — |
| `UBCustomerBankAccountUpdate` | [L295276](../../../../ScriptDB/000_4_CreateSP.sql#L295276) | — | 0 / 0 | — |
| `UBCustomerPlanTMPEnd` | [L295448](../../../../ScriptDB/000_4_CreateSP.sql#L295448) | — | 1 / 0 | — |
| `UBCustomerRepPlanAdd` | [L295505](../../../../ScriptDB/000_4_CreateSP.sql#L295505) | — | 19 / 0 | — |
| `UBDashBoardAsset10Plan` | [L296064](../../../../ScriptDB/000_4_CreateSP.sql#L296064) | — | 1 / 1 | — |
| `UBDashBoardAssetAccountBySupplierBranchGet` | [L296904](../../../../ScriptDB/000_4_CreateSP.sql#L296904) | 1 / 1 file | 0 / 0 | [Dashboard.cs:1102](../../../../UBClasses/Dashboard.cs#L1102) |
| `UBDashBoardAssetAccountBySupplierClientGet` | [L297091](../../../../ScriptDB/000_4_CreateSP.sql#L297091) | 1 / 1 file | 0 / 0 | [Dashboard.cs:1164](../../../../UBClasses/Dashboard.cs#L1164) |
| `UBDashBoardAssetAccountBySupplierGet` | [L297279](../../../../ScriptDB/000_4_CreateSP.sql#L297279) | 1 / 1 file | 0 / 0 | [Dashboard.cs:978](../../../../UBClasses/Dashboard.cs#L978) |
| `UBDashBoardAssetAccountBySupplierRepGet` | [L297839](../../../../ScriptDB/000_4_CreateSP.sql#L297839) | 1 / 1 file | 0 / 0 | [Dashboard.cs:1040](../../../../UBClasses/Dashboard.cs#L1040) |
| `UBDashBoardAssetAccountOneCategoryGet` | [L298023](../../../../ScriptDB/000_4_CreateSP.sql#L298023) | 1 / 1 file | 0 / 0 | [Dashboard.cs:754](../../../../UBClasses/Dashboard.cs#L754) |
| `UBDashBoardAssetAccountOneCategoryGetX` | [L298046](../../../../ScriptDB/000_4_CreateSP.sql#L298046) | — | 1 / 0 | — |
| `UBDashBoardAssetAccountOneSupplierClientGet` | [L298551](../../../../ScriptDB/000_4_CreateSP.sql#L298551) | 1 / 1 file | 0 / 0 | [Dashboard.cs:1226](../../../../UBClasses/Dashboard.cs#L1226) |
| `UBDashBoardAssetAccountSumCalc1Rep` | [L298743](../../../../ScriptDB/000_4_CreateSP.sql#L298743) | — | 4 / 0 | — |
| `UBDashBoardAssetAccountSumFix` | [L298956](../../../../ScriptDB/000_4_CreateSP.sql#L298956) | — | 1 / 1 | — |
| `UBDashBoardAssetClientOneCategoryGetWithPlan` | [L300121](../../../../ScriptDB/000_4_CreateSP.sql#L300121) | — | 0 / 1 | — |
| `UBDashBoardAssetClientOneCategoryGetXWithPlan` | [L300413](../../../../ScriptDB/000_4_CreateSP.sql#L300413) | — | 1 / 0 | — |
| `UBDashBoardAssetGet_Plan` | [L302087](../../../../ScriptDB/000_4_CreateSP.sql#L302087) | 1 / 1 file | 0 / 1 | [Dashboard.cs:2941](../../../../UBClasses/Dashboard.cs#L2941) |
| `UBDashBoardAssetGet_PlanType` | [L302110](../../../../ScriptDB/000_4_CreateSP.sql#L302110) | — | 0 / 1 | — |
| `UBDashBoardAssetGet_PlanType_Old` | [L302133](../../../../ScriptDB/000_4_CreateSP.sql#L302133) | — | 0 / 0 | — |
| `UBDashBoardAssetGet_PlanTypeX` | [L302333](../../../../ScriptDB/000_4_CreateSP.sql#L302333) | — | 2 / 1 | — |
| `UBDashBoardAssetGet_PlanX` | [L302593](../../../../ScriptDB/000_4_CreateSP.sql#L302593) | — | 1 / 0 | — |
| `UBDashBoardAssetOneCashAccount` | [L303847](../../../../ScriptDB/000_4_CreateSP.sql#L303847) | — | 1 / 0 | — |
| `UBDashBoardAssetOnePlan` | [L304235](../../../../ScriptDB/000_4_CreateSP.sql#L304235) | — | 3 / 3 | — |
| `UBDashBoardAssetPlanOneCategoryGet` | [L304419](../../../../ScriptDB/000_4_CreateSP.sql#L304419) | 1 / 1 file | 0 / 1 | [Dashboard.cs:672](../../../../UBClasses/Dashboard.cs#L672) |
| `UBDashBoardAssetPlanOneCategoryGetX` | [L304442](../../../../ScriptDB/000_4_CreateSP.sql#L304442) | — | 2 / 0 | — |
| `UBDashBoardAssetPlanSumCalc1Rep` | [L304731](../../../../ScriptDB/000_4_CreateSP.sql#L304731) | — | 1 / 0 | — |
| `UBDashBoardPlanCreatedDateGet` | [L306865](../../../../ScriptDB/000_4_CreateSP.sql#L306865) | 1 / 1 file | 0 / 0 | [Dashboard.cs:1771](../../../../UBClasses/Dashboard.cs#L1771) |
| `UBDashBoardPlanReviewDateDetailGet` | [L307012](../../../../ScriptDB/000_4_CreateSP.sql#L307012) | 1 / 1 file | 0 / 0 | [Dashboard.cs:1621](../../../../UBClasses/Dashboard.cs#L1621) |
| `UBDashBoardPlanReviewDateGet` | [L307349](../../../../ScriptDB/000_4_CreateSP.sql#L307349) | 1 / 1 file | 0 / 0 | [Dashboard.cs:446](../../../../UBClasses/Dashboard.cs#L446) |
| `UBDealerBAccountAdd` | [L307742](../../../../ScriptDB/000_4_CreateSP.sql#L307742) | 1 / 1 file | 1 / 1 | [BankAccount.cs:906](../../../../UBClasses/BankAccount.cs#L906) |
| `UBDealerBAccountList` | [L307838](../../../../ScriptDB/000_4_CreateSP.sql#L307838) | 3 / 1 file | 1 / 0 | [BankAccount.cs:75](../../../../UBClasses/BankAccount.cs#L75) |
| `UBDealerBAccountRemove` | [L308109](../../../../ScriptDB/000_4_CreateSP.sql#L308109) | 1 / 1 file | 0 / 0 | [BankAccount.cs:989](../../../../UBClasses/BankAccount.cs#L989) |
| `UBDealerBAccountSet` | [L308153](../../../../ScriptDB/000_4_CreateSP.sql#L308153) | 1 / 1 file | 2 / 0 | [BankAccount.cs:731](../../../../UBClasses/BankAccount.cs#L731) |
| `UBDealerBAccountSetEFTSequence` | [L308277](../../../../ScriptDB/000_4_CreateSP.sql#L308277) | — | 3 / 0 | — |
| `UBDealerBAccountSupplier` | [L308311](../../../../ScriptDB/000_4_CreateSP.sql#L308311) | 1 / 1 file | 0 / 1 | [BankAccount.cs:685](../../../../UBClasses/BankAccount.cs#L685) |
| `UBDealerBAccountUpdate` | [L308326](../../../../ScriptDB/000_4_CreateSP.sql#L308326) | 1 / 1 file | 0 / 1 | [BankAccount.cs:906](../../../../UBClasses/BankAccount.cs#L906) |
| `UBDealerTrustBAccountListByPlanID` | [L310662](../../../../ScriptDB/000_4_CreateSP.sql#L310662) | 1 / 1 file | 0 / 0 | [BankAccount.cs:420](../../../../UBClasses/BankAccount.cs#L420) |
| `UBDocAddTaggedPlan` | [L312313](../../../../ScriptDB/000_4_CreateSP.sql#L312313) | — | 0 / 2 | — |
| `UBDocumentDetachFromPlansOrTrx` | [L314481](../../../../ScriptDB/000_4_CreateSP.sql#L314481) | 1 / 1 file | 0 / 0 | [Document.cs:4369](../../../../UBClasses/Document.cs#L4369) |
| `UBDocumentMove2TaggedPlanOrTrx` | [L314555](../../../../ScriptDB/000_4_CreateSP.sql#L314555) | 1 / 1 file | 0 / 1 | [Document.cs:4314](../../../../UBClasses/Document.cs#L4314) |
| `UBEnvelopeMove2TaggedPlan` | [L320207](../../../../ScriptDB/000_4_CreateSP.sql#L320207) | 1 / 1 file | 0 / 1 | [Document.cs:4468](../../../../UBClasses/Document.cs#L4468) |
| `UBExportCashCleanup` | [L322818](../../../../ScriptDB/000_4_CreateSP.sql#L322818) | — | 3 / 0 | — |
| `UBExportCashDealerList` | [L322864](../../../../ScriptDB/000_4_CreateSP.sql#L322864) | — | 0 / 0 | — |
| `UBExportCashOneDealerAcc` | [L322947](../../../../ScriptDB/000_4_CreateSP.sql#L322947) | — | 0 / 0 | — |
| `UBExportCashOneDealerTrx` | [L323321](../../../../ScriptDB/000_4_CreateSP.sql#L323321) | — | 0 / 0 | — |
| `UBFFRecAEAccountList` | [L343549](../../../../ScriptDB/000_4_CreateSP.sql#L343549) | 1 / 1 file | 0 / 0 | [CAE.cs:211](../../../../UBFFImport/CAE.cs#L211) |
| `UBFFRecAEProcessOneAccount` | [L343744](../../../../ScriptDB/000_4_CreateSP.sql#L343744) | 1 / 1 file | 0 / 1 | [CAE.cs:256](../../../../UBFFImport/CAE.cs#L256) |
| `UBFFRecATProcessCWTCash` | [L345278](../../../../ScriptDB/000_4_CreateSP.sql#L345278) | — | 1 / 1 | — |
| `UBFFRecATUpdateAccount` | [L346499](../../../../ScriptDB/000_4_CreateSP.sql#L346499) | — | 2 / 0 | — |
| `UBFFRecATUpdateAccountPos` | [L346542](../../../../ScriptDB/000_4_CreateSP.sql#L346542) | — | 15 / 0 | — |
| `UBFFRecATUpdatePlan` | [L346623](../../../../ScriptDB/000_4_CreateSP.sql#L346623) | — | 2 / 0 | — |
| `UBFSErrorNSPAccountList` | [L360555](../../../../ScriptDB/000_4_CreateSP.sql#L360555) | — | 0 / 0 | — |
| `UBFSPlanAdd` | [L360959](../../../../ScriptDB/000_4_CreateSP.sql#L360959) | — | 2 / 1 | — |
| `UBGenerateAccountNumber` | [L403695](../../../../ScriptDB/000_4_CreateSP.sql#L403695) | — | 6 / 0 | — |
| `UBGeneratePlanID` | [L403767](../../../../ScriptDB/000_4_CreateSP.sql#L403767) | — | 1 / 1 | — |
| `UBGeneratePlanID1912` | [L403884](../../../../ScriptDB/000_4_CreateSP.sql#L403884) | — | 1 / 1 | — |
| `UBGeneratePlanIDX` | [L403956](../../../../ScriptDB/000_4_CreateSP.sql#L403956) | — | 7 / 2 | — |
| `UBGetPlanClientNames` | [L404207](../../../../ScriptDB/000_4_CreateSP.sql#L404207) | — | 0 / 0 | — |
| `UBGetPlanCompensation` | [L404243](../../../../ScriptDB/000_4_CreateSP.sql#L404243) | — | 1 / 1 | — |
| `UBGetPlanMKV` | [L404584](../../../../ScriptDB/000_4_CreateSP.sql#L404584) | — | 1 / 0 | — |
| `UBGetRRSPDates` | [L404827](../../../../ScriptDB/000_4_CreateSP.sql#L404827) | — | 1 / 0 | — |
| `UBIntermediaryInfoByPlanID` | [L426110](../../../../ScriptDB/000_4_CreateSP.sql#L426110) | — | 0 / 1 | — |
| `UBLoanMove2Plan` | [L436957](../../../../ScriptDB/000_4_CreateSP.sql#L436957) | — | 0 / 0 | — |
| `UBLoanPlanID` | [L436992](../../../../ScriptDB/000_4_CreateSP.sql#L436992) | — | 0 / 0 | — |
| `UBLSFileFix1Account` | [L438055](../../../../ScriptDB/000_4_CreateSP.sql#L438055) | — | 1 / 0 | — |
| `UBMemberBankAccountTMPEnd` | [L439721](../../../../ScriptDB/000_4_CreateSP.sql#L439721) | — | 1 / 0 | — |
| `UBMerge2ClientNamePlans` | [L447324](../../../../ScriptDB/000_4_CreateSP.sql#L447324) | — | 1 / 1 | — |
| `UBMergeClientNamePlans` | [L447556](../../../../ScriptDB/000_4_CreateSP.sql#L447556) | — | 0 / 1 | — |
| `UBMFInfoSysPlan` | [L448240](../../../../ScriptDB/000_4_CreateSP.sql#L448240) | 2 / 2 file | 0 / 0 | [SysPlan.cs:1408](../../../../UBClasses/SysPlan.cs#L1408) |
| `UBMFInfoSysPlanDetail` | [L448490](../../../../ScriptDB/000_4_CreateSP.sql#L448490) | — | 0 / 0 | — |
| `UBNomineeIncomePlanID` | [L453955](../../../../ScriptDB/000_4_CreateSP.sql#L453955) | — | 0 / 0 | — |
| `UBNoteAddTaggedPlan` | [L454460](../../../../ScriptDB/000_4_CreateSP.sql#L454460) | — | 0 / 1 | — |
| `UBOrderSetMsgResponse` | [L477632](../../../../ScriptDB/000_4_CreateSP.sql#L477632) | 1 / 1 file | 0 / 0 | [FFImport.cs:3860](../../../../UBFFImport/FFImport.cs#L3860) |
| `UBPerformanceOnePlan` | [L481753](../../../../ScriptDB/000_4_CreateSP.sql#L481753) | — | 1 / 5 | — |
| `UBPlanAARemove` | [L483789](../../../../ScriptDB/000_4_CreateSP.sql#L483789) | — | 0 / 0 | — |
| `UBPlanAAUpdate` | [L483818](../../../../ScriptDB/000_4_CreateSP.sql#L483818) | — | 6 / 0 | — |
| `UBPlanAccList` | [L483865](../../../../ScriptDB/000_4_CreateSP.sql#L483865) | 1 / 1 file | 0 / 1 | [FundAccount.cs:180](../../../../UBClasses/FundAccount.cs#L180) |
| `UBPlanAccountList` | [L483940](../../../../ScriptDB/000_4_CreateSP.sql#L483940) | 1 / 1 file | 1 / 3 | [Plan.cs:3266](../../../../UBClasses/Plan.cs#L3266) |
| `UBPlanAccountListX` | [L483967](../../../../ScriptDB/000_4_CreateSP.sql#L483967) | — | 0 / 0 | — |
| `UBPlanActivate` | [L484125](../../../../ScriptDB/000_4_CreateSP.sql#L484125) | — | 0 / 5 | — |
| `UBPlanAdd` | [L484219](../../../../ScriptDB/000_4_CreateSP.sql#L484219) | 1 / 1 file | 0 / 23 | [Plan.cs:938](../../../../UBClasses/Plan.cs#L938) |
| `UBPlanAnnuitantOwnerUpdate` | [L484943](../../../../ScriptDB/000_4_CreateSP.sql#L484943) | 1 / 1 file | 0 / 0 | [Plan.cs:3049](../../../../UBClasses/Plan.cs#L3049) |
| `UBPlanApprovalStatusHistorySave` | [L484970](../../../../ScriptDB/000_4_CreateSP.sql#L484970) | — | 2 / 0 | — |
| `UBPlanAssetAllocationList` | [L485069](../../../../ScriptDB/000_4_CreateSP.sql#L485069) | — | 1 / 0 | — |
| `UBPlanAssetAndRiskAdditionClear` | [L485280](../../../../ScriptDB/000_4_CreateSP.sql#L485280) | 1 / 1 file | 0 / 0 | [Plan.cs:5340](../../../../UBClasses/Plan.cs#L5340) |
| `UBPlanAssetAndRiskAdditionUpdate` | [L485298](../../../../ScriptDB/000_4_CreateSP.sql#L485298) | 1 / 1 file | 0 / 0 | [Plan.cs:5295](../../../../UBClasses/Plan.cs#L5295) |
| `UBPlanAssetAndRiskAssessmentSet` | [L485369](../../../../ScriptDB/000_4_CreateSP.sql#L485369) | 2 / 2 file | 0 / 3 | [Plan.cs:5242](../../../../UBClasses/Plan.cs#L5242) |
| `UBPlanAssetAndRiskListCurrent` | [L486351](../../../../ScriptDB/000_4_CreateSP.sql#L486351) | — | 4 / 0 | — |
| `UBPlanAvailableCashInfo` | [L487239](../../../../ScriptDB/000_4_CreateSP.sql#L487239) | 1 / 1 file | 0 / 0 | [CashAccount.cs:38](../../../../UBClasses/CashAccount.cs#L38) |
| `UBPlanBankListDropdown` | [L487314](../../../../ScriptDB/000_4_CreateSP.sql#L487314) | — | 5 / 0 | — |
| `UBPlanBenConAdd` | [L487375](../../../../ScriptDB/000_4_CreateSP.sql#L487375) | — | 0 / 4 | — |
| `UBPlanBenConInfo` | [L487463](../../../../ScriptDB/000_4_CreateSP.sql#L487463) | 2 / 2 file | 0 / 0 | [PanelPlanBenAdd.aspx.cs:1342](../../../../WebApp/Main/PanelPlanBenAdd.aspx.cs#L1342) |
| `UBPlanBenConList` | [L487504](../../../../ScriptDB/000_4_CreateSP.sql#L487504) | 1 / 1 file | 0 / 0 | [Plan.cs:619](../../../../UBClasses/Plan.cs#L619) |
| `UBPlanBenConRemove` | [L487541](../../../../ScriptDB/000_4_CreateSP.sql#L487541) | — | 0 / 0 | — |
| `UBPlanBenConUpdate` | [L487568](../../../../ScriptDB/000_4_CreateSP.sql#L487568) | — | 0 / 7 | — |
| `UBPlanBenListByRecordType` | [L487665](../../../../ScriptDB/000_4_CreateSP.sql#L487665) | 1 / 1 file | 0 / 0 | [Plan.cs:4864](../../../../UBClasses/Plan.cs#L4864) |
| `UBPlanBenPrimaryCaregiverList` | [L487694](../../../../ScriptDB/000_4_CreateSP.sql#L487694) | — | 0 / 0 | — |
| `UBPlanBenTMPEnd` | [L487709](../../../../ScriptDB/000_4_CreateSP.sql#L487709) | — | 1 / 0 | — |
| `UBPlanCannexOrderCheckPermission` | [L487735](../../../../ScriptDB/000_4_CreateSP.sql#L487735) | 1 / 1 file | 0 / 0 | [Plan.cs:4970](../../../../UBClasses/Plan.cs#L4970) |
| `UBPlanClientList` | [L487795](../../../../ScriptDB/000_4_CreateSP.sql#L487795) | 1 / 1 file | 0 / 0 | [Plan.cs:2243](../../../../UBClasses/Plan.cs#L2243) |
| `UBPlanCopy` | [L487859](../../../../ScriptDB/000_4_CreateSP.sql#L487859) | — | 2 / 0 | — |
| `UBPlanCopyRRIF` | [L488021](../../../../ScriptDB/000_4_CreateSP.sql#L488021) | — | 1 / 0 | — |
| `UBPlanCount4T3GR` | [L488080](../../../../ScriptDB/000_4_CreateSP.sql#L488080) | — | 0 / 1 | — |
| `UBPlanDefVal4Add` | [L488225](../../../../ScriptDB/000_4_CreateSP.sql#L488225) | 1 / 1 file | 0 / 0 | [Plan.cs:2621](../../../../UBClasses/Plan.cs#L2621) |
| `UBPlanDelete` | [L488265](../../../../ScriptDB/000_4_CreateSP.sql#L488265) | 1 / 1 file | 1 / 1 | [Plan.cs:1057](../../../../UBClasses/Plan.cs#L1057) |
| `UBPlanDesignationList` | [L488336](../../../../ScriptDB/000_4_CreateSP.sql#L488336) | — | 19 / 0 | — |
| `UBPlanDuplicate` | [L488385](../../../../ScriptDB/000_4_CreateSP.sql#L488385) | — | 1 / 3 | — |
| `UBPlanEditComboList` | [L488449](../../../../ScriptDB/000_4_CreateSP.sql#L488449) | — | 0 / 27 | — |
| `UBPlanEditComboList1` | [L488532](../../../../ScriptDB/000_4_CreateSP.sql#L488532) | — | 0 / 2 | — |
| `UBPlanEditComboList2` | [L488563](../../../../ScriptDB/000_4_CreateSP.sql#L488563) | — | 0 / 1 | — |
| `UBPlanFinInfoAddTBD` | [L489772](../../../../ScriptDB/000_4_CreateSP.sql#L489772) | — | 0 / 1 | — |
| `UBPlanFreezeExpiredKYC` | [L489814](../../../../ScriptDB/000_4_CreateSP.sql#L489814) | — | 0 / 1 | — |
| `UBPlanFreezeOne` | [L489909](../../../../ScriptDB/000_4_CreateSP.sql#L489909) | — | 14 / 3 | — |
| `UBPlanGroupList` | [L490561](../../../../ScriptDB/000_4_CreateSP.sql#L490561) | — | 1 / 0 | — |
| `UBPlanInActivate` | [L490591](../../../../ScriptDB/000_4_CreateSP.sql#L490591) | — | 1 / 6 | — |
| `UBPlanIncomeCalcAll` | [L490663](../../../../ScriptDB/000_4_CreateSP.sql#L490663) | — | 0 / 1 | — |
| `UBPlanInfo` | [L490727](../../../../ScriptDB/000_4_CreateSP.sql#L490727) | 1 / 1 file | 0 / 17 | [Customer.cs:1187](../../../../UBClasses/Customer.cs#L1187) |
| `UBPlanInfo2` | [L490957](../../../../ScriptDB/000_4_CreateSP.sql#L490957) | 2 / 1 file | 0 / 0 | [Plan.cs:1397](../../../../UBClasses/Plan.cs#L1397) |
| `UBPlanInfo2IDs` | [L491015](../../../../ScriptDB/000_4_CreateSP.sql#L491015) | 1 / 1 file | 0 / 0 | [Plan.cs:1449](../../../../UBClasses/Plan.cs#L1449) |
| `UBPlanInfo3rdParty` | [L491055](../../../../ScriptDB/000_4_CreateSP.sql#L491055) | 1 / 1 file | 0 / 0 | [Plan.cs:388](../../../../UBClasses/Plan.cs#L388) |
| `UBPlanInfo3rdPartyList` | [L491146](../../../../ScriptDB/000_4_CreateSP.sql#L491146) | — | 1 / 0 | — |
| `UBPlanInfo4Header` | [L491181](../../../../ScriptDB/000_4_CreateSP.sql#L491181) | 1 / 1 file | 0 / 0 | [Plan.cs:215](../../../../UBClasses/Plan.cs#L215) |
| `UBPlanInfoBank` | [L491217](../../../../ScriptDB/000_4_CreateSP.sql#L491217) | 2 / 2 file | 1 / 1 | [BankAccount.cs:1347](../../../../UBClasses/BankAccount.cs#L1347) |
| `UBPlanInfoBankList` | [L491342](../../../../ScriptDB/000_4_CreateSP.sql#L491342) | 3 / 1 file | 0 / 0 | [BankAccount.cs:1063](../../../../UBClasses/BankAccount.cs#L1063) |
| `UBPlanInfoBankListTMP` | [L491432](../../../../ScriptDB/000_4_CreateSP.sql#L491432) | — | 0 / 0 | — |
| `UBPlanInfoBankTMP` | [L491501](../../../../ScriptDB/000_4_CreateSP.sql#L491501) | 1 / 1 file | 0 / 0 | [PanelPlanBankAdd.aspx.cs:66](../../../../WebApp/Main/PanelPlanBankAdd.aspx.cs#L66) |
| `UBPlanInfoBen` | [L491543](../../../../ScriptDB/000_4_CreateSP.sql#L491543) | — | 0 / 0 | — |
| `UBPlanInfoBenEdit` | [L491618](../../../../ScriptDB/000_4_CreateSP.sql#L491618) | 2 / 2 file | 0 / 0 | [PanelPlanBenAdd.aspx.cs:94](../../../../WebApp/Main/PanelPlanBenAdd.aspx.cs#L94) |
| `UBPlanInfoBenList` | [L491694](../../../../ScriptDB/000_4_CreateSP.sql#L491694) | 2 / 1 file | 1 / 0 | [Plan.cs:546](../../../../UBClasses/Plan.cs#L546) |
| `UBPlanInfoBenListShort` | [L491781](../../../../ScriptDB/000_4_CreateSP.sql#L491781) | — | 0 / 0 | — |
| `UBPlanInfoExtra` | [L491834](../../../../ScriptDB/000_4_CreateSP.sql#L491834) | — | 2 / 0 | — |
| `UBPlanInfoInvestment` | [L491899](../../../../ScriptDB/000_4_CreateSP.sql#L491899) | — | 2 / 0 | — |
| `UBPlanInfoInvestmentAdd` | [L492046](../../../../ScriptDB/000_4_CreateSP.sql#L492046) | — | 2 / 5 | — |
| `UBPlanInfoInvestmentAddTMP` | [L492311](../../../../ScriptDB/000_4_CreateSP.sql#L492311) | — | 0 / 0 | — |
| `UBPlanInfoInvestmentAuditTrailCheck` | [L492467](../../../../ScriptDB/000_4_CreateSP.sql#L492467) | — | 1 / 1 | — |
| `UBPlanInfoInvestmentTMP` | [L492502](../../../../ScriptDB/000_4_CreateSP.sql#L492502) | — | 0 / 0 | — |
| `UBPlanInfoJoint` | [L492533](../../../../ScriptDB/000_4_CreateSP.sql#L492533) | — | 2 / 0 | — |
| `UBPlanInfoJointList` | [L492641](../../../../ScriptDB/000_4_CreateSP.sql#L492641) | 1 / 1 file | 0 / 0 | [Plan.cs:828](../../../../UBClasses/Plan.cs#L828) |
| `UBPlanInfoQuestionair` | [L492684](../../../../ScriptDB/000_4_CreateSP.sql#L492684) | 1 / 1 file | 2 / 0 | [Questionair.cs:256](../../../../UBClasses/Questionair.cs#L256) |
| `UBPlanInfoQuestionairAdd` | [L492762](../../../../ScriptDB/000_4_CreateSP.sql#L492762) | — | 2 / 1 | — |
| `UBPlanInfoQuestionairAddTMP` | [L492841](../../../../ScriptDB/000_4_CreateSP.sql#L492841) | — | 0 / 0 | — |
| `UBPlanInfoSpousal` | [L492931](../../../../ScriptDB/000_4_CreateSP.sql#L492931) | — | 4 / 0 | — |
| `UBPlanInfoThirdPartyEdit` | [L492986](../../../../ScriptDB/000_4_CreateSP.sql#L492986) | 1 / 1 file | 0 / 0 | [PanelPlan3rdPartyAdd.aspx.cs:67](../../../../WebApp/Main/PanelPlan3rdPartyAdd.aspx.cs#L67) |
| `UBPlanInfoTransferFrom` | [L493039](../../../../ScriptDB/000_4_CreateSP.sql#L493039) | 1 / 1 file | 0 / 0 | [Plan.cs:1326](../../../../UBClasses/Plan.cs#L1326) |
| `UBPlanInfoTrust` | [L493099](../../../../ScriptDB/000_4_CreateSP.sql#L493099) | — | 1 / 0 | — |
| `UBPlanInfoTrustEdit` | [L493132](../../../../ScriptDB/000_4_CreateSP.sql#L493132) | 2 / 2 file | 0 / 1 | [ClientInTrust.aspx.cs:107](../../../../WebApp/Main/ClientInTrust.aspx.cs#L107) |
| `UBPlanInfoTrustList` | [L493180](../../../../ScriptDB/000_4_CreateSP.sql#L493180) | 2 / 1 file | 0 / 0 | [Plan.cs:159](../../../../UBClasses/Plan.cs#L159) |
| `UBPlanInfoTrustTMP` | [L493256](../../../../ScriptDB/000_4_CreateSP.sql#L493256) | — | 0 / 0 | — |
| `UBPlanInfoType` | [L493290](../../../../ScriptDB/000_4_CreateSP.sql#L493290) | 1 / 1 file | 0 / 0 | [Plan.cs:108](../../../../UBClasses/Plan.cs#L108) |
| `UBPlanInfoUD` | [L493331](../../../../ScriptDB/000_4_CreateSP.sql#L493331) | 1 / 1 file | 1 / 0 | [UserDefinedField.cs:125](../../../../UBClasses/UserDefinedField.cs#L125) |
| `UBPlanInfoUDAdd` | [L493386](../../../../ScriptDB/000_4_CreateSP.sql#L493386) | — | 2 / 1 | — |
| `UBPlanInfoUDAddTMP` | [L493468](../../../../ScriptDB/000_4_CreateSP.sql#L493468) | — | 0 / 0 | — |
| `UBPlanInTrustAdd` | [L493530](../../../../ScriptDB/000_4_CreateSP.sql#L493530) | — | 3 / 2 | — |
| `UBPlanInTrustTMPEnd` | [L493577](../../../../ScriptDB/000_4_CreateSP.sql#L493577) | — | 1 / 0 | — |
| `UBPlanInvestInfoTMPEnd` | [L493606](../../../../ScriptDB/000_4_CreateSP.sql#L493606) | — | 1 / 0 | — |
| `UBPlanJointSignatureList` | [L493635](../../../../ScriptDB/000_4_CreateSP.sql#L493635) | — | 1 / 0 | — |
| `UBPlanJointSwapRole` | [L493665](../../../../ScriptDB/000_4_CreateSP.sql#L493665) | 1 / 1 file | 0 / 1 | [Plan.cs:4144](../../../../UBClasses/Plan.cs#L4144) |
| `UBPlanJointTypeList` | [L493726](../../../../ScriptDB/000_4_CreateSP.sql#L493726) | — | 1 / 0 | — |
| `UBPlanKYCUpdateAdd` | [L493756](../../../../ScriptDB/000_4_CreateSP.sql#L493756) | — | 1 / 0 | — |
| `UBPlanKYCX` | [L493916](../../../../ScriptDB/000_4_CreateSP.sql#L493916) | — | 0 / 1 | — |
| `UBPlanListTransferFrom` | [L494179](../../../../ScriptDB/000_4_CreateSP.sql#L494179) | 1 / 1 file | 0 / 0 | [Plan.cs:1243](../../../../UBClasses/Plan.cs#L1243) |
| `UBPlanMFList` | [L494372](../../../../ScriptDB/000_4_CreateSP.sql#L494372) | 2 / 2 file | 0 / 0 | [Customer.cs:1248](../../../../UBClasses/Customer.cs#L1248) |
| `UBPlanMFList2` | [L494539](../../../../ScriptDB/000_4_CreateSP.sql#L494539) | — | 1 / 0 | — |
| `UBPlanMFList4PYMT` | [L494587](../../../../ScriptDB/000_4_CreateSP.sql#L494587) | — | 1 / 0 | — |
| `UBPlanMFListSwitchFrom` | [L494642](../../../../ScriptDB/000_4_CreateSP.sql#L494642) | — | 0 / 0 | — |
| `UBPlanMFListSwitchTo` | [L494707](../../../../ScriptDB/000_4_CreateSP.sql#L494707) | 1 / 1 file | 0 / 0 | [FundAccount.cs:528](../../../../UBClasses/FundAccount.cs#L528) |
| `UBPlanMKVCurrentX` | [L495035](../../../../ScriptDB/000_4_CreateSP.sql#L495035) | — | 0 / 0 | — |
| `UBPlanMKVCurrentXX` | [L495180](../../../../ScriptDB/000_4_CreateSP.sql#L495180) | — | 1 / 0 | — |
| `UBPlanMove2AnotherClientID` | [L495329](../../../../ScriptDB/000_4_CreateSP.sql#L495329) | 1 / 1 file | 1 / 0 | [Plan.cs:3317](../../../../UBClasses/Plan.cs#L3317) |
| `UBPlanNetInvested` | [L495379](../../../../ScriptDB/000_4_CreateSP.sql#L495379) | — | 1 / 1 | — |
| `UBPlanNetWorthList` | [L495439](../../../../ScriptDB/000_4_CreateSP.sql#L495439) | — | 6 / 0 | — |
| `UBPlanNewBankInfoAdd` | [L495469](../../../../ScriptDB/000_4_CreateSP.sql#L495469) | — | 0 / 2 | — |
| `UBPlanNewBankInfoRemove` | [L495571](../../../../ScriptDB/000_4_CreateSP.sql#L495571) | 1 / 1 file | 0 / 1 | [PanelPlanBankAdd.aspx.cs:399](../../../../WebApp/Main/PanelPlanBankAdd.aspx.cs#L399) |
| `UBPlanNewBankInfoUpdate` | [L495619](../../../../ScriptDB/000_4_CreateSP.sql#L495619) | — | 0 / 2 | — |
| `UBPlanNewBenInfoAdd` | [L495706](../../../../ScriptDB/000_4_CreateSP.sql#L495706) | — | 0 / 5 | — |
| `UBPlanNewBenInfoRemove` | [L495933](../../../../ScriptDB/000_4_CreateSP.sql#L495933) | 2 / 2 file | 0 / 1 | [PanelPlanBenAdd.aspx.cs:765](../../../../WebApp/Main/PanelPlanBenAdd.aspx.cs#L765) |
| `UBPlanNewBenInfoUpdate` | [L495996](../../../../ScriptDB/000_4_CreateSP.sql#L495996) | — | 0 / 8 | — |
| `UBPlanNewJointInfoAdd` | [L496225](../../../../ScriptDB/000_4_CreateSP.sql#L496225) | — | 0 / 0 | — |
| `UBPlanNewJointInfoRemove` | [L496319](../../../../ScriptDB/000_4_CreateSP.sql#L496319) | 1 / 1 file | 0 / 0 | [PopupPlanAdd.aspx.cs:2056](../../../../WebApp/Main/PopupPlanAdd.aspx.cs#L2056) |
| `UBPlanNewThirdPartyInfoAdd` | [L496360](../../../../ScriptDB/000_4_CreateSP.sql#L496360) | — | 2 / 5 | — |
| `UBPlanNewThirdPartyInfoRemove` | [L496467](../../../../ScriptDB/000_4_CreateSP.sql#L496467) | 1 / 1 file | 0 / 1 | [PanelPlan3rdPartyAdd.aspx.cs:326](../../../../WebApp/Main/PanelPlan3rdPartyAdd.aspx.cs#L326) |
| `UBPlanNewThirdPartyInfoUpdate` | [L496509](../../../../ScriptDB/000_4_CreateSP.sql#L496509) | — | 0 / 7 | — |
| `UBPlanNewTrustInfoAdd` | [L496604](../../../../ScriptDB/000_4_CreateSP.sql#L496604) | — | 0 / 4 | — |
| `UBPlanNewTrustInfoRemove` | [L496713](../../../../ScriptDB/000_4_CreateSP.sql#L496713) | 2 / 2 file | 1 / 1 | [ClientInTrust.aspx.cs:337](../../../../WebApp/Main/ClientInTrust.aspx.cs#L337) |
| `UBPlanNewTrustInfoUpdate` | [L496761](../../../../ScriptDB/000_4_CreateSP.sql#L496761) | — | 0 / 7 | — |
| `UBPlanNomineeRoRCalc` | [L496871](../../../../ScriptDB/000_4_CreateSP.sql#L496871) | — | 17 / 2 | — |
| `UBPlanOmnibusPlanUpdate` | [L497430](../../../../ScriptDB/000_4_CreateSP.sql#L497430) | 1 / 1 file | 0 / 0 | [Plan.cs:4344](../../../../UBClasses/Plan.cs#L4344) |
| `UBPlanPieChartX` | [L497452](../../../../ScriptDB/000_4_CreateSP.sql#L497452) | — | 0 / 0 | — |
| `UBPlanPrimaryObjList` | [L497652](../../../../ScriptDB/000_4_CreateSP.sql#L497652) | — | 11 / 0 | — |
| `UBPlanQuestionairTMPEnd` | [L497689](../../../../ScriptDB/000_4_CreateSP.sql#L497689) | — | 1 / 0 | — |
| `UBPlanQuestionCopy` | [L497718](../../../../ScriptDB/000_4_CreateSP.sql#L497718) | — | 0 / 0 | — |
| `UBPlanQuestionUpdate` | [L497768](../../../../ScriptDB/000_4_CreateSP.sql#L497768) | — | 1 / 0 | — |
| `UBPlanRDSPRelList` | [L497803](../../../../ScriptDB/000_4_CreateSP.sql#L497803) | — | 3 / 0 | — |
| `UBPlanRDSPRelUpdate` | [L497833](../../../../ScriptDB/000_4_CreateSP.sql#L497833) | 1 / 1 file | 0 / 0 | [Plan.cs:3158](../../../../UBClasses/Plan.cs#L3158) |
| `UBPlanRecipientCodeList` | [L497859](../../../../ScriptDB/000_4_CreateSP.sql#L497859) | — | 5 / 0 | — |
| `UBPlanRedemptionAdd` | [L497898](../../../../ScriptDB/000_4_CreateSP.sql#L497898) | 1 / 1 file | 0 / 1 | [Plan.cs:3901](../../../../UBClasses/Plan.cs#L3901) |
| `UBPlanRedemptionInfo` | [L497991](../../../../ScriptDB/000_4_CreateSP.sql#L497991) | 1 / 1 file | 1 / 5 | [Plan.cs:3846](../../../../UBClasses/Plan.cs#L3846) |
| `UBPlanRedemptionList` | [L498429](../../../../ScriptDB/000_4_CreateSP.sql#L498429) | 1 / 1 file | 0 / 0 | [Plan.cs:3959](../../../../UBClasses/Plan.cs#L3959) |
| `UBPlanRedemptionRemove` | [L498478](../../../../ScriptDB/000_4_CreateSP.sql#L498478) | 1 / 1 file | 0 / 0 | [Plan.cs:4005](../../../../UBClasses/Plan.cs#L4005) |
| `UBPlanRepChangeCustomer` | [L498526](../../../../ScriptDB/000_4_CreateSP.sql#L498526) | — | 1 / 1 | — |
| `UBPlanRepChangeSpouse_2BD` | [L498571](../../../../ScriptDB/000_4_CreateSP.sql#L498571) | — | 0 / 0 | — |
| `UBPlanRESPSiblingFlagUpdate` | [L498598](../../../../ScriptDB/000_4_CreateSP.sql#L498598) | 1 / 1 file | 0 / 0 | [Plan.cs:3103](../../../../UBClasses/Plan.cs#L3103) |
| `UBPlanRiskCalcOne` | [L498616](../../../../ScriptDB/000_4_CreateSP.sql#L498616) | — | 15 / 0 | — |
| `UBPlanRiskDefList` | [L498744](../../../../ScriptDB/000_4_CreateSP.sql#L498744) | — | 2 / 0 | — |
| `UBPlanRiskListCurrent` | [L498788](../../../../ScriptDB/000_4_CreateSP.sql#L498788) | — | 0 / 0 | — |
| `UBPlanRRIFPlanID` | [L498919](../../../../ScriptDB/000_4_CreateSP.sql#L498919) | — | 0 / 0 | — |
| `UBPlanRRIFSearch` | [L498943](../../../../ScriptDB/000_4_CreateSP.sql#L498943) | 1 / 1 file | 0 / 1 | [RRIFSetting.cs:1551](../../../../UBClasses/RRIFSetting.cs#L1551) |
| `UBPlanSelectionUpdate` | [L499249](../../../../ScriptDB/000_4_CreateSP.sql#L499249) | — | 0 / 0 | — |
| `UBPlanSetKYCReviewCheck` | [L499292](../../../../ScriptDB/000_4_CreateSP.sql#L499292) | — | 1 / 0 | — |
| `UBPlanSetKYCReviewCheckAll` | [L499329](../../../../ScriptDB/000_4_CreateSP.sql#L499329) | — | 0 / 1 | — |
| `UBPlanSetLastReviewDate` | [L499366](../../../../ScriptDB/000_4_CreateSP.sql#L499366) | — | 0 / 2 | — |
| `UBPlanSetLastReviewDate_BOT` | [L499456](../../../../ScriptDB/000_4_CreateSP.sql#L499456) | — | 0 / 2 | — |
| `UBPlanStatusList` | [L499528](../../../../ScriptDB/000_4_CreateSP.sql#L499528) | — | 7 / 0 | — |
| `UBPlanSysOutStandingCount` | [L499558](../../../../ScriptDB/000_4_CreateSP.sql#L499558) | — | 0 / 0 | — |
| `UBPlanSysPlanID` | [L499688](../../../../ScriptDB/000_4_CreateSP.sql#L499688) | — | 0 / 0 | — |
| `UBPlanSysSearch` | [L499701](../../../../ScriptDB/000_4_CreateSP.sql#L499701) | 1 / 1 file | 0 / 1 | [Plan.cs:1673](../../../../UBClasses/Plan.cs#L1673) |
| `UBPlanTaggedCount` | [L500726](../../../../ScriptDB/000_4_CreateSP.sql#L500726) | 1 / 1 file | 0 / 0 | [Plan.cs:4674](../../../../UBClasses/Plan.cs#L4674) |
| `UBPlanThirdPartyInfoAddFromTMP` | [L500742](../../../../ScriptDB/000_4_CreateSP.sql#L500742) | — | 1 / 5 | — |
| `UBPlanThirdPartyQuestionVerify` | [L500823](../../../../ScriptDB/000_4_CreateSP.sql#L500823) | — | 3 / 0 | — |
| `UBPlanTimeHorizonList` | [L500907](../../../../ScriptDB/000_4_CreateSP.sql#L500907) | — | 12 / 0 | — |
| `UBPlanTimeHorizonUpdate` | [L500937](../../../../ScriptDB/000_4_CreateSP.sql#L500937) | 1 / 1 file | 0 / 3 | [Loan.cs:1548](../../../../UBClasses/Loan.cs#L1548) |
| `UBPlanTrustRemoveByPlan` | [L500975](../../../../ScriptDB/000_4_CreateSP.sql#L500975) | — | 0 / 1 | — |
| `UBPlanTrxList` | [L501146](../../../../ScriptDB/000_4_CreateSP.sql#L501146) | — | 0 / 0 | — |
| `UBPlanTypeCount` | [L501283](../../../../ScriptDB/000_4_CreateSP.sql#L501283) | — | 0 / 0 | — |
| `UBPlanTypeInfo` | [L501319](../../../../ScriptDB/000_4_CreateSP.sql#L501319) | 1 / 1 file | 0 / 0 | [Plan.cs:50](../../../../UBClasses/Plan.cs#L50) |
| `UBPlanTypeList` | [L501347](../../../../ScriptDB/000_4_CreateSP.sql#L501347) | — | 22 / 0 | — |
| `UBPlanTypeListX` | [L501377](../../../../ScriptDB/000_4_CreateSP.sql#L501377) | — | 4 / 0 | — |
| `UBPlanUpdate` | [L501437](../../../../ScriptDB/000_4_CreateSP.sql#L501437) | 1 / 1 file | 0 / 21 | [Plan.cs:938](../../../../UBClasses/Plan.cs#L938) |
| `UBPlanUpdateDescriptionWithPortolioName` | [L502210](../../../../ScriptDB/000_4_CreateSP.sql#L502210) | — | 0 / 0 | — |
| `UBPlanUpdateFreeUnitFormFlagAll` | [L502238](../../../../ScriptDB/000_4_CreateSP.sql#L502238) | — | 2 / 4 | — |
| `UBPlanUserDefTMPEnd` | [L502303](../../../../ScriptDB/000_4_CreateSP.sql#L502303) | — | 1 / 0 | — |
| `UBPlanVerifySwitches` | [L502332](../../../../ScriptDB/000_4_CreateSP.sql#L502332) | — | 1 / 0 | — |
| `UBPlanViewComboList` | [L502399](../../../../ScriptDB/000_4_CreateSP.sql#L502399) | — | 0 / 22 | — |
| `UBPlanViewSearch` | [L502483](../../../../ScriptDB/000_4_CreateSP.sql#L502483) | 1 / 1 file | 0 / 5 | [Plan.cs:2027](../../../../UBClasses/Plan.cs#L2027) |
| `UBPlanViewSearchCriteriaSave` | [L503508](../../../../ScriptDB/000_4_CreateSP.sql#L503508) | — | 1 / 1 | — |
| `UBPlanViewSearchEx` | [L503816](../../../../ScriptDB/000_4_CreateSP.sql#L503816) | — | 1 / 1 | — |
| `UBPlanViewSearchLoad` | [L504899](../../../../ScriptDB/000_4_CreateSP.sql#L504899) | 1 / 1 file | 0 / 1 | [Plan.cs:1546](../../../../UBClasses/Plan.cs#L1546) |
| `UBReportCashLoad` | [L511222](../../../../ScriptDB/000_4_CreateSP.sql#L511222) | — | 1 / 0 | — |
| `UBReportClientAccountStatement` | [L511536](../../../../ScriptDB/000_4_CreateSP.sql#L511536) | 1 / 1 file | 0 / 22 | [CReport.cs:510](../../../../VieFUNDPdf/CReport.cs#L510) |
| `UBReportClientAccountStatement_2015` | [L515006](../../../../ScriptDB/000_4_CreateSP.sql#L515006) | 1 / 1 file | 0 / 22 | [CReport.cs:1289](../../../../VieFUNDPdf/CReport.cs#L1289) |
| `UBReportClientAccountStatement_XIRR` | [L518800](../../../../ScriptDB/000_4_CreateSP.sql#L518800) | 1 / 1 file | 0 / 21 | [CReport.cs:1027](../../../../VieFUNDPdf/CReport.cs#L1027) |
| `UBReportClientAccountStatementTrxOnly` | [L521652](../../../../ScriptDB/000_4_CreateSP.sql#L521652) | 1 / 1 file | 0 / 19 | [CReport.cs:649](../../../../VieFUNDPdf/CReport.cs#L649) |
| `UBReportClientAccountStatementWithDailyGraph` | [L523702](../../../../ScriptDB/000_4_CreateSP.sql#L523702) | 1 / 1 file | 0 / 23 | [CReport.cs:773](../../../../VieFUNDPdf/CReport.cs#L773) |
| `UBReportClientAccountSummaryBySupplier` | [L526004](../../../../ScriptDB/000_4_CreateSP.sql#L526004) | 1 / 1 file | 0 / 13 | [AccountSummary.cs:49](../../../../VieFUNDPdf/AccountSummary.cs#L49) |
| `UBReportObjPlanIDAssignOne` | [L562386](../../../../ScriptDB/000_4_CreateSP.sql#L562386) | — | 0 / 0 | — |
| `UBReportPdfObjPlanIDAdd` | [L563747](../../../../ScriptDB/000_4_CreateSP.sql#L563747) | — | 1 / 0 | — |
| `UBReportPdfObjPlanIDAddList` | [L563775](../../../../ScriptDB/000_4_CreateSP.sql#L563775) | — | 15 / 1 | — |
| `UBReportPdfObjPlanIDClear` | [L563800](../../../../ScriptDB/000_4_CreateSP.sql#L563800) | — | 15 / 0 | — |
| `UBReportPlanByProvClean` | [L564253](../../../../ScriptDB/000_4_CreateSP.sql#L564253) | — | 0 / 0 | — |
| `UBReportPlanByProvUpdate` | [L564267](../../../../ScriptDB/000_4_CreateSP.sql#L564267) | — | 3 / 0 | — |
| `UBReportPlanLoad` | [L564314](../../../../ScriptDB/000_4_CreateSP.sql#L564314) | — | 1 / 3 | — |
| `UBReportPlanRoRAdd` | [L564417](../../../../ScriptDB/000_4_CreateSP.sql#L564417) | — | 1 / 0 | — |
| `UBRESP_800_List` | [L567845](../../../../ScriptDB/000_4_CreateSP.sql#L567845) | — | 0 / 0 | — |
| `UBRESP_900_List` | [L568094](../../../../ScriptDB/000_4_CreateSP.sql#L568094) | — | 0 / 0 | — |
| `UBRESP_950_List` | [L568428](../../../../ScriptDB/000_4_CreateSP.sql#L568428) | — | 0 / 0 | — |
| `UBRESP_EAP_Listing` | [L568588](../../../../ScriptDB/000_4_CreateSP.sql#L568588) | — | 0 / 0 | — |
| `UBRESP_List_Deposit` | [L568632](../../../../ScriptDB/000_4_CreateSP.sql#L568632) | — | 0 / 0 | — |
| `UBRESP_List_PlanBenStatus` | [L568728](../../../../ScriptDB/000_4_CreateSP.sql#L568728) | — | 0 / 0 | — |
| `UBRESP_List_PlanStatus` | [L568825](../../../../ScriptDB/000_4_CreateSP.sql#L568825) | — | 0 / 0 | — |
| `UBRESP_List_Transfer` | [L568885](../../../../ScriptDB/000_4_CreateSP.sql#L568885) | — | 0 / 0 | — |
| `UBRESP_List_TransferInCash` | [L568964](../../../../ScriptDB/000_4_CreateSP.sql#L568964) | — | 0 / 0 | — |
| `UBRESP_Scan_BenInfo` | [L569031](../../../../ScriptDB/000_4_CreateSP.sql#L569031) | — | 0 / 0 | — |
| `UBRESP_Scan_Plan` | [L569117](../../../../ScriptDB/000_4_CreateSP.sql#L569117) | — | 0 / 0 | — |
| `UBRESPAccountExportList` | [L569149](../../../../ScriptDB/000_4_CreateSP.sql#L569149) | — | 1 / 0 | — |
| `UBRESPAccountExportList_V1` | [L569499](../../../../ScriptDB/000_4_CreateSP.sql#L569499) | — | 0 / 1 | — |
| `UBRESPAdd002Record` | [L570318](../../../../ScriptDB/000_4_CreateSP.sql#L570318) | — | 0 / 0 | — |
| `UBRESPAdd800Record` | [L570350](../../../../ScriptDB/000_4_CreateSP.sql#L570350) | — | 0 / 0 | — |
| `UBRESPAdd900Record` | [L570425](../../../../ScriptDB/000_4_CreateSP.sql#L570425) | — | 0 / 1 | — |
| `UBRESPAdd950Record` | [L570660](../../../../ScriptDB/000_4_CreateSP.sql#L570660) | — | 0 / 0 | — |
| `UBRESPAddErrorRecord` | [L570696](../../../../ScriptDB/000_4_CreateSP.sql#L570696) | — | 0 / 0 | — |
| `UBRESPBatchFileDetailList` | [L570730](../../../../ScriptDB/000_4_CreateSP.sql#L570730) | — | 0 / 0 | — |
| `UBRESPBatchFileList` | [L570845](../../../../ScriptDB/000_4_CreateSP.sql#L570845) | — | 0 / 0 | — |
| `UBRESPBatchFileStats` | [L570879](../../../../ScriptDB/000_4_CreateSP.sql#L570879) | — | 1 / 0 | — |
| `UBRESPBen18List` | [L570918](../../../../ScriptDB/000_4_CreateSP.sql#L570918) | — | 0 / 0 | — |
| `UBRESPBenNewContributionAdd` | [L570957](../../../../ScriptDB/000_4_CreateSP.sql#L570957) | — | 6 / 1 | — |
| `UBRESPCalcEAP` | [L571062](../../../../ScriptDB/000_4_CreateSP.sql#L571062) | 1 / 1 file | 0 / 0 | [CRESP.cs:1198](../../../../UBClasses/CRESP.cs#L1198) |
| `UBRESPCreateFileNow` | [L571161](../../../../ScriptDB/000_4_CreateSP.sql#L571161) | — | 0 / 1 | — |
| `UBRESPCreateFileRequest` | [L571201](../../../../ScriptDB/000_4_CreateSP.sql#L571201) | — | 0 / 1 | — |
| `UBRESPCreateSummaryFileRequest` | [L571382](../../../../ScriptDB/000_4_CreateSP.sql#L571382) | — | 0 / 0 | — |
| `UBRESPFileDef` | [L571460](../../../../ScriptDB/000_4_CreateSP.sql#L571460) | — | 0 / 1 | — |
| `UBRESPFileDefOne` | [L571506](../../../../ScriptDB/000_4_CreateSP.sql#L571506) | — | 1 / 0 | — |
| `UBRESPFileList` | [L571562](../../../../ScriptDB/000_4_CreateSP.sql#L571562) | 1 / 1 file | 0 / 0 | [CRESP.cs:1091](../../../../UBClasses/CRESP.cs#L1091) |
| `UBRESPGetSourceID` | [L571588](../../../../ScriptDB/000_4_CreateSP.sql#L571588) | — | 10 / 0 | — |
| `UBRESPGrantRequestAdd` | [L571608](../../../../ScriptDB/000_4_CreateSP.sql#L571608) | — | 3 / 1 | — |
| `UBRESPGrantRequestAdd511_12` | [L571793](../../../../ScriptDB/000_4_CreateSP.sql#L571793) | — | 1 / 1 | — |
| `UBRESPPlanSelectionUpdate` | [L571861](../../../../ScriptDB/000_4_CreateSP.sql#L571861) | — | 0 / 0 | — |
| `UBRESPPlanSummaryList` | [L571897](../../../../ScriptDB/000_4_CreateSP.sql#L571897) | 1 / 1 file | 0 / 1 | [CRESP.cs:786](../../../../UBClasses/CRESP.cs#L786) |
| `UBRESPPlanVerify` | [L572166](../../../../ScriptDB/000_4_CreateSP.sql#L572166) | — | 3 / 2 | — |
| `UBRESPPlanVerifyAll` | [L572291](../../../../ScriptDB/000_4_CreateSP.sql#L572291) | — | 1 / 1 | — |
| `UBRESPProFileRemove` | [L572350](../../../../ScriptDB/000_4_CreateSP.sql#L572350) | — | 0 / 0 | — |
| `UBRESPReverseCreateAll` | [L572374](../../../../ScriptDB/000_4_CreateSP.sql#L572374) | — | 0 / 1 | — |
| `UBRESPReverseCreateOneItem` | [L572402](../../../../ScriptDB/000_4_CreateSP.sql#L572402) | — | 1 / 0 | — |
| `UBRESPScanAllDeposit` | [L572510](../../../../ScriptDB/000_4_CreateSP.sql#L572510) | — | 0 / 1 | — |
| `UBRESPSetError2Pending` | [L572540](../../../../ScriptDB/000_4_CreateSP.sql#L572540) | — | 1 / 0 | — |
| `UBRESPSetError2Pending_AllContribution` | [L572617](../../../../ScriptDB/000_4_CreateSP.sql#L572617) | — | 0 / 1 | — |
| `UBRESPSetError2Pending_OneContribution` | [L572646](../../../../ScriptDB/000_4_CreateSP.sql#L572646) | — | 1 / 0 | — |
| `UBRESPSetSourceID` | [L572709](../../../../ScriptDB/000_4_CreateSP.sql#L572709) | — | 2 / 1 | — |
| `UBRESPSetTaggedItemsPendingStatus` | [L572732](../../../../ScriptDB/000_4_CreateSP.sql#L572732) | — | 0 / 1 | — |
| `UBRESPSummaryExportList` | [L572762](../../../../ScriptDB/000_4_CreateSP.sql#L572762) | — | 1 / 0 | — |
| `UBRESPSummaryOneBen` | [L572809](../../../../ScriptDB/000_4_CreateSP.sql#L572809) | 1 / 1 file | 0 / 0 | [Plan.cs:5191](../../../../UBClasses/Plan.cs#L5191) |
| `UBRESPTrustEntryUpdate` | [L573093](../../../../ScriptDB/000_4_CreateSP.sql#L573093) | — | 0 / 1 | — |
| `UBRESPTrxInfo` | [L573180](../../../../ScriptDB/000_4_CreateSP.sql#L573180) | — | 2 / 0 | — |
| `UBRESPTrxList` | [L573252](../../../../ScriptDB/000_4_CreateSP.sql#L573252) | 1 / 1 file | 0 / 0 | [CRESP.cs:350](../../../../UBClasses/CRESP.cs#L350) |
| `UBRESPTrxListOneBen` | [L574007](../../../../ScriptDB/000_4_CreateSP.sql#L574007) | 1 / 1 file | 0 / 0 | [CRESP.cs:293](../../../../UBClasses/CRESP.cs#L293) |
| `UBRESPTrxReverse` | [L574041](../../../../ScriptDB/000_4_CreateSP.sql#L574041) | 1 / 1 file | 0 / 1 | [CRESP.cs:243](../../../../UBClasses/CRESP.cs#L243) |
| `UBRESPTrxReverseOne` | [L574056](../../../../ScriptDB/000_4_CreateSP.sql#L574056) | — | 1 / 1 | — |
| `UBRESPTrxSelectionUpdate` | [L574190](../../../../ScriptDB/000_4_CreateSP.sql#L574190) | — | 0 / 0 | — |
| `UBRESPTrxSetResendFlag` | [L574226](../../../../ScriptDB/000_4_CreateSP.sql#L574226) | — | 0 / 0 | — |
| `UBRESPTrxVerifySourceIDAll` | [L574255](../../../../ScriptDB/000_4_CreateSP.sql#L574255) | — | 0 / 2 | — |
| `UBRESPViewComboList` | [L574281](../../../../ScriptDB/000_4_CreateSP.sql#L574281) | — | 0 / 1 | — |
| `UBRESPYMTList` | [L574301](../../../../ScriptDB/000_4_CreateSP.sql#L574301) | — | 0 / 0 | — |
| `UBRORCalcPlan1Mgmt` | [L587463](../../../../ScriptDB/000_4_CreateSP.sql#L587463) | — | 1 / 1 | — |
| `UBRORCalcPlan1Type` | [L587505](../../../../ScriptDB/000_4_CreateSP.sql#L587505) | — | 1 / 1 | — |
| `UBRRIFGetMinWHTRequired` | [L588852](../../../../ScriptDB/000_4_CreateSP.sql#L588852) | — | 0 / 2 | — |
| `UBRRIFGetMinWHTRequiredX` | [L588915](../../../../ScriptDB/000_4_CreateSP.sql#L588915) | — | 2 / 2 | — |
| `UBRRIFGetPlanMin` | [L589001](../../../../ScriptDB/000_4_CreateSP.sql#L589001) | — | 2 / 1 | — |
| `UBRRIFGetTotalAmountPaid` | [L589023](../../../../ScriptDB/000_4_CreateSP.sql#L589023) | 1 / 1 file | 0 / 0 | [RRIFSetting.cs:1239](../../../../UBClasses/RRIFSetting.cs#L1239) |
| `UBRRIFListAll` | [L589048](../../../../ScriptDB/000_4_CreateSP.sql#L589048) | — | 0 / 0 | — |
| `UBRRIFListByProvinceAndType` | [L589081](../../../../ScriptDB/000_4_CreateSP.sql#L589081) | — | 0 / 0 | — |
| `UBRRIFPaymentOptList` | [L589166](../../../../ScriptDB/000_4_CreateSP.sql#L589166) | 1 / 1 file | 0 / 0 | [RRIFSetting.cs:245](../../../../UBClasses/RRIFSetting.cs#L245) |
| `UBRRIFPlanEFTPending` | [L589209](../../../../ScriptDB/000_4_CreateSP.sql#L589209) | — | 0 / 1 | — |
| `UBRRIFPlanEFTPendingRemove` | [L589664](../../../../ScriptDB/000_4_CreateSP.sql#L589664) | 1 / 1 file | 0 / 0 | [RRIFSetting.cs:2394](../../../../UBClasses/RRIFSetting.cs#L2394) |
| `UBRRIFPlanEFTProcessOneItem` | [L589751](../../../../ScriptDB/000_4_CreateSP.sql#L589751) | — | 2 / 6 | — |
| `UBRRIFPlanEFTProcessSelectedItem` | [L590416](../../../../ScriptDB/000_4_CreateSP.sql#L590416) | — | 0 / 1 | — |
| `UBRRIFPlanEFTProcessTaggedItems` | [L590510](../../../../ScriptDB/000_4_CreateSP.sql#L590510) | — | 0 / 1 | — |
| `UBRRIFPlanEFTSelectionUpdate` | [L590599](../../../../ScriptDB/000_4_CreateSP.sql#L590599) | — | 0 / 0 | — |
| `UBRRIFPlanGenerateWHTTrx` | [L590640](../../../../ScriptDB/000_4_CreateSP.sql#L590640) | — | 0 / 2 | — |
| `UBRRIFPlanList` | [L590935](../../../../ScriptDB/000_4_CreateSP.sql#L590935) | — | 0 / 1 | — |
| `UBRRIFPlanNoSettingList` | [L591415](../../../../ScriptDB/000_4_CreateSP.sql#L591415) | — | 0 / 0 | — |
| `UBRRIFPlanScanBank` | [L591546](../../../../ScriptDB/000_4_CreateSP.sql#L591546) | — | 0 / 0 | — |
| `UBRRIFPlanTrxPending` | [L591611](../../../../ScriptDB/000_4_CreateSP.sql#L591611) | — | 0 / 1 | — |
| `UBRRIFPlanTrxProcessOneItem` | [L592014](../../../../ScriptDB/000_4_CreateSP.sql#L592014) | — | 2 / 1 | — |
| `UBRRIFPlanTrxProcessSelectedItem` | [L592318](../../../../ScriptDB/000_4_CreateSP.sql#L592318) | — | 0 / 1 | — |
| `UBRRIFPlanTrxProcessTaggedItems` | [L592372](../../../../ScriptDB/000_4_CreateSP.sql#L592372) | — | 0 / 1 | — |
| `UBRRIFPlanTrxScan4CancelAll` | [L592466](../../../../ScriptDB/000_4_CreateSP.sql#L592466) | — | 0 / 1 | — |
| `UBRRIFPlanTrxScan4CancelOne` | [L592494](../../../../ScriptDB/000_4_CreateSP.sql#L592494) | — | 1 / 0 | — |
| `UBRRIFPlanTrxSelectionUpdate` | [L592539](../../../../ScriptDB/000_4_CreateSP.sql#L592539) | — | 0 / 0 | — |
| `UBRRIFPlanViewComboList` | [L592576](../../../../ScriptDB/000_4_CreateSP.sql#L592576) | — | 0 / 5 | — |
| `UBRRIFPlanWithMinList` | [L592616](../../../../ScriptDB/000_4_CreateSP.sql#L592616) | — | 0 / 0 | — |
| `UBRRIFRecalcMin1Plan` | [L592640](../../../../ScriptDB/000_4_CreateSP.sql#L592640) | — | 1 / 1 | — |
| `UBRRIFRecalcMinAllPlans` | [L592709](../../../../ScriptDB/000_4_CreateSP.sql#L592709) | — | 0 / 1 | — |
| `UBRRIFRecalcPlanTaxRate` | [L592771](../../../../ScriptDB/000_4_CreateSP.sql#L592771) | — | 3 / 1 | — |
| `UBRRIFRecalcPlanTaxRate2` | [L592824](../../../../ScriptDB/000_4_CreateSP.sql#L592824) | — | 0 / 0 | — |
| `UBRRIFRecalcSplit` | [L592855](../../../../ScriptDB/000_4_CreateSP.sql#L592855) | — | 2 / 0 | — |
| `UBRRIFRecalcSplitAll` | [L592899](../../../../ScriptDB/000_4_CreateSP.sql#L592899) | — | 0 / 1 | — |
| `UBRRIFRedemptionList` | [L592930](../../../../ScriptDB/000_4_CreateSP.sql#L592930) | 1 / 1 file | 0 / 1 | [RRIFSetting.cs:860](../../../../UBClasses/RRIFSetting.cs#L860) |
| `UBRRIFSet_AMP_YOB` | [L593195](../../../../ScriptDB/000_4_CreateSP.sql#L593195) | — | 0 / 0 | — |
| `UBRRIFSettingClientList` | [L593230](../../../../ScriptDB/000_4_CreateSP.sql#L593230) | — | 0 / 0 | — |
| `UBRRIFSettingComboList` | [L593273](../../../../ScriptDB/000_4_CreateSP.sql#L593273) | — | 3 / 3 | — |
| `UBRRIFSettingInfo` | [L593558](../../../../ScriptDB/000_4_CreateSP.sql#L593558) | 1 / 1 file | 0 / 3 | [RRIFSetting.cs:365](../../../../UBClasses/RRIFSetting.cs#L365) |
| `UBRRIFSettingPlanList` | [L593729](../../../../ScriptDB/000_4_CreateSP.sql#L593729) | — | 0 / 0 | — |
| `UBRRIFSettingRemove` | [L593772](../../../../ScriptDB/000_4_CreateSP.sql#L593772) | 1 / 1 file | 0 / 0 | [RRIFSetting.cs:666](../../../../UBClasses/RRIFSetting.cs#L666) |
| `UBRRIFSettingResetPending` | [L593851](../../../../ScriptDB/000_4_CreateSP.sql#L593851) | 1 / 1 file | 0 / 0 | [RRIFSetting.cs:2487](../../../../UBClasses/RRIFSetting.cs#L2487) |
| `UBRRIFSettingSave` | [L593927](../../../../ScriptDB/000_4_CreateSP.sql#L593927) | 1 / 1 file | 0 / 4 | [RRIFSetting.cs:493](../../../../UBClasses/RRIFSetting.cs#L493) |
| `UBRRIFSettingScheduleUpdate` | [L594680](../../../../ScriptDB/000_4_CreateSP.sql#L594680) | — | 1 / 0 | — |
| `UBRRIFSettingSetNextRunDate` | [L594789](../../../../ScriptDB/000_4_CreateSP.sql#L594789) | — | 0 / 0 | — |
| `UBRRIFSettingSummary` | [L594811](../../../../ScriptDB/000_4_CreateSP.sql#L594811) | — | 1 / 0 | — |
| `UBRRIFSettingUndo2024YOBRun` | [L594873](../../../../ScriptDB/000_4_CreateSP.sql#L594873) | — | 0 / 0 | — |
| `UBRRIFSettingUndo2025To2024YOBRun` | [L594911](../../../../ScriptDB/000_4_CreateSP.sql#L594911) | — | 0 / 0 | — |
| `UBRRIFSettingUnlock` | [L594949](../../../../ScriptDB/000_4_CreateSP.sql#L594949) | 1 / 1 file | 0 / 0 | [RRIFSetting.cs:2442](../../../../UBClasses/RRIFSetting.cs#L2442) |
| `UBRRIFSettingVerify` | [L594986](../../../../ScriptDB/000_4_CreateSP.sql#L594986) | 1 / 1 file | 0 / 0 | [RRIFSetting.cs:814](../../../../UBClasses/RRIFSetting.cs#L814) |
| `UBRRIFSetupComboList` | [L595053](../../../../ScriptDB/000_4_CreateSP.sql#L595053) | — | 0 / 2 | — |
| `UBRRIFTrustTrxMarkAsUsed` | [L595202](../../../../ScriptDB/000_4_CreateSP.sql#L595202) | — | 1 / 0 | — |
| `UBRRIFYOB1Plan` | [L595226](../../../../ScriptDB/000_4_CreateSP.sql#L595226) | — | 7 / 7 | — |
| `UBRRIFYOB1PlanMin` | [L595919](../../../../ScriptDB/000_4_CreateSP.sql#L595919) | — | 1 / 2 | — |
| `UBRRIFYOBAdd` | [L595986](../../../../ScriptDB/000_4_CreateSP.sql#L595986) | — | 3 / 0 | — |
| `UBRRIFYOBAll` | [L596019](../../../../ScriptDB/000_4_CreateSP.sql#L596019) | — | 0 / 1 | — |
| `UBRRIFYOBAll_RLIFOnly` | [L596068](../../../../ScriptDB/000_4_CreateSP.sql#L596068) | — | 0 / 1 | — |
| `UBRRIFYOBAll_SpecNetAmountFix2024` | [L596117](../../../../ScriptDB/000_4_CreateSP.sql#L596117) | — | 0 / 1 | — |
| `UBRRIFYOBAllOneProvLIF` | [L596169](../../../../ScriptDB/000_4_CreateSP.sql#L596169) | — | 0 / 1 | — |
| `UBRRIFYOBPlan` | [L596217](../../../../ScriptDB/000_4_CreateSP.sql#L596217) | 1 / 1 file | 0 / 1 | [RRIFSetting.cs:1425](../../../../UBClasses/RRIFSetting.cs#L1425) |
| `UBRRSP4XML` | [L596298](../../../../ScriptDB/000_4_CreateSP.sql#L596298) | — | 1 / 1 | — |
| `UBRRSPApprove2Pending` | [L596428](../../../../ScriptDB/000_4_CreateSP.sql#L596428) | — | 0 / 0 | — |
| `UBRRSPApprovedList` | [L596482](../../../../ScriptDB/000_4_CreateSP.sql#L596482) | — | 0 / 1 | — |
| `UBRRSPApprovedSelectionUpdate` | [L596792](../../../../ScriptDB/000_4_CreateSP.sql#L596792) | — | 0 / 0 | — |
| `UBRRSPCancelItem` | [L596828](../../../../ScriptDB/000_4_CreateSP.sql#L596828) | — | 0 / 0 | — |
| `UBRRSPFileDetailList` | [L596881](../../../../ScriptDB/000_4_CreateSP.sql#L596881) | — | 0 / 0 | — |
| `UBRRSPFileList` | [L596947](../../../../ScriptDB/000_4_CreateSP.sql#L596947) | — | 0 / 1 | — |
| `UBRRSPFixCancelRecord` | [L596961](../../../../ScriptDB/000_4_CreateSP.sql#L596961) | — | 0 / 0 | — |
| `UBRRSPItemStatusUpdate` | [L596998](../../../../ScriptDB/000_4_CreateSP.sql#L596998) | — | 0 / 0 | — |
| `UBRRSPPendingList` | [L597013](../../../../ScriptDB/000_4_CreateSP.sql#L597013) | — | 0 / 1 | — |
| `UBRRSPPendingSelectionUpdate` | [L597251](../../../../ScriptDB/000_4_CreateSP.sql#L597251) | — | 0 / 0 | — |
| `UBRRSPProcessOneItem` | [L597287](../../../../ScriptDB/000_4_CreateSP.sql#L597287) | — | 1 / 0 | — |
| `UBRRSPProcessPendingTaggedItems` | [L597454](../../../../ScriptDB/000_4_CreateSP.sql#L597454) | — | 0 / 1 | — |
| `UBRRSPReceiptDetail` | [L597491](../../../../ScriptDB/000_4_CreateSP.sql#L597491) | 1 / 1 file | 0 / 3 | [CRRSPReceipt.cs:684](../../../../VieFUNDPdf/CRRSPReceipt.cs#L684) |
| `UBRRSPReceiptDetailUpdateInfo` | [L597622](../../../../ScriptDB/000_4_CreateSP.sql#L597622) | — | 3 / 0 | — |
| `UBRRSPReceiptInfo` | [L597743](../../../../ScriptDB/000_4_CreateSP.sql#L597743) | 1 / 1 file | 0 / 1 | [TaxReceipt.cs:330](../../../../UBClasses/TaxReceipt.cs#L330) |
| `UBRRSPReceiptSaveObj` | [L597805](../../../../ScriptDB/000_4_CreateSP.sql#L597805) | 1 / 1 file | 0 / 1 | [CRRSPReceipt.cs:728](../../../../VieFUNDPdf/CRRSPReceipt.cs#L728) |
| `UBRRSPReceiptVoid` | [L597839](../../../../ScriptDB/000_4_CreateSP.sql#L597839) | — | 0 / 0 | — |
| `UBRRSPRestoreSubmitted` | [L597887](../../../../ScriptDB/000_4_CreateSP.sql#L597887) | — | 0 / 0 | — |
| `UBRRSPScanAll` | [L597920](../../../../ScriptDB/000_4_CreateSP.sql#L597920) | — | 0 / 1 | — |
| `UBRRSPScanOneItem` | [L597951](../../../../ScriptDB/000_4_CreateSP.sql#L597951) | — | 1 / 0 | — |
| `UBRSPTaxReceiptPlanID` | [L598093](../../../../ScriptDB/000_4_CreateSP.sql#L598093) | 1 / 1 file | 0 / 0 | [TaxReceipt.cs:602](../../../../UBClasses/TaxReceipt.cs#L602) |
| `UBScanPACBankAccount` | [L598172](../../../../ScriptDB/000_4_CreateSP.sql#L598172) | — | 0 / 0 | — |
| `UBStockAccountAdd` | [L601382](../../../../ScriptDB/000_4_CreateSP.sql#L601382) | 1 / 1 file | 0 / 1 | [Stock.cs:39](../../../../UBClasses/Stock.cs#L39) |
| `UBStockAccountCalcAveragedCost` | [L601447](../../../../ScriptDB/000_4_CreateSP.sql#L601447) | — | 0 / 0 | — |
| `UBStockAccountHeaderInfo` | [L601476](../../../../ScriptDB/000_4_CreateSP.sql#L601476) | 1 / 1 file | 1 / 0 | [Stock.cs:312](../../../../UBClasses/Stock.cs#L312) |
| `UBStockAccountInfo` | [L601517](../../../../ScriptDB/000_4_CreateSP.sql#L601517) | 1 / 1 file | 0 / 0 | [Stock.cs:213](../../../../UBClasses/Stock.cs#L213) |
| `UBStockAccountRefresh` | [L601592](../../../../ScriptDB/000_4_CreateSP.sql#L601592) | — | 1 / 0 | — |
| `UBStockAccountRemove` | [L601644](../../../../ScriptDB/000_4_CreateSP.sql#L601644) | 1 / 1 file | 0 / 1 | [Stock.cs:462](../../../../UBClasses/Stock.cs#L462) |
| `UBStockAccountTrxCalc` | [L601667](../../../../ScriptDB/000_4_CreateSP.sql#L601667) | 1 / 1 file | 0 / 0 | [Stock.cs:362](../../../../UBClasses/Stock.cs#L362) |
| `UBStockAccountUpdate` | [L601733](../../../../ScriptDB/000_4_CreateSP.sql#L601733) | 1 / 1 file | 0 / 2 | [Stock.cs:39](../../../../UBClasses/Stock.cs#L39) |
| `UBStockListOnePlan` | [L601808](../../../../ScriptDB/000_4_CreateSP.sql#L601808) | 1 / 1 file | 0 / 0 | [Stock.cs:106](../../../../UBClasses/Stock.cs#L106) |
| `UBSysPlanComboList` | [L603046](../../../../ScriptDB/000_4_CreateSP.sql#L603046) | — | 0 / 7 | — |
| `UBSysPlanDelete` | [L603082](../../../../ScriptDB/000_4_CreateSP.sql#L603082) | 1 / 1 file | 0 / 2 | [Plan.cs:3799](../../../../UBClasses/Plan.cs#L3799) |
| `UBSysPlanEFTPendingAWD` | [L603148](../../../../ScriptDB/000_4_CreateSP.sql#L603148) | — | 0 / 1 | — |
| `UBSysPlanEFTPendingCASH` | [L603450](../../../../ScriptDB/000_4_CreateSP.sql#L603450) | — | 0 / 1 | — |
| `UBSysPlanEFTPendingPAC` | [L603989](../../../../ScriptDB/000_4_CreateSP.sql#L603989) | — | 0 / 1 | — |
| `UBSysPlanEFTProcessDailyItemsCASH` | [L604435](../../../../ScriptDB/000_4_CreateSP.sql#L604435) | — | 0 / 1 | — |
| `UBSysPlanEFTProcessOneItemAWD` | [L604555](../../../../ScriptDB/000_4_CreateSP.sql#L604555) | — | 2 / 2 | — |
| `UBSysPlanEFTProcessOneItemCASH` | [L604886](../../../../ScriptDB/000_4_CreateSP.sql#L604886) | — | 3 / 3 | — |
| `UBSysPlanEFTProcessOneItemPAC` | [L605102](../../../../ScriptDB/000_4_CreateSP.sql#L605102) | — | 2 / 3 | — |
| `UBSysPlanEFTProcessSelectedItemAWD` | [L605378](../../../../ScriptDB/000_4_CreateSP.sql#L605378) | — | 0 / 1 | — |
| `UBSysPlanEFTProcessSelectedItemCASH` | [L605468](../../../../ScriptDB/000_4_CreateSP.sql#L605468) | — | 0 / 1 | — |
| `UBSysPlanEFTProcessSelectedItemPAC` | [L605558](../../../../ScriptDB/000_4_CreateSP.sql#L605558) | — | 0 / 1 | — |
| `UBSysPlanEFTProcessTaggedItemsAWD` | [L605648](../../../../ScriptDB/000_4_CreateSP.sql#L605648) | — | 0 / 1 | — |
| `UBSysPlanEFTProcessTaggedItemsCASH` | [L605747](../../../../ScriptDB/000_4_CreateSP.sql#L605747) | — | 0 / 1 | — |
| `UBSysPlanEFTProcessTaggedItemsPAC` | [L605837](../../../../ScriptDB/000_4_CreateSP.sql#L605837) | — | 0 / 1 | — |
| `UBSysPlanEFTSchedule` | [L605935](../../../../ScriptDB/000_4_CreateSP.sql#L605935) | — | 0 / 0 | — |
| `UBSysPlanEFTSelectionUpdate` | [L606003](../../../../ScriptDB/000_4_CreateSP.sql#L606003) | — | 0 / 0 | — |
| `UBSysPlanEFTUndoOneItemCASH` | [L606048](../../../../ScriptDB/000_4_CreateSP.sql#L606048) | — | 0 / 1 | — |
| `UBSysPlanEFTUndoOneItemPAC` | [L606114](../../../../ScriptDB/000_4_CreateSP.sql#L606114) | — | 0 / 1 | — |
| `UBSysPlanList` | [L606456](../../../../ScriptDB/000_4_CreateSP.sql#L606456) | 1 / 1 file | 1 / 0 | [Plan.cs:1964](../../../../UBClasses/Plan.cs#L1964) |
| `UBSysPlanPACWaiting2SendRestore` | [L606523](../../../../ScriptDB/000_4_CreateSP.sql#L606523) | — | 0 / 0 | — |
| `UBSysPlanScan4StopDate` | [L606586](../../../../ScriptDB/000_4_CreateSP.sql#L606586) | — | 0 / 0 | — |
| `UBSysPlanScanBank` | [L606620](../../../../ScriptDB/000_4_CreateSP.sql#L606620) | — | 0 / 0 | — |
| `UBSysPlanSelectionUpdate` | [L606685](../../../../ScriptDB/000_4_CreateSP.sql#L606685) | — | 0 / 0 | — |
| `UBSysPlanStatusList` | [L606726](../../../../ScriptDB/000_4_CreateSP.sql#L606726) | — | 6 / 0 | — |
| `UBSysPlanTMPEnd` | [L606756](../../../../ScriptDB/000_4_CreateSP.sql#L606756) | — | 0 / 0 | — |
| `UBSysPlanTrustProcessOneItemPAC` | [L606788](../../../../ScriptDB/000_4_CreateSP.sql#L606788) | — | 1 / 1 | — |
| `UBSysPlanTrxList` | [L606861](../../../../ScriptDB/000_4_CreateSP.sql#L606861) | 1 / 1 file | 0 / 0 | [Plan.cs:1828](../../../../UBClasses/Plan.cs#L1828) |
| `UBSysPlanTrxPendingAWD` | [L606934](../../../../ScriptDB/000_4_CreateSP.sql#L606934) | — | 0 / 1 | — |
| `UBSysPlanTrxPendingPAC` | [L607381](../../../../ScriptDB/000_4_CreateSP.sql#L607381) | — | 0 / 1 | — |
| `UBSysPlanTrxProcessOneItemAWD` | [L607698](../../../../ScriptDB/000_4_CreateSP.sql#L607698) | — | 2 / 2 | — |
| `UBSysPlanTrxProcessOneItemPAC` | [L607981](../../../../ScriptDB/000_4_CreateSP.sql#L607981) | — | 2 / 2 | — |
| `UBSysPlanTrxProcessSelectedItemAWD` | [L608157](../../../../ScriptDB/000_4_CreateSP.sql#L608157) | — | 0 / 1 | — |
| `UBSysPlanTrxProcessSelectedItemPAC` | [L608214](../../../../ScriptDB/000_4_CreateSP.sql#L608214) | — | 0 / 1 | — |
| `UBSysPlanTrxProcessTaggedItemsAWD` | [L608266](../../../../ScriptDB/000_4_CreateSP.sql#L608266) | — | 0 / 1 | — |
| `UBSysPlanTrxProcessTaggedItemsPAC` | [L608361](../../../../ScriptDB/000_4_CreateSP.sql#L608361) | — | 0 / 1 | — |
| `UBSysPlanTrxRollBackOneItemPAC` | [L608450](../../../../ScriptDB/000_4_CreateSP.sql#L608450) | — | 2 / 0 | — |
| `UBSysPlanTrxSelectionUpdate` | [L608488](../../../../ScriptDB/000_4_CreateSP.sql#L608488) | — | 0 / 0 | — |
| `UBSysPlanViewComboList` | [L608525](../../../../ScriptDB/000_4_CreateSP.sql#L608525) | — | 0 / 7 | — |
| `UBTransferReminderClientPlanID` | [L639692](../../../../ScriptDB/000_4_CreateSP.sql#L639692) | — | 0 / 0 | — |
| `UBTransferReminderClientPlanIDPrimary` | [L639717](../../../../ScriptDB/000_4_CreateSP.sql#L639717) | — | 0 / 0 | — |
| `UBTransferReminderPlanID` | [L640593](../../../../ScriptDB/000_4_CreateSP.sql#L640593) | — | 0 / 0 | — |
| `UBTrustAttachBuyTrx` | [L642314](../../../../ScriptDB/000_4_CreateSP.sql#L642314) | — | 1 / 1 | — |
| `UBTrustAttachOrder` | [L642473](../../../../ScriptDB/000_4_CreateSP.sql#L642473) | 1 / 1 file | 0 / 1 | [TrustAccount.cs:1258](../../../../UBClasses/TrustAccount.cs#L1258) |
| `UBTrustAttachPlanTrx` | [L642589](../../../../ScriptDB/000_4_CreateSP.sql#L642589) | — | 1 / 1 | — |
| `UBTrustAttachTrx` | [L642622](../../../../ScriptDB/000_4_CreateSP.sql#L642622) | 1 / 1 file | 0 / 1 | [TrustAccount.cs:1305](../../../../UBClasses/TrustAccount.cs#L1305) |
| `UBTrustBalance4CWT` | [L642851](../../../../ScriptDB/000_4_CreateSP.sql#L642851) | 1 / 1 file | 0 / 2 | [TrustAccount.cs:4719](../../../../UBClasses/TrustAccount.cs#L4719) |
| `UBTrustBalanceBySettlementDate` | [L643147](../../../../ScriptDB/000_4_CreateSP.sql#L643147) | 1 / 1 file | 0 / 0 | [TrustAccount.cs:4524](../../../../UBClasses/TrustAccount.cs#L4524) |
| `UBTrustBuyCOFAdd` | [L643608](../../../../ScriptDB/000_4_CreateSP.sql#L643608) | — | 6 / 2 | — |
| `UBTrustBuyScan4BuyAgoraSorceDealer` | [L644067](../../../../ScriptDB/000_4_CreateSP.sql#L644067) | — | 0 / 1 | — |
| `UBTrustBuyScan4BuyAgoraSourceDealer` | [L644111](../../../../ScriptDB/000_4_CreateSP.sql#L644111) | — | 0 / 1 | — |
| `UBTrustBuyTrxAdd` | [L644159](../../../../ScriptDB/000_4_CreateSP.sql#L644159) | — | 11 / 1 | — |
| `UBTrustBuyTrxRemove` | [L644458](../../../../ScriptDB/000_4_CreateSP.sql#L644458) | — | 1 / 0 | — |
| `UBTrustBuyTrxUpdate` | [L644539](../../../../ScriptDB/000_4_CreateSP.sql#L644539) | — | 7 / 1 | — |
| `UBTrustCashDistributionAdd` | [L644602](../../../../ScriptDB/000_4_CreateSP.sql#L644602) | — | 6 / 2 | — |
| `UBTrustCashDistributionRefresh` | [L644832](../../../../ScriptDB/000_4_CreateSP.sql#L644832) | — | 0 / 1 | — |
| `UBTrustCDAdd` | [L644886](../../../../ScriptDB/000_4_CreateSP.sql#L644886) | 1 / 1 file | 0 / 6 | [TrustAccount.cs:910](../../../../UBClasses/TrustAccount.cs#L910) |
| `UBTrustCDAddInternal` | [L645325](../../../../ScriptDB/000_4_CreateSP.sql#L645325) | — | 0 / 1 | — |
| `UBTrustCDInfo` | [L645486](../../../../ScriptDB/000_4_CreateSP.sql#L645486) | — | 0 / 0 | — |
| `UBTrustCDList` | [L645540](../../../../ScriptDB/000_4_CreateSP.sql#L645540) | 2 / 1 file | 0 / 0 | [TrustAccount.cs:222](../../../../UBClasses/TrustAccount.cs#L222) |
| `UBTrustCDRemove` | [L645941](../../../../ScriptDB/000_4_CreateSP.sql#L645941) | 2 / 1 file | 1 / 1 | [TrustAccount.cs:1104](../../../../UBClasses/TrustAccount.cs#L1104) |
| `UBTrustCDUpdate` | [L645997](../../../../ScriptDB/000_4_CreateSP.sql#L645997) | 1 / 1 file | 0 / 8 | [TrustAccount.cs:910](../../../../UBClasses/TrustAccount.cs#L910) |
| `UBTrustCheckWHT` | [L646488](../../../../ScriptDB/000_4_CreateSP.sql#L646488) | — | 0 / 0 | — |
| `UBTrustCheque2EFT` | [L646612](../../../../ScriptDB/000_4_CreateSP.sql#L646612) | 1 / 1 file | 0 / 1 | [TrustAccount.cs:3662](../../../../UBClasses/TrustAccount.cs#L3662) |
| `UBTrustChequeAdd` | [L646699](../../../../ScriptDB/000_4_CreateSP.sql#L646699) | 1 / 1 file | 0 / 0 | [TrustAccount.cs:2829](../../../../UBClasses/TrustAccount.cs#L2829) |
| `UBTrustChequeDelete` | [L646804](../../../../ScriptDB/000_4_CreateSP.sql#L646804) | 1 / 1 file | 0 / 0 | [TrustAccount.cs:2887](../../../../UBClasses/TrustAccount.cs#L2887) |
| `UBTrustChequeInfo` | [L646850](../../../../ScriptDB/000_4_CreateSP.sql#L646850) | 1 / 1 file | 0 / 0 | [TrustAccount.cs:2779](../../../../UBClasses/TrustAccount.cs#L2779) |
| `UBTrustChequeInfoUpdate` | [L646881](../../../../ScriptDB/000_4_CreateSP.sql#L646881) | — | 1 / 0 | — |
| `UBTrustChequeItemAdd` | [L646921](../../../../ScriptDB/000_4_CreateSP.sql#L646921) | 1 / 1 file | 0 / 0 | [TrustAccount.cs:2991](../../../../UBClasses/TrustAccount.cs#L2991) |
| `UBTrustChequeItemDelete` | [L646996](../../../../ScriptDB/000_4_CreateSP.sql#L646996) | 1 / 1 file | 0 / 0 | [TrustAccount.cs:3062](../../../../UBClasses/TrustAccount.cs#L3062) |
| `UBTrustChequeItemInfo` | [L647034](../../../../ScriptDB/000_4_CreateSP.sql#L647034) | 1 / 1 file | 0 / 0 | [TrustAccount.cs:2936](../../../../UBClasses/TrustAccount.cs#L2936) |
| `UBTrustChequeItemUpdate` | [L647068](../../../../ScriptDB/000_4_CreateSP.sql#L647068) | 1 / 1 file | 0 / 0 | [TrustAccount.cs:2993](../../../../UBClasses/TrustAccount.cs#L2993) |
| `UBTrustChequeList` | [L647137](../../../../ScriptDB/000_4_CreateSP.sql#L647137) | 1 / 1 file | 0 / 0 | [TrustAccount.cs:2673](../../../../UBClasses/TrustAccount.cs#L2673) |
| `UBTrustChequeListDetail` | [L647281](../../../../ScriptDB/000_4_CreateSP.sql#L647281) | 1 / 1 file | 0 / 3 | [CPayroll.cs:1286](../../../../VieFUNDPdf/CPayroll.cs#L1286) |
| `UBTrustChequeTrxList` | [L647594](../../../../ScriptDB/000_4_CreateSP.sql#L647594) | 1 / 1 file | 0 / 0 | [TrustAccount.cs:2729](../../../../UBClasses/TrustAccount.cs#L2729) |
| `UBTrustChequeUpdate` | [L647696](../../../../ScriptDB/000_4_CreateSP.sql#L647696) | 1 / 1 file | 0 / 0 | [TrustAccount.cs:2831](../../../../UBClasses/TrustAccount.cs#L2831) |
| `UBTrustDepositClientBankList` | [L647798](../../../../ScriptDB/000_4_CreateSP.sql#L647798) | — | 0 / 1 | — |
| `UBTrustDepositComboList` | [L647823](../../../../ScriptDB/000_4_CreateSP.sql#L647823) | — | 0 / 11 | — |
| `UBTrustDepositPlanBankList` | [L647873](../../../../ScriptDB/000_4_CreateSP.sql#L647873) | — | 0 / 1 | — |
| `UBTrustDepositRecalcOne` | [L647900](../../../../ScriptDB/000_4_CreateSP.sql#L647900) | — | 4 / 0 | — |
| `UBTrustDepositRefresh` | [L647935](../../../../ScriptDB/000_4_CreateSP.sql#L647935) | — | 0 / 0 | — |
| `UBTrustDepositRefreshTrx` | [L647968](../../../../ScriptDB/000_4_CreateSP.sql#L647968) | 1 / 1 file | 0 / 0 | [TrustAccount.cs:3106](../../../../UBClasses/TrustAccount.cs#L3106) |
| `UBTrustDetachTrx` | [L648106](../../../../ScriptDB/000_4_CreateSP.sql#L648106) | 1 / 1 file | 0 / 0 | [TrustAccount.cs:1157](../../../../UBClasses/TrustAccount.cs#L1157) |
| `UBTrustEFTAddPayClient` | [L648204](../../../../ScriptDB/000_4_CreateSP.sql#L648204) | — | 0 / 1 | — |
| `UBTrustEFTInfoUpdate` | [L648258](../../../../ScriptDB/000_4_CreateSP.sql#L648258) | — | 2 / 0 | — |
| `UBTrustEFTSettlementDateSynch` | [L648294](../../../../ScriptDB/000_4_CreateSP.sql#L648294) | — | 0 / 0 | — |
| `UBTrustFEItemAdd` | [L648475](../../../../ScriptDB/000_4_CreateSP.sql#L648475) | — | 2 / 0 | — |
| `UBTrustFindDuplicationFromSell` | [L648535](../../../../ScriptDB/000_4_CreateSP.sql#L648535) | — | 0 / 0 | — |
| `UBTrustFix1DayDeposit` | [L648571](../../../../ScriptDB/000_4_CreateSP.sql#L648571) | — | 0 / 1 | — |
| `UBTrustFixDeposit4ClientName` | [L648599](../../../../ScriptDB/000_4_CreateSP.sql#L648599) | — | 1 / 0 | — |
| `UBTrustFixDeposit4ClientNameByPlanID` | [L648681](../../../../ScriptDB/000_4_CreateSP.sql#L648681) | 1 / 1 file | 0 / 1 | [TrustAccount.cs:4254](../../../../UBClasses/TrustAccount.cs#L4254) |
| `UBTrustGetBalance` | [L648722](../../../../ScriptDB/000_4_CreateSP.sql#L648722) | 1 / 1 file | 0 / 0 | [TrustAccount.cs:728](../../../../UBClasses/TrustAccount.cs#L728) |
| `UBTrustGetOne` | [L648788](../../../../ScriptDB/000_4_CreateSP.sql#L648788) | 1 / 1 file | 0 / 0 | [TrustAccount.cs:4948](../../../../UBClasses/TrustAccount.cs#L4948) |
| `UBTrustInfo` | [L648980](../../../../ScriptDB/000_4_CreateSP.sql#L648980) | 1 / 1 file | 0 / 2 | [TrustAccount.cs:1384](../../../../UBClasses/TrustAccount.cs#L1384) |
| `UBTrustListAll` | [L649176](../../../../ScriptDB/000_4_CreateSP.sql#L649176) | 1 / 1 file | 0 / 0 | [TrustAccount.cs:4461](../../../../UBClasses/TrustAccount.cs#L4461) |
| `UBTrustListBuyShares` | [L649444](../../../../ScriptDB/000_4_CreateSP.sql#L649444) | 1 / 1 file | 0 / 3 | [TrustAccount.cs:2556](../../../../UBClasses/TrustAccount.cs#L2556) |
| `UBTrustListIN` | [L649958](../../../../ScriptDB/000_4_CreateSP.sql#L649958) | 1 / 1 file | 0 / 5 | [TrustAccount.cs:1813](../../../../UBClasses/TrustAccount.cs#L1813) |
| `UBTrustListINDetail` | [L650955](../../../../ScriptDB/000_4_CreateSP.sql#L650955) | 1 / 1 file | 0 / 4 | [TrustAccount.cs:1882](../../../../UBClasses/TrustAccount.cs#L1882) |
| `UBTrustListINTotal` | [L651220](../../../../ScriptDB/000_4_CreateSP.sql#L651220) | — | 1 / 0 | — |
| `UBTrustListINTotalDetail` | [L651278](../../../../ScriptDB/000_4_CreateSP.sql#L651278) | — | 1 / 0 | — |
| `UBTrustListSettlementList` | [L651330](../../../../ScriptDB/000_4_CreateSP.sql#L651330) | 1 / 1 file | 0 / 3 | [TrustAccount.cs:2495](../../../../UBClasses/TrustAccount.cs#L2495) |
| `UBTrustListTrxSupplier` | [L651581](../../../../ScriptDB/000_4_CreateSP.sql#L651581) | 1 / 1 file | 0 / 6 | [TrustAccount.cs:2181](../../../../UBClasses/TrustAccount.cs#L2181) |
| `UBTrustListTrxSupplierPrn` | [L656042](../../../../ScriptDB/000_4_CreateSP.sql#L656042) | 1 / 1 file | 0 / 4 | [TrustAccount.cs:2402](../../../../UBClasses/TrustAccount.cs#L2402) |
| `UBTrustListTrxSupplierTotal` | [L656160](../../../../ScriptDB/000_4_CreateSP.sql#L656160) | — | 2 / 0 | — |
| `UBTrustListTrxTotal` | [L656211](../../../../ScriptDB/000_4_CreateSP.sql#L656211) | — | 1 / 0 | — |
| `UBTrustMoveDepositFromPlan2Plan` | [L656263](../../../../ScriptDB/000_4_CreateSP.sql#L656263) | — | 0 / 0 | — |
| `UBTrustNoCashSuspiciousList` | [L656297](../../../../ScriptDB/000_4_CreateSP.sql#L656297) | — | 0 / 0 | — |
| `UBTrustNonCashExternalTransfer` | [L656315](../../../../ScriptDB/000_4_CreateSP.sql#L656315) | — | 0 / 0 | — |
| `UBTrustNonCashTrxNoTax` | [L656340](../../../../ScriptDB/000_4_CreateSP.sql#L656340) | — | 0 / 0 | — |
| `UBTrustPlanBalanceList` | [L656363](../../../../ScriptDB/000_4_CreateSP.sql#L656363) | 1 / 1 file | 0 / 3 | [TrustAccount.cs:3834](../../../../UBClasses/TrustAccount.cs#L3834) |
| `UBTrustPlanID` | [L656786](../../../../ScriptDB/000_4_CreateSP.sql#L656786) | 1 / 1 file | 0 / 0 | [TrustAccount.cs:778](../../../../UBClasses/TrustAccount.cs#L778) |
| `UBTrustPlanListCurrent` | [L656801](../../../../ScriptDB/000_4_CreateSP.sql#L656801) | — | 0 / 0 | — |
| `UBTrustPlanTrxList` | [L656845](../../../../ScriptDB/000_4_CreateSP.sql#L656845) | 1 / 1 file | 0 / 0 | [TrustAccount.cs:3977](../../../../UBClasses/TrustAccount.cs#L3977) |
| `UBTrustRedemptionClientBankList` | [L656960](../../../../ScriptDB/000_4_CreateSP.sql#L656960) | — | 0 / 1 | — |
| `UBTrustRedemptionPlanBankList` | [L656985](../../../../ScriptDB/000_4_CreateSP.sql#L656985) | — | 0 / 1 | — |
| `UBTrustRefresh1Plan` | [L657010](../../../../ScriptDB/000_4_CreateSP.sql#L657010) | — | 0 / 0 | — |
| `UBTrustRemoveNonCashTrx` | [L657120](../../../../ScriptDB/000_4_CreateSP.sql#L657120) | 1 / 1 file | 0 / 0 | [TrustAccount.cs:4294](../../../../UBClasses/TrustAccount.cs#L4294) |
| `UBTrustRemoveOrder` | [L657270](../../../../ScriptDB/000_4_CreateSP.sql#L657270) | — | 15 / 2 | — |
| `UBTrustRemoveTrx` | [L657355](../../../../ScriptDB/000_4_CreateSP.sql#L657355) | — | 1 / 2 | — |
| `UBTrustRemoveWithDrawal` | [L657436](../../../../ScriptDB/000_4_CreateSP.sql#L657436) | 1 / 1 file | 0 / 0 | [TrustAccount.cs:1210](../../../../UBClasses/TrustAccount.cs#L1210) |
| `UBTrustRESPContributionUpdate` | [L657501](../../../../ScriptDB/000_4_CreateSP.sql#L657501) | 1 / 1 file | 0 / 1 | [TrustAccount.cs:5155](../../../../UBClasses/TrustAccount.cs#L5155) |
| `UBTrustRESPPYMTTrxAdd` | [L657616](../../../../ScriptDB/000_4_CreateSP.sql#L657616) | — | 0 / 1 | — |
| `UBTrustRESPTrxAdd` | [L657694](../../../../ScriptDB/000_4_CreateSP.sql#L657694) | — | 4 / 2 | — |
| `UBTrustSelectionUpdateEFT` | [L657874](../../../../ScriptDB/000_4_CreateSP.sql#L657874) | — | 0 / 0 | — |
| `UBTrustSelectionUpdateIN` | [L657919](../../../../ScriptDB/000_4_CreateSP.sql#L657919) | — | 0 / 0 | — |
| `UBTrustSelectionUpdateINDetail` | [L657963](../../../../ScriptDB/000_4_CreateSP.sql#L657963) | — | 0 / 0 | — |
| `UBTrustSelectionUpdateSupplier` | [L658007](../../../../ScriptDB/000_4_CreateSP.sql#L658007) | — | 0 / 0 | — |
| `UBTrustSelectionUpdateTrx` | [L658097](../../../../ScriptDB/000_4_CreateSP.sql#L658097) | — | 0 / 0 | — |
| `UBTrustSellCOFAdd` | [L658144](../../../../ScriptDB/000_4_CreateSP.sql#L658144) | — | 5 / 0 | — |
| `UBTrustSellTrxAdd` | [L658353](../../../../ScriptDB/000_4_CreateSP.sql#L658353) | — | 10 / 0 | — |
| `UBTrustSellTrxUpdate` | [L658463](../../../../ScriptDB/000_4_CreateSP.sql#L658463) | — | 1 / 0 | — |
| `UBTrustSettle` | [L658507](../../../../ScriptDB/000_4_CreateSP.sql#L658507) | 1 / 1 file | 0 / 6 | [TrustAccount.cs:1657](../../../../UBClasses/TrustAccount.cs#L1657) |
| `UBTrustSettleOne` | [L658796](../../../../ScriptDB/000_4_CreateSP.sql#L658796) | — | 1 / 4 | — |
| `UBTrustStatusList` | [L658961](../../../../ScriptDB/000_4_CreateSP.sql#L658961) | — | 3 / 0 | — |
| `UBTrustStatusUpdate` | [L658987](../../../../ScriptDB/000_4_CreateSP.sql#L658987) | 1 / 1 file | 0 / 0 | [TrustAccount.cs:4773](../../../../UBClasses/TrustAccount.cs#L4773) |
| `UBTrustSummaryByPlan_RRSP` | [L659036](../../../../ScriptDB/000_4_CreateSP.sql#L659036) | — | 0 / 0 | — |
| `UBTrustSummaryByPlan_TFSA` | [L659124](../../../../ScriptDB/000_4_CreateSP.sql#L659124) | — | 0 / 0 | — |
| `UBTrustTransferTrxRefresh` | [L659199](../../../../ScriptDB/000_4_CreateSP.sql#L659199) | 1 / 1 file | 3 / 1 | [Trx.cs:3503](../../../../UBClasses/Trx.cs#L3503) |
| `UBTrustTrx2Attach` | [L659503](../../../../ScriptDB/000_4_CreateSP.sql#L659503) | — | 1 / 0 | — |
| `UBTrustTrxAdd` | [L659565](../../../../ScriptDB/000_4_CreateSP.sql#L659565) | 1 / 1 file | 0 / 2 | [TrustAccount.cs:824](../../../../UBClasses/TrustAccount.cs#L824) |
| `UBTrustTrxAddfmrSpouse4InKindTrnsf` | [L659723](../../../../ScriptDB/000_4_CreateSP.sql#L659723) | 1 / 1 file | 0 / 1 | [TrustAccount.cs:4830](../../../../UBClasses/TrustAccount.cs#L4830) |
| `UBTrustTrxAddWithdrawal` | [L659872](../../../../ScriptDB/000_4_CreateSP.sql#L659872) | 1 / 1 file | 0 / 7 | [TrustAccount.cs:3163](../../../../UBClasses/TrustAccount.cs#L3163) |
| `UBTrustTrxDetailNew` | [L660418](../../../../ScriptDB/000_4_CreateSP.sql#L660418) | — | 15 / 1 | — |
| `UBTrustTrxDetailRemove` | [L660534](../../../../ScriptDB/000_4_CreateSP.sql#L660534) | — | 2 / 1 | — |
| `UBTrustTrxDetailUpdate` | [L660576](../../../../ScriptDB/000_4_CreateSP.sql#L660576) | — | 1 / 1 | — |
| `UBTrustTrxInfo` | [L660685](../../../../ScriptDB/000_4_CreateSP.sql#L660685) | 1 / 1 file | 0 / 3 | [TrustAccount.cs:672](../../../../UBClasses/TrustAccount.cs#L672) |
| `UBTrustTrxInfoEstate` | [L660794](../../../../ScriptDB/000_4_CreateSP.sql#L660794) | — | 1 / 0 | — |
| `UBTrustTrxInfoRESP` | [L660838](../../../../ScriptDB/000_4_CreateSP.sql#L660838) | — | 1 / 1 | — |
| `UBTrustTrxInfoRESPPYMT` | [L660860](../../../../ScriptDB/000_4_CreateSP.sql#L660860) | — | 0 / 0 | — |
| `UBTrustTrxInKindTrnsfSaveReceiptOption` | [L660909](../../../../ScriptDB/000_4_CreateSP.sql#L660909) | 1 / 1 file | 0 / 0 | [TrustAccount.cs:4896](../../../../UBClasses/TrustAccount.cs#L4896) |
| `UBTrustTrxList` | [L660950](../../../../ScriptDB/000_4_CreateSP.sql#L660950) | 1 / 1 file | 0 / 0 | [TrustAccount.cs:615](../../../../UBClasses/TrustAccount.cs#L615) |
| `UBTrustTrxListSet` | [L661029](../../../../ScriptDB/000_4_CreateSP.sql#L661029) | 1 / 1 file | 0 / 1 | [TrustAccount.cs:503](../../../../UBClasses/TrustAccount.cs#L503) |
| `UBTrustTrxListSetNonCash` | [L661162](../../../../ScriptDB/000_4_CreateSP.sql#L661162) | 1 / 1 file | 0 / 1 | [TrustAccount.cs:559](../../../../UBClasses/TrustAccount.cs#L559) |
| `UBTrustTrxListSetNonCashWithNoTax` | [L661291](../../../../ScriptDB/000_4_CreateSP.sql#L661291) | — | 0 / 0 | — |
| `UBTrustTrxMove2Plan` | [L661344](../../../../ScriptDB/000_4_CreateSP.sql#L661344) | — | 0 / 1 | — |
| `UBTrustTrxOrphanListSell` | [L661383](../../../../ScriptDB/000_4_CreateSP.sql#L661383) | — | 0 / 0 | — |
| `UBTrustTrxRESPTrxUpdate` | [L661419](../../../../ScriptDB/000_4_CreateSP.sql#L661419) | — | 4 / 1 | — |
| `UBTrustTrxScanSpecific` | [L661610](../../../../ScriptDB/000_4_CreateSP.sql#L661610) | — | 0 / 1 | — |
| `UBTrustTrxSetEffectiveDate` | [L661663](../../../../ScriptDB/000_4_CreateSP.sql#L661663) | — | 0 / 0 | — |
| `UBTrustTrxTypeList` | [L661688](../../../../ScriptDB/000_4_CreateSP.sql#L661688) | — | 2 / 0 | — |
| `UBTrustTrxTypeListExtra` | [L661716](../../../../ScriptDB/000_4_CreateSP.sql#L661716) | — | 0 / 0 | — |
| `UBTrustTrxUpdate` | [L661763](../../../../ScriptDB/000_4_CreateSP.sql#L661763) | 1 / 1 file | 0 / 3 | [TrustAccount.cs:824](../../../../UBClasses/TrustAccount.cs#L824) |
| `UBTrustTrxUpdateWDR` | [L661952](../../../../ScriptDB/000_4_CreateSP.sql#L661952) | 1 / 1 file | 0 / 6 | [TrustAccount.cs:3163](../../../../UBClasses/TrustAccount.cs#L3163) |
| `UBTrustType2List` | [L662406](../../../../ScriptDB/000_4_CreateSP.sql#L662406) | — | 1 / 0 | — |
| `UBTrustTypeList` | [L662433](../../../../ScriptDB/000_4_CreateSP.sql#L662433) | — | 1 / 0 | — |
| `UBTrustUnlockCash` | [L662466](../../../../ScriptDB/000_4_CreateSP.sql#L662466) | 1 / 1 file | 0 / 0 | [CashAccount.cs:342](../../../../UBClasses/CashAccount.cs#L342) |
| `UBTrustUnSettle` | [L662561](../../../../ScriptDB/000_4_CreateSP.sql#L662561) | 1 / 1 file | 2 / 0 | [TrustAccount.cs:1708](../../../../UBClasses/TrustAccount.cs#L1708) |
| `UBTrustUnSettleTagged` | [L662702](../../../../ScriptDB/000_4_CreateSP.sql#L662702) | 1 / 1 file | 0 / 1 | [TrustAccount.cs:1754](../../../../UBClasses/TrustAccount.cs#L1754) |
| `UBTrustUpdateBuyOrder` | [L662807](../../../../ScriptDB/000_4_CreateSP.sql#L662807) | — | 0 / 0 | — |
| `UBTrustUpdateOne` | [L662855](../../../../ScriptDB/000_4_CreateSP.sql#L662855) | 1 / 1 file | 0 / 0 | [TrustAccount.cs:5022](../../../../UBClasses/TrustAccount.cs#L5022) |
| `UBTrxBuyOrderCheck4Cash2SendOnePlan` | [L664000](../../../../ScriptDB/000_4_CreateSP.sql#L664000) | — | 2 / 1 | — |
| `UBTrxClientPlanAccountInfo` | [L664418](../../../../ScriptDB/000_4_CreateSP.sql#L664418) | 1 / 1 file | 0 / 0 | [Trx.cs:3676](../../../../UBClasses/Trx.cs#L3676) |
| `UBTrxFirstInPlan` | [L669526](../../../../ScriptDB/000_4_CreateSP.sql#L669526) | — | 2 / 0 | — |
| `UBTrxFirstInPlanByPlanID` | [L669621](../../../../ScriptDB/000_4_CreateSP.sql#L669621) | — | 1 / 0 | — |
| `UBTrxMoveFromPlan2Plan` | [L670769](../../../../ScriptDB/000_4_CreateSP.sql#L670769) | — | 0 / 0 | — |
| `UBTrxPlanID` | [L671836](../../../../ScriptDB/000_4_CreateSP.sql#L671836) | 2 / 1 file | 0 / 0 | [Trx.cs:2355](../../../../UBClasses/Trx.cs#L2355) |
| `UBTrxResponseSourceList` | [L672342](../../../../ScriptDB/000_4_CreateSP.sql#L672342) | — | 1 / 0 | — |
| `UBTrxSellRRIF` | [L672895](../../../../ScriptDB/000_4_CreateSP.sql#L672895) | — | 2 / 1 | — |
| `UBTrxSettleMethodListByPlanID` | [L673199](../../../../ScriptDB/000_4_CreateSP.sql#L673199) | 1 / 1 file | 0 / 1 | [CBase.cs:8168](../../../../UBClasses/CBase.cs#L8168) |
| `UBTrxTransferTrustInfo` | [L673584](../../../../ScriptDB/000_4_CreateSP.sql#L673584) | 1 / 1 file | 0 / 0 | [Trx.cs:3568](../../../../UBClasses/Trx.cs#L3568) |
| `UBXML2TMP_Account` | [L686102](../../../../ScriptDB/000_4_CreateSP.sql#L686102) | — | 0 / 0 | — |
| `UBXML2TMP_SysPlan` | [L687157](../../../../ScriptDB/000_4_CreateSP.sql#L687157) | — | 0 / 0 | — |
| `UBXML2TMP_SysPlanDetail` | [L687202](../../../../ScriptDB/000_4_CreateSP.sql#L687202) | — | 0 / 0 | — |
| `UBXML2TMP_TrxRecAccountEx` | [L687389](../../../../ScriptDB/000_4_CreateSP.sql#L687389) | — | 0 / 0 | — |
| `UBXMLFileImportCheckPlanAccount` | [L687894](../../../../ScriptDB/000_4_CreateSP.sql#L687894) | — | 12 / 6 | — |
| `UBXMLRecCheckPlanDetail` | [L689412](../../../../ScriptDB/000_4_CreateSP.sql#L689412) | — | 1 / 0 | — |
| `UBXMLRecDemoCheckClientPlan` | [L690416](../../../../ScriptDB/000_4_CreateSP.sql#L690416) | — | 1 / 12 | — |
| `UBXMLRecNSPProcess_SysPlan` | [L694244](../../../../ScriptDB/000_4_CreateSP.sql#L694244) | — | 1 / 1 | — |
| `UBXMLRecNSPProcess_SysPlanOne` | [L694302](../../../../ScriptDB/000_4_CreateSP.sql#L694302) | — | 1 / 0 | — |
| `UBXMLRecOrderRespnProcess` | [L694547](../../../../ScriptDB/000_4_CreateSP.sql#L694547) | 1 / 1 file | 0 / 6 | [COrder.cs:785](../../../../UBFFImport/COrder.cs#L785) |
| `UBXMLRecOrderRespnProcessError` | [L694907](../../../../ScriptDB/000_4_CreateSP.sql#L694907) | 1 / 1 file | 0 / 0 | [COrder.cs:732](../../../../UBFFImport/COrder.cs#L732) |
| `UBXMLRespBenAdd` | [L706101](../../../../ScriptDB/000_4_CreateSP.sql#L706101) | — | 0 / 3 | — |
| `UBXMLSysPlanAdd` | [L706327](../../../../ScriptDB/000_4_CreateSP.sql#L706327) | — | 0 / 0 | — |
| `VF_VF_AllCompCheckPlan` | [L707849](../../../../ScriptDB/000_4_CreateSP.sql#L707849) | — | 0 / 0 | — |
| `VF_VF_AllCompCheckPlanARC` | [L707890](../../../../ScriptDB/000_4_CreateSP.sql#L707890) | — | 0 / 0 | — |
| `VF_VF_AllCompTrxApprovalPlanInfo` | [L708104](../../../../ScriptDB/000_4_CreateSP.sql#L708104) | — | 0 / 0 | — |
| `VF_VF_AllPlan` | [L708657](../../../../ScriptDB/000_4_CreateSP.sql#L708657) | — | 0 / 1 | — |
| `VF_VF_AllPlanApproval` | [L708690](../../../../ScriptDB/000_4_CreateSP.sql#L708690) | — | 0 / 0 | — |
| `VF_VF_AllPlanApprovalH` | [L708744](../../../../ScriptDB/000_4_CreateSP.sql#L708744) | — | 0 / 0 | — |
| `VF_VF_AllPlanKYCUpdateGroup` | [L708807](../../../../ScriptDB/000_4_CreateSP.sql#L708807) | — | 0 / 2 | — |
| `VF_VF_AllPlanX` | [L708854](../../../../ScriptDB/000_4_CreateSP.sql#L708854) | — | 0 / 1 | — |
| `VF_VF_BankOnePlan` | [L709136](../../../../ScriptDB/000_4_CreateSP.sql#L709136) | — | 1 / 1 | — |
| `VF_VF_BankOnePlanX` | [L709189](../../../../ScriptDB/000_4_CreateSP.sql#L709189) | — | 1 / 1 | — |
| `VF_VF_OneAccountPos` | [L710024](../../../../ScriptDB/000_4_CreateSP.sql#L710024) | — | 1 / 1 | — |
| `VF_VF_OneAccountPosTrx` | [L710144](../../../../ScriptDB/000_4_CreateSP.sql#L710144) | — | 1 / 0 | — |
| `VF_VF_OneCashTrx` | [L710378](../../../../ScriptDB/000_4_CreateSP.sql#L710378) | — | 1 / 0 | — |
| `VF_VF_OnePlan` | [L711651](../../../../ScriptDB/000_4_CreateSP.sql#L711651) | — | 1 / 8 | — |
| `VF_VF_OnePlan3rdParty` | [L711923](../../../../ScriptDB/000_4_CreateSP.sql#L711923) | — | 1 / 2 | — |
| `VF_VF_OnePlanAccount` | [L712002](../../../../ScriptDB/000_4_CreateSP.sql#L712002) | — | 1 / 2 | — |
| `VF_VF_OnePlanAccountSchedule` | [L712064](../../../../ScriptDB/000_4_CreateSP.sql#L712064) | — | 1 / 0 | — |
| `VF_VF_OnePlanBen` | [L712139](../../../../ScriptDB/000_4_CreateSP.sql#L712139) | — | 1 / 2 | — |
| `VF_VF_OnePlanBenCon` | [L712208](../../../../ScriptDB/000_4_CreateSP.sql#L712208) | — | 1 / 2 | — |
| `VF_VF_OnePlanBenX` | [L712275](../../../../ScriptDB/000_4_CreateSP.sql#L712275) | — | 1 / 2 | — |
| `VF_VF_OnePlanCash` | [L712351](../../../../ScriptDB/000_4_CreateSP.sql#L712351) | — | 1 / 1 | — |
| `VF_VF_OnePlanInTrust` | [L712511](../../../../ScriptDB/000_4_CreateSP.sql#L712511) | — | 1 / 2 | — |
| `VF_VF_OnePlanInTrustX` | [L712575](../../../../ScriptDB/000_4_CreateSP.sql#L712575) | — | 1 / 2 | — |
| `VF_VF_OnePlanKYCUpdateGroup` | [L712641](../../../../ScriptDB/000_4_CreateSP.sql#L712641) | — | 1 / 0 | — |
| `VF_VF_OnePlanKYCUpdateGroupARC` | [L712693](../../../../ScriptDB/000_4_CreateSP.sql#L712693) | — | 1 / 0 | — |
| `VF_VF_OnePlanX` | [L712747](../../../../ScriptDB/000_4_CreateSP.sql#L712747) | — | 1 / 4 | — |
| `VF_VF_QuestionOnePlan` | [L713190](../../../../ScriptDB/000_4_CreateSP.sql#L713190) | — | 0 / 0 | — |
