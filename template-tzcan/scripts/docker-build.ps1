$ErrorActionPreference = "Stop"

$scriptDir = $PSScriptRoot
$templateDir = (Resolve-Path (Join-Path $scriptDir "..")).Path

if (-not (Test-Path -LiteralPath (Join-Path $templateDir "main.tex") -PathType Leaf)) {
    throw "Cannot find main.tex under template root: $templateDir"
}

docker run --rm `
  -v "${templateDir}:/workdir" `
  -w /workdir `
  ghcr.io/tellcts/texlive:latest `
  latexmk main.tex

if ($LASTEXITCODE -ne 0) {
    exit $LASTEXITCODE
}
