param(
    [string]$SourceDir = ".",
    [string]$OutputDir = ".\\release-assets"
)

$ErrorActionPreference = "Stop"

if (-not (Test-Path $OutputDir)) {
    New-Item -Path $OutputDir -ItemType Directory | Out-Null
}

# Generate ASCII release asset names from local binaries.
$setupCandidates = Get-ChildItem -Path $SourceDir -Filter "*.exe" |
    Where-Object { $_.Name -match "setup|安装包" } |
    Select-Object -First 1

$portableCandidates = Get-ChildItem -Path $SourceDir -Filter "*.exe" |
    Where-Object { $_.Name -match "ai|对战|棋" -and $_.Name -notmatch "setup|安装包" } |
    Select-Object -First 1

if (-not $setupCandidates) {
    throw "Setup installer not found. Put installer exe in repository root before packaging."
}

if (-not $portableCandidates) {
    throw "Portable exe not found. Put portable exe in repository root before packaging."
}

$setupTarget = Join-Path $OutputDir "dvdxfv-connect4-setup.exe"
$portableTarget = Join-Path $OutputDir "dvdxfv-connect4-portable.exe"

Copy-Item $setupCandidates.FullName $setupTarget -Force
Copy-Item $portableCandidates.FullName $portableTarget -Force

Write-Host "Prepared assets:"
Write-Host " - $setupTarget"
Write-Host " - $portableTarget"
