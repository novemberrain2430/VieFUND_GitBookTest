# SP Catalog — Fund & GIC

> Phân nhóm gợi ý theo tên procedure. Các cột caller mới là bằng chứng truy vết; `—` không có nghĩa procedure không được dùng.

**Tổng**: 685 definition; 188 có tên tĩnh từ C#; 235 được procedure khác gọi qua EXEC/EXECUTE.

| Procedure | Definition | C# tĩnh | SQL gọi vào / gọi ra | Caller C# mẫu |
|---|---:|---:|---:|---|
| `AA_GetGICMKVX_2` | [L16640](../../../../ScriptDB/000_4_CreateSP.sql#L16640) | — | 0 / 0 | — |
| `AGRP_FUndAccountListWithUnit` | [L19385](../../../../ScriptDB/000_4_CreateSP.sql#L19385) | — | 0 / 0 | — |
| `AMF_AUAByProDuctType` | [L20846](../../../../ScriptDB/000_4_CreateSP.sql#L20846) | — | 0 / 1 | — |
| `B2B_GIC_Remove` | [L21555](../../../../ScriptDB/000_4_CreateSP.sql#L21555) | — | 0 / 0 | — |
| `CON_Axis_VF_PRODUCT_All` | [L25126](../../../../ScriptDB/000_4_CreateSP.sql#L25126) | — | 0 / 1 | — |
| `CON_Axis_VF_PRODUCT_One` | [L25161](../../../../ScriptDB/000_4_CreateSP.sql#L25161) | — | 1 / 1 | — |
| `CON_CCB_FundAccountSys` | [L25576](../../../../ScriptDB/000_4_CreateSP.sql#L25576) | — | 0 / 0 | — |
| `CON_FundAccountAUA` | [L27427](../../../../ScriptDB/000_4_CreateSP.sql#L27427) | — | 0 / 1 | — |
| `CON_FundAccountAUAOne` | [L27474](../../../../ScriptDB/000_4_CreateSP.sql#L27474) | — | 1 / 1 | — |
| `CON_FundAccountDuplicationList` | [L27529](../../../../ScriptDB/000_4_CreateSP.sql#L27529) | — | 0 / 0 | — |
| `CON_FundPositionDuplicationList` | [L27610](../../../../ScriptDB/000_4_CreateSP.sql#L27610) | — | 0 / 0 | — |
| `CON_FundPositionDuplicationRemove` | [L27694](../../../../ScriptDB/000_4_CreateSP.sql#L27694) | — | 0 / 0 | — |
| `CON_FundPositionNoDefList` | [L27760](../../../../ScriptDB/000_4_CreateSP.sql#L27760) | — | 0 / 0 | — |
| `CON_GICSupplierSetCannex` | [L27816](../../../../ScriptDB/000_4_CreateSP.sql#L27816) | — | 0 / 1 | — |
| `CON_GICSupplierSetCannex1` | [L27940](../../../../ScriptDB/000_4_CreateSP.sql#L27940) | — | 1 / 1 | — |
| `CON_MoveFund2Cash` | [L28406](../../../../ScriptDB/000_4_CreateSP.sql#L28406) | — | 0 / 1 | — |
| `CON_MoveFund2Cash_YIS` | [L28500](../../../../ScriptDB/000_4_CreateSP.sql#L28500) | — | 0 / 1 | — |
| `CON_MoveFundTrx2CashTrx` | [L28615](../../../../ScriptDB/000_4_CreateSP.sql#L28615) | — | 1 / 1 | — |
| `CON_MoveFundTrx2CashTrxOneFund` | [L28693](../../../../ScriptDB/000_4_CreateSP.sql#L28693) | — | 0 / 1 | — |
| `CON_OB_FundAccount2` | [L30225](../../../../ScriptDB/000_4_CreateSP.sql#L30225) | — | 0 / 2 | — |
| `CON_OB_FundDef` | [L30542](../../../../ScriptDB/000_4_CreateSP.sql#L30542) | — | 0 / 1 | — |
| `CON_OB_FundTrx` | [L30842](../../../../ScriptDB/000_4_CreateSP.sql#L30842) | — | 1 / 1 | — |
| `CON_OB_GIC` | [L31361](../../../../ScriptDB/000_4_CreateSP.sql#L31361) | — | 0 / 0 | — |
| `CON_RemoveGICByRepCode` | [L35048](../../../../ScriptDB/000_4_CreateSP.sql#L35048) | — | 0 / 0 | — |
| `CON_UN_CheckMRS_ETF_AllPlan` | [L35857](../../../../ScriptDB/000_4_CreateSP.sql#L35857) | — | 0 / 1 | — |
| `CON_UN_CheckMRS_ETF_OnePlan` | [L35886](../../../../ScriptDB/000_4_CreateSP.sql#L35886) | — | 1 / 0 | — |
| `CON_UN_FundAccount` | [L36899](../../../../ScriptDB/000_4_CreateSP.sql#L36899) | — | 0 / 1 | — |
| `CON_UN_FundAccount_One` | [L36926](../../../../ScriptDB/000_4_CreateSP.sql#L36926) | — | 1 / 0 | — |
| `CON_UN_ReCalcAveragedCostETF` | [L37522](../../../../ScriptDB/000_4_CreateSP.sql#L37522) | — | 0 / 1 | — |
| `CON_VerifyFundPosition` | [L38030](../../../../ScriptDB/000_4_CreateSP.sql#L38030) | — | 0 / 0 | — |
| `CON_VerifyFundPosition_2` | [L38077](../../../../ScriptDB/000_4_CreateSP.sql#L38077) | — | 0 / 0 | — |
| `CON_VerifyFundPosition_ActiveZeroUnit` | [L38137](../../../../ScriptDB/000_4_CreateSP.sql#L38137) | — | 0 / 0 | — |
| `CON_VerifyFundPosition_SetEndDate` | [L38211](../../../../ScriptDB/000_4_CreateSP.sql#L38211) | — | 0 / 0 | — |
| `CON_VerifyFundPosition_ZeroUnitTrx` | [L38272](../../../../ScriptDB/000_4_CreateSP.sql#L38272) | — | 0 / 0 | — |
| `CON_WF_FundAccount` | [L48819](../../../../ScriptDB/000_4_CreateSP.sql#L48819) | — | 2 / 3 | — |
| `CON_WF_FundAccount_Topup_Add` | [L49041](../../../../ScriptDB/000_4_CreateSP.sql#L49041) | — | 0 / 0 | — |
| `CON_WF_FundAccount_Topup_Update` | [L49284](../../../../ScriptDB/000_4_CreateSP.sql#L49284) | — | 0 / 0 | — |
| `CON_WF_FundAccount2` | [L49331](../../../../ScriptDB/000_4_CreateSP.sql#L49331) | — | 0 / 3 | — |
| `CON_WF_FundAccountStep1_Init` | [L49687](../../../../ScriptDB/000_4_CreateSP.sql#L49687) | — | 0 / 0 | — |
| `CON_WF_FundAccountStep2` | [L49708](../../../../ScriptDB/000_4_CreateSP.sql#L49708) | — | 0 / 0 | — |
| `CON_WF_FundAccountSys` | [L49980](../../../../ScriptDB/000_4_CreateSP.sql#L49980) | — | 0 / 1 | — |
| `CON_WF_FundAccountSys_Step1_Init` | [L50065](../../../../ScriptDB/000_4_CreateSP.sql#L50065) | — | 0 / 0 | — |
| `CON_WF_FundAccountSys_Step2` | [L50084](../../../../ScriptDB/000_4_CreateSP.sql#L50084) | — | 0 / 1 | — |
| `CON_WF_FundAccountSys1Plan` | [L50146](../../../../ScriptDB/000_4_CreateSP.sql#L50146) | — | 5 / 1 | — |
| `CON_WF_FundAccountSys1PlanDetail` | [L50349](../../../../ScriptDB/000_4_CreateSP.sql#L50349) | — | 1 / 0 | — |
| `CON_WF_FundAccountSysFixDollarAmountIssue` | [L50435](../../../../ScriptDB/000_4_CreateSP.sql#L50435) | — | 0 / 0 | — |
| `CON_WF_FundAccountSysFixEmptyFundAccountID` | [L50513](../../../../ScriptDB/000_4_CreateSP.sql#L50513) | — | 0 / 1 | — |
| `CON_WF_FundAccountTrxCompStep_One` | [L50555](../../../../ScriptDB/000_4_CreateSP.sql#L50555) | — | 0 / 1 | — |
| `CON_WF_FundAccountTrxStep1_Init` | [L50610](../../../../ScriptDB/000_4_CreateSP.sql#L50610) | — | 0 / 0 | — |
| `CON_WF_FundAccountTrxStep1_Init_Topup` | [L50634](../../../../ScriptDB/000_4_CreateSP.sql#L50634) | — | 0 / 0 | — |
| `CON_WF_FundAccountTrxStep2` | [L50656](../../../../ScriptDB/000_4_CreateSP.sql#L50656) | — | 0 / 1 | — |
| `CON_WF_FundAccountTrxStep2_One` | [L50717](../../../../ScriptDB/000_4_CreateSP.sql#L50717) | — | 1 / 0 | — |
| `CON_WF_FundAccountTrxStep2_One_After` | [L51178](../../../../ScriptDB/000_4_CreateSP.sql#L51178) | — | 0 / 0 | — |
| `CON_WF_FundAccountTrxStep3` | [L51629](../../../../ScriptDB/000_4_CreateSP.sql#L51629) | — | 0 / 1 | — |
| `CON_WF_FundAccountTrxStep3_One` | [L51659](../../../../ScriptDB/000_4_CreateSP.sql#L51659) | — | 1 / 1 | — |
| `CON_WF_FundAccountTrxStep4` | [L51806](../../../../ScriptDB/000_4_CreateSP.sql#L51806) | — | 0 / 1 | — |
| `CON_WF_FundAccountTrxStep4_One` | [L51843](../../../../ScriptDB/000_4_CreateSP.sql#L51843) | — | 1 / 0 | — |
| `CON_WF_FundDef` | [L52204](../../../../ScriptDB/000_4_CreateSP.sql#L52204) | — | 2 / 1 | — |
| `CON_WF_FundDef_FromList` | [L52582](../../../../ScriptDB/000_4_CreateSP.sql#L52582) | — | 1 / 1 | — |
| `CON_WF_FundDef_MoneyProduct` | [L52948](../../../../ScriptDB/000_4_CreateSP.sql#L52948) | — | 0 / 1 | — |
| `CON_WF_FundDef_One` | [L53125](../../../../ScriptDB/000_4_CreateSP.sql#L53125) | — | 0 / 1 | — |
| `CON_WF_FundDef_Topup_Step1` | [L53479](../../../../ScriptDB/000_4_CreateSP.sql#L53479) | — | 0 / 0 | — |
| `CON_WF_FundDef_Topup_Step2` | [L53498](../../../../ScriptDB/000_4_CreateSP.sql#L53498) | — | 0 / 1 | — |
| `CON_WF_FundFact` | [L53523](../../../../ScriptDB/000_4_CreateSP.sql#L53523) | — | 0 / 0 | — |
| `CON_WF_FundTrx` | [L53601](../../../../ScriptDB/000_4_CreateSP.sql#L53601) | — | 3 / 1 | — |
| `CON_WF_FundTrx_One` | [L54144](../../../../ScriptDB/000_4_CreateSP.sql#L54144) | — | 0 / 1 | — |
| `CON_WF_FundTrx_One_Force` | [L54685](../../../../ScriptDB/000_4_CreateSP.sql#L54685) | — | 0 / 0 | — |
| `CON_WF_FundTrx_Topup_Add` | [L55186](../../../../ScriptDB/000_4_CreateSP.sql#L55186) | — | 0 / 1 | — |
| `CON_WF_FundTrx_Topup_Update` | [L55656](../../../../ScriptDB/000_4_CreateSP.sql#L55656) | — | 0 / 0 | — |
| `CON_WF_GIC` | [L56201](../../../../ScriptDB/000_4_CreateSP.sql#L56201) | — | 0 / 0 | — |
| `CON_WF_GIC_One` | [L56425](../../../../ScriptDB/000_4_CreateSP.sql#L56425) | — | 0 / 0 | — |
| `CON_WF_GIC_Product` | [L56625](../../../../ScriptDB/000_4_CreateSP.sql#L56625) | — | 0 / 1 | — |
| `CON_WF_MoveFund2Cash` | [L59645](../../../../ScriptDB/000_4_CreateSP.sql#L59645) | — | 0 / 1 | — |
| `CON_WF_MRSAccountGIC` | [L60208](../../../../ScriptDB/000_4_CreateSP.sql#L60208) | — | 0 / 0 | — |
| `CON_WF_OneRep_OneGIC` | [L64801](../../../../ScriptDB/000_4_CreateSP.sql#L64801) | — | 2 / 0 | — |
| `CON_WF_OneRep_OneMRSGIC` | [L65908](../../../../ScriptDB/000_4_CreateSP.sql#L65908) | — | 2 / 0 | — |
| `CON_WF_OneRep_OnePlanGIC` | [L68566](../../../../ScriptDB/000_4_CreateSP.sql#L68566) | — | 1 / 1 | — |
| `CON_WF_OneRep_Step6_7_GIC` | [L69831](../../../../ScriptDB/000_4_CreateSP.sql#L69831) | — | 0 / 1 | — |
| `CON_WF_Price_All_Fix_ETF` | [L76820](../../../../ScriptDB/000_4_CreateSP.sql#L76820) | — | 0 / 1 | — |
| `CON_WF_Price_One_Fix_ETF` | [L77004](../../../../ScriptDB/000_4_CreateSP.sql#L77004) | — | 1 / 1 | — |
| `CON_WF_RepSetFileID` | [L78952](../../../../ScriptDB/000_4_CreateSP.sql#L78952) | — | 0 / 0 | — |
| `CON_WFront_FundAccount` | [L88170](../../../../ScriptDB/000_4_CreateSP.sql#L88170) | — | 1 / 1 | — |
| `CON_WFront_FundTrx` | [L88377](../../../../ScriptDB/000_4_CreateSP.sql#L88377) | — | 1 / 0 | — |
| `DI_B2B_ETF_NotIN_FG` | [L96844](../../../../ScriptDB/000_4_CreateSP.sql#L96844) | — | 0 / 0 | — |
| `DI_CalcAverageCostFromStart_ETF_2262` | [L97051](../../../../ScriptDB/000_4_CreateSP.sql#L97051) | — | 0 / 0 | — |
| `DI_CalcAverageCostFromStart_ETF_B2B_1` | [L97170](../../../../ScriptDB/000_4_CreateSP.sql#L97170) | — | 2 / 0 | — |
| `DI_CalcAverageCostFromStart_ETF_B2B_All` | [L97276](../../../../ScriptDB/000_4_CreateSP.sql#L97276) | — | 0 / 1 | — |
| `DI_CalcAverageCostFromStart_ETF_B2B_Plan` | [L97304](../../../../ScriptDB/000_4_CreateSP.sql#L97304) | — | 0 / 1 | — |
| `DI_CheckFundRiskVsObj` | [L98826](../../../../ScriptDB/000_4_CreateSP.sql#L98826) | — | 0 / 0 | — |
| `DI_RemoveETFDuplicatedTrx` | [L108299](../../../../ScriptDB/000_4_CreateSP.sql#L108299) | — | 0 / 0 | — |
| `ETF_CompareOmnibusVSClient` | [L110759](../../../../ScriptDB/000_4_CreateSP.sql#L110759) | — | 0 / 0 | — |
| `ETF_RecalcAverageCost` | [L110790](../../../../ScriptDB/000_4_CreateSP.sql#L110790) | — | 2 / 0 | — |
| `ETF_RecalcAverageCostAll` | [L110863](../../../../ScriptDB/000_4_CreateSP.sql#L110863) | — | 0 / 1 | — |
| `ETF_ReProcessOneFile` | [L110915](../../../../ScriptDB/000_4_CreateSP.sql#L110915) | — | 0 / 1 | — |
| `ETF_Scan4ExpiredOrder` | [L110943](../../../../ScriptDB/000_4_CreateSP.sql#L110943) | — | 0 / 1 | — |
| `ETF_SetTradeDateToRecordDate` | [L110990](../../../../ScriptDB/000_4_CreateSP.sql#L110990) | — | 0 / 0 | — |
| `ETFAccountCompareScotia` | [L111016](../../../../ScriptDB/000_4_CreateSP.sql#L111016) | — | 0 / 0 | — |
| `ETFCIDividendProcessOne` | [L111134](../../../../ScriptDB/000_4_CreateSP.sql#L111134) | — | 2 / 3 | — |
| `ETFCIDividendProcessOneX` | [L111442](../../../../ScriptDB/000_4_CreateSP.sql#L111442) | — | 0 / 1 | — |
| `ETFDIVCIFileStats` | [L111463](../../../../ScriptDB/000_4_CreateSP.sql#L111463) | 1 / 1 file | 0 / 0 | [CCIGCashDiv.cs:117](../../../../UBFFImport/CCIGCashDiv.cs#L117) |
| `ETFDIVCIImportDef` | [L111483](../../../../ScriptDB/000_4_CreateSP.sql#L111483) | — | 0 / 0 | — |
| `ETFDIVCIProcessOneRecord` | [L111497](../../../../ScriptDB/000_4_CreateSP.sql#L111497) | — | 0 / 1 | — |
| `ETFDividendProcess` | [L111544](../../../../ScriptDB/000_4_CreateSP.sql#L111544) | — | 0 / 3 | — |
| `ETFDividendProcessOne` | [L111760](../../../../ScriptDB/000_4_CreateSP.sql#L111760) | — | 0 / 3 | — |
| `ETFListTrxOneSymbol` | [L111999](../../../../ScriptDB/000_4_CreateSP.sql#L111999) | — | 0 / 0 | — |
| `ETFProcessManualOne` | [L112045](../../../../ScriptDB/000_4_CreateSP.sql#L112045) | — | 0 / 5 | — |
| `ETFSplit` | [L112321](../../../../ScriptDB/000_4_CreateSP.sql#L112321) | — | 0 / 1 | — |
| `ETFSplitOne` | [L112393](../../../../ScriptDB/000_4_CreateSP.sql#L112393) | — | 1 / 1 | — |
| `ETFTrxListing` | [L112578](../../../../ScriptDB/000_4_CreateSP.sql#L112578) | — | 0 / 0 | — |
| `FMFundAccountAdd` | [L113335](../../../../ScriptDB/000_4_CreateSP.sql#L113335) | — | 0 / 1 | — |
| `FMFundAccountUpdate` | [L113365](../../../../ScriptDB/000_4_CreateSP.sql#L113365) | — | 0 / 1 | — |
| `GIC_GetMaturityValue_DB` | [L114614](../../../../ScriptDB/000_4_CreateSP.sql#L114614) | — | 0 / 0 | — |
| `Init_FundCodeChange` | [L119360](../../../../ScriptDB/000_4_CreateSP.sql#L119360) | — | 0 / 0 | — |
| `Init_FundPositionZeroTrxNot` | [L119383](../../../../ScriptDB/000_4_CreateSP.sql#L119383) | — | 0 / 0 | — |
| `Init_GIC_RefreshTotalInterest` | [L119439](../../../../ScriptDB/000_4_CreateSP.sql#L119439) | — | 0 / 1 | — |
| `Init_ImportFundClass` | [L119654](../../../../ScriptDB/000_4_CreateSP.sql#L119654) | — | 0 / 0 | — |
| `Init_MoveOneFundAccount2Plan` | [L121260](../../../../ScriptDB/000_4_CreateSP.sql#L121260) | — | 0 / 1 | — |
| `Init_RemoveFundPositionNoTrx` | [L122488](../../../../ScriptDB/000_4_CreateSP.sql#L122488) | — | 0 / 1 | — |
| `Init_ResetFundApproved` | [L122530](../../../../ScriptDB/000_4_CreateSP.sql#L122530) | — | 0 / 0 | — |
| `Init_SetFundApproved` | [L123315](../../../../ScriptDB/000_4_CreateSP.sql#L123315) | — | 0 / 0 | — |
| `PHX_CON_ETFTrxStep1` | [L162335](../../../../ScriptDB/000_4_CreateSP.sql#L162335) | — | 0 / 1 | — |
| `PHX_CON_ETFTrxStep2` | [L162376](../../../../ScriptDB/000_4_CreateSP.sql#L162376) | — | 0 / 2 | — |
| `PHX_CON_FixETFGrossAmount4Buy` | [L162406](../../../../ScriptDB/000_4_CreateSP.sql#L162406) | — | 0 / 0 | — |
| `PHX_CON_FundAccountAllPlans` | [L162445](../../../../ScriptDB/000_4_CreateSP.sql#L162445) | — | 0 / 1 | — |
| `PHX_CON_FundAccountOnePlan` | [L162469](../../../../ScriptDB/000_4_CreateSP.sql#L162469) | — | 2 / 0 | — |
| `PHX_CON_FundTrxStep1` | [L162560](../../../../ScriptDB/000_4_CreateSP.sql#L162560) | — | 0 / 0 | — |
| `PHX_CON_FundTrxStep2` | [L162623](../../../../ScriptDB/000_4_CreateSP.sql#L162623) | — | 0 / 0 | — |
| `PHX_CON_FundTrxStep3` | [L162691](../../../../ScriptDB/000_4_CreateSP.sql#L162691) | — | 0 / 1 | — |
| `PHX_CON_FundTrxStep4` | [L162711](../../../../ScriptDB/000_4_CreateSP.sql#L162711) | — | 0 / 1 | — |
| `PHX_CON_FundTrxStep4_0` | [L162735](../../../../ScriptDB/000_4_CreateSP.sql#L162735) | — | 0 / 2 | — |
| `PHX_CON_Trx_ETF_One` | [L163672](../../../../ScriptDB/000_4_CreateSP.sql#L163672) | — | 1 / 0 | — |
| `PHX_CON_Trx_ETF_One_TrnfIn` | [L163904](../../../../ScriptDB/000_4_CreateSP.sql#L163904) | — | 1 / 0 | — |
| `PHX_ListTransferOutIn_ETF` | [L165012](../../../../ScriptDB/000_4_CreateSP.sql#L165012) | — | 0 / 0 | — |
| `PHX_ListTransferOutIn_Fund` | [L165068](../../../../ScriptDB/000_4_CreateSP.sql#L165068) | — | 0 / 0 | — |
| `PSC_Move1FundAccount` | [L165650](../../../../ScriptDB/000_4_CreateSP.sql#L165650) | — | 1 / 0 | — |
| `TrxRecalcAvgOneFundAccount` | [L170823](../../../../ScriptDB/000_4_CreateSP.sql#L170823) | — | 2 / 0 | — |
| `TrxRecalcAvgShareBalanceOneFundAccount` | [L170868](../../../../ScriptDB/000_4_CreateSP.sql#L170868) | — | 8 / 0 | — |
| `TT_FundUnitByDate` | [L171011](../../../../ScriptDB/000_4_CreateSP.sql#L171011) | — | 1 / 1 | — |
| `UBAAFundDefSync` | [L174634](../../../../ScriptDB/000_4_CreateSP.sql#L174634) | — | 3 / 5 | — |
| `UBAAItemFundFactInfo` | [L175276](../../../../ScriptDB/000_4_CreateSP.sql#L175276) | 1 / 1 file | 0 / 0 | [AssetAllocation.cs:1574](../../../../UBClasses/AssetAllocation.cs#L1574) |
| `UBAAPlanCheckFundPosition` | [L175867](../../../../ScriptDB/000_4_CreateSP.sql#L175867) | — | 4 / 1 | — |
| `UBAAPlanVerifyOneModel4OneFund` | [L176661](../../../../ScriptDB/000_4_CreateSP.sql#L176661) | — | 1 / 1 | — |
| `UBActiveFundDef` | [L182401](../../../../ScriptDB/000_4_CreateSP.sql#L182401) | — | 0 / 0 | — |
| `UBAssetCashOneFund` | [L184448](../../../../ScriptDB/000_4_CreateSP.sql#L184448) | — | 1 / 2 | — |
| `UBAssetFundDefMgmtList` | [L184930](../../../../ScriptDB/000_4_CreateSP.sql#L184930) | 1 / 1 file | 0 / 0 | [CAssetByFund.cs:45](../../../../VieFUNDPdf/CAssetByFund.cs#L45) |
| `UBAssetFundDefOneFund` | [L185077](../../../../ScriptDB/000_4_CreateSP.sql#L185077) | — | 1 / 4 | — |
| `UBAssetFundDefOneMgmt` | [L185398](../../../../ScriptDB/000_4_CreateSP.sql#L185398) | 1 / 1 file | 0 / 4 | [CAssetByFund.cs:87](../../../../VieFUNDPdf/CAssetByFund.cs#L87) |
| `UBAssetGICOneMgmt` | [L185824](../../../../ScriptDB/000_4_CreateSP.sql#L185824) | — | 1 / 1 | — |
| `UBAssetGICOneMgmtOneRep` | [L185923](../../../../ScriptDB/000_4_CreateSP.sql#L185923) | — | 1 / 2 | — |
| `UBAssetRecalcFundAll` | [L186427](../../../../ScriptDB/000_4_CreateSP.sql#L186427) | — | 0 / 1 | — |
| `UBAssetRecalcFundOne` | [L186464](../../../../ScriptDB/000_4_CreateSP.sql#L186464) | — | 2 / 0 | — |
| `UBAUAQuarterReportOneRepFundList` | [L187814](../../../../ScriptDB/000_4_CreateSP.sql#L187814) | — | 0 / 0 | — |
| `UBAUAQuarterReportOneRepFundSum` | [L187928](../../../../ScriptDB/000_4_CreateSP.sql#L187928) | — | 0 / 0 | — |
| `UBAuditTrailFundAccount` | [L188947](../../../../ScriptDB/000_4_CreateSP.sql#L188947) | — | 3 / 6 | — |
| `UBAuditTrailFundPosSysPlan` | [L189010](../../../../ScriptDB/000_4_CreateSP.sql#L189010) | — | 3 / 3 | — |
| `UBAuditTrailGICAccount` | [L189231](../../../../ScriptDB/000_4_CreateSP.sql#L189231) | — | 5 / 7 | — |
| `UBAuditTrailGICAccountTrx` | [L189363](../../../../ScriptDB/000_4_CreateSP.sql#L189363) | — | 7 / 7 | — |
| `UBAuditTrailGICEscRate` | [L189446](../../../../ScriptDB/000_4_CreateSP.sql#L189446) | — | 3 / 3 | — |
| `UBAuditTrailGICEscRateReset` | [L189507](../../../../ScriptDB/000_4_CreateSP.sql#L189507) | — | 1 / 1 | — |
| `UBAuditTrailInitAllFundAccounts` | [L189824](../../../../ScriptDB/000_4_CreateSP.sql#L189824) | — | 1 / 1 | — |
| `UBAuditTrailInitAllGICAccounts` | [L189865](../../../../ScriptDB/000_4_CreateSP.sql#L189865) | — | 1 / 1 | — |
| `UBAuditTrailInitOneFundAccount` | [L190279](../../../../ScriptDB/000_4_CreateSP.sql#L190279) | — | 1 / 3 | — |
| `UBAuditTrailInitOneGICAccount` | [L190416](../../../../ScriptDB/000_4_CreateSP.sql#L190416) | — | 1 / 7 | — |
| `UBClientFundPosExport` | [L216066](../../../../ScriptDB/000_4_CreateSP.sql#L216066) | 1 / 1 file | 0 / 1 | [FundAccount.cs:113](../../../../UBExport/FundAccount.cs#L113) |
| `UBClientFundPosExportAll` | [L216236](../../../../ScriptDB/000_4_CreateSP.sql#L216236) | — | 0 / 0 | — |
| `UBClientFundTrxExport` | [L216719](../../../../ScriptDB/000_4_CreateSP.sql#L216719) | 1 / 1 file | 0 / 1 | [Trx.cs:109](../../../../UBExport/Trx.cs#L109) |
| `UBClientListSetSelectionGIC` | [L223802](../../../../ScriptDB/000_4_CreateSP.sql#L223802) | 1 / 1 file | 0 / 2 | [Customer.cs:4480](../../../../UBClasses/Customer.cs#L4480) |
| `UBCompGICClientList` | [L277019](../../../../ScriptDB/000_4_CreateSP.sql#L277019) | — | 0 / 0 | — |
| `UBCompTrend_LowMER_ClientFundList` | [L280261](../../../../ScriptDB/000_4_CreateSP.sql#L280261) | 1 / 1 file | 0 / 0 | [Compliance.cs:5717](../../../../UBClasses/Compliance.cs#L5717) |
| `UBCompTrend_LowMER_HouseHoldFundList` | [L280331](../../../../ScriptDB/000_4_CreateSP.sql#L280331) | 1 / 1 file | 0 / 0 | [Compliance.cs:5772](../../../../UBClasses/Compliance.cs#L5772) |
| `UBCompTrxApprovalFundPosChange` | [L285301](../../../../ScriptDB/000_4_CreateSP.sql#L285301) | — | 1 / 1 | — |
| `UBDailyGICMaturity` | [L295713](../../../../ScriptDB/000_4_CreateSP.sql#L295713) | — | 2 / 0 | — |
| `UBDailySegFundMaturity` | [L296021](../../../../ScriptDB/000_4_CreateSP.sql#L296021) | — | 0 / 0 | — |
| `UBDashBoardAssetAccountByFundBranchGet` | [L296172](../../../../ScriptDB/000_4_CreateSP.sql#L296172) | 1 / 1 file | 0 / 0 | [Dashboard.cs:1417](../../../../UBClasses/Dashboard.cs#L1417) |
| `UBDashBoardAssetAccountByFundGet` | [L296361](../../../../ScriptDB/000_4_CreateSP.sql#L296361) | 1 / 1 file | 0 / 0 | [Dashboard.cs:1290](../../../../UBClasses/Dashboard.cs#L1290) |
| `UBDashBoardAssetAccountByFundRepGet` | [L296703](../../../../ScriptDB/000_4_CreateSP.sql#L296703) | 1 / 1 file | 0 / 0 | [Dashboard.cs:1354](../../../../UBClasses/Dashboard.cs#L1354) |
| `UBDashBoardAssetFamilyOneCategoryGet` | [L300586](../../../../ScriptDB/000_4_CreateSP.sql#L300586) | 1 / 1 file | 0 / 1 | [Dashboard.cs:570](../../../../UBClasses/Dashboard.cs#L570) |
| `UBDashBoardAssetFamilyOneCategoryGetX` | [L300610](../../../../ScriptDB/000_4_CreateSP.sql#L300610) | — | 1 / 0 | — |
| `UBDashBoardAssetGet_Product` | [L302944](../../../../ScriptDB/000_4_CreateSP.sql#L302944) | — | 0 / 1 | — |
| `UBDashBoardAssetGet_Product_Old` | [L302969](../../../../ScriptDB/000_4_CreateSP.sql#L302969) | — | 0 / 0 | — |
| `UBDashBoardAssetGet_ProductX` | [L303233](../../../../ScriptDB/000_4_CreateSP.sql#L303233) | — | 2 / 2 | — |
| `UBDashBoardAssetOneFundAccount` | [L303981](../../../../ScriptDB/000_4_CreateSP.sql#L303981) | — | 1 / 1 | — |
| `UBDashBoardAssetOneGICAccount` | [L304128](../../../../ScriptDB/000_4_CreateSP.sql#L304128) | — | 1 / 1 | — |
| `UBDocAddTaggedFundAccount` | [L312182](../../../../ScriptDB/000_4_CreateSP.sql#L312182) | — | 0 / 2 | — |
| `UBETFComboList` | [L321324](../../../../ScriptDB/000_4_CreateSP.sql#L321324) | — | 0 / 5 | — |
| `UBETFPriceImportDef` | [L321349](../../../../ScriptDB/000_4_CreateSP.sql#L321349) | — | 0 / 0 | — |
| `UBETFPriceImportDefNEO` | [L321362](../../../../ScriptDB/000_4_CreateSP.sql#L321362) | — | 0 / 0 | — |
| `UBETFPriceImportFileClear` | [L321375](../../../../ScriptDB/000_4_CreateSP.sql#L321375) | — | 2 / 0 | — |
| `UBETFPriceImportFileReadOneRecord` | [L321388](../../../../ScriptDB/000_4_CreateSP.sql#L321388) | — | 0 / 2 | — |
| `UBETFPriceImportFileReadOneRecordNEO` | [L321476](../../../../ScriptDB/000_4_CreateSP.sql#L321476) | — | 0 / 1 | — |
| `UBETFPriceImportList` | [L321543](../../../../ScriptDB/000_4_CreateSP.sql#L321543) | 1 / 1 file | 0 / 0 | [ETFPriceImport.cs:36](../../../../UBClasses/ETFPriceImport.cs#L36) |
| `UBETFPriceImportProcess1Record` | [L321641](../../../../ScriptDB/000_4_CreateSP.sql#L321641) | — | 2 / 2 | — |
| `UBETFPriceImportProcessOneFile` | [L321772](../../../../ScriptDB/000_4_CreateSP.sql#L321772) | 1 / 1 file | 0 / 1 | [CETF.cs:32](../../../../UBFFImport/CETF.cs#L32) |
| `UBETFPriceImportProcessTaggedItems` | [L321824](../../../../ScriptDB/000_4_CreateSP.sql#L321824) | — | 0 / 1 | — |
| `UBETFPriceImportSelectionUpdate` | [L321871](../../../../ScriptDB/000_4_CreateSP.sql#L321871) | — | 0 / 0 | — |
| `UBETFPXUpdate` | [L321909](../../../../ScriptDB/000_4_CreateSP.sql#L321909) | — | 1 / 0 | — |
| `UBETFTransferAdd` | [L321939](../../../../ScriptDB/000_4_CreateSP.sql#L321939) | 1 / 1 file | 0 / 4 | [Stock.cs:743](../../../../UBClasses/Stock.cs#L743) |
| `UBETFTrnsf_CalcValues` | [L322148](../../../../ScriptDB/000_4_CreateSP.sql#L322148) | 1 / 1 file | 0 / 1 | [Stock.cs:690](../../../../UBClasses/Stock.cs#L690) |
| `UBETFTrnsf_CalcValues_One` | [L322183](../../../../ScriptDB/000_4_CreateSP.sql#L322183) | — | 2 / 0 | — |
| `UBExportGetFundPosIntermediary` | [L324959](../../../../ScriptDB/000_4_CreateSP.sql#L324959) | — | 0 / 1 | — |
| `UBExportGetFundPosWithKYC` | [L325073](../../../../ScriptDB/000_4_CreateSP.sql#L325073) | — | 0 / 0 | — |
| `UBFFRecAEFundList` | [L343574](../../../../ScriptDB/000_4_CreateSP.sql#L343574) | 1 / 1 file | 0 / 0 | [CAE.cs:354](../../../../UBFFImport/CAE.cs#L354) |
| `UBFormGetGICInfoOne` | [L354650](../../../../ScriptDB/000_4_CreateSP.sql#L354650) | — | 0 / 2 | — |
| `UBFormGetGICTicket` | [L355107](../../../../ScriptDB/000_4_CreateSP.sql#L355107) | — | 0 / 0 | — |
| `UBFormGetGICTicketInfo` | [L355146](../../../../ScriptDB/000_4_CreateSP.sql#L355146) | — | 0 / 0 | — |
| `UBFormGetGICTicketInfoOne` | [L355219](../../../../ScriptDB/000_4_CreateSP.sql#L355219) | — | 0 / 0 | — |
| `UBFSFundAccountAdd` | [L360729](../../../../ScriptDB/000_4_CreateSP.sql#L360729) | — | 2 / 1 | — |
| `UBFSFundAccPosAdd` | [L360781](../../../../ScriptDB/000_4_CreateSP.sql#L360781) | — | 5 / 1 | — |
| `UBFSFundAccPosUpdate` | [L360859](../../../../ScriptDB/000_4_CreateSP.sql#L360859) | — | 0 / 1 | — |
| `UBFundAccInfo` | [L362794](../../../../ScriptDB/000_4_CreateSP.sql#L362794) | 1 / 1 file | 0 / 0 | [FundAccount.cs:1062](../../../../UBClasses/FundAccount.cs#L1062) |
| `UBFundAccMove` | [L362833](../../../../ScriptDB/000_4_CreateSP.sql#L362833) | — | 1 / 1 | — |
| `UBFundAccountAdd` | [L362882](../../../../ScriptDB/000_4_CreateSP.sql#L362882) | — | 2 / 10 | — |
| `UBFundAccountCalcAveragedCost` | [L363345](../../../../ScriptDB/000_4_CreateSP.sql#L363345) | — | 0 / 0 | — |
| `UBFundAccountChangedBuy` | [L363377](../../../../ScriptDB/000_4_CreateSP.sql#L363377) | 1 / 1 file | 0 / 0 | [FundAccount.cs:2269](../../../../UBClasses/FundAccount.cs#L2269) |
| `UBFundAccountChangedSell` | [L363438](../../../../ScriptDB/000_4_CreateSP.sql#L363438) | 1 / 1 file | 0 / 0 | [FundAccount.cs:2323](../../../../UBClasses/FundAccount.cs#L2323) |
| `UBFundAccountDetailX` | [L363536](../../../../ScriptDB/000_4_CreateSP.sql#L363536) | — | 0 / 0 | — |
| `UBFundAccountDuplicate` | [L363666](../../../../ScriptDB/000_4_CreateSP.sql#L363666) | — | 1 / 1 | — |
| `UBFundAccountHasFirstTrx` | [L363733](../../../../ScriptDB/000_4_CreateSP.sql#L363733) | 1 / 1 file | 0 / 0 | [FundAccount.cs:2377](../../../../UBClasses/FundAccount.cs#L2377) |
| `UBFundAccountIDList` | [L363761](../../../../ScriptDB/000_4_CreateSP.sql#L363761) | 1 / 1 file | 0 / 0 | [FundAccount.cs:89](../../../../UBClasses/FundAccount.cs#L89) |
| `UBFundAccountIncome` | [L363795](../../../../ScriptDB/000_4_CreateSP.sql#L363795) | — | 0 / 0 | — |
| `UBFundAccountIncomeCalc` | [L363832](../../../../ScriptDB/000_4_CreateSP.sql#L363832) | — | 1 / 0 | — |
| `UBFundAccountMoveAllFromPlan2Plan` | [L363862](../../../../ScriptDB/000_4_CreateSP.sql#L363862) | — | 0 / 1 | — |
| `UBFundAccountMoveFromPlan2Plan` | [L363915](../../../../ScriptDB/000_4_CreateSP.sql#L363915) | 1 / 1 file | 2 / 1 | [Plan.cs:3363](../../../../UBClasses/Plan.cs#L3363) |
| `UBFundAccountMoveTrxFromPos2Pos` | [L364097](../../../../ScriptDB/000_4_CreateSP.sql#L364097) | 1 / 1 file | 1 / 1 | [Plan.cs:3409](../../../../UBClasses/Plan.cs#L3409) |
| `UBFundAccountMoveTrxFromPos2PosWithDate` | [L364215](../../../../ScriptDB/000_4_CreateSP.sql#L364215) | — | 0 / 0 | — |
| `UBFundAccountNoActivity` | [L364263](../../../../ScriptDB/000_4_CreateSP.sql#L364263) | — | 0 / 0 | — |
| `UBFundAccountPerformanceX` | [L364323](../../../../ScriptDB/000_4_CreateSP.sql#L364323) | — | 0 / 0 | — |
| `UBFundAccountPosAvCostList` | [L364432](../../../../ScriptDB/000_4_CreateSP.sql#L364432) | 1 / 1 file | 1 / 0 | [FundAccount.cs:2970](../../../../UBClasses/FundAccount.cs#L2970) |
| `UBFundAccountPosAvgCostItemInfo` | [L364461](../../../../ScriptDB/000_4_CreateSP.sql#L364461) | 1 / 1 file | 0 / 0 | [FundAccount.cs:2925](../../../../UBClasses/FundAccount.cs#L2925) |
| `UBFundAccountPosAvgCostItemRemove` | [L364488](../../../../ScriptDB/000_4_CreateSP.sql#L364488) | 1 / 1 file | 0 / 0 | [FundAccount.cs:3058](../../../../UBClasses/FundAccount.cs#L3058) |
| `UBFundAccountPosAvgCostItemUpdate` | [L364514](../../../../ScriptDB/000_4_CreateSP.sql#L364514) | 1 / 1 file | 0 / 0 | [FundAccount.cs:3012](../../../../UBClasses/FundAccount.cs#L3012) |
| `UBFundAccountPosFixMerger00` | [L364660](../../../../ScriptDB/000_4_CreateSP.sql#L364660) | — | 0 / 1 | — |
| `UBFundAccountPosFixMerger01` | [L364700](../../../../ScriptDB/000_4_CreateSP.sql#L364700) | — | 1 / 0 | — |
| `UBFundAccountPositionActivate` | [L364749](../../../../ScriptDB/000_4_CreateSP.sql#L364749) | 1 / 1 file | 0 / 4 | [FundAccount.cs:1320](../../../../UBClasses/FundAccount.cs#L1320) |
| `UBFundAccountPositionCheckSwitch` | [L364879](../../../../ScriptDB/000_4_CreateSP.sql#L364879) | — | 1 / 0 | — |
| `UBFundAccountPositionCodeChange` | [L364921](../../../../ScriptDB/000_4_CreateSP.sql#L364921) | — | 0 / 1 | — |
| `UBFundAccountPositionCodeChange1Pos` | [L364949](../../../../ScriptDB/000_4_CreateSP.sql#L364949) | — | 1 / 0 | — |
| `UBFundAccountPositionDelete` | [L365071](../../../../ScriptDB/000_4_CreateSP.sql#L365071) | 1 / 1 file | 2 / 0 | [FundAccount.cs:1167](../../../../UBClasses/FundAccount.cs#L1167) |
| `UBFundAccountPositionDeleteAll` | [L365145](../../../../ScriptDB/000_4_CreateSP.sql#L365145) | 1 / 1 file | 1 / 0 | [FundAccount.cs:1269](../../../../UBClasses/FundAccount.cs#L1269) |
| `UBFundAccountPositionFixSequence` | [L365203](../../../../ScriptDB/000_4_CreateSP.sql#L365203) | — | 1 / 1 | — |
| `UBFundAccountPositionGetID` | [L365310](../../../../ScriptDB/000_4_CreateSP.sql#L365310) | — | 2 / 0 | — |
| `UBFundAccountPositionGetParamsOneDay` | [L365353](../../../../ScriptDB/000_4_CreateSP.sql#L365353) | — | 1 / 0 | — |
| `UBFundAccountPositionInactivate` | [L365406](../../../../ScriptDB/000_4_CreateSP.sql#L365406) | — | 2 / 5 | — |
| `UBFundAccountPositionMergeOne` | [L365492](../../../../ScriptDB/000_4_CreateSP.sql#L365492) | — | 1 / 1 | — |
| `UBFundAccountPositionMergeStep1` | [L365731](../../../../ScriptDB/000_4_CreateSP.sql#L365731) | — | 0 / 0 | — |
| `UBFundAccountPositionMergeStep2` | [L365755](../../../../ScriptDB/000_4_CreateSP.sql#L365755) | — | 0 / 0 | — |
| `UBFundAccountPositionMergeStep3` | [L365778](../../../../ScriptDB/000_4_CreateSP.sql#L365778) | — | 0 / 0 | — |
| `UBFundAccountPositionMergeStep4` | [L365824](../../../../ScriptDB/000_4_CreateSP.sql#L365824) | — | 0 / 0 | — |
| `UBFundAccountPositionRefreshException` | [L365870](../../../../ScriptDB/000_4_CreateSP.sql#L365870) | 1 / 1 file | 4 / 0 | [FundAccount.cs:1935](../../../../UBClasses/FundAccount.cs#L1935) |
| `UBFundAccountPositionRemoveDivTrxOnTransDay` | [L365940](../../../../ScriptDB/000_4_CreateSP.sql#L365940) | — | 0 / 1 | — |
| `UBFundAccountPositionRemoveDupTrx` | [L366011](../../../../ScriptDB/000_4_CreateSP.sql#L366011) | — | 0 / 1 | — |
| `UBFundAccountPositionRemoveET` | [L366082](../../../../ScriptDB/000_4_CreateSP.sql#L366082) | — | 0 / 1 | — |
| `UBFundAccountPositionSetSwitchDate` | [L366147](../../../../ScriptDB/000_4_CreateSP.sql#L366147) | — | 0 / 0 | — |
| `UBFundAccountPositionTMPAdd` | [L366173](../../../../ScriptDB/000_4_CreateSP.sql#L366173) | — | 1 / 0 | — |
| `UBFundAccountPositionTMPCalc` | [L366219](../../../../ScriptDB/000_4_CreateSP.sql#L366219) | — | 1 / 3 | — |
| `UBFundAccountPositionTMPGet` | [L366342](../../../../ScriptDB/000_4_CreateSP.sql#L366342) | — | 53 / 2 | — |
| `UBFundAccountPositionTMPInitOnePlan` | [L366463](../../../../ScriptDB/000_4_CreateSP.sql#L366463) | — | 47 / 1 | — |
| `UBFundAccountPositionTMPReset` | [L366516](../../../../ScriptDB/000_4_CreateSP.sql#L366516) | — | 1 / 0 | — |
| `UBFundAccountPositionTMPSelect` | [L366555](../../../../ScriptDB/000_4_CreateSP.sql#L366555) | — | 0 / 1 | — |
| `UBFundAccountPositionUpdateTrx` | [L366588](../../../../ScriptDB/000_4_CreateSP.sql#L366588) | 1 / 1 file | 0 / 0 | [FundAccount.cs:1836](../../../../UBClasses/FundAccount.cs#L1836) |
| `UBFundAccountPositionUpdateUnit` | [L366628](../../../../ScriptDB/000_4_CreateSP.sql#L366628) | — | 0 / 0 | — |
| `UBFundAccountPositionVerify` | [L366660](../../../../ScriptDB/000_4_CreateSP.sql#L366660) | — | 1 / 1 | — |
| `UBFundAccountPosList` | [L366695](../../../../ScriptDB/000_4_CreateSP.sql#L366695) | 1 / 1 file | 0 / 0 | [FundAccount.cs:1793](../../../../UBClasses/FundAccount.cs#L1793) |
| `UBFundAccountPosListDSCOnly` | [L366721](../../../../ScriptDB/000_4_CreateSP.sql#L366721) | — | 0 / 0 | — |
| `UBFundAccountPosMoveFromAccount2Account` | [L366745](../../../../ScriptDB/000_4_CreateSP.sql#L366745) | — | 0 / 0 | — |
| `UBFundAccountPosProcess` | [L366793](../../../../ScriptDB/000_4_CreateSP.sql#L366793) | — | 0 / 1 | — |
| `UBFundAccountPosRefreshWithLastTrx` | [L366863](../../../../ScriptDB/000_4_CreateSP.sql#L366863) | — | 10 / 0 | — |
| `UBFundAccountPosSFItemInfo` | [L367377](../../../../ScriptDB/000_4_CreateSP.sql#L367377) | 1 / 1 file | 0 / 0 | [FundAccount.cs:2738](../../../../UBClasses/FundAccount.cs#L2738) |
| `UBFundAccountPosSFItemRemove` | [L367407](../../../../ScriptDB/000_4_CreateSP.sql#L367407) | 1 / 1 file | 0 / 0 | [FundAccount.cs:2877](../../../../UBClasses/FundAccount.cs#L2877) |
| `UBFundAccountPosSFItemUpdate` | [L367433](../../../../ScriptDB/000_4_CreateSP.sql#L367433) | 1 / 1 file | 0 / 0 | [FundAccount.cs:2824](../../../../UBClasses/FundAccount.cs#L2824) |
| `UBFundAccountPosSFList` | [L367491](../../../../ScriptDB/000_4_CreateSP.sql#L367491) | 1 / 1 file | 1 / 0 | [FundAccount.cs:2782](../../../../UBClasses/FundAccount.cs#L2782) |
| `UBFundAccountPosSFSync` | [L367523](../../../../ScriptDB/000_4_CreateSP.sql#L367523) | — | 0 / 0 | — |
| `UBFundAccountPosSyncZeroBalance` | [L367565](../../../../ScriptDB/000_4_CreateSP.sql#L367565) | — | 0 / 0 | — |
| `UBFundAccountPosSyncZeroBalance2` | [L367649](../../../../ScriptDB/000_4_CreateSP.sql#L367649) | — | 0 / 0 | — |
| `UBFundAccountPosUnitBalance` | [L367735](../../../../ScriptDB/000_4_CreateSP.sql#L367735) | — | 0 / 0 | — |
| `UBFundAccountPosUnitBalanceMKV` | [L367812](../../../../ScriptDB/000_4_CreateSP.sql#L367812) | — | 1 / 0 | — |
| `UBFundAccountPosUnitBalanceX` | [L367882](../../../../ScriptDB/000_4_CreateSP.sql#L367882) | — | 1 / 0 | — |
| `UBFundAccountPriceListX` | [L367971](../../../../ScriptDB/000_4_CreateSP.sql#L367971) | — | 0 / 1 | — |
| `UBFundAccountReCalcAveragedCost` | [L368052](../../../../ScriptDB/000_4_CreateSP.sql#L368052) | — | 2 / 0 | — |
| `UBFundAccountRefresh1Plan` | [L368072](../../../../ScriptDB/000_4_CreateSP.sql#L368072) | — | 1 / 0 | — |
| `UBFundAccountTrxDetailX` | [L368117](../../../../ScriptDB/000_4_CreateSP.sql#L368117) | — | 0 / 0 | — |
| `UBFundAccountTrxListX` | [L368269](../../../../ScriptDB/000_4_CreateSP.sql#L368269) | — | 0 / 0 | — |
| `UBFundAccountUnitList` | [L368360](../../../../ScriptDB/000_4_CreateSP.sql#L368360) | — | 0 / 0 | — |
| `UBFundAccountUnitListDetail` | [L368450](../../../../ScriptDB/000_4_CreateSP.sql#L368450) | — | 0 / 0 | — |
| `UBFundAccountUpdate` | [L368541](../../../../ScriptDB/000_4_CreateSP.sql#L368541) | — | 2 / 13 | — |
| `UBFundAccountUpdateIDFirstPurchase` | [L368997](../../../../ScriptDB/000_4_CreateSP.sql#L368997) | — | 2 / 0 | — |
| `UBFundAccPosUpdate` | [L369092](../../../../ScriptDB/000_4_CreateSP.sql#L369092) | — | 1 / 1 | — |
| `UBFundAccPosUpdateUnits` | [L369142](../../../../ScriptDB/000_4_CreateSP.sql#L369142) | — | 0 / 0 | — |
| `UBFundAccSchedule_AA_Scan` | [L369187](../../../../ScriptDB/000_4_CreateSP.sql#L369187) | — | 0 / 1 | — |
| `UBFundAccSchedule_AA_ScanOne` | [L369219](../../../../ScriptDB/000_4_CreateSP.sql#L369219) | — | 2 / 1 | — |
| `UBFundAccSchedule_AA_ScanOnePlan` | [L369281](../../../../ScriptDB/000_4_CreateSP.sql#L369281) | — | 3 / 2 | — |
| `UBFundAccSchedule_AA_ScanOneRRIF` | [L369314](../../../../ScriptDB/000_4_CreateSP.sql#L369314) | — | 1 / 1 | — |
| `UBFundAccScheduleAdd` | [L369379](../../../../ScriptDB/000_4_CreateSP.sql#L369379) | — | 1 / 6 | — |
| `UBFundAccScheduleAddUI` | [L369505](../../../../ScriptDB/000_4_CreateSP.sql#L369505) | — | 0 / 10 | — |
| `UBFundAccScheduleUpdate` | [L369961](../../../../ScriptDB/000_4_CreateSP.sql#L369961) | — | 1 / 0 | — |
| `UBFundAccScheduleUpdateF` | [L369995](../../../../ScriptDB/000_4_CreateSP.sql#L369995) | — | 0 / 0 | — |
| `UBFundAccScheduleUpdateUI` | [L370025](../../../../ScriptDB/000_4_CreateSP.sql#L370025) | — | 0 / 11 | — |
| `UBFundAccUpdate` | [L370496](../../../../ScriptDB/000_4_CreateSP.sql#L370496) | — | 1 / 1 | — |
| `UBFundActiveNoPrice` | [L370563](../../../../ScriptDB/000_4_CreateSP.sql#L370563) | — | 0 / 0 | — |
| `UBFundAllocationList` | [L370583](../../../../ScriptDB/000_4_CreateSP.sql#L370583) | — | 2 / 0 | — |
| `UBFundAllocationListTMP` | [L370630](../../../../ScriptDB/000_4_CreateSP.sql#L370630) | 1 / 1 file | 2 / 0 | [FundDef.cs:4093](../../../../UBClasses/FundDef.cs#L4093) |
| `UBFundAllocationListTMP_ItemInfo` | [L370666](../../../../ScriptDB/000_4_CreateSP.sql#L370666) | 1 / 1 file | 0 / 0 | [FundDef.cs:4144](../../../../UBClasses/FundDef.cs#L4144) |
| `UBFundAvgCostAdd` | [L370831](../../../../ScriptDB/000_4_CreateSP.sql#L370831) | — | 0 / 0 | — |
| `UBFundBareTrusteeList` | [L370868](../../../../ScriptDB/000_4_CreateSP.sql#L370868) | — | 2 / 0 | — |
| `UBFundClassList` | [L370898](../../../../ScriptDB/000_4_CreateSP.sql#L370898) | 1 / 1 file | 8 / 0 | [FundDef.cs:1979](../../../../UBClasses/FundDef.cs#L1979) |
| `UBFundCodeByID` | [L370982](../../../../ScriptDB/000_4_CreateSP.sql#L370982) | 1 / 1 file | 0 / 0 | [FundDef.cs:2467](../../../../UBClasses/FundDef.cs#L2467) |
| `UBFundCurrencyList` | [L371017](../../../../ScriptDB/000_4_CreateSP.sql#L371017) | — | 9 / 0 | — |
| `UBFundDefAAAdd` | [L371050](../../../../ScriptDB/000_4_CreateSP.sql#L371050) | 1 / 1 file | 0 / 0 | [PanelFundassetAloc.aspx.cs:132](../../../../WebApp/Main/PanelFundassetAloc.aspx.cs#L132) |
| `UBFundDefAAInfo` | [L371137](../../../../ScriptDB/000_4_CreateSP.sql#L371137) | 1 / 1 file | 0 / 0 | [FundDef.cs:1500](../../../../UBClasses/FundDef.cs#L1500) |
| `UBFundDefAARemove` | [L371166](../../../../ScriptDB/000_4_CreateSP.sql#L371166) | 1 / 1 file | 0 / 0 | [PanelFundassetAloc.aspx.cs:261](../../../../WebApp/Main/PanelFundassetAloc.aspx.cs#L261) |
| `UBFundDefAdd` | [L371209](../../../../ScriptDB/000_4_CreateSP.sql#L371209) | — | 11 / 5 | — |
| `UBFundDefAddInit` | [L371444](../../../../ScriptDB/000_4_CreateSP.sql#L371444) | — | 0 / 13 | — |
| `UBFundDefAddMissingDone` | [L371503](../../../../ScriptDB/000_4_CreateSP.sql#L371503) | — | 1 / 0 | — |
| `UBFundDefAllocationDescriptionList` | [L371550](../../../../ScriptDB/000_4_CreateSP.sql#L371550) | — | 0 / 0 | — |
| `UBFundDefAllocationOKTMP` | [L371568](../../../../ScriptDB/000_4_CreateSP.sql#L371568) | — | 0 / 0 | — |
| `UBFundDefAllocationRemoveTMP` | [L371633](../../../../ScriptDB/000_4_CreateSP.sql#L371633) | — | 0 / 1 | — |
| `UBFundDefAllocationTypeID` | [L371651](../../../../ScriptDB/000_4_CreateSP.sql#L371651) | — | 1 / 0 | — |
| `UBFundDefAllocationUpdate` | [L371671](../../../../ScriptDB/000_4_CreateSP.sql#L371671) | — | 1 / 0 | — |
| `UBFundDefAllocationUpdateTMP` | [L371702](../../../../ScriptDB/000_4_CreateSP.sql#L371702) | — | 0 / 1 | — |
| `UBFundDefAssignDSC2FE` | [L371739](../../../../ScriptDB/000_4_CreateSP.sql#L371739) | — | 0 / 0 | — |
| `UBFundDefAuditTrailCheck` | [L371779](../../../../ScriptDB/000_4_CreateSP.sql#L371779) | — | 0 / 1 | — |
| `UBFundDefAuditTrailHeaderAdd` | [L371796](../../../../ScriptDB/000_4_CreateSP.sql#L371796) | — | 16 / 0 | — |
| `UBFundDefAuditTrailHeaderEnd` | [L371819](../../../../ScriptDB/000_4_CreateSP.sql#L371819) | — | 15 / 0 | — |
| `UBFundDefAuditTrailInitBase` | [L371836](../../../../ScriptDB/000_4_CreateSP.sql#L371836) | — | 0 / 1 | — |
| `UBFundDefAuditTrailInitBaseAddInvObjPct` | [L371860](../../../../ScriptDB/000_4_CreateSP.sql#L371860) | — | 0 / 0 | — |
| `UBFundDefAuditTrailInitBaseFix` | [L371915](../../../../ScriptDB/000_4_CreateSP.sql#L371915) | — | 0 / 1 | — |
| `UBFundDefAuditTrailInitBaseOneFund` | [L371939](../../../../ScriptDB/000_4_CreateSP.sql#L371939) | — | 1 / 0 | — |
| `UBFundDefAuditTrailInitBaseOneFundBulk` | [L372506](../../../../ScriptDB/000_4_CreateSP.sql#L372506) | — | 1 / 0 | — |
| `UBFundDefAuditTrailInitBaseOneFundBulkFix` | [L372936](../../../../ScriptDB/000_4_CreateSP.sql#L372936) | — | 1 / 0 | — |
| `UBFundDefAuditTrailMerger` | [L373175](../../../../ScriptDB/000_4_CreateSP.sql#L373175) | — | 3 / 2 | — |
| `UBFundDefAuditTrailSaveMain` | [L373227](../../../../ScriptDB/000_4_CreateSP.sql#L373227) | — | 6 / 4 | — |
| `UBFundDefAuditTrailSaveOne` | [L373442](../../../../ScriptDB/000_4_CreateSP.sql#L373442) | — | 7 / 0 | — |
| `UBFundDefAuditTrailSavePerf` | [L373478](../../../../ScriptDB/000_4_CreateSP.sql#L373478) | — | 2 / 3 | — |
| `UBFundDefAuditTrailSaveRates` | [L373597](../../../../ScriptDB/000_4_CreateSP.sql#L373597) | — | 6 / 3 | — |
| `UBFundDefAuditTrailSaveRiskInvObj` | [L373681](../../../../ScriptDB/000_4_CreateSP.sql#L373681) | — | 2 / 3 | — |
| `UBFundDefCAAAdd` | [L373786](../../../../ScriptDB/000_4_CreateSP.sql#L373786) | 1 / 1 file | 0 / 0 | [PanelFundChildAA.aspx.cs:122](../../../../WebApp/Main/PanelFundChildAA.aspx.cs#L122) |
| `UBFundDefCAAInfo` | [L373826](../../../../ScriptDB/000_4_CreateSP.sql#L373826) | 1 / 1 file | 0 / 0 | [FundDef.cs:1543](../../../../UBClasses/FundDef.cs#L1543) |
| `UBFundDefCAARemove` | [L373854](../../../../ScriptDB/000_4_CreateSP.sql#L373854) | 1 / 1 file | 0 / 0 | [PanelFundChildAA.aspx.cs:187](../../../../WebApp/Main/PanelFundChildAA.aspx.cs#L187) |
| `UBFundDefComboList1` | [L373881](../../../../ScriptDB/000_4_CreateSP.sql#L373881) | — | 0 / 5 | — |
| `UBFundDefComboList2` | [L373899](../../../../ScriptDB/000_4_CreateSP.sql#L373899) | — | 0 / 3 | — |
| `UBFundDefExistVerify` | [L373921](../../../../ScriptDB/000_4_CreateSP.sql#L373921) | — | 0 / 0 | — |
| `UBFundDefFD_TCR_End` | [L373971](../../../../ScriptDB/000_4_CreateSP.sql#L373971) | — | 0 / 0 | — |
| `UBFundDefFD_TCR_Update` | [L373988](../../../../ScriptDB/000_4_CreateSP.sql#L373988) | — | 0 / 1 | — |
| `UBFundDefFDAllocationEnd` | [L374056](../../../../ScriptDB/000_4_CreateSP.sql#L374056) | — | 0 / 0 | — |
| `UBFundDefFDAllocationUpdate` | [L374077](../../../../ScriptDB/000_4_CreateSP.sql#L374077) | — | 0 / 3 | — |
| `UBFundDefFDInfoUpdate` | [L374138](../../../../ScriptDB/000_4_CreateSP.sql#L374138) | — | 0 / 7 | — |
| `UBFundDefFDInfoUpdate_TBD` | [L374847](../../../../ScriptDB/000_4_CreateSP.sql#L374847) | — | 0 / 7 | — |
| `UBFundDefFDManagerEnd` | [L375513](../../../../ScriptDB/000_4_CreateSP.sql#L375513) | — | 0 / 0 | — |
| `UBFundDefFDManagerUpdate` | [L375558](../../../../ScriptDB/000_4_CreateSP.sql#L375558) | — | 0 / 1 | — |
| `UBFundDefFDPriceUpdate` | [L375622](../../../../ScriptDB/000_4_CreateSP.sql#L375622) | — | 0 / 2 | — |
| `UBFundDefFDXPriceUpdate` | [L375690](../../../../ScriptDB/000_4_CreateSP.sql#L375690) | — | 0 / 2 | — |
| `UBFundDefListAsset` | [L375742](../../../../ScriptDB/000_4_CreateSP.sql#L375742) | — | 0 / 0 | — |
| `UBFundDefMerge` | [L375799](../../../../ScriptDB/000_4_CreateSP.sql#L375799) | 1 / 1 file | 1 / 1 | [CAE.cs:429](../../../../UBFFImport/CAE.cs#L429) |
| `UBFundDefMergePrice` | [L375935](../../../../ScriptDB/000_4_CreateSP.sql#L375935) | — | 2 / 0 | — |
| `UBFundDefModelAdd` | [L376030](../../../../ScriptDB/000_4_CreateSP.sql#L376030) | 2 / 2 file | 0 / 0 | [PanelFundModel.aspx.cs:161](../../../../WebApp/Main/PanelFundModel.aspx.cs#L161) |
| `UBFundDefModelInfo` | [L376140](../../../../ScriptDB/000_4_CreateSP.sql#L376140) | 1 / 1 file | 0 / 0 | [FundDef.cs:1458](../../../../UBClasses/FundDef.cs#L1458) |
| `UBFundDefModelRemove` | [L376182](../../../../ScriptDB/000_4_CreateSP.sql#L376182) | 2 / 2 file | 0 / 0 | [PanelFundModel.aspx.cs:362](../../../../WebApp/Main/PanelFundModel.aspx.cs#L362) |
| `UBFundDefName2MixCase` | [L376207](../../../../ScriptDB/000_4_CreateSP.sql#L376207) | — | 0 / 0 | — |
| `UBFundDefPerformanceUpdate` | [L376236](../../../../ScriptDB/000_4_CreateSP.sql#L376236) | 1 / 1 file | 0 / 4 | [FundDef.cs:3930](../../../../UBClasses/FundDef.cs#L3930) |
| `UBFundDefPrice` | [L376744](../../../../ScriptDB/000_4_CreateSP.sql#L376744) | — | 1 / 0 | — |
| `UBFundDefPriceTrend` | [L376779](../../../../ScriptDB/000_4_CreateSP.sql#L376779) | — | 3 / 0 | — |
| `UBFundDefPXInfo` | [L376814](../../../../ScriptDB/000_4_CreateSP.sql#L376814) | 2 / 2 file | 0 / 0 | [PanelFundPriceAdd.aspx.cs:71](../../../../WebApp/Main/PanelFundPriceAdd.aspx.cs#L71) |
| `UBFundDefPXRemove` | [L376838](../../../../ScriptDB/000_4_CreateSP.sql#L376838) | 2 / 2 file | 0 / 1 | [PanelFundPriceAdd.aspx.cs:336](../../../../WebApp/Main/PanelFundPriceAdd.aspx.cs#L336) |
| `UBFundDefPXUpdate` | [L376915](../../../../ScriptDB/000_4_CreateSP.sql#L376915) | 2 / 2 file | 7 / 0 | [PanelFundPriceAdd.aspx.cs:202](../../../../WebApp/Main/PanelFundPriceAdd.aspx.cs#L202) |
| `UBFundDefPXUpdate2` | [L377079](../../../../ScriptDB/000_4_CreateSP.sql#L377079) | — | 10 / 0 | — |
| `UBFundDefRemove` | [L377228](../../../../ScriptDB/000_4_CreateSP.sql#L377228) | 1 / 1 file | 0 / 0 | [FundSetup.aspx.cs:1872](../../../../WebApp/Main/FundSetup.aspx.cs#L1872) |
| `UBFundDefResetApproved4AssetOnly` | [L377289](../../../../ScriptDB/000_4_CreateSP.sql#L377289) | — | 0 / 0 | — |
| `UBFundDefRiskList` | [L377311](../../../../ScriptDB/000_4_CreateSP.sql#L377311) | 1 / 1 file | 0 / 0 | [FundDef.cs:2039](../../../../UBClasses/FundDef.cs#L2039) |
| `UBFundDefRiskRatingHistoryUpdate` | [L377340](../../../../ScriptDB/000_4_CreateSP.sql#L377340) | — | 5 / 0 | — |
| `UBFundDefSearchCriteriaSave` | [L377388](../../../../ScriptDB/000_4_CreateSP.sql#L377388) | — | 1 / 0 | — |
| `UBFundDefSelectionUpdate` | [L377512](../../../../ScriptDB/000_4_CreateSP.sql#L377512) | — | 0 / 0 | — |
| `UBFundDefSetApprove` | [L377547](../../../../ScriptDB/000_4_CreateSP.sql#L377547) | — | 0 / 0 | — |
| `UBFundDefSetUnapprovedNonActive` | [L377601](../../../../ScriptDB/000_4_CreateSP.sql#L377601) | — | 0 / 0 | — |
| `UBFundDefTCRInfo` | [L377622](../../../../ScriptDB/000_4_CreateSP.sql#L377622) | — | 0 / 0 | — |
| `UBFundDefTCRItemAdd` | [L377645](../../../../ScriptDB/000_4_CreateSP.sql#L377645) | 1 / 1 file | 0 / 0 | [FundDef.cs:4745](../../../../UBClasses/FundDef.cs#L4745) |
| `UBFundDefTCRItemInfo` | [L377688](../../../../ScriptDB/000_4_CreateSP.sql#L377688) | — | 0 / 0 | — |
| `UBFundDefTCRItemRemove` | [L377709](../../../../ScriptDB/000_4_CreateSP.sql#L377709) | 1 / 1 file | 0 / 0 | [FundDef.cs:4844](../../../../UBClasses/FundDef.cs#L4844) |
| `UBFundDefTCRItemUpdate` | [L377730](../../../../ScriptDB/000_4_CreateSP.sql#L377730) | 1 / 1 file | 0 / 0 | [FundDef.cs:4795](../../../../UBClasses/FundDef.cs#L4795) |
| `UBFundDefTCRList` | [L377769](../../../../ScriptDB/000_4_CreateSP.sql#L377769) | 1 / 1 file | 0 / 0 | [FundDef.cs:4890](../../../../UBClasses/FundDef.cs#L4890) |
| `UBFundDefUpdate` | [L377840](../../../../ScriptDB/000_4_CreateSP.sql#L377840) | — | 0 / 6 | — |
| `UBFundDivFrequencyList` | [L378180](../../../../ScriptDB/000_4_CreateSP.sql#L378180) | — | 1 / 0 | — |
| `UBFundEligibilityList` | [L378210](../../../../ScriptDB/000_4_CreateSP.sql#L378210) | — | 0 / 0 | — |
| `UBFundFactAddTaggedItems` | [L378241](../../../../ScriptDB/000_4_CreateSP.sql#L378241) | 1 / 1 file | 0 / 1 | [Document.cs:2974](../../../../UBClasses/Document.cs#L2974) |
| `UBFundFactAuditTrail` | [L378332](../../../../ScriptDB/000_4_CreateSP.sql#L378332) | — | 2 / 3 | — |
| `UBFundFactClientInfo` | [L378377](../../../../ScriptDB/000_4_CreateSP.sql#L378377) | — | 0 / 0 | — |
| `UBFundFactDeliverAllClients` | [L378402](../../../../ScriptDB/000_4_CreateSP.sql#L378402) | — | 0 / 1 | — |
| `UBFundFactDeliverItem` | [L378431](../../../../ScriptDB/000_4_CreateSP.sql#L378431) | — | 3 / 0 | — |
| `UBFundFactDeliverItemX` | [L378674](../../../../ScriptDB/000_4_CreateSP.sql#L378674) | — | 1 / 0 | — |
| `UBFundFactDeliverOneClient` | [L378904](../../../../ScriptDB/000_4_CreateSP.sql#L378904) | — | 1 / 0 | — |
| `UBFundFactDeliverTagged` | [L379106](../../../../ScriptDB/000_4_CreateSP.sql#L379106) | — | 0 / 1 | — |
| `UBFundFactDeliverTagged1Client1Method` | [L379171](../../../../ScriptDB/000_4_CreateSP.sql#L379171) | — | 1 / 0 | — |
| `UBFundFactDeliveryList` | [L379397](../../../../ScriptDB/000_4_CreateSP.sql#L379397) | — | 3 / 0 | — |
| `UBFundFactFDParams` | [L379422](../../../../ScriptDB/000_4_CreateSP.sql#L379422) | — | 0 / 1 | — |
| `UBFundFactFDParamsByFundPos` | [L379475](../../../../ScriptDB/000_4_CreateSP.sql#L379475) | — | 0 / 2 | — |
| `UBFundFactFDUpdateOneDoc` | [L379530](../../../../ScriptDB/000_4_CreateSP.sql#L379530) | — | 0 / 4 | — |
| `UBFundFactFundCodeByID` | [L379731](../../../../ScriptDB/000_4_CreateSP.sql#L379731) | — | 0 / 0 | — |
| `UBFundFactInfo` | [L379797](../../../../ScriptDB/000_4_CreateSP.sql#L379797) | 1 / 1 file | 3 / 0 | [FundDef.cs:2085](../../../../UBClasses/FundDef.cs#L2085) |
| `UBFundFactInfoBundle` | [L379892](../../../../ScriptDB/000_4_CreateSP.sql#L379892) | — | 1 / 0 | — |
| `UBFundFactInfoByID` | [L379955](../../../../ScriptDB/000_4_CreateSP.sql#L379955) | 1 / 1 file | 0 / 1 | [FundDef.cs:2135](../../../../UBClasses/FundDef.cs#L2135) |
| `UBFundFactIsAutoAdd` | [L380019](../../../../ScriptDB/000_4_CreateSP.sql#L380019) | — | 0 / 0 | — |
| `UBFundFactItemAdd` | [L380054](../../../../ScriptDB/000_4_CreateSP.sql#L380054) | — | 2 / 0 | — |
| `UBFundFactItemAddUI` | [L380288](../../../../ScriptDB/000_4_CreateSP.sql#L380288) | — | 0 / 1 | — |
| `UBFundFactLastUpdate` | [L380324](../../../../ScriptDB/000_4_CreateSP.sql#L380324) | — | 0 / 0 | — |
| `UBFundFactList` | [L380374](../../../../ScriptDB/000_4_CreateSP.sql#L380374) | 1 / 1 file | 0 / 1 | [Document.cs:3123](../../../../UBClasses/Document.cs#L3123) |
| `UBFundFactListOneClient` | [L380657](../../../../ScriptDB/000_4_CreateSP.sql#L380657) | 1 / 1 file | 0 / 0 | [Document.cs:2883](../../../../UBClasses/Document.cs#L2883) |
| `UBFundFactListOneClientPendingTrx` | [L380781](../../../../ScriptDB/000_4_CreateSP.sql#L380781) | 1 / 1 file | 0 / 0 | [Document.cs:2931](../../../../UBClasses/Document.cs#L2931) |
| `UBFundFactListWebClient` | [L380868](../../../../ScriptDB/000_4_CreateSP.sql#L380868) | 1 / 1 file | 0 / 0 | [Document.cs:3523](../../../../UBClasses/Document.cs#L3523) |
| `UBFundFactNoObjList` | [L380932](../../../../ScriptDB/000_4_CreateSP.sql#L380932) | — | 0 / 0 | — |
| `UBFundFactObj` | [L381006](../../../../ScriptDB/000_4_CreateSP.sql#L381006) | 2 / 2 file | 0 / 0 | [Document.cs:3033](../../../../UBClasses/Document.cs#L3033) |
| `UBFundFactObjAdd` | [L381050](../../../../ScriptDB/000_4_CreateSP.sql#L381050) | — | 0 / 1 | — |
| `UBFundFactObjAddPortfolio` | [L381118](../../../../ScriptDB/000_4_CreateSP.sql#L381118) | 1 / 1 file | 0 / 1 | [CPortfolioFundFact.cs:426](../../../../VieFUNDPdf/CPortfolioFundFact.cs#L426) |
| `UBFundFactObjAddUI` | [L381224](../../../../ScriptDB/000_4_CreateSP.sql#L381224) | 1 / 1 file | 0 / 1 | [Document.cs:2816](../../../../UBClasses/Document.cs#L2816) |
| `UBFundFactObjAddWithFundPosID` | [L381331](../../../../ScriptDB/000_4_CreateSP.sql#L381331) | — | 0 / 2 | — |
| `UBFundFactObjAddWithPortfolio` | [L381378](../../../../ScriptDB/000_4_CreateSP.sql#L381378) | 1 / 1 file | 0 / 2 | [AssetAllocation.cs:1666](../../../../UBClasses/AssetAllocation.cs#L1666) |
| `UBFundFactObjByFFID` | [L381494](../../../../ScriptDB/000_4_CreateSP.sql#L381494) | 1 / 1 file | 0 / 0 | [Document.cs:3033](../../../../UBClasses/Document.cs#L3033) |
| `UBFundFactObjByFundDefID` | [L381538](../../../../ScriptDB/000_4_CreateSP.sql#L381538) | — | 0 / 0 | — |
| `UBFundFactObjByFundDefIDWCX` | [L381582](../../../../ScriptDB/000_4_CreateSP.sql#L381582) | — | 0 / 0 | — |
| `UBFundFactObjByFundPosID` | [L381631](../../../../ScriptDB/000_4_CreateSP.sql#L381631) | — | 0 / 0 | — |
| `UBFundFactObjByFundPosIDWCX` | [L381683](../../../../ScriptDB/000_4_CreateSP.sql#L381683) | — | 0 / 0 | — |
| `UBFundFactRemoveItem` | [L381739](../../../../ScriptDB/000_4_CreateSP.sql#L381739) | — | 0 / 0 | — |
| `UBFundFactSelectionUpdate` | [L381796](../../../../ScriptDB/000_4_CreateSP.sql#L381796) | — | 0 / 0 | — |
| `UBFundFactSetLastUpdate` | [L381844](../../../../ScriptDB/000_4_CreateSP.sql#L381844) | — | 0 / 0 | — |
| `UBFundFactVerifyFundCode1Item` | [L381877](../../../../ScriptDB/000_4_CreateSP.sql#L381877) | — | 0 / 0 | — |
| `UBFundFavoriteAdd` | [L381931](../../../../ScriptDB/000_4_CreateSP.sql#L381931) | 1 / 1 file | 0 / 0 | [FundDef.cs:2273](../../../../UBClasses/FundDef.cs#L2273) |
| `UBFundFavoriteList` | [L381962](../../../../ScriptDB/000_4_CreateSP.sql#L381962) | 1 / 1 file | 0 / 0 | [FundDef.cs:2368](../../../../UBClasses/FundDef.cs#L2368) |
| `UBFundFavoriteRemove` | [L382024](../../../../ScriptDB/000_4_CreateSP.sql#L382024) | 1 / 1 file | 0 / 0 | [FundDef.cs:2318](../../../../UBClasses/FundDef.cs#L2318) |
| `UBFundIDChange` | [L382083](../../../../ScriptDB/000_4_CreateSP.sql#L382083) | — | 0 / 0 | — |
| `UBFundInfo` | [L382104](../../../../ScriptDB/000_4_CreateSP.sql#L382104) | 1 / 1 file | 0 / 4 | [FundDef.cs:1171](../../../../UBClasses/FundDef.cs#L1171) |
| `UBFundInfo4Search` | [L382391](../../../../ScriptDB/000_4_CreateSP.sql#L382391) | 1 / 1 file | 0 / 0 | [FundDef.cs:1233](../../../../UBClasses/FundDef.cs#L1233) |
| `UBFundInfoByAcctPosition` | [L382419](../../../../ScriptDB/000_4_CreateSP.sql#L382419) | 1 / 1 file | 0 / 0 | [FundDef.cs:1414](../../../../UBClasses/FundDef.cs#L1414) |
| `UBFundInfoEdit` | [L382515](../../../../ScriptDB/000_4_CreateSP.sql#L382515) | 1 / 1 file | 0 / 1 | [FundDef.cs:1362](../../../../UBClasses/FundDef.cs#L1362) |
| `UBFundInfoPerf` | [L382652](../../../../ScriptDB/000_4_CreateSP.sql#L382652) | — | 1 / 0 | — |
| `UBFundInfoShort` | [L382698](../../../../ScriptDB/000_4_CreateSP.sql#L382698) | 1 / 1 file | 1 / 2 | [FundDef.cs:1296](../../../../UBClasses/FundDef.cs#L1296) |
| `UBFundList` | [L382805](../../../../ScriptDB/000_4_CreateSP.sql#L382805) | 2 / 1 file | 0 / 1 | [FundDef.cs:923](../../../../UBClasses/FundDef.cs#L923) |
| `UBFundListETF` | [L383496](../../../../ScriptDB/000_4_CreateSP.sql#L383496) | 1 / 1 file | 0 / 0 | [FundDef.cs:2623](../../../../UBClasses/FundDef.cs#L2623) |
| `UBFundListGIC` | [L383559](../../../../ScriptDB/000_4_CreateSP.sql#L383559) | — | 0 / 0 | — |
| `UBFundListSel` | [L383612](../../../../ScriptDB/000_4_CreateSP.sql#L383612) | 2 / 1 file | 0 / 0 | [FundDef.cs:131](../../../../UBClasses/FundDef.cs#L131) |
| `UBFundListSetNomineeApprove` | [L383686](../../../../ScriptDB/000_4_CreateSP.sql#L383686) | 1 / 1 file | 0 / 0 | [FundDef.cs:1042](../../../../UBClasses/FundDef.cs#L1042) |
| `UBFundLoadTypeList` | [L383747](../../../../ScriptDB/000_4_CreateSP.sql#L383747) | — | 10 / 0 | — |
| `UBFundLoadTypeListLong` | [L383771](../../../../ScriptDB/000_4_CreateSP.sql#L383771) | — | 0 / 0 | — |
| `UBFundMgmtList` | [L383796](../../../../ScriptDB/000_4_CreateSP.sql#L383796) | — | 0 / 0 | — |
| `UBFundNetworkList` | [L383868](../../../../ScriptDB/000_4_CreateSP.sql#L383868) | — | 4 / 0 | — |
| `UBFundNoDefClass` | [L383896](../../../../ScriptDB/000_4_CreateSP.sql#L383896) | — | 0 / 0 | — |
| `UBFundPos4RedemptionList` | [L383924](../../../../ScriptDB/000_4_CreateSP.sql#L383924) | 2 / 1 file | 0 / 1 | [Fee.cs:767](../../../../UBClasses/Fee.cs#L767) |
| `UBFundPos4RedemptionLock` | [L384027](../../../../ScriptDB/000_4_CreateSP.sql#L384027) | — | 0 / 0 | — |
| `UBFundPosAveragedCostCalc_Test` | [L384064](../../../../ScriptDB/000_4_CreateSP.sql#L384064) | — | 0 / 0 | — |
| `UBFundPosCalcStatMonth` | [L384164](../../../../ScriptDB/000_4_CreateSP.sql#L384164) | — | 1 / 2 | — |
| `UBFundPosCalcStatMonthOneDealer` | [L384241](../../../../ScriptDB/000_4_CreateSP.sql#L384241) | — | 0 / 1 | — |
| `UBFundPosDesc` | [L384284](../../../../ScriptDB/000_4_CreateSP.sql#L384284) | 1 / 1 file | 0 / 0 | [FundAccount.cs:1217](../../../../UBClasses/FundAccount.cs#L1217) |
| `UBFundPosInfo` | [L384311](../../../../ScriptDB/000_4_CreateSP.sql#L384311) | 1 / 1 file | 0 / 0 | [FundAccount.cs:1115](../../../../UBClasses/FundAccount.cs#L1115) |
| `UBFundPositionWithUnitNoTrx` | [L384328](../../../../ScriptDB/000_4_CreateSP.sql#L384328) | — | 0 / 0 | — |
| `UBFundPosMoveOrder` | [L384358](../../../../ScriptDB/000_4_CreateSP.sql#L384358) | 1 / 1 file | 0 / 0 | [Fee.cs:1092](../../../../UBClasses/Fee.cs#L1092) |
| `UBFundPosSelectionUpdate` | [L384486](../../../../ScriptDB/000_4_CreateSP.sql#L384486) | — | 0 / 0 | — |
| `UBFundPriceAdd` | [L384530](../../../../ScriptDB/000_4_CreateSP.sql#L384530) | — | 3 / 0 | — |
| `UBFundPriceList` | [L384751](../../../../ScriptDB/000_4_CreateSP.sql#L384751) | 1 / 1 file | 0 / 0 | [FundDef.cs:1748](../../../../UBClasses/FundDef.cs#L1748) |
| `UBFundPriceList100` | [L385435](../../../../ScriptDB/000_4_CreateSP.sql#L385435) | — | 2 / 0 | — |
| `UBFundPriceMerge` | [L385453](../../../../ScriptDB/000_4_CreateSP.sql#L385453) | — | 0 / 0 | — |
| `UBFundPriceUpdate` | [L385527](../../../../ScriptDB/000_4_CreateSP.sql#L385527) | — | 3 / 1 | — |
| `UBFundRegionList` | [L385555](../../../../ScriptDB/000_4_CreateSP.sql#L385555) | — | 6 / 0 | — |
| `UBFundReqDocTypeList` | [L385585](../../../../ScriptDB/000_4_CreateSP.sql#L385585) | — | 1 / 0 | — |
| `UBFundRiskList` | [L385615](../../../../ScriptDB/000_4_CreateSP.sql#L385615) | — | 17 / 0 | — |
| `UBFundSearchList` | [L385648](../../../../ScriptDB/000_4_CreateSP.sql#L385648) | 1 / 1 file | 0 / 0 | [FundDef.cs:299](../../../../UBClasses/FundDef.cs#L299) |
| `UBFundSearchXList` | [L386196](../../../../ScriptDB/000_4_CreateSP.sql#L386196) | 1 / 1 file | 0 / 1 | [FundDef.cs:372](../../../../UBClasses/FundDef.cs#L372) |
| `UBFundSplitMgmtFundID` | [L389176](../../../../ScriptDB/000_4_CreateSP.sql#L389176) | — | 10 / 0 | — |
| `UBFundStatusList` | [L389231](../../../../ScriptDB/000_4_CreateSP.sql#L389231) | — | 2 / 0 | — |
| `UBFundTaxStructureList` | [L389256](../../../../ScriptDB/000_4_CreateSP.sql#L389256) | — | 1 / 0 | — |
| `UBFundTrxAmountFromList` | [L389286](../../../../ScriptDB/000_4_CreateSP.sql#L389286) | 1 / 1 file | 0 / 0 | [Trx.cs:6323](../../../../UBClasses/Trx.cs#L6323) |
| `UBFundTrxBasketAdd` | [L389309](../../../../ScriptDB/000_4_CreateSP.sql#L389309) | — | 4 / 0 | — |
| `UBFundTrxBasketICTEdit` | [L389436](../../../../ScriptDB/000_4_CreateSP.sql#L389436) | 1 / 1 file | 0 / 0 | [Trx.cs:1998](../../../../UBClasses/Trx.cs#L1998) |
| `UBFundTrxBasketICTFundAdd` | [L389552](../../../../ScriptDB/000_4_CreateSP.sql#L389552) | 1 / 1 file | 0 / 0 | [PanelBasketICTFundAdd.cs:182](../../../../WebApp/Main/PanelBasketICTFundAdd.cs#L182) |
| `UBFundTrxBasketICTFundList` | [L389643](../../../../ScriptDB/000_4_CreateSP.sql#L389643) | 1 / 1 file | 0 / 0 | [FundAccount.cs:973](../../../../UBClasses/FundAccount.cs#L973) |
| `UBFundTrxBasketICTFundRemove` | [L389690](../../../../ScriptDB/000_4_CreateSP.sql#L389690) | 1 / 1 file | 0 / 0 | [PanelBasketICTFundAdd.cs:303](../../../../WebApp/Main/PanelBasketICTFundAdd.cs#L303) |
| `UBFundTrxBuy` | [L389772](../../../../ScriptDB/000_4_CreateSP.sql#L389772) | 1 / 1 file | 1 / 7 | [Trx.cs:632](../../../../UBClasses/Trx.cs#L632) |
| `UBFundTrxBuyBasket` | [L390694](../../../../ScriptDB/000_4_CreateSP.sql#L390694) | 1 / 1 file | 0 / 1 | [Trx.cs:4658](../../../../UBClasses/Trx.cs#L4658) |
| `UBFundTrxBuyEdit` | [L391415](../../../../ScriptDB/000_4_CreateSP.sql#L391415) | 1 / 1 file | 0 / 5 | [Trx.cs:890](../../../../UBClasses/Trx.cs#L890) |
| `UBFundTrxBuyOne` | [L392011](../../../../ScriptDB/000_4_CreateSP.sql#L392011) | — | 5 / 6 | — |
| `UBFundTrxBuyShort` | [L392648](../../../../ScriptDB/000_4_CreateSP.sql#L392648) | — | 7 / 5 | — |
| `UBFundTrxCancel` | [L393014](../../../../ScriptDB/000_4_CreateSP.sql#L393014) | — | 0 / 2 | — |
| `UBFundTrxChange` | [L393125](../../../../ScriptDB/000_4_CreateSP.sql#L393125) | — | 0 / 1 | — |
| `UBFundTrxConversionBulkBasketAdd` | [L393180](../../../../ScriptDB/000_4_CreateSP.sql#L393180) | — | 1 / 0 | — |
| `UBFundTrxConversionBulkBasketUpdate` | [L393207](../../../../ScriptDB/000_4_CreateSP.sql#L393207) | — | 1 / 0 | — |
| `UBFundTrxDesc` | [L393258](../../../../ScriptDB/000_4_CreateSP.sql#L393258) | 1 / 1 file | 0 / 0 | [Trx.cs:5858](../../../../UBClasses/Trx.cs#L5858) |
| `UBFundTrxICT` | [L393311](../../../../ScriptDB/000_4_CreateSP.sql#L393311) | 1 / 1 file | 0 / 6 | [Trx.cs:1840](../../../../UBClasses/Trx.cs#L1840) |
| `UBFundTrxICTAddOneShort` | [L393654](../../../../ScriptDB/000_4_CreateSP.sql#L393654) | — | 1 / 4 | — |
| `UBFundTrxICTBasket` | [L393877](../../../../ScriptDB/000_4_CreateSP.sql#L393877) | 1 / 1 file | 0 / 1 | [Trx.cs:4979](../../../../UBClasses/Trx.cs#L4979) |
| `UBFundTrxICTEdit` | [L394171](../../../../ScriptDB/000_4_CreateSP.sql#L394171) | 1 / 1 file | 0 / 1 | [Trx.cs:1919](../../../../UBClasses/Trx.cs#L1919) |
| `UBFundTrxICTFundAdd` | [L394301](../../../../ScriptDB/000_4_CreateSP.sql#L394301) | 3 / 3 file | 0 / 0 | [PanelICTFundAdd.aspx.cs:182](../../../../WebApp/Main/PanelICTFundAdd.aspx.cs#L182) |
| `UBFundTrxICTFundList` | [L394396](../../../../ScriptDB/000_4_CreateSP.sql#L394396) | 1 / 1 file | 0 / 0 | [FundAccount.cs:884](../../../../UBClasses/FundAccount.cs#L884) |
| `UBFundTrxICTFundRemove` | [L394433](../../../../ScriptDB/000_4_CreateSP.sql#L394433) | 3 / 3 file | 1 / 0 | [PanelICTFundAdd.aspx.cs:303](../../../../WebApp/Main/PanelICTFundAdd.aspx.cs#L303) |
| `UBFundTrxICTOne` | [L394493](../../../../ScriptDB/000_4_CreateSP.sql#L394493) | — | 2 / 5 | — |
| `UBFundTrxInfoLastWithType` | [L394887](../../../../ScriptDB/000_4_CreateSP.sql#L394887) | — | 1 / 0 | — |
| `UBFundTrxManualAdd` | [L394947](../../../../ScriptDB/000_4_CreateSP.sql#L394947) | — | 0 / 7 | — |
| `UBFundTrxManualCalc` | [L395453](../../../../ScriptDB/000_4_CreateSP.sql#L395453) | 1 / 1 file | 0 / 0 | [Trx.cs:3011](../../../../UBClasses/Trx.cs#L3011) |
| `UBFundTrxManualUpdate` | [L395604](../../../../ScriptDB/000_4_CreateSP.sql#L395604) | — | 0 / 9 | — |
| `UBFundTrxMergeTrx` | [L396271](../../../../ScriptDB/000_4_CreateSP.sql#L396271) | — | 0 / 0 | — |
| `UBFundTrxMove` | [L396319](../../../../ScriptDB/000_4_CreateSP.sql#L396319) | 1 / 1 file | 2 / 0 | [FundAccount.cs:3148](../../../../UBClasses/FundAccount.cs#L3148) |
| `UBFundTrxMove2Plan` | [L396399](../../../../ScriptDB/000_4_CreateSP.sql#L396399) | — | 0 / 1 | — |
| `UBFundTrxMoveAll` | [L396436](../../../../ScriptDB/000_4_CreateSP.sql#L396436) | — | 0 / 1 | — |
| `UBFundTrxOrderAdd` | [L396471](../../../../ScriptDB/000_4_CreateSP.sql#L396471) | — | 22 / 1 | — |
| `UBFundTrxOrderARC` | [L396634](../../../../ScriptDB/000_4_CreateSP.sql#L396634) | — | 29 / 0 | — |
| `UBFundTrxOrderCANCAX` | [L396731](../../../../ScriptDB/000_4_CreateSP.sql#L396731) | 1 / 1 file | 0 / 0 | [Trx.cs:819](../../../../UBClasses/Trx.cs#L819) |
| `UBFundTrxOrderRestore` | [L396943](../../../../ScriptDB/000_4_CreateSP.sql#L396943) | — | 0 / 0 | — |
| `UBFundTrxOrderREVAdd` | [L397077](../../../../ScriptDB/000_4_CreateSP.sql#L397077) | — | 1 / 3 | — |
| `UBFundTrxRemoveDuplicateDividend` | [L397288](../../../../ScriptDB/000_4_CreateSP.sql#L397288) | — | 0 / 0 | — |
| `UBFundTrxREV` | [L397330](../../../../ScriptDB/000_4_CreateSP.sql#L397330) | — | 0 / 2 | — |
| `UBFundTrxSell` | [L397587](../../../../ScriptDB/000_4_CreateSP.sql#L397587) | 1 / 1 file | 1 / 7 | [Trx.cs:1018](../../../../UBClasses/Trx.cs#L1018) |
| `UBFundTrxSellBasket` | [L398155](../../../../ScriptDB/000_4_CreateSP.sql#L398155) | 1 / 1 file | 0 / 1 | [Trx.cs:4866](../../../../UBClasses/Trx.cs#L4866) |
| `UBFundTrxSellConversionBulkBasket` | [L398575](../../../../ScriptDB/000_4_CreateSP.sql#L398575) | 1 / 1 file | 0 / 1 | [BulkSwitchBasket.cs:1282](../../../../UBClasses/BulkSwitchBasket.cs#L1282) |
| `UBFundTrxSellEdit` | [L398835](../../../../ScriptDB/000_4_CreateSP.sql#L398835) | 1 / 1 file | 0 / 5 | [Trx.cs:1145](../../../../UBClasses/Trx.cs#L1145) |
| `UBFundTrxSellOne` | [L399204](../../../../ScriptDB/000_4_CreateSP.sql#L399204) | — | 9 / 6 | — |
| `UBFundTrxSellShort` | [L399556](../../../../ScriptDB/000_4_CreateSP.sql#L399556) | — | 8 / 6 | — |
| `UBFundTrxSetRejected` | [L399920](../../../../ScriptDB/000_4_CreateSP.sql#L399920) | — | 0 / 0 | — |
| `UBFundTrxSwitch` | [L400027](../../../../ScriptDB/000_4_CreateSP.sql#L400027) | 1 / 1 file | 0 / 6 | [Trx.cs:1266](../../../../UBClasses/Trx.cs#L1266) |
| `UBFundTrxSwitchBasket` | [L400587](../../../../ScriptDB/000_4_CreateSP.sql#L400587) | 1 / 1 file | 0 / 2 | [Trx.cs:1510](../../../../UBClasses/Trx.cs#L1510) |
| `UBFundTrxSwitchEdit` | [L401064](../../../../ScriptDB/000_4_CreateSP.sql#L401064) | 1 / 1 file | 0 / 2 | [Trx.cs:1390](../../../../UBClasses/Trx.cs#L1390) |
| `UBFundTrxSwitchOne` | [L401582](../../../../ScriptDB/000_4_CreateSP.sql#L401582) | — | 2 / 5 | — |
| `UBFundTrxSwitchShort` | [L402062](../../../../ScriptDB/000_4_CreateSP.sql#L402062) | — | 2 / 5 | — |
| `UBFundTrxTransfer` | [L402581](../../../../ScriptDB/000_4_CreateSP.sql#L402581) | 1 / 1 file | 0 / 6 | [Trx.cs:1624](../../../../UBClasses/Trx.cs#L1624) |
| `UBFundTrxTransferEdit` | [L403021](../../../../ScriptDB/000_4_CreateSP.sql#L403021) | 1 / 1 file | 0 / 1 | [Trx.cs:1739](../../../../UBClasses/Trx.cs#L1739) |
| `UBFundTrxUpdateBalanceWithCalcVals` | [L403192](../../../../ScriptDB/000_4_CreateSP.sql#L403192) | 1 / 1 file | 4 / 0 | [FundAccount.cs:1886](../../../../UBClasses/FundAccount.cs#L1886) |
| `UBFundTrxUpdateConversionBulkBasket` | [L403302](../../../../ScriptDB/000_4_CreateSP.sql#L403302) | 1 / 1 file | 0 / 1 | [BulkSwitchBasket.cs:1341](../../../../UBClasses/BulkSwitchBasket.cs#L1341) |
| `UBFundTypeList` | [L403538](../../../../ScriptDB/000_4_CreateSP.sql#L403538) | — | 10 / 0 | — |
| `UBFundUpdateInvObj` | [L403568](../../../../ScriptDB/000_4_CreateSP.sql#L403568) | 1 / 1 file | 0 / 3 | [FundDef.cs:2518](../../../../UBClasses/FundDef.cs#L2518) |
| `UBGICAccComboList` | [L406893](../../../../ScriptDB/000_4_CreateSP.sql#L406893) | — | 0 / 26 | — |
| `UBGICAccountAdd` | [L406956](../../../../ScriptDB/000_4_CreateSP.sql#L406956) | — | 1 / 16 | — |
| `UBGICAccountDetailX` | [L407671](../../../../ScriptDB/000_4_CreateSP.sql#L407671) | — | 0 / 0 | — |
| `UBGICAccountMKV` | [L407822](../../../../ScriptDB/000_4_CreateSP.sql#L407822) | — | 0 / 0 | — |
| `UBGICAccountMKV2` | [L407893](../../../../ScriptDB/000_4_CreateSP.sql#L407893) | — | 1 / 0 | — |
| `UBGICAccountMoveAllFromPlan2Plan` | [L407966](../../../../ScriptDB/000_4_CreateSP.sql#L407966) | — | 0 / 1 | — |
| `UBGICAccountMoveFromPlan2Plan` | [L408003](../../../../ScriptDB/000_4_CreateSP.sql#L408003) | 1 / 1 file | 1 / 0 | [TermDeposit.cs:1350](../../../../UBClasses/TermDeposit.cs#L1350) |
| `UBGICAccountRemove` | [L408094](../../../../ScriptDB/000_4_CreateSP.sql#L408094) | — | 1 / 2 | — |
| `UBGICAccountScanMatured` | [L408203](../../../../ScriptDB/000_4_CreateSP.sql#L408203) | — | 0 / 0 | — |
| `UBGICAccountSchedule` | [L408252](../../../../ScriptDB/000_4_CreateSP.sql#L408252) | — | 0 / 3 | — |
| `UBGICAccountScheduleGenerateAll` | [L408381](../../../../ScriptDB/000_4_CreateSP.sql#L408381) | 1 / 1 file | 0 / 3 | [TermDeposit.cs:1556](../../../../UBClasses/TermDeposit.cs#L1556) |
| `UBGICAccountStatusList` | [L408505](../../../../ScriptDB/000_4_CreateSP.sql#L408505) | — | 2 / 0 | — |
| `UBGICAccountTrxAdd` | [L408535](../../../../ScriptDB/000_4_CreateSP.sql#L408535) | — | 5 / 3 | — |
| `UBGICAccountTrxAddUI` | [L408624](../../../../ScriptDB/000_4_CreateSP.sql#L408624) | — | 0 / 5 | — |
| `UBGICAccountTrxEditable` | [L408878](../../../../ScriptDB/000_4_CreateSP.sql#L408878) | 1 / 1 file | 0 / 0 | [TermDeposit.cs:560](../../../../UBClasses/TermDeposit.cs#L560) |
| `UBGICAccountTrxEditUI` | [L408914](../../../../ScriptDB/000_4_CreateSP.sql#L408914) | — | 0 / 1 | — |
| `UBGICAccountTrxInfo` | [L408990](../../../../ScriptDB/000_4_CreateSP.sql#L408990) | 1 / 1 file | 0 / 0 | [TermDeposit.cs:386](../../../../UBClasses/TermDeposit.cs#L386) |
| `UBGICAccountTrxList` | [L409042](../../../../ScriptDB/000_4_CreateSP.sql#L409042) | 1 / 1 file | 1 / 0 | [TermDeposit.cs:519](../../../../UBClasses/TermDeposit.cs#L519) |
| `UBGICAccountTrxRemove` | [L409090](../../../../ScriptDB/000_4_CreateSP.sql#L409090) | — | 0 / 3 | — |
| `UBGICAccountUpdate` | [L409253](../../../../ScriptDB/000_4_CreateSP.sql#L409253) | — | 0 / 12 | — |
| `UBGICAcctDesc` | [L409855](../../../../ScriptDB/000_4_CreateSP.sql#L409855) | 1 / 1 file | 0 / 0 | [TermDeposit.cs:1184](../../../../UBClasses/TermDeposit.cs#L1184) |
| `UBGICAccTrxComboList` | [L409882](../../../../ScriptDB/000_4_CreateSP.sql#L409882) | — | 0 / 4 | — |
| `UBGICAnnuitantTypeList` | [L409910](../../../../ScriptDB/000_4_CreateSP.sql#L409910) | — | 1 / 0 | — |
| `UBGICCalcMaturity` | [L409941](../../../../ScriptDB/000_4_CreateSP.sql#L409941) | 1 / 1 file | 0 / 2 | [PopupGICAdd.aspx.cs:2015](../../../../WebApp/Main/PopupGICAdd.aspx.cs#L2015) |
| `UBGICCalcMaturityCannex` | [L410156](../../../../ScriptDB/000_4_CreateSP.sql#L410156) | 1 / 1 file | 0 / 1 | [TermDeposit.cs:2072](../../../../UBClasses/TermDeposit.cs#L2072) |
| `UBGICCalcMaturityCannexOne` | [L410219](../../../../ScriptDB/000_4_CreateSP.sql#L410219) | — | 3 / 2 | — |
| `UBGICCalcPYMTSchedule` | [L410346](../../../../ScriptDB/000_4_CreateSP.sql#L410346) | — | 4 / 1 | — |
| `UBGICCalcPYMTScheduleSave` | [L410809](../../../../ScriptDB/000_4_CreateSP.sql#L410809) | — | 1 / 0 | — |
| `UBGICCalcPYMTScheduleX` | [L410860](../../../../ScriptDB/000_4_CreateSP.sql#L410860) | — | 0 / 0 | — |
| `UBGICCalcPYMTScheduleX2` | [L411353](../../../../ScriptDB/000_4_CreateSP.sql#L411353) | — | 2 / 0 | — |
| `UBGICCannexBasketInfo` | [L411925](../../../../ScriptDB/000_4_CreateSP.sql#L411925) | — | 0 / 0 | — |
| `UBGICCannexBasketList` | [L411960](../../../../ScriptDB/000_4_CreateSP.sql#L411960) | — | 0 / 0 | — |
| `UBGICCannexBuyBasket2Order` | [L411998](../../../../ScriptDB/000_4_CreateSP.sql#L411998) | 1 / 1 file | 0 / 8 | [TermDeposit.cs:2129](../../../../UBClasses/TermDeposit.cs#L2129) |
| `UBGICCannexBuyBasketAdd` | [L412395](../../../../ScriptDB/000_4_CreateSP.sql#L412395) | 1 / 1 file | 0 / 0 | [TermDeposit.cs:1853](../../../../UBClasses/TermDeposit.cs#L1853) |
| `UBGICCannexBuyBasketDelete` | [L412655](../../../../ScriptDB/000_4_CreateSP.sql#L412655) | 1 / 1 file | 0 / 0 | [TermDeposit.cs:1918](../../../../UBClasses/TermDeposit.cs#L1918) |
| `UBGICCannexBuyOrderAdd` | [L412674](../../../../ScriptDB/000_4_CreateSP.sql#L412674) | 1 / 1 file | 0 / 7 | [TermDeposit.cs:1628](../../../../UBClasses/TermDeposit.cs#L1628) |
| `UBGICCannexBuyOrderVerifyBeforeSending` | [L413260](../../../../ScriptDB/000_4_CreateSP.sql#L413260) | — | 0 / 1 | — |
| `UBGICClientList` | [L413334](../../../../ScriptDB/000_4_CreateSP.sql#L413334) | 1 / 1 file | 0 / 0 | [TermDeposit.cs:859](../../../../UBClasses/TermDeposit.cs#L859) |
| `UBGICConfirmationDeliverItem` | [L413376](../../../../ScriptDB/000_4_CreateSP.sql#L413376) | — | 1 / 1 | — |
| `UBGICConfirmationList` | [L413529](../../../../ScriptDB/000_4_CreateSP.sql#L413529) | 1 / 1 file | 0 / 1 | [Document.cs:3768](../../../../UBClasses/Document.cs#L3768) |
| `UBGICConfirmationListOneClient` | [L413835](../../../../ScriptDB/000_4_CreateSP.sql#L413835) | 1 / 1 file | 0 / 0 | [TermDeposit.cs:1758](../../../../UBClasses/TermDeposit.cs#L1758) |
| `UBGICConfirmationObjByID` | [L413895](../../../../ScriptDB/000_4_CreateSP.sql#L413895) | 1 / 1 file | 0 / 0 | [TermDeposit.cs:1702](../../../../UBClasses/TermDeposit.cs#L1702) |
| `UBGICConfirmationRemoveItem` | [L413920](../../../../ScriptDB/000_4_CreateSP.sql#L413920) | — | 0 / 0 | — |
| `UBGICConfirmationSavePdfObj` | [L413963](../../../../ScriptDB/000_4_CreateSP.sql#L413963) | 1 / 1 file | 0 / 1 | [GICConfirmation.cs:341](../../../../VieFUNDPdf/GICConfirmation.cs#L341) |
| `UBGICConfirmationSet` | [L414000](../../../../ScriptDB/000_4_CreateSP.sql#L414000) | 1 / 1 file | 0 / 8 | [GICConfirmation.cs:390](../../../../VieFUNDPdf/GICConfirmation.cs#L390) |
| `UBGICDefInfo` | [L414463](../../../../ScriptDB/000_4_CreateSP.sql#L414463) | — | 1 / 0 | — |
| `UBGICDefLookup` | [L414515](../../../../ScriptDB/000_4_CreateSP.sql#L414515) | 1 / 1 file | 0 / 0 | [FundDef.cs:4409](../../../../UBClasses/FundDef.cs#L4409) |
| `UBGICDefLookupInfoOne` | [L414871](../../../../ScriptDB/000_4_CreateSP.sql#L414871) | 1 / 1 file | 0 / 0 | [FundDef.cs:4497](../../../../UBClasses/FundDef.cs#L4497) |
| `UBGICDurationList` | [L414907](../../../../ScriptDB/000_4_CreateSP.sql#L414907) | — | 1 / 0 | — |
| `UBGICExport` | [L414937](../../../../ScriptDB/000_4_CreateSP.sql#L414937) | 1 / 1 file | 0 / 1 | [GICExport.cs:159](../../../../UBExport/GICExport.cs#L159) |
| `UBGICFormInfo` | [L415146](../../../../ScriptDB/000_4_CreateSP.sql#L415146) | 1 / 1 file | 1 / 0 | [TermDeposit.cs:1449](../../../../UBClasses/TermDeposit.cs#L1449) |
| `UBGICImportDef` | [L415234](../../../../ScriptDB/000_4_CreateSP.sql#L415234) | — | 0 / 0 | — |
| `UBGICImportFileClear` | [L415247](../../../../ScriptDB/000_4_CreateSP.sql#L415247) | — | 1 / 0 | — |
| `UBGICImportFileReadOneRecord` | [L415261](../../../../ScriptDB/000_4_CreateSP.sql#L415261) | — | 0 / 2 | — |
| `UBGICImportList` | [L415332](../../../../ScriptDB/000_4_CreateSP.sql#L415332) | 1 / 1 file | 0 / 0 | [GICImport.cs:36](../../../../UBClasses/GICImport.cs#L36) |
| `UBGICImportProcess1Record` | [L415435](../../../../ScriptDB/000_4_CreateSP.sql#L415435) | — | 1 / 2 | — |
| `UBGICImportProcessTaggedItems` | [L415758](../../../../ScriptDB/000_4_CreateSP.sql#L415758) | — | 0 / 1 | — |
| `UBGICImportSelectionUpdate` | [L415804](../../../../ScriptDB/000_4_CreateSP.sql#L415804) | — | 0 / 0 | — |
| `UBGICInfo` | [L415844](../../../../ScriptDB/000_4_CreateSP.sql#L415844) | 1 / 1 file | 0 / 2 | [Customer.cs:3343](../../../../UBClasses/Customer.cs#L3343) |
| `UBGICInfoShort` | [L416133](../../../../ScriptDB/000_4_CreateSP.sql#L416133) | 1 / 1 file | 0 / 0 | [TermDeposit.cs:427](../../../../UBClasses/TermDeposit.cs#L427) |
| `UBGICInterestAccrualList` | [L416156](../../../../ScriptDB/000_4_CreateSP.sql#L416156) | — | 1 / 0 | — |
| `UBGICInterestCalcList` | [L416186](../../../../ScriptDB/000_4_CreateSP.sql#L416186) | — | 1 / 0 | — |
| `UBGICInterestCompoundFreqList` | [L416212](../../../../ScriptDB/000_4_CreateSP.sql#L416212) | — | 1 / 0 | — |
| `UBGICMalturedBulkProcessing` | [L416242](../../../../ScriptDB/000_4_CreateSP.sql#L416242) | — | 0 / 1 | — |
| `UBGICMalturedInit` | [L416297](../../../../ScriptDB/000_4_CreateSP.sql#L416297) | — | 0 / 0 | — |
| `UBGICMaturityList` | [L416324](../../../../ScriptDB/000_4_CreateSP.sql#L416324) | — | 0 / 0 | — |
| `UBGICMaturityProcessingOneItem` | [L416570](../../../../ScriptDB/000_4_CreateSP.sql#L416570) | — | 1 / 2 | — |
| `UBGicMaturityProcessingSelectionUpdate` | [L416806](../../../../ScriptDB/000_4_CreateSP.sql#L416806) | — | 0 / 0 | — |
| `UBGICOrderAssignNewSourceID` | [L416840](../../../../ScriptDB/000_4_CreateSP.sql#L416840) | — | 2 / 1 | — |
| `UBGICOrderPendingListCannex` | [L416856](../../../../ScriptDB/000_4_CreateSP.sql#L416856) | 1 / 1 file | 0 / 3 | [TermDeposit.cs:965](../../../../UBClasses/TermDeposit.cs#L965) |
| `UBGICOrderPendingListGICServ` | [L417247](../../../../ScriptDB/000_4_CreateSP.sql#L417247) | — | 0 / 0 | — |
| `UBGICOrderResendCannex` | [L417274](../../../../ScriptDB/000_4_CreateSP.sql#L417274) | — | 0 / 2 | — |
| `UBGICOrderSelectionUpdateCannex` | [L417292](../../../../ScriptDB/000_4_CreateSP.sql#L417292) | — | 0 / 0 | — |
| `UBGICOrderSelectionUpdateGICServ` | [L417339](../../../../ScriptDB/000_4_CreateSP.sql#L417339) | — | 0 / 0 | — |
| `UBGICOrderWaiting2SendAddCannex` | [L417386](../../../../ScriptDB/000_4_CreateSP.sql#L417386) | — | 2 / 2 | — |
| `UBGICOrderWaiting2SendAddCannexByAccountID` | [L417487](../../../../ScriptDB/000_4_CreateSP.sql#L417487) | — | 2 / 1 | — |
| `UBGICOrderWaiting2SendRemoveCannex` | [L417518](../../../../ScriptDB/000_4_CreateSP.sql#L417518) | 1 / 1 file | 0 / 0 | [CannexOrder.cs:325](../../../../UBFFImport/CannexOrder.cs#L325) |
| `UBGICOwnershipTypeList` | [L417544](../../../../ScriptDB/000_4_CreateSP.sql#L417544) | — | 1 / 0 | — |
| `UBGICPlanID` | [L417572](../../../../ScriptDB/000_4_CreateSP.sql#L417572) | 1 / 1 file | 0 / 0 | [TermDeposit.cs:903](../../../../UBClasses/TermDeposit.cs#L903) |
| `UBGICPMTFreqList` | [L417606](../../../../ScriptDB/000_4_CreateSP.sql#L417606) | — | 3 / 0 | — |
| `UBGICPMTMethodList` | [L417636](../../../../ScriptDB/000_4_CreateSP.sql#L417636) | — | 2 / 0 | — |
| `UBGICProdTypeList` | [L417666](../../../../ScriptDB/000_4_CreateSP.sql#L417666) | — | 1 / 0 | — |
| `UBGICPYMTScheduleList` | [L417696](../../../../ScriptDB/000_4_CreateSP.sql#L417696) | 1 / 1 file | 0 / 1 | [TermDeposit.cs:1508](../../../../UBClasses/TermDeposit.cs#L1508) |
| `UBGICRateFileInfo` | [L417738](../../../../ScriptDB/000_4_CreateSP.sql#L417738) | 1 / 1 file | 0 / 0 | [TermDeposit.cs:42](../../../../UBClasses/TermDeposit.cs#L42) |
| `UBGICRateFileInfoSet` | [L417776](../../../../ScriptDB/000_4_CreateSP.sql#L417776) | 1 / 1 file | 0 / 0 | [TermDeposit.cs:96](../../../../UBClasses/TermDeposit.cs#L96) |
| `UBGICRateTypeList` | [L417827](../../../../ScriptDB/000_4_CreateSP.sql#L417827) | — | 1 / 0 | — |
| `UBGICRedeemAbilityList` | [L417857](../../../../ScriptDB/000_4_CreateSP.sql#L417857) | — | 2 / 0 | — |
| `UBGICReportMaturity` | [L417871](../../../../ScriptDB/000_4_CreateSP.sql#L417871) | 1 / 1 file | 0 / 4 | [GIC.cs:276](../../../../VieFUNDPdf/GIC.cs#L276) |
| `UBGICReportReminder` | [L418154](../../../../ScriptDB/000_4_CreateSP.sql#L418154) | 1 / 1 file | 0 / 5 | [GIC.cs:334](../../../../VieFUNDPdf/GIC.cs#L334) |
| `UBGICReportTrx` | [L418425](../../../../ScriptDB/000_4_CreateSP.sql#L418425) | 1 / 1 file | 0 / 4 | [GIC.cs:220](../../../../VieFUNDPdf/GIC.cs#L220) |
| `UBGICScanPendingDayEnd` | [L418640](../../../../ScriptDB/000_4_CreateSP.sql#L418640) | — | 0 / 0 | — |
| `UBGICSetStatus` | [L418673](../../../../ScriptDB/000_4_CreateSP.sql#L418673) | — | 0 / 0 | — |
| `UBGICStatusInfo` | [L418694](../../../../ScriptDB/000_4_CreateSP.sql#L418694) | 1 / 1 file | 0 / 0 | [TermDeposit.cs:1800](../../../../UBClasses/TermDeposit.cs#L1800) |
| `UBGICTermTypeList` | [L418731](../../../../ScriptDB/000_4_CreateSP.sql#L418731) | — | 1 / 0 | — |
| `UBGICTermUnitList` | [L418761](../../../../ScriptDB/000_4_CreateSP.sql#L418761) | — | 1 / 0 | — |
| `UBGICUpdateIntDue` | [L418791](../../../../ScriptDB/000_4_CreateSP.sql#L418791) | 1 / 1 file | 0 / 0 | [TermDeposit.cs:471](../../../../UBClasses/TermDeposit.cs#L471) |
| `UBGICVerifyInterest4T5` | [L418826](../../../../ScriptDB/000_4_CreateSP.sql#L418826) | — | 1 / 0 | — |
| `UBGICVerifyInterest4T5ScanAll` | [L418968](../../../../ScriptDB/000_4_CreateSP.sql#L418968) | — | 1 / 1 | — |
| `UBGICViewComboList` | [L419009](../../../../ScriptDB/000_4_CreateSP.sql#L419009) | — | 0 / 14 | — |
| `UBGICViewListCof` | [L419073](../../../../ScriptDB/000_4_CreateSP.sql#L419073) | 1 / 1 file | 0 / 0 | [GICConfirmation.cs:139](../../../../VieFUNDPdf/GICConfirmation.cs#L139) |
| `UBGICViewSearch` | [L419122](../../../../ScriptDB/000_4_CreateSP.sql#L419122) | — | 0 / 3 | — |
| `UBGICViewSearchCriteriaSave` | [L421000](../../../../ScriptDB/000_4_CreateSP.sql#L421000) | — | 1 / 1 | — |
| `UBGICViewSearchTrx` | [L421332](../../../../ScriptDB/000_4_CreateSP.sql#L421332) | — | 0 / 3 | — |
| `UBGICViewSearchTrxCriteriaSave` | [L423498](../../../../ScriptDB/000_4_CreateSP.sql#L423498) | — | 1 / 1 | — |
| `UBInsuranceProductListSel` | [L425575](../../../../ScriptDB/000_4_CreateSP.sql#L425575) | 1 / 1 file | 0 / 0 | [Insurance.cs:401](../../../../UBClasses/Insurance.cs#L401) |
| `UBInsuranceProductUpdate` | [L425608](../../../../ScriptDB/000_4_CreateSP.sql#L425608) | — | 2 / 0 | — |
| `UBKYPCompareListCopyFundList` | [L427478](../../../../ScriptDB/000_4_CreateSP.sql#L427478) | 1 / 1 file | 0 / 0 | [FundDef.cs:3176](../../../../UBClasses/FundDef.cs#L3176) |
| `UBKYPCompareListCopyFundList_Client` | [L427509](../../../../ScriptDB/000_4_CreateSP.sql#L427509) | 1 / 1 file | 0 / 0 | [FundDef.cs:3223](../../../../UBClasses/FundDef.cs#L3223) |
| `UBKYPCompareListCurrentByFundList` | [L429058](../../../../ScriptDB/000_4_CreateSP.sql#L429058) | — | 1 / 1 | — |
| `UBKYPCompareListCurrentByFundList_Client` | [L430564](../../../../ScriptDB/000_4_CreateSP.sql#L430564) | — | 1 / 1 | — |
| `UBKYPFundCompareListAdd` | [L432907](../../../../ScriptDB/000_4_CreateSP.sql#L432907) | 1 / 1 file | 1 / 0 | [FundDef.cs:2780](../../../../UBClasses/FundDef.cs#L2780) |
| `UBKYPFundCompareListAdd_Client` | [L432990](../../../../ScriptDB/000_4_CreateSP.sql#L432990) | 1 / 1 file | 0 / 0 | [FundDef.cs:2833](../../../../UBClasses/FundDef.cs#L2833) |
| `UBKYPFundCompareListAddTaggedItems` | [L433049](../../../../ScriptDB/000_4_CreateSP.sql#L433049) | 1 / 1 file | 0 / 1 | [FundDef.cs:2732](../../../../UBClasses/FundDef.cs#L2732) |
| `UBKYPFundCompareListMove` | [L433089](../../../../ScriptDB/000_4_CreateSP.sql#L433089) | 1 / 1 file | 0 / 0 | [FundDef.cs:2978](../../../../UBClasses/FundDef.cs#L2978) |
| `UBKYPFundCompareListMove_Client` | [L433153](../../../../ScriptDB/000_4_CreateSP.sql#L433153) | 1 / 1 file | 0 / 0 | [FundDef.cs:3025](../../../../UBClasses/FundDef.cs#L3025) |
| `UBKYPFundCompareListRemove` | [L433217](../../../../ScriptDB/000_4_CreateSP.sql#L433217) | 1 / 1 file | 0 / 0 | [FundDef.cs:2933](../../../../UBClasses/FundDef.cs#L2933) |
| `UBKYPFundCompareListRemove_Client` | [L433258](../../../../ScriptDB/000_4_CreateSP.sql#L433258) | 1 / 1 file | 0 / 0 | [FundDef.cs:2886](../../../../UBClasses/FundDef.cs#L2886) |
| `UBKYPFundDefChangeFixOneDay` | [L433300](../../../../ScriptDB/000_4_CreateSP.sql#L433300) | — | 0 / 0 | — |
| `UBKYPFundDefChangeList` | [L433372](../../../../ScriptDB/000_4_CreateSP.sql#L433372) | 2 / 2 file | 0 / 1 | [FundDef.cs:3372](../../../../UBClasses/FundDef.cs#L3372) |
| `UBKYPFundDefChangeListX` | [L433707](../../../../ScriptDB/000_4_CreateSP.sql#L433707) | 1 / 1 file | 0 / 1 | [FundDef.cs:3436](../../../../UBClasses/FundDef.cs#L3436) |
| `UBKYPFundDefChangeListXAccount` | [L433894](../../../../ScriptDB/000_4_CreateSP.sql#L433894) | 1 / 1 file | 0 / 1 | [FundDef.cs:3570](../../../../UBClasses/FundDef.cs#L3570) |
| `UBKYPFundListOtherClients` | [L434252](../../../../ScriptDB/000_4_CreateSP.sql#L434252) | 1 / 1 file | 0 / 1 | [FundDef.cs:4613](../../../../UBClasses/FundDef.cs#L4613) |
| `UBMerge2FundAccounts` | [L447434](../../../../ScriptDB/000_4_CreateSP.sql#L447434) | — | 1 / 0 | — |
| `UBMgmtListActiveFund` | [L449968](../../../../ScriptDB/000_4_CreateSP.sql#L449968) | — | 0 / 0 | — |
| `UBMgmtListFund` | [L450043](../../../../ScriptDB/000_4_CreateSP.sql#L450043) | — | 0 / 0 | — |
| `UBMgmtListGIC` | [L450073](../../../../ScriptDB/000_4_CreateSP.sql#L450073) | — | 0 / 0 | — |
| `UBNoteAddTaggedFundAccount` | [L454408](../../../../ScriptDB/000_4_CreateSP.sql#L454408) | — | 0 / 1 | — |
| `UBNSPFundAccountRepCodeLog` | [L460734](../../../../ScriptDB/000_4_CreateSP.sql#L460734) | — | 1 / 0 | — |
| `UBNSPFundAccountRepCodeLogClientID` | [L460786](../../../../ScriptDB/000_4_CreateSP.sql#L460786) | 1 / 1 file | 0 / 0 | [FundAccount.cs:3446](../../../../UBClasses/FundAccount.cs#L3446) |
| `UBNSPFundAccountRepCodeLogList` | [L460802](../../../../ScriptDB/000_4_CreateSP.sql#L460802) | 1 / 1 file | 0 / 2 | [FundAccount.cs:3308](../../../../UBClasses/FundAccount.cs#L3308) |
| `UBNSPFundAccountRepCodeLogRemove` | [L460937](../../../../ScriptDB/000_4_CreateSP.sql#L460937) | 1 / 1 file | 0 / 0 | [FundAccount.cs:3398](../../../../UBClasses/FundAccount.cs#L3398) |
| `UBPlanAvailableCashInfo4GIC` | [L487276](../../../../ScriptDB/000_4_CreateSP.sql#L487276) | 1 / 1 file | 0 / 0 | [CashAccount.cs:86](../../../../UBClasses/CashAccount.cs#L86) |
| `UBPlanCheckFundCurrency` | [L487752](../../../../ScriptDB/000_4_CreateSP.sql#L487752) | — | 0 / 0 | — |
| `UBPlanGICList` | [L490282](../../../../ScriptDB/000_4_CreateSP.sql#L490282) | 2 / 1 file | 1 / 0 | [Customer.cs:3049](../../../../UBClasses/Customer.cs#L3049) |
| `UBPlanGICListShort` | [L490488](../../../../ScriptDB/000_4_CreateSP.sql#L490488) | 1 / 1 file | 0 / 0 | [TermDeposit.cs:1277](../../../../UBClasses/TermDeposit.cs#L1277) |
| `UBReportAssetByFund` | [L510177](../../../../ScriptDB/000_4_CreateSP.sql#L510177) | 1 / 1 file | 0 / 7 | [CAssetByFund.cs:879](../../../../VieFUNDPdf/CAssetByFund.cs#L879) |
| `UBReportAssetByFundTop` | [L510417](../../../../ScriptDB/000_4_CreateSP.sql#L510417) | 1 / 1 file | 0 / 6 | [CAssetByFund.cs:936](../../../../VieFUNDPdf/CAssetByFund.cs#L936) |
| `UBReportFundAccountLoad` | [L561691](../../../../ScriptDB/000_4_CreateSP.sql#L561691) | — | 1 / 2 | — |
| `UBReportGetFundUnit` | [L561864](../../../../ScriptDB/000_4_CreateSP.sql#L561864) | — | 1 / 2 | — |
| `UBReportGICLoad` | [L562026](../../../../ScriptDB/000_4_CreateSP.sql#L562026) | — | 1 / 1 | — |
| `UBReportGICTrxLoad` | [L562152](../../../../ScriptDB/000_4_CreateSP.sql#L562152) | — | 1 / 0 | — |
| `UBRORCalc1FundPos` | [L585379](../../../../ScriptDB/000_4_CreateSP.sql#L585379) | — | 12 / 2 | — |
| `UBRRIFMoveFund` | [L589101](../../../../ScriptDB/000_4_CreateSP.sql#L589101) | — | 0 / 0 | — |
| `UBRRIFSettingFundAdd` | [L593297](../../../../ScriptDB/000_4_CreateSP.sql#L593297) | 1 / 1 file | 0 / 1 | [RRIFSetting.cs:714](../../../../UBClasses/RRIFSetting.cs#L714) |
| `UBRRIFSettingFundList` | [L593426](../../../../ScriptDB/000_4_CreateSP.sql#L593426) | 1 / 1 file | 3 / 0 | [RRIFSetting.cs:316](../../../../UBClasses/RRIFSetting.cs#L316) |
| `UBRRIFSettingInfoFund` | [L593702](../../../../ScriptDB/000_4_CreateSP.sql#L593702) | 1 / 1 file | 0 / 0 | [RRIFSetting.cs:413](../../../../UBClasses/RRIFSetting.cs#L413) |
| `UBRRIFSettingRemoveFund` | [L593814](../../../../ScriptDB/000_4_CreateSP.sql#L593814) | 1 / 1 file | 0 / 1 | [RRIFSetting.cs:768](../../../../UBClasses/RRIFSetting.cs#L768) |
| `UBSegFundInfo` | [L598758](../../../../ScriptDB/000_4_CreateSP.sql#L598758) | — | 1 / 0 | — |
| `UBSegFundInfoUpdate` | [L598797](../../../../ScriptDB/000_4_CreateSP.sql#L598797) | — | 2 / 0 | — |
| `UBSysIDGICTrxCode` | [L603004](../../../../ScriptDB/000_4_CreateSP.sql#L603004) | — | 8 / 0 | — |
| `UBSysPlanRefreshFundPosition` | [L606555](../../../../ScriptDB/000_4_CreateSP.sql#L606555) | — | 1 / 0 | — |
| `UBTrustBuyGICAdd` | [L643916](../../../../ScriptDB/000_4_CreateSP.sql#L643916) | — | 2 / 1 | — |
| `UBTrustSellGICAdd` | [L658275](../../../../ScriptDB/000_4_CreateSP.sql#L658275) | — | 3 / 0 | — |
| `UBTrxListSetForSequenceTest` | [L670423](../../../../ScriptDB/000_4_CreateSP.sql#L670423) | 1 / 1 file | 0 / 0 | [Trx.cs:130](../../../../UBClasses/Trx.cs#L130) |
| `VF_VF_AllFundFact` | [L708423](../../../../ScriptDB/000_4_CreateSP.sql#L708423) | — | 0 / 1 | — |
| `VF_VF_AllGICConfirmationObj` | [L708448](../../../../ScriptDB/000_4_CreateSP.sql#L708448) | — | 0 / 0 | — |
| `VF_VF_GIC_Mgmt_After` | [L709448](../../../../ScriptDB/000_4_CreateSP.sql#L709448) | — | 0 / 1 | — |
| `VF_VF_GIC_Product` | [L709502](../../../../ScriptDB/000_4_CreateSP.sql#L709502) | — | 0 / 0 | — |
| `VF_VF_OneFundFact` | [L711443](../../../../ScriptDB/000_4_CreateSP.sql#L711443) | — | 1 / 1 | — |
| `VF_VF_OneFundFactObj` | [L711485](../../../../ScriptDB/000_4_CreateSP.sql#L711485) | — | 1 / 0 | — |
| `VF_VF_OneGICTrx` | [L711511](../../../../ScriptDB/000_4_CreateSP.sql#L711511) | — | 1 / 0 | — |
| `VF_VF_OnePlanGIC` | [L712407](../../../../ScriptDB/000_4_CreateSP.sql#L712407) | — | 1 / 1 | — |
