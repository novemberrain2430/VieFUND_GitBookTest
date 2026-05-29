Fundserv Standards V36  REQUIREMENTS  

*October 07, 2025*   
 Table of Contents 

Table of Contents **........................................................................................................................................ 2** 0.0 Document Information **.......................................................................................................................... 4** 0.1 Revision History....................................................................................................................................... 5 0.2 Milestones................................................................................................................................................. 6 0.3 Contact Information ................................................................................................................................ 7 0.4 Scope ........................................................................................................................................................ 8 0.5 Impact Assessment................................................................................................................................. 9 0.6 Understanding Text Style and XML Schema Diagrams.................................................................. 10 0.7 Fundserv Funnel .................................................................................................................................... 11 1.0 Regulatory Updates **............................................................................................................................12** 1.1 Total Cost Reporting (TCR) â€“ Deductions Update (Funnel DOT 149\)........................................... 13 1.2 Quebec Joint Account Setup (Funnel DOT 153\) .............................................................................. 17 2.0 Privacy and Cybersecurity**.................................................................................................................18** 2.1 Update of Client Identity Verification Options (Funnel DOT 175\) .................................................. 19 3.0 Digitization Enhancements**................................................................................................................20** 3.1 Client Name Distributor Placed Fee Redemptions (Funnel DOT 155\) .......................................... 21 3.2 Successor Annuitant on RRIF and FHSA Accounts (Funnel DOT 163\) ........................................ 23 4.0 Product Expansion**..............................................................................................................................32** 4.1 Fund Setup Product Type Updates (Funnel DOT 178\).................................................................... 33 4.2 Fund Setup File Custom Date Expansion (Funnel DOT 180\) ......................................................... 35 5.0 Maintenance Items**..............................................................................................................................37** 5.1 Reporting Terminated Funds in the PS File (Funnel DOT 158\) ...................................................... 38 5.2 Settlement Report (GS) File Schema Alignment â€“ Phase 2 (Funnel DOT 183\)............................ 40 6.0 myserv Changes (including Privacy and Cybersecurity)**...............................................................42** 6.1 myserv â€“ Total Cost Reporting (TCR) â€“ Deductions Update (Funnel DOT 149\).......................... 43 6.2 myserv â€“ Successor Annuitant on RRIF and FHSA Accounts (Funnel DOT 163\) ....................... 49 6.3 myserv â€“ Minimizing Data Exchange â€“ Phase 1 (Funnel DOT 165\)............................................... 51 7.0 Appendices**...........................................................................................................................................68** 

Appendix 1: Transaction Reconciliation (TS) File \- Sell Fund Section Edits...........................................................69 Appendix 2: Transaction Reconciliation (TS) File \- Transfer Fund Section Edits...................................................70 Appendix 3: Transaction Reconciliation (TS) File \- Distribution Fund Section Edits..............................................71 Appendix 4: Settlement Instruction (FS) File \- Sell Fund Section Edits..................................................................72 Appendix 5: TFS/NFU Account Setup \- Joint Section Edits..................................................................................74 Appendix 6: TFS Order Request Section Edits......................................................................................................76 Customer Use Only October 7, 2025 2 of 179  
Appendix 7: TFS AOT Section Edits......................................................................................................................81 Appendix 8: TFS Redemption Section Edits.........................................................................................................82 Appendix 9: TFS Error Corrections Processing Rules â€“ TFS Error Corrections Table..........................................84 Appendix 10: NFU Request Section Edits............................................................................................................86 Appendix 11: TFS/NFU Account Setup Section Edits..........................................................................................89 Appendix 12: TFS Account Transfer Section Edits...............................................................................................91 Appendix 13: NFU Add Successor (AddSucsr) Section Edits..............................................................................93 Appendix 14: Transaction Reconciliation (TS) and Historical Transaction Reconciliation (HS) Files...................94 Appendix 15: Account Demographic Reconciliation (NS) File Section Edits......................................................106 Appendix 16: NFU Add TFSA Successor Processing Rules..............................................................................117 Appendix 17: NFU Business Processes.............................................................................................................119 Appendix 18: Fund Setup (FD) File \- Investment Product Section Edits............................................................121 Appendix 19: Product Update (MD) File \- Investment Product Section Edits....................................................124 Appendix 20: Fund Setup (FD) File \- Model Section Edits.................................................................................126 Appendix 21: Product Update (MD) File \- Model Section Edits..........................................................................131 Appendix 22: Fund List Layout...........................................................................................................................133 Appendix 23: myserv Transaction Details (TrxnDet) Results Layout Guidelines................................................136 Appendix 24: myserv Account-Level Redemption (Account Redeem) Results Layout Guidelines....................138 

Appendix 25: myserv Redemption Calculator (RedemptionCalculator) Results Layout Guidelines...................141 Appendix 26: myserv Demographics (Demographics) Results Layout Guidelines.............................................142 Appendix 27: myserv Demographics Processing Rules.....................................................................................152 Appendix 28: myserv Account Inquiry (AcctInq) Layout Guidelines...................................................................167 Appendix 29: myserv Account Inquiry Results (AcctInqResults) Layout Guidelines..........................................168 Appendix 30: myserv Automatic Activity Plan Detail (AutoActivityDet) Results Layout Guidelines....................172 Appendix 31: myserv Distribution Instructions (Distribution) Results Layout Guidelines....................................173 Appendix 32: myserv Account Inquiry Processing Rules....................................................................................174 

Customer Use Only October 7, 2025 3 of 179  
0.0 DOCUMENT INFORMATION 

This document outlines the business requirements for the Fundserv Standards Version 36 release, which  encompasses V36 changes. 

Use or distribution of this document is subject to the terms and conditions of the Fundserv Standards. Copyright Fundserv Inc. 2025-2026.  

Customer Use Only October 7, 2025 4 of 179  
0.1 REVISION HISTORY 

| Version  | Date  | Section  | Summary of Update |
| :---- | :---- | :---- | :---- |
| 0.1  | July 8, 2025  |  | Version for Industry Comment |
| 1.0  | October 7, 2025  |  | Final Version incorporating changes from V36  Industry Comment Period.  |
| 1.0  | October 23, 2025  |  | Update made to Death Beneficiary Detail Section  edit in TFS/NFU Account Setup and TFS Account  Transfer to resolve an edit conflict.  |

Customer Use Only October 7, 2025 5 of 179  
0.2 MILESTONES 

Fundserv Standards V36 will take effect over the weekend of June 14, 2026, with a go-live date of June  15, 2026\. 

| Milestones  | Dates  |
| :---- | :---- |
| First draft requirements publication  | July 8, 2025 |
| Industry comment period  | July 8-August 8, 2025 |
| Industry V Release Forum  | July 22, 2025 |
| Industry SME Group (ISG) review of industry  consolidated feedback  | August 19, 2025 |
| SSC review of industry consolidated feedback  | September 18, 2025 |
| Fundserv final approval of scope  | September 18, 2025 |
| Final Standards publication  | October 7, 2025 |
| External UAT  | March 25, 2026 |
| Implementation weekend  | June 12-14, 2026 |
| Go-live date  | June 15, 2026 |

Customer Use Only October 7, 2025 6 of 179  
0.3 CONTACT INFORMATION 

Comments and questions about this document can be sent to: 

Email: Fsstandards@fundserv.com 

Phone: 416-362-2400 

Toll-Free: 1-866-362-3863 

Customer Use Only October 7, 2025 7 of 179  
0.4 SCOPE 

This document highlights the key changes within the Fundserv Standards V36 release.  

1\. Regulatory Updates 

2\. Privacy and Cybersecurity 

3\. Digitization Enhancements 

4\. Product Expansion 

5\. Maintenance Items 

6\. myserv Updates (including Privacy and Cybersecurity) 

Customer Use Only October 7, 2025 8 of 179  
0.5 IMPACT ASSESSMENT 

The following table summarizes the applications and file types impacted by the proposed changes and  enhancements:  

![][image1]Customer Use Only October 7, 2025 9 of 179  
0.6 UNDERSTANDING TEXT STYLE AND XML SCHEMA DIAGRAMS 

.1 Document Text Style  

Black is the main font colour used throughout the document. Other font colours and effects are  used in the document: 

â€¢ Red font \- used to show updates to existing text. For example, updates to an existing processing rule, existing table, or business edits are written in red font color. 

â€¢ ~~Strikethrough~~ \- used for deletions. 

â€¢ Yellow highlight \- used to show any updates to text in subsequent point releases (refer to Milestones section for dates). 

â€¢ Green highlight â€“ used to show changes in elements/sections in schema diagrams. 

.2 XML Schema Diagram Symbols  

| Diagram  | Example  | Description |
| :---- | ----- | :---- |
| Solid box  | ![][image2] | This information is required and must be sent by  the file sender. |
| Dotted box  | ![][image3] | This information is conditional (or optional) and  should be returned by the file sender where  appropriate. |
| Multiple   Occurrences | ![][image4] | The number range at the bottom right-hand side  indicates the number of occurrence(s) allowed  for this piece of information. If a number range  is not indicated, it defaults to one occurrence.  For example, AddressLn must occur at least  one time, and can occur up to three times.  |
| Sequence   Compositor  | ![][image5] | The child elements must be in a specific order  within the parent element.  For example, when Advisor is returned, the  information must be in the sequence DlrCode,  RepCode, and BranchCode. |
| Choice   Compositor  | ![][image6] | Only one from a possible set of child elements  is allowed.  For example, either Estate only or DthBen only  must be returned. Also, DthBen must occur at  least one time, and can occur up to ten times. |

Customer Use Only October 7, 2025 10 of 179  
0.7 FUNDSERV FUNNEL 

Ideas for enhancements to the Fundserv Standards and to the applications and services we provide to  the industry come from a variety of sources. At any given time, there are dozens of these ideas being  reviewed at Fundserv or being discussed by our working groups, councils, or committees. In fact, we  often have so many ideas on the go that our members have sometimes told us itâ€™s hard for them to keep  track. 

To help provide more transparency on this process, weâ€™ve developed the Fundserv Funnel. The  Fundserv Funnel is a monthly publication that shows all the ideas in the hopper right now, as well as  what stage theyâ€™re at in the process. Youâ€™ll see that each idea is represented by a â€œDOTâ€ in the Fundserv  Funnel â€“ clicking on any DOT can help you learn more about the idea, including any assessment thatâ€™s  happened so far, and also gives you the chance to give us your feedback on that idea. For more about  the Fundserv Funnel â€“ including watching our introductory video, looking at past versions, or subscribing  to get notified when itâ€™s updated â€“ please click the following link.  

https://estandards.fundserv.com/secure/english/fsrv\_funnel.shtml 

To help our members connect the DOTs from inception to implementation, Funnel DOTs will be  represented in this document in the upper right-hand corner of the section title, where applicable.  

![][image7]Customer Use Only October 7, 2025 11 of 179  
1.0 REGULATORY UPDATES 

Customer Use Only October 7, 2025 12 of 179  
1.1 TOTAL COST REPORTING (TCR) â€“ DEDUCTIONS UPDATE (FUNNEL DOT 149\)  

Background: 

As part of the Total Cost Reporting (TCR) regulatory changes, distributors are required by the  Canadian Securities Administrators (CSA) to report any direct investment fund charges to the  investor, including a short explanation of the types of fees that were charged. 

Fundserv updated the Fee Details section in V35.1 to ensure all specific types of fees are  communicated for fee transactions (fee rebates, distributor-initiated fee redemptions, and  manufacturer-initiated fee redemptions). However, industry members requested that a similar  update be made for the Deductions section. The Deductions section is used on redemptions,  switches, transfers, distributions and fee transactions to report all individual deductions held  back/retained from the Gross Amount of a particular transaction, which could include direct  investment fund charges.  

In order to support the ability to communicate and report fees with a clear and specific  description without manual follow-up, the Deductions section will be updated to minimize usage  of the generic â€œOther Feeâ€ deduction type and four new fee deduction types will be added.  

Note: The Canadian Council of Insurance Regulators (CCIR) guidance for Enhanced Statement  Reporting of fees may differ for Individual Variable Insurance Contracts (IVIC). Fundserv  recommends referring to the regulatory guidance to ensure compliance. 

.1 Proposed Changes 

.1 Minimize usage of the deduction type â€œOther Feeâ€ because it does not provide a clear  enough description for Total Cost Reporting regulatory requirements. 

.2 Add the following new deduction types to ensure manufacturers have sufficient options  to communicate the exact type of fee that was deducted or held back as part of a  transaction. 

a. Early Redemption Fee 

b. Dealer Advisory Fee 

c. Market Value Adjustment 

d. IRS Tax 

.3 Align myserv with the proposed changes. Refer to BRD Section 6.1 for more information  on the myserv alignment.  

Customer Use Only October 7, 2025 13 of 179  
Total Cost Reporting (TCR) â€“ Deductions Update (Funnel DOT 149\) 

.2 Field Definitions 

.1 Add the following new fields and definitions to the â€œData Standards Library.â€  

| Field Name  | Element Page Description |
| ----- | ----- |
| Early Redemption Fee  | The EarlyRdmtnFee element lists any early redemption fees paid by the investor.  |
| Dealer Advisory Fee  | The DlrAdvsrFee element lists any dealer advisory fees paid by the investor. |
| Market Value   Adjustment | The MVA element lists any market value adjustment amounts withheld from  redemption or money-out transactions.  |
| IRS Tax  | The IRSTax element contains the IRS Tax amounts withheld from redemption or  money-out transactions. |

.3 Schema Changes 

.1 In the shared schema for the Transaction Reconciliation (TS), Historical Transaction  Reconciliation (HS), and Settlement Instruction (FS) files (FStypes.xsd), within the  

Deductions section, add new fields for additional specific deduction fee types.  

a. The Transaction Reconciliation (TS) and Historical Transaction Reconciliation (HS) file Deductions section update is applicable to the Sell Fund (SellFund), Transfer 

Fund (TrnsfrFund), and Distribution Fund (DistribFund) sections. 

b. The Settlement Instruction (FS) file Deductions section update is applicable to the Sell Fund (SellFund) section. 

| Field Name  | Element   Name | Occurrence  | Frequency  | Content   Type | Length  | Data   Type | Parent   Element |
| ----- | ----- | :---: | :---: | :---: | :---: | ----- | ----- |
| Early Redemption  Fee | EarlyRdmtnFee  | Optional  | 0-1  | simple   element | minLength \= 4  maxLength \= 13 | amt9v2n  | Dedns |
| Dealer Advisory  Fee | DlrAdvsrFee  | Optional  | 0-1  | simple   element | minLength \= 4  maxLength \= 13 | amt9v2n  | Dedns |
| Market Value   Adjustment | MVA  | Optional  | 0-1  | simple   element | minLength \= 4  maxLength \= 13 | amt9v2n  | Dedns |
| IRS Tax  | IRSTax  | Optional  | 0-1  | simple   element | minLength \= 4  maxLength \= 13 | amt9v2n  | Dedns |

Customer Use Only October 7, 2025 14 of 179  
Total Cost Reporting (TCR) â€“ Deductions Update (Funnel DOT 149\) 

TS/HS/FS File Schema Diagram â€“ Deductions Section 

![][image8]  
Refer to Appendix 1: Transaction Reconciliation (TS) File â€“ Sell Fund Section Edits.  Refer to Appendix 2: Transaction Reconciliation (TS) File â€“ Transfer Fund Section Edits.  Refer to Appendix 3: Transaction Reconciliation (TS) File â€“ Distribution Fund Section  Edits.  

Refer to Appendix 4: Settlement Instruction (FS) File â€“ Sell Fund Section Edits.  

.2 Align myserv with the proposed changes. Refer to Section 6.1 myserv â€“ Total Cost  Reporting (TCR) â€“ Deductions Updates (Funnel DOT 149\) for more information on the  myserv alignment.  

Customer Use Only October 7, 2025 15 of 179  
Total Cost Reporting (TCR) â€“ Deductions Update (Funnel DOT 149\) 

.4 Documentation Changes 

.1 Add a new processing rule in the Settlement Record Content Rules section of the  Settlement Instruction (FS) Processing Rules page to minimize the usage of the Other  Fee field within the Deductions section.  

â€œWithin the Deductions Section, the â€œOther Feeâ€ field must only be used for segregated fund  accounts, or for new fee types that are not yet defined within the Deductions Section.  

Manufacturers must not use the â€œOther Feeâ€ field to report fees that fall under an existing  defined Deductions type.â€  

.2 Add a new processing rule in the Transaction Reconciliation (TS) File Processing Rules section of the Transaction Reconciliation (TS) Processing Rules page to minimize the  usage of the Other Fee field within the Deductions section.  

â€œWithin the Deductions Section, the â€œOther Feeâ€ field must only be used for segregated fund  accounts, historical transactions placed prior to June 15, 2026, or for new deduction types that  are not yet defined within the Deductions section. Manufacturers must not use the â€œOther Feeâ€  field to report fees that fall under an existing defined Deductions type.â€  

Customer Use Only October 7, 2025 16 of 179  
Quebec Joint Account Setup (Funnel DOT 153\) 

1.2 QUEBEC JOINT ACCOUNT SETUP (FUNNEL DOT 153\)  

Background:  

Manufacturers advised they are receiving Account Setup requests over Fundserv for Quebec  Joint Accounts with invalid Joint Survivor Types. Quebec Joint accounts are only eligible to be  set up with the Joint Survivor Type â€œTenants in Common.â€ Receiving invalid data causes trade  rejections and manual follow-up to correct the issue.  

To minimize the flow of bad data over Fundserv, manufacturers have requested that Fundserv  add an edit to restrict Joint Survivor Types that are ineligible for new Quebec Joint accounts.  

.1 Proposed Changes 

.1 Add an edit for new Joint accounts where the tax jurisdiction of the beneficial owner is  Quebec to only accept the â€œTenants in Commonâ€ Joint Survivor Type.  

.2 Validation Changes 

.1 Add a TFS/NFU Account Setup Joint Owner Section edit on the Joint Survivor Type field  to only allow new Quebec Joint accounts to be set up as â€œTenants in Common.â€  

Refer to Appendix 5: TFS/NFU Account Setup â€“ Joint Section Edits.  

Customer Use Only October 7, 2025 17 of 179  
2.0 PRIVACY AND CYBERSECURITY 

Customer Use Only October 7, 2025 18 of 179  
2.1 UPDATE OF CLIENT IDENTITY VERIFICATION OPTIONS (FUNNEL DOT  175\)  

Background:  

As part of privacy and security reviews, Fundserv noted that there is a misalignment in the  segregated fund account setup process for client identity verification with the terminology found  in the Financial Transactions and Reports Analysis Centre of Canada (FINTRAC) guidance.  

The current process on Fundserv for client identity verification supports the option to use  provincial health card as a means of identity verification. However, this ID type is only supported  in certain provinces where the provincial legislation allows the use of health cards for verification  methodology for financial purposes.  

