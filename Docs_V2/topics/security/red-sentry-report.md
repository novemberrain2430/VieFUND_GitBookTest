![][image1]

**Web App/API Penetration Test** 

**REPORT** 

**January 14, 2026**  
**![][image2]**

This engagement was performed in accordance with the Statement of Work, and the procedures were limited to those described in that agreement. The findings and recommendations resulting from the assessment are provided in the attached report. Given the time-boxed scope of this assessment and its reliance on client 

provided information, the findings in this report should not be taken as a comprehensive listing of all security issues.

Confidential   
**TABLE OF CONTENTS** 

**Summary 4** 

Project Overview 4 Goals 4 Dates 4 Findings 4 Scope 4 Executive Summary 5 

**Tests Performed 7 Findings 10** 

Broken Access Control on Administrator-Only Management Pages \[TYHX33P   
10 

F0001\] 

Stored Cross-Site Scripting via SVG File Upload in Fund Fact Feature   
15 

\[TYHX33P-F0002\] 

Missing Security Headers \[TYHX33P-F0003\] 20 Server Banner Disclosure \[TYHX33P-F0004\] 22 Support for Deprecated TLS Protocols (1.0 and 1.1) \[TYHX33P-F0005\] 24 Use of Insecure Cipher Suites (RC4 and 3DES) \[TYHX33P-F0006\] 26 

**Appendices 28**

Confidential   
**Summary** 

**Project Overview** 

Viefund engaged Red Sentry to assess the security of their web application. The following report details the findings identified during the course of the engagement. 

**Goals** 

Identify vulnerabilities in the companyâ€™s web application following the OWASP Top 10 methodology. 

**Dates** 

**KICKOFF** 

January 06, 2026 **Findings**   
**TESTING PERIOD** 

January 06 \- January 14, 2026   
**DELIVERY** 

January 14, 2026 

**D** 

**8** 

**EXPLOITS**

**GRADE0 3 1 0 4 Scope** 

test.viefund.com 

4 Confidential   
**Executive Summary** 

The assessment team conducted a penetration test on Viefund's web application. Overall, the application needs improvement as 8 issues were detected across various severity levels. 

Regarding the severity of the findings, 3 high-severity vulnerabilities related to Broken Access Control were identified. These issues occur when the application does not properly enforce restrictions on what authenticated users can do. This allows a malicious actor to bypass security permissions to view, modify, or delete data belonging to other users, potentially leading to a massive data breach or 

unauthorized administrative actions. 

Then, 1 medium-severity vulnerability was found involving Stored Cross-Site Scripting (XSS) via SVG File Upload in the Fund Fact feature. This flaw allows an attacker to upload a malicious file containing hidden scripts. When another user or administrator views this file, the script executes in their browser, allowing the attacker to steal session cookies, hijack accounts, or deface the website content. 

Finally, 4 informational findings were identified relating to Missing Security Headers, Banner Disclosure, Support for Deprecated TLS Protocols (1.0 and 1.1), and the Use of Insecure Cipher Suites (RC4 and 3DES). These issues represent a lack of server hardening rather than active exploits. Specifically, they expose technical details that assist in attacker reconnaissance and utilize weak encryption standards that could allow for the interception of sensitive data on the network. 

In summary, to improve the organizationâ€™s security posture, the assessment team recommends implementing strict server-side access control checks for all sensitive requests and sanitizing all file uploads to prevent malicious scripts. Furthermore, it is advised to disable outdated TLS versions and weak ciphers, suppress server version banners, and enable all recommended HTTP security headers to ensure a robust 

defense-in-depth strategy.

5 Confidential   
![][image3]  
**Figure 1: Security risk chart** 

The Broken Access Control and XSS vulnerabilities create a high risk of unauthorized data access and modification. Weak encryption and missing headers further allow attackers to monitor traffic. These combined issues seriously threaten the privacy, accuracy, and safety of user information across the entire application.

6 Confidential   
**Tests Performed** 

