param(
    [Parameter(Position = 0)]
    [string]$TexFile,

    [Parameter(ValueFromRemainingArguments = $true)]
    [string[]]$ExtraArgs
)

$ErrorActionPreference = "Stop"

if ($null -ne $ExtraArgs -and $ExtraArgs.Count -gt 0) {
    throw "一次只能编译一个 TeX 文件。"
}

$scriptDir = $PSScriptRoot
$templateDir = (Resolve-Path (Join-Path $scriptDir "..")).Path
$templatePrefix = $templateDir.TrimEnd(
    [char[]]@([System.IO.Path]::DirectorySeparatorChar, [System.IO.Path]::AltDirectorySeparatorChar)
) + [System.IO.Path]::DirectorySeparatorChar

$usingDefaultTexFile = [string]::IsNullOrWhiteSpace($TexFile)
if ($usingDefaultTexFile) {
    $TexFile = "main.tex"
    $texCandidates = @(Join-Path $templateDir $TexFile)
}
else {
    $texCandidates = @($TexFile)
    if (-not [System.IO.Path]::IsPathRooted($TexFile)) {
        $texCandidates += Join-Path $templateDir $TexFile
    }
}

$resolvedTexFile = $null
foreach ($candidate in $texCandidates) {
    if (Test-Path -LiteralPath $candidate -PathType Leaf) {
        $resolvedTexFile = (Resolve-Path -LiteralPath $candidate).Path
        break
    }
}

if ($null -eq $resolvedTexFile) {
    throw "找不到 TeX 文件：$TexFile"
}

if (-not $resolvedTexFile.StartsWith($templatePrefix, [System.StringComparison]::OrdinalIgnoreCase)) {
    throw "TeX 文件必须位于模板目录内：$templateDir"
}

if ([System.IO.Path]::GetExtension($resolvedTexFile) -ine ".tex") {
    throw "目标文件必须是 .tex 文件：$TexFile"
}

$dockerTexFile = $resolvedTexFile.Substring($templatePrefix.Length).Replace("\", "/")

docker run --rm `
  -v "${templateDir}:/workdir" `
  -w /workdir `
  texlive/texlive:latest `
  latexmk $dockerTexFile

if ($LASTEXITCODE -ne 0) {
    exit $LASTEXITCODE
}