To align with the FINTRAC terminology and guidance, Fundserv proposes updating the  description of the â€œprovincial health cardâ€ identity verification ID Type option to â€œprovincial or  territorial identity card.â€ This update allows provinces accepting health cards for identity  verification to use that method of identification and also allows provinces that do not accept the  health card for identity verification to use alternative supported options of provincial or territorial  identity cards.  

Note: This update is intended to align to the correct terminology and does not represent a  change in account set up client identity process requirements nor does it represent a change in  regulatory responsibility. To adhere to the Proceeds of Crime (Money Laundering) and Terrorist  Financing Act Section 61.1(a), members must continue to only verify an identity using a health  card if provincial legislation does not prohibit it.  

.1 Proposed Changes 

.1 Update the description of the client identity verification ID type options to align with  FINTRAC guidance terminology.  

.2 Documentation Changes 

.1 For the Identity Type (IDType) field found within TFS/NFU Account Setup for client name  segregated fund accounts, update the description of allowable value â€œCâ€ to align with  the FINTRAC guidance terminology.  

Allowable Values 

| Value  | Description |
| :---- | :---- |
| A  | Driverâ€™s license |
| B  | Birth certificate |
| C  | Provincial or territorial identity card ~~Provincial health card~~ |
| D  | Passport |
| E  | Other |
| F  | Record of Landing or Permanent Residence card |

Customer Use Only October 7, 2025 19 of 179  
3.0 DIGITIZATION ENHANCEMENTS 

Customer Use Only October 7, 2025 20 of 179  
Client Name Distributor Placed Fee Redemptions (Funnel DOT 155\) 

3.1 CLIENT NAME DISTRIBUTOR PLACED FEE REDEMPTIONS (FUNNEL DOT 155\)  

Background:  

Dealer/Intermediary Placed Fee Redemptions refer to a special type of redemption transaction  placed on Fundserv (4/blank/blank) that is used to redeem dealer/intermediary initiated fees  from an investors account. All proceeds of the redemption (net of deductions) are paid as a  trade activity to the dealer/intermediary. Currently, Dealer/Intermediary Placed Fee Redemptions  on Fundserv can only be submitted for Intermediary/Nominee accounts.  

Industry members have indicated that due to the evolution of regulations within the industry and  changes to fee structures, there is growing interest to also process Dealer Placed Fee  Redemption transactions on Fundserv for Client Name accounts.  

To facilitate Dealer Placed Fee Redemptions over Fundserv for Client Name accounts, the Fee  Redemption transaction type will need to be opened to support the new account designation  scope and the transaction type will also need to be added to the Electronic Processing  Agreement (EPA). For Client Name accounts, manufacturers require investor signed  authorization for redemption transactions. Since Fee Redemptions may be submitted on a  scheduled basis, EPA eligibility is required to ensure dealers do not have to submit investor  signed authorization forms each time a Client Name Fee Redemption is placed over Fundserv.  

.1 Proposed Changes 

.1 Update TFS to allow dealers to place dealer-initiated Fee Redemption transactions on  Fundserv for Client Name accounts, settling via N$M; and to submit error corrections for  Client Name dealer-initiated Fee Redemptions.  

.2 Add Client Name Dealer Placed Fee Redemption transactions (4/blank/blank) to the list  of EPA Eligible Transactions.  

.2 Validation Changes 

.1 For TFS Order, update the Account Designation field edit to allow Fee Redemption  transactions to be placed for Client Name accounts.  

Refer to Appendix 6: TFS Order Request Section Edits.  

.2 For TFS As-of-trades (AOTs), update the AOT Section edit to allow backdated Client  Name Fee Redemption transactions.  

Refer to Appendix 7: TFS AOT Section Edits.  

.3 For TFS Redemptions, add a new Settlement Method edit to require that Client Name  Fee Redemptions placed on Fundserv must settle via N$M.  

Refer to Appendix 8: TFS Redemption Section Edits.  

Customer Use Only October 7, 2025 21 of 179  
Client Name Distributor Placed Fee Redemptions (Funnel DOT 155\) 

.3 Documentation Changes 

.1 Add Client Name Fee Redemptions to the list of EPA Eligible Transaction Types.  

| CATEGORY  | TRANSACTIONS |
| ----- | :---- |
| **Redemptions (Sell)  Transaction Type \= 6  Fee Redemptions   Transaction Type \= 4  Switches  Transaction Type \= 8  Trans Type Dtl \= 1  Transfers  Transaction Type \= 8  Trans Type Dtl \= 4, 8, 9** | **Redemptions: II** â€¢ Account Types 01, 02, 04, 17, 22  **Switches:**  â€¢ All account types  â€¢ Individual, Joint and Corporate accounts (recipient codes 1, 2, 3 or 7\)  **ICT**  â€¢ Redemption side any amount  **Account Transfers:**  Account Types â€“ Internal Transfers (AcctDesig 1 to 1\)  1\. Open (01) to account types FHSA (22), TFSA (17), Open (01), and Non-Spousal RRSP (02) 2\. RRSP (02) (including non-spousal, spousal, group, and group spousal) to account   types RRSP (02) (including non- spousal, spousal, group, and group spousal)   3\. Non-Spousal RRSP (02) to FHSA (22)   4\. TFSA (17) to account types TFSA (17), Open (01), Non-Spousal RRSP (02), and FHSA (22)  5\. FHSA (22) to account types FHSA (22), Non-Spousal RRSP (02), and TFSA (17)  6\. Client Name RRSP (02) to Client Name RRIF (04)   7\. Client Name FHSA (22) to Client Name RRIF (04)  â€¢ Client name to Intermediary (AcctDesig 1 to 3\)  â€¢ Internal transfer Intermediary to Client Name (AcctDesig 3 to 1\)  â€¢ External transfers Client Name to Intermediary (AcctDesig 1 to 3\)  â€¢ Non-ATON internal and external transfer Client Name to Nominee (AcctDesig 1 to2) â€¢ Internal Nominee to Client Name (AcctDesig 2 to 1\) |

.2 Update the TFS Error Correction Processing Rules table to include Client Name Fee  Redemption transactions as supported for both as-of-trades (AOTs) and reversals,  settling via N$M.  

Refer to Appendix 9: TFS Error Correction Processing Rules â€“ TFS Error Corrections  Table.  

.3 Add two new TFS Redemption processing rules under the Fee Processing Rules section  to provide direction on sales tax and deductions for Client Name Fee Redemption  transactions. 

â€œThe dealer must include the sales tax in the amount when placing a Fee Redemption  

transaction for a non-registered account, and the dealer is responsible for collecting and  remitting any sales tax to the appropriate jurisdiction.â€ 

â€œFor the Gross/Net Redemption Proceeds indicator, if a Fee Redemption transaction is placed  as â€œG â€“ Gross,â€ deductions may be applied resulting in the dealer receiving a lower amount than  what was indicated in the order. If a specific fee amount is required, the dealer should place the  Client Name Fee Redemption transaction as â€œN \- Netâ€ to ensure the specified amount is  received after deductions are applied.â€  

Customer Use Only October 7, 2025 22 of 179  
Successor Annuitant on RRIF and FHSA Accounts (Funnel DOT 163\) 

3.2 SUCCESSOR ANNUITANT ON RRIF AND FHSA ACCOUNTS (FUNNEL DOT 163\)  

Background:  

RRIF and FHSA account applications include a section to add a successor, but Fundserv does  not support this functionality. Currently, a successor can only be designated for segregated  funds or for Client Name TFSA accounts.  

With the expansion of EPA, distributors and manufacturers need all supported fields available  for creating a new account or transferring accounts over Fundserv to ensure that the account  can be created without requiring follow-up documentation.  

Industry members have requested that the current TFSA Successor section be updated with the  expanded scope to also support Client Name RRIF and FHSA accounts (along with the existing  support for Client Name TFSA accounts).  

.1 Proposed Changes 

.1 Rename the existing TFSA Successor Section used within the following processes/files  on Fundserv and expand the usage to also support sending Successor details for Client  Name RRIF and FHSA account types: 

a. TFS/NFU Account Setup 

b. TFS Account Transfer 

c. NFU Add TFSA Successor message type 

d. Transaction Reconciliation (TS) file/Historical Transaction Reconciliation (HS) file e. Account Demographic (NS) file  

.2 Align processing rules and error/warning codes to the expanded scope and updated  name of the Successor section.  

.3 Align myserv with the proposed changes. Refer to BRD Section 6.2 for more information  on the myserv alignment.  

.2 Field Definition(s) 

.1 Update the following existing field definition in the â€œData Standards Library.â€ 

| Field Name  | Element Page Description |
| :---: | ----- |
| Successor  ~~TFSA Successor~~ | The Sucsr ~~TFSASucsr~~ element lists the successor ~~owner~~ of a TFSA, RRIF, or  FHSA account. |
| Add Successor  A~~dd TFSA~~   ~~Successor~~ | The AddSucsr A~~ddTFSASucsr~~ element is used to add successor ~~owner~~ to a  TFSA, RRIF, or FHSA account. Refer to the AddSucsr A~~ddTFSASucsr~~ business  process for usage rules. |

Customer Use Only October 7, 2025 23 of 179  
Successor Annuitant on RRIF and FHSA Accounts (Funnel DOT 163\) 

.3 Schema Changes 

.1 In the NFU schema, rename the existing Add TFSA Successor (AddTFSASucsr) field to  be more generalized to facilitate support of additional account types.  

| Field Name  | Element Name  | Occurrence  | Frequency  | Content   Type | Parent   Element |
| :---: | :---: | :---: | :---: | ----- | ----- |
| Add Successor A~~dd TFSA~~   ~~Successor~~ | AddSucsr  A~~ddTFSASucsr~~ | Optional  | 0-1  | compound   element | BusProcess |

NFU Schema Diagram â€“ Business Process Section  

![][image9]  
Refer to Appendix 10: NFU Request Section Edits.  

Customer Use Only October 7, 2025 24 of 179  
Successor Annuitant on RRIF and FHSA Accounts (Funnel DOT 163\) 

.2 In the TFS (tfs.xsd) and NFU (nfu.xsd) schemas, rename the existing TFSA Successor  (TFSASucsr) field within the Account Setup (AcctSetup) section to be more generalized  to facilitate support of additional account types. 

| Field Name  | Element   Name | Occurrence  | Frequency  | Content   Type | Parent Element |
| :---: | ----- | :---: | :---: | ----- | :---: |
| Successor  ~~TFSA Successor~~ | Sucsr  ~~TFSASucsr~~ | Optional  | 0-1  | compound   element | AcctSetup |

TFS/NFU Schema Diagram â€“ Account Setup Section  

![][image10]  
Refer to Appendix 11: TFS/NFU Account Setup Section Edits.  

Customer Use Only October 7, 2025 25 of 179  
Successor Annuitant on RRIF and FHSA Accounts (Funnel DOT 163\) 

.3 In the TFS (tfs.xsd) schema, rename the existing TFSA Successor (TFSASucsr) field  within the Account Transfer (AcctTrnsfr) section to be more generalized to facilitate  support of additional account types. 

| Field Name  | Element   Name | Occurrence  | Frequency  | Content   Type | Parent Element |
| :---: | ----- | :---: | :---: | ----- | :---: |
| Successor  ~~TFSA Successor~~ | Sucsr  ~~TFSASucsr~~ | Optional  | 0-1  | compound   element | AcctTrnsfr |

TFS Schema Diagram â€“ Account Transfer Section  

![][image11]  
Refer to Appendix 12: TFS Account Transfer Section Edits. 

Customer Use Only October 7, 2025 26 of 179  
Successor Annuitant on RRIF and FHSA Accounts (Funnel DOT 163\) 

.4 In the NFU (nfu.xsd) schema, rename the existing TFSA Successor (TFSASucsr) field  within the Add Successor (AddSucsr) section to be more generalized to facilitate support  of additional account types.  

| Field Name  | Element   Name | Occurrence  | Frequency  | Content   Type | Parent Element |
| :---: | ----- | :---: | :---: | ----- | :---: |
| Successor  ~~TFSA Successor~~ | Sucsr  ~~TFSASucsr~~ | Mandatory  | 1  | compound   element | AddSucsr  A~~ddTFSASucsr~~ |

NFU Schema Diagram â€“ Add Successor Section  

![][image12]Refer to Appendix 13: NFU Add Successor (AddSucsr) Section Edits.  

Customer Use Only October 7, 2025 27 of 179  
Successor Annuitant on RRIF and FHSA Accounts (Funnel DOT 163\) 

.5 In the AcctDemoRec.xsd schema, which is utilized by the Transaction Reconciliation  (TS), Historical Transaction Reconciliation (HS), and Account Demographic  

Reconciliation (NS) files, rename the existing TFSA Successor (TFSASucsr) field within  the Demographic (Demo) section to be more generalized to facilitate support of  

additional account types.  

| Field Name  | Element   Name | Occurrence  | Frequency  | Content   Type | Parent Element |
| :---: | ----- | :---: | :---: | ----- | :---: |
| Successor  ~~TFSA Successor~~ | Sucsr  ~~TFSASucsr~~ | Optional  | 0-1  | compound   element | Demo |

TS/HS/NS File Schema Diagram â€“ Demo Section 

![][image13]  
Refer to Appendix 14: Transaction Reconciliation (TS) and Historical Transaction  Reconciliation (HS) Files â€“ Demo Section Edits.  

Refer to Appendix 15: Account Demographic Reconciliation (NS) File Section Edits.  

.6 Align myserv with the proposed changes. Refer to the BRD Section 6.2 for more  information on the myserv alignment.  

Customer Use Only October 7, 2025 28 of 179  
Successor Annuitant on RRIF and FHSA Accounts (Funnel DOT 163\) 

.4 Validation Changes 

.1 In TFS/NFU Account Setup, update the existing Death Beneficiary Detail section and  Successor section edits to: 

a. Allow successor information to also be sent for new Client Name RRIF and Client Name FHSA account types (in addition to the existing functionality for Client Name TFSA accounts). 

b. Require that either Death Beneficiary or Successor information is sent for new non segregated Client Name RRIF and Client Name FHSA accounts outside of Quebec. 

c. Restrict sending Successor information for Quebec non-segregated Client Name RRIF and Client Name FHSA accounts that are not locked-in. 

Refer to Appendix 11: TFS/NFU Account Setup Section Edits.  

.2 In TFS Account Transfer, update the Death Beneficiary Detail section and Successor section edits to: 

a. Allow Successor information to also be sent for Client Name to Client Name Internal Transfers into a Client Name RRIF or Client Name FHSA account (in addition to the existing functionality for Client Name TFSA accounts). 

b. Restrict sending Successor information for Quebec non-segregated Client Name RRIF and Client Name FHSA transfers. 

Refer to Appendix 12: TFS Account Transfer Section Edits.  

.3 In NFU Request, update the Business Process section edits to reference the updated  generic Successor section name. 

Refer to Appendix 10: NFU Request Section Edits.  

.4 Note: All existing Successor section edits will be applied when setting up a successor  for the newly supported Client Name RRIF and FHSA account types via TFS/NFU  Account Setup or the NFU Add Successor message type. 

Refer to Appendix 13: NFU Add Successor (AddSucsr) Section Edits. 

.5 Note: All existing Successor section edits will be applied when reconciling a successor  for the newly supported Client Name RRIF and FHSA account types via the Transaction  Reconciliation (TS) file, Historical Transaction Reconciliation (HS) file, and Account  Demographic Reconciliation (NS) file. 

Refer to Appendix 14: Transaction Reconciliation (TS) and Historical Transaction  Reconciliation (HS) Files â€“ Demo Section Edits.  

Refer to Appendix 15: Account Demographic Reconciliation (NS) File Section Edits.  Customer Use Only October 7, 2025 29 of 179   
Successor Annuitant on RRIF and FHSA Accounts (Funnel DOT 163\) 

.5 Documentation Changes 

.1 Update the NFU Add Successor (AddSucsr) message processing rules to reflect the  updated section name and expanded scope of additional supported account types, as  well as manufacturer requirements to validate the supported account types. 

Refer to Appendix 16: NFU Add Successor Processing Rules.  

.2 Update the NFU Business Processes processing rules to reflect the updated generic  section name for adding a successor.  

Refer to Appendix 17: NFU Business Processes.  

.3 Update the NFU AddNewAcct Processing Rules, General Processing Rule \#6 to reflect  the updated generic section name for adding a successor. 

â€œFundserv cannot enforce edits referencing Fund Identifier within the Death Beneficiary and  ~~TFSA~~ Successor sections within Account Setup when being sent as part of the AddNewAccount  NFU.â€  

.4 Update the TFS Transfer Processing Rules Demographics section to reflect the updated  generic section name for adding a successor. 

â€œExcept for nominee to nominee (2-2) and intermediary to intermediary (3-3) non-ATON internal  transfers and ATON transfers on marriage breakdown, the beneficial owner cannot change when  an account is transferred electronically. When transferring to a new account, to ensure the  beneficial owner does not change, the account demographics must be copied from the old  account. When transferring to an existing account, the account demographics must remain the  same; they are not copied from the old account. 

Demographic information includes the following elements:   
Annuitant's Date of Birth 

Annuitant's SIN 

(Beneficial Owner) Address Line 1 

(Beneficial Owner) Address Line 2   
(Beneficial Owner) Address Line 3 

(Beneficial Owner) City 

(Beneficial Owner) Country Code 

(Beneficial Owner) Postal Code 

(Beneficial Owner) Province   
Beneficial Owner's Birth Date 

Beneficial Owner's First Name 

Beneficial Owner's Last Name 

Beneficial Owner's SIN   
Beneficial Ownerâ€™s Organization Name 

Beneficial Ownerâ€™s Federal Business Number or Federal Trust Account Number 

Beneficial Ownerâ€™s Provincial Business Number or Provincial Trust Account Number 

Beneficiary Relationship   
Beneficiary Type 

Beneficiary's First Name 

Beneficiary's Last Name 

In Trust For First Name   
In Trust For Last Name 

In Trust For Title Code 

Joint/Spousal Birth Date 

Customer Use Only October 7, 2025 30 of 179  
Successor Annuitant on RRIF and FHSA Accounts (Funnel DOT 163\) 

Joint/Spousal First Name 

Joint/Spousal Last Name 

Joint/Spousal SIN 

Joint/Spousal Title Code   
Joint Signature Type 

Joint Survivor Type 

Jurisdiction Province Code 

Language Code   
Locked-in Code 

Locked-In Jurisdiction 

Recipient Code 

Spousal Account Flag 

Tax Code   
Title Code 

~~TFSA~~ Successorâ€™s Birth Date 

~~TFSA~~ Successorâ€™s First Name 

~~TFSA~~ Successorâ€™s Last Name   
~~TFSA~~ Successorâ€™s SIN  

NOTE: 

Under some situations (such as client-name transfers involving a change in account type),  manufacturers may have to use their discretion to copy account demographics that are  

applicable and allowable under their business model and/or legislative/regulatory standards. For  example, ~~TFSA~~ Successor information should not be copied to the new account when there is a  transfer from TFSA to open account as this piece of information is not applicable to open  accounts ~~applicable to TFSA only~~. Another example is that beneficiary cannot change upon  transfers for certain investment products. In this case, it is at the manufacturerâ€™s discretion to  determine whether such information can be carried over to the new account.â€ 

