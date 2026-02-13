# Installation Guide

Quick and detailed installation instructions for Debrave.

---

## 🚀 Quick Install (Recommended)

### One-Line PowerShell Command

1. **Open PowerShell as Administrator**
   - Press `Win + X`
   - Click "Windows PowerShell (Admin)" or "Terminal (Admin)"

2. **Run this command:**
   ```powershell
   iwr "https://raw.githubusercontent.com/YOUR_REPO/Debrave/main/Debrave.ps1" -OutFile "Debrave.ps1"; .\Debrave.ps1
   ```

3. **The Debrave window will open automatically**

> **Note:** Replace `YOUR_REPO` with the actual GitHub repository URL

---

## 📥 Manual Installation

### Step 1: Download

**Option A: Download from GitHub**
1. Visit the [Debrave GitHub Repository](https://github.com/YOUR_REPO/Debrave)
2. Click the green "Code" button
3. Select "Download ZIP"
4. Extract to a folder (e.g., `C:\Tools\Debrave`)

**Option B: Clone with Git**
```bash
git clone https://github.com/YOUR_REPO/Debrave.git
cd Debrave
```

### Step 2: Run Debrave

1. **Navigate to the Debrave folder**
2. **Right-click** on `Debrave.ps1`
3. Select **"Run with PowerShell"**

Or from PowerShell:
```powershell
cd C:\PATH\TO\Debrave
.\Debrave.ps1
```

> **Note:** The script will automatically request Administrator privileges if needed.

---

## 🎯 Using Debrave

### First-Time Setup

1. **Launch Debrave** - The GUI window appears
2. **Choose a preset** or manually select features:
   - Use the preset dropdown at the top
   - Click "Load" to apply preset configuration
3. **Review settings** - Click ℹ️ icons to learn about each feature
4. **Click "Apply Settings"** - Saves configuration to registry
5. **Restart Brave Browser** - Changes take effect

### Understanding the Interface

**Header Section:**
- **Preset Dropdown** - Quick configuration templates
- **Load Button** - Apply selected preset

**Left Panel - Core Features & Security:**
- 🎯 Core Features (Wallet, Rewards, VPN, etc.)
- 🔒 Security & Privacy (WebRTC, Cookies, Safe Browsing)

**Right Panel - Data & Browser Controls:**
- 📊 Data & Tracking (Telemetry, Reports, Surveys)
- ⚙️ Browser Controls (Password Manager, Autofill, Developer Tools)

**Bottom Section:**
- **DNS Over HTTPS** - Choose encryption mode
- **Action Buttons** - Export, Import, Apply, Reset, Wiki

### Info Buttons (ℹ️)

Click any ℹ️ button to see:
- What the feature does
- Effect when disabled
- Privacy impact
- Performance impact
- Recommendation

---

## 🔧 Troubleshooting

### Issue: "Cannot be loaded because running scripts is disabled"

**Solution: Enable PowerShell script execution**

1. Open PowerShell as Administrator
2. Run: `Set-ExecutionPolicy RemoteSigned -Scope CurrentUser`
3. Type `Y` to confirm
4. Try running Debrave again

### Issue: "Access Denied" when applying settings

**Solution: Run as Administrator**

1. Right-click `Debrave.ps1`
2. Select "Run with PowerShell"
3. When prompted, click "Yes" to allow administrator access

### Issue: Changes not taking effect

**Solution: Restart Brave completely**

1. Close all Brave windows
2. Open Task Manager (`Ctrl + Shift + Esc`)
3. End all `brave.exe` processes
4. Restart Brave

### Issue: Want to undo all changes

**Solution: Use Reset Button**

1. Open Debrave
2. Click "Reset All Settings" button
3. Confirm the warning
4. Restart Brave

**Or manually delete registry key:**
```powershell
Remove-Item -Path "HKLM:\SOFTWARE\Policies\BraveSoftware\Brave" -Recurse -Force
```

---

## 💾 Export & Import Settings

### Export Your Configuration

1. Configure Debrave with your preferred settings
2. Click **"Export Settings"**
3. Choose save location (default: Documents)
4. File saved as `DebraveSettings.json`

### Import Configuration

1. Click **"Import Settings"**
2. Select your `.json` file
3. Settings automatically applied
4. Click **"Apply Settings"** to save to registry
5. Restart Brave

**Use Case:** Share configurations across multiple computers or backup your settings.

---

## 🎭 Preset Recommendations

### For Most Users: **Daily Driver**
Balanced privacy and convenience. Removes bloat while keeping useful features.

### For Privacy Enthusiasts: **Ghost Mode**
Maximum privacy, all tracking blocked, all features disabled.

### For Best Performance: **Clean & Fast**
Removes all bloat, optimized for speed.

### For Developers: **Dev Workspace**
Clean interface with DevTools preserved.

### For Families: **Guardian Mode**
Parental controls, restricted browsing.

---

## 📖 Learning More

After installation, explore the documentation:

1. **Click "📖 Wiki" button** in Debrave
2. Read **[FEATURES_WIKI.md](FEATURES_WIKI.md)** for detailed feature explanations
3. Review **[README.md](README.md)** for project overview

---

## 🔄 Updating Debrave

1. Download latest version from GitHub
2. Replace old `Debrave.ps1` with new version
3. Your saved settings (in registry) remain intact
4. Re-run Debrave to apply any new features

---

## 🗑️ Uninstall

### Option 1: Reset All Settings (Recommended)

1. Open Debrave
2. Click **"Reset All Settings"**
3. Restart Brave
4. Delete `Debrave.ps1` file

### Option 2: Manual Registry Cleanup

```powershell
# Run in PowerShell as Administrator
Remove-Item -Path "HKLM:\SOFTWARE\Policies\BraveSoftware\Brave" -Recurse -Force
```

Then restart Brave.

---

## ⚙️ Advanced: Custom DNS Providers

For advanced users wanting custom DNS over HTTPS:

1. Set DNS mode to "off" in Debrave
2. Configure system-level DNS:
   - Cloudflare: `1.1.1.1` / `1.0.0.1`
   - Cloudflare Family: `1.1.1.3` / `1.0.0.3`
   - Google: `8.8.8.8` / `8.8.4.4`
   - Quad9: `9.9.9.9` / `149.112.112.112`

Or use VPN with built-in DNS protection.

---

## 🛡️ Security Notes

**What Debrave Changes:**
- ✅ Windows Registry Group Policies only
- ✅ No browser files modified
- ✅ No network traffic intercepted
- ✅ No data collected

**What Debrave Does NOT Do:**
- ❌ Doesn't modify browser binaries
- ❌ Doesn't collect any data
- ❌ Doesn't require internet connection (after download)
- ❌ Doesn't affect browser updates

---

## 📋 System Requirements

- **Operating System:** Windows 10 or Windows 11
- **Browser:** Brave Browser (any version)
- **Permissions:** Administrator rights
- **Prerequisites:** None (PowerShell included with Windows)

---

## 🆘 Getting Help

**Issues or Questions?**

1. Check [FEATURES_WIKI.md](FEATURES_WIKI.md) FAQ section
2. Review this installation guide
3. Open an issue on [GitHub](https://github.com/YOUR_REPO/Debrave/issues)
4. Join discussions on [GitHub Discussions](https://github.com/YOUR_REPO/Debrave/discussions)

---

**Installation complete! Enjoy your debloated Brave Browser. 🚀**
