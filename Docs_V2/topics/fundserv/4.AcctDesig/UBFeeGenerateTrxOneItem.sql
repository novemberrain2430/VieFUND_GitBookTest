GO
CREATE PROCEDURE [dbo].[UBFeeGenerateTrxOneItem](@iFeeID int, @iUserID int = 0, 
								@iTrxType int = null, @bRealTime int, @dtTrade datetime,
								@iStatus int OUTPUT, @iFeeType int = 0)
-- WITH ENCRYPTION**
AS
BEGIN
SET NOCOUNT ON;
DECLARE @iPlanID int, @iPosID int, @mFee money, @mTax money, @iProcessingID int, @iTrustBankID int,
		@mTrxAmount money, @AccountDesignation char(1), @IntCode varchar(5),@IntAccountID varchar(15), @DealerAccountID varchar(15),
		@iRepID int, @DealerCode varchar(6),@RepCode varchar(6),  @iFundAccountID int, @MgmtCode varchar(6), 
		@iTrustTrxID int, @dtToday datetime, @dtTodayShort datetime, @SourceCode char(1);
DECLARE @DSID int, @Lg int, @iOptions int, @ActionCode varchar(3), @iClientID int;
DECLARE @Type varchar(1), @TypeDetail varchar(1) = '', @AmountType varchar(1), @ContrWdrCode char(1);
DECLARE @SettlementInd char(1), @SettlementSource char(1), @SettlementMethod char(1);
DECLARE @bTrust tinyint, @iOrderID int, @iTrxID int ;
DECLARE @iPMTInfo tinyint, @iAccountType tinyint,@bNominee tinyint,
	@iBankAccountID int, @BankHolderName varchar(80),  @BankAccountType char(1),  @BankCode varchar(5),
	@BankTransitNumber varchar(20), @BankAccountNumber varchar(40), @CurrencyCode varchar(2), @CurrencyCode2 varchar(2);
DECLARE @iCashTrxType int, @iCashTrxStatus int, @iCashAccountTrxID int, @iCashAccountID int, @ProdEventInd varchar(2), @iPlanFeeID int;
DECLARE @iPymtOpt tinyint, @iCashTrxID int, @iTrustType int, @iTrustTaxID int; 
DECLARE  @mFeeCash money, @mTaxCash money;
DECLARE @mFeeFund money, @mTaxFund money, @StartDate varchar(10) = '', @EndDate varchar(10)= '';
DECLARE @ClientFirstName varchar(80) = '',	@ClientLastName varchar(80) = '', @ClientSIN varchar(15);
DECLARE @Description varchar(80), @FeeDescription varchar(80) = '', @iCommRet int = 0, @Description2 varchar(200) = '';		


SELECT @mFeeCash = 0, @mTaxCash = 0, @mFeeFund = 0, @mTaxFund =0;
SET @iCashAccountTrxID = 0;
SET @iCashTrxType = 22;
SET @iCashTrxStatus = 6;
SET @dtToday = GETDATE();
SET @dtTodayShort = dbo.GetDateNoTime(@dtToday);
SET @ProdEventInd = '';
SET @iStatus = 0;
SET @iAccountType = 0;
SET @CurrencyCode = '00'; -- CAD
SET @iTrxID = 0;
SET @SourceCode = 'F';
--- needs to have currency on the Fee
SELECT @iPlanID = iPlanID, @iPosID = iPosID, @mTrxAmount = mFeeTotal, @iProcessingID = iFeeProcessingID,
		@iAccountType = isnull(iAccountType, 0), @iTrxID = isnull(iTrxID, 0), @iPymtOpt = isnull(iPymtOpt, 2),
		@iBankAccountID = isnull(iBankAccountID, 0), @iStatus = isnull(iStatus, 0), @mFee = mFee, @mTax = (mFeeTotal - mFee),
		@CurrencyCode = CurrencyCode
	FROM UB_Fee WITH (NOLOCK) WHERE ID = @iFeeID;

IF(@iAccountType = 2) SET @iPosID = 0;

