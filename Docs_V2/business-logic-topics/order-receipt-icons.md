\- Add one line to **PopupSetupDealerHO.aspx**:

	*\<asp:ListItem value \= "19" text \= "Order Receipt Icon"/\>*

\-Add one line to SP **UBLogoAdd**

	*ELSE IF(@iType \= 19\) SET @KeyStr \= 'OrderReceiptIcon';*

Modify SP ***UBOrderReceiptSet*** to config display icon for last page or for all pages depend on DSID:

	*DECLARE @OrderReceiptIcon TABLE (iDisplayType int);*

	*DECLARE @iDisplayForAllPages int=0;*

	*IF(@DSID IN (1001, 1194))* 

		*BEGIN*

			*SET @iDisplayForAllPages=1;*

		*END*

	*INSERT INTO @OrderReceiptIcon (iDisplayType) VALUES(@iDisplayForAllPages);*

	*Select 'OrderReceiptIcon' AS RecType, iDisplayType FROM @OrderReceiptIcon*

**VieFUNDPdf project:**

**CPDF.cs:**

Add method DisplayOrderReceiptIcon to OnEndPage to display icon for all pages with condition above.

*protected int DisplayOrderReceiptIcon(PdfWriter wr, Document doc)*

   *{*

       *byte\[\] imgBytes \= \_imgLogo;*

       *float fX \= (float)\_iLogoX;*

       *float fY \= (float)\_iLogoY;*

       *float fW \= (float)\_iLogoW;*

       *float fH \= (float)\_iLogoH;*

       *fY \= fY \+ 5;*

       *PdfBuilder.AddImageBytesPos(doc, fX, fY, imgBytes, fW, fH);*

       *return \_iHeaderOffsetY;*

   *}* 

**OrderReceipt.cs:**

Fetch image from db with iDisplayType==0 (default last page) or \==1 (all pages)

 If display for all pages, place code after method  PdfBuilder.StartPdf()

 If display for last page, place code after method   Signature(doc, Lg, FirstName1, FirstName2)

  				