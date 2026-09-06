CREATE PROCEDURE [dbo].[UBFundTrxSell] (@DSID int, @UserID int, @Lg int, @iOptions int = 0, @ActionCode varchar(3) = 'NEW',
	@iClientID int, @iPlanID int, @iFundAccPosID int,  @Type varchar(1), @TypeDetail varchar(1) = '', @AmountType varchar(1), 
	@fAmount float, @fCLPaidCommRate float, @ContrWdrCode char(1), 
	@SettlementInd char(1), @SettlementStatus char(1),  @SettlementSource char(1),
	@SettlementMethod char(1), @bUnsolicited tinyint,
	-- AOT
	@bAOT tinyint = 0, @AOTDateStr varchar(10) = null, @bAOTOrginalOrder tinyint = 0, @AOTOrginalOrderID varchar(7) = '', @iAOTOrginalOrderID int = 0,
	-- Trust Account & Application
	@bTrust tinyint = 0, @iTrustID int = 0, @iApplicationID int = 0, 
	-- Notes
	@Notes varchar(MAX) = '',
	-- banking info: take a copy from bank setup in plan level
	@iPMTInfo tinyint = 0, 
	@iBankAccountID int = 0, @BankHolderName varchar(40) = '',  @BankAccountType char(1)='',  @BankCode varchar(5) = '',
	@BankTransitNumber varchar(20) = '', @BankAccountNumber varchar(40) = '', @CurrencyCode varchar(2) = '',	
	-- cheque info 
	@PayeeType char(1) = '', @PayeeTitle char(1) = '', @PayeeLastName varchar(80) = '', @PayeeFirstName varchar(20) = '',
	@PayeeAddress varchar(120) = '', @PayeeCity varchar(30) = '', @PayeeProvince varchar(2) = '', @PayeeCountry varchar(3) = '',
	@PayeePostalCode varchar(10) = '',
	-----
	@bRealTime tinyint = 0, @bIncludeOrderReceipt tinyint = 0, @iSequence int = 1 ,
	-----
	@bMRSConversion tinyint = 0, @iForceOpt int = 0, @fFedWHoldTaxRt float = 0, @bPaid2Client tinyint = 0,
	@ETFOrderType char(1) = '1', @ETFTimeInForce char(1) = '0',  @ETFExpiryDate varchar(10) = '',
	@mETFPriceLimit money = 0, @mETFPriceStop money = 0, @iExtraAdminFee tinyint = 0 )
-- WITH ENCRYPTION**
AS

BEGIN
SET NOCOUNT ON;
-- currency code not used
DECLARE @iMRSConversionCount int, @iOmnibusOpt tinyint, @iFundServVersion int;

DECLARE @dtToday datetime, @dtTodayShort datetime, @iRepIDPlan int, @RepCode varchar(5), @DealerCode varchar(4)
DECLARE @iCount int, @Ret int, @ID int, @iFundAccID int, @iStatus tinyint, @iActionCode tinyint, @iType smallint, 
		@ProdEventInd char(1), @iOrderType tinyint, @iOrderStatus tinyint, @OrderID varchar(7), @SourceID varchar(15),
		@MgmtCode varchar(6), @FundID varchar(6), @fUnitU float, @fUnitA float, @mPrice money, @FundAccID varchar(15),
		@mGAmount money,@mGAmountOrigin money,@mNAmount money, @fUnits float,@fUnitsOrigin float,@iProspectusInd tinyint,
		@Prov varchar(2), @CountryCode varchar(3),@OrderSource char(1),
		@PlanType varchar(2), @AccountDesignation char(1), @RecipientCode char(1),
		@iSpousal tinyint, @iSD tinyint, 
		@iFundDefID int, @ProductType char(1), @fPrice float,@bRRSPFlg tinyint,
		@iEligSell tinyint, @iEligFee tinyint, @dtPrice datetime,
		@bNotificationSell tinyint, @bElectronic tinyint, @bSelfDirected tinyint,
		@iTemp int, @fDSCRate float, @fMaxCommRate float,
		@Currency varchar(2), @fOrderAmount float, @mMinSell money, @dtAOT datetime, @iOrderID int,
		@FundAccountPosID varchar(30), @DealerAccountID varchar(15), @IntermediaryCode varchar(5), @IntermediaryAccountID varchar(15),
		@IntermediaryAccountIDLong varchar(30), @bFee tinyint, @iPlanFreezed tinyint, @bInvestedAmountExclude tinyint,
		@fAccountTotal float, @iNetwork tinyint, @bAdmin tinyint = 0;
