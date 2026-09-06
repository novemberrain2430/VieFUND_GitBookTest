/****** Object:  StoredProcedure [dbo].[UBFundTrxSellShort]    Script Date: 2026-03-11 10:41:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UBFundTrxSellShort] (@DSID int, @UserID int, @Lg int = 0, @iOptions int = 0, @ActionCode varchar(3) = 'NEW',
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
	@MRSConversionStr varchar(400) = '',
	@iOrderID int OUTPUT, @iTrxID int OUTPUT, @fFedWHoldTaxRt float = 0, @ProdEventInd varchar(2) = '',
	@dtTrade datetime = null, @SourceCode char(1) = '', @iScheduleRunID int = 0, @iNoComp tinyint = 0
)
-- WITH ENCRYPTION**
AS
BEGIN
SET NOCOUNT ON;
-- BEGIN TRAN
DECLARE @tbMRSConversion TABLE (iID int, ValueStr varchar(50))
DECLARE @iMRSConversionCount int;
DECLARE @dtToday datetime, @dtTodayShort datetime, @iRepIDPlan int, @RepCode varchar(5), @DealerCode varchar(4)
DECLARE @iCount int, @Ret int, @iTMPID int, @iFundAccID int, @iStatus tinyint, @iActionCode tinyint, @iType smallint, 
		@iOrderType tinyint, @iOrderStatus tinyint, @OrderID varchar(7), @SourceID varchar(15),
		@MgmtCode varchar(6), @FundID varchar(6), @fUnitU float, @fUnitA float, @mPrice money, @FundAccID varchar(15),
		@mGAmount money,@mGAmountOrigin money,@mNAmount money, @fUnits float,@fUnitsOrigin float,@iProspectusInd tinyint,
		@Prov varchar(2), @CountryCode varchar(3),@OrderSource char(1),
		@PlanType varchar(2), @AccountDesignation char(1), @RecipientCode char(1),
		@iSpousal tinyint, @iSD tinyint, 
		@iFundDefID int, @ProductType char(1), @fPrice float,@bRRSPFlg tinyint,
		@iEligSell tinyint, @iEligFee tinyint, @dtPrice datetime,
		@bNotificationSell tinyint, @bElectronic tinyint, @bSelfDirected tinyint,
		@iTemp int, @fDSCRate float, @fMaxCommRate float,
		@Currency varchar(2), @fOrderAmount float, @mMinSell money, @dtAOT datetime, 
		@FundAccountPosID varchar(30), @DealerAccountID varchar(15), @IntermediaryCode varchar(5), @IntermediaryAccountID varchar(15),
		@IntermediaryAccountIDLong varchar(30), @bFee tinyint, @iPlanFreezed tinyint, @dtSettlement datetime;

----- check for access
DECLARE @iCanTrade tinyint, @iTrustTrxID int, @dtBusiness datetime;


SET @dtBusiness = dbo.GetBusinessDate(dbo.GetDateNoTime(GETDATE()));
IF(@dtTrade is null) SET @dtTrade = @dtBusiness;
SET @dtSettlement = dbo.GetNextBusinessDate(@dtTrade, 1);
IF(@SourceCode is null)
	SET @SourceCode = '';

SET @iOrderID = 0;
SET @iTrxID = 0;
SET @iTrustTrxID = 0;
IF(@iOptions = 0)
BEGIN
	SET @iCanTrade = [dbo].[CanTrade](@UserID, 'ADD', 'SELL', @bRealTime);
	IF(@iCanTrade = 0)
	BEGIN
		SET @Ret = 9;
		GOTO leave;
	END
END
------------------------------------
		
SET @iMRSConversionCount = 0;	
-- SET @MRSConversionStr = '';
IF(@MRSConversionStr <> '')
BEGIN
	INSERT INTO @tbMRSConversion (iID, ValueStr) SELECT ID, Code FROM [dbo].[SplitStr] ( @MRSConversionStr, '|' );
	SET @iMRSConversionCount = @@ROWCOUNT;
	IF(@iMRSConversionCount is null) SET @iMRSConversionCount = 0;
END
SET @bFee = 0
SET @dtToday = getdate();
SET @dtTodayShort = CONVERT(datetime, CONVERT(varchar(10), @dtToday, 101), 101);

IF(@dtTrade is null) 
BEGIN
	SET @dtTrade = [dbo].[GetTradeDate]();
END

SET @iTMPID = 0
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
		@fUnitA = isnull(fUnitA, 0), @mPrice = isnull(mPrice, 0)
		 FROM UB_FundAccountPosition WITH (NOLOCK) WHERE ID = @iFundAccPosID;
SELECT @iPlanFreezed = isnull(iFreezed, 0)
	FROM UB_PlanInvestInfo WITH (NOLOCK) WHERE LinkedID = @iPlanID;
------------------------------ we have to deal with this one ------------
IF(@iOptions = 0 AND @iPlanFreezed = 1)
BEGIN
	SET @Ret = 53;
	GOTO leave;
END

-- the total unit check
SET @fUnits = 0
SET @mGAmount = 0
SET @mNAmount = 0
SET @mGAmountOrigin = 0
SET @fUnits = 0
SET @fUnitsOrigin = 0
SET @fOrderAmount = @fAmount

SELECT @FundAccID = isnull(FundAccountID, '') FROM UB_FundAccount WITH (NOLOCK) WHERE ID = @iFundAccID

-- get plan info: RRSP, Self-Directed etc
SELECT @iRepIDPlan = iRepID, @RepCode = SaleRepCode, @DealerCode = DealerCode, @PlanType = AccountType, @AccountDesignation = AccountDesignation, @RecipientCode = RecipientCode,
		@iSpousal = iSpousal, @iSD = iSD, @DealerAccountID = RTRIM(DealerAccountID), 
		@IntermediaryCode = RTRIM(isnull(ThirdPartyCode, '')), @IntermediaryAccountID = RTRIM(isnull(ThirdPartyAccount, '')),
		@IntermediaryAccountIDLong = RTRIM(isnull(ThirdPartyCode, '')) + RTRIM(isnull(ThirdPartyAccount, ''))
	 FROM UB_Plan WITH (NOLOCK) WHERE ID = @iPlanID

-- Client Name Fee Redemption must be settled via N$M (SettlementMethod = '1')
IF(@Type = '4' AND @AccountDesignation = '1' AND @SettlementMethod <> '1')
BEGIN
	SET @Ret = 104; -- Error code 104 (corresponding to index 94 in CMSG.cs)
	GOTO leave;
END
IF(@PlanType IN ('01', '05', '06', '17')) SET @fFedWHoldTaxRt = 0;
-- get fund info for eligibility
SET @iFundDefID = 0
SELECT  @iFundDefID = ID, @ProductType = ProductType, @bRRSPFlg = isnull(bRRSPFlg, 0), 
		@iEligSell= isnull(iEligSell, 0), @iEligFee= isnull(iEligFee, 0), @fPrice = isnull(fPrice, 0), @dtPrice = dtPrice,
		@bNotificationSell = isnull(bNotificationSell, 0), 
		@bElectronic = isnull(bElectronic, 0), @bSelfDirected = isnull(bSelfDirected, 0),
		@Currency = Currency 
	FROM UB_FundDef WITH (NOLOCK) WHERE MgmtCode = @MgmtCode AND FundID = @FundID 

IF(@fPrice is not null AND @fPrice > 0) SET @mPrice = @fPrice

IF(@AmountType = 'D')
BEGIN
	SET @mGAmount = -@fAmount
	SET @mNAmount = -@fAmount
	SET @mGAmountOrigin = @fAmount
	-- estimate number of units
	IF(@mPrice is not null AND @mPrice > 0)
		SET @fUnitsOrigin = @fAmount/@mPrice
END
IF(@AmountType = 'S')
BEGIN
	SET @fUnits = -@fAmount
	SET @mNAmount = -@fAmount * @mPrice
	SET @fUnitsOrigin = @fAmount
	SET @mGAmountOrigin = @fAmount * @mPrice
END
IF(@iOptions = 0)
BEGIN
	IF(@fUnitsOrigin > 0 AND @fUnitsOrigin > (@fUnitU + @fUnitA))
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
	IF( @MgmtCode <> 'ETF' AND @mGAmountOrigin < @mMinSell AND @Type = '6' AND @AmountType IN ('D', 'S') ) 
	BEGIN
		SET @Ret = 19;
		GOTO leave;
	END
	IF(@MgmtCode = 'ETF' AND @fAmount < @mMinSell)
	BEGIN
		SET @Ret = 19;
		GOTO leave;
	END
END

-- build source ID
SET @iTMPID = 0
EXEC [dbo].[UBSysIDTrxCode] @iTMPID OUTPUT
SET @SourceID = [dbo].[UBSourceIDCreate](@iTMPID, @dtToday)
-- modify method = 0: added by interface
-- action code = 0: new
-- fund account id = empty if it is a new account
-- iStatus = Pending (3) order status = 1 pending to send
SET @iStatus = 3;
IF(@Type = '6') SET @iType = 45 -- sell
IF(@Type = '4' AND @ProdEventInd = '')
BEGIN
	SET @iType = 20; -- fee
	SET @bFee = 1;
	IF(@SourceCode = '')
		SET @SourceCode = 'F';
END
ELSE IF(@Type = '4' AND @ProdEventInd = 'O')
BEGIN
	SET @iType = 90; -- fee redemption
	SET @bFee = 1;
	IF(@SourceCode = '')
		SET @SourceCode = 'F';
END
ELSE IF(@TypeDetail = '7')
BEGIN
	SET @iType = 63; -- AWD
	IF(@SourceCode = '')
		SET @SourceCode = 'A';
END
-- Rebalancing Sell
IF(@Type = '6' AND @TypeDetail = 'X') 
	SET @iType = 201; -- sell rebalancing
ELSE IF(@Type = '6' AND @TypeDetail = 'Y') 
BEGIN
	SET @iType = 202; -- RIF redemption
	IF(@SourceCode = '')
		SET @SourceCode = 'R';
END

SET @iOrderStatus = 1;
SET @iOrderType = 4; -- wire order
SET @OrderSource = 'D'; -- dealer
SET @OrderID = ''; -- will be assigned by the response file
SET @iProspectusInd = 0;

if(@bAOTOrginalOrder = 0) 
BEGIN
	SET @AOTOrginalOrderID = ''
	SET @iAOTOrginalOrderID = 0
END
IF(@MgmtCode = 'ETF')
	SET @FundAccountPosID = RTRIM(@FundID) + ' ' + RTRIM(@FundAccID);
ELSE
	SET @FundAccountPosID = RTRIM(@MgmtCode) + RTRIM(@FundID) + ' ' + RTRIM(@FundAccID);

SET @iOrderID = 0
IF(@iPMTInfo = 2 AND @PayeeLastName = '' AND  @PayeeFirstName = '')
BEGIN
	SELECT @PayeeLastName = isnull(C.LastName, ''), @PayeeFirstName = isnull(C.FirstName, '') FROM UB_Customer C WITH (NOLOCK) WHERE ID = @iClientID;
END
DECLARE	@iNetwork tinyint = 0, 
	@Symbol varchar(15) = '', @Exchange varchar(6) = '', @OrderSide char(1) = '', @OrderType char(1) = '1', @TimeInForce char(1) = '0',
	@mPriceLimit money = 0, @mPriceStop money = 0, @dtETFExpiry datetime = null;
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
	@BankTransitNumber, @BankAccountNumber, @CurrencyCode,
	-- cheque info 
	@PayeeType, 
	@PayeeTitle, @PayeeLastName, @PayeeFirstName ,
	@PayeeAddress, @PayeeCity, @PayeeProvince, @PayeeCountry, @PayeePostalCode,
	0, 0, 0, '','', '', '', '','', '', '', '','','' , -- from side
	'', -- owner DOB
	0, @fFedWHoldTaxRt, @dtTrade, @iNetwork, @Symbol, @Exchange, @OrderSide, @OrderType, @TimeInForce,
	@mPriceLimit, @mPriceStop, @dtETFExpiry, @iScheduleRunID, 0, @iNoComp;
----------------------
SET @iTrxID = 0
if(@iOrderID > 0)
BEGIN
	EXEC [dbo].[UBTrxAdd] @DSID, @UserID, 0, 0, @iPlanID, @iFundAccID, @iFundAccPosID, 
		@AccountDesignation, @PlanType, @DealerAccountID, 
		@IntermediaryCode, @IntermediaryAccountID,
		@MgmtCode, @FundID, @FundAccID, @iStatus, @iType, @Type, @TypeDetail, @ProdEventInd,
		@iSequence, @iOrderType, @iOrderStatus, @OrderSource, @OrderID, @SourceID, '', 
		@dtTrade, @dtSettlement, null,
		@mGAmount, @mGAmountOrigin, @mNAmount, @fUnits, @fUnitsOrigin, @mPrice, 0, 0, 
		'+',  @iRepIDPlan, @RepCode, @DealerCode,
		'', @SettlementSource,@SettlementMethod,
		@SettlementInd , @Currency,'',
		'', @ContrWdrCode,'', 
		0,0,0,0, 0.0, 1.0, '',
		@fCLPaidCommRate, 0, 0, 0, 0, 0,0,0,0, 0,0,0, 0, '', 0,0,0, '', '','',
		@iTrxID OUTPUT,
		@AmountType, @fOrderAmount, @iOrderID, 0, 0, @iTrustID, @iClientID,@Notes, 0, @bUnsolicited,
		@bAOT, @dtAOT, @iAOTOrginalOrderID, @AOTOrginalOrderID,	@iApplicationID,
		0, 0,'', 0, 0,0,0, 0, 0, 0, 0, 0, 0, '',  '' ,'', 0,0,0,0, 0, @iNoComp;
	
	if(@iTrxID > 0)
	BEGIN
		INSERT INTO UB_FundTrxOrderTrx (iOrderID, iTrxID) VALUES( @iOrderID, @iTrxID)
		-- add to ARC order
		EXEC [dbo].[UBFundTrxOrderARC] @iOrderID
		-- trust account: generate trust account trx, and adjust the available amount
		IF(@bTrust = 1)
		BEGIN
			SET @mNAmount = -@mNAmount
			EXEC [dbo].[UBTrustSellTrxAdd] @UserID,  @iTrustID, @iTrxID, @Currency, @mNAmount, 0, @iOrderID,
										@iClientID , @iPlanID, @iFundAccID , @iFundAccPosID, @MgmtCode, @bFee,
										@dtTrade, @dtSettlement, @iRepIDPlan, @DealerCode, @RepCode, @iTrustTrxID OUTPUT,
										@DSID, @iType, 0, @SourceCode;
			-- EXEC [dbo].[UBCashAccountTrxAddTrx] @iTrxID, @iTrustTrxID;
		END
		IF(@iMRSConversionCount > 0)
		BEGIN
			DECLARE @iIndex int, @ConMgmtCode varchar(4), @ConFundID varchar(5), @ConRate varchar(10), @ConValue varchar(15), @SplitBy char(1)
			SET @iIndex = 1;
			SELECT TOP 1 @SplitBy = ValueStr FROM @tbMRSConversion WHERE iID = @iIndex;

			WHILE(@iIndex < @iMRSConversionCount)
			BEGIN
				-- 4 values
				SET @iIndex = @iIndex + 1;
				SELECT TOP 1 @ConMgmtCode = ValueStr FROM @tbMRSConversion WHERE iID = @iIndex;
				SET @iIndex = @iIndex + 1;
				SELECT TOP 1 @ConFundID = ValueStr FROM @tbMRSConversion WHERE iID = @iIndex;
				SET @iIndex = @iIndex + 1;
				SELECT TOP 1 @ConRate = ValueStr FROM @tbMRSConversion WHERE iID = @iIndex;
				SET @iIndex = @iIndex + 1;
				SELECT TOP 1 @ConValue = ValueStr FROM @tbMRSConversion WHERE iID = @iIndex;
				-- add it in to the table
				EXEC UBTrxConversion @UserID, 0, @iTrxID, @ConMgmtCode, @ConFundID, @ConRate, @SplitBy, @ConValue;
			END
			UPDATE UB_FundTrxDetail SET iConversion = 1 WHERE ID = @iTrxID;
		END
	END
	if(@iTrxID is null OR @iTrxID = 0)
	BEGIN
		DELETE FROM UB_FundTrxOrder WHERE ID = @iOrderID;
		if(@iPMTInfo = 2) DELETE FROM UB_FundTrxOrderCheque WHERE iOrderID = @iOrderID;
		SET @iOrderID = 0;
	END
END

leave:
IF(@iOptions = 0)
	SELECT 'SellRet' AS RecType, @iOrderID AS iOrderID, @iTrxID AS ID, @Ret As Ret;

-- COMMIT TRAN
END
GO