.5 Update the TFS/NFU Not Supported processing rules to reflect the updated generic  section name for adding a successor. 

AddSucsr A~~ddTFSASucsr~~ Requests (NFU only) 

| Field  | Condition  |
| :---- | :---- |
| Gender  | All ~~TFSA~~ Successor requests |
| Address  | All ~~TFSA~~ Successor requests |
| Language Code  | All ~~TFSA~~ Successor requests |
| Email Address  | All ~~TFSA~~ Successor requests |

.6 Update the following existing Warning / Error Codes to support the broadened account  type scope of the Successor section. 

| Warning/error code  | Description |
| :---- | :---- |
| 251  | ~~TFSA~~ Successor information cannot be added or updated |
| 403  | Missing/Invalid ~~TFSA~~ Successor section |
| 404  | Missing/Invalid ~~TFSA~~ Successor SIN |
| 405  | Missing/Invalid ~~TFSA~~ successorâ€™s birth date |
| 406  | Missing/Invalid country in ~~TFSA~~ successorâ€™s country code |
| 407  | Missing/Invalid postal/zip code in ~~TFSA~~ successorâ€™s address |

Customer Use Only October 7, 2025 31 of 179  
4.0 PRODUCT EXPANSION 

Customer Use Only October 7, 2025 32 of 179  
Fund Setup Product Type Updates (Funnel DOT 178\) 

4.1 FUND SETUP PRODUCT TYPE UPDATES (FUNNEL DOT 178\)  

Background:  

In an effort to provide clear and definitive fund data points for distributors to facilitate Know  Your Product (KYP) reviews and approvals, Fundserv executed a campaign to reduce the  volume of funds classified using the generic â€˜Product Type \= Otherâ€™ value on our network.  

Fundserv contacted all manufacturers utilizing the â€˜Otherâ€™ Product Type to determine if the  funds could be updated to utilize an existing Product Type; or to identify any missing Product  Types from the current list of allowable values.  

As a result of the industry feedback from those discussions, manufacturers approved one new  Product Type to add to the current list of allowable values and proposed to remove the generic  â€œOtherâ€ Product Type and one other existing Product Type value (ETF) that is not in use.  Members also recommended making the Product Type field nimbler to allow for new Product  Types to be added outside of Fundserv V Releases, similar to the Fund Classification field.  

.1 Proposed Changes 

.1 Add a new Product Type value to identify bullion fund products within the Fund Setup  (FD) and Product Update (MD) files.  

.2 Remove the Product Type value â€˜E â€“ Exchange-traded fund (ETF)â€™ because ETF  products are not traded over the Fundserv network. 

.3 Remove the Product Type value â€˜O â€“ Otherâ€™ to ensure that all funds are categorized  unambiguously. Processing rules will be updated to provide direction for manufacturers  on how to categorize a fund that does not fall under existing Product Type values.  

.4 Update the Product Type field format to be a string base field, which allows Fundserv  and members to add new allowable Product Type values without requiring a file schema  update. 

.2 Schema Changes 

.1 Update the Product Type (ProductType) element within the Fund Setup (FD) file,  Product Update (MD) file, and Fund List layout: 

a. Add a new Product Type allowable value for bullion funds.  

b. Remove the existing Product Type allowable values for exchange-traded funds  (ETFs) and other. 

c. Update the element format to a more flexible data type that supports the use of any  1-character letter value from the allowable list without requiring a schema change  when values are added or removed.  

Customer Use Only October 7, 2025 33 of 179  
Fund Setup Product Type Updates (Funnel DOT 178\) 

| Field   Name | Element   Name | Length  | Data Type  | Allowable Values |
| ----- | ----- | :---: | :---: | ----- |
| Product   Type | ProductType  | Length \= 1  | ~~See allowable~~  ~~values~~  producttype | A \- High Interest Savings Account (HISA) B \- Bullion   D \- Structured note  ~~E \- Exchange-traded Fund (ETF)~~  F \- Mortgage Fund/Mortgage Investment Corp. G \- Guaranteed Investment Certificate (GIC) H \- Hedge fund  I \- Flow-Through shares  J \- Private Fund (includes Private Credit, Private  Equity et cetera)  K \- Mortgage Backed Securities  L \- Labour Sponsored Investment Fund (LSIF) M \- Mutual fund  N \- Principal Protected note  ~~O \- Other~~  P \- Pooled fund  Q \- Non-principal Protected Note  R \- Real Estate Fund/REIT  S \- Segregated fund  V \- Venture Capital Fund  W \- Wrap product  X \- Liquid Alternative Mutual Fund |

.2 Add a new data type pattern to the XML Data Types page to support the more flexible  string base type pattern for the FD/MD file and Fund List layout Product Type element.  

| Data Type  | Base Type  | Pattern |
| :---: | :---: | :---: |
| producttype  | string  | \[A-Z\]{1} |

.3 Validation Changes 

.1 Align the Fund Setup (FD) and Product Update (MD) Product Type field schema edits  with the new data type pattern which allows for more flexibility to expand product type  options without requiring a schema change.  

Refer to Appendix 18: Fund Setup (FD) File \- Investment Product Section Edits.  

Refer to Appendix 19: Product Update (MD) File \- Investment Product Section Edits.  

.4 Documentation Changes 

.1 Add a new section to the Fund Setup (FD) Processing Rules to provide direction to  manufacturers on how to populate the Product Type field if an exact match is not  available.  

â€œProper Use of Product Type 

When adding a new fund, manufacturers must assign the Product Type that is the best  

available match for the fund product. Manufacturers can request the addition of new Product  Type values through Fundserv as required.â€ 

Customer Use Only October 7, 2025 34 of 179  
Fund Setup File Custom Date Expansion (Funnel DOT 180\) 

4.2 FUND SETUP FILE CUSTOM DATE EXPANSION (FUNNEL DOT 180\)  

Background:  

As manufacturers continue to expand into the exempt market and alternative product spaces,  we are seeing new funds being set up on the Fundserv network with unique characteristics. One  type of growing product type is a daily fund with a cut-off date that is a defined number of days  before each Trade Date (e.g., cut-off date that is 30 days, 60 days, or 90 days before the Trade  Date). In order to set up this type of product on Fundserv, manufacturers must use a custom  priced fund model with a Cutoff Date, Price Date, and Settlement Date defined for each  business day of the year.  

The current Fund Setup (FD) and Product Update (MD) file structures support up to 250 Custom  Date sections. As some manufacturers prefer to set up their custom priced funds with one or  two years of dates defined, the current number of Custom Date sections is too restrictive.  

Manufacturers have requested to raise the maximum number of Custom Date sections within  the Fund Setup (FD) and Product Update (MD) files to better support alternative product  business.  

.1 Proposed Changes 

.1 Update the Fund Setup (FD) and Product Update (MD) file schemas and related  documentation to extend the maximum volume of Custom Date sections that can be  included within the files.  

.2 Schema Changes 

.1 In the Fund Setup (FD) file schema (fd.xsd), Product Update (MD) file schema (md.xsd) and Fund List Layout, update the maximum frequency of the Custom Date (CustomDate)  section to 500\. This change is applicable to the Fund Model, Buy Model, and Sell Model  sections.  

| Field Name  | Element Name  | Occurrence  | Frequency  | Content   Type | Parent   Element |
| :---: | :---: | :---: | :---: | ----- | ----- |
| Custom Date  | CustomDate  | Mandatory  | 1-500  ~~1-250~~ | compound   element | Custom |

Customer Use Only October 7, 2025 35 of 179  
Fund Setup File Custom Date Expansion (Funnel DOT 180\) 

Fund Setup (FD) File and Product Update (MD) File â€“ Custom Section Diagram ![][image14]  
Refer to Appendix 20: Fund Setup (FD) File â€“ Model Section Edits.  

Refer to Appendix 21: Product Update (MD) File â€“ Model Section Edits.  

Refer to Appendix 22: Fund List Layout.  

.3 Validation Changes 

.1 Align the Fund Setup (FD) and Product Update (MD) Custom Date field schema edits  with the new maximum frequency.  

Refer to Appendix 20: Fund Setup (FD) File â€“ Model Section Edits.  

Refer to Appendix 21: Product Update (MD) File â€“ Model Section Edits.  

.4 Documentation Changes 

.1 In the Pricing Models section of the Fund Setup (FD) File Processing Rules, align the  documentation to reference the updated maximum frequency of the Custom Date  section.  

â€œThe XML FD file supports a custom pricing frequency (Custom), which enables manufacturers  to use the CustomDate element to configure up to 500 ~~250~~ sets of CutOffDate, PriceDate,  and SettlDate for a single fund.â€  

Customer Use Only October 7, 2025 36 of 179  
5.0 MAINTENANCE ITEMS 

Customer Use Only October 7, 2025 37 of 179  
Reporting Terminated Funds in the PS File (Funnel DOT 158\) 

5.1 REPORTING TERMINATED FUNDS IN THE PS FILE (FUNNEL DOT 158\)  

Background:  

Manufacturers have identified a gap in the current Standards for how to report an account in the  Position Reconciliation (PS) file when fund(s) within the account have been terminated. When a  fund is terminated, manufacturers can either exclude the Fund Position section from the file for  the terminated fund or include the terminated fund in the Fund Position file with a zero balance.  

A manufacturer service provider advised that excluding the Fund Position section from the PS  file for terminated funds causes an adherence risk when terminating an account where all funds  within the account were terminated prior to the account closing. The current Standards state  that if an account is terminated, it must be reported in the PS file for 2 months with a zero  balance. The manufacturer must include at least one of the terminated funds in a Fund Position  section to fulfill the zero balance reporting, but this should not be required because the funds  are no longer active on the Fundserv network.  

Both manufacturers and distributors require clear Standards to ensure the Fundserv processing  rules align to consistent industry behaviour.  

.1 Proposed Changes 

.1 Update processing rules to remove the reference that manufacturers must include the  zero balance reporting for terminated accounts in the Position Reconciliation (PS) file.  

.2 Documentation Changes 

.1 Update Position Reconciliation (PS) file Processing Rule \#5 to advise how to report a  terminated account.  

â€œIf an account is terminated, the manufacturer must report it in the file for two    
consecutive months, including the month in which the account was terminated, after  

which the manufacturer will not report the account. 

Example 1:  

Client redeems all units in June. The manufacturer must report the account in the file for  June and July (two consecutive months) with a zero balance and an â€œActiveâ€ Account  

Status. Following that, the account will not be reported until the account is terminated  

(that is, after all tax and/or reporting has been completed). When the account is    
terminated, the manufacturer must report the account with a ~~zero balance and a~~ 

â€œTerminatedâ€ Account Status for two consecutive months.  

Example 2: 

Client redeems all units in June. The manufacturer must report the account in the file for  June and July (two consecutive months) with a zero balance and with an â€œActiveâ€  

Account Status. If a new purchase is placed into the account after a full redemption but  before the account is terminated, the account must be reported in the file with the new  

balance and an â€œActiveâ€ Account Status. If the account is redeemed in full again in    
September, the Manufacturer must report it for September and October (two consecutive  months) with a zero balance and â€œActiveâ€ Account Status. Following that, it must no  

longer be reported in the file until the account is terminated (that is, after all tax and/or  

Customer Use Only October 7, 2025 38 of 179  
Reporting Terminated Funds in the PS File (Funnel DOT 158\) 

reporting has been completed). When the account is terminated, the manufacturer must  report the account with a ~~zero balance and a~~ â€œTerminatedâ€ Account Status for two  

consecutive months. 

An account is deemed terminated after all tax/administrative reporting has been  

completed or no later than a rolling 18 month period of a zero balance or whichever    
comes first and only if no further activity is expected. Distributors should not reuse  

distributor account IDs until the account is fully deemed as a terminated status by the  

manufacturer.â€ 

Customer Use Only October 7, 2025 39 of 179  
Settlement Report (GS) File Schema Alignment â€“ Phase 2 (Funnel DOT 183\) 

5.2 SETTLEMENT REPORT (GS) FILE SCHEMA ALIGNMENT â€“ PHASE 2  (FUNNEL DOT 183\)  

Background:  

As members continue to evolve the types of business processes that are handled on Fundserv,  we occasionally see a large increase in daily transaction and settlement volumes for individual  member companies. This sudden and short-term increase of transaction and settlement  volumes can be due to different business scenarios such as fund rebalancing or same-to-same  order processing.  

When a volume surge occurs, the current layout and fields of the Settlement Report (GS) file  generated by Fundserv may not be sufficient to report the higher volumes within the file. To  ensure there is no disruption to settlement reconciliation processes for our members, Fundserv  will still generate the GS file and provide the file to the intended recipient, but the file may not  align with the documented schema layout. This can cause an issue for members loading the GS  file into their system for reconciliation.  

One such issue was resolved in V35 related to the maximum number of reportable transactions,  but a second issue has arisen related to the Amount Value field length maximum. Due to a  volume surge, we have seen instances where a member has exceeded the published allowable  Amount Value maximum for a single settlement day.  

For consistency and clarity, the Fundserv GS file schema and documentation must be updated  to align with actual current business processing behaviour by increasing the maximum  settlement Amount Value length supported in the GS file.  

Note: As this is an issue specifically with the overall daily consolidated settlement amount, the  Amount Value field will only be increased in the GS file and not in other locations where the  Amount Value is communicated for single transaction amounts/systematic plan setups (e.g.,  TFS, NFU, myserv, and Account Demographic Reconciliation (NS) file). 

.1 Proposed Changes 

.1 Update the Settlement Report (GS) file schema and related documentation to expand  the Amount Value field to support 2 additional digits before the decimal point (from 9  digits to 11 digits). The new supported maximum Amount Value reported in the GS file  will be 99,999,999,999.9999. 

Customer Use Only October 7, 2025 40 of 179  
Settlement Report (GS) File Schema Alignment â€“ Phase 2 (Funnel DOT 183\) 

.2 Schema Changes 

.1 In only the Settlement Report (GS) file schema (SettlReport.xsd), update the allowable  length of the Amount Value (AmtValue) field to support up to 11 digits before the decimal  point.  

| Field Name  | Element Name  | Length  | Data Type  | Parent Element |
| :---: | :---: | :---: | :---: | :---: |
| Amount Value  | AmtValue  | minLength \= 4  maxLength \= ~~14~~ 16 | value16  ~~value14~~ | Payable (GS file only)  Receivable (GS file only) |

.2 Add a new data type pattern to the XML Data Types page to support the format for the  updated GS file Amount Value element.  

| Data Type  | Base Type  | Pattern |
| :---: | :---: | :---: |
| Value16  | String  | \\d{1,11}\\.\\d{2,4} |

Customer Use Only October 7, 2025 41 of 179  
6.0 MYSERV CHANGES (INCLUDING PRIVACY AND CYBERSECURITY) Customer Use Only October 7, 2025 42 of 179  
6.1 MYSERV â€“ TOTAL COST REPORTING (TCR) â€“ DEDUCTIONS UPDATE (FUNNEL DOT 149\)  

Background:  

In order to align with the Fundserv Standards, myserv will be minimizing the usage of the generic  â€œOther Feeâ€ deduction type and will be adding four new supported fee options for the Deductions  section within the myserv Transaction Detail and Redemption Calculator sections.  

For more information on this change, refer to BRD section 1.1.  

.1 Proposed Changes 

.1 Clarify appropriate usage of the existing generic â€œOther Feeâ€ deduction type and add the  following new deduction types to ensure manufacturers have sufficient options to  communicate the exact type of fee that was deducted or held back as part of a  

transaction or are expected to be deducted or held back as part of a hypothetical  redemption scenario. 

a. Early Redemption Fee 

b. Dealer Advisory Fee 

c. Market Value Adjustment 

d. IRS Tax 

.2 Field Definitions 

.1 Add the following new fields and definitions to the â€œData Standards Library.â€  

| Field Name  | Element Page Description |
| ----- | ----- |
| Early Redemption Fee  | The EarlyRdmtnFee element lists any early redemption fees paid by the investor.  |
| Dealer Advisory Fee  | The DlrAdvsrFee element lists any dealer advisory fees paid by the investor. |
| Market Value   Adjustment | The MVA element lists any market value adjustment amounts withheld from  redemption or money-out transactions.  |
| IRS Tax  | The IRSTax element contains the IRS Tax amounts withheld from redemption or  money-out transactions. |

.3 Schema Changes 

.1 In the myserv schema (fundcom.xsd), within the Deductions section, add new fields for  the additional specific deduction options. The Deductions section updates are applicable  to the following myserv sections: 

a. Transaction Detail (TrxnDtl) 

b. Account-Level Redemption Calculator (AcctRedeem) 

c. Redemption Calculator (RedemptionCalculator) 

Customer Use Only October 7, 2025 43 of 179  
myserv â€“ Total Cost Reporting (TCR) â€“ Deductions Update (Funnel DOT 149\) 

| Field Name  | Element   Name | Occurrence  | Frequency  | Content   Type | Length  | Data   Type | Parent   Element |
| ----- | ----- | :---: | :---: | :---: | :---: | ----- | ----- |
| Early   Redemption Fee | EarlyRdmtnFee  | Optional  | 0-1  | simple   element | minLength \= 4  maxLength \= 13 | amt9v2n  | Dedns |
| Dealer Advisory  Fee | DlrAdvsrFee  | Optional  | 0-1  | simple   element | minLength \= 4  maxLength \= 13 | amt9v2n  | Dedns |
| Market Value   Adjustment | MVA  | Optional  | 0-1  | simple   element | minLength \= 4  maxLength \= 13 | amt9v2n  | Dedns |
| IRS Tax  | IRSTax  | Optional  | 0-1  | simple   element | minLength \= 4  maxLength \= 13 | amt9v2n  | Dedns |

myserv Schema Diagram â€“ Deductions Section: 

Refer to Appendix 23: myserv Transaction Details (TrxnDet) Results Layout Guidelines.  Refer to Appendix 24: myserv Account-Level Redemption Calculator (AcctRedeem)  Results Layout Guidelines.  

Refer to Appendix 25: myserv Redemption Calculator (RedemptionCalculator) Results  Layout Guidelines.  

Customer Use Only October 7, 2025 44 of 179  
myserv â€“ Total Cost Reporting (TCR) â€“ Deductions Update (Funnel DOT 149\) 

.4 Documentation Changes 

.1 Update the Deductions section processing rules within the Transaction Detail Results  section of the myserv Transaction Detail Processing Rules to clarify appropriate usage of  the â€œOther Feeâ€ deduction type and add new specific deduction types with clear  descriptions of the reason the fee was charged.  

â€œDedns 