DECLARE @iSplitBy tinyint, @mConversionTotal money, @iTrustTrxID int, @bNominee tinyint, @SourceCode char(1);
DECLARE @iOmnibusPlanID int,
		@Symbol varchar(15) = '', @Exchange varchar(6) = 'TO', @OrderSide char(1) = '2', @dtETFExpiry datetime = null;
----- check for conversion, if the box is checked, there must be some item
SET @iFundServVersion = dbo.GetFundServVersion();
SET @iMRSConversionCount = 0;
SET @iTrustTrxID = 0;
SET @SourceCode = '';
IF(@bPaid2Client = 1)
BEGIN
	SET @SourceCode = 'C';
	SET @bTrust = 1;
END
SET @bAdmin = dbo.IsMemberAdmin(@UserID);
IF(@bAdmin = 0 AND @iExtraAdminFee <> 0)
	SET @iExtraAdminFee = 0;
IF([dbo].[IsTrxExtraAdminFeeEnabled](@DSID) = 0)
	SET @iExtraAdminFee = 0;

IF(@bMRSConversion = 1)
BEGIN
	SELECT @iMRSConversionCount = Count(*) FROM VieFUNDTMP.dbo.UB_ConversionOrderTMP WITH (NOLOCK)
			WHERE iUserID = @UserID AND iFundAccountPosIDFrom = @iFundAccPosID;
	IF(@iMRSConversionCount is null OR @iMRSConversionCount = 0)
	BEGIN
		SET @bMRSConversion = 0;
	END
END
IF(@bMRSConversion = 1)
BEGIN
	-- check the split type and sum
	SELECT TOP 1 @iSplitBy = iSplitBy FROM VieFUNDTMP.dbo.UB_ConversionOrderTMP WITH (NOLOCK)
			WHERE iUserID = @UserID AND iFundAccountPosIDFrom = @iFundAccPosID;
	IF(@iSplitBy = 0 AND @AmountType <> 'D')
	BEGIN
		SET @Ret = 56;
		GOTO leave;
	END
	-- check the split type and sum
	SELECT @mConversionTotal = SUM(mAmount) FROM VieFUNDTMP.dbo.UB_ConversionOrderTMP WITH (NOLOCK)
			WHERE iUserID = @UserID AND iFundAccountPosIDFrom = @iFundAccPosID;
	IF(@iSplitBy = 1 AND @mConversionTotal <> 100)
	BEGIN
		SET @Ret = 57;
		GOTO leave;
	END

	SET @fAmount = ROUND(@fAmount, 4);
	SET @mConversionTotal = ROUND(@mConversionTotal, 2);

	IF(@iSplitBy = 0 AND @mConversionTotal <> @fAmount)
	BEGIN
		SET @Ret = 58;
		GOTO leave;
	END
	SET @SourceCode = 'V';
END
----- check for access
DECLARE @iCanTrade tinyint
SET @iCanTrade = [dbo].[CanTrade](@UserID, 'ADD', 'SELL', @bRealTime);
IF(@iCanTrade = 0)
BEGIN
	SET @Ret = 9;
	GOTO leave;
END
------------------------------------
SET @bFee = 0
SET @dtToday = getdate()
SET @dtTodayShort = CONVERT(datetime, CONVERT(varchar(10), @dtToday, 101), 101)
SET @ID = 0
SET @Ret = 0

SET @dtAOT = [dbo].[UBDate](@AOTDateStr)
if(@bAOT = 1 AND ( @AOTDateStr is null OR @AOTDateStr = '' OR @dtAOT is null ))
BEGIN
	SET @Ret = 26
	GOTO leave
END
SET @fDSCRate = 0
SET @fMaxCommRate = 0

SET @FundAccID = ''

SET @iEligFee = 0
if(@iFundAccPosID is null OR @iFundAccPosID = 0) GOTO leave;
-- get the fund acc id, curent price, rate etc
SELECT @iPlanID  = iPlanID, @iFundAccID = iFundAccountID, @MgmtCode = RTRIM(MgmtCode), @FundID = RTRIM(FundID), @fUnitU = isnull(fUnitU, 0), 
		@fUnitA = isnull(fUnitA, 0), @mPrice = isnull(mPrice, 0), @fAccountTotal = isnull(fUnitTotal, 0)
		 FROM UB_FundAccountPosition WITH (NOLOCK) WHERE ID = @iFundAccPosID;

