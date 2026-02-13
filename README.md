# Debrave 🚀

**Take Back Control of Your Browser**

Debrave is a powerful Windows tool to debloat Brave Browser by removing unnecessary features, blocking telemetry, and optimizing for privacy and performance.

![Version](https://img.shields.io/badge/version-1.0.0-blue)
![Platform](https://img.shields.io/badge/platform-Windows-lightgrey)
![License](https://img.shields.io/badge/license-MIT-green)

---

## 🎯 What is Debrave?

Brave Browser comes packed with features that many users don't need or want:
- Cryptocurrency wallet and rewards
- Shopping price trackers
- AI chat assistants
- VPN promotions
- Constant telemetry

**Debrave removes the bloat** and gives you a clean, fast, private browser.

---

## ✨ Features

### 🎨 Modern UI
- Dark navy theme with cyan/purple gradients
- Interactive info buttons explaining every feature
- Clean, intuitive interface
- Preset system for quick configuration

### 🔒 Privacy First
- Block all telemetry and tracking
- Disable invasive features like Shopping List
- Protect against WebRTC IP leaks
- Block third-party cookies
- Stop URL data collection

### ⚡ Performance Optimized
- Remove background processes
- Disable bloat (Rewards, Wallet, VPN, AI, Shopping)
- Reduce memory usage
- Speed up browser startup

### 📚 Comprehensive Documentation
- Built-in wiki with detailed feature explanations
- Info dialogs for every setting
- Clear recommendation for each feature
- FAQ and troubleshooting guide

---

## 🚀 Quick Start

### One-Line Install

Open PowerShell as Administrator and run:

```powershell
iwr "https://raw.githubusercontent.com/YOUR_REPO/Debrave/main/Debrave.ps1" -OutFile "Debrave.ps1"; .\Debrave.ps1
```

> **Note:** Update `YOUR_REPO` with your actual GitHub repository

### Manual Installation

See [INSTALL.md](INSTALL.md) for detailed instructions.

---

## 🎭 Preset Configurations

Debrave includes 5 pre-configured presets:

### 👻 Ghost Mode
**Maximum privacy and anonymity**
- All telemetry blocked
- All Brave features disabled  
- WebRTC protection enabled
- Incognito forced on
- Plain DNS (no DoH)

**Best for:** Journalists, activists, privacy enthusiasts

---

### ⚡ Clean & Fast
**Performance optimization without extreme privacy**
- Bloat removed (Wallet, Rewards, VPN, AI, Shopping)
- Telemetry blocked
- Background processes disabled
- Safe Browsing kept for security

**Best for:** Users wanting fastest Brave experience

---

### 🚗 Daily Driver (Recommended)
**Balanced privacy and convenience**
- Brave features disabled
- Password manager kept
- Third-party cookies blocked
- Safe browsing active

**Best for:** Most users - everyday browsing

---

### 💻 Dev Workspace
**Developer-friendly configuration**
- Clean interface
- Telemetry blocked
- Developer tools **preserved**
- Autofill enabled for productivity

**Best for:** Web developers, engineers, QA testers

---

### 🛡️ Guardian Mode
**Parental controls and restrictions**
- Incognito mode blocked
- Google SafeSearch forced
- Developer tools disabled
- Printing disabled

**Best for:** Parents, schools, workplaces

---

## 📖 Documentation

- **[FEATURES_WIKI.md](FEATURES_WIKI.md)** - Complete guide to every feature and its effects
- **[INSTALL.md](INSTALL.md)** - Installation and usage instructions
- **Built-in Help** - Click ℹ️ icons in the app for instant feature explanations

---

## 🔍 What Gets Modified?

Debrave modifies **Windows Registry Group Policies** for Brave Browser:

**Registry Path:** `HKLM:\SOFTWARE\Policies\BraveSoftware\Brave`

These are official Brave policies - not hacks or modifications to browser files. Changes are:
- ✅ Safe and official
- ✅ Fully reversible
- ✅ Supported by Brave
- ✅ Won't break updates

---

## ❓ FAQ

### Is this safe?

**Yes.** Debrave only modifies official Brave Group Policy settings. No browser files are modified.

### Will this break Brave?

**No.** All features are optional. Core browsing works perfectly without them.

### Can I undo changes?

**Yes.** Use the "Reset All Settings" button to restore all defaults instantly.

### Do I need to restart Brave?

**Yes.** Changes take effect after browser restart.

### What should I disable first?

**Priority list:**
1. **Shopping List** - Major privacy/performance impact
2. **All Telemetry** - Blocks data collection
3. **Third-Party Cookies** - Essential privacy protection  
4. **Background Mode** - Saves system resources

### Which preset should I use?

- **Privacy focused?** → Ghost Mode
- **Performance focused?** → Clean & Fast
- **Balanced (recommended)?** → Daily Driver
- **Developer?** → Dev Workspace
- **Parental controls?** → Guardian Mode

---

## 🛠️ Requirements

- **OS:** Windows 10/11
- **Browser:** Brave Browser (any version)
- **Permissions:** Administrator rights (required for registry editing)

---

## 📸 Screenshots

![Debrave Main Interface](./docs/screenshot_main.png)
*Modern dark theme with feature categories*

![Feature Information Dialog](./docs/screenshot_info.png)
*Detailed explanations for every feature*

![Preset Selection](./docs/screenshot_presets.png)
*Quick configuration with 5 custom presets*

---

## 🤝 Contributing

Contributions welcome! Please feel free to submit a Pull Request.

### Areas for Contribution:
- Additional preset configurations
- Improved feature documentation
- UI/UX enhancements
- Bug fixes and optimizations

---

## 📜 License

MIT License - Feel free to use, modify, and distribute.

---

## ⚠️ Disclaimer

Debrave is an independent project and is not affiliated with, endorsed by, or associated with Brave Software Inc. Brave and the Brave logo are trademarks of Brave Software Inc.

Use at your own risk. While Debrave only modifies official Brave policies, always review settings before applying.

---

## 💖 Support

If Debrave helps you, consider:
- ⭐ Starring the repository
- 🐛 Reporting bugs
- 💡 Suggesting features
- 📢 Sharing with others

---

## 🔗 Links

- **Documentation:** [FEATURES_WIKI.md](FEATURES_WIKI.md)
- **Installation:** [INSTALL.md](INSTALL.md)
- **Issues:** [GitHub Issues](https://github.com/YOUR_REPO/Debrave/issues)
- **Discussions:** [GitHub Discussions](https://github.com/YOUR_REPO/Debrave/discussions)

---

**Made with ❤️ for privacy-conscious users**

*Debrave - Because your browser should work for you, not against you.*