The Dedns element lists each individual deduction as well as a TotalDedns for all the deductions.  The TotalDedns is mandatory, but each individual deduction is optional. myserv displays all the  deductions that the manufacturer returns with a value. Dedns can contain the following elements:  ShortTermFee, AdminFee, MgmtFee, PerformFee, EarlyRdmtnFee, DlrAdvsrFee, MVA, IRSTax,  OtherFee, Penalty, DSCAmount, SalesTax, FedWHoldTax, ProvWHoldTax, LSIFClawbackFed,  LSIFClawbackProv, and Clawback. 

ShortTermFee 

The ShortTermFee element lists any short term trading fees paid by the investor. 

AdminFee 

The AdminFee element lists any administrative fees paid by the investor. 

MgmtFee 

The MgmtFee element lists any management fees paid by the investor. 

PerformFee 

The PerformFee element lists any performance fees paid by the investor. 

EarlyRdmtnFee 

The EarlyRdmtnFee element lists any early redemption fees paid by the investor. DlrAdvsrFee   
    
The DlrAdvsrFee element lists any dealer advisory fees paid by the investor. 

MVA 

The MVA element lists any market value adjustment amounts withheld from redemption or  money-out transactions.  

IRSTax 

The IRSTax element lists any IRS Tax amounts withheld from redemption or money-out  transactions.  

OtherFee 

The OtherFee element lists any other redemption fees paid by the investor. The â€œOther Feeâ€  element must only be used for segregated fund accounts, historical transactions placed  prior to June 15, 2026, or for new deduction types that are not yet defined within the  Deductions Section. Manufacturers must not use the â€œOther Feeâ€ element to report fees  that fall under an existing defined deductions type. 

Customer Use Only October 7, 2025 45 of 179  
myserv â€“ Total Cost Reporting (TCR) â€“ Deductions Update (Funnel DOT 149\) 

Penalty 

The Penalty element lists any penalties paid by the investor. 

DSCAmount 

The DSCAmount element lists any deferred sales charges paid by the investor. 

SalesTax 

The SalesTax element lists any sales tax, such as GST, HST, PST, and QST, paid by the  investor.  

FedWHoldTax 

The FedWHoldTax element lists any Federal Tax withheld on the redemption of a registered  plan, or Non-Resident Tax (NRT) levied on dividends of a cash account. 

ProvWHoldTax 

The ProvWHoldTax element lists any Quebec Tax withheld upon redemption from a  

registered plan. 

LSIFClawbackFed 

The LSIFClawbackFed element lists any LSIF Federal Tax Credit Clawbacks withheld for  remittance to the appropriate tax authority. 

LSIFClawbackProv 

The LSIFClawbackProv element lists any LSIF Provincial Tax Credit Clawbacks withheld for  remittance to the appropriate tax authority. 

Clawback 

The Clawback element lists any grants such as CESG and CDSG withheld for remittance to  the appropriate tax authority. 

TotalDedns 

The TotalDedns element lists the total amount of all the deductions.â€  

.2 Update the Deductions section processing rules within the Redemption Calculation  Results section of the myserv Redemption Calculator Processing Rules, and the Account  Level Redemption Calculator Results section (both CDNRedeem and USRedeem  sections) of the myserv Redemption Calculator (Account Level) Processing Rules to clarify  appropriate usage of the â€œOther Feeâ€ deduction type, add new specific deduction types  with clear descriptions of the reason the fee was charged, and update the Total Fee  process. 

â€œDedns 

The Dedns element lists each individual deduction as well as a TotalDedns for all the  

deductions. The TotalDedns is mandatory, but each individual deduction is optional. myserv  displays all the deductions that the manufacturer returns with a value. Dedns can contain the  following elements: ShortTermFee, AdminFee, MgmtFee, PerformFee, EarlyRdmtnFee,  

DlrAdvsrFee, MVA, IRSTax, OtherFee, Penalty, DSCAmount, SalesTax, FedWHoldTax,  

ProvWHoldTax, LSIFClawbackFed, LSIFClawbackProv, and Clawback. 

Customer Use Only October 7, 2025 46 of 179  
myserv â€“ Total Cost Reporting (TCR) â€“ Deductions Update (Funnel DOT 149\) ShortTermFee   
The ShortTermFee element lists any short-term trading fees paid by the investor. 

AdminFee 

The AdminFee element lists any administrative fees paid by the investor. 

MgmtFee 

The MgmtFee element lists any management fees paid by the investor. 

PerformFee 

The PerformFee element lists any performance fees paid by the investor. 

EarlyRdmtnFee 

The EarlyRdmtnFee element lists any early redemption fees paid by the investor. 

DlrAdvsrFee 

The DlrAdvsrFee element lists any dealer advisory fees paid by the investor. 

MVA 

The MVA element lists any market value adjustment amount withheld from redemption or  money-out transactions.  

IRSTax 

The IRSTax element lists any IRS Tax amounts withheld from redemption or money-out      
transactions.  

OtherFee 

The OtherFee element lists any other redemption fees paid by the investor. The â€œOther Feeâ€  element must only be used for segregated fund accounts, or for new deduction types that  are not yet defined within the Deductions Section. Manufacturers must not use the â€œOther  Feeâ€ element for fees that fall under an existing defined deductions type. 

Penalty 

The Penalty element lists any penalties paid by the investor. 

DSCAmount 

The DSCAmount element lists any deferred sales charges paid by the investor. 

SalesTax 

The SalesTax element lists any sales tax such as GST, HST, PST, and QST paid by the  investor.  

FedWHoldTax 

The FedWHoldTax element lists any Federal Tax withheld on the redemption of a registered  plan, or Non-Resident Tax (NRT) levied on dividends of a cash account. 

ProvWHoldTax 

The ProvWHoldTax element lists any Quebec Tax withheld upon redemption from a  registered plan. 

Customer Use Only October 7, 2025 47 of 179  
myserv â€“ Total Cost Reporting (TCR) â€“ Deductions Update (Funnel DOT 149\) 

LSIFClawbackFed 

The LSIFClawbackFed element lists any LSIF Federal Tax Credit Clawbacks withheld for  remittance to the appropriate tax authority. 

LSIFClawbackProv 

The LSIFClawbackProv element lists any LSIF Provincial Tax Credit Clawbacks withheld for  remittance to the appropriate tax authority. 

Clawback 

The Clawback element lists any grants such as CESG and CDSG withheld for remittance to  the appropriate tax authority. 

TotalDedns 

The TotalDedns element lists the total amount of all the deductions. 

TotFees 

The TotFees element lists the sum of these redemption fees: ShortTermFee, AdminFee,  MgmtFee, PerformFee, EarlyRdmtnFee, DlrAdvsrFee, OtherFee, Penalty, and DSCAmount. 

TotTaxClawback 

The TotTaxClawback element lists the sum of these taxes and clawbacks: SalesTax,  

FedWHoldTax, ProvWHoldTax, LSIFClawbackFed, LSIFClawbackProv, MVA, IRSTax, and  Clawback.â€  

Customer Use Only October 7, 2025 48 of 179  
myserv â€“ Successor Annuitant on RRIF and FHSA Accounts (Funnel DOT 163\) 

6.2 MYSERV â€“ SUCCESSOR ANNUITANT ON RRIF AND FHSA ACCOUNTS  (FUNNEL DOT 163\)  

Background:  

In order to align with the Fundserv Standards, myserv will update the current TFSA Successor  section to support the additional scope of RRIF and FHSA account types. 

For more information on this change, refer to section 3.2.  

.1 Proposed Changes 

.1 Rename the existing TFSA Successor Section used within Demographics Results to  expand the usage to also support sending Successor details for RRIF and FHSA account  types.  

.2 Field Definition(s) 

.1 Update the following existing field definition in the â€œData Standards Library.â€ 

| Field Name  | Element Page Description |
| :---: | ----- |
| Successor  ~~TFSA Successor~~ | The Sucsr ~~TFSASucsr~~ element lists the successor ~~owner~~ of a TFSA, RRIF, or  FHSA account. |

.3 Schema Changes 

.1 In the myserv (fundcom.xsd) schema, rename the existing TFSA Successor (TFSASucsr)  field within the Demographics (Demographics) section to be more generalized to facilitate  support of additional account types.  

| Field Name  | Element   Name | Occurrence  | Frequency  | Content   Type | Parent Element |
| :---: | ----- | :---: | :---: | ----- | :---: |
| Successor  ~~TFSA Successor~~ | Sucsr  ~~TFSASucsr~~ | Optional  | 0-1  | compound   element | Demographics |

Customer Use Only October 7, 2025 49 of 179  
myserv â€“ Successor Annuitant on RRIF and FHSA Accounts (Funnel DOT 163\) 

myserv Diagram â€“ Demographics Results Section 

Refer to Appendix 26: myserv Demographics (Demographics) Results Layout Guidelines.  

.4 Documentation Changes 

.1 Update the myserv Demographics Processing Rules in the Overview and Successor  (Sucsr) sections to reflect the updated field name. 

Refer to Appendix 27: myserv Demographics Processing Rules.  

Customer Use Only October 7, 2025 50 of 179  
myserv â€“ Minimizing Data Exchange â€“ Phase 1 (Funnel DOT 165\) 

6.3 MYSERV â€“ MINIMIZING DATA EXCHANGE â€“ PHASE 1 (FUNNEL DOT 165\)  

Background:  

As Canadaâ€™s privacy law landscape continues to evolve and digitize (e.g., Law 25, and legislative  review of other Canadian privacy laws), more focus has been placed on discussions surrounding  data protection and security across the investment industry.  

In November 2024, Fundserv launched a Personal Information Review (PIR) Working Group with  industry members to assess what personal investor information flows between members over  Fundserv. The objective for the Working Group was to identify when data was required to  transmit for tax, regulatory or compliance reasons; and make recommendations of where data  exchange of highly sensitive personal information can be reduced over the Fundserv network. For  the purposes of the Working Group, the definition of highly sensitive personal information was  limited to the following three data points1:  

â€¢ Social Insurance Number (SIN) 

â€¢ Client Identity Verification (ID type, ID number, and place of issue) 

â€¢ Banking Information (Bank Account Number) 

The PIR Working Group proposed a number of recommendations for data minimization on  Fundserv; which were reviewed and approved by the Standard Steering Committee (SSC). The  approved changes to minimize data exchange of highly sensitive personal information will impact  a variety of applications and processes on Fundserv: myserv, Transaction Forwarding System  (TFS), and Non-Financial Updates (NFU). These updates will help to reduce privacy risks for both  Fundserv and industry members.  

The industry has prioritized the myserv changes â€“ as outlined in the following section â€“ to be  implemented as part of Phase 1 within the V36 release. Based on industry discussions, we  anticipate the Phase 2 TFS/NFU changes will be implemented within the V37 release in 2027,  pending regulatory changes or other prioritized enhancements.  

1Note: Any existing processes across Fundserv utilizing SIN, Client Identity Verification, or  Banking Information not referenced in the following requirements will remain as-is and are out of  scope for these changes.  

.1 Proposed Changes 

.1 Remove the ability to search for accounts through Account Inquiry on myserv using the  SIN field. Moving forward, myserv users will only be able to search for accounts using the  Fund Account ID, Dealer Account ID, Intermediary Account ID, Investorâ€™s First Name,  and/or Investorâ€™s Last Name.  

.2 For myserv Account Inquiry Results, replace the existing â€œSINâ€ field with a new â€œSIN  Partialâ€ field that only returns and displays the last 4 digits of the SIN. This update will  remove the risk of a full SIN being intercepted when being transmitted over myserv. The  

Customer Use Only October 7, 2025 51 of 179  
myserv â€“ Minimizing Data Exchange â€“ Phase 1 (Funnel DOT 165\) 

Account Inquiry Results scope includes updating the â€œSINâ€ field for the following  individuals:  

a. Owner 

b. Foreign Entity Controlling Person â€“ Owner (alignment only, the SIN field for this  individual is not returned or displayed on the myserv search results screen) 

c. In-Trust-For Beneficiary (alignment only, the SIN field for this individual is not returned  or displayed on the myserv search results screen) 

d. Foreign Entity Controlling Person â€“ In-Trust-For Beneficiary (alignment only, the SIN  field for this individual is not returned or displayed on the myserv screen) 

e. Joint Owner (alignment only, the SIN field for this individual is not returned or  displayed on the myserv search results screen) 

.3 For myserv Demographics Results, replace the existing â€œSINâ€ field with a new â€œSIN  Partialâ€ field that only returns and displays the last 4 digits of the SIN. This update will  remove the risk of a full SIN being intercepted when being transmitted over myserv. The  Demographics Results scope includes updating the â€œSINâ€ field for the following  

individuals: 

a. Owner 

b. Foreign Entity Controlling Person â€“ Owner 

c. Joint Owner 

d. Spousal Contributor 

e. In-Trust-For Beneficiary 

f. Foreign Entity Controlling Person â€“ In-Trust-For Beneficiary 

g. RESP Beneficiary 

h. Death Beneficiary 

i. RDSP Beneficiary 

j. Successor Annuitant 

k. Seg Annuitant 

l. Seg Joint Annuitant 

m. Seg Successor Annuitant 

n. Seg Successor Owner 

o. Seg Primary Death Beneficiary 

p. Seg Continuing Primary Death Beneficiary 

q. Seg Secondary/Contingent Death Beneficiary, and 

r. Primary Caregiver 

.4 For myserv Account Inquiry Results and Demographics Results, remove the Client Identity  Verification section for Owner and Joint Owner(s) as this information is only required for  account opening and is not required to be available on myserv for reconciliation.  

a. Note: The Account Inquiry Results update is for alignment only, the Client Identity  Verification section is not returned or displayed on the myserv search results screen.  

Customer Use Only October 7, 2025 52 of 179  
myserv â€“ Minimizing Data Exchange â€“ Phase 1 (Funnel DOT 165\) 

.5 For myserv Distribution Instructions Results and Systematic Plan Detail Results, replace the existing â€œBank Account Numberâ€ field with a new â€œBank Account Number Partialâ€ field  that only returns and displays the last 4 characters of the bank account number. This  update will remove the risk of a full bank account number being intercepted when being  transmitted over myserv.  

a. The Bank Account Number change will impact the myserv Systematic  

Plans/Systematic Plan Details and Holdings/Distribution Instructions screens.  

.6 Add a new processing rule to advise that manufacturers can choose to mask the SIN on  duplicate tax receipt PDFs at their discretion.  

.2 Field Definition(s) 

.1 Add the following new fields and definitions to the â€œData Standards Library.â€  

| Field Name  | Element Page Description |
| ----- | ----- |
| SIN Partial  | The SINPartial element contains the last 4 digits of an individual's SIN (Social  Insurance Number).   For applicable scenarios where the full SIN is not required for regulatory, tax, or  compliance purposes; the SINPartial element is used to reduce the risk of  transmitting highly sensitive personal information over the Fundserv network. |
| Bank Account  Number Partial | The BkAcctNumPartial element lists the last 4 characters of the bank account  number assigned by the bank.   For applicable scenarios where the full bank account number is not required for  regulatory, tax, or compliance purposes; the BkAcctNumPartial element is used to  reduce the risk of transmitting highly sensitive personal information over the  Fundserv network.  |

.3 Schema Changes 

.1 In the myserv schema (fundcom.xsd), remove the SIN field from the Account Inquiry  (AcctInq) section to disable the ability to search for accounts on myserv using the SIN.  

| Field Name  | Element Name  | Content Type  | Data Type  | Parent Element |
| :---: | :---: | :---: | :---: | :---: |
| SIN  | SIN  | simple element  | sintype: \\d{9}  | A~~cctInq~~  ControllingPerson  Individual |

Refer to Appendix 28: myserv Account Inquiry (AcctInq) Layout Guidelines.  

Customer Use Only October 7, 2025 53 of 179  
myserv â€“ Minimizing Data Exchange â€“ Phase 1 (Funnel DOT 165\) 

myserv Account Inquiry Diagram:  

Refer to Appendix 28: myserv Account Inquiry (AcctInq) Layout Guidelines.  

.2 In the myserv schema (fundcom.xsd) only, replace all instances of the â€œSINâ€ field within  the Individual and Controlling Persons sections of Account Inquiry Results  

(AcctInqResults) and Demographics (Demographics) Results with a new â€œSIN Partialâ€ field  that only transmits the last 4 digits of the SIN.  

a. The Account Inquiry Results changes to the ClientInfo/Individual section are  

applicable to the following sections:  

i. Owner (Owner) 

ii. In-Trust-For Beneficiary (ITFBen) 

iii. Joint Owner (JntOwner) 

b. The Demographics Results changes to the ClientInfo/individual section are  

applicable to the following sections: 

i. Owner (Owner) 

ii. Joint Owner (JntOwner) 

iii. Spousal Contributor (Spousal) 

iv. In-Trust-For Beneficiary (ITFBen) 

v. RESP Beneficiary Detail (RESPBenDtl) 

vi. Death Beneficiary Detail (DthBenDtl) 

vii. RDSP Beneficiary Detail (RDSPBenDtl) 

viii. Successor (Sucsr) 

ix. Seg Annuitant (Annuitant) 

x. Seg Joint Annuitant (JntAnnuitant) 

Customer Use Only October 7, 2025 54 of 179  
myserv â€“ Minimizing Data Exchange â€“ Phase 1 (Funnel DOT 165\) 

xi. Seg Successor Annuitant (SucsrAnnuitant) 

xii. Seg Successor Owner (SucsrOwner) 

xiii. Seg Primary Death Beneficiary (PrimDthBen) 

xiv. Seg Continuing Primary Death Beneficiary (ConPrimDthBen) 

xv. Seg Secondary/Contingent Death Beneficiary Detail (CntgDthBenDtl) 

xvi. Primary Caregiver (PrimCareGvr) 

c. The Account Inquiry Results and Demographics Results changes to the Controlling  Person section are applicable to the following sections:  

i. Foreign Entity Controlling Person (ControllingPerson) â€“ Owner (Owner) 

ii. Foreign Entity Controlling Person (ControllingPerson) â€“ In-Trust-For Beneficiary (ITFBen) 

| Field Name  | Element   Name | Content   Type | Length  | Data Type  | Parent Element |
| :---: | ----- | :---: | :---: | :---: | :---: |
| SIN Partial  ~~SIN~~ | SINPartial  ~~SIN~~ | simple  element | Length \= 4  ~~Length \= 9~~ | sinpartial-typ ~~sintype: \\d{9}~~ | Individual (myserv only)  ControllingPerson (myserv only) |

Refer to Appendix 29: myserv Account Inquiry Results (AcctInqResults) Layout Guidelines.  Refer to Appendix 26: myserv Demographics (Demographics) Results Layout Guidelines.  

myserv Individual (Individual) Section Diagram:  

Refer to Appendix 29: myserv Account Inquiry Results (AcctInqResults) Layout Guidelines.  Refer to Appendix 26: myserv Demographics (Demographics) Results Layout Guidelines.  

Customer Use Only October 7, 2025 55 of 179  
myserv â€“ Minimizing Data Exchange â€“ Phase 1 (Funnel DOT 165\) 

myserv Controlling Person (ControllingPerson) Section Diagram: 

Refer to Appendix 29: myserv Account Inquiry Results (AcctInqResults) Layout Guidelines.  Refer to Appendix 26: myserv Demographics (Demographics) Results Layout Guidelines.  

