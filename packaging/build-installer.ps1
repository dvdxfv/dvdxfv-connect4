param(
    [string]$IsccPath = "iscc",
    [string]$IssFile = ".\packaging\installer.iss"
)

$ErrorActionPreference = "Stop"

if (-not (Test-Path $IssFile)) {
    throw "Inno Setup script not found: $IssFile"
}

Write-Host "Compiling installer with Inno Setup..."
& $IsccPath $IssFile

if ($LASTEXITCODE -ne 0) {
    throw "Inno Setup compile failed with exit code $LASTEXITCODE"
}

Write-Host "Done. Installer output is in .\release-assets\"
