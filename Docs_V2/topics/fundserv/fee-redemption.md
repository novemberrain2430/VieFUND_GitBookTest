# DOT 155 — Client Name Fee Redemptions

> **Snapshot review — không phải xác nhận production deployment.** Tài liệu dùng các nhãn **Verified**, **DB/SP-dependent**, **Historical** và **External boundary** theo `Docs_V2/topics/fundserv/README.md:57-87`.
>
> Các file `.sql` dưới `4.AcctDesig/` là snapshot ứng viên để review. Chúng không chứng minh stored procedure tương ứng đang chạy trên database đã deploy.

## 1. Kết luận đã đối chiếu

- **Verified:** luồng đặt lệnh thủ công và luồng tạo phí tự động là hai call path khác nhau.
- **Historical:** snapshot ứng viên thể hiện ý định cho phép `AcctDesig = '1'` và bắt buộc settlement method `'1'` (N$M) cho transaction type `'4'`.
- **DB/SP-dependent:** SQL tổng trong repository còn mâu thuẫn với các snapshot ứng viên; chưa có bằng chứng version SP trên database đã deploy.
- **Verified:** source UI hiện tại ẩn Pay To Client cho type `4`, nhưng không có đoạn force/disable N$M và không có server-side guard DOT 155 như tài liệu cũ từng mô tả.
- **External boundary:** gateway chuyển file OUT và phản hồi/acceptance của Fundserv nằm ngoài repository.

## 2. Luồng manual — `UBFundTrxSell`

```text
PopupTradeAdd.OnSell
  -> CTrx.Sell
  -> UBFundTrxSell
```

1. `OnSell()` đọc `TrxType` và lấy nguyên `SettlementMethod` từ `cbSettlMethodSell`, sau đó truyền chúng vào `CTrx.Sell()`.
2. `CTrx.Sell()` gọi `UBFundTrxSell` và chuyển tiếp settlement/withholding parameters.
3. Snapshot ứng viên `UBFundTrxSell.sql` đọc `AccountDesignation` từ `UB_Plan`; nếu type `4`, AcctDesig `1` và settlement method khác `1`, snapshot trả `104`.

Source evidence:

- `WebApp/Main/PopupTradeAdd.aspx.cs:3448-3469,3651-3666`
- `DLLs/UBClasses/Trx.cs:990-1089`
- `Docs_V2/topics/fundserv/4.AcctDesig/UBFundTrxSell.sql:163-178`

### Trạng thái UI hiện thấy trong repository

`CanPayToClient()` trả `false` cho transaction type `4` hoặc AcctDesig `1`. Tuy nhiên, `ScreenSellChange()` chỉ điều chỉnh settlement source/payment visibility; nó không set `cbSettlMethodSell` về `"1"` và không disable dropdown. `OnSell()` cũng không có guard DOT 155 trước khi gọi BLL.

Source evidence: `WebApp/Main/PopupTradeAdd.aspx.cs:848-854,1008-1055,3448-3469`

Vì vậy, không được ghi rằng UI đã enforce N$M. Với source hiện tại, guard manual chỉ có trong **Historical** candidate snapshot; hành vi cuối là **DB/SP-dependent**.

## 3. Luồng automatic fee — `UBFeeGenerateTrxOneItem` → `UBFundTrxSellShort`

```text
FeeProcessing.cs
  -> UBFeeProcessOnePlan (hoặc biến thể theo fee type)
  -> UBFeeGenerateTrxOneItem
  -> UBFundTrxSellShort
```

- **Verified:** C# chọn `UBFeeProcessOnePlan` hoặc biến thể theo fee type. SQL tổng cho thấy `UBFeeProcessOnePlan` gọi `UBFeeGenerateTrxOneItem`.
- **Historical:** candidate `UBFeeGenerateTrxOneItem.sql` đọc `AccountDesignation`, comment lệnh `RETURN` cũ cho Client Name, đặt `SettlementInd = 'N'`, `SettlementSource = 'D'`, `SettlementMethod = '1'`, chọn type `'4'` cho fee cases và gọi `UBFundTrxSellShort`.
- **Historical:** candidate `UBFundTrxSellShort.sql` đọc `AccountDesignation`, có guard type `4` + AcctDesig `1` + method khác `1` trả `104`, rồi phân loại fee/fee-redemption và chuyển settlement vào order.

Source evidence:

- `DLLs/UBClasses/FeeProcessing.cs:312-355`
- `MyPortfolioNew/VieFUND-Platform/src/SQLScript/000_4_CreateSP.sql:328244-328246,328485-328487`
- `Docs_V2/topics/fundserv/4.AcctDesig/UBFeeGenerateTrxOneItem.sql:103-116,188-247`
- `Docs_V2/topics/fundserv/4.AcctDesig/UBFundTrxSellShort.sql:134-149,215-289`

