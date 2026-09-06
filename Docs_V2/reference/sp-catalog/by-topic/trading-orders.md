# SP Catalog — Trading & Orders

> Phân nhóm gợi ý theo tên procedure. Các cột caller mới là bằng chứng truy vết; `—` không có nghĩa procedure không được dùng.

**Tổng**: 358 definition; 123 có tên tĩnh từ C#; 100 được procedure khác gọi qua EXEC/EXECUTE.

| Procedure | Definition | C# tĩnh | SQL gọi vào / gọi ra | Caller C# mẫu |
|---|---:|---:|---:|---|
| `AGRA_CreateSellOrderFromPAC` | [L16816](../../../../ScriptDB/000_4_CreateSP.sql#L16816) | — | 1 / 1 | — |
| `AGRA_CreateSellOrderFromPAC_2` | [L16895](../../../../ScriptDB/000_4_CreateSP.sql#L16895) | — | 0 / 1 | — |
| `AGRA_TrxList_Deleted` | [L17152](../../../../ScriptDB/000_4_CreateSP.sql#L17152) | — | 0 / 0 | — |
| `AL_ConvOmnibusTrxDetails` | [L20268](../../../../ScriptDB/000_4_CreateSP.sql#L20268) | — | 0 / 1 | — |
| `AL_ConvOmnibusTrxs` | [L20540](../../../../ScriptDB/000_4_CreateSP.sql#L20540) | — | 0 / 0 | — |
| `AMF_TradeBlotter` | [L21296](../../../../ScriptDB/000_4_CreateSP.sql#L21296) | — | 0 / 0 | — |
| `CON_Axis_VF_Trx_One` | [L25339](../../../../ScriptDB/000_4_CreateSP.sql#L25339) | — | 1 / 0 | — |
| `CON_Axis_VF_Trx_OnePos` | [L25547](../../../../ScriptDB/000_4_CreateSP.sql#L25547) | — | 1 / 1 | — |
| `CON_FixTrxLookup_Agenz` | [L27325](../../../../ScriptDB/000_4_CreateSP.sql#L27325) | — | 0 / 1 | — |
| `CON_FixTrxLookup_AgenzOne` | [L27363](../../../../ScriptDB/000_4_CreateSP.sql#L27363) | — | 1 / 4 | — |
| `CON_MergerTrx_AcceptedandContract` | [L28377](../../../../ScriptDB/000_4_CreateSP.sql#L28377) | — | 0 / 0 | — |
| `CON_TrxSwitchFromOrder` | [L35421](../../../../ScriptDB/000_4_CreateSP.sql#L35421) | — | 0 / 1 | — |
| `CON_UN_TrxOne` | [L37684](../../../../ScriptDB/000_4_CreateSP.sql#L37684) | — | 1 / 0 | — |
| `CON_WF_CompTrxTopUp` | [L47414](../../../../ScriptDB/000_4_CreateSP.sql#L47414) | — | 0 / 0 | — |
| `CON_WF_ConversionInvObjTransfer` | [L47501](../../../../ScriptDB/000_4_CreateSP.sql#L47501) | — | 0 / 0 | — |
| `CON_WF_MON_FixTrxWithGST` | [L59243](../../../../ScriptDB/000_4_CreateSP.sql#L59243) | — | 0 / 0 | — |
| `CON_WF_MRSConversion` | [L60475](../../../../ScriptDB/000_4_CreateSP.sql#L60475) | — | 0 / 1 | — |
| `CON_WF_OneRep_Step6_5_Trx_Conversion` | [L69730](../../../../ScriptDB/000_4_CreateSP.sql#L69730) | — | 0 / 1 | — |
| `CON_WF_TrxConversion` | [L83610](../../../../ScriptDB/000_4_CreateSP.sql#L83610) | — | 0 / 1 | — |
| `CON_WF_TrxConversion_Step1_Init` | [L83656](../../../../ScriptDB/000_4_CreateSP.sql#L83656) | — | 0 / 0 | — |
| `CON_WF_TrxConversion_Step1_Init_Topup` | [L83688](../../../../ScriptDB/000_4_CreateSP.sql#L83688) | — | 0 / 0 | — |
| `CON_WF_TrxConversion_Step2` | [L83720](../../../../ScriptDB/000_4_CreateSP.sql#L83720) | — | 0 / 0 | — |
| `CON_WF_TrxConversionOne` | [L83805](../../../../ScriptDB/000_4_CreateSP.sql#L83805) | — | 2 / 0 | — |
| `DI_B2B_DuplicateTrx_Remove` | [L96793](../../../../ScriptDB/000_4_CreateSP.sql#L96793) | — | 0 / 0 | — |
| `DI_FixTrxDueDateNonWire` | [L102191](../../../../ScriptDB/000_4_CreateSP.sql#L102191) | — | 0 / 0 | — |
| `DI_PositionZeroTrxNotZeroActive` | [L107271](../../../../ScriptDB/000_4_CreateSP.sql#L107271) | — | 0 / 0 | — |
| `DI_PositionZeroTrxNotZeroSet` | [L107343](../../../../ScriptDB/000_4_CreateSP.sql#L107343) | — | 0 / 0 | — |
| `DI_SetTrxSequence` | [L109106](../../../../ScriptDB/000_4_CreateSP.sql#L109106) | — | 0 / 0 | — |
| `DI_SetTrxUnitBalance2CalcValues` | [L109132](../../../../ScriptDB/000_4_CreateSP.sql#L109132) | — | 0 / 3 | — |
| `FMOrderBuy` | [L113440](../../../../ScriptDB/000_4_CreateSP.sql#L113440) | — | 0 / 1 | — |
| `FMOrderSell` | [L113540](../../../../ScriptDB/000_4_CreateSP.sql#L113540) | — | 0 / 1 | — |
| `FSXMLOrderXMLTransfer_TBD` | [L114427](../../../../ScriptDB/000_4_CreateSP.sql#L114427) | — | 0 / 0 | — |
| `GetTrxUnitBalance` | [L114572](../../../../ScriptDB/000_4_CreateSP.sql#L114572) | — | 0 / 0 | — |
| `Init_ClearAllTrxBalanceForward` | [L116624](../../../../ScriptDB/000_4_CreateSP.sql#L116624) | — | 0 / 0 | — |
| `Init_CON_GrossNetTrxProblem` | [L117527](../../../../ScriptDB/000_4_CreateSP.sql#L117527) | — | 0 / 0 | — |
| `Init_FixApprovalConversion` | [L118585](../../../../ScriptDB/000_4_CreateSP.sql#L118585) | — | 0 / 1 | — |
| `Init_FixApprovalSwitch` | [L118667](../../../../ScriptDB/000_4_CreateSP.sql#L118667) | — | 0 / 1 | — |
| `Init_ListTrxTradeDateProcessingDateDiff` | [L119768](../../../../ScriptDB/000_4_CreateSP.sql#L119768) | — | 0 / 0 | — |
| `Init_PositionInitialTrxMissing` | [L121720](../../../../ScriptDB/000_4_CreateSP.sql#L121720) | — | 0 / 0 | — |
| `Init_TrxConfFileCreateInit` | [L123799](../../../../ScriptDB/000_4_CreateSP.sql#L123799) | — | 0 / 0 | — |
| `PHX_CON_DistTrx` | [L162012](../../../../ScriptDB/000_4_CreateSP.sql#L162012) | — | 0 / 1 | — |
| `PHX_CON_DistTrx_One` | [L162061](../../../../ScriptDB/000_4_CreateSP.sql#L162061) | — | 1 / 0 | — |
| `PHX_CON_Trx_MF_One` | [L164022](../../../../ScriptDB/000_4_CreateSP.sql#L164022) | — | 1 / 0 | — |
| `PHX_CON_Trx_MF_One_SwitchOutFix` | [L164315](../../../../ScriptDB/000_4_CreateSP.sql#L164315) | — | 0 / 0 | — |
| `PHX_CON_Trx_MF_One_TrnfIn` | [L164563](../../../../ScriptDB/000_4_CreateSP.sql#L164563) | — | 1 / 0 | — |
| `PHX_CON_Trx_MF_One_TrnfIn_1` | [L164720](../../../../ScriptDB/000_4_CreateSP.sql#L164720) | — | 0 / 0 | — |
| `SKDailyTrxExportList` | [L166232](../../../../ScriptDB/000_4_CreateSP.sql#L166232) | — | 1 / 0 | — |
| `SKDailyTrxExportList2Scotia` | [L166308](../../../../ScriptDB/000_4_CreateSP.sql#L166308) | — | 0 / 0 | — |
| `SKDailyTrxExportList2ScotiaOmni` | [L166387](../../../../ScriptDB/000_4_CreateSP.sql#L166387) | — | 1 / 1 | — |
| `SKOrderCancelAdd` | [L167533](../../../../ScriptDB/000_4_CreateSP.sql#L167533) | — | 0 / 0 | — |
| `SKOrderHistoryList` | [L167582](../../../../ScriptDB/000_4_CreateSP.sql#L167582) | 1 / 1 file | 0 / 0 | [ETFOrder.cs:192](../../../../UBClasses/ETFOrder.cs#L192) |
| `SKOrderPendingList` | [L167778](../../../../ScriptDB/000_4_CreateSP.sql#L167778) | 1 / 1 file | 0 / 0 | [ETFOrder.cs:135](../../../../UBClasses/ETFOrder.cs#L135) |
| `SKOrderSelectionUpdate` | [L167966](../../../../ScriptDB/000_4_CreateSP.sql#L167966) | — | 0 / 0 | — |
| `SKOrderSideList` | [L168013](../../../../ScriptDB/000_4_CreateSP.sql#L168013) | — | 2 / 0 | — |
| `SKOrderTimeInForce` | [L168034](../../../../ScriptDB/000_4_CreateSP.sql#L168034) | — | 2 / 0 | — |
| `SKOrderTypeList` | [L168055](../../../../ScriptDB/000_4_CreateSP.sql#L168055) | — | 2 / 0 | — |
| `SKOrderWaiting2SendAdd` | [L168076](../../../../ScriptDB/000_4_CreateSP.sql#L168076) | — | 0 / 0 | — |
| `SKQuickFixOrderAdd` | [L169350](../../../../ScriptDB/000_4_CreateSP.sql#L169350) | — | 1 / 0 | — |
| `SKQuickFixOrderCancel` | [L169433](../../../../ScriptDB/000_4_CreateSP.sql#L169433) | — | 0 / 0 | — |
| `SKQuickFixOrderComboList` | [L169484](../../../../ScriptDB/000_4_CreateSP.sql#L169484) | — | 0 / 6 | — |
| `SKQuickFixOrderItemInfo` | [L169515](../../../../ScriptDB/000_4_CreateSP.sql#L169515) | 1 / 1 file | 0 / 0 | [ETFOrder.cs:280](../../../../UBClasses/ETFOrder.cs#L280) |
| `SKQuickFixOrderRemove` | [L169545](../../../../ScriptDB/000_4_CreateSP.sql#L169545) | — | 0 / 0 | — |
| `SKQuickFixOrderSet` | [L169586](../../../../ScriptDB/000_4_CreateSP.sql#L169586) | 1 / 1 file | 0 / 0 | [VFQFMain.cs:137](../../../../VFQuickFix/VFQuickFix/VFQFMain.cs#L137) |
| `SKQuickFixOrderSetStatus` | [L169690](../../../../ScriptDB/000_4_CreateSP.sql#L169690) | 1 / 1 file | 0 / 0 | [VFQFMain.cs:104](../../../../VFQuickFix/VFQuickFix/VFQFMain.cs#L104) |
| `SKQuickFixOrderUpdate` | [L169703](../../../../ScriptDB/000_4_CreateSP.sql#L169703) | — | 0 / 0 | — |
| `UB_UpdateTrxCOF` | [L173010](../../../../ScriptDB/000_4_CreateSP.sql#L173010) | — | 0 / 0 | — |
| `UB_UpdateTrxCON` | [L173070](../../../../ScriptDB/000_4_CreateSP.sql#L173070) | — | 0 / 0 | — |
| `UBAABuyTrxCreate` | [L173425](../../../../ScriptDB/000_4_CreateSP.sql#L173425) | 1 / 1 file | 0 / 5 | [AssetAllocation.cs:996](../../../../UBClasses/AssetAllocation.cs#L996) |
| `UBAABuyTrxHistory` | [L173621](../../../../ScriptDB/000_4_CreateSP.sql#L173621) | 1 / 1 file | 0 / 0 | [AssetAllocation.cs:1137](../../../../UBClasses/AssetAllocation.cs#L1137) |
| `UBAABuyTrxHistoryDetail` | [L173668](../../../../ScriptDB/000_4_CreateSP.sql#L173668) | 1 / 1 file | 0 / 0 | [AssetAllocation.cs:1185](../../../../UBClasses/AssetAllocation.cs#L1185) |
| `UBAABuyTrxRemove` | [L173706](../../../../ScriptDB/000_4_CreateSP.sql#L173706) | 1 / 1 file | 2 / 2 | [AssetAllocation.cs:1230](../../../../UBClasses/AssetAllocation.cs#L1230) |
| `UBAASellTrxCreate` | [L177510](../../../../ScriptDB/000_4_CreateSP.sql#L177510) | 1 / 1 file | 0 / 3 | [AssetAllocation.cs:1069](../../../../UBClasses/AssetAllocation.cs#L1069) |
| `UBBulkConversionBasketList4Pdf` | [L195099](../../../../ScriptDB/000_4_CreateSP.sql#L195099) | 1 / 1 file | 0 / 0 | [CBulkConversionBasket.cs:892](../../../../VieFUNDPdf/CBulkConversionBasket.cs#L892) |
| `UBBulkConversionBasketPdf` | [L195122](../../../../ScriptDB/000_4_CreateSP.sql#L195122) | 1 / 1 file | 0 / 3 | [CBulkConversionBasket.cs:783](../../../../VieFUNDPdf/CBulkConversionBasket.cs#L783) |
| `UBBulkConversionBasketPdfLoad` | [L195465](../../../../ScriptDB/000_4_CreateSP.sql#L195465) | 1 / 1 file | 0 / 0 | [CBulkConversionBasket.cs:338](../../../../VieFUNDPdf/CBulkConversionBasket.cs#L338) |
| `UBBulkConversionBasketPdfSave` | [L195499](../../../../ScriptDB/000_4_CreateSP.sql#L195499) | 1 / 1 file | 0 / 1 | [CBulkConversionBasket.cs:854](../../../../VieFUNDPdf/CBulkConversionBasket.cs#L854) |
| `UBBulkConversionBasketPendingList` | [L195533](../../../../ScriptDB/000_4_CreateSP.sql#L195533) | 1 / 1 file | 0 / 1 | [BulkSwitchBasket.cs:192](../../../../UBClasses/BulkSwitchBasket.cs#L192) |
| `UBBulkSwitchBasketAdd` | [L195713](../../../../ScriptDB/000_4_CreateSP.sql#L195713) | — | 0 / 1 | — |
| `UBBulkSwitchBasketComboList` | [L195879](../../../../ScriptDB/000_4_CreateSP.sql#L195879) | — | 0 / 5 | — |
| `UBBulkSwitchBasketGenerateTrx` | [L195915](../../../../ScriptDB/000_4_CreateSP.sql#L195915) | 1 / 1 file | 0 / 1 | [BulkSwitchBasket.cs:975](../../../../UBClasses/BulkSwitchBasket.cs#L975) |
| `UBBulkSwitchBasketGenerateTrxOne` | [L195955](../../../../ScriptDB/000_4_CreateSP.sql#L195955) | — | 1 / 4 | — |
| `UBBulkSwitchBasketGetType` | [L196247](../../../../ScriptDB/000_4_CreateSP.sql#L196247) | 1 / 1 file | 0 / 0 | [BulkSwitchBasket.cs:143](../../../../UBClasses/BulkSwitchBasket.cs#L143) |
| `UBBulkSwitchBasketInfo` | [L196270](../../../../ScriptDB/000_4_CreateSP.sql#L196270) | 1 / 1 file | 0 / 0 | [BulkSwitchBasket.cs:798](../../../../UBClasses/BulkSwitchBasket.cs#L798) |
| `UBBulkSwitchBasketItemAdd` | [L196332](../../../../ScriptDB/000_4_CreateSP.sql#L196332) | — | 2 / 1 | — |
| `UBBulkSwitchBasketItemInfo` | [L196364](../../../../ScriptDB/000_4_CreateSP.sql#L196364) | 1 / 1 file | 0 / 0 | [BulkSwitchBasket.cs:929](../../../../UBClasses/BulkSwitchBasket.cs#L929) |
| `UBBulkSwitchBasketList` | [L196445](../../../../ScriptDB/000_4_CreateSP.sql#L196445) | 1 / 1 file | 0 / 1 | [BulkSwitchBasket.cs:542](../../../../UBClasses/BulkSwitchBasket.cs#L542) |
| `UBBulkSwitchBasketList4Pdf` | [L196745](../../../../ScriptDB/000_4_CreateSP.sql#L196745) | 1 / 1 file | 0 / 0 | [CBulkSwitchBasket.cs:134](../../../../VieFUNDPdf/CBulkSwitchBasket.cs#L134) |
| `UBBulkSwitchBasketListSummary` | [L196769](../../../../ScriptDB/000_4_CreateSP.sql#L196769) | 1 / 1 file | 0 / 0 | [BulkSwitchBasket.cs:606](../../../../UBClasses/BulkSwitchBasket.cs#L606) |
| `UBBulkSwitchBasketMarkAsCompletedOne` | [L196817](../../../../ScriptDB/000_4_CreateSP.sql#L196817) | — | 1 / 0 | — |
| `UBBulkSwitchBasketMarkAsCompletedTaggedItems` | [L196842](../../../../ScriptDB/000_4_CreateSP.sql#L196842) | — | 0 / 1 | — |
| `UBBulkSwitchBasketPdf` | [L196886](../../../../ScriptDB/000_4_CreateSP.sql#L196886) | 1 / 1 file | 0 / 3 | [CBulkSwitchBasket.cs:882](../../../../VieFUNDPdf/CBulkSwitchBasket.cs#L882) |
| `UBBulkSwitchBasketPdf_Old` | [L197280](../../../../ScriptDB/000_4_CreateSP.sql#L197280) | — | 0 / 3 | — |
| `UBBulkSwitchBasketPdfLoad` | [L197620](../../../../ScriptDB/000_4_CreateSP.sql#L197620) | 1 / 1 file | 0 / 0 | [CBulkSwitchBasket.cs:474](../../../../VieFUNDPdf/CBulkSwitchBasket.cs#L474) |
| `UBBulkSwitchBasketPdfSave` | [L197653](../../../../ScriptDB/000_4_CreateSP.sql#L197653) | 1 / 1 file | 0 / 1 | [CBulkSwitchBasket.cs:953](../../../../VieFUNDPdf/CBulkSwitchBasket.cs#L953) |
| `UBBulkSwitchBasketPendingList` | [L197686](../../../../ScriptDB/000_4_CreateSP.sql#L197686) | 1 / 1 file | 0 / 1 | [BulkSwitchBasket.cs:83](../../../../UBClasses/BulkSwitchBasket.cs#L83) |
| `UBBulkSwitchBasketPendingSelectionUpdate` | [L197855](../../../../ScriptDB/000_4_CreateSP.sql#L197855) | — | 0 / 0 | — |
| `UBBulkSwitchBasketRemove` | [L197941](../../../../ScriptDB/000_4_CreateSP.sql#L197941) | 1 / 1 file | 0 / 0 | [BulkSwitchBasket.cs:841](../../../../UBClasses/BulkSwitchBasket.cs#L841) |
| `UBBulkSwitchBasketReverse` | [L197979](../../../../ScriptDB/000_4_CreateSP.sql#L197979) | — | 0 / 1 | — |
| `UBBulkSwitchBasketReverseOne` | [L198046](../../../../ScriptDB/000_4_CreateSP.sql#L198046) | — | 1 / 0 | — |
| `UBBulkSwitchBasketSelectionUpdate` | [L198166](../../../../ScriptDB/000_4_CreateSP.sql#L198166) | — | 0 / 0 | — |
| `UBBulkSwitchBasketStatusList` | [L198200](../../../../ScriptDB/000_4_CreateSP.sql#L198200) | — | 1 / 0 | — |
| `UBBulkSwitchBasketTaggedList` | [L198217](../../../../ScriptDB/000_4_CreateSP.sql#L198217) | 1 / 1 file | 0 / 0 | [BulkSwitchBasket.cs:1067](../../../../UBClasses/BulkSwitchBasket.cs#L1067) |
| `UBBulkSwitchBasketTextItemInfo` | [L198241](../../../../ScriptDB/000_4_CreateSP.sql#L198241) | 1 / 1 file | 0 / 0 | [BulkSwitchBasket.cs:1717](../../../../UBClasses/BulkSwitchBasket.cs#L1717) |
| `UBBulkSwitchBasketTextItemUpdate` | [L198256](../../../../ScriptDB/000_4_CreateSP.sql#L198256) | — | 0 / 0 | — |
| `UBBulkSwitchBasketTextKeyList` | [L198276](../../../../ScriptDB/000_4_CreateSP.sql#L198276) | 1 / 1 file | 0 / 0 | [BulkSwitchBasket.cs:1678](../../../../UBClasses/BulkSwitchBasket.cs#L1678) |
| `UBBulkSwitchBasketUpdate` | [L198305](../../../../ScriptDB/000_4_CreateSP.sql#L198305) | — | 0 / 1 | — |
| `UBBulkSwitchInit` | [L198671](../../../../ScriptDB/000_4_CreateSP.sql#L198671) | — | 0 / 0 | — |
| `UBBulkSwitchList` | [L198729](../../../../ScriptDB/000_4_CreateSP.sql#L198729) | 1 / 1 file | 0 / 1 | [FundAccount.cs:1988](../../../../UBClasses/FundAccount.cs#L1988) |
| `UBBulkSwitchPendingSelectionUpdate` | [L199192](../../../../ScriptDB/000_4_CreateSP.sql#L199192) | — | 0 / 0 | — |
| `UBBulkSwitchProcess` | [L199239](../../../../ScriptDB/000_4_CreateSP.sql#L199239) | — | 0 / 5 | — |
| `UBBulkSwitchSelectionUpdate` | [L199494](../../../../ScriptDB/000_4_CreateSP.sql#L199494) | — | 0 / 0 | — |
| `UBCannexOrderConfirmAddRecord` | [L201167](../../../../ScriptDB/000_4_CreateSP.sql#L201167) | — | 0 / 1 | — |
| `UBCannexOrderConfirmAddRecordAddress` | [L201310](../../../../ScriptDB/000_4_CreateSP.sql#L201310) | — | 0 / 0 | — |
| `UBCannexOrderConfirmAddRecordNote` | [L201376](../../../../ScriptDB/000_4_CreateSP.sql#L201376) | — | 0 / 0 | — |
| `UBCannexOrderCreateFileName` | [L201396](../../../../ScriptDB/000_4_CreateSP.sql#L201396) | — | 1 / 0 | — |
| `UBCannexTrxReconAddRecord` | [L202064](../../../../ScriptDB/000_4_CreateSP.sql#L202064) | — | 0 / 0 | — |
| `UBCanSellConversion` | [L202292](../../../../ScriptDB/000_4_CreateSP.sql#L202292) | — | 0 / 0 | — |
| `UBCompCalcRiskTrx` | [L274952](../../../../ScriptDB/000_4_CreateSP.sql#L274952) | 1 / 1 file | 0 / 0 | [Compliance.cs:563](../../../../UBClasses/Compliance.cs#L563) |
| `UBCompDeficiencyLogTrx` | [L276445](../../../../ScriptDB/000_4_CreateSP.sql#L276445) | 1 / 1 file | 0 / 0 | [Compliance.cs:4855](../../../../UBClasses/Compliance.cs#L4855) |
| `UBCompTrendTrxDSCIssue` | [L282897](../../../../ScriptDB/000_4_CreateSP.sql#L282897) | — | 0 / 2 | — |
| `UBCompTrendTrxDSCIssueCriteriaSave` | [L283188](../../../../ScriptDB/000_4_CreateSP.sql#L283188) | — | 1 / 1 | — |
| `UBCompTrendTrxShortTerm` | [L283745](../../../../ScriptDB/000_4_CreateSP.sql#L283745) | — | 0 / 2 | — |
| `UBCompTrendTrxShortTermCriteriaSave` | [L284034](../../../../ScriptDB/000_4_CreateSP.sql#L284034) | — | 1 / 1 | — |
| `UBCompTrendTrxSwitchLoad` | [L284558](../../../../ScriptDB/000_4_CreateSP.sql#L284558) | — | 0 / 2 | — |
| `UBCompTrendTrxSwitchLoadCriteriaSave` | [L284847](../../../../ScriptDB/000_4_CreateSP.sql#L284847) | — | 1 / 1 | — |
| `UBCompTrxApprovalFixAll` | [L285106](../../../../ScriptDB/000_4_CreateSP.sql#L285106) | — | 0 / 1 | — |
| `UBCompTrxApprovalFixOne` | [L285216](../../../../ScriptDB/000_4_CreateSP.sql#L285216) | — | 1 / 1 | — |
| `UBCompTrxApprovalStatusInfo` | [L285360](../../../../ScriptDB/000_4_CreateSP.sql#L285360) | 1 / 1 file | 0 / 0 | [Compliance.cs:1334](../../../../UBClasses/Compliance.cs#L1334) |
| `UBCompTrxApproveTaggedItems` | [L285406](../../../../ScriptDB/000_4_CreateSP.sql#L285406) | 1 / 1 file | 0 / 1 | [Compliance.cs:1431](../../../../UBClasses/Compliance.cs#L1431) |
| `UBCompTrxApproveTaggedItemsX` | [L285450](../../../../ScriptDB/000_4_CreateSP.sql#L285450) | 1 / 1 file | 0 / 1 | [Compliance.cs:1493](../../../../UBClasses/Compliance.cs#L1493) |
| `UBCompTrxReviewHistory` | [L285994](../../../../ScriptDB/000_4_CreateSP.sql#L285994) | — | 2 / 0 | — |
| `UBCompTrxStatusClean` | [L286137](../../../../ScriptDB/000_4_CreateSP.sql#L286137) | — | 0 / 0 | — |
| `UBCompTrxStatusUpdate` | [L286163](../../../../ScriptDB/000_4_CreateSP.sql#L286163) | 1 / 1 file | 0 / 1 | [Compliance.cs:1378](../../../../UBClasses/Compliance.cs#L1378) |
| `UBCompTrxStatusUpdateManual` | [L286184](../../../../ScriptDB/000_4_CreateSP.sql#L286184) | — | 0 / 1 | — |
| `UBCompTrxStatusUpdateOne` | [L286228](../../../../ScriptDB/000_4_CreateSP.sql#L286228) | — | 3 / 4 | — |
| `UBCompTrxStatusUpdateOneManual` | [L286644](../../../../ScriptDB/000_4_CreateSP.sql#L286644) | — | 1 / 0 | — |
| `UBCompTrxStatusUpdateOneX` | [L286755](../../../../ScriptDB/000_4_CreateSP.sql#L286755) | — | 2 / 2 | — |
| `UBCompTrxStatusUpdateOneXOne` | [L286817](../../../../ScriptDB/000_4_CreateSP.sql#L286817) | — | 1 / 3 | — |
| `UBCompTrxStatusUpdateXXX2` | [L287211](../../../../ScriptDB/000_4_CreateSP.sql#L287211) | — | 1 / 0 | — |
| `UBCompTrxStatusUpdateXXXList` | [L287289](../../../../ScriptDB/000_4_CreateSP.sql#L287289) | — | 0 / 1 | — |
| `UBCompTrxTrendRecalc` | [L292547](../../../../ScriptDB/000_4_CreateSP.sql#L292547) | — | 3 / 0 | — |
| `UBCompTrxTypeAdd` | [L292703](../../../../ScriptDB/000_4_CreateSP.sql#L292703) | 1 / 1 file | 0 / 0 | [PanelCompTrxTypeSel.aspx.cs:48](../../../../WebApp/Main/PanelCompTrxTypeSel.aspx.cs#L48) |
| `UBCompTrxTypeRemove` | [L292735](../../../../ScriptDB/000_4_CreateSP.sql#L292735) | 1 / 1 file | 0 / 0 | [PopupSetupCompliance.aspx.cs:359](../../../../WebApp/Main/PopupSetupCompliance.aspx.cs#L359) |
| `UBConversionBulkBasketDetails` | [L293095](../../../../ScriptDB/000_4_CreateSP.sql#L293095) | 1 / 1 file | 0 / 0 | [BulkSwitchBasket.cs:1584](../../../../UBClasses/BulkSwitchBasket.cs#L1584) |
| `UBConversionBulkBasketInfo` | [L293112](../../../../ScriptDB/000_4_CreateSP.sql#L293112) | 1 / 1 file | 0 / 0 | [BulkSwitchBasket.cs:1534](../../../../UBClasses/BulkSwitchBasket.cs#L1534) |
| `UBConversionBulkBasketList` | [L293222](../../../../ScriptDB/000_4_CreateSP.sql#L293222) | 1 / 1 file | 0 / 3 | [BulkSwitchBasket.cs:1465](../../../../UBClasses/BulkSwitchBasket.cs#L1465) |
| `UBConversionBulkBasketListSummary` | [L293541](../../../../ScriptDB/000_4_CreateSP.sql#L293541) | 1 / 1 file | 0 / 0 | [BulkSwitchBasket.cs:653](../../../../UBClasses/BulkSwitchBasket.cs#L653) |
| `UBConversionBulkBasketProcess` | [L293589](../../../../ScriptDB/000_4_CreateSP.sql#L293589) | 1 / 1 file | 0 / 1 | [BulkSwitchBasket.cs:1021](../../../../UBClasses/BulkSwitchBasket.cs#L1021) |
| `UBConversionBulkBasketProcessOne` | [L293667](../../../../ScriptDB/000_4_CreateSP.sql#L293667) | — | 1 / 6 | — |
| `UBConversionBulkBasketRemove` | [L294043](../../../../ScriptDB/000_4_CreateSP.sql#L294043) | 1 / 1 file | 0 / 0 | [BulkSwitchBasket.cs:885](../../../../UBClasses/BulkSwitchBasket.cs#L885) |
| `UBConversionBulkBasketSelectionUpdate` | [L294082](../../../../ScriptDB/000_4_CreateSP.sql#L294082) | — | 0 / 0 | — |
| `UBConversionBulkBasketTaggedList` | [L294130](../../../../ScriptDB/000_4_CreateSP.sql#L294130) | 1 / 1 file | 0 / 0 | [BulkSwitchBasket.cs:1112](../../../../UBClasses/BulkSwitchBasket.cs#L1112) |
| `UBConversionProcessManualOne` | [L294155](../../../../ScriptDB/000_4_CreateSP.sql#L294155) | — | 0 / 1 | — |
| `UBDocAddTaggedTrx` | [L312440](../../../../ScriptDB/000_4_CreateSP.sql#L312440) | — | 0 / 2 | — |
| `UBEnvelopeMove2TaggedTrx` | [L320288](../../../../ScriptDB/000_4_CreateSP.sql#L320288) | 1 / 1 file | 0 / 1 | [Document.cs:4418](../../../../UBClasses/Document.cs#L4418) |
| `UBEnvelopeMove2TrxList` | [L320371](../../../../ScriptDB/000_4_CreateSP.sql#L320371) | — | 0 / 1 | — |
| `UBEnvelopeRoutingOrderOptList` | [L320703](../../../../ScriptDB/000_4_CreateSP.sql#L320703) | — | 1 / 0 | — |
| `UBFEInit_ByTradeDate` | [L342278](../../../../ScriptDB/000_4_CreateSP.sql#L342278) | — | 1 / 1 | — |
| `UBFFRecDefSCTrx` | [L347449](../../../../ScriptDB/000_4_CreateSP.sql#L347449) | — | 0 / 0 | — |
| `UBFFRecScotiaTrxProcess` | [L350689](../../../../ScriptDB/000_4_CreateSP.sql#L350689) | 1 / 1 file | 0 / 1 | [ScotiaTrx.cs:161](../../../../UBFFImport/ScotiaTrx.cs#L161) |
| `UBFFRecScotiaTrxProcessOneRecord` | [L350745](../../../../ScriptDB/000_4_CreateSP.sql#L350745) | — | 3 / 3 | — |
| `UBFFRecScotiaTrxProcessOneRecordX` | [L350996](../../../../ScriptDB/000_4_CreateSP.sql#L350996) | — | 0 / 1 | — |
| `UBFFRecSCTrxInsert` | [L351015](../../../../ScriptDB/000_4_CreateSP.sql#L351015) | — | 0 / 0 | — |
| `UBFFRecSCTrxInsertEnd` | [L351142](../../../../ScriptDB/000_4_CreateSP.sql#L351142) | — | 0 / 0 | — |
| `UBFormChangeOrderByName` | [L351965](../../../../ScriptDB/000_4_CreateSP.sql#L351965) | — | 0 / 0 | — |
| `UBFormGetTradeTicket` | [L355779](../../../../ScriptDB/000_4_CreateSP.sql#L355779) | — | 0 / 0 | — |
| `UBFormGetTradeTicketInfo` | [L355816](../../../../ScriptDB/000_4_CreateSP.sql#L355816) | — | 0 / 0 | — |
| `UBFormGetTradeTicketInfoOne` | [L355970](../../../../ScriptDB/000_4_CreateSP.sql#L355970) | — | 0 / 0 | — |
| `UBFormRedemptionProcessingSet` | [L358174](../../../../ScriptDB/000_4_CreateSP.sql#L358174) | — | 0 / 0 | — |
| `UBFSFileRemoveTrx` | [L360707](../../../../ScriptDB/000_4_CreateSP.sql#L360707) | — | 0 / 0 | — |
| `UBMemberTrxPermissionAdd` | [L446915](../../../../ScriptDB/000_4_CreateSP.sql#L446915) | 1 / 1 file | 0 / 0 | [PopupMemberAdd.aspx.cs:974](../../../../WebApp/Main/PopupMemberAdd.aspx.cs#L974) |
| `UBMFTrxList` | [L448543](../../../../ScriptDB/000_4_CreateSP.sql#L448543) | 2 / 1 file | 0 / 0 | [Customer.cs:1531](../../../../UBClasses/Customer.cs#L1531) |
| `UBMFTrxList4Doc` | [L448939](../../../../ScriptDB/000_4_CreateSP.sql#L448939) | 1 / 1 file | 0 / 0 | [Customer.cs:1722](../../../../UBClasses/Customer.cs#L1722) |
| `UBMFTrxListWC` | [L449145](../../../../ScriptDB/000_4_CreateSP.sql#L449145) | 1 / 1 file | 0 / 0 | [Customer.cs:1770](../../../../UBClasses/Customer.cs#L1770) |
| `UBMFTrxListWithAvgCost` | [L449539](../../../../ScriptDB/000_4_CreateSP.sql#L449539) | 1 / 1 file | 0 / 0 | [Trx.cs:6187](../../../../UBClasses/Trx.cs#L6187) |
| `UBMFTrxListX` | [L449586](../../../../ScriptDB/000_4_CreateSP.sql#L449586) | 1 / 1 file | 0 / 0 | [FundAccount.cs:3103](../../../../UBClasses/FundAccount.cs#L3103) |
| `UBNMTrxSettlementList` | [L453707](../../../../ScriptDB/000_4_CreateSP.sql#L453707) | — | 0 / 0 | — |
| `UBNoteAddTaggedTrx` | [L454511](../../../../ScriptDB/000_4_CreateSP.sql#L454511) | — | 0 / 1 | — |
| `UBOrderAssignNewSourceID` | [L472377](../../../../ScriptDB/000_4_CreateSP.sql#L472377) | — | 2 / 1 | — |
| `UBOrderBatchComboList` | [L472409](../../../../ScriptDB/000_4_CreateSP.sql#L472409) | — | 0 / 6 | — |
| `UBOrderConversionAddTMP` | [L472459](../../../../ScriptDB/000_4_CreateSP.sql#L472459) | 1 / 1 file | 0 / 0 | [Trx.cs:5580](../../../../UBClasses/Trx.cs#L5580) |
| `UBOrderConversionCopyTMP` | [L472578](../../../../ScriptDB/000_4_CreateSP.sql#L472578) | — | 0 / 0 | — |
| `UBOrderConversionDelete` | [L472608](../../../../ScriptDB/000_4_CreateSP.sql#L472608) | 1 / 1 file | 0 / 0 | [Trx.cs:5650](../../../../UBClasses/Trx.cs#L5650) |
| `UBOrderConversionDeleteTMP` | [L472664](../../../../ScriptDB/000_4_CreateSP.sql#L472664) | 1 / 1 file | 0 / 0 | [Trx.cs:5702](../../../../UBClasses/Trx.cs#L5702) |
| `UBOrderConversionDetail` | [L472691](../../../../ScriptDB/000_4_CreateSP.sql#L472691) | 1 / 1 file | 0 / 0 | [Trx.cs:5327](../../../../UBClasses/Trx.cs#L5327) |
| `UBOrderConversionInfo` | [L472793](../../../../ScriptDB/000_4_CreateSP.sql#L472793) | 1 / 1 file | 0 / 0 | [Trx.cs:5429](../../../../UBClasses/Trx.cs#L5429) |
| `UBOrderConversionInfoTMP` | [L472836](../../../../ScriptDB/000_4_CreateSP.sql#L472836) | 1 / 1 file | 0 / 0 | [Trx.cs:5477](../../../../UBClasses/Trx.cs#L5477) |
| `UBOrderConversionList` | [L472880](../../../../ScriptDB/000_4_CreateSP.sql#L472880) | 1 / 1 file | 0 / 3 | [Trx.cs:5257](../../../../UBClasses/Trx.cs#L5257) |
| `UBOrderConversionListTMP` | [L473218](../../../../ScriptDB/000_4_CreateSP.sql#L473218) | 1 / 1 file | 0 / 0 | [Trx.cs:5753](../../../../UBClasses/Trx.cs#L5753) |
| `UBOrderConversionUpdate` | [L473308](../../../../ScriptDB/000_4_CreateSP.sql#L473308) | 1 / 1 file | 0 / 0 | [Trx.cs:5522](../../../../UBClasses/Trx.cs#L5522) |
| `UBOrderConversionUpdateTMP` | [L473402](../../../../ScriptDB/000_4_CreateSP.sql#L473402) | 1 / 1 file | 0 / 0 | [Trx.cs:5580](../../../../UBClasses/Trx.cs#L5580) |
| `UBOrderCreateFile` | [L473439](../../../../ScriptDB/000_4_CreateSP.sql#L473439) | 1 / 1 file | 0 / 2 | [COrder.cs:102](../../../../UBFFImport/COrder.cs#L102) |
| `UBOrderCreateFileName` | [L473603](../../../../ScriptDB/000_4_CreateSP.sql#L473603) | — | 1 / 0 | — |
| `UBOrderCreateMSGXML` | [L473728](../../../../ScriptDB/000_4_CreateSP.sql#L473728) | — | 4 / 3 | — |
| `UBOrderDefaultSet` | [L474294](../../../../ScriptDB/000_4_CreateSP.sql#L474294) | — | 0 / 0 | — |
| `UBOrderFileUpdateStatus` | [L474356](../../../../ScriptDB/000_4_CreateSP.sql#L474356) | 1 / 1 file | 0 / 0 | [COrder.cs:137](../../../../UBFFImport/COrder.cs#L137) |
| `UBOrderGetMSG` | [L474396](../../../../ScriptDB/000_4_CreateSP.sql#L474396) | — | 0 / 1 | — |
| `UBOrderHistoryList` | [L474633](../../../../ScriptDB/000_4_CreateSP.sql#L474633) | 1 / 1 file | 0 / 3 | [Trx.cs:4212](../../../../UBClasses/Trx.cs#L4212) |
| `UBOrderPendingList` | [L475544](../../../../ScriptDB/000_4_CreateSP.sql#L475544) | 1 / 1 file | 0 / 5 | [Trx.cs:3876](../../../../UBClasses/Trx.cs#L3876) |
| `UBOrderRealTimeable` | [L476307](../../../../ScriptDB/000_4_CreateSP.sql#L476307) | — | 0 / 0 | — |
| `UBOrderReceiptBasketSet` | [L476339](../../../../ScriptDB/000_4_CreateSP.sql#L476339) | 1 / 1 file | 0 / 9 | [OrderReceipt.cs:974](../../../../VieFUNDPdf/OrderReceipt.cs#L974) |
| `UBOrderReceiptSet` | [L476722](../../../../ScriptDB/000_4_CreateSP.sql#L476722) | 1 / 1 file | 0 / 9 | [OrderReceipt.cs:97](../../../../VieFUNDPdf/OrderReceipt.cs#L97) |
| `UBOrderSelectionUpdate` | [L477285](../../../../ScriptDB/000_4_CreateSP.sql#L477285) | — | 0 / 0 | — |
| `UBOrderSelectionUpdateOmnibus` | [L477343](../../../../ScriptDB/000_4_CreateSP.sql#L477343) | — | 0 / 0 | — |
| `UBOrderSetConfirmOne` | [L477378](../../../../ScriptDB/000_4_CreateSP.sql#L477378) | — | 1 / 4 | — |
| `UBOrderSetConfirmTaggedItems` | [L477516](../../../../ScriptDB/000_4_CreateSP.sql#L477516) | — | 0 / 1 | — |
| `UBOrderSetMsgStatus` | [L477686](../../../../ScriptDB/000_4_CreateSP.sql#L477686) | — | 0 / 0 | — |
| `UBOrderStatusDetail` | [L477754](../../../../ScriptDB/000_4_CreateSP.sql#L477754) | — | 0 / 0 | — |
| `UBOrderTodayList` | [L477874](../../../../ScriptDB/000_4_CreateSP.sql#L477874) | 1 / 1 file | 0 / 1 | [Trx.cs:5802](../../../../UBClasses/Trx.cs#L5802) |
| `UBOrderVerifyNetwork` | [L477974](../../../../ScriptDB/000_4_CreateSP.sql#L477974) | — | 1 / 0 | — |
| `UBOrderWaiting2BBSOrder` | [L478008](../../../../ScriptDB/000_4_CreateSP.sql#L478008) | — | 0 / 1 | — |
| `UBOrderWaiting2SendAdd` | [L478209](../../../../ScriptDB/000_4_CreateSP.sql#L478209) | — | 13 / 1 | — |
| `UBOrderWaiting2SendAddInternal` | [L478233](../../../../ScriptDB/000_4_CreateSP.sql#L478233) | — | 2 / 3 | — |
| `UBOrderWaiting2SendAddOne` | [L478451](../../../../ScriptDB/000_4_CreateSP.sql#L478451) | — | 5 / 0 | — |
| `UBOrderWaiting2SendReAddPendingToReceive` | [L478518](../../../../ScriptDB/000_4_CreateSP.sql#L478518) | — | 0 / 1 | — |
| `UBOrderWaitingReset` | [L478547](../../../../ScriptDB/000_4_CreateSP.sql#L478547) | — | 0 / 0 | — |
| `UBPendingConversionBulkBasketDetails` | [L481736](../../../../ScriptDB/000_4_CreateSP.sql#L481736) | 1 / 1 file | 0 / 0 | [BulkSwitchBasket.cs:1634](../../../../UBClasses/BulkSwitchBasket.cs#L1634) |
| `UBQuestionairDefMoveOrder` | [L506900](../../../../ScriptDB/000_4_CreateSP.sql#L506900) | 1 / 1 file | 0 / 0 | [Questionair.cs:692](../../../../UBClasses/Questionair.cs#L692) |
| `UBRedemptionScheduleDetailHistoryList` | [L507180](../../../../ScriptDB/000_4_CreateSP.sql#L507180) | 1 / 1 file | 0 / 0 | [RRIFSetting.cs:1118](../../../../UBClasses/RRIFSetting.cs#L1118) |
| `UBRedemptionScheduleDetailTrx` | [L507232](../../../../ScriptDB/000_4_CreateSP.sql#L507232) | 1 / 1 file | 0 / 0 | [RRIFSetting.cs:1017](../../../../UBClasses/RRIFSetting.cs#L1017) |
| `UBRedemptionScheduleDetailTrxAmountUpdate` | [L507259](../../../../ScriptDB/000_4_CreateSP.sql#L507259) | 1 / 1 file | 0 / 1 | [RRIFSetting.cs:1067](../../../../UBClasses/RRIFSetting.cs#L1067) |
| `UBRedemptionScheduleHasPendingOrder` | [L507325](../../../../ScriptDB/000_4_CreateSP.sql#L507325) | 1 / 1 file | 0 / 0 | [RRIFSetting.cs:974](../../../../UBClasses/RRIFSetting.cs#L974) |
| `UBRedemptionScheduleHistoryRemove` | [L507350](../../../../ScriptDB/000_4_CreateSP.sql#L507350) | 1 / 1 file | 0 / 0 | [RRIFSetting.cs:1164](../../../../UBClasses/RRIFSetting.cs#L1164) |
| `UBRedemptionScheduleOrderReceiptSet` | [L507397](../../../../ScriptDB/000_4_CreateSP.sql#L507397) | 1 / 1 file | 0 / 8 | [OrderReceipt.cs:161](../../../../VieFUNDPdf/OrderReceipt.cs#L161) |
| `UBRedemptionScheduleRecalc` | [L507695](../../../../ScriptDB/000_4_CreateSP.sql#L507695) | 1 / 1 file | 1 / 4 | [RRIFSetting.cs:922](../../../../UBClasses/RRIFSetting.cs#L922) |
| `UBRedemptionScheduleViewComboList` | [L508255](../../../../ScriptDB/000_4_CreateSP.sql#L508255) | — | 0 / 1 | — |
| `UBReportTrxLoad` | [L567731](../../../../ScriptDB/000_4_CreateSP.sql#L567731) | — | 1 / 0 | — |
| `UBSetOrderSchema` | [L600042](../../../../ScriptDB/000_4_CreateSP.sql#L600042) | — | 0 / 0 | — |
| `UBStockOrderAdd` | [L601897](../../../../ScriptDB/000_4_CreateSP.sql#L601897) | 1 / 1 file | 0 / 6 | [Trx.cs:759](../../../../UBClasses/Trx.cs#L759) |
| `UBStockOrderTypeList` | [L602156](../../../../ScriptDB/000_4_CreateSP.sql#L602156) | — | 0 / 0 | — |
| `UBStockTrxAdd` | [L602177](../../../../ScriptDB/000_4_CreateSP.sql#L602177) | 1 / 1 file | 0 / 2 | [Stock.cs:556](../../../../UBClasses/Stock.cs#L556) |
| `UBStockTrxCalcSAmount` | [L602389](../../../../ScriptDB/000_4_CreateSP.sql#L602389) | — | 2 / 0 | — |
| `UBStockTrxInfo` | [L602448](../../../../ScriptDB/000_4_CreateSP.sql#L602448) | 1 / 1 file | 0 / 1 | [Stock.cs:414](../../../../UBClasses/Stock.cs#L414) |
| `UBStockTrxList` | [L602493](../../../../ScriptDB/000_4_CreateSP.sql#L602493) | 1 / 1 file | 0 / 0 | [Stock.cs:262](../../../../UBClasses/Stock.cs#L262) |
| `UBStockTrxRemove` | [L602544](../../../../ScriptDB/000_4_CreateSP.sql#L602544) | 1 / 1 file | 0 / 2 | [Stock.cs:505](../../../../UBClasses/Stock.cs#L505) |
| `UBStockTrxUpdate` | [L602568](../../../../ScriptDB/000_4_CreateSP.sql#L602568) | 1 / 1 file | 0 / 1 | [Stock.cs:556](../../../../UBClasses/Stock.cs#L556) |
| `UBSysIDTrxCode` | [L603020](../../../../ScriptDB/000_4_CreateSP.sql#L603020) | — | 40 / 0 | — |
| `UBTrxAdd` | [L663106](../../../../ScriptDB/000_4_CreateSP.sql#L663106) | — | 50 / 2 | — |
| `UBTrxAdd_Additions` | [L663390](../../../../ScriptDB/000_4_CreateSP.sql#L663390) | — | 8 / 0 | — |
| `UBTrxAddBalanceForward` | [L663412](../../../../ScriptDB/000_4_CreateSP.sql#L663412) | — | 2 / 0 | — |
| `UBTrxAddComboList` | [L663501](../../../../ScriptDB/000_4_CreateSP.sql#L663501) | — | 0 / 4 | — |
| `UBTrxAmtTypeBulkSwitch` | [L663532](../../../../ScriptDB/000_4_CreateSP.sql#L663532) | — | 1 / 0 | — |
| `UBTrxAmtTypeEO` | [L663558](../../../../ScriptDB/000_4_CreateSP.sql#L663558) | 1 / 1 file | 0 / 0 | [Trx.cs:570](../../../../UBClasses/Trx.cs#L570) |
| `UBTrxAOTList` | [L663613](../../../../ScriptDB/000_4_CreateSP.sql#L663613) | 1 / 1 file | 0 / 0 | [Trx.cs:2813](../../../../UBClasses/Trx.cs#L2813) |
| `UBTrxBlotterList` | [L663688](../../../../ScriptDB/000_4_CreateSP.sql#L663688) | 1 / 1 file | 0 / 0 | [TrxBlotter.cs:69](../../../../UBClasses/TrxBlotter.cs#L69) |
| `UBTrxBuyPAC` | [L664038](../../../../ScriptDB/000_4_CreateSP.sql#L664038) | — | 3 / 2 | — |
| `UBTrxCalcAverageCost` | [L664150](../../../../ScriptDB/000_4_CreateSP.sql#L664150) | — | 0 / 0 | — |
| `UBTrxCalcAverageCost4Update` | [L664173](../../../../ScriptDB/000_4_CreateSP.sql#L664173) | — | 6 / 0 | — |
| `UBTrxConf4PdfTaggedList` | [L664525](../../../../ScriptDB/000_4_CreateSP.sql#L664525) | 1 / 1 file | 0 / 0 | [CTrxConfirmation.cs:574](../../../../UBClasses/CTrxConfirmation.cs#L574) |
| `UBTrxConfDefList` | [L664613](../../../../ScriptDB/000_4_CreateSP.sql#L664613) | — | 0 / 0 | — |
| `UBTrxConfDeliverTagged` | [L664635](../../../../ScriptDB/000_4_CreateSP.sql#L664635) | — | 0 / 1 | — |
| `UBTrxConfirmationDeliverItem` | [L664679](../../../../ScriptDB/000_4_CreateSP.sql#L664679) | — | 0 / 1 | — |
| `UBTrxConfirmationDeliverItemX` | [L664839](../../../../ScriptDB/000_4_CreateSP.sql#L664839) | 1 / 1 file | 1 / 1 | [TradeConfirmation.cs:548](../../../../VieFUNDPdf/TradeConfirmation.cs#L548) |
| `UBTrxConfirmationDeliverTaggedItemX` | [L665048](../../../../ScriptDB/000_4_CreateSP.sql#L665048) | — | 1 / 1 | — |
| `UBTrxConfirmationList` | [L665279](../../../../ScriptDB/000_4_CreateSP.sql#L665279) | 1 / 1 file | 0 / 1 | [Document.cs:3696](../../../../UBClasses/Document.cs#L3696) |
| `UBTrxConfirmationListDetail` | [L666214](../../../../ScriptDB/000_4_CreateSP.sql#L666214) | 1 / 1 file | 0 / 0 | [CTrxConfirmation.cs:331](../../../../UBClasses/CTrxConfirmation.cs#L331) |
| `UBTrxConfirmationObjByID` | [L666483](../../../../ScriptDB/000_4_CreateSP.sql#L666483) | 1 / 1 file | 0 / 0 | [Document.cs:3636](../../../../UBClasses/Document.cs#L3636) |
| `UBTrxConfirmationRemove` | [L666510](../../../../ScriptDB/000_4_CreateSP.sql#L666510) | — | 0 / 0 | — |
| `UBTrxConfirmationRemoveItem` | [L666525](../../../../ScriptDB/000_4_CreateSP.sql#L666525) | — | 0 / 0 | — |
| `UBTrxConfirmationSavePdfObj` | [L666575](../../../../ScriptDB/000_4_CreateSP.sql#L666575) | 1 / 1 file | 0 / 1 | [TradeConfirmation.cs:505](../../../../VieFUNDPdf/TradeConfirmation.cs#L505) |
| `UBTrxConfirmationSet` | [L666641](../../../../ScriptDB/000_4_CreateSP.sql#L666641) | 1 / 1 file | 0 / 8 | [TradeConfirmation.cs:595](../../../../VieFUNDPdf/TradeConfirmation.cs#L595) |
| `UBTrxConfirmationSetRedo` | [L667109](../../../../ScriptDB/000_4_CreateSP.sql#L667109) | 1 / 1 file | 0 / 8 | [TradeConfirmation.cs:653](../../../../VieFUNDPdf/TradeConfirmation.cs#L653) |
| `UBTrxConfirmationViewComboList` | [L667499](../../../../ScriptDB/000_4_CreateSP.sql#L667499) | — | 0 / 5 | — |
| `UBTrxConfPdf_EndTask` | [L667536](../../../../ScriptDB/000_4_CreateSP.sql#L667536) | — | 0 / 0 | — |
| `UBTrxConfPdf_GetTask` | [L667555](../../../../ScriptDB/000_4_CreateSP.sql#L667555) | — | 0 / 0 | — |
| `UBTrxConfPendingList` | [L667592](../../../../ScriptDB/000_4_CreateSP.sql#L667592) | 1 / 1 file | 0 / 0 | [CTrxConfirmation.cs:45](../../../../UBClasses/CTrxConfirmation.cs#L45) |
| `UBTrxConfPendingSelectionUpdate` | [L668671](../../../../ScriptDB/000_4_CreateSP.sql#L668671) | — | 0 / 0 | — |
| `UBTrxConfSelectionUpdate` | [L668712](../../../../ScriptDB/000_4_CreateSP.sql#L668712) | — | 0 / 0 | — |
| `UBTrxConfViewList4Pdf` | [L668803](../../../../ScriptDB/000_4_CreateSP.sql#L668803) | 1 / 1 file | 0 / 0 | [TradeConfirmation.cs:194](../../../../VieFUNDPdf/TradeConfirmation.cs#L194) |
| `UBTrxContrWdrCodeList` | [L668848](../../../../ScriptDB/000_4_CreateSP.sql#L668848) | — | 1 / 0 | — |
| `UBTrxConversion` | [L668873](../../../../ScriptDB/000_4_CreateSP.sql#L668873) | — | 1 / 0 | — |
| `UBTrxConversionProcess` | [L668962](../../../../ScriptDB/000_4_CreateSP.sql#L668962) | — | 2 / 2 | — |
| `UBTrxConversionProcessAll` | [L669189](../../../../ScriptDB/000_4_CreateSP.sql#L669189) | — | 4 / 1 | — |
| `UBTrxDeleteOrUndo` | [L669318](../../../../ScriptDB/000_4_CreateSP.sql#L669318) | — | 0 / 1 | — |
| `UBTrxDuplicate` | [L669411](../../../../ScriptDB/000_4_CreateSP.sql#L669411) | — | 1 / 0 | — |
| `UBTrxFixSequence` | [L669667](../../../../ScriptDB/000_4_CreateSP.sql#L669667) | — | 0 / 0 | — |
| `UBTrxInfo` | [L669761](../../../../ScriptDB/000_4_CreateSP.sql#L669761) | 1 / 1 file | 0 / 1 | [Customer.cs:1997](../../../../UBClasses/Customer.cs#L1997) |
| `UBTrxInfoEdit` | [L670095](../../../../ScriptDB/000_4_CreateSP.sql#L670095) | 1 / 1 file | 0 / 0 | [Trx.cs:3457](../../../../UBClasses/Trx.cs#L3457) |
| `UBTrxInfoSmall` | [L670261](../../../../ScriptDB/000_4_CreateSP.sql#L670261) | 1 / 1 file | 0 / 0 | [Trx.cs:193](../../../../UBClasses/Trx.cs#L193) |
| `UBTrxInfoSmallSave` | [L670311](../../../../ScriptDB/000_4_CreateSP.sql#L670311) | 1 / 1 file | 0 / 0 | [Trx.cs:255](../../../../UBClasses/Trx.cs#L255) |
| `UBTrxListHighAmountGet` | [L670353](../../../../ScriptDB/000_4_CreateSP.sql#L670353) | — | 0 / 0 | — |
| `UBTrxManualAddComboList` | [L670531](../../../../ScriptDB/000_4_CreateSP.sql#L670531) | — | 0 / 13 | — |
| `UBTrxMerge` | [L670574](../../../../ScriptDB/000_4_CreateSP.sql#L670574) | — | 0 / 0 | — |
| `UBTrxMergeConfirm2Accepted` | [L670634](../../../../ScriptDB/000_4_CreateSP.sql#L670634) | — | 1 / 0 | — |
| `UBTrxMergeConfirm2AcceptedAll` | [L670726](../../../../ScriptDB/000_4_CreateSP.sql#L670726) | — | 0 / 1 | — |
| `UBTrxOrderInfoEdit` | [L670987](../../../../ScriptDB/000_4_CreateSP.sql#L670987) | 1 / 1 file | 0 / 0 | [Trx.cs:3623](../../../../UBClasses/Trx.cs#L3623) |
| `UBTrxOrderRemove` | [L671082](../../../../ScriptDB/000_4_CreateSP.sql#L671082) | — | 13 / 8 | — |
| `UBTrxOrderSourceList` | [L671387](../../../../ScriptDB/000_4_CreateSP.sql#L671387) | — | 2 / 0 | — |
| `UBTrxOrderStatusList` | [L671416](../../../../ScriptDB/000_4_CreateSP.sql#L671416) | — | 10 / 0 | — |
| `UBTrxOrderType` | [L671456](../../../../ScriptDB/000_4_CreateSP.sql#L671456) | 1 / 1 file | 0 / 0 | [Trx.cs:3406](../../../../UBClasses/Trx.cs#L3406) |
| `UBTrxOrderTypeList` | [L671486](../../../../ScriptDB/000_4_CreateSP.sql#L671486) | — | 1 / 0 | — |
| `UBTrxPendingOrderList` | [L671518](../../../../ScriptDB/000_4_CreateSP.sql#L671518) | 1 / 1 file | 0 / 0 | [Trx.cs:2497](../../../../UBClasses/Trx.cs#L2497) |
| `UBTrxRebateList` | [L671871](../../../../ScriptDB/000_4_CreateSP.sql#L671871) | 1 / 1 file | 0 / 0 | [Trx.cs:2722](../../../../UBClasses/Trx.cs#L2722) |
| `UBTrxRecapList` | [L671914](../../../../ScriptDB/000_4_CreateSP.sql#L671914) | 1 / 1 file | 0 / 1 | [TrxBlotter.cs:162](../../../../UBClasses/TrxBlotter.cs#L162) |
| `UBTrxRecSkipAdd` | [L672288](../../../../ScriptDB/000_4_CreateSP.sql#L672288) | — | 2 / 0 | — |
| `UBTrxRemoveByFileID` | [L672314](../../../../ScriptDB/000_4_CreateSP.sql#L672314) | — | 0 / 1 | — |
| `UBTrxRestoreOne` | [L672371](../../../../ScriptDB/000_4_CreateSP.sql#L672371) | — | 0 / 0 | — |
| `UBTrxScheduleList` | [L672448](../../../../ScriptDB/000_4_CreateSP.sql#L672448) | 1 / 1 file | 0 / 3 | [Trx.cs:5974](../../../../UBClasses/Trx.cs#L5974) |
| `UBTrxSelectionUpdate` | [L672757](../../../../ScriptDB/000_4_CreateSP.sql#L672757) | — | 0 / 0 | — |
| `UBTrxSellAWD` | [L672800](../../../../ScriptDB/000_4_CreateSP.sql#L672800) | — | 2 / 2 | — |
| `UBTrxSetAverageCost` | [L672977](../../../../ScriptDB/000_4_CreateSP.sql#L672977) | 1 / 1 file | 2 / 1 | [Trx.cs:6138](../../../../UBClasses/Trx.cs#L6138) |
| `UBTrxSetAverageCostAll` | [L673069](../../../../ScriptDB/000_4_CreateSP.sql#L673069) | — | 0 / 1 | — |
| `UBTrxSettleGNList` | [L673132](../../../../ScriptDB/000_4_CreateSP.sql#L673132) | — | 1 / 0 | — |
| `UBTrxSettleMethodList` | [L673161](../../../../ScriptDB/000_4_CreateSP.sql#L673161) | — | 7 / 0 | — |
| `UBTrxSettleMethodListX` | [L673219](../../../../ScriptDB/000_4_CreateSP.sql#L673219) | — | 2 / 0 | — |
| `UBTrxSettleSourceList` | [L673275](../../../../ScriptDB/000_4_CreateSP.sql#L673275) | — | 1 / 0 | — |
| `UBTrxSettleStatusList` | [L673304](../../../../ScriptDB/000_4_CreateSP.sql#L673304) | — | 1 / 0 | — |
| `UBTrxStatusList` | [L673333](../../../../ScriptDB/000_4_CreateSP.sql#L673333) | — | 3 / 0 | — |
| `UBTrxTaggedCount` | [L673363](../../../../ScriptDB/000_4_CreateSP.sql#L673363) | 1 / 1 file | 0 / 0 | [Trx.cs:6280](../../../../UBClasses/Trx.cs#L6280) |
| `UBTrxTaxEventIndList` | [L673378](../../../../ScriptDB/000_4_CreateSP.sql#L673378) | — | 1 / 0 | — |
| `UBTrxTransferCanChange` | [L673407](../../../../ScriptDB/000_4_CreateSP.sql#L673407) | 1 / 1 file | 0 / 0 | [Trx.cs:2958](../../../../UBClasses/Trx.cs#L2958) |
| `UBTrxTransferOutInList` | [L673458](../../../../ScriptDB/000_4_CreateSP.sql#L673458) | — | 0 / 1 | — |
| `UBTrxTypeEO` | [L673638](../../../../ScriptDB/000_4_CreateSP.sql#L673638) | 1 / 1 file | 0 / 0 | [Trx.cs:515](../../../../UBClasses/Trx.cs#L515) |
| `UBTrxTypeEODetail` | [L673664](../../../../ScriptDB/000_4_CreateSP.sql#L673664) | 1 / 1 file | 0 / 0 | [Trx.cs:515](../../../../UBClasses/Trx.cs#L515) |
| `UBTrxTypeList` | [L673697](../../../../ScriptDB/000_4_CreateSP.sql#L673697) | 1 / 1 file | 2 / 0 | [Trx.cs:46](../../../../UBClasses/Trx.cs#L46) |
| `UBTrxTypeSign` | [L673727](../../../../ScriptDB/000_4_CreateSP.sql#L673727) | — | 0 / 0 | — |
| `UBTrxUnitBalance` | [L673753](../../../../ScriptDB/000_4_CreateSP.sql#L673753) | 1 / 1 file | 0 / 0 | [Trx.cs:2908](../../../../UBClasses/Trx.cs#L2908) |
| `UBTrxUpdateOrder` | [L673814](../../../../ScriptDB/000_4_CreateSP.sql#L673814) | — | 3 / 0 | — |
| `UBTrxViewComboList` | [L673909](../../../../ScriptDB/000_4_CreateSP.sql#L673909) | — | 0 / 14 | — |
| `UBTrxViewListCof` | [L673965](../../../../ScriptDB/000_4_CreateSP.sql#L673965) | 1 / 1 file | 0 / 0 | [TradeConfirmation.cs:148](../../../../VieFUNDPdf/TradeConfirmation.cs#L148) |
| `UBTrxViewOrderList` | [L674099](../../../../ScriptDB/000_4_CreateSP.sql#L674099) | 1 / 1 file | 0 / 2 | [Trx.cs:5377](../../../../UBClasses/Trx.cs#L5377) |
| `UBTrxViewSearch` | [L674384](../../../../ScriptDB/000_4_CreateSP.sql#L674384) | 1 / 1 file | 0 / 4 | [Trx.cs:2081](../../../../UBClasses/Trx.cs#L2081) |
| `UBTrxViewSearchCriteriaSave` | [L676474](../../../../ScriptDB/000_4_CreateSP.sql#L676474) | — | 2 / 1 | — |
| `UBTrxViewSearchEx` | [L676868](../../../../ScriptDB/000_4_CreateSP.sql#L676868) | — | 2 / 1 | — |
| `UBTrxViewSearchTBD` | [L678389](../../../../ScriptDB/000_4_CreateSP.sql#L678389) | — | 0 / 4 | — |
| `UBTrxViewSettlementList` | [L680308](../../../../ScriptDB/000_4_CreateSP.sql#L680308) | — | 0 / 3 | — |
| `UBUserDefinedDefMoveOrder` | [L682919](../../../../ScriptDB/000_4_CreateSP.sql#L682919) | 1 / 1 file | 0 / 0 | [UserDefinedField.cs:570](../../../../UBClasses/UserDefinedField.cs#L570) |
| `UBViewHeaderMoveOrder` | [L683390](../../../../ScriptDB/000_4_CreateSP.sql#L683390) | 1 / 1 file | 0 / 0 | [ViewHeader.cs:146](../../../../UBClasses/ViewHeader.cs#L146) |
| `UBViewHeaderResetOrder` | [L683534](../../../../ScriptDB/000_4_CreateSP.sql#L683534) | — | 0 / 0 | — |
| `UBWFConversionRiskTransfer` | [L685760](../../../../ScriptDB/000_4_CreateSP.sql#L685760) | — | 0 / 0 | — |
| `UBXML2TMP_TrxRec` | [L687240](../../../../ScriptDB/000_4_CreateSP.sql#L687240) | — | 0 / 0 | — |
| `UBXML2TMP_TrxRecDetail` | [L687427](../../../../ScriptDB/000_4_CreateSP.sql#L687427) | — | 0 / 0 | — |
| `UBXMLCheckOrderSchema` | [L687823](../../../../ScriptDB/000_4_CreateSP.sql#L687823) | — | 1 / 0 | — |
| `UBXMLCheckOrderSchema32` | [L687868](../../../../ScriptDB/000_4_CreateSP.sql#L687868) | — | 0 / 0 | — |
| `UBXMLRecDefTrx` | [L690303](../../../../ScriptDB/000_4_CreateSP.sql#L690303) | — | 0 / 0 | — |
| `UBXMLRecTrxRecordLookup` | [L697066](../../../../ScriptDB/000_4_CreateSP.sql#L697066) | — | 10 / 0 | — |
| `UBXMLRecTrxRecordLookupManualTrx` | [L697189](../../../../ScriptDB/000_4_CreateSP.sql#L697189) | — | 4 / 0 | — |
| `UBXMLRecTrxRecordProcess` | [L697279](../../../../ScriptDB/000_4_CreateSP.sql#L697279) | 1 / 1 file | 1 / 1 | [CAT.cs:1480](../../../../UBFFImport/CAT.cs#L1480) |
| `UBXMLRecTrxRecordProcess1Record` | [L697309](../../../../ScriptDB/000_4_CreateSP.sql#L697309) | — | 6 / 7 | — |
| `UBXMLRecTrxRecordProcess1Record_Special` | [L697600](../../../../ScriptDB/000_4_CreateSP.sql#L697600) | — | 1 / 7 | — |
| `UBXMLRecTrxRecordProcessBuyCof` | [L697850](../../../../ScriptDB/000_4_CreateSP.sql#L697850) | — | 1 / 13 | — |
| `UBXMLRecTrxRecordProcessBuyCof_Special` | [L698757](../../../../ScriptDB/000_4_CreateSP.sql#L698757) | — | 1 / 10 | — |
| `UBXMLRecTrxRecordProcessDistribCof` | [L699254](../../../../ScriptDB/000_4_CreateSP.sql#L699254) | — | 1 / 7 | — |
| `UBXMLRecTrxRecordProcessDistribCof_Special` | [L699740](../../../../ScriptDB/000_4_CreateSP.sql#L699740) | — | 1 / 4 | — |
| `UBXMLRecTrxRecordProcessITCof` | [L700118](../../../../ScriptDB/000_4_CreateSP.sql#L700118) | — | 1 / 10 | — |
| `UBXMLRecTrxRecordProcessITCof_Special` | [L701212](../../../../ScriptDB/000_4_CreateSP.sql#L701212) | — | 1 / 7 | — |
| `UBXMLRecTrxRecordProcessPaymentInfo` | [L702018](../../../../ScriptDB/000_4_CreateSP.sql#L702018) | — | 2 / 0 | — |
| `UBXMLRecTrxRecordProcessPaymentInfoFix` | [L702125](../../../../ScriptDB/000_4_CreateSP.sql#L702125) | 1 / 1 file | 0 / 0 | [CAT.cs:1950](../../../../UBFFImport/CAT.cs#L1950) |
| `UBXMLRecTrxRecordProcessROC` | [L702206](../../../../ScriptDB/000_4_CreateSP.sql#L702206) | — | 1 / 6 | — |
| `UBXMLRecTrxRecordProcessROC_Special` | [L702562](../../../../ScriptDB/000_4_CreateSP.sql#L702562) | — | 1 / 5 | — |
| `UBXMLRecTrxRecordProcessSellCof` | [L702884](../../../../ScriptDB/000_4_CreateSP.sql#L702884) | — | 1 / 14 | — |
| `UBXMLRecTrxRecordProcessSellCof_Special` | [L703648](../../../../ScriptDB/000_4_CreateSP.sql#L703648) | — | 1 / 11 | — |
| `UBXMLRecTrxRecordProcessSwitchCof` | [L704236](../../../../ScriptDB/000_4_CreateSP.sql#L704236) | — | 1 / 8 | — |
| `UBXMLRecTrxRecordProcessSwitchCof_Special` | [L705053](../../../../ScriptDB/000_4_CreateSP.sql#L705053) | — | 1 / 7 | — |
| `VF_VF_AllCompTrxApprovalStatus` | [L708163](../../../../ScriptDB/000_4_CreateSP.sql#L708163) | — | 0 / 0 | — |
| `VF_VF_AllCompTrxApprovalStatusARC` | [L708226](../../../../ScriptDB/000_4_CreateSP.sql#L708226) | — | 0 / 0 | — |
| `VF_VF_AllCompTrxApprovalStatusHistory` | [L708295](../../../../ScriptDB/000_4_CreateSP.sql#L708295) | — | 0 / 0 | — |
| `VF_VF_Trx2ndSide` | [L713309](../../../../ScriptDB/000_4_CreateSP.sql#L713309) | — | 0 / 0 | — |
