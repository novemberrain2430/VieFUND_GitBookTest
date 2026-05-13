<#
.SYNOPSIS
    Compare-Tables.ps1 - So sanh Tables_new.sql voi Table_Description.md
.DESCRIPTION
    1. Parse Tables_new.sql de lay schema moi
    2. Parse Table_Description.md de lay schema cu + descriptions
    3. Tao file Tables_Diff.md voi cac thay doi (them/bot/sua)
    4. User ghi chu vao Tables_Diff.md, sau do chay Apply-Changes.ps1
.USAGE
    powershell -ExecutionPolicy Bypass -File Compare-Tables.ps1
#>

$ErrorActionPreference = "Stop"
$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$newSqlFile = Join-Path $scriptDir "Tables_new.sql"
$descFile = Join-Path $scriptDir "Table_Description.md"
$diffFile = Join-Path $scriptDir "Tables_Diff.md"

# ============================================================
# 1. Parse SQL file -> hashtable of tables
# ============================================================
function Parse-SqlFile {
    param([string]$Path)
    
    Write-Host "Parsing SQL file: $Path"
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
    Write-Host "  Found $($tables.Count) tables"
    return $tables
}

# ============================================================
# 2. Parse Table_Description.md -> hashtable of tables with descriptions
# ============================================================
function Parse-DescriptionMd {
    param([string]$Path)
    
    Write-Host "Parsing description file: $Path"
    $lines = Get-Content $Path -Encoding UTF8
    $tables = @{}
    $currentTable = $null
    $currentCols = @()
    $currentNotes = @()
    $inTable = $false
    $inNotes = $false
    $headerSkipped = $false

    for ($i = 0; $i -lt $lines.Count; $i++) {
        $line = $lines[$i]
        
        # Detect table header: ### `TableName`
        if ($line -match '^### `(.+?)`\s*$') {
            # Save previous table
            if ($currentTable) {
                $tables[$currentTable] = @{ Columns = $currentCols; Notes = ($currentNotes -join "`n") }
            }
            $currentTable = $Matches[1]
            $currentCols = @()
            $currentNotes = @()
            $inTable = $false
            $inNotes = $false
            $headerSkipped = $false
            continue
        }
        
        if ($currentTable) {
            # Detect notes block
            if ($line -match '^>\s*\*\*Notes\*\*' -or ($inNotes -and $line -match '^>')) {
                $inNotes = $true
                $currentNotes += $line
                continue
            }
            if ($inNotes -and $line -notmatch '^>') {
                $inNotes = $false
            }
            
            # Detect table rows: | `colName` | type | ...
            if ($line -match '^\|\s*`(.+?)`\s*\|') {
                $inTable = $true
                $parts = $line.TrimStart('|').TrimEnd('|') -split '\|'
                if ($parts.Count -ge 5) {
                    $colName = ($parts[0].Trim() -replace '`', '')
                    $desc = $parts[4].Trim()
                    $currentCols += [PSCustomObject]@{ Column = $colName; Description = $desc }
                }
            }
        }
    }
    # Save last table
    if ($currentTable) {
        $tables[$currentTable] = @{ Columns = $currentCols; Notes = ($currentNotes -join "`n") }
    }
    
    Write-Host "  Found $($tables.Count) tables with descriptions"
    return $tables
}

# ============================================================
# 3. Compare and generate diff
# ============================================================
function Generate-Diff {
    param($newSchema, $oldDesc)
    
    $addedTables = @()
    $removedTables = @()
    $modifiedTables = @()
    
    # Find added/modified tables
    foreach ($tblName in ($newSchema.Keys | Sort-Object)) {
        if (-not $oldDesc.ContainsKey($tblName)) {
            $addedTables += $tblName
        } else {
            $oldCols = @{}
            foreach ($c in $oldDesc[$tblName].Columns) { $oldCols[$c.Column] = $c }
            $newCols = $newSchema[$tblName]
            
            $addedCols = @()
            $removedCols = @()
            $changedCols = @()
            
            $newColNames = $newCols | ForEach-Object { $_.Column }
            $oldColNames = $oldDesc[$tblName].Columns | ForEach-Object { $_.Column }
            
            foreach ($nc in $newCols) {
                if ($nc.Column -notin $oldColNames) {
                    $addedCols += $nc
                }
            }
            foreach ($oc in $oldDesc[$tblName].Columns) {
                if ($oc.Column -notin $newColNames) {
                    $removedCols += $oc
                }
            }
            
            if ($addedCols.Count -gt 0 -or $removedCols.Count -gt 0) {
                $modifiedTables += [PSCustomObject]@{
                    Table = $tblName
                    AddedCols = $addedCols
                    RemovedCols = $removedCols
                }
            }
        }
    }
    
    # Find removed tables
    foreach ($tblName in ($oldDesc.Keys | Sort-Object)) {
        if (-not $newSchema.ContainsKey($tblName)) {
            $removedTables += $tblName
        }
    }
    
    return @{
        AddedTables = $addedTables
        RemovedTables = $removedTables
        ModifiedTables = $modifiedTables
    }
}

