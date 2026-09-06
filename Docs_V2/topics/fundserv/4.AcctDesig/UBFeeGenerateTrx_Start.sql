SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UBFeeGenerateTrx_Start](@iProcessingID int, @iUserID int = 0, @iOptions int = 0)
-- WITH ENCRYPTION**
AS
BEGIN
SET NOCOUNT ON;
DECLARE @List TABLE (iIndex int identity(1, 1), iFeeID int);

DECLARE @iCount int = 0, @dtTrade datetime, @iStatus int, @dtToday datetime, 
	@dtTodayShort datetime;
DECLARE @iTrxType int, @bRealTime int, @DSID int, @DealerCode varchar(5) ;
SET @dtToday = GETDATE();
SET @dtTodayShort = dbo.GetDateNoTime(@dtToday);
SELECT TOP 1 @DSID = ID FROM UB_Dealership WITH (NOLOCK);

SELECT @dtTrade = dtTrade, @iStatus = iStatus, @iTrxType = iTrxType, @bRealTime = iRealTime, @DealerCode = DealerCode
			FROM UB_FeeProcess WITH (NOLOCK) WHERE ID = @iProcessingID;
SET @iCount = 0;
IF(@dtTrade > @dtToday)
BEGIN
	GOTO leave;
END
--- 
IF(@DealerCode = '7908')
BEGIN
	UPDATE F SET F.iPosID = Pos.ID FROM UB_Fee F INNER JOIN UB_Plan P WITH (NOLOCK) ON (F.iPlanID = P.ID) 
		INNER JOIN UB_FundAccountPosition Pos WITH (NOLOCK) ON (Pos.iPLanID = P.ID AND Pos.MgmtCode = 'CSH')
				WHERE F.iFeeProcessingID = @iProcessingID AND F.iPosID = 0 AND Pos.fUnitTotal >= F.mFeeTotal;
END
IF(@dtTrade < @dtToday)
BEGIN
	SET @dtTrade = dbo.GetTradeDate();
END
-- no client name Item
INSERT INTO @List(iFeeID) SELECT F.ID FROM UB_Fee F WITH (NOLOCK) 
		INNER JOIN UB_Plan PL WITH (NOLOCK) ON (F.iPlanID = PL.ID)
		WHERE F.iFeeProcessingID = @iProcessingID AND F.iTrxID = 0 AND F.mFee > 0 AND F.iStatus = 0
				-- AND PL.AccountDesignation <> '1'
		ORDER BY ID;
SET @iCount = @@ROWCOUNT;
leave:
SELECT 'Info' As RecType, @iTrxType AS iTrxType, @bRealTime AS bRealTime, dbo.DateStr(@dtTrade, 101) AS TradeDate, @iCount As iCount;
SELECT 'List' As RecType, iIndex, iFeeID FROM @List ORDER BY iIndex;
END
GO
/****** Object:  StoredProcedure [dbo].[UBFeeGenerateTrxOne]    Script Date: 2026-03-11 10:41:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UBFeeGenerateTrxOne](@DSID int, @iFeeID int, @iUserID int = 0, 
								@iTrxType int = null, @bRealTime int, @TradeDate varchar(10),
								@iFeeType int = 0)
-- WITH ENCRYPTION**
AS
BEGIN
SET NOCOUNT ON;
DECLARE @iStatus int = 0, @dtTrade datetime; 
SET @dtTrade = dbo.UBDate(@TradeDate);
