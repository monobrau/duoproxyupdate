# Duo Proxy Upgrade Helper - PowerShell Launcher
# Downloads and runs DuoProxyUpgrade.ps1 from GitHub
# Usage: powershell.exe -ExecutionPolicy Bypass -File Run-DuoProxyUpgrade.ps1
# Or: .\Run-DuoProxyUpgrade.ps1

# Ensure TLS 1.2 is enabled for PowerShell 5.x compatibility
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

# GitHub repository details
$GitHubUrl = "https://raw.githubusercontent.com/monobrau/duoproxyupdate/main/DuoProxyUpgrade.ps1"
$TempScript = Join-Path $env:TEMP "DuoProxyUpgrade.ps1"

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "Duo Proxy Upgrade Helper" -ForegroundColor Cyan
Write-Host "Downloading from GitHub..." -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

try {
    Write-Host "Downloading: $GitHubUrl" -ForegroundColor Yellow
    Invoke-WebRequest -Uri $GitHubUrl -OutFile $TempScript -UseBasicParsing -ErrorAction Stop
    
    Write-Host "Download complete!" -ForegroundColor Green
    Write-Host "Executing script..." -ForegroundColor Yellow
    Write-Host ""
    
    # Execute the downloaded script
    & powershell.exe -ExecutionPolicy Bypass -File $TempScript
    
} catch {
    Write-Host "ERROR: Failed to download or execute script" -ForegroundColor Red
    Write-Host $_.Exception.Message -ForegroundColor Red
    Write-Host ""
    Write-Host "Tried URL: $GitHubUrl" -ForegroundColor Yellow
    Read-Host "Press Enter to exit"
    exit 1
}
