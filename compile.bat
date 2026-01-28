@echo off
REM AutoHotkey v2 Compilation Helper
REM Compiles DuoProxyUpgrade.ahk to standalone .exe

echo ========================================
echo Duo Proxy Upgrade - Compile Script
echo ========================================
echo.

REM Check if Ahk2Exe exists in common locations
set AHK2EXE=
if exist "C:\Program Files\AutoHotkey\Compiler\Ahk2Exe.exe" (
    set AHK2EXE=C:\Program Files\AutoHotkey\Compiler\Ahk2Exe.exe
) else if exist "C:\Program Files (x86)\AutoHotkey\Compiler\Ahk2Exe.exe" (
    set AHK2EXE=C:\Program Files (x86)\AutoHotkey\Compiler\Ahk2Exe.exe
) else (
    echo ERROR: Ahk2Exe.exe not found!
    echo.
    echo Please install AutoHotkey v2 from: https://www.autohotkey.com/
    echo Or compile manually: Right-click DuoProxyUpgrade.ahk -^> Compile Script
    echo.
    pause
    exit /b 1
)

echo Found Ahk2Exe at: %AHK2EXE%
echo.

REM Find AutoHotkey v2 executable
set AHKV2EXE=
if exist "C:\Program Files\AutoHotkey\v2\AutoHotkey64.exe" (
    set AHKV2EXE=C:\Program Files\AutoHotkey\v2\AutoHotkey64.exe
) else if exist "C:\Program Files\AutoHotkey\v2\AutoHotkey32.exe" (
    set AHKV2EXE=C:\Program Files\AutoHotkey\v2\AutoHotkey32.exe
)

if "%AHKV2EXE%"=="" (
    echo ERROR: AutoHotkey v2 executable not found!
    echo.
    pause
    exit /b 1
)

echo Found AutoHotkey v2 at: %AHKV2EXE%
echo.
echo Compiling DuoProxyUpgrade.ahk...
echo.

"%AHK2EXE%" /in "DuoProxyUpgrade.ahk" /out "DuoProxyUpgrade.exe" /bin "%AHKV2EXE%"

if exist "DuoProxyUpgrade.exe" (
    echo.
    echo ========================================
    echo SUCCESS! DuoProxyUpgrade.exe created!
    echo ========================================
    echo.
    echo You can now transfer this .exe file to your remote server via ScreenConnect.
    echo No installation needed - just run it on the target server.
    echo.
) else (
    echo.
    echo ERROR: Compilation failed!
    echo.
    echo Try compiling manually:
    echo Right-click DuoProxyUpgrade.ahk -^> Compile Script
    echo.
)

pause
