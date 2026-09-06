**Dealership Head Office (Admin/Dealer)**

In this head office screen, there are 3 important properties:

![][image1]

Tables: UB\_Dealership, UB\_DealerCode

SPs: start with UBDealerxxxx

PopupSetupDealer.aspx

**\#1 Level:** there are 4 levels: level 1 and 2 are for introducing dealers, level 3 usually uses Trust Account (\#2) and level 4 are nominee dealers.

**\#2 Trust Account**: the dealer has trust account for their clients. When doing a “buy” the client can pay (deposit) to the dealer and the dealer would settle the amount with the fund company. For example, John Doe writes a cheque to the dealer the amount of $10K to buy a fund DYN 3056\. The dealer cash the cheque and deposit John’s Doe $ into the Trust Account, place the buy, and then later settle with the fund company the purchase amount. 

![][image2]

**\#3 N$M participant**: When the dealer holds the $ in Trust Account in behalf of the clients, dealer can settle in bulk with the fund companies via FundServ account. That method is named: N$M.

N$M stands for: Net Cash Settlement.

A Dealer can have many dealer codes. 

To edit an existing dealer code: Select an item, Click on the \+ to add a new dealer code, click on the Edit icon to edit the selected dealer code![][image3]

Each dealer code has its own properties

**General Info Tab:**

“**Real Time Trading**” trades of this dealer code can be sent to FundServ in real time instead of batch mode. The real time (interactive) communication between Dealer \<–\> FundServ \<-\> Fund Companies is done using IBM Message Queue, where FundServ is the server site and the dealership acts as client side. So on dealership side, a IBM MQ Client must be installed and dealer get certificate from FundServ to installed etc. A dealership can have dealer codes and real time and dealer codes not in real time. When it is not in real time, it calls batch mode, where the communication between Dealership \<-\> FundServ \<-\> Fund companies is via XML files transported using sftp.

![][image4]

**Eligibility:** Dealership would define the role of the selected dealer code. Sometime dealer wants to use the specific dealer code for certain type of product only. For example, one dealer code is only for mutual fund, and another one only for segregated fund.

**Exclude accounts and trx of this dealer code from Compliance**: each transaction must go through compliance filter. However, some time, dealer dedicate a dealer code that is specific to a product type that it does not require compliance check. For example, Dealer Code specifically used only for Seg (segregated) fund, does not require compliance check.

**Exclude this dealer code from Client Statement** (Adhoc or Head Office): when generating statement, any asset under this dealer code will be ignored.

**Nominee Tab**: to define nominee specs of the dealer code. Try to explore 

![][image5]

**Others Tab:**

CDIC: Canada Deposit Insurance Corporation. Some money products. 

![][image6]

[image1]: ../images/dealer-head-office_image1.png

[image2]: ../images/dealer-head-office_image2.png

[image3]: ../images/dealer-head-office_image3.png

[image4]: ../images/dealer-head-office_image4.png

[image5]: ../images/dealer-head-office_image5.png

[image6]: ../images/dealer-head-office_image6.png
