# Debrave Features Wiki

**Complete guide to understanding every feature in Debrave and their effects on Brave Browser.**

---

## Table of Contents

1. [Core Features](#core-features)
2. [Security & Privacy](#security--privacy)
3. [Data & Tracking](#data--tracking)
4. [Browser Controls](#browser-controls)
5. [DNS Over HTTPS](#dns-over-https)
6. [Preset Configurations](#preset-configurations)
7. [FAQ](#faq)

---

## Core Features

Features that control Brave's custom functionality and branded services.

### 🔸 Brave Wallet

**What it does:**
Built-in cryptocurrency wallet for managing digital assets (Ethereum, Solana, NFTs, etc.). Allows buying, sending, and swapping crypto directly from the browser.

**Effect when disabled:**
- Removes wallet UI from toolbar and settings
- Disables crypto transaction capabilities
- Prevents wallet-related network connections
- Reduces attack surface for crypto exploits

**Privacy Impact:** MEDIUM
- Stops wallet-related telemetry
- Prevents connections to blockchain nodes
- Eliminates crypto-related fingerprinting

**Performance Impact:** LOW
- Slightly reduces memory usage (~20-30MB)
- Removes background blockchain syncing

**Recommendation:**
✅ **DISABLE** if you don't use crypto or prefer external wallets (MetaMask, Phantom, etc.)

---

### 🔸 Brave Rewards

**What it does:**
Token-based reward system where you earn BAT (Basic Attention Token) for viewing privacy-respecting ads. Requires opt-in and shows notification-based ads.

**Effect when disabled:**
- Removes all reward-related UI elements
- Stops BAT earnings and ad notifications
- Disables creator tipping functionality
- Eliminates reward tracking systems

**Privacy Impact:** HIGH
- Stops reward-related tracking and analytics
- Prevents ad interaction logging
- Eliminates reward wallet connections

**Performance Impact:** MEDIUM
- Reduces background processes
- Eliminates ad notification system
- Reduces memory usage (~30-50MB)

**Recommendation:**
✅ **DISABLE** for cleaner browsing experience without cryptocurrency ads

---

### 🔸 Brave VPN

**What it does:**
Premium VPN service integrated into Brave (paid subscription). Provides encrypted tunneling for all browser traffic.

**Effect when disabled:**
- Removes VPN UI and settings
- Disables VPN connection capabilities
- Stops VPN-related background services

**Privacy Impact:** LOW
- Only affects VPN feature availability
- Doesn't impact general browsing privacy

**Performance Impact:** LOW
- Minimal impact unless actively using VPN
- Reduces unused UI elements

**Recommendation:**
✅ **DISABLE** if you use a separate VPN solution (NordVPN, ProtonVPN, etc.)

---

### 🔸 Brave AI Chat

**What it does:**
Integrated AI assistant powered by various LLM providers (Claude, ChatGPT, Llama). Accessible via sidebar for quick queries about current page or general questions.

**Effect when disabled:**
- Removes AI chat sidebar completely
- Disables AI summarization features
- Stops queries to AI service providers
- Eliminates AI-related UI elements

**Privacy Impact:** HIGH
- Prevents your queries from being sent to third-party AI providers
- Stops page content analysis by AI systems
- Eliminates AI-related data collection

**Performance Impact:** MEDIUM
- Reduces memory footprint (~40-60MB)
- Eliminates API calls to AI services
- Removes background AI processing

**Recommendation:**
✅ **DISABLE** to avoid data sharing with AI services and reduce bloat

---

### 🔸 Tor Integration

**What it does:**
Built-in Tor functionality allowing private browsing windows to route through Tor network for anonymity.

**Effect when disabled:**
- Removes "New Private Window with Tor" option
- Disables Tor daemon integration
- Stops Tor network connections

**Privacy Impact:** VARIABLE
- Removes easy Tor access, but Tor Browser is more secure for serious anonymity needs
- Some users prefer separation of Tor and regular browsing

**Performance Impact:** LOW
- Tor only runs when explicitly used
- No impact on regular browsing

**Recommendation:**
⚠️ **KEEP ENABLED** if you occasionally need Tor  
✅ **DISABLE** if you use Tor Browser separately for better isolation

---

### 🔸 Shopping List ⚠️ HIGH IMPACT

**What it does:**
Automatically tracks product prices across e-commerce websites (Amazon, eBay, etc.). Monitors pages you visit for product information, creates price drop alerts, and shows deal notifications.

**Effect when disabled:**
- Stops continuous price monitoring
- Eliminates product page analysis
- Removes shopping notifications and suggestions
- Prevents shopping data collection and storage

**Privacy Impact:** VERY HIGH ⚠️
- Brave **continuously analyzes every page you visit** looking for products
- Collects product URLs, prices, and shopping patterns
- Potentially creates detailed shopping behavior profile
- May send product data to Brave servers for price tracking

**Performance Impact:** MEDIUM
- Background page scraping consumes CPU cycles
- Stores shopping data locally (disk usage)
- Network requests to check prices
- Can slow down page loading on e-commerce sites

**What data is collected:**
- Product URLs and names
- Price history and trends
- Websites you shop on
- Frequency of product page visits
- Your shopping interests

**Why you should disable:**
1. **Privacy**: Prevents Brave from building a shopping profile
2. **Performance**: Eliminates constant background analysis
3. **Bloat**: Removes unnecessary feature for many users
4. **Security**: Reduces data collection and storage

**Recommendation:**
✅ **STRONGLY RECOMMEND DISABLING**  
This feature offers minimal value while significantly impacting privacy and performance. If you want price tracking, use dedicated browser extensions you control (Honey, CamelCamelCamel).

---

### 🔸 Media Recommendations

**What it does:**
Suggests videos, podcasts, and media content on the new tab page based on browsing activity and trends.

**Effect when disabled:**
- Removes media suggestions from new tab
- Stops content recommendation tracking
- Eliminates media-related network requests

**Privacy Impact:** MEDIUM
- Prevents browsing-based content tracking
- Stops connections to media recommendation services

**Performance Impact:** LOW
- Slightly cleaner new tab page
- Reduces background recommendation algorithms

**Recommendation:**
✅ **DISABLE** for privacy and cleaner new tab experience

---

### 🔸 Promotions

**What it does:**
In-browser promotional banners for Brave services, partners, and features. Appears in new tab, settings, and occasionally in browser UI.

**Effect when disabled:**
- Removes all promotional banners
- Eliminates service advertisements
- Creates distraction-free interface

**Privacy Impact:** LOW
- Mainly affects UI clutter
- Minor reduction in tracking for promotion effectiveness

**Performance Impact:** LOW
- Slightly cleaner interface
- Minimal performance impact

**Recommendation:**
✅ **DISABLE** for distraction-free, ad-free browsing experience

---

### 🔸 Brave Sync

**What it does:**
Synchronizes bookmarks, history, passwords, extensions, and settings across devices using encrypted sync chain.

**Effect when disabled:**
- Prevents sync chain creation
- Disables cross-device data synchronization
- Stops sync server connections

**Privacy Impact:** MEDIUM
- Prevents sync server communication
- Keeps data device-local only
- Eliminates encrypted data uploads

**Performance Impact:** LOW
- Reduces background sync operations
- Eliminates periodic sync checks

**Recommendation:**
❓ **PERSONAL CHOICE**  
- Disable if you only use one device or prefer manual backup
- Keep enabled if you need seamless cross-device sync

---

### 🔸 Default Browser Prompt

**What it does:**
Periodic notifications and prompts asking if you want to set Brave as your system's default browser.

**Effect when disabled:**
- Completely stops default browser prompts
- Eliminates repeated notifications

**Privacy Impact:** NONE

**Performance Impact:** NONE

**Recommendation:**
✅ **DISABLE** to eliminate annoying repeated prompts

---

## Security & Privacy

Features related to protecting your identity, preventing tracking, and securing connections.

### 🔒 Safe Browsing

**What it does:**
Google Safe Browsing protection checks URLs against Google's database of known malicious sites, phishing pages, and malware distributors.

**Effect when disabled:**
- Stops checks against Google's threat database
- Eliminates warnings for dangerous sites
- Prevents connections to Google Safe Browsing servers

**Privacy Impact:** HIGH
- **Stops** sending URL hashes to Google servers
- Eliminates Google's visibility into which sites you visit
- Prevents potential tracking via Safe Browsing checks

**Security Impact:** HIGH (NEGATIVE)
- ⚠️ Removes protection against phishing and malware
- You won't get warnings for dangerous sites
- Increases risk of visiting compromised websites

**Performance Impact:** LOW
- Reduces external API lookups
- Marginal speed improvement

**Trade-off:**
Privacy vs Security - This is a difficult decision.

**Recommendation:**
❌ **KEEP ENABLED** for most users (security outweighs privacy concern)  
✅ **DISABLE** only if you're extremely privacy-focused and confident in your ability to identify threats manually

---

### 🔒 WebRTC IP Leak Protection

**What it does:**
WebRTC (Web Real-Time Communication) enables peer-to-peer audio/video calls directly in browser. However, it can expose your **real IP address** even when using a VPN.

**Effect when enabled:**
- Blocks non-proxied UDP connections
- Forces WebRTC traffic through your VPN
- Prevents IP address exposure

**Privacy Impact:** VERY HIGH
- **Essential for VPN users** - prevents VPN bypass
- Stops websites from seeing your real IP when using VPN
- Protects against advanced tracking techniques

**Performance Impact:** MINIMAL
- May affect some video chat applications (Zoom, Google Meet)
- Most services work fine with protection enabled

**How IP leaks happen:**
1. You connect to VPN (IP hidden)
2. Website uses WebRTC to make peer connection
3. WebRTC bypasses VPN and reveals real IP
4. Your location and ISP are exposed

**Recommendation:**
✅ **STRONGLY ENABLE** if you use VPN or value privacy  
✅ **ENABLE** even without VPN for additional privacy layer

---

### 🔒 Block Third-Party Cookies

**What it does:**
Third-party cookies are set by domains different from the one you're visiting. Used extensively for cross-site tracking and advertising.

**Effect when enabled:**
- Blocks cookies from external domains
- Prevents cross-site tracking
- Breaks some embedded content (social widgets, comment systems)

**Privacy Impact:** VERY HIGH
- **Major privacy improvement**
- Stops advertisers from tracking you across websites
- Prevents building comprehensive browsing profiles
- Essential for privacy-conscious users

**Performance Impact:** NONE
- May break some website features:
  - Social media widgets
  - Embedded comment systems
  - Some login flows using third-party auth

**Recommendation:**
✅ **STRONGLY ENABLE** for strong privacy protection  
Trade minor inconvenience for significant privacy gain

---

### 🔒 Do Not Track (DNT)

**What it does:**
Sends "Do Not Track" HTTP header with every request, asking websites to not track you.

**Effect when enabled:**
- Adds `DNT: 1` header to all requests
- Asks websites voluntarily not to track

**Privacy Impact:** LOW
- **Most websites ignore DNT** - it's a voluntary request
- Has no legal enforcement
- Some tracking companies honor it, most don't
- May actually increase fingerprinting (reveals privacy preference)

**Performance Impact:** NONE

**Reality Check:**
DNT is largely ineffective. Major ad networks ignore it completely.

**Recommendation:**
✅ **ENABLE** for principle, but **don't rely on it** for privacy  
Use ad blockers and third-party cookie blocking instead

---

### 🔒 QUIC Protocol

**What it does:**
QUIC is a modern transport protocol developed by Google, used for HTTP/3. Provides faster connections, better performance on unstable networks.

**Effect when disabled:**
- Forces use of traditional TCP connections (HTTP/1.1, HTTP/2)
- Disables HTTP/3 protocol

**Privacy Impact:** LOW
- May reduce fingerprinting surface slightly
- Some privacy advocates distrust QUIC due to Google origins

**Performance Impact:** NEGATIVE
- QUIC is **faster** than TCP in many scenarios
- Disabling reduces connection speed
- Worse performance on mobile/unstable networks

**Recommendation:**
❌ **KEEP ENABLED** for better performance  
✅ **DISABLE** only if troubleshooting connection issues or extremely paranoid

---

### 🔒 IPFS Support

**What it does:**
InterPlanetary File System (IPFS) is a decentralized protocol for storing and accessing files. Brave can act as IPFS node and access `ipfs://` URLs.

**Effect when disabled:**
- Disables IPFS protocol handling
- Removes IPFS gateway features
- Prevents `ipfs://` URL resolution

**Privacy Impact:** LOW
- Only matters if accessing IPFS content
- Prevents unintended IPFS connections

**Performance Impact:** LOW
- Reduces unused protocol handlers
- Minimal impact for non-IPFS users

**Recommendation:**
✅ **DISABLE** unless you specifically use IPFS  
Most users never access IPFS content

---

## Data & Tracking

Features that control what data Brave collects and sends to servers.

### 📊 Metrics Reporting

**What it does:**
Sends anonymous usage statistics to Brave including: feature usage, error reports, performance metrics, browser crashes.

**Effect when disabled:**
- Stops all usage data collection
- Prevents crash report uploads
- Eliminates anonymous telemetry

**Privacy Impact:** HIGH
- Even "anonymous" data can be de-anonymized
- Prevents Brave from seeing usage patterns
- Eliminates metadata collection

**Performance Impact:** LOW
- Reduces background reporting processes
- Saves minimal network bandwidth

**Recommendation:**
✅ **DISABLE** to stop all metrics collection  
Brave doesn't need your data to function

---

### 📊 Safe Browsing Extended Reports

**What it does:**
When Safe Browsing detects a threat, this sends detailed reports to Google including: full URL, page content samples, download history.

**Effect when disabled:**
- Stops detailed threat reports to Google
- Only basic threat detection continues
- Prevents sharing browsing context with Google

**Privacy Impact:** HIGH
- Prevents sending page content to Google
- Stops sharing browsing details
- Reduces Google's visibility into your activity

**Security Impact:** MINIMAL
- Basic Safe Browsing still works
- Only detailed reports are blocked

**Recommendation:**
✅ **DISABLE** for privacy  
Basic protection remains active without detailed Google surveillance

---

### 📊 URL Data Collection

**What it does:**
Collects "anonymized" data about URLs you visit for Brave's research and improvement purposes.

**Effect when disabled:**
- Stops URL-based data collection completely
- Prevents browsing pattern analysis
- Eliminates URL logging

**Privacy Impact:** VERY HIGH
- Even hashed/anonymized URLs can leak information
- Prevents building browsing profiles
- Essential for true privacy

**Performance Impact:** NONE

**Recommendation:**
✅ **DISABLE IMMEDIATELY** for privacy  
No reason to share browsing patterns with Brave

---

### 📊 Feedback Surveys

**What it does:**
Occasional surveys asking about your experience with Brave, feature requests, satisfaction ratings.

**Effect when disabled:**
- Stops survey prompts
- Prevents survey data submissions
- Eliminates interruptions

**Privacy Impact:** LOW
- Surveys are voluntary
- Minimal data collection

**Performance Impact:** NONE

**Recommendation:**
✅ **DISABLE** to avoid interruptions  
Unless you actively want to provide feedback

---

### 📊 Search Suggestions

**What it does:**
Real-time search suggestions as you type in the address bar. Sends each keystroke to your search engine for autocomplete.

**Effect when disabled:**
- Stops sending keystrokes to search providers
- Eliminates real-time suggestions
- Requires typing full queries

**Privacy Impact:** HIGH
- Prevents search engines from seeing partial/abandoned queries
- Stops keystroke-level tracking
- Eliminates search prediction profiling

**Performance Impact:** LOW
- Reduces network requests while typing
- Slightly faster address bar (no API calls)

**Convenience Impact:** MEDIUM
- Loses autocomplete convenience
- Must type full search terms
- No spelling suggestions

**Recommendation:**
✅ **DISABLE** for privacy (prevents keystroke tracking)  
❌ **KEEP ENABLED** if you value autocomplete convenience

---

## Browser Controls

Features that control browser functionality and capabilities.

### ⚙️ Password Manager

**What it does:**
Built-in password storage and autofill for website credentials. Encrypted locally with master password option.

**Effect when disabled:**
- Disables password saving prompts
- Removes password autofill
- Prevents built-in credential storage

**Privacy Impact:** VARIABLE
- Keeps passwords out of browser storage
- Reduces data exposure if browser is compromised

**Security Consideration:**
Browser password managers are less secure than dedicated solutions (1Password, Bitwarden, KeePass).

**Recommendation:**
✅ **DISABLE** if using external password manager (recommended)  
❌ **KEEP ENABLED** if you don't use any password manager (better than reusing passwords)

---

### ⚙️ Autofill (Addresses & Credit Cards)

**What it does:**
Stores personal information (name, address, phone) and payment information for quick form filling.

**Effect when disabled:**
- Prevents address/payment storage
- Manual form entry required
- Keeps sensitive data out of browser

**Privacy Impact:** LOW-MEDIUM
- Reduces sensitive data in browser storage
- Prevents autofill-based tracking

**Security Impact:** MEDIUM
- Storing credit cards in browser is less secure than password managers
- Reduces exposure if device is compromised

**Recommendation:**
✅ **DISABLE** for security - use external password manager for autofill instead  
❌ **KEEP ENABLED** if you need convenience and understand risks

---

### ⚙️ Browser Sign-In

**What it does:**
Allows signing into Brave with an account for sync and cloud features.

**Effect when disabled:**
- Prevents browser account login
- Blocks sync functionality
- Eliminates account-based tracking

**Privacy Impact:** HIGH
- Avoids account-based behavior tracking
- Prevents cross-device profiling
- Keeps browsing device-local

**Recommendation:**
✅ **DISABLE** if you don't need sync or prefer privacy  
❌ **KEEP ENABLED** if you use Brave Sync across devices

---

### ⚙️ Spellcheck

**What it does:**
Real-time spelling correction with red underlines for misspelled words.

**Effect when disabled:**
- No spell checking in text fields
- No spelling suggestions

**Privacy Impact:** LOW
- Some cloud-based spellcheck sends text to servers
- Brave uses local spellcheck by default

**Performance Impact:** LOW
- Minimal CPU usage for checking

**Recommendation:**
❌ **KEEP ENABLED** for most users  
✅ **DISABLE** only if privacy-paranoid

---

### ⚙️ Page Translation

**What it does:**
Offers to translate foreign language pages using translation services.

**Effect when disabled:**
- Removes translation offers
- No automatic language detection
- Blocks translation functionality

**Privacy Impact:** MEDIUM
- Prevents sending page content to translation services (Google Translate)
- Stops language preference tracking

**Performance Impact:** LOW

**Recommendation:**
✅ **DISABLE** if you don't need translation (better privacy)  
❌ **KEEP ENABLED** if you frequently visit foreign language sites

---

### ⚙️ Printing

**What it does:**
Ability to print web pages via Ctrl+P or Print menu.

**Effect when disabled:**
- Completely removes printing capability
- No print preview or print-to-PDF

**Privacy Impact:** NONE

**Performance Impact:** NONE

**Recommendation:**
❌ **KEEP ENABLED** for normal use  
✅ **DISABLE** only in restricted environments (kiosks, parental controls)

---

### ⚙️ PDF Viewer (External)

**What it does:**
Controls whether PDFs open in browser or external application.

**Effect when enabled:**
- Forces PDFs to open in external apps (Adobe, Foxit, etc.)
- Bypasses built-in PDF viewer

**Privacy Impact:** LOW
- Reduces browser attack surface
- Built-in PDF viewers can have security vulnerabilities

**Performance Impact:** NEUTRAL
- External PDF readers may be faster or slower

**Recommendation:**
✅ **ENABLE** if you prefer external PDF tools  
❌ **KEEP DISABLED** if you like browser PDF viewing

---

### ⚙️ Developer Tools

**What it does:**
Built-in debugging and development tools (F12, Inspect Element, Console, Network tab).

**Effect when disabled:**
- Completely blocks DevTools access
- No View Source, Inspect, or Console
- Prevents debugging and development

**Privacy Impact:** NONE

**Performance Impact:** NONE

**Recommendation:**
❌ **KEEP ENABLED** for normal users and developers  
✅ **DISABLE** only for parental controls or restricted environments

---

### ⚙️ Incognito Mode Control

**What it does:**
Controls availability of private browsing mode.

**Options:**
- **0**: Available (default)
- **1**: Disabled (blocks incognito)
- **2**: Forced (always incognito)

**Effect:**
- **Disabled**: Removes incognito option entirely (parental controls)
- **Forced**: All windows are incognito (maximum privacy, but may break some sites)

**Privacy Impact:** VARIABLE
- Forced incognito increases privacy
- Disabled incognito helps parental controls

**Recommendation:**
- **Keep Default** for normal use
- **Force** for maximum privacy (Ghost Mode preset)
- **Disable** for parental controls (Guardian Mode preset)

---

### ⚙️ Force SafeSearch

**What it does:**
Enforces Google SafeSearch filtering on all Google searches, filtering explicit content.

**Effect when enabled:**
- Automatically adds SafeSearch parameters to Google
- Cannot disable SafeSearch manually
- Filters adult content from results

**Privacy Impact:** NEGATIVE
- May reduce privacy via forced search parameters
- Search queries show SafeSearch enforcement

**Performance Impact:** NONE

**Recommendation:**
❌ **KEEP DISABLED** for normal use  
✅ **ENABLE** for family-safe browsing or parental controls (Guardian Mode)

---

### ⚙️ Background Mode

**What it does:**
Keeps Brave running in background when all windows are closed. Allows notifications, updates, and background tasks.

**Effect when disabled:**
- Browser fully exits when all windows close
- No background processes remain
- Stops background notifications

**Privacy Impact:** LOW
- Reduces background activity and connections

**Performance Impact:** MEDIUM
- **Frees significant memory** when browser closed
- Stops unnecessary background processes
- True exit when closing browser

**Recommendation:**
✅ **DISABLE** to fully close browser and save resources  
Most users don't need background operation

---

## DNS Over HTTPS

**What it is:**
DNS Over HTTPS (DoH) encrypts DNS queries (domain name lookups) using HTTPS instead of plain DNS.

### Traditional DNS (Unencrypted)
```
You → ISP DNS Server (unencrypted) → Website
      ↑ ISP can see every website you visit
```

### DNS Over HTTPS (Encrypted)  
```
You → DoH Provider (encrypted) → Website
      ↑ ISP only sees you connecting to DoH provider
```

### Options in Debrave:

**1. Automatic (Recommended)**
- Uses Brave's selection of DoH providers
- Automatically chooses fastest secure DNS
- Balance of privacy, security, and speed

**Privacy:** HIGH - Encrypted from ISP  
**Performance:** GOOD - Optimized selection  
**Recommendation:** Best for most users

**2. Off (Plain DNS)**
- Uses traditional unencrypted DNS
- DNS queries visible to ISP
- No DoH overhead

**Privacy:** LOW - ISP can see all domain lookups  
**Performance:** SLIGHTLY FASTER - No encryption overhead  
**Recommendation:** Only for Ghost Mode (prevents DoH provider logging)

### Privacy Trade-off:

**Traditional DNS:**
- ISP sees every domain you visit
- Government/ISP can log and monitor

**DNS Over HTTPS:**
- ISP can't see domains
- DoH **provider** can now see domains instead
- Trust shifts from ISP to DoH provider

### Which is more private?

**Depends on your threat model:**
- Trust DoH provider more than ISP → Use DoH
- Don't trust any provider → Use plain DNS + VPN
- Advanced users → Use VPN (which encrypts all DNS anyway)

**Recommendation for most users:** **Automatic DoH**

---

## Preset Configurations

Debrave includes 5 carefully designed presets for different use cases.

### 👻 Ghost Mode

**Philosophy:** Maximum privacy and anonymity above all else.

**Enabled Features:**
- ALL telemetry blocked
- ALL Brave features disabled (Wallet, Rewards, VPN, AI, Tor, Sync)
- ALL bloat removed (Shopping, Media, Promotions)
- Safe Browsing disabled (privacy over Google connections)
- WebRTC IP leak protection enabled
- Third-party cookies blocked
- QUIC disabled (avoids Google's protocol)
- Search suggestions disabled
- Password manager disabled
- Autofill disabled
- Browser sign-in blocked
- Background mode disabled

**DNS Mode:** Plain (off) - Avoids DoH provider logging  
**Incognito:** Forced (always private mode)

**Best For:**
- Journalists protecting sources
- Activists in restrictive environments
- Paranoid privacy enthusiasts
- Anyone who values privacy over convenience

**Trade-offs:**
- No convenience features
- Some site compatibility issues
- Manual everything

---

### ⚡ Clean & Fast

**Philosophy:** Remove bloat and maximize performance.

**Enabled Features:**
- Brave features disabled (Wallet, Rewards, VPN, AI)
- Bloat removed (Shopping List, Media, Promotions)
- All telemetry blocked
- Background mode disabled
- Safe Browsing kept (security maintained)

**DNS Mode:** Automatic DoH (speed + security)

**Best For:**
- Users who want fastest Brave experience
- Low-end hardware / slow connections
- Decluttering without extreme privacy measures
- Developers who need clean workspace

**Trade-offs:**
- Still allows some convenience features
- Moderate privacy (not maximum)

---

### 🚗 Daily Driver

**Philosophy:** Balanced privacy and convenience for everyday use.

**Enabled Features:**
- Brave features disabled (Wallet, Rewards, VPN)
- Shopping and bloat removed
- Third-party cookies blocked
- Do Not Track enabled
- Safe Browsing active (security)
- Password manager available
- Autofill available
- Metrics and URL data blocked

**DNS Mode:** Automatic DoH

**Best For:**
- Regular users balancing privacy and usability
- People who need password manager
- Everyday browsing with good privacy
- Most users (recommended default)

**Trade-offs:**
- Not maximum privacy
- Some convenience retained

---

### 💻 Dev Workspace

**Philosophy:** Clean interface for developers with essential tools.

**Enabled Features:**
- Brave features disabled (cleaner UI)
- All bloat removed
- Telemetry blocked
- Developer tools **PRESERVED**
- Autofill available (faster testing)
- Background services disabled

**DNS Mode:** Automatic DoH

**Best For:**
- Web developers
- Software engineers
- Anyone who needs DevTools
- QA testers

**Trade-offs:**
- DevTools enabled (for debugging)
- Some convenience for productivity

---

### 🛡️ Guardian Mode

**Philosophy:** Parental controls and restricted browsing.

**Enabled Features:**
- Incognito mode **BLOCKED**
- Google SafeSearch **FORCED**
- Browser sign-in disabled
- Developer tools blocked
- Printing disabled
- Brave features disabled
- All bloat removed
- Metrics reporting disabled

**DNS Mode:** Automatic (can use family-safe DNS)

**Best For:**
- Parents restricting children's browsing
- Schools and educational institutions
- Workplace restrictions
- Public/shared computers

**Trade-offs:**
- Heavily restricted functionality
- No private browsing
- Limited capabilities

---

### Preset Comparison Table

| Feature | Ghost Mode | Clean & Fast | Daily Driver | Dev Workspace | Guardian Mode |
|---------|-----------|-------------|-------------|--------------|--------------|
| **Privacy Level** | Maximum | Medium | Good | Medium | Variable |
| **Performance** | Good | Excellent | Good | Excellent | Good |
| **Usability** | Low | High | High | High | Restricted |
| **Telemetry** | Blocked | Blocked | Mostly Blocked | Blocked | Blocked |
| **Password Manager** | Disabled | Enabled | Enabled | Enabled | Disabled |
| **Developer Tools** | Enabled | Enabled | Enabled | **ENABLED** | **BLOCKED** |
| **Safe Browsing** | **Disabled** | Enabled | Enabled | Enabled | Enabled |
| **Incognito** | **Forced** | Available | Available | Available | **BLOCKED** |
| **Best For** | Paranoid | Performance | Daily Use | Developers | Parents |

---

## FAQ

### Q: Will disabling features break Brave?

**A:** No. These are all optional features. Brave's core browsing functionality works perfectly without them.

### Q: Can I re-enable features later?

**A:** Yes. Either uncheck settings in Debrave or use the "Reset All Settings" button to restore defaults.

### Q: Do I need to restart Brave after applying settings?

**A:** Yes. Registry changes require browser restart to take effect.

### Q: What's the safest preset?

**A:** "Ghost Mode" for maximum privacy, but "Daily Driver" offers best balance for most users.

### Q: Will this affect browser updates?

**A:** No. Browser updates work independently of these policy settings.

### Q: Should I disable Safe Browsing?

**A:** For most users, NO. Security protection outweighs privacy concern. Only disable if you're highly privacy-focused and confident identifying threats.

### Q: What's most important to disable?

**Priority list:**
1. **Shopping List** - Major privacy/performance impact
2. **All Telemetry** - Stops data collection
3. **Third-Party Cookies** - Essential privacy protection
4. **Background Mode** - Saves resources

### Q: Can I export my settings?

**A:** Yes. Use "Export Settings" button to save configuration as JSON file.

### Q: Does this work on Mac/Linux?

**A:** No. Debrave modifies Windows registry. MacOS/Linux users need different configuration methods.

### Q: How is this different from Brave Shields?

**A:** Brave Shields is a feature inside the browser. Debrave uses **Group Policy** to disable features at system level - deeper and more permanent.

---

## Support & Contributing

**Found an issue?** Open an issue on GitHub  
**Want to contribute?** Pull requests welcome  
**Questions?** Check documentation or open discussion

---

**Made with ❤️ by the Debrave team**  
*Take back control of your browser.*
