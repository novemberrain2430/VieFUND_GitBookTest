[CmdletBinding()]
param()

$ErrorActionPreference = 'Stop'
$repoRoot = [IO.Path]::GetFullPath((Join-Path $PSScriptRoot '..\..'))
$outputDir = Join-Path $PSScriptRoot 'screen-catalog'
$traceFile = Join-Path $PSScriptRoot 'traceability-matrix.md'
$projectNames = @('WebApp', 'WebClient')
$excludedDirectories = @('bin', 'obj', 'packages', '.vs')

function Get-RelativePath([string] $path) {
    return [IO.Path]::GetRelativePath($repoRoot, [IO.Path]::GetFullPath($path)).Replace('/', '\')
}

function Get-MarkdownLink([string] $fromDirectory, [string] $targetPath) {
    $relative = [IO.Path]::GetRelativePath($fromDirectory, [IO.Path]::GetFullPath($targetPath)).Replace('\', '/')
    return $relative.Replace(' ', '%20').Replace('#', '%23')
}

function Escape-Cell([AllowNull()][string] $value) {
    if ([string]::IsNullOrWhiteSpace($value)) { return '—' }
    return $value.Replace('|', '\|').Replace("`r", '').Replace("`n", '<br>')
}

function Get-Attribute([string] $directive, [string] $name) {
    $match = [regex]::Match($directive, '(?i)\b' + [regex]::Escape($name) + '\s*=\s*["''](?<value>[^"'']*)["'']')
    if ($match.Success) { return $match.Groups['value'].Value }
    return ''
}

function Get-ProjectItems([string] $projectName, [string] $itemType, [string] $suffix) {
    $projectFile = Join-Path $repoRoot "$projectName\$projectName.csproj"
    $raw = [IO.File]::ReadAllText($projectFile)
    $matches = [regex]::Matches($raw, '(?i)<' + $itemType + '\s+Include="(?<path>[^"]+' + [regex]::Escape($suffix) + ')"')
    $set = [Collections.Generic.HashSet[string]]::new([StringComparer]::OrdinalIgnoreCase)
    foreach ($match in $matches) {
        [void]$set.Add($match.Groups['path'].Value.Replace('/', '\'))
    }
    return ,$set
}

function Remove-CSharpComments([string] $text) {
    $withoutBlocks = [regex]::Replace($text, '(?s)/\*.*?\*/', '')
    return [regex]::Replace($withoutBlocks, '(?m)//.*$', '')
}

function Get-StaticProcedureClues([string] $codePath) {
    if (-not $codePath -or -not (Test-Path -LiteralPath $codePath)) { return @() }
    $active = Remove-CSharpComments ([IO.File]::ReadAllText($codePath))
    $procedures = [Collections.Generic.HashSet[string]]::new([StringComparer]::OrdinalIgnoreCase)
    foreach ($call in [regex]::Matches($active, '(?s)\.SetSP\s*\((?<arg>.{0,800}?)\)')) {
        foreach ($literal in [regex]::Matches($call.Groups['arg'].Value, '"(?<value>[A-Za-z][A-Za-z0-9_\.\[\]]{2,})"')) {
            $name = $literal.Groups['value'].Value -replace '^\[?dbo\]?\.', '' -replace '[\[\]]', ''
            if ($name -match '^[A-Za-z][A-Za-z0-9_]{2,}$') { [void]$procedures.Add($name) }
        }
    }
    return @($procedures | Sort-Object)
}

function Get-ScreenKind([string] $baseName, [bool] $hasPageDirective, [string] $raw) {
    $logicalName = $baseName -replace '_FR$', ''
    if (-not $hasPageDirective) {
        if ($logicalName -match '^Panel') { return 'Panel fragment' }
        if ($logicalName -match '(^Popup.*(?:Body|Header|Footer))|(_js$)|(^Js)|(^JavaScript)') { return 'Popup/body/JS fragment' }
        return 'Other fragment'
    }
    if ($logicalName -match '^Popup') { return 'Popup endpoint' }
    if ($logicalName -match '(Prn$)|Print') { return 'Print endpoint' }
    if ($logicalName -match 'Pdf') { return 'PDF endpoint' }
    if ($logicalName -match '(List$)|Lookup|SearchList' -or $raw -match '(?i)ListHeader\.aspx') { return 'Lookup endpoint' }
    return 'Page endpoint'
}

function Get-TraceAnchor([string] $traceId) {
    $prefix = ($traceId -split '-')[0]
    $anchors = @{
        AP = 'account-plan'; AUTH = 'auth-session'; CL = 'client-kyc'
        CM = 'commission-fee'; CO = 'compliance'; XF = 'cross-cutting'
        FG = 'fund-gic'; FS = 'fundserv'; OB = 'onboarding'
        TX = 'tax-year-end'; TR = 'trading-orders'
    }
    if (-not $anchors.ContainsKey($prefix)) { throw "Unknown trace prefix: $traceId" }
    return $anchors[$prefix]
}

function Get-Area([string] $relativePath) {
    $name = [IO.Path]::GetFileNameWithoutExtension($relativePath)
    if ($relativePath -notmatch '\\Main\\' -or $name -match '^(Default|Logout|CreateNewPW|PageExpired|WE_SSO)') { return 'Auth / shell' }
    if ($name -match 'OnBoard') { return 'Onboarding' }
    if ($name -match 'Compliance|Comp[A-Z]|Suitab|MFDA') { return 'Compliance' }
    if ($name -match 'YearEnd|T4|T5|T3|T5008|T619|Tax|CRA|RRSPReceipt') { return 'Tax & Year-End' }
    if ($name -match 'Commission|Comm|Fee|Payroll|Payable') { return 'Commission & Fee' }
    if ($name -match 'Trade|Trx|Order') { return 'Trading & Orders' }
    if ($name -match 'Client|KYC|FATCA|FINTRAC|Customer') { return 'Client & KYC' }
    if ($name -match 'Account|Plan|RRIF|RESP|Benef|Spousal') { return 'Account & Plan' }
    if ($name -match 'Fund|GIC|Cannex|NAV|Segregated') { return 'Fund & GIC' }
    if ($name -match 'Pdf|Print|Prn|Report|Chart|Export') { return 'Report / Export' }
    if ($name -match 'Setup|Setting|Member|Dealer|System|Holiday|Bank|Role|Security|Admin') { return 'Administration' }
    return 'Other'
}

function Resolve-IncludeTarget([string] $projectRoot, [string] $sourceDirectory, [string] $includeType, [string] $includeValue) {
    try {
        if ($includeType -ieq 'virtual') {
            return [IO.Path]::GetFullPath((Join-Path $projectRoot $includeValue.TrimStart('/', '\')))
        }
        return [IO.Path]::GetFullPath((Join-Path $sourceDirectory $includeValue))
    }
    catch { return '' }
}

if (-not (Test-Path -LiteralPath $outputDir)) {
    New-Item -ItemType Directory -Path $outputDir | Out-Null
}

$contentItems = @{}
$compileItems = @{}
$missingContentItems = [Collections.Generic.List[object]]::new()
foreach ($projectName in $projectNames) {
    $contentItems[$projectName] = Get-ProjectItems $projectName 'Content' '.aspx'
    $compileItems[$projectName] = Get-ProjectItems $projectName 'Compile' '.aspx.cs'
    foreach ($item in $contentItems[$projectName]) {
        $expectedPath = Join-Path (Join-Path $repoRoot $projectName) $item
        if (-not (Test-Path -LiteralPath $expectedPath)) {
            $missingContentItems.Add([pscustomobject]@{ Project = $projectName; ProjectRelative = $item; ExpectedPath = $expectedPath })
        }
    }
}

$codeFiles = Get-ChildItem ($projectNames | ForEach-Object { Join-Path $repoRoot $_ }) -Recurse -File -Filter '*.aspx.cs' |
    Where-Object { $parts = $_.FullName.Split([IO.Path]::DirectorySeparatorChar); -not ($parts | Where-Object { $_ -in $excludedDirectories }) }

$classToCode = @{}
foreach ($codeFile in $codeFiles) {
    $raw = [IO.File]::ReadAllText($codeFile.FullName)
    $namespaceMatch = [regex]::Match($raw, '(?m)^\s*namespace\s+(?<name>[A-Za-z_][A-Za-z0-9_.]*)')
    $classMatch = [regex]::Match($raw, '(?m)^\s*(?:public|internal|protected|private)?\s*(?:partial\s+)?class\s+(?<name>[A-Za-z_][A-Za-z0-9_]*)\s*[:{]')
    if ($namespaceMatch.Success -and $classMatch.Success) {
        $fullName = $namespaceMatch.Groups['name'].Value + '.' + $classMatch.Groups['name'].Value
        if (-not $classToCode.ContainsKey($fullName)) { $classToCode[$fullName] = $codeFile.FullName }
    }
}

$traceByCode = @{}
if (Test-Path -LiteralPath $traceFile) {
    foreach ($line in [IO.File]::ReadLines($traceFile)) {
        $match = [regex]::Match($line, '^\|\s*`(?<id>[^`]+)`.*?`(?<path>(?:WebApp|WebClient)\\[^`]+\.aspx\.cs)`')
        if ($match.Success) {
            $key = $match.Groups['path'].Value
            if (-not $traceByCode.ContainsKey($key)) { $traceByCode[$key] = [Collections.Generic.List[string]]::new() }
            if (-not $traceByCode[$key].Contains($match.Groups['id'].Value)) { $traceByCode[$key].Add($match.Groups['id'].Value) }
        }
    }
}

$pageFiles = Get-ChildItem ($projectNames | ForEach-Object { Join-Path $repoRoot $_ }) -Recurse -File -Filter '*.aspx' |
    Where-Object { $parts = $_.FullName.Split([IO.Path]::DirectorySeparatorChar); -not ($parts | Where-Object { $_ -in $excludedDirectories }) } |
    Sort-Object FullName

$rows = [Collections.Generic.List[object]]::new()
$includedBy = @{}
$procedureCache = @{}

foreach ($pageFile in $pageFiles) {
    $projectName = $pageFile.FullName.Substring($repoRoot.Length + 1).Split([IO.Path]::DirectorySeparatorChar)[0]
    $projectRoot = Join-Path $repoRoot $projectName
    $projectRelative = $pageFile.FullName.Substring($projectRoot.Length + 1).Replace('/', '\')
    $relativePath = Get-RelativePath $pageFile.FullName
    $raw = [IO.File]::ReadAllText($pageFile.FullName)
    $directiveMatch = [regex]::Match($raw, '(?is)<%@\s*Page\b(?<attrs>.*?)%>')
    $directive = if ($directiveMatch.Success) { $directiveMatch.Groups['attrs'].Value } else { '' }
    $codeFileAttribute = Get-Attribute $directive 'CodeFile'
    if (-not $codeFileAttribute) { $codeFileAttribute = Get-Attribute $directive 'CodeBehind' }
    $inherits = Get-Attribute $directive 'Inherits'
    $culture = Get-Attribute $directive 'culture'
    $resolvedCode = ''
    $resolution = ''
    $declaredCodeExists = $false

    if ($codeFileAttribute) {
        $candidate = [IO.Path]::GetFullPath((Join-Path $pageFile.DirectoryName $codeFileAttribute))
        $declaredCodeExists = Test-Path -LiteralPath $candidate
        if ($declaredCodeExists) { $resolvedCode = $candidate; $resolution = 'directive' }
    }
    if (-not $resolvedCode -and $inherits -and $classToCode.ContainsKey($inherits)) {
        $resolvedCode = $classToCode[$inherits]
        $resolution = 'Inherits'
    }
    if (-not $resolvedCode) {
        $candidate = $pageFile.FullName + '.cs'
        if (Test-Path -LiteralPath $candidate) { $resolvedCode = $candidate; $resolution = 'companion' }
    }
    if (-not $resolvedCode -and $pageFile.BaseName -match '_FR$') {
        $candidate = Join-Path $pageFile.DirectoryName (($pageFile.BaseName -replace '_FR$', '') + '.aspx.cs')
        if (Test-Path -LiteralPath $candidate) { $resolvedCode = $candidate; $resolution = 'EN companion' }
    }

    foreach ($include in [regex]::Matches($raw, '(?i)<!--\s*#include\s+(?<type>file|virtual)\s*=\s*["''](?<value>[^"'']+)["'']\s*-->')) {
        $target = Resolve-IncludeTarget $projectRoot $pageFile.DirectoryName $include.Groups['type'].Value $include.Groups['value'].Value
        if ($target) {
            if (-not $includedBy.ContainsKey($target)) { $includedBy[$target] = [Collections.Generic.List[string]]::new() }
            $includedBy[$target].Add($relativePath)
        }
    }

    $codeRelative = if ($resolvedCode) { Get-RelativePath $resolvedCode } else { '' }
    $codeProjectRelative = if ($resolvedCode -and $resolvedCode.StartsWith($projectRoot, [StringComparison]::OrdinalIgnoreCase)) { $resolvedCode.Substring($projectRoot.Length + 1).Replace('/', '\') } else { '' }
    if ($resolvedCode -and -not $procedureCache.ContainsKey($resolvedCode)) { $procedureCache[$resolvedCode] = @(Get-StaticProcedureClues $resolvedCode) }
    $traces = if ($codeRelative -and $traceByCode.ContainsKey($codeRelative)) { @($traceByCode[$codeRelative]) } else { @() }

    $rows.Add([pscustomobject]@{
        Project = $projectName
        ProjectRelative = $projectRelative
        RelativePath = $relativePath
        FullPath = $pageFile.FullName
        Name = $pageFile.Name
        BaseName = $pageFile.BaseName
        Area = Get-Area $relativePath
        Kind = Get-ScreenKind $pageFile.BaseName $directiveMatch.Success $raw
        HasPageDirective = $directiveMatch.Success
        InProject = $contentItems[$projectName].Contains($projectRelative)
        Inherits = $inherits
        Culture = $culture
        IsFrench = ($pageFile.BaseName -match '_FR$' -or $culture -match '(?i)^fr')
        ValidateRequestFalse = ($directive -match '(?i)validateRequest\s*=\s*["'']false["'']')
        DeclaredCode = $codeFileAttribute
        DeclaredCodeExists = $declaredCodeExists
        ResolvedCode = $resolvedCode
        CodeRelative = $codeRelative
        CodeResolution = $resolution
        CodeInProject = [bool]($codeProjectRelative -and $compileItems[$projectName].Contains($codeProjectRelative))
        Procedures = if ($resolvedCode) { @($procedureCache[$resolvedCode]) } else { @() }
        TraceIds = $traces
    })
}

foreach ($row in $rows) {
    $row | Add-Member -NotePropertyName IncludedBy -NotePropertyValue $(if ($includedBy.ContainsKey($row.FullPath)) { @($includedBy[$row.FullPath] | Sort-Object -Unique) } else { @() })
}

$total = $rows.Count
$endpoints = @($rows | Where-Object HasPageDirective)
$fragments = @($rows | Where-Object { -not $_.HasPageDirective })
$projectItemsCount = @($rows | Where-Object InProject).Count
$resolvedCount = @($rows | Where-Object ResolvedCode).Count
$uniqueResolvedCode = @($rows.ResolvedCode | Where-Object { $_ } | Sort-Object -Unique).Count
$uniqueEndpointClasses = @($endpoints.Inherits | Where-Object { $_ } | Sort-Object -Unique).Count
$frenchCount = @($rows | Where-Object IsFrench).Count
$validateFalseCount = @($endpoints | Where-Object ValidateRequestFalse).Count
$traceScreenCount = @($rows | Where-Object { $_.TraceIds.Count -gt 0 }).Count
$directSpScreenCount = @($rows | Where-Object { $_.Procedures.Count -gt 0 }).Count
$diskOnly = @($rows | Where-Object { -not $_.InProject })
$declaredMissing = @($rows | Where-Object { $_.DeclaredCode -and -not $_.DeclaredCodeExists })
$unresolvedEndpointClasses = @($endpoints | Where-Object { $_.Inherits -and -not $classToCode.ContainsKey($_.Inherits) })

$inventory = [Text.StringBuilder]::new()
[void]$inventory.AppendLine('# Screen Catalog — Inventory Web Forms')
[void]$inventory.AppendLine()
[void]$inventory.AppendLine(('> Sinh tự động từ source ngày 2026-09-05. Tổng cộng **{0}** file `.aspx`: **{1}** endpoint có Page directive và **{2}** fragment. `VFCsvExport`, `bin`, `obj`, `packages`, `.vs` bị loại khỏi phạm vi.' -f $total, $endpoints.Count, $fragments.Count))
[void]$inventory.AppendLine()
[void]$inventory.AppendLine('## Cách đọc')
[void]$inventory.AppendLine()
[void]$inventory.AppendLine('- `Project = ✅` nghĩa là markup có `<Content Include>` trong `.csproj`; dấu `—` thường là artifact legacy/dealer copy trên disk, chưa chứng minh được deploy.')
[void]$inventory.AppendLine('- `Code-behind` được resolve theo `CodeFile/CodeBehind`, `Inherits`, companion cùng tên hoặc companion EN cho `_FR`.')
[void]$inventory.AppendLine('- `SP tĩnh` chỉ là literal tìm thấy trong `SetSP(...)` của code-behind đã resolve. Dấu `—` **không** có nghĩa màn hình không đọc DB: nó có thể gọi BLL, fragment cha hoặc tên SP động.')
[void]$inventory.AppendLine('- `Included by` là reverse map của server-side include; route/runtime/menu/quyền vẫn cần xác minh riêng.')
[void]$inventory.AppendLine()
[void]$inventory.AppendLine('| UI artifact | Miền gợi ý | Loại | Project | Code-behind / class | Included by | SP tĩnh trực tiếp | Trace |')
[void]$inventory.AppendLine('|---|---|---|:---:|---|---|---|---|')
foreach ($row in $rows | Sort-Object Project, ProjectRelative) {
    $uiLink = Get-MarkdownLink $outputDir $row.FullPath
    $ui = "[$($row.ProjectRelative.Replace('\', '/'))]($uiLink)"
    $projectMark = if ($row.InProject) { '✅' } else { '—' }
    $code = '—'
    if ($row.ResolvedCode) {
        $codeLink = Get-MarkdownLink $outputDir $row.ResolvedCode
        $classSuffix = if ($row.Inherits) { '<br>`{0}`' -f $row.Inherits } else { '' }
        $compileSuffix = if ($row.CodeInProject) { '' } else { '<br>⚠ code ngoài Compile item' }
        $code = "[$([IO.Path]::GetFileName($row.ResolvedCode))]($codeLink)$classSuffix$compileSuffix"
    }
    elseif ($row.Inherits) { $code = 'unresolved<br>`{0}`' -f $row.Inherits }
    $parents = if ($row.IncludedBy.Count) { ($row.IncludedBy | Select-Object -First 3 | ForEach-Object { ' `{0}`' -f $_.Replace('\', '/') }) -join '<br>' } else { '—' }
    if ($row.IncludedBy.Count -gt 3) { $parents += "<br>+$($row.IncludedBy.Count - 3)" }
    $procedures = if ($row.Procedures.Count) { ($row.Procedures | Select-Object -First 5 | ForEach-Object { '`{0}`' -f $_ }) -join '<br>' } else { '—' }
    if ($row.Procedures.Count -gt 5) { $procedures += "<br>+$($row.Procedures.Count - 5)" }
    $traces = if ($row.TraceIds.Count) { ($row.TraceIds | ForEach-Object { "[$_](../traceability-matrix.md#$(Get-TraceAnchor $_))" }) -join ', ' } else { '—' }
    [void]$inventory.AppendLine("| $ui | $(Escape-Cell $row.Area) | $(Escape-Cell $row.Kind) | $projectMark | $code | $parents | $procedures | $traces |")
}
[IO.File]::WriteAllText((Join-Path $outputDir 'inventory.md'), $inventory.ToString(), [Text.UTF8Encoding]::new($false))

$gaps = [Text.StringBuilder]::new()
[void]$gaps.AppendLine('# Screen Catalog — Khoảng trống source và tín hiệu audit')
[void]$gaps.AppendLine()
[void]$gaps.AppendLine('> Đây là kết quả kiểm kê tĩnh, không phải kết luận về artifact đang chạy ở production.')
[void]$gaps.AppendLine()
[void]$gaps.AppendLine('## 1. Code-behind được khai báo nhưng file đích không tồn tại')
[void]$gaps.AppendLine()
[void]$gaps.AppendLine('| Markup | Khai báo | Inherits | Có resolve bằng class/companion khác? |')
[void]$gaps.AppendLine('|---|---|---|:---:|')
foreach ($row in $declaredMissing | Sort-Object RelativePath) {
    $link = Get-MarkdownLink $outputDir $row.FullPath
    $resolved = if ($row.ResolvedCode) { 'Có' } else { 'Không' }
    [void]$gaps.AppendLine(('| [{0}]({1}) | `{2}` | `{3}` | {4} |' -f $row.RelativePath.Replace('\', '/'), $link, $row.DeclaredCode, (Escape-Cell $row.Inherits), $resolved))
}
if (-not $declaredMissing.Count) { [void]$gaps.AppendLine('| — | — | — | — |') }

[void]$gaps.AppendLine()
[void]$gaps.AppendLine('## 2. Endpoint có Inherits nhưng không resolve được class source')
[void]$gaps.AppendLine()
[void]$gaps.AppendLine('| Markup | Inherits | Project item |')
[void]$gaps.AppendLine('|---|---|:---:|')
foreach ($row in $unresolvedEndpointClasses | Sort-Object RelativePath) {
    $link = Get-MarkdownLink $outputDir $row.FullPath
    $mark = if ($row.InProject) { '✅' } else { '—' }
    [void]$gaps.AppendLine(('| [{0}]({1}) | `{2}` | {3} |' -f $row.RelativePath.Replace('\', '/'), $link, $row.Inherits, $mark))
}
if (-not $unresolvedEndpointClasses.Count) { [void]$gaps.AppendLine('| — | — | — |') }

[void]$gaps.AppendLine()
[void]$gaps.AppendLine('## 3. Content item của project nhưng file ASPX không tồn tại')
[void]$gaps.AppendLine()
[void]$gaps.AppendLine(('Có **{0}** item, toàn bộ thuộc [`WebClient.csproj`](../../../WebClient/WebClient.csproj#L154). Đây là source/project gap có thể làm publish hoặc build phụ thuộc cấu hình thất bại; cần xác minh project file hiện hành trước khi xóa item hay phục hồi markup.' -f $missingContentItems.Count))
[void]$gaps.AppendLine()
foreach ($item in $missingContentItems | Sort-Object Project, ProjectRelative) {
    [void]$gaps.AppendLine(('- `{0}/{1}`' -f $item.Project, $item.ProjectRelative.Replace('\', '/')))
}

[void]$gaps.AppendLine()
[void]$gaps.AppendLine('## 4. ASPX có trên disk nhưng không nằm trong Content item của project')
[void]$gaps.AppendLine()
[void]$gaps.AppendLine("Có **$($diskOnly.Count)** file. Đây là tín hiệu legacy/dealer copy hoặc artifact bị bỏ khỏi project; không tự động kết luận là dead code vì Web Site/runtime packaging có thể khác source project.")
[void]$gaps.AppendLine()
[void]$gaps.AppendLine('<details>')
[void]$gaps.AppendLine('<summary>Danh sách đầy đủ</summary>')
[void]$gaps.AppendLine()
foreach ($row in $diskOnly | Sort-Object RelativePath) {
    $link = Get-MarkdownLink $outputDir $row.FullPath
    [void]$gaps.AppendLine("- [$($row.RelativePath.Replace('\', '/'))]($link)")
}
[void]$gaps.AppendLine()
[void]$gaps.AppendLine('</details>')

[void]$gaps.AppendLine()
[void]$gaps.AppendLine('## 5. Findings đã xác minh liên quan trực tiếp tới UI inventory')
[void]$gaps.AppendLine()
[void]$gaps.AppendLine('1. [`CommPayrollHistoryPrn_FR.aspx`](../../../WebApp/Main/CommPayrollHistoryPrn_FR.aspx#L1) khai báo `Inherits="WebApp.Main.CommrollHistoryPrn"`; source chỉ có class [`WebApp.Main.CommPayrollHistoryPrn`](../../../WebApp/Main/CommPayrollHistoryPrn.aspx.cs#L22). [`MenuFunctions.js`](../../../WebApp/Js/MenuFunctions.js#L975) vẫn route tiếng Pháp tới page này. Đây là lỗi mapping class đã được ghi trong UI Patterns.')
[void]$gaps.AppendLine(('2. Có **{0}/{1}** endpoint đặt `validateRequest="false"`; đây là bề mặt cần review theo input/output context, không nên bật lại hàng loạt.' -f $validateFalseCount, $endpoints.Count))
[void]$gaps.AppendLine('3. File không có direct SP literal không chứng minh không truy cập dữ liệu. Phần lớn screen gọi qua `UBClasses`; catalog cố ý không suy diễn tên SP từ toàn file hoặc từ tên method.')
[void]$gaps.AppendLine()
[void]$gaps.AppendLine('## 6. Cách xử lý từng loại khoảng trống')
[void]$gaps.AppendLine()
[void]$gaps.AppendLine('- Với route nghi active: kiểm tra menu/JS, project publish profile, setting theo DSID và request log trước khi sửa/xóa.')
[void]$gaps.AppendLine('- Với class mismatch: xác minh route bằng compile/publish hoặc smoke test đúng language/dealer.')
[void]$gaps.AppendLine('- Với fragment: lần ngược `Included by`; nếu không có parent tĩnh, tìm dynamic include/copy trong build/deploy.')
[void]$gaps.AppendLine('- Với dữ liệu: đi từ trace ID hoặc code-behind → BLL → `SetSP` → SP Catalog; không nhảy thẳng từ tên màn hình sang bảng.')
[IO.File]::WriteAllText((Join-Path $outputDir 'source-gaps.md'), $gaps.ToString(), [Text.UTF8Encoding]::new($false))

$areaRows = $rows | Group-Object Area | Sort-Object Name
$kindRows = $rows | Group-Object Kind | Sort-Object Name
$main = [Text.StringBuilder]::new()
[void]$main.AppendLine('# Screen Catalog — UI → Code và dữ liệu')
[void]$main.AppendLine()
[void]$main.AppendLine(('> Catalog được tái tạo từ **{0}** file ASPX trong `WebApp` và `WebClient`, đối chiếu `.csproj`, Page directive, server-side include, code-behind và Traceability Matrix ngày 2026-09-05. `VFCsvExport` không nằm trong phạm vi.' -f $total))
[void]$main.AppendLine()
[void]$main.AppendLine('## 1. Kết luận nhanh')
[void]$main.AppendLine()
[void]$main.AppendLine(('- **{0} endpoint** có `<%@ Page>`; **{1} fragment** không phải URL độc lập.' -f $endpoints.Count, $fragments.Count))
[void]$main.AppendLine(('- **{0}/{1}** markup có `Content Include` trong project; **{2}** file chỉ có trên disk và phải coi là legacy/deployment gap cho tới khi có bằng chứng runtime.' -f $projectItemsCount, $total, $diskOnly.Count))
[void]$main.AppendLine(('- Resolve được code-behind cho **{0}** artifact, quy về **{1}** file code-behind; endpoint có **{2}** giá trị `Inherits` duy nhất.' -f $resolvedCount, $uniqueResolvedCode, $uniqueEndpointClasses))
[void]$main.AppendLine(('- **{0}** artifact là `_FR` hoặc có culture FR; nhiều cặp EN/FR chia sẻ cùng class/code-behind.' -f $frenchCount))
[void]$main.AppendLine("- **$directSpScreenCount** artifact có ít nhất một literal SP gọi trực tiếp trong code-behind; **$traceScreenCount** artifact nối được với trace source-audited. Các màn hình khác không được tự động gán bảng/SP nếu code đi qua BLL hoặc tên động.")
[void]$main.AppendLine()
[void]$main.AppendLine('Điểm vào tra cứu:')
[void]$main.AppendLine()
[void]$main.AppendLine('- [Inventory đầy đủ 1.358 ASPX](screen-catalog/inventory.md) — path, loại, project membership, code-behind, parent include, direct SP clue và trace ID.')
[void]$main.AppendLine('- [Khoảng trống source và tín hiệu audit](screen-catalog/source-gaps.md) — target code thiếu, class không resolve và file ngoài project.')
[void]$main.AppendLine('- [Traceability Matrix](traceability-matrix.md) — 50 action quan trọng đã đi sâu UI/API → BLL → SP → DB.')
[void]$main.AppendLine('- [UI Patterns](../viefund-framework/ui-patterns.md) — lifecycle, include, popup/panel, localization và menu architecture.')
[void]$main.AppendLine()
[void]$main.AppendLine('## 2. Phạm vi và đơn vị đếm')
[void]$main.AppendLine()
[void]$main.AppendLine('“ASPX artifact” không đồng nghĩa “màn hình người dùng”. Một business screen có thể gồm page EN/FR, panel, body, JS callback và print view; ngược lại nhiều dealer login page dùng chung một class. Catalog giữ nguyên từng artifact để không mất đường dẫn source, đồng thời phân loại endpoint/fragment để tránh đếm sai.')
[void]$main.AppendLine()
[void]$main.AppendLine('| Loại | Số file | Ý nghĩa |')
[void]$main.AppendLine('|---|---:|---|')
foreach ($group in $kindRows) {
    $meaning = if ($group.Name -like '*endpoint') { 'Có Page directive; có thể là request endpoint, nhưng availability còn phụ thuộc deploy/menu/quyền.' } else { 'Không có Page directive; thường được include vào page/class cha.' }
    [void]$main.AppendLine("| $($group.Name) | $($group.Count) | $meaning |")
}
[void]$main.AppendLine(('| **Tổng** | **{0}** | `WebApp` + `WebClient`, đã loại thư mục build và `VFCsvExport`. |' -f $total))
[void]$main.AppendLine()
[void]$main.AppendLine('## 3. Phân bố theo miền gợi ý')
[void]$main.AppendLine()
[void]$main.AppendLine('Miền dưới đây được gán theo tên file để **tìm kiếm**, không phải kết luận ownership nghiệp vụ. Các page dùng chung như `Client.aspx`, PDF, notification có thể chạm nhiều miền.')
[void]$main.AppendLine()
[void]$main.AppendLine('| Miền gợi ý | ASPX artifact | Endpoint | Fragment |')
[void]$main.AppendLine('|---|---:|---:|---:|')
foreach ($group in $areaRows) {
    $areaEndpoints = @($group.Group | Where-Object HasPageDirective).Count
    [void]$main.AppendLine("| $($group.Name) | $($group.Count) | $areaEndpoints | $($group.Count - $areaEndpoints) |")
}
[void]$main.AppendLine()
[void]$main.AppendLine('## 4. Bản đồ màn hình nghiệp vụ trọng tâm')
[void]$main.AppendLine()
[void]$main.AppendLine('Bảng này chỉ chọn screen/boundary có giá trị định hướng cao. Link `Trace` là bằng chứng chi tiết tới method, SP và DB object; screen không có trace không bị coi là “không dùng dữ liệu”.')
[void]$main.AppendLine()
[void]$main.AppendLine('| Miền | Screen / component | Người dùng làm gì | Data mapping đã xác minh |')
[void]$main.AppendLine('|---|---|---|---|')
$critical = @(
    @('Auth & Session','WebApp/Default.aspx','Đăng nhập nhân viên/advisor, quên mật khẩu, 2FA','AUTH-01, AUTH-03, AUTH-04'),
    @('Auth & Session','WebClient/Default.aspx','Đăng nhập client portal','AUTH-02'),
    @('Auth & Session','WebApp/Main/Logout.aspx','Lưu setting và đóng session','AUTH-05'),
    @('Client & KYC','WebApp/Main/Client.aspx','Tìm client, mở context client/plan; queue NFU','CL-01, AP-03, FS-01'),
    @('Client & KYC','WebApp/Main/PopupClientAdd.aspx','Đọc, thêm và cập nhật hồ sơ client','CL-02, CL-03, CL-04'),
    @('Account & Plan','WebApp/Main/PopupPlanAdd.aspx','Thêm/cập nhật plan','AP-01, AP-02'),
    @('Account & Plan','WebApp/Main/PanelPlanBenAdd.aspx','Đọc/sửa beneficiary trong dialog','AP-04'),
    @('Account & Plan','WebApp/Main/PanelRRIFPayment.aspx','Cấu hình RRIF payment','AP-05'),
    @('Trading & Orders','WebApp/Main/PopupTradeAdd.aspx','Buy/Sell/Switch và pending order','TR-01, TR-02, TR-03, TR-04'),
    @('Trading & Orders','WebApp/Main/TrxView.aspx','Tìm/paging/sort giao dịch','TR-05'),
    @('Trading & Orders','WebApp/Main/PopupTrxManualAdd.aspx','Thêm/sửa manual transaction','TR-06'),
    @('Commission & Fee','WebApp/Main/CommissionView.aspx','Revenue search, move payable, payroll/history','CM-01, CM-02, CM-03, CM-04'),
    @('Commission & Fee','WebApp/Main/PanelFeeProcess.aspx','Khởi tạo và kết thúc fee processing','CM-05'),
    @('Compliance','WebApp/Main/ComplianceTrx.aspx','Review/approve trade suitability','CO-01, CO-02'),
    @('Compliance','WebApp/Main/ComplianceAccount.aspx','Approve account opening','CO-03'),
    @('Compliance','WebApp/Main/ComplianceAccountUpdate.aspx','Approve KYC update','CO-04'),
    @('Compliance','WebApp/Main/ComplianceIncompleteKYC.aspx','Theo dõi client/plan thiếu KYC','CO-05'),
    @('Fund & GIC','WebApp/Main/PanelFundPicker.aspx','Tìm fund và favorite','FG-01, FG-02'),
    @('Fund & GIC','WebApp/Main/PanelCannexOrder.aspx','Tìm rate sản phẩm GIC','FG-03'),
    @('Tax & Year-End','WebApp/Main/YearEnd.aspx','Điều phối year-end và submission','TX-05'),
    @('Tax & Year-End','WebApp/Main/YearEnd_T4RSP.aspx','Pending/process T4RSP','TX-01, TX-02'),
    @('Tax & Year-End','WebApp/Main/PanelT619.aspx','Lưu transmitter và tạo export request','TX-03, TX-04'),
    @('Onboarding','WebApp/Main/OnBoardView.aspx','Review/reject onboarding item','OB-03, OB-04'),
    @('Cross-cutting','WebApp/Main/PdfView.aspx','Route và trả PDF','XF-01'),
    @('Cross-cutting','WebApp/Main/PopupNotificationAdd.aspx','Tạo notification/email outbox','XF-02')
)
foreach ($item in $critical) {
    $sourcePath = Join-Path $repoRoot $item[1]
    if (-not (Test-Path -LiteralPath $sourcePath)) { throw "Critical screen not found: $($item[1])" }
    $screenLink = Get-MarkdownLink $PSScriptRoot $sourcePath
    $traceLinks = ($item[3] -split ',\s*' | ForEach-Object { "[$_](traceability-matrix.md#$(Get-TraceAnchor $_))" }) -join ', '
    [void]$main.AppendLine("| $($item[0]) | [$($item[1])]($screenLink) | $($item[2]) | $traceLinks |")
}
[void]$main.AppendLine()
[void]$main.AppendLine('## 5. Cách tìm một chức năng từ UI tới DB')
[void]$main.AppendLine()
[void]$main.AppendLine('1. Tìm filename/text/control trong inventory; xác định đó là endpoint hay fragment.')
[void]$main.AppendLine('2. Nếu là fragment, dùng `Included by` để tìm page cha. Nếu là `_FR`, kiểm tra class/code-behind EN được chia sẻ.')
[void]$main.AppendLine('3. Mở code-behind đã resolve; tìm event handler, `On...`, `Update...`, `Get...`, `Save...` và lời gọi `UBClasses`.')
[void]$main.AppendLine('4. Nếu inventory có trace ID, dùng Traceability Matrix. Nếu chưa có, theo method scope tới `CDatabase.SetSP`, rồi tra procedure trong SP Catalog.')
[void]$main.AppendLine('5. Đọc SP và procedure con để xác nhận table/status/selection/audit; luôn giữ DBID, DSID, user/session và option trong trace.')
[void]$main.AppendLine('6. Cuối cùng mới xác minh menu/setting/quyền/publish/runtime log để kết luận user nào thực sự nhìn thấy route.')
[void]$main.AppendLine()
[void]$main.AppendLine('## 6. Giới hạn của catalog')
[void]$main.AppendLine()
[void]$main.AppendLine('- Không chứng minh screen được deploy hoặc xuất hiện trên menu production.')
[void]$main.AppendLine('- Không coi prefix `Panel`/`Popup` là type system; Page directive và include graph có ưu tiên cao hơn tên file.')
[void]$main.AppendLine('- Direct SP clue chỉ lấy literal trong code-behind; không gán SP theo tên tương tự và không gom biến ngoài method scope.')
[void]$main.AppendLine('- UserControl `.ascx`, ASMX, Windows Service và client-side route ngoài ASPX không nằm trong inventory này; chúng đã được mô tả ở UI Patterns, Onboarding, Fundserv và Traceability Matrix.')
[void]$main.AppendLine('- Phân nhóm miền là heuristic tìm kiếm. Ownership/chức năng chính xác phải quay lại code và module guide.')
[void]$main.AppendLine()
[void]$main.AppendLine('## 7. Findings cần theo dõi')
[void]$main.AppendLine()
[void]$main.AppendLine("- **$($declaredMissing.Count)** markup khai báo code file không tồn tại tại path đã ghi; **$($unresolvedEndpointClasses.Count)** endpoint có `Inherits` không khớp class source. Xem [chi tiết](screen-catalog/source-gaps.md).")
[void]$main.AppendLine(('- **{0}** Content item của [`WebClient.csproj`](../../WebClient/WebClient.csproj#L154) trỏ tới ASPX không còn trên disk; cần xác minh project/publish configuration.' -f $missingContentItems.Count))
[void]$main.AppendLine('- [`CommPayrollHistoryPrn_FR.aspx`](../../WebApp/Main/CommPayrollHistoryPrn_FR.aspx#L1) có `Inherits` sai class; source class đúng nằm ở [`CommPayrollHistoryPrn.aspx.cs`](../../WebApp/Main/CommPayrollHistoryPrn.aspx.cs#L22), và [`MenuFunctions.js`](../../WebApp/Js/MenuFunctions.js#L975) vẫn route FR tới page lỗi. Đây là bug đã xác minh, không phải suy đoán từ naming.')
[void]$main.AppendLine("- **$validateFalseCount/$($endpoints.Count)** endpoint tắt request validation; cần review theo field/context khi sửa màn hình.")
[void]$main.AppendLine("- **$($diskOnly.Count)** file ASPX không nằm trong project Content item; cần phân biệt artifact legacy với file được publish trước khi sửa/xóa.")
[void]$main.AppendLine()
[void]$main.AppendLine('## 8. Tái tạo')
[void]$main.AppendLine()
[void]$main.AppendLine('Chạy từ repository root:')
[void]$main.AppendLine()
[void]$main.AppendLine('```powershell')
[void]$main.AppendLine('pwsh -File Docs_V2/reference/generate-screen-catalog.ps1')
[void]$main.AppendLine('```')
[void]$main.AppendLine()
[void]$main.AppendLine('Generator dừng nếu một critical screen bị thiếu. Inventory và source gaps được ghi lại hoàn toàn từ source hiện tại.')
[void]$main.AppendLine()
[void]$main.AppendLine('## 9. Tài liệu liên quan')
[void]$main.AppendLine()
[void]$main.AppendLine('- [Reference index](README.md)')
[void]$main.AppendLine('- [SP Catalog](sp-catalog/README.md)')
[void]$main.AppendLine('- [Data Dictionary](data-dictionary.md)')
[void]$main.AppendLine('- [Traceability Matrix](traceability-matrix.md)')
[void]$main.AppendLine('- [UI Patterns](../viefund-framework/ui-patterns.md)')
[IO.File]::WriteAllText((Join-Path $PSScriptRoot 'screen-catalog.md'), $main.ToString(), [Text.UTF8Encoding]::new($false))

Write-Output "Screen Catalog generated:"
Write-Output "  ASPX artifacts      : $total"
Write-Output "  Page endpoints      : $($endpoints.Count)"
Write-Output "  Fragments           : $($fragments.Count)"
Write-Output "  Project Content     : $projectItemsCount"
Write-Output "  Resolved codebehind : $resolvedCount ($uniqueResolvedCode unique files)"
Write-Output "  Direct SP clues     : $directSpScreenCount artifacts"
Write-Output "  Trace-linked        : $traceScreenCount artifacts"
Write-Output "  Declared code gaps  : $($declaredMissing.Count)"
Write-Output "  Unresolved classes  : $($unresolvedEndpointClasses.Count)"
Write-Output "  Missing project ASPX: $($missingContentItems.Count)"
Write-Output "  Disk-only ASPX      : $($diskOnly.Count)"
