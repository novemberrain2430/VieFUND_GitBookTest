# Order Code Dictionary — status, action, error và hard-code

> Mục tiêu: phân biệt rõ các namespace mã đang cùng tồn tại trong Order. Không được lấy `Ret` nội bộ để diễn giải như FundServ `ReturnCode`, và cũng không được lấy `iOrderStatus` để gán trực tiếp sang `UB_FundTrx.iStatus`.

## 1. Bản đồ namespace mã

| Namespace | Ví dụ | Nguồn quyết định | Dùng ở đâu |
|---|---|---|---|
| Mã kết quả SP nội bộ | `Ret=19`, `Ret=104` | `UBFundTrx*`, `CTrx`, `CMSG` | Validation khi add/edit order. |
| FundServ return code | `00`, `01`, `98`, `99` | XML response + `UBXMLRecOrderRespnProcess*` | Accepted/rejected/retry. |
| FundServ error/warning code | `003`, `012`, các mã khác | XML `REJECT`/`WARNING`; lookup `UB_Def_FSRVError` | Chi tiết response. |
| Order status | `1..6` | `UB_FundTrxOrder.iOrderStatus` | Trạng thái integration/order. |
| Transaction status | `0..6` | `UB_FundTrx.iStatus` | Trạng thái giao dịch nghiệp vụ. |
| Action code | `NEW`, `CHG`, `CAN`, `CAX`, `REV`, `AOT` | `ActnCode` | Ý định message/order. |
| Domain/type code | `Type`, `TypeDetail`, `iType`, amount/settlement/designation | SP + bảng `UB_Def_*` | Phân loại giao dịch và rule. |
| Queue/message status | `iMode`, queue `iType`, `iStatus` | SP integration | Điều phối gửi. |

## 2. Order status và transaction status

### 2.1. `UB_FundTrxOrder.iOrderStatus`

| Mã | Ý nghĩa | Trạng thái transaction tương ứng thường gặp |
|---:|---|---:|
| 0 | Deleted/null | 0 Deleted |
| 1 | Pending To Send | 3 Pending |
| 2 | Pending to Receive | 3 Pending |
| 3 | Rejected | 1 Rejected |
| 4 | Accepted | 4 In Progress |
| 5 | Contracted | 5 Contracted |
| 6 | Confirmed | 6 Confirmed |

Nguồn: comment contract trong UDF `CON_WF_TrxOrderStatus`, các transition tại `UBOrderFileUpdateStatus`, `UBXMLRecOrderRespnProcess`, `FSUBGetTrxWOStatus`. Label hiển thị thực tế được đọc từ `UB_Def_TrxOrderStatus` qua `TrxOrderStatusStr`; do đó bản dịch/label production có thể phụ thuộc dữ liệu DB.

### 2.2. `UB_FundTrx.iStatus`

| Mã | Ý nghĩa |
|---:|---|
| 0 | Deleted |
| 1 | Rejected |
| 2 | Cancelled |
| 3 | Pending |
| 4 | In Progress |
| 5 | Contracted |
| 6 | Confirmed |

Không gán một status này sang status kia theo cùng số một cách máy móc. Ví dụ order `3` là Rejected nhưng transaction `3` là Pending.

## 3. Action code

| Mã | Ý nghĩa đã xác minh | Ghi chú |
|---|---|---|
| `NEW` | Order mới | Default của các SP add. |
| `CHG` | Thay đổi order | `UBFundTrxChange`; XML builder cũng có thể đổi NEW thành CHG khi order đã có ID ngoài. |
| `CAN` | Cancel | `UBFundTrxCancel(iOptions=0)`. |
| `CAX` | Cancel variant | `UBFundTrxCancel(iOptions=1)`; UI display cùng nhóm Cancel. |
| `REV` | Reversal | `UBFundTrxCancel(iOptions=2)` tạo reversal order riêng. |
| `AOT` | As-of trade | Có validation ngày/original order; được phép qua gate `IsOrderOK4FS`. |

