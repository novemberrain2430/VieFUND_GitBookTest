# SP Catalog — Onboarding

> Phân nhóm gợi ý theo tên procedure. Các cột caller mới là bằng chứng truy vết; `—` không có nghĩa procedure không được dùng.

**Tổng**: 64 definition; 45 có tên tĩnh từ C#; 6 được procedure khác gọi qua EXEC/EXECUTE.

| Procedure | Definition | C# tĩnh | SQL gọi vào / gọi ra | Caller C# mẫu |
|---|---:|---:|---:|---|
| `OBCompARCComboList` | [L142746](../../../../ScriptDB/000_4_CreateSP.sql#L142746) | — | 0 / 2 | — |
| `OBKYCApprovalList` | [L142771](../../../../ScriptDB/000_4_CreateSP.sql#L142771) | — | 0 / 1 | — |
| `OBPlanApprovalList` | [L143077](../../../../ScriptDB/000_4_CreateSP.sql#L143077) | — | 0 / 1 | — |
| `OBTrxApprovalList` | [L143303](../../../../ScriptDB/000_4_CreateSP.sql#L143303) | — | 0 / 1 | — |
| `UBMemberOnboardingGetOne` | [L443863](../../../../ScriptDB/000_4_CreateSP.sql#L443863) | 1 / 1 file | 0 / 0 | [COnBoard.cs:293](../../../../UBClasses/COnBoard.cs#L293) |
| `UBOBAUADashBoard_Client` | [L460950](../../../../ScriptDB/000_4_CreateSP.sql#L460950) | 2 / 2 file | 0 / 2 | [Dashboard.cs:121](../../../../OnboardingWebServices/Dashboard.cs#L121) |
| `UBOBAUADashBoard_ClientOne` | [L461020](../../../../ScriptDB/000_4_CreateSP.sql#L461020) | 2 / 2 file | 0 / 2 | [Dashboard.cs:173](../../../../OnboardingWebServices/Dashboard.cs#L173) |
| `UBOBAUADashBoard_PlanType` | [L461113](../../../../ScriptDB/000_4_CreateSP.sql#L461113) | 2 / 2 file | 0 / 2 | [Dashboard.cs:547](../../../../OnboardingWebServices/Dashboard.cs#L547) |
| `UBOBAUADashBoard_PlanTypeOne` | [L461183](../../../../ScriptDB/000_4_CreateSP.sql#L461183) | 2 / 2 file | 0 / 2 | [Dashboard.cs:599](../../../../OnboardingWebServices/Dashboard.cs#L599) |
| `UBOBAUADashBoard_Product` | [L461291](../../../../ScriptDB/000_4_CreateSP.sql#L461291) | 2 / 2 file | 0 / 2 | [Dashboard_AssetType.cs:108](../../../../OnboardingWebServices/Dashboard_AssetType.cs#L108) |
| `UBOBAUADashBoard_ProductOne` | [L461361](../../../../ScriptDB/000_4_CreateSP.sql#L461361) | 2 / 2 file | 0 / 2 | [Dashboard_AssetType.cs:160](../../../../OnboardingWebServices/Dashboard_AssetType.cs#L160) |
| `UBOBClientInfoExport` | [L461450](../../../../ScriptDB/000_4_CreateSP.sql#L461450) | 2 / 2 file | 0 / 2 | [ClientDetail.cs:79](../../../../OnboardingWebServices/ClientDetail.cs#L79) |
| `UBOBClientListExport` | [L461801](../../../../ScriptDB/000_4_CreateSP.sql#L461801) | 2 / 2 file | 0 / 1 | [COnBoarding.cs:1905](../../../../OnboardingWebServices/COnBoarding.cs#L1905) |
| `UBOBClientPlanExport` | [L461953](../../../../ScriptDB/000_4_CreateSP.sql#L461953) | — | 1 / 2 | — |
| `UBOBClientSearchOnboarding` | [L462004](../../../../ScriptDB/000_4_CreateSP.sql#L462004) | 1 / 1 file | 0 / 1 | [COnBoard.cs:197](../../../../UBClasses/COnBoard.cs#L197) |
| `UBOBDefinitionSet` | [L462176](../../../../ScriptDB/000_4_CreateSP.sql#L462176) | 2 / 2 file | 0 / 0 | [CDefinitions.cs:79](../../../../OnboardingWebServices/CDefinitions.cs#L79) |
| `UBOBFundTrxBuy` | [L464039](../../../../ScriptDB/000_4_CreateSP.sql#L464039) | 2 / 2 file | 0 / 7 | [COnBoardingOrders.cs:464](../../../../OnboardingWebServices/COnBoardingOrders.cs#L464) |
| `UBOBFundTrxSell` | [L464847](../../../../ScriptDB/000_4_CreateSP.sql#L464847) | 2 / 2 file | 0 / 7 | [COnBoardingOrders.cs:551](../../../../OnboardingWebServices/COnBoardingOrders.cs#L551) |
| `UBOBFundTrxSwitch` | [L465342](../../../../ScriptDB/000_4_CreateSP.sql#L465342) | 2 / 2 file | 0 / 5 | [COnBoardingOrders.cs:632](../../../../OnboardingWebServices/COnBoardingOrders.cs#L632) |
| `UBOBGetTestOrder` | [L465865](../../../../ScriptDB/000_4_CreateSP.sql#L465865) | 6 / 2 file | 0 / 0 | [COnBoardingOrders.cs:764](../../../../OnboardingWebServices/COnBoardingOrders.cs#L764) |
| `UBOBInitQuestionDefKey` | [L465915](../../../../ScriptDB/000_4_CreateSP.sql#L465915) | — | 0 / 0 | — |
| `UBOBItemAdd` | [L466106](../../../../ScriptDB/000_4_CreateSP.sql#L466106) | 3 / 3 file | 0 / 1 | [COnBoarding.cs:112](../../../../OnboardingWebServices/COnBoarding.cs#L112) |
| `UBOBItemInfo` | [L466150](../../../../ScriptDB/000_4_CreateSP.sql#L466150) | 1 / 1 file | 0 / 0 | [COnBoard.cs:150](../../../../UBClasses/COnBoard.cs#L150) |
| `UBOBItemList` | [L466189](../../../../ScriptDB/000_4_CreateSP.sql#L466189) | 1 / 1 file | 0 / 0 | [COnBoard.cs:34](../../../../UBClasses/COnBoard.cs#L34) |
| `UBOBItemNotesTranslate` | [L466279](../../../../ScriptDB/000_4_CreateSP.sql#L466279) | — | 1 / 1 | — |
| `UBOBItemProcessClientInfo` | [L466331](../../../../ScriptDB/000_4_CreateSP.sql#L466331) | 2 / 2 file | 0 / 4 | [COnBoarding.cs:285](../../../../OnboardingWebServices/COnBoarding.cs#L285) |
| `UBOBItemProcessClientInfo_Address` | [L466593](../../../../ScriptDB/000_4_CreateSP.sql#L466593) | 2 / 2 file | 0 / 1 | [COnBoarding.cs:481](../../../../OnboardingWebServices/COnBoarding.cs#L481) |
| `UBOBItemProcessClientInfo_Bank` | [L466651](../../../../ScriptDB/000_4_CreateSP.sql#L466651) | 1 / 1 file | 0 / 1 | [COnBoarding.cs:1682](../../../../VFOnBoarding/COnBoarding.cs#L1682) |
| `UBOBItemProcessClientInfo_Employment` | [L466721](../../../../ScriptDB/000_4_CreateSP.sql#L466721) | 2 / 2 file | 0 / 4 | [COnBoarding.cs:601](../../../../OnboardingWebServices/COnBoarding.cs#L601) |
| `UBOBItemProcessClientInfo_ID` | [L466783](../../../../ScriptDB/000_4_CreateSP.sql#L466783) | 2 / 2 file | 0 / 3 | [COnBoarding.cs:900](../../../../OnboardingWebServices/COnBoarding.cs#L900) |
| `UBOBItemProcessClientInfo_KYC` | [L466857](../../../../ScriptDB/000_4_CreateSP.sql#L466857) | 2 / 2 file | 0 / 6 | [COnBoarding.cs:782](../../../../OnboardingWebServices/COnBoarding.cs#L782) |
| `UBOBItemProcessClientInfo_Phone` | [L467084](../../../../ScriptDB/000_4_CreateSP.sql#L467084) | 2 / 2 file | 0 / 1 | [COnBoarding.cs:541](../../../../OnboardingWebServices/COnBoarding.cs#L541) |
| `UBOBItemProcessClientInfo_Plan` | [L467122](../../../../ScriptDB/000_4_CreateSP.sql#L467122) | 2 / 2 file | 0 / 7 | [COnBoarding.cs:985](../../../../OnboardingWebServices/COnBoarding.cs#L985) |
| `UBOBItemProcessClientInfo_PlanBank` | [L467352](../../../../ScriptDB/000_4_CreateSP.sql#L467352) | 2 / 2 file | 0 / 1 | [COnBoarding.cs:1529](../../../../OnboardingWebServices/COnBoarding.cs#L1529) |
| `UBOBItemProcessClientInfo_PlanBen` | [L467422](../../../../ScriptDB/000_4_CreateSP.sql#L467422) | 2 / 2 file | 0 / 3 | [COnBoarding.cs:1306](../../../../OnboardingWebServices/COnBoarding.cs#L1306) |
| `UBOBItemProcessClientInfo_PlanInTrust` | [L467508](../../../../ScriptDB/000_4_CreateSP.sql#L467508) | 2 / 2 file | 0 / 3 | [COnBoarding.cs:1228](../../../../OnboardingWebServices/COnBoarding.cs#L1228) |
| `UBOBItemProcessClientInfo_PlanJoint` | [L467575](../../../../ScriptDB/000_4_CreateSP.sql#L467575) | 2 / 2 file | 0 / 0 | [COnBoarding.cs:1176](../../../../OnboardingWebServices/COnBoarding.cs#L1176) |
| `UBOBItemProcessClientInfo_PlanKYC` | [L467601](../../../../ScriptDB/000_4_CreateSP.sql#L467601) | 2 / 2 file | 0 / 4 | [COnBoarding.cs:1065](../../../../OnboardingWebServices/COnBoarding.cs#L1065) |
| `UBOBItemProcessClientInfo_PlanQuestion` | [L467784](../../../../ScriptDB/000_4_CreateSP.sql#L467784) | 2 / 2 file | 0 / 1 | [COnBoarding.cs:1455](../../../../OnboardingWebServices/COnBoarding.cs#L1455) |
| `UBOBItemProcessClientInfo_Question` | [L467834](../../../../ScriptDB/000_4_CreateSP.sql#L467834) | 2 / 2 file | 0 / 1 | [COnBoarding.cs:708](../../../../OnboardingWebServices/COnBoarding.cs#L708) |
| `UBOBItemProcessClientInfo_Spouse` | [L467891](../../../../ScriptDB/000_4_CreateSP.sql#L467891) | 2 / 2 file | 0 / 4 | [COnBoarding.cs:375](../../../../OnboardingWebServices/COnBoarding.cs#L375) |
| `UBOBItemProcessClientInfo_TCP` | [L468008](../../../../ScriptDB/000_4_CreateSP.sql#L468008) | 1 / 1 file | 0 / 5 | [COnBoarding.cs:2416](../../../../VFOnBoarding/COnBoarding.cs#L2416) |
| `UBOBItemProcessEnd` | [L468168](../../../../ScriptDB/000_4_CreateSP.sql#L468168) | 2 / 2 file | 0 / 0 | [COnBoarding.cs:174](../../../../OnboardingWebServices/COnBoarding.cs#L174) |
| `UBOBItemProcessFeeSetting` | [L468206](../../../../ScriptDB/000_4_CreateSP.sql#L468206) | — | 0 / 2 | — |
| `UBOBItemProcessPACSWP` | [L468628](../../../../ScriptDB/000_4_CreateSP.sql#L468628) | — | 0 / 10 | — |
| `UBOBItemProcessRRIF` | [L469288](../../../../ScriptDB/000_4_CreateSP.sql#L469288) | — | 0 / 4 | — |
| `UBOBItemReject` | [L470184](../../../../ScriptDB/000_4_CreateSP.sql#L470184) | — | 0 / 2 | — |
| `UBOBItemRemove` | [L470240](../../../../ScriptDB/000_4_CreateSP.sql#L470240) | — | 0 / 0 | — |
| `UBOBMasterDashBoard` | [L470255](../../../../ScriptDB/000_4_CreateSP.sql#L470255) | 2 / 2 file | 0 / 0 | [Dashboard.cs:385](../../../../OnboardingWebServices/Dashboard.cs#L385) |
| `UBOBOrderAdd` | [L470531](../../../../ScriptDB/000_4_CreateSP.sql#L470531) | 6 / 2 file | 0 / 0 | [COnBoardingOrders.cs:233](../../../../OnboardingWebServices/COnBoardingOrders.cs#L233) |
| `UBOBOrderProcessEnd` | [L470643](../../../../ScriptDB/000_4_CreateSP.sql#L470643) | 2 / 2 file | 0 / 0 | [COnBoardingOrders.cs:705](../../../../OnboardingWebServices/COnBoardingOrders.cs#L705) |
| `UBOBPlanFeeSettingList` | [L470662](../../../../ScriptDB/000_4_CreateSP.sql#L470662) | — | 2 / 0 | — |
| `UBOBPlanFeeSettingListByPlanID` | [L470763](../../../../ScriptDB/000_4_CreateSP.sql#L470763) | 1 / 1 file | 0 / 1 | [CFeeSetting.cs:141](../../../../VFOnBoarding/CFeeSetting.cs#L141) |
| `UBOBPlanFundAccountList` | [L470799](../../../../ScriptDB/000_4_CreateSP.sql#L470799) | 2 / 2 file | 0 / 0 | [COnBoardingOrders.cs:1028](../../../../OnboardingWebServices/COnBoardingOrders.cs#L1028) |
| `UBOBPlanInfoExport` | [L470876](../../../../ScriptDB/000_4_CreateSP.sql#L470876) | 2 / 2 file | 0 / 2 | [ClientDetail.cs:165](../../../../OnboardingWebServices/ClientDetail.cs#L165) |
| `UBOBPlanListExport` | [L470926](../../../../ScriptDB/000_4_CreateSP.sql#L470926) | — | 2 / 3 | — |
| `UBOBPlanMFListSwitchTo` | [L471236](../../../../ScriptDB/000_4_CreateSP.sql#L471236) | 2 / 2 file | 0 / 0 | [COnBoardingOrders.cs:1117](../../../../OnboardingWebServices/COnBoardingOrders.cs#L1117) |
| `UBOBSystematicPlanList` | [L471305](../../../../ScriptDB/000_4_CreateSP.sql#L471305) | — | 2 / 0 | — |
| `UBOBSystematicPlanListByPlanID` | [L471538](../../../../ScriptDB/000_4_CreateSP.sql#L471538) | 1 / 1 file | 0 / 1 | [CSysPlan.cs:728](../../../../VFOnBoarding/CSysPlan.cs#L728) |
| `UBOnBoardComboList` | [L471751](../../../../ScriptDB/000_4_CreateSP.sql#L471751) | — | 0 / 1 | — |
| `UBOnBoardingClientQuestionList` | [L471766](../../../../ScriptDB/000_4_CreateSP.sql#L471766) | 1 / 1 file | 0 / 0 | [COnBoard.cs:337](../../../../UBClasses/COnBoard.cs#L337) |
| `UBOnBoardingComboList` | [L471810](../../../../ScriptDB/000_4_CreateSP.sql#L471810) | — | 0 / 4 | — |
| `UBOnBoardingNotifyRepAdd` | [L471837](../../../../ScriptDB/000_4_CreateSP.sql#L471837) | — | 0 / 2 | — |
| `UBOnBoardingNotifyRepGetNameEmail` | [L472219](../../../../ScriptDB/000_4_CreateSP.sql#L472219) | — | 1 / 0 | — |