SET @CurrencyCode2 = @CurrencyCode;
--- banking info exist
IF(@iBankAccountID is not null AND @iBankAccountID > 0 AND (@CurrencyCode = '' OR @CurrencyCode = '00') )
BEGIN
	SELECT @CurrencyCode2 = CurrencyID FROM UB_CustomerBankAccount WITH (NOLOCK) WHERE ID = @iBankAccountID;
	IF(@CurrencyCode2 is not null AND @CurrencyCode2 IN ('00', '01') AND @CurrencyCode2 <> @CurrencyCode)
		SET @CurrencyCode = @CurrencyCode2;

END
IF(@CurrencyCode is null OR @CurrencyCode = '') SET @CurrencyCode = '00';

IF(@iPlanID is null OR @iPlanID = 0)
	RETURN;
IF(@mFee is null) SET @mFee = 0;
IF(@mTax is null) SET @mTax = 0;

IF( (@iTrxID is not null AND @iTrxID > 0) OR @iStatus >= 2)
BEGIN
-- already processed , skipp it
	RETURN;
END
IF(@iUserID = 0)
BEGIN
	SELECT @iUserID = iCreatedUserID, @iTrxType = iTrxType, @bRealTime = iRealTime, @dtTrade = dtTrade,
		@iFeeType = iFeeType, @StartDate = dbo.DateStr(dtStart, 101), @EndDate = dbo.DateStr(dtEnd, 101),
		@FeeDescription = [Description]
		FROM UB_FeeProcess WITH (NOLOCK) WHERE ID = @iProcessingID;
END
ELSE IF(@iTrxType is null OR @iTrxType = 0)
BEGIN
	SELECT @iTrxType = iTrxType, @bRealTime = iRealTime, @dtTrade = dtTrade, @iFeeType = iFeeType,
		@StartDate = dbo.DateStr(dtStart, 101), @EndDate = dbo.DateStr(dtEnd, 101),
		@FeeDescription = [Description]
		FROM UB_FeeProcess WITH (NOLOCK) WHERE ID = @iProcessingID;
END
ELSE
BEGIN
	SELECT @iFeeType = iFeeType, @StartDate = dbo.DateStr(dtStart, 101), @EndDate = dbo.DateStr(dtEnd, 101),
				@FeeDescription = [Description]
				 FROM UB_FeeProcess WITH (NOLOCK) WHERE ID = @iProcessingID;
END

IF(@dtTrade is null OR @dtTrade < @dtTodayShort) SET @dtTrade = @dtTodayShort; -- Today date
-- cannot be in the past
IF(@dtTrade < @dtTodayShort)
	RETURN;
-- cash account
IF(@iAccountType = 2)
BEGIN
	SET @iTrxType = 90; -- Fee type instead of Sell = 45 or fee redemption 90
	IF(@iFeeType = 1)
		SET @iTrxType = 90;
END
--------------------------------------------------------------------------
SET @DSID = dbo.GetDealershipID();

SELECT @iClientID = iClientID, @AccountDesignation = AccountDesignation, 
		@iRepID = iRepID, @DealerCode = DealerCode, @RepCode = SaleRepCode, @IntCode = isnull(ThirdPartyCode, ''),
		@bNominee = dbo.IsNominee(@DSID, AccountDesignation, ThirdPartyCode), @IntAccountID = isnull(ThirdPartyAccount, ''),
		@DealerAccountID = DealerAccountID, @Description = isnull(ThirdPartyCode, '') + ' ' + DealerAccountID
	FROM UB_Plan WITH (NOLOCK) WHERE ID = @iPlanID;
SET @bTrust = 0;
IF(dbo.IsNomineeDealer(@DSID) = 0)
BEGIN
	-- IF(@AccountDesignation = '1') RETURN; -- Client Account, no processing
	SET @bTrust = 0; -- Ensure trust is not used for non-nominee dealer Client Name accounts
END
ELSE
BEGIN
	SET @bTrust = 1; -- always use trust account for MON and AGORA
