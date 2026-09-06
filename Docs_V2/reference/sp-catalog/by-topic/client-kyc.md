# SP Catalog — Client & KYC

> Phân nhóm gợi ý theo tên procedure. Các cột caller mới là bằng chứng truy vết; `—` không có nghĩa procedure không được dùng.

**Tổng**: 498 definition; 156 có tên tĩnh từ C#; 176 được procedure khác gọi qua EXEC/EXECUTE.

| Procedure | Definition | C# tĩnh | SQL gọi vào / gọi ra | Caller C# mẫu |
|---|---:|---:|---:|---|
| `AMF_ClientAUAByRep` | [L21076](../../../../ScriptDB/000_4_CreateSP.sql#L21076) | — | 0 / 0 | — |
| `ChangeClientUserDefine1Rep` | [L21678](../../../../ScriptDB/000_4_CreateSP.sql#L21678) | — | 0 / 0 | — |
| `ClientSearchSpecial_2Test` | [L22015](../../../../ScriptDB/000_4_CreateSP.sql#L22015) | — | 0 / 0 | — |
| `CON_AuditTrailInitFixClient` | [L23627](../../../../ScriptDB/000_4_CreateSP.sql#L23627) | — | 0 / 1 | — |
| `CON_Axis_VF_Client_All` | [L24155](../../../../ScriptDB/000_4_CreateSP.sql#L24155) | — | 0 / 1 | — |
| `CON_Axis_VF_Client_One` | [L24191](../../../../ScriptDB/000_4_CreateSP.sql#L24191) | — | 1 / 2 | — |
| `CON_CopyClientKYC` | [L25850](../../../../ScriptDB/000_4_CreateSP.sql#L25850) | — | 1 / 0 | — |
| `CON_CopyClientKYC_All` | [L26156](../../../../ScriptDB/000_4_CreateSP.sql#L26156) | — | 0 / 1 | — |
| `CON_CWM_1Client` | [L26535](../../../../ScriptDB/000_4_CreateSP.sql#L26535) | — | 0 / 3 | — |
| `CON_DES_Client1` | [L27061](../../../../ScriptDB/000_4_CreateSP.sql#L27061) | — | 1 / 2 | — |
| `CON_DESC_Client` | [L27197](../../../../ScriptDB/000_4_CreateSP.sql#L27197) | — | 0 / 1 | — |
| `CON_OB_Client` | [L29289](../../../../ScriptDB/000_4_CreateSP.sql#L29289) | — | 0 / 6 | — |
| `CON_OB_Intermediary` | [L31572](../../../../ScriptDB/000_4_CreateSP.sql#L31572) | — | 0 / 1 | — |
| `CON_PRIV_1Client` | [L34703](../../../../ScriptDB/000_4_CreateSP.sql#L34703) | — | 1 / 2 | — |
| `CON_PRIV_Client` | [L34953](../../../../ScriptDB/000_4_CreateSP.sql#L34953) | — | 0 / 1 | — |
| `CON_UN_Client` | [L35941](../../../../ScriptDB/000_4_CreateSP.sql#L35941) | — | 0 / 1 | — |
| `CON_UN_Client_One` | [L35980](../../../../ScriptDB/000_4_CreateSP.sql#L35980) | — | 1 / 5 | — |
| `CON_UN_Client_OneID` | [L36625](../../../../ScriptDB/000_4_CreateSP.sql#L36625) | — | 0 / 0 | — |
| `CON_UN_Client_OneTCP` | [L36680](../../../../ScriptDB/000_4_CreateSP.sql#L36680) | — | 1 / 0 | — |
| `CON_UN_Family` | [L36793](../../../../ScriptDB/000_4_CreateSP.sql#L36793) | — | 0 / 1 | — |
| `CON_UN_FamilyOne` | [L36834](../../../../ScriptDB/000_4_CreateSP.sql#L36834) | — | 1 / 0 | — |
| `CON_VerifyClientInactive` | [L37935](../../../../ScriptDB/000_4_CreateSP.sql#L37935) | — | 0 / 0 | — |
| `CON_VerifyClientStatus` | [L37983](../../../../ScriptDB/000_4_CreateSP.sql#L37983) | — | 0 / 0 | — |
| `CON_WF_AuditTrailResetClientOneRep` | [L39487](../../../../ScriptDB/000_4_CreateSP.sql#L39487) | — | 1 / 1 | — |
| `CON_WF_Client` | [L40866](../../../../ScriptDB/000_4_CreateSP.sql#L40866) | — | 2 / 8 | — |
| `CON_WF_Client_Topup` | [L41821](../../../../ScriptDB/000_4_CreateSP.sql#L41821) | — | 0 / 11 | — |
| `CON_WF_Client_Topup_Step1` | [L42961](../../../../ScriptDB/000_4_CreateSP.sql#L42961) | — | 0 / 0 | — |
| `CON_WF_Client_Topup_Step2` | [L42988](../../../../ScriptDB/000_4_CreateSP.sql#L42988) | — | 0 / 8 | — |
| `CON_WF_Client_Topup_Step3` | [L44006](../../../../ScriptDB/000_4_CreateSP.sql#L44006) | — | 0 / 7 | — |
| `CON_WF_ClientAddressLog` | [L44914](../../../../ScriptDB/000_4_CreateSP.sql#L44914) | — | 1 / 0 | — |
| `CON_WF_ClientAddressLogAll` | [L44949](../../../../ScriptDB/000_4_CreateSP.sql#L44949) | — | 0 / 1 | — |
| `CON_WF_ClientBankAll` | [L45021](../../../../ScriptDB/000_4_CreateSP.sql#L45021) | — | 0 / 1 | — |
| `CON_WF_ClientBankOne` | [L45047](../../../../ScriptDB/000_4_CreateSP.sql#L45047) | — | 4 / 0 | — |
| `CON_WF_ClientBankOneUpdate` | [L45144](../../../../ScriptDB/000_4_CreateSP.sql#L45144) | — | 2 / 0 | — |
| `CON_WF_ClientCheckRep` | [L45226](../../../../ScriptDB/000_4_CreateSP.sql#L45226) | — | 1 / 0 | — |
| `CON_WF_ClientID` | [L45269](../../../../ScriptDB/000_4_CreateSP.sql#L45269) | — | 0 / 0 | — |
| `CON_WF_ClientList` | [L45289](../../../../ScriptDB/000_4_CreateSP.sql#L45289) | — | 0 / 0 | — |
| `CON_WF_ClientNoFileID_OneRep` | [L45313](../../../../ScriptDB/000_4_CreateSP.sql#L45313) | — | 0 / 0 | — |
| `CON_WF_ClientOne` | [L45341](../../../../ScriptDB/000_4_CreateSP.sql#L45341) | — | 0 / 7 | — |
| `CON_WF_Family` | [L48227](../../../../ScriptDB/000_4_CreateSP.sql#L48227) | — | 0 / 1 | — |
| `CON_WF_Family_OneRep` | [L48283](../../../../ScriptDB/000_4_CreateSP.sql#L48283) | — | 0 / 1 | — |
| `CON_WF_FamilyOne` | [L48366](../../../../ScriptDB/000_4_CreateSP.sql#L48366) | — | 1 / 0 | — |
| `CON_WF_FamilyOneX` | [L48426](../../../../ScriptDB/000_4_CreateSP.sql#L48426) | — | 1 / 0 | — |
| `CON_WF_Intermediary` | [L57231](../../../../ScriptDB/000_4_CreateSP.sql#L57231) | — | 2 / 1 | — |
| `CON_WF_KYCUpdateByBatchCode_Step1` | [L57348](../../../../ScriptDB/000_4_CreateSP.sql#L57348) | — | 0 / 0 | — |
| `CON_WF_KYCUpdateByBatchCode_Step2` | [L57376](../../../../ScriptDB/000_4_CreateSP.sql#L57376) | — | 0 / 1 | — |
| `CON_WF_KYCUpdateOneBatchCode` | [L57419](../../../../ScriptDB/000_4_CreateSP.sql#L57419) | — | 1 / 1 | — |
| `CON_WF_KYCUpdatesTableAll` | [L58499](../../../../ScriptDB/000_4_CreateSP.sql#L58499) | — | 0 / 1 | — |
| `CON_WF_OneRep_Attachment_OneClient` | [L61648](../../../../ScriptDB/000_4_CreateSP.sql#L61648) | — | 0 / 0 | — |
| `CON_WF_OneRep_Notes_OneClient` | [L62778](../../../../ScriptDB/000_4_CreateSP.sql#L62778) | — | 0 / 0 | — |
| `CON_WF_OneRep_OneClient` | [L63099](../../../../ScriptDB/000_4_CreateSP.sql#L63099) | — | 1 / 7 | — |
| `CON_WF_OneRep_OneClient_Update` | [L63901](../../../../ScriptDB/000_4_CreateSP.sql#L63901) | — | 0 / 7 | — |
| `CON_WF_SetMaxIdentity_Client` | [L80822](../../../../ScriptDB/000_4_CreateSP.sql#L80822) | — | 0 / 0 | — |
| `CON_WF_WebClient` | [L87374](../../../../ScriptDB/000_4_CreateSP.sql#L87374) | — | 0 / 0 | — |
| `CON_WFront_Client` | [L87478](../../../../ScriptDB/000_4_CreateSP.sql#L87478) | — | 0 / 6 | — |
| `CON_WHS_1Client` | [L89316](../../../../ScriptDB/000_4_CreateSP.sql#L89316) | — | 1 / 2 | — |
| `CON_WHS_Client` | [L89878](../../../../ScriptDB/000_4_CreateSP.sql#L89878) | — | 0 / 1 | — |
| `DI_ChangeKYCIncomeDef` | [L98635](../../../../ScriptDB/000_4_CreateSP.sql#L98635) | — | 0 / 0 | — |
| `DI_Client250K` | [L99082](../../../../ScriptDB/000_4_CreateSP.sql#L99082) | — | 0 / 0 | — |
| `DI_ClientAssetCalc` | [L99284](../../../../ScriptDB/000_4_CreateSP.sql#L99284) | — | 0 / 0 | — |
| `DI_ClientAssetList` | [L99334](../../../../ScriptDB/000_4_CreateSP.sql#L99334) | — | 0 / 0 | — |
| `DI_ClientDuplication` | [L99483](../../../../ScriptDB/000_4_CreateSP.sql#L99483) | — | 0 / 0 | — |
| `DI_ClientDuplicationList` | [L99521](../../../../ScriptDB/000_4_CreateSP.sql#L99521) | — | 0 / 0 | — |
| `DI_ClientExtraInfoDuplication` | [L99668](../../../../ScriptDB/000_4_CreateSP.sql#L99668) | — | 0 / 0 | — |
| `DI_ClientFinInfoDuplication` | [L99692](../../../../ScriptDB/000_4_CreateSP.sql#L99692) | — | 0 / 0 | — |
| `DI_ClientFreezeAlltems` | [L99747](../../../../ScriptDB/000_4_CreateSP.sql#L99747) | — | 0 / 4 | — |
| `DI_ClientFreezeTaggedItems` | [L99794](../../../../ScriptDB/000_4_CreateSP.sql#L99794) | 1 / 1 file | 0 / 1 | [Customer.cs:4740](../../../../UBClasses/Customer.cs#L4740) |
| `DI_ClientFrozenAsOf` | [L99841](../../../../ScriptDB/000_4_CreateSP.sql#L99841) | — | 0 / 0 | — |
| `DI_ClientInactiveNotZero` | [L100003](../../../../ScriptDB/000_4_CreateSP.sql#L100003) | — | 0 / 0 | — |
| `DI_ClientKYCExpiredList` | [L100043](../../../../ScriptDB/000_4_CreateSP.sql#L100043) | — | 1 / 0 | — |
| `DI_ClientKYCExpiredSelUpdate` | [L100444](../../../../ScriptDB/000_4_CreateSP.sql#L100444) | — | 0 / 0 | — |
| `DI_ClientMultipleReps` | [L100491](../../../../ScriptDB/000_4_CreateSP.sql#L100491) | — | 0 / 0 | — |
| `DI_ClientNameDiffBySIN` | [L100557](../../../../ScriptDB/000_4_CreateSP.sql#L100557) | — | 0 / 0 | — |
| `DI_ClientNoKYCList` | [L100595](../../../../ScriptDB/000_4_CreateSP.sql#L100595) | — | 0 / 0 | — |
| `DI_ClientNoKYCSelUpdate` | [L100789](../../../../ScriptDB/000_4_CreateSP.sql#L100789) | — | 0 / 0 | — |
| `DI_ClientNotZeroMKV` | [L100889](../../../../ScriptDB/000_4_CreateSP.sql#L100889) | — | 0 / 0 | — |
| `DI_ClientOPENNoFATCA` | [L100938](../../../../ScriptDB/000_4_CreateSP.sql#L100938) | — | 0 / 1 | — |
| `DI_ClientReturnMailAsOf` | [L101201](../../../../ScriptDB/000_4_CreateSP.sql#L101201) | — | 0 / 0 | — |
| `DI_ClientZeroMKV` | [L101239](../../../../ScriptDB/000_4_CreateSP.sql#L101239) | — | 0 / 1 | — |
| `DI_ClientZeroMKVInactivate` | [L101440](../../../../ScriptDB/000_4_CreateSP.sql#L101440) | 1 / 1 file | 0 / 1 | [Customer.cs:4697](../../../../UBClasses/Customer.cs#L4697) |
| `DI_ClientZeroMKVSelUpdate` | [L101488](../../../../ScriptDB/000_4_CreateSP.sql#L101488) | — | 0 / 0 | — |
| `DI_FindClientWithOneDealerCodeWithoutAnother` | [L101780](../../../../ScriptDB/000_4_CreateSP.sql#L101780) | — | 0 / 0 | — |
| `DI_FreezeClientList` | [L102246](../../../../ScriptDB/000_4_CreateSP.sql#L102246) | 1 / 1 file | 0 / 2 | [Customer.cs:4780](../../../../UBClasses/Customer.cs#L4780) |
| `DI_InactiveClientByYear` | [L102505](../../../../ScriptDB/000_4_CreateSP.sql#L102505) | — | 0 / 0 | — |
| `DT_Extract_Client` | [L109541](../../../../ScriptDB/000_4_CreateSP.sql#L109541) | — | 0 / 0 | — |
| `FMClientAdd` | [L112824](../../../../ScriptDB/000_4_CreateSP.sql#L112824) | — | 0 / 12 | — |
| `FMClientAddressUpdate` | [L113302](../../../../ScriptDB/000_4_CreateSP.sql#L113302) | — | 0 / 1 | — |
| `Init_CheckWebClientLoginID` | [L116506](../../../../ScriptDB/000_4_CreateSP.sql#L116506) | — | 0 / 0 | — |
| `Init_ClientAssignFileIDAll_1194` | [L116648](../../../../ScriptDB/000_4_CreateSP.sql#L116648) | — | 0 / 1 | — |
| `Init_ClientAssignFileIDOne_1194` | [L116682](../../../../ScriptDB/000_4_CreateSP.sql#L116682) | — | 1 / 0 | — |
| `Init_ClientExtraInfoLinked` | [L116715](../../../../ScriptDB/000_4_CreateSP.sql#L116715) | — | 0 / 0 | — |
| `Init_ClientInvalidSIN_BN` | [L116748](../../../../ScriptDB/000_4_CreateSP.sql#L116748) | — | 0 / 0 | — |
| `Init_ClientLastKYCOnFileDate` | [L116793](../../../../ScriptDB/000_4_CreateSP.sql#L116793) | — | 0 / 0 | — |
| `Init_ClientMemberRepScanAll` | [L116838](../../../../ScriptDB/000_4_CreateSP.sql#L116838) | — | 0 / 1 | — |
| `Init_ClientMemberRepScanOne` | [L116874](../../../../ScriptDB/000_4_CreateSP.sql#L116874) | — | 2 / 0 | — |
| `Init_ClientMemberRepScanOneMember` | [L116947](../../../../ScriptDB/000_4_CreateSP.sql#L116947) | — | 0 / 1 | — |
| `Init_ClientQuestionDef` | [L116981](../../../../ScriptDB/000_4_CreateSP.sql#L116981) | — | 1 / 1 | — |
| `Init_ClientQuestionDefAll` | [L117009](../../../../ScriptDB/000_4_CreateSP.sql#L117009) | — | 0 / 1 | — |
| `Init_ClientRemoveFrenchAccent` | [L117046](../../../../ScriptDB/000_4_CreateSP.sql#L117046) | — | 0 / 0 | — |
| `Init_ClientRepScanAll` | [L117071](../../../../ScriptDB/000_4_CreateSP.sql#L117071) | — | 0 / 1 | — |
| `Init_ClientRepScanOneRepCode` | [L117104](../../../../ScriptDB/000_4_CreateSP.sql#L117104) | — | 0 / 1 | — |
| `Init_ClientSetDefRep` | [L117130](../../../../ScriptDB/000_4_CreateSP.sql#L117130) | — | 0 / 0 | — |
| `Init_CustomerRepRefreshAll` | [L117782](../../../../ScriptDB/000_4_CreateSP.sql#L117782) | — | 0 / 1 | — |
| `Init_CustomerRepVerify` | [L117821](../../../../ScriptDB/000_4_CreateSP.sql#L117821) | — | 0 / 0 | — |
| `Init_Move1Client2Rep` | [L120834](../../../../ScriptDB/000_4_CreateSP.sql#L120834) | — | 1 / 0 | — |
| `Init_SetClientApproxIncomeIndexFromAmount` | [L122874](../../../../ScriptDB/000_4_CreateSP.sql#L122874) | — | 0 / 1 | — |
| `Init_SetClientDocDeliveryMethod` | [L122912](../../../../ScriptDB/000_4_CreateSP.sql#L122912) | — | 0 / 2 | — |
| `Init_UBCompCheckClientInfoScanAll` | [L123837](../../../../ScriptDB/000_4_CreateSP.sql#L123837) | — | 0 / 1 | — |
| `Init_UpdateClientNameCAP2Proper` | [L123920](../../../../ScriptDB/000_4_CreateSP.sql#L123920) | — | 0 / 0 | — |
| `MON_FATCAInit` | [L142569](../../../../ScriptDB/000_4_CreateSP.sql#L142569) | — | 0 / 0 | — |
| `PHX_CON_Client` | [L161487](../../../../ScriptDB/000_4_CreateSP.sql#L161487) | — | 0 / 0 | — |
| `SKClientOrderList` | [L166184](../../../../ScriptDB/000_4_CreateSP.sql#L166184) | 1 / 1 file | 0 / 0 | [Stock.cs:637](../../../../UBClasses/Stock.cs#L637) |
| `UB_AttachmentCopy2ClientList` | [L172807](../../../../ScriptDB/000_4_CreateSP.sql#L172807) | — | 1 / 0 | — |
| `UB_ClientLeverageRatio` | [L172871](../../../../ScriptDB/000_4_CreateSP.sql#L172871) | — | 1 / 0 | — |
| `UB_ClientLeverageRatioList` | [L172929](../../../../ScriptDB/000_4_CreateSP.sql#L172929) | — | 0 / 1 | — |
| `UB2FAGetCode4Client` | [L173125](../../../../ScriptDB/000_4_CreateSP.sql#L173125) | 1 / 1 file | 0 / 2 | [Customer.cs:6066](../../../../UBClasses/Customer.cs#L6066) |
| `UBAddressChangeClientID` | [L182547](../../../../ScriptDB/000_4_CreateSP.sql#L182547) | 1 / 1 file | 0 / 0 | [AuditTrail.cs:263](../../../../UBClasses/AuditTrail.cs#L263) |
| `UBAddressChangeSupplierClientID` | [L182769](../../../../ScriptDB/000_4_CreateSP.sql#L182769) | 1 / 1 file | 0 / 0 | [CAddress.cs:215](../../../../UBClasses/CAddress.cs#L215) |
| `UBAssetRecalcClientCurrent` | [L186316](../../../../ScriptDB/000_4_CreateSP.sql#L186316) | — | 1 / 1 | — |
| `UBAssetRecalcClientCurrentAll` | [L186383](../../../../ScriptDB/000_4_CreateSP.sql#L186383) | — | 0 / 2 | — |
| `UBAuditTrailClient` | [L188649](../../../../ScriptDB/000_4_CreateSP.sql#L188649) | 1 / 1 file | 0 / 0 | [AuditTrail.cs:40](../../../../UBClasses/AuditTrail.cs#L40) |
| `UBAuditTrailInitAllClients` | [L189783](../../../../ScriptDB/000_4_CreateSP.sql#L189783) | — | 1 / 1 | — |
| `UBAuditTrailInitOneClient` | [L189955](../../../../ScriptDB/000_4_CreateSP.sql#L189955) | — | 3 / 6 | — |
| `UBBeneficiaryList` | [L194494](../../../../ScriptDB/000_4_CreateSP.sql#L194494) | 1 / 1 file | 0 / 1 | [Plan.cs:4466](../../../../UBClasses/Plan.cs#L4466) |
| `UBCDICDataInitUCIOneClient` | [L209679](../../../../ScriptDB/000_4_CreateSP.sql#L209679) | — | 3 / 2 | — |
| `UBChequeGetID4Client` | [L210505](../../../../ScriptDB/000_4_CreateSP.sql#L210505) | — | 1 / 0 | — |
| `UBClientActivate` | [L211172](../../../../ScriptDB/000_4_CreateSP.sql#L211172) | — | 2 / 3 | — |
| `UBClientActivate_FromInactive` | [L211231](../../../../ScriptDB/000_4_CreateSP.sql#L211231) | — | 0 / 1 | — |
| `UBClientAddressAdd` | [L211268](../../../../ScriptDB/000_4_CreateSP.sql#L211268) | — | 22 / 2 | — |
| `UBClientAddressDuplicate` | [L211359](../../../../ScriptDB/000_4_CreateSP.sql#L211359) | — | 3 / 0 | — |
| `UBClientAddressList` | [L211402](../../../../ScriptDB/000_4_CreateSP.sql#L211402) | 1 / 1 file | 0 / 1 | [Customer.cs:4272](../../../../UBClasses/Customer.cs#L4272) |
| `UBClientAddressList_Old` | [L211557](../../../../ScriptDB/000_4_CreateSP.sql#L211557) | — | 0 / 1 | — |
| `UBClientAddressListFreeUnitFlag` | [L211703](../../../../ScriptDB/000_4_CreateSP.sql#L211703) | — | 0 / 1 | — |
| `UBClientAddressListShort` | [L211800](../../../../ScriptDB/000_4_CreateSP.sql#L211800) | — | 0 / 1 | — |
| `UBClientAddressLog` | [L211935](../../../../ScriptDB/000_4_CreateSP.sql#L211935) | — | 4 / 0 | — |
| `UBClientAddressPhoneRequestAdd` | [L212074](../../../../ScriptDB/000_4_CreateSP.sql#L212074) | 1 / 1 file | 0 / 3 | [CAddress.cs:264](../../../../UBClasses/CAddress.cs#L264) |
| `UBClientAddressRequestApproveAll` | [L212272](../../../../ScriptDB/000_4_CreateSP.sql#L212272) | 1 / 1 file | 0 / 2 | [CAddress.cs:407](../../../../UBClasses/CAddress.cs#L407) |
| `UBClientAddressRequestApproveOne` | [L212317](../../../../ScriptDB/000_4_CreateSP.sql#L212317) | 1 / 1 file | 1 / 6 | [CAddress.cs:409](../../../../UBClasses/CAddress.cs#L409) |
| `UBClientAddressRequestDeclineOne` | [L212501](../../../../ScriptDB/000_4_CreateSP.sql#L212501) | 1 / 1 file | 0 / 1 | [CAddress.cs:460](../../../../UBClasses/CAddress.cs#L460) |
| `UBClientAddressSupplierList` | [L212547](../../../../ScriptDB/000_4_CreateSP.sql#L212547) | 1 / 1 file | 0 / 2 | [CAddress.cs:78](../../../../UBClasses/CAddress.cs#L78) |
| `UBClientAddressSupplierLog` | [L212694](../../../../ScriptDB/000_4_CreateSP.sql#L212694) | — | 1 / 0 | — |
| `UBClientAddressSupplierRemove` | [L212781](../../../../ScriptDB/000_4_CreateSP.sql#L212781) | 1 / 1 file | 0 / 0 | [CAddress.cs:169](../../../../UBClasses/CAddress.cs#L169) |
| `UBClientAddressUpdate` | [L212806](../../../../ScriptDB/000_4_CreateSP.sql#L212806) | — | 10 / 3 | — |
| `UBClientAddUI` | [L212952](../../../../ScriptDB/000_4_CreateSP.sql#L212952) | 1 / 1 file | 0 / 20 | [Customer.cs:2326](../../../../UBClasses/Customer.cs#L2326) |
| `UBClientAnonymousOne` | [L213649](../../../../ScriptDB/000_4_CreateSP.sql#L213649) | 1 / 1 file | 0 / 0 | [ExceptionReport.cs:401](../../../../UBClasses/ExceptionReport.cs#L401) |
| `UBClientAnonymousOneUndo` | [L213686](../../../../ScriptDB/000_4_CreateSP.sql#L213686) | 1 / 1 file | 0 / 0 | [ExceptionReport.cs:444](../../../../UBClasses/ExceptionReport.cs#L444) |
| `UBClientAssetAsOf` | [L213721](../../../../ScriptDB/000_4_CreateSP.sql#L213721) | — | 0 / 0 | — |
| `UBClientAssetLiquidList` | [L213795](../../../../ScriptDB/000_4_CreateSP.sql#L213795) | — | 2 / 0 | — |
| `UBClientAssetLiquidSave` | [L213844](../../../../ScriptDB/000_4_CreateSP.sql#L213844) | 1 / 1 file | 0 / 0 | [Customer.cs:5321](../../../../UBClasses/Customer.cs#L5321) |
| `UBClientAssetOtherList` | [L213889](../../../../ScriptDB/000_4_CreateSP.sql#L213889) | — | 2 / 0 | — |
| `UBClientAssetOtherSave` | [L213933](../../../../ScriptDB/000_4_CreateSP.sql#L213933) | 1 / 1 file | 0 / 0 | [Customer.cs:5321](../../../../UBClasses/Customer.cs#L5321) |
| `UBClientBankInfo` | [L214060](../../../../ScriptDB/000_4_CreateSP.sql#L214060) | — | 1 / 0 | — |
| `UBClientBankListAll` | [L214090](../../../../ScriptDB/000_4_CreateSP.sql#L214090) | — | 0 / 0 | — |
| `UBClientBankListDropdown` | [L214115](../../../../ScriptDB/000_4_CreateSP.sql#L214115) | — | 4 / 0 | — |
| `UBClientBarChartX` | [L214177](../../../../ScriptDB/000_4_CreateSP.sql#L214177) | — | 0 / 1 | — |
| `UBClientCityProvince` | [L214397](../../../../ScriptDB/000_4_CreateSP.sql#L214397) | 1 / 1 file | 0 / 1 | [Province.cs:433](../../../../UBClasses/Province.cs#L433) |
| `UBClientCompanyInfoDuplicate` | [L214436](../../../../ScriptDB/000_4_CreateSP.sql#L214436) | — | 0 / 0 | — |
| `UBClientCompExecAdd` | [L214481](../../../../ScriptDB/000_4_CreateSP.sql#L214481) | — | 0 / 4 | — |
| `UBClientCompExecRemove` | [L214566](../../../../ScriptDB/000_4_CreateSP.sql#L214566) | 1 / 1 file | 0 / 1 | [PanelClientCompExecAdd.aspx.cs:302](../../../../WebApp/Main/PanelClientCompExecAdd.aspx.cs#L302) |
| `UBClientCompExecUpdate` | [L214607](../../../../ScriptDB/000_4_CreateSP.sql#L214607) | — | 0 / 5 | — |
| `UBClientDealerCodeList` | [L214697](../../../../ScriptDB/000_4_CreateSP.sql#L214697) | — | 0 / 0 | — |
| `UBClientDealerCodeListX` | [L214723](../../../../ScriptDB/000_4_CreateSP.sql#L214723) | — | 0 / 0 | — |
| `UBClientDocListVA` | [L214819](../../../../ScriptDB/000_4_CreateSP.sql#L214819) | — | 0 / 0 | — |
| `UBClientDocObjVA` | [L215090](../../../../ScriptDB/000_4_CreateSP.sql#L215090) | — | 0 / 0 | — |
| `UBClientDuplicate` | [L215202](../../../../ScriptDB/000_4_CreateSP.sql#L215202) | — | 5 / 6 | — |
| `UBClientDuplicateAllInfo` | [L215286](../../../../ScriptDB/000_4_CreateSP.sql#L215286) | — | 0 / 8 | — |
| `UBClientDuplicateAllInfo4Test` | [L215395](../../../../ScriptDB/000_4_CreateSP.sql#L215395) | — | 0 / 9 | — |
| `UBClientEditComboList` | [L215514](../../../../ScriptDB/000_4_CreateSP.sql#L215514) | — | 0 / 31 | — |
| `UBClienteDocAccessCode` | [L215590](../../../../ScriptDB/000_4_CreateSP.sql#L215590) | 1 / 1 file | 0 / 0 | [Customer.cs:5910](../../../../UBClasses/Customer.cs#L5910) |
| `UBClienteDocAccessCodeUpdate` | [L215603](../../../../ScriptDB/000_4_CreateSP.sql#L215603) | 1 / 1 file | 0 / 0 | [Customer.cs:5959](../../../../UBClasses/Customer.cs#L5959) |
| `UBClientElectronicStmtUpdate` | [L215618](../../../../ScriptDB/000_4_CreateSP.sql#L215618) | 1 / 1 file | 0 / 4 | [Customer.cs:3909](../../../../UBClasses/Customer.cs#L3909) |
| `UBClientEnableESign2FA_AllWithCell` | [L215747](../../../../ScriptDB/000_4_CreateSP.sql#L215747) | — | 0 / 0 | — |
| `UBClientExtraInfoDuplicate` | [L215771](../../../../ScriptDB/000_4_CreateSP.sql#L215771) | — | 3 / 0 | — |
| `UBClientFavoriteAdd` | [L215822](../../../../ScriptDB/000_4_CreateSP.sql#L215822) | 1 / 1 file | 1 / 0 | [Customer.cs:2857](../../../../UBClasses/Customer.cs#L2857) |
| `UBClientFavoriteAddAll` | [L215881](../../../../ScriptDB/000_4_CreateSP.sql#L215881) | 1 / 1 file | 0 / 1 | [Customer.cs:2857](../../../../UBClasses/Customer.cs#L2857) |
| `UBClientFavoriteLoad` | [L215915](../../../../ScriptDB/000_4_CreateSP.sql#L215915) | 1 / 1 file | 0 / 0 | [Customer.cs:522](../../../../UBClasses/Customer.cs#L522) |
| `UBClientFavoriteRemove` | [L215946](../../../../ScriptDB/000_4_CreateSP.sql#L215946) | 1 / 1 file | 0 / 0 | [Customer.cs:2910](../../../../UBClasses/Customer.cs#L2910) |
| `UBClientFinInfoDuplicate` | [L215972](../../../../ScriptDB/000_4_CreateSP.sql#L215972) | — | 3 / 0 | — |
| `UBClientFreezeOne` | [L216027](../../../../ScriptDB/000_4_CreateSP.sql#L216027) | — | 4 / 2 | — |
| `UBClientIdentificationDuplicate` | [L216831](../../../../ScriptDB/000_4_CreateSP.sql#L216831) | — | 2 / 0 | — |
| `UBClientIDExpiredList` | [L216874](../../../../ScriptDB/000_4_CreateSP.sql#L216874) | — | 0 / 0 | — |
| `UBClientImportComboList` | [L217055](../../../../ScriptDB/000_4_CreateSP.sql#L217055) | — | 0 / 3 | — |
| `UBClientImportDef` | [L217075](../../../../ScriptDB/000_4_CreateSP.sql#L217075) | — | 0 / 0 | — |
| `UBClientImportFileClear` | [L217093](../../../../ScriptDB/000_4_CreateSP.sql#L217093) | — | 1 / 0 | — |
| `UBClientImportFileReadOneRecord` | [L217106](../../../../ScriptDB/000_4_CreateSP.sql#L217106) | — | 0 / 2 | — |
| `UBClientImportList` | [L217186](../../../../ScriptDB/000_4_CreateSP.sql#L217186) | 1 / 1 file | 0 / 0 | [CClientImport.cs:38](../../../../UBClasses/CClientImport.cs#L38) |
| `UBClientImportProcess1Record` | [L217287](../../../../ScriptDB/000_4_CreateSP.sql#L217287) | — | 1 / 2 | — |
| `UBClientImportProcessTaggedItems` | [L217465](../../../../ScriptDB/000_4_CreateSP.sql#L217465) | — | 0 / 1 | — |
| `UBClientImportSelectionUpdate` | [L217511](../../../../ScriptDB/000_4_CreateSP.sql#L217511) | — | 0 / 0 | — |
| `UBClientInactivate` | [L217549](../../../../ScriptDB/000_4_CreateSP.sql#L217549) | — | 1 / 3 | — |
| `UBClientInfo` | [L217806](../../../../ScriptDB/000_4_CreateSP.sql#L217806) | 1 / 1 file | 0 / 21 | [Customer.cs:212](../../../../UBClasses/Customer.cs#L212) |
| `UBClientInfoAddress` | [L218064](../../../../ScriptDB/000_4_CreateSP.sql#L218064) | — | 33 / 0 | — |
| `UBClientInfoAddressExtra` | [L218105](../../../../ScriptDB/000_4_CreateSP.sql#L218105) | — | 1 / 0 | — |
| `UBClientInfoAddressPending` | [L218147](../../../../ScriptDB/000_4_CreateSP.sql#L218147) | — | 2 / 0 | — |
| `UBClientInfoAddressPhone` | [L218178](../../../../ScriptDB/000_4_CreateSP.sql#L218178) | 1 / 1 file | 0 / 4 | [CAddress.cs:33](../../../../UBClasses/CAddress.cs#L33) |
| `UBClientInfoBank` | [L218215](../../../../ScriptDB/000_4_CreateSP.sql#L218215) | 2 / 2 file | 3 / 1 | [PanelClientAddress.aspx.cs:64](../../../../WebApp/Main/PanelClientAddress.aspx.cs#L64) |
| `UBClientInfoBankList` | [L218341](../../../../ScriptDB/000_4_CreateSP.sql#L218341) | 1 / 1 file | 0 / 1 | [BankAccount.cs:1554](../../../../UBClasses/BankAccount.cs#L1554) |
| `UBClientInfoBankTMP` | [L218410](../../../../ScriptDB/000_4_CreateSP.sql#L218410) | 2 / 2 file | 0 / 0 | [PanelClientAddress.aspx.cs:64](../../../../WebApp/Main/PanelClientAddress.aspx.cs#L64) |
| `UBClientInfoByEmail` | [L218453](../../../../ScriptDB/000_4_CreateSP.sql#L218453) | 1 / 1 file | 0 / 0 | [Customer.cs:4913](../../../../UBClasses/Customer.cs#L4913) |
| `UBClientInfoComp` | [L218528](../../../../ScriptDB/000_4_CreateSP.sql#L218528) | 1 / 1 file | 0 / 0 | [PanelClientCompExecAdd.aspx.cs:63](../../../../WebApp/Main/PanelClientCompExecAdd.aspx.cs#L63) |
| `UBClientInfoCompanyExecAdd` | [L218574](../../../../ScriptDB/000_4_CreateSP.sql#L218574) | — | 1 / 3 | — |
| `UBClientInfoCompList` | [L218697](../../../../ScriptDB/000_4_CreateSP.sql#L218697) | 1 / 1 file | 1 / 0 | [CompExec.cs:57](../../../../UBClasses/CompExec.cs#L57) |
| `UBClientInfoEmp` | [L218748](../../../../ScriptDB/000_4_CreateSP.sql#L218748) | — | 4 / 0 | — |
| `UBClientInfoExport` | [L218856](../../../../ScriptDB/000_4_CreateSP.sql#L218856) | 1 / 1 file | 0 / 0 | [ClientList.cs:152](../../../../UBExport/ClientList.cs#L152) |
| `UBClientInfoExport_Simple` | [L219170](../../../../ScriptDB/000_4_CreateSP.sql#L219170) | — | 0 / 0 | — |
| `UBClientInfoExport_TBD` | [L219485](../../../../ScriptDB/000_4_CreateSP.sql#L219485) | — | 0 / 0 | — |
| `UBClientInfoExportAll` | [L219800](../../../../ScriptDB/000_4_CreateSP.sql#L219800) | — | 0 / 0 | — |
| `UBClientInfoExtra` | [L220166](../../../../ScriptDB/000_4_CreateSP.sql#L220166) | — | 4 / 0 | — |
| `UBClientInfoFinancial` | [L220443](../../../../ScriptDB/000_4_CreateSP.sql#L220443) | 1 / 1 file | 4 / 0 | [Customer.cs:3298](../../../../UBClasses/Customer.cs#L3298) |
| `UBClientInfoID` | [L220638](../../../../ScriptDB/000_4_CreateSP.sql#L220638) | 1 / 1 file | 0 / 0 | [PanelClientIdentAdd.aspx.cs:76](../../../../WebApp/Main/PanelClientIdentAdd.aspx.cs#L76) |
| `UBClientInfoIDAdd` | [L220686](../../../../ScriptDB/000_4_CreateSP.sql#L220686) | — | 1 / 3 | — |
| `UBClientInfoIDList` | [L220759](../../../../ScriptDB/000_4_CreateSP.sql#L220759) | 2 / 1 file | 4 / 0 | [Identity.cs:64](../../../../UBClasses/Identity.cs#L64) |
| `UBClientInfoIDTMP` | [L220829](../../../../ScriptDB/000_4_CreateSP.sql#L220829) | 1 / 1 file | 0 / 0 | [PanelClientIdentAdd.aspx.cs:76](../../../../WebApp/Main/PanelClientIdentAdd.aspx.cs#L76) |
| `UBClientInfoMailAddress` | [L220861](../../../../ScriptDB/000_4_CreateSP.sql#L220861) | — | 29 / 0 | — |
| `UBClientInfoPhone` | [L220905](../../../../ScriptDB/000_4_CreateSP.sql#L220905) | — | 11 / 0 | — |
| `UBClientInfoQuestionair` | [L220950](../../../../ScriptDB/000_4_CreateSP.sql#L220950) | 1 / 1 file | 4 / 0 | [Questionair.cs:41](../../../../UBClasses/Questionair.cs#L41) |
| `UBClientInfoQuestionairAdd` | [L221047](../../../../ScriptDB/000_4_CreateSP.sql#L221047) | — | 2 / 1 | — |
| `UBClientInfoQuestionairAddTMP` | [L221127](../../../../ScriptDB/000_4_CreateSP.sql#L221127) | — | 0 / 0 | — |
| `UBClientInfoQuestionairX` | [L221217](../../../../ScriptDB/000_4_CreateSP.sql#L221217) | 1 / 1 file | 1 / 0 | [Questionair.cs:165](../../../../UBClasses/Questionair.cs#L165) |
| `UBClientInfoQuestionairX4Form` | [L221246](../../../../ScriptDB/000_4_CreateSP.sql#L221246) | — | 0 / 0 | — |
| `UBClientInfoSpouse` | [L221280](../../../../ScriptDB/000_4_CreateSP.sql#L221280) | 2 / 2 file | 2 / 0 | [Customer.cs:307](../../../../UBClasses/Customer.cs#L307) |
| `UBClientInfoUD` | [L221491](../../../../ScriptDB/000_4_CreateSP.sql#L221491) | 1 / 1 file | 1 / 0 | [UserDefinedField.cs:39](../../../../UBClasses/UserDefinedField.cs#L39) |
| `UBClientInfoUDAdd` | [L221545](../../../../ScriptDB/000_4_CreateSP.sql#L221545) | — | 2 / 1 | — |
| `UBClientInfoUDAddTMP` | [L221630](../../../../ScriptDB/000_4_CreateSP.sql#L221630) | — | 0 / 0 | — |
| `UBClientInfoWebClient` | [L221691](../../../../ScriptDB/000_4_CreateSP.sql#L221691) | 1 / 1 file | 1 / 0 | [Customer.cs:4119](../../../../UBClasses/Customer.cs#L4119) |
| `UBClientInvestKnowledgeUpdate` | [L221769](../../../../ScriptDB/000_4_CreateSP.sql#L221769) | 1 / 1 file | 0 / 3 | [Loan.cs:1512](../../../../UBClasses/Loan.cs#L1512) |
| `UBClientJointRepList` | [L221815](../../../../ScriptDB/000_4_CreateSP.sql#L221815) | 1 / 1 file | 0 / 0 | [Customer.cs:6014](../../../../UBClasses/Customer.cs#L6014) |
| `UBClientKYC` | [L221861](../../../../ScriptDB/000_4_CreateSP.sql#L221861) | 1 / 1 file | 0 / 6 | [Customer.cs:259](../../../../UBClasses/Customer.cs#L259) |
| `UBClientKYC_BankInfo` | [L222148](../../../../ScriptDB/000_4_CreateSP.sql#L222148) | — | 1 / 0 | — |
| `UBClientKYC_CompInfo` | [L222235](../../../../ScriptDB/000_4_CreateSP.sql#L222235) | — | 1 / 0 | — |
| `UBClientKYC_Def` | [L222310](../../../../ScriptDB/000_4_CreateSP.sql#L222310) | — | 2 / 0 | — |
| `UBClientKYC_EmpInfo` | [L222354](../../../../ScriptDB/000_4_CreateSP.sql#L222354) | — | 1 / 0 | — |
| `UBClientKYC_FinInfo` | [L222438](../../../../ScriptDB/000_4_CreateSP.sql#L222438) | — | 1 / 0 | — |
| `UBClientKYC_IDInfo` | [L222554](../../../../ScriptDB/000_4_CreateSP.sql#L222554) | — | 1 / 0 | — |
| `UBClientKYC_SpouseInfo` | [L222625](../../../../ScriptDB/000_4_CreateSP.sql#L222625) | — | 1 / 0 | — |
| `UBClientKYCExtraInit` | [L222704](../../../../ScriptDB/000_4_CreateSP.sql#L222704) | — | 1 / 0 | — |
| `UBClientKYCExtraList` | [L222808](../../../../ScriptDB/000_4_CreateSP.sql#L222808) | 1 / 1 file | 0 / 6 | [Customer.cs:5274](../../../../UBClasses/Customer.cs#L5274) |
| `UBClientKYCExtraSaveEnd` | [L222840](../../../../ScriptDB/000_4_CreateSP.sql#L222840) | 1 / 1 file | 0 / 4 | [Customer.cs:5485](../../../../UBClasses/Customer.cs#L5485) |
| `UBClientKYCExtraSum` | [L222937](../../../../ScriptDB/000_4_CreateSP.sql#L222937) | — | 1 / 0 | — |
| `UBClientLabelList` | [L223004](../../../../ScriptDB/000_4_CreateSP.sql#L223004) | — | 0 / 0 | — |
| `UBClientLastKYCOnFileUpdate` | [L223241](../../../../ScriptDB/000_4_CreateSP.sql#L223241) | — | 0 / 0 | — |
| `UBClientLiabilityList` | [L223277](../../../../ScriptDB/000_4_CreateSP.sql#L223277) | — | 2 / 0 | — |
| `UBClientLiabilitySave` | [L223335](../../../../ScriptDB/000_4_CreateSP.sql#L223335) | 1 / 1 file | 0 / 0 | [Customer.cs:5375](../../../../UBClasses/Customer.cs#L5375) |
| `UBClientListAgeRange` | [L223382](../../../../ScriptDB/000_4_CreateSP.sql#L223382) | — | 0 / 0 | — |
| `UBClientListComboList` | [L223429](../../../../ScriptDB/000_4_CreateSP.sql#L223429) | — | 0 / 64 | — |
| `UBClientListComboList2` | [L223582](../../../../ScriptDB/000_4_CreateSP.sql#L223582) | — | 0 / 9 | — |
| `UBClientListSetSelection` | [L223627](../../../../ScriptDB/000_4_CreateSP.sql#L223627) | 1 / 1 file | 0 / 2 | [Customer.cs:4423](../../../../UBClasses/Customer.cs#L4423) |
| `UBClientListSetSelectionByType` | [L223707](../../../../ScriptDB/000_4_CreateSP.sql#L223707) | 1 / 1 file | 0 / 2 | [Customer.cs:4537](../../../../UBClasses/Customer.cs#L4537) |
| `UBClientLogin` | [L223875](../../../../ScriptDB/000_4_CreateSP.sql#L223875) | 1 / 1 file | 0 / 1 | [Customer.cs:3762](../../../../UBClasses/Customer.cs#L3762) |
| `UBClientLoginAddEx` | [L224208](../../../../ScriptDB/000_4_CreateSP.sql#L224208) | — | 0 / 0 | — |
| `UBClientLoginByClientID` | [L224263](../../../../ScriptDB/000_4_CreateSP.sql#L224263) | — | 0 / 0 | — |
| `UBClientLoginIDByClientID` | [L224289](../../../../ScriptDB/000_4_CreateSP.sql#L224289) | — | 0 / 0 | — |
| `UBClientLoginOther` | [L224315](../../../../ScriptDB/000_4_CreateSP.sql#L224315) | 1 / 1 file | 0 / 0 | [Customer.cs:3592](../../../../UBClasses/Customer.cs#L3592) |
| `UBClientLoginRemoveEx` | [L224347](../../../../ScriptDB/000_4_CreateSP.sql#L224347) | — | 0 / 0 | — |
| `UBClientLoginX` | [L224380](../../../../ScriptDB/000_4_CreateSP.sql#L224380) | — | 0 / 0 | — |
| `UBClientLoginXRenew` | [L224514](../../../../ScriptDB/000_4_CreateSP.sql#L224514) | — | 0 / 0 | — |
| `UBClientLogout` | [L224600](../../../../ScriptDB/000_4_CreateSP.sql#L224600) | 1 / 1 file | 1 / 0 | [Customer.cs:3647](../../../../UBClasses/Customer.cs#L3647) |
| `UBClientLogoutX` | [L224637](../../../../ScriptDB/000_4_CreateSP.sql#L224637) | — | 0 / 0 | — |
| `UBClientLookup` | [L224667](../../../../ScriptDB/000_4_CreateSP.sql#L224667) | 1 / 1 file | 0 / 1 | [Customer.cs:4639](../../../../UBClasses/Customer.cs#L4639) |
| `UBClientMarkProcessedOne` | [L224917](../../../../ScriptDB/000_4_CreateSP.sql#L224917) | — | 0 / 0 | — |
| `UBClientMemberRepCodeAlign` | [L224950](../../../../ScriptDB/000_4_CreateSP.sql#L224950) | — | 1 / 0 | — |
| `UBClientMemberRepCodeAlignAll` | [L224981](../../../../ScriptDB/000_4_CreateSP.sql#L224981) | — | 0 / 1 | — |
| `UBClientMobileEnableAll` | [L225057](../../../../ScriptDB/000_4_CreateSP.sql#L225057) | — | 0 / 0 | — |
| `UBClientNewBankInfoAdd` | [L225147](../../../../ScriptDB/000_4_CreateSP.sql#L225147) | — | 0 / 2 | — |
| `UBClientNewBankInfoRemove` | [L225260](../../../../ScriptDB/000_4_CreateSP.sql#L225260) | 2 / 2 file | 0 / 1 | [PanelClientAddress.aspx.cs:395](../../../../WebApp/Main/PanelClientAddress.aspx.cs#L395) |
| `UBClientNewBankInfoUpdate` | [L225311](../../../../ScriptDB/000_4_CreateSP.sql#L225311) | — | 0 / 2 | — |
| `UBClientNewIDAdd` | [L225408](../../../../ScriptDB/000_4_CreateSP.sql#L225408) | — | 0 / 4 | — |
| `UBClientNewIdentRemove` | [L225515](../../../../ScriptDB/000_4_CreateSP.sql#L225515) | 1 / 1 file | 0 / 1 | [PanelClientIdentAdd.aspx.cs:333](../../../../WebApp/Main/PanelClientIdentAdd.aspx.cs#L333) |
| `UBClientNewIDUpdate` | [L225559](../../../../ScriptDB/000_4_CreateSP.sql#L225559) | — | 0 / 5 | — |
| `UBClientNoFamily` | [L225677](../../../../ScriptDB/000_4_CreateSP.sql#L225677) | — | 0 / 0 | — |
| `UBClientOBAList` | [L225699](../../../../ScriptDB/000_4_CreateSP.sql#L225699) | — | 1 / 0 | — |
| `UBClientOBASave` | [L225737](../../../../ScriptDB/000_4_CreateSP.sql#L225737) | 1 / 1 file | 0 / 0 | [Customer.cs:5432](../../../../UBClasses/Customer.cs#L5432) |
| `UBClientPWbyUserID` | [L228309](../../../../ScriptDB/000_4_CreateSP.sql#L228309) | — | 0 / 0 | — |
| `UBClientPWChanged` | [L228325](../../../../ScriptDB/000_4_CreateSP.sql#L228325) | 1 / 1 file | 0 / 0 | [Customer.cs:2758](../../../../UBClasses/Customer.cs#L2758) |
| `UBClientQuestion4Form` | [L228349](../../../../ScriptDB/000_4_CreateSP.sql#L228349) | — | 1 / 0 | — |
| `UBClientQuestionnairDuplicate` | [L228382](../../../../ScriptDB/000_4_CreateSP.sql#L228382) | — | 3 / 0 | — |
| `UBClientQuestionUpdate` | [L228417](../../../../ScriptDB/000_4_CreateSP.sql#L228417) | — | 1 / 0 | — |
| `UBClientQuickAccessUpdateX` | [L228452](../../../../ScriptDB/000_4_CreateSP.sql#L228452) | — | 0 / 0 | — |
| `UBClientRatingList` | [L228487](../../../../ScriptDB/000_4_CreateSP.sql#L228487) | — | 2 / 0 | — |
| `UBClientRemoveAll` | [L228517](../../../../ScriptDB/000_4_CreateSP.sql#L228517) | — | 0 / 0 | — |
| `UBClientRemovePermanent` | [L228577](../../../../ScriptDB/000_4_CreateSP.sql#L228577) | — | 1 / 1 | — |
| `UBClientRemoveUI` | [L228621](../../../../ScriptDB/000_4_CreateSP.sql#L228621) | 1 / 1 file | 0 / 2 | [Customer.cs:2808](../../../../UBClasses/Customer.cs#L2808) |
| `UBClientRepRelationLengthList` | [L228670](../../../../ScriptDB/000_4_CreateSP.sql#L228670) | — | 1 / 0 | — |
| `UBClientRepRelationSourceList` | [L228691](../../../../ScriptDB/000_4_CreateSP.sql#L228691) | — | 1 / 0 | — |
| `UBClientRiskProfile4Form` | [L228712](../../../../ScriptDB/000_4_CreateSP.sql#L228712) | — | 1 / 0 | — |
| `UBClientRiskProfileUpdate` | [L228737](../../../../ScriptDB/000_4_CreateSP.sql#L228737) | — | 2 / 1 | — |
| `UBClientSearch` | [L229081](../../../../ScriptDB/000_4_CreateSP.sql#L229081) | 1 / 1 file | 0 / 3 | [Customer.cs:63](../../../../UBClasses/Customer.cs#L63) |
| `UBClientSearchCriteriaSave` | [L229757](../../../../ScriptDB/000_4_CreateSP.sql#L229757) | — | 5 / 1 | — |
| `UBClientSearchEx` | [L230284](../../../../ScriptDB/000_4_CreateSP.sql#L230284) | — | 1 / 1 | — |
| `UBClientSearchExport` | [L231625](../../../../ScriptDB/000_4_CreateSP.sql#L231625) | 1 / 1 file | 0 / 1 | [ClientList.cs:71](../../../../UBExport/ClientList.cs#L71) |
| `UBClientSearchLoad` | [L231749](../../../../ScriptDB/000_4_CreateSP.sql#L231749) | 1 / 1 file | 0 / 1 | [Customer.cs:397](../../../../UBClasses/Customer.cs#L397) |
| `UBClientSearchLoadSel` | [L231825](../../../../ScriptDB/000_4_CreateSP.sql#L231825) | — | 0 / 1 | — |
| `UBClientSearchSel` | [L231888](../../../../ScriptDB/000_4_CreateSP.sql#L231888) | 1 / 1 file | 0 / 1 | [Customer.cs:2140](../../../../UBClasses/Customer.cs#L2140) |
| `UBClientSetDocDelivery2Email` | [L232067](../../../../ScriptDB/000_4_CreateSP.sql#L232067) | — | 0 / 2 | — |
| `UBClientSetLanguage` | [L232116](../../../../ScriptDB/000_4_CreateSP.sql#L232116) | — | 1 / 3 | — |
| `UBClientSetLanguageAll` | [L232144](../../../../ScriptDB/000_4_CreateSP.sql#L232144) | — | 0 / 1 | — |
| `UBClientSpouseAddFromFGFile` | [L232216](../../../../ScriptDB/000_4_CreateSP.sql#L232216) | — | 0 / 1 | — |
| `UBClientSpouseDuplicate` | [L232256](../../../../ScriptDB/000_4_CreateSP.sql#L232256) | — | 2 / 0 | — |
| `UBClientStatusList` | [L232305](../../../../ScriptDB/000_4_CreateSP.sql#L232305) | — | 4 / 0 | — |
| `UBClientStmtDeliveryList` | [L232331](../../../../ScriptDB/000_4_CreateSP.sql#L232331) | 1 / 1 file | 0 / 1 | [Customer.cs:5533](../../../../UBClasses/Customer.cs#L5533) |
| `UBClientStmtDeliveryMethodChange` | [L232353](../../../../ScriptDB/000_4_CreateSP.sql#L232353) | — | 0 / 1 | — |
| `UBClientSummary` | [L232395](../../../../ScriptDB/000_4_CreateSP.sql#L232395) | 2 / 2 file | 0 / 16 | [Customer.cs:3444](../../../../UBClasses/Customer.cs#L3444) |
| `UBClientTaxCodeInitAll` | [L234386](../../../../ScriptDB/000_4_CreateSP.sql#L234386) | — | 1 / 1 | — |
| `UBClientTaxCodeInitOne` | [L234458](../../../../ScriptDB/000_4_CreateSP.sql#L234458) | — | 1 / 1 | — |
| `UBClientTaxCodeUpdate` | [L234498](../../../../ScriptDB/000_4_CreateSP.sql#L234498) | — | 2 / 0 | — |
| `UBClientTCPList` | [L234527](../../../../ScriptDB/000_4_CreateSP.sql#L234527) | — | 1 / 0 | — |
| `UBClientTrxExport` | [L234583](../../../../ScriptDB/000_4_CreateSP.sql#L234583) | — | 0 / 0 | — |
| `UBClientTrxExportAll` | [L234674](../../../../ScriptDB/000_4_CreateSP.sql#L234674) | — | 0 / 0 | — |
| `UBClientUpdateUI` | [L234882](../../../../ScriptDB/000_4_CreateSP.sql#L234882) | 1 / 1 file | 0 / 23 | [Customer.cs:2326](../../../../UBClasses/Customer.cs#L2326) |
| `UBClientWithMoreRepCodeList` | [L235823](../../../../ScriptDB/000_4_CreateSP.sql#L235823) | — | 0 / 0 | — |
| `UBClientWithMultipleMember` | [L235865](../../../../ScriptDB/000_4_CreateSP.sql#L235865) | — | 0 / 0 | — |
| `UBCompCheckClientInfo` | [L275429](../../../../ScriptDB/000_4_CreateSP.sql#L275429) | — | 6 / 2 | — |
| `UBCompCheckClientInfoAll` | [L275570](../../../../ScriptDB/000_4_CreateSP.sql#L275570) | — | 0 / 1 | — |
| `UBCompCheckClientInfoScan` | [L275604](../../../../ScriptDB/000_4_CreateSP.sql#L275604) | — | 1 / 0 | — |
| `UBCompCheckClientInfoUpdate` | [L275705](../../../../ScriptDB/000_4_CreateSP.sql#L275705) | — | 11 / 0 | — |
| `UBCompMissingKYCList` | [L277576](../../../../ScriptDB/000_4_CreateSP.sql#L277576) | 1 / 1 file | 0 / 2 | [Plan.cs:2772](../../../../UBClasses/Plan.cs#L2772) |
| `UBCompMissingKYCSearchCriteriaSave` | [L277927](../../../../ScriptDB/000_4_CreateSP.sql#L277927) | — | 1 / 1 | — |
| `UBCompTrend2SidedClientList` | [L280947](../../../../ScriptDB/000_4_CreateSP.sql#L280947) | 1 / 1 file | 0 / 0 | [Compliance.cs:4194](../../../../UBClasses/Compliance.cs#L4194) |
| `UBCompTrxClientList` | [L285516](../../../../ScriptDB/000_4_CreateSP.sql#L285516) | 1 / 1 file | 0 / 0 | [Compliance.cs:1551](../../../../UBClasses/Compliance.cs#L1551) |
| `UBCompTrxUpdateClientInfo` | [L292773](../../../../ScriptDB/000_4_CreateSP.sql#L292773) | — | 1 / 1 | — |
| `UBCustomerCompanyInfoTMPEnd` | [L295356](../../../../ScriptDB/000_4_CreateSP.sql#L295356) | — | 1 / 0 | — |
| `UBCustomerIdentificationTMPEnd` | [L295389](../../../../ScriptDB/000_4_CreateSP.sql#L295389) | — | 1 / 0 | — |
| `UBCustomerListWithEmail` | [L295418](../../../../ScriptDB/000_4_CreateSP.sql#L295418) | 1 / 1 file | 0 / 0 | [Customer.cs:5074](../../../../UBClasses/Customer.cs#L5074) |
| `UBCustomerQuestionairTMPEnd` | [L295473](../../../../ScriptDB/000_4_CreateSP.sql#L295473) | — | 1 / 0 | — |
| `UBCustomerRepRefresh` | [L295545](../../../../ScriptDB/000_4_CreateSP.sql#L295545) | — | 6 / 0 | — |
| `UBCustomerTotalAsset` | [L295647](../../../../ScriptDB/000_4_CreateSP.sql#L295647) | 1 / 1 file | 0 / 0 | [Customer.cs:5176](../../../../UBClasses/Customer.cs#L5176) |
| `UBCustomerUserDefTMPEnd` | [L295682](../../../../ScriptDB/000_4_CreateSP.sql#L295682) | — | 1 / 0 | — |
| `UBDashBoardAssetClientOneCategoryGet` | [L300095](../../../../ScriptDB/000_4_CreateSP.sql#L300095) | 1 / 1 file | 0 / 1 | [Dashboard.cs:506](../../../../UBClasses/Dashboard.cs#L506) |
| `UBDashBoardAssetClientOneCategoryGetX` | [L300146](../../../../ScriptDB/000_4_CreateSP.sql#L300146) | — | 2 / 0 | — |
| `UBDashBoardAssetGet_Client` | [L301471](../../../../ScriptDB/000_4_CreateSP.sql#L301471) | — | 0 / 1 | — |
| `UBDashBoardAssetGet_ClientX` | [L301495](../../../../ScriptDB/000_4_CreateSP.sql#L301495) | — | 2 / 0 | — |
| `UBDashBoardAssetGet_Family` | [L301628](../../../../ScriptDB/000_4_CreateSP.sql#L301628) | — | 0 / 1 | — |
| `UBDashBoardAssetGet_FamilyX` | [L301652](../../../../ScriptDB/000_4_CreateSP.sql#L301652) | — | 1 / 0 | — |
| `UBDashBoardClientCreatedDateGet` | [L305423](../../../../ScriptDB/000_4_CreateSP.sql#L305423) | 1 / 1 file | 0 / 0 | [Dashboard.cs:1704](../../../../UBClasses/Dashboard.cs#L1704) |
| `UBDashBoardClientExtTransferfGet` | [L305571](../../../../ScriptDB/000_4_CreateSP.sql#L305571) | — | 0 / 0 | — |
| `UBDashBoardClientMobilityExemption` | [L305689](../../../../ScriptDB/000_4_CreateSP.sql#L305689) | 1 / 1 file | 0 / 0 | [Dashboard.cs:1997](../../../../UBClasses/Dashboard.cs#L1997) |
| `UBDashBoardClientProvDetailGet` | [L305810](../../../../ScriptDB/000_4_CreateSP.sql#L305810) | 1 / 1 file | 0 / 0 | [Dashboard.cs:1935](../../../../UBClasses/Dashboard.cs#L1935) |
| `UBDashBoardClientProvGet` | [L305960](../../../../ScriptDB/000_4_CreateSP.sql#L305960) | 1 / 1 file | 0 / 0 | [Dashboard.cs:1876](../../../../UBClasses/Dashboard.cs#L1876) |
| `UBDashBoardClientReviewDateDetailGet` | [L306079](../../../../ScriptDB/000_4_CreateSP.sql#L306079) | 1 / 1 file | 0 / 0 | [Dashboard.cs:1537](../../../../UBClasses/Dashboard.cs#L1537) |
| `UBDashBoardClientReviewDateGet` | [L306340](../../../../ScriptDB/000_4_CreateSP.sql#L306340) | 1 / 1 file | 0 / 0 | [Dashboard.cs:388](../../../../UBClasses/Dashboard.cs#L388) |
| `UBDashBoardClientXInGet` | [L306562](../../../../ScriptDB/000_4_CreateSP.sql#L306562) | 1 / 1 file | 0 / 0 | [Dashboard.cs:2244](../../../../UBClasses/Dashboard.cs#L2244) |
| `UBDashBoardClientXOutGet` | [L306709](../../../../ScriptDB/000_4_CreateSP.sql#L306709) | 1 / 1 file | 0 / 0 | [Dashboard.cs:2128](../../../../UBClasses/Dashboard.cs#L2128) |
| `UBDocFileByClientID` | [L313206](../../../../ScriptDB/000_4_CreateSP.sql#L313206) | — | 0 / 0 | — |
| `UBDocFileClientList` | [L313223](../../../../ScriptDB/000_4_CreateSP.sql#L313223) | — | 0 / 0 | — |
| `UBDocListClient` | [L313693](../../../../ScriptDB/000_4_CreateSP.sql#L313693) | 1 / 1 file | 1 / 0 | [Document.cs:1674](../../../../UBClasses/Document.cs#L1674) |
| `UBDocListClientAll` | [L313746](../../../../ScriptDB/000_4_CreateSP.sql#L313746) | 1 / 1 file | 1 / 0 | [Document.cs:1823](../../../../UBClasses/Document.cs#L1823) |
| `UBEasyServSearchClient` | [L314880](../../../../ScriptDB/000_4_CreateSP.sql#L314880) | 1 / 1 file | 0 / 0 | [ClientInfo.cs:1361](../../../../UBExport/ClientInfo.cs#L1361) |
| `UBEnvelopeClientInfo` | [L318471](../../../../ScriptDB/000_4_CreateSP.sql#L318471) | — | 0 / 0 | — |
| `UBEnvelopeInfo_Client` | [L318827](../../../../ScriptDB/000_4_CreateSP.sql#L318827) | 1 / 1 file | 0 / 0 | [Document.cs:4834](../../../../UBClasses/Document.cs#L4834) |
| `UBEnvelopeListOneClient` | [L319916](../../../../ScriptDB/000_4_CreateSP.sql#L319916) | 1 / 1 file | 1 / 0 | [Forms.cs:1460](../../../../UBClasses/Forms.cs#L1460) |
| `UBEnvelopeMove2Client` | [L320099](../../../../ScriptDB/000_4_CreateSP.sql#L320099) | 1 / 1 file | 1 / 1 | [Document.cs:4567](../../../../UBClasses/Document.cs#L4567) |
| `UBFamilyEditComboList` | [L326076](../../../../ScriptDB/000_4_CreateSP.sql#L326076) | — | 0 / 2 | — |
| `UBFamilyGetClientID` | [L326102](../../../../ScriptDB/000_4_CreateSP.sql#L326102) | 1 / 1 file | 0 / 0 | [Family.cs:284](../../../../UBClasses/Family.cs#L284) |
| `UBFamilyItemInfo` | [L326132](../../../../ScriptDB/000_4_CreateSP.sql#L326132) | 1 / 1 file | 0 / 0 | [Family.cs:134](../../../../UBClasses/Family.cs#L134) |
| `UBFamilyLabelList` | [L326174](../../../../ScriptDB/000_4_CreateSP.sql#L326174) | 1 / 1 file | 0 / 1 | [ClientLabel.cs:370](../../../../VieFUNDPdf/ClientLabel.cs#L370) |
| `UBFamilyList` | [L326262](../../../../ScriptDB/000_4_CreateSP.sql#L326262) | 2 / 2 file | 0 / 1 | [Family.cs:235](../../../../UBClasses/Family.cs#L235) |
| `UBFamilyListOneClient` | [L326363](../../../../ScriptDB/000_4_CreateSP.sql#L326363) | 1 / 1 file | 0 / 0 | [Family.cs:90](../../../../UBClasses/Family.cs#L90) |
| `UBFamilyMemberAdd` | [L326424](../../../../ScriptDB/000_4_CreateSP.sql#L326424) | 1 / 1 file | 0 / 0 | [Family.cs:34](../../../../UBClasses/Family.cs#L34) |
| `UBFamilyMemberRefresh` | [L326558](../../../../ScriptDB/000_4_CreateSP.sql#L326558) | — | 0 / 1 | — |
| `UBFamilyMemberRemove` | [L326601](../../../../ScriptDB/000_4_CreateSP.sql#L326601) | 1 / 1 file | 1 / 0 | [Family.cs:183](../../../../UBClasses/Family.cs#L183) |
| `UBFamilyMemberUpdate` | [L326651](../../../../ScriptDB/000_4_CreateSP.sql#L326651) | 1 / 1 file | 0 / 0 | [Family.cs:34](../../../../UBClasses/Family.cs#L34) |
| `UBFATCAClassList` | [L326715](../../../../ScriptDB/000_4_CreateSP.sql#L326715) | — | 1 / 0 | — |
| `UBFATCAControllingPersonTypeList` | [L326753](../../../../ScriptDB/000_4_CreateSP.sql#L326753) | — | 1 / 0 | — |
| `UBFATCACtrlPersonDelete` | [L326790](../../../../ScriptDB/000_4_CreateSP.sql#L326790) | — | 1 / 0 | — |
| `UBFATCACtrlPersonInfo` | [L326809](../../../../ScriptDB/000_4_CreateSP.sql#L326809) | 1 / 1 file | 0 / 0 | [FATCA.cs:791](../../../../UBClasses/FATCA.cs#L791) |
| `UBFATCACtrlPersonList` | [L326840](../../../../ScriptDB/000_4_CreateSP.sql#L326840) | 1 / 1 file | 0 / 0 | [FATCA.cs:734](../../../../UBClasses/FATCA.cs#L734) |
| `UBFATCACtrlPersonUpdate` | [L326892](../../../../ScriptDB/000_4_CreateSP.sql#L326892) | 1 / 1 file | 0 / 1 | [FATCA.cs:887](../../../../UBClasses/FATCA.cs#L887) |
| `UBFATCADeletePerson` | [L327007](../../../../ScriptDB/000_4_CreateSP.sql#L327007) | — | 0 / 0 | — |
| `UBFATCAEntityTypeList` | [L327032](../../../../ScriptDB/000_4_CreateSP.sql#L327032) | — | 3 / 0 | — |
| `UBFATCAEntityUpdate` | [L327062](../../../../ScriptDB/000_4_CreateSP.sql#L327062) | — | 2 / 2 | — |
| `UBFATCAForeignIDAdd` | [L327198](../../../../ScriptDB/000_4_CreateSP.sql#L327198) | — | 1 / 0 | — |
| `UBFATCAForeignIDRemove` | [L327243](../../../../ScriptDB/000_4_CreateSP.sql#L327243) | — | 0 / 0 | — |
| `UBFATCAGet` | [L327296](../../../../ScriptDB/000_4_CreateSP.sql#L327296) | — | 2 / 2 | — |
| `UBFATCAIDTypeList` | [L327329](../../../../ScriptDB/000_4_CreateSP.sql#L327329) | — | 3 / 0 | — |
| `UBFATCAIndList` | [L327366](../../../../ScriptDB/000_4_CreateSP.sql#L327366) | — | 1 / 1 | — |
| `UBFATCAIndTINDelete` | [L327481](../../../../ScriptDB/000_4_CreateSP.sql#L327481) | — | 0 / 0 | — |
| `UBFATCAIndTINInfo` | [L327514](../../../../ScriptDB/000_4_CreateSP.sql#L327514) | 1 / 1 file | 0 / 0 | [FATCA.cs:510](../../../../UBClasses/FATCA.cs#L510) |
| `UBFATCAIndTINList` | [L327541](../../../../ScriptDB/000_4_CreateSP.sql#L327541) | 1 / 1 file | 2 / 0 | [FATCA.cs:453](../../../../UBClasses/FATCA.cs#L453) |
| `UBFATCAIndTINUpdate` | [L327595](../../../../ScriptDB/000_4_CreateSP.sql#L327595) | 1 / 1 file | 1 / 0 | [FATCA.cs:238](../../../../UBClasses/FATCA.cs#L238) |
| `UBFATCAList` | [L327702](../../../../ScriptDB/000_4_CreateSP.sql#L327702) | 1 / 1 file | 0 / 2 | [FATCA.cs:80](../../../../UBClasses/FATCA.cs#L80) |
| `UBFATCAList_TBD` | [L327742](../../../../ScriptDB/000_4_CreateSP.sql#L327742) | — | 0 / 1 | — |
| `UBFATCANoTINReasonList` | [L327934](../../../../ScriptDB/000_4_CreateSP.sql#L327934) | — | 1 / 0 | — |
| `UBFATCAOrgList` | [L327970](../../../../ScriptDB/000_4_CreateSP.sql#L327970) | — | 1 / 1 | — |
| `UBFATCAOrgTINDelete` | [L328100](../../../../ScriptDB/000_4_CreateSP.sql#L328100) | — | 0 / 1 | — |
| `UBFATCAOrgTINInfo` | [L328148](../../../../ScriptDB/000_4_CreateSP.sql#L328148) | 1 / 1 file | 0 / 0 | [FATCA.cs:625](../../../../UBClasses/FATCA.cs#L625) |
| `UBFATCAOrgTINList` | [L328181](../../../../ScriptDB/000_4_CreateSP.sql#L328181) | 1 / 1 file | 2 / 0 | [FATCA.cs:568](../../../../UBClasses/FATCA.cs#L568) |
| `UBFATCAOrgTINUpdate` | [L328244](../../../../ScriptDB/000_4_CreateSP.sql#L328244) | 1 / 1 file | 1 / 0 | [FATCA.cs:299](../../../../UBClasses/FATCA.cs#L299) |
| `UBFATCARemove` | [L328381](../../../../ScriptDB/000_4_CreateSP.sql#L328381) | — | 1 / 0 | — |
| `UBFATCARemoveEntity` | [L328419](../../../../ScriptDB/000_4_CreateSP.sql#L328419) | — | 1 / 0 | — |
| `UBFATCARemoveEntityOne` | [L328457](../../../../ScriptDB/000_4_CreateSP.sql#L328457) | — | 0 / 0 | — |
| `UBFATCARemoveOne` | [L328484](../../../../ScriptDB/000_4_CreateSP.sql#L328484) | — | 1 / 0 | — |
| `UBFATCAScanNonReportable` | [L328512](../../../../ScriptDB/000_4_CreateSP.sql#L328512) | — | 0 / 2 | — |
| `UBFATCAStatusList` | [L328601](../../../../ScriptDB/000_4_CreateSP.sql#L328601) | — | 3 / 0 | — |
| `UBFATCATINList` | [L328636](../../../../ScriptDB/000_4_CreateSP.sql#L328636) | 1 / 1 file | 0 / 2 | [FATCA.cs:398](../../../../UBClasses/FATCA.cs#L398) |
| `UBFATCAUpdate` | [L328681](../../../../ScriptDB/000_4_CreateSP.sql#L328681) | — | 3 / 2 | — |
| `UBFATCAVerify` | [L328767](../../../../ScriptDB/000_4_CreateSP.sql#L328767) | — | 0 / 1 | — |
| `UBFATCAVerify_CtrlPerson` | [L328832](../../../../ScriptDB/000_4_CreateSP.sql#L328832) | — | 1 / 1 | — |
| `UBFATCAVerify_IndTIN` | [L328920](../../../../ScriptDB/000_4_CreateSP.sql#L328920) | — | 2 / 0 | — |
| `UBFATCAVerify_One` | [L328995](../../../../ScriptDB/000_4_CreateSP.sql#L328995) | — | 1 / 3 | — |
| `UBFATCAVerify_OrgTIN` | [L329086](../../../../ScriptDB/000_4_CreateSP.sql#L329086) | — | 1 / 0 | — |
| `UBFATCAViewComboList` | [L329164](../../../../ScriptDB/000_4_CreateSP.sql#L329164) | — | 0 / 1 | — |
| `UBFormClientBank` | [L352023](../../../../ScriptDB/000_4_CreateSP.sql#L352023) | — | 1 / 0 | — |
| `UBFormClientSet` | [L352096](../../../../ScriptDB/000_4_CreateSP.sql#L352096) | 1 / 1 file | 0 / 1 | [CForm.cs:967](../../../../VieFUNDPdf/CForm.cs#L967) |
| `UBFormClientWF` | [L352184](../../../../ScriptDB/000_4_CreateSP.sql#L352184) | 1 / 1 file | 1 / 8 | [Forms.cs:641](../../../../UBClasses/Forms.cs#L641) |
| `UBFormKYCList` | [L357385](../../../../ScriptDB/000_4_CreateSP.sql#L357385) | — | 1 / 0 | — |
| `UBFSClientAdd` | [L360144](../../../../ScriptDB/000_4_CreateSP.sql#L360144) | — | 2 / 1 | — |
| `UBFSClientAddressAdd` | [L360202](../../../../ScriptDB/000_4_CreateSP.sql#L360202) | — | 2 / 2 | — |
| `UBFSClientAddressDup` | [L360244](../../../../ScriptDB/000_4_CreateSP.sql#L360244) | — | 2 / 0 | — |
| `UBFSClientSpouseLink` | [L360275](../../../../ScriptDB/000_4_CreateSP.sql#L360275) | — | 2 / 0 | — |
| `UBFSClientUpdate` | [L360304](../../../../ScriptDB/000_4_CreateSP.sql#L360304) | — | 1 / 1 | — |
| `UBFSXMLBeneficiary` | [L362009](../../../../ScriptDB/000_4_CreateSP.sql#L362009) | — | 3 / 1 | — |
| `UBFSXMLBeneficiaryContinuing` | [L362134](../../../../ScriptDB/000_4_CreateSP.sql#L362134) | — | 1 / 1 | — |
| `UBFSXMLBeneficiaryContinuingOne` | [L362184](../../../../ScriptDB/000_4_CreateSP.sql#L362184) | — | 1 / 0 | — |
| `UBIntermediaryAdd` | [L425993](../../../../ScriptDB/000_4_CreateSP.sql#L425993) | 1 / 1 file | 2 / 2 | [Intermediary.cs:464](../../../../UBClasses/Intermediary.cs#L464) |
| `UBIntermediaryDropDownList` | [L426054](../../../../ScriptDB/000_4_CreateSP.sql#L426054) | — | 2 / 0 | — |
| `UBIntermediaryInfo` | [L426070](../../../../ScriptDB/000_4_CreateSP.sql#L426070) | — | 1 / 0 | — |
| `UBIntermediaryList` | [L426140](../../../../ScriptDB/000_4_CreateSP.sql#L426140) | 1 / 1 file | 0 / 0 | [Intermediary.cs:351](../../../../UBClasses/Intermediary.cs#L351) |
| `UBIntermediaryRemove` | [L426203](../../../../ScriptDB/000_4_CreateSP.sql#L426203) | 1 / 1 file | 0 / 0 | [Intermediary.cs:556](../../../../UBClasses/Intermediary.cs#L556) |
| `UBIntermediaryUpdate` | [L426243](../../../../ScriptDB/000_4_CreateSP.sql#L426243) | 1 / 1 file | 0 / 4 | [Intermediary.cs:464](../../../../UBClasses/Intermediary.cs#L464) |
| `UBKYCExpiredNotify` | [L426772](../../../../ScriptDB/000_4_CreateSP.sql#L426772) | 1 / 1 file | 0 / 1 | [Dashboard.cs:2751](../../../../UBClasses/Dashboard.cs#L2751) |
| `UBKYPComboList_Client` | [L427434](../../../../ScriptDB/000_4_CreateSP.sql#L427434) | — | 0 / 7 | — |
| `UBKYPCompareListCurrent_Client` | [L427562](../../../../ScriptDB/000_4_CreateSP.sql#L427562) | 1 / 1 file | 0 / 1 | [FundDef.cs:651](../../../../UBClasses/FundDef.cs#L651) |
| `UBKYPCompareListDetail_Client` | [L432117](../../../../ScriptDB/000_4_CreateSP.sql#L432117) | 2 / 2 file | 0 / 1 | [FundDef.cs:3127](../../../../UBClasses/FundDef.cs#L3127) |
| `UBKYPCompareListHistory_Client` | [L432595](../../../../ScriptDB/000_4_CreateSP.sql#L432595) | 2 / 1 file | 0 / 1 | [FundDef.cs:582](../../../../UBClasses/FundDef.cs#L582) |
| `UBKYPCompareListRemove_Client` | [L432756](../../../../ScriptDB/000_4_CreateSP.sql#L432756) | 1 / 1 file | 0 / 0 | [FundDef.cs:814](../../../../UBClasses/FundDef.cs#L814) |
| `UBKYPCompareListUpdatePdfObj_Client` | [L432820](../../../../ScriptDB/000_4_CreateSP.sql#L432820) | 1 / 1 file | 0 / 2 | [FundDef.cs:3320](../../../../UBClasses/FundDef.cs#L3320) |
| `UBLoanListClient` | [L436356](../../../../ScriptDB/000_4_CreateSP.sql#L436356) | 1 / 1 file | 0 / 0 | [Loan.cs:517](../../../../UBClasses/Loan.cs#L517) |
| `UBMember4NewClient` | [L438498](../../../../ScriptDB/000_4_CreateSP.sql#L438498) | 1 / 1 file | 0 / 0 | [Member.cs:3537](../../../../UBClasses/Member.cs#L3537) |
| `UBMergeClientInfo` | [L447491](../../../../ScriptDB/000_4_CreateSP.sql#L447491) | 1 / 1 file | 0 / 1 | [Plan.cs:3210](../../../../UBClasses/Plan.cs#L3210) |
| `UBNoteListClient` | [L454873](../../../../ScriptDB/000_4_CreateSP.sql#L454873) | 1 / 1 file | 2 / 0 | [Note.cs:135](../../../../UBClasses/Note.cs#L135) |
| `UBOneSpanEnvelopeListOneClient` | [L472252](../../../../ScriptDB/000_4_CreateSP.sql#L472252) | 2 / 2 file | 0 / 0 | [ESignature.cs:333](../../../../UBClasses/ESignature.cs#L333) |
| `UBReportClient` | [L511381](../../../../ScriptDB/000_4_CreateSP.sql#L511381) | — | 0 / 7 | — |
| `UBReportClientAssetDetailByDayList` | [L527031](../../../../ScriptDB/000_4_CreateSP.sql#L527031) | — | 2 / 2 | — |
| `UBReportClientAssetMix` | [L527582](../../../../ScriptDB/000_4_CreateSP.sql#L527582) | 1 / 1 file | 0 / 18 | [CReport.cs:1413](../../../../VieFUNDPdf/CReport.cs#L1413) |
| `UBReportClientCapitalGainStatement` | [L528837](../../../../ScriptDB/000_4_CreateSP.sql#L528837) | 1 / 1 file | 0 / 19 | [CReport.cs:901](../../../../VieFUNDPdf/CReport.cs#L901) |
| `UBReportClientInvestorStatement` | [L536120](../../../../ScriptDB/000_4_CreateSP.sql#L536120) | — | 0 / 20 | — |
| `UBReportClientInvestorStatement_PerCurrency` | [L538647](../../../../ScriptDB/000_4_CreateSP.sql#L538647) | — | 0 / 21 | — |
| `UBReportClientInvestorStatement_XIRR` | [L541180](../../../../ScriptDB/000_4_CreateSP.sql#L541180) | 1 / 1 file | 0 / 22 | [CReport.cs:1156](../../../../VieFUNDPdf/CReport.cs#L1156) |
| `UBReportClientKYC` | [L544302](../../../../ScriptDB/000_4_CreateSP.sql#L544302) | 1 / 1 file | 0 / 14 | [CClientKYC.cs:145](../../../../VieFUNDPdf/CClientKYC.cs#L145) |
| `UBReportClientKYC2` | [L544907](../../../../ScriptDB/000_4_CreateSP.sql#L544907) | — | 0 / 24 | — |
| `UBReportClientOnLineOK` | [L545171](../../../../ScriptDB/000_4_CreateSP.sql#L545171) | 1 / 1 file | 0 / 0 | [CReport.cs:7019](../../../../VieFUNDPdf/CReport.cs#L7019) |
| `UBReportClientPdfObjApprove` | [L545228](../../../../ScriptDB/000_4_CreateSP.sql#L545228) | — | 0 / 1 | — |
| `UBReportClientPdfObjList` | [L545296](../../../../ScriptDB/000_4_CreateSP.sql#L545296) | 1 / 1 file | 0 / 0 | [CReport.cs:6794](../../../../VieFUNDPdf/CReport.cs#L6794) |
| `UBReportClientPdfObjRemove` | [L545355](../../../../ScriptDB/000_4_CreateSP.sql#L545355) | 1 / 1 file | 2 / 0 | [CReportSchedule.cs:809](../../../../UBClasses/CReportSchedule.cs#L809) |
| `UBReportClientPdfObjRemoveBulk` | [L545405](../../../../ScriptDB/000_4_CreateSP.sql#L545405) | — | 0 / 1 | — |
| `UBReportClientPdfObjSet` | [L545447](../../../../ScriptDB/000_4_CreateSP.sql#L545447) | 1 / 1 file | 0 / 0 | [CReport.cs:6845](../../../../VieFUNDPdf/CReport.cs#L6845) |
| `UBReportClientPerformance` | [L545595](../../../../ScriptDB/000_4_CreateSP.sql#L545595) | 1 / 1 file | 0 / 22 | [ClientPerformance.cs:54](../../../../VieFUNDPdf/ClientPerformance.cs#L54) |
| `UBReportClientPortfolioPerformance` | [L548604](../../../../ScriptDB/000_4_CreateSP.sql#L548604) | 1 / 1 file | 0 / 24 | [ClientPerformance.cs:885](../../../../VieFUNDPdf/ClientPerformance.cs#L885) |
| `UBReportClientStatementListExport` | [L551819](../../../../ScriptDB/000_4_CreateSP.sql#L551819) | — | 0 / 0 | — |
| `UBReportFamily` | [L552351](../../../../ScriptDB/000_4_CreateSP.sql#L552351) | 1 / 1 file | 0 / 16 | [FamilyReport.cs:472](../../../../VieFUNDPdf/FamilyReport.cs#L472) |
| `UBReportFamily_Old` | [L555189](../../../../ScriptDB/000_4_CreateSP.sql#L555189) | — | 0 / 16 | — |
| `UBReportFamilyPerformance` | [L559311](../../../../ScriptDB/000_4_CreateSP.sql#L559311) | 1 / 1 file | 0 / 17 | [FamilyReport.cs:825](../../../../VieFUNDPdf/FamilyReport.cs#L825) |
| `UBReportPdfObjResetApproveClient` | [L564017](../../../../ScriptDB/000_4_CreateSP.sql#L564017) | — | 0 / 0 | — |
| `UBReportTaskAddClientStmt` | [L566414](../../../../ScriptDB/000_4_CreateSP.sql#L566414) | — | 0 / 2 | — |
| `UBReportTaskClientStatementSet` | [L566992](../../../../ScriptDB/000_4_CreateSP.sql#L566992) | — | 0 / 1 | — |
| `UBReportTaskClientStatementSummary` | [L567158](../../../../ScriptDB/000_4_CreateSP.sql#L567158) | — | 0 / 1 | — |
| `UBSignorityEnvelopeListOneClient` | [L600481](../../../../ScriptDB/000_4_CreateSP.sql#L600481) | 2 / 2 file | 0 / 1 | [ESignature.cs:278](../../../../UBClasses/ESignature.cs#L278) |
| `UBTransferReminderOneClient` | [L640324](../../../../ScriptDB/000_4_CreateSP.sql#L640324) | 1 / 1 file | 1 / 0 | [TransferReminder.cs:313](../../../../UBClasses/TransferReminder.cs#L313) |
| `UBTrxClientList` | [L664365](../../../../ScriptDB/000_4_CreateSP.sql#L664365) | 1 / 1 file | 0 / 0 | [Trx.cs:2309](../../../../UBClasses/Trx.cs#L2309) |
| `UBTrxConfClientID` | [L664601](../../../../ScriptDB/000_4_CreateSP.sql#L664601) | — | 0 / 0 | — |
| `UBTrxConfirmationListClient` | [L665672](../../../../ScriptDB/000_4_CreateSP.sql#L665672) | 1 / 1 file | 0 / 1 | [CTrxConfirmation.cs:264](../../../../UBClasses/CTrxConfirmation.cs#L264) |
| `UBTrxConfirmationListOneClient` | [L666418](../../../../ScriptDB/000_4_CreateSP.sql#L666418) | 1 / 1 file | 0 / 0 | [Document.cs:3568](../../../../UBClasses/Document.cs#L3568) |
| `UBTrxOneClientList` | [L670876](../../../../ScriptDB/000_4_CreateSP.sql#L670876) | 1 / 1 file | 0 / 0 | [Trx.cs:2585](../../../../UBClasses/Trx.cs#L2585) |
| `UBWebClientComboList` | [L684625](../../../../ScriptDB/000_4_CreateSP.sql#L684625) | — | 0 / 1 | — |
| `UBWebClientPreLogin` | [L684650](../../../../ScriptDB/000_4_CreateSP.sql#L684650) | 1 / 1 file | 0 / 0 | [Customer.cs:5583](../../../../UBClasses/Customer.cs#L5583) |
| `UBWebClientStatusList` | [L684688](../../../../ScriptDB/000_4_CreateSP.sql#L684688) | — | 3 / 0 | — |
| `UBWebClientUserExist` | [L684717](../../../../ScriptDB/000_4_CreateSP.sql#L684717) | — | 0 / 0 | — |
| `UBWebClientUserIDVerify` | [L684741](../../../../ScriptDB/000_4_CreateSP.sql#L684741) | 1 / 1 file | 0 / 0 | [Customer.cs:5014](../../../../UBClasses/Customer.cs#L5014) |
| `UBWebClientUserList` | [L684773](../../../../ScriptDB/000_4_CreateSP.sql#L684773) | 2 / 1 file | 0 / 0 | [WFPassword.aspx.cs:281](../../../../WebApp/Main/WFPassword.aspx.cs#L281) |
| `UBWebClientUserUpdate` | [L684827](../../../../ScriptDB/000_4_CreateSP.sql#L684827) | 1 / 1 file | 2 / 1 | [Customer.cs:4355](../../../../UBClasses/Customer.cs#L4355) |
| `UBWebClientUserUpdatePW` | [L684953](../../../../ScriptDB/000_4_CreateSP.sql#L684953) | 2 / 2 file | 0 / 0 | [Customer.cs:4877](../../../../UBClasses/Customer.cs#L4877) |
| `UBWebClientUserUpdatePWEx` | [L684988](../../../../ScriptDB/000_4_CreateSP.sql#L684988) | 1 / 1 file | 0 / 0 | [Customer.cs:4826](../../../../UBClasses/Customer.cs#L4826) |
| `UBWebClientUserUpdatePWEx2` | [L685133](../../../../ScriptDB/000_4_CreateSP.sql#L685133) | 1 / 1 file | 0 / 0 | [Customer.cs:5625](../../../../UBClasses/Customer.cs#L5625) |
| `UBXML2TMP_ClientInfo` | [L686526](../../../../ScriptDB/000_4_CreateSP.sql#L686526) | — | 0 / 0 | — |
| `UBXML2TMP_ClientInfoEx` | [L686559](../../../../ScriptDB/000_4_CreateSP.sql#L686559) | — | 0 / 0 | — |
| `V27_FATCACtrlPerson` | [L707088](../../../../ScriptDB/000_4_CreateSP.sql#L707088) | — | 1 / 0 | — |
| `V27_FATCAEntity` | [L707114](../../../../ScriptDB/000_4_CreateSP.sql#L707114) | — | 0 / 2 | — |
| `V27_FATCAIndividual` | [L707200](../../../../ScriptDB/000_4_CreateSP.sql#L707200) | — | 0 / 1 | — |
| `V27_FATCAIndividual_TIN` | [L707274](../../../../ScriptDB/000_4_CreateSP.sql#L707274) | — | 1 / 0 | — |
| `V27_FATCAOrg_TIN` | [L707311](../../../../ScriptDB/000_4_CreateSP.sql#L707311) | — | 1 / 0 | — |
| `V33_FATCA_Scan_Set_NonReportable` | [L707334](../../../../ScriptDB/000_4_CreateSP.sql#L707334) | — | 0 / 2 | — |
| `VF_VF_AllClient` | [L707408](../../../../ScriptDB/000_4_CreateSP.sql#L707408) | — | 0 / 2 | — |
| `VF_VF_AllClientX` | [L707453](../../../../ScriptDB/000_4_CreateSP.sql#L707453) | — | 0 / 1 | — |
| `VF_VF_AllCompCheckClient` | [L707762](../../../../ScriptDB/000_4_CreateSP.sql#L707762) | — | 0 / 0 | — |
| `VF_VF_AllCompCheckClientARC` | [L707807](../../../../ScriptDB/000_4_CreateSP.sql#L707807) | — | 0 / 0 | — |
| `VF_VF_BankOneClient` | [L709024](../../../../ScriptDB/000_4_CreateSP.sql#L709024) | — | 1 / 1 | — |
| `VF_VF_BankOneClientX` | [L709078](../../../../ScriptDB/000_4_CreateSP.sql#L709078) | — | 1 / 1 | — |
| `VF_VF_ClientPWList` | [L709348](../../../../ScriptDB/000_4_CreateSP.sql#L709348) | 1 / 1 file | 0 / 0 | [WFPassword.aspx.cs:462](../../../../WebApp/Main/WFPassword.aspx.cs#L462) |
| `VF_VF_CompanyInfoOneClient` | [L709389](../../../../ScriptDB/000_4_CreateSP.sql#L709389) | — | 1 / 0 | — |
| `VF_VF_IdentificationOneClient` | [L709605](../../../../ScriptDB/000_4_CreateSP.sql#L709605) | — | 1 / 0 | — |
| `VF_VF_IdentificationOneClientX` | [L709638](../../../../ScriptDB/000_4_CreateSP.sql#L709638) | — | 1 / 0 | — |
| `VF_VF_OneClient` | [L710450](../../../../ScriptDB/000_4_CreateSP.sql#L710450) | — | 1 / 9 | — |
| `VF_VF_OneClientAddress` | [L710791](../../../../ScriptDB/000_4_CreateSP.sql#L710791) | — | 2 / 0 | — |
| `VF_VF_OneClientAddressX` | [L710830](../../../../ScriptDB/000_4_CreateSP.sql#L710830) | — | 2 / 0 | — |
| `VF_VF_OneClientX` | [L710861](../../../../ScriptDB/000_4_CreateSP.sql#L710861) | — | 1 / 7 | — |
| `VF_VF_QuestionOneClient` | [L713172](../../../../ScriptDB/000_4_CreateSP.sql#L713172) | — | 0 / 0 | — |
| `WFKYCChangeList` | [L713402](../../../../ScriptDB/000_4_CreateSP.sql#L713402) | — | 0 / 1 | — |
| `WFKYCChangeListSetSelection` | [L713672](../../../../ScriptDB/000_4_CreateSP.sql#L713672) | 1 / 1 file | 0 / 2 | [OBCompARC.cs:268](../../../../UBClasses/OBCompARC.cs#L268) |
