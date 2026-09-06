# Inventory stored procedure

> File sinh tự động từ SQL snapshot và source C# bằng `generate-catalog.ps1`. Không sửa tay; hãy sửa generator rồi chạy lại.

## Số liệu

- SQL procedure definition duy nhất: **5544**.
- Procedure có tên tĩnh khớp từ C# active: **1583**.
- Procedure chưa thấy tên tĩnh trong C# active: **3961**; không đồng nghĩa là không dùng.
- Quan hệ procedure → procedure nhận diện qua EXEC/EXECUTE: **5377** cạnh duy nhất.

## Danh mục

| Procedure | Chủ đề gợi ý | Definition | C# tĩnh | SQL gọi vào / gọi ra | Caller C# mẫu |
|---|---|---:|---:|---:|---|
| `AA_GetGICMKVX_2` | [Fund & GIC](by-topic/fund-gic.md) | [L16640](../../../ScriptDB/000_4_CreateSP.sql#L16640) | — | 0 / 0 | — |
| `AGRA_ContractedCashTrx` | [Account & Plan](by-topic/account-plan.md) | [L16775](../../../ScriptDB/000_4_CreateSP.sql#L16775) | — | 0 / 0 | — |
| `AGRA_CreateSellOrderFromPAC` | [Trading & Orders](by-topic/trading-orders.md) | [L16816](../../../ScriptDB/000_4_CreateSP.sql#L16816) | — | 1 / 1 | — |
| `AGRA_CreateSellOrderFromPAC_2` | [Trading & Orders](by-topic/trading-orders.md) | [L16895](../../../ScriptDB/000_4_CreateSP.sql#L16895) | — | 0 / 1 | — |
| `AGRA_DeletedCash_ValidTrx` | [Account & Plan](by-topic/account-plan.md) | [L16945](../../../ScriptDB/000_4_CreateSP.sql#L16945) | — | 0 / 0 | — |
| `AGRA_DeletedCashTrx` | [Account & Plan](by-topic/account-plan.md) | [L16983](../../../ScriptDB/000_4_CreateSP.sql#L16983) | — | 0 / 0 | — |
| `AGRA_EndTask` | [Shared / Other](by-topic/shared-other.md) | [L17025](../../../ScriptDB/000_4_CreateSP.sql#L17025) | — | 0 / 0 | — |
| `AGRA_ListAllAdvisorFeeRun` | [Commission & Fee](by-topic/commission-fee.md) | [L17070](../../../ScriptDB/000_4_CreateSP.sql#L17070) | — | 0 / 0 | — |
| `AGRA_ListAllFeeRunSinceInception` | [Commission & Fee](by-topic/commission-fee.md) | [L17097](../../../ScriptDB/000_4_CreateSP.sql#L17097) | — | 0 / 0 | — |
| `AGRA_PayableAll` | [Commission & Fee](by-topic/commission-fee.md) | [L17123](../../../ScriptDB/000_4_CreateSP.sql#L17123) | — | 0 / 0 | — |
| `AGRA_TrxList_Deleted` | [Trading & Orders](by-topic/trading-orders.md) | [L17152](../../../ScriptDB/000_4_CreateSP.sql#L17152) | — | 0 / 0 | — |
| `AGRADealerRepChangedListAGRA` | [Shared / Other](by-topic/shared-other.md) | [L17194](../../../ScriptDB/000_4_CreateSP.sql#L17194) | — | 0 / 0 | — |
| `AGRAPendingFileList` | [Shared / Other](by-topic/shared-other.md) | [L17215](../../../ScriptDB/000_4_CreateSP.sql#L17215) | — | 0 / 0 | — |
| `AGRARepTransferAdd` | [Shared / Other](by-topic/shared-other.md) | [L17255](../../../ScriptDB/000_4_CreateSP.sql#L17255) | 1 / 1 file | 0 / 0 | [Member.cs:4993](../../../UBClasses/Member.cs#L4993) |
| `AGRARepTransferApproveOneItem` | [Shared / Other](by-topic/shared-other.md) | [L17361](../../../ScriptDB/000_4_CreateSP.sql#L17361) | — | 1 / 0 | — |
| `AGRARepTransferApproveTaggedItems` | [Shared / Other](by-topic/shared-other.md) | [L17466](../../../ScriptDB/000_4_CreateSP.sql#L17466) | — | 0 / 1 | — |
| `AGRARepTransferCalcUnitOneTask` | [Shared / Other](by-topic/shared-other.md) | [L17518](../../../ScriptDB/000_4_CreateSP.sql#L17518) | — | 1 / 0 | — |
| `AGRARepTransferCash4AGRA` | [Account & Plan](by-topic/account-plan.md) | [L17563](../../../ScriptDB/000_4_CreateSP.sql#L17563) | — | 0 / 0 | — |
| `AGRARepTransferCash4AGRA_Old` | [Account & Plan](by-topic/account-plan.md) | [L17843](../../../ScriptDB/000_4_CreateSP.sql#L17843) | — | 0 / 0 | — |
| `AGRARepTransferComboList` | [Shared / Other](by-topic/shared-other.md) | [L18012](../../../ScriptDB/000_4_CreateSP.sql#L18012) | — | 0 / 2 | — |
| `AGRARepTransferDetailList` | [Shared / Other](by-topic/shared-other.md) | [L18029](../../../ScriptDB/000_4_CreateSP.sql#L18029) | 1 / 1 file | 0 / 0 | [Member.cs:5272](../../../UBClasses/Member.cs#L5272) |
| `AGRARepTransferHeaderList` | [Shared / Other](by-topic/shared-other.md) | [L18236](../../../ScriptDB/000_4_CreateSP.sql#L18236) | 1 / 1 file | 0 / 0 | [Member.cs:5111](../../../UBClasses/Member.cs#L5111) |
| `AGRARepTransferInit` | [Shared / Other](by-topic/shared-other.md) | [L18430](../../../ScriptDB/000_4_CreateSP.sql#L18430) | — | 0 / 0 | — |
| `AGRARepTransferInitExtra` | [Notifications](by-topic/notifications.md) | [L18592](../../../ScriptDB/000_4_CreateSP.sql#L18592) | 1 / 1 file | 0 / 0 | [Member.cs:5494](../../../UBClasses/Member.cs#L5494) |
| `AGRARepTransferRemove` | [Shared / Other](by-topic/shared-other.md) | [L18683](../../../ScriptDB/000_4_CreateSP.sql#L18683) | 1 / 1 file | 0 / 0 | [Member.cs:5051](../../../UBClasses/Member.cs#L5051) |
| `AGRARepTransferSelectionUpdate` | [Shared / Other](by-topic/shared-other.md) | [L18733](../../../ScriptDB/000_4_CreateSP.sql#L18733) | — | 0 / 0 | — |
| `AGRATaskDetailList` | [Shared / Other](by-topic/shared-other.md) | [L18768](../../../ScriptDB/000_4_CreateSP.sql#L18768) | — | 0 / 1 | — |
| `AGRATrustEntryDeletedButLinkedToTrxList` | [Account & Plan](by-topic/account-plan.md) | [L19094](../../../ScriptDB/000_4_CreateSP.sql#L19094) | — | 0 / 0 | — |
| `AGRP_AccountList` | [Account & Plan](by-topic/account-plan.md) | [L19132](../../../ScriptDB/000_4_CreateSP.sql#L19132) | — | 0 / 0 | — |
| `AGRP_ConvOmnibusCASH_AGCH` | [Account & Plan](by-topic/account-plan.md) | [L19213](../../../ScriptDB/000_4_CreateSP.sql#L19213) | — | 0 / 1 | — |
| `AGRP_FUndAccountListWithUnit` | [Fund & GIC](by-topic/fund-gic.md) | [L19385](../../../ScriptDB/000_4_CreateSP.sql#L19385) | — | 0 / 0 | — |
| `AGRP_ListPlanPACFirstTrx` | [Account & Plan](by-topic/account-plan.md) | [L19417](../../../ScriptDB/000_4_CreateSP.sql#L19417) | — | 0 / 1 | — |
| `AGRP_OrderReplace2CASH` | [Account & Plan](by-topic/account-plan.md) | [L19466](../../../ScriptDB/000_4_CreateSP.sql#L19466) | — | 0 / 2 | — |
| `AGRP_OrderReplace2CASHOne` | [Account & Plan](by-topic/account-plan.md) | [L19509](../../../ScriptDB/000_4_CreateSP.sql#L19509) | — | 1 / 0 | — |
| `AGRP_RecalcAvgCostOnly_All` | [Shared / Other](by-topic/shared-other.md) | [L19565](../../../ScriptDB/000_4_CreateSP.sql#L19565) | — | 0 / 1 | — |
| `AGRP_RecalcAvgCostUnits` | [Shared / Other](by-topic/shared-other.md) | [L19618](../../../ScriptDB/000_4_CreateSP.sql#L19618) | — | 0 / 1 | — |
| `AGRP_RecalcAvgCostUnits_All` | [Shared / Other](by-topic/shared-other.md) | [L19648](../../../ScriptDB/000_4_CreateSP.sql#L19648) | — | 0 / 1 | — |
| `AGRP_RecalcAvgCostUnits_FromException` | [Shared / Other](by-topic/shared-other.md) | [L19700](../../../ScriptDB/000_4_CreateSP.sql#L19700) | — | 0 / 1 | — |
| `AGRP_RecalcAvgCostUnitsSince` | [Shared / Other](by-topic/shared-other.md) | [L19732](../../../ScriptDB/000_4_CreateSP.sql#L19732) | — | 0 / 1 | — |
| `AGRP_RecalcAvgCostZeroAvgWithUnit` | [Shared / Other](by-topic/shared-other.md) | [L19761](../../../ScriptDB/000_4_CreateSP.sql#L19761) | — | 0 / 1 | — |
| `AGRP_RemoveOmnibusCash` | [Account & Plan](by-topic/account-plan.md) | [L19799](../../../ScriptDB/000_4_CreateSP.sql#L19799) | — | 0 / 0 | — |
| `AGRP_SetAccountAvg2TrxAvgCost` | [Account & Plan](by-topic/account-plan.md) | [L19821](../../../ScriptDB/000_4_CreateSP.sql#L19821) | — | 2 / 0 | — |
| `AGRP_SetAccountAvg2TrxAvgCost_All` | [Account & Plan](by-topic/account-plan.md) | [L19846](../../../ScriptDB/000_4_CreateSP.sql#L19846) | — | 0 / 1 | — |
| `AGRP_TrxAvg2AccountAvg_All` | [Account & Plan](by-topic/account-plan.md) | [L19878](../../../ScriptDB/000_4_CreateSP.sql#L19878) | — | 0 / 1 | — |
| `AGRP_TrxDetailsAllPlans` | [Account & Plan](by-topic/account-plan.md) | [L19910](../../../ScriptDB/000_4_CreateSP.sql#L19910) | — | 0 / 1 | — |
| `AGRP_TrxDetailsOnePlan` | [Account & Plan](by-topic/account-plan.md) | [L19944](../../../ScriptDB/000_4_CreateSP.sql#L19944) | — | 1 / 0 | — |
| `AL_ConvAccounts` | [Account & Plan](by-topic/account-plan.md) | [L19987](../../../ScriptDB/000_4_CreateSP.sql#L19987) | — | 0 / 0 | — |
| `AL_ConvOmnibusCSH001` | [Shared / Other](by-topic/shared-other.md) | [L20115](../../../ScriptDB/000_4_CreateSP.sql#L20115) | — | 0 / 1 | — |
| `AL_ConvOmnibusTrxDetails` | [Trading & Orders](by-topic/trading-orders.md) | [L20268](../../../ScriptDB/000_4_CreateSP.sql#L20268) | — | 0 / 1 | — |
| `AL_ConvOmnibusTrxDetailsOneAccount` | [Account & Plan](by-topic/account-plan.md) | [L20318](../../../ScriptDB/000_4_CreateSP.sql#L20318) | — | 1 / 0 | — |
| `AL_ConvOmnibusTrxs` | [Trading & Orders](by-topic/trading-orders.md) | [L20540](../../../ScriptDB/000_4_CreateSP.sql#L20540) | — | 0 / 0 | — |
| `AMF_AccountOpening` | [Account & Plan](by-topic/account-plan.md) | [L20742](../../../ScriptDB/000_4_CreateSP.sql#L20742) | — | 0 / 0 | — |
| `AMF_AUAByProDuctType` | [Fund & GIC](by-topic/fund-gic.md) | [L20846](../../../ScriptDB/000_4_CreateSP.sql#L20846) | — | 0 / 1 | — |
| `AMF_AUACommissionByRep` | [Commission & Fee](by-topic/commission-fee.md) | [L20933](../../../ScriptDB/000_4_CreateSP.sql#L20933) | — | 0 / 1 | — |
| `AMF_ClientAUAByRep` | [Client & KYC](by-topic/client-kyc.md) | [L21076](../../../ScriptDB/000_4_CreateSP.sql#L21076) | — | 0 / 0 | — |
| `AMF_NumberOfActivePlans` | [Account & Plan](by-topic/account-plan.md) | [L21141](../../../ScriptDB/000_4_CreateSP.sql#L21141) | — | 0 / 0 | — |
| `AMF_PlanLeverageList` | [Account & Plan](by-topic/account-plan.md) | [L21184](../../../ScriptDB/000_4_CreateSP.sql#L21184) | — | 0 / 0 | — |
| `AMF_PlanPOALTAList` | [Account & Plan](by-topic/account-plan.md) | [L21240](../../../ScriptDB/000_4_CreateSP.sql#L21240) | — | 0 / 0 | — |
| `AMF_TradeBlotter` | [Trading & Orders](by-topic/trading-orders.md) | [L21296](../../../ScriptDB/000_4_CreateSP.sql#L21296) | — | 0 / 0 | — |
| `B2B_CommissionLink2PlanFix` | [Commission & Fee](by-topic/commission-fee.md) | [L21408](../../../ScriptDB/000_4_CreateSP.sql#L21408) | — | 0 / 0 | — |
| `B2B_DEc082017CWT_Step1` | [Shared / Other](by-topic/shared-other.md) | [L21436](../../../ScriptDB/000_4_CreateSP.sql#L21436) | — | 0 / 0 | — |
| `B2B_DEc082017CWT_Step2` | [Shared / Other](by-topic/shared-other.md) | [L21494](../../../ScriptDB/000_4_CreateSP.sql#L21494) | — | 0 / 1 | — |
| `B2B_DEc082017CWT_Step3` | [Shared / Other](by-topic/shared-other.md) | [L21525](../../../ScriptDB/000_4_CreateSP.sql#L21525) | — | 0 / 1 | — |
| `B2B_GIC_Remove` | [Fund & GIC](by-topic/fund-gic.md) | [L21555](../../../ScriptDB/000_4_CreateSP.sql#L21555) | — | 0 / 0 | — |
| `B2BAccountScan` | [Account & Plan](by-topic/account-plan.md) | [L21603](../../../ScriptDB/000_4_CreateSP.sql#L21603) | — | 0 / 2 | — |
| `ChangeClientUserDefine1Rep` | [Client & KYC](by-topic/client-kyc.md) | [L21678](../../../ScriptDB/000_4_CreateSP.sql#L21678) | — | 0 / 0 | — |
| `CIRO_ClientAMLRiskRanking` | [Compliance](by-topic/compliance.md) | [L21734](../../../ScriptDB/000_4_CreateSP.sql#L21734) | — | 0 / 0 | — |
| `CIRO_EFTSummary` | [Compliance](by-topic/compliance.md) | [L21753](../../../ScriptDB/000_4_CreateSP.sql#L21753) | — | 0 / 0 | — |
| `CIRO_FPEP` | [Compliance](by-topic/compliance.md) | [L21834](../../../ScriptDB/000_4_CreateSP.sql#L21834) | — | 0 / 0 | — |
| `CIRO_NewClients` | [Compliance](by-topic/compliance.md) | [L21868](../../../ScriptDB/000_4_CreateSP.sql#L21868) | — | 0 / 0 | — |
| `CIRO_NumberOfAccounts` | [Compliance](by-topic/compliance.md) | [L21897](../../../ScriptDB/000_4_CreateSP.sql#L21897) | — | 0 / 0 | — |
| `ClientSearchSpecial_2Test` | [Client & KYC](by-topic/client-kyc.md) | [L22015](../../../ScriptDB/000_4_CreateSP.sql#L22015) | — | 0 / 0 | — |
| `CON_AssignDealerPortionComm` | [Commission & Fee](by-topic/commission-fee.md) | [L23436](../../../ScriptDB/000_4_CreateSP.sql#L23436) | — | 1 / 0 | — |
| `CON_AssignDealerPortionCommAll` | [Commission & Fee](by-topic/commission-fee.md) | [L23595](../../../ScriptDB/000_4_CreateSP.sql#L23595) | — | 0 / 1 | — |
| `CON_AuditTrailInitFixClient` | [Client & KYC](by-topic/client-kyc.md) | [L23627](../../../ScriptDB/000_4_CreateSP.sql#L23627) | — | 0 / 1 | — |
| `CON_AuditTrailInitFixPlan` | [Account & Plan](by-topic/account-plan.md) | [L23668](../../../ScriptDB/000_4_CreateSP.sql#L23668) | — | 0 / 1 | — |
| `CON_Axis_CalcAverageCostAll` | [Shared / Other](by-topic/shared-other.md) | [L23708](../../../ScriptDB/000_4_CreateSP.sql#L23708) | — | 0 / 1 | — |
| `CON_Axis_CalcAverageCostFromAccountLevel` | [Account & Plan](by-topic/account-plan.md) | [L23745](../../../ScriptDB/000_4_CreateSP.sql#L23745) | — | 0 / 0 | — |
| `CON_Axis_CalcAverageCostFromStart` | [Shared / Other](by-topic/shared-other.md) | [L23839](../../../ScriptDB/000_4_CreateSP.sql#L23839) | — | 0 / 0 | — |
| `CON_Axis_CalcAverageCostOne` | [Shared / Other](by-topic/shared-other.md) | [L23954](../../../ScriptDB/000_4_CreateSP.sql#L23954) | — | 1 / 0 | — |
| `CON_Axis_Price` | [Shared / Other](by-topic/shared-other.md) | [L23990](../../../ScriptDB/000_4_CreateSP.sql#L23990) | — | 0 / 0 | — |
| `CON_Axis_VF_Client_All` | [Client & KYC](by-topic/client-kyc.md) | [L24155](../../../ScriptDB/000_4_CreateSP.sql#L24155) | — | 0 / 1 | — |
| `CON_Axis_VF_Client_One` | [Client & KYC](by-topic/client-kyc.md) | [L24191](../../../ScriptDB/000_4_CreateSP.sql#L24191) | — | 1 / 2 | — |
| `CON_Axis_VF_Plan_All` | [Account & Plan](by-topic/account-plan.md) | [L24578](../../../ScriptDB/000_4_CreateSP.sql#L24578) | — | 0 / 1 | — |
| `CON_Axis_VF_Plan_One` | [Account & Plan](by-topic/account-plan.md) | [L24620](../../../ScriptDB/000_4_CreateSP.sql#L24620) | — | 1 / 0 | — |
| `CON_Axis_VF_Pos_All` | [Shared / Other](by-topic/shared-other.md) | [L24897](../../../ScriptDB/000_4_CreateSP.sql#L24897) | — | 0 / 1 | — |
| `CON_Axis_VF_Pos_One` | [Shared / Other](by-topic/shared-other.md) | [L24930](../../../ScriptDB/000_4_CreateSP.sql#L24930) | — | 1 / 1 | — |
| `CON_Axis_VF_PRICE_All` | [Shared / Other](by-topic/shared-other.md) | [L25071](../../../ScriptDB/000_4_CreateSP.sql#L25071) | — | 0 / 1 | — |
| `CON_Axis_VF_PRICE_One` | [Shared / Other](by-topic/shared-other.md) | [L25102](../../../ScriptDB/000_4_CreateSP.sql#L25102) | — | 1 / 1 | — |
| `CON_Axis_VF_PRODUCT_All` | [Fund & GIC](by-topic/fund-gic.md) | [L25126](../../../ScriptDB/000_4_CreateSP.sql#L25126) | — | 0 / 1 | — |
| `CON_Axis_VF_PRODUCT_One` | [Fund & GIC](by-topic/fund-gic.md) | [L25161](../../../ScriptDB/000_4_CreateSP.sql#L25161) | — | 1 / 1 | — |
| `CON_Axis_VF_Trx_One` | [Trading & Orders](by-topic/trading-orders.md) | [L25339](../../../ScriptDB/000_4_CreateSP.sql#L25339) | — | 1 / 0 | — |
| `CON_Axis_VF_Trx_OnePos` | [Trading & Orders](by-topic/trading-orders.md) | [L25547](../../../ScriptDB/000_4_CreateSP.sql#L25547) | — | 1 / 1 | — |
| `CON_CCB_FundAccountSys` | [Fund & GIC](by-topic/fund-gic.md) | [L25576](../../../ScriptDB/000_4_CreateSP.sql#L25576) | — | 0 / 0 | — |
| `CON_CheckImportedAT_SIN_12` | [Shared / Other](by-topic/shared-other.md) | [L25667](../../../ScriptDB/000_4_CreateSP.sql#L25667) | — | 0 / 0 | — |
| `CON_CompareAccountWF_VF` | [Account & Plan](by-topic/account-plan.md) | [L25701](../../../ScriptDB/000_4_CreateSP.sql#L25701) | — | 0 / 0 | — |
| `CON_Copy1000Price` | [Shared / Other](by-topic/shared-other.md) | [L25759](../../../ScriptDB/000_4_CreateSP.sql#L25759) | — | 0 / 1 | — |
| `CON_Copy1Price` | [Shared / Other](by-topic/shared-other.md) | [L25796](../../../ScriptDB/000_4_CreateSP.sql#L25796) | — | 1 / 0 | — |
| `CON_CopyClientKYC` | [Client & KYC](by-topic/client-kyc.md) | [L25850](../../../ScriptDB/000_4_CreateSP.sql#L25850) | — | 1 / 0 | — |
| `CON_CopyClientKYC_All` | [Client & KYC](by-topic/client-kyc.md) | [L26156](../../../ScriptDB/000_4_CreateSP.sql#L26156) | — | 0 / 1 | — |
| `CON_CopyPlanKYC` | [Account & Plan](by-topic/account-plan.md) | [L26194](../../../ScriptDB/000_4_CreateSP.sql#L26194) | — | 1 / 0 | — |
| `CON_CopyPlanKYC_All` | [Account & Plan](by-topic/account-plan.md) | [L26390](../../../ScriptDB/000_4_CreateSP.sql#L26390) | — | 0 / 1 | — |
| `CON_CREATE_INSERT_TB` | [Shared / Other](by-topic/shared-other.md) | [L26426](../../../ScriptDB/000_4_CreateSP.sql#L26426) | — | 0 / 0 | — |
| `CON_CWM_1Client` | [Client & KYC](by-topic/client-kyc.md) | [L26535](../../../ScriptDB/000_4_CreateSP.sql#L26535) | — | 0 / 3 | — |
| `CON_CWM_LoanImport_Invest` | [Shared / Other](by-topic/shared-other.md) | [L26725](../../../ScriptDB/000_4_CreateSP.sql#L26725) | — | 0 / 0 | — |
| `CON_CWM_LoanImport_RRSP` | [Account & Plan](by-topic/account-plan.md) | [L26883](../../../ScriptDB/000_4_CreateSP.sql#L26883) | — | 0 / 1 | — |
| `CON_DealerCodeChange` | [Shared / Other](by-topic/shared-other.md) | [L27011](../../../ScriptDB/000_4_CreateSP.sql#L27011) | — | 0 / 0 | — |
| `CON_DES_Client1` | [Client & KYC](by-topic/client-kyc.md) | [L27061](../../../ScriptDB/000_4_CreateSP.sql#L27061) | — | 1 / 2 | — |
| `CON_DESC_Client` | [Client & KYC](by-topic/client-kyc.md) | [L27197](../../../ScriptDB/000_4_CreateSP.sql#L27197) | — | 0 / 1 | — |
| `CON_FixDuplicateAccountOne` | [Account & Plan](by-topic/account-plan.md) | [L27234](../../../ScriptDB/000_4_CreateSP.sql#L27234) | — | 0 / 0 | — |
| `CON_FixPhoneWF_VF` | [Shared / Other](by-topic/shared-other.md) | [L27281](../../../ScriptDB/000_4_CreateSP.sql#L27281) | — | 0 / 0 | — |
| `CON_FixTrxLookup_Agenz` | [Trading & Orders](by-topic/trading-orders.md) | [L27325](../../../ScriptDB/000_4_CreateSP.sql#L27325) | — | 0 / 1 | — |
| `CON_FixTrxLookup_AgenzOne` | [Trading & Orders](by-topic/trading-orders.md) | [L27363](../../../ScriptDB/000_4_CreateSP.sql#L27363) | — | 1 / 4 | — |
| `CON_FundAccountAUA` | [Fund & GIC](by-topic/fund-gic.md) | [L27427](../../../ScriptDB/000_4_CreateSP.sql#L27427) | — | 0 / 1 | — |
| `CON_FundAccountAUAOne` | [Fund & GIC](by-topic/fund-gic.md) | [L27474](../../../ScriptDB/000_4_CreateSP.sql#L27474) | — | 1 / 1 | — |
| `CON_FundAccountDuplicationList` | [Fund & GIC](by-topic/fund-gic.md) | [L27529](../../../ScriptDB/000_4_CreateSP.sql#L27529) | — | 0 / 0 | — |
| `CON_FundPositionDuplicationList` | [Fund & GIC](by-topic/fund-gic.md) | [L27610](../../../ScriptDB/000_4_CreateSP.sql#L27610) | — | 0 / 0 | — |
| `CON_FundPositionDuplicationRemove` | [Fund & GIC](by-topic/fund-gic.md) | [L27694](../../../ScriptDB/000_4_CreateSP.sql#L27694) | — | 0 / 0 | — |
| `CON_FundPositionNoDefList` | [Fund & GIC](by-topic/fund-gic.md) | [L27760](../../../ScriptDB/000_4_CreateSP.sql#L27760) | — | 0 / 0 | — |
| `CON_GICSupplierSetCannex` | [Fund & GIC](by-topic/fund-gic.md) | [L27816](../../../ScriptDB/000_4_CreateSP.sql#L27816) | — | 0 / 1 | — |
| `CON_GICSupplierSetCannex1` | [Fund & GIC](by-topic/fund-gic.md) | [L27940](../../../ScriptDB/000_4_CreateSP.sql#L27940) | — | 1 / 1 | — |
| `CON_InactiveStats` | [Shared / Other](by-topic/shared-other.md) | [L27971](../../../ScriptDB/000_4_CreateSP.sql#L27971) | — | 0 / 0 | — |
| `CON_InitComplianceTrx` | [Compliance](by-topic/compliance.md) | [L28060](../../../ScriptDB/000_4_CreateSP.sql#L28060) | — | 0 / 2 | — |
| `CON_InitDealerForms` | [Documents & PDF](by-topic/documents-pdf.md) | [L28136](../../../ScriptDB/000_4_CreateSP.sql#L28136) | — | 0 / 1 | — |
| `CON_InitDefFieldID` | [Shared / Other](by-topic/shared-other.md) | [L28163](../../../ScriptDB/000_4_CreateSP.sql#L28163) | — | 0 / 0 | — |
| `CON_ListPlanWithLastKYCLaterThenApproval` | [Account & Plan](by-topic/account-plan.md) | [L28275](../../../ScriptDB/000_4_CreateSP.sql#L28275) | — | 0 / 0 | — |
| `CON_MemberLoginIDEqualMemberID` | [Security & Auth](by-topic/security-auth.md) | [L28312](../../../ScriptDB/000_4_CreateSP.sql#L28312) | — | 0 / 0 | — |
| `CON_MergerTrx_AcceptedandContract` | [Trading & Orders](by-topic/trading-orders.md) | [L28377](../../../ScriptDB/000_4_CreateSP.sql#L28377) | — | 0 / 0 | — |
| `CON_MoveFund2Cash` | [Fund & GIC](by-topic/fund-gic.md) | [L28406](../../../ScriptDB/000_4_CreateSP.sql#L28406) | — | 0 / 1 | — |
| `CON_MoveFund2Cash_YIS` | [Fund & GIC](by-topic/fund-gic.md) | [L28500](../../../ScriptDB/000_4_CreateSP.sql#L28500) | — | 0 / 1 | — |
| `CON_MoveFundTrx2CashTrx` | [Fund & GIC](by-topic/fund-gic.md) | [L28615](../../../ScriptDB/000_4_CreateSP.sql#L28615) | — | 1 / 1 | — |
| `CON_MoveFundTrx2CashTrxOneFund` | [Fund & GIC](by-topic/fund-gic.md) | [L28693](../../../ScriptDB/000_4_CreateSP.sql#L28693) | — | 0 / 1 | — |
| `CON_MoveTrx2CashTrx` | [Account & Plan](by-topic/account-plan.md) | [L28726](../../../ScriptDB/000_4_CreateSP.sql#L28726) | — | 3 / 0 | — |
| `CON_MSAF_Rep` | [Shared / Other](by-topic/shared-other.md) | [L28784](../../../ScriptDB/000_4_CreateSP.sql#L28784) | — | 0 / 0 | — |
| `CON_OB_3rdParty` | [Shared / Other](by-topic/shared-other.md) | [L28895](../../../ScriptDB/000_4_CreateSP.sql#L28895) | — | 0 / 1 | — |
| `CON_OB_Add1AttachmentFile` | [Documents & PDF](by-topic/documents-pdf.md) | [L29002](../../../ScriptDB/000_4_CreateSP.sql#L29002) | — | 0 / 0 | — |
| `CON_OB_Add1StatementFile` | [Shared / Other](by-topic/shared-other.md) | [L29068](../../../ScriptDB/000_4_CreateSP.sql#L29068) | — | 0 / 0 | — |
| `CON_OB_Attachment` | [Documents & PDF](by-topic/documents-pdf.md) | [L29120](../../../ScriptDB/000_4_CreateSP.sql#L29120) | — | 0 / 0 | — |
| `CON_OB_AttachmentList` | [Documents & PDF](by-topic/documents-pdf.md) | [L29269](../../../ScriptDB/000_4_CreateSP.sql#L29269) | — | 0 / 0 | — |
| `CON_OB_Client` | [Client & KYC](by-topic/client-kyc.md) | [L29289](../../../ScriptDB/000_4_CreateSP.sql#L29289) | — | 0 / 6 | — |
| `CON_OB_DealerBranch` | [Shared / Other](by-topic/shared-other.md) | [L30085](../../../ScriptDB/000_4_CreateSP.sql#L30085) | — | 0 / 1 | — |
| `CON_OB_Dealership` | [Shared / Other](by-topic/shared-other.md) | [L30154](../../../ScriptDB/000_4_CreateSP.sql#L30154) | — | 0 / 1 | — |
| `CON_OB_FundAccount2` | [Fund & GIC](by-topic/fund-gic.md) | [L30225](../../../ScriptDB/000_4_CreateSP.sql#L30225) | — | 0 / 2 | — |
| `CON_OB_FundDef` | [Fund & GIC](by-topic/fund-gic.md) | [L30542](../../../ScriptDB/000_4_CreateSP.sql#L30542) | — | 0 / 1 | — |
| `CON_OB_FundTrx` | [Fund & GIC](by-topic/fund-gic.md) | [L30842](../../../ScriptDB/000_4_CreateSP.sql#L30842) | — | 1 / 1 | — |
| `CON_OB_GIC` | [Fund & GIC](by-topic/fund-gic.md) | [L31361](../../../ScriptDB/000_4_CreateSP.sql#L31361) | — | 0 / 0 | — |
| `CON_OB_Intermediary` | [Client & KYC](by-topic/client-kyc.md) | [L31572](../../../ScriptDB/000_4_CreateSP.sql#L31572) | — | 0 / 1 | — |
| `CON_OB_Notes` | [Shared / Other](by-topic/shared-other.md) | [L31626](../../../ScriptDB/000_4_CreateSP.sql#L31626) | — | 0 / 0 | — |
| `CON_OB_OnePlan_AddJoint` | [Account & Plan](by-topic/account-plan.md) | [L31746](../../../ScriptDB/000_4_CreateSP.sql#L31746) | — | 1 / 1 | — |
| `CON_OB_Plan` | [Account & Plan](by-topic/account-plan.md) | [L31803](../../../ScriptDB/000_4_CreateSP.sql#L31803) | — | 0 / 8 | — |
| `CON_OB_PlanBen` | [Account & Plan](by-topic/account-plan.md) | [L32648](../../../ScriptDB/000_4_CreateSP.sql#L32648) | — | 1 / 2 | — |
| `CON_OB_PlanInTrust` | [Account & Plan](by-topic/account-plan.md) | [L32724](../../../ScriptDB/000_4_CreateSP.sql#L32724) | — | 1 / 0 | — |
| `CON_OB_Price` | [Shared / Other](by-topic/shared-other.md) | [L32783](../../../ScriptDB/000_4_CreateSP.sql#L32783) | — | 0 / 0 | — |
| `CON_OB_StatementList` | [Shared / Other](by-topic/shared-other.md) | [L32938](../../../ScriptDB/000_4_CreateSP.sql#L32938) | — | 0 / 0 | — |
| `CON_OB_Supplier` | [Shared / Other](by-topic/shared-other.md) | [L32960](../../../ScriptDB/000_4_CreateSP.sql#L32960) | — | 0 / 1 | — |
| `CON_OB_UserStep1` | [Shared / Other](by-topic/shared-other.md) | [L33021](../../../ScriptDB/000_4_CreateSP.sql#L33021) | — | 0 / 2 | — |
| `CON_OB_UserStep2` | [Shared / Other](by-topic/shared-other.md) | [L33209](../../../ScriptDB/000_4_CreateSP.sql#L33209) | — | 0 / 4 | — |
| `CON_OB_UserStep3` | [Shared / Other](by-topic/shared-other.md) | [L33416](../../../ScriptDB/000_4_CreateSP.sql#L33416) | — | 0 / 4 | — |
| `CON_PhoneUpdate` | [Shared / Other](by-topic/shared-other.md) | [L33723](../../../ScriptDB/000_4_CreateSP.sql#L33723) | — | 0 / 0 | — |
| `CON_PHX_AccountNoTransfer` | [Account & Plan](by-topic/account-plan.md) | [L33794](../../../ScriptDB/000_4_CreateSP.sql#L33794) | — | 0 / 0 | — |
| `CON_PHX_ClearAverageCostHistory` | [Shared / Other](by-topic/shared-other.md) | [L33824](../../../ScriptDB/000_4_CreateSP.sql#L33824) | — | 0 / 0 | — |
| `CON_PHX_Expense_From_Excel` | [Shared / Other](by-topic/shared-other.md) | [L33842](../../../ScriptDB/000_4_CreateSP.sql#L33842) | — | 0 / 0 | — |
| `CON_PHX_FFSOne` | [Shared / Other](by-topic/shared-other.md) | [L33895](../../../ScriptDB/000_4_CreateSP.sql#L33895) | — | 0 / 0 | — |
| `CON_PHX_ResetAverageCost` | [Shared / Other](by-topic/shared-other.md) | [L34068](../../../ScriptDB/000_4_CreateSP.sql#L34068) | — | 0 / 1 | — |
| `CON_PHX_ServiceFee_Excel_One` | [Commission & Fee](by-topic/commission-fee.md) | [L34092](../../../ScriptDB/000_4_CreateSP.sql#L34092) | — | 0 / 0 | — |
| `CON_PHX_ServiceFeeOne` | [Commission & Fee](by-topic/commission-fee.md) | [L34303](../../../ScriptDB/000_4_CreateSP.sql#L34303) | — | 0 / 0 | — |
| `CON_PHX_TrxCommOne` | [Commission & Fee](by-topic/commission-fee.md) | [L34514](../../../ScriptDB/000_4_CreateSP.sql#L34514) | — | 0 / 0 | — |
| `CON_PRIV_1Client` | [Client & KYC](by-topic/client-kyc.md) | [L34703](../../../ScriptDB/000_4_CreateSP.sql#L34703) | — | 1 / 2 | — |
| `CON_PRIV_Client` | [Client & KYC](by-topic/client-kyc.md) | [L34953](../../../ScriptDB/000_4_CreateSP.sql#L34953) | — | 0 / 1 | — |
| `CON_RefreshPrimary` | [Shared / Other](by-topic/shared-other.md) | [L34995](../../../ScriptDB/000_4_CreateSP.sql#L34995) | — | 0 / 0 | — |
| `CON_RefreshPrimaryPlanClient` | [Account & Plan](by-topic/account-plan.md) | [L35021](../../../ScriptDB/000_4_CreateSP.sql#L35021) | — | 0 / 0 | — |
| `CON_RemoveGICByRepCode` | [Fund & GIC](by-topic/fund-gic.md) | [L35048](../../../ScriptDB/000_4_CreateSP.sql#L35048) | — | 0 / 0 | — |
| `CON_RepCodeChange` | [Shared / Other](by-topic/shared-other.md) | [L35085](../../../ScriptDB/000_4_CreateSP.sql#L35085) | — | 0 / 0 | — |
| `CON_SetCientStartID` | [Shared / Other](by-topic/shared-other.md) | [L35132](../../../ScriptDB/000_4_CreateSP.sql#L35132) | — | 0 / 0 | — |
| `CON_SetPlanApproved_Attach` | [Account & Plan](by-topic/account-plan.md) | [L35157](../../../ScriptDB/000_4_CreateSP.sql#L35157) | — | 0 / 2 | — |
| `CON_SetPlanPercentagetoTickBox` | [Account & Plan](by-topic/account-plan.md) | [L35213](../../../ScriptDB/000_4_CreateSP.sql#L35213) | — | 0 / 0 | — |
| `CON_SetStatusCommFiles` | [Commission & Fee](by-topic/commission-fee.md) | [L35320](../../../ScriptDB/000_4_CreateSP.sql#L35320) | — | 0 / 0 | — |
| `CON_SHAH_LTA` | [Shared / Other](by-topic/shared-other.md) | [L35369](../../../ScriptDB/000_4_CreateSP.sql#L35369) | — | 0 / 0 | — |
| `CON_TrxSwitchFromOrder` | [Trading & Orders](by-topic/trading-orders.md) | [L35421](../../../ScriptDB/000_4_CreateSP.sql#L35421) | — | 0 / 1 | — |
| `CON_UBAveragedCostAdd` | [Shared / Other](by-topic/shared-other.md) | [L35614](../../../ScriptDB/000_4_CreateSP.sql#L35614) | — | 1 / 0 | — |
| `CON_UN_Add1AttachmentFile` | [Documents & PDF](by-topic/documents-pdf.md) | [L35654](../../../ScriptDB/000_4_CreateSP.sql#L35654) | — | 0 / 0 | — |
| `CON_UN_AttachmentList` | [Documents & PDF](by-topic/documents-pdf.md) | [L35734](../../../ScriptDB/000_4_CreateSP.sql#L35734) | — | 0 / 0 | — |
| `CON_UN_Ben_OnePlan` | [Account & Plan](by-topic/account-plan.md) | [L35751](../../../ScriptDB/000_4_CreateSP.sql#L35751) | — | 1 / 0 | — |
| `CON_UN_CheckMRS_ETF_AllPlan` | [Fund & GIC](by-topic/fund-gic.md) | [L35857](../../../ScriptDB/000_4_CreateSP.sql#L35857) | — | 0 / 1 | — |
| `CON_UN_CheckMRS_ETF_OnePlan` | [Fund & GIC](by-topic/fund-gic.md) | [L35886](../../../ScriptDB/000_4_CreateSP.sql#L35886) | — | 1 / 0 | — |
| `CON_UN_Client` | [Client & KYC](by-topic/client-kyc.md) | [L35941](../../../ScriptDB/000_4_CreateSP.sql#L35941) | — | 0 / 1 | — |
| `CON_UN_Client_One` | [Client & KYC](by-topic/client-kyc.md) | [L35980](../../../ScriptDB/000_4_CreateSP.sql#L35980) | — | 1 / 5 | — |
| `CON_UN_Client_OneID` | [Client & KYC](by-topic/client-kyc.md) | [L36625](../../../ScriptDB/000_4_CreateSP.sql#L36625) | — | 0 / 0 | — |
| `CON_UN_Client_OneTCP` | [Client & KYC](by-topic/client-kyc.md) | [L36680](../../../ScriptDB/000_4_CreateSP.sql#L36680) | — | 1 / 0 | — |
| `CON_UN_Family` | [Client & KYC](by-topic/client-kyc.md) | [L36793](../../../ScriptDB/000_4_CreateSP.sql#L36793) | — | 0 / 1 | — |
| `CON_UN_FamilyOne` | [Client & KYC](by-topic/client-kyc.md) | [L36834](../../../ScriptDB/000_4_CreateSP.sql#L36834) | — | 1 / 0 | — |
| `CON_UN_FundAccount` | [Fund & GIC](by-topic/fund-gic.md) | [L36899](../../../ScriptDB/000_4_CreateSP.sql#L36899) | — | 0 / 1 | — |
| `CON_UN_FundAccount_One` | [Fund & GIC](by-topic/fund-gic.md) | [L36926](../../../ScriptDB/000_4_CreateSP.sql#L36926) | — | 1 / 0 | — |
| `CON_UN_InTrust_OnePlan` | [Account & Plan](by-topic/account-plan.md) | [L37009](../../../ScriptDB/000_4_CreateSP.sql#L37009) | — | 1 / 0 | — |
| `CON_UN_MergeAllGroup` | [Shared / Other](by-topic/shared-other.md) | [L37107](../../../ScriptDB/000_4_CreateSP.sql#L37107) | — | 0 / 1 | — |
| `CON_UN_MergeOnGroup` | [Shared / Other](by-topic/shared-other.md) | [L37137](../../../ScriptDB/000_4_CreateSP.sql#L37137) | — | 1 / 1 | — |
| `CON_UN_Plan` | [Account & Plan](by-topic/account-plan.md) | [L37200](../../../ScriptDB/000_4_CreateSP.sql#L37200) | — | 0 / 1 | — |
| `CON_UN_Plan_One` | [Account & Plan](by-topic/account-plan.md) | [L37239](../../../ScriptDB/000_4_CreateSP.sql#L37239) | — | 1 / 3 | — |
| `CON_UN_ReCalcAveragedCostETF` | [Fund & GIC](by-topic/fund-gic.md) | [L37522](../../../ScriptDB/000_4_CreateSP.sql#L37522) | — | 0 / 1 | — |
| `CON_UN_TFSASucc_OnePlan` | [Account & Plan](by-topic/account-plan.md) | [L37550](../../../ScriptDB/000_4_CreateSP.sql#L37550) | — | 1 / 0 | — |
| `CON_UN_TrxAllAccount` | [Account & Plan](by-topic/account-plan.md) | [L37656](../../../ScriptDB/000_4_CreateSP.sql#L37656) | — | 0 / 1 | — |
| `CON_UN_TrxOne` | [Trading & Orders](by-topic/trading-orders.md) | [L37684](../../../ScriptDB/000_4_CreateSP.sql#L37684) | — | 1 / 0 | — |
| `CON_UN_TrxOneAccount` | [Account & Plan](by-topic/account-plan.md) | [L37909](../../../ScriptDB/000_4_CreateSP.sql#L37909) | — | 1 / 1 | — |
| `CON_VerifyClientInactive` | [Client & KYC](by-topic/client-kyc.md) | [L37935](../../../ScriptDB/000_4_CreateSP.sql#L37935) | — | 0 / 0 | — |
| `CON_VerifyClientStatus` | [Client & KYC](by-topic/client-kyc.md) | [L37983](../../../ScriptDB/000_4_CreateSP.sql#L37983) | — | 0 / 0 | — |
| `CON_VerifyFundPosition` | [Fund & GIC](by-topic/fund-gic.md) | [L38030](../../../ScriptDB/000_4_CreateSP.sql#L38030) | — | 0 / 0 | — |
| `CON_VerifyFundPosition_2` | [Fund & GIC](by-topic/fund-gic.md) | [L38077](../../../ScriptDB/000_4_CreateSP.sql#L38077) | — | 0 / 0 | — |
| `CON_VerifyFundPosition_ActiveZeroUnit` | [Fund & GIC](by-topic/fund-gic.md) | [L38137](../../../ScriptDB/000_4_CreateSP.sql#L38137) | — | 0 / 0 | — |
| `CON_VerifyFundPosition_SetEndDate` | [Fund & GIC](by-topic/fund-gic.md) | [L38211](../../../ScriptDB/000_4_CreateSP.sql#L38211) | — | 0 / 0 | — |
| `CON_VerifyFundPosition_ZeroUnitTrx` | [Fund & GIC](by-topic/fund-gic.md) | [L38272](../../../ScriptDB/000_4_CreateSP.sql#L38272) | — | 0 / 0 | — |
| `CON_VerifyPlanSetEndDate` | [Account & Plan](by-topic/account-plan.md) | [L38337](../../../ScriptDB/000_4_CreateSP.sql#L38337) | — | 0 / 0 | — |
| `CON_VerifyPlanStatus` | [Account & Plan](by-topic/account-plan.md) | [L38383](../../../ScriptDB/000_4_CreateSP.sql#L38383) | — | 0 / 0 | — |
| `CON_WF_3rdParty` | [Shared / Other](by-topic/shared-other.md) | [L38461](../../../ScriptDB/000_4_CreateSP.sql#L38461) | — | 0 / 1 | — |
| `CON_WF_Add1AttachmentFile` | [Documents & PDF](by-topic/documents-pdf.md) | [L38577](../../../ScriptDB/000_4_CreateSP.sql#L38577) | — | 0 / 0 | — |
| `CON_WF_Add1StatementFile` | [Shared / Other](by-topic/shared-other.md) | [L38597](../../../ScriptDB/000_4_CreateSP.sql#L38597) | — | 0 / 0 | — |
| `CON_WF_AddRepStatement` | [Shared / Other](by-topic/shared-other.md) | [L38680](../../../ScriptDB/000_4_CreateSP.sql#L38680) | — | 0 / 0 | — |
| `CON_WF_AdvisorFeeSettingAll` | [Commission & Fee](by-topic/commission-fee.md) | [L38712](../../../ScriptDB/000_4_CreateSP.sql#L38712) | — | 0 / 1 | — |
| `CON_WF_AdvisorFeeSettingOne` | [Commission & Fee](by-topic/commission-fee.md) | [L38745](../../../ScriptDB/000_4_CreateSP.sql#L38745) | — | 1 / 0 | — |
| `CON_WF_Attachment` | [Documents & PDF](by-topic/documents-pdf.md) | [L38833](../../../ScriptDB/000_4_CreateSP.sql#L38833) | — | 0 / 0 | — |
| `CON_WF_Attachment_Step1` | [Documents & PDF](by-topic/documents-pdf.md) | [L38982](../../../ScriptDB/000_4_CreateSP.sql#L38982) | — | 0 / 0 | — |
| `CON_WF_Attachment_Step2` | [Documents & PDF](by-topic/documents-pdf.md) | [L39003](../../../ScriptDB/000_4_CreateSP.sql#L39003) | — | 0 / 0 | — |
| `CON_WF_Attachment_Topup` | [Documents & PDF](by-topic/documents-pdf.md) | [L39201](../../../ScriptDB/000_4_CreateSP.sql#L39201) | — | 0 / 0 | — |
| `CON_WF_AttachmentFileList` | [Documents & PDF](by-topic/documents-pdf.md) | [L39353](../../../ScriptDB/000_4_CreateSP.sql#L39353) | — | 0 / 0 | — |
| `CON_WF_AuditTrailList` | [Shared / Other](by-topic/shared-other.md) | [L39406](../../../ScriptDB/000_4_CreateSP.sql#L39406) | — | 0 / 0 | — |
| `CON_WF_AuditTrailResetClientOneRep` | [Client & KYC](by-topic/client-kyc.md) | [L39487](../../../ScriptDB/000_4_CreateSP.sql#L39487) | — | 1 / 1 | — |
| `CON_WF_AuditTrailResetPlanOneRep` | [Account & Plan](by-topic/account-plan.md) | [L39531](../../../ScriptDB/000_4_CreateSP.sql#L39531) | — | 1 / 1 | — |
| `CON_WF_AveragedCost1Dealer` | [Shared / Other](by-topic/shared-other.md) | [L39573](../../../ScriptDB/000_4_CreateSP.sql#L39573) | — | 0 / 1 | — |
| `CON_WF_AveragedCost1Plan` | [Account & Plan](by-topic/account-plan.md) | [L39599](../../../ScriptDB/000_4_CreateSP.sql#L39599) | — | 1 / 1 | — |
| `CON_WF_AveragedCost1Pos` | [Shared / Other](by-topic/shared-other.md) | [L39629](../../../ScriptDB/000_4_CreateSP.sql#L39629) | — | 3 / 0 | — |
| `CON_WF_AveragedCostAll` | [Shared / Other](by-topic/shared-other.md) | [L39661](../../../ScriptDB/000_4_CreateSP.sql#L39661) | — | 0 / 1 | — |
| `CON_WF_Bank` | [Shared / Other](by-topic/shared-other.md) | [L39717](../../../ScriptDB/000_4_CreateSP.sql#L39717) | — | 15 / 1 | — |
| `CON_WF_Ben_Step1_Init` | [Shared / Other](by-topic/shared-other.md) | [L39752](../../../ScriptDB/000_4_CreateSP.sql#L39752) | — | 0 / 0 | — |
| `CON_WF_Ben_Step2` | [Shared / Other](by-topic/shared-other.md) | [L39773](../../../ScriptDB/000_4_CreateSP.sql#L39773) | — | 0 / 1 | — |
| `CON_WF_Cash1Plan` | [Account & Plan](by-topic/account-plan.md) | [L39805](../../../ScriptDB/000_4_CreateSP.sql#L39805) | — | 1 / 0 | — |
| `CON_WF_CashPlan` | [Account & Plan](by-topic/account-plan.md) | [L39928](../../../ScriptDB/000_4_CreateSP.sql#L39928) | — | 0 / 1 | — |
| `CON_WF_CashRecalcBalanceNomineeAfterTrustDone` | [Account & Plan](by-topic/account-plan.md) | [L39962](../../../ScriptDB/000_4_CreateSP.sql#L39962) | — | 0 / 1 | — |
| `CON_WF_CashTrx` | [Account & Plan](by-topic/account-plan.md) | [L39996](../../../ScriptDB/000_4_CreateSP.sql#L39996) | — | 2 / 0 | — |
| `CON_WF_CashTrx_One` | [Account & Plan](by-topic/account-plan.md) | [L40198](../../../ScriptDB/000_4_CreateSP.sql#L40198) | — | 0 / 0 | — |
| `CON_WF_CashTrx_Step2` | [Account & Plan](by-topic/account-plan.md) | [L40401](../../../ScriptDB/000_4_CreateSP.sql#L40401) | — | 0 / 0 | — |
| `CON_WF_CashTrx_Topup` | [Account & Plan](by-topic/account-plan.md) | [L40608](../../../ScriptDB/000_4_CreateSP.sql#L40608) | — | 0 / 0 | — |
| `CON_WF_CheckPlanClientLink` | [Account & Plan](by-topic/account-plan.md) | [L40804](../../../ScriptDB/000_4_CreateSP.sql#L40804) | — | 0 / 0 | — |
| `CON_WF_ClearRRSPReceipt` | [Account & Plan](by-topic/account-plan.md) | [L40843](../../../ScriptDB/000_4_CreateSP.sql#L40843) | — | 0 / 0 | — |
| `CON_WF_Client` | [Client & KYC](by-topic/client-kyc.md) | [L40866](../../../ScriptDB/000_4_CreateSP.sql#L40866) | — | 2 / 8 | — |
| `CON_WF_Client_Topup` | [Client & KYC](by-topic/client-kyc.md) | [L41821](../../../ScriptDB/000_4_CreateSP.sql#L41821) | — | 0 / 11 | — |
| `CON_WF_Client_Topup_Step1` | [Client & KYC](by-topic/client-kyc.md) | [L42961](../../../ScriptDB/000_4_CreateSP.sql#L42961) | — | 0 / 0 | — |
| `CON_WF_Client_Topup_Step2` | [Client & KYC](by-topic/client-kyc.md) | [L42988](../../../ScriptDB/000_4_CreateSP.sql#L42988) | — | 0 / 8 | — |
| `CON_WF_Client_Topup_Step3` | [Client & KYC](by-topic/client-kyc.md) | [L44006](../../../ScriptDB/000_4_CreateSP.sql#L44006) | — | 0 / 7 | — |
| `CON_WF_ClientAddressLog` | [Client & KYC](by-topic/client-kyc.md) | [L44914](../../../ScriptDB/000_4_CreateSP.sql#L44914) | — | 1 / 0 | — |
| `CON_WF_ClientAddressLogAll` | [Client & KYC](by-topic/client-kyc.md) | [L44949](../../../ScriptDB/000_4_CreateSP.sql#L44949) | — | 0 / 1 | — |
| `CON_WF_ClientBankAll` | [Client & KYC](by-topic/client-kyc.md) | [L45021](../../../ScriptDB/000_4_CreateSP.sql#L45021) | — | 0 / 1 | — |
| `CON_WF_ClientBankOne` | [Client & KYC](by-topic/client-kyc.md) | [L45047](../../../ScriptDB/000_4_CreateSP.sql#L45047) | — | 4 / 0 | — |
| `CON_WF_ClientBankOneUpdate` | [Client & KYC](by-topic/client-kyc.md) | [L45144](../../../ScriptDB/000_4_CreateSP.sql#L45144) | — | 2 / 0 | — |
| `CON_WF_ClientCheckRep` | [Client & KYC](by-topic/client-kyc.md) | [L45226](../../../ScriptDB/000_4_CreateSP.sql#L45226) | — | 1 / 0 | — |
| `CON_WF_ClientID` | [Client & KYC](by-topic/client-kyc.md) | [L45269](../../../ScriptDB/000_4_CreateSP.sql#L45269) | — | 0 / 0 | — |
| `CON_WF_ClientList` | [Client & KYC](by-topic/client-kyc.md) | [L45289](../../../ScriptDB/000_4_CreateSP.sql#L45289) | — | 0 / 0 | — |
| `CON_WF_ClientNoFileID_OneRep` | [Client & KYC](by-topic/client-kyc.md) | [L45313](../../../ScriptDB/000_4_CreateSP.sql#L45313) | — | 0 / 0 | — |
| `CON_WF_ClientOne` | [Client & KYC](by-topic/client-kyc.md) | [L45341](../../../ScriptDB/000_4_CreateSP.sql#L45341) | — | 0 / 7 | — |
| `CON_WF_Commission1ManagerGrid` | [Commission & Fee](by-topic/commission-fee.md) | [L46098](../../../ScriptDB/000_4_CreateSP.sql#L46098) | — | 0 / 0 | — |
| `CON_WF_CommissionFolder` | [Commission & Fee](by-topic/commission-fee.md) | [L46267](../../../ScriptDB/000_4_CreateSP.sql#L46267) | — | 0 / 0 | — |
| `CON_WF_CommissionFolder_2` | [Commission & Fee](by-topic/commission-fee.md) | [L46354](../../../ScriptDB/000_4_CreateSP.sql#L46354) | — | 0 / 0 | — |
| `CON_WF_CommissionSplitSetting` | [Commission & Fee](by-topic/commission-fee.md) | [L46420](../../../ScriptDB/000_4_CreateSP.sql#L46420) | — | 0 / 0 | — |
| `CON_WF_CommPayable1Item` | [Commission & Fee](by-topic/commission-fee.md) | [L46544](../../../ScriptDB/000_4_CreateSP.sql#L46544) | — | 0 / 0 | — |
| `CON_WF_CommSetItemAsDue` | [Commission & Fee](by-topic/commission-fee.md) | [L46706](../../../ScriptDB/000_4_CreateSP.sql#L46706) | 1 / 1 file | 0 / 0 | [CommissionRevenue.cs:3143](../../../UBClasses/CommissionRevenue.cs#L3143) |
| `CON_WF_CommSetItemAsPaid` | [Commission & Fee](by-topic/commission-fee.md) | [L46737](../../../ScriptDB/000_4_CreateSP.sql#L46737) | 1 / 1 file | 1 / 1 | [CommissionRevenue.cs:3097](../../../UBClasses/CommissionRevenue.cs#L3097) |
| `CON_WF_CommSetPaid` | [Commission & Fee](by-topic/commission-fee.md) | [L46796](../../../ScriptDB/000_4_CreateSP.sql#L46796) | — | 0 / 1 | — |
| `CON_WF_CommTrx` | [Commission & Fee](by-topic/commission-fee.md) | [L46831](../../../ScriptDB/000_4_CreateSP.sql#L46831) | — | 0 / 1 | — |
| `CON_WF_CommTrx_Step1_Init` | [Commission & Fee](by-topic/commission-fee.md) | [L46912](../../../ScriptDB/000_4_CreateSP.sql#L46912) | — | 0 / 0 | — |
| `CON_WF_CommTrx_Step2` | [Commission & Fee](by-topic/commission-fee.md) | [L46934](../../../ScriptDB/000_4_CreateSP.sql#L46934) | — | 0 / 1 | — |
| `CON_WF_CommTrx_Topup` | [Commission & Fee](by-topic/commission-fee.md) | [L46961](../../../ScriptDB/000_4_CreateSP.sql#L46961) | — | 0 / 1 | — |
| `CON_WF_CommTrxOne` | [Commission & Fee](by-topic/commission-fee.md) | [L47039](../../../ScriptDB/000_4_CreateSP.sql#L47039) | — | 3 / 1 | — |
| `CON_WF_Compliance1Trx` | [Compliance](by-topic/compliance.md) | [L47197](../../../ScriptDB/000_4_CreateSP.sql#L47197) | — | 6 / 1 | — |
| `CON_WF_CompTrxTopUp` | [Trading & Orders](by-topic/trading-orders.md) | [L47414](../../../ScriptDB/000_4_CreateSP.sql#L47414) | — | 0 / 0 | — |
| `CON_WF_ConversionInvObjTransfer` | [Trading & Orders](by-topic/trading-orders.md) | [L47501](../../../ScriptDB/000_4_CreateSP.sql#L47501) | — | 0 / 0 | — |
| `CON_WF_DealerBank` | [Shared / Other](by-topic/shared-other.md) | [L47532](../../../ScriptDB/000_4_CreateSP.sql#L47532) | — | 0 / 1 | — |
| `CON_WF_DealerBranch` | [Shared / Other](by-topic/shared-other.md) | [L47604](../../../ScriptDB/000_4_CreateSP.sql#L47604) | — | 2 / 1 | — |
| `CON_WF_Dealership` | [Shared / Other](by-topic/shared-other.md) | [L47673](../../../ScriptDB/000_4_CreateSP.sql#L47673) | — | 2 / 1 | — |
| `CON_WF_Doc` | [Documents & PDF](by-topic/documents-pdf.md) | [L47748](../../../ScriptDB/000_4_CreateSP.sql#L47748) | — | 0 / 0 | — |
| `CON_WF_Doc_Def` | [Documents & PDF](by-topic/documents-pdf.md) | [L47902](../../../ScriptDB/000_4_CreateSP.sql#L47902) | — | 0 / 0 | — |
| `CON_WF_ElectronicDelivery` | [Shared / Other](by-topic/shared-other.md) | [L48011](../../../ScriptDB/000_4_CreateSP.sql#L48011) | — | 0 / 0 | — |
| `CON_WF_Expense` | [Shared / Other](by-topic/shared-other.md) | [L48075](../../../ScriptDB/000_4_CreateSP.sql#L48075) | — | 0 / 1 | — |
| `CON_WF_ExpenseSchedule` | [Shared / Other](by-topic/shared-other.md) | [L48128](../../../ScriptDB/000_4_CreateSP.sql#L48128) | — | 0 / 1 | — |
| `CON_WF_ExpenseSchedule_One` | [Shared / Other](by-topic/shared-other.md) | [L48182](../../../ScriptDB/000_4_CreateSP.sql#L48182) | — | 1 / 0 | — |
| `CON_WF_Family` | [Client & KYC](by-topic/client-kyc.md) | [L48227](../../../ScriptDB/000_4_CreateSP.sql#L48227) | — | 0 / 1 | — |
| `CON_WF_Family_OneRep` | [Client & KYC](by-topic/client-kyc.md) | [L48283](../../../ScriptDB/000_4_CreateSP.sql#L48283) | — | 0 / 1 | — |
| `CON_WF_FamilyOne` | [Client & KYC](by-topic/client-kyc.md) | [L48366](../../../ScriptDB/000_4_CreateSP.sql#L48366) | — | 1 / 0 | — |
| `CON_WF_FamilyOneX` | [Client & KYC](by-topic/client-kyc.md) | [L48426](../../../ScriptDB/000_4_CreateSP.sql#L48426) | — | 1 / 0 | — |
| `CON_WF_FindDuplicateComm` | [Commission & Fee](by-topic/commission-fee.md) | [L48480](../../../ScriptDB/000_4_CreateSP.sql#L48480) | — | 0 / 0 | — |
| `CON_WF_FixCredentialOneMember` | [Shared / Other](by-topic/shared-other.md) | [L48515](../../../ScriptDB/000_4_CreateSP.sql#L48515) | — | 0 / 0 | — |
| `CON_WF_FixDoc` | [Documents & PDF](by-topic/documents-pdf.md) | [L48547](../../../ScriptDB/000_4_CreateSP.sql#L48547) | — | 0 / 0 | — |
| `CON_WF_FixDoc1Plan` | [Account & Plan](by-topic/account-plan.md) | [L48597](../../../ScriptDB/000_4_CreateSP.sql#L48597) | — | 1 / 1 | — |
| `CON_WF_FixDoc1PlanDoc` | [Account & Plan](by-topic/account-plan.md) | [L48632](../../../ScriptDB/000_4_CreateSP.sql#L48632) | — | 1 / 0 | — |
| `CON_WF_FixDocAllPlanDuplicates` | [Account & Plan](by-topic/account-plan.md) | [L48673](../../../ScriptDB/000_4_CreateSP.sql#L48673) | — | 0 / 1 | — |
| `CON_WF_FixDocStatus` | [Documents & PDF](by-topic/documents-pdf.md) | [L48707](../../../ScriptDB/000_4_CreateSP.sql#L48707) | — | 0 / 0 | — |
| `CON_WF_Form` | [Documents & PDF](by-topic/documents-pdf.md) | [L48754](../../../ScriptDB/000_4_CreateSP.sql#L48754) | — | 0 / 1 | — |
| `CON_WF_Form_GenerateScript` | [Documents & PDF](by-topic/documents-pdf.md) | [L48797](../../../ScriptDB/000_4_CreateSP.sql#L48797) | — | 0 / 1 | — |
| `CON_WF_FundAccount` | [Fund & GIC](by-topic/fund-gic.md) | [L48819](../../../ScriptDB/000_4_CreateSP.sql#L48819) | — | 2 / 3 | — |
| `CON_WF_FundAccount_Topup_Add` | [Fund & GIC](by-topic/fund-gic.md) | [L49041](../../../ScriptDB/000_4_CreateSP.sql#L49041) | — | 0 / 0 | — |
| `CON_WF_FundAccount_Topup_Update` | [Fund & GIC](by-topic/fund-gic.md) | [L49284](../../../ScriptDB/000_4_CreateSP.sql#L49284) | — | 0 / 0 | — |
| `CON_WF_FundAccount2` | [Fund & GIC](by-topic/fund-gic.md) | [L49331](../../../ScriptDB/000_4_CreateSP.sql#L49331) | — | 0 / 3 | — |
| `CON_WF_FundAccountStep1_Init` | [Fund & GIC](by-topic/fund-gic.md) | [L49687](../../../ScriptDB/000_4_CreateSP.sql#L49687) | — | 0 / 0 | — |
| `CON_WF_FundAccountStep2` | [Fund & GIC](by-topic/fund-gic.md) | [L49708](../../../ScriptDB/000_4_CreateSP.sql#L49708) | — | 0 / 0 | — |
| `CON_WF_FundAccountSys` | [Fund & GIC](by-topic/fund-gic.md) | [L49980](../../../ScriptDB/000_4_CreateSP.sql#L49980) | — | 0 / 1 | — |
| `CON_WF_FundAccountSys_Step1_Init` | [Fund & GIC](by-topic/fund-gic.md) | [L50065](../../../ScriptDB/000_4_CreateSP.sql#L50065) | — | 0 / 0 | — |
| `CON_WF_FundAccountSys_Step2` | [Fund & GIC](by-topic/fund-gic.md) | [L50084](../../../ScriptDB/000_4_CreateSP.sql#L50084) | — | 0 / 1 | — |
| `CON_WF_FundAccountSys1Plan` | [Fund & GIC](by-topic/fund-gic.md) | [L50146](../../../ScriptDB/000_4_CreateSP.sql#L50146) | — | 5 / 1 | — |
| `CON_WF_FundAccountSys1PlanDetail` | [Fund & GIC](by-topic/fund-gic.md) | [L50349](../../../ScriptDB/000_4_CreateSP.sql#L50349) | — | 1 / 0 | — |
| `CON_WF_FundAccountSysFixDollarAmountIssue` | [Fund & GIC](by-topic/fund-gic.md) | [L50435](../../../ScriptDB/000_4_CreateSP.sql#L50435) | — | 0 / 0 | — |
| `CON_WF_FundAccountSysFixEmptyFundAccountID` | [Fund & GIC](by-topic/fund-gic.md) | [L50513](../../../ScriptDB/000_4_CreateSP.sql#L50513) | — | 0 / 1 | — |
| `CON_WF_FundAccountTrxCompStep_One` | [Fund & GIC](by-topic/fund-gic.md) | [L50555](../../../ScriptDB/000_4_CreateSP.sql#L50555) | — | 0 / 1 | — |
| `CON_WF_FundAccountTrxStep1_Init` | [Fund & GIC](by-topic/fund-gic.md) | [L50610](../../../ScriptDB/000_4_CreateSP.sql#L50610) | — | 0 / 0 | — |
| `CON_WF_FundAccountTrxStep1_Init_Topup` | [Fund & GIC](by-topic/fund-gic.md) | [L50634](../../../ScriptDB/000_4_CreateSP.sql#L50634) | — | 0 / 0 | — |
| `CON_WF_FundAccountTrxStep2` | [Fund & GIC](by-topic/fund-gic.md) | [L50656](../../../ScriptDB/000_4_CreateSP.sql#L50656) | — | 0 / 1 | — |
| `CON_WF_FundAccountTrxStep2_One` | [Fund & GIC](by-topic/fund-gic.md) | [L50717](../../../ScriptDB/000_4_CreateSP.sql#L50717) | — | 1 / 0 | — |
| `CON_WF_FundAccountTrxStep2_One_After` | [Fund & GIC](by-topic/fund-gic.md) | [L51178](../../../ScriptDB/000_4_CreateSP.sql#L51178) | — | 0 / 0 | — |
| `CON_WF_FundAccountTrxStep3` | [Fund & GIC](by-topic/fund-gic.md) | [L51629](../../../ScriptDB/000_4_CreateSP.sql#L51629) | — | 0 / 1 | — |
| `CON_WF_FundAccountTrxStep3_One` | [Fund & GIC](by-topic/fund-gic.md) | [L51659](../../../ScriptDB/000_4_CreateSP.sql#L51659) | — | 1 / 1 | — |
| `CON_WF_FundAccountTrxStep4` | [Fund & GIC](by-topic/fund-gic.md) | [L51806](../../../ScriptDB/000_4_CreateSP.sql#L51806) | — | 0 / 1 | — |
| `CON_WF_FundAccountTrxStep4_One` | [Fund & GIC](by-topic/fund-gic.md) | [L51843](../../../ScriptDB/000_4_CreateSP.sql#L51843) | — | 1 / 0 | — |
| `CON_WF_FundDef` | [Fund & GIC](by-topic/fund-gic.md) | [L52204](../../../ScriptDB/000_4_CreateSP.sql#L52204) | — | 2 / 1 | — |
| `CON_WF_FundDef_FromList` | [Fund & GIC](by-topic/fund-gic.md) | [L52582](../../../ScriptDB/000_4_CreateSP.sql#L52582) | — | 1 / 1 | — |
| `CON_WF_FundDef_MoneyProduct` | [Fund & GIC](by-topic/fund-gic.md) | [L52948](../../../ScriptDB/000_4_CreateSP.sql#L52948) | — | 0 / 1 | — |
| `CON_WF_FundDef_One` | [Fund & GIC](by-topic/fund-gic.md) | [L53125](../../../ScriptDB/000_4_CreateSP.sql#L53125) | — | 0 / 1 | — |
| `CON_WF_FundDef_Topup_Step1` | [Fund & GIC](by-topic/fund-gic.md) | [L53479](../../../ScriptDB/000_4_CreateSP.sql#L53479) | — | 0 / 0 | — |
| `CON_WF_FundDef_Topup_Step2` | [Fund & GIC](by-topic/fund-gic.md) | [L53498](../../../ScriptDB/000_4_CreateSP.sql#L53498) | — | 0 / 1 | — |
| `CON_WF_FundFact` | [Fund & GIC](by-topic/fund-gic.md) | [L53523](../../../ScriptDB/000_4_CreateSP.sql#L53523) | — | 0 / 0 | — |
| `CON_WF_FundTrx` | [Fund & GIC](by-topic/fund-gic.md) | [L53601](../../../ScriptDB/000_4_CreateSP.sql#L53601) | — | 3 / 1 | — |
| `CON_WF_FundTrx_One` | [Fund & GIC](by-topic/fund-gic.md) | [L54144](../../../ScriptDB/000_4_CreateSP.sql#L54144) | — | 0 / 1 | — |
| `CON_WF_FundTrx_One_Force` | [Fund & GIC](by-topic/fund-gic.md) | [L54685](../../../ScriptDB/000_4_CreateSP.sql#L54685) | — | 0 / 0 | — |
| `CON_WF_FundTrx_Topup_Add` | [Fund & GIC](by-topic/fund-gic.md) | [L55186](../../../ScriptDB/000_4_CreateSP.sql#L55186) | — | 0 / 1 | — |
| `CON_WF_FundTrx_Topup_Update` | [Fund & GIC](by-topic/fund-gic.md) | [L55656](../../../ScriptDB/000_4_CreateSP.sql#L55656) | — | 0 / 0 | — |
| `CON_WF_GetBankCode` | [Shared / Other](by-topic/shared-other.md) | [L56025](../../../ScriptDB/000_4_CreateSP.sql#L56025) | — | 23 / 0 | — |
| `CON_WF_GetDefFieldValue` | [Shared / Other](by-topic/shared-other.md) | [L56095](../../../ScriptDB/000_4_CreateSP.sql#L56095) | — | 2 / 0 | — |
| `CON_WF_GetRetirementDate_Port` | [Shared / Other](by-topic/shared-other.md) | [L56150](../../../ScriptDB/000_4_CreateSP.sql#L56150) | — | 4 / 1 | — |
| `CON_WF_GIC` | [Fund & GIC](by-topic/fund-gic.md) | [L56201](../../../ScriptDB/000_4_CreateSP.sql#L56201) | — | 0 / 0 | — |
| `CON_WF_GIC_One` | [Fund & GIC](by-topic/fund-gic.md) | [L56425](../../../ScriptDB/000_4_CreateSP.sql#L56425) | — | 0 / 0 | — |
| `CON_WF_GIC_Product` | [Fund & GIC](by-topic/fund-gic.md) | [L56625](../../../ScriptDB/000_4_CreateSP.sql#L56625) | — | 0 / 1 | — |
| `CON_WF_GICComm` | [Commission & Fee](by-topic/commission-fee.md) | [L56689](../../../ScriptDB/000_4_CreateSP.sql#L56689) | — | 0 / 0 | — |
| `CON_WF_GICComm2` | [Commission & Fee](by-topic/commission-fee.md) | [L56826](../../../ScriptDB/000_4_CreateSP.sql#L56826) | — | 0 / 0 | — |
| `CON_WF_GICCommRateDef` | [Commission & Fee](by-topic/commission-fee.md) | [L56930](../../../ScriptDB/000_4_CreateSP.sql#L56930) | — | 0 / 0 | — |
| `CON_WF_Ins` | [Shared / Other](by-topic/shared-other.md) | [L56963](../../../ScriptDB/000_4_CreateSP.sql#L56963) | — | 0 / 0 | — |
| `CON_WF_Intermediary` | [Client & KYC](by-topic/client-kyc.md) | [L57231](../../../ScriptDB/000_4_CreateSP.sql#L57231) | — | 2 / 1 | — |
| `CON_WF_KYCUpdateAllPlan` | [Account & Plan](by-topic/account-plan.md) | [L57304](../../../ScriptDB/000_4_CreateSP.sql#L57304) | — | 0 / 1 | — |
| `CON_WF_KYCUpdateByBatchCode_Step1` | [Client & KYC](by-topic/client-kyc.md) | [L57348](../../../ScriptDB/000_4_CreateSP.sql#L57348) | — | 0 / 0 | — |
| `CON_WF_KYCUpdateByBatchCode_Step2` | [Client & KYC](by-topic/client-kyc.md) | [L57376](../../../ScriptDB/000_4_CreateSP.sql#L57376) | — | 0 / 1 | — |
| `CON_WF_KYCUpdateOneBatchCode` | [Client & KYC](by-topic/client-kyc.md) | [L57419](../../../ScriptDB/000_4_CreateSP.sql#L57419) | — | 1 / 1 | — |
| `CON_WF_KYCUpdateOnePlan` | [Account & Plan](by-topic/account-plan.md) | [L57744](../../../ScriptDB/000_4_CreateSP.sql#L57744) | — | 9 / 1 | — |
| `CON_WF_KYCUpdateOnePlan_Update` | [Account & Plan](by-topic/account-plan.md) | [L58030](../../../ScriptDB/000_4_CreateSP.sql#L58030) | — | 1 / 1 | — |
| `CON_WF_KYCUpdateOnePlan1Group` | [Account & Plan](by-topic/account-plan.md) | [L58320](../../../ScriptDB/000_4_CreateSP.sql#L58320) | — | 5 / 1 | — |
| `CON_WF_KYCUpdateOnePlanPending` | [Account & Plan](by-topic/account-plan.md) | [L58402](../../../ScriptDB/000_4_CreateSP.sql#L58402) | — | 1 / 1 | — |
| `CON_WF_KYCUpdateOnePlanPendingAll` | [Account & Plan](by-topic/account-plan.md) | [L58460](../../../ScriptDB/000_4_CreateSP.sql#L58460) | — | 0 / 1 | — |
| `CON_WF_KYCUpdatesTableAll` | [Client & KYC](by-topic/client-kyc.md) | [L58499](../../../ScriptDB/000_4_CreateSP.sql#L58499) | — | 0 / 1 | — |
| `CON_WF_KYCUpdatesTableOnePlan` | [Account & Plan](by-topic/account-plan.md) | [L58530](../../../ScriptDB/000_4_CreateSP.sql#L58530) | — | 1 / 1 | — |
| `CON_WF_MailingAddressAll` | [Shared / Other](by-topic/shared-other.md) | [L58594](../../../ScriptDB/000_4_CreateSP.sql#L58594) | — | 0 / 1 | — |
| `CON_WF_MailingAddressOne` | [Shared / Other](by-topic/shared-other.md) | [L58663](../../../ScriptDB/000_4_CreateSP.sql#L58663) | — | 5 / 1 | — |
| `CON_WF_MailingAddressOne_Update` | [Shared / Other](by-topic/shared-other.md) | [L58710](../../../ScriptDB/000_4_CreateSP.sql#L58710) | — | 3 / 1 | — |
| `CON_WF_Manager_One` | [Shared / Other](by-topic/shared-other.md) | [L58755](../../../ScriptDB/000_4_CreateSP.sql#L58755) | — | 0 / 6 | — |
| `CON_WF_ManagerFix` | [Shared / Other](by-topic/shared-other.md) | [L58977](../../../ScriptDB/000_4_CreateSP.sql#L58977) | — | 0 / 4 | — |
| `CON_WF_MemberRepCHeckStatus` | [Shared / Other](by-topic/shared-other.md) | [L59161](../../../ScriptDB/000_4_CreateSP.sql#L59161) | — | 0 / 0 | — |
| `CON_WF_ModelPortfolio` | [Shared / Other](by-topic/shared-other.md) | [L59198](../../../ScriptDB/000_4_CreateSP.sql#L59198) | — | 0 / 2 | — |
| `CON_WF_MON_FixTrxWithGST` | [Trading & Orders](by-topic/trading-orders.md) | [L59243](../../../ScriptDB/000_4_CreateSP.sql#L59243) | — | 0 / 0 | — |
| `CON_WF_MON_SysPlan7908` | [Account & Plan](by-topic/account-plan.md) | [L59297](../../../ScriptDB/000_4_CreateSP.sql#L59297) | — | 0 / 1 | — |
| `CON_WF_MON_SysPlan7952` | [Account & Plan](by-topic/account-plan.md) | [L59394](../../../ScriptDB/000_4_CreateSP.sql#L59394) | — | 0 / 1 | — |
| `CON_WF_Move2PayableGIC` | [Commission & Fee](by-topic/commission-fee.md) | [L59498](../../../ScriptDB/000_4_CreateSP.sql#L59498) | — | 1 / 0 | — |
| `CON_WF_MoveFund2Cash` | [Fund & GIC](by-topic/fund-gic.md) | [L59645](../../../ScriptDB/000_4_CreateSP.sql#L59645) | — | 0 / 1 | — |
| `CON_WF_MRSAccount` | [Account & Plan](by-topic/account-plan.md) | [L59796](../../../ScriptDB/000_4_CreateSP.sql#L59796) | — | 0 / 1 | — |
| `CON_WF_MRSAccount_Topup` | [Account & Plan](by-topic/account-plan.md) | [L60010](../../../ScriptDB/000_4_CreateSP.sql#L60010) | — | 0 / 0 | — |
| `CON_WF_MRSAccountGIC` | [Fund & GIC](by-topic/fund-gic.md) | [L60208](../../../ScriptDB/000_4_CreateSP.sql#L60208) | — | 0 / 0 | — |
| `CON_WF_MRSConversion` | [Trading & Orders](by-topic/trading-orders.md) | [L60475](../../../ScriptDB/000_4_CreateSP.sql#L60475) | — | 0 / 1 | — |
| `CON_WF_Note_Step1` | [Shared / Other](by-topic/shared-other.md) | [L60513](../../../ScriptDB/000_4_CreateSP.sql#L60513) | — | 0 / 0 | — |
| `CON_WF_Note_Step1_init` | [Shared / Other](by-topic/shared-other.md) | [L60545](../../../ScriptDB/000_4_CreateSP.sql#L60545) | — | 0 / 0 | — |
| `CON_WF_Note_Step2` | [Shared / Other](by-topic/shared-other.md) | [L60584](../../../ScriptDB/000_4_CreateSP.sql#L60584) | — | 0 / 0 | — |
| `CON_WF_Notes` | [Shared / Other](by-topic/shared-other.md) | [L60724](../../../ScriptDB/000_4_CreateSP.sql#L60724) | — | 0 / 0 | — |
| `CON_WF_Notes_Comp` | [Shared / Other](by-topic/shared-other.md) | [L60844](../../../ScriptDB/000_4_CreateSP.sql#L60844) | — | 0 / 0 | — |
| `CON_WF_Notes_Comp_1` | [Shared / Other](by-topic/shared-other.md) | [L60992](../../../ScriptDB/000_4_CreateSP.sql#L60992) | — | 0 / 0 | — |
| `CON_WF_Notes_Fix_Monarch` | [Shared / Other](by-topic/shared-other.md) | [L61080](../../../ScriptDB/000_4_CreateSP.sql#L61080) | — | 0 / 0 | — |
| `CON_WF_Notes_Topup` | [Shared / Other](by-topic/shared-other.md) | [L61203](../../../ScriptDB/000_4_CreateSP.sql#L61203) | — | 0 / 0 | — |
| `CON_WF_OnePlan_AddJoint` | [Account & Plan](by-topic/account-plan.md) | [L61325](../../../ScriptDB/000_4_CreateSP.sql#L61325) | — | 5 / 1 | — |
| `CON_WF_OneRep_AccountServiceFee` | [Commission & Fee](by-topic/commission-fee.md) | [L61383](../../../ScriptDB/000_4_CreateSP.sql#L61383) | — | 0 / 1 | — |
| `CON_WF_OneRep_Add` | [Shared / Other](by-topic/shared-other.md) | [L61425](../../../ScriptDB/000_4_CreateSP.sql#L61425) | — | 1 / 0 | — |
| `CON_WF_OneRep_Attachment` | [Documents & PDF](by-topic/documents-pdf.md) | [L61461](../../../ScriptDB/000_4_CreateSP.sql#L61461) | — | 1 / 0 | — |
| `CON_WF_OneRep_Attachment_OneClient` | [Client & KYC](by-topic/client-kyc.md) | [L61648](../../../ScriptDB/000_4_CreateSP.sql#L61648) | — | 0 / 0 | — |
| `CON_WF_OneRep_Attachment_Topup` | [Documents & PDF](by-topic/documents-pdf.md) | [L61843](../../../ScriptDB/000_4_CreateSP.sql#L61843) | — | 0 / 0 | — |
| `CON_WF_OneRep_CompDoc` | [Documents & PDF](by-topic/documents-pdf.md) | [L62035](../../../ScriptDB/000_4_CreateSP.sql#L62035) | — | 1 / 0 | — |
| `CON_WF_OneRep_CompDoc_Topup` | [Documents & PDF](by-topic/documents-pdf.md) | [L62184](../../../ScriptDB/000_4_CreateSP.sql#L62184) | — | 0 / 0 | — |
| `CON_WF_OneRep_MergeAccountTrx` | [Account & Plan](by-topic/account-plan.md) | [L62338](../../../ScriptDB/000_4_CreateSP.sql#L62338) | — | 0 / 1 | — |
| `CON_WF_OneRep_Notes` | [Shared / Other](by-topic/shared-other.md) | [L62493](../../../ScriptDB/000_4_CreateSP.sql#L62493) | — | 1 / 0 | — |
| `CON_WF_OneRep_Notes_Comp` | [Shared / Other](by-topic/shared-other.md) | [L62651](../../../ScriptDB/000_4_CreateSP.sql#L62651) | — | 0 / 0 | — |
| `CON_WF_OneRep_Notes_OneClient` | [Client & KYC](by-topic/client-kyc.md) | [L62778](../../../ScriptDB/000_4_CreateSP.sql#L62778) | — | 0 / 0 | — |
| `CON_WF_OneRep_Notes_Topup` | [Shared / Other](by-topic/shared-other.md) | [L62938](../../../ScriptDB/000_4_CreateSP.sql#L62938) | — | 0 / 0 | — |
| `CON_WF_OneRep_OneClient` | [Client & KYC](by-topic/client-kyc.md) | [L63099](../../../ScriptDB/000_4_CreateSP.sql#L63099) | — | 1 / 7 | — |
| `CON_WF_OneRep_OneClient_Update` | [Client & KYC](by-topic/client-kyc.md) | [L63901](../../../ScriptDB/000_4_CreateSP.sql#L63901) | — | 0 / 7 | — |
| `CON_WF_OneRep_OneGIC` | [Fund & GIC](by-topic/fund-gic.md) | [L64801](../../../ScriptDB/000_4_CreateSP.sql#L64801) | — | 2 / 0 | — |
| `CON_WF_OneRep_OneMFAccount` | [Account & Plan](by-topic/account-plan.md) | [L64998](../../../ScriptDB/000_4_CreateSP.sql#L64998) | — | 2 / 3 | — |
| `CON_WF_OneRep_OneMFAccount_1` | [Account & Plan](by-topic/account-plan.md) | [L65221](../../../ScriptDB/000_4_CreateSP.sql#L65221) | — | 0 / 0 | — |
| `CON_WF_OneRep_OneMFAccount_Update` | [Account & Plan](by-topic/account-plan.md) | [L65434](../../../ScriptDB/000_4_CreateSP.sql#L65434) | — | 0 / 0 | — |
| `CON_WF_OneRep_OneMRSCash` | [Account & Plan](by-topic/account-plan.md) | [L65591](../../../ScriptDB/000_4_CreateSP.sql#L65591) | — | 2 / 1 | — |
| `CON_WF_OneRep_OneMRSCash_Update` | [Account & Plan](by-topic/account-plan.md) | [L65765](../../../ScriptDB/000_4_CreateSP.sql#L65765) | — | 0 / 0 | — |
| `CON_WF_OneRep_OneMRSGIC` | [Fund & GIC](by-topic/fund-gic.md) | [L65908](../../../ScriptDB/000_4_CreateSP.sql#L65908) | — | 2 / 0 | — |
| `CON_WF_OneRep_OnePlan` | [Account & Plan](by-topic/account-plan.md) | [L66089](../../../ScriptDB/000_4_CreateSP.sql#L66089) | — | 1 / 15 | — |
| `CON_WF_OneRep_OnePlan_1` | [Account & Plan](by-topic/account-plan.md) | [L66918](../../../ScriptDB/000_4_CreateSP.sql#L66918) | — | 1 / 9 | — |
| `CON_WF_OneRep_OnePlan_AddJoint` | [Account & Plan](by-topic/account-plan.md) | [L67712](../../../ScriptDB/000_4_CreateSP.sql#L67712) | — | 2 / 1 | — |
| `CON_WF_OneRep_OnePlan_Update` | [Account & Plan](by-topic/account-plan.md) | [L67773](../../../ScriptDB/000_4_CreateSP.sql#L67773) | — | 0 / 7 | — |
| `CON_WF_OneRep_OnePlanGIC` | [Fund & GIC](by-topic/fund-gic.md) | [L68566](../../../ScriptDB/000_4_CreateSP.sql#L68566) | — | 1 / 1 | — |
| `CON_WF_OneRep_Receivable_Topup` | [Shared / Other](by-topic/shared-other.md) | [L68602](../../../ScriptDB/000_4_CreateSP.sql#L68602) | — | 0 / 1 | — |
| `CON_WF_OneRep_ReceivableOne` | [Shared / Other](by-topic/shared-other.md) | [L68635](../../../ScriptDB/000_4_CreateSP.sql#L68635) | — | 2 / 0 | — |
| `CON_WF_OneRep_ServiceComm_Topup_1` | [Commission & Fee](by-topic/commission-fee.md) | [L68761](../../../ScriptDB/000_4_CreateSP.sql#L68761) | — | 0 / 0 | — |
| `CON_WF_OneRep_ServiceFeeComm_Topup` | [Commission & Fee](by-topic/commission-fee.md) | [L68784](../../../ScriptDB/000_4_CreateSP.sql#L68784) | — | 0 / 1 | — |
| `CON_WF_OneRep_ServiceFeeComm_Topup_2` | [Commission & Fee](by-topic/commission-fee.md) | [L68818](../../../ScriptDB/000_4_CreateSP.sql#L68818) | — | 0 / 1 | — |
| `CON_WF_OneRep_ServiceFeeOne` | [Commission & Fee](by-topic/commission-fee.md) | [L68843](../../../ScriptDB/000_4_CreateSP.sql#L68843) | — | 3 / 0 | — |
| `CON_WF_OneRep_Step_10_1` | [Shared / Other](by-topic/shared-other.md) | [L69004](../../../ScriptDB/000_4_CreateSP.sql#L69004) | — | 0 / 0 | — |
| `CON_WF_OneRep_Step_10_2` | [Shared / Other](by-topic/shared-other.md) | [L69022](../../../ScriptDB/000_4_CreateSP.sql#L69022) | — | 0 / 1 | — |
| `CON_WF_OneRep_Step_10_3` | [Shared / Other](by-topic/shared-other.md) | [L69045](../../../ScriptDB/000_4_CreateSP.sql#L69045) | — | 0 / 0 | — |
| `CON_WF_OneRep_Step_10_4` | [Shared / Other](by-topic/shared-other.md) | [L69063](../../../ScriptDB/000_4_CreateSP.sql#L69063) | — | 0 / 1 | — |
| `CON_WF_OneRep_Step_11_1` | [Shared / Other](by-topic/shared-other.md) | [L69088](../../../ScriptDB/000_4_CreateSP.sql#L69088) | — | 0 / 0 | — |
| `CON_WF_OneRep_Step_11_2` | [Shared / Other](by-topic/shared-other.md) | [L69106](../../../ScriptDB/000_4_CreateSP.sql#L69106) | — | 0 / 1 | — |
| `CON_WF_OneRep_Step1` | [Shared / Other](by-topic/shared-other.md) | [L69131](../../../ScriptDB/000_4_CreateSP.sql#L69131) | — | 0 / 0 | — |
| `CON_WF_OneRep_Step2` | [Shared / Other](by-topic/shared-other.md) | [L69176](../../../ScriptDB/000_4_CreateSP.sql#L69176) | — | 0 / 1 | — |
| `CON_WF_OneRep_Step3` | [Shared / Other](by-topic/shared-other.md) | [L69387](../../../ScriptDB/000_4_CreateSP.sql#L69387) | — | 0 / 0 | — |
| `CON_WF_OneRep_Step4` | [Shared / Other](by-topic/shared-other.md) | [L69415](../../../ScriptDB/000_4_CreateSP.sql#L69415) | — | 0 / 0 | — |
| `CON_WF_OneRep_Step5` | [Shared / Other](by-topic/shared-other.md) | [L69460](../../../ScriptDB/000_4_CreateSP.sql#L69460) | — | 0 / 1 | — |
| `CON_WF_OneRep_Step6` | [Shared / Other](by-topic/shared-other.md) | [L69513](../../../ScriptDB/000_4_CreateSP.sql#L69513) | — | 0 / 1 | — |
| `CON_WF_OneRep_Step6_1_Plan` | [Account & Plan](by-topic/account-plan.md) | [L69576](../../../ScriptDB/000_4_CreateSP.sql#L69576) | — | 0 / 1 | — |
| `CON_WF_OneRep_Step6_1_Plan_End` | [Account & Plan](by-topic/account-plan.md) | [L69616](../../../ScriptDB/000_4_CreateSP.sql#L69616) | — | 0 / 0 | — |
| `CON_WF_OneRep_Step6_2_Account_Start` | [Account & Plan](by-topic/account-plan.md) | [L69648](../../../ScriptDB/000_4_CreateSP.sql#L69648) | — | 0 / 0 | — |
| `CON_WF_OneRep_Step6_3_Account_Run` | [Account & Plan](by-topic/account-plan.md) | [L69669](../../../ScriptDB/000_4_CreateSP.sql#L69669) | — | 0 / 3 | — |
| `CON_WF_OneRep_Step6_5_Trx_Conversion` | [Trading & Orders](by-topic/trading-orders.md) | [L69730](../../../ScriptDB/000_4_CreateSP.sql#L69730) | — | 0 / 1 | — |
| `CON_WF_OneRep_Step6_6_SysPlan` | [Account & Plan](by-topic/account-plan.md) | [L69782](../../../ScriptDB/000_4_CreateSP.sql#L69782) | — | 0 / 1 | — |
| `CON_WF_OneRep_Step6_7_GIC` | [Fund & GIC](by-topic/fund-gic.md) | [L69831](../../../ScriptDB/000_4_CreateSP.sql#L69831) | — | 0 / 1 | — |
| `CON_WF_OneRep_Step7` | [Shared / Other](by-topic/shared-other.md) | [L69880](../../../ScriptDB/000_4_CreateSP.sql#L69880) | — | 0 / 3 | — |
| `CON_WF_OneRep_Step8` | [Shared / Other](by-topic/shared-other.md) | [L69905](../../../ScriptDB/000_4_CreateSP.sql#L69905) | — | 0 / 1 | — |
| `CON_WF_OneRep_Step9` | [Shared / Other](by-topic/shared-other.md) | [L69929](../../../ScriptDB/000_4_CreateSP.sql#L69929) | — | 0 / 1 | — |
| `CON_WF_OneRep_Undo` | [Shared / Other](by-topic/shared-other.md) | [L69953](../../../ScriptDB/000_4_CreateSP.sql#L69953) | — | 0 / 0 | — |
| `CON_WF_OneRep_WaitingComm_Topup` | [Commission & Fee](by-topic/commission-fee.md) | [L70076](../../../ScriptDB/000_4_CreateSP.sql#L70076) | — | 0 / 1 | — |
| `CON_WF_OneRep_WaitingCommissionOne` | [Commission & Fee](by-topic/commission-fee.md) | [L70112](../../../ScriptDB/000_4_CreateSP.sql#L70112) | — | 2 / 0 | — |
| `CON_WF_OneSpouseFix` | [Shared / Other](by-topic/shared-other.md) | [L70322](../../../ScriptDB/000_4_CreateSP.sql#L70322) | — | 0 / 1 | — |
| `CON_WF_Plan` | [Account & Plan](by-topic/account-plan.md) | [L70398](../../../ScriptDB/000_4_CreateSP.sql#L70398) | — | 2 / 9 | — |
| `CON_WF_Plan_One` | [Account & Plan](by-topic/account-plan.md) | [L71263](../../../ScriptDB/000_4_CreateSP.sql#L71263) | — | 1 / 9 | — |
| `CON_WF_Plan_Step1_Init` | [Account & Plan](by-topic/account-plan.md) | [L72042](../../../ScriptDB/000_4_CreateSP.sql#L72042) | — | 0 / 0 | — |
| `CON_WF_Plan_Step2` | [Account & Plan](by-topic/account-plan.md) | [L72059](../../../ScriptDB/000_4_CreateSP.sql#L72059) | — | 0 / 1 | — |
| `CON_WF_Plan_Topup` | [Account & Plan](by-topic/account-plan.md) | [L72089](../../../ScriptDB/000_4_CreateSP.sql#L72089) | — | 0 / 9 | — |
| `CON_WF_Plan_Topup_Step1` | [Account & Plan](by-topic/account-plan.md) | [L73072](../../../ScriptDB/000_4_CreateSP.sql#L73072) | — | 0 / 0 | — |
| `CON_WF_Plan_Topup_Step2` | [Account & Plan](by-topic/account-plan.md) | [L73100](../../../ScriptDB/000_4_CreateSP.sql#L73100) | — | 0 / 4 | — |
| `CON_WF_Plan_Topup_Step3` | [Account & Plan](by-topic/account-plan.md) | [L73916](../../../ScriptDB/000_4_CreateSP.sql#L73916) | — | 0 / 7 | — |
| `CON_WF_PlanBen` | [Account & Plan](by-topic/account-plan.md) | [L74795](../../../ScriptDB/000_4_CreateSP.sql#L74795) | — | 6 / 2 | — |
| `CON_WF_PlanBen_New` | [Account & Plan](by-topic/account-plan.md) | [L74881](../../../ScriptDB/000_4_CreateSP.sql#L74881) | — | 1 / 1 | — |
| `CON_WF_PlanBen_Topup_One` | [Account & Plan](by-topic/account-plan.md) | [L75055](../../../ScriptDB/000_4_CreateSP.sql#L75055) | — | 0 / 2 | — |
| `CON_WF_PlanBen_Update` | [Account & Plan](by-topic/account-plan.md) | [L75223](../../../ScriptDB/000_4_CreateSP.sql#L75223) | — | 2 / 2 | — |
| `CON_WF_PlanFix` | [Account & Plan](by-topic/account-plan.md) | [L75301](../../../ScriptDB/000_4_CreateSP.sql#L75301) | — | 0 / 9 | — |
| `CON_WF_PlanFixJointOld` | [Account & Plan](by-topic/account-plan.md) | [L76043](../../../ScriptDB/000_4_CreateSP.sql#L76043) | — | 0 / 1 | — |
| `CON_WF_PlanFixJointOld_2` | [Account & Plan](by-topic/account-plan.md) | [L76159](../../../ScriptDB/000_4_CreateSP.sql#L76159) | — | 0 / 2 | — |
| `CON_WF_PlanInTrust` | [Account & Plan](by-topic/account-plan.md) | [L76241](../../../ScriptDB/000_4_CreateSP.sql#L76241) | — | 7 / 0 | — |
| `CON_WF_PlanInTrust_Update` | [Account & Plan](by-topic/account-plan.md) | [L76357](../../../ScriptDB/000_4_CreateSP.sql#L76357) | — | 1 / 0 | — |
| `CON_WF_PlanKYCUpdateDetail_Fix_Step1` | [Account & Plan](by-topic/account-plan.md) | [L76477](../../../ScriptDB/000_4_CreateSP.sql#L76477) | — | 0 / 0 | — |
| `CON_WF_PlanKYCUpdateDetail_Fix_Step2` | [Account & Plan](by-topic/account-plan.md) | [L76501](../../../ScriptDB/000_4_CreateSP.sql#L76501) | — | 0 / 1 | — |
| `CON_WF_PlanServiceFee_Step1_Init` | [Commission & Fee](by-topic/commission-fee.md) | [L76535](../../../ScriptDB/000_4_CreateSP.sql#L76535) | — | 0 / 0 | — |
| `CON_WF_PlanServiceFee_Step2` | [Commission & Fee](by-topic/commission-fee.md) | [L76555](../../../ScriptDB/000_4_CreateSP.sql#L76555) | — | 0 / 0 | — |
| `CON_WF_PlanStatusChangeStr` | [Account & Plan](by-topic/account-plan.md) | [L76616](../../../ScriptDB/000_4_CreateSP.sql#L76616) | — | 0 / 0 | — |
| `CON_WF_Price` | [Shared / Other](by-topic/shared-other.md) | [L76652](../../../ScriptDB/000_4_CreateSP.sql#L76652) | — | 2 / 0 | — |
| `CON_WF_Price_All_Fix_ETF` | [Fund & GIC](by-topic/fund-gic.md) | [L76820](../../../ScriptDB/000_4_CreateSP.sql#L76820) | — | 0 / 1 | — |
| `CON_WF_Price_One` | [Shared / Other](by-topic/shared-other.md) | [L76843](../../../ScriptDB/000_4_CreateSP.sql#L76843) | — | 0 / 0 | — |
| `CON_WF_Price_One_Fix_ETF` | [Fund & GIC](by-topic/fund-gic.md) | [L77004](../../../ScriptDB/000_4_CreateSP.sql#L77004) | — | 1 / 1 | — |
| `CON_WF_Price_Topup_Step1` | [Shared / Other](by-topic/shared-other.md) | [L77035](../../../ScriptDB/000_4_CreateSP.sql#L77035) | — | 0 / 0 | — |
| `CON_WF_Price_Topup_Step2` | [Shared / Other](by-topic/shared-other.md) | [L77057](../../../ScriptDB/000_4_CreateSP.sql#L77057) | — | 0 / 0 | — |
| `CON_WF_Receivable_Step1_Init` | [Shared / Other](by-topic/shared-other.md) | [L77088](../../../ScriptDB/000_4_CreateSP.sql#L77088) | — | 0 / 0 | — |
| `CON_WF_Receivable_Step2` | [Shared / Other](by-topic/shared-other.md) | [L77110](../../../ScriptDB/000_4_CreateSP.sql#L77110) | — | 0 / 1 | — |
| `CON_WF_Receivable_Step3_Topup` | [Shared / Other](by-topic/shared-other.md) | [L77150](../../../ScriptDB/000_4_CreateSP.sql#L77150) | — | 0 / 1 | — |
| `CON_WF_ReceivableAll` | [Shared / Other](by-topic/shared-other.md) | [L77199](../../../ScriptDB/000_4_CreateSP.sql#L77199) | — | 0 / 1 | — |
| `CON_WF_ReceivableAll_Topup_Add` | [Shared / Other](by-topic/shared-other.md) | [L77235](../../../ScriptDB/000_4_CreateSP.sql#L77235) | — | 0 / 0 | — |
| `CON_WF_ReceivableAll_Topup_Update` | [Shared / Other](by-topic/shared-other.md) | [L77271](../../../ScriptDB/000_4_CreateSP.sql#L77271) | — | 0 / 0 | — |
| `CON_WF_ReceivableAllX` | [Shared / Other](by-topic/shared-other.md) | [L77307](../../../ScriptDB/000_4_CreateSP.sql#L77307) | — | 0 / 1 | — |
| `CON_WF_ReceivableByRepCode` | [Shared / Other](by-topic/shared-other.md) | [L77343](../../../ScriptDB/000_4_CreateSP.sql#L77343) | — | 0 / 1 | — |
| `CON_WF_ReceivableComm2PayableOne` | [Commission & Fee](by-topic/commission-fee.md) | [L77384](../../../ScriptDB/000_4_CreateSP.sql#L77384) | — | 2 / 0 | — |
| `CON_WF_ReceivableComm2PayableOneX` | [Commission & Fee](by-topic/commission-fee.md) | [L77578](../../../ScriptDB/000_4_CreateSP.sql#L77578) | — | 1 / 0 | — |
| `CON_WF_ReceivableOne` | [Shared / Other](by-topic/shared-other.md) | [L77771](../../../ScriptDB/000_4_CreateSP.sql#L77771) | — | 2 / 1 | — |
| `CON_WF_ReceivableOneX` | [Shared / Other](by-topic/shared-other.md) | [L77901](../../../ScriptDB/000_4_CreateSP.sql#L77901) | — | 2 / 1 | — |
| `CON_WF_RemoveInactiveClientNoPlan` | [Account & Plan](by-topic/account-plan.md) | [L78029](../../../ScriptDB/000_4_CreateSP.sql#L78029) | — | 0 / 0 | — |
| `CON_WF_Rep0` | [Shared / Other](by-topic/shared-other.md) | [L78083](../../../ScriptDB/000_4_CreateSP.sql#L78083) | — | 1 / 0 | — |
| `CON_WF_Rep1` | [Shared / Other](by-topic/shared-other.md) | [L78130](../../../ScriptDB/000_4_CreateSP.sql#L78130) | — | 2 / 3 | — |
| `CON_WF_RepAddressMissing` | [Shared / Other](by-topic/shared-other.md) | [L78549](../../../ScriptDB/000_4_CreateSP.sql#L78549) | — | 0 / 1 | — |
| `CON_WF_RepBankAll` | [Shared / Other](by-topic/shared-other.md) | [L78595](../../../ScriptDB/000_4_CreateSP.sql#L78595) | — | 0 / 2 | — |
| `CON_WF_RepBankAll_US_Fix` | [Shared / Other](by-topic/shared-other.md) | [L78715](../../../ScriptDB/000_4_CreateSP.sql#L78715) | — | 0 / 2 | — |
| `CON_WF_RepFileIDFix` | [Shared / Other](by-topic/shared-other.md) | [L78804](../../../ScriptDB/000_4_CreateSP.sql#L78804) | — | 0 / 0 | — |
| `CON_WF_RepInfo1` | [Shared / Other](by-topic/shared-other.md) | [L78840](../../../ScriptDB/000_4_CreateSP.sql#L78840) | — | 0 / 0 | — |
| `CON_WF_RepLicense` | [Shared / Other](by-topic/shared-other.md) | [L78876](../../../ScriptDB/000_4_CreateSP.sql#L78876) | — | 0 / 0 | — |
| `CON_WF_RepSetFileID` | [Fund & GIC](by-topic/fund-gic.md) | [L78952](../../../ScriptDB/000_4_CreateSP.sql#L78952) | — | 0 / 0 | — |
| `CON_WF_RepVerifyList` | [Shared / Other](by-topic/shared-other.md) | [L78991](../../../ScriptDB/000_4_CreateSP.sql#L78991) | — | 0 / 0 | — |
| `CON_WF_RRIFSetting` | [Account & Plan](by-topic/account-plan.md) | [L79020](../../../ScriptDB/000_4_CreateSP.sql#L79020) | — | 0 / 1 | — |
| `CON_WF_RRIFSetting_Topup_Add` | [Account & Plan](by-topic/account-plan.md) | [L79056](../../../ScriptDB/000_4_CreateSP.sql#L79056) | — | 0 / 1 | — |
| `CON_WF_RRIFSetting_Topup_Update` | [Account & Plan](by-topic/account-plan.md) | [L79086](../../../ScriptDB/000_4_CreateSP.sql#L79086) | — | 0 / 1 | — |
| `CON_WF_RRIFSettingOne` | [Account & Plan](by-topic/account-plan.md) | [L79116](../../../ScriptDB/000_4_CreateSP.sql#L79116) | — | 3 / 2 | — |
| `CON_WF_Service_Fix_GP_All` | [Shared / Other](by-topic/shared-other.md) | [L79373](../../../ScriptDB/000_4_CreateSP.sql#L79373) | — | 0 / 1 | — |
| `CON_WF_Service_Fix_GP_One` | [Shared / Other](by-topic/shared-other.md) | [L79399](../../../ScriptDB/000_4_CreateSP.sql#L79399) | — | 1 / 0 | — |
| `CON_WF_Service_Step1_Init` | [Shared / Other](by-topic/shared-other.md) | [L79508](../../../ScriptDB/000_4_CreateSP.sql#L79508) | — | 0 / 0 | — |
| `CON_WF_Service_Step2` | [Shared / Other](by-topic/shared-other.md) | [L79529](../../../ScriptDB/000_4_CreateSP.sql#L79529) | — | 0 / 1 | — |
| `CON_WF_ServiceFee1Pos` | [Commission & Fee](by-topic/commission-fee.md) | [L79563](../../../ScriptDB/000_4_CreateSP.sql#L79563) | — | 5 / 0 | — |
| `CON_WF_ServiceFee4FundAccount_Topup` | [Commission & Fee](by-topic/commission-fee.md) | [L79671](../../../ScriptDB/000_4_CreateSP.sql#L79671) | — | 0 / 1 | — |
| `CON_WF_ServiceFee4FundAccount1Item` | [Commission & Fee](by-topic/commission-fee.md) | [L79707](../../../ScriptDB/000_4_CreateSP.sql#L79707) | — | 1 / 0 | — |
| `CON_WF_ServiceFee4FundAccountAll` | [Commission & Fee](by-topic/commission-fee.md) | [L79775](../../../ScriptDB/000_4_CreateSP.sql#L79775) | — | 0 / 0 | — |
| `CON_WF_ServiceFeeAll` | [Commission & Fee](by-topic/commission-fee.md) | [L79804](../../../ScriptDB/000_4_CreateSP.sql#L79804) | — | 0 / 1 | — |
| `CON_WF_ServiceFeeAll_Topup` | [Commission & Fee](by-topic/commission-fee.md) | [L79842](../../../ScriptDB/000_4_CreateSP.sql#L79842) | — | 0 / 1 | — |
| `CON_WF_ServiceFeeAllPos_NotUsed` | [Commission & Fee](by-topic/commission-fee.md) | [L79883](../../../ScriptDB/000_4_CreateSP.sql#L79883) | — | 0 / 1 | — |
| `CON_WF_ServiceFeeFixOne` | [Commission & Fee](by-topic/commission-fee.md) | [L79915](../../../ScriptDB/000_4_CreateSP.sql#L79915) | — | 0 / 0 | — |
| `CON_WF_ServiceFeeOne` | [Commission & Fee](by-topic/commission-fee.md) | [L80087](../../../ScriptDB/000_4_CreateSP.sql#L80087) | — | 2 / 0 | — |
| `CON_WF_ServiceFeeOne_Topup` | [Commission & Fee](by-topic/commission-fee.md) | [L80399](../../../ScriptDB/000_4_CreateSP.sql#L80399) | — | 1 / 0 | — |
| `CON_WF_ServiceFeePos_One` | [Commission & Fee](by-topic/commission-fee.md) | [L80684](../../../ScriptDB/000_4_CreateSP.sql#L80684) | — | 0 / 0 | — |
| `CON_WF_SetManagerGrid` | [Shared / Other](by-topic/shared-other.md) | [L80766](../../../ScriptDB/000_4_CreateSP.sql#L80766) | — | 0 / 1 | — |
| `CON_WF_SetMaxIdentity_Client` | [Client & KYC](by-topic/client-kyc.md) | [L80822](../../../ScriptDB/000_4_CreateSP.sql#L80822) | — | 0 / 0 | — |
| `CON_WF_SetMaxIdentity_Plan` | [Account & Plan](by-topic/account-plan.md) | [L80855](../../../ScriptDB/000_4_CreateSP.sql#L80855) | — | 1 / 0 | — |
| `CON_WF_Start` | [Shared / Other](by-topic/shared-other.md) | [L80893](../../../ScriptDB/000_4_CreateSP.sql#L80893) | — | 0 / 10 | — |
| `CON_WF_Start_1_5` | [Shared / Other](by-topic/shared-other.md) | [L81082](../../../ScriptDB/000_4_CreateSP.sql#L81082) | — | 0 / 5 | — |
| `CON_WF_Start_6_8` | [Shared / Other](by-topic/shared-other.md) | [L81191](../../../ScriptDB/000_4_CreateSP.sql#L81191) | — | 0 / 4 | — |
| `CON_WF_Start_9_10` | [Shared / Other](by-topic/shared-other.md) | [L81278](../../../ScriptDB/000_4_CreateSP.sql#L81278) | — | 0 / 2 | — |
| `CON_WF_StatementStep1` | [Shared / Other](by-topic/shared-other.md) | [L81341](../../../ScriptDB/000_4_CreateSP.sql#L81341) | — | 0 / 0 | — |
| `CON_WF_Supplier` | [Shared / Other](by-topic/shared-other.md) | [L81384](../../../ScriptDB/000_4_CreateSP.sql#L81384) | — | 2 / 1 | — |
| `CON_WF_SysPlanFixBankingInfo` | [Account & Plan](by-topic/account-plan.md) | [L81447](../../../ScriptDB/000_4_CreateSP.sql#L81447) | — | 0 / 0 | — |
| `CON_WF_TCP_One` | [Shared / Other](by-topic/shared-other.md) | [L81531](../../../ScriptDB/000_4_CreateSP.sql#L81531) | — | 1 / 0 | — |
| `CON_WF_TCP_Step1_Init` | [Shared / Other](by-topic/shared-other.md) | [L81687](../../../ScriptDB/000_4_CreateSP.sql#L81687) | — | 0 / 0 | — |
| `CON_WF_TCP_Step2` | [Shared / Other](by-topic/shared-other.md) | [L81706](../../../ScriptDB/000_4_CreateSP.sql#L81706) | — | 0 / 1 | — |
| `CON_WF_TFSASuccesor_Step1_Init` | [Shared / Other](by-topic/shared-other.md) | [L81744](../../../ScriptDB/000_4_CreateSP.sql#L81744) | — | 0 / 0 | — |
| `CON_WF_TFSASuccessor_Step2` | [Shared / Other](by-topic/shared-other.md) | [L81765](../../../ScriptDB/000_4_CreateSP.sql#L81765) | — | 0 / 1 | — |
| `CON_WF_TFSASuccessorOnePlan` | [Account & Plan](by-topic/account-plan.md) | [L81796](../../../ScriptDB/000_4_CreateSP.sql#L81796) | — | 1 / 0 | — |
| `CON_WF_TransferScan_IN_OUT` | [Shared / Other](by-topic/shared-other.md) | [L81890](../../../ScriptDB/000_4_CreateSP.sql#L81890) | — | 0 / 1 | — |
| `CON_WF_Trust2PayableOne` | [Commission & Fee](by-topic/commission-fee.md) | [L81984](../../../ScriptDB/000_4_CreateSP.sql#L81984) | — | 1 / 0 | — |
| `CON_WF_TrustAccount_Step1` | [Account & Plan](by-topic/account-plan.md) | [L82160](../../../ScriptDB/000_4_CreateSP.sql#L82160) | — | 0 / 0 | — |
| `CON_WF_TrustAccount_Step1_Init` | [Account & Plan](by-topic/account-plan.md) | [L82179](../../../ScriptDB/000_4_CreateSP.sql#L82179) | — | 0 / 0 | — |
| `CON_WF_TrustAccount_Step2` | [Account & Plan](by-topic/account-plan.md) | [L82199](../../../ScriptDB/000_4_CreateSP.sql#L82199) | — | 0 / 1 | — |
| `CON_WF_TrustAccount_Step3` | [Account & Plan](by-topic/account-plan.md) | [L82227](../../../ScriptDB/000_4_CreateSP.sql#L82227) | — | 0 / 1 | — |
| `CON_WF_TrustAccountAll_AddOnly` | [Account & Plan](by-topic/account-plan.md) | [L82259](../../../ScriptDB/000_4_CreateSP.sql#L82259) | — | 0 / 1 | — |
| `CON_WF_TrustAccountAll_Dep` | [Account & Plan](by-topic/account-plan.md) | [L82295](../../../ScriptDB/000_4_CreateSP.sql#L82295) | — | 0 / 1 | — |
| `CON_WF_TrustAccountAll_Other` | [Account & Plan](by-topic/account-plan.md) | [L82330](../../../ScriptDB/000_4_CreateSP.sql#L82330) | — | 0 / 1 | — |
| `CON_WF_TrustAccountAll_Other_After` | [Account & Plan](by-topic/account-plan.md) | [L82365](../../../ScriptDB/000_4_CreateSP.sql#L82365) | — | 0 / 0 | — |
| `CON_WF_TrustAccountAll_UpdateOnly` | [Account & Plan](by-topic/account-plan.md) | [L82434](../../../ScriptDB/000_4_CreateSP.sql#L82434) | — | 0 / 0 | — |
| `CON_WF_TrustAccountOne_Dep` | [Account & Plan](by-topic/account-plan.md) | [L82458](../../../ScriptDB/000_4_CreateSP.sql#L82458) | — | 2 / 2 | — |
| `CON_WF_TrustAccountOne_Other` | [Account & Plan](by-topic/account-plan.md) | [L82764](../../../ScriptDB/000_4_CreateSP.sql#L82764) | — | 2 / 0 | — |
| `CON_WF_TrustAccountOne_Topup` | [Account & Plan](by-topic/account-plan.md) | [L83003](../../../ScriptDB/000_4_CreateSP.sql#L83003) | — | 1 / 0 | — |
| `CON_WF_TrustCalc1Plan` | [Account & Plan](by-topic/account-plan.md) | [L83243](../../../ScriptDB/000_4_CreateSP.sql#L83243) | — | 1 / 0 | — |
| `CON_WF_TrustCalcPlanAfter` | [Account & Plan](by-topic/account-plan.md) | [L83304](../../../ScriptDB/000_4_CreateSP.sql#L83304) | — | 0 / 1 | — |
| `CON_WF_TrustClientNameClearOldItems` | [Account & Plan](by-topic/account-plan.md) | [L83346](../../../ScriptDB/000_4_CreateSP.sql#L83346) | — | 0 / 0 | — |
| `CON_WF_Trx_Cash_Step1_Init` | [Account & Plan](by-topic/account-plan.md) | [L83392](../../../ScriptDB/000_4_CreateSP.sql#L83392) | — | 0 / 0 | — |
| `CON_WF_TrxComm2PayableOne` | [Commission & Fee](by-topic/commission-fee.md) | [L83413](../../../ScriptDB/000_4_CreateSP.sql#L83413) | — | 1 / 0 | — |
| `CON_WF_TrxConversion` | [Trading & Orders](by-topic/trading-orders.md) | [L83610](../../../ScriptDB/000_4_CreateSP.sql#L83610) | — | 0 / 1 | — |
| `CON_WF_TrxConversion_Step1_Init` | [Trading & Orders](by-topic/trading-orders.md) | [L83656](../../../ScriptDB/000_4_CreateSP.sql#L83656) | — | 0 / 0 | — |
| `CON_WF_TrxConversion_Step1_Init_Topup` | [Trading & Orders](by-topic/trading-orders.md) | [L83688](../../../ScriptDB/000_4_CreateSP.sql#L83688) | — | 0 / 0 | — |
| `CON_WF_TrxConversion_Step2` | [Trading & Orders](by-topic/trading-orders.md) | [L83720](../../../ScriptDB/000_4_CreateSP.sql#L83720) | — | 0 / 0 | — |
| `CON_WF_TrxConversion1Plan` | [Account & Plan](by-topic/account-plan.md) | [L83752](../../../ScriptDB/000_4_CreateSP.sql#L83752) | — | 5 / 1 | — |
| `CON_WF_TrxConversionOne` | [Trading & Orders](by-topic/trading-orders.md) | [L83805](../../../ScriptDB/000_4_CreateSP.sql#L83805) | — | 2 / 0 | — |
| `CON_WF_TrxFeeInfo` | [Commission & Fee](by-topic/commission-fee.md) | [L83936](../../../ScriptDB/000_4_CreateSP.sql#L83936) | — | 0 / 0 | — |
| `CON_WF_UpdateReviewDate` | [Shared / Other](by-topic/shared-other.md) | [L83957](../../../ScriptDB/000_4_CreateSP.sql#L83957) | — | 0 / 0 | — |
| `CON_WF_User` | [Shared / Other](by-topic/shared-other.md) | [L84001](../../../ScriptDB/000_4_CreateSP.sql#L84001) | — | 0 / 3 | — |
| `CON_WF_UserAll` | [Shared / Other](by-topic/shared-other.md) | [L84189](../../../ScriptDB/000_4_CreateSP.sql#L84189) | — | 0 / 4 | — |
| `CON_WF_UserBankOne` | [Shared / Other](by-topic/shared-other.md) | [L84724](../../../ScriptDB/000_4_CreateSP.sql#L84724) | — | 0 / 2 | — |
| `CON_WF_UserStep1` | [Shared / Other](by-topic/shared-other.md) | [L84878](../../../ScriptDB/000_4_CreateSP.sql#L84878) | — | 0 / 2 | — |
| `CON_WF_UserStep1_OneUser` | [Shared / Other](by-topic/shared-other.md) | [L85089](../../../ScriptDB/000_4_CreateSP.sql#L85089) | — | 0 / 2 | — |
| `CON_WF_UserStep2` | [Shared / Other](by-topic/shared-other.md) | [L85258](../../../ScriptDB/000_4_CreateSP.sql#L85258) | — | 0 / 6 | — |
| `CON_WF_UserStep2_One` | [Shared / Other](by-topic/shared-other.md) | [L85529](../../../ScriptDB/000_4_CreateSP.sql#L85529) | — | 0 / 4 | — |
| `CON_WF_UserStep3` | [Shared / Other](by-topic/shared-other.md) | [L85721](../../../ScriptDB/000_4_CreateSP.sql#L85721) | — | 0 / 6 | — |
| `CON_WF_WaitingCommission_Missing` | [Commission & Fee](by-topic/commission-fee.md) | [L86100](../../../ScriptDB/000_4_CreateSP.sql#L86100) | — | 0 / 1 | — |
| `CON_WF_WaitingCommission_Step1_Init` | [Commission & Fee](by-topic/commission-fee.md) | [L86139](../../../ScriptDB/000_4_CreateSP.sql#L86139) | — | 0 / 0 | — |
| `CON_WF_WaitingCommission_Step2` | [Commission & Fee](by-topic/commission-fee.md) | [L86159](../../../ScriptDB/000_4_CreateSP.sql#L86159) | — | 0 / 1 | — |
| `CON_WF_WaitingCommissionAll` | [Commission & Fee](by-topic/commission-fee.md) | [L86192](../../../ScriptDB/000_4_CreateSP.sql#L86192) | — | 0 / 1 | — |
| `CON_WF_WaitingCommissionAll_Topup_Add` | [Commission & Fee](by-topic/commission-fee.md) | [L86229](../../../ScriptDB/000_4_CreateSP.sql#L86229) | — | 0 / 1 | — |
| `CON_WF_WaitingCommissionAll_Topup_Update` | [Commission & Fee](by-topic/commission-fee.md) | [L86268](../../../ScriptDB/000_4_CreateSP.sql#L86268) | — | 0 / 1 | — |
| `CON_WF_WaitingCommissionOne` | [Commission & Fee](by-topic/commission-fee.md) | [L86307](../../../ScriptDB/000_4_CreateSP.sql#L86307) | — | 2 / 0 | — |
| `CON_WF_WaitingCommissionOne_Missing` | [Commission & Fee](by-topic/commission-fee.md) | [L86688](../../../ScriptDB/000_4_CreateSP.sql#L86688) | — | 1 / 0 | — |
| `CON_WF_WaitingCommissionOne_Topup` | [Commission & Fee](by-topic/commission-fee.md) | [L86894](../../../ScriptDB/000_4_CreateSP.sql#L86894) | — | 1 / 0 | — |
| `CON_WF_WaitingCommissionOne_Topup_Update` | [Commission & Fee](by-topic/commission-fee.md) | [L87276](../../../ScriptDB/000_4_CreateSP.sql#L87276) | — | 1 / 0 | — |
| `CON_WF_WebClient` | [Client & KYC](by-topic/client-kyc.md) | [L87374](../../../ScriptDB/000_4_CreateSP.sql#L87374) | — | 0 / 0 | — |
| `CON_WF_XRate` | [Shared / Other](by-topic/shared-other.md) | [L87410](../../../ScriptDB/000_4_CreateSP.sql#L87410) | — | 0 / 0 | — |
| `CON_WF_YOBHistory` | [Shared / Other](by-topic/shared-other.md) | [L87429](../../../ScriptDB/000_4_CreateSP.sql#L87429) | — | 0 / 1 | — |
| `CON_WFront_Client` | [Client & KYC](by-topic/client-kyc.md) | [L87478](../../../ScriptDB/000_4_CreateSP.sql#L87478) | — | 0 / 6 | — |
| `CON_WFront_FundAccount` | [Fund & GIC](by-topic/fund-gic.md) | [L88170](../../../ScriptDB/000_4_CreateSP.sql#L88170) | — | 1 / 1 | — |
| `CON_WFront_FundTrx` | [Fund & GIC](by-topic/fund-gic.md) | [L88377](../../../ScriptDB/000_4_CreateSP.sql#L88377) | — | 1 / 0 | — |
| `CON_WFront_Plan` | [Account & Plan](by-topic/account-plan.md) | [L88795](../../../ScriptDB/000_4_CreateSP.sql#L88795) | — | 1 / 5 | — |
| `CON_WHS_1Client` | [Client & KYC](by-topic/client-kyc.md) | [L89316](../../../ScriptDB/000_4_CreateSP.sql#L89316) | — | 1 / 2 | — |
| `CON_WHS_1Prospect` | [Shared / Other](by-topic/shared-other.md) | [L89508](../../../ScriptDB/000_4_CreateSP.sql#L89508) | — | 1 / 3 | — |
| `CON_WHS_All` | [Shared / Other](by-topic/shared-other.md) | [L89699](../../../ScriptDB/000_4_CreateSP.sql#L89699) | — | 0 / 1 | — |
| `CON_WHS_All2` | [Shared / Other](by-topic/shared-other.md) | [L89767](../../../ScriptDB/000_4_CreateSP.sql#L89767) | — | 0 / 1 | — |
| `CON_WHS_All3` | [Shared / Other](by-topic/shared-other.md) | [L89819](../../../ScriptDB/000_4_CreateSP.sql#L89819) | — | 0 / 1 | — |
| `CON_WHS_Client` | [Client & KYC](by-topic/client-kyc.md) | [L89878](../../../ScriptDB/000_4_CreateSP.sql#L89878) | — | 0 / 1 | — |
| `CON_WHS_Import1` | [Shared / Other](by-topic/shared-other.md) | [L89919](../../../ScriptDB/000_4_CreateSP.sql#L89919) | — | 0 / 1 | — |
| `CON_WHS_ImportCash` | [Account & Plan](by-topic/account-plan.md) | [L90187](../../../ScriptDB/000_4_CreateSP.sql#L90187) | — | 0 / 1 | — |
| `CON_WHS_ImportCashOne` | [Account & Plan](by-topic/account-plan.md) | [L90217](../../../ScriptDB/000_4_CreateSP.sql#L90217) | — | 1 / 0 | — |
| `CON_WHS_LoanStep1` | [Shared / Other](by-topic/shared-other.md) | [L90318](../../../ScriptDB/000_4_CreateSP.sql#L90318) | — | 0 / 0 | — |
| `CON_WHS_Prospect` | [Shared / Other](by-topic/shared-other.md) | [L90395](../../../ScriptDB/000_4_CreateSP.sql#L90395) | — | 0 / 1 | — |
| `CON_WHS_Record` | [Shared / Other](by-topic/shared-other.md) | [L90433](../../../ScriptDB/000_4_CreateSP.sql#L90433) | — | 1 / 3 | — |
| `CON_WHS_Record2` | [Shared / Other](by-topic/shared-other.md) | [L90725](../../../ScriptDB/000_4_CreateSP.sql#L90725) | — | 1 / 1 | — |
| `CON_WHS_Record3` | [Shared / Other](by-topic/shared-other.md) | [L90966](../../../ScriptDB/000_4_CreateSP.sql#L90966) | — | 1 / 2 | — |
| `CON_WS_Add1AttachmentFile` | [Documents & PDF](by-topic/documents-pdf.md) | [L91217](../../../ScriptDB/000_4_CreateSP.sql#L91217) | — | 0 / 0 | — |
| `CON_WS_AttachList` | [Documents & PDF](by-topic/documents-pdf.md) | [L91262](../../../ScriptDB/000_4_CreateSP.sql#L91262) | — | 0 / 0 | — |
| `ConvertAdvisorFee_7908` | [Commission & Fee](by-topic/commission-fee.md) | [L91290](../../../ScriptDB/000_4_CreateSP.sql#L91290) | — | 0 / 0 | — |
| `CRA_ListTransfer` | [Tax & Year-End](by-topic/tax-yearend.md) | [L91337](../../../ScriptDB/000_4_CreateSP.sql#L91337) | — | 0 / 0 | — |
| `CreateSynonymsForTargetDatabase` | [Shared / Other](by-topic/shared-other.md) | [L91369](../../../ScriptDB/000_4_CreateSP.sql#L91369) | — | 0 / 0 | — |
| `CreatetScriptDBCopy` | [Shared / Other](by-topic/shared-other.md) | [L91459](../../../ScriptDB/000_4_CreateSP.sql#L91459) | — | 0 / 0 | — |
| `DashBoardAssetPlanSumCalc1Rep` | [Account & Plan](by-topic/account-plan.md) | [L91520](../../../ScriptDB/000_4_CreateSP.sql#L91520) | — | 0 / 0 | — |
| `DB_TableList` | [Shared / Other](by-topic/shared-other.md) | [L91557](../../../ScriptDB/000_4_CreateSP.sql#L91557) | — | 0 / 0 | — |
| `Dealer_TMP_1` | [Shared / Other](by-topic/shared-other.md) | [L91598](../../../ScriptDB/000_4_CreateSP.sql#L91598) | — | 0 / 0 | — |
| `DI_AccountActiveNotApprovedList` | [Account & Plan](by-topic/account-plan.md) | [L91685](../../../ScriptDB/000_4_CreateSP.sql#L91685) | — | 0 / 1 | — |
| `DI_AccountActivePositionInactive` | [Account & Plan](by-topic/account-plan.md) | [L92015](../../../ScriptDB/000_4_CreateSP.sql#L92015) | — | 0 / 0 | — |
| `DI_AccountActiveZeroPlanInactiveSet` | [Account & Plan](by-topic/account-plan.md) | [L92068](../../../ScriptDB/000_4_CreateSP.sql#L92068) | — | 0 / 0 | — |
| `DI_AccountActiveZeroUnit` | [Account & Plan](by-topic/account-plan.md) | [L92101](../../../ScriptDB/000_4_CreateSP.sql#L92101) | — | 0 / 0 | — |
| `DI_AccountActiveZeroUnitInactivate` | [Account & Plan](by-topic/account-plan.md) | [L92168](../../../ScriptDB/000_4_CreateSP.sql#L92168) | — | 0 / 5 | — |
| `DI_AccountActiveZeroUnitList` | [Account & Plan](by-topic/account-plan.md) | [L92300](../../../ScriptDB/000_4_CreateSP.sql#L92300) | — | 0 / 1 | — |
| `DI_AccountActiveZeroUnitList2` | [Account & Plan](by-topic/account-plan.md) | [L92654](../../../ScriptDB/000_4_CreateSP.sql#L92654) | — | 0 / 0 | — |
| `DI_AccountActiveZeroUnitListSelUpdate` | [Account & Plan](by-topic/account-plan.md) | [L92850](../../../ScriptDB/000_4_CreateSP.sql#L92850) | — | 0 / 0 | — |
| `DI_AccountAssignUnitWithTrxUnit` | [Account & Plan](by-topic/account-plan.md) | [L92896](../../../ScriptDB/000_4_CreateSP.sql#L92896) | — | 0 / 0 | — |
| `DI_AccountAvgCostVSTrxAvgCost` | [Account & Plan](by-topic/account-plan.md) | [L92955](../../../ScriptDB/000_4_CreateSP.sql#L92955) | — | 0 / 0 | — |
| `DI_AccountAvgCostVSTrxAvgCost_Refresh` | [Account & Plan](by-topic/account-plan.md) | [L93001](../../../ScriptDB/000_4_CreateSP.sql#L93001) | — | 0 / 0 | — |
| `DI_AccountAvgCostVSTrxAvgCost_Set2LastTrx` | [Account & Plan](by-topic/account-plan.md) | [L93055](../../../ScriptDB/000_4_CreateSP.sql#L93055) | — | 0 / 0 | — |
| `DI_AccountAvgCostVSTrxAvgCostList` | [Account & Plan](by-topic/account-plan.md) | [L93100](../../../ScriptDB/000_4_CreateSP.sql#L93100) | — | 0 / 0 | — |
| `DI_AccountDuplication` | [Account & Plan](by-topic/account-plan.md) | [L93327](../../../ScriptDB/000_4_CreateSP.sql#L93327) | — | 0 / 0 | — |
| `DI_AccountDuplicationLeadingZero` | [Account & Plan](by-topic/account-plan.md) | [L93372](../../../ScriptDB/000_4_CreateSP.sql#L93372) | — | 0 / 0 | — |
| `DI_AccountDuplicationList` | [Account & Plan](by-topic/account-plan.md) | [L93427](../../../ScriptDB/000_4_CreateSP.sql#L93427) | — | 0 / 1 | — |
| `DI_AccountFirstTrxIssue` | [Account & Plan](by-topic/account-plan.md) | [L94063](../../../ScriptDB/000_4_CreateSP.sql#L94063) | — | 0 / 0 | — |
| `DI_AccountFirstTrxIssueList` | [Account & Plan](by-topic/account-plan.md) | [L94110](../../../ScriptDB/000_4_CreateSP.sql#L94110) | — | 0 / 0 | — |
| `DI_AccountFixSequence` | [Account & Plan](by-topic/account-plan.md) | [L94192](../../../ScriptDB/000_4_CreateSP.sql#L94192) | — | 0 / 1 | — |
| `DI_AccountIDWithZeroes2NoZero` | [Account & Plan](by-topic/account-plan.md) | [L94226](../../../ScriptDB/000_4_CreateSP.sql#L94226) | — | 0 / 0 | — |
| `DI_AccountInactiveNoEndDate` | [Account & Plan](by-topic/account-plan.md) | [L94315](../../../ScriptDB/000_4_CreateSP.sql#L94315) | — | 0 / 0 | — |
| `DI_AccountInActiveNoEndDateList` | [Account & Plan](by-topic/account-plan.md) | [L94343](../../../ScriptDB/000_4_CreateSP.sql#L94343) | — | 0 / 0 | — |
| `DI_AccountInactiveNotZero` | [Account & Plan](by-topic/account-plan.md) | [L94481](../../../ScriptDB/000_4_CreateSP.sql#L94481) | — | 0 / 0 | — |
| `DI_AccountInactiveWithUnit` | [Account & Plan](by-topic/account-plan.md) | [L94520](../../../ScriptDB/000_4_CreateSP.sql#L94520) | — | 0 / 0 | — |
| `DI_AccountInActiveWithUnitList` | [Account & Plan](by-topic/account-plan.md) | [L94556](../../../ScriptDB/000_4_CreateSP.sql#L94556) | — | 0 / 1 | — |
| `DI_AccountInactiveWithUnitTrx` | [Account & Plan](by-topic/account-plan.md) | [L94849](../../../ScriptDB/000_4_CreateSP.sql#L94849) | — | 0 / 0 | — |
| `DI_AccountInActiveWithUnitTrx_RemoveTrx` | [Account & Plan](by-topic/account-plan.md) | [L94932](../../../ScriptDB/000_4_CreateSP.sql#L94932) | — | 0 / 0 | — |
| `DI_AccountInActiveWithUnitTrxList` | [Account & Plan](by-topic/account-plan.md) | [L94970](../../../ScriptDB/000_4_CreateSP.sql#L94970) | — | 0 / 0 | — |
| `DI_AccountNoActivitySince` | [Account & Plan](by-topic/account-plan.md) | [L95189](../../../ScriptDB/000_4_CreateSP.sql#L95189) | — | 0 / 0 | — |
| `DI_AccountNoPosition` | [Account & Plan](by-topic/account-plan.md) | [L95243](../../../ScriptDB/000_4_CreateSP.sql#L95243) | — | 0 / 0 | — |
| `DI_AccountNoTrxList` | [Account & Plan](by-topic/account-plan.md) | [L95295](../../../ScriptDB/000_4_CreateSP.sql#L95295) | — | 0 / 0 | — |
| `DI_AccountSetAverageCost` | [Account & Plan](by-topic/account-plan.md) | [L95331](../../../ScriptDB/000_4_CreateSP.sql#L95331) | — | 0 / 0 | — |
| `DI_AccountTrxOutOfSequence` | [Account & Plan](by-topic/account-plan.md) | [L95373](../../../ScriptDB/000_4_CreateSP.sql#L95373) | — | 0 / 0 | — |
| `DI_AccountTrxOutOfSequence_SetCalcUnit` | [Account & Plan](by-topic/account-plan.md) | [L95430](../../../ScriptDB/000_4_CreateSP.sql#L95430) | — | 0 / 2 | — |
| `DI_AccountTrxOutOfSequenceList` | [Account & Plan](by-topic/account-plan.md) | [L95463](../../../ScriptDB/000_4_CreateSP.sql#L95463) | — | 0 / 0 | — |
| `DI_AccountUnitVSTrxUnit` | [Account & Plan](by-topic/account-plan.md) | [L95916](../../../ScriptDB/000_4_CreateSP.sql#L95916) | — | 0 / 0 | — |
| `DI_AccountUnitVSTrxUnitList` | [Account & Plan](by-topic/account-plan.md) | [L95974](../../../ScriptDB/000_4_CreateSP.sql#L95974) | — | 0 / 0 | — |
| `DI_AccountZeroSetInactive` | [Account & Plan](by-topic/account-plan.md) | [L96354](../../../ScriptDB/000_4_CreateSP.sql#L96354) | — | 0 / 0 | — |
| `DI_AccXTransfInList` | [Shared / Other](by-topic/shared-other.md) | [L96406](../../../ScriptDB/000_4_CreateSP.sql#L96406) | — | 0 / 0 | — |
| `DI_AccXTransfInScan` | [Shared / Other](by-topic/shared-other.md) | [L96543](../../../ScriptDB/000_4_CreateSP.sql#L96543) | — | 0 / 0 | — |
| `DI_ActiveCashAccountNoActivitySince` | [Account & Plan](by-topic/account-plan.md) | [L96593](../../../ScriptDB/000_4_CreateSP.sql#L96593) | — | 0 / 0 | — |
| `DI_ActiveClientNoBankAccount` | [Account & Plan](by-topic/account-plan.md) | [L96737](../../../ScriptDB/000_4_CreateSP.sql#L96737) | — | 0 / 0 | — |
| `DI_AssignDocAll` | [Documents & PDF](by-topic/documents-pdf.md) | [L96754](../../../ScriptDB/000_4_CreateSP.sql#L96754) | — | 0 / 1 | — |
| `DI_B2B_DuplicateTrx_Remove` | [Trading & Orders](by-topic/trading-orders.md) | [L96793](../../../ScriptDB/000_4_CreateSP.sql#L96793) | — | 0 / 0 | — |
| `DI_B2B_ETF_NotIN_FG` | [Fund & GIC](by-topic/fund-gic.md) | [L96844](../../../ScriptDB/000_4_CreateSP.sql#L96844) | — | 0 / 0 | — |
| `DI_BankBranchDefDuplication` | [Shared / Other](by-topic/shared-other.md) | [L96863](../../../ScriptDB/000_4_CreateSP.sql#L96863) | — | 0 / 0 | — |
| `DI_CalcAverageCostFromAccountLevel` | [Account & Plan](by-topic/account-plan.md) | [L96921](../../../ScriptDB/000_4_CreateSP.sql#L96921) | — | 2 / 0 | — |
| `DI_CalcAverageCostFromPlanLevel` | [Account & Plan](by-topic/account-plan.md) | [L97015](../../../ScriptDB/000_4_CreateSP.sql#L97015) | — | 1 / 1 | — |
| `DI_CalcAverageCostFromStart_ETF_2262` | [Fund & GIC](by-topic/fund-gic.md) | [L97051](../../../ScriptDB/000_4_CreateSP.sql#L97051) | — | 0 / 0 | — |
| `DI_CalcAverageCostFromStart_ETF_B2B_1` | [Fund & GIC](by-topic/fund-gic.md) | [L97170](../../../ScriptDB/000_4_CreateSP.sql#L97170) | — | 2 / 0 | — |
| `DI_CalcAverageCostFromStart_ETF_B2B_All` | [Fund & GIC](by-topic/fund-gic.md) | [L97276](../../../ScriptDB/000_4_CreateSP.sql#L97276) | — | 0 / 1 | — |
| `DI_CalcAverageCostFromStart_ETF_B2B_Plan` | [Fund & GIC](by-topic/fund-gic.md) | [L97304](../../../ScriptDB/000_4_CreateSP.sql#L97304) | — | 0 / 1 | — |
| `DI_CalcShareBalanceAveFromAccountLevelAll` | [Account & Plan](by-topic/account-plan.md) | [L97329](../../../ScriptDB/000_4_CreateSP.sql#L97329) | — | 0 / 2 | — |
| `DI_CalcShareBalanceFromAccountLevel` | [Account & Plan](by-topic/account-plan.md) | [L97360](../../../ScriptDB/000_4_CreateSP.sql#L97360) | — | 1 / 0 | — |
| `DI_CannexFileReport_Discrepancies` | [Shared / Other](by-topic/shared-other.md) | [L97455](../../../ScriptDB/000_4_CreateSP.sql#L97455) | — | 0 / 1 | — |
| `DI_CannexFileReport_DiscrepanciesOneFile` | [Shared / Other](by-topic/shared-other.md) | [L97688](../../../ScriptDB/000_4_CreateSP.sql#L97688) | — | 2 / 0 | — |
| `DI_CannexFileReport_NotIncluded` | [Shared / Other](by-topic/shared-other.md) | [L97842](../../../ScriptDB/000_4_CreateSP.sql#L97842) | — | 0 / 1 | — |
| `DI_CashAccountDuplication` | [Account & Plan](by-topic/account-plan.md) | [L98085](../../../ScriptDB/000_4_CreateSP.sql#L98085) | — | 0 / 0 | — |
| `DI_CashAccountInactiveWithUnit` | [Account & Plan](by-topic/account-plan.md) | [L98121](../../../ScriptDB/000_4_CreateSP.sql#L98121) | — | 0 / 0 | — |
| `DI_CashAccountTrxOutOfSequence` | [Account & Plan](by-topic/account-plan.md) | [L98154](../../../ScriptDB/000_4_CreateSP.sql#L98154) | — | 0 / 0 | — |
| `DI_CashAccountTrxOutOfSequenceForce2CalcVal` | [Account & Plan](by-topic/account-plan.md) | [L98216](../../../ScriptDB/000_4_CreateSP.sql#L98216) | — | 0 / 1 | — |
| `DI_CashAccountTrxOutOfSequenceList` | [Account & Plan](by-topic/account-plan.md) | [L98248](../../../ScriptDB/000_4_CreateSP.sql#L98248) | — | 0 / 0 | — |
| `DI_CashCheckOutOfSequence` | [Account & Plan](by-topic/account-plan.md) | [L98474](../../../ScriptDB/000_4_CreateSP.sql#L98474) | — | 0 / 0 | — |
| `DI_CashZeroTrxNotZeroActive` | [Account & Plan](by-topic/account-plan.md) | [L98566](../../../ScriptDB/000_4_CreateSP.sql#L98566) | — | 0 / 0 | — |
| `DI_ChangeKYCIncomeDef` | [Client & KYC](by-topic/client-kyc.md) | [L98635](../../../ScriptDB/000_4_CreateSP.sql#L98635) | — | 0 / 0 | — |
| `DI_CheckAccountVSTrxUnit` | [Account & Plan](by-topic/account-plan.md) | [L98662](../../../ScriptDB/000_4_CreateSP.sql#L98662) | — | 0 / 0 | — |
| `DI_CheckCustomerPlanTB` | [Account & Plan](by-topic/account-plan.md) | [L98791](../../../ScriptDB/000_4_CreateSP.sql#L98791) | — | 0 / 0 | — |
| `DI_CheckFundRiskVsObj` | [Fund & GIC](by-topic/fund-gic.md) | [L98826](../../../ScriptDB/000_4_CreateSP.sql#L98826) | — | 0 / 0 | — |
| `DI_CheckOutOfSequence` | [Shared / Other](by-topic/shared-other.md) | [L98867](../../../ScriptDB/000_4_CreateSP.sql#L98867) | — | 0 / 0 | — |
| `DI_CheckPlanRepFSFile` | [Account & Plan](by-topic/account-plan.md) | [L99000](../../../ScriptDB/000_4_CreateSP.sql#L99000) | — | 0 / 0 | — |
| `DI_Client250K` | [Client & KYC](by-topic/client-kyc.md) | [L99082](../../../ScriptDB/000_4_CreateSP.sql#L99082) | — | 0 / 0 | — |
| `DI_ClientActiveAllPlanInactive` | [Account & Plan](by-topic/account-plan.md) | [L99227](../../../ScriptDB/000_4_CreateSP.sql#L99227) | — | 0 / 0 | — |
| `DI_ClientAssetCalc` | [Client & KYC](by-topic/client-kyc.md) | [L99284](../../../ScriptDB/000_4_CreateSP.sql#L99284) | — | 0 / 0 | — |
| `DI_ClientAssetList` | [Client & KYC](by-topic/client-kyc.md) | [L99334](../../../ScriptDB/000_4_CreateSP.sql#L99334) | — | 0 / 0 | — |
| `DI_ClientBankAccountDuplication` | [Account & Plan](by-topic/account-plan.md) | [L99372](../../../ScriptDB/000_4_CreateSP.sql#L99372) | — | 0 / 0 | — |
| `DI_ClientDuplication` | [Client & KYC](by-topic/client-kyc.md) | [L99483](../../../ScriptDB/000_4_CreateSP.sql#L99483) | — | 0 / 0 | — |
| `DI_ClientDuplicationList` | [Client & KYC](by-topic/client-kyc.md) | [L99521](../../../ScriptDB/000_4_CreateSP.sql#L99521) | — | 0 / 0 | — |
| `DI_ClientExtraInfoDuplication` | [Client & KYC](by-topic/client-kyc.md) | [L99668](../../../ScriptDB/000_4_CreateSP.sql#L99668) | — | 0 / 0 | — |
| `DI_ClientFinInfoDuplication` | [Client & KYC](by-topic/client-kyc.md) | [L99692](../../../ScriptDB/000_4_CreateSP.sql#L99692) | — | 0 / 0 | — |
| `DI_ClientFreezeAlltems` | [Client & KYC](by-topic/client-kyc.md) | [L99747](../../../ScriptDB/000_4_CreateSP.sql#L99747) | — | 0 / 4 | — |
| `DI_ClientFreezeTaggedItems` | [Client & KYC](by-topic/client-kyc.md) | [L99794](../../../ScriptDB/000_4_CreateSP.sql#L99794) | 1 / 1 file | 0 / 1 | [Customer.cs:4740](../../../UBClasses/Customer.cs#L4740) |
| `DI_ClientFrozenAsOf` | [Client & KYC](by-topic/client-kyc.md) | [L99841](../../../ScriptDB/000_4_CreateSP.sql#L99841) | — | 0 / 0 | — |
| `DI_ClientInactiveAccountActive` | [Account & Plan](by-topic/account-plan.md) | [L99879](../../../ScriptDB/000_4_CreateSP.sql#L99879) | — | 0 / 1 | — |
| `DI_ClientInactiveNotZero` | [Client & KYC](by-topic/client-kyc.md) | [L100003](../../../ScriptDB/000_4_CreateSP.sql#L100003) | — | 0 / 0 | — |
| `DI_ClientKYCExpiredList` | [Client & KYC](by-topic/client-kyc.md) | [L100043](../../../ScriptDB/000_4_CreateSP.sql#L100043) | — | 1 / 0 | — |
| `DI_ClientKYCExpiredSelUpdate` | [Client & KYC](by-topic/client-kyc.md) | [L100444](../../../ScriptDB/000_4_CreateSP.sql#L100444) | — | 0 / 0 | — |
| `DI_ClientMultipleReps` | [Client & KYC](by-topic/client-kyc.md) | [L100491](../../../ScriptDB/000_4_CreateSP.sql#L100491) | — | 0 / 0 | — |
| `DI_ClientNameDiffBySIN` | [Client & KYC](by-topic/client-kyc.md) | [L100557](../../../ScriptDB/000_4_CreateSP.sql#L100557) | — | 0 / 0 | — |
| `DI_ClientNoKYCList` | [Client & KYC](by-topic/client-kyc.md) | [L100595](../../../ScriptDB/000_4_CreateSP.sql#L100595) | — | 0 / 0 | — |
| `DI_ClientNoKYCSelUpdate` | [Client & KYC](by-topic/client-kyc.md) | [L100789](../../../ScriptDB/000_4_CreateSP.sql#L100789) | — | 0 / 0 | — |
| `DI_ClientNoPlan` | [Account & Plan](by-topic/account-plan.md) | [L100837](../../../ScriptDB/000_4_CreateSP.sql#L100837) | — | 0 / 0 | — |
| `DI_ClientNotZeroMKV` | [Client & KYC](by-topic/client-kyc.md) | [L100889](../../../ScriptDB/000_4_CreateSP.sql#L100889) | — | 0 / 0 | — |
| `DI_ClientOPENNoFATCA` | [Client & KYC](by-topic/client-kyc.md) | [L100938](../../../ScriptDB/000_4_CreateSP.sql#L100938) | — | 0 / 1 | — |
| `DI_ClientReturnMailAsOf` | [Client & KYC](by-topic/client-kyc.md) | [L101201](../../../ScriptDB/000_4_CreateSP.sql#L101201) | — | 0 / 0 | — |
| `DI_ClientZeroMKV` | [Client & KYC](by-topic/client-kyc.md) | [L101239](../../../ScriptDB/000_4_CreateSP.sql#L101239) | — | 0 / 1 | — |
| `DI_ClientZeroMKVInactivate` | [Client & KYC](by-topic/client-kyc.md) | [L101440](../../../ScriptDB/000_4_CreateSP.sql#L101440) | 1 / 1 file | 0 / 1 | [Customer.cs:4697](../../../UBClasses/Customer.cs#L4697) |
| `DI_ClientZeroMKVSelUpdate` | [Client & KYC](by-topic/client-kyc.md) | [L101488](../../../ScriptDB/000_4_CreateSP.sql#L101488) | — | 0 / 0 | — |
| `DI_CompareTotalUnitAccountVSTrx` | [Account & Plan](by-topic/account-plan.md) | [L101535](../../../ScriptDB/000_4_CreateSP.sql#L101535) | — | 0 / 0 | — |
| `DI_CreatePlanUniqueID` | [Account & Plan](by-topic/account-plan.md) | [L101562](../../../ScriptDB/000_4_CreateSP.sql#L101562) | — | 0 / 1 | — |
| `DI_CustomerPlanScan` | [Account & Plan](by-topic/account-plan.md) | [L101641](../../../ScriptDB/000_4_CreateSP.sql#L101641) | — | 0 / 0 | — |
| `DI_ETWithHistory` | [Shared / Other](by-topic/shared-other.md) | [L101690](../../../ScriptDB/000_4_CreateSP.sql#L101690) | — | 0 / 0 | — |
| `DI_FindClientWithOneDealerCodeWithoutAnother` | [Client & KYC](by-topic/client-kyc.md) | [L101780](../../../ScriptDB/000_4_CreateSP.sql#L101780) | — | 0 / 0 | — |
| `DI_FixAccountUnit_TrxTypeA` | [Account & Plan](by-topic/account-plan.md) | [L101829](../../../ScriptDB/000_4_CreateSP.sql#L101829) | — | 0 / 0 | — |
| `DI_FixDealerAcommissionSign` | [Commission & Fee](by-topic/commission-fee.md) | [L101942](../../../ScriptDB/000_4_CreateSP.sql#L101942) | — | 0 / 0 | — |
| `DI_FixDealerCommissionSign` | [Commission & Fee](by-topic/commission-fee.md) | [L102020](../../../ScriptDB/000_4_CreateSP.sql#L102020) | — | 0 / 0 | — |
| `DI_FixDuplicateAccount` | [Account & Plan](by-topic/account-plan.md) | [L102098](../../../ScriptDB/000_4_CreateSP.sql#L102098) | — | 0 / 1 | — |
| `DI_FixDuplicateAccountOne` | [Account & Plan](by-topic/account-plan.md) | [L102144](../../../ScriptDB/000_4_CreateSP.sql#L102144) | — | 1 / 0 | — |
| `DI_FixTrxDueDateNonWire` | [Trading & Orders](by-topic/trading-orders.md) | [L102191](../../../ScriptDB/000_4_CreateSP.sql#L102191) | — | 0 / 0 | — |
| `DI_FreezeClientList` | [Client & KYC](by-topic/client-kyc.md) | [L102246](../../../ScriptDB/000_4_CreateSP.sql#L102246) | 1 / 1 file | 0 / 2 | [Customer.cs:4780](../../../UBClasses/Customer.cs#L4780) |
| `DI_FreezePlanClientOneRep` | [Account & Plan](by-topic/account-plan.md) | [L102292](../../../ScriptDB/000_4_CreateSP.sql#L102292) | — | 0 / 2 | — |
| `DI_FreezePlanWithDeficientStatus` | [Account & Plan](by-topic/account-plan.md) | [L102341](../../../ScriptDB/000_4_CreateSP.sql#L102341) | — | 0 / 1 | — |
| `DI_InactiveAccountWithTrxUnitProcess` | [Account & Plan](by-topic/account-plan.md) | [L102370](../../../ScriptDB/000_4_CreateSP.sql#L102370) | — | 0 / 0 | — |
| `DI_InactiveAccountWithTrxUnitScan` | [Account & Plan](by-topic/account-plan.md) | [L102435](../../../ScriptDB/000_4_CreateSP.sql#L102435) | — | 0 / 0 | — |
| `DI_InactiveClientByYear` | [Client & KYC](by-topic/client-kyc.md) | [L102505](../../../ScriptDB/000_4_CreateSP.sql#L102505) | — | 0 / 0 | — |
| `DI_LevPlanLoan` | [Account & Plan](by-topic/account-plan.md) | [L102689](../../../ScriptDB/000_4_CreateSP.sql#L102689) | — | 0 / 0 | — |
| `DI_MemberListPaid` | [Shared / Other](by-topic/shared-other.md) | [L102767](../../../ScriptDB/000_4_CreateSP.sql#L102767) | — | 0 / 0 | — |
| `DI_MismatchFileAndPosition` | [Shared / Other](by-topic/shared-other.md) | [L102789](../../../ScriptDB/000_4_CreateSP.sql#L102789) | — | 0 / 0 | — |
| `DI_NSPFileContentList` | [Shared / Other](by-topic/shared-other.md) | [L102903](../../../ScriptDB/000_4_CreateSP.sql#L102903) | 1 / 1 file | 0 / 0 | [FundServ.cs:681](../../../UBClasses/FundServ.cs#L681) |
| `DI_PlanActiveAccountInactive` | [Account & Plan](by-topic/account-plan.md) | [L103016](../../../ScriptDB/000_4_CreateSP.sql#L103016) | — | 0 / 0 | — |
| `DI_PlanDuplication` | [Account & Plan](by-topic/account-plan.md) | [L103084](../../../ScriptDB/000_4_CreateSP.sql#L103084) | — | 0 / 0 | — |
| `DI_PlanDuplicationIntOnly` | [Account & Plan](by-topic/account-plan.md) | [L103138](../../../ScriptDB/000_4_CreateSP.sql#L103138) | — | 0 / 0 | — |
| `DI_PlanDuplicationList` | [Account & Plan](by-topic/account-plan.md) | [L103184](../../../ScriptDB/000_4_CreateSP.sql#L103184) | — | 0 / 0 | — |
| `DI_PlanFreezeTaggedItems` | [Account & Plan](by-topic/account-plan.md) | [L103367](../../../ScriptDB/000_4_CreateSP.sql#L103367) | 1 / 1 file | 0 / 1 | [Plan.cs:4054](../../../UBClasses/Plan.cs#L4054) |
| `DI_PlanFrozenAsOf` | [Account & Plan](by-topic/account-plan.md) | [L103419](../../../ScriptDB/000_4_CreateSP.sql#L103419) | — | 0 / 0 | — |
| `DI_PlanInactiveAccountActive` | [Account & Plan](by-topic/account-plan.md) | [L103464](../../../ScriptDB/000_4_CreateSP.sql#L103464) | — | 0 / 1 | — |
| `DI_PlanInactiveAsOf` | [Account & Plan](by-topic/account-plan.md) | [L103577](../../../ScriptDB/000_4_CreateSP.sql#L103577) | — | 0 / 0 | — |
| `DI_PlanInvObjIssueList` | [Account & Plan](by-topic/account-plan.md) | [L103615](../../../ScriptDB/000_4_CreateSP.sql#L103615) | — | 0 / 1 | — |
| `DI_PlanInvObjOffSelUpdate` | [Account & Plan](by-topic/account-plan.md) | [L103980](../../../ScriptDB/000_4_CreateSP.sql#L103980) | — | 0 / 0 | — |
| `DI_PlanKYCExpiredList` | [Account & Plan](by-topic/account-plan.md) | [L104016](../../../ScriptDB/000_4_CreateSP.sql#L104016) | — | 1 / 1 | — |
| `DI_PlanKYCExpiredSelUpdate` | [Account & Plan](by-topic/account-plan.md) | [L105310](../../../ScriptDB/000_4_CreateSP.sql#L105310) | — | 0 / 0 | — |
| `DI_PlanNoAccount` | [Account & Plan](by-topic/account-plan.md) | [L105358](../../../ScriptDB/000_4_CreateSP.sql#L105358) | — | 0 / 0 | — |
| `DI_PlanNoAccountByDateRep` | [Account & Plan](by-topic/account-plan.md) | [L105420](../../../ScriptDB/000_4_CreateSP.sql#L105420) | — | 0 / 0 | — |
| `DI_PlanNoBenList` | [Account & Plan](by-topic/account-plan.md) | [L105495](../../../ScriptDB/000_4_CreateSP.sql#L105495) | — | 0 / 1 | — |
| `DI_PlanNoKYCList` | [Account & Plan](by-topic/account-plan.md) | [L105730](../../../ScriptDB/000_4_CreateSP.sql#L105730) | — | 0 / 1 | — |
| `DI_PlanNoKYCSelUpdate` | [Account & Plan](by-topic/account-plan.md) | [L106091](../../../ScriptDB/000_4_CreateSP.sql#L106091) | — | 0 / 0 | — |
| `DI_PlanRiskCalcAll` | [Account & Plan](by-topic/account-plan.md) | [L106138](../../../ScriptDB/000_4_CreateSP.sql#L106138) | — | 0 / 1 | — |
| `DI_PlanRiskCalcOne` | [Account & Plan](by-topic/account-plan.md) | [L106182](../../../ScriptDB/000_4_CreateSP.sql#L106182) | — | 1 / 1 | — |
| `DI_PlanRiskIssueList` | [Account & Plan](by-topic/account-plan.md) | [L106245](../../../ScriptDB/000_4_CreateSP.sql#L106245) | — | 0 / 1 | — |
| `DI_PlanRiskListAll` | [Account & Plan](by-topic/account-plan.md) | [L106639](../../../ScriptDB/000_4_CreateSP.sql#L106639) | — | 0 / 0 | — |
| `DI_PlanRiskOffSelUpdate` | [Account & Plan](by-topic/account-plan.md) | [L106677](../../../ScriptDB/000_4_CreateSP.sql#L106677) | — | 0 / 0 | — |
| `DI_PlanScan4MissingSwitch` | [Account & Plan](by-topic/account-plan.md) | [L106724](../../../ScriptDB/000_4_CreateSP.sql#L106724) | — | 0 / 1 | — |
| `DI_PlanUnfreezeTaggedItems` | [Account & Plan](by-topic/account-plan.md) | [L106790](../../../ScriptDB/000_4_CreateSP.sql#L106790) | 1 / 1 file | 0 / 1 | [Plan.cs:4098](../../../UBClasses/Plan.cs#L4098) |
| `DI_PlanZeroMKV` | [Account & Plan](by-topic/account-plan.md) | [L106838](../../../ScriptDB/000_4_CreateSP.sql#L106838) | — | 0 / 1 | — |
| `DI_PlanZeroMKVAsOf` | [Account & Plan](by-topic/account-plan.md) | [L107051](../../../ScriptDB/000_4_CreateSP.sql#L107051) | — | 0 / 0 | — |
| `DI_PlanZeroMKVInactivate` | [Account & Plan](by-topic/account-plan.md) | [L107097](../../../ScriptDB/000_4_CreateSP.sql#L107097) | — | 0 / 1 | — |
| `DI_PlanZeroMKVSelUpdate` | [Account & Plan](by-topic/account-plan.md) | [L107144](../../../ScriptDB/000_4_CreateSP.sql#L107144) | — | 0 / 0 | — |
| `DI_PositionZeroActive` | [Shared / Other](by-topic/shared-other.md) | [L107192](../../../ScriptDB/000_4_CreateSP.sql#L107192) | — | 0 / 0 | — |
| `DI_PositionZeroTrxNotZeroActive` | [Trading & Orders](by-topic/trading-orders.md) | [L107271](../../../ScriptDB/000_4_CreateSP.sql#L107271) | — | 0 / 0 | — |
| `DI_PositionZeroTrxNotZeroSet` | [Trading & Orders](by-topic/trading-orders.md) | [L107343](../../../ScriptDB/000_4_CreateSP.sql#L107343) | — | 0 / 0 | — |
| `DI_PSPFileReport_AccountNotFound` | [Account & Plan](by-topic/account-plan.md) | [L107400](../../../ScriptDB/000_4_CreateSP.sql#L107400) | — | 0 / 0 | — |
| `DI_PSPFileReport_Discrepancies` | [Shared / Other](by-topic/shared-other.md) | [L107552](../../../ScriptDB/000_4_CreateSP.sql#L107552) | — | 0 / 1 | — |
| `DI_PSPFileReport_DiscrepanciesOneFile` | [Shared / Other](by-topic/shared-other.md) | [L107794](../../../ScriptDB/000_4_CreateSP.sql#L107794) | — | 1 / 0 | — |
| `DI_PSPFileReport_NotIncluded` | [Shared / Other](by-topic/shared-other.md) | [L107887](../../../ScriptDB/000_4_CreateSP.sql#L107887) | — | 0 / 0 | — |
| `DI_RemoveETFDuplicatedTrx` | [Fund & GIC](by-topic/fund-gic.md) | [L108299](../../../ScriptDB/000_4_CreateSP.sql#L108299) | — | 0 / 0 | — |
| `DI_RemoveZeroPlanDealerAccountID` | [Account & Plan](by-topic/account-plan.md) | [L108343](../../../ScriptDB/000_4_CreateSP.sql#L108343) | — | 0 / 0 | — |
| `DI_ReprocessTS` | [Shared / Other](by-topic/shared-other.md) | [L108394](../../../ScriptDB/000_4_CreateSP.sql#L108394) | — | 1 / 1 | — |
| `DI_ScanInactiveAccountWithTrxUnit` | [Account & Plan](by-topic/account-plan.md) | [L108434](../../../ScriptDB/000_4_CreateSP.sql#L108434) | — | 0 / 0 | — |
| `DI_ScanOneRIF` | [Shared / Other](by-topic/shared-other.md) | [L108499](../../../ScriptDB/000_4_CreateSP.sql#L108499) | — | 5 / 0 | — |
| `DI_ScanOneSWP` | [Shared / Other](by-topic/shared-other.md) | [L108570](../../../ScriptDB/000_4_CreateSP.sql#L108570) | — | 3 / 0 | — |
| `DI_ScanSWPRIF` | [Shared / Other](by-topic/shared-other.md) | [L108630](../../../ScriptDB/000_4_CreateSP.sql#L108630) | — | 0 / 2 | — |
| `DI_SetAccountInactiveZeroUnit4InactivePlan` | [Account & Plan](by-topic/account-plan.md) | [L108735](../../../ScriptDB/000_4_CreateSP.sql#L108735) | — | 0 / 0 | — |
| `DI_SetAccountInactiveZeroUnitByDate` | [Account & Plan](by-topic/account-plan.md) | [L108772](../../../ScriptDB/000_4_CreateSP.sql#L108772) | — | 0 / 0 | — |
| `DI_SetAccountPos2TrxAvgCost` | [Account & Plan](by-topic/account-plan.md) | [L108865](../../../ScriptDB/000_4_CreateSP.sql#L108865) | — | 0 / 0 | — |
| `DI_SetAccountPos2TrxBalance` | [Account & Plan](by-topic/account-plan.md) | [L108939](../../../ScriptDB/000_4_CreateSP.sql#L108939) | — | 0 / 0 | — |
| `DI_SetAccountPos2TrxBalance1Day` | [Account & Plan](by-topic/account-plan.md) | [L109012](../../../ScriptDB/000_4_CreateSP.sql#L109012) | — | 1 / 0 | — |
| `DI_SetCalcUnit_All` | [Shared / Other](by-topic/shared-other.md) | [L109068](../../../ScriptDB/000_4_CreateSP.sql#L109068) | — | 0 / 2 | — |
| `DI_SetTrxSequence` | [Trading & Orders](by-topic/trading-orders.md) | [L109106](../../../ScriptDB/000_4_CreateSP.sql#L109106) | — | 0 / 0 | — |
| `DI_SetTrxUnitBalance2CalcValues` | [Trading & Orders](by-topic/trading-orders.md) | [L109132](../../../ScriptDB/000_4_CreateSP.sql#L109132) | — | 0 / 3 | — |
| `DI_StatsClientRepPlan` | [Account & Plan](by-topic/account-plan.md) | [L109162](../../../ScriptDB/000_4_CreateSP.sql#L109162) | — | 0 / 0 | — |
| `DI_SysPlanScanAccount` | [Account & Plan](by-topic/account-plan.md) | [L109218](../../../ScriptDB/000_4_CreateSP.sql#L109218) | — | 0 / 1 | — |
| `DI_TableStats` | [Shared / Other](by-topic/shared-other.md) | [L109417](../../../ScriptDB/000_4_CreateSP.sql#L109417) | — | 0 / 0 | — |
| `DI_TrustCashAccountDiscrepancies` | [Account & Plan](by-topic/account-plan.md) | [L109464](../../../ScriptDB/000_4_CreateSP.sql#L109464) | — | 0 / 0 | — |
| `DI_TrustCashAccountDiscrepanciesRefresh1` | [Account & Plan](by-topic/account-plan.md) | [L109497](../../../ScriptDB/000_4_CreateSP.sql#L109497) | — | 0 / 1 | — |
| `DI_TSPRecordProcessDayEnd` | [Shared / Other](by-topic/shared-other.md) | [L109528](../../../ScriptDB/000_4_CreateSP.sql#L109528) | — | 0 / 1 | — |
| `DT_Extract_Client` | [Client & KYC](by-topic/client-kyc.md) | [L109541](../../../ScriptDB/000_4_CreateSP.sql#L109541) | — | 0 / 0 | — |
| `EA_CON_WF_DealerBranch` | [Shared / Other](by-topic/shared-other.md) | [L109778](../../../ScriptDB/000_4_CreateSP.sql#L109778) | — | 0 / 1 | — |
| `EA_CON_WF_UserStep1` | [Shared / Other](by-topic/shared-other.md) | [L109825](../../../ScriptDB/000_4_CreateSP.sql#L109825) | — | 0 / 2 | — |
| `EA_CON_WF_UserStep2` | [Shared / Other](by-topic/shared-other.md) | [L110007](../../../ScriptDB/000_4_CreateSP.sql#L110007) | — | 0 / 6 | — |
| `EA_CON_WF_UserStep3` | [Shared / Other](by-topic/shared-other.md) | [L110258](../../../ScriptDB/000_4_CreateSP.sql#L110258) | — | 0 / 6 | — |
| `EA_Extract_JF` | [Shared / Other](by-topic/shared-other.md) | [L110622](../../../ScriptDB/000_4_CreateSP.sql#L110622) | — | 0 / 0 | — |
| `EmailSample` | [Notifications](by-topic/notifications.md) | [L110726](../../../ScriptDB/000_4_CreateSP.sql#L110726) | — | 0 / 0 | — |
| `ETF_CompareOmnibusVSClient` | [Fund & GIC](by-topic/fund-gic.md) | [L110759](../../../ScriptDB/000_4_CreateSP.sql#L110759) | — | 0 / 0 | — |
| `ETF_RecalcAverageCost` | [Fund & GIC](by-topic/fund-gic.md) | [L110790](../../../ScriptDB/000_4_CreateSP.sql#L110790) | — | 2 / 0 | — |
| `ETF_RecalcAverageCostAll` | [Fund & GIC](by-topic/fund-gic.md) | [L110863](../../../ScriptDB/000_4_CreateSP.sql#L110863) | — | 0 / 1 | — |
| `ETF_ReProcessOneFile` | [Fund & GIC](by-topic/fund-gic.md) | [L110915](../../../ScriptDB/000_4_CreateSP.sql#L110915) | — | 0 / 1 | — |
| `ETF_Scan4ExpiredOrder` | [Fund & GIC](by-topic/fund-gic.md) | [L110943](../../../ScriptDB/000_4_CreateSP.sql#L110943) | — | 0 / 1 | — |
| `ETF_SetTradeDateToRecordDate` | [Fund & GIC](by-topic/fund-gic.md) | [L110990](../../../ScriptDB/000_4_CreateSP.sql#L110990) | — | 0 / 0 | — |
| `ETFAccountCompareScotia` | [Fund & GIC](by-topic/fund-gic.md) | [L111016](../../../ScriptDB/000_4_CreateSP.sql#L111016) | — | 0 / 0 | — |
| `ETFCIDividendProcessOne` | [Fund & GIC](by-topic/fund-gic.md) | [L111134](../../../ScriptDB/000_4_CreateSP.sql#L111134) | — | 2 / 3 | — |
| `ETFCIDividendProcessOneX` | [Fund & GIC](by-topic/fund-gic.md) | [L111442](../../../ScriptDB/000_4_CreateSP.sql#L111442) | — | 0 / 1 | — |
| `ETFDIVCIFileStats` | [Fund & GIC](by-topic/fund-gic.md) | [L111463](../../../ScriptDB/000_4_CreateSP.sql#L111463) | 1 / 1 file | 0 / 0 | [CCIGCashDiv.cs:117](../../../UBFFImport/CCIGCashDiv.cs#L117) |
| `ETFDIVCIImportDef` | [Fund & GIC](by-topic/fund-gic.md) | [L111483](../../../ScriptDB/000_4_CreateSP.sql#L111483) | — | 0 / 0 | — |
| `ETFDIVCIProcessOneRecord` | [Fund & GIC](by-topic/fund-gic.md) | [L111497](../../../ScriptDB/000_4_CreateSP.sql#L111497) | — | 0 / 1 | — |
| `ETFDividendProcess` | [Fund & GIC](by-topic/fund-gic.md) | [L111544](../../../ScriptDB/000_4_CreateSP.sql#L111544) | — | 0 / 3 | — |
| `ETFDividendProcessOne` | [Fund & GIC](by-topic/fund-gic.md) | [L111760](../../../ScriptDB/000_4_CreateSP.sql#L111760) | — | 0 / 3 | — |
| `ETFListTrxOneSymbol` | [Fund & GIC](by-topic/fund-gic.md) | [L111999](../../../ScriptDB/000_4_CreateSP.sql#L111999) | — | 0 / 0 | — |
| `ETFProcessManualOne` | [Fund & GIC](by-topic/fund-gic.md) | [L112045](../../../ScriptDB/000_4_CreateSP.sql#L112045) | — | 0 / 5 | — |
| `ETFSplit` | [Fund & GIC](by-topic/fund-gic.md) | [L112321](../../../ScriptDB/000_4_CreateSP.sql#L112321) | — | 0 / 1 | — |
| `ETFSplitOne` | [Fund & GIC](by-topic/fund-gic.md) | [L112393](../../../ScriptDB/000_4_CreateSP.sql#L112393) | — | 1 / 1 | — |
| `ETFTrxListing` | [Fund & GIC](by-topic/fund-gic.md) | [L112578](../../../ScriptDB/000_4_CreateSP.sql#L112578) | — | 0 / 0 | — |
| `FINTRAC_EFTCount` | [Compliance](by-topic/compliance.md) | [L112629](../../../ScriptDB/000_4_CreateSP.sql#L112629) | — | 0 / 0 | — |
| `FINTRAC_Process_SEM_JVC` | [Compliance](by-topic/compliance.md) | [L112713](../../../ScriptDB/000_4_CreateSP.sql#L112713) | — | 0 / 0 | — |
| `Fix_AEFile_Once_TBD` | [Shared / Other](by-topic/shared-other.md) | [L112788](../../../ScriptDB/000_4_CreateSP.sql#L112788) | — | 0 / 1 | — |
| `FMClientAdd` | [Client & KYC](by-topic/client-kyc.md) | [L112824](../../../ScriptDB/000_4_CreateSP.sql#L112824) | — | 0 / 12 | — |
| `FMClientAddressUpdate` | [Client & KYC](by-topic/client-kyc.md) | [L113302](../../../ScriptDB/000_4_CreateSP.sql#L113302) | — | 0 / 1 | — |
| `FMFundAccountAdd` | [Fund & GIC](by-topic/fund-gic.md) | [L113335](../../../ScriptDB/000_4_CreateSP.sql#L113335) | — | 0 / 1 | — |
| `FMFundAccountUpdate` | [Fund & GIC](by-topic/fund-gic.md) | [L113365](../../../ScriptDB/000_4_CreateSP.sql#L113365) | — | 0 / 1 | — |
| `FMOrderBuy` | [Trading & Orders](by-topic/trading-orders.md) | [L113440](../../../ScriptDB/000_4_CreateSP.sql#L113440) | — | 0 / 1 | — |
| `FMOrderSell` | [Trading & Orders](by-topic/trading-orders.md) | [L113540](../../../ScriptDB/000_4_CreateSP.sql#L113540) | — | 0 / 1 | — |
| `FMPlanAdd` | [Account & Plan](by-topic/account-plan.md) | [L113602](../../../ScriptDB/000_4_CreateSP.sql#L113602) | — | 0 / 8 | — |
| `FMPlanBenAdd` | [Account & Plan](by-topic/account-plan.md) | [L113842](../../../ScriptDB/000_4_CreateSP.sql#L113842) | — | 0 / 9 | — |
| `FMPlanBenRemove` | [Account & Plan](by-topic/account-plan.md) | [L114064](../../../ScriptDB/000_4_CreateSP.sql#L114064) | — | 0 / 1 | — |
| `FMPlanBenUpdate` | [Account & Plan](by-topic/account-plan.md) | [L114103](../../../ScriptDB/000_4_CreateSP.sql#L114103) | — | 0 / 7 | — |
| `FSXMLOrderRRIFPYMT_TBD` | [Account & Plan](by-topic/account-plan.md) | [L114253](../../../ScriptDB/000_4_CreateSP.sql#L114253) | — | 0 / 0 | — |
| `FSXMLOrderXMLTransfer_TBD` | [Trading & Orders](by-topic/trading-orders.md) | [L114427](../../../ScriptDB/000_4_CreateSP.sql#L114427) | — | 0 / 0 | — |
| `GenerateAccountNumber` | [Account & Plan](by-topic/account-plan.md) | [L114553](../../../ScriptDB/000_4_CreateSP.sql#L114553) | — | 0 / 0 | — |
| `GetTrxUnitBalance` | [Trading & Orders](by-topic/trading-orders.md) | [L114572](../../../ScriptDB/000_4_CreateSP.sql#L114572) | — | 0 / 0 | — |
| `GIC_GetMaturityValue_DB` | [Fund & GIC](by-topic/fund-gic.md) | [L114614](../../../ScriptDB/000_4_CreateSP.sql#L114614) | — | 0 / 0 | — |
| `GLOB_SetupRepPermission` | [Security & Auth](by-topic/security-auth.md) | [L114751](../../../ScriptDB/000_4_CreateSP.sql#L114751) | — | 0 / 0 | — |
| `Global_UnclaimQC` | [Shared / Other](by-topic/shared-other.md) | [L114800](../../../ScriptDB/000_4_CreateSP.sql#L114800) | — | 0 / 0 | — |
| `GlobalManagerComm` | [Commission & Fee](by-topic/commission-fee.md) | [L115110](../../../ScriptDB/000_4_CreateSP.sql#L115110) | — | 0 / 0 | — |
| `GlobalRepBankAll` | [Shared / Other](by-topic/shared-other.md) | [L115292](../../../ScriptDB/000_4_CreateSP.sql#L115292) | — | 0 / 1 | — |
| `GlobalRepBankOne` | [Shared / Other](by-topic/shared-other.md) | [L115319](../../../ScriptDB/000_4_CreateSP.sql#L115319) | — | 1 / 0 | — |
| `GlobalRepComm` | [Commission & Fee](by-topic/commission-fee.md) | [L115369](../../../ScriptDB/000_4_CreateSP.sql#L115369) | — | 0 / 0 | — |
| `INFGenerateIndexesScript` | [Shared / Other](by-topic/shared-other.md) | [L115575](../../../ScriptDB/000_4_CreateSP.sql#L115575) | — | 0 / 0 | — |
| `Init_AccountPosCalcOne` | [Account & Plan](by-topic/account-plan.md) | [L115782](../../../ScriptDB/000_4_CreateSP.sql#L115782) | — | 1 / 1 | — |
| `Init_AccountPosCalcOne_Step1` | [Account & Plan](by-topic/account-plan.md) | [L115839](../../../ScriptDB/000_4_CreateSP.sql#L115839) | — | 0 / 0 | — |
| `Init_AccountPosCalcOne_Step2` | [Account & Plan](by-topic/account-plan.md) | [L115864](../../../ScriptDB/000_4_CreateSP.sql#L115864) | — | 0 / 1 | — |
| `Init_AgemanRefresh` | [Shared / Other](by-topic/shared-other.md) | [L115908](../../../ScriptDB/000_4_CreateSP.sql#L115908) | — | 0 / 0 | — |
| `Init_AveragedCostAllPos` | [Shared / Other](by-topic/shared-other.md) | [L115946](../../../ScriptDB/000_4_CreateSP.sql#L115946) | — | 0 / 1 | — |
| `Init_AveragedCostAllPos1` | [Shared / Other](by-topic/shared-other.md) | [L115982](../../../ScriptDB/000_4_CreateSP.sql#L115982) | — | 0 / 1 | — |
| `Init_AveragedCostOneMgmt` | [Shared / Other](by-topic/shared-other.md) | [L116027](../../../ScriptDB/000_4_CreateSP.sql#L116027) | — | 0 / 1 | — |
| `Init_AveragedCostOnePos` | [Shared / Other](by-topic/shared-other.md) | [L116053](../../../ScriptDB/000_4_CreateSP.sql#L116053) | — | 3 / 1 | — |
| `Init_bEmail` | [Notifications](by-topic/notifications.md) | [L116093](../../../ScriptDB/000_4_CreateSP.sql#L116093) | — | 0 / 0 | — |
| `Init_CashAccountWithBalanceNoTrx` | [Account & Plan](by-topic/account-plan.md) | [L116124](../../../ScriptDB/000_4_CreateSP.sql#L116124) | — | 0 / 0 | — |
| `Init_ChangeDeliveryMethodFromEmailMail2MailOrElectronic` | [Notifications](by-topic/notifications.md) | [L116161](../../../ScriptDB/000_4_CreateSP.sql#L116161) | — | 0 / 1 | — |
| `Init_CheckAccountPosUnit` | [Account & Plan](by-topic/account-plan.md) | [L116217](../../../ScriptDB/000_4_CreateSP.sql#L116217) | — | 0 / 0 | — |
| `Init_CheckAccountPosUnitBecauseTrnsf` | [Account & Plan](by-topic/account-plan.md) | [L116296](../../../ScriptDB/000_4_CreateSP.sql#L116296) | — | 0 / 0 | — |
| `Init_CheckAccountTradeDateProcessingDateDiff` | [Account & Plan](by-topic/account-plan.md) | [L116377](../../../ScriptDB/000_4_CreateSP.sql#L116377) | — | 0 / 0 | — |
| `Init_CheckInactiveMemberRep` | [Shared / Other](by-topic/shared-other.md) | [L116448](../../../ScriptDB/000_4_CreateSP.sql#L116448) | — | 0 / 0 | — |
| `Init_CheckWebClientLoginID` | [Client & KYC](by-topic/client-kyc.md) | [L116506](../../../ScriptDB/000_4_CreateSP.sql#L116506) | — | 0 / 0 | — |
| `Init_CleanupCommissionAW` | [Commission & Fee](by-topic/commission-fee.md) | [L116563](../../../ScriptDB/000_4_CreateSP.sql#L116563) | — | 0 / 0 | — |
| `Init_CleanupReport` | [Shared / Other](by-topic/shared-other.md) | [L116596](../../../ScriptDB/000_4_CreateSP.sql#L116596) | — | 0 / 0 | — |
| `Init_ClearAllTrxBalanceForward` | [Trading & Orders](by-topic/trading-orders.md) | [L116624](../../../ScriptDB/000_4_CreateSP.sql#L116624) | — | 0 / 0 | — |
| `Init_ClientAssignFileIDAll_1194` | [Client & KYC](by-topic/client-kyc.md) | [L116648](../../../ScriptDB/000_4_CreateSP.sql#L116648) | — | 0 / 1 | — |
| `Init_ClientAssignFileIDOne_1194` | [Client & KYC](by-topic/client-kyc.md) | [L116682](../../../ScriptDB/000_4_CreateSP.sql#L116682) | — | 1 / 0 | — |
| `Init_ClientExtraInfoLinked` | [Client & KYC](by-topic/client-kyc.md) | [L116715](../../../ScriptDB/000_4_CreateSP.sql#L116715) | — | 0 / 0 | — |
| `Init_ClientInvalidSIN_BN` | [Client & KYC](by-topic/client-kyc.md) | [L116748](../../../ScriptDB/000_4_CreateSP.sql#L116748) | — | 0 / 0 | — |
| `Init_ClientLastKYCOnFileDate` | [Client & KYC](by-topic/client-kyc.md) | [L116793](../../../ScriptDB/000_4_CreateSP.sql#L116793) | — | 0 / 0 | — |
| `Init_ClientMemberRepScanAll` | [Client & KYC](by-topic/client-kyc.md) | [L116838](../../../ScriptDB/000_4_CreateSP.sql#L116838) | — | 0 / 1 | — |
| `Init_ClientMemberRepScanOne` | [Client & KYC](by-topic/client-kyc.md) | [L116874](../../../ScriptDB/000_4_CreateSP.sql#L116874) | — | 2 / 0 | — |
| `Init_ClientMemberRepScanOneMember` | [Client & KYC](by-topic/client-kyc.md) | [L116947](../../../ScriptDB/000_4_CreateSP.sql#L116947) | — | 0 / 1 | — |
| `Init_ClientQuestionDef` | [Client & KYC](by-topic/client-kyc.md) | [L116981](../../../ScriptDB/000_4_CreateSP.sql#L116981) | — | 1 / 1 | — |
| `Init_ClientQuestionDefAll` | [Client & KYC](by-topic/client-kyc.md) | [L117009](../../../ScriptDB/000_4_CreateSP.sql#L117009) | — | 0 / 1 | — |
| `Init_ClientRemoveFrenchAccent` | [Client & KYC](by-topic/client-kyc.md) | [L117046](../../../ScriptDB/000_4_CreateSP.sql#L117046) | — | 0 / 0 | — |
| `Init_ClientRepScanAll` | [Client & KYC](by-topic/client-kyc.md) | [L117071](../../../ScriptDB/000_4_CreateSP.sql#L117071) | — | 0 / 1 | — |
| `Init_ClientRepScanOneRepCode` | [Client & KYC](by-topic/client-kyc.md) | [L117104](../../../ScriptDB/000_4_CreateSP.sql#L117104) | — | 0 / 1 | — |
| `Init_ClientSetDefRep` | [Client & KYC](by-topic/client-kyc.md) | [L117130](../../../ScriptDB/000_4_CreateSP.sql#L117130) | — | 0 / 0 | — |
| `Init_CommRevHeader` | [Commission & Fee](by-topic/commission-fee.md) | [L117195](../../../ScriptDB/000_4_CreateSP.sql#L117195) | — | 0 / 0 | — |
| `Init_CompCheckPlanInfoScanQuestion` | [Account & Plan](by-topic/account-plan.md) | [L117263](../../../ScriptDB/000_4_CreateSP.sql#L117263) | — | 0 / 0 | — |
| `Init_CompCheckPlanInfoScanQuestionFlag` | [Account & Plan](by-topic/account-plan.md) | [L117304](../../../ScriptDB/000_4_CreateSP.sql#L117304) | — | 0 / 0 | — |
| `Init_CompliancePlanTrend` | [Compliance](by-topic/compliance.md) | [L117342](../../../ScriptDB/000_4_CreateSP.sql#L117342) | — | 0 / 1 | — |
| `Init_ComplianceTrxTrend` | [Compliance](by-topic/compliance.md) | [L117379](../../../ScriptDB/000_4_CreateSP.sql#L117379) | — | 0 / 1 | — |
| `Init_CompTrxSuitability_CreateMissing` | [Compliance](by-topic/compliance.md) | [L117419](../../../ScriptDB/000_4_CreateSP.sql#L117419) | — | 0 / 1 | — |
| `Init_CompTrxSuitability_CreateMissingOne` | [Compliance](by-topic/compliance.md) | [L117471](../../../ScriptDB/000_4_CreateSP.sql#L117471) | — | 1 / 1 | — |
| `Init_CON_GrossNetTrxProblem` | [Trading & Orders](by-topic/trading-orders.md) | [L117527](../../../ScriptDB/000_4_CreateSP.sql#L117527) | — | 0 / 0 | — |
| `Init_CreateCommissionFromTrx1Rep` | [Commission & Fee](by-topic/commission-fee.md) | [L117563](../../../ScriptDB/000_4_CreateSP.sql#L117563) | — | 0 / 0 | — |
| `Init_CreateDate` | [Shared / Other](by-topic/shared-other.md) | [L117651](../../../ScriptDB/000_4_CreateSP.sql#L117651) | — | 0 / 0 | — |
| `Init_CReateSynonyms` | [Shared / Other](by-topic/shared-other.md) | [L117693](../../../ScriptDB/000_4_CreateSP.sql#L117693) | — | 0 / 0 | — |
| `Init_CustomerRepRefreshAll` | [Client & KYC](by-topic/client-kyc.md) | [L117782](../../../ScriptDB/000_4_CreateSP.sql#L117782) | — | 0 / 1 | — |
| `Init_CustomerRepVerify` | [Client & KYC](by-topic/client-kyc.md) | [L117821](../../../ScriptDB/000_4_CreateSP.sql#L117821) | — | 0 / 0 | — |
| `Init_DealerAccountIDUpdate` | [Account & Plan](by-topic/account-plan.md) | [L117867](../../../ScriptDB/000_4_CreateSP.sql#L117867) | — | 0 / 0 | — |
| `Init_DealerCommission` | [Commission & Fee](by-topic/commission-fee.md) | [L117923](../../../ScriptDB/000_4_CreateSP.sql#L117923) | — | 0 / 0 | — |
| `Init_Dealership` | [Shared / Other](by-topic/shared-other.md) | [L117993](../../../ScriptDB/000_4_CreateSP.sql#L117993) | — | 0 / 2 | — |
| `Init_DOBTable` | [Shared / Other](by-topic/shared-other.md) | [L118039](../../../ScriptDB/000_4_CreateSP.sql#L118039) | — | 0 / 0 | — |
| `Init_EA_2ndInvObj` | [Shared / Other](by-topic/shared-other.md) | [L118064](../../../ScriptDB/000_4_CreateSP.sql#L118064) | — | 0 / 1 | — |
| `Init_EA_2ndInvObjOne` | [Shared / Other](by-topic/shared-other.md) | [L118089](../../../ScriptDB/000_4_CreateSP.sql#L118089) | — | 1 / 0 | — |
| `Init_ExtractPhoneBankIdent` | [Shared / Other](by-topic/shared-other.md) | [L118194](../../../ScriptDB/000_4_CreateSP.sql#L118194) | — | 0 / 0 | — |
| `Init_FE_OneDay_OneDealer` | [Shared / Other](by-topic/shared-other.md) | [L118250](../../../ScriptDB/000_4_CreateSP.sql#L118250) | — | 0 / 2 | — |
| `Init_FE_OneDealer_AGCH` | [Shared / Other](by-topic/shared-other.md) | [L118287](../../../ScriptDB/000_4_CreateSP.sql#L118287) | — | 0 / 1 | — |
| `Init_FGFE` | [Shared / Other](by-topic/shared-other.md) | [L118319](../../../ScriptDB/000_4_CreateSP.sql#L118319) | — | 0 / 1 | — |
| `Init_FindAccountSpousalDiscrepancy` | [Account & Plan](by-topic/account-plan.md) | [L118384](../../../ScriptDB/000_4_CreateSP.sql#L118384) | — | 0 / 0 | — |
| `Init_FindAccountZero` | [Account & Plan](by-topic/account-plan.md) | [L118431](../../../ScriptDB/000_4_CreateSP.sql#L118431) | — | 0 / 0 | — |
| `Init_FindBuyZeroBalance` | [Shared / Other](by-topic/shared-other.md) | [L118478](../../../ScriptDB/000_4_CreateSP.sql#L118478) | — | 0 / 0 | — |
| `Init_FirstTrxOnPlanAll` | [Account & Plan](by-topic/account-plan.md) | [L118511](../../../ScriptDB/000_4_CreateSP.sql#L118511) | — | 0 / 1 | — |
| `Init_FirstTrxOnPlanAll2` | [Account & Plan](by-topic/account-plan.md) | [L118561](../../../ScriptDB/000_4_CreateSP.sql#L118561) | — | 0 / 1 | — |
| `Init_FixApprovalConversion` | [Trading & Orders](by-topic/trading-orders.md) | [L118585](../../../ScriptDB/000_4_CreateSP.sql#L118585) | — | 0 / 1 | — |
| `Init_FixApprovalSwitch` | [Trading & Orders](by-topic/trading-orders.md) | [L118667](../../../ScriptDB/000_4_CreateSP.sql#L118667) | — | 0 / 1 | — |
| `Init_FixAveragedCost` | [Shared / Other](by-topic/shared-other.md) | [L118743](../../../ScriptDB/000_4_CreateSP.sql#L118743) | — | 0 / 1 | — |
| `Init_FixAveragedCostOne` | [Shared / Other](by-topic/shared-other.md) | [L118798](../../../ScriptDB/000_4_CreateSP.sql#L118798) | — | 1 / 0 | — |
| `Init_FixElectronicDeliveryInfo` | [Shared / Other](by-topic/shared-other.md) | [L118828](../../../ScriptDB/000_4_CreateSP.sql#L118828) | — | 0 / 0 | — |
| `Init_FixElectronicDeliveryInfoUserID` | [Shared / Other](by-topic/shared-other.md) | [L118895](../../../ScriptDB/000_4_CreateSP.sql#L118895) | — | 0 / 0 | — |
| `Init_FixETCOFNoSrcID` | [Shared / Other](by-topic/shared-other.md) | [L118971](../../../ScriptDB/000_4_CreateSP.sql#L118971) | — | 0 / 1 | — |
| `Init_FixICT` | [Shared / Other](by-topic/shared-other.md) | [L119065](../../../ScriptDB/000_4_CreateSP.sql#L119065) | — | 0 / 0 | — |
| `Init_FixingTrustCashTrx` | [Account & Plan](by-topic/account-plan.md) | [L119114](../../../ScriptDB/000_4_CreateSP.sql#L119114) | — | 0 / 0 | — |
| `Init_FixPlanClientLink` | [Account & Plan](by-topic/account-plan.md) | [L119158](../../../ScriptDB/000_4_CreateSP.sql#L119158) | — | 0 / 0 | — |
| `Init_FixSequence_1` | [Shared / Other](by-topic/shared-other.md) | [L119200](../../../ScriptDB/000_4_CreateSP.sql#L119200) | — | 0 / 0 | — |
| `Init_FixTransferInAccountUnitIssue` | [Account & Plan](by-topic/account-plan.md) | [L119253](../../../ScriptDB/000_4_CreateSP.sql#L119253) | — | 0 / 1 | — |
| `Init_FreezePlanPrior` | [Account & Plan](by-topic/account-plan.md) | [L119315](../../../ScriptDB/000_4_CreateSP.sql#L119315) | — | 0 / 1 | — |
| `Init_FundCodeChange` | [Fund & GIC](by-topic/fund-gic.md) | [L119360](../../../ScriptDB/000_4_CreateSP.sql#L119360) | — | 0 / 0 | — |
| `Init_FundPositionZeroTrxNot` | [Fund & GIC](by-topic/fund-gic.md) | [L119383](../../../ScriptDB/000_4_CreateSP.sql#L119383) | — | 0 / 0 | — |
| `Init_GIC_RefreshTotalInterest` | [Fund & GIC](by-topic/fund-gic.md) | [L119439](../../../ScriptDB/000_4_CreateSP.sql#L119439) | — | 0 / 1 | — |
| `Init_ImportBankBranchData` | [Shared / Other](by-topic/shared-other.md) | [L119473](../../../ScriptDB/000_4_CreateSP.sql#L119473) | — | 1 / 1 | — |
| `Init_ImportBankData` | [Shared / Other](by-topic/shared-other.md) | [L119558](../../../ScriptDB/000_4_CreateSP.sql#L119558) | — | 0 / 2 | — |
| `Init_ImportForms` | [Documents & PDF](by-topic/documents-pdf.md) | [L119624](../../../ScriptDB/000_4_CreateSP.sql#L119624) | — | 0 / 0 | — |
| `Init_ImportFundClass` | [Fund & GIC](by-topic/fund-gic.md) | [L119654](../../../ScriptDB/000_4_CreateSP.sql#L119654) | — | 0 / 0 | — |
| `Init_ListSupplierBasedClientAccount` | [Account & Plan](by-topic/account-plan.md) | [L119683](../../../ScriptDB/000_4_CreateSP.sql#L119683) | — | 0 / 0 | — |
| `Init_ListTrxTradeDateProcessingDateDiff` | [Trading & Orders](by-topic/trading-orders.md) | [L119768](../../../ScriptDB/000_4_CreateSP.sql#L119768) | — | 0 / 0 | — |
| `Init_MarkAsDeleteHave1Transf` | [Shared / Other](by-topic/shared-other.md) | [L119857](../../../ScriptDB/000_4_CreateSP.sql#L119857) | — | 0 / 0 | — |
| `Init_MarkAsDeleteHave2Transf` | [Shared / Other](by-topic/shared-other.md) | [L119904](../../../ScriptDB/000_4_CreateSP.sql#L119904) | — | 0 / 0 | — |
| `Init_MarkDeleteXTransferIn` | [Notifications](by-topic/notifications.md) | [L119963](../../../ScriptDB/000_4_CreateSP.sql#L119963) | — | 0 / 0 | — |
| `Init_MarkDeleteXTransferInOut` | [Notifications](by-topic/notifications.md) | [L120061](../../../ScriptDB/000_4_CreateSP.sql#L120061) | — | 0 / 0 | — |
| `Init_MarkDeleteXTransferInOutAllPlan` | [Account & Plan](by-topic/account-plan.md) | [L120216](../../../ScriptDB/000_4_CreateSP.sql#L120216) | — | 0 / 1 | — |
| `Init_MarkDeleteXTransferInOutAllPlan2` | [Account & Plan](by-topic/account-plan.md) | [L120377](../../../ScriptDB/000_4_CreateSP.sql#L120377) | — | 0 / 1 | — |
| `Init_MarkDeleteXTransferInOutOnePlan` | [Account & Plan](by-topic/account-plan.md) | [L120412](../../../ScriptDB/000_4_CreateSP.sql#L120412) | — | 2 / 1 | — |
| `Init_Member` | [Shared / Other](by-topic/shared-other.md) | [L120579](../../../ScriptDB/000_4_CreateSP.sql#L120579) | — | 0 / 2 | — |
| `Init_MixUp` | [Shared / Other](by-topic/shared-other.md) | [L120655](../../../ScriptDB/000_4_CreateSP.sql#L120655) | — | 0 / 0 | — |
| `Init_MON_CheckTrustTrxCash` | [Account & Plan](by-topic/account-plan.md) | [L120776](../../../ScriptDB/000_4_CreateSP.sql#L120776) | — | 0 / 1 | — |
| `Init_Move1Client2Rep` | [Client & KYC](by-topic/client-kyc.md) | [L120834](../../../ScriptDB/000_4_CreateSP.sql#L120834) | — | 1 / 0 | — |
| `Init_MoveAsset2Rep` | [Shared / Other](by-topic/shared-other.md) | [L120910](../../../ScriptDB/000_4_CreateSP.sql#L120910) | — | 0 / 2 | — |
| `Init_MoveMRS2Cash` | [Account & Plan](by-topic/account-plan.md) | [L121008](../../../ScriptDB/000_4_CreateSP.sql#L121008) | — | 0 / 1 | — |
| `Init_MoveMRS2CashAddTrx` | [Account & Plan](by-topic/account-plan.md) | [L121049](../../../ScriptDB/000_4_CreateSP.sql#L121049) | — | 1 / 0 | — |
| `Init_MoveMRS2CashDeleteAfter` | [Account & Plan](by-topic/account-plan.md) | [L121113](../../../ScriptDB/000_4_CreateSP.sql#L121113) | — | 0 / 0 | — |
| `Init_MoveMRS2CashOneAccount` | [Account & Plan](by-topic/account-plan.md) | [L121152](../../../ScriptDB/000_4_CreateSP.sql#L121152) | — | 1 / 1 | — |
| `Init_MoveMRS2CashOnePlan` | [Account & Plan](by-topic/account-plan.md) | [L121221](../../../ScriptDB/000_4_CreateSP.sql#L121221) | — | 1 / 1 | — |
| `Init_MoveOneFundAccount2Plan` | [Fund & GIC](by-topic/fund-gic.md) | [L121260](../../../ScriptDB/000_4_CreateSP.sql#L121260) | — | 0 / 1 | — |
| `Init_MovePlan2Rep` | [Account & Plan](by-topic/account-plan.md) | [L121295](../../../ScriptDB/000_4_CreateSP.sql#L121295) | — | 0 / 0 | — |
| `Init_OmnibusSyncStatus` | [Shared / Other](by-topic/shared-other.md) | [L121381](../../../ScriptDB/000_4_CreateSP.sql#L121381) | — | 0 / 0 | — |
| `Init_PlanQuestionDef` | [Account & Plan](by-topic/account-plan.md) | [L121398](../../../ScriptDB/000_4_CreateSP.sql#L121398) | — | 1 / 1 | — |
| `Init_PlanQuestionDefAll` | [Account & Plan](by-topic/account-plan.md) | [L121480](../../../ScriptDB/000_4_CreateSP.sql#L121480) | — | 0 / 1 | — |
| `Init_PlanQuestionPurpose_25` | [Account & Plan](by-topic/account-plan.md) | [L121519](../../../ScriptDB/000_4_CreateSP.sql#L121519) | — | 1 / 0 | — |
| `Init_PlanQuestionPurpose_25_All` | [Account & Plan](by-topic/account-plan.md) | [L121635](../../../ScriptDB/000_4_CreateSP.sql#L121635) | — | 0 / 1 | — |
| `Init_PlanStartDate` | [Account & Plan](by-topic/account-plan.md) | [L121673](../../../ScriptDB/000_4_CreateSP.sql#L121673) | — | 0 / 0 | — |
| `Init_PositionInitialTrxMissing` | [Trading & Orders](by-topic/trading-orders.md) | [L121720](../../../ScriptDB/000_4_CreateSP.sql#L121720) | — | 0 / 0 | — |
| `Init_QuestionSecondaryObjQuestion` | [Shared / Other](by-topic/shared-other.md) | [L121764](../../../ScriptDB/000_4_CreateSP.sql#L121764) | — | 0 / 1 | — |
| `Init_QuestionSetVal` | [Shared / Other](by-topic/shared-other.md) | [L121842](../../../ScriptDB/000_4_CreateSP.sql#L121842) | — | 0 / 0 | — |
| `Init_RDSP_No_Contribution` | [Shared / Other](by-topic/shared-other.md) | [L121890](../../../ScriptDB/000_4_CreateSP.sql#L121890) | — | 0 / 0 | — |
| `Init_RecalcNetWorthIndex` | [Shared / Other](by-topic/shared-other.md) | [L121932](../../../ScriptDB/000_4_CreateSP.sql#L121932) | — | 0 / 0 | — |
| `Init_RecreateSuitabilityTrxStatusRecord` | [Compliance](by-topic/compliance.md) | [L121958](../../../ScriptDB/000_4_CreateSP.sql#L121958) | — | 0 / 2 | — |
| `Init_RemoveB2BStockBondAsset` | [Shared / Other](by-topic/shared-other.md) | [L122444](../../../ScriptDB/000_4_CreateSP.sql#L122444) | — | 0 / 0 | — |
| `Init_RemoveFundPositionNoTrx` | [Fund & GIC](by-topic/fund-gic.md) | [L122488](../../../ScriptDB/000_4_CreateSP.sql#L122488) | — | 0 / 1 | — |
| `Init_ResetFundApproved` | [Fund & GIC](by-topic/fund-gic.md) | [L122530](../../../ScriptDB/000_4_CreateSP.sql#L122530) | — | 0 / 0 | — |
| `Init_RestoreAddress` | [Shared / Other](by-topic/shared-other.md) | [L122566](../../../ScriptDB/000_4_CreateSP.sql#L122566) | — | 1 / 0 | — |
| `Init_RestoreBankBranchOne` | [Shared / Other](by-topic/shared-other.md) | [L122598](../../../ScriptDB/000_4_CreateSP.sql#L122598) | — | 1 / 0 | — |
| `Init_RestoreBankOne` | [Shared / Other](by-topic/shared-other.md) | [L122633](../../../ScriptDB/000_4_CreateSP.sql#L122633) | — | 0 / 2 | — |
| `Init_ReviewDate` | [Shared / Other](by-topic/shared-other.md) | [L122695](../../../ScriptDB/000_4_CreateSP.sql#L122695) | — | 0 / 0 | — |
| `Init_ReviewDateVF2VF` | [Shared / Other](by-topic/shared-other.md) | [L122738](../../../ScriptDB/000_4_CreateSP.sql#L122738) | — | 0 / 0 | — |
| `Init_RiskRatingHistory` | [Shared / Other](by-topic/shared-other.md) | [L122792](../../../ScriptDB/000_4_CreateSP.sql#L122792) | — | 0 / 0 | — |
| `Init_ScanClientPlanLink` | [Account & Plan](by-topic/account-plan.md) | [L122820](../../../ScriptDB/000_4_CreateSP.sql#L122820) | — | 0 / 0 | — |
| `Init_SetClientApproxIncomeIndexFromAmount` | [Client & KYC](by-topic/client-kyc.md) | [L122874](../../../ScriptDB/000_4_CreateSP.sql#L122874) | — | 0 / 1 | — |
| `Init_SetClientDocDeliveryMethod` | [Client & KYC](by-topic/client-kyc.md) | [L122912](../../../ScriptDB/000_4_CreateSP.sql#L122912) | — | 0 / 2 | — |
| `Init_SetElectronicDeliveryInfo` | [Shared / Other](by-topic/shared-other.md) | [L122964](../../../ScriptDB/000_4_CreateSP.sql#L122964) | — | 0 / 0 | — |
| `Init_SetExternalTransferIn` | [Notifications](by-topic/notifications.md) | [L123041](../../../ScriptDB/000_4_CreateSP.sql#L123041) | — | 0 / 0 | — |
| `Init_SetExternalTransferInOne` | [Notifications](by-topic/notifications.md) | [L123092](../../../ScriptDB/000_4_CreateSP.sql#L123092) | — | 0 / 1 | — |
| `Init_SetFundApproved` | [Fund & GIC](by-topic/fund-gic.md) | [L123315](../../../ScriptDB/000_4_CreateSP.sql#L123315) | — | 0 / 0 | — |
| `Init_SetInactiveAccountEndDate` | [Account & Plan](by-topic/account-plan.md) | [L123347](../../../ScriptDB/000_4_CreateSP.sql#L123347) | — | 0 / 0 | — |
| `Init_SetPlanFrozen4MissingKYC` | [Account & Plan](by-topic/account-plan.md) | [L123418](../../../ScriptDB/000_4_CreateSP.sql#L123418) | — | 0 / 1 | — |
| `Init_SetPlanFrozen4RepCodes` | [Account & Plan](by-topic/account-plan.md) | [L123476](../../../ScriptDB/000_4_CreateSP.sql#L123476) | — | 0 / 1 | — |
| `Init_SetPlanStartDate` | [Account & Plan](by-topic/account-plan.md) | [L123528](../../../ScriptDB/000_4_CreateSP.sql#L123528) | — | 0 / 0 | — |
| `Init_SetSupplierApproved` | [Shared / Other](by-topic/shared-other.md) | [L123577](../../../ScriptDB/000_4_CreateSP.sql#L123577) | — | 0 / 0 | — |
| `Init_SetTrustDescriptio4FeeItems` | [Commission & Fee](by-topic/commission-fee.md) | [L123609](../../../ScriptDB/000_4_CreateSP.sql#L123609) | — | 0 / 0 | — |
| `Init_SPInfo` | [Shared / Other](by-topic/shared-other.md) | [L123633](../../../ScriptDB/000_4_CreateSP.sql#L123633) | — | 0 / 0 | — |
| `Init_TransferRepCode` | [Shared / Other](by-topic/shared-other.md) | [L123657](../../../ScriptDB/000_4_CreateSP.sql#L123657) | — | 0 / 0 | — |
| `Init_TrustAccountCommission` | [Commission & Fee](by-topic/commission-fee.md) | [L123752](../../../ScriptDB/000_4_CreateSP.sql#L123752) | — | 0 / 0 | — |
| `Init_TrxConfFileCreateInit` | [Trading & Orders](by-topic/trading-orders.md) | [L123799](../../../ScriptDB/000_4_CreateSP.sql#L123799) | — | 0 / 0 | — |
| `Init_UBCompCheckClientInfoScanAll` | [Client & KYC](by-topic/client-kyc.md) | [L123837](../../../ScriptDB/000_4_CreateSP.sql#L123837) | — | 0 / 1 | — |
| `Init_UpdateCashBalance` | [Account & Plan](by-topic/account-plan.md) | [L123871](../../../ScriptDB/000_4_CreateSP.sql#L123871) | — | 0 / 0 | — |
| `Init_UpdateClientNameCAP2Proper` | [Client & KYC](by-topic/client-kyc.md) | [L123920](../../../ScriptDB/000_4_CreateSP.sql#L123920) | — | 0 / 0 | — |
| `Init_VCApp` | [Shared / Other](by-topic/shared-other.md) | [L123994](../../../ScriptDB/000_4_CreateSP.sql#L123994) | — | 0 / 0 | — |
| `InitFixTrustWHTMgmtCode` | [Account & Plan](by-topic/account-plan.md) | [L124134](../../../ScriptDB/000_4_CreateSP.sql#L124134) | — | 0 / 0 | — |
| `Jeff_MarkDeleteXTransfer` | [Notifications](by-topic/notifications.md) | [L124155](../../../ScriptDB/000_4_CreateSP.sql#L124155) | — | 0 / 0 | — |
| `MemberBankAccountVerify` | [Account & Plan](by-topic/account-plan.md) | [L124252](../../../ScriptDB/000_4_CreateSP.sql#L124252) | — | 1 / 0 | — |
| `MFDA_AccountMKVList` | [Compliance](by-topic/compliance.md) | [L124285](../../../ScriptDB/000_4_CreateSP.sql#L124285) | — | 0 / 0 | — |
| `MFDA_AccountOpening` | [Compliance](by-topic/compliance.md) | [L124332](../../../ScriptDB/000_4_CreateSP.sql#L124332) | — | 0 / 0 | — |
| `MFDA_AccountOpening_Get` | [Compliance](by-topic/compliance.md) | [L124441](../../../ScriptDB/000_4_CreateSP.sql#L124441) | — | 0 / 0 | — |
| `MFDA_AccountOpening_OPEN_With_ID` | [Compliance](by-topic/compliance.md) | [L124556](../../../ScriptDB/000_4_CreateSP.sql#L124556) | — | 0 / 0 | — |
| `MFDA_AccountOpening_OPEN_With_ID_Get` | [Compliance](by-topic/compliance.md) | [L124683](../../../ScriptDB/000_4_CreateSP.sql#L124683) | — | 0 / 0 | — |
| `MFDA_AccountOpening_OPEN_With_ID_Save` | [Compliance](by-topic/compliance.md) | [L124812](../../../ScriptDB/000_4_CreateSP.sql#L124812) | — | 1 / 0 | — |
| `MFDA_AccountOpening_Save` | [Compliance](by-topic/compliance.md) | [L125032](../../../ScriptDB/000_4_CreateSP.sql#L125032) | — | 1 / 0 | — |
| `MFDA_AccountUnitList` | [Compliance](by-topic/compliance.md) | [L125228](../../../ScriptDB/000_4_CreateSP.sql#L125228) | — | 0 / 0 | — |
| `MFDA_AccountUpdate` | [Compliance](by-topic/compliance.md) | [L125365](../../../ScriptDB/000_4_CreateSP.sql#L125365) | — | 0 / 0 | — |
| `MFDA_AltProdAccount` | [Compliance](by-topic/compliance.md) | [L125419](../../../ScriptDB/000_4_CreateSP.sql#L125419) | — | 0 / 1 | — |
| `MFDA_AltProdAccount_12f` | [Compliance](by-topic/compliance.md) | [L125503](../../../ScriptDB/000_4_CreateSP.sql#L125503) | — | 0 / 1 | — |
| `MFDA_AssetOneSupplierPerAccountDesignation` | [Compliance](by-topic/compliance.md) | [L125587](../../../ScriptDB/000_4_CreateSP.sql#L125587) | — | 0 / 0 | — |
| `MFDA_AUASurveyLine2100Details` | [Compliance](by-topic/compliance.md) | [L125670](../../../ScriptDB/000_4_CreateSP.sql#L125670) | — | 0 / 0 | — |
| `MFDA_CashTrxList` | [Compliance](by-topic/compliance.md) | [L125730](../../../ScriptDB/000_4_CreateSP.sql#L125730) | — | 0 / 0 | — |
| `MFDA_CheckForPendingReports` | [Compliance](by-topic/compliance.md) | [L125762](../../../ScriptDB/000_4_CreateSP.sql#L125762) | — | 0 / 18 | — |
| `MFDA_ClientFreeze` | [Compliance](by-topic/compliance.md) | [L125866](../../../ScriptDB/000_4_CreateSP.sql#L125866) | — | 0 / 0 | — |
| `MFDA_ClientFreezeAsOf` | [Compliance](by-topic/compliance.md) | [L125919](../../../ScriptDB/000_4_CreateSP.sql#L125919) | — | 0 / 0 | — |
| `MFDA_ClientList_AddressEmp` | [Compliance](by-topic/compliance.md) | [L125985](../../../ScriptDB/000_4_CreateSP.sql#L125985) | — | 0 / 0 | — |
| `MFDA_ClientOPEN_NoFATCA` | [Compliance](by-topic/compliance.md) | [L126063](../../../ScriptDB/000_4_CreateSP.sql#L126063) | — | 0 / 0 | — |
| `MFDA_ClientPosAdd` | [Compliance](by-topic/compliance.md) | [L126131](../../../ScriptDB/000_4_CreateSP.sql#L126131) | 1 / 1 file | 0 / 0 | [Export.cs:501](../../../UBClasses/Export.cs#L501) |
| `MFDA_ClientPosGet` | [Compliance](by-topic/compliance.md) | [L126196](../../../ScriptDB/000_4_CreateSP.sql#L126196) | — | 0 / 0 | — |
| `MFDA_ClientPosInfo` | [Compliance](by-topic/compliance.md) | [L126327](../../../ScriptDB/000_4_CreateSP.sql#L126327) | — | 0 / 0 | — |
| `MFDA_ClientPosList` | [Compliance](by-topic/compliance.md) | [L126358](../../../ScriptDB/000_4_CreateSP.sql#L126358) | — | 0 / 0 | — |
| `MFDA_ClientPosOnePlan` | [Compliance](by-topic/compliance.md) | [L126419](../../../ScriptDB/000_4_CreateSP.sql#L126419) | — | 1 / 1 | — |
| `MFDA_ClientPosProcess` | [Compliance](by-topic/compliance.md) | [L126631](../../../ScriptDB/000_4_CreateSP.sql#L126631) | — | 0 / 1 | — |
| `MFDA_ClientPosRemove` | [Compliance](by-topic/compliance.md) | [L126690](../../../ScriptDB/000_4_CreateSP.sql#L126690) | — | 0 / 0 | — |
| `MFDA_ClientPosSet` | [Compliance](by-topic/compliance.md) | [L126727](../../../ScriptDB/000_4_CreateSP.sql#L126727) | — | 0 / 0 | — |
| `MFDA_ClientZeroBalanceWithStatement` | [Compliance](by-topic/compliance.md) | [L126751](../../../ScriptDB/000_4_CreateSP.sql#L126751) | — | 0 / 0 | — |
| `MFDA_ComboList` | [Compliance](by-topic/compliance.md) | [L126791](../../../ScriptDB/000_4_CreateSP.sql#L126791) | — | 0 / 2 | — |
| `MFDA_CommEarnBySupplier` | [Compliance](by-topic/compliance.md) | [L126805](../../../ScriptDB/000_4_CreateSP.sql#L126805) | — | 0 / 0 | — |
| `MFDA_CommEarnClientProv` | [Compliance](by-topic/compliance.md) | [L126939](../../../ScriptDB/000_4_CreateSP.sql#L126939) | — | 0 / 0 | — |
| `MFDA_CommEarnRep` | [Compliance](by-topic/compliance.md) | [L127126](../../../ScriptDB/000_4_CreateSP.sql#L127126) | — | 0 / 0 | — |
| `MFDA_CR_Data` | [Compliance](by-topic/compliance.md) | [L127252](../../../ScriptDB/000_4_CreateSP.sql#L127252) | — | 0 / 0 | — |
| `MFDA_CR_FixingHouseHoldIssue` | [Compliance](by-topic/compliance.md) | [L127323](../../../ScriptDB/000_4_CreateSP.sql#L127323) | — | 0 / 1 | — |
| `MFDA_CR_Step1` | [Compliance](by-topic/compliance.md) | [L127383](../../../ScriptDB/000_4_CreateSP.sql#L127383) | — | 0 / 0 | — |
| `MFDA_CR_Step2` | [Compliance](by-topic/compliance.md) | [L127462](../../../ScriptDB/000_4_CreateSP.sql#L127462) | — | 0 / 1 | — |
| `MFDA_CR_Step3` | [Compliance](by-topic/compliance.md) | [L127673](../../../ScriptDB/000_4_CreateSP.sql#L127673) | — | 0 / 1 | — |
| `MFDA_CR_Step3_OnePlan` | [Compliance](by-topic/compliance.md) | [L127742](../../../ScriptDB/000_4_CreateSP.sql#L127742) | — | 1 / 3 | — |
| `MFDA_CR_Step3_OnePlanPos` | [Compliance](by-topic/compliance.md) | [L127955](../../../ScriptDB/000_4_CreateSP.sql#L127955) | — | 1 / 1 | — |
| `MFDA_CR_Step3_Start` | [Compliance](by-topic/compliance.md) | [L128078](../../../ScriptDB/000_4_CreateSP.sql#L128078) | — | 0 / 1 | — |
| `MFDA_CR_Step4` | [Compliance](by-topic/compliance.md) | [L128121](../../../ScriptDB/000_4_CreateSP.sql#L128121) | — | 0 / 1 | — |
| `MFDA_CR_Step4_1Client` | [Compliance](by-topic/compliance.md) | [L128180](../../../ScriptDB/000_4_CreateSP.sql#L128180) | — | 2 / 0 | — |
| `MFDA_CR_Step5` | [Compliance](by-topic/compliance.md) | [L128232](../../../ScriptDB/000_4_CreateSP.sql#L128232) | — | 0 / 0 | — |
| `MFDA_DeleteReportRequest` | [Compliance](by-topic/compliance.md) | [L128284](../../../ScriptDB/000_4_CreateSP.sql#L128284) | 1 / 1 file | 0 / 0 | [MFDAReports.cs:480](../../../UBClasses/MFDAReports.cs#L480) |
| `MFDA_ETF_AUAStats_15` | [Compliance](by-topic/compliance.md) | [L128325](../../../ScriptDB/000_4_CreateSP.sql#L128325) | — | 0 / 2 | — |
| `MFDA_ExemptAccount` | [Compliance](by-topic/compliance.md) | [L128432](../../../ScriptDB/000_4_CreateSP.sql#L128432) | — | 0 / 1 | — |
| `MFDA_ExemptAccount_Get` | [Compliance](by-topic/compliance.md) | [L128517](../../../ScriptDB/000_4_CreateSP.sql#L128517) | — | 0 / 0 | — |
| `MFDA_ExemptAccount_Save` | [Compliance](by-topic/compliance.md) | [L128634](../../../ScriptDB/000_4_CreateSP.sql#L128634) | — | 1 / 1 | — |
| `MFDA_ExemptActivity` | [Compliance](by-topic/compliance.md) | [L128807](../../../ScriptDB/000_4_CreateSP.sql#L128807) | — | 0 / 0 | — |
| `MFDA_ExemptActivity_Get` | [Compliance](by-topic/compliance.md) | [L128901](../../../ScriptDB/000_4_CreateSP.sql#L128901) | — | 0 / 0 | — |
| `MFDA_ExemptActivity_Save` | [Compliance](by-topic/compliance.md) | [L129024](../../../ScriptDB/000_4_CreateSP.sql#L129024) | — | 1 / 0 | — |
| `MFDA_ExemptAUAStats` | [Compliance](by-topic/compliance.md) | [L129213](../../../ScriptDB/000_4_CreateSP.sql#L129213) | — | 0 / 2 | — |
| `MFDA_ExemptAUAStats_12d` | [Compliance](by-topic/compliance.md) | [L129324](../../../ScriptDB/000_4_CreateSP.sql#L129324) | — | 0 / 2 | — |
| `MFDA_ExemptClientStats` | [Compliance](by-topic/compliance.md) | [L129433](../../../ScriptDB/000_4_CreateSP.sql#L129433) | — | 0 / 0 | — |
| `MFDA_FeeBasePlan_9c` | [Compliance](by-topic/compliance.md) | [L129572](../../../ScriptDB/000_4_CreateSP.sql#L129572) | — | 0 / 0 | — |
| `MFDA_FinalizeReportRequest` | [Compliance](by-topic/compliance.md) | [L129611](../../../ScriptDB/000_4_CreateSP.sql#L129611) | — | 0 / 0 | — |
| `MFDA_FormatAddressLine` | [Compliance](by-topic/compliance.md) | [L129655](../../../ScriptDB/000_4_CreateSP.sql#L129655) | — | 1 / 0 | — |
| `MFDA_FundAccountByType` | [Compliance](by-topic/compliance.md) | [L129730](../../../ScriptDB/000_4_CreateSP.sql#L129730) | — | 0 / 1 | — |
| `MFDA_FundAccountMailReturnClient` | [Compliance](by-topic/compliance.md) | [L129838](../../../ScriptDB/000_4_CreateSP.sql#L129838) | — | 0 / 0 | — |
| `MFDA_FundAccountWithKYCList` | [Compliance](by-topic/compliance.md) | [L129881](../../../ScriptDB/000_4_CreateSP.sql#L129881) | — | 0 / 0 | — |
| `MFDA_FundListHistorical` | [Compliance](by-topic/compliance.md) | [L129967](../../../ScriptDB/000_4_CreateSP.sql#L129967) | — | 0 / 0 | — |
| `MFDA_FundListHistorical_12a` | [Compliance](by-topic/compliance.md) | [L130078](../../../ScriptDB/000_4_CreateSP.sql#L130078) | — | 0 / 0 | — |
| `MFDA_FundRiskChangeCheckPlan` | [Compliance](by-topic/compliance.md) | [L130189](../../../ScriptDB/000_4_CreateSP.sql#L130189) | — | 0 / 1 | — |
| `MFDA_FundRiskChangeCheckPlanEmailEnd` | [Compliance](by-topic/compliance.md) | [L130305](../../../ScriptDB/000_4_CreateSP.sql#L130305) | — | 0 / 0 | — |
| `MFDA_FundRiskChangeCheckPlanList` | [Compliance](by-topic/compliance.md) | [L130319](../../../ScriptDB/000_4_CreateSP.sql#L130319) | — | 0 / 0 | — |
| `MFDA_GetReportRequestInfo` | [Compliance](by-topic/compliance.md) | [L130423](../../../ScriptDB/000_4_CreateSP.sql#L130423) | 1 / 1 file | 0 / 0 | [MFDAReports.cs:589](../../../UBClasses/MFDAReports.cs#L589) |
| `MFDA_GetReportRequests` | [Compliance](by-topic/compliance.md) | [L130469](../../../ScriptDB/000_4_CreateSP.sql#L130469) | 1 / 1 file | 0 / 0 | [MFDAReports.cs:524](../../../UBClasses/MFDAReports.cs#L524) |
| `MFDA_MakeReportRequest` | [Compliance](by-topic/compliance.md) | [L130545](../../../ScriptDB/000_4_CreateSP.sql#L130545) | 9 / 1 file | 0 / 0 | [MFDAReports.cs:58](../../../UBClasses/MFDAReports.cs#L58) |
| `MFDA_NetSale` | [Compliance](by-topic/compliance.md) | [L130621](../../../ScriptDB/000_4_CreateSP.sql#L130621) | 1 / 1 file | 0 / 0 | [Compliance.cs:6067](../../../UBClasses/Compliance.cs#L6067) |
| `MFDA_NewMoney` | [Compliance](by-topic/compliance.md) | [L130844](../../../ScriptDB/000_4_CreateSP.sql#L130844) | — | 0 / 0 | — |
| `MFDA_NewMoney_Get` | [Compliance](by-topic/compliance.md) | [L130965](../../../ScriptDB/000_4_CreateSP.sql#L130965) | — | 0 / 0 | — |
| `MFDA_NewMoney_Save` | [Compliance](by-topic/compliance.md) | [L131072](../../../ScriptDB/000_4_CreateSP.sql#L131072) | — | 0 / 0 | — |
| `MFDA_NewPuchase` | [Compliance](by-topic/compliance.md) | [L131282](../../../ScriptDB/000_4_CreateSP.sql#L131282) | — | 0 / 0 | — |
| `MFDA_NewPuchaseMonthly` | [Compliance](by-topic/compliance.md) | [L131368](../../../ScriptDB/000_4_CreateSP.sql#L131368) | — | 0 / 0 | — |
| `MFDA_NewPuchaseSummary` | [Compliance](by-topic/compliance.md) | [L131470](../../../ScriptDB/000_4_CreateSP.sql#L131470) | — | 0 / 0 | — |
| `MFDA_NewPuchaseSummaryNet` | [Compliance](by-topic/compliance.md) | [L131594](../../../ScriptDB/000_4_CreateSP.sql#L131594) | — | 0 / 0 | — |
| `MFDA_PEP_HIO_8c` | [Compliance](by-topic/compliance.md) | [L131807](../../../ScriptDB/000_4_CreateSP.sql#L131807) | — | 0 / 0 | — |
| `MFDA_PlanLeverageList` | [Compliance](by-topic/compliance.md) | [L131860](../../../ScriptDB/000_4_CreateSP.sql#L131860) | — | 0 / 0 | — |
| `MFDA_PlanLeverageListOneRep` | [Compliance](by-topic/compliance.md) | [L131912](../../../ScriptDB/000_4_CreateSP.sql#L131912) | — | 0 / 0 | — |
| `MFDA_PlanListByUserDefined1` | [Compliance](by-topic/compliance.md) | [L131967](../../../ScriptDB/000_4_CreateSP.sql#L131967) | — | 0 / 0 | — |
| `MFDA_PlanListFrozen` | [Compliance](by-topic/compliance.md) | [L131998](../../../ScriptDB/000_4_CreateSP.sql#L131998) | — | 0 / 0 | — |
| `MFDA_PlanListInactive` | [Compliance](by-topic/compliance.md) | [L132039](../../../ScriptDB/000_4_CreateSP.sql#L132039) | — | 0 / 0 | — |
| `MFDA_PlanListReturnMail` | [Compliance](by-topic/compliance.md) | [L132091](../../../ScriptDB/000_4_CreateSP.sql#L132091) | — | 0 / 0 | — |
| `MFDA_PlanStatsMonthly` | [Compliance](by-topic/compliance.md) | [L132146](../../../ScriptDB/000_4_CreateSP.sql#L132146) | — | 0 / 1 | — |
| `MFDA_PlanStatsMonthlyList` | [Compliance](by-topic/compliance.md) | [L132216](../../../ScriptDB/000_4_CreateSP.sql#L132216) | 1 / 1 file | 0 / 0 | [Compliance.cs:5826](../../../UBClasses/Compliance.cs#L5826) |
| `MFDA_PlanStatsMonthlyOne` | [Compliance](by-topic/compliance.md) | [L132499](../../../ScriptDB/000_4_CreateSP.sql#L132499) | — | 1 / 2 | — |
| `MFDA_PlanStatsMonthlyOneOneMgmtCode` | [Compliance](by-topic/compliance.md) | [L132700](../../../ScriptDB/000_4_CreateSP.sql#L132700) | — | 1 / 0 | — |
| `MFDA_PoliticalExposeClientList` | [Compliance](by-topic/compliance.md) | [L132906](../../../ScriptDB/000_4_CreateSP.sql#L132906) | — | 0 / 0 | — |
| `MFDA_PooledFundList` | [Compliance](by-topic/compliance.md) | [L132934](../../../ScriptDB/000_4_CreateSP.sql#L132934) | — | 0 / 1 | — |
| `MFDA_PositionBySeries` | [Compliance](by-topic/compliance.md) | [L133013](../../../ScriptDB/000_4_CreateSP.sql#L133013) | — | 0 / 0 | — |
| `MFDA_PositionFeeBased` | [Compliance](by-topic/compliance.md) | [L133059](../../../ScriptDB/000_4_CreateSP.sql#L133059) | — | 0 / 0 | — |
| `MFDA_PositionFSFile1Fund` | [Compliance](by-topic/compliance.md) | [L133105](../../../ScriptDB/000_4_CreateSP.sql#L133105) | — | 0 / 0 | — |
| `MFDA_PositionNotInFile` | [Compliance](by-topic/compliance.md) | [L133182](../../../ScriptDB/000_4_CreateSP.sql#L133182) | — | 0 / 0 | — |
| `MFDA_PreciousMetalOnlyAccount` | [Compliance](by-topic/compliance.md) | [L133251](../../../ScriptDB/000_4_CreateSP.sql#L133251) | — | 0 / 1 | — |
| `MFDA_PreciousMetalResourceAccount` | [Compliance](by-topic/compliance.md) | [L133335](../../../ScriptDB/000_4_CreateSP.sql#L133335) | — | 0 / 1 | — |
| `MFDA_PreciousMetalResourceAccount_12b` | [Compliance](by-topic/compliance.md) | [L133419](../../../ScriptDB/000_4_CreateSP.sql#L133419) | — | 0 / 1 | — |
| `MFDA_RepAssetCommList` | [Compliance](by-topic/compliance.md) | [L133507](../../../ScriptDB/000_4_CreateSP.sql#L133507) | — | 0 / 1 | — |
| `MFDA_RepLeverageRatio` | [Compliance](by-topic/compliance.md) | [L133639](../../../ScriptDB/000_4_CreateSP.sql#L133639) | — | 1 / 0 | — |
| `MFDA_RepLeverageRatioList` | [Compliance](by-topic/compliance.md) | [L133758](../../../ScriptDB/000_4_CreateSP.sql#L133758) | 1 / 1 file | 0 / 2 | [Loan.cs:1439](../../../UBClasses/Loan.cs#L1439) |
| `MFDA_ReportTypeList` | [Compliance](by-topic/compliance.md) | [L133930](../../../ScriptDB/000_4_CreateSP.sql#L133930) | — | 1 / 0 | — |
| `MFDA_ReturnMail` | [Compliance](by-topic/compliance.md) | [L133950](../../../ScriptDB/000_4_CreateSP.sql#L133950) | — | 0 / 0 | — |
| `MFDA_ReturnMail_ClientMKV` | [Compliance](by-topic/compliance.md) | [L134002](../../../ScriptDB/000_4_CreateSP.sql#L134002) | — | 0 / 0 | — |
| `MFDA_RoR_AllPlan` | [Compliance](by-topic/compliance.md) | [L134044](../../../ScriptDB/000_4_CreateSP.sql#L134044) | — | 0 / 4 | — |
| `MFDA_RoR_AllPlan_Step1` | [Compliance](by-topic/compliance.md) | [L134068](../../../ScriptDB/000_4_CreateSP.sql#L134068) | — | 1 / 0 | — |
| `MFDA_RoR_AllPlan_Step2` | [Compliance](by-topic/compliance.md) | [L134099](../../../ScriptDB/000_4_CreateSP.sql#L134099) | — | 1 / 2 | — |
| `MFDA_RoR_AllPlan_Step3` | [Compliance](by-topic/compliance.md) | [L134183](../../../ScriptDB/000_4_CreateSP.sql#L134183) | — | 1 / 0 | — |
| `MFDA_RoR_AllPlan_Step4` | [Compliance](by-topic/compliance.md) | [L134216](../../../ScriptDB/000_4_CreateSP.sql#L134216) | — | 1 / 0 | — |
| `MFDA_TradeBlotter` | [Compliance](by-topic/compliance.md) | [L134250](../../../ScriptDB/000_4_CreateSP.sql#L134250) | — | 0 / 0 | — |
| `MFDA_TradeBlotter_ETF_18` | [Compliance](by-topic/compliance.md) | [L134380](../../../ScriptDB/000_4_CreateSP.sql#L134380) | — | 0 / 0 | — |
| `MFDA_TradeBlotter_Get` | [Compliance](by-topic/compliance.md) | [L134508](../../../ScriptDB/000_4_CreateSP.sql#L134508) | — | 0 / 0 | — |
| `MFDA_TradeBlotter_Leveraged` | [Compliance](by-topic/compliance.md) | [L134633](../../../ScriptDB/000_4_CreateSP.sql#L134633) | — | 0 / 0 | — |
| `MFDA_TradeBlotter_Save` | [Compliance](by-topic/compliance.md) | [L134702](../../../ScriptDB/000_4_CreateSP.sql#L134702) | — | 1 / 0 | — |
| `MFDA_TradeBlotter_Specific` | [Compliance](by-topic/compliance.md) | [L134957](../../../ScriptDB/000_4_CreateSP.sql#L134957) | — | 0 / 0 | — |
| `MFDA_TradeBlotter2500MidHigh` | [Compliance](by-topic/compliance.md) | [L135055](../../../ScriptDB/000_4_CreateSP.sql#L135055) | — | 0 / 0 | — |
| `MFDA_TradeBlotter2500MidHigh_Get` | [Compliance](by-topic/compliance.md) | [L135180](../../../ScriptDB/000_4_CreateSP.sql#L135180) | — | 0 / 0 | — |
| `MFDA_TradeBlotter2500MidHigh_Save` | [Compliance](by-topic/compliance.md) | [L135323](../../../ScriptDB/000_4_CreateSP.sql#L135323) | — | 1 / 0 | — |
| `MFDA_TradeBlotter5000Mid` | [Compliance](by-topic/compliance.md) | [L135545](../../../ScriptDB/000_4_CreateSP.sql#L135545) | — | 0 / 0 | — |
| `MFDA_TradeBlotter5000Mid_Get` | [Compliance](by-topic/compliance.md) | [L135670](../../../ScriptDB/000_4_CreateSP.sql#L135670) | — | 0 / 0 | — |
| `MFDA_TradeBlotter5000Mid_Save` | [Compliance](by-topic/compliance.md) | [L135813](../../../ScriptDB/000_4_CreateSP.sql#L135813) | — | 1 / 0 | — |
| `MFDA_TradeBlotter50K` | [Compliance](by-topic/compliance.md) | [L136034](../../../ScriptDB/000_4_CreateSP.sql#L136034) | — | 0 / 0 | — |
| `MFDA_TradeBlotter50K_Get` | [Compliance](by-topic/compliance.md) | [L136159](../../../ScriptDB/000_4_CreateSP.sql#L136159) | — | 0 / 0 | — |
| `MFDA_TradeBlotter50K_Save` | [Compliance](by-topic/compliance.md) | [L136302](../../../ScriptDB/000_4_CreateSP.sql#L136302) | — | 1 / 0 | — |
| `MFDA_TradeBlotterBuyLev` | [Compliance](by-topic/compliance.md) | [L136522](../../../ScriptDB/000_4_CreateSP.sql#L136522) | — | 0 / 0 | — |
| `MFDA_TradeBlotterBuyLev_Get` | [Compliance](by-topic/compliance.md) | [L136666](../../../ScriptDB/000_4_CreateSP.sql#L136666) | — | 0 / 0 | — |
| `MFDA_TradeBlotterBuyLev_Save` | [Compliance](by-topic/compliance.md) | [L136795](../../../ScriptDB/000_4_CreateSP.sql#L136795) | — | 1 / 0 | — |
| `MFDA_TradeBlotterBySeries` | [Compliance](by-topic/compliance.md) | [L137067](../../../ScriptDB/000_4_CreateSP.sql#L137067) | — | 0 / 0 | — |
| `MFDA_TradeBlotterBySeries_Get` | [Compliance](by-topic/compliance.md) | [L137138](../../../ScriptDB/000_4_CreateSP.sql#L137138) | — | 0 / 0 | — |
| `MFDA_TradeBlotterBySeries_Save` | [Compliance](by-topic/compliance.md) | [L137261](../../../ScriptDB/000_4_CreateSP.sql#L137261) | — | 1 / 0 | — |
| `MFDA_TradeBlotterExempt` | [Compliance](by-topic/compliance.md) | [L137430](../../../ScriptDB/000_4_CreateSP.sql#L137430) | — | 0 / 0 | — |
| `MFDA_TradeBlotterExempt_Get` | [Compliance](by-topic/compliance.md) | [L137562](../../../ScriptDB/000_4_CreateSP.sql#L137562) | — | 0 / 0 | — |
| `MFDA_TradeBlotterExempt_Save` | [Compliance](by-topic/compliance.md) | [L137705](../../../ScriptDB/000_4_CreateSP.sql#L137705) | — | 1 / 0 | — |
| `MFDA_TradeBlotterLevOPEN` | [Compliance](by-topic/compliance.md) | [L137896](../../../ScriptDB/000_4_CreateSP.sql#L137896) | — | 0 / 0 | — |
| `MFDA_TradeBlotterLevOPEN_Get` | [Compliance](by-topic/compliance.md) | [L138021](../../../ScriptDB/000_4_CreateSP.sql#L138021) | — | 0 / 0 | — |
| `MFDA_TradeBlotterLevOPEN_Save` | [Compliance](by-topic/compliance.md) | [L138164](../../../ScriptDB/000_4_CreateSP.sql#L138164) | — | 1 / 0 | — |
| `MFDA_TradeBlotterPOA` | [Compliance](by-topic/compliance.md) | [L138384](../../../ScriptDB/000_4_CreateSP.sql#L138384) | — | 0 / 0 | — |
| `MFDA_TradeBlotterPOA_Get` | [Compliance](by-topic/compliance.md) | [L138509](../../../ScriptDB/000_4_CreateSP.sql#L138509) | — | 0 / 0 | — |
| `MFDA_TradeBlotterPOA_Save` | [Compliance](by-topic/compliance.md) | [L138652](../../../ScriptDB/000_4_CreateSP.sql#L138652) | — | 1 / 0 | — |
| `MFDA_TradeBlotterSellWithPYMT` | [Compliance](by-topic/compliance.md) | [L138872](../../../ScriptDB/000_4_CreateSP.sql#L138872) | — | 0 / 0 | — |
| `MFDA_TradeBlotterSellWithPYMT_Get` | [Compliance](by-topic/compliance.md) | [L139042](../../../ScriptDB/000_4_CreateSP.sql#L139042) | — | 0 / 0 | — |
| `MFDA_TradeBlotterSellWithPYMT_Save` | [Compliance](by-topic/compliance.md) | [L139200](../../../ScriptDB/000_4_CreateSP.sql#L139200) | — | 1 / 0 | — |
| `MFDA_TradeBlotterWithKYC` | [Compliance](by-topic/compliance.md) | [L139530](../../../ScriptDB/000_4_CreateSP.sql#L139530) | — | 0 / 0 | — |
| `MFDA_TradeBlotterWithKYC_BM` | [Compliance](by-topic/compliance.md) | [L139675](../../../ScriptDB/000_4_CreateSP.sql#L139675) | — | 0 / 0 | — |
| `MFDA_TradeBlotterWithKYC_BuySwitchIn_DSC` | [Compliance](by-topic/compliance.md) | [L139811](../../../ScriptDB/000_4_CreateSP.sql#L139811) | — | 0 / 0 | — |
| `MFDA_TradeBlotterWithKYC_BuySwitchIn_DSC_Get` | [Compliance](by-topic/compliance.md) | [L139945](../../../ScriptDB/000_4_CreateSP.sql#L139945) | — | 0 / 0 | — |
| `MFDA_TradeBlotterWithKYC_BuySwitchIn_DSC_Save` | [Compliance](by-topic/compliance.md) | [L140102](../../../ScriptDB/000_4_CreateSP.sql#L140102) | — | 1 / 0 | — |
| `MFDA_TradeBlotterWithKYC_Get` | [Compliance](by-topic/compliance.md) | [L140341](../../../ScriptDB/000_4_CreateSP.sql#L140341) | — | 0 / 0 | — |
| `MFDA_TradeBlotterWithKYC_Save` | [Compliance](by-topic/compliance.md) | [L140493](../../../ScriptDB/000_4_CreateSP.sql#L140493) | — | 1 / 0 | — |
| `MFDA_TradeBlotterWithKYCByProv` | [Compliance](by-topic/compliance.md) | [L140727](../../../ScriptDB/000_4_CreateSP.sql#L140727) | — | 0 / 0 | — |
| `MFDA_TradeBlotterWithKYCByProv_Get` | [Compliance](by-topic/compliance.md) | [L140861](../../../ScriptDB/000_4_CreateSP.sql#L140861) | — | 0 / 0 | — |
| `MFDA_TradeBlotterWithKYCByProv_Save` | [Compliance](by-topic/compliance.md) | [L141004](../../../ScriptDB/000_4_CreateSP.sql#L141004) | — | 1 / 0 | — |
| `MFDA_TradeBlotterWithMinAmount` | [Compliance](by-topic/compliance.md) | [L141237](../../../ScriptDB/000_4_CreateSP.sql#L141237) | — | 0 / 0 | — |
| `MFDA_TradeBlotterWithMinAmount_Get` | [Compliance](by-topic/compliance.md) | [L141308](../../../ScriptDB/000_4_CreateSP.sql#L141308) | — | 0 / 0 | — |
| `MFDA_TradeBlotterWithMinAmount_Save` | [Compliance](by-topic/compliance.md) | [L141433](../../../ScriptDB/000_4_CreateSP.sql#L141433) | — | 1 / 0 | — |
| `MFDA_TradeBlotterX` | [Compliance](by-topic/compliance.md) | [L141600](../../../ScriptDB/000_4_CreateSP.sql#L141600) | — | 1 / 1 | — |
| `MFDA_TrustCashBalance` | [Compliance](by-topic/compliance.md) | [L141986](../../../ScriptDB/000_4_CreateSP.sql#L141986) | — | 1 / 0 | — |
| `MFDA_TrxTradeVSSettlementList` | [Compliance](by-topic/compliance.md) | [L142170](../../../ScriptDB/000_4_CreateSP.sql#L142170) | — | 1 / 0 | — |
| `MFDA_WeeklyNewPuchase` | [Compliance](by-topic/compliance.md) | [L142389](../../../ScriptDB/000_4_CreateSP.sql#L142389) | — | 0 / 0 | — |
| `MFDAPSPFileCompare` | [Compliance](by-topic/compliance.md) | [L142494](../../../ScriptDB/000_4_CreateSP.sql#L142494) | — | 0 / 0 | — |
| `MON_FATCAInit` | [Client & KYC](by-topic/client-kyc.md) | [L142569](../../../ScriptDB/000_4_CreateSP.sql#L142569) | — | 0 / 0 | — |
| `OBCompARCComboList` | [Onboarding](by-topic/onboarding.md) | [L142746](../../../ScriptDB/000_4_CreateSP.sql#L142746) | — | 0 / 2 | — |
| `OBKYCApprovalList` | [Onboarding](by-topic/onboarding.md) | [L142771](../../../ScriptDB/000_4_CreateSP.sql#L142771) | — | 0 / 1 | — |
| `OBPlanApprovalList` | [Onboarding](by-topic/onboarding.md) | [L143077](../../../ScriptDB/000_4_CreateSP.sql#L143077) | — | 0 / 1 | — |
| `OBTrxApprovalList` | [Onboarding](by-topic/onboarding.md) | [L143303](../../../ScriptDB/000_4_CreateSP.sql#L143303) | — | 0 / 1 | — |
| `OM_SetRejectClientTrx` | [Omnibus](by-topic/omnibus.md) | [L143560](../../../ScriptDB/000_4_CreateSP.sql#L143560) | — | 0 / 0 | — |
| `OMAccountCompareClear` | [Omnibus](by-topic/omnibus.md) | [L143581](../../../ScriptDB/000_4_CreateSP.sql#L143581) | — | 0 / 0 | — |
| `OMAccountCompareClientList` | [Omnibus](by-topic/omnibus.md) | [L143608](../../../ScriptDB/000_4_CreateSP.sql#L143608) | 1 / 1 file | 0 / 0 | [AccountCompare.cs:331](../../../VFOmnibus/AccountCompare.cs#L331) |
| `OMAccountCompareStep1` | [Omnibus](by-topic/omnibus.md) | [L143837](../../../ScriptDB/000_4_CreateSP.sql#L143837) | — | 0 / 2 | — |
| `OMAccountCompareStep2` | [Omnibus](by-topic/omnibus.md) | [L143953](../../../ScriptDB/000_4_CreateSP.sql#L143953) | — | 0 / 0 | — |
| `OMAccountCompareStep3` | [Omnibus](by-topic/omnibus.md) | [L144109](../../../ScriptDB/000_4_CreateSP.sql#L144109) | 1 / 1 file | 0 / 0 | [AccountCompare.cs:252](../../../VFOmnibus/AccountCompare.cs#L252) |
| `OMAccountList` | [Omnibus](by-topic/omnibus.md) | [L144174](../../../ScriptDB/000_4_CreateSP.sql#L144174) | — | 0 / 0 | — |
| `OMCalculateOne4OmniDetail` | [Omnibus](by-topic/omnibus.md) | [L144309](../../../ScriptDB/000_4_CreateSP.sql#L144309) | — | 0 / 0 | — |
| `OMCalculateOneConfirmCashTrx` | [Omnibus](by-topic/omnibus.md) | [L144457](../../../ScriptDB/000_4_CreateSP.sql#L144457) | — | 0 / 0 | — |
| `OMCalculateOneConfirmTrx` | [Omnibus](by-topic/omnibus.md) | [L144513](../../../ScriptDB/000_4_CreateSP.sql#L144513) | — | 3 / 0 | — |
| `OMCashTrxStatusUpdate` | [Omnibus](by-topic/omnibus.md) | [L144655](../../../ScriptDB/000_4_CreateSP.sql#L144655) | 1 / 1 file | 0 / 2 | [Omnibus.cs:2263](../../../VFOmnibus/Omnibus.cs#L2263) |
| `OMCheckAllShareBalanceClientSide` | [Omnibus](by-topic/omnibus.md) | [L144751](../../../ScriptDB/000_4_CreateSP.sql#L144751) | — | 2 / 1 | — |
| `OMCheckTrx_AccountUnit_CSH` | [Omnibus](by-topic/omnibus.md) | [L144826](../../../ScriptDB/000_4_CreateSP.sql#L144826) | — | 0 / 0 | — |
| `OMCheckTrxAccountUnit` | [Omnibus](by-topic/omnibus.md) | [L144875](../../../ScriptDB/000_4_CreateSP.sql#L144875) | — | 0 / 1 | — |
| `OMConversionAddRefresh` | [Omnibus](by-topic/omnibus.md) | [L144898](../../../ScriptDB/000_4_CreateSP.sql#L144898) | 1 / 1 file | 0 / 0 | [Conversion.cs:141](../../../VFOmnibus/Conversion.cs#L141) |
| `OMConversionDetailSet` | [Omnibus](by-topic/omnibus.md) | [L145087](../../../ScriptDB/000_4_CreateSP.sql#L145087) | 1 / 1 file | 0 / 0 | [Conversion.cs:239](../../../VFOmnibus/Conversion.cs#L239) |
| `OMConversionHeaderSet` | [Omnibus](by-topic/omnibus.md) | [L145149](../../../ScriptDB/000_4_CreateSP.sql#L145149) | 1 / 1 file | 0 / 0 | [Conversion.cs:191](../../../VFOmnibus/Conversion.cs#L191) |
| `OMConversionProcess` | [Omnibus](by-topic/omnibus.md) | [L145206](../../../ScriptDB/000_4_CreateSP.sql#L145206) | 1 / 1 file | 0 / 1 | [Conversion.cs:286](../../../VFOmnibus/Conversion.cs#L286) |
| `OMConversionRemove` | [Omnibus](by-topic/omnibus.md) | [L145396](../../../ScriptDB/000_4_CreateSP.sql#L145396) | 1 / 1 file | 0 / 0 | [Conversion.cs:374](../../../VFOmnibus/Conversion.cs#L374) |
| `OMConversionSynch` | [Omnibus](by-topic/omnibus.md) | [L145423](../../../ScriptDB/000_4_CreateSP.sql#L145423) | 1 / 1 file | 0 / 1 | [Conversion.cs:330](../../../VFOmnibus/Conversion.cs#L330) |
| `OMConversionTrxFromSet` | [Omnibus](by-topic/omnibus.md) | [L145516](../../../ScriptDB/000_4_CreateSP.sql#L145516) | 1 / 1 file | 0 / 0 | [Conversion.cs:39](../../../VFOmnibus/Conversion.cs#L39) |
| `OMConversionTrxToSet` | [Omnibus](by-topic/omnibus.md) | [L145565](../../../ScriptDB/000_4_CreateSP.sql#L145565) | 1 / 1 file | 0 / 0 | [Conversion.cs:89](../../../VFOmnibus/Conversion.cs#L89) |
| `OMCreateOmnibusDetailFromFundTrx` | [Omnibus](by-topic/omnibus.md) | [L145632](../../../ScriptDB/000_4_CreateSP.sql#L145632) | — | 2 / 0 | — |
| `OMCSHUnitDescrepancy` | [Omnibus](by-topic/omnibus.md) | [L145684](../../../ScriptDB/000_4_CreateSP.sql#L145684) | — | 0 / 0 | — |
| `OMDividendAdjustmentProcess` | [Omnibus](by-topic/omnibus.md) | [L145705](../../../ScriptDB/000_4_CreateSP.sql#L145705) | — | 0 / 2 | — |
| `OMDividendPrepareOne` | [Omnibus](by-topic/omnibus.md) | [L145871](../../../ScriptDB/000_4_CreateSP.sql#L145871) | — | 0 / 0 | — |
| `OMDividendTrxInfo` | [Omnibus](by-topic/omnibus.md) | [L146031](../../../ScriptDB/000_4_CreateSP.sql#L146031) | 2 / 1 file | 0 / 1 | [Omnibus.cs:1349](../../../VFOmnibus/Omnibus.cs#L1349) |
| `OMDividendTrxProcess` | [Omnibus](by-topic/omnibus.md) | [L146447](../../../ScriptDB/000_4_CreateSP.sql#L146447) | 1 / 1 file | 0 / 2 | [Omnibus.cs:1158](../../../VFOmnibus/Omnibus.cs#L1158) |
| `OMDividendTrxProcessUndo` | [Omnibus](by-topic/omnibus.md) | [L146876](../../../ScriptDB/000_4_CreateSP.sql#L146876) | 1 / 1 file | 0 / 1 | [Omnibus.cs:1212](../../../VFOmnibus/Omnibus.cs#L1212) |
| `OMDividendTrxSynchOne` | [Omnibus](by-topic/omnibus.md) | [L146972](../../../ScriptDB/000_4_CreateSP.sql#L146972) | — | 2 / 1 | — |
| `OMDividendTrxSynchSelected` | [Omnibus](by-topic/omnibus.md) | [L147030](../../../ScriptDB/000_4_CreateSP.sql#L147030) | 1 / 1 file | 0 / 1 | [Omnibus.cs:1301](../../../VFOmnibus/Omnibus.cs#L1301) |
| `OMDividendTrxSynchTagged` | [Omnibus](by-topic/omnibus.md) | [L147059](../../../ScriptDB/000_4_CreateSP.sql#L147059) | 1 / 1 file | 0 / 1 | [Omnibus.cs:1113](../../../VFOmnibus/Omnibus.cs#L1113) |
| `OMFixCreateFundAccount` | [Omnibus](by-topic/omnibus.md) | [L147097](../../../ScriptDB/000_4_CreateSP.sql#L147097) | — | 0 / 1 | — |
| `OMFixOmnibusTrxDetailAmount` | [Omnibus](by-topic/omnibus.md) | [L147134](../../../ScriptDB/000_4_CreateSP.sql#L147134) | — | 0 / 0 | — |
| `OMFixTrxPrecision` | [Omnibus](by-topic/omnibus.md) | [L147181](../../../ScriptDB/000_4_CreateSP.sql#L147181) | — | 0 / 1 | — |
| `OMFundAccountPositionList` | [Omnibus](by-topic/omnibus.md) | [L147218](../../../ScriptDB/000_4_CreateSP.sql#L147218) | 1 / 1 file | 0 / 1 | [Omnibus.cs:577](../../../VFOmnibus/Omnibus.cs#L577) |
| `OMGenerateTrxFromOmnibusDetail` | [Omnibus](by-topic/omnibus.md) | [L147249](../../../ScriptDB/000_4_CreateSP.sql#L147249) | — | 8 / 5 | — |
| `OMGetMKV` | [Omnibus](by-topic/omnibus.md) | [L147564](../../../ScriptDB/000_4_CreateSP.sql#L147564) | — | 0 / 0 | — |
| `OMGetOmnibusAccountInfo` | [Omnibus](by-topic/omnibus.md) | [L147607](../../../ScriptDB/000_4_CreateSP.sql#L147607) | — | 1 / 0 | — |
| `OMGetOmnibusPlanID` | [Omnibus](by-topic/omnibus.md) | [L147692](../../../ScriptDB/000_4_CreateSP.sql#L147692) | — | 5 / 1 | — |
| `OMGetOmnibusRepCode` | [Omnibus](by-topic/omnibus.md) | [L147734](../../../ScriptDB/000_4_CreateSP.sql#L147734) | — | 1 / 0 | — |
| `OMIactivateUnusedFundAccount` | [Omnibus](by-topic/omnibus.md) | [L147773](../../../ScriptDB/000_4_CreateSP.sql#L147773) | — | 2 / 1 | — |
| `OMManualSwitchAdjustPACSWP` | [Omnibus](by-topic/omnibus.md) | [L147817](../../../ScriptDB/000_4_CreateSP.sql#L147817) | — | 0 / 0 | — |
| `OMManualSwitchAllFund_AllUnits` | [Omnibus](by-topic/omnibus.md) | [L147858](../../../ScriptDB/000_4_CreateSP.sql#L147858) | — | 0 / 1 | — |
| `OMManualSwitchOneFund_AllUnits` | [Omnibus](by-topic/omnibus.md) | [L147897](../../../ScriptDB/000_4_CreateSP.sql#L147897) | — | 1 / 3 | — |
| `OMMergerOmnibusTrx` | [Omnibus](by-topic/omnibus.md) | [L148080](../../../ScriptDB/000_4_CreateSP.sql#L148080) | — | 1 / 0 | — |
| `OMMonthList` | [Omnibus](by-topic/omnibus.md) | [L148160](../../../ScriptDB/000_4_CreateSP.sql#L148160) | 1 / 1 file | 0 / 0 | [OMReport.cs:87](../../../VFOmnibus/OMReport.cs#L87) |
| `OMMonthlyDataOne` | [Omnibus](by-topic/omnibus.md) | [L148181](../../../ScriptDB/000_4_CreateSP.sql#L148181) | — | 2 / 0 | — |
| `OmnibusREVActionSynch` | [Omnibus](by-topic/omnibus.md) | [L148430](../../../ScriptDB/000_4_CreateSP.sql#L148430) | 1 / 1 file | 0 / 0 | [Omnibus.cs:2220](../../../VFOmnibus/Omnibus.cs#L2220) |
| `OmnibusREVAddFromTrxList` | [Omnibus](by-topic/omnibus.md) | [L148471](../../../ScriptDB/000_4_CreateSP.sql#L148471) | 1 / 1 file | 0 / 0 | [Omnibus.cs:1604](../../../VFOmnibus/Omnibus.cs#L1604) |
| `OmnibusREVClientPendingCount` | [Omnibus](by-topic/omnibus.md) | [L148784](../../../ScriptDB/000_4_CreateSP.sql#L148784) | 1 / 1 file | 0 / 0 | [Omnibus.cs:1512](../../../VFOmnibus/Omnibus.cs#L1512) |
| `OmnibusREVClientPendingList` | [Omnibus](by-topic/omnibus.md) | [L148807](../../../ScriptDB/000_4_CreateSP.sql#L148807) | 1 / 1 file | 0 / 0 | [Omnibus.cs:1558](../../../VFOmnibus/Omnibus.cs#L1558) |
| `OmnibusREVOmnibusTrxUpdate` | [Omnibus](by-topic/omnibus.md) | [L148867](../../../ScriptDB/000_4_CreateSP.sql#L148867) | 1 / 1 file | 0 / 0 | [Omnibus.cs:2173](../../../VFOmnibus/Omnibus.cs#L2173) |
| `OmnibusREVPendingOmniFromTrxList` | [Omnibus](by-topic/omnibus.md) | [L148944](../../../ScriptDB/000_4_CreateSP.sql#L148944) | 1 / 1 file | 0 / 0 | [Omnibus.cs:1654](../../../VFOmnibus/Omnibus.cs#L1654) |
| `OmnibusREVProcessPendingOmniFromTrxList` | [Omnibus](by-topic/omnibus.md) | [L149000](../../../ScriptDB/000_4_CreateSP.sql#L149000) | 1 / 1 file | 0 / 3 | [Omnibus.cs:1699](../../../VFOmnibus/Omnibus.cs#L1699) |
| `OMNonPortfolioFundAccountSelectionUpdate` | [Omnibus](by-topic/omnibus.md) | [L149236](../../../ScriptDB/000_4_CreateSP.sql#L149236) | — | 0 / 0 | — |
| `OMOminbusReversalRemoveOneHeader` | [Omnibus](by-topic/omnibus.md) | [L149271](../../../ScriptDB/000_4_CreateSP.sql#L149271) | — | 0 / 1 | — |
| `OMOmnibusAdjustCSHTrx` | [Omnibus](by-topic/omnibus.md) | [L149314](../../../ScriptDB/000_4_CreateSP.sql#L149314) | — | 0 / 0 | — |
| `OMOmnibusCashShareBalanceRecalc` | [Omnibus](by-topic/omnibus.md) | [L149439](../../../ScriptDB/000_4_CreateSP.sql#L149439) | — | 2 / 1 | — |
| `OMOmnibusDividendSet` | [Omnibus](by-topic/omnibus.md) | [L149491](../../../ScriptDB/000_4_CreateSP.sql#L149491) | 1 / 1 file | 0 / 1 | [Omnibus.cs:232](../../../VFOmnibus/Omnibus.cs#L232) |
| `OMOmnibusFixPrecisionOneFund` | [Omnibus](by-topic/omnibus.md) | [L149676](../../../ScriptDB/000_4_CreateSP.sql#L149676) | — | 0 / 1 | — |
| `OMOmnibusMerge2Trx` | [Omnibus](by-topic/omnibus.md) | [L149753](../../../ScriptDB/000_4_CreateSP.sql#L149753) | — | 0 / 0 | — |
| `OMOmnibusMergeTrxOneDay` | [Omnibus](by-topic/omnibus.md) | [L149846](../../../ScriptDB/000_4_CreateSP.sql#L149846) | 2 / 1 file | 0 / 1 | [Omnibus.cs:2336](../../../VFOmnibus/Omnibus.cs#L2336) |
| `OMOmnibusOrderAdd` | [Omnibus](by-topic/omnibus.md) | [L149942](../../../ScriptDB/000_4_CreateSP.sql#L149942) | 1 / 1 file | 0 / 1 | [Omnibus.cs:874](../../../VFOmnibus/Omnibus.cs#L874) |
| `OMOmnibusOrderAddOne` | [Omnibus](by-topic/omnibus.md) | [L149972](../../../ScriptDB/000_4_CreateSP.sql#L149972) | — | 1 / 2 | — |
| `OMOmnibusOrderDetachInternal` | [Omnibus](by-topic/omnibus.md) | [L150083](../../../ScriptDB/000_4_CreateSP.sql#L150083) | — | 2 / 1 | — |
| `OMOmnibusOrderDetailSet` | [Omnibus](by-topic/omnibus.md) | [L150153](../../../ScriptDB/000_4_CreateSP.sql#L150153) | 1 / 1 file | 0 / 0 | [Omnibus.cs:421](../../../VFOmnibus/Omnibus.cs#L421) |
| `OMOmnibusOrderPendingDetach` | [Omnibus](by-topic/omnibus.md) | [L150308](../../../ScriptDB/000_4_CreateSP.sql#L150308) | 1 / 1 file | 0 / 1 | [Omnibus.cs:330](../../../VFOmnibus/Omnibus.cs#L330) |
| `OMOmnibusOrderPendingSet` | [Omnibus](by-topic/omnibus.md) | [L150328](../../../ScriptDB/000_4_CreateSP.sql#L150328) | 1 / 1 file | 0 / 1 | [Omnibus.cs:116](../../../VFOmnibus/Omnibus.cs#L116) |
| `OMOmnibusOrderProcessAuto` | [Omnibus](by-topic/omnibus.md) | [L150477](../../../ScriptDB/000_4_CreateSP.sql#L150477) | — | 0 / 1 | — |
| `OMOmnibusOrderProcessAutoOne` | [Omnibus](by-topic/omnibus.md) | [L150522](../../../ScriptDB/000_4_CreateSP.sql#L150522) | — | 1 / 2 | — |
| `OMOmnibusOrderRemove` | [Omnibus](by-topic/omnibus.md) | [L150591](../../../ScriptDB/000_4_CreateSP.sql#L150591) | 1 / 1 file | 0 / 1 | [Omnibus.cs:373](../../../VFOmnibus/Omnibus.cs#L373) |
| `OMOmnibusOrderSend2FundServ` | [Omnibus](by-topic/omnibus.md) | [L150624](../../../ScriptDB/000_4_CreateSP.sql#L150624) | 1 / 1 file | 0 / 1 | [Omnibus.cs:926](../../../VFOmnibus/Omnibus.cs#L926) |
| `OMOmnibusOrderSet` | [Omnibus](by-topic/omnibus.md) | [L150716](../../../ScriptDB/000_4_CreateSP.sql#L150716) | 1 / 1 file | 0 / 1 | [Omnibus.cs:172](../../../VFOmnibus/Omnibus.cs#L172) |
| `OMOmnibusOrderSetAsProcessed` | [Omnibus](by-topic/omnibus.md) | [L150944](../../../ScriptDB/000_4_CreateSP.sql#L150944) | 1 / 1 file | 0 / 0 | [Omnibus.cs:287](../../../VFOmnibus/Omnibus.cs#L287) |
| `OMOmnibusPortfolioClientList` | [Omnibus](by-topic/omnibus.md) | [L151000](../../../ScriptDB/000_4_CreateSP.sql#L151000) | — | 0 / 0 | — |
| `OMOmnibusProcessOne` | [Omnibus](by-topic/omnibus.md) | [L151051](../../../ScriptDB/000_4_CreateSP.sql#L151051) | — | 2 / 3 | — |
| `OMOmnibusProcessOneBuy` | [Omnibus](by-topic/omnibus.md) | [L151186](../../../ScriptDB/000_4_CreateSP.sql#L151186) | — | 1 / 1 | — |
| `OMOmnibusProcessOneSell` | [Omnibus](by-topic/omnibus.md) | [L151367](../../../ScriptDB/000_4_CreateSP.sql#L151367) | — | 1 / 1 | — |
| `OMOmnibusProcessTaggedItems` | [Omnibus](by-topic/omnibus.md) | [L151628](../../../ScriptDB/000_4_CreateSP.sql#L151628) | 1 / 1 file | 0 / 1 | [Omnibus.cs:975](../../../VFOmnibus/Omnibus.cs#L975) |
| `OMOmnibusREVDetailInfo` | [Omnibus](by-topic/omnibus.md) | [L151675](../../../ScriptDB/000_4_CreateSP.sql#L151675) | 1 / 1 file | 0 / 0 | [Omnibus.cs:1941](../../../VFOmnibus/Omnibus.cs#L1941) |
| `OMOmnibusREVDetailSet` | [Omnibus](by-topic/omnibus.md) | [L151700](../../../ScriptDB/000_4_CreateSP.sql#L151700) | 1 / 1 file | 0 / 0 | [Omnibus.cs:1844](../../../VFOmnibus/Omnibus.cs#L1844) |
| `OMOmnibusREVDetailSetAdjusted` | [Omnibus](by-topic/omnibus.md) | [L151837](../../../ScriptDB/000_4_CreateSP.sql#L151837) | 1 / 1 file | 0 / 0 | [Omnibus.cs:1892](../../../VFOmnibus/Omnibus.cs#L1892) |
| `OMOmnibusREVRemove` | [Omnibus](by-topic/omnibus.md) | [L151880](../../../ScriptDB/000_4_CreateSP.sql#L151880) | 1 / 1 file | 0 / 0 | [Omnibus.cs:1744](../../../VFOmnibus/Omnibus.cs#L1744) |
| `OMOmnibusREVSet` | [Omnibus](by-topic/omnibus.md) | [L151902](../../../ScriptDB/000_4_CreateSP.sql#L151902) | 1 / 1 file | 0 / 0 | [Omnibus.cs:1791](../../../VFOmnibus/Omnibus.cs#L1791) |
| `OMOmnibusShareBalanceRecalc` | [Omnibus](by-topic/omnibus.md) | [L152000](../../../ScriptDB/000_4_CreateSP.sql#L152000) | 1 / 1 file | 0 / 3 | [OMReport.cs:1027](../../../VFOmnibus/OMReport.cs#L1027) |
| `OMOmnibusSynchOne` | [Omnibus](by-topic/omnibus.md) | [L152057](../../../ScriptDB/000_4_CreateSP.sql#L152057) | — | 1 / 2 | — |
| `OMOmnibusSynchOneBuySell` | [Omnibus](by-topic/omnibus.md) | [L152138](../../../ScriptDB/000_4_CreateSP.sql#L152138) | — | 2 / 1 | — |
| `OMOmnibusSynchSelectedItem` | [Omnibus](by-topic/omnibus.md) | [L152229](../../../ScriptDB/000_4_CreateSP.sql#L152229) | 1 / 1 file | 0 / 1 | [Omnibus.cs:1021](../../../VFOmnibus/Omnibus.cs#L1021) |
| `OMOmnibusSynchTaggedItems` | [Omnibus](by-topic/omnibus.md) | [L152251](../../../ScriptDB/000_4_CreateSP.sql#L152251) | 1 / 1 file | 0 / 1 | [Omnibus.cs:1067](../../../VFOmnibus/Omnibus.cs#L1067) |
| `OMOmnibusTrxChangeSourceID` | [Omnibus](by-topic/omnibus.md) | [L152304](../../../ScriptDB/000_4_CreateSP.sql#L152304) | — | 0 / 0 | — |
| `OMOmnibusTrxDetailSet` | [Omnibus](by-topic/omnibus.md) | [L152333](../../../ScriptDB/000_4_CreateSP.sql#L152333) | 1 / 1 file | 0 / 0 | [Omnibus.cs:475](../../../VFOmnibus/Omnibus.cs#L475) |
| `OMOmnibusTrxRevolvingSelectionUpdate` | [Omnibus](by-topic/omnibus.md) | [L152470](../../../ScriptDB/000_4_CreateSP.sql#L152470) | — | 0 / 0 | — |
| `OMOmnibusTrxSelectionUpdate` | [Omnibus](by-topic/omnibus.md) | [L152523](../../../ScriptDB/000_4_CreateSP.sql#L152523) | — | 0 / 0 | — |
| `OMOmnibusTrxSetAsProcessed` | [Omnibus](by-topic/omnibus.md) | [L152558](../../../ScriptDB/000_4_CreateSP.sql#L152558) | — | 0 / 0 | — |
| `OMOrderPending2OmnibusProcess` | [Omnibus](by-topic/omnibus.md) | [L152586](../../../ScriptDB/000_4_CreateSP.sql#L152586) | 1 / 1 file | 0 / 1 | [Omnibus.cs:826](../../../VFOmnibus/Omnibus.cs#L826) |
| `OMOrderPending2OmnibusProcessOne` | [Omnibus](by-topic/omnibus.md) | [L152742](../../../ScriptDB/000_4_CreateSP.sql#L152742) | — | 1 / 3 | — |
| `OMOrderPendingSet` | [Omnibus](by-topic/omnibus.md) | [L153088](../../../ScriptDB/000_4_CreateSP.sql#L153088) | 1 / 1 file | 0 / 1 | [Omnibus.cs:43](../../../VFOmnibus/Omnibus.cs#L43) |
| `OMOrderSelectionUpdate` | [Omnibus](by-topic/omnibus.md) | [L153415](../../../ScriptDB/000_4_CreateSP.sql#L153415) | — | 0 / 0 | — |
| `OMPlanPortfolioDescriptionUpdate` | [Omnibus](by-topic/omnibus.md) | [L153450](../../../ScriptDB/000_4_CreateSP.sql#L153450) | — | 0 / 0 | — |
| `OMPlanSwitchPortfolio` | [Omnibus](by-topic/omnibus.md) | [L153483](../../../ScriptDB/000_4_CreateSP.sql#L153483) | 1 / 1 file | 0 / 2 | [Switch.cs:38](../../../VFOmnibus/Switch.cs#L38) |
| `OMPlanSwitchPortfolio_Old` | [Omnibus](by-topic/omnibus.md) | [L153708](../../../ScriptDB/000_4_CreateSP.sql#L153708) | — | 0 / 5 | — |
| `OMPlanSwitchPortfolio_Step1` | [Omnibus](by-topic/omnibus.md) | [L154047](../../../ScriptDB/000_4_CreateSP.sql#L154047) | — | 0 / 2 | — |
| `OMPlanSwitchPortfolio_Step2` | [Omnibus](by-topic/omnibus.md) | [L154254](../../../ScriptDB/000_4_CreateSP.sql#L154254) | — | 1 / 5 | — |
| `OMRecalcAllSince` | [Omnibus](by-topic/omnibus.md) | [L154468](../../../ScriptDB/000_4_CreateSP.sql#L154468) | — | 0 / 1 | — |
| `OMRecalcAvgShareBalanceAllFundAccounts` | [Omnibus](by-topic/omnibus.md) | [L154502](../../../ScriptDB/000_4_CreateSP.sql#L154502) | — | 0 / 1 | — |
| `OMRecalcAvgShareBalanceFundAccountSince` | [Omnibus](by-topic/omnibus.md) | [L154541](../../../ScriptDB/000_4_CreateSP.sql#L154541) | — | 1 / 1 | — |
| `OMRecalcAvgShareBalanceOneFundAccount` | [Omnibus](by-topic/omnibus.md) | [L154589](../../../ScriptDB/000_4_CreateSP.sql#L154589) | — | 18 / 0 | — |
| `OMRecalcAvgShareBalanceOneFundAccountOmniside` | [Omnibus](by-topic/omnibus.md) | [L154722](../../../ScriptDB/000_4_CreateSP.sql#L154722) | — | 7 / 0 | — |
| `OMRecalcAvgShareBalanceOnePlan` | [Omnibus](by-topic/omnibus.md) | [L154882](../../../ScriptDB/000_4_CreateSP.sql#L154882) | — | 0 / 1 | — |
| `OMReportAssetByProvince` | [Omnibus](by-topic/omnibus.md) | [L154917](../../../ScriptDB/000_4_CreateSP.sql#L154917) | 1 / 1 file | 0 / 0 | [OMReport.cs:1144](../../../VFOmnibus/OMReport.cs#L1144) |
| `OMReportDAVPortfolioCalc` | [Omnibus](by-topic/omnibus.md) | [L155065](../../../ScriptDB/000_4_CreateSP.sql#L155065) | 1 / 1 file | 0 / 1 | [OMReport.cs:836](../../../VFOmnibus/OMReport.cs#L836) |
| `OMReportDAVPortfolioCalc1Portfolio` | [Omnibus](by-topic/omnibus.md) | [L155141](../../../ScriptDB/000_4_CreateSP.sql#L155141) | — | 1 / 1 | — |
| `OMReportDAVPortfolioCalc1Portfolio1Fund` | [Omnibus](by-topic/omnibus.md) | [L155209](../../../ScriptDB/000_4_CreateSP.sql#L155209) | — | 1 / 0 | — |
| `OMReportHeaderList` | [Omnibus](by-topic/omnibus.md) | [L155325](../../../ScriptDB/000_4_CreateSP.sql#L155325) | 1 / 1 file | 0 / 0 | [OMReport.cs:247](../../../VFOmnibus/OMReport.cs#L247) |
| `OMReportMonthlyDAVDetailList` | [Omnibus](by-topic/omnibus.md) | [L155373](../../../ScriptDB/000_4_CreateSP.sql#L155373) | 1 / 1 file | 0 / 0 | [OMReport.cs:784](../../../VFOmnibus/OMReport.cs#L784) |
| `OMReportNonPortfolioFundAccountList` | [Omnibus](by-topic/omnibus.md) | [L155484](../../../ScriptDB/000_4_CreateSP.sql#L155484) | 1 / 1 file | 0 / 0 | [Omnibus.cs:2382](../../../VFOmnibus/Omnibus.cs#L2382) |
| `OMReportNonPortfolioFundAccountSell` | [Omnibus](by-topic/omnibus.md) | [L155652](../../../ScriptDB/000_4_CreateSP.sql#L155652) | 1 / 1 file | 0 / 1 | [Omnibus.cs:2473](../../../VFOmnibus/Omnibus.cs#L2473) |
| `OMReportNonPortfolioFundAccountSellOne` | [Omnibus](by-topic/omnibus.md) | [L155688](../../../ScriptDB/000_4_CreateSP.sql#L155688) | — | 1 / 1 | — |
| `OMReportSaleByAdvisor` | [Omnibus](by-topic/omnibus.md) | [L155751](../../../ScriptDB/000_4_CreateSP.sql#L155751) | 1 / 1 file | 0 / 0 | [OMReport.cs:1067](../../../VFOmnibus/OMReport.cs#L1067) |
| `OMReportShareholderMonthly` | [Omnibus](by-topic/omnibus.md) | [L155966](../../../ScriptDB/000_4_CreateSP.sql#L155966) | 1 / 1 file | 0 / 1 | [OMReport.cs:907](../../../VFOmnibus/OMReport.cs#L907) |
| `OMReportShareholderMonthlyRecalc` | [Omnibus](by-topic/omnibus.md) | [L156110](../../../ScriptDB/000_4_CreateSP.sql#L156110) | 1 / 1 file | 0 / 1 | [OMReport.cs:982](../../../VFOmnibus/OMReport.cs#L982) |
| `OMReportWeeklyCalc` | [Omnibus](by-topic/omnibus.md) | [L156135](../../../ScriptDB/000_4_CreateSP.sql#L156135) | 1 / 1 file | 0 / 0 | [OMReport.cs:138](../../../VFOmnibus/OMReport.cs#L138) |
| `OMReportWeeklyDetailByAdvisorList` | [Omnibus](by-topic/omnibus.md) | [L156350](../../../ScriptDB/000_4_CreateSP.sql#L156350) | 1 / 1 file | 0 / 0 | [OMReport.cs:304](../../../VFOmnibus/OMReport.cs#L304) |
| `OMReportWeeklyDetailByBranchList` | [Omnibus](by-topic/omnibus.md) | [L156577](../../../ScriptDB/000_4_CreateSP.sql#L156577) | 1 / 1 file | 0 / 0 | [OMReport.cs:395](../../../VFOmnibus/OMReport.cs#L395) |
| `OMReportWeeklyDetailByFundList` | [Omnibus](by-topic/omnibus.md) | [L156629](../../../ScriptDB/000_4_CreateSP.sql#L156629) | 1 / 1 file | 0 / 0 | [OMReport.cs:630](../../../VFOmnibus/OMReport.cs#L630) |
| `OMReportWeeklyDetailByPortfolioList` | [Omnibus](by-topic/omnibus.md) | [L156686](../../../ScriptDB/000_4_CreateSP.sql#L156686) | 1 / 1 file | 0 / 0 | [OMReport.cs:474](../../../VFOmnibus/OMReport.cs#L474) |
| `OMReportWeeklyDetailByPortfolioRepList` | [Omnibus](by-topic/omnibus.md) | [L156737](../../../ScriptDB/000_4_CreateSP.sql#L156737) | 1 / 1 file | 0 / 0 | [OMReport.cs:528](../../../VFOmnibus/OMReport.cs#L528) |
| `OMReportWeeklyHeaderSummary` | [Omnibus](by-topic/omnibus.md) | [L156795](../../../ScriptDB/000_4_CreateSP.sql#L156795) | 1 / 1 file | 0 / 0 | [OMReport.cs:708](../../../VFOmnibus/OMReport.cs#L708) |
| `OMREVTrxAdjustedUpdate` | [Omnibus](by-topic/omnibus.md) | [L156870](../../../ScriptDB/000_4_CreateSP.sql#L156870) | 1 / 1 file | 0 / 0 | [Omnibus.cs:2125](../../../VFOmnibus/Omnibus.cs#L2125) |
| `OMREVTrxAdjustOnePos` | [Omnibus](by-topic/omnibus.md) | [L156903](../../../ScriptDB/000_4_CreateSP.sql#L156903) | — | 1 / 1 | — |
| `OMREVTrxProcess` | [Omnibus](by-topic/omnibus.md) | [L156987](../../../ScriptDB/000_4_CreateSP.sql#L156987) | 1 / 1 file | 0 / 5 | [Omnibus.cs:2028](../../../VFOmnibus/Omnibus.cs#L2028) |
| `OMREVTrxProcessOne` | [Omnibus](by-topic/omnibus.md) | [L157129](../../../ScriptDB/000_4_CreateSP.sql#L157129) | — | 0 / 2 | — |
| `OMREVTrxProcessOneItem` | [Omnibus](by-topic/omnibus.md) | [L157294](../../../ScriptDB/000_4_CreateSP.sql#L157294) | 1 / 1 file | 0 / 2 | [Omnibus.cs:1986](../../../VFOmnibus/Omnibus.cs#L1986) |
| `OMREVTrxProcessOnePos` | [Omnibus](by-topic/omnibus.md) | [L157464](../../../ScriptDB/000_4_CreateSP.sql#L157464) | — | 1 / 2 | — |
| `OMREVTrxStatusUpdate` | [Omnibus](by-topic/omnibus.md) | [L157606](../../../ScriptDB/000_4_CreateSP.sql#L157606) | 1 / 1 file | 0 / 1 | [Omnibus.cs:2074](../../../VFOmnibus/Omnibus.cs#L2074) |
| `OMScanOmnibusAccounts` | [Omnibus](by-topic/omnibus.md) | [L157758](../../../ScriptDB/000_4_CreateSP.sql#L157758) | — | 2 / 1 | — |
| `OMSetTrxAsCancelled` | [Omnibus](by-topic/omnibus.md) | [L157818](../../../ScriptDB/000_4_CreateSP.sql#L157818) | — | 0 / 0 | — |
| `OMSwitchList1Client` | [Omnibus](by-topic/omnibus.md) | [L157899](../../../ScriptDB/000_4_CreateSP.sql#L157899) | 1 / 1 file | 0 / 0 | [Switch.cs:88](../../../VFOmnibus/Switch.cs#L88) |
| `OMSwitchOneFund` | [Omnibus](by-topic/omnibus.md) | [L157934](../../../ScriptDB/000_4_CreateSP.sql#L157934) | — | 1 / 1 | — |
| `OMSwitchOneFund_Step1` | [Omnibus](by-topic/omnibus.md) | [L158038](../../../ScriptDB/000_4_CreateSP.sql#L158038) | — | 0 / 0 | — |
| `OMSwitchOneFund_Step2` | [Omnibus](by-topic/omnibus.md) | [L158130](../../../ScriptDB/000_4_CreateSP.sql#L158130) | — | 0 / 1 | — |
| `OMSwitchOneFundOnePos` | [Omnibus](by-topic/omnibus.md) | [L158163](../../../ScriptDB/000_4_CreateSP.sql#L158163) | — | 1 / 4 | — |
| `OMSwitchProcess` | [Omnibus](by-topic/omnibus.md) | [L158407](../../../ScriptDB/000_4_CreateSP.sql#L158407) | — | 0 / 0 | — |
| `OMSwitchRemove` | [Omnibus](by-topic/omnibus.md) | [L158505](../../../ScriptDB/000_4_CreateSP.sql#L158505) | 1 / 1 file | 0 / 1 | [Switch.cs:134](../../../VFOmnibus/Switch.cs#L134) |
| `OMSwitchRescan` | [Omnibus](by-topic/omnibus.md) | [L158618](../../../ScriptDB/000_4_CreateSP.sql#L158618) | 1 / 1 file | 1 / 2 | [Switch.cs:175](../../../VFOmnibus/Switch.cs#L175) |
| `OMSwitchRescan_OLd` | [Omnibus](by-topic/omnibus.md) | [L158667](../../../ScriptDB/000_4_CreateSP.sql#L158667) | — | 0 / 2 | — |
| `OMSwitchRescanAll` | [Omnibus](by-topic/omnibus.md) | [L158839](../../../ScriptDB/000_4_CreateSP.sql#L158839) | — | 0 / 1 | — |
| `OMSynchAll` | [Omnibus](by-topic/omnibus.md) | [L158863](../../../ScriptDB/000_4_CreateSP.sql#L158863) | — | 0 / 1 | — |
| `OMSynchOne` | [Omnibus](by-topic/omnibus.md) | [L158904](../../../ScriptDB/000_4_CreateSP.sql#L158904) | — | 1 / 3 | — |
| `OMSynchOneBuy` | [Omnibus](by-topic/omnibus.md) | [L159050](../../../ScriptDB/000_4_CreateSP.sql#L159050) | — | 2 / 1 | — |
| `OMSynchOneSell` | [Omnibus](by-topic/omnibus.md) | [L159282](../../../ScriptDB/000_4_CreateSP.sql#L159282) | — | 2 / 1 | — |
| `OMTransferAdd` | [Omnibus](by-topic/omnibus.md) | [L159537](../../../ScriptDB/000_4_CreateSP.sql#L159537) | 1 / 1 file | 0 / 1 | [Transfer.cs:36](../../../VFOmnibus/Transfer.cs#L36) |
| `OMTransferDetailList` | [Omnibus](by-topic/omnibus.md) | [L159884](../../../ScriptDB/000_4_CreateSP.sql#L159884) | 1 / 1 file | 0 / 0 | [Transfer.cs:268](../../../VFOmnibus/Transfer.cs#L268) |
| `OMTransferFixAverageCost` | [Omnibus](by-topic/omnibus.md) | [L159979](../../../ScriptDB/000_4_CreateSP.sql#L159979) | — | 0 / 1 | — |
| `OMTransferList` | [Omnibus](by-topic/omnibus.md) | [L160027](../../../ScriptDB/000_4_CreateSP.sql#L160027) | 1 / 1 file | 0 / 0 | [Transfer.cs:213](../../../VFOmnibus/Transfer.cs#L213) |
| `OMTransferList1Client` | [Omnibus](by-topic/omnibus.md) | [L160124](../../../ScriptDB/000_4_CreateSP.sql#L160124) | 1 / 1 file | 0 / 0 | [Transfer.cs:317](../../../VFOmnibus/Transfer.cs#L317) |
| `OMTransferProcess` | [Omnibus](by-topic/omnibus.md) | [L160162](../../../ScriptDB/000_4_CreateSP.sql#L160162) | 1 / 1 file | 0 / 6 | [Transfer.cs:125](../../../VFOmnibus/Transfer.cs#L125) |
| `OMTransferRemove` | [Omnibus](by-topic/omnibus.md) | [L160684](../../../ScriptDB/000_4_CreateSP.sql#L160684) | 1 / 1 file | 0 / 1 | [Transfer.cs:84](../../../VFOmnibus/Transfer.cs#L84) |
| `OMTransferScanOutStanding` | [Omnibus](by-topic/omnibus.md) | [L160796](../../../ScriptDB/000_4_CreateSP.sql#L160796) | 1 / 1 file | 0 / 1 | [Transfer.cs:166](../../../VFOmnibus/Transfer.cs#L166) |
| `OMTransferScanOutStandingOne` | [Omnibus](by-topic/omnibus.md) | [L160830](../../../ScriptDB/000_4_CreateSP.sql#L160830) | — | 1 / 8 | — |
| `OMTrxListByPlanIDTradeDateSet` | [Omnibus](by-topic/omnibus.md) | [L161307](../../../ScriptDB/000_4_CreateSP.sql#L161307) | 1 / 1 file | 0 / 0 | [Omnibus.cs:1462](../../../VFOmnibus/Omnibus.cs#L1462) |
| `OMVerifyClientSideBalance` | [Omnibus](by-topic/omnibus.md) | [L161409](../../../ScriptDB/000_4_CreateSP.sql#L161409) | — | 0 / 0 | — |
| `OMWeekDatesList` | [Omnibus](by-topic/omnibus.md) | [L161462](../../../ScriptDB/000_4_CreateSP.sql#L161462) | 1 / 1 file | 0 / 0 | [OMReport.cs:37](../../../VFOmnibus/OMReport.cs#L37) |
| `PHX_CON_Client` | [Client & KYC](by-topic/client-kyc.md) | [L161487](../../../ScriptDB/000_4_CreateSP.sql#L161487) | — | 0 / 0 | — |
| `PHX_CON_DistList_One` | [Shared / Other](by-topic/shared-other.md) | [L161809](../../../ScriptDB/000_4_CreateSP.sql#L161809) | — | 1 / 0 | — |
| `PHX_CON_DistListAll` | [Shared / Other](by-topic/shared-other.md) | [L161983](../../../ScriptDB/000_4_CreateSP.sql#L161983) | — | 0 / 1 | — |
| `PHX_CON_DistTrx` | [Trading & Orders](by-topic/trading-orders.md) | [L162012](../../../ScriptDB/000_4_CreateSP.sql#L162012) | — | 0 / 1 | — |
| `PHX_CON_DistTrx_One` | [Trading & Orders](by-topic/trading-orders.md) | [L162061](../../../ScriptDB/000_4_CreateSP.sql#L162061) | — | 1 / 0 | — |
| `PHX_CON_Docs` | [Documents & PDF](by-topic/documents-pdf.md) | [L162253](../../../ScriptDB/000_4_CreateSP.sql#L162253) | — | 0 / 0 | — |
| `PHX_CON_ETFTrxStep1` | [Fund & GIC](by-topic/fund-gic.md) | [L162335](../../../ScriptDB/000_4_CreateSP.sql#L162335) | — | 0 / 1 | — |
| `PHX_CON_ETFTrxStep2` | [Fund & GIC](by-topic/fund-gic.md) | [L162376](../../../ScriptDB/000_4_CreateSP.sql#L162376) | — | 0 / 2 | — |
| `PHX_CON_FixETFGrossAmount4Buy` | [Fund & GIC](by-topic/fund-gic.md) | [L162406](../../../ScriptDB/000_4_CreateSP.sql#L162406) | — | 0 / 0 | — |
| `PHX_CON_FundAccountAllPlans` | [Fund & GIC](by-topic/fund-gic.md) | [L162445](../../../ScriptDB/000_4_CreateSP.sql#L162445) | — | 0 / 1 | — |
| `PHX_CON_FundAccountOnePlan` | [Fund & GIC](by-topic/fund-gic.md) | [L162469](../../../ScriptDB/000_4_CreateSP.sql#L162469) | — | 2 / 0 | — |
| `PHX_CON_FundTrxStep1` | [Fund & GIC](by-topic/fund-gic.md) | [L162560](../../../ScriptDB/000_4_CreateSP.sql#L162560) | — | 0 / 0 | — |
| `PHX_CON_FundTrxStep2` | [Fund & GIC](by-topic/fund-gic.md) | [L162623](../../../ScriptDB/000_4_CreateSP.sql#L162623) | — | 0 / 0 | — |
| `PHX_CON_FundTrxStep3` | [Fund & GIC](by-topic/fund-gic.md) | [L162691](../../../ScriptDB/000_4_CreateSP.sql#L162691) | — | 0 / 1 | — |
| `PHX_CON_FundTrxStep4` | [Fund & GIC](by-topic/fund-gic.md) | [L162711](../../../ScriptDB/000_4_CreateSP.sql#L162711) | — | 0 / 1 | — |
| `PHX_CON_FundTrxStep4_0` | [Fund & GIC](by-topic/fund-gic.md) | [L162735](../../../ScriptDB/000_4_CreateSP.sql#L162735) | — | 0 / 2 | — |
| `PHX_CON_PAC_Setting_All` | [Shared / Other](by-topic/shared-other.md) | [L162772](../../../ScriptDB/000_4_CreateSP.sql#L162772) | — | 0 / 1 | — |
| `PHX_CON_PAC_Setting_One` | [Shared / Other](by-topic/shared-other.md) | [L162818](../../../ScriptDB/000_4_CreateSP.sql#L162818) | — | 1 / 0 | — |
| `PHX_CON_Plan` | [Account & Plan](by-topic/account-plan.md) | [L162914](../../../ScriptDB/000_4_CreateSP.sql#L162914) | — | 0 / 2 | — |
| `PHX_CON_PlanBen` | [Account & Plan](by-topic/account-plan.md) | [L163138](../../../ScriptDB/000_4_CreateSP.sql#L163138) | — | 1 / 2 | — |
| `PHX_CON_SWP_Setting_All` | [Shared / Other](by-topic/shared-other.md) | [L163216](../../../ScriptDB/000_4_CreateSP.sql#L163216) | — | 0 / 1 | — |
| `PHX_CON_SWP_Setting_One` | [Shared / Other](by-topic/shared-other.md) | [L163262](../../../ScriptDB/000_4_CreateSP.sql#L163262) | — | 1 / 0 | — |
| `PHX_CON_Trust_All` | [Account & Plan](by-topic/account-plan.md) | [L163412](../../../ScriptDB/000_4_CreateSP.sql#L163412) | — | 0 / 1 | — |
| `PHX_CON_Trust_All_Excel` | [Account & Plan](by-topic/account-plan.md) | [L163437](../../../ScriptDB/000_4_CreateSP.sql#L163437) | — | 0 / 1 | — |
| `PHX_CON_Trust_One` | [Account & Plan](by-topic/account-plan.md) | [L163462](../../../ScriptDB/000_4_CreateSP.sql#L163462) | — | 1 / 0 | — |
| `PHX_CON_Trust_One_Excel` | [Account & Plan](by-topic/account-plan.md) | [L163577](../../../ScriptDB/000_4_CreateSP.sql#L163577) | — | 1 / 0 | — |
| `PHX_CON_Trx_ETF_One` | [Fund & GIC](by-topic/fund-gic.md) | [L163672](../../../ScriptDB/000_4_CreateSP.sql#L163672) | — | 1 / 0 | — |
| `PHX_CON_Trx_ETF_One_TrnfIn` | [Fund & GIC](by-topic/fund-gic.md) | [L163904](../../../ScriptDB/000_4_CreateSP.sql#L163904) | — | 1 / 0 | — |
| `PHX_CON_Trx_MF_One` | [Trading & Orders](by-topic/trading-orders.md) | [L164022](../../../ScriptDB/000_4_CreateSP.sql#L164022) | — | 1 / 0 | — |
| `PHX_CON_Trx_MF_One_SwitchOutFix` | [Trading & Orders](by-topic/trading-orders.md) | [L164315](../../../ScriptDB/000_4_CreateSP.sql#L164315) | — | 0 / 0 | — |
| `PHX_CON_Trx_MF_One_TrnfIn` | [Trading & Orders](by-topic/trading-orders.md) | [L164563](../../../ScriptDB/000_4_CreateSP.sql#L164563) | — | 1 / 0 | — |
| `PHX_CON_Trx_MF_One_TrnfIn_1` | [Trading & Orders](by-topic/trading-orders.md) | [L164720](../../../ScriptDB/000_4_CreateSP.sql#L164720) | — | 0 / 0 | — |
| `PHX_CON_UserRep` | [Shared / Other](by-topic/shared-other.md) | [L164837](../../../ScriptDB/000_4_CreateSP.sql#L164837) | — | 0 / 0 | — |
| `PHX_ListTransferOutIn_ETF` | [Fund & GIC](by-topic/fund-gic.md) | [L165012](../../../ScriptDB/000_4_CreateSP.sql#L165012) | — | 0 / 0 | — |
| `PHX_ListTransferOutIn_Fund` | [Fund & GIC](by-topic/fund-gic.md) | [L165068](../../../ScriptDB/000_4_CreateSP.sql#L165068) | — | 0 / 0 | — |
| `PlanLoanList` | [Account & Plan](by-topic/account-plan.md) | [L165124](../../../ScriptDB/000_4_CreateSP.sql#L165124) | — | 0 / 1 | — |
| `PSC_Conv_MergeAccount` | [Account & Plan](by-topic/account-plan.md) | [L165372](../../../ScriptDB/000_4_CreateSP.sql#L165372) | — | 0 / 1 | — |
| `PSC_Conv_MergeAccount_Step1` | [Account & Plan](by-topic/account-plan.md) | [L165427](../../../ScriptDB/000_4_CreateSP.sql#L165427) | — | 0 / 0 | — |
| `PSC_Conv_MergeAccount_Step2` | [Account & Plan](by-topic/account-plan.md) | [L165468](../../../ScriptDB/000_4_CreateSP.sql#L165468) | — | 0 / 1 | — |
| `PSC_Conv_MergeAccount_Step3` | [Account & Plan](by-topic/account-plan.md) | [L165512](../../../ScriptDB/000_4_CreateSP.sql#L165512) | — | 0 / 1 | — |
| `PSC_Conv_MergeAccountOne` | [Account & Plan](by-topic/account-plan.md) | [L165539](../../../ScriptDB/000_4_CreateSP.sql#L165539) | — | 2 / 0 | — |
| `PSC_Move1CashAccount` | [Account & Plan](by-topic/account-plan.md) | [L165617](../../../ScriptDB/000_4_CreateSP.sql#L165617) | — | 1 / 0 | — |
| `PSC_Move1FundAccount` | [Fund & GIC](by-topic/fund-gic.md) | [L165650](../../../ScriptDB/000_4_CreateSP.sql#L165650) | — | 1 / 0 | — |
| `PSC_Move1Plan` | [Account & Plan](by-topic/account-plan.md) | [L165765](../../../ScriptDB/000_4_CreateSP.sql#L165765) | — | 1 / 2 | — |
| `PSC_Step_1` | [Shared / Other](by-topic/shared-other.md) | [L165860](../../../ScriptDB/000_4_CreateSP.sql#L165860) | — | 0 / 0 | — |
| `PSC_Step2` | [Shared / Other](by-topic/shared-other.md) | [L165919](../../../ScriptDB/000_4_CreateSP.sql#L165919) | — | 0 / 1 | — |
| `QFixMSGItemValue` | [Shared / Other](by-topic/shared-other.md) | [L165952](../../../ScriptDB/000_4_CreateSP.sql#L165952) | — | 2 / 1 | — |
| `RESP_Plan300` | [Account & Plan](by-topic/account-plan.md) | [L165979](../../../ScriptDB/000_4_CreateSP.sql#L165979) | — | 0 / 1 | — |
| `RESP_PlanOne` | [Account & Plan](by-topic/account-plan.md) | [L166006](../../../ScriptDB/000_4_CreateSP.sql#L166006) | — | 1 / 2 | — |
| `SetTaggedItemsPendingStatus` | [Shared / Other](by-topic/shared-other.md) | [L166162](../../../ScriptDB/000_4_CreateSP.sql#L166162) | — | 0 / 0 | — |
| `SKClientOrderList` | [Client & KYC](by-topic/client-kyc.md) | [L166184](../../../ScriptDB/000_4_CreateSP.sql#L166184) | 1 / 1 file | 0 / 0 | [Stock.cs:637](../../../UBClasses/Stock.cs#L637) |
| `SKDailyTrxExportList` | [Trading & Orders](by-topic/trading-orders.md) | [L166232](../../../ScriptDB/000_4_CreateSP.sql#L166232) | — | 1 / 0 | — |
| `SKDailyTrxExportList2Scotia` | [Trading & Orders](by-topic/trading-orders.md) | [L166308](../../../ScriptDB/000_4_CreateSP.sql#L166308) | — | 0 / 0 | — |
| `SKDailyTrxExportList2ScotiaOmni` | [Trading & Orders](by-topic/trading-orders.md) | [L166387](../../../ScriptDB/000_4_CreateSP.sql#L166387) | — | 1 / 1 | — |
| `SKFixPartialBuy2Filled` | [Shared / Other](by-topic/shared-other.md) | [L166484](../../../ScriptDB/000_4_CreateSP.sql#L166484) | — | 0 / 0 | — |
| `SKOmnibusAccountDetailList` | [Account & Plan](by-topic/account-plan.md) | [L166549](../../../ScriptDB/000_4_CreateSP.sql#L166549) | 1 / 1 file | 1 / 0 | [Stock.cs:854](../../../UBClasses/Stock.cs#L854) |
| `SKOmnibusAccountList` | [Account & Plan](by-topic/account-plan.md) | [L166739](../../../ScriptDB/000_4_CreateSP.sql#L166739) | 1 / 1 file | 0 / 1 | [Stock.cs:795](../../../UBClasses/Stock.cs#L795) |
| `SKOmnibusAccountSelectionUpdate` | [Account & Plan](by-topic/account-plan.md) | [L166881](../../../ScriptDB/000_4_CreateSP.sql#L166881) | — | 0 / 0 | — |
| `SKOmnibusDividendDetail` | [Shared / Other](by-topic/shared-other.md) | [L166917](../../../ScriptDB/000_4_CreateSP.sql#L166917) | 1 / 1 file | 0 / 0 | [ETFOrder.cs:857](../../../UBClasses/ETFOrder.cs#L857) |
| `SKOmnibusDividendDetail_Remove` | [Shared / Other](by-topic/shared-other.md) | [L167143](../../../ScriptDB/000_4_CreateSP.sql#L167143) | — | 0 / 0 | — |
| `SKOmnibusDividendInfo` | [Shared / Other](by-topic/shared-other.md) | [L167319](../../../ScriptDB/000_4_CreateSP.sql#L167319) | 1 / 1 file | 0 / 0 | [ETFOrder.cs:811](../../../UBClasses/ETFOrder.cs#L811) |
| `SKOmnibusDividendSet` | [Shared / Other](by-topic/shared-other.md) | [L167372](../../../ScriptDB/000_4_CreateSP.sql#L167372) | 1 / 1 file | 0 / 0 | [ETFOrder.cs:726](../../../UBClasses/ETFOrder.cs#L726) |
| `SKOrderCancelAdd` | [Trading & Orders](by-topic/trading-orders.md) | [L167533](../../../ScriptDB/000_4_CreateSP.sql#L167533) | — | 0 / 0 | — |
| `SKOrderFeeOptList` | [Commission & Fee](by-topic/commission-fee.md) | [L167566](../../../ScriptDB/000_4_CreateSP.sql#L167566) | — | 1 / 0 | — |
| `SKOrderHistoryList` | [Trading & Orders](by-topic/trading-orders.md) | [L167582](../../../ScriptDB/000_4_CreateSP.sql#L167582) | 1 / 1 file | 0 / 0 | [ETFOrder.cs:192](../../../UBClasses/ETFOrder.cs#L192) |
| `SKOrderPendingList` | [Trading & Orders](by-topic/trading-orders.md) | [L167778](../../../ScriptDB/000_4_CreateSP.sql#L167778) | 1 / 1 file | 0 / 0 | [ETFOrder.cs:135](../../../UBClasses/ETFOrder.cs#L135) |
| `SKOrderSelectionUpdate` | [Trading & Orders](by-topic/trading-orders.md) | [L167966](../../../ScriptDB/000_4_CreateSP.sql#L167966) | — | 0 / 0 | — |
| `SKOrderSideList` | [Trading & Orders](by-topic/trading-orders.md) | [L168013](../../../ScriptDB/000_4_CreateSP.sql#L168013) | — | 2 / 0 | — |
| `SKOrderTimeInForce` | [Trading & Orders](by-topic/trading-orders.md) | [L168034](../../../ScriptDB/000_4_CreateSP.sql#L168034) | — | 2 / 0 | — |
| `SKOrderTypeList` | [Trading & Orders](by-topic/trading-orders.md) | [L168055](../../../ScriptDB/000_4_CreateSP.sql#L168055) | — | 2 / 0 | — |
| `SKOrderWaiting2SendAdd` | [Trading & Orders](by-topic/trading-orders.md) | [L168076](../../../ScriptDB/000_4_CreateSP.sql#L168076) | — | 0 / 0 | — |
| `SKPriceReqHistoryList` | [Shared / Other](by-topic/shared-other.md) | [L168170](../../../ScriptDB/000_4_CreateSP.sql#L168170) | — | 0 / 0 | — |
| `SKQFix_CorrectAvgPxOne` | [Shared / Other](by-topic/shared-other.md) | [L168253](../../../ScriptDB/000_4_CreateSP.sql#L168253) | — | 0 / 1 | — |
| `SKQFixDefFieldInit` | [Shared / Other](by-topic/shared-other.md) | [L168303](../../../ScriptDB/000_4_CreateSP.sql#L168303) | — | 0 / 0 | — |
| `SKQFixDefFieldValInit` | [Shared / Other](by-topic/shared-other.md) | [L168341](../../../ScriptDB/000_4_CreateSP.sql#L168341) | — | 0 / 0 | — |
| `SKQFixDefList` | [Shared / Other](by-topic/shared-other.md) | [L168387](../../../ScriptDB/000_4_CreateSP.sql#L168387) | — | 0 / 0 | — |
| `SKQFixDefList_Val` | [Shared / Other](by-topic/shared-other.md) | [L168409](../../../ScriptDB/000_4_CreateSP.sql#L168409) | — | 0 / 0 | — |
| `SKQuickFixMSGAdd` | [Shared / Other](by-topic/shared-other.md) | [L168440](../../../ScriptDB/000_4_CreateSP.sql#L168440) | 1 / 1 file | 0 / 2 | [VFQFMain.cs:73](../../../VFQuickFix/VFQuickFix/VFQFMain.cs#L73) |
| `SKQuickFixMSGDetail` | [Shared / Other](by-topic/shared-other.md) | [L168500](../../../ScriptDB/000_4_CreateSP.sql#L168500) | 1 / 1 file | 0 / 1 | [ETFOrder.cs:83](../../../UBClasses/ETFOrder.cs#L83) |
| `SKQuickFixMSGExcutionDayEnd` | [Shared / Other](by-topic/shared-other.md) | [L168561](../../../ScriptDB/000_4_CreateSP.sql#L168561) | — | 0 / 1 | — |
| `SKQuickFixMSGExcutionReportProcess` | [Shared / Other](by-topic/shared-other.md) | [L168587](../../../ScriptDB/000_4_CreateSP.sql#L168587) | — | 2 / 6 | — |
| `SKQuickFixMSGSet` | [Shared / Other](by-topic/shared-other.md) | [L169223](../../../ScriptDB/000_4_CreateSP.sql#L169223) | 1 / 1 file | 0 / 0 | [ETFOrder.cs:33](../../../UBClasses/ETFOrder.cs#L33) |
| `SKQuickFixMSGTypeSequence` | [Shared / Other](by-topic/shared-other.md) | [L169286](../../../ScriptDB/000_4_CreateSP.sql#L169286) | — | 1 / 1 | — |
| `SKQuickFixOrderAdd` | [Trading & Orders](by-topic/trading-orders.md) | [L169350](../../../ScriptDB/000_4_CreateSP.sql#L169350) | — | 1 / 0 | — |
| `SKQuickFixOrderCancel` | [Trading & Orders](by-topic/trading-orders.md) | [L169433](../../../ScriptDB/000_4_CreateSP.sql#L169433) | — | 0 / 0 | — |
| `SKQuickFixOrderComboList` | [Trading & Orders](by-topic/trading-orders.md) | [L169484](../../../ScriptDB/000_4_CreateSP.sql#L169484) | — | 0 / 6 | — |
| `SKQuickFixOrderItemInfo` | [Trading & Orders](by-topic/trading-orders.md) | [L169515](../../../ScriptDB/000_4_CreateSP.sql#L169515) | 1 / 1 file | 0 / 0 | [ETFOrder.cs:280](../../../UBClasses/ETFOrder.cs#L280) |
| `SKQuickFixOrderRemove` | [Trading & Orders](by-topic/trading-orders.md) | [L169545](../../../ScriptDB/000_4_CreateSP.sql#L169545) | — | 0 / 0 | — |
| `SKQuickFixOrderSet` | [Trading & Orders](by-topic/trading-orders.md) | [L169586](../../../ScriptDB/000_4_CreateSP.sql#L169586) | 1 / 1 file | 0 / 0 | [VFQFMain.cs:137](../../../VFQuickFix/VFQuickFix/VFQFMain.cs#L137) |
| `SKQuickFixOrderSetStatus` | [Trading & Orders](by-topic/trading-orders.md) | [L169690](../../../ScriptDB/000_4_CreateSP.sql#L169690) | 1 / 1 file | 0 / 0 | [VFQFMain.cs:104](../../../VFQuickFix/VFQuickFix/VFQFMain.cs#L104) |
| `SKQuickFixOrderUpdate` | [Trading & Orders](by-topic/trading-orders.md) | [L169703](../../../ScriptDB/000_4_CreateSP.sql#L169703) | — | 0 / 0 | — |
| `SKQuickFixPriceReqAdd` | [Shared / Other](by-topic/shared-other.md) | [L169769](../../../ScriptDB/000_4_CreateSP.sql#L169769) | — | 0 / 0 | — |
| `SKQuickFixPriceReqSet` | [Shared / Other](by-topic/shared-other.md) | [L169796](../../../ScriptDB/000_4_CreateSP.sql#L169796) | 1 / 1 file | 0 / 0 | [VFQFMain.cs:181](../../../VFQuickFix/VFQuickFix/VFQFMain.cs#L181) |
| `SKQuickFixSetting` | [Shared / Other](by-topic/shared-other.md) | [L169821](../../../ScriptDB/000_4_CreateSP.sql#L169821) | — | 0 / 0 | — |
| `SP_MF_Commission_Report_Mang_VF` | [Commission & Fee](by-topic/commission-fee.md) | [L169841](../../../ScriptDB/000_4_CreateSP.sql#L169841) | — | 0 / 0 | — |
| `SP_MF_Commission_Report_VF` | [Commission & Fee](by-topic/commission-fee.md) | [L170348](../../../ScriptDB/000_4_CreateSP.sql#L170348) | — | 0 / 0 | — |
| `TrustTrxDetailUpdate` | [Account & Plan](by-topic/account-plan.md) | [L170797](../../../ScriptDB/000_4_CreateSP.sql#L170797) | — | 3 / 0 | — |
| `TrxRecalcAvgOneFundAccount` | [Fund & GIC](by-topic/fund-gic.md) | [L170823](../../../ScriptDB/000_4_CreateSP.sql#L170823) | — | 2 / 0 | — |
| `TrxRecalcAvgShareBalanceOneFundAccount` | [Fund & GIC](by-topic/fund-gic.md) | [L170868](../../../ScriptDB/000_4_CreateSP.sql#L170868) | — | 8 / 0 | — |
| `TT_FundUnitByDate` | [Fund & GIC](by-topic/fund-gic.md) | [L171011](../../../ScriptDB/000_4_CreateSP.sql#L171011) | — | 1 / 1 | — |
| `TT_OPEN` | [Shared / Other](by-topic/shared-other.md) | [L171163](../../../ScriptDB/000_4_CreateSP.sql#L171163) | — | 1 / 1 | — |
| `TT_RIF` | [Shared / Other](by-topic/shared-other.md) | [L171379](../../../ScriptDB/000_4_CreateSP.sql#L171379) | — | 1 / 1 | — |
| `TT_RSP` | [Shared / Other](by-topic/shared-other.md) | [L171599](../../../ScriptDB/000_4_CreateSP.sql#L171599) | — | 1 / 1 | — |
| `TT_SUMMARY` | [Shared / Other](by-topic/shared-other.md) | [L171836](../../../ScriptDB/000_4_CreateSP.sql#L171836) | — | 1 / 2 | — |
| `TT_TFSA` | [Shared / Other](by-topic/shared-other.md) | [L172591](../../../ScriptDB/000_4_CreateSP.sql#L172591) | — | 1 / 1 | — |
| `UB_AttachmentCopy2ClientList` | [Client & KYC](by-topic/client-kyc.md) | [L172807](../../../ScriptDB/000_4_CreateSP.sql#L172807) | — | 1 / 0 | — |
| `UB_ClientLeverageRatio` | [Client & KYC](by-topic/client-kyc.md) | [L172871](../../../ScriptDB/000_4_CreateSP.sql#L172871) | — | 1 / 0 | — |
| `UB_ClientLeverageRatioList` | [Client & KYC](by-topic/client-kyc.md) | [L172929](../../../ScriptDB/000_4_CreateSP.sql#L172929) | — | 0 / 1 | — |
| `UB_PriceRemoveDuplicate` | [Shared / Other](by-topic/shared-other.md) | [L172983](../../../ScriptDB/000_4_CreateSP.sql#L172983) | — | 0 / 0 | — |
| `UB_UpdateTrxCOF` | [Trading & Orders](by-topic/trading-orders.md) | [L173010](../../../ScriptDB/000_4_CreateSP.sql#L173010) | — | 0 / 0 | — |
| `UB_UpdateTrxCON` | [Trading & Orders](by-topic/trading-orders.md) | [L173070](../../../ScriptDB/000_4_CreateSP.sql#L173070) | — | 0 / 0 | — |
| `UB2FAGetCode4Client` | [Client & KYC](by-topic/client-kyc.md) | [L173125](../../../ScriptDB/000_4_CreateSP.sql#L173125) | 1 / 1 file | 0 / 2 | [Customer.cs:6066](../../../UBClasses/Customer.cs#L6066) |
| `UB2FAGetCode4User` | [Shared / Other](by-topic/shared-other.md) | [L173204](../../../ScriptDB/000_4_CreateSP.sql#L173204) | 1 / 1 file | 0 / 2 | [CDatabase.cs:2672](../../../UBConnection/CDatabase.cs#L2672) |
| `UB3rdAppInfo` | [Shared / Other](by-topic/shared-other.md) | [L173295](../../../ScriptDB/000_4_CreateSP.sql#L173295) | — | 0 / 0 | — |
| `UB3rdAppList` | [Shared / Other](by-topic/shared-other.md) | [L173322](../../../ScriptDB/000_4_CreateSP.sql#L173322) | — | 1 / 0 | — |
| `UBAABuyItemInfo` | [Shared / Other](by-topic/shared-other.md) | [L173349](../../../ScriptDB/000_4_CreateSP.sql#L173349) | 1 / 1 file | 0 / 0 | [AssetAllocation.cs:892](../../../UBClasses/AssetAllocation.cs#L892) |
| `UBAABuyItemUpdate` | [Shared / Other](by-topic/shared-other.md) | [L173378](../../../ScriptDB/000_4_CreateSP.sql#L173378) | 1 / 1 file | 0 / 0 | [AssetAllocation.cs:940](../../../UBClasses/AssetAllocation.cs#L940) |
| `UBAABuyTrxCreate` | [Trading & Orders](by-topic/trading-orders.md) | [L173425](../../../ScriptDB/000_4_CreateSP.sql#L173425) | 1 / 1 file | 0 / 5 | [AssetAllocation.cs:996](../../../UBClasses/AssetAllocation.cs#L996) |
| `UBAABuyTrxHistory` | [Trading & Orders](by-topic/trading-orders.md) | [L173621](../../../ScriptDB/000_4_CreateSP.sql#L173621) | 1 / 1 file | 0 / 0 | [AssetAllocation.cs:1137](../../../UBClasses/AssetAllocation.cs#L1137) |
| `UBAABuyTrxHistoryDetail` | [Trading & Orders](by-topic/trading-orders.md) | [L173668](../../../ScriptDB/000_4_CreateSP.sql#L173668) | 1 / 1 file | 0 / 0 | [AssetAllocation.cs:1185](../../../UBClasses/AssetAllocation.cs#L1185) |
| `UBAABuyTrxRemove` | [Trading & Orders](by-topic/trading-orders.md) | [L173706](../../../ScriptDB/000_4_CreateSP.sql#L173706) | 1 / 1 file | 2 / 2 | [AssetAllocation.cs:1230](../../../UBClasses/AssetAllocation.cs#L1230) |
| `UBAACashTrxSetConfirmStatus` | [Account & Plan](by-topic/account-plan.md) | [L173766](../../../ScriptDB/000_4_CreateSP.sql#L173766) | — | 6 / 0 | — |
| `UBAACreatePosition` | [Shared / Other](by-topic/shared-other.md) | [L173812](../../../ScriptDB/000_4_CreateSP.sql#L173812) | — | 7 / 1 | — |
| `UBAADefComboList` | [Shared / Other](by-topic/shared-other.md) | [L173908](../../../ScriptDB/000_4_CreateSP.sql#L173908) | — | 0 / 6 | — |
| `UBAADetailInfo` | [Shared / Other](by-topic/shared-other.md) | [L173941](../../../ScriptDB/000_4_CreateSP.sql#L173941) | 1 / 1 file | 0 / 0 | [AssetAllocation.cs:842](../../../UBClasses/AssetAllocation.cs#L842) |
| `UBAADetailList` | [Shared / Other](by-topic/shared-other.md) | [L173986](../../../ScriptDB/000_4_CreateSP.sql#L173986) | 1 / 1 file | 1 / 1 | [AssetAllocation.cs:793](../../../UBClasses/AssetAllocation.cs#L793) |
| `UBAADetailListPlan` | [Account & Plan](by-topic/account-plan.md) | [L174057](../../../ScriptDB/000_4_CreateSP.sql#L174057) | — | 1 / 0 | — |
| `UBAADetailRemove` | [Shared / Other](by-topic/shared-other.md) | [L174287](../../../ScriptDB/000_4_CreateSP.sql#L174287) | 1 / 1 file | 0 / 0 | [AssetAllocation.cs:746](../../../UBClasses/AssetAllocation.cs#L746) |
| `UBAADetailUpdate` | [Shared / Other](by-topic/shared-other.md) | [L174309](../../../ScriptDB/000_4_CreateSP.sql#L174309) | — | 0 / 1 | — |
| `UBAAFolderAdd` | [Shared / Other](by-topic/shared-other.md) | [L174384](../../../ScriptDB/000_4_CreateSP.sql#L174384) | — | 0 / 0 | — |
| `UBAAFolderList` | [Shared / Other](by-topic/shared-other.md) | [L174439](../../../ScriptDB/000_4_CreateSP.sql#L174439) | 1 / 1 file | 0 / 0 | [AssetAllocation.cs:524](../../../UBClasses/AssetAllocation.cs#L524) |
| `UBAAFolderRemove` | [Shared / Other](by-topic/shared-other.md) | [L174513](../../../ScriptDB/000_4_CreateSP.sql#L174513) | 1 / 1 file | 0 / 0 | [AssetAllocation.cs:430](../../../UBClasses/AssetAllocation.cs#L430) |
| `UBAAFolderSimpleList` | [Shared / Other](by-topic/shared-other.md) | [L174539](../../../ScriptDB/000_4_CreateSP.sql#L174539) | — | 1 / 0 | — |
| `UBAAFolderUpdate` | [Shared / Other](by-topic/shared-other.md) | [L174586](../../../ScriptDB/000_4_CreateSP.sql#L174586) | — | 0 / 1 | — |
| `UBAAFundDefSync` | [Fund & GIC](by-topic/fund-gic.md) | [L174634](../../../ScriptDB/000_4_CreateSP.sql#L174634) | — | 3 / 5 | — |
| `UBAAItemFundFactInfo` | [Fund & GIC](by-topic/fund-gic.md) | [L175276](../../../ScriptDB/000_4_CreateSP.sql#L175276) | 1 / 1 file | 0 / 0 | [AssetAllocation.cs:1574](../../../UBClasses/AssetAllocation.cs#L1574) |
| `UBAAItemInfo` | [Shared / Other](by-topic/shared-other.md) | [L175326](../../../ScriptDB/000_4_CreateSP.sql#L175326) | 2 / 2 file | 0 / 5 | [AssetAllocation.cs:573](../../../UBClasses/AssetAllocation.cs#L573) |
| `UBAAItemInfoPlan` | [Account & Plan](by-topic/account-plan.md) | [L175535](../../../ScriptDB/000_4_CreateSP.sql#L175535) | 1 / 1 file | 0 / 1 | [AssetAllocation.cs:622](../../../UBClasses/AssetAllocation.cs#L622) |
| `UBAAListing1Model` | [Shared / Other](by-topic/shared-other.md) | [L175764](../../../ScriptDB/000_4_CreateSP.sql#L175764) | — | 0 / 0 | — |
| `UBAAPlanCheckFundPosition` | [Fund & GIC](by-topic/fund-gic.md) | [L175867](../../../ScriptDB/000_4_CreateSP.sql#L175867) | — | 4 / 1 | — |
| `UBAAPlanFundPositionVerify` | [Fundserv & Import](by-topic/fundserv-import.md) | [L175969](../../../ScriptDB/000_4_CreateSP.sql#L175969) | — | 4 / 1 | — |
| `UBAAPlanList` | [Account & Plan](by-topic/account-plan.md) | [L176018](../../../ScriptDB/000_4_CreateSP.sql#L176018) | 1 / 1 file | 0 / 2 | [AssetAllocation.cs:1379](../../../UBClasses/AssetAllocation.cs#L1379) |
| `UBAAPlanModelAssigned` | [Account & Plan](by-topic/account-plan.md) | [L176325](../../../ScriptDB/000_4_CreateSP.sql#L176325) | 1 / 1 file | 0 / 0 | [AssetAllocation.cs:478](../../../UBClasses/AssetAllocation.cs#L478) |
| `UBAAPlanRebalanceVerifyAfter` | [Account & Plan](by-topic/account-plan.md) | [L176360](../../../ScriptDB/000_4_CreateSP.sql#L176360) | — | 1 / 0 | — |
| `UBAAPlanRebalanceVerifyAfterV2` | [Account & Plan](by-topic/account-plan.md) | [L176520](../../../ScriptDB/000_4_CreateSP.sql#L176520) | — | 0 / 0 | — |
| `UBAAPlanRebalanceVerifyAllAfter` | [Account & Plan](by-topic/account-plan.md) | [L176596](../../../ScriptDB/000_4_CreateSP.sql#L176596) | 1 / 1 file | 0 / 1 | [AssetAllocation.cs:306](../../../UBClasses/AssetAllocation.cs#L306) |
| `UBAAPlanVerifyOneModel4OneFund` | [Fund & GIC](by-topic/fund-gic.md) | [L176661](../../../ScriptDB/000_4_CreateSP.sql#L176661) | — | 1 / 1 | — |
| `UBAARebalancePlanList` | [Account & Plan](by-topic/account-plan.md) | [L176698](../../../ScriptDB/000_4_CreateSP.sql#L176698) | 1 / 1 file | 0 / 0 | [AssetAllocation.cs:168](../../../UBClasses/AssetAllocation.cs#L168) |
| `UBAARebalanceSelectionUpdate` | [Shared / Other](by-topic/shared-other.md) | [L176748](../../../ScriptDB/000_4_CreateSP.sql#L176748) | — | 0 / 0 | — |
| `UBAARebalancingOnePlan` | [Account & Plan](by-topic/account-plan.md) | [L176789](../../../ScriptDB/000_4_CreateSP.sql#L176789) | — | 2 / 0 | — |
| `UBAARebalancingPlan` | [Account & Plan](by-topic/account-plan.md) | [L176935](../../../ScriptDB/000_4_CreateSP.sql#L176935) | 1 / 1 file | 0 / 1 | [AssetAllocation.cs:1279](../../../UBClasses/AssetAllocation.cs#L1279) |
| `UBAARebalancingPlanTrx` | [Account & Plan](by-topic/account-plan.md) | [L176992](../../../ScriptDB/000_4_CreateSP.sql#L176992) | 1 / 1 file | 0 / 5 | [AssetAllocation.cs:1325](../../../UBClasses/AssetAllocation.cs#L1325) |
| `UBAARebalancingPlanTrxUndo` | [Account & Plan](by-topic/account-plan.md) | [L177260](../../../ScriptDB/000_4_CreateSP.sql#L177260) | — | 1 / 2 | — |
| `UBAARebalancingPlanUndo` | [Account & Plan](by-topic/account-plan.md) | [L177340](../../../ScriptDB/000_4_CreateSP.sql#L177340) | 1 / 1 file | 0 / 1 | [AssetAllocation.cs:1525](../../../UBClasses/AssetAllocation.cs#L1525) |
| `UBAARebalancingScan4BuyAllPlan` | [Account & Plan](by-topic/account-plan.md) | [L177380](../../../ScriptDB/000_4_CreateSP.sql#L177380) | — | 0 / 1 | — |
| `UBAARebalancingScan4BuyOnePlan` | [Account & Plan](by-topic/account-plan.md) | [L177409](../../../ScriptDB/000_4_CreateSP.sql#L177409) | — | 1 / 0 | — |
| `UBAASellTrxCreate` | [Trading & Orders](by-topic/trading-orders.md) | [L177510](../../../ScriptDB/000_4_CreateSP.sql#L177510) | 1 / 1 file | 0 / 3 | [AssetAllocation.cs:1069](../../../UBClasses/AssetAllocation.cs#L1069) |
| `UBAccMFList` | [Shared / Other](by-topic/shared-other.md) | [L177734](../../../ScriptDB/000_4_CreateSP.sql#L177734) | 2 / 1 file | 0 / 0 | [FundAccount.cs:292](../../../UBClasses/FundAccount.cs#L292) |
| `UBAccountClientList` | [Account & Plan](by-topic/account-plan.md) | [L177773](../../../ScriptDB/000_4_CreateSP.sql#L177773) | 1 / 1 file | 0 / 0 | [FundAccount.cs:1532](../../../UBClasses/FundAccount.cs#L1532) |
| `UBAccountEditComboList` | [Account & Plan](by-topic/account-plan.md) | [L177837](../../../ScriptDB/000_4_CreateSP.sql#L177837) | — | 0 / 17 | — |
| `UBAccountInfoUD` | [Account & Plan](by-topic/account-plan.md) | [L177884](../../../ScriptDB/000_4_CreateSP.sql#L177884) | 1 / 1 file | 0 / 0 | [UserDefinedField.cs:213](../../../UBClasses/UserDefinedField.cs#L213) |
| `UBAccountListICTFrom` | [Account & Plan](by-topic/account-plan.md) | [L177949](../../../ScriptDB/000_4_CreateSP.sql#L177949) | 1 / 1 file | 0 / 0 | [FundAccount.cs:674](../../../UBClasses/FundAccount.cs#L674) |
| `UBAccountListICTTo` | [Account & Plan](by-topic/account-plan.md) | [L177996](../../../ScriptDB/000_4_CreateSP.sql#L177996) | 1 / 1 file | 0 / 0 | [FundAccount.cs:767](../../../UBClasses/FundAccount.cs#L767) |
| `UBAccountPlanID` | [Account & Plan](by-topic/account-plan.md) | [L178085](../../../ScriptDB/000_4_CreateSP.sql#L178085) | 2 / 1 file | 0 / 0 | [FundAccount.cs:1577](../../../UBClasses/FundAccount.cs#L1577) |
| `UBAccountStatusList` | [Account & Plan](by-topic/account-plan.md) | [L178124](../../../ScriptDB/000_4_CreateSP.sql#L178124) | — | 5 / 0 | — |
| `UBAccountTypeDetailList` | [Account & Plan](by-topic/account-plan.md) | [L178154](../../../ScriptDB/000_4_CreateSP.sql#L178154) | — | 1 / 0 | — |
| `UBAccountUDAdd` | [Account & Plan](by-topic/account-plan.md) | [L178183](../../../ScriptDB/000_4_CreateSP.sql#L178183) | — | 2 / 1 | — |
| `UBAccountUDAddTMP` | [Account & Plan](by-topic/account-plan.md) | [L178246](../../../ScriptDB/000_4_CreateSP.sql#L178246) | — | 0 / 0 | — |
| `UBAccountUserDefTMPEnd` | [Account & Plan](by-topic/account-plan.md) | [L178307](../../../ScriptDB/000_4_CreateSP.sql#L178307) | 1 / 1 file | 1 / 0 | [UserDefinedField.cs:274](../../../UBClasses/UserDefinedField.cs#L274) |
| `UBAccountViewComboList` | [Account & Plan](by-topic/account-plan.md) | [L178336](../../../ScriptDB/000_4_CreateSP.sql#L178336) | — | 0 / 19 | — |
| `UBAccountViewSearch` | [Account & Plan](by-topic/account-plan.md) | [L178387](../../../ScriptDB/000_4_CreateSP.sql#L178387) | 1 / 1 file | 0 / 4 | [FundAccount.cs:1382](../../../UBClasses/FundAccount.cs#L1382) |
| `UBAccountViewSearchCriteriaSave` | [Account & Plan](by-topic/account-plan.md) | [L180643](../../../ScriptDB/000_4_CreateSP.sql#L180643) | — | 1 / 1 | — |
| `UBAccountViewSearchEx` | [Account & Plan](by-topic/account-plan.md) | [L180977](../../../ScriptDB/000_4_CreateSP.sql#L180977) | — | 1 / 1 | — |
| `UBActiveFundDef` | [Fund & GIC](by-topic/fund-gic.md) | [L182401](../../../ScriptDB/000_4_CreateSP.sql#L182401) | — | 0 / 0 | — |
| `UBAddressAdd` | [Shared / Other](by-topic/shared-other.md) | [L182464](../../../ScriptDB/000_4_CreateSP.sql#L182464) | — | 88 / 2 | — |
| `UBAddressChangeClientID` | [Client & KYC](by-topic/client-kyc.md) | [L182547](../../../ScriptDB/000_4_CreateSP.sql#L182547) | 1 / 1 file | 0 / 0 | [AuditTrail.cs:263](../../../UBClasses/AuditTrail.cs#L263) |
| `UBAddressChangeList` | [Shared / Other](by-topic/shared-other.md) | [L182569](../../../ScriptDB/000_4_CreateSP.sql#L182569) | 1 / 1 file | 0 / 1 | [AuditTrail.cs:184](../../../UBClasses/AuditTrail.cs#L184) |
| `UBAddressChangeSupplierClientID` | [Client & KYC](by-topic/client-kyc.md) | [L182769](../../../ScriptDB/000_4_CreateSP.sql#L182769) | 1 / 1 file | 0 / 0 | [CAddress.cs:215](../../../UBClasses/CAddress.cs#L215) |
| `UBAddressGet` | [Shared / Other](by-topic/shared-other.md) | [L182791](../../../ScriptDB/000_4_CreateSP.sql#L182791) | — | 11 / 0 | — |
| `UBAddressSplitFrom1Str` | [Shared / Other](by-topic/shared-other.md) | [L182832](../../../ScriptDB/000_4_CreateSP.sql#L182832) | — | 0 / 0 | — |
| `UBAddressUpdate` | [Shared / Other](by-topic/shared-other.md) | [L182961](../../../ScriptDB/000_4_CreateSP.sql#L182961) | — | 37 / 2 | — |
| `UBAdvisorList` | [Shared / Other](by-topic/shared-other.md) | [L183061](../../../ScriptDB/000_4_CreateSP.sql#L183061) | 2 / 1 file | 0 / 1 | [Advisor.cs:84](../../../UBClasses/Advisor.cs#L84) |
| `UBAdvisorNameList` | [Shared / Other](by-topic/shared-other.md) | [L183321](../../../ScriptDB/000_4_CreateSP.sql#L183321) | 1 / 1 file | 0 / 1 | [Advisor.cs:343](../../../UBClasses/Advisor.cs#L343) |
| `UBAMLCheckNameTitle` | [Compliance](by-topic/compliance.md) | [L183394](../../../ScriptDB/000_4_CreateSP.sql#L183394) | 1 / 1 file | 0 / 0 | [FINTRAC.cs:857](../../../UBClasses/FINTRAC.cs#L857) |
| `UBAMLCheckNameTitleAll` | [Compliance](by-topic/compliance.md) | [L183425](../../../ScriptDB/000_4_CreateSP.sql#L183425) | — | 0 / 0 | — |
| `UBAMLScanAll` | [Compliance](by-topic/compliance.md) | [L183479](../../../ScriptDB/000_4_CreateSP.sql#L183479) | — | 0 / 0 | — |
| `UBAnnualIncomeList` | [Shared / Other](by-topic/shared-other.md) | [L183553](../../../ScriptDB/000_4_CreateSP.sql#L183553) | — | 6 / 0 | — |
| `UBAppAdd` | [Shared / Other](by-topic/shared-other.md) | [L183583](../../../ScriptDB/000_4_CreateSP.sql#L183583) | 1 / 1 file | 0 / 0 | [TrxApplication.cs:191](../../../UBClasses/TrxApplication.cs#L191) |
| `UBAppComboList` | [Shared / Other](by-topic/shared-other.md) | [L183627](../../../ScriptDB/000_4_CreateSP.sql#L183627) | — | 0 / 1 | — |
| `UBAppList` | [Shared / Other](by-topic/shared-other.md) | [L183651](../../../ScriptDB/000_4_CreateSP.sql#L183651) | 1 / 1 file | 0 / 0 | [TrxApplication.cs:104](../../../UBClasses/TrxApplication.cs#L104) |
| `UBAppRemove` | [Shared / Other](by-topic/shared-other.md) | [L183694](../../../ScriptDB/000_4_CreateSP.sql#L183694) | 1 / 1 file | 0 / 0 | [TrxApplication.cs:253](../../../UBClasses/TrxApplication.cs#L253) |
| `UBAppTypeList` | [Shared / Other](by-topic/shared-other.md) | [L183726](../../../ScriptDB/000_4_CreateSP.sql#L183726) | — | 1 / 0 | — |
| `UBAppUpdate` | [Shared / Other](by-topic/shared-other.md) | [L183751](../../../ScriptDB/000_4_CreateSP.sql#L183751) | 1 / 1 file | 0 / 0 | [TrxApplication.cs:191](../../../UBClasses/TrxApplication.cs#L191) |
| `UBASMDetailSet` | [Shared / Other](by-topic/shared-other.md) | [L183794](../../../ScriptDB/000_4_CreateSP.sql#L183794) | 1 / 1 file | 0 / 0 | [ASMView.cs:108](../../../UBClasses/ASMView.cs#L108) |
| `UBASMHeaderAdd` | [Shared / Other](by-topic/shared-other.md) | [L184002](../../../ScriptDB/000_4_CreateSP.sql#L184002) | — | 0 / 0 | — |
| `UBASMHeaderSet` | [Shared / Other](by-topic/shared-other.md) | [L184063](../../../ScriptDB/000_4_CreateSP.sql#L184063) | 1 / 1 file | 0 / 0 | [ASMView.cs:44](../../../UBClasses/ASMView.cs#L44) |
| `UBASMPymtAdd` | [Shared / Other](by-topic/shared-other.md) | [L184297](../../../ScriptDB/000_4_CreateSP.sql#L184297) | — | 0 / 0 | — |
| `UBASMPymtByPartAdd` | [Shared / Other](by-topic/shared-other.md) | [L184401](../../../ScriptDB/000_4_CreateSP.sql#L184401) | — | 0 / 0 | — |
| `UBAssetCashOneFund` | [Fund & GIC](by-topic/fund-gic.md) | [L184448](../../../ScriptDB/000_4_CreateSP.sql#L184448) | — | 1 / 2 | — |
| `UBAssetCashOneMgmt` | [Account & Plan](by-topic/account-plan.md) | [L184676](../../../ScriptDB/000_4_CreateSP.sql#L184676) | — | 1 / 1 | — |
| `UBAssetFundDefMgmtList` | [Fund & GIC](by-topic/fund-gic.md) | [L184930](../../../ScriptDB/000_4_CreateSP.sql#L184930) | 1 / 1 file | 0 / 0 | [CAssetByFund.cs:45](../../../VieFUNDPdf/CAssetByFund.cs#L45) |
| `UBAssetFundDefOneFund` | [Fund & GIC](by-topic/fund-gic.md) | [L185077](../../../ScriptDB/000_4_CreateSP.sql#L185077) | — | 1 / 4 | — |
| `UBAssetFundDefOneMgmt` | [Fund & GIC](by-topic/fund-gic.md) | [L185398](../../../ScriptDB/000_4_CreateSP.sql#L185398) | 1 / 1 file | 0 / 4 | [CAssetByFund.cs:87](../../../VieFUNDPdf/CAssetByFund.cs#L87) |
| `UBAssetGICOneMgmt` | [Fund & GIC](by-topic/fund-gic.md) | [L185824](../../../ScriptDB/000_4_CreateSP.sql#L185824) | — | 1 / 1 | — |
| `UBAssetGICOneMgmtOneRep` | [Fund & GIC](by-topic/fund-gic.md) | [L185923](../../../ScriptDB/000_4_CreateSP.sql#L185923) | — | 1 / 2 | — |
| `UBAssetOneRep` | [Shared / Other](by-topic/shared-other.md) | [L186154](../../../ScriptDB/000_4_CreateSP.sql#L186154) | — | 4 / 1 | — |
| `UBAssetOneRepX` | [Shared / Other](by-topic/shared-other.md) | [L186271](../../../ScriptDB/000_4_CreateSP.sql#L186271) | — | 3 / 1 | — |
| `UBAssetRecalcClientCurrent` | [Client & KYC](by-topic/client-kyc.md) | [L186316](../../../ScriptDB/000_4_CreateSP.sql#L186316) | — | 1 / 1 | — |
| `UBAssetRecalcClientCurrentAll` | [Client & KYC](by-topic/client-kyc.md) | [L186383](../../../ScriptDB/000_4_CreateSP.sql#L186383) | — | 0 / 2 | — |
| `UBAssetRecalcFundAll` | [Fund & GIC](by-topic/fund-gic.md) | [L186427](../../../ScriptDB/000_4_CreateSP.sql#L186427) | — | 0 / 1 | — |
| `UBAssetRecalcFundOne` | [Fund & GIC](by-topic/fund-gic.md) | [L186464](../../../ScriptDB/000_4_CreateSP.sql#L186464) | — | 2 / 0 | — |
| `UBAssetRecalcPlanCurrent` | [Account & Plan](by-topic/account-plan.md) | [L186583](../../../ScriptDB/000_4_CreateSP.sql#L186583) | — | 8 / 0 | — |
| `UBAssetRecalcPlanCurrentAll` | [Account & Plan](by-topic/account-plan.md) | [L186620](../../../ScriptDB/000_4_CreateSP.sql#L186620) | — | 2 / 1 | — |
| `UBAssetSetRecalcPlan` | [Account & Plan](by-topic/account-plan.md) | [L186656](../../../ScriptDB/000_4_CreateSP.sql#L186656) | — | 12 / 0 | — |
| `UBAssistantGet` | [Shared / Other](by-topic/shared-other.md) | [L186681](../../../ScriptDB/000_4_CreateSP.sql#L186681) | — | 1 / 2 | — |
| `UBAttachComboList` | [Documents & PDF](by-topic/documents-pdf.md) | [L186710](../../../ScriptDB/000_4_CreateSP.sql#L186710) | — | 0 / 3 | — |
| `UBAttachmentDescAdd` | [Documents & PDF](by-topic/documents-pdf.md) | [L186730](../../../ScriptDB/000_4_CreateSP.sql#L186730) | — | 4 / 0 | — |
| `UBAttachmentDescList` | [Documents & PDF](by-topic/documents-pdf.md) | [L186775](../../../ScriptDB/000_4_CreateSP.sql#L186775) | 1 / 1 file | 0 / 0 | [Document.cs:257](../../../UBClasses/Document.cs#L257) |
| `UBAttachmentTypeList` | [Documents & PDF](by-topic/documents-pdf.md) | [L186823](../../../ScriptDB/000_4_CreateSP.sql#L186823) | — | 2 / 0 | — |
| `UBAttGetCount` | [Shared / Other](by-topic/shared-other.md) | [L186854](../../../ScriptDB/000_4_CreateSP.sql#L186854) | 1 / 1 file | 0 / 0 | [Document.cs:4794](../../../UBClasses/Document.cs#L4794) |
| `UBAttSelectionUpdate` | [Shared / Other](by-topic/shared-other.md) | [L186873](../../../ScriptDB/000_4_CreateSP.sql#L186873) | — | 0 / 0 | — |
| `UBAttTaggedItemsObj` | [Shared / Other](by-topic/shared-other.md) | [L186907](../../../ScriptDB/000_4_CreateSP.sql#L186907) | 1 / 1 file | 0 / 0 | [CZipDocument.cs:43](../../../UBExport/CZipDocument.cs#L43) |
| `UBAttTypeKYPVerify` | [Shared / Other](by-topic/shared-other.md) | [L186981](../../../ScriptDB/000_4_CreateSP.sql#L186981) | — | 1 / 0 | — |
| `UBAUACurrent` | [Shared / Other](by-topic/shared-other.md) | [L187018](../../../ScriptDB/000_4_CreateSP.sql#L187018) | 1 / 1 file | 0 / 4 | [AUACurrent.cs:38](../../../VieFUNDPdf/AUACurrent.cs#L38) |
| `UBAUAQuarterReport` | [Shared / Other](by-topic/shared-other.md) | [L187121](../../../ScriptDB/000_4_CreateSP.sql#L187121) | — | 0 / 3 | — |
| `UBAUAQuarterReport10Positions` | [Shared / Other](by-topic/shared-other.md) | [L187449](../../../ScriptDB/000_4_CreateSP.sql#L187449) | — | 0 / 1 | — |
| `UBAUAQuarterReport5Positions` | [Shared / Other](by-topic/shared-other.md) | [L187515](../../../ScriptDB/000_4_CreateSP.sql#L187515) | — | 0 / 1 | — |
| `UBAUAQuarterReportClear` | [Shared / Other](by-topic/shared-other.md) | [L187568](../../../ScriptDB/000_4_CreateSP.sql#L187568) | — | 2 / 0 | — |
| `UBAUAQuarterReportOnePosition` | [Shared / Other](by-topic/shared-other.md) | [L187595](../../../ScriptDB/000_4_CreateSP.sql#L187595) | — | 2 / 1 | — |
| `UBAUAQuarterReportOneRep` | [Shared / Other](by-topic/shared-other.md) | [L187694](../../../ScriptDB/000_4_CreateSP.sql#L187694) | — | 0 / 2 | — |
| `UBAUAQuarterReportOneRepFundList` | [Fund & GIC](by-topic/fund-gic.md) | [L187814](../../../ScriptDB/000_4_CreateSP.sql#L187814) | — | 0 / 0 | — |
| `UBAUAQuarterReportOneRepFundSum` | [Fund & GIC](by-topic/fund-gic.md) | [L187928](../../../ScriptDB/000_4_CreateSP.sql#L187928) | — | 0 / 0 | — |
| `UBAUAQuarterReportOneRepSave6Values` | [Shared / Other](by-topic/shared-other.md) | [L188033](../../../ScriptDB/000_4_CreateSP.sql#L188033) | — | 0 / 0 | — |
| `UBAUAQuarterReportStart` | [Shared / Other](by-topic/shared-other.md) | [L188118](../../../ScriptDB/000_4_CreateSP.sql#L188118) | — | 0 / 1 | — |
| `UBAuditTrailAdd` | [Shared / Other](by-topic/shared-other.md) | [L188157](../../../ScriptDB/000_4_CreateSP.sql#L188157) | — | 11 / 2 | — |
| `UBAuditTrailAddByName` | [Shared / Other](by-topic/shared-other.md) | [L188255](../../../ScriptDB/000_4_CreateSP.sql#L188255) | — | 8 / 1 | — |
| `UBAuditTrailAddByName5` | [Shared / Other](by-topic/shared-other.md) | [L188287](../../../ScriptDB/000_4_CreateSP.sql#L188287) | — | 66 / 1 | — |
| `UBAuditTrailAddByNameDate` | [Shared / Other](by-topic/shared-other.md) | [L188326](../../../ScriptDB/000_4_CreateSP.sql#L188326) | — | 1 / 1 | — |
| `UBAuditTrailAddByNameDate5` | [Shared / Other](by-topic/shared-other.md) | [L188352](../../../ScriptDB/000_4_CreateSP.sql#L188352) | — | 44 / 1 | — |
| `UBAuditTrailAddByNameDateTime` | [Shared / Other](by-topic/shared-other.md) | [L188392](../../../ScriptDB/000_4_CreateSP.sql#L188392) | — | 1 / 1 | — |
| `UBAuditTrailAddByNameDateTime5` | [Shared / Other](by-topic/shared-other.md) | [L188418](../../../ScriptDB/000_4_CreateSP.sql#L188418) | — | 0 / 1 | — |
| `UBAuditTrailAddByNameFloat` | [Shared / Other](by-topic/shared-other.md) | [L188457](../../../ScriptDB/000_4_CreateSP.sql#L188457) | — | 2 / 1 | — |
| `UBAuditTrailAddByNameFloat5` | [Shared / Other](by-topic/shared-other.md) | [L188483](../../../ScriptDB/000_4_CreateSP.sql#L188483) | — | 24 / 1 | — |
| `UBAuditTrailAddByNameInt` | [Shared / Other](by-topic/shared-other.md) | [L188521](../../../ScriptDB/000_4_CreateSP.sql#L188521) | — | 1 / 1 | — |
| `UBAuditTrailAddByNameInt5` | [Shared / Other](by-topic/shared-other.md) | [L188547](../../../ScriptDB/000_4_CreateSP.sql#L188547) | — | 62 / 1 | — |
| `UBAuditTrailAddByNameMoney` | [Shared / Other](by-topic/shared-other.md) | [L188585](../../../ScriptDB/000_4_CreateSP.sql#L188585) | — | 1 / 1 | — |
| `UBAuditTrailAddByNameMoney5` | [Shared / Other](by-topic/shared-other.md) | [L188611](../../../ScriptDB/000_4_CreateSP.sql#L188611) | — | 10 / 1 | — |
| `UBAuditTrailClient` | [Client & KYC](by-topic/client-kyc.md) | [L188649](../../../ScriptDB/000_4_CreateSP.sql#L188649) | 1 / 1 file | 0 / 0 | [AuditTrail.cs:40](../../../UBClasses/AuditTrail.cs#L40) |
| `UBAuditTrailClientPlanBank` | [Account & Plan](by-topic/account-plan.md) | [L188807](../../../ScriptDB/000_4_CreateSP.sql#L188807) | — | 4 / 4 | — |
| `UBAuditTrailClientPlanBankAccount` | [Account & Plan](by-topic/account-plan.md) | [L188884](../../../ScriptDB/000_4_CreateSP.sql#L188884) | — | 6 / 2 | — |
| `UBAuditTrailFundAccount` | [Fund & GIC](by-topic/fund-gic.md) | [L188947](../../../ScriptDB/000_4_CreateSP.sql#L188947) | — | 3 / 6 | — |
| `UBAuditTrailFundPosSysPlan` | [Fund & GIC](by-topic/fund-gic.md) | [L189010](../../../ScriptDB/000_4_CreateSP.sql#L189010) | — | 3 / 3 | — |
| `UBAuditTrailGIAAnnuitant` | [Shared / Other](by-topic/shared-other.md) | [L189048](../../../ScriptDB/000_4_CreateSP.sql#L189048) | — | 4 / 5 | — |
| `UBAuditTrailGIADeadBen` | [Shared / Other](by-topic/shared-other.md) | [L189105](../../../ScriptDB/000_4_CreateSP.sql#L189105) | — | 4 / 6 | — |
| `UBAuditTrailGIASuccessorOwner` | [Shared / Other](by-topic/shared-other.md) | [L189169](../../../ScriptDB/000_4_CreateSP.sql#L189169) | — | 4 / 5 | — |
| `UBAuditTrailGICAccount` | [Fund & GIC](by-topic/fund-gic.md) | [L189231](../../../ScriptDB/000_4_CreateSP.sql#L189231) | — | 5 / 7 | — |
| `UBAuditTrailGICAccountTrx` | [Fund & GIC](by-topic/fund-gic.md) | [L189363](../../../ScriptDB/000_4_CreateSP.sql#L189363) | — | 7 / 7 | — |
| `UBAuditTrailGICEscRate` | [Fund & GIC](by-topic/fund-gic.md) | [L189446](../../../ScriptDB/000_4_CreateSP.sql#L189446) | — | 3 / 3 | — |
| `UBAuditTrailGICEscRateReset` | [Fund & GIC](by-topic/fund-gic.md) | [L189507](../../../ScriptDB/000_4_CreateSP.sql#L189507) | — | 1 / 1 | — |
| `UBAuditTrailGroupAdd` | [Shared / Other](by-topic/shared-other.md) | [L189557](../../../ScriptDB/000_4_CreateSP.sql#L189557) | — | 111 / 0 | — |
| `UBAuditTrailGroupVerify` | [Shared / Other](by-topic/shared-other.md) | [L189762](../../../ScriptDB/000_4_CreateSP.sql#L189762) | 1 / 1 file | 54 / 2 | [COnBoarding.cs:1741](../../../VFOnBoarding/COnBoarding.cs#L1741) |
| `UBAuditTrailInitAllClients` | [Client & KYC](by-topic/client-kyc.md) | [L189783](../../../ScriptDB/000_4_CreateSP.sql#L189783) | — | 1 / 1 | — |
| `UBAuditTrailInitAllFundAccounts` | [Fund & GIC](by-topic/fund-gic.md) | [L189824](../../../ScriptDB/000_4_CreateSP.sql#L189824) | — | 1 / 1 | — |
| `UBAuditTrailInitAllGICAccounts` | [Fund & GIC](by-topic/fund-gic.md) | [L189865](../../../ScriptDB/000_4_CreateSP.sql#L189865) | — | 1 / 1 | — |
| `UBAuditTrailInitAllPlans` | [Account & Plan](by-topic/account-plan.md) | [L189902](../../../ScriptDB/000_4_CreateSP.sql#L189902) | — | 1 / 1 | — |
| `UBAuditTrailInitOneClient` | [Client & KYC](by-topic/client-kyc.md) | [L189955](../../../ScriptDB/000_4_CreateSP.sql#L189955) | — | 3 / 6 | — |
| `UBAuditTrailInitOneFundAccount` | [Fund & GIC](by-topic/fund-gic.md) | [L190279](../../../ScriptDB/000_4_CreateSP.sql#L190279) | — | 1 / 3 | — |
| `UBAuditTrailInitOneGICAccount` | [Fund & GIC](by-topic/fund-gic.md) | [L190416](../../../ScriptDB/000_4_CreateSP.sql#L190416) | — | 1 / 7 | — |
| `UBAuditTrailInitOnePlan` | [Account & Plan](by-topic/account-plan.md) | [L190712](../../../ScriptDB/000_4_CreateSP.sql#L190712) | — | 3 / 8 | — |
| `UBAuditTrailInitPlanInvestInfo` | [Account & Plan](by-topic/account-plan.md) | [L190975](../../../ScriptDB/000_4_CreateSP.sql#L190975) | — | 1 / 4 | — |
| `UBAuditTrailOneField` | [Shared / Other](by-topic/shared-other.md) | [L191076](../../../ScriptDB/000_4_CreateSP.sql#L191076) | — | 1 / 0 | — |
| `UBAuditTrailPerson` | [Shared / Other](by-topic/shared-other.md) | [L191124](../../../ScriptDB/000_4_CreateSP.sql#L191124) | — | 2 / 5 | — |
| `UBAuditTrailPlanBen` | [Account & Plan](by-topic/account-plan.md) | [L191170](../../../ScriptDB/000_4_CreateSP.sql#L191170) | — | 9 / 6 | — |
| `UBAuditTrailPlanBenCon` | [Account & Plan](by-topic/account-plan.md) | [L191218](../../../ScriptDB/000_4_CreateSP.sql#L191218) | — | 2 / 6 | — |
| `UBAuditTrailPlanBenNameList` | [Account & Plan](by-topic/account-plan.md) | [L191267](../../../ScriptDB/000_4_CreateSP.sql#L191267) | — | 0 / 0 | — |
| `UBAuditTrailPlanExtraInfo` | [Account & Plan](by-topic/account-plan.md) | [L191319](../../../ScriptDB/000_4_CreateSP.sql#L191319) | — | 4 / 5 | — |
| `UBAuditTrailPlanInTrust` | [Account & Plan](by-topic/account-plan.md) | [L191382](../../../ScriptDB/000_4_CreateSP.sql#L191382) | — | 6 / 5 | — |
| `UBAuditTrailPlanThirdParty` | [Account & Plan](by-topic/account-plan.md) | [L191430](../../../ScriptDB/000_4_CreateSP.sql#L191430) | — | 3 / 5 | — |
| `UBAuditTrailResetAll` | [Shared / Other](by-topic/shared-other.md) | [L191483](../../../ScriptDB/000_4_CreateSP.sql#L191483) | — | 0 / 4 | — |
| `UBAuditTrailView` | [Shared / Other](by-topic/shared-other.md) | [L191513](../../../ScriptDB/000_4_CreateSP.sql#L191513) | 1 / 1 file | 0 / 3 | [AuditTrail.cs:100](../../../UBClasses/AuditTrail.cs#L100) |
| `UBAuditTrailViewAdmin` | [Shared / Other](by-topic/shared-other.md) | [L191756](../../../ScriptDB/000_4_CreateSP.sql#L191756) | — | 1 / 0 | — |
| `UBAuditTrailViewComboList` | [Shared / Other](by-topic/shared-other.md) | [L191975](../../../ScriptDB/000_4_CreateSP.sql#L191975) | — | 0 / 1 | — |
| `UBAuditTrailViewSearchCriteriaSave` | [Shared / Other](by-topic/shared-other.md) | [L192000](../../../ScriptDB/000_4_CreateSP.sql#L192000) | — | 1 / 1 | — |
| `UBAverageCostReCalc` | [Shared / Other](by-topic/shared-other.md) | [L192071](../../../ScriptDB/000_4_CreateSP.sql#L192071) | — | 0 / 1 | — |
| `UBAveragedCostAdd` | [Shared / Other](by-topic/shared-other.md) | [L192148](../../../ScriptDB/000_4_CreateSP.sql#L192148) | — | 5 / 0 | — |
| `UBAveragedCostCalc1Dealer` | [Shared / Other](by-topic/shared-other.md) | [L192200](../../../ScriptDB/000_4_CreateSP.sql#L192200) | — | 0 / 1 | — |
| `UBAveragedCostCalc1Plan` | [Account & Plan](by-topic/account-plan.md) | [L192236](../../../ScriptDB/000_4_CreateSP.sql#L192236) | — | 1 / 1 | — |
| `UBAveragedCostCalc1Pos` | [Shared / Other](by-topic/shared-other.md) | [L192271](../../../ScriptDB/000_4_CreateSP.sql#L192271) | — | 1 / 0 | — |
| `UBAveragedCostCalc1Pos_Test` | [Shared / Other](by-topic/shared-other.md) | [L192359](../../../ScriptDB/000_4_CreateSP.sql#L192359) | — | 0 / 0 | — |
| `UBB2BAssetDetailList` | [Shared / Other](by-topic/shared-other.md) | [L192473](../../../ScriptDB/000_4_CreateSP.sql#L192473) | — | 0 / 1 | — |
| `UBBankAccountTrustCommList` | [Commission & Fee](by-topic/commission-fee.md) | [L192605](../../../ScriptDB/000_4_CreateSP.sql#L192605) | — | 1 / 0 | — |
| `UBBankAccountTypeList` | [Account & Plan](by-topic/account-plan.md) | [L192647](../../../ScriptDB/000_4_CreateSP.sql#L192647) | — | 7 / 0 | — |
| `UBBankAdd` | [Shared / Other](by-topic/shared-other.md) | [L192676](../../../ScriptDB/000_4_CreateSP.sql#L192676) | 1 / 1 file | 1 / 1 | [Bank.cs:294](../../../UBClasses/Bank.cs#L294) |
| `UBBankBranchAdd` | [Shared / Other](by-topic/shared-other.md) | [L192731](../../../ScriptDB/000_4_CreateSP.sql#L192731) | 1 / 1 file | 1 / 1 | [BankBranch.cs:281](../../../UBClasses/BankBranch.cs#L281) |
| `UBBankBranchInfo` | [Shared / Other](by-topic/shared-other.md) | [L192783](../../../ScriptDB/000_4_CreateSP.sql#L192783) | 1 / 1 file | 0 / 0 | [BankBranch.cs:77](../../../UBClasses/BankBranch.cs#L77) |
| `UBBankBranchList` | [Shared / Other](by-topic/shared-other.md) | [L192826](../../../ScriptDB/000_4_CreateSP.sql#L192826) | 1 / 1 file | 0 / 0 | [BankBranch.cs:166](../../../UBClasses/BankBranch.cs#L166) |
| `UBBankBranchRemove` | [Shared / Other](by-topic/shared-other.md) | [L192959](../../../ScriptDB/000_4_CreateSP.sql#L192959) | 1 / 1 file | 0 / 0 | [BankBranch.cs:349](../../../UBClasses/BankBranch.cs#L349) |
| `UBBankBranchUpdate` | [Shared / Other](by-topic/shared-other.md) | [L193009](../../../ScriptDB/000_4_CreateSP.sql#L193009) | 1 / 1 file | 0 / 2 | [BankBranch.cs:281](../../../UBClasses/BankBranch.cs#L281) |
| `UBBankBranchVerify` | [Shared / Other](by-topic/shared-other.md) | [L193065](../../../ScriptDB/000_4_CreateSP.sql#L193065) | — | 6 / 2 | — |
| `UBBankInfo` | [Shared / Other](by-topic/shared-other.md) | [L193133](../../../ScriptDB/000_4_CreateSP.sql#L193133) | 1 / 1 file | 0 / 0 | [Bank.cs:36](../../../UBClasses/Bank.cs#L36) |
| `UBBankList` | [Shared / Other](by-topic/shared-other.md) | [L193169](../../../ScriptDB/000_4_CreateSP.sql#L193169) | 1 / 1 file | 0 / 0 | [Bank.cs:189](../../../UBClasses/Bank.cs#L189) |
| `UBBankRemove` | [Shared / Other](by-topic/shared-other.md) | [L193208](../../../ScriptDB/000_4_CreateSP.sql#L193208) | 1 / 1 file | 0 / 0 | [Bank.cs:360](../../../UBClasses/Bank.cs#L360) |
| `UBBankUpdate` | [Shared / Other](by-topic/shared-other.md) | [L193252](../../../ScriptDB/000_4_CreateSP.sql#L193252) | 1 / 1 file | 0 / 2 | [Bank.cs:294](../../../UBClasses/Bank.cs#L294) |
| `UBBasketItemInfo` | [Shared / Other](by-topic/shared-other.md) | [L193305](../../../ScriptDB/000_4_CreateSP.sql#L193305) | 1 / 1 file | 0 / 0 | [Trx.cs:5151](../../../UBClasses/Trx.cs#L5151) |
| `UBBasketList` | [Shared / Other](by-topic/shared-other.md) | [L193365](../../../ScriptDB/000_4_CreateSP.sql#L193365) | 1 / 1 file | 0 / 0 | [Trx.cs:4773](../../../UBClasses/Trx.cs#L4773) |
| `UBBasketPlanID` | [Account & Plan](by-topic/account-plan.md) | [L193541](../../../ScriptDB/000_4_CreateSP.sql#L193541) | 1 / 1 file | 0 / 0 | [Trx.cs:6466](../../../UBClasses/Trx.cs#L6466) |
| `UBBasketProcessAll` | [Shared / Other](by-topic/shared-other.md) | [L193557](../../../ScriptDB/000_4_CreateSP.sql#L193557) | 1 / 1 file | 0 / 5 | [Trx.cs:5095](../../../UBClasses/Trx.cs#L5095) |
| `UBBasketProcessOne` | [Shared / Other](by-topic/shared-other.md) | [L193889](../../../ScriptDB/000_4_CreateSP.sql#L193889) | — | 1 / 5 | — |
| `UBBasketRemove` | [Shared / Other](by-topic/shared-other.md) | [L194157](../../../ScriptDB/000_4_CreateSP.sql#L194157) | — | 0 / 0 | — |
| `UBBasketSelectionUpdate` | [Shared / Other](by-topic/shared-other.md) | [L194196](../../../ScriptDB/000_4_CreateSP.sql#L194196) | — | 0 / 0 | — |
| `UBBasketViewList` | [Shared / Other](by-topic/shared-other.md) | [L194233](../../../ScriptDB/000_4_CreateSP.sql#L194233) | 1 / 1 file | 0 / 1 | [Trx.cs:6376](../../../UBClasses/Trx.cs#L6376) |
| `UBBeneficiaryList` | [Client & KYC](by-topic/client-kyc.md) | [L194494](../../../ScriptDB/000_4_CreateSP.sql#L194494) | 1 / 1 file | 0 / 1 | [Plan.cs:4466](../../../UBClasses/Plan.cs#L4466) |
| `UBBenItemInfo` | [Shared / Other](by-topic/shared-other.md) | [L194746](../../../ScriptDB/000_4_CreateSP.sql#L194746) | 1 / 1 file | 0 / 0 | [Plan.cs:5088](../../../UBClasses/Plan.cs#L5088) |
| `UBBenItemInfo4RESP` | [Account & Plan](by-topic/account-plan.md) | [L194791](../../../ScriptDB/000_4_CreateSP.sql#L194791) | 1 / 1 file | 0 / 1 | [Plan.cs:5139](../../../UBClasses/Plan.cs#L5139) |
| `UBBenNewContributionList` | [Shared / Other](by-topic/shared-other.md) | [L194888](../../../ScriptDB/000_4_CreateSP.sql#L194888) | 1 / 1 file | 1 / 0 | [Plan.cs:4918](../../../UBClasses/Plan.cs#L4918) |
| `UBBenRecordTypeList` | [Shared / Other](by-topic/shared-other.md) | [L195002](../../../ScriptDB/000_4_CreateSP.sql#L195002) | — | 2 / 0 | — |
| `UBBenTypeList` | [Shared / Other](by-topic/shared-other.md) | [L195028](../../../ScriptDB/000_4_CreateSP.sql#L195028) | — | 3 / 0 | — |
| `UBBranchList` | [Shared / Other](by-topic/shared-other.md) | [L195058](../../../ScriptDB/000_4_CreateSP.sql#L195058) | 1 / 1 file | 0 / 1 | [DealerBranch.cs:105](../../../UBClasses/DealerBranch.cs#L105) |
| `UBBulkConversionBasketList4Pdf` | [Trading & Orders](by-topic/trading-orders.md) | [L195099](../../../ScriptDB/000_4_CreateSP.sql#L195099) | 1 / 1 file | 0 / 0 | [CBulkConversionBasket.cs:892](../../../VieFUNDPdf/CBulkConversionBasket.cs#L892) |
| `UBBulkConversionBasketPdf` | [Trading & Orders](by-topic/trading-orders.md) | [L195122](../../../ScriptDB/000_4_CreateSP.sql#L195122) | 1 / 1 file | 0 / 3 | [CBulkConversionBasket.cs:783](../../../VieFUNDPdf/CBulkConversionBasket.cs#L783) |
| `UBBulkConversionBasketPdfLoad` | [Trading & Orders](by-topic/trading-orders.md) | [L195465](../../../ScriptDB/000_4_CreateSP.sql#L195465) | 1 / 1 file | 0 / 0 | [CBulkConversionBasket.cs:338](../../../VieFUNDPdf/CBulkConversionBasket.cs#L338) |
| `UBBulkConversionBasketPdfSave` | [Trading & Orders](by-topic/trading-orders.md) | [L195499](../../../ScriptDB/000_4_CreateSP.sql#L195499) | 1 / 1 file | 0 / 1 | [CBulkConversionBasket.cs:854](../../../VieFUNDPdf/CBulkConversionBasket.cs#L854) |
| `UBBulkConversionBasketPendingList` | [Trading & Orders](by-topic/trading-orders.md) | [L195533](../../../ScriptDB/000_4_CreateSP.sql#L195533) | 1 / 1 file | 0 / 1 | [BulkSwitchBasket.cs:192](../../../UBClasses/BulkSwitchBasket.cs#L192) |
| `UBBulkSwitchBasketAdd` | [Trading & Orders](by-topic/trading-orders.md) | [L195713](../../../ScriptDB/000_4_CreateSP.sql#L195713) | — | 0 / 1 | — |
| `UBBulkSwitchBasketComboList` | [Trading & Orders](by-topic/trading-orders.md) | [L195879](../../../ScriptDB/000_4_CreateSP.sql#L195879) | — | 0 / 5 | — |
| `UBBulkSwitchBasketGenerateTrx` | [Trading & Orders](by-topic/trading-orders.md) | [L195915](../../../ScriptDB/000_4_CreateSP.sql#L195915) | 1 / 1 file | 0 / 1 | [BulkSwitchBasket.cs:975](../../../UBClasses/BulkSwitchBasket.cs#L975) |
| `UBBulkSwitchBasketGenerateTrxOne` | [Trading & Orders](by-topic/trading-orders.md) | [L195955](../../../ScriptDB/000_4_CreateSP.sql#L195955) | — | 1 / 4 | — |
| `UBBulkSwitchBasketGetType` | [Trading & Orders](by-topic/trading-orders.md) | [L196247](../../../ScriptDB/000_4_CreateSP.sql#L196247) | 1 / 1 file | 0 / 0 | [BulkSwitchBasket.cs:143](../../../UBClasses/BulkSwitchBasket.cs#L143) |
| `UBBulkSwitchBasketInfo` | [Trading & Orders](by-topic/trading-orders.md) | [L196270](../../../ScriptDB/000_4_CreateSP.sql#L196270) | 1 / 1 file | 0 / 0 | [BulkSwitchBasket.cs:798](../../../UBClasses/BulkSwitchBasket.cs#L798) |
| `UBBulkSwitchBasketItemAdd` | [Trading & Orders](by-topic/trading-orders.md) | [L196332](../../../ScriptDB/000_4_CreateSP.sql#L196332) | — | 2 / 1 | — |
| `UBBulkSwitchBasketItemInfo` | [Trading & Orders](by-topic/trading-orders.md) | [L196364](../../../ScriptDB/000_4_CreateSP.sql#L196364) | 1 / 1 file | 0 / 0 | [BulkSwitchBasket.cs:929](../../../UBClasses/BulkSwitchBasket.cs#L929) |
| `UBBulkSwitchBasketList` | [Trading & Orders](by-topic/trading-orders.md) | [L196445](../../../ScriptDB/000_4_CreateSP.sql#L196445) | 1 / 1 file | 0 / 1 | [BulkSwitchBasket.cs:542](../../../UBClasses/BulkSwitchBasket.cs#L542) |
| `UBBulkSwitchBasketList4Pdf` | [Trading & Orders](by-topic/trading-orders.md) | [L196745](../../../ScriptDB/000_4_CreateSP.sql#L196745) | 1 / 1 file | 0 / 0 | [CBulkSwitchBasket.cs:134](../../../VieFUNDPdf/CBulkSwitchBasket.cs#L134) |
| `UBBulkSwitchBasketListSummary` | [Trading & Orders](by-topic/trading-orders.md) | [L196769](../../../ScriptDB/000_4_CreateSP.sql#L196769) | 1 / 1 file | 0 / 0 | [BulkSwitchBasket.cs:606](../../../UBClasses/BulkSwitchBasket.cs#L606) |
| `UBBulkSwitchBasketMarkAsCompletedOne` | [Trading & Orders](by-topic/trading-orders.md) | [L196817](../../../ScriptDB/000_4_CreateSP.sql#L196817) | — | 1 / 0 | — |
| `UBBulkSwitchBasketMarkAsCompletedTaggedItems` | [Trading & Orders](by-topic/trading-orders.md) | [L196842](../../../ScriptDB/000_4_CreateSP.sql#L196842) | — | 0 / 1 | — |
| `UBBulkSwitchBasketPdf` | [Trading & Orders](by-topic/trading-orders.md) | [L196886](../../../ScriptDB/000_4_CreateSP.sql#L196886) | 1 / 1 file | 0 / 3 | [CBulkSwitchBasket.cs:882](../../../VieFUNDPdf/CBulkSwitchBasket.cs#L882) |
| `UBBulkSwitchBasketPdf_Old` | [Trading & Orders](by-topic/trading-orders.md) | [L197280](../../../ScriptDB/000_4_CreateSP.sql#L197280) | — | 0 / 3 | — |
| `UBBulkSwitchBasketPdfLoad` | [Trading & Orders](by-topic/trading-orders.md) | [L197620](../../../ScriptDB/000_4_CreateSP.sql#L197620) | 1 / 1 file | 0 / 0 | [CBulkSwitchBasket.cs:474](../../../VieFUNDPdf/CBulkSwitchBasket.cs#L474) |
| `UBBulkSwitchBasketPdfSave` | [Trading & Orders](by-topic/trading-orders.md) | [L197653](../../../ScriptDB/000_4_CreateSP.sql#L197653) | 1 / 1 file | 0 / 1 | [CBulkSwitchBasket.cs:953](../../../VieFUNDPdf/CBulkSwitchBasket.cs#L953) |
| `UBBulkSwitchBasketPendingList` | [Trading & Orders](by-topic/trading-orders.md) | [L197686](../../../ScriptDB/000_4_CreateSP.sql#L197686) | 1 / 1 file | 0 / 1 | [BulkSwitchBasket.cs:83](../../../UBClasses/BulkSwitchBasket.cs#L83) |
| `UBBulkSwitchBasketPendingSelectionUpdate` | [Trading & Orders](by-topic/trading-orders.md) | [L197855](../../../ScriptDB/000_4_CreateSP.sql#L197855) | — | 0 / 0 | — |
| `UBBulkSwitchBasketPlanAdd` | [Account & Plan](by-topic/account-plan.md) | [L197902](../../../ScriptDB/000_4_CreateSP.sql#L197902) | — | 1 / 0 | — |
| `UBBulkSwitchBasketRemove` | [Trading & Orders](by-topic/trading-orders.md) | [L197941](../../../ScriptDB/000_4_CreateSP.sql#L197941) | 1 / 1 file | 0 / 0 | [BulkSwitchBasket.cs:841](../../../UBClasses/BulkSwitchBasket.cs#L841) |
| `UBBulkSwitchBasketReverse` | [Trading & Orders](by-topic/trading-orders.md) | [L197979](../../../ScriptDB/000_4_CreateSP.sql#L197979) | — | 0 / 1 | — |
| `UBBulkSwitchBasketReverseOne` | [Trading & Orders](by-topic/trading-orders.md) | [L198046](../../../ScriptDB/000_4_CreateSP.sql#L198046) | — | 1 / 0 | — |
| `UBBulkSwitchBasketSelectionUpdate` | [Trading & Orders](by-topic/trading-orders.md) | [L198166](../../../ScriptDB/000_4_CreateSP.sql#L198166) | — | 0 / 0 | — |
| `UBBulkSwitchBasketStatusList` | [Trading & Orders](by-topic/trading-orders.md) | [L198200](../../../ScriptDB/000_4_CreateSP.sql#L198200) | — | 1 / 0 | — |
| `UBBulkSwitchBasketTaggedList` | [Trading & Orders](by-topic/trading-orders.md) | [L198217](../../../ScriptDB/000_4_CreateSP.sql#L198217) | 1 / 1 file | 0 / 0 | [BulkSwitchBasket.cs:1067](../../../UBClasses/BulkSwitchBasket.cs#L1067) |
| `UBBulkSwitchBasketTextItemInfo` | [Trading & Orders](by-topic/trading-orders.md) | [L198241](../../../ScriptDB/000_4_CreateSP.sql#L198241) | 1 / 1 file | 0 / 0 | [BulkSwitchBasket.cs:1717](../../../UBClasses/BulkSwitchBasket.cs#L1717) |
| `UBBulkSwitchBasketTextItemUpdate` | [Trading & Orders](by-topic/trading-orders.md) | [L198256](../../../ScriptDB/000_4_CreateSP.sql#L198256) | — | 0 / 0 | — |
| `UBBulkSwitchBasketTextKeyList` | [Trading & Orders](by-topic/trading-orders.md) | [L198276](../../../ScriptDB/000_4_CreateSP.sql#L198276) | 1 / 1 file | 0 / 0 | [BulkSwitchBasket.cs:1678](../../../UBClasses/BulkSwitchBasket.cs#L1678) |
| `UBBulkSwitchBasketUpdate` | [Trading & Orders](by-topic/trading-orders.md) | [L198305](../../../ScriptDB/000_4_CreateSP.sql#L198305) | — | 0 / 1 | — |
| `UBBulkSwitchInit` | [Trading & Orders](by-topic/trading-orders.md) | [L198671](../../../ScriptDB/000_4_CreateSP.sql#L198671) | — | 0 / 0 | — |
| `UBBulkSwitchList` | [Trading & Orders](by-topic/trading-orders.md) | [L198729](../../../ScriptDB/000_4_CreateSP.sql#L198729) | 1 / 1 file | 0 / 1 | [FundAccount.cs:1988](../../../UBClasses/FundAccount.cs#L1988) |
| `UBBulkSwitchPendingSelectionUpdate` | [Trading & Orders](by-topic/trading-orders.md) | [L199192](../../../ScriptDB/000_4_CreateSP.sql#L199192) | — | 0 / 0 | — |
| `UBBulkSwitchProcess` | [Trading & Orders](by-topic/trading-orders.md) | [L199239](../../../ScriptDB/000_4_CreateSP.sql#L199239) | — | 0 / 5 | — |
| `UBBulkSwitchSelectionUpdate` | [Trading & Orders](by-topic/trading-orders.md) | [L199494](../../../ScriptDB/000_4_CreateSP.sql#L199494) | — | 0 / 0 | — |
| `UBBusinessTypeList` | [Shared / Other](by-topic/shared-other.md) | [L199539](../../../ScriptDB/000_4_CreateSP.sql#L199539) | — | 1 / 0 | — |
| `UBCalcRetirement` | [Shared / Other](by-topic/shared-other.md) | [L199572](../../../ScriptDB/000_4_CreateSP.sql#L199572) | 1 / 1 file | 0 / 0 | [Customer.cs:5224](../../../UBClasses/Customer.cs#L5224) |
| `UBCannexDealerStatusUpdate` | [Shared / Other](by-topic/shared-other.md) | [L199758](../../../ScriptDB/000_4_CreateSP.sql#L199758) | 1 / 1 file | 0 / 0 | [Dealer.cs:620](../../../UBClasses/Dealer.cs#L620) |
| `UBCannexFileDef` | [Shared / Other](by-topic/shared-other.md) | [L199775](../../../ScriptDB/000_4_CreateSP.sql#L199775) | — | 0 / 0 | — |
| `UBCannexGetOneItemAddress` | [Shared / Other](by-topic/shared-other.md) | [L199818](../../../ScriptDB/000_4_CreateSP.sql#L199818) | 1 / 1 file | 0 / 1 | [CannexOrder.cs:356](../../../UBFFImport/CannexOrder.cs#L356) |
| `UBCannexGetPending` | [Shared / Other](by-topic/shared-other.md) | [L200807](../../../ScriptDB/000_4_CreateSP.sql#L200807) | 1 / 1 file | 0 / 1 | [CannexOrder.cs:279](../../../UBFFImport/CannexOrder.cs#L279) |
| `UBCannexOrderConfirmAddRecord` | [Trading & Orders](by-topic/trading-orders.md) | [L201167](../../../ScriptDB/000_4_CreateSP.sql#L201167) | — | 0 / 1 | — |
| `UBCannexOrderConfirmAddRecordAddress` | [Trading & Orders](by-topic/trading-orders.md) | [L201310](../../../ScriptDB/000_4_CreateSP.sql#L201310) | — | 0 / 0 | — |
| `UBCannexOrderConfirmAddRecordNote` | [Trading & Orders](by-topic/trading-orders.md) | [L201376](../../../ScriptDB/000_4_CreateSP.sql#L201376) | — | 0 / 0 | — |
| `UBCannexOrderCreateFileName` | [Trading & Orders](by-topic/trading-orders.md) | [L201396](../../../ScriptDB/000_4_CreateSP.sql#L201396) | — | 1 / 0 | — |
| `UBCannexProcessOneItem_Term1_3_7` | [Shared / Other](by-topic/shared-other.md) | [L201468](../../../ScriptDB/000_4_CreateSP.sql#L201468) | — | 0 / 2 | — |
| `UBCannexProcessOneItem_Term2_3_7` | [Shared / Other](by-topic/shared-other.md) | [L201572](../../../ScriptDB/000_4_CreateSP.sql#L201572) | — | 0 / 2 | — |
| `UBCannexProcessOneLine` | [Shared / Other](by-topic/shared-other.md) | [L201730](../../../ScriptDB/000_4_CreateSP.sql#L201730) | — | 1 / 0 | — |
| `UBCannexProcessResponse` | [Account & Plan](by-topic/account-plan.md) | [L201830](../../../ScriptDB/000_4_CreateSP.sql#L201830) | — | 0 / 1 | — |
| `UBCannexSaveCutOffTime` | [Shared / Other](by-topic/shared-other.md) | [L201924](../../../ScriptDB/000_4_CreateSP.sql#L201924) | — | 1 / 1 | — |
| `UBCannexTERMWAddRecord` | [Shared / Other](by-topic/shared-other.md) | [L201938](../../../ScriptDB/000_4_CreateSP.sql#L201938) | — | 0 / 0 | — |
| `UBCannexTERMWAddRecordAddress` | [Shared / Other](by-topic/shared-other.md) | [L202005](../../../ScriptDB/000_4_CreateSP.sql#L202005) | — | 0 / 0 | — |
| `UBCannexTERMWUpdateRecord` | [Shared / Other](by-topic/shared-other.md) | [L202039](../../../ScriptDB/000_4_CreateSP.sql#L202039) | — | 0 / 0 | — |
| `UBCannexTrxReconAddRecord` | [Trading & Orders](by-topic/trading-orders.md) | [L202064](../../../ScriptDB/000_4_CreateSP.sql#L202064) | — | 0 / 0 | — |
| `UBCannexVerify` | [Shared / Other](by-topic/shared-other.md) | [L202125](../../../ScriptDB/000_4_CreateSP.sql#L202125) | — | 1 / 1 | — |
| `UBCanSellConversion` | [Trading & Orders](by-topic/trading-orders.md) | [L202292](../../../ScriptDB/000_4_CreateSP.sql#L202292) | — | 0 / 0 | — |
| `UBCashAccountAdd` | [Account & Plan](by-topic/account-plan.md) | [L202305](../../../ScriptDB/000_4_CreateSP.sql#L202305) | 1 / 1 file | 0 / 4 | [CashAccount.cs:237](../../../UBClasses/CashAccount.cs#L237) |
| `UBCashAccountClientList` | [Account & Plan](by-topic/account-plan.md) | [L202405](../../../ScriptDB/000_4_CreateSP.sql#L202405) | 1 / 1 file | 0 / 0 | [CashAccount.cs:1014](../../../UBClasses/CashAccount.cs#L1014) |
| `UBCashAccountContribution` | [Account & Plan](by-topic/account-plan.md) | [L202475](../../../ScriptDB/000_4_CreateSP.sql#L202475) | — | 1 / 1 | — |
| `UBCashAccountDeposit` | [Account & Plan](by-topic/account-plan.md) | [L202579](../../../ScriptDB/000_4_CreateSP.sql#L202579) | — | 1 / 1 | — |
| `UBCashAccountDetailX` | [Account & Plan](by-topic/account-plan.md) | [L202787](../../../ScriptDB/000_4_CreateSP.sql#L202787) | — | 0 / 0 | — |
| `UBCashAccountFixByAddingExternalTrx` | [Account & Plan](by-topic/account-plan.md) | [L202881](../../../ScriptDB/000_4_CreateSP.sql#L202881) | — | 0 / 1 | — |
| `UBCashAccountInactivate` | [Account & Plan](by-topic/account-plan.md) | [L202969](../../../ScriptDB/000_4_CreateSP.sql#L202969) | — | 1 / 4 | — |
| `UBCashAccountInfo` | [Account & Plan](by-topic/account-plan.md) | [L203022](../../../ScriptDB/000_4_CreateSP.sql#L203022) | 1 / 1 file | 0 / 1 | [CashAccount.cs:185](../../../UBClasses/CashAccount.cs#L185) |
| `UBCashAccountList` | [Account & Plan](by-topic/account-plan.md) | [L203095](../../../ScriptDB/000_4_CreateSP.sql#L203095) | 1 / 1 file | 0 / 4 | [CashAccount.cs:842](../../../UBClasses/CashAccount.cs#L842) |
| `UBCashAccountListFromTrust` | [Account & Plan](by-topic/account-plan.md) | [L203986](../../../ScriptDB/000_4_CreateSP.sql#L203986) | — | 1 / 3 | — |
| `UBCashAccountMoveAllFromPlan2Plan` | [Account & Plan](by-topic/account-plan.md) | [L204568](../../../ScriptDB/000_4_CreateSP.sql#L204568) | — | 0 / 1 | — |
| `UBCashAccountMoveFromPlan2Plan` | [Account & Plan](by-topic/account-plan.md) | [L204605](../../../ScriptDB/000_4_CreateSP.sql#L204605) | 1 / 1 file | 1 / 0 | [Plan.cs:3456](../../../UBClasses/Plan.cs#L3456) |
| `UBCashAccountMoveOneTrx` | [Account & Plan](by-topic/account-plan.md) | [L204634](../../../ScriptDB/000_4_CreateSP.sql#L204634) | — | 1 / 1 | — |
| `UBCashAccountMoveTrx` | [Account & Plan](by-topic/account-plan.md) | [L204653](../../../ScriptDB/000_4_CreateSP.sql#L204653) | 1 / 1 file | 0 / 0 | [Plan.cs:3502](../../../UBClasses/Plan.cs#L3502) |
| `UBCashAccountPlanID` | [Account & Plan](by-topic/account-plan.md) | [L204706](../../../ScriptDB/000_4_CreateSP.sql#L204706) | 1 / 1 file | 0 / 0 | [CashAccount.cs:1108](../../../UBClasses/CashAccount.cs#L1108) |
| `UBCashAccountRemove` | [Account & Plan](by-topic/account-plan.md) | [L204740](../../../ScriptDB/000_4_CreateSP.sql#L204740) | 1 / 1 file | 0 / 0 | [CashAccount.cs:299](../../../UBClasses/CashAccount.cs#L299) |
| `UBCashAccountSearchCriteriaSave` | [Account & Plan](by-topic/account-plan.md) | [L204800](../../../ScriptDB/000_4_CreateSP.sql#L204800) | — | 2 / 3 | — |
| `UBCashAccountSyncBalance` | [Account & Plan](by-topic/account-plan.md) | [L204878](../../../ScriptDB/000_4_CreateSP.sql#L204878) | — | 0 / 0 | — |
| `UBCashAccountSyncTrustTrx` | [Account & Plan](by-topic/account-plan.md) | [L204931](../../../ScriptDB/000_4_CreateSP.sql#L204931) | — | 2 / 4 | — |
| `UBCashAccountSyncTrustTrx1Plan` | [Account & Plan](by-topic/account-plan.md) | [L205124](../../../ScriptDB/000_4_CreateSP.sql#L205124) | — | 0 / 1 | — |
| `UBCashAccountTrxAdd` | [Account & Plan](by-topic/account-plan.md) | [L205196](../../../ScriptDB/000_4_CreateSP.sql#L205196) | 1 / 1 file | 1 / 0 | [CashAccount.cs:540](../../../UBClasses/CashAccount.cs#L540) |
| `UBCashAccountTrxAddInternal` | [Account & Plan](by-topic/account-plan.md) | [L205391](../../../ScriptDB/000_4_CreateSP.sql#L205391) | — | 2 / 1 | — |
| `UBCashAccountTrxAddTrx` | [Account & Plan](by-topic/account-plan.md) | [L205505](../../../ScriptDB/000_4_CreateSP.sql#L205505) | — | 2 / 2 | — |
| `UBCashAccountTrxComboList` | [Account & Plan](by-topic/account-plan.md) | [L205667](../../../ScriptDB/000_4_CreateSP.sql#L205667) | — | 0 / 3 | — |
| `UBCashAccountTrxDeleteTrx` | [Account & Plan](by-topic/account-plan.md) | [L205694](../../../ScriptDB/000_4_CreateSP.sql#L205694) | — | 0 / 2 | — |
| `UBCashAccountTrxInfo` | [Account & Plan](by-topic/account-plan.md) | [L205762](../../../ScriptDB/000_4_CreateSP.sql#L205762) | 1 / 1 file | 0 / 0 | [CashAccount.cs:484](../../../UBClasses/CashAccount.cs#L484) |
| `UBCashAccountTrxList` | [Account & Plan](by-topic/account-plan.md) | [L205860](../../../ScriptDB/000_4_CreateSP.sql#L205860) | 1 / 1 file | 0 / 3 | [CashAccount.cs:929](../../../UBClasses/CashAccount.cs#L929) |
| `UBCashAccountTrxList_Daily` | [Account & Plan](by-topic/account-plan.md) | [L206624](../../../ScriptDB/000_4_CreateSP.sql#L206624) | — | 0 / 0 | — |
| `UBCashAccountTrxList_Monthly` | [Account & Plan](by-topic/account-plan.md) | [L206759](../../../ScriptDB/000_4_CreateSP.sql#L206759) | — | 1 / 0 | — |
| `UBCashAccountTrxListAll` | [Account & Plan](by-topic/account-plan.md) | [L206947](../../../ScriptDB/000_4_CreateSP.sql#L206947) | — | 0 / 0 | — |
| `UBCashAccountTrxListX` | [Account & Plan](by-topic/account-plan.md) | [L207258](../../../ScriptDB/000_4_CreateSP.sql#L207258) | — | 0 / 0 | — |
| `UBCashAccountTrxRemove` | [Account & Plan](by-topic/account-plan.md) | [L207341](../../../ScriptDB/000_4_CreateSP.sql#L207341) | 1 / 1 file | 1 / 1 | [CashAccount.cs:612](../../../UBClasses/CashAccount.cs#L612) |
| `UBCashAccountTrxRemoveByTrustID` | [Account & Plan](by-topic/account-plan.md) | [L207409](../../../ScriptDB/000_4_CreateSP.sql#L207409) | — | 0 / 1 | — |
| `UBCashAccountTrxReversal` | [Account & Plan](by-topic/account-plan.md) | [L207451](../../../ScriptDB/000_4_CreateSP.sql#L207451) | — | 1 / 0 | — |
| `UBCashAccountTrxStatusUpdate` | [Account & Plan](by-topic/account-plan.md) | [L207493](../../../ScriptDB/000_4_CreateSP.sql#L207493) | — | 1 / 1 | — |
| `UBCashAccountTrxUpdate` | [Account & Plan](by-topic/account-plan.md) | [L207557](../../../ScriptDB/000_4_CreateSP.sql#L207557) | 1 / 1 file | 0 / 0 | [CashAccount.cs:540](../../../UBClasses/CashAccount.cs#L540) |
| `UBCashAccountUnitBalanceMKV` | [Account & Plan](by-topic/account-plan.md) | [L207650](../../../ScriptDB/000_4_CreateSP.sql#L207650) | — | 1 / 0 | — |
| `UBCashAccountUpdate` | [Account & Plan](by-topic/account-plan.md) | [L207711](../../../ScriptDB/000_4_CreateSP.sql#L207711) | 1 / 1 file | 0 / 4 | [CashAccount.cs:237](../../../UBClasses/CashAccount.cs#L237) |
| `UBCashAccountVerifyNominee` | [Account & Plan](by-topic/account-plan.md) | [L207812](../../../ScriptDB/000_4_CreateSP.sql#L207812) | — | 5 / 0 | — |
| `UBCashAccountZeroOut` | [Account & Plan](by-topic/account-plan.md) | [L207894](../../../ScriptDB/000_4_CreateSP.sql#L207894) | — | 0 / 0 | — |
| `UBCashAcctDesc` | [Account & Plan](by-topic/account-plan.md) | [L207938](../../../ScriptDB/000_4_CreateSP.sql#L207938) | 1 / 1 file | 0 / 0 | [CashAccount.cs:661](../../../UBClasses/CashAccount.cs#L661) |
| `UBCashCompareFG` | [Account & Plan](by-topic/account-plan.md) | [L207965](../../../ScriptDB/000_4_CreateSP.sql#L207965) | — | 0 / 0 | — |
| `UBCashListOneAccountTrx` | [Account & Plan](by-topic/account-plan.md) | [L208006](../../../ScriptDB/000_4_CreateSP.sql#L208006) | 1 / 1 file | 0 / 0 | [CashAccount.cs:432](../../../UBClasses/CashAccount.cs#L432) |
| `UBCashListOnePlan` | [Account & Plan](by-topic/account-plan.md) | [L208396](../../../ScriptDB/000_4_CreateSP.sql#L208396) | 1 / 1 file | 1 / 1 | [CashAccount.cs:135](../../../UBClasses/CashAccount.cs#L135) |
| `UBCashListOnePlanShort` | [Account & Plan](by-topic/account-plan.md) | [L208555](../../../ScriptDB/000_4_CreateSP.sql#L208555) | 1 / 1 file | 0 / 0 | [CashAccount.cs:757](../../../UBClasses/CashAccount.cs#L757) |
| `UBCashTrxCleanupDuplication` | [Account & Plan](by-topic/account-plan.md) | [L208595](../../../ScriptDB/000_4_CreateSP.sql#L208595) | — | 0 / 0 | — |
| `UBCashTrxClientList` | [Account & Plan](by-topic/account-plan.md) | [L208647](../../../ScriptDB/000_4_CreateSP.sql#L208647) | 1 / 1 file | 0 / 0 | [CashAccount.cs:1064](../../../UBClasses/CashAccount.cs#L1064) |
| `UBCashTrxDesc` | [Account & Plan](by-topic/account-plan.md) | [L208697](../../../ScriptDB/000_4_CreateSP.sql#L208697) | 1 / 1 file | 0 / 0 | [CashAccount.cs:712](../../../UBClasses/CashAccount.cs#L712) |
| `UBCashTrxMoveFromCAD2USD` | [Account & Plan](by-topic/account-plan.md) | [L208725](../../../ScriptDB/000_4_CreateSP.sql#L208725) | — | 0 / 1 | — |
| `UBCashTrxSearchCriteriaSave` | [Account & Plan](by-topic/account-plan.md) | [L208764](../../../ScriptDB/000_4_CreateSP.sql#L208764) | — | 1 / 3 | — |
| `UBCashTrxSyncTrustTrx` | [Account & Plan](by-topic/account-plan.md) | [L208828](../../../ScriptDB/000_4_CreateSP.sql#L208828) | — | 0 / 0 | — |
| `UBCashTrxTypeList` | [Account & Plan](by-topic/account-plan.md) | [L208851](../../../ScriptDB/000_4_CreateSP.sql#L208851) | — | 1 / 0 | — |
| `UBCashUpdateBalanceWithCalc` | [Account & Plan](by-topic/account-plan.md) | [L208885](../../../ScriptDB/000_4_CreateSP.sql#L208885) | 1 / 1 file | 20 / 0 | [CashAccount.cs:386](../../../UBClasses/CashAccount.cs#L386) |
| `UBCashUpdateBalanceWithCalcAll` | [Account & Plan](by-topic/account-plan.md) | [L208965](../../../ScriptDB/000_4_CreateSP.sql#L208965) | — | 0 / 1 | — |
| `UBCashUpdateBalanceWithCalcAll_Agra_Ex` | [Account & Plan](by-topic/account-plan.md) | [L209018](../../../ScriptDB/000_4_CreateSP.sql#L209018) | — | 0 / 1 | — |
| `UBCashUpdateBalanceWithCalcByIntCode` | [Account & Plan](by-topic/account-plan.md) | [L209048](../../../ScriptDB/000_4_CreateSP.sql#L209048) | — | 0 / 1 | — |
| `UBCashUpdateBalanceWithCalcRev` | [Account & Plan](by-topic/account-plan.md) | [L209086](../../../ScriptDB/000_4_CreateSP.sql#L209086) | — | 1 / 0 | — |
| `UBCashUpdateBalanceWithCalcRevA` | [Account & Plan](by-topic/account-plan.md) | [L209150](../../../ScriptDB/000_4_CreateSP.sql#L209150) | — | 1 / 0 | — |
| `UBCashUpdateBalanceWithCalcRevAll` | [Account & Plan](by-topic/account-plan.md) | [L209208](../../../ScriptDB/000_4_CreateSP.sql#L209208) | — | 0 / 2 | — |
| `UBCashViewComboList` | [Account & Plan](by-topic/account-plan.md) | [L209256](../../../ScriptDB/000_4_CreateSP.sql#L209256) | — | 0 / 4 | — |
| `UBCDICData4XML` | [Shared / Other](by-topic/shared-other.md) | [L209284](../../../ScriptDB/000_4_CreateSP.sql#L209284) | — | 1 / 1 | — |
| `UBCDICDataInitUCI` | [Shared / Other](by-topic/shared-other.md) | [L209513](../../../ScriptDB/000_4_CreateSP.sql#L209513) | — | 0 / 0 | — |
| `UBCDICDataInitUCIOneClient` | [Client & KYC](by-topic/client-kyc.md) | [L209679](../../../ScriptDB/000_4_CreateSP.sql#L209679) | — | 3 / 2 | — |
| `UBCDICDataInitUCIOnePlan` | [Account & Plan](by-topic/account-plan.md) | [L209709](../../../ScriptDB/000_4_CreateSP.sql#L209709) | — | 3 / 0 | — |
| `UBCDICDataInitUCIOnePlanX` | [Account & Plan](by-topic/account-plan.md) | [L209980](../../../ScriptDB/000_4_CreateSP.sql#L209980) | — | 1 / 0 | — |
| `UBCDICDataListUCI` | [Shared / Other](by-topic/shared-other.md) | [L210200](../../../ScriptDB/000_4_CreateSP.sql#L210200) | 1 / 1 file | 2 / 1 | [Customer.cs:5673](../../../UBClasses/Customer.cs#L5673) |
| `UBCDICPlanList` | [Account & Plan](by-topic/account-plan.md) | [L210281](../../../ScriptDB/000_4_CreateSP.sql#L210281) | — | 0 / 0 | — |
| `UBCDICScanAll` | [Shared / Other](by-topic/shared-other.md) | [L210314](../../../ScriptDB/000_4_CreateSP.sql#L210314) | — | 1 / 1 | — |
| `UBCertificateList` | [Shared / Other](by-topic/shared-other.md) | [L210354](../../../ScriptDB/000_4_CreateSP.sql#L210354) | — | 3 / 0 | — |
| `UBCheckParams` | [Shared / Other](by-topic/shared-other.md) | [L210384](../../../ScriptDB/000_4_CreateSP.sql#L210384) | — | 1 / 0 | — |
| `UBChequeFromPayrollAdd` | [Commission & Fee](by-topic/commission-fee.md) | [L210411](../../../ScriptDB/000_4_CreateSP.sql#L210411) | — | 1 / 0 | — |
| `UBChequeGetID4Client` | [Client & KYC](by-topic/client-kyc.md) | [L210505](../../../ScriptDB/000_4_CreateSP.sql#L210505) | — | 1 / 0 | — |
| `UBChequeGetID4Dealer` | [Shared / Other](by-topic/shared-other.md) | [L210599](../../../ScriptDB/000_4_CreateSP.sql#L210599) | — | 1 / 0 | — |
| `UBChequeGetID4Member` | [Shared / Other](by-topic/shared-other.md) | [L210687](../../../ScriptDB/000_4_CreateSP.sql#L210687) | — | 0 / 0 | — |
| `UBChequeGetID4Mgmt` | [Shared / Other](by-topic/shared-other.md) | [L210769](../../../ScriptDB/000_4_CreateSP.sql#L210769) | — | 1 / 0 | — |
| `UBChequeInfoDefault` | [Shared / Other](by-topic/shared-other.md) | [L210864](../../../ScriptDB/000_4_CreateSP.sql#L210864) | — | 0 / 0 | — |
| `UBChequeNumberGet` | [Shared / Other](by-topic/shared-other.md) | [L210910](../../../ScriptDB/000_4_CreateSP.sql#L210910) | — | 0 / 0 | — |
| `UBChequeNumberLast` | [Shared / Other](by-topic/shared-other.md) | [L210937](../../../ScriptDB/000_4_CreateSP.sql#L210937) | 1 / 1 file | 0 / 0 | [BankAccount.cs:772](../../../UBClasses/BankAccount.cs#L772) |
| `UBChequeNumberSet` | [Shared / Other](by-topic/shared-other.md) | [L210966](../../../ScriptDB/000_4_CreateSP.sql#L210966) | — | 1 / 0 | — |
| `UBChequeStatusList` | [Shared / Other](by-topic/shared-other.md) | [L210990](../../../ScriptDB/000_4_CreateSP.sql#L210990) | — | 1 / 0 | — |
| `UBCityAdd` | [Shared / Other](by-topic/shared-other.md) | [L211015](../../../ScriptDB/000_4_CreateSP.sql#L211015) | — | 6 / 0 | — |
| `UBCityList` | [Shared / Other](by-topic/shared-other.md) | [L211068](../../../ScriptDB/000_4_CreateSP.sql#L211068) | 1 / 1 file | 0 / 0 | [City.cs:89](../../../UBClasses/City.cs#L89) |
| `UBClearAllTMP` | [Shared / Other](by-topic/shared-other.md) | [L211118](../../../ScriptDB/000_4_CreateSP.sql#L211118) | — | 1 / 16 | — |
| `UBClientActivate` | [Client & KYC](by-topic/client-kyc.md) | [L211172](../../../ScriptDB/000_4_CreateSP.sql#L211172) | — | 2 / 3 | — |
| `UBClientActivate_FromInactive` | [Client & KYC](by-topic/client-kyc.md) | [L211231](../../../ScriptDB/000_4_CreateSP.sql#L211231) | — | 0 / 1 | — |
| `UBClientAddressAdd` | [Client & KYC](by-topic/client-kyc.md) | [L211268](../../../ScriptDB/000_4_CreateSP.sql#L211268) | — | 22 / 2 | — |
| `UBClientAddressDuplicate` | [Client & KYC](by-topic/client-kyc.md) | [L211359](../../../ScriptDB/000_4_CreateSP.sql#L211359) | — | 3 / 0 | — |
| `UBClientAddressList` | [Client & KYC](by-topic/client-kyc.md) | [L211402](../../../ScriptDB/000_4_CreateSP.sql#L211402) | 1 / 1 file | 0 / 1 | [Customer.cs:4272](../../../UBClasses/Customer.cs#L4272) |
| `UBClientAddressList_Old` | [Client & KYC](by-topic/client-kyc.md) | [L211557](../../../ScriptDB/000_4_CreateSP.sql#L211557) | — | 0 / 1 | — |
| `UBClientAddressListFreeUnitFlag` | [Client & KYC](by-topic/client-kyc.md) | [L211703](../../../ScriptDB/000_4_CreateSP.sql#L211703) | — | 0 / 1 | — |
| `UBClientAddressListShort` | [Client & KYC](by-topic/client-kyc.md) | [L211800](../../../ScriptDB/000_4_CreateSP.sql#L211800) | — | 0 / 1 | — |
| `UBClientAddressLog` | [Client & KYC](by-topic/client-kyc.md) | [L211935](../../../ScriptDB/000_4_CreateSP.sql#L211935) | — | 4 / 0 | — |
| `UBClientAddressPhoneRequestAdd` | [Client & KYC](by-topic/client-kyc.md) | [L212074](../../../ScriptDB/000_4_CreateSP.sql#L212074) | 1 / 1 file | 0 / 3 | [CAddress.cs:264](../../../UBClasses/CAddress.cs#L264) |
| `UBClientAddressRequestApproveAll` | [Client & KYC](by-topic/client-kyc.md) | [L212272](../../../ScriptDB/000_4_CreateSP.sql#L212272) | 1 / 1 file | 0 / 2 | [CAddress.cs:407](../../../UBClasses/CAddress.cs#L407) |
| `UBClientAddressRequestApproveOne` | [Client & KYC](by-topic/client-kyc.md) | [L212317](../../../ScriptDB/000_4_CreateSP.sql#L212317) | 1 / 1 file | 1 / 6 | [CAddress.cs:409](../../../UBClasses/CAddress.cs#L409) |
| `UBClientAddressRequestDeclineOne` | [Client & KYC](by-topic/client-kyc.md) | [L212501](../../../ScriptDB/000_4_CreateSP.sql#L212501) | 1 / 1 file | 0 / 1 | [CAddress.cs:460](../../../UBClasses/CAddress.cs#L460) |
| `UBClientAddressSupplierList` | [Client & KYC](by-topic/client-kyc.md) | [L212547](../../../ScriptDB/000_4_CreateSP.sql#L212547) | 1 / 1 file | 0 / 2 | [CAddress.cs:78](../../../UBClasses/CAddress.cs#L78) |
| `UBClientAddressSupplierLog` | [Client & KYC](by-topic/client-kyc.md) | [L212694](../../../ScriptDB/000_4_CreateSP.sql#L212694) | — | 1 / 0 | — |
| `UBClientAddressSupplierNFU` | [Fundserv & Import](by-topic/fundserv-import.md) | [L212750](../../../ScriptDB/000_4_CreateSP.sql#L212750) | 1 / 1 file | 0 / 1 | [CAddress.cs:511](../../../UBClasses/CAddress.cs#L511) |
| `UBClientAddressSupplierRemove` | [Client & KYC](by-topic/client-kyc.md) | [L212781](../../../ScriptDB/000_4_CreateSP.sql#L212781) | 1 / 1 file | 0 / 0 | [CAddress.cs:169](../../../UBClasses/CAddress.cs#L169) |
| `UBClientAddressUpdate` | [Client & KYC](by-topic/client-kyc.md) | [L212806](../../../ScriptDB/000_4_CreateSP.sql#L212806) | — | 10 / 3 | — |
| `UBClientAddUI` | [Client & KYC](by-topic/client-kyc.md) | [L212952](../../../ScriptDB/000_4_CreateSP.sql#L212952) | 1 / 1 file | 0 / 20 | [Customer.cs:2326](../../../UBClasses/Customer.cs#L2326) |
| `UBClientAnonymousOne` | [Client & KYC](by-topic/client-kyc.md) | [L213649](../../../ScriptDB/000_4_CreateSP.sql#L213649) | 1 / 1 file | 0 / 0 | [ExceptionReport.cs:401](../../../UBClasses/ExceptionReport.cs#L401) |
| `UBClientAnonymousOneUndo` | [Client & KYC](by-topic/client-kyc.md) | [L213686](../../../ScriptDB/000_4_CreateSP.sql#L213686) | 1 / 1 file | 0 / 0 | [ExceptionReport.cs:444](../../../UBClasses/ExceptionReport.cs#L444) |
| `UBClientAssetAsOf` | [Client & KYC](by-topic/client-kyc.md) | [L213721](../../../ScriptDB/000_4_CreateSP.sql#L213721) | — | 0 / 0 | — |
| `UBClientAssetLiquidList` | [Client & KYC](by-topic/client-kyc.md) | [L213795](../../../ScriptDB/000_4_CreateSP.sql#L213795) | — | 2 / 0 | — |
| `UBClientAssetLiquidSave` | [Client & KYC](by-topic/client-kyc.md) | [L213844](../../../ScriptDB/000_4_CreateSP.sql#L213844) | 1 / 1 file | 0 / 0 | [Customer.cs:5321](../../../UBClasses/Customer.cs#L5321) |
| `UBClientAssetOtherList` | [Client & KYC](by-topic/client-kyc.md) | [L213889](../../../ScriptDB/000_4_CreateSP.sql#L213889) | — | 2 / 0 | — |
| `UBClientAssetOtherSave` | [Client & KYC](by-topic/client-kyc.md) | [L213933](../../../ScriptDB/000_4_CreateSP.sql#L213933) | 1 / 1 file | 0 / 0 | [Customer.cs:5321](../../../UBClasses/Customer.cs#L5321) |
| `UBClientBankAccountDuplicate` | [Account & Plan](by-topic/account-plan.md) | [L213979](../../../ScriptDB/000_4_CreateSP.sql#L213979) | — | 3 / 0 | — |
| `UBClientBankAccountID` | [Account & Plan](by-topic/account-plan.md) | [L214021](../../../ScriptDB/000_4_CreateSP.sql#L214021) | — | 2 / 0 | — |
| `UBClientBankInfo` | [Client & KYC](by-topic/client-kyc.md) | [L214060](../../../ScriptDB/000_4_CreateSP.sql#L214060) | — | 1 / 0 | — |
| `UBClientBankListAll` | [Client & KYC](by-topic/client-kyc.md) | [L214090](../../../ScriptDB/000_4_CreateSP.sql#L214090) | — | 0 / 0 | — |
| `UBClientBankListDropdown` | [Client & KYC](by-topic/client-kyc.md) | [L214115](../../../ScriptDB/000_4_CreateSP.sql#L214115) | — | 4 / 0 | — |
| `UBClientBarChartX` | [Client & KYC](by-topic/client-kyc.md) | [L214177](../../../ScriptDB/000_4_CreateSP.sql#L214177) | — | 0 / 1 | — |
| `UBClientCashPosExport` | [Account & Plan](by-topic/account-plan.md) | [L214331](../../../ScriptDB/000_4_CreateSP.sql#L214331) | 1 / 1 file | 0 / 0 | [CCashAccount.cs:89](../../../UBExport/CCashAccount.cs#L89) |
| `UBClientCityProvince` | [Client & KYC](by-topic/client-kyc.md) | [L214397](../../../ScriptDB/000_4_CreateSP.sql#L214397) | 1 / 1 file | 0 / 1 | [Province.cs:433](../../../UBClasses/Province.cs#L433) |
| `UBClientCompanyInfoDuplicate` | [Client & KYC](by-topic/client-kyc.md) | [L214436](../../../ScriptDB/000_4_CreateSP.sql#L214436) | — | 0 / 0 | — |
| `UBClientCompExecAdd` | [Client & KYC](by-topic/client-kyc.md) | [L214481](../../../ScriptDB/000_4_CreateSP.sql#L214481) | — | 0 / 4 | — |
| `UBClientCompExecRemove` | [Client & KYC](by-topic/client-kyc.md) | [L214566](../../../ScriptDB/000_4_CreateSP.sql#L214566) | 1 / 1 file | 0 / 1 | [PanelClientCompExecAdd.aspx.cs:302](../../../WebApp/Main/PanelClientCompExecAdd.aspx.cs#L302) |
| `UBClientCompExecUpdate` | [Client & KYC](by-topic/client-kyc.md) | [L214607](../../../ScriptDB/000_4_CreateSP.sql#L214607) | — | 0 / 5 | — |
| `UBClientDealerCodeList` | [Client & KYC](by-topic/client-kyc.md) | [L214697](../../../ScriptDB/000_4_CreateSP.sql#L214697) | — | 0 / 0 | — |
| `UBClientDealerCodeListX` | [Client & KYC](by-topic/client-kyc.md) | [L214723](../../../ScriptDB/000_4_CreateSP.sql#L214723) | — | 0 / 0 | — |
| `UBClientDocListVA` | [Client & KYC](by-topic/client-kyc.md) | [L214819](../../../ScriptDB/000_4_CreateSP.sql#L214819) | — | 0 / 0 | — |
| `UBClientDocObjVA` | [Client & KYC](by-topic/client-kyc.md) | [L215090](../../../ScriptDB/000_4_CreateSP.sql#L215090) | — | 0 / 0 | — |
| `UBClientDuplicate` | [Client & KYC](by-topic/client-kyc.md) | [L215202](../../../ScriptDB/000_4_CreateSP.sql#L215202) | — | 5 / 6 | — |
| `UBClientDuplicateAllInfo` | [Client & KYC](by-topic/client-kyc.md) | [L215286](../../../ScriptDB/000_4_CreateSP.sql#L215286) | — | 0 / 8 | — |
| `UBClientDuplicateAllInfo4Test` | [Client & KYC](by-topic/client-kyc.md) | [L215395](../../../ScriptDB/000_4_CreateSP.sql#L215395) | — | 0 / 9 | — |
| `UBClientEditComboList` | [Client & KYC](by-topic/client-kyc.md) | [L215514](../../../ScriptDB/000_4_CreateSP.sql#L215514) | — | 0 / 31 | — |
| `UBClienteDocAccessCode` | [Client & KYC](by-topic/client-kyc.md) | [L215590](../../../ScriptDB/000_4_CreateSP.sql#L215590) | 1 / 1 file | 0 / 0 | [Customer.cs:5910](../../../UBClasses/Customer.cs#L5910) |
| `UBClienteDocAccessCodeUpdate` | [Client & KYC](by-topic/client-kyc.md) | [L215603](../../../ScriptDB/000_4_CreateSP.sql#L215603) | 1 / 1 file | 0 / 0 | [Customer.cs:5959](../../../UBClasses/Customer.cs#L5959) |
| `UBClientElectronicStmtUpdate` | [Client & KYC](by-topic/client-kyc.md) | [L215618](../../../ScriptDB/000_4_CreateSP.sql#L215618) | 1 / 1 file | 0 / 4 | [Customer.cs:3909](../../../UBClasses/Customer.cs#L3909) |
| `UBClientEnableESign2FA_AllWithCell` | [Client & KYC](by-topic/client-kyc.md) | [L215747](../../../ScriptDB/000_4_CreateSP.sql#L215747) | — | 0 / 0 | — |
| `UBClientExtraInfoDuplicate` | [Client & KYC](by-topic/client-kyc.md) | [L215771](../../../ScriptDB/000_4_CreateSP.sql#L215771) | — | 3 / 0 | — |
| `UBClientFavoriteAdd` | [Client & KYC](by-topic/client-kyc.md) | [L215822](../../../ScriptDB/000_4_CreateSP.sql#L215822) | 1 / 1 file | 1 / 0 | [Customer.cs:2857](../../../UBClasses/Customer.cs#L2857) |
| `UBClientFavoriteAddAll` | [Client & KYC](by-topic/client-kyc.md) | [L215881](../../../ScriptDB/000_4_CreateSP.sql#L215881) | 1 / 1 file | 0 / 1 | [Customer.cs:2857](../../../UBClasses/Customer.cs#L2857) |
| `UBClientFavoriteLoad` | [Client & KYC](by-topic/client-kyc.md) | [L215915](../../../ScriptDB/000_4_CreateSP.sql#L215915) | 1 / 1 file | 0 / 0 | [Customer.cs:522](../../../UBClasses/Customer.cs#L522) |
| `UBClientFavoriteRemove` | [Client & KYC](by-topic/client-kyc.md) | [L215946](../../../ScriptDB/000_4_CreateSP.sql#L215946) | 1 / 1 file | 0 / 0 | [Customer.cs:2910](../../../UBClasses/Customer.cs#L2910) |
| `UBClientFinInfoDuplicate` | [Client & KYC](by-topic/client-kyc.md) | [L215972](../../../ScriptDB/000_4_CreateSP.sql#L215972) | — | 3 / 0 | — |
| `UBClientFreezeOne` | [Client & KYC](by-topic/client-kyc.md) | [L216027](../../../ScriptDB/000_4_CreateSP.sql#L216027) | — | 4 / 2 | — |
| `UBClientFundPosExport` | [Fund & GIC](by-topic/fund-gic.md) | [L216066](../../../ScriptDB/000_4_CreateSP.sql#L216066) | 1 / 1 file | 0 / 1 | [FundAccount.cs:113](../../../UBExport/FundAccount.cs#L113) |
| `UBClientFundPosExportAll` | [Fund & GIC](by-topic/fund-gic.md) | [L216236](../../../ScriptDB/000_4_CreateSP.sql#L216236) | — | 0 / 0 | — |
| `UBClientFundTrxExport` | [Fund & GIC](by-topic/fund-gic.md) | [L216719](../../../ScriptDB/000_4_CreateSP.sql#L216719) | 1 / 1 file | 0 / 1 | [Trx.cs:109](../../../UBExport/Trx.cs#L109) |
| `UBClientIdentificationDuplicate` | [Client & KYC](by-topic/client-kyc.md) | [L216831](../../../ScriptDB/000_4_CreateSP.sql#L216831) | — | 2 / 0 | — |
| `UBClientIDExpiredList` | [Client & KYC](by-topic/client-kyc.md) | [L216874](../../../ScriptDB/000_4_CreateSP.sql#L216874) | — | 0 / 0 | — |
| `UBClientImportComboList` | [Client & KYC](by-topic/client-kyc.md) | [L217055](../../../ScriptDB/000_4_CreateSP.sql#L217055) | — | 0 / 3 | — |
| `UBClientImportDef` | [Client & KYC](by-topic/client-kyc.md) | [L217075](../../../ScriptDB/000_4_CreateSP.sql#L217075) | — | 0 / 0 | — |
| `UBClientImportFileClear` | [Client & KYC](by-topic/client-kyc.md) | [L217093](../../../ScriptDB/000_4_CreateSP.sql#L217093) | — | 1 / 0 | — |
| `UBClientImportFileReadOneRecord` | [Client & KYC](by-topic/client-kyc.md) | [L217106](../../../ScriptDB/000_4_CreateSP.sql#L217106) | — | 0 / 2 | — |
| `UBClientImportList` | [Client & KYC](by-topic/client-kyc.md) | [L217186](../../../ScriptDB/000_4_CreateSP.sql#L217186) | 1 / 1 file | 0 / 0 | [CClientImport.cs:38](../../../UBClasses/CClientImport.cs#L38) |
| `UBClientImportProcess1Record` | [Client & KYC](by-topic/client-kyc.md) | [L217287](../../../ScriptDB/000_4_CreateSP.sql#L217287) | — | 1 / 2 | — |
| `UBClientImportProcessTaggedItems` | [Client & KYC](by-topic/client-kyc.md) | [L217465](../../../ScriptDB/000_4_CreateSP.sql#L217465) | — | 0 / 1 | — |
| `UBClientImportSelectionUpdate` | [Client & KYC](by-topic/client-kyc.md) | [L217511](../../../ScriptDB/000_4_CreateSP.sql#L217511) | — | 0 / 0 | — |
| `UBClientInactivate` | [Client & KYC](by-topic/client-kyc.md) | [L217549](../../../ScriptDB/000_4_CreateSP.sql#L217549) | — | 1 / 3 | — |
| `UBClientInfo` | [Client & KYC](by-topic/client-kyc.md) | [L217806](../../../ScriptDB/000_4_CreateSP.sql#L217806) | 1 / 1 file | 0 / 21 | [Customer.cs:212](../../../UBClasses/Customer.cs#L212) |
| `UBClientInfoAddress` | [Client & KYC](by-topic/client-kyc.md) | [L218064](../../../ScriptDB/000_4_CreateSP.sql#L218064) | — | 33 / 0 | — |
| `UBClientInfoAddressExtra` | [Client & KYC](by-topic/client-kyc.md) | [L218105](../../../ScriptDB/000_4_CreateSP.sql#L218105) | — | 1 / 0 | — |
| `UBClientInfoAddressPending` | [Client & KYC](by-topic/client-kyc.md) | [L218147](../../../ScriptDB/000_4_CreateSP.sql#L218147) | — | 2 / 0 | — |
| `UBClientInfoAddressPhone` | [Client & KYC](by-topic/client-kyc.md) | [L218178](../../../ScriptDB/000_4_CreateSP.sql#L218178) | 1 / 1 file | 0 / 4 | [CAddress.cs:33](../../../UBClasses/CAddress.cs#L33) |
| `UBClientInfoBank` | [Client & KYC](by-topic/client-kyc.md) | [L218215](../../../ScriptDB/000_4_CreateSP.sql#L218215) | 2 / 2 file | 3 / 1 | [PanelClientAddress.aspx.cs:64](../../../WebApp/Main/PanelClientAddress.aspx.cs#L64) |
| `UBClientInfoBankList` | [Client & KYC](by-topic/client-kyc.md) | [L218341](../../../ScriptDB/000_4_CreateSP.sql#L218341) | 1 / 1 file | 0 / 1 | [BankAccount.cs:1554](../../../UBClasses/BankAccount.cs#L1554) |
| `UBClientInfoBankTMP` | [Client & KYC](by-topic/client-kyc.md) | [L218410](../../../ScriptDB/000_4_CreateSP.sql#L218410) | 2 / 2 file | 0 / 0 | [PanelClientAddress.aspx.cs:64](../../../WebApp/Main/PanelClientAddress.aspx.cs#L64) |
| `UBClientInfoByEmail` | [Client & KYC](by-topic/client-kyc.md) | [L218453](../../../ScriptDB/000_4_CreateSP.sql#L218453) | 1 / 1 file | 0 / 0 | [Customer.cs:4913](../../../UBClasses/Customer.cs#L4913) |
| `UBClientInfoComp` | [Client & KYC](by-topic/client-kyc.md) | [L218528](../../../ScriptDB/000_4_CreateSP.sql#L218528) | 1 / 1 file | 0 / 0 | [PanelClientCompExecAdd.aspx.cs:63](../../../WebApp/Main/PanelClientCompExecAdd.aspx.cs#L63) |
| `UBClientInfoCompanyExecAdd` | [Client & KYC](by-topic/client-kyc.md) | [L218574](../../../ScriptDB/000_4_CreateSP.sql#L218574) | — | 1 / 3 | — |
| `UBClientInfoCompliance` | [Compliance](by-topic/compliance.md) | [L218637](../../../ScriptDB/000_4_CreateSP.sql#L218637) | — | 3 / 1 | — |
| `UBClientInfoCompList` | [Client & KYC](by-topic/client-kyc.md) | [L218697](../../../ScriptDB/000_4_CreateSP.sql#L218697) | 1 / 1 file | 1 / 0 | [CompExec.cs:57](../../../UBClasses/CompExec.cs#L57) |
| `UBClientInfoEmp` | [Client & KYC](by-topic/client-kyc.md) | [L218748](../../../ScriptDB/000_4_CreateSP.sql#L218748) | — | 4 / 0 | — |
| `UBClientInfoExport` | [Client & KYC](by-topic/client-kyc.md) | [L218856](../../../ScriptDB/000_4_CreateSP.sql#L218856) | 1 / 1 file | 0 / 0 | [ClientList.cs:152](../../../UBExport/ClientList.cs#L152) |
| `UBClientInfoExport_Simple` | [Client & KYC](by-topic/client-kyc.md) | [L219170](../../../ScriptDB/000_4_CreateSP.sql#L219170) | — | 0 / 0 | — |
| `UBClientInfoExport_TBD` | [Client & KYC](by-topic/client-kyc.md) | [L219485](../../../ScriptDB/000_4_CreateSP.sql#L219485) | — | 0 / 0 | — |
| `UBClientInfoExportAll` | [Client & KYC](by-topic/client-kyc.md) | [L219800](../../../ScriptDB/000_4_CreateSP.sql#L219800) | — | 0 / 0 | — |
| `UBClientInfoExtra` | [Client & KYC](by-topic/client-kyc.md) | [L220166](../../../ScriptDB/000_4_CreateSP.sql#L220166) | — | 4 / 0 | — |
| `UBClientInfoFinancial` | [Client & KYC](by-topic/client-kyc.md) | [L220443](../../../ScriptDB/000_4_CreateSP.sql#L220443) | 1 / 1 file | 4 / 0 | [Customer.cs:3298](../../../UBClasses/Customer.cs#L3298) |
| `UBClientInfoID` | [Client & KYC](by-topic/client-kyc.md) | [L220638](../../../ScriptDB/000_4_CreateSP.sql#L220638) | 1 / 1 file | 0 / 0 | [PanelClientIdentAdd.aspx.cs:76](../../../WebApp/Main/PanelClientIdentAdd.aspx.cs#L76) |
| `UBClientInfoIDAdd` | [Client & KYC](by-topic/client-kyc.md) | [L220686](../../../ScriptDB/000_4_CreateSP.sql#L220686) | — | 1 / 3 | — |
| `UBClientInfoIDList` | [Client & KYC](by-topic/client-kyc.md) | [L220759](../../../ScriptDB/000_4_CreateSP.sql#L220759) | 2 / 1 file | 4 / 0 | [Identity.cs:64](../../../UBClasses/Identity.cs#L64) |
| `UBClientInfoIDTMP` | [Client & KYC](by-topic/client-kyc.md) | [L220829](../../../ScriptDB/000_4_CreateSP.sql#L220829) | 1 / 1 file | 0 / 0 | [PanelClientIdentAdd.aspx.cs:76](../../../WebApp/Main/PanelClientIdentAdd.aspx.cs#L76) |
| `UBClientInfoMailAddress` | [Client & KYC](by-topic/client-kyc.md) | [L220861](../../../ScriptDB/000_4_CreateSP.sql#L220861) | — | 29 / 0 | — |
| `UBClientInfoPhone` | [Client & KYC](by-topic/client-kyc.md) | [L220905](../../../ScriptDB/000_4_CreateSP.sql#L220905) | — | 11 / 0 | — |
| `UBClientInfoQuestionair` | [Client & KYC](by-topic/client-kyc.md) | [L220950](../../../ScriptDB/000_4_CreateSP.sql#L220950) | 1 / 1 file | 4 / 0 | [Questionair.cs:41](../../../UBClasses/Questionair.cs#L41) |
| `UBClientInfoQuestionairAdd` | [Client & KYC](by-topic/client-kyc.md) | [L221047](../../../ScriptDB/000_4_CreateSP.sql#L221047) | — | 2 / 1 | — |
| `UBClientInfoQuestionairAddTMP` | [Client & KYC](by-topic/client-kyc.md) | [L221127](../../../ScriptDB/000_4_CreateSP.sql#L221127) | — | 0 / 0 | — |
| `UBClientInfoQuestionairX` | [Client & KYC](by-topic/client-kyc.md) | [L221217](../../../ScriptDB/000_4_CreateSP.sql#L221217) | 1 / 1 file | 1 / 0 | [Questionair.cs:165](../../../UBClasses/Questionair.cs#L165) |
| `UBClientInfoQuestionairX4Form` | [Client & KYC](by-topic/client-kyc.md) | [L221246](../../../ScriptDB/000_4_CreateSP.sql#L221246) | — | 0 / 0 | — |
| `UBClientInfoSpouse` | [Client & KYC](by-topic/client-kyc.md) | [L221280](../../../ScriptDB/000_4_CreateSP.sql#L221280) | 2 / 2 file | 2 / 0 | [Customer.cs:307](../../../UBClasses/Customer.cs#L307) |
| `UBClientInfoSpouseByPlanID` | [Account & Plan](by-topic/account-plan.md) | [L221428](../../../ScriptDB/000_4_CreateSP.sql#L221428) | 1 / 1 file | 0 / 0 | [Customer.cs:351](../../../UBClasses/Customer.cs#L351) |
| `UBClientInfoUD` | [Client & KYC](by-topic/client-kyc.md) | [L221491](../../../ScriptDB/000_4_CreateSP.sql#L221491) | 1 / 1 file | 1 / 0 | [UserDefinedField.cs:39](../../../UBClasses/UserDefinedField.cs#L39) |
| `UBClientInfoUDAdd` | [Client & KYC](by-topic/client-kyc.md) | [L221545](../../../ScriptDB/000_4_CreateSP.sql#L221545) | — | 2 / 1 | — |
| `UBClientInfoUDAddTMP` | [Client & KYC](by-topic/client-kyc.md) | [L221630](../../../ScriptDB/000_4_CreateSP.sql#L221630) | — | 0 / 0 | — |
| `UBClientInfoWebClient` | [Client & KYC](by-topic/client-kyc.md) | [L221691](../../../ScriptDB/000_4_CreateSP.sql#L221691) | 1 / 1 file | 1 / 0 | [Customer.cs:4119](../../../UBClasses/Customer.cs#L4119) |
| `UBClientInvestKnowledgeUpdate` | [Client & KYC](by-topic/client-kyc.md) | [L221769](../../../ScriptDB/000_4_CreateSP.sql#L221769) | 1 / 1 file | 0 / 3 | [Loan.cs:1512](../../../UBClasses/Loan.cs#L1512) |
| `UBClientJointRepList` | [Client & KYC](by-topic/client-kyc.md) | [L221815](../../../ScriptDB/000_4_CreateSP.sql#L221815) | 1 / 1 file | 0 / 0 | [Customer.cs:6014](../../../UBClasses/Customer.cs#L6014) |
| `UBClientKYC` | [Client & KYC](by-topic/client-kyc.md) | [L221861](../../../ScriptDB/000_4_CreateSP.sql#L221861) | 1 / 1 file | 0 / 6 | [Customer.cs:259](../../../UBClasses/Customer.cs#L259) |
| `UBClientKYC_BankInfo` | [Client & KYC](by-topic/client-kyc.md) | [L222148](../../../ScriptDB/000_4_CreateSP.sql#L222148) | — | 1 / 0 | — |
| `UBClientKYC_CompInfo` | [Client & KYC](by-topic/client-kyc.md) | [L222235](../../../ScriptDB/000_4_CreateSP.sql#L222235) | — | 1 / 0 | — |
| `UBClientKYC_Def` | [Client & KYC](by-topic/client-kyc.md) | [L222310](../../../ScriptDB/000_4_CreateSP.sql#L222310) | — | 2 / 0 | — |
| `UBClientKYC_EmpInfo` | [Client & KYC](by-topic/client-kyc.md) | [L222354](../../../ScriptDB/000_4_CreateSP.sql#L222354) | — | 1 / 0 | — |
| `UBClientKYC_FinInfo` | [Client & KYC](by-topic/client-kyc.md) | [L222438](../../../ScriptDB/000_4_CreateSP.sql#L222438) | — | 1 / 0 | — |
| `UBClientKYC_IDInfo` | [Client & KYC](by-topic/client-kyc.md) | [L222554](../../../ScriptDB/000_4_CreateSP.sql#L222554) | — | 1 / 0 | — |
| `UBClientKYC_SpouseInfo` | [Client & KYC](by-topic/client-kyc.md) | [L222625](../../../ScriptDB/000_4_CreateSP.sql#L222625) | — | 1 / 0 | — |
| `UBClientKYCExtraInit` | [Client & KYC](by-topic/client-kyc.md) | [L222704](../../../ScriptDB/000_4_CreateSP.sql#L222704) | — | 1 / 0 | — |
| `UBClientKYCExtraList` | [Client & KYC](by-topic/client-kyc.md) | [L222808](../../../ScriptDB/000_4_CreateSP.sql#L222808) | 1 / 1 file | 0 / 6 | [Customer.cs:5274](../../../UBClasses/Customer.cs#L5274) |
| `UBClientKYCExtraSaveEnd` | [Client & KYC](by-topic/client-kyc.md) | [L222840](../../../ScriptDB/000_4_CreateSP.sql#L222840) | 1 / 1 file | 0 / 4 | [Customer.cs:5485](../../../UBClasses/Customer.cs#L5485) |
| `UBClientKYCExtraSum` | [Client & KYC](by-topic/client-kyc.md) | [L222937](../../../ScriptDB/000_4_CreateSP.sql#L222937) | — | 1 / 0 | — |
| `UBClientKYCSetCashAndCashEquivalent` | [Account & Plan](by-topic/account-plan.md) | [L222974](../../../ScriptDB/000_4_CreateSP.sql#L222974) | — | 3 / 0 | — |
| `UBClientLabelList` | [Client & KYC](by-topic/client-kyc.md) | [L223004](../../../ScriptDB/000_4_CreateSP.sql#L223004) | — | 0 / 0 | — |
| `UBClientLastKYCOnFileUpdate` | [Client & KYC](by-topic/client-kyc.md) | [L223241](../../../ScriptDB/000_4_CreateSP.sql#L223241) | — | 0 / 0 | — |
| `UBClientLiabilityList` | [Client & KYC](by-topic/client-kyc.md) | [L223277](../../../ScriptDB/000_4_CreateSP.sql#L223277) | — | 2 / 0 | — |
| `UBClientLiabilitySave` | [Client & KYC](by-topic/client-kyc.md) | [L223335](../../../ScriptDB/000_4_CreateSP.sql#L223335) | 1 / 1 file | 0 / 0 | [Customer.cs:5375](../../../UBClasses/Customer.cs#L5375) |
| `UBClientListAgeRange` | [Client & KYC](by-topic/client-kyc.md) | [L223382](../../../ScriptDB/000_4_CreateSP.sql#L223382) | — | 0 / 0 | — |
| `UBClientListComboList` | [Client & KYC](by-topic/client-kyc.md) | [L223429](../../../ScriptDB/000_4_CreateSP.sql#L223429) | — | 0 / 64 | — |
| `UBClientListComboList2` | [Client & KYC](by-topic/client-kyc.md) | [L223582](../../../ScriptDB/000_4_CreateSP.sql#L223582) | — | 0 / 9 | — |
| `UBClientListSetSelection` | [Client & KYC](by-topic/client-kyc.md) | [L223627](../../../ScriptDB/000_4_CreateSP.sql#L223627) | 1 / 1 file | 0 / 2 | [Customer.cs:4423](../../../UBClasses/Customer.cs#L4423) |
| `UBClientListSetSelectionByType` | [Client & KYC](by-topic/client-kyc.md) | [L223707](../../../ScriptDB/000_4_CreateSP.sql#L223707) | 1 / 1 file | 0 / 2 | [Customer.cs:4537](../../../UBClasses/Customer.cs#L4537) |
| `UBClientListSetSelectionGIC` | [Fund & GIC](by-topic/fund-gic.md) | [L223802](../../../ScriptDB/000_4_CreateSP.sql#L223802) | 1 / 1 file | 0 / 2 | [Customer.cs:4480](../../../UBClasses/Customer.cs#L4480) |
| `UBClientLogin` | [Client & KYC](by-topic/client-kyc.md) | [L223875](../../../ScriptDB/000_4_CreateSP.sql#L223875) | 1 / 1 file | 0 / 1 | [Customer.cs:3762](../../../UBClasses/Customer.cs#L3762) |
| `UBClientLoginAddEx` | [Client & KYC](by-topic/client-kyc.md) | [L224208](../../../ScriptDB/000_4_CreateSP.sql#L224208) | — | 0 / 0 | — |
| `UBClientLoginByClientID` | [Client & KYC](by-topic/client-kyc.md) | [L224263](../../../ScriptDB/000_4_CreateSP.sql#L224263) | — | 0 / 0 | — |
| `UBClientLoginIDByClientID` | [Client & KYC](by-topic/client-kyc.md) | [L224289](../../../ScriptDB/000_4_CreateSP.sql#L224289) | — | 0 / 0 | — |
| `UBClientLoginOther` | [Client & KYC](by-topic/client-kyc.md) | [L224315](../../../ScriptDB/000_4_CreateSP.sql#L224315) | 1 / 1 file | 0 / 0 | [Customer.cs:3592](../../../UBClasses/Customer.cs#L3592) |
| `UBClientLoginRemoveEx` | [Client & KYC](by-topic/client-kyc.md) | [L224347](../../../ScriptDB/000_4_CreateSP.sql#L224347) | — | 0 / 0 | — |
| `UBClientLoginX` | [Client & KYC](by-topic/client-kyc.md) | [L224380](../../../ScriptDB/000_4_CreateSP.sql#L224380) | — | 0 / 0 | — |
| `UBClientLoginXRenew` | [Client & KYC](by-topic/client-kyc.md) | [L224514](../../../ScriptDB/000_4_CreateSP.sql#L224514) | — | 0 / 0 | — |
| `UBClientLogout` | [Client & KYC](by-topic/client-kyc.md) | [L224600](../../../ScriptDB/000_4_CreateSP.sql#L224600) | 1 / 1 file | 1 / 0 | [Customer.cs:3647](../../../UBClasses/Customer.cs#L3647) |
| `UBClientLogoutX` | [Client & KYC](by-topic/client-kyc.md) | [L224637](../../../ScriptDB/000_4_CreateSP.sql#L224637) | — | 0 / 0 | — |
| `UBClientLookup` | [Client & KYC](by-topic/client-kyc.md) | [L224667](../../../ScriptDB/000_4_CreateSP.sql#L224667) | 1 / 1 file | 0 / 1 | [Customer.cs:4639](../../../UBClasses/Customer.cs#L4639) |
| `UBClientMarkProcessedOne` | [Client & KYC](by-topic/client-kyc.md) | [L224917](../../../ScriptDB/000_4_CreateSP.sql#L224917) | — | 0 / 0 | — |
| `UBClientMemberRepCodeAlign` | [Client & KYC](by-topic/client-kyc.md) | [L224950](../../../ScriptDB/000_4_CreateSP.sql#L224950) | — | 1 / 0 | — |
| `UBClientMemberRepCodeAlignAll` | [Client & KYC](by-topic/client-kyc.md) | [L224981](../../../ScriptDB/000_4_CreateSP.sql#L224981) | — | 0 / 1 | — |
| `UBClientMFDAAdd` | [Compliance](by-topic/compliance.md) | [L225009](../../../ScriptDB/000_4_CreateSP.sql#L225009) | — | 0 / 0 | — |
| `UBClientMFDAUpdate` | [Compliance](by-topic/compliance.md) | [L225030](../../../ScriptDB/000_4_CreateSP.sql#L225030) | — | 2 / 0 | — |
| `UBClientMobileEnableAll` | [Client & KYC](by-topic/client-kyc.md) | [L225057](../../../ScriptDB/000_4_CreateSP.sql#L225057) | — | 0 / 0 | — |
| `UBClientNamesByPlanID` | [Account & Plan](by-topic/account-plan.md) | [L225104](../../../ScriptDB/000_4_CreateSP.sql#L225104) | 1 / 1 file | 0 / 0 | [Plan.cs:5016](../../../UBClasses/Plan.cs#L5016) |
| `UBClientNewBankInfoAdd` | [Client & KYC](by-topic/client-kyc.md) | [L225147](../../../ScriptDB/000_4_CreateSP.sql#L225147) | — | 0 / 2 | — |
| `UBClientNewBankInfoRemove` | [Client & KYC](by-topic/client-kyc.md) | [L225260](../../../ScriptDB/000_4_CreateSP.sql#L225260) | 2 / 2 file | 0 / 1 | [PanelClientAddress.aspx.cs:395](../../../WebApp/Main/PanelClientAddress.aspx.cs#L395) |
| `UBClientNewBankInfoUpdate` | [Client & KYC](by-topic/client-kyc.md) | [L225311](../../../ScriptDB/000_4_CreateSP.sql#L225311) | — | 0 / 2 | — |
| `UBClientNewIDAdd` | [Client & KYC](by-topic/client-kyc.md) | [L225408](../../../ScriptDB/000_4_CreateSP.sql#L225408) | — | 0 / 4 | — |
| `UBClientNewIdentRemove` | [Client & KYC](by-topic/client-kyc.md) | [L225515](../../../ScriptDB/000_4_CreateSP.sql#L225515) | 1 / 1 file | 0 / 1 | [PanelClientIdentAdd.aspx.cs:333](../../../WebApp/Main/PanelClientIdentAdd.aspx.cs#L333) |
| `UBClientNewIDUpdate` | [Client & KYC](by-topic/client-kyc.md) | [L225559](../../../ScriptDB/000_4_CreateSP.sql#L225559) | — | 0 / 5 | — |
| `UBClientNoFamily` | [Client & KYC](by-topic/client-kyc.md) | [L225677](../../../ScriptDB/000_4_CreateSP.sql#L225677) | — | 0 / 0 | — |
| `UBClientOBAList` | [Client & KYC](by-topic/client-kyc.md) | [L225699](../../../ScriptDB/000_4_CreateSP.sql#L225699) | — | 1 / 0 | — |
| `UBClientOBASave` | [Client & KYC](by-topic/client-kyc.md) | [L225737](../../../ScriptDB/000_4_CreateSP.sql#L225737) | 1 / 1 file | 0 / 0 | [Customer.cs:5432](../../../UBClasses/Customer.cs#L5432) |
| `UBClientPlan` | [Account & Plan](by-topic/account-plan.md) | [L225777](../../../ScriptDB/000_4_CreateSP.sql#L225777) | 1 / 1 file | 0 / 1 | [Customer.cs:627](../../../UBClasses/Customer.cs#L627) |
| `UBClientPlan4Doc` | [Account & Plan](by-topic/account-plan.md) | [L226017](../../../ScriptDB/000_4_CreateSP.sql#L226017) | 1 / 1 file | 0 / 1 | [Customer.cs:940](../../../UBClasses/Customer.cs#L940) |
| `UBClientPlanCB` | [Account & Plan](by-topic/account-plan.md) | [L226142](../../../ScriptDB/000_4_CreateSP.sql#L226142) | 2 / 1 file | 0 / 1 | [Customer.cs:868](../../../UBClasses/Customer.cs#L868) |
| `UBClientPlanExport` | [Account & Plan](by-topic/account-plan.md) | [L226336](../../../ScriptDB/000_4_CreateSP.sql#L226336) | 1 / 1 file | 0 / 2 | [ClientList.cs:237](../../../UBExport/ClientList.cs#L237) |
| `UBClientPlanExport4Global` | [Account & Plan](by-topic/account-plan.md) | [L226600](../../../ScriptDB/000_4_CreateSP.sql#L226600) | — | 0 / 1 | — |
| `UBClientPlanExportAll` | [Account & Plan](by-topic/account-plan.md) | [L226820](../../../ScriptDB/000_4_CreateSP.sql#L226820) | — | 0 / 1 | — |
| `UBClientPlanExportAll_Init` | [Account & Plan](by-topic/account-plan.md) | [L227442](../../../ScriptDB/000_4_CreateSP.sql#L227442) | — | 0 / 1 | — |
| `UBClientPlanList` | [Account & Plan](by-topic/account-plan.md) | [L227841](../../../ScriptDB/000_4_CreateSP.sql#L227841) | 1 / 1 file | 0 / 2 | [Customer.cs:736](../../../UBClasses/Customer.cs#L736) |
| `UBClientPlanListX` | [Account & Plan](by-topic/account-plan.md) | [L228034](../../../ScriptDB/000_4_CreateSP.sql#L228034) | — | 0 / 0 | — |
| `UBClientPlanNomineeList` | [Account & Plan](by-topic/account-plan.md) | [L228181](../../../ScriptDB/000_4_CreateSP.sql#L228181) | 1 / 1 file | 0 / 0 | [Plan.cs:4791](../../../UBClasses/Plan.cs#L4791) |
| `UBClientPlanPortfolioList` | [Account & Plan](by-topic/account-plan.md) | [L228255](../../../ScriptDB/000_4_CreateSP.sql#L228255) | 1 / 1 file | 0 / 0 | [Plan.cs:4722](../../../UBClasses/Plan.cs#L4722) |
| `UBClientPlanQuestion4Form` | [Account & Plan](by-topic/account-plan.md) | [L228279](../../../ScriptDB/000_4_CreateSP.sql#L228279) | — | 1 / 0 | — |
| `UBClientPWbyUserID` | [Client & KYC](by-topic/client-kyc.md) | [L228309](../../../ScriptDB/000_4_CreateSP.sql#L228309) | — | 0 / 0 | — |
| `UBClientPWChanged` | [Client & KYC](by-topic/client-kyc.md) | [L228325](../../../ScriptDB/000_4_CreateSP.sql#L228325) | 1 / 1 file | 0 / 0 | [Customer.cs:2758](../../../UBClasses/Customer.cs#L2758) |
| `UBClientQuestion4Form` | [Client & KYC](by-topic/client-kyc.md) | [L228349](../../../ScriptDB/000_4_CreateSP.sql#L228349) | — | 1 / 0 | — |
| `UBClientQuestionnairDuplicate` | [Client & KYC](by-topic/client-kyc.md) | [L228382](../../../ScriptDB/000_4_CreateSP.sql#L228382) | — | 3 / 0 | — |
| `UBClientQuestionUpdate` | [Client & KYC](by-topic/client-kyc.md) | [L228417](../../../ScriptDB/000_4_CreateSP.sql#L228417) | — | 1 / 0 | — |
| `UBClientQuickAccessUpdateX` | [Client & KYC](by-topic/client-kyc.md) | [L228452](../../../ScriptDB/000_4_CreateSP.sql#L228452) | — | 0 / 0 | — |
| `UBClientRatingList` | [Client & KYC](by-topic/client-kyc.md) | [L228487](../../../ScriptDB/000_4_CreateSP.sql#L228487) | — | 2 / 0 | — |
| `UBClientRemoveAll` | [Client & KYC](by-topic/client-kyc.md) | [L228517](../../../ScriptDB/000_4_CreateSP.sql#L228517) | — | 0 / 0 | — |
| `UBClientRemovePermanent` | [Client & KYC](by-topic/client-kyc.md) | [L228577](../../../ScriptDB/000_4_CreateSP.sql#L228577) | — | 1 / 1 | — |
| `UBClientRemoveUI` | [Client & KYC](by-topic/client-kyc.md) | [L228621](../../../ScriptDB/000_4_CreateSP.sql#L228621) | 1 / 1 file | 0 / 2 | [Customer.cs:2808](../../../UBClasses/Customer.cs#L2808) |
| `UBClientRepRelationLengthList` | [Client & KYC](by-topic/client-kyc.md) | [L228670](../../../ScriptDB/000_4_CreateSP.sql#L228670) | — | 1 / 0 | — |
| `UBClientRepRelationSourceList` | [Client & KYC](by-topic/client-kyc.md) | [L228691](../../../ScriptDB/000_4_CreateSP.sql#L228691) | — | 1 / 0 | — |
| `UBClientRiskProfile4Form` | [Client & KYC](by-topic/client-kyc.md) | [L228712](../../../ScriptDB/000_4_CreateSP.sql#L228712) | — | 1 / 0 | — |
| `UBClientRiskProfileUpdate` | [Client & KYC](by-topic/client-kyc.md) | [L228737](../../../ScriptDB/000_4_CreateSP.sql#L228737) | — | 2 / 1 | — |
| `UBClientRRSPLIRAList` | [Account & Plan](by-topic/account-plan.md) | [L229005](../../../ScriptDB/000_4_CreateSP.sql#L229005) | 1 / 1 file | 0 / 0 | [Customer.cs:6117](../../../UBClasses/Customer.cs#L6117) |
| `UBClientSearch` | [Client & KYC](by-topic/client-kyc.md) | [L229081](../../../ScriptDB/000_4_CreateSP.sql#L229081) | 1 / 1 file | 0 / 3 | [Customer.cs:63](../../../UBClasses/Customer.cs#L63) |
| `UBClientSearchCriteriaSave` | [Client & KYC](by-topic/client-kyc.md) | [L229757](../../../ScriptDB/000_4_CreateSP.sql#L229757) | — | 5 / 1 | — |
| `UBClientSearchEx` | [Client & KYC](by-topic/client-kyc.md) | [L230284](../../../ScriptDB/000_4_CreateSP.sql#L230284) | — | 1 / 1 | — |
| `UBClientSearchExport` | [Client & KYC](by-topic/client-kyc.md) | [L231625](../../../ScriptDB/000_4_CreateSP.sql#L231625) | 1 / 1 file | 0 / 1 | [ClientList.cs:71](../../../UBExport/ClientList.cs#L71) |
| `UBClientSearchLoad` | [Client & KYC](by-topic/client-kyc.md) | [L231749](../../../ScriptDB/000_4_CreateSP.sql#L231749) | 1 / 1 file | 0 / 1 | [Customer.cs:397](../../../UBClasses/Customer.cs#L397) |
| `UBClientSearchLoadSel` | [Client & KYC](by-topic/client-kyc.md) | [L231825](../../../ScriptDB/000_4_CreateSP.sql#L231825) | — | 0 / 1 | — |
| `UBClientSearchSel` | [Client & KYC](by-topic/client-kyc.md) | [L231888](../../../ScriptDB/000_4_CreateSP.sql#L231888) | 1 / 1 file | 0 / 1 | [Customer.cs:2140](../../../UBClasses/Customer.cs#L2140) |
| `UBClientSetDocDelivery2Email` | [Client & KYC](by-topic/client-kyc.md) | [L232067](../../../ScriptDB/000_4_CreateSP.sql#L232067) | — | 0 / 2 | — |
| `UBClientSetLanguage` | [Client & KYC](by-topic/client-kyc.md) | [L232116](../../../ScriptDB/000_4_CreateSP.sql#L232116) | — | 1 / 3 | — |
| `UBClientSetLanguageAll` | [Client & KYC](by-topic/client-kyc.md) | [L232144](../../../ScriptDB/000_4_CreateSP.sql#L232144) | — | 0 / 1 | — |
| `UBClientSpouseAddByPlan` | [Account & Plan](by-topic/account-plan.md) | [L232178](../../../ScriptDB/000_4_CreateSP.sql#L232178) | — | 1 / 0 | — |
| `UBClientSpouseAddFromFGFile` | [Client & KYC](by-topic/client-kyc.md) | [L232216](../../../ScriptDB/000_4_CreateSP.sql#L232216) | — | 0 / 1 | — |
| `UBClientSpouseDuplicate` | [Client & KYC](by-topic/client-kyc.md) | [L232256](../../../ScriptDB/000_4_CreateSP.sql#L232256) | — | 2 / 0 | — |
| `UBClientStatusList` | [Client & KYC](by-topic/client-kyc.md) | [L232305](../../../ScriptDB/000_4_CreateSP.sql#L232305) | — | 4 / 0 | — |
| `UBClientStmtDeliveryList` | [Client & KYC](by-topic/client-kyc.md) | [L232331](../../../ScriptDB/000_4_CreateSP.sql#L232331) | 1 / 1 file | 0 / 1 | [Customer.cs:5533](../../../UBClasses/Customer.cs#L5533) |
| `UBClientStmtDeliveryMethodChange` | [Client & KYC](by-topic/client-kyc.md) | [L232353](../../../ScriptDB/000_4_CreateSP.sql#L232353) | — | 0 / 1 | — |
| `UBClientSummary` | [Client & KYC](by-topic/client-kyc.md) | [L232395](../../../ScriptDB/000_4_CreateSP.sql#L232395) | 2 / 2 file | 0 / 16 | [Customer.cs:3444](../../../UBClasses/Customer.cs#L3444) |
| `UBClientTaxCodeInitAll` | [Client & KYC](by-topic/client-kyc.md) | [L234386](../../../ScriptDB/000_4_CreateSP.sql#L234386) | — | 1 / 1 | — |
| `UBClientTaxCodeInitOne` | [Client & KYC](by-topic/client-kyc.md) | [L234458](../../../ScriptDB/000_4_CreateSP.sql#L234458) | — | 1 / 1 | — |
| `UBClientTaxCodeUpdate` | [Client & KYC](by-topic/client-kyc.md) | [L234498](../../../ScriptDB/000_4_CreateSP.sql#L234498) | — | 2 / 0 | — |
| `UBClientTCPList` | [Client & KYC](by-topic/client-kyc.md) | [L234527](../../../ScriptDB/000_4_CreateSP.sql#L234527) | — | 1 / 0 | — |
| `UBClientTrxExport` | [Client & KYC](by-topic/client-kyc.md) | [L234583](../../../ScriptDB/000_4_CreateSP.sql#L234583) | — | 0 / 0 | — |
| `UBClientTrxExportAll` | [Client & KYC](by-topic/client-kyc.md) | [L234674](../../../ScriptDB/000_4_CreateSP.sql#L234674) | — | 0 / 0 | — |
| `UBClientUpdateUI` | [Client & KYC](by-topic/client-kyc.md) | [L234882](../../../ScriptDB/000_4_CreateSP.sql#L234882) | 1 / 1 file | 0 / 23 | [Customer.cs:2326](../../../UBClasses/Customer.cs#L2326) |
| `UBClientWithMoreRepCodeList` | [Client & KYC](by-topic/client-kyc.md) | [L235823](../../../ScriptDB/000_4_CreateSP.sql#L235823) | — | 0 / 0 | — |
| `UBClientWithMultipleMember` | [Client & KYC](by-topic/client-kyc.md) | [L235865](../../../ScriptDB/000_4_CreateSP.sql#L235865) | — | 0 / 0 | — |
| `UBComm_BringBackZeroByGroup` | [Commission & Fee](by-topic/commission-fee.md) | [L235940](../../../ScriptDB/000_4_CreateSP.sql#L235940) | — | 0 / 1 | — |
| `UBComm_BringBackZeroReg` | [Commission & Fee](by-topic/commission-fee.md) | [L235984](../../../ScriptDB/000_4_CreateSP.sql#L235984) | — | 0 / 1 | — |
| `UBCommBatchCodeExpAdd` | [Commission & Fee](by-topic/commission-fee.md) | [L236028](../../../ScriptDB/000_4_CreateSP.sql#L236028) | 1 / 1 file | 2 / 0 | [CommBatchCode.cs:118](../../../UBClasses/CommBatchCode.cs#L118) |
| `UBCommBatchCodeExpList` | [Commission & Fee](by-topic/commission-fee.md) | [L236050](../../../ScriptDB/000_4_CreateSP.sql#L236050) | 1 / 1 file | 0 / 0 | [CommBatchCode.cs:71](../../../UBClasses/CommBatchCode.cs#L71) |
| `UBCommBatchCodeExpRemove` | [Commission & Fee](by-topic/commission-fee.md) | [L236063](../../../ScriptDB/000_4_CreateSP.sql#L236063) | — | 1 / 0 | — |
| `UBCommBatchComboList` | [Commission & Fee](by-topic/commission-fee.md) | [L236083](../../../ScriptDB/000_4_CreateSP.sql#L236083) | 1 / 1 file | 2 / 0 | [CommissionDef.cs:762](../../../UBClasses/CommissionDef.cs#L762) |
| `UBCommBatchDefRemove` | [Commission & Fee](by-topic/commission-fee.md) | [L236120](../../../ScriptDB/000_4_CreateSP.sql#L236120) | 1 / 1 file | 0 / 0 | [CommissionDef.cs:858](../../../UBClasses/CommissionDef.cs#L858) |
| `UBCommBatchDefUpdate` | [Commission & Fee](by-topic/commission-fee.md) | [L236153](../../../ScriptDB/000_4_CreateSP.sql#L236153) | 1 / 1 file | 0 / 0 | [CommissionDef.cs:808](../../../UBClasses/CommissionDef.cs#L808) |
| `UBCommBatchItemAdd` | [Commission & Fee](by-topic/commission-fee.md) | [L236186](../../../ScriptDB/000_4_CreateSP.sql#L236186) | 1 / 1 file | 0 / 1 | [CommissionDef.cs:957](../../../UBClasses/CommissionDef.cs#L957) |
| `UBCommBatchItemInfo` | [Commission & Fee](by-topic/commission-fee.md) | [L236259](../../../ScriptDB/000_4_CreateSP.sql#L236259) | 1 / 1 file | 0 / 0 | [CommissionDef.cs:1102](../../../UBClasses/CommissionDef.cs#L1102) |
| `UBCommBatchItemList` | [Commission & Fee](by-topic/commission-fee.md) | [L236289](../../../ScriptDB/000_4_CreateSP.sql#L236289) | 1 / 1 file | 0 / 0 | [CommissionDef.cs:1048](../../../UBClasses/CommissionDef.cs#L1048) |
| `UBCommBatchItemRemove` | [Commission & Fee](by-topic/commission-fee.md) | [L236368](../../../ScriptDB/000_4_CreateSP.sql#L236368) | 1 / 1 file | 0 / 0 | [CommissionDef.cs:1148](../../../UBClasses/CommissionDef.cs#L1148) |
| `UBCommBatchItemUpdate` | [Commission & Fee](by-topic/commission-fee.md) | [L236383](../../../ScriptDB/000_4_CreateSP.sql#L236383) | 1 / 1 file | 0 / 1 | [CommissionDef.cs:957](../../../UBClasses/CommissionDef.cs#L957) |
| `UBCommBatchProcess` | [Commission & Fee](by-topic/commission-fee.md) | [L236435](../../../ScriptDB/000_4_CreateSP.sql#L236435) | 1 / 1 file | 0 / 1 | [CommissionDef.cs:1195](../../../UBClasses/CommissionDef.cs#L1195) |
| `UBCommBatchProcessOne` | [Commission & Fee](by-topic/commission-fee.md) | [L236497](../../../ScriptDB/000_4_CreateSP.sql#L236497) | — | 1 / 1 | — |
| `UBCommCategoryDetailAdd` | [Commission & Fee](by-topic/commission-fee.md) | [L236606](../../../ScriptDB/000_4_CreateSP.sql#L236606) | 1 / 1 file | 0 / 0 | [CommissionDef.cs:179](../../../UBClasses/CommissionDef.cs#L179) |
| `UBCommCategoryDetailList` | [Commission & Fee](by-topic/commission-fee.md) | [L236652](../../../ScriptDB/000_4_CreateSP.sql#L236652) | 2 / 1 file | 0 / 0 | [CommissionDef.cs:78](../../../UBClasses/CommissionDef.cs#L78) |
| `UBCommCategoryDetailModify` | [Commission & Fee](by-topic/commission-fee.md) | [L236699](../../../ScriptDB/000_4_CreateSP.sql#L236699) | 1 / 1 file | 0 / 0 | [CommissionDef.cs:179](../../../UBClasses/CommissionDef.cs#L179) |
| `UBCommCategoryDetailRemove` | [Commission & Fee](by-topic/commission-fee.md) | [L236746](../../../ScriptDB/000_4_CreateSP.sql#L236746) | 1 / 1 file | 0 / 0 | [CommissionDef.cs:238](../../../UBClasses/CommissionDef.cs#L238) |
| `UBCommCategoryList` | [Commission & Fee](by-topic/commission-fee.md) | [L236782](../../../ScriptDB/000_4_CreateSP.sql#L236782) | — | 1 / 0 | — |
| `UBCommEditComboList` | [Commission & Fee](by-topic/commission-fee.md) | [L236817](../../../ScriptDB/000_4_CreateSP.sql#L236817) | — | 0 / 8 | — |
| `UBCommExpenseComboList` | [Commission & Fee](by-topic/commission-fee.md) | [L236852](../../../ScriptDB/000_4_CreateSP.sql#L236852) | — | 0 / 4 | — |
| `UBCommExpenseTypeList` | [Commission & Fee](by-topic/commission-fee.md) | [L236869](../../../ScriptDB/000_4_CreateSP.sql#L236869) | — | 3 / 0 | — |
| `UBCommExSchAdd` | [Commission & Fee](by-topic/commission-fee.md) | [L236897](../../../ScriptDB/000_4_CreateSP.sql#L236897) | — | 0 / 1 | — |
| `UBCommExSchAddAllMember` | [Commission & Fee](by-topic/commission-fee.md) | [L236970](../../../ScriptDB/000_4_CreateSP.sql#L236970) | 1 / 1 file | 0 / 1 | [CCommExSchedule.cs:318](../../../UBClasses/CCommExSchedule.cs#L318) |
| `UBCommExSchAddOneMember` | [Commission & Fee](by-topic/commission-fee.md) | [L237048](../../../ScriptDB/000_4_CreateSP.sql#L237048) | 1 / 1 file | 0 / 1 | [CCommExSchedule.cs:261](../../../UBClasses/CCommExSchedule.cs#L261) |
| `UBCommExSchAmount` | [Commission & Fee](by-topic/commission-fee.md) | [L237111](../../../ScriptDB/000_4_CreateSP.sql#L237111) | 1 / 1 file | 0 / 0 | [CCommExSchedule.cs:714](../../../UBClasses/CCommExSchedule.cs#L714) |
| `UBCommExSchInfo` | [Commission & Fee](by-topic/commission-fee.md) | [L237125](../../../ScriptDB/000_4_CreateSP.sql#L237125) | 1 / 1 file | 0 / 0 | [CCommExSchedule.cs:208](../../../UBClasses/CCommExSchedule.cs#L208) |
| `UBCommExSchList` | [Commission & Fee](by-topic/commission-fee.md) | [L237158](../../../ScriptDB/000_4_CreateSP.sql#L237158) | 1 / 1 file | 0 / 0 | [CCommExSchedule.cs:153](../../../UBClasses/CCommExSchedule.cs#L153) |
| `UBCommExSchManualList` | [Commission & Fee](by-topic/commission-fee.md) | [L237250](../../../ScriptDB/000_4_CreateSP.sql#L237250) | 1 / 1 file | 0 / 1 | [CCommExSchedule.cs:606](../../../UBClasses/CCommExSchedule.cs#L606) |
| `UBCommExSchManualSelectionUpdate` | [Commission & Fee](by-topic/commission-fee.md) | [L237357](../../../ScriptDB/000_4_CreateSP.sql#L237357) | — | 0 / 0 | — |
| `UBCommExSchMemberList` | [Commission & Fee](by-topic/commission-fee.md) | [L237402](../../../ScriptDB/000_4_CreateSP.sql#L237402) | 1 / 1 file | 0 / 0 | [CCommExSchedule.cs:454](../../../UBClasses/CCommExSchedule.cs#L454) |
| `UBCommExSchProcess` | [Commission & Fee](by-topic/commission-fee.md) | [L237442](../../../ScriptDB/000_4_CreateSP.sql#L237442) | — | 0 / 1 | — |
| `UBCommExSchProcessFromDetail` | [Commission & Fee](by-topic/commission-fee.md) | [L237500](../../../ScriptDB/000_4_CreateSP.sql#L237500) | 1 / 1 file | 0 / 1 | [CCommExSchedule.cs:666](../../../UBClasses/CCommExSchedule.cs#L666) |
| `UBCommExSchRemove` | [Commission & Fee](by-topic/commission-fee.md) | [L237551](../../../ScriptDB/000_4_CreateSP.sql#L237551) | 1 / 1 file | 0 / 1 | [CCommExSchedule.cs:103](../../../UBClasses/CCommExSchedule.cs#L103) |
| `UBCommExSchRemoveAllMember` | [Commission & Fee](by-topic/commission-fee.md) | [L237579](../../../ScriptDB/000_4_CreateSP.sql#L237579) | 1 / 1 file | 0 / 0 | [CCommExSchedule.cs:414](../../../UBClasses/CCommExSchedule.cs#L414) |
| `UBCommExSchRemoveOneMember` | [Commission & Fee](by-topic/commission-fee.md) | [L237602](../../../ScriptDB/000_4_CreateSP.sql#L237602) | 1 / 1 file | 0 / 0 | [CCommExSchedule.cs:371](../../../UBClasses/CCommExSchedule.cs#L371) |
| `UBCommExSchRunDaily` | [Commission & Fee](by-topic/commission-fee.md) | [L237626](../../../ScriptDB/000_4_CreateSP.sql#L237626) | — | 0 / 1 | — |
| `UBCommExSchRunNow` | [Commission & Fee](by-topic/commission-fee.md) | [L237670](../../../ScriptDB/000_4_CreateSP.sql#L237670) | 1 / 1 file | 1 / 1 | [CCommExSchedule.cs:507](../../../UBClasses/CCommExSchedule.cs#L507) |
| `UBCommExSchRunNowOne` | [Commission & Fee](by-topic/commission-fee.md) | [L237700](../../../ScriptDB/000_4_CreateSP.sql#L237700) | — | 3 / 0 | — |
| `UBCommExSchUndo` | [Commission & Fee](by-topic/commission-fee.md) | [L237809](../../../ScriptDB/000_4_CreateSP.sql#L237809) | 1 / 1 file | 0 / 0 | [CCommExSchedule.cs:558](../../../UBClasses/CCommExSchedule.cs#L558) |
| `UBCommExSchUpdate` | [Commission & Fee](by-topic/commission-fee.md) | [L237885](../../../ScriptDB/000_4_CreateSP.sql#L237885) | — | 0 / 2 | — |
| `UBCommExSchUpdateAmount` | [Commission & Fee](by-topic/commission-fee.md) | [L237985](../../../ScriptDB/000_4_CreateSP.sql#L237985) | 1 / 1 file | 0 / 1 | [CCommExSchedule.cs:754](../../../UBClasses/CCommExSchedule.cs#L754) |
| `UBCommFindReceivableLSFileIssue` | [Commission & Fee](by-topic/commission-fee.md) | [L238027](../../../ScriptDB/000_4_CreateSP.sql#L238027) | — | 0 / 0 | — |
| `UBCommFixFiscalYear` | [Commission & Fee](by-topic/commission-fee.md) | [L238056](../../../ScriptDB/000_4_CreateSP.sql#L238056) | — | 0 / 1 | — |
| `UBCommGridTypeList` | [Commission & Fee](by-topic/commission-fee.md) | [L238090](../../../ScriptDB/000_4_CreateSP.sql#L238090) | 1 / 1 file | 3 / 0 | [CommissionRevenue.cs:3184](../../../UBClasses/CommissionRevenue.cs#L3184) |
| `UBCommIncomeCategoryList` | [Commission & Fee](by-topic/commission-fee.md) | [L238116](../../../ScriptDB/000_4_CreateSP.sql#L238116) | — | 2 / 0 | — |
| `UBCommIncomeTypeList` | [Commission & Fee](by-topic/commission-fee.md) | [L238145](../../../ScriptDB/000_4_CreateSP.sql#L238145) | — | 2 / 0 | — |
| `UBCommissionAdd` | [Commission & Fee](by-topic/commission-fee.md) | [L238175](../../../ScriptDB/000_4_CreateSP.sql#L238175) | 1 / 1 file | 3 / 2 | [CommissionRevenue.cs:661](../../../UBClasses/CommissionRevenue.cs#L661) |
| `UBCommissionAdd_Internal` | [Commission & Fee](by-topic/commission-fee.md) | [L238439](../../../ScriptDB/000_4_CreateSP.sql#L238439) | — | 4 / 2 | — |
| `UBCommissionAdd_SSItem` | [Commission & Fee](by-topic/commission-fee.md) | [L238683](../../../ScriptDB/000_4_CreateSP.sql#L238683) | 1 / 1 file | 0 / 0 | [CommissionRevenue.cs:3225](../../../UBClasses/CommissionRevenue.cs#L3225) |
| `UBCommissionAdd2PayableGroup` | [Commission & Fee](by-topic/commission-fee.md) | [L238795](../../../ScriptDB/000_4_CreateSP.sql#L238795) | — | 2 / 0 | — |
| `UBCommissionAdd2PayableGroup4Missing` | [Commission & Fee](by-topic/commission-fee.md) | [L239114](../../../ScriptDB/000_4_CreateSP.sql#L239114) | — | 2 / 0 | — |
| `UBCommissionAdd2PayableGroup4MissingMCheck` | [Commission & Fee](by-topic/commission-fee.md) | [L239360](../../../ScriptDB/000_4_CreateSP.sql#L239360) | — | 1 / 0 | — |
| `UBCommissionAdd2PayableGroupFix1` | [Commission & Fee](by-topic/commission-fee.md) | [L239588](../../../ScriptDB/000_4_CreateSP.sql#L239588) | — | 2 / 0 | — |
| `UBCommissionAdd2PayableGroupOne` | [Commission & Fee](by-topic/commission-fee.md) | [L239851](../../../ScriptDB/000_4_CreateSP.sql#L239851) | — | 0 / 1 | — |
| `UBCommissionAdd4TrustRebate` | [Commission & Fee](by-topic/commission-fee.md) | [L239869](../../../ScriptDB/000_4_CreateSP.sql#L239869) | — | 2 / 1 | — |
| `UBCommissionAddFromTrust` | [Commission & Fee](by-topic/commission-fee.md) | [L239971](../../../ScriptDB/000_4_CreateSP.sql#L239971) | — | 2 / 1 | — |
| `UBCommissionAddGIC` | [Commission & Fee](by-topic/commission-fee.md) | [L240095](../../../ScriptDB/000_4_CreateSP.sql#L240095) | — | 3 / 1 | — |
| `UBCommissionAdjustmentAdvisorFee` | [Commission & Fee](by-topic/commission-fee.md) | [L240239](../../../ScriptDB/000_4_CreateSP.sql#L240239) | — | 0 / 2 | — |
| `UBCommissionAssignDepositDate` | [Commission & Fee](by-topic/commission-fee.md) | [L240401](../../../ScriptDB/000_4_CreateSP.sql#L240401) | 1 / 1 file | 0 / 0 | [CommissionRevenue.cs:339](../../../UBClasses/CommissionRevenue.cs#L339) |
| `UBCommissionClientPlanLookup` | [Commission & Fee](by-topic/commission-fee.md) | [L240486](../../../ScriptDB/000_4_CreateSP.sql#L240486) | 1 / 1 file | 0 / 1 | [CommissionRevenue.cs:3435](../../../UBClasses/CommissionRevenue.cs#L3435) |
| `UBCommissionClientPlanLookupInternal` | [Commission & Fee](by-topic/commission-fee.md) | [L240554](../../../ScriptDB/000_4_CreateSP.sql#L240554) | — | 5 / 0 | — |
| `UBCommissionDelete_SSItem` | [Commission & Fee](by-topic/commission-fee.md) | [L240682](../../../ScriptDB/000_4_CreateSP.sql#L240682) | 1 / 1 file | 0 / 0 | [CommissionRevenue.cs:3329](../../../UBClasses/CommissionRevenue.cs#L3329) |
| `UBCommissionExpenseAdd` | [Commission & Fee](by-topic/commission-fee.md) | [L240764](../../../ScriptDB/000_4_CreateSP.sql#L240764) | — | 1 / 1 | — |
| `UBCommissionExpenseAdd4Rebate` | [Commission & Fee](by-topic/commission-fee.md) | [L240861](../../../ScriptDB/000_4_CreateSP.sql#L240861) | — | 2 / 0 | — |
| `UBCommissionExpenseAdd4Trade` | [Commission & Fee](by-topic/commission-fee.md) | [L240955](../../../ScriptDB/000_4_CreateSP.sql#L240955) | — | 5 / 0 | — |
| `UBCommissionExpenseList` | [Commission & Fee](by-topic/commission-fee.md) | [L241067](../../../ScriptDB/000_4_CreateSP.sql#L241067) | — | 0 / 0 | — |
| `UBCommissionExpenseRemove` | [Commission & Fee](by-topic/commission-fee.md) | [L241132](../../../ScriptDB/000_4_CreateSP.sql#L241132) | — | 0 / 0 | — |
| `UBCommissionExpenseRemove4Trade` | [Commission & Fee](by-topic/commission-fee.md) | [L241191](../../../ScriptDB/000_4_CreateSP.sql#L241191) | — | 1 / 0 | — |
| `UBCommissionExpenseReport` | [Commission & Fee](by-topic/commission-fee.md) | [L241219](../../../ScriptDB/000_4_CreateSP.sql#L241219) | 1 / 1 file | 0 / 3 | [CommissionRevenue.cs:2498](../../../UBClasses/CommissionRevenue.cs#L2498) |
| `UBCommissionExport` | [Commission & Fee](by-topic/commission-fee.md) | [L241446](../../../ScriptDB/000_4_CreateSP.sql#L241446) | — | 0 / 0 | — |
| `UBCommissionFileExportExcel` | [Commission & Fee](by-topic/commission-fee.md) | [L241726](../../../ScriptDB/000_4_CreateSP.sql#L241726) | 1 / 1 file | 0 / 0 | [CommissionRevenue.cs:2698](../../../UBClasses/CommissionRevenue.cs#L2698) |
| `UBCommissionFileRemoveByFileID` | [Commission & Fee](by-topic/commission-fee.md) | [L241906](../../../ScriptDB/000_4_CreateSP.sql#L241906) | 1 / 1 file | 1 / 0 | [CommissionRevenue.cs:2999](../../../UBClasses/CommissionRevenue.cs#L2999) |
| `UBCommissionFileRemoveByHeaderID` | [Commission & Fee](by-topic/commission-fee.md) | [L241967](../../../ScriptDB/000_4_CreateSP.sql#L241967) | 1 / 1 file | 0 / 0 | [CommissionRevenue.cs:3004](../../../UBClasses/CommissionRevenue.cs#L3004) |
| `UBCommissionFileSelectionUpdate` | [Commission & Fee](by-topic/commission-fee.md) | [L242015](../../../ScriptDB/000_4_CreateSP.sql#L242015) | — | 0 / 0 | — |
| `UBCommissionHeaderList` | [Commission & Fee](by-topic/commission-fee.md) | [L242067](../../../ScriptDB/000_4_CreateSP.sql#L242067) | 1 / 1 file | 0 / 1 | [CommissionRevenue.cs:2075](../../../UBClasses/CommissionRevenue.cs#L2075) |
| `UBCommissionList_SSItem` | [Commission & Fee](by-topic/commission-fee.md) | [L242409](../../../ScriptDB/000_4_CreateSP.sql#L242409) | 1 / 1 file | 2 / 0 | [CommissionRevenue.cs:3383](../../../UBClasses/CommissionRevenue.cs#L3383) |
| `UBCommissionList_SSItemGroup` | [Commission & Fee](by-topic/commission-fee.md) | [L242458](../../../ScriptDB/000_4_CreateSP.sql#L242458) | — | 1 / 0 | — |
| `UBCommissionManualAddStart` | [Commission & Fee](by-topic/commission-fee.md) | [L242490](../../../ScriptDB/000_4_CreateSP.sql#L242490) | 1 / 1 file | 0 / 0 | [CommissionRevenue.cs:3282](../../../UBClasses/CommissionRevenue.cs#L3282) |
| `UBCommissionManualRemove` | [Commission & Fee](by-topic/commission-fee.md) | [L242542](../../../ScriptDB/000_4_CreateSP.sql#L242542) | 1 / 1 file | 4 / 2 | [CommissionRevenue.cs:884](../../../UBClasses/CommissionRevenue.cs#L884) |
| `UBCommissionMove2Payable` | [Commission & Fee](by-topic/commission-fee.md) | [L242713](../../../ScriptDB/000_4_CreateSP.sql#L242713) | 1 / 1 file | 0 / 3 | [CommissionRevenue.cs:268](../../../UBClasses/CommissionRevenue.cs#L268) |
| `UBCommissionMove2Payable1Header` | [Commission & Fee](by-topic/commission-fee.md) | [L242860](../../../ScriptDB/000_4_CreateSP.sql#L242860) | — | 2 / 3 | — |
| `UBCommissionMove2Payable1Header4Manager` | [Commission & Fee](by-topic/commission-fee.md) | [L242976](../../../ScriptDB/000_4_CreateSP.sql#L242976) | — | 0 / 2 | — |
| `UBCommissionMove2Payable1Header4ManagerCheck` | [Commission & Fee](by-topic/commission-fee.md) | [L243028](../../../ScriptDB/000_4_CreateSP.sql#L243028) | — | 0 / 2 | — |
| `UBCommissionMove2Payable1Header4MissingItems` | [Commission & Fee](by-topic/commission-fee.md) | [L243081](../../../ScriptDB/000_4_CreateSP.sql#L243081) | — | 0 / 2 | — |
| `UBCommissionMove2Payable1HeaderFixLS` | [Commission & Fee](by-topic/commission-fee.md) | [L243133](../../../ScriptDB/000_4_CreateSP.sql#L243133) | — | 0 / 1 | — |
| `UBCommissionMove2Payable1HeaderNoGroup` | [Commission & Fee](by-topic/commission-fee.md) | [L243233](../../../ScriptDB/000_4_CreateSP.sql#L243233) | 1 / 1 file | 0 / 1 | [CommissionRevenue.cs:4028](../../../UBClasses/CommissionRevenue.cs#L4028) |
| `UBCommissionMove2PayableEnd` | [Commission & Fee](by-topic/commission-fee.md) | [L243250](../../../ScriptDB/000_4_CreateSP.sql#L243250) | 1 / 1 file | 0 / 1 | [CommissionRevenue.cs:3948](../../../UBClasses/CommissionRevenue.cs#L3948) |
| `UBCommissionMove2PayableOne` | [Commission & Fee](by-topic/commission-fee.md) | [L243317](../../../ScriptDB/000_4_CreateSP.sql#L243317) | — | 13 / 1 | — |
| `UBCommissionMove2PayableOne4ManagerCheck` | [Commission & Fee](by-topic/commission-fee.md) | [L243876](../../../ScriptDB/000_4_CreateSP.sql#L243876) | — | 1 / 0 | — |
| `UBCommissionMove2PayableOne4Missing` | [Commission & Fee](by-topic/commission-fee.md) | [L244296](../../../ScriptDB/000_4_CreateSP.sql#L244296) | — | 2 / 0 | — |
| `UBCommissionMove2PayableOneFix1` | [Commission & Fee](by-topic/commission-fee.md) | [L244727](../../../ScriptDB/000_4_CreateSP.sql#L244727) | — | 1 / 0 | — |
| `UBCommissionMove2PayableOneX` | [Commission & Fee](by-topic/commission-fee.md) | [L245180](../../../ScriptDB/000_4_CreateSP.sql#L245180) | 1 / 1 file | 0 / 1 | [CommissionRevenue.cs:3902](../../../UBClasses/CommissionRevenue.cs#L3902) |
| `UBCommissionMove2PayableX` | [Commission & Fee](by-topic/commission-fee.md) | [L245198](../../../ScriptDB/000_4_CreateSP.sql#L245198) | — | 0 / 0 | — |
| `UBCommissionMove2PayableX_Step1` | [Commission & Fee](by-topic/commission-fee.md) | [L245239](../../../ScriptDB/000_4_CreateSP.sql#L245239) | 1 / 1 file | 0 / 0 | [CommissionRevenue.cs:4081](../../../UBClasses/CommissionRevenue.cs#L4081) |
| `UBCommissionMove2PayableX_Step2` | [Commission & Fee](by-topic/commission-fee.md) | [L245281](../../../ScriptDB/000_4_CreateSP.sql#L245281) | 1 / 1 file | 0 / 0 | [CommissionRevenue.cs:4126](../../../UBClasses/CommissionRevenue.cs#L4126) |
| `UBCommissionMove2PayableX_Step3` | [Commission & Fee](by-topic/commission-fee.md) | [L245339](../../../ScriptDB/000_4_CreateSP.sql#L245339) | 1 / 1 file | 0 / 0 | [CommissionRevenue.cs:3846](../../../UBClasses/CommissionRevenue.cs#L3846) |
| `UBCommissionMove2PayableX_Step4` | [Commission & Fee](by-topic/commission-fee.md) | [L245616](../../../ScriptDB/000_4_CreateSP.sql#L245616) | 1 / 1 file | 0 / 1 | [CommissionRevenue.cs:3988](../../../UBClasses/CommissionRevenue.cs#L3988) |
| `UBCommissionPayableExport2262` | [Commission & Fee](by-topic/commission-fee.md) | [L245636](../../../ScriptDB/000_4_CreateSP.sql#L245636) | — | 1 / 1 | — |
| `UBCommissionPayableInfo` | [Commission & Fee](by-topic/commission-fee.md) | [L246214](../../../ScriptDB/000_4_CreateSP.sql#L246214) | 1 / 1 file | 0 / 2 | [CommissionRevenue.cs:1695](../../../UBClasses/CommissionRevenue.cs#L1695) |
| `UBCommissionPayableRemove` | [Commission & Fee](by-topic/commission-fee.md) | [L246365](../../../ScriptDB/000_4_CreateSP.sql#L246365) | 1 / 1 file | 1 / 1 | [CommissionRevenue.cs:1742](../../../UBClasses/CommissionRevenue.cs#L1742) |
| `UBCommissionPayableRemoveOneFile` | [Commission & Fee](by-topic/commission-fee.md) | [L246457](../../../ScriptDB/000_4_CreateSP.sql#L246457) | 1 / 1 file | 0 / 2 | [CommissionRevenue.cs:1785](../../../UBClasses/CommissionRevenue.cs#L1785) |
| `UBCommissionPayableRemoveOneHeader` | [Commission & Fee](by-topic/commission-fee.md) | [L246624](../../../ScriptDB/000_4_CreateSP.sql#L246624) | — | 1 / 0 | — |
| `UBCommissionPayableReversal` | [Commission & Fee](by-topic/commission-fee.md) | [L246697](../../../ScriptDB/000_4_CreateSP.sql#L246697) | — | 1 / 0 | — |
| `UBCommissionPayableReversalOtherType` | [Commission & Fee](by-topic/commission-fee.md) | [L246754](../../../ScriptDB/000_4_CreateSP.sql#L246754) | — | 0 / 1 | — |
| `UBCommissionPayableSearch` | [Commission & Fee](by-topic/commission-fee.md) | [L246792](../../../ScriptDB/000_4_CreateSP.sql#L246792) | 1 / 1 file | 0 / 5 | [CommissionRevenue.cs:949](../../../UBClasses/CommissionRevenue.cs#L949) |
| `UBCommissionPayableSearch_Old` | [Commission & Fee](by-topic/commission-fee.md) | [L249824](../../../ScriptDB/000_4_CreateSP.sql#L249824) | — | 0 / 5 | — |
| `UBCommissionPayableSearchCriteriaSave` | [Commission & Fee](by-topic/commission-fee.md) | [L250902](../../../ScriptDB/000_4_CreateSP.sql#L250902) | — | 2 / 1 | — |
| `UBCommissionPayableSelectionUpdate` | [Commission & Fee](by-topic/commission-fee.md) | [L251258](../../../ScriptDB/000_4_CreateSP.sql#L251258) | — | 0 / 0 | — |
| `UBCommissionPayableSummaryList` | [Commission & Fee](by-topic/commission-fee.md) | [L251305](../../../ScriptDB/000_4_CreateSP.sql#L251305) | — | 0 / 5 | — |
| `UBCommissionPayableSummaryListX` | [Commission & Fee](by-topic/commission-fee.md) | [L251993](../../../ScriptDB/000_4_CreateSP.sql#L251993) | — | 0 / 4 | — |
| `UBCommissionPayableSummaryListX_Old` | [Commission & Fee](by-topic/commission-fee.md) | [L252766](../../../ScriptDB/000_4_CreateSP.sql#L252766) | — | 0 / 5 | — |
| `UBCommissionPayableSummaryListXAdmin` | [Commission & Fee](by-topic/commission-fee.md) | [L253532](../../../ScriptDB/000_4_CreateSP.sql#L253532) | — | 0 / 4 | — |
| `UBCommissionPayableTotal` | [Commission & Fee](by-topic/commission-fee.md) | [L254273](../../../ScriptDB/000_4_CreateSP.sql#L254273) | 1 / 1 file | 2 / 0 | [CommissionRevenue.cs:171](../../../UBClasses/CommissionRevenue.cs#L171) |
| `UBCommissionPayrollDoubtFull` | [Commission & Fee](by-topic/commission-fee.md) | [L254623](../../../ScriptDB/000_4_CreateSP.sql#L254623) | — | 0 / 0 | — |
| `UBCommissionPayrollIDList` | [Commission & Fee](by-topic/commission-fee.md) | [L254660](../../../ScriptDB/000_4_CreateSP.sql#L254660) | 1 / 1 file | 0 / 1 | [CPayroll.cs:614](../../../VieFUNDPdf/CPayroll.cs#L614) |
| `UBCommissionPayrollSearchCriteriaSave` | [Commission & Fee](by-topic/commission-fee.md) | [L254871](../../../ScriptDB/000_4_CreateSP.sql#L254871) | — | 1 / 1 | — |
| `UBCommissionPayrollSearchHistory` | [Commission & Fee](by-topic/commission-fee.md) | [L255000](../../../ScriptDB/000_4_CreateSP.sql#L255000) | 1 / 1 file | 0 / 5 | [CommissionRevenue.cs:1497](../../../UBClasses/CommissionRevenue.cs#L1497) |
| `UBCommissionPayrollSearchTMP` | [Commission & Fee](by-topic/commission-fee.md) | [L255624](../../../ScriptDB/000_4_CreateSP.sql#L255624) | 1 / 1 file | 0 / 4 | [CommissionRevenue.cs:1190](../../../UBClasses/CommissionRevenue.cs#L1190) |
| `UBCommissionPayrollSelectionUpdate` | [Commission & Fee](by-topic/commission-fee.md) | [L255762](../../../ScriptDB/000_4_CreateSP.sql#L255762) | — | 0 / 0 | — |
| `UBCommissionPayrollSelectionUpdateTMP` | [Commission & Fee](by-topic/commission-fee.md) | [L255807](../../../ScriptDB/000_4_CreateSP.sql#L255807) | — | 0 / 0 | — |
| `UBCommissionPayrollTMPDetail` | [Commission & Fee](by-topic/commission-fee.md) | [L255852](../../../ScriptDB/000_4_CreateSP.sql#L255852) | 1 / 1 file | 0 / 0 | [CommissionRevenue.cs:1250](../../../UBClasses/CommissionRevenue.cs#L1250) |
| `UBCommissionPayrollTotal` | [Commission & Fee](by-topic/commission-fee.md) | [L255989](../../../ScriptDB/000_4_CreateSP.sql#L255989) | — | 1 / 0 | — |
| `UBCommissionPayrollTotalTMP` | [Commission & Fee](by-topic/commission-fee.md) | [L256050](../../../ScriptDB/000_4_CreateSP.sql#L256050) | — | 1 / 0 | — |
| `UBCommissionReceivableExport` | [Commission & Fee](by-topic/commission-fee.md) | [L256113](../../../ScriptDB/000_4_CreateSP.sql#L256113) | — | 1 / 0 | — |
| `UBCommissionRefreshAll` | [Commission & Fee](by-topic/commission-fee.md) | [L256252](../../../ScriptDB/000_4_CreateSP.sql#L256252) | — | 0 / 1 | — |
| `UBCommissionRefreshAllToday` | [Commission & Fee](by-topic/commission-fee.md) | [L256287](../../../ScriptDB/000_4_CreateSP.sql#L256287) | — | 0 / 1 | — |
| `UBCommissionRefreshClientName` | [Commission & Fee](by-topic/commission-fee.md) | [L256325](../../../ScriptDB/000_4_CreateSP.sql#L256325) | — | 0 / 1 | — |
| `UBCommissionRefreshOneHeader` | [Commission & Fee](by-topic/commission-fee.md) | [L256367](../../../ScriptDB/000_4_CreateSP.sql#L256367) | 1 / 1 file | 1 / 2 | [CommissionRevenue.cs:3493](../../../UBClasses/CommissionRevenue.cs#L3493) |
| `UBCommissionRefreshOneItem` | [Commission & Fee](by-topic/commission-fee.md) | [L256406](../../../ScriptDB/000_4_CreateSP.sql#L256406) | — | 4 / 0 | — |
| `UBCommissionRefreshRepCode` | [Commission & Fee](by-topic/commission-fee.md) | [L256607](../../../ScriptDB/000_4_CreateSP.sql#L256607) | 1 / 1 file | 2 / 0 | [CommissionRevenue.cs:2568](../../../UBClasses/CommissionRevenue.cs#L2568) |
| `UBCommissionRemoveFromPayable` | [Commission & Fee](by-topic/commission-fee.md) | [L256655](../../../ScriptDB/000_4_CreateSP.sql#L256655) | — | 1 / 1 | — |
| `UBCommissionRemoveFromPayableTagged` | [Commission & Fee](by-topic/commission-fee.md) | [L256788](../../../ScriptDB/000_4_CreateSP.sql#L256788) | 1 / 1 file | 0 / 1 | [CommissionRevenue.cs:773](../../../UBClasses/CommissionRevenue.cs#L773) |
| `UBCommissionRemoveFromRevenue` | [Commission & Fee](by-topic/commission-fee.md) | [L256825](../../../ScriptDB/000_4_CreateSP.sql#L256825) | — | 1 / 1 | — |
| `UBCommissionRemoveFromRevenueTagged` | [Commission & Fee](by-topic/commission-fee.md) | [L256976](../../../ScriptDB/000_4_CreateSP.sql#L256976) | 1 / 1 file | 0 / 1 | [CommissionRevenue.cs:828](../../../UBClasses/CommissionRevenue.cs#L828) |
| `UBCommissionRevenueHeaderVerify` | [Commission & Fee](by-topic/commission-fee.md) | [L257013](../../../ScriptDB/000_4_CreateSP.sql#L257013) | — | 8 / 0 | — |
| `UBCommissionRevenueHeaderVerifyAll` | [Commission & Fee](by-topic/commission-fee.md) | [L257069](../../../ScriptDB/000_4_CreateSP.sql#L257069) | — | 0 / 1 | — |
| `UBCommissionRevenueHeaderVerifyR` | [Commission & Fee](by-topic/commission-fee.md) | [L257109](../../../ScriptDB/000_4_CreateSP.sql#L257109) | — | 1 / 1 | — |
| `UBCommissionRevenueInfo` | [Commission & Fee](by-topic/commission-fee.md) | [L257138](../../../ScriptDB/000_4_CreateSP.sql#L257138) | 1 / 1 file | 0 / 1 | [CommissionRevenue.cs:222](../../../UBClasses/CommissionRevenue.cs#L222) |
| `UBCommissionSelectionUpdate` | [Commission & Fee](by-topic/commission-fee.md) | [L257205](../../../ScriptDB/000_4_CreateSP.sql#L257205) | — | 0 / 0 | — |
| `UBCommissionTypeList` | [Commission & Fee](by-topic/commission-fee.md) | [L257249](../../../ScriptDB/000_4_CreateSP.sql#L257249) | — | 3 / 0 | — |
| `UBCommissionUndoPayroll` | [Commission & Fee](by-topic/commission-fee.md) | [L257278](../../../ScriptDB/000_4_CreateSP.sql#L257278) | — | 0 / 0 | — |
| `UBCommissionUpdate` | [Commission & Fee](by-topic/commission-fee.md) | [L257310](../../../ScriptDB/000_4_CreateSP.sql#L257310) | 1 / 1 file | 1 / 2 | [CommissionRevenue.cs:661](../../../UBClasses/CommissionRevenue.cs#L661) |
| `UBCommissionUpdateGIC` | [Commission & Fee](by-topic/commission-fee.md) | [L257583](../../../ScriptDB/000_4_CreateSP.sql#L257583) | — | 1 / 2 | — |
| `UBCommissionUpdateRates` | [Commission & Fee](by-topic/commission-fee.md) | [L257736](../../../ScriptDB/000_4_CreateSP.sql#L257736) | — | 1 / 2 | — |
| `UBCommissionUpdateRates4GroupOne` | [Commission & Fee](by-topic/commission-fee.md) | [L257791](../../../ScriptDB/000_4_CreateSP.sql#L257791) | — | 1 / 0 | — |
| `UBCommissionUpdateRates4RevenueOne` | [Commission & Fee](by-topic/commission-fee.md) | [L257850](../../../ScriptDB/000_4_CreateSP.sql#L257850) | — | 1 / 0 | — |
| `UBCommissionViewHeaderDetail` | [Commission & Fee](by-topic/commission-fee.md) | [L257904](../../../ScriptDB/000_4_CreateSP.sql#L257904) | — | 0 / 0 | — |
| `UBCommissionViewHeaderTotal` | [Commission & Fee](by-topic/commission-fee.md) | [L258111](../../../ScriptDB/000_4_CreateSP.sql#L258111) | — | 1 / 0 | — |
| `UBCommissionViewSearch` | [Commission & Fee](by-topic/commission-fee.md) | [L258172](../../../ScriptDB/000_4_CreateSP.sql#L258172) | 1 / 1 file | 0 / 4 | [CommissionRevenue.cs:406](../../../UBClasses/CommissionRevenue.cs#L406) |
| `UBCommissionViewSearchCriteriaSave` | [Commission & Fee](by-topic/commission-fee.md) | [L259505](../../../ScriptDB/000_4_CreateSP.sql#L259505) | — | 1 / 1 | — |
| `UBCommissionViewTotal` | [Commission & Fee](by-topic/commission-fee.md) | [L259841](../../../ScriptDB/000_4_CreateSP.sql#L259841) | — | 1 / 0 | — |
| `UBCommLS_SetStartDate` | [Commission & Fee](by-topic/commission-fee.md) | [L259942](../../../ScriptDB/000_4_CreateSP.sql#L259942) | — | 0 / 0 | — |
| `UBCommMatrixAdvisorFeeByRep` | [Commission & Fee](by-topic/commission-fee.md) | [L259975](../../../ScriptDB/000_4_CreateSP.sql#L259975) | — | 2 / 0 | — |
| `UBCommMatrixItemAdd` | [Commission & Fee](by-topic/commission-fee.md) | [L260039](../../../ScriptDB/000_4_CreateSP.sql#L260039) | 1 / 1 file | 2 / 0 | [Member.cs:2527](../../../UBClasses/Member.cs#L2527) |
| `UBCommMatrixItemAddDealerPortion` | [Commission & Fee](by-topic/commission-fee.md) | [L260189](../../../ScriptDB/000_4_CreateSP.sql#L260189) | — | 1 / 0 | — |
| `UBCommMatrixItemAddDealerPortionAll` | [Commission & Fee](by-topic/commission-fee.md) | [L260270](../../../ScriptDB/000_4_CreateSP.sql#L260270) | — | 0 / 1 | — |
| `UBCommMatrixItemCopy` | [Commission & Fee](by-topic/commission-fee.md) | [L260296](../../../ScriptDB/000_4_CreateSP.sql#L260296) | 1 / 1 file | 0 / 0 | [Member.cs:2473](../../../UBClasses/Member.cs#L2473) |
| `UBCommMatrixItemRemove` | [Commission & Fee](by-topic/commission-fee.md) | [L260381](../../../ScriptDB/000_4_CreateSP.sql#L260381) | 1 / 1 file | 0 / 0 | [Member.cs:2418](../../../UBClasses/Member.cs#L2418) |
| `UBCommMatrixItemUpdate` | [Commission & Fee](by-topic/commission-fee.md) | [L260441](../../../ScriptDB/000_4_CreateSP.sql#L260441) | 1 / 1 file | 0 / 0 | [Member.cs:2527](../../../UBClasses/Member.cs#L2527) |
| `UBCommMatrixRateInfo` | [Commission & Fee](by-topic/commission-fee.md) | [L260563](../../../ScriptDB/000_4_CreateSP.sql#L260563) | — | 1 / 0 | — |
| `UBCommMatrixRepInfo` | [Commission & Fee](by-topic/commission-fee.md) | [L260597](../../../ScriptDB/000_4_CreateSP.sql#L260597) | 1 / 1 file | 0 / 0 | [Member.cs:2315](../../../UBClasses/Member.cs#L2315) |
| `UBCommMatrixRepMinEarningList` | [Commission & Fee](by-topic/commission-fee.md) | [L260724](../../../ScriptDB/000_4_CreateSP.sql#L260724) | — | 0 / 0 | — |
| `UBCommOverrideMemberTypeList` | [Commission & Fee](by-topic/commission-fee.md) | [L260748](../../../ScriptDB/000_4_CreateSP.sql#L260748) | — | 3 / 0 | — |
| `UBCommPayableComboList` | [Commission & Fee](by-topic/commission-fee.md) | [L260773](../../../ScriptDB/000_4_CreateSP.sql#L260773) | — | 0 / 4 | — |
| `UBCommPayablePrn` | [Commission & Fee](by-topic/commission-fee.md) | [L260805](../../../ScriptDB/000_4_CreateSP.sql#L260805) | 1 / 1 file | 0 / 3 | [CommissionRevenue.cs:2415](../../../UBClasses/CommissionRevenue.cs#L2415) |
| `UBCommPayableRestoreOneRecord` | [Commission & Fee](by-topic/commission-fee.md) | [L261086](../../../ScriptDB/000_4_CreateSP.sql#L261086) | — | 0 / 0 | — |
| `UBCommPayableStatusList` | [Commission & Fee](by-topic/commission-fee.md) | [L261153](../../../ScriptDB/000_4_CreateSP.sql#L261153) | — | 3 / 0 | — |
| `UBCommPayrollAdjustOnePayable` | [Commission & Fee](by-topic/commission-fee.md) | [L261180](../../../ScriptDB/000_4_CreateSP.sql#L261180) | — | 3 / 2 | — |
| `UBCommPayrollCheckAll` | [Commission & Fee](by-topic/commission-fee.md) | [L261253](../../../ScriptDB/000_4_CreateSP.sql#L261253) | — | 0 / 0 | — |
| `UBCommPayrollDealerListExport` | [Commission & Fee](by-topic/commission-fee.md) | [L261299](../../../ScriptDB/000_4_CreateSP.sql#L261299) | — | 0 / 0 | — |
| `UBCommPayrollDetail` | [Commission & Fee](by-topic/commission-fee.md) | [L261347](../../../ScriptDB/000_4_CreateSP.sql#L261347) | 1 / 1 file | 0 / 7 | [CPayroll.cs:105](../../../VieFUNDPdf/CPayroll.cs#L105) |
| `UBCommPayrollDetail2` | [Commission & Fee](by-topic/commission-fee.md) | [L261771](../../../ScriptDB/000_4_CreateSP.sql#L261771) | — | 0 / 6 | — |
| `UBCommPayrollEFTEnd` | [Commission & Fee](by-topic/commission-fee.md) | [L261993](../../../ScriptDB/000_4_CreateSP.sql#L261993) | 1 / 1 file | 0 / 1 | [EFT.cs:800](../../../UBFFImport/EFT.cs#L800) |
| `UBCommPayrollEFTStart` | [Commission & Fee](by-topic/commission-fee.md) | [L262031](../../../ScriptDB/000_4_CreateSP.sql#L262031) | 1 / 1 file | 0 / 0 | [EFT.cs:759](../../../UBFFImport/EFT.cs#L759) |
| `UBCommPayrollEFTTagged` | [Commission & Fee](by-topic/commission-fee.md) | [L262102](../../../ScriptDB/000_4_CreateSP.sql#L262102) | — | 0 / 1 | — |
| `UBCommPayrollEFTTagged_Old` | [Commission & Fee](by-topic/commission-fee.md) | [L262176](../../../ScriptDB/000_4_CreateSP.sql#L262176) | — | 0 / 0 | — |
| `UBCommPayrollExportEndTask` | [Commission & Fee](by-topic/commission-fee.md) | [L262220](../../../ScriptDB/000_4_CreateSP.sql#L262220) | — | 0 / 0 | — |
| `UBCommPayrollExportSet` | [Commission & Fee](by-topic/commission-fee.md) | [L262234](../../../ScriptDB/000_4_CreateSP.sql#L262234) | — | 0 / 0 | — |
| `UBCommPayrollOneDealerExport` | [Commission & Fee](by-topic/commission-fee.md) | [L262263](../../../ScriptDB/000_4_CreateSP.sql#L262263) | — | 0 / 0 | — |
| `UBCommPayrollProcess` | [Commission & Fee](by-topic/commission-fee.md) | [L262330](../../../ScriptDB/000_4_CreateSP.sql#L262330) | — | 0 / 5 | — |
| `UBCommPayrollProcessReCalcByIDOne` | [Commission & Fee](by-topic/commission-fee.md) | [L262565](../../../ScriptDB/000_4_CreateSP.sql#L262565) | — | 1 / 0 | — |
| `UBCommPayrollProcessReCalcYTDByID` | [Commission & Fee](by-topic/commission-fee.md) | [L262601](../../../ScriptDB/000_4_CreateSP.sql#L262601) | — | 5 / 0 | — |
| `UBCommPayrollProcessReCalcYTDByPaidDate` | [Commission & Fee](by-topic/commission-fee.md) | [L262665](../../../ScriptDB/000_4_CreateSP.sql#L262665) | — | 1 / 1 | — |
| `UBCommPayrollProcessReCalcYTDBySince` | [Commission & Fee](by-topic/commission-fee.md) | [L262703](../../../ScriptDB/000_4_CreateSP.sql#L262703) | — | 0 / 1 | — |
| `UBCommPayrollProcessReCalcYTDSince2` | [Commission & Fee](by-topic/commission-fee.md) | [L262744](../../../ScriptDB/000_4_CreateSP.sql#L262744) | — | 0 / 2 | — |
| `UBCommPayrollSavePdfObj` | [Commission & Fee](by-topic/commission-fee.md) | [L262781](../../../ScriptDB/000_4_CreateSP.sql#L262781) | 1 / 1 file | 0 / 0 | [CPayroll.cs:65](../../../VieFUNDPdf/CPayroll.cs#L65) |
| `UBCommPayrollTMPClear` | [Commission & Fee](by-topic/commission-fee.md) | [L262810](../../../ScriptDB/000_4_CreateSP.sql#L262810) | — | 2 / 0 | — |
| `UBCommPayrollTMPRefresh` | [Commission & Fee](by-topic/commission-fee.md) | [L262849](../../../ScriptDB/000_4_CreateSP.sql#L262849) | — | 1 / 1 | — |
| `UBCommPayrollTMPVerify` | [Commission & Fee](by-topic/commission-fee.md) | [L263023](../../../ScriptDB/000_4_CreateSP.sql#L263023) | — | 1 / 1 | — |
| `UBCommPayrollTMPVerifyOne` | [Commission & Fee](by-topic/commission-fee.md) | [L263051](../../../ScriptDB/000_4_CreateSP.sql#L263051) | — | 1 / 0 | — |
| `UBCommPayrollUndo` | [Commission & Fee](by-topic/commission-fee.md) | [L263155](../../../ScriptDB/000_4_CreateSP.sql#L263155) | — | 3 / 1 | — |
| `UBCommPrePayrollDetail` | [Commission & Fee](by-topic/commission-fee.md) | [L263233](../../../ScriptDB/000_4_CreateSP.sql#L263233) | 1 / 1 file | 0 / 7 | [CPayroll.cs:1398](../../../VieFUNDPdf/CPayroll.cs#L1398) |
| `UBCommPrePayrollMember` | [Commission & Fee](by-topic/commission-fee.md) | [L263738](../../../ScriptDB/000_4_CreateSP.sql#L263738) | 1 / 1 file | 0 / 0 | [CPayroll.cs:1717](../../../VieFUNDPdf/CPayroll.cs#L1717) |
| `UBCommPutBackPayableZeroValueGroup` | [Commission & Fee](by-topic/commission-fee.md) | [L263768](../../../ScriptDB/000_4_CreateSP.sql#L263768) | — | 0 / 1 | — |
| `UBCommPutBackPayableZeroValueRec` | [Commission & Fee](by-topic/commission-fee.md) | [L263800](../../../ScriptDB/000_4_CreateSP.sql#L263800) | — | 0 / 1 | — |
| `UBCommReceivableGet` | [Commission & Fee](by-topic/commission-fee.md) | [L263836](../../../ScriptDB/000_4_CreateSP.sql#L263836) | — | 1 / 0 | — |
| `UBCommReceivableQuarterReport` | [Commission & Fee](by-topic/commission-fee.md) | [L263885](../../../ScriptDB/000_4_CreateSP.sql#L263885) | — | 0 / 3 | — |
| `UBCommReceivableSummary` | [Commission & Fee](by-topic/commission-fee.md) | [L264420](../../../ScriptDB/000_4_CreateSP.sql#L264420) | — | 0 / 2 | — |
| `UBCommRecStatusList` | [Commission & Fee](by-topic/commission-fee.md) | [L264591](../../../ScriptDB/000_4_CreateSP.sql#L264591) | — | 1 / 0 | — |
| `UBCommRepIDRefresh` | [Commission & Fee](by-topic/commission-fee.md) | [L264617](../../../ScriptDB/000_4_CreateSP.sql#L264617) | — | 0 / 0 | — |
| `UBCommRepSetupComboList` | [Commission & Fee](by-topic/commission-fee.md) | [L264675](../../../ScriptDB/000_4_CreateSP.sql#L264675) | — | 0 / 4 | — |
| `UBCommRescanLS` | [Commission & Fee](by-topic/commission-fee.md) | [L264702](../../../ScriptDB/000_4_CreateSP.sql#L264702) | — | 1 / 1 | — |
| `UBCommSummary` | [Commission & Fee](by-topic/commission-fee.md) | [L264735](../../../ScriptDB/000_4_CreateSP.sql#L264735) | — | 0 / 1 | — |
| `UBCommSummaryByMgmtCode` | [Commission & Fee](by-topic/commission-fee.md) | [L264854](../../../ScriptDB/000_4_CreateSP.sql#L264854) | — | 0 / 0 | — |
| `UBCommSummaryGlobalMaxFin` | [Commission & Fee](by-topic/commission-fee.md) | [L264918](../../../ScriptDB/000_4_CreateSP.sql#L264918) | — | 0 / 0 | — |
| `UBCommTemplateAdd` | [Commission & Fee](by-topic/commission-fee.md) | [L265117](../../../ScriptDB/000_4_CreateSP.sql#L265117) | 1 / 1 file | 0 / 0 | [CommissionDef.cs:514](../../../UBClasses/CommissionDef.cs#L514) |
| `UBCommTemplateList` | [Commission & Fee](by-topic/commission-fee.md) | [L265168](../../../ScriptDB/000_4_CreateSP.sql#L265168) | 2 / 1 file | 1 / 0 | [CommissionDef.cs:332](../../../UBClasses/CommissionDef.cs#L332) |
| `UBCommTemplateModify` | [Commission & Fee](by-topic/commission-fee.md) | [L265219](../../../ScriptDB/000_4_CreateSP.sql#L265219) | 1 / 1 file | 0 / 0 | [CommissionDef.cs:514](../../../UBClasses/CommissionDef.cs#L514) |
| `UBCommTemplateRemove` | [Commission & Fee](by-topic/commission-fee.md) | [L265277](../../../ScriptDB/000_4_CreateSP.sql#L265277) | 1 / 1 file | 0 / 0 | [CommissionDef.cs:464](../../../UBClasses/CommissionDef.cs#L464) |
| `UBCommTrendComboList` | [Commission & Fee](by-topic/commission-fee.md) | [L265308](../../../ScriptDB/000_4_CreateSP.sql#L265308) | — | 0 / 3 | — |
| `UBCommViewComboList` | [Commission & Fee](by-topic/commission-fee.md) | [L265335](../../../ScriptDB/000_4_CreateSP.sql#L265335) | — | 0 / 17 | — |
| `UBCompAccountApprovalDetail` | [Account & Plan](by-topic/account-plan.md) | [L265430](../../../ScriptDB/000_4_CreateSP.sql#L265430) | 1 / 1 file | 0 / 19 | [Compliance.cs:258](../../../UBClasses/Compliance.cs#L258) |
| `UBCompAccountAssign1Doc` | [Account & Plan](by-topic/account-plan.md) | [L265673](../../../ScriptDB/000_4_CreateSP.sql#L265673) | — | 1 / 0 | — |
| `UBCompAccountAssign1DocAllPlan` | [Account & Plan](by-topic/account-plan.md) | [L265777](../../../ScriptDB/000_4_CreateSP.sql#L265777) | — | 2 / 1 | — |
| `UBCompAccountAssignDoc` | [Account & Plan](by-topic/account-plan.md) | [L265818](../../../ScriptDB/000_4_CreateSP.sql#L265818) | — | 5 / 0 | — |
| `UBCompAccountAssignDocAll` | [Account & Plan](by-topic/account-plan.md) | [L265943](../../../ScriptDB/000_4_CreateSP.sql#L265943) | — | 0 / 1 | — |
| `UBCompAccountAssignDocAll_ActivePlan` | [Account & Plan](by-topic/account-plan.md) | [L265979](../../../ScriptDB/000_4_CreateSP.sql#L265979) | — | 0 / 1 | — |
| `UBCompAccountClientDetail` | [Account & Plan](by-topic/account-plan.md) | [L266016](../../../ScriptDB/000_4_CreateSP.sql#L266016) | 1 / 1 file | 0 / 7 | [Compliance.cs:313](../../../UBClasses/Compliance.cs#L313) |
| `UBCompAccountDocGetDefID` | [Account & Plan](by-topic/account-plan.md) | [L266100](../../../ScriptDB/000_4_CreateSP.sql#L266100) | 1 / 1 file | 0 / 0 | [Document.cs:1526](../../../UBClasses/Document.cs#L1526) |
| `UBCompAccountDocGetReceived` | [Account & Plan](by-topic/account-plan.md) | [L266127](../../../ScriptDB/000_4_CreateSP.sql#L266127) | 1 / 1 file | 0 / 0 | [Document.cs:1414](../../../UBClasses/Document.cs#L1414) |
| `UBCompAccountDocList` | [Account & Plan](by-topic/account-plan.md) | [L266154](../../../ScriptDB/000_4_CreateSP.sql#L266154) | 1 / 1 file | 1 / 0 | [Document.cs:1333](../../../UBClasses/Document.cs#L1333) |
| `UBCompAccountDocRemoveAttach` | [Account & Plan](by-topic/account-plan.md) | [L266234](../../../ScriptDB/000_4_CreateSP.sql#L266234) | 1 / 1 file | 0 / 0 | [Document.cs:1629](../../../UBClasses/Document.cs#L1629) |
| `UBCompAccountDocSetReceived` | [Account & Plan](by-topic/account-plan.md) | [L266286](../../../ScriptDB/000_4_CreateSP.sql#L266286) | 1 / 1 file | 0 / 1 | [Document.cs:1466](../../../UBClasses/Document.cs#L1466) |
| `UBCompAccountDocSetReceivedOne` | [Account & Plan](by-topic/account-plan.md) | [L266346](../../../ScriptDB/000_4_CreateSP.sql#L266346) | — | 1 / 1 | — |
| `UBCompAccountDocUpload` | [Account & Plan](by-topic/account-plan.md) | [L266429](../../../ScriptDB/000_4_CreateSP.sql#L266429) | 1 / 1 file | 0 / 1 | [Document.cs:1574](../../../UBClasses/Document.cs#L1574) |
| `UBCompAccountKYCUpdateApproveAll` | [Account & Plan](by-topic/account-plan.md) | [L266484](../../../ScriptDB/000_4_CreateSP.sql#L266484) | 1 / 1 file | 0 / 1 | [Compliance.cs:4006](../../../UBClasses/Compliance.cs#L4006) |
| `UBCompAccountKYCUpdateApproveTaggedItems` | [Account & Plan](by-topic/account-plan.md) | [L266865](../../../ScriptDB/000_4_CreateSP.sql#L266865) | 1 / 1 file | 0 / 1 | [Compliance.cs:5962](../../../UBClasses/Compliance.cs#L5962) |
| `UBCompAccountKYCUpdateCount` | [Account & Plan](by-topic/account-plan.md) | [L266910](../../../ScriptDB/000_4_CreateSP.sql#L266910) | — | 1 / 0 | — |
| `UBCompAccountKYCUpdateList` | [Account & Plan](by-topic/account-plan.md) | [L266978](../../../ScriptDB/000_4_CreateSP.sql#L266978) | 1 / 1 file | 0 / 2 | [Plan.cs:2857](../../../UBClasses/Plan.cs#L2857) |
| `UBCompAccountKYCUpdatePendingCount` | [Account & Plan](by-topic/account-plan.md) | [L267983](../../../ScriptDB/000_4_CreateSP.sql#L267983) | 1 / 1 file | 0 / 0 | [Compliance.cs:3836](../../../UBClasses/Compliance.cs#L3836) |
| `UBCompAccountKYCUpdateStatusInfo` | [Account & Plan](by-topic/account-plan.md) | [L268337](../../../ScriptDB/000_4_CreateSP.sql#L268337) | 1 / 1 file | 1 / 0 | [Plan.cs:2666](../../../UBClasses/Plan.cs#L2666) |
| `UBCompAccountKYCUpdateStatusUpdate` | [Account & Plan](by-topic/account-plan.md) | [L268394](../../../ScriptDB/000_4_CreateSP.sql#L268394) | 1 / 1 file | 2 / 1 | [Plan.cs:2709](../../../UBClasses/Plan.cs#L2709) |
| `UBCompAccountKYCUpdateStatusUpdateClient` | [Account & Plan](by-topic/account-plan.md) | [L268415](../../../ScriptDB/000_4_CreateSP.sql#L268415) | 1 / 1 file | 0 / 1 | [Plan.cs:2711](../../../UBClasses/Plan.cs#L2711) |
| `UBCompAccountKYCUpdateStatusUpdateOne` | [Account & Plan](by-topic/account-plan.md) | [L268479](../../../ScriptDB/000_4_CreateSP.sql#L268479) | — | 3 / 3 | — |
| `UBCompAccountKYCUpdateSummary` | [Account & Plan](by-topic/account-plan.md) | [L268836](../../../ScriptDB/000_4_CreateSP.sql#L268836) | 1 / 1 file | 0 / 0 | [Plan.cs:2556](../../../UBClasses/Plan.cs#L2556) |
| `UBCompAccountOpenComboList` | [Account & Plan](by-topic/account-plan.md) | [L269215](../../../ScriptDB/000_4_CreateSP.sql#L269215) | — | 0 / 5 | — |
| `UBCompAccountOpeningApproveAll` | [Account & Plan](by-topic/account-plan.md) | [L269239](../../../ScriptDB/000_4_CreateSP.sql#L269239) | 1 / 1 file | 0 / 1 | [Compliance.cs:3919](../../../UBClasses/Compliance.cs#L3919) |
| `UBCompAccountOpeningApproveTaggedItems` | [Account & Plan](by-topic/account-plan.md) | [L269575](../../../ScriptDB/000_4_CreateSP.sql#L269575) | 1 / 1 file | 0 / 1 | [Compliance.cs:6017](../../../UBClasses/Compliance.cs#L6017) |
| `UBCompAccountOpeningCount` | [Account & Plan](by-topic/account-plan.md) | [L269620](../../../ScriptDB/000_4_CreateSP.sql#L269620) | — | 1 / 0 | — |
| `UBCompAccountOpeningList` | [Account & Plan](by-topic/account-plan.md) | [L269686](../../../ScriptDB/000_4_CreateSP.sql#L269686) | 1 / 1 file | 0 / 2 | [Plan.cs:2397](../../../UBClasses/Plan.cs#L2397) |
| `UBCompAccountOpeningPendingCount` | [Account & Plan](by-topic/account-plan.md) | [L270232](../../../ScriptDB/000_4_CreateSP.sql#L270232) | 1 / 1 file | 0 / 0 | [Compliance.cs:3755](../../../UBClasses/Compliance.cs#L3755) |
| `UBCompAccountOpeningSearchCriteriaSave` | [Account & Plan](by-topic/account-plan.md) | [L270548](../../../ScriptDB/000_4_CreateSP.sql#L270548) | — | 1 / 1 | — |
| `UBCompAccountOpeningStatusInfo` | [Account & Plan](by-topic/account-plan.md) | [L270702](../../../ScriptDB/000_4_CreateSP.sql#L270702) | 1 / 1 file | 1 / 0 | [Plan.cs:2294](../../../UBClasses/Plan.cs#L2294) |
| `UBCompAccountOpeningSummary` | [Account & Plan](by-topic/account-plan.md) | [L270753](../../../ScriptDB/000_4_CreateSP.sql#L270753) | 1 / 1 file | 0 / 0 | [Plan.cs:2484](../../../UBClasses/Plan.cs#L2484) |
| `UBCompAccountOpenStatusUpdate` | [Account & Plan](by-topic/account-plan.md) | [L270976](../../../ScriptDB/000_4_CreateSP.sql#L270976) | 1 / 1 file | 1 / 1 | [Plan.cs:2335](../../../UBClasses/Plan.cs#L2335) |
| `UBCompAccountOpenStatusUpdateOne` | [Account & Plan](by-topic/account-plan.md) | [L270999](../../../ScriptDB/000_4_CreateSP.sql#L270999) | — | 4 / 3 | — |
| `UBCompAccountUpdateSearchCriteriaSave` | [Account & Plan](by-topic/account-plan.md) | [L271345](../../../ScriptDB/000_4_CreateSP.sql#L271345) | — | 1 / 1 | — |
| `UBCompApprovalComboList` | [Shared / Other](by-topic/shared-other.md) | [L271499](../../../ScriptDB/000_4_CreateSP.sql#L271499) | — | 0 / 1 | — |
| `UBCompApprovalLevelList` | [Shared / Other](by-topic/shared-other.md) | [L271523](../../../ScriptDB/000_4_CreateSP.sql#L271523) | — | 4 / 0 | — |
| `UBCompApprovalStatusList` | [Shared / Other](by-topic/shared-other.md) | [L271563](../../../ScriptDB/000_4_CreateSP.sql#L271563) | — | 3 / 0 | — |
| `UBCompBasketSuitabilityCheck` | [Compliance](by-topic/compliance.md) | [L271601](../../../ScriptDB/000_4_CreateSP.sql#L271601) | — | 1 / 1 | — |
| `UBCompBasketSuitabilityCheckConv` | [Compliance](by-topic/compliance.md) | [L271951](../../../ScriptDB/000_4_CreateSP.sql#L271951) | — | 1 / 0 | — |
| `UBCompBasketSuitabilityCheckConvRisk` | [Compliance](by-topic/compliance.md) | [L272151](../../../ScriptDB/000_4_CreateSP.sql#L272151) | — | 1 / 0 | — |
| `UBCompBasketSuitabilityCheckRisk` | [Compliance](by-topic/compliance.md) | [L272314](../../../ScriptDB/000_4_CreateSP.sql#L272314) | — | 0 / 1 | — |
| `UBCompBasketSuitabilityDetail` | [Compliance](by-topic/compliance.md) | [L272516](../../../ScriptDB/000_4_CreateSP.sql#L272516) | 1 / 1 file | 0 / 1 | [Compliance.cs:1280](../../../UBClasses/Compliance.cs#L1280) |
| `UBCompCalcPlanRiskCurrent` | [Account & Plan](by-topic/account-plan.md) | [L272560](../../../ScriptDB/000_4_CreateSP.sql#L272560) | — | 1 / 0 | — |
| `UBCompCalcPlanRiskObjCurrent` | [Account & Plan](by-topic/account-plan.md) | [L272809](../../../ScriptDB/000_4_CreateSP.sql#L272809) | — | 2 / 0 | — |
| `UBCompCalcRiskBasket` | [Shared / Other](by-topic/shared-other.md) | [L273209](../../../ScriptDB/000_4_CreateSP.sql#L273209) | 1 / 1 file | 0 / 1 | [Compliance.cs:504](../../../UBClasses/Compliance.cs#L504) |
| `UBCompCalcRiskBasketOne` | [Shared / Other](by-topic/shared-other.md) | [L273235](../../../ScriptDB/000_4_CreateSP.sql#L273235) | — | 3 / 0 | — |
| `UBCompCalcRiskTMP` | [Shared / Other](by-topic/shared-other.md) | [L273992](../../../ScriptDB/000_4_CreateSP.sql#L273992) | 1 / 1 file | 0 / 0 | [Compliance.cs:378](../../../UBClasses/Compliance.cs#L378) |
| `UBCompCalcRiskTrx` | [Trading & Orders](by-topic/trading-orders.md) | [L274952](../../../ScriptDB/000_4_CreateSP.sql#L274952) | 1 / 1 file | 0 / 0 | [Compliance.cs:563](../../../UBClasses/Compliance.cs#L563) |
| `UBCompCheckClientInfo` | [Client & KYC](by-topic/client-kyc.md) | [L275429](../../../ScriptDB/000_4_CreateSP.sql#L275429) | — | 6 / 2 | — |
| `UBCompCheckClientInfoAll` | [Client & KYC](by-topic/client-kyc.md) | [L275570](../../../ScriptDB/000_4_CreateSP.sql#L275570) | — | 0 / 1 | — |
| `UBCompCheckClientInfoScan` | [Client & KYC](by-topic/client-kyc.md) | [L275604](../../../ScriptDB/000_4_CreateSP.sql#L275604) | — | 1 / 0 | — |
| `UBCompCheckClientInfoUpdate` | [Client & KYC](by-topic/client-kyc.md) | [L275705](../../../ScriptDB/000_4_CreateSP.sql#L275705) | — | 11 / 0 | — |
| `UBCompCheckPlanInfo` | [Account & Plan](by-topic/account-plan.md) | [L275782](../../../ScriptDB/000_4_CreateSP.sql#L275782) | — | 17 / 1 | — |
| `UBCompCheckPlanInfo1Client` | [Account & Plan](by-topic/account-plan.md) | [L276047](../../../ScriptDB/000_4_CreateSP.sql#L276047) | — | 1 / 1 | — |
| `UBCompCheckPlanInfoAll` | [Account & Plan](by-topic/account-plan.md) | [L276081](../../../ScriptDB/000_4_CreateSP.sql#L276081) | — | 0 / 1 | — |
| `UBCompDeficiencyLogPlanNew` | [Account & Plan](by-topic/account-plan.md) | [L276115](../../../ScriptDB/000_4_CreateSP.sql#L276115) | 1 / 1 file | 0 / 0 | [Compliance.cs:4957](../../../UBClasses/Compliance.cs#L4957) |
| `UBCompDeficiencyLogPlanUpdate` | [Account & Plan](by-topic/account-plan.md) | [L276280](../../../ScriptDB/000_4_CreateSP.sql#L276280) | 1 / 1 file | 0 / 0 | [Compliance.cs:5059](../../../UBClasses/Compliance.cs#L5059) |
| `UBCompDeficiencyLogTrx` | [Trading & Orders](by-topic/trading-orders.md) | [L276445](../../../ScriptDB/000_4_CreateSP.sql#L276445) | 1 / 1 file | 0 / 0 | [Compliance.cs:4855](../../../UBClasses/Compliance.cs#L4855) |
| `UBCompDocRemoveDeletedDocFromPlan` | [Account & Plan](by-topic/account-plan.md) | [L276740](../../../ScriptDB/000_4_CreateSP.sql#L276740) | — | 0 / 0 | — |
| `UBCompDocRescanPlan` | [Account & Plan](by-topic/account-plan.md) | [L276777](../../../ScriptDB/000_4_CreateSP.sql#L276777) | — | 0 / 0 | — |
| `UBCompDocSetReceivedTagged` | [Documents & PDF](by-topic/documents-pdf.md) | [L276847](../../../ScriptDB/000_4_CreateSP.sql#L276847) | 1 / 1 file | 0 / 0 | [Document.cs:2476](../../../UBClasses/Document.cs#L2476) |
| `UBCompExecRoleList` | [Security & Auth](by-topic/security-auth.md) | [L276892](../../../ScriptDB/000_4_CreateSP.sql#L276892) | — | 1 / 0 | — |
| `UBCompGetSettings` | [Shared / Other](by-topic/shared-other.md) | [L276918](../../../ScriptDB/000_4_CreateSP.sql#L276918) | 1 / 1 file | 2 / 0 | [Compliance.cs:105](../../../UBClasses/Compliance.cs#L105) |
| `UBCompGICClientList` | [Fund & GIC](by-topic/fund-gic.md) | [L277019](../../../ScriptDB/000_4_CreateSP.sql#L277019) | — | 0 / 0 | — |
| `UBCompGICSuitabilityCheck` | [Compliance](by-topic/compliance.md) | [L277065](../../../ScriptDB/000_4_CreateSP.sql#L277065) | — | 0 / 1 | — |
| `UBCompGICSuitabilityCheck4Update` | [Compliance](by-topic/compliance.md) | [L277325](../../../ScriptDB/000_4_CreateSP.sql#L277325) | — | 0 / 0 | — |
| `UBCompMissingKYCList` | [Client & KYC](by-topic/client-kyc.md) | [L277576](../../../ScriptDB/000_4_CreateSP.sql#L277576) | 1 / 1 file | 0 / 2 | [Plan.cs:2772](../../../UBClasses/Plan.cs#L2772) |
| `UBCompMissingKYCSearchCriteriaSave` | [Client & KYC](by-topic/client-kyc.md) | [L277927](../../../ScriptDB/000_4_CreateSP.sql#L277927) | — | 1 / 1 | — |
| `UBCompNewPlanApproveAll` | [Account & Plan](by-topic/account-plan.md) | [L278039](../../../ScriptDB/000_4_CreateSP.sql#L278039) | 1 / 1 file | 0 / 1 | [Compliance.cs:5317](../../../UBClasses/Compliance.cs#L5317) |
| `UBCompNewPlanList` | [Account & Plan](by-topic/account-plan.md) | [L278246](../../../ScriptDB/000_4_CreateSP.sql#L278246) | 1 / 1 file | 0 / 1 | [Plan.cs:4201](../../../UBClasses/Plan.cs#L4201) |
| `UBCompNewPlanPendingCount` | [Account & Plan](by-topic/account-plan.md) | [L278675](../../../ScriptDB/000_4_CreateSP.sql#L278675) | 1 / 1 file | 0 / 0 | [Compliance.cs:5246](../../../UBClasses/Compliance.cs#L5246) |
| `UBCompNewPlanSummary` | [Account & Plan](by-topic/account-plan.md) | [L278866](../../../ScriptDB/000_4_CreateSP.sql#L278866) | 1 / 1 file | 0 / 0 | [Plan.cs:4284](../../../UBClasses/Plan.cs#L4284) |
| `UBCompPlanDetail` | [Account & Plan](by-topic/account-plan.md) | [L279132](../../../ScriptDB/000_4_CreateSP.sql#L279132) | 1 / 1 file | 0 / 4 | [Compliance.cs:5191](../../../UBClasses/Compliance.cs#L5191) |
| `UBCompPlanDocInfo` | [Account & Plan](by-topic/account-plan.md) | [L279184](../../../ScriptDB/000_4_CreateSP.sql#L279184) | — | 0 / 0 | — |
| `UBCompPlanReviewHistory` | [Account & Plan](by-topic/account-plan.md) | [L279209](../../../ScriptDB/000_4_CreateSP.sql#L279209) | — | 2 / 0 | — |
| `UBCompPlanReviewHistoryShort` | [Account & Plan](by-topic/account-plan.md) | [L279358](../../../ScriptDB/000_4_CreateSP.sql#L279358) | — | 1 / 0 | — |
| `UBCompPlanTrendComboList` | [Account & Plan](by-topic/account-plan.md) | [L279466](../../../ScriptDB/000_4_CreateSP.sql#L279466) | — | 0 / 4 | — |
| `UBCompPlanTrendRecalc` | [Account & Plan](by-topic/account-plan.md) | [L279495](../../../ScriptDB/000_4_CreateSP.sql#L279495) | — | 2 / 1 | — |
| `UBCompPlanTrendRecalcByMonth` | [Account & Plan](by-topic/account-plan.md) | [L279552](../../../ScriptDB/000_4_CreateSP.sql#L279552) | — | 4 / 1 | — |
| `UBCompPlanTrxCountAdd` | [Account & Plan](by-topic/account-plan.md) | [L279650](../../../ScriptDB/000_4_CreateSP.sql#L279650) | — | 0 / 0 | — |
| `UBCompReportTypeList` | [Shared / Other](by-topic/shared-other.md) | [L279701](../../../ScriptDB/000_4_CreateSP.sql#L279701) | — | 0 / 0 | — |
| `UBCompSaveSettings` | [Shared / Other](by-topic/shared-other.md) | [L279740](../../../ScriptDB/000_4_CreateSP.sql#L279740) | 1 / 1 file | 0 / 2 | [Compliance.cs:168](../../../UBClasses/Compliance.cs#L168) |
| `UBCompSuitabilityCheckConv` | [Compliance](by-topic/compliance.md) | [L279924](../../../ScriptDB/000_4_CreateSP.sql#L279924) | — | 4 / 0 | — |
| `UBCompSummaryComboList` | [Shared / Other](by-topic/shared-other.md) | [L280108](../../../ScriptDB/000_4_CreateSP.sql#L280108) | — | 0 / 1 | — |
| `UBCompSummaryList` | [Shared / Other](by-topic/shared-other.md) | [L280136](../../../ScriptDB/000_4_CreateSP.sql#L280136) | 1 / 1 file | 0 / 3 | [Compliance.cs:48](../../../UBClasses/Compliance.cs#L48) |
| `UBCompSupervisoryLevelList` | [Shared / Other](by-topic/shared-other.md) | [L280225](../../../ScriptDB/000_4_CreateSP.sql#L280225) | — | 5 / 0 | — |
| `UBCompTrend_LowMER_ClientFundList` | [Fund & GIC](by-topic/fund-gic.md) | [L280261](../../../ScriptDB/000_4_CreateSP.sql#L280261) | 1 / 1 file | 0 / 0 | [Compliance.cs:5717](../../../UBClasses/Compliance.cs#L5717) |
| `UBCompTrend_LowMER_FixHouseHoldMKV` | [Shared / Other](by-topic/shared-other.md) | [L280300](../../../ScriptDB/000_4_CreateSP.sql#L280300) | — | 0 / 0 | — |
| `UBCompTrend_LowMER_HouseHoldFundList` | [Fund & GIC](by-topic/fund-gic.md) | [L280331](../../../ScriptDB/000_4_CreateSP.sql#L280331) | 1 / 1 file | 0 / 0 | [Compliance.cs:5772](../../../UBClasses/Compliance.cs#L5772) |
| `UBCompTrend_LowMER_List` | [Shared / Other](by-topic/shared-other.md) | [L280375](../../../ScriptDB/000_4_CreateSP.sql#L280375) | 2 / 2 file | 0 / 0 | [Compliance.cs:5620](../../../UBClasses/Compliance.cs#L5620) |
| `UBCompTrend_MER_Step1` | [Shared / Other](by-topic/shared-other.md) | [L280630](../../../ScriptDB/000_4_CreateSP.sql#L280630) | — | 0 / 0 | — |
| `UBCompTrend_MER_Step2` | [Shared / Other](by-topic/shared-other.md) | [L280684](../../../ScriptDB/000_4_CreateSP.sql#L280684) | — | 0 / 0 | — |
| `UBCompTrend_MER_Step3` | [Shared / Other](by-topic/shared-other.md) | [L280774](../../../ScriptDB/000_4_CreateSP.sql#L280774) | — | 0 / 1 | — |
| `UBCompTrend_MER_Step4` | [Shared / Other](by-topic/shared-other.md) | [L280881](../../../ScriptDB/000_4_CreateSP.sql#L280881) | — | 0 / 0 | — |
| `UBCompTrend2SidedClientList` | [Client & KYC](by-topic/client-kyc.md) | [L280947](../../../ScriptDB/000_4_CreateSP.sql#L280947) | 1 / 1 file | 0 / 0 | [Compliance.cs:4194](../../../UBClasses/Compliance.cs#L4194) |
| `UBCompTrend2SidedList` | [Shared / Other](by-topic/shared-other.md) | [L280978](../../../ScriptDB/000_4_CreateSP.sql#L280978) | — | 0 / 2 | — |
| `UBCompTrend2SidedPlanID` | [Account & Plan](by-topic/account-plan.md) | [L281318](../../../ScriptDB/000_4_CreateSP.sql#L281318) | 1 / 1 file | 0 / 0 | [Compliance.cs:4241](../../../UBClasses/Compliance.cs#L4241) |
| `UBCompTrend2SidedRemove` | [Shared / Other](by-topic/shared-other.md) | [L281343](../../../ScriptDB/000_4_CreateSP.sql#L281343) | — | 0 / 0 | — |
| `UBCompTrendExCommTrading` | [Commission & Fee](by-topic/commission-fee.md) | [L281374](../../../ScriptDB/000_4_CreateSP.sql#L281374) | 2 / 2 file | 0 / 2 | [Compliance.cs:1766](../../../UBClasses/Compliance.cs#L1766) |
| `UBCompTrendExCommTradingSave` | [Commission & Fee](by-topic/commission-fee.md) | [L281660](../../../ScriptDB/000_4_CreateSP.sql#L281660) | — | 1 / 1 | — |
| `UBCompTrendFrequentTrading` | [Shared / Other](by-topic/shared-other.md) | [L281792](../../../ScriptDB/000_4_CreateSP.sql#L281792) | 2 / 2 file | 0 / 2 | [Compliance.cs:1609](../../../UBClasses/Compliance.cs#L1609) |
| `UBCompTrendFrequentTradingSave` | [Shared / Other](by-topic/shared-other.md) | [L282087](../../../ScriptDB/000_4_CreateSP.sql#L282087) | — | 1 / 1 | — |
| `UBCompTrendHouseHoldScan` | [Shared / Other](by-topic/shared-other.md) | [L282218](../../../ScriptDB/000_4_CreateSP.sql#L282218) | — | 0 / 0 | — |
| `UBCompTrendRecalc` | [Shared / Other](by-topic/shared-other.md) | [L282235](../../../ScriptDB/000_4_CreateSP.sql#L282235) | — | 0 / 1 | — |
| `UBCompTrendReviewList` | [Shared / Other](by-topic/shared-other.md) | [L282276](../../../ScriptDB/000_4_CreateSP.sql#L282276) | 1 / 1 file | 0 / 0 | [Compliance.cs:3589](../../../UBClasses/Compliance.cs#L3589) |
| `UBCompTrendReviewObj` | [Shared / Other](by-topic/shared-other.md) | [L282331](../../../ScriptDB/000_4_CreateSP.sql#L282331) | 1 / 1 file | 0 / 0 | [Compliance.cs:3648](../../../UBClasses/Compliance.cs#L3648) |
| `UBCompTrendReviewObjAdd` | [Shared / Other](by-topic/shared-other.md) | [L282358](../../../ScriptDB/000_4_CreateSP.sql#L282358) | 1 / 1 file | 0 / 0 | [Compliance.cs:3529](../../../UBClasses/Compliance.cs#L3529) |
| `UBCompTrendReviewRemove` | [Shared / Other](by-topic/shared-other.md) | [L282410](../../../ScriptDB/000_4_CreateSP.sql#L282410) | 1 / 1 file | 0 / 0 | [Compliance.cs:3694](../../../UBClasses/Compliance.cs#L3694) |
| `UBCompTrendScanPlanAll` | [Account & Plan](by-topic/account-plan.md) | [L282440](../../../ScriptDB/000_4_CreateSP.sql#L282440) | — | 0 / 2 | — |
| `UBCompTrendScanPlanChunk` | [Account & Plan](by-topic/account-plan.md) | [L282522](../../../ScriptDB/000_4_CreateSP.sql#L282522) | 1 / 1 file | 0 / 2 | [Compliance.cs:3131](../../../VieFUNDPdf/Compliance.cs#L3131) |
| `UBCompTrendScanPlanOne` | [Account & Plan](by-topic/account-plan.md) | [L282621](../../../ScriptDB/000_4_CreateSP.sql#L282621) | — | 2 / 1 | — |
| `UBCompTrendScanPlanOneClear` | [Account & Plan](by-topic/account-plan.md) | [L282870](../../../ScriptDB/000_4_CreateSP.sql#L282870) | — | 1 / 0 | — |
| `UBCompTrendTrxDSCIssue` | [Trading & Orders](by-topic/trading-orders.md) | [L282897](../../../ScriptDB/000_4_CreateSP.sql#L282897) | — | 0 / 2 | — |
| `UBCompTrendTrxDSCIssueCriteriaSave` | [Trading & Orders](by-topic/trading-orders.md) | [L283188](../../../ScriptDB/000_4_CreateSP.sql#L283188) | — | 1 / 1 | — |
| `UBCompTrendTrxRedemptionFee` | [Commission & Fee](by-topic/commission-fee.md) | [L283319](../../../ScriptDB/000_4_CreateSP.sql#L283319) | — | 0 / 2 | — |
| `UBCompTrendTrxRedemptionFeeCriteriaSave` | [Commission & Fee](by-topic/commission-fee.md) | [L283614](../../../ScriptDB/000_4_CreateSP.sql#L283614) | — | 1 / 1 | — |
| `UBCompTrendTrxShortTerm` | [Trading & Orders](by-topic/trading-orders.md) | [L283745](../../../ScriptDB/000_4_CreateSP.sql#L283745) | — | 0 / 2 | — |
| `UBCompTrendTrxShortTermCriteriaSave` | [Trading & Orders](by-topic/trading-orders.md) | [L284034](../../../ScriptDB/000_4_CreateSP.sql#L284034) | — | 1 / 1 | — |
| `UBCompTrendTrxSwitchFee` | [Commission & Fee](by-topic/commission-fee.md) | [L284165](../../../ScriptDB/000_4_CreateSP.sql#L284165) | — | 0 / 2 | — |
| `UBCompTrendTrxSwitchFeeCriteriaSave` | [Commission & Fee](by-topic/commission-fee.md) | [L284427](../../../ScriptDB/000_4_CreateSP.sql#L284427) | — | 1 / 1 | — |
| `UBCompTrendTrxSwitchLoad` | [Trading & Orders](by-topic/trading-orders.md) | [L284558](../../../ScriptDB/000_4_CreateSP.sql#L284558) | — | 0 / 2 | — |
| `UBCompTrendTrxSwitchLoadCriteriaSave` | [Trading & Orders](by-topic/trading-orders.md) | [L284847](../../../ScriptDB/000_4_CreateSP.sql#L284847) | — | 1 / 1 | — |
| `UBCompTrxAddPlanInfo` | [Account & Plan](by-topic/account-plan.md) | [L284978](../../../ScriptDB/000_4_CreateSP.sql#L284978) | — | 4 / 0 | — |
| `UBCompTrxApprovalFixAll` | [Trading & Orders](by-topic/trading-orders.md) | [L285106](../../../ScriptDB/000_4_CreateSP.sql#L285106) | — | 0 / 1 | — |
| `UBCompTrxApprovalFixOne` | [Trading & Orders](by-topic/trading-orders.md) | [L285216](../../../ScriptDB/000_4_CreateSP.sql#L285216) | — | 1 / 1 | — |
| `UBCompTrxApprovalFundPosChange` | [Fund & GIC](by-topic/fund-gic.md) | [L285301](../../../ScriptDB/000_4_CreateSP.sql#L285301) | — | 1 / 1 | — |
| `UBCompTrxApprovalStatusInfo` | [Trading & Orders](by-topic/trading-orders.md) | [L285360](../../../ScriptDB/000_4_CreateSP.sql#L285360) | 1 / 1 file | 0 / 0 | [Compliance.cs:1334](../../../UBClasses/Compliance.cs#L1334) |
| `UBCompTrxApproveTaggedItems` | [Trading & Orders](by-topic/trading-orders.md) | [L285406](../../../ScriptDB/000_4_CreateSP.sql#L285406) | 1 / 1 file | 0 / 1 | [Compliance.cs:1431](../../../UBClasses/Compliance.cs#L1431) |
| `UBCompTrxApproveTaggedItemsX` | [Trading & Orders](by-topic/trading-orders.md) | [L285450](../../../ScriptDB/000_4_CreateSP.sql#L285450) | 1 / 1 file | 0 / 1 | [Compliance.cs:1493](../../../UBClasses/Compliance.cs#L1493) |
| `UBCompTrxClientList` | [Client & KYC](by-topic/client-kyc.md) | [L285516](../../../ScriptDB/000_4_CreateSP.sql#L285516) | 1 / 1 file | 0 / 0 | [Compliance.cs:1551](../../../UBClasses/Compliance.cs#L1551) |
| `UBCompTrxPlanInfoAdd` | [Account & Plan](by-topic/account-plan.md) | [L285582](../../../ScriptDB/000_4_CreateSP.sql#L285582) | — | 2 / 0 | — |
| `UBCompTrxPlanInfoChanged` | [Account & Plan](by-topic/account-plan.md) | [L285726](../../../ScriptDB/000_4_CreateSP.sql#L285726) | — | 0 / 0 | — |
| `UBCompTrxRefreshPlanInfo` | [Account & Plan](by-topic/account-plan.md) | [L285891](../../../ScriptDB/000_4_CreateSP.sql#L285891) | — | 4 / 0 | — |
| `UBCompTrxReviewHistory` | [Trading & Orders](by-topic/trading-orders.md) | [L285994](../../../ScriptDB/000_4_CreateSP.sql#L285994) | — | 2 / 0 | — |
| `UBCompTrxStatusClean` | [Trading & Orders](by-topic/trading-orders.md) | [L286137](../../../ScriptDB/000_4_CreateSP.sql#L286137) | — | 0 / 0 | — |
| `UBCompTrxStatusUpdate` | [Trading & Orders](by-topic/trading-orders.md) | [L286163](../../../ScriptDB/000_4_CreateSP.sql#L286163) | 1 / 1 file | 0 / 1 | [Compliance.cs:1378](../../../UBClasses/Compliance.cs#L1378) |
| `UBCompTrxStatusUpdateManual` | [Trading & Orders](by-topic/trading-orders.md) | [L286184](../../../ScriptDB/000_4_CreateSP.sql#L286184) | — | 0 / 1 | — |
| `UBCompTrxStatusUpdateOne` | [Trading & Orders](by-topic/trading-orders.md) | [L286228](../../../ScriptDB/000_4_CreateSP.sql#L286228) | — | 3 / 4 | — |
| `UBCompTrxStatusUpdateOneManual` | [Trading & Orders](by-topic/trading-orders.md) | [L286644](../../../ScriptDB/000_4_CreateSP.sql#L286644) | — | 1 / 0 | — |
| `UBCompTrxStatusUpdateOneX` | [Trading & Orders](by-topic/trading-orders.md) | [L286755](../../../ScriptDB/000_4_CreateSP.sql#L286755) | — | 2 / 2 | — |
| `UBCompTrxStatusUpdateOneXOne` | [Trading & Orders](by-topic/trading-orders.md) | [L286817](../../../ScriptDB/000_4_CreateSP.sql#L286817) | — | 1 / 3 | — |
| `UBCompTrxStatusUpdateXXX2` | [Trading & Orders](by-topic/trading-orders.md) | [L287211](../../../ScriptDB/000_4_CreateSP.sql#L287211) | — | 1 / 0 | — |
| `UBCompTrxStatusUpdateXXXList` | [Trading & Orders](by-topic/trading-orders.md) | [L287289](../../../ScriptDB/000_4_CreateSP.sql#L287289) | — | 0 / 1 | — |
| `UBCompTrxSuitabilityApproveAll` | [Compliance](by-topic/compliance.md) | [L287325](../../../ScriptDB/000_4_CreateSP.sql#L287325) | 1 / 1 file | 0 / 1 | [Compliance.cs:988](../../../UBClasses/Compliance.cs#L988) |
| `UBCompTrxSuitabilityApproveAllX` | [Compliance](by-topic/compliance.md) | [L287699](../../../ScriptDB/000_4_CreateSP.sql#L287699) | 1 / 1 file | 0 / 1 | [Compliance.cs:1109](../../../UBClasses/Compliance.cs#L1109) |
| `UBCompTrxSuitabilityCheckOrder` | [Compliance](by-topic/compliance.md) | [L288085](../../../ScriptDB/000_4_CreateSP.sql#L288085) | — | 0 / 2 | — |
| `UBCompTrxSuitabilityCheckTrx` | [Compliance](by-topic/compliance.md) | [L288499](../../../ScriptDB/000_4_CreateSP.sql#L288499) | — | 1 / 2 | — |
| `UBCompTrxSuitabilityCheckTrx4Update` | [Compliance](by-topic/compliance.md) | [L288962](../../../ScriptDB/000_4_CreateSP.sql#L288962) | — | 4 / 1 | — |
| `UBCompTrxSuitabilityComboList` | [Compliance](by-topic/compliance.md) | [L289369](../../../ScriptDB/000_4_CreateSP.sql#L289369) | — | 0 / 5 | — |
| `UBCompTrxSuitabilityCount` | [Compliance](by-topic/compliance.md) | [L289397](../../../ScriptDB/000_4_CreateSP.sql#L289397) | — | 1 / 0 | — |
| `UBCompTrxSuitabilityDetail` | [Compliance](by-topic/compliance.md) | [L289551](../../../ScriptDB/000_4_CreateSP.sql#L289551) | 1 / 1 file | 0 / 5 | [Compliance.cs:1225](../../../UBClasses/Compliance.cs#L1225) |
| `UBCompTrxSuitabilityListByPlan` | [Compliance](by-topic/compliance.md) | [L289733](../../../ScriptDB/000_4_CreateSP.sql#L289733) | 1 / 1 file | 0 / 3 | [Compliance.cs:636](../../../UBClasses/Compliance.cs#L636) |
| `UBCompTrxSuitabilityPendingCount` | [Compliance](by-topic/compliance.md) | [L291247](../../../ScriptDB/000_4_CreateSP.sql#L291247) | 1 / 1 file | 0 / 0 | [Compliance.cs:874](../../../UBClasses/Compliance.cs#L874) |
| `UBCompTrxSuitabilitySearchCriteriaSave` | [Compliance](by-topic/compliance.md) | [L291572](../../../ScriptDB/000_4_CreateSP.sql#L291572) | — | 1 / 1 | — |
| `UBCompTrxSuitabilitySummary` | [Compliance](by-topic/compliance.md) | [L291871](../../../ScriptDB/000_4_CreateSP.sql#L291871) | 1 / 1 file | 0 / 0 | [Compliance.cs:766](../../../UBClasses/Compliance.cs#L766) |
| `UBCompTrxTrendRecalc` | [Trading & Orders](by-topic/trading-orders.md) | [L292547](../../../ScriptDB/000_4_CreateSP.sql#L292547) | — | 3 / 0 | — |
| `UBCompTrxTypeAdd` | [Trading & Orders](by-topic/trading-orders.md) | [L292703](../../../ScriptDB/000_4_CreateSP.sql#L292703) | 1 / 1 file | 0 / 0 | [PanelCompTrxTypeSel.aspx.cs:48](../../../WebApp/Main/PanelCompTrxTypeSel.aspx.cs#L48) |
| `UBCompTrxTypeRemove` | [Trading & Orders](by-topic/trading-orders.md) | [L292735](../../../ScriptDB/000_4_CreateSP.sql#L292735) | 1 / 1 file | 0 / 0 | [PopupSetupCompliance.aspx.cs:359](../../../WebApp/Main/PopupSetupCompliance.aspx.cs#L359) |
| `UBCompTrxUpdateClientInfo` | [Client & KYC](by-topic/client-kyc.md) | [L292773](../../../ScriptDB/000_4_CreateSP.sql#L292773) | — | 1 / 1 | — |
| `UBCompTrxUpdatePlanInfo` | [Account & Plan](by-topic/account-plan.md) | [L292932](../../../ScriptDB/000_4_CreateSP.sql#L292932) | — | 2 / 2 | — |
| `UBContactPrefMethod` | [Shared / Other](by-topic/shared-other.md) | [L293010](../../../ScriptDB/000_4_CreateSP.sql#L293010) | — | 1 / 0 | — |
| `UBContactPrefTimeList` | [Shared / Other](by-topic/shared-other.md) | [L293040](../../../ScriptDB/000_4_CreateSP.sql#L293040) | — | 1 / 0 | — |
| `UBContributionReceiptList` | [Shared / Other](by-topic/shared-other.md) | [L293070](../../../ScriptDB/000_4_CreateSP.sql#L293070) | — | 2 / 0 | — |
| `UBConversionBulkBasketDetails` | [Trading & Orders](by-topic/trading-orders.md) | [L293095](../../../ScriptDB/000_4_CreateSP.sql#L293095) | 1 / 1 file | 0 / 0 | [BulkSwitchBasket.cs:1584](../../../UBClasses/BulkSwitchBasket.cs#L1584) |
| `UBConversionBulkBasketInfo` | [Trading & Orders](by-topic/trading-orders.md) | [L293112](../../../ScriptDB/000_4_CreateSP.sql#L293112) | 1 / 1 file | 0 / 0 | [BulkSwitchBasket.cs:1534](../../../UBClasses/BulkSwitchBasket.cs#L1534) |
| `UBConversionBulkBasketList` | [Trading & Orders](by-topic/trading-orders.md) | [L293222](../../../ScriptDB/000_4_CreateSP.sql#L293222) | 1 / 1 file | 0 / 3 | [BulkSwitchBasket.cs:1465](../../../UBClasses/BulkSwitchBasket.cs#L1465) |
| `UBConversionBulkBasketListSummary` | [Trading & Orders](by-topic/trading-orders.md) | [L293541](../../../ScriptDB/000_4_CreateSP.sql#L293541) | 1 / 1 file | 0 / 0 | [BulkSwitchBasket.cs:653](../../../UBClasses/BulkSwitchBasket.cs#L653) |
| `UBConversionBulkBasketProcess` | [Trading & Orders](by-topic/trading-orders.md) | [L293589](../../../ScriptDB/000_4_CreateSP.sql#L293589) | 1 / 1 file | 0 / 1 | [BulkSwitchBasket.cs:1021](../../../UBClasses/BulkSwitchBasket.cs#L1021) |
| `UBConversionBulkBasketProcessOne` | [Trading & Orders](by-topic/trading-orders.md) | [L293667](../../../ScriptDB/000_4_CreateSP.sql#L293667) | — | 1 / 6 | — |
| `UBConversionBulkBasketRemove` | [Trading & Orders](by-topic/trading-orders.md) | [L294043](../../../ScriptDB/000_4_CreateSP.sql#L294043) | 1 / 1 file | 0 / 0 | [BulkSwitchBasket.cs:885](../../../UBClasses/BulkSwitchBasket.cs#L885) |
| `UBConversionBulkBasketSelectionUpdate` | [Trading & Orders](by-topic/trading-orders.md) | [L294082](../../../ScriptDB/000_4_CreateSP.sql#L294082) | — | 0 / 0 | — |
| `UBConversionBulkBasketTaggedList` | [Trading & Orders](by-topic/trading-orders.md) | [L294130](../../../ScriptDB/000_4_CreateSP.sql#L294130) | 1 / 1 file | 0 / 0 | [BulkSwitchBasket.cs:1112](../../../UBClasses/BulkSwitchBasket.cs#L1112) |
| `UBConversionProcessManualOne` | [Trading & Orders](by-topic/trading-orders.md) | [L294155](../../../ScriptDB/000_4_CreateSP.sql#L294155) | — | 0 / 1 | — |
| `UBCountryAdd` | [Shared / Other](by-topic/shared-other.md) | [L294190](../../../ScriptDB/000_4_CreateSP.sql#L294190) | 1 / 1 file | 0 / 0 | [Country.cs:273](../../../UBClasses/Country.cs#L273) |
| `UBCountryList` | [Shared / Other](by-topic/shared-other.md) | [L294238](../../../ScriptDB/000_4_CreateSP.sql#L294238) | 1 / 1 file | 0 / 0 | [Country.cs:165](../../../UBClasses/Country.cs#L165) |
| `UBCountryRemove` | [Shared / Other](by-topic/shared-other.md) | [L294296](../../../ScriptDB/000_4_CreateSP.sql#L294296) | 1 / 1 file | 0 / 0 | [Country.cs:335](../../../UBClasses/Country.cs#L335) |
| `UBCountryUpdate` | [Shared / Other](by-topic/shared-other.md) | [L294344](../../../ScriptDB/000_4_CreateSP.sql#L294344) | 1 / 1 file | 0 / 0 | [Country.cs:273](../../../UBClasses/Country.cs#L273) |
| `UBCRAFileList` | [Tax & Year-End](by-topic/tax-yearend.md) | [L294395](../../../ScriptDB/000_4_CreateSP.sql#L294395) | — | 18 / 0 | — |
| `UBCRASubmissionUpdate` | [Tax & Year-End](by-topic/tax-yearend.md) | [L294462](../../../ScriptDB/000_4_CreateSP.sql#L294462) | 1 / 1 file | 0 / 0 | [T619.cs:95](../../../UBClasses/T619.cs#L95) |
| `UBCRSClassList` | [Shared / Other](by-topic/shared-other.md) | [L294726](../../../ScriptDB/000_4_CreateSP.sql#L294726) | — | 1 / 0 | — |
| `UBCurrencyAdd` | [Shared / Other](by-topic/shared-other.md) | [L294763](../../../ScriptDB/000_4_CreateSP.sql#L294763) | 1 / 1 file | 0 / 0 | [Currency.cs:252](../../../UBClasses/Currency.cs#L252) |
| `UBCurrencyCodeList` | [Shared / Other](by-topic/shared-other.md) | [L294802](../../../ScriptDB/000_4_CreateSP.sql#L294802) | — | 16 / 0 | — |
| `UBCurrencyExRateImportUS` | [Shared / Other](by-topic/shared-other.md) | [L294835](../../../ScriptDB/000_4_CreateSP.sql#L294835) | 1 / 1 file | 0 / 1 | [Currency.cs:615](../../../UBClasses/Currency.cs#L615) |
| `UBCurrencyExRateInfo` | [Shared / Other](by-topic/shared-other.md) | [L294874](../../../ScriptDB/000_4_CreateSP.sql#L294874) | 1 / 1 file | 0 / 0 | [PanelExRateAdd.aspx.cs:73](../../../WebApp/Main/PanelExRateAdd.aspx.cs#L73) |
| `UBCurrencyExRateList` | [Shared / Other](by-topic/shared-other.md) | [L294899](../../../ScriptDB/000_4_CreateSP.sql#L294899) | 1 / 1 file | 0 / 0 | [Currency.cs:370](../../../UBClasses/Currency.cs#L370) |
| `UBCurrencyExRateParam` | [Shared / Other](by-topic/shared-other.md) | [L294969](../../../ScriptDB/000_4_CreateSP.sql#L294969) | 1 / 1 file | 0 / 0 | [Currency.cs:558](../../../UBClasses/Currency.cs#L558) |
| `UBcurrencyExRateRemove` | [Shared / Other](by-topic/shared-other.md) | [L295038](../../../ScriptDB/000_4_CreateSP.sql#L295038) | 1 / 1 file | 0 / 1 | [PanelExRateAdd.aspx.cs:285](../../../WebApp/Main/PanelExRateAdd.aspx.cs#L285) |
| `UBcurrencyExRateUpdate` | [Shared / Other](by-topic/shared-other.md) | [L295074](../../../ScriptDB/000_4_CreateSP.sql#L295074) | 1 / 1 file | 2 / 1 | [PanelExRateAdd.aspx.cs:173](../../../WebApp/Main/PanelExRateAdd.aspx.cs#L173) |
| `UBCurrencyList` | [Shared / Other](by-topic/shared-other.md) | [L295130](../../../ScriptDB/000_4_CreateSP.sql#L295130) | 1 / 1 file | 0 / 0 | [Currency.cs:147](../../../UBClasses/Currency.cs#L147) |
| `UBCurrencyRemove` | [Shared / Other](by-topic/shared-other.md) | [L295166](../../../ScriptDB/000_4_CreateSP.sql#L295166) | 1 / 1 file | 0 / 0 | [Currency.cs:313](../../../UBClasses/Currency.cs#L313) |
| `UBCurrencyUpdate` | [Shared / Other](by-topic/shared-other.md) | [L295200](../../../ScriptDB/000_4_CreateSP.sql#L295200) | 1 / 1 file | 0 / 0 | [Currency.cs:252](../../../UBClasses/Currency.cs#L252) |
| `UBCustomerBankAccountTMPEnd` | [Account & Plan](by-topic/account-plan.md) | [L295244](../../../ScriptDB/000_4_CreateSP.sql#L295244) | — | 1 / 0 | — |
| `UBCustomerBankAccountUpdate` | [Account & Plan](by-topic/account-plan.md) | [L295276](../../../ScriptDB/000_4_CreateSP.sql#L295276) | — | 0 / 0 | — |
| `UBCustomerCompanyInfoTMPEnd` | [Client & KYC](by-topic/client-kyc.md) | [L295356](../../../ScriptDB/000_4_CreateSP.sql#L295356) | — | 1 / 0 | — |
| `UBCustomerIdentificationTMPEnd` | [Client & KYC](by-topic/client-kyc.md) | [L295389](../../../ScriptDB/000_4_CreateSP.sql#L295389) | — | 1 / 0 | — |
| `UBCustomerListWithEmail` | [Client & KYC](by-topic/client-kyc.md) | [L295418](../../../ScriptDB/000_4_CreateSP.sql#L295418) | 1 / 1 file | 0 / 0 | [Customer.cs:5074](../../../UBClasses/Customer.cs#L5074) |
| `UBCustomerPlanTMPEnd` | [Account & Plan](by-topic/account-plan.md) | [L295448](../../../ScriptDB/000_4_CreateSP.sql#L295448) | — | 1 / 0 | — |
| `UBCustomerQuestionairTMPEnd` | [Client & KYC](by-topic/client-kyc.md) | [L295473](../../../ScriptDB/000_4_CreateSP.sql#L295473) | — | 1 / 0 | — |
| `UBCustomerRepPlanAdd` | [Account & Plan](by-topic/account-plan.md) | [L295505](../../../ScriptDB/000_4_CreateSP.sql#L295505) | — | 19 / 0 | — |
| `UBCustomerRepRefresh` | [Client & KYC](by-topic/client-kyc.md) | [L295545](../../../ScriptDB/000_4_CreateSP.sql#L295545) | — | 6 / 0 | — |
| `UBCustomerTotalAsset` | [Client & KYC](by-topic/client-kyc.md) | [L295647](../../../ScriptDB/000_4_CreateSP.sql#L295647) | 1 / 1 file | 0 / 0 | [Customer.cs:5176](../../../UBClasses/Customer.cs#L5176) |
| `UBCustomerUserDefTMPEnd` | [Client & KYC](by-topic/client-kyc.md) | [L295682](../../../ScriptDB/000_4_CreateSP.sql#L295682) | — | 1 / 0 | — |
| `UBDailyGICMaturity` | [Fund & GIC](by-topic/fund-gic.md) | [L295713](../../../ScriptDB/000_4_CreateSP.sql#L295713) | — | 2 / 0 | — |
| `UBDailyMaturityGetCount` | [Shared / Other](by-topic/shared-other.md) | [L295765](../../../ScriptDB/000_4_CreateSP.sql#L295765) | 1 / 1 file | 0 / 2 | [FundAccount.cs:2432](../../../UBClasses/FundAccount.cs#L2432) |
| `UBDailyMaturitySet` | [Shared / Other](by-topic/shared-other.md) | [L295825](../../../ScriptDB/000_4_CreateSP.sql#L295825) | — | 0 / 2 | — |
| `UBDailyMaturityStartupOpt` | [Shared / Other](by-topic/shared-other.md) | [L295990](../../../ScriptDB/000_4_CreateSP.sql#L295990) | 1 / 1 file | 0 / 0 | [Member.cs:3680](../../../UBClasses/Member.cs#L3680) |
| `UBDailySegFundMaturity` | [Fund & GIC](by-topic/fund-gic.md) | [L296021](../../../ScriptDB/000_4_CreateSP.sql#L296021) | — | 0 / 0 | — |
| `UBDashBoardAsset10Plan` | [Account & Plan](by-topic/account-plan.md) | [L296064](../../../ScriptDB/000_4_CreateSP.sql#L296064) | — | 1 / 1 | — |
| `UBDashBoardAssetAccInfo` | [Shared / Other](by-topic/shared-other.md) | [L296144](../../../ScriptDB/000_4_CreateSP.sql#L296144) | 1 / 1 file | 0 / 0 | [Dashboard.cs:926](../../../UBClasses/Dashboard.cs#L926) |
| `UBDashBoardAssetAccountByFundBranchGet` | [Fund & GIC](by-topic/fund-gic.md) | [L296172](../../../ScriptDB/000_4_CreateSP.sql#L296172) | 1 / 1 file | 0 / 0 | [Dashboard.cs:1417](../../../UBClasses/Dashboard.cs#L1417) |
| `UBDashBoardAssetAccountByFundGet` | [Fund & GIC](by-topic/fund-gic.md) | [L296361](../../../ScriptDB/000_4_CreateSP.sql#L296361) | 1 / 1 file | 0 / 0 | [Dashboard.cs:1290](../../../UBClasses/Dashboard.cs#L1290) |
| `UBDashBoardAssetAccountByFundRepGet` | [Fund & GIC](by-topic/fund-gic.md) | [L296703](../../../ScriptDB/000_4_CreateSP.sql#L296703) | 1 / 1 file | 0 / 0 | [Dashboard.cs:1354](../../../UBClasses/Dashboard.cs#L1354) |
| `UBDashBoardAssetAccountBySupplierBranchGet` | [Account & Plan](by-topic/account-plan.md) | [L296904](../../../ScriptDB/000_4_CreateSP.sql#L296904) | 1 / 1 file | 0 / 0 | [Dashboard.cs:1102](../../../UBClasses/Dashboard.cs#L1102) |
| `UBDashBoardAssetAccountBySupplierClientGet` | [Account & Plan](by-topic/account-plan.md) | [L297091](../../../ScriptDB/000_4_CreateSP.sql#L297091) | 1 / 1 file | 0 / 0 | [Dashboard.cs:1164](../../../UBClasses/Dashboard.cs#L1164) |
| `UBDashBoardAssetAccountBySupplierGet` | [Account & Plan](by-topic/account-plan.md) | [L297279](../../../ScriptDB/000_4_CreateSP.sql#L297279) | 1 / 1 file | 0 / 0 | [Dashboard.cs:978](../../../UBClasses/Dashboard.cs#L978) |
| `UBDashBoardAssetAccountBySupplierRepGet` | [Account & Plan](by-topic/account-plan.md) | [L297839](../../../ScriptDB/000_4_CreateSP.sql#L297839) | 1 / 1 file | 0 / 0 | [Dashboard.cs:1040](../../../UBClasses/Dashboard.cs#L1040) |
| `UBDashBoardAssetAccountOneCategoryGet` | [Account & Plan](by-topic/account-plan.md) | [L298023](../../../ScriptDB/000_4_CreateSP.sql#L298023) | 1 / 1 file | 0 / 0 | [Dashboard.cs:754](../../../UBClasses/Dashboard.cs#L754) |
| `UBDashBoardAssetAccountOneCategoryGetX` | [Account & Plan](by-topic/account-plan.md) | [L298046](../../../ScriptDB/000_4_CreateSP.sql#L298046) | — | 1 / 0 | — |
| `UBDashBoardAssetAccountOneSupplierClientGet` | [Account & Plan](by-topic/account-plan.md) | [L298551](../../../ScriptDB/000_4_CreateSP.sql#L298551) | 1 / 1 file | 0 / 0 | [Dashboard.cs:1226](../../../UBClasses/Dashboard.cs#L1226) |
| `UBDashBoardAssetAccountSumCalc1Rep` | [Account & Plan](by-topic/account-plan.md) | [L298743](../../../ScriptDB/000_4_CreateSP.sql#L298743) | — | 4 / 0 | — |
| `UBDashBoardAssetAccountSumFix` | [Account & Plan](by-topic/account-plan.md) | [L298956](../../../ScriptDB/000_4_CreateSP.sql#L298956) | — | 1 / 1 | — |
| `UBDashBoardAssetAdd` | [Shared / Other](by-topic/shared-other.md) | [L299018](../../../ScriptDB/000_4_CreateSP.sql#L299018) | 1 / 1 file | 0 / 2 | [Dashboard.cs:37](../../../UBClasses/Dashboard.cs#L37) |
| `UBDashBoardAssetByDealerCode` | [Shared / Other](by-topic/shared-other.md) | [L299087](../../../ScriptDB/000_4_CreateSP.sql#L299087) | 1 / 1 file | 0 / 1 | [Dashboard.cs:2509](../../../UBClasses/Dashboard.cs#L2509) |
| `UBDashBoardAssetByRepCode` | [Shared / Other](by-topic/shared-other.md) | [L299234](../../../ScriptDB/000_4_CreateSP.sql#L299234) | 1 / 1 file | 0 / 1 | [Dashboard.cs:2330](../../../UBClasses/Dashboard.cs#L2330) |
| `UBDashBoardAssetByRepCodeAndType` | [Shared / Other](by-topic/shared-other.md) | [L299624](../../../ScriptDB/000_4_CreateSP.sql#L299624) | 1 / 1 file | 0 / 1 | [Dashboard.cs:2428](../../../UBClasses/Dashboard.cs#L2428) |
| `UBDashBoardAssetCalc` | [Shared / Other](by-topic/shared-other.md) | [L299822](../../../ScriptDB/000_4_CreateSP.sql#L299822) | 1 / 1 file | 0 / 2 | [DashBoard.cs:128](../../../VieFUNDPdf/DashBoard.cs#L128) |
| `UBDashBoardAssetCalc10` | [Shared / Other](by-topic/shared-other.md) | [L299916](../../../ScriptDB/000_4_CreateSP.sql#L299916) | — | 0 / 1 | — |
| `UBDashBoardAssetCalcEnd` | [Shared / Other](by-topic/shared-other.md) | [L300067](../../../ScriptDB/000_4_CreateSP.sql#L300067) | 1 / 1 file | 0 / 0 | [DashBoard.cs:143](../../../VieFUNDPdf/DashBoard.cs#L143) |
| `UBDashBoardAssetClientOneCategoryGet` | [Client & KYC](by-topic/client-kyc.md) | [L300095](../../../ScriptDB/000_4_CreateSP.sql#L300095) | 1 / 1 file | 0 / 1 | [Dashboard.cs:506](../../../UBClasses/Dashboard.cs#L506) |
| `UBDashBoardAssetClientOneCategoryGetWithPlan` | [Account & Plan](by-topic/account-plan.md) | [L300121](../../../ScriptDB/000_4_CreateSP.sql#L300121) | — | 0 / 1 | — |
| `UBDashBoardAssetClientOneCategoryGetX` | [Client & KYC](by-topic/client-kyc.md) | [L300146](../../../ScriptDB/000_4_CreateSP.sql#L300146) | — | 2 / 0 | — |
| `UBDashBoardAssetClientOneCategoryGetXWithPlan` | [Account & Plan](by-topic/account-plan.md) | [L300413](../../../ScriptDB/000_4_CreateSP.sql#L300413) | — | 1 / 0 | — |
| `UBDashBoardAssetFamilyOneCategoryGet` | [Fund & GIC](by-topic/fund-gic.md) | [L300586](../../../ScriptDB/000_4_CreateSP.sql#L300586) | 1 / 1 file | 0 / 1 | [Dashboard.cs:570](../../../UBClasses/Dashboard.cs#L570) |
| `UBDashBoardAssetFamilyOneCategoryGetX` | [Fund & GIC](by-topic/fund-gic.md) | [L300610](../../../ScriptDB/000_4_CreateSP.sql#L300610) | — | 1 / 0 | — |
| `UBDashBoardAssetGet` | [Shared / Other](by-topic/shared-other.md) | [L300753](../../../ScriptDB/000_4_CreateSP.sql#L300753) | 1 / 1 file | 0 / 0 | [Dashboard.cs:248](../../../UBClasses/Dashboard.cs#L248) |
| `UBDashBoardAssetGet_ByProvince` | [Shared / Other](by-topic/shared-other.md) | [L301346](../../../ScriptDB/000_4_CreateSP.sql#L301346) | — | 0 / 0 | — |
| `UBDashBoardAssetGet_Client` | [Client & KYC](by-topic/client-kyc.md) | [L301471](../../../ScriptDB/000_4_CreateSP.sql#L301471) | — | 0 / 1 | — |
| `UBDashBoardAssetGet_ClientX` | [Client & KYC](by-topic/client-kyc.md) | [L301495](../../../ScriptDB/000_4_CreateSP.sql#L301495) | — | 2 / 0 | — |
| `UBDashBoardAssetGet_Family` | [Client & KYC](by-topic/client-kyc.md) | [L301628](../../../ScriptDB/000_4_CreateSP.sql#L301628) | — | 0 / 1 | — |
| `UBDashBoardAssetGet_FamilyX` | [Client & KYC](by-topic/client-kyc.md) | [L301652](../../../ScriptDB/000_4_CreateSP.sql#L301652) | — | 1 / 0 | — |
| `UBDashBoardAssetGet_HoldingStats` | [Shared / Other](by-topic/shared-other.md) | [L301762](../../../ScriptDB/000_4_CreateSP.sql#L301762) | 1 / 1 file | 0 / 0 | [Dashboard.cs:2804](../../../UBClasses/Dashboard.cs#L2804) |
| `UBDashBoardAssetGet_Plan` | [Account & Plan](by-topic/account-plan.md) | [L302087](../../../ScriptDB/000_4_CreateSP.sql#L302087) | 1 / 1 file | 0 / 1 | [Dashboard.cs:2941](../../../UBClasses/Dashboard.cs#L2941) |
| `UBDashBoardAssetGet_PlanType` | [Account & Plan](by-topic/account-plan.md) | [L302110](../../../ScriptDB/000_4_CreateSP.sql#L302110) | — | 0 / 1 | — |
| `UBDashBoardAssetGet_PlanType_Old` | [Account & Plan](by-topic/account-plan.md) | [L302133](../../../ScriptDB/000_4_CreateSP.sql#L302133) | — | 0 / 0 | — |
| `UBDashBoardAssetGet_PlanTypeX` | [Account & Plan](by-topic/account-plan.md) | [L302333](../../../ScriptDB/000_4_CreateSP.sql#L302333) | — | 2 / 1 | — |
| `UBDashBoardAssetGet_PlanX` | [Account & Plan](by-topic/account-plan.md) | [L302593](../../../ScriptDB/000_4_CreateSP.sql#L302593) | — | 1 / 0 | — |
| `UBDashBoardAssetGet_Product` | [Fund & GIC](by-topic/fund-gic.md) | [L302944](../../../ScriptDB/000_4_CreateSP.sql#L302944) | — | 0 / 1 | — |
| `UBDashBoardAssetGet_Product_Old` | [Fund & GIC](by-topic/fund-gic.md) | [L302969](../../../ScriptDB/000_4_CreateSP.sql#L302969) | — | 0 / 0 | — |
| `UBDashBoardAssetGet_ProductX` | [Fund & GIC](by-topic/fund-gic.md) | [L303233](../../../ScriptDB/000_4_CreateSP.sql#L303233) | — | 2 / 2 | — |
| `UBDashBoardAssetInfo` | [Shared / Other](by-topic/shared-other.md) | [L303605](../../../ScriptDB/000_4_CreateSP.sql#L303605) | 1 / 1 file | 0 / 1 | [Dashboard.cs:139](../../../UBClasses/Dashboard.cs#L139) |
| `UBDashBoardAssetInit` | [Shared / Other](by-topic/shared-other.md) | [L303661](../../../ScriptDB/000_4_CreateSP.sql#L303661) | 1 / 1 file | 0 / 0 | [DashBoard.cs:177](../../../VieFUNDPdf/DashBoard.cs#L177) |
| `UBDashBoardAssetList` | [Shared / Other](by-topic/shared-other.md) | [L303725](../../../ScriptDB/000_4_CreateSP.sql#L303725) | 1 / 1 file | 0 / 1 | [Dashboard.cs:194](../../../UBClasses/Dashboard.cs#L194) |
| `UBDashBoardAssetOneCashAccount` | [Account & Plan](by-topic/account-plan.md) | [L303847](../../../ScriptDB/000_4_CreateSP.sql#L303847) | — | 1 / 0 | — |
| `UBDashBoardAssetOneFundAccount` | [Fund & GIC](by-topic/fund-gic.md) | [L303981](../../../ScriptDB/000_4_CreateSP.sql#L303981) | — | 1 / 1 | — |
| `UBDashBoardAssetOneGICAccount` | [Fund & GIC](by-topic/fund-gic.md) | [L304128](../../../ScriptDB/000_4_CreateSP.sql#L304128) | — | 1 / 1 | — |
| `UBDashBoardAssetOnePlan` | [Account & Plan](by-topic/account-plan.md) | [L304235](../../../ScriptDB/000_4_CreateSP.sql#L304235) | — | 3 / 3 | — |
| `UBDashBoardAssetPlanOneCategoryGet` | [Account & Plan](by-topic/account-plan.md) | [L304419](../../../ScriptDB/000_4_CreateSP.sql#L304419) | 1 / 1 file | 0 / 1 | [Dashboard.cs:672](../../../UBClasses/Dashboard.cs#L672) |
| `UBDashBoardAssetPlanOneCategoryGetX` | [Account & Plan](by-topic/account-plan.md) | [L304442](../../../ScriptDB/000_4_CreateSP.sql#L304442) | — | 2 / 0 | — |
| `UBDashBoardAssetPlanSumCalc1Rep` | [Account & Plan](by-topic/account-plan.md) | [L304731](../../../ScriptDB/000_4_CreateSP.sql#L304731) | — | 1 / 0 | — |
| `UBDashBoardAssetProvOneCategoryGet` | [Shared / Other](by-topic/shared-other.md) | [L304771](../../../ScriptDB/000_4_CreateSP.sql#L304771) | 1 / 1 file | 0 / 0 | [Dashboard.cs:2590](../../../UBClasses/Dashboard.cs#L2590) |
| `UBDashBoardAssetProvOneCategoryGroupByProdTypeGet` | [Shared / Other](by-topic/shared-other.md) | [L304945](../../../ScriptDB/000_4_CreateSP.sql#L304945) | 1 / 1 file | 0 / 0 | [Dashboard.cs:2654](../../../UBClasses/Dashboard.cs#L2654) |
| `UBDashBoardAssetRemove` | [Shared / Other](by-topic/shared-other.md) | [L305018](../../../ScriptDB/000_4_CreateSP.sql#L305018) | 1 / 1 file | 0 / 0 | [Dashboard.cs:92](../../../UBClasses/Dashboard.cs#L92) |
| `UBDashBoardAssetSystemStep1` | [Shared / Other](by-topic/shared-other.md) | [L305082](../../../ScriptDB/000_4_CreateSP.sql#L305082) | — | 0 / 0 | — |
| `UBDashBoardAssetSystemStep2` | [Shared / Other](by-topic/shared-other.md) | [L305223](../../../ScriptDB/000_4_CreateSP.sql#L305223) | — | 1 / 2 | — |
| `UBDashBoardAssetSystemStep3` | [Shared / Other](by-topic/shared-other.md) | [L305379](../../../ScriptDB/000_4_CreateSP.sql#L305379) | — | 0 / 1 | — |
| `UBDashBoardClientCreatedDateGet` | [Client & KYC](by-topic/client-kyc.md) | [L305423](../../../ScriptDB/000_4_CreateSP.sql#L305423) | 1 / 1 file | 0 / 0 | [Dashboard.cs:1704](../../../UBClasses/Dashboard.cs#L1704) |
| `UBDashBoardClientExtTransferfGet` | [Client & KYC](by-topic/client-kyc.md) | [L305571](../../../ScriptDB/000_4_CreateSP.sql#L305571) | — | 0 / 0 | — |
| `UBDashBoardClientMobilityExemption` | [Client & KYC](by-topic/client-kyc.md) | [L305689](../../../ScriptDB/000_4_CreateSP.sql#L305689) | 1 / 1 file | 0 / 0 | [Dashboard.cs:1997](../../../UBClasses/Dashboard.cs#L1997) |
| `UBDashBoardClientProvDetailGet` | [Client & KYC](by-topic/client-kyc.md) | [L305810](../../../ScriptDB/000_4_CreateSP.sql#L305810) | 1 / 1 file | 0 / 0 | [Dashboard.cs:1935](../../../UBClasses/Dashboard.cs#L1935) |
| `UBDashBoardClientProvGet` | [Client & KYC](by-topic/client-kyc.md) | [L305960](../../../ScriptDB/000_4_CreateSP.sql#L305960) | 1 / 1 file | 0 / 0 | [Dashboard.cs:1876](../../../UBClasses/Dashboard.cs#L1876) |
| `UBDashBoardClientReviewDateDetailGet` | [Client & KYC](by-topic/client-kyc.md) | [L306079](../../../ScriptDB/000_4_CreateSP.sql#L306079) | 1 / 1 file | 0 / 0 | [Dashboard.cs:1537](../../../UBClasses/Dashboard.cs#L1537) |
| `UBDashBoardClientReviewDateGet` | [Client & KYC](by-topic/client-kyc.md) | [L306340](../../../ScriptDB/000_4_CreateSP.sql#L306340) | 1 / 1 file | 0 / 0 | [Dashboard.cs:388](../../../UBClasses/Dashboard.cs#L388) |
| `UBDashBoardClientXInGet` | [Client & KYC](by-topic/client-kyc.md) | [L306562](../../../ScriptDB/000_4_CreateSP.sql#L306562) | 1 / 1 file | 0 / 0 | [Dashboard.cs:2244](../../../UBClasses/Dashboard.cs#L2244) |
| `UBDashBoardClientXOutGet` | [Client & KYC](by-topic/client-kyc.md) | [L306709](../../../ScriptDB/000_4_CreateSP.sql#L306709) | 1 / 1 file | 0 / 0 | [Dashboard.cs:2128](../../../UBClasses/Dashboard.cs#L2128) |
| `UBDashBoardPlanCreatedDateGet` | [Account & Plan](by-topic/account-plan.md) | [L306865](../../../ScriptDB/000_4_CreateSP.sql#L306865) | 1 / 1 file | 0 / 0 | [Dashboard.cs:1771](../../../UBClasses/Dashboard.cs#L1771) |
| `UBDashBoardPlanReviewDateDetailGet` | [Account & Plan](by-topic/account-plan.md) | [L307012](../../../ScriptDB/000_4_CreateSP.sql#L307012) | 1 / 1 file | 0 / 0 | [Dashboard.cs:1621](../../../UBClasses/Dashboard.cs#L1621) |
| `UBDashBoardPlanReviewDateGet` | [Account & Plan](by-topic/account-plan.md) | [L307349](../../../ScriptDB/000_4_CreateSP.sql#L307349) | 1 / 1 file | 0 / 0 | [Dashboard.cs:446](../../../UBClasses/Dashboard.cs#L446) |
| `UBDealerBAccountAdd` | [Account & Plan](by-topic/account-plan.md) | [L307742](../../../ScriptDB/000_4_CreateSP.sql#L307742) | 1 / 1 file | 1 / 1 | [BankAccount.cs:906](../../../UBClasses/BankAccount.cs#L906) |
| `UBDealerBAccountCommission` | [Commission & Fee](by-topic/commission-fee.md) | [L307814](../../../ScriptDB/000_4_CreateSP.sql#L307814) | 1 / 1 file | 0 / 1 | [BankAccount.cs:640](../../../UBClasses/BankAccount.cs#L640) |
| `UBDealerBAccountList` | [Account & Plan](by-topic/account-plan.md) | [L307838](../../../ScriptDB/000_4_CreateSP.sql#L307838) | 3 / 1 file | 1 / 0 | [BankAccount.cs:75](../../../UBClasses/BankAccount.cs#L75) |
| `UBDealerBAccountRemove` | [Account & Plan](by-topic/account-plan.md) | [L308109](../../../ScriptDB/000_4_CreateSP.sql#L308109) | 1 / 1 file | 0 / 0 | [BankAccount.cs:989](../../../UBClasses/BankAccount.cs#L989) |
| `UBDealerBAccountSet` | [Account & Plan](by-topic/account-plan.md) | [L308153](../../../ScriptDB/000_4_CreateSP.sql#L308153) | 1 / 1 file | 2 / 0 | [BankAccount.cs:731](../../../UBClasses/BankAccount.cs#L731) |
| `UBDealerBAccountSetEFTSequence` | [Account & Plan](by-topic/account-plan.md) | [L308277](../../../ScriptDB/000_4_CreateSP.sql#L308277) | — | 3 / 0 | — |
| `UBDealerBAccountSupplier` | [Account & Plan](by-topic/account-plan.md) | [L308311](../../../ScriptDB/000_4_CreateSP.sql#L308311) | 1 / 1 file | 0 / 1 | [BankAccount.cs:685](../../../UBClasses/BankAccount.cs#L685) |
| `UBDealerBAccountUpdate` | [Account & Plan](by-topic/account-plan.md) | [L308326](../../../ScriptDB/000_4_CreateSP.sql#L308326) | 1 / 1 file | 0 / 1 | [BankAccount.cs:906](../../../UBClasses/BankAccount.cs#L906) |
| `UBDealerBranchAdd` | [Shared / Other](by-topic/shared-other.md) | [L308395](../../../ScriptDB/000_4_CreateSP.sql#L308395) | 1 / 1 file | 3 / 2 | [DealerBranch.cs:421](../../../UBClasses/DealerBranch.cs#L421) |
| `UBDealerBranchGet` | [Shared / Other](by-topic/shared-other.md) | [L308455](../../../ScriptDB/000_4_CreateSP.sql#L308455) | — | 24 / 2 | — |
| `UBDealerBranchList` | [Shared / Other](by-topic/shared-other.md) | [L308505](../../../ScriptDB/000_4_CreateSP.sql#L308505) | 2 / 1 file | 0 / 1 | [DealerBranch.cs:251](../../../UBClasses/DealerBranch.cs#L251) |
| `UBDealerBranchRemove` | [Shared / Other](by-topic/shared-other.md) | [L308645](../../../ScriptDB/000_4_CreateSP.sql#L308645) | 1 / 1 file | 0 / 0 | [DealerBranch.cs:504](../../../UBClasses/DealerBranch.cs#L504) |
| `UBDealerBranchUpdate` | [Shared / Other](by-topic/shared-other.md) | [L308705](../../../ScriptDB/000_4_CreateSP.sql#L308705) | 1 / 1 file | 0 / 4 | [DealerBranch.cs:421](../../../UBClasses/DealerBranch.cs#L421) |
| `UBDealerCodeFromList` | [Shared / Other](by-topic/shared-other.md) | [L308783](../../../ScriptDB/000_4_CreateSP.sql#L308783) | 1 / 1 file | 1 / 0 | [Dealer.cs:467](../../../UBClasses/Dealer.cs#L467) |
| `UBDealerCodeInfo` | [Shared / Other](by-topic/shared-other.md) | [L308835](../../../ScriptDB/000_4_CreateSP.sql#L308835) | 1 / 1 file | 0 / 1 | [Dealer.cs:524](../../../UBClasses/Dealer.cs#L524) |
| `UBDealerCodeInfoX` | [Shared / Other](by-topic/shared-other.md) | [L308940](../../../ScriptDB/000_4_CreateSP.sql#L308940) | 1 / 1 file | 0 / 0 | [Dealer.cs:568](../../../UBClasses/Dealer.cs#L568) |
| `UBDealerCodeList` | [Shared / Other](by-topic/shared-other.md) | [L308968](../../../ScriptDB/000_4_CreateSP.sql#L308968) | — | 24 / 0 | — |
| `UBDealerCodeList4Conf` | [Shared / Other](by-topic/shared-other.md) | [L309071](../../../ScriptDB/000_4_CreateSP.sql#L309071) | — | 1 / 0 | — |
| `UBDealerCodeList4QFix` | [Shared / Other](by-topic/shared-other.md) | [L309112](../../../ScriptDB/000_4_CreateSP.sql#L309112) | — | 3 / 0 | — |
| `UBDealerCodeListCarrying` | [Shared / Other](by-topic/shared-other.md) | [L309142](../../../ScriptDB/000_4_CreateSP.sql#L309142) | — | 0 / 0 | — |
| `UBDealerCodeListN` | [Shared / Other](by-topic/shared-other.md) | [L309166](../../../ScriptDB/000_4_CreateSP.sql#L309166) | — | 1 / 0 | — |
| `UBDealerCodeListNominee` | [Shared / Other](by-topic/shared-other.md) | [L309198](../../../ScriptDB/000_4_CreateSP.sql#L309198) | — | 7 / 0 | — |
| `UBDealerCodeListNominee4Report` | [Shared / Other](by-topic/shared-other.md) | [L309222](../../../ScriptDB/000_4_CreateSP.sql#L309222) | — | 3 / 1 | — |
| `UBDealerCodeRemove` | [Shared / Other](by-topic/shared-other.md) | [L309258](../../../ScriptDB/000_4_CreateSP.sql#L309258) | 1 / 1 file | 0 / 0 | [PanelDealerCodeAdd.aspx.cs:558](../../../WebApp/Main/PanelDealerCodeAdd.aspx.cs#L558) |
| `UBDealerCodeRT` | [Shared / Other](by-topic/shared-other.md) | [L309300](../../../ScriptDB/000_4_CreateSP.sql#L309300) | — | 2 / 0 | — |
| `UBDealerCodeUpdate` | [Shared / Other](by-topic/shared-other.md) | [L309358](../../../ScriptDB/000_4_CreateSP.sql#L309358) | 1 / 1 file | 2 / 5 | [PanelDealerCodeAdd.aspx.cs:377](../../../WebApp/Main/PanelDealerCodeAdd.aspx.cs#L377) |
| `UBDealerEmailAdd` | [Notifications](by-topic/notifications.md) | [L309532](../../../ScriptDB/000_4_CreateSP.sql#L309532) | 1 / 1 file | 0 / 0 | [Dealer.cs:712](../../../UBClasses/Dealer.cs#L712) |
| `UBDealerEmailInit` | [Notifications](by-topic/notifications.md) | [L309575](../../../ScriptDB/000_4_CreateSP.sql#L309575) | — | 2 / 0 | — |
| `UBDealerEmailList` | [Notifications](by-topic/notifications.md) | [L309604](../../../ScriptDB/000_4_CreateSP.sql#L309604) | 1 / 1 file | 0 / 1 | [Dealer.cs:665](../../../UBClasses/Dealer.cs#L665) |
| `UBDealerEmailRemove` | [Notifications](by-topic/notifications.md) | [L309633](../../../ScriptDB/000_4_CreateSP.sql#L309633) | 1 / 1 file | 0 / 0 | [Dealer.cs:883](../../../UBClasses/Dealer.cs#L883) |
| `UBDealerEmailUpdate` | [Notifications](by-topic/notifications.md) | [L309656](../../../ScriptDB/000_4_CreateSP.sql#L309656) | 1 / 1 file | 0 / 0 | [Dealer.cs:712](../../../UBClasses/Dealer.cs#L712) |
| `UBDealerHOInfo` | [Shared / Other](by-topic/shared-other.md) | [L309701](../../../ScriptDB/000_4_CreateSP.sql#L309701) | 1 / 1 file | 0 / 3 | [Dealer.cs:176](../../../UBClasses/Dealer.cs#L176) |
| `UBDealerHOUpdate` | [Shared / Other](by-topic/shared-other.md) | [L309863](../../../ScriptDB/000_4_CreateSP.sql#L309863) | 1 / 1 file | 0 / 5 | [Dealer.cs:85](../../../UBClasses/Dealer.cs#L85) |
| `UBDealerInfo1` | [Shared / Other](by-topic/shared-other.md) | [L309936](../../../ScriptDB/000_4_CreateSP.sql#L309936) | — | 5 / 0 | — |
| `UBDealerIsNewRegistrationEnable` | [Shared / Other](by-topic/shared-other.md) | [L309968](../../../ScriptDB/000_4_CreateSP.sql#L309968) | 1 / 1 file | 0 / 0 | [Dealer.cs:33](../../../UBClasses/Dealer.cs#L33) |
| `UBDealerRegionAdd` | [Shared / Other](by-topic/shared-other.md) | [L309990](../../../ScriptDB/000_4_CreateSP.sql#L309990) | 1 / 1 file | 0 / 0 | [Region.cs:186](../../../UBClasses/Region.cs#L186) |
| `UBDealerRegionList` | [Shared / Other](by-topic/shared-other.md) | [L310033](../../../ScriptDB/000_4_CreateSP.sql#L310033) | 1 / 1 file | 0 / 0 | [Region.cs:88](../../../UBClasses/Region.cs#L88) |
| `UBDealerRegionRemove` | [Shared / Other](by-topic/shared-other.md) | [L310068](../../../ScriptDB/000_4_CreateSP.sql#L310068) | 1 / 1 file | 0 / 0 | [Region.cs:245](../../../UBClasses/Region.cs#L245) |
| `UBDealerRegionUpdate` | [Shared / Other](by-topic/shared-other.md) | [L310113](../../../ScriptDB/000_4_CreateSP.sql#L310113) | 1 / 1 file | 0 / 0 | [Region.cs:186](../../../UBClasses/Region.cs#L186) |
| `UBDealershipInfo` | [Shared / Other](by-topic/shared-other.md) | [L310157](../../../ScriptDB/000_4_CreateSP.sql#L310157) | — | 66 / 2 | — |
| `UBDealershipInfoGetInt` | [Shared / Other](by-topic/shared-other.md) | [L310223](../../../ScriptDB/000_4_CreateSP.sql#L310223) | 1 / 1 file | 0 / 0 | [CBase.cs:1279](../../../UBClasses/CBase.cs#L1279) |
| `UBDealershipInfoSaveInt` | [Shared / Other](by-topic/shared-other.md) | [L310246](../../../ScriptDB/000_4_CreateSP.sql#L310246) | 1 / 1 file | 0 / 0 | [CBase.cs:1320](../../../UBClasses/CBase.cs#L1320) |
| `UBDealershipInfoX` | [Shared / Other](by-topic/shared-other.md) | [L310268](../../../ScriptDB/000_4_CreateSP.sql#L310268) | — | 23 / 2 | — |
| `UBDealerStatsList` | [Shared / Other](by-topic/shared-other.md) | [L310353](../../../ScriptDB/000_4_CreateSP.sql#L310353) | — | 0 / 0 | — |
| `UBDealerSubBranchAdd` | [Shared / Other](by-topic/shared-other.md) | [L310416](../../../ScriptDB/000_4_CreateSP.sql#L310416) | 1 / 1 file | 0 / 2 | [DealerSubBranch.cs:278](../../../UBClasses/DealerSubBranch.cs#L278) |
| `UBDealerSubBranchList` | [Shared / Other](by-topic/shared-other.md) | [L310471](../../../ScriptDB/000_4_CreateSP.sql#L310471) | 1 / 1 file | 0 / 0 | [DealerSubBranch.cs:164](../../../UBClasses/DealerSubBranch.cs#L164) |
| `UBDealerSubBranchRemove` | [Shared / Other](by-topic/shared-other.md) | [L310542](../../../ScriptDB/000_4_CreateSP.sql#L310542) | 1 / 1 file | 0 / 0 | [DealerSubBranch.cs:350](../../../UBClasses/DealerSubBranch.cs#L350) |
| `UBDealerSubBranchUpdate` | [Shared / Other](by-topic/shared-other.md) | [L310590](../../../ScriptDB/000_4_CreateSP.sql#L310590) | 1 / 1 file | 0 / 4 | [DealerSubBranch.cs:278](../../../UBClasses/DealerSubBranch.cs#L278) |
| `UBDealerTrustBAccountListByPlanID` | [Account & Plan](by-topic/account-plan.md) | [L310662](../../../ScriptDB/000_4_CreateSP.sql#L310662) | 1 / 1 file | 0 / 0 | [BankAccount.cs:420](../../../UBClasses/BankAccount.cs#L420) |
| `UBDepositTypeList` | [Shared / Other](by-topic/shared-other.md) | [L310815](../../../ScriptDB/000_4_CreateSP.sql#L310815) | — | 2 / 0 | — |
| `UBDisclaimerAdd` | [Shared / Other](by-topic/shared-other.md) | [L310847](../../../ScriptDB/000_4_CreateSP.sql#L310847) | — | 0 / 1 | — |
| `UBDisclaimerInfo` | [Shared / Other](by-topic/shared-other.md) | [L310996](../../../ScriptDB/000_4_CreateSP.sql#L310996) | 1 / 1 file | 0 / 0 | [Disclaimer.cs:94](../../../UBClasses/Disclaimer.cs#L94) |
| `UBDisclaimerList` | [Shared / Other](by-topic/shared-other.md) | [L311035](../../../ScriptDB/000_4_CreateSP.sql#L311035) | 1 / 1 file | 0 / 0 | [Disclaimer.cs:41](../../../UBClasses/Disclaimer.cs#L41) |
| `UBDisclaimerMove` | [Shared / Other](by-topic/shared-other.md) | [L311125](../../../ScriptDB/000_4_CreateSP.sql#L311125) | — | 0 / 0 | — |
| `UBDisclaimerRemove` | [Shared / Other](by-topic/shared-other.md) | [L311173](../../../ScriptDB/000_4_CreateSP.sql#L311173) | — | 0 / 0 | — |
| `UBDisclaimerSetDealerStr` | [Shared / Other](by-topic/shared-other.md) | [L311195](../../../ScriptDB/000_4_CreateSP.sql#L311195) | — | 2 / 0 | — |
| `UBDisclaimerTargetTypeList` | [Shared / Other](by-topic/shared-other.md) | [L311217](../../../ScriptDB/000_4_CreateSP.sql#L311217) | — | 1 / 0 | — |
| `UBDisclaimerUpdate` | [Shared / Other](by-topic/shared-other.md) | [L311251](../../../ScriptDB/000_4_CreateSP.sql#L311251) | — | 0 / 1 | — |
| `UBDividendList` | [Shared / Other](by-topic/shared-other.md) | [L311346](../../../ScriptDB/000_4_CreateSP.sql#L311346) | — | 2 / 0 | — |
| `UBDocAdd` | [Documents & PDF](by-topic/documents-pdf.md) | [L311377](../../../ScriptDB/000_4_CreateSP.sql#L311377) | 2 / 1 file | 2 / 2 | [Document.cs:1213](../../../UBClasses/Document.cs#L1213) |
| `UBDocAddFromFile` | [Documents & PDF](by-topic/documents-pdf.md) | [L311444](../../../ScriptDB/000_4_CreateSP.sql#L311444) | — | 0 / 0 | — |
| `UBDocAddInternal` | [Documents & PDF](by-topic/documents-pdf.md) | [L311894](../../../ScriptDB/000_4_CreateSP.sql#L311894) | — | 3 / 2 | — |
| `UBDocAddLink` | [Documents & PDF](by-topic/documents-pdf.md) | [L312049](../../../ScriptDB/000_4_CreateSP.sql#L312049) | — | 10 / 0 | — |
| `UBDocAddTaggedFundAccount` | [Fund & GIC](by-topic/fund-gic.md) | [L312182](../../../ScriptDB/000_4_CreateSP.sql#L312182) | — | 0 / 2 | — |
| `UBDocAddTaggedPlan` | [Account & Plan](by-topic/account-plan.md) | [L312313](../../../ScriptDB/000_4_CreateSP.sql#L312313) | — | 0 / 2 | — |
| `UBDocAddTaggedTrx` | [Trading & Orders](by-topic/trading-orders.md) | [L312440](../../../ScriptDB/000_4_CreateSP.sql#L312440) | — | 0 / 2 | — |
| `UBDocAttach4Approval` | [Documents & PDF](by-topic/documents-pdf.md) | [L312570](../../../ScriptDB/000_4_CreateSP.sql#L312570) | — | 0 / 0 | — |
| `UBDocAttach4ApprovalSave` | [Documents & PDF](by-topic/documents-pdf.md) | [L312626](../../../ScriptDB/000_4_CreateSP.sql#L312626) | — | 0 / 0 | — |
| `UBDocAttachInfo` | [Documents & PDF](by-topic/documents-pdf.md) | [L312653](../../../ScriptDB/000_4_CreateSP.sql#L312653) | 2 / 2 file | 0 / 0 | [Document.cs:448](../../../UBClasses/Document.cs#L448) |
| `UBDocAttachment2CompDoc` | [Documents & PDF](by-topic/documents-pdf.md) | [L312703](../../../ScriptDB/000_4_CreateSP.sql#L312703) | 1 / 1 file | 0 / 0 | [Document.cs:2699](../../../UBClasses/Document.cs#L2699) |
| `UBDocDefAdd` | [Documents & PDF](by-topic/documents-pdf.md) | [L312739](../../../ScriptDB/000_4_CreateSP.sql#L312739) | 1 / 1 file | 0 / 1 | [Document.cs:665](../../../UBClasses/Document.cs#L665) |
| `UBDocDefDelete` | [Documents & PDF](by-topic/documents-pdf.md) | [L312828](../../../ScriptDB/000_4_CreateSP.sql#L312828) | 1 / 1 file | 0 / 0 | [Document.cs:749](../../../UBClasses/Document.cs#L749) |
| `UBDocDefList` | [Documents & PDF](by-topic/documents-pdf.md) | [L312866](../../../ScriptDB/000_4_CreateSP.sql#L312866) | 2 / 1 file | 0 / 0 | [Document.cs:448](../../../UBClasses/Document.cs#L448) |
| `UBDocDefUpdate` | [Documents & PDF](by-topic/documents-pdf.md) | [L312921](../../../ScriptDB/000_4_CreateSP.sql#L312921) | 1 / 1 file | 0 / 1 | [Document.cs:665](../../../UBClasses/Document.cs#L665) |
| `UBDocDelete` | [Documents & PDF](by-topic/documents-pdf.md) | [L313022](../../../ScriptDB/000_4_CreateSP.sql#L313022) | 1 / 1 file | 0 / 0 | [Document.cs:2025](../../../UBClasses/Document.cs#L2025) |
| `UBDocDescriptionGet` | [Documents & PDF](by-topic/documents-pdf.md) | [L313096](../../../ScriptDB/000_4_CreateSP.sql#L313096) | 1 / 1 file | 0 / 0 | [Document.cs:1780](../../../UBClasses/Document.cs#L1780) |
| `UBDocDescriptionSet` | [Documents & PDF](by-topic/documents-pdf.md) | [L313121](../../../ScriptDB/000_4_CreateSP.sql#L313121) | 1 / 1 file | 0 / 1 | [Document.cs:1731](../../../UBClasses/Document.cs#L1731) |
| `UBDocFileByClientID` | [Client & KYC](by-topic/client-kyc.md) | [L313206](../../../ScriptDB/000_4_CreateSP.sql#L313206) | — | 0 / 0 | — |
| `UBDocFileClientList` | [Client & KYC](by-topic/client-kyc.md) | [L313223](../../../ScriptDB/000_4_CreateSP.sql#L313223) | — | 0 / 0 | — |
| `UBDocFileObj` | [Documents & PDF](by-topic/documents-pdf.md) | [L313237](../../../ScriptDB/000_4_CreateSP.sql#L313237) | 1 / 1 file | 0 / 0 | [Document.cs:524](../../../UBClasses/Document.cs#L524) |
| `UBDocFileObjUpdate` | [Documents & PDF](by-topic/documents-pdf.md) | [L313261](../../../ScriptDB/000_4_CreateSP.sql#L313261) | 1 / 1 file | 0 / 0 | [DocumentObj.cs:23](../../../UBConnection/DocumentObj.cs#L23) |
| `UBDocListAtt` | [Documents & PDF](by-topic/documents-pdf.md) | [L313285](../../../ScriptDB/000_4_CreateSP.sql#L313285) | 1 / 1 file | 0 / 1 | [Document.cs:2524](../../../UBClasses/Document.cs#L2524) |
| `UBDocListByAttachmentID` | [Documents & PDF](by-topic/documents-pdf.md) | [L313616](../../../ScriptDB/000_4_CreateSP.sql#L313616) | 1 / 1 file | 0 / 0 | [Document.cs:2071](../../../UBClasses/Document.cs#L2071) |
| `UBDocListByRepCode` | [Documents & PDF](by-topic/documents-pdf.md) | [L313666](../../../ScriptDB/000_4_CreateSP.sql#L313666) | — | 0 / 0 | — |
| `UBDocListClient` | [Client & KYC](by-topic/client-kyc.md) | [L313693](../../../ScriptDB/000_4_CreateSP.sql#L313693) | 1 / 1 file | 1 / 0 | [Document.cs:1674](../../../UBClasses/Document.cs#L1674) |
| `UBDocListClientAll` | [Client & KYC](by-topic/client-kyc.md) | [L313746](../../../ScriptDB/000_4_CreateSP.sql#L313746) | 1 / 1 file | 1 / 0 | [Document.cs:1823](../../../UBClasses/Document.cs#L1823) |
| `UBDocListView` | [Documents & PDF](by-topic/documents-pdf.md) | [L313954](../../../ScriptDB/000_4_CreateSP.sql#L313954) | 1 / 1 file | 0 / 1 | [Document.cs:2124](../../../UBClasses/Document.cs#L2124) |
| `UBDocSelectionUpdate` | [Documents & PDF](by-topic/documents-pdf.md) | [L314212](../../../ScriptDB/000_4_CreateSP.sql#L314212) | — | 0 / 0 | — |
| `UBDocTMPAdd` | [Documents & PDF](by-topic/documents-pdf.md) | [L314257](../../../ScriptDB/000_4_CreateSP.sql#L314257) | 2 / 1 file | 0 / 0 | [Document.cs:798](../../../UBClasses/Document.cs#L798) |
| `UBDocTMPComfirm` | [Documents & PDF](by-topic/documents-pdf.md) | [L314289](../../../ScriptDB/000_4_CreateSP.sql#L314289) | 1 / 1 file | 0 / 0 | [Document.cs:1143](../../../UBClasses/Document.cs#L1143) |
| `UBDocTMPEnd` | [Documents & PDF](by-topic/documents-pdf.md) | [L314323](../../../ScriptDB/000_4_CreateSP.sql#L314323) | 2 / 1 file | 1 / 0 | [Document.cs:1001](../../../UBClasses/Document.cs#L1001) |
| `UBDocTMPExist` | [Documents & PDF](by-topic/documents-pdf.md) | [L314371](../../../ScriptDB/000_4_CreateSP.sql#L314371) | 1 / 1 file | 0 / 0 | [Document.cs:1041](../../../UBClasses/Document.cs#L1041) |
| `UBDocTMPGet` | [Documents & PDF](by-topic/documents-pdf.md) | [L314426](../../../ScriptDB/000_4_CreateSP.sql#L314426) | 1 / 1 file | 0 / 0 | [Document.cs:1093](../../../UBClasses/Document.cs#L1093) |
| `UBDocTypeList` | [Documents & PDF](by-topic/documents-pdf.md) | [L314456](../../../ScriptDB/000_4_CreateSP.sql#L314456) | — | 1 / 0 | — |
| `UBDocumentDetachFromPlansOrTrx` | [Account & Plan](by-topic/account-plan.md) | [L314481](../../../ScriptDB/000_4_CreateSP.sql#L314481) | 1 / 1 file | 0 / 0 | [Document.cs:4369](../../../UBClasses/Document.cs#L4369) |
| `UBDocumentMove2TaggedPlanOrTrx` | [Account & Plan](by-topic/account-plan.md) | [L314555](../../../ScriptDB/000_4_CreateSP.sql#L314555) | 1 / 1 file | 0 / 1 | [Document.cs:4314](../../../UBClasses/Document.cs#L4314) |
| `UBDocUpdate` | [Documents & PDF](by-topic/documents-pdf.md) | [L314615](../../../ScriptDB/000_4_CreateSP.sql#L314615) | — | 0 / 0 | — |
| `UBDocusignExpiryEmail` | [Notifications](by-topic/notifications.md) | [L314737](../../../ScriptDB/000_4_CreateSP.sql#L314737) | — | 0 / 0 | — |
| `UBDocViewComboList` | [Documents & PDF](by-topic/documents-pdf.md) | [L314780](../../../ScriptDB/000_4_CreateSP.sql#L314780) | — | 0 / 4 | — |
| `UBDSIDList` | [Shared / Other](by-topic/shared-other.md) | [L314829](../../../ScriptDB/000_4_CreateSP.sql#L314829) | 1 / 1 file | 0 / 0 | [CDatabase.cs:1763](../../../UBConnection/CDatabase.cs#L1763) |
| `UBEasyServParams` | [Shared / Other](by-topic/shared-other.md) | [L314853](../../../ScriptDB/000_4_CreateSP.sql#L314853) | — | 0 / 0 | — |
| `UBEasyServSearchClient` | [Client & KYC](by-topic/client-kyc.md) | [L314880](../../../ScriptDB/000_4_CreateSP.sql#L314880) | 1 / 1 file | 0 / 0 | [ClientInfo.cs:1361](../../../UBExport/ClientInfo.cs#L1361) |
| `UBEFTFileEnd` | [Shared / Other](by-topic/shared-other.md) | [L315156](../../../ScriptDB/000_4_CreateSP.sql#L315156) | 1 / 1 file | 0 / 0 | [TrustAccount.cs:3709](../../../UBClasses/TrustAccount.cs#L3709) |
| `UBEFTFileInfo` | [Shared / Other](by-topic/shared-other.md) | [L315180](../../../ScriptDB/000_4_CreateSP.sql#L315180) | 1 / 1 file | 0 / 0 | [TrustAccount.cs:3389](../../../UBClasses/TrustAccount.cs#L3389) |
| `UBEFTGenerateSet` | [Shared / Other](by-topic/shared-other.md) | [L315203](../../../ScriptDB/000_4_CreateSP.sql#L315203) | — | 0 / 0 | — |
| `UBEFTGetID4Mgmt` | [Shared / Other](by-topic/shared-other.md) | [L315326](../../../ScriptDB/000_4_CreateSP.sql#L315326) | — | 1 / 0 | — |
| `UBEFTItemAdd` | [Shared / Other](by-topic/shared-other.md) | [L315405](../../../ScriptDB/000_4_CreateSP.sql#L315405) | — | 20 / 0 | — |
| `UBEFTItemRefreshPending` | [Shared / Other](by-topic/shared-other.md) | [L315474](../../../ScriptDB/000_4_CreateSP.sql#L315474) | — | 1 / 1 | — |
| `UBEFTItemRemove` | [Shared / Other](by-topic/shared-other.md) | [L315525](../../../ScriptDB/000_4_CreateSP.sql#L315525) | 1 / 1 file | 2 / 1 | [TrustAccount.cs:3501](../../../UBClasses/TrustAccount.cs#L3501) |
| `UBEFTItemRestore` | [Shared / Other](by-topic/shared-other.md) | [L315581](../../../ScriptDB/000_4_CreateSP.sql#L315581) | — | 0 / 0 | — |
| `UBEFTItemUpdate` | [Shared / Other](by-topic/shared-other.md) | [L315642](../../../ScriptDB/000_4_CreateSP.sql#L315642) | — | 2 / 0 | — |
| `UBEFTItemVoidRejected` | [Shared / Other](by-topic/shared-other.md) | [L315674](../../../ScriptDB/000_4_CreateSP.sql#L315674) | — | 0 / 1 | — |
| `UBEFTListTotal` | [Shared / Other](by-topic/shared-other.md) | [L315707](../../../ScriptDB/000_4_CreateSP.sql#L315707) | — | 1 / 0 | — |
| `UBEFTProcessTaggedItems` | [Shared / Other](by-topic/shared-other.md) | [L315747](../../../ScriptDB/000_4_CreateSP.sql#L315747) | 1 / 1 file | 0 / 0 | [TrustAccount.cs:3610](../../../UBClasses/TrustAccount.cs#L3610) |
| `UBEFTReminderAdd` | [Shared / Other](by-topic/shared-other.md) | [L315920](../../../ScriptDB/000_4_CreateSP.sql#L315920) | — | 1 / 0 | — |
| `UBEFTReminderHeaderInfo` | [Shared / Other](by-topic/shared-other.md) | [L315974](../../../ScriptDB/000_4_CreateSP.sql#L315974) | 1 / 1 file | 0 / 0 | [TrustAccount.cs:4209](../../../UBClasses/TrustAccount.cs#L4209) |
| `UBEFTReminderItemList` | [Shared / Other](by-topic/shared-other.md) | [L315996](../../../ScriptDB/000_4_CreateSP.sql#L315996) | 1 / 1 file | 0 / 0 | [TrustAccount.cs:4157](../../../UBClasses/TrustAccount.cs#L4157) |
| `UBEFTReminderList` | [Shared / Other](by-topic/shared-other.md) | [L316026](../../../ScriptDB/000_4_CreateSP.sql#L316026) | 1 / 1 file | 0 / 0 | [TrustAccount.cs:4061](../../../UBClasses/TrustAccount.cs#L4061) |
| `UBEFTReminderRemove` | [Shared / Other](by-topic/shared-other.md) | [L316213](../../../ScriptDB/000_4_CreateSP.sql#L316213) | — | 1 / 0 | — |
| `UBEFTReminderRemove1Header` | [Shared / Other](by-topic/shared-other.md) | [L316247](../../../ScriptDB/000_4_CreateSP.sql#L316247) | 1 / 1 file | 0 / 0 | [TrustAccount.cs:4410](../../../UBClasses/TrustAccount.cs#L4410) |
| `UBEFTReminderRemoveOne` | [Shared / Other](by-topic/shared-other.md) | [L316264](../../../ScriptDB/000_4_CreateSP.sql#L316264) | 1 / 1 file | 1 / 0 | [TrustAccount.cs:4368](../../../UBClasses/TrustAccount.cs#L4368) |
| `UBEFTRemove` | [Shared / Other](by-topic/shared-other.md) | [L316295](../../../ScriptDB/000_4_CreateSP.sql#L316295) | 1 / 1 file | 0 / 0 | [TrustAccount.cs:3555](../../../UBClasses/TrustAccount.cs#L3555) |
| `UBEFTTypeList` | [Shared / Other](by-topic/shared-other.md) | [L316317](../../../ScriptDB/000_4_CreateSP.sql#L316317) | — | 1 / 0 | — |
| `UBEFTViewDetailSet` | [Shared / Other](by-topic/shared-other.md) | [L316343](../../../ScriptDB/000_4_CreateSP.sql#L316343) | 1 / 1 file | 0 / 1 | [TrustAccount.cs:3443](../../../UBClasses/TrustAccount.cs#L3443) |
| `UBEFTViewHeaderSet` | [Shared / Other](by-topic/shared-other.md) | [L316734](../../../ScriptDB/000_4_CreateSP.sql#L316734) | 1 / 1 file | 0 / 0 | [TrustAccount.cs:3330](../../../UBClasses/TrustAccount.cs#L3330) |
| `UBEmailOutBox` | [Notifications](by-topic/notifications.md) | [L317002](../../../ScriptDB/000_4_CreateSP.sql#L317002) | — | 0 / 0 | — |
| `UBEmailOutBoxAdd` | [Notifications](by-topic/notifications.md) | [L317185](../../../ScriptDB/000_4_CreateSP.sql#L317185) | — | 0 / 0 | — |
| `UBEmailOutBoxClear` | [Notifications](by-topic/notifications.md) | [L317231](../../../ScriptDB/000_4_CreateSP.sql#L317231) | — | 0 / 0 | — |
| `UBEmailOutBoxRefresh` | [Notifications](by-topic/notifications.md) | [L317327](../../../ScriptDB/000_4_CreateSP.sql#L317327) | — | 0 / 0 | — |
| `UBEmailServerInfo` | [Notifications](by-topic/notifications.md) | [L317361](../../../ScriptDB/000_4_CreateSP.sql#L317361) | 1 / 1 file | 0 / 0 | [CBase.cs:5637](../../../UBClasses/CBase.cs#L5637) |
| `UBEmailServerInfoSave` | [Notifications](by-topic/notifications.md) | [L317393](../../../ScriptDB/000_4_CreateSP.sql#L317393) | 1 / 1 file | 0 / 0 | [CBase.cs:5703](../../../UBClasses/CBase.cs#L5703) |
| `UBEmailTaskExcelEnd` | [Notifications](by-topic/notifications.md) | [L317425](../../../ScriptDB/000_4_CreateSP.sql#L317425) | — | 0 / 0 | — |
| `UBEmailTaskExcelStart` | [Notifications](by-topic/notifications.md) | [L317463](../../../ScriptDB/000_4_CreateSP.sql#L317463) | — | 0 / 5 | — |
| `UBEmailTemplateAdd` | [Notifications](by-topic/notifications.md) | [L317948](../../../ScriptDB/000_4_CreateSP.sql#L317948) | — | 0 / 0 | — |
| `UBEmailTemplateInfo` | [Notifications](by-topic/notifications.md) | [L317983](../../../ScriptDB/000_4_CreateSP.sql#L317983) | — | 0 / 0 | — |
| `UBEmailTemplateList` | [Notifications](by-topic/notifications.md) | [L318012](../../../ScriptDB/000_4_CreateSP.sql#L318012) | — | 0 / 0 | — |
| `UBEmailTemplateTypeList` | [Notifications](by-topic/notifications.md) | [L318062](../../../ScriptDB/000_4_CreateSP.sql#L318062) | — | 1 / 0 | — |
| `UBEmailTemplateUpdate` | [Notifications](by-topic/notifications.md) | [L318100](../../../ScriptDB/000_4_CreateSP.sql#L318100) | — | 0 / 0 | — |
| `UBEMDQualifierList` | [Shared / Other](by-topic/shared-other.md) | [L318135](../../../ScriptDB/000_4_CreateSP.sql#L318135) | — | 2 / 0 | — |
| `UBEmpSectorList` | [Shared / Other](by-topic/shared-other.md) | [L318162](../../../ScriptDB/000_4_CreateSP.sql#L318162) | 1 / 1 file | 1 / 0 | [Company.cs:82](../../../UBClasses/Company.cs#L82) |
| `UBEmpTypeList` | [Shared / Other](by-topic/shared-other.md) | [L318188](../../../ScriptDB/000_4_CreateSP.sql#L318188) | — | 2 / 0 | — |
| `UBEnvAddObj2Env` | [Shared / Other](by-topic/shared-other.md) | [L318207](../../../ScriptDB/000_4_CreateSP.sql#L318207) | 1 / 1 file | 0 / 3 | [Document.cs:4738](../../../UBClasses/Document.cs#L4738) |
| `UBEnvelopeAdd` | [Shared / Other](by-topic/shared-other.md) | [L318346](../../../ScriptDB/000_4_CreateSP.sql#L318346) | — | 2 / 0 | — |
| `UBEnvelopeAddInitial` | [Shared / Other](by-topic/shared-other.md) | [L318375](../../../ScriptDB/000_4_CreateSP.sql#L318375) | — | 2 / 0 | — |
| `UBEnvelopeAddSigPos` | [Shared / Other](by-topic/shared-other.md) | [L318406](../../../ScriptDB/000_4_CreateSP.sql#L318406) | 1 / 1 file | 0 / 0 | [Document.cs:4676](../../../UBClasses/Document.cs#L4676) |
| `UBEnvelopeCheckStatusOne` | [Shared / Other](by-topic/shared-other.md) | [L318431](../../../ScriptDB/000_4_CreateSP.sql#L318431) | — | 0 / 1 | — |
| `UBEnvelopeCheckUpdateFlag` | [Shared / Other](by-topic/shared-other.md) | [L318449](../../../ScriptDB/000_4_CreateSP.sql#L318449) | — | 0 / 0 | — |
| `UBEnvelopeClientInfo` | [Client & KYC](by-topic/client-kyc.md) | [L318471](../../../ScriptDB/000_4_CreateSP.sql#L318471) | — | 0 / 0 | — |
| `UBEnvelopeDetachFromDoc` | [Documents & PDF](by-topic/documents-pdf.md) | [L318496](../../../ScriptDB/000_4_CreateSP.sql#L318496) | 1 / 1 file | 0 / 0 | [Document.cs:4519](../../../UBClasses/Document.cs#L4519) |
| `UBEnvelopeDocInfo` | [Documents & PDF](by-topic/documents-pdf.md) | [L318557](../../../ScriptDB/000_4_CreateSP.sql#L318557) | 1 / 1 file | 0 / 0 | [Document.cs:4881](../../../UBClasses/Document.cs#L4881) |
| `UBEnvelopeDocRemove` | [Documents & PDF](by-topic/documents-pdf.md) | [L318618](../../../ScriptDB/000_4_CreateSP.sql#L318618) | 1 / 1 file | 0 / 0 | [Forms.cs:1693](../../../UBClasses/Forms.cs#L1693) |
| `UBEnvelopeInfo` | [Shared / Other](by-topic/shared-other.md) | [L318691](../../../ScriptDB/000_4_CreateSP.sql#L318691) | 4 / 3 file | 0 / 2 | [ESignature.cs:557](../../../UBClasses/ESignature.cs#L557) |
| `UBEnvelopeInfo_Client` | [Client & KYC](by-topic/client-kyc.md) | [L318827](../../../ScriptDB/000_4_CreateSP.sql#L318827) | 1 / 1 file | 0 / 0 | [Document.cs:4834](../../../UBClasses/Document.cs#L4834) |
| `UBEnvelopeInfoX` | [Shared / Other](by-topic/shared-other.md) | [L318901](../../../ScriptDB/000_4_CreateSP.sql#L318901) | 1 / 1 file | 0 / 6 | [Forms.cs:1571](../../../UBClasses/Forms.cs#L1571) |
| `UBEnvelopeInfoXForOneSpan` | [Shared / Other](by-topic/shared-other.md) | [L319170](../../../ScriptDB/000_4_CreateSP.sql#L319170) | 1 / 1 file | 0 / 5 | [Forms.cs:1635](../../../UBClasses/Forms.cs#L1635) |
| `UBEnvelopeList` | [Shared / Other](by-topic/shared-other.md) | [L319411](../../../ScriptDB/000_4_CreateSP.sql#L319411) | 2 / 2 file | 0 / 1 | [Document.cs:3886](../../../UBClasses/Document.cs#L3886) |
| `UBEnvelopeListNonComplete` | [Shared / Other](by-topic/shared-other.md) | [L319799](../../../ScriptDB/000_4_CreateSP.sql#L319799) | — | 0 / 1 | — |
| `UBEnvelopeListNonCompleteSignority` | [Shared / Other](by-topic/shared-other.md) | [L319869](../../../ScriptDB/000_4_CreateSP.sql#L319869) | 2 / 2 file | 0 / 0 | [ESignature.cs:738](../../../UBClasses/ESignature.cs#L738) |
| `UBEnvelopeListOneClient` | [Client & KYC](by-topic/client-kyc.md) | [L319916](../../../ScriptDB/000_4_CreateSP.sql#L319916) | 1 / 1 file | 1 / 0 | [Forms.cs:1460](../../../UBClasses/Forms.cs#L1460) |
| `UBEnvelopeListSummary` | [Shared / Other](by-topic/shared-other.md) | [L319963](../../../ScriptDB/000_4_CreateSP.sql#L319963) | 1 / 1 file | 0 / 1 | [ESignature.cs:981](../../../UBConnection/ESignature.cs#L981) |
| `UBEnvelopeMove2Attachment` | [Documents & PDF](by-topic/documents-pdf.md) | [L320078](../../../ScriptDB/000_4_CreateSP.sql#L320078) | — | 0 / 1 | — |
| `UBEnvelopeMove2Client` | [Client & KYC](by-topic/client-kyc.md) | [L320099](../../../ScriptDB/000_4_CreateSP.sql#L320099) | 1 / 1 file | 1 / 1 | [Document.cs:4567](../../../UBClasses/Document.cs#L4567) |
| `UBEnvelopeMove2TaggedPlan` | [Account & Plan](by-topic/account-plan.md) | [L320207](../../../ScriptDB/000_4_CreateSP.sql#L320207) | 1 / 1 file | 0 / 1 | [Document.cs:4468](../../../UBClasses/Document.cs#L4468) |
| `UBEnvelopeMove2TaggedTrx` | [Trading & Orders](by-topic/trading-orders.md) | [L320288](../../../ScriptDB/000_4_CreateSP.sql#L320288) | 1 / 1 file | 0 / 1 | [Document.cs:4418](../../../UBClasses/Document.cs#L4418) |
| `UBEnvelopeMove2TrxList` | [Trading & Orders](by-topic/trading-orders.md) | [L320371](../../../ScriptDB/000_4_CreateSP.sql#L320371) | — | 0 / 1 | — |
| `UBEnvelopeMoveTagged2Attachment` | [Documents & PDF](by-topic/documents-pdf.md) | [L320454](../../../ScriptDB/000_4_CreateSP.sql#L320454) | 1 / 1 file | 0 / 1 | [Document.cs:4216](../../../UBClasses/Document.cs#L4216) |
| `UBEnvelopeRecipientAdd` | [Shared / Other](by-topic/shared-other.md) | [L320500](../../../ScriptDB/000_4_CreateSP.sql#L320500) | — | 4 / 0 | — |
| `UBEnvelopeRecipientInfoRefresh` | [Shared / Other](by-topic/shared-other.md) | [L320525](../../../ScriptDB/000_4_CreateSP.sql#L320525) | — | 4 / 0 | — |
| `UBEnvelopeRecipientLink` | [Shared / Other](by-topic/shared-other.md) | [L320570](../../../ScriptDB/000_4_CreateSP.sql#L320570) | — | 2 / 0 | — |
| `UBEnvelopeRecipientSignority2FaUpdate` | [Shared / Other](by-topic/shared-other.md) | [L320652](../../../ScriptDB/000_4_CreateSP.sql#L320652) | — | 2 / 0 | — |
| `UBEnvelopeRecipientStatusUpdate` | [Shared / Other](by-topic/shared-other.md) | [L320672](../../../ScriptDB/000_4_CreateSP.sql#L320672) | 1 / 1 file | 0 / 0 | [Document.cs:4047](../../../UBClasses/Document.cs#L4047) |
| `UBEnvelopeRoutingOrderOptList` | [Trading & Orders](by-topic/trading-orders.md) | [L320703](../../../ScriptDB/000_4_CreateSP.sql#L320703) | — | 1 / 0 | — |
| `UBEnvelopeSelectionUpdate` | [Shared / Other](by-topic/shared-other.md) | [L320719](../../../ScriptDB/000_4_CreateSP.sql#L320719) | — | 0 / 0 | — |
| `UBEnvelopeSenderVerify` | [Shared / Other](by-topic/shared-other.md) | [L320760](../../../ScriptDB/000_4_CreateSP.sql#L320760) | — | 2 / 0 | — |
| `UBEnvelopeSetEnvID` | [Shared / Other](by-topic/shared-other.md) | [L320867](../../../ScriptDB/000_4_CreateSP.sql#L320867) | 1 / 1 file | 0 / 0 | [Forms.cs:1413](../../../UBClasses/Forms.cs#L1413) |
| `UBEnvelopeSetErrorStatus` | [Shared / Other](by-topic/shared-other.md) | [L320892](../../../ScriptDB/000_4_CreateSP.sql#L320892) | 2 / 2 file | 0 / 0 | [ESignature.cs:697](../../../UBClasses/ESignature.cs#L697) |
| `UBEnvelopeSetStatus` | [Shared / Other](by-topic/shared-other.md) | [L320912](../../../ScriptDB/000_4_CreateSP.sql#L320912) | 1 / 1 file | 2 / 3 | [Forms.cs:1738](../../../UBClasses/Forms.cs#L1738) |
| `UBEnvelopeSetUpdateFlag` | [Shared / Other](by-topic/shared-other.md) | [L321026](../../../ScriptDB/000_4_CreateSP.sql#L321026) | 2 / 2 file | 0 / 0 | [ESignature.cs:785](../../../UBClasses/ESignature.cs#L785) |
| `UBEnvelopeSetVoid` | [Shared / Other](by-topic/shared-other.md) | [L321048](../../../ScriptDB/000_4_CreateSP.sql#L321048) | 1 / 1 file | 0 / 0 | [Forms.cs:1783](../../../UBClasses/Forms.cs#L1783) |
| `UBEnvelopeStatusList` | [Shared / Other](by-topic/shared-other.md) | [L321071](../../../ScriptDB/000_4_CreateSP.sql#L321071) | — | 1 / 0 | — |
| `UBEnvelopeTaggedCount` | [Shared / Other](by-topic/shared-other.md) | [L321097](../../../ScriptDB/000_4_CreateSP.sql#L321097) | 1 / 1 file | 0 / 0 | [Document.cs:4263](../../../UBClasses/Document.cs#L4263) |
| `UBEnvelopeVerifyRecipient` | [Shared / Other](by-topic/shared-other.md) | [L321113](../../../ScriptDB/000_4_CreateSP.sql#L321113) | — | 1 / 0 | — |
| `UBErrorLogAdd` | [Shared / Other](by-topic/shared-other.md) | [L321130](../../../ScriptDB/000_4_CreateSP.sql#L321130) | — | 1 / 0 | — |
| `UBESignatureOneSpanGet` | [Documents & PDF](by-topic/documents-pdf.md) | [L321181](../../../ScriptDB/000_4_CreateSP.sql#L321181) | 2 / 2 file | 0 / 0 | [ESignature.cs:231](../../../UBClasses/ESignature.cs#L231) |
| `UBESignatureOneSpanSave` | [Documents & PDF](by-topic/documents-pdf.md) | [L321207](../../../ScriptDB/000_4_CreateSP.sql#L321207) | 2 / 2 file | 0 / 1 | [ESignature.cs:142](../../../UBClasses/ESignature.cs#L142) |
| `UBESignatureSignorityGet` | [Documents & PDF](by-topic/documents-pdf.md) | [L321223](../../../ScriptDB/000_4_CreateSP.sql#L321223) | 2 / 2 file | 1 / 0 | [ESignature.cs:186](../../../UBClasses/ESignature.cs#L186) |
| `UBESignatureSignoritySave` | [Documents & PDF](by-topic/documents-pdf.md) | [L321279](../../../ScriptDB/000_4_CreateSP.sql#L321279) | 2 / 2 file | 0 / 1 | [ESignature.cs:95](../../../UBClasses/ESignature.cs#L95) |
| `UBESignatureSourceTypeList` | [Documents & PDF](by-topic/documents-pdf.md) | [L321304](../../../ScriptDB/000_4_CreateSP.sql#L321304) | — | 1 / 0 | — |
| `UBETFComboList` | [Fund & GIC](by-topic/fund-gic.md) | [L321324](../../../ScriptDB/000_4_CreateSP.sql#L321324) | — | 0 / 5 | — |
| `UBETFPriceImportDef` | [Fund & GIC](by-topic/fund-gic.md) | [L321349](../../../ScriptDB/000_4_CreateSP.sql#L321349) | — | 0 / 0 | — |
| `UBETFPriceImportDefNEO` | [Fund & GIC](by-topic/fund-gic.md) | [L321362](../../../ScriptDB/000_4_CreateSP.sql#L321362) | — | 0 / 0 | — |
| `UBETFPriceImportFileClear` | [Fund & GIC](by-topic/fund-gic.md) | [L321375](../../../ScriptDB/000_4_CreateSP.sql#L321375) | — | 2 / 0 | — |
| `UBETFPriceImportFileReadOneRecord` | [Fund & GIC](by-topic/fund-gic.md) | [L321388](../../../ScriptDB/000_4_CreateSP.sql#L321388) | — | 0 / 2 | — |
| `UBETFPriceImportFileReadOneRecordNEO` | [Fund & GIC](by-topic/fund-gic.md) | [L321476](../../../ScriptDB/000_4_CreateSP.sql#L321476) | — | 0 / 1 | — |
| `UBETFPriceImportList` | [Fund & GIC](by-topic/fund-gic.md) | [L321543](../../../ScriptDB/000_4_CreateSP.sql#L321543) | 1 / 1 file | 0 / 0 | [ETFPriceImport.cs:36](../../../UBClasses/ETFPriceImport.cs#L36) |
| `UBETFPriceImportProcess1Record` | [Fund & GIC](by-topic/fund-gic.md) | [L321641](../../../ScriptDB/000_4_CreateSP.sql#L321641) | — | 2 / 2 | — |
| `UBETFPriceImportProcessOneFile` | [Fund & GIC](by-topic/fund-gic.md) | [L321772](../../../ScriptDB/000_4_CreateSP.sql#L321772) | 1 / 1 file | 0 / 1 | [CETF.cs:32](../../../UBFFImport/CETF.cs#L32) |
| `UBETFPriceImportProcessTaggedItems` | [Fund & GIC](by-topic/fund-gic.md) | [L321824](../../../ScriptDB/000_4_CreateSP.sql#L321824) | — | 0 / 1 | — |
| `UBETFPriceImportSelectionUpdate` | [Fund & GIC](by-topic/fund-gic.md) | [L321871](../../../ScriptDB/000_4_CreateSP.sql#L321871) | — | 0 / 0 | — |
| `UBETFPXUpdate` | [Fund & GIC](by-topic/fund-gic.md) | [L321909](../../../ScriptDB/000_4_CreateSP.sql#L321909) | — | 1 / 0 | — |
| `UBETFTransferAdd` | [Fund & GIC](by-topic/fund-gic.md) | [L321939](../../../ScriptDB/000_4_CreateSP.sql#L321939) | 1 / 1 file | 0 / 4 | [Stock.cs:743](../../../UBClasses/Stock.cs#L743) |
| `UBETFTrnsf_CalcValues` | [Fund & GIC](by-topic/fund-gic.md) | [L322148](../../../ScriptDB/000_4_CreateSP.sql#L322148) | 1 / 1 file | 0 / 1 | [Stock.cs:690](../../../UBClasses/Stock.cs#L690) |
| `UBETFTrnsf_CalcValues_One` | [Fund & GIC](by-topic/fund-gic.md) | [L322183](../../../ScriptDB/000_4_CreateSP.sql#L322183) | — | 2 / 0 | — |
| `UBEventLogAdd` | [Shared / Other](by-topic/shared-other.md) | [L322363](../../../ScriptDB/000_4_CreateSP.sql#L322363) | 1 / 1 file | 0 / 0 | [CDatabase.cs:1634](../../../UBConnection/CDatabase.cs#L1634) |
| `UBExceptionComboList` | [Shared / Other](by-topic/shared-other.md) | [L322395](../../../ScriptDB/000_4_CreateSP.sql#L322395) | — | 0 / 3 | — |
| `UBExceptionComboListRep` | [Shared / Other](by-topic/shared-other.md) | [L322422](../../../ScriptDB/000_4_CreateSP.sql#L322422) | — | 0 / 3 | — |
| `UBExceptionReportTypeList` | [Shared / Other](by-topic/shared-other.md) | [L322448](../../../ScriptDB/000_4_CreateSP.sql#L322448) | — | 2 / 0 | — |
| `UBExport100Process` | [Shared / Other](by-topic/shared-other.md) | [L322471](../../../ScriptDB/000_4_CreateSP.sql#L322471) | — | 0 / 1 | — |
| `UBExport100ProcessOne` | [Shared / Other](by-topic/shared-other.md) | [L322496](../../../ScriptDB/000_4_CreateSP.sql#L322496) | — | 1 / 1 | — |
| `UBExportAddRequest` | [Shared / Other](by-topic/shared-other.md) | [L322576](../../../ScriptDB/000_4_CreateSP.sql#L322576) | 1 / 1 file | 0 / 1 | [Export.cs:39](../../../UBClasses/Export.cs#L39) |
| `UBExportAddRequestT` | [Shared / Other](by-topic/shared-other.md) | [L322702](../../../ScriptDB/000_4_CreateSP.sql#L322702) | — | 1 / 1 | — |
| `UBExportCashCleanup` | [Account & Plan](by-topic/account-plan.md) | [L322818](../../../ScriptDB/000_4_CreateSP.sql#L322818) | — | 3 / 0 | — |
| `UBExportCashDealerList` | [Account & Plan](by-topic/account-plan.md) | [L322864](../../../ScriptDB/000_4_CreateSP.sql#L322864) | — | 0 / 0 | — |
| `UBExportCashOneDealerAcc` | [Account & Plan](by-topic/account-plan.md) | [L322947](../../../ScriptDB/000_4_CreateSP.sql#L322947) | — | 0 / 0 | — |
| `UBExportCashOneDealerTrx` | [Account & Plan](by-topic/account-plan.md) | [L323321](../../../ScriptDB/000_4_CreateSP.sql#L323321) | — | 0 / 0 | — |
| `UBExportComboList` | [Shared / Other](by-topic/shared-other.md) | [L323818](../../../ScriptDB/000_4_CreateSP.sql#L323818) | — | 0 / 5 | — |
| `UBExportGet` | [Shared / Other](by-topic/shared-other.md) | [L323875](../../../ScriptDB/000_4_CreateSP.sql#L323875) | — | 0 / 33 | — |
| `UBExportGetFundPosIntermediary` | [Fund & GIC](by-topic/fund-gic.md) | [L324959](../../../ScriptDB/000_4_CreateSP.sql#L324959) | — | 0 / 1 | — |
| `UBExportGetFundPosWithKYC` | [Fund & GIC](by-topic/fund-gic.md) | [L325073](../../../ScriptDB/000_4_CreateSP.sql#L325073) | — | 0 / 0 | — |
| `UBExportInfo` | [Shared / Other](by-topic/shared-other.md) | [L325268](../../../ScriptDB/000_4_CreateSP.sql#L325268) | — | 0 / 1 | — |
| `UBExportionReportTypeList` | [Shared / Other](by-topic/shared-other.md) | [L325313](../../../ScriptDB/000_4_CreateSP.sql#L325313) | — | 1 / 0 | — |
| `UBExportJFDGet` | [Shared / Other](by-topic/shared-other.md) | [L325338](../../../ScriptDB/000_4_CreateSP.sql#L325338) | — | 0 / 1 | — |
| `UBExportJFDSet` | [Shared / Other](by-topic/shared-other.md) | [L325478](../../../ScriptDB/000_4_CreateSP.sql#L325478) | — | 0 / 0 | — |
| `UBExportList` | [Shared / Other](by-topic/shared-other.md) | [L325503](../../../ScriptDB/000_4_CreateSP.sql#L325503) | — | 0 / 1 | — |
| `UBExportRemove` | [Shared / Other](by-topic/shared-other.md) | [L325577](../../../ScriptDB/000_4_CreateSP.sql#L325577) | — | 1 / 0 | — |
| `UBExportSet` | [Shared / Other](by-topic/shared-other.md) | [L325885](../../../ScriptDB/000_4_CreateSP.sql#L325885) | — | 0 / 0 | — |
| `UBExportSet100` | [Shared / Other](by-topic/shared-other.md) | [L326026](../../../ScriptDB/000_4_CreateSP.sql#L326026) | — | 1 / 0 | — |
| `UBFamilyEditComboList` | [Client & KYC](by-topic/client-kyc.md) | [L326076](../../../ScriptDB/000_4_CreateSP.sql#L326076) | — | 0 / 2 | — |
| `UBFamilyGetClientID` | [Client & KYC](by-topic/client-kyc.md) | [L326102](../../../ScriptDB/000_4_CreateSP.sql#L326102) | 1 / 1 file | 0 / 0 | [Family.cs:284](../../../UBClasses/Family.cs#L284) |
| `UBFamilyItemInfo` | [Client & KYC](by-topic/client-kyc.md) | [L326132](../../../ScriptDB/000_4_CreateSP.sql#L326132) | 1 / 1 file | 0 / 0 | [Family.cs:134](../../../UBClasses/Family.cs#L134) |
| `UBFamilyLabelList` | [Client & KYC](by-topic/client-kyc.md) | [L326174](../../../ScriptDB/000_4_CreateSP.sql#L326174) | 1 / 1 file | 0 / 1 | [ClientLabel.cs:370](../../../VieFUNDPdf/ClientLabel.cs#L370) |
| `UBFamilyList` | [Client & KYC](by-topic/client-kyc.md) | [L326262](../../../ScriptDB/000_4_CreateSP.sql#L326262) | 2 / 2 file | 0 / 1 | [Family.cs:235](../../../UBClasses/Family.cs#L235) |
| `UBFamilyListOneClient` | [Client & KYC](by-topic/client-kyc.md) | [L326363](../../../ScriptDB/000_4_CreateSP.sql#L326363) | 1 / 1 file | 0 / 0 | [Family.cs:90](../../../UBClasses/Family.cs#L90) |
| `UBFamilyMemberAdd` | [Client & KYC](by-topic/client-kyc.md) | [L326424](../../../ScriptDB/000_4_CreateSP.sql#L326424) | 1 / 1 file | 0 / 0 | [Family.cs:34](../../../UBClasses/Family.cs#L34) |
| `UBFamilyMemberRefresh` | [Client & KYC](by-topic/client-kyc.md) | [L326558](../../../ScriptDB/000_4_CreateSP.sql#L326558) | — | 0 / 1 | — |
| `UBFamilyMemberRemove` | [Client & KYC](by-topic/client-kyc.md) | [L326601](../../../ScriptDB/000_4_CreateSP.sql#L326601) | 1 / 1 file | 1 / 0 | [Family.cs:183](../../../UBClasses/Family.cs#L183) |
| `UBFamilyMemberUpdate` | [Client & KYC](by-topic/client-kyc.md) | [L326651](../../../ScriptDB/000_4_CreateSP.sql#L326651) | 1 / 1 file | 0 / 0 | [Family.cs:34](../../../UBClasses/Family.cs#L34) |
| `UBFATCAClassList` | [Client & KYC](by-topic/client-kyc.md) | [L326715](../../../ScriptDB/000_4_CreateSP.sql#L326715) | — | 1 / 0 | — |
| `UBFATCAControllingPersonTypeList` | [Client & KYC](by-topic/client-kyc.md) | [L326753](../../../ScriptDB/000_4_CreateSP.sql#L326753) | — | 1 / 0 | — |
| `UBFATCACtrlPersonDelete` | [Client & KYC](by-topic/client-kyc.md) | [L326790](../../../ScriptDB/000_4_CreateSP.sql#L326790) | — | 1 / 0 | — |
| `UBFATCACtrlPersonInfo` | [Client & KYC](by-topic/client-kyc.md) | [L326809](../../../ScriptDB/000_4_CreateSP.sql#L326809) | 1 / 1 file | 0 / 0 | [FATCA.cs:791](../../../UBClasses/FATCA.cs#L791) |
| `UBFATCACtrlPersonList` | [Client & KYC](by-topic/client-kyc.md) | [L326840](../../../ScriptDB/000_4_CreateSP.sql#L326840) | 1 / 1 file | 0 / 0 | [FATCA.cs:734](../../../UBClasses/FATCA.cs#L734) |
| `UBFATCACtrlPersonUpdate` | [Client & KYC](by-topic/client-kyc.md) | [L326892](../../../ScriptDB/000_4_CreateSP.sql#L326892) | 1 / 1 file | 0 / 1 | [FATCA.cs:887](../../../UBClasses/FATCA.cs#L887) |
| `UBFATCADeletePerson` | [Client & KYC](by-topic/client-kyc.md) | [L327007](../../../ScriptDB/000_4_CreateSP.sql#L327007) | — | 0 / 0 | — |
| `UBFATCAEntityTypeList` | [Client & KYC](by-topic/client-kyc.md) | [L327032](../../../ScriptDB/000_4_CreateSP.sql#L327032) | — | 3 / 0 | — |
| `UBFATCAEntityUpdate` | [Client & KYC](by-topic/client-kyc.md) | [L327062](../../../ScriptDB/000_4_CreateSP.sql#L327062) | — | 2 / 2 | — |
| `UBFATCAForeignIDAdd` | [Client & KYC](by-topic/client-kyc.md) | [L327198](../../../ScriptDB/000_4_CreateSP.sql#L327198) | — | 1 / 0 | — |
| `UBFATCAForeignIDRemove` | [Client & KYC](by-topic/client-kyc.md) | [L327243](../../../ScriptDB/000_4_CreateSP.sql#L327243) | — | 0 / 0 | — |
| `UBFATCAGet` | [Client & KYC](by-topic/client-kyc.md) | [L327296](../../../ScriptDB/000_4_CreateSP.sql#L327296) | — | 2 / 2 | — |
| `UBFATCAIDTypeList` | [Client & KYC](by-topic/client-kyc.md) | [L327329](../../../ScriptDB/000_4_CreateSP.sql#L327329) | — | 3 / 0 | — |
| `UBFATCAIndList` | [Client & KYC](by-topic/client-kyc.md) | [L327366](../../../ScriptDB/000_4_CreateSP.sql#L327366) | — | 1 / 1 | — |
| `UBFATCAIndTINDelete` | [Client & KYC](by-topic/client-kyc.md) | [L327481](../../../ScriptDB/000_4_CreateSP.sql#L327481) | — | 0 / 0 | — |
| `UBFATCAIndTINInfo` | [Client & KYC](by-topic/client-kyc.md) | [L327514](../../../ScriptDB/000_4_CreateSP.sql#L327514) | 1 / 1 file | 0 / 0 | [FATCA.cs:510](../../../UBClasses/FATCA.cs#L510) |
| `UBFATCAIndTINList` | [Client & KYC](by-topic/client-kyc.md) | [L327541](../../../ScriptDB/000_4_CreateSP.sql#L327541) | 1 / 1 file | 2 / 0 | [FATCA.cs:453](../../../UBClasses/FATCA.cs#L453) |
| `UBFATCAIndTINUpdate` | [Client & KYC](by-topic/client-kyc.md) | [L327595](../../../ScriptDB/000_4_CreateSP.sql#L327595) | 1 / 1 file | 1 / 0 | [FATCA.cs:238](../../../UBClasses/FATCA.cs#L238) |
| `UBFATCAList` | [Client & KYC](by-topic/client-kyc.md) | [L327702](../../../ScriptDB/000_4_CreateSP.sql#L327702) | 1 / 1 file | 0 / 2 | [FATCA.cs:80](../../../UBClasses/FATCA.cs#L80) |
| `UBFATCAList_TBD` | [Client & KYC](by-topic/client-kyc.md) | [L327742](../../../ScriptDB/000_4_CreateSP.sql#L327742) | — | 0 / 1 | — |
| `UBFATCANoTINReasonList` | [Client & KYC](by-topic/client-kyc.md) | [L327934](../../../ScriptDB/000_4_CreateSP.sql#L327934) | — | 1 / 0 | — |
| `UBFATCAOrgList` | [Client & KYC](by-topic/client-kyc.md) | [L327970](../../../ScriptDB/000_4_CreateSP.sql#L327970) | — | 1 / 1 | — |
| `UBFATCAOrgTINDelete` | [Client & KYC](by-topic/client-kyc.md) | [L328100](../../../ScriptDB/000_4_CreateSP.sql#L328100) | — | 0 / 1 | — |
| `UBFATCAOrgTINInfo` | [Client & KYC](by-topic/client-kyc.md) | [L328148](../../../ScriptDB/000_4_CreateSP.sql#L328148) | 1 / 1 file | 0 / 0 | [FATCA.cs:625](../../../UBClasses/FATCA.cs#L625) |
| `UBFATCAOrgTINList` | [Client & KYC](by-topic/client-kyc.md) | [L328181](../../../ScriptDB/000_4_CreateSP.sql#L328181) | 1 / 1 file | 2 / 0 | [FATCA.cs:568](../../../UBClasses/FATCA.cs#L568) |
| `UBFATCAOrgTINUpdate` | [Client & KYC](by-topic/client-kyc.md) | [L328244](../../../ScriptDB/000_4_CreateSP.sql#L328244) | 1 / 1 file | 1 / 0 | [FATCA.cs:299](../../../UBClasses/FATCA.cs#L299) |
| `UBFATCARemove` | [Client & KYC](by-topic/client-kyc.md) | [L328381](../../../ScriptDB/000_4_CreateSP.sql#L328381) | — | 1 / 0 | — |
| `UBFATCARemoveEntity` | [Client & KYC](by-topic/client-kyc.md) | [L328419](../../../ScriptDB/000_4_CreateSP.sql#L328419) | — | 1 / 0 | — |
| `UBFATCARemoveEntityOne` | [Client & KYC](by-topic/client-kyc.md) | [L328457](../../../ScriptDB/000_4_CreateSP.sql#L328457) | — | 0 / 0 | — |
| `UBFATCARemoveOne` | [Client & KYC](by-topic/client-kyc.md) | [L328484](../../../ScriptDB/000_4_CreateSP.sql#L328484) | — | 1 / 0 | — |
| `UBFATCAScanNonReportable` | [Client & KYC](by-topic/client-kyc.md) | [L328512](../../../ScriptDB/000_4_CreateSP.sql#L328512) | — | 0 / 2 | — |
| `UBFATCAStatusList` | [Client & KYC](by-topic/client-kyc.md) | [L328601](../../../ScriptDB/000_4_CreateSP.sql#L328601) | — | 3 / 0 | — |
| `UBFATCATINList` | [Client & KYC](by-topic/client-kyc.md) | [L328636](../../../ScriptDB/000_4_CreateSP.sql#L328636) | 1 / 1 file | 0 / 2 | [FATCA.cs:398](../../../UBClasses/FATCA.cs#L398) |
| `UBFATCAUpdate` | [Client & KYC](by-topic/client-kyc.md) | [L328681](../../../ScriptDB/000_4_CreateSP.sql#L328681) | — | 3 / 2 | — |
| `UBFATCAVerify` | [Client & KYC](by-topic/client-kyc.md) | [L328767](../../../ScriptDB/000_4_CreateSP.sql#L328767) | — | 0 / 1 | — |
| `UBFATCAVerify_CtrlPerson` | [Client & KYC](by-topic/client-kyc.md) | [L328832](../../../ScriptDB/000_4_CreateSP.sql#L328832) | — | 1 / 1 | — |
| `UBFATCAVerify_IndTIN` | [Client & KYC](by-topic/client-kyc.md) | [L328920](../../../ScriptDB/000_4_CreateSP.sql#L328920) | — | 2 / 0 | — |
| `UBFATCAVerify_One` | [Client & KYC](by-topic/client-kyc.md) | [L328995](../../../ScriptDB/000_4_CreateSP.sql#L328995) | — | 1 / 3 | — |
| `UBFATCAVerify_OrgTIN` | [Client & KYC](by-topic/client-kyc.md) | [L329086](../../../ScriptDB/000_4_CreateSP.sql#L329086) | — | 1 / 0 | — |
| `UBFATCAViewComboList` | [Client & KYC](by-topic/client-kyc.md) | [L329164](../../../ScriptDB/000_4_CreateSP.sql#L329164) | — | 0 / 1 | — |
| `UBFATDeleteEntity` | [Shared / Other](by-topic/shared-other.md) | [L329177](../../../ScriptDB/000_4_CreateSP.sql#L329177) | — | 0 / 0 | — |
| `UBFDFileAdd` | [Shared / Other](by-topic/shared-other.md) | [L329203](../../../ScriptDB/000_4_CreateSP.sql#L329203) | 1 / 1 file | 0 / 0 | [Fundata.cs:1037](../../../UBClasses/Fundata.cs#L1037) |
| `UBFDFileDef` | [Shared / Other](by-topic/shared-other.md) | [L329248](../../../ScriptDB/000_4_CreateSP.sql#L329248) | — | 0 / 0 | — |
| `UBFDFileDetailItem` | [Shared / Other](by-topic/shared-other.md) | [L329273](../../../ScriptDB/000_4_CreateSP.sql#L329273) | 1 / 1 file | 0 / 0 | [Fundata.cs:1377](../../../UBClasses/Fundata.cs#L1377) |
| `UBFDFileDetailList` | [Shared / Other](by-topic/shared-other.md) | [L329345](../../../ScriptDB/000_4_CreateSP.sql#L329345) | 1 / 1 file | 0 / 0 | [Fundata.cs:1429](../../../UBClasses/Fundata.cs#L1429) |
| `UBFDFileGet` | [Shared / Other](by-topic/shared-other.md) | [L329497](../../../ScriptDB/000_4_CreateSP.sql#L329497) | 1 / 1 file | 0 / 0 | [Fundata.cs:1088](../../../UBClasses/Fundata.cs#L1088) |
| `UBFDFileList` | [Shared / Other](by-topic/shared-other.md) | [L329539](../../../ScriptDB/000_4_CreateSP.sql#L329539) | 1 / 1 file | 0 / 0 | [Fundata.cs:1320](../../../UBClasses/Fundata.cs#L1320) |
| `UBFDFileSetStatus` | [Shared / Other](by-topic/shared-other.md) | [L329599](../../../ScriptDB/000_4_CreateSP.sql#L329599) | — | 0 / 0 | — |
| `UBFDGetSetting` | [Shared / Other](by-topic/shared-other.md) | [L329625](../../../ScriptDB/000_4_CreateSP.sql#L329625) | — | 0 / 0 | — |
| `UBFDProcessAll` | [Shared / Other](by-topic/shared-other.md) | [L329672](../../../ScriptDB/000_4_CreateSP.sql#L329672) | — | 0 / 1 | — |
| `UBFDProcesslItem_TBD` | [Shared / Other](by-topic/shared-other.md) | [L329772](../../../ScriptDB/000_4_CreateSP.sql#L329772) | — | 0 / 0 | — |
| `UBFDProcessOneiItem` | [Shared / Other](by-topic/shared-other.md) | [L329834](../../../ScriptDB/000_4_CreateSP.sql#L329834) | — | 1 / 2 | — |
| `UBFDRecordAdd` | [Shared / Other](by-topic/shared-other.md) | [L330035](../../../ScriptDB/000_4_CreateSP.sql#L330035) | — | 0 / 1 | — |
| `UBFDSaveSetting` | [Shared / Other](by-topic/shared-other.md) | [L330130](../../../ScriptDB/000_4_CreateSP.sql#L330130) | 1 / 1 file | 0 / 0 | [Fundata.cs:1499](../../../UBClasses/Fundata.cs#L1499) |
| `UBFee4ServiceComboList` | [Commission & Fee](by-topic/commission-fee.md) | [L330293](../../../ScriptDB/000_4_CreateSP.sql#L330293) | — | 0 / 7 | — |
| `UBFeeAddHoc` | [Commission & Fee](by-topic/commission-fee.md) | [L330340](../../../ScriptDB/000_4_CreateSP.sql#L330340) | 1 / 1 file | 0 / 3 | [Fee.cs:2209](../../../UBClasses/Fee.cs#L2209) |
| `UBFeeBasedAccountList` | [Commission & Fee](by-topic/commission-fee.md) | [L330620](../../../ScriptDB/000_4_CreateSP.sql#L330620) | — | 0 / 0 | — |
| `UBFeeFindTrusteeFeeWithCapIssue` | [Commission & Fee](by-topic/commission-fee.md) | [L330713](../../../ScriptDB/000_4_CreateSP.sql#L330713) | — | 0 / 0 | — |
| `UBFeeFixGenerateTrxFromCommAGRA` | [Commission & Fee](by-topic/commission-fee.md) | [L330742](../../../ScriptDB/000_4_CreateSP.sql#L330742) | — | 0 / 1 | — |
| `UBFeeFixGenerateTrxFromCommOneAGRA` | [Commission & Fee](by-topic/commission-fee.md) | [L330768](../../../ScriptDB/000_4_CreateSP.sql#L330768) | — | 1 / 1 | — |
| `UBFeeFixingDuplication` | [Commission & Fee](by-topic/commission-fee.md) | [L330841](../../../ScriptDB/000_4_CreateSP.sql#L330841) | — | 0 / 0 | — |
| `UBFeeFrequencyList` | [Commission & Fee](by-topic/commission-fee.md) | [L330893](../../../ScriptDB/000_4_CreateSP.sql#L330893) | — | 4 / 0 | — |
| `UBFeeGenerateComm` | [Commission & Fee](by-topic/commission-fee.md) | [L330930](../../../ScriptDB/000_4_CreateSP.sql#L330930) | 1 / 1 file | 0 / 1 | [Fee.cs:1720](../../../UBClasses/Fee.cs#L1720) |
| `UBFeeGenerateCommOneItem` | [Commission & Fee](by-topic/commission-fee.md) | [L330983](../../../ScriptDB/000_4_CreateSP.sql#L330983) | — | 3 / 2 | — |
| `UBFeeGenerateCommOneItem_FixCommTrustMissing` | [Commission & Fee](by-topic/commission-fee.md) | [L331374](../../../ScriptDB/000_4_CreateSP.sql#L331374) | — | 0 / 1 | — |
| `UBFeeGenerateCommOneItemFix` | [Commission & Fee](by-topic/commission-fee.md) | [L331681](../../../ScriptDB/000_4_CreateSP.sql#L331681) | — | 0 / 1 | — |
| `UBFeeGenerateCommTaggedItems` | [Commission & Fee](by-topic/commission-fee.md) | [L331923](../../../ScriptDB/000_4_CreateSP.sql#L331923) | 1 / 1 file | 0 / 1 | [Fee.cs:1775](../../../UBClasses/Fee.cs#L1775) |
| `UBFeeGenerateTrx` | [Commission & Fee](by-topic/commission-fee.md) | [L331974](../../../ScriptDB/000_4_CreateSP.sql#L331974) | 1 / 1 file | 0 / 1 | [Fee.cs:1612](../../../UBClasses/Fee.cs#L1612) |
| `UBFeeGenerateTrx_Start` | [Commission & Fee](by-topic/commission-fee.md) | [L332050](../../../ScriptDB/000_4_CreateSP.sql#L332050) | 1 / 1 file | 0 / 0 | [Fee.cs:111](../../../UBClasses/Fee.cs#L111) |
| `UBFeeGenerateTrxOne` | [Commission & Fee](by-topic/commission-fee.md) | [L332099](../../../ScriptDB/000_4_CreateSP.sql#L332099) | — | 0 / 1 | — |
| `UBFeeGenerateTrxOneItem` | [Commission & Fee](by-topic/commission-fee.md) | [L332117](../../../ScriptDB/000_4_CreateSP.sql#L332117) | — | 13 / 5 | — |
| `UBFeeGenerateTrxTaggedItems` | [Commission & Fee](by-topic/commission-fee.md) | [L332600](../../../ScriptDB/000_4_CreateSP.sql#L332600) | 1 / 1 file | 0 / 1 | [Fee.cs:1667](../../../UBClasses/Fee.cs#L1667) |
| `UBFeeGenerateTrxUI` | [Commission & Fee](by-topic/commission-fee.md) | [L332661](../../../ScriptDB/000_4_CreateSP.sql#L332661) | 1 / 1 file | 0 / 1 | [Fee.cs:2383](../../../UBClasses/Fee.cs#L2383) |
| `UBFeeGetDefaultRedeemOpt` | [Commission & Fee](by-topic/commission-fee.md) | [L332712](../../../ScriptDB/000_4_CreateSP.sql#L332712) | — | 2 / 0 | — |
| `UBFeeGetMKV` | [Commission & Fee](by-topic/commission-fee.md) | [L332741](../../../ScriptDB/000_4_CreateSP.sql#L332741) | — | 3 / 1 | — |
| `UBFeeHeaderDetailListSet` | [Commission & Fee](by-topic/commission-fee.md) | [L332890](../../../ScriptDB/000_4_CreateSP.sql#L332890) | 1 / 1 file | 0 / 1 | [Fee.cs:2739](../../../UBClasses/Fee.cs#L2739) |
| `UBFeeHeaderListSet` | [Commission & Fee](by-topic/commission-fee.md) | [L333207](../../../ScriptDB/000_4_CreateSP.sql#L333207) | 1 / 1 file | 0 / 0 | [Fee.cs:2596](../../../UBClasses/Fee.cs#L2596) |
| `UBFeeHeaderSelectionUpdate` | [Commission & Fee](by-topic/commission-fee.md) | [L333494](../../../ScriptDB/000_4_CreateSP.sql#L333494) | — | 0 / 0 | — |
| `UBFeeIssueList` | [Commission & Fee](by-topic/commission-fee.md) | [L333531](../../../ScriptDB/000_4_CreateSP.sql#L333531) | — | 0 / 0 | — |
| `UBFeeItemInfo` | [Commission & Fee](by-topic/commission-fee.md) | [L333574](../../../ScriptDB/000_4_CreateSP.sql#L333574) | 1 / 1 file | 1 / 0 | [Fee.cs:1407](../../../UBClasses/Fee.cs#L1407) |
| `UBFeeItemRemove` | [Commission & Fee](by-topic/commission-fee.md) | [L333641](../../../ScriptDB/000_4_CreateSP.sql#L333641) | 1 / 1 file | 0 / 2 | [Fee.cs:2280](../../../UBClasses/Fee.cs#L2280) |
| `UBFeeItemResetTrxComm` | [Commission & Fee](by-topic/commission-fee.md) | [L333851](../../../ScriptDB/000_4_CreateSP.sql#L333851) | — | 1 / 0 | — |
| `UBFeeListAdminAll` | [Commission & Fee](by-topic/commission-fee.md) | [L333881](../../../ScriptDB/000_4_CreateSP.sql#L333881) | — | 0 / 0 | — |
| `UBFeeListSet` | [Commission & Fee](by-topic/commission-fee.md) | [L333937](../../../ScriptDB/000_4_CreateSP.sql#L333937) | 1 / 1 file | 0 / 1 | [Fee.cs:649](../../../UBClasses/Fee.cs#L649) |
| `UBFeeOtherFeeTypeDetailList` | [Commission & Fee](by-topic/commission-fee.md) | [L334434](../../../ScriptDB/000_4_CreateSP.sql#L334434) | — | 2 / 0 | — |
| `UBFeeParams` | [Commission & Fee](by-topic/commission-fee.md) | [L334458](../../../ScriptDB/000_4_CreateSP.sql#L334458) | — | 3 / 0 | — |
| `UBFeePlanDetailListSet` | [Commission & Fee](by-topic/commission-fee.md) | [L334523](../../../ScriptDB/000_4_CreateSP.sql#L334523) | 1 / 1 file | 1 / 1 | [Fee.cs:2328](../../../UBClasses/Fee.cs#L2328) |
| `UBFeePlanFundListAll` | [Commission & Fee](by-topic/commission-fee.md) | [L334593](../../../ScriptDB/000_4_CreateSP.sql#L334593) | — | 0 / 0 | — |
| `UBFeePosDAVCalc` | [Commission & Fee](by-topic/commission-fee.md) | [L334655](../../../ScriptDB/000_4_CreateSP.sql#L334655) | — | 0 / 1 | — |
| `UBFeeProcess5Plan` | [Commission & Fee](by-topic/commission-fee.md) | [L334742](../../../ScriptDB/000_4_CreateSP.sql#L334742) | 1 / 1 file | 0 / 1 | [FeeProcessing.cs:399](../../../UBClasses/FeeProcessing.cs#L399) |
| `UBFeeProcessAllPlan_AdditionPortfolioFee` | [Commission & Fee](by-topic/commission-fee.md) | [L334772](../../../ScriptDB/000_4_CreateSP.sql#L334772) | — | 0 / 1 | — |
| `UBFeeProcessAllPlan_AdditionPortfolioFee_Start` | [Commission & Fee](by-topic/commission-fee.md) | [L334813](../../../ScriptDB/000_4_CreateSP.sql#L334813) | — | 0 / 0 | — |
| `UBFeeProcessCheck` | [Commission & Fee](by-topic/commission-fee.md) | [L334858](../../../ScriptDB/000_4_CreateSP.sql#L334858) | 1 / 1 file | 0 / 0 | [FeeProcessing.cs:206](../../../UBClasses/FeeProcessing.cs#L206) |
| `UBFeeProcessDetailInfo` | [Commission & Fee](by-topic/commission-fee.md) | [L334962](../../../ScriptDB/000_4_CreateSP.sql#L334962) | 1 / 1 file | 0 / 1 | [Fee.cs:2063](../../../UBClasses/Fee.cs#L2063) |
| `UBFeeProcessDetailListSet` | [Commission & Fee](by-topic/commission-fee.md) | [L335190](../../../ScriptDB/000_4_CreateSP.sql#L335190) | 1 / 1 file | 0 / 1 | [Fee.cs:1553](../../../UBClasses/Fee.cs#L1553) |
| `UBFeeProcessEnd` | [Commission & Fee](by-topic/commission-fee.md) | [L335419](../../../ScriptDB/000_4_CreateSP.sql#L335419) | 1 / 1 file | 0 / 0 | [FeeProcessing.cs:451](../../../UBClasses/FeeProcessing.cs#L451) |
| `UBFeeProcessGetAssetTypeLink` | [Commission & Fee](by-topic/commission-fee.md) | [L335437](../../../ScriptDB/000_4_CreateSP.sql#L335437) | — | 1 / 0 | — |
| `UBFeeProcessGetClientDAVByPlanID` | [Commission & Fee](by-topic/commission-fee.md) | [L335469](../../../ScriptDB/000_4_CreateSP.sql#L335469) | — | 1 / 1 | — |
| `UBFeeProcessGetHouseHoldDAVByPlanID` | [Commission & Fee](by-topic/commission-fee.md) | [L335516](../../../ScriptDB/000_4_CreateSP.sql#L335516) | — | 1 / 2 | — |
| `UBFeeProcessGetPlanDAV` | [Commission & Fee](by-topic/commission-fee.md) | [L335609](../../../ScriptDB/000_4_CreateSP.sql#L335609) | — | 5 / 1 | — |
| `UBFeeProcessGetPlanDAV_FromTable` | [Commission & Fee](by-topic/commission-fee.md) | [L335683](../../../ScriptDB/000_4_CreateSP.sql#L335683) | — | 2 / 1 | — |
| `UBFeeProcessGetPlanDAV_Special` | [Commission & Fee](by-topic/commission-fee.md) | [L335756](../../../ScriptDB/000_4_CreateSP.sql#L335756) | — | 1 / 1 | — |
| `UBFeeProcessGetPlanDAVTMP` | [Commission & Fee](by-topic/commission-fee.md) | [L335821](../../../ScriptDB/000_4_CreateSP.sql#L335821) | — | 1 / 1 | — |
| `UBFeeProcessInfo` | [Commission & Fee](by-topic/commission-fee.md) | [L335871](../../../ScriptDB/000_4_CreateSP.sql#L335871) | 1 / 1 file | 0 / 0 | [Fee.cs:2011](../../../UBClasses/Fee.cs#L2011) |
| `UBFeeProcessListSet` | [Commission & Fee](by-topic/commission-fee.md) | [L335964](../../../ScriptDB/000_4_CreateSP.sql#L335964) | 1 / 1 file | 0 / 0 | [Fee.cs:1499](../../../UBClasses/Fee.cs#L1499) |
| `UBFeeProcessOneFund_Template` | [Commission & Fee](by-topic/commission-fee.md) | [L335993](../../../ScriptDB/000_4_CreateSP.sql#L335993) | — | 0 / 1 | — |
| `UBFeeProcessOnePlan` | [Commission & Fee](by-topic/commission-fee.md) | [L336288](../../../ScriptDB/000_4_CreateSP.sql#L336288) | — | 1 / 5 | — |
| `UBFeeProcessOnePlan_AdditionPortfolioFee` | [Commission & Fee](by-topic/commission-fee.md) | [L336549](../../../ScriptDB/000_4_CreateSP.sql#L336549) | — | 1 / 5 | — |
| `UBFeeProcessOnePlan_OneFund` | [Commission & Fee](by-topic/commission-fee.md) | [L336822](../../../ScriptDB/000_4_CreateSP.sql#L336822) | — | 1 / 5 | — |
| `UBFeeProcessOnePlanAdvisorFee` | [Commission & Fee](by-topic/commission-fee.md) | [L337066](../../../ScriptDB/000_4_CreateSP.sql#L337066) | — | 0 / 6 | — |
| `UBFeeProcessOnePlanAdvisorFee_FromTable` | [Commission & Fee](by-topic/commission-fee.md) | [L337331](../../../ScriptDB/000_4_CreateSP.sql#L337331) | — | 0 / 4 | — |
| `UBFeeProcessOnePlanAdvisorFee_Special` | [Commission & Fee](by-topic/commission-fee.md) | [L337587](../../../ScriptDB/000_4_CreateSP.sql#L337587) | — | 0 / 4 | — |
| `UBFeeProcessOnePlanAdvisorFeeForceAmountOnCash` | [Commission & Fee](by-topic/commission-fee.md) | [L337807](../../../ScriptDB/000_4_CreateSP.sql#L337807) | — | 0 / 2 | — |
| `UBFeeProcessOnePlanM` | [Commission & Fee](by-topic/commission-fee.md) | [L337978](../../../ScriptDB/000_4_CreateSP.sql#L337978) | — | 0 / 5 | — |
| `UBFeeProcessOnePlanTrusteeFee` | [Commission & Fee](by-topic/commission-fee.md) | [L338222](../../../ScriptDB/000_4_CreateSP.sql#L338222) | — | 1 / 3 | — |
| `UBFeeProcessRedeemInfo` | [Commission & Fee](by-topic/commission-fee.md) | [L338534](../../../ScriptDB/000_4_CreateSP.sql#L338534) | — | 9 / 1 | — |
| `UBFeeProcessRemove` | [Commission & Fee](by-topic/commission-fee.md) | [L338807](../../../ScriptDB/000_4_CreateSP.sql#L338807) | 1 / 1 file | 0 / 3 | [Fee.cs:1940](../../../UBClasses/Fee.cs#L1940) |
| `UBFeeProcessStart` | [Commission & Fee](by-topic/commission-fee.md) | [L338966](../../../ScriptDB/000_4_CreateSP.sql#L338966) | 1 / 1 file | 0 / 1 | [FeeProcessing.cs:265](../../../UBClasses/FeeProcessing.cs#L265) |
| `UBFeeProcessTrustee_AGRA_OneMonth` | [Commission & Fee](by-topic/commission-fee.md) | [L339546](../../../ScriptDB/000_4_CreateSP.sql#L339546) | — | 0 / 1 | — |
| `UBFeeProcessTrustee_AGRA_OneMonth_OneDealerCode` | [Commission & Fee](by-topic/commission-fee.md) | [L339572](../../../ScriptDB/000_4_CreateSP.sql#L339572) | — | 1 / 1 | — |
| `UBFeeProcessUndoCommission` | [Commission & Fee](by-topic/commission-fee.md) | [L339665](../../../ScriptDB/000_4_CreateSP.sql#L339665) | 1 / 1 file | 1 / 2 | [Fee.cs:1829](../../../UBClasses/Fee.cs#L1829) |
| `UBFeeProcessUndoCommissionTaggedItems` | [Commission & Fee](by-topic/commission-fee.md) | [L339752](../../../ScriptDB/000_4_CreateSP.sql#L339752) | 1 / 1 file | 0 / 1 | [Fee.cs:1886](../../../UBClasses/Fee.cs#L1886) |
| `UBFeeRecalcAdvisorList` | [Commission & Fee](by-topic/commission-fee.md) | [L339834](../../../ScriptDB/000_4_CreateSP.sql#L339834) | — | 0 / 1 | — |
| `UBFeeRecalcAdvisorOnePlan` | [Commission & Fee](by-topic/commission-fee.md) | [L339879](../../../ScriptDB/000_4_CreateSP.sql#L339879) | — | 1 / 2 | — |
| `UBFeeRunListSet` | [Commission & Fee](by-topic/commission-fee.md) | [L339925](../../../ScriptDB/000_4_CreateSP.sql#L339925) | — | 0 / 0 | — |
| `UBFeeSelectionUpdate` | [Commission & Fee](by-topic/commission-fee.md) | [L340109](../../../ScriptDB/000_4_CreateSP.sql#L340109) | — | 0 / 0 | — |
| `UBFeeTaxOptionList` | [Commission & Fee](by-topic/commission-fee.md) | [L340144](../../../ScriptDB/000_4_CreateSP.sql#L340144) | — | 3 / 0 | — |
| `UBFeeTemplateAdd` | [Commission & Fee](by-topic/commission-fee.md) | [L340176](../../../ScriptDB/000_4_CreateSP.sql#L340176) | 1 / 1 file | 0 / 0 | [Fee.cs:538](../../../UBClasses/Fee.cs#L538) |
| `UBFeeTemplateList` | [Commission & Fee](by-topic/commission-fee.md) | [L340313](../../../ScriptDB/000_4_CreateSP.sql#L340313) | 2 / 1 file | 1 / 0 | [Fee.cs:346](../../../UBClasses/Fee.cs#L346) |
| `UBFeeTemplateModify` | [Commission & Fee](by-topic/commission-fee.md) | [L340411](../../../ScriptDB/000_4_CreateSP.sql#L340411) | 1 / 1 file | 0 / 0 | [Fee.cs:538](../../../UBClasses/Fee.cs#L538) |
| `UBFeeTemplateRemove` | [Commission & Fee](by-topic/commission-fee.md) | [L340549](../../../ScriptDB/000_4_CreateSP.sql#L340549) | 1 / 1 file | 0 / 0 | [Fee.cs:480](../../../UBClasses/Fee.cs#L480) |
| `UBFeeTemplateTierList` | [Commission & Fee](by-topic/commission-fee.md) | [L340589](../../../ScriptDB/000_4_CreateSP.sql#L340589) | — | 1 / 0 | — |
| `UBFeeTransferFeeTypeDetailList` | [Commission & Fee](by-topic/commission-fee.md) | [L340622](../../../ScriptDB/000_4_CreateSP.sql#L340622) | — | 2 / 0 | — |
| `UBFeeTrusteeAmountList` | [Commission & Fee](by-topic/commission-fee.md) | [L340646](../../../ScriptDB/000_4_CreateSP.sql#L340646) | — | 1 / 0 | — |
| `UBFeeTrusteeFeeTypeDetailList` | [Commission & Fee](by-topic/commission-fee.md) | [L340669](../../../ScriptDB/000_4_CreateSP.sql#L340669) | — | 1 / 0 | — |
| `UBFeeTrusteeRefresh` | [Commission & Fee](by-topic/commission-fee.md) | [L340693](../../../ScriptDB/000_4_CreateSP.sql#L340693) | 1 / 1 file | 1 / 2 | [Fee.cs:1232](../../../UBClasses/Fee.cs#L1232) |
| `UBFeeTrusteeRefresh_Extra` | [Commission & Fee](by-topic/commission-fee.md) | [L340912](../../../ScriptDB/000_4_CreateSP.sql#L340912) | — | 0 / 1 | — |
| `UBFeeTrusteeRefresh1Client` | [Commission & Fee](by-topic/commission-fee.md) | [L340942](../../../ScriptDB/000_4_CreateSP.sql#L340942) | — | 5 / 1 | — |
| `UBFeeTrusteeRefresh1List` | [Commission & Fee](by-topic/commission-fee.md) | [L341393](../../../ScriptDB/000_4_CreateSP.sql#L341393) | — | 1 / 0 | — |
| `UBFeeTrusteeRescan4HISAGICOnly` | [Commission & Fee](by-topic/commission-fee.md) | [L341544](../../../ScriptDB/000_4_CreateSP.sql#L341544) | — | 1 / 0 | — |
| `UBFeeTypeDetailAdd` | [Commission & Fee](by-topic/commission-fee.md) | [L341599](../../../ScriptDB/000_4_CreateSP.sql#L341599) | 1 / 1 file | 0 / 0 | [FeeTypeDetail.cs:285](../../../UBClasses/FeeTypeDetail.cs#L285) |
| `UBFeeTypeDetailInfo` | [Commission & Fee](by-topic/commission-fee.md) | [L341696](../../../ScriptDB/000_4_CreateSP.sql#L341696) | 1 / 1 file | 0 / 0 | [FeeTypeDetail.cs:181](../../../UBClasses/FeeTypeDetail.cs#L181) |
| `UBFeeTypeDetailList` | [Commission & Fee](by-topic/commission-fee.md) | [L341722](../../../ScriptDB/000_4_CreateSP.sql#L341722) | 1 / 1 file | 0 / 0 | [FeeTypeDetail.cs:96](../../../UBClasses/FeeTypeDetail.cs#L96) |
| `UBFeeTypeDetailRemove` | [Commission & Fee](by-topic/commission-fee.md) | [L341791](../../../ScriptDB/000_4_CreateSP.sql#L341791) | 1 / 1 file | 0 / 0 | [FeeTypeDetail.cs:233](../../../UBClasses/FeeTypeDetail.cs#L233) |
| `UBFeeTypeDetailUpdate` | [Commission & Fee](by-topic/commission-fee.md) | [L341812](../../../ScriptDB/000_4_CreateSP.sql#L341812) | 1 / 1 file | 0 / 0 | [FeeTypeDetail.cs:285](../../../UBClasses/FeeTypeDetail.cs#L285) |
| `UBFeeTypeList` | [Commission & Fee](by-topic/commission-fee.md) | [L341914](../../../ScriptDB/000_4_CreateSP.sql#L341914) | — | 3 / 0 | — |
| `UBFeeTypeListManual` | [Commission & Fee](by-topic/commission-fee.md) | [L341945](../../../ScriptDB/000_4_CreateSP.sql#L341945) | — | 2 / 0 | — |
| `UBFEInit` | [Shared / Other](by-topic/shared-other.md) | [L341976](../../../ScriptDB/000_4_CreateSP.sql#L341976) | — | 1 / 1 | — |
| `UBFEInit_AGCH` | [Shared / Other](by-topic/shared-other.md) | [L342156](../../../ScriptDB/000_4_CreateSP.sql#L342156) | — | 1 / 0 | — |
| `UBFEInit_AGRP` | [Shared / Other](by-topic/shared-other.md) | [L342192](../../../ScriptDB/000_4_CreateSP.sql#L342192) | — | 1 / 1 | — |
| `UBFEInit_ByTradeDate` | [Trading & Orders](by-topic/trading-orders.md) | [L342278](../../../ScriptDB/000_4_CreateSP.sql#L342278) | — | 1 / 1 | — |
| `UBFF_Add` | [Shared / Other](by-topic/shared-other.md) | [L342427](../../../ScriptDB/000_4_CreateSP.sql#L342427) | 1 / 1 file | 0 / 0 | [FFImport.cs:2021](../../../UBFFImport/FFImport.cs#L2021) |
| `UBFF_End` | [Shared / Other](by-topic/shared-other.md) | [L342469](../../../ScriptDB/000_4_CreateSP.sql#L342469) | 1 / 1 file | 0 / 0 | [FFImport.cs:2068](../../../UBFFImport/FFImport.cs#L2068) |
| `UBFFRecAAInsert` | [Shared / Other](by-topic/shared-other.md) | [L342504](../../../ScriptDB/000_4_CreateSP.sql#L342504) | — | 0 / 0 | — |
| `UBFFRecAAInsertEnd` | [Shared / Other](by-topic/shared-other.md) | [L342651](../../../ScriptDB/000_4_CreateSP.sql#L342651) | — | 0 / 0 | — |
| `UBFFRecAAProcess` | [Shared / Other](by-topic/shared-other.md) | [L342664](../../../ScriptDB/000_4_CreateSP.sql#L342664) | 1 / 1 file | 0 / 1 | [CAA.cs:2607](../../../UBFFImport/CAA.cs#L2607) |
| `UBFFRecAAProcessOneRecord` | [Shared / Other](by-topic/shared-other.md) | [L342713](../../../ScriptDB/000_4_CreateSP.sql#L342713) | — | 1 / 17 | — |
| `UBFFRecAEAccountList` | [Account & Plan](by-topic/account-plan.md) | [L343549](../../../ScriptDB/000_4_CreateSP.sql#L343549) | 1 / 1 file | 0 / 0 | [CAE.cs:211](../../../UBFFImport/CAE.cs#L211) |
| `UBFFRecAEFundList` | [Fund & GIC](by-topic/fund-gic.md) | [L343574](../../../ScriptDB/000_4_CreateSP.sql#L343574) | 1 / 1 file | 0 / 0 | [CAE.cs:354](../../../UBFFImport/CAE.cs#L354) |
| `UBFFRecAEInsert` | [Shared / Other](by-topic/shared-other.md) | [L343595](../../../ScriptDB/000_4_CreateSP.sql#L343595) | — | 0 / 0 | — |
| `UBFFRecAEInsertEnd` | [Shared / Other](by-topic/shared-other.md) | [L343672](../../../ScriptDB/000_4_CreateSP.sql#L343672) | — | 0 / 0 | — |
| `UBFFRecAEProcess` | [Shared / Other](by-topic/shared-other.md) | [L343697](../../../ScriptDB/000_4_CreateSP.sql#L343697) | 1 / 1 file | 0 / 1 | [CAE.cs:158](../../../UBFFImport/CAE.cs#L158) |
| `UBFFRecAEProcessOneAccount` | [Account & Plan](by-topic/account-plan.md) | [L343744](../../../ScriptDB/000_4_CreateSP.sql#L343744) | 1 / 1 file | 0 / 1 | [CAE.cs:256](../../../UBFFImport/CAE.cs#L256) |
| `UBFFRecAEProcessOnePosition` | [Shared / Other](by-topic/shared-other.md) | [L344029](../../../ScriptDB/000_4_CreateSP.sql#L344029) | — | 1 / 0 | — |
| `UBFFRecAEProcessOneRecord` | [Shared / Other](by-topic/shared-other.md) | [L344163](../../../ScriptDB/000_4_CreateSP.sql#L344163) | — | 1 / 2 | — |
| `UBFFRecAFInsert` | [Shared / Other](by-topic/shared-other.md) | [L344251](../../../ScriptDB/000_4_CreateSP.sql#L344251) | — | 0 / 0 | — |
| `UBFFRecAPProcessOneRecord` | [Shared / Other](by-topic/shared-other.md) | [L344298](../../../ScriptDB/000_4_CreateSP.sql#L344298) | 1 / 1 file | 0 / 0 | [CAP.cs:163](../../../UBFFImport/CAP.cs#L163) |
| `UBFFRecASFNDInsert` | [Shared / Other](by-topic/shared-other.md) | [L344496](../../../ScriptDB/000_4_CreateSP.sql#L344496) | — | 0 / 0 | — |
| `UBFFRecASFNDInsertEnd` | [Shared / Other](by-topic/shared-other.md) | [L344580](../../../ScriptDB/000_4_CreateSP.sql#L344580) | — | 0 / 0 | — |
| `UBFFRecASFNDProcess` | [Shared / Other](by-topic/shared-other.md) | [L344593](../../../ScriptDB/000_4_CreateSP.sql#L344593) | — | 0 / 1 | — |
| `UBFFRecASFNDProcessOneRecord` | [Shared / Other](by-topic/shared-other.md) | [L344642](../../../ScriptDB/000_4_CreateSP.sql#L344642) | — | 1 / 1 | — |
| `UBFFRecASInsert` | [Shared / Other](by-topic/shared-other.md) | [L344765](../../../ScriptDB/000_4_CreateSP.sql#L344765) | — | 0 / 0 | — |
| `UBFFRecASInsertEnd` | [Shared / Other](by-topic/shared-other.md) | [L344847](../../../ScriptDB/000_4_CreateSP.sql#L344847) | — | 0 / 0 | — |
| `UBFFRecASProcess` | [Shared / Other](by-topic/shared-other.md) | [L344860](../../../ScriptDB/000_4_CreateSP.sql#L344860) | 1 / 1 file | 0 / 1 | [CAS.cs:226](../../../UBFFImport/CAS.cs#L226) |
| `UBFFRecASProcessOneRecord` | [Shared / Other](by-topic/shared-other.md) | [L344909](../../../ScriptDB/000_4_CreateSP.sql#L344909) | — | 1 / 2 | — |
| `UBFFRecATInsert` | [Shared / Other](by-topic/shared-other.md) | [L345046](../../../ScriptDB/000_4_CreateSP.sql#L345046) | — | 0 / 0 | — |
| `UBFFRecATInsertEnd` | [Shared / Other](by-topic/shared-other.md) | [L345204](../../../ScriptDB/000_4_CreateSP.sql#L345204) | — | 0 / 0 | — |
| `UBFFRecATProcess` | [Shared / Other](by-topic/shared-other.md) | [L345228](../../../ScriptDB/000_4_CreateSP.sql#L345228) | 1 / 1 file | 0 / 1 | [CAT.cs:229](../../../UBFFImport/CAT.cs#L229) |
| `UBFFRecATProcessCWTCash` | [Account & Plan](by-topic/account-plan.md) | [L345278](../../../ScriptDB/000_4_CreateSP.sql#L345278) | — | 1 / 1 | — |
| `UBFFRecATProcessOneRecord` | [Shared / Other](by-topic/shared-other.md) | [L345502](../../../ScriptDB/000_4_CreateSP.sql#L345502) | — | 3 / 10 | — |
| `UBFFRecATUpdateAccount` | [Account & Plan](by-topic/account-plan.md) | [L346499](../../../ScriptDB/000_4_CreateSP.sql#L346499) | — | 2 / 0 | — |
| `UBFFRecATUpdateAccountPos` | [Account & Plan](by-topic/account-plan.md) | [L346542](../../../ScriptDB/000_4_CreateSP.sql#L346542) | — | 15 / 0 | — |
| `UBFFRecATUpdatePlan` | [Account & Plan](by-topic/account-plan.md) | [L346623](../../../ScriptDB/000_4_CreateSP.sql#L346623) | — | 2 / 0 | — |
| `UBFFRecAWGetHeader` | [Shared / Other](by-topic/shared-other.md) | [L346658](../../../ScriptDB/000_4_CreateSP.sql#L346658) | — | 2 / 0 | — |
| `UBFFRecAWInsert` | [Shared / Other](by-topic/shared-other.md) | [L346719](../../../ScriptDB/000_4_CreateSP.sql#L346719) | — | 0 / 0 | — |
| `UBFFRecAWInsertEnd` | [Shared / Other](by-topic/shared-other.md) | [L346837](../../../ScriptDB/000_4_CreateSP.sql#L346837) | — | 0 / 0 | — |
| `UBFFRecAWProcess` | [Shared / Other](by-topic/shared-other.md) | [L346850](../../../ScriptDB/000_4_CreateSP.sql#L346850) | 1 / 1 file | 0 / 1 | [CAW.cs:170](../../../UBFFImport/CAW.cs#L170) |
| `UBFFRecAWProcessOneRecord` | [Shared / Other](by-topic/shared-other.md) | [L346899](../../../ScriptDB/000_4_CreateSP.sql#L346899) | — | 1 / 2 | — |
| `UBFFRecDefAA` | [Shared / Other](by-topic/shared-other.md) | [L347162](../../../ScriptDB/000_4_CreateSP.sql#L347162) | — | 0 / 0 | — |
| `UBFFRecDefAE` | [Shared / Other](by-topic/shared-other.md) | [L347189](../../../ScriptDB/000_4_CreateSP.sql#L347189) | — | 0 / 0 | — |
| `UBFFRecDefAP` | [Shared / Other](by-topic/shared-other.md) | [L347216](../../../ScriptDB/000_4_CreateSP.sql#L347216) | — | 0 / 0 | — |
| `UBFFRecDefAS` | [Shared / Other](by-topic/shared-other.md) | [L347243](../../../ScriptDB/000_4_CreateSP.sql#L347243) | — | 0 / 0 | — |
| `UBFFRecDefAT` | [Shared / Other](by-topic/shared-other.md) | [L347281](../../../ScriptDB/000_4_CreateSP.sql#L347281) | — | 0 / 0 | — |
| `UBFFRecDefAW` | [Shared / Other](by-topic/shared-other.md) | [L347313](../../../ScriptDB/000_4_CreateSP.sql#L347313) | — | 0 / 0 | — |
| `UBFFRecDefFE` | [Shared / Other](by-topic/shared-other.md) | [L347340](../../../ScriptDB/000_4_CreateSP.sql#L347340) | — | 0 / 0 | — |
| `UBFFRecDefFF` | [Shared / Other](by-topic/shared-other.md) | [L347367](../../../ScriptDB/000_4_CreateSP.sql#L347367) | — | 0 / 0 | — |
| `UBFFRecDefFG` | [Shared / Other](by-topic/shared-other.md) | [L347395](../../../ScriptDB/000_4_CreateSP.sql#L347395) | — | 0 / 0 | — |
| `UBFFRecDefSCAcct` | [Shared / Other](by-topic/shared-other.md) | [L347422](../../../ScriptDB/000_4_CreateSP.sql#L347422) | — | 0 / 0 | — |
| `UBFFRecDefSCTrx` | [Trading & Orders](by-topic/trading-orders.md) | [L347449](../../../ScriptDB/000_4_CreateSP.sql#L347449) | — | 0 / 0 | — |
| `UBFFRecFEInsert` | [Shared / Other](by-topic/shared-other.md) | [L347476](../../../ScriptDB/000_4_CreateSP.sql#L347476) | — | 0 / 0 | — |
| `UBFFRecFEInsertEnd` | [Shared / Other](by-topic/shared-other.md) | [L347735](../../../ScriptDB/000_4_CreateSP.sql#L347735) | — | 0 / 0 | — |
| `UBFFRecFEProcess` | [Shared / Other](by-topic/shared-other.md) | [L347759](../../../ScriptDB/000_4_CreateSP.sql#L347759) | 1 / 1 file | 0 / 1 | [CFE.cs:159](../../../UBFFImport/CFE.cs#L159) |
| `UBFFRecFEProcessOneRecord` | [Shared / Other](by-topic/shared-other.md) | [L347806](../../../ScriptDB/000_4_CreateSP.sql#L347806) | — | 3 / 8 | — |
| `UBFFRecFFInsert` | [Shared / Other](by-topic/shared-other.md) | [L349113](../../../ScriptDB/000_4_CreateSP.sql#L349113) | — | 0 / 0 | — |
| `UBFFRecFFInsertEnd` | [Shared / Other](by-topic/shared-other.md) | [L349160](../../../ScriptDB/000_4_CreateSP.sql#L349160) | — | 0 / 0 | — |
| `UBFFRecFFProcess` | [Shared / Other](by-topic/shared-other.md) | [L349173](../../../ScriptDB/000_4_CreateSP.sql#L349173) | 2 / 2 file | 0 / 1 | [CFF.cs:160](../../../UBFFImport/CFF.cs#L160) |
| `UBFFRecFFProcessOneRecord` | [Shared / Other](by-topic/shared-other.md) | [L349221](../../../ScriptDB/000_4_CreateSP.sql#L349221) | — | 1 / 1 | — |
| `UBFFRecFGInsert` | [Shared / Other](by-topic/shared-other.md) | [L349329](../../../ScriptDB/000_4_CreateSP.sql#L349329) | — | 0 / 0 | — |
| `UBFFRecFGInsertEnd` | [Shared / Other](by-topic/shared-other.md) | [L349540](../../../ScriptDB/000_4_CreateSP.sql#L349540) | — | 0 / 0 | — |
| `UBFFRecFGProcess` | [Shared / Other](by-topic/shared-other.md) | [L349553](../../../ScriptDB/000_4_CreateSP.sql#L349553) | 1 / 1 file | 0 / 1 | [CFG.cs:160](../../../UBFFImport/CFG.cs#L160) |
| `UBFFRecFGProcessOneRecord` | [Shared / Other](by-topic/shared-other.md) | [L349617](../../../ScriptDB/000_4_CreateSP.sql#L349617) | — | 1 / 10 | — |
| `UBFFRecInsert` | [Shared / Other](by-topic/shared-other.md) | [L350596](../../../ScriptDB/000_4_CreateSP.sql#L350596) | 1 / 1 file | 0 / 0 | [FFImport.cs:3715](../../../UBFFImport/FFImport.cs#L3715) |
| `UBFFRecSCAcctInsert` | [Shared / Other](by-topic/shared-other.md) | [L350614](../../../ScriptDB/000_4_CreateSP.sql#L350614) | — | 0 / 0 | — |
| `UBFFRecSCAcctInsertEnd` | [Shared / Other](by-topic/shared-other.md) | [L350676](../../../ScriptDB/000_4_CreateSP.sql#L350676) | — | 0 / 0 | — |
| `UBFFRecScotiaTrxProcess` | [Trading & Orders](by-topic/trading-orders.md) | [L350689](../../../ScriptDB/000_4_CreateSP.sql#L350689) | 1 / 1 file | 0 / 1 | [ScotiaTrx.cs:161](../../../UBFFImport/ScotiaTrx.cs#L161) |
| `UBFFRecScotiaTrxProcessOneRecord` | [Trading & Orders](by-topic/trading-orders.md) | [L350745](../../../ScriptDB/000_4_CreateSP.sql#L350745) | — | 3 / 3 | — |
| `UBFFRecScotiaTrxProcessOneRecordX` | [Trading & Orders](by-topic/trading-orders.md) | [L350996](../../../ScriptDB/000_4_CreateSP.sql#L350996) | — | 0 / 1 | — |
| `UBFFRecSCTrxInsert` | [Trading & Orders](by-topic/trading-orders.md) | [L351015](../../../ScriptDB/000_4_CreateSP.sql#L351015) | — | 0 / 0 | — |
| `UBFFRecSCTrxInsertEnd` | [Trading & Orders](by-topic/trading-orders.md) | [L351142](../../../ScriptDB/000_4_CreateSP.sql#L351142) | — | 0 / 0 | — |
| `UBFindDuplicatePosition` | [Shared / Other](by-topic/shared-other.md) | [L351156](../../../ScriptDB/000_4_CreateSP.sql#L351156) | — | 0 / 0 | — |
| `UBFindInactivePositionWithUnit` | [Shared / Other](by-topic/shared-other.md) | [L351206](../../../ScriptDB/000_4_CreateSP.sql#L351206) | — | 0 / 0 | — |
| `UBFINTRAC_CCASL_Add` | [Compliance](by-topic/compliance.md) | [L351227](../../../ScriptDB/000_4_CreateSP.sql#L351227) | — | 0 / 1 | — |
| `UBFINTRAC_CCASL_CountryCode` | [Compliance](by-topic/compliance.md) | [L351265](../../../ScriptDB/000_4_CreateSP.sql#L351265) | — | 2 / 0 | — |
| `UBFINTRAC_CCASL_End` | [Compliance](by-topic/compliance.md) | [L351326](../../../ScriptDB/000_4_CreateSP.sql#L351326) | — | 0 / 0 | — |
| `UBFINTRACAdd` | [Compliance](by-topic/compliance.md) | [L351350](../../../ScriptDB/000_4_CreateSP.sql#L351350) | — | 0 / 1 | — |
| `UBFintracCCASLGroupList` | [Compliance](by-topic/compliance.md) | [L351452](../../../ScriptDB/000_4_CreateSP.sql#L351452) | — | 1 / 0 | — |
| `UBFINTRACClear` | [Compliance](by-topic/compliance.md) | [L351478](../../../ScriptDB/000_4_CreateSP.sql#L351478) | — | 0 / 0 | — |
| `UBFINTRACComboList` | [Compliance](by-topic/compliance.md) | [L351501](../../../ScriptDB/000_4_CreateSP.sql#L351501) | — | 0 / 3 | — |
| `UBFintracDocTypeList` | [Compliance](by-topic/compliance.md) | [L351528](../../../ScriptDB/000_4_CreateSP.sql#L351528) | — | 2 / 0 | — |
| `UBFINTRACEnd` | [Compliance](by-topic/compliance.md) | [L351554](../../../ScriptDB/000_4_CreateSP.sql#L351554) | — | 0 / 0 | — |
| `UBFINTRACList` | [Compliance](by-topic/compliance.md) | [L351588](../../../ScriptDB/000_4_CreateSP.sql#L351588) | 2 / 1 file | 0 / 0 | [FINTRAC.cs:748](../../../UBClasses/FINTRAC.cs#L748) |
| `UBFINTRACRemoveItem` | [Compliance](by-topic/compliance.md) | [L351699](../../../ScriptDB/000_4_CreateSP.sql#L351699) | — | 0 / 0 | — |
| `UBFINTRACScan50` | [Compliance](by-topic/compliance.md) | [L351724](../../../ScriptDB/000_4_CreateSP.sql#L351724) | — | 0 / 0 | — |
| `UBFINTRACScanStart` | [Compliance](by-topic/compliance.md) | [L351748](../../../ScriptDB/000_4_CreateSP.sql#L351748) | — | 0 / 0 | — |
| `UBFINTRACUpdate` | [Compliance](by-topic/compliance.md) | [L351779](../../../ScriptDB/000_4_CreateSP.sql#L351779) | — | 0 / 0 | — |
| `UBFormAdd` | [Documents & PDF](by-topic/documents-pdf.md) | [L351853](../../../ScriptDB/000_4_CreateSP.sql#L351853) | — | 3 / 0 | — |
| `UBFormChangeFileName` | [Documents & PDF](by-topic/documents-pdf.md) | [L351935](../../../ScriptDB/000_4_CreateSP.sql#L351935) | — | 0 / 0 | — |
| `UBFormChangeOrderByName` | [Trading & Orders](by-topic/trading-orders.md) | [L351965](../../../ScriptDB/000_4_CreateSP.sql#L351965) | — | 0 / 0 | — |
| `UBFormCheckSigPosDate` | [Documents & PDF](by-topic/documents-pdf.md) | [L351993](../../../ScriptDB/000_4_CreateSP.sql#L351993) | 1 / 1 file | 0 / 0 | [Forms.cs:1147](../../../UBClasses/Forms.cs#L1147) |
| `UBFormClientBank` | [Client & KYC](by-topic/client-kyc.md) | [L352023](../../../ScriptDB/000_4_CreateSP.sql#L352023) | — | 1 / 0 | — |
| `UBFormClientSet` | [Client & KYC](by-topic/client-kyc.md) | [L352096](../../../ScriptDB/000_4_CreateSP.sql#L352096) | 1 / 1 file | 0 / 1 | [CForm.cs:967](../../../VieFUNDPdf/CForm.cs#L967) |
| `UBFormClientWF` | [Client & KYC](by-topic/client-kyc.md) | [L352184](../../../ScriptDB/000_4_CreateSP.sql#L352184) | 1 / 1 file | 1 / 8 | [Forms.cs:641](../../../UBClasses/Forms.cs#L641) |
| `UBFormDelete` | [Documents & PDF](by-topic/documents-pdf.md) | [L354493](../../../ScriptDB/000_4_CreateSP.sql#L354493) | — | 0 / 0 | — |
| `UBFormFileList` | [Documents & PDF](by-topic/documents-pdf.md) | [L354523](../../../ScriptDB/000_4_CreateSP.sql#L354523) | 1 / 1 file | 2 / 0 | [Forms.cs:1025](../../../UBClasses/Forms.cs#L1025) |
| `UBFormFileName` | [Documents & PDF](by-topic/documents-pdf.md) | [L354570](../../../ScriptDB/000_4_CreateSP.sql#L354570) | — | 0 / 0 | — |
| `UBFormFileRemove` | [Documents & PDF](by-topic/documents-pdf.md) | [L354613](../../../ScriptDB/000_4_CreateSP.sql#L354613) | — | 0 / 0 | — |
| `UBFormGetGICInfoOne` | [Fund & GIC](by-topic/fund-gic.md) | [L354650](../../../ScriptDB/000_4_CreateSP.sql#L354650) | — | 0 / 2 | — |
| `UBFormGetGICTicket` | [Fund & GIC](by-topic/fund-gic.md) | [L355107](../../../ScriptDB/000_4_CreateSP.sql#L355107) | — | 0 / 0 | — |
| `UBFormGetGICTicketInfo` | [Fund & GIC](by-topic/fund-gic.md) | [L355146](../../../ScriptDB/000_4_CreateSP.sql#L355146) | — | 0 / 0 | — |
| `UBFormGetGICTicketInfoOne` | [Fund & GIC](by-topic/fund-gic.md) | [L355219](../../../ScriptDB/000_4_CreateSP.sql#L355219) | — | 0 / 0 | — |
| `UBFormGetInfoSpec` | [Documents & PDF](by-topic/documents-pdf.md) | [L355695](../../../ScriptDB/000_4_CreateSP.sql#L355695) | — | 0 / 0 | — |
| `UBFormGetSigPosSet` | [Documents & PDF](by-topic/documents-pdf.md) | [L355738](../../../ScriptDB/000_4_CreateSP.sql#L355738) | 1 / 1 file | 0 / 0 | [CForm.cs:3034](../../../VieFUNDPdf/CForm.cs#L3034) |
| `UBFormGetTradeTicket` | [Trading & Orders](by-topic/trading-orders.md) | [L355779](../../../ScriptDB/000_4_CreateSP.sql#L355779) | — | 0 / 0 | — |
| `UBFormGetTradeTicketInfo` | [Trading & Orders](by-topic/trading-orders.md) | [L355816](../../../ScriptDB/000_4_CreateSP.sql#L355816) | — | 0 / 0 | — |
| `UBFormGetTradeTicketInfoOne` | [Trading & Orders](by-topic/trading-orders.md) | [L355970](../../../ScriptDB/000_4_CreateSP.sql#L355970) | — | 0 / 0 | — |
| `UBFormInfo` | [Documents & PDF](by-topic/documents-pdf.md) | [L356975](../../../ScriptDB/000_4_CreateSP.sql#L356975) | 1 / 1 file | 0 / 1 | [Forms.cs:272](../../../UBClasses/Forms.cs#L272) |
| `UBFormInfoX` | [Documents & PDF](by-topic/documents-pdf.md) | [L357007](../../../ScriptDB/000_4_CreateSP.sql#L357007) | 1 / 1 file | 0 / 1 | [Forms.cs:326](../../../UBClasses/Forms.cs#L326) |
| `UBFormKYCList` | [Client & KYC](by-topic/client-kyc.md) | [L357385](../../../ScriptDB/000_4_CreateSP.sql#L357385) | — | 1 / 0 | — |
| `UBFormLoanSet` | [Documents & PDF](by-topic/documents-pdf.md) | [L357409](../../../ScriptDB/000_4_CreateSP.sql#L357409) | — | 0 / 6 | — |
| `UBFormObjAdd2Env` | [Documents & PDF](by-topic/documents-pdf.md) | [L357717](../../../ScriptDB/000_4_CreateSP.sql#L357717) | 1 / 1 file | 0 / 5 | [Forms.cs:1353](../../../UBClasses/Forms.cs#L1353) |
| `UBFormRedemptionProcessingSet` | [Trading & Orders](by-topic/trading-orders.md) | [L358174](../../../ScriptDB/000_4_CreateSP.sql#L358174) | — | 0 / 0 | — |
| `UBFormSave1SigPos` | [Documents & PDF](by-topic/documents-pdf.md) | [L358402](../../../ScriptDB/000_4_CreateSP.sql#L358402) | 1 / 1 file | 0 / 0 | [Forms.cs:1094](../../../UBClasses/Forms.cs#L1094) |
| `UBFormSaveSetting` | [Documents & PDF](by-topic/documents-pdf.md) | [L358436](../../../ScriptDB/000_4_CreateSP.sql#L358436) | 1 / 1 file | 0 / 0 | [Forms.cs:1298](../../../UBClasses/Forms.cs#L1298) |
| `UBFormSettingInfo` | [Documents & PDF](by-topic/documents-pdf.md) | [L358490](../../../ScriptDB/000_4_CreateSP.sql#L358490) | 1 / 1 file | 5 / 0 | [CVFDocSign.cs:1890](../../../VFDocSign/CVFDocSign.cs#L1890) |
| `UBFormSettingSaveToken` | [Security & Auth](by-topic/security-auth.md) | [L358524](../../../ScriptDB/000_4_CreateSP.sql#L358524) | — | 0 / 0 | — |
| `UBFormsList` | [Documents & PDF](by-topic/documents-pdf.md) | [L358556](../../../ScriptDB/000_4_CreateSP.sql#L358556) | 1 / 1 file | 0 / 1 | [Forms.cs:58](../../../UBClasses/Forms.cs#L58) |
| `UBFormsListDetail` | [Documents & PDF](by-topic/documents-pdf.md) | [L358661](../../../ScriptDB/000_4_CreateSP.sql#L358661) | 1 / 1 file | 0 / 0 | [Forms.cs:216](../../../UBClasses/Forms.cs#L216) |
| `UBFormsListSupplier` | [Documents & PDF](by-topic/documents-pdf.md) | [L358788](../../../ScriptDB/000_4_CreateSP.sql#L358788) | 1 / 1 file | 0 / 0 | [Forms.cs:114](../../../UBClasses/Forms.cs#L114) |
| `UBFormTargetID` | [Documents & PDF](by-topic/documents-pdf.md) | [L358900](../../../ScriptDB/000_4_CreateSP.sql#L358900) | — | 0 / 0 | — |
| `UBFormTypeList` | [Documents & PDF](by-topic/documents-pdf.md) | [L358920](../../../ScriptDB/000_4_CreateSP.sql#L358920) | — | 2 / 0 | — |
| `UBFormUpdate` | [Documents & PDF](by-topic/documents-pdf.md) | [L358951](../../../ScriptDB/000_4_CreateSP.sql#L358951) | — | 0 / 0 | — |
| `UBFormViewComboList` | [Documents & PDF](by-topic/documents-pdf.md) | [L359028](../../../ScriptDB/000_4_CreateSP.sql#L359028) | — | 0 / 2 | — |
| `UBFQRFileAddFromTaggedFiles` | [Shared / Other](by-topic/shared-other.md) | [L359069](../../../ScriptDB/000_4_CreateSP.sql#L359069) | 1 / 1 file | 0 / 1 | [FQR.cs:180](../../../UBExport/FQR.cs#L180) |
| `UBFQRFileAddOne` | [Shared / Other](by-topic/shared-other.md) | [L359177](../../../ScriptDB/000_4_CreateSP.sql#L359177) | — | 0 / 0 | — |
| `UBFQRMonthList` | [Shared / Other](by-topic/shared-other.md) | [L359228](../../../ScriptDB/000_4_CreateSP.sql#L359228) | — | 1 / 0 | — |
| `UBFQRProcessSaleComm` | [Commission & Fee](by-topic/commission-fee.md) | [L359268](../../../ScriptDB/000_4_CreateSP.sql#L359268) | 1 / 1 file | 0 / 0 | [FQR.cs:251](../../../UBExport/FQR.cs#L251) |
| `UBFQRProcessServiceFee` | [Commission & Fee](by-topic/commission-fee.md) | [L359379](../../../ScriptDB/000_4_CreateSP.sql#L359379) | 1 / 1 file | 0 / 0 | [FQR.cs:216](../../../UBExport/FQR.cs#L216) |
| `UBFQRResult` | [Shared / Other](by-topic/shared-other.md) | [L359507](../../../ScriptDB/000_4_CreateSP.sql#L359507) | 2 / 2 file | 0 / 0 | [Commission.cs:43](../../../UBExport/Commission.cs#L43) |
| `UBFQRTagFileInfo` | [Shared / Other](by-topic/shared-other.md) | [L360050](../../../ScriptDB/000_4_CreateSP.sql#L360050) | 1 / 1 file | 0 / 0 | [FQR.cs:1081](../../../UBExport/FQR.cs#L1081) |
| `UBFrequencyList` | [Shared / Other](by-topic/shared-other.md) | [L360105](../../../ScriptDB/000_4_CreateSP.sql#L360105) | — | 10 / 0 | — |
| `UBFSClientAdd` | [Client & KYC](by-topic/client-kyc.md) | [L360144](../../../ScriptDB/000_4_CreateSP.sql#L360144) | — | 2 / 1 | — |
| `UBFSClientAddressAdd` | [Client & KYC](by-topic/client-kyc.md) | [L360202](../../../ScriptDB/000_4_CreateSP.sql#L360202) | — | 2 / 2 | — |
| `UBFSClientAddressDup` | [Client & KYC](by-topic/client-kyc.md) | [L360244](../../../ScriptDB/000_4_CreateSP.sql#L360244) | — | 2 / 0 | — |
| `UBFSClientSpouseLink` | [Client & KYC](by-topic/client-kyc.md) | [L360275](../../../ScriptDB/000_4_CreateSP.sql#L360275) | — | 2 / 0 | — |
| `UBFSClientUpdate` | [Client & KYC](by-topic/client-kyc.md) | [L360304](../../../ScriptDB/000_4_CreateSP.sql#L360304) | — | 1 / 1 | — |
| `UBFSErrorAdd` | [Shared / Other](by-topic/shared-other.md) | [L360503](../../../ScriptDB/000_4_CreateSP.sql#L360503) | — | 29 / 0 | — |
| `UBFSErrorNSPAccountList` | [Account & Plan](by-topic/account-plan.md) | [L360555](../../../ScriptDB/000_4_CreateSP.sql#L360555) | — | 0 / 0 | — |
| `UBFSFileClear` | [Shared / Other](by-topic/shared-other.md) | [L360573](../../../ScriptDB/000_4_CreateSP.sql#L360573) | — | 0 / 0 | — |
| `UBFSFileCodeList` | [Shared / Other](by-topic/shared-other.md) | [L360625](../../../ScriptDB/000_4_CreateSP.sql#L360625) | 1 / 1 file | 0 / 0 | [FFImport.cs:721](../../../UBFFImport/FFImport.cs#L721) |
| `UBFSFileCodeList1256` | [Shared / Other](by-topic/shared-other.md) | [L360648](../../../ScriptDB/000_4_CreateSP.sql#L360648) | — | 0 / 0 | — |
| `UBFSFileRecordLen` | [Shared / Other](by-topic/shared-other.md) | [L360682](../../../ScriptDB/000_4_CreateSP.sql#L360682) | 1 / 1 file | 0 / 0 | [FFImport.cs:1976](../../../UBFFImport/FFImport.cs#L1976) |
| `UBFSFileRemoveTrx` | [Trading & Orders](by-topic/trading-orders.md) | [L360707](../../../ScriptDB/000_4_CreateSP.sql#L360707) | — | 0 / 0 | — |
| `UBFSFundAccountAdd` | [Fund & GIC](by-topic/fund-gic.md) | [L360729](../../../ScriptDB/000_4_CreateSP.sql#L360729) | — | 2 / 1 | — |
| `UBFSFundAccPosAdd` | [Fund & GIC](by-topic/fund-gic.md) | [L360781](../../../ScriptDB/000_4_CreateSP.sql#L360781) | — | 5 / 1 | — |
| `UBFSFundAccPosUpdate` | [Fund & GIC](by-topic/fund-gic.md) | [L360859](../../../ScriptDB/000_4_CreateSP.sql#L360859) | — | 0 / 1 | — |
| `UBFSLogRecordAdded` | [Shared / Other](by-topic/shared-other.md) | [L360910](../../../ScriptDB/000_4_CreateSP.sql#L360910) | — | 2 / 1 | — |
| `UBFSPlanAdd` | [Account & Plan](by-topic/account-plan.md) | [L360959](../../../ScriptDB/000_4_CreateSP.sql#L360959) | — | 2 / 1 | — |
| `UBFSRuleList` | [Shared / Other](by-topic/shared-other.md) | [L361074](../../../ScriptDB/000_4_CreateSP.sql#L361074) | 1 / 1 file | 0 / 2 | [CDatabase.cs:1916](../../../UBConnection/CDatabase.cs#L1916) |
| `UBFSRuleList_FD` | [Shared / Other](by-topic/shared-other.md) | [L361099](../../../ScriptDB/000_4_CreateSP.sql#L361099) | — | 1 / 0 | — |
| `UBFSRuleList_Service` | [Shared / Other](by-topic/shared-other.md) | [L361123](../../../ScriptDB/000_4_CreateSP.sql#L361123) | — | 1 / 0 | — |
| `UBFSRuleSave` | [Shared / Other](by-topic/shared-other.md) | [L361140](../../../ScriptDB/000_4_CreateSP.sql#L361140) | 1 / 1 file | 0 / 2 | [CDatabase.cs:2017](../../../UBConnection/CDatabase.cs#L2017) |
| `UBFSRuleSave_FD` | [Shared / Other](by-topic/shared-other.md) | [L361168](../../../ScriptDB/000_4_CreateSP.sql#L361168) | — | 1 / 1 | — |
| `UBFSRuleSave_Service` | [Shared / Other](by-topic/shared-other.md) | [L361215](../../../ScriptDB/000_4_CreateSP.sql#L361215) | — | 1 / 1 | — |
| `UBFSRuleSave3_Service` | [Shared / Other](by-topic/shared-other.md) | [L361263](../../../ScriptDB/000_4_CreateSP.sql#L361263) | — | 0 / 1 | — |
| `UBFSRuleSaveOne_FD` | [Shared / Other](by-topic/shared-other.md) | [L361298](../../../ScriptDB/000_4_CreateSP.sql#L361298) | — | 1 / 0 | — |
| `UBFSRuleSaveOne_Service` | [Shared / Other](by-topic/shared-other.md) | [L361340](../../../ScriptDB/000_4_CreateSP.sql#L361340) | — | 3 / 0 | — |
| `UBFSXMLAcctSetup` | [Shared / Other](by-topic/shared-other.md) | [L361381](../../../ScriptDB/000_4_CreateSP.sql#L361381) | — | 2 / 7 | — |
| `UBFSXMLAcctTrnsfr` | [Shared / Other](by-topic/shared-other.md) | [L361807](../../../ScriptDB/000_4_CreateSP.sql#L361807) | — | 1 / 2 | — |
| `UBFSXMLBeneficiary` | [Client & KYC](by-topic/client-kyc.md) | [L362009](../../../ScriptDB/000_4_CreateSP.sql#L362009) | — | 3 / 1 | — |
| `UBFSXMLBeneficiaryContinuing` | [Client & KYC](by-topic/client-kyc.md) | [L362134](../../../ScriptDB/000_4_CreateSP.sql#L362134) | — | 1 / 1 | — |
| `UBFSXMLBeneficiaryContinuingOne` | [Client & KYC](by-topic/client-kyc.md) | [L362184](../../../ScriptDB/000_4_CreateSP.sql#L362184) | — | 1 / 0 | — |
| `UBFSXMLClearTS` | [Shared / Other](by-topic/shared-other.md) | [L362304](../../../ScriptDB/000_4_CreateSP.sql#L362304) | 1 / 1 file | 0 / 0 | [CAdhocTSFileImport.cs:250](../../../UBFFImport/CAdhocTSFileImport.cs#L250) |
| `UBFSXMLITFBen` | [Shared / Other](by-topic/shared-other.md) | [L362338](../../../ScriptDB/000_4_CreateSP.sql#L362338) | — | 1 / 0 | — |
| `UBFSXMLOwner` | [Shared / Other](by-topic/shared-other.md) | [L362400](../../../ScriptDB/000_4_CreateSP.sql#L362400) | — | 2 / 0 | — |
| `UBFSXMLPrmCareGvr` | [Shared / Other](by-topic/shared-other.md) | [L362526](../../../ScriptDB/000_4_CreateSP.sql#L362526) | — | 1 / 0 | — |
| `UBFSXMLSpousal` | [Shared / Other](by-topic/shared-other.md) | [L362583](../../../ScriptDB/000_4_CreateSP.sql#L362583) | — | 1 / 0 | — |
| `UBFSXMLSuccessorAnnuitant` | [Shared / Other](by-topic/shared-other.md) | [L362641](../../../ScriptDB/000_4_CreateSP.sql#L362641) | — | 1 / 0 | — |
| `UBFSXMLTSFASucsr` | [Shared / Other](by-topic/shared-other.md) | [L362732](../../../ScriptDB/000_4_CreateSP.sql#L362732) | — | 2 / 0 | — |
| `UBFundAccInfo` | [Fund & GIC](by-topic/fund-gic.md) | [L362794](../../../ScriptDB/000_4_CreateSP.sql#L362794) | 1 / 1 file | 0 / 0 | [FundAccount.cs:1062](../../../UBClasses/FundAccount.cs#L1062) |
| `UBFundAccMove` | [Fund & GIC](by-topic/fund-gic.md) | [L362833](../../../ScriptDB/000_4_CreateSP.sql#L362833) | — | 1 / 1 | — |
| `UBFundAccountAdd` | [Fund & GIC](by-topic/fund-gic.md) | [L362882](../../../ScriptDB/000_4_CreateSP.sql#L362882) | — | 2 / 10 | — |
| `UBFundAccountCalcAveragedCost` | [Fund & GIC](by-topic/fund-gic.md) | [L363345](../../../ScriptDB/000_4_CreateSP.sql#L363345) | — | 0 / 0 | — |
| `UBFundAccountChangedBuy` | [Fund & GIC](by-topic/fund-gic.md) | [L363377](../../../ScriptDB/000_4_CreateSP.sql#L363377) | 1 / 1 file | 0 / 0 | [FundAccount.cs:2269](../../../UBClasses/FundAccount.cs#L2269) |
| `UBFundAccountChangedSell` | [Fund & GIC](by-topic/fund-gic.md) | [L363438](../../../ScriptDB/000_4_CreateSP.sql#L363438) | 1 / 1 file | 0 / 0 | [FundAccount.cs:2323](../../../UBClasses/FundAccount.cs#L2323) |
| `UBFundAccountDetailX` | [Fund & GIC](by-topic/fund-gic.md) | [L363536](../../../ScriptDB/000_4_CreateSP.sql#L363536) | — | 0 / 0 | — |
| `UBFundAccountDuplicate` | [Fund & GIC](by-topic/fund-gic.md) | [L363666](../../../ScriptDB/000_4_CreateSP.sql#L363666) | — | 1 / 1 | — |
| `UBFundAccountHasFirstTrx` | [Fund & GIC](by-topic/fund-gic.md) | [L363733](../../../ScriptDB/000_4_CreateSP.sql#L363733) | 1 / 1 file | 0 / 0 | [FundAccount.cs:2377](../../../UBClasses/FundAccount.cs#L2377) |
| `UBFundAccountIDList` | [Fund & GIC](by-topic/fund-gic.md) | [L363761](../../../ScriptDB/000_4_CreateSP.sql#L363761) | 1 / 1 file | 0 / 0 | [FundAccount.cs:89](../../../UBClasses/FundAccount.cs#L89) |
| `UBFundAccountIncome` | [Fund & GIC](by-topic/fund-gic.md) | [L363795](../../../ScriptDB/000_4_CreateSP.sql#L363795) | — | 0 / 0 | — |
| `UBFundAccountIncomeCalc` | [Fund & GIC](by-topic/fund-gic.md) | [L363832](../../../ScriptDB/000_4_CreateSP.sql#L363832) | — | 1 / 0 | — |
| `UBFundAccountMoveAllFromPlan2Plan` | [Fund & GIC](by-topic/fund-gic.md) | [L363862](../../../ScriptDB/000_4_CreateSP.sql#L363862) | — | 0 / 1 | — |
| `UBFundAccountMoveFromPlan2Plan` | [Fund & GIC](by-topic/fund-gic.md) | [L363915](../../../ScriptDB/000_4_CreateSP.sql#L363915) | 1 / 1 file | 2 / 1 | [Plan.cs:3363](../../../UBClasses/Plan.cs#L3363) |
| `UBFundAccountMoveTrxFromPos2Pos` | [Fund & GIC](by-topic/fund-gic.md) | [L364097](../../../ScriptDB/000_4_CreateSP.sql#L364097) | 1 / 1 file | 1 / 1 | [Plan.cs:3409](../../../UBClasses/Plan.cs#L3409) |
| `UBFundAccountMoveTrxFromPos2PosWithDate` | [Fund & GIC](by-topic/fund-gic.md) | [L364215](../../../ScriptDB/000_4_CreateSP.sql#L364215) | — | 0 / 0 | — |
| `UBFundAccountNoActivity` | [Fund & GIC](by-topic/fund-gic.md) | [L364263](../../../ScriptDB/000_4_CreateSP.sql#L364263) | — | 0 / 0 | — |
| `UBFundAccountPerformanceX` | [Fund & GIC](by-topic/fund-gic.md) | [L364323](../../../ScriptDB/000_4_CreateSP.sql#L364323) | — | 0 / 0 | — |
| `UBFundAccountPosAvCostList` | [Fund & GIC](by-topic/fund-gic.md) | [L364432](../../../ScriptDB/000_4_CreateSP.sql#L364432) | 1 / 1 file | 1 / 0 | [FundAccount.cs:2970](../../../UBClasses/FundAccount.cs#L2970) |
| `UBFundAccountPosAvgCostItemInfo` | [Fund & GIC](by-topic/fund-gic.md) | [L364461](../../../ScriptDB/000_4_CreateSP.sql#L364461) | 1 / 1 file | 0 / 0 | [FundAccount.cs:2925](../../../UBClasses/FundAccount.cs#L2925) |
| `UBFundAccountPosAvgCostItemRemove` | [Fund & GIC](by-topic/fund-gic.md) | [L364488](../../../ScriptDB/000_4_CreateSP.sql#L364488) | 1 / 1 file | 0 / 0 | [FundAccount.cs:3058](../../../UBClasses/FundAccount.cs#L3058) |
| `UBFundAccountPosAvgCostItemUpdate` | [Fund & GIC](by-topic/fund-gic.md) | [L364514](../../../ScriptDB/000_4_CreateSP.sql#L364514) | 1 / 1 file | 0 / 0 | [FundAccount.cs:3012](../../../UBClasses/FundAccount.cs#L3012) |
| `UBFundAccountPosFeeInfo` | [Commission & Fee](by-topic/commission-fee.md) | [L364554](../../../ScriptDB/000_4_CreateSP.sql#L364554) | — | 1 / 0 | — |
| `UBFundAccountPosFeeUpdate` | [Commission & Fee](by-topic/commission-fee.md) | [L364573](../../../ScriptDB/000_4_CreateSP.sql#L364573) | — | 2 / 1 | — |
| `UBFundAccountPosFixMerger00` | [Fund & GIC](by-topic/fund-gic.md) | [L364660](../../../ScriptDB/000_4_CreateSP.sql#L364660) | — | 0 / 1 | — |
| `UBFundAccountPosFixMerger01` | [Fund & GIC](by-topic/fund-gic.md) | [L364700](../../../ScriptDB/000_4_CreateSP.sql#L364700) | — | 1 / 0 | — |
| `UBFundAccountPositionActivate` | [Fund & GIC](by-topic/fund-gic.md) | [L364749](../../../ScriptDB/000_4_CreateSP.sql#L364749) | 1 / 1 file | 0 / 4 | [FundAccount.cs:1320](../../../UBClasses/FundAccount.cs#L1320) |
| `UBFundAccountPositionCheckSwitch` | [Fund & GIC](by-topic/fund-gic.md) | [L364879](../../../ScriptDB/000_4_CreateSP.sql#L364879) | — | 1 / 0 | — |
| `UBFundAccountPositionCodeChange` | [Fund & GIC](by-topic/fund-gic.md) | [L364921](../../../ScriptDB/000_4_CreateSP.sql#L364921) | — | 0 / 1 | — |
| `UBFundAccountPositionCodeChange1Pos` | [Fund & GIC](by-topic/fund-gic.md) | [L364949](../../../ScriptDB/000_4_CreateSP.sql#L364949) | — | 1 / 0 | — |
| `UBFundAccountPositionDelete` | [Fund & GIC](by-topic/fund-gic.md) | [L365071](../../../ScriptDB/000_4_CreateSP.sql#L365071) | 1 / 1 file | 2 / 0 | [FundAccount.cs:1167](../../../UBClasses/FundAccount.cs#L1167) |
| `UBFundAccountPositionDeleteAll` | [Fund & GIC](by-topic/fund-gic.md) | [L365145](../../../ScriptDB/000_4_CreateSP.sql#L365145) | 1 / 1 file | 1 / 0 | [FundAccount.cs:1269](../../../UBClasses/FundAccount.cs#L1269) |
| `UBFundAccountPositionFixSequence` | [Fund & GIC](by-topic/fund-gic.md) | [L365203](../../../ScriptDB/000_4_CreateSP.sql#L365203) | — | 1 / 1 | — |
| `UBFundAccountPositionGetID` | [Fund & GIC](by-topic/fund-gic.md) | [L365310](../../../ScriptDB/000_4_CreateSP.sql#L365310) | — | 2 / 0 | — |
| `UBFundAccountPositionGetParamsOneDay` | [Fund & GIC](by-topic/fund-gic.md) | [L365353](../../../ScriptDB/000_4_CreateSP.sql#L365353) | — | 1 / 0 | — |
| `UBFundAccountPositionInactivate` | [Fund & GIC](by-topic/fund-gic.md) | [L365406](../../../ScriptDB/000_4_CreateSP.sql#L365406) | — | 2 / 5 | — |
| `UBFundAccountPositionMergeOne` | [Fund & GIC](by-topic/fund-gic.md) | [L365492](../../../ScriptDB/000_4_CreateSP.sql#L365492) | — | 1 / 1 | — |
| `UBFundAccountPositionMergeStep1` | [Fund & GIC](by-topic/fund-gic.md) | [L365731](../../../ScriptDB/000_4_CreateSP.sql#L365731) | — | 0 / 0 | — |
| `UBFundAccountPositionMergeStep2` | [Fund & GIC](by-topic/fund-gic.md) | [L365755](../../../ScriptDB/000_4_CreateSP.sql#L365755) | — | 0 / 0 | — |
| `UBFundAccountPositionMergeStep3` | [Fund & GIC](by-topic/fund-gic.md) | [L365778](../../../ScriptDB/000_4_CreateSP.sql#L365778) | — | 0 / 0 | — |
| `UBFundAccountPositionMergeStep4` | [Fund & GIC](by-topic/fund-gic.md) | [L365824](../../../ScriptDB/000_4_CreateSP.sql#L365824) | — | 0 / 0 | — |
| `UBFundAccountPositionRefreshException` | [Fund & GIC](by-topic/fund-gic.md) | [L365870](../../../ScriptDB/000_4_CreateSP.sql#L365870) | 1 / 1 file | 4 / 0 | [FundAccount.cs:1935](../../../UBClasses/FundAccount.cs#L1935) |
| `UBFundAccountPositionRemoveDivTrxOnTransDay` | [Fund & GIC](by-topic/fund-gic.md) | [L365940](../../../ScriptDB/000_4_CreateSP.sql#L365940) | — | 0 / 1 | — |
| `UBFundAccountPositionRemoveDupTrx` | [Fund & GIC](by-topic/fund-gic.md) | [L366011](../../../ScriptDB/000_4_CreateSP.sql#L366011) | — | 0 / 1 | — |
| `UBFundAccountPositionRemoveET` | [Fund & GIC](by-topic/fund-gic.md) | [L366082](../../../ScriptDB/000_4_CreateSP.sql#L366082) | — | 0 / 1 | — |
| `UBFundAccountPositionSetSwitchDate` | [Fund & GIC](by-topic/fund-gic.md) | [L366147](../../../ScriptDB/000_4_CreateSP.sql#L366147) | — | 0 / 0 | — |
| `UBFundAccountPositionTMPAdd` | [Fund & GIC](by-topic/fund-gic.md) | [L366173](../../../ScriptDB/000_4_CreateSP.sql#L366173) | — | 1 / 0 | — |
| `UBFundAccountPositionTMPCalc` | [Fund & GIC](by-topic/fund-gic.md) | [L366219](../../../ScriptDB/000_4_CreateSP.sql#L366219) | — | 1 / 3 | — |
| `UBFundAccountPositionTMPGet` | [Fund & GIC](by-topic/fund-gic.md) | [L366342](../../../ScriptDB/000_4_CreateSP.sql#L366342) | — | 53 / 2 | — |
| `UBFundAccountPositionTMPInitOnePlan` | [Fund & GIC](by-topic/fund-gic.md) | [L366463](../../../ScriptDB/000_4_CreateSP.sql#L366463) | — | 47 / 1 | — |
| `UBFundAccountPositionTMPReset` | [Fund & GIC](by-topic/fund-gic.md) | [L366516](../../../ScriptDB/000_4_CreateSP.sql#L366516) | — | 1 / 0 | — |
| `UBFundAccountPositionTMPSelect` | [Fund & GIC](by-topic/fund-gic.md) | [L366555](../../../ScriptDB/000_4_CreateSP.sql#L366555) | — | 0 / 1 | — |
| `UBFundAccountPositionUpdateTrx` | [Fund & GIC](by-topic/fund-gic.md) | [L366588](../../../ScriptDB/000_4_CreateSP.sql#L366588) | 1 / 1 file | 0 / 0 | [FundAccount.cs:1836](../../../UBClasses/FundAccount.cs#L1836) |
| `UBFundAccountPositionUpdateUnit` | [Fund & GIC](by-topic/fund-gic.md) | [L366628](../../../ScriptDB/000_4_CreateSP.sql#L366628) | — | 0 / 0 | — |
| `UBFundAccountPositionVerify` | [Fund & GIC](by-topic/fund-gic.md) | [L366660](../../../ScriptDB/000_4_CreateSP.sql#L366660) | — | 1 / 1 | — |
| `UBFundAccountPosList` | [Fund & GIC](by-topic/fund-gic.md) | [L366695](../../../ScriptDB/000_4_CreateSP.sql#L366695) | 1 / 1 file | 0 / 0 | [FundAccount.cs:1793](../../../UBClasses/FundAccount.cs#L1793) |
| `UBFundAccountPosListDSCOnly` | [Fund & GIC](by-topic/fund-gic.md) | [L366721](../../../ScriptDB/000_4_CreateSP.sql#L366721) | — | 0 / 0 | — |
| `UBFundAccountPosMoveFromAccount2Account` | [Fund & GIC](by-topic/fund-gic.md) | [L366745](../../../ScriptDB/000_4_CreateSP.sql#L366745) | — | 0 / 0 | — |
| `UBFundAccountPosProcess` | [Fund & GIC](by-topic/fund-gic.md) | [L366793](../../../ScriptDB/000_4_CreateSP.sql#L366793) | — | 0 / 1 | — |
| `UBFundAccountPosRefreshWithLastTrx` | [Fund & GIC](by-topic/fund-gic.md) | [L366863](../../../ScriptDB/000_4_CreateSP.sql#L366863) | — | 10 / 0 | — |
| `UBFundAccountPosServiceFeeCalc` | [Commission & Fee](by-topic/commission-fee.md) | [L366905](../../../ScriptDB/000_4_CreateSP.sql#L366905) | — | 0 / 0 | — |
| `UBFundAccountPosServiceFeeCalc2` | [Commission & Fee](by-topic/commission-fee.md) | [L367035](../../../ScriptDB/000_4_CreateSP.sql#L367035) | — | 5 / 0 | — |
| `UBFundAccountPosServiceFeeCalc3` | [Commission & Fee](by-topic/commission-fee.md) | [L367208](../../../ScriptDB/000_4_CreateSP.sql#L367208) | — | 2 / 0 | — |
| `UBFundAccountPosSFItemInfo` | [Fund & GIC](by-topic/fund-gic.md) | [L367377](../../../ScriptDB/000_4_CreateSP.sql#L367377) | 1 / 1 file | 0 / 0 | [FundAccount.cs:2738](../../../UBClasses/FundAccount.cs#L2738) |
| `UBFundAccountPosSFItemRemove` | [Fund & GIC](by-topic/fund-gic.md) | [L367407](../../../ScriptDB/000_4_CreateSP.sql#L367407) | 1 / 1 file | 0 / 0 | [FundAccount.cs:2877](../../../UBClasses/FundAccount.cs#L2877) |
| `UBFundAccountPosSFItemUpdate` | [Fund & GIC](by-topic/fund-gic.md) | [L367433](../../../ScriptDB/000_4_CreateSP.sql#L367433) | 1 / 1 file | 0 / 0 | [FundAccount.cs:2824](../../../UBClasses/FundAccount.cs#L2824) |
| `UBFundAccountPosSFList` | [Fund & GIC](by-topic/fund-gic.md) | [L367491](../../../ScriptDB/000_4_CreateSP.sql#L367491) | 1 / 1 file | 1 / 0 | [FundAccount.cs:2782](../../../UBClasses/FundAccount.cs#L2782) |
| `UBFundAccountPosSFSync` | [Fund & GIC](by-topic/fund-gic.md) | [L367523](../../../ScriptDB/000_4_CreateSP.sql#L367523) | — | 0 / 0 | — |
| `UBFundAccountPosSyncZeroBalance` | [Fund & GIC](by-topic/fund-gic.md) | [L367565](../../../ScriptDB/000_4_CreateSP.sql#L367565) | — | 0 / 0 | — |
| `UBFundAccountPosSyncZeroBalance2` | [Fund & GIC](by-topic/fund-gic.md) | [L367649](../../../ScriptDB/000_4_CreateSP.sql#L367649) | — | 0 / 0 | — |
| `UBFundAccountPosUnitBalance` | [Fund & GIC](by-topic/fund-gic.md) | [L367735](../../../ScriptDB/000_4_CreateSP.sql#L367735) | — | 0 / 0 | — |
| `UBFundAccountPosUnitBalanceMKV` | [Fund & GIC](by-topic/fund-gic.md) | [L367812](../../../ScriptDB/000_4_CreateSP.sql#L367812) | — | 1 / 0 | — |
| `UBFundAccountPosUnitBalanceX` | [Fund & GIC](by-topic/fund-gic.md) | [L367882](../../../ScriptDB/000_4_CreateSP.sql#L367882) | — | 1 / 0 | — |
| `UBFundAccountPriceListX` | [Fund & GIC](by-topic/fund-gic.md) | [L367971](../../../ScriptDB/000_4_CreateSP.sql#L367971) | — | 0 / 1 | — |
| `UBFundAccountReCalcAveragedCost` | [Fund & GIC](by-topic/fund-gic.md) | [L368052](../../../ScriptDB/000_4_CreateSP.sql#L368052) | — | 2 / 0 | — |
| `UBFundAccountRefresh1Plan` | [Fund & GIC](by-topic/fund-gic.md) | [L368072](../../../ScriptDB/000_4_CreateSP.sql#L368072) | — | 1 / 0 | — |
| `UBFundAccountTrxDetailX` | [Fund & GIC](by-topic/fund-gic.md) | [L368117](../../../ScriptDB/000_4_CreateSP.sql#L368117) | — | 0 / 0 | — |
| `UBFundAccountTrxListX` | [Fund & GIC](by-topic/fund-gic.md) | [L368269](../../../ScriptDB/000_4_CreateSP.sql#L368269) | — | 0 / 0 | — |
| `UBFundAccountUnitList` | [Fund & GIC](by-topic/fund-gic.md) | [L368360](../../../ScriptDB/000_4_CreateSP.sql#L368360) | — | 0 / 0 | — |
| `UBFundAccountUnitListDetail` | [Fund & GIC](by-topic/fund-gic.md) | [L368450](../../../ScriptDB/000_4_CreateSP.sql#L368450) | — | 0 / 0 | — |
| `UBFundAccountUpdate` | [Fund & GIC](by-topic/fund-gic.md) | [L368541](../../../ScriptDB/000_4_CreateSP.sql#L368541) | — | 2 / 13 | — |
| `UBFundAccountUpdateIDFirstPurchase` | [Fund & GIC](by-topic/fund-gic.md) | [L368997](../../../ScriptDB/000_4_CreateSP.sql#L368997) | — | 2 / 0 | — |
| `UBFundAccPosUpdate` | [Fund & GIC](by-topic/fund-gic.md) | [L369092](../../../ScriptDB/000_4_CreateSP.sql#L369092) | — | 1 / 1 | — |
| `UBFundAccPosUpdateUnits` | [Fund & GIC](by-topic/fund-gic.md) | [L369142](../../../ScriptDB/000_4_CreateSP.sql#L369142) | — | 0 / 0 | — |
| `UBFundAccSchedule_AA_Scan` | [Fund & GIC](by-topic/fund-gic.md) | [L369187](../../../ScriptDB/000_4_CreateSP.sql#L369187) | — | 0 / 1 | — |
| `UBFundAccSchedule_AA_ScanOne` | [Fund & GIC](by-topic/fund-gic.md) | [L369219](../../../ScriptDB/000_4_CreateSP.sql#L369219) | — | 2 / 1 | — |
| `UBFundAccSchedule_AA_ScanOnePlan` | [Fund & GIC](by-topic/fund-gic.md) | [L369281](../../../ScriptDB/000_4_CreateSP.sql#L369281) | — | 3 / 2 | — |
| `UBFundAccSchedule_AA_ScanOneRRIF` | [Fund & GIC](by-topic/fund-gic.md) | [L369314](../../../ScriptDB/000_4_CreateSP.sql#L369314) | — | 1 / 1 | — |
| `UBFundAccScheduleAdd` | [Fund & GIC](by-topic/fund-gic.md) | [L369379](../../../ScriptDB/000_4_CreateSP.sql#L369379) | — | 1 / 6 | — |
| `UBFundAccScheduleAddUI` | [Fund & GIC](by-topic/fund-gic.md) | [L369505](../../../ScriptDB/000_4_CreateSP.sql#L369505) | — | 0 / 10 | — |
| `UBFundAccScheduleUpdate` | [Fund & GIC](by-topic/fund-gic.md) | [L369961](../../../ScriptDB/000_4_CreateSP.sql#L369961) | — | 1 / 0 | — |
| `UBFundAccScheduleUpdateF` | [Fund & GIC](by-topic/fund-gic.md) | [L369995](../../../ScriptDB/000_4_CreateSP.sql#L369995) | — | 0 / 0 | — |
| `UBFundAccScheduleUpdateUI` | [Fund & GIC](by-topic/fund-gic.md) | [L370025](../../../ScriptDB/000_4_CreateSP.sql#L370025) | — | 0 / 11 | — |
| `UBFundAccUpdate` | [Fund & GIC](by-topic/fund-gic.md) | [L370496](../../../ScriptDB/000_4_CreateSP.sql#L370496) | — | 1 / 1 | — |
| `UBFundActiveNoPrice` | [Fund & GIC](by-topic/fund-gic.md) | [L370563](../../../ScriptDB/000_4_CreateSP.sql#L370563) | — | 0 / 0 | — |
| `UBFundAllocationList` | [Fund & GIC](by-topic/fund-gic.md) | [L370583](../../../ScriptDB/000_4_CreateSP.sql#L370583) | — | 2 / 0 | — |
| `UBFundAllocationListTMP` | [Fund & GIC](by-topic/fund-gic.md) | [L370630](../../../ScriptDB/000_4_CreateSP.sql#L370630) | 1 / 1 file | 2 / 0 | [FundDef.cs:4093](../../../UBClasses/FundDef.cs#L4093) |
| `UBFundAllocationListTMP_ItemInfo` | [Fund & GIC](by-topic/fund-gic.md) | [L370666](../../../ScriptDB/000_4_CreateSP.sql#L370666) | 1 / 1 file | 0 / 0 | [FundDef.cs:4144](../../../UBClasses/FundDef.cs#L4144) |
| `UBFundataAuthInfo` | [Fundserv & Import](by-topic/fundserv-import.md) | [L370684](../../../ScriptDB/000_4_CreateSP.sql#L370684) | — | 1 / 0 | — |
| `UBFundataAuthUpdate` | [Fundserv & Import](by-topic/fundserv-import.md) | [L370704](../../../ScriptDB/000_4_CreateSP.sql#L370704) | — | 0 / 0 | — |
| `UBFundataComboList` | [Fundserv & Import](by-topic/fundserv-import.md) | [L370729](../../../ScriptDB/000_4_CreateSP.sql#L370729) | — | 0 / 1 | — |
| `UBFundataDLCountAdd` | [Fundserv & Import](by-topic/fundserv-import.md) | [L370754](../../../ScriptDB/000_4_CreateSP.sql#L370754) | — | 0 / 0 | — |
| `UBFundataLog` | [Fundserv & Import](by-topic/fundserv-import.md) | [L370796](../../../ScriptDB/000_4_CreateSP.sql#L370796) | — | 0 / 0 | — |
| `UBFundAvgCostAdd` | [Fund & GIC](by-topic/fund-gic.md) | [L370831](../../../ScriptDB/000_4_CreateSP.sql#L370831) | — | 0 / 0 | — |
| `UBFundBareTrusteeList` | [Fund & GIC](by-topic/fund-gic.md) | [L370868](../../../ScriptDB/000_4_CreateSP.sql#L370868) | — | 2 / 0 | — |
| `UBFundClassList` | [Fund & GIC](by-topic/fund-gic.md) | [L370898](../../../ScriptDB/000_4_CreateSP.sql#L370898) | 1 / 1 file | 8 / 0 | [FundDef.cs:1979](../../../UBClasses/FundDef.cs#L1979) |
| `UBFundCodeByID` | [Fund & GIC](by-topic/fund-gic.md) | [L370982](../../../ScriptDB/000_4_CreateSP.sql#L370982) | 1 / 1 file | 0 / 0 | [FundDef.cs:2467](../../../UBClasses/FundDef.cs#L2467) |
| `UBFundCurrencyList` | [Fund & GIC](by-topic/fund-gic.md) | [L371017](../../../ScriptDB/000_4_CreateSP.sql#L371017) | — | 9 / 0 | — |
| `UBFundDefAAAdd` | [Fund & GIC](by-topic/fund-gic.md) | [L371050](../../../ScriptDB/000_4_CreateSP.sql#L371050) | 1 / 1 file | 0 / 0 | [PanelFundassetAloc.aspx.cs:132](../../../WebApp/Main/PanelFundassetAloc.aspx.cs#L132) |
| `UBFundDefAACommit` | [Commission & Fee](by-topic/commission-fee.md) | [L371095](../../../ScriptDB/000_4_CreateSP.sql#L371095) | — | 0 / 0 | — |
| `UBFundDefAAInfo` | [Fund & GIC](by-topic/fund-gic.md) | [L371137](../../../ScriptDB/000_4_CreateSP.sql#L371137) | 1 / 1 file | 0 / 0 | [FundDef.cs:1500](../../../UBClasses/FundDef.cs#L1500) |
| `UBFundDefAARemove` | [Fund & GIC](by-topic/fund-gic.md) | [L371166](../../../ScriptDB/000_4_CreateSP.sql#L371166) | 1 / 1 file | 0 / 0 | [PanelFundassetAloc.aspx.cs:261](../../../WebApp/Main/PanelFundassetAloc.aspx.cs#L261) |
| `UBFundDefAdd` | [Fund & GIC](by-topic/fund-gic.md) | [L371209](../../../ScriptDB/000_4_CreateSP.sql#L371209) | — | 11 / 5 | — |
| `UBFundDefAddInit` | [Fund & GIC](by-topic/fund-gic.md) | [L371444](../../../ScriptDB/000_4_CreateSP.sql#L371444) | — | 0 / 13 | — |
| `UBFundDefAddMissingDone` | [Fund & GIC](by-topic/fund-gic.md) | [L371503](../../../ScriptDB/000_4_CreateSP.sql#L371503) | — | 1 / 0 | — |
| `UBFundDefAllocationDescriptionList` | [Fund & GIC](by-topic/fund-gic.md) | [L371550](../../../ScriptDB/000_4_CreateSP.sql#L371550) | — | 0 / 0 | — |
| `UBFundDefAllocationOKTMP` | [Fund & GIC](by-topic/fund-gic.md) | [L371568](../../../ScriptDB/000_4_CreateSP.sql#L371568) | — | 0 / 0 | — |
| `UBFundDefAllocationRemoveTMP` | [Fund & GIC](by-topic/fund-gic.md) | [L371633](../../../ScriptDB/000_4_CreateSP.sql#L371633) | — | 0 / 1 | — |
| `UBFundDefAllocationTypeID` | [Fund & GIC](by-topic/fund-gic.md) | [L371651](../../../ScriptDB/000_4_CreateSP.sql#L371651) | — | 1 / 0 | — |
| `UBFundDefAllocationUpdate` | [Fund & GIC](by-topic/fund-gic.md) | [L371671](../../../ScriptDB/000_4_CreateSP.sql#L371671) | — | 1 / 0 | — |
| `UBFundDefAllocationUpdateTMP` | [Fund & GIC](by-topic/fund-gic.md) | [L371702](../../../ScriptDB/000_4_CreateSP.sql#L371702) | — | 0 / 1 | — |
| `UBFundDefAssignDSC2FE` | [Fund & GIC](by-topic/fund-gic.md) | [L371739](../../../ScriptDB/000_4_CreateSP.sql#L371739) | — | 0 / 0 | — |
| `UBFundDefAuditTrailCheck` | [Fund & GIC](by-topic/fund-gic.md) | [L371779](../../../ScriptDB/000_4_CreateSP.sql#L371779) | — | 0 / 1 | — |
| `UBFundDefAuditTrailHeaderAdd` | [Fund & GIC](by-topic/fund-gic.md) | [L371796](../../../ScriptDB/000_4_CreateSP.sql#L371796) | — | 16 / 0 | — |
| `UBFundDefAuditTrailHeaderEnd` | [Fund & GIC](by-topic/fund-gic.md) | [L371819](../../../ScriptDB/000_4_CreateSP.sql#L371819) | — | 15 / 0 | — |
| `UBFundDefAuditTrailInitBase` | [Fund & GIC](by-topic/fund-gic.md) | [L371836](../../../ScriptDB/000_4_CreateSP.sql#L371836) | — | 0 / 1 | — |
| `UBFundDefAuditTrailInitBaseAddInvObjPct` | [Fund & GIC](by-topic/fund-gic.md) | [L371860](../../../ScriptDB/000_4_CreateSP.sql#L371860) | — | 0 / 0 | — |
| `UBFundDefAuditTrailInitBaseFix` | [Fund & GIC](by-topic/fund-gic.md) | [L371915](../../../ScriptDB/000_4_CreateSP.sql#L371915) | — | 0 / 1 | — |
| `UBFundDefAuditTrailInitBaseOneFund` | [Fund & GIC](by-topic/fund-gic.md) | [L371939](../../../ScriptDB/000_4_CreateSP.sql#L371939) | — | 1 / 0 | — |
| `UBFundDefAuditTrailInitBaseOneFundBulk` | [Fund & GIC](by-topic/fund-gic.md) | [L372506](../../../ScriptDB/000_4_CreateSP.sql#L372506) | — | 1 / 0 | — |
| `UBFundDefAuditTrailInitBaseOneFundBulkFix` | [Fund & GIC](by-topic/fund-gic.md) | [L372936](../../../ScriptDB/000_4_CreateSP.sql#L372936) | — | 1 / 0 | — |
| `UBFundDefAuditTrailMerger` | [Fund & GIC](by-topic/fund-gic.md) | [L373175](../../../ScriptDB/000_4_CreateSP.sql#L373175) | — | 3 / 2 | — |
| `UBFundDefAuditTrailSaveMain` | [Fund & GIC](by-topic/fund-gic.md) | [L373227](../../../ScriptDB/000_4_CreateSP.sql#L373227) | — | 6 / 4 | — |
| `UBFundDefAuditTrailSaveOne` | [Fund & GIC](by-topic/fund-gic.md) | [L373442](../../../ScriptDB/000_4_CreateSP.sql#L373442) | — | 7 / 0 | — |
| `UBFundDefAuditTrailSavePerf` | [Fund & GIC](by-topic/fund-gic.md) | [L373478](../../../ScriptDB/000_4_CreateSP.sql#L373478) | — | 2 / 3 | — |
| `UBFundDefAuditTrailSaveRates` | [Fund & GIC](by-topic/fund-gic.md) | [L373597](../../../ScriptDB/000_4_CreateSP.sql#L373597) | — | 6 / 3 | — |
| `UBFundDefAuditTrailSaveRiskInvObj` | [Fund & GIC](by-topic/fund-gic.md) | [L373681](../../../ScriptDB/000_4_CreateSP.sql#L373681) | — | 2 / 3 | — |
| `UBFundDefCAAAdd` | [Fund & GIC](by-topic/fund-gic.md) | [L373786](../../../ScriptDB/000_4_CreateSP.sql#L373786) | 1 / 1 file | 0 / 0 | [PanelFundChildAA.aspx.cs:122](../../../WebApp/Main/PanelFundChildAA.aspx.cs#L122) |
| `UBFundDefCAAInfo` | [Fund & GIC](by-topic/fund-gic.md) | [L373826](../../../ScriptDB/000_4_CreateSP.sql#L373826) | 1 / 1 file | 0 / 0 | [FundDef.cs:1543](../../../UBClasses/FundDef.cs#L1543) |
| `UBFundDefCAARemove` | [Fund & GIC](by-topic/fund-gic.md) | [L373854](../../../ScriptDB/000_4_CreateSP.sql#L373854) | 1 / 1 file | 0 / 0 | [PanelFundChildAA.aspx.cs:187](../../../WebApp/Main/PanelFundChildAA.aspx.cs#L187) |
| `UBFundDefComboList1` | [Fund & GIC](by-topic/fund-gic.md) | [L373881](../../../ScriptDB/000_4_CreateSP.sql#L373881) | — | 0 / 5 | — |
| `UBFundDefComboList2` | [Fund & GIC](by-topic/fund-gic.md) | [L373899](../../../ScriptDB/000_4_CreateSP.sql#L373899) | — | 0 / 3 | — |
| `UBFundDefExistVerify` | [Fund & GIC](by-topic/fund-gic.md) | [L373921](../../../ScriptDB/000_4_CreateSP.sql#L373921) | — | 0 / 0 | — |
| `UBFundDefFD_TCR_End` | [Fund & GIC](by-topic/fund-gic.md) | [L373971](../../../ScriptDB/000_4_CreateSP.sql#L373971) | — | 0 / 0 | — |
| `UBFundDefFD_TCR_Update` | [Fund & GIC](by-topic/fund-gic.md) | [L373988](../../../ScriptDB/000_4_CreateSP.sql#L373988) | — | 0 / 1 | — |
| `UBFundDefFDAllocationEnd` | [Fund & GIC](by-topic/fund-gic.md) | [L374056](../../../ScriptDB/000_4_CreateSP.sql#L374056) | — | 0 / 0 | — |
| `UBFundDefFDAllocationUpdate` | [Fund & GIC](by-topic/fund-gic.md) | [L374077](../../../ScriptDB/000_4_CreateSP.sql#L374077) | — | 0 / 3 | — |
| `UBFundDefFDInfoUpdate` | [Fund & GIC](by-topic/fund-gic.md) | [L374138](../../../ScriptDB/000_4_CreateSP.sql#L374138) | — | 0 / 7 | — |
| `UBFundDefFDInfoUpdate_TBD` | [Fund & GIC](by-topic/fund-gic.md) | [L374847](../../../ScriptDB/000_4_CreateSP.sql#L374847) | — | 0 / 7 | — |
| `UBFundDefFDManagerEnd` | [Fund & GIC](by-topic/fund-gic.md) | [L375513](../../../ScriptDB/000_4_CreateSP.sql#L375513) | — | 0 / 0 | — |
| `UBFundDefFDManagerUpdate` | [Fund & GIC](by-topic/fund-gic.md) | [L375558](../../../ScriptDB/000_4_CreateSP.sql#L375558) | — | 0 / 1 | — |
| `UBFundDefFDPriceUpdate` | [Fund & GIC](by-topic/fund-gic.md) | [L375622](../../../ScriptDB/000_4_CreateSP.sql#L375622) | — | 0 / 2 | — |
| `UBFundDefFDXPriceUpdate` | [Fund & GIC](by-topic/fund-gic.md) | [L375690](../../../ScriptDB/000_4_CreateSP.sql#L375690) | — | 0 / 2 | — |
| `UBFundDefListAsset` | [Fund & GIC](by-topic/fund-gic.md) | [L375742](../../../ScriptDB/000_4_CreateSP.sql#L375742) | — | 0 / 0 | — |
| `UBFundDefMerge` | [Fund & GIC](by-topic/fund-gic.md) | [L375799](../../../ScriptDB/000_4_CreateSP.sql#L375799) | 1 / 1 file | 1 / 1 | [CAE.cs:429](../../../UBFFImport/CAE.cs#L429) |
| `UBFundDefMergePrice` | [Fund & GIC](by-topic/fund-gic.md) | [L375935](../../../ScriptDB/000_4_CreateSP.sql#L375935) | — | 2 / 0 | — |
| `UBFundDefModelAdd` | [Fund & GIC](by-topic/fund-gic.md) | [L376030](../../../ScriptDB/000_4_CreateSP.sql#L376030) | 2 / 2 file | 0 / 0 | [PanelFundModel.aspx.cs:161](../../../WebApp/Main/PanelFundModel.aspx.cs#L161) |
| `UBFundDefModelCommit` | [Commission & Fee](by-topic/commission-fee.md) | [L376082](../../../ScriptDB/000_4_CreateSP.sql#L376082) | 2 / 2 file | 0 / 0 | [PanelFundModel.aspx.cs:296](../../../WebApp/Main/PanelFundModel.aspx.cs#L296) |
| `UBFundDefModelInfo` | [Fund & GIC](by-topic/fund-gic.md) | [L376140](../../../ScriptDB/000_4_CreateSP.sql#L376140) | 1 / 1 file | 0 / 0 | [FundDef.cs:1458](../../../UBClasses/FundDef.cs#L1458) |
| `UBFundDefModelRemove` | [Fund & GIC](by-topic/fund-gic.md) | [L376182](../../../ScriptDB/000_4_CreateSP.sql#L376182) | 2 / 2 file | 0 / 0 | [PanelFundModel.aspx.cs:362](../../../WebApp/Main/PanelFundModel.aspx.cs#L362) |
| `UBFundDefName2MixCase` | [Fund & GIC](by-topic/fund-gic.md) | [L376207](../../../ScriptDB/000_4_CreateSP.sql#L376207) | — | 0 / 0 | — |
| `UBFundDefPerformanceUpdate` | [Fund & GIC](by-topic/fund-gic.md) | [L376236](../../../ScriptDB/000_4_CreateSP.sql#L376236) | 1 / 1 file | 0 / 4 | [FundDef.cs:3930](../../../UBClasses/FundDef.cs#L3930) |
| `UBFundDefPrice` | [Fund & GIC](by-topic/fund-gic.md) | [L376744](../../../ScriptDB/000_4_CreateSP.sql#L376744) | — | 1 / 0 | — |
| `UBFundDefPriceTrend` | [Fund & GIC](by-topic/fund-gic.md) | [L376779](../../../ScriptDB/000_4_CreateSP.sql#L376779) | — | 3 / 0 | — |
| `UBFundDefPXInfo` | [Fund & GIC](by-topic/fund-gic.md) | [L376814](../../../ScriptDB/000_4_CreateSP.sql#L376814) | 2 / 2 file | 0 / 0 | [PanelFundPriceAdd.aspx.cs:71](../../../WebApp/Main/PanelFundPriceAdd.aspx.cs#L71) |
| `UBFundDefPXRemove` | [Fund & GIC](by-topic/fund-gic.md) | [L376838](../../../ScriptDB/000_4_CreateSP.sql#L376838) | 2 / 2 file | 0 / 1 | [PanelFundPriceAdd.aspx.cs:336](../../../WebApp/Main/PanelFundPriceAdd.aspx.cs#L336) |
| `UBFundDefPXUpdate` | [Fund & GIC](by-topic/fund-gic.md) | [L376915](../../../ScriptDB/000_4_CreateSP.sql#L376915) | 2 / 2 file | 7 / 0 | [PanelFundPriceAdd.aspx.cs:202](../../../WebApp/Main/PanelFundPriceAdd.aspx.cs#L202) |
| `UBFundDefPXUpdate2` | [Fund & GIC](by-topic/fund-gic.md) | [L377079](../../../ScriptDB/000_4_CreateSP.sql#L377079) | — | 10 / 0 | — |
| `UBFundDefRemove` | [Fund & GIC](by-topic/fund-gic.md) | [L377228](../../../ScriptDB/000_4_CreateSP.sql#L377228) | 1 / 1 file | 0 / 0 | [FundSetup.aspx.cs:1872](../../../WebApp/Main/FundSetup.aspx.cs#L1872) |
| `UBFundDefResetApproved4AssetOnly` | [Fund & GIC](by-topic/fund-gic.md) | [L377289](../../../ScriptDB/000_4_CreateSP.sql#L377289) | — | 0 / 0 | — |
| `UBFundDefRiskList` | [Fund & GIC](by-topic/fund-gic.md) | [L377311](../../../ScriptDB/000_4_CreateSP.sql#L377311) | 1 / 1 file | 0 / 0 | [FundDef.cs:2039](../../../UBClasses/FundDef.cs#L2039) |
| `UBFundDefRiskRatingHistoryUpdate` | [Fund & GIC](by-topic/fund-gic.md) | [L377340](../../../ScriptDB/000_4_CreateSP.sql#L377340) | — | 5 / 0 | — |
| `UBFundDefSearchCriteriaSave` | [Fund & GIC](by-topic/fund-gic.md) | [L377388](../../../ScriptDB/000_4_CreateSP.sql#L377388) | — | 1 / 0 | — |
| `UBFundDefSelectionUpdate` | [Fund & GIC](by-topic/fund-gic.md) | [L377512](../../../ScriptDB/000_4_CreateSP.sql#L377512) | — | 0 / 0 | — |
| `UBFundDefSetApprove` | [Fund & GIC](by-topic/fund-gic.md) | [L377547](../../../ScriptDB/000_4_CreateSP.sql#L377547) | — | 0 / 0 | — |
| `UBFundDefSetUnapprovedNonActive` | [Fund & GIC](by-topic/fund-gic.md) | [L377601](../../../ScriptDB/000_4_CreateSP.sql#L377601) | — | 0 / 0 | — |
| `UBFundDefTCRInfo` | [Fund & GIC](by-topic/fund-gic.md) | [L377622](../../../ScriptDB/000_4_CreateSP.sql#L377622) | — | 0 / 0 | — |
| `UBFundDefTCRItemAdd` | [Fund & GIC](by-topic/fund-gic.md) | [L377645](../../../ScriptDB/000_4_CreateSP.sql#L377645) | 1 / 1 file | 0 / 0 | [FundDef.cs:4745](../../../UBClasses/FundDef.cs#L4745) |
| `UBFundDefTCRItemInfo` | [Fund & GIC](by-topic/fund-gic.md) | [L377688](../../../ScriptDB/000_4_CreateSP.sql#L377688) | — | 0 / 0 | — |
| `UBFundDefTCRItemRemove` | [Fund & GIC](by-topic/fund-gic.md) | [L377709](../../../ScriptDB/000_4_CreateSP.sql#L377709) | 1 / 1 file | 0 / 0 | [FundDef.cs:4844](../../../UBClasses/FundDef.cs#L4844) |
| `UBFundDefTCRItemUpdate` | [Fund & GIC](by-topic/fund-gic.md) | [L377730](../../../ScriptDB/000_4_CreateSP.sql#L377730) | 1 / 1 file | 0 / 0 | [FundDef.cs:4795](../../../UBClasses/FundDef.cs#L4795) |
| `UBFundDefTCRList` | [Fund & GIC](by-topic/fund-gic.md) | [L377769](../../../ScriptDB/000_4_CreateSP.sql#L377769) | 1 / 1 file | 0 / 0 | [FundDef.cs:4890](../../../UBClasses/FundDef.cs#L4890) |
| `UBFundDefUpdate` | [Fund & GIC](by-topic/fund-gic.md) | [L377840](../../../ScriptDB/000_4_CreateSP.sql#L377840) | — | 0 / 6 | — |
| `UBFundDivFrequencyList` | [Fund & GIC](by-topic/fund-gic.md) | [L378180](../../../ScriptDB/000_4_CreateSP.sql#L378180) | — | 1 / 0 | — |
| `UBFundEligibilityList` | [Fund & GIC](by-topic/fund-gic.md) | [L378210](../../../ScriptDB/000_4_CreateSP.sql#L378210) | — | 0 / 0 | — |
| `UBFundFactAddTaggedItems` | [Fund & GIC](by-topic/fund-gic.md) | [L378241](../../../ScriptDB/000_4_CreateSP.sql#L378241) | 1 / 1 file | 0 / 1 | [Document.cs:2974](../../../UBClasses/Document.cs#L2974) |
| `UBFundFactAuditTrail` | [Fund & GIC](by-topic/fund-gic.md) | [L378332](../../../ScriptDB/000_4_CreateSP.sql#L378332) | — | 2 / 3 | — |
| `UBFundFactClientInfo` | [Fund & GIC](by-topic/fund-gic.md) | [L378377](../../../ScriptDB/000_4_CreateSP.sql#L378377) | — | 0 / 0 | — |
| `UBFundFactDeliverAllClients` | [Fund & GIC](by-topic/fund-gic.md) | [L378402](../../../ScriptDB/000_4_CreateSP.sql#L378402) | — | 0 / 1 | — |
| `UBFundFactDeliverItem` | [Fund & GIC](by-topic/fund-gic.md) | [L378431](../../../ScriptDB/000_4_CreateSP.sql#L378431) | — | 3 / 0 | — |
| `UBFundFactDeliverItemX` | [Fund & GIC](by-topic/fund-gic.md) | [L378674](../../../ScriptDB/000_4_CreateSP.sql#L378674) | — | 1 / 0 | — |
| `UBFundFactDeliverOneClient` | [Fund & GIC](by-topic/fund-gic.md) | [L378904](../../../ScriptDB/000_4_CreateSP.sql#L378904) | — | 1 / 0 | — |
| `UBFundFactDeliverTagged` | [Fund & GIC](by-topic/fund-gic.md) | [L379106](../../../ScriptDB/000_4_CreateSP.sql#L379106) | — | 0 / 1 | — |
| `UBFundFactDeliverTagged1Client1Method` | [Fund & GIC](by-topic/fund-gic.md) | [L379171](../../../ScriptDB/000_4_CreateSP.sql#L379171) | — | 1 / 0 | — |
| `UBFundFactDeliveryList` | [Fund & GIC](by-topic/fund-gic.md) | [L379397](../../../ScriptDB/000_4_CreateSP.sql#L379397) | — | 3 / 0 | — |
| `UBFundFactFDParams` | [Fund & GIC](by-topic/fund-gic.md) | [L379422](../../../ScriptDB/000_4_CreateSP.sql#L379422) | — | 0 / 1 | — |
| `UBFundFactFDParamsByFundPos` | [Fund & GIC](by-topic/fund-gic.md) | [L379475](../../../ScriptDB/000_4_CreateSP.sql#L379475) | — | 0 / 2 | — |
| `UBFundFactFDUpdateOneDoc` | [Fund & GIC](by-topic/fund-gic.md) | [L379530](../../../ScriptDB/000_4_CreateSP.sql#L379530) | — | 0 / 4 | — |
| `UBFundFactFundCodeByID` | [Fund & GIC](by-topic/fund-gic.md) | [L379731](../../../ScriptDB/000_4_CreateSP.sql#L379731) | — | 0 / 0 | — |
| `UBFundFactInfo` | [Fund & GIC](by-topic/fund-gic.md) | [L379797](../../../ScriptDB/000_4_CreateSP.sql#L379797) | 1 / 1 file | 3 / 0 | [FundDef.cs:2085](../../../UBClasses/FundDef.cs#L2085) |
| `UBFundFactInfoBundle` | [Fund & GIC](by-topic/fund-gic.md) | [L379892](../../../ScriptDB/000_4_CreateSP.sql#L379892) | — | 1 / 0 | — |
| `UBFundFactInfoByID` | [Fund & GIC](by-topic/fund-gic.md) | [L379955](../../../ScriptDB/000_4_CreateSP.sql#L379955) | 1 / 1 file | 0 / 1 | [FundDef.cs:2135](../../../UBClasses/FundDef.cs#L2135) |
| `UBFundFactIsAutoAdd` | [Fund & GIC](by-topic/fund-gic.md) | [L380019](../../../ScriptDB/000_4_CreateSP.sql#L380019) | — | 0 / 0 | — |
| `UBFundFactItemAdd` | [Fund & GIC](by-topic/fund-gic.md) | [L380054](../../../ScriptDB/000_4_CreateSP.sql#L380054) | — | 2 / 0 | — |
| `UBFundFactItemAddUI` | [Fund & GIC](by-topic/fund-gic.md) | [L380288](../../../ScriptDB/000_4_CreateSP.sql#L380288) | — | 0 / 1 | — |
| `UBFundFactLastUpdate` | [Fund & GIC](by-topic/fund-gic.md) | [L380324](../../../ScriptDB/000_4_CreateSP.sql#L380324) | — | 0 / 0 | — |
| `UBFundFactList` | [Fund & GIC](by-topic/fund-gic.md) | [L380374](../../../ScriptDB/000_4_CreateSP.sql#L380374) | 1 / 1 file | 0 / 1 | [Document.cs:3123](../../../UBClasses/Document.cs#L3123) |
| `UBFundFactListOneClient` | [Fund & GIC](by-topic/fund-gic.md) | [L380657](../../../ScriptDB/000_4_CreateSP.sql#L380657) | 1 / 1 file | 0 / 0 | [Document.cs:2883](../../../UBClasses/Document.cs#L2883) |
| `UBFundFactListOneClientPendingTrx` | [Fund & GIC](by-topic/fund-gic.md) | [L380781](../../../ScriptDB/000_4_CreateSP.sql#L380781) | 1 / 1 file | 0 / 0 | [Document.cs:2931](../../../UBClasses/Document.cs#L2931) |
| `UBFundFactListWebClient` | [Fund & GIC](by-topic/fund-gic.md) | [L380868](../../../ScriptDB/000_4_CreateSP.sql#L380868) | 1 / 1 file | 0 / 0 | [Document.cs:3523](../../../UBClasses/Document.cs#L3523) |
| `UBFundFactNoObjList` | [Fund & GIC](by-topic/fund-gic.md) | [L380932](../../../ScriptDB/000_4_CreateSP.sql#L380932) | — | 0 / 0 | — |
| `UBFundFactObj` | [Fund & GIC](by-topic/fund-gic.md) | [L381006](../../../ScriptDB/000_4_CreateSP.sql#L381006) | 2 / 2 file | 0 / 0 | [Document.cs:3033](../../../UBClasses/Document.cs#L3033) |
| `UBFundFactObjAdd` | [Fund & GIC](by-topic/fund-gic.md) | [L381050](../../../ScriptDB/000_4_CreateSP.sql#L381050) | — | 0 / 1 | — |
| `UBFundFactObjAddPortfolio` | [Fund & GIC](by-topic/fund-gic.md) | [L381118](../../../ScriptDB/000_4_CreateSP.sql#L381118) | 1 / 1 file | 0 / 1 | [CPortfolioFundFact.cs:426](../../../VieFUNDPdf/CPortfolioFundFact.cs#L426) |
| `UBFundFactObjAddUI` | [Fund & GIC](by-topic/fund-gic.md) | [L381224](../../../ScriptDB/000_4_CreateSP.sql#L381224) | 1 / 1 file | 0 / 1 | [Document.cs:2816](../../../UBClasses/Document.cs#L2816) |
| `UBFundFactObjAddWithFundPosID` | [Fund & GIC](by-topic/fund-gic.md) | [L381331](../../../ScriptDB/000_4_CreateSP.sql#L381331) | — | 0 / 2 | — |
| `UBFundFactObjAddWithPortfolio` | [Fund & GIC](by-topic/fund-gic.md) | [L381378](../../../ScriptDB/000_4_CreateSP.sql#L381378) | 1 / 1 file | 0 / 2 | [AssetAllocation.cs:1666](../../../UBClasses/AssetAllocation.cs#L1666) |
| `UBFundFactObjByFFID` | [Fund & GIC](by-topic/fund-gic.md) | [L381494](../../../ScriptDB/000_4_CreateSP.sql#L381494) | 1 / 1 file | 0 / 0 | [Document.cs:3033](../../../UBClasses/Document.cs#L3033) |
| `UBFundFactObjByFundDefID` | [Fund & GIC](by-topic/fund-gic.md) | [L381538](../../../ScriptDB/000_4_CreateSP.sql#L381538) | — | 0 / 0 | — |
| `UBFundFactObjByFundDefIDWCX` | [Fund & GIC](by-topic/fund-gic.md) | [L381582](../../../ScriptDB/000_4_CreateSP.sql#L381582) | — | 0 / 0 | — |
| `UBFundFactObjByFundPosID` | [Fund & GIC](by-topic/fund-gic.md) | [L381631](../../../ScriptDB/000_4_CreateSP.sql#L381631) | — | 0 / 0 | — |
| `UBFundFactObjByFundPosIDWCX` | [Fund & GIC](by-topic/fund-gic.md) | [L381683](../../../ScriptDB/000_4_CreateSP.sql#L381683) | — | 0 / 0 | — |
| `UBFundFactRemoveItem` | [Fund & GIC](by-topic/fund-gic.md) | [L381739](../../../ScriptDB/000_4_CreateSP.sql#L381739) | — | 0 / 0 | — |
| `UBFundFactSelectionUpdate` | [Fund & GIC](by-topic/fund-gic.md) | [L381796](../../../ScriptDB/000_4_CreateSP.sql#L381796) | — | 0 / 0 | — |
| `UBFundFactSetLastUpdate` | [Fund & GIC](by-topic/fund-gic.md) | [L381844](../../../ScriptDB/000_4_CreateSP.sql#L381844) | — | 0 / 0 | — |
| `UBFundFactVerifyFundCode1Item` | [Fund & GIC](by-topic/fund-gic.md) | [L381877](../../../ScriptDB/000_4_CreateSP.sql#L381877) | — | 0 / 0 | — |
| `UBFundFavoriteAdd` | [Fund & GIC](by-topic/fund-gic.md) | [L381931](../../../ScriptDB/000_4_CreateSP.sql#L381931) | 1 / 1 file | 0 / 0 | [FundDef.cs:2273](../../../UBClasses/FundDef.cs#L2273) |
| `UBFundFavoriteList` | [Fund & GIC](by-topic/fund-gic.md) | [L381962](../../../ScriptDB/000_4_CreateSP.sql#L381962) | 1 / 1 file | 0 / 0 | [FundDef.cs:2368](../../../UBClasses/FundDef.cs#L2368) |
| `UBFundFavoriteRemove` | [Fund & GIC](by-topic/fund-gic.md) | [L382024](../../../ScriptDB/000_4_CreateSP.sql#L382024) | 1 / 1 file | 0 / 0 | [FundDef.cs:2318](../../../UBClasses/FundDef.cs#L2318) |
| `UBFundFeeFrequencyList` | [Commission & Fee](by-topic/commission-fee.md) | [L382053](../../../ScriptDB/000_4_CreateSP.sql#L382053) | — | 1 / 0 | — |
| `UBFundIDChange` | [Fund & GIC](by-topic/fund-gic.md) | [L382083](../../../ScriptDB/000_4_CreateSP.sql#L382083) | — | 0 / 0 | — |
| `UBFundInfo` | [Fund & GIC](by-topic/fund-gic.md) | [L382104](../../../ScriptDB/000_4_CreateSP.sql#L382104) | 1 / 1 file | 0 / 4 | [FundDef.cs:1171](../../../UBClasses/FundDef.cs#L1171) |
| `UBFundInfo4Search` | [Fund & GIC](by-topic/fund-gic.md) | [L382391](../../../ScriptDB/000_4_CreateSP.sql#L382391) | 1 / 1 file | 0 / 0 | [FundDef.cs:1233](../../../UBClasses/FundDef.cs#L1233) |
| `UBFundInfoByAcctPosition` | [Fund & GIC](by-topic/fund-gic.md) | [L382419](../../../ScriptDB/000_4_CreateSP.sql#L382419) | 1 / 1 file | 0 / 0 | [FundDef.cs:1414](../../../UBClasses/FundDef.cs#L1414) |
| `UBFundInfoEdit` | [Fund & GIC](by-topic/fund-gic.md) | [L382515](../../../ScriptDB/000_4_CreateSP.sql#L382515) | 1 / 1 file | 0 / 1 | [FundDef.cs:1362](../../../UBClasses/FundDef.cs#L1362) |
| `UBFundInfoPerf` | [Fund & GIC](by-topic/fund-gic.md) | [L382652](../../../ScriptDB/000_4_CreateSP.sql#L382652) | — | 1 / 0 | — |
| `UBFundInfoShort` | [Fund & GIC](by-topic/fund-gic.md) | [L382698](../../../ScriptDB/000_4_CreateSP.sql#L382698) | 1 / 1 file | 1 / 2 | [FundDef.cs:1296](../../../UBClasses/FundDef.cs#L1296) |
| `UBFundList` | [Fund & GIC](by-topic/fund-gic.md) | [L382805](../../../ScriptDB/000_4_CreateSP.sql#L382805) | 2 / 1 file | 0 / 1 | [FundDef.cs:923](../../../UBClasses/FundDef.cs#L923) |
| `UBFundListETF` | [Fund & GIC](by-topic/fund-gic.md) | [L383496](../../../ScriptDB/000_4_CreateSP.sql#L383496) | 1 / 1 file | 0 / 0 | [FundDef.cs:2623](../../../UBClasses/FundDef.cs#L2623) |
| `UBFundListGIC` | [Fund & GIC](by-topic/fund-gic.md) | [L383559](../../../ScriptDB/000_4_CreateSP.sql#L383559) | — | 0 / 0 | — |
| `UBFundListSel` | [Fund & GIC](by-topic/fund-gic.md) | [L383612](../../../ScriptDB/000_4_CreateSP.sql#L383612) | 2 / 1 file | 0 / 0 | [FundDef.cs:131](../../../UBClasses/FundDef.cs#L131) |
| `UBFundListSetNomineeApprove` | [Fund & GIC](by-topic/fund-gic.md) | [L383686](../../../ScriptDB/000_4_CreateSP.sql#L383686) | 1 / 1 file | 0 / 0 | [FundDef.cs:1042](../../../UBClasses/FundDef.cs#L1042) |
| `UBFundLoadTypeList` | [Fund & GIC](by-topic/fund-gic.md) | [L383747](../../../ScriptDB/000_4_CreateSP.sql#L383747) | — | 10 / 0 | — |
| `UBFundLoadTypeListLong` | [Fund & GIC](by-topic/fund-gic.md) | [L383771](../../../ScriptDB/000_4_CreateSP.sql#L383771) | — | 0 / 0 | — |
| `UBFundMgmtList` | [Fund & GIC](by-topic/fund-gic.md) | [L383796](../../../ScriptDB/000_4_CreateSP.sql#L383796) | — | 0 / 0 | — |
| `UBFundNetworkList` | [Fund & GIC](by-topic/fund-gic.md) | [L383868](../../../ScriptDB/000_4_CreateSP.sql#L383868) | — | 4 / 0 | — |
| `UBFundNoDefClass` | [Fund & GIC](by-topic/fund-gic.md) | [L383896](../../../ScriptDB/000_4_CreateSP.sql#L383896) | — | 0 / 0 | — |
| `UBFundPos4RedemptionList` | [Fund & GIC](by-topic/fund-gic.md) | [L383924](../../../ScriptDB/000_4_CreateSP.sql#L383924) | 2 / 1 file | 0 / 1 | [Fee.cs:767](../../../UBClasses/Fee.cs#L767) |
| `UBFundPos4RedemptionLock` | [Fund & GIC](by-topic/fund-gic.md) | [L384027](../../../ScriptDB/000_4_CreateSP.sql#L384027) | — | 0 / 0 | — |
| `UBFundPosAveragedCostCalc_Test` | [Fund & GIC](by-topic/fund-gic.md) | [L384064](../../../ScriptDB/000_4_CreateSP.sql#L384064) | — | 0 / 0 | — |
| `UBFundPosCalcStatMonth` | [Fund & GIC](by-topic/fund-gic.md) | [L384164](../../../ScriptDB/000_4_CreateSP.sql#L384164) | — | 1 / 2 | — |
| `UBFundPosCalcStatMonthOneDealer` | [Fund & GIC](by-topic/fund-gic.md) | [L384241](../../../ScriptDB/000_4_CreateSP.sql#L384241) | — | 0 / 1 | — |
| `UBFundPosDesc` | [Fund & GIC](by-topic/fund-gic.md) | [L384284](../../../ScriptDB/000_4_CreateSP.sql#L384284) | 1 / 1 file | 0 / 0 | [FundAccount.cs:1217](../../../UBClasses/FundAccount.cs#L1217) |
| `UBFundPosInfo` | [Fund & GIC](by-topic/fund-gic.md) | [L384311](../../../ScriptDB/000_4_CreateSP.sql#L384311) | 1 / 1 file | 0 / 0 | [FundAccount.cs:1115](../../../UBClasses/FundAccount.cs#L1115) |
| `UBFundPositionWithUnitNoTrx` | [Fund & GIC](by-topic/fund-gic.md) | [L384328](../../../ScriptDB/000_4_CreateSP.sql#L384328) | — | 0 / 0 | — |
| `UBFundPosMoveOrder` | [Fund & GIC](by-topic/fund-gic.md) | [L384358](../../../ScriptDB/000_4_CreateSP.sql#L384358) | 1 / 1 file | 0 / 0 | [Fee.cs:1092](../../../UBClasses/Fee.cs#L1092) |
| `UBFundPosSelectionUpdate` | [Fund & GIC](by-topic/fund-gic.md) | [L384486](../../../ScriptDB/000_4_CreateSP.sql#L384486) | — | 0 / 0 | — |
| `UBFundPriceAdd` | [Fund & GIC](by-topic/fund-gic.md) | [L384530](../../../ScriptDB/000_4_CreateSP.sql#L384530) | — | 3 / 0 | — |
| `UBFundPriceList` | [Fund & GIC](by-topic/fund-gic.md) | [L384751](../../../ScriptDB/000_4_CreateSP.sql#L384751) | 1 / 1 file | 0 / 0 | [FundDef.cs:1748](../../../UBClasses/FundDef.cs#L1748) |
| `UBFundPriceList100` | [Fund & GIC](by-topic/fund-gic.md) | [L385435](../../../ScriptDB/000_4_CreateSP.sql#L385435) | — | 2 / 0 | — |
| `UBFundPriceMerge` | [Fund & GIC](by-topic/fund-gic.md) | [L385453](../../../ScriptDB/000_4_CreateSP.sql#L385453) | — | 0 / 0 | — |
| `UBFundPriceUpdate` | [Fund & GIC](by-topic/fund-gic.md) | [L385527](../../../ScriptDB/000_4_CreateSP.sql#L385527) | — | 3 / 1 | — |
| `UBFundRegionList` | [Fund & GIC](by-topic/fund-gic.md) | [L385555](../../../ScriptDB/000_4_CreateSP.sql#L385555) | — | 6 / 0 | — |
| `UBFundReqDocTypeList` | [Fund & GIC](by-topic/fund-gic.md) | [L385585](../../../ScriptDB/000_4_CreateSP.sql#L385585) | — | 1 / 0 | — |
| `UBFundRiskList` | [Fund & GIC](by-topic/fund-gic.md) | [L385615](../../../ScriptDB/000_4_CreateSP.sql#L385615) | — | 17 / 0 | — |
| `UBFundSearchList` | [Fund & GIC](by-topic/fund-gic.md) | [L385648](../../../ScriptDB/000_4_CreateSP.sql#L385648) | 1 / 1 file | 0 / 0 | [FundDef.cs:299](../../../UBClasses/FundDef.cs#L299) |
| `UBFundSearchXList` | [Fund & GIC](by-topic/fund-gic.md) | [L386196](../../../ScriptDB/000_4_CreateSP.sql#L386196) | 1 / 1 file | 0 / 1 | [FundDef.cs:372](../../../UBClasses/FundDef.cs#L372) |
| `UBFundServComboList` | [Fundserv & Import](by-topic/fundserv-import.md) | [L387287](../../../ScriptDB/000_4_CreateSP.sql#L387287) | — | 0 / 5 | — |
| `UBFundServCommissionFileList` | [Commission & Fee](by-topic/commission-fee.md) | [L387320](../../../ScriptDB/000_4_CreateSP.sql#L387320) | 1 / 1 file | 0 / 0 | [FundServ.cs:573](../../../UBClasses/FundServ.cs#L573) |
| `UBFundServErrorDescription` | [Fundserv & Import](by-topic/fundserv-import.md) | [L387448](../../../ScriptDB/000_4_CreateSP.sql#L387448) | 1 / 1 file | 0 / 0 | [FundServ.cs:346](../../../UBClasses/FundServ.cs#L346) |
| `UBFundServErrorLogLevelList` | [Fundserv & Import](by-topic/fundserv-import.md) | [L387886](../../../ScriptDB/000_4_CreateSP.sql#L387886) | — | 1 / 0 | — |
| `UBFundServErrorLogList` | [Fundserv & Import](by-topic/fundserv-import.md) | [L387911](../../../ScriptDB/000_4_CreateSP.sql#L387911) | 1 / 1 file | 0 / 0 | [FundServ.cs:498](../../../UBClasses/FundServ.cs#L498) |
| `UBFundServErrorLogRemove` | [Fundserv & Import](by-topic/fundserv-import.md) | [L388113](../../../ScriptDB/000_4_CreateSP.sql#L388113) | 1 / 1 file | 0 / 0 | [FundServ.cs:259](../../../UBClasses/FundServ.cs#L259) |
| `UBFundServErrorProcess` | [Fundserv & Import](by-topic/fundserv-import.md) | [L388176](../../../ScriptDB/000_4_CreateSP.sql#L388176) | 1 / 1 file | 1 / 4 | [FundServ.cs:305](../../../UBClasses/FundServ.cs#L305) |
| `UBFundServErrorProcess_HS` | [Fundserv & Import](by-topic/fundserv-import.md) | [L388346](../../../ScriptDB/000_4_CreateSP.sql#L388346) | — | 0 / 1 | — |
| `UBFundServErrorProcessWithMap` | [Fundserv & Import](by-topic/fundserv-import.md) | [L388417](../../../ScriptDB/000_4_CreateSP.sql#L388417) | 1 / 1 file | 0 / 4 | [FundServ.cs:391](../../../UBClasses/FundServ.cs#L391) |
| `UBFundServEventLogList` | [Fundserv & Import](by-topic/fundserv-import.md) | [L388666](../../../ScriptDB/000_4_CreateSP.sql#L388666) | 1 / 1 file | 0 / 0 | [FundServ.cs:190](../../../UBClasses/FundServ.cs#L190) |
| `UBFundServEventLogRemove` | [Fundserv & Import](by-topic/fundserv-import.md) | [L388743](../../../ScriptDB/000_4_CreateSP.sql#L388743) | 1 / 1 file | 0 / 0 | [FundServ.cs:259](../../../UBClasses/FundServ.cs#L259) |
| `UBFundServFileInfo` | [Fundserv & Import](by-topic/fundserv-import.md) | [L388789](../../../ScriptDB/000_4_CreateSP.sql#L388789) | 1 / 1 file | 0 / 0 | [FundServ.cs:632](../../../UBClasses/FundServ.cs#L632) |
| `UBFundServFileStatusList` | [Fundserv & Import](by-topic/fundserv-import.md) | [L388873](../../../ScriptDB/000_4_CreateSP.sql#L388873) | — | 1 / 0 | — |
| `UBFundServFileTypeList` | [Fundserv & Import](by-topic/fundserv-import.md) | [L388898](../../../ScriptDB/000_4_CreateSP.sql#L388898) | — | 1 / 0 | — |
| `UBFundServImportedFileList` | [Fundserv & Import](by-topic/fundserv-import.md) | [L388923](../../../ScriptDB/000_4_CreateSP.sql#L388923) | 1 / 1 file | 0 / 0 | [FundServ.cs:70](../../../UBClasses/FundServ.cs#L70) |
| `UBFundServProcessErrorLogOneFile` | [Fundserv & Import](by-topic/fundserv-import.md) | [L389075](../../../ScriptDB/000_4_CreateSP.sql#L389075) | — | 0 / 1 | — |
| `UBFundServTSPSummary` | [Fundserv & Import](by-topic/fundserv-import.md) | [L389101](../../../ScriptDB/000_4_CreateSP.sql#L389101) | — | 0 / 0 | — |
| `UBFundSplitMgmtFundID` | [Fund & GIC](by-topic/fund-gic.md) | [L389176](../../../ScriptDB/000_4_CreateSP.sql#L389176) | — | 10 / 0 | — |
| `UBFundStatusList` | [Fund & GIC](by-topic/fund-gic.md) | [L389231](../../../ScriptDB/000_4_CreateSP.sql#L389231) | — | 2 / 0 | — |
| `UBFundTaxStructureList` | [Fund & GIC](by-topic/fund-gic.md) | [L389256](../../../ScriptDB/000_4_CreateSP.sql#L389256) | — | 1 / 0 | — |
| `UBFundTrxAmountFromList` | [Fund & GIC](by-topic/fund-gic.md) | [L389286](../../../ScriptDB/000_4_CreateSP.sql#L389286) | 1 / 1 file | 0 / 0 | [Trx.cs:6323](../../../UBClasses/Trx.cs#L6323) |
| `UBFundTrxBasketAdd` | [Fund & GIC](by-topic/fund-gic.md) | [L389309](../../../ScriptDB/000_4_CreateSP.sql#L389309) | — | 4 / 0 | — |
| `UBFundTrxBasketICTEdit` | [Fund & GIC](by-topic/fund-gic.md) | [L389436](../../../ScriptDB/000_4_CreateSP.sql#L389436) | 1 / 1 file | 0 / 0 | [Trx.cs:1998](../../../UBClasses/Trx.cs#L1998) |
| `UBFundTrxBasketICTFundAdd` | [Fund & GIC](by-topic/fund-gic.md) | [L389552](../../../ScriptDB/000_4_CreateSP.sql#L389552) | 1 / 1 file | 0 / 0 | [PanelBasketICTFundAdd.cs:182](../../../WebApp/Main/PanelBasketICTFundAdd.cs#L182) |
| `UBFundTrxBasketICTFundList` | [Fund & GIC](by-topic/fund-gic.md) | [L389643](../../../ScriptDB/000_4_CreateSP.sql#L389643) | 1 / 1 file | 0 / 0 | [FundAccount.cs:973](../../../UBClasses/FundAccount.cs#L973) |
| `UBFundTrxBasketICTFundRemove` | [Fund & GIC](by-topic/fund-gic.md) | [L389690](../../../ScriptDB/000_4_CreateSP.sql#L389690) | 1 / 1 file | 0 / 0 | [PanelBasketICTFundAdd.cs:303](../../../WebApp/Main/PanelBasketICTFundAdd.cs#L303) |
| `UBFundTrxBuy` | [Fund & GIC](by-topic/fund-gic.md) | [L389772](../../../ScriptDB/000_4_CreateSP.sql#L389772) | 1 / 1 file | 1 / 7 | [Trx.cs:632](../../../UBClasses/Trx.cs#L632) |
| `UBFundTrxBuyBasket` | [Fund & GIC](by-topic/fund-gic.md) | [L390694](../../../ScriptDB/000_4_CreateSP.sql#L390694) | 1 / 1 file | 0 / 1 | [Trx.cs:4658](../../../UBClasses/Trx.cs#L4658) |
| `UBFundTrxBuyEdit` | [Fund & GIC](by-topic/fund-gic.md) | [L391415](../../../ScriptDB/000_4_CreateSP.sql#L391415) | 1 / 1 file | 0 / 5 | [Trx.cs:890](../../../UBClasses/Trx.cs#L890) |
| `UBFundTrxBuyOne` | [Fund & GIC](by-topic/fund-gic.md) | [L392011](../../../ScriptDB/000_4_CreateSP.sql#L392011) | — | 5 / 6 | — |
| `UBFundTrxBuyShort` | [Fund & GIC](by-topic/fund-gic.md) | [L392648](../../../ScriptDB/000_4_CreateSP.sql#L392648) | — | 7 / 5 | — |
| `UBFundTrxCancel` | [Fund & GIC](by-topic/fund-gic.md) | [L393014](../../../ScriptDB/000_4_CreateSP.sql#L393014) | — | 0 / 2 | — |
| `UBFundTrxChange` | [Fund & GIC](by-topic/fund-gic.md) | [L393125](../../../ScriptDB/000_4_CreateSP.sql#L393125) | — | 0 / 1 | — |
| `UBFundTrxConversionBulkBasketAdd` | [Fund & GIC](by-topic/fund-gic.md) | [L393180](../../../ScriptDB/000_4_CreateSP.sql#L393180) | — | 1 / 0 | — |
| `UBFundTrxConversionBulkBasketUpdate` | [Fund & GIC](by-topic/fund-gic.md) | [L393207](../../../ScriptDB/000_4_CreateSP.sql#L393207) | — | 1 / 0 | — |
| `UBFundTrxDesc` | [Fund & GIC](by-topic/fund-gic.md) | [L393258](../../../ScriptDB/000_4_CreateSP.sql#L393258) | 1 / 1 file | 0 / 0 | [Trx.cs:5858](../../../UBClasses/Trx.cs#L5858) |
| `UBFundTrxICT` | [Fund & GIC](by-topic/fund-gic.md) | [L393311](../../../ScriptDB/000_4_CreateSP.sql#L393311) | 1 / 1 file | 0 / 6 | [Trx.cs:1840](../../../UBClasses/Trx.cs#L1840) |
| `UBFundTrxICTAddOneShort` | [Fund & GIC](by-topic/fund-gic.md) | [L393654](../../../ScriptDB/000_4_CreateSP.sql#L393654) | — | 1 / 4 | — |
| `UBFundTrxICTBasket` | [Fund & GIC](by-topic/fund-gic.md) | [L393877](../../../ScriptDB/000_4_CreateSP.sql#L393877) | 1 / 1 file | 0 / 1 | [Trx.cs:4979](../../../UBClasses/Trx.cs#L4979) |
| `UBFundTrxICTEdit` | [Fund & GIC](by-topic/fund-gic.md) | [L394171](../../../ScriptDB/000_4_CreateSP.sql#L394171) | 1 / 1 file | 0 / 1 | [Trx.cs:1919](../../../UBClasses/Trx.cs#L1919) |
| `UBFundTrxICTFundAdd` | [Fund & GIC](by-topic/fund-gic.md) | [L394301](../../../ScriptDB/000_4_CreateSP.sql#L394301) | 3 / 3 file | 0 / 0 | [PanelICTFundAdd.aspx.cs:182](../../../WebApp/Main/PanelICTFundAdd.aspx.cs#L182) |
| `UBFundTrxICTFundList` | [Fund & GIC](by-topic/fund-gic.md) | [L394396](../../../ScriptDB/000_4_CreateSP.sql#L394396) | 1 / 1 file | 0 / 0 | [FundAccount.cs:884](../../../UBClasses/FundAccount.cs#L884) |
| `UBFundTrxICTFundRemove` | [Fund & GIC](by-topic/fund-gic.md) | [L394433](../../../ScriptDB/000_4_CreateSP.sql#L394433) | 3 / 3 file | 1 / 0 | [PanelICTFundAdd.aspx.cs:303](../../../WebApp/Main/PanelICTFundAdd.aspx.cs#L303) |
| `UBFundTrxICTOne` | [Fund & GIC](by-topic/fund-gic.md) | [L394493](../../../ScriptDB/000_4_CreateSP.sql#L394493) | — | 2 / 5 | — |
| `UBFundTrxInfoLastWithType` | [Fund & GIC](by-topic/fund-gic.md) | [L394887](../../../ScriptDB/000_4_CreateSP.sql#L394887) | — | 1 / 0 | — |
| `UBFundTrxManualAdd` | [Fund & GIC](by-topic/fund-gic.md) | [L394947](../../../ScriptDB/000_4_CreateSP.sql#L394947) | — | 0 / 7 | — |
| `UBFundTrxManualCalc` | [Fund & GIC](by-topic/fund-gic.md) | [L395453](../../../ScriptDB/000_4_CreateSP.sql#L395453) | 1 / 1 file | 0 / 0 | [Trx.cs:3011](../../../UBClasses/Trx.cs#L3011) |
| `UBFundTrxManualUpdate` | [Fund & GIC](by-topic/fund-gic.md) | [L395604](../../../ScriptDB/000_4_CreateSP.sql#L395604) | — | 0 / 9 | — |
| `UBFundTrxMergeTrx` | [Fund & GIC](by-topic/fund-gic.md) | [L396271](../../../ScriptDB/000_4_CreateSP.sql#L396271) | — | 0 / 0 | — |
| `UBFundTrxMove` | [Fund & GIC](by-topic/fund-gic.md) | [L396319](../../../ScriptDB/000_4_CreateSP.sql#L396319) | 1 / 1 file | 2 / 0 | [FundAccount.cs:3148](../../../UBClasses/FundAccount.cs#L3148) |
| `UBFundTrxMove2Plan` | [Fund & GIC](by-topic/fund-gic.md) | [L396399](../../../ScriptDB/000_4_CreateSP.sql#L396399) | — | 0 / 1 | — |
| `UBFundTrxMoveAll` | [Fund & GIC](by-topic/fund-gic.md) | [L396436](../../../ScriptDB/000_4_CreateSP.sql#L396436) | — | 0 / 1 | — |
| `UBFundTrxOrderAdd` | [Fund & GIC](by-topic/fund-gic.md) | [L396471](../../../ScriptDB/000_4_CreateSP.sql#L396471) | — | 22 / 1 | — |
| `UBFundTrxOrderARC` | [Fund & GIC](by-topic/fund-gic.md) | [L396634](../../../ScriptDB/000_4_CreateSP.sql#L396634) | — | 29 / 0 | — |
| `UBFundTrxOrderCANCAX` | [Fund & GIC](by-topic/fund-gic.md) | [L396731](../../../ScriptDB/000_4_CreateSP.sql#L396731) | 1 / 1 file | 0 / 0 | [Trx.cs:819](../../../UBClasses/Trx.cs#L819) |
| `UBFundTrxOrderRestore` | [Fund & GIC](by-topic/fund-gic.md) | [L396943](../../../ScriptDB/000_4_CreateSP.sql#L396943) | — | 0 / 0 | — |
| `UBFundTrxOrderREVAdd` | [Fund & GIC](by-topic/fund-gic.md) | [L397077](../../../ScriptDB/000_4_CreateSP.sql#L397077) | — | 1 / 3 | — |
| `UBFundTrxRemoveDuplicateDividend` | [Fund & GIC](by-topic/fund-gic.md) | [L397288](../../../ScriptDB/000_4_CreateSP.sql#L397288) | — | 0 / 0 | — |
| `UBFundTrxREV` | [Fund & GIC](by-topic/fund-gic.md) | [L397330](../../../ScriptDB/000_4_CreateSP.sql#L397330) | — | 0 / 2 | — |
| `UBFundTrxSell` | [Fund & GIC](by-topic/fund-gic.md) | [L397587](../../../ScriptDB/000_4_CreateSP.sql#L397587) | 1 / 1 file | 1 / 7 | [Trx.cs:1018](../../../UBClasses/Trx.cs#L1018) |
| `UBFundTrxSellBasket` | [Fund & GIC](by-topic/fund-gic.md) | [L398155](../../../ScriptDB/000_4_CreateSP.sql#L398155) | 1 / 1 file | 0 / 1 | [Trx.cs:4866](../../../UBClasses/Trx.cs#L4866) |
| `UBFundTrxSellConversionBulkBasket` | [Fund & GIC](by-topic/fund-gic.md) | [L398575](../../../ScriptDB/000_4_CreateSP.sql#L398575) | 1 / 1 file | 0 / 1 | [BulkSwitchBasket.cs:1282](../../../UBClasses/BulkSwitchBasket.cs#L1282) |
| `UBFundTrxSellEdit` | [Fund & GIC](by-topic/fund-gic.md) | [L398835](../../../ScriptDB/000_4_CreateSP.sql#L398835) | 1 / 1 file | 0 / 5 | [Trx.cs:1145](../../../UBClasses/Trx.cs#L1145) |
| `UBFundTrxSellOne` | [Fund & GIC](by-topic/fund-gic.md) | [L399204](../../../ScriptDB/000_4_CreateSP.sql#L399204) | — | 9 / 6 | — |
| `UBFundTrxSellShort` | [Fund & GIC](by-topic/fund-gic.md) | [L399556](../../../ScriptDB/000_4_CreateSP.sql#L399556) | — | 8 / 6 | — |
| `UBFundTrxSetRejected` | [Fund & GIC](by-topic/fund-gic.md) | [L399920](../../../ScriptDB/000_4_CreateSP.sql#L399920) | — | 0 / 0 | — |
| `UBFundTrxSwitch` | [Fund & GIC](by-topic/fund-gic.md) | [L400027](../../../ScriptDB/000_4_CreateSP.sql#L400027) | 1 / 1 file | 0 / 6 | [Trx.cs:1266](../../../UBClasses/Trx.cs#L1266) |
| `UBFundTrxSwitchBasket` | [Fund & GIC](by-topic/fund-gic.md) | [L400587](../../../ScriptDB/000_4_CreateSP.sql#L400587) | 1 / 1 file | 0 / 2 | [Trx.cs:1510](../../../UBClasses/Trx.cs#L1510) |
| `UBFundTrxSwitchEdit` | [Fund & GIC](by-topic/fund-gic.md) | [L401064](../../../ScriptDB/000_4_CreateSP.sql#L401064) | 1 / 1 file | 0 / 2 | [Trx.cs:1390](../../../UBClasses/Trx.cs#L1390) |
| `UBFundTrxSwitchOne` | [Fund & GIC](by-topic/fund-gic.md) | [L401582](../../../ScriptDB/000_4_CreateSP.sql#L401582) | — | 2 / 5 | — |
| `UBFundTrxSwitchShort` | [Fund & GIC](by-topic/fund-gic.md) | [L402062](../../../ScriptDB/000_4_CreateSP.sql#L402062) | — | 2 / 5 | — |
| `UBFundTrxTransfer` | [Fund & GIC](by-topic/fund-gic.md) | [L402581](../../../ScriptDB/000_4_CreateSP.sql#L402581) | 1 / 1 file | 0 / 6 | [Trx.cs:1624](../../../UBClasses/Trx.cs#L1624) |
| `UBFundTrxTransferEdit` | [Fund & GIC](by-topic/fund-gic.md) | [L403021](../../../ScriptDB/000_4_CreateSP.sql#L403021) | 1 / 1 file | 0 / 1 | [Trx.cs:1739](../../../UBClasses/Trx.cs#L1739) |
| `UBFundTrxUpdateBalanceWithCalcVals` | [Fund & GIC](by-topic/fund-gic.md) | [L403192](../../../ScriptDB/000_4_CreateSP.sql#L403192) | 1 / 1 file | 4 / 0 | [FundAccount.cs:1886](../../../UBClasses/FundAccount.cs#L1886) |
| `UBFundTrxUpdateConversionBulkBasket` | [Fund & GIC](by-topic/fund-gic.md) | [L403302](../../../ScriptDB/000_4_CreateSP.sql#L403302) | 1 / 1 file | 0 / 1 | [BulkSwitchBasket.cs:1341](../../../UBClasses/BulkSwitchBasket.cs#L1341) |
| `UBFundTypeList` | [Fund & GIC](by-topic/fund-gic.md) | [L403538](../../../ScriptDB/000_4_CreateSP.sql#L403538) | — | 10 / 0 | — |
| `UBFundUpdateInvObj` | [Fund & GIC](by-topic/fund-gic.md) | [L403568](../../../ScriptDB/000_4_CreateSP.sql#L403568) | 1 / 1 file | 0 / 3 | [FundDef.cs:2518](../../../UBClasses/FundDef.cs#L2518) |
| `UBGeneralSetupComboList` | [Shared / Other](by-topic/shared-other.md) | [L403650](../../../ScriptDB/000_4_CreateSP.sql#L403650) | — | 0 / 1 | — |
| `UBGenerateAccountNumber` | [Account & Plan](by-topic/account-plan.md) | [L403695](../../../ScriptDB/000_4_CreateSP.sql#L403695) | — | 6 / 0 | — |
| `UBGeneratePlanID` | [Account & Plan](by-topic/account-plan.md) | [L403767](../../../ScriptDB/000_4_CreateSP.sql#L403767) | — | 1 / 1 | — |
| `UBGeneratePlanID1912` | [Account & Plan](by-topic/account-plan.md) | [L403884](../../../ScriptDB/000_4_CreateSP.sql#L403884) | — | 1 / 1 | — |
| `UBGeneratePlanIDX` | [Account & Plan](by-topic/account-plan.md) | [L403956](../../../ScriptDB/000_4_CreateSP.sql#L403956) | — | 7 / 2 | — |
| `UBGetDistributionRate` | [Shared / Other](by-topic/shared-other.md) | [L403984](../../../ScriptDB/000_4_CreateSP.sql#L403984) | — | 1 / 0 | — |
| `UBGetDistributionRateX` | [Shared / Other](by-topic/shared-other.md) | [L404016](../../../ScriptDB/000_4_CreateSP.sql#L404016) | — | 2 / 0 | — |
| `UBGetDividendOpt` | [Shared / Other](by-topic/shared-other.md) | [L404053](../../../ScriptDB/000_4_CreateSP.sql#L404053) | 1 / 1 file | 0 / 0 | [FundAccount.cs:602](../../../UBClasses/FundAccount.cs#L602) |
| `UBGetESignatureSourceType` | [Documents & PDF](by-topic/documents-pdf.md) | [L404077](../../../ScriptDB/000_4_CreateSP.sql#L404077) | 2 / 2 file | 0 / 0 | [ESignature.cs:40](../../../UBClasses/ESignature.cs#L40) |
| `UBGetMemberTaxAmount` | [Shared / Other](by-topic/shared-other.md) | [L404101](../../../ScriptDB/000_4_CreateSP.sql#L404101) | — | 5 / 1 | — |
| `UBGetMemberTaxRate` | [Shared / Other](by-topic/shared-other.md) | [L404125](../../../ScriptDB/000_4_CreateSP.sql#L404125) | — | 1 / 1 | — |
| `UBGetPdfObj` | [Documents & PDF](by-topic/documents-pdf.md) | [L404157](../../../ScriptDB/000_4_CreateSP.sql#L404157) | 1 / 1 file | 0 / 0 | [CPDF.cs:18508](../../../VieFUNDPdf/CPDF.cs#L18508) |
| `UBGetPlanClientNames` | [Account & Plan](by-topic/account-plan.md) | [L404207](../../../ScriptDB/000_4_CreateSP.sql#L404207) | — | 0 / 0 | — |
| `UBGetPlanCompensation` | [Account & Plan](by-topic/account-plan.md) | [L404243](../../../ScriptDB/000_4_CreateSP.sql#L404243) | — | 1 / 1 | — |
| `UBGetPlanMKV` | [Account & Plan](by-topic/account-plan.md) | [L404584](../../../ScriptDB/000_4_CreateSP.sql#L404584) | — | 1 / 0 | — |
| `UBGetReceiptByDepositType` | [Shared / Other](by-topic/shared-other.md) | [L404771](../../../ScriptDB/000_4_CreateSP.sql#L404771) | — | 0 / 0 | — |
| `UBGetRepID` | [Shared / Other](by-topic/shared-other.md) | [L404793](../../../ScriptDB/000_4_CreateSP.sql#L404793) | — | 0 / 0 | — |
| `UBGetRRSPDates` | [Account & Plan](by-topic/account-plan.md) | [L404827](../../../ScriptDB/000_4_CreateSP.sql#L404827) | — | 1 / 0 | — |
| `UBGetServerTime` | [Shared / Other](by-topic/shared-other.md) | [L404852](../../../ScriptDB/000_4_CreateSP.sql#L404852) | 1 / 1 file | 0 / 0 | [CDatabase.cs:1672](../../../UBConnection/CDatabase.cs#L1672) |
| `UBGetSettings` | [Shared / Other](by-topic/shared-other.md) | [L404922](../../../ScriptDB/000_4_CreateSP.sql#L404922) | 3 / 2 file | 4 / 0 | [CBase.cs:1178](../../../UBClasses/CBase.cs#L1178) |
| `UBGetSettingsX` | [Shared / Other](by-topic/shared-other.md) | [L405000](../../../ScriptDB/000_4_CreateSP.sql#L405000) | 2 / 2 file | 0 / 0 | [ClientInfo.cs:264](../../../OnboardingWebServices/ClientInfo.cs#L264) |
| `UBGetTaxRate` | [Shared / Other](by-topic/shared-other.md) | [L405157](../../../ScriptDB/000_4_CreateSP.sql#L405157) | — | 1 / 0 | — |
| `UBGetUniformitySnapshot` | [Compliance](by-topic/compliance.md) | [L405207](../../../ScriptDB/000_4_CreateSP.sql#L405207) | 3 / 2 file | 1 / 0 | [Uniformity.cs:309](../../../UBClasses/Uniformity.cs#L309) |
| `UBGetWHTRate` | [Shared / Other](by-topic/shared-other.md) | [L405487](../../../ScriptDB/000_4_CreateSP.sql#L405487) | — | 4 / 0 | — |
| `UBGetWHTRateN` | [Shared / Other](by-topic/shared-other.md) | [L405531](../../../ScriptDB/000_4_CreateSP.sql#L405531) | — | 1 / 0 | — |
| `UBGetWHTRequired` | [Shared / Other](by-topic/shared-other.md) | [L405600](../../../ScriptDB/000_4_CreateSP.sql#L405600) | — | 4 / 1 | — |
| `UBGetWHTRequiredX` | [Shared / Other](by-topic/shared-other.md) | [L405644](../../../ScriptDB/000_4_CreateSP.sql#L405644) | — | 1 / 1 | — |
| `UBGIAAnnuAdd` | [Shared / Other](by-topic/shared-other.md) | [L405697](../../../ScriptDB/000_4_CreateSP.sql#L405697) | — | 0 / 4 | — |
| `UBGIAAnnuEdit` | [Shared / Other](by-topic/shared-other.md) | [L405805](../../../ScriptDB/000_4_CreateSP.sql#L405805) | 1 / 1 file | 0 / 0 | [PanelGICAnnuAdd.aspx.cs:65](../../../WebApp/Main/PanelGICAnnuAdd.aspx.cs#L65) |
| `UBGIAAnnuRemove` | [Shared / Other](by-topic/shared-other.md) | [L405856](../../../ScriptDB/000_4_CreateSP.sql#L405856) | 1 / 1 file | 0 / 1 | [PanelGICAnnuAdd.aspx.cs:321](../../../WebApp/Main/PanelGICAnnuAdd.aspx.cs#L321) |
| `UBGIAAnnuUpdate` | [Shared / Other](by-topic/shared-other.md) | [L405912](../../../ScriptDB/000_4_CreateSP.sql#L405912) | — | 0 / 7 | — |
| `UBGIABenAdd` | [Shared / Other](by-topic/shared-other.md) | [L406030](../../../ScriptDB/000_4_CreateSP.sql#L406030) | — | 0 / 4 | — |
| `UBGIABenEdit` | [Shared / Other](by-topic/shared-other.md) | [L406153](../../../ScriptDB/000_4_CreateSP.sql#L406153) | 1 / 1 file | 0 / 0 | [PanelGICBenAdd.aspx.cs:66](../../../WebApp/Main/PanelGICBenAdd.aspx.cs#L66) |
| `UBGIABenRemove` | [Shared / Other](by-topic/shared-other.md) | [L406208](../../../ScriptDB/000_4_CreateSP.sql#L406208) | 1 / 1 file | 0 / 1 | [PanelGICBenAdd.aspx.cs:384](../../../WebApp/Main/PanelGICBenAdd.aspx.cs#L384) |
| `UBGIABenUpdate` | [Shared / Other](by-topic/shared-other.md) | [L406263](../../../ScriptDB/000_4_CreateSP.sql#L406263) | — | 0 / 7 | — |
| `UBGIAInfoAnnuList` | [Shared / Other](by-topic/shared-other.md) | [L406393](../../../ScriptDB/000_4_CreateSP.sql#L406393) | 1 / 1 file | 0 / 0 | [TermDeposit.cs:299](../../../UBClasses/TermDeposit.cs#L299) |
| `UBGIAInfoBenList` | [Shared / Other](by-topic/shared-other.md) | [L406441](../../../ScriptDB/000_4_CreateSP.sql#L406441) | 1 / 1 file | 0 / 0 | [TermDeposit.cs:169](../../../UBClasses/TermDeposit.cs#L169) |
| `UBGIASuccessorAdd` | [Shared / Other](by-topic/shared-other.md) | [L406492](../../../ScriptDB/000_4_CreateSP.sql#L406492) | — | 1 / 5 | — |
| `UBGIASuccessorEdit` | [Shared / Other](by-topic/shared-other.md) | [L406616](../../../ScriptDB/000_4_CreateSP.sql#L406616) | — | 0 / 0 | — |
| `UBGIASuccessorRemove` | [Shared / Other](by-topic/shared-other.md) | [L406671](../../../ScriptDB/000_4_CreateSP.sql#L406671) | — | 0 / 1 | — |
| `UBGIASuccessorUpdate` | [Shared / Other](by-topic/shared-other.md) | [L406726](../../../ScriptDB/000_4_CreateSP.sql#L406726) | — | 1 / 8 | — |
| `UBGIATMPEnd` | [Shared / Other](by-topic/shared-other.md) | [L406861](../../../ScriptDB/000_4_CreateSP.sql#L406861) | — | 2 / 0 | — |
| `UBGICAccComboList` | [Fund & GIC](by-topic/fund-gic.md) | [L406893](../../../ScriptDB/000_4_CreateSP.sql#L406893) | — | 0 / 26 | — |
| `UBGICAccountAdd` | [Fund & GIC](by-topic/fund-gic.md) | [L406956](../../../ScriptDB/000_4_CreateSP.sql#L406956) | — | 1 / 16 | — |
| `UBGICAccountDetailX` | [Fund & GIC](by-topic/fund-gic.md) | [L407671](../../../ScriptDB/000_4_CreateSP.sql#L407671) | — | 0 / 0 | — |
| `UBGICAccountMKV` | [Fund & GIC](by-topic/fund-gic.md) | [L407822](../../../ScriptDB/000_4_CreateSP.sql#L407822) | — | 0 / 0 | — |
| `UBGICAccountMKV2` | [Fund & GIC](by-topic/fund-gic.md) | [L407893](../../../ScriptDB/000_4_CreateSP.sql#L407893) | — | 1 / 0 | — |
| `UBGICAccountMoveAllFromPlan2Plan` | [Fund & GIC](by-topic/fund-gic.md) | [L407966](../../../ScriptDB/000_4_CreateSP.sql#L407966) | — | 0 / 1 | — |
| `UBGICAccountMoveFromPlan2Plan` | [Fund & GIC](by-topic/fund-gic.md) | [L408003](../../../ScriptDB/000_4_CreateSP.sql#L408003) | 1 / 1 file | 1 / 0 | [TermDeposit.cs:1350](../../../UBClasses/TermDeposit.cs#L1350) |
| `UBGICAccountRemove` | [Fund & GIC](by-topic/fund-gic.md) | [L408094](../../../ScriptDB/000_4_CreateSP.sql#L408094) | — | 1 / 2 | — |
| `UBGICAccountScanMatured` | [Fund & GIC](by-topic/fund-gic.md) | [L408203](../../../ScriptDB/000_4_CreateSP.sql#L408203) | — | 0 / 0 | — |
| `UBGICAccountSchedule` | [Fund & GIC](by-topic/fund-gic.md) | [L408252](../../../ScriptDB/000_4_CreateSP.sql#L408252) | — | 0 / 3 | — |
| `UBGICAccountScheduleGenerateAll` | [Fund & GIC](by-topic/fund-gic.md) | [L408381](../../../ScriptDB/000_4_CreateSP.sql#L408381) | 1 / 1 file | 0 / 3 | [TermDeposit.cs:1556](../../../UBClasses/TermDeposit.cs#L1556) |
| `UBGICAccountStatusList` | [Fund & GIC](by-topic/fund-gic.md) | [L408505](../../../ScriptDB/000_4_CreateSP.sql#L408505) | — | 2 / 0 | — |
| `UBGICAccountTrxAdd` | [Fund & GIC](by-topic/fund-gic.md) | [L408535](../../../ScriptDB/000_4_CreateSP.sql#L408535) | — | 5 / 3 | — |
| `UBGICAccountTrxAddUI` | [Fund & GIC](by-topic/fund-gic.md) | [L408624](../../../ScriptDB/000_4_CreateSP.sql#L408624) | — | 0 / 5 | — |
| `UBGICAccountTrxEditable` | [Fund & GIC](by-topic/fund-gic.md) | [L408878](../../../ScriptDB/000_4_CreateSP.sql#L408878) | 1 / 1 file | 0 / 0 | [TermDeposit.cs:560](../../../UBClasses/TermDeposit.cs#L560) |
| `UBGICAccountTrxEditUI` | [Fund & GIC](by-topic/fund-gic.md) | [L408914](../../../ScriptDB/000_4_CreateSP.sql#L408914) | — | 0 / 1 | — |
| `UBGICAccountTrxInfo` | [Fund & GIC](by-topic/fund-gic.md) | [L408990](../../../ScriptDB/000_4_CreateSP.sql#L408990) | 1 / 1 file | 0 / 0 | [TermDeposit.cs:386](../../../UBClasses/TermDeposit.cs#L386) |
| `UBGICAccountTrxList` | [Fund & GIC](by-topic/fund-gic.md) | [L409042](../../../ScriptDB/000_4_CreateSP.sql#L409042) | 1 / 1 file | 1 / 0 | [TermDeposit.cs:519](../../../UBClasses/TermDeposit.cs#L519) |
| `UBGICAccountTrxRemove` | [Fund & GIC](by-topic/fund-gic.md) | [L409090](../../../ScriptDB/000_4_CreateSP.sql#L409090) | — | 0 / 3 | — |
| `UBGICAccountUpdate` | [Fund & GIC](by-topic/fund-gic.md) | [L409253](../../../ScriptDB/000_4_CreateSP.sql#L409253) | — | 0 / 12 | — |
| `UBGICAcctDesc` | [Fund & GIC](by-topic/fund-gic.md) | [L409855](../../../ScriptDB/000_4_CreateSP.sql#L409855) | 1 / 1 file | 0 / 0 | [TermDeposit.cs:1184](../../../UBClasses/TermDeposit.cs#L1184) |
| `UBGICAccTrxComboList` | [Fund & GIC](by-topic/fund-gic.md) | [L409882](../../../ScriptDB/000_4_CreateSP.sql#L409882) | — | 0 / 4 | — |
| `UBGICAnnuitantTypeList` | [Fund & GIC](by-topic/fund-gic.md) | [L409910](../../../ScriptDB/000_4_CreateSP.sql#L409910) | — | 1 / 0 | — |
| `UBGICCalcMaturity` | [Fund & GIC](by-topic/fund-gic.md) | [L409941](../../../ScriptDB/000_4_CreateSP.sql#L409941) | 1 / 1 file | 0 / 2 | [PopupGICAdd.aspx.cs:2015](../../../WebApp/Main/PopupGICAdd.aspx.cs#L2015) |
| `UBGICCalcMaturityCannex` | [Fund & GIC](by-topic/fund-gic.md) | [L410156](../../../ScriptDB/000_4_CreateSP.sql#L410156) | 1 / 1 file | 0 / 1 | [TermDeposit.cs:2072](../../../UBClasses/TermDeposit.cs#L2072) |
| `UBGICCalcMaturityCannexOne` | [Fund & GIC](by-topic/fund-gic.md) | [L410219](../../../ScriptDB/000_4_CreateSP.sql#L410219) | — | 3 / 2 | — |
| `UBGICCalcPYMTSchedule` | [Fund & GIC](by-topic/fund-gic.md) | [L410346](../../../ScriptDB/000_4_CreateSP.sql#L410346) | — | 4 / 1 | — |
| `UBGICCalcPYMTScheduleSave` | [Fund & GIC](by-topic/fund-gic.md) | [L410809](../../../ScriptDB/000_4_CreateSP.sql#L410809) | — | 1 / 0 | — |
| `UBGICCalcPYMTScheduleX` | [Fund & GIC](by-topic/fund-gic.md) | [L410860](../../../ScriptDB/000_4_CreateSP.sql#L410860) | — | 0 / 0 | — |
| `UBGICCalcPYMTScheduleX2` | [Fund & GIC](by-topic/fund-gic.md) | [L411353](../../../ScriptDB/000_4_CreateSP.sql#L411353) | — | 2 / 0 | — |
| `UBGICCannexBasketInfo` | [Fund & GIC](by-topic/fund-gic.md) | [L411925](../../../ScriptDB/000_4_CreateSP.sql#L411925) | — | 0 / 0 | — |
| `UBGICCannexBasketList` | [Fund & GIC](by-topic/fund-gic.md) | [L411960](../../../ScriptDB/000_4_CreateSP.sql#L411960) | — | 0 / 0 | — |
| `UBGICCannexBuyBasket2Order` | [Fund & GIC](by-topic/fund-gic.md) | [L411998](../../../ScriptDB/000_4_CreateSP.sql#L411998) | 1 / 1 file | 0 / 8 | [TermDeposit.cs:2129](../../../UBClasses/TermDeposit.cs#L2129) |
| `UBGICCannexBuyBasketAdd` | [Fund & GIC](by-topic/fund-gic.md) | [L412395](../../../ScriptDB/000_4_CreateSP.sql#L412395) | 1 / 1 file | 0 / 0 | [TermDeposit.cs:1853](../../../UBClasses/TermDeposit.cs#L1853) |
| `UBGICCannexBuyBasketDelete` | [Fund & GIC](by-topic/fund-gic.md) | [L412655](../../../ScriptDB/000_4_CreateSP.sql#L412655) | 1 / 1 file | 0 / 0 | [TermDeposit.cs:1918](../../../UBClasses/TermDeposit.cs#L1918) |
| `UBGICCannexBuyOrderAdd` | [Fund & GIC](by-topic/fund-gic.md) | [L412674](../../../ScriptDB/000_4_CreateSP.sql#L412674) | 1 / 1 file | 0 / 7 | [TermDeposit.cs:1628](../../../UBClasses/TermDeposit.cs#L1628) |
| `UBGICCannexBuyOrderVerifyBeforeSending` | [Fund & GIC](by-topic/fund-gic.md) | [L413260](../../../ScriptDB/000_4_CreateSP.sql#L413260) | — | 0 / 1 | — |
| `UBGICClientList` | [Fund & GIC](by-topic/fund-gic.md) | [L413334](../../../ScriptDB/000_4_CreateSP.sql#L413334) | 1 / 1 file | 0 / 0 | [TermDeposit.cs:859](../../../UBClasses/TermDeposit.cs#L859) |
| `UBGICConfirmationDeliverItem` | [Fund & GIC](by-topic/fund-gic.md) | [L413376](../../../ScriptDB/000_4_CreateSP.sql#L413376) | — | 1 / 1 | — |
| `UBGICConfirmationList` | [Fund & GIC](by-topic/fund-gic.md) | [L413529](../../../ScriptDB/000_4_CreateSP.sql#L413529) | 1 / 1 file | 0 / 1 | [Document.cs:3768](../../../UBClasses/Document.cs#L3768) |
| `UBGICConfirmationListOneClient` | [Fund & GIC](by-topic/fund-gic.md) | [L413835](../../../ScriptDB/000_4_CreateSP.sql#L413835) | 1 / 1 file | 0 / 0 | [TermDeposit.cs:1758](../../../UBClasses/TermDeposit.cs#L1758) |
| `UBGICConfirmationObjByID` | [Fund & GIC](by-topic/fund-gic.md) | [L413895](../../../ScriptDB/000_4_CreateSP.sql#L413895) | 1 / 1 file | 0 / 0 | [TermDeposit.cs:1702](../../../UBClasses/TermDeposit.cs#L1702) |
| `UBGICConfirmationRemoveItem` | [Fund & GIC](by-topic/fund-gic.md) | [L413920](../../../ScriptDB/000_4_CreateSP.sql#L413920) | — | 0 / 0 | — |
| `UBGICConfirmationSavePdfObj` | [Fund & GIC](by-topic/fund-gic.md) | [L413963](../../../ScriptDB/000_4_CreateSP.sql#L413963) | 1 / 1 file | 0 / 1 | [GICConfirmation.cs:341](../../../VieFUNDPdf/GICConfirmation.cs#L341) |
| `UBGICConfirmationSet` | [Fund & GIC](by-topic/fund-gic.md) | [L414000](../../../ScriptDB/000_4_CreateSP.sql#L414000) | 1 / 1 file | 0 / 8 | [GICConfirmation.cs:390](../../../VieFUNDPdf/GICConfirmation.cs#L390) |
| `UBGICDefCommRateAdd` | [Commission & Fee](by-topic/commission-fee.md) | [L414396](../../../ScriptDB/000_4_CreateSP.sql#L414396) | — | 2 / 0 | — |
| `UBGICDefInfo` | [Fund & GIC](by-topic/fund-gic.md) | [L414463](../../../ScriptDB/000_4_CreateSP.sql#L414463) | — | 1 / 0 | — |
| `UBGICDefLookup` | [Fund & GIC](by-topic/fund-gic.md) | [L414515](../../../ScriptDB/000_4_CreateSP.sql#L414515) | 1 / 1 file | 0 / 0 | [FundDef.cs:4409](../../../UBClasses/FundDef.cs#L4409) |
| `UBGICDefLookupInfoOne` | [Fund & GIC](by-topic/fund-gic.md) | [L414871](../../../ScriptDB/000_4_CreateSP.sql#L414871) | 1 / 1 file | 0 / 0 | [FundDef.cs:4497](../../../UBClasses/FundDef.cs#L4497) |
| `UBGICDurationList` | [Fund & GIC](by-topic/fund-gic.md) | [L414907](../../../ScriptDB/000_4_CreateSP.sql#L414907) | — | 1 / 0 | — |
| `UBGICExport` | [Fund & GIC](by-topic/fund-gic.md) | [L414937](../../../ScriptDB/000_4_CreateSP.sql#L414937) | 1 / 1 file | 0 / 1 | [GICExport.cs:159](../../../UBExport/GICExport.cs#L159) |
| `UBGICFormInfo` | [Fund & GIC](by-topic/fund-gic.md) | [L415146](../../../ScriptDB/000_4_CreateSP.sql#L415146) | 1 / 1 file | 1 / 0 | [TermDeposit.cs:1449](../../../UBClasses/TermDeposit.cs#L1449) |
| `UBGICImportDef` | [Fund & GIC](by-topic/fund-gic.md) | [L415234](../../../ScriptDB/000_4_CreateSP.sql#L415234) | — | 0 / 0 | — |
| `UBGICImportFileClear` | [Fund & GIC](by-topic/fund-gic.md) | [L415247](../../../ScriptDB/000_4_CreateSP.sql#L415247) | — | 1 / 0 | — |
| `UBGICImportFileReadOneRecord` | [Fund & GIC](by-topic/fund-gic.md) | [L415261](../../../ScriptDB/000_4_CreateSP.sql#L415261) | — | 0 / 2 | — |
| `UBGICImportList` | [Fund & GIC](by-topic/fund-gic.md) | [L415332](../../../ScriptDB/000_4_CreateSP.sql#L415332) | 1 / 1 file | 0 / 0 | [GICImport.cs:36](../../../UBClasses/GICImport.cs#L36) |
| `UBGICImportProcess1Record` | [Fund & GIC](by-topic/fund-gic.md) | [L415435](../../../ScriptDB/000_4_CreateSP.sql#L415435) | — | 1 / 2 | — |
| `UBGICImportProcessTaggedItems` | [Fund & GIC](by-topic/fund-gic.md) | [L415758](../../../ScriptDB/000_4_CreateSP.sql#L415758) | — | 0 / 1 | — |
| `UBGICImportSelectionUpdate` | [Fund & GIC](by-topic/fund-gic.md) | [L415804](../../../ScriptDB/000_4_CreateSP.sql#L415804) | — | 0 / 0 | — |
| `UBGICInfo` | [Fund & GIC](by-topic/fund-gic.md) | [L415844](../../../ScriptDB/000_4_CreateSP.sql#L415844) | 1 / 1 file | 0 / 2 | [Customer.cs:3343](../../../UBClasses/Customer.cs#L3343) |
| `UBGICInfoShort` | [Fund & GIC](by-topic/fund-gic.md) | [L416133](../../../ScriptDB/000_4_CreateSP.sql#L416133) | 1 / 1 file | 0 / 0 | [TermDeposit.cs:427](../../../UBClasses/TermDeposit.cs#L427) |
| `UBGICInterestAccrualList` | [Fund & GIC](by-topic/fund-gic.md) | [L416156](../../../ScriptDB/000_4_CreateSP.sql#L416156) | — | 1 / 0 | — |
| `UBGICInterestCalcList` | [Fund & GIC](by-topic/fund-gic.md) | [L416186](../../../ScriptDB/000_4_CreateSP.sql#L416186) | — | 1 / 0 | — |
| `UBGICInterestCompoundFreqList` | [Fund & GIC](by-topic/fund-gic.md) | [L416212](../../../ScriptDB/000_4_CreateSP.sql#L416212) | — | 1 / 0 | — |
| `UBGICMalturedBulkProcessing` | [Fund & GIC](by-topic/fund-gic.md) | [L416242](../../../ScriptDB/000_4_CreateSP.sql#L416242) | — | 0 / 1 | — |
| `UBGICMalturedInit` | [Fund & GIC](by-topic/fund-gic.md) | [L416297](../../../ScriptDB/000_4_CreateSP.sql#L416297) | — | 0 / 0 | — |
| `UBGICMaturityList` | [Fund & GIC](by-topic/fund-gic.md) | [L416324](../../../ScriptDB/000_4_CreateSP.sql#L416324) | — | 0 / 0 | — |
| `UBGICMaturityProcessingOneItem` | [Fund & GIC](by-topic/fund-gic.md) | [L416570](../../../ScriptDB/000_4_CreateSP.sql#L416570) | — | 1 / 2 | — |
| `UBGicMaturityProcessingSelectionUpdate` | [Fund & GIC](by-topic/fund-gic.md) | [L416806](../../../ScriptDB/000_4_CreateSP.sql#L416806) | — | 0 / 0 | — |
| `UBGICOrderAssignNewSourceID` | [Fund & GIC](by-topic/fund-gic.md) | [L416840](../../../ScriptDB/000_4_CreateSP.sql#L416840) | — | 2 / 1 | — |
| `UBGICOrderPendingListCannex` | [Fund & GIC](by-topic/fund-gic.md) | [L416856](../../../ScriptDB/000_4_CreateSP.sql#L416856) | 1 / 1 file | 0 / 3 | [TermDeposit.cs:965](../../../UBClasses/TermDeposit.cs#L965) |
| `UBGICOrderPendingListGICServ` | [Fund & GIC](by-topic/fund-gic.md) | [L417247](../../../ScriptDB/000_4_CreateSP.sql#L417247) | — | 0 / 0 | — |
| `UBGICOrderResendCannex` | [Fund & GIC](by-topic/fund-gic.md) | [L417274](../../../ScriptDB/000_4_CreateSP.sql#L417274) | — | 0 / 2 | — |
| `UBGICOrderSelectionUpdateCannex` | [Fund & GIC](by-topic/fund-gic.md) | [L417292](../../../ScriptDB/000_4_CreateSP.sql#L417292) | — | 0 / 0 | — |
| `UBGICOrderSelectionUpdateGICServ` | [Fund & GIC](by-topic/fund-gic.md) | [L417339](../../../ScriptDB/000_4_CreateSP.sql#L417339) | — | 0 / 0 | — |
| `UBGICOrderWaiting2SendAddCannex` | [Fund & GIC](by-topic/fund-gic.md) | [L417386](../../../ScriptDB/000_4_CreateSP.sql#L417386) | — | 2 / 2 | — |
| `UBGICOrderWaiting2SendAddCannexByAccountID` | [Fund & GIC](by-topic/fund-gic.md) | [L417487](../../../ScriptDB/000_4_CreateSP.sql#L417487) | — | 2 / 1 | — |
| `UBGICOrderWaiting2SendRemoveCannex` | [Fund & GIC](by-topic/fund-gic.md) | [L417518](../../../ScriptDB/000_4_CreateSP.sql#L417518) | 1 / 1 file | 0 / 0 | [CannexOrder.cs:325](../../../UBFFImport/CannexOrder.cs#L325) |
| `UBGICOwnershipTypeList` | [Fund & GIC](by-topic/fund-gic.md) | [L417544](../../../ScriptDB/000_4_CreateSP.sql#L417544) | — | 1 / 0 | — |
| `UBGICPlanID` | [Fund & GIC](by-topic/fund-gic.md) | [L417572](../../../ScriptDB/000_4_CreateSP.sql#L417572) | 1 / 1 file | 0 / 0 | [TermDeposit.cs:903](../../../UBClasses/TermDeposit.cs#L903) |
| `UBGICPMTFreqList` | [Fund & GIC](by-topic/fund-gic.md) | [L417606](../../../ScriptDB/000_4_CreateSP.sql#L417606) | — | 3 / 0 | — |
| `UBGICPMTMethodList` | [Fund & GIC](by-topic/fund-gic.md) | [L417636](../../../ScriptDB/000_4_CreateSP.sql#L417636) | — | 2 / 0 | — |
| `UBGICProdTypeList` | [Fund & GIC](by-topic/fund-gic.md) | [L417666](../../../ScriptDB/000_4_CreateSP.sql#L417666) | — | 1 / 0 | — |
| `UBGICPYMTScheduleList` | [Fund & GIC](by-topic/fund-gic.md) | [L417696](../../../ScriptDB/000_4_CreateSP.sql#L417696) | 1 / 1 file | 0 / 1 | [TermDeposit.cs:1508](../../../UBClasses/TermDeposit.cs#L1508) |
| `UBGICRateFileInfo` | [Fund & GIC](by-topic/fund-gic.md) | [L417738](../../../ScriptDB/000_4_CreateSP.sql#L417738) | 1 / 1 file | 0 / 0 | [TermDeposit.cs:42](../../../UBClasses/TermDeposit.cs#L42) |
| `UBGICRateFileInfoSet` | [Fund & GIC](by-topic/fund-gic.md) | [L417776](../../../ScriptDB/000_4_CreateSP.sql#L417776) | 1 / 1 file | 0 / 0 | [TermDeposit.cs:96](../../../UBClasses/TermDeposit.cs#L96) |
| `UBGICRateTypeList` | [Fund & GIC](by-topic/fund-gic.md) | [L417827](../../../ScriptDB/000_4_CreateSP.sql#L417827) | — | 1 / 0 | — |
| `UBGICRedeemAbilityList` | [Fund & GIC](by-topic/fund-gic.md) | [L417857](../../../ScriptDB/000_4_CreateSP.sql#L417857) | — | 2 / 0 | — |
| `UBGICReportMaturity` | [Fund & GIC](by-topic/fund-gic.md) | [L417871](../../../ScriptDB/000_4_CreateSP.sql#L417871) | 1 / 1 file | 0 / 4 | [GIC.cs:276](../../../VieFUNDPdf/GIC.cs#L276) |
| `UBGICReportReminder` | [Fund & GIC](by-topic/fund-gic.md) | [L418154](../../../ScriptDB/000_4_CreateSP.sql#L418154) | 1 / 1 file | 0 / 5 | [GIC.cs:334](../../../VieFUNDPdf/GIC.cs#L334) |
| `UBGICReportTrx` | [Fund & GIC](by-topic/fund-gic.md) | [L418425](../../../ScriptDB/000_4_CreateSP.sql#L418425) | 1 / 1 file | 0 / 4 | [GIC.cs:220](../../../VieFUNDPdf/GIC.cs#L220) |
| `UBGICScanPendingDayEnd` | [Fund & GIC](by-topic/fund-gic.md) | [L418640](../../../ScriptDB/000_4_CreateSP.sql#L418640) | — | 0 / 0 | — |
| `UBGICSetStatus` | [Fund & GIC](by-topic/fund-gic.md) | [L418673](../../../ScriptDB/000_4_CreateSP.sql#L418673) | — | 0 / 0 | — |
| `UBGICStatusInfo` | [Fund & GIC](by-topic/fund-gic.md) | [L418694](../../../ScriptDB/000_4_CreateSP.sql#L418694) | 1 / 1 file | 0 / 0 | [TermDeposit.cs:1800](../../../UBClasses/TermDeposit.cs#L1800) |
| `UBGICTermTypeList` | [Fund & GIC](by-topic/fund-gic.md) | [L418731](../../../ScriptDB/000_4_CreateSP.sql#L418731) | — | 1 / 0 | — |
| `UBGICTermUnitList` | [Fund & GIC](by-topic/fund-gic.md) | [L418761](../../../ScriptDB/000_4_CreateSP.sql#L418761) | — | 1 / 0 | — |
| `UBGICUpdateIntDue` | [Fund & GIC](by-topic/fund-gic.md) | [L418791](../../../ScriptDB/000_4_CreateSP.sql#L418791) | 1 / 1 file | 0 / 0 | [TermDeposit.cs:471](../../../UBClasses/TermDeposit.cs#L471) |
| `UBGICVerifyInterest4T5` | [Fund & GIC](by-topic/fund-gic.md) | [L418826](../../../ScriptDB/000_4_CreateSP.sql#L418826) | — | 1 / 0 | — |
| `UBGICVerifyInterest4T5ScanAll` | [Fund & GIC](by-topic/fund-gic.md) | [L418968](../../../ScriptDB/000_4_CreateSP.sql#L418968) | — | 1 / 1 | — |
| `UBGICViewComboList` | [Fund & GIC](by-topic/fund-gic.md) | [L419009](../../../ScriptDB/000_4_CreateSP.sql#L419009) | — | 0 / 14 | — |
| `UBGICViewListCof` | [Fund & GIC](by-topic/fund-gic.md) | [L419073](../../../ScriptDB/000_4_CreateSP.sql#L419073) | 1 / 1 file | 0 / 0 | [GICConfirmation.cs:139](../../../VieFUNDPdf/GICConfirmation.cs#L139) |
| `UBGICViewSearch` | [Fund & GIC](by-topic/fund-gic.md) | [L419122](../../../ScriptDB/000_4_CreateSP.sql#L419122) | — | 0 / 3 | — |
| `UBGICViewSearchCriteriaSave` | [Fund & GIC](by-topic/fund-gic.md) | [L421000](../../../ScriptDB/000_4_CreateSP.sql#L421000) | — | 1 / 1 | — |
| `UBGICViewSearchTrx` | [Fund & GIC](by-topic/fund-gic.md) | [L421332](../../../ScriptDB/000_4_CreateSP.sql#L421332) | — | 0 / 3 | — |
| `UBGICViewSearchTrxCriteriaSave` | [Fund & GIC](by-topic/fund-gic.md) | [L423498](../../../ScriptDB/000_4_CreateSP.sql#L423498) | — | 1 / 1 | — |
| `UBGMWBPeriodList` | [Shared / Other](by-topic/shared-other.md) | [L423845](../../../ScriptDB/000_4_CreateSP.sql#L423845) | — | 1 / 0 | — |
| `UBHelpList` | [Shared / Other](by-topic/shared-other.md) | [L423875](../../../ScriptDB/000_4_CreateSP.sql#L423875) | — | 0 / 0 | — |
| `UBHelpListAll` | [Shared / Other](by-topic/shared-other.md) | [L423928](../../../ScriptDB/000_4_CreateSP.sql#L423928) | — | 0 / 0 | — |
| `UBHelpRemove` | [Shared / Other](by-topic/shared-other.md) | [L423965](../../../ScriptDB/000_4_CreateSP.sql#L423965) | 1 / 1 file | 0 / 0 | [Help.cs:382](../../../UBClasses/Help.cs#L382) |
| `UBHelpSettingAddUpdate` | [Shared / Other](by-topic/shared-other.md) | [L423984](../../../ScriptDB/000_4_CreateSP.sql#L423984) | 1 / 1 file | 0 / 0 | [Help.cs:206](../../../UBClasses/Help.cs#L206) |
| `UBHelpSettingGet` | [Shared / Other](by-topic/shared-other.md) | [L424042](../../../ScriptDB/000_4_CreateSP.sql#L424042) | — | 0 / 0 | — |
| `UBHelpStatus` | [Shared / Other](by-topic/shared-other.md) | [L424055](../../../ScriptDB/000_4_CreateSP.sql#L424055) | 1 / 1 file | 0 / 0 | [Help.cs:32](../../../UBClasses/Help.cs#L32) |
| `UBHiddenValueArraySave` | [Shared / Other](by-topic/shared-other.md) | [L424093](../../../ScriptDB/000_4_CreateSP.sql#L424093) | 1 / 1 file | 0 / 0 | [CBase.cs:123](../../../UBClasses/CBase.cs#L123) |
| `UBHiddenValueList` | [Shared / Other](by-topic/shared-other.md) | [L424154](../../../ScriptDB/000_4_CreateSP.sql#L424154) | 1 / 1 file | 0 / 0 | [CBase.cs:282](../../../UBClasses/CBase.cs#L282) |
| `UBHiddenValueSave` | [Shared / Other](by-topic/shared-other.md) | [L424229](../../../ScriptDB/000_4_CreateSP.sql#L424229) | 1 / 1 file | 4 / 0 | [CBase.cs:64](../../../UBClasses/CBase.cs#L64) |
| `UBHolidayGenerate` | [Shared / Other](by-topic/shared-other.md) | [L424259](../../../ScriptDB/000_4_CreateSP.sql#L424259) | — | 3 / 1 | — |
| `UBHolidayList` | [Shared / Other](by-topic/shared-other.md) | [L424508](../../../ScriptDB/000_4_CreateSP.sql#L424508) | 1 / 1 file | 0 / 1 | [Holiday.cs:39](../../../UBClasses/Holiday.cs#L39) |
| `UBHolidayRefresh` | [Shared / Other](by-topic/shared-other.md) | [L424535](../../../ScriptDB/000_4_CreateSP.sql#L424535) | — | 4 / 1 | — |
| `UBIdentificationRecMethodList` | [Shared / Other](by-topic/shared-other.md) | [L424557](../../../ScriptDB/000_4_CreateSP.sql#L424557) | — | 2 / 0 | — |
| `UBIdentificationTypeList` | [Shared / Other](by-topic/shared-other.md) | [L424587](../../../ScriptDB/000_4_CreateSP.sql#L424587) | — | 2 / 0 | — |
| `UBImportFileList` | [Shared / Other](by-topic/shared-other.md) | [L424617](../../../ScriptDB/000_4_CreateSP.sql#L424617) | — | 0 / 0 | — |
| `UBInsEditComboList` | [Shared / Other](by-topic/shared-other.md) | [L424662](../../../ScriptDB/000_4_CreateSP.sql#L424662) | — | 0 / 1 | — |
| `UBInsertAddDef` | [Shared / Other](by-topic/shared-other.md) | [L424688](../../../ScriptDB/000_4_CreateSP.sql#L424688) | 1 / 1 file | 0 / 0 | [CInsert.cs:42](../../../UBClasses/CInsert.cs#L42) |
| `UBInsertListDef` | [Shared / Other](by-topic/shared-other.md) | [L424749](../../../ScriptDB/000_4_CreateSP.sql#L424749) | 1 / 1 file | 0 / 0 | [CInsert.cs:134](../../../UBClasses/CInsert.cs#L134) |
| `UBInsertRemoveDef` | [Shared / Other](by-topic/shared-other.md) | [L424781](../../../ScriptDB/000_4_CreateSP.sql#L424781) | 1 / 1 file | 0 / 0 | [CInsert.cs:92](../../../UBClasses/CInsert.cs#L92) |
| `UBInsRelationshipList` | [Shared / Other](by-topic/shared-other.md) | [L424818](../../../ScriptDB/000_4_CreateSP.sql#L424818) | — | 1 / 0 | — |
| `UBInsuranceAdd` | [Shared / Other](by-topic/shared-other.md) | [L424850](../../../ScriptDB/000_4_CreateSP.sql#L424850) | 1 / 1 file | 0 / 2 | [Insurance.cs:66](../../../UBClasses/Insurance.cs#L66) |
| `UBInsuranceApprovalTypeList` | [Shared / Other](by-topic/shared-other.md) | [L425108](../../../ScriptDB/000_4_CreateSP.sql#L425108) | — | 1 / 0 | — |
| `UBInsuranceBenefitPeriodList` | [Shared / Other](by-topic/shared-other.md) | [L425134](../../../ScriptDB/000_4_CreateSP.sql#L425134) | — | 1 / 0 | — |
| `UBInsuranceBenefitTypeList` | [Shared / Other](by-topic/shared-other.md) | [L425160](../../../ScriptDB/000_4_CreateSP.sql#L425160) | — | 1 / 0 | — |
| `UBInsuranceClassList` | [Shared / Other](by-topic/shared-other.md) | [L425186](../../../ScriptDB/000_4_CreateSP.sql#L425186) | — | 1 / 0 | — |
| `UBInsuranceComboList` | [Shared / Other](by-topic/shared-other.md) | [L425212](../../../ScriptDB/000_4_CreateSP.sql#L425212) | — | 0 / 12 | — |
| `UBInsuranceCostTypeList` | [Shared / Other](by-topic/shared-other.md) | [L425254](../../../ScriptDB/000_4_CreateSP.sql#L425254) | — | 1 / 0 | — |
| `UBInsuranceCoverageTypeList` | [Shared / Other](by-topic/shared-other.md) | [L425280](../../../ScriptDB/000_4_CreateSP.sql#L425280) | — | 1 / 0 | — |
| `UBInsuranceDelete` | [Shared / Other](by-topic/shared-other.md) | [L425306](../../../ScriptDB/000_4_CreateSP.sql#L425306) | 1 / 1 file | 0 / 0 | [Insurance.cs:352](../../../UBClasses/Insurance.cs#L352) |
| `UBInsuranceInfo` | [Shared / Other](by-topic/shared-other.md) | [L425339](../../../ScriptDB/000_4_CreateSP.sql#L425339) | 1 / 1 file | 0 / 0 | [Insurance.cs:305](../../../UBClasses/Insurance.cs#L305) |
| `UBInsuranceLifeStyleList` | [Shared / Other](by-topic/shared-other.md) | [L425461](../../../ScriptDB/000_4_CreateSP.sql#L425461) | — | 1 / 0 | — |
| `UBInsuranceList` | [Shared / Other](by-topic/shared-other.md) | [L425487](../../../ScriptDB/000_4_CreateSP.sql#L425487) | 1 / 1 file | 0 / 0 | [Insurance.cs:250](../../../UBClasses/Insurance.cs#L250) |
| `UBInsurancePremiumModeList` | [Shared / Other](by-topic/shared-other.md) | [L425523](../../../ScriptDB/000_4_CreateSP.sql#L425523) | — | 1 / 0 | — |
| `UBInsurancePremiumPeriodList` | [Shared / Other](by-topic/shared-other.md) | [L425549](../../../ScriptDB/000_4_CreateSP.sql#L425549) | — | 1 / 0 | — |
| `UBInsuranceProductListSel` | [Fund & GIC](by-topic/fund-gic.md) | [L425575](../../../ScriptDB/000_4_CreateSP.sql#L425575) | 1 / 1 file | 0 / 0 | [Insurance.cs:401](../../../UBClasses/Insurance.cs#L401) |
| `UBInsuranceProductUpdate` | [Fund & GIC](by-topic/fund-gic.md) | [L425608](../../../ScriptDB/000_4_CreateSP.sql#L425608) | — | 2 / 0 | — |
| `UBInsuranceRiderUpdate` | [Shared / Other](by-topic/shared-other.md) | [L425653](../../../ScriptDB/000_4_CreateSP.sql#L425653) | — | 2 / 0 | — |
| `UBInsuranceStatusList` | [Shared / Other](by-topic/shared-other.md) | [L425693](../../../ScriptDB/000_4_CreateSP.sql#L425693) | — | 1 / 0 | — |
| `UBInsuranceTypeList` | [Shared / Other](by-topic/shared-other.md) | [L425719](../../../ScriptDB/000_4_CreateSP.sql#L425719) | — | 1 / 0 | — |
| `UBInsuranceUpdate` | [Shared / Other](by-topic/shared-other.md) | [L425745](../../../ScriptDB/000_4_CreateSP.sql#L425745) | 1 / 1 file | 0 / 2 | [Insurance.cs:66](../../../UBClasses/Insurance.cs#L66) |
| `UBIntermediaryAdd` | [Client & KYC](by-topic/client-kyc.md) | [L425993](../../../ScriptDB/000_4_CreateSP.sql#L425993) | 1 / 1 file | 2 / 2 | [Intermediary.cs:464](../../../UBClasses/Intermediary.cs#L464) |
| `UBIntermediaryDropDownList` | [Client & KYC](by-topic/client-kyc.md) | [L426054](../../../ScriptDB/000_4_CreateSP.sql#L426054) | — | 2 / 0 | — |
| `UBIntermediaryInfo` | [Client & KYC](by-topic/client-kyc.md) | [L426070](../../../ScriptDB/000_4_CreateSP.sql#L426070) | — | 1 / 0 | — |
| `UBIntermediaryInfoByPlanID` | [Account & Plan](by-topic/account-plan.md) | [L426110](../../../ScriptDB/000_4_CreateSP.sql#L426110) | — | 0 / 1 | — |
| `UBIntermediaryList` | [Client & KYC](by-topic/client-kyc.md) | [L426140](../../../ScriptDB/000_4_CreateSP.sql#L426140) | 1 / 1 file | 0 / 0 | [Intermediary.cs:351](../../../UBClasses/Intermediary.cs#L351) |
| `UBIntermediaryRemove` | [Client & KYC](by-topic/client-kyc.md) | [L426203](../../../ScriptDB/000_4_CreateSP.sql#L426203) | 1 / 1 file | 0 / 0 | [Intermediary.cs:556](../../../UBClasses/Intermediary.cs#L556) |
| `UBIntermediaryUpdate` | [Client & KYC](by-topic/client-kyc.md) | [L426243](../../../ScriptDB/000_4_CreateSP.sql#L426243) | 1 / 1 file | 0 / 4 | [Intermediary.cs:464](../../../UBClasses/Intermediary.cs#L464) |
| `UBInvestmentKnowledgeList` | [Shared / Other](by-topic/shared-other.md) | [L426319](../../../ScriptDB/000_4_CreateSP.sql#L426319) | — | 5 / 0 | — |
| `UBInvestmentLimitList` | [Shared / Other](by-topic/shared-other.md) | [L426350](../../../ScriptDB/000_4_CreateSP.sql#L426350) | — | 1 / 0 | — |
| `UBInvestObjMatrixApply` | [Shared / Other](by-topic/shared-other.md) | [L426376](../../../ScriptDB/000_4_CreateSP.sql#L426376) | 1 / 1 file | 0 / 0 | [Compliance.cs:5564](../../../UBClasses/Compliance.cs#L5564) |
| `UBInvestObjMatrixItemGet` | [Shared / Other](by-topic/shared-other.md) | [L426532](../../../ScriptDB/000_4_CreateSP.sql#L426532) | — | 0 / 0 | — |
| `UBInvestObjMatrixItemInfo` | [Shared / Other](by-topic/shared-other.md) | [L426565](../../../ScriptDB/000_4_CreateSP.sql#L426565) | 1 / 1 file | 0 / 0 | [Compliance.cs:5426](../../../UBClasses/Compliance.cs#L5426) |
| `UBInvestObjMatrixItemRemove` | [Shared / Other](by-topic/shared-other.md) | [L426584](../../../ScriptDB/000_4_CreateSP.sql#L426584) | 1 / 1 file | 0 / 0 | [Compliance.cs:5471](../../../UBClasses/Compliance.cs#L5471) |
| `UBInvestObjMatrixItemUpdate` | [Shared / Other](by-topic/shared-other.md) | [L426609](../../../ScriptDB/000_4_CreateSP.sql#L426609) | 1 / 1 file | 0 / 0 | [Compliance.cs:5509](../../../UBClasses/Compliance.cs#L5509) |
| `UBInvestObjMatrixList` | [Shared / Other](by-topic/shared-other.md) | [L426656](../../../ScriptDB/000_4_CreateSP.sql#L426656) | 1 / 1 file | 0 / 0 | [Compliance.cs:5382](../../../UBClasses/Compliance.cs#L5382) |
| `UBJointDuplicateClean` | [Shared / Other](by-topic/shared-other.md) | [L426691](../../../ScriptDB/000_4_CreateSP.sql#L426691) | — | 0 / 0 | — |
| `UBKYCExpiredNotify` | [Client & KYC](by-topic/client-kyc.md) | [L426772](../../../ScriptDB/000_4_CreateSP.sql#L426772) | 1 / 1 file | 0 / 1 | [Dashboard.cs:2751](../../../UBClasses/Dashboard.cs#L2751) |
| `UBKYPAuditTrailFieldList` | [Shared / Other](by-topic/shared-other.md) | [L427064](../../../ScriptDB/000_4_CreateSP.sql#L427064) | — | 1 / 0 | — |
| `UBKYPAuditTrailReviewAdd` | [Shared / Other](by-topic/shared-other.md) | [L427085](../../../ScriptDB/000_4_CreateSP.sql#L427085) | 1 / 1 file | 0 / 0 | [FundDef.cs:3704](../../../UBClasses/FundDef.cs#L3704) |
| `UBKYPAuditTrailReviewListHistory` | [Shared / Other](by-topic/shared-other.md) | [L427126](../../../ScriptDB/000_4_CreateSP.sql#L427126) | 1 / 1 file | 0 / 1 | [FundDef.cs:3767](../../../UBClasses/FundDef.cs#L3767) |
| `UBKYPAuditTrailReviewListRemove` | [Shared / Other](by-topic/shared-other.md) | [L427277](../../../ScriptDB/000_4_CreateSP.sql#L427277) | 1 / 1 file | 0 / 0 | [FundDef.cs:3826](../../../UBClasses/FundDef.cs#L3826) |
| `UBKYPAuditTrailScan4Significant` | [Shared / Other](by-topic/shared-other.md) | [L427310](../../../ScriptDB/000_4_CreateSP.sql#L427310) | — | 0 / 0 | — |
| `UBKYPComboList` | [Shared / Other](by-topic/shared-other.md) | [L427384](../../../ScriptDB/000_4_CreateSP.sql#L427384) | — | 0 / 7 | — |
| `UBKYPComboList_Client` | [Client & KYC](by-topic/client-kyc.md) | [L427434](../../../ScriptDB/000_4_CreateSP.sql#L427434) | — | 0 / 7 | — |
| `UBKYPCompareListCopyFundList` | [Fund & GIC](by-topic/fund-gic.md) | [L427478](../../../ScriptDB/000_4_CreateSP.sql#L427478) | 1 / 1 file | 0 / 0 | [FundDef.cs:3176](../../../UBClasses/FundDef.cs#L3176) |
| `UBKYPCompareListCopyFundList_Client` | [Fund & GIC](by-topic/fund-gic.md) | [L427509](../../../ScriptDB/000_4_CreateSP.sql#L427509) | 1 / 1 file | 0 / 0 | [FundDef.cs:3223](../../../UBClasses/FundDef.cs#L3223) |
| `UBKYPCompareListCurrent` | [Shared / Other](by-topic/shared-other.md) | [L427540](../../../ScriptDB/000_4_CreateSP.sql#L427540) | 1 / 1 file | 0 / 1 | [FundDef.cs:458](../../../UBClasses/FundDef.cs#L458) |
| `UBKYPCompareListCurrent_Client` | [Client & KYC](by-topic/client-kyc.md) | [L427562](../../../ScriptDB/000_4_CreateSP.sql#L427562) | 1 / 1 file | 0 / 1 | [FundDef.cs:651](../../../UBClasses/FundDef.cs#L651) |
| `UBKYPCompareListCurrent_Old` | [Shared / Other](by-topic/shared-other.md) | [L427683](../../../ScriptDB/000_4_CreateSP.sql#L427683) | — | 0 / 1 | — |
| `UBKYPCompareListCurrentByFundList` | [Fund & GIC](by-topic/fund-gic.md) | [L429058](../../../ScriptDB/000_4_CreateSP.sql#L429058) | — | 1 / 1 | — |
| `UBKYPCompareListCurrentByFundList_Client` | [Fund & GIC](by-topic/fund-gic.md) | [L430564](../../../ScriptDB/000_4_CreateSP.sql#L430564) | — | 1 / 1 | — |
| `UBKYPCompareListDetail` | [Shared / Other](by-topic/shared-other.md) | [L432055](../../../ScriptDB/000_4_CreateSP.sql#L432055) | 2 / 2 file | 1 / 0 | [FundDef.cs:3076](../../../UBClasses/FundDef.cs#L3076) |
| `UBKYPCompareListDetail_Client` | [Client & KYC](by-topic/client-kyc.md) | [L432117](../../../ScriptDB/000_4_CreateSP.sql#L432117) | 2 / 2 file | 0 / 1 | [FundDef.cs:3127](../../../UBClasses/FundDef.cs#L3127) |
| `UBKYPCompareListExist` | [Shared / Other](by-topic/shared-other.md) | [L432226](../../../ScriptDB/000_4_CreateSP.sql#L432226) | 1 / 1 file | 0 / 0 | [FundDef.cs:719](../../../UBClasses/FundDef.cs#L719) |
| `UBKYPCompareListHistory` | [Shared / Other](by-topic/shared-other.md) | [L432288](../../../ScriptDB/000_4_CreateSP.sql#L432288) | 1 / 1 file | 1 / 0 | [FundDef.cs:517](../../../UBClasses/FundDef.cs#L517) |
| `UBKYPCompareListHistory_Client` | [Client & KYC](by-topic/client-kyc.md) | [L432595](../../../ScriptDB/000_4_CreateSP.sql#L432595) | 2 / 1 file | 0 / 1 | [FundDef.cs:582](../../../UBClasses/FundDef.cs#L582) |
| `UBKYPCompareListRemove` | [Shared / Other](by-topic/shared-other.md) | [L432723](../../../ScriptDB/000_4_CreateSP.sql#L432723) | 1 / 1 file | 0 / 0 | [FundDef.cs:767](../../../UBClasses/FundDef.cs#L767) |
| `UBKYPCompareListRemove_Client` | [Client & KYC](by-topic/client-kyc.md) | [L432756](../../../ScriptDB/000_4_CreateSP.sql#L432756) | 1 / 1 file | 0 / 0 | [FundDef.cs:814](../../../UBClasses/FundDef.cs#L814) |
| `UBKYPCompareListUpdatePdfObj` | [Documents & PDF](by-topic/documents-pdf.md) | [L432789](../../../ScriptDB/000_4_CreateSP.sql#L432789) | 1 / 1 file | 0 / 0 | [FundDef.cs:3274](../../../UBClasses/FundDef.cs#L3274) |
| `UBKYPCompareListUpdatePdfObj_Client` | [Client & KYC](by-topic/client-kyc.md) | [L432820](../../../ScriptDB/000_4_CreateSP.sql#L432820) | 1 / 1 file | 0 / 2 | [FundDef.cs:3320](../../../UBClasses/FundDef.cs#L3320) |
| `UBKYPFundCompareListAdd` | [Fund & GIC](by-topic/fund-gic.md) | [L432907](../../../ScriptDB/000_4_CreateSP.sql#L432907) | 1 / 1 file | 1 / 0 | [FundDef.cs:2780](../../../UBClasses/FundDef.cs#L2780) |
| `UBKYPFundCompareListAdd_Client` | [Fund & GIC](by-topic/fund-gic.md) | [L432990](../../../ScriptDB/000_4_CreateSP.sql#L432990) | 1 / 1 file | 0 / 0 | [FundDef.cs:2833](../../../UBClasses/FundDef.cs#L2833) |
| `UBKYPFundCompareListAddTaggedItems` | [Fund & GIC](by-topic/fund-gic.md) | [L433049](../../../ScriptDB/000_4_CreateSP.sql#L433049) | 1 / 1 file | 0 / 1 | [FundDef.cs:2732](../../../UBClasses/FundDef.cs#L2732) |
| `UBKYPFundCompareListMove` | [Fund & GIC](by-topic/fund-gic.md) | [L433089](../../../ScriptDB/000_4_CreateSP.sql#L433089) | 1 / 1 file | 0 / 0 | [FundDef.cs:2978](../../../UBClasses/FundDef.cs#L2978) |
| `UBKYPFundCompareListMove_Client` | [Fund & GIC](by-topic/fund-gic.md) | [L433153](../../../ScriptDB/000_4_CreateSP.sql#L433153) | 1 / 1 file | 0 / 0 | [FundDef.cs:3025](../../../UBClasses/FundDef.cs#L3025) |
| `UBKYPFundCompareListRemove` | [Fund & GIC](by-topic/fund-gic.md) | [L433217](../../../ScriptDB/000_4_CreateSP.sql#L433217) | 1 / 1 file | 0 / 0 | [FundDef.cs:2933](../../../UBClasses/FundDef.cs#L2933) |
| `UBKYPFundCompareListRemove_Client` | [Fund & GIC](by-topic/fund-gic.md) | [L433258](../../../ScriptDB/000_4_CreateSP.sql#L433258) | 1 / 1 file | 0 / 0 | [FundDef.cs:2886](../../../UBClasses/FundDef.cs#L2886) |
| `UBKYPFundDefChangeFixOneDay` | [Fund & GIC](by-topic/fund-gic.md) | [L433300](../../../ScriptDB/000_4_CreateSP.sql#L433300) | — | 0 / 0 | — |
| `UBKYPFundDefChangeList` | [Fund & GIC](by-topic/fund-gic.md) | [L433372](../../../ScriptDB/000_4_CreateSP.sql#L433372) | 2 / 2 file | 0 / 1 | [FundDef.cs:3372](../../../UBClasses/FundDef.cs#L3372) |
| `UBKYPFundDefChangeListX` | [Fund & GIC](by-topic/fund-gic.md) | [L433707](../../../ScriptDB/000_4_CreateSP.sql#L433707) | 1 / 1 file | 0 / 1 | [FundDef.cs:3436](../../../UBClasses/FundDef.cs#L3436) |
| `UBKYPFundDefChangeListXAccount` | [Fund & GIC](by-topic/fund-gic.md) | [L433894](../../../ScriptDB/000_4_CreateSP.sql#L433894) | 1 / 1 file | 0 / 1 | [FundDef.cs:3570](../../../UBClasses/FundDef.cs#L3570) |
| `UBKYPFundListOtherClients` | [Fund & GIC](by-topic/fund-gic.md) | [L434252](../../../ScriptDB/000_4_CreateSP.sql#L434252) | 1 / 1 file | 0 / 1 | [FundDef.cs:4613](../../../UBClasses/FundDef.cs#L4613) |
| `UBLanguageList` | [Shared / Other](by-topic/shared-other.md) | [L434393](../../../ScriptDB/000_4_CreateSP.sql#L434393) | — | 5 / 0 | — |
| `UBLAP_EndTask` | [Shared / Other](by-topic/shared-other.md) | [L434426](../../../ScriptDB/000_4_CreateSP.sql#L434426) | — | 0 / 0 | — |
| `UBLAP_GetSet` | [Shared / Other](by-topic/shared-other.md) | [L434443](../../../ScriptDB/000_4_CreateSP.sql#L434443) | — | 0 / 0 | — |
| `UBLAP_GetTask` | [Shared / Other](by-topic/shared-other.md) | [L434535](../../../ScriptDB/000_4_CreateSP.sql#L434535) | — | 0 / 0 | — |
| `UBLAP_NewTask` | [Shared / Other](by-topic/shared-other.md) | [L434567](../../../ScriptDB/000_4_CreateSP.sql#L434567) | 1 / 1 file | 0 / 0 | [CommissionRevenue.cs:3533](../../../UBClasses/CommissionRevenue.cs#L3533) |
| `UBLAP_RemoveTask` | [Shared / Other](by-topic/shared-other.md) | [L434678](../../../ScriptDB/000_4_CreateSP.sql#L434678) | — | 0 / 0 | — |
| `UBLast3MonthList` | [Shared / Other](by-topic/shared-other.md) | [L434693](../../../ScriptDB/000_4_CreateSP.sql#L434693) | — | 1 / 0 | — |
| `UBLicenseTypeList` | [Shared / Other](by-topic/shared-other.md) | [L434726](../../../ScriptDB/000_4_CreateSP.sql#L434726) | — | 1 / 0 | — |
| `UBLoanActionList` | [Shared / Other](by-topic/shared-other.md) | [L434761](../../../ScriptDB/000_4_CreateSP.sql#L434761) | — | 2 / 0 | — |
| `UBLoanActionSave` | [Shared / Other](by-topic/shared-other.md) | [L434803](../../../ScriptDB/000_4_CreateSP.sql#L434803) | 1 / 1 file | 0 / 0 | [Loan.cs:1022](../../../UBClasses/Loan.cs#L1022) |
| `UBLoanAdd` | [Shared / Other](by-topic/shared-other.md) | [L434880](../../../ScriptDB/000_4_CreateSP.sql#L434880) | — | 0 / 4 | — |
| `UBLoanAssetLiquidList` | [Shared / Other](by-topic/shared-other.md) | [L435155](../../../ScriptDB/000_4_CreateSP.sql#L435155) | — | 2 / 0 | — |
| `UBLoanAssetLiquidSave` | [Shared / Other](by-topic/shared-other.md) | [L435219](../../../ScriptDB/000_4_CreateSP.sql#L435219) | 1 / 1 file | 0 / 0 | [Loan.cs:749](../../../UBClasses/Loan.cs#L749) |
| `UBLoanAssetOtherList` | [Shared / Other](by-topic/shared-other.md) | [L435287](../../../ScriptDB/000_4_CreateSP.sql#L435287) | — | 2 / 0 | — |
| `UBLoanAssetOtherSave` | [Shared / Other](by-topic/shared-other.md) | [L435351](../../../ScriptDB/000_4_CreateSP.sql#L435351) | 1 / 1 file | 0 / 0 | [Loan.cs:749](../../../UBClasses/Loan.cs#L749) |
| `UBLoanAssetSaveEnd` | [Shared / Other](by-topic/shared-other.md) | [L435420](../../../ScriptDB/000_4_CreateSP.sql#L435420) | 1 / 1 file | 0 / 4 | [Loan.cs:862](../../../UBClasses/Loan.cs#L862) |
| `UBLoanCalcPMT` | [Shared / Other](by-topic/shared-other.md) | [L435517](../../../ScriptDB/000_4_CreateSP.sql#L435517) | 1 / 1 file | 0 / 0 | [Loan.cs:425](../../../UBClasses/Loan.cs#L425) |
| `UBLoanEditComboList` | [Shared / Other](by-topic/shared-other.md) | [L435632](../../../ScriptDB/000_4_CreateSP.sql#L435632) | — | 0 / 8 | — |
| `UBLoanFileObj` | [Shared / Other](by-topic/shared-other.md) | [L435665](../../../ScriptDB/000_4_CreateSP.sql#L435665) | 1 / 1 file | 0 / 0 | [Loan.cs:1090](../../../UBClasses/Loan.cs#L1090) |
| `UBLoanFileObjRemove` | [Shared / Other](by-topic/shared-other.md) | [L435706](../../../ScriptDB/000_4_CreateSP.sql#L435706) | 1 / 1 file | 0 / 0 | [Loan.cs:1145](../../../UBClasses/Loan.cs#L1145) |
| `UBLoanImportB2BOne` | [Shared / Other](by-topic/shared-other.md) | [L435742](../../../ScriptDB/000_4_CreateSP.sql#L435742) | — | 0 / 0 | — |
| `UBLoanImportB2BPendingList` | [Shared / Other](by-topic/shared-other.md) | [L435901](../../../ScriptDB/000_4_CreateSP.sql#L435901) | 1 / 1 file | 0 / 0 | [Loan.cs:1301](../../../UBClasses/Loan.cs#L1301) |
| `UBLoanImportB2BStart` | [Shared / Other](by-topic/shared-other.md) | [L435927](../../../ScriptDB/000_4_CreateSP.sql#L435927) | — | 0 / 0 | — |
| `UBLoanIncomeList` | [Shared / Other](by-topic/shared-other.md) | [L435946](../../../ScriptDB/000_4_CreateSP.sql#L435946) | — | 2 / 0 | — |
| `UBLoanIncomeSave` | [Shared / Other](by-topic/shared-other.md) | [L436012](../../../ScriptDB/000_4_CreateSP.sql#L436012) | 1 / 1 file | 0 / 0 | [Loan.cs:963](../../../UBClasses/Loan.cs#L963) |
| `UBLoanItemList` | [Shared / Other](by-topic/shared-other.md) | [L436078](../../../ScriptDB/000_4_CreateSP.sql#L436078) | 1 / 1 file | 0 / 6 | [Loan.cs:1182](../../../UBClasses/Loan.cs#L1182) |
| `UBLoanLiabilityList` | [Shared / Other](by-topic/shared-other.md) | [L436158](../../../ScriptDB/000_4_CreateSP.sql#L436158) | — | 2 / 0 | — |
| `UBLoanLiabilitySave` | [Shared / Other](by-topic/shared-other.md) | [L436223](../../../ScriptDB/000_4_CreateSP.sql#L436223) | 1 / 1 file | 1 / 0 | [Loan.cs:806](../../../UBClasses/Loan.cs#L806) |
| `UBLoanLiabilitySaveEnd` | [Shared / Other](by-topic/shared-other.md) | [L436293](../../../ScriptDB/000_4_CreateSP.sql#L436293) | 1 / 1 file | 0 / 3 | [Loan.cs:912](../../../UBClasses/Loan.cs#L912) |
| `UBLoanListClient` | [Client & KYC](by-topic/client-kyc.md) | [L436356](../../../ScriptDB/000_4_CreateSP.sql#L436356) | 1 / 1 file | 0 / 0 | [Loan.cs:517](../../../UBClasses/Loan.cs#L517) |
| `UBLoanListSet` | [Shared / Other](by-topic/shared-other.md) | [L436419](../../../ScriptDB/000_4_CreateSP.sql#L436419) | 1 / 1 file | 0 / 1 | [Loan.cs:1232](../../../UBClasses/Loan.cs#L1232) |
| `UBLoanLoadNew` | [Shared / Other](by-topic/shared-other.md) | [L436791](../../../ScriptDB/000_4_CreateSP.sql#L436791) | 1 / 1 file | 0 / 0 | [Loan.cs:380](../../../UBClasses/Loan.cs#L380) |
| `UBLoanMove2Plan` | [Account & Plan](by-topic/account-plan.md) | [L436957](../../../ScriptDB/000_4_CreateSP.sql#L436957) | — | 0 / 0 | — |
| `UBLoanPlanID` | [Account & Plan](by-topic/account-plan.md) | [L436992](../../../ScriptDB/000_4_CreateSP.sql#L436992) | — | 0 / 0 | — |
| `UBLoanRemove` | [Shared / Other](by-topic/shared-other.md) | [L437016](../../../ScriptDB/000_4_CreateSP.sql#L437016) | — | 0 / 0 | — |
| `UBLoanSupportDocList` | [Documents & PDF](by-topic/documents-pdf.md) | [L437060](../../../ScriptDB/000_4_CreateSP.sql#L437060) | 1 / 1 file | 2 / 0 | [Loan.cs:474](../../../UBClasses/Loan.cs#L474) |
| `UBLoanSupportDocSave` | [Documents & PDF](by-topic/documents-pdf.md) | [L437135](../../../ScriptDB/000_4_CreateSP.sql#L437135) | 1 / 1 file | 0 / 0 | [Loan.cs:563](../../../UBClasses/Loan.cs#L563) |
| `UBLoanUpdate` | [Shared / Other](by-topic/shared-other.md) | [L437247](../../../ScriptDB/000_4_CreateSP.sql#L437247) | — | 0 / 1 | — |
| `UBLog` | [Shared / Other](by-topic/shared-other.md) | [L437408](../../../ScriptDB/000_4_CreateSP.sql#L437408) | — | 3 / 0 | — |
| `UBLogAdd` | [Shared / Other](by-topic/shared-other.md) | [L437432](../../../ScriptDB/000_4_CreateSP.sql#L437432) | — | 0 / 0 | — |
| `UBLoginDetailList` | [Security & Auth](by-topic/security-auth.md) | [L437458](../../../ScriptDB/000_4_CreateSP.sql#L437458) | — | 0 / 0 | — |
| `UBLogoAdd` | [Shared / Other](by-topic/shared-other.md) | [L437501](../../../ScriptDB/000_4_CreateSP.sql#L437501) | 1 / 1 file | 0 / 0 | [CBase.cs:7337](../../../UBClasses/CBase.cs#L7337) |
| `UBLogoCopy` | [Shared / Other](by-topic/shared-other.md) | [L437599](../../../ScriptDB/000_4_CreateSP.sql#L437599) | — | 0 / 0 | — |
| `UBLogoGet` | [Shared / Other](by-topic/shared-other.md) | [L437622](../../../ScriptDB/000_4_CreateSP.sql#L437622) | — | 62 / 0 | — |
| `UBLogoGetX` | [Shared / Other](by-topic/shared-other.md) | [L437750](../../../ScriptDB/000_4_CreateSP.sql#L437750) | — | 2 / 0 | — |
| `UBLogoRemove` | [Shared / Other](by-topic/shared-other.md) | [L437860](../../../ScriptDB/000_4_CreateSP.sql#L437860) | 1 / 1 file | 0 / 0 | [CBase.cs:7391](../../../UBClasses/CBase.cs#L7391) |
| `UBLogoutOptComboList` | [Shared / Other](by-topic/shared-other.md) | [L437893](../../../ScriptDB/000_4_CreateSP.sql#L437893) | — | 0 / 1 | — |
| `UBLSFileDetailList` | [Shared / Other](by-topic/shared-other.md) | [L437917](../../../ScriptDB/000_4_CreateSP.sql#L437917) | — | 0 / 0 | — |
| `UBLSFileFix1Account` | [Account & Plan](by-topic/account-plan.md) | [L438055](../../../ScriptDB/000_4_CreateSP.sql#L438055) | — | 1 / 0 | — |
| `UBLSFileFix1File` | [Shared / Other](by-topic/shared-other.md) | [L438148](../../../ScriptDB/000_4_CreateSP.sql#L438148) | — | 1 / 1 | — |
| `UBLSFileFixFiles` | [Shared / Other](by-topic/shared-other.md) | [L438192](../../../ScriptDB/000_4_CreateSP.sql#L438192) | — | 0 / 1 | — |
| `UBLSFileList` | [Shared / Other](by-topic/shared-other.md) | [L438226](../../../ScriptDB/000_4_CreateSP.sql#L438226) | 1 / 1 file | 0 / 0 | [CAFFile.cs:173](../../../UBClasses/CAFFile.cs#L173) |
| `UBLSFileRemoveByFileID` | [Shared / Other](by-topic/shared-other.md) | [L438359](../../../ScriptDB/000_4_CreateSP.sql#L438359) | 1 / 1 file | 0 / 1 | [CommissionRevenue.cs:3048](../../../UBClasses/CommissionRevenue.cs#L3048) |
| `UBLSFileSelectionUpdate` | [Shared / Other](by-topic/shared-other.md) | [L438396](../../../ScriptDB/000_4_CreateSP.sql#L438396) | — | 0 / 0 | — |
| `UBMaritalStatusList` | [Shared / Other](by-topic/shared-other.md) | [L438443](../../../ScriptDB/000_4_CreateSP.sql#L438443) | — | 5 / 0 | — |
| `UBMaturityInstructionList` | [Shared / Other](by-topic/shared-other.md) | [L438469](../../../ScriptDB/000_4_CreateSP.sql#L438469) | — | 1 / 0 | — |
| `UBMember4NewClient` | [Client & KYC](by-topic/client-kyc.md) | [L438498](../../../ScriptDB/000_4_CreateSP.sql#L438498) | 1 / 1 file | 0 / 0 | [Member.cs:3537](../../../UBClasses/Member.cs#L3537) |
| `UBMemberAccessMemberList` | [Security & Auth](by-topic/security-auth.md) | [L438540](../../../ScriptDB/000_4_CreateSP.sql#L438540) | — | 9 / 0 | — |
| `UBMemberAccessMemberList2` | [Security & Auth](by-topic/security-auth.md) | [L438613](../../../ScriptDB/000_4_CreateSP.sql#L438613) | — | 3 / 0 | — |
| `UBMemberAccessMemberListExSch` | [Security & Auth](by-topic/security-auth.md) | [L438683](../../../ScriptDB/000_4_CreateSP.sql#L438683) | — | 1 / 0 | — |
| `UBMemberActiveList` | [Shared / Other](by-topic/shared-other.md) | [L438745](../../../ScriptDB/000_4_CreateSP.sql#L438745) | 1 / 1 file | 0 / 0 | [Member.cs:112](../../../UBClasses/Member.cs#L112) |
| `UBMemberAddTMP` | [Shared / Other](by-topic/shared-other.md) | [L438812](../../../ScriptDB/000_4_CreateSP.sql#L438812) | 1 / 1 file | 0 / 1 | [CDatabase.cs:2733](../../../UBConnection/CDatabase.cs#L2733) |
| `UBMemberAddUI` | [Shared / Other](by-topic/shared-other.md) | [L438898](../../../ScriptDB/000_4_CreateSP.sql#L438898) | — | 0 / 6 | — |
| `UBMemberAgentIDAdd` | [Shared / Other](by-topic/shared-other.md) | [L439224](../../../ScriptDB/000_4_CreateSP.sql#L439224) | 1 / 1 file | 0 / 0 | [Member.cs:3943](../../../UBClasses/Member.cs#L3943) |
| `UBMemberAgentIDDelete` | [Shared / Other](by-topic/shared-other.md) | [L439266](../../../ScriptDB/000_4_CreateSP.sql#L439266) | 1 / 1 file | 0 / 0 | [Member.cs:3991](../../../UBClasses/Member.cs#L3991) |
| `UBMemberAgentIDSet` | [Shared / Other](by-topic/shared-other.md) | [L439291](../../../ScriptDB/000_4_CreateSP.sql#L439291) | 1 / 1 file | 1 / 0 | [Member.cs:4037](../../../UBClasses/Member.cs#L4037) |
| `UBMemberAppAdd` | [Shared / Other](by-topic/shared-other.md) | [L439324](../../../ScriptDB/000_4_CreateSP.sql#L439324) | 1 / 1 file | 0 / 0 | [Member.cs:3012](../../../UBClasses/Member.cs#L3012) |
| `UBMemberAppDelete` | [Shared / Other](by-topic/shared-other.md) | [L439369](../../../ScriptDB/000_4_CreateSP.sql#L439369) | 1 / 1 file | 0 / 0 | [Member.cs:3061](../../../UBClasses/Member.cs#L3061) |
| `UBMemberAppInfo` | [Shared / Other](by-topic/shared-other.md) | [L439394](../../../ScriptDB/000_4_CreateSP.sql#L439394) | 1 / 1 file | 0 / 0 | [Member.cs:3108](../../../UBClasses/Member.cs#L3108) |
| `UBMemberAppSet` | [Shared / Other](by-topic/shared-other.md) | [L439422](../../../ScriptDB/000_4_CreateSP.sql#L439422) | 1 / 1 file | 1 / 0 | [Member.cs:2878](../../../UBClasses/Member.cs#L2878) |
| `UBMemberAssetList` | [Shared / Other](by-topic/shared-other.md) | [L439455](../../../ScriptDB/000_4_CreateSP.sql#L439455) | 1 / 1 file | 0 / 0 | [Member.cs:4908](../../../UBClasses/Member.cs#L4908) |
| `UBMemberAssistantAdd` | [Shared / Other](by-topic/shared-other.md) | [L439526](../../../ScriptDB/000_4_CreateSP.sql#L439526) | 1 / 1 file | 1 / 2 | [Member.cs:2778](../../../UBClasses/Member.cs#L2778) |
| `UBMemberAssistantGet` | [Shared / Other](by-topic/shared-other.md) | [L439606](../../../ScriptDB/000_4_CreateSP.sql#L439606) | — | 12 / 1 | — |
| `UBMemberAssistantList` | [Shared / Other](by-topic/shared-other.md) | [L439627](../../../ScriptDB/000_4_CreateSP.sql#L439627) | 2 / 1 file | 1 / 1 | [Member.cs:227](../../../UBClasses/Member.cs#L227) |
| `UBMemberAssistantListX` | [Shared / Other](by-topic/shared-other.md) | [L439656](../../../ScriptDB/000_4_CreateSP.sql#L439656) | — | 1 / 0 | — |
| `UBMemberAssistantRemove` | [Shared / Other](by-topic/shared-other.md) | [L439683](../../../ScriptDB/000_4_CreateSP.sql#L439683) | 1 / 1 file | 0 / 1 | [Member.cs:2722](../../../UBClasses/Member.cs#L2722) |
| `UBMemberBankAccountTMPEnd` | [Account & Plan](by-topic/account-plan.md) | [L439721](../../../ScriptDB/000_4_CreateSP.sql#L439721) | — | 1 / 0 | — |
| `UBMemberBankInfoAdd` | [Shared / Other](by-topic/shared-other.md) | [L439752](../../../ScriptDB/000_4_CreateSP.sql#L439752) | — | 9 / 1 | — |
| `UBMemberBankInfoRemove` | [Shared / Other](by-topic/shared-other.md) | [L439848](../../../ScriptDB/000_4_CreateSP.sql#L439848) | 1 / 1 file | 0 / 0 | [PanelMemberBankAdd.aspx.cs:402](../../../WebApp/Main/PanelMemberBankAdd.aspx.cs#L402) |
| `UBMemberBankInfoUpdate` | [Shared / Other](by-topic/shared-other.md) | [L439891](../../../ScriptDB/000_4_CreateSP.sql#L439891) | — | 0 / 1 | — |
| `UBMemberBankList` | [Shared / Other](by-topic/shared-other.md) | [L439983](../../../ScriptDB/000_4_CreateSP.sql#L439983) | 1 / 1 file | 2 / 0 | [BankAccount.cs:1607](../../../UBClasses/BankAccount.cs#L1607) |
| `UBMemberBankTMP` | [Shared / Other](by-topic/shared-other.md) | [L440049](../../../ScriptDB/000_4_CreateSP.sql#L440049) | — | 0 / 0 | — |
| `UBMemberChangePW` | [Security & Auth](by-topic/security-auth.md) | [L440096](../../../ScriptDB/000_4_CreateSP.sql#L440096) | 1 / 1 file | 0 / 1 | [CDatabase.cs:2514](../../../UBConnection/CDatabase.cs#L2514) |
| `UBMemberCheckNewPW` | [Security & Auth](by-topic/security-auth.md) | [L440144](../../../ScriptDB/000_4_CreateSP.sql#L440144) | 1 / 1 file | 0 / 0 | [Member.cs:945](../../../UBClasses/Member.cs#L945) |
| `UBMemberCheckNewPWX` | [Security & Auth](by-topic/security-auth.md) | [L440199](../../../ScriptDB/000_4_CreateSP.sql#L440199) | — | 1 / 0 | — |
| `UBMemberCityProvince` | [Shared / Other](by-topic/shared-other.md) | [L440248](../../../ScriptDB/000_4_CreateSP.sql#L440248) | 1 / 1 file | 0 / 0 | [Province.cs:487](../../../UBClasses/Province.cs#L487) |
| `UBMemberCommGridListAll` | [Commission & Fee](by-topic/commission-fee.md) | [L440283](../../../ScriptDB/000_4_CreateSP.sql#L440283) | 1 / 1 file | 0 / 0 | [Member.cs:3722](../../../UBClasses/Member.cs#L3722) |
| `UBMemberCommRateModify` | [Commission & Fee](by-topic/commission-fee.md) | [L440542](../../../ScriptDB/000_4_CreateSP.sql#L440542) | 1 / 1 file | 0 / 0 | [Member.cs:2147](../../../UBClasses/Member.cs#L2147) |
| `UBMemberCommRepAccessList` | [Commission & Fee](by-topic/commission-fee.md) | [L440648](../../../ScriptDB/000_4_CreateSP.sql#L440648) | — | 1 / 1 | — |
| `UBMemberCompApprovalLevel` | [Shared / Other](by-topic/shared-other.md) | [L440708](../../../ScriptDB/000_4_CreateSP.sql#L440708) | 1 / 1 file | 0 / 0 | [Member.cs:1677](../../../UBClasses/Member.cs#L1677) |
| `UBMemberComplianceSettingAdd` | [Compliance](by-topic/compliance.md) | [L440732](../../../ScriptDB/000_4_CreateSP.sql#L440732) | 1 / 1 file | 0 / 0 | [PopupMemberAdd.aspx.cs:1157](../../../WebApp/Main/PopupMemberAdd.aspx.cs#L1157) |
| `UBMemberCreateRepCode` | [Shared / Other](by-topic/shared-other.md) | [L440775](../../../ScriptDB/000_4_CreateSP.sql#L440775) | — | 1 / 0 | — |
| `UBMemberDocAdd` | [Documents & PDF](by-topic/documents-pdf.md) | [L440809](../../../ScriptDB/000_4_CreateSP.sql#L440809) | 1 / 1 file | 0 / 0 | [Member.cs:3283](../../../UBClasses/Member.cs#L3283) |
| `UBMemberDocDelete` | [Documents & PDF](by-topic/documents-pdf.md) | [L440867](../../../ScriptDB/000_4_CreateSP.sql#L440867) | 1 / 1 file | 0 / 0 | [Member.cs:3332](../../../UBClasses/Member.cs#L3332) |
| `UBMemberDocSet` | [Documents & PDF](by-topic/documents-pdf.md) | [L440892](../../../ScriptDB/000_4_CreateSP.sql#L440892) | 1 / 1 file | 2 / 0 | [Member.cs:2968](../../../UBClasses/Member.cs#L2968) |
| `UBMemberEditComboList` | [Shared / Other](by-topic/shared-other.md) | [L440921](../../../ScriptDB/000_4_CreateSP.sql#L440921) | — | 0 / 14 | — |
| `UBMembereDocAccessCode` | [Documents & PDF](by-topic/documents-pdf.md) | [L440956](../../../ScriptDB/000_4_CreateSP.sql#L440956) | 1 / 1 file | 0 / 0 | [Member.cs:4749](../../../UBClasses/Member.cs#L4749) |
| `UBMembereDocAccessCodeUpdate` | [Documents & PDF](by-topic/documents-pdf.md) | [L440969](../../../ScriptDB/000_4_CreateSP.sql#L440969) | 1 / 1 file | 0 / 0 | [Member.cs:4797](../../../UBClasses/Member.cs#L4797) |
| `UBMemberFileObj` | [Shared / Other](by-topic/shared-other.md) | [L440984](../../../ScriptDB/000_4_CreateSP.sql#L440984) | 1 / 1 file | 0 / 0 | [Member.cs:3387](../../../UBClasses/Member.cs#L3387) |
| `UBMemberForgotPW` | [Security & Auth](by-topic/security-auth.md) | [L441012](../../../ScriptDB/000_4_CreateSP.sql#L441012) | 1 / 1 file | 0 / 0 | [CDatabase.cs:2616](../../../UBConnection/CDatabase.cs#L2616) |
| `UBMemberGet` | [Shared / Other](by-topic/shared-other.md) | [L441100](../../../ScriptDB/000_4_CreateSP.sql#L441100) | — | 32 / 2 | — |
| `UBMemberGroupList` | [Shared / Other](by-topic/shared-other.md) | [L441150](../../../ScriptDB/000_4_CreateSP.sql#L441150) | — | 3 / 0 | — |
| `UBMemberInfo` | [Shared / Other](by-topic/shared-other.md) | [L441185](../../../ScriptDB/000_4_CreateSP.sql#L441185) | 1 / 1 file | 0 / 2 | [Member.cs:515](../../../UBClasses/Member.cs#L515) |
| `UBMemberInfoBank` | [Shared / Other](by-topic/shared-other.md) | [L441369](../../../ScriptDB/000_4_CreateSP.sql#L441369) | 1 / 1 file | 0 / 1 | [PanelMemberBankAdd.aspx.cs:70](../../../WebApp/Main/PanelMemberBankAdd.aspx.cs#L70) |
| `UBMemberInfoBankTMP` | [Shared / Other](by-topic/shared-other.md) | [L441491](../../../ScriptDB/000_4_CreateSP.sql#L441491) | 1 / 1 file | 0 / 0 | [PanelMemberBankAdd.aspx.cs:70](../../../WebApp/Main/PanelMemberBankAdd.aspx.cs#L70) |
| `UBMemberInfoEdit` | [Shared / Other](by-topic/shared-other.md) | [L441534](../../../ScriptDB/000_4_CreateSP.sql#L441534) | 1 / 1 file | 0 / 0 | [Member.cs:601](../../../UBClasses/Member.cs#L601) |
| `UBMemberLastPage` | [Shared / Other](by-topic/shared-other.md) | [L441653](../../../ScriptDB/000_4_CreateSP.sql#L441653) | 1 / 1 file | 0 / 0 | [Member.cs:1595](../../../UBClasses/Member.cs#L1595) |
| `UBMemberLicenseAdd` | [Shared / Other](by-topic/shared-other.md) | [L441677](../../../ScriptDB/000_4_CreateSP.sql#L441677) | 1 / 1 file | 0 / 0 | [Member.cs:1837](../../../UBClasses/Member.cs#L1837) |
| `UBMemberLicenseList` | [Shared / Other](by-topic/shared-other.md) | [L441790](../../../ScriptDB/000_4_CreateSP.sql#L441790) | 2 / 1 file | 1 / 0 | [Member.cs:1730](../../../UBClasses/Member.cs#L1730) |
| `UBMemberLicenseListAll` | [Shared / Other](by-topic/shared-other.md) | [L441847](../../../ScriptDB/000_4_CreateSP.sql#L441847) | — | 0 / 0 | — |
| `UBMemberLicenseListExpired` | [Shared / Other](by-topic/shared-other.md) | [L442050](../../../ScriptDB/000_4_CreateSP.sql#L442050) | — | 0 / 0 | — |
| `UBMemberLicenseListExpireDays` | [Shared / Other](by-topic/shared-other.md) | [L442284](../../../ScriptDB/000_4_CreateSP.sql#L442284) | — | 0 / 0 | — |
| `UBMemberLicenseModify` | [Shared / Other](by-topic/shared-other.md) | [L442519](../../../ScriptDB/000_4_CreateSP.sql#L442519) | 1 / 1 file | 0 / 0 | [Member.cs:1837](../../../UBClasses/Member.cs#L1837) |
| `UBMemberLicenseRemove` | [Shared / Other](by-topic/shared-other.md) | [L442618](../../../ScriptDB/000_4_CreateSP.sql#L442618) | 1 / 1 file | 0 / 0 | [Member.cs:1912](../../../UBClasses/Member.cs#L1912) |
| `UBMemberList` | [Shared / Other](by-topic/shared-other.md) | [L442645](../../../ScriptDB/000_4_CreateSP.sql#L442645) | — | 0 / 0 | — |
| `UBMemberListNoPW` | [Security & Auth](by-topic/security-auth.md) | [L442794](../../../ScriptDB/000_4_CreateSP.sql#L442794) | 1 / 1 file | 0 / 0 | [WFPassword.aspx.cs:69](../../../WebApp/Main/WFPassword.aspx.cs#L69) |
| `UBMemberLogin` | [Security & Auth](by-topic/security-auth.md) | [L442823](../../../ScriptDB/000_4_CreateSP.sql#L442823) | 1 / 1 file | 0 / 2 | [Member.cs:1205](../../../UBClasses/Member.cs#L1205) |
| `UBMemberLoginChange` | [Security & Auth](by-topic/security-auth.md) | [L443316](../../../ScriptDB/000_4_CreateSP.sql#L443316) | 1 / 1 file | 0 / 0 | [Member.cs:4378](../../../UBClasses/Member.cs#L4378) |
| `UBMemberLoginHistory` | [Security & Auth](by-topic/security-auth.md) | [L443381](../../../ScriptDB/000_4_CreateSP.sql#L443381) | — | 0 / 0 | — |
| `UBMemberLoginHistoryList` | [Security & Auth](by-topic/security-auth.md) | [L443429](../../../ScriptDB/000_4_CreateSP.sql#L443429) | — | 0 / 0 | — |
| `UBMemberLoginOther` | [Security & Auth](by-topic/security-auth.md) | [L443449](../../../ScriptDB/000_4_CreateSP.sql#L443449) | 1 / 1 file | 0 / 0 | [Member.cs:1057](../../../UBClasses/Member.cs#L1057) |
| `UBMemberLoginShort` | [Security & Auth](by-topic/security-auth.md) | [L443481](../../../ScriptDB/000_4_CreateSP.sql#L443481) | — | 0 / 0 | — |
| `UBMemberLogout` | [Shared / Other](by-topic/shared-other.md) | [L443541](../../../ScriptDB/000_4_CreateSP.sql#L443541) | — | 2 / 1 | — |
| `UBMemberName` | [Shared / Other](by-topic/shared-other.md) | [L443578](../../../ScriptDB/000_4_CreateSP.sql#L443578) | 1 / 1 file | 0 / 0 | [Member.cs:2222](../../../UBClasses/Member.cs#L2222) |
| `UBMemberNameByRepCode` | [Shared / Other](by-topic/shared-other.md) | [L443609](../../../ScriptDB/000_4_CreateSP.sql#L443609) | 1 / 1 file | 0 / 0 | [Member.cs:2263](../../../UBClasses/Member.cs#L2263) |
| `UBMemberNoteAdd` | [Shared / Other](by-topic/shared-other.md) | [L443648](../../../ScriptDB/000_4_CreateSP.sql#L443648) | 1 / 1 file | 0 / 0 | [Member.cs:3150](../../../UBClasses/Member.cs#L3150) |
| `UBMemberNoteDelete` | [Shared / Other](by-topic/shared-other.md) | [L443681](../../../ScriptDB/000_4_CreateSP.sql#L443681) | 1 / 1 file | 0 / 0 | [Member.cs:3196](../../../UBClasses/Member.cs#L3196) |
| `UBMemberNoteInfo` | [Shared / Other](by-topic/shared-other.md) | [L443706](../../../ScriptDB/000_4_CreateSP.sql#L443706) | 1 / 1 file | 0 / 0 | [Member.cs:3243](../../../UBClasses/Member.cs#L3243) |
| `UBMemberNoteSet` | [Shared / Other](by-topic/shared-other.md) | [L443731](../../../ScriptDB/000_4_CreateSP.sql#L443731) | 1 / 1 file | 2 / 0 | [Member.cs:2923](../../../UBClasses/Member.cs#L2923) |
| `UBMemberOBAList` | [Shared / Other](by-topic/shared-other.md) | [L443760](../../../ScriptDB/000_4_CreateSP.sql#L443760) | 1 / 1 file | 2 / 0 | [Member.cs:4208](../../../UBClasses/Member.cs#L4208) |
| `UBMemberOBASave` | [Shared / Other](by-topic/shared-other.md) | [L443814](../../../ScriptDB/000_4_CreateSP.sql#L443814) | 1 / 1 file | 0 / 0 | [Member.cs:4158](../../../UBClasses/Member.cs#L4158) |
| `UBMemberOnboardingGetOne` | [Onboarding](by-topic/onboarding.md) | [L443863](../../../ScriptDB/000_4_CreateSP.sql#L443863) | 1 / 1 file | 0 / 0 | [COnBoard.cs:293](../../../UBClasses/COnBoard.cs#L293) |
| `UBMemberOtherSet` | [Shared / Other](by-topic/shared-other.md) | [L443889](../../../ScriptDB/000_4_CreateSP.sql#L443889) | 1 / 1 file | 0 / 5 | [Member.cs:2832](../../../UBClasses/Member.cs#L2832) |
| `UBMemberPermission` | [Security & Auth](by-topic/security-auth.md) | [L443924](../../../ScriptDB/000_4_CreateSP.sql#L443924) | — | 0 / 0 | — |
| `UBMemberProfileInfo` | [Shared / Other](by-topic/shared-other.md) | [L443958](../../../ScriptDB/000_4_CreateSP.sql#L443958) | 1 / 1 file | 0 / 6 | [Member.cs:654](../../../UBClasses/Member.cs#L654) |
| `UBMemberProfileReset` | [Shared / Other](by-topic/shared-other.md) | [L444046](../../../ScriptDB/000_4_CreateSP.sql#L444046) | — | 0 / 1 | — |
| `UBMemberProfileUpdate` | [Shared / Other](by-topic/shared-other.md) | [L444089](../../../ScriptDB/000_4_CreateSP.sql#L444089) | — | 0 / 3 | — |
| `UBMemberPWbyUserID` | [Security & Auth](by-topic/security-auth.md) | [L444155](../../../ScriptDB/000_4_CreateSP.sql#L444155) | — | 0 / 0 | — |
| `UBMemberPWChanged` | [Security & Auth](by-topic/security-auth.md) | [L444171](../../../ScriptDB/000_4_CreateSP.sql#L444171) | 1 / 1 file | 0 / 0 | [Member.cs:4433](../../../UBClasses/Member.cs#L4433) |
| `UBMemberRefreshAdminAccess` | [Shared / Other](by-topic/shared-other.md) | [L444196](../../../ScriptDB/000_4_CreateSP.sql#L444196) | — | 0 / 1 | — |
| `UBMemberRepAccessList` | [Shared / Other](by-topic/shared-other.md) | [L444225](../../../ScriptDB/000_4_CreateSP.sql#L444225) | 2 / 2 file | 196 / 0 | [Advisor.cs:291](../../../UBClasses/Advisor.cs#L291) |
| `UBMemberRepAccessListB` | [Shared / Other](by-topic/shared-other.md) | [L444370](../../../ScriptDB/000_4_CreateSP.sql#L444370) | — | 4 / 0 | — |
| `UBMemberRepAccessReset` | [Shared / Other](by-topic/shared-other.md) | [L444515](../../../ScriptDB/000_4_CreateSP.sql#L444515) | 1 / 1 file | 10 / 0 | [Member.cs:2643](../../../UBClasses/Member.cs#L2643) |
| `UBMemberRepAccessResetAll` | [Shared / Other](by-topic/shared-other.md) | [L444777](../../../ScriptDB/000_4_CreateSP.sql#L444777) | — | 1 / 1 | — |
| `UBMemberRepCodeList` | [Shared / Other](by-topic/shared-other.md) | [L444823](../../../ScriptDB/000_4_CreateSP.sql#L444823) | — | 0 / 0 | — |
| `UBMemberRepList` | [Shared / Other](by-topic/shared-other.md) | [L444849](../../../ScriptDB/000_4_CreateSP.sql#L444849) | 1 / 1 file | 0 / 0 | [Member.cs:850](../../../UBClasses/Member.cs#L850) |
| `UBMemberRepTransfer` | [Shared / Other](by-topic/shared-other.md) | [L444878](../../../ScriptDB/000_4_CreateSP.sql#L444878) | — | 0 / 0 | — |
| `UBMemberRoleInfo` | [Security & Auth](by-topic/security-auth.md) | [L445051](../../../ScriptDB/000_4_CreateSP.sql#L445051) | — | 1 / 0 | — |
| `UBMemberSelectList` | [Shared / Other](by-topic/shared-other.md) | [L445071](../../../ScriptDB/000_4_CreateSP.sql#L445071) | 1 / 1 file | 0 / 2 | [Member.cs:4257](../../../UBClasses/Member.cs#L4257) |
| `UBMemberSetAssistantPrimary` | [Shared / Other](by-topic/shared-other.md) | [L445409](../../../ScriptDB/000_4_CreateSP.sql#L445409) | — | 0 / 0 | — |
| `UBMemberSetRepReadOnly` | [Shared / Other](by-topic/shared-other.md) | [L445441](../../../ScriptDB/000_4_CreateSP.sql#L445441) | — | 0 / 0 | — |
| `UBMemberSetupComboList` | [Shared / Other](by-topic/shared-other.md) | [L445484](../../../ScriptDB/000_4_CreateSP.sql#L445484) | — | 0 / 6 | — |
| `UBMemberSetupList` | [Shared / Other](by-topic/shared-other.md) | [L445532](../../../ScriptDB/000_4_CreateSP.sql#L445532) | 2 / 1 file | 0 / 1 | [Member.cs:46](../../../UBClasses/Member.cs#L46) |
| `UBMemberSetupRemove` | [Shared / Other](by-topic/shared-other.md) | [L445960](../../../ScriptDB/000_4_CreateSP.sql#L445960) | 1 / 1 file | 0 / 0 | [MemberSetup.aspx.cs:1170](../../../WebApp/Main/MemberSetup.aspx.cs#L1170) |
| `UBMemberSetupSearchCriteriaSave` | [Shared / Other](by-topic/shared-other.md) | [L446020](../../../ScriptDB/000_4_CreateSP.sql#L446020) | — | 1 / 0 | — |
| `UBMemberStatementFeeFileClear` | [Commission & Fee](by-topic/commission-fee.md) | [L446159](../../../ScriptDB/000_4_CreateSP.sql#L446159) | — | 1 / 0 | — |
| `UBMemberStatementFeeImport` | [Commission & Fee](by-topic/commission-fee.md) | [L446172](../../../ScriptDB/000_4_CreateSP.sql#L446172) | — | 0 / 0 | — |
| `UBMemberStatementFeeImportDef` | [Commission & Fee](by-topic/commission-fee.md) | [L446232](../../../ScriptDB/000_4_CreateSP.sql#L446232) | — | 0 / 0 | — |
| `UBMemberStatementFeeList` | [Commission & Fee](by-topic/commission-fee.md) | [L446253](../../../ScriptDB/000_4_CreateSP.sql#L446253) | 1 / 1 file | 0 / 0 | [StatementFeeImport.cs:37](../../../UBClasses/StatementFeeImport.cs#L37) |
| `UBMemberStatementFeeProcess1Record` | [Commission & Fee](by-topic/commission-fee.md) | [L446360](../../../ScriptDB/000_4_CreateSP.sql#L446360) | — | 1 / 0 | — |
| `UBMemberStatementFeeProcessTaggedItems` | [Commission & Fee](by-topic/commission-fee.md) | [L446431](../../../ScriptDB/000_4_CreateSP.sql#L446431) | — | 0 / 1 | — |
| `UBMemberStatementFeeReadOneRecord` | [Commission & Fee](by-topic/commission-fee.md) | [L446480](../../../ScriptDB/000_4_CreateSP.sql#L446480) | — | 0 / 2 | — |
| `UBMemberStatementFeeSelectionUpdate` | [Commission & Fee](by-topic/commission-fee.md) | [L446540](../../../ScriptDB/000_4_CreateSP.sql#L446540) | — | 0 / 0 | — |
| `UBMemberStats` | [Shared / Other](by-topic/shared-other.md) | [L446578](../../../ScriptDB/000_4_CreateSP.sql#L446578) | — | 0 / 0 | — |
| `UBMemberStatusList` | [Shared / Other](by-topic/shared-other.md) | [L446620](../../../ScriptDB/000_4_CreateSP.sql#L446620) | — | 1 / 0 | — |
| `UBMemberT4AdjustAdd` | [Shared / Other](by-topic/shared-other.md) | [L446646](../../../ScriptDB/000_4_CreateSP.sql#L446646) | 1 / 1 file | 0 / 0 | [Member.cs:4693](../../../UBClasses/Member.cs#L4693) |
| `UBMemberT4AdjustInfo` | [Shared / Other](by-topic/shared-other.md) | [L446668](../../../ScriptDB/000_4_CreateSP.sql#L446668) | 1 / 1 file | 0 / 0 | [Member.cs:4608](../../../UBClasses/Member.cs#L4608) |
| `UBMemberT4AdjustList` | [Shared / Other](by-topic/shared-other.md) | [L446681](../../../ScriptDB/000_4_CreateSP.sql#L446681) | 1 / 1 file | 0 / 0 | [Member.cs:4565](../../../UBClasses/Member.cs#L4565) |
| `UBMemberT4AdjustRemove` | [Shared / Other](by-topic/shared-other.md) | [L446696](../../../ScriptDB/000_4_CreateSP.sql#L446696) | 1 / 1 file | 0 / 0 | [Member.cs:4650](../../../UBClasses/Member.cs#L4650) |
| `UBMemberTMPEnd` | [Shared / Other](by-topic/shared-other.md) | [L446709](../../../ScriptDB/000_4_CreateSP.sql#L446709) | — | 1 / 0 | — |
| `UBMemberTMPProcessOne` | [Shared / Other](by-topic/shared-other.md) | [L446756](../../../ScriptDB/000_4_CreateSP.sql#L446756) | — | 1 / 3 | — |
| `UBMemberTrxPermissionAdd` | [Trading & Orders](by-topic/trading-orders.md) | [L446915](../../../ScriptDB/000_4_CreateSP.sql#L446915) | 1 / 1 file | 0 / 0 | [PopupMemberAdd.aspx.cs:974](../../../WebApp/Main/PopupMemberAdd.aspx.cs#L974) |
| `UBMemberUpdateUI` | [Shared / Other](by-topic/shared-other.md) | [L446969](../../../ScriptDB/000_4_CreateSP.sql#L446969) | — | 0 / 4 | — |
| `UBMerge2ClientNamePlans` | [Account & Plan](by-topic/account-plan.md) | [L447324](../../../ScriptDB/000_4_CreateSP.sql#L447324) | — | 1 / 1 | — |
| `UBMerge2FundAccounts` | [Fund & GIC](by-topic/fund-gic.md) | [L447434](../../../ScriptDB/000_4_CreateSP.sql#L447434) | — | 1 / 0 | — |
| `UBMergeClientInfo` | [Client & KYC](by-topic/client-kyc.md) | [L447491](../../../ScriptDB/000_4_CreateSP.sql#L447491) | 1 / 1 file | 0 / 1 | [Plan.cs:3210](../../../UBClasses/Plan.cs#L3210) |
| `UBMergeClientNamePlans` | [Account & Plan](by-topic/account-plan.md) | [L447556](../../../ScriptDB/000_4_CreateSP.sql#L447556) | — | 0 / 1 | — |
| `UBMFDAFeeProcess` | [Compliance](by-topic/compliance.md) | [L447641](../../../ScriptDB/000_4_CreateSP.sql#L447641) | 1 / 1 file | 0 / 0 | [CMFDAFee.cs:178](../../../UBClasses/CMFDAFee.cs#L178) |
| `UBMFDAFeeProcessUndo` | [Compliance](by-topic/compliance.md) | [L447708](../../../ScriptDB/000_4_CreateSP.sql#L447708) | 1 / 1 file | 0 / 0 | [CMFDAFee.cs:227](../../../UBClasses/CMFDAFee.cs#L227) |
| `UBMFDAFeeReportDetailList` | [Compliance](by-topic/compliance.md) | [L447752](../../../ScriptDB/000_4_CreateSP.sql#L447752) | 1 / 1 file | 0 / 0 | [CMFDAFee.cs:101](../../../UBClasses/CMFDAFee.cs#L101) |
| `UBMFDAFeeReportHeaderList` | [Compliance](by-topic/compliance.md) | [L447927](../../../ScriptDB/000_4_CreateSP.sql#L447927) | 1 / 1 file | 0 / 0 | [CMFDAFee.cs:46](../../../UBClasses/CMFDAFee.cs#L46) |
| `UBMFInfo` | [Shared / Other](by-topic/shared-other.md) | [L447986](../../../ScriptDB/000_4_CreateSP.sql#L447986) | 1 / 1 file | 1 / 5 | [Customer.cs:1463](../../../UBClasses/Customer.cs#L1463) |
| `UBMFInfoSysPlan` | [Account & Plan](by-topic/account-plan.md) | [L448240](../../../ScriptDB/000_4_CreateSP.sql#L448240) | 2 / 2 file | 0 / 0 | [SysPlan.cs:1408](../../../UBClasses/SysPlan.cs#L1408) |
| `UBMFInfoSysPlanDetail` | [Account & Plan](by-topic/account-plan.md) | [L448490](../../../ScriptDB/000_4_CreateSP.sql#L448490) | — | 0 / 0 | — |
| `UBMFTrxList` | [Trading & Orders](by-topic/trading-orders.md) | [L448543](../../../ScriptDB/000_4_CreateSP.sql#L448543) | 2 / 1 file | 0 / 0 | [Customer.cs:1531](../../../UBClasses/Customer.cs#L1531) |
| `UBMFTrxList4Doc` | [Trading & Orders](by-topic/trading-orders.md) | [L448939](../../../ScriptDB/000_4_CreateSP.sql#L448939) | 1 / 1 file | 0 / 0 | [Customer.cs:1722](../../../UBClasses/Customer.cs#L1722) |
| `UBMFTrxListWC` | [Trading & Orders](by-topic/trading-orders.md) | [L449145](../../../ScriptDB/000_4_CreateSP.sql#L449145) | 1 / 1 file | 0 / 0 | [Customer.cs:1770](../../../UBClasses/Customer.cs#L1770) |
| `UBMFTrxListWithAvgCost` | [Trading & Orders](by-topic/trading-orders.md) | [L449539](../../../ScriptDB/000_4_CreateSP.sql#L449539) | 1 / 1 file | 0 / 0 | [Trx.cs:6187](../../../UBClasses/Trx.cs#L6187) |
| `UBMFTrxListX` | [Trading & Orders](by-topic/trading-orders.md) | [L449586](../../../ScriptDB/000_4_CreateSP.sql#L449586) | 1 / 1 file | 0 / 0 | [FundAccount.cs:3103](../../../UBClasses/FundAccount.cs#L3103) |
| `UBMgmtAdd` | [Shared / Other](by-topic/shared-other.md) | [L449650](../../../ScriptDB/000_4_CreateSP.sql#L449650) | 1 / 1 file | 6 / 2 | [Mgmt.cs:915](../../../UBClasses/Mgmt.cs#L915) |
| `UBMgmtInfo` | [Shared / Other](by-topic/shared-other.md) | [L449733](../../../ScriptDB/000_4_CreateSP.sql#L449733) | — | 2 / 0 | — |
| `UBMgmtList` | [Shared / Other](by-topic/shared-other.md) | [L449794](../../../ScriptDB/000_4_CreateSP.sql#L449794) | 1 / 1 file | 0 / 0 | [Mgmt.cs:770](../../../UBClasses/Mgmt.cs#L770) |
| `UBMgmtListActiveFund` | [Fund & GIC](by-topic/fund-gic.md) | [L449968](../../../ScriptDB/000_4_CreateSP.sql#L449968) | — | 0 / 0 | — |
| `UBMgmtListBond` | [Shared / Other](by-topic/shared-other.md) | [L450013](../../../ScriptDB/000_4_CreateSP.sql#L450013) | — | 0 / 0 | — |
| `UBMgmtListFund` | [Fund & GIC](by-topic/fund-gic.md) | [L450043](../../../ScriptDB/000_4_CreateSP.sql#L450043) | — | 0 / 0 | — |
| `UBMgmtListGIC` | [Fund & GIC](by-topic/fund-gic.md) | [L450073](../../../ScriptDB/000_4_CreateSP.sql#L450073) | — | 0 / 0 | — |
| `UBMgmtListMortgage` | [Shared / Other](by-topic/shared-other.md) | [L450169](../../../ScriptDB/000_4_CreateSP.sql#L450169) | — | 0 / 0 | — |
| `UBMgmtListShort` | [Shared / Other](by-topic/shared-other.md) | [L450198](../../../ScriptDB/000_4_CreateSP.sql#L450198) | — | 1 / 0 | — |
| `UBMgmtListStock` | [Shared / Other](by-topic/shared-other.md) | [L450229](../../../ScriptDB/000_4_CreateSP.sql#L450229) | — | 0 / 0 | — |
| `UBMgmtListTerm` | [Shared / Other](by-topic/shared-other.md) | [L450259](../../../ScriptDB/000_4_CreateSP.sql#L450259) | — | 0 / 0 | — |
| `UBMgmtRemove` | [Shared / Other](by-topic/shared-other.md) | [L450288](../../../ScriptDB/000_4_CreateSP.sql#L450288) | 1 / 1 file | 0 / 0 | [Mgmt.cs:1035](../../../UBClasses/Mgmt.cs#L1035) |
| `UBMgmtTypeList` | [Shared / Other](by-topic/shared-other.md) | [L450338](../../../ScriptDB/000_4_CreateSP.sql#L450338) | — | 0 / 0 | — |
| `UBMgmtUpdate` | [Shared / Other](by-topic/shared-other.md) | [L450364](../../../ScriptDB/000_4_CreateSP.sql#L450364) | 1 / 1 file | 0 / 4 | [Mgmt.cs:915](../../../UBClasses/Mgmt.cs#L915) |
| `UBMiscellaneousComboList` | [Shared / Other](by-topic/shared-other.md) | [L450458](../../../ScriptDB/000_4_CreateSP.sql#L450458) | — | 0 / 7 | — |
| `UBModelPortfolioList` | [Shared / Other](by-topic/shared-other.md) | [L450500](../../../ScriptDB/000_4_CreateSP.sql#L450500) | — | 2 / 0 | — |
| `UBMoneyMovementFileList` | [Shared / Other](by-topic/shared-other.md) | [L450526](../../../ScriptDB/000_4_CreateSP.sql#L450526) | 1 / 1 file | 0 / 0 | [CAFFile.cs:110](../../../UBClasses/CAFFile.cs#L110) |
| `UBMoneyMovementFileSelectionUpdate` | [Shared / Other](by-topic/shared-other.md) | [L450657](../../../ScriptDB/000_4_CreateSP.sql#L450657) | — | 0 / 0 | — |
| `UBMoneyMovementList` | [Shared / Other](by-topic/shared-other.md) | [L450704](../../../ScriptDB/000_4_CreateSP.sql#L450704) | — | 0 / 0 | — |
| `UBMonthDayList` | [Shared / Other](by-topic/shared-other.md) | [L450804](../../../ScriptDB/000_4_CreateSP.sql#L450804) | — | 1 / 0 | — |
| `UBMQManagerAdd` | [Shared / Other](by-topic/shared-other.md) | [L450856](../../../ScriptDB/000_4_CreateSP.sql#L450856) | — | 0 / 0 | — |
| `UBMQManagerInfo` | [Shared / Other](by-topic/shared-other.md) | [L450921](../../../ScriptDB/000_4_CreateSP.sql#L450921) | — | 1 / 0 | — |
| `UBMQManagerUpdate` | [Shared / Other](by-topic/shared-other.md) | [L450956](../../../ScriptDB/000_4_CreateSP.sql#L450956) | — | 0 / 0 | — |
| `UBMQParamInfo` | [Shared / Other](by-topic/shared-other.md) | [L451009](../../../ScriptDB/000_4_CreateSP.sql#L451009) | — | 0 / 1 | — |
| `UBMQParamInfoAdd` | [Shared / Other](by-topic/shared-other.md) | [L451042](../../../ScriptDB/000_4_CreateSP.sql#L451042) | — | 0 / 0 | — |
| `UBNetworthIndex` | [Shared / Other](by-topic/shared-other.md) | [L451092](../../../ScriptDB/000_4_CreateSP.sql#L451092) | 1 / 1 file | 0 / 0 | [Customer.cs:4590](../../../UBClasses/Customer.cs#L4590) |
| `UBNFU_CUI_Daily4Intermediary` | [Fundserv & Import](by-topic/fundserv-import.md) | [L451118](../../../ScriptDB/000_4_CreateSP.sql#L451118) | — | 0 / 4 | — |
| `UBNFUAdd` | [Fundserv & Import](by-topic/fundserv-import.md) | [L451245](../../../ScriptDB/000_4_CreateSP.sql#L451245) | — | 20 / 1 | — |
| `UBNFUAdd_CUI_All` | [Fundserv & Import](by-topic/fundserv-import.md) | [L451499](../../../ScriptDB/000_4_CreateSP.sql#L451499) | — | 0 / 2 | — |
| `UBNFUAddOne` | [Fundserv & Import](by-topic/fundserv-import.md) | [L451538](../../../ScriptDB/000_4_CreateSP.sql#L451538) | — | 2 / 0 | — |
| `UBNFUBenFATCAAdd` | [Fundserv & Import](by-topic/fundserv-import.md) | [L451599](../../../ScriptDB/000_4_CreateSP.sql#L451599) | — | 0 / 1 | — |
| `UBNFUClientAddressChangeAdd` | [Fundserv & Import](by-topic/fundserv-import.md) | [L451649](../../../ScriptDB/000_4_CreateSP.sql#L451649) | — | 3 / 1 | — |
| `UBNFUClientFATCAAdd` | [Fundserv & Import](by-topic/fundserv-import.md) | [L451703](../../../ScriptDB/000_4_CreateSP.sql#L451703) | — | 1 / 1 | — |
| `UBNFUCreateFile` | [Fundserv & Import](by-topic/fundserv-import.md) | [L451761](../../../ScriptDB/000_4_CreateSP.sql#L451761) | 1 / 1 file | 0 / 1 | [CXM.cs:94](../../../UBFFImport/CXM.cs#L94) |
| `UBNFUCreateFileName` | [Fundserv & Import](by-topic/fundserv-import.md) | [L451802](../../../ScriptDB/000_4_CreateSP.sql#L451802) | — | 2 / 0 | — |
| `UBNFUCreateMSGXML` | [Fundserv & Import](by-topic/fundserv-import.md) | [L451912](../../../ScriptDB/000_4_CreateSP.sql#L451912) | — | 2 / 4 | — |
| `UBNFUCreateOneFileMSG` | [Fundserv & Import](by-topic/fundserv-import.md) | [L452688](../../../ScriptDB/000_4_CreateSP.sql#L452688) | — | 1 / 0 | — |
| `UBNFUHistoryList` | [Fundserv & Import](by-topic/fundserv-import.md) | [L452730](../../../ScriptDB/000_4_CreateSP.sql#L452730) | 1 / 1 file | 0 / 1 | [NFU.cs:134](../../../UBClasses/NFU.cs#L134) |
| `UBNFUInTrustFATCAAdd` | [Fundserv & Import](by-topic/fundserv-import.md) | [L452955](../../../ScriptDB/000_4_CreateSP.sql#L452955) | — | 1 / 1 | — |
| `UBNFUPendingList` | [Fundserv & Import](by-topic/fundserv-import.md) | [L453013](../../../ScriptDB/000_4_CreateSP.sql#L453013) | 1 / 1 file | 0 / 1 | [NFU.cs:51](../../../UBClasses/NFU.cs#L51) |
| `UBNFUPendingMove2Waiting` | [Fundserv & Import](by-topic/fundserv-import.md) | [L453306](../../../ScriptDB/000_4_CreateSP.sql#L453306) | — | 0 / 2 | — |
| `UBNFURemove` | [Fundserv & Import](by-topic/fundserv-import.md) | [L453404](../../../ScriptDB/000_4_CreateSP.sql#L453404) | — | 0 / 0 | — |
| `UBNFURemoveTagged` | [Fundserv & Import](by-topic/fundserv-import.md) | [L453430](../../../ScriptDB/000_4_CreateSP.sql#L453430) | — | 0 / 0 | — |
| `UBNFURepTransfer` | [Fundserv & Import](by-topic/fundserv-import.md) | [L453466](../../../ScriptDB/000_4_CreateSP.sql#L453466) | — | 0 / 3 | — |
| `UBNFUSelectionUpdate` | [Fundserv & Import](by-topic/fundserv-import.md) | [L453600](../../../ScriptDB/000_4_CreateSP.sql#L453600) | — | 0 / 0 | — |
| `UBNFUStatusDetail` | [Fundserv & Import](by-topic/fundserv-import.md) | [L453647](../../../ScriptDB/000_4_CreateSP.sql#L453647) | — | 0 / 0 | — |
| `UBNMTrxSettlementList` | [Trading & Orders](by-topic/trading-orders.md) | [L453707](../../../ScriptDB/000_4_CreateSP.sql#L453707) | — | 0 / 0 | — |
| `UBNomineeIncomeList` | [Shared / Other](by-topic/shared-other.md) | [L453764](../../../ScriptDB/000_4_CreateSP.sql#L453764) | 1 / 1 file | 0 / 1 | [Plan.cs:4393](../../../UBClasses/Plan.cs#L4393) |
| `UBNomineeIncomePlanID` | [Account & Plan](by-topic/account-plan.md) | [L453955](../../../ScriptDB/000_4_CreateSP.sql#L453955) | — | 0 / 0 | — |
| `UBNoteAdd` | [Shared / Other](by-topic/shared-other.md) | [L453981](../../../ScriptDB/000_4_CreateSP.sql#L453981) | 1 / 1 file | 22 / 1 | [Note.cs:327](../../../UBClasses/Note.cs#L327) |
| `UBNoteAdd2Note` | [Shared / Other](by-topic/shared-other.md) | [L454336](../../../ScriptDB/000_4_CreateSP.sql#L454336) | — | 2 / 1 | — |
| `UBNoteAddLink` | [Shared / Other](by-topic/shared-other.md) | [L454379](../../../ScriptDB/000_4_CreateSP.sql#L454379) | — | 8 / 0 | — |
| `UBNoteAddTaggedFundAccount` | [Fund & GIC](by-topic/fund-gic.md) | [L454408](../../../ScriptDB/000_4_CreateSP.sql#L454408) | — | 0 / 1 | — |
| `UBNoteAddTaggedPlan` | [Account & Plan](by-topic/account-plan.md) | [L454460](../../../ScriptDB/000_4_CreateSP.sql#L454460) | — | 0 / 1 | — |
| `UBNoteAddTaggedTrx` | [Trading & Orders](by-topic/trading-orders.md) | [L454511](../../../ScriptDB/000_4_CreateSP.sql#L454511) | — | 0 / 1 | — |
| `UBNoteDelete` | [Shared / Other](by-topic/shared-other.md) | [L454563](../../../ScriptDB/000_4_CreateSP.sql#L454563) | 1 / 1 file | 0 / 0 | [Note.cs:413](../../../UBClasses/Note.cs#L413) |
| `UBNoteList` | [Shared / Other](by-topic/shared-other.md) | [L454632](../../../ScriptDB/000_4_CreateSP.sql#L454632) | 1 / 1 file | 1 / 0 | [Note.cs:38](../../../UBClasses/Note.cs#L38) |
| `UBNoteListClient` | [Client & KYC](by-topic/client-kyc.md) | [L454873](../../../ScriptDB/000_4_CreateSP.sql#L454873) | 1 / 1 file | 2 / 0 | [Note.cs:135](../../../UBClasses/Note.cs#L135) |
| `UBNoteTypeStr` | [Shared / Other](by-topic/shared-other.md) | [L455371](../../../ScriptDB/000_4_CreateSP.sql#L455371) | 1 / 1 file | 0 / 0 | [Note.cs:463](../../../UBClasses/Note.cs#L463) |
| `UBNoteUpdate` | [Shared / Other](by-topic/shared-other.md) | [L455398](../../../ScriptDB/000_4_CreateSP.sql#L455398) | 1 / 1 file | 0 / 0 | [Note.cs:327](../../../UBClasses/Note.cs#L327) |
| `UBNotificationCheck` | [Notifications](by-topic/notifications.md) | [L455493](../../../ScriptDB/000_4_CreateSP.sql#L455493) | — | 0 / 0 | — |
| `UBNotify` | [Notifications](by-topic/notifications.md) | [L455560](../../../ScriptDB/000_4_CreateSP.sql#L455560) | — | 11 / 1 | — |
| `UBNotifyAdd` | [Notifications](by-topic/notifications.md) | [L455589](../../../ScriptDB/000_4_CreateSP.sql#L455589) | — | 3 / 2 | — |
| `UBNotifyGetNameEmail` | [Notifications](by-topic/notifications.md) | [L455978](../../../ScriptDB/000_4_CreateSP.sql#L455978) | — | 0 / 0 | — |
| `UBNotifyInfo` | [Notifications](by-topic/notifications.md) | [L456025](../../../ScriptDB/000_4_CreateSP.sql#L456025) | — | 0 / 0 | — |
| `UBNotifyInitDlg` | [Notifications](by-topic/notifications.md) | [L456112](../../../ScriptDB/000_4_CreateSP.sql#L456112) | — | 0 / 0 | — |
| `UBNotifyInternal` | [Notifications](by-topic/notifications.md) | [L456462](../../../ScriptDB/000_4_CreateSP.sql#L456462) | — | 19 / 0 | — |
| `UBNotifyList` | [Notifications](by-topic/notifications.md) | [L457107](../../../ScriptDB/000_4_CreateSP.sql#L457107) | 1 / 1 file | 0 / 1 | [Notification.cs:253](../../../UBClasses/Notification.cs#L253) |
| `UBNotifyListWC` | [Notifications](by-topic/notifications.md) | [L457957](../../../ScriptDB/000_4_CreateSP.sql#L457957) | 1 / 1 file | 0 / 0 | [Notification.cs:333](../../../UBClasses/Notification.cs#L333) |
| `UBNotifyListWCX` | [Notifications](by-topic/notifications.md) | [L458059](../../../ScriptDB/000_4_CreateSP.sql#L458059) | — | 0 / 0 | — |
| `UBNotifyRemove` | [Notifications](by-topic/notifications.md) | [L458203](../../../ScriptDB/000_4_CreateSP.sql#L458203) | — | 0 / 0 | — |
| `UBNotifyResendEmail` | [Notifications](by-topic/notifications.md) | [L458308](../../../ScriptDB/000_4_CreateSP.sql#L458308) | — | 0 / 2 | — |
| `UBNotifyUnreadWC` | [Notifications](by-topic/notifications.md) | [L458378](../../../ScriptDB/000_4_CreateSP.sql#L458378) | — | 0 / 0 | — |
| `UBNotifyWCSendX` | [Notifications](by-topic/notifications.md) | [L458403](../../../ScriptDB/000_4_CreateSP.sql#L458403) | — | 0 / 1 | — |
| `UBNR44XML` | [Tax & Year-End](by-topic/tax-yearend.md) | [L458501](../../../ScriptDB/000_4_CreateSP.sql#L458501) | — | 1 / 1 | — |
| `UBNR4Approve2Pending` | [Tax & Year-End](by-topic/tax-yearend.md) | [L458591](../../../ScriptDB/000_4_CreateSP.sql#L458591) | — | 0 / 0 | — |
| `UBNR4ApprovedList` | [Tax & Year-End](by-topic/tax-yearend.md) | [L458646](../../../ScriptDB/000_4_CreateSP.sql#L458646) | — | 0 / 1 | — |
| `UBNR4ApprovedSelectionUpdate` | [Tax & Year-End](by-topic/tax-yearend.md) | [L459018](../../../ScriptDB/000_4_CreateSP.sql#L459018) | — | 0 / 0 | — |
| `UBNR4CancelItem` | [Tax & Year-End](by-topic/tax-yearend.md) | [L459054](../../../ScriptDB/000_4_CreateSP.sql#L459054) | — | 0 / 0 | — |
| `UBNR4Estimate4PortfolioList` | [Tax & Year-End](by-topic/tax-yearend.md) | [L459135](../../../ScriptDB/000_4_CreateSP.sql#L459135) | — | 0 / 0 | — |
| `UBNR4FileDetailList` | [Tax & Year-End](by-topic/tax-yearend.md) | [L459261](../../../ScriptDB/000_4_CreateSP.sql#L459261) | — | 0 / 0 | — |
| `UBNR4FileList` | [Tax & Year-End](by-topic/tax-yearend.md) | [L459333](../../../ScriptDB/000_4_CreateSP.sql#L459333) | — | 0 / 1 | — |
| `UBNR4IDList` | [Tax & Year-End](by-topic/tax-yearend.md) | [L459347](../../../ScriptDB/000_4_CreateSP.sql#L459347) | 1 / 1 file | 0 / 0 | [NR4Pdf.cs:175](../../../VieFUNDPdf/NR4Pdf.cs#L175) |
| `UBNR4ItemInfo` | [Tax & Year-End](by-topic/tax-yearend.md) | [L459378](../../../ScriptDB/000_4_CreateSP.sql#L459378) | — | 0 / 1 | — |
| `UBNR4PendingList` | [Tax & Year-End](by-topic/tax-yearend.md) | [L459590](../../../ScriptDB/000_4_CreateSP.sql#L459590) | — | 0 / 2 | — |
| `UBNR4PendingSelectionUpdate` | [Tax & Year-End](by-topic/tax-yearend.md) | [L460057](../../../ScriptDB/000_4_CreateSP.sql#L460057) | — | 0 / 0 | — |
| `UBNR4ProcessOneItem` | [Tax & Year-End](by-topic/tax-yearend.md) | [L460093](../../../ScriptDB/000_4_CreateSP.sql#L460093) | — | 1 / 0 | — |
| `UBNR4ProcessPendingTaggedItems` | [Tax & Year-End](by-topic/tax-yearend.md) | [L460365](../../../ScriptDB/000_4_CreateSP.sql#L460365) | — | 0 / 1 | — |
| `UBNR4SavePdfObj` | [Tax & Year-End](by-topic/tax-yearend.md) | [L460402](../../../ScriptDB/000_4_CreateSP.sql#L460402) | 1 / 1 file | 0 / 1 | [NR4Pdf.cs:137](../../../VieFUNDPdf/NR4Pdf.cs#L137) |
| `UBNR4ScanAll` | [Tax & Year-End](by-topic/tax-yearend.md) | [L460434](../../../ScriptDB/000_4_CreateSP.sql#L460434) | — | 0 / 1 | — |
| `UBNR4ScanOneItem` | [Tax & Year-End](by-topic/tax-yearend.md) | [L460465](../../../ScriptDB/000_4_CreateSP.sql#L460465) | — | 1 / 0 | — |
| `UBNR4SlipRelease` | [Tax & Year-End](by-topic/tax-yearend.md) | [L460627](../../../ScriptDB/000_4_CreateSP.sql#L460627) | — | 0 / 1 | — |
| `UBNSPFundAccountRepCodeLog` | [Fund & GIC](by-topic/fund-gic.md) | [L460734](../../../ScriptDB/000_4_CreateSP.sql#L460734) | — | 1 / 0 | — |
| `UBNSPFundAccountRepCodeLogClientID` | [Fund & GIC](by-topic/fund-gic.md) | [L460786](../../../ScriptDB/000_4_CreateSP.sql#L460786) | 1 / 1 file | 0 / 0 | [FundAccount.cs:3446](../../../UBClasses/FundAccount.cs#L3446) |
| `UBNSPFundAccountRepCodeLogList` | [Fund & GIC](by-topic/fund-gic.md) | [L460802](../../../ScriptDB/000_4_CreateSP.sql#L460802) | 1 / 1 file | 0 / 2 | [FundAccount.cs:3308](../../../UBClasses/FundAccount.cs#L3308) |
| `UBNSPFundAccountRepCodeLogRemove` | [Fund & GIC](by-topic/fund-gic.md) | [L460937](../../../ScriptDB/000_4_CreateSP.sql#L460937) | 1 / 1 file | 0 / 0 | [FundAccount.cs:3398](../../../UBClasses/FundAccount.cs#L3398) |
| `UBOBAUADashBoard_Client` | [Onboarding](by-topic/onboarding.md) | [L460950](../../../ScriptDB/000_4_CreateSP.sql#L460950) | 2 / 2 file | 0 / 2 | [Dashboard.cs:121](../../../OnboardingWebServices/Dashboard.cs#L121) |
| `UBOBAUADashBoard_ClientOne` | [Onboarding](by-topic/onboarding.md) | [L461020](../../../ScriptDB/000_4_CreateSP.sql#L461020) | 2 / 2 file | 0 / 2 | [Dashboard.cs:173](../../../OnboardingWebServices/Dashboard.cs#L173) |
| `UBOBAUADashBoard_PlanType` | [Onboarding](by-topic/onboarding.md) | [L461113](../../../ScriptDB/000_4_CreateSP.sql#L461113) | 2 / 2 file | 0 / 2 | [Dashboard.cs:547](../../../OnboardingWebServices/Dashboard.cs#L547) |
| `UBOBAUADashBoard_PlanTypeOne` | [Onboarding](by-topic/onboarding.md) | [L461183](../../../ScriptDB/000_4_CreateSP.sql#L461183) | 2 / 2 file | 0 / 2 | [Dashboard.cs:599](../../../OnboardingWebServices/Dashboard.cs#L599) |
| `UBOBAUADashBoard_Product` | [Onboarding](by-topic/onboarding.md) | [L461291](../../../ScriptDB/000_4_CreateSP.sql#L461291) | 2 / 2 file | 0 / 2 | [Dashboard_AssetType.cs:108](../../../OnboardingWebServices/Dashboard_AssetType.cs#L108) |
| `UBOBAUADashBoard_ProductOne` | [Onboarding](by-topic/onboarding.md) | [L461361](../../../ScriptDB/000_4_CreateSP.sql#L461361) | 2 / 2 file | 0 / 2 | [Dashboard_AssetType.cs:160](../../../OnboardingWebServices/Dashboard_AssetType.cs#L160) |
| `UBOBClientInfoExport` | [Onboarding](by-topic/onboarding.md) | [L461450](../../../ScriptDB/000_4_CreateSP.sql#L461450) | 2 / 2 file | 0 / 2 | [ClientDetail.cs:79](../../../OnboardingWebServices/ClientDetail.cs#L79) |
| `UBOBClientListExport` | [Onboarding](by-topic/onboarding.md) | [L461801](../../../ScriptDB/000_4_CreateSP.sql#L461801) | 2 / 2 file | 0 / 1 | [COnBoarding.cs:1905](../../../OnboardingWebServices/COnBoarding.cs#L1905) |
| `UBOBClientPlanExport` | [Onboarding](by-topic/onboarding.md) | [L461953](../../../ScriptDB/000_4_CreateSP.sql#L461953) | — | 1 / 2 | — |
| `UBOBClientSearchOnboarding` | [Onboarding](by-topic/onboarding.md) | [L462004](../../../ScriptDB/000_4_CreateSP.sql#L462004) | 1 / 1 file | 0 / 1 | [COnBoard.cs:197](../../../UBClasses/COnBoard.cs#L197) |
| `UBOBDefinitionSet` | [Onboarding](by-topic/onboarding.md) | [L462176](../../../ScriptDB/000_4_CreateSP.sql#L462176) | 2 / 2 file | 0 / 0 | [CDefinitions.cs:79](../../../OnboardingWebServices/CDefinitions.cs#L79) |
| `UBOBFundTrxBuy` | [Onboarding](by-topic/onboarding.md) | [L464039](../../../ScriptDB/000_4_CreateSP.sql#L464039) | 2 / 2 file | 0 / 7 | [COnBoardingOrders.cs:464](../../../OnboardingWebServices/COnBoardingOrders.cs#L464) |
| `UBOBFundTrxSell` | [Onboarding](by-topic/onboarding.md) | [L464847](../../../ScriptDB/000_4_CreateSP.sql#L464847) | 2 / 2 file | 0 / 7 | [COnBoardingOrders.cs:551](../../../OnboardingWebServices/COnBoardingOrders.cs#L551) |
| `UBOBFundTrxSwitch` | [Onboarding](by-topic/onboarding.md) | [L465342](../../../ScriptDB/000_4_CreateSP.sql#L465342) | 2 / 2 file | 0 / 5 | [COnBoardingOrders.cs:632](../../../OnboardingWebServices/COnBoardingOrders.cs#L632) |
| `UBOBGetTestOrder` | [Onboarding](by-topic/onboarding.md) | [L465865](../../../ScriptDB/000_4_CreateSP.sql#L465865) | 6 / 2 file | 0 / 0 | [COnBoardingOrders.cs:764](../../../OnboardingWebServices/COnBoardingOrders.cs#L764) |
| `UBOBInitQuestionDefKey` | [Onboarding](by-topic/onboarding.md) | [L465915](../../../ScriptDB/000_4_CreateSP.sql#L465915) | — | 0 / 0 | — |
| `UBOBItemAdd` | [Onboarding](by-topic/onboarding.md) | [L466106](../../../ScriptDB/000_4_CreateSP.sql#L466106) | 3 / 3 file | 0 / 1 | [COnBoarding.cs:112](../../../OnboardingWebServices/COnBoarding.cs#L112) |
| `UBOBItemInfo` | [Onboarding](by-topic/onboarding.md) | [L466150](../../../ScriptDB/000_4_CreateSP.sql#L466150) | 1 / 1 file | 0 / 0 | [COnBoard.cs:150](../../../UBClasses/COnBoard.cs#L150) |
| `UBOBItemList` | [Onboarding](by-topic/onboarding.md) | [L466189](../../../ScriptDB/000_4_CreateSP.sql#L466189) | 1 / 1 file | 0 / 0 | [COnBoard.cs:34](../../../UBClasses/COnBoard.cs#L34) |
| `UBOBItemNotesTranslate` | [Onboarding](by-topic/onboarding.md) | [L466279](../../../ScriptDB/000_4_CreateSP.sql#L466279) | — | 1 / 1 | — |
| `UBOBItemProcessClientInfo` | [Onboarding](by-topic/onboarding.md) | [L466331](../../../ScriptDB/000_4_CreateSP.sql#L466331) | 2 / 2 file | 0 / 4 | [COnBoarding.cs:285](../../../OnboardingWebServices/COnBoarding.cs#L285) |
| `UBOBItemProcessClientInfo_Address` | [Onboarding](by-topic/onboarding.md) | [L466593](../../../ScriptDB/000_4_CreateSP.sql#L466593) | 2 / 2 file | 0 / 1 | [COnBoarding.cs:481](../../../OnboardingWebServices/COnBoarding.cs#L481) |
| `UBOBItemProcessClientInfo_Bank` | [Onboarding](by-topic/onboarding.md) | [L466651](../../../ScriptDB/000_4_CreateSP.sql#L466651) | 1 / 1 file | 0 / 1 | [COnBoarding.cs:1682](../../../VFOnBoarding/COnBoarding.cs#L1682) |
| `UBOBItemProcessClientInfo_Employment` | [Onboarding](by-topic/onboarding.md) | [L466721](../../../ScriptDB/000_4_CreateSP.sql#L466721) | 2 / 2 file | 0 / 4 | [COnBoarding.cs:601](../../../OnboardingWebServices/COnBoarding.cs#L601) |
| `UBOBItemProcessClientInfo_ID` | [Onboarding](by-topic/onboarding.md) | [L466783](../../../ScriptDB/000_4_CreateSP.sql#L466783) | 2 / 2 file | 0 / 3 | [COnBoarding.cs:900](../../../OnboardingWebServices/COnBoarding.cs#L900) |
| `UBOBItemProcessClientInfo_KYC` | [Onboarding](by-topic/onboarding.md) | [L466857](../../../ScriptDB/000_4_CreateSP.sql#L466857) | 2 / 2 file | 0 / 6 | [COnBoarding.cs:782](../../../OnboardingWebServices/COnBoarding.cs#L782) |
| `UBOBItemProcessClientInfo_Phone` | [Onboarding](by-topic/onboarding.md) | [L467084](../../../ScriptDB/000_4_CreateSP.sql#L467084) | 2 / 2 file | 0 / 1 | [COnBoarding.cs:541](../../../OnboardingWebServices/COnBoarding.cs#L541) |
| `UBOBItemProcessClientInfo_Plan` | [Onboarding](by-topic/onboarding.md) | [L467122](../../../ScriptDB/000_4_CreateSP.sql#L467122) | 2 / 2 file | 0 / 7 | [COnBoarding.cs:985](../../../OnboardingWebServices/COnBoarding.cs#L985) |
| `UBOBItemProcessClientInfo_PlanBank` | [Onboarding](by-topic/onboarding.md) | [L467352](../../../ScriptDB/000_4_CreateSP.sql#L467352) | 2 / 2 file | 0 / 1 | [COnBoarding.cs:1529](../../../OnboardingWebServices/COnBoarding.cs#L1529) |
| `UBOBItemProcessClientInfo_PlanBen` | [Onboarding](by-topic/onboarding.md) | [L467422](../../../ScriptDB/000_4_CreateSP.sql#L467422) | 2 / 2 file | 0 / 3 | [COnBoarding.cs:1306](../../../OnboardingWebServices/COnBoarding.cs#L1306) |
| `UBOBItemProcessClientInfo_PlanInTrust` | [Onboarding](by-topic/onboarding.md) | [L467508](../../../ScriptDB/000_4_CreateSP.sql#L467508) | 2 / 2 file | 0 / 3 | [COnBoarding.cs:1228](../../../OnboardingWebServices/COnBoarding.cs#L1228) |
| `UBOBItemProcessClientInfo_PlanJoint` | [Onboarding](by-topic/onboarding.md) | [L467575](../../../ScriptDB/000_4_CreateSP.sql#L467575) | 2 / 2 file | 0 / 0 | [COnBoarding.cs:1176](../../../OnboardingWebServices/COnBoarding.cs#L1176) |
| `UBOBItemProcessClientInfo_PlanKYC` | [Onboarding](by-topic/onboarding.md) | [L467601](../../../ScriptDB/000_4_CreateSP.sql#L467601) | 2 / 2 file | 0 / 4 | [COnBoarding.cs:1065](../../../OnboardingWebServices/COnBoarding.cs#L1065) |
| `UBOBItemProcessClientInfo_PlanQuestion` | [Onboarding](by-topic/onboarding.md) | [L467784](../../../ScriptDB/000_4_CreateSP.sql#L467784) | 2 / 2 file | 0 / 1 | [COnBoarding.cs:1455](../../../OnboardingWebServices/COnBoarding.cs#L1455) |
| `UBOBItemProcessClientInfo_Question` | [Onboarding](by-topic/onboarding.md) | [L467834](../../../ScriptDB/000_4_CreateSP.sql#L467834) | 2 / 2 file | 0 / 1 | [COnBoarding.cs:708](../../../OnboardingWebServices/COnBoarding.cs#L708) |
| `UBOBItemProcessClientInfo_Spouse` | [Onboarding](by-topic/onboarding.md) | [L467891](../../../ScriptDB/000_4_CreateSP.sql#L467891) | 2 / 2 file | 0 / 4 | [COnBoarding.cs:375](../../../OnboardingWebServices/COnBoarding.cs#L375) |
| `UBOBItemProcessClientInfo_TCP` | [Onboarding](by-topic/onboarding.md) | [L468008](../../../ScriptDB/000_4_CreateSP.sql#L468008) | 1 / 1 file | 0 / 5 | [COnBoarding.cs:2416](../../../VFOnBoarding/COnBoarding.cs#L2416) |
| `UBOBItemProcessEnd` | [Onboarding](by-topic/onboarding.md) | [L468168](../../../ScriptDB/000_4_CreateSP.sql#L468168) | 2 / 2 file | 0 / 0 | [COnBoarding.cs:174](../../../OnboardingWebServices/COnBoarding.cs#L174) |
| `UBOBItemProcessFeeSetting` | [Onboarding](by-topic/onboarding.md) | [L468206](../../../ScriptDB/000_4_CreateSP.sql#L468206) | — | 0 / 2 | — |
| `UBOBItemProcessPACSWP` | [Onboarding](by-topic/onboarding.md) | [L468628](../../../ScriptDB/000_4_CreateSP.sql#L468628) | — | 0 / 10 | — |
| `UBOBItemProcessRRIF` | [Onboarding](by-topic/onboarding.md) | [L469288](../../../ScriptDB/000_4_CreateSP.sql#L469288) | — | 0 / 4 | — |
| `UBOBItemReject` | [Onboarding](by-topic/onboarding.md) | [L470184](../../../ScriptDB/000_4_CreateSP.sql#L470184) | — | 0 / 2 | — |
| `UBOBItemRemove` | [Onboarding](by-topic/onboarding.md) | [L470240](../../../ScriptDB/000_4_CreateSP.sql#L470240) | — | 0 / 0 | — |
| `UBOBMasterDashBoard` | [Onboarding](by-topic/onboarding.md) | [L470255](../../../ScriptDB/000_4_CreateSP.sql#L470255) | 2 / 2 file | 0 / 0 | [Dashboard.cs:385](../../../OnboardingWebServices/Dashboard.cs#L385) |
| `UBOBOrderAdd` | [Onboarding](by-topic/onboarding.md) | [L470531](../../../ScriptDB/000_4_CreateSP.sql#L470531) | 6 / 2 file | 0 / 0 | [COnBoardingOrders.cs:233](../../../OnboardingWebServices/COnBoardingOrders.cs#L233) |
| `UBOBOrderProcessEnd` | [Onboarding](by-topic/onboarding.md) | [L470643](../../../ScriptDB/000_4_CreateSP.sql#L470643) | 2 / 2 file | 0 / 0 | [COnBoardingOrders.cs:705](../../../OnboardingWebServices/COnBoardingOrders.cs#L705) |
| `UBOBPlanFeeSettingList` | [Onboarding](by-topic/onboarding.md) | [L470662](../../../ScriptDB/000_4_CreateSP.sql#L470662) | — | 2 / 0 | — |
| `UBOBPlanFeeSettingListByPlanID` | [Onboarding](by-topic/onboarding.md) | [L470763](../../../ScriptDB/000_4_CreateSP.sql#L470763) | 1 / 1 file | 0 / 1 | [CFeeSetting.cs:141](../../../VFOnBoarding/CFeeSetting.cs#L141) |
| `UBOBPlanFundAccountList` | [Onboarding](by-topic/onboarding.md) | [L470799](../../../ScriptDB/000_4_CreateSP.sql#L470799) | 2 / 2 file | 0 / 0 | [COnBoardingOrders.cs:1028](../../../OnboardingWebServices/COnBoardingOrders.cs#L1028) |
| `UBOBPlanInfoExport` | [Onboarding](by-topic/onboarding.md) | [L470876](../../../ScriptDB/000_4_CreateSP.sql#L470876) | 2 / 2 file | 0 / 2 | [ClientDetail.cs:165](../../../OnboardingWebServices/ClientDetail.cs#L165) |
| `UBOBPlanListExport` | [Onboarding](by-topic/onboarding.md) | [L470926](../../../ScriptDB/000_4_CreateSP.sql#L470926) | — | 2 / 3 | — |
| `UBOBPlanMFListSwitchTo` | [Onboarding](by-topic/onboarding.md) | [L471236](../../../ScriptDB/000_4_CreateSP.sql#L471236) | 2 / 2 file | 0 / 0 | [COnBoardingOrders.cs:1117](../../../OnboardingWebServices/COnBoardingOrders.cs#L1117) |
| `UBOBSystematicPlanList` | [Onboarding](by-topic/onboarding.md) | [L471305](../../../ScriptDB/000_4_CreateSP.sql#L471305) | — | 2 / 0 | — |
| `UBOBSystematicPlanListByPlanID` | [Onboarding](by-topic/onboarding.md) | [L471538](../../../ScriptDB/000_4_CreateSP.sql#L471538) | 1 / 1 file | 0 / 1 | [CSysPlan.cs:728](../../../VFOnBoarding/CSysPlan.cs#L728) |
| `UBOccupationList` | [Shared / Other](by-topic/shared-other.md) | [L471573](../../../ScriptDB/000_4_CreateSP.sql#L471573) | 1 / 1 file | 0 / 0 | [Occupation.cs:73](../../../UBClasses/Occupation.cs#L73) |
| `UBOmnibusViewComboList` | [Shared / Other](by-topic/shared-other.md) | [L471680](../../../ScriptDB/000_4_CreateSP.sql#L471680) | — | 0 / 6 | — |
| `UBOnBoardComboList` | [Onboarding](by-topic/onboarding.md) | [L471751](../../../ScriptDB/000_4_CreateSP.sql#L471751) | — | 0 / 1 | — |
| `UBOnBoardingClientQuestionList` | [Onboarding](by-topic/onboarding.md) | [L471766](../../../ScriptDB/000_4_CreateSP.sql#L471766) | 1 / 1 file | 0 / 0 | [COnBoard.cs:337](../../../UBClasses/COnBoard.cs#L337) |
| `UBOnBoardingComboList` | [Onboarding](by-topic/onboarding.md) | [L471810](../../../ScriptDB/000_4_CreateSP.sql#L471810) | — | 0 / 4 | — |
| `UBOnBoardingNotifyRepAdd` | [Onboarding](by-topic/onboarding.md) | [L471837](../../../ScriptDB/000_4_CreateSP.sql#L471837) | — | 0 / 2 | — |
| `UBOnBoardingNotifyRepGetNameEmail` | [Onboarding](by-topic/onboarding.md) | [L472219](../../../ScriptDB/000_4_CreateSP.sql#L472219) | — | 1 / 0 | — |
| `UBOneSpanEnvelopeListOneClient` | [Client & KYC](by-topic/client-kyc.md) | [L472252](../../../ScriptDB/000_4_CreateSP.sql#L472252) | 2 / 2 file | 0 / 0 | [ESignature.cs:333](../../../UBClasses/ESignature.cs#L333) |
| `UBOneSpanEnvelopeRecipientStatusUpdate` | [Shared / Other](by-topic/shared-other.md) | [L472300](../../../ScriptDB/000_4_CreateSP.sql#L472300) | 2 / 2 file | 0 / 0 | [ESignature.cs:654](../../../UBClasses/ESignature.cs#L654) |
| `UBOneSpanEnvelopeSetStatus` | [Shared / Other](by-topic/shared-other.md) | [L472342](../../../ScriptDB/000_4_CreateSP.sql#L472342) | 2 / 2 file | 0 / 0 | [ESignature.cs:432](../../../UBClasses/ESignature.cs#L432) |
| `UBOrderAssignNewSourceID` | [Trading & Orders](by-topic/trading-orders.md) | [L472377](../../../ScriptDB/000_4_CreateSP.sql#L472377) | — | 2 / 1 | — |
| `UBOrderBatchComboList` | [Trading & Orders](by-topic/trading-orders.md) | [L472409](../../../ScriptDB/000_4_CreateSP.sql#L472409) | — | 0 / 6 | — |
| `UBOrderConversionAddTMP` | [Trading & Orders](by-topic/trading-orders.md) | [L472459](../../../ScriptDB/000_4_CreateSP.sql#L472459) | 1 / 1 file | 0 / 0 | [Trx.cs:5580](../../../UBClasses/Trx.cs#L5580) |
| `UBOrderConversionCopyTMP` | [Trading & Orders](by-topic/trading-orders.md) | [L472578](../../../ScriptDB/000_4_CreateSP.sql#L472578) | — | 0 / 0 | — |
| `UBOrderConversionDelete` | [Trading & Orders](by-topic/trading-orders.md) | [L472608](../../../ScriptDB/000_4_CreateSP.sql#L472608) | 1 / 1 file | 0 / 0 | [Trx.cs:5650](../../../UBClasses/Trx.cs#L5650) |
| `UBOrderConversionDeleteTMP` | [Trading & Orders](by-topic/trading-orders.md) | [L472664](../../../ScriptDB/000_4_CreateSP.sql#L472664) | 1 / 1 file | 0 / 0 | [Trx.cs:5702](../../../UBClasses/Trx.cs#L5702) |
| `UBOrderConversionDetail` | [Trading & Orders](by-topic/trading-orders.md) | [L472691](../../../ScriptDB/000_4_CreateSP.sql#L472691) | 1 / 1 file | 0 / 0 | [Trx.cs:5327](../../../UBClasses/Trx.cs#L5327) |
| `UBOrderConversionInfo` | [Trading & Orders](by-topic/trading-orders.md) | [L472793](../../../ScriptDB/000_4_CreateSP.sql#L472793) | 1 / 1 file | 0 / 0 | [Trx.cs:5429](../../../UBClasses/Trx.cs#L5429) |
| `UBOrderConversionInfoTMP` | [Trading & Orders](by-topic/trading-orders.md) | [L472836](../../../ScriptDB/000_4_CreateSP.sql#L472836) | 1 / 1 file | 0 / 0 | [Trx.cs:5477](../../../UBClasses/Trx.cs#L5477) |
| `UBOrderConversionList` | [Trading & Orders](by-topic/trading-orders.md) | [L472880](../../../ScriptDB/000_4_CreateSP.sql#L472880) | 1 / 1 file | 0 / 3 | [Trx.cs:5257](../../../UBClasses/Trx.cs#L5257) |
| `UBOrderConversionListTMP` | [Trading & Orders](by-topic/trading-orders.md) | [L473218](../../../ScriptDB/000_4_CreateSP.sql#L473218) | 1 / 1 file | 0 / 0 | [Trx.cs:5753](../../../UBClasses/Trx.cs#L5753) |
| `UBOrderConversionUpdate` | [Trading & Orders](by-topic/trading-orders.md) | [L473308](../../../ScriptDB/000_4_CreateSP.sql#L473308) | 1 / 1 file | 0 / 0 | [Trx.cs:5522](../../../UBClasses/Trx.cs#L5522) |
| `UBOrderConversionUpdateTMP` | [Trading & Orders](by-topic/trading-orders.md) | [L473402](../../../ScriptDB/000_4_CreateSP.sql#L473402) | 1 / 1 file | 0 / 0 | [Trx.cs:5580](../../../UBClasses/Trx.cs#L5580) |
| `UBOrderCreateFile` | [Trading & Orders](by-topic/trading-orders.md) | [L473439](../../../ScriptDB/000_4_CreateSP.sql#L473439) | 1 / 1 file | 0 / 2 | [COrder.cs:102](../../../UBFFImport/COrder.cs#L102) |
| `UBOrderCreateFileName` | [Trading & Orders](by-topic/trading-orders.md) | [L473603](../../../ScriptDB/000_4_CreateSP.sql#L473603) | — | 1 / 0 | — |
| `UBOrderCreateMSGXML` | [Trading & Orders](by-topic/trading-orders.md) | [L473728](../../../ScriptDB/000_4_CreateSP.sql#L473728) | — | 4 / 3 | — |
| `UBOrderDefaultSet` | [Trading & Orders](by-topic/trading-orders.md) | [L474294](../../../ScriptDB/000_4_CreateSP.sql#L474294) | — | 0 / 0 | — |
| `UBOrderFileUpdateStatus` | [Trading & Orders](by-topic/trading-orders.md) | [L474356](../../../ScriptDB/000_4_CreateSP.sql#L474356) | 1 / 1 file | 0 / 0 | [COrder.cs:137](../../../UBFFImport/COrder.cs#L137) |
| `UBOrderGetMSG` | [Trading & Orders](by-topic/trading-orders.md) | [L474396](../../../ScriptDB/000_4_CreateSP.sql#L474396) | — | 0 / 1 | — |
| `UBOrderHistoryList` | [Trading & Orders](by-topic/trading-orders.md) | [L474633](../../../ScriptDB/000_4_CreateSP.sql#L474633) | 1 / 1 file | 0 / 3 | [Trx.cs:4212](../../../UBClasses/Trx.cs#L4212) |
| `UBOrderPendingList` | [Trading & Orders](by-topic/trading-orders.md) | [L475544](../../../ScriptDB/000_4_CreateSP.sql#L475544) | 1 / 1 file | 0 / 5 | [Trx.cs:3876](../../../UBClasses/Trx.cs#L3876) |
| `UBOrderRealTimeable` | [Trading & Orders](by-topic/trading-orders.md) | [L476307](../../../ScriptDB/000_4_CreateSP.sql#L476307) | — | 0 / 0 | — |
| `UBOrderReceiptBasketSet` | [Trading & Orders](by-topic/trading-orders.md) | [L476339](../../../ScriptDB/000_4_CreateSP.sql#L476339) | 1 / 1 file | 0 / 9 | [OrderReceipt.cs:974](../../../VieFUNDPdf/OrderReceipt.cs#L974) |
| `UBOrderReceiptSet` | [Trading & Orders](by-topic/trading-orders.md) | [L476722](../../../ScriptDB/000_4_CreateSP.sql#L476722) | 1 / 1 file | 0 / 9 | [OrderReceipt.cs:97](../../../VieFUNDPdf/OrderReceipt.cs#L97) |
| `UBOrderSelectionUpdate` | [Trading & Orders](by-topic/trading-orders.md) | [L477285](../../../ScriptDB/000_4_CreateSP.sql#L477285) | — | 0 / 0 | — |
| `UBOrderSelectionUpdateOmnibus` | [Trading & Orders](by-topic/trading-orders.md) | [L477343](../../../ScriptDB/000_4_CreateSP.sql#L477343) | — | 0 / 0 | — |
| `UBOrderSetConfirmOne` | [Trading & Orders](by-topic/trading-orders.md) | [L477378](../../../ScriptDB/000_4_CreateSP.sql#L477378) | — | 1 / 4 | — |
| `UBOrderSetConfirmTaggedItems` | [Trading & Orders](by-topic/trading-orders.md) | [L477516](../../../ScriptDB/000_4_CreateSP.sql#L477516) | — | 0 / 1 | — |
| `UBOrderSetMsgResponse` | [Account & Plan](by-topic/account-plan.md) | [L477632](../../../ScriptDB/000_4_CreateSP.sql#L477632) | 1 / 1 file | 0 / 0 | [FFImport.cs:3860](../../../UBFFImport/FFImport.cs#L3860) |
| `UBOrderSetMsgStatus` | [Trading & Orders](by-topic/trading-orders.md) | [L477686](../../../ScriptDB/000_4_CreateSP.sql#L477686) | — | 0 / 0 | — |
| `UBOrderStatusDetail` | [Trading & Orders](by-topic/trading-orders.md) | [L477754](../../../ScriptDB/000_4_CreateSP.sql#L477754) | — | 0 / 0 | — |
| `UBOrderTodayList` | [Trading & Orders](by-topic/trading-orders.md) | [L477874](../../../ScriptDB/000_4_CreateSP.sql#L477874) | 1 / 1 file | 0 / 1 | [Trx.cs:5802](../../../UBClasses/Trx.cs#L5802) |
| `UBOrderVerifyNetwork` | [Trading & Orders](by-topic/trading-orders.md) | [L477974](../../../ScriptDB/000_4_CreateSP.sql#L477974) | — | 1 / 0 | — |
| `UBOrderWaiting2BBSOrder` | [Trading & Orders](by-topic/trading-orders.md) | [L478008](../../../ScriptDB/000_4_CreateSP.sql#L478008) | — | 0 / 1 | — |
| `UBOrderWaiting2SendAdd` | [Trading & Orders](by-topic/trading-orders.md) | [L478209](../../../ScriptDB/000_4_CreateSP.sql#L478209) | — | 13 / 1 | — |
| `UBOrderWaiting2SendAddInternal` | [Trading & Orders](by-topic/trading-orders.md) | [L478233](../../../ScriptDB/000_4_CreateSP.sql#L478233) | — | 2 / 3 | — |
| `UBOrderWaiting2SendAddOne` | [Trading & Orders](by-topic/trading-orders.md) | [L478451](../../../ScriptDB/000_4_CreateSP.sql#L478451) | — | 5 / 0 | — |
| `UBOrderWaiting2SendReAddPendingToReceive` | [Trading & Orders](by-topic/trading-orders.md) | [L478518](../../../ScriptDB/000_4_CreateSP.sql#L478518) | — | 0 / 1 | — |
| `UBOrderWaitingReset` | [Trading & Orders](by-topic/trading-orders.md) | [L478547](../../../ScriptDB/000_4_CreateSP.sql#L478547) | — | 0 / 0 | — |
| `UBP184XML` | [Tax & Year-End](by-topic/tax-yearend.md) | [L478584](../../../ScriptDB/000_4_CreateSP.sql#L478584) | — | 1 / 1 | — |
| `UBP18AddControllingPersonList` | [Tax & Year-End](by-topic/tax-yearend.md) | [L478730](../../../ScriptDB/000_4_CreateSP.sql#L478730) | — | 1 / 0 | — |
| `UBP18Approve2Pending` | [Tax & Year-End](by-topic/tax-yearend.md) | [L478816](../../../ScriptDB/000_4_CreateSP.sql#L478816) | — | 0 / 0 | — |
| `UBP18ApprovedList` | [Tax & Year-End](by-topic/tax-yearend.md) | [L478869](../../../ScriptDB/000_4_CreateSP.sql#L478869) | — | 0 / 1 | — |
| `UBP18ApprovedSelectionUpdate` | [Tax & Year-End](by-topic/tax-yearend.md) | [L479171](../../../ScriptDB/000_4_CreateSP.sql#L479171) | — | 0 / 0 | — |
| `UBP18CancelItem` | [Tax & Year-End](by-topic/tax-yearend.md) | [L479207](../../../ScriptDB/000_4_CreateSP.sql#L479207) | — | 0 / 0 | — |
| `UBP18FileDetailList` | [Tax & Year-End](by-topic/tax-yearend.md) | [L479285](../../../ScriptDB/000_4_CreateSP.sql#L479285) | — | 0 / 0 | — |
| `UBP18FileList` | [Tax & Year-End](by-topic/tax-yearend.md) | [L479346](../../../ScriptDB/000_4_CreateSP.sql#L479346) | — | 0 / 1 | — |
| `UBP18PendingList` | [Tax & Year-End](by-topic/tax-yearend.md) | [L479360](../../../ScriptDB/000_4_CreateSP.sql#L479360) | — | 0 / 1 | — |
| `UBP18PendingSelectionUpdate` | [Tax & Year-End](by-topic/tax-yearend.md) | [L479687](../../../ScriptDB/000_4_CreateSP.sql#L479687) | — | 0 / 0 | — |
| `UBP18ProcessOneItem` | [Tax & Year-End](by-topic/tax-yearend.md) | [L479723](../../../ScriptDB/000_4_CreateSP.sql#L479723) | — | 1 / 1 | — |
| `UBP18ProcessPendingTaggedItems` | [Tax & Year-End](by-topic/tax-yearend.md) | [L480005](../../../ScriptDB/000_4_CreateSP.sql#L480005) | — | 0 / 1 | — |
| `UBP18RestoreSubmitted` | [Tax & Year-End](by-topic/tax-yearend.md) | [L480044](../../../ScriptDB/000_4_CreateSP.sql#L480044) | — | 0 / 0 | — |
| `UBP194XML` | [Tax & Year-End](by-topic/tax-yearend.md) | [L480079](../../../ScriptDB/000_4_CreateSP.sql#L480079) | — | 1 / 1 | — |
| `UBP19AddControllingPersonList` | [Tax & Year-End](by-topic/tax-yearend.md) | [L480236](../../../ScriptDB/000_4_CreateSP.sql#L480236) | — | 1 / 0 | — |
| `UBP19Approve2Pending` | [Tax & Year-End](by-topic/tax-yearend.md) | [L480332](../../../ScriptDB/000_4_CreateSP.sql#L480332) | — | 0 / 0 | — |
| `UBP19ApprovedList` | [Tax & Year-End](by-topic/tax-yearend.md) | [L480385](../../../ScriptDB/000_4_CreateSP.sql#L480385) | — | 0 / 1 | — |
| `UBP19ApprovedSelectionUpdate` | [Tax & Year-End](by-topic/tax-yearend.md) | [L480691](../../../ScriptDB/000_4_CreateSP.sql#L480691) | — | 0 / 0 | — |
| `UBP19CancelItem` | [Tax & Year-End](by-topic/tax-yearend.md) | [L480727](../../../ScriptDB/000_4_CreateSP.sql#L480727) | — | 0 / 0 | — |
| `UBP19FileDetailList` | [Tax & Year-End](by-topic/tax-yearend.md) | [L480805](../../../ScriptDB/000_4_CreateSP.sql#L480805) | — | 0 / 0 | — |
| `UBP19FileList` | [Tax & Year-End](by-topic/tax-yearend.md) | [L480867](../../../ScriptDB/000_4_CreateSP.sql#L480867) | — | 0 / 1 | — |
| `UBP19PendingList` | [Tax & Year-End](by-topic/tax-yearend.md) | [L480881](../../../ScriptDB/000_4_CreateSP.sql#L480881) | — | 0 / 1 | — |
| `UBP19PendingSelectionUpdate` | [Tax & Year-End](by-topic/tax-yearend.md) | [L481212](../../../ScriptDB/000_4_CreateSP.sql#L481212) | — | 0 / 0 | — |
| `UBP19ProcessOneItem` | [Tax & Year-End](by-topic/tax-yearend.md) | [L481248](../../../ScriptDB/000_4_CreateSP.sql#L481248) | — | 1 / 1 | — |
| `UBP19ProcessPendingTaggedItems` | [Tax & Year-End](by-topic/tax-yearend.md) | [L481548](../../../ScriptDB/000_4_CreateSP.sql#L481548) | — | 0 / 1 | — |
| `UBP19RestoreSubmitted` | [Tax & Year-End](by-topic/tax-yearend.md) | [L481586](../../../ScriptDB/000_4_CreateSP.sql#L481586) | — | 0 / 0 | — |
| `UBPageSizeList` | [Shared / Other](by-topic/shared-other.md) | [L481621](../../../ScriptDB/000_4_CreateSP.sql#L481621) | — | 49 / 0 | — |
| `UBPayeeList` | [Shared / Other](by-topic/shared-other.md) | [L481649](../../../ScriptDB/000_4_CreateSP.sql#L481649) | 1 / 1 file | 0 / 1 | [Advisor.cs:177](../../../UBClasses/Advisor.cs#L177) |
| `UBPendingConversionBulkBasketDetails` | [Trading & Orders](by-topic/trading-orders.md) | [L481736](../../../ScriptDB/000_4_CreateSP.sql#L481736) | 1 / 1 file | 0 / 0 | [BulkSwitchBasket.cs:1634](../../../UBClasses/BulkSwitchBasket.cs#L1634) |
| `UBPerformanceOnePlan` | [Account & Plan](by-topic/account-plan.md) | [L481753](../../../ScriptDB/000_4_CreateSP.sql#L481753) | — | 1 / 5 | — |
| `UBPersonInfo` | [Shared / Other](by-topic/shared-other.md) | [L483148](../../../ScriptDB/000_4_CreateSP.sql#L483148) | — | 0 / 0 | — |
| `UBPersonList` | [Shared / Other](by-topic/shared-other.md) | [L483186](../../../ScriptDB/000_4_CreateSP.sql#L483186) | 1 / 1 file | 1 / 0 | [Customer.cs:5721](../../../UBClasses/Customer.cs#L5721) |
| `UBPersonRemove` | [Shared / Other](by-topic/shared-other.md) | [L483290](../../../ScriptDB/000_4_CreateSP.sql#L483290) | 1 / 1 file | 0 / 1 | [Customer.cs:5862](../../../UBClasses/Customer.cs#L5862) |
| `UBPersonUpdate` | [Shared / Other](by-topic/shared-other.md) | [L483346](../../../ScriptDB/000_4_CreateSP.sql#L483346) | 1 / 1 file | 0 / 6 | [Customer.cs:5783](../../../UBClasses/Customer.cs#L5783) |
| `UBPhoneAdd` | [Shared / Other](by-topic/shared-other.md) | [L483529](../../../ScriptDB/000_4_CreateSP.sql#L483529) | — | 73 / 1 | — |
| `UBPhoneDuplicate` | [Shared / Other](by-topic/shared-other.md) | [L483598](../../../ScriptDB/000_4_CreateSP.sql#L483598) | — | 3 / 0 | — |
| `UBPhoneGet` | [Shared / Other](by-topic/shared-other.md) | [L483644](../../../ScriptDB/000_4_CreateSP.sql#L483644) | — | 11 / 0 | — |
| `UBPhoneUpdate` | [Shared / Other](by-topic/shared-other.md) | [L483699](../../../ScriptDB/000_4_CreateSP.sql#L483699) | — | 34 / 1 | — |
| `UBPlanAARemove` | [Account & Plan](by-topic/account-plan.md) | [L483789](../../../ScriptDB/000_4_CreateSP.sql#L483789) | — | 0 / 0 | — |
| `UBPlanAAUpdate` | [Account & Plan](by-topic/account-plan.md) | [L483818](../../../ScriptDB/000_4_CreateSP.sql#L483818) | — | 6 / 0 | — |
| `UBPlanAccList` | [Account & Plan](by-topic/account-plan.md) | [L483865](../../../ScriptDB/000_4_CreateSP.sql#L483865) | 1 / 1 file | 0 / 1 | [FundAccount.cs:180](../../../UBClasses/FundAccount.cs#L180) |
| `UBPlanAccountList` | [Account & Plan](by-topic/account-plan.md) | [L483940](../../../ScriptDB/000_4_CreateSP.sql#L483940) | 1 / 1 file | 1 / 3 | [Plan.cs:3266](../../../UBClasses/Plan.cs#L3266) |
| `UBPlanAccountListX` | [Account & Plan](by-topic/account-plan.md) | [L483967](../../../ScriptDB/000_4_CreateSP.sql#L483967) | — | 0 / 0 | — |
| `UBPlanActivate` | [Account & Plan](by-topic/account-plan.md) | [L484125](../../../ScriptDB/000_4_CreateSP.sql#L484125) | — | 0 / 5 | — |
| `UBPlanAdd` | [Account & Plan](by-topic/account-plan.md) | [L484219](../../../ScriptDB/000_4_CreateSP.sql#L484219) | 1 / 1 file | 0 / 23 | [Plan.cs:938](../../../UBClasses/Plan.cs#L938) |
| `UBPlanAnnuitantOwnerUpdate` | [Account & Plan](by-topic/account-plan.md) | [L484943](../../../ScriptDB/000_4_CreateSP.sql#L484943) | 1 / 1 file | 0 / 0 | [Plan.cs:3049](../../../UBClasses/Plan.cs#L3049) |
| `UBPlanApprovalStatusHistorySave` | [Account & Plan](by-topic/account-plan.md) | [L484970](../../../ScriptDB/000_4_CreateSP.sql#L484970) | — | 2 / 0 | — |
| `UBPlanAssetAllocationList` | [Account & Plan](by-topic/account-plan.md) | [L485069](../../../ScriptDB/000_4_CreateSP.sql#L485069) | — | 1 / 0 | — |
| `UBPlanAssetAndRiskAdditionClear` | [Account & Plan](by-topic/account-plan.md) | [L485280](../../../ScriptDB/000_4_CreateSP.sql#L485280) | 1 / 1 file | 0 / 0 | [Plan.cs:5340](../../../UBClasses/Plan.cs#L5340) |
| `UBPlanAssetAndRiskAdditionUpdate` | [Account & Plan](by-topic/account-plan.md) | [L485298](../../../ScriptDB/000_4_CreateSP.sql#L485298) | 1 / 1 file | 0 / 0 | [Plan.cs:5295](../../../UBClasses/Plan.cs#L5295) |
| `UBPlanAssetAndRiskAssessmentSet` | [Account & Plan](by-topic/account-plan.md) | [L485369](../../../ScriptDB/000_4_CreateSP.sql#L485369) | 2 / 2 file | 0 / 3 | [Plan.cs:5242](../../../UBClasses/Plan.cs#L5242) |
| `UBPlanAssetAndRiskListCurrent` | [Account & Plan](by-topic/account-plan.md) | [L486351](../../../ScriptDB/000_4_CreateSP.sql#L486351) | — | 4 / 0 | — |
| `UBPlanAvailableCashInfo` | [Account & Plan](by-topic/account-plan.md) | [L487239](../../../ScriptDB/000_4_CreateSP.sql#L487239) | 1 / 1 file | 0 / 0 | [CashAccount.cs:38](../../../UBClasses/CashAccount.cs#L38) |
| `UBPlanAvailableCashInfo4GIC` | [Fund & GIC](by-topic/fund-gic.md) | [L487276](../../../ScriptDB/000_4_CreateSP.sql#L487276) | 1 / 1 file | 0 / 0 | [CashAccount.cs:86](../../../UBClasses/CashAccount.cs#L86) |
| `UBPlanBankListDropdown` | [Account & Plan](by-topic/account-plan.md) | [L487314](../../../ScriptDB/000_4_CreateSP.sql#L487314) | — | 5 / 0 | — |
| `UBPlanBenConAdd` | [Account & Plan](by-topic/account-plan.md) | [L487375](../../../ScriptDB/000_4_CreateSP.sql#L487375) | — | 0 / 4 | — |
| `UBPlanBenConInfo` | [Account & Plan](by-topic/account-plan.md) | [L487463](../../../ScriptDB/000_4_CreateSP.sql#L487463) | 2 / 2 file | 0 / 0 | [PanelPlanBenAdd.aspx.cs:1342](../../../WebApp/Main/PanelPlanBenAdd.aspx.cs#L1342) |
| `UBPlanBenConList` | [Account & Plan](by-topic/account-plan.md) | [L487504](../../../ScriptDB/000_4_CreateSP.sql#L487504) | 1 / 1 file | 0 / 0 | [Plan.cs:619](../../../UBClasses/Plan.cs#L619) |
| `UBPlanBenConRemove` | [Account & Plan](by-topic/account-plan.md) | [L487541](../../../ScriptDB/000_4_CreateSP.sql#L487541) | — | 0 / 0 | — |
| `UBPlanBenConUpdate` | [Account & Plan](by-topic/account-plan.md) | [L487568](../../../ScriptDB/000_4_CreateSP.sql#L487568) | — | 0 / 7 | — |
| `UBPlanBenListByRecordType` | [Account & Plan](by-topic/account-plan.md) | [L487665](../../../ScriptDB/000_4_CreateSP.sql#L487665) | 1 / 1 file | 0 / 0 | [Plan.cs:4864](../../../UBClasses/Plan.cs#L4864) |
| `UBPlanBenPrimaryCaregiverList` | [Account & Plan](by-topic/account-plan.md) | [L487694](../../../ScriptDB/000_4_CreateSP.sql#L487694) | — | 0 / 0 | — |
| `UBPlanBenTMPEnd` | [Account & Plan](by-topic/account-plan.md) | [L487709](../../../ScriptDB/000_4_CreateSP.sql#L487709) | — | 1 / 0 | — |
| `UBPlanCannexOrderCheckPermission` | [Account & Plan](by-topic/account-plan.md) | [L487735](../../../ScriptDB/000_4_CreateSP.sql#L487735) | 1 / 1 file | 0 / 0 | [Plan.cs:4970](../../../UBClasses/Plan.cs#L4970) |
| `UBPlanCheckFundCurrency` | [Fund & GIC](by-topic/fund-gic.md) | [L487752](../../../ScriptDB/000_4_CreateSP.sql#L487752) | — | 0 / 0 | — |
| `UBPlanClientList` | [Account & Plan](by-topic/account-plan.md) | [L487795](../../../ScriptDB/000_4_CreateSP.sql#L487795) | 1 / 1 file | 0 / 0 | [Plan.cs:2243](../../../UBClasses/Plan.cs#L2243) |
| `UBPlanCopy` | [Account & Plan](by-topic/account-plan.md) | [L487859](../../../ScriptDB/000_4_CreateSP.sql#L487859) | — | 2 / 0 | — |
| `UBPlanCopyRRIF` | [Account & Plan](by-topic/account-plan.md) | [L488021](../../../ScriptDB/000_4_CreateSP.sql#L488021) | — | 1 / 0 | — |
| `UBPlanCount4T3GR` | [Account & Plan](by-topic/account-plan.md) | [L488080](../../../ScriptDB/000_4_CreateSP.sql#L488080) | — | 0 / 1 | — |
| `UBPlanDefVal4Add` | [Account & Plan](by-topic/account-plan.md) | [L488225](../../../ScriptDB/000_4_CreateSP.sql#L488225) | 1 / 1 file | 0 / 0 | [Plan.cs:2621](../../../UBClasses/Plan.cs#L2621) |
| `UBPlanDelete` | [Account & Plan](by-topic/account-plan.md) | [L488265](../../../ScriptDB/000_4_CreateSP.sql#L488265) | 1 / 1 file | 1 / 1 | [Plan.cs:1057](../../../UBClasses/Plan.cs#L1057) |
| `UBPlanDesignationList` | [Account & Plan](by-topic/account-plan.md) | [L488336](../../../ScriptDB/000_4_CreateSP.sql#L488336) | — | 19 / 0 | — |
| `UBPlanDuplicate` | [Account & Plan](by-topic/account-plan.md) | [L488385](../../../ScriptDB/000_4_CreateSP.sql#L488385) | — | 1 / 3 | — |
| `UBPlanEditComboList` | [Account & Plan](by-topic/account-plan.md) | [L488449](../../../ScriptDB/000_4_CreateSP.sql#L488449) | — | 0 / 27 | — |
| `UBPlanEditComboList1` | [Account & Plan](by-topic/account-plan.md) | [L488532](../../../ScriptDB/000_4_CreateSP.sql#L488532) | — | 0 / 2 | — |
| `UBPlanEditComboList2` | [Account & Plan](by-topic/account-plan.md) | [L488563](../../../ScriptDB/000_4_CreateSP.sql#L488563) | — | 0 / 1 | — |
| `UBPlanFeeList` | [Commission & Fee](by-topic/commission-fee.md) | [L488588](../../../ScriptDB/000_4_CreateSP.sql#L488588) | 1 / 1 file | 0 / 0 | [Fee.cs:1363](../../../UBClasses/Fee.cs#L1363) |
| `UBPlanFeeListSet` | [Commission & Fee](by-topic/commission-fee.md) | [L488649](../../../ScriptDB/000_4_CreateSP.sql#L488649) | 1 / 1 file | 0 / 2 | [Fee.cs:2490](../../../UBClasses/Fee.cs#L2490) |
| `UBPlanFeePmtTypeList` | [Commission & Fee](by-topic/commission-fee.md) | [L488940](../../../ScriptDB/000_4_CreateSP.sql#L488940) | — | 4 / 0 | — |
| `UBPlanFeeSaveARC` | [Commission & Fee](by-topic/commission-fee.md) | [L488970](../../../ScriptDB/000_4_CreateSP.sql#L488970) | — | 0 / 0 | — |
| `UBPlanFeeSettingAdd` | [Commission & Fee](by-topic/commission-fee.md) | [L489042](../../../ScriptDB/000_4_CreateSP.sql#L489042) | 1 / 1 file | 1 / 2 | [Fee.cs:1146](../../../UBClasses/Fee.cs#L1146) |
| `UBPlanFeeSettingInfo` | [Commission & Fee](by-topic/commission-fee.md) | [L489329](../../../ScriptDB/000_4_CreateSP.sql#L489329) | 1 / 1 file | 0 / 2 | [Fee.cs:1453](../../../UBClasses/Fee.cs#L1453) |
| `UBPlanFeeSettingUpdate` | [Commission & Fee](by-topic/commission-fee.md) | [L489476](../../../ScriptDB/000_4_CreateSP.sql#L489476) | 1 / 1 file | 0 / 0 | [Fee.cs:1275](../../../UBClasses/Fee.cs#L1275) |
| `UBPlanFeeTemplateList` | [Commission & Fee](by-topic/commission-fee.md) | [L489748](../../../ScriptDB/000_4_CreateSP.sql#L489748) | — | 1 / 0 | — |
| `UBPlanFinInfoAddTBD` | [Account & Plan](by-topic/account-plan.md) | [L489772](../../../ScriptDB/000_4_CreateSP.sql#L489772) | — | 0 / 1 | — |
| `UBPlanFreezeExpiredKYC` | [Account & Plan](by-topic/account-plan.md) | [L489814](../../../ScriptDB/000_4_CreateSP.sql#L489814) | — | 0 / 1 | — |
| `UBPlanFreezeOne` | [Account & Plan](by-topic/account-plan.md) | [L489909](../../../ScriptDB/000_4_CreateSP.sql#L489909) | — | 14 / 3 | — |
| `UBPlanFundAccountList` | [Fundserv & Import](by-topic/fundserv-import.md) | [L489962](../../../ScriptDB/000_4_CreateSP.sql#L489962) | 1 / 1 file | 0 / 0 | [FundAccount.cs:3202](../../../UBClasses/FundAccount.cs#L3202) |
| `UBPlanFundList` | [Fundserv & Import](by-topic/fundserv-import.md) | [L490066](../../../ScriptDB/000_4_CreateSP.sql#L490066) | 1 / 1 file | 0 / 2 | [Plan.cs:2991](../../../UBClasses/Plan.cs#L2991) |
| `UBPlanGICList` | [Fund & GIC](by-topic/fund-gic.md) | [L490282](../../../ScriptDB/000_4_CreateSP.sql#L490282) | 2 / 1 file | 1 / 0 | [Customer.cs:3049](../../../UBClasses/Customer.cs#L3049) |
| `UBPlanGICListShort` | [Fund & GIC](by-topic/fund-gic.md) | [L490488](../../../ScriptDB/000_4_CreateSP.sql#L490488) | 1 / 1 file | 0 / 0 | [TermDeposit.cs:1277](../../../UBClasses/TermDeposit.cs#L1277) |
| `UBPlanGroupList` | [Account & Plan](by-topic/account-plan.md) | [L490561](../../../ScriptDB/000_4_CreateSP.sql#L490561) | — | 1 / 0 | — |
| `UBPlanInActivate` | [Account & Plan](by-topic/account-plan.md) | [L490591](../../../ScriptDB/000_4_CreateSP.sql#L490591) | — | 1 / 6 | — |
| `UBPlanIncomeCalcAll` | [Account & Plan](by-topic/account-plan.md) | [L490663](../../../ScriptDB/000_4_CreateSP.sql#L490663) | — | 0 / 1 | — |
| `UBPlanInfo` | [Account & Plan](by-topic/account-plan.md) | [L490727](../../../ScriptDB/000_4_CreateSP.sql#L490727) | 1 / 1 file | 0 / 17 | [Customer.cs:1187](../../../UBClasses/Customer.cs#L1187) |
| `UBPlanInfo2` | [Account & Plan](by-topic/account-plan.md) | [L490957](../../../ScriptDB/000_4_CreateSP.sql#L490957) | 2 / 1 file | 0 / 0 | [Plan.cs:1397](../../../UBClasses/Plan.cs#L1397) |
| `UBPlanInfo2IDs` | [Account & Plan](by-topic/account-plan.md) | [L491015](../../../ScriptDB/000_4_CreateSP.sql#L491015) | 1 / 1 file | 0 / 0 | [Plan.cs:1449](../../../UBClasses/Plan.cs#L1449) |
| `UBPlanInfo3rdParty` | [Account & Plan](by-topic/account-plan.md) | [L491055](../../../ScriptDB/000_4_CreateSP.sql#L491055) | 1 / 1 file | 0 / 0 | [Plan.cs:388](../../../UBClasses/Plan.cs#L388) |
| `UBPlanInfo3rdPartyList` | [Account & Plan](by-topic/account-plan.md) | [L491146](../../../ScriptDB/000_4_CreateSP.sql#L491146) | — | 1 / 0 | — |
| `UBPlanInfo4Header` | [Account & Plan](by-topic/account-plan.md) | [L491181](../../../ScriptDB/000_4_CreateSP.sql#L491181) | 1 / 1 file | 0 / 0 | [Plan.cs:215](../../../UBClasses/Plan.cs#L215) |
| `UBPlanInfoBank` | [Account & Plan](by-topic/account-plan.md) | [L491217](../../../ScriptDB/000_4_CreateSP.sql#L491217) | 2 / 2 file | 1 / 1 | [BankAccount.cs:1347](../../../UBClasses/BankAccount.cs#L1347) |
| `UBPlanInfoBankList` | [Account & Plan](by-topic/account-plan.md) | [L491342](../../../ScriptDB/000_4_CreateSP.sql#L491342) | 3 / 1 file | 0 / 0 | [BankAccount.cs:1063](../../../UBClasses/BankAccount.cs#L1063) |
| `UBPlanInfoBankListTMP` | [Account & Plan](by-topic/account-plan.md) | [L491432](../../../ScriptDB/000_4_CreateSP.sql#L491432) | — | 0 / 0 | — |
| `UBPlanInfoBankTMP` | [Account & Plan](by-topic/account-plan.md) | [L491501](../../../ScriptDB/000_4_CreateSP.sql#L491501) | 1 / 1 file | 0 / 0 | [PanelPlanBankAdd.aspx.cs:66](../../../WebApp/Main/PanelPlanBankAdd.aspx.cs#L66) |
| `UBPlanInfoBen` | [Account & Plan](by-topic/account-plan.md) | [L491543](../../../ScriptDB/000_4_CreateSP.sql#L491543) | — | 0 / 0 | — |
| `UBPlanInfoBenEdit` | [Account & Plan](by-topic/account-plan.md) | [L491618](../../../ScriptDB/000_4_CreateSP.sql#L491618) | 2 / 2 file | 0 / 0 | [PanelPlanBenAdd.aspx.cs:94](../../../WebApp/Main/PanelPlanBenAdd.aspx.cs#L94) |
| `UBPlanInfoBenList` | [Account & Plan](by-topic/account-plan.md) | [L491694](../../../ScriptDB/000_4_CreateSP.sql#L491694) | 2 / 1 file | 1 / 0 | [Plan.cs:546](../../../UBClasses/Plan.cs#L546) |
| `UBPlanInfoBenListShort` | [Account & Plan](by-topic/account-plan.md) | [L491781](../../../ScriptDB/000_4_CreateSP.sql#L491781) | — | 0 / 0 | — |
| `UBPlanInfoCompliance` | [Compliance](by-topic/compliance.md) | [L491802](../../../ScriptDB/000_4_CreateSP.sql#L491802) | — | 4 / 0 | — |
| `UBPlanInfoExtra` | [Account & Plan](by-topic/account-plan.md) | [L491834](../../../ScriptDB/000_4_CreateSP.sql#L491834) | — | 2 / 0 | — |
| `UBPlanInfoInvestment` | [Account & Plan](by-topic/account-plan.md) | [L491899](../../../ScriptDB/000_4_CreateSP.sql#L491899) | — | 2 / 0 | — |
| `UBPlanInfoInvestmentAdd` | [Account & Plan](by-topic/account-plan.md) | [L492046](../../../ScriptDB/000_4_CreateSP.sql#L492046) | — | 2 / 5 | — |
| `UBPlanInfoInvestmentAddTMP` | [Account & Plan](by-topic/account-plan.md) | [L492311](../../../ScriptDB/000_4_CreateSP.sql#L492311) | — | 0 / 0 | — |
| `UBPlanInfoInvestmentAuditTrailCheck` | [Account & Plan](by-topic/account-plan.md) | [L492467](../../../ScriptDB/000_4_CreateSP.sql#L492467) | — | 1 / 1 | — |
| `UBPlanInfoInvestmentTMP` | [Account & Plan](by-topic/account-plan.md) | [L492502](../../../ScriptDB/000_4_CreateSP.sql#L492502) | — | 0 / 0 | — |
| `UBPlanInfoJoint` | [Account & Plan](by-topic/account-plan.md) | [L492533](../../../ScriptDB/000_4_CreateSP.sql#L492533) | — | 2 / 0 | — |
| `UBPlanInfoJointList` | [Account & Plan](by-topic/account-plan.md) | [L492641](../../../ScriptDB/000_4_CreateSP.sql#L492641) | 1 / 1 file | 0 / 0 | [Plan.cs:828](../../../UBClasses/Plan.cs#L828) |
| `UBPlanInfoQuestionair` | [Account & Plan](by-topic/account-plan.md) | [L492684](../../../ScriptDB/000_4_CreateSP.sql#L492684) | 1 / 1 file | 2 / 0 | [Questionair.cs:256](../../../UBClasses/Questionair.cs#L256) |
| `UBPlanInfoQuestionairAdd` | [Account & Plan](by-topic/account-plan.md) | [L492762](../../../ScriptDB/000_4_CreateSP.sql#L492762) | — | 2 / 1 | — |
| `UBPlanInfoQuestionairAddTMP` | [Account & Plan](by-topic/account-plan.md) | [L492841](../../../ScriptDB/000_4_CreateSP.sql#L492841) | — | 0 / 0 | — |
| `UBPlanInfoSpousal` | [Account & Plan](by-topic/account-plan.md) | [L492931](../../../ScriptDB/000_4_CreateSP.sql#L492931) | — | 4 / 0 | — |
| `UBPlanInfoThirdPartyEdit` | [Account & Plan](by-topic/account-plan.md) | [L492986](../../../ScriptDB/000_4_CreateSP.sql#L492986) | 1 / 1 file | 0 / 0 | [PanelPlan3rdPartyAdd.aspx.cs:67](../../../WebApp/Main/PanelPlan3rdPartyAdd.aspx.cs#L67) |
| `UBPlanInfoTransferFrom` | [Account & Plan](by-topic/account-plan.md) | [L493039](../../../ScriptDB/000_4_CreateSP.sql#L493039) | 1 / 1 file | 0 / 0 | [Plan.cs:1326](../../../UBClasses/Plan.cs#L1326) |
| `UBPlanInfoTrust` | [Account & Plan](by-topic/account-plan.md) | [L493099](../../../ScriptDB/000_4_CreateSP.sql#L493099) | — | 1 / 0 | — |
| `UBPlanInfoTrustEdit` | [Account & Plan](by-topic/account-plan.md) | [L493132](../../../ScriptDB/000_4_CreateSP.sql#L493132) | 2 / 2 file | 0 / 1 | [ClientInTrust.aspx.cs:107](../../../WebApp/Main/ClientInTrust.aspx.cs#L107) |
| `UBPlanInfoTrustList` | [Account & Plan](by-topic/account-plan.md) | [L493180](../../../ScriptDB/000_4_CreateSP.sql#L493180) | 2 / 1 file | 0 / 0 | [Plan.cs:159](../../../UBClasses/Plan.cs#L159) |
| `UBPlanInfoTrustTMP` | [Account & Plan](by-topic/account-plan.md) | [L493256](../../../ScriptDB/000_4_CreateSP.sql#L493256) | — | 0 / 0 | — |
| `UBPlanInfoType` | [Account & Plan](by-topic/account-plan.md) | [L493290](../../../ScriptDB/000_4_CreateSP.sql#L493290) | 1 / 1 file | 0 / 0 | [Plan.cs:108](../../../UBClasses/Plan.cs#L108) |
| `UBPlanInfoUD` | [Account & Plan](by-topic/account-plan.md) | [L493331](../../../ScriptDB/000_4_CreateSP.sql#L493331) | 1 / 1 file | 1 / 0 | [UserDefinedField.cs:125](../../../UBClasses/UserDefinedField.cs#L125) |
| `UBPlanInfoUDAdd` | [Account & Plan](by-topic/account-plan.md) | [L493386](../../../ScriptDB/000_4_CreateSP.sql#L493386) | — | 2 / 1 | — |
| `UBPlanInfoUDAddTMP` | [Account & Plan](by-topic/account-plan.md) | [L493468](../../../ScriptDB/000_4_CreateSP.sql#L493468) | — | 0 / 0 | — |
| `UBPlanInTrustAdd` | [Account & Plan](by-topic/account-plan.md) | [L493530](../../../ScriptDB/000_4_CreateSP.sql#L493530) | — | 3 / 2 | — |
| `UBPlanInTrustTMPEnd` | [Account & Plan](by-topic/account-plan.md) | [L493577](../../../ScriptDB/000_4_CreateSP.sql#L493577) | — | 1 / 0 | — |
| `UBPlanInvestInfoTMPEnd` | [Account & Plan](by-topic/account-plan.md) | [L493606](../../../ScriptDB/000_4_CreateSP.sql#L493606) | — | 1 / 0 | — |
| `UBPlanJointSignatureList` | [Account & Plan](by-topic/account-plan.md) | [L493635](../../../ScriptDB/000_4_CreateSP.sql#L493635) | — | 1 / 0 | — |
| `UBPlanJointSwapRole` | [Account & Plan](by-topic/account-plan.md) | [L493665](../../../ScriptDB/000_4_CreateSP.sql#L493665) | 1 / 1 file | 0 / 1 | [Plan.cs:4144](../../../UBClasses/Plan.cs#L4144) |
| `UBPlanJointTypeList` | [Account & Plan](by-topic/account-plan.md) | [L493726](../../../ScriptDB/000_4_CreateSP.sql#L493726) | — | 1 / 0 | — |
| `UBPlanKYCUpdateAdd` | [Account & Plan](by-topic/account-plan.md) | [L493756](../../../ScriptDB/000_4_CreateSP.sql#L493756) | — | 1 / 0 | — |
| `UBPlanKYCX` | [Account & Plan](by-topic/account-plan.md) | [L493916](../../../ScriptDB/000_4_CreateSP.sql#L493916) | — | 0 / 1 | — |
| `UBPlanListTransferFrom` | [Account & Plan](by-topic/account-plan.md) | [L494179](../../../ScriptDB/000_4_CreateSP.sql#L494179) | 1 / 1 file | 0 / 0 | [Plan.cs:1243](../../../UBClasses/Plan.cs#L1243) |
| `UBPlanMergeComm4Int` | [Commission & Fee](by-topic/commission-fee.md) | [L494298](../../../ScriptDB/000_4_CreateSP.sql#L494298) | — | 1 / 0 | — |
| `UBPlanMergeComm4IntAgora` | [Commission & Fee](by-topic/commission-fee.md) | [L494338](../../../ScriptDB/000_4_CreateSP.sql#L494338) | — | 0 / 1 | — |
| `UBPlanMFList` | [Account & Plan](by-topic/account-plan.md) | [L494372](../../../ScriptDB/000_4_CreateSP.sql#L494372) | 2 / 2 file | 0 / 0 | [Customer.cs:1248](../../../UBClasses/Customer.cs#L1248) |
| `UBPlanMFList2` | [Account & Plan](by-topic/account-plan.md) | [L494539](../../../ScriptDB/000_4_CreateSP.sql#L494539) | — | 1 / 0 | — |
| `UBPlanMFList4PYMT` | [Account & Plan](by-topic/account-plan.md) | [L494587](../../../ScriptDB/000_4_CreateSP.sql#L494587) | — | 1 / 0 | — |
| `UBPlanMFListSwitchFrom` | [Account & Plan](by-topic/account-plan.md) | [L494642](../../../ScriptDB/000_4_CreateSP.sql#L494642) | — | 0 / 0 | — |
| `UBPlanMFListSwitchTo` | [Account & Plan](by-topic/account-plan.md) | [L494707](../../../ScriptDB/000_4_CreateSP.sql#L494707) | 1 / 1 file | 0 / 0 | [FundAccount.cs:528](../../../UBClasses/FundAccount.cs#L528) |
| `UBPlanMKV4FeeM` | [Commission & Fee](by-topic/commission-fee.md) | [L494777](../../../ScriptDB/000_4_CreateSP.sql#L494777) | — | 2 / 1 | — |
| `UBPlanMKV4FeeM_FromTable` | [Commission & Fee](by-topic/commission-fee.md) | [L494888](../../../ScriptDB/000_4_CreateSP.sql#L494888) | — | 1 / 1 | — |
| `UBPlanMKV4FeeM_Special` | [Commission & Fee](by-topic/commission-fee.md) | [L494959](../../../ScriptDB/000_4_CreateSP.sql#L494959) | — | 1 / 1 | — |
| `UBPlanMKVCurrentX` | [Account & Plan](by-topic/account-plan.md) | [L495035](../../../ScriptDB/000_4_CreateSP.sql#L495035) | — | 0 / 0 | — |
| `UBPlanMKVCurrentXX` | [Account & Plan](by-topic/account-plan.md) | [L495180](../../../ScriptDB/000_4_CreateSP.sql#L495180) | — | 1 / 0 | — |
| `UBPlanMove2AnotherClientID` | [Account & Plan](by-topic/account-plan.md) | [L495329](../../../ScriptDB/000_4_CreateSP.sql#L495329) | 1 / 1 file | 1 / 0 | [Plan.cs:3317](../../../UBClasses/Plan.cs#L3317) |
| `UBPlanNetInvested` | [Account & Plan](by-topic/account-plan.md) | [L495379](../../../ScriptDB/000_4_CreateSP.sql#L495379) | — | 1 / 1 | — |
| `UBPlanNetWorthList` | [Account & Plan](by-topic/account-plan.md) | [L495439](../../../ScriptDB/000_4_CreateSP.sql#L495439) | — | 6 / 0 | — |
| `UBPlanNewBankInfoAdd` | [Account & Plan](by-topic/account-plan.md) | [L495469](../../../ScriptDB/000_4_CreateSP.sql#L495469) | — | 0 / 2 | — |
| `UBPlanNewBankInfoRemove` | [Account & Plan](by-topic/account-plan.md) | [L495571](../../../ScriptDB/000_4_CreateSP.sql#L495571) | 1 / 1 file | 0 / 1 | [PanelPlanBankAdd.aspx.cs:399](../../../WebApp/Main/PanelPlanBankAdd.aspx.cs#L399) |
| `UBPlanNewBankInfoUpdate` | [Account & Plan](by-topic/account-plan.md) | [L495619](../../../ScriptDB/000_4_CreateSP.sql#L495619) | — | 0 / 2 | — |
| `UBPlanNewBenInfoAdd` | [Account & Plan](by-topic/account-plan.md) | [L495706](../../../ScriptDB/000_4_CreateSP.sql#L495706) | — | 0 / 5 | — |
| `UBPlanNewBenInfoRemove` | [Account & Plan](by-topic/account-plan.md) | [L495933](../../../ScriptDB/000_4_CreateSP.sql#L495933) | 2 / 2 file | 0 / 1 | [PanelPlanBenAdd.aspx.cs:765](../../../WebApp/Main/PanelPlanBenAdd.aspx.cs#L765) |
| `UBPlanNewBenInfoUpdate` | [Account & Plan](by-topic/account-plan.md) | [L495996](../../../ScriptDB/000_4_CreateSP.sql#L495996) | — | 0 / 8 | — |
| `UBPlanNewJointInfoAdd` | [Account & Plan](by-topic/account-plan.md) | [L496225](../../../ScriptDB/000_4_CreateSP.sql#L496225) | — | 0 / 0 | — |
| `UBPlanNewJointInfoRemove` | [Account & Plan](by-topic/account-plan.md) | [L496319](../../../ScriptDB/000_4_CreateSP.sql#L496319) | 1 / 1 file | 0 / 0 | [PopupPlanAdd.aspx.cs:2056](../../../WebApp/Main/PopupPlanAdd.aspx.cs#L2056) |
| `UBPlanNewThirdPartyInfoAdd` | [Account & Plan](by-topic/account-plan.md) | [L496360](../../../ScriptDB/000_4_CreateSP.sql#L496360) | — | 2 / 5 | — |
| `UBPlanNewThirdPartyInfoRemove` | [Account & Plan](by-topic/account-plan.md) | [L496467](../../../ScriptDB/000_4_CreateSP.sql#L496467) | 1 / 1 file | 0 / 1 | [PanelPlan3rdPartyAdd.aspx.cs:326](../../../WebApp/Main/PanelPlan3rdPartyAdd.aspx.cs#L326) |
| `UBPlanNewThirdPartyInfoUpdate` | [Account & Plan](by-topic/account-plan.md) | [L496509](../../../ScriptDB/000_4_CreateSP.sql#L496509) | — | 0 / 7 | — |
| `UBPlanNewTrustInfoAdd` | [Account & Plan](by-topic/account-plan.md) | [L496604](../../../ScriptDB/000_4_CreateSP.sql#L496604) | — | 0 / 4 | — |
| `UBPlanNewTrustInfoRemove` | [Account & Plan](by-topic/account-plan.md) | [L496713](../../../ScriptDB/000_4_CreateSP.sql#L496713) | 2 / 2 file | 1 / 1 | [ClientInTrust.aspx.cs:337](../../../WebApp/Main/ClientInTrust.aspx.cs#L337) |
| `UBPlanNewTrustInfoUpdate` | [Account & Plan](by-topic/account-plan.md) | [L496761](../../../ScriptDB/000_4_CreateSP.sql#L496761) | — | 0 / 7 | — |
| `UBPlanNomineeRoRCalc` | [Account & Plan](by-topic/account-plan.md) | [L496871](../../../ScriptDB/000_4_CreateSP.sql#L496871) | — | 17 / 2 | — |
| `UBPlanOmnibusPlanUpdate` | [Account & Plan](by-topic/account-plan.md) | [L497430](../../../ScriptDB/000_4_CreateSP.sql#L497430) | 1 / 1 file | 0 / 0 | [Plan.cs:4344](../../../UBClasses/Plan.cs#L4344) |
| `UBPlanPieChartX` | [Account & Plan](by-topic/account-plan.md) | [L497452](../../../ScriptDB/000_4_CreateSP.sql#L497452) | — | 0 / 0 | — |
| `UBPlanPrimaryObjList` | [Account & Plan](by-topic/account-plan.md) | [L497652](../../../ScriptDB/000_4_CreateSP.sql#L497652) | — | 11 / 0 | — |
| `UBPlanQuestionairTMPEnd` | [Account & Plan](by-topic/account-plan.md) | [L497689](../../../ScriptDB/000_4_CreateSP.sql#L497689) | — | 1 / 0 | — |
| `UBPlanQuestionCopy` | [Account & Plan](by-topic/account-plan.md) | [L497718](../../../ScriptDB/000_4_CreateSP.sql#L497718) | — | 0 / 0 | — |
| `UBPlanQuestionUpdate` | [Account & Plan](by-topic/account-plan.md) | [L497768](../../../ScriptDB/000_4_CreateSP.sql#L497768) | — | 1 / 0 | — |
| `UBPlanRDSPRelList` | [Account & Plan](by-topic/account-plan.md) | [L497803](../../../ScriptDB/000_4_CreateSP.sql#L497803) | — | 3 / 0 | — |
| `UBPlanRDSPRelUpdate` | [Account & Plan](by-topic/account-plan.md) | [L497833](../../../ScriptDB/000_4_CreateSP.sql#L497833) | 1 / 1 file | 0 / 0 | [Plan.cs:3158](../../../UBClasses/Plan.cs#L3158) |
| `UBPlanRecipientCodeList` | [Account & Plan](by-topic/account-plan.md) | [L497859](../../../ScriptDB/000_4_CreateSP.sql#L497859) | — | 5 / 0 | — |
| `UBPlanRedemptionAdd` | [Account & Plan](by-topic/account-plan.md) | [L497898](../../../ScriptDB/000_4_CreateSP.sql#L497898) | 1 / 1 file | 0 / 1 | [Plan.cs:3901](../../../UBClasses/Plan.cs#L3901) |
| `UBPlanRedemptionInfo` | [Account & Plan](by-topic/account-plan.md) | [L497991](../../../ScriptDB/000_4_CreateSP.sql#L497991) | 1 / 1 file | 1 / 5 | [Plan.cs:3846](../../../UBClasses/Plan.cs#L3846) |
| `UBPlanRedemptionList` | [Account & Plan](by-topic/account-plan.md) | [L498429](../../../ScriptDB/000_4_CreateSP.sql#L498429) | 1 / 1 file | 0 / 0 | [Plan.cs:3959](../../../UBClasses/Plan.cs#L3959) |
| `UBPlanRedemptionRemove` | [Account & Plan](by-topic/account-plan.md) | [L498478](../../../ScriptDB/000_4_CreateSP.sql#L498478) | 1 / 1 file | 0 / 0 | [Plan.cs:4005](../../../UBClasses/Plan.cs#L4005) |
| `UBPlanRepChangeCustomer` | [Account & Plan](by-topic/account-plan.md) | [L498526](../../../ScriptDB/000_4_CreateSP.sql#L498526) | — | 1 / 1 | — |
| `UBPlanRepChangeSpouse_2BD` | [Account & Plan](by-topic/account-plan.md) | [L498571](../../../ScriptDB/000_4_CreateSP.sql#L498571) | — | 0 / 0 | — |
| `UBPlanRESPSiblingFlagUpdate` | [Account & Plan](by-topic/account-plan.md) | [L498598](../../../ScriptDB/000_4_CreateSP.sql#L498598) | 1 / 1 file | 0 / 0 | [Plan.cs:3103](../../../UBClasses/Plan.cs#L3103) |
| `UBPlanRiskCalcOne` | [Account & Plan](by-topic/account-plan.md) | [L498616](../../../ScriptDB/000_4_CreateSP.sql#L498616) | — | 15 / 0 | — |
| `UBPlanRiskDefList` | [Account & Plan](by-topic/account-plan.md) | [L498744](../../../ScriptDB/000_4_CreateSP.sql#L498744) | — | 2 / 0 | — |
| `UBPlanRiskListCurrent` | [Account & Plan](by-topic/account-plan.md) | [L498788](../../../ScriptDB/000_4_CreateSP.sql#L498788) | — | 0 / 0 | — |
| `UBPlanRRIFPlanID` | [Account & Plan](by-topic/account-plan.md) | [L498919](../../../ScriptDB/000_4_CreateSP.sql#L498919) | — | 0 / 0 | — |
| `UBPlanRRIFSearch` | [Account & Plan](by-topic/account-plan.md) | [L498943](../../../ScriptDB/000_4_CreateSP.sql#L498943) | 1 / 1 file | 0 / 1 | [RRIFSetting.cs:1551](../../../UBClasses/RRIFSetting.cs#L1551) |
| `UBPlanSelectionUpdate` | [Account & Plan](by-topic/account-plan.md) | [L499249](../../../ScriptDB/000_4_CreateSP.sql#L499249) | — | 0 / 0 | — |
| `UBPlanSetKYCReviewCheck` | [Account & Plan](by-topic/account-plan.md) | [L499292](../../../ScriptDB/000_4_CreateSP.sql#L499292) | — | 1 / 0 | — |
| `UBPlanSetKYCReviewCheckAll` | [Account & Plan](by-topic/account-plan.md) | [L499329](../../../ScriptDB/000_4_CreateSP.sql#L499329) | — | 0 / 1 | — |
| `UBPlanSetLastReviewDate` | [Account & Plan](by-topic/account-plan.md) | [L499366](../../../ScriptDB/000_4_CreateSP.sql#L499366) | — | 0 / 2 | — |
| `UBPlanSetLastReviewDate_BOT` | [Account & Plan](by-topic/account-plan.md) | [L499456](../../../ScriptDB/000_4_CreateSP.sql#L499456) | — | 0 / 2 | — |
| `UBPlanStatusList` | [Account & Plan](by-topic/account-plan.md) | [L499528](../../../ScriptDB/000_4_CreateSP.sql#L499528) | — | 7 / 0 | — |
| `UBPlanSysOutStandingCount` | [Account & Plan](by-topic/account-plan.md) | [L499558](../../../ScriptDB/000_4_CreateSP.sql#L499558) | — | 0 / 0 | — |
| `UBPlanSysPlanID` | [Account & Plan](by-topic/account-plan.md) | [L499688](../../../ScriptDB/000_4_CreateSP.sql#L499688) | — | 0 / 0 | — |
| `UBPlanSysSearch` | [Account & Plan](by-topic/account-plan.md) | [L499701](../../../ScriptDB/000_4_CreateSP.sql#L499701) | 1 / 1 file | 0 / 1 | [Plan.cs:1673](../../../UBClasses/Plan.cs#L1673) |
| `UBPlanTaggedCount` | [Account & Plan](by-topic/account-plan.md) | [L500726](../../../ScriptDB/000_4_CreateSP.sql#L500726) | 1 / 1 file | 0 / 0 | [Plan.cs:4674](../../../UBClasses/Plan.cs#L4674) |
| `UBPlanThirdPartyInfoAddFromTMP` | [Account & Plan](by-topic/account-plan.md) | [L500742](../../../ScriptDB/000_4_CreateSP.sql#L500742) | — | 1 / 5 | — |
| `UBPlanThirdPartyQuestionVerify` | [Account & Plan](by-topic/account-plan.md) | [L500823](../../../ScriptDB/000_4_CreateSP.sql#L500823) | — | 3 / 0 | — |
| `UBPlanTimeHorizonList` | [Account & Plan](by-topic/account-plan.md) | [L500907](../../../ScriptDB/000_4_CreateSP.sql#L500907) | — | 12 / 0 | — |
| `UBPlanTimeHorizonUpdate` | [Account & Plan](by-topic/account-plan.md) | [L500937](../../../ScriptDB/000_4_CreateSP.sql#L500937) | 1 / 1 file | 0 / 3 | [Loan.cs:1548](../../../UBClasses/Loan.cs#L1548) |
| `UBPlanTrustRemoveByPlan` | [Account & Plan](by-topic/account-plan.md) | [L500975](../../../ScriptDB/000_4_CreateSP.sql#L500975) | — | 0 / 1 | — |
| `UBPlanTrx2SidedWithFeeCommList` | [Commission & Fee](by-topic/commission-fee.md) | [L501015](../../../ScriptDB/000_4_CreateSP.sql#L501015) | — | 0 / 0 | — |
| `UBPlanTrxList` | [Account & Plan](by-topic/account-plan.md) | [L501146](../../../ScriptDB/000_4_CreateSP.sql#L501146) | — | 0 / 0 | — |
| `UBPlanTypeCount` | [Account & Plan](by-topic/account-plan.md) | [L501283](../../../ScriptDB/000_4_CreateSP.sql#L501283) | — | 0 / 0 | — |
| `UBPlanTypeInfo` | [Account & Plan](by-topic/account-plan.md) | [L501319](../../../ScriptDB/000_4_CreateSP.sql#L501319) | 1 / 1 file | 0 / 0 | [Plan.cs:50](../../../UBClasses/Plan.cs#L50) |
| `UBPlanTypeList` | [Account & Plan](by-topic/account-plan.md) | [L501347](../../../ScriptDB/000_4_CreateSP.sql#L501347) | — | 22 / 0 | — |
| `UBPlanTypeListX` | [Account & Plan](by-topic/account-plan.md) | [L501377](../../../ScriptDB/000_4_CreateSP.sql#L501377) | — | 4 / 0 | — |
| `UBPlanUpdate` | [Account & Plan](by-topic/account-plan.md) | [L501437](../../../ScriptDB/000_4_CreateSP.sql#L501437) | 1 / 1 file | 0 / 21 | [Plan.cs:938](../../../UBClasses/Plan.cs#L938) |
| `UBPlanUpdateDescriptionWithPortolioName` | [Account & Plan](by-topic/account-plan.md) | [L502210](../../../ScriptDB/000_4_CreateSP.sql#L502210) | — | 0 / 0 | — |
| `UBPlanUpdateFreeUnitFormFlagAll` | [Account & Plan](by-topic/account-plan.md) | [L502238](../../../ScriptDB/000_4_CreateSP.sql#L502238) | — | 2 / 4 | — |
| `UBPlanUserDefTMPEnd` | [Account & Plan](by-topic/account-plan.md) | [L502303](../../../ScriptDB/000_4_CreateSP.sql#L502303) | — | 1 / 0 | — |
| `UBPlanVerifySwitches` | [Account & Plan](by-topic/account-plan.md) | [L502332](../../../ScriptDB/000_4_CreateSP.sql#L502332) | — | 1 / 0 | — |
| `UBPlanViewComboList` | [Account & Plan](by-topic/account-plan.md) | [L502399](../../../ScriptDB/000_4_CreateSP.sql#L502399) | — | 0 / 22 | — |
| `UBPlanViewSearch` | [Account & Plan](by-topic/account-plan.md) | [L502483](../../../ScriptDB/000_4_CreateSP.sql#L502483) | 1 / 1 file | 0 / 5 | [Plan.cs:2027](../../../UBClasses/Plan.cs#L2027) |
| `UBPlanViewSearchCriteriaSave` | [Account & Plan](by-topic/account-plan.md) | [L503508](../../../ScriptDB/000_4_CreateSP.sql#L503508) | — | 1 / 1 | — |
| `UBPlanViewSearchEx` | [Account & Plan](by-topic/account-plan.md) | [L503816](../../../ScriptDB/000_4_CreateSP.sql#L503816) | — | 1 / 1 | — |
| `UBPlanViewSearchLoad` | [Account & Plan](by-topic/account-plan.md) | [L504899](../../../ScriptDB/000_4_CreateSP.sql#L504899) | 1 / 1 file | 0 / 1 | [Plan.cs:1546](../../../UBClasses/Plan.cs#L1546) |
| `UBPortfolioPlanFeePYMTOptAssign` | [Commission & Fee](by-topic/commission-fee.md) | [L505223](../../../ScriptDB/000_4_CreateSP.sql#L505223) | — | 1 / 0 | — |
| `UBPortfolioPlanFeePYMTOptAssignAll` | [Commission & Fee](by-topic/commission-fee.md) | [L505281](../../../ScriptDB/000_4_CreateSP.sql#L505281) | — | 0 / 1 | — |
| `UBPortfolioUnitSummary` | [Shared / Other](by-topic/shared-other.md) | [L505307](../../../ScriptDB/000_4_CreateSP.sql#L505307) | — | 1 / 0 | — |
| `UBPortfolioViewComboList` | [Shared / Other](by-topic/shared-other.md) | [L505666](../../../ScriptDB/000_4_CreateSP.sql#L505666) | — | 0 / 5 | — |
| `UBPosDAVCalc` | [Shared / Other](by-topic/shared-other.md) | [L505696](../../../ScriptDB/000_4_CreateSP.sql#L505696) | — | 0 / 0 | — |
| `UBPosDAVCalcX` | [Shared / Other](by-topic/shared-other.md) | [L505792](../../../ScriptDB/000_4_CreateSP.sql#L505792) | — | 0 / 0 | — |
| `UBPosTCRCalc` | [Shared / Other](by-topic/shared-other.md) | [L505963](../../../ScriptDB/000_4_CreateSP.sql#L505963) | — | 1 / 0 | — |
| `UBPriceLast` | [Shared / Other](by-topic/shared-other.md) | [L506174](../../../ScriptDB/000_4_CreateSP.sql#L506174) | — | 2 / 0 | — |
| `UBPriceMove` | [Shared / Other](by-topic/shared-other.md) | [L506335](../../../ScriptDB/000_4_CreateSP.sql#L506335) | — | 0 / 0 | — |
| `UBPriceRemoveDuplicate` | [Shared / Other](by-topic/shared-other.md) | [L506396](../../../ScriptDB/000_4_CreateSP.sql#L506396) | — | 1 / 0 | — |
| `UBPriceRemoveDuplicateAll` | [Shared / Other](by-topic/shared-other.md) | [L506424](../../../ScriptDB/000_4_CreateSP.sql#L506424) | — | 0 / 1 | — |
| `UBPriceTypeList` | [Shared / Other](by-topic/shared-other.md) | [L506452](../../../ScriptDB/000_4_CreateSP.sql#L506452) | — | 1 / 0 | — |
| `UBPrivacyList` | [Shared / Other](by-topic/shared-other.md) | [L506479](../../../ScriptDB/000_4_CreateSP.sql#L506479) | — | 1 / 0 | — |
| `UBProvinceAdd` | [Shared / Other](by-topic/shared-other.md) | [L506505](../../../ScriptDB/000_4_CreateSP.sql#L506505) | 1 / 1 file | 0 / 0 | [Province.cs:316](../../../UBClasses/Province.cs#L316) |
| `UBProvinceInfo` | [Shared / Other](by-topic/shared-other.md) | [L506554](../../../ScriptDB/000_4_CreateSP.sql#L506554) | 1 / 1 file | 0 / 0 | [Province.cs:171](../../../UBClasses/Province.cs#L171) |
| `UBProvinceList` | [Shared / Other](by-topic/shared-other.md) | [L506593](../../../ScriptDB/000_4_CreateSP.sql#L506593) | 2 / 1 file | 0 / 0 | [Province.cs:125](../../../UBClasses/Province.cs#L125) |
| `UBProvinceRemove` | [Shared / Other](by-topic/shared-other.md) | [L506628](../../../ScriptDB/000_4_CreateSP.sql#L506628) | 1 / 1 file | 0 / 0 | [Province.cs:380](../../../UBClasses/Province.cs#L380) |
| `UBProvinceUpdate` | [Shared / Other](by-topic/shared-other.md) | [L506667](../../../ScriptDB/000_4_CreateSP.sql#L506667) | 1 / 1 file | 0 / 0 | [Province.cs:316](../../../UBClasses/Province.cs#L316) |
| `UBPSSkipRecordView` | [Shared / Other](by-topic/shared-other.md) | [L506718](../../../ScriptDB/000_4_CreateSP.sql#L506718) | — | 0 / 0 | — |
| `UBPWOptionList` | [Security & Auth](by-topic/security-auth.md) | [L506768](../../../ScriptDB/000_4_CreateSP.sql#L506768) | — | 4 / 0 | — |
| `UBQuestionairDefAdd` | [Shared / Other](by-topic/shared-other.md) | [L506798](../../../ScriptDB/000_4_CreateSP.sql#L506798) | 1 / 1 file | 0 / 0 | [Questionair.cs:572](../../../UBClasses/Questionair.cs#L572) |
| `UBQuestionairDefList` | [Shared / Other](by-topic/shared-other.md) | [L506859](../../../ScriptDB/000_4_CreateSP.sql#L506859) | 1 / 1 file | 0 / 0 | [Questionair.cs:377](../../../UBClasses/Questionair.cs#L377) |
| `UBQuestionairDefMoveOrder` | [Trading & Orders](by-topic/trading-orders.md) | [L506900](../../../ScriptDB/000_4_CreateSP.sql#L506900) | 1 / 1 file | 0 / 0 | [Questionair.cs:692](../../../UBClasses/Questionair.cs#L692) |
| `UBQuestionairDefRemove` | [Shared / Other](by-topic/shared-other.md) | [L506948](../../../ScriptDB/000_4_CreateSP.sql#L506948) | 1 / 1 file | 0 / 0 | [Questionair.cs:639](../../../UBClasses/Questionair.cs#L639) |
| `UBQuestionairDefUpdate` | [Shared / Other](by-topic/shared-other.md) | [L506981](../../../ScriptDB/000_4_CreateSP.sql#L506981) | 1 / 1 file | 0 / 0 | [Questionair.cs:572](../../../UBClasses/Questionair.cs#L572) |
| `UBReceiptByDepositType` | [Shared / Other](by-topic/shared-other.md) | [L507039](../../../ScriptDB/000_4_CreateSP.sql#L507039) | 1 / 1 file | 0 / 0 | [TrustAccount.cs:3760](../../../UBClasses/TrustAccount.cs#L3760) |
| `UBReceiptStatusList` | [Shared / Other](by-topic/shared-other.md) | [L507064](../../../ScriptDB/000_4_CreateSP.sql#L507064) | — | 0 / 0 | — |
| `UBRecipientESignatureIDUpdate` | [Documents & PDF](by-topic/documents-pdf.md) | [L507089](../../../ScriptDB/000_4_CreateSP.sql#L507089) | 2 / 2 file | 0 / 0 | [ESignature.cs:478](../../../UBClasses/ESignature.cs#L478) |
| `UBRecordAddFSP` | [Shared / Other](by-topic/shared-other.md) | [L507114](../../../ScriptDB/000_4_CreateSP.sql#L507114) | — | 0 / 0 | — |
| `UBRedemptionScheduleDetailHistoryList` | [Trading & Orders](by-topic/trading-orders.md) | [L507180](../../../ScriptDB/000_4_CreateSP.sql#L507180) | 1 / 1 file | 0 / 0 | [RRIFSetting.cs:1118](../../../UBClasses/RRIFSetting.cs#L1118) |
| `UBRedemptionScheduleDetailTrx` | [Trading & Orders](by-topic/trading-orders.md) | [L507232](../../../ScriptDB/000_4_CreateSP.sql#L507232) | 1 / 1 file | 0 / 0 | [RRIFSetting.cs:1017](../../../UBClasses/RRIFSetting.cs#L1017) |
| `UBRedemptionScheduleDetailTrxAmountUpdate` | [Trading & Orders](by-topic/trading-orders.md) | [L507259](../../../ScriptDB/000_4_CreateSP.sql#L507259) | 1 / 1 file | 0 / 1 | [RRIFSetting.cs:1067](../../../UBClasses/RRIFSetting.cs#L1067) |
| `UBRedemptionScheduleHasPendingOrder` | [Trading & Orders](by-topic/trading-orders.md) | [L507325](../../../ScriptDB/000_4_CreateSP.sql#L507325) | 1 / 1 file | 0 / 0 | [RRIFSetting.cs:974](../../../UBClasses/RRIFSetting.cs#L974) |
| `UBRedemptionScheduleHistoryRemove` | [Trading & Orders](by-topic/trading-orders.md) | [L507350](../../../ScriptDB/000_4_CreateSP.sql#L507350) | 1 / 1 file | 0 / 0 | [RRIFSetting.cs:1164](../../../UBClasses/RRIFSetting.cs#L1164) |
| `UBRedemptionScheduleOrderReceiptSet` | [Trading & Orders](by-topic/trading-orders.md) | [L507397](../../../ScriptDB/000_4_CreateSP.sql#L507397) | 1 / 1 file | 0 / 8 | [OrderReceipt.cs:161](../../../VieFUNDPdf/OrderReceipt.cs#L161) |
| `UBRedemptionScheduleRecalc` | [Trading & Orders](by-topic/trading-orders.md) | [L507695](../../../ScriptDB/000_4_CreateSP.sql#L507695) | 1 / 1 file | 1 / 4 | [RRIFSetting.cs:922](../../../UBClasses/RRIFSetting.cs#L922) |
| `UBRedemptionScheduleViewComboList` | [Trading & Orders](by-topic/trading-orders.md) | [L508255](../../../ScriptDB/000_4_CreateSP.sql#L508255) | — | 0 / 1 | — |
| `UBRefreshLastPriceAll` | [Shared / Other](by-topic/shared-other.md) | [L508281](../../../ScriptDB/000_4_CreateSP.sql#L508281) | — | 0 / 0 | — |
| `UBRelationshipList` | [Shared / Other](by-topic/shared-other.md) | [L508320](../../../ScriptDB/000_4_CreateSP.sql#L508320) | — | 5 / 0 | — |
| `UBRelationshipListTo` | [Shared / Other](by-topic/shared-other.md) | [L508352](../../../ScriptDB/000_4_CreateSP.sql#L508352) | — | 1 / 0 | — |
| `UBRepAccessInfo` | [Shared / Other](by-topic/shared-other.md) | [L508384](../../../ScriptDB/000_4_CreateSP.sql#L508384) | 1 / 1 file | 0 / 0 | [Member.cs:559](../../../UBClasses/Member.cs#L559) |
| `UBRepActivityNewPuchase` | [Shared / Other](by-topic/shared-other.md) | [L508441](../../../ScriptDB/000_4_CreateSP.sql#L508441) | — | 0 / 1 | — |
| `UBRepActivityNewPuchaseSummary` | [Shared / Other](by-topic/shared-other.md) | [L508544](../../../ScriptDB/000_4_CreateSP.sql#L508544) | — | 0 / 1 | — |
| `UBRepActivitySummary` | [Shared / Other](by-topic/shared-other.md) | [L508646](../../../ScriptDB/000_4_CreateSP.sql#L508646) | — | 0 / 1 | — |
| `UBRepAssistantComboList` | [Shared / Other](by-topic/shared-other.md) | [L508850](../../../ScriptDB/000_4_CreateSP.sql#L508850) | — | 0 / 0 | — |
| `UBRepCodeAdd2TMPList` | [Shared / Other](by-topic/shared-other.md) | [L508878](../../../ScriptDB/000_4_CreateSP.sql#L508878) | 1 / 1 file | 0 / 1 | [Advisor.cs:571](../../../UBClasses/Advisor.cs#L571) |
| `UBRepCodeChange` | [Shared / Other](by-topic/shared-other.md) | [L508984](../../../ScriptDB/000_4_CreateSP.sql#L508984) | — | 0 / 0 | — |
| `UBRepCodeCommGridCopy` | [Commission & Fee](by-topic/commission-fee.md) | [L509012](../../../ScriptDB/000_4_CreateSP.sql#L509012) | — | 1 / 0 | — |
| `UBRepCodeCopy` | [Shared / Other](by-topic/shared-other.md) | [L509050](../../../ScriptDB/000_4_CreateSP.sql#L509050) | — | 0 / 1 | — |
| `UBRepCodeFromList` | [Shared / Other](by-topic/shared-other.md) | [L509110](../../../ScriptDB/000_4_CreateSP.sql#L509110) | 1 / 1 file | 4 / 0 | [Advisor.cs:507](../../../UBClasses/Advisor.cs#L507) |
| `UBRepCodeInfo` | [Shared / Other](by-topic/shared-other.md) | [L509166](../../../ScriptDB/000_4_CreateSP.sql#L509166) | 2 / 2 file | 0 / 0 | [Member.cs:3588](../../../UBClasses/Member.cs#L3588) |
| `UBRepCodeInfoAdd` | [Shared / Other](by-topic/shared-other.md) | [L509190](../../../ScriptDB/000_4_CreateSP.sql#L509190) | — | 0 / 2 | — |
| `UBRepCodeInfoTMP` | [Shared / Other](by-topic/shared-other.md) | [L509354](../../../ScriptDB/000_4_CreateSP.sql#L509354) | 1 / 1 file | 0 / 0 | [PanelRepCodeAdd.aspx.cs:82](../../../WebApp/Main/PanelRepCodeAdd.aspx.cs#L82) |
| `UBRepCodeInfoUpdate` | [Shared / Other](by-topic/shared-other.md) | [L509382](../../../ScriptDB/000_4_CreateSP.sql#L509382) | — | 0 / 1 | — |
| `UBRepCodeList` | [Shared / Other](by-topic/shared-other.md) | [L509486](../../../ScriptDB/000_4_CreateSP.sql#L509486) | 1 / 1 file | 0 / 0 | [Advisor.cs:416](../../../UBClasses/Advisor.cs#L416) |
| `UBRepCodeListFromArray` | [Shared / Other](by-topic/shared-other.md) | [L509533](../../../ScriptDB/000_4_CreateSP.sql#L509533) | — | 0 / 0 | — |
| `UBRepCodeRemove` | [Shared / Other](by-topic/shared-other.md) | [L509560](../../../ScriptDB/000_4_CreateSP.sql#L509560) | 1 / 1 file | 0 / 0 | [PanelRepCodeAdd.aspx.cs:308](../../../WebApp/Main/PanelRepCodeAdd.aspx.cs#L308) |
| `UBRepCodeRemoveFromTMPList` | [Shared / Other](by-topic/shared-other.md) | [L509605](../../../ScriptDB/000_4_CreateSP.sql#L509605) | 1 / 1 file | 0 / 0 | [Advisor.cs:627](../../../UBClasses/Advisor.cs#L627) |
| `UBRepCodeSelectList` | [Shared / Other](by-topic/shared-other.md) | [L509652](../../../ScriptDB/000_4_CreateSP.sql#L509652) | 1 / 1 file | 0 / 0 | [Member.cs:4315](../../../UBClasses/Member.cs#L4315) |
| `UBRepCodeTMPEnd` | [Shared / Other](by-topic/shared-other.md) | [L509708](../../../ScriptDB/000_4_CreateSP.sql#L509708) | — | 0 / 0 | — |
| `UBRepCommNotDefined` | [Commission & Fee](by-topic/commission-fee.md) | [L509733](../../../ScriptDB/000_4_CreateSP.sql#L509733) | — | 0 / 0 | — |
| `UBReportAdd` | [Shared / Other](by-topic/shared-other.md) | [L509769](../../../ScriptDB/000_4_CreateSP.sql#L509769) | 1 / 1 file | 0 / 1 | [Customer.cs:3389](../../../UBClasses/Customer.cs#L3389) |
| `UBReportAdminPdfObjList` | [Documents & PDF](by-topic/documents-pdf.md) | [L510061](../../../ScriptDB/000_4_CreateSP.sql#L510061) | 1 / 1 file | 0 / 0 | [CReport.cs:6740](../../../VieFUNDPdf/CReport.cs#L6740) |
| `UBReportAssetByFund` | [Fund & GIC](by-topic/fund-gic.md) | [L510177](../../../ScriptDB/000_4_CreateSP.sql#L510177) | 1 / 1 file | 0 / 7 | [CAssetByFund.cs:879](../../../VieFUNDPdf/CAssetByFund.cs#L879) |
| `UBReportAssetByFundTop` | [Fund & GIC](by-topic/fund-gic.md) | [L510417](../../../ScriptDB/000_4_CreateSP.sql#L510417) | 1 / 1 file | 0 / 6 | [CAssetByFund.cs:936](../../../VieFUNDPdf/CAssetByFund.cs#L936) |
| `UBReportAssetByProvProdTypeClean` | [Shared / Other](by-topic/shared-other.md) | [L510529](../../../ScriptDB/000_4_CreateSP.sql#L510529) | — | 0 / 0 | — |
| `UBReportAssetByProvProdTypeUpdate` | [Shared / Other](by-topic/shared-other.md) | [L510542](../../../ScriptDB/000_4_CreateSP.sql#L510542) | — | 3 / 0 | — |
| `UBReportAssetSurvey` | [Shared / Other](by-topic/shared-other.md) | [L510592](../../../ScriptDB/000_4_CreateSP.sql#L510592) | 1 / 1 file | 0 / 7 | [CAssetByFund.cs:1195](../../../VieFUNDPdf/CAssetByFund.cs#L1195) |
| `UBReportAssetSurvey_Intemediary` | [Shared / Other](by-topic/shared-other.md) | [L510988](../../../ScriptDB/000_4_CreateSP.sql#L510988) | — | 0 / 0 | — |
| `UBReportAUAByIntClean` | [Shared / Other](by-topic/shared-other.md) | [L511056](../../../ScriptDB/000_4_CreateSP.sql#L511056) | — | 0 / 0 | — |
| `UBReportAUAByIntUpdate` | [Shared / Other](by-topic/shared-other.md) | [L511080](../../../ScriptDB/000_4_CreateSP.sql#L511080) | — | 1 / 0 | — |
| `UBReportBulletinGet` | [Shared / Other](by-topic/shared-other.md) | [L511144](../../../ScriptDB/000_4_CreateSP.sql#L511144) | 1 / 1 file | 0 / 0 | [CReport.cs:8753](../../../VieFUNDPdf/CReport.cs#L8753) |
| `UBReportBulletinSave` | [Shared / Other](by-topic/shared-other.md) | [L511167](../../../ScriptDB/000_4_CreateSP.sql#L511167) | 1 / 1 file | 0 / 0 | [CReport.cs:8711](../../../VieFUNDPdf/CReport.cs#L8711) |
| `UBReportCashLoad` | [Account & Plan](by-topic/account-plan.md) | [L511222](../../../ScriptDB/000_4_CreateSP.sql#L511222) | — | 1 / 0 | — |
| `UBReportClient` | [Client & KYC](by-topic/client-kyc.md) | [L511381](../../../ScriptDB/000_4_CreateSP.sql#L511381) | — | 0 / 7 | — |
| `UBReportClientAccountStatement` | [Account & Plan](by-topic/account-plan.md) | [L511536](../../../ScriptDB/000_4_CreateSP.sql#L511536) | 1 / 1 file | 0 / 22 | [CReport.cs:510](../../../VieFUNDPdf/CReport.cs#L510) |
| `UBReportClientAccountStatement_2015` | [Account & Plan](by-topic/account-plan.md) | [L515006](../../../ScriptDB/000_4_CreateSP.sql#L515006) | 1 / 1 file | 0 / 22 | [CReport.cs:1289](../../../VieFUNDPdf/CReport.cs#L1289) |
| `UBReportClientAccountStatement_XIRR` | [Account & Plan](by-topic/account-plan.md) | [L518800](../../../ScriptDB/000_4_CreateSP.sql#L518800) | 1 / 1 file | 0 / 21 | [CReport.cs:1027](../../../VieFUNDPdf/CReport.cs#L1027) |
| `UBReportClientAccountStatementTrxOnly` | [Account & Plan](by-topic/account-plan.md) | [L521652](../../../ScriptDB/000_4_CreateSP.sql#L521652) | 1 / 1 file | 0 / 19 | [CReport.cs:649](../../../VieFUNDPdf/CReport.cs#L649) |
| `UBReportClientAccountStatementWithDailyGraph` | [Account & Plan](by-topic/account-plan.md) | [L523702](../../../ScriptDB/000_4_CreateSP.sql#L523702) | 1 / 1 file | 0 / 23 | [CReport.cs:773](../../../VieFUNDPdf/CReport.cs#L773) |
| `UBReportClientAccountSummaryBySupplier` | [Account & Plan](by-topic/account-plan.md) | [L526004](../../../ScriptDB/000_4_CreateSP.sql#L526004) | 1 / 1 file | 0 / 13 | [AccountSummary.cs:49](../../../VieFUNDPdf/AccountSummary.cs#L49) |
| `UBReportClientAssetDetailByDayList` | [Client & KYC](by-topic/client-kyc.md) | [L527031](../../../ScriptDB/000_4_CreateSP.sql#L527031) | — | 2 / 2 | — |
| `UBReportClientAssetMix` | [Client & KYC](by-topic/client-kyc.md) | [L527582](../../../ScriptDB/000_4_CreateSP.sql#L527582) | 1 / 1 file | 0 / 18 | [CReport.cs:1413](../../../VieFUNDPdf/CReport.cs#L1413) |
| `UBReportClientCapitalGainStatement` | [Client & KYC](by-topic/client-kyc.md) | [L528837](../../../ScriptDB/000_4_CreateSP.sql#L528837) | 1 / 1 file | 0 / 19 | [CReport.cs:901](../../../VieFUNDPdf/CReport.cs#L901) |
| `UBReportClientCommission` | [Commission & Fee](by-topic/commission-fee.md) | [L530585](../../../ScriptDB/000_4_CreateSP.sql#L530585) | 1 / 1 file | 0 / 18 | [CReport.cs:8247](../../../VieFUNDPdf/CReport.cs#L8247) |
| `UBReportClientCommission_VEXO` | [Commission & Fee](by-topic/commission-fee.md) | [L532367](../../../ScriptDB/000_4_CreateSP.sql#L532367) | — | 1 / 0 | — |
| `UBReportClientCommission1912` | [Commission & Fee](by-topic/commission-fee.md) | [L532390](../../../ScriptDB/000_4_CreateSP.sql#L532390) | — | 1 / 14 | — |
| `UBReportClientCommission1912_TBD` | [Commission & Fee](by-topic/commission-fee.md) | [L533669](../../../ScriptDB/000_4_CreateSP.sql#L533669) | — | 0 / 14 | — |
| `UBReportClientCommissionB2BSpecial` | [Commission & Fee](by-topic/commission-fee.md) | [L534939](../../../ScriptDB/000_4_CreateSP.sql#L534939) | — | 2 / 0 | — |
| `UBReportClientCommissionRawData` | [Commission & Fee](by-topic/commission-fee.md) | [L534974](../../../ScriptDB/000_4_CreateSP.sql#L534974) | — | 0 / 3 | — |
| `UBReportClientInvestorStatement` | [Client & KYC](by-topic/client-kyc.md) | [L536120](../../../ScriptDB/000_4_CreateSP.sql#L536120) | — | 0 / 20 | — |
| `UBReportClientInvestorStatement_PerCurrency` | [Client & KYC](by-topic/client-kyc.md) | [L538647](../../../ScriptDB/000_4_CreateSP.sql#L538647) | — | 0 / 21 | — |
| `UBReportClientInvestorStatement_XIRR` | [Client & KYC](by-topic/client-kyc.md) | [L541180](../../../ScriptDB/000_4_CreateSP.sql#L541180) | 1 / 1 file | 0 / 22 | [CReport.cs:1156](../../../VieFUNDPdf/CReport.cs#L1156) |
| `UBReportClientKYC` | [Client & KYC](by-topic/client-kyc.md) | [L544302](../../../ScriptDB/000_4_CreateSP.sql#L544302) | 1 / 1 file | 0 / 14 | [CClientKYC.cs:145](../../../VieFUNDPdf/CClientKYC.cs#L145) |
| `UBReportClientKYC2` | [Client & KYC](by-topic/client-kyc.md) | [L544907](../../../ScriptDB/000_4_CreateSP.sql#L544907) | — | 0 / 24 | — |
| `UBReportClientOnLineOK` | [Client & KYC](by-topic/client-kyc.md) | [L545171](../../../ScriptDB/000_4_CreateSP.sql#L545171) | 1 / 1 file | 0 / 0 | [CReport.cs:7019](../../../VieFUNDPdf/CReport.cs#L7019) |
| `UBReportClientPdfObjApprove` | [Client & KYC](by-topic/client-kyc.md) | [L545228](../../../ScriptDB/000_4_CreateSP.sql#L545228) | — | 0 / 1 | — |
| `UBReportClientPdfObjList` | [Client & KYC](by-topic/client-kyc.md) | [L545296](../../../ScriptDB/000_4_CreateSP.sql#L545296) | 1 / 1 file | 0 / 0 | [CReport.cs:6794](../../../VieFUNDPdf/CReport.cs#L6794) |
| `UBReportClientPdfObjRemove` | [Client & KYC](by-topic/client-kyc.md) | [L545355](../../../ScriptDB/000_4_CreateSP.sql#L545355) | 1 / 1 file | 2 / 0 | [CReportSchedule.cs:809](../../../UBClasses/CReportSchedule.cs#L809) |
| `UBReportClientPdfObjRemoveBulk` | [Client & KYC](by-topic/client-kyc.md) | [L545405](../../../ScriptDB/000_4_CreateSP.sql#L545405) | — | 0 / 1 | — |
| `UBReportClientPdfObjSet` | [Client & KYC](by-topic/client-kyc.md) | [L545447](../../../ScriptDB/000_4_CreateSP.sql#L545447) | 1 / 1 file | 0 / 0 | [CReport.cs:6845](../../../VieFUNDPdf/CReport.cs#L6845) |
| `UBReportClientPerformance` | [Client & KYC](by-topic/client-kyc.md) | [L545595](../../../ScriptDB/000_4_CreateSP.sql#L545595) | 1 / 1 file | 0 / 22 | [ClientPerformance.cs:54](../../../VieFUNDPdf/ClientPerformance.cs#L54) |
| `UBReportClientPortfolioPerformance` | [Client & KYC](by-topic/client-kyc.md) | [L548604](../../../ScriptDB/000_4_CreateSP.sql#L548604) | 1 / 1 file | 0 / 24 | [ClientPerformance.cs:885](../../../VieFUNDPdf/ClientPerformance.cs#L885) |
| `UBReportClientStatementListExport` | [Client & KYC](by-topic/client-kyc.md) | [L551819](../../../ScriptDB/000_4_CreateSP.sql#L551819) | — | 0 / 0 | — |
| `UBReportColumnHeader` | [Shared / Other](by-topic/shared-other.md) | [L551854](../../../ScriptDB/000_4_CreateSP.sql#L551854) | — | 31 / 0 | — |
| `UBReportDefList` | [Shared / Other](by-topic/shared-other.md) | [L551970](../../../ScriptDB/000_4_CreateSP.sql#L551970) | — | 4 / 0 | — |
| `UBReportDisclaimer` | [Shared / Other](by-topic/shared-other.md) | [L552059](../../../ScriptDB/000_4_CreateSP.sql#L552059) | — | 13 / 0 | — |
| `UBReportDisclaimerGet` | [Shared / Other](by-topic/shared-other.md) | [L552113](../../../ScriptDB/000_4_CreateSP.sql#L552113) | — | 0 / 0 | — |
| `UBReportDisclaimerSet` | [Shared / Other](by-topic/shared-other.md) | [L552141](../../../ScriptDB/000_4_CreateSP.sql#L552141) | 1 / 1 file | 0 / 0 | [Export.cs:418](../../../UBClasses/Export.cs#L418) |
| `UBReportDisclaimerX` | [Shared / Other](by-topic/shared-other.md) | [L552201](../../../ScriptDB/000_4_CreateSP.sql#L552201) | — | 1 / 0 | — |
| `UBReportDisclaimerXX` | [Shared / Other](by-topic/shared-other.md) | [L552246](../../../ScriptDB/000_4_CreateSP.sql#L552246) | — | 26 / 0 | — |
| `UBReportExRateTMPInit` | [Shared / Other](by-topic/shared-other.md) | [L552319](../../../ScriptDB/000_4_CreateSP.sql#L552319) | — | 1 / 0 | — |
| `UBReportFamily` | [Client & KYC](by-topic/client-kyc.md) | [L552351](../../../ScriptDB/000_4_CreateSP.sql#L552351) | 1 / 1 file | 0 / 16 | [FamilyReport.cs:472](../../../VieFUNDPdf/FamilyReport.cs#L472) |
| `UBReportFamily_Old` | [Client & KYC](by-topic/client-kyc.md) | [L555189](../../../ScriptDB/000_4_CreateSP.sql#L555189) | — | 0 / 16 | — |
| `UBReportFamilyCommission` | [Commission & Fee](by-topic/commission-fee.md) | [L558010](../../../ScriptDB/000_4_CreateSP.sql#L558010) | 1 / 1 file | 0 / 13 | [FamilyReport.cs:709](../../../VieFUNDPdf/FamilyReport.cs#L709) |
| `UBReportFamilyPerformance` | [Client & KYC](by-topic/client-kyc.md) | [L559311](../../../ScriptDB/000_4_CreateSP.sql#L559311) | 1 / 1 file | 0 / 17 | [FamilyReport.cs:825](../../../VieFUNDPdf/FamilyReport.cs#L825) |
| `UBReportFundAccountLoad` | [Fund & GIC](by-topic/fund-gic.md) | [L561691](../../../ScriptDB/000_4_CreateSP.sql#L561691) | — | 1 / 2 | — |
| `UBReportGetFundUnit` | [Fund & GIC](by-topic/fund-gic.md) | [L561864](../../../ScriptDB/000_4_CreateSP.sql#L561864) | — | 1 / 2 | — |
| `UBReportGetPdfObj` | [Documents & PDF](by-topic/documents-pdf.md) | [L561961](../../../ScriptDB/000_4_CreateSP.sql#L561961) | 1 / 1 file | 0 / 0 | [CReport.cs:6628](../../../VieFUNDPdf/CReport.cs#L6628) |
| `UBReportGICLoad` | [Fund & GIC](by-topic/fund-gic.md) | [L562026](../../../ScriptDB/000_4_CreateSP.sql#L562026) | — | 1 / 1 | — |
| `UBReportGICTrxLoad` | [Fund & GIC](by-topic/fund-gic.md) | [L562152](../../../ScriptDB/000_4_CreateSP.sql#L562152) | — | 1 / 0 | — |
| `UBReportImgGet` | [Shared / Other](by-topic/shared-other.md) | [L562196](../../../ScriptDB/000_4_CreateSP.sql#L562196) | — | 7 / 0 | — |
| `UBReportInsertAssign` | [Shared / Other](by-topic/shared-other.md) | [L562229](../../../ScriptDB/000_4_CreateSP.sql#L562229) | 2 / 1 file | 0 / 0 | [CInsert.cs:178](../../../UBClasses/CInsert.cs#L178) |
| `UBReportListNotGeberatedButCouldBe` | [Shared / Other](by-topic/shared-other.md) | [L562292](../../../ScriptDB/000_4_CreateSP.sql#L562292) | — | 0 / 1 | — |
| `UBReportListNotGeneratedButCouldBe` | [Shared / Other](by-topic/shared-other.md) | [L562327](../../../ScriptDB/000_4_CreateSP.sql#L562327) | — | 0 / 1 | — |
| `UBReportLogAdd` | [Shared / Other](by-topic/shared-other.md) | [L562362](../../../ScriptDB/000_4_CreateSP.sql#L562362) | — | 1 / 0 | — |
| `UBReportObjPlanIDAssignOne` | [Account & Plan](by-topic/account-plan.md) | [L562386](../../../ScriptDB/000_4_CreateSP.sql#L562386) | — | 0 / 0 | — |
| `UBReportOptComboList` | [Shared / Other](by-topic/shared-other.md) | [L562432](../../../ScriptDB/000_4_CreateSP.sql#L562432) | — | 0 / 6 | — |
| `UBReportOptComboListAdmin` | [Shared / Other](by-topic/shared-other.md) | [L562452](../../../ScriptDB/000_4_CreateSP.sql#L562452) | — | 0 / 6 | — |
| `UBReportOptComboListByUser` | [Shared / Other](by-topic/shared-other.md) | [L562472](../../../ScriptDB/000_4_CreateSP.sql#L562472) | — | 0 / 4 | — |
| `UBReportPdfObjApprove` | [Documents & PDF](by-topic/documents-pdf.md) | [L562496](../../../ScriptDB/000_4_CreateSP.sql#L562496) | 1 / 1 file | 0 / 1 | [CReportSchedule.cs:713](../../../UBClasses/CReportSchedule.cs#L713) |
| `UBReportPdfObjApproveAll` | [Documents & PDF](by-topic/documents-pdf.md) | [L562563](../../../ScriptDB/000_4_CreateSP.sql#L562563) | 1 / 1 file | 0 / 1 | [CReportSchedule.cs:762](../../../UBClasses/CReportSchedule.cs#L762) |
| `UBReportPdfObjInfo` | [Documents & PDF](by-topic/documents-pdf.md) | [L562663](../../../ScriptDB/000_4_CreateSP.sql#L562663) | — | 0 / 0 | — |
| `UBReportPdfObjList` | [Documents & PDF](by-topic/documents-pdf.md) | [L562700](../../../ScriptDB/000_4_CreateSP.sql#L562700) | 1 / 1 file | 0 / 0 | [CReportSchedule.cs:539](../../../UBClasses/CReportSchedule.cs#L539) |
| `UBReportPdfObjPlanIDAdd` | [Account & Plan](by-topic/account-plan.md) | [L563747](../../../ScriptDB/000_4_CreateSP.sql#L563747) | — | 1 / 0 | — |
| `UBReportPdfObjPlanIDAddList` | [Account & Plan](by-topic/account-plan.md) | [L563775](../../../ScriptDB/000_4_CreateSP.sql#L563775) | — | 15 / 1 | — |
| `UBReportPdfObjPlanIDClear` | [Account & Plan](by-topic/account-plan.md) | [L563800](../../../ScriptDB/000_4_CreateSP.sql#L563800) | — | 15 / 0 | — |
| `UBReportPdfObjReleaseTagged` | [Documents & PDF](by-topic/documents-pdf.md) | [L563817](../../../ScriptDB/000_4_CreateSP.sql#L563817) | 1 / 1 file | 0 / 1 | [CReportSchedule.cs:665](../../../UBClasses/CReportSchedule.cs#L665) |
| `UBReportPdfObjRemove` | [Documents & PDF](by-topic/documents-pdf.md) | [L563934](../../../ScriptDB/000_4_CreateSP.sql#L563934) | — | 0 / 0 | — |
| `UBReportPdfObjRemoveFromSelection` | [Documents & PDF](by-topic/documents-pdf.md) | [L563976](../../../ScriptDB/000_4_CreateSP.sql#L563976) | — | 0 / 1 | — |
| `UBReportPdfObjResetApproveClient` | [Client & KYC](by-topic/client-kyc.md) | [L564017](../../../ScriptDB/000_4_CreateSP.sql#L564017) | — | 0 / 0 | — |
| `UBReportPdfObjSelectionUpdate` | [Documents & PDF](by-topic/documents-pdf.md) | [L564034](../../../ScriptDB/000_4_CreateSP.sql#L564034) | — | 0 / 0 | — |
| `UBReportPdfObjTMPAdd` | [Documents & PDF](by-topic/documents-pdf.md) | [L564080](../../../ScriptDB/000_4_CreateSP.sql#L564080) | 1 / 1 file | 0 / 0 | [CReport.cs:6891](../../../VieFUNDPdf/CReport.cs#L6891) |
| `UBReportPdfObjTMPAddWithAttachment` | [Documents & PDF](by-topic/documents-pdf.md) | [L564121](../../../ScriptDB/000_4_CreateSP.sql#L564121) | — | 0 / 1 | — |
| `UBReportPdfObjTMPGet` | [Documents & PDF](by-topic/documents-pdf.md) | [L564196](../../../ScriptDB/000_4_CreateSP.sql#L564196) | 1 / 1 file | 0 / 0 | [CReport.cs:6696](../../../VieFUNDPdf/CReport.cs#L6696) |
| `UBReportPieChart` | [Shared / Other](by-topic/shared-other.md) | [L564220](../../../ScriptDB/000_4_CreateSP.sql#L564220) | — | 19 / 0 | — |
| `UBReportPlanByProvClean` | [Account & Plan](by-topic/account-plan.md) | [L564253](../../../ScriptDB/000_4_CreateSP.sql#L564253) | — | 0 / 0 | — |
| `UBReportPlanByProvUpdate` | [Account & Plan](by-topic/account-plan.md) | [L564267](../../../ScriptDB/000_4_CreateSP.sql#L564267) | — | 3 / 0 | — |
| `UBReportPlanLoad` | [Account & Plan](by-topic/account-plan.md) | [L564314](../../../ScriptDB/000_4_CreateSP.sql#L564314) | — | 1 / 3 | — |
| `UBReportPlanRoRAdd` | [Account & Plan](by-topic/account-plan.md) | [L564417](../../../ScriptDB/000_4_CreateSP.sql#L564417) | — | 1 / 0 | — |
| `UBReportPlanSuitability` | [Compliance](by-topic/compliance.md) | [L564454](../../../ScriptDB/000_4_CreateSP.sql#L564454) | — | 0 / 1 | — |
| `UBReportRequest` | [Shared / Other](by-topic/shared-other.md) | [L564960](../../../ScriptDB/000_4_CreateSP.sql#L564960) | 1 / 1 file | 0 / 3 | [CReport.cs:378](../../../VieFUNDPdf/CReport.cs#L378) |
| `UBReportRequestAdd` | [Shared / Other](by-topic/shared-other.md) | [L565140](../../../ScriptDB/000_4_CreateSP.sql#L565140) | 1 / 1 file | 0 / 1 | [CReport.cs:6497](../../../VieFUNDPdf/CReport.cs#L6497) |
| `UBReportRequestAddTMP` | [Shared / Other](by-topic/shared-other.md) | [L565308](../../../ScriptDB/000_4_CreateSP.sql#L565308) | 1 / 1 file | 0 / 2 | [CReport.cs:6565](../../../VieFUNDPdf/CReport.cs#L6565) |
| `UBReportRequestEnd` | [Shared / Other](by-topic/shared-other.md) | [L565588](../../../ScriptDB/000_4_CreateSP.sql#L565588) | 1 / 1 file | 0 / 0 | [CReport.cs:5205](../../../VieFUNDPdf/CReport.cs#L5205) |
| `UBReportRequestRemove` | [Shared / Other](by-topic/shared-other.md) | [L565634](../../../ScriptDB/000_4_CreateSP.sql#L565634) | — | 0 / 0 | — |
| `UBReportRequestRerun` | [Shared / Other](by-topic/shared-other.md) | [L565696](../../../ScriptDB/000_4_CreateSP.sql#L565696) | — | 0 / 0 | — |
| `UBReportRequestTMP` | [Shared / Other](by-topic/shared-other.md) | [L565746](../../../ScriptDB/000_4_CreateSP.sql#L565746) | 1 / 1 file | 0 / 0 | [ClientReportAdhoc.cs:321](../../../VieFUNDPdf/ClientReportAdhoc.cs#L321) |
| `UBReportRequestTMPEnd` | [Shared / Other](by-topic/shared-other.md) | [L565788](../../../ScriptDB/000_4_CreateSP.sql#L565788) | 1 / 1 file | 0 / 0 | [ClientReportAdhoc.cs:367](../../../VieFUNDPdf/ClientReportAdhoc.cs#L367) |
| `UBReportSavePdfObj` | [Documents & PDF](by-topic/documents-pdf.md) | [L565816](../../../ScriptDB/000_4_CreateSP.sql#L565816) | 1 / 1 file | 0 / 0 | [CReport.cs:5170](../../../VieFUNDPdf/CReport.cs#L5170) |
| `UBReportSection` | [Shared / Other](by-topic/shared-other.md) | [L565859](../../../ScriptDB/000_4_CreateSP.sql#L565859) | — | 28 / 0 | — |
| `UBReportSectionInfo` | [Shared / Other](by-topic/shared-other.md) | [L565899](../../../ScriptDB/000_4_CreateSP.sql#L565899) | 1 / 1 file | 0 / 0 | [CReport.cs:8793](../../../VieFUNDPdf/CReport.cs#L8793) |
| `UBReportSectionList` | [Shared / Other](by-topic/shared-other.md) | [L565945](../../../ScriptDB/000_4_CreateSP.sql#L565945) | — | 1 / 0 | — |
| `UBReportSectionUpdate` | [Shared / Other](by-topic/shared-other.md) | [L565975](../../../ScriptDB/000_4_CreateSP.sql#L565975) | 1 / 1 file | 0 / 0 | [CReport.cs:8847](../../../VieFUNDPdf/CReport.cs#L8847) |
| `UBReportSettingGet` | [Shared / Other](by-topic/shared-other.md) | [L566039](../../../ScriptDB/000_4_CreateSP.sql#L566039) | 1 / 1 file | 0 / 1 | [Export.cs:278](../../../UBClasses/Export.cs#L278) |
| `UBReportSettingInceptionSet` | [Shared / Other](by-topic/shared-other.md) | [L566089](../../../ScriptDB/000_4_CreateSP.sql#L566089) | — | 1 / 0 | — |
| `UBReportSettingSet` | [Shared / Other](by-topic/shared-other.md) | [L566142](../../../ScriptDB/000_4_CreateSP.sql#L566142) | 1 / 1 file | 0 / 3 | [Export.cs:368](../../../UBClasses/Export.cs#L368) |
| `UBReportTaskAdd` | [Shared / Other](by-topic/shared-other.md) | [L566195](../../../ScriptDB/000_4_CreateSP.sql#L566195) | — | 0 / 1 | — |
| `UBReportTaskAddClientStmt` | [Client & KYC](by-topic/client-kyc.md) | [L566414](../../../ScriptDB/000_4_CreateSP.sql#L566414) | — | 0 / 2 | — |
| `UBReportTaskClientStatementSet` | [Client & KYC](by-topic/client-kyc.md) | [L566992](../../../ScriptDB/000_4_CreateSP.sql#L566992) | — | 0 / 1 | — |
| `UBReportTaskClientStatementSummary` | [Client & KYC](by-topic/client-kyc.md) | [L567158](../../../ScriptDB/000_4_CreateSP.sql#L567158) | — | 0 / 1 | — |
| `UBReportTaskInfo` | [Shared / Other](by-topic/shared-other.md) | [L567253](../../../ScriptDB/000_4_CreateSP.sql#L567253) | — | 0 / 1 | — |
| `UBReportTaskInfoByObjID` | [Shared / Other](by-topic/shared-other.md) | [L567319](../../../ScriptDB/000_4_CreateSP.sql#L567319) | 1 / 1 file | 0 / 0 | [CReport.cs:5926](../../../VieFUNDPdf/CReport.cs#L5926) |
| `UBReportTaskList` | [Shared / Other](by-topic/shared-other.md) | [L567393](../../../ScriptDB/000_4_CreateSP.sql#L567393) | — | 0 / 0 | — |
| `UBReportTaskRemove` | [Shared / Other](by-topic/shared-other.md) | [L567444](../../../ScriptDB/000_4_CreateSP.sql#L567444) | — | 0 / 0 | — |
| `UBReportTaskUpdate` | [Shared / Other](by-topic/shared-other.md) | [L567526](../../../ScriptDB/000_4_CreateSP.sql#L567526) | — | 0 / 0 | — |
| `UBReportText` | [Notifications](by-topic/notifications.md) | [L567696](../../../ScriptDB/000_4_CreateSP.sql#L567696) | — | 11 / 0 | — |
| `UBReportTrxLoad` | [Trading & Orders](by-topic/trading-orders.md) | [L567731](../../../ScriptDB/000_4_CreateSP.sql#L567731) | — | 1 / 0 | — |
| `UBReportTypeExtraGet` | [Shared / Other](by-topic/shared-other.md) | [L567774](../../../ScriptDB/000_4_CreateSP.sql#L567774) | 1 / 1 file | 1 / 0 | [Export.cs:457](../../../UBClasses/Export.cs#L457) |
| `UBReportTypeExtraUpdate` | [Shared / Other](by-topic/shared-other.md) | [L567803](../../../ScriptDB/000_4_CreateSP.sql#L567803) | 1 / 1 file | 1 / 0 | [Export.cs:324](../../../UBClasses/Export.cs#L324) |
| `UBResetIdentity` | [Shared / Other](by-topic/shared-other.md) | [L567829](../../../ScriptDB/000_4_CreateSP.sql#L567829) | — | 0 / 0 | — |
| `UBRESP_800_List` | [Account & Plan](by-topic/account-plan.md) | [L567845](../../../ScriptDB/000_4_CreateSP.sql#L567845) | — | 0 / 0 | — |
| `UBRESP_900_List` | [Account & Plan](by-topic/account-plan.md) | [L568094](../../../ScriptDB/000_4_CreateSP.sql#L568094) | — | 0 / 0 | — |
| `UBRESP_950_List` | [Account & Plan](by-topic/account-plan.md) | [L568428](../../../ScriptDB/000_4_CreateSP.sql#L568428) | — | 0 / 0 | — |
| `UBRESP_EAP_Listing` | [Account & Plan](by-topic/account-plan.md) | [L568588](../../../ScriptDB/000_4_CreateSP.sql#L568588) | — | 0 / 0 | — |
| `UBRESP_List_Deposit` | [Account & Plan](by-topic/account-plan.md) | [L568632](../../../ScriptDB/000_4_CreateSP.sql#L568632) | — | 0 / 0 | — |
| `UBRESP_List_PlanBenStatus` | [Account & Plan](by-topic/account-plan.md) | [L568728](../../../ScriptDB/000_4_CreateSP.sql#L568728) | — | 0 / 0 | — |
| `UBRESP_List_PlanStatus` | [Account & Plan](by-topic/account-plan.md) | [L568825](../../../ScriptDB/000_4_CreateSP.sql#L568825) | — | 0 / 0 | — |
| `UBRESP_List_Transfer` | [Account & Plan](by-topic/account-plan.md) | [L568885](../../../ScriptDB/000_4_CreateSP.sql#L568885) | — | 0 / 0 | — |
| `UBRESP_List_TransferInCash` | [Account & Plan](by-topic/account-plan.md) | [L568964](../../../ScriptDB/000_4_CreateSP.sql#L568964) | — | 0 / 0 | — |
| `UBRESP_Scan_BenInfo` | [Account & Plan](by-topic/account-plan.md) | [L569031](../../../ScriptDB/000_4_CreateSP.sql#L569031) | — | 0 / 0 | — |
| `UBRESP_Scan_Plan` | [Account & Plan](by-topic/account-plan.md) | [L569117](../../../ScriptDB/000_4_CreateSP.sql#L569117) | — | 0 / 0 | — |
| `UBRESPAccountExportList` | [Account & Plan](by-topic/account-plan.md) | [L569149](../../../ScriptDB/000_4_CreateSP.sql#L569149) | — | 1 / 0 | — |
| `UBRESPAccountExportList_V1` | [Account & Plan](by-topic/account-plan.md) | [L569499](../../../ScriptDB/000_4_CreateSP.sql#L569499) | — | 0 / 1 | — |
| `UBRESPAdd002Record` | [Account & Plan](by-topic/account-plan.md) | [L570318](../../../ScriptDB/000_4_CreateSP.sql#L570318) | — | 0 / 0 | — |
| `UBRESPAdd800Record` | [Account & Plan](by-topic/account-plan.md) | [L570350](../../../ScriptDB/000_4_CreateSP.sql#L570350) | — | 0 / 0 | — |
| `UBRESPAdd900Record` | [Account & Plan](by-topic/account-plan.md) | [L570425](../../../ScriptDB/000_4_CreateSP.sql#L570425) | — | 0 / 1 | — |
| `UBRESPAdd950Record` | [Account & Plan](by-topic/account-plan.md) | [L570660](../../../ScriptDB/000_4_CreateSP.sql#L570660) | — | 0 / 0 | — |
| `UBRESPAddErrorRecord` | [Account & Plan](by-topic/account-plan.md) | [L570696](../../../ScriptDB/000_4_CreateSP.sql#L570696) | — | 0 / 0 | — |
| `UBRESPBatchFileDetailList` | [Account & Plan](by-topic/account-plan.md) | [L570730](../../../ScriptDB/000_4_CreateSP.sql#L570730) | — | 0 / 0 | — |
| `UBRESPBatchFileList` | [Account & Plan](by-topic/account-plan.md) | [L570845](../../../ScriptDB/000_4_CreateSP.sql#L570845) | — | 0 / 0 | — |
| `UBRESPBatchFileStats` | [Account & Plan](by-topic/account-plan.md) | [L570879](../../../ScriptDB/000_4_CreateSP.sql#L570879) | — | 1 / 0 | — |
| `UBRESPBen18List` | [Account & Plan](by-topic/account-plan.md) | [L570918](../../../ScriptDB/000_4_CreateSP.sql#L570918) | — | 0 / 0 | — |
| `UBRESPBenNewContributionAdd` | [Account & Plan](by-topic/account-plan.md) | [L570957](../../../ScriptDB/000_4_CreateSP.sql#L570957) | — | 6 / 1 | — |
| `UBRESPCalcEAP` | [Account & Plan](by-topic/account-plan.md) | [L571062](../../../ScriptDB/000_4_CreateSP.sql#L571062) | 1 / 1 file | 0 / 0 | [CRESP.cs:1198](../../../UBClasses/CRESP.cs#L1198) |
| `UBRESPCreateFileNow` | [Account & Plan](by-topic/account-plan.md) | [L571161](../../../ScriptDB/000_4_CreateSP.sql#L571161) | — | 0 / 1 | — |
| `UBRESPCreateFileRequest` | [Account & Plan](by-topic/account-plan.md) | [L571201](../../../ScriptDB/000_4_CreateSP.sql#L571201) | — | 0 / 1 | — |
| `UBRESPCreateSummaryFileRequest` | [Account & Plan](by-topic/account-plan.md) | [L571382](../../../ScriptDB/000_4_CreateSP.sql#L571382) | — | 0 / 0 | — |
| `UBRESPFileDef` | [Account & Plan](by-topic/account-plan.md) | [L571460](../../../ScriptDB/000_4_CreateSP.sql#L571460) | — | 0 / 1 | — |
| `UBRESPFileDefOne` | [Account & Plan](by-topic/account-plan.md) | [L571506](../../../ScriptDB/000_4_CreateSP.sql#L571506) | — | 1 / 0 | — |
| `UBRESPFileList` | [Account & Plan](by-topic/account-plan.md) | [L571562](../../../ScriptDB/000_4_CreateSP.sql#L571562) | 1 / 1 file | 0 / 0 | [CRESP.cs:1091](../../../UBClasses/CRESP.cs#L1091) |
| `UBRESPGetSourceID` | [Account & Plan](by-topic/account-plan.md) | [L571588](../../../ScriptDB/000_4_CreateSP.sql#L571588) | — | 10 / 0 | — |
| `UBRESPGrantRequestAdd` | [Account & Plan](by-topic/account-plan.md) | [L571608](../../../ScriptDB/000_4_CreateSP.sql#L571608) | — | 3 / 1 | — |
| `UBRESPGrantRequestAdd511_12` | [Account & Plan](by-topic/account-plan.md) | [L571793](../../../ScriptDB/000_4_CreateSP.sql#L571793) | — | 1 / 1 | — |
| `UBRESPPlanSelectionUpdate` | [Account & Plan](by-topic/account-plan.md) | [L571861](../../../ScriptDB/000_4_CreateSP.sql#L571861) | — | 0 / 0 | — |
| `UBRESPPlanSummaryList` | [Account & Plan](by-topic/account-plan.md) | [L571897](../../../ScriptDB/000_4_CreateSP.sql#L571897) | 1 / 1 file | 0 / 1 | [CRESP.cs:786](../../../UBClasses/CRESP.cs#L786) |
| `UBRESPPlanVerify` | [Account & Plan](by-topic/account-plan.md) | [L572166](../../../ScriptDB/000_4_CreateSP.sql#L572166) | — | 3 / 2 | — |
| `UBRESPPlanVerifyAll` | [Account & Plan](by-topic/account-plan.md) | [L572291](../../../ScriptDB/000_4_CreateSP.sql#L572291) | — | 1 / 1 | — |
| `UBRESPProFileRemove` | [Account & Plan](by-topic/account-plan.md) | [L572350](../../../ScriptDB/000_4_CreateSP.sql#L572350) | — | 0 / 0 | — |
| `UBRESPReverseCreateAll` | [Account & Plan](by-topic/account-plan.md) | [L572374](../../../ScriptDB/000_4_CreateSP.sql#L572374) | — | 0 / 1 | — |
| `UBRESPReverseCreateOneItem` | [Account & Plan](by-topic/account-plan.md) | [L572402](../../../ScriptDB/000_4_CreateSP.sql#L572402) | — | 1 / 0 | — |
| `UBRESPScanAllDeposit` | [Account & Plan](by-topic/account-plan.md) | [L572510](../../../ScriptDB/000_4_CreateSP.sql#L572510) | — | 0 / 1 | — |
| `UBRESPSetError2Pending` | [Account & Plan](by-topic/account-plan.md) | [L572540](../../../ScriptDB/000_4_CreateSP.sql#L572540) | — | 1 / 0 | — |
| `UBRESPSetError2Pending_AllContribution` | [Account & Plan](by-topic/account-plan.md) | [L572617](../../../ScriptDB/000_4_CreateSP.sql#L572617) | — | 0 / 1 | — |
| `UBRESPSetError2Pending_OneContribution` | [Account & Plan](by-topic/account-plan.md) | [L572646](../../../ScriptDB/000_4_CreateSP.sql#L572646) | — | 1 / 0 | — |
| `UBRESPSetSourceID` | [Account & Plan](by-topic/account-plan.md) | [L572709](../../../ScriptDB/000_4_CreateSP.sql#L572709) | — | 2 / 1 | — |
| `UBRESPSetTaggedItemsPendingStatus` | [Account & Plan](by-topic/account-plan.md) | [L572732](../../../ScriptDB/000_4_CreateSP.sql#L572732) | — | 0 / 1 | — |
| `UBRESPSummaryExportList` | [Account & Plan](by-topic/account-plan.md) | [L572762](../../../ScriptDB/000_4_CreateSP.sql#L572762) | — | 1 / 0 | — |
| `UBRESPSummaryOneBen` | [Account & Plan](by-topic/account-plan.md) | [L572809](../../../ScriptDB/000_4_CreateSP.sql#L572809) | 1 / 1 file | 0 / 0 | [Plan.cs:5191](../../../UBClasses/Plan.cs#L5191) |
| `UBRESPTrustEntryUpdate` | [Account & Plan](by-topic/account-plan.md) | [L573093](../../../ScriptDB/000_4_CreateSP.sql#L573093) | — | 0 / 1 | — |
| `UBRESPTrxInfo` | [Account & Plan](by-topic/account-plan.md) | [L573180](../../../ScriptDB/000_4_CreateSP.sql#L573180) | — | 2 / 0 | — |
| `UBRESPTrxList` | [Account & Plan](by-topic/account-plan.md) | [L573252](../../../ScriptDB/000_4_CreateSP.sql#L573252) | 1 / 1 file | 0 / 0 | [CRESP.cs:350](../../../UBClasses/CRESP.cs#L350) |
| `UBRESPTrxListOneBen` | [Account & Plan](by-topic/account-plan.md) | [L574007](../../../ScriptDB/000_4_CreateSP.sql#L574007) | 1 / 1 file | 0 / 0 | [CRESP.cs:293](../../../UBClasses/CRESP.cs#L293) |
| `UBRESPTrxReverse` | [Account & Plan](by-topic/account-plan.md) | [L574041](../../../ScriptDB/000_4_CreateSP.sql#L574041) | 1 / 1 file | 0 / 1 | [CRESP.cs:243](../../../UBClasses/CRESP.cs#L243) |
| `UBRESPTrxReverseOne` | [Account & Plan](by-topic/account-plan.md) | [L574056](../../../ScriptDB/000_4_CreateSP.sql#L574056) | — | 1 / 1 | — |
| `UBRESPTrxSelectionUpdate` | [Account & Plan](by-topic/account-plan.md) | [L574190](../../../ScriptDB/000_4_CreateSP.sql#L574190) | — | 0 / 0 | — |
| `UBRESPTrxSetResendFlag` | [Account & Plan](by-topic/account-plan.md) | [L574226](../../../ScriptDB/000_4_CreateSP.sql#L574226) | — | 0 / 0 | — |
| `UBRESPTrxVerifySourceIDAll` | [Account & Plan](by-topic/account-plan.md) | [L574255](../../../ScriptDB/000_4_CreateSP.sql#L574255) | — | 0 / 2 | — |
| `UBRESPViewComboList` | [Account & Plan](by-topic/account-plan.md) | [L574281](../../../ScriptDB/000_4_CreateSP.sql#L574281) | — | 0 / 1 | — |
| `UBRESPYMTList` | [Account & Plan](by-topic/account-plan.md) | [L574301](../../../ScriptDB/000_4_CreateSP.sql#L574301) | — | 0 / 0 | — |
| `UBRevenueThresholdAdd` | [Shared / Other](by-topic/shared-other.md) | [L574526](../../../ScriptDB/000_4_CreateSP.sql#L574526) | 1 / 1 file | 0 / 0 | [CommissionDef.cs:578](../../../UBClasses/CommissionDef.cs#L578) |
| `UBRevenueThresholdList` | [Shared / Other](by-topic/shared-other.md) | [L574560](../../../ScriptDB/000_4_CreateSP.sql#L574560) | 1 / 1 file | 0 / 0 | [CommissionDef.cs:667](../../../UBClasses/CommissionDef.cs#L667) |
| `UBRevenueThresholdRemove` | [Shared / Other](by-topic/shared-other.md) | [L574584](../../../ScriptDB/000_4_CreateSP.sql#L574584) | 1 / 1 file | 0 / 0 | [CommissionDef.cs:620](../../../UBClasses/CommissionDef.cs#L620) |
| `UBRiskObjAssessmentComboList` | [Shared / Other](by-topic/shared-other.md) | [L574634](../../../ScriptDB/000_4_CreateSP.sql#L574634) | — | 0 / 6 | — |
| `UBRL164XML` | [Tax & Year-End](by-topic/tax-yearend.md) | [L574665](../../../ScriptDB/000_4_CreateSP.sql#L574665) | — | 1 / 1 | — |
| `UBRL16Approve2Pending` | [Tax & Year-End](by-topic/tax-yearend.md) | [L574766](../../../ScriptDB/000_4_CreateSP.sql#L574766) | — | 0 / 0 | — |
| `UBRL16ApprovedList` | [Tax & Year-End](by-topic/tax-yearend.md) | [L574821](../../../ScriptDB/000_4_CreateSP.sql#L574821) | — | 0 / 1 | — |
| `UBRL16ApprovedSelectionUpdate` | [Tax & Year-End](by-topic/tax-yearend.md) | [L575193](../../../ScriptDB/000_4_CreateSP.sql#L575193) | — | 0 / 0 | — |
| `UBRL16CancelItem` | [Tax & Year-End](by-topic/tax-yearend.md) | [L575229](../../../ScriptDB/000_4_CreateSP.sql#L575229) | — | 0 / 0 | — |
| `UBRL16FileDetailList` | [Tax & Year-End](by-topic/tax-yearend.md) | [L575290](../../../ScriptDB/000_4_CreateSP.sql#L575290) | — | 0 / 0 | — |
| `UBRL16FileList` | [Tax & Year-End](by-topic/tax-yearend.md) | [L575356](../../../ScriptDB/000_4_CreateSP.sql#L575356) | — | 0 / 1 | — |
| `UBRL16IDList` | [Tax & Year-End](by-topic/tax-yearend.md) | [L575370](../../../ScriptDB/000_4_CreateSP.sql#L575370) | 1 / 1 file | 0 / 0 | [RL16Pdf.cs:243](../../../VieFUNDPdf/RL16Pdf.cs#L243) |
| `UBRL16ItemInfo` | [Tax & Year-End](by-topic/tax-yearend.md) | [L575400](../../../ScriptDB/000_4_CreateSP.sql#L575400) | — | 0 / 0 | — |
| `UBRL16ItemInfoUpdate` | [Tax & Year-End](by-topic/tax-yearend.md) | [L575663](../../../ScriptDB/000_4_CreateSP.sql#L575663) | — | 0 / 0 | — |
| `UBRL16PendingList` | [Tax & Year-End](by-topic/tax-yearend.md) | [L575699](../../../ScriptDB/000_4_CreateSP.sql#L575699) | — | 0 / 1 | — |
| `UBRL16PendingSelectionUpdate` | [Tax & Year-End](by-topic/tax-yearend.md) | [L575911](../../../ScriptDB/000_4_CreateSP.sql#L575911) | — | 0 / 0 | — |
| `UBRL16PlanID` | [Tax & Year-End](by-topic/tax-yearend.md) | [L575947](../../../ScriptDB/000_4_CreateSP.sql#L575947) | 1 / 1 file | 0 / 0 | [RL16.cs:191](../../../UBClasses/RL16.cs#L191) |
| `UBRL16ProcessOneItem` | [Tax & Year-End](by-topic/tax-yearend.md) | [L575977](../../../ScriptDB/000_4_CreateSP.sql#L575977) | — | 1 / 1 | — |
| `UBRL16ProcessPendingTaggedItems` | [Tax & Year-End](by-topic/tax-yearend.md) | [L576208](../../../ScriptDB/000_4_CreateSP.sql#L576208) | — | 0 / 1 | — |
| `UBRL16SavePdfObj` | [Tax & Year-End](by-topic/tax-yearend.md) | [L576262](../../../ScriptDB/000_4_CreateSP.sql#L576262) | 1 / 1 file | 0 / 1 | [RL16Pdf.cs:205](../../../VieFUNDPdf/RL16Pdf.cs#L205) |
| `UBRL16SlipRelease` | [Tax & Year-End](by-topic/tax-yearend.md) | [L576295](../../../ScriptDB/000_4_CreateSP.sql#L576295) | — | 0 / 1 | — |
| `UBRL18Approve2Pending` | [Tax & Year-End](by-topic/tax-yearend.md) | [L576414](../../../ScriptDB/000_4_CreateSP.sql#L576414) | — | 0 / 0 | — |
| `UBRL18ApprovedList` | [Tax & Year-End](by-topic/tax-yearend.md) | [L576469](../../../ScriptDB/000_4_CreateSP.sql#L576469) | — | 0 / 1 | — |
| `UBRL18ApprovedSelectionUpdate` | [Tax & Year-End](by-topic/tax-yearend.md) | [L576842](../../../ScriptDB/000_4_CreateSP.sql#L576842) | — | 0 / 0 | — |
| `UBRL18CancelItem` | [Tax & Year-End](by-topic/tax-yearend.md) | [L576879](../../../ScriptDB/000_4_CreateSP.sql#L576879) | — | 0 / 0 | — |
| `UBRL18FileDetailList` | [Tax & Year-End](by-topic/tax-yearend.md) | [L576948](../../../ScriptDB/000_4_CreateSP.sql#L576948) | — | 0 / 0 | — |
| `UBRL18FileList` | [Tax & Year-End](by-topic/tax-yearend.md) | [L577024](../../../ScriptDB/000_4_CreateSP.sql#L577024) | — | 0 / 1 | — |
| `UBRL18IDList` | [Tax & Year-End](by-topic/tax-yearend.md) | [L577039](../../../ScriptDB/000_4_CreateSP.sql#L577039) | 2 / 1 file | 0 / 0 | [RL18Pdf.cs:176](../../../VieFUNDPdf/RL18Pdf.cs#L176) |
| `UBRL18ItemInfo` | [Tax & Year-End](by-topic/tax-yearend.md) | [L577137](../../../ScriptDB/000_4_CreateSP.sql#L577137) | — | 0 / 0 | — |
| `UBRL18ItemInfo4Pdf` | [Tax & Year-End](by-topic/tax-yearend.md) | [L577362](../../../ScriptDB/000_4_CreateSP.sql#L577362) | — | 0 / 0 | — |
| `UBRL18PendingList` | [Tax & Year-End](by-topic/tax-yearend.md) | [L577747](../../../ScriptDB/000_4_CreateSP.sql#L577747) | — | 0 / 1 | — |
| `UBRL18PendingSelectionUpdate` | [Tax & Year-End](by-topic/tax-yearend.md) | [L578070](../../../ScriptDB/000_4_CreateSP.sql#L578070) | — | 0 / 0 | — |
| `UBRL18PlanID` | [Tax & Year-End](by-topic/tax-yearend.md) | [L578107](../../../ScriptDB/000_4_CreateSP.sql#L578107) | 1 / 1 file | 0 / 0 | [RL18.cs:190](../../../UBClasses/RL18.cs#L190) |
| `UBRL18ProcessOneItem` | [Tax & Year-End](by-topic/tax-yearend.md) | [L578127](../../../ScriptDB/000_4_CreateSP.sql#L578127) | — | 1 / 1 | — |
| `UBRL18ProcessPendingTaggedItems` | [Tax & Year-End](by-topic/tax-yearend.md) | [L578376](../../../ScriptDB/000_4_CreateSP.sql#L578376) | — | 0 / 1 | — |
| `UBRL18SavePdfObj` | [Tax & Year-End](by-topic/tax-yearend.md) | [L578414](../../../ScriptDB/000_4_CreateSP.sql#L578414) | 2 / 1 file | 0 / 1 | [RL18Pdf.cs:138](../../../VieFUNDPdf/RL18Pdf.cs#L138) |
| `UBRL18ScanAll` | [Tax & Year-End](by-topic/tax-yearend.md) | [L578449](../../../ScriptDB/000_4_CreateSP.sql#L578449) | — | 0 / 1 | — |
| `UBRL18ScanOneItem` | [Tax & Year-End](by-topic/tax-yearend.md) | [L578480](../../../ScriptDB/000_4_CreateSP.sql#L578480) | — | 1 / 0 | — |
| `UBRL18SlipRelease` | [Tax & Year-End](by-topic/tax-yearend.md) | [L578671](../../../ScriptDB/000_4_CreateSP.sql#L578671) | — | 0 / 1 | — |
| `UBRL18XML` | [Tax & Year-End](by-topic/tax-yearend.md) | [L578789](../../../ScriptDB/000_4_CreateSP.sql#L578789) | — | 1 / 1 | — |
| `UBRL1Approve2Pending` | [Tax & Year-End](by-topic/tax-yearend.md) | [L578865](../../../ScriptDB/000_4_CreateSP.sql#L578865) | — | 0 / 0 | — |
| `UBRL1ApprovedList` | [Tax & Year-End](by-topic/tax-yearend.md) | [L578948](../../../ScriptDB/000_4_CreateSP.sql#L578948) | — | 0 / 0 | — |
| `UBRL1ApprovedSelectionUpdate` | [Tax & Year-End](by-topic/tax-yearend.md) | [L579240](../../../ScriptDB/000_4_CreateSP.sql#L579240) | — | 0 / 0 | — |
| `UBRL1CancelItem` | [Tax & Year-End](by-topic/tax-yearend.md) | [L579276](../../../ScriptDB/000_4_CreateSP.sql#L579276) | — | 0 / 0 | — |
| `UBRL1FileDetailList` | [Tax & Year-End](by-topic/tax-yearend.md) | [L579343](../../../ScriptDB/000_4_CreateSP.sql#L579343) | — | 0 / 0 | — |
| `UBRL1FileList` | [Tax & Year-End](by-topic/tax-yearend.md) | [L579403](../../../ScriptDB/000_4_CreateSP.sql#L579403) | — | 0 / 1 | — |
| `UBRL1IDList` | [Tax & Year-End](by-topic/tax-yearend.md) | [L579417](../../../ScriptDB/000_4_CreateSP.sql#L579417) | 1 / 1 file | 0 / 0 | [RL1Pdf.cs:251](../../../VieFUNDPdf/RL1Pdf.cs#L251) |
| `UBRL1ItemInfo` | [Tax & Year-End](by-topic/tax-yearend.md) | [L579448](../../../ScriptDB/000_4_CreateSP.sql#L579448) | — | 0 / 0 | — |
| `UBRL1ItemInfoUpdate` | [Tax & Year-End](by-topic/tax-yearend.md) | [L579786](../../../ScriptDB/000_4_CreateSP.sql#L579786) | — | 0 / 0 | — |
| `UBRL1MemberInfo` | [Tax & Year-End](by-topic/tax-yearend.md) | [L579835](../../../ScriptDB/000_4_CreateSP.sql#L579835) | — | 0 / 0 | — |
| `UBRL1PendingList` | [Tax & Year-End](by-topic/tax-yearend.md) | [L579862](../../../ScriptDB/000_4_CreateSP.sql#L579862) | — | 0 / 0 | — |
| `UBRL1PendingSelectionUpdate` | [Tax & Year-End](by-topic/tax-yearend.md) | [L580086](../../../ScriptDB/000_4_CreateSP.sql#L580086) | — | 0 / 0 | — |
| `UBRL1ProcessOneItem` | [Tax & Year-End](by-topic/tax-yearend.md) | [L580122](../../../ScriptDB/000_4_CreateSP.sql#L580122) | — | 1 / 1 | — |
| `UBRL1ProcessPendingTaggedItems` | [Tax & Year-End](by-topic/tax-yearend.md) | [L580360](../../../ScriptDB/000_4_CreateSP.sql#L580360) | — | 0 / 1 | — |
| `UBRL1SavePdfObj` | [Tax & Year-End](by-topic/tax-yearend.md) | [L580395](../../../ScriptDB/000_4_CreateSP.sql#L580395) | 1 / 1 file | 0 / 1 | [RL1Pdf.cs:213](../../../VieFUNDPdf/RL1Pdf.cs#L213) |
| `UBRL1ScanOneItem` | [Tax & Year-End](by-topic/tax-yearend.md) | [L580426](../../../ScriptDB/000_4_CreateSP.sql#L580426) | — | 0 / 0 | — |
| `UBRL1SummaryInfo` | [Tax & Year-End](by-topic/tax-yearend.md) | [L580543](../../../ScriptDB/000_4_CreateSP.sql#L580543) | — | 0 / 0 | — |
| `UBRL1XML` | [Tax & Year-End](by-topic/tax-yearend.md) | [L580596](../../../ScriptDB/000_4_CreateSP.sql#L580596) | — | 1 / 1 | — |
| `UBRL2Approve2Pending` | [Tax & Year-End](by-topic/tax-yearend.md) | [L580674](../../../ScriptDB/000_4_CreateSP.sql#L580674) | — | 0 / 0 | — |
| `UBRL2ApprovedList` | [Tax & Year-End](by-topic/tax-yearend.md) | [L580740](../../../ScriptDB/000_4_CreateSP.sql#L580740) | — | 0 / 1 | — |
| `UBRL2ApprovedSelectionUpdate` | [Tax & Year-End](by-topic/tax-yearend.md) | [L581091](../../../ScriptDB/000_4_CreateSP.sql#L581091) | — | 0 / 0 | — |
| `UBRL2CancelItem` | [Tax & Year-End](by-topic/tax-yearend.md) | [L581127](../../../ScriptDB/000_4_CreateSP.sql#L581127) | — | 0 / 0 | — |
| `UBRL2FileDetailList` | [Tax & Year-End](by-topic/tax-yearend.md) | [L581192](../../../ScriptDB/000_4_CreateSP.sql#L581192) | — | 0 / 0 | — |
| `UBRL2FileList` | [Tax & Year-End](by-topic/tax-yearend.md) | [L581257](../../../ScriptDB/000_4_CreateSP.sql#L581257) | — | 0 / 1 | — |
| `UBRL2IDList` | [Tax & Year-End](by-topic/tax-yearend.md) | [L581271](../../../ScriptDB/000_4_CreateSP.sql#L581271) | 1 / 1 file | 0 / 0 | [RL2Pdf.cs:244](../../../VieFUNDPdf/RL2Pdf.cs#L244) |
| `UBRL2ItemInfo` | [Tax & Year-End](by-topic/tax-yearend.md) | [L581302](../../../ScriptDB/000_4_CreateSP.sql#L581302) | — | 0 / 0 | — |
| `UBRL2ItemInfoUpdate` | [Tax & Year-End](by-topic/tax-yearend.md) | [L581598](../../../ScriptDB/000_4_CreateSP.sql#L581598) | — | 0 / 0 | — |
| `UBRL2PendingList` | [Tax & Year-End](by-topic/tax-yearend.md) | [L581638](../../../ScriptDB/000_4_CreateSP.sql#L581638) | — | 0 / 2 | — |
| `UBRL2PendingSelectionUpdate` | [Tax & Year-End](by-topic/tax-yearend.md) | [L582136](../../../ScriptDB/000_4_CreateSP.sql#L582136) | — | 0 / 0 | — |
| `UBRL2PlanID` | [Tax & Year-End](by-topic/tax-yearend.md) | [L582172](../../../ScriptDB/000_4_CreateSP.sql#L582172) | 1 / 1 file | 0 / 0 | [RL2.cs:125](../../../UBClasses/RL2.cs#L125) |
| `UBRL2ProcessOneItem` | [Tax & Year-End](by-topic/tax-yearend.md) | [L582191](../../../ScriptDB/000_4_CreateSP.sql#L582191) | — | 1 / 1 | — |
| `UBRL2ProcessPendingTaggedItems` | [Tax & Year-End](by-topic/tax-yearend.md) | [L582468](../../../ScriptDB/000_4_CreateSP.sql#L582468) | — | 0 / 1 | — |
| `UBRL2SavePdfObj` | [Tax & Year-End](by-topic/tax-yearend.md) | [L582505](../../../ScriptDB/000_4_CreateSP.sql#L582505) | 1 / 1 file | 0 / 1 | [RL2Pdf.cs:206](../../../VieFUNDPdf/RL2Pdf.cs#L206) |
| `UBRL2SlipRelease` | [Tax & Year-End](by-topic/tax-yearend.md) | [L582537](../../../ScriptDB/000_4_CreateSP.sql#L582537) | — | 0 / 1 | — |
| `UBRL2XML` | [Tax & Year-End](by-topic/tax-yearend.md) | [L582654](../../../ScriptDB/000_4_CreateSP.sql#L582654) | — | 1 / 1 | — |
| `UBRL34XML` | [Tax & Year-End](by-topic/tax-yearend.md) | [L582730](../../../ScriptDB/000_4_CreateSP.sql#L582730) | — | 1 / 1 | — |
| `UBRL3Approve2Pending` | [Tax & Year-End](by-topic/tax-yearend.md) | [L582809](../../../ScriptDB/000_4_CreateSP.sql#L582809) | — | 0 / 0 | — |
| `UBRL3ApprovedList` | [Tax & Year-End](by-topic/tax-yearend.md) | [L582864](../../../ScriptDB/000_4_CreateSP.sql#L582864) | — | 0 / 1 | — |
| `UBRL3ApprovedSelectionUpdate` | [Tax & Year-End](by-topic/tax-yearend.md) | [L583243](../../../ScriptDB/000_4_CreateSP.sql#L583243) | — | 0 / 0 | — |
| `UBRL3CancelItem` | [Tax & Year-End](by-topic/tax-yearend.md) | [L583279](../../../ScriptDB/000_4_CreateSP.sql#L583279) | — | 0 / 0 | — |
| `UBRL3FileDetailList` | [Tax & Year-End](by-topic/tax-yearend.md) | [L583342](../../../ScriptDB/000_4_CreateSP.sql#L583342) | — | 0 / 0 | — |
| `UBRL3FileList` | [Tax & Year-End](by-topic/tax-yearend.md) | [L583408](../../../ScriptDB/000_4_CreateSP.sql#L583408) | — | 0 / 1 | — |
| `UBRL3IDList` | [Tax & Year-End](by-topic/tax-yearend.md) | [L583422](../../../ScriptDB/000_4_CreateSP.sql#L583422) | 1 / 1 file | 0 / 0 | [RL3Pdf.cs:243](../../../VieFUNDPdf/RL3Pdf.cs#L243) |
| `UBRL3ItemInfo` | [Tax & Year-End](by-topic/tax-yearend.md) | [L583452](../../../ScriptDB/000_4_CreateSP.sql#L583452) | — | 0 / 0 | — |
| `UBRL3ItemInfoUpdate` | [Tax & Year-End](by-topic/tax-yearend.md) | [L583735](../../../ScriptDB/000_4_CreateSP.sql#L583735) | — | 0 / 0 | — |
| `UBRL3PendingList` | [Tax & Year-End](by-topic/tax-yearend.md) | [L583772](../../../ScriptDB/000_4_CreateSP.sql#L583772) | — | 0 / 1 | — |
| `UBRL3PendingSelectionUpdate` | [Tax & Year-End](by-topic/tax-yearend.md) | [L584002](../../../ScriptDB/000_4_CreateSP.sql#L584002) | — | 0 / 0 | — |
| `UBRL3PlanID` | [Tax & Year-End](by-topic/tax-yearend.md) | [L584038](../../../ScriptDB/000_4_CreateSP.sql#L584038) | 1 / 1 file | 0 / 0 | [RL3.cs:191](../../../UBClasses/RL3.cs#L191) |
| `UBRL3ProcessOneItem` | [Tax & Year-End](by-topic/tax-yearend.md) | [L584068](../../../ScriptDB/000_4_CreateSP.sql#L584068) | — | 1 / 1 | — |
| `UBRL3ProcessPendingTaggedItems` | [Tax & Year-End](by-topic/tax-yearend.md) | [L584323](../../../ScriptDB/000_4_CreateSP.sql#L584323) | — | 0 / 1 | — |
| `UBRL3SavePdfObj` | [Tax & Year-End](by-topic/tax-yearend.md) | [L584360](../../../ScriptDB/000_4_CreateSP.sql#L584360) | 1 / 1 file | 0 / 1 | [RL3Pdf.cs:205](../../../VieFUNDPdf/RL3Pdf.cs#L205) |
| `UBRL3SlipRelease` | [Tax & Year-End](by-topic/tax-yearend.md) | [L584393](../../../ScriptDB/000_4_CreateSP.sql#L584393) | — | 0 / 1 | — |
| `UBRLNextNumber` | [Shared / Other](by-topic/shared-other.md) | [L584512](../../../ScriptDB/000_4_CreateSP.sql#L584512) | — | 5 / 0 | — |
| `UBRORCalc` | [Shared / Other](by-topic/shared-other.md) | [L584624](../../../ScriptDB/000_4_CreateSP.sql#L584624) | — | 8 / 2 | — |
| `UBRORCalc1FundPos` | [Fund & GIC](by-topic/fund-gic.md) | [L585379](../../../ScriptDB/000_4_CreateSP.sql#L585379) | — | 12 / 2 | — |
| `UBRORCalcList` | [Shared / Other](by-topic/shared-other.md) | [L585777](../../../ScriptDB/000_4_CreateSP.sql#L585777) | — | 10 / 2 | — |
| `UBRORCalcListX` | [Shared / Other](by-topic/shared-other.md) | [L586623](../../../ScriptDB/000_4_CreateSP.sql#L586623) | — | 1 / 2 | — |
| `UBRORCalcPlan1Mgmt` | [Account & Plan](by-topic/account-plan.md) | [L587463](../../../ScriptDB/000_4_CreateSP.sql#L587463) | — | 1 / 1 | — |
| `UBRORCalcPlan1Type` | [Account & Plan](by-topic/account-plan.md) | [L587505](../../../ScriptDB/000_4_CreateSP.sql#L587505) | — | 1 / 1 | — |
| `UBRORCalcPosList` | [Shared / Other](by-topic/shared-other.md) | [L587550](../../../ScriptDB/000_4_CreateSP.sql#L587550) | — | 2 / 2 | — |
| `UBRORCalcX` | [Shared / Other](by-topic/shared-other.md) | [L588014](../../../ScriptDB/000_4_CreateSP.sql#L588014) | — | 1 / 2 | — |
| `UBRoRDefList` | [Shared / Other](by-topic/shared-other.md) | [L588771](../../../ScriptDB/000_4_CreateSP.sql#L588771) | — | 3 / 0 | — |
| `UBRRIFGetMinWHTRequired` | [Account & Plan](by-topic/account-plan.md) | [L588852](../../../ScriptDB/000_4_CreateSP.sql#L588852) | — | 0 / 2 | — |
| `UBRRIFGetMinWHTRequiredX` | [Account & Plan](by-topic/account-plan.md) | [L588915](../../../ScriptDB/000_4_CreateSP.sql#L588915) | — | 2 / 2 | — |
| `UBRRIFGetPlanMin` | [Account & Plan](by-topic/account-plan.md) | [L589001](../../../ScriptDB/000_4_CreateSP.sql#L589001) | — | 2 / 1 | — |
| `UBRRIFGetTotalAmountPaid` | [Account & Plan](by-topic/account-plan.md) | [L589023](../../../ScriptDB/000_4_CreateSP.sql#L589023) | 1 / 1 file | 0 / 0 | [RRIFSetting.cs:1239](../../../UBClasses/RRIFSetting.cs#L1239) |
| `UBRRIFListAll` | [Account & Plan](by-topic/account-plan.md) | [L589048](../../../ScriptDB/000_4_CreateSP.sql#L589048) | — | 0 / 0 | — |
| `UBRRIFListByProvinceAndType` | [Account & Plan](by-topic/account-plan.md) | [L589081](../../../ScriptDB/000_4_CreateSP.sql#L589081) | — | 0 / 0 | — |
| `UBRRIFMoveFund` | [Fund & GIC](by-topic/fund-gic.md) | [L589101](../../../ScriptDB/000_4_CreateSP.sql#L589101) | — | 0 / 0 | — |
| `UBRRIFPaymentOptList` | [Account & Plan](by-topic/account-plan.md) | [L589166](../../../ScriptDB/000_4_CreateSP.sql#L589166) | 1 / 1 file | 0 / 0 | [RRIFSetting.cs:245](../../../UBClasses/RRIFSetting.cs#L245) |
| `UBRRIFPlanEFTPending` | [Account & Plan](by-topic/account-plan.md) | [L589209](../../../ScriptDB/000_4_CreateSP.sql#L589209) | — | 0 / 1 | — |
| `UBRRIFPlanEFTPendingRemove` | [Account & Plan](by-topic/account-plan.md) | [L589664](../../../ScriptDB/000_4_CreateSP.sql#L589664) | 1 / 1 file | 0 / 0 | [RRIFSetting.cs:2394](../../../UBClasses/RRIFSetting.cs#L2394) |
| `UBRRIFPlanEFTProcessOneItem` | [Account & Plan](by-topic/account-plan.md) | [L589751](../../../ScriptDB/000_4_CreateSP.sql#L589751) | — | 2 / 6 | — |
| `UBRRIFPlanEFTProcessSelectedItem` | [Account & Plan](by-topic/account-plan.md) | [L590416](../../../ScriptDB/000_4_CreateSP.sql#L590416) | — | 0 / 1 | — |
| `UBRRIFPlanEFTProcessTaggedItems` | [Account & Plan](by-topic/account-plan.md) | [L590510](../../../ScriptDB/000_4_CreateSP.sql#L590510) | — | 0 / 1 | — |
| `UBRRIFPlanEFTSelectionUpdate` | [Account & Plan](by-topic/account-plan.md) | [L590599](../../../ScriptDB/000_4_CreateSP.sql#L590599) | — | 0 / 0 | — |
| `UBRRIFPlanGenerateWHTTrx` | [Account & Plan](by-topic/account-plan.md) | [L590640](../../../ScriptDB/000_4_CreateSP.sql#L590640) | — | 0 / 2 | — |
| `UBRRIFPlanList` | [Account & Plan](by-topic/account-plan.md) | [L590935](../../../ScriptDB/000_4_CreateSP.sql#L590935) | — | 0 / 1 | — |
| `UBRRIFPlanNoSettingList` | [Account & Plan](by-topic/account-plan.md) | [L591415](../../../ScriptDB/000_4_CreateSP.sql#L591415) | — | 0 / 0 | — |
| `UBRRIFPlanScanBank` | [Account & Plan](by-topic/account-plan.md) | [L591546](../../../ScriptDB/000_4_CreateSP.sql#L591546) | — | 0 / 0 | — |
| `UBRRIFPlanTrxPending` | [Account & Plan](by-topic/account-plan.md) | [L591611](../../../ScriptDB/000_4_CreateSP.sql#L591611) | — | 0 / 1 | — |
| `UBRRIFPlanTrxProcessOneItem` | [Account & Plan](by-topic/account-plan.md) | [L592014](../../../ScriptDB/000_4_CreateSP.sql#L592014) | — | 2 / 1 | — |
| `UBRRIFPlanTrxProcessSelectedItem` | [Account & Plan](by-topic/account-plan.md) | [L592318](../../../ScriptDB/000_4_CreateSP.sql#L592318) | — | 0 / 1 | — |
| `UBRRIFPlanTrxProcessTaggedItems` | [Account & Plan](by-topic/account-plan.md) | [L592372](../../../ScriptDB/000_4_CreateSP.sql#L592372) | — | 0 / 1 | — |
| `UBRRIFPlanTrxScan4CancelAll` | [Account & Plan](by-topic/account-plan.md) | [L592466](../../../ScriptDB/000_4_CreateSP.sql#L592466) | — | 0 / 1 | — |
| `UBRRIFPlanTrxScan4CancelOne` | [Account & Plan](by-topic/account-plan.md) | [L592494](../../../ScriptDB/000_4_CreateSP.sql#L592494) | — | 1 / 0 | — |
| `UBRRIFPlanTrxSelectionUpdate` | [Account & Plan](by-topic/account-plan.md) | [L592539](../../../ScriptDB/000_4_CreateSP.sql#L592539) | — | 0 / 0 | — |
| `UBRRIFPlanViewComboList` | [Account & Plan](by-topic/account-plan.md) | [L592576](../../../ScriptDB/000_4_CreateSP.sql#L592576) | — | 0 / 5 | — |
| `UBRRIFPlanWithMinList` | [Account & Plan](by-topic/account-plan.md) | [L592616](../../../ScriptDB/000_4_CreateSP.sql#L592616) | — | 0 / 0 | — |
| `UBRRIFRecalcMin1Plan` | [Account & Plan](by-topic/account-plan.md) | [L592640](../../../ScriptDB/000_4_CreateSP.sql#L592640) | — | 1 / 1 | — |
| `UBRRIFRecalcMinAllPlans` | [Account & Plan](by-topic/account-plan.md) | [L592709](../../../ScriptDB/000_4_CreateSP.sql#L592709) | — | 0 / 1 | — |
| `UBRRIFRecalcPlanTaxRate` | [Account & Plan](by-topic/account-plan.md) | [L592771](../../../ScriptDB/000_4_CreateSP.sql#L592771) | — | 3 / 1 | — |
| `UBRRIFRecalcPlanTaxRate2` | [Account & Plan](by-topic/account-plan.md) | [L592824](../../../ScriptDB/000_4_CreateSP.sql#L592824) | — | 0 / 0 | — |
| `UBRRIFRecalcSplit` | [Account & Plan](by-topic/account-plan.md) | [L592855](../../../ScriptDB/000_4_CreateSP.sql#L592855) | — | 2 / 0 | — |
| `UBRRIFRecalcSplitAll` | [Account & Plan](by-topic/account-plan.md) | [L592899](../../../ScriptDB/000_4_CreateSP.sql#L592899) | — | 0 / 1 | — |
| `UBRRIFRedemptionList` | [Account & Plan](by-topic/account-plan.md) | [L592930](../../../ScriptDB/000_4_CreateSP.sql#L592930) | 1 / 1 file | 0 / 1 | [RRIFSetting.cs:860](../../../UBClasses/RRIFSetting.cs#L860) |
| `UBRRIFSet_AMP_YOB` | [Account & Plan](by-topic/account-plan.md) | [L593195](../../../ScriptDB/000_4_CreateSP.sql#L593195) | — | 0 / 0 | — |
| `UBRRIFSettingClientList` | [Account & Plan](by-topic/account-plan.md) | [L593230](../../../ScriptDB/000_4_CreateSP.sql#L593230) | — | 0 / 0 | — |
| `UBRRIFSettingComboList` | [Account & Plan](by-topic/account-plan.md) | [L593273](../../../ScriptDB/000_4_CreateSP.sql#L593273) | — | 3 / 3 | — |
| `UBRRIFSettingFundAdd` | [Fund & GIC](by-topic/fund-gic.md) | [L593297](../../../ScriptDB/000_4_CreateSP.sql#L593297) | 1 / 1 file | 0 / 1 | [RRIFSetting.cs:714](../../../UBClasses/RRIFSetting.cs#L714) |
| `UBRRIFSettingFundList` | [Fund & GIC](by-topic/fund-gic.md) | [L593426](../../../ScriptDB/000_4_CreateSP.sql#L593426) | 1 / 1 file | 3 / 0 | [RRIFSetting.cs:316](../../../UBClasses/RRIFSetting.cs#L316) |
| `UBRRIFSettingInfo` | [Account & Plan](by-topic/account-plan.md) | [L593558](../../../ScriptDB/000_4_CreateSP.sql#L593558) | 1 / 1 file | 0 / 3 | [RRIFSetting.cs:365](../../../UBClasses/RRIFSetting.cs#L365) |
| `UBRRIFSettingInfoFund` | [Fund & GIC](by-topic/fund-gic.md) | [L593702](../../../ScriptDB/000_4_CreateSP.sql#L593702) | 1 / 1 file | 0 / 0 | [RRIFSetting.cs:413](../../../UBClasses/RRIFSetting.cs#L413) |
| `UBRRIFSettingPlanList` | [Account & Plan](by-topic/account-plan.md) | [L593729](../../../ScriptDB/000_4_CreateSP.sql#L593729) | — | 0 / 0 | — |
| `UBRRIFSettingRemove` | [Account & Plan](by-topic/account-plan.md) | [L593772](../../../ScriptDB/000_4_CreateSP.sql#L593772) | 1 / 1 file | 0 / 0 | [RRIFSetting.cs:666](../../../UBClasses/RRIFSetting.cs#L666) |
| `UBRRIFSettingRemoveFund` | [Fund & GIC](by-topic/fund-gic.md) | [L593814](../../../ScriptDB/000_4_CreateSP.sql#L593814) | 1 / 1 file | 0 / 1 | [RRIFSetting.cs:768](../../../UBClasses/RRIFSetting.cs#L768) |
| `UBRRIFSettingResetPending` | [Account & Plan](by-topic/account-plan.md) | [L593851](../../../ScriptDB/000_4_CreateSP.sql#L593851) | 1 / 1 file | 0 / 0 | [RRIFSetting.cs:2487](../../../UBClasses/RRIFSetting.cs#L2487) |
| `UBRRIFSettingSave` | [Account & Plan](by-topic/account-plan.md) | [L593927](../../../ScriptDB/000_4_CreateSP.sql#L593927) | 1 / 1 file | 0 / 4 | [RRIFSetting.cs:493](../../../UBClasses/RRIFSetting.cs#L493) |
| `UBRRIFSettingScheduleUpdate` | [Account & Plan](by-topic/account-plan.md) | [L594680](../../../ScriptDB/000_4_CreateSP.sql#L594680) | — | 1 / 0 | — |
| `UBRRIFSettingSetNextRunDate` | [Account & Plan](by-topic/account-plan.md) | [L594789](../../../ScriptDB/000_4_CreateSP.sql#L594789) | — | 0 / 0 | — |
| `UBRRIFSettingSummary` | [Account & Plan](by-topic/account-plan.md) | [L594811](../../../ScriptDB/000_4_CreateSP.sql#L594811) | — | 1 / 0 | — |
| `UBRRIFSettingUndo2024YOBRun` | [Account & Plan](by-topic/account-plan.md) | [L594873](../../../ScriptDB/000_4_CreateSP.sql#L594873) | — | 0 / 0 | — |
| `UBRRIFSettingUndo2025To2024YOBRun` | [Account & Plan](by-topic/account-plan.md) | [L594911](../../../ScriptDB/000_4_CreateSP.sql#L594911) | — | 0 / 0 | — |
| `UBRRIFSettingUnlock` | [Account & Plan](by-topic/account-plan.md) | [L594949](../../../ScriptDB/000_4_CreateSP.sql#L594949) | 1 / 1 file | 0 / 0 | [RRIFSetting.cs:2442](../../../UBClasses/RRIFSetting.cs#L2442) |
| `UBRRIFSettingVerify` | [Account & Plan](by-topic/account-plan.md) | [L594986](../../../ScriptDB/000_4_CreateSP.sql#L594986) | 1 / 1 file | 0 / 0 | [RRIFSetting.cs:814](../../../UBClasses/RRIFSetting.cs#L814) |
| `UBRRIFSetupComboList` | [Account & Plan](by-topic/account-plan.md) | [L595053](../../../ScriptDB/000_4_CreateSP.sql#L595053) | — | 0 / 2 | — |
| `UBRRIFTrustTrxMarkAsUsed` | [Account & Plan](by-topic/account-plan.md) | [L595202](../../../ScriptDB/000_4_CreateSP.sql#L595202) | — | 1 / 0 | — |
| `UBRRIFYOB1Plan` | [Account & Plan](by-topic/account-plan.md) | [L595226](../../../ScriptDB/000_4_CreateSP.sql#L595226) | — | 7 / 7 | — |
| `UBRRIFYOB1PlanMin` | [Account & Plan](by-topic/account-plan.md) | [L595919](../../../ScriptDB/000_4_CreateSP.sql#L595919) | — | 1 / 2 | — |
| `UBRRIFYOBAdd` | [Account & Plan](by-topic/account-plan.md) | [L595986](../../../ScriptDB/000_4_CreateSP.sql#L595986) | — | 3 / 0 | — |
| `UBRRIFYOBAll` | [Account & Plan](by-topic/account-plan.md) | [L596019](../../../ScriptDB/000_4_CreateSP.sql#L596019) | — | 0 / 1 | — |
| `UBRRIFYOBAll_RLIFOnly` | [Account & Plan](by-topic/account-plan.md) | [L596068](../../../ScriptDB/000_4_CreateSP.sql#L596068) | — | 0 / 1 | — |
| `UBRRIFYOBAll_SpecNetAmountFix2024` | [Account & Plan](by-topic/account-plan.md) | [L596117](../../../ScriptDB/000_4_CreateSP.sql#L596117) | — | 0 / 1 | — |
| `UBRRIFYOBAllOneProvLIF` | [Account & Plan](by-topic/account-plan.md) | [L596169](../../../ScriptDB/000_4_CreateSP.sql#L596169) | — | 0 / 1 | — |
| `UBRRIFYOBPlan` | [Account & Plan](by-topic/account-plan.md) | [L596217](../../../ScriptDB/000_4_CreateSP.sql#L596217) | 1 / 1 file | 0 / 1 | [RRIFSetting.cs:1425](../../../UBClasses/RRIFSetting.cs#L1425) |
| `UBRRSP4XML` | [Account & Plan](by-topic/account-plan.md) | [L596298](../../../ScriptDB/000_4_CreateSP.sql#L596298) | — | 1 / 1 | — |
| `UBRRSPApprove2Pending` | [Account & Plan](by-topic/account-plan.md) | [L596428](../../../ScriptDB/000_4_CreateSP.sql#L596428) | — | 0 / 0 | — |
| `UBRRSPApprovedList` | [Account & Plan](by-topic/account-plan.md) | [L596482](../../../ScriptDB/000_4_CreateSP.sql#L596482) | — | 0 / 1 | — |
| `UBRRSPApprovedSelectionUpdate` | [Account & Plan](by-topic/account-plan.md) | [L596792](../../../ScriptDB/000_4_CreateSP.sql#L596792) | — | 0 / 0 | — |
| `UBRRSPCancelItem` | [Account & Plan](by-topic/account-plan.md) | [L596828](../../../ScriptDB/000_4_CreateSP.sql#L596828) | — | 0 / 0 | — |
| `UBRRSPFileDetailList` | [Account & Plan](by-topic/account-plan.md) | [L596881](../../../ScriptDB/000_4_CreateSP.sql#L596881) | — | 0 / 0 | — |
| `UBRRSPFileList` | [Account & Plan](by-topic/account-plan.md) | [L596947](../../../ScriptDB/000_4_CreateSP.sql#L596947) | — | 0 / 1 | — |
| `UBRRSPFixCancelRecord` | [Account & Plan](by-topic/account-plan.md) | [L596961](../../../ScriptDB/000_4_CreateSP.sql#L596961) | — | 0 / 0 | — |
| `UBRRSPItemStatusUpdate` | [Account & Plan](by-topic/account-plan.md) | [L596998](../../../ScriptDB/000_4_CreateSP.sql#L596998) | — | 0 / 0 | — |
| `UBRRSPPendingList` | [Account & Plan](by-topic/account-plan.md) | [L597013](../../../ScriptDB/000_4_CreateSP.sql#L597013) | — | 0 / 1 | — |
| `UBRRSPPendingSelectionUpdate` | [Account & Plan](by-topic/account-plan.md) | [L597251](../../../ScriptDB/000_4_CreateSP.sql#L597251) | — | 0 / 0 | — |
| `UBRRSPProcessOneItem` | [Account & Plan](by-topic/account-plan.md) | [L597287](../../../ScriptDB/000_4_CreateSP.sql#L597287) | — | 1 / 0 | — |
| `UBRRSPProcessPendingTaggedItems` | [Account & Plan](by-topic/account-plan.md) | [L597454](../../../ScriptDB/000_4_CreateSP.sql#L597454) | — | 0 / 1 | — |
| `UBRRSPReceiptDetail` | [Account & Plan](by-topic/account-plan.md) | [L597491](../../../ScriptDB/000_4_CreateSP.sql#L597491) | 1 / 1 file | 0 / 3 | [CRRSPReceipt.cs:684](../../../VieFUNDPdf/CRRSPReceipt.cs#L684) |
| `UBRRSPReceiptDetailUpdateInfo` | [Account & Plan](by-topic/account-plan.md) | [L597622](../../../ScriptDB/000_4_CreateSP.sql#L597622) | — | 3 / 0 | — |
| `UBRRSPReceiptInfo` | [Account & Plan](by-topic/account-plan.md) | [L597743](../../../ScriptDB/000_4_CreateSP.sql#L597743) | 1 / 1 file | 0 / 1 | [TaxReceipt.cs:330](../../../UBClasses/TaxReceipt.cs#L330) |
| `UBRRSPReceiptSaveObj` | [Account & Plan](by-topic/account-plan.md) | [L597805](../../../ScriptDB/000_4_CreateSP.sql#L597805) | 1 / 1 file | 0 / 1 | [CRRSPReceipt.cs:728](../../../VieFUNDPdf/CRRSPReceipt.cs#L728) |
| `UBRRSPReceiptVoid` | [Account & Plan](by-topic/account-plan.md) | [L597839](../../../ScriptDB/000_4_CreateSP.sql#L597839) | — | 0 / 0 | — |
| `UBRRSPRestoreSubmitted` | [Account & Plan](by-topic/account-plan.md) | [L597887](../../../ScriptDB/000_4_CreateSP.sql#L597887) | — | 0 / 0 | — |
| `UBRRSPScanAll` | [Account & Plan](by-topic/account-plan.md) | [L597920](../../../ScriptDB/000_4_CreateSP.sql#L597920) | — | 0 / 1 | — |
| `UBRRSPScanOneItem` | [Account & Plan](by-topic/account-plan.md) | [L597951](../../../ScriptDB/000_4_CreateSP.sql#L597951) | — | 1 / 0 | — |
| `UBRSPTaxReceiptPlanID` | [Account & Plan](by-topic/account-plan.md) | [L598093](../../../ScriptDB/000_4_CreateSP.sql#L598093) | 1 / 1 file | 0 / 0 | [TaxReceipt.cs:602](../../../UBClasses/TaxReceipt.cs#L602) |
| `UBSavePdfObj` | [Documents & PDF](by-topic/documents-pdf.md) | [L598109](../../../ScriptDB/000_4_CreateSP.sql#L598109) | — | 17 / 0 | — |
| `UBSaveSettings` | [Shared / Other](by-topic/shared-other.md) | [L598136](../../../ScriptDB/000_4_CreateSP.sql#L598136) | 2 / 2 file | 29 / 0 | [CBase.cs:1355](../../../UBClasses/CBase.cs#L1355) |
| `UBScanPACBankAccount` | [Account & Plan](by-topic/account-plan.md) | [L598172](../../../ScriptDB/000_4_CreateSP.sql#L598172) | — | 0 / 0 | — |
| `UBScheduleGenerate` | [Shared / Other](by-topic/shared-other.md) | [L598260](../../../ScriptDB/000_4_CreateSP.sql#L598260) | — | 0 / 1 | — |
| `UBScheduleGenerateOne` | [Shared / Other](by-topic/shared-other.md) | [L598320](../../../ScriptDB/000_4_CreateSP.sql#L598320) | — | 2 / 3 | — |
| `UBScheduleGenerateOneUI` | [Shared / Other](by-topic/shared-other.md) | [L598551](../../../ScriptDB/000_4_CreateSP.sql#L598551) | 1 / 1 file | 0 / 1 | [Plan.cs:1880](../../../UBClasses/Plan.cs#L1880) |
| `UBScheduleRemoveLastRunOne` | [Shared / Other](by-topic/shared-other.md) | [L598576](../../../ScriptDB/000_4_CreateSP.sql#L598576) | 1 / 1 file | 0 / 1 | [Plan.cs:1921](../../../UBClasses/Plan.cs#L1921) |
| `UBScheduleRunList` | [Shared / Other](by-topic/shared-other.md) | [L598686](../../../ScriptDB/000_4_CreateSP.sql#L598686) | 1 / 1 file | 0 / 0 | [Trx.cs:6086](../../../UBClasses/Trx.cs#L6086) |
| `UBScheduleRunRemove` | [Shared / Other](by-topic/shared-other.md) | [L598713](../../../ScriptDB/000_4_CreateSP.sql#L598713) | — | 0 / 1 | — |
| `UBSegFundInfo` | [Fund & GIC](by-topic/fund-gic.md) | [L598758](../../../ScriptDB/000_4_CreateSP.sql#L598758) | — | 1 / 0 | — |
| `UBSegFundInfoUpdate` | [Fund & GIC](by-topic/fund-gic.md) | [L598797](../../../ScriptDB/000_4_CreateSP.sql#L598797) | — | 2 / 0 | — |
| `UBServiceFeeByRepIDCalc` | [Commission & Fee](by-topic/commission-fee.md) | [L598895](../../../ScriptDB/000_4_CreateSP.sql#L598895) | — | 0 / 0 | — |
| `UBServiceFeeSearch` | [Commission & Fee](by-topic/commission-fee.md) | [L599076](../../../ScriptDB/000_4_CreateSP.sql#L599076) | 1 / 1 file | 0 / 1 | [FundAccount.cs:2572](../../../UBClasses/FundAccount.cs#L2572) |
| `UBServiceOnTimerFirstTime` | [Shared / Other](by-topic/shared-other.md) | [L599758](../../../ScriptDB/000_4_CreateSP.sql#L599758) | 1 / 1 file | 0 / 0 | [CDatabase.cs:1718](../../../UBConnection/CDatabase.cs#L1718) |
| `UBServicesStats` | [Shared / Other](by-topic/shared-other.md) | [L599792](../../../ScriptDB/000_4_CreateSP.sql#L599792) | 1 / 1 file | 0 / 0 | [CBase.cs:7819](../../../UBClasses/CBase.cs#L7819) |
| `UBSessionEnd` | [Security & Auth](by-topic/security-auth.md) | [L599932](../../../ScriptDB/000_4_CreateSP.sql#L599932) | 1 / 1 file | 0 / 2 | [CBase.cs:3059](../../../UBClasses/CBase.cs#L3059) |
| `UBSessionExpired` | [Security & Auth](by-topic/security-auth.md) | [L599971](../../../ScriptDB/000_4_CreateSP.sql#L599971) | 3 / 1 file | 0 / 0 | [CBase.cs:4417](../../../UBClasses/CBase.cs#L4417) |
| `UBSessionIsExpired` | [Security & Auth](by-topic/security-auth.md) | [L599996](../../../ScriptDB/000_4_CreateSP.sql#L599996) | — | 0 / 0 | — |
| `UBSetEnvelopeToSignority` | [Shared / Other](by-topic/shared-other.md) | [L600027](../../../ScriptDB/000_4_CreateSP.sql#L600027) | 2 / 2 file | 0 / 0 | [ESignature.cs:527](../../../UBClasses/ESignature.cs#L527) |
| `UBSetOrderSchema` | [Trading & Orders](by-topic/trading-orders.md) | [L600042](../../../ScriptDB/000_4_CreateSP.sql#L600042) | — | 0 / 0 | — |
| `UBSettingList` | [Shared / Other](by-topic/shared-other.md) | [L600071](../../../ScriptDB/000_4_CreateSP.sql#L600071) | 1 / 1 file | 0 / 0 | [CBase.cs:1407](../../../UBClasses/CBase.cs#L1407) |
| `UBSettingUpdateValue` | [Shared / Other](by-topic/shared-other.md) | [L600109](../../../ScriptDB/000_4_CreateSP.sql#L600109) | — | 2 / 0 | — |
| `UBSettingUpdateValueInt` | [Shared / Other](by-topic/shared-other.md) | [L600149](../../../ScriptDB/000_4_CreateSP.sql#L600149) | — | 3 / 1 | — |
| `UBSettingValue` | [Shared / Other](by-topic/shared-other.md) | [L600171](../../../ScriptDB/000_4_CreateSP.sql#L600171) | 2 / 2 file | 0 / 0 | [CBase.cs:1236](../../../UBClasses/CBase.cs#L1236) |
| `UBSettingValue2` | [Shared / Other](by-topic/shared-other.md) | [L600216](../../../ScriptDB/000_4_CreateSP.sql#L600216) | — | 0 / 0 | — |
| `UBSettleViewComboList` | [Shared / Other](by-topic/shared-other.md) | [L600260](../../../ScriptDB/000_4_CreateSP.sql#L600260) | — | 0 / 11 | — |
| `UBSetupComplianceComboList` | [Compliance](by-topic/compliance.md) | [L600377](../../../ScriptDB/000_4_CreateSP.sql#L600377) | — | 0 / 7 | — |
| `UBSetupDSComboList` | [Shared / Other](by-topic/shared-other.md) | [L600415](../../../ScriptDB/000_4_CreateSP.sql#L600415) | — | 0 / 7 | — |
| `UBSexList` | [Shared / Other](by-topic/shared-other.md) | [L600447](../../../ScriptDB/000_4_CreateSP.sql#L600447) | — | 5 / 0 | — |
| `UBSignorityEnvelopeListOneClient` | [Client & KYC](by-topic/client-kyc.md) | [L600481](../../../ScriptDB/000_4_CreateSP.sql#L600481) | 2 / 2 file | 0 / 1 | [ESignature.cs:278](../../../UBClasses/ESignature.cs#L278) |
| `UBSignorityEnvelopeRecipientStatusUpdate` | [Shared / Other](by-topic/shared-other.md) | [L600531](../../../ScriptDB/000_4_CreateSP.sql#L600531) | 2 / 2 file | 0 / 0 | [ESignature.cs:610](../../../UBClasses/ESignature.cs#L610) |
| `UBSignorityEnvelopeSetStatus` | [Shared / Other](by-topic/shared-other.md) | [L600565](../../../ScriptDB/000_4_CreateSP.sql#L600565) | 2 / 2 file | 0 / 1 | [ESignature.cs:386](../../../UBClasses/ESignature.cs#L386) |
| `UBSplit2IntStr` | [Shared / Other](by-topic/shared-other.md) | [L600601](../../../ScriptDB/000_4_CreateSP.sql#L600601) | — | 0 / 0 | — |
| `UBSplit2Str` | [Shared / Other](by-topic/shared-other.md) | [L600646](../../../ScriptDB/000_4_CreateSP.sql#L600646) | — | 13 / 0 | — |
| `UBSplit2Str2` | [Shared / Other](by-topic/shared-other.md) | [L600699](../../../ScriptDB/000_4_CreateSP.sql#L600699) | — | 0 / 1 | — |
| `UBSplit2StrLast` | [Shared / Other](by-topic/shared-other.md) | [L600727](../../../ScriptDB/000_4_CreateSP.sql#L600727) | — | 0 / 0 | — |
| `UBSQLErrorInfo` | [Shared / Other](by-topic/shared-other.md) | [L600771](../../../ScriptDB/000_4_CreateSP.sql#L600771) | — | 21 / 0 | — |
| `UBStartPageList` | [Shared / Other](by-topic/shared-other.md) | [L600819](../../../ScriptDB/000_4_CreateSP.sql#L600819) | — | 1 / 0 | — |
| `UBStartUpComboList` | [Shared / Other](by-topic/shared-other.md) | [L600855](../../../ScriptDB/000_4_CreateSP.sql#L600855) | — | 0 / 1 | — |
| `UBStartupCountry` | [Shared / Other](by-topic/shared-other.md) | [L600871](../../../ScriptDB/000_4_CreateSP.sql#L600871) | — | 0 / 0 | — |
| `UBStartupProvince` | [Shared / Other](by-topic/shared-other.md) | [L601163](../../../ScriptDB/000_4_CreateSP.sql#L601163) | — | 0 / 0 | — |
| `UBStmtDeliveryList` | [Shared / Other](by-topic/shared-other.md) | [L601264](../../../ScriptDB/000_4_CreateSP.sql#L601264) | — | 8 / 0 | — |
| `UBStmtDeliveryListX` | [Shared / Other](by-topic/shared-other.md) | [L601291](../../../ScriptDB/000_4_CreateSP.sql#L601291) | — | 1 / 0 | — |
| `UBStmtGroupList` | [Shared / Other](by-topic/shared-other.md) | [L601328](../../../ScriptDB/000_4_CreateSP.sql#L601328) | — | 3 / 0 | — |
| `UBStmtTypeList` | [Shared / Other](by-topic/shared-other.md) | [L601355](../../../ScriptDB/000_4_CreateSP.sql#L601355) | — | 3 / 0 | — |
| `UBStockAccountAdd` | [Account & Plan](by-topic/account-plan.md) | [L601382](../../../ScriptDB/000_4_CreateSP.sql#L601382) | 1 / 1 file | 0 / 1 | [Stock.cs:39](../../../UBClasses/Stock.cs#L39) |
| `UBStockAccountCalcAveragedCost` | [Account & Plan](by-topic/account-plan.md) | [L601447](../../../ScriptDB/000_4_CreateSP.sql#L601447) | — | 0 / 0 | — |
| `UBStockAccountHeaderInfo` | [Account & Plan](by-topic/account-plan.md) | [L601476](../../../ScriptDB/000_4_CreateSP.sql#L601476) | 1 / 1 file | 1 / 0 | [Stock.cs:312](../../../UBClasses/Stock.cs#L312) |
| `UBStockAccountInfo` | [Account & Plan](by-topic/account-plan.md) | [L601517](../../../ScriptDB/000_4_CreateSP.sql#L601517) | 1 / 1 file | 0 / 0 | [Stock.cs:213](../../../UBClasses/Stock.cs#L213) |
| `UBStockAccountRefresh` | [Account & Plan](by-topic/account-plan.md) | [L601592](../../../ScriptDB/000_4_CreateSP.sql#L601592) | — | 1 / 0 | — |
| `UBStockAccountRemove` | [Account & Plan](by-topic/account-plan.md) | [L601644](../../../ScriptDB/000_4_CreateSP.sql#L601644) | 1 / 1 file | 0 / 1 | [Stock.cs:462](../../../UBClasses/Stock.cs#L462) |
| `UBStockAccountTrxCalc` | [Account & Plan](by-topic/account-plan.md) | [L601667](../../../ScriptDB/000_4_CreateSP.sql#L601667) | 1 / 1 file | 0 / 0 | [Stock.cs:362](../../../UBClasses/Stock.cs#L362) |
| `UBStockAccountUpdate` | [Account & Plan](by-topic/account-plan.md) | [L601733](../../../ScriptDB/000_4_CreateSP.sql#L601733) | 1 / 1 file | 0 / 2 | [Stock.cs:39](../../../UBClasses/Stock.cs#L39) |
| `UBStockListOnePlan` | [Account & Plan](by-topic/account-plan.md) | [L601808](../../../ScriptDB/000_4_CreateSP.sql#L601808) | 1 / 1 file | 0 / 0 | [Stock.cs:106](../../../UBClasses/Stock.cs#L106) |
| `UBStockMarketList` | [Shared / Other](by-topic/shared-other.md) | [L601870](../../../ScriptDB/000_4_CreateSP.sql#L601870) | — | 1 / 0 | — |
| `UBStockOrderAdd` | [Trading & Orders](by-topic/trading-orders.md) | [L601897](../../../ScriptDB/000_4_CreateSP.sql#L601897) | 1 / 1 file | 0 / 6 | [Trx.cs:759](../../../UBClasses/Trx.cs#L759) |
| `UBStockOrderTypeList` | [Trading & Orders](by-topic/trading-orders.md) | [L602156](../../../ScriptDB/000_4_CreateSP.sql#L602156) | — | 0 / 0 | — |
| `UBStockTrxAdd` | [Trading & Orders](by-topic/trading-orders.md) | [L602177](../../../ScriptDB/000_4_CreateSP.sql#L602177) | 1 / 1 file | 0 / 2 | [Stock.cs:556](../../../UBClasses/Stock.cs#L556) |
| `UBStockTrxCalcSAmount` | [Trading & Orders](by-topic/trading-orders.md) | [L602389](../../../ScriptDB/000_4_CreateSP.sql#L602389) | — | 2 / 0 | — |
| `UBStockTrxInfo` | [Trading & Orders](by-topic/trading-orders.md) | [L602448](../../../ScriptDB/000_4_CreateSP.sql#L602448) | 1 / 1 file | 0 / 1 | [Stock.cs:414](../../../UBClasses/Stock.cs#L414) |
| `UBStockTrxList` | [Trading & Orders](by-topic/trading-orders.md) | [L602493](../../../ScriptDB/000_4_CreateSP.sql#L602493) | 1 / 1 file | 0 / 0 | [Stock.cs:262](../../../UBClasses/Stock.cs#L262) |
| `UBStockTrxRemove` | [Trading & Orders](by-topic/trading-orders.md) | [L602544](../../../ScriptDB/000_4_CreateSP.sql#L602544) | 1 / 1 file | 0 / 2 | [Stock.cs:505](../../../UBClasses/Stock.cs#L505) |
| `UBStockTrxUpdate` | [Trading & Orders](by-topic/trading-orders.md) | [L602568](../../../ScriptDB/000_4_CreateSP.sql#L602568) | 1 / 1 file | 0 / 1 | [Stock.cs:556](../../../UBClasses/Stock.cs#L556) |
| `UBSysID` | [Shared / Other](by-topic/shared-other.md) | [L602710](../../../ScriptDB/000_4_CreateSP.sql#L602710) | — | 1 / 0 | — |
| `UBSysID1912` | [Shared / Other](by-topic/shared-other.md) | [L602886](../../../ScriptDB/000_4_CreateSP.sql#L602886) | — | 1 / 0 | — |
| `UBSysIDCode` | [Shared / Other](by-topic/shared-other.md) | [L602976](../../../ScriptDB/000_4_CreateSP.sql#L602976) | — | 0 / 0 | — |
| `UBSysIDGICTrxCode` | [Fund & GIC](by-topic/fund-gic.md) | [L603004](../../../ScriptDB/000_4_CreateSP.sql#L603004) | — | 8 / 0 | — |
| `UBSysIDTrxCode` | [Trading & Orders](by-topic/trading-orders.md) | [L603020](../../../ScriptDB/000_4_CreateSP.sql#L603020) | — | 40 / 0 | — |
| `UBSysPlanComboList` | [Account & Plan](by-topic/account-plan.md) | [L603046](../../../ScriptDB/000_4_CreateSP.sql#L603046) | — | 0 / 7 | — |
| `UBSysPlanDelete` | [Account & Plan](by-topic/account-plan.md) | [L603082](../../../ScriptDB/000_4_CreateSP.sql#L603082) | 1 / 1 file | 0 / 2 | [Plan.cs:3799](../../../UBClasses/Plan.cs#L3799) |
| `UBSysPlanEFTPendingAWD` | [Account & Plan](by-topic/account-plan.md) | [L603148](../../../ScriptDB/000_4_CreateSP.sql#L603148) | — | 0 / 1 | — |
| `UBSysPlanEFTPendingCASH` | [Account & Plan](by-topic/account-plan.md) | [L603450](../../../ScriptDB/000_4_CreateSP.sql#L603450) | — | 0 / 1 | — |
| `UBSysPlanEFTPendingPAC` | [Account & Plan](by-topic/account-plan.md) | [L603989](../../../ScriptDB/000_4_CreateSP.sql#L603989) | — | 0 / 1 | — |
| `UBSysPlanEFTProcessDailyItemsCASH` | [Account & Plan](by-topic/account-plan.md) | [L604435](../../../ScriptDB/000_4_CreateSP.sql#L604435) | — | 0 / 1 | — |
| `UBSysPlanEFTProcessOneItemAWD` | [Account & Plan](by-topic/account-plan.md) | [L604555](../../../ScriptDB/000_4_CreateSP.sql#L604555) | — | 2 / 2 | — |
| `UBSysPlanEFTProcessOneItemCASH` | [Account & Plan](by-topic/account-plan.md) | [L604886](../../../ScriptDB/000_4_CreateSP.sql#L604886) | — | 3 / 3 | — |
| `UBSysPlanEFTProcessOneItemPAC` | [Account & Plan](by-topic/account-plan.md) | [L605102](../../../ScriptDB/000_4_CreateSP.sql#L605102) | — | 2 / 3 | — |
| `UBSysPlanEFTProcessSelectedItemAWD` | [Account & Plan](by-topic/account-plan.md) | [L605378](../../../ScriptDB/000_4_CreateSP.sql#L605378) | — | 0 / 1 | — |
| `UBSysPlanEFTProcessSelectedItemCASH` | [Account & Plan](by-topic/account-plan.md) | [L605468](../../../ScriptDB/000_4_CreateSP.sql#L605468) | — | 0 / 1 | — |
| `UBSysPlanEFTProcessSelectedItemPAC` | [Account & Plan](by-topic/account-plan.md) | [L605558](../../../ScriptDB/000_4_CreateSP.sql#L605558) | — | 0 / 1 | — |
| `UBSysPlanEFTProcessTaggedItemsAWD` | [Account & Plan](by-topic/account-plan.md) | [L605648](../../../ScriptDB/000_4_CreateSP.sql#L605648) | — | 0 / 1 | — |
| `UBSysPlanEFTProcessTaggedItemsCASH` | [Account & Plan](by-topic/account-plan.md) | [L605747](../../../ScriptDB/000_4_CreateSP.sql#L605747) | — | 0 / 1 | — |
| `UBSysPlanEFTProcessTaggedItemsPAC` | [Account & Plan](by-topic/account-plan.md) | [L605837](../../../ScriptDB/000_4_CreateSP.sql#L605837) | — | 0 / 1 | — |
| `UBSysPlanEFTSchedule` | [Account & Plan](by-topic/account-plan.md) | [L605935](../../../ScriptDB/000_4_CreateSP.sql#L605935) | — | 0 / 0 | — |
| `UBSysPlanEFTSelectionUpdate` | [Account & Plan](by-topic/account-plan.md) | [L606003](../../../ScriptDB/000_4_CreateSP.sql#L606003) | — | 0 / 0 | — |
| `UBSysPlanEFTUndoOneItemCASH` | [Account & Plan](by-topic/account-plan.md) | [L606048](../../../ScriptDB/000_4_CreateSP.sql#L606048) | — | 0 / 1 | — |
| `UBSysPlanEFTUndoOneItemPAC` | [Account & Plan](by-topic/account-plan.md) | [L606114](../../../ScriptDB/000_4_CreateSP.sql#L606114) | — | 0 / 1 | — |
| `UBSysPlanFundIDAdd` | [Fundserv & Import](by-topic/fundserv-import.md) | [L606175](../../../ScriptDB/000_4_CreateSP.sql#L606175) | — | 0 / 1 | — |
| `UBSysPlanFundIDRemove` | [Fundserv & Import](by-topic/fundserv-import.md) | [L606402](../../../ScriptDB/000_4_CreateSP.sql#L606402) | — | 0 / 1 | — |
| `UBSysPlanList` | [Account & Plan](by-topic/account-plan.md) | [L606456](../../../ScriptDB/000_4_CreateSP.sql#L606456) | 1 / 1 file | 1 / 0 | [Plan.cs:1964](../../../UBClasses/Plan.cs#L1964) |
| `UBSysPlanPACWaiting2SendRestore` | [Account & Plan](by-topic/account-plan.md) | [L606523](../../../ScriptDB/000_4_CreateSP.sql#L606523) | — | 0 / 0 | — |
| `UBSysPlanRefreshFundPosition` | [Fund & GIC](by-topic/fund-gic.md) | [L606555](../../../ScriptDB/000_4_CreateSP.sql#L606555) | — | 1 / 0 | — |
| `UBSysPlanScan4StopDate` | [Account & Plan](by-topic/account-plan.md) | [L606586](../../../ScriptDB/000_4_CreateSP.sql#L606586) | — | 0 / 0 | — |
| `UBSysPlanScanBank` | [Account & Plan](by-topic/account-plan.md) | [L606620](../../../ScriptDB/000_4_CreateSP.sql#L606620) | — | 0 / 0 | — |
| `UBSysPlanSelectionUpdate` | [Account & Plan](by-topic/account-plan.md) | [L606685](../../../ScriptDB/000_4_CreateSP.sql#L606685) | — | 0 / 0 | — |
| `UBSysPlanStatusList` | [Account & Plan](by-topic/account-plan.md) | [L606726](../../../ScriptDB/000_4_CreateSP.sql#L606726) | — | 6 / 0 | — |
| `UBSysPlanTMPEnd` | [Account & Plan](by-topic/account-plan.md) | [L606756](../../../ScriptDB/000_4_CreateSP.sql#L606756) | — | 0 / 0 | — |
| `UBSysPlanTrustProcessOneItemPAC` | [Account & Plan](by-topic/account-plan.md) | [L606788](../../../ScriptDB/000_4_CreateSP.sql#L606788) | — | 1 / 1 | — |
| `UBSysPlanTrxList` | [Account & Plan](by-topic/account-plan.md) | [L606861](../../../ScriptDB/000_4_CreateSP.sql#L606861) | 1 / 1 file | 0 / 0 | [Plan.cs:1828](../../../UBClasses/Plan.cs#L1828) |
| `UBSysPlanTrxPendingAWD` | [Account & Plan](by-topic/account-plan.md) | [L606934](../../../ScriptDB/000_4_CreateSP.sql#L606934) | — | 0 / 1 | — |
| `UBSysPlanTrxPendingPAC` | [Account & Plan](by-topic/account-plan.md) | [L607381](../../../ScriptDB/000_4_CreateSP.sql#L607381) | — | 0 / 1 | — |
| `UBSysPlanTrxProcessOneItemAWD` | [Account & Plan](by-topic/account-plan.md) | [L607698](../../../ScriptDB/000_4_CreateSP.sql#L607698) | — | 2 / 2 | — |
| `UBSysPlanTrxProcessOneItemPAC` | [Account & Plan](by-topic/account-plan.md) | [L607981](../../../ScriptDB/000_4_CreateSP.sql#L607981) | — | 2 / 2 | — |
| `UBSysPlanTrxProcessSelectedItemAWD` | [Account & Plan](by-topic/account-plan.md) | [L608157](../../../ScriptDB/000_4_CreateSP.sql#L608157) | — | 0 / 1 | — |
| `UBSysPlanTrxProcessSelectedItemPAC` | [Account & Plan](by-topic/account-plan.md) | [L608214](../../../ScriptDB/000_4_CreateSP.sql#L608214) | — | 0 / 1 | — |
| `UBSysPlanTrxProcessTaggedItemsAWD` | [Account & Plan](by-topic/account-plan.md) | [L608266](../../../ScriptDB/000_4_CreateSP.sql#L608266) | — | 0 / 1 | — |
| `UBSysPlanTrxProcessTaggedItemsPAC` | [Account & Plan](by-topic/account-plan.md) | [L608361](../../../ScriptDB/000_4_CreateSP.sql#L608361) | — | 0 / 1 | — |
| `UBSysPlanTrxRollBackOneItemPAC` | [Account & Plan](by-topic/account-plan.md) | [L608450](../../../ScriptDB/000_4_CreateSP.sql#L608450) | — | 2 / 0 | — |
| `UBSysPlanTrxSelectionUpdate` | [Account & Plan](by-topic/account-plan.md) | [L608488](../../../ScriptDB/000_4_CreateSP.sql#L608488) | — | 0 / 0 | — |
| `UBSysPlanViewComboList` | [Account & Plan](by-topic/account-plan.md) | [L608525](../../../ScriptDB/000_4_CreateSP.sql#L608525) | — | 0 / 7 | — |
| `UBSysTypeList` | [Shared / Other](by-topic/shared-other.md) | [L608560](../../../ScriptDB/000_4_CreateSP.sql#L608560) | — | 4 / 0 | — |
| `UBT34XML` | [Tax & Year-End](by-topic/tax-yearend.md) | [L608601](../../../ScriptDB/000_4_CreateSP.sql#L608601) | — | 1 / 1 | — |
| `UBT3Approve2Pending` | [Tax & Year-End](by-topic/tax-yearend.md) | [L608893](../../../ScriptDB/000_4_CreateSP.sql#L608893) | — | 0 / 0 | — |
| `UBT3ApprovedList` | [Tax & Year-End](by-topic/tax-yearend.md) | [L608948](../../../ScriptDB/000_4_CreateSP.sql#L608948) | — | 0 / 1 | — |
| `UBT3ApprovedSelectionUpdate` | [Tax & Year-End](by-topic/tax-yearend.md) | [L609381](../../../ScriptDB/000_4_CreateSP.sql#L609381) | — | 0 / 0 | — |
| `UBT3CancelItem` | [Tax & Year-End](by-topic/tax-yearend.md) | [L609417](../../../ScriptDB/000_4_CreateSP.sql#L609417) | — | 0 / 0 | — |
| `UBT3FileDetailList` | [Tax & Year-End](by-topic/tax-yearend.md) | [L609480](../../../ScriptDB/000_4_CreateSP.sql#L609480) | — | 0 / 0 | — |
| `UBT3FileList` | [Tax & Year-End](by-topic/tax-yearend.md) | [L609546](../../../ScriptDB/000_4_CreateSP.sql#L609546) | — | 0 / 1 | — |
| `UBT3FixCancelRecord` | [Tax & Year-End](by-topic/tax-yearend.md) | [L609560](../../../ScriptDB/000_4_CreateSP.sql#L609560) | — | 0 / 0 | — |
| `UBT3GR_PlanCount` | [Tax & Year-End](by-topic/tax-yearend.md) | [L609597](../../../ScriptDB/000_4_CreateSP.sql#L609597) | — | 0 / 1 | — |
| `UBT3IDList` | [Tax & Year-End](by-topic/tax-yearend.md) | [L609742](../../../ScriptDB/000_4_CreateSP.sql#L609742) | 1 / 1 file | 0 / 0 | [T3Pdf.cs:243](../../../VieFUNDPdf/T3Pdf.cs#L243) |
| `UBT3ItemInfo` | [Tax & Year-End](by-topic/tax-yearend.md) | [L609772](../../../ScriptDB/000_4_CreateSP.sql#L609772) | — | 0 / 1 | — |
| `UBT3ItemInfoUpdate` | [Tax & Year-End](by-topic/tax-yearend.md) | [L610199](../../../ScriptDB/000_4_CreateSP.sql#L610199) | — | 0 / 0 | — |
| `UBT3OmnibusItemInfo` | [Tax & Year-End](by-topic/tax-yearend.md) | [L610256](../../../ScriptDB/000_4_CreateSP.sql#L610256) | — | 0 / 0 | — |
| `UBT3OmnibusItemUpdateBoxes` | [Tax & Year-End](by-topic/tax-yearend.md) | [L610280](../../../ScriptDB/000_4_CreateSP.sql#L610280) | — | 0 / 0 | — |
| `UBT3OmnibusItemUpdateDividend` | [Tax & Year-End](by-topic/tax-yearend.md) | [L610347](../../../ScriptDB/000_4_CreateSP.sql#L610347) | — | 0 / 0 | — |
| `UBT3OmnibusList` | [Tax & Year-End](by-topic/tax-yearend.md) | [L610499](../../../ScriptDB/000_4_CreateSP.sql#L610499) | — | 0 / 0 | — |
| `UBT3OmnibusProcessItem` | [Tax & Year-End](by-topic/tax-yearend.md) | [L610746](../../../ScriptDB/000_4_CreateSP.sql#L610746) | — | 0 / 0 | — |
| `UBT3OmnibusUndoItem` | [Tax & Year-End](by-topic/tax-yearend.md) | [L610972](../../../ScriptDB/000_4_CreateSP.sql#L610972) | — | 0 / 0 | — |
| `UBT3PendingList` | [Tax & Year-End](by-topic/tax-yearend.md) | [L611068](../../../ScriptDB/000_4_CreateSP.sql#L611068) | — | 0 / 1 | — |
| `UBT3PendingSelectionUpdate` | [Tax & Year-End](by-topic/tax-yearend.md) | [L611322](../../../ScriptDB/000_4_CreateSP.sql#L611322) | — | 0 / 0 | — |
| `UBT3PlanFundCheckDOD` | [Tax & Year-End](by-topic/tax-yearend.md) | [L611358](../../../ScriptDB/000_4_CreateSP.sql#L611358) | — | 1 / 0 | — |
| `UBT3PlanID` | [Tax & Year-End](by-topic/tax-yearend.md) | [L611419](../../../ScriptDB/000_4_CreateSP.sql#L611419) | 1 / 1 file | 0 / 0 | [T3.cs:529](../../../UBClasses/T3.cs#L529) |
| `UBT3ProcessOneItem` | [Tax & Year-End](by-topic/tax-yearend.md) | [L611449](../../../ScriptDB/000_4_CreateSP.sql#L611449) | — | 1 / 1 | — |
| `UBT3ProcessPendingTaggedItems` | [Tax & Year-End](by-topic/tax-yearend.md) | [L611955](../../../ScriptDB/000_4_CreateSP.sql#L611955) | — | 0 / 1 | — |
| `UBT3SavePdfObj` | [Tax & Year-End](by-topic/tax-yearend.md) | [L611992](../../../ScriptDB/000_4_CreateSP.sql#L611992) | 1 / 1 file | 0 / 1 | [T3Pdf.cs:205](../../../VieFUNDPdf/T3Pdf.cs#L205) |
| `UBT3SlipRelease` | [Tax & Year-End](by-topic/tax-yearend.md) | [L612025](../../../ScriptDB/000_4_CreateSP.sql#L612025) | — | 0 / 1 | — |
| `UBT4A4XML` | [Tax & Year-End](by-topic/tax-yearend.md) | [L612143](../../../ScriptDB/000_4_CreateSP.sql#L612143) | — | 1 / 1 | — |
| `UBT4AApprove2Pending` | [Tax & Year-End](by-topic/tax-yearend.md) | [L612328](../../../ScriptDB/000_4_CreateSP.sql#L612328) | — | 0 / 0 | — |
| `UBT4AApprovedList` | [Tax & Year-End](by-topic/tax-yearend.md) | [L612411](../../../ScriptDB/000_4_CreateSP.sql#L612411) | — | 0 / 0 | — |
| `UBT4AApprovedSelectionUpdate` | [Tax & Year-End](by-topic/tax-yearend.md) | [L613004](../../../ScriptDB/000_4_CreateSP.sql#L613004) | — | 0 / 0 | — |
| `UBT4ACancelItem` | [Tax & Year-End](by-topic/tax-yearend.md) | [L613040](../../../ScriptDB/000_4_CreateSP.sql#L613040) | — | 0 / 0 | — |
| `UBT4AFileDetailList` | [Tax & Year-End](by-topic/tax-yearend.md) | [L613107](../../../ScriptDB/000_4_CreateSP.sql#L613107) | — | 0 / 0 | — |
| `UBT4AFileList` | [Tax & Year-End](by-topic/tax-yearend.md) | [L613175](../../../ScriptDB/000_4_CreateSP.sql#L613175) | — | 0 / 1 | — |
| `UBT4AFixCancelRecord` | [Tax & Year-End](by-topic/tax-yearend.md) | [L613189](../../../ScriptDB/000_4_CreateSP.sql#L613189) | — | 0 / 0 | — |
| `UBT4AIDList` | [Tax & Year-End](by-topic/tax-yearend.md) | [L613227](../../../ScriptDB/000_4_CreateSP.sql#L613227) | 1 / 1 file | 0 / 0 | [T4APdf.cs:245](../../../VieFUNDPdf/T4APdf.cs#L245) |
| `UBT4AItemInfo` | [Tax & Year-End](by-topic/tax-yearend.md) | [L613258](../../../ScriptDB/000_4_CreateSP.sql#L613258) | — | 0 / 0 | — |
| `UBT4AItemInfoUpdate` | [Tax & Year-End](by-topic/tax-yearend.md) | [L613498](../../../ScriptDB/000_4_CreateSP.sql#L613498) | — | 0 / 0 | — |
| `UBT4AItemSetProcessed` | [Tax & Year-End](by-topic/tax-yearend.md) | [L613540](../../../ScriptDB/000_4_CreateSP.sql#L613540) | — | 0 / 0 | — |
| `UBT4AList` | [Tax & Year-End](by-topic/tax-yearend.md) | [L613598](../../../ScriptDB/000_4_CreateSP.sql#L613598) | — | 0 / 0 | — |
| `UBT4AMemberInfo` | [Tax & Year-End](by-topic/tax-yearend.md) | [L613901](../../../ScriptDB/000_4_CreateSP.sql#L613901) | — | 0 / 0 | — |
| `UBT4APendingList` | [Tax & Year-End](by-topic/tax-yearend.md) | [L613929](../../../ScriptDB/000_4_CreateSP.sql#L613929) | — | 0 / 0 | — |
| `UBT4APendingSelectionUpdate` | [Tax & Year-End](by-topic/tax-yearend.md) | [L614493](../../../ScriptDB/000_4_CreateSP.sql#L614493) | — | 0 / 0 | — |
| `UBT4AProcessOneItem` | [Tax & Year-End](by-topic/tax-yearend.md) | [L614529](../../../ScriptDB/000_4_CreateSP.sql#L614529) | — | 1 / 0 | — |
| `UBT4AProcessPendingTaggedItems` | [Tax & Year-End](by-topic/tax-yearend.md) | [L614984](../../../ScriptDB/000_4_CreateSP.sql#L614984) | — | 0 / 1 | — |
| `UBT4ARestoreSubmitted` | [Tax & Year-End](by-topic/tax-yearend.md) | [L615021](../../../ScriptDB/000_4_CreateSP.sql#L615021) | — | 0 / 0 | — |
| `UBT4ASavePdfObj` | [Tax & Year-End](by-topic/tax-yearend.md) | [L615073](../../../ScriptDB/000_4_CreateSP.sql#L615073) | 1 / 1 file | 0 / 1 | [T4APdf.cs:206](../../../VieFUNDPdf/T4APdf.cs#L206) |
| `UBT4ASavePdfObj_Old` | [Tax & Year-End](by-topic/tax-yearend.md) | [L615104](../../../ScriptDB/000_4_CreateSP.sql#L615104) | — | 0 / 1 | — |
| `UBT4ASelectionUpdate` | [Tax & Year-End](by-topic/tax-yearend.md) | [L615143](../../../ScriptDB/000_4_CreateSP.sql#L615143) | — | 0 / 0 | — |
| `UBT4ASlipRelease` | [Tax & Year-End](by-topic/tax-yearend.md) | [L615184](../../../ScriptDB/000_4_CreateSP.sql#L615184) | — | 0 / 1 | — |
| `UBT4ASummaryInfo` | [Tax & Year-End](by-topic/tax-yearend.md) | [L615334](../../../ScriptDB/000_4_CreateSP.sql#L615334) | — | 0 / 0 | — |
| `UBT4FHSA4XML` | [Tax & Year-End](by-topic/tax-yearend.md) | [L615423](../../../ScriptDB/000_4_CreateSP.sql#L615423) | — | 1 / 1 | — |
| `UBT4FHSAApprove2Pending` | [Tax & Year-End](by-topic/tax-yearend.md) | [L615721](../../../ScriptDB/000_4_CreateSP.sql#L615721) | — | 0 / 0 | — |
| `UBT4FHSAApprovedList` | [Tax & Year-End](by-topic/tax-yearend.md) | [L615776](../../../ScriptDB/000_4_CreateSP.sql#L615776) | — | 0 / 1 | — |
| `UBT4FHSAApprovedSelectionUpdate` | [Tax & Year-End](by-topic/tax-yearend.md) | [L616155](../../../ScriptDB/000_4_CreateSP.sql#L616155) | — | 0 / 0 | — |
| `UBT4FHSACancelItem` | [Tax & Year-End](by-topic/tax-yearend.md) | [L616191](../../../ScriptDB/000_4_CreateSP.sql#L616191) | — | 0 / 0 | — |
| `UBT4FHSAFileDetailList` | [Tax & Year-End](by-topic/tax-yearend.md) | [L616266](../../../ScriptDB/000_4_CreateSP.sql#L616266) | — | 0 / 0 | — |
| `UBT4FHSAFileList` | [Tax & Year-End](by-topic/tax-yearend.md) | [L616332](../../../ScriptDB/000_4_CreateSP.sql#L616332) | — | 0 / 1 | — |
| `UBT4FHSAIDList` | [Tax & Year-End](by-topic/tax-yearend.md) | [L616346](../../../ScriptDB/000_4_CreateSP.sql#L616346) | 1 / 1 file | 0 / 0 | [T4FHSAPdf.cs:243](../../../VieFUNDPdf/T4FHSAPdf.cs#L243) |
| `UBT4FHSAItemARC2Current` | [Tax & Year-End](by-topic/tax-yearend.md) | [L616377](../../../ScriptDB/000_4_CreateSP.sql#L616377) | — | 0 / 0 | — |
| `UBT4FHSAItemInfo` | [Tax & Year-End](by-topic/tax-yearend.md) | [L616461](../../../ScriptDB/000_4_CreateSP.sql#L616461) | — | 0 / 1 | — |
| `UBT4FHSAPendingList` | [Tax & Year-End](by-topic/tax-yearend.md) | [L616697](../../../ScriptDB/000_4_CreateSP.sql#L616697) | — | 0 / 2 | — |
| `UBT4FHSAPendingPlanID` | [Tax & Year-End](by-topic/tax-yearend.md) | [L616916](../../../ScriptDB/000_4_CreateSP.sql#L616916) | — | 0 / 0 | — |
| `UBT4FHSAPendingSelectionUpdate` | [Tax & Year-End](by-topic/tax-yearend.md) | [L616930](../../../ScriptDB/000_4_CreateSP.sql#L616930) | — | 0 / 0 | — |
| `UBT4FHSAProcessOneItem` | [Tax & Year-End](by-topic/tax-yearend.md) | [L616966](../../../ScriptDB/000_4_CreateSP.sql#L616966) | — | 1 / 0 | — |
| `UBT4FHSAProcessPendingTaggedItems` | [Tax & Year-End](by-topic/tax-yearend.md) | [L617405](../../../ScriptDB/000_4_CreateSP.sql#L617405) | — | 0 / 1 | — |
| `UBT4FHSASavePdfObj` | [Tax & Year-End](by-topic/tax-yearend.md) | [L617443](../../../ScriptDB/000_4_CreateSP.sql#L617443) | 1 / 1 file | 0 / 1 | [T4FHSAPdf.cs:205](../../../VieFUNDPdf/T4FHSAPdf.cs#L205) |
| `UBT4FHSASlipRelease` | [Tax & Year-End](by-topic/tax-yearend.md) | [L617473](../../../ScriptDB/000_4_CreateSP.sql#L617473) | — | 0 / 1 | — |
| `UBT4RIF4XML` | [Tax & Year-End](by-topic/tax-yearend.md) | [L617591](../../../ScriptDB/000_4_CreateSP.sql#L617591) | — | 1 / 1 | — |
| `UBT4RIFApprove2Pending` | [Tax & Year-End](by-topic/tax-yearend.md) | [L617787](../../../ScriptDB/000_4_CreateSP.sql#L617787) | — | 0 / 0 | — |
| `UBT4RIFApprovedList` | [Tax & Year-End](by-topic/tax-yearend.md) | [L617842](../../../ScriptDB/000_4_CreateSP.sql#L617842) | — | 0 / 1 | — |
| `UBT4RIFApprovedSelectionUpdate` | [Tax & Year-End](by-topic/tax-yearend.md) | [L618267](../../../ScriptDB/000_4_CreateSP.sql#L618267) | — | 0 / 0 | — |
| `UBT4RIFCancelItem` | [Tax & Year-End](by-topic/tax-yearend.md) | [L618303](../../../ScriptDB/000_4_CreateSP.sql#L618303) | — | 0 / 0 | — |
| `UBT4RIFFileDetailList` | [Tax & Year-End](by-topic/tax-yearend.md) | [L618372](../../../ScriptDB/000_4_CreateSP.sql#L618372) | — | 0 / 0 | — |
| `UBT4RIFFileList` | [Tax & Year-End](by-topic/tax-yearend.md) | [L618434](../../../ScriptDB/000_4_CreateSP.sql#L618434) | — | 0 / 1 | — |
| `UBT4RIFFixCancelRecord` | [Tax & Year-End](by-topic/tax-yearend.md) | [L618448](../../../ScriptDB/000_4_CreateSP.sql#L618448) | — | 0 / 0 | — |
| `UBT4RIFIDList` | [Tax & Year-End](by-topic/tax-yearend.md) | [L618486](../../../ScriptDB/000_4_CreateSP.sql#L618486) | 1 / 1 file | 0 / 0 | [T4RIFPdf.cs:245](../../../VieFUNDPdf/T4RIFPdf.cs#L245) |
| `UBT4RIFItemARC2Current` | [Tax & Year-End](by-topic/tax-yearend.md) | [L618529](../../../ScriptDB/000_4_CreateSP.sql#L618529) | — | 0 / 0 | — |
| `UBT4RIFItemInfo` | [Tax & Year-End](by-topic/tax-yearend.md) | [L618568](../../../ScriptDB/000_4_CreateSP.sql#L618568) | — | 0 / 1 | — |
| `UBT4RIFItemInfoUpdate` | [Tax & Year-End](by-topic/tax-yearend.md) | [L618780](../../../ScriptDB/000_4_CreateSP.sql#L618780) | — | 0 / 0 | — |
| `UBT4RIFPendingList` | [Tax & Year-End](by-topic/tax-yearend.md) | [L618839](../../../ScriptDB/000_4_CreateSP.sql#L618839) | — | 0 / 1 | — |
| `UBT4RIFPendingPlanID` | [Tax & Year-End](by-topic/tax-yearend.md) | [L619793](../../../ScriptDB/000_4_CreateSP.sql#L619793) | — | 0 / 0 | — |
| `UBT4RIFPendingSelectionUpdate` | [Tax & Year-End](by-topic/tax-yearend.md) | [L619807](../../../ScriptDB/000_4_CreateSP.sql#L619807) | — | 0 / 0 | — |
| `UBT4RIFPlanID` | [Tax & Year-End](by-topic/tax-yearend.md) | [L619843](../../../ScriptDB/000_4_CreateSP.sql#L619843) | 1 / 1 file | 0 / 0 | [T4RIF.cs:114](../../../UBClasses/T4RIF.cs#L114) |
| `UBT4RIFProcessOneItem` | [Tax & Year-End](by-topic/tax-yearend.md) | [L619868](../../../ScriptDB/000_4_CreateSP.sql#L619868) | — | 1 / 1 | — |
| `UBT4RIFProcessPendingTaggedItems` | [Tax & Year-End](by-topic/tax-yearend.md) | [L620418](../../../ScriptDB/000_4_CreateSP.sql#L620418) | — | 0 / 1 | — |
| `UBT4RIFRestoreSubmitted` | [Tax & Year-End](by-topic/tax-yearend.md) | [L620457](../../../ScriptDB/000_4_CreateSP.sql#L620457) | — | 0 / 0 | — |
| `UBT4RIFSavePdfObj` | [Tax & Year-End](by-topic/tax-yearend.md) | [L620508](../../../ScriptDB/000_4_CreateSP.sql#L620508) | 1 / 1 file | 0 / 1 | [T4RIFPdf.cs:207](../../../VieFUNDPdf/T4RIFPdf.cs#L207) |
| `UBT4RIFScanAll` | [Tax & Year-End](by-topic/tax-yearend.md) | [L620541](../../../ScriptDB/000_4_CreateSP.sql#L620541) | — | 0 / 1 | — |
| `UBT4RIFScanOneItem` | [Tax & Year-End](by-topic/tax-yearend.md) | [L620573](../../../ScriptDB/000_4_CreateSP.sql#L620573) | — | 1 / 0 | — |
| `UBT4RIFSelectionUpdate` | [Tax & Year-End](by-topic/tax-yearend.md) | [L620813](../../../ScriptDB/000_4_CreateSP.sql#L620813) | — | 0 / 0 | — |
| `UBT4RIFSlipRelease` | [Tax & Year-End](by-topic/tax-yearend.md) | [L620854](../../../ScriptDB/000_4_CreateSP.sql#L620854) | — | 0 / 1 | — |
| `UBT4RSP4XML` | [Tax & Year-End](by-topic/tax-yearend.md) | [L620972](../../../ScriptDB/000_4_CreateSP.sql#L620972) | — | 1 / 1 | — |
| `UBT4RSPApprove2Pending` | [Tax & Year-End](by-topic/tax-yearend.md) | [L621187](../../../ScriptDB/000_4_CreateSP.sql#L621187) | — | 0 / 0 | — |
| `UBT4RSPApprovedList` | [Tax & Year-End](by-topic/tax-yearend.md) | [L621242](../../../ScriptDB/000_4_CreateSP.sql#L621242) | — | 0 / 1 | — |
| `UBT4RSPApprovedSelectionUpdate` | [Tax & Year-End](by-topic/tax-yearend.md) | [L621663](../../../ScriptDB/000_4_CreateSP.sql#L621663) | — | 0 / 0 | — |
| `UBT4RSPCancelItem` | [Tax & Year-End](by-topic/tax-yearend.md) | [L621699](../../../ScriptDB/000_4_CreateSP.sql#L621699) | — | 0 / 0 | — |
| `UBT4RSPCancelOneFileKeepOrg` | [Tax & Year-End](by-topic/tax-yearend.md) | [L621759](../../../ScriptDB/000_4_CreateSP.sql#L621759) | — | 0 / 1 | — |
| `UBT4RSPCancelOneItemKeepOrg` | [Tax & Year-End](by-topic/tax-yearend.md) | [L621785](../../../ScriptDB/000_4_CreateSP.sql#L621785) | — | 1 / 0 | — |
| `UBT4RSPDetailUpdateInfo` | [Tax & Year-End](by-topic/tax-yearend.md) | [L621832](../../../ScriptDB/000_4_CreateSP.sql#L621832) | — | 0 / 0 | — |
| `UBT4RSPFileDetailList` | [Tax & Year-End](by-topic/tax-yearend.md) | [L621889](../../../ScriptDB/000_4_CreateSP.sql#L621889) | — | 0 / 0 | — |
| `UBT4RSPFileList` | [Tax & Year-End](by-topic/tax-yearend.md) | [L621961](../../../ScriptDB/000_4_CreateSP.sql#L621961) | — | 0 / 1 | — |
| `UBT4RSPFixCancelRecord` | [Tax & Year-End](by-topic/tax-yearend.md) | [L621975](../../../ScriptDB/000_4_CreateSP.sql#L621975) | — | 0 / 0 | — |
| `UBT4RSPIDList` | [Tax & Year-End](by-topic/tax-yearend.md) | [L622012](../../../ScriptDB/000_4_CreateSP.sql#L622012) | 1 / 1 file | 0 / 0 | [T4RSPPdf.cs:245](../../../VieFUNDPdf/T4RSPPdf.cs#L245) |
| `UBT4RSPItemARC2Current` | [Tax & Year-End](by-topic/tax-yearend.md) | [L622044](../../../ScriptDB/000_4_CreateSP.sql#L622044) | — | 0 / 0 | — |
| `UBT4RSPItemInfo` | [Tax & Year-End](by-topic/tax-yearend.md) | [L622083](../../../ScriptDB/000_4_CreateSP.sql#L622083) | — | 0 / 0 | — |
| `UBT4RSPItemInfoUpdate` | [Tax & Year-End](by-topic/tax-yearend.md) | [L622318](../../../ScriptDB/000_4_CreateSP.sql#L622318) | — | 0 / 0 | — |
| `UBT4RSPPendingList` | [Tax & Year-End](by-topic/tax-yearend.md) | [L622376](../../../ScriptDB/000_4_CreateSP.sql#L622376) | — | 0 / 1 | — |
| `UBT4RSPPendingPlanID` | [Tax & Year-End](by-topic/tax-yearend.md) | [L623332](../../../ScriptDB/000_4_CreateSP.sql#L623332) | — | 0 / 0 | — |
| `UBT4RSPPendingSelectionUpdate` | [Tax & Year-End](by-topic/tax-yearend.md) | [L623346](../../../ScriptDB/000_4_CreateSP.sql#L623346) | — | 0 / 0 | — |
| `UBT4RSPPlanID` | [Tax & Year-End](by-topic/tax-yearend.md) | [L623382](../../../ScriptDB/000_4_CreateSP.sql#L623382) | 1 / 1 file | 0 / 0 | [T4RSP.cs:261](../../../UBClasses/T4RSP.cs#L261) |
| `UBT4RSPProcessOneItem` | [Tax & Year-End](by-topic/tax-yearend.md) | [L623406](../../../ScriptDB/000_4_CreateSP.sql#L623406) | — | 1 / 1 | — |
| `UBT4RSPProcessPendingTaggedItems` | [Tax & Year-End](by-topic/tax-yearend.md) | [L623887](../../../ScriptDB/000_4_CreateSP.sql#L623887) | — | 0 / 1 | — |
| `UBT4RSPRestoreSubmitted` | [Tax & Year-End](by-topic/tax-yearend.md) | [L623926](../../../ScriptDB/000_4_CreateSP.sql#L623926) | — | 0 / 0 | — |
| `UBT4RSPSavePdfObj` | [Tax & Year-End](by-topic/tax-yearend.md) | [L623978](../../../ScriptDB/000_4_CreateSP.sql#L623978) | 1 / 1 file | 0 / 1 | [T4RSPPdf.cs:207](../../../VieFUNDPdf/T4RSPPdf.cs#L207) |
| `UBT4RSPScanAll` | [Tax & Year-End](by-topic/tax-yearend.md) | [L624010](../../../ScriptDB/000_4_CreateSP.sql#L624010) | — | 0 / 1 | — |
| `UBT4RSPScanOneItem` | [Tax & Year-End](by-topic/tax-yearend.md) | [L624041](../../../ScriptDB/000_4_CreateSP.sql#L624041) | — | 1 / 0 | — |
| `UBT4RSPSelectionUpdate` | [Tax & Year-End](by-topic/tax-yearend.md) | [L624320](../../../ScriptDB/000_4_CreateSP.sql#L624320) | — | 0 / 0 | — |
| `UBT4RSPSlipRelease` | [Tax & Year-End](by-topic/tax-yearend.md) | [L624361](../../../ScriptDB/000_4_CreateSP.sql#L624361) | — | 0 / 1 | — |
| `UBT50084XML` | [Tax & Year-End](by-topic/tax-yearend.md) | [L624487](../../../ScriptDB/000_4_CreateSP.sql#L624487) | — | 1 / 1 | — |
| `UBT5008Approve2Pending` | [Tax & Year-End](by-topic/tax-yearend.md) | [L624621](../../../ScriptDB/000_4_CreateSP.sql#L624621) | — | 0 / 0 | — |
| `UBT5008ApprovedList` | [Tax & Year-End](by-topic/tax-yearend.md) | [L624676](../../../ScriptDB/000_4_CreateSP.sql#L624676) | — | 0 / 1 | — |
| `UBT5008ApprovedSelectionUpdate` | [Tax & Year-End](by-topic/tax-yearend.md) | [L625064](../../../ScriptDB/000_4_CreateSP.sql#L625064) | — | 0 / 0 | — |
| `UBT5008CancelItem` | [Tax & Year-End](by-topic/tax-yearend.md) | [L625100](../../../ScriptDB/000_4_CreateSP.sql#L625100) | — | 0 / 0 | — |
| `UBT5008FileDetailList` | [Tax & Year-End](by-topic/tax-yearend.md) | [L625186](../../../ScriptDB/000_4_CreateSP.sql#L625186) | — | 0 / 0 | — |
| `UBT5008FileList` | [Tax & Year-End](by-topic/tax-yearend.md) | [L625261](../../../ScriptDB/000_4_CreateSP.sql#L625261) | — | 0 / 1 | — |
| `UBT5008FixCancelRecord` | [Tax & Year-End](by-topic/tax-yearend.md) | [L625275](../../../ScriptDB/000_4_CreateSP.sql#L625275) | — | 0 / 0 | — |
| `UBT5008IDList` | [Tax & Year-End](by-topic/tax-yearend.md) | [L625312](../../../ScriptDB/000_4_CreateSP.sql#L625312) | 2 / 1 file | 0 / 0 | [T5008Pdf.cs:176](../../../VieFUNDPdf/T5008Pdf.cs#L176) |
| `UBT5008ItemInfo` | [Tax & Year-End](by-topic/tax-yearend.md) | [L625410](../../../ScriptDB/000_4_CreateSP.sql#L625410) | — | 0 / 0 | — |
| `UBT5008ItemInfo4Pdf` | [Tax & Year-End](by-topic/tax-yearend.md) | [L625520](../../../ScriptDB/000_4_CreateSP.sql#L625520) | — | 0 / 0 | — |
| `UBT5008ItemInfoDetail` | [Tax & Year-End](by-topic/tax-yearend.md) | [L625795](../../../ScriptDB/000_4_CreateSP.sql#L625795) | — | 0 / 0 | — |
| `UBT5008ItemInfoDetailPage` | [Tax & Year-End](by-topic/tax-yearend.md) | [L625856](../../../ScriptDB/000_4_CreateSP.sql#L625856) | — | 0 / 0 | — |
| `UBT5008ItemInfoGov` | [Tax & Year-End](by-topic/tax-yearend.md) | [L626055](../../../ScriptDB/000_4_CreateSP.sql#L626055) | — | 0 / 0 | — |
| `UBT5008ItemSetProcessed` | [Tax & Year-End](by-topic/tax-yearend.md) | [L626165](../../../ScriptDB/000_4_CreateSP.sql#L626165) | — | 0 / 0 | — |
| `UBT5008PendingList` | [Tax & Year-End](by-topic/tax-yearend.md) | [L626216](../../../ScriptDB/000_4_CreateSP.sql#L626216) | — | 0 / 1 | — |
| `UBT5008PendingSelectionUpdate` | [Tax & Year-End](by-topic/tax-yearend.md) | [L626537](../../../ScriptDB/000_4_CreateSP.sql#L626537) | — | 0 / 0 | — |
| `UBT5008PlanID` | [Tax & Year-End](by-topic/tax-yearend.md) | [L626573](../../../ScriptDB/000_4_CreateSP.sql#L626573) | 1 / 1 file | 0 / 0 | [T5008.cs:248](../../../UBClasses/T5008.cs#L248) |
| `UBT5008ProcessOneItem` | [Tax & Year-End](by-topic/tax-yearend.md) | [L626598](../../../ScriptDB/000_4_CreateSP.sql#L626598) | — | 1 / 0 | — |
| `UBT5008ProcessPendingTaggedItems` | [Tax & Year-End](by-topic/tax-yearend.md) | [L626850](../../../ScriptDB/000_4_CreateSP.sql#L626850) | — | 0 / 1 | — |
| `UBT5008SavePdfObj` | [Tax & Year-End](by-topic/tax-yearend.md) | [L626887](../../../ScriptDB/000_4_CreateSP.sql#L626887) | 2 / 1 file | 0 / 1 | [T5008Pdf.cs:138](../../../VieFUNDPdf/T5008Pdf.cs#L138) |
| `UBT5008ScanAll` | [Tax & Year-End](by-topic/tax-yearend.md) | [L626921](../../../ScriptDB/000_4_CreateSP.sql#L626921) | — | 0 / 1 | — |
| `UBT5008ScanOneItem` | [Tax & Year-End](by-topic/tax-yearend.md) | [L626952](../../../ScriptDB/000_4_CreateSP.sql#L626952) | — | 1 / 0 | — |
| `UBT5008SelectionUpdate` | [Tax & Year-End](by-topic/tax-yearend.md) | [L627142](../../../ScriptDB/000_4_CreateSP.sql#L627142) | — | 0 / 0 | — |
| `UBT5008SlipRelease` | [Tax & Year-End](by-topic/tax-yearend.md) | [L627184](../../../ScriptDB/000_4_CreateSP.sql#L627184) | — | 0 / 1 | — |
| `UBT54XML` | [Tax & Year-End](by-topic/tax-yearend.md) | [L627309](../../../ScriptDB/000_4_CreateSP.sql#L627309) | — | 1 / 1 | — |
| `UBT550Approve2Pending` | [Tax & Year-End](by-topic/tax-yearend.md) | [L627576](../../../ScriptDB/000_4_CreateSP.sql#L627576) | — | 0 / 0 | — |
| `UBT550ApprovedList` | [Tax & Year-End](by-topic/tax-yearend.md) | [L627630](../../../ScriptDB/000_4_CreateSP.sql#L627630) | — | 0 / 1 | — |
| `UBT550ApprovedSelectionUpdate` | [Tax & Year-End](by-topic/tax-yearend.md) | [L627935](../../../ScriptDB/000_4_CreateSP.sql#L627935) | — | 0 / 0 | — |
| `UBT550FileDetailList` | [Tax & Year-End](by-topic/tax-yearend.md) | [L627971](../../../ScriptDB/000_4_CreateSP.sql#L627971) | — | 0 / 0 | — |
| `UBT550FileList` | [Tax & Year-End](by-topic/tax-yearend.md) | [L628033](../../../ScriptDB/000_4_CreateSP.sql#L628033) | — | 0 / 1 | — |
| `UBT550List` | [Tax & Year-End](by-topic/tax-yearend.md) | [L628047](../../../ScriptDB/000_4_CreateSP.sql#L628047) | 1 / 1 file | 0 / 1 | [T550XML.cs:150](../../../UBExport/T550XML.cs#L150) |
| `UBT550ListSearch` | [Tax & Year-End](by-topic/tax-yearend.md) | [L628185](../../../ScriptDB/000_4_CreateSP.sql#L628185) | — | 0 / 0 | — |
| `UBT550PendingList` | [Tax & Year-End](by-topic/tax-yearend.md) | [L628301](../../../ScriptDB/000_4_CreateSP.sql#L628301) | — | 0 / 1 | — |
| `UBT550PendingSelectionUpdate` | [Tax & Year-End](by-topic/tax-yearend.md) | [L628774](../../../ScriptDB/000_4_CreateSP.sql#L628774) | — | 0 / 0 | — |
| `UBT550ProcessOneItem` | [Tax & Year-End](by-topic/tax-yearend.md) | [L628810](../../../ScriptDB/000_4_CreateSP.sql#L628810) | — | 1 / 0 | — |
| `UBT550ProcessPendingTaggedItems` | [Tax & Year-End](by-topic/tax-yearend.md) | [L628920](../../../ScriptDB/000_4_CreateSP.sql#L628920) | — | 0 / 1 | — |
| `UBT550XML` | [Tax & Year-End](by-topic/tax-yearend.md) | [L628957](../../../ScriptDB/000_4_CreateSP.sql#L628957) | — | 1 / 1 | — |
| `UBT5Approve2Pending` | [Tax & Year-End](by-topic/tax-yearend.md) | [L629041](../../../ScriptDB/000_4_CreateSP.sql#L629041) | — | 0 / 0 | — |
| `UBT5ApprovedList` | [Tax & Year-End](by-topic/tax-yearend.md) | [L629096](../../../ScriptDB/000_4_CreateSP.sql#L629096) | — | 0 / 1 | — |
| `UBT5ApprovedSelectionUpdate` | [Tax & Year-End](by-topic/tax-yearend.md) | [L629515](../../../ScriptDB/000_4_CreateSP.sql#L629515) | — | 0 / 0 | — |
| `UBT5CancelItem` | [Tax & Year-End](by-topic/tax-yearend.md) | [L629551](../../../ScriptDB/000_4_CreateSP.sql#L629551) | — | 0 / 0 | — |
| `UBT5FileDetailList` | [Tax & Year-End](by-topic/tax-yearend.md) | [L629621](../../../ScriptDB/000_4_CreateSP.sql#L629621) | — | 0 / 0 | — |
| `UBT5FileList` | [Tax & Year-End](by-topic/tax-yearend.md) | [L629689](../../../ScriptDB/000_4_CreateSP.sql#L629689) | — | 0 / 1 | — |
| `UBT5FixCancelRecord` | [Tax & Year-End](by-topic/tax-yearend.md) | [L629703](../../../ScriptDB/000_4_CreateSP.sql#L629703) | — | 0 / 0 | — |
| `UBT5IDList` | [Tax & Year-End](by-topic/tax-yearend.md) | [L629740](../../../ScriptDB/000_4_CreateSP.sql#L629740) | 1 / 1 file | 0 / 0 | [T5Pdf.cs:243](../../../VieFUNDPdf/T5Pdf.cs#L243) |
| `UBT5InterestInit` | [Tax & Year-End](by-topic/tax-yearend.md) | [L629760](../../../ScriptDB/000_4_CreateSP.sql#L629760) | — | 1 / 1 | — |
| `UBT5ItemInfo` | [Tax & Year-End](by-topic/tax-yearend.md) | [L629835](../../../ScriptDB/000_4_CreateSP.sql#L629835) | — | 0 / 1 | — |
| `UBT5ItemInfoUpdate` | [Tax & Year-End](by-topic/tax-yearend.md) | [L630260](../../../ScriptDB/000_4_CreateSP.sql#L630260) | — | 0 / 0 | — |
| `UBT5ListAllPayments` | [Tax & Year-End](by-topic/tax-yearend.md) | [L630311](../../../ScriptDB/000_4_CreateSP.sql#L630311) | — | 0 / 0 | — |
| `UBT5OmnibusItemInfo` | [Tax & Year-End](by-topic/tax-yearend.md) | [L630353](../../../ScriptDB/000_4_CreateSP.sql#L630353) | — | 0 / 0 | — |
| `UBT5OmnibusItemUpdateBoxes` | [Tax & Year-End](by-topic/tax-yearend.md) | [L630377](../../../ScriptDB/000_4_CreateSP.sql#L630377) | — | 0 / 0 | — |
| `UBT5OmnibusItemUpdateDividend` | [Tax & Year-End](by-topic/tax-yearend.md) | [L630434](../../../ScriptDB/000_4_CreateSP.sql#L630434) | — | 0 / 0 | — |
| `UBT5OmnibusList` | [Tax & Year-End](by-topic/tax-yearend.md) | [L630579](../../../ScriptDB/000_4_CreateSP.sql#L630579) | — | 0 / 1 | — |
| `UBT5OmnibusProcessItem` | [Tax & Year-End](by-topic/tax-yearend.md) | [L630762](../../../ScriptDB/000_4_CreateSP.sql#L630762) | — | 0 / 0 | — |
| `UBT5OmnibusUndoItem` | [Tax & Year-End](by-topic/tax-yearend.md) | [L630987](../../../ScriptDB/000_4_CreateSP.sql#L630987) | — | 0 / 0 | — |
| `UBT5PendingList` | [Tax & Year-End](by-topic/tax-yearend.md) | [L631065](../../../ScriptDB/000_4_CreateSP.sql#L631065) | — | 0 / 1 | — |
| `UBT5PendingSelectionUpdate` | [Tax & Year-End](by-topic/tax-yearend.md) | [L631336](../../../ScriptDB/000_4_CreateSP.sql#L631336) | — | 0 / 0 | — |
| `UBT5PlanFundCheckDOD` | [Tax & Year-End](by-topic/tax-yearend.md) | [L631372](../../../ScriptDB/000_4_CreateSP.sql#L631372) | — | 1 / 0 | — |
| `UBT5PlanID` | [Tax & Year-End](by-topic/tax-yearend.md) | [L631433](../../../ScriptDB/000_4_CreateSP.sql#L631433) | 1 / 1 file | 0 / 0 | [T5.cs:505](../../../UBClasses/T5.cs#L505) |
| `UBT5ProcessOneItem` | [Tax & Year-End](by-topic/tax-yearend.md) | [L631463](../../../ScriptDB/000_4_CreateSP.sql#L631463) | — | 1 / 1 | — |
| `UBT5ProcessPendingTaggedItems` | [Tax & Year-End](by-topic/tax-yearend.md) | [L632030](../../../ScriptDB/000_4_CreateSP.sql#L632030) | — | 0 / 1 | — |
| `UBT5SavePdfObj` | [Tax & Year-End](by-topic/tax-yearend.md) | [L632067](../../../ScriptDB/000_4_CreateSP.sql#L632067) | 1 / 1 file | 0 / 1 | [T5Pdf.cs:205](../../../VieFUNDPdf/T5Pdf.cs#L205) |
| `UBT5SlipRelease` | [Tax & Year-End](by-topic/tax-yearend.md) | [L632100](../../../ScriptDB/000_4_CreateSP.sql#L632100) | — | 0 / 1 | — |
| `UBT619Info` | [Shared / Other](by-topic/shared-other.md) | [L632218](../../../ScriptDB/000_4_CreateSP.sql#L632218) | 2 / 2 file | 26 / 0 | [T619.cs:41](../../../UBClasses/T619.cs#L41) |
| `UBT619InfoUpdate` | [Shared / Other](by-topic/shared-other.md) | [L632351](../../../ScriptDB/000_4_CreateSP.sql#L632351) | 1 / 1 file | 0 / 1 | [T619.cs:189](../../../UBClasses/T619.cs#L189) |
| `UBTAViewComboList` | [Shared / Other](by-topic/shared-other.md) | [L632854](../../../ScriptDB/000_4_CreateSP.sql#L632854) | — | 0 / 12 | — |
| `UBTAViewSearch` | [Shared / Other](by-topic/shared-other.md) | [L632893](../../../ScriptDB/000_4_CreateSP.sql#L632893) | 1 / 1 file | 0 / 3 | [TrustAccount.cs:1442](../../../UBClasses/TrustAccount.cs#L1442) |
| `UBTAViewSearchCriteriaSave` | [Shared / Other](by-topic/shared-other.md) | [L634603](../../../ScriptDB/000_4_CreateSP.sql#L634603) | — | 1 / 1 | — |
| `UBTaxActionList` | [Tax & Year-End](by-topic/tax-yearend.md) | [L634919](../../../ScriptDB/000_4_CreateSP.sql#L634919) | — | 1 / 0 | — |
| `UBTaxApprovePending` | [Tax & Year-End](by-topic/tax-yearend.md) | [L634952](../../../ScriptDB/000_4_CreateSP.sql#L634952) | — | 0 / 1 | — |
| `UBTaxASelectionUpdate` | [Tax & Year-End](by-topic/tax-yearend.md) | [L635156](../../../ScriptDB/000_4_CreateSP.sql#L635156) | — | 0 / 0 | — |
| `UBTaxDetail` | [Tax & Year-End](by-topic/tax-yearend.md) | [L635197](../../../ScriptDB/000_4_CreateSP.sql#L635197) | — | 11 / 0 | — |
| `UBTaxPSelectionUpdate` | [Tax & Year-End](by-topic/tax-yearend.md) | [L635248](../../../ScriptDB/000_4_CreateSP.sql#L635248) | — | 0 / 0 | — |
| `UBTaxReceiptApprovedList` | [Tax & Year-End](by-topic/tax-yearend.md) | [L635292](../../../ScriptDB/000_4_CreateSP.sql#L635292) | 1 / 1 file | 0 / 1 | [TaxReceipt.cs:263](../../../UBClasses/TaxReceipt.cs#L263) |
| `UBTaxReceiptListClientAll` | [Tax & Year-End](by-topic/tax-yearend.md) | [L635674](../../../ScriptDB/000_4_CreateSP.sql#L635674) | 1 / 1 file | 0 / 0 | [TaxReceipt.cs:511](../../../UBClasses/TaxReceipt.cs#L511) |
| `UBTaxReceiptListMemberT4A` | [Tax & Year-End](by-topic/tax-yearend.md) | [L635843](../../../ScriptDB/000_4_CreateSP.sql#L635843) | 1 / 1 file | 1 / 2 | [TaxReceipt.cs:558](../../../UBClasses/TaxReceipt.cs#L558) |
| `UBTaxReceiptMove2Pending` | [Tax & Year-End](by-topic/tax-yearend.md) | [L635922](../../../ScriptDB/000_4_CreateSP.sql#L635922) | — | 0 / 0 | — |
| `UBTaxReceiptObjList` | [Tax & Year-End](by-topic/tax-yearend.md) | [L635969](../../../ScriptDB/000_4_CreateSP.sql#L635969) | 1 / 1 file | 0 / 0 | [CRRSPReceipt.cs:597](../../../VieFUNDPdf/CRRSPReceipt.cs#L597) |
| `UBTaxReceiptPendingList` | [Tax & Year-End](by-topic/tax-yearend.md) | [L636132](../../../ScriptDB/000_4_CreateSP.sql#L636132) | 1 / 1 file | 0 / 1 | [TaxReceipt.cs:48](../../../UBClasses/TaxReceipt.cs#L48) |
| `UBTaxReceiptRelease` | [Tax & Year-End](by-topic/tax-yearend.md) | [L636702](../../../ScriptDB/000_4_CreateSP.sql#L636702) | — | 0 / 1 | — |
| `UBTaxYearList` | [Tax & Year-End](by-topic/tax-yearend.md) | [L636813](../../../ScriptDB/000_4_CreateSP.sql#L636813) | — | 2 / 0 | — |
| `UBTCPRelationshipList` | [Shared / Other](by-topic/shared-other.md) | [L636841](../../../ScriptDB/000_4_CreateSP.sql#L636841) | — | 1 / 0 | — |
| `UBTCPRemoveAll` | [Shared / Other](by-topic/shared-other.md) | [L636873](../../../ScriptDB/000_4_CreateSP.sql#L636873) | — | 1 / 1 | — |
| `UBTestDB` | [Shared / Other](by-topic/shared-other.md) | [L636919](../../../ScriptDB/000_4_CreateSP.sql#L636919) | — | 0 / 0 | — |
| `UBTFSA4XML` | [Tax & Year-End](by-topic/tax-yearend.md) | [L636942](../../../ScriptDB/000_4_CreateSP.sql#L636942) | — | 1 / 1 | — |
| `UBTFSAApprove2Pending` | [Tax & Year-End](by-topic/tax-yearend.md) | [L637078](../../../ScriptDB/000_4_CreateSP.sql#L637078) | — | 0 / 0 | — |
| `UBTFSAApprovedList` | [Tax & Year-End](by-topic/tax-yearend.md) | [L637132](../../../ScriptDB/000_4_CreateSP.sql#L637132) | — | 0 / 1 | — |
| `UBTFSAApprovedSelectionUpdate` | [Tax & Year-End](by-topic/tax-yearend.md) | [L637456](../../../ScriptDB/000_4_CreateSP.sql#L637456) | — | 0 / 0 | — |
| `UBTFSACancelItem` | [Tax & Year-End](by-topic/tax-yearend.md) | [L637492](../../../ScriptDB/000_4_CreateSP.sql#L637492) | — | 0 / 0 | — |
| `UBTFSAFileDetailList` | [Tax & Year-End](by-topic/tax-yearend.md) | [L637580](../../../ScriptDB/000_4_CreateSP.sql#L637580) | — | 0 / 0 | — |
| `UBTFSAFileList` | [Tax & Year-End](by-topic/tax-yearend.md) | [L637636](../../../ScriptDB/000_4_CreateSP.sql#L637636) | — | 0 / 1 | — |
| `UBTFSAFixCancelRecord` | [Tax & Year-End](by-topic/tax-yearend.md) | [L637650](../../../ScriptDB/000_4_CreateSP.sql#L637650) | — | 0 / 0 | — |
| `UBTFSAItemInfo` | [Tax & Year-End](by-topic/tax-yearend.md) | [L637687](../../../ScriptDB/000_4_CreateSP.sql#L637687) | — | 0 / 0 | — |
| `UBTFSAItemStatusUpdate` | [Tax & Year-End](by-topic/tax-yearend.md) | [L637744](../../../ScriptDB/000_4_CreateSP.sql#L637744) | — | 0 / 0 | — |
| `UBTFSAPendingList` | [Tax & Year-End](by-topic/tax-yearend.md) | [L637759](../../../ScriptDB/000_4_CreateSP.sql#L637759) | — | 0 / 2 | — |
| `UBTFSAPendingSelectionUpdate` | [Tax & Year-End](by-topic/tax-yearend.md) | [L638024](../../../ScriptDB/000_4_CreateSP.sql#L638024) | — | 0 / 0 | — |
| `UBTFSAProcess5Items` | [Tax & Year-End](by-topic/tax-yearend.md) | [L638060](../../../ScriptDB/000_4_CreateSP.sql#L638060) | 1 / 1 file | 0 / 1 | [TFSAProcessing.cs:214](../../../UBClasses/TFSAProcessing.cs#L214) |
| `UBTFSAProcessOneItem` | [Tax & Year-End](by-topic/tax-yearend.md) | [L638088](../../../ScriptDB/000_4_CreateSP.sql#L638088) | — | 2 / 1 | — |
| `UBTFSAProcessPendingTaggedItems` | [Tax & Year-End](by-topic/tax-yearend.md) | [L638481](../../../ScriptDB/000_4_CreateSP.sql#L638481) | — | 0 / 1 | — |
| `UBTFSARestoreOneItem` | [Tax & Year-End](by-topic/tax-yearend.md) | [L638518](../../../ScriptDB/000_4_CreateSP.sql#L638518) | — | 0 / 0 | — |
| `UBTFSAScanAll` | [Tax & Year-End](by-topic/tax-yearend.md) | [L638581](../../../ScriptDB/000_4_CreateSP.sql#L638581) | — | 0 / 1 | — |
| `UBTFSAScanOneItem` | [Tax & Year-End](by-topic/tax-yearend.md) | [L638611](../../../ScriptDB/000_4_CreateSP.sql#L638611) | — | 1 / 1 | — |
| `UBTitleList` | [Shared / Other](by-topic/shared-other.md) | [L638931](../../../ScriptDB/000_4_CreateSP.sql#L638931) | — | 9 / 0 | — |
| `UBTodayBusStr` | [Shared / Other](by-topic/shared-other.md) | [L638963](../../../ScriptDB/000_4_CreateSP.sql#L638963) | — | 0 / 0 | — |
| `UBTokenCreate` | [Security & Auth](by-topic/security-auth.md) | [L638987](../../../ScriptDB/000_4_CreateSP.sql#L638987) | — | 0 / 0 | — |
| `UBTokenParams` | [Security & Auth](by-topic/security-auth.md) | [L639052](../../../ScriptDB/000_4_CreateSP.sql#L639052) | — | 0 / 0 | — |
| `UBTokenParamsGet` | [Security & Auth](by-topic/security-auth.md) | [L639143](../../../ScriptDB/000_4_CreateSP.sql#L639143) | — | 0 / 0 | — |
| `UBTokenUpdate` | [Security & Auth](by-topic/security-auth.md) | [L639350](../../../ScriptDB/000_4_CreateSP.sql#L639350) | — | 0 / 0 | — |
| `UBTotalInvestmentList` | [Shared / Other](by-topic/shared-other.md) | [L639393](../../../ScriptDB/000_4_CreateSP.sql#L639393) | — | 6 / 0 | — |
| `UBTransferReminderAdd` | [Shared / Other](by-topic/shared-other.md) | [L639429](../../../ScriptDB/000_4_CreateSP.sql#L639429) | 1 / 1 file | 0 / 2 | [TransferReminder.cs:105](../../../UBClasses/TransferReminder.cs#L105) |
| `UBTransferReminderClientPlanID` | [Account & Plan](by-topic/account-plan.md) | [L639692](../../../ScriptDB/000_4_CreateSP.sql#L639692) | — | 0 / 0 | — |
| `UBTransferReminderClientPlanIDPrimary` | [Account & Plan](by-topic/account-plan.md) | [L639717](../../../ScriptDB/000_4_CreateSP.sql#L639717) | — | 0 / 0 | — |
| `UBTransferReminderDataSet` | [Shared / Other](by-topic/shared-other.md) | [L639748](../../../ScriptDB/000_4_CreateSP.sql#L639748) | 1 / 1 file | 0 / 0 | [CTransferDoc.cs:1480](../../../VieFUNDPdf/CTransferDoc.cs#L1480) |
| `UBTransferReminderGetByID` | [Shared / Other](by-topic/shared-other.md) | [L639783](../../../ScriptDB/000_4_CreateSP.sql#L639783) | 1 / 1 file | 0 / 1 | [TransferReminder.cs:39](../../../UBClasses/TransferReminder.cs#L39) |
| `UBTransferReminderInfo` | [Shared / Other](by-topic/shared-other.md) | [L639886](../../../ScriptDB/000_4_CreateSP.sql#L639886) | 1 / 1 file | 0 / 0 | [TransferReminder.cs:368](../../../UBClasses/TransferReminder.cs#L368) |
| `UBTransferReminderLetterSet` | [Shared / Other](by-topic/shared-other.md) | [L640058](../../../ScriptDB/000_4_CreateSP.sql#L640058) | — | 0 / 4 | — |
| `UBTransferReminderOneClient` | [Client & KYC](by-topic/client-kyc.md) | [L640324](../../../ScriptDB/000_4_CreateSP.sql#L640324) | 1 / 1 file | 1 / 0 | [TransferReminder.cs:313](../../../UBClasses/TransferReminder.cs#L313) |
| `UBTransferReminderOneDocList` | [Documents & PDF](by-topic/documents-pdf.md) | [L640555](../../../ScriptDB/000_4_CreateSP.sql#L640555) | 1 / 1 file | 0 / 0 | [TransferReminder.cs:532](../../../UBClasses/TransferReminder.cs#L532) |
| `UBTransferReminderPlanID` | [Account & Plan](by-topic/account-plan.md) | [L640593](../../../ScriptDB/000_4_CreateSP.sql#L640593) | — | 0 / 0 | — |
| `UBTransferReminderPOASet` | [Shared / Other](by-topic/shared-other.md) | [L640610](../../../ScriptDB/000_4_CreateSP.sql#L640610) | — | 0 / 4 | — |
| `UBTransferReminderRemove` | [Shared / Other](by-topic/shared-other.md) | [L641007](../../../ScriptDB/000_4_CreateSP.sql#L641007) | 1 / 1 file | 0 / 0 | [TransferReminder.cs:190](../../../UBClasses/TransferReminder.cs#L190) |
| `UBTransferReminderRemoveDoc` | [Documents & PDF](by-topic/documents-pdf.md) | [L641031](../../../ScriptDB/000_4_CreateSP.sql#L641031) | — | 0 / 0 | — |
| `UBTransferReminderReRegSet` | [Shared / Other](by-topic/shared-other.md) | [L641051](../../../ScriptDB/000_4_CreateSP.sql#L641051) | — | 0 / 3 | — |
| `UBTransferReminderSaveObj` | [Shared / Other](by-topic/shared-other.md) | [L641364](../../../ScriptDB/000_4_CreateSP.sql#L641364) | 1 / 1 file | 0 / 0 | [CTransferDoc.cs:1534](../../../VieFUNDPdf/CTransferDoc.cs#L1534) |
| `UBTransferReminderSearch` | [Shared / Other](by-topic/shared-other.md) | [L641427](../../../ScriptDB/000_4_CreateSP.sql#L641427) | 1 / 1 file | 0 / 1 | [TransferReminder.cs:243](../../../UBClasses/TransferReminder.cs#L243) |
| `UBTransferReminderUpdate` | [Shared / Other](by-topic/shared-other.md) | [L641975](../../../ScriptDB/000_4_CreateSP.sql#L641975) | 1 / 1 file | 0 / 2 | [TransferReminder.cs:105](../../../UBClasses/TransferReminder.cs#L105) |
| `UBTransferReminderVerifyDocType` | [Documents & PDF](by-topic/documents-pdf.md) | [L642196](../../../ScriptDB/000_4_CreateSP.sql#L642196) | — | 0 / 0 | — |
| `UBTransferStatusList` | [Shared / Other](by-topic/shared-other.md) | [L642238](../../../ScriptDB/000_4_CreateSP.sql#L642238) | — | 2 / 0 | — |
| `UBTransferTypeList` | [Shared / Other](by-topic/shared-other.md) | [L642263](../../../ScriptDB/000_4_CreateSP.sql#L642263) | — | 2 / 0 | — |
| `UBTrnsfReminderCategoryList` | [Shared / Other](by-topic/shared-other.md) | [L642288](../../../ScriptDB/000_4_CreateSP.sql#L642288) | — | 2 / 0 | — |
| `UBTrustAttachBuyTrx` | [Account & Plan](by-topic/account-plan.md) | [L642314](../../../ScriptDB/000_4_CreateSP.sql#L642314) | — | 1 / 1 | — |
| `UBTrustAttachOrder` | [Account & Plan](by-topic/account-plan.md) | [L642473](../../../ScriptDB/000_4_CreateSP.sql#L642473) | 1 / 1 file | 0 / 1 | [TrustAccount.cs:1258](../../../UBClasses/TrustAccount.cs#L1258) |
| `UBTrustAttachPlanTrx` | [Account & Plan](by-topic/account-plan.md) | [L642589](../../../ScriptDB/000_4_CreateSP.sql#L642589) | — | 1 / 1 | — |
| `UBTrustAttachTrx` | [Account & Plan](by-topic/account-plan.md) | [L642622](../../../ScriptDB/000_4_CreateSP.sql#L642622) | 1 / 1 file | 0 / 1 | [TrustAccount.cs:1305](../../../UBClasses/TrustAccount.cs#L1305) |
| `UBTrustBalance4CWT` | [Account & Plan](by-topic/account-plan.md) | [L642851](../../../ScriptDB/000_4_CreateSP.sql#L642851) | 1 / 1 file | 0 / 2 | [TrustAccount.cs:4719](../../../UBClasses/TrustAccount.cs#L4719) |
| `UBTrustBalanceBySettlementDate` | [Account & Plan](by-topic/account-plan.md) | [L643147](../../../ScriptDB/000_4_CreateSP.sql#L643147) | 1 / 1 file | 0 / 0 | [TrustAccount.cs:4524](../../../UBClasses/TrustAccount.cs#L4524) |
| `UBTrustBuyCOFAdd` | [Account & Plan](by-topic/account-plan.md) | [L643608](../../../ScriptDB/000_4_CreateSP.sql#L643608) | — | 6 / 2 | — |
| `UBTrustBuyFixExternalWithComm` | [Commission & Fee](by-topic/commission-fee.md) | [L643819](../../../ScriptDB/000_4_CreateSP.sql#L643819) | — | 0 / 0 | — |
| `UBTrustBuyGICAdd` | [Fund & GIC](by-topic/fund-gic.md) | [L643916](../../../ScriptDB/000_4_CreateSP.sql#L643916) | — | 2 / 1 | — |
| `UBTrustBuyScan4BuyAgoraSorceDealer` | [Account & Plan](by-topic/account-plan.md) | [L644067](../../../ScriptDB/000_4_CreateSP.sql#L644067) | — | 0 / 1 | — |
| `UBTrustBuyScan4BuyAgoraSourceDealer` | [Account & Plan](by-topic/account-plan.md) | [L644111](../../../ScriptDB/000_4_CreateSP.sql#L644111) | — | 0 / 1 | — |
| `UBTrustBuyTrxAdd` | [Account & Plan](by-topic/account-plan.md) | [L644159](../../../ScriptDB/000_4_CreateSP.sql#L644159) | — | 11 / 1 | — |
| `UBTrustBuyTrxAddComm` | [Commission & Fee](by-topic/commission-fee.md) | [L644352](../../../ScriptDB/000_4_CreateSP.sql#L644352) | — | 1 / 1 | — |
| `UBTrustBuyTrxAddCommAll` | [Commission & Fee](by-topic/commission-fee.md) | [L644414](../../../ScriptDB/000_4_CreateSP.sql#L644414) | — | 0 / 1 | — |
| `UBTrustBuyTrxRemove` | [Account & Plan](by-topic/account-plan.md) | [L644458](../../../ScriptDB/000_4_CreateSP.sql#L644458) | — | 1 / 0 | — |
| `UBTrustBuyTrxUpdate` | [Account & Plan](by-topic/account-plan.md) | [L644539](../../../ScriptDB/000_4_CreateSP.sql#L644539) | — | 7 / 1 | — |
| `UBTrustCashDistributionAdd` | [Account & Plan](by-topic/account-plan.md) | [L644602](../../../ScriptDB/000_4_CreateSP.sql#L644602) | — | 6 / 2 | — |
| `UBTrustCashDistributionRefresh` | [Account & Plan](by-topic/account-plan.md) | [L644832](../../../ScriptDB/000_4_CreateSP.sql#L644832) | — | 0 / 1 | — |
| `UBTrustCDAdd` | [Account & Plan](by-topic/account-plan.md) | [L644886](../../../ScriptDB/000_4_CreateSP.sql#L644886) | 1 / 1 file | 0 / 6 | [TrustAccount.cs:910](../../../UBClasses/TrustAccount.cs#L910) |
| `UBTrustCDAddInternal` | [Account & Plan](by-topic/account-plan.md) | [L645325](../../../ScriptDB/000_4_CreateSP.sql#L645325) | — | 0 / 1 | — |
| `UBTrustCDInfo` | [Account & Plan](by-topic/account-plan.md) | [L645486](../../../ScriptDB/000_4_CreateSP.sql#L645486) | — | 0 / 0 | — |
| `UBTrustCDList` | [Account & Plan](by-topic/account-plan.md) | [L645540](../../../ScriptDB/000_4_CreateSP.sql#L645540) | 2 / 1 file | 0 / 0 | [TrustAccount.cs:222](../../../UBClasses/TrustAccount.cs#L222) |
| `UBTrustCDRemove` | [Account & Plan](by-topic/account-plan.md) | [L645941](../../../ScriptDB/000_4_CreateSP.sql#L645941) | 2 / 1 file | 1 / 1 | [TrustAccount.cs:1104](../../../UBClasses/TrustAccount.cs#L1104) |
| `UBTrustCDUpdate` | [Account & Plan](by-topic/account-plan.md) | [L645997](../../../ScriptDB/000_4_CreateSP.sql#L645997) | 1 / 1 file | 0 / 8 | [TrustAccount.cs:910](../../../UBClasses/TrustAccount.cs#L910) |
| `UBTrustCheckWHT` | [Account & Plan](by-topic/account-plan.md) | [L646488](../../../ScriptDB/000_4_CreateSP.sql#L646488) | — | 0 / 0 | — |
| `UBTrustCheque2EFT` | [Account & Plan](by-topic/account-plan.md) | [L646612](../../../ScriptDB/000_4_CreateSP.sql#L646612) | 1 / 1 file | 0 / 1 | [TrustAccount.cs:3662](../../../UBClasses/TrustAccount.cs#L3662) |
| `UBTrustChequeAdd` | [Account & Plan](by-topic/account-plan.md) | [L646699](../../../ScriptDB/000_4_CreateSP.sql#L646699) | 1 / 1 file | 0 / 0 | [TrustAccount.cs:2829](../../../UBClasses/TrustAccount.cs#L2829) |
| `UBTrustChequeDelete` | [Account & Plan](by-topic/account-plan.md) | [L646804](../../../ScriptDB/000_4_CreateSP.sql#L646804) | 1 / 1 file | 0 / 0 | [TrustAccount.cs:2887](../../../UBClasses/TrustAccount.cs#L2887) |
| `UBTrustChequeInfo` | [Account & Plan](by-topic/account-plan.md) | [L646850](../../../ScriptDB/000_4_CreateSP.sql#L646850) | 1 / 1 file | 0 / 0 | [TrustAccount.cs:2779](../../../UBClasses/TrustAccount.cs#L2779) |
| `UBTrustChequeInfoUpdate` | [Account & Plan](by-topic/account-plan.md) | [L646881](../../../ScriptDB/000_4_CreateSP.sql#L646881) | — | 1 / 0 | — |
| `UBTrustChequeItemAdd` | [Account & Plan](by-topic/account-plan.md) | [L646921](../../../ScriptDB/000_4_CreateSP.sql#L646921) | 1 / 1 file | 0 / 0 | [TrustAccount.cs:2991](../../../UBClasses/TrustAccount.cs#L2991) |
| `UBTrustChequeItemDelete` | [Account & Plan](by-topic/account-plan.md) | [L646996](../../../ScriptDB/000_4_CreateSP.sql#L646996) | 1 / 1 file | 0 / 0 | [TrustAccount.cs:3062](../../../UBClasses/TrustAccount.cs#L3062) |
| `UBTrustChequeItemInfo` | [Account & Plan](by-topic/account-plan.md) | [L647034](../../../ScriptDB/000_4_CreateSP.sql#L647034) | 1 / 1 file | 0 / 0 | [TrustAccount.cs:2936](../../../UBClasses/TrustAccount.cs#L2936) |
| `UBTrustChequeItemUpdate` | [Account & Plan](by-topic/account-plan.md) | [L647068](../../../ScriptDB/000_4_CreateSP.sql#L647068) | 1 / 1 file | 0 / 0 | [TrustAccount.cs:2993](../../../UBClasses/TrustAccount.cs#L2993) |
| `UBTrustChequeList` | [Account & Plan](by-topic/account-plan.md) | [L647137](../../../ScriptDB/000_4_CreateSP.sql#L647137) | 1 / 1 file | 0 / 0 | [TrustAccount.cs:2673](../../../UBClasses/TrustAccount.cs#L2673) |
| `UBTrustChequeListDetail` | [Account & Plan](by-topic/account-plan.md) | [L647281](../../../ScriptDB/000_4_CreateSP.sql#L647281) | 1 / 1 file | 0 / 3 | [CPayroll.cs:1286](../../../VieFUNDPdf/CPayroll.cs#L1286) |
| `UBTrustChequeTrxList` | [Account & Plan](by-topic/account-plan.md) | [L647594](../../../ScriptDB/000_4_CreateSP.sql#L647594) | 1 / 1 file | 0 / 0 | [TrustAccount.cs:2729](../../../UBClasses/TrustAccount.cs#L2729) |
| `UBTrustChequeUpdate` | [Account & Plan](by-topic/account-plan.md) | [L647696](../../../ScriptDB/000_4_CreateSP.sql#L647696) | 1 / 1 file | 0 / 0 | [TrustAccount.cs:2831](../../../UBClasses/TrustAccount.cs#L2831) |
| `UBTrustDepositClientBankList` | [Account & Plan](by-topic/account-plan.md) | [L647798](../../../ScriptDB/000_4_CreateSP.sql#L647798) | — | 0 / 1 | — |
| `UBTrustDepositComboList` | [Account & Plan](by-topic/account-plan.md) | [L647823](../../../ScriptDB/000_4_CreateSP.sql#L647823) | — | 0 / 11 | — |
| `UBTrustDepositPlanBankList` | [Account & Plan](by-topic/account-plan.md) | [L647873](../../../ScriptDB/000_4_CreateSP.sql#L647873) | — | 0 / 1 | — |
| `UBTrustDepositRecalcOne` | [Account & Plan](by-topic/account-plan.md) | [L647900](../../../ScriptDB/000_4_CreateSP.sql#L647900) | — | 4 / 0 | — |
| `UBTrustDepositRefresh` | [Account & Plan](by-topic/account-plan.md) | [L647935](../../../ScriptDB/000_4_CreateSP.sql#L647935) | — | 0 / 0 | — |
| `UBTrustDepositRefreshTrx` | [Account & Plan](by-topic/account-plan.md) | [L647968](../../../ScriptDB/000_4_CreateSP.sql#L647968) | 1 / 1 file | 0 / 0 | [TrustAccount.cs:3106](../../../UBClasses/TrustAccount.cs#L3106) |
| `UBTrustDetachTrx` | [Account & Plan](by-topic/account-plan.md) | [L648106](../../../ScriptDB/000_4_CreateSP.sql#L648106) | 1 / 1 file | 0 / 0 | [TrustAccount.cs:1157](../../../UBClasses/TrustAccount.cs#L1157) |
| `UBTrusteeFeeCodeList` | [Commission & Fee](by-topic/commission-fee.md) | [L648162](../../../ScriptDB/000_4_CreateSP.sql#L648162) | — | 3 / 0 | — |
| `UBTrusteeFeePlanBankList` | [Commission & Fee](by-topic/commission-fee.md) | [L648176](../../../ScriptDB/000_4_CreateSP.sql#L648176) | — | 0 / 1 | — |
| `UBTrustEFTAddPayClient` | [Account & Plan](by-topic/account-plan.md) | [L648204](../../../ScriptDB/000_4_CreateSP.sql#L648204) | — | 0 / 1 | — |
| `UBTrustEFTInfoUpdate` | [Account & Plan](by-topic/account-plan.md) | [L648258](../../../ScriptDB/000_4_CreateSP.sql#L648258) | — | 2 / 0 | — |
| `UBTrustEFTSettlementDateSynch` | [Account & Plan](by-topic/account-plan.md) | [L648294](../../../ScriptDB/000_4_CreateSP.sql#L648294) | — | 0 / 0 | — |
| `UBTrustFeeAdd` | [Commission & Fee](by-topic/commission-fee.md) | [L648333](../../../ScriptDB/000_4_CreateSP.sql#L648333) | — | 2 / 0 | — |
| `UBTrustFEItemAdd` | [Account & Plan](by-topic/account-plan.md) | [L648475](../../../ScriptDB/000_4_CreateSP.sql#L648475) | — | 2 / 0 | — |
| `UBTrustFindDuplicationFromSell` | [Account & Plan](by-topic/account-plan.md) | [L648535](../../../ScriptDB/000_4_CreateSP.sql#L648535) | — | 0 / 0 | — |
| `UBTrustFix1DayDeposit` | [Account & Plan](by-topic/account-plan.md) | [L648571](../../../ScriptDB/000_4_CreateSP.sql#L648571) | — | 0 / 1 | — |
| `UBTrustFixDeposit4ClientName` | [Account & Plan](by-topic/account-plan.md) | [L648599](../../../ScriptDB/000_4_CreateSP.sql#L648599) | — | 1 / 0 | — |
| `UBTrustFixDeposit4ClientNameByPlanID` | [Account & Plan](by-topic/account-plan.md) | [L648681](../../../ScriptDB/000_4_CreateSP.sql#L648681) | 1 / 1 file | 0 / 1 | [TrustAccount.cs:4254](../../../UBClasses/TrustAccount.cs#L4254) |
| `UBTrustGetBalance` | [Account & Plan](by-topic/account-plan.md) | [L648722](../../../ScriptDB/000_4_CreateSP.sql#L648722) | 1 / 1 file | 0 / 0 | [TrustAccount.cs:728](../../../UBClasses/TrustAccount.cs#L728) |
| `UBTrustGetOne` | [Account & Plan](by-topic/account-plan.md) | [L648788](../../../ScriptDB/000_4_CreateSP.sql#L648788) | 1 / 1 file | 0 / 0 | [TrustAccount.cs:4948](../../../UBClasses/TrustAccount.cs#L4948) |
| `UBTrustInfo` | [Account & Plan](by-topic/account-plan.md) | [L648980](../../../ScriptDB/000_4_CreateSP.sql#L648980) | 1 / 1 file | 0 / 2 | [TrustAccount.cs:1384](../../../UBClasses/TrustAccount.cs#L1384) |
| `UBTrustListAll` | [Account & Plan](by-topic/account-plan.md) | [L649176](../../../ScriptDB/000_4_CreateSP.sql#L649176) | 1 / 1 file | 0 / 0 | [TrustAccount.cs:4461](../../../UBClasses/TrustAccount.cs#L4461) |
| `UBTrustListBuyShares` | [Account & Plan](by-topic/account-plan.md) | [L649444](../../../ScriptDB/000_4_CreateSP.sql#L649444) | 1 / 1 file | 0 / 3 | [TrustAccount.cs:2556](../../../UBClasses/TrustAccount.cs#L2556) |
| `UBTrustListCommSupplier` | [Commission & Fee](by-topic/commission-fee.md) | [L649571](../../../ScriptDB/000_4_CreateSP.sql#L649571) | 1 / 1 file | 0 / 6 | [TrustAccount.cs:2263](../../../UBClasses/TrustAccount.cs#L2263) |
| `UBTrustListCommSupplierTotal` | [Commission & Fee](by-topic/commission-fee.md) | [L649855](../../../ScriptDB/000_4_CreateSP.sql#L649855) | — | 1 / 0 | — |
| `UBTrustListCommTotal` | [Commission & Fee](by-topic/commission-fee.md) | [L649906](../../../ScriptDB/000_4_CreateSP.sql#L649906) | — | 1 / 0 | — |
| `UBTrustListIN` | [Account & Plan](by-topic/account-plan.md) | [L649958](../../../ScriptDB/000_4_CreateSP.sql#L649958) | 1 / 1 file | 0 / 5 | [TrustAccount.cs:1813](../../../UBClasses/TrustAccount.cs#L1813) |
| `UBTrustListINDetail` | [Account & Plan](by-topic/account-plan.md) | [L650955](../../../ScriptDB/000_4_CreateSP.sql#L650955) | 1 / 1 file | 0 / 4 | [TrustAccount.cs:1882](../../../UBClasses/TrustAccount.cs#L1882) |
| `UBTrustListINTotal` | [Account & Plan](by-topic/account-plan.md) | [L651220](../../../ScriptDB/000_4_CreateSP.sql#L651220) | — | 1 / 0 | — |
| `UBTrustListINTotalDetail` | [Account & Plan](by-topic/account-plan.md) | [L651278](../../../ScriptDB/000_4_CreateSP.sql#L651278) | — | 1 / 0 | — |
| `UBTrustListSettlementList` | [Account & Plan](by-topic/account-plan.md) | [L651330](../../../ScriptDB/000_4_CreateSP.sql#L651330) | 1 / 1 file | 0 / 3 | [TrustAccount.cs:2495](../../../UBClasses/TrustAccount.cs#L2495) |
| `UBTrustListTrxSupplier` | [Account & Plan](by-topic/account-plan.md) | [L651581](../../../ScriptDB/000_4_CreateSP.sql#L651581) | 1 / 1 file | 0 / 6 | [TrustAccount.cs:2181](../../../UBClasses/TrustAccount.cs#L2181) |
| `UBTrustListTrxSupplierPrn` | [Account & Plan](by-topic/account-plan.md) | [L656042](../../../ScriptDB/000_4_CreateSP.sql#L656042) | 1 / 1 file | 0 / 4 | [TrustAccount.cs:2402](../../../UBClasses/TrustAccount.cs#L2402) |
| `UBTrustListTrxSupplierTotal` | [Account & Plan](by-topic/account-plan.md) | [L656160](../../../ScriptDB/000_4_CreateSP.sql#L656160) | — | 2 / 0 | — |
| `UBTrustListTrxTotal` | [Account & Plan](by-topic/account-plan.md) | [L656211](../../../ScriptDB/000_4_CreateSP.sql#L656211) | — | 1 / 0 | — |
| `UBTrustMoveDepositFromPlan2Plan` | [Account & Plan](by-topic/account-plan.md) | [L656263](../../../ScriptDB/000_4_CreateSP.sql#L656263) | — | 0 / 0 | — |
| `UBTrustNoCashSuspiciousList` | [Account & Plan](by-topic/account-plan.md) | [L656297](../../../ScriptDB/000_4_CreateSP.sql#L656297) | — | 0 / 0 | — |
| `UBTrustNonCashExternalTransfer` | [Account & Plan](by-topic/account-plan.md) | [L656315](../../../ScriptDB/000_4_CreateSP.sql#L656315) | — | 0 / 0 | — |
| `UBTrustNonCashTrxNoTax` | [Account & Plan](by-topic/account-plan.md) | [L656340](../../../ScriptDB/000_4_CreateSP.sql#L656340) | — | 0 / 0 | — |
| `UBTrustPlanBalanceList` | [Account & Plan](by-topic/account-plan.md) | [L656363](../../../ScriptDB/000_4_CreateSP.sql#L656363) | 1 / 1 file | 0 / 3 | [TrustAccount.cs:3834](../../../UBClasses/TrustAccount.cs#L3834) |
| `UBTrustPlanID` | [Account & Plan](by-topic/account-plan.md) | [L656786](../../../ScriptDB/000_4_CreateSP.sql#L656786) | 1 / 1 file | 0 / 0 | [TrustAccount.cs:778](../../../UBClasses/TrustAccount.cs#L778) |
| `UBTrustPlanListCurrent` | [Account & Plan](by-topic/account-plan.md) | [L656801](../../../ScriptDB/000_4_CreateSP.sql#L656801) | — | 0 / 0 | — |
| `UBTrustPlanTrxList` | [Account & Plan](by-topic/account-plan.md) | [L656845](../../../ScriptDB/000_4_CreateSP.sql#L656845) | 1 / 1 file | 0 / 0 | [TrustAccount.cs:3977](../../../UBClasses/TrustAccount.cs#L3977) |
| `UBTrustRedemptionClientBankList` | [Account & Plan](by-topic/account-plan.md) | [L656960](../../../ScriptDB/000_4_CreateSP.sql#L656960) | — | 0 / 1 | — |
| `UBTrustRedemptionPlanBankList` | [Account & Plan](by-topic/account-plan.md) | [L656985](../../../ScriptDB/000_4_CreateSP.sql#L656985) | — | 0 / 1 | — |
| `UBTrustRefresh1Plan` | [Account & Plan](by-topic/account-plan.md) | [L657010](../../../ScriptDB/000_4_CreateSP.sql#L657010) | — | 0 / 0 | — |
| `UBTrustRemoveNonCashTrx` | [Account & Plan](by-topic/account-plan.md) | [L657120](../../../ScriptDB/000_4_CreateSP.sql#L657120) | 1 / 1 file | 0 / 0 | [TrustAccount.cs:4294](../../../UBClasses/TrustAccount.cs#L4294) |
| `UBTrustRemoveOrder` | [Account & Plan](by-topic/account-plan.md) | [L657270](../../../ScriptDB/000_4_CreateSP.sql#L657270) | — | 15 / 2 | — |
| `UBTrustRemoveTrx` | [Account & Plan](by-topic/account-plan.md) | [L657355](../../../ScriptDB/000_4_CreateSP.sql#L657355) | — | 1 / 2 | — |
| `UBTrustRemoveWithDrawal` | [Account & Plan](by-topic/account-plan.md) | [L657436](../../../ScriptDB/000_4_CreateSP.sql#L657436) | 1 / 1 file | 0 / 0 | [TrustAccount.cs:1210](../../../UBClasses/TrustAccount.cs#L1210) |
| `UBTrustRESPContributionUpdate` | [Account & Plan](by-topic/account-plan.md) | [L657501](../../../ScriptDB/000_4_CreateSP.sql#L657501) | 1 / 1 file | 0 / 1 | [TrustAccount.cs:5155](../../../UBClasses/TrustAccount.cs#L5155) |
| `UBTrustRESPPYMTTrxAdd` | [Account & Plan](by-topic/account-plan.md) | [L657616](../../../ScriptDB/000_4_CreateSP.sql#L657616) | — | 0 / 1 | — |
| `UBTrustRESPTrxAdd` | [Account & Plan](by-topic/account-plan.md) | [L657694](../../../ScriptDB/000_4_CreateSP.sql#L657694) | — | 4 / 2 | — |
| `UBTrustSelectionUpdateComm` | [Commission & Fee](by-topic/commission-fee.md) | [L657829](../../../ScriptDB/000_4_CreateSP.sql#L657829) | — | 0 / 0 | — |
| `UBTrustSelectionUpdateEFT` | [Account & Plan](by-topic/account-plan.md) | [L657874](../../../ScriptDB/000_4_CreateSP.sql#L657874) | — | 0 / 0 | — |
| `UBTrustSelectionUpdateIN` | [Account & Plan](by-topic/account-plan.md) | [L657919](../../../ScriptDB/000_4_CreateSP.sql#L657919) | — | 0 / 0 | — |
| `UBTrustSelectionUpdateINDetail` | [Account & Plan](by-topic/account-plan.md) | [L657963](../../../ScriptDB/000_4_CreateSP.sql#L657963) | — | 0 / 0 | — |
| `UBTrustSelectionUpdateSupplier` | [Account & Plan](by-topic/account-plan.md) | [L658007](../../../ScriptDB/000_4_CreateSP.sql#L658007) | — | 0 / 0 | — |
| `UBTrustSelectionUpdateSupplierComm` | [Commission & Fee](by-topic/commission-fee.md) | [L658052](../../../ScriptDB/000_4_CreateSP.sql#L658052) | — | 0 / 0 | — |
| `UBTrustSelectionUpdateTrx` | [Account & Plan](by-topic/account-plan.md) | [L658097](../../../ScriptDB/000_4_CreateSP.sql#L658097) | — | 0 / 0 | — |
| `UBTrustSellCOFAdd` | [Account & Plan](by-topic/account-plan.md) | [L658144](../../../ScriptDB/000_4_CreateSP.sql#L658144) | — | 5 / 0 | — |
| `UBTrustSellGICAdd` | [Fund & GIC](by-topic/fund-gic.md) | [L658275](../../../ScriptDB/000_4_CreateSP.sql#L658275) | — | 3 / 0 | — |
| `UBTrustSellTrxAdd` | [Account & Plan](by-topic/account-plan.md) | [L658353](../../../ScriptDB/000_4_CreateSP.sql#L658353) | — | 10 / 0 | — |
| `UBTrustSellTrxUpdate` | [Account & Plan](by-topic/account-plan.md) | [L658463](../../../ScriptDB/000_4_CreateSP.sql#L658463) | — | 1 / 0 | — |
| `UBTrustSettle` | [Account & Plan](by-topic/account-plan.md) | [L658507](../../../ScriptDB/000_4_CreateSP.sql#L658507) | 1 / 1 file | 0 / 6 | [TrustAccount.cs:1657](../../../UBClasses/TrustAccount.cs#L1657) |
| `UBTrustSettleOne` | [Account & Plan](by-topic/account-plan.md) | [L658796](../../../ScriptDB/000_4_CreateSP.sql#L658796) | — | 1 / 4 | — |
| `UBTrustStatusList` | [Account & Plan](by-topic/account-plan.md) | [L658961](../../../ScriptDB/000_4_CreateSP.sql#L658961) | — | 3 / 0 | — |
| `UBTrustStatusUpdate` | [Account & Plan](by-topic/account-plan.md) | [L658987](../../../ScriptDB/000_4_CreateSP.sql#L658987) | 1 / 1 file | 0 / 0 | [TrustAccount.cs:4773](../../../UBClasses/TrustAccount.cs#L4773) |
| `UBTrustSummaryByPlan_RRSP` | [Account & Plan](by-topic/account-plan.md) | [L659036](../../../ScriptDB/000_4_CreateSP.sql#L659036) | — | 0 / 0 | — |
| `UBTrustSummaryByPlan_TFSA` | [Account & Plan](by-topic/account-plan.md) | [L659124](../../../ScriptDB/000_4_CreateSP.sql#L659124) | — | 0 / 0 | — |
| `UBTrustTransferTrxRefresh` | [Account & Plan](by-topic/account-plan.md) | [L659199](../../../ScriptDB/000_4_CreateSP.sql#L659199) | 1 / 1 file | 3 / 1 | [Trx.cs:3503](../../../UBClasses/Trx.cs#L3503) |
| `UBTrustTrx2Attach` | [Account & Plan](by-topic/account-plan.md) | [L659503](../../../ScriptDB/000_4_CreateSP.sql#L659503) | — | 1 / 0 | — |
| `UBTrustTrxAdd` | [Account & Plan](by-topic/account-plan.md) | [L659565](../../../ScriptDB/000_4_CreateSP.sql#L659565) | 1 / 1 file | 0 / 2 | [TrustAccount.cs:824](../../../UBClasses/TrustAccount.cs#L824) |
| `UBTrustTrxAddfmrSpouse4InKindTrnsf` | [Account & Plan](by-topic/account-plan.md) | [L659723](../../../ScriptDB/000_4_CreateSP.sql#L659723) | 1 / 1 file | 0 / 1 | [TrustAccount.cs:4830](../../../UBClasses/TrustAccount.cs#L4830) |
| `UBTrustTrxAddWithdrawal` | [Account & Plan](by-topic/account-plan.md) | [L659872](../../../ScriptDB/000_4_CreateSP.sql#L659872) | 1 / 1 file | 0 / 7 | [TrustAccount.cs:3163](../../../UBClasses/TrustAccount.cs#L3163) |
| `UBTrustTrxDetailNew` | [Account & Plan](by-topic/account-plan.md) | [L660418](../../../ScriptDB/000_4_CreateSP.sql#L660418) | — | 15 / 1 | — |
| `UBTrustTrxDetailRemove` | [Account & Plan](by-topic/account-plan.md) | [L660534](../../../ScriptDB/000_4_CreateSP.sql#L660534) | — | 2 / 1 | — |
| `UBTrustTrxDetailUpdate` | [Account & Plan](by-topic/account-plan.md) | [L660576](../../../ScriptDB/000_4_CreateSP.sql#L660576) | — | 1 / 1 | — |
| `UBTrustTrxInfo` | [Account & Plan](by-topic/account-plan.md) | [L660685](../../../ScriptDB/000_4_CreateSP.sql#L660685) | 1 / 1 file | 0 / 3 | [TrustAccount.cs:672](../../../UBClasses/TrustAccount.cs#L672) |
| `UBTrustTrxInfoEstate` | [Account & Plan](by-topic/account-plan.md) | [L660794](../../../ScriptDB/000_4_CreateSP.sql#L660794) | — | 1 / 0 | — |
| `UBTrustTrxInfoRESP` | [Account & Plan](by-topic/account-plan.md) | [L660838](../../../ScriptDB/000_4_CreateSP.sql#L660838) | — | 1 / 1 | — |
| `UBTrustTrxInfoRESPPYMT` | [Account & Plan](by-topic/account-plan.md) | [L660860](../../../ScriptDB/000_4_CreateSP.sql#L660860) | — | 0 / 0 | — |
| `UBTrustTrxInKindTrnsfSaveReceiptOption` | [Account & Plan](by-topic/account-plan.md) | [L660909](../../../ScriptDB/000_4_CreateSP.sql#L660909) | 1 / 1 file | 0 / 0 | [TrustAccount.cs:4896](../../../UBClasses/TrustAccount.cs#L4896) |
| `UBTrustTrxList` | [Account & Plan](by-topic/account-plan.md) | [L660950](../../../ScriptDB/000_4_CreateSP.sql#L660950) | 1 / 1 file | 0 / 0 | [TrustAccount.cs:615](../../../UBClasses/TrustAccount.cs#L615) |
| `UBTrustTrxListSet` | [Account & Plan](by-topic/account-plan.md) | [L661029](../../../ScriptDB/000_4_CreateSP.sql#L661029) | 1 / 1 file | 0 / 1 | [TrustAccount.cs:503](../../../UBClasses/TrustAccount.cs#L503) |
| `UBTrustTrxListSetNonCash` | [Account & Plan](by-topic/account-plan.md) | [L661162](../../../ScriptDB/000_4_CreateSP.sql#L661162) | 1 / 1 file | 0 / 1 | [TrustAccount.cs:559](../../../UBClasses/TrustAccount.cs#L559) |
| `UBTrustTrxListSetNonCashWithNoTax` | [Account & Plan](by-topic/account-plan.md) | [L661291](../../../ScriptDB/000_4_CreateSP.sql#L661291) | — | 0 / 0 | — |
| `UBTrustTrxMove2Plan` | [Account & Plan](by-topic/account-plan.md) | [L661344](../../../ScriptDB/000_4_CreateSP.sql#L661344) | — | 0 / 1 | — |
| `UBTrustTrxOrphanListSell` | [Account & Plan](by-topic/account-plan.md) | [L661383](../../../ScriptDB/000_4_CreateSP.sql#L661383) | — | 0 / 0 | — |
| `UBTrustTrxRESPTrxUpdate` | [Account & Plan](by-topic/account-plan.md) | [L661419](../../../ScriptDB/000_4_CreateSP.sql#L661419) | — | 4 / 1 | — |
| `UBTrustTrxScanSpecific` | [Account & Plan](by-topic/account-plan.md) | [L661610](../../../ScriptDB/000_4_CreateSP.sql#L661610) | — | 0 / 1 | — |
| `UBTrustTrxSetEffectiveDate` | [Account & Plan](by-topic/account-plan.md) | [L661663](../../../ScriptDB/000_4_CreateSP.sql#L661663) | — | 0 / 0 | — |
| `UBTrustTrxTypeList` | [Account & Plan](by-topic/account-plan.md) | [L661688](../../../ScriptDB/000_4_CreateSP.sql#L661688) | — | 2 / 0 | — |
| `UBTrustTrxTypeListExtra` | [Account & Plan](by-topic/account-plan.md) | [L661716](../../../ScriptDB/000_4_CreateSP.sql#L661716) | — | 0 / 0 | — |
| `UBTrustTrxUpdate` | [Account & Plan](by-topic/account-plan.md) | [L661763](../../../ScriptDB/000_4_CreateSP.sql#L661763) | 1 / 1 file | 0 / 3 | [TrustAccount.cs:824](../../../UBClasses/TrustAccount.cs#L824) |
| `UBTrustTrxUpdateWDR` | [Account & Plan](by-topic/account-plan.md) | [L661952](../../../ScriptDB/000_4_CreateSP.sql#L661952) | 1 / 1 file | 0 / 6 | [TrustAccount.cs:3163](../../../UBClasses/TrustAccount.cs#L3163) |
| `UBTrustType2List` | [Account & Plan](by-topic/account-plan.md) | [L662406](../../../ScriptDB/000_4_CreateSP.sql#L662406) | — | 1 / 0 | — |
| `UBTrustTypeList` | [Account & Plan](by-topic/account-plan.md) | [L662433](../../../ScriptDB/000_4_CreateSP.sql#L662433) | — | 1 / 0 | — |
| `UBTrustUnlockCash` | [Account & Plan](by-topic/account-plan.md) | [L662466](../../../ScriptDB/000_4_CreateSP.sql#L662466) | 1 / 1 file | 0 / 0 | [CashAccount.cs:342](../../../UBClasses/CashAccount.cs#L342) |
| `UBTrustUnSettle` | [Account & Plan](by-topic/account-plan.md) | [L662561](../../../ScriptDB/000_4_CreateSP.sql#L662561) | 1 / 1 file | 2 / 0 | [TrustAccount.cs:1708](../../../UBClasses/TrustAccount.cs#L1708) |
| `UBTrustUnSettleTagged` | [Account & Plan](by-topic/account-plan.md) | [L662702](../../../ScriptDB/000_4_CreateSP.sql#L662702) | 1 / 1 file | 0 / 1 | [TrustAccount.cs:1754](../../../UBClasses/TrustAccount.cs#L1754) |
| `UBTrustUpdateBuyOrder` | [Account & Plan](by-topic/account-plan.md) | [L662807](../../../ScriptDB/000_4_CreateSP.sql#L662807) | — | 0 / 0 | — |
| `UBTrustUpdateOne` | [Account & Plan](by-topic/account-plan.md) | [L662855](../../../ScriptDB/000_4_CreateSP.sql#L662855) | 1 / 1 file | 0 / 0 | [TrustAccount.cs:5022](../../../UBClasses/TrustAccount.cs#L5022) |
| `UBTrxAdd` | [Trading & Orders](by-topic/trading-orders.md) | [L663106](../../../ScriptDB/000_4_CreateSP.sql#L663106) | — | 50 / 2 | — |
| `UBTrxAdd_Additions` | [Trading & Orders](by-topic/trading-orders.md) | [L663390](../../../ScriptDB/000_4_CreateSP.sql#L663390) | — | 8 / 0 | — |
| `UBTrxAddBalanceForward` | [Trading & Orders](by-topic/trading-orders.md) | [L663412](../../../ScriptDB/000_4_CreateSP.sql#L663412) | — | 2 / 0 | — |
| `UBTrxAddComboList` | [Trading & Orders](by-topic/trading-orders.md) | [L663501](../../../ScriptDB/000_4_CreateSP.sql#L663501) | — | 0 / 4 | — |
| `UBTrxAmtTypeBulkSwitch` | [Trading & Orders](by-topic/trading-orders.md) | [L663532](../../../ScriptDB/000_4_CreateSP.sql#L663532) | — | 1 / 0 | — |
| `UBTrxAmtTypeEO` | [Trading & Orders](by-topic/trading-orders.md) | [L663558](../../../ScriptDB/000_4_CreateSP.sql#L663558) | 1 / 1 file | 0 / 0 | [Trx.cs:570](../../../UBClasses/Trx.cs#L570) |
| `UBTrxAOTList` | [Trading & Orders](by-topic/trading-orders.md) | [L663613](../../../ScriptDB/000_4_CreateSP.sql#L663613) | 1 / 1 file | 0 / 0 | [Trx.cs:2813](../../../UBClasses/Trx.cs#L2813) |
| `UBTrxBlotterList` | [Trading & Orders](by-topic/trading-orders.md) | [L663688](../../../ScriptDB/000_4_CreateSP.sql#L663688) | 1 / 1 file | 0 / 0 | [TrxBlotter.cs:69](../../../UBClasses/TrxBlotter.cs#L69) |
| `UBTrxBuyCommissionRebateProcess` | [Commission & Fee](by-topic/commission-fee.md) | [L663925](../../../ScriptDB/000_4_CreateSP.sql#L663925) | — | 1 / 2 | — |
| `UBTrxBuyOrderCheck4Cash2SendOnePlan` | [Account & Plan](by-topic/account-plan.md) | [L664000](../../../ScriptDB/000_4_CreateSP.sql#L664000) | — | 2 / 1 | — |
| `UBTrxBuyPAC` | [Trading & Orders](by-topic/trading-orders.md) | [L664038](../../../ScriptDB/000_4_CreateSP.sql#L664038) | — | 3 / 2 | — |
| `UBTrxCalcAverageCost` | [Trading & Orders](by-topic/trading-orders.md) | [L664150](../../../ScriptDB/000_4_CreateSP.sql#L664150) | — | 0 / 0 | — |
| `UBTrxCalcAverageCost4Update` | [Trading & Orders](by-topic/trading-orders.md) | [L664173](../../../ScriptDB/000_4_CreateSP.sql#L664173) | — | 6 / 0 | — |
| `UBTrxClientList` | [Client & KYC](by-topic/client-kyc.md) | [L664365](../../../ScriptDB/000_4_CreateSP.sql#L664365) | 1 / 1 file | 0 / 0 | [Trx.cs:2309](../../../UBClasses/Trx.cs#L2309) |
| `UBTrxClientPlanAccountInfo` | [Account & Plan](by-topic/account-plan.md) | [L664418](../../../ScriptDB/000_4_CreateSP.sql#L664418) | 1 / 1 file | 0 / 0 | [Trx.cs:3676](../../../UBClasses/Trx.cs#L3676) |
| `UBTrxConf4PdfTaggedList` | [Trading & Orders](by-topic/trading-orders.md) | [L664525](../../../ScriptDB/000_4_CreateSP.sql#L664525) | 1 / 1 file | 0 / 0 | [CTrxConfirmation.cs:574](../../../UBClasses/CTrxConfirmation.cs#L574) |
| `UBTrxConfClientID` | [Client & KYC](by-topic/client-kyc.md) | [L664601](../../../ScriptDB/000_4_CreateSP.sql#L664601) | — | 0 / 0 | — |
| `UBTrxConfDefList` | [Trading & Orders](by-topic/trading-orders.md) | [L664613](../../../ScriptDB/000_4_CreateSP.sql#L664613) | — | 0 / 0 | — |
| `UBTrxConfDeliverTagged` | [Trading & Orders](by-topic/trading-orders.md) | [L664635](../../../ScriptDB/000_4_CreateSP.sql#L664635) | — | 0 / 1 | — |
| `UBTrxConfirmationDeliverItem` | [Trading & Orders](by-topic/trading-orders.md) | [L664679](../../../ScriptDB/000_4_CreateSP.sql#L664679) | — | 0 / 1 | — |
| `UBTrxConfirmationDeliverItemX` | [Trading & Orders](by-topic/trading-orders.md) | [L664839](../../../ScriptDB/000_4_CreateSP.sql#L664839) | 1 / 1 file | 1 / 1 | [TradeConfirmation.cs:548](../../../VieFUNDPdf/TradeConfirmation.cs#L548) |
| `UBTrxConfirmationDeliverTaggedItemX` | [Trading & Orders](by-topic/trading-orders.md) | [L665048](../../../ScriptDB/000_4_CreateSP.sql#L665048) | — | 1 / 1 | — |
| `UBTrxConfirmationList` | [Trading & Orders](by-topic/trading-orders.md) | [L665279](../../../ScriptDB/000_4_CreateSP.sql#L665279) | 1 / 1 file | 0 / 1 | [Document.cs:3696](../../../UBClasses/Document.cs#L3696) |
| `UBTrxConfirmationListClient` | [Client & KYC](by-topic/client-kyc.md) | [L665672](../../../ScriptDB/000_4_CreateSP.sql#L665672) | 1 / 1 file | 0 / 1 | [CTrxConfirmation.cs:264](../../../UBClasses/CTrxConfirmation.cs#L264) |
| `UBTrxConfirmationListDetail` | [Trading & Orders](by-topic/trading-orders.md) | [L666214](../../../ScriptDB/000_4_CreateSP.sql#L666214) | 1 / 1 file | 0 / 0 | [CTrxConfirmation.cs:331](../../../UBClasses/CTrxConfirmation.cs#L331) |
| `UBTrxConfirmationListOneClient` | [Client & KYC](by-topic/client-kyc.md) | [L666418](../../../ScriptDB/000_4_CreateSP.sql#L666418) | 1 / 1 file | 0 / 0 | [Document.cs:3568](../../../UBClasses/Document.cs#L3568) |
| `UBTrxConfirmationObjByID` | [Trading & Orders](by-topic/trading-orders.md) | [L666483](../../../ScriptDB/000_4_CreateSP.sql#L666483) | 1 / 1 file | 0 / 0 | [Document.cs:3636](../../../UBClasses/Document.cs#L3636) |
| `UBTrxConfirmationRemove` | [Trading & Orders](by-topic/trading-orders.md) | [L666510](../../../ScriptDB/000_4_CreateSP.sql#L666510) | — | 0 / 0 | — |
| `UBTrxConfirmationRemoveItem` | [Trading & Orders](by-topic/trading-orders.md) | [L666525](../../../ScriptDB/000_4_CreateSP.sql#L666525) | — | 0 / 0 | — |
| `UBTrxConfirmationSavePdfObj` | [Trading & Orders](by-topic/trading-orders.md) | [L666575](../../../ScriptDB/000_4_CreateSP.sql#L666575) | 1 / 1 file | 0 / 1 | [TradeConfirmation.cs:505](../../../VieFUNDPdf/TradeConfirmation.cs#L505) |
| `UBTrxConfirmationSet` | [Trading & Orders](by-topic/trading-orders.md) | [L666641](../../../ScriptDB/000_4_CreateSP.sql#L666641) | 1 / 1 file | 0 / 8 | [TradeConfirmation.cs:595](../../../VieFUNDPdf/TradeConfirmation.cs#L595) |
| `UBTrxConfirmationSetRedo` | [Trading & Orders](by-topic/trading-orders.md) | [L667109](../../../ScriptDB/000_4_CreateSP.sql#L667109) | 1 / 1 file | 0 / 8 | [TradeConfirmation.cs:653](../../../VieFUNDPdf/TradeConfirmation.cs#L653) |
| `UBTrxConfirmationViewComboList` | [Trading & Orders](by-topic/trading-orders.md) | [L667499](../../../ScriptDB/000_4_CreateSP.sql#L667499) | — | 0 / 5 | — |
| `UBTrxConfPdf_EndTask` | [Trading & Orders](by-topic/trading-orders.md) | [L667536](../../../ScriptDB/000_4_CreateSP.sql#L667536) | — | 0 / 0 | — |
| `UBTrxConfPdf_GetTask` | [Trading & Orders](by-topic/trading-orders.md) | [L667555](../../../ScriptDB/000_4_CreateSP.sql#L667555) | — | 0 / 0 | — |
| `UBTrxConfPendingList` | [Trading & Orders](by-topic/trading-orders.md) | [L667592](../../../ScriptDB/000_4_CreateSP.sql#L667592) | 1 / 1 file | 0 / 0 | [CTrxConfirmation.cs:45](../../../UBClasses/CTrxConfirmation.cs#L45) |
| `UBTrxConfPendingSelectionUpdate` | [Trading & Orders](by-topic/trading-orders.md) | [L668671](../../../ScriptDB/000_4_CreateSP.sql#L668671) | — | 0 / 0 | — |
| `UBTrxConfSelectionUpdate` | [Trading & Orders](by-topic/trading-orders.md) | [L668712](../../../ScriptDB/000_4_CreateSP.sql#L668712) | — | 0 / 0 | — |
| `UBTrxConfUndoDeliverTagged` | [Fundserv & Import](by-topic/fundserv-import.md) | [L668753](../../../ScriptDB/000_4_CreateSP.sql#L668753) | — | 0 / 0 | — |
| `UBTrxConfViewList4Pdf` | [Trading & Orders](by-topic/trading-orders.md) | [L668803](../../../ScriptDB/000_4_CreateSP.sql#L668803) | 1 / 1 file | 0 / 0 | [TradeConfirmation.cs:194](../../../VieFUNDPdf/TradeConfirmation.cs#L194) |
| `UBTrxContrWdrCodeList` | [Trading & Orders](by-topic/trading-orders.md) | [L668848](../../../ScriptDB/000_4_CreateSP.sql#L668848) | — | 1 / 0 | — |
| `UBTrxConversion` | [Trading & Orders](by-topic/trading-orders.md) | [L668873](../../../ScriptDB/000_4_CreateSP.sql#L668873) | — | 1 / 0 | — |
| `UBTrxConversionProcess` | [Trading & Orders](by-topic/trading-orders.md) | [L668962](../../../ScriptDB/000_4_CreateSP.sql#L668962) | — | 2 / 2 | — |
| `UBTrxConversionProcessAll` | [Trading & Orders](by-topic/trading-orders.md) | [L669189](../../../ScriptDB/000_4_CreateSP.sql#L669189) | — | 4 / 1 | — |
| `UBTrxDeleteOrUndo` | [Trading & Orders](by-topic/trading-orders.md) | [L669318](../../../ScriptDB/000_4_CreateSP.sql#L669318) | — | 0 / 1 | — |
| `UBTrxDuplicate` | [Trading & Orders](by-topic/trading-orders.md) | [L669411](../../../ScriptDB/000_4_CreateSP.sql#L669411) | — | 1 / 0 | — |
| `UBTrxFirstInPlan` | [Account & Plan](by-topic/account-plan.md) | [L669526](../../../ScriptDB/000_4_CreateSP.sql#L669526) | — | 2 / 0 | — |
| `UBTrxFirstInPlanByPlanID` | [Account & Plan](by-topic/account-plan.md) | [L669621](../../../ScriptDB/000_4_CreateSP.sql#L669621) | — | 1 / 0 | — |
| `UBTrxFixSequence` | [Trading & Orders](by-topic/trading-orders.md) | [L669667](../../../ScriptDB/000_4_CreateSP.sql#L669667) | — | 0 / 0 | — |
| `UBTrxInfo` | [Trading & Orders](by-topic/trading-orders.md) | [L669761](../../../ScriptDB/000_4_CreateSP.sql#L669761) | 1 / 1 file | 0 / 1 | [Customer.cs:1997](../../../UBClasses/Customer.cs#L1997) |
| `UBTrxInfoEdit` | [Trading & Orders](by-topic/trading-orders.md) | [L670095](../../../ScriptDB/000_4_CreateSP.sql#L670095) | 1 / 1 file | 0 / 0 | [Trx.cs:3457](../../../UBClasses/Trx.cs#L3457) |
| `UBTrxInfoSmall` | [Trading & Orders](by-topic/trading-orders.md) | [L670261](../../../ScriptDB/000_4_CreateSP.sql#L670261) | 1 / 1 file | 0 / 0 | [Trx.cs:193](../../../UBClasses/Trx.cs#L193) |
| `UBTrxInfoSmallSave` | [Trading & Orders](by-topic/trading-orders.md) | [L670311](../../../ScriptDB/000_4_CreateSP.sql#L670311) | 1 / 1 file | 0 / 0 | [Trx.cs:255](../../../UBClasses/Trx.cs#L255) |
| `UBTrxListHighAmountGet` | [Trading & Orders](by-topic/trading-orders.md) | [L670353](../../../ScriptDB/000_4_CreateSP.sql#L670353) | — | 0 / 0 | — |
| `UBTrxListSetForSequenceTest` | [Fund & GIC](by-topic/fund-gic.md) | [L670423](../../../ScriptDB/000_4_CreateSP.sql#L670423) | 1 / 1 file | 0 / 0 | [Trx.cs:130](../../../UBClasses/Trx.cs#L130) |
| `UBTrxManualAddComboList` | [Trading & Orders](by-topic/trading-orders.md) | [L670531](../../../ScriptDB/000_4_CreateSP.sql#L670531) | — | 0 / 13 | — |
| `UBTrxMerge` | [Trading & Orders](by-topic/trading-orders.md) | [L670574](../../../ScriptDB/000_4_CreateSP.sql#L670574) | — | 0 / 0 | — |
| `UBTrxMergeConfirm2Accepted` | [Trading & Orders](by-topic/trading-orders.md) | [L670634](../../../ScriptDB/000_4_CreateSP.sql#L670634) | — | 1 / 0 | — |
| `UBTrxMergeConfirm2AcceptedAll` | [Trading & Orders](by-topic/trading-orders.md) | [L670726](../../../ScriptDB/000_4_CreateSP.sql#L670726) | — | 0 / 1 | — |
| `UBTrxMoveFromPlan2Plan` | [Account & Plan](by-topic/account-plan.md) | [L670769](../../../ScriptDB/000_4_CreateSP.sql#L670769) | — | 0 / 0 | — |
| `UBTrxOneClientList` | [Client & KYC](by-topic/client-kyc.md) | [L670876](../../../ScriptDB/000_4_CreateSP.sql#L670876) | 1 / 1 file | 0 / 0 | [Trx.cs:2585](../../../UBClasses/Trx.cs#L2585) |
| `UBTrxOrderInfoEdit` | [Trading & Orders](by-topic/trading-orders.md) | [L670987](../../../ScriptDB/000_4_CreateSP.sql#L670987) | 1 / 1 file | 0 / 0 | [Trx.cs:3623](../../../UBClasses/Trx.cs#L3623) |
| `UBTrxOrderRemove` | [Trading & Orders](by-topic/trading-orders.md) | [L671082](../../../ScriptDB/000_4_CreateSP.sql#L671082) | — | 13 / 8 | — |
| `UBTrxOrderSourceList` | [Trading & Orders](by-topic/trading-orders.md) | [L671387](../../../ScriptDB/000_4_CreateSP.sql#L671387) | — | 2 / 0 | — |
| `UBTrxOrderStatusList` | [Trading & Orders](by-topic/trading-orders.md) | [L671416](../../../ScriptDB/000_4_CreateSP.sql#L671416) | — | 10 / 0 | — |
| `UBTrxOrderType` | [Trading & Orders](by-topic/trading-orders.md) | [L671456](../../../ScriptDB/000_4_CreateSP.sql#L671456) | 1 / 1 file | 0 / 0 | [Trx.cs:3406](../../../UBClasses/Trx.cs#L3406) |
| `UBTrxOrderTypeList` | [Trading & Orders](by-topic/trading-orders.md) | [L671486](../../../ScriptDB/000_4_CreateSP.sql#L671486) | — | 1 / 0 | — |
| `UBTrxPendingOrderList` | [Trading & Orders](by-topic/trading-orders.md) | [L671518](../../../ScriptDB/000_4_CreateSP.sql#L671518) | 1 / 1 file | 0 / 0 | [Trx.cs:2497](../../../UBClasses/Trx.cs#L2497) |
| `UBTrxPlanID` | [Account & Plan](by-topic/account-plan.md) | [L671836](../../../ScriptDB/000_4_CreateSP.sql#L671836) | 2 / 1 file | 0 / 0 | [Trx.cs:2355](../../../UBClasses/Trx.cs#L2355) |
| `UBTrxRebateList` | [Trading & Orders](by-topic/trading-orders.md) | [L671871](../../../ScriptDB/000_4_CreateSP.sql#L671871) | 1 / 1 file | 0 / 0 | [Trx.cs:2722](../../../UBClasses/Trx.cs#L2722) |
| `UBTrxRecapList` | [Trading & Orders](by-topic/trading-orders.md) | [L671914](../../../ScriptDB/000_4_CreateSP.sql#L671914) | 1 / 1 file | 0 / 1 | [TrxBlotter.cs:162](../../../UBClasses/TrxBlotter.cs#L162) |
| `UBTrxRecSkipAdd` | [Trading & Orders](by-topic/trading-orders.md) | [L672288](../../../ScriptDB/000_4_CreateSP.sql#L672288) | — | 2 / 0 | — |
| `UBTrxRemoveByFileID` | [Trading & Orders](by-topic/trading-orders.md) | [L672314](../../../ScriptDB/000_4_CreateSP.sql#L672314) | — | 0 / 1 | — |
| `UBTrxResponseSourceList` | [Account & Plan](by-topic/account-plan.md) | [L672342](../../../ScriptDB/000_4_CreateSP.sql#L672342) | — | 1 / 0 | — |
| `UBTrxRestoreOne` | [Trading & Orders](by-topic/trading-orders.md) | [L672371](../../../ScriptDB/000_4_CreateSP.sql#L672371) | — | 0 / 0 | — |
| `UBTrxScheduleList` | [Trading & Orders](by-topic/trading-orders.md) | [L672448](../../../ScriptDB/000_4_CreateSP.sql#L672448) | 1 / 1 file | 0 / 3 | [Trx.cs:5974](../../../UBClasses/Trx.cs#L5974) |
| `UBTrxSelectionUpdate` | [Trading & Orders](by-topic/trading-orders.md) | [L672757](../../../ScriptDB/000_4_CreateSP.sql#L672757) | — | 0 / 0 | — |
| `UBTrxSellAWD` | [Trading & Orders](by-topic/trading-orders.md) | [L672800](../../../ScriptDB/000_4_CreateSP.sql#L672800) | — | 2 / 2 | — |
| `UBTrxSellRRIF` | [Account & Plan](by-topic/account-plan.md) | [L672895](../../../ScriptDB/000_4_CreateSP.sql#L672895) | — | 2 / 1 | — |
| `UBTrxSetAverageCost` | [Trading & Orders](by-topic/trading-orders.md) | [L672977](../../../ScriptDB/000_4_CreateSP.sql#L672977) | 1 / 1 file | 2 / 1 | [Trx.cs:6138](../../../UBClasses/Trx.cs#L6138) |
| `UBTrxSetAverageCostAll` | [Trading & Orders](by-topic/trading-orders.md) | [L673069](../../../ScriptDB/000_4_CreateSP.sql#L673069) | — | 0 / 1 | — |
| `UBTrxSettleGNList` | [Trading & Orders](by-topic/trading-orders.md) | [L673132](../../../ScriptDB/000_4_CreateSP.sql#L673132) | — | 1 / 0 | — |
| `UBTrxSettleMethodList` | [Trading & Orders](by-topic/trading-orders.md) | [L673161](../../../ScriptDB/000_4_CreateSP.sql#L673161) | — | 7 / 0 | — |
| `UBTrxSettleMethodListByPlanID` | [Account & Plan](by-topic/account-plan.md) | [L673199](../../../ScriptDB/000_4_CreateSP.sql#L673199) | 1 / 1 file | 0 / 1 | [CBase.cs:8168](../../../UBClasses/CBase.cs#L8168) |
| `UBTrxSettleMethodListX` | [Trading & Orders](by-topic/trading-orders.md) | [L673219](../../../ScriptDB/000_4_CreateSP.sql#L673219) | — | 2 / 0 | — |
| `UBTrxSettleSourceList` | [Trading & Orders](by-topic/trading-orders.md) | [L673275](../../../ScriptDB/000_4_CreateSP.sql#L673275) | — | 1 / 0 | — |
| `UBTrxSettleStatusList` | [Trading & Orders](by-topic/trading-orders.md) | [L673304](../../../ScriptDB/000_4_CreateSP.sql#L673304) | — | 1 / 0 | — |
| `UBTrxStatusList` | [Trading & Orders](by-topic/trading-orders.md) | [L673333](../../../ScriptDB/000_4_CreateSP.sql#L673333) | — | 3 / 0 | — |
| `UBTrxTaggedCount` | [Trading & Orders](by-topic/trading-orders.md) | [L673363](../../../ScriptDB/000_4_CreateSP.sql#L673363) | 1 / 1 file | 0 / 0 | [Trx.cs:6280](../../../UBClasses/Trx.cs#L6280) |
| `UBTrxTaxEventIndList` | [Trading & Orders](by-topic/trading-orders.md) | [L673378](../../../ScriptDB/000_4_CreateSP.sql#L673378) | — | 1 / 0 | — |
| `UBTrxTransferCanChange` | [Trading & Orders](by-topic/trading-orders.md) | [L673407](../../../ScriptDB/000_4_CreateSP.sql#L673407) | 1 / 1 file | 0 / 0 | [Trx.cs:2958](../../../UBClasses/Trx.cs#L2958) |
| `UBTrxTransferOutInList` | [Trading & Orders](by-topic/trading-orders.md) | [L673458](../../../ScriptDB/000_4_CreateSP.sql#L673458) | — | 0 / 1 | — |
| `UBTrxTransferTrustInfo` | [Account & Plan](by-topic/account-plan.md) | [L673584](../../../ScriptDB/000_4_CreateSP.sql#L673584) | 1 / 1 file | 0 / 0 | [Trx.cs:3568](../../../UBClasses/Trx.cs#L3568) |
| `UBTrxTypeEO` | [Trading & Orders](by-topic/trading-orders.md) | [L673638](../../../ScriptDB/000_4_CreateSP.sql#L673638) | 1 / 1 file | 0 / 0 | [Trx.cs:515](../../../UBClasses/Trx.cs#L515) |
| `UBTrxTypeEODetail` | [Trading & Orders](by-topic/trading-orders.md) | [L673664](../../../ScriptDB/000_4_CreateSP.sql#L673664) | 1 / 1 file | 0 / 0 | [Trx.cs:515](../../../UBClasses/Trx.cs#L515) |
| `UBTrxTypeList` | [Trading & Orders](by-topic/trading-orders.md) | [L673697](../../../ScriptDB/000_4_CreateSP.sql#L673697) | 1 / 1 file | 2 / 0 | [Trx.cs:46](../../../UBClasses/Trx.cs#L46) |
| `UBTrxTypeSign` | [Trading & Orders](by-topic/trading-orders.md) | [L673727](../../../ScriptDB/000_4_CreateSP.sql#L673727) | — | 0 / 0 | — |
| `UBTrxUnitBalance` | [Trading & Orders](by-topic/trading-orders.md) | [L673753](../../../ScriptDB/000_4_CreateSP.sql#L673753) | 1 / 1 file | 0 / 0 | [Trx.cs:2908](../../../UBClasses/Trx.cs#L2908) |
| `UBTrxUpdateOrder` | [Trading & Orders](by-topic/trading-orders.md) | [L673814](../../../ScriptDB/000_4_CreateSP.sql#L673814) | — | 3 / 0 | — |
| `UBTrxViewComboList` | [Trading & Orders](by-topic/trading-orders.md) | [L673909](../../../ScriptDB/000_4_CreateSP.sql#L673909) | — | 0 / 14 | — |
| `UBTrxViewListCof` | [Trading & Orders](by-topic/trading-orders.md) | [L673965](../../../ScriptDB/000_4_CreateSP.sql#L673965) | 1 / 1 file | 0 / 0 | [TradeConfirmation.cs:148](../../../VieFUNDPdf/TradeConfirmation.cs#L148) |
| `UBTrxViewOrderList` | [Trading & Orders](by-topic/trading-orders.md) | [L674099](../../../ScriptDB/000_4_CreateSP.sql#L674099) | 1 / 1 file | 0 / 2 | [Trx.cs:5377](../../../UBClasses/Trx.cs#L5377) |
| `UBTrxViewSearch` | [Trading & Orders](by-topic/trading-orders.md) | [L674384](../../../ScriptDB/000_4_CreateSP.sql#L674384) | 1 / 1 file | 0 / 4 | [Trx.cs:2081](../../../UBClasses/Trx.cs#L2081) |
| `UBTrxViewSearchCriteriaSave` | [Trading & Orders](by-topic/trading-orders.md) | [L676474](../../../ScriptDB/000_4_CreateSP.sql#L676474) | — | 2 / 1 | — |
| `UBTrxViewSearchEx` | [Trading & Orders](by-topic/trading-orders.md) | [L676868](../../../ScriptDB/000_4_CreateSP.sql#L676868) | — | 2 / 1 | — |
| `UBTrxViewSearchTBD` | [Trading & Orders](by-topic/trading-orders.md) | [L678389](../../../ScriptDB/000_4_CreateSP.sql#L678389) | — | 0 / 4 | — |
| `UBTrxViewSettlementList` | [Trading & Orders](by-topic/trading-orders.md) | [L680308](../../../ScriptDB/000_4_CreateSP.sql#L680308) | — | 0 / 3 | — |
| `UBTSFile_EndTask` | [Fundserv & Import](by-topic/fundserv-import.md) | [L680443](../../../ScriptDB/000_4_CreateSP.sql#L680443) | — | 0 / 0 | — |
| `UBTSFileAddTrx2Waiting` | [Fundserv & Import](by-topic/fundserv-import.md) | [L680456](../../../ScriptDB/000_4_CreateSP.sql#L680456) | 1 / 1 file | 0 / 0 | [Trx.cs:6512](../../../UBClasses/Trx.cs#L6512) |
| `UBTSFileGetOneSet` | [Fundserv & Import](by-topic/fundserv-import.md) | [L680496](../../../ScriptDB/000_4_CreateSP.sql#L680496) | — | 0 / 0 | — |
| `UBTSHErrorLogList` | [Shared / Other](by-topic/shared-other.md) | [L680675](../../../ScriptDB/000_4_CreateSP.sql#L680675) | 1 / 1 file | 0 / 0 | [CAdhocTSFileImport.cs:614](../../../UBFFImport/CAdhocTSFileImport.cs#L614) |
| `UBTSHFileProcessTaggedItems` | [Shared / Other](by-topic/shared-other.md) | [L680794](../../../ScriptDB/000_4_CreateSP.sql#L680794) | — | 0 / 1 | — |
| `UBTSHFileScan` | [Shared / Other](by-topic/shared-other.md) | [L680874](../../../ScriptDB/000_4_CreateSP.sql#L680874) | — | 0 / 0 | — |
| `UBTSHFileView` | [Shared / Other](by-topic/shared-other.md) | [L680910](../../../ScriptDB/000_4_CreateSP.sql#L680910) | 1 / 1 file | 0 / 0 | [CAdhocTSFileImport.cs:332](../../../UBFFImport/CAdhocTSFileImport.cs#L332) |
| `UBTSHFileViewSelectionUpdate` | [Shared / Other](by-topic/shared-other.md) | [L681167](../../../ScriptDB/000_4_CreateSP.sql#L681167) | — | 0 / 0 | — |
| `UBTSHImportComboList` | [Shared / Other](by-topic/shared-other.md) | [L681204](../../../ScriptDB/000_4_CreateSP.sql#L681204) | — | 0 / 1 | — |
| `UBTSSkipRecordComboList` | [Shared / Other](by-topic/shared-other.md) | [L681229](../../../ScriptDB/000_4_CreateSP.sql#L681229) | — | 0 / 1 | — |
| `UBTSSkipRecordImportTaggedItems` | [Shared / Other](by-topic/shared-other.md) | [L681254](../../../ScriptDB/000_4_CreateSP.sql#L681254) | — | 0 / 1 | — |
| `UBTSSkipRecordRejectTaggedItems` | [Shared / Other](by-topic/shared-other.md) | [L681302](../../../ScriptDB/000_4_CreateSP.sql#L681302) | — | 0 / 0 | — |
| `UBTSSkipRecordView` | [Shared / Other](by-topic/shared-other.md) | [L681331](../../../ScriptDB/000_4_CreateSP.sql#L681331) | 1 / 1 file | 0 / 0 | [CAdhocTSFileImport.cs:394](../../../UBFFImport/CAdhocTSFileImport.cs#L394) |
| `UBTwilioInfo` | [Notifications](by-topic/notifications.md) | [L681492](../../../ScriptDB/000_4_CreateSP.sql#L681492) | 1 / 1 file | 2 / 0 | [Dealer.cs:841](../../../UBClasses/Dealer.cs#L841) |
| `UBTwilioUpdate` | [Notifications](by-topic/notifications.md) | [L681512](../../../ScriptDB/000_4_CreateSP.sql#L681512) | 1 / 1 file | 0 / 0 | [Dealer.cs:793](../../../UBClasses/Dealer.cs#L793) |
| `UBUniformityComboList` | [Compliance](by-topic/compliance.md) | [L681544](../../../ScriptDB/000_4_CreateSP.sql#L681544) | — | 0 / 2 | — |
| `UBUniformityReport` | [Compliance](by-topic/compliance.md) | [L681564](../../../ScriptDB/000_4_CreateSP.sql#L681564) | 2 / 1 file | 0 / 1 | [Uniformity.cs:38](../../../UBClasses/Uniformity.cs#L38) |
| `UBUniformityReport1Rep` | [Compliance](by-topic/compliance.md) | [L681679](../../../ScriptDB/000_4_CreateSP.sql#L681679) | — | 1 / 0 | — |
| `UBUniformityReviewList` | [Compliance](by-topic/compliance.md) | [L682435](../../../ScriptDB/000_4_CreateSP.sql#L682435) | 1 / 1 file | 0 / 0 | [Uniformity.cs:366](../../../UBClasses/Uniformity.cs#L366) |
| `UBUniformityReviewObj` | [Compliance](by-topic/compliance.md) | [L682510](../../../ScriptDB/000_4_CreateSP.sql#L682510) | 1 / 1 file | 0 / 0 | [Uniformity.cs:480](../../../UBClasses/Uniformity.cs#L480) |
| `UBUniformityReviewObjAdd` | [Compliance](by-topic/compliance.md) | [L682545](../../../ScriptDB/000_4_CreateSP.sql#L682545) | 1 / 1 file | 0 / 0 | [Uniformity.cs:626](../../../VieFUNDPdf/Uniformity.cs#L626) |
| `UBUniformityReviewRemove` | [Compliance](by-topic/compliance.md) | [L682604](../../../ScriptDB/000_4_CreateSP.sql#L682604) | 1 / 1 file | 0 / 0 | [Uniformity.cs:434](../../../UBClasses/Uniformity.cs#L434) |
| `UBUniformitySelectionUpdateIN` | [Compliance](by-topic/compliance.md) | [L682622](../../../ScriptDB/000_4_CreateSP.sql#L682622) | 1 / 1 file | 0 / 0 | [Uniformity.cs:522](../../../UBClasses/Uniformity.cs#L522) |
| `UBUniformitySnapshots` | [Compliance](by-topic/compliance.md) | [L682668](../../../ScriptDB/000_4_CreateSP.sql#L682668) | 1 / 1 file | 0 / 1 | [Uniformity.cs:152](../../../UBClasses/Uniformity.cs#L152) |
| `UBUserDefinedDefAdd` | [Shared / Other](by-topic/shared-other.md) | [L682801](../../../ScriptDB/000_4_CreateSP.sql#L682801) | 1 / 1 file | 0 / 0 | [UserDefinedField.cs:458](../../../UBClasses/UserDefinedField.cs#L458) |
| `UBUserDefinedDefComboList` | [Shared / Other](by-topic/shared-other.md) | [L682858](../../../ScriptDB/000_4_CreateSP.sql#L682858) | — | 1 / 0 | — |
| `UBUserDefinedDefList` | [Shared / Other](by-topic/shared-other.md) | [L682884](../../../ScriptDB/000_4_CreateSP.sql#L682884) | 1 / 1 file | 0 / 0 | [UserDefinedField.cs:359](../../../UBClasses/UserDefinedField.cs#L359) |
| `UBUserDefinedDefMoveOrder` | [Trading & Orders](by-topic/trading-orders.md) | [L682919](../../../ScriptDB/000_4_CreateSP.sql#L682919) | 1 / 1 file | 0 / 0 | [UserDefinedField.cs:570](../../../UBClasses/UserDefinedField.cs#L570) |
| `UBUserDefinedDefRemove` | [Shared / Other](by-topic/shared-other.md) | [L682977](../../../ScriptDB/000_4_CreateSP.sql#L682977) | 1 / 1 file | 0 / 0 | [UserDefinedField.cs:517](../../../UBClasses/UserDefinedField.cs#L517) |
| `UBUserDefinedDefUpdate` | [Shared / Other](by-topic/shared-other.md) | [L683010](../../../ScriptDB/000_4_CreateSP.sql#L683010) | 1 / 1 file | 0 / 0 | [UserDefinedField.cs:458](../../../UBClasses/UserDefinedField.cs#L458) |
| `UBViewColumnAdd` | [Shared / Other](by-topic/shared-other.md) | [L683052](../../../ScriptDB/000_4_CreateSP.sql#L683052) | — | 0 / 0 | — |
| `UBViewColumnList` | [Shared / Other](by-topic/shared-other.md) | [L683085](../../../ScriptDB/000_4_CreateSP.sql#L683085) | 1 / 1 file | 59 / 0 | [CBase.cs:3111](../../../UBClasses/CBase.cs#L3111) |
| `UBViewColumnRemove` | [Shared / Other](by-topic/shared-other.md) | [L683163](../../../ScriptDB/000_4_CreateSP.sql#L683163) | — | 0 / 0 | — |
| `UBViewColumnRename` | [Shared / Other](by-topic/shared-other.md) | [L683193](../../../ScriptDB/000_4_CreateSP.sql#L683193) | — | 0 / 0 | — |
| `UBViewColumnUpdate` | [Shared / Other](by-topic/shared-other.md) | [L683224](../../../ScriptDB/000_4_CreateSP.sql#L683224) | — | 0 / 0 | — |
| `UBViewHeaderAdd` | [Shared / Other](by-topic/shared-other.md) | [L683264](../../../ScriptDB/000_4_CreateSP.sql#L683264) | 1 / 1 file | 0 / 0 | [ViewHeader.cs:39](../../../UBClasses/ViewHeader.cs#L39) |
| `UBViewHeaderList` | [Shared / Other](by-topic/shared-other.md) | [L683310](../../../ScriptDB/000_4_CreateSP.sql#L683310) | — | 0 / 0 | — |
| `UBViewHeaderMoveOrder` | [Trading & Orders](by-topic/trading-orders.md) | [L683390](../../../ScriptDB/000_4_CreateSP.sql#L683390) | 1 / 1 file | 0 / 0 | [ViewHeader.cs:146](../../../UBClasses/ViewHeader.cs#L146) |
| `UBViewHeaderRemove` | [Shared / Other](by-topic/shared-other.md) | [L683505](../../../ScriptDB/000_4_CreateSP.sql#L683505) | 1 / 1 file | 0 / 0 | [ViewHeader.cs:93](../../../UBClasses/ViewHeader.cs#L93) |
| `UBViewHeaderResetOrder` | [Trading & Orders](by-topic/trading-orders.md) | [L683534](../../../ScriptDB/000_4_CreateSP.sql#L683534) | — | 0 / 0 | — |
| `UBWCAddressRequestList` | [Shared / Other](by-topic/shared-other.md) | [L683565](../../../ScriptDB/000_4_CreateSP.sql#L683565) | 1 / 1 file | 0 / 1 | [CAddress.cs:340](../../../UBClasses/CAddress.cs#L340) |
| `UBWCRegistrationApprove` | [Shared / Other](by-topic/shared-other.md) | [L683682](../../../ScriptDB/000_4_CreateSP.sql#L683682) | 1 / 1 file | 0 / 2 | [Customer.cs:4164](../../../UBClasses/Customer.cs#L4164) |
| `UBWCRegistrationApproveComboList` | [Shared / Other](by-topic/shared-other.md) | [L683863](../../../ScriptDB/000_4_CreateSP.sql#L683863) | — | 0 / 2 | — |
| `UBWCRegistrationEmail` | [Notifications](by-topic/notifications.md) | [L683885](../../../ScriptDB/000_4_CreateSP.sql#L683885) | — | 1 / 0 | — |
| `UBWCRegistrationRequestAdd` | [Shared / Other](by-topic/shared-other.md) | [L684056](../../../ScriptDB/000_4_CreateSP.sql#L684056) | 1 / 1 file | 0 / 0 | [Customer.cs:3960](../../../UBClasses/Customer.cs#L3960) |
| `UBWCRequestInfo` | [Shared / Other](by-topic/shared-other.md) | [L684361](../../../ScriptDB/000_4_CreateSP.sql#L684361) | 1 / 1 file | 0 / 0 | [Customer.cs:4075](../../../UBClasses/Customer.cs#L4075) |
| `UBWCRequestList` | [Shared / Other](by-topic/shared-other.md) | [L684403](../../../ScriptDB/000_4_CreateSP.sql#L684403) | 1 / 1 file | 0 / 1 | [Customer.cs:4017](../../../UBClasses/Customer.cs#L4017) |
| `UBWCRequestRemove` | [Shared / Other](by-topic/shared-other.md) | [L684533](../../../ScriptDB/000_4_CreateSP.sql#L684533) | 1 / 1 file | 0 / 0 | [Customer.cs:4220](../../../UBClasses/Customer.cs#L4220) |
| `UBWebAppUserList` | [Shared / Other](by-topic/shared-other.md) | [L684562](../../../ScriptDB/000_4_CreateSP.sql#L684562) | 1 / 1 file | 0 / 0 | [WFPassword.aspx.cs:581](../../../WebApp/Main/WFPassword.aspx.cs#L581) |
| `UBWebAppUserUpdatePW` | [Security & Auth](by-topic/security-auth.md) | [L684599](../../../ScriptDB/000_4_CreateSP.sql#L684599) | 1 / 1 file | 0 / 0 | [WFPassword.aspx.cs:206](../../../WebApp/Main/WFPassword.aspx.cs#L206) |
| `UBWebClientComboList` | [Client & KYC](by-topic/client-kyc.md) | [L684625](../../../ScriptDB/000_4_CreateSP.sql#L684625) | — | 0 / 1 | — |
| `UBWebClientPreLogin` | [Client & KYC](by-topic/client-kyc.md) | [L684650](../../../ScriptDB/000_4_CreateSP.sql#L684650) | 1 / 1 file | 0 / 0 | [Customer.cs:5583](../../../UBClasses/Customer.cs#L5583) |
| `UBWebClientStatusList` | [Client & KYC](by-topic/client-kyc.md) | [L684688](../../../ScriptDB/000_4_CreateSP.sql#L684688) | — | 3 / 0 | — |
| `UBWebClientUserExist` | [Client & KYC](by-topic/client-kyc.md) | [L684717](../../../ScriptDB/000_4_CreateSP.sql#L684717) | — | 0 / 0 | — |
| `UBWebClientUserIDVerify` | [Client & KYC](by-topic/client-kyc.md) | [L684741](../../../ScriptDB/000_4_CreateSP.sql#L684741) | 1 / 1 file | 0 / 0 | [Customer.cs:5014](../../../UBClasses/Customer.cs#L5014) |
| `UBWebClientUserList` | [Client & KYC](by-topic/client-kyc.md) | [L684773](../../../ScriptDB/000_4_CreateSP.sql#L684773) | 2 / 1 file | 0 / 0 | [WFPassword.aspx.cs:281](../../../WebApp/Main/WFPassword.aspx.cs#L281) |
| `UBWebClientUserUpdate` | [Client & KYC](by-topic/client-kyc.md) | [L684827](../../../ScriptDB/000_4_CreateSP.sql#L684827) | 1 / 1 file | 2 / 1 | [Customer.cs:4355](../../../UBClasses/Customer.cs#L4355) |
| `UBWebClientUserUpdatePW` | [Client & KYC](by-topic/client-kyc.md) | [L684953](../../../ScriptDB/000_4_CreateSP.sql#L684953) | 2 / 2 file | 0 / 0 | [Customer.cs:4877](../../../UBClasses/Customer.cs#L4877) |
| `UBWebClientUserUpdatePWEx` | [Client & KYC](by-topic/client-kyc.md) | [L684988](../../../ScriptDB/000_4_CreateSP.sql#L684988) | 1 / 1 file | 0 / 0 | [Customer.cs:4826](../../../UBClasses/Customer.cs#L4826) |
| `UBWebClientUserUpdatePWEx2` | [Client & KYC](by-topic/client-kyc.md) | [L685133](../../../ScriptDB/000_4_CreateSP.sql#L685133) | 1 / 1 file | 0 / 0 | [Customer.cs:5625](../../../UBClasses/Customer.cs#L5625) |
| `UBWeekDayList` | [Shared / Other](by-topic/shared-other.md) | [L685342](../../../ScriptDB/000_4_CreateSP.sql#L685342) | — | 0 / 0 | — |
| `UBWFCommPayableListOne` | [Commission & Fee](by-topic/commission-fee.md) | [L685377](../../../ScriptDB/000_4_CreateSP.sql#L685377) | 1 / 1 file | 0 / 0 | [WFPayable.cs:39](../../../UBClasses/WFPayable.cs#L39) |
| `UBWFCommRepPdf` | [Commission & Fee](by-topic/commission-fee.md) | [L685711](../../../ScriptDB/000_4_CreateSP.sql#L685711) | 1 / 1 file | 0 / 0 | [WFPayable.cs:132](../../../UBClasses/WFPayable.cs#L132) |
| `UBWFConversionFINTRAC` | [Compliance](by-topic/compliance.md) | [L685726](../../../ScriptDB/000_4_CreateSP.sql#L685726) | — | 0 / 0 | — |
| `UBWFConversionRiskTransfer` | [Trading & Orders](by-topic/trading-orders.md) | [L685760](../../../ScriptDB/000_4_CreateSP.sql#L685760) | — | 0 / 0 | — |
| `UBWorkGroupDefAdd` | [Shared / Other](by-topic/shared-other.md) | [L685796](../../../ScriptDB/000_4_CreateSP.sql#L685796) | 1 / 1 file | 0 / 0 | [Member.cs:4850](../../../UBClasses/Member.cs#L4850) |
| `UBWorkGroupDefList` | [Shared / Other](by-topic/shared-other.md) | [L685819](../../../ScriptDB/000_4_CreateSP.sql#L685819) | — | 1 / 0 | — |
| `UBXGlobeAdvisor` | [Shared / Other](by-topic/shared-other.md) | [L685836](../../../ScriptDB/000_4_CreateSP.sql#L685836) | 1 / 1 file | 0 / 0 | [Plan.cs:3633](../../../UBClasses/Plan.cs#L3633) |
| `UBXGlobeAdvisorExcel` | [Shared / Other](by-topic/shared-other.md) | [L685966](../../../ScriptDB/000_4_CreateSP.sql#L685966) | 1 / 1 file | 0 / 0 | [Plan.cs:3559](../../../UBClasses/Plan.cs#L3559) |
| `UBXIRR` | [Shared / Other](by-topic/shared-other.md) | [L686065](../../../ScriptDB/000_4_CreateSP.sql#L686065) | — | 16 / 0 | — |
| `UBXML2TMP_Account` | [Account & Plan](by-topic/account-plan.md) | [L686102](../../../ScriptDB/000_4_CreateSP.sql#L686102) | — | 0 / 0 | — |
| `UBXML2TMP_Address` | [Shared / Other](by-topic/shared-other.md) | [L686168](../../../ScriptDB/000_4_CreateSP.sql#L686168) | — | 0 / 0 | — |
| `UBXML2TMP_BankInfo` | [Shared / Other](by-topic/shared-other.md) | [L686208](../../../ScriptDB/000_4_CreateSP.sql#L686208) | — | 0 / 0 | — |
| `UBXML2TMP_BSPRec` | [Shared / Other](by-topic/shared-other.md) | [L686244](../../../ScriptDB/000_4_CreateSP.sql#L686244) | — | 0 / 0 | — |
| `UBXML2TMP_BulkRec` | [Shared / Other](by-topic/shared-other.md) | [L686323](../../../ScriptDB/000_4_CreateSP.sql#L686323) | — | 0 / 0 | — |
| `UBXML2TMP_CDICData` | [Shared / Other](by-topic/shared-other.md) | [L686376](../../../ScriptDB/000_4_CreateSP.sql#L686376) | — | 0 / 0 | — |
| `UBXML2TMP_ChequeInfo` | [Shared / Other](by-topic/shared-other.md) | [L686409](../../../ScriptDB/000_4_CreateSP.sql#L686409) | — | 0 / 0 | — |
| `UBXML2TMP_Clear` | [Shared / Other](by-topic/shared-other.md) | [L686451](../../../ScriptDB/000_4_CreateSP.sql#L686451) | — | 0 / 0 | — |
| `UBXML2TMP_ClientInfo` | [Client & KYC](by-topic/client-kyc.md) | [L686526](../../../ScriptDB/000_4_CreateSP.sql#L686526) | — | 0 / 0 | — |
| `UBXML2TMP_ClientInfoEx` | [Client & KYC](by-topic/client-kyc.md) | [L686559](../../../ScriptDB/000_4_CreateSP.sql#L686559) | — | 0 / 0 | — |
| `UBXML2TMP_ControllingPerson` | [Shared / Other](by-topic/shared-other.md) | [L686598](../../../ScriptDB/000_4_CreateSP.sql#L686598) | — | 0 / 0 | — |
| `UBXML2TMP_DivRedirect` | [Shared / Other](by-topic/shared-other.md) | [L686629](../../../ScriptDB/000_4_CreateSP.sql#L686629) | — | 0 / 0 | — |
| `UBXML2TMP_IDVerify` | [Shared / Other](by-topic/shared-other.md) | [L686665](../../../ScriptDB/000_4_CreateSP.sql#L686665) | — | 0 / 0 | — |
| `UBXML2TMP_IndividualTIN` | [Shared / Other](by-topic/shared-other.md) | [L686701](../../../ScriptDB/000_4_CreateSP.sql#L686701) | — | 0 / 0 | — |
| `UBXML2TMP_LARec` | [Shared / Other](by-topic/shared-other.md) | [L686737](../../../ScriptDB/000_4_CreateSP.sql#L686737) | — | 0 / 0 | — |
| `UBXML2TMP_LARecHeader` | [Shared / Other](by-topic/shared-other.md) | [L686818](../../../ScriptDB/000_4_CreateSP.sql#L686818) | — | 0 / 1 | — |
| `UBXML2TMP_LSRec` | [Shared / Other](by-topic/shared-other.md) | [L686880](../../../ScriptDB/000_4_CreateSP.sql#L686880) | — | 0 / 0 | — |
| `UBXML2TMP_LSRecDetail` | [Shared / Other](by-topic/shared-other.md) | [L686966](../../../ScriptDB/000_4_CreateSP.sql#L686966) | — | 0 / 0 | — |
| `UBXML2TMP_LSRecHeader` | [Shared / Other](by-topic/shared-other.md) | [L687035](../../../ScriptDB/000_4_CreateSP.sql#L687035) | — | 0 / 1 | — |
| `UBXML2TMP_OrganizationTIN` | [Shared / Other](by-topic/shared-other.md) | [L687124](../../../ScriptDB/000_4_CreateSP.sql#L687124) | — | 0 / 0 | — |
| `UBXML2TMP_SysPlan` | [Account & Plan](by-topic/account-plan.md) | [L687157](../../../ScriptDB/000_4_CreateSP.sql#L687157) | — | 0 / 0 | — |
| `UBXML2TMP_SysPlanDetail` | [Account & Plan](by-topic/account-plan.md) | [L687202](../../../ScriptDB/000_4_CreateSP.sql#L687202) | — | 0 / 0 | — |
| `UBXML2TMP_TrxRec` | [Trading & Orders](by-topic/trading-orders.md) | [L687240](../../../ScriptDB/000_4_CreateSP.sql#L687240) | — | 0 / 0 | — |
| `UBXML2TMP_TrxRecAccountEx` | [Account & Plan](by-topic/account-plan.md) | [L687389](../../../ScriptDB/000_4_CreateSP.sql#L687389) | — | 0 / 0 | — |
| `UBXML2TMP_TrxRecDetail` | [Trading & Orders](by-topic/trading-orders.md) | [L687427](../../../ScriptDB/000_4_CreateSP.sql#L687427) | — | 0 / 0 | — |
| `UBXML2TMP_TrxRecDetailFee` | [Commission & Fee](by-topic/commission-fee.md) | [L687502](../../../ScriptDB/000_4_CreateSP.sql#L687502) | — | 0 / 0 | — |
| `UBXMLAddressAdd` | [Shared / Other](by-topic/shared-other.md) | [L687528](../../../ScriptDB/000_4_CreateSP.sql#L687528) | — | 8 / 2 | — |
| `UBXMLBenAdd` | [Shared / Other](by-topic/shared-other.md) | [L687662](../../../ScriptDB/000_4_CreateSP.sql#L687662) | — | 2 / 3 | — |
| `UBXMLCheckNFUSchema` | [Fundserv & Import](by-topic/fundserv-import.md) | [L687755](../../../ScriptDB/000_4_CreateSP.sql#L687755) | — | 1 / 0 | — |
| `UBXMLCheckNFUSchema32` | [Fundserv & Import](by-topic/fundserv-import.md) | [L687798](../../../ScriptDB/000_4_CreateSP.sql#L687798) | — | 0 / 0 | — |
| `UBXMLCheckOrderSchema` | [Trading & Orders](by-topic/trading-orders.md) | [L687823](../../../ScriptDB/000_4_CreateSP.sql#L687823) | — | 1 / 0 | — |
| `UBXMLCheckOrderSchema32` | [Trading & Orders](by-topic/trading-orders.md) | [L687868](../../../ScriptDB/000_4_CreateSP.sql#L687868) | — | 0 / 0 | — |
| `UBXMLFileImportCheckPlanAccount` | [Account & Plan](by-topic/account-plan.md) | [L687894](../../../ScriptDB/000_4_CreateSP.sql#L687894) | — | 12 / 6 | — |
| `UBXMLForeignEntityAdd` | [Shared / Other](by-topic/shared-other.md) | [L688617](../../../ScriptDB/000_4_CreateSP.sql#L688617) | — | 4 / 2 | — |
| `UBXMLForeignPersonAdd` | [Shared / Other](by-topic/shared-other.md) | [L688764](../../../ScriptDB/000_4_CreateSP.sql#L688764) | — | 5 / 0 | — |
| `UBXMLIDVerifyAdd` | [Shared / Other](by-topic/shared-other.md) | [L688853](../../../ScriptDB/000_4_CreateSP.sql#L688853) | — | 2 / 1 | — |
| `UBXMLITFAdd` | [Shared / Other](by-topic/shared-other.md) | [L688922](../../../ScriptDB/000_4_CreateSP.sql#L688922) | — | 2 / 4 | — |
| `UBXMLJointAdd` | [Shared / Other](by-topic/shared-other.md) | [L689024](../../../ScriptDB/000_4_CreateSP.sql#L689024) | — | 2 / 4 | — |
| `UBXMLRecBSProcessAll` | [Shared / Other](by-topic/shared-other.md) | [L689174](../../../ScriptDB/000_4_CreateSP.sql#L689174) | — | 0 / 1 | — |
| `UBXMLRecBSProcessChunk` | [Shared / Other](by-topic/shared-other.md) | [L689228](../../../ScriptDB/000_4_CreateSP.sql#L689228) | 1 / 1 file | 0 / 1 | [CBS.cs:269](../../../UBFFImport/CBS.cs#L269) |
| `UBXMLRecBSProcessOne` | [Shared / Other](by-topic/shared-other.md) | [L689291](../../../ScriptDB/000_4_CreateSP.sql#L689291) | — | 2 / 0 | — |
| `UBXMLRecCheckPlanDetail` | [Account & Plan](by-topic/account-plan.md) | [L689412](../../../ScriptDB/000_4_CreateSP.sql#L689412) | — | 1 / 0 | — |
| `UBXMLRecCommHeaderAdd` | [Commission & Fee](by-topic/commission-fee.md) | [L689525](../../../ScriptDB/000_4_CreateSP.sql#L689525) | — | 0 / 1 | — |
| `UBXMLRecCommHeaderAdd_LA` | [Commission & Fee](by-topic/commission-fee.md) | [L689668](../../../ScriptDB/000_4_CreateSP.sql#L689668) | — | 1 / 1 | — |
| `UBXMLRecCommHeaderAdd_LS` | [Commission & Fee](by-topic/commission-fee.md) | [L689784](../../../ScriptDB/000_4_CreateSP.sql#L689784) | — | 1 / 1 | — |
| `UBXMLRecDefASM` | [Shared / Other](by-topic/shared-other.md) | [L689938](../../../ScriptDB/000_4_CreateSP.sql#L689938) | — | 0 / 0 | — |
| `UBXMLRecDefBSP` | [Shared / Other](by-topic/shared-other.md) | [L689960](../../../ScriptDB/000_4_CreateSP.sql#L689960) | — | 0 / 0 | — |
| `UBXMLRecDefDR` | [Shared / Other](by-topic/shared-other.md) | [L689976](../../../ScriptDB/000_4_CreateSP.sql#L689976) | — | 0 / 0 | — |
| `UBXMLRecDefFD` | [Shared / Other](by-topic/shared-other.md) | [L690001](../../../ScriptDB/000_4_CreateSP.sql#L690001) | — | 0 / 0 | — |
| `UBXMLRecDefFDAA` | [Shared / Other](by-topic/shared-other.md) | [L690028](../../../ScriptDB/000_4_CreateSP.sql#L690028) | — | 0 / 0 | — |
| `UBXMLRecDefFDCAA` | [Shared / Other](by-topic/shared-other.md) | [L690055](../../../ScriptDB/000_4_CreateSP.sql#L690055) | — | 0 / 0 | — |
| `UBXMLRecDefFDModel` | [Shared / Other](by-topic/shared-other.md) | [L690082](../../../ScriptDB/000_4_CreateSP.sql#L690082) | — | 0 / 0 | — |
| `UBXMLRecDefFSP` | [Shared / Other](by-topic/shared-other.md) | [L690109](../../../ScriptDB/000_4_CreateSP.sql#L690109) | — | 0 / 0 | — |
| `UBXMLRecDefLA` | [Shared / Other](by-topic/shared-other.md) | [L690135](../../../ScriptDB/000_4_CreateSP.sql#L690135) | — | 0 / 0 | — |
| `UBXMLRecDefLS` | [Shared / Other](by-topic/shared-other.md) | [L690162](../../../ScriptDB/000_4_CreateSP.sql#L690162) | — | 0 / 0 | — |
| `UBXMLRecDefNSP` | [Shared / Other](by-topic/shared-other.md) | [L690192](../../../ScriptDB/000_4_CreateSP.sql#L690192) | — | 0 / 0 | — |
| `UBXMLRecDefPSP` | [Shared / Other](by-topic/shared-other.md) | [L690243](../../../ScriptDB/000_4_CreateSP.sql#L690243) | — | 0 / 0 | — |
| `UBXMLRecDefRS` | [Shared / Other](by-topic/shared-other.md) | [L690262](../../../ScriptDB/000_4_CreateSP.sql#L690262) | — | 0 / 0 | — |
| `UBXMLRecDefTCR` | [Shared / Other](by-topic/shared-other.md) | [L690287](../../../ScriptDB/000_4_CreateSP.sql#L690287) | — | 0 / 0 | — |
| `UBXMLRecDefTrx` | [Trading & Orders](by-topic/trading-orders.md) | [L690303](../../../ScriptDB/000_4_CreateSP.sql#L690303) | — | 0 / 0 | — |
| `UBXMLRecDefWSP` | [Shared / Other](by-topic/shared-other.md) | [L690365](../../../ScriptDB/000_4_CreateSP.sql#L690365) | — | 0 / 0 | — |
| `UBXMLRecDefXR` | [Shared / Other](by-topic/shared-other.md) | [L690390](../../../ScriptDB/000_4_CreateSP.sql#L690390) | — | 0 / 0 | — |
| `UBXMLRecDemoCheckClientPlan` | [Account & Plan](by-topic/account-plan.md) | [L690416](../../../ScriptDB/000_4_CreateSP.sql#L690416) | — | 1 / 12 | — |
| `UBXMLRecFDCheckMgmt` | [Shared / Other](by-topic/shared-other.md) | [L691065](../../../ScriptDB/000_4_CreateSP.sql#L691065) | — | 0 / 0 | — |
| `UBXMLRecFDProcess` | [Shared / Other](by-topic/shared-other.md) | [L691201](../../../ScriptDB/000_4_CreateSP.sql#L691201) | 1 / 1 file | 0 / 8 | [CFD.cs:908](../../../UBFFImport/CFD.cs#L908) |
| `UBXMLRecFDProcessAA` | [Shared / Other](by-topic/shared-other.md) | [L691875](../../../ScriptDB/000_4_CreateSP.sql#L691875) | 1 / 1 file | 0 / 0 | [CFD.cs:974](../../../UBFFImport/CFD.cs#L974) |
| `UBXMLRecFDProcessCAA` | [Shared / Other](by-topic/shared-other.md) | [L691935](../../../ScriptDB/000_4_CreateSP.sql#L691935) | 1 / 1 file | 0 / 0 | [CFD.cs:1007](../../../UBFFImport/CFD.cs#L1007) |
| `UBXMLRecFDProcessEnd` | [Shared / Other](by-topic/shared-other.md) | [L691975](../../../ScriptDB/000_4_CreateSP.sql#L691975) | 1 / 1 file | 0 / 0 | [CFD.cs:1063](../../../UBFFImport/CFD.cs#L1063) |
| `UBXMLRecFDProcessModel` | [Shared / Other](by-topic/shared-other.md) | [L692013](../../../ScriptDB/000_4_CreateSP.sql#L692013) | 1 / 1 file | 0 / 0 | [CFD.cs:1031](../../../UBFFImport/CFD.cs#L1031) |
| `UBXMLRecFDProcessTerminate` | [Shared / Other](by-topic/shared-other.md) | [L692069](../../../ScriptDB/000_4_CreateSP.sql#L692069) | 1 / 1 file | 0 / 3 | [CFD.cs:1122](../../../UBFFImport/CFD.cs#L1122) |
| `UBXMLRecLAProcessChunk` | [Shared / Other](by-topic/shared-other.md) | [L692138](../../../ScriptDB/000_4_CreateSP.sql#L692138) | 1 / 1 file | 0 / 1 | [CLA.cs:441](../../../UBFFImport/CLA.cs#L441) |
| `UBXMLRecLAProcessOne` | [Shared / Other](by-topic/shared-other.md) | [L692208](../../../ScriptDB/000_4_CreateSP.sql#L692208) | — | 1 / 1 | — |
| `UBXMLRecListFD` | [Shared / Other](by-topic/shared-other.md) | [L692408](../../../ScriptDB/000_4_CreateSP.sql#L692408) | — | 0 / 0 | — |
| `UBXMLRecLSProcessAll` | [Shared / Other](by-topic/shared-other.md) | [L692436](../../../ScriptDB/000_4_CreateSP.sql#L692436) | 1 / 1 file | 0 / 1 | [CLS.cs:608](../../../UBFFImport/CLS.cs#L608) |
| `UBXMLRecLSProcessChunk` | [Shared / Other](by-topic/shared-other.md) | [L692491](../../../ScriptDB/000_4_CreateSP.sql#L692491) | 1 / 1 file | 0 / 1 | [CLS.cs:546](../../../UBFFImport/CLS.cs#L546) |
| `UBXMLRecLSProcessOne` | [Shared / Other](by-topic/shared-other.md) | [L692562](../../../ScriptDB/000_4_CreateSP.sql#L692562) | — | 3 / 1 | — |
| `UBXMLRecNFURespnProcess` | [Fundserv & Import](by-topic/fundserv-import.md) | [L692974](../../../ScriptDB/000_4_CreateSP.sql#L692974) | 1 / 1 file | 0 / 0 | [CXM.cs:604](../../../UBFFImport/CXM.cs#L604) |
| `UBXMLRecNSPProcess` | [Shared / Other](by-topic/shared-other.md) | [L693142](../../../ScriptDB/000_4_CreateSP.sql#L693142) | 1 / 1 file | 5 / 15 | [CAA.cs:2532](../../../UBFFImport/CAA.cs#L2532) |
| `UBXMLRecNSPProcess_FeeRate` | [Commission & Fee](by-topic/commission-fee.md) | [L694118](../../../ScriptDB/000_4_CreateSP.sql#L694118) | — | 1 / 0 | — |
| `UBXMLRecNSPProcess_Seg` | [Shared / Other](by-topic/shared-other.md) | [L694185](../../../ScriptDB/000_4_CreateSP.sql#L694185) | — | 1 / 0 | — |
| `UBXMLRecNSPProcess_SysPlan` | [Account & Plan](by-topic/account-plan.md) | [L694244](../../../ScriptDB/000_4_CreateSP.sql#L694244) | — | 1 / 1 | — |
| `UBXMLRecNSPProcess_SysPlanOne` | [Account & Plan](by-topic/account-plan.md) | [L694302](../../../ScriptDB/000_4_CreateSP.sql#L694302) | — | 1 / 0 | — |
| `UBXMLRecOrderRespnProcess` | [Account & Plan](by-topic/account-plan.md) | [L694547](../../../ScriptDB/000_4_CreateSP.sql#L694547) | 1 / 1 file | 0 / 6 | [COrder.cs:785](../../../UBFFImport/COrder.cs#L785) |
| `UBXMLRecOrderRespnProcessError` | [Account & Plan](by-topic/account-plan.md) | [L694907](../../../ScriptDB/000_4_CreateSP.sql#L694907) | 1 / 1 file | 0 / 0 | [COrder.cs:732](../../../UBFFImport/COrder.cs#L732) |
| `UBXMLRecProcess_CDICData` | [Shared / Other](by-topic/shared-other.md) | [L695055](../../../ScriptDB/000_4_CreateSP.sql#L695055) | — | 1 / 0 | — |
| `UBXMLRecPSPProcess` | [Shared / Other](by-topic/shared-other.md) | [L695099](../../../ScriptDB/000_4_CreateSP.sql#L695099) | 1 / 1 file | 1 / 1 | [CAA.cs:2363](../../../UBFFImport/CAA.cs#L2363) |
| `UBXMLRecPSPProcess_Record` | [Shared / Other](by-topic/shared-other.md) | [L695905](../../../ScriptDB/000_4_CreateSP.sql#L695905) | — | 0 / 1 | — |
| `UBXMLRecPSPSave` | [Shared / Other](by-topic/shared-other.md) | [L696057](../../../ScriptDB/000_4_CreateSP.sql#L696057) | 1 / 1 file | 0 / 0 | [CAA.cs:2453](../../../UBFFImport/CAA.cs#L2453) |
| `UBXMLRecROC_A` | [Shared / Other](by-topic/shared-other.md) | [L696180](../../../ScriptDB/000_4_CreateSP.sql#L696180) | — | 2 / 1 | — |
| `UBXMLRecRSProcess` | [Shared / Other](by-topic/shared-other.md) | [L696226](../../../ScriptDB/000_4_CreateSP.sql#L696226) | 1 / 1 file | 0 / 0 | [CAP.cs:609](../../../UBFFImport/CAP.cs#L609) |
| `UBXMLRecRSProcess5` | [Shared / Other](by-topic/shared-other.md) | [L696511](../../../ScriptDB/000_4_CreateSP.sql#L696511) | 1 / 1 file | 0 / 1 | [CAP.cs:527](../../../UBFFImport/CAP.cs#L527) |
| `UBXMLRecRSProcessOne` | [Shared / Other](by-topic/shared-other.md) | [L696618](../../../ScriptDB/000_4_CreateSP.sql#L696618) | — | 1 / 0 | — |
| `UBXMLRecSaveFD` | [Shared / Other](by-topic/shared-other.md) | [L696898](../../../ScriptDB/000_4_CreateSP.sql#L696898) | 1 / 1 file | 0 / 0 | [CFD.cs:956](../../../UBFFImport/CFD.cs#L956) |
| `UBXMLRecTCRProcess` | [Shared / Other](by-topic/shared-other.md) | [L696927](../../../ScriptDB/000_4_CreateSP.sql#L696927) | 1 / 1 file | 0 / 0 | [CTCRFile.cs:269](../../../UBFFImport/CTCRFile.cs#L269) |
| `UBXMLRecTrxProcessFeeInfo` | [Commission & Fee](by-topic/commission-fee.md) | [L697024](../../../ScriptDB/000_4_CreateSP.sql#L697024) | — | 1 / 0 | — |
| `UBXMLRecTrxRecordLookup` | [Trading & Orders](by-topic/trading-orders.md) | [L697066](../../../ScriptDB/000_4_CreateSP.sql#L697066) | — | 10 / 0 | — |
| `UBXMLRecTrxRecordLookupManualTrx` | [Trading & Orders](by-topic/trading-orders.md) | [L697189](../../../ScriptDB/000_4_CreateSP.sql#L697189) | — | 4 / 0 | — |
| `UBXMLRecTrxRecordProcess` | [Trading & Orders](by-topic/trading-orders.md) | [L697279](../../../ScriptDB/000_4_CreateSP.sql#L697279) | 1 / 1 file | 1 / 1 | [CAT.cs:1480](../../../UBFFImport/CAT.cs#L1480) |
| `UBXMLRecTrxRecordProcess1Record` | [Trading & Orders](by-topic/trading-orders.md) | [L697309](../../../ScriptDB/000_4_CreateSP.sql#L697309) | — | 6 / 7 | — |
| `UBXMLRecTrxRecordProcess1Record_Special` | [Trading & Orders](by-topic/trading-orders.md) | [L697600](../../../ScriptDB/000_4_CreateSP.sql#L697600) | — | 1 / 7 | — |
| `UBXMLRecTrxRecordProcessBuyCof` | [Trading & Orders](by-topic/trading-orders.md) | [L697850](../../../ScriptDB/000_4_CreateSP.sql#L697850) | — | 1 / 13 | — |
| `UBXMLRecTrxRecordProcessBuyCof_Special` | [Trading & Orders](by-topic/trading-orders.md) | [L698757](../../../ScriptDB/000_4_CreateSP.sql#L698757) | — | 1 / 10 | — |
| `UBXMLRecTrxRecordProcessDistribCof` | [Trading & Orders](by-topic/trading-orders.md) | [L699254](../../../ScriptDB/000_4_CreateSP.sql#L699254) | — | 1 / 7 | — |
| `UBXMLRecTrxRecordProcessDistribCof_Special` | [Trading & Orders](by-topic/trading-orders.md) | [L699740](../../../ScriptDB/000_4_CreateSP.sql#L699740) | — | 1 / 4 | — |
| `UBXMLRecTrxRecordProcessITCof` | [Trading & Orders](by-topic/trading-orders.md) | [L700118](../../../ScriptDB/000_4_CreateSP.sql#L700118) | — | 1 / 10 | — |
| `UBXMLRecTrxRecordProcessITCof_Special` | [Trading & Orders](by-topic/trading-orders.md) | [L701212](../../../ScriptDB/000_4_CreateSP.sql#L701212) | — | 1 / 7 | — |
| `UBXMLRecTrxRecordProcessPaymentInfo` | [Trading & Orders](by-topic/trading-orders.md) | [L702018](../../../ScriptDB/000_4_CreateSP.sql#L702018) | — | 2 / 0 | — |
| `UBXMLRecTrxRecordProcessPaymentInfoFix` | [Trading & Orders](by-topic/trading-orders.md) | [L702125](../../../ScriptDB/000_4_CreateSP.sql#L702125) | 1 / 1 file | 0 / 0 | [CAT.cs:1950](../../../UBFFImport/CAT.cs#L1950) |
| `UBXMLRecTrxRecordProcessROC` | [Trading & Orders](by-topic/trading-orders.md) | [L702206](../../../ScriptDB/000_4_CreateSP.sql#L702206) | — | 1 / 6 | — |
| `UBXMLRecTrxRecordProcessROC_Special` | [Trading & Orders](by-topic/trading-orders.md) | [L702562](../../../ScriptDB/000_4_CreateSP.sql#L702562) | — | 1 / 5 | — |
| `UBXMLRecTrxRecordProcessSellCof` | [Trading & Orders](by-topic/trading-orders.md) | [L702884](../../../ScriptDB/000_4_CreateSP.sql#L702884) | — | 1 / 14 | — |
| `UBXMLRecTrxRecordProcessSellCof_Special` | [Trading & Orders](by-topic/trading-orders.md) | [L703648](../../../ScriptDB/000_4_CreateSP.sql#L703648) | — | 1 / 11 | — |
| `UBXMLRecTrxRecordProcessSwitchCof` | [Trading & Orders](by-topic/trading-orders.md) | [L704236](../../../ScriptDB/000_4_CreateSP.sql#L704236) | — | 1 / 8 | — |
| `UBXMLRecTrxRecordProcessSwitchCof_Special` | [Trading & Orders](by-topic/trading-orders.md) | [L705053](../../../ScriptDB/000_4_CreateSP.sql#L705053) | — | 1 / 7 | — |
| `UBXMLRecWSProcess` | [Shared / Other](by-topic/shared-other.md) | [L705794](../../../ScriptDB/000_4_CreateSP.sql#L705794) | 1 / 1 file | 0 / 1 | [CAW.cs:724](../../../UBFFImport/CAW.cs#L724) |
| `UBXMLRespBenAdd` | [Account & Plan](by-topic/account-plan.md) | [L706101](../../../ScriptDB/000_4_CreateSP.sql#L706101) | — | 0 / 3 | — |
| `UBXMLSettingsModify` | [Shared / Other](by-topic/shared-other.md) | [L706183](../../../ScriptDB/000_4_CreateSP.sql#L706183) | — | 2 / 1 | — |
| `UBXMLSpouseAdd` | [Shared / Other](by-topic/shared-other.md) | [L706259](../../../ScriptDB/000_4_CreateSP.sql#L706259) | — | 2 / 1 | — |
| `UBXMLSysPlanAdd` | [Account & Plan](by-topic/account-plan.md) | [L706327](../../../ScriptDB/000_4_CreateSP.sql#L706327) | — | 0 / 0 | — |
| `UBYearEndComboList` | [Tax & Year-End](by-topic/tax-yearend.md) | [L706390](../../../ScriptDB/000_4_CreateSP.sql#L706390) | — | 0 / 5 | — |
| `UNIV_OneCommission` | [Commission & Fee](by-topic/commission-fee.md) | [L706752](../../../ScriptDB/000_4_CreateSP.sql#L706752) | — | 0 / 1 | — |
| `V27_FATCACtrlPerson` | [Client & KYC](by-topic/client-kyc.md) | [L707088](../../../ScriptDB/000_4_CreateSP.sql#L707088) | — | 1 / 0 | — |
| `V27_FATCAEntity` | [Client & KYC](by-topic/client-kyc.md) | [L707114](../../../ScriptDB/000_4_CreateSP.sql#L707114) | — | 0 / 2 | — |
| `V27_FATCAIndividual` | [Client & KYC](by-topic/client-kyc.md) | [L707200](../../../ScriptDB/000_4_CreateSP.sql#L707200) | — | 0 / 1 | — |
| `V27_FATCAIndividual_TIN` | [Client & KYC](by-topic/client-kyc.md) | [L707274](../../../ScriptDB/000_4_CreateSP.sql#L707274) | — | 1 / 0 | — |
| `V27_FATCAOrg_TIN` | [Client & KYC](by-topic/client-kyc.md) | [L707311](../../../ScriptDB/000_4_CreateSP.sql#L707311) | — | 1 / 0 | — |
| `V33_FATCA_Scan_Set_NonReportable` | [Client & KYC](by-topic/client-kyc.md) | [L707334](../../../ScriptDB/000_4_CreateSP.sql#L707334) | — | 0 / 2 | — |
| `VF_VF_AllClient` | [Client & KYC](by-topic/client-kyc.md) | [L707408](../../../ScriptDB/000_4_CreateSP.sql#L707408) | — | 0 / 2 | — |
| `VF_VF_AllClientX` | [Client & KYC](by-topic/client-kyc.md) | [L707453](../../../ScriptDB/000_4_CreateSP.sql#L707453) | — | 0 / 1 | — |
| `VF_VF_AllCommPayableDue` | [Commission & Fee](by-topic/commission-fee.md) | [L707494](../../../ScriptDB/000_4_CreateSP.sql#L707494) | — | 0 / 0 | — |
| `VF_VF_AllCommPayroll` | [Commission & Fee](by-topic/commission-fee.md) | [L707557](../../../ScriptDB/000_4_CreateSP.sql#L707557) | — | 0 / 1 | — |
| `VF_VF_AllCommRevenue` | [Commission & Fee](by-topic/commission-fee.md) | [L707619](../../../ScriptDB/000_4_CreateSP.sql#L707619) | — | 0 / 0 | — |
| `VF_VF_AllCommRevenueHeader` | [Commission & Fee](by-topic/commission-fee.md) | [L707702](../../../ScriptDB/000_4_CreateSP.sql#L707702) | — | 0 / 1 | — |
| `VF_VF_AllCompCheckClient` | [Client & KYC](by-topic/client-kyc.md) | [L707762](../../../ScriptDB/000_4_CreateSP.sql#L707762) | — | 0 / 0 | — |
| `VF_VF_AllCompCheckClientARC` | [Client & KYC](by-topic/client-kyc.md) | [L707807](../../../ScriptDB/000_4_CreateSP.sql#L707807) | — | 0 / 0 | — |
| `VF_VF_AllCompCheckPlan` | [Account & Plan](by-topic/account-plan.md) | [L707849](../../../ScriptDB/000_4_CreateSP.sql#L707849) | — | 0 / 0 | — |
| `VF_VF_AllCompCheckPlanARC` | [Account & Plan](by-topic/account-plan.md) | [L707890](../../../ScriptDB/000_4_CreateSP.sql#L707890) | — | 0 / 0 | — |
| `VF_VF_AllCompliancePlanCommFee` | [Compliance](by-topic/compliance.md) | [L707934](../../../ScriptDB/000_4_CreateSP.sql#L707934) | — | 0 / 0 | — |
| `VF_VF_AllCompliancePlanTrend` | [Compliance](by-topic/compliance.md) | [L707982](../../../ScriptDB/000_4_CreateSP.sql#L707982) | — | 0 / 0 | — |
| `VF_VF_AllComplianceTrxTrend` | [Compliance](by-topic/compliance.md) | [L708024](../../../ScriptDB/000_4_CreateSP.sql#L708024) | — | 0 / 0 | — |
| `VF_VF_AllComplianceTrxTrendShortTerm` | [Compliance](by-topic/compliance.md) | [L708065](../../../ScriptDB/000_4_CreateSP.sql#L708065) | — | 0 / 0 | — |
| `VF_VF_AllCompTrxApprovalPlanInfo` | [Account & Plan](by-topic/account-plan.md) | [L708104](../../../ScriptDB/000_4_CreateSP.sql#L708104) | — | 0 / 0 | — |
| `VF_VF_AllCompTrxApprovalStatus` | [Trading & Orders](by-topic/trading-orders.md) | [L708163](../../../ScriptDB/000_4_CreateSP.sql#L708163) | — | 0 / 0 | — |
| `VF_VF_AllCompTrxApprovalStatusARC` | [Trading & Orders](by-topic/trading-orders.md) | [L708226](../../../ScriptDB/000_4_CreateSP.sql#L708226) | — | 0 / 0 | — |
| `VF_VF_AllCompTrxApprovalStatusHistory` | [Trading & Orders](by-topic/trading-orders.md) | [L708295](../../../ScriptDB/000_4_CreateSP.sql#L708295) | — | 0 / 0 | — |
| `VF_VF_AllDoc` | [Documents & PDF](by-topic/documents-pdf.md) | [L708345](../../../ScriptDB/000_4_CreateSP.sql#L708345) | — | 0 / 1 | — |
| `VF_VF_AllFundFact` | [Fund & GIC](by-topic/fund-gic.md) | [L708423](../../../ScriptDB/000_4_CreateSP.sql#L708423) | — | 0 / 1 | — |
| `VF_VF_AllGICConfirmationObj` | [Fund & GIC](by-topic/fund-gic.md) | [L708448](../../../ScriptDB/000_4_CreateSP.sql#L708448) | — | 0 / 0 | — |
| `VF_VF_AllNotes` | [Shared / Other](by-topic/shared-other.md) | [L708500](../../../ScriptDB/000_4_CreateSP.sql#L708500) | — | 0 / 0 | — |
| `VF_VF_AllNotifications` | [Notifications](by-topic/notifications.md) | [L708583](../../../ScriptDB/000_4_CreateSP.sql#L708583) | — | 0 / 0 | — |
| `VF_VF_AllPlan` | [Account & Plan](by-topic/account-plan.md) | [L708657](../../../ScriptDB/000_4_CreateSP.sql#L708657) | — | 0 / 1 | — |
| `VF_VF_AllPlanApproval` | [Account & Plan](by-topic/account-plan.md) | [L708690](../../../ScriptDB/000_4_CreateSP.sql#L708690) | — | 0 / 0 | — |
| `VF_VF_AllPlanApprovalH` | [Account & Plan](by-topic/account-plan.md) | [L708744](../../../ScriptDB/000_4_CreateSP.sql#L708744) | — | 0 / 0 | — |
| `VF_VF_AllPlanKYCUpdateGroup` | [Account & Plan](by-topic/account-plan.md) | [L708807](../../../ScriptDB/000_4_CreateSP.sql#L708807) | — | 0 / 2 | — |
| `VF_VF_AllPlanX` | [Account & Plan](by-topic/account-plan.md) | [L708854](../../../ScriptDB/000_4_CreateSP.sql#L708854) | — | 0 / 1 | — |
| `VF_VF_AllReportTask` | [Shared / Other](by-topic/shared-other.md) | [L708886](../../../ScriptDB/000_4_CreateSP.sql#L708886) | — | 0 / 1 | — |
| `VF_VF_AllSpouse` | [Shared / Other](by-topic/shared-other.md) | [L708944](../../../ScriptDB/000_4_CreateSP.sql#L708944) | — | 1 / 1 | — |
| `VF_VF_AllSpouseX` | [Shared / Other](by-topic/shared-other.md) | [L708989](../../../ScriptDB/000_4_CreateSP.sql#L708989) | — | 0 / 1 | — |
| `VF_VF_BankOneClient` | [Client & KYC](by-topic/client-kyc.md) | [L709024](../../../ScriptDB/000_4_CreateSP.sql#L709024) | — | 1 / 1 | — |
| `VF_VF_BankOneClientX` | [Client & KYC](by-topic/client-kyc.md) | [L709078](../../../ScriptDB/000_4_CreateSP.sql#L709078) | — | 1 / 1 | — |
| `VF_VF_BankOnePlan` | [Account & Plan](by-topic/account-plan.md) | [L709136](../../../ScriptDB/000_4_CreateSP.sql#L709136) | — | 1 / 1 | — |
| `VF_VF_BankOnePlanX` | [Account & Plan](by-topic/account-plan.md) | [L709189](../../../ScriptDB/000_4_CreateSP.sql#L709189) | — | 1 / 1 | — |
| `VF_VF_BankVerify` | [Shared / Other](by-topic/shared-other.md) | [L709247](../../../ScriptDB/000_4_CreateSP.sql#L709247) | — | 2 / 0 | — |
| `VF_VF_BankVerifyX` | [Shared / Other](by-topic/shared-other.md) | [L709326](../../../ScriptDB/000_4_CreateSP.sql#L709326) | — | 2 / 0 | — |
| `VF_VF_ClientPWList` | [Client & KYC](by-topic/client-kyc.md) | [L709348](../../../ScriptDB/000_4_CreateSP.sql#L709348) | 1 / 1 file | 0 / 0 | [WFPassword.aspx.cs:462](../../../WebApp/Main/WFPassword.aspx.cs#L462) |
| `VF_VF_CommMatrixAll` | [Commission & Fee](by-topic/commission-fee.md) | [L709364](../../../ScriptDB/000_4_CreateSP.sql#L709364) | — | 0 / 1 | — |
| `VF_VF_CompanyInfoOneClient` | [Client & KYC](by-topic/client-kyc.md) | [L709389](../../../ScriptDB/000_4_CreateSP.sql#L709389) | — | 1 / 0 | — |
| `VF_VF_GetDealerRepCode` | [Shared / Other](by-topic/shared-other.md) | [L709419](../../../ScriptDB/000_4_CreateSP.sql#L709419) | — | 0 / 0 | — |
| `VF_VF_GIC_Mgmt_After` | [Fund & GIC](by-topic/fund-gic.md) | [L709448](../../../ScriptDB/000_4_CreateSP.sql#L709448) | — | 0 / 1 | — |
| `VF_VF_GIC_Product` | [Fund & GIC](by-topic/fund-gic.md) | [L709502](../../../ScriptDB/000_4_CreateSP.sql#L709502) | — | 0 / 0 | — |
| `VF_VF_IdentificationOneClient` | [Client & KYC](by-topic/client-kyc.md) | [L709605](../../../ScriptDB/000_4_CreateSP.sql#L709605) | — | 1 / 0 | — |
| `VF_VF_IdentificationOneClientX` | [Client & KYC](by-topic/client-kyc.md) | [L709638](../../../ScriptDB/000_4_CreateSP.sql#L709638) | — | 1 / 0 | — |
| `VF_VF_Member_All` | [Shared / Other](by-topic/shared-other.md) | [L709683](../../../ScriptDB/000_4_CreateSP.sql#L709683) | — | 0 / 1 | — |
| `VF_VF_Member_One` | [Shared / Other](by-topic/shared-other.md) | [L709758](../../../ScriptDB/000_4_CreateSP.sql#L709758) | — | 1 / 0 | — |
| `VF_VF_OneAccountPos` | [Account & Plan](by-topic/account-plan.md) | [L710024](../../../ScriptDB/000_4_CreateSP.sql#L710024) | — | 1 / 1 | — |
| `VF_VF_OneAccountPosTrx` | [Account & Plan](by-topic/account-plan.md) | [L710144](../../../ScriptDB/000_4_CreateSP.sql#L710144) | — | 1 / 0 | — |
| `VF_VF_OneAddress` | [Shared / Other](by-topic/shared-other.md) | [L710304](../../../ScriptDB/000_4_CreateSP.sql#L710304) | — | 6 / 0 | — |
| `VF_VF_OneAddressX` | [Shared / Other](by-topic/shared-other.md) | [L710342](../../../ScriptDB/000_4_CreateSP.sql#L710342) | — | 2 / 0 | — |
| `VF_VF_OneCashTrx` | [Account & Plan](by-topic/account-plan.md) | [L710378](../../../ScriptDB/000_4_CreateSP.sql#L710378) | — | 1 / 0 | — |
| `VF_VF_OneClient` | [Client & KYC](by-topic/client-kyc.md) | [L710450](../../../ScriptDB/000_4_CreateSP.sql#L710450) | — | 1 / 9 | — |
| `VF_VF_OneClientAddress` | [Client & KYC](by-topic/client-kyc.md) | [L710791](../../../ScriptDB/000_4_CreateSP.sql#L710791) | — | 2 / 0 | — |
| `VF_VF_OneClientAddressX` | [Client & KYC](by-topic/client-kyc.md) | [L710830](../../../ScriptDB/000_4_CreateSP.sql#L710830) | — | 2 / 0 | — |
| `VF_VF_OneClientX` | [Client & KYC](by-topic/client-kyc.md) | [L710861](../../../ScriptDB/000_4_CreateSP.sql#L710861) | — | 1 / 7 | — |
| `VF_VF_OneCommMatrix` | [Commission & Fee](by-topic/commission-fee.md) | [L710986](../../../ScriptDB/000_4_CreateSP.sql#L710986) | — | 1 / 0 | — |
| `VF_VF_OneCommPayable` | [Commission & Fee](by-topic/commission-fee.md) | [L711022](../../../ScriptDB/000_4_CreateSP.sql#L711022) | — | 1 / 0 | — |
| `VF_VF_OneCommRevenueGroup` | [Commission & Fee](by-topic/commission-fee.md) | [L711086](../../../ScriptDB/000_4_CreateSP.sql#L711086) | — | 1 / 0 | — |
| `VF_VF_OneDoc` | [Documents & PDF](by-topic/documents-pdf.md) | [L711129](../../../ScriptDB/000_4_CreateSP.sql#L711129) | — | 1 / 0 | — |
| `VF_VF_OneEmployment` | [Shared / Other](by-topic/shared-other.md) | [L711174](../../../ScriptDB/000_4_CreateSP.sql#L711174) | — | 1 / 0 | — |
| `VF_VF_OneEmploymentX` | [Shared / Other](by-topic/shared-other.md) | [L711196](../../../ScriptDB/000_4_CreateSP.sql#L711196) | — | 1 / 0 | — |
| `VF_VF_OneExtraInfo` | [Shared / Other](by-topic/shared-other.md) | [L711222](../../../ScriptDB/000_4_CreateSP.sql#L711222) | — | 1 / 0 | — |
| `VF_VF_OneExtraInfoX` | [Shared / Other](by-topic/shared-other.md) | [L711281](../../../ScriptDB/000_4_CreateSP.sql#L711281) | — | 1 / 0 | — |
| `VF_VF_OneFinInfo` | [Shared / Other](by-topic/shared-other.md) | [L711345](../../../ScriptDB/000_4_CreateSP.sql#L711345) | — | 1 / 0 | — |
| `VF_VF_OneFinInfoX` | [Shared / Other](by-topic/shared-other.md) | [L711397](../../../ScriptDB/000_4_CreateSP.sql#L711397) | — | 1 / 0 | — |
| `VF_VF_OneFundFact` | [Fund & GIC](by-topic/fund-gic.md) | [L711443](../../../ScriptDB/000_4_CreateSP.sql#L711443) | — | 1 / 1 | — |
| `VF_VF_OneFundFactObj` | [Fund & GIC](by-topic/fund-gic.md) | [L711485](../../../ScriptDB/000_4_CreateSP.sql#L711485) | — | 1 / 0 | — |
| `VF_VF_OneGICTrx` | [Fund & GIC](by-topic/fund-gic.md) | [L711511](../../../ScriptDB/000_4_CreateSP.sql#L711511) | — | 1 / 0 | — |
| `VF_VF_OnePhone` | [Shared / Other](by-topic/shared-other.md) | [L711587](../../../ScriptDB/000_4_CreateSP.sql#L711587) | — | 7 / 0 | — |
| `VF_VF_OnePhoneX` | [Shared / Other](by-topic/shared-other.md) | [L711625](../../../ScriptDB/000_4_CreateSP.sql#L711625) | — | 4 / 0 | — |
| `VF_VF_OnePlan` | [Account & Plan](by-topic/account-plan.md) | [L711651](../../../ScriptDB/000_4_CreateSP.sql#L711651) | — | 1 / 8 | — |
| `VF_VF_OnePlan3rdParty` | [Account & Plan](by-topic/account-plan.md) | [L711923](../../../ScriptDB/000_4_CreateSP.sql#L711923) | — | 1 / 2 | — |
| `VF_VF_OnePlanAccount` | [Account & Plan](by-topic/account-plan.md) | [L712002](../../../ScriptDB/000_4_CreateSP.sql#L712002) | — | 1 / 2 | — |
| `VF_VF_OnePlanAccountSchedule` | [Account & Plan](by-topic/account-plan.md) | [L712064](../../../ScriptDB/000_4_CreateSP.sql#L712064) | — | 1 / 0 | — |
| `VF_VF_OnePlanBen` | [Account & Plan](by-topic/account-plan.md) | [L712139](../../../ScriptDB/000_4_CreateSP.sql#L712139) | — | 1 / 2 | — |
| `VF_VF_OnePlanBenCon` | [Account & Plan](by-topic/account-plan.md) | [L712208](../../../ScriptDB/000_4_CreateSP.sql#L712208) | — | 1 / 2 | — |
| `VF_VF_OnePlanBenX` | [Account & Plan](by-topic/account-plan.md) | [L712275](../../../ScriptDB/000_4_CreateSP.sql#L712275) | — | 1 / 2 | — |
| `VF_VF_OnePlanCash` | [Account & Plan](by-topic/account-plan.md) | [L712351](../../../ScriptDB/000_4_CreateSP.sql#L712351) | — | 1 / 1 | — |
| `VF_VF_OnePlanGIC` | [Fund & GIC](by-topic/fund-gic.md) | [L712407](../../../ScriptDB/000_4_CreateSP.sql#L712407) | — | 1 / 1 | — |
| `VF_VF_OnePlanInTrust` | [Account & Plan](by-topic/account-plan.md) | [L712511](../../../ScriptDB/000_4_CreateSP.sql#L712511) | — | 1 / 2 | — |
| `VF_VF_OnePlanInTrustX` | [Account & Plan](by-topic/account-plan.md) | [L712575](../../../ScriptDB/000_4_CreateSP.sql#L712575) | — | 1 / 2 | — |
| `VF_VF_OnePlanKYCUpdateGroup` | [Account & Plan](by-topic/account-plan.md) | [L712641](../../../ScriptDB/000_4_CreateSP.sql#L712641) | — | 1 / 0 | — |
| `VF_VF_OnePlanKYCUpdateGroupARC` | [Account & Plan](by-topic/account-plan.md) | [L712693](../../../ScriptDB/000_4_CreateSP.sql#L712693) | — | 1 / 0 | — |
| `VF_VF_OnePlanX` | [Account & Plan](by-topic/account-plan.md) | [L712747](../../../ScriptDB/000_4_CreateSP.sql#L712747) | — | 1 / 4 | — |
| `VF_VF_OneSpouse` | [Shared / Other](by-topic/shared-other.md) | [L712910](../../../ScriptDB/000_4_CreateSP.sql#L712910) | — | 1 / 2 | — |
| `VF_VF_OneSpouseX` | [Shared / Other](by-topic/shared-other.md) | [L713000](../../../ScriptDB/000_4_CreateSP.sql#L713000) | — | 1 / 2 | — |
| `VF_VF_OneTaskReportObj` | [Shared / Other](by-topic/shared-other.md) | [L713086](../../../ScriptDB/000_4_CreateSP.sql#L713086) | — | 1 / 0 | — |
| `VF_VF_QuestionOneClient` | [Client & KYC](by-topic/client-kyc.md) | [L713172](../../../ScriptDB/000_4_CreateSP.sql#L713172) | — | 0 / 0 | — |
| `VF_VF_QuestionOnePlan` | [Account & Plan](by-topic/account-plan.md) | [L713190](../../../ScriptDB/000_4_CreateSP.sql#L713190) | — | 0 / 0 | — |
| `VF_VF_TCPOne` | [Shared / Other](by-topic/shared-other.md) | [L713230](../../../ScriptDB/000_4_CreateSP.sql#L713230) | — | 0 / 1 | — |
| `VF_VF_TCPOnePerson` | [Shared / Other](by-topic/shared-other.md) | [L713257](../../../ScriptDB/000_4_CreateSP.sql#L713257) | — | 1 / 2 | — |
| `VF_VF_Trx2ndSide` | [Trading & Orders](by-topic/trading-orders.md) | [L713309](../../../ScriptDB/000_4_CreateSP.sql#L713309) | — | 0 / 0 | — |
| `VF_VF_UserPWList` | [Security & Auth](by-topic/security-auth.md) | [L713361](../../../ScriptDB/000_4_CreateSP.sql#L713361) | 1 / 1 file | 0 / 0 | [WFPassword.aspx.cs:520](../../../WebApp/Main/WFPassword.aspx.cs#L520) |
| `WeekDatesList` | [Shared / Other](by-topic/shared-other.md) | [L713377](../../../ScriptDB/000_4_CreateSP.sql#L713377) | — | 0 / 0 | — |
| `WFKYCChangeList` | [Client & KYC](by-topic/client-kyc.md) | [L713402](../../../ScriptDB/000_4_CreateSP.sql#L713402) | — | 0 / 1 | — |
| `WFKYCChangeListSetSelection` | [Client & KYC](by-topic/client-kyc.md) | [L713672](../../../ScriptDB/000_4_CreateSP.sql#L713672) | 1 / 1 file | 0 / 2 | [OBCompARC.cs:268](../../../UBClasses/OBCompARC.cs#L268) |
| `XMLCreateNode` | [Shared / Other](by-topic/shared-other.md) | [L713732](../../../ScriptDB/000_4_CreateSP.sql#L713732) | — | 2 / 0 | — |
| `XMLCreateNodeF2` | [Shared / Other](by-topic/shared-other.md) | [L713752](../../../ScriptDB/000_4_CreateSP.sql#L713752) | — | 0 / 0 | — |
| `XMLCreateNodeF4` | [Shared / Other](by-topic/shared-other.md) | [L713775](../../../ScriptDB/000_4_CreateSP.sql#L713775) | — | 0 / 0 | — |
| `XMLCreateNodeI` | [Shared / Other](by-topic/shared-other.md) | [L713798](../../../ScriptDB/000_4_CreateSP.sql#L713798) | — | 2 / 0 | — |
