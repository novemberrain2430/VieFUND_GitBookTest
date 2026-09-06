# SP Catalog — Commission & Fee

> Phân nhóm gợi ý theo tên procedure. Các cột caller mới là bằng chứng truy vết; `—` không có nghĩa procedure không được dùng.

**Tổng**: 474 definition; 139 có tên tĩnh từ C#; 176 được procedure khác gọi qua EXEC/EXECUTE.

| Procedure | Definition | C# tĩnh | SQL gọi vào / gọi ra | Caller C# mẫu |
|---|---:|---:|---:|---|
| `AGRA_ListAllAdvisorFeeRun` | [L17070](../../../../ScriptDB/000_4_CreateSP.sql#L17070) | — | 0 / 0 | — |
| `AGRA_ListAllFeeRunSinceInception` | [L17097](../../../../ScriptDB/000_4_CreateSP.sql#L17097) | — | 0 / 0 | — |
| `AGRA_PayableAll` | [L17123](../../../../ScriptDB/000_4_CreateSP.sql#L17123) | — | 0 / 0 | — |
| `AMF_AUACommissionByRep` | [L20933](../../../../ScriptDB/000_4_CreateSP.sql#L20933) | — | 0 / 1 | — |
| `B2B_CommissionLink2PlanFix` | [L21408](../../../../ScriptDB/000_4_CreateSP.sql#L21408) | — | 0 / 0 | — |
| `CON_AssignDealerPortionComm` | [L23436](../../../../ScriptDB/000_4_CreateSP.sql#L23436) | — | 1 / 0 | — |
| `CON_AssignDealerPortionCommAll` | [L23595](../../../../ScriptDB/000_4_CreateSP.sql#L23595) | — | 0 / 1 | — |
| `CON_PHX_ServiceFee_Excel_One` | [L34092](../../../../ScriptDB/000_4_CreateSP.sql#L34092) | — | 0 / 0 | — |
| `CON_PHX_ServiceFeeOne` | [L34303](../../../../ScriptDB/000_4_CreateSP.sql#L34303) | — | 0 / 0 | — |
| `CON_PHX_TrxCommOne` | [L34514](../../../../ScriptDB/000_4_CreateSP.sql#L34514) | — | 0 / 0 | — |
| `CON_SetStatusCommFiles` | [L35320](../../../../ScriptDB/000_4_CreateSP.sql#L35320) | — | 0 / 0 | — |
| `CON_WF_AdvisorFeeSettingAll` | [L38712](../../../../ScriptDB/000_4_CreateSP.sql#L38712) | — | 0 / 1 | — |
| `CON_WF_AdvisorFeeSettingOne` | [L38745](../../../../ScriptDB/000_4_CreateSP.sql#L38745) | — | 1 / 0 | — |
| `CON_WF_Commission1ManagerGrid` | [L46098](../../../../ScriptDB/000_4_CreateSP.sql#L46098) | — | 0 / 0 | — |
| `CON_WF_CommissionFolder` | [L46267](../../../../ScriptDB/000_4_CreateSP.sql#L46267) | — | 0 / 0 | — |
| `CON_WF_CommissionFolder_2` | [L46354](../../../../ScriptDB/000_4_CreateSP.sql#L46354) | — | 0 / 0 | — |
| `CON_WF_CommissionSplitSetting` | [L46420](../../../../ScriptDB/000_4_CreateSP.sql#L46420) | — | 0 / 0 | — |
| `CON_WF_CommPayable1Item` | [L46544](../../../../ScriptDB/000_4_CreateSP.sql#L46544) | — | 0 / 0 | — |
| `CON_WF_CommSetItemAsDue` | [L46706](../../../../ScriptDB/000_4_CreateSP.sql#L46706) | 1 / 1 file | 0 / 0 | [CommissionRevenue.cs:3143](../../../../UBClasses/CommissionRevenue.cs#L3143) |
| `CON_WF_CommSetItemAsPaid` | [L46737](../../../../ScriptDB/000_4_CreateSP.sql#L46737) | 1 / 1 file | 1 / 1 | [CommissionRevenue.cs:3097](../../../../UBClasses/CommissionRevenue.cs#L3097) |
| `CON_WF_CommSetPaid` | [L46796](../../../../ScriptDB/000_4_CreateSP.sql#L46796) | — | 0 / 1 | — |
| `CON_WF_CommTrx` | [L46831](../../../../ScriptDB/000_4_CreateSP.sql#L46831) | — | 0 / 1 | — |
| `CON_WF_CommTrx_Step1_Init` | [L46912](../../../../ScriptDB/000_4_CreateSP.sql#L46912) | — | 0 / 0 | — |
| `CON_WF_CommTrx_Step2` | [L46934](../../../../ScriptDB/000_4_CreateSP.sql#L46934) | — | 0 / 1 | — |
| `CON_WF_CommTrx_Topup` | [L46961](../../../../ScriptDB/000_4_CreateSP.sql#L46961) | — | 0 / 1 | — |
| `CON_WF_CommTrxOne` | [L47039](../../../../ScriptDB/000_4_CreateSP.sql#L47039) | — | 3 / 1 | — |
| `CON_WF_FindDuplicateComm` | [L48480](../../../../ScriptDB/000_4_CreateSP.sql#L48480) | — | 0 / 0 | — |
| `CON_WF_GICComm` | [L56689](../../../../ScriptDB/000_4_CreateSP.sql#L56689) | — | 0 / 0 | — |
| `CON_WF_GICComm2` | [L56826](../../../../ScriptDB/000_4_CreateSP.sql#L56826) | — | 0 / 0 | — |
| `CON_WF_GICCommRateDef` | [L56930](../../../../ScriptDB/000_4_CreateSP.sql#L56930) | — | 0 / 0 | — |
| `CON_WF_Move2PayableGIC` | [L59498](../../../../ScriptDB/000_4_CreateSP.sql#L59498) | — | 1 / 0 | — |
| `CON_WF_OneRep_AccountServiceFee` | [L61383](../../../../ScriptDB/000_4_CreateSP.sql#L61383) | — | 0 / 1 | — |
| `CON_WF_OneRep_ServiceComm_Topup_1` | [L68761](../../../../ScriptDB/000_4_CreateSP.sql#L68761) | — | 0 / 0 | — |
| `CON_WF_OneRep_ServiceFeeComm_Topup` | [L68784](../../../../ScriptDB/000_4_CreateSP.sql#L68784) | — | 0 / 1 | — |
| `CON_WF_OneRep_ServiceFeeComm_Topup_2` | [L68818](../../../../ScriptDB/000_4_CreateSP.sql#L68818) | — | 0 / 1 | — |
| `CON_WF_OneRep_ServiceFeeOne` | [L68843](../../../../ScriptDB/000_4_CreateSP.sql#L68843) | — | 3 / 0 | — |
| `CON_WF_OneRep_WaitingComm_Topup` | [L70076](../../../../ScriptDB/000_4_CreateSP.sql#L70076) | — | 0 / 1 | — |
| `CON_WF_OneRep_WaitingCommissionOne` | [L70112](../../../../ScriptDB/000_4_CreateSP.sql#L70112) | — | 2 / 0 | — |
| `CON_WF_PlanServiceFee_Step1_Init` | [L76535](../../../../ScriptDB/000_4_CreateSP.sql#L76535) | — | 0 / 0 | — |
| `CON_WF_PlanServiceFee_Step2` | [L76555](../../../../ScriptDB/000_4_CreateSP.sql#L76555) | — | 0 / 0 | — |
| `CON_WF_ReceivableComm2PayableOne` | [L77384](../../../../ScriptDB/000_4_CreateSP.sql#L77384) | — | 2 / 0 | — |
| `CON_WF_ReceivableComm2PayableOneX` | [L77578](../../../../ScriptDB/000_4_CreateSP.sql#L77578) | — | 1 / 0 | — |
| `CON_WF_ServiceFee1Pos` | [L79563](../../../../ScriptDB/000_4_CreateSP.sql#L79563) | — | 5 / 0 | — |
| `CON_WF_ServiceFee4FundAccount_Topup` | [L79671](../../../../ScriptDB/000_4_CreateSP.sql#L79671) | — | 0 / 1 | — |
| `CON_WF_ServiceFee4FundAccount1Item` | [L79707](../../../../ScriptDB/000_4_CreateSP.sql#L79707) | — | 1 / 0 | — |
| `CON_WF_ServiceFee4FundAccountAll` | [L79775](../../../../ScriptDB/000_4_CreateSP.sql#L79775) | — | 0 / 0 | — |
| `CON_WF_ServiceFeeAll` | [L79804](../../../../ScriptDB/000_4_CreateSP.sql#L79804) | — | 0 / 1 | — |
| `CON_WF_ServiceFeeAll_Topup` | [L79842](../../../../ScriptDB/000_4_CreateSP.sql#L79842) | — | 0 / 1 | — |
| `CON_WF_ServiceFeeAllPos_NotUsed` | [L79883](../../../../ScriptDB/000_4_CreateSP.sql#L79883) | — | 0 / 1 | — |
| `CON_WF_ServiceFeeFixOne` | [L79915](../../../../ScriptDB/000_4_CreateSP.sql#L79915) | — | 0 / 0 | — |
| `CON_WF_ServiceFeeOne` | [L80087](../../../../ScriptDB/000_4_CreateSP.sql#L80087) | — | 2 / 0 | — |
| `CON_WF_ServiceFeeOne_Topup` | [L80399](../../../../ScriptDB/000_4_CreateSP.sql#L80399) | — | 1 / 0 | — |
| `CON_WF_ServiceFeePos_One` | [L80684](../../../../ScriptDB/000_4_CreateSP.sql#L80684) | — | 0 / 0 | — |
| `CON_WF_Trust2PayableOne` | [L81984](../../../../ScriptDB/000_4_CreateSP.sql#L81984) | — | 1 / 0 | — |
| `CON_WF_TrxComm2PayableOne` | [L83413](../../../../ScriptDB/000_4_CreateSP.sql#L83413) | — | 1 / 0 | — |
| `CON_WF_TrxFeeInfo` | [L83936](../../../../ScriptDB/000_4_CreateSP.sql#L83936) | — | 0 / 0 | — |
| `CON_WF_WaitingCommission_Missing` | [L86100](../../../../ScriptDB/000_4_CreateSP.sql#L86100) | — | 0 / 1 | — |
| `CON_WF_WaitingCommission_Step1_Init` | [L86139](../../../../ScriptDB/000_4_CreateSP.sql#L86139) | — | 0 / 0 | — |
| `CON_WF_WaitingCommission_Step2` | [L86159](../../../../ScriptDB/000_4_CreateSP.sql#L86159) | — | 0 / 1 | — |
| `CON_WF_WaitingCommissionAll` | [L86192](../../../../ScriptDB/000_4_CreateSP.sql#L86192) | — | 0 / 1 | — |
| `CON_WF_WaitingCommissionAll_Topup_Add` | [L86229](../../../../ScriptDB/000_4_CreateSP.sql#L86229) | — | 0 / 1 | — |
| `CON_WF_WaitingCommissionAll_Topup_Update` | [L86268](../../../../ScriptDB/000_4_CreateSP.sql#L86268) | — | 0 / 1 | — |
| `CON_WF_WaitingCommissionOne` | [L86307](../../../../ScriptDB/000_4_CreateSP.sql#L86307) | — | 2 / 0 | — |
| `CON_WF_WaitingCommissionOne_Missing` | [L86688](../../../../ScriptDB/000_4_CreateSP.sql#L86688) | — | 1 / 0 | — |
| `CON_WF_WaitingCommissionOne_Topup` | [L86894](../../../../ScriptDB/000_4_CreateSP.sql#L86894) | — | 1 / 0 | — |
| `CON_WF_WaitingCommissionOne_Topup_Update` | [L87276](../../../../ScriptDB/000_4_CreateSP.sql#L87276) | — | 1 / 0 | — |
| `ConvertAdvisorFee_7908` | [L91290](../../../../ScriptDB/000_4_CreateSP.sql#L91290) | — | 0 / 0 | — |
| `DI_FixDealerAcommissionSign` | [L101942](../../../../ScriptDB/000_4_CreateSP.sql#L101942) | — | 0 / 0 | — |
| `DI_FixDealerCommissionSign` | [L102020](../../../../ScriptDB/000_4_CreateSP.sql#L102020) | — | 0 / 0 | — |
| `GlobalManagerComm` | [L115110](../../../../ScriptDB/000_4_CreateSP.sql#L115110) | — | 0 / 0 | — |
| `GlobalRepComm` | [L115369](../../../../ScriptDB/000_4_CreateSP.sql#L115369) | — | 0 / 0 | — |
| `Init_CleanupCommissionAW` | [L116563](../../../../ScriptDB/000_4_CreateSP.sql#L116563) | — | 0 / 0 | — |
| `Init_CommRevHeader` | [L117195](../../../../ScriptDB/000_4_CreateSP.sql#L117195) | — | 0 / 0 | — |
| `Init_CreateCommissionFromTrx1Rep` | [L117563](../../../../ScriptDB/000_4_CreateSP.sql#L117563) | — | 0 / 0 | — |
| `Init_DealerCommission` | [L117923](../../../../ScriptDB/000_4_CreateSP.sql#L117923) | — | 0 / 0 | — |
| `Init_SetTrustDescriptio4FeeItems` | [L123609](../../../../ScriptDB/000_4_CreateSP.sql#L123609) | — | 0 / 0 | — |
| `Init_TrustAccountCommission` | [L123752](../../../../ScriptDB/000_4_CreateSP.sql#L123752) | — | 0 / 0 | — |
| `SKOrderFeeOptList` | [L167566](../../../../ScriptDB/000_4_CreateSP.sql#L167566) | — | 1 / 0 | — |
| `SP_MF_Commission_Report_Mang_VF` | [L169841](../../../../ScriptDB/000_4_CreateSP.sql#L169841) | — | 0 / 0 | — |
| `SP_MF_Commission_Report_VF` | [L170348](../../../../ScriptDB/000_4_CreateSP.sql#L170348) | — | 0 / 0 | — |
| `UBBankAccountTrustCommList` | [L192605](../../../../ScriptDB/000_4_CreateSP.sql#L192605) | — | 1 / 0 | — |
| `UBChequeFromPayrollAdd` | [L210411](../../../../ScriptDB/000_4_CreateSP.sql#L210411) | — | 1 / 0 | — |
| `UBComm_BringBackZeroByGroup` | [L235940](../../../../ScriptDB/000_4_CreateSP.sql#L235940) | — | 0 / 1 | — |
| `UBComm_BringBackZeroReg` | [L235984](../../../../ScriptDB/000_4_CreateSP.sql#L235984) | — | 0 / 1 | — |
| `UBCommBatchCodeExpAdd` | [L236028](../../../../ScriptDB/000_4_CreateSP.sql#L236028) | 1 / 1 file | 2 / 0 | [CommBatchCode.cs:118](../../../../UBClasses/CommBatchCode.cs#L118) |
| `UBCommBatchCodeExpList` | [L236050](../../../../ScriptDB/000_4_CreateSP.sql#L236050) | 1 / 1 file | 0 / 0 | [CommBatchCode.cs:71](../../../../UBClasses/CommBatchCode.cs#L71) |
| `UBCommBatchCodeExpRemove` | [L236063](../../../../ScriptDB/000_4_CreateSP.sql#L236063) | — | 1 / 0 | — |
| `UBCommBatchComboList` | [L236083](../../../../ScriptDB/000_4_CreateSP.sql#L236083) | 1 / 1 file | 2 / 0 | [CommissionDef.cs:762](../../../../UBClasses/CommissionDef.cs#L762) |
| `UBCommBatchDefRemove` | [L236120](../../../../ScriptDB/000_4_CreateSP.sql#L236120) | 1 / 1 file | 0 / 0 | [CommissionDef.cs:858](../../../../UBClasses/CommissionDef.cs#L858) |
| `UBCommBatchDefUpdate` | [L236153](../../../../ScriptDB/000_4_CreateSP.sql#L236153) | 1 / 1 file | 0 / 0 | [CommissionDef.cs:808](../../../../UBClasses/CommissionDef.cs#L808) |
| `UBCommBatchItemAdd` | [L236186](../../../../ScriptDB/000_4_CreateSP.sql#L236186) | 1 / 1 file | 0 / 1 | [CommissionDef.cs:957](../../../../UBClasses/CommissionDef.cs#L957) |
| `UBCommBatchItemInfo` | [L236259](../../../../ScriptDB/000_4_CreateSP.sql#L236259) | 1 / 1 file | 0 / 0 | [CommissionDef.cs:1102](../../../../UBClasses/CommissionDef.cs#L1102) |
| `UBCommBatchItemList` | [L236289](../../../../ScriptDB/000_4_CreateSP.sql#L236289) | 1 / 1 file | 0 / 0 | [CommissionDef.cs:1048](../../../../UBClasses/CommissionDef.cs#L1048) |
| `UBCommBatchItemRemove` | [L236368](../../../../ScriptDB/000_4_CreateSP.sql#L236368) | 1 / 1 file | 0 / 0 | [CommissionDef.cs:1148](../../../../UBClasses/CommissionDef.cs#L1148) |
| `UBCommBatchItemUpdate` | [L236383](../../../../ScriptDB/000_4_CreateSP.sql#L236383) | 1 / 1 file | 0 / 1 | [CommissionDef.cs:957](../../../../UBClasses/CommissionDef.cs#L957) |
| `UBCommBatchProcess` | [L236435](../../../../ScriptDB/000_4_CreateSP.sql#L236435) | 1 / 1 file | 0 / 1 | [CommissionDef.cs:1195](../../../../UBClasses/CommissionDef.cs#L1195) |
| `UBCommBatchProcessOne` | [L236497](../../../../ScriptDB/000_4_CreateSP.sql#L236497) | — | 1 / 1 | — |
| `UBCommCategoryDetailAdd` | [L236606](../../../../ScriptDB/000_4_CreateSP.sql#L236606) | 1 / 1 file | 0 / 0 | [CommissionDef.cs:179](../../../../UBClasses/CommissionDef.cs#L179) |
| `UBCommCategoryDetailList` | [L236652](../../../../ScriptDB/000_4_CreateSP.sql#L236652) | 2 / 1 file | 0 / 0 | [CommissionDef.cs:78](../../../../UBClasses/CommissionDef.cs#L78) |
| `UBCommCategoryDetailModify` | [L236699](../../../../ScriptDB/000_4_CreateSP.sql#L236699) | 1 / 1 file | 0 / 0 | [CommissionDef.cs:179](../../../../UBClasses/CommissionDef.cs#L179) |
| `UBCommCategoryDetailRemove` | [L236746](../../../../ScriptDB/000_4_CreateSP.sql#L236746) | 1 / 1 file | 0 / 0 | [CommissionDef.cs:238](../../../../UBClasses/CommissionDef.cs#L238) |
| `UBCommCategoryList` | [L236782](../../../../ScriptDB/000_4_CreateSP.sql#L236782) | — | 1 / 0 | — |
| `UBCommEditComboList` | [L236817](../../../../ScriptDB/000_4_CreateSP.sql#L236817) | — | 0 / 8 | — |
| `UBCommExpenseComboList` | [L236852](../../../../ScriptDB/000_4_CreateSP.sql#L236852) | — | 0 / 4 | — |
| `UBCommExpenseTypeList` | [L236869](../../../../ScriptDB/000_4_CreateSP.sql#L236869) | — | 3 / 0 | — |
| `UBCommExSchAdd` | [L236897](../../../../ScriptDB/000_4_CreateSP.sql#L236897) | — | 0 / 1 | — |
| `UBCommExSchAddAllMember` | [L236970](../../../../ScriptDB/000_4_CreateSP.sql#L236970) | 1 / 1 file | 0 / 1 | [CCommExSchedule.cs:318](../../../../UBClasses/CCommExSchedule.cs#L318) |
| `UBCommExSchAddOneMember` | [L237048](../../../../ScriptDB/000_4_CreateSP.sql#L237048) | 1 / 1 file | 0 / 1 | [CCommExSchedule.cs:261](../../../../UBClasses/CCommExSchedule.cs#L261) |
| `UBCommExSchAmount` | [L237111](../../../../ScriptDB/000_4_CreateSP.sql#L237111) | 1 / 1 file | 0 / 0 | [CCommExSchedule.cs:714](../../../../UBClasses/CCommExSchedule.cs#L714) |
| `UBCommExSchInfo` | [L237125](../../../../ScriptDB/000_4_CreateSP.sql#L237125) | 1 / 1 file | 0 / 0 | [CCommExSchedule.cs:208](../../../../UBClasses/CCommExSchedule.cs#L208) |
| `UBCommExSchList` | [L237158](../../../../ScriptDB/000_4_CreateSP.sql#L237158) | 1 / 1 file | 0 / 0 | [CCommExSchedule.cs:153](../../../../UBClasses/CCommExSchedule.cs#L153) |
| `UBCommExSchManualList` | [L237250](../../../../ScriptDB/000_4_CreateSP.sql#L237250) | 1 / 1 file | 0 / 1 | [CCommExSchedule.cs:606](../../../../UBClasses/CCommExSchedule.cs#L606) |
| `UBCommExSchManualSelectionUpdate` | [L237357](../../../../ScriptDB/000_4_CreateSP.sql#L237357) | — | 0 / 0 | — |
| `UBCommExSchMemberList` | [L237402](../../../../ScriptDB/000_4_CreateSP.sql#L237402) | 1 / 1 file | 0 / 0 | [CCommExSchedule.cs:454](../../../../UBClasses/CCommExSchedule.cs#L454) |
| `UBCommExSchProcess` | [L237442](../../../../ScriptDB/000_4_CreateSP.sql#L237442) | — | 0 / 1 | — |
| `UBCommExSchProcessFromDetail` | [L237500](../../../../ScriptDB/000_4_CreateSP.sql#L237500) | 1 / 1 file | 0 / 1 | [CCommExSchedule.cs:666](../../../../UBClasses/CCommExSchedule.cs#L666) |
| `UBCommExSchRemove` | [L237551](../../../../ScriptDB/000_4_CreateSP.sql#L237551) | 1 / 1 file | 0 / 1 | [CCommExSchedule.cs:103](../../../../UBClasses/CCommExSchedule.cs#L103) |
| `UBCommExSchRemoveAllMember` | [L237579](../../../../ScriptDB/000_4_CreateSP.sql#L237579) | 1 / 1 file | 0 / 0 | [CCommExSchedule.cs:414](../../../../UBClasses/CCommExSchedule.cs#L414) |
| `UBCommExSchRemoveOneMember` | [L237602](../../../../ScriptDB/000_4_CreateSP.sql#L237602) | 1 / 1 file | 0 / 0 | [CCommExSchedule.cs:371](../../../../UBClasses/CCommExSchedule.cs#L371) |
| `UBCommExSchRunDaily` | [L237626](../../../../ScriptDB/000_4_CreateSP.sql#L237626) | — | 0 / 1 | — |
| `UBCommExSchRunNow` | [L237670](../../../../ScriptDB/000_4_CreateSP.sql#L237670) | 1 / 1 file | 1 / 1 | [CCommExSchedule.cs:507](../../../../UBClasses/CCommExSchedule.cs#L507) |
| `UBCommExSchRunNowOne` | [L237700](../../../../ScriptDB/000_4_CreateSP.sql#L237700) | — | 3 / 0 | — |
| `UBCommExSchUndo` | [L237809](../../../../ScriptDB/000_4_CreateSP.sql#L237809) | 1 / 1 file | 0 / 0 | [CCommExSchedule.cs:558](../../../../UBClasses/CCommExSchedule.cs#L558) |
| `UBCommExSchUpdate` | [L237885](../../../../ScriptDB/000_4_CreateSP.sql#L237885) | — | 0 / 2 | — |
| `UBCommExSchUpdateAmount` | [L237985](../../../../ScriptDB/000_4_CreateSP.sql#L237985) | 1 / 1 file | 0 / 1 | [CCommExSchedule.cs:754](../../../../UBClasses/CCommExSchedule.cs#L754) |
| `UBCommFindReceivableLSFileIssue` | [L238027](../../../../ScriptDB/000_4_CreateSP.sql#L238027) | — | 0 / 0 | — |
| `UBCommFixFiscalYear` | [L238056](../../../../ScriptDB/000_4_CreateSP.sql#L238056) | — | 0 / 1 | — |
| `UBCommGridTypeList` | [L238090](../../../../ScriptDB/000_4_CreateSP.sql#L238090) | 1 / 1 file | 3 / 0 | [CommissionRevenue.cs:3184](../../../../UBClasses/CommissionRevenue.cs#L3184) |
| `UBCommIncomeCategoryList` | [L238116](../../../../ScriptDB/000_4_CreateSP.sql#L238116) | — | 2 / 0 | — |
| `UBCommIncomeTypeList` | [L238145](../../../../ScriptDB/000_4_CreateSP.sql#L238145) | — | 2 / 0 | — |
| `UBCommissionAdd` | [L238175](../../../../ScriptDB/000_4_CreateSP.sql#L238175) | 1 / 1 file | 3 / 2 | [CommissionRevenue.cs:661](../../../../UBClasses/CommissionRevenue.cs#L661) |
| `UBCommissionAdd_Internal` | [L238439](../../../../ScriptDB/000_4_CreateSP.sql#L238439) | — | 4 / 2 | — |
| `UBCommissionAdd_SSItem` | [L238683](../../../../ScriptDB/000_4_CreateSP.sql#L238683) | 1 / 1 file | 0 / 0 | [CommissionRevenue.cs:3225](../../../../UBClasses/CommissionRevenue.cs#L3225) |
| `UBCommissionAdd2PayableGroup` | [L238795](../../../../ScriptDB/000_4_CreateSP.sql#L238795) | — | 2 / 0 | — |
| `UBCommissionAdd2PayableGroup4Missing` | [L239114](../../../../ScriptDB/000_4_CreateSP.sql#L239114) | — | 2 / 0 | — |
| `UBCommissionAdd2PayableGroup4MissingMCheck` | [L239360](../../../../ScriptDB/000_4_CreateSP.sql#L239360) | — | 1 / 0 | — |
| `UBCommissionAdd2PayableGroupFix1` | [L239588](../../../../ScriptDB/000_4_CreateSP.sql#L239588) | — | 2 / 0 | — |
| `UBCommissionAdd2PayableGroupOne` | [L239851](../../../../ScriptDB/000_4_CreateSP.sql#L239851) | — | 0 / 1 | — |
| `UBCommissionAdd4TrustRebate` | [L239869](../../../../ScriptDB/000_4_CreateSP.sql#L239869) | — | 2 / 1 | — |
| `UBCommissionAddFromTrust` | [L239971](../../../../ScriptDB/000_4_CreateSP.sql#L239971) | — | 2 / 1 | — |
| `UBCommissionAddGIC` | [L240095](../../../../ScriptDB/000_4_CreateSP.sql#L240095) | — | 3 / 1 | — |
| `UBCommissionAdjustmentAdvisorFee` | [L240239](../../../../ScriptDB/000_4_CreateSP.sql#L240239) | — | 0 / 2 | — |
| `UBCommissionAssignDepositDate` | [L240401](../../../../ScriptDB/000_4_CreateSP.sql#L240401) | 1 / 1 file | 0 / 0 | [CommissionRevenue.cs:339](../../../../UBClasses/CommissionRevenue.cs#L339) |
| `UBCommissionClientPlanLookup` | [L240486](../../../../ScriptDB/000_4_CreateSP.sql#L240486) | 1 / 1 file | 0 / 1 | [CommissionRevenue.cs:3435](../../../../UBClasses/CommissionRevenue.cs#L3435) |
| `UBCommissionClientPlanLookupInternal` | [L240554](../../../../ScriptDB/000_4_CreateSP.sql#L240554) | — | 5 / 0 | — |
| `UBCommissionDelete_SSItem` | [L240682](../../../../ScriptDB/000_4_CreateSP.sql#L240682) | 1 / 1 file | 0 / 0 | [CommissionRevenue.cs:3329](../../../../UBClasses/CommissionRevenue.cs#L3329) |
| `UBCommissionExpenseAdd` | [L240764](../../../../ScriptDB/000_4_CreateSP.sql#L240764) | — | 1 / 1 | — |
| `UBCommissionExpenseAdd4Rebate` | [L240861](../../../../ScriptDB/000_4_CreateSP.sql#L240861) | — | 2 / 0 | — |
| `UBCommissionExpenseAdd4Trade` | [L240955](../../../../ScriptDB/000_4_CreateSP.sql#L240955) | — | 5 / 0 | — |
| `UBCommissionExpenseList` | [L241067](../../../../ScriptDB/000_4_CreateSP.sql#L241067) | — | 0 / 0 | — |
| `UBCommissionExpenseRemove` | [L241132](../../../../ScriptDB/000_4_CreateSP.sql#L241132) | — | 0 / 0 | — |
| `UBCommissionExpenseRemove4Trade` | [L241191](../../../../ScriptDB/000_4_CreateSP.sql#L241191) | — | 1 / 0 | — |
| `UBCommissionExpenseReport` | [L241219](../../../../ScriptDB/000_4_CreateSP.sql#L241219) | 1 / 1 file | 0 / 3 | [CommissionRevenue.cs:2498](../../../../UBClasses/CommissionRevenue.cs#L2498) |
| `UBCommissionExport` | [L241446](../../../../ScriptDB/000_4_CreateSP.sql#L241446) | — | 0 / 0 | — |
| `UBCommissionFileExportExcel` | [L241726](../../../../ScriptDB/000_4_CreateSP.sql#L241726) | 1 / 1 file | 0 / 0 | [CommissionRevenue.cs:2698](../../../../UBClasses/CommissionRevenue.cs#L2698) |
| `UBCommissionFileRemoveByFileID` | [L241906](../../../../ScriptDB/000_4_CreateSP.sql#L241906) | 1 / 1 file | 1 / 0 | [CommissionRevenue.cs:2999](../../../../UBClasses/CommissionRevenue.cs#L2999) |
| `UBCommissionFileRemoveByHeaderID` | [L241967](../../../../ScriptDB/000_4_CreateSP.sql#L241967) | 1 / 1 file | 0 / 0 | [CommissionRevenue.cs:3004](../../../../UBClasses/CommissionRevenue.cs#L3004) |
| `UBCommissionFileSelectionUpdate` | [L242015](../../../../ScriptDB/000_4_CreateSP.sql#L242015) | — | 0 / 0 | — |
| `UBCommissionHeaderList` | [L242067](../../../../ScriptDB/000_4_CreateSP.sql#L242067) | 1 / 1 file | 0 / 1 | [CommissionRevenue.cs:2075](../../../../UBClasses/CommissionRevenue.cs#L2075) |
| `UBCommissionList_SSItem` | [L242409](../../../../ScriptDB/000_4_CreateSP.sql#L242409) | 1 / 1 file | 2 / 0 | [CommissionRevenue.cs:3383](../../../../UBClasses/CommissionRevenue.cs#L3383) |
| `UBCommissionList_SSItemGroup` | [L242458](../../../../ScriptDB/000_4_CreateSP.sql#L242458) | — | 1 / 0 | — |
| `UBCommissionManualAddStart` | [L242490](../../../../ScriptDB/000_4_CreateSP.sql#L242490) | 1 / 1 file | 0 / 0 | [CommissionRevenue.cs:3282](../../../../UBClasses/CommissionRevenue.cs#L3282) |
| `UBCommissionManualRemove` | [L242542](../../../../ScriptDB/000_4_CreateSP.sql#L242542) | 1 / 1 file | 4 / 2 | [CommissionRevenue.cs:884](../../../../UBClasses/CommissionRevenue.cs#L884) |
| `UBCommissionMove2Payable` | [L242713](../../../../ScriptDB/000_4_CreateSP.sql#L242713) | 1 / 1 file | 0 / 3 | [CommissionRevenue.cs:268](../../../../UBClasses/CommissionRevenue.cs#L268) |
| `UBCommissionMove2Payable1Header` | [L242860](../../../../ScriptDB/000_4_CreateSP.sql#L242860) | — | 2 / 3 | — |
| `UBCommissionMove2Payable1Header4Manager` | [L242976](../../../../ScriptDB/000_4_CreateSP.sql#L242976) | — | 0 / 2 | — |
| `UBCommissionMove2Payable1Header4ManagerCheck` | [L243028](../../../../ScriptDB/000_4_CreateSP.sql#L243028) | — | 0 / 2 | — |
| `UBCommissionMove2Payable1Header4MissingItems` | [L243081](../../../../ScriptDB/000_4_CreateSP.sql#L243081) | — | 0 / 2 | — |
| `UBCommissionMove2Payable1HeaderFixLS` | [L243133](../../../../ScriptDB/000_4_CreateSP.sql#L243133) | — | 0 / 1 | — |
| `UBCommissionMove2Payable1HeaderNoGroup` | [L243233](../../../../ScriptDB/000_4_CreateSP.sql#L243233) | 1 / 1 file | 0 / 1 | [CommissionRevenue.cs:4028](../../../../UBClasses/CommissionRevenue.cs#L4028) |
| `UBCommissionMove2PayableEnd` | [L243250](../../../../ScriptDB/000_4_CreateSP.sql#L243250) | 1 / 1 file | 0 / 1 | [CommissionRevenue.cs:3948](../../../../UBClasses/CommissionRevenue.cs#L3948) |
| `UBCommissionMove2PayableOne` | [L243317](../../../../ScriptDB/000_4_CreateSP.sql#L243317) | — | 13 / 1 | — |
| `UBCommissionMove2PayableOne4ManagerCheck` | [L243876](../../../../ScriptDB/000_4_CreateSP.sql#L243876) | — | 1 / 0 | — |
| `UBCommissionMove2PayableOne4Missing` | [L244296](../../../../ScriptDB/000_4_CreateSP.sql#L244296) | — | 2 / 0 | — |
| `UBCommissionMove2PayableOneFix1` | [L244727](../../../../ScriptDB/000_4_CreateSP.sql#L244727) | — | 1 / 0 | — |
| `UBCommissionMove2PayableOneX` | [L245180](../../../../ScriptDB/000_4_CreateSP.sql#L245180) | 1 / 1 file | 0 / 1 | [CommissionRevenue.cs:3902](../../../../UBClasses/CommissionRevenue.cs#L3902) |
| `UBCommissionMove2PayableX` | [L245198](../../../../ScriptDB/000_4_CreateSP.sql#L245198) | — | 0 / 0 | — |
| `UBCommissionMove2PayableX_Step1` | [L245239](../../../../ScriptDB/000_4_CreateSP.sql#L245239) | 1 / 1 file | 0 / 0 | [CommissionRevenue.cs:4081](../../../../UBClasses/CommissionRevenue.cs#L4081) |
| `UBCommissionMove2PayableX_Step2` | [L245281](../../../../ScriptDB/000_4_CreateSP.sql#L245281) | 1 / 1 file | 0 / 0 | [CommissionRevenue.cs:4126](../../../../UBClasses/CommissionRevenue.cs#L4126) |
| `UBCommissionMove2PayableX_Step3` | [L245339](../../../../ScriptDB/000_4_CreateSP.sql#L245339) | 1 / 1 file | 0 / 0 | [CommissionRevenue.cs:3846](../../../../UBClasses/CommissionRevenue.cs#L3846) |
| `UBCommissionMove2PayableX_Step4` | [L245616](../../../../ScriptDB/000_4_CreateSP.sql#L245616) | 1 / 1 file | 0 / 1 | [CommissionRevenue.cs:3988](../../../../UBClasses/CommissionRevenue.cs#L3988) |
| `UBCommissionPayableExport2262` | [L245636](../../../../ScriptDB/000_4_CreateSP.sql#L245636) | — | 1 / 1 | — |
| `UBCommissionPayableInfo` | [L246214](../../../../ScriptDB/000_4_CreateSP.sql#L246214) | 1 / 1 file | 0 / 2 | [CommissionRevenue.cs:1695](../../../../UBClasses/CommissionRevenue.cs#L1695) |
| `UBCommissionPayableRemove` | [L246365](../../../../ScriptDB/000_4_CreateSP.sql#L246365) | 1 / 1 file | 1 / 1 | [CommissionRevenue.cs:1742](../../../../UBClasses/CommissionRevenue.cs#L1742) |
| `UBCommissionPayableRemoveOneFile` | [L246457](../../../../ScriptDB/000_4_CreateSP.sql#L246457) | 1 / 1 file | 0 / 2 | [CommissionRevenue.cs:1785](../../../../UBClasses/CommissionRevenue.cs#L1785) |
| `UBCommissionPayableRemoveOneHeader` | [L246624](../../../../ScriptDB/000_4_CreateSP.sql#L246624) | — | 1 / 0 | — |
| `UBCommissionPayableReversal` | [L246697](../../../../ScriptDB/000_4_CreateSP.sql#L246697) | — | 1 / 0 | — |
| `UBCommissionPayableReversalOtherType` | [L246754](../../../../ScriptDB/000_4_CreateSP.sql#L246754) | — | 0 / 1 | — |
| `UBCommissionPayableSearch` | [L246792](../../../../ScriptDB/000_4_CreateSP.sql#L246792) | 1 / 1 file | 0 / 5 | [CommissionRevenue.cs:949](../../../../UBClasses/CommissionRevenue.cs#L949) |
| `UBCommissionPayableSearch_Old` | [L249824](../../../../ScriptDB/000_4_CreateSP.sql#L249824) | — | 0 / 5 | — |
| `UBCommissionPayableSearchCriteriaSave` | [L250902](../../../../ScriptDB/000_4_CreateSP.sql#L250902) | — | 2 / 1 | — |
| `UBCommissionPayableSelectionUpdate` | [L251258](../../../../ScriptDB/000_4_CreateSP.sql#L251258) | — | 0 / 0 | — |
| `UBCommissionPayableSummaryList` | [L251305](../../../../ScriptDB/000_4_CreateSP.sql#L251305) | — | 0 / 5 | — |
| `UBCommissionPayableSummaryListX` | [L251993](../../../../ScriptDB/000_4_CreateSP.sql#L251993) | — | 0 / 4 | — |
| `UBCommissionPayableSummaryListX_Old` | [L252766](../../../../ScriptDB/000_4_CreateSP.sql#L252766) | — | 0 / 5 | — |
| `UBCommissionPayableSummaryListXAdmin` | [L253532](../../../../ScriptDB/000_4_CreateSP.sql#L253532) | — | 0 / 4 | — |
| `UBCommissionPayableTotal` | [L254273](../../../../ScriptDB/000_4_CreateSP.sql#L254273) | 1 / 1 file | 2 / 0 | [CommissionRevenue.cs:171](../../../../UBClasses/CommissionRevenue.cs#L171) |
| `UBCommissionPayrollDoubtFull` | [L254623](../../../../ScriptDB/000_4_CreateSP.sql#L254623) | — | 0 / 0 | — |
| `UBCommissionPayrollIDList` | [L254660](../../../../ScriptDB/000_4_CreateSP.sql#L254660) | 1 / 1 file | 0 / 1 | [CPayroll.cs:614](../../../../VieFUNDPdf/CPayroll.cs#L614) |
| `UBCommissionPayrollSearchCriteriaSave` | [L254871](../../../../ScriptDB/000_4_CreateSP.sql#L254871) | — | 1 / 1 | — |
| `UBCommissionPayrollSearchHistory` | [L255000](../../../../ScriptDB/000_4_CreateSP.sql#L255000) | 1 / 1 file | 0 / 5 | [CommissionRevenue.cs:1497](../../../../UBClasses/CommissionRevenue.cs#L1497) |
| `UBCommissionPayrollSearchTMP` | [L255624](../../../../ScriptDB/000_4_CreateSP.sql#L255624) | 1 / 1 file | 0 / 4 | [CommissionRevenue.cs:1190](../../../../UBClasses/CommissionRevenue.cs#L1190) |
| `UBCommissionPayrollSelectionUpdate` | [L255762](../../../../ScriptDB/000_4_CreateSP.sql#L255762) | — | 0 / 0 | — |
| `UBCommissionPayrollSelectionUpdateTMP` | [L255807](../../../../ScriptDB/000_4_CreateSP.sql#L255807) | — | 0 / 0 | — |
| `UBCommissionPayrollTMPDetail` | [L255852](../../../../ScriptDB/000_4_CreateSP.sql#L255852) | 1 / 1 file | 0 / 0 | [CommissionRevenue.cs:1250](../../../../UBClasses/CommissionRevenue.cs#L1250) |
| `UBCommissionPayrollTotal` | [L255989](../../../../ScriptDB/000_4_CreateSP.sql#L255989) | — | 1 / 0 | — |
| `UBCommissionPayrollTotalTMP` | [L256050](../../../../ScriptDB/000_4_CreateSP.sql#L256050) | — | 1 / 0 | — |
| `UBCommissionReceivableExport` | [L256113](../../../../ScriptDB/000_4_CreateSP.sql#L256113) | — | 1 / 0 | — |
| `UBCommissionRefreshAll` | [L256252](../../../../ScriptDB/000_4_CreateSP.sql#L256252) | — | 0 / 1 | — |
| `UBCommissionRefreshAllToday` | [L256287](../../../../ScriptDB/000_4_CreateSP.sql#L256287) | — | 0 / 1 | — |
| `UBCommissionRefreshClientName` | [L256325](../../../../ScriptDB/000_4_CreateSP.sql#L256325) | — | 0 / 1 | — |
| `UBCommissionRefreshOneHeader` | [L256367](../../../../ScriptDB/000_4_CreateSP.sql#L256367) | 1 / 1 file | 1 / 2 | [CommissionRevenue.cs:3493](../../../../UBClasses/CommissionRevenue.cs#L3493) |
| `UBCommissionRefreshOneItem` | [L256406](../../../../ScriptDB/000_4_CreateSP.sql#L256406) | — | 4 / 0 | — |
| `UBCommissionRefreshRepCode` | [L256607](../../../../ScriptDB/000_4_CreateSP.sql#L256607) | 1 / 1 file | 2 / 0 | [CommissionRevenue.cs:2568](../../../../UBClasses/CommissionRevenue.cs#L2568) |
| `UBCommissionRemoveFromPayable` | [L256655](../../../../ScriptDB/000_4_CreateSP.sql#L256655) | — | 1 / 1 | — |
| `UBCommissionRemoveFromPayableTagged` | [L256788](../../../../ScriptDB/000_4_CreateSP.sql#L256788) | 1 / 1 file | 0 / 1 | [CommissionRevenue.cs:773](../../../../UBClasses/CommissionRevenue.cs#L773) |
| `UBCommissionRemoveFromRevenue` | [L256825](../../../../ScriptDB/000_4_CreateSP.sql#L256825) | — | 1 / 1 | — |
| `UBCommissionRemoveFromRevenueTagged` | [L256976](../../../../ScriptDB/000_4_CreateSP.sql#L256976) | 1 / 1 file | 0 / 1 | [CommissionRevenue.cs:828](../../../../UBClasses/CommissionRevenue.cs#L828) |
| `UBCommissionRevenueHeaderVerify` | [L257013](../../../../ScriptDB/000_4_CreateSP.sql#L257013) | — | 8 / 0 | — |
| `UBCommissionRevenueHeaderVerifyAll` | [L257069](../../../../ScriptDB/000_4_CreateSP.sql#L257069) | — | 0 / 1 | — |
| `UBCommissionRevenueHeaderVerifyR` | [L257109](../../../../ScriptDB/000_4_CreateSP.sql#L257109) | — | 1 / 1 | — |
| `UBCommissionRevenueInfo` | [L257138](../../../../ScriptDB/000_4_CreateSP.sql#L257138) | 1 / 1 file | 0 / 1 | [CommissionRevenue.cs:222](../../../../UBClasses/CommissionRevenue.cs#L222) |
| `UBCommissionSelectionUpdate` | [L257205](../../../../ScriptDB/000_4_CreateSP.sql#L257205) | — | 0 / 0 | — |
| `UBCommissionTypeList` | [L257249](../../../../ScriptDB/000_4_CreateSP.sql#L257249) | — | 3 / 0 | — |
| `UBCommissionUndoPayroll` | [L257278](../../../../ScriptDB/000_4_CreateSP.sql#L257278) | — | 0 / 0 | — |
| `UBCommissionUpdate` | [L257310](../../../../ScriptDB/000_4_CreateSP.sql#L257310) | 1 / 1 file | 1 / 2 | [CommissionRevenue.cs:661](../../../../UBClasses/CommissionRevenue.cs#L661) |
| `UBCommissionUpdateGIC` | [L257583](../../../../ScriptDB/000_4_CreateSP.sql#L257583) | — | 1 / 2 | — |
| `UBCommissionUpdateRates` | [L257736](../../../../ScriptDB/000_4_CreateSP.sql#L257736) | — | 1 / 2 | — |
| `UBCommissionUpdateRates4GroupOne` | [L257791](../../../../ScriptDB/000_4_CreateSP.sql#L257791) | — | 1 / 0 | — |
| `UBCommissionUpdateRates4RevenueOne` | [L257850](../../../../ScriptDB/000_4_CreateSP.sql#L257850) | — | 1 / 0 | — |
| `UBCommissionViewHeaderDetail` | [L257904](../../../../ScriptDB/000_4_CreateSP.sql#L257904) | — | 0 / 0 | — |
| `UBCommissionViewHeaderTotal` | [L258111](../../../../ScriptDB/000_4_CreateSP.sql#L258111) | — | 1 / 0 | — |
| `UBCommissionViewSearch` | [L258172](../../../../ScriptDB/000_4_CreateSP.sql#L258172) | 1 / 1 file | 0 / 4 | [CommissionRevenue.cs:406](../../../../UBClasses/CommissionRevenue.cs#L406) |
| `UBCommissionViewSearchCriteriaSave` | [L259505](../../../../ScriptDB/000_4_CreateSP.sql#L259505) | — | 1 / 1 | — |
| `UBCommissionViewTotal` | [L259841](../../../../ScriptDB/000_4_CreateSP.sql#L259841) | — | 1 / 0 | — |
| `UBCommLS_SetStartDate` | [L259942](../../../../ScriptDB/000_4_CreateSP.sql#L259942) | — | 0 / 0 | — |
| `UBCommMatrixAdvisorFeeByRep` | [L259975](../../../../ScriptDB/000_4_CreateSP.sql#L259975) | — | 2 / 0 | — |
| `UBCommMatrixItemAdd` | [L260039](../../../../ScriptDB/000_4_CreateSP.sql#L260039) | 1 / 1 file | 2 / 0 | [Member.cs:2527](../../../../UBClasses/Member.cs#L2527) |
| `UBCommMatrixItemAddDealerPortion` | [L260189](../../../../ScriptDB/000_4_CreateSP.sql#L260189) | — | 1 / 0 | — |
| `UBCommMatrixItemAddDealerPortionAll` | [L260270](../../../../ScriptDB/000_4_CreateSP.sql#L260270) | — | 0 / 1 | — |
| `UBCommMatrixItemCopy` | [L260296](../../../../ScriptDB/000_4_CreateSP.sql#L260296) | 1 / 1 file | 0 / 0 | [Member.cs:2473](../../../../UBClasses/Member.cs#L2473) |
| `UBCommMatrixItemRemove` | [L260381](../../../../ScriptDB/000_4_CreateSP.sql#L260381) | 1 / 1 file | 0 / 0 | [Member.cs:2418](../../../../UBClasses/Member.cs#L2418) |
| `UBCommMatrixItemUpdate` | [L260441](../../../../ScriptDB/000_4_CreateSP.sql#L260441) | 1 / 1 file | 0 / 0 | [Member.cs:2527](../../../../UBClasses/Member.cs#L2527) |
| `UBCommMatrixRateInfo` | [L260563](../../../../ScriptDB/000_4_CreateSP.sql#L260563) | — | 1 / 0 | — |
| `UBCommMatrixRepInfo` | [L260597](../../../../ScriptDB/000_4_CreateSP.sql#L260597) | 1 / 1 file | 0 / 0 | [Member.cs:2315](../../../../UBClasses/Member.cs#L2315) |
| `UBCommMatrixRepMinEarningList` | [L260724](../../../../ScriptDB/000_4_CreateSP.sql#L260724) | — | 0 / 0 | — |
| `UBCommOverrideMemberTypeList` | [L260748](../../../../ScriptDB/000_4_CreateSP.sql#L260748) | — | 3 / 0 | — |
| `UBCommPayableComboList` | [L260773](../../../../ScriptDB/000_4_CreateSP.sql#L260773) | — | 0 / 4 | — |
| `UBCommPayablePrn` | [L260805](../../../../ScriptDB/000_4_CreateSP.sql#L260805) | 1 / 1 file | 0 / 3 | [CommissionRevenue.cs:2415](../../../../UBClasses/CommissionRevenue.cs#L2415) |
| `UBCommPayableRestoreOneRecord` | [L261086](../../../../ScriptDB/000_4_CreateSP.sql#L261086) | — | 0 / 0 | — |
| `UBCommPayableStatusList` | [L261153](../../../../ScriptDB/000_4_CreateSP.sql#L261153) | — | 3 / 0 | — |
| `UBCommPayrollAdjustOnePayable` | [L261180](../../../../ScriptDB/000_4_CreateSP.sql#L261180) | — | 3 / 2 | — |
| `UBCommPayrollCheckAll` | [L261253](../../../../ScriptDB/000_4_CreateSP.sql#L261253) | — | 0 / 0 | — |
| `UBCommPayrollDealerListExport` | [L261299](../../../../ScriptDB/000_4_CreateSP.sql#L261299) | — | 0 / 0 | — |
| `UBCommPayrollDetail` | [L261347](../../../../ScriptDB/000_4_CreateSP.sql#L261347) | 1 / 1 file | 0 / 7 | [CPayroll.cs:105](../../../../VieFUNDPdf/CPayroll.cs#L105) |
| `UBCommPayrollDetail2` | [L261771](../../../../ScriptDB/000_4_CreateSP.sql#L261771) | — | 0 / 6 | — |
| `UBCommPayrollEFTEnd` | [L261993](../../../../ScriptDB/000_4_CreateSP.sql#L261993) | 1 / 1 file | 0 / 1 | [EFT.cs:800](../../../../UBFFImport/EFT.cs#L800) |
| `UBCommPayrollEFTStart` | [L262031](../../../../ScriptDB/000_4_CreateSP.sql#L262031) | 1 / 1 file | 0 / 0 | [EFT.cs:759](../../../../UBFFImport/EFT.cs#L759) |
| `UBCommPayrollEFTTagged` | [L262102](../../../../ScriptDB/000_4_CreateSP.sql#L262102) | — | 0 / 1 | — |
| `UBCommPayrollEFTTagged_Old` | [L262176](../../../../ScriptDB/000_4_CreateSP.sql#L262176) | — | 0 / 0 | — |
| `UBCommPayrollExportEndTask` | [L262220](../../../../ScriptDB/000_4_CreateSP.sql#L262220) | — | 0 / 0 | — |
| `UBCommPayrollExportSet` | [L262234](../../../../ScriptDB/000_4_CreateSP.sql#L262234) | — | 0 / 0 | — |
| `UBCommPayrollOneDealerExport` | [L262263](../../../../ScriptDB/000_4_CreateSP.sql#L262263) | — | 0 / 0 | — |
| `UBCommPayrollProcess` | [L262330](../../../../ScriptDB/000_4_CreateSP.sql#L262330) | — | 0 / 5 | — |
| `UBCommPayrollProcessReCalcByIDOne` | [L262565](../../../../ScriptDB/000_4_CreateSP.sql#L262565) | — | 1 / 0 | — |
| `UBCommPayrollProcessReCalcYTDByID` | [L262601](../../../../ScriptDB/000_4_CreateSP.sql#L262601) | — | 5 / 0 | — |
| `UBCommPayrollProcessReCalcYTDByPaidDate` | [L262665](../../../../ScriptDB/000_4_CreateSP.sql#L262665) | — | 1 / 1 | — |
| `UBCommPayrollProcessReCalcYTDBySince` | [L262703](../../../../ScriptDB/000_4_CreateSP.sql#L262703) | — | 0 / 1 | — |
| `UBCommPayrollProcessReCalcYTDSince2` | [L262744](../../../../ScriptDB/000_4_CreateSP.sql#L262744) | — | 0 / 2 | — |
| `UBCommPayrollSavePdfObj` | [L262781](../../../../ScriptDB/000_4_CreateSP.sql#L262781) | 1 / 1 file | 0 / 0 | [CPayroll.cs:65](../../../../VieFUNDPdf/CPayroll.cs#L65) |
| `UBCommPayrollTMPClear` | [L262810](../../../../ScriptDB/000_4_CreateSP.sql#L262810) | — | 2 / 0 | — |
| `UBCommPayrollTMPRefresh` | [L262849](../../../../ScriptDB/000_4_CreateSP.sql#L262849) | — | 1 / 1 | — |
| `UBCommPayrollTMPVerify` | [L263023](../../../../ScriptDB/000_4_CreateSP.sql#L263023) | — | 1 / 1 | — |
| `UBCommPayrollTMPVerifyOne` | [L263051](../../../../ScriptDB/000_4_CreateSP.sql#L263051) | — | 1 / 0 | — |
| `UBCommPayrollUndo` | [L263155](../../../../ScriptDB/000_4_CreateSP.sql#L263155) | — | 3 / 1 | — |
| `UBCommPrePayrollDetail` | [L263233](../../../../ScriptDB/000_4_CreateSP.sql#L263233) | 1 / 1 file | 0 / 7 | [CPayroll.cs:1398](../../../../VieFUNDPdf/CPayroll.cs#L1398) |
| `UBCommPrePayrollMember` | [L263738](../../../../ScriptDB/000_4_CreateSP.sql#L263738) | 1 / 1 file | 0 / 0 | [CPayroll.cs:1717](../../../../VieFUNDPdf/CPayroll.cs#L1717) |
| `UBCommPutBackPayableZeroValueGroup` | [L263768](../../../../ScriptDB/000_4_CreateSP.sql#L263768) | — | 0 / 1 | — |
| `UBCommPutBackPayableZeroValueRec` | [L263800](../../../../ScriptDB/000_4_CreateSP.sql#L263800) | — | 0 / 1 | — |
| `UBCommReceivableGet` | [L263836](../../../../ScriptDB/000_4_CreateSP.sql#L263836) | — | 1 / 0 | — |
| `UBCommReceivableQuarterReport` | [L263885](../../../../ScriptDB/000_4_CreateSP.sql#L263885) | — | 0 / 3 | — |
| `UBCommReceivableSummary` | [L264420](../../../../ScriptDB/000_4_CreateSP.sql#L264420) | — | 0 / 2 | — |
| `UBCommRecStatusList` | [L264591](../../../../ScriptDB/000_4_CreateSP.sql#L264591) | — | 1 / 0 | — |
| `UBCommRepIDRefresh` | [L264617](../../../../ScriptDB/000_4_CreateSP.sql#L264617) | — | 0 / 0 | — |
| `UBCommRepSetupComboList` | [L264675](../../../../ScriptDB/000_4_CreateSP.sql#L264675) | — | 0 / 4 | — |
| `UBCommRescanLS` | [L264702](../../../../ScriptDB/000_4_CreateSP.sql#L264702) | — | 1 / 1 | — |
| `UBCommSummary` | [L264735](../../../../ScriptDB/000_4_CreateSP.sql#L264735) | — | 0 / 1 | — |
| `UBCommSummaryByMgmtCode` | [L264854](../../../../ScriptDB/000_4_CreateSP.sql#L264854) | — | 0 / 0 | — |
| `UBCommSummaryGlobalMaxFin` | [L264918](../../../../ScriptDB/000_4_CreateSP.sql#L264918) | — | 0 / 0 | — |
| `UBCommTemplateAdd` | [L265117](../../../../ScriptDB/000_4_CreateSP.sql#L265117) | 1 / 1 file | 0 / 0 | [CommissionDef.cs:514](../../../../UBClasses/CommissionDef.cs#L514) |
| `UBCommTemplateList` | [L265168](../../../../ScriptDB/000_4_CreateSP.sql#L265168) | 2 / 1 file | 1 / 0 | [CommissionDef.cs:332](../../../../UBClasses/CommissionDef.cs#L332) |
| `UBCommTemplateModify` | [L265219](../../../../ScriptDB/000_4_CreateSP.sql#L265219) | 1 / 1 file | 0 / 0 | [CommissionDef.cs:514](../../../../UBClasses/CommissionDef.cs#L514) |
| `UBCommTemplateRemove` | [L265277](../../../../ScriptDB/000_4_CreateSP.sql#L265277) | 1 / 1 file | 0 / 0 | [CommissionDef.cs:464](../../../../UBClasses/CommissionDef.cs#L464) |
| `UBCommTrendComboList` | [L265308](../../../../ScriptDB/000_4_CreateSP.sql#L265308) | — | 0 / 3 | — |
| `UBCommViewComboList` | [L265335](../../../../ScriptDB/000_4_CreateSP.sql#L265335) | — | 0 / 17 | — |
| `UBCompTrendExCommTrading` | [L281374](../../../../ScriptDB/000_4_CreateSP.sql#L281374) | 2 / 2 file | 0 / 2 | [Compliance.cs:1766](../../../../UBClasses/Compliance.cs#L1766) |
| `UBCompTrendExCommTradingSave` | [L281660](../../../../ScriptDB/000_4_CreateSP.sql#L281660) | — | 1 / 1 | — |
| `UBCompTrendTrxRedemptionFee` | [L283319](../../../../ScriptDB/000_4_CreateSP.sql#L283319) | — | 0 / 2 | — |
| `UBCompTrendTrxRedemptionFeeCriteriaSave` | [L283614](../../../../ScriptDB/000_4_CreateSP.sql#L283614) | — | 1 / 1 | — |
| `UBCompTrendTrxSwitchFee` | [L284165](../../../../ScriptDB/000_4_CreateSP.sql#L284165) | — | 0 / 2 | — |
| `UBCompTrendTrxSwitchFeeCriteriaSave` | [L284427](../../../../ScriptDB/000_4_CreateSP.sql#L284427) | — | 1 / 1 | — |
| `UBDealerBAccountCommission` | [L307814](../../../../ScriptDB/000_4_CreateSP.sql#L307814) | 1 / 1 file | 0 / 1 | [BankAccount.cs:640](../../../../UBClasses/BankAccount.cs#L640) |
| `UBFee4ServiceComboList` | [L330293](../../../../ScriptDB/000_4_CreateSP.sql#L330293) | — | 0 / 7 | — |
| `UBFeeAddHoc` | [L330340](../../../../ScriptDB/000_4_CreateSP.sql#L330340) | 1 / 1 file | 0 / 3 | [Fee.cs:2209](../../../../UBClasses/Fee.cs#L2209) |
| `UBFeeBasedAccountList` | [L330620](../../../../ScriptDB/000_4_CreateSP.sql#L330620) | — | 0 / 0 | — |
| `UBFeeFindTrusteeFeeWithCapIssue` | [L330713](../../../../ScriptDB/000_4_CreateSP.sql#L330713) | — | 0 / 0 | — |
| `UBFeeFixGenerateTrxFromCommAGRA` | [L330742](../../../../ScriptDB/000_4_CreateSP.sql#L330742) | — | 0 / 1 | — |
| `UBFeeFixGenerateTrxFromCommOneAGRA` | [L330768](../../../../ScriptDB/000_4_CreateSP.sql#L330768) | — | 1 / 1 | — |
| `UBFeeFixingDuplication` | [L330841](../../../../ScriptDB/000_4_CreateSP.sql#L330841) | — | 0 / 0 | — |
| `UBFeeFrequencyList` | [L330893](../../../../ScriptDB/000_4_CreateSP.sql#L330893) | — | 4 / 0 | — |
| `UBFeeGenerateComm` | [L330930](../../../../ScriptDB/000_4_CreateSP.sql#L330930) | 1 / 1 file | 0 / 1 | [Fee.cs:1720](../../../../UBClasses/Fee.cs#L1720) |
| `UBFeeGenerateCommOneItem` | [L330983](../../../../ScriptDB/000_4_CreateSP.sql#L330983) | — | 3 / 2 | — |
| `UBFeeGenerateCommOneItem_FixCommTrustMissing` | [L331374](../../../../ScriptDB/000_4_CreateSP.sql#L331374) | — | 0 / 1 | — |
| `UBFeeGenerateCommOneItemFix` | [L331681](../../../../ScriptDB/000_4_CreateSP.sql#L331681) | — | 0 / 1 | — |
| `UBFeeGenerateCommTaggedItems` | [L331923](../../../../ScriptDB/000_4_CreateSP.sql#L331923) | 1 / 1 file | 0 / 1 | [Fee.cs:1775](../../../../UBClasses/Fee.cs#L1775) |
| `UBFeeGenerateTrx` | [L331974](../../../../ScriptDB/000_4_CreateSP.sql#L331974) | 1 / 1 file | 0 / 1 | [Fee.cs:1612](../../../../UBClasses/Fee.cs#L1612) |
| `UBFeeGenerateTrx_Start` | [L332050](../../../../ScriptDB/000_4_CreateSP.sql#L332050) | 1 / 1 file | 0 / 0 | [Fee.cs:111](../../../../UBClasses/Fee.cs#L111) |
| `UBFeeGenerateTrxOne` | [L332099](../../../../ScriptDB/000_4_CreateSP.sql#L332099) | — | 0 / 1 | — |
| `UBFeeGenerateTrxOneItem` | [L332117](../../../../ScriptDB/000_4_CreateSP.sql#L332117) | — | 13 / 5 | — |
| `UBFeeGenerateTrxTaggedItems` | [L332600](../../../../ScriptDB/000_4_CreateSP.sql#L332600) | 1 / 1 file | 0 / 1 | [Fee.cs:1667](../../../../UBClasses/Fee.cs#L1667) |
| `UBFeeGenerateTrxUI` | [L332661](../../../../ScriptDB/000_4_CreateSP.sql#L332661) | 1 / 1 file | 0 / 1 | [Fee.cs:2383](../../../../UBClasses/Fee.cs#L2383) |
| `UBFeeGetDefaultRedeemOpt` | [L332712](../../../../ScriptDB/000_4_CreateSP.sql#L332712) | — | 2 / 0 | — |
| `UBFeeGetMKV` | [L332741](../../../../ScriptDB/000_4_CreateSP.sql#L332741) | — | 3 / 1 | — |
| `UBFeeHeaderDetailListSet` | [L332890](../../../../ScriptDB/000_4_CreateSP.sql#L332890) | 1 / 1 file | 0 / 1 | [Fee.cs:2739](../../../../UBClasses/Fee.cs#L2739) |
| `UBFeeHeaderListSet` | [L333207](../../../../ScriptDB/000_4_CreateSP.sql#L333207) | 1 / 1 file | 0 / 0 | [Fee.cs:2596](../../../../UBClasses/Fee.cs#L2596) |
| `UBFeeHeaderSelectionUpdate` | [L333494](../../../../ScriptDB/000_4_CreateSP.sql#L333494) | — | 0 / 0 | — |
| `UBFeeIssueList` | [L333531](../../../../ScriptDB/000_4_CreateSP.sql#L333531) | — | 0 / 0 | — |
| `UBFeeItemInfo` | [L333574](../../../../ScriptDB/000_4_CreateSP.sql#L333574) | 1 / 1 file | 1 / 0 | [Fee.cs:1407](../../../../UBClasses/Fee.cs#L1407) |
| `UBFeeItemRemove` | [L333641](../../../../ScriptDB/000_4_CreateSP.sql#L333641) | 1 / 1 file | 0 / 2 | [Fee.cs:2280](../../../../UBClasses/Fee.cs#L2280) |
| `UBFeeItemResetTrxComm` | [L333851](../../../../ScriptDB/000_4_CreateSP.sql#L333851) | — | 1 / 0 | — |
| `UBFeeListAdminAll` | [L333881](../../../../ScriptDB/000_4_CreateSP.sql#L333881) | — | 0 / 0 | — |
| `UBFeeListSet` | [L333937](../../../../ScriptDB/000_4_CreateSP.sql#L333937) | 1 / 1 file | 0 / 1 | [Fee.cs:649](../../../../UBClasses/Fee.cs#L649) |
| `UBFeeOtherFeeTypeDetailList` | [L334434](../../../../ScriptDB/000_4_CreateSP.sql#L334434) | — | 2 / 0 | — |
| `UBFeeParams` | [L334458](../../../../ScriptDB/000_4_CreateSP.sql#L334458) | — | 3 / 0 | — |
| `UBFeePlanDetailListSet` | [L334523](../../../../ScriptDB/000_4_CreateSP.sql#L334523) | 1 / 1 file | 1 / 1 | [Fee.cs:2328](../../../../UBClasses/Fee.cs#L2328) |
| `UBFeePlanFundListAll` | [L334593](../../../../ScriptDB/000_4_CreateSP.sql#L334593) | — | 0 / 0 | — |
| `UBFeePosDAVCalc` | [L334655](../../../../ScriptDB/000_4_CreateSP.sql#L334655) | — | 0 / 1 | — |
| `UBFeeProcess5Plan` | [L334742](../../../../ScriptDB/000_4_CreateSP.sql#L334742) | 1 / 1 file | 0 / 1 | [FeeProcessing.cs:399](../../../../UBClasses/FeeProcessing.cs#L399) |
| `UBFeeProcessAllPlan_AdditionPortfolioFee` | [L334772](../../../../ScriptDB/000_4_CreateSP.sql#L334772) | — | 0 / 1 | — |
| `UBFeeProcessAllPlan_AdditionPortfolioFee_Start` | [L334813](../../../../ScriptDB/000_4_CreateSP.sql#L334813) | — | 0 / 0 | — |
| `UBFeeProcessCheck` | [L334858](../../../../ScriptDB/000_4_CreateSP.sql#L334858) | 1 / 1 file | 0 / 0 | [FeeProcessing.cs:206](../../../../UBClasses/FeeProcessing.cs#L206) |
| `UBFeeProcessDetailInfo` | [L334962](../../../../ScriptDB/000_4_CreateSP.sql#L334962) | 1 / 1 file | 0 / 1 | [Fee.cs:2063](../../../../UBClasses/Fee.cs#L2063) |
| `UBFeeProcessDetailListSet` | [L335190](../../../../ScriptDB/000_4_CreateSP.sql#L335190) | 1 / 1 file | 0 / 1 | [Fee.cs:1553](../../../../UBClasses/Fee.cs#L1553) |
| `UBFeeProcessEnd` | [L335419](../../../../ScriptDB/000_4_CreateSP.sql#L335419) | 1 / 1 file | 0 / 0 | [FeeProcessing.cs:451](../../../../UBClasses/FeeProcessing.cs#L451) |
| `UBFeeProcessGetAssetTypeLink` | [L335437](../../../../ScriptDB/000_4_CreateSP.sql#L335437) | — | 1 / 0 | — |
| `UBFeeProcessGetClientDAVByPlanID` | [L335469](../../../../ScriptDB/000_4_CreateSP.sql#L335469) | — | 1 / 1 | — |
| `UBFeeProcessGetHouseHoldDAVByPlanID` | [L335516](../../../../ScriptDB/000_4_CreateSP.sql#L335516) | — | 1 / 2 | — |
| `UBFeeProcessGetPlanDAV` | [L335609](../../../../ScriptDB/000_4_CreateSP.sql#L335609) | — | 5 / 1 | — |
| `UBFeeProcessGetPlanDAV_FromTable` | [L335683](../../../../ScriptDB/000_4_CreateSP.sql#L335683) | — | 2 / 1 | — |
| `UBFeeProcessGetPlanDAV_Special` | [L335756](../../../../ScriptDB/000_4_CreateSP.sql#L335756) | — | 1 / 1 | — |
| `UBFeeProcessGetPlanDAVTMP` | [L335821](../../../../ScriptDB/000_4_CreateSP.sql#L335821) | — | 1 / 1 | — |
| `UBFeeProcessInfo` | [L335871](../../../../ScriptDB/000_4_CreateSP.sql#L335871) | 1 / 1 file | 0 / 0 | [Fee.cs:2011](../../../../UBClasses/Fee.cs#L2011) |
| `UBFeeProcessListSet` | [L335964](../../../../ScriptDB/000_4_CreateSP.sql#L335964) | 1 / 1 file | 0 / 0 | [Fee.cs:1499](../../../../UBClasses/Fee.cs#L1499) |
| `UBFeeProcessOneFund_Template` | [L335993](../../../../ScriptDB/000_4_CreateSP.sql#L335993) | — | 0 / 1 | — |
| `UBFeeProcessOnePlan` | [L336288](../../../../ScriptDB/000_4_CreateSP.sql#L336288) | — | 1 / 5 | — |
| `UBFeeProcessOnePlan_AdditionPortfolioFee` | [L336549](../../../../ScriptDB/000_4_CreateSP.sql#L336549) | — | 1 / 5 | — |
| `UBFeeProcessOnePlan_OneFund` | [L336822](../../../../ScriptDB/000_4_CreateSP.sql#L336822) | — | 1 / 5 | — |
| `UBFeeProcessOnePlanAdvisorFee` | [L337066](../../../../ScriptDB/000_4_CreateSP.sql#L337066) | — | 0 / 6 | — |
| `UBFeeProcessOnePlanAdvisorFee_FromTable` | [L337331](../../../../ScriptDB/000_4_CreateSP.sql#L337331) | — | 0 / 4 | — |
| `UBFeeProcessOnePlanAdvisorFee_Special` | [L337587](../../../../ScriptDB/000_4_CreateSP.sql#L337587) | — | 0 / 4 | — |
| `UBFeeProcessOnePlanAdvisorFeeForceAmountOnCash` | [L337807](../../../../ScriptDB/000_4_CreateSP.sql#L337807) | — | 0 / 2 | — |
| `UBFeeProcessOnePlanM` | [L337978](../../../../ScriptDB/000_4_CreateSP.sql#L337978) | — | 0 / 5 | — |
| `UBFeeProcessOnePlanTrusteeFee` | [L338222](../../../../ScriptDB/000_4_CreateSP.sql#L338222) | — | 1 / 3 | — |
| `UBFeeProcessRedeemInfo` | [L338534](../../../../ScriptDB/000_4_CreateSP.sql#L338534) | — | 9 / 1 | — |
| `UBFeeProcessRemove` | [L338807](../../../../ScriptDB/000_4_CreateSP.sql#L338807) | 1 / 1 file | 0 / 3 | [Fee.cs:1940](../../../../UBClasses/Fee.cs#L1940) |
| `UBFeeProcessStart` | [L338966](../../../../ScriptDB/000_4_CreateSP.sql#L338966) | 1 / 1 file | 0 / 1 | [FeeProcessing.cs:265](../../../../UBClasses/FeeProcessing.cs#L265) |
| `UBFeeProcessTrustee_AGRA_OneMonth` | [L339546](../../../../ScriptDB/000_4_CreateSP.sql#L339546) | — | 0 / 1 | — |
| `UBFeeProcessTrustee_AGRA_OneMonth_OneDealerCode` | [L339572](../../../../ScriptDB/000_4_CreateSP.sql#L339572) | — | 1 / 1 | — |
| `UBFeeProcessUndoCommission` | [L339665](../../../../ScriptDB/000_4_CreateSP.sql#L339665) | 1 / 1 file | 1 / 2 | [Fee.cs:1829](../../../../UBClasses/Fee.cs#L1829) |
| `UBFeeProcessUndoCommissionTaggedItems` | [L339752](../../../../ScriptDB/000_4_CreateSP.sql#L339752) | 1 / 1 file | 0 / 1 | [Fee.cs:1886](../../../../UBClasses/Fee.cs#L1886) |
| `UBFeeRecalcAdvisorList` | [L339834](../../../../ScriptDB/000_4_CreateSP.sql#L339834) | — | 0 / 1 | — |
| `UBFeeRecalcAdvisorOnePlan` | [L339879](../../../../ScriptDB/000_4_CreateSP.sql#L339879) | — | 1 / 2 | — |
| `UBFeeRunListSet` | [L339925](../../../../ScriptDB/000_4_CreateSP.sql#L339925) | — | 0 / 0 | — |
| `UBFeeSelectionUpdate` | [L340109](../../../../ScriptDB/000_4_CreateSP.sql#L340109) | — | 0 / 0 | — |
| `UBFeeTaxOptionList` | [L340144](../../../../ScriptDB/000_4_CreateSP.sql#L340144) | — | 3 / 0 | — |
| `UBFeeTemplateAdd` | [L340176](../../../../ScriptDB/000_4_CreateSP.sql#L340176) | 1 / 1 file | 0 / 0 | [Fee.cs:538](../../../../UBClasses/Fee.cs#L538) |
| `UBFeeTemplateList` | [L340313](../../../../ScriptDB/000_4_CreateSP.sql#L340313) | 2 / 1 file | 1 / 0 | [Fee.cs:346](../../../../UBClasses/Fee.cs#L346) |
| `UBFeeTemplateModify` | [L340411](../../../../ScriptDB/000_4_CreateSP.sql#L340411) | 1 / 1 file | 0 / 0 | [Fee.cs:538](../../../../UBClasses/Fee.cs#L538) |
| `UBFeeTemplateRemove` | [L340549](../../../../ScriptDB/000_4_CreateSP.sql#L340549) | 1 / 1 file | 0 / 0 | [Fee.cs:480](../../../../UBClasses/Fee.cs#L480) |
| `UBFeeTemplateTierList` | [L340589](../../../../ScriptDB/000_4_CreateSP.sql#L340589) | — | 1 / 0 | — |
| `UBFeeTransferFeeTypeDetailList` | [L340622](../../../../ScriptDB/000_4_CreateSP.sql#L340622) | — | 2 / 0 | — |
| `UBFeeTrusteeAmountList` | [L340646](../../../../ScriptDB/000_4_CreateSP.sql#L340646) | — | 1 / 0 | — |
| `UBFeeTrusteeFeeTypeDetailList` | [L340669](../../../../ScriptDB/000_4_CreateSP.sql#L340669) | — | 1 / 0 | — |
| `UBFeeTrusteeRefresh` | [L340693](../../../../ScriptDB/000_4_CreateSP.sql#L340693) | 1 / 1 file | 1 / 2 | [Fee.cs:1232](../../../../UBClasses/Fee.cs#L1232) |
| `UBFeeTrusteeRefresh_Extra` | [L340912](../../../../ScriptDB/000_4_CreateSP.sql#L340912) | — | 0 / 1 | — |
| `UBFeeTrusteeRefresh1Client` | [L340942](../../../../ScriptDB/000_4_CreateSP.sql#L340942) | — | 5 / 1 | — |
| `UBFeeTrusteeRefresh1List` | [L341393](../../../../ScriptDB/000_4_CreateSP.sql#L341393) | — | 1 / 0 | — |
| `UBFeeTrusteeRescan4HISAGICOnly` | [L341544](../../../../ScriptDB/000_4_CreateSP.sql#L341544) | — | 1 / 0 | — |
| `UBFeeTypeDetailAdd` | [L341599](../../../../ScriptDB/000_4_CreateSP.sql#L341599) | 1 / 1 file | 0 / 0 | [FeeTypeDetail.cs:285](../../../../UBClasses/FeeTypeDetail.cs#L285) |
| `UBFeeTypeDetailInfo` | [L341696](../../../../ScriptDB/000_4_CreateSP.sql#L341696) | 1 / 1 file | 0 / 0 | [FeeTypeDetail.cs:181](../../../../UBClasses/FeeTypeDetail.cs#L181) |
| `UBFeeTypeDetailList` | [L341722](../../../../ScriptDB/000_4_CreateSP.sql#L341722) | 1 / 1 file | 0 / 0 | [FeeTypeDetail.cs:96](../../../../UBClasses/FeeTypeDetail.cs#L96) |
| `UBFeeTypeDetailRemove` | [L341791](../../../../ScriptDB/000_4_CreateSP.sql#L341791) | 1 / 1 file | 0 / 0 | [FeeTypeDetail.cs:233](../../../../UBClasses/FeeTypeDetail.cs#L233) |
| `UBFeeTypeDetailUpdate` | [L341812](../../../../ScriptDB/000_4_CreateSP.sql#L341812) | 1 / 1 file | 0 / 0 | [FeeTypeDetail.cs:285](../../../../UBClasses/FeeTypeDetail.cs#L285) |
| `UBFeeTypeList` | [L341914](../../../../ScriptDB/000_4_CreateSP.sql#L341914) | — | 3 / 0 | — |
| `UBFeeTypeListManual` | [L341945](../../../../ScriptDB/000_4_CreateSP.sql#L341945) | — | 2 / 0 | — |
| `UBFQRProcessSaleComm` | [L359268](../../../../ScriptDB/000_4_CreateSP.sql#L359268) | 1 / 1 file | 0 / 0 | [FQR.cs:251](../../../../UBExport/FQR.cs#L251) |
| `UBFQRProcessServiceFee` | [L359379](../../../../ScriptDB/000_4_CreateSP.sql#L359379) | 1 / 1 file | 0 / 0 | [FQR.cs:216](../../../../UBExport/FQR.cs#L216) |
| `UBFundAccountPosFeeInfo` | [L364554](../../../../ScriptDB/000_4_CreateSP.sql#L364554) | — | 1 / 0 | — |
| `UBFundAccountPosFeeUpdate` | [L364573](../../../../ScriptDB/000_4_CreateSP.sql#L364573) | — | 2 / 1 | — |
| `UBFundAccountPosServiceFeeCalc` | [L366905](../../../../ScriptDB/000_4_CreateSP.sql#L366905) | — | 0 / 0 | — |
| `UBFundAccountPosServiceFeeCalc2` | [L367035](../../../../ScriptDB/000_4_CreateSP.sql#L367035) | — | 5 / 0 | — |
| `UBFundAccountPosServiceFeeCalc3` | [L367208](../../../../ScriptDB/000_4_CreateSP.sql#L367208) | — | 2 / 0 | — |
| `UBFundDefAACommit` | [L371095](../../../../ScriptDB/000_4_CreateSP.sql#L371095) | — | 0 / 0 | — |
| `UBFundDefModelCommit` | [L376082](../../../../ScriptDB/000_4_CreateSP.sql#L376082) | 2 / 2 file | 0 / 0 | [PanelFundModel.aspx.cs:296](../../../../WebApp/Main/PanelFundModel.aspx.cs#L296) |
| `UBFundFeeFrequencyList` | [L382053](../../../../ScriptDB/000_4_CreateSP.sql#L382053) | — | 1 / 0 | — |
| `UBFundServCommissionFileList` | [L387320](../../../../ScriptDB/000_4_CreateSP.sql#L387320) | 1 / 1 file | 0 / 0 | [FundServ.cs:573](../../../../UBClasses/FundServ.cs#L573) |
| `UBGICDefCommRateAdd` | [L414396](../../../../ScriptDB/000_4_CreateSP.sql#L414396) | — | 2 / 0 | — |
| `UBMemberCommGridListAll` | [L440283](../../../../ScriptDB/000_4_CreateSP.sql#L440283) | 1 / 1 file | 0 / 0 | [Member.cs:3722](../../../../UBClasses/Member.cs#L3722) |
| `UBMemberCommRateModify` | [L440542](../../../../ScriptDB/000_4_CreateSP.sql#L440542) | 1 / 1 file | 0 / 0 | [Member.cs:2147](../../../../UBClasses/Member.cs#L2147) |
| `UBMemberCommRepAccessList` | [L440648](../../../../ScriptDB/000_4_CreateSP.sql#L440648) | — | 1 / 1 | — |
| `UBMemberStatementFeeFileClear` | [L446159](../../../../ScriptDB/000_4_CreateSP.sql#L446159) | — | 1 / 0 | — |
| `UBMemberStatementFeeImport` | [L446172](../../../../ScriptDB/000_4_CreateSP.sql#L446172) | — | 0 / 0 | — |
| `UBMemberStatementFeeImportDef` | [L446232](../../../../ScriptDB/000_4_CreateSP.sql#L446232) | — | 0 / 0 | — |
| `UBMemberStatementFeeList` | [L446253](../../../../ScriptDB/000_4_CreateSP.sql#L446253) | 1 / 1 file | 0 / 0 | [StatementFeeImport.cs:37](../../../../UBClasses/StatementFeeImport.cs#L37) |
| `UBMemberStatementFeeProcess1Record` | [L446360](../../../../ScriptDB/000_4_CreateSP.sql#L446360) | — | 1 / 0 | — |
| `UBMemberStatementFeeProcessTaggedItems` | [L446431](../../../../ScriptDB/000_4_CreateSP.sql#L446431) | — | 0 / 1 | — |
| `UBMemberStatementFeeReadOneRecord` | [L446480](../../../../ScriptDB/000_4_CreateSP.sql#L446480) | — | 0 / 2 | — |
| `UBMemberStatementFeeSelectionUpdate` | [L446540](../../../../ScriptDB/000_4_CreateSP.sql#L446540) | — | 0 / 0 | — |
| `UBPlanFeeList` | [L488588](../../../../ScriptDB/000_4_CreateSP.sql#L488588) | 1 / 1 file | 0 / 0 | [Fee.cs:1363](../../../../UBClasses/Fee.cs#L1363) |
| `UBPlanFeeListSet` | [L488649](../../../../ScriptDB/000_4_CreateSP.sql#L488649) | 1 / 1 file | 0 / 2 | [Fee.cs:2490](../../../../UBClasses/Fee.cs#L2490) |
| `UBPlanFeePmtTypeList` | [L488940](../../../../ScriptDB/000_4_CreateSP.sql#L488940) | — | 4 / 0 | — |
| `UBPlanFeeSaveARC` | [L488970](../../../../ScriptDB/000_4_CreateSP.sql#L488970) | — | 0 / 0 | — |
| `UBPlanFeeSettingAdd` | [L489042](../../../../ScriptDB/000_4_CreateSP.sql#L489042) | 1 / 1 file | 1 / 2 | [Fee.cs:1146](../../../../UBClasses/Fee.cs#L1146) |
| `UBPlanFeeSettingInfo` | [L489329](../../../../ScriptDB/000_4_CreateSP.sql#L489329) | 1 / 1 file | 0 / 2 | [Fee.cs:1453](../../../../UBClasses/Fee.cs#L1453) |
| `UBPlanFeeSettingUpdate` | [L489476](../../../../ScriptDB/000_4_CreateSP.sql#L489476) | 1 / 1 file | 0 / 0 | [Fee.cs:1275](../../../../UBClasses/Fee.cs#L1275) |
| `UBPlanFeeTemplateList` | [L489748](../../../../ScriptDB/000_4_CreateSP.sql#L489748) | — | 1 / 0 | — |
| `UBPlanMergeComm4Int` | [L494298](../../../../ScriptDB/000_4_CreateSP.sql#L494298) | — | 1 / 0 | — |
| `UBPlanMergeComm4IntAgora` | [L494338](../../../../ScriptDB/000_4_CreateSP.sql#L494338) | — | 0 / 1 | — |
| `UBPlanMKV4FeeM` | [L494777](../../../../ScriptDB/000_4_CreateSP.sql#L494777) | — | 2 / 1 | — |
| `UBPlanMKV4FeeM_FromTable` | [L494888](../../../../ScriptDB/000_4_CreateSP.sql#L494888) | — | 1 / 1 | — |
| `UBPlanMKV4FeeM_Special` | [L494959](../../../../ScriptDB/000_4_CreateSP.sql#L494959) | — | 1 / 1 | — |
| `UBPlanTrx2SidedWithFeeCommList` | [L501015](../../../../ScriptDB/000_4_CreateSP.sql#L501015) | — | 0 / 0 | — |
| `UBPortfolioPlanFeePYMTOptAssign` | [L505223](../../../../ScriptDB/000_4_CreateSP.sql#L505223) | — | 1 / 0 | — |
| `UBPortfolioPlanFeePYMTOptAssignAll` | [L505281](../../../../ScriptDB/000_4_CreateSP.sql#L505281) | — | 0 / 1 | — |
| `UBRepCodeCommGridCopy` | [L509012](../../../../ScriptDB/000_4_CreateSP.sql#L509012) | — | 1 / 0 | — |
| `UBRepCommNotDefined` | [L509733](../../../../ScriptDB/000_4_CreateSP.sql#L509733) | — | 0 / 0 | — |
| `UBReportClientCommission` | [L530585](../../../../ScriptDB/000_4_CreateSP.sql#L530585) | 1 / 1 file | 0 / 18 | [CReport.cs:8247](../../../../VieFUNDPdf/CReport.cs#L8247) |
| `UBReportClientCommission_VEXO` | [L532367](../../../../ScriptDB/000_4_CreateSP.sql#L532367) | — | 1 / 0 | — |
| `UBReportClientCommission1912` | [L532390](../../../../ScriptDB/000_4_CreateSP.sql#L532390) | — | 1 / 14 | — |
| `UBReportClientCommission1912_TBD` | [L533669](../../../../ScriptDB/000_4_CreateSP.sql#L533669) | — | 0 / 14 | — |
| `UBReportClientCommissionB2BSpecial` | [L534939](../../../../ScriptDB/000_4_CreateSP.sql#L534939) | — | 2 / 0 | — |
| `UBReportClientCommissionRawData` | [L534974](../../../../ScriptDB/000_4_CreateSP.sql#L534974) | — | 0 / 3 | — |
| `UBReportFamilyCommission` | [L558010](../../../../ScriptDB/000_4_CreateSP.sql#L558010) | 1 / 1 file | 0 / 13 | [FamilyReport.cs:709](../../../../VieFUNDPdf/FamilyReport.cs#L709) |
| `UBServiceFeeByRepIDCalc` | [L598895](../../../../ScriptDB/000_4_CreateSP.sql#L598895) | — | 0 / 0 | — |
| `UBServiceFeeSearch` | [L599076](../../../../ScriptDB/000_4_CreateSP.sql#L599076) | 1 / 1 file | 0 / 1 | [FundAccount.cs:2572](../../../../UBClasses/FundAccount.cs#L2572) |
| `UBTrustBuyFixExternalWithComm` | [L643819](../../../../ScriptDB/000_4_CreateSP.sql#L643819) | — | 0 / 0 | — |
| `UBTrustBuyTrxAddComm` | [L644352](../../../../ScriptDB/000_4_CreateSP.sql#L644352) | — | 1 / 1 | — |
| `UBTrustBuyTrxAddCommAll` | [L644414](../../../../ScriptDB/000_4_CreateSP.sql#L644414) | — | 0 / 1 | — |
| `UBTrusteeFeeCodeList` | [L648162](../../../../ScriptDB/000_4_CreateSP.sql#L648162) | — | 3 / 0 | — |
| `UBTrusteeFeePlanBankList` | [L648176](../../../../ScriptDB/000_4_CreateSP.sql#L648176) | — | 0 / 1 | — |
| `UBTrustFeeAdd` | [L648333](../../../../ScriptDB/000_4_CreateSP.sql#L648333) | — | 2 / 0 | — |
| `UBTrustListCommSupplier` | [L649571](../../../../ScriptDB/000_4_CreateSP.sql#L649571) | 1 / 1 file | 0 / 6 | [TrustAccount.cs:2263](../../../../UBClasses/TrustAccount.cs#L2263) |
| `UBTrustListCommSupplierTotal` | [L649855](../../../../ScriptDB/000_4_CreateSP.sql#L649855) | — | 1 / 0 | — |
| `UBTrustListCommTotal` | [L649906](../../../../ScriptDB/000_4_CreateSP.sql#L649906) | — | 1 / 0 | — |
| `UBTrustSelectionUpdateComm` | [L657829](../../../../ScriptDB/000_4_CreateSP.sql#L657829) | — | 0 / 0 | — |
| `UBTrustSelectionUpdateSupplierComm` | [L658052](../../../../ScriptDB/000_4_CreateSP.sql#L658052) | — | 0 / 0 | — |
| `UBTrxBuyCommissionRebateProcess` | [L663925](../../../../ScriptDB/000_4_CreateSP.sql#L663925) | — | 1 / 2 | — |
| `UBWFCommPayableListOne` | [L685377](../../../../ScriptDB/000_4_CreateSP.sql#L685377) | 1 / 1 file | 0 / 0 | [WFPayable.cs:39](../../../../UBClasses/WFPayable.cs#L39) |
| `UBWFCommRepPdf` | [L685711](../../../../ScriptDB/000_4_CreateSP.sql#L685711) | 1 / 1 file | 0 / 0 | [WFPayable.cs:132](../../../../UBClasses/WFPayable.cs#L132) |
| `UBXML2TMP_TrxRecDetailFee` | [L687502](../../../../ScriptDB/000_4_CreateSP.sql#L687502) | — | 0 / 0 | — |
| `UBXMLRecCommHeaderAdd` | [L689525](../../../../ScriptDB/000_4_CreateSP.sql#L689525) | — | 0 / 1 | — |
| `UBXMLRecCommHeaderAdd_LA` | [L689668](../../../../ScriptDB/000_4_CreateSP.sql#L689668) | — | 1 / 1 | — |
| `UBXMLRecCommHeaderAdd_LS` | [L689784](../../../../ScriptDB/000_4_CreateSP.sql#L689784) | — | 1 / 1 | — |
| `UBXMLRecNSPProcess_FeeRate` | [L694118](../../../../ScriptDB/000_4_CreateSP.sql#L694118) | — | 1 / 0 | — |
| `UBXMLRecTrxProcessFeeInfo` | [L697024](../../../../ScriptDB/000_4_CreateSP.sql#L697024) | — | 1 / 0 | — |
| `UNIV_OneCommission` | [L706752](../../../../ScriptDB/000_4_CreateSP.sql#L706752) | — | 0 / 1 | — |
| `VF_VF_AllCommPayableDue` | [L707494](../../../../ScriptDB/000_4_CreateSP.sql#L707494) | — | 0 / 0 | — |
| `VF_VF_AllCommPayroll` | [L707557](../../../../ScriptDB/000_4_CreateSP.sql#L707557) | — | 0 / 1 | — |
| `VF_VF_AllCommRevenue` | [L707619](../../../../ScriptDB/000_4_CreateSP.sql#L707619) | — | 0 / 0 | — |
| `VF_VF_AllCommRevenueHeader` | [L707702](../../../../ScriptDB/000_4_CreateSP.sql#L707702) | — | 0 / 1 | — |
| `VF_VF_CommMatrixAll` | [L709364](../../../../ScriptDB/000_4_CreateSP.sql#L709364) | — | 0 / 1 | — |
| `VF_VF_OneCommMatrix` | [L710986](../../../../ScriptDB/000_4_CreateSP.sql#L710986) | — | 1 / 0 | — |
| `VF_VF_OneCommPayable` | [L711022](../../../../ScriptDB/000_4_CreateSP.sql#L711022) | — | 1 / 0 | — |
| `VF_VF_OneCommRevenueGroup` | [L711086](../../../../ScriptDB/000_4_CreateSP.sql#L711086) | — | 1 / 0 | — |
