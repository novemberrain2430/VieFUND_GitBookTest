USE [VieFUND]
GO
/****** Object:  StoredProcedure [dbo].[UBOBItemProcessClientInfo_Plan]    Script Date: 6/1/2026 10:23:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[UBOBItemProcessClientInfo_Plan](@iOptions int = 0, @iItemID int = 0,
			@iUserID int, @iClientID int = 0, 
			@iPlanID int = 0,  @DealerCode varchar(5), @RepCode varchar(5),
            @AccountStatus char(1) = 'A', @StartDate varchar(10) = '', @EndDate varchar(10) = '',
            @AccountType char(2), @RecipientCode char(1) = '1',
            @AccountDesignation char(1) = '', @DealerAcctID varchar(20) = '',
            @IntCode varchar(5) = '', @IntAcctID varchar(15) = '',
            @GroupFlag char(1) = '', @GroupAcctID varchar(15) = '',
            @bLockedIn tinyint = 0, @LockedInProv char(2) = '', @JointType char(1) = '', 
			@JointSignatureOpt char(1) = '', @RDSPRel char(2) = '', 
			@bSpousal tinyint = 0,@bInTrust tinyint = 0,
			@CurrencyCode char(2) = '00', @PortfolioModel varchar(15) = '', @Description varchar(80) = '',
			@iTrnsfFeeRebateApplied tinyint = 0, @iFee4Service tinyint = 0

			)
-- WITH ENCRYPTION**
AS
BEGIN
SET NOCOUNT ON;
-- 3: rep not found
-- 9: iPlanID not match, exists

DECLARE @iRet int, @iExist int, @iRepID int, @DSID int, @iAAModelID int = 0, @dtToday datetime;
DECLARE @dtStart datetime, @dtEnd datetime, @iAuditTrailGroupID int = 0, @ErrorMsg varchar(200);
DECLARE @dtStartOld datetime, @dtEndOld datetime, @IntCodeOld varchar(5), @IntAcctIDOld varchar(15), @DealerAcctIDOld varchar(15),
	@bModified tinyint = 0;

IF(@AccountDesignation = '1') SET @IntCode = '';
IF(@AccountDesignation = '3' AND @DSID = 1912 AND @IntCode = '') SET @IntCode = 'AGRA';

SELECT @DSID = ID FROM UB_Dealership WITH (NOLOCK);
IF(@AccountDesignation = '2')
BEGIN
	IF(@DSID = 1911)
		SET @IntCode = 'MWCN';
	ELSE IF(@DSID = 2262)
		SET @IntCode = 'PSC';
END

SET @iAuditTrailGroupID = 0;
SET @dtToday = GETDATE();
SELECT @iRepID = ID FROM UB_Rep WITH (NOLOCK) WHERE DealerCode = @DealerCode AND RepCode = @RepCode;
IF(@iRepID is null OR @iRepID = 0)
BEGIN
	SET @iRet = 3;
	SET @ErrorMsg = 'Plan ID: ' + @DealerAcctID + '; Cannot find rep: ' +  @DealerCode + '-' + @RepCode;
	GOTO leave;
END
SET @iRet = 0;
SET @dtStart = dbo.FSUBDate(@StartDate);
SET @dtEnd = dbo.FSUBDate(@EndDate);
IF(@AccountStatus NOT IN ('A', 'T', 'P') ) SET @AccountStatus = 'A';
IF(@AccountStatus = 'A')
	SET @dtEnd = null;
IF(@AccountDesignation NOT IN ('1', '2', '3')) SET @AccountDesignation = '3';
IF(@IntCode = '' AND @AccountDesignation = '3') SET @IntCode = 'AGRA';
IF(@RecipientCode = '') SET @RecipientCode = '1';
IF(@AccountType NOT IN ('02', '04')) SET @bSpousal = 0;
IF(@AccountType <> '01') SET @bIntrust = 0;  
IF(@RecipientCode = '1') SET @JointType = '';
-- V36: Quebec Joint accounts must use Survivor Type = 'T' (Tenants in Common)
IF(@RecipientCode = '2')
BEGIN
	DECLARE @ClientTaxCode char(2);
	SELECT @ClientTaxCode = TaxCode FROM UB_Client WITH (NOLOCK) WHERE ID = @iClientID;
	IF(@ClientTaxCode = 'QC')
		SET @JointType = 'T';
END

SELECT @DSID = ID FROM UB_Dealership WITH (NOLOCK);
IF(@iPlanID is not null AND @iPlanID > 0)
BEGIN
	-- check if the Plan ID is of the same client
	SET @iExist = 0;
	SELECT @iExist = Count(*) FROM UB_CustomerPlan WITH (NOLOCK) WHERE iClientID = @iClientID AND iPlanID = @iPlanID;
	IF(@iExist is null OR @iExist = 0)
	BEGIN
		SET @iRet = 9;
		SET @ErrorMsg = 'Cannot duplicate plan SystemID: ' +  CONVERT(varchar, @iPlanID);
		GOTO leave;
	END
END
--- might change for other dealers
IF(@DealerCode <> '7908' AND @IntCode NOT IN ('AGRP', 'AGRQ'))
	SET @PortfolioModel = '';

IF(@PortfolioModel <> '')
BEGIN
	SELECT @iAAModelID = ID FROM UB_AssetAllocationFolder WITH (NOLOCK) WHERE Code = @PortfolioModel;
	IF(@iAAModelID is null) SET @iAAModelID = 0;
END
---
IF(@iPlanID is null OR @iPlanID = 0)
BEGIN
	---- client name, check t=for plan type + dealer account id
	IF(@AccountDesignation = '1')
	BEGIN
		SELECT @iPlanID = T.iPlanID FROM
			(SELECT CP.iPlanID , ROW_NUMBER() OVER (ORDER BY P.AccountStatus) AS iIndex 
			FROM UB_CustomerPlan CP WITH (NOLOCK) INNER JOIN UB_Plan P WITH (NOLOCK) ON (P.ID = CP.iPlanID)
				WHERE CP.iClientID = @iClientID AND P.AccountType = @AccountType AND P.AccountDesignation = @AccountDesignation
					AND P.DealerAccountID = @DealerAcctID) T WHERE T.iIndex = 1;
	END
	ELSE
	BEGIN
		SELECT @iPlanID = T.iPlanID FROM
			(SELECT CP.iPlanID , ROW_NUMBER() OVER (ORDER BY P.AccountStatus) AS iIndex 
			FROM UB_CustomerPlan CP WITH (NOLOCK) INNER JOIN UB_Plan P WITH (NOLOCK) ON (P.ID = CP.iPlanID)
				WHERE CP.iClientID = @iClientID AND P.AccountType = @AccountType AND P.AccountDesignation = @AccountDesignation
					AND P.ThirdPartyCode = @IntCode AND P.ThirdPartyAccount = @IntAcctID) T WHERE T.iIndex = 1;
	END
END

IF(@iPlanID is not null AND @iPlanID > 0)
BEGIN
	SELECT @dtStartOld = dtStartDate, @IntCodeOld = ThirdPartyCode, @IntAcctIDOld = ThirdPartyAccount ,
			@DealerAcctIDOld = DealerAccountID
		FROM UB_Plan WITH (NOLOCK) WHERE ID = @iPlanID;
	IF(@StartDate = '')
		SELECT @dtStart = @dtStartOld;
	IF(@DealerAcctID = '') SET @DealerAcctID = @DealerAcctIDOld;
	IF(@IntCode = '') SET @IntCode = @IntCodeOld;
	IF(@IntAcctID = '') SET @IntAcctID = @IntAcctIDOld;
	IF(@AccountDesignation = '1') 
	BEGIN
		SET @IntAcctID = '';
		SET @IntCode = '';
	END
	UPDATE UB_Plan SET [DealerAccountID] = @DealerAcctID, [AccountStatus] = @AccountStatus, [AccountType] = @AccountType,
		[AccountDesignation] = @AccountDesignation,	[RecipientCode] = @RecipientCode, 
		[iSpousal] = @bSpousal,[GroupFlag] = @GroupFlag, [GroupAccountID] = @GroupAcctID,
		[iLockedIn] = @bLockedIn, [LockedInProv] = @LockedInProv, [iInTrust] = @bInTrust,
		[dtStartDate] = @dtStart, [dtEndDate] = @dtEnd, 
		[iRepID] = @iRepID, [DealerCode] = @DealerCode,[SaleRepCode] = @RepCode, 
		[ThirdPartyCode] = @IntCode, [ThirdPartyAccount] = @IntAcctID,
		JointType = @JointType, JointSignatureOpt = @JointSignatureOpt, RDSPRel = @RDSPRel, Currency = @CurrencyCode,
		[dtLastModified] = @dtToday, [iLastModifiedUserID] = @iUserID , [Description] = @Description,
		iTrnsfFeeRebateApplied = @iTrnsfFeeRebateApplied, iFee4Service = @iFee4Service
	WHERE ID = @iPlanID;
	SET @bModified = 1;
END
ELSE
BEGIN
	IF(@AccountDesignation = '1') 
	BEGIN
		SET @IntAcctID = '';
		SET @IntCode = '';
	END
	----
	DECLARE @bRESPSiblingFlag int = 0;

	IF(@AccountType NOT IN ('05', '06') AND  (@AccountDesignation = '2'  OR (@AccountDesignation = '3' AND @DSID <> 1912) ) )
		SET @bRESPSiblingFlag = 1;

	INSERT INTO UB_Plan(DSID, iClientID,
			[DealerAccountID], [AccountStatus], [AccountType],
			[AccountDesignation], [RecipientCode], 
			[iSpousal],[GroupFlag], [GroupAccountID],
			[iLockedIn], [LockedInProv], [iInTrust],
			[dtStartDate], [dtEndDate], 
			[iRepID], [DealerCode],[SaleRepCode], 
			[ThirdPartyCode], [ThirdPartyAccount],
			JointType, JointSignatureOpt, RDSPRel, Currency,
			[dtCreated], [iCreatedUserID],[dtLastModified], [iLastModifiedUserID] , [Description],
			iTrnsfFeeRebateApplied, iFee4Service, bRESPSiblingOnly
	) VALUES(@DSID, @iClientID, @DealerAcctID, @AccountStatus, @AccountType,
			@AccountDesignation,@RecipientCode, @bSpousal, @GroupFlag, @GroupAcctID,
			@bLockedIn, @LockedInProv, @bInTrust, @dtStart, @dtEnd, 
			@iRepID, @DealerCode, @RepCode, @IntCode, @IntAcctID,
			@JointType, @JointSignatureOpt, @RDSPRel, @CurrencyCode,
			@dtToday, @iUserID, @dtToday, @iUserID, @Description, @iTrnsfFeeRebateApplied, @iFee4Service, @bRESPSiblingFlag);
	SET @iPlanID = SCOPE_IDENTITY();
	IF(@DealerAcctID is null OR @DealerAcctID = '')
	BEGIN
		EXEC [dbo].[UBGeneratePlanIDX] @DSID , @iPlanID, @AccountType, @AccountDesignation, @RecipientCode, @GroupFlag, @bLockedIn, @IntCode, @DealerCode, @DealerAcctID OUTPUT;
		-- it could be that the trigger already added the Dealer Account ID
		IF( @IntAcctID = '' AND ( @AccountDesignation = '2' OR (@AccountDesignation = '3' AND @DSID IN (1001, 1912) ) ) )
			SET @IntAcctID = @DealerAcctID;
		IF(@DealerAcctID is not null AND @DealerAcctID <> '')
		BEGIN
			UPDATE UB_Plan SET DealerAccountID = @DealerAcctID, ThirdPartyAccount = @IntAcctID WHERE ID = @iPlanID;
		END
	END
	ELSE IF( @IntAcctID = '' AND ( @AccountDesignation = '2' OR (@AccountDesignation = '3' AND @DSID IN (1001, 1912) ) ) )
	BEGIN
		-- it should not get into this routine
		EXEC [dbo].[UBGeneratePlanIDX] @DSID , @iPlanID, @AccountType, @AccountDesignation, @RecipientCode, @GroupFlag, @bLockedIn, @IntCode, @DealerCode, @IntAcctID OUTPUT;
		-- it could be that the trigger already added the Dealer Account ID
		IF(@IntAcctID is not null AND @IntAcctID <> '')
		BEGIN
			UPDATE UB_Plan SET ThirdPartyAccount = @IntAcctID WHERE ID = @iPlanID;
		END
	END
	INSERT INTO UB_CustomerPlan (iClientID, iPlanID, bPrimary, [Status], dtCreated, dtLastModified, iCreatedUserID, iLastModifiedUserID) 
			 VALUES (@iClientID, @iPlanID, 1, @AccountStatus, @dtToday, @dtToday, @iUserID, @iUserID );
END
-- always check for cash account
IF(@iPlanID > 0)
BEGIN
	EXEC [dbo].[UBCashAccountVerifyNominee] @iPlanID, @AccountDesignation, @IntCode, @DealerAcctID, @IntAcctID, @DSID, @iUserID, @CurrencyCode;

	IF(@iAAModelID is not null AND @iAAModelID > 0)
		EXEC [dbo].[UBPlanAAUpdate]	@iUserID, @iPlanID, @iAAModelID, 0, @DSID;
	--------------- audit trail UB_Plan table ------------------------
	EXEC [dbo].[UBAuditTrailGroupAdd] @iUserID, @iAuditTrailGroupID OUTPUT, @bModified, 'UB_Plan', @iPlanID, 0, @iPlanID;

	EXEC [dbo].[UBAuditTrailAddByName5] @iUserID, @iPlanID, @iPlanID, @iAuditTrailGroupID OUTPUT, 'UB_Plan', 
		'DealerAccountID', @DealerAcctID, null, 'AccountStatus', @AccountStatus, null, 'AccountType', @AccountType, null, 
		'AccountDesignation', @AccountDesignation, null, 'RecipientCode', @RecipientCode, null;

	EXEC [dbo].[UBAuditTrailAddByName5] @iUserID, @iPlanID, @iPlanID, @iAuditTrailGroupID OUTPUT, 'UB_Plan', 
		'GroupFlag', @GroupFlag, null, 'GroupAccountID', @GroupAcctID, null, 'LockedInProv', @LockedInProv, null, 
		'DealerCode', @DealerCode, null, 'SaleRepCode', @RepCode, null;

	EXEC [dbo].[UBAuditTrailAddByName5] @iUserID, @iPlanID, @iPlanID, @iAuditTrailGroupID OUTPUT, 'UB_Plan', 
		'ThirdPartyCode', @IntCode, null, 'ThirdPartyAccount', @IntAcctID, null,
		'JointType', @JointType, null, 'JointSignatureOpt', @JointSignatureOpt, null,
		'RDSPRel', @RDSPRel, null;

	EXEC [dbo].[UBAuditTrailAddByName5] @iUserID, @iPlanID, @iPlanID, @iAuditTrailGroupID OUTPUT, 'UB_Plan', 
		'Currency', @CurrencyCode, null;

	EXEC [dbo].[UBAuditTrailAddByNameInt5] @iUserID, @iPlanID, @iPlanID, @iAuditTrailGroupID OUTPUT, 'UB_Plan', 
		'iSpousal', @bSpousal, null, 'iLockedIn', @bLockedIn, null, 'iInTrust', @bInTrust, null,'iFee4Service', @iFee4Service, null;

	EXEC [dbo].[UBAuditTrailAddByNameDate5] @iUserID, @iPlanID, @iPlanID, @iAuditTrailGroupID OUTPUT, 'UB_Plan', 
		'dtStartDate', @dtStart, null, 'dtEndDate', @dtEnd, null; 
END
SET @iRet = 0;
leave:
	SELECT @iRet AS iRet, @iPlanID AS iPlanID, @iAuditTrailGroupID AS iGroupID, @ErrorMsg AS ErrorMsg;
END
