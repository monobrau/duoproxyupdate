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

---

## Alternative: AutoHotkey Version (May Trigger SentinelOne)

**Only use if PowerShell version doesn't work and you can allowlist on client networks.**

### Pre-Deployment (On Your Local Machine)

1. **Compile the script**:
   ```
   Option A: Double-click compile.bat
   Option B: Right-click DuoProxyUpgrade.ahk → Compile Script
   ```
   This creates `DuoProxyUpgrade.exe`

2. **Verify compilation**:
   - Check that `DuoProxyUpgrade.exe` exists in the folder
   - File size should be ~500KB-2MB (includes AutoHotkey runtime)

### Deployment via ScreenConnect (AutoHotkey Version)

1. **Connect** to the target server via ScreenConnect
2. **Open File Transfer** in ScreenConnect:
   - Click "File Transfer" button/tab
   - Or use menu: Tools → File Transfer
3. **Upload** `DuoProxyUpgrade.exe`:
   - Browse to `C:\dev\duoproxyupdate\DuoProxyUpgrade.exe` on your local machine
   - Upload to server Desktop (or `C:\temp`)
4. **Run** the executable:
   - Navigate to Desktop on remote server
   - Double-click `DuoProxyUpgrade.exe`
   - Look for tray icon confirmation (bottom-right system tray)

### Method 2: Copy/Paste (If File Transfer Unavailable)

1. **Connect** to target server via ScreenConnect
2. **Copy** `DuoProxyUpgrade.exe` from your local machine
3. **Paste** into remote Desktop folder
4. **Run** the executable

## Usage During Upgrade Session

### PowerShell Version (Recommended)

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

### AutoHotkey Version (Alternative)

1. **Start the helper**:
   - Run `DuoProxyUpgrade.exe` on remote server
   - You'll see a brief tooltip: "Duo Proxy Upgrade Helper Loaded"

2. **Use hotkeys** (make sure ScreenConnect session has focus):
   - **F5** - Backup config BEFORE upgrade
   - **F3** - Check current version
   - **F4** - Open Duo downloads page
   - **F1/F2** - Navigate to config directories
   - **F5** - Verify backup after upgrade

3. **Verify actions**:
   - Tooltips appear briefly in top-left corner
   - File Explorer windows will open for paths
   - Backup creates file on Desktop with timestamp

4. **When finished**:
   - Right-click tray icon → Exit
   - Or close the application

## Important Notes for ScreenConnect

### PowerShell Version
- **GUI Window**: Stays on top, visible in ScreenConnect window
- **Keyboard Focus**: Click inside GUI window before using F1-F6 shortcuts
- **File Operations**: All file operations happen on the remote server
- **No Installation**: Just run the .ps1 script - no compilation needed
- **Execution Policy**: May need `-ExecutionPolicy Bypass` flag

### AutoHotkey Version
- **Keyboard Focus**: Ensure ScreenConnect session window has focus when pressing hotkeys
- **Tray Icon**: May appear in remote session's system tray (not yours)
- **Tooltips**: Appear on remote desktop, visible in ScreenConnect window
- **File Operations**: All file operations happen on the remote server
- **No Installation**: The .exe is portable - no registry changes or installation needed

## Troubleshooting

### PowerShell Version

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

### AutoHotkey Version

**Hotkeys not working?**
- Click inside the ScreenConnect session window to ensure it has focus
- Check system tray on remote server - is the icon visible?
- Try right-clicking tray icon → Show Hotkeys to verify it's running

**Can't see tray icon?**
- Look in the remote server's system tray (bottom-right in ScreenConnect window)
- May need to expand system tray area in ScreenConnect view

**File paths not found?**
- Script checks both old and new Duo Proxy paths automatically
- If neither found, verify Duo Proxy is installed on the server

**Backup not working?**
- Ensure you have write permissions to Desktop
- Check if Desktop path is redirected (some server configs)
- Backup file will be named: `authproxy_YYYYMMDDHHMMSS.cfg`

## Cleanup After Session

The `DuoProxyUpgrade.exe` can be left on the server or deleted:
- **Keep it**: Useful for future upgrades on same server
- **Delete it**: Safe to remove - no system changes made
- Backup files (`.cfg` on Desktop) should be kept for rollback purposes