END
IF(@bNominee = 1) 
	SET @bTrust = 1; -- any other, must be nominee

----------------------------------------
IF(@iAccountType = 2 AND @bNominee = 0) RETURN; -- cannot generate cash trx for B2B Cash account
IF( @IntCode is null OR @IntCode = '')
BEGIN
	SET @IntCode = [dbo].[GetIntCodeDef](@DSID);
END
-----------------------------------------------------------------------------------------------
SET @iTrustBankID = 0;
IF(@bTrust = 1)
BEGIN
	SET @iTrustBankID = [dbo].[GetDealerBankAccountID](1, @DealerCode, @CurrencyCode);
	IF( (@iTrustBankID is null OR @iTrustBankID = 0) AND @AccountDesignation = '3')
		SET @iTrustBankID = [dbo].[GetDealerBankAccountID](1, @IntCode, @CurrencyCode);
	IF(@iTrustBankID is null OR @iTrustBankID = 0)
		RETURN; -- must have a trust account
END
SET @iTrustTrxID = 0;
----------- from fund -------------
DECLARE @iSourceAccountID  int, @mSourceAmount money, @iSourceID int;
-- commission payment

IF(@iPymtOpt = 3)
BEGIN
	UPDATE UB_FeeSource SET mAmount = @mTrxAmount, mFee = @mFee, mTax = @mTax	WHERE iFeeID = @iFeeID;
	GOTO PayByComm;
END
SET @iSourceID = 0;
-- source 0: fund, 1, GIC, 2, cash account 11: rep commission, 12 client bank account
SELECT @iSourceID = ID, @iSourceAccountID = iSourceAccountID, @mSourceAmount = mAmount, 
		@mFeeFund = mFee, @mTaxFund = mTax
				FROM UB_FeeSource WITH (NOLOCK) WHERE iFeeID = @iFeeID AND iSourceType = 0
					AND iSourceAccountID > 0 AND mAmount > 0; -- do not generate anything if = 0
IF(@iSourceID is null) SET @iSourceID = 0;
IF(@iSourceID = 0 AND @DealerCode = '7908' AND @iPosID > 0)
BEGIN
	SET @mSourceAmount = @mTrxAmount;
	SET @mFeeFund = @mFee;
	SET  @mTaxFund = @mTax;
	INSERT INTO UB_FeeSource(iFeeID, iSourceType, iSourceAccountID, mAmount, iTrustTrxID, mFee, mTax, iTrustFeeID, iTrustTaxID)
		VALUES(@iFeeID, 0, @iPosID, @mTrxAmount, 0, @mFee, @mTax, 0, 0);
	SET @iSourceID = SCOPE_IDENTITY();
	IF(@iSourceID is null) SET @iSourceID = 0;
END
IF(@iSourceID is not null AND @iSourceID > 0)
BEGIN
	SET @iAccountType = 0;
	-- this part will be removed
	IF(@mFeeFund is null OR @mTaxFund is null OR ROUND((@mTaxFund + @mFeeFund), 2) <> ROUND(@mSourceAmount, 2) )
	BEGIN
		IF(@mSourceAmount >= @mTax)
		BEGIN
			SET @mTaxFund = @mTax;
			SET @mFeeFund = @mSourceAmount - @mTax;
		END
		ELSE
			SET @mTaxFund = @mSourceAmount;
	END
	----------------------------
	SET @MgmtCode = 'PL' + RTRIM(CONVERT(varchar(10), @iPlanID));
	IF(@IntAccountID is null OR @IntAccountID = '') SET @IntAccountID = @DealerAccountID;
	SELECT @iPlanFeeID = iPlanFeeID FROM UB_FeeDetail WITH (NOLOCK) WHERE iFeeID = @iFeeID;
