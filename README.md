# Duo Authentication Proxy Upgrade Helper

**Repository:** [https://github.com/monobrau/duoproxyupdate](https://github.com/monobrau/duoproxyupdate)

Quick shortcuts and automation tools for Duo Authentication Proxy upgrade tasks, designed for remote server access via ScreenConnect.

## 🚀 Quick Start

### Web-Based Installers (Run Directly from GitHub)

**Note:** These commands only work if the repository is **public**. For private repos, clone the repo first.

**Three ways to run:**

1. **CMD / Command Prompt:**
   ```cmd
   powershell.exe -ExecutionPolicy Bypass -Command "[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12; $f = Join-Path $env:TEMP 'DuoProxyUpgrade.ps1'; Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/monobrau/duoproxyupdate/main/DuoProxyUpgrade.ps1' -OutFile $f -UseBasicParsing; powershell.exe -ExecutionPolicy Bypass -File $f"
   ```

2. **PowerShell (Download then Execute - Recommended):**
   ```powershell
   powershell.exe -ExecutionPolicy Bypass -Command "[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12; $f = Join-Path $env:TEMP 'DuoProxyUpgrade.ps1'; Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/monobrau/duoproxyupdate/main/DuoProxyUpgrade.ps1' -OutFile $f -UseBasicParsing; powershell.exe -ExecutionPolicy Bypass -File $f"
   ```

3. **PowerShell (One-Liner - Execute in Memory):**
   ```powershell
   powershell.exe -ExecutionPolicy Bypass -Command "[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12; Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/monobrau/duoproxyupdate/main/DuoProxyUpgrade.ps1' -UseBasicParsing | Select-Object -ExpandProperty Content | Invoke-Expression"
   ```

**Note:** Commands 1 & 2 download to temp folder then execute (more reliable). Command 3 executes directly in memory (faster but may have issues with complex scripts).

### Local Installation

1. **Transfer** `DuoProxyUpgrade.ps1` to remote server via ScreenConnect
2. **Run**: `powershell.exe -ExecutionPolicy Bypass -File "DuoProxyUpgrade.ps1"`
   - Or double-click `Run-DuoHelper.bat`
3. **Use** GUI buttons or F1-F6 keyboard shortcuts
4. **Close** window when done

**Why PowerShell?** Native Windows, won't trigger SentinelOne/EDR alerts, no allowlisting needed.

## Features

- ✅ **GUI Interface** - Easy-to-use buttons for all actions
- ✅ **Keyboard Shortcuts** - F1-F6 hotkeys (when window has focus)
- ✅ **Auto-detection** - Automatically finds old vs new config paths
- ✅ **Timestamped Backups** - Config files backed up with date/time
- ✅ **ScreenConnect Ready** - Designed for remote server access
- ✅ **SentinelOne Safe** - PowerShell version won't trigger security alerts

## Hotkeys

| Key | Action |
|-----|--------|
| **F1** | Open Old Config Path (Pre 5.6.0) |
| **F2** | Open New Config Path (5.6.0+) |
| **F3** | Open Duo Proxy Manager |
| **F4** | Open Duo Downloads/Checksums Page |
| **F5** | Backup Config File (Auto-detect path) |
| **F6** | Open Both Config Paths |

## Files

- **`DuoProxyUpgrade.ps1`** - PowerShell GUI version (recommended)
- **`Run-DuoHelper.bat`** - Simple launcher for PowerShell script

## Documentation

- **`SCREENCONNECT_DEPLOYMENT.md`** - Step-by-step ScreenConnect guide
- **`SCREENCONNECT_CHECKLIST.txt`** - Printable upgrade checklist
- **`QUICK_START_SCREENCONNECT.txt`** - Quick reference card
- **`QUICK_REFERENCE.txt`** - Hotkey reference
- **`TROUBLESHOOT_VERSION_DETECTION.md`** - Troubleshooting version detection issues
- **`CLEAR_CACHE.md`** - How to clear cache for script updates

## Usage Workflow

1. **Before upgrade**: Press F5 to backup config, F3 to check current version
2. **During upgrade**: Press F4 to open downloads page
3. **After upgrade**: Press F5 again to verify backup, F3 to validate new version

## Requirements

- **PowerShell Version**: Windows PowerShell 5.1+ (default on Windows 10/11)

## License

This project is provided as-is for internal use.

## Contributing

Feel free to submit issues or pull requests for improvements.
