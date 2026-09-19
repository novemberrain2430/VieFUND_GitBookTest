# Client Report PDF — Ad-hoc Generation

> Audit baseline: **2026-09-18**, source commit `06c586b78`. Pipeline này dùng source chuẩn [`DLLs/VieFUNDPdf`](../../../DLLs/VieFUNDPdf) và SQL artifact [`000_4_CreateSP.sql`](../../../MyPortfolioNew/VieFUND-Platform/src/SQLScript/000_4_CreateSP.sql); **chưa xác minh DB live**. Đây là “Run now” của Client Report, không phải toàn bộ scheduler.

## 1. Phạm vi và mức kiểm chứng

- **[S] Source**: call site/branch/parameter có trong source chuẩn đang checkout.
- **[A] Artifact DB**: procedure/UDF definition có trong SQL dump của repo.
- **[L] Live DB**: deployed definition, synonym, permission, constraint và dữ liệu runtime chưa kiểm tra.

Cây `MyPortfolioNew/.../libs/VieFUNDPdf` là build graph khác và đã drift: bản đó không có type `15`, còn source chuẩn `DLLs/VieFUNDPdf` có type `15`. Không dùng dispatch matrix của hai cây thay thế cho nhau.

## 2. Luồng thực tế

```mermaid
sequenceDiagram
    participant UI as PopupClientReportTypes
    participant DB as SQL Server/TMP
    participant Worker as CReport raw Thread
    participant PDF as Report generator

    UI->>DB: UBReportRequestAddTMP
    DB-->>UI: iRequestID
    UI->>Worker: StartCreatePdfObjClientReportAdhoc
    Worker->>DB: UBReportRequestTMP(bRemove=1)
    DB-->>Worker: ReportInfo + ClientList + Options
    loop từng client
        Worker->>PDF: dispatch theo iReportType
        PDF-->>Worker: byte[] hoặc null
    end
    alt MainPdfObj != null
        Worker->>DB: UBReportPdfObjTMPAdd
    else MainPdfObj == null
        Worker-->>Worker: Không gọi save SP; iRet giữ 1
    end
    Worker->>DB: UBReportRequestTMPEnd
    Worker-->>UI: FinishCallback(iRet)
```

Entry point là [`PopupClientReportTypes.aspx.cs`](../../../WebApp/Main/PopupClientReportTypes.aspx.cs). UI serialize `KeyIDStr/KeyValueStr`, gọi `CReport.AddRequestTMP`, rồi:

- `iRunMode=0`: giá trị đang được hard-code trong handler; tạo `CReport`, mở raw `Thread` trong web process và giữ handler trong Session [S];
- `iRunMode>0`: branch hiện không reachable trong checkout vì không có assignment khác. Nếu branch được bật lại, handler sẽ hiển thị request đã gửi service và return, **nhưng `AddRequestTMP` đã chạy trước đó** [S]. Caller này không chứng minh request được chuyển sang `UB_ReportRequest`; muốn mô tả scheduled flow phải trace screen/service creator riêng.

Diagram là happy path. Trong worker hiện tại, exception có thể nhảy vào error callback trước `UBReportRequestTMPEnd`; cleanup không được bảo đảm cho mọi path [S].

## 3. Request và database contract

### 3.1. Tạo request

[`CReport.AddRequestTMP`](../../../DLLs/VieFUNDPdf/CReport.cs) gọi `UBReportRequestAddTMP` với các parameter [S]/[A]:

- identity/report: `iUserID`, `iReportType`;
- dates: `EffectiveDate`, `EffectiveDateFrom`, `TrxDateFrom`;
- client scope: `iClientListOption`, `iClientID`, `RepIDStr`, `iPrimaryClientOnly`;
- filters: `bIncludeReturnMail`, `bExcludeIntermediaryOnly`;
- options: `KeyIDStr`, `KeyValueStr`.

Wrapper đọc `iRequestID`, `iRet` và trả request ID `0` khi `iRet>0` [S]. SQL artifact xác nhận các rule [A]:

1. rep scope đến từ `UBRepCodeFromList` nếu có `RepIDStr`, nếu không từ `UBMemberRepAccessList`;
2. client option `1` dùng search list, `2` dùng favorite list, `3` lấy toàn bộ client theo rep, còn lại dùng single client;
3. primary-only đi trực tiếp qua `UB_Plan.iClientID`; nhánh còn lại dùng `UB_CustomerPlan`;
4. account active hoặc terminated sau effective-from date được giữ;
5. return-mail/intermediary filters có thể xóa client khỏi request;
6. dates parse bằng UDF `UBDate`, option strings tách bằng `SplitStr`, thiếu `ShowRepName` thì insert default `1`;
7. procedure ghi `UB_ReportRequestTMP`, `UB_ReportRequestClientTMP`, `UB_ReportRepListClientTMP`, `UB_ReportOptionTMP`.

`UBReportAdd` không tạo request ad-hoc; đó là summary SP được caller khác sử dụng.

### 3.2. Đọc và consume request

[`ClientReportAdhocHeaderSet`](../../../DLLs/VieFUNDPdf/ClientReportAdhoc.cs) gọi `UBReportRequestTMP(iUserID,iRequestID,bRemove=1)`. Artifact trả đúng ba result set [A]:

| `RecType` | Selected columns/contract |
|---|---|
| `ReportInfo` | `iRequestID`, `iReportType`, `iStatus`, `iUserID`, `EffectiveDate`, `EffectiveDateFrom`, `TrxDateFrom`; dates qua `DateStr(...,101)`. |
| `ClientList` | request ID alias `ID`, `iClientID`; join customer và `ORDER BY LastName, FirstName, ID`. |
| `Options` | `KeyID`, `KeyValue`. |

Worker đổi `DataTable.TableName` bằng column `RecType`; đây là untyped/stringly-typed contract [S]. Empty result set bị đổi sang tên fallback và worker không guard mọi trường hợp trước `ReportInfo.Rows[0]`.

Khi `bRemove=1`, SP consume request/client/options. Worker gọi thêm `UBReportRequestTMPEnd` để cleanup request/client/rep/options TMP trên normal path.

### 3.3. Hai điểm DB phải kiểm tra live

1. Artifact `UBReportRequestTMP` nhận `iUserID`/`DSID`, nhưng các select request lọc bằng `iRequestID`, không có owner predicate theo user. Phải chứng minh request ID không đoán được và authorization được enforce ở caller/BLL/deployed SP [A]/[L].
2. `UBReportRequestAddTMP`, `UBReportRequestTMP` và `UBReportRequestTMPEnd` trộn object local `dbo.UB_Report*TMP` với `VieFUNDTMP.dbo.UB_Report*TMP`. Repo không có DDL/synonym đủ để xác định chúng là cùng physical object [A]/[L].

## 4. Dispatch report type

Memory-mode switch của source chuẩn [`ClientReportAdhoc.cs`](../../../DLLs/VieFUNDPdf/ClientReportAdhoc.cs) có đúng các type sau [S]:

| Type | Generator được gọi | Data/SP tiêu biểu |
|---:|---|---|
| `1` | `ClientAccountStatementPdfObj` | `UBReportClientAccountStatement` |
| `2` | `ClientInvestorStatementPdfObj(..., false)` | `UBReportClientInvestorStatement` hoặc `_PerCurrency` theo option. |
| `3` | `ClientAssetMixPdfObj` | `UBReportClientAssetMix` |
| `5` | `ClientAccountStatementPdfObj_XIRR` | `UBReportClientAccountStatement_XIRR` |
| `6` | `ClientInvestorStatementPdfObj(..., true)` | Cùng investor family. |
| `7` | `ClientInvestorStatementPdfObj_XIRR` | `UBReportClientInvestorStatement_XIRR` |
| `8` | `ClientAccountStatementPdfObj_CG` | `UBReportClientCapitalGainStatement` |
| `9` | `ClientAccountStatementPdfObj_2015` | `UBReportClientAccountStatement_2015` |
| `10` | `ClientAccountStatementPdfObj_DailyGraph` | `UBReportClientAccountStatementWithDailyGraph` |
| `11` | `ClientCommission` | `UBReportClientCommission` family |
| `12` | `ClientInvestmentPerformance` | `UBReportClientPerformance` |
| `13` | `AccountSummaryBySupplierPdfObj` | `UBReportClientAccountSummaryBySupplier` |
| `14` | `ClientPortfolioPerformance` | `UBReportClientPortfolioPerformance` |
| `15` | `ClientPortfolioPerformancePdfObj` | Portfolio-performance “U” path |
| `50` | `ClientAccountStatementPdfObjTrxOnly` | `UBReportClientAccountStatementTrxOnly` |