.3 In the myserv schema (fundcom.xsd) only, remove the Client Identity Verification (IDVerify)  section including all fields contained within this section (Identity Type, Other Description,  ID Number, and Place of Issue) from the Account Inquiry Results (AcctInqResults) and  Demographics (Demographics) Results sections.  

a. The Client Identity Verification section removal is applicable to the following Account  Inquiry Results (AcctInqResults) sections: 

i. Owner (Owner) 

ii. Joint Owner (JntOwner) 

b. The Client Identity Verification section removal is applicable to the following  

Demographics (Demographics) Results sections: 

i. Owner (Owner) 

ii. Joint Owner (JntOwner) 

Customer Use Only October 7, 2025 56 of 179  
myserv â€“ Minimizing Data Exchange â€“ Phase 1 (Funnel DOT 165\) 

| Field Name  | Element Name  | Content Type  | Pattern  | Parent Element |
| ----- | :---: | :---: | :---: | :---: |
| Client   Identity   Verification | IDVerify  | compound  element | sequence  | ~~JntOwner~~ (myserv only)  ~~Owner~~ (myserv only) |

Refer to Appendix 29: myserv Account Inquiry Results (AcctInqResults) Layout Guidelines.  Refer to Appendix 26: myserv Demographics (Demographics) Results Layout Guidelines.  

myserv Owner (Owner) Section Diagram:  

Refer to Appendix 29: myserv Account Inquiry Results (AcctInqResults) Layout Guidelines.  Refer to Appendix 26: myserv Demographics (Demographics) Results Layout Guidelines.  

myserv Joint Owner (JntOwner) Section Diagram:  

Refer to Appendix 29: myserv Account Inquiry Results (AcctInqResults) Layout Guidelines.  Refer to Appendix 26: myserv Demographics (Demographics) Results Layout Guidelines.  

Customer Use Only October 7, 2025 57 of 179  
myserv â€“ Minimizing Data Exchange â€“ Phase 1 (Funnel DOT 165\) 

.4 In the myserv schema (fundcom.xsd) only, replace all instances of Bank Account Number  within the Payment/Bank Information section with a new â€œBank Account Number Partialâ€  field that only transmits the last 4 characters of the bank account number.  

a. The changes to the Payment/Bank Information (BkInfo) section are applicable to the  following sections:  

i. Automatic Activity Plan Detail (AutoActivityDet) Results 

ii. Distribution (Distribution) Results 

| Field Name  | Element Name  | Content  Type | Length  | Data Type  | Parent Element |
| ----- | :---: | :---: | :---: | :---: | :---: |
| Bank Account  Number Partial  ~~Bank Account~~  ~~Number~~ | BkAcctNumPartial ~~BkAcctNum~~ | simple   element | Length \= 4  ~~minLength \= 1 maxLength= 12~~ | length4  ~~string12~~ | BkInfo (myserv only) |

Refer to Appendix 30: myserv Automatic Activity Plan Detail (AutoActivityDet) Results  Layout Guidelines.  

Refer to Appendix 31: myserv Distribution Instructions (Distribution) Results Layout  Guidelines.  

myserv Bank Information (BkInfo) Section Diagram 

Refer to Appendix 30: myserv Automatic Activity Plan Detail (AutoActivityDet) Results Layout  Guidelines.  

Refer to Appendix 31: myserv Distribution Instructions (Distribution) Results Layout  Guidelines.  

.5 Add a new data type pattern to the list of XML Data Types to support the format for the  new SINPartial element.  

| Data Type  | Base Type  | Pattern |
| :---: | :---: | :---: |
| sinpartial-typ  | string  | \\d{4} |

Customer Use Only October 7, 2025 58 of 179  
myserv â€“ Minimizing Data Exchange â€“ Phase 1 (Funnel DOT 165\) 

.4 Documentation Changes 

.1 Update the myserv Account Inquiry Processing Rules page to remove references to the  ability to search for an account by SIN and to replace Account Inquiry results â€œSINâ€  references to the new â€œSIN Partialâ€ field.  

Refer to Appendix 32: myserv Account Inquiry Processing Rules.  

.2 Update the myserv Demographics Processing Rules page for Demographics Results to  replace â€œSINâ€ references to the new â€œSIN Partialâ€ field, and to remove references to the  Client Identity Verification section and related fields.  

Refer to Appendix 27: myserv Demographics Processing Rules.  

.3 Update the myserv Systematic Plans Processing Rules page for Automatic Activity Detail  Results to replace â€œBank Account Numberâ€ references to the new â€œBank Account Number  Partialâ€ field.  

â€œBkInfo 

The BkInfo element lists all the information necessary to uniquely identify a bank account. This  element is required if the proceeds are paid to the client via EFT. BkInfo contains one InstutNum,  one BranchNum, one BkAcctNumPartial ~~BkAcctNum~~, and one Holder element. It can also contain  one BkAcctType and/or one Currency element. 

InstutNum 

The InstutNum element lists the standard Canadian Payments Association (CPA) code for the  banking institution. 

BranchNum 

The BranchNum element lists the unique identifier of the branch as assigned by the banking  institution that holds the bank account. 

BkAcctType 

The BkAcctType element indicates the type of bank account,  

BkAcctNumPartial ~~BkAcctNum~~ 

The BkAcctNumPartial ~~BkAcctNum~~ element lists the last 4 characters of a bank account  number.  

Currency 

The Currency element lists the currency of the bank account. 

Holder 

The Holder element lists the name of the holder(s) of the bank account. It must be the same as  the name shown on a pre-printed cheque.â€  

Customer Use Only October 7, 2025 59 of 179  
myserv â€“ Minimizing Data Exchange â€“ Phase 1 (Funnel DOT 165\) 

.4 Update the myserv Distribution Instructions Processing Rules page for Distributions  Results to replace â€œBank Account Numberâ€ references to the new â€œBank Account Number  Partialâ€ field.  

â€œBkInfo 

The BkInfo element lists all the information necessary to uniquely identify a bank account. This  element is required if the distribution is paid to the client via EFT. BkInfo contains one InstutNum,  one BranchNum, one BkAcctNumPartial ~~BkAcctNum~~, and one Holder element. It can also contain  one BkAcctType and/or one Currency element. 

InstutNum 

The InstutNum element lists the standard Canadian Payments Association (CPA) code for the  banking institution. 

BranchNum 

The BranchNum element lists the unique identifier of the branch as assigned by the banking  institution that holds the bank account. 

BkAcctType 

The BkAcctType element indicates the type of bank account,  

BkAcctNumPartial ~~BkAcctNum~~ 

The BkAcctNumPartial ~~BkAcctNum~~ element lists the last 4 characters of a bank account  number.  

Currency 

The Currency element lists the currency of the bank account. 

Holder 

The Holder element lists the name of the holder(s) of the bank account. It must be the same as  the name shown on a pre-printed cheque.â€  

.5 Update the Tax Receipt PDF Results Processing Rules page to advise that manufacturers  can choose to mask or partially mask the SIN on the duplicate tax receipt PDF at their  discretion.  

â€œTax Receipt PDF Results 

The TaxRcptPDFResults element lists the manufacturer's reply to a TaxRcptPDFInq Query. 

TaxRcptPDFResults Processing Rules 

The TaxRcptPDFResults element contains one AcctSummary and one TaxRcptPDFResult  element. 

AcctSummary 

The AcctSummary element lists the information needed to uniquely identify the account. The  manufacturer returns the same AcctSummary that was sent in the TaxRcptPDFInq Query. 

TaxRcptPDFResult 

The TaxRcptPDFResult element contains one TaxRcpt, may contain one PDFContent, and may  contain one MessageText element. 

Customer Use Only October 7, 2025 60 of 179  
myserv â€“ Minimizing Data Exchange â€“ Phase 1 (Funnel DOT 165\) 

TaxRcpt 

The TaxRcpt element contains one TaxRcptType, one DateIssued, and may  

contain one UniqueID element. 

TaxRcptType 

The TaxRcptType element distinguishes between the different  

types of Tax Receipts that can be issued by manufacturers. 

DateIssued 

The DateIssued element indicates the date the original receipt was  

issued by the manufacturer. 

UniqueID 

The UniqueID element indicates the unique identification number  

assigned to the receipt by the manufacturer. 

PDFContent 

The PDFContent element contains the PDF of the Tax Receipt. The SIN on the  

tax receipt PDF can be masked (fully or partially) at the manufacturers  

discretion.  

MessageText 

The MessageText element contains the text of a message in freeform.â€  

Customer Use Only October 7, 2025 61 of 179  
myserv â€“ Minimizing Data Exchange â€“ Phase 1 (Funnel DOT 165\) 

.5 myserv Screens Changes 

.1 On the myserv Search screen, remove the ability to search by Clientâ€™s SIN. 

Customer Use Only October 7, 2025 62 of 179  
myserv â€“ Minimizing Data Exchange â€“ Phase 1 (Funnel DOT 165\) 

.2 On the myserv Search Results screen, update the SIN column to display the new  partial SIN being returned as part of Account Inquiry Results. 

Customer Use Only October 7, 2025 63 of 179  
myserv â€“ Minimizing Data Exchange â€“ Phase 1 (Funnel DOT 165\) 

.3 On the myserv Demographics screen, update the SIN fields for all individuals to display  the new partial SIN being returned as part of Demographics Results.  

Customer Use Only October 7, 2025 64 of 179  
myserv â€“ Minimizing Data Exchange â€“ Phase 1 (Funnel DOT 165\) 

.4 On the myserv Demographics screen, remove the Client Identity Verification section  and all related fields from the Owner and Joint Owner sections. 

Customer Use Only October 7, 2025 65 of 179  
myserv â€“ Minimizing Data Exchange â€“ Phase 1 (Funnel DOT 165\) 

.5 On the myserv Systematic Plans/Systematic Plan Details screen, update the Bank  Account Number field to display the new partial bank account number being returned  as part of Automatic Activity Plan Detail Results.  

Customer Use Only October 7, 2025 66 of 179  
myserv â€“ Minimizing Data Exchange â€“ Phase 1 (Funnel DOT 165\) 

.6 On the myserv Holdings/Distribution Instructions screen, update the Bank Account  Number field to display the new partial bank account number being returned as part of  Distribution Results.  

Customer Use Only October 7, 2025 67 of 179  
7.0 APPENDICES 

Customer Use Only October 7, 2025 68 of 179  
Appendix 1: Transaction Reconciliation (TS) File \- Sell Fund Section Edits 

| Field Name |  |  | XML Tag  | Occurrence  | Frequency  | Edit Type  | Edit  | Error Code |
| ----- | :---- | :---- | :---: | :---: | :---: | :---: | :---- | ----- |
| Fund Identifier |  |  | FundID  | Mandatory  | 1  | Schema  | Element required. Must match length  requirements. | U File |
| Currency |  |  | Currency  | Mandatory  | 1  | Schema  | Element required. Must be an allowable  value. | U File |
| Sequence Number |  |  | SequenceNum  | Mandatory  | 1  | Schema  | Element required. Must match pattern.  | U File |
| Taxable Event Indicator |  |  | TaxEvnt  | Optional  | 0-1  | Schema  | Must be an allowable value.  | U File |
| Gross Transaction Amount |  |  | GrossAmt  | Mandatory  | 1  | Schema  | Element required. Must match pattern.  | U File |
| Fee Details Section  |  |  | FeeDtls  | Optional  | 0-1 | Schema  | Can occur up to one time.  | U File |
|  |  |  |  |  |  | Processing Rule  | Section must exist **AND** only exist for fee  rebate **OR** fee redemption transactions. See  TS File Processing Rules for list of allowable  transactions types. |  |
|  | Fee Section |  | Fee  | Mandatory  | 1-10  | Schema  | Must occur at least once.  | U File |
|  |  | Fee Type  | FeeType  | Mandatory  | 1  | Schema  | Element required. Must match pattern.  | U File |
|  |  | Fee Sales Tax  | FeeSalesTx  | Mandatory  | 1  | Schema  | Element required. Must match pattern.  | U File |
|  |  | Fee Amount  | FeeAmt  | Mandatory  | 1  | Schema  | Element required. Must match pattern.  | U File |
|  | Total Fee Sales Tax |  | TotFeeSalesTx  | Mandatory  | 1 | Schema  | Element required. Must match pattern.  | U File |
|  |  |  |  |  |  | Processing Rule  | Must equal the sum of all Sales Tax amounts  within the Fee Details section. |  |
|  | Total Fee Amount |  | TotFeeAmt | Mandatory  | 1 | Schema  | Element required. Must match pattern.  | U File |
|  |  |  |  |  |  | Processing Rule  | Must equal the sum of all Fee Amount  values within the Fee Details section. |  |
| Deduction Section |  |  | Dedns  | Mandatory  | 1  | Schema  | Section required.  | U File |
|  | Short Term Fee |  | ShortTermFee  | Optional  | 0-1  | Schema  | Must match pattern.  | U File |
|  | Administration Fee |  | AdminFee  | Optional  | 0-1  | Schema  | Must match pattern.  | U File |
|  | Management Fee |  | MgmtFee  | Optional  | 0-1  | Schema  | Must match pattern.  | U File |
|  | Performance Fee |  | PerformFee  | Optional  | 0-1  | Schema  | Must match pattern.  | U File |
|  | Early Redemption Fee |  | EarlyRdmtnFee  | Optional  | 0-1  | Schema  | Must match pattern.  | U File |
|  | Dealer Advisory Fee |  | DlrAdvsrFee  | Optional  | 0-1  | Schema  | Must match pattern.  | U File |
|  | Market Value Adjustment |  | MVA  | Optional  | 0-1  | Schema  | Must match pattern.  | U File |
|  | IRS Tax |  | IRSTax  | Optional  | 0-1  | Schema  | Must match pattern.  | U File |
|  | Other Fee |  | OtherFee  | Optional  | 0-1  | Schema  | Must match pattern.  | U File |
|  | Penalty |  | Penalty  | Optional  | 0-1  | Schema  | Must match pattern.  | U File |
|  | DSC Amount |  | DSCAmount  | Optional  | 0-1  | Schema  | Must match pattern.  | U File |
|  | Sales Tax |  | SalesTax  | Optional  | 0-1  | Schema  | Must match pattern.  | U File |
|  | Federal Withholding Tax |  | FedWHoldTax  | Optional  | 0-1  | Schema  | Must match pattern.  | U File |
|  | Provincial Withholding Tax |  | ProvWHoldTax  | Optional  | 0-1  | Schema  | Must match pattern.  | U File |
|  | LSIF Federal Clawback |  | LSIFClawbackFed  | Optional  | 0-1  | Schema  | Must match pattern.  | U File |
|  | LSIF Provincial Clawback |  | LSIFClawbackProv  | Optional  | 0-1  | Schema  | Must match pattern.  | U File |
|  | Clawback |  | Clawback  | Optional  | 0-1  | Schema  | Must match pattern.  | U File |
|  | Total Deductions |  | TotalDedns  | Mandatory  | 1  | Schema  | Element required. Must match pattern.  | U File |
| Net Transaction Amount |  |  | NetAmt  | Mandatory  | 1  | Schema  | Element required. Must match pattern.  | U File |
| Dilution Amount |  |  | DilAmt  | Optional  | 1  | Schema  | Must match pattern.  | U File |
| Share-Unit Price |  |  | NAV  | Mandatory  | 1  | Schema  | Element required. Must match pattern.  | U File |
| Share-Units Transacted |  |  | UnitTrxnd  | Mandatory  | 1  | Schema  | Element required. Must match pattern.  | U File |
| Share-Units Total Assigned |  |  | TotalAssigned  | Mandatory  | 1  | Schema  | Element required. Must match pattern.  | U File |
| Share-Units Total Unassigned |  |  | TotalUnAssigned  | Mandatory  | 1  | Schema  | Element required. Must match pattern.  | U File |
| Average Cost |  |  | AveCost  | Mandatory  | 1  | Schema  | Element required. Must match pattern.  | U File |
| Settlement Method |  |  | SettlMethd  | Mandatory  | 1  | Schema  | Element required. Must be an allowable  value. | U File |
| Settlement Amount |  |  | SettlAmt  | Mandatory  | 1  | Schema  | Element required. Must match pattern.  | U File |

Customer Use Only October 7, 2025 69 of 179  
Appendix 2: Transaction Reconciliation (TS) File \- Transfer Fund Section Edits 

| Field Name |  | XML Tag  | Occurrence  | Frequency  | Edit Type  | Edit  | Error Code |
| :---- | :---- | :---: | :---: | :---: | :---: | ----- | :---: |
| Fund Identifier |  | FundID  | Mandatory  | 1  | Schema  | Element required. Must be an allowable value.  | U File |
| Currency |  | Currency  | Mandatory  | 1  | Schema  | Element required. Must be an allowable value.  | U File |
| Dividend Option |  | DivOpt  | Optional  | 0-1  | Schema  | Must match pattern.  | U File |
| Sequence Number |  | SequenceNum  | Mandatory  | 1  | Schema  | Element required. Must match pattern  | U File |
| Gross Transaction Amount |  | GrossAmt  | Mandatory  | 1  | Schema  | Element required. Must match pattern  | U File |
| Deduction Section |  | Dedns  | Optional  | 0-1  | Schema  | Section optional.  | U File |
|  | Short Term Fee  | ShortTermFee  | Optional  | 0-1  | Schema  | Must match pattern.  | U File |
|  | Administration Fee  | AdminFee  | Optional  | 0-1  | Schema  | Must match pattern.  | U File |
|  | Management Fee  | MgmtFee  | Optional  | 0-1  | Schema  | Must match pattern.  | U File |
|  | Performance Fee  | PerformFee  | Optional  | 0-1  | Schema  | Must match pattern.  | U File |
|  | Early Redemption Fee  | EarlyRdmtnFee  | Optional  | 0-1  | Schema  | Must match pattern.  | U File |
|  | Dealer Advisory Fee  | DlrAdvsrFee  | Optional  | 0-1  | Schema  | Must match pattern.  | U File |
|  | Market Value Adjustment  | MVA  | Optional  | 0-1  | Schema  | Must match pattern.  | U File |
|  | IRS Tax  | IRSTax  | Optional  | 0-1  | Schema  | Must match pattern.  | U File |
|  | Other Fee  | OtherFee  | Optional  | 0-1  | Schema  | Must match pattern.  | U File |
|  | Penalty  | Penalty  | Optional  | 0-1  | Schema  | Must match pattern.  | U File |
|  | DSC Amount  | DSCAmount  | Optional  | 0-1  | Schema  | Must match pattern.  | U File |
|  | Sales Tax  | SalesTax  | Optional  | 0-1  | Schema  | Must match pattern.  | U File |
|  | Federal Withholding Tax  | FedWHoldTax  | Optional  | 0-1  | Schema  | Must match pattern.  | U File |
|  | Provincial Withholding Tax  | ProvWHoldTax  | Optional  | 0-1  | Schema  | Must match pattern.  | U File |
|  | LSIF Federal Clawback  | LSIFClawbackFed  | Optional  | 0-1  | Schema  | Must match pattern.  | U File |
|  | LSIF Provincial Clawback  | LSIFClawbackProv  | Optional  | 0-1  | Schema  | Must match pattern.  | U File |
|  | Clawback  | Clawback  | Optional  | 0-1  | Schema  | Must match pattern.  | U File |
|  | Total Deductions  | TotalDedns  | Mandatory  | 1  | Schema  | Element required. Must match pattern.  | U File |
| Net Transaction Amount |  | NetAmt  | Optional  | 0-1  | Schema  | Must match pattern.  | U File |
| Dilution Amount |  | DilAmt  | Optional  | 0-1  | Schema  | Must match pattern.  | U File |
| Share Unit Price |  | NAV  | Mandatory  | 1  | Schema  | Element required. Must match pattern  | U File |
| Share Units Transacted |  | UnitTrxnd  | Mandatory  | 1  | Schema  | Element required. Must match pattern  | U File |
| Share Units Total Assigned |  | TotalAssigned  | Mandatory  | 1  | Schema  | Element required. Must match pattern  | U File |
| Share Units Total Unassigned |  | TotalUnAssigned  | Mandatory  | 1  | Schema  | Element required. Must match pattern  | U File |
| Average Cost |  | AveCost  | Mandatory  | 1  | Schema  | Element required. Must match pattern  | U File |

