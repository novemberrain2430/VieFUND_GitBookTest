<#
.SYNOPSIS
    Apply-Changes.ps1 - Cap nhat Tables.sql va Table_Description.md tu Tables_Diff.md
.DESCRIPTION
    1. Doc Tables_Diff.md de lay annotations cua user cho columns moi
    2. Doc Table_Description.md de lay descriptions + notes cu
    3. Parse Tables_new.sql de lay schema moi
    4. Tao Table_Description.md moi: merge schema moi + descriptions cu + annotations moi
    5. Copy Tables_new.sql -> Tables.sql
.USAGE
    powershell -ExecutionPolicy Bypass -File Apply-Changes.ps1
#>

$ErrorActionPreference = "Stop"
$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$newSqlFile = Join-Path $scriptDir "Tables_new.sql"
$oldSqlFile = Join-Path $scriptDir "Tables.sql"
$descFile = Join-Path $scriptDir "Table_Description.md"
$diffFile = Join-Path $scriptDir "Tables_Diff.md"
$backupDir = Join-Path $scriptDir "_backups"

# ============================================================
# 1. Parse SQL file
# ============================================================
function Parse-SqlFile {
    param([string]$Path)
    $lines = Get-Content $Path -Encoding Unicode
    $tables = @{}
    $currentTable = $null
    $inCreate = $false
    foreach ($line in $lines) {
        $trimmed = $line.Trim()
        if ($trimmed -match 'CREATE TABLE \[dbo\]\.\[(.+?)\]\(') {
            $currentTable = $Matches[1]
            $tables[$currentTable] = @()
            $inCreate = $true
            continue
        }
        if ($inCreate -and ($trimmed -match '^\) ON \[PRIMARY\]' -or $trimmed -match '^CONSTRAINT')) {
            $inCreate = $false
            continue
        }
        if ($inCreate -and $trimmed -match '^\[(\w+)\]\s+\[(\w+)\]') {
            $colName = $Matches[1]
            $fullType = ""
            if ($trimmed -match '\[(\w+)\]\s+(\[.+?\](?:\(.+?\))?)') {
                $fullType = $Matches[2] -replace '\[|\]', ''
            }
            $nullable = "NULL"
            if ($trimmed -match 'NOT NULL') { $nullable = "NOT NULL" }
            $identity = ""
            if ($trimmed -match 'IDENTITY') { $identity = "Y" }
            $tables[$currentTable] += [PSCustomObject]@{
                Column = $colName; Type = $fullType; Nullable = $nullable; Identity = $identity
            }
        }
    }
    return $tables
}

# ============================================================
# 2. Parse Table_Description.md -> descriptions + notes
# ============================================================
function Parse-DescriptionMd {
    param([string]$Path)
    $lines = Get-Content $Path -Encoding UTF8
    $tables = @{}
    $header = @()
    $currentTable = $null
    $currentCols = @{}
    $currentNotes = @()
    $inNotes = $false
    $headerDone = $false

    for ($i = 0; $i -lt $lines.Count; $i++) {
        $line = $lines[$i]
        
        # Collect header (everything before first ### `Table`)
        if (-not $headerDone) {
            if ($line -match '^### `.+?`\s*$') {
                $headerDone = $true
            } else {
                $header += $line
                continue
            }
        }
        
        if ($line -match '^### `(.+?)`\s*$') {
            if ($currentTable) {
                $tables[$currentTable] = @{ Columns = $currentCols; Notes = $currentNotes }
            }
            $currentTable = $Matches[1]
            $currentCols = @{}
            $currentNotes = @()
            $inNotes = $false
            continue
        }
        
        if ($currentTable) {
            if ($line -match '^>\s*\*\*Notes\*\*' -or ($inNotes -and $line -match '^>')) {
                $inNotes = $true
                $currentNotes += $line
                continue
            }
            if ($inNotes -and $line -notmatch '^>') {
                $inNotes = $false
            }
            if ($line -match '^\|\s*`(.+?)`\s*\|') {
                $parts = $line.TrimStart('|').TrimEnd('|') -split '\|'
                if ($parts.Count -ge 5) {
                    $colName = ($parts[0].Trim() -replace '`', '')
                    $desc = $parts[4].Trim()
                    $currentCols[$colName] = $desc
                }
            }
        }
    }
    if ($currentTable) {
        $tables[$currentTable] = @{ Columns = $currentCols; Notes = $currentNotes }
    }
    
    # Remove trailing empty lines from header while keeping structure
    while ($header.Count -gt 0 -and $header[-1].Trim() -eq '') { $header = $header[0..($header.Count-2)] }
    
    return @{ Tables = $tables; Header = $header }
}

