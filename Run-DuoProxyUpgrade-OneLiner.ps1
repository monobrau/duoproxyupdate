# Duo Proxy Upgrade Helper - PowerShell One-Liner Script
# Downloads and executes DuoProxyUpgrade.ps1 from GitHub in a single command
# Usage: powershell.exe -ExecutionPolicy Bypass -File Run-DuoProxyUpgrade-OneLiner.ps1
# Or run directly: powershell.exe -ExecutionPolicy Bypass -Command "[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12; Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/monobrau/duoproxyupdate/main/DuoProxyUpgrade.ps1' -UseBasicParsing | Select-Object -ExpandProperty Content | Invoke-Expression"

[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12; Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/monobrau/duoproxyupdate/main/DuoProxyUpgrade.ps1' -UseBasicParsing | Select-Object -ExpandProperty Content | Invoke-Expression
