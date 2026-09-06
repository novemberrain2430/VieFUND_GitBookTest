ETF Transfer

ETF is traded on stock exchange, unlike mutual fund, the trades do not go through FundServ, instead it goes via a third-party stock trading company where the trades are forwarded to the stock exchange.

The communication between VieFUND and the trading company is in FIX standard. So the trading company forward that FIX message.

Dealer has one account at the trading company. It calls omnibus account.

All orders from each client might be bundled in one order if they have the same characteristic: the same symbol, the same properties.

Orders can be Buy or Sell so we do not use all �order side�

Order Side: UB\_Def\_StockSide

Order Type: see content in table UB\_Def\_StockOrderType, our dealers are using only Market, Limit, Stop, Stop-Limit.

Order TimeInForce: table UB\_Def\_StockTimeInForce: our dealers use only: Day, Good Till Cancel, Good Till Day.

The order is always in whole unit. No fraction.

All ETF products define in our system with MgmtCode \= �ETF� which we made it up and the FundID is the Symbol of the ETF product. Only the Symbol (or also called Ticker) and the CUSIP number are important for any stock.

Transfer: 

Clients have asset in one plan and want to move some or all of that asset to another plan. There is no point of selling the stock and then buy the same stock because the asset for each client is registered only at dealers (at the trading company, only one master account for all clients of that dealer) 

From Plan \[ dropdown list to choose, all nominee plans of the client that have ETF funds\]

To Plan \[ Drop down list to choose, list of all nominee plans less the from plan\]

ETF Account \[ Dropdown list of all ETF accounts of the from plan selected\]

Trade Date \[Can be only last business date\] default for the last business date. Cannot be Today date, or earlier than the last existing trade date of the account

Price \[Not editable\] based on the date and the ETF product

Amount type:  \[ dropdown list \] Units, % or $

Amount: \[  Edit text \]    \+ Calculator Icon

Transferred units \[ Not editable text \]

Transferred Amount \[ Not editable text\]

Averaged Cost \[ Not editable text\]

\[x\] Confirmed  \[ OK \] \[ Cancel \]

When user clicks on the calculator, the system will calculate based on the amount type

For example if units: copy to Transferred units

If $ amount: take the $ amount / price \= unit then round it to the integer to get the transferred unit

If Percentage: takes the account number of unit and calculate based on the percentage to get the units in integer

Transferred amount \= transferred units x price

Average cost is the last average cost from the account.

When user click OK, a validation has to be performed to make sure the units are good� cannot be more than what the client has in the from side.

Two-sided Trxs to be created: Transfer out of the from side and Transfer in in the to side

The trx type can be Internal transfer or External transfer. Each dealer might wants something else.

Best to create a function GetETFTransferType(@DSID) and return either 39 external Trnsf in or 42 Internal Transfer in, when 39 then 62 and when 42 then 65 accordingly

If the ETF account in the �To� side does not exist, create one.

The rules are the same as the existing manual transfer of the mutual funds.

If the From side plan type is different than the To side plan:

OPEN \=\> TFSA, or RRSP or any registered, the Taxable flag must be set on the To side so the system can create the Non-Cash Trx in the UB\_TrustTrx table for taxation purpose.

Registered \=\> OPEN: then the transfer out trx needs to be flagged

If from TFSA \=\> RRSP : then both sides need to be flagged

See existing rules already there.

