<#
.SYNOPSIS
    Create mock XR (NFU Response) file from an NFU (Non-Financial Update) source file.

.DESCRIPTION
    Reads an NFU (outgoing) XML file, extracts each Msg element,
    and generates a corresponding XR response file for VieFUNDIE service import.

    NFU source structure: <MessageSet> -> <Msg> -> <MsgCreate>/<MsgType>/<Reqst>
    XR response structure: <MessageSet> -> <Msg> -> <MsgCreate>/<MsgType>/<Response>

    Import pipeline (CXM.ImportXMLRspn):
    - Parses <Response> element with: SRCID, MESSAGEID, RTNCODE, RSPNSRC, ACCTCONFIRM, DLRCODE, ERRORS
    - SP: UBXMLRecNFURespnProcess updates NFU status in DB
    - Matches via SrcID + DlrCode

.PARAMETER SourceFile
    Path to the NFU source file (XML file sent to FundServ).

.PARAMETER OutputDir
    Output directory for the XR file. Default = same directory as source file.
    For production test, set to FILE_PATH (IN folder) for service auto pick-up.

.PARAMETER Status
    FundServ response status (friendly name). This auto-sets RtnCode and defaults:
      "Accept"  -> RtnCode=00, no errors        (NFU -> Confirmed)
      "Reject"  -> RtnCode=01, default ErrorCodes (NFU -> Rejected)
    Default = "Accept". Overrides RtnCode if both specified.

.PARAMETER RtnCode
    Raw return code (advanced). Ignored if -Status is specified.
    "00" = Accept, "01"+ = Reject.

.PARAMETER RspnSrc
    Response source: "M" = Manufacturer (default), "N" = Network

.PARAMETER ErrorCodes
    Error codes for Reject. Auto-populated when -Status Reject if not specified.
    Max 4. Example: @("E100", "E101")

.EXAMPLE
    # Accept all NFU items (default)
    .\Mock-XR-Response.ps1 -SourceFile "C:\VieFUND\FF\OUT\NFU_1274_20260430_001.xml"

.EXAMPLE
    # Reject all NFU items
    .\Mock-XR-Response.ps1 -SourceFile "C:\VieFUND\FF\OUT\NFU_1274_20260430_001.xml" -Status Reject

.EXAMPLE
    # Reject with custom error codes
    .\Mock-XR-Response.ps1 -SourceFile "C:\VieFUND\FF\OUT\NFU_1274_20260430_001.xml" -Status Reject -ErrorCodes @("E100","E101")

.EXAMPLE
    # Accept, output directly to IN folder
    .\Mock-XR-Response.ps1 -SourceFile "C:\VieFUND\FF\OUT\NFU_1274_20260430_001.xml" -OutputDir "C:\VieFUND\FF\IN"

.NOTES
    WARNING: DO NOT RUN ON PRODUCTION! Mock files will change real NFU status in DB.
#>

[CmdletBinding()]
param(
    [Parameter(Mandatory = $true, Position = 0, HelpMessage = "Path to source NFU file")]
    [ValidateScript({ Test-Path $_ -PathType Leaf })]
    [string]$SourceFile,

    [Parameter(Mandatory = $false)]
    [string]$OutputDir = "",

    [Parameter(Mandatory = $false, Position = 1, HelpMessage = "Response status: Accept or Reject")]
    [ValidateSet("Accept", "Reject")]
    [string]$Status = "Accept",

    [Parameter(Mandatory = $false)]
    [string]$RtnCode = "",

    [Parameter(Mandatory = $false)]
    [ValidateSet("M", "N")]
    [string]$RspnSrc = "M",

    [Parameter(Mandatory = $false)]
    [string[]]$ErrorCodes = @()
)

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

# ============================================================
# 0. Resolve Status -> RtnCode / ErrorCodes
# ============================================================

# Status mapping:
#   Accept -> RtnCode=00, no errors      (NFU -> Confirmed)
#   Reject -> RtnCode=01, default errors (NFU -> Rejected)

switch ($Status) {
    "Accept" {
        if ([string]::IsNullOrEmpty($RtnCode)) { $RtnCode = "00" }
    }
    "Reject" {
        if ([string]::IsNullOrEmpty($RtnCode)) { $RtnCode = "01" }
        if ($ErrorCodes.Count -eq 0) { $ErrorCodes = @("E100") }
    }
}

if ([string]::IsNullOrEmpty($RtnCode)) { $RtnCode = "00" }

# ============================================================
# 1. Validate & Parse source file
# ============================================================

Write-Host ""
Write-Host "=======================================================" -ForegroundColor Cyan
Write-Host "  Mock XR Response Generator (NFU Response)" -ForegroundColor Cyan
Write-Host "=======================================================" -ForegroundColor Cyan
Write-Host ""