## 4. Mã `Ret` nội bộ khi add/edit order

### 4.1. Mã hạ tầng/thực thi

| Mã | Cách UI/BLL hiểu |
|---:|---|
| 0 | Thành công. |
| 1 | Lỗi gọi/thực thi SP hoặc lỗi thao tác tổng quát. |
| 2 | Không mở được DB connection. |
| 9 | Access denied; một số SP cũng trả trực tiếp từ kiểm tra quyền. |

### 4.2. Quy tắc ánh xạ message

Với mã nghiệp vụ, UI gọi `CMSG.GetTrxErrorMSG(Lg, Ret - 10)`. Vì vậy mã 10 tương ứng phần tử 0, mã 11 tương ứng phần tử 1, v.v. Bảng dưới là toàn bộ dictionary hiện được hard-code trong `UBStatic/CMSG.cs`. Cột “luồng liên quan” tổng hợp từ mã trả trực tiếp, validation UDF/procedure lồng nhau và cảnh báo UI trong các flow Buy/Sell/Switch/Transfer/ICT; nó không khẳng định mọi mã đều được SP ngoài cùng trả trực tiếp.

| Ret | Diễn giải tiếng Việt từ message EN | Luồng liên quan thấy trong snapshot |
|---:|---|---|
| 10 | Lỗi thao tác giao dịch tổng quát | Chưa thấy SP lõi trả trực tiếp |
| 11 | Fund không đủ điều kiện mua | Buy/BuyEdit/Sell/SellEdit/Switch/SwitchEdit |
| 12 | Fund không đủ điều kiện cho RRSP | Buy/BuyEdit/Switch/SwitchEdit |
| 13 | Fund không đủ điều kiện cho RESP | Buy/BuyEdit/Switch/SwitchEdit |
| 14 | Không đủ điều kiện theo tỉnh cư trú | BuyEdit/Switch/SwitchEdit |
| 15 | Không đủ điều kiện cho cư trú tại Mỹ | Buy/BuyEdit/Switch/SwitchEdit |
| 16 | Không đủ điều kiện offshore | Buy/BuyEdit/Switch/SwitchEdit |
| 17 | Fund chưa được head office duyệt | Buy/BuyEdit/Switch/SwitchEdit |
| 18 | Risk của fund cao hơn risk tolerance của plan | Buy/BuyEdit/Switch/SwitchEdit |
| 19 | Amount nhỏ hơn mức tối thiểu | Buy/BuyEdit/Sell/SellEdit/Switch/SwitchEdit |
| 20 | Fund đã capped | Buy |
| 21 | Số unit/share bán lớn hơn đang nắm giữ | Sell/SellEdit/Switch/SwitchEdit |
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
| 34 | Ngày không hợp lệ hoặc ở tương lai | Được định nghĩa; chưa thấy ở nhóm SP lõi đã quét |
| 35 | Trùng Source ID | Được định nghĩa; chưa thấy ở nhóm SP lõi đã quét |
| 36 | Không được transfer về cùng account | Transfer/TransferEdit |
| 37 | Thiếu bank/cheque info cho cash dividend | Được định nghĩa; chưa thấy ở nhóm SP lõi đã quét |
| 38 | Bắt buộc tax code | Buy |
| 39 | Message literal `Error 3`, không có mô tả nghiệp vụ rõ | Được định nghĩa; cần business owner nếu gặp runtime |
| 40 | Bulk settlement yêu cầu management company N$M | Được định nghĩa; chưa thấy ở nhóm SP lõi đã quét |
| 41 | Commission rebate phải dùng amount type Dollar | Buy |
| 42 | Bắt buộc original order ID | Được định nghĩa; rule liên quan original order |
| 43 | Intermediary + source I chỉ cho phép gross purchase | Buy |
| 44 | Commission rebate + source F phải individual settlement | Được định nghĩa; validation tương ứng đang comment ở UDF snapshot |
| 45 | N$M intermediary không cho individual settlement | Được định nghĩa; validation tương ứng đang comment ở UDF snapshot |
| 46 | AOT không cho individual settlement | Được định nghĩa; validation tương ứng đang comment ở UDF snapshot |
| 47 | Regular purchase chỉ nhận settlement source Dealer/Intermediary | Được định nghĩa trong validation UDF |
| 48 | Commission rebate không được dùng intermediary source | Được định nghĩa trong validation UDF |
| 49 | Account không phải intermediary không được dùng source I | Được định nghĩa trong validation UDF |
| 50 | Rebate trên account không phải intermediary phải dùng source Dealer | Được định nghĩa trong validation UDF |
| 51 | Bulk settlement không được có settlement method | Được định nghĩa trong validation UDF |
| 52 | Không cho phép money-market fund | Được định nghĩa; chưa thấy ở nhóm SP lõi đã quét |
| 53 | Client hoặc plan bị frozen | Buy/Sell/Switch/Transfer/ICT |
| 54 | Cần xác nhận electronic order cho direct-settled fund | Buy |
| 55 | Thiếu conversion information | Được định nghĩa; UI gọi trực tiếp index tương ứng để cảnh báo |
| 56 | Conversion split phải là % khi sell không dùng Dollar | Sell |
| 57 | Tổng conversion buy phải bằng 100% | Sell |
| 58 | Tổng conversion buy phải bằng sell amount | Sell |
| 59 | Cần xác nhận switch từ DSC sang FE | Switch |
| 60 | Quyền không cho đặt order khi Client/Plan KYC thiếu | Buy |
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
| 71 | Alternative fund: cần xác nhận người đặt đủ qualification | Buy |
| 72 | Cảnh báo purchase amount lớn | Buy |
| 73 | Không được thêm commission rebate vào Net-settlement Buy | Buy |
| 74 | Không dùng Trust Account với intermediary settlement source | Buy |
| 75 | Intermediary settlement source phải dùng N$M method | Buy |
| 76 | Intermediary account settled by Dealer phải dùng Trust Account | Buy |
| 77 | Dealer yêu cầu mọi Buy dùng N$M | Buy |
| 78 | ETF chỉ cho amount type Shares | Buy/Sell |
| 79 | ETF chỉ cho Buy và Sell | Switch/Transfer/ICT |
| 80 | Bắt buộc conversion buys | Được định nghĩa; chưa thấy ở nhóm SP lõi đã quét |
| 81 | Bắt buộc Price Limit | Buy/Sell |
| 82 | Bắt buộc Price Stop | Buy/Sell |
| 83 | Bắt buộc Expiry Date | Buy/Sell |
| 84 | Không cho Sell Conversion trên Client Name | Sell |
| 85 | Fund không đủ điều kiện cho plan type | Buy |
| 86 | Cheque settlement cho Buy đã ngừng, trừ transfer tiền hiện hữu | Buy |
| 87 | Cheque chỉ cho alternate payee/address | Sell |
| 88 | Contribution/withdrawal code không hợp lệ cho plan | ICT |
| 89 | ICT from: không trộn fund T+3 với T+1/T+2 | ICT |
| 90 | ICT to: không mua T+3 từ T+1/T+2 | ICT |
| 91 | ICT to: không mua T+1 từ T+3 | ICT |
| 92 | Không AOT Internal Transfer cho Intermediary Account | Transfer |
| 93 | Rep license thiếu hoặc hết hạn | Buy |
| 94 | Fee Redemption Client Name phải dùng N$M | Message có trong `CMSG`; SP hiện trả nhầm 104 |
| 95 | Chuỗi message rỗng | Không dùng như lỗi có nghĩa |
| 104 | SP mới trả cho rule fee redemption | Không có index hợp lệ sau phép `104-10`; hiện rơi về message generic |