SET @iPlanFreezed = [dbo].[IsFrozen](@iPlanID);
IF(@iPlanFreezed > 0)
BEGIN
	-- depending on the option
	IF([dbo].[GetCompFrozenOpt](@DSID) = 0)
	BEGIN
		SET @Ret = 53;
		GOTO leave;
	END
END

-- the total unit check
SET @fUnits = 0
SET @mGAmount = 0
SET @mNAmount = 0
SET @mGAmountOrigin = 0
SET @fUnits = 0
SET @fUnitsOrigin = 0
SET @fOrderAmount = @fAmount;

SELECT @FundAccID = isnull(FundAccountID, '') FROM UB_FundAccount WITH (NOLOCK) WHERE ID = @iFundAccID

-- get plan info: RRSP, Self-Directed etc
SELECT @iRepIDPlan = iRepID, @RepCode = SaleRepCode, @DealerCode = DealerCode, @PlanType = AccountType, 
		@AccountDesignation = AccountDesignation, @RecipientCode = RecipientCode,
		@iSpousal = iSpousal, @iSD = iSD, @DealerAccountID = RTRIM(DealerAccountID), 
		@IntermediaryCode = RTRIM(isnull(ThirdPartyCode, '')), 
		@IntermediaryAccountID = RTRIM(isnull(ThirdPartyAccount, '')),
		@IntermediaryAccountIDLong = RTRIM(isnull(ThirdPartyCode, '')) + RTRIM(isnull(ThirdPartyAccount, '')),
		@bNominee = dbo.IsNominee(@DSID, AccountDesignation, ThirdPartyCode)
	 FROM UB_Plan WITH (NOLOCK) WHERE ID = @iPlanID;

-- Client Name Fee Redemption must be settled via N$M (SettlementMethod = '1')
IF(@Type = '4' AND @AccountDesignation = '1' AND @SettlementMethod <> '1')
BEGIN
	SET @Ret = 104;
	GOTO leave;
END

-- for V34: remove cheque default option
IF(@iFundServVersion >= 34)
BEGIN
	IF(@AccountDesignation = '1' AND @SettlementMethod = '3' AND @iPMTInfo <> 2)
	BEGIN
		SET @Ret = 87;
		GOTO leave;
	END
END
IF(dbo.IsOmnibusEnable(@DSID) = 1)
	SET @iOmnibusPlanID = dbo.GetOmnibusPlanID(@DSID);
ELSE
	SET @iOmnibusPlanID = 0;
IF(@iPlanID = @iOmnibusPlanID)
BEGIN
	SET @bTrust = 0;
	SET @bPaid2Client = 0;
END
IF(@DSID = 1912 AND @IntermediaryCode = 'AGRP' AND @bRealTime = 1)
	SET @bRealTime = 0;
IF(@DealerCode = '7908' AND @RepCode <> '9998' AND @bRealTime = 1)
	SET @bRealTime = 0;

IF(@bPaid2Client = 1)
BEGIN
	IF([dbo].[IsLIF4RedemptionMaxOK](@DSID, @iPlanID, @AccountDesignation, @PlanType, @fAmount) = 0)
	BEGIN
		SET @Ret = 63;
		GOTO leave;
	END
END

IF(@AccountDesignation = '1' OR (@AccountDesignation = '3' AND @DSID <> 1912))
BEGIN
	SET @SourceCode = '';
END

IF(@AccountDesignation = '2' OR (@AccountDesignation = '3' AND @DSID <> 1912))
BEGIN
	SET @bTrust = 1;
END

IF(@iPlanID = @iOmnibusPlanID)
BEGIN
	SET @bTrust = 0;
	SET @bPaid2Client = 0;
END

IF(@DSID = 1911 AND @AmountType IN ('P', 'A', 'F') )
BEGIN
	SET @iOmnibusOpt = dbo.OmnibusGetDealerOpt(@DealerCode);
	IF(@iOmnibusOpt > 1)
	BEGIN
		SET @fAmount = [dbo].[GetUnit4Sell]( @fAccountTotal, @fAmount, @AmountType) ;
		SET @AmountType = 'S';
	END
END