$SourceFile = (Resolve-Path $SourceFile).Path
Write-Host "[INFO] Source file : $SourceFile" -ForegroundColor Gray

# Show status clearly
$statusColor = if ($Status -eq "Accept") { "Green" } else { "Red" }
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
if ($rootName -ne "MessageSet") {
    Write-Host "[ERROR] Root element is not <MessageSet> (found: <$rootName>). Not an NFU file." -ForegroundColor Red
    exit 1
}

# Extract namespace & version
$ns = $root.NamespaceURI
if ([string]::IsNullOrEmpty($ns)) { $ns = "nfu" }
$nsMgr = New-Object System.Xml.XmlNamespaceManager($srcXml.NameTable)
$nsMgr.AddNamespace("nfu", $ns)

$version = $root.GetAttribute("Version")
if ([string]::IsNullOrEmpty($version)) { $version = "35" }

Write-Host "[INFO] Namespace  : $ns" -ForegroundColor Gray
Write-Host "[INFO] Version    : $version" -ForegroundColor Gray

# ============================================================
# 3. Extract Msg elements from source
# ============================================================

$msgNodes = $root.SelectNodes("nfu:Msg", $nsMgr)
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
    $plainXPath = $XPath -replace "nfu:", ""
    $found = $Node.SelectSingleNode($plainXPath)
    if ($null -ne $found) { return $found.InnerText.Trim() }

    return $Default
}

# ============================================================
# 5. Build XR response XML
# ============================================================

$today = Get-Date
$NL = [Environment]::NewLine
$msgCounter = 0
$responseMsgBlocks = [System.Collections.ArrayList]::new()

foreach ($msg in $msgNodes) {
    $msgCounter++

    # Extract Src/Target DlrCode
    $srcDlrCode    = Get-XmlValue $msg "nfu:MsgCreate/nfu:Src/nfu:DlrCode"       $nsMgr ""
    $targetDlrCode = Get-XmlValue $msg "nfu:MsgCreate/nfu:Target/nfu:DlrCode"    $nsMgr ""

    # NFU outgoing: Src = our dealer, Target = manufacturer
    # XR response:  Src = manufacturer, Target = our dealer (swap!)
    $respSrcDlr    = if ($targetDlrCode) { $targetDlrCode } else { "MFR001" }
    $respTargetDlr = if ($srcDlrCode)    { $srcDlrCode }    else { "UNKNOWN" }

    # Extract SrcID (core matching field)
    $srcId = Get-XmlValue $msg ".//nfu:SrcID" $nsMgr ""
    if ([string]::IsNullOrEmpty($srcId)) {
        $srcId = Get-XmlValue $msg ".//SrcID" $nsMgr ""
    }
    if ([string]::IsNullOrEmpty($srcId)) { $srcId = "NFUSRC-UNKNOWN-$msgCounter" }

    # Extract MessageID if present
    $messageId = Get-XmlValue $msg ".//nfu:MessageID" $nsMgr ""
    if ([string]::IsNullOrEmpty($messageId)) {
        $messageId = Get-XmlValue $msg ".//MessageID" $nsMgr ""
    }

    # Extract FundAcctID
    $fundAcctId = Get-XmlValue $msg ".//nfu:FundAcctID" $nsMgr ""
    if ([string]::IsNullOrEmpty($fundAcctId)) {
        $fundAcctId = Get-XmlValue $msg ".//FundAcctID" $nsMgr ""
    }

    $statusIcon = if ($Status -eq "Accept") { "[OK]" } else { "[REJECT]" }
    Write-Host "  $statusIcon [$msgCounter] SrcID=$srcId | DlrCode=$respTargetDlr -> $respSrcDlr" -ForegroundColor White

    # Build Response Msg block
    # CXM.ImportXMLRspn() (L451-504) parses:
    #   <Response> -> SRCID, MESSAGEID, RTNCODE, RSPNSRC, ACCTCONFIRM, DLRCODE, ERRORS
    $msgXml  = "  <Msg>" + $NL
    $msgXml += "    <MsgCreate>" + $NL
    $msgXml += "      <Src>" + $NL
    $msgXml += "        <DlrCode>$respSrcDlr</DlrCode>" + $NL
    $msgXml += "      </Src>" + $NL
    $msgXml += "      <Target>" + $NL
    $msgXml += "        <DlrCode>$respTargetDlr</DlrCode>" + $NL
    $msgXml += "      </Target>" + $NL
    $msgXml += "    </MsgCreate>" + $NL
    $msgXml += "    <MsgType>" + $NL
    $msgXml += "      <Response>" + $NL
    $msgXml += "        <SrcID>$srcId</SrcID>" + $NL

    # Add MessageID if available
    if (-not [string]::IsNullOrEmpty($messageId)) {
        $msgXml += "        <MessageID>$messageId</MessageID>" + $NL
    }

    $msgXml += "        <RtnCode>$RtnCode</RtnCode>" + $NL
    $msgXml += "        <RspnSrc>$RspnSrc</RspnSrc>" + $NL

    # AcctConfirm if FundAcctID present (for NewAcct responses)
    if (-not [string]::IsNullOrEmpty($fundAcctId)) {
        $msgXml += "        <AcctConfirm>" + $NL
        $msgXml += "          <FundAcctID>$fundAcctId</FundAcctID>" + $NL
        $msgXml += "        </AcctConfirm>" + $NL
    }

    $msgXml += "        <DlrCode>$respTargetDlr</DlrCode>" + $NL

    # Errors block if Reject
    # CXM.ImportXMLGetReject() parses: <Errors> -> <ErrorDetails> -> <ErrorCode>
    if ($RtnCode -ne "00" -and $ErrorCodes.Count -gt 0) {
        $msgXml += "        <Errors>" + $NL
        foreach ($ec in ($ErrorCodes | Select-Object -First 4)) {
            $msgXml += "          <ErrorDetails>" + $NL
            $msgXml += "            <ErrorCode>$ec</ErrorCode>" + $NL
            $msgXml += "          </ErrorDetails>" + $NL
        }
        $msgXml += "        </Errors>" + $NL
    }

    $msgXml += "      </Response>" + $NL
    $msgXml += "    </MsgType>" + $NL
    $msgXml += "  </Msg>"

    $responseMsgBlocks.Add($msgXml) | Out-Null
}