Lưu ý “chưa thấy” chỉ có nghĩa không thấy trong nhóm SP lõi được quét ở snapshot hiện tại. Mã vẫn có thể được trả từ UDF/procedure lồng nhau, batch path hoặc source ngoài workspace.

## 5. FundServ `ReturnCode`, `ErrorCode`, `WarningCode`

### 5.1. Return code có logic explicit trong SQL

| ReturnCode | Cách code hiện tại xử lý |
|---|---|
| `00` | Không bị reject bởi điều kiện return/error; order mặc định Accepted nếu matching thành công. |
| `01` | Comment SP gọi là warning. Nếu chỉ có warning node thì order vẫn Accepted và bật warning; nếu `ErrorCode1` có giá trị thì điều kiện SQL vẫn đưa order sang Rejected vì return code khác `00`. |
| `98` + error `003` | FundServ busy/retry: bỏ sent marker và đưa order về Pending to Send. |
| `99` | Error/reject; response chuẩn hoặc network error đi nhánh lỗi. |

Không dùng ví dụ dạng `E001`, `W001` làm dictionary chính thức nếu chưa có row thực trong `UB_Def_FSRVError`.

### 5.2. Error/warning đặc biệt

| Mã | Context | Hành vi |
|---|---|---|
| `003` | Đi cùng `ReturnCode=98` | Retry/resend theo SQL. |
| `012` | `ErrorCode1` của response chuẩn | SP skip record, không cập nhật order. Ý nghĩa nghiệp vụ của label vẫn phụ thuộc `UB_Def_FSRVError`. |
| Mã khác | `REJECT`/`WARNING` | Lưu `UB_OrderMSGError`; label EN/FR tra bằng `FundServErrorStr` từ `UB_Def_FSRVError`. |

