# SP Catalog — Omnibus

> Phân nhóm gợi ý theo tên procedure. Các cột caller mới là bằng chứng truy vết; `—` không có nghĩa procedure không được dùng.

**Tổng**: 164 definition; 80 có tên tĩnh từ C#; 39 được procedure khác gọi qua EXEC/EXECUTE.

| Procedure | Definition | C# tĩnh | SQL gọi vào / gọi ra | Caller C# mẫu |
|---|---:|---:|---:|---|
| `OM_SetRejectClientTrx` | [L143560](../../../../ScriptDB/000_4_CreateSP.sql#L143560) | — | 0 / 0 | — |
| `OMAccountCompareClear` | [L143581](../../../../ScriptDB/000_4_CreateSP.sql#L143581) | — | 0 / 0 | — |
| `OMAccountCompareClientList` | [L143608](../../../../ScriptDB/000_4_CreateSP.sql#L143608) | 1 / 1 file | 0 / 0 | [AccountCompare.cs:331](../../../../VFOmnibus/AccountCompare.cs#L331) |
| `OMAccountCompareStep1` | [L143837](../../../../ScriptDB/000_4_CreateSP.sql#L143837) | — | 0 / 2 | — |
| `OMAccountCompareStep2` | [L143953](../../../../ScriptDB/000_4_CreateSP.sql#L143953) | — | 0 / 0 | — |
| `OMAccountCompareStep3` | [L144109](../../../../ScriptDB/000_4_CreateSP.sql#L144109) | 1 / 1 file | 0 / 0 | [AccountCompare.cs:252](../../../../VFOmnibus/AccountCompare.cs#L252) |
| `OMAccountList` | [L144174](../../../../ScriptDB/000_4_CreateSP.sql#L144174) | — | 0 / 0 | — |
| `OMCalculateOne4OmniDetail` | [L144309](../../../../ScriptDB/000_4_CreateSP.sql#L144309) | — | 0 / 0 | — |
| `OMCalculateOneConfirmCashTrx` | [L144457](../../../../ScriptDB/000_4_CreateSP.sql#L144457) | — | 0 / 0 | — |
| `OMCalculateOneConfirmTrx` | [L144513](../../../../ScriptDB/000_4_CreateSP.sql#L144513) | — | 3 / 0 | — |
| `OMCashTrxStatusUpdate` | [L144655](../../../../ScriptDB/000_4_CreateSP.sql#L144655) | 1 / 1 file | 0 / 2 | [Omnibus.cs:2263](../../../../VFOmnibus/Omnibus.cs#L2263) |
| `OMCheckAllShareBalanceClientSide` | [L144751](../../../../ScriptDB/000_4_CreateSP.sql#L144751) | — | 2 / 1 | — |
| `OMCheckTrx_AccountUnit_CSH` | [L144826](../../../../ScriptDB/000_4_CreateSP.sql#L144826) | — | 0 / 0 | — |
| `OMCheckTrxAccountUnit` | [L144875](../../../../ScriptDB/000_4_CreateSP.sql#L144875) | — | 0 / 1 | — |
| `OMConversionAddRefresh` | [L144898](../../../../ScriptDB/000_4_CreateSP.sql#L144898) | 1 / 1 file | 0 / 0 | [Conversion.cs:141](../../../../VFOmnibus/Conversion.cs#L141) |
| `OMConversionDetailSet` | [L145087](../../../../ScriptDB/000_4_CreateSP.sql#L145087) | 1 / 1 file | 0 / 0 | [Conversion.cs:239](../../../../VFOmnibus/Conversion.cs#L239) |
| `OMConversionHeaderSet` | [L145149](../../../../ScriptDB/000_4_CreateSP.sql#L145149) | 1 / 1 file | 0 / 0 | [Conversion.cs:191](../../../../VFOmnibus/Conversion.cs#L191) |
| `OMConversionProcess` | [L145206](../../../../ScriptDB/000_4_CreateSP.sql#L145206) | 1 / 1 file | 0 / 1 | [Conversion.cs:286](../../../../VFOmnibus/Conversion.cs#L286) |
| `OMConversionRemove` | [L145396](../../../../ScriptDB/000_4_CreateSP.sql#L145396) | 1 / 1 file | 0 / 0 | [Conversion.cs:374](../../../../VFOmnibus/Conversion.cs#L374) |
| `OMConversionSynch` | [L145423](../../../../ScriptDB/000_4_CreateSP.sql#L145423) | 1 / 1 file | 0 / 1 | [Conversion.cs:330](../../../../VFOmnibus/Conversion.cs#L330) |
| `OMConversionTrxFromSet` | [L145516](../../../../ScriptDB/000_4_CreateSP.sql#L145516) | 1 / 1 file | 0 / 0 | [Conversion.cs:39](../../../../VFOmnibus/Conversion.cs#L39) |
| `OMConversionTrxToSet` | [L145565](../../../../ScriptDB/000_4_CreateSP.sql#L145565) | 1 / 1 file | 0 / 0 | [Conversion.cs:89](../../../../VFOmnibus/Conversion.cs#L89) |
| `OMCreateOmnibusDetailFromFundTrx` | [L145632](../../../../ScriptDB/000_4_CreateSP.sql#L145632) | — | 2 / 0 | — |
| `OMCSHUnitDescrepancy` | [L145684](../../../../ScriptDB/000_4_CreateSP.sql#L145684) | — | 0 / 0 | — |
| `OMDividendAdjustmentProcess` | [L145705](../../../../ScriptDB/000_4_CreateSP.sql#L145705) | — | 0 / 2 | — |
| `OMDividendPrepareOne` | [L145871](../../../../ScriptDB/000_4_CreateSP.sql#L145871) | — | 0 / 0 | — |
| `OMDividendTrxInfo` | [L146031](../../../../ScriptDB/000_4_CreateSP.sql#L146031) | 2 / 1 file | 0 / 1 | [Omnibus.cs:1349](../../../../VFOmnibus/Omnibus.cs#L1349) |
| `OMDividendTrxProcess` | [L146447](../../../../ScriptDB/000_4_CreateSP.sql#L146447) | 1 / 1 file | 0 / 2 | [Omnibus.cs:1158](../../../../VFOmnibus/Omnibus.cs#L1158) |
| `OMDividendTrxProcessUndo` | [L146876](../../../../ScriptDB/000_4_CreateSP.sql#L146876) | 1 / 1 file | 0 / 1 | [Omnibus.cs:1212](../../../../VFOmnibus/Omnibus.cs#L1212) |
| `OMDividendTrxSynchOne` | [L146972](../../../../ScriptDB/000_4_CreateSP.sql#L146972) | — | 2 / 1 | — |
| `OMDividendTrxSynchSelected` | [L147030](../../../../ScriptDB/000_4_CreateSP.sql#L147030) | 1 / 1 file | 0 / 1 | [Omnibus.cs:1301](../../../../VFOmnibus/Omnibus.cs#L1301) |
| `OMDividendTrxSynchTagged` | [L147059](../../../../ScriptDB/000_4_CreateSP.sql#L147059) | 1 / 1 file | 0 / 1 | [Omnibus.cs:1113](../../../../VFOmnibus/Omnibus.cs#L1113) |
| `OMFixCreateFundAccount` | [L147097](../../../../ScriptDB/000_4_CreateSP.sql#L147097) | — | 0 / 1 | — |
| `OMFixOmnibusTrxDetailAmount` | [L147134](../../../../ScriptDB/000_4_CreateSP.sql#L147134) | — | 0 / 0 | — |
| `OMFixTrxPrecision` | [L147181](../../../../ScriptDB/000_4_CreateSP.sql#L147181) | — | 0 / 1 | — |
| `OMFundAccountPositionList` | [L147218](../../../../ScriptDB/000_4_CreateSP.sql#L147218) | 1 / 1 file | 0 / 1 | [Omnibus.cs:577](../../../../VFOmnibus/Omnibus.cs#L577) |
| `OMGenerateTrxFromOmnibusDetail` | [L147249](../../../../ScriptDB/000_4_CreateSP.sql#L147249) | — | 8 / 5 | — |
| `OMGetMKV` | [L147564](../../../../ScriptDB/000_4_CreateSP.sql#L147564) | — | 0 / 0 | — |
| `OMGetOmnibusAccountInfo` | [L147607](../../../../ScriptDB/000_4_CreateSP.sql#L147607) | — | 1 / 0 | — |
| `OMGetOmnibusPlanID` | [L147692](../../../../ScriptDB/000_4_CreateSP.sql#L147692) | — | 5 / 1 | — |
| `OMGetOmnibusRepCode` | [L147734](../../../../ScriptDB/000_4_CreateSP.sql#L147734) | — | 1 / 0 | — |
| `OMIactivateUnusedFundAccount` | [L147773](../../../../ScriptDB/000_4_CreateSP.sql#L147773) | — | 2 / 1 | — |
| `OMManualSwitchAdjustPACSWP` | [L147817](../../../../ScriptDB/000_4_CreateSP.sql#L147817) | — | 0 / 0 | — |
| `OMManualSwitchAllFund_AllUnits` | [L147858](../../../../ScriptDB/000_4_CreateSP.sql#L147858) | — | 0 / 1 | — |
| `OMManualSwitchOneFund_AllUnits` | [L147897](../../../../ScriptDB/000_4_CreateSP.sql#L147897) | — | 1 / 3 | — |
| `OMMergerOmnibusTrx` | [L148080](../../../../ScriptDB/000_4_CreateSP.sql#L148080) | — | 1 / 0 | — |
| `OMMonthList` | [L148160](../../../../ScriptDB/000_4_CreateSP.sql#L148160) | 1 / 1 file | 0 / 0 | [OMReport.cs:87](../../../../VFOmnibus/OMReport.cs#L87) |
| `OMMonthlyDataOne` | [L148181](../../../../ScriptDB/000_4_CreateSP.sql#L148181) | — | 2 / 0 | — |
| `OmnibusREVActionSynch` | [L148430](../../../../ScriptDB/000_4_CreateSP.sql#L148430) | 1 / 1 file | 0 / 0 | [Omnibus.cs:2220](../../../../VFOmnibus/Omnibus.cs#L2220) |
| `OmnibusREVAddFromTrxList` | [L148471](../../../../ScriptDB/000_4_CreateSP.sql#L148471) | 1 / 1 file | 0 / 0 | [Omnibus.cs:1604](../../../../VFOmnibus/Omnibus.cs#L1604) |
| `OmnibusREVClientPendingCount` | [L148784](../../../../ScriptDB/000_4_CreateSP.sql#L148784) | 1 / 1 file | 0 / 0 | [Omnibus.cs:1512](../../../../VFOmnibus/Omnibus.cs#L1512) |
| `OmnibusREVClientPendingList` | [L148807](../../../../ScriptDB/000_4_CreateSP.sql#L148807) | 1 / 1 file | 0 / 0 | [Omnibus.cs:1558](../../../../VFOmnibus/Omnibus.cs#L1558) |
| `OmnibusREVOmnibusTrxUpdate` | [L148867](../../../../ScriptDB/000_4_CreateSP.sql#L148867) | 1 / 1 file | 0 / 0 | [Omnibus.cs:2173](../../../../VFOmnibus/Omnibus.cs#L2173) |
| `OmnibusREVPendingOmniFromTrxList` | [L148944](../../../../ScriptDB/000_4_CreateSP.sql#L148944) | 1 / 1 file | 0 / 0 | [Omnibus.cs:1654](../../../../VFOmnibus/Omnibus.cs#L1654) |
| `OmnibusREVProcessPendingOmniFromTrxList` | [L149000](../../../../ScriptDB/000_4_CreateSP.sql#L149000) | 1 / 1 file | 0 / 3 | [Omnibus.cs:1699](../../../../VFOmnibus/Omnibus.cs#L1699) |
| `OMNonPortfolioFundAccountSelectionUpdate` | [L149236](../../../../ScriptDB/000_4_CreateSP.sql#L149236) | — | 0 / 0 | — |
| `OMOminbusReversalRemoveOneHeader` | [L149271](../../../../ScriptDB/000_4_CreateSP.sql#L149271) | — | 0 / 1 | — |
| `OMOmnibusAdjustCSHTrx` | [L149314](../../../../ScriptDB/000_4_CreateSP.sql#L149314) | — | 0 / 0 | — |
| `OMOmnibusCashShareBalanceRecalc` | [L149439](../../../../ScriptDB/000_4_CreateSP.sql#L149439) | — | 2 / 1 | — |
| `OMOmnibusDividendSet` | [L149491](../../../../ScriptDB/000_4_CreateSP.sql#L149491) | 1 / 1 file | 0 / 1 | [Omnibus.cs:232](../../../../VFOmnibus/Omnibus.cs#L232) |
| `OMOmnibusFixPrecisionOneFund` | [L149676](../../../../ScriptDB/000_4_CreateSP.sql#L149676) | — | 0 / 1 | — |
| `OMOmnibusMerge2Trx` | [L149753](../../../../ScriptDB/000_4_CreateSP.sql#L149753) | — | 0 / 0 | — |
| `OMOmnibusMergeTrxOneDay` | [L149846](../../../../ScriptDB/000_4_CreateSP.sql#L149846) | 2 / 1 file | 0 / 1 | [Omnibus.cs:2336](../../../../VFOmnibus/Omnibus.cs#L2336) |
| `OMOmnibusOrderAdd` | [L149942](../../../../ScriptDB/000_4_CreateSP.sql#L149942) | 1 / 1 file | 0 / 1 | [Omnibus.cs:874](../../../../VFOmnibus/Omnibus.cs#L874) |
| `OMOmnibusOrderAddOne` | [L149972](../../../../ScriptDB/000_4_CreateSP.sql#L149972) | — | 1 / 2 | — |
| `OMOmnibusOrderDetachInternal` | [L150083](../../../../ScriptDB/000_4_CreateSP.sql#L150083) | — | 2 / 1 | — |
| `OMOmnibusOrderDetailSet` | [L150153](../../../../ScriptDB/000_4_CreateSP.sql#L150153) | 1 / 1 file | 0 / 0 | [Omnibus.cs:421](../../../../VFOmnibus/Omnibus.cs#L421) |
| `OMOmnibusOrderPendingDetach` | [L150308](../../../../ScriptDB/000_4_CreateSP.sql#L150308) | 1 / 1 file | 0 / 1 | [Omnibus.cs:330](../../../../VFOmnibus/Omnibus.cs#L330) |
| `OMOmnibusOrderPendingSet` | [L150328](../../../../ScriptDB/000_4_CreateSP.sql#L150328) | 1 / 1 file | 0 / 1 | [Omnibus.cs:116](../../../../VFOmnibus/Omnibus.cs#L116) |
| `OMOmnibusOrderProcessAuto` | [L150477](../../../../ScriptDB/000_4_CreateSP.sql#L150477) | — | 0 / 1 | — |
| `OMOmnibusOrderProcessAutoOne` | [L150522](../../../../ScriptDB/000_4_CreateSP.sql#L150522) | — | 1 / 2 | — |
| `OMOmnibusOrderRemove` | [L150591](../../../../ScriptDB/000_4_CreateSP.sql#L150591) | 1 / 1 file | 0 / 1 | [Omnibus.cs:373](../../../../VFOmnibus/Omnibus.cs#L373) |
| `OMOmnibusOrderSend2FundServ` | [L150624](../../../../ScriptDB/000_4_CreateSP.sql#L150624) | 1 / 1 file | 0 / 1 | [Omnibus.cs:926](../../../../VFOmnibus/Omnibus.cs#L926) |
| `OMOmnibusOrderSet` | [L150716](../../../../ScriptDB/000_4_CreateSP.sql#L150716) | 1 / 1 file | 0 / 1 | [Omnibus.cs:172](../../../../VFOmnibus/Omnibus.cs#L172) |
| `OMOmnibusOrderSetAsProcessed` | [L150944](../../../../ScriptDB/000_4_CreateSP.sql#L150944) | 1 / 1 file | 0 / 0 | [Omnibus.cs:287](../../../../VFOmnibus/Omnibus.cs#L287) |
| `OMOmnibusPortfolioClientList` | [L151000](../../../../ScriptDB/000_4_CreateSP.sql#L151000) | — | 0 / 0 | — |
| `OMOmnibusProcessOne` | [L151051](../../../../ScriptDB/000_4_CreateSP.sql#L151051) | — | 2 / 3 | — |
| `OMOmnibusProcessOneBuy` | [L151186](../../../../ScriptDB/000_4_CreateSP.sql#L151186) | — | 1 / 1 | — |
| `OMOmnibusProcessOneSell` | [L151367](../../../../ScriptDB/000_4_CreateSP.sql#L151367) | — | 1 / 1 | — |
| `OMOmnibusProcessTaggedItems` | [L151628](../../../../ScriptDB/000_4_CreateSP.sql#L151628) | 1 / 1 file | 0 / 1 | [Omnibus.cs:975](../../../../VFOmnibus/Omnibus.cs#L975) |
| `OMOmnibusREVDetailInfo` | [L151675](../../../../ScriptDB/000_4_CreateSP.sql#L151675) | 1 / 1 file | 0 / 0 | [Omnibus.cs:1941](../../../../VFOmnibus/Omnibus.cs#L1941) |
| `OMOmnibusREVDetailSet` | [L151700](../../../../ScriptDB/000_4_CreateSP.sql#L151700) | 1 / 1 file | 0 / 0 | [Omnibus.cs:1844](../../../../VFOmnibus/Omnibus.cs#L1844) |
| `OMOmnibusREVDetailSetAdjusted` | [L151837](../../../../ScriptDB/000_4_CreateSP.sql#L151837) | 1 / 1 file | 0 / 0 | [Omnibus.cs:1892](../../../../VFOmnibus/Omnibus.cs#L1892) |
| `OMOmnibusREVRemove` | [L151880](../../../../ScriptDB/000_4_CreateSP.sql#L151880) | 1 / 1 file | 0 / 0 | [Omnibus.cs:1744](../../../../VFOmnibus/Omnibus.cs#L1744) |
| `OMOmnibusREVSet` | [L151902](../../../../ScriptDB/000_4_CreateSP.sql#L151902) | 1 / 1 file | 0 / 0 | [Omnibus.cs:1791](../../../../VFOmnibus/Omnibus.cs#L1791) |
| `OMOmnibusShareBalanceRecalc` | [L152000](../../../../ScriptDB/000_4_CreateSP.sql#L152000) | 1 / 1 file | 0 / 3 | [OMReport.cs:1027](../../../../VFOmnibus/OMReport.cs#L1027) |
| `OMOmnibusSynchOne` | [L152057](../../../../ScriptDB/000_4_CreateSP.sql#L152057) | — | 1 / 2 | — |
| `OMOmnibusSynchOneBuySell` | [L152138](../../../../ScriptDB/000_4_CreateSP.sql#L152138) | — | 2 / 1 | — |
| `OMOmnibusSynchSelectedItem` | [L152229](../../../../ScriptDB/000_4_CreateSP.sql#L152229) | 1 / 1 file | 0 / 1 | [Omnibus.cs:1021](../../../../VFOmnibus/Omnibus.cs#L1021) |
| `OMOmnibusSynchTaggedItems` | [L152251](../../../../ScriptDB/000_4_CreateSP.sql#L152251) | 1 / 1 file | 0 / 1 | [Omnibus.cs:1067](../../../../VFOmnibus/Omnibus.cs#L1067) |
| `OMOmnibusTrxChangeSourceID` | [L152304](../../../../ScriptDB/000_4_CreateSP.sql#L152304) | — | 0 / 0 | — |
| `OMOmnibusTrxDetailSet` | [L152333](../../../../ScriptDB/000_4_CreateSP.sql#L152333) | 1 / 1 file | 0 / 0 | [Omnibus.cs:475](../../../../VFOmnibus/Omnibus.cs#L475) |
| `OMOmnibusTrxRevolvingSelectionUpdate` | [L152470](../../../../ScriptDB/000_4_CreateSP.sql#L152470) | — | 0 / 0 | — |
| `OMOmnibusTrxSelectionUpdate` | [L152523](../../../../ScriptDB/000_4_CreateSP.sql#L152523) | — | 0 / 0 | — |
| `OMOmnibusTrxSetAsProcessed` | [L152558](../../../../ScriptDB/000_4_CreateSP.sql#L152558) | — | 0 / 0 | — |
| `OMOrderPending2OmnibusProcess` | [L152586](../../../../ScriptDB/000_4_CreateSP.sql#L152586) | 1 / 1 file | 0 / 1 | [Omnibus.cs:826](../../../../VFOmnibus/Omnibus.cs#L826) |
| `OMOrderPending2OmnibusProcessOne` | [L152742](../../../../ScriptDB/000_4_CreateSP.sql#L152742) | — | 1 / 3 | — |
| `OMOrderPendingSet` | [L153088](../../../../ScriptDB/000_4_CreateSP.sql#L153088) | 1 / 1 file | 0 / 1 | [Omnibus.cs:43](../../../../VFOmnibus/Omnibus.cs#L43) |
| `OMOrderSelectionUpdate` | [L153415](../../../../ScriptDB/000_4_CreateSP.sql#L153415) | — | 0 / 0 | — |
| `OMPlanPortfolioDescriptionUpdate` | [L153450](../../../../ScriptDB/000_4_CreateSP.sql#L153450) | — | 0 / 0 | — |
| `OMPlanSwitchPortfolio` | [L153483](../../../../ScriptDB/000_4_CreateSP.sql#L153483) | 1 / 1 file | 0 / 2 | [Switch.cs:38](../../../../VFOmnibus/Switch.cs#L38) |
| `OMPlanSwitchPortfolio_Old` | [L153708](../../../../ScriptDB/000_4_CreateSP.sql#L153708) | — | 0 / 5 | — |
| `OMPlanSwitchPortfolio_Step1` | [L154047](../../../../ScriptDB/000_4_CreateSP.sql#L154047) | — | 0 / 2 | — |
| `OMPlanSwitchPortfolio_Step2` | [L154254](../../../../ScriptDB/000_4_CreateSP.sql#L154254) | — | 1 / 5 | — |
| `OMRecalcAllSince` | [L154468](../../../../ScriptDB/000_4_CreateSP.sql#L154468) | — | 0 / 1 | — |
| `OMRecalcAvgShareBalanceAllFundAccounts` | [L154502](../../../../ScriptDB/000_4_CreateSP.sql#L154502) | — | 0 / 1 | — |
| `OMRecalcAvgShareBalanceFundAccountSince` | [L154541](../../../../ScriptDB/000_4_CreateSP.sql#L154541) | — | 1 / 1 | — |
| `OMRecalcAvgShareBalanceOneFundAccount` | [L154589](../../../../ScriptDB/000_4_CreateSP.sql#L154589) | — | 18 / 0 | — |
| `OMRecalcAvgShareBalanceOneFundAccountOmniside` | [L154722](../../../../ScriptDB/000_4_CreateSP.sql#L154722) | — | 7 / 0 | — |
| `OMRecalcAvgShareBalanceOnePlan` | [L154882](../../../../ScriptDB/000_4_CreateSP.sql#L154882) | — | 0 / 1 | — |
| `OMReportAssetByProvince` | [L154917](../../../../ScriptDB/000_4_CreateSP.sql#L154917) | 1 / 1 file | 0 / 0 | [OMReport.cs:1144](../../../../VFOmnibus/OMReport.cs#L1144) |
| `OMReportDAVPortfolioCalc` | [L155065](../../../../ScriptDB/000_4_CreateSP.sql#L155065) | 1 / 1 file | 0 / 1 | [OMReport.cs:836](../../../../VFOmnibus/OMReport.cs#L836) |
| `OMReportDAVPortfolioCalc1Portfolio` | [L155141](../../../../ScriptDB/000_4_CreateSP.sql#L155141) | — | 1 / 1 | — |
| `OMReportDAVPortfolioCalc1Portfolio1Fund` | [L155209](../../../../ScriptDB/000_4_CreateSP.sql#L155209) | — | 1 / 0 | — |
| `OMReportHeaderList` | [L155325](../../../../ScriptDB/000_4_CreateSP.sql#L155325) | 1 / 1 file | 0 / 0 | [OMReport.cs:247](../../../../VFOmnibus/OMReport.cs#L247) |
| `OMReportMonthlyDAVDetailList` | [L155373](../../../../ScriptDB/000_4_CreateSP.sql#L155373) | 1 / 1 file | 0 / 0 | [OMReport.cs:784](../../../../VFOmnibus/OMReport.cs#L784) |
| `OMReportNonPortfolioFundAccountList` | [L155484](../../../../ScriptDB/000_4_CreateSP.sql#L155484) | 1 / 1 file | 0 / 0 | [Omnibus.cs:2382](../../../../VFOmnibus/Omnibus.cs#L2382) |
| `OMReportNonPortfolioFundAccountSell` | [L155652](../../../../ScriptDB/000_4_CreateSP.sql#L155652) | 1 / 1 file | 0 / 1 | [Omnibus.cs:2473](../../../../VFOmnibus/Omnibus.cs#L2473) |
| `OMReportNonPortfolioFundAccountSellOne` | [L155688](../../../../ScriptDB/000_4_CreateSP.sql#L155688) | — | 1 / 1 | — |
| `OMReportSaleByAdvisor` | [L155751](../../../../ScriptDB/000_4_CreateSP.sql#L155751) | 1 / 1 file | 0 / 0 | [OMReport.cs:1067](../../../../VFOmnibus/OMReport.cs#L1067) |
| `OMReportShareholderMonthly` | [L155966](../../../../ScriptDB/000_4_CreateSP.sql#L155966) | 1 / 1 file | 0 / 1 | [OMReport.cs:907](../../../../VFOmnibus/OMReport.cs#L907) |
| `OMReportShareholderMonthlyRecalc` | [L156110](../../../../ScriptDB/000_4_CreateSP.sql#L156110) | 1 / 1 file | 0 / 1 | [OMReport.cs:982](../../../../VFOmnibus/OMReport.cs#L982) |
| `OMReportWeeklyCalc` | [L156135](../../../../ScriptDB/000_4_CreateSP.sql#L156135) | 1 / 1 file | 0 / 0 | [OMReport.cs:138](../../../../VFOmnibus/OMReport.cs#L138) |
| `OMReportWeeklyDetailByAdvisorList` | [L156350](../../../../ScriptDB/000_4_CreateSP.sql#L156350) | 1 / 1 file | 0 / 0 | [OMReport.cs:304](../../../../VFOmnibus/OMReport.cs#L304) |
| `OMReportWeeklyDetailByBranchList` | [L156577](../../../../ScriptDB/000_4_CreateSP.sql#L156577) | 1 / 1 file | 0 / 0 | [OMReport.cs:395](../../../../VFOmnibus/OMReport.cs#L395) |
| `OMReportWeeklyDetailByFundList` | [L156629](../../../../ScriptDB/000_4_CreateSP.sql#L156629) | 1 / 1 file | 0 / 0 | [OMReport.cs:630](../../../../VFOmnibus/OMReport.cs#L630) |
| `OMReportWeeklyDetailByPortfolioList` | [L156686](../../../../ScriptDB/000_4_CreateSP.sql#L156686) | 1 / 1 file | 0 / 0 | [OMReport.cs:474](../../../../VFOmnibus/OMReport.cs#L474) |
| `OMReportWeeklyDetailByPortfolioRepList` | [L156737](../../../../ScriptDB/000_4_CreateSP.sql#L156737) | 1 / 1 file | 0 / 0 | [OMReport.cs:528](../../../../VFOmnibus/OMReport.cs#L528) |
| `OMReportWeeklyHeaderSummary` | [L156795](../../../../ScriptDB/000_4_CreateSP.sql#L156795) | 1 / 1 file | 0 / 0 | [OMReport.cs:708](../../../../VFOmnibus/OMReport.cs#L708) |
| `OMREVTrxAdjustedUpdate` | [L156870](../../../../ScriptDB/000_4_CreateSP.sql#L156870) | 1 / 1 file | 0 / 0 | [Omnibus.cs:2125](../../../../VFOmnibus/Omnibus.cs#L2125) |
| `OMREVTrxAdjustOnePos` | [L156903](../../../../ScriptDB/000_4_CreateSP.sql#L156903) | — | 1 / 1 | — |
| `OMREVTrxProcess` | [L156987](../../../../ScriptDB/000_4_CreateSP.sql#L156987) | 1 / 1 file | 0 / 5 | [Omnibus.cs:2028](../../../../VFOmnibus/Omnibus.cs#L2028) |
| `OMREVTrxProcessOne` | [L157129](../../../../ScriptDB/000_4_CreateSP.sql#L157129) | — | 0 / 2 | — |
| `OMREVTrxProcessOneItem` | [L157294](../../../../ScriptDB/000_4_CreateSP.sql#L157294) | 1 / 1 file | 0 / 2 | [Omnibus.cs:1986](../../../../VFOmnibus/Omnibus.cs#L1986) |
| `OMREVTrxProcessOnePos` | [L157464](../../../../ScriptDB/000_4_CreateSP.sql#L157464) | — | 1 / 2 | — |
| `OMREVTrxStatusUpdate` | [L157606](../../../../ScriptDB/000_4_CreateSP.sql#L157606) | 1 / 1 file | 0 / 1 | [Omnibus.cs:2074](../../../../VFOmnibus/Omnibus.cs#L2074) |
| `OMScanOmnibusAccounts` | [L157758](../../../../ScriptDB/000_4_CreateSP.sql#L157758) | — | 2 / 1 | — |
| `OMSetTrxAsCancelled` | [L157818](../../../../ScriptDB/000_4_CreateSP.sql#L157818) | — | 0 / 0 | — |
| `OMSwitchList1Client` | [L157899](../../../../ScriptDB/000_4_CreateSP.sql#L157899) | 1 / 1 file | 0 / 0 | [Switch.cs:88](../../../../VFOmnibus/Switch.cs#L88) |
| `OMSwitchOneFund` | [L157934](../../../../ScriptDB/000_4_CreateSP.sql#L157934) | — | 1 / 1 | — |
| `OMSwitchOneFund_Step1` | [L158038](../../../../ScriptDB/000_4_CreateSP.sql#L158038) | — | 0 / 0 | — |
| `OMSwitchOneFund_Step2` | [L158130](../../../../ScriptDB/000_4_CreateSP.sql#L158130) | — | 0 / 1 | — |
| `OMSwitchOneFundOnePos` | [L158163](../../../../ScriptDB/000_4_CreateSP.sql#L158163) | — | 1 / 4 | — |
| `OMSwitchProcess` | [L158407](../../../../ScriptDB/000_4_CreateSP.sql#L158407) | — | 0 / 0 | — |
| `OMSwitchRemove` | [L158505](../../../../ScriptDB/000_4_CreateSP.sql#L158505) | 1 / 1 file | 0 / 1 | [Switch.cs:134](../../../../VFOmnibus/Switch.cs#L134) |
| `OMSwitchRescan` | [L158618](../../../../ScriptDB/000_4_CreateSP.sql#L158618) | 1 / 1 file | 1 / 2 | [Switch.cs:175](../../../../VFOmnibus/Switch.cs#L175) |
| `OMSwitchRescan_OLd` | [L158667](../../../../ScriptDB/000_4_CreateSP.sql#L158667) | — | 0 / 2 | — |
| `OMSwitchRescanAll` | [L158839](../../../../ScriptDB/000_4_CreateSP.sql#L158839) | — | 0 / 1 | — |
| `OMSynchAll` | [L158863](../../../../ScriptDB/000_4_CreateSP.sql#L158863) | — | 0 / 1 | — |
| `OMSynchOne` | [L158904](../../../../ScriptDB/000_4_CreateSP.sql#L158904) | — | 1 / 3 | — |
| `OMSynchOneBuy` | [L159050](../../../../ScriptDB/000_4_CreateSP.sql#L159050) | — | 2 / 1 | — |
| `OMSynchOneSell` | [L159282](../../../../ScriptDB/000_4_CreateSP.sql#L159282) | — | 2 / 1 | — |
| `OMTransferAdd` | [L159537](../../../../ScriptDB/000_4_CreateSP.sql#L159537) | 1 / 1 file | 0 / 1 | [Transfer.cs:36](../../../../VFOmnibus/Transfer.cs#L36) |
| `OMTransferDetailList` | [L159884](../../../../ScriptDB/000_4_CreateSP.sql#L159884) | 1 / 1 file | 0 / 0 | [Transfer.cs:268](../../../../VFOmnibus/Transfer.cs#L268) |
| `OMTransferFixAverageCost` | [L159979](../../../../ScriptDB/000_4_CreateSP.sql#L159979) | — | 0 / 1 | — |
| `OMTransferList` | [L160027](../../../../ScriptDB/000_4_CreateSP.sql#L160027) | 1 / 1 file | 0 / 0 | [Transfer.cs:213](../../../../VFOmnibus/Transfer.cs#L213) |
| `OMTransferList1Client` | [L160124](../../../../ScriptDB/000_4_CreateSP.sql#L160124) | 1 / 1 file | 0 / 0 | [Transfer.cs:317](../../../../VFOmnibus/Transfer.cs#L317) |
| `OMTransferProcess` | [L160162](../../../../ScriptDB/000_4_CreateSP.sql#L160162) | 1 / 1 file | 0 / 6 | [Transfer.cs:125](../../../../VFOmnibus/Transfer.cs#L125) |
| `OMTransferRemove` | [L160684](../../../../ScriptDB/000_4_CreateSP.sql#L160684) | 1 / 1 file | 0 / 1 | [Transfer.cs:84](../../../../VFOmnibus/Transfer.cs#L84) |
| `OMTransferScanOutStanding` | [L160796](../../../../ScriptDB/000_4_CreateSP.sql#L160796) | 1 / 1 file | 0 / 1 | [Transfer.cs:166](../../../../VFOmnibus/Transfer.cs#L166) |
| `OMTransferScanOutStandingOne` | [L160830](../../../../ScriptDB/000_4_CreateSP.sql#L160830) | — | 1 / 8 | — |
| `OMTrxListByPlanIDTradeDateSet` | [L161307](../../../../ScriptDB/000_4_CreateSP.sql#L161307) | 1 / 1 file | 0 / 0 | [Omnibus.cs:1462](../../../../VFOmnibus/Omnibus.cs#L1462) |
| `OMVerifyClientSideBalance` | [L161409](../../../../ScriptDB/000_4_CreateSP.sql#L161409) | — | 0 / 0 | — |
| `OMWeekDatesList` | [L161462](../../../../ScriptDB/000_4_CreateSP.sql#L161462) | 1 / 1 file | 0 / 0 | [OMReport.cs:37](../../../../VFOmnibus/OMReport.cs#L37) |
