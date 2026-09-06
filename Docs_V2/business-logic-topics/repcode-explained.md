![][image1]

Mỗi tài khoản có thể được gán nhiều dealer code, mỗi dealer code có nhiều rep code, Mỗi repcode lại có nhiều advisor code

Rep code được sử dụng ở đây có nghĩa là Assigned advisor. Mỗi Client gắn với 1 repcode ở giao diện thêm client:

![][image2]

![][image3]

Mỗi repcode lại có nhiều advisor code

![][image4]

Acc admin:

![][image5]

Acc user thì bấm đây để trace SP và get tất repcode theo user:

![][image6]

Tìm tất repcode theo user:

exec UBRepCodeSelectList @DSID\=1001,@Lg\=0,@iUserID\=76,@iOptions\=0,@CurDealerCode\='',@CurRepCode\='',@LastName\='',@FirstName\='',@bIncludeInactive\=0

exec UBRepCodeSelectList @DSID\=1001,@Lg\=0,@iUserID\=76

![][image7]

hoặc

exec UBMemberSelectList @DSID=1001,@Lg=0,@iUserID=76,@iOptions=0,@DealerCode='',@RepCode='',@FileID='',@bIncludeInactive=0

![][image8]

repAccess ghi trong này:

![][image9]

![][image10]

![][image11]

IrepID là ID quyền access, 90 91 là 2 thằng này:

![][image12]

Sau đó mới get plan theo iRepID :

![][image13]

từ đó mới lọc report theo repcode được quyền view

exec DI\_PlanKYCExpiredList @DSID='1001',@Lg=0,@iUserID=1,@iPageSize=20,@iPage=1,@iOptions=0,@DealerCode='2515',@RepCode='007',@iIncludeFrozen=0

exec UBMemberSetupList @DSID='1001',@iUserID=1,@Lg=0,@iOptions=0,@iPageSize=500,@iPage=1,@iBranchID=0,@BranchText='',@UserIDStr='\*',@DealerCode='',@RepCode='',@FirstName='\*',@LastName='\*',@bAdmin=0,@bAssistant=0,@bComplianceOfficer=0,@bDealer=1,@bBranchManager=0,@bRep=0,@bIncludeInactive=0,@iSupervisoryLevel=-1,@iSortOpt=0,@FileID='\*',@iMemberGroupID=0

Đối với quyền xem client cũng tương tự, admin được xem tất cả client của member.Member nào chỉ nhìn thấy client của mem đó. Quy định trong bảng customer\_Rep:

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
