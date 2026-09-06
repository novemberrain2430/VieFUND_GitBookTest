# Topics — Tra cứu theo chủ đề

> Mỗi topic gom TẤT CẢ tài liệu liên quan (business logic + code guide + tools + reference) vào một chỗ.

## Business Topics

| Topic | Mô tả | Trạng thái |
|---|---|---|
| [Client & KYC](client-kyc/) | Quản lý khách hàng, KYC, FINTRAC, AML, RepCode | ✅ Có module guide |
| [Account & Plan](account-plan/) | Plan types (RRSP, TFSA, RRIF...), account setup, beneficiary | ✅ Có module guide |
| [Trading & Orders](trading-orders/) | Trade entry, order lifecycle, error correction và từ điển mã/hard-code | ✅ Có module guide + end-to-end + code dictionary đã source-audit |
| [FundServ](fundserv/) | File exchange (TFS/NFU/TS/PS...), V36 upgrade, mock tools | ✅ Nhiều tài liệu |
| [Commission & Fee](commission-fee/) | Trailing fees, DSC, fee redemptions | ✅ Có module guide |
| [Fund & GIC](fund-gic/) | Fund definitions, NAV, GIC (Guaranteed Investment Certificate) | ✅ Có module guide |
| [Compliance](compliance/) | Suitability, phê duyệt tài khoản/KYC, trend, AML/FINTRAC | ✅ Có module guide |
| [Tax & Year-End](tax-yearend/) | Tax slip, CRA/Québec XML, PDF, release và submission | ✅ Có module guide |
| [Settlement](settlement/) | Settlement flow, N$M, cheque, EFT | ✅ Có module guide, đã đối chiếu source/SP/DB |

## Technical Topics

| Topic | Mô tả | Trạng thái |
|---|---|---|
| [Security](security/) | Bảo mật, Red Sentry audit, encryption, access control | ✅ Có module guide + audit/remediation notes |
| [PDF & Reports](pdf-reports/) | PDF generation, report catalog, ad-hoc, tax/form/confirmation và charts | ✅ Hoàn thành topic, đã đối chiếu source/SP/DB |
| [Onboarding](onboarding/) | ASMX integration, client/plan/order import và duyệt back-office | ✅ Có guide đầy đủ, đã đối chiếu source |

## Thêm topic mới

Tạo folder `topics/<tên-topic>/` với `README.md` giới thiệu topic.
