# ScreenConnect Deployment Guide

Step-by-step guide for deploying and using the Duo Proxy Upgrade helper via ScreenConnect.

## ⚠️ RECOMMENDED: PowerShell Version (SentinelOne Safe)

**Use the PowerShell version** (`DuoProxyUpgrade.ps1`) to avoid SentinelOne/EDR alerts. No compilation needed!

### Deployment via ScreenConnect (PowerShell Version)

1. **Connect** to the target server via ScreenConnect
2. **Open File Transfer** in ScreenConnect:
   - Click "File Transfer" button/tab
   - Or use menu: Tools → File Transfer
3. **Upload** `DuoProxyUpgrade.ps1`:
   - Browse to `C:\dev\duoproxyupdate\DuoProxyUpgrade.ps1` on your local machine
   - Upload to server Desktop (or `C:\temp`)
4. **Run** the script:
   - **Option A**: Right-click `DuoProxyUpgrade.ps1` → Run with PowerShell
   - **Option B**: Double-click `Run-DuoHelper.bat` (if you also transfer this)
   - **Option C**: Run: `powershell.exe -ExecutionPolicy Bypass -File "DuoProxyUpgrade.ps1"`
5. **GUI window** will appear - use buttons or F1-F6 shortcuts

## Usage During Upgrade Session

1. **Start the helper**:
   - Run `DuoProxyUpgrade.ps1` or `Run-DuoHelper.bat`
   - GUI window appears with buttons

2. **Use the helper**:
   - **Click buttons** in the GUI window
   - **OR use F1-F6** (make sure GUI window has focus)
   - **F5** - Backup config BEFORE upgrade (highlighted button)
   - **F3** - Check current version
   - **F4** - Open Duo downloads page
   - **F1/F2** - Navigate to config directories
   - **F5** - Verify backup after upgrade

3. **Verify actions**:
   - Status messages appear in the GUI window
   - File Explorer windows will open for paths
   - Backup creates file on Desktop with timestamp

4. **When finished**:
   - Close the GUI window

## Important Notes for ScreenConnect
- **GUI Window**: Stays on top, visible in ScreenConnect window
- **Keyboard Focus**: Click inside GUI window before using F1-F6 shortcuts
- **File Operations**: All file operations happen on the remote server
- **No Installation**: Just run the .ps1 script - no compilation needed
- **Execution Policy**: May need `-ExecutionPolicy Bypass` flag

## Troubleshooting

**Script won't run?**
- Use: `powershell.exe -ExecutionPolicy Bypass -File "DuoProxyUpgrade.ps1"`
- Check PowerShell version: `$PSVersionTable.PSVersion` (needs 5.1+)
- Right-click .ps1 file → Properties → Unblock (if blocked)

**Hotkeys not working?**
- Click inside the GUI window to give it focus
- F1-F6 only work when the GUI form has focus
- Use buttons instead if shortcuts don't work

**GUI window not visible?**
- Check ScreenConnect window - it should be visible
- Window is set to "TopMost" - should stay visible
- Try Alt+Tab to find the window

**File paths not found?**
- Script checks both old and new Duo Proxy paths automatically
- If neither found, verify Duo Proxy is installed on the server

**Backup not working?**
- Ensure you have write permissions to Desktop
- Check if Desktop path is redirected (some server configs)
- Backup file will be named: `authproxy_YYYYMMDDHHMMSS.cfg`

## Cleanup After Session

The `DuoProxyUpgrade.ps1` script can be left on the server or deleted:
- **Keep it**: Useful for future upgrades on same server
- **Delete it**: Safe to remove - no system changes made
- Backup files (`.cfg` on Desktop) should be kept for rollback purposes
