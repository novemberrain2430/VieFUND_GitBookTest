# SP Catalog — Documents & PDF

> Phân nhóm gợi ý theo tên procedure. Các cột caller mới là bằng chứng truy vết; `—` không có nghĩa procedure không được dùng.

**Tổng**: 126 definition; 63 có tên tĩnh từ C#; 19 được procedure khác gọi qua EXEC/EXECUTE.

| Procedure | Definition | C# tĩnh | SQL gọi vào / gọi ra | Caller C# mẫu |
|---|---:|---:|---:|---|
| `CON_InitDealerForms` | [L28136](../../../../ScriptDB/000_4_CreateSP.sql#L28136) | — | 0 / 1 | — |
| `CON_OB_Add1AttachmentFile` | [L29002](../../../../ScriptDB/000_4_CreateSP.sql#L29002) | — | 0 / 0 | — |
| `CON_OB_Attachment` | [L29120](../../../../ScriptDB/000_4_CreateSP.sql#L29120) | — | 0 / 0 | — |
| `CON_OB_AttachmentList` | [L29269](../../../../ScriptDB/000_4_CreateSP.sql#L29269) | — | 0 / 0 | — |
| `CON_UN_Add1AttachmentFile` | [L35654](../../../../ScriptDB/000_4_CreateSP.sql#L35654) | — | 0 / 0 | — |
| `CON_UN_AttachmentList` | [L35734](../../../../ScriptDB/000_4_CreateSP.sql#L35734) | — | 0 / 0 | — |
| `CON_WF_Add1AttachmentFile` | [L38577](../../../../ScriptDB/000_4_CreateSP.sql#L38577) | — | 0 / 0 | — |
| `CON_WF_Attachment` | [L38833](../../../../ScriptDB/000_4_CreateSP.sql#L38833) | — | 0 / 0 | — |
| `CON_WF_Attachment_Step1` | [L38982](../../../../ScriptDB/000_4_CreateSP.sql#L38982) | — | 0 / 0 | — |
| `CON_WF_Attachment_Step2` | [L39003](../../../../ScriptDB/000_4_CreateSP.sql#L39003) | — | 0 / 0 | — |
| `CON_WF_Attachment_Topup` | [L39201](../../../../ScriptDB/000_4_CreateSP.sql#L39201) | — | 0 / 0 | — |
| `CON_WF_AttachmentFileList` | [L39353](../../../../ScriptDB/000_4_CreateSP.sql#L39353) | — | 0 / 0 | — |
| `CON_WF_Doc` | [L47748](../../../../ScriptDB/000_4_CreateSP.sql#L47748) | — | 0 / 0 | — |
| `CON_WF_Doc_Def` | [L47902](../../../../ScriptDB/000_4_CreateSP.sql#L47902) | — | 0 / 0 | — |
| `CON_WF_FixDoc` | [L48547](../../../../ScriptDB/000_4_CreateSP.sql#L48547) | — | 0 / 0 | — |
| `CON_WF_FixDocStatus` | [L48707](../../../../ScriptDB/000_4_CreateSP.sql#L48707) | — | 0 / 0 | — |
| `CON_WF_Form` | [L48754](../../../../ScriptDB/000_4_CreateSP.sql#L48754) | — | 0 / 1 | — |
| `CON_WF_Form_GenerateScript` | [L48797](../../../../ScriptDB/000_4_CreateSP.sql#L48797) | — | 0 / 1 | — |
| `CON_WF_OneRep_Attachment` | [L61461](../../../../ScriptDB/000_4_CreateSP.sql#L61461) | — | 1 / 0 | — |
| `CON_WF_OneRep_Attachment_Topup` | [L61843](../../../../ScriptDB/000_4_CreateSP.sql#L61843) | — | 0 / 0 | — |
| `CON_WF_OneRep_CompDoc` | [L62035](../../../../ScriptDB/000_4_CreateSP.sql#L62035) | — | 1 / 0 | — |
| `CON_WF_OneRep_CompDoc_Topup` | [L62184](../../../../ScriptDB/000_4_CreateSP.sql#L62184) | — | 0 / 0 | — |
| `CON_WS_Add1AttachmentFile` | [L91217](../../../../ScriptDB/000_4_CreateSP.sql#L91217) | — | 0 / 0 | — |
| `CON_WS_AttachList` | [L91262](../../../../ScriptDB/000_4_CreateSP.sql#L91262) | — | 0 / 0 | — |
| `DI_AssignDocAll` | [L96754](../../../../ScriptDB/000_4_CreateSP.sql#L96754) | — | 0 / 1 | — |
| `Init_ImportForms` | [L119624](../../../../ScriptDB/000_4_CreateSP.sql#L119624) | — | 0 / 0 | — |
| `PHX_CON_Docs` | [L162253](../../../../ScriptDB/000_4_CreateSP.sql#L162253) | — | 0 / 0 | — |
| `UBAttachComboList` | [L186710](../../../../ScriptDB/000_4_CreateSP.sql#L186710) | — | 0 / 3 | — |
| `UBAttachmentDescAdd` | [L186730](../../../../ScriptDB/000_4_CreateSP.sql#L186730) | — | 4 / 0 | — |
| `UBAttachmentDescList` | [L186775](../../../../ScriptDB/000_4_CreateSP.sql#L186775) | 1 / 1 file | 0 / 0 | [Document.cs:257](../../../../UBClasses/Document.cs#L257) |
| `UBAttachmentTypeList` | [L186823](../../../../ScriptDB/000_4_CreateSP.sql#L186823) | — | 2 / 0 | — |
| `UBCompDocSetReceivedTagged` | [L276847](../../../../ScriptDB/000_4_CreateSP.sql#L276847) | 1 / 1 file | 0 / 0 | [Document.cs:2476](../../../../UBClasses/Document.cs#L2476) |
| `UBDocAdd` | [L311377](../../../../ScriptDB/000_4_CreateSP.sql#L311377) | 2 / 1 file | 2 / 2 | [Document.cs:1213](../../../../UBClasses/Document.cs#L1213) |
| `UBDocAddFromFile` | [L311444](../../../../ScriptDB/000_4_CreateSP.sql#L311444) | — | 0 / 0 | — |
| `UBDocAddInternal` | [L311894](../../../../ScriptDB/000_4_CreateSP.sql#L311894) | — | 3 / 2 | — |
| `UBDocAddLink` | [L312049](../../../../ScriptDB/000_4_CreateSP.sql#L312049) | — | 10 / 0 | — |
| `UBDocAttach4Approval` | [L312570](../../../../ScriptDB/000_4_CreateSP.sql#L312570) | — | 0 / 0 | — |
| `UBDocAttach4ApprovalSave` | [L312626](../../../../ScriptDB/000_4_CreateSP.sql#L312626) | — | 0 / 0 | — |
| `UBDocAttachInfo` | [L312653](../../../../ScriptDB/000_4_CreateSP.sql#L312653) | 2 / 2 file | 0 / 0 | [Document.cs:448](../../../../UBClasses/Document.cs#L448) |
| `UBDocAttachment2CompDoc` | [L312703](../../../../ScriptDB/000_4_CreateSP.sql#L312703) | 1 / 1 file | 0 / 0 | [Document.cs:2699](../../../../UBClasses/Document.cs#L2699) |
| `UBDocDefAdd` | [L312739](../../../../ScriptDB/000_4_CreateSP.sql#L312739) | 1 / 1 file | 0 / 1 | [Document.cs:665](../../../../UBClasses/Document.cs#L665) |
| `UBDocDefDelete` | [L312828](../../../../ScriptDB/000_4_CreateSP.sql#L312828) | 1 / 1 file | 0 / 0 | [Document.cs:749](../../../../UBClasses/Document.cs#L749) |
| `UBDocDefList` | [L312866](../../../../ScriptDB/000_4_CreateSP.sql#L312866) | 2 / 1 file | 0 / 0 | [Document.cs:448](../../../../UBClasses/Document.cs#L448) |
| `UBDocDefUpdate` | [L312921](../../../../ScriptDB/000_4_CreateSP.sql#L312921) | 1 / 1 file | 0 / 1 | [Document.cs:665](../../../../UBClasses/Document.cs#L665) |
| `UBDocDelete` | [L313022](../../../../ScriptDB/000_4_CreateSP.sql#L313022) | 1 / 1 file | 0 / 0 | [Document.cs:2025](../../../../UBClasses/Document.cs#L2025) |
| `UBDocDescriptionGet` | [L313096](../../../../ScriptDB/000_4_CreateSP.sql#L313096) | 1 / 1 file | 0 / 0 | [Document.cs:1780](../../../../UBClasses/Document.cs#L1780) |
| `UBDocDescriptionSet` | [L313121](../../../../ScriptDB/000_4_CreateSP.sql#L313121) | 1 / 1 file | 0 / 1 | [Document.cs:1731](../../../../UBClasses/Document.cs#L1731) |
| `UBDocFileObj` | [L313237](../../../../ScriptDB/000_4_CreateSP.sql#L313237) | 1 / 1 file | 0 / 0 | [Document.cs:524](../../../../UBClasses/Document.cs#L524) |
| `UBDocFileObjUpdate` | [L313261](../../../../ScriptDB/000_4_CreateSP.sql#L313261) | 1 / 1 file | 0 / 0 | [DocumentObj.cs:23](../../../../UBConnection/DocumentObj.cs#L23) |
| `UBDocListAtt` | [L313285](../../../../ScriptDB/000_4_CreateSP.sql#L313285) | 1 / 1 file | 0 / 1 | [Document.cs:2524](../../../../UBClasses/Document.cs#L2524) |
| `UBDocListByAttachmentID` | [L313616](../../../../ScriptDB/000_4_CreateSP.sql#L313616) | 1 / 1 file | 0 / 0 | [Document.cs:2071](../../../../UBClasses/Document.cs#L2071) |
| `UBDocListByRepCode` | [L313666](../../../../ScriptDB/000_4_CreateSP.sql#L313666) | — | 0 / 0 | — |
| `UBDocListView` | [L313954](../../../../ScriptDB/000_4_CreateSP.sql#L313954) | 1 / 1 file | 0 / 1 | [Document.cs:2124](../../../../UBClasses/Document.cs#L2124) |
| `UBDocSelectionUpdate` | [L314212](../../../../ScriptDB/000_4_CreateSP.sql#L314212) | — | 0 / 0 | — |
| `UBDocTMPAdd` | [L314257](../../../../ScriptDB/000_4_CreateSP.sql#L314257) | 2 / 1 file | 0 / 0 | [Document.cs:798](../../../../UBClasses/Document.cs#L798) |
| `UBDocTMPComfirm` | [L314289](../../../../ScriptDB/000_4_CreateSP.sql#L314289) | 1 / 1 file | 0 / 0 | [Document.cs:1143](../../../../UBClasses/Document.cs#L1143) |
| `UBDocTMPEnd` | [L314323](../../../../ScriptDB/000_4_CreateSP.sql#L314323) | 2 / 1 file | 1 / 0 | [Document.cs:1001](../../../../UBClasses/Document.cs#L1001) |
| `UBDocTMPExist` | [L314371](../../../../ScriptDB/000_4_CreateSP.sql#L314371) | 1 / 1 file | 0 / 0 | [Document.cs:1041](../../../../UBClasses/Document.cs#L1041) |
| `UBDocTMPGet` | [L314426](../../../../ScriptDB/000_4_CreateSP.sql#L314426) | 1 / 1 file | 0 / 0 | [Document.cs:1093](../../../../UBClasses/Document.cs#L1093) |
| `UBDocTypeList` | [L314456](../../../../ScriptDB/000_4_CreateSP.sql#L314456) | — | 1 / 0 | — |
| `UBDocUpdate` | [L314615](../../../../ScriptDB/000_4_CreateSP.sql#L314615) | — | 0 / 0 | — |
| `UBDocViewComboList` | [L314780](../../../../ScriptDB/000_4_CreateSP.sql#L314780) | — | 0 / 4 | — |
| `UBEnvelopeDetachFromDoc` | [L318496](../../../../ScriptDB/000_4_CreateSP.sql#L318496) | 1 / 1 file | 0 / 0 | [Document.cs:4519](../../../../UBClasses/Document.cs#L4519) |
| `UBEnvelopeDocInfo` | [L318557](../../../../ScriptDB/000_4_CreateSP.sql#L318557) | 1 / 1 file | 0 / 0 | [Document.cs:4881](../../../../UBClasses/Document.cs#L4881) |
| `UBEnvelopeDocRemove` | [L318618](../../../../ScriptDB/000_4_CreateSP.sql#L318618) | 1 / 1 file | 0 / 0 | [Forms.cs:1693](../../../../UBClasses/Forms.cs#L1693) |
| `UBEnvelopeMove2Attachment` | [L320078](../../../../ScriptDB/000_4_CreateSP.sql#L320078) | — | 0 / 1 | — |
| `UBEnvelopeMoveTagged2Attachment` | [L320454](../../../../ScriptDB/000_4_CreateSP.sql#L320454) | 1 / 1 file | 0 / 1 | [Document.cs:4216](../../../../UBClasses/Document.cs#L4216) |
| `UBESignatureOneSpanGet` | [L321181](../../../../ScriptDB/000_4_CreateSP.sql#L321181) | 2 / 2 file | 0 / 0 | [ESignature.cs:231](../../../../UBClasses/ESignature.cs#L231) |
| `UBESignatureOneSpanSave` | [L321207](../../../../ScriptDB/000_4_CreateSP.sql#L321207) | 2 / 2 file | 0 / 1 | [ESignature.cs:142](../../../../UBClasses/ESignature.cs#L142) |
| `UBESignatureSignorityGet` | [L321223](../../../../ScriptDB/000_4_CreateSP.sql#L321223) | 2 / 2 file | 1 / 0 | [ESignature.cs:186](../../../../UBClasses/ESignature.cs#L186) |
| `UBESignatureSignoritySave` | [L321279](../../../../ScriptDB/000_4_CreateSP.sql#L321279) | 2 / 2 file | 0 / 1 | [ESignature.cs:95](../../../../UBClasses/ESignature.cs#L95) |
| `UBESignatureSourceTypeList` | [L321304](../../../../ScriptDB/000_4_CreateSP.sql#L321304) | — | 1 / 0 | — |
| `UBFormAdd` | [L351853](../../../../ScriptDB/000_4_CreateSP.sql#L351853) | — | 3 / 0 | — |
| `UBFormChangeFileName` | [L351935](../../../../ScriptDB/000_4_CreateSP.sql#L351935) | — | 0 / 0 | — |
| `UBFormCheckSigPosDate` | [L351993](../../../../ScriptDB/000_4_CreateSP.sql#L351993) | 1 / 1 file | 0 / 0 | [Forms.cs:1147](../../../../UBClasses/Forms.cs#L1147) |
| `UBFormDelete` | [L354493](../../../../ScriptDB/000_4_CreateSP.sql#L354493) | — | 0 / 0 | — |
| `UBFormFileList` | [L354523](../../../../ScriptDB/000_4_CreateSP.sql#L354523) | 1 / 1 file | 2 / 0 | [Forms.cs:1025](../../../../UBClasses/Forms.cs#L1025) |
| `UBFormFileName` | [L354570](../../../../ScriptDB/000_4_CreateSP.sql#L354570) | — | 0 / 0 | — |
| `UBFormFileRemove` | [L354613](../../../../ScriptDB/000_4_CreateSP.sql#L354613) | — | 0 / 0 | — |
| `UBFormGetInfoSpec` | [L355695](../../../../ScriptDB/000_4_CreateSP.sql#L355695) | — | 0 / 0 | — |
| `UBFormGetSigPosSet` | [L355738](../../../../ScriptDB/000_4_CreateSP.sql#L355738) | 1 / 1 file | 0 / 0 | [CForm.cs:3034](../../../../VieFUNDPdf/CForm.cs#L3034) |
| `UBFormInfo` | [L356975](../../../../ScriptDB/000_4_CreateSP.sql#L356975) | 1 / 1 file | 0 / 1 | [Forms.cs:272](../../../../UBClasses/Forms.cs#L272) |
| `UBFormInfoX` | [L357007](../../../../ScriptDB/000_4_CreateSP.sql#L357007) | 1 / 1 file | 0 / 1 | [Forms.cs:326](../../../../UBClasses/Forms.cs#L326) |
| `UBFormLoanSet` | [L357409](../../../../ScriptDB/000_4_CreateSP.sql#L357409) | — | 0 / 6 | — |
| `UBFormObjAdd2Env` | [L357717](../../../../ScriptDB/000_4_CreateSP.sql#L357717) | 1 / 1 file | 0 / 5 | [Forms.cs:1353](../../../../UBClasses/Forms.cs#L1353) |
| `UBFormSave1SigPos` | [L358402](../../../../ScriptDB/000_4_CreateSP.sql#L358402) | 1 / 1 file | 0 / 0 | [Forms.cs:1094](../../../../UBClasses/Forms.cs#L1094) |
| `UBFormSaveSetting` | [L358436](../../../../ScriptDB/000_4_CreateSP.sql#L358436) | 1 / 1 file | 0 / 0 | [Forms.cs:1298](../../../../UBClasses/Forms.cs#L1298) |
| `UBFormSettingInfo` | [L358490](../../../../ScriptDB/000_4_CreateSP.sql#L358490) | 1 / 1 file | 5 / 0 | [CVFDocSign.cs:1890](../../../../VFDocSign/CVFDocSign.cs#L1890) |
| `UBFormsList` | [L358556](../../../../ScriptDB/000_4_CreateSP.sql#L358556) | 1 / 1 file | 0 / 1 | [Forms.cs:58](../../../../UBClasses/Forms.cs#L58) |
| `UBFormsListDetail` | [L358661](../../../../ScriptDB/000_4_CreateSP.sql#L358661) | 1 / 1 file | 0 / 0 | [Forms.cs:216](../../../../UBClasses/Forms.cs#L216) |
| `UBFormsListSupplier` | [L358788](../../../../ScriptDB/000_4_CreateSP.sql#L358788) | 1 / 1 file | 0 / 0 | [Forms.cs:114](../../../../UBClasses/Forms.cs#L114) |
| `UBFormTargetID` | [L358900](../../../../ScriptDB/000_4_CreateSP.sql#L358900) | — | 0 / 0 | — |
| `UBFormTypeList` | [L358920](../../../../ScriptDB/000_4_CreateSP.sql#L358920) | — | 2 / 0 | — |
| `UBFormUpdate` | [L358951](../../../../ScriptDB/000_4_CreateSP.sql#L358951) | — | 0 / 0 | — |
| `UBFormViewComboList` | [L359028](../../../../ScriptDB/000_4_CreateSP.sql#L359028) | — | 0 / 2 | — |
| `UBGetESignatureSourceType` | [L404077](../../../../ScriptDB/000_4_CreateSP.sql#L404077) | 2 / 2 file | 0 / 0 | [ESignature.cs:40](../../../../UBClasses/ESignature.cs#L40) |
| `UBGetPdfObj` | [L404157](../../../../ScriptDB/000_4_CreateSP.sql#L404157) | 1 / 1 file | 0 / 0 | [CPDF.cs:18508](../../../../VieFUNDPdf/CPDF.cs#L18508) |
| `UBKYPCompareListUpdatePdfObj` | [L432789](../../../../ScriptDB/000_4_CreateSP.sql#L432789) | 1 / 1 file | 0 / 0 | [FundDef.cs:3274](../../../../UBClasses/FundDef.cs#L3274) |
| `UBLoanSupportDocList` | [L437060](../../../../ScriptDB/000_4_CreateSP.sql#L437060) | 1 / 1 file | 2 / 0 | [Loan.cs:474](../../../../UBClasses/Loan.cs#L474) |
| `UBLoanSupportDocSave` | [L437135](../../../../ScriptDB/000_4_CreateSP.sql#L437135) | 1 / 1 file | 0 / 0 | [Loan.cs:563](../../../../UBClasses/Loan.cs#L563) |
| `UBMemberDocAdd` | [L440809](../../../../ScriptDB/000_4_CreateSP.sql#L440809) | 1 / 1 file | 0 / 0 | [Member.cs:3283](../../../../UBClasses/Member.cs#L3283) |
| `UBMemberDocDelete` | [L440867](../../../../ScriptDB/000_4_CreateSP.sql#L440867) | 1 / 1 file | 0 / 0 | [Member.cs:3332](../../../../UBClasses/Member.cs#L3332) |
| `UBMemberDocSet` | [L440892](../../../../ScriptDB/000_4_CreateSP.sql#L440892) | 1 / 1 file | 2 / 0 | [Member.cs:2968](../../../../UBClasses/Member.cs#L2968) |
| `UBMembereDocAccessCode` | [L440956](../../../../ScriptDB/000_4_CreateSP.sql#L440956) | 1 / 1 file | 0 / 0 | [Member.cs:4749](../../../../UBClasses/Member.cs#L4749) |
| `UBMembereDocAccessCodeUpdate` | [L440969](../../../../ScriptDB/000_4_CreateSP.sql#L440969) | 1 / 1 file | 0 / 0 | [Member.cs:4797](../../../../UBClasses/Member.cs#L4797) |
| `UBRecipientESignatureIDUpdate` | [L507089](../../../../ScriptDB/000_4_CreateSP.sql#L507089) | 2 / 2 file | 0 / 0 | [ESignature.cs:478](../../../../UBClasses/ESignature.cs#L478) |
| `UBReportAdminPdfObjList` | [L510061](../../../../ScriptDB/000_4_CreateSP.sql#L510061) | 1 / 1 file | 0 / 0 | [CReport.cs:6740](../../../../VieFUNDPdf/CReport.cs#L6740) |
| `UBReportGetPdfObj` | [L561961](../../../../ScriptDB/000_4_CreateSP.sql#L561961) | 1 / 1 file | 0 / 0 | [CReport.cs:6628](../../../../VieFUNDPdf/CReport.cs#L6628) |
| `UBReportPdfObjApprove` | [L562496](../../../../ScriptDB/000_4_CreateSP.sql#L562496) | 1 / 1 file | 0 / 1 | [CReportSchedule.cs:713](../../../../UBClasses/CReportSchedule.cs#L713) |
| `UBReportPdfObjApproveAll` | [L562563](../../../../ScriptDB/000_4_CreateSP.sql#L562563) | 1 / 1 file | 0 / 1 | [CReportSchedule.cs:762](../../../../UBClasses/CReportSchedule.cs#L762) |
| `UBReportPdfObjInfo` | [L562663](../../../../ScriptDB/000_4_CreateSP.sql#L562663) | — | 0 / 0 | — |
| `UBReportPdfObjList` | [L562700](../../../../ScriptDB/000_4_CreateSP.sql#L562700) | 1 / 1 file | 0 / 0 | [CReportSchedule.cs:539](../../../../UBClasses/CReportSchedule.cs#L539) |
| `UBReportPdfObjReleaseTagged` | [L563817](../../../../ScriptDB/000_4_CreateSP.sql#L563817) | 1 / 1 file | 0 / 1 | [CReportSchedule.cs:665](../../../../UBClasses/CReportSchedule.cs#L665) |
| `UBReportPdfObjRemove` | [L563934](../../../../ScriptDB/000_4_CreateSP.sql#L563934) | — | 0 / 0 | — |
| `UBReportPdfObjRemoveFromSelection` | [L563976](../../../../ScriptDB/000_4_CreateSP.sql#L563976) | — | 0 / 1 | — |
| `UBReportPdfObjSelectionUpdate` | [L564034](../../../../ScriptDB/000_4_CreateSP.sql#L564034) | — | 0 / 0 | — |
| `UBReportPdfObjTMPAdd` | [L564080](../../../../ScriptDB/000_4_CreateSP.sql#L564080) | 1 / 1 file | 0 / 0 | [CReport.cs:6891](../../../../VieFUNDPdf/CReport.cs#L6891) |
| `UBReportPdfObjTMPAddWithAttachment` | [L564121](../../../../ScriptDB/000_4_CreateSP.sql#L564121) | — | 0 / 1 | — |
| `UBReportPdfObjTMPGet` | [L564196](../../../../ScriptDB/000_4_CreateSP.sql#L564196) | 1 / 1 file | 0 / 0 | [CReport.cs:6696](../../../../VieFUNDPdf/CReport.cs#L6696) |
| `UBReportSavePdfObj` | [L565816](../../../../ScriptDB/000_4_CreateSP.sql#L565816) | 1 / 1 file | 0 / 0 | [CReport.cs:5170](../../../../VieFUNDPdf/CReport.cs#L5170) |
| `UBSavePdfObj` | [L598109](../../../../ScriptDB/000_4_CreateSP.sql#L598109) | — | 17 / 0 | — |
| `UBTransferReminderOneDocList` | [L640555](../../../../ScriptDB/000_4_CreateSP.sql#L640555) | 1 / 1 file | 0 / 0 | [TransferReminder.cs:532](../../../../UBClasses/TransferReminder.cs#L532) |
| `UBTransferReminderRemoveDoc` | [L641031](../../../../ScriptDB/000_4_CreateSP.sql#L641031) | — | 0 / 0 | — |
| `UBTransferReminderVerifyDocType` | [L642196](../../../../ScriptDB/000_4_CreateSP.sql#L642196) | — | 0 / 0 | — |
| `VF_VF_AllDoc` | [L708345](../../../../ScriptDB/000_4_CreateSP.sql#L708345) | — | 0 / 1 | — |
| `VF_VF_OneDoc` | [L711129](../../../../ScriptDB/000_4_CreateSP.sql#L711129) | — | 1 / 0 | — |