# ============================================================
# 3. Parse Tables_Diff.md -> new annotations from user
# ============================================================
function Parse-DiffAnnotations {
    param([string]$Path)
    
    $lines = Get-Content $Path -Encoding UTF8
    $annotations = @{} # table -> column -> description
    $currentTable = $null
    
    for ($i = 0; $i -lt $lines.Count; $i++) {
        $line = $lines[$i]
        
        if ($line -match '^### `(.+?)`\s*$') {
            $currentTable = $Matches[1]
            if (-not $annotations.ContainsKey($currentTable)) {
                $annotations[$currentTable] = @{}
            }
            continue
        }
        
        if ($currentTable -and $line -match '^\|\s*`(.+?)`\s*\|') {
            $parts = $line.TrimStart('|').TrimEnd('|') -split '\|'
            if ($parts.Count -ge 5) {
                $colName = ($parts[0].Trim() -replace '`', '')
                $desc = $parts[4].Trim()
                if ($desc -ne '') {
                    $annotations[$currentTable][$colName] = $desc
                }
            }
        }
    }
    return $annotations
}

# ============================================================
# 4. Table group classification (same as generator)
# ============================================================
function Get-TableGroup {
    param([string]$tableName)
    if ($tableName -match '^AAA') { return "Development/Testing", "DEV" }
    if ($tableName -match '^Ag_') { return "Agent/External System Integration", "AGENT" }
    if ($tableName -match '^AGRA_') { return "AGRA Transfer Management", "AGRA" }
    if ($tableName -match '^VF_') { return "VieFUND Application", "VF" }
    if ($tableName -match '^UB_Client') { return "Client/Investor Management", "CLIENT" }
    if ($tableName -match '^UB_Plan') { return "Investment Plan/Account Management", "PLAN" }
    if ($tableName -match '^UB_Fund') { return "Fund Definition & Transactions", "FUND" }
    if ($tableName -match '^UB_Member') { return "Member/Advisor Management", "MEMBER" }
    if ($tableName -match '^UB_Rep') { return "Representative/Advisor", "REP" }
    if ($tableName -match '^UB_Dealer') { return "Dealership Management", "DEALER" }
    if ($tableName -match '^UB_Order') { return "Order Processing (FundServ)", "ORDER" }
    if ($tableName -match '^UB_Price') { return "Fund Price Data", "PRICE" }
    if ($tableName -match '^UB_Report') { return "Report Generation", "REPORT" }
    if ($tableName -match '^UB_MFDA') { return "MFDA Compliance", "MFDA" }
    if ($tableName -match '^UB_RESP') { return "RESP (Registered Education Savings Plan)", "RESP" }
    if ($tableName -match '^UB_RRIF') { return "RRIF (Registered Retirement Income Fund)", "RRIF" }
    if ($tableName -match '^UB_RRSP') { return "RRSP (Registered Retirement Savings Plan)", "RRSP" }
    if ($tableName -match '^UB_TFSA') { return "TFSA (Tax-Free Savings Account)", "TFSA" }
    if ($tableName -match '^UB_T[345]') { return "Tax Slip Processing", "TAX" }
    if ($tableName -match '^UB_T4') { return "Tax Slip Processing (T4)", "TAX" }
    if ($tableName -match '^UB_T619') { return "Tax Filing (T619)", "TAX" }
    if ($tableName -match '^UB_RL') { return "Quebec Tax Slip (Releve)", "TAX_QC" }
    if ($tableName -match '^UB_P1[89]') { return "CRS/FATCA Reporting", "CRS" }
    if ($tableName -match '^UB_NR4') { return "NR4 Non-Resident Tax", "TAX" }
    if ($tableName -match '^UB_GIC') { return "GIC (Guaranteed Investment Certificate)", "GIC" }
    if ($tableName -match '^UB_GIA') { return "GIA (Guaranteed Interest Account)", "GIA" }
    if ($tableName -match '^UB_KYP') { return "KYP (Know Your Product) Compliance", "KYP" }
    if ($tableName -match '^UB_MQ') { return "Message Queue (IBM MQ / FundServ Real-Time)", "MQ" }
    if ($tableName -match '^UB_NFU') { return "NFU (Network Fund Update) via FundServ", "NFU" }
    if ($tableName -match '^UB_FS') { return "FundServ Configuration", "FS" }
    if ($tableName -match '^UB_TSFile') { return "TS File Processing (FundServ)", "TS" }
    if ($tableName -match '^UB_TrxConf') { return "Transaction Confirmation", "CONF" }
    if ($tableName -match '^UB_Trx') { return "Transaction Processing", "TRX" }
    if ($tableName -match '^UB_Trust') { return "Trust Account Management", "TRUST" }
    if ($tableName -match '^UB_Loan') { return "Loan Management", "LOAN" }
    if ($tableName -match '^UB_Insurance') { return "Insurance Products", "INS" }
    if ($tableName -match '^UB_Stock') { return "Stock/ETF Management", "STOCK" }
    if ($tableName -match '^UB_Note') { return "Notes/Comments", "NOTE" }
    if ($tableName -match '^UB_Notification') { return "Notification System", "NOTIF" }
    if ($tableName -match '^UB_Uniformity') { return "Uniformity Review", "UNIFORM" }
    if ($tableName -match '^UB_LAP') { return "LAP (Leveraged Asset Program)", "LAP" }
    if ($tableName -match '^UB_MER') { return "MER (Management Expense Ratio) Reporting", "MER" }
    if ($tableName -match '^UB_Sys') { return "System Configuration & Sequences", "SYS" }
    if ($tableName -match '^UB_Schedule') { return "Scheduled Processing", "SCHED" }
    if ($tableName -match '^UB_Redemption') { return "Redemption Schedule Processing", "REDEEM" }
    if ($tableName -match '^UB_Service') { return "Service Task Management", "SERVICE" }
    if ($tableName -match '^UB_Def') { return "Definition/Lookup Tables", "DEF" }
    if ($tableName -match '^UB_View') { return "View Settings", "VIEW" }
    if ($tableName -match '^UB_Web') { return "Web Client Portal", "WEB" }
    if ($tableName -match '^UB_Seg') { return "Segregated Fund", "SEG" }
    if ($tableName -match '^UB_Releve') { return "Quebec Releve Tax Slip", "TAX_QC" }
    if ($tableName -match '^UB_Person') { return "Person/Individual Data", "PERSON" }
    if ($tableName -match '^UB_Phone') { return "Phone/Contact Data", "PHONE" }
    if ($tableName -match '^UB_Address') { return "Address Data", "ADDR" }
    if ($tableName -match '^UB_Identification') { return "Identification Documents", "ID" }
    if ($tableName -match '^UB_Intermediary') { return "Intermediary Management", "INTER" }
    if ($tableName -match '^UB_UCI') { return "UCI (Universal Client Identifier)", "UCI" }
    if ($tableName -match '^UB_OB') { return "Onboarding", "OB" }
    if ($tableName -match '^UB_Logos') { return "Logo Management", "LOGO" }
    if ($tableName -match '^UB_Help') { return "Help System", "HELP" }
    if ($tableName -match '^UB_Settings') { return "Application Settings", "SET" }
    if ($tableName -match '^UB_Province') { return "Province/Region Lookup", "PROV" }
    if ($tableName -match '^UB_MGMT') { return "Management Company", "MGMT" }
    if ($tableName -match '^UB_Fundata') { return "Fundata Integration (ETF prices)", "FUNDATA" }
    if ($tableName -match '^UB_Conversion') { return "Fund Conversion", "CONV" }
    return "VieFUND Core", "UB"
}

