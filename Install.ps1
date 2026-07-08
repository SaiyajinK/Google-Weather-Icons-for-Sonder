$ErrorActionPreference = "Stop"

Write-Host ""
Write-Host "Google Weather Icons for Sonder"
Write-Host ""
Write-Host "1 - Dark icons"
Write-Host "2 - Light icons"
Write-Host ""

$choice = Read-Host "Select a version"

switch ($choice) {
    "1" { $source = Join-Path $PSScriptRoot "dark_icons" }
    "2" { $source = Join-Path $PSScriptRoot "light_icons" }
    default {
        Write-Host "Invalid selection."
        exit
    }
}

$destination = Join-Path $env:USERPROFILE "Documents\Rainmeter\Skins\Sonder\@Resources\Weather\Icons"

if (!(Test-Path $destination)) {
    Write-Host ""
    Write-Host "Sonder icons folder not found:"
    Write-Host $destination
    exit
}

Copy-Item -Path (Join-Path $source "*") -Destination $destination -Recurse -Force

Write-Host ""
Write-Host "Icons installed successfully."
Write-Host "Refresh Rainmeter to apply the changes."