For this project, the assessment team followed both a black-box and a white-box approach to testing, looking for common vectors of attack according to the OWASP Top 10 methodology. From a black-box approach, the main goal is to discover issues from an unauthenticated perspective. This includes the following tests: 

**API Discovery** 

Using a proxy connection, intercept HTTP connections to discover underlying APIs that could expose resources for an unauthenticated user. 

**Authenticated Sensitive Data Exposure** 

Attempt to access information about resources like API keys, tokens, cloud credentials, or private information like Personally Identifiable Information (PII). 

**Authentication Bypass** 

We used a set of attacks to access information requiring session tokens. This involves active user enumeration attacks and password spraying from standard common lists. 

**Broken Access Controls** 

Look for ways to access resources from an unauthorized user. 

**Credential Stuffing** 

Attempt to make use of relevant leaked credentials gathered from the Dark Web or any other public or paid source.

7 Confidential   
**Directory Discovery** 

Look for paths not available in tags present in the main HTML document. This was done using a brute-force approach based on standard lists of common path names. 

**Dorking:** 

Use sophisticated queries to uncover information revealed by search engines that may not normally be discoverable by conventional searches. 

**Injection** 

Use attacks like SQL/NoSQL injection, cross-site scripting (XSS), code injection, and command injection. Trying ways to inject code to cause unexpected behavior in the application. 

**Insecure Deserialization** 

Attempt to exploit weaknesses in the deserialization technology and/or implementation. 

**Known Vulnerabilities** 

Search for CVEs based on the technology stack being used. 

**Reconnaissance** 

Utilize publicly available tools to gather sensitive information, such as that provided with a Shodan search.

8 Confidential   
**Security Misconfigurations** 

Search for misconfigurations related to implementations following bad practices from a software design and architecture perspective. 

**Sensitive Data Exposure** 

Analyzed all of the information available to an unauthenticated user that could be leveraged against the company's confidentiality. 

**Server-side request forgery (SSRF)** 

Use an attack that allows a malicious user to command the application server to make arbitrary requests, and that could lead to sensitive data exposure. 

**Session Management Vulnerabilities** 

Attempt to spot weaknesses in the way session cookies or tokens are implemented.

9 Confidential   
**Findings** 

**Broken Access Control on Administrator-Only Management Pages** 

**HIGH** 

**TYHX33P-F0001** 

Broken access control occurs when a web application fails to properly enforce authorization checks, allowing users to access functions or data outside of their intended privileges. 

In this case, non-administrative â€œadvisorâ€ users can directly browse to administrator only pages and view or modify sensitive configuration and client data.

10 Confidential   
**Details** 

The issue affects several administrator-only ASPX pages on https://test.viefund.com, which can be loaded and used by a lower-privileged advisor account by directly requesting their URLs. 

Because server-side authorization is not enforced consistently on these endpoints, an advisor can perform actions that should be restricted to administrative users, such as managing fund setup, onboarding information, and RESP plan data. 

![][image4]  
**Figure 2: Force Browsing Pages** 

The team was performing focused testing around access control and role separation within the VieFund test environment, specifically validating that high-privilege administrative functions were not exposed to advisor-level users. 

During role-based testing, the team compared the navigation and visible menus between an admin session and an advisor session and noticed that certain administrative pages, such as Fund Setup, OnBoard, and RESP management, were not linked on the advisor interface but were directly addressable by URL. 

To validate this hypothesis, the team first accessed FundSetup.aspx using an admin account, then reused the same URL within an advisor session.

11 Confidential   
**Steps for Recreation** 

Log in to https://test.viefund.com/ using a valid admin account. 

While authenticated as admin, navigate to https://test.viefund.com/Main/FundSetup.aspx. 

![][image5]  
**Figure 3: Fund Setup Page using Advisor Account** 

Copy the full URL for FundSetup.aspx. 

Log out from the admin session (or use a separate browser/profile) and log in to https://test.viefund.com/ with a valid advisor account. 

