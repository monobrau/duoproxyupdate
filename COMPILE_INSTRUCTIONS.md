# Compiling for ScreenConnect/Remote Use

Since the target server won't have AutoHotkey installed, you need to compile the script into a standalone `.exe` file.

## Quick Compile Steps

1. **Install AutoHotkey v2** on your local machine (if not already installed):
   - Download from: https://www.autohotkey.com/
   - Install AutoHotkey v2 (not v1)

2. **Install the Compiler** (if right-click compile option not available):
   - Run: `"C:\Program Files\AutoHotkey\v2\AutoHotkey64.exe" "C:\Program Files\AutoHotkey\UX\install-ahk2exe.ahk"`
   - This installs the compiler component

3. **Compile the script**:
   - **Option A**: Run `compile.bat` (easiest - double-click it)
   - **Option B**: Right-click `DuoProxyUpgrade.ahk` → **"Compile Script"** (if available)
   - **Option C**: Use command line (see Alternative section below)
   - This creates `DuoProxyUpgrade.exe` in the same folder

3. **Transfer to remote server via ScreenConnect**:
   - Upload `DuoProxyUpgrade.exe` through ScreenConnect's file transfer
   - Or copy/paste it to the server's Desktop
   - No installation needed - just run the .exe

## Alternative: Use Ahk2Exe Command Line

If you prefer command line:

```powershell
cd C:\dev\duoproxyupdate
& "C:\Program Files\AutoHotkey\Compiler\Ahk2Exe.exe" /in "DuoProxyUpgrade.ahk" /out "DuoProxyUpgrade.exe" /bin "C:\Program Files\AutoHotkey\v2\AutoHotkey64.exe"
```

**Note**: The `/bin` parameter is required to specify the AutoHotkey v2 executable.

## Usage on Remote Server

1. Connect via ScreenConnect
2. Transfer `DuoProxyUpgrade.exe` to the server (Desktop or temp folder)
3. Run `DuoProxyUpgrade.exe` - it will appear in the system tray
4. Use F1-F6 hotkeys as normal
5. When done, close the application (right-click tray icon → Exit)

## Notes

- The compiled .exe is standalone - no dependencies needed
- Works the same as the .ahk script
- All hotkeys function identically
- Safe to run on production servers (no admin rights needed for most functions)