Contract DB nhận tối đa `ErrorCode1..5` và `WarningCode1..5`, nhưng parser C# hiện chỉ giữ bốn slot đầu do lỗi biên đếm.

## 6. Queue, message và import code

| Field/mã | Ý nghĩa đã xác minh |
|---|---|
| Queue `iMode=0` | Batch. |
| Queue `iMode=1` | Realtime. |
| Queue routing `iType=0` | Normal. |
| Queue routing `iType=1` | Omnibus. |
| Queue routing `iType=2` | SK/BBS path. |
| `UB_OrderWaiting2Send.iStatus=0` | Waiting/chưa claim. |
| Queue `iStatus=1` | Đã được process claim. |
| Queue `iStatus=2` | Message đã được tạo trong flow `UBOrderCreateMSGXML`. |
| `UB_OrderMSG.iStatus=0` | Message mới tạo. |
| `UB_OrderMSG.iStatus=2` | Message được đánh dấu đã gửi bởi batch/realtime status SP. |
| `UB_OrderSent.iStatus=0` | Đã gửi, đang chờ response/correlation. |
| Import status `0` | Updated. |
| Import status `1` | Added. |
| Import status `2` | Skipped. |
| Import status `3` | Error. |
| Import reason `1` | Không tìm thấy matching order. |
| Import reason `2` | Order đã được xử lý/dealt trước đó. |

Status của các queue phụ có thể có contract riêng; không áp bảng trên cho mọi cột tên `iStatus` trong database.

## 7. Type và field code thường gặp

### 7.1. Account designation

| Mã | Ý nghĩa |
|---|---|
| `1` | Client Name |
| `2` | Nominee |
| `3` | Intermediary |

Mapping `3=Intermediary` được xác nhận bởi filter/report SQL và nhánh `UBFundTrxSell`; tài liệu account-plan cũ ghi “Trustee...” là không đủ chính xác cho Order.

### 7.2. Amount type

| Mã | Ý nghĩa/cách SQL quy đổi trong gate |
|---|---|
| `D` | Dollar amount; dùng trực tiếp `fAmount`. |
| `S` | Shares/units; quy đổi theo price. |
| `P` | Percentage; quy đổi theo units × price × percentage. |
| `A` | All; dùng toàn bộ position value. |

