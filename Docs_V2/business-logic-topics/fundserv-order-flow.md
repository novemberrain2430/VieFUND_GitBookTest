**Order/Trx statuses**

The Trx status values are stored in the table UB\_Def\_TrxStatus

On normal circumstances, the trx status changes automatically after an action, either sending to the fund company or getting response etc.

**Flow:**

Fund Companies ? FundServ ? Back Office System (like VieFUND)

**FundServ** is like a postal service. FundServ is owned by about 10 large mutual fund companies. FundServ role is to create, maintain electronic standard (ESG \= Electronic Standard Group) for mutual fund trading activities. Each year, around the 10th of June, the new version of ESG is applied. Each dealer (our client) has an account at FundServ. We, as a back- office software, also have an account at FundServ for testing purposes. ([https://login.fundserv.com/nidp/app/login\#/auth/login](https://login.fundserv.com/nidp/app/login#/auth/login)). 

There are 2 modes for sending mutual fund orders to FundServ:

**Interactive** (real time): using IBM Websphere Msg Queue. FundServ acts as the server, and each dealer site as a client. There is a secured channel using FundServ provided router (VPN). The orders are sent and response is received virtually instantly.

**Batch**: order file (called CO file, as it has prefix CO) created by the back-office software by demand, and either sent automatically using sfpt to FundServ or user can log in to FundServ site and upload the CO files.

On a daily basis, dealer receives many file types via sfpt or manually downloaded from FundServ site. The file types are stored in the table UB\_FS\_FileCode, and on the screen can be seen in Admin/FundServ  Exchange.

**Prices**

**Mutual fund** price is evaluated after 4 pm when the TSE is closed by each fund company. The prices would be available usually in the evening hours. Fund companies sends the price files (RS file) to FundServ and depends how the dealer is setup: the original fund companies� files might be delivered via sfpt to dealers. FundServ also consolidates all fund companies price files into one large file and sends to dealers in the next day morning. Dealer signs up with FundServ either consolidated file or original files.  Some dealers prefer the original files because they can get them on the same day in the eveving hours instead of the next day morning.

**ETF:** it is like stock, so when an order is executed, the price is as of that time. At the end of the day or next morning, the system imports the price files for the previous closing price of all ETF products. That price file currently provided by a company called Fundata. Some dealers also import price file manually with a different format.

**GIC Rates**: For GIC the product rate is updated on a daily basis and it is valid for the day. So the system import the rates in the morning and the rates are good for the day of trading. GIC rates currently provided by CANNEX. There sfpt to download the file.

   **Mutual Fund trading:**

When an order is created: it has **�Pending�** status

When the order is sent successfully to FundServ either by real time or batch mode: the trx status is �Pending to Receive�

When the response comes back (by real time msg queue or by response file) then the trx can have :

	\+ **Rejected:** if the Network (FundServ) or the Fund Company rejects it due to some reasons

	\+ **Accepted:** the order is OK and being accepted. (some time accepted with warning)

The rejection can be by FundServ or by Fund company.

If it is by FundServ, usually it has to do with syntax and logics of the order message

If it is by Fund company then usually the logics

There are error codes list in the system, and when rejected there is an error code so the system can display the reason for rejection and user can fix the data and submit again.

At T+1 (next business day): there is FS and TS files from the fund companies to download and to process.

FS file is the settlement file. The trx will have the status �**Contracted**� except non-cash trx, which will have the Status �**Confirmed**�

The reason for T+1 is: the price is known, so the units transacted can be calculated�.

On T+2 TS file comes and the trx status changed to �Confirmed�

Note that FS and TS files might contain records for �Rejection� of previously �Accepted�

Sometimes, users need to do some corrections and edit the trx to change values, statuses etc.

