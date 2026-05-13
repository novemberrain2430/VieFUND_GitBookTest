<#
.SYNOPSIS
    Create mock DR (Order Response) file from a CO (Order Entry) source file.

.DESCRIPTION
    Reads a CO (outgoing TFS order) XML file, extracts each Msg element,
    and generates a corresponding DR response file for VieFUNDIE service import.

    CO source structure: <OrdSet> -> <Msg> -> <MsgCreate>/<MsgType>/<OrdEntry>
    DR response structure: <OrdSet> -> <Msg> -> <MsgCreate>/<Ntwrk>/<MsgType>/<OrdRspn>

    Import pipeline matches response to original order via SrcID + DlrCode.

.PARAMETER SourceFile
    Path to the CO source file (XML file sent to FundServ).

.PARAMETER OutputDir
    Output directory for the DR file. Default = same directory as source file.
    For production test, set to FILE_PATH (IN folder) for service auto pick-up.

.PARAMETER Status
    FundServ response status (friendly name). This auto-sets RtnCode and defaults:
      "Accept"          -> RtnCode=00, no errors             (Order -> Confirmed)
      "Reject"          -> RtnCode=01, default ErrorCodes    (Order -> Rejected)
      "AcceptWithWarn"  -> RtnCode=00, default WarningCodes  (Order -> Confirmed + warning)
      "NetworkError"    -> Generates <ErrorSet> instead of <OrdSet>
    Default = "Accept". Overrides RtnCode if both specified.

.PARAMETER RtnCode
    Raw return code (advanced). Ignored if -Status is specified.
    "00" = Accept, "01"+ = Reject.

.PARAMETER RspnSrc
    Response source: "M" = Manufacturer (default), "N" = Network

.PARAMETER ErrorCodes
    Error codes for Reject. Auto-populated when -Status Reject if not specified.
    Max 4. Example: @("E001", "E002")

.PARAMETER WarningCodes
    Warning codes. Auto-populated when -Status AcceptWithWarn if not specified.
    Example: @("W001")

.PARAMETER SettlDays
    Settlement days after TradeDate. Default = 2 (T+2).

.PARAMETER OrdIdPrefix
    Prefix for mock FundServ Order ID. Default = "MOCK".

.EXAMPLE
    # Accept all orders (default)
    .\Mock-DR-Response.ps1 -SourceFile "C:\VieFUND\FF\OUT\CO_1274_20260430_001.xml"

.EXAMPLE
    # Reject all orders
    .\Mock-DR-Response.ps1 -SourceFile "C:\VieFUND\FF\OUT\CO_1274_20260430_001.xml" -Status Reject

.EXAMPLE
    # Reject with custom error codes
    .\Mock-DR-Response.ps1 -SourceFile "C:\VieFUND\FF\OUT\CO_1274_20260430_001.xml" -Status Reject -ErrorCodes @("E001","E002")

.EXAMPLE
    # Accept with warning
    .\Mock-DR-Response.ps1 -SourceFile "C:\VieFUND\FF\OUT\CO_1274_20260430_001.xml" -Status AcceptWithWarn

.EXAMPLE
    # Network error response
    .\Mock-DR-Response.ps1 -SourceFile "C:\VieFUND\FF\OUT\CO_1274_20260430_001.xml" -Status NetworkError

.EXAMPLE
    # Accept, output directly to IN folder
    .\Mock-DR-Response.ps1 -SourceFile "C:\VieFUND\FF\OUT\CO_1274_20260430_001.xml" -OutputDir "C:\VieFUND\FF\IN"

.NOTES
    WARNING: DO NOT RUN ON PRODUCTION! Mock files will change real order status in DB.
#>

[CmdletBinding()]
param(
    [Parameter(Mandatory = $true, Position = 0, HelpMessage = "Path to source CO file")]
    [ValidateScript({ Test-Path $_ -PathType Leaf })]
    [string]$SourceFile,

    [Parameter(Mandatory = $false)]
    [string]$OutputDir = "",

    [Parameter(Mandatory = $false, Position = 1, HelpMessage = "Response status: Accept, Reject, AcceptWithWarn, NetworkError")]
    [ValidateSet("Accept", "Reject", "AcceptWithWarn", "NetworkError")]
    [string]$Status = "Accept",

    [Parameter(Mandatory = $false)]
    [string]$RtnCode = "",

    [Parameter(Mandatory = $false)]
    [ValidateSet("M", "N")]
    [string]$RspnSrc = "M",

    [Parameter(Mandatory = $false)]
    [string[]]$ErrorCodes = @(),

    [Parameter(Mandatory = $false)]
    [string[]]$WarningCodes = @(),

    [Parameter(Mandatory = $false)]
    [ValidateRange(1, 30)]
    [int]$SettlDays = 2,

    [Parameter(Mandatory = $false)]
    [string]$OrdIdPrefix = "MOCK"
)

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