Không có case `104` hoặc symbol `ClientHoldingPerformanceAndPortfolioSummary` trong source chuẩn. Route WebApp `104` là risk assessment, không phải ad-hoc type.

Không thêm type chỉ ở UI: phải đồng bộ ID, request/options contract, worker dispatch, generator, SP/result set, persistence/download và cả hai execution mode.

## 5. Memory mode và file mode

### 5.1. Memory mode (`<=5` client)

`CreatePdfObjClientReportAdhocMemory` tạo `byte[]` từng client rồi merge bằng `PdfBuilder.Merge2PdfObjs`. Nó hỗ trợ đủ 15 type trong bảng trên và kiểm tra `m_Abort` trước mỗi client [S].

### 5.2. File mode (`>5` client)

`CreatePdfObjClientReportAdhocFile` mở `PdfCopy`, add từng PDF vào temp file, đóng document, đọc file lại thành `byte[]` rồi xóa file. Switch chỉ có `1,2,3,5,6,7,8,9,10,13` [S].

| Type thiếu | Hệ quả |
|---|---|
| `11,12,14,15,50` | Rơi `default`, `PdfObj=null`; output có thể thiếu client/nội dung hoặc không lưu được. |

Behavior thay đổi đúng tại client thứ **6**; đây là functional bug candidate, không chỉ là tối ưu memory.

## 6. Lưu output và callback

Khi `MainPdfObj != null`, `CreatePdfObjClientReportAdhoc` gọi `SavePdfObj2TMP(DBIDStr,TMPFILE_CLIENT,UserID,MainPdfObj)`. Wrapper gọi `UBReportPdfObjTMPAdd(iType,iUserID,PdfObj,iOptions=0)` [S]/[A]. Khi `MainPdfObj == null`, worker hiện không gọi save SP, giữ `iRet=1`, nên slot cũ cũng không bị xóa qua path này. Contract trực tiếp của SP trong artifact là:

- tìm `TOP 1` theo `(iUserID,iType)` mà không `ORDER BY`;
- nếu đã có slot: `PdfObj` khác null thì update `ObjData`, còn null thì xóa slot;
- nếu chưa có slot: nhánh `ELSE` vẫn insert row, kể cả khi `PdfObj` null;
- không nhận request ID.

Repo không có DDL của `UB_ReportObjTMP`, nên chưa chứng minh `(iUserID,iType)` có unique constraint [L]. Hệ quả: đây là “latest slot”, concurrent run có thể overwrite; nếu live DB có duplicate, `TOP 1` còn chọn không xác định.

`iRet` callback:

| Giá trị | Nghĩa trong normal worker flow |
|---:|---|
| `0` | Có PDF và save TMP trả ID > 0. |
| `1` | Không tạo/lưu được output. |
| `2` | Worker thấy `m_Abort`. |

Exception đi error callback riêng, không được mô tả đầy đủ bởi ba giá trị trên.

## 7. Option contract

UI serialize option thành hai chuỗi; SP trả bảng `Options`; generator đọc bằng `GetReportOption*`. Các key thường gặp:

- dữ liệu: `IncludeGIC`, `IncludeCash`, `IncludeStock`, `ShowTrx`, `TrxCapGain`;
- layout: `ShowBVAccount`, `ShowBVPlan`, `ShowPercentagePlan`, chart/ROR flags;
- lọc: `ExInactivePlan`, `ExcludeSegFund`, `TaggedPlanOnly`, intermediary/exempt options;
- branding/localization: `LogoOption`, `MFDALogo`, `UseClientLg`, bulletin;
- disclosure: `IncludeCostDisclosure`, `IncludeRiskSummary`;
- split: `SplitByDealerCode`, `SplitGroupID`.

Đây là contract stringly typed: typo thường rơi default và không có compile-time error. Khi đổi key phải tìm UI writer, SQL serialization và mọi generator reader.

## 8. Findings

