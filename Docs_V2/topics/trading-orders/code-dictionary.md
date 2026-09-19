# Order Code Dictionary — status, action, error và hard-code

> Mục tiêu: phân biệt các namespace mã cùng tồn tại trong Order. Không lấy `Ret` nội bộ để diễn giải như FundServ `ReturnCode`; không gán `UB_FundTrxOrder.iOrderStatus` trực tiếp sang `UB_FundTrx.iStatus` chỉ vì cùng là số.

## 0. Baseline và giới hạn

- C# được trace ở `WebApp/`, `DLLs/`, `Services/`.
- SP/UDF được trace ở `MyPortfolioNew/VieFUND-Platform/src/SQLScript/000_3_CreateUDF.sql` và `000_4_CreateSP.sql`.
- Repository có duplicate source tree và không có deployment manifest.
- Không tìm thấy base table DDL hoặc seed cho `UB_Def_TrxOrderStatus`, `UB_Def_TrxType`, `UB_Def_FSRVError`, stock/settlement lookups. Numeric transition và query usage được xác minh; label production vẫn data-dependent.
- Cột “luồng liên quan” trong dictionary `Ret` gồm nhiều mức evidence: direct outer-SP return, nested validation, UI-only hoặc message-only. Nó không biến mọi association thành output contract của SP ngoài cùng.

## 1. Bản đồ namespace mã

| Namespace | Ví dụ | Nguồn quyết định | Dùng ở đâu |
|---|---|---|---|
| Mã kết quả SP nội bộ | `Ret=19`, `Ret=70` | `UBFundTrx*`, `CTrx`, `CMSG` | Add/edit validation và UI message. |
| FundServ return code | `00`, `01`, `98`, `99` | XML + `UBXMLRecOrderRespnProcess*` | Accepted/rejected/retry. |
| FundServ error/warning | `003`, `012` | XML `REJECT`/`WARNING`; lookup `UB_Def_FSRVError` | Response detail. |
| Order status | `1..6` | `UB_FundTrxOrder.iOrderStatus` | Integration/order lifecycle. |
| Transaction status | `0..6` | `UB_FundTrx.iStatus` | Business transaction lifecycle. |
| Transaction integration status | thường `1..2` trong flow gửi | `UB_FundTrx.iOrderStatus` | Trạng thái order trên transaction row; khác `iStatus`. |
| Action code | `NEW`, `CHG`, `CAN`, `CAX`, `REV`, `AOT` | `ActnCode` | Ý định message/order. |
| Domain/type | `Type`, `TypeDetail`, `iType`, amount/settlement/designation | SP + lookup usage | Phân loại và rule. |
| Queue/message/import | `iMode`, queue `iType`, nhiều cột `iStatus` | Integration SP/C# parser | Điều phối gửi/import; mỗi object có namespace riêng. |

## 2. Order status và transaction status

### 2.1. `UB_FundTrxOrder.iOrderStatus`

| Mã | Ý nghĩa theo UDF/comment/transition | Transaction status thường gặp |
|---:|---|---:|
| `0` | Deleted/null | `0` Deleted |
| `1` | Pending To Send | `3` Pending |
| `2` | Pending to Receive | business `3` Pending; `UB_FundTrx.iOrderStatus` có thể là `2` |
| `3` | Rejected | `1` Rejected |
| `4` | Accepted | `4` In Progress |
| `5` | Contracted | `5` Contracted |
| `6` | Confirmed | `6` Confirmed |

Label display được `TrxOrderStatusStr` đọc từ `UB_Def_TrxOrderStatus`; seed không có trong repository.

### 2.2. `UB_FundTrx.iStatus`

| Mã | Ý nghĩa |
|---:|---|
| `0` | Deleted |
| `1` | Rejected |
| `2` | Cancelled |
| `3` | Pending |
| `4` | In Progress |
| `5` | Contracted |
| `6` | Confirmed |