Luồng automatic không đi qua `UBFundTrxSell`; sửa hoặc kiểm thử riêng SP manual không chứng minh automatic fee chain hoạt động.

## 4. Bằng chứng N$M/AcctDesig trong SQL snapshots

| Snapshot | Điều nhìn thấy trực tiếp | Trạng thái |
|---|---|---|
| `UBFeeGenerateTrx_Start.sql` | Điều kiện loại `PL.AccountDesignation <> '1'` đã được comment | **Historical** — `:35-42` |
| `UBFeeGenerateTrxOneItem.sql` | Đọc AcctDesig; comment Client Name `RETURN`; đặt Net, source D, method `1`; gọi SellShort | **Historical** — `:103-116,188-247` |
| `UBFundTrxSell.sql` | Guard N$M cho manual path, trả `104` | **Historical** — `:163-178` |
| `UBFundTrxSellShort.sql` | Guard N$M cho automatic path, trả `104`; lưu settlement vào order | **Historical** — `:134-149,270-289` |

SQL tổng trong repository lại vẫn:

- lọc `PL.AccountDesignation <> '1'` ở bước chọn fee item; và
- `RETURN` khi `@AccountDesignation = '1'` trong `UBFeeGenerateTrxOneItem`.

Source evidence: `MyPortfolioNew/VieFUND-Platform/src/SQLScript/000_4_CreateSP.sql:324042-324045,324184-324188`

Mâu thuẫn này chỉ chứng minh có nhiều snapshot khác nhau. Nó không cho phép kết luận candidate đã được merge hoặc deploy.

## 5. Phạm vi claim về withholding tax

Tài liệu này không khẳng định Fee Redemption được “miễn thuế khấu trừ” về mặt nghiệp vụ hoặc pháp lý. Repository không phải nguồn đủ thẩm quyền cho kết luận đó.

Bằng chứng kỹ thuật hẹp duy nhất là SQL tổng trong repository đặt `@fFedWHoldTaxRt = 0` cho type `4`, và UDF chỉ phát `FedWHoldTaxRt` khi giá trị lớn hơn `0`. Đây là hành vi của source snapshot, vẫn **DB/SP-dependent**, không phải bằng chứng deployment hay diễn giải thuế.

Source evidence:

- `MyPortfolioNew/VieFUND-Platform/src/SQLScript/000_4_CreateSP.sql:465159-465160`
- `MyPortfolioNew/VieFUND-Platform/src/SQLScript/000_3_CreateUDF.sql:28194-28211`

## 6. Tạo outbound file

**Verified:** `COrder.OrderFileGenerate()` gọi `UBOrderCreateFile`, đọc `OrderMSG`/`iVersion`, rồi `OrderMsgCreate()` chỉ bọc body DB trả về trong envelope `OrdSet`.

**DB/SP-dependent:** `TrxnTyp`, `SettlMethd`, filename và nội dung order cuối cùng do stored procedure/UDF tạo. Không được dùng `sample-co.xml` để chứng minh payload nghiệp vụ.

Source evidence:

- `DLLs/UBFFImport/COrder.cs:20-49,86-121`
- `MyPortfolioNew/VieFUND-Platform/src/SQLScript/000_4_CreateSP.sql:464617-464771`

## 7. Cần verify trên môi trường đã deploy

1. Lấy `OBJECT_DEFINITION`/deployment artifact và version của `UBFeeGenerateTrx_Start`, `UBFeeGenerateTrxOneItem`, `UBFundTrxSell` và `UBFundTrxSellShort`; diff với cả SQL tổng và candidate snapshots.
2. Manual UI: xác nhận option type `4` có sẵn cho AcctDesig `1`; kiểm tra dropdown có thực sự force/disable N$M hay không.
3. Manual DB: thử method khác `1`; xác nhận SP deployed trả `104` và WebApp hiển thị message hợp lệ. Source `CMSG` hiện không chứa literal message được tài liệu cũ đề xuất (`DLLs/UBStatic/CMSG.cs:197-284`).
4. Automatic fee: chạy Client Name item qua đúng `UBFeeGenerateTrxOneItem` → `UBFundTrxSellShort`; xác nhận không bị lọc/return và order lưu method `1`.
5. Export: kiểm tra file OUT thực tế có type `4`, method `1` và envelope V36; lưu file, SP version và log làm evidence.
6. E2E: xác nhận response/acceptance từ test environment. Việc gateway pickup file là **External boundary**.

Cho đến khi hoàn thành các bước này, behavior cuối cùng phải ghi **DB/SP-dependent; deployment unverified**.
