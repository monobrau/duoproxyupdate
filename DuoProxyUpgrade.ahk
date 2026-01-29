#Requires AutoHotkey v2.0
#SingleInstance Force

; Duo Authentication Proxy Upgrade - AutoHotkey Shortcuts
; Version: 1.0
; Purpose: Quick shortcuts for Duo Proxy upgrade tasks

; ============================================
; CONFIGURATION PATHS (Update if different)
; ============================================
ConfigPathOld := "C:\Program Files (x86)\Duo Security Authentication Proxy\conf"
ConfigPathNew := "C:\Program Files\Duo Security Authentication Proxy\conf"
ConfigFile := "authproxy.cfg"
DesktopPath := A_Desktop
; Duo Authentication Proxy download/reference (not generic checksums page)
DuoDownloadsURL := "https://duo.com/docs/authproxy-reference"
ProxyManagerExe := "C:\Program Files\Duo Security Authentication Proxy\DuoAuthenticationProxyManager.exe"

; ============================================
; HOTKEYS
; ============================================

; F1: Open Config File Location (Old Path - Pre 5.6.0)
F1:: {
    if DirExist(ConfigPathOld) {
        Run('explorer.exe "' ConfigPathOld '"')
        ToolTip("Opening old config path...", 0, 0)
        SetTimer(() => ToolTip(), -2000)
    } else {
        MsgBox("Old config path not found: `n" ConfigPathOld, "Path Not Found", 48)
    }
}

; F2: Open Config File Location (New Path - 5.6.0+)
F2:: {
    if DirExist(ConfigPathNew) {
        Run('explorer.exe "' ConfigPathNew '"')
        ToolTip("Opening new config path...", 0, 0)
        SetTimer(() => ToolTip(), -2000)
    } else {
        MsgBox("New config path not found: `n" ConfigPathNew, "Path Not Found", 48)
    }
}

; F3: Open Duo Proxy Manager
F3:: {
    if FileExist(ProxyManagerExe) {
        Run(ProxyManagerExe)
        ToolTip("Opening Duo Proxy Manager...", 0, 0)
        SetTimer(() => ToolTip(), -2000)
    } else {
        ; Try alternative locations
        altPaths := [
            "C:\Program Files (x86)\Duo Security Authentication Proxy\DuoAuthenticationProxyManager.exe",
            A_ProgramFiles "\Duo Security Authentication Proxy\DuoAuthenticationProxyManager.exe"
        ]
        
        found := false
        for path in altPaths {
            if FileExist(path) {
                Run(path)
                found := true
                ToolTip("Opening Duo Proxy Manager...", 0, 0)
                SetTimer(() => ToolTip(), -2000)
                break
            }
        }
        
        if !found {
            MsgBox("Duo Proxy Manager not found.`n`nTried:`n" ProxyManagerExe, "File Not Found", 48)
        }
    }
}

; F4: Open Duo Downloads/Checksums Page
F4:: {
    Run(DuoDownloadsURL)
    ToolTip("Opening Duo Downloads page...", 0, 0)
    SetTimer(() => ToolTip(), -2000)
}

; F5: Backup Config File (Auto-detect path)
F5:: {
    ; Try new path first (5.6.0+), then old path
    configPath := ""
    if DirExist(ConfigPathNew) {
        configPath := ConfigPathNew
    } else if DirExist(ConfigPathOld) {
        configPath := ConfigPathOld
    } else {
        MsgBox("Config directory not found in either location.`n`nOld: " ConfigPathOld "`nNew: " ConfigPathNew, "Path Not Found", 48)
        return
    }
    
    sourceFile := configPath "\" ConfigFile
    if !FileExist(sourceFile) {
        MsgBox("Config file not found: `n" sourceFile, "File Not Found", 48)
        return
    }
    
    ; Create backup filename with date
    FormatTime(, "yyyy-MM-dd")
    backupName := "authproxy_" A_Now ".cfg"
    backupPath := DesktopPath "\" backupName
    
    try {
        FileCopy(sourceFile, backupPath, 1) ; Overwrite if exists
        ToolTip("Config backed up to:`n" backupPath, 0, 0)
        SetTimer(() => ToolTip(), -3000)
        SoundBeep(800, 200)
    } catch as err {
        MsgBox("Error backing up config: `n" err.Message, "Backup Failed", 16)
    }
}

; F6: Open Both Config Paths (for version detection)
F6:: {
    pathsOpened := 0
    if DirExist(ConfigPathOld) {
        Run('explorer.exe "' ConfigPathOld '"')
        pathsOpened++
    }
    if DirExist(ConfigPathNew) {
        Run('explorer.exe "' ConfigPathNew '"')
        pathsOpened++
    }
    
    if pathsOpened = 0 {
        MsgBox("Neither config path found.`n`nOld: " ConfigPathOld "`nNew: " ConfigPathNew, "Paths Not Found", 48)
    } else {
        ToolTip("Opened " pathsOpened " config path(s)...", 0, 0)
        SetTimer(() => ToolTip(), -2000)
    }
}

; Ctrl+Shift+D: Open Duo Downloads in default browser
^+d:: {
    Run(DuoDownloadsURL)
}

; Ctrl+Shift+B: Quick Backup Config
^+b:: {
    ; Trigger F5 function
    Send("{F5}")
}

; ============================================
; TRAY MENU
; ============================================
A_TrayMenu.Delete() ; Remove default menu
A_TrayMenu.Add("&Show Hotkeys", ShowHotkeys)
A_TrayMenu.Add("&About", ShowAbout)
A_TrayMenu.Add() ; Separator
A_TrayMenu.Add("&Exit", (*) => ExitApp())

ShowHotkeys(*) {
    hotkeys := "
    (
    DUO PROXY UPGRADE HOTKEYS
    =========================
    
    F1  - Open Old Config Path (Pre 5.6.0)
    F2  - Open New Config Path (5.6.0+)
    F3  - Open Duo Proxy Manager
    F4  - Open Duo Downloads Page
    F5  - Backup Config File (Auto-detect path)
    F6  - Open Both Config Paths
    
    Ctrl+Shift+D - Open Duo Downloads
    Ctrl+Shift+B - Quick Backup Config
    
    Right-click tray icon for menu
    )"
    MsgBox(hotkeys, "Duo Proxy Upgrade Shortcuts", 64)
}

ShowAbout(*) {
    about := "
    (
    Duo Proxy Upgrade Helper
    Version 1.0
    
    AutoHotkey v2 Script
    Created for Duo Authentication Proxy upgrades
    
    Provides quick shortcuts for:
    - Opening config directories
    - Backing up config files
    - Opening Duo Proxy Manager
    - Accessing Duo downloads page
    )"
    MsgBox(about, "About", 64)
}

; ============================================
; STARTUP MESSAGE
; ============================================
ToolTip("Duo Proxy Upgrade Helper Loaded`nPress F1-F6 for shortcuts`nRight-click tray icon for menu", 0, 0)
SetTimer(() => ToolTip(), -3000)
