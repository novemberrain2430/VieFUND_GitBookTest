[CmdletBinding()]
param(
    [string]$RepositoryRoot = (Resolve-Path (Join-Path $PSScriptRoot '..\..\..')).Path
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

$catalogRoot = $PSScriptRoot
$topicRoot = Join-Path $catalogRoot 'by-topic'
$sqlPath = Join-Path $RepositoryRoot 'ScriptDB\000_4_CreateSP.sql'

function Remove-CommentsPreservingLines {
    param([Parameter(Mandatory)][string]$Text)

    $withoutBlocks = [regex]::Replace(
        $Text,
        '(?s)/\*.*?\*/',
        { param($match) [regex]::Replace($match.Value, '[^\r\n]', ' ') }
    )
    return [regex]::Replace($withoutBlocks, '(?m)^\s*//.*$', '')
}

function Remove-SqlCommentsPreservingLines {
    param([Parameter(Mandatory)][string]$Text)

    $withoutBlocks = [regex]::Replace(
        $Text,
        '(?s)/\*.*?\*/',
        { param($match) [regex]::Replace($match.Value, '[^\r\n]', ' ') }
    )
    return [regex]::Replace($withoutBlocks, '(?m)--.*$', '')
}

function Normalize-ProcedureName {
    param([Parameter(Mandatory)][string]$Name)

    $value = $Name.Trim()
    if ($value -match '^(?:\[?dbo\]?\.)?\[?([A-Za-z][A-Za-z0-9_]*)\]?$') {
        return $Matches[1]
    }
    return $value
}

function Get-TopicInfo {
    param([Parameter(Mandatory)][string]$Name)

    if ($Name -match '^(?:UBOB|OB|OnBoard)|OnBoard') {
        return [pscustomobject]@{ Label = 'Onboarding'; Slug = 'onboarding' }
    }
    if ($Name -match '^OM') {
        return [pscustomobject]@{ Label = 'Omnibus'; Slug = 'omnibus' }
    }
    if ($Name -match '^(?:UB)?(?:NR4|P18|P19|RL\d|Releve|T3|T4|T5|T5008|T550|Tax|TFSA|YearEnd|CRA|FHSA)') {
        return [pscustomobject]@{ Label = 'Tax & Year-End'; Slug = 'tax-yearend' }
    }
    if ($Name -match '(?:Compliance|FINTRAC|CIRO|MFDA|AML|Suitab|Uniformity|RiskReview)') {
        return [pscustomobject]@{ Label = 'Compliance'; Slug = 'compliance' }
    }
    if ($Name -match '(?:Commission|Comm|Fee|Payroll|Payable)') {
        return [pscustomobject]@{ Label = 'Commission & Fee'; Slug = 'commission-fee' }
    }
    if ($Name -match '(?:FundServ|Fundata|NFU|FFImport|TSFile|FundFile)') {
        return [pscustomobject]@{ Label = 'Fundserv & Import'; Slug = 'fundserv-import' }
    }
    if ($Name -match '(?:Fund|GIC|TermDeposit|ETF|Security|Product)') {
        return [pscustomobject]@{ Label = 'Fund & GIC'; Slug = 'fund-gic' }
    }
    if ($Name -match '(?:Account|Plan|Trust|Cash|RESP|RRSP|RRIF|LIRA|LRSP|FHSA)') {
        return [pscustomobject]@{ Label = 'Account & Plan'; Slug = 'account-plan' }
    }
    if ($Name -match '(?:Client|Customer|KYC|FATCA|Family|Beneficiary|Intermediary)') {
        return [pscustomobject]@{ Label = 'Client & KYC'; Slug = 'client-kyc' }
    }
    if ($Name -match '(?:Order|Trx|Trade|Switch|Redemption|Purchase|Conversion)') {
        return [pscustomobject]@{ Label = 'Trading & Orders'; Slug = 'trading-orders' }
    }
    if ($Name -match '(?:Notify|Notification|Email|SMS|Text|Twilio|Message)') {
        return [pscustomobject]@{ Label = 'Notifications'; Slug = 'notifications' }
    }
    if ($Name -match '(?:Login|Password|PW|Session|SAML|Token|Permission|MemberAccess|Role)') {
        return [pscustomobject]@{ Label = 'Security & Auth'; Slug = 'security-auth' }
    }
    if ($Name -match '(?:PDF|Doc|Form|Signature|Attach|FileDownload)') {
        return [pscustomobject]@{ Label = 'Documents & PDF'; Slug = 'documents-pdf' }
    }
    return [pscustomobject]@{ Label = 'Shared / Other'; Slug = 'shared-other' }
}

function Get-RelativeMarkdownLink {
    param(
        [Parameter(Mandatory)][string]$FromDirectory,
        [Parameter(Mandatory)][string]$TargetPath,
        [int]$Line = 0
    )

    $relative = [IO.Path]::GetRelativePath($FromDirectory, $TargetPath).Replace('\', '/')
    if ($Line -gt 0) {
        return "$relative#L$Line"
    }
    return $relative
}

function Escape-MarkdownCell {
    param([AllowEmptyString()][string]$Value)

    if ($null -eq $Value) { return '' }
    return $Value.Replace('|', '\|').Replace("`r", ' ').Replace("`n", ' ')
}

function New-StringSet {
    return ,([System.Collections.Generic.HashSet[string]]::new([System.StringComparer]::OrdinalIgnoreCase))
}

if (-not (Test-Path -LiteralPath $sqlPath)) {
    throw "Không tìm thấy SQL snapshot: $sqlPath"
}

New-Item -ItemType Directory -Path $topicRoot -Force | Out-Null

# 1) Định nghĩa procedure và quan hệ EXEC trong SQL snapshot.
$sqlText = Get-Content -LiteralPath $sqlPath -Raw
$definitionRegex = [regex]::new(
    '(?im)^[ \t]*CREATE\s+(?:PROC|PROCEDURE)\s+(?:(?:\[?dbo\]?\.)?)\[?([A-Za-z0-9_]+)\]?',
    [System.Text.RegularExpressions.RegexOptions]::Multiline -bor [System.Text.RegularExpressions.RegexOptions]::IgnoreCase
)
$definitionMatches = $definitionRegex.Matches($sqlText)
$definitions = [System.Collections.Generic.List[object]]::new()
$definitionByName = @{}
$line = 1
$cursor = 0

foreach ($match in $definitionMatches) {
    if ($match.Index -gt $cursor) {
        $line += [regex]::Matches($sqlText.Substring($cursor, $match.Index - $cursor), "`n").Count
    }
    $name = $match.Groups[1].Value
    $topic = Get-TopicInfo -Name $name
    $definition = [pscustomobject]@{
        Name       = $name
        Line       = $line
        Start      = $match.Index
        Topic      = $topic.Label
        TopicSlug  = $topic.Slug
        CSharpSites = [System.Collections.Generic.List[object]]::new()
        SqlCallers = New-StringSet
        SqlCallees = New-StringSet
    }
    $definitions.Add($definition)
    $definitionByName[$name] = $definition
    $cursor = $match.Index
}

$sqlEdgeCount = 0
$execRegex = [regex]::new(
    '(?im)\bEXEC(?:UTE)?\s+(?:@[A-Za-z_]\w*\s*=\s*)?(?:(?:\[?dbo\]?\.)?)\[?([A-Za-z][A-Za-z0-9_]*)\]?',
    [System.Text.RegularExpressions.RegexOptions]::Multiline -bor [System.Text.RegularExpressions.RegexOptions]::IgnoreCase
)

for ($index = 0; $index -lt $definitions.Count; $index++) {
    $definition = $definitions[$index]
    $end = if ($index + 1 -lt $definitions.Count) { $definitions[$index + 1].Start } else { $sqlText.Length }
    $body = Remove-SqlCommentsPreservingLines -Text $sqlText.Substring($definition.Start, $end - $definition.Start)
    foreach ($execMatch in $execRegex.Matches($body)) {
        $targetName = Normalize-ProcedureName -Name $execMatch.Groups[1].Value
        if (-not $definitionByName.ContainsKey($targetName)) { continue }
        if ($definition.SqlCallees.Add($targetName)) {
            [void]$definitionByName[$targetName].SqlCallers.Add($definition.Name)
            $sqlEdgeCount++
        }
    }
}

# 2) Call site SetSP trong C#, bỏ comment và loại VFCsvExport/Backup/obj.
$csharpFiles = Get-ChildItem -LiteralPath $RepositoryRoot -Recurse -File -Filter '*.cs' |
    Where-Object {
        $relative = [IO.Path]::GetRelativePath($RepositoryRoot, $_.FullName)
        $relative -notmatch '(?:^|\\)(?:Backup|obj|VFCsvExport)(?:\\|$)'
    }

$rawSetSpCount = 0
$rawLiteralNames = New-StringSet
$rawNormalizedLiteralNames = New-StringSet
$activeSetSpCount = 0
$activeStaticSiteCount = 0
$activeDirectLiteralNames = New-StringSet
$activeStaticNames = New-StringSet
$staticSitesByName = @{}
$dynamicSites = [System.Collections.Generic.List[object]]::new()
$callRegex = [regex]::new('(?m)\.SetSP\s*\((.*?)\)\s*;', [System.Text.RegularExpressions.RegexOptions]::Multiline)

foreach ($file in $csharpFiles) {
    $raw = Get-Content -LiteralPath $file.FullName -Raw
    if ($null -eq $raw) { continue }

    $rawSetSpCount += [regex]::Matches($raw, '\.SetSP\s*\(').Count
    foreach ($literalMatch in [regex]::Matches($raw, '\.SetSP\s*\(\s*@?"([^"]+)"')) {
        [void]$rawLiteralNames.Add($literalMatch.Groups[1].Value)
        [void]$rawNormalizedLiteralNames.Add((Normalize-ProcedureName -Name $literalMatch.Groups[1].Value))
    }

    $clean = Remove-CommentsPreservingLines -Text $raw
    $relativeFile = [IO.Path]::GetRelativePath($RepositoryRoot, $file.FullName)
    foreach ($callMatch in $callRegex.Matches($clean)) {
        $activeSetSpCount++
        $argument = $callMatch.Groups[1].Value.Trim()
        $callLine = 1 + [regex]::Matches($clean.Substring(0, $callMatch.Index), "`n").Count
        $stringMatches = [regex]::Matches($argument, '@?"([^"]+)"')
        if ($stringMatches.Count -eq 0) {
            $dynamicSites.Add([pscustomobject]@{
                File = $relativeFile
                Line = $callLine
                Argument = $argument
            })
            continue
        }

        $activeStaticSiteCount++
        $isDirectLiteral = $argument -match '^\s*@?"[^"]+"\s*$'
        foreach ($stringMatch in $stringMatches) {
            $name = Normalize-ProcedureName -Name $stringMatch.Groups[1].Value
            if ($name -notmatch '^[A-Za-z][A-Za-z0-9_]*$') { continue }
            [void]$activeStaticNames.Add($name)
            if ($isDirectLiteral) { [void]$activeDirectLiteralNames.Add($name) }
            if (-not $staticSitesByName.ContainsKey($name)) {
                $staticSitesByName[$name] = [System.Collections.Generic.List[object]]::new()
            }
            $site = [pscustomobject]@{
                File = $relativeFile
                Line = $callLine
                Argument = $argument
                Kind = if ($isDirectLiteral) { 'literal trực tiếp' } else { 'literal trong biểu thức' }
            }
            $staticSitesByName[$name].Add($site)
            if ($definitionByName.ContainsKey($name)) {
                $definitionByName[$name].CSharpSites.Add($site)
            }
        }
    }
}

$rawMissing = @($rawNormalizedLiteralNames | Where-Object { -not $definitionByName.ContainsKey($_) } | Sort-Object)
$activeMissing = @($activeStaticNames | Where-Object { -not $definitionByName.ContainsKey($_) } | Sort-Object)
$matchedStaticNames = @($activeStaticNames | Where-Object { $definitionByName.ContainsKey($_) })
$sqlWithoutStaticCSharp = @($definitions | Where-Object { $_.CSharpSites.Count -eq 0 })

# 3) Inventory tổng.
$inventoryPath = Join-Path $catalogRoot 'inventory.md'
$inventoryLines = [System.Collections.Generic.List[string]]::new()
$inventoryLines.Add('# Inventory stored procedure')
$inventoryLines.Add('')
$inventoryLines.Add('> File sinh tự động từ SQL snapshot và source C# bằng `generate-catalog.ps1`. Không sửa tay; hãy sửa generator rồi chạy lại.')
$inventoryLines.Add('')
$inventoryLines.Add('## Số liệu')
$inventoryLines.Add('')
$inventoryLines.Add("- SQL procedure definition duy nhất: **$($definitions.Count)**.")
$inventoryLines.Add("- Procedure có tên tĩnh khớp từ C# active: **$($matchedStaticNames.Count)**.")
$inventoryLines.Add("- Procedure chưa thấy tên tĩnh trong C# active: **$($sqlWithoutStaticCSharp.Count)**; không đồng nghĩa là không dùng.")
$inventoryLines.Add("- Quan hệ procedure → procedure nhận diện qua `EXEC/EXECUTE`: **$sqlEdgeCount** cạnh duy nhất.")
$inventoryLines.Add('')
$inventoryLines.Add('## Danh mục')
$inventoryLines.Add('')
$inventoryLines.Add('| Procedure | Chủ đề gợi ý | Definition | C# tĩnh | SQL gọi vào / gọi ra | Caller C# mẫu |')
$inventoryLines.Add('|---|---|---:|---:|---:|---|')

foreach ($definition in ($definitions | Sort-Object Name)) {
    $sqlLink = Get-RelativeMarkdownLink -FromDirectory $catalogRoot -TargetPath $sqlPath -Line $definition.Line
    $topicLink = "by-topic/$($definition.TopicSlug).md"
    $siteCount = $definition.CSharpSites.Count
    $fileCount = @($definition.CSharpSites | Select-Object -ExpandProperty File -Unique).Count
    $csharpUsage = if ($siteCount -gt 0) { "$siteCount / $fileCount file" } else { '—' }
    $callerSample = '—'
    if ($siteCount -gt 0) {
        $sample = $definition.CSharpSites[0]
        $target = Join-Path $RepositoryRoot $sample.File
        $callerLink = Get-RelativeMarkdownLink -FromDirectory $catalogRoot -TargetPath $target -Line $sample.Line
        $callerSample = "[$([IO.Path]::GetFileName($sample.File)):$($sample.Line)]($callerLink)"
    }
    $inventoryLines.Add("| ``$($definition.Name)`` | [$($definition.Topic)]($topicLink) | [L$($definition.Line)]($sqlLink) | $csharpUsage | $($definition.SqlCallers.Count) / $($definition.SqlCallees.Count) | $callerSample |")
}
$inventoryLines | Set-Content -LiteralPath $inventoryPath -Encoding utf8

# 4) Danh mục theo chủ đề gợi ý.
$topicSummary = [System.Collections.Generic.List[string]]::new()
$topicSummary.Add('# Stored procedure theo chủ đề gợi ý')
$topicSummary.Add('')
$topicSummary.Add('> Phân nhóm này là heuristic theo tên procedure để hỗ trợ điều hướng, không phải ownership chính thức. Hãy dùng caller và definition để xác minh nghiệp vụ.')
$topicSummary.Add('')
$topicSummary.Add('| Chủ đề | SQL definitions | Có C# tĩnh | Có SQL caller |')
$topicSummary.Add('|---|---:|---:|---:|')

foreach ($group in ($definitions | Group-Object TopicSlug | Sort-Object Name)) {
    $items = @($group.Group | Sort-Object Name)
    $label = $items[0].Topic
    $slug = $items[0].TopicSlug
    $withCSharp = @($items | Where-Object { $_.CSharpSites.Count -gt 0 }).Count
    $withSqlCaller = @($items | Where-Object { $_.SqlCallers.Count -gt 0 }).Count
    $topicSummary.Add("| [$label]($slug.md) | $($items.Count) | $withCSharp | $withSqlCaller |")

    $topicPath = Join-Path $topicRoot "$slug.md"
    $topicLines = [System.Collections.Generic.List[string]]::new()
    $topicLines.Add("# SP Catalog — $label")
    $topicLines.Add('')
    $topicLines.Add('> Phân nhóm gợi ý theo tên procedure. Các cột caller mới là bằng chứng truy vết; `—` không có nghĩa procedure không được dùng.')
    $topicLines.Add('')
    $topicLines.Add("**Tổng**: $($items.Count) definition; $withCSharp có tên tĩnh từ C#; $withSqlCaller được procedure khác gọi qua `EXEC/EXECUTE`.")
    $topicLines.Add('')
    $topicLines.Add('| Procedure | Definition | C# tĩnh | SQL gọi vào / gọi ra | Caller C# mẫu |')
    $topicLines.Add('|---|---:|---:|---:|---|')
    foreach ($definition in $items) {
        $sqlLink = Get-RelativeMarkdownLink -FromDirectory $topicRoot -TargetPath $sqlPath -Line $definition.Line
        $siteCount = $definition.CSharpSites.Count
        $fileCount = @($definition.CSharpSites | Select-Object -ExpandProperty File -Unique).Count
        $csharpUsage = if ($siteCount -gt 0) { "$siteCount / $fileCount file" } else { '—' }
        $callerSample = '—'
        if ($siteCount -gt 0) {
            $sample = $definition.CSharpSites[0]
            $target = Join-Path $RepositoryRoot $sample.File
            $callerLink = Get-RelativeMarkdownLink -FromDirectory $topicRoot -TargetPath $target -Line $sample.Line
            $callerSample = "[$([IO.Path]::GetFileName($sample.File)):$($sample.Line)]($callerLink)"
        }
        $topicLines.Add("| ``$($definition.Name)`` | [L$($definition.Line)]($sqlLink) | $csharpUsage | $($definition.SqlCallers.Count) / $($definition.SqlCallees.Count) | $callerSample |")
    }
    $topicLines | Set-Content -LiteralPath $topicPath -Encoding utf8
}
$topicSummary | Set-Content -LiteralPath (Join-Path $topicRoot 'README.md') -Encoding utf8

# 5) Tên tĩnh không khớp snapshot và call site tên động.
$gapPath = Join-Path $catalogRoot 'source-gaps.md'
$gapLines = [System.Collections.Generic.List[string]]::new()
$gapLines.Add('# Chênh lệch giữa C# và SQL snapshot')
$gapLines.Add('')
$gapLines.Add('> Đây là danh sách cần xác minh, không phải kết luận production DB thiếu procedure. Source, snapshot, deployment riêng hoặc tên sinh động có thể khác nhau.')
$gapLines.Add('')
$gapLines.Add("Có **$($activeMissing.Count)** tên procedure tĩnh trong C# active không có definition khớp sau khi chuẩn hóa `[dbo].[Name]` về `Name`.")
$gapLines.Add('')
$gapLines.Add('| Tên procedure | Loại biểu thức | Call sites | Caller mẫu | Biểu thức mẫu |')
$gapLines.Add('|---|---|---:|---|---|')
foreach ($name in $activeMissing) {
    $sites = @($staticSitesByName[$name])
    $kinds = ($sites | Select-Object -ExpandProperty Kind -Unique) -join ', '
    $sample = $sites[0]
    $target = Join-Path $RepositoryRoot $sample.File
    $callerLink = Get-RelativeMarkdownLink -FromDirectory $catalogRoot -TargetPath $target -Line $sample.Line
    $argument = Escape-MarkdownCell -Value $sample.Argument
    $gapLines.Add("| ``$name`` | $kinds | $($sites.Count) | [$([IO.Path]::GetFileName($sample.File)):$($sample.Line)]($callerLink) | ``$argument`` |")
}
$gapLines.Add('')
$gapLines.Add('## Đối chiếu với số liệu source thô trước đây')
$gapLines.Add('')
$gapLines.Add("- Source thô có **$rawSetSpCount** `.SetSP(...)` và **$($rawLiteralNames.Count)** literal trực tiếp duy nhất.")
$gapLines.Add("- Sau khi chuẩn hóa schema/bracket, có **$($rawMissing.Count)** literal source thô không khớp tên SQL; số này giữ cách tính của Database Access và vẫn gồm code comment.")
$gapLines.Add("- Sau khi bỏ comment và lấy cả literal trong biểu thức tĩnh, có **$($activeStaticNames.Count)** candidate duy nhất; **$($activeMissing.Count)** không khớp snapshot.")
$gapLines | Set-Content -LiteralPath $gapPath -Encoding utf8

$dynamicPath = Join-Path $catalogRoot 'dynamic-calls.md'
$dynamicLines = [System.Collections.Generic.List[string]]::new()
$dynamicLines.Add('# Call site `SetSP` dùng tên động')
$dynamicLines.Add('')
$dynamicLines.Add('> Các call site này không chứa string literal ngay trong đối số `SetSP`; cần lần ngược caller/parameter/mảng cấu hình để biết procedure runtime.')
$dynamicLines.Add('')
$dynamicLines.Add("Tổng: **$($dynamicSites.Count)** call site trong source C# active.")
$dynamicLines.Add('')
$dynamicLines.Add('| Caller | Đối số `SetSP` |')
$dynamicLines.Add('|---|---|')
foreach ($site in ($dynamicSites | Sort-Object File, Line)) {
    $target = Join-Path $RepositoryRoot $site.File
    $callerLink = Get-RelativeMarkdownLink -FromDirectory $catalogRoot -TargetPath $target -Line $site.Line
    $argument = Escape-MarkdownCell -Value $site.Argument
    $dynamicLines.Add("| [$($site.File):$($site.Line)]($callerLink) | ``$argument`` |")
}
$dynamicLines | Set-Content -LiteralPath $dynamicPath -Encoding utf8

[pscustomobject]@{
    SqlDefinitions             = $definitions.Count
    SqlExecEdges               = $sqlEdgeCount
    CSharpFilesScanned         = $csharpFiles.Count
    RawSetSpCalls              = $rawSetSpCount
    RawDirectLiteralNames      = $rawLiteralNames.Count
    ActiveSetSpCalls           = $activeSetSpCount
    ActiveStaticCallSites      = $activeStaticSiteCount
    ActiveDirectLiteralNames   = $activeDirectLiteralNames.Count
    ActiveStaticCandidateNames = $activeStaticNames.Count
    MatchedStaticNames         = $matchedStaticNames.Count
    MissingStaticNames         = $activeMissing.Count
    DynamicCallSites           = $dynamicSites.Count
    SqlWithoutStaticCSharpName = $sqlWithoutStaticCSharp.Count
} | Format-List