### 7.3. Settlement và order source

| Field | Mã | Ý nghĩa đã được guide/source xác minh |
|---|---|---|
| `SettlementInd` | `G` / `N` | Gross / Net. |
| `SettlementSource` | `D` | Dealer settled. |
| `SettlementSource` | `I` | Intermediary settled. |
| `SettlementSource` | `F` | Fund-company/direct settled. |
| `SettlementMethod` | `1` | N$M trong các rule SQL hiện hành. |
| `OrderSource` | `D` | Default dealer source trong core SP. |
| `OrderSource` | `I` | Intermediary source ở các nhánh designation/routing đặc biệt. |

Settlement method ngoài `1` được nạp động từ DB qua `UBTrxSettleMethodListByPlanID`; không nên hard-code tên cho toàn bộ numeric value chỉ dựa trên vị trí dropdown. Xem [Settlement](../settlement/README.md).

### 7.4. Một số `iType` đã xác minh trong core create

| iType | Nghĩa trong nhánh đã xác minh |
|---:|---|
| 20 | Fee redemption |
| 22 | Regular buy |
| 27 | Switch-in |
| 39 | External transfer branch |
| 40 | Commission rebate buy |
| 42 | Internal transfer-in branch |
| 44 | Rollover/switch branch |
| 45 | Sell |
| 65 | Một transfer branch khác; cần đọc cùng `Type`/direction, không đặt tên chung |
| 75 | ICT branch |

Nguồn định nghĩa rộng hơn là `UB_Def_TrxType`; danh sách trên chỉ nhằm đọc flow Order lõi.

### 7.5. `iOrderType` và `iNetwork`

`iOrderType` mô tả cách order được tạo/xử lý, không đồng nghĩa với Buy/Sell:

| `iOrderType` | Ý nghĩa trong UDF/SP |
|---:|---|
| 1 | Direct Settle |
| 2 | Manual |
| 3 | Non-electronic/nhánh không wire theo `CON_WF_TrxOrderType` |
| 4 | Regular wired order; default của các SP FundServ core |
| 5 | Có nhánh legacy riêng; chưa đặt tên nghiệp vụ chung vì snapshot không có label đủ chắc chắn |

Các giá trị `iNetwork` thường gặp trong Order:

| `iNetwork` | Hành vi đã xác minh |
|---:|---|
| 0 | FundServ/default path; là điều kiện cho nhiều nhánh realtime và enqueue FundServ. |
| 2 | Manual; các SP core đổi `iOrderType` thành 2 và không realtime. |
| 4 | ETF/BBS path; áp rule Shares/Buy-Sell và route sang queue SK/BBS thay vì FundServ thường. |

Không áp ba giá trị này cho mọi module có field tên `iNetwork`; bảng chỉ mô tả Order core.

Một số utility/report SP cũng đặt tên parameter `@iOrderType` nhưng dùng enum lọc Buy/Redemption/Switch/ICT khác với field `UB_FundTrxOrder.iOrderType`. Luôn xác định table/parameter context trước khi dịch mã.

## 8. Hard-code DSID, dealer và routing

Hard-code dưới đây là branch behavior thấy trong source, không mặc định là bug:

| Literal | Nơi/ảnh hưởng |
|---|---|
| DSID `1911` | UI khóa/chọn Gross ở một số Buy; SQL có alternative/settlement behavior riêng. |
| DSID `1912` | Agora/intermediary, trust/source, filename và routing đặc biệt. |
| DSID `1256` | Ẩn/bỏ settlement option ở UI; SQL áp N$M/trust/net rule. |
| DSID `1623` | UI không yêu cầu Fund Fact theo nhánh hiện hành. |
| DSID `1853`, `2301`, `2501` | UI/customization liên quan form/confirmation; phải đọc đúng branch trước khi sửa. |
| DSID `1274`, `1001` | Extra fee/transfer/switch option ở các nhánh tương ứng. |
| DSID `2262` | ETF/action permission/UI branch. |
| Dealer `7908` | Omnibus queue, ép batch. |
| Network `4` + dealer khác `7908` | SK/BBS queue. |
| Mgmt code `VEX` | Ép batch. |
| Dealer `2539`, `7960`; intermediary `AGRA`, `AGRI` | File naming/grouping trong `UBOrderCreateFile*`. |
| Dealer `7907`, `9499`, `7968` | Fallback response matching cùng cửa sổ ngày legacy. |
| Dealer `9535` | Extra compliance check trong `IsOrderOK4FS`. |

Khi thay một literal, cần test tối thiểu: UI availability → validation SP → queue chọn đúng → filename/message → response correlation. Chuyển literal sang config mà không giữ đủ năm chặng có thể làm order “tạo được nhưng không gửi/không match response”.

## 9. Defect candidate liên quan tới mã

| ID | Bằng chứng | Tác động có thể xảy ra | Đề xuất test trước khi sửa |
|---|---|---|---|
| ORD-CODE-01 | `UBFundTrxSell` trả `104`; UI gọi index `94`; `m_MSG_Trx_EN` chỉ có 86 phần tử | Người dùng nhận message generic, không phải lỗi N$M dự kiến | Fee redemption, Client Name, settlement method khác `1`; assert message và `Ret`. |
| ORD-CODE-02 | `GetTrxErrorMSG` check `errorCode > Length`, không phải `>= Length` | Index đúng bằng length có thể ném `IndexOutOfRangeException` | Unit test `-1`, `0`, `Length-1`, `Length`, `Length+1`. |
| ORD-CODE-03 | Sell dùng `>=10`; các handler còn lại dùng `>10` | Mã 10 được display không nhất quán | Stub từng BLL trả 10 và so UI. |
| ORD-RESP-01 | C# kiểm tra `ErrorCode == "98" && ErrorCode == "003"` | Retry network busy không chạy ở lớp C# | Fixture `ERRORSET` với return 98/error 003. |
| ORD-RESP-02 | `ImportXMLGetReject` dùng `iCount < 5` | Error/warning thứ năm bị mất trước khi vào SP | XML có 5 error và 5 warning; assert đủ 10 field. |
| ORD-RESP-03 | `ImportXML` trả biến khởi tạo `true` khi stream/reader null | Monitoring/caller có thể ghi nhận success giả | Mock file hỏng/null stream và malformed reader. |
| ORD-RESP-04 | SQL retry branch dùng `@iTrxStatus` trước khi khởi tạo | Có thể ghi status transaction `NULL` hoặc fail | Chạy transaction test trên schema gần production với 98/003. |

Không thay code trong lượt tài liệu này. Các finding cần issue riêng, test bảo vệ và xác minh DB production trước khi deploy.

## 10. Nguồn tra cứu

| Nội dung | File/symbol |
|---|---|
| Message nội bộ và bounds | `UBStatic/CMSG.cs`: `m_MSG_Trx_EN`, `m_MSG_Trx_FR`, `GetTrxErrorMSG` |
| UI chuyển mã | `WebApp/Main/PopupTradeAdd.aspx.cs`: các handler Buy/Sell/Switch/Transfer/ICT |
| BLL contract | `UBClasses/Trx.cs`: `Buy`, `Sell`, `Switch`, `Transfer`, `ICT` và các bản `Edit` |
| SP core + queue/response | `ScriptDB/000_4_CreateSP.sql` |
| Status/UDF/lookup | `ScriptDB/000_3_CreateUDF.sql` |
| Parser response | `UBFFImport/COrder.cs`, `UBFFImport/CAT.cs` |
| Luồng tổng thể | [Order end-to-end](order-end-to-end.md) |
