# Tools — DevOps & Testing

> Scripts và công cụ hỗ trợ phát triển và testing.

## Mock FundServ Responses

Scripts tạo synthetic FundServ response files để test import pipeline:

| Script | Mô tả |
|---|---|
| [mock-dr-response.ps1](mock-dr-response.ps1) | Tạo DR (Order Response) file — hỗ trợ Accept, Reject, AcceptWithWarn, NetworkError |
| [mock-xr-response.ps1](mock-xr-response.ps1) | Tạo XR (NFU Response) file — hỗ trợ Accept, Reject |

### Cách sử dụng

```powershell
# Accept order
.\mock-dr-response.ps1 -SourceFile "CO_xxxx.xml" -Status Accept

# Reject order
.\mock-dr-response.ps1 -SourceFile "CO_xxxx.xml" -Status Reject

# XR response
.\mock-xr-response.ps1 -SourceFile "NFU_xxxx.xml" -Status Accept
```

## Sample Files

Thư mục [samples/](samples/) chứa các file mẫu:
- `CO_5678_20260430_001.xml` — Sample CO (Confirmation Order)
- `NFU_5678_20260430_001.xml` — Sample NFU
- `DR5678FSRV.20260430AAA9.Z01` — Sample DR response

## Topic Conversations

| File | Nội dung |
|---|---|
| [Topic Conversations](topic-conversations.md) | Ghi chú trao đổi về Mock scripts |