Customer Use Only October 7, 2025 70 of 179  
Appendix 3: Transaction Reconciliation (TS) File \- Distribution Fund Section Edits 

| Field Name |  |  | XML Tag  | Occurrence  | Frequency  | Edit Type  | Edit  | Error Code |
| :---- | :---- | :---- | :---: | :---: | :---: | :---: | :---- | ----- |
| Fund Identifier |  |  | FundID  | Mandatory  | 1  | Schema  | Element required. Must be an allowable value.  | U File |
| Currency |  |  | Currency  | Mandatory  | 1  | Schema  | Element required. Must be an allowable value.  | U File |
| Sequence Number |  |  | SequenceNum  | Mandatory  | 1  | Schema  | Element required. Must match pattern.  | U File |
| Gross Transaction Amount |  |  | GrossAmt  | Mandatory  | 1  | Schema  | Element required. Must match pattern.  | U File |
| Fee Details Section |  |  | FeeDtls  | Optional  | 0-1 | Schema  | Can occur up to one time.  | U File |
|  |  |  |  |  |  | Processing Rule  | Section must exist **AND** only exist for fee rebate  **OR** fee redemption transactions. See TS File  Processing Rules for list of allowable transactions  types. | U File |
|  | Fee Section |  | Fee  | Mandatory  | 1-10  | Schema  | Must occur at least once.  | U File |
|  |  | Fee Type  | FeeType  | Mandatory  | 1  | Schema  | Element required. Must match pattern.  | U File |
|  |  | Fee Sales Tax  | FeeSalesTx  | Mandatory  | 1  | Schema  | Element required. Must match pattern.  | U File |
|  |  | Fee Amount  | FeeAmt  | Mandatory  | 1  | Schema  | Element required. Must match pattern.  | U File |
|  | Total Fee Sales Tax |  | TotFeeSalesTx  | Mandatory  | 1 | Schema  | Element required. Must match pattern.  | U File |
|  |  |  |  |  |  | Processing Rule  | Must equal the sum of all Sales Tax amounts  within the Fee Details section. |  |
|  | Total Fee Amount  |  | TotFeeAmt  | Mandatory  | 1 | Schema  | Element required. Must match pattern.  | U File |
|  |  |  |  |  |  | Processing Rule  | Must equal the sum of all Fee Amount values  within the Fee Details section. |  |
| Deduction Section |  |  | Dedns  | Optional  | 0-1  | Schema  | Section optional.  | U File |
|  | Short Term Fee |  | ShortTermFee  | Optional  | 0-1  | Schema  | Must match pattern.  | U File |
|  | Administration Fee |  | AdminFee  | Optional  | 0-1  | Schema  | Must match pattern.  | U File |
|  | Management Fee |  | MgmtFee  | Optional  | 0-1  | Schema  | Must match pattern.  | U File |
|  | Performance Fee |  | PerformFee  | Optional  | 0-1  | Schema  | Must match pattern.  | U File |
|  | Early Redemption Fee |  | EarlyRdmtnFee  | Optional  | 0-1  | Schema  | Must match pattern.  | U File |
|  | Dealer Advisory Fee |  | DlrAdvsrFee  | Optional  | 0-1  | Schema  | Must match pattern.  | U File |
|  | Market Value Adjustment |  | MVA  | Optional  | 0-1  | Schema  | Must match pattern.  | U File |
|  | IRS Tax |  | IRSTax  | Optional  | 0-1  | Schema  | Must match pattern.  | U File |
|  | Other Fee |  | OtherFee  | Optional  | 0-1  | Schema  | Must match pattern.  | U File |
|  | Penalty |  | Penalty  | Optional  | 0-1  | Schema  | Must match pattern.  | U File |
|  | DSC Amount |  | DSCAmount  | Optional  | 0-1  | Schema  | Must match pattern.  | U File |
|  | Sales Tax |  | SalesTax  | Optional  | 0-1  | Schema  | Must match pattern.  | U File |
|  | Federal Withholding Tax |  | FedWHoldTax  | Optional  | 0-1  | Schema  | Must match pattern.  | U File |
|  | Provincial Withholding Tax |  | ProvWHoldTax  | Optional  | 0-1  | Schema  | Must match pattern.  | U File |
|  | LSIF Federal Clawback |  | LSIFClawbackFed  | Optional  | 0-1  | Schema  | Must match pattern.  | U File |
|  | LSIF Provincial Clawback |  | LSIFClawbackProv  | Optional  | 0-1  | Schema  | Must match pattern.  | U File |
|  | Clawback |  | Clawback  | Optional  | 0-1  | Schema  | Must match pattern.  | U File |
|  | Total Deductions |  | TotalDedns  | Mandatory  | 1  | Schema  | Element required. Must match pattern.  | U File |
| Net Transaction Amount |  |  | NetAmt  | Optional  | 0-1  | Schema  | Must match pattern.  | U File |
| Share Unit Price |  |  | NAV  | Mandatory  | 1  | Schema  | Element required. Must match pattern  | U File |
| Share Units Transacted |  |  | UnitTrxnd  | Mandatory  | 1  | Schema  | Element required. Must match pattern  | U File |
| Share Units Total Assigned |  |  | TotalAssigned  | Mandatory  | 1  | Schema  | Element required. Must match pattern  | U File |
| Share Units Total Unassigned |  |  | TotalUnAssigned  | Mandatory  | 1  | Schema  | Element required. Must match pattern  | U File |
| Average Cost |  |  | AveCost  | Mandatory  | 1  | Schema  | Element required. Must match pattern  | U File |

Customer Use Only October 7, 2025 71 of 179  
Appendix 4: Settlement Instruction (FS) File \- Sell Fund Section Edits 

| Field Name |  | XML Tag  | Occurrence  | Frequency  | Edit Type  | Edit  (Fundserv Edits validated only if Order Status \= A) | Error Code  | Error Code   Detail |
| :---- | :---- | :---: | :---: | :---: | ----- | ----- | ----- | ----- |
| Fund ID  |  | FundID  | Mandatory  | 1 | Schema  | Element required. Must match length requirements.  | FV File |  |
|  |  |  |  |  | Fundserv | Must be a valid Fundserv Fund ID **AND** active for settlement.  | 828  | A |
|  |  |  |  |  |  | Must \<\> ALL.  | 828  | B |
|  |  |  |  |  |  | **IF** Parent Fund ID exists, **THEN** Sell Asset Allocation Fund.Sell Fund. Fund ID must be  the child of the Parent Fund ID within the same Sell Asset Allocation Fund section. | 828  | C |
|  |  |  |  |  |  | **IF** a corresponding TFS order exists **AND** Sell Contract.Order Fund ID does **NOT**  exist, **THEN** Sell Contract.Sell Fund.Fund ID must \= TFS Order.Fund ID. | 828  | D |
|  |  |  |  |  |  | **IF** a corresponding TFS order exists **AND** Switch Out.Order Fund ID does **NOT** exist  **THEN** Switch Out.Sell Fund.Fund ID must equal TFS Order.From Fund ID if it exist on  the TFS Order. | 828  | E |
|  |  |  |  |  |  | **IF** Transaction Type Detail \= 1, **THEN** Switch Out.Sell Fund.Fund ID must **NOT** equal  Switch In.Buy Fund.Fund ID **OR** Switch In.Buy Asset Allocation Fund.Parent Fund ID. | 828  | F |
|  |  |  |  |  |  | Switch Out.Sell Fund.Fund ID must **NOT** be a related asset allocation fund to the  Switch In.Buy Fund.Fund ID  | 828  | G |
|  |  |  |  |  |  | Sell ICT.Sell Fund.Fund ID must **NOT** equal Sell ICT.Reject Fund.Fund ID **OR** Sell  ICT.Sell Asset Allocation Fund.Parent Fund ID **OR** other occurrences of Sell ICT.Sell  Fund.Fund ID. | 828  | H |
|  |  |  |  |  |  | Sell ICT.Sell Fund.Fund ID must match a Fund ID within the corresponding ICT Sell  Order. | 828  | I |
|  |  |  |  |  |  | **IF** Fund ID is a child asset allocation model A **OR** C fund, **THEN** it must only exist  within the Sell Asset Allocation Fund section. | 828  | J |
|  |  |  |  |  |  | Fund ID must be unique within the Sell Asset Allocation Fund section.  | 828  | K |
| Currency  |  | Currency  | Mandatory  | 1 | Schema  | Element required. Must be an allowable value.  | FV File |  |
|  |  |  |  |  | Fundserv | **IF** Settlement Method \= 1 (N$M), **THEN** Trade Related Account for the currency  must exist on N$M for the Management Code. | 034  | A |
|  |  |  |  |  |  | **IF** Settlement Method \= 1 (N$M), **THEN** Trade Related Account for the currency  must exist on N$M for the Settlement Source. | 034  | B |
|  |  |  |  |  |  | **IF** a corresponding TFS order exists, **THEN** Currency must match the currency of the  TFS order.  | 034  | C |
|  |  |  |  |  |  | Must equal currency in fund setup for Fund ID.  | 034  | D |
|  |  |  |  |  |  | **IF** Transaction Type \= M, **THEN** Currency must be the same for all funds within the  contract. | 034  | E |
| Taxable Event Indicator  |  | TaxEvnt  | Conditional  | 0-1 | Schema  | Must be an allowable value.  | FV File |  |
|  |  |  |  |  | Fundserv  | **IF** a corresponding TFS Switch Order Exists, **THEN** Taxable Event Indicator must  exist. | 056  | A |
| Gross Transaction Amount |  | GrossAmt  | Mandatory  | 1  | Schema  | Element required. Must match pattern.  | FV File |  |
| Deductions Section |  | Dedns  | Mandatory  | 1  | Schema  | Element required.  | FV File |  |
|  | Short Term Fee  | ShortTermFee  | Optional  | 0-1  | Schema  | Must match pattern.  | FV File |  |
|  | Admin Fee  | AdminFee  | Optional  | 0-1  | Schema  | Must match pattern.  | FV File |  |
|  | Management Fee  | MgmtFee  | Optional  | 0-1  | Schema  | Must match pattern.  | FV File |  |
|  | Performance Fee  | PerformFee  | Optional  | 0-1  | Schema  | Must match pattern.  | FV File |  |
|  | Early Redemption Fee  | EarlyRdmtnFee  | Optional  | 0-1  | Schema  | Must match pattern.  | FV File |  |
|  | Dealer Advisory Fee  | DlrAdvsrFee  | Optional  | 0-1  | Schema  | Must match pattern.  | FV File |  |
|  | Market Value Adjustment  | MVA  | Optional  | 0-1  | Schema  | Must match pattern.  | FV File |  |
|  | IRS Tax  | IRSTax  | Optional  | 0-1  | Schema  | Must match pattern.  | FV File |  |
|  | Other Fee  | OtherFee  | Optional  | 0-1  | Schema  | Must match pattern.  | FV File |  |
|  | Penalty  | Penalty  | Optional  | 0-1  | Schema  | Must match pattern.  | FV File |  |
|  | DSC Amount  | DSCAmount  | Optional  | 0-1  | Schema  | Must match pattern.  | FV File |  |
|  | Sales Tax  | SalesTax  | Optional  | 0-1  | Schema  | Must match pattern.  | FV File |  |
|  | Federal Withhold Tax  | FedWHoldTax  | Optional  | 0-1  | Schema  | Must match pattern.  | FV File |  |
|  | Provincial Withhold Tax  | ProvWHoldTax  | Optional  | 0-1  | Schema  | Must match pattern.  | FV File |  |
|  | LSIF Federal Clawback  | LSIFClawbackFed  | Optional  | 0-1  | Schema  | Must match pattern.  | FV File |  |
|  | LSIF Provincial Clawback  | LSIFClawbackProv  | Optional  | 0-1  | Schema  | Must match pattern.  | FV File |  |
|  | Clawback  | Clawback  | Optional  | 0-1  | Schema  | Must match pattern.  | FV File |  |
|  | Total Deductions  | TotalDedns  | Mandatory  | 1  | Schema  | Element required. Must match pattern.  | FV File |  |
| Net Transaction Amount |  | NetAmt  | Mandatory  | 1  | Schema  | Element required. Must match pattern.  | FV File |  |
| Dilution Amount |  | DilAmt | Optional  | 0-1 | Schema  | Must match pattern.  | FV File |  |
|  |  |  |  |  | Fundserv  | **IF** a corresponding TFS order exists **AND** is **NOT** an error correction order, **THEN**  Dilution Amount must **NOT** exist. | 207  | A |
| Share Unit Price (NAV) |  | NAV  | Mandatory  | 1  | Schema  | Element required. Must match pattern.  | FV File |  |
| Share Units Transacted |  | UnitTrxnd  | Mandatory  | 1  | Schema  | Element required. Must match pattern.  | FV File |  |
| Settlement Method  |  | SettlMethd  | Mandatory  | 1 | Schema  | Element required. Must be an allowable value.  | FV File |  |
|  |  |  |  |  | Fundserv | **IF** a corresponding TFS order exists **AND** TFS Order.Settlement Method \<\>1, **THEN**,  Settlement Method must **NOT** equal 1 (N$M). | 829  | A |
|  |  |  |  |  |  | **IF** Transaction Type Detail \= 9 **AND** Order Status \<\> R **AND** record is received after  T+ 1 of the corresponding ICT order, **THEN** Settlement Method \<\> 1 (N$M). | 829  | B |
|  |  |  |  |  |  | **IF** Sell Contract exist **AND** Order Source is D **OR** F **AND** Settlement Source \= I **AND**  Intermediary Code is a valid N$M settling counterparty with the Management  Code, **THEN** Settlement Method must equal 1 (N$M). | 829  | C |
|  |  |  |  |  |  | **IF** Settlement Method \= 1 (N$M), **THEN** Fund Company **AND** Settlement Source  must be a Full N$M participants **AND** valid N$M settling counterparties. | 829  | D |
|  |  |  |  |  |  | **IF** Switch Contract section exist, **THEN** Settlement Method must equal 6\.  | 829  | E |
|  |  |  |  |  |  | Settlement Method must be the same for all funds with the same Sell Asset  Allocation Fund section. | 829  | F |
|  |  |  |  |  |  | Settlement Method must be the same for all funds within the Sell Segregated Fund  Maturity section. | 829  | G |

Customer Use Only October 7, 2025 72 of 179

| Settlement Amount  | SettlAmt  | Mandatory  | 1 | Schema  | Element required. Must match pattern.  | FV File |  |
| :---- | :---: | :---: | :---: | :---: | :---- | ----- | ----- |
|  |  |  |  | Fundserv | **IF** Correction Flag does **NOT** exist, **THEN** Settlement Amount must **NOT** be a  negative amount. | 830  | A |
|  |  |  |  |  | **IF** Switch Contract section exist, **THEN** Settlement Amount must equal 0.00.  | 830  | B |
|  |  |  |  |  | **IF** Transaction Type Detail \= 9, **THEN** Settlement Amount must **NOT** be a negative  amount. | 830  | C |
|  |  |  |  |  | **IF** Transaction Type Detail \= 9, **THEN** the total of all Settlement Amounts for funds  with Settlement Method \= 1 within the corresponding ICT Buy Contract must equal  the total of all Settlement Amount of funds with Settlement Method \= 1 in the ICT  Sell Contract on Settlement Date.  (Sent in FK file from NSR9 on Settlement Date) | 830  (Sent from   NSR9 on   Settlement   Date) | D |

Customer Use Only October 7, 2025 73 of 179  
Appendix 5: TFS/NFU Account Setup \- Joint Section Edits 