Order `3` là Rejected nhưng transaction `3` là Pending. Ngoài ra `UB_FundTrx.iOrderStatus` là cột integration riêng; luôn ghi đầy đủ table + column khi debug.

## 3. Action code

| Mã | Ý nghĩa đã trace | Ghi chú |
|---|---|---|
| `NEW` | Order mới | Default trong core add SP. |
| `CHG` | Thay đổi order | `UBFundTrxChange`; XML builder cũng có thể đổi NEW thành CHG. |
| `CAN` | Cancel | `UBFundTrxCancel(iOptions=0)`; wrapper comment cho Accepted. |
| `CAX` | Cancel variant | `UBFundTrxCancel(iOptions=1)`; wrapper comment cho Accepted hoặc Contracted. |
| `REV` | Reversal | `UBFundTrxCancel(iOptions=2)` tạo reversal order. |
| `AOT` | As-of trade | Date/original-order validation và XML fields. |

`DEL` là UI/domain action nhưng chưa được chứng minh là FundServ `ActnCode` trong pipeline này. `CTrx.AllowableAction` gọi `UBFundTrxOrderCANCAX` để query flags; execution dùng `UBFundTrxCancel`.

## 4. Mã `Ret` nội bộ khi add/edit

### 4.1. Mã hạ tầng/thực thi không nhất quán

| Mã | Behavior quan sát được |
|---:|---|
| `0` | Intended success. Một số connection/setup failure path có thể vẫn để `errorCode=0`, nên không coi đây là guarantee nếu wrapper không execute SP. |
| `1` | Exception/general operation failure trong nhiều wrapper. |
| `2` | Database execution/operation failure trong nhiều wrapper; không thể khái quát là “không mở được connection”. Ví dụ `CTrx.Buy` không luôn set `2` cho open/setup failure. |
| `9` | Access denied ở UI/SP branches tương ứng. |

Khi thêm wrapper mới, phải đọc method cụ thể thay vì dùng bảng này như interface chuẩn hóa.

### 4.2. Quy tắc ánh xạ message thực tế

| UI handler | Mapping |
|---|---|
| Sell | `Ret >= 10` → `GetTrxErrorMSG(Ret - 10)` |
| Buy/Switch/Transfer/ICT | chỉ `Ret > 10` mới map |

Do đó `Ret=10` không có behavior chung. `GetTrxErrorMSG` dùng index `Ret-10`, nhưng bounds check hiện là `errorCode > array.Length` thay vì `>=`; index đúng bằng `Length` có thể throw, còn index lớn hơn bị reset về message index `0`.

### 4.3. Dictionary message nội bộ