# ============================================================
# 6. Assemble full XR response file
# ============================================================

$allMsgs = $responseMsgBlocks -join $NL
$xrXml  = '<?xml version="1.0" encoding="UTF-8"?>' + $NL
$xrXml += '<MessageSet xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns="nfu" xsi:schemaLocation="nfu nfu.xsd" Version="' + $version + '">' + $NL
$xrXml += $allMsgs + $NL
$xrXml += '</MessageSet>'

# ============================================================
# 7. Generate output filename
# ============================================================

# XR naming convention: XR{DealerCode}FSRV.{YYYYMMDD}{SEQ}9.Z01
$firstMsg = $msgNodes[0]
$firstDlr = Get-XmlValue $firstMsg "nfu:MsgCreate/nfu:Src/nfu:DlrCode" $nsMgr ""
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
    $outputFileName = "XR${firstDlr}FSRV.${dateStr}${seqStr}9.Z01"
    $outputFilePath = Join-Path $OutputDir $outputFileName
    $attempt++
} while ((Test-Path $outputFilePath) -and $attempt -lt 17576)

# ============================================================
# 8. Write output file
# ============================================================

$xrXml | Out-File -FilePath $outputFilePath -Encoding UTF8 -NoNewline

# ============================================================
# 9. Summary output
# ============================================================

Write-Host ""
Write-Host "-------------------------------------------------------" -ForegroundColor Green
Write-Host "[OK] XR response file created:" -ForegroundColor Green
Write-Host "     $outputFilePath" -ForegroundColor White
Write-Host ""
Write-Host "     Status    : $Status" -ForegroundColor $statusColor
Write-Host "     Messages  : $($responseMsgBlocks.Count)" -ForegroundColor Gray

$rtnLabel = if ($RtnCode -eq "00") { "Accept" } else { "Reject ($RtnCode)" }
Write-Host "     RtnCode   : $RtnCode ($rtnLabel)" -ForegroundColor Gray

$rspnLabel = if ($RspnSrc -eq "M") { "Manufacturer" } else { "Network" }
Write-Host "     RspnSrc   : $RspnSrc ($rspnLabel)" -ForegroundColor Gray

if ($ErrorCodes.Count -gt 0) {
    Write-Host "     ErrorCodes : $($ErrorCodes -join ', ')" -ForegroundColor Yellow
}

# Expected DB outcome
$expectedOutcome = if ($Status -eq "Accept") { "NFU status -> Confirmed" } else { "NFU status -> Rejected (error codes saved in DB)" }
Write-Host ""
Write-Host "     Expected  : $expectedOutcome" -ForegroundColor Cyan

Write-Host "-------------------------------------------------------" -ForegroundColor Green
Write-Host ""
Write-Host "  Next steps:" -ForegroundColor Cyan
Write-Host "  1. Copy file to FILE_PATH (IN) if not already output there" -ForegroundColor Gray
Write-Host "  2. Wait for VieFUNDIE service poll (~60s)" -ForegroundColor Gray
Write-Host "  3. Check Event Log & DB status" -ForegroundColor Gray
Write-Host ""