| Field |  |  |  |  | XML Tag  | Occurrence  | Frequency  | Source of Edit Edit  |  | Error |
| :---- | :---- | :---- | :---- | :---- | :---: | :---: | :---: | ----- | :---- | :---: |
| Joint Survivor Type  |  |  |  |  | JntSurType  | Mandatory  | 1 | Schema  | Must be allowable value.  | 999 |
|  |  |  |  |  |  |  |  | Fundserv  | **IF** Tax Code \= QC, **THEN** Joint Survivor Type must  \= T. | 115 |
| Joint Signature Type |  |  |  |  | JntSigType  | Mandatory  | 1  | Schema  | Must be allowable value.  | 999 |
| Joint Owner Section  |  |  |  |  | JntOwner  | Mandatory  | 1-5 | Schema  | Section required at least once. Can occur up to 5  times. | 999 |
|  |  |  |  |  |  |  |  | Fundserv  | **IF** Recipient Code \= 2 **AND** Tax Code \= QC, **THEN**  Joint Owner section must occur 1 time | 351 |
|  |  |  |  |  |  |  |  | Fundserv  | **IF** Account Type \= 05 or 06, **THEN** Joint Owner  Section must occur 1 time. | 351 |
|  | Client Info Section |  |  |  | ClientInfo  | Mandatory  | 1  | Schema  | Element required.  | 999 |
|  |  | Individual Section |  |  | Individual  | Mandatory  | 1  | Fundserv  | Section required.  | 120 |
|  |  |  | name group Section |  | name\_group  | Mandatory  | 1  | Fundserv  | Group required.  | 233 |
|  |  |  |  | Title Code  | TitleCode  | Optional  | 0-1  | Schema  | Must be allowable value.  | 999 |
|  |  |  |  | Last Name  | LastName  | Mandatory  | 1  | Schema  | Element required. Must match length   requirements. | 999 |
|  |  |  |  | First Name  | FirstName  | Mandatory  | 1  | Schema  | Element required. Must match length   requirements. | 999 |
|  |  |  | SIN |  | SIN  | Conditional  | 0-1 | Schema  | Must be 9 digit number. Must \<\> 000000000\.  | 999 |
|  |  |  |  |  |  |  |  | Fundserv  | **IF** Account Type \= 18, **THEN** SIN must exist **AND**  pass MOD 10 validation and does **NOT** begin with  8\. | 140 |
|  |  |  |  |  |  |  |  | Fundserv  | **IF** Account Designation \= 1, **THEN** SIN must pass  MOD 10 validation and must **NOT**  begin with 8\. | 140 |
|  |  |  |  |  |  |  |  | Fundserv  | **IF** Account Type \= 01, 05, **OR** 06, **THEN** SIN must  pass MOD 10 validation and must **NOT** begin with  8\. | 140 |
|  |  |  | Birth Date  |  | BirthDate  | Optional  | 0-1 | Schema  | Must match pattern.  | 999 |
|  |  |  |  |  |  |  |  | Fundserv  | Must be valid date.  | 024 |
|  |  |  |  |  |  |  |  | Fundserv  | **IF** Account Designation \= 1 **AND** Account Type \=  18, **THEN** Birth Date must exist. | 139 |
|  |  |  |  |  |  |  |  | Fundserv  | Must be a past date **AND** age must be \< 130  years. | 139 |
|  |  |  | Gender |  | Gender  | Optional  | 0-1 | Schema  | Must be allowable value.  | 999 |
|  |  |  |  |  |  |  |  | Fundserv  | **IF** Account Designation \= 1 **AND** Account Type \=  18, **THEN** Gender must exist | 364 |
|  |  | Language Code |  |  | Language  | Optional  | 0-1  | Schema  | Must be allowable value.  | 999 |
|  |  | Email |  |  | Email  | Optional  | 0-1  | Schema  | Must match length requirements.  | 999 |
|  | Address Section |  |  |  | Address  | Optional  | 0-1  | Schema  | Section optional. Can occur at most once.  | 999 |
|  |  |  |  | Address Line | AddressLn  | Mandatory  | 1-3  | Schema  | Element required. Can occur up to 3 times. Must  match length requirements. | 999 |
|  |  | City |  |  | City  | Mandatory  | 1  | Schema  | Element required. Must match length   requirements. | 999 |
|  |  | Province/State |  |  | ProvState  | Conditional | 0-1 | Fundserv  | **IF** Country \= CAN, **THEN** Province/State must  contain valid Province Code. | 206 |
|  |  |  |  |  |  |  |  | Fundserv  | **IF** Country \= USA, **THEN** Province/State must  contain valid State Code. | 206 |
|  |  | Country |  |  | Country  | Mandatory  | 1 | Schema  | Element required.  | 999 |
|  |  |  |  |  |  |  |  | Fundserv  | Must be a valid Country Code.  | 931 |
|  |  | Postal/Zip Code  |  |  | PostalZip  | Conditional  | 0-1 | Fundserv  | **IF** Country \= CAN **OR** USA, **THEN** Postal/Zip Code  required. | 955 |
|  |  |  |  |  |  |  |  | Fundserv  | **IF** Country \= CAN, **THEN** Postal/Zip Code must  match pattern A9A9A9. | 179 |
|  |  |  |  |  |  |  |  | Fundserv  | **IF** Country \= USA, **THEN** Postal/Zip Code must  match pattern 99999 **OR** 999999999\. | 179 |
|  |  |  |  | RDSP Relationship  | RDSPRel  | Conditional  | 0-1  | Schema  | Must be allowable value.  | 999 |

Customer Use Only October 7, 2025 74 of 179

