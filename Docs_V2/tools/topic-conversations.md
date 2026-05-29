# Chat Conversation

### Planner Response

All outputs verified and match the expected structures from the source code parsers. Here's the summary:

---

## Changes Made

Updated both scripts in `Docs\Tools\` with a new `-Status` parameter:

### `Mock-DR-Response.ps1` — `-Status` values:

| Status | RtnCode | Behavior | Expected DB Outcome |
|--------|---------|----------|---------------------|
| `

### Planner Response

Done. Both scripts in `Docs\Tools\` now have a `-Status` parameter.

**`Mock-DR-Response.ps1`** supports 4 statuses:
- **`Accept`** (default) → RtnCode=00, Order → Confirmed
- **`Reject`** → RtnCode=01 + auto ErrorCodes, Order → Rejected
- **`AcceptWithWarn`** → RtnCode=00 + auto WarningCodes, Order → Confirmed with warning
- **`NetworkError`** → generates `<ErrorSet>` XML, calls SP `UBXMLRecOrderRespnProcessError`

**`Mock-XR-Response.ps1`** supports 2 statuses:
- **`Accept`** (default) → RtnCode=00, NFU → Confirmed
- **`Reject`** → RtnCode=01 + auto ErrorCodes, NFU → Rejected

### Usage examples:
```powershell
# Simple — just pass Status
.\Mock-DR-Response.ps1 -SourceFile "CO_xxxx.xml" -Status Accept
.\Mock-DR-Response.ps1 -SourceFile "CO_xxxx.xml" -Status Reject
.\Mock-DR-Response.ps1 -SourceFile "CO_xxxx.xml" -Status NetworkError

# Custom error codes still work
.\Mock-DR-Response.ps1 -SourceFile "CO_xxxx.xml" -Status Reject -ErrorCodes @("E001","E002")

# XR
.\Mock-XR-Response.ps1 -SourceFile "NFU_xxxx.xml" -Status Reject
```

Status auto-populates `RtnCode`, `ErrorCodes`, `WarningCodes` with sensible defaults — no need to know the raw codes. The summary output now also shows the **expected DB outcome** for each status.