| Ret | Diễn giải từ message EN | Luồng/evidence quan sát được |
|---:|---|---|
| 10 | Lỗi thao tác giao dịch tổng quát | Message index 0; chưa thấy core SP trả trực tiếp |
| 11 | Fund không đủ điều kiện mua | Buy/BuyEdit/Sell/SellEdit/Switch/SwitchEdit |
| 12 | Fund không đủ điều kiện cho RRSP | Buy/BuyEdit/Switch/SwitchEdit |
| 13 | Fund không đủ điều kiện cho RESP | Buy/BuyEdit/Switch/SwitchEdit |
| 14 | Không đủ điều kiện theo tỉnh cư trú | BuyEdit/Switch/SwitchEdit |
| 15 | Không đủ điều kiện cho cư trú tại Mỹ | Buy/BuyEdit/Switch/SwitchEdit |
| 16 | Không đủ điều kiện offshore | Buy/BuyEdit/Switch/SwitchEdit |
| 17 | Fund chưa được head office duyệt | Buy/BuyEdit/Switch/SwitchEdit |
| 18 | Risk fund cao hơn risk tolerance của plan | Buy/BuyEdit/Switch/SwitchEdit |
| 19 | Amount nhỏ hơn mức tối thiểu | Buy/BuyEdit/Sell/SellEdit/Switch/SwitchEdit |
| 20 | Fund đã capped | Buy |
| 21 | Units/shares bán lớn hơn position | Sell/SellEdit/Switch/SwitchEdit |
| 22 | Không tạo được switch-out transaction | Switch |
| 23 | Fund chưa được head office setup | Switch/SwitchEdit |
| 24 | Commission rate vượt cấu hình fund | Buy/BuyEdit/Switch/SwitchEdit |
| 25 | Dealer code phải khác nhau cho external transfer | Transfer/TransferEdit |
| 26 | AOT cần ngày hoặc original transaction | Buy/BuyEdit/Sell/SellEdit/Switch/SwitchEdit/Transfer |
| 27 | Chưa chọn source fund | ICT/ICTEdit |
| 28 | Chưa chọn destination fund | ICT/ICTEdit |
| 29 | Tổng purchase phải bằng 100% | ICT/ICTEdit |
| 30 | Cần DOB chủ sở hữu và tuổi tối thiểu 18 | Transfer/TransferEdit |
| 31 | Order amount không được lớn hơn commission amount | BuyEdit |
| 32 | Thiếu original order bắt buộc | Buy/BuyEdit |
| 33 | Không đủ tiền trong Trust Account | Buy/BuyEdit |
| 34 | Ngày không hợp lệ hoặc ở tương lai | Message-only/nested candidate |
| 35 | Trùng Source ID | Message-only/nested candidate |
| 36 | Không được transfer về cùng account | Transfer/TransferEdit |
| 37 | Thiếu bank/cheque info cho cash dividend | Message-only/nested candidate |
| 38 | Bắt buộc tax code | Buy |
| 39 | Literal `Error 3`, chưa có mô tả nghiệp vụ rõ | Message-only; cần business owner |
| 40 | Bulk settlement yêu cầu management company N$M | Message-only/nested candidate |
| 41 | Commission rebate phải dùng amount type Dollar | Buy |
| 42 | Bắt buộc original order ID | Original-order validation |
| 43 | Intermediary + source I chỉ cho phép gross purchase | Buy |
| 44 | Commission rebate + source F phải individual settlement | Validation tương ứng comment trong UDF snapshot |
| 45 | N$M intermediary không cho individual settlement | Validation tương ứng comment trong UDF snapshot |
| 46 | AOT không cho individual settlement | Validation tương ứng comment trong UDF snapshot |
| 47 | Regular purchase chỉ nhận source Dealer/Intermediary | Validation UDF |
| 48 | Commission rebate không dùng intermediary source | Validation UDF |
| 49 | Non-intermediary account không dùng source I | Validation UDF |
| 50 | Rebate trên non-intermediary account phải source Dealer | Validation UDF |
| 51 | Bulk settlement không được có settlement method | Validation UDF |
| 52 | Không cho phép money-market fund | Message-only/nested candidate |
| 53 | Client hoặc plan bị frozen | Buy/Sell/Switch/Transfer/ICT |
| 54 | Cần xác nhận electronic order cho direct-settled fund | Buy |
| 55 | Thiếu conversion information | UI message use |
| 56 | Conversion split phải là % khi sell không dùng Dollar | Sell |
| 57 | Tổng conversion buy phải bằng 100% | Sell |
| 58 | Tổng conversion buy phải bằng sell amount | Sell |
| 59 | Cần xác nhận switch từ DSC sang FE | Switch |
| 60 | Không cho order khi Client/Plan KYC thiếu | Buy |
| 61 | Cần xác nhận switch khác currency | Sell/Switch |
| 62 | Cần xác nhận dealer settlement của intermediary account | Buy |
| 63 | Vượt annual total limit | Buy/Sell |
| 64 | Không được Buy/Switch-in fund chưa approved | Buy/Switch |
| 65 | Cần xác nhận form RC518/519 hoàn tất | Buy |
| 66 | EFT cần bank information | Buy |
| 67 | EFT individual settlement cần authorization | Buy |
| 68 | Bắt buộc EMD qualifier | Buy |
| 69 | Transaction type không được phép cho EMD Pending | Switch |
| 70 | Không đủ cash đã designate cho buy | Buy/BuyEdit |
| 71 | Alternative fund: xác nhận qualification | Buy |
| 72 | Cảnh báo purchase amount lớn | Buy |
| 73 | Không thêm commission rebate vào Net-settlement Buy | Buy |
| 74 | Không dùng Trust Account với intermediary source | Buy |
| 75 | Intermediary source phải dùng N$M | Buy |
| 76 | Intermediary account settled by Dealer phải dùng Trust | Buy |
| 77 | Dealer yêu cầu mọi Buy dùng N$M | Buy |
| 78 | ETF chỉ cho amount type Shares | Buy/Sell |
| 79 | ETF chỉ cho Buy và Sell | Switch/Transfer/ICT |
| 80 | Bắt buộc conversion buys | Message-only/nested candidate |
| 81 | Bắt buộc Price Limit | Buy/Sell |
| 82 | Bắt buộc Price Stop | Buy/Sell |
| 83 | Bắt buộc Expiry Date | Buy/Sell |
| 84 | Không cho Sell Conversion trên Client Name | Sell |
| 85 | Fund không đủ điều kiện cho plan type | Buy |
| 86 | Cheque settlement cho Buy đã ngừng, trừ existing-money transfer | Buy |
| 87 | Cheque chỉ cho alternate payee/address | Sell |
| 88 | Contribution/withdrawal code không hợp lệ cho plan | ICT |
| 89 | ICT from: không trộn fund T+3 với T+1/T+2 | ICT |
| 90 | ICT to: không mua T+3 từ T+1/T+2 | ICT |
| 91 | ICT to: không mua T+1 từ T+3 | ICT |
| 92 | Không AOT Internal Transfer cho Intermediary Account | Transfer |
| 93 | Rep license thiếu hoặc hết hạn | Buy |
| 94 | Empty/unassigned trong canonical `CMSG.m_MSG_Trx_EN` | Không dùng như lỗi có nghĩa |
| 95 | Empty/unassigned trong canonical `CMSG.m_MSG_Trx_EN` | Không dùng như lỗi có nghĩa |

