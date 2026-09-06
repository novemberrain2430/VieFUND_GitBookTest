# SP Catalog — Security & Auth

> Phân nhóm gợi ý theo tên procedure. Các cột caller mới là bằng chứng truy vết; `—` không có nghĩa procedure không được dùng.

**Tổng**: 33 definition; 12 có tên tĩnh từ C#; 7 được procedure khác gọi qua EXEC/EXECUTE.

| Procedure | Definition | C# tĩnh | SQL gọi vào / gọi ra | Caller C# mẫu |
|---|---:|---:|---:|---|
| `CON_MemberLoginIDEqualMemberID` | [L28312](../../../../ScriptDB/000_4_CreateSP.sql#L28312) | — | 0 / 0 | — |
| `GLOB_SetupRepPermission` | [L114751](../../../../ScriptDB/000_4_CreateSP.sql#L114751) | — | 0 / 0 | — |
| `UBCompExecRoleList` | [L276892](../../../../ScriptDB/000_4_CreateSP.sql#L276892) | — | 1 / 0 | — |
| `UBFormSettingSaveToken` | [L358524](../../../../ScriptDB/000_4_CreateSP.sql#L358524) | — | 0 / 0 | — |
| `UBLoginDetailList` | [L437458](../../../../ScriptDB/000_4_CreateSP.sql#L437458) | — | 0 / 0 | — |
| `UBMemberAccessMemberList` | [L438540](../../../../ScriptDB/000_4_CreateSP.sql#L438540) | — | 9 / 0 | — |
| `UBMemberAccessMemberList2` | [L438613](../../../../ScriptDB/000_4_CreateSP.sql#L438613) | — | 3 / 0 | — |
| `UBMemberAccessMemberListExSch` | [L438683](../../../../ScriptDB/000_4_CreateSP.sql#L438683) | — | 1 / 0 | — |
| `UBMemberChangePW` | [L440096](../../../../ScriptDB/000_4_CreateSP.sql#L440096) | 1 / 1 file | 0 / 1 | [CDatabase.cs:2514](../../../../UBConnection/CDatabase.cs#L2514) |
| `UBMemberCheckNewPW` | [L440144](../../../../ScriptDB/000_4_CreateSP.sql#L440144) | 1 / 1 file | 0 / 0 | [Member.cs:945](../../../../UBClasses/Member.cs#L945) |
| `UBMemberCheckNewPWX` | [L440199](../../../../ScriptDB/000_4_CreateSP.sql#L440199) | — | 1 / 0 | — |
| `UBMemberForgotPW` | [L441012](../../../../ScriptDB/000_4_CreateSP.sql#L441012) | 1 / 1 file | 0 / 0 | [CDatabase.cs:2616](../../../../UBConnection/CDatabase.cs#L2616) |
| `UBMemberListNoPW` | [L442794](../../../../ScriptDB/000_4_CreateSP.sql#L442794) | 1 / 1 file | 0 / 0 | [WFPassword.aspx.cs:69](../../../../WebApp/Main/WFPassword.aspx.cs#L69) |
| `UBMemberLogin` | [L442823](../../../../ScriptDB/000_4_CreateSP.sql#L442823) | 1 / 1 file | 0 / 2 | [Member.cs:1205](../../../../UBClasses/Member.cs#L1205) |
| `UBMemberLoginChange` | [L443316](../../../../ScriptDB/000_4_CreateSP.sql#L443316) | 1 / 1 file | 0 / 0 | [Member.cs:4378](../../../../UBClasses/Member.cs#L4378) |
| `UBMemberLoginHistory` | [L443381](../../../../ScriptDB/000_4_CreateSP.sql#L443381) | — | 0 / 0 | — |
| `UBMemberLoginHistoryList` | [L443429](../../../../ScriptDB/000_4_CreateSP.sql#L443429) | — | 0 / 0 | — |
| `UBMemberLoginOther` | [L443449](../../../../ScriptDB/000_4_CreateSP.sql#L443449) | 1 / 1 file | 0 / 0 | [Member.cs:1057](../../../../UBClasses/Member.cs#L1057) |
| `UBMemberLoginShort` | [L443481](../../../../ScriptDB/000_4_CreateSP.sql#L443481) | — | 0 / 0 | — |
| `UBMemberPermission` | [L443924](../../../../ScriptDB/000_4_CreateSP.sql#L443924) | — | 0 / 0 | — |
| `UBMemberPWbyUserID` | [L444155](../../../../ScriptDB/000_4_CreateSP.sql#L444155) | — | 0 / 0 | — |
| `UBMemberPWChanged` | [L444171](../../../../ScriptDB/000_4_CreateSP.sql#L444171) | 1 / 1 file | 0 / 0 | [Member.cs:4433](../../../../UBClasses/Member.cs#L4433) |
| `UBMemberRoleInfo` | [L445051](../../../../ScriptDB/000_4_CreateSP.sql#L445051) | — | 1 / 0 | — |
| `UBPWOptionList` | [L506768](../../../../ScriptDB/000_4_CreateSP.sql#L506768) | — | 4 / 0 | — |
| `UBSessionEnd` | [L599932](../../../../ScriptDB/000_4_CreateSP.sql#L599932) | 1 / 1 file | 0 / 2 | [CBase.cs:3059](../../../../UBClasses/CBase.cs#L3059) |
| `UBSessionExpired` | [L599971](../../../../ScriptDB/000_4_CreateSP.sql#L599971) | 3 / 1 file | 0 / 0 | [CBase.cs:4417](../../../../UBClasses/CBase.cs#L4417) |
| `UBSessionIsExpired` | [L599996](../../../../ScriptDB/000_4_CreateSP.sql#L599996) | — | 0 / 0 | — |
| `UBTokenCreate` | [L638987](../../../../ScriptDB/000_4_CreateSP.sql#L638987) | — | 0 / 0 | — |
| `UBTokenParams` | [L639052](../../../../ScriptDB/000_4_CreateSP.sql#L639052) | — | 0 / 0 | — |
| `UBTokenParamsGet` | [L639143](../../../../ScriptDB/000_4_CreateSP.sql#L639143) | — | 0 / 0 | — |
| `UBTokenUpdate` | [L639350](../../../../ScriptDB/000_4_CreateSP.sql#L639350) | — | 0 / 0 | — |
| `UBWebAppUserUpdatePW` | [L684599](../../../../ScriptDB/000_4_CreateSP.sql#L684599) | 1 / 1 file | 0 / 0 | [WFPassword.aspx.cs:206](../../../../WebApp/Main/WFPassword.aspx.cs#L206) |
| `VF_VF_UserPWList` | [L713361](../../../../ScriptDB/000_4_CreateSP.sql#L713361) | 1 / 1 file | 0 / 0 | [WFPassword.aspx.cs:520](../../../../WebApp/Main/WFPassword.aspx.cs#L520) |