IF(@PlanType IN ('01', '05', '06', '17')) SET @fFedWHoldTaxRt = 0;
-- get fund info for eligibility
SET @iFundDefID = 0;
SET @iNetwork = 0;
SELECT  @iFundDefID = ID, @ProductType = ProductType, @bRRSPFlg = isnull(bRRSPFlg, 0), 
		@iEligSell= isnull(iEligSell, 0), @iEligFee= isnull(iEligFee, 0), @fPrice = isnull(fPrice, 0), @dtPrice = dtPrice,
		@bNotificationSell = isnull(bNotificationSell, 0), 
		@bElectronic = isnull(bElectronic, 0), @bSelfDirected = isnull(bSelfDirected, 0),
		@Currency = Currency, @iNetwork = isnull(iNetwork, 0), @Symbol = isnull(Symbol, '')
	FROM UB_FundDef WITH (NOLOCK) WHERE MgmtCode = @MgmtCode AND FundID = @FundID 
IF(@Currency is null OR @Currency = '') SET @Currency = '00';
IF(@fPrice is not null AND @fPrice > 0) SET @mPrice = @fPrice
IF(@iNetwork = 2 OR @iNetwork = 4)
	SET @bRealTime = 0; -- make sure that is the case
IF(@iNetwork = 4)
BEGIN
	IF(@AmountType <> 'S')
	BEGIN
		SET @Ret = 78;
		GOTO leave;
	END
	IF(@ETFOrderType IN ('2', '4') AND (@mETFPriceLimit is null OR @mETFPriceLimit <= 0) )
	BEGIN
		SET @Ret = 81;
		GOTO leave;
	END
	IF(@ETFOrderType IN ('3', '4') AND (@mETFPriceStop is null OR @mETFPriceStop <= 0) )
	BEGIN
		SET @Ret = 82;
		GOTO leave;
	END
	IF(@ETFTimeInForce = '6' AND @ETFExpiryDate = '')
	BEGIN
		SET @Ret = 83;
		GOTO leave;
	END
	SET @fAmount = ROUND(@fAmount, 0); -- whole unit only

	IF(@ETFTimeInForce = '6')
		SET @dtETFExpiry = dbo.UBDate(@ETFExpiryDate);
	IF(@Symbol = '') SET @Symbol = @FundID;
END
-- forcing trust account
IF(@DSID = 1912 AND @MgmtCode = 'CASH') 
BEGIN
	IF(@iPlanID <> @iOmnibusPlanID)
		SET @bTrust = 1;
END

IF(@AmountType = 'D')
BEGIN
	SET @mGAmount = -@fAmount
	SET @mNAmount = -@fAmount
	SET @mGAmountOrigin = @fAmount
	-- estimate number of units
	IF(@mPrice is not null AND @mPrice > 0)
		SET @fUnitsOrigin = ROUND(@fAmount/@mPrice, 4);
END
IF(@AmountType = 'S')
BEGIN
	SET @fUnits = -@fAmount
	SET @mNAmount = -ROUND(@fAmount * @mPrice, 2);
	SET @fUnitsOrigin = @fAmount
	SET @mGAmountOrigin = ROUND(@fAmount * @mPrice, 4);
END
IF(@fUnitsOrigin > 0 AND @fUnitsOrigin > ROUND((@fUnitU + @fUnitA), 4) )
BEGIN
	SET @Ret = 21
	GOTO leave
END

SELECT @fDSCRate = isnull(fDSCRate, 0), @fMaxCommRate = isnull(fMaxCommRate, 0), @mMinSell = isnull(mMinSell, 0)
			FROM UB_FundDefDetail WITH (NOLOCK) WHERE ID = @iFundDefID

-- sell/fee eligible?
if( (@iEligSell = 3 AND @Type = '6' ) OR (@iEligFee = 3 AND @Type = '4') )
BEGIN
	SET @Ret = 11
	GOTO leave
END
IF(@MgmtCode = 'ETF')
BEGIN
	IF(@fAmount < @mMinSell )
	BEGIN
		SET @Ret = 19;
		GOTO leave
	END
END

IF( @MgmtCode <> 'ETF' AND @iForceOpt = 0 AND @mGAmountOrigin < @mMinSell AND @Type = '6' AND @AmountType IN ('D', 'S') ) 
BEGIN
	SET @Ret = 19;
	GOTO leave