-- generate trx: 0: MF, 1 GIC, 2 Cash
	SET @iOrderID = 0;
	SET @Lg = 0;
	SET @iOptions = 1; -- force to 
	SET @ActionCode = 'NEW';
	SET @ContrWdrCode = '';
	SET @SettlementInd = 'N'; --- change to Net sell Aug03, 2022
	SET @SettlementSource = 'D';
	SET @SettlementMethod = '1'; -- N$M
	IF(@AccountDesignation = '3')
	BEGIN
		SET @SettlementSource = 'I';
	END

	SELECT  @iPMTInfo = 0, 
		@iBankAccountID = 0, @BankHolderName = '',  @BankAccountType = '',  @BankCode = '',
		@BankTransitNumber = '', @BankAccountNumber = '', @CurrencyCode = '00';

	IF(@iTrxType = 20)
	BEGIN
		SELECT @Type = '4', @TypeDetail = '', @AmountType = 'D', @ProdEventInd = '';
	END
	ELSE IF(@iTrxType = 90)
	BEGIN
		SELECT @Type = '4', @TypeDetail = '', @AmountType = 'D', @ProdEventInd = 'O';
	END
	ELSE
	BEGIN
		SELECT @Type = '6', @TypeDetail = '', @AmountType = 'D', @ProdEventInd = '';
	END
	-- check the MKV to make sure enough fund
	SET @MgmtCode = '';
	SELECT @iFundAccountID = iFundAccountID, @MgmtCode = MgmtCode FROM UB_FundAccountPosition WITH (NOLOCK) WHERE ID = @iPosID;
	-- forcing
	IF(@MgmtCode IN ( 'IGI', 'LYZ') )
	BEGIN
		SET @Type = '6';
		SET @TypeDetail = '';
		SET @ProdEventInd = '';
	END
	-- SELECT 'UBFundTrxSellShort', @bTrust, @iTrustBankID;
	EXEC [dbo].[UBFundTrxSellShort] @DSID, @iUserID, @Lg, @iOptions, @ActionCode,
		@iClientID, @iPlanID, @iPosID,  @Type, @TypeDetail, @AmountType, 
		@mSourceAmount, 0, @ContrWdrCode, @SettlementInd , '', @SettlementSource,
		@SettlementMethod, 0,
		-- AOT
		0, null, 0, '', 0,
		-- Trust Account & Application
		@bTrust, @iTrustBankID, 0, 
		-- Notes
		'',
		-- banking info: take a copy from bank setup in plan level
		@iPMTInfo, 
		@iBankAccountID, @BankHolderName,  @BankAccountType,  @BankCode,
		@BankTransitNumber, @BankAccountNumber, @CurrencyCode,	
		-- cheque info 
		'', '', '', '',
		'', '', '', '',
		'',
		-----
		@bRealTime, 0, 1 ,
		-----
		'',
		@iOrderID OUTPUT, @iTrxID OUTPUT, 0, @ProdEventInd, @dtTrade, @SourceCode;
	IF(@iTrxID is not null AND @iTrxID > 0)
	BEGIN
		SET @iTrustTrxID = 0;
		SELECT @iTrustTrxID = T.ID FROM
			(SELECT Trx.ID, ROW_NUMBER() OVER (ORDER BY [ID]) AS iIndex 
			FROM UB_TrustTrx Trx WITH (NOLOCK) WHERE iTrxID = @iTrxID) T WHERE T.iIndex = 1;

		IF(@iTrustTrxID is null) SET @iTrustTrxID = 0;
		UPDATE UB_FeeSource SET iTrxID = @iTrxID, iTrustTrxID = @iTrustTrxID, mFee = @mFeeFund, mTax = @mTaxFund,
					iTrustFeeID = 0, iTrustTaxID = 0   
					WHERE ID = @iSourceID;
		UPDATE UB_Fee SET iTrxID = @iTrxID, iStatus = 2, iTrustTrxID = @iTrustTrxID  WHERE ID = @iFeeID;
		UPDATE UB_TrustTrx SET bUsed = 1, mAmountUsed = mAmount WHERE ID = @iTrustTrxID; -- prevent other from using it
	END