# ============================================================
# 0. Resolve Status -> RtnCode / ErrorCodes / WarningCodes
# ============================================================

# Status mapping table:
#   Accept         -> RtnCode=00, no errors, no warnings
#   Reject         -> RtnCode=01, ErrorCodes default=@("E001")
#   AcceptWithWarn -> RtnCode=00, WarningCodes default=@("W001")
#   NetworkError   -> Special: generates <ErrorSet> XML instead of <OrdSet>

$isNetworkError = $false

switch ($Status) {
    "Accept" {
        if ([string]::IsNullOrEmpty($RtnCode)) { $RtnCode = "00" }
    }
    "Reject" {
        if ([string]::IsNullOrEmpty($RtnCode)) { $RtnCode = "01" }
        if ($ErrorCodes.Count -eq 0) { $ErrorCodes = @("E001") }
    }
    "AcceptWithWarn" {
        if ([string]::IsNullOrEmpty($RtnCode)) { $RtnCode = "00" }
        if ($WarningCodes.Count -eq 0) { $WarningCodes = @("W001") }
    }
    "NetworkError" {
        $isNetworkError = $true
        $RtnCode = "99"
        $RspnSrc = "N"
        if ($ErrorCodes.Count -eq 0) { $ErrorCodes = @("999") }
    }
}

if ([string]::IsNullOrEmpty($RtnCode)) { $RtnCode = "00" }

# ============================================================
# 1. Validate & Parse source file
# ============================================================

Write-Host ""
Write-Host "=======================================================" -ForegroundColor Cyan
Write-Host "  Mock DR Response Generator (TFS Order Response)" -ForegroundColor Cyan
Write-Host "=======================================================" -ForegroundColor Cyan
Write-Host ""

$SourceFile = (Resolve-Path $SourceFile).Path
Write-Host "[INFO] Source file : $SourceFile" -ForegroundColor Gray

# Show status clearly
$statusColor = switch ($Status) {
    "Accept"         { "Green" }
    "Reject"         { "Red" }
    "AcceptWithWarn"  { "Yellow" }
    "NetworkError"   { "Magenta" }
}
Write-Host "[INFO] Status     : $Status" -ForegroundColor $statusColor

if ([string]::IsNullOrEmpty($OutputDir)) {
    $OutputDir = Split-Path $SourceFile -Parent
}
if (-not (Test-Path $OutputDir)) {
    New-Item -ItemType Directory -Path $OutputDir -Force | Out-Null
    Write-Host "[INFO] Created output dir: $OutputDir" -ForegroundColor Yellow
}

# Load XML
try {
    [xml]$srcXml = Get-Content -Path $SourceFile -Encoding UTF8
}
catch {
    Write-Host "[ERROR] Cannot read XML file: $_" -ForegroundColor Red
    exit 1
}

# ============================================================
# 2. Detect root element & namespace
# ============================================================

$root = $srcXml.DocumentElement
if ($null -eq $root) {
    Write-Host "[ERROR] XML file has no root element." -ForegroundColor Red
    exit 1
}

$rootName = $root.LocalName
if ($rootName -ne "OrdSet") {
    Write-Host "[ERROR] Root element is not <OrdSet> (found: <$rootName>). Not a CO/TFS file." -ForegroundColor Red
    exit 1
}

# Extract namespace & version
$ns = $root.NamespaceURI
if ([string]::IsNullOrEmpty($ns)) { $ns = "tfs" }
$nsMgr = New-Object System.Xml.XmlNamespaceManager($srcXml.NameTable)
$nsMgr.AddNamespace("tfs", $ns)

$version = $root.GetAttribute("Version")
if ([string]::IsNullOrEmpty($version)) { $version = "35" }

Write-Host "[INFO] Namespace  : $ns" -ForegroundColor Gray
Write-Host "[INFO] Version    : $version" -ForegroundColor Gray

# ============================================================
# 3. Extract Msg elements from source
# ============================================================

$msgNodes = $root.SelectNodes("tfs:Msg", $nsMgr)
if ($null -eq $msgNodes -or $msgNodes.Count -eq 0) {
    $msgNodes = $root.SelectNodes("Msg")
}

if ($null -eq $msgNodes -or $msgNodes.Count -eq 0) {
    Write-Host "[ERROR] No <Msg> elements found in source file." -ForegroundColor Red
    exit 1
}

