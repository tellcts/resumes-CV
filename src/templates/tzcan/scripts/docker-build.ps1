$ErrorActionPreference = "Stop"

$scriptDir = $PSScriptRoot
$templateDir = (Resolve-Path (Join-Path $scriptDir "..")).Path

docker run --rm `
  -v "${templateDir}:/workdir" `
  -w /workdir `
  ghcr.io/tellcts/texlive:latest `
  latexmk main.tex

if ($LASTEXITCODE -ne 0) {
    exit $LASTEXITCODE
}