### PDF-ADHOC-01 — dispatch file mode thiếu năm type

Với `>5` client, type `11,12,14,15,50` không có trong switch file mode dù memory mode hỗ trợ. Nên dùng một hàm dispatch chung; nếu chưa refactor phải giữ hai switch đồng bộ.

### PDF-ADHOC-02 — đọc thiếu byte cuối

File mode cấp phát `new byte[stream.Length - 1]` rồi chỉ đọc số byte đó. Output bị cắt đúng một byte. Pattern tương tự còn có trong `CForm` multi-ticket và `CPortfolioFundFact`; đây là lỗi cross-pipeline [S].

### PDF-ADHOC-03 — cleanup và stale file

Abort trong loop return trước `pdfDoc.Close`/`File.Delete`; exception cũng có thể bỏ qua `UBReportRequestTMPEnd`. Writer dùng `FileMode.OpenOrCreate`, không truncate file cũ; nếu filename bị reuse và output mới ngắn hơn, stale tail có thể còn lại [S]. Cần `try/finally`/`using`, `FileMode.Create` và cleanup idempotent.

### PDF-ADHOC-04 — slot TMP/concurrency

`UBReportPdfObjTMPAdd` key logic theo user/type, không theo request; `TOP 1` không order và DDL uniqueness chưa có. Cần kiểm tra UI lock, unique index live và bind download với request/token [A]/[L].

### PDF-ADHOC-05 — namespace TMP không nhất quán

Core SP trộn `dbo.UB_Report*TMP` và `VieFUNDTMP.dbo.UB_Report*TMP`. Phải query `sys.synonyms`, `sys.tables`, `sys.sql_expression_dependencies` trên cả database trước khi kết luận runtime [A]/[L].

### PDF-ADHOC-06 — owner filter của request

Artifact `UBReportRequestTMP` không dùng `iUserID` trong predicate lấy request. Cần chứng minh authorization ở caller/BLL/deployed SP và test cross-user request ID [A]/[L].

### PDF-ADHOC-07 — branch `iRunMode>0` không reachable và chưa chứng minh durable request

Handler hard-code `iRunMode=0`. Nếu branch `>0` được bật lại, `AddRequestTMP` vẫn chạy trước khi rẽ nhánh service; tài liệu không được khẳng định branch này tự tạo `UB_ReportRequest` nếu chưa trace consumer/creator khác [S].

## 9. Cách thêm/sửa report type an toàn

1. Chốt source project/deployed DLL; không trộn dispatch của hai source tree.
2. Xác định type ID không trùng trong UI/DB; phân biệt với WebApp route ID.
3. Ghi rõ SP parameter, result-set columns, `RecType`, default và side effect.
4. Tạo generator trả `byte[]`; test empty, một trang, nhiều trang và invalid option.
5. Dùng một dispatcher chung cho memory/file; nếu chưa refactor, cập nhật cả hai switch.
6. Test đúng boundary `1`, `5`, **`6`**, `7+` client.
7. Test abort/exception, temp cleanup, filename reuse và binary EOF.
8. Test concurrent request cùng user/type và cross-user request/download authorization.
9. Test EN/FR, duplex, split dealer, disclosure, chart và response MIME nếu áp dụng.
10. Đối chiếu deployed SP/constraint bằng metadata read-only; không execute SP có side effect để audit.

## 10. Source và database artifact

- [`ClientReportAdhoc.cs`](../../../DLLs/VieFUNDPdf/ClientReportAdhoc.cs)
- [`CReport.cs`](../../../DLLs/VieFUNDPdf/CReport.cs)
- [`PopupClientReportTypes.aspx.cs`](../../../WebApp/Main/PopupClientReportTypes.aspx.cs)
- [`000_4_CreateSP.sql`](../../../MyPortfolioNew/VieFUND-Platform/src/SQLScript/000_4_CreateSP.sql)
- [`000_3_CreateUDF.sql`](../../../MyPortfolioNew/VieFUND-Platform/src/SQLScript/000_3_CreateUDF.sql)
- [`Table_Description.md`](../../Database/Table_Description.md)
- [Report Catalog](report-catalog.md)
- [PDF Workflow](../../viefund-framework/pdf/pdf-workflow.md)
- [Charts](../../viefund-framework/charts.md)