END
--- check for cash -- just input for reserve
SET @iSourceID = 0;
SET @mSourceAmount = 0;
-- source 0: fund, 1, GIC, 2, cash account 11: rep commission, 12 client bank account
SELECT @iSourceID = ID, @iSourceAccountID = iSourceAccountID, @mSourceAmount = mAmount , @mFeeCash = mFee, @mTaxCash = mTax
				FROM UB_FeeSource WITH (NOLOCK) WHERE iFeeID = @iFeeID AND iSourceType = 2
					AND iSourceAccountID > 0 AND mAmount > 0; 
IF(@iSourceID is not null AND @iSourceID > 0)
BEGIN
	-- this part will be removed as it is calculated during processing
	IF(@mFeeCash is null OR @mTaxCash is null OR ROUND((@mTaxCash + @mFeeCash), 2) <> ROUND(@mSourceAmount, 2) )
	BEGIN
		SET @mTaxCash = @mTax - @mTaxFund;
		SET @mFeeCash = @mFee - @mFeeFund;
	END
	----------------------------
	-- if from cash, generate the cash redemption
	-- trust account: 5 Fee, 9 trustee or 24 portfolio fee type, the full amount and we will deal with the tax afterward 
	-- when generating commission
	IF(@iFeeType = 1) 
		SET @iTrustType = 24;
	ELSE IF(@iFeeType = 2)
		SET @iTrustType = 5; -- fee: advisor fee
	ELSE IF(@iFeeType = 3)
		SET @iTrustType = 9;
	ELSE 
		SET @iTrustType = 5;
-----
	SET @iTrustTrxID = 0;
	IF(@mFeeCash > 0)
	BEGIN
		INSERT INTO [dbo].[UB_SysID0] SELECT 1 WHERE 1 = 0;
		INSERT INTO UB_TrustTrx ([iClientID],[iPlanID], [iAccountID], [iAccountPosID], [iTrxID],[iOrderID],
			[iType], [iStatus], [iTrustDepositID],[CurrencyCode], [iBankAccID],[mAmount],[mAmountCredit],
			[mAmountDebit],[dtEffective],[dtSettlement],[iSettledUserID],
			[mAmountERR],[mAmountERV],[mAmountEER],[mAmountEEV],[mAmountUsed],[mAmountLeft],[bUsed],[bPlanSpecific],[bRRSP60],
			[Notes],[iCreatedUserID],[iLastModifiedUserID],[dtCreated],[dtLastModified], MgmtCode,
			iRepID, DealerCode, RepCode, mTax, iTrustIDLink,
			ContrWdrCode, mTaxP, iTrustIDLinkP, iType2, mGAmount, iPYMTMethod, SourceCode) 
		VALUES (@iClientID, @iPlanID, 0, 0, 0, 0,
				@iTrustType, 1, 0, @CurrencyCode, @iTrustBankID,
				-@mFeeCash, 0, @mFeeCash, @dtTodayShort, @dtTodayShort, 0, 
				0, 0, 0, 0, 0, 0, 0, 1, 0, @FeeDescription, @iUserID, @iUserID, @dtToday, @dtToday, 
				@DealerCode,
				@iRepID, @DealerCode, @RepCode, 0, 0, 0, 0, 0, 0, -@mFeeCash, 0, @SourceCode);
		SET @iTrustTrxID = SCOPE_IDENTITY();
		SET @mFeeCash = -@mFeeCash;
		EXEC [dbo].[UBTrustTrxDetailNew] 0, @iTrustTrxID, @mFeeCash, 0, @iTrustBankID, @SourceCode;
		SELECT TOP 1 @iCashAccountTrxID = ID FROm UB_CashTrx WITH (NOLOCK) WHERE iTrustTrxID = @iTrustTrxID;
	END
	SET @iTrustTaxID = 0;
	IF(@mTaxCash > 0)
	BEGIN
		SET @iTrustType = 11; -- tax
		INSERT INTO [dbo].[UB_SysID0] SELECT 1 WHERE 1 = 0;
		INSERT INTO UB_TrustTrx ([iClientID],[iPlanID], [iAccountID], [iAccountPosID], [iTrxID],[iOrderID],
			[iType], [iStatus], [iTrustDepositID],[CurrencyCode], [iBankAccID],[mAmount],[mAmountCredit],
			[mAmountDebit],[dtEffective],[dtSettlement],[iSettledUserID],
			[mAmountERR],[mAmountERV],[mAmountEER],[mAmountEEV],[mAmountUsed],[mAmountLeft],[bUsed],[bPlanSpecific],[bRRSP60],
			[Notes],[iCreatedUserID],[iLastModifiedUserID],[dtCreated],[dtLastModified], MgmtCode,
			iRepID, DealerCode, RepCode, mTax, iTrustIDLink,
			ContrWdrCode, mTaxP, iTrustIDLinkP, iType2, mGAmount, iPYMTMethod, SourceCode) 
		VALUES (@iClientID, @iPlanID, 0, 0, 0, 0,
				@iTrustType, 1, 0, @CurrencyCode, @iTrustBankID,
				-@mTaxCash, 0, @mTaxCash, @dtTodayShort, @dtTodayShort, 0, 
				0, 0, 0, 0, 0, 0, 0, 1, 0, @FeeDescription, @iUserID, @iUserID, @dtToday, @dtToday, 
				@DealerCode,
				@iRepID, @DealerCode, @RepCode, 0, @iTrustTrxID, 0, 0, 0, 0, -@mTaxCash, 0, @SourceCode);
		SET @iTrustTaxID = SCOPE_IDENTITY();
		SET @mTaxCash = -@mTaxCash;
		EXEC [dbo].[UBTrustTrxDetailNew] 0, @iTrustTaxID, @mTaxCash, 0, @iTrustBankID, @SourceCode;
		UPDATE UB_TrustTrx SET iTrustIDLink = @iTrustTaxID WHERE ID = @iTrustTrxID;
	END
	-- update only if cash only
	IF(@iCashAccountTrxID is null) SET @iCashAccountTrxID = 0;
	IF(@iAccountType = 2)
		UPDATE UB_Fee SET iTrxID = @iCashAccountTrxID, iStatus = 2, iTrustTrxID = @iTrustTrxID  WHERE ID = @iFeeID;
	UPDATE UB_FeeSource SET iTrxID = @iCashAccountTrxID, iTrustTrxID = @iTrustTrxID, 
				mFee = -@mFeeCash, mTax = -@mTaxCash, iTrustFeeID = @iTrustTrxID, iTrustTaxID = @iTrustTaxID  WHERE ID = @iSourceID;