END
-- build source ID
SET @ID = 0
EXEC [dbo].[UBSysIDTrxCode] @ID OUTPUT
SET @SourceID = [dbo].[UBSourceIDCreate](@ID, @dtToday)
-- modify method = 0: added by interface
-- action code = 0: new
-- fund account id = empty if it is a new account
-- iStatus = Pending (3) order status = 1 pending to send
SET @iStatus = 3
IF(@Type = '6') SET @iType = 45 -- sell
IF(@Type = '4')
BEGIN
	SET @iType = 20 -- fee
	SET @bFee = 1
END

SET @ProdEventInd = ''
SET @iOrderStatus = 1
SET @iOrderType = 4 -- wire order
IF(@iNetwork = 2)
	SET @iOrderType = 2;
----- agora send the order as intermediary source
SET @OrderSource = 'D' -- dealer
IF(@bNominee = 1 AND @AccountDesignation = '3') SET @OrderSource = 'I' -- Intermediary
IF(@DSID = 1912 AND @AccountDesignation = '3') SET @OrderSource = 'I';  -- Intermediary
SET @OrderID = '' -- will be assigned by the response file
SET @iProspectusInd = 0

if(@bAOTOrginalOrder = 0) 
BEGIN
	SET @AOTOrginalOrderID = ''
	SET @iAOTOrginalOrderID = 0
END
IF(@MgmtCode = 'ETF')
	SET @FundAccountPosID = RTRIM(@FundID) + ' ' + RTRIM(@FundAccID);
ELSE
	SET @FundAccountPosID = RTRIM(@MgmtCode) + RTRIM(@FundID) + ' ' + RTRIM(@FundAccID);

SET @iOrderID = 0;

-- make sure the address is filled when having payee as check and B
SET @PayeeLastName = RTRIM(LTRIM(@PayeeLastName));
SET @PayeeFirstName = RTRIM(LTRIM(@PayeeFirstName));
SET @PayeeAddress = LTRIM(RTRIM(@PayeeAddress));
SET @PayeeCity = RTRIM(LTRIM(@PayeeCity));
SET @PayeeProvince = RTRIM(LTRIM(@PayeeProvince));
SET @PayeeCountry = RTRIM(LTRIM(@PayeeCountry));
SET @PayeePostalCode= RTRIM(LTRIM(@PayeePostalCode));

IF(@iPMTInfo = 2)
BEGIN
	IF( @PayeeLastName = '' AND  @PayeeFirstName = '')
		SELECT @PayeeTitle = isnull(C.Title, ''), @PayeeLastName = isnull(C.LastName, ''), @PayeeFirstName = isnull(C.FirstName, '') FROM UB_Customer C WITH (NOLOCK) WHERE ID = @iClientID;

	SET @PayeeLastName = RTRIM(LTRIM(@PayeeLastName));
	SET @PayeeFirstName = RTRIM(LTRIM(@PayeeFirstName));

	IF(@PayeeType='B' AND @PayeeAddress = '')
	BEGIN
		-- get from the client address
		SELECT @PayeeAddress = isnull(Line1, '') + ' ' + isnull(Line2, '') + isnull(Line3, ''), 
			@PayeeCity = City, @PayeeProvince  = ProvinceCode, @PayeeCountry = CountryCode,
			@PayeePostalCode = [dbo].[FormatPostal](PostalCode, CountryCode)
			FROM UB_CustomerAddress WITH (NOLOCK) WHERE LinkedID = @iClientID AND [Type] = 0 AND bDefault = 1;
		SET @PayeeAddress = LTRIM(RTRIM(@PayeeAddress));
		SET @PayeeCity = RTRIM(LTRIM(@PayeeCity));
		SET @PayeeProvince = RTRIM(LTRIM(@PayeeProvince));
		SET @PayeeCountry = RTRIM(LTRIM(@PayeeCountry));
		SET @PayeePostalCode= RTRIM(LTRIM(@PayeePostalCode));
	END
END

SET @bInvestedAmountExclude = 0;
-- IF(@iMRSConversionCount > 0)
--	SET @bInvestedAmountExclude = 1;
IF(@iMRSConversionCount > 0)
BEGIN
	SET @iCount = 0;
	SELECT @iCount = Count(*) 
		FROM UB_ConversionOrderTMP T WITH (NOLOCK)
				INNER JOIN UB_FundAccountPosition P WITH (NOLOCK) ON (P.ID = T.iFundPosIDTo)
				INNER JOIN UB_FundDef F WITH (NOLOCK) ON (P.MgmtCode = F.MgmtCode AND P.FundID = F.FundID)
		WHERE iUserID = @UserID AND iFundAccountPosIDFrom = @iFundAccPosID
				AND F.Currency <> @Currency;
	IF(@iCount is not null AND @iCount > 0)
	BEGIN
		SET @Ret = 61;
		GOTO leave;
	END
