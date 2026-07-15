<#
.SYNOPSIS
    Creates (or reuses) the GitHub Release and uploads the per-map zips as assets.

.DESCRIPTION
    Requires the GitHub CLI (`gh`) to be installed and authenticated (`gh auth login`).
    Run scripts\package_releases.ps1 first to produce dist\*.zip. The asset names must
    match the download links in README.md exactly (they will, if you didn't rename zips).

    GitHub Releases allow up to 2 GB per asset — every map here is well under that — and
    the assets don't count toward repo size, so this is the right home for the 5.5 GB.

.EXAMPLE
    pwsh scripts\publish_release.ps1
    pwsh scripts\publish_release.ps1 -Tag 39.11 -Repo ShrezesUverse/Rocket_Racing_Streamed_Maps
#>
[CmdletBinding()]
param(
    [string] $Repo    = 'ShrezesUverse/Rocket_Racing_Streamed_Maps',
    [string] $Tag     = '39.11',
    [string] $Title   = 'Rocket Racing Streamed Maps — Build 39.11',
    [string] $DistDir = (Join-Path $PSScriptRoot '..\dist')
)

$ErrorActionPreference = 'Stop'

if (-not (Get-Command gh -ErrorAction SilentlyContinue)) {
    throw "GitHub CLI 'gh' not found. Install from https://cli.github.com/ and run 'gh auth login'."
}

$DistDir = (Resolve-Path $DistDir).Path
$zips = Get-ChildItem -Path $DistDir -Filter '*.zip' | Sort-Object Name
if (-not $zips) { throw "No zips in $DistDir. Run scripts\package_releases.ps1 first." }

$notes = @"
On-demand *Del Mar* (Rocket Racing) track plugins from Fortnite build ``39.11-CL-49242330``.
Each asset is one plugin's four-file IoStore bundle (.pak / .ucas / .utoc / .sig), zipped.
See the repository README for the full codename -> map -> plugin catalog.

Fan-made preservation archive, not affiliated with Epic Games. Rights holders: shrezeleiprech@gmail.com
"@

# Create the release if it doesn't already exist.
$exists = $true
try { gh release view $Tag --repo $Repo *> $null } catch { $exists = $false }
if (-not $exists) {
    Write-Host "Creating release $Tag on $Repo ..." -ForegroundColor Cyan
    gh release create $Tag --repo $Repo --title $Title --notes $notes
} else {
    Write-Host "Release $Tag already exists on $Repo — uploading/refreshing assets." -ForegroundColor Cyan
}

# Upload all zips as assets (--clobber replaces an asset of the same name).
$i = 0
foreach ($z in $zips) {
    $i++
    Write-Host ("[{0}/{1}] uploading {2} ..." -f $i, $zips.Count, $z.Name) -NoNewline
    gh release upload $Tag $z.FullName --repo $Repo --clobber
    Write-Host " ok" -ForegroundColor Green
}

Write-Host ""
Write-Host ("Done. {0} asset(s) on https://github.com/{1}/releases/tag/{2}" -f $zips.Count, $Repo, $Tag) -ForegroundColor Cyan
