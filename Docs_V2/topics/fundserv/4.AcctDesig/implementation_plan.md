# DOT 155 — Snapshot reconciliation và verification plan

> Tài liệu này thay cho plan cũ vốn trộn đề xuất, candidate SQL và trạng thái runtime. Nó không xác nhận code/SQL đã deploy.
>
> Nhãn dùng theo `Docs_V2/topics/fundserv/README.md:57-87`: **Verified**, **DB/SP-dependent**, **Historical**, **External boundary**.

## 1. Baseline đã review

| Baseline | Vai trò | Mức tin cậy cho production |
|---|---|---|
| C# dưới `WebApp/` và `DLLs/` | Call path/source snapshot hiện có | **Verified** cho repository; binary parity chưa xác nhận |
| `MyPortfolioNew/VieFUND-Platform/src/SQLScript/000_4_CreateSP.sql` | SQL tổng snapshot ngày script | **DB/SP-dependent**; không phải deployed definition |
| Bốn `.sql` trong `Docs_V2/topics/fundserv/4.AcctDesig/` | Candidate patch snapshots | **Historical**; không chứng minh rollout |
| Deployed DB/UI/test result | Chưa được cung cấp | Unverified |

Không chỉnh hoặc chạy trực tiếp candidate `.sql` chỉ dựa trên tài liệu này.

## 2. Kết quả reconciliation

### 2.1 Manual và automatic là hai luồng độc lập

```text
Manual:
PopupTradeAdd.OnSell -> CTrx.Sell -> UBFundTrxSell

Automatic:
FeeProcessing.cs -> UBFeeProcessOnePlan (hoặc biến thể)
                 -> UBFeeGenerateTrxOneItem
                 -> UBFundTrxSellShort
```

Source evidence:

- `WebApp/Main/PopupTradeAdd.aspx.cs:3448-3469,3651-3666`
- `DLLs/UBClasses/Trx.cs:990-1089`
- `DLLs/UBClasses/FeeProcessing.cs:312-355`
- `MyPortfolioNew/VieFUND-Platform/src/SQLScript/000_4_CreateSP.sql:328244-328246,328485-328487`

**Verified:** test `UBFundTrxSell` không bao phủ automatic fee chain; OneItem/SellShort phải được test riêng.

### 2.2 Candidate snapshots có logic DOT 155 dự kiến

- `UBFeeGenerateTrx_Start.sql:35-42`: comment filter Client Name.
- `UBFeeGenerateTrxOneItem.sql:103-116`: đọc AcctDesig và comment `RETURN` cũ.
- `UBFeeGenerateTrxOneItem.sql:188-247`: đặt Net/source D/method `1`, chọn type `4` và gọi SellShort.
- `UBFundTrxSell.sql:163-178`: guard N$M cho manual path, trả `104`.
- `UBFundTrxSellShort.sql:134-149,215-289`: guard automatic path, phân loại fee và chuyển settlement vào order.

Tất cả các kết luận trên là **Historical snapshot evidence**, không phải deployment evidence.

### 2.3 SQL tổng vẫn thể hiện baseline cũ

- `MyPortfolioNew/VieFUND-Platform/src/SQLScript/000_4_CreateSP.sql:324042-324045` vẫn lọc `PL.AccountDesignation <> '1'`.
- `MyPortfolioNew/VieFUND-Platform/src/SQLScript/000_4_CreateSP.sql:324184-324188` vẫn `RETURN` Client Name trong OneItem.

Do đó không thể vừa coi SQL tổng là source of truth vừa tuyên bố candidate đã tích hợp. Cần lấy definition từ database mục tiêu để giải quyết divergence.

### 2.4 Claim UI cũ không khớp source

`CanPayToClient()` chặn Pay To Client cho type `4`/AcctDesig `1`, nhưng `ScreenSellChange()` không force/disable settlement dropdown. `OnSell()` lấy nguyên dropdown value và không có DOT 155 guard trước BLL.

Source evidence: `WebApp/Main/PopupTradeAdd.aspx.cs:848-854,1008-1055,3448-3469`

Vì vậy:

- bỏ claim “UI đã hoàn thiện”; và
- coi UI enforcement là gap cần quyết định/verify, không phải task đã done.