Paste and open https://test.viefund.com/Main/FundSetup.aspx in the advisor session; note that the Fund Setup page loads successfully and its functionality is available. 

While still logged in as the advisor user, directly browse to https://test.viefund.com/Main/OnBoardView.aspx. 

![][image6]  
**Figure 4: Onboard View page** 

Observe that the OnBoard listing page loads with client onboarding records and related administrative controls.

12 Confidential   
Finally, browse to https://test.viefund.com/Main/RESPView.aspx using the advisor account. 

![][image7]  
**Figure 5: RESPView Page** 

Observe that the RESP transactions management page loads, exposing RESP plan data and associated actions to the advisor user. 

Confirm that these pages allow viewing and modification of data despite the advisor not having administrative privileges. 

**Recommendations** 

To mitigate the risk of this issue, the assessment team recommends the following steps: 

Implement strict server-side authorization checks on every sensitive endpoint, ensuring that only users with the appropriate admin role can access FundSetup.aspx, OnBoardView.aspx, RESPView.aspx, and any related management pages. 

Introduce centralized access-control middleware or filters that enforce role checks based on the logged-in userâ€™s privileges for every request, not just those initiated from the UI menus. 

Review and audit all ASPX pages and API endpoints for similar direct object access patterns, and apply consistent role-based access control (RBAC) across the application.

13 Confidential   
**Locations & Occurrences (3)** 

https://test.viefund.com/Main/FundSetup.aspx 

https://test.viefund.com/Main/OnBoardView.aspx 

https://test.viefund.com/Main/RESPView.aspx 

**Resources** 

Broken Access Control 

https://owasp.org/Top10/2021/A01\_2021-Broken\_Access\_Control/

14 Confidential   
**Stored Cross-Site Scripting via SVG File Upload in Fund Fact Feature** 

**MEDIUM** 

**TYHX33P-F0002** 

Stored cross-site scripting (stored XSS) occurs when an application accepts attacker-controlled input, stores it server-side, and later includes it in a page in a way that executes arbitrary JavaScript in the victimâ€™s browser. 

When stored XSS is triggered through a file upload feature, the attacker uploads a crafted file (for example, an SVG image) that contains embedded script code; when the file is rendered by other users or administrators, the script runs in their session and can steal data or perform actions on their behalf.

15 Confidential   
**Details** 

The Fund Fact upload functionality on FundSetup.aspx allows an attacker to upload a crafted SVG file that contains JavaScript, which is then stored and later rendered in a pop-up when the Fund Facts for a fund are viewed. 

Despite the session cookie having the HttpOnly flag (which prevents direct cookie theft via document.cookie), the injected script still executes in the context of test.viefund.com, allowing an attacker to perform arbitrary actions on behalf of the victim and access any sensitive data rendered in the DOM. 

![][image8]  
**Figure 6: Javascript Execution** 

Although the session cookie was configured with HttpOnly, preventing direct access via document.cookie, the executing script still operated with the victimâ€™s privileges, meaning it could perform sensitive operations (such as changing configuration, initiating transactions, or exfiltrating on-screen data) on behalf of any user who loaded the malicious Fund Fact.

16 Confidential   
**Steps for Recreation** 

Log in to https://test.viefund.com/Main/FundSetup.aspx with a user that can manage Fund Facts. 

Choose any fund with a missing Fund Fact or one that exposes the Fund Fact upload option. 

![][image9]  
**Figure 7: File Upload Option On Fund Page** 

Create an SVG file containing JavaScript, for example an SVG with a \<script\>alert(document.domain);\</script\> payload. 

Save the file locally as test.pdf so that it appears to be a normal document. 

In the application, click Browse on the Fund Fact upload control and select test.pdf, while intercepting the request with a web proxy like burpsuite. 

When the asynchronous upload request to FundSetup.aspx? AsyncFileUploadID=idFFFileUploadControl\&rnd=... is captured, modify the multipart data so that the filename ends with .svg and the fileâ€™s Content-Type is image/svg+xml. 

