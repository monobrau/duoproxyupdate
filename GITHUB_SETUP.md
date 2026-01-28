# GitHub Repository Setup

## Create GitHub Repository

1. Go to https://github.com/new
2. Repository name: `duoproxyupdate` (or your preferred name)
3. Description: "Duo Authentication Proxy Upgrade Helper - PowerShell GUI tool for ScreenConnect sessions"
4. Choose Public or Private
5. **DO NOT** initialize with README, .gitignore, or license (we already have these)
6. Click "Create repository"

## Connect Local Repository to GitHub

After creating the repository on GitHub, run these commands:

```powershell
cd C:\git\duoproxyupdate

# Add remote (replace YOUR_USERNAME with your GitHub username)
git remote add origin https://github.com/YOUR_USERNAME/duoproxyupdate.git

# Or if using SSH:
# git remote add origin git@github.com:YOUR_USERNAME/duoproxyupdate.git

# Push to GitHub
git branch -M main
git push -u origin main
```

## Quick Setup Commands

Copy and paste these commands (replace YOUR_USERNAME):

```powershell
cd C:\git\duoproxyupdate
git remote add origin https://github.com/YOUR_USERNAME/duoproxyupdate.git
git branch -M main
git push -u origin main
```

## Verify

After pushing, visit: `https://github.com/YOUR_USERNAME/duoproxyupdate`

You should see all your files there!