“Message-only/nested candidate” nghĩa là literal tồn tại nhưng audit không chứng minh outer core SP trực tiếp trả code đó. Mã có thể đến từ nested UDF/SP hoặc source ngoài snapshot.

### 4.4. Historical/deployment-unverified candidate

`Docs_V2/topics/fundserv/4.AcctDesig/UBFundTrxSell*.sql` chứa candidate lịch sử trả `Ret=104` cho một fee-redemption/N$M guard. Return này không tồn tại trong canonical `MyPortfolioNew/VieFUND-Platform/src/SQLScript/000_4_CreateSP.sql`, và repository không chứng minh variant đó đang deploy. Chỉ khi variant này thực sự được deploy thì `104-10=94` mới vượt current canonical CMSG array và `GetTrxErrorMSG` fallback về generic message; đây không phải confirmed defect của canonical baseline.

## 5. FundServ `ReturnCode`, `ErrorCode`, `WarningCode`

### 5.1. Standard `ORDSET` SQL path

| Return/error | Behavior trong `UBXMLRecOrderRespnProcess` snapshot |
|---|---|
| `00` | Không bị reject bởi return condition; matching order mặc định Accepted nếu không có reject khác. |
| `01` | Comment gọi warning; nếu parser đưa `ErrorCode1` có giá trị, SQL reject vì return khác `00`. |
| `98` + error `003` | Retry/resend: xóa sent marker, đưa order về Pending To Send; SQL có defect `@iTrxStatus` chưa init. |
| `99` | Error/reject. |
| error `012` | Skip record trước update. |

Error/warning rows vào `UB_OrderMSGError`; `iType=2` là error, `1` là warning. Official labels phụ thuộc `UB_Def_FSRVError` seed production.

### 5.2. `ERRORSET` C# path khác standard path

Không coi bảng trên là bằng chứng ERRORSET hoạt động đúng, vì `COrder.ProcessXMLErrorSet` hiện:

