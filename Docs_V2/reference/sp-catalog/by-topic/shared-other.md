# SP Catalog — Shared / Other

> Phân nhóm gợi ý theo tên procedure. Các cột caller mới là bằng chứng truy vết; `—` không có nghĩa procedure không được dùng.

**Tổng**: 1313 definition; 408 có tên tĩnh từ C#; 401 được procedure khác gọi qua EXEC/EXECUTE.

| Procedure | Definition | C# tĩnh | SQL gọi vào / gọi ra | Caller C# mẫu |
|---|---:|---:|---:|---|
| `AGRA_EndTask` | [L17025](../../../../ScriptDB/000_4_CreateSP.sql#L17025) | — | 0 / 0 | — |
| `AGRADealerRepChangedListAGRA` | [L17194](../../../../ScriptDB/000_4_CreateSP.sql#L17194) | — | 0 / 0 | — |
| `AGRAPendingFileList` | [L17215](../../../../ScriptDB/000_4_CreateSP.sql#L17215) | — | 0 / 0 | — |
| `AGRARepTransferAdd` | [L17255](../../../../ScriptDB/000_4_CreateSP.sql#L17255) | 1 / 1 file | 0 / 0 | [Member.cs:4993](../../../../UBClasses/Member.cs#L4993) |
| `AGRARepTransferApproveOneItem` | [L17361](../../../../ScriptDB/000_4_CreateSP.sql#L17361) | — | 1 / 0 | — |
| `AGRARepTransferApproveTaggedItems` | [L17466](../../../../ScriptDB/000_4_CreateSP.sql#L17466) | — | 0 / 1 | — |
| `AGRARepTransferCalcUnitOneTask` | [L17518](../../../../ScriptDB/000_4_CreateSP.sql#L17518) | — | 1 / 0 | — |
| `AGRARepTransferComboList` | [L18012](../../../../ScriptDB/000_4_CreateSP.sql#L18012) | — | 0 / 2 | — |
| `AGRARepTransferDetailList` | [L18029](../../../../ScriptDB/000_4_CreateSP.sql#L18029) | 1 / 1 file | 0 / 0 | [Member.cs:5272](../../../../UBClasses/Member.cs#L5272) |
| `AGRARepTransferHeaderList` | [L18236](../../../../ScriptDB/000_4_CreateSP.sql#L18236) | 1 / 1 file | 0 / 0 | [Member.cs:5111](../../../../UBClasses/Member.cs#L5111) |
| `AGRARepTransferInit` | [L18430](../../../../ScriptDB/000_4_CreateSP.sql#L18430) | — | 0 / 0 | — |
| `AGRARepTransferRemove` | [L18683](../../../../ScriptDB/000_4_CreateSP.sql#L18683) | 1 / 1 file | 0 / 0 | [Member.cs:5051](../../../../UBClasses/Member.cs#L5051) |
| `AGRARepTransferSelectionUpdate` | [L18733](../../../../ScriptDB/000_4_CreateSP.sql#L18733) | — | 0 / 0 | — |
| `AGRATaskDetailList` | [L18768](../../../../ScriptDB/000_4_CreateSP.sql#L18768) | — | 0 / 1 | — |
| `AGRP_RecalcAvgCostOnly_All` | [L19565](../../../../ScriptDB/000_4_CreateSP.sql#L19565) | — | 0 / 1 | — |
| `AGRP_RecalcAvgCostUnits` | [L19618](../../../../ScriptDB/000_4_CreateSP.sql#L19618) | — | 0 / 1 | — |
| `AGRP_RecalcAvgCostUnits_All` | [L19648](../../../../ScriptDB/000_4_CreateSP.sql#L19648) | — | 0 / 1 | — |
| `AGRP_RecalcAvgCostUnits_FromException` | [L19700](../../../../ScriptDB/000_4_CreateSP.sql#L19700) | — | 0 / 1 | — |
| `AGRP_RecalcAvgCostUnitsSince` | [L19732](../../../../ScriptDB/000_4_CreateSP.sql#L19732) | — | 0 / 1 | — |
| `AGRP_RecalcAvgCostZeroAvgWithUnit` | [L19761](../../../../ScriptDB/000_4_CreateSP.sql#L19761) | — | 0 / 1 | — |
| `AL_ConvOmnibusCSH001` | [L20115](../../../../ScriptDB/000_4_CreateSP.sql#L20115) | — | 0 / 1 | — |
| `B2B_DEc082017CWT_Step1` | [L21436](../../../../ScriptDB/000_4_CreateSP.sql#L21436) | — | 0 / 0 | — |
| `B2B_DEc082017CWT_Step2` | [L21494](../../../../ScriptDB/000_4_CreateSP.sql#L21494) | — | 0 / 1 | — |
| `B2B_DEc082017CWT_Step3` | [L21525](../../../../ScriptDB/000_4_CreateSP.sql#L21525) | — | 0 / 1 | — |
| `CON_Axis_CalcAverageCostAll` | [L23708](../../../../ScriptDB/000_4_CreateSP.sql#L23708) | — | 0 / 1 | — |
| `CON_Axis_CalcAverageCostFromStart` | [L23839](../../../../ScriptDB/000_4_CreateSP.sql#L23839) | — | 0 / 0 | — |
| `CON_Axis_CalcAverageCostOne` | [L23954](../../../../ScriptDB/000_4_CreateSP.sql#L23954) | — | 1 / 0 | — |
| `CON_Axis_Price` | [L23990](../../../../ScriptDB/000_4_CreateSP.sql#L23990) | — | 0 / 0 | — |
| `CON_Axis_VF_Pos_All` | [L24897](../../../../ScriptDB/000_4_CreateSP.sql#L24897) | — | 0 / 1 | — |
| `CON_Axis_VF_Pos_One` | [L24930](../../../../ScriptDB/000_4_CreateSP.sql#L24930) | — | 1 / 1 | — |
| `CON_Axis_VF_PRICE_All` | [L25071](../../../../ScriptDB/000_4_CreateSP.sql#L25071) | — | 0 / 1 | — |
| `CON_Axis_VF_PRICE_One` | [L25102](../../../../ScriptDB/000_4_CreateSP.sql#L25102) | — | 1 / 1 | — |
| `CON_CheckImportedAT_SIN_12` | [L25667](../../../../ScriptDB/000_4_CreateSP.sql#L25667) | — | 0 / 0 | — |
| `CON_Copy1000Price` | [L25759](../../../../ScriptDB/000_4_CreateSP.sql#L25759) | — | 0 / 1 | — |
| `CON_Copy1Price` | [L25796](../../../../ScriptDB/000_4_CreateSP.sql#L25796) | — | 1 / 0 | — |
| `CON_CREATE_INSERT_TB` | [L26426](../../../../ScriptDB/000_4_CreateSP.sql#L26426) | — | 0 / 0 | — |
| `CON_CWM_LoanImport_Invest` | [L26725](../../../../ScriptDB/000_4_CreateSP.sql#L26725) | — | 0 / 0 | — |
| `CON_DealerCodeChange` | [L27011](../../../../ScriptDB/000_4_CreateSP.sql#L27011) | — | 0 / 0 | — |
| `CON_FixPhoneWF_VF` | [L27281](../../../../ScriptDB/000_4_CreateSP.sql#L27281) | — | 0 / 0 | — |
| `CON_InactiveStats` | [L27971](../../../../ScriptDB/000_4_CreateSP.sql#L27971) | — | 0 / 0 | — |
| `CON_InitDefFieldID` | [L28163](../../../../ScriptDB/000_4_CreateSP.sql#L28163) | — | 0 / 0 | — |
| `CON_MSAF_Rep` | [L28784](../../../../ScriptDB/000_4_CreateSP.sql#L28784) | — | 0 / 0 | — |
| `CON_OB_3rdParty` | [L28895](../../../../ScriptDB/000_4_CreateSP.sql#L28895) | — | 0 / 1 | — |
| `CON_OB_Add1StatementFile` | [L29068](../../../../ScriptDB/000_4_CreateSP.sql#L29068) | — | 0 / 0 | — |
| `CON_OB_DealerBranch` | [L30085](../../../../ScriptDB/000_4_CreateSP.sql#L30085) | — | 0 / 1 | — |
| `CON_OB_Dealership` | [L30154](../../../../ScriptDB/000_4_CreateSP.sql#L30154) | — | 0 / 1 | — |
| `CON_OB_Notes` | [L31626](../../../../ScriptDB/000_4_CreateSP.sql#L31626) | — | 0 / 0 | — |
| `CON_OB_Price` | [L32783](../../../../ScriptDB/000_4_CreateSP.sql#L32783) | — | 0 / 0 | — |
| `CON_OB_StatementList` | [L32938](../../../../ScriptDB/000_4_CreateSP.sql#L32938) | — | 0 / 0 | — |
| `CON_OB_Supplier` | [L32960](../../../../ScriptDB/000_4_CreateSP.sql#L32960) | — | 0 / 1 | — |
| `CON_OB_UserStep1` | [L33021](../../../../ScriptDB/000_4_CreateSP.sql#L33021) | — | 0 / 2 | — |
| `CON_OB_UserStep2` | [L33209](../../../../ScriptDB/000_4_CreateSP.sql#L33209) | — | 0 / 4 | — |
| `CON_OB_UserStep3` | [L33416](../../../../ScriptDB/000_4_CreateSP.sql#L33416) | — | 0 / 4 | — |
| `CON_PhoneUpdate` | [L33723](../../../../ScriptDB/000_4_CreateSP.sql#L33723) | — | 0 / 0 | — |
| `CON_PHX_ClearAverageCostHistory` | [L33824](../../../../ScriptDB/000_4_CreateSP.sql#L33824) | — | 0 / 0 | — |
| `CON_PHX_Expense_From_Excel` | [L33842](../../../../ScriptDB/000_4_CreateSP.sql#L33842) | — | 0 / 0 | — |
| `CON_PHX_FFSOne` | [L33895](../../../../ScriptDB/000_4_CreateSP.sql#L33895) | — | 0 / 0 | — |
| `CON_PHX_ResetAverageCost` | [L34068](../../../../ScriptDB/000_4_CreateSP.sql#L34068) | — | 0 / 1 | — |
| `CON_RefreshPrimary` | [L34995](../../../../ScriptDB/000_4_CreateSP.sql#L34995) | — | 0 / 0 | — |
| `CON_RepCodeChange` | [L35085](../../../../ScriptDB/000_4_CreateSP.sql#L35085) | — | 0 / 0 | — |
| `CON_SetCientStartID` | [L35132](../../../../ScriptDB/000_4_CreateSP.sql#L35132) | — | 0 / 0 | — |
| `CON_SHAH_LTA` | [L35369](../../../../ScriptDB/000_4_CreateSP.sql#L35369) | — | 0 / 0 | — |
| `CON_UBAveragedCostAdd` | [L35614](../../../../ScriptDB/000_4_CreateSP.sql#L35614) | — | 1 / 0 | — |
| `CON_UN_MergeAllGroup` | [L37107](../../../../ScriptDB/000_4_CreateSP.sql#L37107) | — | 0 / 1 | — |
| `CON_UN_MergeOnGroup` | [L37137](../../../../ScriptDB/000_4_CreateSP.sql#L37137) | — | 1 / 1 | — |
| `CON_WF_3rdParty` | [L38461](../../../../ScriptDB/000_4_CreateSP.sql#L38461) | — | 0 / 1 | — |
| `CON_WF_Add1StatementFile` | [L38597](../../../../ScriptDB/000_4_CreateSP.sql#L38597) | — | 0 / 0 | — |
| `CON_WF_AddRepStatement` | [L38680](../../../../ScriptDB/000_4_CreateSP.sql#L38680) | — | 0 / 0 | — |
| `CON_WF_AuditTrailList` | [L39406](../../../../ScriptDB/000_4_CreateSP.sql#L39406) | — | 0 / 0 | — |
| `CON_WF_AveragedCost1Dealer` | [L39573](../../../../ScriptDB/000_4_CreateSP.sql#L39573) | — | 0 / 1 | — |
| `CON_WF_AveragedCost1Pos` | [L39629](../../../../ScriptDB/000_4_CreateSP.sql#L39629) | — | 3 / 0 | — |
| `CON_WF_AveragedCostAll` | [L39661](../../../../ScriptDB/000_4_CreateSP.sql#L39661) | — | 0 / 1 | — |
| `CON_WF_Bank` | [L39717](../../../../ScriptDB/000_4_CreateSP.sql#L39717) | — | 15 / 1 | — |
| `CON_WF_Ben_Step1_Init` | [L39752](../../../../ScriptDB/000_4_CreateSP.sql#L39752) | — | 0 / 0 | — |
| `CON_WF_Ben_Step2` | [L39773](../../../../ScriptDB/000_4_CreateSP.sql#L39773) | — | 0 / 1 | — |
| `CON_WF_DealerBank` | [L47532](../../../../ScriptDB/000_4_CreateSP.sql#L47532) | — | 0 / 1 | — |
| `CON_WF_DealerBranch` | [L47604](../../../../ScriptDB/000_4_CreateSP.sql#L47604) | — | 2 / 1 | — |
| `CON_WF_Dealership` | [L47673](../../../../ScriptDB/000_4_CreateSP.sql#L47673) | — | 2 / 1 | — |
| `CON_WF_ElectronicDelivery` | [L48011](../../../../ScriptDB/000_4_CreateSP.sql#L48011) | — | 0 / 0 | — |
| `CON_WF_Expense` | [L48075](../../../../ScriptDB/000_4_CreateSP.sql#L48075) | — | 0 / 1 | — |
| `CON_WF_ExpenseSchedule` | [L48128](../../../../ScriptDB/000_4_CreateSP.sql#L48128) | — | 0 / 1 | — |
| `CON_WF_ExpenseSchedule_One` | [L48182](../../../../ScriptDB/000_4_CreateSP.sql#L48182) | — | 1 / 0 | — |
| `CON_WF_FixCredentialOneMember` | [L48515](../../../../ScriptDB/000_4_CreateSP.sql#L48515) | — | 0 / 0 | — |
| `CON_WF_GetBankCode` | [L56025](../../../../ScriptDB/000_4_CreateSP.sql#L56025) | — | 23 / 0 | — |
| `CON_WF_GetDefFieldValue` | [L56095](../../../../ScriptDB/000_4_CreateSP.sql#L56095) | — | 2 / 0 | — |
| `CON_WF_GetRetirementDate_Port` | [L56150](../../../../ScriptDB/000_4_CreateSP.sql#L56150) | — | 4 / 1 | — |
| `CON_WF_Ins` | [L56963](../../../../ScriptDB/000_4_CreateSP.sql#L56963) | — | 0 / 0 | — |
| `CON_WF_MailingAddressAll` | [L58594](../../../../ScriptDB/000_4_CreateSP.sql#L58594) | — | 0 / 1 | — |
| `CON_WF_MailingAddressOne` | [L58663](../../../../ScriptDB/000_4_CreateSP.sql#L58663) | — | 5 / 1 | — |
| `CON_WF_MailingAddressOne_Update` | [L58710](../../../../ScriptDB/000_4_CreateSP.sql#L58710) | — | 3 / 1 | — |
| `CON_WF_Manager_One` | [L58755](../../../../ScriptDB/000_4_CreateSP.sql#L58755) | — | 0 / 6 | — |
| `CON_WF_ManagerFix` | [L58977](../../../../ScriptDB/000_4_CreateSP.sql#L58977) | — | 0 / 4 | — |
| `CON_WF_MemberRepCHeckStatus` | [L59161](../../../../ScriptDB/000_4_CreateSP.sql#L59161) | — | 0 / 0 | — |
| `CON_WF_ModelPortfolio` | [L59198](../../../../ScriptDB/000_4_CreateSP.sql#L59198) | — | 0 / 2 | — |
| `CON_WF_Note_Step1` | [L60513](../../../../ScriptDB/000_4_CreateSP.sql#L60513) | — | 0 / 0 | — |
| `CON_WF_Note_Step1_init` | [L60545](../../../../ScriptDB/000_4_CreateSP.sql#L60545) | — | 0 / 0 | — |
| `CON_WF_Note_Step2` | [L60584](../../../../ScriptDB/000_4_CreateSP.sql#L60584) | — | 0 / 0 | — |
| `CON_WF_Notes` | [L60724](../../../../ScriptDB/000_4_CreateSP.sql#L60724) | — | 0 / 0 | — |
| `CON_WF_Notes_Comp` | [L60844](../../../../ScriptDB/000_4_CreateSP.sql#L60844) | — | 0 / 0 | — |
| `CON_WF_Notes_Comp_1` | [L60992](../../../../ScriptDB/000_4_CreateSP.sql#L60992) | — | 0 / 0 | — |
| `CON_WF_Notes_Fix_Monarch` | [L61080](../../../../ScriptDB/000_4_CreateSP.sql#L61080) | — | 0 / 0 | — |
| `CON_WF_Notes_Topup` | [L61203](../../../../ScriptDB/000_4_CreateSP.sql#L61203) | — | 0 / 0 | — |
| `CON_WF_OneRep_Add` | [L61425](../../../../ScriptDB/000_4_CreateSP.sql#L61425) | — | 1 / 0 | — |
| `CON_WF_OneRep_Notes` | [L62493](../../../../ScriptDB/000_4_CreateSP.sql#L62493) | — | 1 / 0 | — |
| `CON_WF_OneRep_Notes_Comp` | [L62651](../../../../ScriptDB/000_4_CreateSP.sql#L62651) | — | 0 / 0 | — |
| `CON_WF_OneRep_Notes_Topup` | [L62938](../../../../ScriptDB/000_4_CreateSP.sql#L62938) | — | 0 / 0 | — |
| `CON_WF_OneRep_Receivable_Topup` | [L68602](../../../../ScriptDB/000_4_CreateSP.sql#L68602) | — | 0 / 1 | — |
| `CON_WF_OneRep_ReceivableOne` | [L68635](../../../../ScriptDB/000_4_CreateSP.sql#L68635) | — | 2 / 0 | — |
| `CON_WF_OneRep_Step_10_1` | [L69004](../../../../ScriptDB/000_4_CreateSP.sql#L69004) | — | 0 / 0 | — |
| `CON_WF_OneRep_Step_10_2` | [L69022](../../../../ScriptDB/000_4_CreateSP.sql#L69022) | — | 0 / 1 | — |
| `CON_WF_OneRep_Step_10_3` | [L69045](../../../../ScriptDB/000_4_CreateSP.sql#L69045) | — | 0 / 0 | — |
| `CON_WF_OneRep_Step_10_4` | [L69063](../../../../ScriptDB/000_4_CreateSP.sql#L69063) | — | 0 / 1 | — |
| `CON_WF_OneRep_Step_11_1` | [L69088](../../../../ScriptDB/000_4_CreateSP.sql#L69088) | — | 0 / 0 | — |
| `CON_WF_OneRep_Step_11_2` | [L69106](../../../../ScriptDB/000_4_CreateSP.sql#L69106) | — | 0 / 1 | — |
| `CON_WF_OneRep_Step1` | [L69131](../../../../ScriptDB/000_4_CreateSP.sql#L69131) | — | 0 / 0 | — |
| `CON_WF_OneRep_Step2` | [L69176](../../../../ScriptDB/000_4_CreateSP.sql#L69176) | — | 0 / 1 | — |
| `CON_WF_OneRep_Step3` | [L69387](../../../../ScriptDB/000_4_CreateSP.sql#L69387) | — | 0 / 0 | — |
| `CON_WF_OneRep_Step4` | [L69415](../../../../ScriptDB/000_4_CreateSP.sql#L69415) | — | 0 / 0 | — |
| `CON_WF_OneRep_Step5` | [L69460](../../../../ScriptDB/000_4_CreateSP.sql#L69460) | — | 0 / 1 | — |
| `CON_WF_OneRep_Step6` | [L69513](../../../../ScriptDB/000_4_CreateSP.sql#L69513) | — | 0 / 1 | — |
| `CON_WF_OneRep_Step7` | [L69880](../../../../ScriptDB/000_4_CreateSP.sql#L69880) | — | 0 / 3 | — |
| `CON_WF_OneRep_Step8` | [L69905](../../../../ScriptDB/000_4_CreateSP.sql#L69905) | — | 0 / 1 | — |
| `CON_WF_OneRep_Step9` | [L69929](../../../../ScriptDB/000_4_CreateSP.sql#L69929) | — | 0 / 1 | — |
| `CON_WF_OneRep_Undo` | [L69953](../../../../ScriptDB/000_4_CreateSP.sql#L69953) | — | 0 / 0 | — |
| `CON_WF_OneSpouseFix` | [L70322](../../../../ScriptDB/000_4_CreateSP.sql#L70322) | — | 0 / 1 | — |
| `CON_WF_Price` | [L76652](../../../../ScriptDB/000_4_CreateSP.sql#L76652) | — | 2 / 0 | — |
| `CON_WF_Price_One` | [L76843](../../../../ScriptDB/000_4_CreateSP.sql#L76843) | — | 0 / 0 | — |
| `CON_WF_Price_Topup_Step1` | [L77035](../../../../ScriptDB/000_4_CreateSP.sql#L77035) | — | 0 / 0 | — |
| `CON_WF_Price_Topup_Step2` | [L77057](../../../../ScriptDB/000_4_CreateSP.sql#L77057) | — | 0 / 0 | — |
| `CON_WF_Receivable_Step1_Init` | [L77088](../../../../ScriptDB/000_4_CreateSP.sql#L77088) | — | 0 / 0 | — |
| `CON_WF_Receivable_Step2` | [L77110](../../../../ScriptDB/000_4_CreateSP.sql#L77110) | — | 0 / 1 | — |
| `CON_WF_Receivable_Step3_Topup` | [L77150](../../../../ScriptDB/000_4_CreateSP.sql#L77150) | — | 0 / 1 | — |
| `CON_WF_ReceivableAll` | [L77199](../../../../ScriptDB/000_4_CreateSP.sql#L77199) | — | 0 / 1 | — |
| `CON_WF_ReceivableAll_Topup_Add` | [L77235](../../../../ScriptDB/000_4_CreateSP.sql#L77235) | — | 0 / 0 | — |
| `CON_WF_ReceivableAll_Topup_Update` | [L77271](../../../../ScriptDB/000_4_CreateSP.sql#L77271) | — | 0 / 0 | — |
| `CON_WF_ReceivableAllX` | [L77307](../../../../ScriptDB/000_4_CreateSP.sql#L77307) | — | 0 / 1 | — |
| `CON_WF_ReceivableByRepCode` | [L77343](../../../../ScriptDB/000_4_CreateSP.sql#L77343) | — | 0 / 1 | — |
| `CON_WF_ReceivableOne` | [L77771](../../../../ScriptDB/000_4_CreateSP.sql#L77771) | — | 2 / 1 | — |
| `CON_WF_ReceivableOneX` | [L77901](../../../../ScriptDB/000_4_CreateSP.sql#L77901) | — | 2 / 1 | — |
| `CON_WF_Rep0` | [L78083](../../../../ScriptDB/000_4_CreateSP.sql#L78083) | — | 1 / 0 | — |
| `CON_WF_Rep1` | [L78130](../../../../ScriptDB/000_4_CreateSP.sql#L78130) | — | 2 / 3 | — |
| `CON_WF_RepAddressMissing` | [L78549](../../../../ScriptDB/000_4_CreateSP.sql#L78549) | — | 0 / 1 | — |
| `CON_WF_RepBankAll` | [L78595](../../../../ScriptDB/000_4_CreateSP.sql#L78595) | — | 0 / 2 | — |
| `CON_WF_RepBankAll_US_Fix` | [L78715](../../../../ScriptDB/000_4_CreateSP.sql#L78715) | — | 0 / 2 | — |
| `CON_WF_RepFileIDFix` | [L78804](../../../../ScriptDB/000_4_CreateSP.sql#L78804) | — | 0 / 0 | — |
| `CON_WF_RepInfo1` | [L78840](../../../../ScriptDB/000_4_CreateSP.sql#L78840) | — | 0 / 0 | — |
| `CON_WF_RepLicense` | [L78876](../../../../ScriptDB/000_4_CreateSP.sql#L78876) | — | 0 / 0 | — |
| `CON_WF_RepVerifyList` | [L78991](../../../../ScriptDB/000_4_CreateSP.sql#L78991) | — | 0 / 0 | — |
| `CON_WF_Service_Fix_GP_All` | [L79373](../../../../ScriptDB/000_4_CreateSP.sql#L79373) | — | 0 / 1 | — |
| `CON_WF_Service_Fix_GP_One` | [L79399](../../../../ScriptDB/000_4_CreateSP.sql#L79399) | — | 1 / 0 | — |
| `CON_WF_Service_Step1_Init` | [L79508](../../../../ScriptDB/000_4_CreateSP.sql#L79508) | — | 0 / 0 | — |
| `CON_WF_Service_Step2` | [L79529](../../../../ScriptDB/000_4_CreateSP.sql#L79529) | — | 0 / 1 | — |
| `CON_WF_SetManagerGrid` | [L80766](../../../../ScriptDB/000_4_CreateSP.sql#L80766) | — | 0 / 1 | — |
| `CON_WF_Start` | [L80893](../../../../ScriptDB/000_4_CreateSP.sql#L80893) | — | 0 / 10 | — |
| `CON_WF_Start_1_5` | [L81082](../../../../ScriptDB/000_4_CreateSP.sql#L81082) | — | 0 / 5 | — |
| `CON_WF_Start_6_8` | [L81191](../../../../ScriptDB/000_4_CreateSP.sql#L81191) | — | 0 / 4 | — |
| `CON_WF_Start_9_10` | [L81278](../../../../ScriptDB/000_4_CreateSP.sql#L81278) | — | 0 / 2 | — |
| `CON_WF_StatementStep1` | [L81341](../../../../ScriptDB/000_4_CreateSP.sql#L81341) | — | 0 / 0 | — |
| `CON_WF_Supplier` | [L81384](../../../../ScriptDB/000_4_CreateSP.sql#L81384) | — | 2 / 1 | — |
| `CON_WF_TCP_One` | [L81531](../../../../ScriptDB/000_4_CreateSP.sql#L81531) | — | 1 / 0 | — |
| `CON_WF_TCP_Step1_Init` | [L81687](../../../../ScriptDB/000_4_CreateSP.sql#L81687) | — | 0 / 0 | — |
| `CON_WF_TCP_Step2` | [L81706](../../../../ScriptDB/000_4_CreateSP.sql#L81706) | — | 0 / 1 | — |
| `CON_WF_TFSASuccesor_Step1_Init` | [L81744](../../../../ScriptDB/000_4_CreateSP.sql#L81744) | — | 0 / 0 | — |
| `CON_WF_TFSASuccessor_Step2` | [L81765](../../../../ScriptDB/000_4_CreateSP.sql#L81765) | — | 0 / 1 | — |
| `CON_WF_TransferScan_IN_OUT` | [L81890](../../../../ScriptDB/000_4_CreateSP.sql#L81890) | — | 0 / 1 | — |
| `CON_WF_UpdateReviewDate` | [L83957](../../../../ScriptDB/000_4_CreateSP.sql#L83957) | — | 0 / 0 | — |
| `CON_WF_User` | [L84001](../../../../ScriptDB/000_4_CreateSP.sql#L84001) | — | 0 / 3 | — |
| `CON_WF_UserAll` | [L84189](../../../../ScriptDB/000_4_CreateSP.sql#L84189) | — | 0 / 4 | — |
| `CON_WF_UserBankOne` | [L84724](../../../../ScriptDB/000_4_CreateSP.sql#L84724) | — | 0 / 2 | — |
| `CON_WF_UserStep1` | [L84878](../../../../ScriptDB/000_4_CreateSP.sql#L84878) | — | 0 / 2 | — |
| `CON_WF_UserStep1_OneUser` | [L85089](../../../../ScriptDB/000_4_CreateSP.sql#L85089) | — | 0 / 2 | — |
| `CON_WF_UserStep2` | [L85258](../../../../ScriptDB/000_4_CreateSP.sql#L85258) | — | 0 / 6 | — |
| `CON_WF_UserStep2_One` | [L85529](../../../../ScriptDB/000_4_CreateSP.sql#L85529) | — | 0 / 4 | — |
| `CON_WF_UserStep3` | [L85721](../../../../ScriptDB/000_4_CreateSP.sql#L85721) | — | 0 / 6 | — |
| `CON_WF_XRate` | [L87410](../../../../ScriptDB/000_4_CreateSP.sql#L87410) | — | 0 / 0 | — |
| `CON_WF_YOBHistory` | [L87429](../../../../ScriptDB/000_4_CreateSP.sql#L87429) | — | 0 / 1 | — |
| `CON_WHS_1Prospect` | [L89508](../../../../ScriptDB/000_4_CreateSP.sql#L89508) | — | 1 / 3 | — |
| `CON_WHS_All` | [L89699](../../../../ScriptDB/000_4_CreateSP.sql#L89699) | — | 0 / 1 | — |
| `CON_WHS_All2` | [L89767](../../../../ScriptDB/000_4_CreateSP.sql#L89767) | — | 0 / 1 | — |
| `CON_WHS_All3` | [L89819](../../../../ScriptDB/000_4_CreateSP.sql#L89819) | — | 0 / 1 | — |
| `CON_WHS_Import1` | [L89919](../../../../ScriptDB/000_4_CreateSP.sql#L89919) | — | 0 / 1 | — |
| `CON_WHS_LoanStep1` | [L90318](../../../../ScriptDB/000_4_CreateSP.sql#L90318) | — | 0 / 0 | — |
| `CON_WHS_Prospect` | [L90395](../../../../ScriptDB/000_4_CreateSP.sql#L90395) | — | 0 / 1 | — |
| `CON_WHS_Record` | [L90433](../../../../ScriptDB/000_4_CreateSP.sql#L90433) | — | 1 / 3 | — |
| `CON_WHS_Record2` | [L90725](../../../../ScriptDB/000_4_CreateSP.sql#L90725) | — | 1 / 1 | — |
| `CON_WHS_Record3` | [L90966](../../../../ScriptDB/000_4_CreateSP.sql#L90966) | — | 1 / 2 | — |
| `CreateSynonymsForTargetDatabase` | [L91369](../../../../ScriptDB/000_4_CreateSP.sql#L91369) | — | 0 / 0 | — |
| `CreatetScriptDBCopy` | [L91459](../../../../ScriptDB/000_4_CreateSP.sql#L91459) | — | 0 / 0 | — |
| `DB_TableList` | [L91557](../../../../ScriptDB/000_4_CreateSP.sql#L91557) | — | 0 / 0 | — |
| `Dealer_TMP_1` | [L91598](../../../../ScriptDB/000_4_CreateSP.sql#L91598) | — | 0 / 0 | — |
| `DI_AccXTransfInList` | [L96406](../../../../ScriptDB/000_4_CreateSP.sql#L96406) | — | 0 / 0 | — |
| `DI_AccXTransfInScan` | [L96543](../../../../ScriptDB/000_4_CreateSP.sql#L96543) | — | 0 / 0 | — |
| `DI_BankBranchDefDuplication` | [L96863](../../../../ScriptDB/000_4_CreateSP.sql#L96863) | — | 0 / 0 | — |
| `DI_CannexFileReport_Discrepancies` | [L97455](../../../../ScriptDB/000_4_CreateSP.sql#L97455) | — | 0 / 1 | — |
| `DI_CannexFileReport_DiscrepanciesOneFile` | [L97688](../../../../ScriptDB/000_4_CreateSP.sql#L97688) | — | 2 / 0 | — |
| `DI_CannexFileReport_NotIncluded` | [L97842](../../../../ScriptDB/000_4_CreateSP.sql#L97842) | — | 0 / 1 | — |
| `DI_CheckOutOfSequence` | [L98867](../../../../ScriptDB/000_4_CreateSP.sql#L98867) | — | 0 / 0 | — |
| `DI_ETWithHistory` | [L101690](../../../../ScriptDB/000_4_CreateSP.sql#L101690) | — | 0 / 0 | — |
| `DI_MemberListPaid` | [L102767](../../../../ScriptDB/000_4_CreateSP.sql#L102767) | — | 0 / 0 | — |
| `DI_MismatchFileAndPosition` | [L102789](../../../../ScriptDB/000_4_CreateSP.sql#L102789) | — | 0 / 0 | — |
| `DI_NSPFileContentList` | [L102903](../../../../ScriptDB/000_4_CreateSP.sql#L102903) | 1 / 1 file | 0 / 0 | [FundServ.cs:681](../../../../UBClasses/FundServ.cs#L681) |
| `DI_PositionZeroActive` | [L107192](../../../../ScriptDB/000_4_CreateSP.sql#L107192) | — | 0 / 0 | — |
| `DI_PSPFileReport_Discrepancies` | [L107552](../../../../ScriptDB/000_4_CreateSP.sql#L107552) | — | 0 / 1 | — |
| `DI_PSPFileReport_DiscrepanciesOneFile` | [L107794](../../../../ScriptDB/000_4_CreateSP.sql#L107794) | — | 1 / 0 | — |
| `DI_PSPFileReport_NotIncluded` | [L107887](../../../../ScriptDB/000_4_CreateSP.sql#L107887) | — | 0 / 0 | — |
| `DI_ReprocessTS` | [L108394](../../../../ScriptDB/000_4_CreateSP.sql#L108394) | — | 1 / 1 | — |
| `DI_ScanOneRIF` | [L108499](../../../../ScriptDB/000_4_CreateSP.sql#L108499) | — | 5 / 0 | — |
| `DI_ScanOneSWP` | [L108570](../../../../ScriptDB/000_4_CreateSP.sql#L108570) | — | 3 / 0 | — |
| `DI_ScanSWPRIF` | [L108630](../../../../ScriptDB/000_4_CreateSP.sql#L108630) | — | 0 / 2 | — |
| `DI_SetCalcUnit_All` | [L109068](../../../../ScriptDB/000_4_CreateSP.sql#L109068) | — | 0 / 2 | — |
| `DI_TableStats` | [L109417](../../../../ScriptDB/000_4_CreateSP.sql#L109417) | — | 0 / 0 | — |
| `DI_TSPRecordProcessDayEnd` | [L109528](../../../../ScriptDB/000_4_CreateSP.sql#L109528) | — | 0 / 1 | — |
| `EA_CON_WF_DealerBranch` | [L109778](../../../../ScriptDB/000_4_CreateSP.sql#L109778) | — | 0 / 1 | — |
| `EA_CON_WF_UserStep1` | [L109825](../../../../ScriptDB/000_4_CreateSP.sql#L109825) | — | 0 / 2 | — |
| `EA_CON_WF_UserStep2` | [L110007](../../../../ScriptDB/000_4_CreateSP.sql#L110007) | — | 0 / 6 | — |
| `EA_CON_WF_UserStep3` | [L110258](../../../../ScriptDB/000_4_CreateSP.sql#L110258) | — | 0 / 6 | — |
| `EA_Extract_JF` | [L110622](../../../../ScriptDB/000_4_CreateSP.sql#L110622) | — | 0 / 0 | — |
| `Fix_AEFile_Once_TBD` | [L112788](../../../../ScriptDB/000_4_CreateSP.sql#L112788) | — | 0 / 1 | — |
| `Global_UnclaimQC` | [L114800](../../../../ScriptDB/000_4_CreateSP.sql#L114800) | — | 0 / 0 | — |
| `GlobalRepBankAll` | [L115292](../../../../ScriptDB/000_4_CreateSP.sql#L115292) | — | 0 / 1 | — |
| `GlobalRepBankOne` | [L115319](../../../../ScriptDB/000_4_CreateSP.sql#L115319) | — | 1 / 0 | — |
| `INFGenerateIndexesScript` | [L115575](../../../../ScriptDB/000_4_CreateSP.sql#L115575) | — | 0 / 0 | — |
| `Init_AgemanRefresh` | [L115908](../../../../ScriptDB/000_4_CreateSP.sql#L115908) | — | 0 / 0 | — |
| `Init_AveragedCostAllPos` | [L115946](../../../../ScriptDB/000_4_CreateSP.sql#L115946) | — | 0 / 1 | — |
| `Init_AveragedCostAllPos1` | [L115982](../../../../ScriptDB/000_4_CreateSP.sql#L115982) | — | 0 / 1 | — |
| `Init_AveragedCostOneMgmt` | [L116027](../../../../ScriptDB/000_4_CreateSP.sql#L116027) | — | 0 / 1 | — |
| `Init_AveragedCostOnePos` | [L116053](../../../../ScriptDB/000_4_CreateSP.sql#L116053) | — | 3 / 1 | — |
| `Init_CheckInactiveMemberRep` | [L116448](../../../../ScriptDB/000_4_CreateSP.sql#L116448) | — | 0 / 0 | — |
| `Init_CleanupReport` | [L116596](../../../../ScriptDB/000_4_CreateSP.sql#L116596) | — | 0 / 0 | — |
| `Init_CreateDate` | [L117651](../../../../ScriptDB/000_4_CreateSP.sql#L117651) | — | 0 / 0 | — |
| `Init_CReateSynonyms` | [L117693](../../../../ScriptDB/000_4_CreateSP.sql#L117693) | — | 0 / 0 | — |
| `Init_Dealership` | [L117993](../../../../ScriptDB/000_4_CreateSP.sql#L117993) | — | 0 / 2 | — |
| `Init_DOBTable` | [L118039](../../../../ScriptDB/000_4_CreateSP.sql#L118039) | — | 0 / 0 | — |
| `Init_EA_2ndInvObj` | [L118064](../../../../ScriptDB/000_4_CreateSP.sql#L118064) | — | 0 / 1 | — |
| `Init_EA_2ndInvObjOne` | [L118089](../../../../ScriptDB/000_4_CreateSP.sql#L118089) | — | 1 / 0 | — |
| `Init_ExtractPhoneBankIdent` | [L118194](../../../../ScriptDB/000_4_CreateSP.sql#L118194) | — | 0 / 0 | — |
| `Init_FE_OneDay_OneDealer` | [L118250](../../../../ScriptDB/000_4_CreateSP.sql#L118250) | — | 0 / 2 | — |
| `Init_FE_OneDealer_AGCH` | [L118287](../../../../ScriptDB/000_4_CreateSP.sql#L118287) | — | 0 / 1 | — |
| `Init_FGFE` | [L118319](../../../../ScriptDB/000_4_CreateSP.sql#L118319) | — | 0 / 1 | — |
| `Init_FindBuyZeroBalance` | [L118478](../../../../ScriptDB/000_4_CreateSP.sql#L118478) | — | 0 / 0 | — |
| `Init_FixAveragedCost` | [L118743](../../../../ScriptDB/000_4_CreateSP.sql#L118743) | — | 0 / 1 | — |
| `Init_FixAveragedCostOne` | [L118798](../../../../ScriptDB/000_4_CreateSP.sql#L118798) | — | 1 / 0 | — |
| `Init_FixElectronicDeliveryInfo` | [L118828](../../../../ScriptDB/000_4_CreateSP.sql#L118828) | — | 0 / 0 | — |
| `Init_FixElectronicDeliveryInfoUserID` | [L118895](../../../../ScriptDB/000_4_CreateSP.sql#L118895) | — | 0 / 0 | — |
| `Init_FixETCOFNoSrcID` | [L118971](../../../../ScriptDB/000_4_CreateSP.sql#L118971) | — | 0 / 1 | — |
| `Init_FixICT` | [L119065](../../../../ScriptDB/000_4_CreateSP.sql#L119065) | — | 0 / 0 | — |
| `Init_FixSequence_1` | [L119200](../../../../ScriptDB/000_4_CreateSP.sql#L119200) | — | 0 / 0 | — |
| `Init_ImportBankBranchData` | [L119473](../../../../ScriptDB/000_4_CreateSP.sql#L119473) | — | 1 / 1 | — |
| `Init_ImportBankData` | [L119558](../../../../ScriptDB/000_4_CreateSP.sql#L119558) | — | 0 / 2 | — |
| `Init_MarkAsDeleteHave1Transf` | [L119857](../../../../ScriptDB/000_4_CreateSP.sql#L119857) | — | 0 / 0 | — |
| `Init_MarkAsDeleteHave2Transf` | [L119904](../../../../ScriptDB/000_4_CreateSP.sql#L119904) | — | 0 / 0 | — |
| `Init_Member` | [L120579](../../../../ScriptDB/000_4_CreateSP.sql#L120579) | — | 0 / 2 | — |
| `Init_MixUp` | [L120655](../../../../ScriptDB/000_4_CreateSP.sql#L120655) | — | 0 / 0 | — |
| `Init_MoveAsset2Rep` | [L120910](../../../../ScriptDB/000_4_CreateSP.sql#L120910) | — | 0 / 2 | — |
| `Init_OmnibusSyncStatus` | [L121381](../../../../ScriptDB/000_4_CreateSP.sql#L121381) | — | 0 / 0 | — |
| `Init_QuestionSecondaryObjQuestion` | [L121764](../../../../ScriptDB/000_4_CreateSP.sql#L121764) | — | 0 / 1 | — |
| `Init_QuestionSetVal` | [L121842](../../../../ScriptDB/000_4_CreateSP.sql#L121842) | — | 0 / 0 | — |
| `Init_RDSP_No_Contribution` | [L121890](../../../../ScriptDB/000_4_CreateSP.sql#L121890) | — | 0 / 0 | — |
| `Init_RecalcNetWorthIndex` | [L121932](../../../../ScriptDB/000_4_CreateSP.sql#L121932) | — | 0 / 0 | — |
| `Init_RemoveB2BStockBondAsset` | [L122444](../../../../ScriptDB/000_4_CreateSP.sql#L122444) | — | 0 / 0 | — |
| `Init_RestoreAddress` | [L122566](../../../../ScriptDB/000_4_CreateSP.sql#L122566) | — | 1 / 0 | — |
| `Init_RestoreBankBranchOne` | [L122598](../../../../ScriptDB/000_4_CreateSP.sql#L122598) | — | 1 / 0 | — |
| `Init_RestoreBankOne` | [L122633](../../../../ScriptDB/000_4_CreateSP.sql#L122633) | — | 0 / 2 | — |
| `Init_ReviewDate` | [L122695](../../../../ScriptDB/000_4_CreateSP.sql#L122695) | — | 0 / 0 | — |
| `Init_ReviewDateVF2VF` | [L122738](../../../../ScriptDB/000_4_CreateSP.sql#L122738) | — | 0 / 0 | — |
| `Init_RiskRatingHistory` | [L122792](../../../../ScriptDB/000_4_CreateSP.sql#L122792) | — | 0 / 0 | — |
| `Init_SetElectronicDeliveryInfo` | [L122964](../../../../ScriptDB/000_4_CreateSP.sql#L122964) | — | 0 / 0 | — |
| `Init_SetSupplierApproved` | [L123577](../../../../ScriptDB/000_4_CreateSP.sql#L123577) | — | 0 / 0 | — |
| `Init_SPInfo` | [L123633](../../../../ScriptDB/000_4_CreateSP.sql#L123633) | — | 0 / 0 | — |
| `Init_TransferRepCode` | [L123657](../../../../ScriptDB/000_4_CreateSP.sql#L123657) | — | 0 / 0 | — |
| `Init_VCApp` | [L123994](../../../../ScriptDB/000_4_CreateSP.sql#L123994) | — | 0 / 0 | — |
| `PHX_CON_DistList_One` | [L161809](../../../../ScriptDB/000_4_CreateSP.sql#L161809) | — | 1 / 0 | — |
| `PHX_CON_DistListAll` | [L161983](../../../../ScriptDB/000_4_CreateSP.sql#L161983) | — | 0 / 1 | — |
| `PHX_CON_PAC_Setting_All` | [L162772](../../../../ScriptDB/000_4_CreateSP.sql#L162772) | — | 0 / 1 | — |
| `PHX_CON_PAC_Setting_One` | [L162818](../../../../ScriptDB/000_4_CreateSP.sql#L162818) | — | 1 / 0 | — |
| `PHX_CON_SWP_Setting_All` | [L163216](../../../../ScriptDB/000_4_CreateSP.sql#L163216) | — | 0 / 1 | — |
| `PHX_CON_SWP_Setting_One` | [L163262](../../../../ScriptDB/000_4_CreateSP.sql#L163262) | — | 1 / 0 | — |
| `PHX_CON_UserRep` | [L164837](../../../../ScriptDB/000_4_CreateSP.sql#L164837) | — | 0 / 0 | — |
| `PSC_Step_1` | [L165860](../../../../ScriptDB/000_4_CreateSP.sql#L165860) | — | 0 / 0 | — |
| `PSC_Step2` | [L165919](../../../../ScriptDB/000_4_CreateSP.sql#L165919) | — | 0 / 1 | — |
| `QFixMSGItemValue` | [L165952](../../../../ScriptDB/000_4_CreateSP.sql#L165952) | — | 2 / 1 | — |
| `SetTaggedItemsPendingStatus` | [L166162](../../../../ScriptDB/000_4_CreateSP.sql#L166162) | — | 0 / 0 | — |
| `SKFixPartialBuy2Filled` | [L166484](../../../../ScriptDB/000_4_CreateSP.sql#L166484) | — | 0 / 0 | — |
| `SKOmnibusDividendDetail` | [L166917](../../../../ScriptDB/000_4_CreateSP.sql#L166917) | 1 / 1 file | 0 / 0 | [ETFOrder.cs:857](../../../../UBClasses/ETFOrder.cs#L857) |
| `SKOmnibusDividendDetail_Remove` | [L167143](../../../../ScriptDB/000_4_CreateSP.sql#L167143) | — | 0 / 0 | — |
| `SKOmnibusDividendInfo` | [L167319](../../../../ScriptDB/000_4_CreateSP.sql#L167319) | 1 / 1 file | 0 / 0 | [ETFOrder.cs:811](../../../../UBClasses/ETFOrder.cs#L811) |
| `SKOmnibusDividendSet` | [L167372](../../../../ScriptDB/000_4_CreateSP.sql#L167372) | 1 / 1 file | 0 / 0 | [ETFOrder.cs:726](../../../../UBClasses/ETFOrder.cs#L726) |
| `SKPriceReqHistoryList` | [L168170](../../../../ScriptDB/000_4_CreateSP.sql#L168170) | — | 0 / 0 | — |
| `SKQFix_CorrectAvgPxOne` | [L168253](../../../../ScriptDB/000_4_CreateSP.sql#L168253) | — | 0 / 1 | — |
| `SKQFixDefFieldInit` | [L168303](../../../../ScriptDB/000_4_CreateSP.sql#L168303) | — | 0 / 0 | — |
| `SKQFixDefFieldValInit` | [L168341](../../../../ScriptDB/000_4_CreateSP.sql#L168341) | — | 0 / 0 | — |
| `SKQFixDefList` | [L168387](../../../../ScriptDB/000_4_CreateSP.sql#L168387) | — | 0 / 0 | — |
| `SKQFixDefList_Val` | [L168409](../../../../ScriptDB/000_4_CreateSP.sql#L168409) | — | 0 / 0 | — |
| `SKQuickFixMSGAdd` | [L168440](../../../../ScriptDB/000_4_CreateSP.sql#L168440) | 1 / 1 file | 0 / 2 | [VFQFMain.cs:73](../../../../VFQuickFix/VFQuickFix/VFQFMain.cs#L73) |
| `SKQuickFixMSGDetail` | [L168500](../../../../ScriptDB/000_4_CreateSP.sql#L168500) | 1 / 1 file | 0 / 1 | [ETFOrder.cs:83](../../../../UBClasses/ETFOrder.cs#L83) |
| `SKQuickFixMSGExcutionDayEnd` | [L168561](../../../../ScriptDB/000_4_CreateSP.sql#L168561) | — | 0 / 1 | — |
| `SKQuickFixMSGExcutionReportProcess` | [L168587](../../../../ScriptDB/000_4_CreateSP.sql#L168587) | — | 2 / 6 | — |
| `SKQuickFixMSGSet` | [L169223](../../../../ScriptDB/000_4_CreateSP.sql#L169223) | 1 / 1 file | 0 / 0 | [ETFOrder.cs:33](../../../../UBClasses/ETFOrder.cs#L33) |
| `SKQuickFixMSGTypeSequence` | [L169286](../../../../ScriptDB/000_4_CreateSP.sql#L169286) | — | 1 / 1 | — |
| `SKQuickFixPriceReqAdd` | [L169769](../../../../ScriptDB/000_4_CreateSP.sql#L169769) | — | 0 / 0 | — |
| `SKQuickFixPriceReqSet` | [L169796](../../../../ScriptDB/000_4_CreateSP.sql#L169796) | 1 / 1 file | 0 / 0 | [VFQFMain.cs:181](../../../../VFQuickFix/VFQuickFix/VFQFMain.cs#L181) |
| `SKQuickFixSetting` | [L169821](../../../../ScriptDB/000_4_CreateSP.sql#L169821) | — | 0 / 0 | — |
| `TT_OPEN` | [L171163](../../../../ScriptDB/000_4_CreateSP.sql#L171163) | — | 1 / 1 | — |
| `TT_RIF` | [L171379](../../../../ScriptDB/000_4_CreateSP.sql#L171379) | — | 1 / 1 | — |
| `TT_RSP` | [L171599](../../../../ScriptDB/000_4_CreateSP.sql#L171599) | — | 1 / 1 | — |
| `TT_SUMMARY` | [L171836](../../../../ScriptDB/000_4_CreateSP.sql#L171836) | — | 1 / 2 | — |
| `TT_TFSA` | [L172591](../../../../ScriptDB/000_4_CreateSP.sql#L172591) | — | 1 / 1 | — |
| `UB_PriceRemoveDuplicate` | [L172983](../../../../ScriptDB/000_4_CreateSP.sql#L172983) | — | 0 / 0 | — |
| `UB2FAGetCode4User` | [L173204](../../../../ScriptDB/000_4_CreateSP.sql#L173204) | 1 / 1 file | 0 / 2 | [CDatabase.cs:2672](../../../../UBConnection/CDatabase.cs#L2672) |
| `UB3rdAppInfo` | [L173295](../../../../ScriptDB/000_4_CreateSP.sql#L173295) | — | 0 / 0 | — |
| `UB3rdAppList` | [L173322](../../../../ScriptDB/000_4_CreateSP.sql#L173322) | — | 1 / 0 | — |
| `UBAABuyItemInfo` | [L173349](../../../../ScriptDB/000_4_CreateSP.sql#L173349) | 1 / 1 file | 0 / 0 | [AssetAllocation.cs:892](../../../../UBClasses/AssetAllocation.cs#L892) |
| `UBAABuyItemUpdate` | [L173378](../../../../ScriptDB/000_4_CreateSP.sql#L173378) | 1 / 1 file | 0 / 0 | [AssetAllocation.cs:940](../../../../UBClasses/AssetAllocation.cs#L940) |
| `UBAACreatePosition` | [L173812](../../../../ScriptDB/000_4_CreateSP.sql#L173812) | — | 7 / 1 | — |
| `UBAADefComboList` | [L173908](../../../../ScriptDB/000_4_CreateSP.sql#L173908) | — | 0 / 6 | — |
| `UBAADetailInfo` | [L173941](../../../../ScriptDB/000_4_CreateSP.sql#L173941) | 1 / 1 file | 0 / 0 | [AssetAllocation.cs:842](../../../../UBClasses/AssetAllocation.cs#L842) |
| `UBAADetailList` | [L173986](../../../../ScriptDB/000_4_CreateSP.sql#L173986) | 1 / 1 file | 1 / 1 | [AssetAllocation.cs:793](../../../../UBClasses/AssetAllocation.cs#L793) |
| `UBAADetailRemove` | [L174287](../../../../ScriptDB/000_4_CreateSP.sql#L174287) | 1 / 1 file | 0 / 0 | [AssetAllocation.cs:746](../../../../UBClasses/AssetAllocation.cs#L746) |
| `UBAADetailUpdate` | [L174309](../../../../ScriptDB/000_4_CreateSP.sql#L174309) | — | 0 / 1 | — |
| `UBAAFolderAdd` | [L174384](../../../../ScriptDB/000_4_CreateSP.sql#L174384) | — | 0 / 0 | — |
| `UBAAFolderList` | [L174439](../../../../ScriptDB/000_4_CreateSP.sql#L174439) | 1 / 1 file | 0 / 0 | [AssetAllocation.cs:524](../../../../UBClasses/AssetAllocation.cs#L524) |
| `UBAAFolderRemove` | [L174513](../../../../ScriptDB/000_4_CreateSP.sql#L174513) | 1 / 1 file | 0 / 0 | [AssetAllocation.cs:430](../../../../UBClasses/AssetAllocation.cs#L430) |
| `UBAAFolderSimpleList` | [L174539](../../../../ScriptDB/000_4_CreateSP.sql#L174539) | — | 1 / 0 | — |
| `UBAAFolderUpdate` | [L174586](../../../../ScriptDB/000_4_CreateSP.sql#L174586) | — | 0 / 1 | — |
| `UBAAItemInfo` | [L175326](../../../../ScriptDB/000_4_CreateSP.sql#L175326) | 2 / 2 file | 0 / 5 | [AssetAllocation.cs:573](../../../../UBClasses/AssetAllocation.cs#L573) |
| `UBAAListing1Model` | [L175764](../../../../ScriptDB/000_4_CreateSP.sql#L175764) | — | 0 / 0 | — |
| `UBAARebalanceSelectionUpdate` | [L176748](../../../../ScriptDB/000_4_CreateSP.sql#L176748) | — | 0 / 0 | — |
| `UBAccMFList` | [L177734](../../../../ScriptDB/000_4_CreateSP.sql#L177734) | 2 / 1 file | 0 / 0 | [FundAccount.cs:292](../../../../UBClasses/FundAccount.cs#L292) |
| `UBAddressAdd` | [L182464](../../../../ScriptDB/000_4_CreateSP.sql#L182464) | — | 88 / 2 | — |
| `UBAddressChangeList` | [L182569](../../../../ScriptDB/000_4_CreateSP.sql#L182569) | 1 / 1 file | 0 / 1 | [AuditTrail.cs:184](../../../../UBClasses/AuditTrail.cs#L184) |
| `UBAddressGet` | [L182791](../../../../ScriptDB/000_4_CreateSP.sql#L182791) | — | 11 / 0 | — |
| `UBAddressSplitFrom1Str` | [L182832](../../../../ScriptDB/000_4_CreateSP.sql#L182832) | — | 0 / 0 | — |
| `UBAddressUpdate` | [L182961](../../../../ScriptDB/000_4_CreateSP.sql#L182961) | — | 37 / 2 | — |
| `UBAdvisorList` | [L183061](../../../../ScriptDB/000_4_CreateSP.sql#L183061) | 2 / 1 file | 0 / 1 | [Advisor.cs:84](../../../../UBClasses/Advisor.cs#L84) |
| `UBAdvisorNameList` | [L183321](../../../../ScriptDB/000_4_CreateSP.sql#L183321) | 1 / 1 file | 0 / 1 | [Advisor.cs:343](../../../../UBClasses/Advisor.cs#L343) |
| `UBAnnualIncomeList` | [L183553](../../../../ScriptDB/000_4_CreateSP.sql#L183553) | — | 6 / 0 | — |
| `UBAppAdd` | [L183583](../../../../ScriptDB/000_4_CreateSP.sql#L183583) | 1 / 1 file | 0 / 0 | [TrxApplication.cs:191](../../../../UBClasses/TrxApplication.cs#L191) |
| `UBAppComboList` | [L183627](../../../../ScriptDB/000_4_CreateSP.sql#L183627) | — | 0 / 1 | — |
| `UBAppList` | [L183651](../../../../ScriptDB/000_4_CreateSP.sql#L183651) | 1 / 1 file | 0 / 0 | [TrxApplication.cs:104](../../../../UBClasses/TrxApplication.cs#L104) |
| `UBAppRemove` | [L183694](../../../../ScriptDB/000_4_CreateSP.sql#L183694) | 1 / 1 file | 0 / 0 | [TrxApplication.cs:253](../../../../UBClasses/TrxApplication.cs#L253) |
| `UBAppTypeList` | [L183726](../../../../ScriptDB/000_4_CreateSP.sql#L183726) | — | 1 / 0 | — |
| `UBAppUpdate` | [L183751](../../../../ScriptDB/000_4_CreateSP.sql#L183751) | 1 / 1 file | 0 / 0 | [TrxApplication.cs:191](../../../../UBClasses/TrxApplication.cs#L191) |
| `UBASMDetailSet` | [L183794](../../../../ScriptDB/000_4_CreateSP.sql#L183794) | 1 / 1 file | 0 / 0 | [ASMView.cs:108](../../../../UBClasses/ASMView.cs#L108) |
| `UBASMHeaderAdd` | [L184002](../../../../ScriptDB/000_4_CreateSP.sql#L184002) | — | 0 / 0 | — |
| `UBASMHeaderSet` | [L184063](../../../../ScriptDB/000_4_CreateSP.sql#L184063) | 1 / 1 file | 0 / 0 | [ASMView.cs:44](../../../../UBClasses/ASMView.cs#L44) |
| `UBASMPymtAdd` | [L184297](../../../../ScriptDB/000_4_CreateSP.sql#L184297) | — | 0 / 0 | — |
| `UBASMPymtByPartAdd` | [L184401](../../../../ScriptDB/000_4_CreateSP.sql#L184401) | — | 0 / 0 | — |
| `UBAssetOneRep` | [L186154](../../../../ScriptDB/000_4_CreateSP.sql#L186154) | — | 4 / 1 | — |
| `UBAssetOneRepX` | [L186271](../../../../ScriptDB/000_4_CreateSP.sql#L186271) | — | 3 / 1 | — |
| `UBAssistantGet` | [L186681](../../../../ScriptDB/000_4_CreateSP.sql#L186681) | — | 1 / 2 | — |
| `UBAttGetCount` | [L186854](../../../../ScriptDB/000_4_CreateSP.sql#L186854) | 1 / 1 file | 0 / 0 | [Document.cs:4794](../../../../UBClasses/Document.cs#L4794) |
| `UBAttSelectionUpdate` | [L186873](../../../../ScriptDB/000_4_CreateSP.sql#L186873) | — | 0 / 0 | — |
| `UBAttTaggedItemsObj` | [L186907](../../../../ScriptDB/000_4_CreateSP.sql#L186907) | 1 / 1 file | 0 / 0 | [CZipDocument.cs:43](../../../../UBExport/CZipDocument.cs#L43) |
| `UBAttTypeKYPVerify` | [L186981](../../../../ScriptDB/000_4_CreateSP.sql#L186981) | — | 1 / 0 | — |
| `UBAUACurrent` | [L187018](../../../../ScriptDB/000_4_CreateSP.sql#L187018) | 1 / 1 file | 0 / 4 | [AUACurrent.cs:38](../../../../VieFUNDPdf/AUACurrent.cs#L38) |
| `UBAUAQuarterReport` | [L187121](../../../../ScriptDB/000_4_CreateSP.sql#L187121) | — | 0 / 3 | — |
| `UBAUAQuarterReport10Positions` | [L187449](../../../../ScriptDB/000_4_CreateSP.sql#L187449) | — | 0 / 1 | — |
| `UBAUAQuarterReport5Positions` | [L187515](../../../../ScriptDB/000_4_CreateSP.sql#L187515) | — | 0 / 1 | — |
| `UBAUAQuarterReportClear` | [L187568](../../../../ScriptDB/000_4_CreateSP.sql#L187568) | — | 2 / 0 | — |
| `UBAUAQuarterReportOnePosition` | [L187595](../../../../ScriptDB/000_4_CreateSP.sql#L187595) | — | 2 / 1 | — |
| `UBAUAQuarterReportOneRep` | [L187694](../../../../ScriptDB/000_4_CreateSP.sql#L187694) | — | 0 / 2 | — |
| `UBAUAQuarterReportOneRepSave6Values` | [L188033](../../../../ScriptDB/000_4_CreateSP.sql#L188033) | — | 0 / 0 | — |
| `UBAUAQuarterReportStart` | [L188118](../../../../ScriptDB/000_4_CreateSP.sql#L188118) | — | 0 / 1 | — |
| `UBAuditTrailAdd` | [L188157](../../../../ScriptDB/000_4_CreateSP.sql#L188157) | — | 11 / 2 | — |
| `UBAuditTrailAddByName` | [L188255](../../../../ScriptDB/000_4_CreateSP.sql#L188255) | — | 8 / 1 | — |
| `UBAuditTrailAddByName5` | [L188287](../../../../ScriptDB/000_4_CreateSP.sql#L188287) | — | 66 / 1 | — |
| `UBAuditTrailAddByNameDate` | [L188326](../../../../ScriptDB/000_4_CreateSP.sql#L188326) | — | 1 / 1 | — |
| `UBAuditTrailAddByNameDate5` | [L188352](../../../../ScriptDB/000_4_CreateSP.sql#L188352) | — | 44 / 1 | — |
| `UBAuditTrailAddByNameDateTime` | [L188392](../../../../ScriptDB/000_4_CreateSP.sql#L188392) | — | 1 / 1 | — |
| `UBAuditTrailAddByNameDateTime5` | [L188418](../../../../ScriptDB/000_4_CreateSP.sql#L188418) | — | 0 / 1 | — |
| `UBAuditTrailAddByNameFloat` | [L188457](../../../../ScriptDB/000_4_CreateSP.sql#L188457) | — | 2 / 1 | — |
| `UBAuditTrailAddByNameFloat5` | [L188483](../../../../ScriptDB/000_4_CreateSP.sql#L188483) | — | 24 / 1 | — |
| `UBAuditTrailAddByNameInt` | [L188521](../../../../ScriptDB/000_4_CreateSP.sql#L188521) | — | 1 / 1 | — |
| `UBAuditTrailAddByNameInt5` | [L188547](../../../../ScriptDB/000_4_CreateSP.sql#L188547) | — | 62 / 1 | — |
| `UBAuditTrailAddByNameMoney` | [L188585](../../../../ScriptDB/000_4_CreateSP.sql#L188585) | — | 1 / 1 | — |
| `UBAuditTrailAddByNameMoney5` | [L188611](../../../../ScriptDB/000_4_CreateSP.sql#L188611) | — | 10 / 1 | — |
| `UBAuditTrailGIAAnnuitant` | [L189048](../../../../ScriptDB/000_4_CreateSP.sql#L189048) | — | 4 / 5 | — |
| `UBAuditTrailGIADeadBen` | [L189105](../../../../ScriptDB/000_4_CreateSP.sql#L189105) | — | 4 / 6 | — |
| `UBAuditTrailGIASuccessorOwner` | [L189169](../../../../ScriptDB/000_4_CreateSP.sql#L189169) | — | 4 / 5 | — |
| `UBAuditTrailGroupAdd` | [L189557](../../../../ScriptDB/000_4_CreateSP.sql#L189557) | — | 111 / 0 | — |
| `UBAuditTrailGroupVerify` | [L189762](../../../../ScriptDB/000_4_CreateSP.sql#L189762) | 1 / 1 file | 54 / 2 | [COnBoarding.cs:1741](../../../../VFOnBoarding/COnBoarding.cs#L1741) |
| `UBAuditTrailOneField` | [L191076](../../../../ScriptDB/000_4_CreateSP.sql#L191076) | — | 1 / 0 | — |
| `UBAuditTrailPerson` | [L191124](../../../../ScriptDB/000_4_CreateSP.sql#L191124) | — | 2 / 5 | — |
| `UBAuditTrailResetAll` | [L191483](../../../../ScriptDB/000_4_CreateSP.sql#L191483) | — | 0 / 4 | — |
| `UBAuditTrailView` | [L191513](../../../../ScriptDB/000_4_CreateSP.sql#L191513) | 1 / 1 file | 0 / 3 | [AuditTrail.cs:100](../../../../UBClasses/AuditTrail.cs#L100) |
| `UBAuditTrailViewAdmin` | [L191756](../../../../ScriptDB/000_4_CreateSP.sql#L191756) | — | 1 / 0 | — |
| `UBAuditTrailViewComboList` | [L191975](../../../../ScriptDB/000_4_CreateSP.sql#L191975) | — | 0 / 1 | — |
| `UBAuditTrailViewSearchCriteriaSave` | [L192000](../../../../ScriptDB/000_4_CreateSP.sql#L192000) | — | 1 / 1 | — |
| `UBAverageCostReCalc` | [L192071](../../../../ScriptDB/000_4_CreateSP.sql#L192071) | — | 0 / 1 | — |
| `UBAveragedCostAdd` | [L192148](../../../../ScriptDB/000_4_CreateSP.sql#L192148) | — | 5 / 0 | — |
| `UBAveragedCostCalc1Dealer` | [L192200](../../../../ScriptDB/000_4_CreateSP.sql#L192200) | — | 0 / 1 | — |
| `UBAveragedCostCalc1Pos` | [L192271](../../../../ScriptDB/000_4_CreateSP.sql#L192271) | — | 1 / 0 | — |
| `UBAveragedCostCalc1Pos_Test` | [L192359](../../../../ScriptDB/000_4_CreateSP.sql#L192359) | — | 0 / 0 | — |
| `UBB2BAssetDetailList` | [L192473](../../../../ScriptDB/000_4_CreateSP.sql#L192473) | — | 0 / 1 | — |
| `UBBankAdd` | [L192676](../../../../ScriptDB/000_4_CreateSP.sql#L192676) | 1 / 1 file | 1 / 1 | [Bank.cs:294](../../../../UBClasses/Bank.cs#L294) |
| `UBBankBranchAdd` | [L192731](../../../../ScriptDB/000_4_CreateSP.sql#L192731) | 1 / 1 file | 1 / 1 | [BankBranch.cs:281](../../../../UBClasses/BankBranch.cs#L281) |
| `UBBankBranchInfo` | [L192783](../../../../ScriptDB/000_4_CreateSP.sql#L192783) | 1 / 1 file | 0 / 0 | [BankBranch.cs:77](../../../../UBClasses/BankBranch.cs#L77) |
| `UBBankBranchList` | [L192826](../../../../ScriptDB/000_4_CreateSP.sql#L192826) | 1 / 1 file | 0 / 0 | [BankBranch.cs:166](../../../../UBClasses/BankBranch.cs#L166) |
| `UBBankBranchRemove` | [L192959](../../../../ScriptDB/000_4_CreateSP.sql#L192959) | 1 / 1 file | 0 / 0 | [BankBranch.cs:349](../../../../UBClasses/BankBranch.cs#L349) |
| `UBBankBranchUpdate` | [L193009](../../../../ScriptDB/000_4_CreateSP.sql#L193009) | 1 / 1 file | 0 / 2 | [BankBranch.cs:281](../../../../UBClasses/BankBranch.cs#L281) |
| `UBBankBranchVerify` | [L193065](../../../../ScriptDB/000_4_CreateSP.sql#L193065) | — | 6 / 2 | — |
| `UBBankInfo` | [L193133](../../../../ScriptDB/000_4_CreateSP.sql#L193133) | 1 / 1 file | 0 / 0 | [Bank.cs:36](../../../../UBClasses/Bank.cs#L36) |
| `UBBankList` | [L193169](../../../../ScriptDB/000_4_CreateSP.sql#L193169) | 1 / 1 file | 0 / 0 | [Bank.cs:189](../../../../UBClasses/Bank.cs#L189) |
| `UBBankRemove` | [L193208](../../../../ScriptDB/000_4_CreateSP.sql#L193208) | 1 / 1 file | 0 / 0 | [Bank.cs:360](../../../../UBClasses/Bank.cs#L360) |
| `UBBankUpdate` | [L193252](../../../../ScriptDB/000_4_CreateSP.sql#L193252) | 1 / 1 file | 0 / 2 | [Bank.cs:294](../../../../UBClasses/Bank.cs#L294) |
| `UBBasketItemInfo` | [L193305](../../../../ScriptDB/000_4_CreateSP.sql#L193305) | 1 / 1 file | 0 / 0 | [Trx.cs:5151](../../../../UBClasses/Trx.cs#L5151) |
| `UBBasketList` | [L193365](../../../../ScriptDB/000_4_CreateSP.sql#L193365) | 1 / 1 file | 0 / 0 | [Trx.cs:4773](../../../../UBClasses/Trx.cs#L4773) |
| `UBBasketProcessAll` | [L193557](../../../../ScriptDB/000_4_CreateSP.sql#L193557) | 1 / 1 file | 0 / 5 | [Trx.cs:5095](../../../../UBClasses/Trx.cs#L5095) |
| `UBBasketProcessOne` | [L193889](../../../../ScriptDB/000_4_CreateSP.sql#L193889) | — | 1 / 5 | — |
| `UBBasketRemove` | [L194157](../../../../ScriptDB/000_4_CreateSP.sql#L194157) | — | 0 / 0 | — |
| `UBBasketSelectionUpdate` | [L194196](../../../../ScriptDB/000_4_CreateSP.sql#L194196) | — | 0 / 0 | — |
| `UBBasketViewList` | [L194233](../../../../ScriptDB/000_4_CreateSP.sql#L194233) | 1 / 1 file | 0 / 1 | [Trx.cs:6376](../../../../UBClasses/Trx.cs#L6376) |
| `UBBenItemInfo` | [L194746](../../../../ScriptDB/000_4_CreateSP.sql#L194746) | 1 / 1 file | 0 / 0 | [Plan.cs:5088](../../../../UBClasses/Plan.cs#L5088) |
| `UBBenNewContributionList` | [L194888](../../../../ScriptDB/000_4_CreateSP.sql#L194888) | 1 / 1 file | 1 / 0 | [Plan.cs:4918](../../../../UBClasses/Plan.cs#L4918) |
| `UBBenRecordTypeList` | [L195002](../../../../ScriptDB/000_4_CreateSP.sql#L195002) | — | 2 / 0 | — |
| `UBBenTypeList` | [L195028](../../../../ScriptDB/000_4_CreateSP.sql#L195028) | — | 3 / 0 | — |
| `UBBranchList` | [L195058](../../../../ScriptDB/000_4_CreateSP.sql#L195058) | 1 / 1 file | 0 / 1 | [DealerBranch.cs:105](../../../../UBClasses/DealerBranch.cs#L105) |
| `UBBusinessTypeList` | [L199539](../../../../ScriptDB/000_4_CreateSP.sql#L199539) | — | 1 / 0 | — |
| `UBCalcRetirement` | [L199572](../../../../ScriptDB/000_4_CreateSP.sql#L199572) | 1 / 1 file | 0 / 0 | [Customer.cs:5224](../../../../UBClasses/Customer.cs#L5224) |
| `UBCannexDealerStatusUpdate` | [L199758](../../../../ScriptDB/000_4_CreateSP.sql#L199758) | 1 / 1 file | 0 / 0 | [Dealer.cs:620](../../../../UBClasses/Dealer.cs#L620) |
| `UBCannexFileDef` | [L199775](../../../../ScriptDB/000_4_CreateSP.sql#L199775) | — | 0 / 0 | — |
| `UBCannexGetOneItemAddress` | [L199818](../../../../ScriptDB/000_4_CreateSP.sql#L199818) | 1 / 1 file | 0 / 1 | [CannexOrder.cs:356](../../../../UBFFImport/CannexOrder.cs#L356) |
| `UBCannexGetPending` | [L200807](../../../../ScriptDB/000_4_CreateSP.sql#L200807) | 1 / 1 file | 0 / 1 | [CannexOrder.cs:279](../../../../UBFFImport/CannexOrder.cs#L279) |
| `UBCannexProcessOneItem_Term1_3_7` | [L201468](../../../../ScriptDB/000_4_CreateSP.sql#L201468) | — | 0 / 2 | — |
| `UBCannexProcessOneItem_Term2_3_7` | [L201572](../../../../ScriptDB/000_4_CreateSP.sql#L201572) | — | 0 / 2 | — |
| `UBCannexProcessOneLine` | [L201730](../../../../ScriptDB/000_4_CreateSP.sql#L201730) | — | 1 / 0 | — |
| `UBCannexSaveCutOffTime` | [L201924](../../../../ScriptDB/000_4_CreateSP.sql#L201924) | — | 1 / 1 | — |
| `UBCannexTERMWAddRecord` | [L201938](../../../../ScriptDB/000_4_CreateSP.sql#L201938) | — | 0 / 0 | — |
| `UBCannexTERMWAddRecordAddress` | [L202005](../../../../ScriptDB/000_4_CreateSP.sql#L202005) | — | 0 / 0 | — |
| `UBCannexTERMWUpdateRecord` | [L202039](../../../../ScriptDB/000_4_CreateSP.sql#L202039) | — | 0 / 0 | — |
| `UBCannexVerify` | [L202125](../../../../ScriptDB/000_4_CreateSP.sql#L202125) | — | 1 / 1 | — |
| `UBCDICData4XML` | [L209284](../../../../ScriptDB/000_4_CreateSP.sql#L209284) | — | 1 / 1 | — |
| `UBCDICDataInitUCI` | [L209513](../../../../ScriptDB/000_4_CreateSP.sql#L209513) | — | 0 / 0 | — |
| `UBCDICDataListUCI` | [L210200](../../../../ScriptDB/000_4_CreateSP.sql#L210200) | 1 / 1 file | 2 / 1 | [Customer.cs:5673](../../../../UBClasses/Customer.cs#L5673) |
| `UBCDICScanAll` | [L210314](../../../../ScriptDB/000_4_CreateSP.sql#L210314) | — | 1 / 1 | — |
| `UBCertificateList` | [L210354](../../../../ScriptDB/000_4_CreateSP.sql#L210354) | — | 3 / 0 | — |
| `UBCheckParams` | [L210384](../../../../ScriptDB/000_4_CreateSP.sql#L210384) | — | 1 / 0 | — |
| `UBChequeGetID4Dealer` | [L210599](../../../../ScriptDB/000_4_CreateSP.sql#L210599) | — | 1 / 0 | — |
| `UBChequeGetID4Member` | [L210687](../../../../ScriptDB/000_4_CreateSP.sql#L210687) | — | 0 / 0 | — |
| `UBChequeGetID4Mgmt` | [L210769](../../../../ScriptDB/000_4_CreateSP.sql#L210769) | — | 1 / 0 | — |
| `UBChequeInfoDefault` | [L210864](../../../../ScriptDB/000_4_CreateSP.sql#L210864) | — | 0 / 0 | — |
| `UBChequeNumberGet` | [L210910](../../../../ScriptDB/000_4_CreateSP.sql#L210910) | — | 0 / 0 | — |
| `UBChequeNumberLast` | [L210937](../../../../ScriptDB/000_4_CreateSP.sql#L210937) | 1 / 1 file | 0 / 0 | [BankAccount.cs:772](../../../../UBClasses/BankAccount.cs#L772) |
| `UBChequeNumberSet` | [L210966](../../../../ScriptDB/000_4_CreateSP.sql#L210966) | — | 1 / 0 | — |
| `UBChequeStatusList` | [L210990](../../../../ScriptDB/000_4_CreateSP.sql#L210990) | — | 1 / 0 | — |
| `UBCityAdd` | [L211015](../../../../ScriptDB/000_4_CreateSP.sql#L211015) | — | 6 / 0 | — |
| `UBCityList` | [L211068](../../../../ScriptDB/000_4_CreateSP.sql#L211068) | 1 / 1 file | 0 / 0 | [City.cs:89](../../../../UBClasses/City.cs#L89) |
| `UBClearAllTMP` | [L211118](../../../../ScriptDB/000_4_CreateSP.sql#L211118) | — | 1 / 16 | — |
| `UBCompApprovalComboList` | [L271499](../../../../ScriptDB/000_4_CreateSP.sql#L271499) | — | 0 / 1 | — |
| `UBCompApprovalLevelList` | [L271523](../../../../ScriptDB/000_4_CreateSP.sql#L271523) | — | 4 / 0 | — |
| `UBCompApprovalStatusList` | [L271563](../../../../ScriptDB/000_4_CreateSP.sql#L271563) | — | 3 / 0 | — |
| `UBCompCalcRiskBasket` | [L273209](../../../../ScriptDB/000_4_CreateSP.sql#L273209) | 1 / 1 file | 0 / 1 | [Compliance.cs:504](../../../../UBClasses/Compliance.cs#L504) |
| `UBCompCalcRiskBasketOne` | [L273235](../../../../ScriptDB/000_4_CreateSP.sql#L273235) | — | 3 / 0 | — |
| `UBCompCalcRiskTMP` | [L273992](../../../../ScriptDB/000_4_CreateSP.sql#L273992) | 1 / 1 file | 0 / 0 | [Compliance.cs:378](../../../../UBClasses/Compliance.cs#L378) |
| `UBCompGetSettings` | [L276918](../../../../ScriptDB/000_4_CreateSP.sql#L276918) | 1 / 1 file | 2 / 0 | [Compliance.cs:105](../../../../UBClasses/Compliance.cs#L105) |
| `UBCompReportTypeList` | [L279701](../../../../ScriptDB/000_4_CreateSP.sql#L279701) | — | 0 / 0 | — |
| `UBCompSaveSettings` | [L279740](../../../../ScriptDB/000_4_CreateSP.sql#L279740) | 1 / 1 file | 0 / 2 | [Compliance.cs:168](../../../../UBClasses/Compliance.cs#L168) |
| `UBCompSummaryComboList` | [L280108](../../../../ScriptDB/000_4_CreateSP.sql#L280108) | — | 0 / 1 | — |
| `UBCompSummaryList` | [L280136](../../../../ScriptDB/000_4_CreateSP.sql#L280136) | 1 / 1 file | 0 / 3 | [Compliance.cs:48](../../../../UBClasses/Compliance.cs#L48) |
| `UBCompSupervisoryLevelList` | [L280225](../../../../ScriptDB/000_4_CreateSP.sql#L280225) | — | 5 / 0 | — |
| `UBCompTrend_LowMER_FixHouseHoldMKV` | [L280300](../../../../ScriptDB/000_4_CreateSP.sql#L280300) | — | 0 / 0 | — |
| `UBCompTrend_LowMER_List` | [L280375](../../../../ScriptDB/000_4_CreateSP.sql#L280375) | 2 / 2 file | 0 / 0 | [Compliance.cs:5620](../../../../UBClasses/Compliance.cs#L5620) |
| `UBCompTrend_MER_Step1` | [L280630](../../../../ScriptDB/000_4_CreateSP.sql#L280630) | — | 0 / 0 | — |
| `UBCompTrend_MER_Step2` | [L280684](../../../../ScriptDB/000_4_CreateSP.sql#L280684) | — | 0 / 0 | — |
| `UBCompTrend_MER_Step3` | [L280774](../../../../ScriptDB/000_4_CreateSP.sql#L280774) | — | 0 / 1 | — |
| `UBCompTrend_MER_Step4` | [L280881](../../../../ScriptDB/000_4_CreateSP.sql#L280881) | — | 0 / 0 | — |
| `UBCompTrend2SidedList` | [L280978](../../../../ScriptDB/000_4_CreateSP.sql#L280978) | — | 0 / 2 | — |
| `UBCompTrend2SidedRemove` | [L281343](../../../../ScriptDB/000_4_CreateSP.sql#L281343) | — | 0 / 0 | — |
| `UBCompTrendFrequentTrading` | [L281792](../../../../ScriptDB/000_4_CreateSP.sql#L281792) | 2 / 2 file | 0 / 2 | [Compliance.cs:1609](../../../../UBClasses/Compliance.cs#L1609) |
| `UBCompTrendFrequentTradingSave` | [L282087](../../../../ScriptDB/000_4_CreateSP.sql#L282087) | — | 1 / 1 | — |
| `UBCompTrendHouseHoldScan` | [L282218](../../../../ScriptDB/000_4_CreateSP.sql#L282218) | — | 0 / 0 | — |
| `UBCompTrendRecalc` | [L282235](../../../../ScriptDB/000_4_CreateSP.sql#L282235) | — | 0 / 1 | — |
| `UBCompTrendReviewList` | [L282276](../../../../ScriptDB/000_4_CreateSP.sql#L282276) | 1 / 1 file | 0 / 0 | [Compliance.cs:3589](../../../../UBClasses/Compliance.cs#L3589) |
| `UBCompTrendReviewObj` | [L282331](../../../../ScriptDB/000_4_CreateSP.sql#L282331) | 1 / 1 file | 0 / 0 | [Compliance.cs:3648](../../../../UBClasses/Compliance.cs#L3648) |
| `UBCompTrendReviewObjAdd` | [L282358](../../../../ScriptDB/000_4_CreateSP.sql#L282358) | 1 / 1 file | 0 / 0 | [Compliance.cs:3529](../../../../UBClasses/Compliance.cs#L3529) |
| `UBCompTrendReviewRemove` | [L282410](../../../../ScriptDB/000_4_CreateSP.sql#L282410) | 1 / 1 file | 0 / 0 | [Compliance.cs:3694](../../../../UBClasses/Compliance.cs#L3694) |
| `UBContactPrefMethod` | [L293010](../../../../ScriptDB/000_4_CreateSP.sql#L293010) | — | 1 / 0 | — |
| `UBContactPrefTimeList` | [L293040](../../../../ScriptDB/000_4_CreateSP.sql#L293040) | — | 1 / 0 | — |
| `UBContributionReceiptList` | [L293070](../../../../ScriptDB/000_4_CreateSP.sql#L293070) | — | 2 / 0 | — |
| `UBCountryAdd` | [L294190](../../../../ScriptDB/000_4_CreateSP.sql#L294190) | 1 / 1 file | 0 / 0 | [Country.cs:273](../../../../UBClasses/Country.cs#L273) |
| `UBCountryList` | [L294238](../../../../ScriptDB/000_4_CreateSP.sql#L294238) | 1 / 1 file | 0 / 0 | [Country.cs:165](../../../../UBClasses/Country.cs#L165) |
| `UBCountryRemove` | [L294296](../../../../ScriptDB/000_4_CreateSP.sql#L294296) | 1 / 1 file | 0 / 0 | [Country.cs:335](../../../../UBClasses/Country.cs#L335) |
| `UBCountryUpdate` | [L294344](../../../../ScriptDB/000_4_CreateSP.sql#L294344) | 1 / 1 file | 0 / 0 | [Country.cs:273](../../../../UBClasses/Country.cs#L273) |
| `UBCRSClassList` | [L294726](../../../../ScriptDB/000_4_CreateSP.sql#L294726) | — | 1 / 0 | — |
| `UBCurrencyAdd` | [L294763](../../../../ScriptDB/000_4_CreateSP.sql#L294763) | 1 / 1 file | 0 / 0 | [Currency.cs:252](../../../../UBClasses/Currency.cs#L252) |
| `UBCurrencyCodeList` | [L294802](../../../../ScriptDB/000_4_CreateSP.sql#L294802) | — | 16 / 0 | — |
| `UBCurrencyExRateImportUS` | [L294835](../../../../ScriptDB/000_4_CreateSP.sql#L294835) | 1 / 1 file | 0 / 1 | [Currency.cs:615](../../../../UBClasses/Currency.cs#L615) |
| `UBCurrencyExRateInfo` | [L294874](../../../../ScriptDB/000_4_CreateSP.sql#L294874) | 1 / 1 file | 0 / 0 | [PanelExRateAdd.aspx.cs:73](../../../../WebApp/Main/PanelExRateAdd.aspx.cs#L73) |
| `UBCurrencyExRateList` | [L294899](../../../../ScriptDB/000_4_CreateSP.sql#L294899) | 1 / 1 file | 0 / 0 | [Currency.cs:370](../../../../UBClasses/Currency.cs#L370) |
| `UBCurrencyExRateParam` | [L294969](../../../../ScriptDB/000_4_CreateSP.sql#L294969) | 1 / 1 file | 0 / 0 | [Currency.cs:558](../../../../UBClasses/Currency.cs#L558) |
| `UBcurrencyExRateRemove` | [L295038](../../../../ScriptDB/000_4_CreateSP.sql#L295038) | 1 / 1 file | 0 / 1 | [PanelExRateAdd.aspx.cs:285](../../../../WebApp/Main/PanelExRateAdd.aspx.cs#L285) |
| `UBcurrencyExRateUpdate` | [L295074](../../../../ScriptDB/000_4_CreateSP.sql#L295074) | 1 / 1 file | 2 / 1 | [PanelExRateAdd.aspx.cs:173](../../../../WebApp/Main/PanelExRateAdd.aspx.cs#L173) |
| `UBCurrencyList` | [L295130](../../../../ScriptDB/000_4_CreateSP.sql#L295130) | 1 / 1 file | 0 / 0 | [Currency.cs:147](../../../../UBClasses/Currency.cs#L147) |
| `UBCurrencyRemove` | [L295166](../../../../ScriptDB/000_4_CreateSP.sql#L295166) | 1 / 1 file | 0 / 0 | [Currency.cs:313](../../../../UBClasses/Currency.cs#L313) |
| `UBCurrencyUpdate` | [L295200](../../../../ScriptDB/000_4_CreateSP.sql#L295200) | 1 / 1 file | 0 / 0 | [Currency.cs:252](../../../../UBClasses/Currency.cs#L252) |
| `UBDailyMaturityGetCount` | [L295765](../../../../ScriptDB/000_4_CreateSP.sql#L295765) | 1 / 1 file | 0 / 2 | [FundAccount.cs:2432](../../../../UBClasses/FundAccount.cs#L2432) |
| `UBDailyMaturitySet` | [L295825](../../../../ScriptDB/000_4_CreateSP.sql#L295825) | — | 0 / 2 | — |
| `UBDailyMaturityStartupOpt` | [L295990](../../../../ScriptDB/000_4_CreateSP.sql#L295990) | 1 / 1 file | 0 / 0 | [Member.cs:3680](../../../../UBClasses/Member.cs#L3680) |
| `UBDashBoardAssetAccInfo` | [L296144](../../../../ScriptDB/000_4_CreateSP.sql#L296144) | 1 / 1 file | 0 / 0 | [Dashboard.cs:926](../../../../UBClasses/Dashboard.cs#L926) |
| `UBDashBoardAssetAdd` | [L299018](../../../../ScriptDB/000_4_CreateSP.sql#L299018) | 1 / 1 file | 0 / 2 | [Dashboard.cs:37](../../../../UBClasses/Dashboard.cs#L37) |
| `UBDashBoardAssetByDealerCode` | [L299087](../../../../ScriptDB/000_4_CreateSP.sql#L299087) | 1 / 1 file | 0 / 1 | [Dashboard.cs:2509](../../../../UBClasses/Dashboard.cs#L2509) |
| `UBDashBoardAssetByRepCode` | [L299234](../../../../ScriptDB/000_4_CreateSP.sql#L299234) | 1 / 1 file | 0 / 1 | [Dashboard.cs:2330](../../../../UBClasses/Dashboard.cs#L2330) |
| `UBDashBoardAssetByRepCodeAndType` | [L299624](../../../../ScriptDB/000_4_CreateSP.sql#L299624) | 1 / 1 file | 0 / 1 | [Dashboard.cs:2428](../../../../UBClasses/Dashboard.cs#L2428) |
| `UBDashBoardAssetCalc` | [L299822](../../../../ScriptDB/000_4_CreateSP.sql#L299822) | 1 / 1 file | 0 / 2 | [DashBoard.cs:128](../../../../VieFUNDPdf/DashBoard.cs#L128) |
| `UBDashBoardAssetCalc10` | [L299916](../../../../ScriptDB/000_4_CreateSP.sql#L299916) | — | 0 / 1 | — |
| `UBDashBoardAssetCalcEnd` | [L300067](../../../../ScriptDB/000_4_CreateSP.sql#L300067) | 1 / 1 file | 0 / 0 | [DashBoard.cs:143](../../../../VieFUNDPdf/DashBoard.cs#L143) |
| `UBDashBoardAssetGet` | [L300753](../../../../ScriptDB/000_4_CreateSP.sql#L300753) | 1 / 1 file | 0 / 0 | [Dashboard.cs:248](../../../../UBClasses/Dashboard.cs#L248) |
| `UBDashBoardAssetGet_ByProvince` | [L301346](../../../../ScriptDB/000_4_CreateSP.sql#L301346) | — | 0 / 0 | — |
| `UBDashBoardAssetGet_HoldingStats` | [L301762](../../../../ScriptDB/000_4_CreateSP.sql#L301762) | 1 / 1 file | 0 / 0 | [Dashboard.cs:2804](../../../../UBClasses/Dashboard.cs#L2804) |
| `UBDashBoardAssetInfo` | [L303605](../../../../ScriptDB/000_4_CreateSP.sql#L303605) | 1 / 1 file | 0 / 1 | [Dashboard.cs:139](../../../../UBClasses/Dashboard.cs#L139) |
| `UBDashBoardAssetInit` | [L303661](../../../../ScriptDB/000_4_CreateSP.sql#L303661) | 1 / 1 file | 0 / 0 | [DashBoard.cs:177](../../../../VieFUNDPdf/DashBoard.cs#L177) |
| `UBDashBoardAssetList` | [L303725](../../../../ScriptDB/000_4_CreateSP.sql#L303725) | 1 / 1 file | 0 / 1 | [Dashboard.cs:194](../../../../UBClasses/Dashboard.cs#L194) |
| `UBDashBoardAssetProvOneCategoryGet` | [L304771](../../../../ScriptDB/000_4_CreateSP.sql#L304771) | 1 / 1 file | 0 / 0 | [Dashboard.cs:2590](../../../../UBClasses/Dashboard.cs#L2590) |
| `UBDashBoardAssetProvOneCategoryGroupByProdTypeGet` | [L304945](../../../../ScriptDB/000_4_CreateSP.sql#L304945) | 1 / 1 file | 0 / 0 | [Dashboard.cs:2654](../../../../UBClasses/Dashboard.cs#L2654) |
| `UBDashBoardAssetRemove` | [L305018](../../../../ScriptDB/000_4_CreateSP.sql#L305018) | 1 / 1 file | 0 / 0 | [Dashboard.cs:92](../../../../UBClasses/Dashboard.cs#L92) |
| `UBDashBoardAssetSystemStep1` | [L305082](../../../../ScriptDB/000_4_CreateSP.sql#L305082) | — | 0 / 0 | — |
| `UBDashBoardAssetSystemStep2` | [L305223](../../../../ScriptDB/000_4_CreateSP.sql#L305223) | — | 1 / 2 | — |
| `UBDashBoardAssetSystemStep3` | [L305379](../../../../ScriptDB/000_4_CreateSP.sql#L305379) | — | 0 / 1 | — |
| `UBDealerBranchAdd` | [L308395](../../../../ScriptDB/000_4_CreateSP.sql#L308395) | 1 / 1 file | 3 / 2 | [DealerBranch.cs:421](../../../../UBClasses/DealerBranch.cs#L421) |
| `UBDealerBranchGet` | [L308455](../../../../ScriptDB/000_4_CreateSP.sql#L308455) | — | 24 / 2 | — |
| `UBDealerBranchList` | [L308505](../../../../ScriptDB/000_4_CreateSP.sql#L308505) | 2 / 1 file | 0 / 1 | [DealerBranch.cs:251](../../../../UBClasses/DealerBranch.cs#L251) |
| `UBDealerBranchRemove` | [L308645](../../../../ScriptDB/000_4_CreateSP.sql#L308645) | 1 / 1 file | 0 / 0 | [DealerBranch.cs:504](../../../../UBClasses/DealerBranch.cs#L504) |
| `UBDealerBranchUpdate` | [L308705](../../../../ScriptDB/000_4_CreateSP.sql#L308705) | 1 / 1 file | 0 / 4 | [DealerBranch.cs:421](../../../../UBClasses/DealerBranch.cs#L421) |
| `UBDealerCodeFromList` | [L308783](../../../../ScriptDB/000_4_CreateSP.sql#L308783) | 1 / 1 file | 1 / 0 | [Dealer.cs:467](../../../../UBClasses/Dealer.cs#L467) |
| `UBDealerCodeInfo` | [L308835](../../../../ScriptDB/000_4_CreateSP.sql#L308835) | 1 / 1 file | 0 / 1 | [Dealer.cs:524](../../../../UBClasses/Dealer.cs#L524) |
| `UBDealerCodeInfoX` | [L308940](../../../../ScriptDB/000_4_CreateSP.sql#L308940) | 1 / 1 file | 0 / 0 | [Dealer.cs:568](../../../../UBClasses/Dealer.cs#L568) |
| `UBDealerCodeList` | [L308968](../../../../ScriptDB/000_4_CreateSP.sql#L308968) | — | 24 / 0 | — |
| `UBDealerCodeList4Conf` | [L309071](../../../../ScriptDB/000_4_CreateSP.sql#L309071) | — | 1 / 0 | — |
| `UBDealerCodeList4QFix` | [L309112](../../../../ScriptDB/000_4_CreateSP.sql#L309112) | — | 3 / 0 | — |
| `UBDealerCodeListCarrying` | [L309142](../../../../ScriptDB/000_4_CreateSP.sql#L309142) | — | 0 / 0 | — |
| `UBDealerCodeListN` | [L309166](../../../../ScriptDB/000_4_CreateSP.sql#L309166) | — | 1 / 0 | — |
| `UBDealerCodeListNominee` | [L309198](../../../../ScriptDB/000_4_CreateSP.sql#L309198) | — | 7 / 0 | — |
| `UBDealerCodeListNominee4Report` | [L309222](../../../../ScriptDB/000_4_CreateSP.sql#L309222) | — | 3 / 1 | — |
| `UBDealerCodeRemove` | [L309258](../../../../ScriptDB/000_4_CreateSP.sql#L309258) | 1 / 1 file | 0 / 0 | [PanelDealerCodeAdd.aspx.cs:558](../../../../WebApp/Main/PanelDealerCodeAdd.aspx.cs#L558) |
| `UBDealerCodeRT` | [L309300](../../../../ScriptDB/000_4_CreateSP.sql#L309300) | — | 2 / 0 | — |
| `UBDealerCodeUpdate` | [L309358](../../../../ScriptDB/000_4_CreateSP.sql#L309358) | 1 / 1 file | 2 / 5 | [PanelDealerCodeAdd.aspx.cs:377](../../../../WebApp/Main/PanelDealerCodeAdd.aspx.cs#L377) |
| `UBDealerHOInfo` | [L309701](../../../../ScriptDB/000_4_CreateSP.sql#L309701) | 1 / 1 file | 0 / 3 | [Dealer.cs:176](../../../../UBClasses/Dealer.cs#L176) |
| `UBDealerHOUpdate` | [L309863](../../../../ScriptDB/000_4_CreateSP.sql#L309863) | 1 / 1 file | 0 / 5 | [Dealer.cs:85](../../../../UBClasses/Dealer.cs#L85) |
| `UBDealerInfo1` | [L309936](../../../../ScriptDB/000_4_CreateSP.sql#L309936) | — | 5 / 0 | — |
| `UBDealerIsNewRegistrationEnable` | [L309968](../../../../ScriptDB/000_4_CreateSP.sql#L309968) | 1 / 1 file | 0 / 0 | [Dealer.cs:33](../../../../UBClasses/Dealer.cs#L33) |
| `UBDealerRegionAdd` | [L309990](../../../../ScriptDB/000_4_CreateSP.sql#L309990) | 1 / 1 file | 0 / 0 | [Region.cs:186](../../../../UBClasses/Region.cs#L186) |
| `UBDealerRegionList` | [L310033](../../../../ScriptDB/000_4_CreateSP.sql#L310033) | 1 / 1 file | 0 / 0 | [Region.cs:88](../../../../UBClasses/Region.cs#L88) |
| `UBDealerRegionRemove` | [L310068](../../../../ScriptDB/000_4_CreateSP.sql#L310068) | 1 / 1 file | 0 / 0 | [Region.cs:245](../../../../UBClasses/Region.cs#L245) |
| `UBDealerRegionUpdate` | [L310113](../../../../ScriptDB/000_4_CreateSP.sql#L310113) | 1 / 1 file | 0 / 0 | [Region.cs:186](../../../../UBClasses/Region.cs#L186) |
| `UBDealershipInfo` | [L310157](../../../../ScriptDB/000_4_CreateSP.sql#L310157) | — | 66 / 2 | — |
| `UBDealershipInfoGetInt` | [L310223](../../../../ScriptDB/000_4_CreateSP.sql#L310223) | 1 / 1 file | 0 / 0 | [CBase.cs:1279](../../../../UBClasses/CBase.cs#L1279) |
| `UBDealershipInfoSaveInt` | [L310246](../../../../ScriptDB/000_4_CreateSP.sql#L310246) | 1 / 1 file | 0 / 0 | [CBase.cs:1320](../../../../UBClasses/CBase.cs#L1320) |
| `UBDealershipInfoX` | [L310268](../../../../ScriptDB/000_4_CreateSP.sql#L310268) | — | 23 / 2 | — |
| `UBDealerStatsList` | [L310353](../../../../ScriptDB/000_4_CreateSP.sql#L310353) | — | 0 / 0 | — |
| `UBDealerSubBranchAdd` | [L310416](../../../../ScriptDB/000_4_CreateSP.sql#L310416) | 1 / 1 file | 0 / 2 | [DealerSubBranch.cs:278](../../../../UBClasses/DealerSubBranch.cs#L278) |
| `UBDealerSubBranchList` | [L310471](../../../../ScriptDB/000_4_CreateSP.sql#L310471) | 1 / 1 file | 0 / 0 | [DealerSubBranch.cs:164](../../../../UBClasses/DealerSubBranch.cs#L164) |
| `UBDealerSubBranchRemove` | [L310542](../../../../ScriptDB/000_4_CreateSP.sql#L310542) | 1 / 1 file | 0 / 0 | [DealerSubBranch.cs:350](../../../../UBClasses/DealerSubBranch.cs#L350) |
| `UBDealerSubBranchUpdate` | [L310590](../../../../ScriptDB/000_4_CreateSP.sql#L310590) | 1 / 1 file | 0 / 4 | [DealerSubBranch.cs:278](../../../../UBClasses/DealerSubBranch.cs#L278) |
| `UBDepositTypeList` | [L310815](../../../../ScriptDB/000_4_CreateSP.sql#L310815) | — | 2 / 0 | — |
| `UBDisclaimerAdd` | [L310847](../../../../ScriptDB/000_4_CreateSP.sql#L310847) | — | 0 / 1 | — |
| `UBDisclaimerInfo` | [L310996](../../../../ScriptDB/000_4_CreateSP.sql#L310996) | 1 / 1 file | 0 / 0 | [Disclaimer.cs:94](../../../../UBClasses/Disclaimer.cs#L94) |
| `UBDisclaimerList` | [L311035](../../../../ScriptDB/000_4_CreateSP.sql#L311035) | 1 / 1 file | 0 / 0 | [Disclaimer.cs:41](../../../../UBClasses/Disclaimer.cs#L41) |
| `UBDisclaimerMove` | [L311125](../../../../ScriptDB/000_4_CreateSP.sql#L311125) | — | 0 / 0 | — |
| `UBDisclaimerRemove` | [L311173](../../../../ScriptDB/000_4_CreateSP.sql#L311173) | — | 0 / 0 | — |
| `UBDisclaimerSetDealerStr` | [L311195](../../../../ScriptDB/000_4_CreateSP.sql#L311195) | — | 2 / 0 | — |
| `UBDisclaimerTargetTypeList` | [L311217](../../../../ScriptDB/000_4_CreateSP.sql#L311217) | — | 1 / 0 | — |
| `UBDisclaimerUpdate` | [L311251](../../../../ScriptDB/000_4_CreateSP.sql#L311251) | — | 0 / 1 | — |
| `UBDividendList` | [L311346](../../../../ScriptDB/000_4_CreateSP.sql#L311346) | — | 2 / 0 | — |
| `UBDSIDList` | [L314829](../../../../ScriptDB/000_4_CreateSP.sql#L314829) | 1 / 1 file | 0 / 0 | [CDatabase.cs:1763](../../../../UBConnection/CDatabase.cs#L1763) |
| `UBEasyServParams` | [L314853](../../../../ScriptDB/000_4_CreateSP.sql#L314853) | — | 0 / 0 | — |
| `UBEFTFileEnd` | [L315156](../../../../ScriptDB/000_4_CreateSP.sql#L315156) | 1 / 1 file | 0 / 0 | [TrustAccount.cs:3709](../../../../UBClasses/TrustAccount.cs#L3709) |
| `UBEFTFileInfo` | [L315180](../../../../ScriptDB/000_4_CreateSP.sql#L315180) | 1 / 1 file | 0 / 0 | [TrustAccount.cs:3389](../../../../UBClasses/TrustAccount.cs#L3389) |
| `UBEFTGenerateSet` | [L315203](../../../../ScriptDB/000_4_CreateSP.sql#L315203) | — | 0 / 0 | — |
| `UBEFTGetID4Mgmt` | [L315326](../../../../ScriptDB/000_4_CreateSP.sql#L315326) | — | 1 / 0 | — |
| `UBEFTItemAdd` | [L315405](../../../../ScriptDB/000_4_CreateSP.sql#L315405) | — | 20 / 0 | — |
| `UBEFTItemRefreshPending` | [L315474](../../../../ScriptDB/000_4_CreateSP.sql#L315474) | — | 1 / 1 | — |
| `UBEFTItemRemove` | [L315525](../../../../ScriptDB/000_4_CreateSP.sql#L315525) | 1 / 1 file | 2 / 1 | [TrustAccount.cs:3501](../../../../UBClasses/TrustAccount.cs#L3501) |
| `UBEFTItemRestore` | [L315581](../../../../ScriptDB/000_4_CreateSP.sql#L315581) | — | 0 / 0 | — |
| `UBEFTItemUpdate` | [L315642](../../../../ScriptDB/000_4_CreateSP.sql#L315642) | — | 2 / 0 | — |
| `UBEFTItemVoidRejected` | [L315674](../../../../ScriptDB/000_4_CreateSP.sql#L315674) | — | 0 / 1 | — |
| `UBEFTListTotal` | [L315707](../../../../ScriptDB/000_4_CreateSP.sql#L315707) | — | 1 / 0 | — |
| `UBEFTProcessTaggedItems` | [L315747](../../../../ScriptDB/000_4_CreateSP.sql#L315747) | 1 / 1 file | 0 / 0 | [TrustAccount.cs:3610](../../../../UBClasses/TrustAccount.cs#L3610) |
| `UBEFTReminderAdd` | [L315920](../../../../ScriptDB/000_4_CreateSP.sql#L315920) | — | 1 / 0 | — |
| `UBEFTReminderHeaderInfo` | [L315974](../../../../ScriptDB/000_4_CreateSP.sql#L315974) | 1 / 1 file | 0 / 0 | [TrustAccount.cs:4209](../../../../UBClasses/TrustAccount.cs#L4209) |
| `UBEFTReminderItemList` | [L315996](../../../../ScriptDB/000_4_CreateSP.sql#L315996) | 1 / 1 file | 0 / 0 | [TrustAccount.cs:4157](../../../../UBClasses/TrustAccount.cs#L4157) |
| `UBEFTReminderList` | [L316026](../../../../ScriptDB/000_4_CreateSP.sql#L316026) | 1 / 1 file | 0 / 0 | [TrustAccount.cs:4061](../../../../UBClasses/TrustAccount.cs#L4061) |
| `UBEFTReminderRemove` | [L316213](../../../../ScriptDB/000_4_CreateSP.sql#L316213) | — | 1 / 0 | — |
| `UBEFTReminderRemove1Header` | [L316247](../../../../ScriptDB/000_4_CreateSP.sql#L316247) | 1 / 1 file | 0 / 0 | [TrustAccount.cs:4410](../../../../UBClasses/TrustAccount.cs#L4410) |
| `UBEFTReminderRemoveOne` | [L316264](../../../../ScriptDB/000_4_CreateSP.sql#L316264) | 1 / 1 file | 1 / 0 | [TrustAccount.cs:4368](../../../../UBClasses/TrustAccount.cs#L4368) |
| `UBEFTRemove` | [L316295](../../../../ScriptDB/000_4_CreateSP.sql#L316295) | 1 / 1 file | 0 / 0 | [TrustAccount.cs:3555](../../../../UBClasses/TrustAccount.cs#L3555) |
| `UBEFTTypeList` | [L316317](../../../../ScriptDB/000_4_CreateSP.sql#L316317) | — | 1 / 0 | — |
| `UBEFTViewDetailSet` | [L316343](../../../../ScriptDB/000_4_CreateSP.sql#L316343) | 1 / 1 file | 0 / 1 | [TrustAccount.cs:3443](../../../../UBClasses/TrustAccount.cs#L3443) |
| `UBEFTViewHeaderSet` | [L316734](../../../../ScriptDB/000_4_CreateSP.sql#L316734) | 1 / 1 file | 0 / 0 | [TrustAccount.cs:3330](../../../../UBClasses/TrustAccount.cs#L3330) |
| `UBEMDQualifierList` | [L318135](../../../../ScriptDB/000_4_CreateSP.sql#L318135) | — | 2 / 0 | — |
| `UBEmpSectorList` | [L318162](../../../../ScriptDB/000_4_CreateSP.sql#L318162) | 1 / 1 file | 1 / 0 | [Company.cs:82](../../../../UBClasses/Company.cs#L82) |
| `UBEmpTypeList` | [L318188](../../../../ScriptDB/000_4_CreateSP.sql#L318188) | — | 2 / 0 | — |
| `UBEnvAddObj2Env` | [L318207](../../../../ScriptDB/000_4_CreateSP.sql#L318207) | 1 / 1 file | 0 / 3 | [Document.cs:4738](../../../../UBClasses/Document.cs#L4738) |
| `UBEnvelopeAdd` | [L318346](../../../../ScriptDB/000_4_CreateSP.sql#L318346) | — | 2 / 0 | — |
| `UBEnvelopeAddInitial` | [L318375](../../../../ScriptDB/000_4_CreateSP.sql#L318375) | — | 2 / 0 | — |
| `UBEnvelopeAddSigPos` | [L318406](../../../../ScriptDB/000_4_CreateSP.sql#L318406) | 1 / 1 file | 0 / 0 | [Document.cs:4676](../../../../UBClasses/Document.cs#L4676) |
| `UBEnvelopeCheckStatusOne` | [L318431](../../../../ScriptDB/000_4_CreateSP.sql#L318431) | — | 0 / 1 | — |
| `UBEnvelopeCheckUpdateFlag` | [L318449](../../../../ScriptDB/000_4_CreateSP.sql#L318449) | — | 0 / 0 | — |
| `UBEnvelopeInfo` | [L318691](../../../../ScriptDB/000_4_CreateSP.sql#L318691) | 4 / 3 file | 0 / 2 | [ESignature.cs:557](../../../../UBClasses/ESignature.cs#L557) |
| `UBEnvelopeInfoX` | [L318901](../../../../ScriptDB/000_4_CreateSP.sql#L318901) | 1 / 1 file | 0 / 6 | [Forms.cs:1571](../../../../UBClasses/Forms.cs#L1571) |
| `UBEnvelopeInfoXForOneSpan` | [L319170](../../../../ScriptDB/000_4_CreateSP.sql#L319170) | 1 / 1 file | 0 / 5 | [Forms.cs:1635](../../../../UBClasses/Forms.cs#L1635) |
| `UBEnvelopeList` | [L319411](../../../../ScriptDB/000_4_CreateSP.sql#L319411) | 2 / 2 file | 0 / 1 | [Document.cs:3886](../../../../UBClasses/Document.cs#L3886) |
| `UBEnvelopeListNonComplete` | [L319799](../../../../ScriptDB/000_4_CreateSP.sql#L319799) | — | 0 / 1 | — |
| `UBEnvelopeListNonCompleteSignority` | [L319869](../../../../ScriptDB/000_4_CreateSP.sql#L319869) | 2 / 2 file | 0 / 0 | [ESignature.cs:738](../../../../UBClasses/ESignature.cs#L738) |
| `UBEnvelopeListSummary` | [L319963](../../../../ScriptDB/000_4_CreateSP.sql#L319963) | 1 / 1 file | 0 / 1 | [ESignature.cs:981](../../../../UBConnection/ESignature.cs#L981) |
| `UBEnvelopeRecipientAdd` | [L320500](../../../../ScriptDB/000_4_CreateSP.sql#L320500) | — | 4 / 0 | — |
| `UBEnvelopeRecipientInfoRefresh` | [L320525](../../../../ScriptDB/000_4_CreateSP.sql#L320525) | — | 4 / 0 | — |
| `UBEnvelopeRecipientLink` | [L320570](../../../../ScriptDB/000_4_CreateSP.sql#L320570) | — | 2 / 0 | — |
| `UBEnvelopeRecipientSignority2FaUpdate` | [L320652](../../../../ScriptDB/000_4_CreateSP.sql#L320652) | — | 2 / 0 | — |
| `UBEnvelopeRecipientStatusUpdate` | [L320672](../../../../ScriptDB/000_4_CreateSP.sql#L320672) | 1 / 1 file | 0 / 0 | [Document.cs:4047](../../../../UBClasses/Document.cs#L4047) |
| `UBEnvelopeSelectionUpdate` | [L320719](../../../../ScriptDB/000_4_CreateSP.sql#L320719) | — | 0 / 0 | — |
| `UBEnvelopeSenderVerify` | [L320760](../../../../ScriptDB/000_4_CreateSP.sql#L320760) | — | 2 / 0 | — |
| `UBEnvelopeSetEnvID` | [L320867](../../../../ScriptDB/000_4_CreateSP.sql#L320867) | 1 / 1 file | 0 / 0 | [Forms.cs:1413](../../../../UBClasses/Forms.cs#L1413) |
| `UBEnvelopeSetErrorStatus` | [L320892](../../../../ScriptDB/000_4_CreateSP.sql#L320892) | 2 / 2 file | 0 / 0 | [ESignature.cs:697](../../../../UBClasses/ESignature.cs#L697) |
| `UBEnvelopeSetStatus` | [L320912](../../../../ScriptDB/000_4_CreateSP.sql#L320912) | 1 / 1 file | 2 / 3 | [Forms.cs:1738](../../../../UBClasses/Forms.cs#L1738) |
| `UBEnvelopeSetUpdateFlag` | [L321026](../../../../ScriptDB/000_4_CreateSP.sql#L321026) | 2 / 2 file | 0 / 0 | [ESignature.cs:785](../../../../UBClasses/ESignature.cs#L785) |
| `UBEnvelopeSetVoid` | [L321048](../../../../ScriptDB/000_4_CreateSP.sql#L321048) | 1 / 1 file | 0 / 0 | [Forms.cs:1783](../../../../UBClasses/Forms.cs#L1783) |
| `UBEnvelopeStatusList` | [L321071](../../../../ScriptDB/000_4_CreateSP.sql#L321071) | — | 1 / 0 | — |
| `UBEnvelopeTaggedCount` | [L321097](../../../../ScriptDB/000_4_CreateSP.sql#L321097) | 1 / 1 file | 0 / 0 | [Document.cs:4263](../../../../UBClasses/Document.cs#L4263) |
| `UBEnvelopeVerifyRecipient` | [L321113](../../../../ScriptDB/000_4_CreateSP.sql#L321113) | — | 1 / 0 | — |
| `UBErrorLogAdd` | [L321130](../../../../ScriptDB/000_4_CreateSP.sql#L321130) | — | 1 / 0 | — |
| `UBEventLogAdd` | [L322363](../../../../ScriptDB/000_4_CreateSP.sql#L322363) | 1 / 1 file | 0 / 0 | [CDatabase.cs:1634](../../../../UBConnection/CDatabase.cs#L1634) |
| `UBExceptionComboList` | [L322395](../../../../ScriptDB/000_4_CreateSP.sql#L322395) | — | 0 / 3 | — |
| `UBExceptionComboListRep` | [L322422](../../../../ScriptDB/000_4_CreateSP.sql#L322422) | — | 0 / 3 | — |
| `UBExceptionReportTypeList` | [L322448](../../../../ScriptDB/000_4_CreateSP.sql#L322448) | — | 2 / 0 | — |
| `UBExport100Process` | [L322471](../../../../ScriptDB/000_4_CreateSP.sql#L322471) | — | 0 / 1 | — |
| `UBExport100ProcessOne` | [L322496](../../../../ScriptDB/000_4_CreateSP.sql#L322496) | — | 1 / 1 | — |
| `UBExportAddRequest` | [L322576](../../../../ScriptDB/000_4_CreateSP.sql#L322576) | 1 / 1 file | 0 / 1 | [Export.cs:39](../../../../UBClasses/Export.cs#L39) |
| `UBExportAddRequestT` | [L322702](../../../../ScriptDB/000_4_CreateSP.sql#L322702) | — | 1 / 1 | — |
| `UBExportComboList` | [L323818](../../../../ScriptDB/000_4_CreateSP.sql#L323818) | — | 0 / 5 | — |
| `UBExportGet` | [L323875](../../../../ScriptDB/000_4_CreateSP.sql#L323875) | — | 0 / 33 | — |
| `UBExportInfo` | [L325268](../../../../ScriptDB/000_4_CreateSP.sql#L325268) | — | 0 / 1 | — |
| `UBExportionReportTypeList` | [L325313](../../../../ScriptDB/000_4_CreateSP.sql#L325313) | — | 1 / 0 | — |
| `UBExportJFDGet` | [L325338](../../../../ScriptDB/000_4_CreateSP.sql#L325338) | — | 0 / 1 | — |
| `UBExportJFDSet` | [L325478](../../../../ScriptDB/000_4_CreateSP.sql#L325478) | — | 0 / 0 | — |
| `UBExportList` | [L325503](../../../../ScriptDB/000_4_CreateSP.sql#L325503) | — | 0 / 1 | — |
| `UBExportRemove` | [L325577](../../../../ScriptDB/000_4_CreateSP.sql#L325577) | — | 1 / 0 | — |
| `UBExportSet` | [L325885](../../../../ScriptDB/000_4_CreateSP.sql#L325885) | — | 0 / 0 | — |
| `UBExportSet100` | [L326026](../../../../ScriptDB/000_4_CreateSP.sql#L326026) | — | 1 / 0 | — |
| `UBFATDeleteEntity` | [L329177](../../../../ScriptDB/000_4_CreateSP.sql#L329177) | — | 0 / 0 | — |
| `UBFDFileAdd` | [L329203](../../../../ScriptDB/000_4_CreateSP.sql#L329203) | 1 / 1 file | 0 / 0 | [Fundata.cs:1037](../../../../UBClasses/Fundata.cs#L1037) |
| `UBFDFileDef` | [L329248](../../../../ScriptDB/000_4_CreateSP.sql#L329248) | — | 0 / 0 | — |
| `UBFDFileDetailItem` | [L329273](../../../../ScriptDB/000_4_CreateSP.sql#L329273) | 1 / 1 file | 0 / 0 | [Fundata.cs:1377](../../../../UBClasses/Fundata.cs#L1377) |
| `UBFDFileDetailList` | [L329345](../../../../ScriptDB/000_4_CreateSP.sql#L329345) | 1 / 1 file | 0 / 0 | [Fundata.cs:1429](../../../../UBClasses/Fundata.cs#L1429) |
| `UBFDFileGet` | [L329497](../../../../ScriptDB/000_4_CreateSP.sql#L329497) | 1 / 1 file | 0 / 0 | [Fundata.cs:1088](../../../../UBClasses/Fundata.cs#L1088) |
| `UBFDFileList` | [L329539](../../../../ScriptDB/000_4_CreateSP.sql#L329539) | 1 / 1 file | 0 / 0 | [Fundata.cs:1320](../../../../UBClasses/Fundata.cs#L1320) |
| `UBFDFileSetStatus` | [L329599](../../../../ScriptDB/000_4_CreateSP.sql#L329599) | — | 0 / 0 | — |
| `UBFDGetSetting` | [L329625](../../../../ScriptDB/000_4_CreateSP.sql#L329625) | — | 0 / 0 | — |
| `UBFDProcessAll` | [L329672](../../../../ScriptDB/000_4_CreateSP.sql#L329672) | — | 0 / 1 | — |
| `UBFDProcesslItem_TBD` | [L329772](../../../../ScriptDB/000_4_CreateSP.sql#L329772) | — | 0 / 0 | — |
| `UBFDProcessOneiItem` | [L329834](../../../../ScriptDB/000_4_CreateSP.sql#L329834) | — | 1 / 2 | — |
| `UBFDRecordAdd` | [L330035](../../../../ScriptDB/000_4_CreateSP.sql#L330035) | — | 0 / 1 | — |
| `UBFDSaveSetting` | [L330130](../../../../ScriptDB/000_4_CreateSP.sql#L330130) | 1 / 1 file | 0 / 0 | [Fundata.cs:1499](../../../../UBClasses/Fundata.cs#L1499) |
| `UBFEInit` | [L341976](../../../../ScriptDB/000_4_CreateSP.sql#L341976) | — | 1 / 1 | — |
| `UBFEInit_AGCH` | [L342156](../../../../ScriptDB/000_4_CreateSP.sql#L342156) | — | 1 / 0 | — |
| `UBFEInit_AGRP` | [L342192](../../../../ScriptDB/000_4_CreateSP.sql#L342192) | — | 1 / 1 | — |
| `UBFF_Add` | [L342427](../../../../ScriptDB/000_4_CreateSP.sql#L342427) | 1 / 1 file | 0 / 0 | [FFImport.cs:2021](../../../../UBFFImport/FFImport.cs#L2021) |
| `UBFF_End` | [L342469](../../../../ScriptDB/000_4_CreateSP.sql#L342469) | 1 / 1 file | 0 / 0 | [FFImport.cs:2068](../../../../UBFFImport/FFImport.cs#L2068) |
| `UBFFRecAAInsert` | [L342504](../../../../ScriptDB/000_4_CreateSP.sql#L342504) | — | 0 / 0 | — |
| `UBFFRecAAInsertEnd` | [L342651](../../../../ScriptDB/000_4_CreateSP.sql#L342651) | — | 0 / 0 | — |
| `UBFFRecAAProcess` | [L342664](../../../../ScriptDB/000_4_CreateSP.sql#L342664) | 1 / 1 file | 0 / 1 | [CAA.cs:2607](../../../../UBFFImport/CAA.cs#L2607) |
| `UBFFRecAAProcessOneRecord` | [L342713](../../../../ScriptDB/000_4_CreateSP.sql#L342713) | — | 1 / 17 | — |
| `UBFFRecAEInsert` | [L343595](../../../../ScriptDB/000_4_CreateSP.sql#L343595) | — | 0 / 0 | — |
| `UBFFRecAEInsertEnd` | [L343672](../../../../ScriptDB/000_4_CreateSP.sql#L343672) | — | 0 / 0 | — |
| `UBFFRecAEProcess` | [L343697](../../../../ScriptDB/000_4_CreateSP.sql#L343697) | 1 / 1 file | 0 / 1 | [CAE.cs:158](../../../../UBFFImport/CAE.cs#L158) |
| `UBFFRecAEProcessOnePosition` | [L344029](../../../../ScriptDB/000_4_CreateSP.sql#L344029) | — | 1 / 0 | — |
| `UBFFRecAEProcessOneRecord` | [L344163](../../../../ScriptDB/000_4_CreateSP.sql#L344163) | — | 1 / 2 | — |
| `UBFFRecAFInsert` | [L344251](../../../../ScriptDB/000_4_CreateSP.sql#L344251) | — | 0 / 0 | — |
| `UBFFRecAPProcessOneRecord` | [L344298](../../../../ScriptDB/000_4_CreateSP.sql#L344298) | 1 / 1 file | 0 / 0 | [CAP.cs:163](../../../../UBFFImport/CAP.cs#L163) |
| `UBFFRecASFNDInsert` | [L344496](../../../../ScriptDB/000_4_CreateSP.sql#L344496) | — | 0 / 0 | — |
| `UBFFRecASFNDInsertEnd` | [L344580](../../../../ScriptDB/000_4_CreateSP.sql#L344580) | — | 0 / 0 | — |
| `UBFFRecASFNDProcess` | [L344593](../../../../ScriptDB/000_4_CreateSP.sql#L344593) | — | 0 / 1 | — |
| `UBFFRecASFNDProcessOneRecord` | [L344642](../../../../ScriptDB/000_4_CreateSP.sql#L344642) | — | 1 / 1 | — |
| `UBFFRecASInsert` | [L344765](../../../../ScriptDB/000_4_CreateSP.sql#L344765) | — | 0 / 0 | — |
| `UBFFRecASInsertEnd` | [L344847](../../../../ScriptDB/000_4_CreateSP.sql#L344847) | — | 0 / 0 | — |
| `UBFFRecASProcess` | [L344860](../../../../ScriptDB/000_4_CreateSP.sql#L344860) | 1 / 1 file | 0 / 1 | [CAS.cs:226](../../../../UBFFImport/CAS.cs#L226) |
| `UBFFRecASProcessOneRecord` | [L344909](../../../../ScriptDB/000_4_CreateSP.sql#L344909) | — | 1 / 2 | — |
| `UBFFRecATInsert` | [L345046](../../../../ScriptDB/000_4_CreateSP.sql#L345046) | — | 0 / 0 | — |
| `UBFFRecATInsertEnd` | [L345204](../../../../ScriptDB/000_4_CreateSP.sql#L345204) | — | 0 / 0 | — |
| `UBFFRecATProcess` | [L345228](../../../../ScriptDB/000_4_CreateSP.sql#L345228) | 1 / 1 file | 0 / 1 | [CAT.cs:229](../../../../UBFFImport/CAT.cs#L229) |
| `UBFFRecATProcessOneRecord` | [L345502](../../../../ScriptDB/000_4_CreateSP.sql#L345502) | — | 3 / 10 | — |
| `UBFFRecAWGetHeader` | [L346658](../../../../ScriptDB/000_4_CreateSP.sql#L346658) | — | 2 / 0 | — |
| `UBFFRecAWInsert` | [L346719](../../../../ScriptDB/000_4_CreateSP.sql#L346719) | — | 0 / 0 | — |
| `UBFFRecAWInsertEnd` | [L346837](../../../../ScriptDB/000_4_CreateSP.sql#L346837) | — | 0 / 0 | — |
| `UBFFRecAWProcess` | [L346850](../../../../ScriptDB/000_4_CreateSP.sql#L346850) | 1 / 1 file | 0 / 1 | [CAW.cs:170](../../../../UBFFImport/CAW.cs#L170) |
| `UBFFRecAWProcessOneRecord` | [L346899](../../../../ScriptDB/000_4_CreateSP.sql#L346899) | — | 1 / 2 | — |
| `UBFFRecDefAA` | [L347162](../../../../ScriptDB/000_4_CreateSP.sql#L347162) | — | 0 / 0 | — |
| `UBFFRecDefAE` | [L347189](../../../../ScriptDB/000_4_CreateSP.sql#L347189) | — | 0 / 0 | — |
| `UBFFRecDefAP` | [L347216](../../../../ScriptDB/000_4_CreateSP.sql#L347216) | — | 0 / 0 | — |
| `UBFFRecDefAS` | [L347243](../../../../ScriptDB/000_4_CreateSP.sql#L347243) | — | 0 / 0 | — |
| `UBFFRecDefAT` | [L347281](../../../../ScriptDB/000_4_CreateSP.sql#L347281) | — | 0 / 0 | — |
| `UBFFRecDefAW` | [L347313](../../../../ScriptDB/000_4_CreateSP.sql#L347313) | — | 0 / 0 | — |
| `UBFFRecDefFE` | [L347340](../../../../ScriptDB/000_4_CreateSP.sql#L347340) | — | 0 / 0 | — |
| `UBFFRecDefFF` | [L347367](../../../../ScriptDB/000_4_CreateSP.sql#L347367) | — | 0 / 0 | — |
| `UBFFRecDefFG` | [L347395](../../../../ScriptDB/000_4_CreateSP.sql#L347395) | — | 0 / 0 | — |
| `UBFFRecDefSCAcct` | [L347422](../../../../ScriptDB/000_4_CreateSP.sql#L347422) | — | 0 / 0 | — |
| `UBFFRecFEInsert` | [L347476](../../../../ScriptDB/000_4_CreateSP.sql#L347476) | — | 0 / 0 | — |
| `UBFFRecFEInsertEnd` | [L347735](../../../../ScriptDB/000_4_CreateSP.sql#L347735) | — | 0 / 0 | — |
| `UBFFRecFEProcess` | [L347759](../../../../ScriptDB/000_4_CreateSP.sql#L347759) | 1 / 1 file | 0 / 1 | [CFE.cs:159](../../../../UBFFImport/CFE.cs#L159) |
| `UBFFRecFEProcessOneRecord` | [L347806](../../../../ScriptDB/000_4_CreateSP.sql#L347806) | — | 3 / 8 | — |
| `UBFFRecFFInsert` | [L349113](../../../../ScriptDB/000_4_CreateSP.sql#L349113) | — | 0 / 0 | — |
| `UBFFRecFFInsertEnd` | [L349160](../../../../ScriptDB/000_4_CreateSP.sql#L349160) | — | 0 / 0 | — |
| `UBFFRecFFProcess` | [L349173](../../../../ScriptDB/000_4_CreateSP.sql#L349173) | 2 / 2 file | 0 / 1 | [CFF.cs:160](../../../../UBFFImport/CFF.cs#L160) |
| `UBFFRecFFProcessOneRecord` | [L349221](../../../../ScriptDB/000_4_CreateSP.sql#L349221) | — | 1 / 1 | — |
| `UBFFRecFGInsert` | [L349329](../../../../ScriptDB/000_4_CreateSP.sql#L349329) | — | 0 / 0 | — |
| `UBFFRecFGInsertEnd` | [L349540](../../../../ScriptDB/000_4_CreateSP.sql#L349540) | — | 0 / 0 | — |
| `UBFFRecFGProcess` | [L349553](../../../../ScriptDB/000_4_CreateSP.sql#L349553) | 1 / 1 file | 0 / 1 | [CFG.cs:160](../../../../UBFFImport/CFG.cs#L160) |
| `UBFFRecFGProcessOneRecord` | [L349617](../../../../ScriptDB/000_4_CreateSP.sql#L349617) | — | 1 / 10 | — |
| `UBFFRecInsert` | [L350596](../../../../ScriptDB/000_4_CreateSP.sql#L350596) | 1 / 1 file | 0 / 0 | [FFImport.cs:3715](../../../../UBFFImport/FFImport.cs#L3715) |
| `UBFFRecSCAcctInsert` | [L350614](../../../../ScriptDB/000_4_CreateSP.sql#L350614) | — | 0 / 0 | — |
| `UBFFRecSCAcctInsertEnd` | [L350676](../../../../ScriptDB/000_4_CreateSP.sql#L350676) | — | 0 / 0 | — |
| `UBFindDuplicatePosition` | [L351156](../../../../ScriptDB/000_4_CreateSP.sql#L351156) | — | 0 / 0 | — |
| `UBFindInactivePositionWithUnit` | [L351206](../../../../ScriptDB/000_4_CreateSP.sql#L351206) | — | 0 / 0 | — |
| `UBFQRFileAddFromTaggedFiles` | [L359069](../../../../ScriptDB/000_4_CreateSP.sql#L359069) | 1 / 1 file | 0 / 1 | [FQR.cs:180](../../../../UBExport/FQR.cs#L180) |
| `UBFQRFileAddOne` | [L359177](../../../../ScriptDB/000_4_CreateSP.sql#L359177) | — | 0 / 0 | — |
| `UBFQRMonthList` | [L359228](../../../../ScriptDB/000_4_CreateSP.sql#L359228) | — | 1 / 0 | — |
| `UBFQRResult` | [L359507](../../../../ScriptDB/000_4_CreateSP.sql#L359507) | 2 / 2 file | 0 / 0 | [Commission.cs:43](../../../../UBExport/Commission.cs#L43) |
| `UBFQRTagFileInfo` | [L360050](../../../../ScriptDB/000_4_CreateSP.sql#L360050) | 1 / 1 file | 0 / 0 | [FQR.cs:1081](../../../../UBExport/FQR.cs#L1081) |
| `UBFrequencyList` | [L360105](../../../../ScriptDB/000_4_CreateSP.sql#L360105) | — | 10 / 0 | — |
| `UBFSErrorAdd` | [L360503](../../../../ScriptDB/000_4_CreateSP.sql#L360503) | — | 29 / 0 | — |
| `UBFSFileClear` | [L360573](../../../../ScriptDB/000_4_CreateSP.sql#L360573) | — | 0 / 0 | — |
| `UBFSFileCodeList` | [L360625](../../../../ScriptDB/000_4_CreateSP.sql#L360625) | 1 / 1 file | 0 / 0 | [FFImport.cs:721](../../../../UBFFImport/FFImport.cs#L721) |
| `UBFSFileCodeList1256` | [L360648](../../../../ScriptDB/000_4_CreateSP.sql#L360648) | — | 0 / 0 | — |
| `UBFSFileRecordLen` | [L360682](../../../../ScriptDB/000_4_CreateSP.sql#L360682) | 1 / 1 file | 0 / 0 | [FFImport.cs:1976](../../../../UBFFImport/FFImport.cs#L1976) |
| `UBFSLogRecordAdded` | [L360910](../../../../ScriptDB/000_4_CreateSP.sql#L360910) | — | 2 / 1 | — |
| `UBFSRuleList` | [L361074](../../../../ScriptDB/000_4_CreateSP.sql#L361074) | 1 / 1 file | 0 / 2 | [CDatabase.cs:1916](../../../../UBConnection/CDatabase.cs#L1916) |
| `UBFSRuleList_FD` | [L361099](../../../../ScriptDB/000_4_CreateSP.sql#L361099) | — | 1 / 0 | — |
| `UBFSRuleList_Service` | [L361123](../../../../ScriptDB/000_4_CreateSP.sql#L361123) | — | 1 / 0 | — |
| `UBFSRuleSave` | [L361140](../../../../ScriptDB/000_4_CreateSP.sql#L361140) | 1 / 1 file | 0 / 2 | [CDatabase.cs:2017](../../../../UBConnection/CDatabase.cs#L2017) |
| `UBFSRuleSave_FD` | [L361168](../../../../ScriptDB/000_4_CreateSP.sql#L361168) | — | 1 / 1 | — |
| `UBFSRuleSave_Service` | [L361215](../../../../ScriptDB/000_4_CreateSP.sql#L361215) | — | 1 / 1 | — |
| `UBFSRuleSave3_Service` | [L361263](../../../../ScriptDB/000_4_CreateSP.sql#L361263) | — | 0 / 1 | — |
| `UBFSRuleSaveOne_FD` | [L361298](../../../../ScriptDB/000_4_CreateSP.sql#L361298) | — | 1 / 0 | — |
| `UBFSRuleSaveOne_Service` | [L361340](../../../../ScriptDB/000_4_CreateSP.sql#L361340) | — | 3 / 0 | — |
| `UBFSXMLAcctSetup` | [L361381](../../../../ScriptDB/000_4_CreateSP.sql#L361381) | — | 2 / 7 | — |
| `UBFSXMLAcctTrnsfr` | [L361807](../../../../ScriptDB/000_4_CreateSP.sql#L361807) | — | 1 / 2 | — |
| `UBFSXMLClearTS` | [L362304](../../../../ScriptDB/000_4_CreateSP.sql#L362304) | 1 / 1 file | 0 / 0 | [CAdhocTSFileImport.cs:250](../../../../UBFFImport/CAdhocTSFileImport.cs#L250) |
| `UBFSXMLITFBen` | [L362338](../../../../ScriptDB/000_4_CreateSP.sql#L362338) | — | 1 / 0 | — |
| `UBFSXMLOwner` | [L362400](../../../../ScriptDB/000_4_CreateSP.sql#L362400) | — | 2 / 0 | — |
| `UBFSXMLPrmCareGvr` | [L362526](../../../../ScriptDB/000_4_CreateSP.sql#L362526) | — | 1 / 0 | — |
| `UBFSXMLSpousal` | [L362583](../../../../ScriptDB/000_4_CreateSP.sql#L362583) | — | 1 / 0 | — |
| `UBFSXMLSuccessorAnnuitant` | [L362641](../../../../ScriptDB/000_4_CreateSP.sql#L362641) | — | 1 / 0 | — |
| `UBFSXMLTSFASucsr` | [L362732](../../../../ScriptDB/000_4_CreateSP.sql#L362732) | — | 2 / 0 | — |
| `UBGeneralSetupComboList` | [L403650](../../../../ScriptDB/000_4_CreateSP.sql#L403650) | — | 0 / 1 | — |
| `UBGetDistributionRate` | [L403984](../../../../ScriptDB/000_4_CreateSP.sql#L403984) | — | 1 / 0 | — |
| `UBGetDistributionRateX` | [L404016](../../../../ScriptDB/000_4_CreateSP.sql#L404016) | — | 2 / 0 | — |
| `UBGetDividendOpt` | [L404053](../../../../ScriptDB/000_4_CreateSP.sql#L404053) | 1 / 1 file | 0 / 0 | [FundAccount.cs:602](../../../../UBClasses/FundAccount.cs#L602) |
| `UBGetMemberTaxAmount` | [L404101](../../../../ScriptDB/000_4_CreateSP.sql#L404101) | — | 5 / 1 | — |
| `UBGetMemberTaxRate` | [L404125](../../../../ScriptDB/000_4_CreateSP.sql#L404125) | — | 1 / 1 | — |
| `UBGetReceiptByDepositType` | [L404771](../../../../ScriptDB/000_4_CreateSP.sql#L404771) | — | 0 / 0 | — |
| `UBGetRepID` | [L404793](../../../../ScriptDB/000_4_CreateSP.sql#L404793) | — | 0 / 0 | — |
| `UBGetServerTime` | [L404852](../../../../ScriptDB/000_4_CreateSP.sql#L404852) | 1 / 1 file | 0 / 0 | [CDatabase.cs:1672](../../../../UBConnection/CDatabase.cs#L1672) |
| `UBGetSettings` | [L404922](../../../../ScriptDB/000_4_CreateSP.sql#L404922) | 3 / 2 file | 4 / 0 | [CBase.cs:1178](../../../../UBClasses/CBase.cs#L1178) |
| `UBGetSettingsX` | [L405000](../../../../ScriptDB/000_4_CreateSP.sql#L405000) | 2 / 2 file | 0 / 0 | [ClientInfo.cs:264](../../../../OnboardingWebServices/ClientInfo.cs#L264) |
| `UBGetTaxRate` | [L405157](../../../../ScriptDB/000_4_CreateSP.sql#L405157) | — | 1 / 0 | — |
| `UBGetWHTRate` | [L405487](../../../../ScriptDB/000_4_CreateSP.sql#L405487) | — | 4 / 0 | — |
| `UBGetWHTRateN` | [L405531](../../../../ScriptDB/000_4_CreateSP.sql#L405531) | — | 1 / 0 | — |
| `UBGetWHTRequired` | [L405600](../../../../ScriptDB/000_4_CreateSP.sql#L405600) | — | 4 / 1 | — |
| `UBGetWHTRequiredX` | [L405644](../../../../ScriptDB/000_4_CreateSP.sql#L405644) | — | 1 / 1 | — |
| `UBGIAAnnuAdd` | [L405697](../../../../ScriptDB/000_4_CreateSP.sql#L405697) | — | 0 / 4 | — |
| `UBGIAAnnuEdit` | [L405805](../../../../ScriptDB/000_4_CreateSP.sql#L405805) | 1 / 1 file | 0 / 0 | [PanelGICAnnuAdd.aspx.cs:65](../../../../WebApp/Main/PanelGICAnnuAdd.aspx.cs#L65) |
| `UBGIAAnnuRemove` | [L405856](../../../../ScriptDB/000_4_CreateSP.sql#L405856) | 1 / 1 file | 0 / 1 | [PanelGICAnnuAdd.aspx.cs:321](../../../../WebApp/Main/PanelGICAnnuAdd.aspx.cs#L321) |
| `UBGIAAnnuUpdate` | [L405912](../../../../ScriptDB/000_4_CreateSP.sql#L405912) | — | 0 / 7 | — |
| `UBGIABenAdd` | [L406030](../../../../ScriptDB/000_4_CreateSP.sql#L406030) | — | 0 / 4 | — |
| `UBGIABenEdit` | [L406153](../../../../ScriptDB/000_4_CreateSP.sql#L406153) | 1 / 1 file | 0 / 0 | [PanelGICBenAdd.aspx.cs:66](../../../../WebApp/Main/PanelGICBenAdd.aspx.cs#L66) |
| `UBGIABenRemove` | [L406208](../../../../ScriptDB/000_4_CreateSP.sql#L406208) | 1 / 1 file | 0 / 1 | [PanelGICBenAdd.aspx.cs:384](../../../../WebApp/Main/PanelGICBenAdd.aspx.cs#L384) |
| `UBGIABenUpdate` | [L406263](../../../../ScriptDB/000_4_CreateSP.sql#L406263) | — | 0 / 7 | — |
| `UBGIAInfoAnnuList` | [L406393](../../../../ScriptDB/000_4_CreateSP.sql#L406393) | 1 / 1 file | 0 / 0 | [TermDeposit.cs:299](../../../../UBClasses/TermDeposit.cs#L299) |
| `UBGIAInfoBenList` | [L406441](../../../../ScriptDB/000_4_CreateSP.sql#L406441) | 1 / 1 file | 0 / 0 | [TermDeposit.cs:169](../../../../UBClasses/TermDeposit.cs#L169) |
| `UBGIASuccessorAdd` | [L406492](../../../../ScriptDB/000_4_CreateSP.sql#L406492) | — | 1 / 5 | — |
| `UBGIASuccessorEdit` | [L406616](../../../../ScriptDB/000_4_CreateSP.sql#L406616) | — | 0 / 0 | — |
| `UBGIASuccessorRemove` | [L406671](../../../../ScriptDB/000_4_CreateSP.sql#L406671) | — | 0 / 1 | — |
| `UBGIASuccessorUpdate` | [L406726](../../../../ScriptDB/000_4_CreateSP.sql#L406726) | — | 1 / 8 | — |
| `UBGIATMPEnd` | [L406861](../../../../ScriptDB/000_4_CreateSP.sql#L406861) | — | 2 / 0 | — |
| `UBGMWBPeriodList` | [L423845](../../../../ScriptDB/000_4_CreateSP.sql#L423845) | — | 1 / 0 | — |
| `UBHelpList` | [L423875](../../../../ScriptDB/000_4_CreateSP.sql#L423875) | — | 0 / 0 | — |
| `UBHelpListAll` | [L423928](../../../../ScriptDB/000_4_CreateSP.sql#L423928) | — | 0 / 0 | — |
| `UBHelpRemove` | [L423965](../../../../ScriptDB/000_4_CreateSP.sql#L423965) | 1 / 1 file | 0 / 0 | [Help.cs:382](../../../../UBClasses/Help.cs#L382) |
| `UBHelpSettingAddUpdate` | [L423984](../../../../ScriptDB/000_4_CreateSP.sql#L423984) | 1 / 1 file | 0 / 0 | [Help.cs:206](../../../../UBClasses/Help.cs#L206) |
| `UBHelpSettingGet` | [L424042](../../../../ScriptDB/000_4_CreateSP.sql#L424042) | — | 0 / 0 | — |
| `UBHelpStatus` | [L424055](../../../../ScriptDB/000_4_CreateSP.sql#L424055) | 1 / 1 file | 0 / 0 | [Help.cs:32](../../../../UBClasses/Help.cs#L32) |
| `UBHiddenValueArraySave` | [L424093](../../../../ScriptDB/000_4_CreateSP.sql#L424093) | 1 / 1 file | 0 / 0 | [CBase.cs:123](../../../../UBClasses/CBase.cs#L123) |
| `UBHiddenValueList` | [L424154](../../../../ScriptDB/000_4_CreateSP.sql#L424154) | 1 / 1 file | 0 / 0 | [CBase.cs:282](../../../../UBClasses/CBase.cs#L282) |
| `UBHiddenValueSave` | [L424229](../../../../ScriptDB/000_4_CreateSP.sql#L424229) | 1 / 1 file | 4 / 0 | [CBase.cs:64](../../../../UBClasses/CBase.cs#L64) |
| `UBHolidayGenerate` | [L424259](../../../../ScriptDB/000_4_CreateSP.sql#L424259) | — | 3 / 1 | — |
| `UBHolidayList` | [L424508](../../../../ScriptDB/000_4_CreateSP.sql#L424508) | 1 / 1 file | 0 / 1 | [Holiday.cs:39](../../../../UBClasses/Holiday.cs#L39) |
| `UBHolidayRefresh` | [L424535](../../../../ScriptDB/000_4_CreateSP.sql#L424535) | — | 4 / 1 | — |
| `UBIdentificationRecMethodList` | [L424557](../../../../ScriptDB/000_4_CreateSP.sql#L424557) | — | 2 / 0 | — |
| `UBIdentificationTypeList` | [L424587](../../../../ScriptDB/000_4_CreateSP.sql#L424587) | — | 2 / 0 | — |
| `UBImportFileList` | [L424617](../../../../ScriptDB/000_4_CreateSP.sql#L424617) | — | 0 / 0 | — |
| `UBInsEditComboList` | [L424662](../../../../ScriptDB/000_4_CreateSP.sql#L424662) | — | 0 / 1 | — |
| `UBInsertAddDef` | [L424688](../../../../ScriptDB/000_4_CreateSP.sql#L424688) | 1 / 1 file | 0 / 0 | [CInsert.cs:42](../../../../UBClasses/CInsert.cs#L42) |
| `UBInsertListDef` | [L424749](../../../../ScriptDB/000_4_CreateSP.sql#L424749) | 1 / 1 file | 0 / 0 | [CInsert.cs:134](../../../../UBClasses/CInsert.cs#L134) |
| `UBInsertRemoveDef` | [L424781](../../../../ScriptDB/000_4_CreateSP.sql#L424781) | 1 / 1 file | 0 / 0 | [CInsert.cs:92](../../../../UBClasses/CInsert.cs#L92) |
| `UBInsRelationshipList` | [L424818](../../../../ScriptDB/000_4_CreateSP.sql#L424818) | — | 1 / 0 | — |
| `UBInsuranceAdd` | [L424850](../../../../ScriptDB/000_4_CreateSP.sql#L424850) | 1 / 1 file | 0 / 2 | [Insurance.cs:66](../../../../UBClasses/Insurance.cs#L66) |
| `UBInsuranceApprovalTypeList` | [L425108](../../../../ScriptDB/000_4_CreateSP.sql#L425108) | — | 1 / 0 | — |
| `UBInsuranceBenefitPeriodList` | [L425134](../../../../ScriptDB/000_4_CreateSP.sql#L425134) | — | 1 / 0 | — |
| `UBInsuranceBenefitTypeList` | [L425160](../../../../ScriptDB/000_4_CreateSP.sql#L425160) | — | 1 / 0 | — |
| `UBInsuranceClassList` | [L425186](../../../../ScriptDB/000_4_CreateSP.sql#L425186) | — | 1 / 0 | — |
| `UBInsuranceComboList` | [L425212](../../../../ScriptDB/000_4_CreateSP.sql#L425212) | — | 0 / 12 | — |
| `UBInsuranceCostTypeList` | [L425254](../../../../ScriptDB/000_4_CreateSP.sql#L425254) | — | 1 / 0 | — |
| `UBInsuranceCoverageTypeList` | [L425280](../../../../ScriptDB/000_4_CreateSP.sql#L425280) | — | 1 / 0 | — |
| `UBInsuranceDelete` | [L425306](../../../../ScriptDB/000_4_CreateSP.sql#L425306) | 1 / 1 file | 0 / 0 | [Insurance.cs:352](../../../../UBClasses/Insurance.cs#L352) |
| `UBInsuranceInfo` | [L425339](../../../../ScriptDB/000_4_CreateSP.sql#L425339) | 1 / 1 file | 0 / 0 | [Insurance.cs:305](../../../../UBClasses/Insurance.cs#L305) |
| `UBInsuranceLifeStyleList` | [L425461](../../../../ScriptDB/000_4_CreateSP.sql#L425461) | — | 1 / 0 | — |
| `UBInsuranceList` | [L425487](../../../../ScriptDB/000_4_CreateSP.sql#L425487) | 1 / 1 file | 0 / 0 | [Insurance.cs:250](../../../../UBClasses/Insurance.cs#L250) |
| `UBInsurancePremiumModeList` | [L425523](../../../../ScriptDB/000_4_CreateSP.sql#L425523) | — | 1 / 0 | — |
| `UBInsurancePremiumPeriodList` | [L425549](../../../../ScriptDB/000_4_CreateSP.sql#L425549) | — | 1 / 0 | — |
| `UBInsuranceRiderUpdate` | [L425653](../../../../ScriptDB/000_4_CreateSP.sql#L425653) | — | 2 / 0 | — |
| `UBInsuranceStatusList` | [L425693](../../../../ScriptDB/000_4_CreateSP.sql#L425693) | — | 1 / 0 | — |
| `UBInsuranceTypeList` | [L425719](../../../../ScriptDB/000_4_CreateSP.sql#L425719) | — | 1 / 0 | — |
| `UBInsuranceUpdate` | [L425745](../../../../ScriptDB/000_4_CreateSP.sql#L425745) | 1 / 1 file | 0 / 2 | [Insurance.cs:66](../../../../UBClasses/Insurance.cs#L66) |
| `UBInvestmentKnowledgeList` | [L426319](../../../../ScriptDB/000_4_CreateSP.sql#L426319) | — | 5 / 0 | — |
| `UBInvestmentLimitList` | [L426350](../../../../ScriptDB/000_4_CreateSP.sql#L426350) | — | 1 / 0 | — |
| `UBInvestObjMatrixApply` | [L426376](../../../../ScriptDB/000_4_CreateSP.sql#L426376) | 1 / 1 file | 0 / 0 | [Compliance.cs:5564](../../../../UBClasses/Compliance.cs#L5564) |
| `UBInvestObjMatrixItemGet` | [L426532](../../../../ScriptDB/000_4_CreateSP.sql#L426532) | — | 0 / 0 | — |
| `UBInvestObjMatrixItemInfo` | [L426565](../../../../ScriptDB/000_4_CreateSP.sql#L426565) | 1 / 1 file | 0 / 0 | [Compliance.cs:5426](../../../../UBClasses/Compliance.cs#L5426) |
| `UBInvestObjMatrixItemRemove` | [L426584](../../../../ScriptDB/000_4_CreateSP.sql#L426584) | 1 / 1 file | 0 / 0 | [Compliance.cs:5471](../../../../UBClasses/Compliance.cs#L5471) |
| `UBInvestObjMatrixItemUpdate` | [L426609](../../../../ScriptDB/000_4_CreateSP.sql#L426609) | 1 / 1 file | 0 / 0 | [Compliance.cs:5509](../../../../UBClasses/Compliance.cs#L5509) |
| `UBInvestObjMatrixList` | [L426656](../../../../ScriptDB/000_4_CreateSP.sql#L426656) | 1 / 1 file | 0 / 0 | [Compliance.cs:5382](../../../../UBClasses/Compliance.cs#L5382) |
| `UBJointDuplicateClean` | [L426691](../../../../ScriptDB/000_4_CreateSP.sql#L426691) | — | 0 / 0 | — |
| `UBKYPAuditTrailFieldList` | [L427064](../../../../ScriptDB/000_4_CreateSP.sql#L427064) | — | 1 / 0 | — |
| `UBKYPAuditTrailReviewAdd` | [L427085](../../../../ScriptDB/000_4_CreateSP.sql#L427085) | 1 / 1 file | 0 / 0 | [FundDef.cs:3704](../../../../UBClasses/FundDef.cs#L3704) |
| `UBKYPAuditTrailReviewListHistory` | [L427126](../../../../ScriptDB/000_4_CreateSP.sql#L427126) | 1 / 1 file | 0 / 1 | [FundDef.cs:3767](../../../../UBClasses/FundDef.cs#L3767) |
| `UBKYPAuditTrailReviewListRemove` | [L427277](../../../../ScriptDB/000_4_CreateSP.sql#L427277) | 1 / 1 file | 0 / 0 | [FundDef.cs:3826](../../../../UBClasses/FundDef.cs#L3826) |
| `UBKYPAuditTrailScan4Significant` | [L427310](../../../../ScriptDB/000_4_CreateSP.sql#L427310) | — | 0 / 0 | — |
| `UBKYPComboList` | [L427384](../../../../ScriptDB/000_4_CreateSP.sql#L427384) | — | 0 / 7 | — |
| `UBKYPCompareListCurrent` | [L427540](../../../../ScriptDB/000_4_CreateSP.sql#L427540) | 1 / 1 file | 0 / 1 | [FundDef.cs:458](../../../../UBClasses/FundDef.cs#L458) |
| `UBKYPCompareListCurrent_Old` | [L427683](../../../../ScriptDB/000_4_CreateSP.sql#L427683) | — | 0 / 1 | — |
| `UBKYPCompareListDetail` | [L432055](../../../../ScriptDB/000_4_CreateSP.sql#L432055) | 2 / 2 file | 1 / 0 | [FundDef.cs:3076](../../../../UBClasses/FundDef.cs#L3076) |
| `UBKYPCompareListExist` | [L432226](../../../../ScriptDB/000_4_CreateSP.sql#L432226) | 1 / 1 file | 0 / 0 | [FundDef.cs:719](../../../../UBClasses/FundDef.cs#L719) |
| `UBKYPCompareListHistory` | [L432288](../../../../ScriptDB/000_4_CreateSP.sql#L432288) | 1 / 1 file | 1 / 0 | [FundDef.cs:517](../../../../UBClasses/FundDef.cs#L517) |
| `UBKYPCompareListRemove` | [L432723](../../../../ScriptDB/000_4_CreateSP.sql#L432723) | 1 / 1 file | 0 / 0 | [FundDef.cs:767](../../../../UBClasses/FundDef.cs#L767) |
| `UBLanguageList` | [L434393](../../../../ScriptDB/000_4_CreateSP.sql#L434393) | — | 5 / 0 | — |
| `UBLAP_EndTask` | [L434426](../../../../ScriptDB/000_4_CreateSP.sql#L434426) | — | 0 / 0 | — |
| `UBLAP_GetSet` | [L434443](../../../../ScriptDB/000_4_CreateSP.sql#L434443) | — | 0 / 0 | — |
| `UBLAP_GetTask` | [L434535](../../../../ScriptDB/000_4_CreateSP.sql#L434535) | — | 0 / 0 | — |
| `UBLAP_NewTask` | [L434567](../../../../ScriptDB/000_4_CreateSP.sql#L434567) | 1 / 1 file | 0 / 0 | [CommissionRevenue.cs:3533](../../../../UBClasses/CommissionRevenue.cs#L3533) |
| `UBLAP_RemoveTask` | [L434678](../../../../ScriptDB/000_4_CreateSP.sql#L434678) | — | 0 / 0 | — |
| `UBLast3MonthList` | [L434693](../../../../ScriptDB/000_4_CreateSP.sql#L434693) | — | 1 / 0 | — |
| `UBLicenseTypeList` | [L434726](../../../../ScriptDB/000_4_CreateSP.sql#L434726) | — | 1 / 0 | — |
| `UBLoanActionList` | [L434761](../../../../ScriptDB/000_4_CreateSP.sql#L434761) | — | 2 / 0 | — |
| `UBLoanActionSave` | [L434803](../../../../ScriptDB/000_4_CreateSP.sql#L434803) | 1 / 1 file | 0 / 0 | [Loan.cs:1022](../../../../UBClasses/Loan.cs#L1022) |
| `UBLoanAdd` | [L434880](../../../../ScriptDB/000_4_CreateSP.sql#L434880) | — | 0 / 4 | — |
| `UBLoanAssetLiquidList` | [L435155](../../../../ScriptDB/000_4_CreateSP.sql#L435155) | — | 2 / 0 | — |
| `UBLoanAssetLiquidSave` | [L435219](../../../../ScriptDB/000_4_CreateSP.sql#L435219) | 1 / 1 file | 0 / 0 | [Loan.cs:749](../../../../UBClasses/Loan.cs#L749) |
| `UBLoanAssetOtherList` | [L435287](../../../../ScriptDB/000_4_CreateSP.sql#L435287) | — | 2 / 0 | — |
| `UBLoanAssetOtherSave` | [L435351](../../../../ScriptDB/000_4_CreateSP.sql#L435351) | 1 / 1 file | 0 / 0 | [Loan.cs:749](../../../../UBClasses/Loan.cs#L749) |
| `UBLoanAssetSaveEnd` | [L435420](../../../../ScriptDB/000_4_CreateSP.sql#L435420) | 1 / 1 file | 0 / 4 | [Loan.cs:862](../../../../UBClasses/Loan.cs#L862) |
| `UBLoanCalcPMT` | [L435517](../../../../ScriptDB/000_4_CreateSP.sql#L435517) | 1 / 1 file | 0 / 0 | [Loan.cs:425](../../../../UBClasses/Loan.cs#L425) |
| `UBLoanEditComboList` | [L435632](../../../../ScriptDB/000_4_CreateSP.sql#L435632) | — | 0 / 8 | — |
| `UBLoanFileObj` | [L435665](../../../../ScriptDB/000_4_CreateSP.sql#L435665) | 1 / 1 file | 0 / 0 | [Loan.cs:1090](../../../../UBClasses/Loan.cs#L1090) |
| `UBLoanFileObjRemove` | [L435706](../../../../ScriptDB/000_4_CreateSP.sql#L435706) | 1 / 1 file | 0 / 0 | [Loan.cs:1145](../../../../UBClasses/Loan.cs#L1145) |
| `UBLoanImportB2BOne` | [L435742](../../../../ScriptDB/000_4_CreateSP.sql#L435742) | — | 0 / 0 | — |
| `UBLoanImportB2BPendingList` | [L435901](../../../../ScriptDB/000_4_CreateSP.sql#L435901) | 1 / 1 file | 0 / 0 | [Loan.cs:1301](../../../../UBClasses/Loan.cs#L1301) |
| `UBLoanImportB2BStart` | [L435927](../../../../ScriptDB/000_4_CreateSP.sql#L435927) | — | 0 / 0 | — |
| `UBLoanIncomeList` | [L435946](../../../../ScriptDB/000_4_CreateSP.sql#L435946) | — | 2 / 0 | — |
| `UBLoanIncomeSave` | [L436012](../../../../ScriptDB/000_4_CreateSP.sql#L436012) | 1 / 1 file | 0 / 0 | [Loan.cs:963](../../../../UBClasses/Loan.cs#L963) |
| `UBLoanItemList` | [L436078](../../../../ScriptDB/000_4_CreateSP.sql#L436078) | 1 / 1 file | 0 / 6 | [Loan.cs:1182](../../../../UBClasses/Loan.cs#L1182) |
| `UBLoanLiabilityList` | [L436158](../../../../ScriptDB/000_4_CreateSP.sql#L436158) | — | 2 / 0 | — |
| `UBLoanLiabilitySave` | [L436223](../../../../ScriptDB/000_4_CreateSP.sql#L436223) | 1 / 1 file | 1 / 0 | [Loan.cs:806](../../../../UBClasses/Loan.cs#L806) |
| `UBLoanLiabilitySaveEnd` | [L436293](../../../../ScriptDB/000_4_CreateSP.sql#L436293) | 1 / 1 file | 0 / 3 | [Loan.cs:912](../../../../UBClasses/Loan.cs#L912) |
| `UBLoanListSet` | [L436419](../../../../ScriptDB/000_4_CreateSP.sql#L436419) | 1 / 1 file | 0 / 1 | [Loan.cs:1232](../../../../UBClasses/Loan.cs#L1232) |
| `UBLoanLoadNew` | [L436791](../../../../ScriptDB/000_4_CreateSP.sql#L436791) | 1 / 1 file | 0 / 0 | [Loan.cs:380](../../../../UBClasses/Loan.cs#L380) |
| `UBLoanRemove` | [L437016](../../../../ScriptDB/000_4_CreateSP.sql#L437016) | — | 0 / 0 | — |
| `UBLoanUpdate` | [L437247](../../../../ScriptDB/000_4_CreateSP.sql#L437247) | — | 0 / 1 | — |
| `UBLog` | [L437408](../../../../ScriptDB/000_4_CreateSP.sql#L437408) | — | 3 / 0 | — |
| `UBLogAdd` | [L437432](../../../../ScriptDB/000_4_CreateSP.sql#L437432) | — | 0 / 0 | — |
| `UBLogoAdd` | [L437501](../../../../ScriptDB/000_4_CreateSP.sql#L437501) | 1 / 1 file | 0 / 0 | [CBase.cs:7337](../../../../UBClasses/CBase.cs#L7337) |
| `UBLogoCopy` | [L437599](../../../../ScriptDB/000_4_CreateSP.sql#L437599) | — | 0 / 0 | — |
| `UBLogoGet` | [L437622](../../../../ScriptDB/000_4_CreateSP.sql#L437622) | — | 62 / 0 | — |
| `UBLogoGetX` | [L437750](../../../../ScriptDB/000_4_CreateSP.sql#L437750) | — | 2 / 0 | — |
| `UBLogoRemove` | [L437860](../../../../ScriptDB/000_4_CreateSP.sql#L437860) | 1 / 1 file | 0 / 0 | [CBase.cs:7391](../../../../UBClasses/CBase.cs#L7391) |
| `UBLogoutOptComboList` | [L437893](../../../../ScriptDB/000_4_CreateSP.sql#L437893) | — | 0 / 1 | — |
| `UBLSFileDetailList` | [L437917](../../../../ScriptDB/000_4_CreateSP.sql#L437917) | — | 0 / 0 | — |
| `UBLSFileFix1File` | [L438148](../../../../ScriptDB/000_4_CreateSP.sql#L438148) | — | 1 / 1 | — |
| `UBLSFileFixFiles` | [L438192](../../../../ScriptDB/000_4_CreateSP.sql#L438192) | — | 0 / 1 | — |
| `UBLSFileList` | [L438226](../../../../ScriptDB/000_4_CreateSP.sql#L438226) | 1 / 1 file | 0 / 0 | [CAFFile.cs:173](../../../../UBClasses/CAFFile.cs#L173) |
| `UBLSFileRemoveByFileID` | [L438359](../../../../ScriptDB/000_4_CreateSP.sql#L438359) | 1 / 1 file | 0 / 1 | [CommissionRevenue.cs:3048](../../../../UBClasses/CommissionRevenue.cs#L3048) |
| `UBLSFileSelectionUpdate` | [L438396](../../../../ScriptDB/000_4_CreateSP.sql#L438396) | — | 0 / 0 | — |
| `UBMaritalStatusList` | [L438443](../../../../ScriptDB/000_4_CreateSP.sql#L438443) | — | 5 / 0 | — |
| `UBMaturityInstructionList` | [L438469](../../../../ScriptDB/000_4_CreateSP.sql#L438469) | — | 1 / 0 | — |
| `UBMemberActiveList` | [L438745](../../../../ScriptDB/000_4_CreateSP.sql#L438745) | 1 / 1 file | 0 / 0 | [Member.cs:112](../../../../UBClasses/Member.cs#L112) |
| `UBMemberAddTMP` | [L438812](../../../../ScriptDB/000_4_CreateSP.sql#L438812) | 1 / 1 file | 0 / 1 | [CDatabase.cs:2733](../../../../UBConnection/CDatabase.cs#L2733) |
| `UBMemberAddUI` | [L438898](../../../../ScriptDB/000_4_CreateSP.sql#L438898) | — | 0 / 6 | — |
| `UBMemberAgentIDAdd` | [L439224](../../../../ScriptDB/000_4_CreateSP.sql#L439224) | 1 / 1 file | 0 / 0 | [Member.cs:3943](../../../../UBClasses/Member.cs#L3943) |
| `UBMemberAgentIDDelete` | [L439266](../../../../ScriptDB/000_4_CreateSP.sql#L439266) | 1 / 1 file | 0 / 0 | [Member.cs:3991](../../../../UBClasses/Member.cs#L3991) |
| `UBMemberAgentIDSet` | [L439291](../../../../ScriptDB/000_4_CreateSP.sql#L439291) | 1 / 1 file | 1 / 0 | [Member.cs:4037](../../../../UBClasses/Member.cs#L4037) |
| `UBMemberAppAdd` | [L439324](../../../../ScriptDB/000_4_CreateSP.sql#L439324) | 1 / 1 file | 0 / 0 | [Member.cs:3012](../../../../UBClasses/Member.cs#L3012) |
| `UBMemberAppDelete` | [L439369](../../../../ScriptDB/000_4_CreateSP.sql#L439369) | 1 / 1 file | 0 / 0 | [Member.cs:3061](../../../../UBClasses/Member.cs#L3061) |
| `UBMemberAppInfo` | [L439394](../../../../ScriptDB/000_4_CreateSP.sql#L439394) | 1 / 1 file | 0 / 0 | [Member.cs:3108](../../../../UBClasses/Member.cs#L3108) |
| `UBMemberAppSet` | [L439422](../../../../ScriptDB/000_4_CreateSP.sql#L439422) | 1 / 1 file | 1 / 0 | [Member.cs:2878](../../../../UBClasses/Member.cs#L2878) |
| `UBMemberAssetList` | [L439455](../../../../ScriptDB/000_4_CreateSP.sql#L439455) | 1 / 1 file | 0 / 0 | [Member.cs:4908](../../../../UBClasses/Member.cs#L4908) |
| `UBMemberAssistantAdd` | [L439526](../../../../ScriptDB/000_4_CreateSP.sql#L439526) | 1 / 1 file | 1 / 2 | [Member.cs:2778](../../../../UBClasses/Member.cs#L2778) |
| `UBMemberAssistantGet` | [L439606](../../../../ScriptDB/000_4_CreateSP.sql#L439606) | — | 12 / 1 | — |
| `UBMemberAssistantList` | [L439627](../../../../ScriptDB/000_4_CreateSP.sql#L439627) | 2 / 1 file | 1 / 1 | [Member.cs:227](../../../../UBClasses/Member.cs#L227) |
| `UBMemberAssistantListX` | [L439656](../../../../ScriptDB/000_4_CreateSP.sql#L439656) | — | 1 / 0 | — |
| `UBMemberAssistantRemove` | [L439683](../../../../ScriptDB/000_4_CreateSP.sql#L439683) | 1 / 1 file | 0 / 1 | [Member.cs:2722](../../../../UBClasses/Member.cs#L2722) |
| `UBMemberBankInfoAdd` | [L439752](../../../../ScriptDB/000_4_CreateSP.sql#L439752) | — | 9 / 1 | — |
| `UBMemberBankInfoRemove` | [L439848](../../../../ScriptDB/000_4_CreateSP.sql#L439848) | 1 / 1 file | 0 / 0 | [PanelMemberBankAdd.aspx.cs:402](../../../../WebApp/Main/PanelMemberBankAdd.aspx.cs#L402) |
| `UBMemberBankInfoUpdate` | [L439891](../../../../ScriptDB/000_4_CreateSP.sql#L439891) | — | 0 / 1 | — |
| `UBMemberBankList` | [L439983](../../../../ScriptDB/000_4_CreateSP.sql#L439983) | 1 / 1 file | 2 / 0 | [BankAccount.cs:1607](../../../../UBClasses/BankAccount.cs#L1607) |
| `UBMemberBankTMP` | [L440049](../../../../ScriptDB/000_4_CreateSP.sql#L440049) | — | 0 / 0 | — |
| `UBMemberCityProvince` | [L440248](../../../../ScriptDB/000_4_CreateSP.sql#L440248) | 1 / 1 file | 0 / 0 | [Province.cs:487](../../../../UBClasses/Province.cs#L487) |
| `UBMemberCompApprovalLevel` | [L440708](../../../../ScriptDB/000_4_CreateSP.sql#L440708) | 1 / 1 file | 0 / 0 | [Member.cs:1677](../../../../UBClasses/Member.cs#L1677) |
| `UBMemberCreateRepCode` | [L440775](../../../../ScriptDB/000_4_CreateSP.sql#L440775) | — | 1 / 0 | — |
| `UBMemberEditComboList` | [L440921](../../../../ScriptDB/000_4_CreateSP.sql#L440921) | — | 0 / 14 | — |
| `UBMemberFileObj` | [L440984](../../../../ScriptDB/000_4_CreateSP.sql#L440984) | 1 / 1 file | 0 / 0 | [Member.cs:3387](../../../../UBClasses/Member.cs#L3387) |
| `UBMemberGet` | [L441100](../../../../ScriptDB/000_4_CreateSP.sql#L441100) | — | 32 / 2 | — |
| `UBMemberGroupList` | [L441150](../../../../ScriptDB/000_4_CreateSP.sql#L441150) | — | 3 / 0 | — |
| `UBMemberInfo` | [L441185](../../../../ScriptDB/000_4_CreateSP.sql#L441185) | 1 / 1 file | 0 / 2 | [Member.cs:515](../../../../UBClasses/Member.cs#L515) |
| `UBMemberInfoBank` | [L441369](../../../../ScriptDB/000_4_CreateSP.sql#L441369) | 1 / 1 file | 0 / 1 | [PanelMemberBankAdd.aspx.cs:70](../../../../WebApp/Main/PanelMemberBankAdd.aspx.cs#L70) |
| `UBMemberInfoBankTMP` | [L441491](../../../../ScriptDB/000_4_CreateSP.sql#L441491) | 1 / 1 file | 0 / 0 | [PanelMemberBankAdd.aspx.cs:70](../../../../WebApp/Main/PanelMemberBankAdd.aspx.cs#L70) |
| `UBMemberInfoEdit` | [L441534](../../../../ScriptDB/000_4_CreateSP.sql#L441534) | 1 / 1 file | 0 / 0 | [Member.cs:601](../../../../UBClasses/Member.cs#L601) |
| `UBMemberLastPage` | [L441653](../../../../ScriptDB/000_4_CreateSP.sql#L441653) | 1 / 1 file | 0 / 0 | [Member.cs:1595](../../../../UBClasses/Member.cs#L1595) |
| `UBMemberLicenseAdd` | [L441677](../../../../ScriptDB/000_4_CreateSP.sql#L441677) | 1 / 1 file | 0 / 0 | [Member.cs:1837](../../../../UBClasses/Member.cs#L1837) |
| `UBMemberLicenseList` | [L441790](../../../../ScriptDB/000_4_CreateSP.sql#L441790) | 2 / 1 file | 1 / 0 | [Member.cs:1730](../../../../UBClasses/Member.cs#L1730) |
| `UBMemberLicenseListAll` | [L441847](../../../../ScriptDB/000_4_CreateSP.sql#L441847) | — | 0 / 0 | — |
| `UBMemberLicenseListExpired` | [L442050](../../../../ScriptDB/000_4_CreateSP.sql#L442050) | — | 0 / 0 | — |
| `UBMemberLicenseListExpireDays` | [L442284](../../../../ScriptDB/000_4_CreateSP.sql#L442284) | — | 0 / 0 | — |
| `UBMemberLicenseModify` | [L442519](../../../../ScriptDB/000_4_CreateSP.sql#L442519) | 1 / 1 file | 0 / 0 | [Member.cs:1837](../../../../UBClasses/Member.cs#L1837) |
| `UBMemberLicenseRemove` | [L442618](../../../../ScriptDB/000_4_CreateSP.sql#L442618) | 1 / 1 file | 0 / 0 | [Member.cs:1912](../../../../UBClasses/Member.cs#L1912) |
| `UBMemberList` | [L442645](../../../../ScriptDB/000_4_CreateSP.sql#L442645) | — | 0 / 0 | — |
| `UBMemberLogout` | [L443541](../../../../ScriptDB/000_4_CreateSP.sql#L443541) | — | 2 / 1 | — |
| `UBMemberName` | [L443578](../../../../ScriptDB/000_4_CreateSP.sql#L443578) | 1 / 1 file | 0 / 0 | [Member.cs:2222](../../../../UBClasses/Member.cs#L2222) |
| `UBMemberNameByRepCode` | [L443609](../../../../ScriptDB/000_4_CreateSP.sql#L443609) | 1 / 1 file | 0 / 0 | [Member.cs:2263](../../../../UBClasses/Member.cs#L2263) |
| `UBMemberNoteAdd` | [L443648](../../../../ScriptDB/000_4_CreateSP.sql#L443648) | 1 / 1 file | 0 / 0 | [Member.cs:3150](../../../../UBClasses/Member.cs#L3150) |
| `UBMemberNoteDelete` | [L443681](../../../../ScriptDB/000_4_CreateSP.sql#L443681) | 1 / 1 file | 0 / 0 | [Member.cs:3196](../../../../UBClasses/Member.cs#L3196) |
| `UBMemberNoteInfo` | [L443706](../../../../ScriptDB/000_4_CreateSP.sql#L443706) | 1 / 1 file | 0 / 0 | [Member.cs:3243](../../../../UBClasses/Member.cs#L3243) |
| `UBMemberNoteSet` | [L443731](../../../../ScriptDB/000_4_CreateSP.sql#L443731) | 1 / 1 file | 2 / 0 | [Member.cs:2923](../../../../UBClasses/Member.cs#L2923) |
| `UBMemberOBAList` | [L443760](../../../../ScriptDB/000_4_CreateSP.sql#L443760) | 1 / 1 file | 2 / 0 | [Member.cs:4208](../../../../UBClasses/Member.cs#L4208) |
| `UBMemberOBASave` | [L443814](../../../../ScriptDB/000_4_CreateSP.sql#L443814) | 1 / 1 file | 0 / 0 | [Member.cs:4158](../../../../UBClasses/Member.cs#L4158) |
| `UBMemberOtherSet` | [L443889](../../../../ScriptDB/000_4_CreateSP.sql#L443889) | 1 / 1 file | 0 / 5 | [Member.cs:2832](../../../../UBClasses/Member.cs#L2832) |
| `UBMemberProfileInfo` | [L443958](../../../../ScriptDB/000_4_CreateSP.sql#L443958) | 1 / 1 file | 0 / 6 | [Member.cs:654](../../../../UBClasses/Member.cs#L654) |
| `UBMemberProfileReset` | [L444046](../../../../ScriptDB/000_4_CreateSP.sql#L444046) | — | 0 / 1 | — |
| `UBMemberProfileUpdate` | [L444089](../../../../ScriptDB/000_4_CreateSP.sql#L444089) | — | 0 / 3 | — |
| `UBMemberRefreshAdminAccess` | [L444196](../../../../ScriptDB/000_4_CreateSP.sql#L444196) | — | 0 / 1 | — |
| `UBMemberRepAccessList` | [L444225](../../../../ScriptDB/000_4_CreateSP.sql#L444225) | 2 / 2 file | 196 / 0 | [Advisor.cs:291](../../../../UBClasses/Advisor.cs#L291) |
| `UBMemberRepAccessListB` | [L444370](../../../../ScriptDB/000_4_CreateSP.sql#L444370) | — | 4 / 0 | — |
| `UBMemberRepAccessReset` | [L444515](../../../../ScriptDB/000_4_CreateSP.sql#L444515) | 1 / 1 file | 10 / 0 | [Member.cs:2643](../../../../UBClasses/Member.cs#L2643) |
| `UBMemberRepAccessResetAll` | [L444777](../../../../ScriptDB/000_4_CreateSP.sql#L444777) | — | 1 / 1 | — |
| `UBMemberRepCodeList` | [L444823](../../../../ScriptDB/000_4_CreateSP.sql#L444823) | — | 0 / 0 | — |
| `UBMemberRepList` | [L444849](../../../../ScriptDB/000_4_CreateSP.sql#L444849) | 1 / 1 file | 0 / 0 | [Member.cs:850](../../../../UBClasses/Member.cs#L850) |
| `UBMemberRepTransfer` | [L444878](../../../../ScriptDB/000_4_CreateSP.sql#L444878) | — | 0 / 0 | — |
| `UBMemberSelectList` | [L445071](../../../../ScriptDB/000_4_CreateSP.sql#L445071) | 1 / 1 file | 0 / 2 | [Member.cs:4257](../../../../UBClasses/Member.cs#L4257) |
| `UBMemberSetAssistantPrimary` | [L445409](../../../../ScriptDB/000_4_CreateSP.sql#L445409) | — | 0 / 0 | — |
| `UBMemberSetRepReadOnly` | [L445441](../../../../ScriptDB/000_4_CreateSP.sql#L445441) | — | 0 / 0 | — |
| `UBMemberSetupComboList` | [L445484](../../../../ScriptDB/000_4_CreateSP.sql#L445484) | — | 0 / 6 | — |
| `UBMemberSetupList` | [L445532](../../../../ScriptDB/000_4_CreateSP.sql#L445532) | 2 / 1 file | 0 / 1 | [Member.cs:46](../../../../UBClasses/Member.cs#L46) |
| `UBMemberSetupRemove` | [L445960](../../../../ScriptDB/000_4_CreateSP.sql#L445960) | 1 / 1 file | 0 / 0 | [MemberSetup.aspx.cs:1170](../../../../WebApp/Main/MemberSetup.aspx.cs#L1170) |
| `UBMemberSetupSearchCriteriaSave` | [L446020](../../../../ScriptDB/000_4_CreateSP.sql#L446020) | — | 1 / 0 | — |
| `UBMemberStats` | [L446578](../../../../ScriptDB/000_4_CreateSP.sql#L446578) | — | 0 / 0 | — |
| `UBMemberStatusList` | [L446620](../../../../ScriptDB/000_4_CreateSP.sql#L446620) | — | 1 / 0 | — |
| `UBMemberT4AdjustAdd` | [L446646](../../../../ScriptDB/000_4_CreateSP.sql#L446646) | 1 / 1 file | 0 / 0 | [Member.cs:4693](../../../../UBClasses/Member.cs#L4693) |
| `UBMemberT4AdjustInfo` | [L446668](../../../../ScriptDB/000_4_CreateSP.sql#L446668) | 1 / 1 file | 0 / 0 | [Member.cs:4608](../../../../UBClasses/Member.cs#L4608) |
| `UBMemberT4AdjustList` | [L446681](../../../../ScriptDB/000_4_CreateSP.sql#L446681) | 1 / 1 file | 0 / 0 | [Member.cs:4565](../../../../UBClasses/Member.cs#L4565) |
| `UBMemberT4AdjustRemove` | [L446696](../../../../ScriptDB/000_4_CreateSP.sql#L446696) | 1 / 1 file | 0 / 0 | [Member.cs:4650](../../../../UBClasses/Member.cs#L4650) |
| `UBMemberTMPEnd` | [L446709](../../../../ScriptDB/000_4_CreateSP.sql#L446709) | — | 1 / 0 | — |
| `UBMemberTMPProcessOne` | [L446756](../../../../ScriptDB/000_4_CreateSP.sql#L446756) | — | 1 / 3 | — |
| `UBMemberUpdateUI` | [L446969](../../../../ScriptDB/000_4_CreateSP.sql#L446969) | — | 0 / 4 | — |
| `UBMFInfo` | [L447986](../../../../ScriptDB/000_4_CreateSP.sql#L447986) | 1 / 1 file | 1 / 5 | [Customer.cs:1463](../../../../UBClasses/Customer.cs#L1463) |
| `UBMgmtAdd` | [L449650](../../../../ScriptDB/000_4_CreateSP.sql#L449650) | 1 / 1 file | 6 / 2 | [Mgmt.cs:915](../../../../UBClasses/Mgmt.cs#L915) |
| `UBMgmtInfo` | [L449733](../../../../ScriptDB/000_4_CreateSP.sql#L449733) | — | 2 / 0 | — |
| `UBMgmtList` | [L449794](../../../../ScriptDB/000_4_CreateSP.sql#L449794) | 1 / 1 file | 0 / 0 | [Mgmt.cs:770](../../../../UBClasses/Mgmt.cs#L770) |
| `UBMgmtListBond` | [L450013](../../../../ScriptDB/000_4_CreateSP.sql#L450013) | — | 0 / 0 | — |
| `UBMgmtListMortgage` | [L450169](../../../../ScriptDB/000_4_CreateSP.sql#L450169) | — | 0 / 0 | — |
| `UBMgmtListShort` | [L450198](../../../../ScriptDB/000_4_CreateSP.sql#L450198) | — | 1 / 0 | — |
| `UBMgmtListStock` | [L450229](../../../../ScriptDB/000_4_CreateSP.sql#L450229) | — | 0 / 0 | — |
| `UBMgmtListTerm` | [L450259](../../../../ScriptDB/000_4_CreateSP.sql#L450259) | — | 0 / 0 | — |
| `UBMgmtRemove` | [L450288](../../../../ScriptDB/000_4_CreateSP.sql#L450288) | 1 / 1 file | 0 / 0 | [Mgmt.cs:1035](../../../../UBClasses/Mgmt.cs#L1035) |
| `UBMgmtTypeList` | [L450338](../../../../ScriptDB/000_4_CreateSP.sql#L450338) | — | 0 / 0 | — |
| `UBMgmtUpdate` | [L450364](../../../../ScriptDB/000_4_CreateSP.sql#L450364) | 1 / 1 file | 0 / 4 | [Mgmt.cs:915](../../../../UBClasses/Mgmt.cs#L915) |
| `UBMiscellaneousComboList` | [L450458](../../../../ScriptDB/000_4_CreateSP.sql#L450458) | — | 0 / 7 | — |
| `UBModelPortfolioList` | [L450500](../../../../ScriptDB/000_4_CreateSP.sql#L450500) | — | 2 / 0 | — |
| `UBMoneyMovementFileList` | [L450526](../../../../ScriptDB/000_4_CreateSP.sql#L450526) | 1 / 1 file | 0 / 0 | [CAFFile.cs:110](../../../../UBClasses/CAFFile.cs#L110) |
| `UBMoneyMovementFileSelectionUpdate` | [L450657](../../../../ScriptDB/000_4_CreateSP.sql#L450657) | — | 0 / 0 | — |
| `UBMoneyMovementList` | [L450704](../../../../ScriptDB/000_4_CreateSP.sql#L450704) | — | 0 / 0 | — |
| `UBMonthDayList` | [L450804](../../../../ScriptDB/000_4_CreateSP.sql#L450804) | — | 1 / 0 | — |
| `UBMQManagerAdd` | [L450856](../../../../ScriptDB/000_4_CreateSP.sql#L450856) | — | 0 / 0 | — |
| `UBMQManagerInfo` | [L450921](../../../../ScriptDB/000_4_CreateSP.sql#L450921) | — | 1 / 0 | — |
| `UBMQManagerUpdate` | [L450956](../../../../ScriptDB/000_4_CreateSP.sql#L450956) | — | 0 / 0 | — |
| `UBMQParamInfo` | [L451009](../../../../ScriptDB/000_4_CreateSP.sql#L451009) | — | 0 / 1 | — |
| `UBMQParamInfoAdd` | [L451042](../../../../ScriptDB/000_4_CreateSP.sql#L451042) | — | 0 / 0 | — |
| `UBNetworthIndex` | [L451092](../../../../ScriptDB/000_4_CreateSP.sql#L451092) | 1 / 1 file | 0 / 0 | [Customer.cs:4590](../../../../UBClasses/Customer.cs#L4590) |
| `UBNomineeIncomeList` | [L453764](../../../../ScriptDB/000_4_CreateSP.sql#L453764) | 1 / 1 file | 0 / 1 | [Plan.cs:4393](../../../../UBClasses/Plan.cs#L4393) |
| `UBNoteAdd` | [L453981](../../../../ScriptDB/000_4_CreateSP.sql#L453981) | 1 / 1 file | 22 / 1 | [Note.cs:327](../../../../UBClasses/Note.cs#L327) |
| `UBNoteAdd2Note` | [L454336](../../../../ScriptDB/000_4_CreateSP.sql#L454336) | — | 2 / 1 | — |
| `UBNoteAddLink` | [L454379](../../../../ScriptDB/000_4_CreateSP.sql#L454379) | — | 8 / 0 | — |
| `UBNoteDelete` | [L454563](../../../../ScriptDB/000_4_CreateSP.sql#L454563) | 1 / 1 file | 0 / 0 | [Note.cs:413](../../../../UBClasses/Note.cs#L413) |
| `UBNoteList` | [L454632](../../../../ScriptDB/000_4_CreateSP.sql#L454632) | 1 / 1 file | 1 / 0 | [Note.cs:38](../../../../UBClasses/Note.cs#L38) |
| `UBNoteTypeStr` | [L455371](../../../../ScriptDB/000_4_CreateSP.sql#L455371) | 1 / 1 file | 0 / 0 | [Note.cs:463](../../../../UBClasses/Note.cs#L463) |
| `UBNoteUpdate` | [L455398](../../../../ScriptDB/000_4_CreateSP.sql#L455398) | 1 / 1 file | 0 / 0 | [Note.cs:327](../../../../UBClasses/Note.cs#L327) |
| `UBOccupationList` | [L471573](../../../../ScriptDB/000_4_CreateSP.sql#L471573) | 1 / 1 file | 0 / 0 | [Occupation.cs:73](../../../../UBClasses/Occupation.cs#L73) |
| `UBOmnibusViewComboList` | [L471680](../../../../ScriptDB/000_4_CreateSP.sql#L471680) | — | 0 / 6 | — |
| `UBOneSpanEnvelopeRecipientStatusUpdate` | [L472300](../../../../ScriptDB/000_4_CreateSP.sql#L472300) | 2 / 2 file | 0 / 0 | [ESignature.cs:654](../../../../UBClasses/ESignature.cs#L654) |
| `UBOneSpanEnvelopeSetStatus` | [L472342](../../../../ScriptDB/000_4_CreateSP.sql#L472342) | 2 / 2 file | 0 / 0 | [ESignature.cs:432](../../../../UBClasses/ESignature.cs#L432) |
| `UBPageSizeList` | [L481621](../../../../ScriptDB/000_4_CreateSP.sql#L481621) | — | 49 / 0 | — |
| `UBPayeeList` | [L481649](../../../../ScriptDB/000_4_CreateSP.sql#L481649) | 1 / 1 file | 0 / 1 | [Advisor.cs:177](../../../../UBClasses/Advisor.cs#L177) |
| `UBPersonInfo` | [L483148](../../../../ScriptDB/000_4_CreateSP.sql#L483148) | — | 0 / 0 | — |
| `UBPersonList` | [L483186](../../../../ScriptDB/000_4_CreateSP.sql#L483186) | 1 / 1 file | 1 / 0 | [Customer.cs:5721](../../../../UBClasses/Customer.cs#L5721) |
| `UBPersonRemove` | [L483290](../../../../ScriptDB/000_4_CreateSP.sql#L483290) | 1 / 1 file | 0 / 1 | [Customer.cs:5862](../../../../UBClasses/Customer.cs#L5862) |
| `UBPersonUpdate` | [L483346](../../../../ScriptDB/000_4_CreateSP.sql#L483346) | 1 / 1 file | 0 / 6 | [Customer.cs:5783](../../../../UBClasses/Customer.cs#L5783) |
| `UBPhoneAdd` | [L483529](../../../../ScriptDB/000_4_CreateSP.sql#L483529) | — | 73 / 1 | — |
| `UBPhoneDuplicate` | [L483598](../../../../ScriptDB/000_4_CreateSP.sql#L483598) | — | 3 / 0 | — |
| `UBPhoneGet` | [L483644](../../../../ScriptDB/000_4_CreateSP.sql#L483644) | — | 11 / 0 | — |
| `UBPhoneUpdate` | [L483699](../../../../ScriptDB/000_4_CreateSP.sql#L483699) | — | 34 / 1 | — |
| `UBPortfolioUnitSummary` | [L505307](../../../../ScriptDB/000_4_CreateSP.sql#L505307) | — | 1 / 0 | — |
| `UBPortfolioViewComboList` | [L505666](../../../../ScriptDB/000_4_CreateSP.sql#L505666) | — | 0 / 5 | — |
| `UBPosDAVCalc` | [L505696](../../../../ScriptDB/000_4_CreateSP.sql#L505696) | — | 0 / 0 | — |
| `UBPosDAVCalcX` | [L505792](../../../../ScriptDB/000_4_CreateSP.sql#L505792) | — | 0 / 0 | — |
| `UBPosTCRCalc` | [L505963](../../../../ScriptDB/000_4_CreateSP.sql#L505963) | — | 1 / 0 | — |
| `UBPriceLast` | [L506174](../../../../ScriptDB/000_4_CreateSP.sql#L506174) | — | 2 / 0 | — |
| `UBPriceMove` | [L506335](../../../../ScriptDB/000_4_CreateSP.sql#L506335) | — | 0 / 0 | — |
| `UBPriceRemoveDuplicate` | [L506396](../../../../ScriptDB/000_4_CreateSP.sql#L506396) | — | 1 / 0 | — |
| `UBPriceRemoveDuplicateAll` | [L506424](../../../../ScriptDB/000_4_CreateSP.sql#L506424) | — | 0 / 1 | — |
| `UBPriceTypeList` | [L506452](../../../../ScriptDB/000_4_CreateSP.sql#L506452) | — | 1 / 0 | — |
| `UBPrivacyList` | [L506479](../../../../ScriptDB/000_4_CreateSP.sql#L506479) | — | 1 / 0 | — |
| `UBProvinceAdd` | [L506505](../../../../ScriptDB/000_4_CreateSP.sql#L506505) | 1 / 1 file | 0 / 0 | [Province.cs:316](../../../../UBClasses/Province.cs#L316) |
| `UBProvinceInfo` | [L506554](../../../../ScriptDB/000_4_CreateSP.sql#L506554) | 1 / 1 file | 0 / 0 | [Province.cs:171](../../../../UBClasses/Province.cs#L171) |
| `UBProvinceList` | [L506593](../../../../ScriptDB/000_4_CreateSP.sql#L506593) | 2 / 1 file | 0 / 0 | [Province.cs:125](../../../../UBClasses/Province.cs#L125) |
| `UBProvinceRemove` | [L506628](../../../../ScriptDB/000_4_CreateSP.sql#L506628) | 1 / 1 file | 0 / 0 | [Province.cs:380](../../../../UBClasses/Province.cs#L380) |
| `UBProvinceUpdate` | [L506667](../../../../ScriptDB/000_4_CreateSP.sql#L506667) | 1 / 1 file | 0 / 0 | [Province.cs:316](../../../../UBClasses/Province.cs#L316) |
| `UBPSSkipRecordView` | [L506718](../../../../ScriptDB/000_4_CreateSP.sql#L506718) | — | 0 / 0 | — |
| `UBQuestionairDefAdd` | [L506798](../../../../ScriptDB/000_4_CreateSP.sql#L506798) | 1 / 1 file | 0 / 0 | [Questionair.cs:572](../../../../UBClasses/Questionair.cs#L572) |
| `UBQuestionairDefList` | [L506859](../../../../ScriptDB/000_4_CreateSP.sql#L506859) | 1 / 1 file | 0 / 0 | [Questionair.cs:377](../../../../UBClasses/Questionair.cs#L377) |
| `UBQuestionairDefRemove` | [L506948](../../../../ScriptDB/000_4_CreateSP.sql#L506948) | 1 / 1 file | 0 / 0 | [Questionair.cs:639](../../../../UBClasses/Questionair.cs#L639) |
| `UBQuestionairDefUpdate` | [L506981](../../../../ScriptDB/000_4_CreateSP.sql#L506981) | 1 / 1 file | 0 / 0 | [Questionair.cs:572](../../../../UBClasses/Questionair.cs#L572) |
| `UBReceiptByDepositType` | [L507039](../../../../ScriptDB/000_4_CreateSP.sql#L507039) | 1 / 1 file | 0 / 0 | [TrustAccount.cs:3760](../../../../UBClasses/TrustAccount.cs#L3760) |
| `UBReceiptStatusList` | [L507064](../../../../ScriptDB/000_4_CreateSP.sql#L507064) | — | 0 / 0 | — |
| `UBRecordAddFSP` | [L507114](../../../../ScriptDB/000_4_CreateSP.sql#L507114) | — | 0 / 0 | — |
| `UBRefreshLastPriceAll` | [L508281](../../../../ScriptDB/000_4_CreateSP.sql#L508281) | — | 0 / 0 | — |
| `UBRelationshipList` | [L508320](../../../../ScriptDB/000_4_CreateSP.sql#L508320) | — | 5 / 0 | — |
| `UBRelationshipListTo` | [L508352](../../../../ScriptDB/000_4_CreateSP.sql#L508352) | — | 1 / 0 | — |
| `UBRepAccessInfo` | [L508384](../../../../ScriptDB/000_4_CreateSP.sql#L508384) | 1 / 1 file | 0 / 0 | [Member.cs:559](../../../../UBClasses/Member.cs#L559) |
| `UBRepActivityNewPuchase` | [L508441](../../../../ScriptDB/000_4_CreateSP.sql#L508441) | — | 0 / 1 | — |
| `UBRepActivityNewPuchaseSummary` | [L508544](../../../../ScriptDB/000_4_CreateSP.sql#L508544) | — | 0 / 1 | — |
| `UBRepActivitySummary` | [L508646](../../../../ScriptDB/000_4_CreateSP.sql#L508646) | — | 0 / 1 | — |
| `UBRepAssistantComboList` | [L508850](../../../../ScriptDB/000_4_CreateSP.sql#L508850) | — | 0 / 0 | — |
| `UBRepCodeAdd2TMPList` | [L508878](../../../../ScriptDB/000_4_CreateSP.sql#L508878) | 1 / 1 file | 0 / 1 | [Advisor.cs:571](../../../../UBClasses/Advisor.cs#L571) |
| `UBRepCodeChange` | [L508984](../../../../ScriptDB/000_4_CreateSP.sql#L508984) | — | 0 / 0 | — |
| `UBRepCodeCopy` | [L509050](../../../../ScriptDB/000_4_CreateSP.sql#L509050) | — | 0 / 1 | — |
| `UBRepCodeFromList` | [L509110](../../../../ScriptDB/000_4_CreateSP.sql#L509110) | 1 / 1 file | 4 / 0 | [Advisor.cs:507](../../../../UBClasses/Advisor.cs#L507) |
| `UBRepCodeInfo` | [L509166](../../../../ScriptDB/000_4_CreateSP.sql#L509166) | 2 / 2 file | 0 / 0 | [Member.cs:3588](../../../../UBClasses/Member.cs#L3588) |
| `UBRepCodeInfoAdd` | [L509190](../../../../ScriptDB/000_4_CreateSP.sql#L509190) | — | 0 / 2 | — |
| `UBRepCodeInfoTMP` | [L509354](../../../../ScriptDB/000_4_CreateSP.sql#L509354) | 1 / 1 file | 0 / 0 | [PanelRepCodeAdd.aspx.cs:82](../../../../WebApp/Main/PanelRepCodeAdd.aspx.cs#L82) |
| `UBRepCodeInfoUpdate` | [L509382](../../../../ScriptDB/000_4_CreateSP.sql#L509382) | — | 0 / 1 | — |
| `UBRepCodeList` | [L509486](../../../../ScriptDB/000_4_CreateSP.sql#L509486) | 1 / 1 file | 0 / 0 | [Advisor.cs:416](../../../../UBClasses/Advisor.cs#L416) |
| `UBRepCodeListFromArray` | [L509533](../../../../ScriptDB/000_4_CreateSP.sql#L509533) | — | 0 / 0 | — |
| `UBRepCodeRemove` | [L509560](../../../../ScriptDB/000_4_CreateSP.sql#L509560) | 1 / 1 file | 0 / 0 | [PanelRepCodeAdd.aspx.cs:308](../../../../WebApp/Main/PanelRepCodeAdd.aspx.cs#L308) |
| `UBRepCodeRemoveFromTMPList` | [L509605](../../../../ScriptDB/000_4_CreateSP.sql#L509605) | 1 / 1 file | 0 / 0 | [Advisor.cs:627](../../../../UBClasses/Advisor.cs#L627) |
| `UBRepCodeSelectList` | [L509652](../../../../ScriptDB/000_4_CreateSP.sql#L509652) | 1 / 1 file | 0 / 0 | [Member.cs:4315](../../../../UBClasses/Member.cs#L4315) |
| `UBRepCodeTMPEnd` | [L509708](../../../../ScriptDB/000_4_CreateSP.sql#L509708) | — | 0 / 0 | — |
| `UBReportAdd` | [L509769](../../../../ScriptDB/000_4_CreateSP.sql#L509769) | 1 / 1 file | 0 / 1 | [Customer.cs:3389](../../../../UBClasses/Customer.cs#L3389) |
| `UBReportAssetByProvProdTypeClean` | [L510529](../../../../ScriptDB/000_4_CreateSP.sql#L510529) | — | 0 / 0 | — |
| `UBReportAssetByProvProdTypeUpdate` | [L510542](../../../../ScriptDB/000_4_CreateSP.sql#L510542) | — | 3 / 0 | — |
| `UBReportAssetSurvey` | [L510592](../../../../ScriptDB/000_4_CreateSP.sql#L510592) | 1 / 1 file | 0 / 7 | [CAssetByFund.cs:1195](../../../../VieFUNDPdf/CAssetByFund.cs#L1195) |
| `UBReportAssetSurvey_Intemediary` | [L510988](../../../../ScriptDB/000_4_CreateSP.sql#L510988) | — | 0 / 0 | — |
| `UBReportAUAByIntClean` | [L511056](../../../../ScriptDB/000_4_CreateSP.sql#L511056) | — | 0 / 0 | — |
| `UBReportAUAByIntUpdate` | [L511080](../../../../ScriptDB/000_4_CreateSP.sql#L511080) | — | 1 / 0 | — |
| `UBReportBulletinGet` | [L511144](../../../../ScriptDB/000_4_CreateSP.sql#L511144) | 1 / 1 file | 0 / 0 | [CReport.cs:8753](../../../../VieFUNDPdf/CReport.cs#L8753) |
| `UBReportBulletinSave` | [L511167](../../../../ScriptDB/000_4_CreateSP.sql#L511167) | 1 / 1 file | 0 / 0 | [CReport.cs:8711](../../../../VieFUNDPdf/CReport.cs#L8711) |
| `UBReportColumnHeader` | [L551854](../../../../ScriptDB/000_4_CreateSP.sql#L551854) | — | 31 / 0 | — |
| `UBReportDefList` | [L551970](../../../../ScriptDB/000_4_CreateSP.sql#L551970) | — | 4 / 0 | — |
| `UBReportDisclaimer` | [L552059](../../../../ScriptDB/000_4_CreateSP.sql#L552059) | — | 13 / 0 | — |
| `UBReportDisclaimerGet` | [L552113](../../../../ScriptDB/000_4_CreateSP.sql#L552113) | — | 0 / 0 | — |
| `UBReportDisclaimerSet` | [L552141](../../../../ScriptDB/000_4_CreateSP.sql#L552141) | 1 / 1 file | 0 / 0 | [Export.cs:418](../../../../UBClasses/Export.cs#L418) |
| `UBReportDisclaimerX` | [L552201](../../../../ScriptDB/000_4_CreateSP.sql#L552201) | — | 1 / 0 | — |
| `UBReportDisclaimerXX` | [L552246](../../../../ScriptDB/000_4_CreateSP.sql#L552246) | — | 26 / 0 | — |
| `UBReportExRateTMPInit` | [L552319](../../../../ScriptDB/000_4_CreateSP.sql#L552319) | — | 1 / 0 | — |
| `UBReportImgGet` | [L562196](../../../../ScriptDB/000_4_CreateSP.sql#L562196) | — | 7 / 0 | — |
| `UBReportInsertAssign` | [L562229](../../../../ScriptDB/000_4_CreateSP.sql#L562229) | 2 / 1 file | 0 / 0 | [CInsert.cs:178](../../../../UBClasses/CInsert.cs#L178) |
| `UBReportListNotGeberatedButCouldBe` | [L562292](../../../../ScriptDB/000_4_CreateSP.sql#L562292) | — | 0 / 1 | — |
| `UBReportListNotGeneratedButCouldBe` | [L562327](../../../../ScriptDB/000_4_CreateSP.sql#L562327) | — | 0 / 1 | — |
| `UBReportLogAdd` | [L562362](../../../../ScriptDB/000_4_CreateSP.sql#L562362) | — | 1 / 0 | — |
| `UBReportOptComboList` | [L562432](../../../../ScriptDB/000_4_CreateSP.sql#L562432) | — | 0 / 6 | — |
| `UBReportOptComboListAdmin` | [L562452](../../../../ScriptDB/000_4_CreateSP.sql#L562452) | — | 0 / 6 | — |
| `UBReportOptComboListByUser` | [L562472](../../../../ScriptDB/000_4_CreateSP.sql#L562472) | — | 0 / 4 | — |
| `UBReportPieChart` | [L564220](../../../../ScriptDB/000_4_CreateSP.sql#L564220) | — | 19 / 0 | — |
| `UBReportRequest` | [L564960](../../../../ScriptDB/000_4_CreateSP.sql#L564960) | 1 / 1 file | 0 / 3 | [CReport.cs:378](../../../../VieFUNDPdf/CReport.cs#L378) |
| `UBReportRequestAdd` | [L565140](../../../../ScriptDB/000_4_CreateSP.sql#L565140) | 1 / 1 file | 0 / 1 | [CReport.cs:6497](../../../../VieFUNDPdf/CReport.cs#L6497) |
| `UBReportRequestAddTMP` | [L565308](../../../../ScriptDB/000_4_CreateSP.sql#L565308) | 1 / 1 file | 0 / 2 | [CReport.cs:6565](../../../../VieFUNDPdf/CReport.cs#L6565) |
| `UBReportRequestEnd` | [L565588](../../../../ScriptDB/000_4_CreateSP.sql#L565588) | 1 / 1 file | 0 / 0 | [CReport.cs:5205](../../../../VieFUNDPdf/CReport.cs#L5205) |
| `UBReportRequestRemove` | [L565634](../../../../ScriptDB/000_4_CreateSP.sql#L565634) | — | 0 / 0 | — |
| `UBReportRequestRerun` | [L565696](../../../../ScriptDB/000_4_CreateSP.sql#L565696) | — | 0 / 0 | — |
| `UBReportRequestTMP` | [L565746](../../../../ScriptDB/000_4_CreateSP.sql#L565746) | 1 / 1 file | 0 / 0 | [ClientReportAdhoc.cs:321](../../../../VieFUNDPdf/ClientReportAdhoc.cs#L321) |
| `UBReportRequestTMPEnd` | [L565788](../../../../ScriptDB/000_4_CreateSP.sql#L565788) | 1 / 1 file | 0 / 0 | [ClientReportAdhoc.cs:367](../../../../VieFUNDPdf/ClientReportAdhoc.cs#L367) |
| `UBReportSection` | [L565859](../../../../ScriptDB/000_4_CreateSP.sql#L565859) | — | 28 / 0 | — |
| `UBReportSectionInfo` | [L565899](../../../../ScriptDB/000_4_CreateSP.sql#L565899) | 1 / 1 file | 0 / 0 | [CReport.cs:8793](../../../../VieFUNDPdf/CReport.cs#L8793) |
| `UBReportSectionList` | [L565945](../../../../ScriptDB/000_4_CreateSP.sql#L565945) | — | 1 / 0 | — |
| `UBReportSectionUpdate` | [L565975](../../../../ScriptDB/000_4_CreateSP.sql#L565975) | 1 / 1 file | 0 / 0 | [CReport.cs:8847](../../../../VieFUNDPdf/CReport.cs#L8847) |
| `UBReportSettingGet` | [L566039](../../../../ScriptDB/000_4_CreateSP.sql#L566039) | 1 / 1 file | 0 / 1 | [Export.cs:278](../../../../UBClasses/Export.cs#L278) |
| `UBReportSettingInceptionSet` | [L566089](../../../../ScriptDB/000_4_CreateSP.sql#L566089) | — | 1 / 0 | — |
| `UBReportSettingSet` | [L566142](../../../../ScriptDB/000_4_CreateSP.sql#L566142) | 1 / 1 file | 0 / 3 | [Export.cs:368](../../../../UBClasses/Export.cs#L368) |
| `UBReportTaskAdd` | [L566195](../../../../ScriptDB/000_4_CreateSP.sql#L566195) | — | 0 / 1 | — |
| `UBReportTaskInfo` | [L567253](../../../../ScriptDB/000_4_CreateSP.sql#L567253) | — | 0 / 1 | — |
| `UBReportTaskInfoByObjID` | [L567319](../../../../ScriptDB/000_4_CreateSP.sql#L567319) | 1 / 1 file | 0 / 0 | [CReport.cs:5926](../../../../VieFUNDPdf/CReport.cs#L5926) |
| `UBReportTaskList` | [L567393](../../../../ScriptDB/000_4_CreateSP.sql#L567393) | — | 0 / 0 | — |
| `UBReportTaskRemove` | [L567444](../../../../ScriptDB/000_4_CreateSP.sql#L567444) | — | 0 / 0 | — |
| `UBReportTaskUpdate` | [L567526](../../../../ScriptDB/000_4_CreateSP.sql#L567526) | — | 0 / 0 | — |
| `UBReportTypeExtraGet` | [L567774](../../../../ScriptDB/000_4_CreateSP.sql#L567774) | 1 / 1 file | 1 / 0 | [Export.cs:457](../../../../UBClasses/Export.cs#L457) |
| `UBReportTypeExtraUpdate` | [L567803](../../../../ScriptDB/000_4_CreateSP.sql#L567803) | 1 / 1 file | 1 / 0 | [Export.cs:324](../../../../UBClasses/Export.cs#L324) |
| `UBResetIdentity` | [L567829](../../../../ScriptDB/000_4_CreateSP.sql#L567829) | — | 0 / 0 | — |
| `UBRevenueThresholdAdd` | [L574526](../../../../ScriptDB/000_4_CreateSP.sql#L574526) | 1 / 1 file | 0 / 0 | [CommissionDef.cs:578](../../../../UBClasses/CommissionDef.cs#L578) |
| `UBRevenueThresholdList` | [L574560](../../../../ScriptDB/000_4_CreateSP.sql#L574560) | 1 / 1 file | 0 / 0 | [CommissionDef.cs:667](../../../../UBClasses/CommissionDef.cs#L667) |
| `UBRevenueThresholdRemove` | [L574584](../../../../ScriptDB/000_4_CreateSP.sql#L574584) | 1 / 1 file | 0 / 0 | [CommissionDef.cs:620](../../../../UBClasses/CommissionDef.cs#L620) |
| `UBRiskObjAssessmentComboList` | [L574634](../../../../ScriptDB/000_4_CreateSP.sql#L574634) | — | 0 / 6 | — |
| `UBRLNextNumber` | [L584512](../../../../ScriptDB/000_4_CreateSP.sql#L584512) | — | 5 / 0 | — |
| `UBRORCalc` | [L584624](../../../../ScriptDB/000_4_CreateSP.sql#L584624) | — | 8 / 2 | — |
| `UBRORCalcList` | [L585777](../../../../ScriptDB/000_4_CreateSP.sql#L585777) | — | 10 / 2 | — |
| `UBRORCalcListX` | [L586623](../../../../ScriptDB/000_4_CreateSP.sql#L586623) | — | 1 / 2 | — |
| `UBRORCalcPosList` | [L587550](../../../../ScriptDB/000_4_CreateSP.sql#L587550) | — | 2 / 2 | — |
| `UBRORCalcX` | [L588014](../../../../ScriptDB/000_4_CreateSP.sql#L588014) | — | 1 / 2 | — |
| `UBRoRDefList` | [L588771](../../../../ScriptDB/000_4_CreateSP.sql#L588771) | — | 3 / 0 | — |
| `UBSaveSettings` | [L598136](../../../../ScriptDB/000_4_CreateSP.sql#L598136) | 2 / 2 file | 29 / 0 | [CBase.cs:1355](../../../../UBClasses/CBase.cs#L1355) |
| `UBScheduleGenerate` | [L598260](../../../../ScriptDB/000_4_CreateSP.sql#L598260) | — | 0 / 1 | — |
| `UBScheduleGenerateOne` | [L598320](../../../../ScriptDB/000_4_CreateSP.sql#L598320) | — | 2 / 3 | — |
| `UBScheduleGenerateOneUI` | [L598551](../../../../ScriptDB/000_4_CreateSP.sql#L598551) | 1 / 1 file | 0 / 1 | [Plan.cs:1880](../../../../UBClasses/Plan.cs#L1880) |
| `UBScheduleRemoveLastRunOne` | [L598576](../../../../ScriptDB/000_4_CreateSP.sql#L598576) | 1 / 1 file | 0 / 1 | [Plan.cs:1921](../../../../UBClasses/Plan.cs#L1921) |
| `UBScheduleRunList` | [L598686](../../../../ScriptDB/000_4_CreateSP.sql#L598686) | 1 / 1 file | 0 / 0 | [Trx.cs:6086](../../../../UBClasses/Trx.cs#L6086) |
| `UBScheduleRunRemove` | [L598713](../../../../ScriptDB/000_4_CreateSP.sql#L598713) | — | 0 / 1 | — |
| `UBServiceOnTimerFirstTime` | [L599758](../../../../ScriptDB/000_4_CreateSP.sql#L599758) | 1 / 1 file | 0 / 0 | [CDatabase.cs:1718](../../../../UBConnection/CDatabase.cs#L1718) |
| `UBServicesStats` | [L599792](../../../../ScriptDB/000_4_CreateSP.sql#L599792) | 1 / 1 file | 0 / 0 | [CBase.cs:7819](../../../../UBClasses/CBase.cs#L7819) |
| `UBSetEnvelopeToSignority` | [L600027](../../../../ScriptDB/000_4_CreateSP.sql#L600027) | 2 / 2 file | 0 / 0 | [ESignature.cs:527](../../../../UBClasses/ESignature.cs#L527) |
| `UBSettingList` | [L600071](../../../../ScriptDB/000_4_CreateSP.sql#L600071) | 1 / 1 file | 0 / 0 | [CBase.cs:1407](../../../../UBClasses/CBase.cs#L1407) |
| `UBSettingUpdateValue` | [L600109](../../../../ScriptDB/000_4_CreateSP.sql#L600109) | — | 2 / 0 | — |
| `UBSettingUpdateValueInt` | [L600149](../../../../ScriptDB/000_4_CreateSP.sql#L600149) | — | 3 / 1 | — |
| `UBSettingValue` | [L600171](../../../../ScriptDB/000_4_CreateSP.sql#L600171) | 2 / 2 file | 0 / 0 | [CBase.cs:1236](../../../../UBClasses/CBase.cs#L1236) |
| `UBSettingValue2` | [L600216](../../../../ScriptDB/000_4_CreateSP.sql#L600216) | — | 0 / 0 | — |
| `UBSettleViewComboList` | [L600260](../../../../ScriptDB/000_4_CreateSP.sql#L600260) | — | 0 / 11 | — |
| `UBSetupDSComboList` | [L600415](../../../../ScriptDB/000_4_CreateSP.sql#L600415) | — | 0 / 7 | — |
| `UBSexList` | [L600447](../../../../ScriptDB/000_4_CreateSP.sql#L600447) | — | 5 / 0 | — |
| `UBSignorityEnvelopeRecipientStatusUpdate` | [L600531](../../../../ScriptDB/000_4_CreateSP.sql#L600531) | 2 / 2 file | 0 / 0 | [ESignature.cs:610](../../../../UBClasses/ESignature.cs#L610) |
| `UBSignorityEnvelopeSetStatus` | [L600565](../../../../ScriptDB/000_4_CreateSP.sql#L600565) | 2 / 2 file | 0 / 1 | [ESignature.cs:386](../../../../UBClasses/ESignature.cs#L386) |
| `UBSplit2IntStr` | [L600601](../../../../ScriptDB/000_4_CreateSP.sql#L600601) | — | 0 / 0 | — |
| `UBSplit2Str` | [L600646](../../../../ScriptDB/000_4_CreateSP.sql#L600646) | — | 13 / 0 | — |
| `UBSplit2Str2` | [L600699](../../../../ScriptDB/000_4_CreateSP.sql#L600699) | — | 0 / 1 | — |
| `UBSplit2StrLast` | [L600727](../../../../ScriptDB/000_4_CreateSP.sql#L600727) | — | 0 / 0 | — |
| `UBSQLErrorInfo` | [L600771](../../../../ScriptDB/000_4_CreateSP.sql#L600771) | — | 21 / 0 | — |
| `UBStartPageList` | [L600819](../../../../ScriptDB/000_4_CreateSP.sql#L600819) | — | 1 / 0 | — |
| `UBStartUpComboList` | [L600855](../../../../ScriptDB/000_4_CreateSP.sql#L600855) | — | 0 / 1 | — |
| `UBStartupCountry` | [L600871](../../../../ScriptDB/000_4_CreateSP.sql#L600871) | — | 0 / 0 | — |
| `UBStartupProvince` | [L601163](../../../../ScriptDB/000_4_CreateSP.sql#L601163) | — | 0 / 0 | — |
| `UBStmtDeliveryList` | [L601264](../../../../ScriptDB/000_4_CreateSP.sql#L601264) | — | 8 / 0 | — |
| `UBStmtDeliveryListX` | [L601291](../../../../ScriptDB/000_4_CreateSP.sql#L601291) | — | 1 / 0 | — |
| `UBStmtGroupList` | [L601328](../../../../ScriptDB/000_4_CreateSP.sql#L601328) | — | 3 / 0 | — |
| `UBStmtTypeList` | [L601355](../../../../ScriptDB/000_4_CreateSP.sql#L601355) | — | 3 / 0 | — |
| `UBStockMarketList` | [L601870](../../../../ScriptDB/000_4_CreateSP.sql#L601870) | — | 1 / 0 | — |
| `UBSysID` | [L602710](../../../../ScriptDB/000_4_CreateSP.sql#L602710) | — | 1 / 0 | — |
| `UBSysID1912` | [L602886](../../../../ScriptDB/000_4_CreateSP.sql#L602886) | — | 1 / 0 | — |
| `UBSysIDCode` | [L602976](../../../../ScriptDB/000_4_CreateSP.sql#L602976) | — | 0 / 0 | — |
| `UBSysTypeList` | [L608560](../../../../ScriptDB/000_4_CreateSP.sql#L608560) | — | 4 / 0 | — |
| `UBT619Info` | [L632218](../../../../ScriptDB/000_4_CreateSP.sql#L632218) | 2 / 2 file | 26 / 0 | [T619.cs:41](../../../../UBClasses/T619.cs#L41) |
| `UBT619InfoUpdate` | [L632351](../../../../ScriptDB/000_4_CreateSP.sql#L632351) | 1 / 1 file | 0 / 1 | [T619.cs:189](../../../../UBClasses/T619.cs#L189) |
| `UBTAViewComboList` | [L632854](../../../../ScriptDB/000_4_CreateSP.sql#L632854) | — | 0 / 12 | — |
| `UBTAViewSearch` | [L632893](../../../../ScriptDB/000_4_CreateSP.sql#L632893) | 1 / 1 file | 0 / 3 | [TrustAccount.cs:1442](../../../../UBClasses/TrustAccount.cs#L1442) |
| `UBTAViewSearchCriteriaSave` | [L634603](../../../../ScriptDB/000_4_CreateSP.sql#L634603) | — | 1 / 1 | — |
| `UBTCPRelationshipList` | [L636841](../../../../ScriptDB/000_4_CreateSP.sql#L636841) | — | 1 / 0 | — |
| `UBTCPRemoveAll` | [L636873](../../../../ScriptDB/000_4_CreateSP.sql#L636873) | — | 1 / 1 | — |
| `UBTestDB` | [L636919](../../../../ScriptDB/000_4_CreateSP.sql#L636919) | — | 0 / 0 | — |
| `UBTitleList` | [L638931](../../../../ScriptDB/000_4_CreateSP.sql#L638931) | — | 9 / 0 | — |
| `UBTodayBusStr` | [L638963](../../../../ScriptDB/000_4_CreateSP.sql#L638963) | — | 0 / 0 | — |
| `UBTotalInvestmentList` | [L639393](../../../../ScriptDB/000_4_CreateSP.sql#L639393) | — | 6 / 0 | — |
| `UBTransferReminderAdd` | [L639429](../../../../ScriptDB/000_4_CreateSP.sql#L639429) | 1 / 1 file | 0 / 2 | [TransferReminder.cs:105](../../../../UBClasses/TransferReminder.cs#L105) |
| `UBTransferReminderDataSet` | [L639748](../../../../ScriptDB/000_4_CreateSP.sql#L639748) | 1 / 1 file | 0 / 0 | [CTransferDoc.cs:1480](../../../../VieFUNDPdf/CTransferDoc.cs#L1480) |
| `UBTransferReminderGetByID` | [L639783](../../../../ScriptDB/000_4_CreateSP.sql#L639783) | 1 / 1 file | 0 / 1 | [TransferReminder.cs:39](../../../../UBClasses/TransferReminder.cs#L39) |
| `UBTransferReminderInfo` | [L639886](../../../../ScriptDB/000_4_CreateSP.sql#L639886) | 1 / 1 file | 0 / 0 | [TransferReminder.cs:368](../../../../UBClasses/TransferReminder.cs#L368) |
| `UBTransferReminderLetterSet` | [L640058](../../../../ScriptDB/000_4_CreateSP.sql#L640058) | — | 0 / 4 | — |
| `UBTransferReminderPOASet` | [L640610](../../../../ScriptDB/000_4_CreateSP.sql#L640610) | — | 0 / 4 | — |
| `UBTransferReminderRemove` | [L641007](../../../../ScriptDB/000_4_CreateSP.sql#L641007) | 1 / 1 file | 0 / 0 | [TransferReminder.cs:190](../../../../UBClasses/TransferReminder.cs#L190) |
| `UBTransferReminderReRegSet` | [L641051](../../../../ScriptDB/000_4_CreateSP.sql#L641051) | — | 0 / 3 | — |
| `UBTransferReminderSaveObj` | [L641364](../../../../ScriptDB/000_4_CreateSP.sql#L641364) | 1 / 1 file | 0 / 0 | [CTransferDoc.cs:1534](../../../../VieFUNDPdf/CTransferDoc.cs#L1534) |
| `UBTransferReminderSearch` | [L641427](../../../../ScriptDB/000_4_CreateSP.sql#L641427) | 1 / 1 file | 0 / 1 | [TransferReminder.cs:243](../../../../UBClasses/TransferReminder.cs#L243) |
| `UBTransferReminderUpdate` | [L641975](../../../../ScriptDB/000_4_CreateSP.sql#L641975) | 1 / 1 file | 0 / 2 | [TransferReminder.cs:105](../../../../UBClasses/TransferReminder.cs#L105) |
| `UBTransferStatusList` | [L642238](../../../../ScriptDB/000_4_CreateSP.sql#L642238) | — | 2 / 0 | — |
| `UBTransferTypeList` | [L642263](../../../../ScriptDB/000_4_CreateSP.sql#L642263) | — | 2 / 0 | — |
| `UBTrnsfReminderCategoryList` | [L642288](../../../../ScriptDB/000_4_CreateSP.sql#L642288) | — | 2 / 0 | — |
| `UBTSHErrorLogList` | [L680675](../../../../ScriptDB/000_4_CreateSP.sql#L680675) | 1 / 1 file | 0 / 0 | [CAdhocTSFileImport.cs:614](../../../../UBFFImport/CAdhocTSFileImport.cs#L614) |
| `UBTSHFileProcessTaggedItems` | [L680794](../../../../ScriptDB/000_4_CreateSP.sql#L680794) | — | 0 / 1 | — |
| `UBTSHFileScan` | [L680874](../../../../ScriptDB/000_4_CreateSP.sql#L680874) | — | 0 / 0 | — |
| `UBTSHFileView` | [L680910](../../../../ScriptDB/000_4_CreateSP.sql#L680910) | 1 / 1 file | 0 / 0 | [CAdhocTSFileImport.cs:332](../../../../UBFFImport/CAdhocTSFileImport.cs#L332) |
| `UBTSHFileViewSelectionUpdate` | [L681167](../../../../ScriptDB/000_4_CreateSP.sql#L681167) | — | 0 / 0 | — |
| `UBTSHImportComboList` | [L681204](../../../../ScriptDB/000_4_CreateSP.sql#L681204) | — | 0 / 1 | — |
| `UBTSSkipRecordComboList` | [L681229](../../../../ScriptDB/000_4_CreateSP.sql#L681229) | — | 0 / 1 | — |
| `UBTSSkipRecordImportTaggedItems` | [L681254](../../../../ScriptDB/000_4_CreateSP.sql#L681254) | — | 0 / 1 | — |
| `UBTSSkipRecordRejectTaggedItems` | [L681302](../../../../ScriptDB/000_4_CreateSP.sql#L681302) | — | 0 / 0 | — |
| `UBTSSkipRecordView` | [L681331](../../../../ScriptDB/000_4_CreateSP.sql#L681331) | 1 / 1 file | 0 / 0 | [CAdhocTSFileImport.cs:394](../../../../UBFFImport/CAdhocTSFileImport.cs#L394) |
| `UBUserDefinedDefAdd` | [L682801](../../../../ScriptDB/000_4_CreateSP.sql#L682801) | 1 / 1 file | 0 / 0 | [UserDefinedField.cs:458](../../../../UBClasses/UserDefinedField.cs#L458) |
| `UBUserDefinedDefComboList` | [L682858](../../../../ScriptDB/000_4_CreateSP.sql#L682858) | — | 1 / 0 | — |
| `UBUserDefinedDefList` | [L682884](../../../../ScriptDB/000_4_CreateSP.sql#L682884) | 1 / 1 file | 0 / 0 | [UserDefinedField.cs:359](../../../../UBClasses/UserDefinedField.cs#L359) |
| `UBUserDefinedDefRemove` | [L682977](../../../../ScriptDB/000_4_CreateSP.sql#L682977) | 1 / 1 file | 0 / 0 | [UserDefinedField.cs:517](../../../../UBClasses/UserDefinedField.cs#L517) |
| `UBUserDefinedDefUpdate` | [L683010](../../../../ScriptDB/000_4_CreateSP.sql#L683010) | 1 / 1 file | 0 / 0 | [UserDefinedField.cs:458](../../../../UBClasses/UserDefinedField.cs#L458) |
| `UBViewColumnAdd` | [L683052](../../../../ScriptDB/000_4_CreateSP.sql#L683052) | — | 0 / 0 | — |
| `UBViewColumnList` | [L683085](../../../../ScriptDB/000_4_CreateSP.sql#L683085) | 1 / 1 file | 59 / 0 | [CBase.cs:3111](../../../../UBClasses/CBase.cs#L3111) |
| `UBViewColumnRemove` | [L683163](../../../../ScriptDB/000_4_CreateSP.sql#L683163) | — | 0 / 0 | — |
| `UBViewColumnRename` | [L683193](../../../../ScriptDB/000_4_CreateSP.sql#L683193) | — | 0 / 0 | — |
| `UBViewColumnUpdate` | [L683224](../../../../ScriptDB/000_4_CreateSP.sql#L683224) | — | 0 / 0 | — |
| `UBViewHeaderAdd` | [L683264](../../../../ScriptDB/000_4_CreateSP.sql#L683264) | 1 / 1 file | 0 / 0 | [ViewHeader.cs:39](../../../../UBClasses/ViewHeader.cs#L39) |
| `UBViewHeaderList` | [L683310](../../../../ScriptDB/000_4_CreateSP.sql#L683310) | — | 0 / 0 | — |
| `UBViewHeaderRemove` | [L683505](../../../../ScriptDB/000_4_CreateSP.sql#L683505) | 1 / 1 file | 0 / 0 | [ViewHeader.cs:93](../../../../UBClasses/ViewHeader.cs#L93) |
| `UBWCAddressRequestList` | [L683565](../../../../ScriptDB/000_4_CreateSP.sql#L683565) | 1 / 1 file | 0 / 1 | [CAddress.cs:340](../../../../UBClasses/CAddress.cs#L340) |
| `UBWCRegistrationApprove` | [L683682](../../../../ScriptDB/000_4_CreateSP.sql#L683682) | 1 / 1 file | 0 / 2 | [Customer.cs:4164](../../../../UBClasses/Customer.cs#L4164) |
| `UBWCRegistrationApproveComboList` | [L683863](../../../../ScriptDB/000_4_CreateSP.sql#L683863) | — | 0 / 2 | — |
| `UBWCRegistrationRequestAdd` | [L684056](../../../../ScriptDB/000_4_CreateSP.sql#L684056) | 1 / 1 file | 0 / 0 | [Customer.cs:3960](../../../../UBClasses/Customer.cs#L3960) |
| `UBWCRequestInfo` | [L684361](../../../../ScriptDB/000_4_CreateSP.sql#L684361) | 1 / 1 file | 0 / 0 | [Customer.cs:4075](../../../../UBClasses/Customer.cs#L4075) |
| `UBWCRequestList` | [L684403](../../../../ScriptDB/000_4_CreateSP.sql#L684403) | 1 / 1 file | 0 / 1 | [Customer.cs:4017](../../../../UBClasses/Customer.cs#L4017) |
| `UBWCRequestRemove` | [L684533](../../../../ScriptDB/000_4_CreateSP.sql#L684533) | 1 / 1 file | 0 / 0 | [Customer.cs:4220](../../../../UBClasses/Customer.cs#L4220) |
| `UBWebAppUserList` | [L684562](../../../../ScriptDB/000_4_CreateSP.sql#L684562) | 1 / 1 file | 0 / 0 | [WFPassword.aspx.cs:581](../../../../WebApp/Main/WFPassword.aspx.cs#L581) |
| `UBWeekDayList` | [L685342](../../../../ScriptDB/000_4_CreateSP.sql#L685342) | — | 0 / 0 | — |
| `UBWorkGroupDefAdd` | [L685796](../../../../ScriptDB/000_4_CreateSP.sql#L685796) | 1 / 1 file | 0 / 0 | [Member.cs:4850](../../../../UBClasses/Member.cs#L4850) |
| `UBWorkGroupDefList` | [L685819](../../../../ScriptDB/000_4_CreateSP.sql#L685819) | — | 1 / 0 | — |
| `UBXGlobeAdvisor` | [L685836](../../../../ScriptDB/000_4_CreateSP.sql#L685836) | 1 / 1 file | 0 / 0 | [Plan.cs:3633](../../../../UBClasses/Plan.cs#L3633) |
| `UBXGlobeAdvisorExcel` | [L685966](../../../../ScriptDB/000_4_CreateSP.sql#L685966) | 1 / 1 file | 0 / 0 | [Plan.cs:3559](../../../../UBClasses/Plan.cs#L3559) |
| `UBXIRR` | [L686065](../../../../ScriptDB/000_4_CreateSP.sql#L686065) | — | 16 / 0 | — |
| `UBXML2TMP_Address` | [L686168](../../../../ScriptDB/000_4_CreateSP.sql#L686168) | — | 0 / 0 | — |
| `UBXML2TMP_BankInfo` | [L686208](../../../../ScriptDB/000_4_CreateSP.sql#L686208) | — | 0 / 0 | — |
| `UBXML2TMP_BSPRec` | [L686244](../../../../ScriptDB/000_4_CreateSP.sql#L686244) | — | 0 / 0 | — |
| `UBXML2TMP_BulkRec` | [L686323](../../../../ScriptDB/000_4_CreateSP.sql#L686323) | — | 0 / 0 | — |
| `UBXML2TMP_CDICData` | [L686376](../../../../ScriptDB/000_4_CreateSP.sql#L686376) | — | 0 / 0 | — |
| `UBXML2TMP_ChequeInfo` | [L686409](../../../../ScriptDB/000_4_CreateSP.sql#L686409) | — | 0 / 0 | — |
| `UBXML2TMP_Clear` | [L686451](../../../../ScriptDB/000_4_CreateSP.sql#L686451) | — | 0 / 0 | — |
| `UBXML2TMP_ControllingPerson` | [L686598](../../../../ScriptDB/000_4_CreateSP.sql#L686598) | — | 0 / 0 | — |
| `UBXML2TMP_DivRedirect` | [L686629](../../../../ScriptDB/000_4_CreateSP.sql#L686629) | — | 0 / 0 | — |
| `UBXML2TMP_IDVerify` | [L686665](../../../../ScriptDB/000_4_CreateSP.sql#L686665) | — | 0 / 0 | — |
| `UBXML2TMP_IndividualTIN` | [L686701](../../../../ScriptDB/000_4_CreateSP.sql#L686701) | — | 0 / 0 | — |
| `UBXML2TMP_LARec` | [L686737](../../../../ScriptDB/000_4_CreateSP.sql#L686737) | — | 0 / 0 | — |
| `UBXML2TMP_LARecHeader` | [L686818](../../../../ScriptDB/000_4_CreateSP.sql#L686818) | — | 0 / 1 | — |
| `UBXML2TMP_LSRec` | [L686880](../../../../ScriptDB/000_4_CreateSP.sql#L686880) | — | 0 / 0 | — |
| `UBXML2TMP_LSRecDetail` | [L686966](../../../../ScriptDB/000_4_CreateSP.sql#L686966) | — | 0 / 0 | — |
| `UBXML2TMP_LSRecHeader` | [L687035](../../../../ScriptDB/000_4_CreateSP.sql#L687035) | — | 0 / 1 | — |
| `UBXML2TMP_OrganizationTIN` | [L687124](../../../../ScriptDB/000_4_CreateSP.sql#L687124) | — | 0 / 0 | — |
| `UBXMLAddressAdd` | [L687528](../../../../ScriptDB/000_4_CreateSP.sql#L687528) | — | 8 / 2 | — |
| `UBXMLBenAdd` | [L687662](../../../../ScriptDB/000_4_CreateSP.sql#L687662) | — | 2 / 3 | — |
| `UBXMLForeignEntityAdd` | [L688617](../../../../ScriptDB/000_4_CreateSP.sql#L688617) | — | 4 / 2 | — |
| `UBXMLForeignPersonAdd` | [L688764](../../../../ScriptDB/000_4_CreateSP.sql#L688764) | — | 5 / 0 | — |
| `UBXMLIDVerifyAdd` | [L688853](../../../../ScriptDB/000_4_CreateSP.sql#L688853) | — | 2 / 1 | — |
| `UBXMLITFAdd` | [L688922](../../../../ScriptDB/000_4_CreateSP.sql#L688922) | — | 2 / 4 | — |
| `UBXMLJointAdd` | [L689024](../../../../ScriptDB/000_4_CreateSP.sql#L689024) | — | 2 / 4 | — |
| `UBXMLRecBSProcessAll` | [L689174](../../../../ScriptDB/000_4_CreateSP.sql#L689174) | — | 0 / 1 | — |
| `UBXMLRecBSProcessChunk` | [L689228](../../../../ScriptDB/000_4_CreateSP.sql#L689228) | 1 / 1 file | 0 / 1 | [CBS.cs:269](../../../../UBFFImport/CBS.cs#L269) |
| `UBXMLRecBSProcessOne` | [L689291](../../../../ScriptDB/000_4_CreateSP.sql#L689291) | — | 2 / 0 | — |
| `UBXMLRecDefASM` | [L689938](../../../../ScriptDB/000_4_CreateSP.sql#L689938) | — | 0 / 0 | — |
| `UBXMLRecDefBSP` | [L689960](../../../../ScriptDB/000_4_CreateSP.sql#L689960) | — | 0 / 0 | — |
| `UBXMLRecDefDR` | [L689976](../../../../ScriptDB/000_4_CreateSP.sql#L689976) | — | 0 / 0 | — |
| `UBXMLRecDefFD` | [L690001](../../../../ScriptDB/000_4_CreateSP.sql#L690001) | — | 0 / 0 | — |
| `UBXMLRecDefFDAA` | [L690028](../../../../ScriptDB/000_4_CreateSP.sql#L690028) | — | 0 / 0 | — |
| `UBXMLRecDefFDCAA` | [L690055](../../../../ScriptDB/000_4_CreateSP.sql#L690055) | — | 0 / 0 | — |
| `UBXMLRecDefFDModel` | [L690082](../../../../ScriptDB/000_4_CreateSP.sql#L690082) | — | 0 / 0 | — |
| `UBXMLRecDefFSP` | [L690109](../../../../ScriptDB/000_4_CreateSP.sql#L690109) | — | 0 / 0 | — |
| `UBXMLRecDefLA` | [L690135](../../../../ScriptDB/000_4_CreateSP.sql#L690135) | — | 0 / 0 | — |
| `UBXMLRecDefLS` | [L690162](../../../../ScriptDB/000_4_CreateSP.sql#L690162) | — | 0 / 0 | — |
| `UBXMLRecDefNSP` | [L690192](../../../../ScriptDB/000_4_CreateSP.sql#L690192) | — | 0 / 0 | — |
| `UBXMLRecDefPSP` | [L690243](../../../../ScriptDB/000_4_CreateSP.sql#L690243) | — | 0 / 0 | — |
| `UBXMLRecDefRS` | [L690262](../../../../ScriptDB/000_4_CreateSP.sql#L690262) | — | 0 / 0 | — |
| `UBXMLRecDefTCR` | [L690287](../../../../ScriptDB/000_4_CreateSP.sql#L690287) | — | 0 / 0 | — |
| `UBXMLRecDefWSP` | [L690365](../../../../ScriptDB/000_4_CreateSP.sql#L690365) | — | 0 / 0 | — |
| `UBXMLRecDefXR` | [L690390](../../../../ScriptDB/000_4_CreateSP.sql#L690390) | — | 0 / 0 | — |
| `UBXMLRecFDCheckMgmt` | [L691065](../../../../ScriptDB/000_4_CreateSP.sql#L691065) | — | 0 / 0 | — |
| `UBXMLRecFDProcess` | [L691201](../../../../ScriptDB/000_4_CreateSP.sql#L691201) | 1 / 1 file | 0 / 8 | [CFD.cs:908](../../../../UBFFImport/CFD.cs#L908) |
| `UBXMLRecFDProcessAA` | [L691875](../../../../ScriptDB/000_4_CreateSP.sql#L691875) | 1 / 1 file | 0 / 0 | [CFD.cs:974](../../../../UBFFImport/CFD.cs#L974) |
| `UBXMLRecFDProcessCAA` | [L691935](../../../../ScriptDB/000_4_CreateSP.sql#L691935) | 1 / 1 file | 0 / 0 | [CFD.cs:1007](../../../../UBFFImport/CFD.cs#L1007) |
| `UBXMLRecFDProcessEnd` | [L691975](../../../../ScriptDB/000_4_CreateSP.sql#L691975) | 1 / 1 file | 0 / 0 | [CFD.cs:1063](../../../../UBFFImport/CFD.cs#L1063) |
| `UBXMLRecFDProcessModel` | [L692013](../../../../ScriptDB/000_4_CreateSP.sql#L692013) | 1 / 1 file | 0 / 0 | [CFD.cs:1031](../../../../UBFFImport/CFD.cs#L1031) |
| `UBXMLRecFDProcessTerminate` | [L692069](../../../../ScriptDB/000_4_CreateSP.sql#L692069) | 1 / 1 file | 0 / 3 | [CFD.cs:1122](../../../../UBFFImport/CFD.cs#L1122) |
| `UBXMLRecLAProcessChunk` | [L692138](../../../../ScriptDB/000_4_CreateSP.sql#L692138) | 1 / 1 file | 0 / 1 | [CLA.cs:441](../../../../UBFFImport/CLA.cs#L441) |
| `UBXMLRecLAProcessOne` | [L692208](../../../../ScriptDB/000_4_CreateSP.sql#L692208) | — | 1 / 1 | — |
| `UBXMLRecListFD` | [L692408](../../../../ScriptDB/000_4_CreateSP.sql#L692408) | — | 0 / 0 | — |
| `UBXMLRecLSProcessAll` | [L692436](../../../../ScriptDB/000_4_CreateSP.sql#L692436) | 1 / 1 file | 0 / 1 | [CLS.cs:608](../../../../UBFFImport/CLS.cs#L608) |
| `UBXMLRecLSProcessChunk` | [L692491](../../../../ScriptDB/000_4_CreateSP.sql#L692491) | 1 / 1 file | 0 / 1 | [CLS.cs:546](../../../../UBFFImport/CLS.cs#L546) |
| `UBXMLRecLSProcessOne` | [L692562](../../../../ScriptDB/000_4_CreateSP.sql#L692562) | — | 3 / 1 | — |
| `UBXMLRecNSPProcess` | [L693142](../../../../ScriptDB/000_4_CreateSP.sql#L693142) | 1 / 1 file | 5 / 15 | [CAA.cs:2532](../../../../UBFFImport/CAA.cs#L2532) |
| `UBXMLRecNSPProcess_Seg` | [L694185](../../../../ScriptDB/000_4_CreateSP.sql#L694185) | — | 1 / 0 | — |
| `UBXMLRecProcess_CDICData` | [L695055](../../../../ScriptDB/000_4_CreateSP.sql#L695055) | — | 1 / 0 | — |
| `UBXMLRecPSPProcess` | [L695099](../../../../ScriptDB/000_4_CreateSP.sql#L695099) | 1 / 1 file | 1 / 1 | [CAA.cs:2363](../../../../UBFFImport/CAA.cs#L2363) |
| `UBXMLRecPSPProcess_Record` | [L695905](../../../../ScriptDB/000_4_CreateSP.sql#L695905) | — | 0 / 1 | — |
| `UBXMLRecPSPSave` | [L696057](../../../../ScriptDB/000_4_CreateSP.sql#L696057) | 1 / 1 file | 0 / 0 | [CAA.cs:2453](../../../../UBFFImport/CAA.cs#L2453) |
| `UBXMLRecROC_A` | [L696180](../../../../ScriptDB/000_4_CreateSP.sql#L696180) | — | 2 / 1 | — |
| `UBXMLRecRSProcess` | [L696226](../../../../ScriptDB/000_4_CreateSP.sql#L696226) | 1 / 1 file | 0 / 0 | [CAP.cs:609](../../../../UBFFImport/CAP.cs#L609) |
| `UBXMLRecRSProcess5` | [L696511](../../../../ScriptDB/000_4_CreateSP.sql#L696511) | 1 / 1 file | 0 / 1 | [CAP.cs:527](../../../../UBFFImport/CAP.cs#L527) |
| `UBXMLRecRSProcessOne` | [L696618](../../../../ScriptDB/000_4_CreateSP.sql#L696618) | — | 1 / 0 | — |
| `UBXMLRecSaveFD` | [L696898](../../../../ScriptDB/000_4_CreateSP.sql#L696898) | 1 / 1 file | 0 / 0 | [CFD.cs:956](../../../../UBFFImport/CFD.cs#L956) |
| `UBXMLRecTCRProcess` | [L696927](../../../../ScriptDB/000_4_CreateSP.sql#L696927) | 1 / 1 file | 0 / 0 | [CTCRFile.cs:269](../../../../UBFFImport/CTCRFile.cs#L269) |
| `UBXMLRecWSProcess` | [L705794](../../../../ScriptDB/000_4_CreateSP.sql#L705794) | 1 / 1 file | 0 / 1 | [CAW.cs:724](../../../../UBFFImport/CAW.cs#L724) |
| `UBXMLSettingsModify` | [L706183](../../../../ScriptDB/000_4_CreateSP.sql#L706183) | — | 2 / 1 | — |
| `UBXMLSpouseAdd` | [L706259](../../../../ScriptDB/000_4_CreateSP.sql#L706259) | — | 2 / 1 | — |
| `VF_VF_AllNotes` | [L708500](../../../../ScriptDB/000_4_CreateSP.sql#L708500) | — | 0 / 0 | — |
| `VF_VF_AllReportTask` | [L708886](../../../../ScriptDB/000_4_CreateSP.sql#L708886) | — | 0 / 1 | — |
| `VF_VF_AllSpouse` | [L708944](../../../../ScriptDB/000_4_CreateSP.sql#L708944) | — | 1 / 1 | — |
| `VF_VF_AllSpouseX` | [L708989](../../../../ScriptDB/000_4_CreateSP.sql#L708989) | — | 0 / 1 | — |
| `VF_VF_BankVerify` | [L709247](../../../../ScriptDB/000_4_CreateSP.sql#L709247) | — | 2 / 0 | — |
| `VF_VF_BankVerifyX` | [L709326](../../../../ScriptDB/000_4_CreateSP.sql#L709326) | — | 2 / 0 | — |
| `VF_VF_GetDealerRepCode` | [L709419](../../../../ScriptDB/000_4_CreateSP.sql#L709419) | — | 0 / 0 | — |
| `VF_VF_Member_All` | [L709683](../../../../ScriptDB/000_4_CreateSP.sql#L709683) | — | 0 / 1 | — |
| `VF_VF_Member_One` | [L709758](../../../../ScriptDB/000_4_CreateSP.sql#L709758) | — | 1 / 0 | — |
| `VF_VF_OneAddress` | [L710304](../../../../ScriptDB/000_4_CreateSP.sql#L710304) | — | 6 / 0 | — |
| `VF_VF_OneAddressX` | [L710342](../../../../ScriptDB/000_4_CreateSP.sql#L710342) | — | 2 / 0 | — |
| `VF_VF_OneEmployment` | [L711174](../../../../ScriptDB/000_4_CreateSP.sql#L711174) | — | 1 / 0 | — |
| `VF_VF_OneEmploymentX` | [L711196](../../../../ScriptDB/000_4_CreateSP.sql#L711196) | — | 1 / 0 | — |
| `VF_VF_OneExtraInfo` | [L711222](../../../../ScriptDB/000_4_CreateSP.sql#L711222) | — | 1 / 0 | — |
| `VF_VF_OneExtraInfoX` | [L711281](../../../../ScriptDB/000_4_CreateSP.sql#L711281) | — | 1 / 0 | — |
| `VF_VF_OneFinInfo` | [L711345](../../../../ScriptDB/000_4_CreateSP.sql#L711345) | — | 1 / 0 | — |
| `VF_VF_OneFinInfoX` | [L711397](../../../../ScriptDB/000_4_CreateSP.sql#L711397) | — | 1 / 0 | — |
| `VF_VF_OnePhone` | [L711587](../../../../ScriptDB/000_4_CreateSP.sql#L711587) | — | 7 / 0 | — |
| `VF_VF_OnePhoneX` | [L711625](../../../../ScriptDB/000_4_CreateSP.sql#L711625) | — | 4 / 0 | — |
| `VF_VF_OneSpouse` | [L712910](../../../../ScriptDB/000_4_CreateSP.sql#L712910) | — | 1 / 2 | — |
| `VF_VF_OneSpouseX` | [L713000](../../../../ScriptDB/000_4_CreateSP.sql#L713000) | — | 1 / 2 | — |
| `VF_VF_OneTaskReportObj` | [L713086](../../../../ScriptDB/000_4_CreateSP.sql#L713086) | — | 1 / 0 | — |
| `VF_VF_TCPOne` | [L713230](../../../../ScriptDB/000_4_CreateSP.sql#L713230) | — | 0 / 1 | — |
| `VF_VF_TCPOnePerson` | [L713257](../../../../ScriptDB/000_4_CreateSP.sql#L713257) | — | 1 / 2 | — |
| `WeekDatesList` | [L713377](../../../../ScriptDB/000_4_CreateSP.sql#L713377) | — | 0 / 0 | — |
| `XMLCreateNode` | [L713732](../../../../ScriptDB/000_4_CreateSP.sql#L713732) | — | 2 / 0 | — |
| `XMLCreateNodeF2` | [L713752](../../../../ScriptDB/000_4_CreateSP.sql#L713752) | — | 0 / 0 | — |
| `XMLCreateNodeF4` | [L713775](../../../../ScriptDB/000_4_CreateSP.sql#L713775) | — | 0 / 0 | — |
| `XMLCreateNodeI` | [L713798](../../../../ScriptDB/000_4_CreateSP.sql#L713798) | — | 2 / 0 | — |