END
IF(@DSID = 1912)
BEGIN
	SET @SettlementSource = 'I';
	SET @OrderSource = 'I';
	SET @SettlementMethod = '1';
END
EXEC [dbo].[UBFundTrxOrderAdd] @DSID, @UserID, @Lg, 0, @ActionCode, @SourceID , @iPlanID, @iFundAccID, @iFundAccPosID, 
	@iType, @Type, @TypeDetail,@AmountType, @fAmount, @DealerCode, @RepCode, @iSequence, 
	@SettlementStatus, @SettlementSource, @SettlementMethod,
	@SettlementInd, '', '',@ContrWdrCode, '', @bUnsolicited, 0,
	0, @bRealTime, @bIncludeOrderReceipt,	@bAOT,  @iAOTOrginalOrderID , @AOTOrginalOrderID ,@dtAOT, 
	@fCLPaidCommRate, 0, '', @bTrust, 0, @iTrustID,@iApplicationID, @Notes,
	@FundAccountPosID, @DealerAccountID, @IntermediaryAccountIDLong,
	0, 0, @iOrderID OUTPUT,
	-- banking info: takie a copy from bank setup in plan level
	@iPMTInfo, @iBankAccountID, @BankHolderName,  @BankAccountType,  @BankCode,
	@BankTransitNumber, @BankAccountNumber, @Currency,
	-- cheque info 
	@PayeeType, 
	@PayeeTitle, @PayeeLastName, @PayeeFirstName ,
	@PayeeAddress, @PayeeCity, @PayeeProvince, @PayeeCountry ,@PayeePostalCode,
	
	0, 0, 0, '','', '', '', '','', '', '', '','','' , -- from side
	'', -- owner DOB
	0, @fFedWHoldTaxRt, null, @iNetwork, @Symbol, @Exchange, @OrderSide, 
	@ETFOrderType, @ETFTimeInForce, @mETFPriceLimit, @mETFPriceStop, @dtETFExpiry;