- so `ErrorCode` với cả `98` và `003`;
- so `ErrorCode==99` thay vì `RtnCode==99`;
- bind `OrdID` trong khi SQL parameter là `OrderID`;
- catch exception nhưng có thể vẫn report success.

### 5.3. Slot count

DB contract nhận `ErrorCode1..5` và `WarningCode1..5`; parser C# chỉ giữ slot 1–4 do điều kiện `iCount < 5`.

## 6. Queue, message và import code

### 6.1. Queue/message

| Field/mã | Ý nghĩa trong object/path đã trace |
|---|---|
| Queue `iMode=0` | Batch. |
| Queue `iMode=1` | Realtime. |
| Queue routing `iType=0` | Normal. |
| Queue routing `iType=1` | Omnibus. |
| Queue routing `iType=2` | SK/BBS trong caller contract tương ứng. |
| `UB_OrderWaiting2Send.iStatus=0` | Waiting/chưa claim. |
| Queue `iStatus=1` | Claimed/processing. |
| Queue `iStatus=2` | Message-created state trong XML flow. |
| `UB_OrderMSG.iStatus=0` | Message mới. |
| `UB_OrderMSG.iStatus=2` | Sent theo status SP. |
| `UB_OrderSent.iStatus=0` | Sent marker chờ correlation/response. |

`CTrx.OrderPendingMove2Waiting` không bind/expose `bForced`, nên WebForms path dùng default `0` và chạy `IsFundFactOKOrder`. Direct/internal SP call với `bForced=1` bỏ qua cả Fund Fact và `IsOrderOK4FS` code `2..5`, nhưng không bỏ qua code `6`; `IsOrderOK4Cash` vẫn áp dụng cho normal queue type.

Không áp enum này cho mọi table có column tên `iStatus`; special queues có contract riêng.

### 6.2. Hai namespace import result

**Order-response import status:**

| Mã | Ý nghĩa |
|---:|---|
| `0` | Updated |
| `1` | Added |
| `2` | Skipped |
| `3` | Error |

Observed reasons: `1` không tìm thấy matching order; `2` order đã dealt/processed.

**CAT processing return:** wrapper CAT xử lý riêng values `3/4` như processed outcomes và `5` như skipped. Không dịch `3/4/5` bằng bảng order-response ở trên.

## 7. Type và field code

### 7.1. Account designation

| Mã | Meaning quan sát được |
|---:|---|
| `1` | Client Name |
| `2` | Nominee |
| `3` | Intermediary |

Mapping dựa trên branches/query usage; authoritative lookup seed không có trong repository.

### 7.2. Amount type

| Mã | Cách gate quy đổi |
|---|---|
| `D` | Dollar; dùng `fAmount`. |
| `S` | Shares/units; quy đổi theo price. |
| `P` | Percentage; units × price × percentage. |
| `A` | All; toàn bộ position value. |

### 7.3. Settlement và source

| Field | Mã | Meaning quan sát được |
|---|---|---|
| `SettlementInd` | `G` / `N` | Gross / Net. |
| `SettlementSource` | `D` | Dealer. |
| `SettlementSource` | `I` | Intermediary. |
| `SettlementSource` | `F` | Fund/direct. |
| `SettlementMethod` | `1` | N$M trong SQL rules đã trace. |
| `OrderSource` | `D` | Default dealer source trong core SP. |
| `OrderSource` | `I` | Intermediary source ở branch tương ứng. |

Các settlement values khác được load qua `UBTrxSettleMethodListByPlanID`; không hard-code labels `2..7` như DB fact nếu chưa có seed production.

### 7.4. `iType` branch values trong core create