![][image10]  
**Figure 8: Changing File Name and Content Type via BurpSuite**

17 Confidential   
Forward the modified request; confirm that the server accepts the upload without error. 

Back in the UI, navigate to the same fund and click the Fund Facts button under Fund Info to open the Fund Fact viewer popup. 

Observe that the popup displays the uploaded SVG and executes the embedded JavaScript payload (for example, an alert(document.domain) dialog appears). 

**Recommendations** 

To mitigate the risk of this issue, the assessment team recommends the following steps: 

Implement strict server-side validation for all uploaded files: 

Use a positive allowlist of permitted extensions (for example, only .pdf for Fund Facts) and explicitly block SVG and other active content types. 

Validate file type based on server-side inspection (magic bytes/MIME sniffing) instead of trusting user-controlled filenames and Content-Type headers. 

Ensure uploaded documents are served from a non-executable context: 

Serve them as raw downloads or from a separate domain or untrusted origin, rather than rendering them inline where they can execute JavaScript. 

If SVG or other rich formats must be supported, apply robust sanitization on upload using a dedicated library that strips scripts, event handlers, and external references. 

Maintain and enforce a strong Content Security Policy (CSP) that minimizes XSS impact by disallowing inline scripts and tightly restricting script sources. 

Keep existing cookie protections (HttpOnly, Secure, SameSite) in place but treat them as defense-in-depth; the primary fix is to eliminate the XSS vector itself. 

**Locations & Occurrences (1)** 

https://test.viefund.com/Main/FundSetup.aspx

18 Confidential   
**Resources** 

Cross-site Scripting via File Upload 

https://www.invicti.com/web-vulnerability-scanner/vulnerabilities/cross-site scripting-via-file-upload

19 Confidential   
**Missing Security Headers TYHX33P-F0003 INFO** 

HTTP security headers are a subset of HTTP headers exchanged between a web client (for example, a browser) and a server to specify the security details of HTTP communication. Some headers indirectly related to privacy and security can also be considered security headers. By enabling suitable headers in web applications and web server settings, the resilience of a web application against many common attacks, including cross-site scripting (XSS) and clickjacking, can be improved. 

**Details** 

This scan result for test.viefund.com identifies missing security headers. While X Frame-Options is active, five others are absent, showing that the server requires further configuration to meet standard security practices. 

![][image11]  
**Figure 9: Missing HTTP Security Headers** 

These findings carry an informational severity rating. This indicates a lack of recommended security hardening rather than an active vulnerability. Implementing these headers helps protect against cross-site scripting and unauthorized data exposure. 

**Steps for Recreation** 

Visit https://securityheaders.com/ 

Enter the url https://test.viefund.com/ 

Observe the scan result if there any missing HTTP security headrs

20 Confidential   
**Recommendations** 

To mitigate the risk of this issue, the assessment team recommends the following steps: 

Depending on the technology stack used by the web applications hosted in the in-scope domain, implement at least Strict-Transport-Security, Content Security-Policy, X-Content-Type-Options, Referrer-Policy, and Permissions Policy security headers. 

**Locations & Occurrences (1)** 

https://test.viefund.com/ 

**Resources** 

More information about HTTP security headers 

https://cheatsheetseries.owasp.org/cheatsheets/HTTP\_Headers\_Cheat\_Sheet.html 5 security headers that you must implement on your website 

https://www.thesslstore.com/blog/http-security-headers/

21 Confidential   
**Server Banner Disclosure TYHX33P-F0004 INFO** 

The Server header describes the server application that handled the request. Detailed information in this header can expose the server to attackers. Using the information in this header, attackers can find vulnerabilities more easily, potentially leading to targeted attacks and unauthorized access. 

**Details** 

The provided screenshot displays a banner grabbing finding where the server header reveals the use of Microsoft-IIS/10.0 and ASP.NET version 4.0.30319. This occurs because the application is broadcasting specific technology stack details within its HTTP response headers during client-server communication. 