### 2.5 `UBFundTrxSellShort` không còn là open trace question

Candidate snapshot đã được trace và có guard tại `UBFundTrxSellShort.sql:134-149`. Open question còn lại là definition nào đang deploy, không phải nội dung candidate file.

### 2.6 Error message chưa được chứng minh

WebApp chuyển DB error `104` thành message index `94`, nhưng source arrays không chứa literal EN/FR từng được plan cũ đề xuất.

Source evidence:

- `WebApp/Main/PopupTradeAdd.aspx.cs:3668-3671`
- `DLLs/UBStatic/CMSG.cs:197-284`

Không được ghi rằng message cụ thể đã hoạt động nếu chưa test binary/UI deployed.

## 3. Verification plan trước khi quyết định implementation

### Gate A — xác định deployed DB baseline

Owner: DBA/release owner.

1. Lấy `OBJECT_DEFINITION`, modify date và deployment/version record cho:
   - `UBFeeGenerateTrx_Start`
   - `UBFeeGenerateTrxOneItem`
   - `UBFundTrxSell`
   - `UBFundTrxSellShort`
2. Diff deployed definitions với SQL tổng và candidate snapshots.
3. Ghi rõ database/environment, timestamp và hash; chọn một source of truth.

Exit criterion: biết chính xác hai Client Name blocks và hai Ret `104` guards có tồn tại trên DB mục tiêu hay không.

### Gate B — manual path

Owner: WebApp + DB.

1. Trên UI deployed, chọn Client Name và transaction type `4`.
2. Ghi nhận settlement options, selected value, enabled state và Pay To Client behavior.
3. Gửi method `1`; xác nhận order lưu type `4`/method `1`.
4. Gửi method khác `1` bằng test an toàn; xác nhận DB guard và message UI.

Exit criterion: có UI capture, DB row và return/message evidence; không chỉ dựa trên source snapshot.

### Gate C — automatic fee path

Owner: fee processing + DB.

1. Tạo Client Name fee item đủ điều kiện trong test environment.
2. Xác nhận Start không loại item và OneItem không `RETURN` sớm.
3. Trace `UBFeeGenerateTrxOneItem` → `UBFundTrxSellShort`.
4. Xác nhận order/result lưu settlement indicator `N`, source `D` (trừ nhánh intermediary có bằng chứng riêng) và method `1`.
5. Negative test method khác `1` trực tiếp trên SellShort; mong đợi `104` nếu guard thuộc approved design.

Exit criterion: có SP trace/log và DB assertions cho đúng automatic chain.

### Gate D — outbound và response

Owner: Fundserv integration/release.

1. Đưa manual và automatic orders qua `UBOrderCreateFile`.
2. Kiểm tra file runtime có envelope V36 và body từ `OrderMSG`.
3. Kiểm tra các field nghiệp vụ từ deployed SP/UDF, không dùng `sample-co.xml` làm expected body.
4. Gửi qua test gateway và lưu response/acceptance.

Source evidence cho envelope/body boundary:

- `DLLs/UBFFImport/COrder.cs:20-49,86-121`
- `MyPortfolioNew/VieFUND-Platform/src/SQLScript/000_4_CreateSP.sql:464617-464771`

Gateway và Fundserv acceptance là **External boundary**.

## 4. Decision log cần hoàn tất sau verification

| Quyết định | Evidence bắt buộc |
|---|---|
| Candidate SQL nào được chấp thuận | Deployed diff + DBA owner |
| Có cần UI force/disable N$M | UX/business decision + manual-path test |
| Ret `104` và text EN/FR | Approved mapping + deployed UI test |
| Automatic Client Name được mở cho dealer nào | Business rule + representative dealer tests |
| Điều kiện release DOT 155 | Manual, automatic, export và response evidence |

## 5. Trạng thái cuối của review

- **Verified:** call paths và nội dung source/snapshot nêu trên.
- **Historical:** logic trong bốn candidate `.sql`.
- **DB/SP-dependent:** behavior cuối, outbound order fields và Ret `104` trên database mục tiêu.
- **External boundary:** gateway pickup và Fundserv response/acceptance.
- **Deployment status:** unverified.

Không đánh dấu DOT 155 “implemented”, “production ready” hoặc “deployed” cho đến khi Gate A–D có evidence.
