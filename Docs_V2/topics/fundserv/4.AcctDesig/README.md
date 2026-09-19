# DOT 155 / AcctDesig — SQL snapshot review

> **Không phải kế hoạch đã triển khai hoặc xác nhận production.** Trang này kiểm kê các snapshot liên quan Client Name Fee Redemption và đối chiếu chúng với source repository.
>
> Nhãn dùng theo `Docs_V2/topics/fundserv/README.md:57-87`: **Verified**, **DB/SP-dependent**, **Historical**, **External boundary**.
>
> Xem [Snapshot reconciliation và verification plan](implementation_plan.md) để thực hiện Gate A–D trước khi quyết định triển khai.

## 1. Phạm vi review

Mục tiêu review là xác định repository thể hiện gì cho transaction type `'4'`, `AccountDesignation = '1'` và settlement method `'1'` (N$M). Bốn file SQL trong thư mục này được giữ nguyên và được xem là **Historical candidate snapshots**:

- `UBFeeGenerateTrx_Start.sql`
- `UBFeeGenerateTrxOneItem.sql`
- `UBFundTrxSell.sql`
- `UBFundTrxSellShort.sql`

Không có metadata migration, deployment record hoặc query từ database đang chạy để chứng minh các definition này đã được deploy.

## 2. Điều candidate snapshots chứng minh

| File | Bằng chứng trong snapshot | Không chứng minh |
|---|---|---|
| `UBFeeGenerateTrx_Start.sql` | Filter loại Client Name đã được comment (`:35-42`) | SP deployed đã nhận thay đổi |
| `UBFeeGenerateTrxOneItem.sql` | Đọc AcctDesig; comment Client Name `RETURN` (`:103-116`); đặt Net/source D/method `1` và gọi SellShort (`:188-247`) | Auto fee chạy thành công trên production |
| `UBFundTrxSell.sql` | Manual-path guard type `4` + AcctDesig `1` + method khác `1`, trả `104` (`:163-178`) | UI đã force N$M hoặc message `104` đã cấu hình |
| `UBFundTrxSellShort.sql` | Automatic-path guard tương tự (`:134-149`); phân loại fee và chuyển settlement vào order (`:215-289`) | Definition deployed giống snapshot |

Các snapshot chứng minh nội dung text của một candidate patch. Chúng không chứng minh thứ tự rollout, migration đã chạy, test đã pass hoặc binary/UI đang dùng cùng baseline.

## 3. Hai call path phải review riêng

### Manual trade

```text
PopupTradeAdd.OnSell -> CTrx.Sell -> UBFundTrxSell
```

**Verified:** UI đọc settlement method từ dropdown và truyền qua BLL vào `UBFundTrxSell`.

Source evidence:

- `WebApp/Main/PopupTradeAdd.aspx.cs:3448-3469,3651-3666`
- `DLLs/UBClasses/Trx.cs:990-1089`

**Verified:** source hiện tại không có đoạn force `cbSettlMethodSell = "1"`, disable dropdown hoặc server-side DOT 155 guard trong `ScreenSellChange()`/`OnSell()`. `CanPayToClient()` chỉ chặn Pay To Client; nó không enforce settlement method.

Source evidence: `WebApp/Main/PopupTradeAdd.aspx.cs:848-854,1008-1055,3448-3469`

### Automatic fee processing

```text
FeeProcessing.cs
  -> UBFeeProcessOnePlan (hoặc biến thể)
  -> UBFeeGenerateTrxOneItem
  -> UBFundTrxSellShort
```

**Verified:** đây là path khác manual trade. `UBFundTrxSell` không bảo vệ automatic chain.

Source evidence:

- `DLLs/UBClasses/FeeProcessing.cs:312-355`
- `MyPortfolioNew/VieFUND-Platform/src/SQLScript/000_4_CreateSP.sql:328244-328246,328485-328487`
- `Docs_V2/topics/fundserv/4.AcctDesig/UBFeeGenerateTrxOneItem.sql:188-247`

## 4. Mâu thuẫn baseline đã reconcile

| Claim cũ | Kết quả review |
|---|---|
| “UI đã force/disable N$M và có server validation” | Không có trong source hiện tại; claim stale |
| “`UBFundTrxSellShort` chưa được trace” | Đã có snapshot và guard tại `UBFundTrxSellShort.sql:134-149`; open question cũ đã đóng ở mức snapshot |
| “Candidate SQL là trạng thái database hiện tại” | Không có deployment evidence; không được khẳng định |
| “Sửa `UBFundTrxSell` là đủ cho fee processing” | Sai call path; automatic đi qua OneItem → SellShort |
| “Ret 104 sẽ hiện message song ngữ cụ thể” | WebApp map error code, nhưng source `CMSG` không chứa literal được đề xuất; cần test deployed UI |

Source evidence cho UI error mapping: `WebApp/Main/PopupTradeAdd.aspx.cs:3668-3671`; message arrays: `DLLs/UBStatic/CMSG.cs:197-284`.

## 5. SQL tổng trong repository không khớp candidate

Snapshot tổng `MyPortfolioNew/VieFUND-Platform/src/SQLScript/000_4_CreateSP.sql` vẫn có hai chặn Client Name:

1. `UBFeeGenerateTrx_Start` lọc `PL.AccountDesignation <> '1'` tại `:324042-324045`.
2. `UBFeeGenerateTrxOneItem` thực hiện `RETURN` cho `@AccountDesignation = '1'` tại `:324184-324188`.

Trong khi đó candidate files đã comment cả hai chặn. Đây là bằng chứng của **snapshot divergence**, không phải bằng chứng candidate mới hơn hoặc đang deploy.

## 6. Trạng thái review

| Concern | Repository evidence | Trạng thái được phép ghi |
|---|---|---|
| Manual call path | C# → `UBFundTrxSell` | **Verified** |
| Automatic call path | fee SP → OneItem → SellShort | **Verified** |
| Candidate auto N$M | method `'1'` trong OneItem snapshot | **Historical** |
| Candidate manual/auto guards | Ret `104` trong Sell/SellShort snapshots | **Historical** |
| Production SP parity | Không có deployed definition | **DB/SP-dependent; unverified** |
| UI force/disable N$M | Không có trong source hiện tại | Chưa triển khai trong snapshot source được review |
| Gateway/Fundserv acceptance | Ngoài repository | **External boundary** |

## 7. Cần verify trên deployed DB, UI và test environment

### Database

- Trích definition và version/hash của bốn SP từ database mục tiêu.
- Diff với SQL tổng và từng candidate snapshot; xác định source of truth và migration owner.
- Test cả `UBFundTrxSell` lẫn `UBFundTrxSellShort` với type `4`, AcctDesig `1`, method khác `1`; ghi lại return code.
- Chạy automatic fee item Client Name để xác nhận không bị filter ở Start hoặc `RETURN` ở OneItem.

### UI

- Xác nhận type `4` có thể chọn cho Client Name.
- Xác nhận behavior thực của settlement dropdown; không dùng tài liệu này thay cho test.
- Xác nhận Ret `104` map tới message EN/FR không rỗng.

### Export và integration test

- Tạo manual và automatic order riêng; xác nhận order DB lưu method `1`.
- Sinh file qua `UBOrderCreateFile`; kiểm tra payload runtime do SP/UDF tạo, không đối chiếu với fabricated sample.
- Kiểm tra response/acceptance ở test environment và lưu evidence deployment/log.

Cho đến khi các bước trên hoàn tất, DOT 155 trong thư mục này là **snapshot review**, không phải “production deployed”.
