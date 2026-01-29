@echo off
REM Duo Proxy Upgrade Helper - CMD Launcher
REM Downloads and runs DuoProxyUpgrade.ps1 from GitHub
REM Usage: Double-click this file or run from command prompt

echo ========================================
echo Duo Proxy Upgrade Helper
echo Downloading from GitHub...
echo ========================================
echo.

powershell.exe -ExecutionPolicy Bypass -Command "[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12; $f = Join-Path $env:TEMP 'DuoProxyUpgrade.ps1'; Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/monobrau/duoproxyupdate/main/DuoProxyUpgrade.ps1' -OutFile $f -UseBasicParsing; powershell.exe -ExecutionPolicy Bypass -File $f"

if errorlevel 1 (
    echo.
    echo ERROR: Failed to download or execute script
    echo.
    pause
)
