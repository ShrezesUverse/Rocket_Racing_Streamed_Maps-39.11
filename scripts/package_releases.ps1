<#
.SYNOPSIS
    Zips every GFP_* plugin folder into dist\<plugin>.zip for upload to a GitHub Release.

.DESCRIPTION
    Each Rocket Racing streamed-map plugin is a self-contained four-file IoStore bundle
    (.pak / .ucas / .utoc / .sig) under GFP\<plugin>\FortniteGame\Content\Paks.
    This script packages each plugin folder as its own zip, named exactly like the
    download links in README.md (e.g. GFP_DelMarApollo.zip), so publish_release.ps1
    can attach them as Release assets.

    Pak payloads are already Oodle-compressed, so zip barely shrinks them — the default
    compression is 'Fastest' to save time. Pass -Compression Optimal to trade time for a
    slightly smaller archive.

.EXAMPLE
    pwsh scripts\package_releases.ps1
    pwsh scripts\package_releases.ps1 -Only GFP_DelMarApollo,GFP_Poseidon -Compression Optimal
#>
[CmdletBinding()]
param(
    [string]   $GfpDir      = (Join-Path $PSScriptRoot '..\GFP'),
    [string]   $OutDir      = (Join-Path $PSScriptRoot '..\dist'),
    [string[]] $Only        = @(),                              # limit to specific plugin folder names
    [ValidateSet('Fastest','Optimal','NoCompression')]
    [string]   $Compression = 'Fastest',
    [switch]   $Force                                           # re-zip even if the .zip already exists
)

$ErrorActionPreference = 'Stop'
$GfpDir = (Resolve-Path $GfpDir).Path
if (-not (Test-Path $OutDir)) { New-Item -ItemType Directory -Path $OutDir | Out-Null }
$OutDir = (Resolve-Path $OutDir).Path

$plugins = Get-ChildItem -Path $GfpDir -Directory -Filter 'GFP_*' | Sort-Object Name
if ($Only.Count) { $plugins = $plugins | Where-Object { $Only -contains $_.Name } }

if (-not $plugins) { Write-Warning "No GFP_* plugin folders found under $GfpDir"; return }

$made = 0; $skipped = 0; $totalBytes = 0
foreach ($p in $plugins) {
    $paks = Join-Path $p.FullName 'FortniteGame\Content\Paks'
    if (-not (Test-Path (Join-Path $paks '*.pak'))) {
        Write-Warning "  skip $($p.Name) — no .pak inside (binaries not present locally?)"
        $skipped++; continue
    }
    $zip = Join-Path $OutDir ("{0}.zip" -f $p.Name)
    if ((Test-Path $zip) -and -not $Force) {
        Write-Host "  exists $($p.Name).zip (use -Force to rebuild)" -ForegroundColor DarkGray
        $skipped++; continue
    }
    if (Test-Path $zip) { Remove-Item $zip -Force }

    Write-Host "  zipping $($p.Name) ..." -NoNewline
    Compress-Archive -Path $p.FullName -DestinationPath $zip -CompressionLevel $Compression
    $len = (Get-Item $zip).Length
    $totalBytes += $len
    $made++
    Write-Host (" done ({0:N1} MB)" -f ($len / 1MB)) -ForegroundColor Green
}

Write-Host ""
Write-Host ("Packaged {0} zip(s), skipped {1}. Total {2:N1} MB in {3}" -f `
    $made, $skipped, ($totalBytes / 1MB), $OutDir) -ForegroundColor Cyan
Write-Host "Next: pwsh scripts\publish_release.ps1" -ForegroundColor Cyan