Write-Host "[INFO] Found      : $($msgNodes.Count) message(s)" -ForegroundColor Gray
Write-Host ""

# ============================================================
# 4. Helper: Extract text from XML node
# ============================================================

function Get-XmlValue {
    param(
        [System.Xml.XmlNode]$Node,
        [string]$XPath,
        [System.Xml.XmlNamespaceManager]$NsMgr,
        [string]$Default = ""
    )
    if ($null -eq $Node) { return $Default }

    $found = $Node.SelectSingleNode($XPath, $NsMgr)
    if ($null -ne $found) { return $found.InnerText.Trim() }

    # Fallback without namespace
    $plainXPath = $XPath -replace "tfs:", ""
    $found = $Node.SelectSingleNode($plainXPath)
    if ($null -ne $found) { return $found.InnerText.Trim() }

    return $Default
}

# ============================================================
# 5. Build response XML
# ============================================================

$today = Get-Date
$tradeDate = $today.ToString("yyyyMMdd")

# Calculate settlement date (skip weekends)
$settlDate = $today
for ($d = 0; $d -lt $SettlDays; ) {
    $settlDate = $settlDate.AddDays(1)
    if ($settlDate.DayOfWeek -ne [DayOfWeek]::Saturday -and $settlDate.DayOfWeek -ne [DayOfWeek]::Sunday) {
        $d++
    }
}
$settlDateStr = $settlDate.ToString("yyyyMMdd")

$NL = [Environment]::NewLine
$ordCounter = 0
$responseMsgBlocks = [System.Collections.ArrayList]::new()

