![][image1]

Má»—i tÃ i khoáº£n cÃ³ thá»ƒ Ä‘Æ°á»£c gÃ¡n nhiá»u dealer code, má»—i dealer code cÃ³ nhiá»u rep code, Má»—i repcode láº¡i cÃ³ nhiá»u advisor code

Rep code Ä‘Æ°á»£c sá»­ dá»¥ng á»Ÿ Ä‘Ã¢y cÃ³ nghÄ©a lÃ  Assigned advisor. Má»—i Client gáº¯n vá»›i 1 repcode á»Ÿ giao diá»‡n thÃªm client:

![][image2]

![][image3]

Má»—i repcode láº¡i cÃ³ nhiá»u advisor code

![][image4]

Acc admin:

![][image5]

Acc user thÃ¬ báº¥m Ä‘Ã¢y Ä‘á»ƒ trace SP vÃ  get táº¥t repcode theo user:

![][image6]

TÃ¬m táº¥t repcode theo user:

exec UBRepCodeSelectList @DSID\=1001,@Lg\=0,@iUserID\=76,@iOptions\=0,@CurDealerCode\='',@CurRepCode\='',@LastName\='',@FirstName\='',@bIncludeInactive\=0

exec UBRepCodeSelectList @DSID\=1001,@Lg\=0,@iUserID\=76

![][image7]

hoáº·c

exec UBMemberSelectList @DSID=1001,@Lg=0,@iUserID=76,@iOptions=0,@DealerCode='',@RepCode='',@FileID='',@bIncludeInactive=0

![][image8]

repAccess ghi trong nÃ y:

![][image9]

![][image10]

![][image11]

IrepID lÃ  ID quyá»n access, 90 91 lÃ  2 tháº±ng nÃ y:

![][image12]

Sau Ä‘Ã³ má»›i get plan theo iRepID :

![][image13]

tá»« Ä‘Ã³ má»›i lá»c report theo repcode Ä‘Æ°á»£c quyá»n view

exec DI\_PlanKYCExpiredList @DSID='1001',@Lg=0,@iUserID=1,@iPageSize=20,@iPage=1,@iOptions=0,@DealerCode='2515',@RepCode='007',@iIncludeFrozen=0

exec UBMemberSetupList @DSID='1001',@iUserID=1,@Lg=0,@iOptions=0,@iPageSize=500,@iPage=1,@iBranchID=0,@BranchText='',@UserIDStr='\*',@DealerCode='',@RepCode='',@FirstName='\*',@LastName='\*',@bAdmin=0,@bAssistant=0,@bComplianceOfficer=0,@bDealer=1,@bBranchManager=0,@bRep=0,@bIncludeInactive=0,@iSupervisoryLevel=-1,@iSortOpt=0,@FileID='\*',@iMemberGroupID=0

Äá»‘i vá»›i quyá»n xem client cÅ©ng tÆ°Æ¡ng tá»±, admin Ä‘Æ°á»£c xem táº¥t cáº£ client cá»§a member.Member nÃ o chá»‰ nhÃ¬n tháº¥y client cá»§a mem Ä‘Ã³. Quy Ä‘á»‹nh trong báº£ng customer\_Rep:

![][image14]

[image1]: ../images/repcode-explained_image1.png

[image2]: ../images/repcode-explained_image2.png

[image3]: ../images/repcode-explained_image3.png

[image4]: ../images/repcode-explained_image4.png

[image5]: ../images/repcode-explained_image5.png

[image6]: ../images/repcode-explained_image6.png

[image7]: ../images/repcode-explained_image7.png

[image8]: ../images/repcode-explained_image8.png

[image9]: ../images/repcode-explained_image9.png

[image10]: ../images/repcode-explained_image10.png

[image11]: ../images/repcode-explained_image11.png

[image12]: ../images/repcode-explained_image12.png

[image13]: ../images/repcode-explained_image13.png

[image14]: ../images/repcode-explained_image14.png
