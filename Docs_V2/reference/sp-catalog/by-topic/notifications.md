# SP Catalog — Notifications

> Phân nhóm gợi ý theo tên procedure. Các cột caller mới là bằng chứng truy vết; `—` không có nghĩa procedure không được dùng.

**Tổng**: 47 definition; 11 có tên tĩnh từ C#; 8 được procedure khác gọi qua EXEC/EXECUTE.

| Procedure | Definition | C# tĩnh | SQL gọi vào / gọi ra | Caller C# mẫu |
|---|---:|---:|---:|---|
| `AGRARepTransferInitExtra` | [L18592](../../../../ScriptDB/000_4_CreateSP.sql#L18592) | 1 / 1 file | 0 / 0 | [Member.cs:5494](../../../../UBClasses/Member.cs#L5494) |
| `EmailSample` | [L110726](../../../../ScriptDB/000_4_CreateSP.sql#L110726) | — | 0 / 0 | — |
| `Init_bEmail` | [L116093](../../../../ScriptDB/000_4_CreateSP.sql#L116093) | — | 0 / 0 | — |
| `Init_ChangeDeliveryMethodFromEmailMail2MailOrElectronic` | [L116161](../../../../ScriptDB/000_4_CreateSP.sql#L116161) | — | 0 / 1 | — |
| `Init_MarkDeleteXTransferIn` | [L119963](../../../../ScriptDB/000_4_CreateSP.sql#L119963) | — | 0 / 0 | — |
| `Init_MarkDeleteXTransferInOut` | [L120061](../../../../ScriptDB/000_4_CreateSP.sql#L120061) | — | 0 / 0 | — |
| `Init_SetExternalTransferIn` | [L123041](../../../../ScriptDB/000_4_CreateSP.sql#L123041) | — | 0 / 0 | — |
| `Init_SetExternalTransferInOne` | [L123092](../../../../ScriptDB/000_4_CreateSP.sql#L123092) | — | 0 / 1 | — |
| `Jeff_MarkDeleteXTransfer` | [L124155](../../../../ScriptDB/000_4_CreateSP.sql#L124155) | — | 0 / 0 | — |
| `UBDealerEmailAdd` | [L309532](../../../../ScriptDB/000_4_CreateSP.sql#L309532) | 1 / 1 file | 0 / 0 | [Dealer.cs:712](../../../../UBClasses/Dealer.cs#L712) |
| `UBDealerEmailInit` | [L309575](../../../../ScriptDB/000_4_CreateSP.sql#L309575) | — | 2 / 0 | — |
| `UBDealerEmailList` | [L309604](../../../../ScriptDB/000_4_CreateSP.sql#L309604) | 1 / 1 file | 0 / 1 | [Dealer.cs:665](../../../../UBClasses/Dealer.cs#L665) |
| `UBDealerEmailRemove` | [L309633](../../../../ScriptDB/000_4_CreateSP.sql#L309633) | 1 / 1 file | 0 / 0 | [Dealer.cs:883](../../../../UBClasses/Dealer.cs#L883) |
| `UBDealerEmailUpdate` | [L309656](../../../../ScriptDB/000_4_CreateSP.sql#L309656) | 1 / 1 file | 0 / 0 | [Dealer.cs:712](../../../../UBClasses/Dealer.cs#L712) |
| `UBDocusignExpiryEmail` | [L314737](../../../../ScriptDB/000_4_CreateSP.sql#L314737) | — | 0 / 0 | — |
| `UBEmailOutBox` | [L317002](../../../../ScriptDB/000_4_CreateSP.sql#L317002) | — | 0 / 0 | — |
| `UBEmailOutBoxAdd` | [L317185](../../../../ScriptDB/000_4_CreateSP.sql#L317185) | — | 0 / 0 | — |
| `UBEmailOutBoxClear` | [L317231](../../../../ScriptDB/000_4_CreateSP.sql#L317231) | — | 0 / 0 | — |
| `UBEmailOutBoxRefresh` | [L317327](../../../../ScriptDB/000_4_CreateSP.sql#L317327) | — | 0 / 0 | — |
| `UBEmailServerInfo` | [L317361](../../../../ScriptDB/000_4_CreateSP.sql#L317361) | 1 / 1 file | 0 / 0 | [CBase.cs:5637](../../../../UBClasses/CBase.cs#L5637) |
| `UBEmailServerInfoSave` | [L317393](../../../../ScriptDB/000_4_CreateSP.sql#L317393) | 1 / 1 file | 0 / 0 | [CBase.cs:5703](../../../../UBClasses/CBase.cs#L5703) |
| `UBEmailTaskExcelEnd` | [L317425](../../../../ScriptDB/000_4_CreateSP.sql#L317425) | — | 0 / 0 | — |
| `UBEmailTaskExcelStart` | [L317463](../../../../ScriptDB/000_4_CreateSP.sql#L317463) | — | 0 / 5 | — |
| `UBEmailTemplateAdd` | [L317948](../../../../ScriptDB/000_4_CreateSP.sql#L317948) | — | 0 / 0 | — |
| `UBEmailTemplateInfo` | [L317983](../../../../ScriptDB/000_4_CreateSP.sql#L317983) | — | 0 / 0 | — |
| `UBEmailTemplateList` | [L318012](../../../../ScriptDB/000_4_CreateSP.sql#L318012) | — | 0 / 0 | — |
| `UBEmailTemplateTypeList` | [L318062](../../../../ScriptDB/000_4_CreateSP.sql#L318062) | — | 1 / 0 | — |
| `UBEmailTemplateUpdate` | [L318100](../../../../ScriptDB/000_4_CreateSP.sql#L318100) | — | 0 / 0 | — |
| `UBNotificationCheck` | [L455493](../../../../ScriptDB/000_4_CreateSP.sql#L455493) | — | 0 / 0 | — |
| `UBNotify` | [L455560](../../../../ScriptDB/000_4_CreateSP.sql#L455560) | — | 11 / 1 | — |
| `UBNotifyAdd` | [L455589](../../../../ScriptDB/000_4_CreateSP.sql#L455589) | — | 3 / 2 | — |
| `UBNotifyGetNameEmail` | [L455978](../../../../ScriptDB/000_4_CreateSP.sql#L455978) | — | 0 / 0 | — |
| `UBNotifyInfo` | [L456025](../../../../ScriptDB/000_4_CreateSP.sql#L456025) | — | 0 / 0 | — |
| `UBNotifyInitDlg` | [L456112](../../../../ScriptDB/000_4_CreateSP.sql#L456112) | — | 0 / 0 | — |
| `UBNotifyInternal` | [L456462](../../../../ScriptDB/000_4_CreateSP.sql#L456462) | — | 19 / 0 | — |
| `UBNotifyList` | [L457107](../../../../ScriptDB/000_4_CreateSP.sql#L457107) | 1 / 1 file | 0 / 1 | [Notification.cs:253](../../../../UBClasses/Notification.cs#L253) |
| `UBNotifyListWC` | [L457957](../../../../ScriptDB/000_4_CreateSP.sql#L457957) | 1 / 1 file | 0 / 0 | [Notification.cs:333](../../../../UBClasses/Notification.cs#L333) |
| `UBNotifyListWCX` | [L458059](../../../../ScriptDB/000_4_CreateSP.sql#L458059) | — | 0 / 0 | — |
| `UBNotifyRemove` | [L458203](../../../../ScriptDB/000_4_CreateSP.sql#L458203) | — | 0 / 0 | — |
| `UBNotifyResendEmail` | [L458308](../../../../ScriptDB/000_4_CreateSP.sql#L458308) | — | 0 / 2 | — |
| `UBNotifyUnreadWC` | [L458378](../../../../ScriptDB/000_4_CreateSP.sql#L458378) | — | 0 / 0 | — |
| `UBNotifyWCSendX` | [L458403](../../../../ScriptDB/000_4_CreateSP.sql#L458403) | — | 0 / 1 | — |
| `UBReportText` | [L567696](../../../../ScriptDB/000_4_CreateSP.sql#L567696) | — | 11 / 0 | — |
| `UBTwilioInfo` | [L681492](../../../../ScriptDB/000_4_CreateSP.sql#L681492) | 1 / 1 file | 2 / 0 | [Dealer.cs:841](../../../../UBClasses/Dealer.cs#L841) |
| `UBTwilioUpdate` | [L681512](../../../../ScriptDB/000_4_CreateSP.sql#L681512) | 1 / 1 file | 0 / 0 | [Dealer.cs:793](../../../../UBClasses/Dealer.cs#L793) |
| `UBWCRegistrationEmail` | [L683885](../../../../ScriptDB/000_4_CreateSP.sql#L683885) | — | 1 / 0 | — |
| `VF_VF_AllNotifications` | [L708583](../../../../ScriptDB/000_4_CreateSP.sql#L708583) | — | 0 / 0 | — |