![][image12]  
**Figure 10: HTTP Response Headers** 

This finding is classified as informational severity, as it does not represent a direct vulnerability. However, disclosing specific software versions assists potential attackers in fingerprinting the environment to identify known exploits. Suppressing these headers is a recommended hardening practice to minimize reconnaissance opportunities. 

**Steps for Recreation** 

Open a command-line interface or terminal. 

Execute the command: curl \-I https://test.viefund.com \--resolve test.viefund.com:443:66.155.101.84 

Observe the server and x-aspnet-version fields in the returned header response.

22 Confidential   
**Recommendations** 

To mitigate the risk of this issue, the assessment team recommends the following steps: 

Configure the web server to remove the server header. 

Update the application settings to hide the ASP.NET version header. Ensure the system only sends back necessary information to the user. 

**Locations & Occurrences (1)** 

https://test.viefund.com 

**Resources** 

Banner Grabbing 

https://csrc.nist.gov/glossary/term/banner\_grabbing

23 Confidential   
**Support for Deprecated TLS**   
**Protocols (1.0 and 1.1)TYHX33P-F0005** 

**INFO** 

Support for Deprecated TLS Protocols 1.0 and 1.1 TLS 1.0 and 1.1 are old ways to encrypt internet traffic that are now considered out of date. These versions have known weaknesses that can allow attackers to read or change private data. Security experts worldwide recommend turning them off and using newer versions like TLS 1.2 or 1.3 instead to keep connections safe. 

**Details** 

The server currently supports TLS versions 1.0 and 1.1. These protocols have been formally deprecated by the Internet Engineering Task Force (IETF) because they lack support for modern cryptographic algorithms. 

![][image13]  
**Figure 11: TLS Scan Result** 

Support for Deprecated TLS Protocols 1.0 and 1.1 using these old versions increases the risk of a downgrade attack, where a hacker forces your browser into a weaker connection. This makes it easier for someone to monitor your traffic and steal data because these protocols use outdated security methods that are no longer safe. Many modern security standards no longer allow these versions to be used. 

**Steps for Recreation** 

Open your terminal and type the command: testssl.sh \--protocols test.viefund.com Look for the lines showing TLS 1.0 and TLS 1.1 as offered.

24 Confidential   
**Recommendations** 

To mitigate the risk of this issue, the assessment team recommends the following steps: 

Download and run the IIS Crypto tool on your server. 

Click the Best Practices button to automatically select secure settings. Uncheck the boxes for TLS 1.0 and TLS 1.1 under the Protocols section. Click Apply and reboot the server to activate the changes. 

**Locations & Occurrences (1)** 

test.viefund.com 

**Resources** 

Deprecation of support for TLS 1.0 and TLS 1.1 

https://support.atera.com/hc/en-us/articles/4404634718610-Deprecation-of support-for-TLS-1-0-and-TLS-1-1

25 Confidential   
**Use of Insecure Cipher Suites**   
**(RC4 and 3DES)TYHX33P-F0006** 

**INFO** 

Insecure ciphers are old ways of encrypting data that are no longer considered safe. RC4 is a stream cipher that has been used for many years, but is now known to have mathematical errors that make it easy to break. 3DES, also known as Triple DES, is an older method that uses small 64-bit blocks of data. These smaller blocks make it possible for attackers to find patterns in the encrypted information and eventually read it. Most modern security standards require these ciphers to be turned off completely. 

**Details** 

Use of Insecure RC4 Cipher Suites RC4 is an old encryption method that is no longer strong enough to protect data. Scientists have found ways to break it because it makes small mistakes when scrambling information. Because it is now easy for modern computers to crack this encryption, most websites have stopped using it to prevent hackers from seeing private messages. 

![][image14]  
**Figure 12: Insecure Chipers** 