# ---------- NetworkError: special <ErrorSet> format ----------
if ($isNetworkError) {
    # For NetworkError, we extract the first SrcID to use as CorrlatnID
    $firstMsg = $msgNodes[0]
    $firstSrcId = Get-XmlValue $firstMsg ".//tfs:SrcID" $nsMgr ""
    if ([string]::IsNullOrEmpty($firstSrcId)) {
        $firstSrcId = Get-XmlValue $firstMsg ".//SrcID" $nsMgr "UNKNOWN"
    }

    # Generate a mock CorrlatnID (hex string like real FundServ)
    $corrlatnId = "414D51204653514D5541542020202020" + $today.ToString("yyyyMMddHHmmss")

    $errCode = $ErrorCodes[0]
    Write-Host "  [NetworkError] ErrorCode=$errCode | CorrlatnID=$corrlatnId" -ForegroundColor Magenta

    $drXml  = '<?xml version="1.0" encoding="UTF-8"?>' + $NL
    $drXml += "<ErrorSet>" + $NL
    $drXml += "  <NtwrkError>" + $NL
    $drXml += "    <RspnSrc>N</RspnSrc>" + $NL
    $drXml += "    <RtnCode>$RtnCode</RtnCode>" + $NL
    $drXml += "    <ErrorCode>$errCode</ErrorCode>" + $NL
    $drXml += "    <CorrlatnID>$corrlatnId</CorrlatnID>" + $NL
    $drXml += "    <OrdID>$firstSrcId</OrdID>" + $NL
    $drXml += "  </NtwrkError>" + $NL
    $drXml += "</ErrorSet>"

    $responseMsgBlocks.Add("NetworkError") | Out-Null
}
else {
    # ---------- Normal OrdSet response ----------
    foreach ($msg in $msgNodes) {
        $ordCounter++

        # Extract fields from source Msg
        $srcDlrCode    = Get-XmlValue $msg "tfs:MsgCreate/tfs:Src/tfs:DlrCode"       $nsMgr ""
        $targetDlrCode = Get-XmlValue $msg "tfs:MsgCreate/tfs:Target/tfs:DlrCode"    $nsMgr ""

        # CO: Src = our dealer, Target = manufacturer
        # DR: Src = manufacturer, Target = our dealer (swap!)
        $respSrcDlr    = if ($targetDlrCode) { $targetDlrCode } else { "MFR001" }
        $respTargetDlr = if ($srcDlrCode)    { $srcDlrCode }    else { "UNKNOWN" }

        # Find ActnCode
        $actnCode = Get-XmlValue $msg ".//tfs:ActnCode" $nsMgr ""
        if ([string]::IsNullOrEmpty($actnCode)) {
            $actnCode = Get-XmlValue $msg ".//ActnCode" $nsMgr ""
        }
        if ([string]::IsNullOrEmpty($actnCode)) { $actnCode = "PUR" }

        $srcId = Get-XmlValue $msg ".//tfs:SrcID" $nsMgr ""
        if ([string]::IsNullOrEmpty($srcId)) {
            $srcId = Get-XmlValue $msg ".//SrcID" $nsMgr ""
        }
        if ([string]::IsNullOrEmpty($srcId)) { $srcId = "SRC-UNKNOWN-$ordCounter" }

        $fundAcctId = Get-XmlValue $msg ".//tfs:FundAcctID" $nsMgr ""
        if ([string]::IsNullOrEmpty($fundAcctId)) {
            $fundAcctId = Get-XmlValue $msg ".//FundAcctID" $nsMgr ""
        }
        if ([string]::IsNullOrEmpty($fundAcctId)) { $fundAcctId = "" }

        # TradeDate/SettlDate from source or use calculated
        $srcTradeDate = Get-XmlValue $msg ".//tfs:TradeDate" $nsMgr ""
        if ([string]::IsNullOrEmpty($srcTradeDate)) {
            $srcTradeDate = Get-XmlValue $msg ".//TradeDate" $nsMgr ""
        }
        if ([string]::IsNullOrEmpty($srcTradeDate)) { $srcTradeDate = $tradeDate }

        $srcSettlDate = Get-XmlValue $msg ".//tfs:SettlDate" $nsMgr ""
        if ([string]::IsNullOrEmpty($srcSettlDate)) {
            $srcSettlDate = Get-XmlValue $msg ".//SettlDate" $nsMgr ""
        }
        if ([string]::IsNullOrEmpty($srcSettlDate)) { $srcSettlDate = $settlDateStr }

        # Generate mock Order ID
        $ordId = "$OrdIdPrefix-$($today.ToString('yyyyMMdd'))-$('{0:D4}' -f $ordCounter)"

        $statusIcon = switch ($Status) {
            "Accept"        { "[OK]" }
            "Reject"        { "[REJECT]" }
            "AcceptWithWarn" { "[WARN]" }
        }
        Write-Host "  $statusIcon [$ordCounter] SrcID=$srcId | ActnCode=$actnCode | DlrCode=$respTargetDlr -> $respSrcDlr" -ForegroundColor White

        # Build Msg block
        $msgXml  = "  <Msg>" + $NL
        $msgXml += "    <MsgCreate>" + $NL
        $msgXml += "      <Src>" + $NL
        $msgXml += "        <DlrCode>$respSrcDlr</DlrCode>" + $NL
        $msgXml += "      </Src>" + $NL
        $msgXml += "      <Target>" + $NL
        $msgXml += "        <DlrCode>$respTargetDlr</DlrCode>" + $NL
        $msgXml += "      </Target>" + $NL
        $msgXml += "    </MsgCreate>" + $NL
        $msgXml += "    <Ntwrk>" + $NL
        $msgXml += "      <OrdID>$ordId</OrdID>" + $NL
        $msgXml += "      <TradeDate>$srcTradeDate</TradeDate>" + $NL
        $msgXml += "      <SettlDate>$srcSettlDate</SettlDate>" + $NL
        $msgXml += "    </Ntwrk>" + $NL
        $msgXml += "    <MsgType>" + $NL
        $msgXml += "      <OrdRspn>" + $NL
        $msgXml += "        <ActnCode>$actnCode</ActnCode>" + $NL
        $msgXml += "        <SrcID>$srcId</SrcID>" + $NL
        $msgXml += "        <FundAcctID>$fundAcctId</FundAcctID>" + $NL
        $msgXml += "        <OrdID>$ordId</OrdID>" + $NL
        $msgXml += "        <TradeDate>$srcTradeDate</TradeDate>" + $NL
        $msgXml += "        <SettlDate>$srcSettlDate</SettlDate>" + $NL
        $msgXml += "        <RtnCode>$RtnCode</RtnCode>" + $NL
        $msgXml += "        <RspnSrc>$RspnSrc</RspnSrc>" + $NL
        $msgXml += "        <DlrCode>$respTargetDlr</DlrCode>" + $NL

        # Reject block
        if ($RtnCode -ne "00" -and $ErrorCodes.Count -gt 0) {
            $msgXml += "        <Reject>" + $NL
            foreach ($ec in ($ErrorCodes | Select-Object -First 4)) {
                $msgXml += "          <ErrorCode>$ec</ErrorCode>" + $NL
            }
            $msgXml += "        </Reject>" + $NL
        }

        # Warning block
        if ($WarningCodes.Count -gt 0) {
            $msgXml += "        <Warning>" + $NL
            foreach ($wc in ($WarningCodes | Select-Object -First 4)) {
                $msgXml += "          <ErrorCode>$wc</ErrorCode>" + $NL
            }
            $msgXml += "        </Warning>" + $NL
        }

        $msgXml += "      </OrdRspn>" + $NL
        $msgXml += "    </MsgType>" + $NL
        $msgXml += "  </Msg>"

        $responseMsgBlocks.Add($msgXml) | Out-Null
    }

    # Assemble full OrdSet response
    $allMsgs = $responseMsgBlocks -join $NL
    $drXml  = '<?xml version="1.0" encoding="UTF-8"?>' + $NL
    $drXml += '<OrdSet xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns="tfs" xsi:schemaLocation="tfs tfs.xsd" Version="' + $version + '">' + $NL
    $drXml += $allMsgs + $NL
    $drXml += '</OrdSet>'
}