|  |  |  |  |  |  | Fundserv  | IF Account Designation \= 1 AND Account Type \=  18, THEN RDSP Relationship must exist. | 401 |
| :---- | :---- | :---- | ----- | ----- | ----- | :---: | ----- | :---: |
|  |  |  |  |  |  | Fundserv  | **IF** Account Designation \<\> 1 **OR** Account Type \<\>  18, **THEN** RDSP Relationship must **NOT** exist**.** | 401 |
| Client Identity Verification  Section |  |  | IDVerify  | Conditional  | 0-1 | Fundserv  | **IF** JointOwner.ClientInfo.Individual section does  not exist, **THEN** Client Identity Verification section  must **NOT** exist. | 428 |
|  |  |  |  |  |  | Fundserv  | **IF** Account Designation \<\> 1, **THEN** Client Identity  Verification section must **NOT** exist. | 428 |
|  |  |  |  |  |  | Fundserv  | **IF** Fund Identifier exists **AND** is **NOT** a segregated  fund **OR** ALL, **THEN** Client Identity Verification  section must **NOT** exist. | 428 |
|  | Individual Identifier |  | IDType  | Mandatory  | 1  | Schema  | Element required. Must be allowable value.  | 999 |
|  | Other Description  |  | OtherDscrip  | Conditional | 0-1 | Schema  | Must match length requirements.  | 999 |
|  |  |  |  |  |  | Fundserv  | **IF** Individual Identifier \= "E", **THEN** Other  Description is required. | 429 |
|  |  |  |  |  |  | Fundserv  | **IF** Individual Identifier \<\> "E", **THEN** Other  Description must **NOT** exist. | 429 |
|  | ID Number |  | IDNum  | Mandatory  | 1  | Schema  | Element required. Must match length   requirements. | 999 |
|  | Place of Issue Section |  | PlaceIssue  | Mandatory  | 1  | Schema  | Section required.  | 999 |
|  |  | Country | Country  | Mandatory  | 1 | Schema  | Element required.  | 999 |
|  |  |  |  |  |  | Fundserv  | Must be a valid Country Code.  | 143 |
|  |  | Province/State | ProvState  | Conditional  | 0-1 | Fundserv  | **IF** Country \= CAN, **THEN** Province/State must  contain valid Province Code. | 206 |
|  |  |  |  |  |  | Fundserv  | **IF** Country \= USA, **THEN** Province/State must  contain valid State Code. | 206 |
| ForeignPerson Section |  |  | ForeignPerson  | Conditional  | 0-1  | Fundserv  | **IF** Account Designation \= 1 **AND** Account Type \=  01, **THEN** Foreign Person must exist. | 605 |
|  | Individual TIN Section  |  | IndividualTIN  | Mandatory  | 1-5 | Schema  | Section required **AND** can occur up to 5 times.  | 999 |
|  |  |  |  |  |  | Fundserv  | **IF** Account Designation \= 1 **AND** Account Type \=  01, **THEN** Individual TIN Section must exist at least  2 times. | 617 |
|  |  | Recipient Country | Country  | Mandatory | 1 | Schema  | Element required. Must match pattern.  | 999 |
|  |  |  |  |  |  | Fundserv  | Must be a valid Country Code.  | 143 |
|  |  |  |  |  |  | Fundserv  | **IF** Account Designation \= 1 **AND** Account Type \=  01, **THEN** one occurrence of Individual  TIN.Recipient Country must \= USA.  | 576 |
|  |  |  |  |  |  | Fundserv  | IF Account Designation \= 1 **AND** Account Type \=  01, **THEN** one occurrence of Individual  TIN.Recipient Country must \<\> USA.  | 576 |
|  |  | Effective Date  | EffectDate | Mandatory | 1 | Schema  | Element required. Must match pattern.  | 999 |
|  |  |  |  |  |  | Fundserv  | Must be a valid calendar date.  | 268 |
|  |  | Person Status  | PersonStatus  | Mandatory | 1 | Schema  | Element required. Must be an allowable value.  | 999 |
|  |  |  |  |  |  | Fundserv  | Must \<\> U. (NFU only. Value does NOT exist in TFS  | 616 |
|  |  | Tax Identification   Number | TIN  | Conditional | 0-1 | Schema  | Must match length requirements  | 999 |
|  |  |  |  |  |  | Fundserv  | **IF** Recipient Country \= USA, **THEN** Tax   Identification Number must **NOT** contain 9  consecutive zeros, ones, eights **OR** nines.  | 606 |
|  |  |  |  |  |  | Fundserv  | **IF** Recipient Country \= USA **AND** Person Status \=  R, **THEN** Tax Identification Number is required. | 600 |
|  |  | No TIN Reason Code | NoTINReasonCode  | Conditional  | 0-1 | Schema  | Must be an allowable value.  | 999 |
|  |  |  |  |  |  | Fundserv  | **IF** Recipient Country \<\> USA **AND** Tax   Identification Number does **NOT** exist, **AND**  Person Status \= R, **THEN** No TIN Reason Code  must exist. | 553 |
|  |  |  |  |  |  | Fundserv  | **IF** Tax Identification Number exists, **THEN** No TIN  Reason Code must **NOT** exist. | 604 |

Customer Use Only October 7, 2025 75 of 179  
Appendix 6: TFS Order Request Section Edits 

| Field |  |  |  |  | XML Tag  | Occurrence  | Frequency  | Source of Edit Edit  |  | Error |
| :---- | :---- | :---- | :---- | :---- | :---: | :---: | :---: | ----- | ----- | :---: |
| Order Set Section  |  |  |  |  | OrdSet  | Mandatory  | 1 | Schema  | Element required.  | 999 |
|  |  |  |  |  |  |  |  | Fundserv  | All input data must match character set.  | 375 |
|  | xmlns:xsi |  |  |  | xmlns:xsi  | Mandatory  | 1  | Schema  | Attribute required. Must be allowable value.  | 002 |
|  | xmlns |  |  |  | xmlns  | Mandatory  | 1  | Schema  | Attribute required. Must be allowable value.  | 999 |
|  | xsi:schemaLocation |  |  |  | xsi:schemaLocation  | Mandatory  | 1  | Schema  | Attribute required. Must be allowable value.  | 999 |
|  | Version |  |  |  | Version  | Mandatory  | 1  | Schema  | Attribute required. Must be allowable value.  | 999 |
|  | Message Section |  |  |  | Msg  | Mandatory  | 1 | Fundserv  | Section required at least once. Can occur multiple  times. | 002 |
|  |  |  |  |  |  |  |  | Fundserv  | For interactive orders, Message Section must occur  exactly once. | 343 |
|  |  | Message Create Section |  |  | MsgCreate  | Mandatory  | 1  | Schema  | Section required.  | 999 |
|  |  |  | Date  |  | Date  | Mandatory  | 1 | Schema  | Element required. Must match pattern.  | 999 |
|  |  |  |  |  |  |  |  | Fundserv  | Must be valid date.  | 348 |
|  |  |  | Time |  | Time  | Mandatory  | 1  | Schema  | Element required. Must be valid time.  | 999 |
|  |  |  | Source Section |  | Src  | Mandatory  | 1 | Schema  | Section required.  | 999 |
|  |  |  |  |  |  |  |  | Schema  | Must contain one Management Code, one Dealer Code,  **OR** one Intermediary Code. | 999 |
|  |  |  |  | Source Type  | SrcType  | Mandatory  | 1 | Schema  | Element required. Must be allowable value.  | 999 |
|  |  |  |  |  |  |  |  | Fundserv  | Must \<\> F.  | 905 |
|  |  |  |  |  |  |  |  | Fundserv  | **IF** In Cash Transfer section exists, **THEN** Source Type  must \= D. | 085 |
|  |  |  |  | Dealer Code  | DlrCode | Conditional  | 0-1 | Schema  | Must match length requirements.  | 999 |
|  |  |  |  |  |  |  |  | Fundserv  | **IF** Source Type \= D, **THEN** Dealer Code required.  | 903 |
|  |  |  |  |  |  |  |  | Fundserv  | Must be valid Fundserv dealer.  | 077 |
|  |  |  |  |  |  |  |  | Fundserv  | Must be same **OR** related to sender Dealer Code in the  8.8 filename. | 902 |
|  |  |  |  |  |  |  |  | Fundserv  | **IF** Action Code \= CAX **OR** REV, **THEN** a bank account for  the corresponding currency must be present in N$M  system. | 228 |
|  |  |  |  | Management Code  | MgmtCode  | Conditional  | 0-1 | Schema  | Must match pattern.  | 999 |
|  |  |  |  |  |  |  |  | Fundserv  | Must **NOT** exist.  | 903 |
|  |  |  |  | Intermediary Code | IntCode  | Conditional  | 0-1 | Schema  | Must match pattern.  | 999 |
|  |  |  |  |  |  |  |  | Fundserv  | **IF** Source Type \= I, **THEN** Intermediary Code required.  | 903 |
|  |  |  |  |  |  |  |  | Fundserv  | Must be valid Fundserv intermediary.  | 030 |
|  |  |  |  |  |  |  |  | Fundserv  | Must be same **OR** related to sender Intermediary Code  in the 8.8 filename. | 902 |
|  |  |  |  |  |  |  |  | Fundserv  | **IF** Intermediary Code exists **AND** currency of fund \= US  Dollar, Euro, **OR** Pound, **THEN** intermediary must be set  up for the corresponding currency at Fundserv. | 030 |
|  |  |  | Target Section  |  | Target  | Mandatory  | 1 | Schema  | Section required.  | 999 |
|  |  |  |  |  |  |  |  | Schema  | Must contain one Management Code, one Dealer Code,  **OR** one Intermediary Code. | 999 |
|  |  |  |  | Target Type  | TargetType  | Mandatory  | 1 | Schema  | Element required. Must be allowable value.  | 999 |
|  |  |  |  |  |  |  |  | Fundserv  | Must \<\> D **OR** I.  | 906 |
|  |  |  |  | Dealer Code  | DlrCode  | Conditional  | 0-1 | Schema  | Must match length requirements.  | 999 |
|  |  |  |  |  |  |  |  | Fundserv  | Must **NOT** exist.  | 904 |
|  |  |  |  | Management Code  | MgmtCode  | Conditional  | 0-1 | Schema  | Must match pattern.  | 999 |
|  |  |  |  |  |  |  |  | Fundserv  | **IF** Target Type \= F, **THEN** Management Code required.  | 904 |
|  |  |  |  |  |  |  |  | Fundserv  | Must be a valid Fundserv management company.  | 016 |
|  |  |  |  |  |  |  |  | Fundserv  | Must **NOT** conflict with recipient code in the 8.8  filename. | 902 |
|  |  |  |  | Intermediary Code  | IntCode  | Conditional  | 0-1 | Schema  | Must match pattern.  | 999 |
|  |  |  |  |  |  |  |  | Fundserv  | Must **NOT** exist.  | 904 |
|  |  | Network Section |  |  | Ntwrk  | Conditional  | 0-1  | Fundserv  | Section must **NOT** exist. Fundserv adds the Network  section before transmitting the Order to the Target. | 915 |
|  |  |  | Network ID |  | NtwrkID  | Mandatory  | 1  | Fundserv  | Fundserv populated field. Must **NOT** exist.  | 915 |
|  |  |  | Date |  | Date  | Mandatory  | 1  | Fundserv  | Fundserv populated field. Must **NOT** exist.  | 915 |
|  |  |  | Time |  | Time  | Mandatory  | 1  | Fundserv  | Fundserv populated field. Must **NOT** exist.  | 915 |
|  |  |  | Order ID |  | OrdID  | Optional  | 0-1  | Fundserv  | Fundserv populated field. Must **NOT** exist.  | 915 |
|  |  |  | Trade Date |  | TradeDate  | Mandatory  | 1  | Fundserv  | Fundserv populated field. Must **NOT** exist.  | 915 |
|  |  |  | Settlement Date |  | SettlDate  | Mandatory  | 1  | Fundserv  | Fundserv populated field. Must **NOT** exist.  | 915 |

Customer Use Only October 7, 2025 76 of 179

| Message Type Section  |  |  | MsgType  | Mandatory  | 1 | Schema  | Section required.  | 999 |
| :---- | :---- | :---- | ----- | ----- | ----- | :---: | :---- | :---: |
|  |  |  |  |  |  | Schema  | Must contain one Order Request, one Order Inquiry,  **OR** one Order Response. | 999 |
|  | Order Request Section |  | OrdReq  | Mandatory  | 0-1  | Fundserv  | Section required.  | 907 |
|  |  | Action Code  | ActnCode  | Mandatory | 1 | Schema  | Element required. Must be allowable value.  | 999 |
|  |  |  |  |  |  | Fundserv  | **IF** Action Code \= CHG, **THEN** Transaction Type and  Transaction Type Details must match original order.  | 203 |
|  |  |  |  |  |  | Fundserv  | **IF** Action Code \= CAN, CHG, **OR** CAX, **THEN** order key  must match accepted new order.  | 017 |
|  |  |  |  |  |  | Fundserv  | **IF** Action Code \= CAN **OR** CHG, **THEN** order key must  **NOT** match an accepted order with N50/F50 response. | 017 |
|  |  |  |  |  |  | Fundserv  | **IF** Action Code \= AOT, **THEN** AOT section required.  | 042 |
|  |  |  |  |  |  | Fundserv  | **IF** original order Originator Network \= ATON, **THEN**  Action Code must \<\> CHG **OR** CAN.  | 042 |
|  |  |  |  |  |  | Fundserv  | **IF** Action Code \= CAX, **THEN** order must match an  unsettled F00 **OR** F01 contract.  | 042 |
|  |  |  |  |  |  | Fundserv  | **IF** Action Code \= CAX, **THEN** order must be received  before cut-off time on SD-1 (settlement date \-1).  | 042 |
|  |  |  |  |  |  | Fundserv  | **IF** Action Code \= CAN **OR** CAX, **THEN** order must **NOT**  match an order in CAN **OR** CAX state.  | 042 |
|  |  |  |  |  |  | Fundserv  | **IF** Action Code \= CAX, **THEN** order must **NOT** match a  T+1 settling trade.  | 042 |
|  |  |  |  |  |  | Fundserv  | **IF** Action Code \= CAX, **THEN** MessageCreate.Source  must be a valid N$M participant.  | 042 |
|  |  |  |  |  |  | Fundserv  | **IF** Action Code \= CHG **AND** original order Originator  Network \<\> ATON, **THEN** Originator Network must **NOT**  exist. | 042 |
|  |  |  |  |  |  | Fundserv | **IF** In Cash Transfer section exists, **THEN** Action Code  must \= NEW, CHG, CAN, **OR** CAX. | 042 |
|  |  | Source ID  | SrcID  | Mandatory  | 1 | Schema  | Element required. Must match pattern.  | 999 |
|  |  |  |  |  |  | Fundserv  | Must **NOT** be duplicate order.  | 012 |
|  |  | Transaction Revision Number  | TrxnRevn  | Conditional  | 0-1 | Schema  | Must match pattern.  | 999 |
|  |  |  |  |  |  | Fundserv  | **IF** Action Code \= CHG, **THEN** Transaction Revision  Number required **AND** must be higher than all  matching orders previously received by TFS.  | 063 |
|  |  |  |  |  |  | Fundserv  | **IF** Action Code \<\> CHG, **THEN** Transaction Revision  Number must **NOT** exist.  | 346 |
|  |  | Dealer Code  | DlrCode  | Conditional  | 0-1 | Schema  | Must match pattern.  | 999 |
|  |  |  |  |  |  | Fundserv  | **IF** Source Type \= I, **THEN** Dealer Code required.  | 077 |
|  |  |  |  |  |  | Fundserv  | **IF** Source Type \= D, **THEN** Dealer Code must **NOT** exist.  | 350 |
|  |  |  |  |  |  | Fundserv  | **IF** OrderRequest.DealerCode exists **AND** Account Setup  section exists, **THEN** OrderRequest.DealerCode must \=  AccountSetup.Dealer.DealerCode.  | 077 |
|  |  |  |  |  |  | Fundserv  | Must be valid Fundserv Dealer Code.  | 077 |
|  |  |  |  |  |  | Fundserv  | **IF** Dilution Source \= D, **THEN** OrderRequest.DealerCode  must be a valid N$M participant.  | 077 |
|  |  |  |  |  |  | Fundserv  | **IF** Dilution Source \= D, **THEN** a bank account for the  corresponding currency must be present in N$M  system. | 228 |
|  |  | Intermediary Code  | IntCode  | Conditional  | 0-1 | Schema  | Must match pattern.  | 999 |
|  |  |  |  |  |  | Fundserv  | Must be valid Fundserv Intermediary Code.  | 030 |
|  |  |  |  |  |  | Fundserv  | **IF** Account Designation \= 3 **AND** Source Type \= D, **THEN**  Intermediary Code required. | 924 |
|  |  |  |  |  |  | Fundserv  | **IF** Account Designation \<\> 3 **OR** Source Type \= I, **THEN**  Intermediary Code must **NOT** exist.  | 923 |
|  |  |  |  |  |  | Fundserv  | **IF** OrderRequest.IntermediaryCode exists **AND** Account  Setup section exists, **THEN**   OrderRequest.IntermediaryCode must \=   AccountSetup.Intermediary.IntermediaryCode.  | 030 |
|  |  |  |  |  |  | Fundserv  | **IF** Intermediary Code exists **AND** currency of fund \= US  Dollar, Euro, **OR** Pound, **THEN** intermediary must be set  up for the corresponding currency at Fundserv. | 030 |

Customer Use Only October 7, 2025 77 of 179

|  |  |  |  |  | Fundserv  | IF In Cash Transfer section exists, THEN Intermediary  Code must NOT exist. | 924 |
| :---- | :---- | ----- | ----- | ----- | :---: | :---- | :---: |
|  |  |  |  |  | Fundserv  | **IF** Action Code \= REV **AND** Source Type \= D **AND**  Account Designation of original order \= 3, **THEN**  Intermediary Code required.  | 924 |
|  |  |  |  |  | Fundserv  | **IF** Action Code \= REV **AND** Source Type \= D **AND**  Account Designation of original order \<\> 3, **THEN**  Intermediary Code must **NOT** exist. | 923 |
| Clerk ID |  | ClerkID  | Optional  | 0-1  | Schema  | Must match length requirements.  | 999 |
| Sales Rep Code |  | RepCode  | Mandatory  | 1  | Schema  | Element required. Must match pattern.  | 999 |
| Suppress Confirm Indicator  |  | SupConfirm  | Conditional  | 0-1 | Schema  | Must be allowable value.  | 999 |
|  |  |  |  |  | Fundserv  | **IF** Account Designation \= 1, **THEN** Suppress Confirm  Indicator must **NOT** exist.  | 117 |
|  |  |  |  |  | Fundserv  | **IF** Account Designation \= 3 **AND** Source Type \= D, **THEN**  Suppress Confirm Indicator must **NOT** exist.  | 117 |
| Dilution Source  |  | DilSrc  | Optional  | 0-1 | Schema  | Must be allowable value.  | 999 |
|  |  |  |  |  | Fundserv  | **IF** Source Type \<\> I, **THEN** Dilution Source must **NOT**  exist.  | 389 |
|  |  |  |  |  | Fundserv  | **IF** Action Code \<\> REV, AOT, **OR** CAX, **THEN** Dilution  Source must **NOT** exist.  | 389 |
|  |  |  |  |  | Fundserv  | **IF** Dilution Link exists, **THEN** all orders with the same  Dilution Link ID from the same combination of source  code (Dealer/Intermediary) **AND** Management Code  must have the same Dilution Source value. | 389 |
| Dilution Link Section  |  | DilLink  | Optional  | 0-1 | Schema  | Can occur at most once.  | 999 |
|  |  |  |  |  | Fundserv  | **IF** Action Code \<\> AOT, REV, **OR** CAX, **THEN** Dilution Link  section must **NOT** exist. | 555 |
|  | Dilution Link ID  | DilLinkID | Mandatory  | 1 | Schema  | Element required. Must match length requirements.  | 999 |
|  |  |  |  |  | Fundserv  | Must only begin with "N" **IF** generated by Fundserv.  | 556 |
|  |  |  |  |  | Fundserv  | Must **NOT** match an order received before a different 4  pm cutoff time for the same combination of source  code (Dealer/Intermediary) and Management Code. | 556 |
|  | Correction Number | CorrectnNum  | Mandatory  | 1 | Schema  | Element required. Must be an allowable value 01-10.  | 999 |
|  |  |  |  |  | Fundserv  | Must be unique for all successfully validated (N50 **OR**  F50) **AND/OR** Fund Company rejected (F99) orders with  the same combination of Dilution Link ID, source code  (Dealer/Intermediary), **AND** Management Code. | 557 |
|  | Total Corrections  | TotCorrectn  | Mandatory  | 1 | Schema  | Element required. Must be an allowable value 02-10.  | 999 |
|  |  |  |  |  | Fundserv  | Must be the same for all orders with the same  combination of Dilution Link ID, source code  (Dealer/Intermediary), **AND** Management Code. | 558 |
|  |  |  |  |  | Fundserv  | Must be greater than **OR** equal to Correction Number.  | 558 |
| Order Detail Section  |  | OrdDtl  | Conditional  | 0-1 | Fundserv  | **IF** Action Code \= NEW, CHG, **OR** AOT, **THEN** Order Detail  section required.  | 996 |
|  |  |  |  |  | Fundserv  | **IF** Action Code \= CAN, CAX, **OR** REV, **THEN** Order Detail  section must **NOT** exist.  | 995 |
|  |  |  |  |  | Schema  | Must contain one Account Setup, one Account Lookup,  **OR** one Account Transfer section. | 999 |
|  | Account Setup Section  | AcctSetup  | Conditional  | 0-1 | Fundserv  | **IF** Sell **OR** Switch sections exist, **THEN** Account Setup  section must **NOT** exist.  | 922 |
|  |  |  |  |  | Fundserv  | **IF** In Cash Transfer section exists, **THEN** Account Setup  Section must exist. | 919 |
|  |  |  |  |  | Fundserv  | **IF** Transaction Type \= 8 **AND** Transaction Type Details \=  4 **AND** Originator Network does **NOT** exist, **THEN**  Account Setup section must **NOT** exist.  | 922 |
|  |  |  |  |  | Fundserv  | **IF** Transaction Type \= 8 **AND** Transaction Type Details \=  8 **AND** Originator Network does **NOT** exist **AND**  Account Designation \<\> From Account Designation,  **THEN** Account Setup section must **NOT** exist.  | 922 |

Customer Use Only October 7, 2025 78 of 179

|  |  |  |  |  |  |  | Fundserv  | IF Originator Network \= ATON AND   Contribution/Withdrawal Code \= M, THEN Account  Setup section required. | 919 |
| :---- | :---- | :---- | :---- | ----- | ----- | ----- | ----- | ----- | ----- |
|  |  |  |  |  |  |  | Fundserv  | See Account Setup Edits. |  |
| Account Lookup Section |  |  |  | AcctLookup  | Conditional  | 0-1  | Fundserv  | **IF** Transaction Type \= 8 **AND** Transaction Type Details \=  4 **OR** 8, **THEN** Account Lookup section must **NOT** exist.  | 312 |
|  | Management Code  |  |  | MgmtCode  | Mandatory  | 1 | Schema  | Element required. Must match pattern.  | 999 |
|  |  |  |  |  |  |  | Fundserv  | Must match Target.ManagementCode.  | 016 |
|  | Fund Account ID  |  |  | FundAcctID  | Mandatory  | 1 | Schema  | Element required. Must match length requirements.  | 999 |
|  |  |  |  |  |  |  | Fundserv  | Must **NOT** contain exactly 3 characters equaling  â€œNEWâ€. | 006 |
|  | Account Designation |  |  | AcctDesig  | Mandatory  | 1 | Schema  | Element required. Must be allowable value.  | 999 |
|  |  |  |  |  |  |  | Fundserv  | **IF** Transaction Type \= 4 **AND** Source Type \= D, **THEN**  Account Designation must \= 1 **OR** 2\.  | 023 |
| Account Transfer Section  |  |  |  | AcctTrnsfr  | Conditional  | 0-1 | Fundserv  | **IF** Transaction Type \= 8 **AND** Transaction Type Details \=  4 **AND** Originator Network does **NOT** exist, **THEN**  Account Transfer section required.  | 310 |
|  |  |  |  |  |  |  | Fundserv  | **IF** Transaction Type \= 8 **AND** Transaction Type Details \=  8 **AND** AccountDesignation \= 1 **AND**   FromAccount.AccountDesignation \= 1, **THEN** Account  Transfer section required.  | 310 |
|  |  |  |  |  |  |  | Fundserv  | **IF** Transaction Type \<\> 8 **AND** Transaction Type Details  \<\> 4 **OR** 8, **THEN** Account Transfer section must **NOT**  exist.  | 311 |
|  |  |  |  |  |  |  | Fundserv  | **IF** Originator Network \= ATON **AND**   Contribution/Withdrawal Code does **NOT** exist, **THEN**  Account Transfer section required.  | 310 |
|  |  |  |  |  |  |  | See Account Transfer Edits |  |  |
| Transaction Detail Section  |  |  |  | TrxnDtl  | Mandatory  | 1 | Schema  | Section required.  | 999 |
|  |  |  |  |  |  |  | Schema  | One Buy, Sell, Switch, ~~T~~ransfer, **OR** In Cash Transfer  section must exist.  | 999 |
|  | Buy Section  |  |  | Buy  | Conditional  | 0-1  | Schema | See Purchase Edits. |  |
|  | Sell Section  |  |  | Sell  | Conditional  | 0-1  | Schema | See Redemption Edits. |  |
|  | Switch Section  |  |  | Switch  | Conditional  | 0-1  | Schema | See Switch Edits. |  |
|  | Transfer Section  |  |  | Trnsfr  | Conditional  | 0-1  | Schema | See Transfer Edits. |  |
|  | In Cash Transfer Section  |  |  | ICT  | Conditional  | 0-1  | Schema | See In Cash Transfer Edits. |  |
|  | AOT Section  |  |  | AOT  | Conditional  | 0-1  | Fundserv | See AOT Edits. |  |
|  | CDIC Data Section  |  |  | CDICData  | Conditional  | 0-1 | Fundserv  | Can occur once.  | 999 |
|  |  |  |  |  |  |  | Fundserv  | **IF** AccountDesignation \= 1, **THEN** section must **NOT**  exist. | 023 |
|  |  |  |  |  |  |  | Fundserv  | **IF** AccountDesignation \= 2 **AND** Buy.FundID is a CDIC  eligible product, **THEN** CDIC Data section required. | 595 |
|  |  |  |  |  |  |  | Fundserv  | **IF** AccountDesignation \= 2 **AND** Switch.FundID is a CDIC  eligible product, **THEN** CDIC Data section required. | 595 |
|  |  |  |  |  |  |  | Fundserv  | **IF** AccountDesignation \= 2 **AND** Transfer.FundID is a  CDIC eligible product **AND** Originator Network does  **NOT** exist, **THEN** CDIC Data section required. | 595 |
|  |  |  |  |  |  |  | Fundserv  | **IF** Sell **OR** ICT exists, **THEN** CDICData section must **NOT**  exist. | 599 |
|  |  | Legal Entity Identifier |  | LEI  | Optional  | 0-1  | Schema  | Must match pattern.  | 999 |
|  |  | UCI Data Section |  | UCIData  | Mandatory  | 1-11  | Schema  | Section required. Can occur 11 times.  | 999 |
|  |  |  | UCI  | UCI  | Mandatory  | 1  | Schema  | Element required. Must match pattern.  | 999 |
|  |  |  | SIA Individual Flag  | SIAIndividualFlg  | Optional  | 0-1  | Schema  | Must be an allowable value.  | 999 |
|  |  |  | Interest In Deposit  | InterestInDeposit | Conditional  | 0-1 | Schema  | Must match pattern.  | 999 |
|  |  |  |  |  |  |  | Fundserv  | **IF** Interest in Deposit exists, **THEN** it must be \> 0.000%.  | 596 |
|  |  |  |  |  |  |  | Fundserv  | The total of Interest in Deposit occurrences within the  UCl Data section must \= 100.000. | 597 |
|  |  | Reversal Section  |  | Reversal  | Conditional  | 0-1 |  Fundserv  | **IF** Action Code \= REV, **THEN** Reversal section required.  | 997 |
|  |  |  |  |  |  |  | Fundserv  | **IF** Action Code \<\> REV, **THEN** Reversal section must  **NOT** exist.  | 998 |

Customer Use Only October 7, 2025 79 of 179

|  |  |  |  |  | Fundserv  | IF MessageCreate.Source is NOT a valid N$M  participant, THEN Reversal section must NOT exist.  | 203 |
| :---- | ----- | ----- | ----- | ----- | :---: | :---- | :---: |
|  | Original Trade Date  | OrigDate  | Mandatory  | 1 | Schema  | Element required. Must match pattern.  | 999 |
|  |  |  |  |  | Fundserv  | Must be a past Fundserv business date only **AND NOT**  equal to the current date. | 308 |
|  |  |  |  |  | Fundserv  | **IF** Original Order ID exists **AND** corresponding  contracted order exists with the same matching key,  **THEN** Original Trade Date must match contract Trade  Date. | 308 |
|  | Original Order ID  | OrigOrdID  | Conditional  | 0-1 | Fundserv  | Original Order ID must exist **IF** Gross Transaction  Amount does **NOT** exist. | 202 |
|  |  |  |  |  | Schema  | Must match length requirements.  | 999 |
|  |  |  |  |  | Fundserv  | **IF** Transaction Type Details of original order \= 8 **AND**  (Account Designation of original order **OR** From  Account.Account Designation of original order \= 3),  **THEN** Source Type must \= I.  | 905 |
|  |  |  |  |  | Fundserv  | **IF** Source Type \= D **AND** Account Designation of original  order \= 3 **AND** Transaction Type of original order \= 5  **AND** Source Type of original order \= D **AND** Settlement  Source of original order \= D **AND** (Network Date **AND**  Network Time) \> CRA RSP deadline, **THEN** Trade Date of  original order must be \> CRA RSP deadline. | 186 |
|  |  |  |  |  | Schema  | Element required. Must match length requirements.  | 999 |
|  |  |  |  |  | Fundserv  | **IF** corresponding order exists, **THEN** Originator Network of original order \<\> ATON. | 186 |
|  | Fund Account ID | FundAcctID  | Mandatory  | 1  | Schema  | Element required. Must match pattern.  | 999 |
|  | Fund ID  | FundID  | Mandatory  | 1 | Schema  | Element required. Must match length requirements.  | 999 |
|  |  |  |  |  | Fundserv  | Fund ID must be a valid Fundserv fund.  | 005 |
|  | Transaction Type  | TrxnTyp  | Mandatory | 1 | Fundserv  | Must \= 4, 5, 6, or 8\.  | 559 |
|  |  |  |  |  | Fundserv  | **IF** Original Order ID exists **AND** corresponding  contracted order exists with the same matching key,  **THEN** Transaction Type must match contract  Transaction Type. | 559 |
|  |  |  |  |  | Schema  | Must match pattern.  | 999 |
|  | Transaction Type Details  | TrxnTypDtl  | Conditional  | 0-1 | Fundserv  | Must \= 1, 6, 7 **OR** 8\.  | 560 |
|  |  |  |  |  | Fundserv  | **IF** Transaction Type \= 4, **THEN** Transaction Type Details  must **NOT** exist. | 560 |
|  |  |  |  |  | Fundserv  | **IF** Transaction Type \= 5, **THEN** Transaction Type Details  must \<\> 1 **OR** 7\. | 560 |
|  |  |  |  |  | Fundserv  | **IF** Transaction Type \= 6, **THEN** Transaction Type Details  must \<\> 1 **OR** 6\. | 560 |
|  |  |  |  |  | Fundserv  | **IF** Transaction Type \= 8, **THEN** Transaction Type Details  must exist **AND** must \= 1 **OR** 8\. | 560 |
|  |  |  |  |  | Fundserv  | **IF** Original Order ID exists **AND** corresponding  contracted order exists with the same matching key,  **THEN** Transaction Type Details must match contract  Transaction Type Details. | 560 |
|  |  |  |  |  | Schema  | Must match pattern.  | 999 |
|  | Gross Transaction Amount | GrossAmt  | Conditional  | 0-1  | Schema  | Must match pattern.  | 999 |
|  | Net Transaction Amount | NetAmt  | Optional  | 0-1  | Schema  | Must match length requirements.  | 999 |
|  | Source ID | SrcID  | Optional  | 0-1  | Schema  | Must be an allowable value.  | 999 |
|  | Contribution Withdrawal Code | CntbWdCode  | Optional  | 0-1  | Schema  | Must match length requirements.  | 999 |
|  | From Fund ID  | FrmFundID  | Conditional | 0-1 | Schema  | Must match length requirements.  | 999 |
|  |  |  |  |  | Fundserv  | From Fund ID must exist **AND** only exist if Transaction  Type Details \= 1\. | 561 |
|  |  |  |  |  | Fundserv  | From Fund ID must **NOT** equal Fund ID.  | 561 |
|  |  |  |  |  | Fundserv  | From Fund ID must be a valid Fundserv fund.  | 561 |
|  | From Fund Account ID  | FrmFundAcctID  | Conditional  | 0-1 | Schema  | Must match pattern.  | 999 |
|  |  |  |  |  | Fundserv  | **IF** Transaction Type Details \= 8 **AND** Original Order ID does **NOT** exist **THEN** From Fund Account ID required. | 173 |
|  |  |  |  |  | Fundserv  | Must only exist if Transaction Type Details \= 8\.  | 173 |

Customer Use Only October 7, 2025 80 of 179

[image1]: ../images/v36-requirements_image1.png

[image2]: ../images/v36-requirements_image2.png

[image3]: ../images/v36-requirements_image3.png

[image4]: ../images/v36-requirements_image4.png

[image5]: ../images/v36-requirements_image5.png

[image6]: ../images/v36-requirements_image6.png

[image7]: ../images/v36-requirements_image7.png

[image8]: ../images/v36-requirements_image8.png

[image9]: ../images/v36-requirements_image9.png

[image10]: ../images/v36-requirements_image10.png

[image11]: ../images/v36-requirements_image11.png

[image12]: ../images/v36-requirements_image12.png

[image13]: ../images/v36-requirements_image13.png

[image14]: ../images/v36-requirements_image14.png