| iType | Meaning trong branch đã trace |
|---:|---|
| `20` | Main `UBFundTrxSell` `Type='4'` path collapse về value này; trong canonical `UBFundTrxSellShort`, blank `ProdEventInd` là `fee`. |
| `22` | Regular buy |
| `27` | Switch-in |
| `39` | External transfer branch |
| `40` | Commission rebate buy |
| `42` | Internal transfer-in branch |
| `44` | Rollover/switch branch |
| `45` | Sell |
| `65` | Transfer branch khác; đọc cùng direction/`Type` |
| `75` | ICT branch |
| `90` | Canonical `UBFundTrxSellShort` với `ProdEventInd='O'`: `fee redemption`. |

Danh sách không exhaustive và chỉ mô tả branch của canonical snapshot; không dùng `iType=20` hoặc `iType=90` như label toàn cục ngoài discriminator nêu trên. Full labels phụ thuộc `UB_Def_TrxType` data, còn behavior runtime phải đối chiếu SP đang deploy.

### 7.5. `iOrderType` và `iNetwork`

| `iOrderType` | Meaning quan sát trong UDF/SP context |
|---:|---|
| `1` | Direct Settle |
| `2` | Manual |
| `3` | Non-electronic/non-wire branch theo comment UDF |
| `4` | Regular wired order; core FundServ default |
| `5` | Legacy branch; chưa có label đủ chắc chắn |

| `iNetwork` | Order-core behavior |
|---:|---|
| `0` | Normal FundServ/default path. |
| `2` | Manual/confirm path; core SP đổi `iOrderType` và không realtime. |
| `4` | ETF/BBS path; Shares/Buy-Sell rules và special routing. |

Không áp các enum này cho parameter cùng tên trong utility/report SP; luôn xác định table/SP context.

## 8. Hard-code DSID, dealer và routing

| Literal | Behavior quan sát được |
|---|---|
| DSID `1911` | UI force/lock Gross ở một số Buy; ETF/settlement branches. |
| DSID `1912` | Trust/intermediary source, filename/routing branches. |
| DSID `1256` | Receipt/settlement options ở UI; N$M/trust/net SQL rules. |
| DSID `1623` | UI Fund Fact customization. |
| DSID `1853`, `2301`, `2501` | Form/confirmation customization; phải giữ đủ ba literal. |
| DSID `1274`, `1001` | Extra fee/transfer/switch options ở branch tương ứng. |
| DSID `2262` | ETF/action/UI branch. |
| Dealer `7908` | Omnibus/batch branch. |
| Network `4` + dealer khác `7908` | SK/BBS branch ở relevant caller. |
| Mgmt code `VEX` | Force batch. |
| Dealer `2539`, `7960`; intermediary `AGRA`, `AGRI` | CO filename/grouping. |
| Dealer `7907`, `9499`, `7968` | Legacy response fallback; fixed 2023 date branch là dead-by-date. |
| Dealer `9535` | Extra `IsOrderOK4FS` compliance branch. |

Đây là observed branch behavior, không phải global policy hoặc DB-config definition.

## 9. Các tên gần giống dễ nhầm

| Tên 1 | Tên 2 | Khác biệt |
|---|---|---|
| `UBFundTrxOrderCANCAX` | `UBFundTrxCancel` | Query allowable flags vs thực thi CAN/CAX/REV. |
| C# `iCanDEL` | SQL result `iCanDelete` | Variable local vs result-column name. |
| `UB_OrderWaiting2Send` | `UBOrderWaiting2SendAdd*` | Table vs enqueue SP family. |
| `UB_OrderMSG` | `UBOrderGetMSG` | Message table vs realtime claim/build SP. |
| `UBXMLRecOrderRespnProcess` | `UBXMLRecOrderRespnProcessError` | Standard ORDSET vs network ERRORSET SP. |
| `UBXMLRecTrxRecordProcess` | `UBXMLRecTrxRecordProcess1Record` | Wrapper/staging dispatcher vs one-record processor. |
| `UB_Def_TrxStatus` | `UB_Def_TrxOrderStatus` | Transaction lookup vs order-status lookup. |
| C# `OrdID` | SQL `OrderID` | ERRORSET parameter mismatch candidate. |
| `UB_FundTrx.iStatus` | `UB_FundTrx.iOrderStatus` | Business status vs integration status on same row. |