# ============================================================
# 6. Generate output filename
# ============================================================

# DR naming convention: DR{DealerCode}FSRV.{YYYYMMDD}{SEQ}9.Z01
$firstMsg = $msgNodes[0]
$firstDlr = Get-XmlValue $firstMsg "tfs:MsgCreate/tfs:Src/tfs:DlrCode" $nsMgr ""
if ([string]::IsNullOrEmpty($firstDlr)) {
    $firstDlr = Get-XmlValue $firstMsg "MsgCreate/Src/DlrCode" $nsMgr "0000"
}

$dateStr = $today.ToString("yyyyMMdd")

# Generate unique sequence to avoid overwriting
$attempt = 0
do {
    $charA = [char]([int]([char]'A') + [int][math]::Floor($attempt / 676) % 26)
    $charB = [char]([int]([char]'A') + [int][math]::Floor($attempt / 26) % 26)
    $charC = [char]([int]([char]'A') + [int]($attempt % 26))
    $seqStr = "$charA$charB$charC"
    $outputFileName = "DR${firstDlr}FSRV.${dateStr}${seqStr}9.Z01"
    $outputFilePath = Join-Path $OutputDir $outputFileName
    $attempt++
} while ((Test-Path $outputFilePath) -and $attempt -lt 17576)

# ============================================================
# 7. Write output file
# ============================================================

$drXml | Out-File -FilePath $outputFilePath -Encoding UTF8 -NoNewline

# ============================================================
# 8. Summary output
# ============================================================

Write-Host ""
Write-Host "-------------------------------------------------------" -ForegroundColor Green
Write-Host "[OK] DR response file created:" -ForegroundColor Green
Write-Host "     $outputFilePath" -ForegroundColor White
Write-Host ""
Write-Host "     Status    : $Status" -ForegroundColor $statusColor
Write-Host "     Messages  : $($responseMsgBlocks.Count)" -ForegroundColor Gray

$rtnLabel = switch ($RtnCode) {
    "00" { "Accept" }
    "01" { "Reject" }
    "99" { "NetworkError" }
    default { "Reject ($RtnCode)" }
}
Write-Host "     RtnCode   : $RtnCode ($rtnLabel)" -ForegroundColor Gray

$rspnLabel = if ($RspnSrc -eq "M") { "Manufacturer" } else { "Network" }
Write-Host "     RspnSrc   : $RspnSrc ($rspnLabel)" -ForegroundColor Gray
Write-Host "     TradeDate  : $tradeDate" -ForegroundColor Gray
Write-Host "     SettlDate  : $settlDateStr" -ForegroundColor Gray

if ($ErrorCodes.Count -gt 0) {
    Write-Host "     ErrorCodes : $($ErrorCodes -join ', ')" -ForegroundColor Yellow
}
if ($WarningCodes.Count -gt 0) {
    Write-Host "     Warnings   : $($WarningCodes -join ', ')" -ForegroundColor Yellow
}

# Expected DB outcome
$expectedOutcome = switch ($Status) {
    "Accept"        { "Order status -> Confirmed" }
    "Reject"        { "Order status -> Rejected (error codes saved in DB)" }
    "AcceptWithWarn" { "Order status -> Confirmed (with warning logged)" }
    "NetworkError"  { "SP UBXMLRecOrderRespnProcessError called" }
}
Write-Host ""
Write-Host "     Expected  : $expectedOutcome" -ForegroundColor Cyan

Write-Host "-------------------------------------------------------" -ForegroundColor Green
Write-Host ""
Write-Host "  Next steps:" -ForegroundColor Cyan
Write-Host "  1. Copy file to FILE_PATH (IN) if not already output there" -ForegroundColor Gray
Write-Host "  2. Wait for VieFUNDIE service poll (~60s)" -ForegroundColor Gray
Write-Host "  3. Check Event Log & DB status" -ForegroundColor Gray
Write-Host ""
