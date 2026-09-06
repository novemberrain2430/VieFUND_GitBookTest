# SP Catalog — Tax & Year-End

> Phân nhóm gợi ý theo tên procedure. Các cột caller mới là bằng chứng truy vết; `—` không có nghĩa procedure không được dùng.

**Tổng**: 349 definition; 43 có tên tĩnh từ C#; 51 được procedure khác gọi qua EXEC/EXECUTE.

| Procedure | Definition | C# tĩnh | SQL gọi vào / gọi ra | Caller C# mẫu |
|---|---:|---:|---:|---|
| `CRA_ListTransfer` | [L91337](../../../../ScriptDB/000_4_CreateSP.sql#L91337) | — | 0 / 0 | — |
| `UBCRAFileList` | [L294395](../../../../ScriptDB/000_4_CreateSP.sql#L294395) | — | 18 / 0 | — |
| `UBCRASubmissionUpdate` | [L294462](../../../../ScriptDB/000_4_CreateSP.sql#L294462) | 1 / 1 file | 0 / 0 | [T619.cs:95](../../../../UBClasses/T619.cs#L95) |
| `UBNR44XML` | [L458501](../../../../ScriptDB/000_4_CreateSP.sql#L458501) | — | 1 / 1 | — |
| `UBNR4Approve2Pending` | [L458591](../../../../ScriptDB/000_4_CreateSP.sql#L458591) | — | 0 / 0 | — |
| `UBNR4ApprovedList` | [L458646](../../../../ScriptDB/000_4_CreateSP.sql#L458646) | — | 0 / 1 | — |
| `UBNR4ApprovedSelectionUpdate` | [L459018](../../../../ScriptDB/000_4_CreateSP.sql#L459018) | — | 0 / 0 | — |
| `UBNR4CancelItem` | [L459054](../../../../ScriptDB/000_4_CreateSP.sql#L459054) | — | 0 / 0 | — |
| `UBNR4Estimate4PortfolioList` | [L459135](../../../../ScriptDB/000_4_CreateSP.sql#L459135) | — | 0 / 0 | — |
| `UBNR4FileDetailList` | [L459261](../../../../ScriptDB/000_4_CreateSP.sql#L459261) | — | 0 / 0 | — |
| `UBNR4FileList` | [L459333](../../../../ScriptDB/000_4_CreateSP.sql#L459333) | — | 0 / 1 | — |
| `UBNR4IDList` | [L459347](../../../../ScriptDB/000_4_CreateSP.sql#L459347) | 1 / 1 file | 0 / 0 | [NR4Pdf.cs:175](../../../../VieFUNDPdf/NR4Pdf.cs#L175) |
| `UBNR4ItemInfo` | [L459378](../../../../ScriptDB/000_4_CreateSP.sql#L459378) | — | 0 / 1 | — |
| `UBNR4PendingList` | [L459590](../../../../ScriptDB/000_4_CreateSP.sql#L459590) | — | 0 / 2 | — |
| `UBNR4PendingSelectionUpdate` | [L460057](../../../../ScriptDB/000_4_CreateSP.sql#L460057) | — | 0 / 0 | — |
| `UBNR4ProcessOneItem` | [L460093](../../../../ScriptDB/000_4_CreateSP.sql#L460093) | — | 1 / 0 | — |
| `UBNR4ProcessPendingTaggedItems` | [L460365](../../../../ScriptDB/000_4_CreateSP.sql#L460365) | — | 0 / 1 | — |
| `UBNR4SavePdfObj` | [L460402](../../../../ScriptDB/000_4_CreateSP.sql#L460402) | 1 / 1 file | 0 / 1 | [NR4Pdf.cs:137](../../../../VieFUNDPdf/NR4Pdf.cs#L137) |
| `UBNR4ScanAll` | [L460434](../../../../ScriptDB/000_4_CreateSP.sql#L460434) | — | 0 / 1 | — |
| `UBNR4ScanOneItem` | [L460465](../../../../ScriptDB/000_4_CreateSP.sql#L460465) | — | 1 / 0 | — |
| `UBNR4SlipRelease` | [L460627](../../../../ScriptDB/000_4_CreateSP.sql#L460627) | — | 0 / 1 | — |
| `UBP184XML` | [L478584](../../../../ScriptDB/000_4_CreateSP.sql#L478584) | — | 1 / 1 | — |
| `UBP18AddControllingPersonList` | [L478730](../../../../ScriptDB/000_4_CreateSP.sql#L478730) | — | 1 / 0 | — |
| `UBP18Approve2Pending` | [L478816](../../../../ScriptDB/000_4_CreateSP.sql#L478816) | — | 0 / 0 | — |
| `UBP18ApprovedList` | [L478869](../../../../ScriptDB/000_4_CreateSP.sql#L478869) | — | 0 / 1 | — |
| `UBP18ApprovedSelectionUpdate` | [L479171](../../../../ScriptDB/000_4_CreateSP.sql#L479171) | — | 0 / 0 | — |
| `UBP18CancelItem` | [L479207](../../../../ScriptDB/000_4_CreateSP.sql#L479207) | — | 0 / 0 | — |
| `UBP18FileDetailList` | [L479285](../../../../ScriptDB/000_4_CreateSP.sql#L479285) | — | 0 / 0 | — |
| `UBP18FileList` | [L479346](../../../../ScriptDB/000_4_CreateSP.sql#L479346) | — | 0 / 1 | — |
| `UBP18PendingList` | [L479360](../../../../ScriptDB/000_4_CreateSP.sql#L479360) | — | 0 / 1 | — |
| `UBP18PendingSelectionUpdate` | [L479687](../../../../ScriptDB/000_4_CreateSP.sql#L479687) | — | 0 / 0 | — |
| `UBP18ProcessOneItem` | [L479723](../../../../ScriptDB/000_4_CreateSP.sql#L479723) | — | 1 / 1 | — |
| `UBP18ProcessPendingTaggedItems` | [L480005](../../../../ScriptDB/000_4_CreateSP.sql#L480005) | — | 0 / 1 | — |
| `UBP18RestoreSubmitted` | [L480044](../../../../ScriptDB/000_4_CreateSP.sql#L480044) | — | 0 / 0 | — |
| `UBP194XML` | [L480079](../../../../ScriptDB/000_4_CreateSP.sql#L480079) | — | 1 / 1 | — |
| `UBP19AddControllingPersonList` | [L480236](../../../../ScriptDB/000_4_CreateSP.sql#L480236) | — | 1 / 0 | — |
| `UBP19Approve2Pending` | [L480332](../../../../ScriptDB/000_4_CreateSP.sql#L480332) | — | 0 / 0 | — |
| `UBP19ApprovedList` | [L480385](../../../../ScriptDB/000_4_CreateSP.sql#L480385) | — | 0 / 1 | — |
| `UBP19ApprovedSelectionUpdate` | [L480691](../../../../ScriptDB/000_4_CreateSP.sql#L480691) | — | 0 / 0 | — |
| `UBP19CancelItem` | [L480727](../../../../ScriptDB/000_4_CreateSP.sql#L480727) | — | 0 / 0 | — |
| `UBP19FileDetailList` | [L480805](../../../../ScriptDB/000_4_CreateSP.sql#L480805) | — | 0 / 0 | — |
| `UBP19FileList` | [L480867](../../../../ScriptDB/000_4_CreateSP.sql#L480867) | — | 0 / 1 | — |
| `UBP19PendingList` | [L480881](../../../../ScriptDB/000_4_CreateSP.sql#L480881) | — | 0 / 1 | — |
| `UBP19PendingSelectionUpdate` | [L481212](../../../../ScriptDB/000_4_CreateSP.sql#L481212) | — | 0 / 0 | — |
| `UBP19ProcessOneItem` | [L481248](../../../../ScriptDB/000_4_CreateSP.sql#L481248) | — | 1 / 1 | — |
| `UBP19ProcessPendingTaggedItems` | [L481548](../../../../ScriptDB/000_4_CreateSP.sql#L481548) | — | 0 / 1 | — |
| `UBP19RestoreSubmitted` | [L481586](../../../../ScriptDB/000_4_CreateSP.sql#L481586) | — | 0 / 0 | — |
| `UBRL164XML` | [L574665](../../../../ScriptDB/000_4_CreateSP.sql#L574665) | — | 1 / 1 | — |
| `UBRL16Approve2Pending` | [L574766](../../../../ScriptDB/000_4_CreateSP.sql#L574766) | — | 0 / 0 | — |
| `UBRL16ApprovedList` | [L574821](../../../../ScriptDB/000_4_CreateSP.sql#L574821) | — | 0 / 1 | — |
| `UBRL16ApprovedSelectionUpdate` | [L575193](../../../../ScriptDB/000_4_CreateSP.sql#L575193) | — | 0 / 0 | — |
| `UBRL16CancelItem` | [L575229](../../../../ScriptDB/000_4_CreateSP.sql#L575229) | — | 0 / 0 | — |
| `UBRL16FileDetailList` | [L575290](../../../../ScriptDB/000_4_CreateSP.sql#L575290) | — | 0 / 0 | — |
| `UBRL16FileList` | [L575356](../../../../ScriptDB/000_4_CreateSP.sql#L575356) | — | 0 / 1 | — |
| `UBRL16IDList` | [L575370](../../../../ScriptDB/000_4_CreateSP.sql#L575370) | 1 / 1 file | 0 / 0 | [RL16Pdf.cs:243](../../../../VieFUNDPdf/RL16Pdf.cs#L243) |
| `UBRL16ItemInfo` | [L575400](../../../../ScriptDB/000_4_CreateSP.sql#L575400) | — | 0 / 0 | — |
| `UBRL16ItemInfoUpdate` | [L575663](../../../../ScriptDB/000_4_CreateSP.sql#L575663) | — | 0 / 0 | — |
| `UBRL16PendingList` | [L575699](../../../../ScriptDB/000_4_CreateSP.sql#L575699) | — | 0 / 1 | — |
| `UBRL16PendingSelectionUpdate` | [L575911](../../../../ScriptDB/000_4_CreateSP.sql#L575911) | — | 0 / 0 | — |
| `UBRL16PlanID` | [L575947](../../../../ScriptDB/000_4_CreateSP.sql#L575947) | 1 / 1 file | 0 / 0 | [RL16.cs:191](../../../../UBClasses/RL16.cs#L191) |
| `UBRL16ProcessOneItem` | [L575977](../../../../ScriptDB/000_4_CreateSP.sql#L575977) | — | 1 / 1 | — |
| `UBRL16ProcessPendingTaggedItems` | [L576208](../../../../ScriptDB/000_4_CreateSP.sql#L576208) | — | 0 / 1 | — |
| `UBRL16SavePdfObj` | [L576262](../../../../ScriptDB/000_4_CreateSP.sql#L576262) | 1 / 1 file | 0 / 1 | [RL16Pdf.cs:205](../../../../VieFUNDPdf/RL16Pdf.cs#L205) |
| `UBRL16SlipRelease` | [L576295](../../../../ScriptDB/000_4_CreateSP.sql#L576295) | — | 0 / 1 | — |
| `UBRL18Approve2Pending` | [L576414](../../../../ScriptDB/000_4_CreateSP.sql#L576414) | — | 0 / 0 | — |
| `UBRL18ApprovedList` | [L576469](../../../../ScriptDB/000_4_CreateSP.sql#L576469) | — | 0 / 1 | — |
| `UBRL18ApprovedSelectionUpdate` | [L576842](../../../../ScriptDB/000_4_CreateSP.sql#L576842) | — | 0 / 0 | — |
| `UBRL18CancelItem` | [L576879](../../../../ScriptDB/000_4_CreateSP.sql#L576879) | — | 0 / 0 | — |
| `UBRL18FileDetailList` | [L576948](../../../../ScriptDB/000_4_CreateSP.sql#L576948) | — | 0 / 0 | — |
| `UBRL18FileList` | [L577024](../../../../ScriptDB/000_4_CreateSP.sql#L577024) | — | 0 / 1 | — |
| `UBRL18IDList` | [L577039](../../../../ScriptDB/000_4_CreateSP.sql#L577039) | 2 / 1 file | 0 / 0 | [RL18Pdf.cs:176](../../../../VieFUNDPdf/RL18Pdf.cs#L176) |
| `UBRL18ItemInfo` | [L577137](../../../../ScriptDB/000_4_CreateSP.sql#L577137) | — | 0 / 0 | — |
| `UBRL18ItemInfo4Pdf` | [L577362](../../../../ScriptDB/000_4_CreateSP.sql#L577362) | — | 0 / 0 | — |
| `UBRL18PendingList` | [L577747](../../../../ScriptDB/000_4_CreateSP.sql#L577747) | — | 0 / 1 | — |
| `UBRL18PendingSelectionUpdate` | [L578070](../../../../ScriptDB/000_4_CreateSP.sql#L578070) | — | 0 / 0 | — |
| `UBRL18PlanID` | [L578107](../../../../ScriptDB/000_4_CreateSP.sql#L578107) | 1 / 1 file | 0 / 0 | [RL18.cs:190](../../../../UBClasses/RL18.cs#L190) |
| `UBRL18ProcessOneItem` | [L578127](../../../../ScriptDB/000_4_CreateSP.sql#L578127) | — | 1 / 1 | — |
| `UBRL18ProcessPendingTaggedItems` | [L578376](../../../../ScriptDB/000_4_CreateSP.sql#L578376) | — | 0 / 1 | — |
| `UBRL18SavePdfObj` | [L578414](../../../../ScriptDB/000_4_CreateSP.sql#L578414) | 2 / 1 file | 0 / 1 | [RL18Pdf.cs:138](../../../../VieFUNDPdf/RL18Pdf.cs#L138) |
| `UBRL18ScanAll` | [L578449](../../../../ScriptDB/000_4_CreateSP.sql#L578449) | — | 0 / 1 | — |
| `UBRL18ScanOneItem` | [L578480](../../../../ScriptDB/000_4_CreateSP.sql#L578480) | — | 1 / 0 | — |
| `UBRL18SlipRelease` | [L578671](../../../../ScriptDB/000_4_CreateSP.sql#L578671) | — | 0 / 1 | — |
| `UBRL18XML` | [L578789](../../../../ScriptDB/000_4_CreateSP.sql#L578789) | — | 1 / 1 | — |
| `UBRL1Approve2Pending` | [L578865](../../../../ScriptDB/000_4_CreateSP.sql#L578865) | — | 0 / 0 | — |
| `UBRL1ApprovedList` | [L578948](../../../../ScriptDB/000_4_CreateSP.sql#L578948) | — | 0 / 0 | — |
| `UBRL1ApprovedSelectionUpdate` | [L579240](../../../../ScriptDB/000_4_CreateSP.sql#L579240) | — | 0 / 0 | — |
| `UBRL1CancelItem` | [L579276](../../../../ScriptDB/000_4_CreateSP.sql#L579276) | — | 0 / 0 | — |
| `UBRL1FileDetailList` | [L579343](../../../../ScriptDB/000_4_CreateSP.sql#L579343) | — | 0 / 0 | — |
| `UBRL1FileList` | [L579403](../../../../ScriptDB/000_4_CreateSP.sql#L579403) | — | 0 / 1 | — |
| `UBRL1IDList` | [L579417](../../../../ScriptDB/000_4_CreateSP.sql#L579417) | 1 / 1 file | 0 / 0 | [RL1Pdf.cs:251](../../../../VieFUNDPdf/RL1Pdf.cs#L251) |
| `UBRL1ItemInfo` | [L579448](../../../../ScriptDB/000_4_CreateSP.sql#L579448) | — | 0 / 0 | — |
| `UBRL1ItemInfoUpdate` | [L579786](../../../../ScriptDB/000_4_CreateSP.sql#L579786) | — | 0 / 0 | — |
| `UBRL1MemberInfo` | [L579835](../../../../ScriptDB/000_4_CreateSP.sql#L579835) | — | 0 / 0 | — |
| `UBRL1PendingList` | [L579862](../../../../ScriptDB/000_4_CreateSP.sql#L579862) | — | 0 / 0 | — |
| `UBRL1PendingSelectionUpdate` | [L580086](../../../../ScriptDB/000_4_CreateSP.sql#L580086) | — | 0 / 0 | — |
| `UBRL1ProcessOneItem` | [L580122](../../../../ScriptDB/000_4_CreateSP.sql#L580122) | — | 1 / 1 | — |
| `UBRL1ProcessPendingTaggedItems` | [L580360](../../../../ScriptDB/000_4_CreateSP.sql#L580360) | — | 0 / 1 | — |
| `UBRL1SavePdfObj` | [L580395](../../../../ScriptDB/000_4_CreateSP.sql#L580395) | 1 / 1 file | 0 / 1 | [RL1Pdf.cs:213](../../../../VieFUNDPdf/RL1Pdf.cs#L213) |
| `UBRL1ScanOneItem` | [L580426](../../../../ScriptDB/000_4_CreateSP.sql#L580426) | — | 0 / 0 | — |
| `UBRL1SummaryInfo` | [L580543](../../../../ScriptDB/000_4_CreateSP.sql#L580543) | — | 0 / 0 | — |
| `UBRL1XML` | [L580596](../../../../ScriptDB/000_4_CreateSP.sql#L580596) | — | 1 / 1 | — |
| `UBRL2Approve2Pending` | [L580674](../../../../ScriptDB/000_4_CreateSP.sql#L580674) | — | 0 / 0 | — |
| `UBRL2ApprovedList` | [L580740](../../../../ScriptDB/000_4_CreateSP.sql#L580740) | — | 0 / 1 | — |
| `UBRL2ApprovedSelectionUpdate` | [L581091](../../../../ScriptDB/000_4_CreateSP.sql#L581091) | — | 0 / 0 | — |
| `UBRL2CancelItem` | [L581127](../../../../ScriptDB/000_4_CreateSP.sql#L581127) | — | 0 / 0 | — |
| `UBRL2FileDetailList` | [L581192](../../../../ScriptDB/000_4_CreateSP.sql#L581192) | — | 0 / 0 | — |
| `UBRL2FileList` | [L581257](../../../../ScriptDB/000_4_CreateSP.sql#L581257) | — | 0 / 1 | — |
| `UBRL2IDList` | [L581271](../../../../ScriptDB/000_4_CreateSP.sql#L581271) | 1 / 1 file | 0 / 0 | [RL2Pdf.cs:244](../../../../VieFUNDPdf/RL2Pdf.cs#L244) |
| `UBRL2ItemInfo` | [L581302](../../../../ScriptDB/000_4_CreateSP.sql#L581302) | — | 0 / 0 | — |
| `UBRL2ItemInfoUpdate` | [L581598](../../../../ScriptDB/000_4_CreateSP.sql#L581598) | — | 0 / 0 | — |
| `UBRL2PendingList` | [L581638](../../../../ScriptDB/000_4_CreateSP.sql#L581638) | — | 0 / 2 | — |
| `UBRL2PendingSelectionUpdate` | [L582136](../../../../ScriptDB/000_4_CreateSP.sql#L582136) | — | 0 / 0 | — |
| `UBRL2PlanID` | [L582172](../../../../ScriptDB/000_4_CreateSP.sql#L582172) | 1 / 1 file | 0 / 0 | [RL2.cs:125](../../../../UBClasses/RL2.cs#L125) |
| `UBRL2ProcessOneItem` | [L582191](../../../../ScriptDB/000_4_CreateSP.sql#L582191) | — | 1 / 1 | — |
| `UBRL2ProcessPendingTaggedItems` | [L582468](../../../../ScriptDB/000_4_CreateSP.sql#L582468) | — | 0 / 1 | — |
| `UBRL2SavePdfObj` | [L582505](../../../../ScriptDB/000_4_CreateSP.sql#L582505) | 1 / 1 file | 0 / 1 | [RL2Pdf.cs:206](../../../../VieFUNDPdf/RL2Pdf.cs#L206) |
| `UBRL2SlipRelease` | [L582537](../../../../ScriptDB/000_4_CreateSP.sql#L582537) | — | 0 / 1 | — |
| `UBRL2XML` | [L582654](../../../../ScriptDB/000_4_CreateSP.sql#L582654) | — | 1 / 1 | — |
| `UBRL34XML` | [L582730](../../../../ScriptDB/000_4_CreateSP.sql#L582730) | — | 1 / 1 | — |
| `UBRL3Approve2Pending` | [L582809](../../../../ScriptDB/000_4_CreateSP.sql#L582809) | — | 0 / 0 | — |
| `UBRL3ApprovedList` | [L582864](../../../../ScriptDB/000_4_CreateSP.sql#L582864) | — | 0 / 1 | — |
| `UBRL3ApprovedSelectionUpdate` | [L583243](../../../../ScriptDB/000_4_CreateSP.sql#L583243) | — | 0 / 0 | — |
| `UBRL3CancelItem` | [L583279](../../../../ScriptDB/000_4_CreateSP.sql#L583279) | — | 0 / 0 | — |
| `UBRL3FileDetailList` | [L583342](../../../../ScriptDB/000_4_CreateSP.sql#L583342) | — | 0 / 0 | — |
| `UBRL3FileList` | [L583408](../../../../ScriptDB/000_4_CreateSP.sql#L583408) | — | 0 / 1 | — |
| `UBRL3IDList` | [L583422](../../../../ScriptDB/000_4_CreateSP.sql#L583422) | 1 / 1 file | 0 / 0 | [RL3Pdf.cs:243](../../../../VieFUNDPdf/RL3Pdf.cs#L243) |
| `UBRL3ItemInfo` | [L583452](../../../../ScriptDB/000_4_CreateSP.sql#L583452) | — | 0 / 0 | — |
| `UBRL3ItemInfoUpdate` | [L583735](../../../../ScriptDB/000_4_CreateSP.sql#L583735) | — | 0 / 0 | — |
| `UBRL3PendingList` | [L583772](../../../../ScriptDB/000_4_CreateSP.sql#L583772) | — | 0 / 1 | — |
| `UBRL3PendingSelectionUpdate` | [L584002](../../../../ScriptDB/000_4_CreateSP.sql#L584002) | — | 0 / 0 | — |
| `UBRL3PlanID` | [L584038](../../../../ScriptDB/000_4_CreateSP.sql#L584038) | 1 / 1 file | 0 / 0 | [RL3.cs:191](../../../../UBClasses/RL3.cs#L191) |
| `UBRL3ProcessOneItem` | [L584068](../../../../ScriptDB/000_4_CreateSP.sql#L584068) | — | 1 / 1 | — |
| `UBRL3ProcessPendingTaggedItems` | [L584323](../../../../ScriptDB/000_4_CreateSP.sql#L584323) | — | 0 / 1 | — |
| `UBRL3SavePdfObj` | [L584360](../../../../ScriptDB/000_4_CreateSP.sql#L584360) | 1 / 1 file | 0 / 1 | [RL3Pdf.cs:205](../../../../VieFUNDPdf/RL3Pdf.cs#L205) |
| `UBRL3SlipRelease` | [L584393](../../../../ScriptDB/000_4_CreateSP.sql#L584393) | — | 0 / 1 | — |
| `UBT34XML` | [L608601](../../../../ScriptDB/000_4_CreateSP.sql#L608601) | — | 1 / 1 | — |
| `UBT3Approve2Pending` | [L608893](../../../../ScriptDB/000_4_CreateSP.sql#L608893) | — | 0 / 0 | — |
| `UBT3ApprovedList` | [L608948](../../../../ScriptDB/000_4_CreateSP.sql#L608948) | — | 0 / 1 | — |
| `UBT3ApprovedSelectionUpdate` | [L609381](../../../../ScriptDB/000_4_CreateSP.sql#L609381) | — | 0 / 0 | — |
| `UBT3CancelItem` | [L609417](../../../../ScriptDB/000_4_CreateSP.sql#L609417) | — | 0 / 0 | — |
| `UBT3FileDetailList` | [L609480](../../../../ScriptDB/000_4_CreateSP.sql#L609480) | — | 0 / 0 | — |
| `UBT3FileList` | [L609546](../../../../ScriptDB/000_4_CreateSP.sql#L609546) | — | 0 / 1 | — |
| `UBT3FixCancelRecord` | [L609560](../../../../ScriptDB/000_4_CreateSP.sql#L609560) | — | 0 / 0 | — |
| `UBT3GR_PlanCount` | [L609597](../../../../ScriptDB/000_4_CreateSP.sql#L609597) | — | 0 / 1 | — |
| `UBT3IDList` | [L609742](../../../../ScriptDB/000_4_CreateSP.sql#L609742) | 1 / 1 file | 0 / 0 | [T3Pdf.cs:243](../../../../VieFUNDPdf/T3Pdf.cs#L243) |
| `UBT3ItemInfo` | [L609772](../../../../ScriptDB/000_4_CreateSP.sql#L609772) | — | 0 / 1 | — |
| `UBT3ItemInfoUpdate` | [L610199](../../../../ScriptDB/000_4_CreateSP.sql#L610199) | — | 0 / 0 | — |
| `UBT3OmnibusItemInfo` | [L610256](../../../../ScriptDB/000_4_CreateSP.sql#L610256) | — | 0 / 0 | — |
| `UBT3OmnibusItemUpdateBoxes` | [L610280](../../../../ScriptDB/000_4_CreateSP.sql#L610280) | — | 0 / 0 | — |
| `UBT3OmnibusItemUpdateDividend` | [L610347](../../../../ScriptDB/000_4_CreateSP.sql#L610347) | — | 0 / 0 | — |
| `UBT3OmnibusList` | [L610499](../../../../ScriptDB/000_4_CreateSP.sql#L610499) | — | 0 / 0 | — |
| `UBT3OmnibusProcessItem` | [L610746](../../../../ScriptDB/000_4_CreateSP.sql#L610746) | — | 0 / 0 | — |
| `UBT3OmnibusUndoItem` | [L610972](../../../../ScriptDB/000_4_CreateSP.sql#L610972) | — | 0 / 0 | — |
| `UBT3PendingList` | [L611068](../../../../ScriptDB/000_4_CreateSP.sql#L611068) | — | 0 / 1 | — |
| `UBT3PendingSelectionUpdate` | [L611322](../../../../ScriptDB/000_4_CreateSP.sql#L611322) | — | 0 / 0 | — |
| `UBT3PlanFundCheckDOD` | [L611358](../../../../ScriptDB/000_4_CreateSP.sql#L611358) | — | 1 / 0 | — |
| `UBT3PlanID` | [L611419](../../../../ScriptDB/000_4_CreateSP.sql#L611419) | 1 / 1 file | 0 / 0 | [T3.cs:529](../../../../UBClasses/T3.cs#L529) |
| `UBT3ProcessOneItem` | [L611449](../../../../ScriptDB/000_4_CreateSP.sql#L611449) | — | 1 / 1 | — |
| `UBT3ProcessPendingTaggedItems` | [L611955](../../../../ScriptDB/000_4_CreateSP.sql#L611955) | — | 0 / 1 | — |
| `UBT3SavePdfObj` | [L611992](../../../../ScriptDB/000_4_CreateSP.sql#L611992) | 1 / 1 file | 0 / 1 | [T3Pdf.cs:205](../../../../VieFUNDPdf/T3Pdf.cs#L205) |
| `UBT3SlipRelease` | [L612025](../../../../ScriptDB/000_4_CreateSP.sql#L612025) | — | 0 / 1 | — |
| `UBT4A4XML` | [L612143](../../../../ScriptDB/000_4_CreateSP.sql#L612143) | — | 1 / 1 | — |
| `UBT4AApprove2Pending` | [L612328](../../../../ScriptDB/000_4_CreateSP.sql#L612328) | — | 0 / 0 | — |
| `UBT4AApprovedList` | [L612411](../../../../ScriptDB/000_4_CreateSP.sql#L612411) | — | 0 / 0 | — |
| `UBT4AApprovedSelectionUpdate` | [L613004](../../../../ScriptDB/000_4_CreateSP.sql#L613004) | — | 0 / 0 | — |
| `UBT4ACancelItem` | [L613040](../../../../ScriptDB/000_4_CreateSP.sql#L613040) | — | 0 / 0 | — |
| `UBT4AFileDetailList` | [L613107](../../../../ScriptDB/000_4_CreateSP.sql#L613107) | — | 0 / 0 | — |
| `UBT4AFileList` | [L613175](../../../../ScriptDB/000_4_CreateSP.sql#L613175) | — | 0 / 1 | — |
| `UBT4AFixCancelRecord` | [L613189](../../../../ScriptDB/000_4_CreateSP.sql#L613189) | — | 0 / 0 | — |
| `UBT4AIDList` | [L613227](../../../../ScriptDB/000_4_CreateSP.sql#L613227) | 1 / 1 file | 0 / 0 | [T4APdf.cs:245](../../../../VieFUNDPdf/T4APdf.cs#L245) |
| `UBT4AItemInfo` | [L613258](../../../../ScriptDB/000_4_CreateSP.sql#L613258) | — | 0 / 0 | — |
| `UBT4AItemInfoUpdate` | [L613498](../../../../ScriptDB/000_4_CreateSP.sql#L613498) | — | 0 / 0 | — |
| `UBT4AItemSetProcessed` | [L613540](../../../../ScriptDB/000_4_CreateSP.sql#L613540) | — | 0 / 0 | — |
| `UBT4AList` | [L613598](../../../../ScriptDB/000_4_CreateSP.sql#L613598) | — | 0 / 0 | — |
| `UBT4AMemberInfo` | [L613901](../../../../ScriptDB/000_4_CreateSP.sql#L613901) | — | 0 / 0 | — |
| `UBT4APendingList` | [L613929](../../../../ScriptDB/000_4_CreateSP.sql#L613929) | — | 0 / 0 | — |
| `UBT4APendingSelectionUpdate` | [L614493](../../../../ScriptDB/000_4_CreateSP.sql#L614493) | — | 0 / 0 | — |
| `UBT4AProcessOneItem` | [L614529](../../../../ScriptDB/000_4_CreateSP.sql#L614529) | — | 1 / 0 | — |
| `UBT4AProcessPendingTaggedItems` | [L614984](../../../../ScriptDB/000_4_CreateSP.sql#L614984) | — | 0 / 1 | — |
| `UBT4ARestoreSubmitted` | [L615021](../../../../ScriptDB/000_4_CreateSP.sql#L615021) | — | 0 / 0 | — |
| `UBT4ASavePdfObj` | [L615073](../../../../ScriptDB/000_4_CreateSP.sql#L615073) | 1 / 1 file | 0 / 1 | [T4APdf.cs:206](../../../../VieFUNDPdf/T4APdf.cs#L206) |
| `UBT4ASavePdfObj_Old` | [L615104](../../../../ScriptDB/000_4_CreateSP.sql#L615104) | — | 0 / 1 | — |
| `UBT4ASelectionUpdate` | [L615143](../../../../ScriptDB/000_4_CreateSP.sql#L615143) | — | 0 / 0 | — |
| `UBT4ASlipRelease` | [L615184](../../../../ScriptDB/000_4_CreateSP.sql#L615184) | — | 0 / 1 | — |
| `UBT4ASummaryInfo` | [L615334](../../../../ScriptDB/000_4_CreateSP.sql#L615334) | — | 0 / 0 | — |
| `UBT4FHSA4XML` | [L615423](../../../../ScriptDB/000_4_CreateSP.sql#L615423) | — | 1 / 1 | — |
| `UBT4FHSAApprove2Pending` | [L615721](../../../../ScriptDB/000_4_CreateSP.sql#L615721) | — | 0 / 0 | — |
| `UBT4FHSAApprovedList` | [L615776](../../../../ScriptDB/000_4_CreateSP.sql#L615776) | — | 0 / 1 | — |
| `UBT4FHSAApprovedSelectionUpdate` | [L616155](../../../../ScriptDB/000_4_CreateSP.sql#L616155) | — | 0 / 0 | — |
| `UBT4FHSACancelItem` | [L616191](../../../../ScriptDB/000_4_CreateSP.sql#L616191) | — | 0 / 0 | — |
| `UBT4FHSAFileDetailList` | [L616266](../../../../ScriptDB/000_4_CreateSP.sql#L616266) | — | 0 / 0 | — |
| `UBT4FHSAFileList` | [L616332](../../../../ScriptDB/000_4_CreateSP.sql#L616332) | — | 0 / 1 | — |
| `UBT4FHSAIDList` | [L616346](../../../../ScriptDB/000_4_CreateSP.sql#L616346) | 1 / 1 file | 0 / 0 | [T4FHSAPdf.cs:243](../../../../VieFUNDPdf/T4FHSAPdf.cs#L243) |
| `UBT4FHSAItemARC2Current` | [L616377](../../../../ScriptDB/000_4_CreateSP.sql#L616377) | — | 0 / 0 | — |
| `UBT4FHSAItemInfo` | [L616461](../../../../ScriptDB/000_4_CreateSP.sql#L616461) | — | 0 / 1 | — |
| `UBT4FHSAPendingList` | [L616697](../../../../ScriptDB/000_4_CreateSP.sql#L616697) | — | 0 / 2 | — |
| `UBT4FHSAPendingPlanID` | [L616916](../../../../ScriptDB/000_4_CreateSP.sql#L616916) | — | 0 / 0 | — |
| `UBT4FHSAPendingSelectionUpdate` | [L616930](../../../../ScriptDB/000_4_CreateSP.sql#L616930) | — | 0 / 0 | — |
| `UBT4FHSAProcessOneItem` | [L616966](../../../../ScriptDB/000_4_CreateSP.sql#L616966) | — | 1 / 0 | — |
| `UBT4FHSAProcessPendingTaggedItems` | [L617405](../../../../ScriptDB/000_4_CreateSP.sql#L617405) | — | 0 / 1 | — |
| `UBT4FHSASavePdfObj` | [L617443](../../../../ScriptDB/000_4_CreateSP.sql#L617443) | 1 / 1 file | 0 / 1 | [T4FHSAPdf.cs:205](../../../../VieFUNDPdf/T4FHSAPdf.cs#L205) |
| `UBT4FHSASlipRelease` | [L617473](../../../../ScriptDB/000_4_CreateSP.sql#L617473) | — | 0 / 1 | — |
| `UBT4RIF4XML` | [L617591](../../../../ScriptDB/000_4_CreateSP.sql#L617591) | — | 1 / 1 | — |
| `UBT4RIFApprove2Pending` | [L617787](../../../../ScriptDB/000_4_CreateSP.sql#L617787) | — | 0 / 0 | — |
| `UBT4RIFApprovedList` | [L617842](../../../../ScriptDB/000_4_CreateSP.sql#L617842) | — | 0 / 1 | — |
| `UBT4RIFApprovedSelectionUpdate` | [L618267](../../../../ScriptDB/000_4_CreateSP.sql#L618267) | — | 0 / 0 | — |
| `UBT4RIFCancelItem` | [L618303](../../../../ScriptDB/000_4_CreateSP.sql#L618303) | — | 0 / 0 | — |
| `UBT4RIFFileDetailList` | [L618372](../../../../ScriptDB/000_4_CreateSP.sql#L618372) | — | 0 / 0 | — |
| `UBT4RIFFileList` | [L618434](../../../../ScriptDB/000_4_CreateSP.sql#L618434) | — | 0 / 1 | — |
| `UBT4RIFFixCancelRecord` | [L618448](../../../../ScriptDB/000_4_CreateSP.sql#L618448) | — | 0 / 0 | — |
| `UBT4RIFIDList` | [L618486](../../../../ScriptDB/000_4_CreateSP.sql#L618486) | 1 / 1 file | 0 / 0 | [T4RIFPdf.cs:245](../../../../VieFUNDPdf/T4RIFPdf.cs#L245) |
| `UBT4RIFItemARC2Current` | [L618529](../../../../ScriptDB/000_4_CreateSP.sql#L618529) | — | 0 / 0 | — |
| `UBT4RIFItemInfo` | [L618568](../../../../ScriptDB/000_4_CreateSP.sql#L618568) | — | 0 / 1 | — |
| `UBT4RIFItemInfoUpdate` | [L618780](../../../../ScriptDB/000_4_CreateSP.sql#L618780) | — | 0 / 0 | — |
| `UBT4RIFPendingList` | [L618839](../../../../ScriptDB/000_4_CreateSP.sql#L618839) | — | 0 / 1 | — |
| `UBT4RIFPendingPlanID` | [L619793](../../../../ScriptDB/000_4_CreateSP.sql#L619793) | — | 0 / 0 | — |
| `UBT4RIFPendingSelectionUpdate` | [L619807](../../../../ScriptDB/000_4_CreateSP.sql#L619807) | — | 0 / 0 | — |
| `UBT4RIFPlanID` | [L619843](../../../../ScriptDB/000_4_CreateSP.sql#L619843) | 1 / 1 file | 0 / 0 | [T4RIF.cs:114](../../../../UBClasses/T4RIF.cs#L114) |
| `UBT4RIFProcessOneItem` | [L619868](../../../../ScriptDB/000_4_CreateSP.sql#L619868) | — | 1 / 1 | — |
| `UBT4RIFProcessPendingTaggedItems` | [L620418](../../../../ScriptDB/000_4_CreateSP.sql#L620418) | — | 0 / 1 | — |
| `UBT4RIFRestoreSubmitted` | [L620457](../../../../ScriptDB/000_4_CreateSP.sql#L620457) | — | 0 / 0 | — |
| `UBT4RIFSavePdfObj` | [L620508](../../../../ScriptDB/000_4_CreateSP.sql#L620508) | 1 / 1 file | 0 / 1 | [T4RIFPdf.cs:207](../../../../VieFUNDPdf/T4RIFPdf.cs#L207) |
| `UBT4RIFScanAll` | [L620541](../../../../ScriptDB/000_4_CreateSP.sql#L620541) | — | 0 / 1 | — |
| `UBT4RIFScanOneItem` | [L620573](../../../../ScriptDB/000_4_CreateSP.sql#L620573) | — | 1 / 0 | — |
| `UBT4RIFSelectionUpdate` | [L620813](../../../../ScriptDB/000_4_CreateSP.sql#L620813) | — | 0 / 0 | — |
| `UBT4RIFSlipRelease` | [L620854](../../../../ScriptDB/000_4_CreateSP.sql#L620854) | — | 0 / 1 | — |
| `UBT4RSP4XML` | [L620972](../../../../ScriptDB/000_4_CreateSP.sql#L620972) | — | 1 / 1 | — |
| `UBT4RSPApprove2Pending` | [L621187](../../../../ScriptDB/000_4_CreateSP.sql#L621187) | — | 0 / 0 | — |
| `UBT4RSPApprovedList` | [L621242](../../../../ScriptDB/000_4_CreateSP.sql#L621242) | — | 0 / 1 | — |
| `UBT4RSPApprovedSelectionUpdate` | [L621663](../../../../ScriptDB/000_4_CreateSP.sql#L621663) | — | 0 / 0 | — |
| `UBT4RSPCancelItem` | [L621699](../../../../ScriptDB/000_4_CreateSP.sql#L621699) | — | 0 / 0 | — |
| `UBT4RSPCancelOneFileKeepOrg` | [L621759](../../../../ScriptDB/000_4_CreateSP.sql#L621759) | — | 0 / 1 | — |
| `UBT4RSPCancelOneItemKeepOrg` | [L621785](../../../../ScriptDB/000_4_CreateSP.sql#L621785) | — | 1 / 0 | — |
| `UBT4RSPDetailUpdateInfo` | [L621832](../../../../ScriptDB/000_4_CreateSP.sql#L621832) | — | 0 / 0 | — |
| `UBT4RSPFileDetailList` | [L621889](../../../../ScriptDB/000_4_CreateSP.sql#L621889) | — | 0 / 0 | — |
| `UBT4RSPFileList` | [L621961](../../../../ScriptDB/000_4_CreateSP.sql#L621961) | — | 0 / 1 | — |
| `UBT4RSPFixCancelRecord` | [L621975](../../../../ScriptDB/000_4_CreateSP.sql#L621975) | — | 0 / 0 | — |
| `UBT4RSPIDList` | [L622012](../../../../ScriptDB/000_4_CreateSP.sql#L622012) | 1 / 1 file | 0 / 0 | [T4RSPPdf.cs:245](../../../../VieFUNDPdf/T4RSPPdf.cs#L245) |
| `UBT4RSPItemARC2Current` | [L622044](../../../../ScriptDB/000_4_CreateSP.sql#L622044) | — | 0 / 0 | — |
| `UBT4RSPItemInfo` | [L622083](../../../../ScriptDB/000_4_CreateSP.sql#L622083) | — | 0 / 0 | — |
| `UBT4RSPItemInfoUpdate` | [L622318](../../../../ScriptDB/000_4_CreateSP.sql#L622318) | — | 0 / 0 | — |
| `UBT4RSPPendingList` | [L622376](../../../../ScriptDB/000_4_CreateSP.sql#L622376) | — | 0 / 1 | — |
| `UBT4RSPPendingPlanID` | [L623332](../../../../ScriptDB/000_4_CreateSP.sql#L623332) | — | 0 / 0 | — |
| `UBT4RSPPendingSelectionUpdate` | [L623346](../../../../ScriptDB/000_4_CreateSP.sql#L623346) | — | 0 / 0 | — |
| `UBT4RSPPlanID` | [L623382](../../../../ScriptDB/000_4_CreateSP.sql#L623382) | 1 / 1 file | 0 / 0 | [T4RSP.cs:261](../../../../UBClasses/T4RSP.cs#L261) |
| `UBT4RSPProcessOneItem` | [L623406](../../../../ScriptDB/000_4_CreateSP.sql#L623406) | — | 1 / 1 | — |
| `UBT4RSPProcessPendingTaggedItems` | [L623887](../../../../ScriptDB/000_4_CreateSP.sql#L623887) | — | 0 / 1 | — |
| `UBT4RSPRestoreSubmitted` | [L623926](../../../../ScriptDB/000_4_CreateSP.sql#L623926) | — | 0 / 0 | — |
| `UBT4RSPSavePdfObj` | [L623978](../../../../ScriptDB/000_4_CreateSP.sql#L623978) | 1 / 1 file | 0 / 1 | [T4RSPPdf.cs:207](../../../../VieFUNDPdf/T4RSPPdf.cs#L207) |
| `UBT4RSPScanAll` | [L624010](../../../../ScriptDB/000_4_CreateSP.sql#L624010) | — | 0 / 1 | — |
| `UBT4RSPScanOneItem` | [L624041](../../../../ScriptDB/000_4_CreateSP.sql#L624041) | — | 1 / 0 | — |
| `UBT4RSPSelectionUpdate` | [L624320](../../../../ScriptDB/000_4_CreateSP.sql#L624320) | — | 0 / 0 | — |
| `UBT4RSPSlipRelease` | [L624361](../../../../ScriptDB/000_4_CreateSP.sql#L624361) | — | 0 / 1 | — |
| `UBT50084XML` | [L624487](../../../../ScriptDB/000_4_CreateSP.sql#L624487) | — | 1 / 1 | — |
| `UBT5008Approve2Pending` | [L624621](../../../../ScriptDB/000_4_CreateSP.sql#L624621) | — | 0 / 0 | — |
| `UBT5008ApprovedList` | [L624676](../../../../ScriptDB/000_4_CreateSP.sql#L624676) | — | 0 / 1 | — |
| `UBT5008ApprovedSelectionUpdate` | [L625064](../../../../ScriptDB/000_4_CreateSP.sql#L625064) | — | 0 / 0 | — |
| `UBT5008CancelItem` | [L625100](../../../../ScriptDB/000_4_CreateSP.sql#L625100) | — | 0 / 0 | — |
| `UBT5008FileDetailList` | [L625186](../../../../ScriptDB/000_4_CreateSP.sql#L625186) | — | 0 / 0 | — |
| `UBT5008FileList` | [L625261](../../../../ScriptDB/000_4_CreateSP.sql#L625261) | — | 0 / 1 | — |
| `UBT5008FixCancelRecord` | [L625275](../../../../ScriptDB/000_4_CreateSP.sql#L625275) | — | 0 / 0 | — |
| `UBT5008IDList` | [L625312](../../../../ScriptDB/000_4_CreateSP.sql#L625312) | 2 / 1 file | 0 / 0 | [T5008Pdf.cs:176](../../../../VieFUNDPdf/T5008Pdf.cs#L176) |
| `UBT5008ItemInfo` | [L625410](../../../../ScriptDB/000_4_CreateSP.sql#L625410) | — | 0 / 0 | — |
| `UBT5008ItemInfo4Pdf` | [L625520](../../../../ScriptDB/000_4_CreateSP.sql#L625520) | — | 0 / 0 | — |
| `UBT5008ItemInfoDetail` | [L625795](../../../../ScriptDB/000_4_CreateSP.sql#L625795) | — | 0 / 0 | — |
| `UBT5008ItemInfoDetailPage` | [L625856](../../../../ScriptDB/000_4_CreateSP.sql#L625856) | — | 0 / 0 | — |
| `UBT5008ItemInfoGov` | [L626055](../../../../ScriptDB/000_4_CreateSP.sql#L626055) | — | 0 / 0 | — |
| `UBT5008ItemSetProcessed` | [L626165](../../../../ScriptDB/000_4_CreateSP.sql#L626165) | — | 0 / 0 | — |
| `UBT5008PendingList` | [L626216](../../../../ScriptDB/000_4_CreateSP.sql#L626216) | — | 0 / 1 | — |
| `UBT5008PendingSelectionUpdate` | [L626537](../../../../ScriptDB/000_4_CreateSP.sql#L626537) | — | 0 / 0 | — |
| `UBT5008PlanID` | [L626573](../../../../ScriptDB/000_4_CreateSP.sql#L626573) | 1 / 1 file | 0 / 0 | [T5008.cs:248](../../../../UBClasses/T5008.cs#L248) |
| `UBT5008ProcessOneItem` | [L626598](../../../../ScriptDB/000_4_CreateSP.sql#L626598) | — | 1 / 0 | — |
| `UBT5008ProcessPendingTaggedItems` | [L626850](../../../../ScriptDB/000_4_CreateSP.sql#L626850) | — | 0 / 1 | — |
| `UBT5008SavePdfObj` | [L626887](../../../../ScriptDB/000_4_CreateSP.sql#L626887) | 2 / 1 file | 0 / 1 | [T5008Pdf.cs:138](../../../../VieFUNDPdf/T5008Pdf.cs#L138) |
| `UBT5008ScanAll` | [L626921](../../../../ScriptDB/000_4_CreateSP.sql#L626921) | — | 0 / 1 | — |
| `UBT5008ScanOneItem` | [L626952](../../../../ScriptDB/000_4_CreateSP.sql#L626952) | — | 1 / 0 | — |
| `UBT5008SelectionUpdate` | [L627142](../../../../ScriptDB/000_4_CreateSP.sql#L627142) | — | 0 / 0 | — |
| `UBT5008SlipRelease` | [L627184](../../../../ScriptDB/000_4_CreateSP.sql#L627184) | — | 0 / 1 | — |
| `UBT54XML` | [L627309](../../../../ScriptDB/000_4_CreateSP.sql#L627309) | — | 1 / 1 | — |
| `UBT550Approve2Pending` | [L627576](../../../../ScriptDB/000_4_CreateSP.sql#L627576) | — | 0 / 0 | — |
| `UBT550ApprovedList` | [L627630](../../../../ScriptDB/000_4_CreateSP.sql#L627630) | — | 0 / 1 | — |
| `UBT550ApprovedSelectionUpdate` | [L627935](../../../../ScriptDB/000_4_CreateSP.sql#L627935) | — | 0 / 0 | — |
| `UBT550FileDetailList` | [L627971](../../../../ScriptDB/000_4_CreateSP.sql#L627971) | — | 0 / 0 | — |
| `UBT550FileList` | [L628033](../../../../ScriptDB/000_4_CreateSP.sql#L628033) | — | 0 / 1 | — |
| `UBT550List` | [L628047](../../../../ScriptDB/000_4_CreateSP.sql#L628047) | 1 / 1 file | 0 / 1 | [T550XML.cs:150](../../../../UBExport/T550XML.cs#L150) |
| `UBT550ListSearch` | [L628185](../../../../ScriptDB/000_4_CreateSP.sql#L628185) | — | 0 / 0 | — |
| `UBT550PendingList` | [L628301](../../../../ScriptDB/000_4_CreateSP.sql#L628301) | — | 0 / 1 | — |
| `UBT550PendingSelectionUpdate` | [L628774](../../../../ScriptDB/000_4_CreateSP.sql#L628774) | — | 0 / 0 | — |
| `UBT550ProcessOneItem` | [L628810](../../../../ScriptDB/000_4_CreateSP.sql#L628810) | — | 1 / 0 | — |
| `UBT550ProcessPendingTaggedItems` | [L628920](../../../../ScriptDB/000_4_CreateSP.sql#L628920) | — | 0 / 1 | — |
| `UBT550XML` | [L628957](../../../../ScriptDB/000_4_CreateSP.sql#L628957) | — | 1 / 1 | — |
| `UBT5Approve2Pending` | [L629041](../../../../ScriptDB/000_4_CreateSP.sql#L629041) | — | 0 / 0 | — |
| `UBT5ApprovedList` | [L629096](../../../../ScriptDB/000_4_CreateSP.sql#L629096) | — | 0 / 1 | — |
| `UBT5ApprovedSelectionUpdate` | [L629515](../../../../ScriptDB/000_4_CreateSP.sql#L629515) | — | 0 / 0 | — |
| `UBT5CancelItem` | [L629551](../../../../ScriptDB/000_4_CreateSP.sql#L629551) | — | 0 / 0 | — |
| `UBT5FileDetailList` | [L629621](../../../../ScriptDB/000_4_CreateSP.sql#L629621) | — | 0 / 0 | — |
| `UBT5FileList` | [L629689](../../../../ScriptDB/000_4_CreateSP.sql#L629689) | — | 0 / 1 | — |
| `UBT5FixCancelRecord` | [L629703](../../../../ScriptDB/000_4_CreateSP.sql#L629703) | — | 0 / 0 | — |
| `UBT5IDList` | [L629740](../../../../ScriptDB/000_4_CreateSP.sql#L629740) | 1 / 1 file | 0 / 0 | [T5Pdf.cs:243](../../../../VieFUNDPdf/T5Pdf.cs#L243) |
| `UBT5InterestInit` | [L629760](../../../../ScriptDB/000_4_CreateSP.sql#L629760) | — | 1 / 1 | — |
| `UBT5ItemInfo` | [L629835](../../../../ScriptDB/000_4_CreateSP.sql#L629835) | — | 0 / 1 | — |
| `UBT5ItemInfoUpdate` | [L630260](../../../../ScriptDB/000_4_CreateSP.sql#L630260) | — | 0 / 0 | — |
| `UBT5ListAllPayments` | [L630311](../../../../ScriptDB/000_4_CreateSP.sql#L630311) | — | 0 / 0 | — |
| `UBT5OmnibusItemInfo` | [L630353](../../../../ScriptDB/000_4_CreateSP.sql#L630353) | — | 0 / 0 | — |
| `UBT5OmnibusItemUpdateBoxes` | [L630377](../../../../ScriptDB/000_4_CreateSP.sql#L630377) | — | 0 / 0 | — |
| `UBT5OmnibusItemUpdateDividend` | [L630434](../../../../ScriptDB/000_4_CreateSP.sql#L630434) | — | 0 / 0 | — |
| `UBT5OmnibusList` | [L630579](../../../../ScriptDB/000_4_CreateSP.sql#L630579) | — | 0 / 1 | — |
| `UBT5OmnibusProcessItem` | [L630762](../../../../ScriptDB/000_4_CreateSP.sql#L630762) | — | 0 / 0 | — |
| `UBT5OmnibusUndoItem` | [L630987](../../../../ScriptDB/000_4_CreateSP.sql#L630987) | — | 0 / 0 | — |
| `UBT5PendingList` | [L631065](../../../../ScriptDB/000_4_CreateSP.sql#L631065) | — | 0 / 1 | — |
| `UBT5PendingSelectionUpdate` | [L631336](../../../../ScriptDB/000_4_CreateSP.sql#L631336) | — | 0 / 0 | — |
| `UBT5PlanFundCheckDOD` | [L631372](../../../../ScriptDB/000_4_CreateSP.sql#L631372) | — | 1 / 0 | — |
| `UBT5PlanID` | [L631433](../../../../ScriptDB/000_4_CreateSP.sql#L631433) | 1 / 1 file | 0 / 0 | [T5.cs:505](../../../../UBClasses/T5.cs#L505) |
| `UBT5ProcessOneItem` | [L631463](../../../../ScriptDB/000_4_CreateSP.sql#L631463) | — | 1 / 1 | — |
| `UBT5ProcessPendingTaggedItems` | [L632030](../../../../ScriptDB/000_4_CreateSP.sql#L632030) | — | 0 / 1 | — |
| `UBT5SavePdfObj` | [L632067](../../../../ScriptDB/000_4_CreateSP.sql#L632067) | 1 / 1 file | 0 / 1 | [T5Pdf.cs:205](../../../../VieFUNDPdf/T5Pdf.cs#L205) |
| `UBT5SlipRelease` | [L632100](../../../../ScriptDB/000_4_CreateSP.sql#L632100) | — | 0 / 1 | — |
| `UBTaxActionList` | [L634919](../../../../ScriptDB/000_4_CreateSP.sql#L634919) | — | 1 / 0 | — |
| `UBTaxApprovePending` | [L634952](../../../../ScriptDB/000_4_CreateSP.sql#L634952) | — | 0 / 1 | — |
| `UBTaxASelectionUpdate` | [L635156](../../../../ScriptDB/000_4_CreateSP.sql#L635156) | — | 0 / 0 | — |
| `UBTaxDetail` | [L635197](../../../../ScriptDB/000_4_CreateSP.sql#L635197) | — | 11 / 0 | — |
| `UBTaxPSelectionUpdate` | [L635248](../../../../ScriptDB/000_4_CreateSP.sql#L635248) | — | 0 / 0 | — |
| `UBTaxReceiptApprovedList` | [L635292](../../../../ScriptDB/000_4_CreateSP.sql#L635292) | 1 / 1 file | 0 / 1 | [TaxReceipt.cs:263](../../../../UBClasses/TaxReceipt.cs#L263) |
| `UBTaxReceiptListClientAll` | [L635674](../../../../ScriptDB/000_4_CreateSP.sql#L635674) | 1 / 1 file | 0 / 0 | [TaxReceipt.cs:511](../../../../UBClasses/TaxReceipt.cs#L511) |
| `UBTaxReceiptListMemberT4A` | [L635843](../../../../ScriptDB/000_4_CreateSP.sql#L635843) | 1 / 1 file | 1 / 2 | [TaxReceipt.cs:558](../../../../UBClasses/TaxReceipt.cs#L558) |
| `UBTaxReceiptMove2Pending` | [L635922](../../../../ScriptDB/000_4_CreateSP.sql#L635922) | — | 0 / 0 | — |
| `UBTaxReceiptObjList` | [L635969](../../../../ScriptDB/000_4_CreateSP.sql#L635969) | 1 / 1 file | 0 / 0 | [CRRSPReceipt.cs:597](../../../../VieFUNDPdf/CRRSPReceipt.cs#L597) |
| `UBTaxReceiptPendingList` | [L636132](../../../../ScriptDB/000_4_CreateSP.sql#L636132) | 1 / 1 file | 0 / 1 | [TaxReceipt.cs:48](../../../../UBClasses/TaxReceipt.cs#L48) |
| `UBTaxReceiptRelease` | [L636702](../../../../ScriptDB/000_4_CreateSP.sql#L636702) | — | 0 / 1 | — |
| `UBTaxYearList` | [L636813](../../../../ScriptDB/000_4_CreateSP.sql#L636813) | — | 2 / 0 | — |
| `UBTFSA4XML` | [L636942](../../../../ScriptDB/000_4_CreateSP.sql#L636942) | — | 1 / 1 | — |
| `UBTFSAApprove2Pending` | [L637078](../../../../ScriptDB/000_4_CreateSP.sql#L637078) | — | 0 / 0 | — |
| `UBTFSAApprovedList` | [L637132](../../../../ScriptDB/000_4_CreateSP.sql#L637132) | — | 0 / 1 | — |
| `UBTFSAApprovedSelectionUpdate` | [L637456](../../../../ScriptDB/000_4_CreateSP.sql#L637456) | — | 0 / 0 | — |
| `UBTFSACancelItem` | [L637492](../../../../ScriptDB/000_4_CreateSP.sql#L637492) | — | 0 / 0 | — |
| `UBTFSAFileDetailList` | [L637580](../../../../ScriptDB/000_4_CreateSP.sql#L637580) | — | 0 / 0 | — |
| `UBTFSAFileList` | [L637636](../../../../ScriptDB/000_4_CreateSP.sql#L637636) | — | 0 / 1 | — |
| `UBTFSAFixCancelRecord` | [L637650](../../../../ScriptDB/000_4_CreateSP.sql#L637650) | — | 0 / 0 | — |
| `UBTFSAItemInfo` | [L637687](../../../../ScriptDB/000_4_CreateSP.sql#L637687) | — | 0 / 0 | — |
| `UBTFSAItemStatusUpdate` | [L637744](../../../../ScriptDB/000_4_CreateSP.sql#L637744) | — | 0 / 0 | — |
| `UBTFSAPendingList` | [L637759](../../../../ScriptDB/000_4_CreateSP.sql#L637759) | — | 0 / 2 | — |
| `UBTFSAPendingSelectionUpdate` | [L638024](../../../../ScriptDB/000_4_CreateSP.sql#L638024) | — | 0 / 0 | — |
| `UBTFSAProcess5Items` | [L638060](../../../../ScriptDB/000_4_CreateSP.sql#L638060) | 1 / 1 file | 0 / 1 | [TFSAProcessing.cs:214](../../../../UBClasses/TFSAProcessing.cs#L214) |
| `UBTFSAProcessOneItem` | [L638088](../../../../ScriptDB/000_4_CreateSP.sql#L638088) | — | 2 / 1 | — |
| `UBTFSAProcessPendingTaggedItems` | [L638481](../../../../ScriptDB/000_4_CreateSP.sql#L638481) | — | 0 / 1 | — |
| `UBTFSARestoreOneItem` | [L638518](../../../../ScriptDB/000_4_CreateSP.sql#L638518) | — | 0 / 0 | — |
| `UBTFSAScanAll` | [L638581](../../../../ScriptDB/000_4_CreateSP.sql#L638581) | — | 0 / 1 | — |
| `UBTFSAScanOneItem` | [L638611](../../../../ScriptDB/000_4_CreateSP.sql#L638611) | — | 1 / 1 | — |
| `UBYearEndComboList` | [L706390](../../../../ScriptDB/000_4_CreateSP.sql#L706390) | — | 0 / 5 | — |
