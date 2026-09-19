# Fundserv — Inbound Dispatch Matrix

> Ma trận source-visible cho inbox dùng bởi `VieFUNDIE`. Physical code và acronym expansion phải lấy từ DB/official standard; bảng này không suy diễn final business mutation của stored procedure.

## 1. Discovery model

1. `VieFUNDIE` lấy table `FileCode` từ first-timer result; fallback helper dùng `UBFSFileCodeList`.
2. Generic scan dùng `FileCode*`; test mode có thể dùng `FileCodeTest*`.
3. Special patterns được xét trước generic loop.
4. `HeaderID == "XML"` chọn XML dispatcher; loại khác dùng fixed-width/data-driven parser.
5. Scanner chỉ xét top-level IN folder.

> Source evidence: `Services/VieFUNDIE/VieFUNDIE.cs:675-710`; `DLLs/UBFFImport/FFImport.cs:722-761,910-1501,1850-1895`.

## 2. XML dispatch

| Physical code(s) | Handler | Nhóm source-visible |
|---|---|---|
| `FD`, `FC`, `FUNDLIST`, `ZD`, `EC`, `MD`, `JD` | `CFD` | Fund/reference setup |
| `RSP`, `RST` | `CAP` | Price |
| `PSP`, `PST`, `NSP`, `NST` | `CAA` | Position/account demographic |
| `DR`, `CK`, `CU`, `CV`, `WK`, `WR`, `VK`, `VR` | `COrder` | Order response family |
| `XR`, `XK`, `XU`, `XV`, `UK`, `UR` | `CXM` | NFU response family |
| `WSP`, `WST`, `SSP`, `SST` | `CAW` | Commission |
| `FSP`, `FST`, `TSP`, `HSP`, `TST` | `CAT` | Transaction/settlement/holding family |
| `LSP` | `CLS` | LSP handler |
| `LAP` | `CLA` | LAP handler |
| `BSP` | `CBS` | Balance handler |
| `CSP`, `CST` | `CTCRFile` | TCR handler |
| `ASP`, `ASM` | `CASM` | Asymmetric/settlement report handler |

> Source evidence: `DLLs/UBFFImport/FFImport.cs:2389-2519`.

### DR không phải distribution

Physical `DR` được route vào `COrder.ImportXML`, dùng order-response definition/SP. Distribution records trong TS/HS đi qua transaction handler/model khác. Không mở rộng acronym `DR` thành “Dividend Reinvestment” trong dispatch documentation.

> Source evidence: `DLLs/UBFFImport/COrder.cs:13-15,323-425`; `DLLs/UBFFImport/FFImport.cs:2435-2472`.

## 3. Fixed-width dispatch

| Physical code(s) | Handler |
|---|---|
| `AA`, `ZA` | `CAA` |
| `FG`, `SG` | `CFG` |
| `FF` | `CFF` |
| `AE`, `ZE` | `CAE` |
| `FE`, `SE` | `CFE` |
| `AF`, `ZF`, `AT`, `FA`, `ZT` | `CAT` |
| `AP`, `ZP` | `CAP` |
| `AW`, `ZW` | `CAW` |

`BL` chỉ có nhánh đánh dấu imported trong source đã rà soát; `AC/ZC` không có handler hoàn chỉnh và `AS/ZS` là code/comment legacy. Không coi các nhánh này là integration hoạt động nếu chưa có DB/deployment evidence.

> Source evidence: `DLLs/UBFFImport/FFImport.cs:2166-2388`.

## 4. Special-pattern integrations trong cùng inbox

| Pattern/nhóm | Handler/owner source-visible | Phạm vi |
|---|---|---|
| RESP/CESP prefixes + `.err/.pro/.reg` | `CRESPFile` | CESP integration riêng |
| `ETFDAILYMARKET*.TXT*` | market-data branch | Provider không xác định từ code |
| `DAILYTCR*.txt` | TCR/data branch | Provider không xác định từ code |
| `FUNDLIST_*` | treated as `FD` | Fund setup |
| `TERM...`, `USTD...` | `CannexOrder` | Cannex GIC riêng |
| Fundata named feeds | Fundata handlers | Chỉ scan sau time condition trong source |
| `DIVCI*.xlsx` | CI dividend handler | Integration riêng |
| NEO CSV pattern | NEO branch | Source comment cho biết feed có thể legacy |

Shared inbox không biến các integration này thành Fundserv files. Xem [Integration Index](integration-index.md).

> Source evidence: `DLLs/UBFFImport/FFImport.cs:910-1501,1712-1849`.

## 5. Audit và archive

Generic lifecycle:

```text
UBFF_Add -> parser/record SPs -> UBFF_End -> move file
```

- `Ret == 1`: Imported, thường thêm category và `YYYY/MM/DD` nếu parse được date.
- `Ret == 3`: Error.
- Giá trị khác: code hiện tại đưa sang Skipped.
- Một số special integration archive theo `YYYY/MM`, không theo ngày.
- Collision có thể rename destination cũ; move failure có thể đổi source thành `_DONOTIMPORT`.

> Source evidence: `DLLs/UBFFImport/FFImport.cs:1562-1707,1888-2006,2060-2154`.

## 6. Known risks

- Comment nói system error `Ret == 2` không move, nhưng nhánh `else` hiện move mọi giá trị ngoài `1/3` sang Skipped; sau đó có path reset `Ret=1`.
- `COrder.ImportXML`/`CXM.ImportXML` khởi tạo success và có early-return/root-not-found paths có thể không phản ánh import hoàn chỉnh.
- File ở Imported không đủ chứng minh `UBFF_End`, counters và business mutation đều đúng.

> Source evidence: `DLLs/UBFFImport/FFImport.cs:1888-1930`; `DLLs/UBFFImport/COrder.cs:168-208,323-425`; `DLLs/UBFFImport/CXM.cs:151-271`.

Final tables/status vẫn **DB/SP-dependent**. Khi incident hoặc replay, dùng [State, Error & Recovery](state-error-recovery.md).