## 10. Defect candidates liên quan tới mã

| ID | Bằng chứng | Tác động có thể xảy ra | Test tối thiểu trước khi sửa |
|---|---|---|---|
| `ORD-CODE-02` | Bounds check dùng `>` thay vì `>=` | Index bằng `Length` có thể throw | Test `-1`, `0`, `Length-1`, `Length`, `Length+1`. |
| `ORD-CODE-03` | Sell `>=10`; handler khác `>10` | `Ret=10` không nhất quán | Stub từng BLL trả `10`. |
| `ORD-PARAM-01` | `AOTDilution` không forward | Lost value | Assert SP parameters cho Buy/Sell/Switch/Transfer. |
| `ORD-QUEUE-01` | `bNewSourceID` bị thay bằng literal `0` | Flag no-op | Enqueue cùng order với flag `0/1`; inspect SourceID. |
| `ORD-QUEUE-02` | Queue insert catch bị nuốt, count vẫn tăng | False-success | Force insert failure; compare count và row. |
| `ORD-QUEUE-03` | Code `0`/forced/bulk semantics khác nhau | Path-dependent eligibility | Matrix code `0..6`, forced `0/1`, single/bulk. |
| `ORD-SEND-01` | `@iStatus` unused | Misleading status contract | Gọi với nhiều status trong rollback-isolated DB. |
| `ORD-BATCH-01` | Generator có false-success paths | Monitoring sai | Mock DB/file/status failures. |
| `ORD-MQ-01` | Return `(errorCode > 0)` | Boolean đảo ngược | Stub SP success/failure và assert return. |
| `ORD-RESP-01` | `ErrorCode==98 && ErrorCode==003` | ERRORSET retry không chạy | Fixture RtnCode `98`, ErrorCode `003`. |
| `ORD-RESP-02` | Check `ErrorCode==99`, không phải RtnCode | ERRORSET reject bị bỏ | Fixture RtnCode `99`, ErrorCode khác. |
| `ORD-RESP-03` | `OrdID`/`OrderID`, swallowed exception | Call failure bị che | Integration test parameter binding + forced exception. |
| `ORD-RESP-04` | Parser dùng `iCount < 5` | Mất slot 5 | XML có 5 errors + 5 warnings. |
| `ORD-RESP-05` | Import/CAT có null-stream success path | False-success | Missing/corrupt file và malformed reader. |
| `ORD-RESP-06` | SQL dùng `@iTrxStatus` trước init | NULL/failure ở retry | Transactional DB test cho `98/003`. |
| `ORD-TXN-01` | Multi-table transition thiếu outer transaction, có `NOLOCK`/silent catch | Partial/inconsistent state | Fault injection giữa từng update. |

Không thay runtime code trong lượt audit tài liệu. Mọi fix cần xác minh binary/SP production và có test bảo vệ riêng.

## 11. Nguồn tra cứu

| Nội dung | Path/symbol |
|---|---|
| Message/bounds | `DLLs/UBStatic/CMSG.cs`: arrays và `GetTrxErrorMSG` |
| UI mapping | `WebApp/Main/PopupTradeAdd.aspx.cs`: Buy/Sell/Switch/Transfer/ICT handlers |
| BLL contract | `DLLs/UBClasses/Trx.cs` |
| Batch/response parser | `DLLs/UBFFImport/COrder.cs` |
| CAT parser | `DLLs/UBFFImport/CAT.cs` |
| Realtime worker | `Services/VieFUNDMQ/Order.cs`, `Services/VieFUNDMQ/VieFUNDMQ.cs` |
| SP core/queue/response | `MyPortfolioNew/VieFUND-Platform/src/SQLScript/000_4_CreateSP.sql` |
| UDF/status/lookup | `MyPortfolioNew/VieFUND-Platform/src/SQLScript/000_3_CreateUDF.sql` |
| Luồng tổng thể | [Order end-to-end](order-end-to-end.md) |