----------------------
SET @ID = 0
if(@iOrderID > 0)
BEGIN
	SET @ID = 0;
	EXEC [dbo].[UBTrxAdd] @DSID, @UserID, 0, 0, @iPlanID, @iFundAccID, @iFundAccPosID, 
		@AccountDesignation, @PlanType, @DealerAccountID, 
		@IntermediaryCode, @IntermediaryAccountID,
		@MgmtCode, @FundID, @FundAccID, @iStatus, @iType, @Type, @TypeDetail, @ProdEventInd,
		@iSequence, @iOrderType, @iOrderStatus, @OrderSource, @OrderID, @SourceID, '', 
		@dtTodayShort , null, null,
		@mGAmount, @mGAmountOrigin, @mNAmount, @fUnits, @fUnitsOrigin, @mPrice, 0, 0, 
		'+',  @iRepIDPlan, @RepCode, @DealerCode,
		'', @SettlementSource,@SettlementMethod,
		@SettlementInd , @Currency,'',
		'', @ContrWdrCode,'', 
		0,0,0,0, 0.0, 1.0, '',
		@fCLPaidCommRate, 0, 0, 0, 0, 0,0,0,0, 0,0,0, 0, '', 0,0,0, '', '','',
		@ID OUTPUT,@AmountType, @fOrderAmount, @iOrderID, 0, 0, @iTrustID, @iClientID,@Notes,
		0, @bUnsolicited,
		@bAOT, @dtAOT, @iAOTOrginalOrderID, @AOTOrginalOrderID,
		@iApplicationID,
		0, 0,'', @bInvestedAmountExclude, 0,0,
		0, 0, 0, 0, 0, 0, 0,'', '' ,'', 0,
		0,0,@iNetwork, 0; -- no EMDQualifier for sell

	if(@ID > 0)
	BEGIN
		INSERT INTO UB_FundTrxOrderTrx (iOrderID, iTrxID) VALUES( @iOrderID, @ID)
		-- add to ARC order
		EXEC [dbo].[UBFundTrxOrderARC] @iOrderID
		-- trust account: generate trust account trx, and adjust the available amount
		-- only for nominee account
		IF(@bTrust = 1)
		BEGIN
			SET @mNAmount = -@mNAmount
			EXEC [dbo].[UBTrustSellTrxAdd] @UserID,  @iTrustID, @ID, @Currency, @mNAmount, 0, @iOrderID,
									@iClientID , @iPlanID, @iFundAccID , @iFundAccPosID, @MgmtCode, @bFee,
									null, null,	@iRepIDPlan, @DealerCode, @RepCode, @iTrustTrxID OUTPUT, 
									@DSID, 0, 0, @SourceCode;
		END
		IF(@iMRSConversionCount > 0)
		BEGIN
			INSERT INTO UB_FundTrxConversion (iFundAccountPosIDFrom, iFundAccountPosIDTo, MgmtCodeTo, FundIDTo,
					iSplitBy,iStatus, iTrxIDFrom, mAmount,  fCLPaidCommRate, iCreatedUserID, dtCreated, iTrxIDTo, iOrderIDTo,
					iRebateFundPosID, mRebateAmount)
			SELECT @iFundAccPosID, T.iFundPosIDTo, P.MgmtCode, P.FundID, T.iSplitBy, 0, @ID,
					T.mAmount, T.fCLPaidCommRate, @UserID, @dtToday, 0, 0, iRebateFundPosID, mRebateAmount
				FROM VieFUNDTMP.dbo.UB_ConversionOrderTMP T WITH (NOLOCK)
						INNER JOIN UB_FundAccountPosition P WITH (NOLOCK) ON (P.ID = T.iFundPosIDTo)
			WHERE iUserID = @UserID AND iFundAccountPosIDFrom = @iFundAccPosID
				ORDER BY P.MgmtCode, P.iFundAccountID, P.FundID;
			UPDATE UB_FundTrxDetail SET iConversion = 1 WHERE ID = @ID;
			-- check for suitability after
			EXEC [dbo].[UBCompTrxSuitabilityCheckTrx4Update] @ID;
		END
		-- remove from the temp
		DELETE FROM VieFUNDTMP.dbo.UB_ConversionOrderTMP 
				WHERE iUserID = @UserID AND iFundAccountPosIDFrom = @iFundAccPosID;

	END
	if(@ID is null OR @ID = 0)
	BEGIN
		DELETE FROM UB_FundTrxOrder WHERE ID = @iOrderID
		if(@iPMTInfo = 2) DELETE FROM UB_FundTrxOrderCheque WHERE iOrderID = @iOrderID
	END
END
--- add expense of $5 to the member of the sale rep or if split add it to the split reps
IF(@iExtraAdminFee <> 0 AND @MgmtCode <> 'ETF')
BEGIN
	EXEC [dbo].[UBCommissionExpenseAdd4Trade] @iOrderID, @iExtraAdminFee, 0;
END

leave:
SELECT @iOrderID AS iOrderID, @ID AS ID, @Ret As Ret
END








GO
/****** Object:  StoredProcedure [dbo].[UBFundTrxSellBasket]    Script Date: 2026-03-11 10:41:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- error:
-- 11: cannot do a buy on this fund
-- 12: RRSP not eligible
-- 13: RESP plan not eligible
-- 14: province of residence not eligible19
-- 15: US not eligible
-- 16: Offshore not eligible
-- 17: Fund is not approved by dealer
-- 18: Risk at fund > risk in plan
-- 19: Minimum $ to buy, first or subsequence
-- 20: cap fund
-- 21: nunber of units for sell exceed holding
-- 22: could not create switch from record
-- 23: 
-- 24: input commission rate > defined fund comm allowable rate.
-- 25: The outside account has the same dealer code: external transfer must have different dealer code
-- 26: AOT date missing
-- 27: ICT: No source fund selected
-- 28: ICT: No destination fund selected
-- 29: ICT: fund to sum is not equal to 100%
-- 30: Owner Birth Date is required and must be at least 18
-- 31: Commission rebate trx: amount specified must be <= than commission amount
-- 32: Required original order is missing
-- 33: Insufficient fund in Trust Account
-- 34: future date not valid
-- 35: duplication of source ID
-- 36: cannot transfer to the same account

-- 55: No Conversion info entered when the checkbox is on
-- 56: Split type must be % when sell amount type is not $
-- 57: Conversion buy add up must be 100%
-- 58: Conversion buy $ total <= sell amount if the sell is $ type and the split is $
-- if conversion check if not suitable