END
PayByComm:
SET @iSourceID = 0;
-- source 0: fund, 1, GIC, 2, cash account 11: rep commission, 12 client bank account
--- the Fee amount and tax amount equal to what is on the 
SELECT @iSourceID = ID, @iSourceAccountID = iSourceAccountID, @mSourceAmount = mAmount 
				FROM UB_FeeSource WITH (NOLOCK) WHERE iFeeID = @iFeeID AND iSourceType = 11
					AND mAmount > 0; 

IF(@iSourceID is not null AND @iSourceID > 0)
BEGIN
	DECLARE @iMemberID int, @iCategoryID int, @TradeDate varchar(10), @mCommAmount money;
	SET @iCategoryID = 0;
	SET @TradeDate = dbo.DateStr(@dtTrade, 101);
	SELECT @iMemberID = iMemberID FROM UB_Rep WITH (NOLOCK) WHERE ID = @iRepID;
	SET @iCategoryID = dbo.GetCommPayFeeCategoryID(@DSID);
	-- addto trust account a deposit from client
	SET @MgmtCode = 'PL' + RTRIM(CONVERT(varchar(10), @iPlanID));
	IF(@IntAccountID is null OR @IntAccountID = '') SET @IntAccountID = @DealerAccountID;
	 SET @mCommAmount = -@mSourceAmount;
	-- add exepense, for Agora add to the gross commission as Agora pays to the dealer and need to subtract the amount from source
	IF(@DSID = 1912)
	BEGIN
		SELECT @ClientFirstName = FirstName, @ClientLastName = LastName, @ClientSIN = isnull(SIN_BN, '') 
				FROM UB_Customer WITH (NOLOCK) WHERE ID = @iClientID;
		SET @Description2 = 'To pay client fee, ' + @FeeDescription;
		EXEC [dbo].[UBCommissionAdd_Internal] @DSID, @iUserID, @iTrxID OUTPUT,
					@iRepID, 'M', 2, 'D', @StartDate, @EndDate,
					@TradeDate, '00', '',
					'', @mCommAmount,
					--- trx related ---
					'', 0, @ClientFirstName,@ClientLastName, @AccountDesignation, @DealerAccountID,
					@IntCode, @IntAccountID, '', @TradeDate, 0,
					0, 0, 0, '', '',  'D',
					'G', @ClientSIN, '',
					0, 0, 0, 
					0,  0, 1, 0,
					0, 0, 0, 2,
					@iClientID, @iPlanID, 0, @Description2,
					0;
		IF(@iTrxID is null OR @iTrxID = 0)
			RETURN;
	END
	ELSE
	BEGIN
		SET @iTrxID = 0;
	END
	-- add to trust account of the client
	SET @iTrustTrxID = 0;
	SET @Description2 = 'Paid by Rep commission for fee, ' + @FeeDescription;
	INSERT INTO [dbo].[UB_SysID0] SELECT 1 WHERE 1 = 0;
	INSERT INTO UB_TrustTrx ([iClientID],[iPlanID], [iAccountID], [iAccountPosID], [iTrxID],[iOrderID],
			[iType], [iStatus], [iTrustDepositID],[CurrencyCode], [iBankAccID],[mAmount],[mAmountCredit],
			[mAmountDebit],[dtEffective],[dtSettlement],[iSettledUserID],
			[mAmountERR],[mAmountERV],[mAmountEER],[mAmountEEV],[mAmountUsed],[mAmountLeft],[bUsed],[bPlanSpecific],[bRRSP60],
			[Notes],[iCreatedUserID],[iLastModifiedUserID],[dtCreated],[dtLastModified], MgmtCode,
			iRepID, DealerCode, RepCode, mTax, iTrustIDLink,mTaxP, iTrustIDLinkP,
			ContrWdrCode, SourceCode) 
		VALUES (@iClientID, @iPlanID, 0, 0, 0, 0,
				15, 1, 0, @CurrencyCode, @iTrustBankID, @mSourceAmount, 0, 
				@mSourceAmount, @dtTrade, @dtTrade, 0, 
				0, 0, 0, 0, 0, 0, 0, 1, 0, 
				@Description2, @iUserID, @iUserID, @dtToday, @dtToday, @MgmtCode,
				@iRepID, @DealerCode, @RepCode, 0, 0, 0, 0, '', @SourceCode);
	SET @iTrustTrxID = SCOPE_IDENTITY();
	IF(@iTrustTrxID is not null AND @iTrustTrxID > 0)
	BEGIN
		IF(@DSID <> 1912)
		BEGIN
			EXEC [dbo].[UBCommissionExpenseAdd4Rebate] @DSID, @iUserID, @iTrustTrxID, @iTrxID OUTPUT,
					 @iRepID, @DealerCode, @RepCode, @CurrencyCode, @dtTrade, @mSourceAmount, @Description,	0;
		END
	END

	UPDATE UB_Fee SET iStatus = 2, iTrustTrxID = @iTrustTrxID, iTrxID = @iTrxID, iAccountType = 11  WHERE ID = @iFeeID;
	SELECT TOP 1 @iCashAccountTrxID = ID FROm UB_CashTrx WITH (NOLOCK) WHERE iTrustTrxID = @iTrustTrxID;
	IF(@iCashAccountTrxID is null) SET @iCashAccountTrxID = 0;
	UPDATE UB_FeeSource SET iTrxID = @iCashAccountTrxID, iTrustTrxID = @iTrustTrxID
			WHERE ID = @iSourceID;