# ============================================================
# 5. Generate updated Table_Description.md
# ============================================================
function Generate-UpdatedDescription {
    param($newSchema, $oldDescData, $diffAnnotations, $outputPath)
    
    $oldTables = $oldDescData.Tables
    $header = $oldDescData.Header
    
    # Group tables
    $groups = @{}
    foreach ($tblName in $newSchema.Keys) {
        $groupDesc, $groupKey = Get-TableGroup $tblName
        if (-not $groups.ContainsKey($groupKey)) {
            $groups[$groupKey] = @{ Description = $groupDesc; Tables = @() }
        }
        $groups[$groupKey].Tables += $tblName
    }
    
    $sb = [System.Text.StringBuilder]::new()
    
    # Write header
    foreach ($line in $header) {
        [void]$sb.AppendLine($line)
    }
    [void]$sb.AppendLine("")
    
    # TOC
    [void]$sb.AppendLine("## Table of Contents")
    [void]$sb.AppendLine("")
    $sortedKeys = $groups.Keys | Sort-Object
    $tocIndex = 1
    foreach ($key in $sortedKeys) {
        $g = $groups[$key]
        $anchor = $g.Description.ToLower() -replace '[^a-z0-9]', '-' -replace '-+', '-'
        $count = $g.Tables.Count
        [void]$sb.AppendLine("${tocIndex}. [$($g.Description) ($count tables)](#$anchor)")
        $tocIndex++
    }
    [void]$sb.AppendLine("")
    [void]$sb.AppendLine("---")
    [void]$sb.AppendLine("")
    
    # Render each group
    foreach ($key in $sortedKeys) {
        $g = $groups[$key]
        [void]$sb.AppendLine("## $($g.Description)")
        [void]$sb.AppendLine("")
        
        foreach ($tblName in ($g.Tables | Sort-Object)) {
            [void]$sb.AppendLine("### ``$tblName``")
            [void]$sb.AppendLine("")
            [void]$sb.AppendLine("| Column | Type | Nullable | Identity | Description |")
            [void]$sb.AppendLine("|--------|------|----------|----------|-------------|")
            
            foreach ($col in $newSchema[$tblName]) {
                # Priority: 1) diff annotation, 2) old description, 3) empty
                $desc = ""
                if ($diffAnnotations.ContainsKey($tblName) -and $diffAnnotations[$tblName].ContainsKey($col.Column)) {
                    $desc = $diffAnnotations[$tblName][$col.Column]
                }
                elseif ($oldTables.ContainsKey($tblName) -and $oldTables[$tblName].Columns.ContainsKey($col.Column)) {
                    $desc = $oldTables[$tblName].Columns[$col.Column]
                }
                
                $line = "| ``" + $col.Column + "`` | " + $col.Type + " | " + $col.Nullable + " | " + $col.Identity + " | " + $desc + " |"
                [void]$sb.AppendLine($line)
            }
            [void]$sb.AppendLine("")
            
            # Preserve existing notes
            if ($oldTables.ContainsKey($tblName) -and $oldTables[$tblName].Notes.Count -gt 0) {
                foreach ($noteLine in $oldTables[$tblName].Notes) {
                    [void]$sb.AppendLine($noteLine)
                }
                [void]$sb.AppendLine("")
            }
        }
        
        [void]$sb.AppendLine("---")
        [void]$sb.AppendLine("")
    }
    
    $sb.ToString() | Out-File -Encoding UTF8 $outputPath
}