Allowing these weak ciphers puts the privacy of your users at risk. An attacker who is able to watch your network traffic can use statistical tools to recover sensitive data like login passwords or session cookies. This type of vulnerability is often seen as easy to exploit by hackers and can lead to a full data breach. Furthermore, using these ciphers can cause your site to fail important security compliance audits like PCI DSS.

26 Confidential   
**Steps for Recreation** 

Open a terminal and run the following command: testssl.sh \--cipher-per-proto test.viefund.com. 

Review the output for any ciphers labeled as RC4 or 3DES. 

Alternatively, use nmap with this command: nmap \--script ssl-enum-ciphers \-p 443 test.viefund.com. 

Confirm that the scan results flag these ciphers as weak or insecure. 

**Recommendations** 

To mitigate the risk of this issue, the assessment team recommends the following steps: 

Open the IIS Crypto tool on your Windows server. 

Click the Best Practices button to load the recommended settings. Go to the Ciphers section and uncheck the box for RC4. 

Uncheck the box for Triple DES 168 (3DES) in the same list. 

Click Apply and then restart the server to make sure the changes take effect. 

**Locations & Occurrences (1)** 

test.viefund.com 

**Resources** 

Recommendations for TLS/SSL Cipher Hardening 

https://www.acunetix.com/blog/articles/tls-ssl-cipher-hardening/

27 Confidential   
**Appendices** 

**Severity Description** 

The assessment team used the following criteria to rate the findings in this report. Red Sentry derived these risk ratings from the industry and organizations such as OWASP. 

The severity of each finding in this report is independent. Finding severity ratings combine direct technical and business impact with the worst-case scenario in an attack chain. The more significant the impact, and the fewer vulnerabilities that must be exploited to achieve that impact, the higher the severity. 

**Critical CRIT ICAL** 

Vulnerability is an otherwise high-severity issue with additional security implications that could lead to exceptional business impact. Examples: trivial exploit difficulty, business-critical data compromised, bypass of security controls, direct violation of communicated security objectives, and large-scale vulnerability exposure. 

**High HIGH** 

Vulnerability may result in direct exposure including, but not limited to: the loss of application control, execution of malicious code, or compromise of underlying host systems. The issue may also create a breach in the confidentiality or integrity of sensitive business data, customer information, and administrative and user accounts. In some instances, this exposure may extend farther in the infrastructure beyond the data and systems associated with the application.

28 Confidential   
**Medium MEDIUM** 

Vulnerability does not lead directly to the exposure of critical application functionality, sensitive business and customer data, or application credentials. However, it can be executed multiple times or leveraged in conjunction with another issue to cause direct exposure. Examples include brute-forcing and client-side input validation. 

**Low LOW** 

Vulnerability may result in limited exposure of application control, sensitive business and customer data, or system information. This type of issue provides value only when combined with one or more issues of a higher risk classification. Examples include overly detailed error messages, the disclosure of system versioning information, and minor reliability issues. 

**Informational INFO** 

Finding does not have a direct security impact but represents an opportunity for additional layers of security, is considered a best practice, or has the possibility of turning into an issue over time. Finding is a security-relevant observation that has no direct business impact or exploitability, but may lead to exploitable vulnerabilities. Examples include poor communication between organizations, documentation encouraging poor security practices, or lack of security training.

29 Confidential 

[image1]: ../images/red-sentry-report_image1.png

[image2]: ../images/red-sentry-report_image2.png

[image3]: ../images/red-sentry-report_image3.png

[image4]: ../images/red-sentry-report_image4.png

[image5]: ../images/red-sentry-report_image5.png

[image6]: ../images/red-sentry-report_image6.png

[image7]: ../images/red-sentry-report_image7.png

[image8]: ../images/red-sentry-report_image8.png

[image9]: ../images/red-sentry-report_image9.png

[image10]: ../images/red-sentry-report_image10.png

[image11]: ../images/red-sentry-report_image11.png

[image12]: ../images/red-sentry-report_image12.png

[image13]: ../images/red-sentry-report_image13.png

[image14]: ../images/red-sentry-report_image14.png
