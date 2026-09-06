[CmdletBinding()]
param(
    [string]$RepositoryRoot = (Resolve-Path (Join-Path $PSScriptRoot '..\..')).Path
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

$outputPath = Join-Path $PSScriptRoot 'traceability-matrix.md'
$sqlPath = Join-Path $RepositoryRoot 'ScriptDB\000_4_CreateSP.sql'

function New-Trace {
    param(
        [string]$Id,
        [string]$Domain,
        [string]$Boundary,
        [string]$Action,
        [string]$EntryFile,
        [string]$EntryToken,
        [string]$EntryLabel,
        [string]$LogicFile,
        [string]$LogicToken,
        [string]$LogicLabel,
        [string[]]$Procedures,
        [string[]]$DbObjects,
        [string]$Note
    )

    return [pscustomobject]@{
        Id = $Id; Domain = $Domain; Boundary = $Boundary; Action = $Action
        EntryFile = $EntryFile; EntryToken = $EntryToken; EntryLabel = $EntryLabel
        LogicFile = $LogicFile; LogicToken = $LogicToken; LogicLabel = $LogicLabel
        Procedures = $Procedures; DbObjects = $DbObjects; Note = $Note
    }
}

function Remove-SqlComments {
    param([string]$Text)
    $value = [regex]::Replace($Text, '(?s)/\*.*?\*/', '')
    return [regex]::Replace($value, '(?m)--.*$', '')
}

function Find-TokenLine {
    param([string]$Path, [string]$Token)
    if ($Token -match '^(?:UB|WX|DI_|MFDA_)') {
        $pattern = '(?<![A-Za-z0-9_])' + [regex]::Escape($Token) + '(?![A-Za-z0-9_])'
        $match = Select-String -LiteralPath $Path -Pattern $pattern | Select-Object -First 1
    }
    else {
        $match = Select-String -LiteralPath $Path -SimpleMatch $Token | Select-Object -First 1
    }
    if ($null -eq $match) { return 0 }
    return $match.LineNumber
}

function Get-MarkdownLink {
    param([string]$FromDirectory, [string]$TargetPath, [int]$Line = 0)
    $relative = [IO.Path]::GetRelativePath($FromDirectory, $TargetPath).Replace('\', '/')
    if ($Line -gt 0) { return "$relative#L$Line" }
    return $relative
}

function Escape-Cell {
    param([string]$Text)
    if ($null -eq $Text) { return '' }
    return $Text.Replace('|', '\|').Replace("`r", ' ').Replace("`n", ' ')
}

$traces = @(
    New-Trace 'AUTH-01' 'Auth & Session' 'WebApp UI' 'Đăng nhập nhân viên/advisor' 'WebApp\Default.aspx.cs' 'CMember.SessionLoginX' 'Default.LogIn' 'UBClasses\Member.cs' 'UBMemberLogin' 'CMember.SessionLoginX' @('UBMemberLogin') @('UB_Member','UB_MemberLogin') 'SP trả quyền, dealer context và trạng thái 2FA.'
    New-Trace 'AUTH-02' 'Auth & Session' 'WebClient UI' 'Đăng nhập client portal' 'WebClient\Default.aspx.cs' 'CCustomer.SessionLoginX' 'Default.LogIn' 'UBClasses\Customer.cs' 'UBClientLogin' 'CCustomer.SessionLoginX' @('UBClientLogin') @('UB_Customer','UB_CustomerLogin') 'Luồng portal dùng session key WC riêng.'
    New-Trace 'AUTH-03' 'Auth & Session' 'WebApp UI' 'Quên mật khẩu nhân viên' 'WebApp\Default.aspx.cs' 'CDatabase.MemberForgotPW' 'OnForgotPW' 'UBConnection\CDatabase.cs' 'UBMemberForgotPW' 'CDatabase.MemberForgotPW' @('UBMemberForgotPW') @('UB_Member','UB_EmailOutBox') 'SP tạo mật khẩu tạm và email outbox.'
    New-Trace 'AUTH-04' 'Auth & Session' 'WebApp UI' 'Sinh/gửi mã 2FA' 'WebApp\Default.aspx.cs' 'CMember.GetNew2FACode' 'On2FASendCode' 'UBConnection\CDatabase.cs' 'UB2FAGetCode4User' 'CDatabase.GetNew2FACode' @('UB2FAGetCode4User') @('UB_Member','UB_MemberLogin') 'Email do DB chuẩn bị; SMS đi qua Twilio ở code-behind.'
    New-Trace 'AUTH-05' 'Auth & Session' 'WebApp UI' 'Đăng xuất và đóng session' 'WebApp\Main\Logout.aspx.cs' 'CBase.SessionLogout' 'OnLogout' 'UBClasses\CBase.cs' 'UBSessionEnd' 'CBase.SessionLogout' @('UBSessionEnd') @('UB_MemberLogin') 'Có bước lưu setting trước khi kết thúc session.'

    New-Trace 'CL-01' 'Client & KYC' 'WebApp UI' 'Tìm client' 'WebApp\Main\Client.aspx.cs' 'CCustomer.UpdateClientSearchList' 'UpdateClientSearchList' 'UBClasses\Customer.cs' 'UBClientSearchLoad' 'CCustomer.GetClientSearchList' @('UBClientSearchLoad') @('UB_Customer','UB_CustomerSearchList') 'Search list được materialize theo user.'
    New-Trace 'CL-02' 'Client & KYC' 'WebApp UI' 'Mở hồ sơ client' 'WebApp\Main\PopupClientAdd.aspx.cs' 'CCustomer.GetClientDataSet' 'UpdateClientInfo' 'UBClasses\Customer.cs' 'UBClientInfo' 'CCustomer.GetClientDataSet' @('UBClientInfo') @('UB_Customer','UB_CustomerRep') 'SP trả DataSet nhiều result table theo RecType.'
    New-Trace 'CL-03' 'Client & KYC' 'WebApp UI' 'Thêm client' 'WebApp\Main\PopupClientAdd.aspx.cs' 'CCustomer.ClientAddUI' 'OnSave' 'UBClasses\Customer.cs' 'UBClientAddUI' 'CCustomer.ClientAddUI' @('UBClientAddUI') @('UB_Customer','UB_CustomerFinInfo') 'Nhánh iClientID bằng 0.'
    New-Trace 'CL-04' 'Client & KYC' 'WebApp UI' 'Cập nhật client' 'WebApp\Main\PopupClientAdd.aspx.cs' 'CCustomer.ClientAddUI' 'OnSave' 'UBClasses\Customer.cs' 'UBClientUpdateUI' 'CCustomer.ClientAddUI' @('UBClientUpdateUI') @('UB_Customer','UB_CustomerFinInfo') 'Nhánh iClientID lớn hơn 0; dùng cùng method với add.'
    New-Trace 'CL-05' 'Client & KYC' 'BLL/shared UI' 'Đọc bộ KYC client/plan' 'UBClasses\Customer.cs' 'GetClientKYCSet' 'CCustomer.GetClientKYCSet' 'UBClasses\Customer.cs' 'UBClientKYC' 'CCustomer.GetClientKYCSet' @('UBClientKYC') @('UB_Customer','UB_CustomerExtraInfo') 'Caller UI thay đổi theo màn hình; contract DB nằm ở BLL này.'

    New-Trace 'AP-01' 'Account & Plan' 'WebApp UI' 'Thêm plan' 'WebApp\Main\PopupPlanAdd.aspx.cs' 'Plan.PlanAddUI' 'OnSave' 'UBClasses\Plan.cs' 'UBPlanAdd' 'Plan.PlanAddUI' @('UBPlanAdd') @('UB_Plan','UB_CustomerPlan') 'Nhánh iPlanID bằng 0.'
    New-Trace 'AP-02' 'Account & Plan' 'WebApp UI' 'Cập nhật plan' 'WebApp\Main\PopupPlanAdd.aspx.cs' 'Plan.PlanAddUI' 'OnSave' 'UBClasses\Plan.cs' 'UBPlanUpdate' 'Plan.PlanAddUI' @('UBPlanUpdate') @('UB_Plan','UB_CustomerPlan') 'Nhánh iPlanID khác 0.'
    New-Trace 'AP-03' 'Account & Plan' 'WebApp UI' 'Xóa plan' 'WebApp\Main\Client.aspx.cs' 'Plan.PlanDeleteUI' 'OnPlanDelete' 'UBClasses\Plan.cs' 'UBPlanDelete' 'Plan.PlanDeleteUI' @('UBPlanDelete') @('UB_Plan','UB_FundAccount') 'SP kiểm tra dữ liệu account/position trước khi xóa.'
    New-Trace 'AP-04' 'Account & Plan' 'WebApp panel' 'Đọc/sửa beneficiary' 'WebApp\Main\PanelPlanBenAdd.aspx.cs' 'UBPlanInfoBenEdit' 'PanelPlanBenAdd' 'WebApp\Main\PanelPlanBenAdd.aspx.cs' 'UBPlanInfoBenEdit' 'CDatabase trực tiếp' @('UBPlanInfoBenEdit') @('UB_PlanBen','UB_Address') 'Panel gọi CDatabase trực tiếp, không qua Plan BLL cho action này.'
    New-Trace 'AP-05' 'Account & Plan' 'WebApp panel' 'Lưu RRIF payment setting' 'WebApp\Main\PanelRRIFPayment.aspx.cs' 'RRIFSetting.PlanRRIFSettingUpdate' 'OnSave' 'UBClasses\RRIFSetting.cs' 'UBRRIFSettingSave' 'RRIFSetting.PlanRRIFSettingUpdate' @('UBRRIFSettingSave') @('UB_RRIFSetting','UB_RRIFSettingFund') 'Gồm bank/cheque/fund allocation và waiting state.'

    New-Trace 'TR-01' 'Trading & Orders' 'WebApp popup' 'Tạo lệnh Buy' 'WebApp\Main\PopupTradeAdd.aspx.cs' 'CTrx.Buy' 'OnBuy' 'UBClasses\Trx.cs' 'UBFundTrxBuy' 'CTrx.Buy' @('UBFundTrxBuy') @('UB_FundTrxOrder','UB_FundAccountPosition') 'Rule plan, fund, compliance và settlement nằm trong SP.'
    New-Trace 'TR-02' 'Trading & Orders' 'WebApp popup' 'Tạo lệnh Sell' 'WebApp\Main\PopupTradeAdd.aspx.cs' 'CTrx.Sell' 'OnSell' 'UBClasses\Trx.cs' 'UBFundTrxSell' 'CTrx.Sell' @('UBFundTrxSell') @('UB_FundTrxOrder','UB_FundAccountPosition') 'Có nhánh cheque/bank và conversion.'
    New-Trace 'TR-03' 'Trading & Orders' 'WebApp popup' 'Tạo lệnh Switch' 'WebApp\Main\PopupTradeAdd.aspx.cs' 'CTrx.Switch' 'OnSwitch' 'UBClasses\Trx.cs' 'UBFundTrxSwitch' 'CTrx.Switch' @('UBFundTrxSwitch') @('UB_FundTrxOrder','UB_FundTrx') 'Ghi quan hệ from/to và audit order.'
    New-Trace 'TR-04' 'Trading & Orders' 'WebApp popup' 'Xem pending orders' 'WebApp\Main\PopupTradeAdd.aspx.cs' 'CTrx.GetPendingOrderList' 'UpdatePendingOrderList' 'UBClasses\Trx.cs' 'UBTrxPendingOrderList' 'CTrx.GetPendingOrderList' @('UBTrxPendingOrderList') @('UB_FundTrxOrder','UB_FundTrx') 'Cùng BLL còn được Client.aspx tái sử dụng.'
    New-Trace 'TR-05' 'Trading & Orders' 'WebApp UI' 'Tìm giao dịch' 'WebApp\Main\TrxView.aspx.cs' 'CTrx.DisplayViewList' 'UpdateViewList' 'UBClasses\Trx.cs' 'UBTrxViewSearch' 'CTrx.GetViewList' @('UBTrxViewSearch') @('UB_FundTrx','UB_TrxSearchList') 'Search/paging/sort và view setting theo user.'
    New-Trace 'TR-06' 'Trading & Orders' 'WebApp popup' 'Thêm/sửa manual transaction' 'WebApp\Main\PopupTrxManualAdd.aspx.cs' 'CTrx.ManualUpdate' 'OnSave' 'UBClasses\Trx.cs' 'UBFundTrxManualAdd' 'CTrx.ManualUpdate' @('UBFundTrxManualAdd','UBFundTrxManualUpdate') @('UB_FundTrx','UB_FundAccountPosition') 'SP được chọn bằng ternary theo iTrxID.'

    New-Trace 'CM-01' 'Commission & Fee' 'WebApp UI' 'Tìm commission revenue' 'WebApp\Main\CommissionView.aspx.cs' 'CommissionRevenue.DisplayViewList' 'UpdateViewList' 'UBClasses\CommissionRevenue.cs' 'UBCommissionViewSearch' 'CommissionRevenue.GetViewList' @('UBCommissionViewSearch') @('UB_CommRevenue','UB_CommRevenueSearchListTMP') 'Danh sách, total, paging và selection theo user.'
    New-Trace 'CM-02' 'Commission & Fee' 'WebApp UI' 'Chuyển revenue sang payable' 'WebApp\Main\CommissionView.aspx.cs' 'CommissionRevenue.MoveTagged2Payable' 'OnMoveToPayable' 'UBClasses\CommissionRevenue.cs' 'UBCommissionMove2Payable' 'CommissionRevenue.MoveTagged2Payable' @('UBCommissionMove2Payable') @('UB_CommRevenue','UB_CommRevenueHeader') 'Xử lý các dòng đã tag và grouping header.'
    New-Trace 'CM-03' 'Commission & Fee' 'WebApp UI' 'Chạy payroll' 'WebApp\Main\CommissionView.aspx.cs' 'CommissionRevenue.PayrollProcess' 'OnPayrollProcess' 'UBClasses\CommissionRevenue.cs' 'UBCommPayrollProcess' 'CommissionRevenue.PayrollProcess' @('UBCommPayrollProcess') @('UB_CommPayroll','UB_CommPayable') 'Tên SP nằm trong biến cục bộ nhưng giá trị tĩnh.'
    New-Trace 'CM-04' 'Commission & Fee' 'WebApp UI' 'Xem payroll history' 'WebApp\Main\CommissionView.aspx.cs' 'CommissionRevenue.DisplayPayrollHistoryList' 'UpdatePayrollHistory' 'UBClasses\CommissionRevenue.cs' 'UBCommissionPayrollSearchHistory' 'CommissionRevenue.GetPayrollHistoryList' @('UBCommissionPayrollSearchHistory') @('UB_CommPayroll','UB_CommPayable') 'Có filter/paging và balance-forward option.'
    New-Trace 'CM-05' 'Commission & Fee' 'WebApp panel' 'Khởi tạo/kết thúc fee processing' 'WebApp\Main\PanelFeeProcess.aspx.cs' 'CFeeProcessing.CanProcess' 'OnProcess' 'UBClasses\FeeProcessing.cs' 'UBFeeProcessStart' 'CFeeProcessing worker' @('UBFeeProcessStart','UBFeeProcessEnd') @('UB_FeeProcess','UB_PlanFee') 'Worker chạy nhiều bước; matrix ghi boundary start/end.'

    New-Trace 'FG-01' 'Fund & GIC' 'WebApp panel' 'Tìm fund' 'WebApp\Main\PanelFundPicker.aspx.cs' 'CFundDef.GetFundListSearch' 'UpdateFundList' 'UBClasses\FundDef.cs' 'UBFundSearchList' 'CFundDef.GetFundListSearch' @('UBFundSearchList') @('UB_FundDef','UB_FundDefDetail') 'Fund picker dùng chung ở nhiều popup.'
    New-Trace 'FG-02' 'Fund & GIC' 'WebApp panel' 'Thêm fund favorite' 'WebApp\Main\PanelFundPicker.aspx.cs' 'CFundDef.AddFavorite' 'OnFavoriteAdd' 'UBClasses\FundDef.cs' 'UBFundFavoriteAdd' 'CFundDef.AddFavorite' @('UBFundFavoriteAdd') @('UB_FundDef','UB_FundDefFavorite') 'Favorite gắn với user.'
    New-Trace 'FG-03' 'Fund & GIC' 'WebApp panel' 'Tìm rate sản phẩm GIC' 'WebApp\Main\PanelCannexOrder.aspx.cs' 'CFundDef.GICProdRateSearch' 'UpdateGICRateList' 'UBClasses\FundDef.cs' 'UBGICDefLookup' 'CFundDef.GICProdRateSearch' @('UBGICDefLookup') @('UB_GICProdDef','UB_GICRate') 'Tên method cũ nói RateSearch, SP thực tế là UBGICDefLookup.'

    New-Trace 'CO-01' 'Compliance' 'WebApp UI' 'Danh sách trade suitability' 'WebApp\Main\ComplianceTrx.aspx.cs' 'Compliance.TrxSuitabilitySet' 'UpdateList' 'UBClasses\Compliance.cs' 'UBCompTrxSuitabilityListByPlan' 'Compliance.TrxSuitabilitySet' @('UBCompTrxSuitabilityListByPlan') @('UB_CompTrxApprovalStatusARC','UB_FundTrx') 'Có filter cấp review/status/plan/rep.'
    New-Trace 'CO-02' 'Compliance' 'WebApp UI' 'Approve trade đã tag' 'WebApp\Main\ComplianceTrx.aspx.cs' 'Compliance.TrxApproveTagged' 'OnApproveTagged' 'UBClasses\Compliance.cs' 'UBCompTrxApproveTaggedItems' 'Compliance.TrxApproveTagged' @('UBCompTrxApproveTaggedItems') @('UB_CompTrxApprovalStatusARC') 'Wrapper SQL dispatch từng trade sang status update.'
    New-Trace 'CO-03' 'Compliance' 'WebApp UI' 'Approve account opening đã tag' 'WebApp\Main\ComplianceAccount.aspx.cs' 'Compliance.AccountOpeningApproveTagged' 'OnApproveTagged' 'UBClasses\Compliance.cs' 'UBCompAccountOpeningApproveTaggedItems' 'Compliance.AccountOpeningApproveTagged' @('UBCompAccountOpeningApproveTaggedItems') @('UB_CompPlanApprovalStatus') 'Có approval level và deficiency notes.'
    New-Trace 'CO-04' 'Compliance' 'WebApp UI' 'Approve KYC update đã tag' 'WebApp\Main\ComplianceAccountUpdate.aspx.cs' 'Compliance.AccountKYCUpdateApproveTagged' 'OnApproveTagged' 'UBClasses\Compliance.cs' 'UBCompAccountKYCUpdateApproveTaggedItems' 'Compliance.AccountKYCUpdateApproveTagged' @('UBCompAccountKYCUpdateApproveTaggedItems') @('UB_CompPlanApprovalStatus') 'Tách khỏi account-opening queue.'
    New-Trace 'CO-05' 'Compliance' 'WebApp UI' 'Theo dõi missing KYC' 'WebApp\Main\ComplianceIncompleteKYC.aspx.cs' 'Plan.MissingKYCSet' 'UpdateList' 'UBClasses\Plan.cs' 'UBCompMissingKYCList' 'Plan.MissingKYCSet' @('UBCompMissingKYCList') @('UB_CompCheckClient','UB_CompCheckPlan') 'Queue tổng hợp client và plan chưa đủ KYC.'

    New-Trace 'TX-01' 'Tax & Year-End' 'WebApp fragment' 'Danh sách T4RSP Pending' 'WebApp\Main\YearEnd_T4RSP.aspx.cs' 'CT4RSP.GetPendingSet' 'UpdatePendingList' 'UBClasses\T4RSP.cs' 'UBT4RSPPendingList' 'CT4RSP.GetPendingSet' @('UBT4RSPPendingList') @('UB_T4RSPPendingSelectionTMP','UB_T4RSP_SLP') 'Selection Pending được lưu theo user.'
    New-Trace 'TX-02' 'Tax & Year-End' 'WebApp fragment' 'Tạo T4RSP từ các dòng Pending' 'WebApp\Main\YearEnd_T4RSP.aspx.cs' 'CT4RSP.ProcessPendingItems' 'OnProcessPending' 'UBClasses\T4RSP.cs' 'UBT4RSPProcessPendingTaggedItems' 'CT4RSP.ProcessPendingItems' @('UBT4RSPProcessPendingTaggedItems','UBT4RSPProcessOneItem') @('UB_T4RSPPendingSelectionTMP','UB_T4RSP_SLP') 'Wrapper lặp selection và gọi ProcessOneItem.'
    New-Trace 'TX-03' 'Tax & Year-End' 'WebApp panel' 'Lưu transmitter/T619' 'WebApp\Main\PanelT619.aspx.cs' 'CT619.UpdateInfo' 'SaveT619' 'UBClasses\T619.cs' 'UBT619InfoUpdate' 'CT619.UpdateInfo' @('UBT619InfoUpdate') @('UB_T619TRM') 'Option save-only không tạo export request.'
    New-Trace 'TX-04' 'Tax & Year-End' 'WebApp panel' 'Tạo request XML tax' 'WebApp\Main\PanelT619.aspx.cs' 'CT619.UpdateInfo' 'SaveT619' 'UBClasses\T619.cs' 'UBT619InfoUpdate' 'CT619.UpdateInfo' @('UBT619InfoUpdate','UBExportAddRequestT') @('UB_ExportRequest','UB_ExportRequestItem') 'UBT619InfoUpdate gọi UBExportAddRequestT khi không phải save-only.'
    New-Trace 'TX-05' 'Tax & Year-End' 'WebApp UI' 'Đánh dấu Filed/Submitted' 'WebApp\Main\YearEnd.aspx.cs' 'CT619.SubmissionUpdate' 'OnSubmissionUpdate' 'UBClasses\T619.cs' 'UBCRASubmissionUpdate' 'CT619.SubmissionUpdate' @('UBCRASubmissionUpdate') @('UB_ExportRequest','UB_T4RSP_SLP') 'Cập nhật request và slip/current archive theo export type.'

    New-Trace 'OB-01' 'Onboarding' 'ASMX API' 'Stage payload client' 'VFOnBoarding\VieFUNDOnBoarding.cs' 'ImportClient(' 'ImportClient/ImportClientJSON' 'VFOnBoarding\COnBoarding.cs' 'UBOBItemAdd' 'COnBoarding.SaveOneRecord' @('UBOBItemAdd') @('UB_OBItem') 'Payload luôn vào staging trước khi xử lý.'
    New-Trace 'OB-02' 'Onboarding' 'ASMX API' 'Xử lý và đóng item onboarding' 'VFOnBoarding\VieFUNDOnBoarding.cs' 'ImportClient(' 'ImportClient/ImportClientJSON' 'VFOnBoarding\COnBoarding.cs' 'UBOBItemProcessEnd' 'COnBoarding.ProcessOneItem' @('UBOBItemProcessEnd') @('UB_OBItem') 'Core client/plan xử lý trước khi cập nhật trạng thái tổng.'
    New-Trace 'OB-03' 'Onboarding' 'WebApp UI' 'Danh sách onboarding item' 'WebApp\Main\OnBoardView.aspx.cs' 'COnBoard.GetSet' 'UpdatePendingList' 'UBClasses\COnBoard.cs' 'UBOBItemList' 'COnBoard.GetSet' @('UBOBItemList') @('UB_OBItem') 'SP hiện không filter đầy đủ DSID/user như guide đã ghi.'
    New-Trace 'OB-04' 'Onboarding' 'WebApp UI' 'Reject onboarding item' 'WebApp\Main\OnBoardView.aspx.cs' 'COnBoard.ItemReject' 'OnReject' 'UBClasses\COnBoard.cs' 'UBOBItemReject' 'COnBoard.ItemReject' @('UBOBItemReject','UBNotifyAdd') @('UB_OBItem','UB_Notification') 'SP reject gọi notification khi đủ dữ liệu email.'
    New-Trace 'OB-05' 'Onboarding' 'ASMX API' 'Stage order import' 'VFOnBoarding\VieFUNDOnBoarding.cs' 'COnBoardingOrders.Process' 'ImportBuy/Sell/Switch' 'VFOnBoarding\COnBoardingOrders.cs' 'UBOBOrderAdd' 'COnBoardingOrders.Process' @('UBOBOrderAdd') @('UB_OBOrder') 'Sau staging mới gọi UBOBFundTrxBuy/Sell/Switch.'

    New-Trace 'FS-01' 'Fundserv' 'WebApp UI' 'Queue NFU thay đổi account/client' 'WebApp\Main\Client.aspx.cs' 'CNFU.AddNFU' 'Client NFU action' 'UBClasses\NFU.cs' 'UBNFUAdd' 'CNFU.AddNFU' @('UBNFUAdd') @('UB_FundAccount','UB_Plan') 'NFU được ghi vào DB để service sinh file sau.'
    New-Trace 'FS-02' 'Fundserv' 'Windows Service' 'Sinh order file CO' 'VieFUNDIE\VieFUNDIE.cs' 'COrder.OrderFileGenerate' 'UBImportFS.OnTimer' 'UBFFImport\COrder.cs' 'UBOrderCreateFile' 'COrder.OrderFileGenerate' @('UBOrderCreateFile','UBOrderFileUpdateStatus') @('UB_OrderWaiting2Send','UB_OrderMSG') 'Service đọc waiting orders, ghi file rồi cập nhật status.'
    New-Trace 'FS-03' 'Fundserv' 'Windows Service' 'Sinh NFU file' 'VieFUNDIE\VieFUNDIE.cs' 'CXM.FileGenerate' 'UBImportFS.OnTimer' 'UBFFImport\CXM.cs' 'UBNFUCreateFile' 'CXM.FileGenerate' @('UBNFUCreateFile') @('UB_NFUFile','UB_NFUMSG') 'Cùng timer service với order export.'
    New-Trace 'FS-04' 'Fundserv' 'Import handler' 'Nhập order response DR' 'UBFFImport\COrder.cs' 'ImportXML(' 'COrder.ImportXML' 'UBFFImport\COrder.cs' 'UBXMLRecOrderRespnProcess' 'COrder.ImportXMLOrderProcess' @('UBXMLRecOrderRespnProcess') @('UB_OrderSent','UB_FundTrxOrder') 'Parser XML chuẩn hóa record rồi SP cập nhật order/trx.'

    New-Trace 'XF-01' 'Cross-cutting' 'WebApp endpoint' 'Đọc PDF object đã lưu' 'WebApp\Main\PdfView.aspx.cs' 'PdfBuilder.GetPdfObjDataX' 'PdfView route' 'VieFUNDPdf\CPDF.cs' 'UBGetPdfObj' 'PdfBuilder.GetPdfObjDataX' @('UBGetPdfObj') @('UB_PdfObj') 'Route/type quyết định thêm các bảng slip archive.'
    New-Trace 'XF-02' 'Cross-cutting' 'WebApp popup' 'Tạo notification' 'WebApp\Main\PopupNotificationAdd.aspx.cs' 'CNotification.Add' 'OnSave' 'UBClasses\Notification.cs' 'UBNotifyAdd' 'CNotification.Add' @('UBNotifyAdd') @('UB_Notification','UB_EmailOutBox') 'Một action có thể vừa tạo inbox notification vừa queue email.'
)

# Parse SQL definitions, table references và call graph.
$sqlText = Get-Content -LiteralPath $sqlPath -Raw
$definitionRegex = [regex]'(?im)^[ \t]*CREATE\s+(?:PROC|PROCEDURE)\s+(?:(?:\[?dbo\]?\.)?)\[?([A-Za-z0-9_]+)\]?'
$matches = $definitionRegex.Matches($sqlText)
$definitions = @{}
$line = 1
$cursor = 0
for ($index = 0; $index -lt $matches.Count; $index++) {
    $match = $matches[$index]
    if ($match.Index -gt $cursor) {
        $line += [regex]::Matches($sqlText.Substring($cursor, $match.Index - $cursor), "`n").Count
    }
    $end = if ($index + 1 -lt $matches.Count) { $matches[$index + 1].Index } else { $sqlText.Length }
    $body = Remove-SqlComments -Text $sqlText.Substring($match.Index, $end - $match.Index)
    $name = $match.Groups[1].Value
    $tables = [System.Collections.Generic.HashSet[string]]::new([System.StringComparer]::OrdinalIgnoreCase)
    foreach ($tableMatch in [regex]::Matches($body, '\b(?:UB|WX)_[A-Za-z0-9_]+\b')) { [void]$tables.Add($tableMatch.Value) }
    $calls = [System.Collections.Generic.HashSet[string]]::new([System.StringComparer]::OrdinalIgnoreCase)
    foreach ($callMatch in [regex]::Matches($body, '(?im)\bEXEC(?:UTE)?\s+(?:@[A-Za-z_]\w*\s*=\s*)?(?:(?:\[?dbo\]?\.)?)\[?([A-Za-z][A-Za-z0-9_]*)\]?')) {
        [void]$calls.Add($callMatch.Groups[1].Value)
    }
    $definitions[$name] = [pscustomobject]@{ Name = $name; Line = $line; Tables = $tables; Calls = $calls }
    $cursor = $match.Index
}

function Get-ReachableTables {
    param([string[]]$ProcedureNames)
    $result = [System.Collections.Generic.HashSet[string]]::new([System.StringComparer]::OrdinalIgnoreCase)
    $visited = [System.Collections.Generic.HashSet[string]]::new([System.StringComparer]::OrdinalIgnoreCase)
    $queue = [System.Collections.Generic.Queue[string]]::new()
    foreach ($name in $ProcedureNames) { $queue.Enqueue($name) }
    while ($queue.Count -gt 0) {
        $name = $queue.Dequeue()
        if (-not $visited.Add($name)) { continue }
        if (-not $definitions.ContainsKey($name)) { continue }
        foreach ($table in $definitions[$name].Tables) { [void]$result.Add($table) }
        foreach ($callee in $definitions[$name].Calls) {
            if ($definitions.ContainsKey($callee) -and -not $visited.Contains($callee)) { $queue.Enqueue($callee) }
        }
    }
    return ,$result
}

# Validate toàn bộ manifest trước khi sinh tài liệu.
$issues = [System.Collections.Generic.List[string]]::new()
foreach ($trace in $traces) {
    $entryPath = Join-Path $RepositoryRoot $trace.EntryFile
    $logicPath = Join-Path $RepositoryRoot $trace.LogicFile
    if (-not (Test-Path -LiteralPath $entryPath)) { $issues.Add("$($trace.Id): thiếu entry file $($trace.EntryFile)") }
    elseif ((Find-TokenLine -Path $entryPath -Token $trace.EntryToken) -eq 0) { $issues.Add("$($trace.Id): thiếu entry token $($trace.EntryToken)") }
    if (-not (Test-Path -LiteralPath $logicPath)) { $issues.Add("$($trace.Id): thiếu logic file $($trace.LogicFile)") }
    elseif ((Find-TokenLine -Path $logicPath -Token $trace.LogicToken) -eq 0) { $issues.Add("$($trace.Id): thiếu logic token $($trace.LogicToken)") }
    foreach ($procedure in $trace.Procedures) {
        if (-not $definitions.ContainsKey($procedure)) { $issues.Add("$($trace.Id): thiếu procedure $procedure") }
    }
    $reachableTables = Get-ReachableTables -ProcedureNames $trace.Procedures
    foreach ($dbObject in $trace.DbObjects) {
        if (-not $reachableTables.Contains($dbObject)) { $issues.Add("$($trace.Id): không thấy DB object $dbObject trong SP/call graph") }
    }
}
if ($issues.Count -gt 0) {
    throw "Traceability manifest không hợp lệ:`n$($issues -join "`n")"
}

# Sinh tài liệu.
$lines = [System.Collections.Generic.List[string]]::new()
$lines.Add('# Traceability Matrix — UI/API → Code → SP → Database')
$lines.Add('')
$lines.Add('> Ma trận truy vết 50 luồng quan trọng, sinh từ manifest đã kiểm tra trực tiếp với source C# và `ScriptDB/000_4_CreateSP.sql` ngày 2026-09-05. `VFCsvExport` không nằm trong phạm vi.')
$lines.Add('')
$lines.Add('## 1. Cách đọc và ranh giới')
$lines.Add('')
$lines.Add('Mỗi dòng trả lời bốn câu hỏi: action bắt đầu ở đâu, code nào điều phối, procedure nào thực thi và đối tượng DB trọng yếu nào nằm trong call graph SQL. Generator chỉ sinh file khi entry token, logic token, procedure definition và DB object khai báo đều tồn tại.')
$lines.Add('')
$lines.Add('Ma trận này tập trung vào luồng nghiệp vụ/trục kỹ thuật quan trọng. Inventory toàn bộ Web Forms nằm ở [Screen Catalog](screen-catalog.md); inventory toàn bộ procedure nằm ở [SP Catalog](sp-catalog/).')
$lines.Add('')
$lines.Add('Các giới hạn:')
$lines.Add('')
$lines.Add('- DB object được xác minh trong procedure hoặc procedure con gọi qua `EXEC/EXECUTE`; đây không phải danh sách mọi bảng phụ.')
$lines.Add('- “Có reference” không chứng minh route được bật ở production; cần kiểm tra menu/setting/quyền/runtime.')
$lines.Add('- Tên SP động, dynamic SQL, SQL Agent và integration ngoài workspace có thể tạo thêm cạnh chưa biểu diễn.')
$lines.Add('- Bảng temporary/selection theo user vẫn là DB state, không phải browser-only state.')
$lines.Add('')
$lines.Add('## 2. Tổng quan coverage')
$lines.Add('')
$lines.Add('| Miền | Số luồng |')
$lines.Add('|---|---:|')
foreach ($group in ($traces | Group-Object Domain | Sort-Object Name)) {
    $anchor = $group.Name.ToLowerInvariant().Replace(' & ','-').Replace(' ','-')
    $lines.Add("| [$($group.Name)](#$anchor) | $($group.Count) |")
}
$lines.Add("| **Tổng** | **$($traces.Count)** |")
$lines.Add('')
$lines.Add('## 3. Ma trận')

foreach ($group in ($traces | Group-Object Domain)) {
    $lines.Add('')
    $anchor = $group.Name.ToLowerInvariant().Replace(' & ','-').Replace(' ','-')
    $lines.Add("<a id=`"$anchor`"></a>")
    $lines.Add('')
    $lines.Add("### $($group.Name)")
    $lines.Add('')
    $lines.Add('| ID | Boundary / action | Entry point | Logic | Stored procedure | DB objects trọng yếu | Ghi chú |')
    $lines.Add('|---|---|---|---|---|---|---|')
    foreach ($trace in $group.Group) {
        $entryPath = Join-Path $RepositoryRoot $trace.EntryFile
        $logicPath = Join-Path $RepositoryRoot $trace.LogicFile
        $entryLine = Find-TokenLine -Path $entryPath -Token $trace.EntryToken
        $logicLine = Find-TokenLine -Path $logicPath -Token $trace.LogicToken
        $entryLink = Get-MarkdownLink -FromDirectory $PSScriptRoot -TargetPath $entryPath -Line $entryLine
        $logicLink = Get-MarkdownLink -FromDirectory $PSScriptRoot -TargetPath $logicPath -Line $logicLine
        $procedureLinks = foreach ($procedure in $trace.Procedures) {
            $sqlLink = Get-MarkdownLink -FromDirectory $PSScriptRoot -TargetPath $sqlPath -Line $definitions[$procedure].Line
            "[``$procedure``]($sqlLink)"
        }
        $dbObjects = ($trace.DbObjects | ForEach-Object { "``$_``" }) -join ', '
        $boundaryAction = "**$($trace.Boundary)**<br>$($trace.Action)"
        $entry = "[$($trace.EntryLabel)]($entryLink)<br>``$($trace.EntryFile)``"
        $logic = "[$($trace.LogicLabel)]($logicLink)<br>``$($trace.LogicFile)``"
        $note = Escape-Cell -Text $trace.Note
        $lines.Add("| ``$($trace.Id)`` | $boundaryAction | $entry | $logic | $($procedureLinks -join '<br>') | $dbObjects | $note |")
    }
}

$lines.Add('')
$lines.Add('## 4. Chuỗi end-to-end nên nhớ')
$lines.Add('')
$lines.Add('```text')
$lines.Add('Browser/API/Service')
$lines.Add('  → code-behind / ASMX / timer service')
$lines.Add('  → UBClasses hoặc UBFFImport/VieFUNDPdf')
$lines.Add('  → CDatabase.SetSP + parameters')
$lines.Add('  → stored procedure chính')
$lines.Add('  → procedure con / tables / selection TMP / audit / outbox')
$lines.Add('```')
$lines.Add('')
$lines.Add('Khi debug, không nhảy thẳng từ màn hình sang bảng: cần giữ nguyên DBID/DSID/user/session, option, status và result-set contract qua từng tầng.')
$lines.Add('')
$lines.Add('## 5. Khoảng trống và findings liên quan')
$lines.Add('')
$lines.Add('1. Catalog này xác minh 50 trace; không tuyên bố bao phủ toàn bộ 1.358 ASPX artifact hay 5.544 procedure. [Screen Catalog](screen-catalog.md) cung cấp breadth, còn matrix này cung cấp depth.')
$lines.Add('2. Các trace `AP-04` và một số page legacy gọi `CDatabase` trực tiếp, nên kiến trúc thực tế không luôn có một BLL riêng.')
$lines.Add('3. `FG-03` cho thấy tên method và SP có thể lệch (`GICProdRateSearch` → `UBGICDefLookup`); tìm theo business name thôi có thể bỏ sót.')
$lines.Add('4. `CM-03`, Tax wrappers và nhiều BLL dùng tên SP qua biến tĩnh; phải đọc assignment trong phạm vi method, không chỉ tìm `SetSP("...")`.')
$lines.Add('5. Các finding đã xác minh như Onboarding thiếu scope DSID, callback URL luôn pass, T4 export gap, ODBC và notification scope vẫn giữ ở module/framework guide; matrix chỉ chỉ ra đường ảnh hưởng, không lặp remediation.')
$lines.Add('')
$lines.Add('Không phát hiện bug mới độc lập trong quá trình dựng 50 trace; các bất thường thấy lại đều đã có trong tracker/module guides.')
$lines.Add('')
$lines.Add('## 6. Cách mở rộng an toàn')
$lines.Add('')
$lines.Add('1. Thêm row vào `generate-traceability.ps1`, gồm entry token, logic token, procedure và DB object trọng yếu.')
$lines.Add('2. Chạy generator. Nếu một mắt xích không tồn tại, script dừng và báo ID lỗi.')
$lines.Add('3. Đọc toàn bộ SP contract để bổ sung status/permission/DSID; validator chỉ xác nhận liên kết tĩnh.')
$lines.Add('4. Cập nhật module guide nếu phát hiện business rule mới, và Screen Catalog nếu entry point UI thay đổi.')
$lines.Add('')
$lines.Add('```powershell')
$lines.Add('& Docs_V2/reference/generate-traceability.ps1')
$lines.Add('```')
$lines.Add('')
$lines.Add('## 7. Tài liệu liên quan')
$lines.Add('')
$lines.Add('- [System Map](../getting-started/system-map.md)')
$lines.Add('- [Database Access](../viefund-framework/database-access.md)')
$lines.Add('- [Data Dictionary](data-dictionary.md)')
$lines.Add('- [SP Catalog](sp-catalog/)')
$lines.Add('- [Screen Catalog](screen-catalog.md)')
$lines.Add('- [Topics](../topics/)')

$lines | Set-Content -LiteralPath $outputPath -Encoding utf8

[pscustomobject]@{
    TraceRows = $traces.Count
    Domains = @($traces | Select-Object -ExpandProperty Domain -Unique).Count
    EntryFiles = @($traces | Select-Object -ExpandProperty EntryFile -Unique).Count
    LogicFiles = @($traces | Select-Object -ExpandProperty LogicFile -Unique).Count
    Procedures = @($traces.Procedures | Sort-Object -Unique).Count
    DbObjects = @($traces.DbObjects | Sort-Object -Unique).Count
    ValidationIssues = $issues.Count
    Output = $outputPath
} | Format-List