# ============================================================
# Main
# ============================================================
if (-not (Test-Path $newSqlFile)) {
    Write-Host "ERROR: File not found: $newSqlFile" -ForegroundColor Red
    Write-Host "Run Compare-Tables.ps1 first." -ForegroundColor Yellow
    exit 1
}
if (-not (Test-Path $diffFile)) {
    Write-Host "ERROR: File not found: $diffFile" -ForegroundColor Red
    Write-Host "Run Compare-Tables.ps1 first, then annotate Tables_Diff.md." -ForegroundColor Yellow
    exit 1
}

# Create backup
if (-not (Test-Path $backupDir)) { New-Item -ItemType Directory -Path $backupDir | Out-Null }
$timestamp = Get-Date -Format "yyyyMMdd_HHmmss"
if (Test-Path $oldSqlFile) {
    Copy-Item $oldSqlFile (Join-Path $backupDir "Tables_$timestamp.sql")
    Write-Host "Backed up Tables.sql"
}
if (Test-Path $descFile) {
    Copy-Item $descFile (Join-Path $backupDir "Table_Description_$timestamp.md")
    Write-Host "Backed up Table_Description.md"
}

Write-Host ""
Write-Host "Parsing files..."
$newSchema = Parse-SqlFile $newSqlFile
$oldDescData = Parse-DescriptionMd $descFile
$diffAnnotations = Parse-DiffAnnotations $diffFile

Write-Host "Generating updated Table_Description.md..."
Generate-UpdatedDescription $newSchema $oldDescData $diffAnnotations $descFile

Write-Host "Replacing Tables.sql with Tables_new.sql..."
Copy-Item $newSqlFile $oldSqlFile -Force

# Clean up
$cleanDiff = Join-Path $backupDir "Tables_Diff_$timestamp.md"
Move-Item $diffFile $cleanDiff -Force
Write-Host "Moved Tables_Diff.md to _backups/"

Remove-Item $newSqlFile -Force
Write-Host "Removed Tables_new.sql"

Write-Host ""
Write-Host "=== Done ===" -ForegroundColor Green
Write-Host "- Tables.sql: updated"
Write-Host "- Table_Description.md: updated (descriptions preserved + new annotations merged)"
Write-Host "- Backups saved in: $backupDir"