END

SET @iSourceID = 0;
-- @iSourceAccountID is the bank account ID fof the client
-- source 0: fund, 1, GIC, 2, cash account 11: rep commission, 12 client bank account
SELECT @iSourceID = ID, @iSourceAccountID = iSourceAccountID, @mSourceAmount = mAmount 
				FROM UB_FeeSource WITH (NOLOCK) WHERE iFeeID = @iFeeID AND iSourceType = 12
					AND iSourceAccountID > 0 AND mAmount > 0; 

IF(@iSourceID is not null AND @iSourceID > 0)
BEGIN
	DECLARE @iEFTID int ;
	IF(dbo.IsClientBankAccountOK(@iBankAccountID) = 0)
	BEGIN
		SET @iStatus = 0;
		RETURN;
	END
	-- addto trust account a deposit from client
	INSERT INTO [dbo].[UB_SysID0] SELECT 1 WHERE 1 = 0;
	INSERT INTO UB_TrustTrx ([iClientID],[iPlanID], [iAccountID], [iAccountPosID], [iTrxID],[iOrderID],
			[iType], [iStatus], [iTrustDepositID],[CurrencyCode], [iBankAccID],[mAmount],[mAmountCredit],
			[mAmountDebit],[dtEffective],[dtSettlement],[iSettledUserID],
			[mAmountERR],[mAmountERV],[mAmountEER],[mAmountEEV],[mAmountUsed],[mAmountLeft],[bUsed],[bPlanSpecific],[bRRSP60],
			[Notes],[iCreatedUserID],[iLastModifiedUserID],[dtCreated],[dtLastModified], MgmtCode,
			iRepID, DealerCode, RepCode, mTax, iTrustIDLink,mTaxP, iTrustIDLinkP,
			ContrWdrCode, SourceCode) 
		VALUES (@iClientID, @iPlanID, 0, 0, 0, 0,
				1, 1, 0, @CurrencyCode, @iTrustBankID, @mTrxAmount, 0, 
				@mSourceAmount, @dtTrade, @dtTrade, 0, 
				0, 0, 0, 0, 0, 0, 0, 1, 0, 
				'Deposit for fee payment', @iUserID, @iUserID, @dtToday, @dtToday, @MgmtCode,
				@iRepID, @DealerCode, @RepCode, 0, 0, 0, 0, '', @SourceCode);
	SET @iTrustTrxID = SCOPE_IDENTITY();
	IF(@iTrustTrxID is not null AND @iTrustTrxID > 0)
	BEGIN
		SET @BankCode = '';
		SELECT @BankCode = BankCode, @BankTransitNumber = TransitNumber, @BankAccountNumber = AccountNumber, 
				@BankHolderName = RTRIM(LTRIM(FirstName + ' ' + LastName))	
			FROM UB_CustomerBankAccount WITH (NOLOCK) WHERE ID = @iBankAccountID;
		
		EXEC [dbo].[UBEFTItemAdd] @DSID, @iUserID, 10, @iTrustTrxID,
				@mSourceAmount, @dtTrade, @iTrustBankID, @iBankAccountID, @iEFTID OUTPUT ,
					@BankCode, @BankTransitNumber, @BankAccountNumber, @BankHolderName, @SourceCode;
		UPDATE UB_TrustTrx SET iEFTID = @iEFTID WHERE ID = @iTrustTrxID;
		UPDATE UB_Fee SET iTrxID = @iEFTID, iStatus = 2, iTrustTrxID = @iTrustTrxID  WHERE ID = @iFeeID;
		SELECT TOP 1 @iCashAccountTrxID = ID FROm UB_CashTrx WITH (NOLOCK) WHERE iTrustTrxID = @iTrustTrxID;
		IF(@iCashAccountTrxID is null) SET @iCashAccountTrxID = 0;
		UPDATE UB_FeeSource SET iTrxID = @iCashAccountTrxID, iTrustTrxID = @iTrustTrxID  WHERE ID = @iSourceID;
	END
END
SET @iStatus = 1;
END






GO
