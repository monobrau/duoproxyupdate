# Run from Web/GitHub

Execute the Duo Proxy Upgrade Helper directly from GitHub without downloading the file first.

## Quick Run Command

Copy and paste this into PowerShell on the remote server:

```powershell
powershell.exe -ExecutionPolicy Bypass -Command "Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/monobrau/duoproxyupdate/main/DuoProxyUpgrade.ps1' -UseBasicParsing | Select-Object -ExpandProperty Content | Invoke-Expression"
```

## One-Liner (Easier to Copy)

```powershell
powershell.exe -ExecutionPolicy Bypass -Command "iwr https://raw.githubusercontent.com/monobrau/duoproxyupdate/main/DuoProxyUpgrade.ps1 -UseBasicParsing | Select-Object -ExpandProperty Content | iex"
```

## For ScreenConnect Sessions

1. **Connect** to remote server via ScreenConnect
2. **Open PowerShell** on remote server
3. **Paste** the command above
4. **Press Enter** - GUI window will appear
5. **Use** buttons or F1-F6 shortcuts

## Alternative: Download Then Run

If you prefer to download first (for offline use or verification):

```powershell
# Download script
Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/monobrau/duoproxyupdate/main/DuoProxyUpgrade.ps1' -OutFile "$env:USERPROFILE\Desktop\DuoProxyUpgrade.ps1"

# Run it
powershell.exe -ExecutionPolicy Bypass -File "$env:USERPROFILE\Desktop\DuoProxyUpgrade.ps1"
```

## Security Note

This downloads and executes code from the internet. Only use if you trust the repository source. For maximum security, download and review the script first.

## Troubleshooting

**Execution Policy Error?**
- Use `-ExecutionPolicy Bypass` flag (already included in commands above)

**Network/Download Failed?**
- Check internet connection on remote server
- Verify GitHub URL is accessible
- Try downloading first, then running locally

**Script Not Found?**
- Verify the repository URL matches: `https://github.com/monobrau/duoproxyupdate`
- Check that the file exists in the `main` branch