# ============================================================
# 4. Write diff file
# ============================================================
function Write-DiffFile {
    param($diff, $newSchema, $outputPath)
    
    $sb = [System.Text.StringBuilder]::new()
    
    [void]$sb.AppendLine("# Database Changes Report")
    [void]$sb.AppendLine("")
    [void]$sb.AppendLine("> So sanh ``Tables_new.sql`` voi ``Table_Description.md``")
    [void]$sb.AppendLine("> Hay ghi chu Description cho cac column moi, sau do chay ``Apply-Changes.ps1``")
    [void]$sb.AppendLine("")
    [void]$sb.AppendLine("## Summary")
    [void]$sb.AppendLine("")
    [void]$sb.AppendLine("- **Added tables:** $($diff.AddedTables.Count)")
    [void]$sb.AppendLine("- **Removed tables:** $($diff.RemovedTables.Count)")
    [void]$sb.AppendLine("- **Modified tables:** $($diff.ModifiedTables.Count) (columns added/removed)")
    [void]$sb.AppendLine("")
    [void]$sb.AppendLine("---")
    [void]$sb.AppendLine("")
    
    # Added tables
    if ($diff.AddedTables.Count -gt 0) {
        [void]$sb.AppendLine("## Added Tables")
        [void]$sb.AppendLine("")
        foreach ($tblName in $diff.AddedTables) {
            [void]$sb.AppendLine("### ``$tblName``")
            [void]$sb.AppendLine("")
            [void]$sb.AppendLine("| Column | Type | Nullable | Identity | Description |")
            [void]$sb.AppendLine("|--------|------|----------|----------|-------------|")
            foreach ($col in $newSchema[$tblName]) {
                $line = "| ``" + $col.Column + "`` | " + $col.Type + " | " + $col.Nullable + " | " + $col.Identity + " |  |"
                [void]$sb.AppendLine($line)
            }
            [void]$sb.AppendLine("")
        }
        [void]$sb.AppendLine("---")
        [void]$sb.AppendLine("")
    }
    
    # Removed tables
    if ($diff.RemovedTables.Count -gt 0) {
        [void]$sb.AppendLine("## Removed Tables")
        [void]$sb.AppendLine("")
        foreach ($tblName in $diff.RemovedTables) {
            [void]$sb.AppendLine("- ``$tblName``")
        }
        [void]$sb.AppendLine("")
        [void]$sb.AppendLine("---")
        [void]$sb.AppendLine("")
    }
    
    # Modified tables
    if ($diff.ModifiedTables.Count -gt 0) {
        [void]$sb.AppendLine("## Modified Tables")
        [void]$sb.AppendLine("")
        foreach ($mod in $diff.ModifiedTables) {
            [void]$sb.AppendLine("### ``$($mod.Table)``")
            [void]$sb.AppendLine("")
            if ($mod.AddedCols.Count -gt 0) {
                [void]$sb.AppendLine("#### Added Columns")
                [void]$sb.AppendLine("| Column | Type | Nullable | Identity | Description |")
                [void]$sb.AppendLine("|--------|------|----------|----------|-------------|")
                foreach ($col in $mod.AddedCols) {
                    $line = "| ``" + $col.Column + "`` | " + $col.Type + " | " + $col.Nullable + " | " + $col.Identity + " |  |"
                    [void]$sb.AppendLine($line)
                }
                [void]$sb.AppendLine("")
            }
            if ($mod.RemovedCols.Count -gt 0) {
                [void]$sb.AppendLine("#### Removed Columns")
                [void]$sb.AppendLine("| Column | Type |")
                [void]$sb.AppendLine("|--------|------|")
                foreach ($col in $mod.RemovedCols) {
                    [void]$sb.AppendLine("| ``$($col.Column)`` | (removed) |")
                }
                [void]$sb.AppendLine("")
            }
        }
        [void]$sb.AppendLine("---")
        [void]$sb.AppendLine("")
    }
    
    if ($diff.AddedTables.Count -eq 0 -and $diff.RemovedTables.Count -eq 0 -and $diff.ModifiedTables.Count -eq 0) {
        [void]$sb.AppendLine("## No Changes Detected")
        [void]$sb.AppendLine("")
        [void]$sb.AppendLine("Database schema is identical.")
        [void]$sb.AppendLine("")
    }
    
    $sb.ToString() | Out-File -Encoding UTF8 $outputPath
    Write-Host "Diff written to: $outputPath"
}

# ============================================================
# Main
# ============================================================
if (-not (Test-Path $newSqlFile)) {
    Write-Host "ERROR: File not found: $newSqlFile" -ForegroundColor Red
    Write-Host "Copy Tables_new.sql into Docs_V2\Database\ first." -ForegroundColor Yellow
    exit 1
}
if (-not (Test-Path $descFile)) {
    Write-Host "ERROR: File not found: $descFile" -ForegroundColor Red
    exit 1
}

$newSchema = Parse-SqlFile $newSqlFile
$oldDesc = Parse-DescriptionMd $descFile
$diff = Generate-Diff $newSchema $oldDesc
Write-DiffFile $diff $newSchema $diffFile

Write-Host ""
Write-Host "=== Done ===" -ForegroundColor Green
Write-Host "Added: $($diff.AddedTables.Count) tables"
Write-Host "Removed: $($diff.RemovedTables.Count) tables"
Write-Host "Modified: $($diff.ModifiedTables.Count) tables"
Write-Host ""
Write-Host "Next steps:"
Write-Host "  1. Open Tables_Diff.md and add Description for new columns"
Write-Host "  2. Run Apply-Changes.ps1 to update Tables.sql and Table_Description.md"
