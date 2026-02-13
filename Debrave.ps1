# Debrave - Brave Browser Debloater
# Version 1.0 - Stable Release
# Complete UI/UX Redesign with State Management

# ============================================
# ADMIN CHECK
# ============================================
if (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Start-Process powershell -ArgumentList "-File `"$($MyInvocation.MyCommand.Path)`"" -Verb RunAs
    exit
}

Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

Clear-Host

# ============================================
# FEATURE DEFINITIONS
# ============================================
$script:FeatureDefinitions = @{
    # CORE FEATURES
    "BraveWalletDisabled"                     = @{
        Name          = "Disable Brave Wallet"
        Category      = "CORE"
        Description   = "Removes Brave Wallet icon and functionality from browser"
        RegistryKey   = "BraveWalletDisabled"
        RegistryValue = 1
        RegistryType  = "DWord"
        DefaultValue  = 0
    }
    "BraveRewardsDisabled"                    = @{
        Name          = "Disable Brave Rewards"
        Category      = "CORE"
        Description   = "Disables Brave Rewards and BAT token functionality"
        RegistryKey   = "BraveRewardsDisabled"
        RegistryValue = 1
        RegistryType  = "DWord"
        DefaultValue  = 0
    }
    "BraveVPNDisabled"                        = @{
        Name          = "Disable Brave VPN"
        Category      = "CORE"
        Description   = "Removes Brave VPN promotional content and features"
        RegistryKey   = "BraveVPNDisabled"
        RegistryValue = 1
        RegistryType  = "DWord"
        DefaultValue  = 0
    }
    "BraveAIChatEnabled"                      = @{
        Name          = "Disable Brave AI Chat"
        Category      = "CORE"
        Description   = "Disables Leo AI assistant integration"
        RegistryKey   = "BraveAIChatEnabled"
        RegistryValue = 0
        RegistryType  = "DWord"
        DefaultValue  = 1
    }
    "TorDisabled"                             = @{
        Name          = "Disable Tor"
        Category      = "CORE"
        Description   = "Removes Tor private window option"
        RegistryKey   = "TorDisabled"
        RegistryValue = 1
        RegistryType  = "DWord"
        DefaultValue  = 0
    }
    "ShoppingListEnabled"                     = @{
        Name          = "Disable Shopping List"
        Category      = "CORE"
        Description   = "Disables shopping list and price tracking features"
        RegistryKey   = "ShoppingListEnabled"
        RegistryValue = 0
        RegistryType  = "DWord"
        DefaultValue  = 1
    }
    "MediaRecommendationsEnabled"             = @{
        Name          = "Disable Media Recommendations"
        Category      = "CORE"
        Description   = "Removes suggested content on new tab page"
        RegistryKey   = "MediaRecommendationsEnabled"
        RegistryValue = 0
        RegistryType  = "DWord"
        DefaultValue  = 1
    }
    "PromotionsEnabled"                       = @{
        Name          = "Disable Promotions"
        Category      = "CORE"
        Description   = "Blocks promotional banners and notifications"
        RegistryKey   = "PromotionsEnabled"
        RegistryValue = 0
        RegistryType  = "DWord"
        DefaultValue  = 1
    }
    "SyncDisabled"                            = @{
        Name          = "Disable Sync"
        Category      = "CORE"
        Description   = "Disables Brave Sync functionality"
        RegistryKey   = "SyncDisabled"
        RegistryValue = 1
        RegistryType  = "DWord"
        DefaultValue  = 0
    }
    "DefaultBrowserSettingEnabled"            = @{
        Name          = "Disable Default Browser Prompt"
        Category      = "CORE"
        Description   = "Stops prompts to set Brave as default browser"
        RegistryKey   = "DefaultBrowserSettingEnabled"
        RegistryValue = 0
        RegistryType  = "DWord"
        DefaultValue  = 1
    }
    
    # SECURITY & PRIVACY
    "SafeBrowsingProtectionLevel"             = @{
        Name          = "Disable Safe Browsing"
        Category      = "SECURITY"
        Description   = "Disables Google Safe Browsing checks (privacy trade-off)"
        RegistryKey   = "SafeBrowsingProtectionLevel"
        RegistryValue = 0
        RegistryType  = "DWord"
        DefaultValue  = 1
    }
    "WebRtcIPHandling"                        = @{
        Name          = "Protect Against WebRTC IP Leak"
        Category      = "SECURITY"
        Description   = "Prevents WebRTC from leaking your real IP address"
        RegistryKey   = "WebRtcIPHandling"
        RegistryValue = "disable_non_proxied_udp"
        RegistryType  = "String"
        DefaultValue  = "default"
    }
    "BlockThirdPartyCookies"                  = @{
        Name          = "Block Third Party Cookies"
        Category      = "SECURITY"
        Description   = "Blocks tracking cookies from third-party domains"
        RegistryKey   = "BlockThirdPartyCookies"
        RegistryValue = 1
        RegistryType  = "DWord"
        DefaultValue  = 0
    }
    "EnableDoNotTrack"                        = @{
        Name          = "Enable Do Not Track"
        Category      = "SECURITY"
        Description   = "Sends Do Not Track (DNT) header with requests"
        RegistryKey   = "EnableDoNotTrack"
        RegistryValue = 1
        RegistryType  = "DWord"
        DefaultValue  = 0
    }
    "QuicAllowed"                             = @{
        Name          = "Disable QUIC Protocol"
        Category      = "SECURITY"
        Description   = "Disables QUIC protocol (may improve privacy)"
        RegistryKey   = "QuicAllowed"
        RegistryValue = 0
        RegistryType  = "DWord"
        DefaultValue  = 1
    }
    "IPFSEnabled"                             = @{
        Name          = "Disable IPFS"
        Category      = "SECURITY"
        Description   = "Disables IPFS decentralized protocol support"
        RegistryKey   = "IPFSEnabled"
        RegistryValue = 0
        RegistryType  = "DWord"
        DefaultValue  = 1
    }
    
    # DATA & TRACKING
    "MetricsReportingEnabled"                 = @{
        Name          = "Disable Metrics Reporting"
        Category      = "DATA"
        Description   = "Stops anonymous usage statistics collection"
        RegistryKey   = "MetricsReportingEnabled"
        RegistryValue = 0
        RegistryType  = "DWord"
        DefaultValue  = 1
    }
    "SafeBrowsingExtendedReportingEnabled"    = @{
        Name          = "Disable Safe Browsing Reports"
        Category      = "DATA"
        Description   = "Stops sending detailed threat reports to Google"
        RegistryKey   = "SafeBrowsingExtendedReportingEnabled"
        RegistryValue = 0
        RegistryType  = "DWord"
        DefaultValue  = 0
    }
    "UrlKeyedAnonymizedDataCollectionEnabled" = @{
        Name          = "Disable URL Data Collection"
        Category      = "DATA"
        Description   = "Prevents URL-based data collection"
        RegistryKey   = "UrlKeyedAnonymizedDataCollectionEnabled"
        RegistryValue = 0
        RegistryType  = "DWord"
        DefaultValue  = 1
    }
    "FeedbackSurveysEnabled"                  = @{
        Name          = "Disable Feedback Surveys"
        Category      = "DATA"
        Description   = "Blocks user feedback survey prompts"
        RegistryKey   = "FeedbackSurveysEnabled"
        RegistryValue = 0
        RegistryType  = "DWord"
        DefaultValue  = 1
    }
    "SearchSuggestEnabled"                    = @{
        Name          = "Disable Search Suggestions"
        Category      = "DATA"
        Description   = "Disables search suggestions in address bar"
        RegistryKey   = "SearchSuggestEnabled"
        RegistryValue = 0
        RegistryType  = "DWord"
        DefaultValue  = 1
    }
    
    # BROWSER CONTROLS
    "PasswordManagerEnabled"                  = @{
        Name          = "Disable Password Manager"
        Category      = "CONTROLS"
        Description   = "Disables built-in password manager"
        RegistryKey   = "PasswordManagerEnabled"
        RegistryValue = 0
        RegistryType  = "DWord"
        DefaultValue  = 1
    }
    "AutofillAddressEnabled"                  = @{
        Name          = "Disable Autofill (Addresses)"
        Category      = "CONTROLS"
        Description   = "Disables address autofill functionality"
        RegistryKey   = "AutofillAddressEnabled"
        RegistryValue = 0
        RegistryType  = "DWord"
        DefaultValue  = 1
    }
    "AutofillCreditCardEnabled"               = @{
        Name          = "Disable Autofill (Credit Cards)"
        Category      = "CONTROLS"
        Description   = "Disables credit card autofill"
        RegistryKey   = "AutofillCreditCardEnabled"
        RegistryValue = 0
        RegistryType  = "DWord"
        DefaultValue  = 1
    }
    "BrowserSignin"                           = @{
        Name          = "Disable Browser Sign-in"
        Category      = "CONTROLS"
        Description   = "Prevents signing into browser with Google account"
        RegistryKey   = "BrowserSignin"
        RegistryValue = 0
        RegistryType  = "DWord"
        DefaultValue  = 1
    }
    "SpellcheckEnabled"                       = @{
        Name          = "Disable Spellcheck"
        Category      = "CONTROLS"
        Description   = "Disables spell checking in text fields"
        RegistryKey   = "SpellcheckEnabled"
        RegistryValue = 0
        RegistryType  = "DWord"
        DefaultValue  = 1
    }
    "TranslateEnabled"                        = @{
        Name          = "Disable Page Translation"
        Category      = "CONTROLS"
        Description   = "Disables automatic page translation offers"
        RegistryKey   = "TranslateEnabled"
        RegistryValue = 0
        RegistryType  = "DWord"
        DefaultValue  = 1
    }
    "PrintingEnabled"                         = @{
        Name          = "Disable Printing"
        Category      = "CONTROLS"
        Description   = "Disables printing functionality"
        RegistryKey   = "PrintingEnabled"
        RegistryValue = 0
        RegistryType  = "DWord"
        DefaultValue  = 1
    }
    "AlwaysOpenPdfExternally"                 = @{
        Name          = "Always Open PDFs Externally"
        Category      = "CONTROLS"
        Description   = "Forces PDFs to open in external viewer"
        RegistryKey   = "AlwaysOpenPdfExternally"
        RegistryValue = 1
        RegistryType  = "DWord"
        DefaultValue  = 0
    }
    "DeveloperToolsDisabled"                  = @{
        Name          = "Disable Developer Tools"
        Category      = "CONTROLS"
        Description   = "Blocks access to F12 developer tools"
        RegistryKey   = "DeveloperToolsDisabled"
        RegistryValue = 1
        RegistryType  = "DWord"
        DefaultValue  = 0
    }
    "IncognitoModeBlock"                      = @{
        Name          = "Block Incognito Mode"
        Category      = "CONTROLS"
        Description   = "Prevents opening incognito windows"
        RegistryKey   = "IncognitoModeAvailability"
        RegistryValue = 1
        RegistryType  = "DWord"
        DefaultValue  = 0
    }
    "IncognitoModeForce"                      = @{
        Name          = "Force Incognito Mode Always"
        Category      = "CONTROLS"
        Description   = "Forces all browsing to be incognito"
        RegistryKey   = "IncognitoModeAvailability"
        RegistryValue = 2
        RegistryType  = "DWord"
        DefaultValue  = 0
    }
    "ForceGoogleSafeSearch"                   = @{
        Name          = "Force Google SafeSearch"
        Category      = "CONTROLS"
        Description   = "Enforces SafeSearch on Google searches"
        RegistryKey   = "ForceGoogleSafeSearch"
        RegistryValue = 1
        RegistryType  = "DWord"
        DefaultValue  = 0
    }
    "BackgroundModeEnabled"                   = @{
        Name          = "Disable Background Mode"
        Category      = "CONTROLS"
        Description   = "Prevents Brave from running in background"
        RegistryKey   = "BackgroundModeEnabled"
        RegistryValue = 0
        RegistryType  = "DWord"
        DefaultValue  = 1
    }
}

# ============================================
# STATE MANAGEMENT
# ============================================
$global:DebraveState = @{
    RegistryPath     = "HKLM:\SOFTWARE\Policies\BraveSoftware\Brave"
    Features         = @{}
    CheckboxControls = @{}
    CurrentPreset    = "-- Select --"
    DnsMode          = "off"
    IsDirty          = $false
    StatusLabel      = $null
    Tooltip          = $null
}

# Ensure registry path exists
if (-not (Test-Path -Path $global:DebraveState.RegistryPath)) {
    New-Item -Path $global:DebraveState.RegistryPath -Force | Out-Null
}

# ============================================
# HELPER FUNCTIONS
# ============================================

function Update-Status {
    param(
        [string]$Message,
        [string]$Type = "Info"  # Success, Error, Warning, Info
    )
    
    if ($global:DebraveState.StatusLabel) {
        $colors = @{
            Success = [System.Drawing.Color]::FromArgb(255, 0, 255, 0)
            Error   = [System.Drawing.Color]::FromArgb(255, 255, 50, 50)
            Warning = [System.Drawing.Color]::FromArgb(255, 255, 193, 7)
            Info    = [System.Drawing.Color]::FromArgb(255, 100, 200, 255)
        }
        
        $global:DebraveState.StatusLabel.Text = "Status: $Message"
        $global:DebraveState.StatusLabel.ForeColor = $colors[$Type]
        $global:DebraveState.StatusLabel.Refresh()
    }
}

function Read-BraveConfig {
    Update-Status "Reading current Brave configuration..." "Info"
    
    $currentConfig = @{}
    $registryPath = $global:DebraveState.RegistryPath
    
    if (Test-Path $registryPath) {
        foreach ($key in $script:FeatureDefinitions.Keys) {
            $feature = $script:FeatureDefinitions[$key]
            try {
                $value = Get-ItemProperty -Path $registryPath -Name $feature.RegistryKey -ErrorAction SilentlyContinue
                if ($null -ne $value) {
                    $currentConfig[$key] = $value.($feature.RegistryKey)
                }
                else {
                    $currentConfig[$key] = $feature.DefaultValue
                }
            }
            catch {
                $currentConfig[$key] = $feature.DefaultValue
            }
        }
    }
    else {
        foreach ($key in $script:FeatureDefinitions.Keys) {
            $currentConfig[$key] = $script:FeatureDefinitions[$key].DefaultValue
        }
    }
    
    Update-Status "Configuration loaded" "Success"
    return $currentConfig
}

function Apply-Settings {
    Update-Status "Applying settings..." "Info"
    
    $results = @{
        Success = @()
        Failed  = @()
    }
    
    $registryPath = $global:DebraveState.RegistryPath
    
    try {
        foreach ($key in $global:DebraveState.CheckboxControls.Keys) {
            $checkbox = $global:DebraveState.CheckboxControls[$key]
            $feature = $script:FeatureDefinitions[$key]
            
            if ($checkbox.Checked) {
                try {
                    Set-ItemProperty -Path $registryPath `
                        -Name $feature.RegistryKey `
                        -Value $feature.RegistryValue `
                        -Type $feature.RegistryType `
                        -Force
                    $results.Success += $feature.Name
                }
                catch {
                    $results.Failed += @{
                        Feature = $feature.Name
                        Error   = $_.Exception.Message
                    }
                }
            }
            else {
                # Remove or set to default
                try {
                    Remove-ItemProperty -Path $registryPath -Name $feature.RegistryKey -ErrorAction SilentlyContinue
                }
                catch {
                    # Ignore removal errors
                }
            }
        }
        
        if ($results.Failed.Count -gt 0) {
            $errorMsg = "Applied $($results.Success.Count) settings, $($results.Failed.Count) failed"
            Update-Status $errorMsg "Warning"
            [System.Windows.Forms.MessageBox]::Show($errorMsg, "Partial Success", [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Warning)
        }
        else {
            Update-Status "All settings applied successfully!" "Success"
            [System.Windows.Forms.MessageBox]::Show("Applied $($results.Success.Count) settings successfully!`n`nPlease restart Brave Browser.", "Success", [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Information)
        }
        
        $global:DebraveState.IsDirty = $false
        
    }
    catch {
        Update-Status "Critical error during apply" "Error"
        [System.Windows.Forms.MessageBox]::Show("Critical error: $($_.Exception.Message)", "Error", [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Error)
    }
}

# ============================================
# CREATE MAIN FORM WITH TABLE LAYOUT
# ============================================
$form = New-Object System.Windows.Forms.Form
$form.Text = "Debrave - Brave Browser Debloater v1.0"
$form.Size = New-Object System.Drawing.Size(1100, 800)
$form.MinimumSize = New-Object System.Drawing.Size(1100, 600)  # Allow resizing
$form.StartPosition = "CenterScreen"
$form.BackColor = [System.Drawing.Color]::FromArgb(255, 12, 12, 12)
$form.ForeColor = [System.Drawing.Color]::White
$form.FormBorderStyle = [System.Windows.Forms.FormBorderStyle]::Sizable

# Load icon if exists
if (Test-Path "debrave.ico") {
    try {
        $form.Icon = [System.Drawing.Icon]::ExtractAssociatedIcon((Resolve-Path "debrave.ico").Path)
    }
    catch {
        Write-Host "Could not load icon: $_"
    }
}

# ============================================
# TABLE LAYOUT PANEL (3 ROWS)
# ============================================
$mainLayout = New-Object System.Windows.Forms.TableLayoutPanel
$mainLayout.Dock = [System.Windows.Forms.DockStyle]::Fill
$mainLayout.ColumnCount = 1
$mainLayout.RowCount = 3
$mainLayout.BackColor = [System.Drawing.Color]::FromArgb(255, 12, 12, 12)

# Row Styles
$mainLayout.RowStyles.Add((New-Object System.Windows.Forms.RowStyle([System.Windows.Forms.SizeType]::Absolute, 90))) | Out-Null   # Header
$mainLayout.RowStyles.Add((New-Object System.Windows.Forms.RowStyle([System.Windows.Forms.SizeType]::Percent, 100))) | Out-Null   # Content (Fill)
$mainLayout.RowStyles.Add((New-Object System.Windows.Forms.RowStyle([System.Windows.Forms.SizeType]::Absolute, 90))) | Out-Null   # Bottom Bar

$form.Controls.Add($mainLayout)

# ============================================
# ROW 0: HEADER PANEL
# ============================================
$headerPanel = New-Object System.Windows.Forms.Panel
$headerPanel.Dock = [System.Windows.Forms.DockStyle]::Fill
$headerPanel.BackColor = [System.Drawing.Color]::FromArgb(255, 12, 12, 12)
$headerPanel.Padding = New-Object System.Windows.Forms.Padding(20, 10, 20, 10)

# Header Title
$headerLabel = New-Object System.Windows.Forms.Label
$headerLabel.Text = "DEBRAVE"
$headerLabel.Font = New-Object System.Drawing.Font("Segoe UI", 24, [System.Drawing.FontStyle]::Bold)
$headerLabel.Location = New-Object System.Drawing.Point(20, 15)
$headerLabel.Size = New-Object System.Drawing.Size(300, 45)
$headerLabel.ForeColor = [System.Drawing.Color]::FromArgb(255, 0, 217, 255)
$headerPanel.Controls.Add($headerLabel)

$taglineLabel = New-Object System.Windows.Forms.Label
$taglineLabel.Text = "Take Back Control of Your Browser"
$taglineLabel.Font = New-Object System.Drawing.Font("Segoe UI", 9, [System.Drawing.FontStyle]::Italic)
$taglineLabel.Location = New-Object System.Drawing.Point(25, 60)
$taglineLabel.Size = New-Object System.Drawing.Size(300, 20)
$taglineLabel.ForeColor = [System.Drawing.Color]::FromArgb(255, 168, 85, 247)
$headerPanel.Controls.Add($taglineLabel)

# Creator credit
$creditLabel = New-Object System.Windows.Forms.Label
$creditLabel.Text = "by alvadyza"
$creditLabel.Font = New-Object System.Drawing.Font("Segoe UI", 8, [System.Drawing.FontStyle]::Italic)
$creditLabel.Location = New-Object System.Drawing.Point(230, 25)
$creditLabel.Size = New-Object System.Drawing.Size(100, 15)
$creditLabel.ForeColor = [System.Drawing.Color]::FromArgb(255, 150, 150, 150)
$headerPanel.Controls.Add($creditLabel)

# Preset Dropdown (Top Right)
$presetLabel = New-Object System.Windows.Forms.Label
$presetLabel.Text = "Quick Preset:"
$presetLabel.Location = New-Object System.Drawing.Point(680, 25)
$presetLabel.Size = New-Object System.Drawing.Size(100, 20)
$presetLabel.ForeColor = [System.Drawing.Color]::White
$headerPanel.Controls.Add($presetLabel)

$presetDropdown = New-Object System.Windows.Forms.ComboBox
$presetDropdown.Items.AddRange(@("-- Select --", "Hardcore Mode", "Performance", "Normal", "Default"))
$presetDropdown.SelectedIndex = 0
$presetDropdown.Location = New-Object System.Drawing.Point(680, 48)
$presetDropdown.Size = New-Object System.Drawing.Size(220, 25)
$presetDropdown.DropDownStyle = [System.Windows.Forms.ComboBoxStyle]::DropDownList
$presetDropdown.BackColor = [System.Drawing.Color]::FromArgb(255, 30, 30, 30)
$presetDropdown.ForeColor = [System.Drawing.Color]::White
$presetDropdown.FlatStyle = [System.Windows.Forms.FlatStyle]::Flat
$headerPanel.Controls.Add($presetDropdown)

$loadPresetBtn = New-Object System.Windows.Forms.Button
$loadPresetBtn.Text = "Load"
$loadPresetBtn.Location = New-Object System.Drawing.Point(910, 47)
$loadPresetBtn.Size = New-Object System.Drawing.Size(120, 27)
$loadPresetBtn.BackColor = [System.Drawing.Color]::FromArgb(255, 255, 193, 7)
$loadPresetBtn.ForeColor = [System.Drawing.Color]::Black
$loadPresetBtn.FlatStyle = [System.Windows.Forms.FlatStyle]::Flat
$loadPresetBtn.Font = New-Object System.Drawing.Font("Segoe UI", 9, [System.Drawing.FontStyle]::Bold)
$loadPresetBtn.Cursor = [System.Windows.Forms.Cursors]::Hand
$headerPanel.Controls.Add($loadPresetBtn)

$mainLayout.Controls.Add($headerPanel, 0, 0)

# ============================================
# ROW 1: MAIN CONTENT (NESTED 2-COLUMN TABLELAYOUT)
# ============================================
# Create nested TableLayoutPanel for 2-column layout
$contentLayout = New-Object System.Windows.Forms.TableLayoutPanel
$contentLayout.Dock = [System.Windows.Forms.DockStyle]::Fill
$contentLayout.ColumnCount = 2
$contentLayout.RowCount = 1
$contentLayout.BackColor = [System.Drawing.Color]::FromArgb(255, 12, 12, 12)
$contentLayout.Padding = New-Object System.Windows.Forms.Padding(20, 10, 20, 10)
$contentLayout.ColumnStyles.Add((New-Object System.Windows.Forms.ColumnStyle([System.Windows.Forms.SizeType]::Percent, 50))) | Out-Null
$contentLayout.ColumnStyles.Add((New-Object System.Windows.Forms.ColumnStyle([System.Windows.Forms.SizeType]::Percent, 50))) | Out-Null
$contentLayout.RowStyles.Add((New-Object System.Windows.Forms.RowStyle([System.Windows.Forms.SizeType]::Percent, 100))) | Out-Null

# Left Panel (CORE + SECURITY) - DOCKED IN COLUMN 0
$leftPanel = New-Object System.Windows.Forms.Panel
$leftPanel.Dock = [System.Windows.Forms.DockStyle]::Fill
$leftPanel.BackColor = [System.Drawing.Color]::FromArgb(255, 24, 24, 24)
$leftPanel.BorderStyle = [System.Windows.Forms.BorderStyle]::FixedSingle
$leftPanel.AutoScroll = $true
$leftPanel.Padding = New-Object System.Windows.Forms.Padding(20)
$contentLayout.Controls.Add($leftPanel, 0, 0)

# Right Panel (DATA + CONTROLS) - DOCKED IN COLUMN 1
$rightPanel = New-Object System.Windows.Forms.Panel
$rightPanel.Dock = [System.Windows.Forms.DockStyle]::Fill
$rightPanel.BackColor = [System.Drawing.Color]::FromArgb(255, 24, 24, 24)
$rightPanel.BorderStyle = [System.Windows.Forms.BorderStyle]::FixedSingle
$rightPanel.AutoScroll = $true
$rightPanel.Padding = New-Object System.Windows.Forms.Padding(20)
$contentLayout.Controls.Add($rightPanel, 1, 0)

$mainLayout.Controls.Add($contentLayout, 0, 1)

# Initialize tooltip
$global:DebraveState.Tooltip = New-Object System.Windows.Forms.ToolTip
$global:DebraveState.Tooltip.AutoPopDelay = 5000
$global:DebraveState.Tooltip.InitialDelay = 500

[int]$y = 10

# ============================================
# LEFT PANEL: CORE FEATURES
# ============================================
$coreLabel = New-Object System.Windows.Forms.Label
$coreLabel.Text = "CORE FEATURES"
$coreLabel.Font = New-Object System.Drawing.Font("Segoe UI", 10, [System.Drawing.FontStyle]::Bold)
$coreLabel.Location = New-Object System.Drawing.Point(10, $y)
$coreLabel.Size = New-Object System.Drawing.Size(480, 25)
$coreLabel.ForeColor = [System.Drawing.Color]::FromArgb(255, 0, 217, 255)
$leftPanel.Controls.Add($coreLabel)
$y += 30

# Add CORE features
$coreFeatures = $script:FeatureDefinitions.GetEnumerator() | Where-Object { $_.Value.Category -eq "CORE" }
foreach ($entry in $coreFeatures) {
    $key = $entry.Key
    $feature = $entry.Value
    
    $checkbox = New-Object System.Windows.Forms.CheckBox
    $checkbox.Text = $feature.Name
    $checkbox.Location = New-Object System.Drawing.Point(20, $y)
    $checkbox.Size = New-Object System.Drawing.Size(460, 24)
    $checkbox.FlatStyle = [System.Windows.Forms.FlatStyle]::Standard
    $checkbox.ForeColor = [System.Drawing.Color]::White
    $checkbox.Font = New-Object System.Drawing.Font("Segoe UI", 9)
    $checkbox.Cursor = [System.Windows.Forms.Cursors]::Hand
    
    $global:DebraveState.Tooltip.SetToolTip($checkbox, $feature.Description)
    
    $checkbox.Add_CheckedChanged({
            $global:DebraveState.IsDirty = $true
        })
    
    $leftPanel.Controls.Add($checkbox)
    $global:DebraveState.CheckboxControls[$key] = $checkbox
    $y += 28
}

$y += 20

# SECURITY & PRIVACY Section
$securityLabel = New-Object System.Windows.Forms.Label
$securityLabel.Text = "SECURITY & PRIVACY"
$securityLabel.Font = New-Object System.Drawing.Font("Segoe UI", 10, [System.Drawing.FontStyle]::Bold)
$securityLabel.Location = New-Object System.Drawing.Point(10, $y)
$securityLabel.Size = New-Object System.Drawing.Size(480, 25)
$securityLabel.ForeColor = [System.Drawing.Color]::FromArgb(255, 0, 217, 255)
$leftPanel.Controls.Add($securityLabel)
$y += 30

# Add SECURITY features
$securityFeatures = $script:FeatureDefinitions.GetEnumerator() | Where-Object { $_.Value.Category -eq "SECURITY" }
foreach ($entry in $securityFeatures) {
    $key = $entry.Key
    $feature = $entry.Value
    
    $checkbox = New-Object System.Windows.Forms.CheckBox
    $checkbox.Text = $feature.Name
    $checkbox.Location = New-Object System.Drawing.Point(20, $y)
    $checkbox.Size = New-Object System.Drawing.Size(460, 24)
    $checkbox.FlatStyle = [System.Windows.Forms.FlatStyle]::Standard
    $checkbox.ForeColor = [System.Drawing.Color]::White
    $checkbox.Font = New-Object System.Drawing.Font("Segoe UI", 9)
    $checkbox.Cursor = [System.Windows.Forms.Cursors]::Hand
    
    $global:DebraveState.Tooltip.SetToolTip($checkbox, $feature.Description)
    
    $checkbox.Add_CheckedChanged({
            $global:DebraveState.IsDirty = $true
        })
    
    $leftPanel.Controls.Add($checkbox)
    $global:DebraveState.CheckboxControls[$key] = $checkbox
    $y += 28
}

# ============================================
# RIGHT PANEL: DATA & TRACKING
# ============================================
$y = 10

$dataLabel = New-Object System.Windows.Forms.Label
$dataLabel.Text = "DATA & TRACKING"
$dataLabel.Font = New-Object System.Drawing.Font("Segoe UI", 10, [System.Drawing.FontStyle]::Bold)
$dataLabel.Location = New-Object System.Drawing.Point(10, $y)
$dataLabel.Size = New-Object System.Drawing.Size(480, 25)
$dataLabel.ForeColor = [System.Drawing.Color]::FromArgb(255, 168, 85, 247)
$rightPanel.Controls.Add($dataLabel)
$y += 30

# Add DATA features
$dataFeatures = $script:FeatureDefinitions.GetEnumerator() | Where-Object { $_.Value.Category -eq "DATA" }
foreach ($entry in $dataFeatures) {
    $key = $entry.Key
    $feature = $entry.Value
    
    $checkbox = New-Object System.Windows.Forms.CheckBox
    $checkbox.Text = $feature.Name
    $checkbox.Location = New-Object System.Drawing.Point(20, $y)
    $checkbox.Size = New-Object System.Drawing.Size(460, 24)
    $checkbox.FlatStyle = [System.Windows.Forms.FlatStyle]::Standard
    $checkbox.ForeColor = [System.Drawing.Color]::White
    $checkbox.Font = New-Object System.Drawing.Font("Segoe UI", 9)
    $checkbox.Cursor = [System.Windows.Forms.Cursors]::Hand
    
    $global:DebraveState.Tooltip.SetToolTip($checkbox, $feature.Description)
    
    $checkbox.Add_CheckedChanged({
            $global:DebraveState.IsDirty = $true
        })
    
    $rightPanel.Controls.Add($checkbox)
    $global:DebraveState.CheckboxControls[$key] = $checkbox
    $y += 28
}

$y += 20

# BROWSER CONTROLS Section
$controlsLabel = New-Object System.Windows.Forms.Label
$controlsLabel.Text = "BROWSER CONTROLS"
$controlsLabel.Font = New-Object System.Drawing.Font("Segoe UI", 10, [System.Drawing.FontStyle]::Bold)
$controlsLabel.Location = New-Object System.Drawing.Point(10, $y)
$controlsLabel.Size = New-Object System.Drawing.Size(480, 25)
$controlsLabel.ForeColor = [System.Drawing.Color]::FromArgb(255, 168, 85, 247)
$rightPanel.Controls.Add($controlsLabel)
$y += 30

# Add CONTROLS features
$controlsFeatures = $script:FeatureDefinitions.GetEnumerator() | Where-Object { $_.Value.Category -eq "CONTROLS" }
foreach ($entry in $controlsFeatures) {
    $key = $entry.Key
    $feature = $entry.Value
    
    $checkbox = New-Object System.Windows.Forms.CheckBox
    $checkbox.Text = $feature.Name
    $checkbox.Location = New-Object System.Drawing.Point(20, $y)
    $checkbox.Size = New-Object System.Drawing.Size(460, 24)
    $checkbox.FlatStyle = [System.Windows.Forms.FlatStyle]::Standard
    $checkbox.ForeColor = [System.Drawing.Color]::White
    $checkbox.Font = New-Object System.Drawing.Font("Segoe UI", 9)
    $checkbox.Cursor = [System.Windows.Forms.Cursors]::Hand
    
    $global:DebraveState.Tooltip.SetToolTip($checkbox, $feature.Description)
    
    $checkbox.Add_CheckedChanged({
            $global:DebraveState.IsDirty = $true
        })
    
    $rightPanel.Controls.Add($checkbox)
    $global:DebraveState.CheckboxControls[$key] = $checkbox
    $y += 28
}

# ============================================
# ROW 2: BOTTOM ACTION BAR (DOCKED)
# ============================================
$bottomBar = New-Object System.Windows.Forms.Panel
$bottomBar.Dock = [System.Windows.Forms.DockStyle]::Fill
$bottomBar.BackColor = [System.Drawing.Color]::FromArgb(255, 18, 18, 18)
$bottomBar.Padding = New-Object System.Windows.Forms.Padding(20, 15, 20, 15)

# DNS Dropdown
$dnsLabel = New-Object System.Windows.Forms.Label
$dnsLabel.Text = "DNS Over HTTPS:"
$dnsLabel.Location = New-Object System.Drawing.Point(20, 20)
$dnsLabel.Size = New-Object System.Drawing.Size(120, 20)
$dnsLabel.ForeColor = [System.Drawing.Color]::White
$bottomBar.Controls.Add($dnsLabel)

$dnsDropdown = New-Object System.Windows.Forms.ComboBox
$dnsDropdown.Items.AddRange(@("off", "automatic", "secure"))
$dnsDropdown.SelectedIndex = 0
$dnsDropdown.Location = New-Object System.Drawing.Point(140, 17)
$dnsDropdown.Size = New-Object System.Drawing.Size(130, 25)
$dnsDropdown.DropDownStyle = [System.Windows.Forms.ComboBoxStyle]::DropDownList
$dnsDropdown.BackColor = [System.Drawing.Color]::FromArgb(255, 30, 30, 30)
$dnsDropdown.ForeColor = [System.Drawing.Color]::White
$dnsDropdown.FlatStyle = [System.Windows.Forms.FlatStyle]::Flat
$bottomBar.Controls.Add($dnsDropdown)

# Add DNS tooltip
$global:DebraveState.Tooltip.SetToolTip($dnsDropdown, "DNS Over HTTPS modes:`n• off = Disabled`n• automatic = System default`n• secure = Force secure DNS")

# Export Button
$exportButton = New-Object System.Windows.Forms.Button
$exportButton.Text = "Export"
$exportButton.Location = New-Object System.Drawing.Point(300, 15)
$exportButton.Size = New-Object System.Drawing.Size(110, 32)
$exportButton.BackColor = [System.Drawing.Color]::FromArgb(255, 50, 50, 50)
$exportButton.ForeColor = [System.Drawing.Color]::White
$exportButton.FlatStyle = [System.Windows.Forms.FlatStyle]::Flat
$exportButton.Cursor = [System.Windows.Forms.Cursors]::Hand
$bottomBar.Controls.Add($exportButton)

# Import Button
$importButton = New-Object System.Windows.Forms.Button
$importButton.Text = "Import"
$importButton.Location = New-Object System.Drawing.Point(420, 15)
$importButton.Size = New-Object System.Drawing.Size(110, 32)
$importButton.BackColor = [System.Drawing.Color]::FromArgb(255, 50, 50, 50)
$importButton.ForeColor = [System.Drawing.Color]::White
$importButton.FlatStyle = [System.Windows.Forms.FlatStyle]::Flat
$importButton.Cursor = [System.Windows.Forms.Cursors]::Hand
$bottomBar.Controls.Add($importButton)

# Backup Button
$backupButton = New-Object System.Windows.Forms.Button
$backupButton.Text = "Backup Original"
$backupButton.Location = New-Object System.Drawing.Point(540, 15)
$backupButton.Size = New-Object System.Drawing.Size(130, 32)
$backupButton.BackColor = [System.Drawing.Color]::FromArgb(255, 34, 139, 34)
$backupButton.ForeColor = [System.Drawing.Color]::White
$backupButton.FlatStyle = [System.Windows.Forms.FlatStyle]::Flat
$backupButton.Cursor = [System.Windows.Forms.Cursors]::Hand
$bottomBar.Controls.Add($backupButton)

# Restore Button
$restoreButton = New-Object System.Windows.Forms.Button
$restoreButton.Text = "Restore Original"
$restoreButton.Location = New-Object System.Drawing.Point(680, 15)
$restoreButton.Size = New-Object System.Drawing.Size(130, 32)
$restoreButton.BackColor = [System.Drawing.Color]::FromArgb(255, 255, 140, 0)
$restoreButton.ForeColor = [System.Drawing.Color]::Black
$restoreButton.FlatStyle = [System.Windows.Forms.FlatStyle]::Flat
$restoreButton.Cursor = [System.Windows.Forms.Cursors]::Hand
$bottomBar.Controls.Add($restoreButton)

# Apply Settings Button (PRIMARY)
$applyButton = New-Object System.Windows.Forms.Button
$applyButton.Text = "APPLY"
$applyButton.Location = New-Object System.Drawing.Point(820, 12)
$applyButton.Size = New-Object System.Drawing.Size(120, 38)
$applyButton.BackColor = [System.Drawing.Color]::FromArgb(255, 255, 193, 7)
$applyButton.ForeColor = [System.Drawing.Color]::Black
$applyButton.FlatStyle = [System.Windows.Forms.FlatStyle]::Flat
$applyButton.Font = New-Object System.Drawing.Font("Segoe UI", 10, [System.Drawing.FontStyle]::Bold)
$applyButton.Cursor = [System.Windows.Forms.Cursors]::Hand
$bottomBar.Controls.Add($applyButton)

# Reset Button
$resetButton = New-Object System.Windows.Forms.Button
$resetButton.Text = "Reset"
$resetButton.Location = New-Object System.Drawing.Point(950, 15)
$resetButton.Size = New-Object System.Drawing.Size(110, 32)
$resetButton.BackColor = [System.Drawing.Color]::FromArgb(255, 200, 50, 50)
$resetButton.ForeColor = [System.Drawing.Color]::White
$resetButton.FlatStyle = [System.Windows.Forms.FlatStyle]::Flat
$resetButton.Cursor = [System.Windows.Forms.Cursors]::Hand
$bottomBar.Controls.Add($resetButton)

# Status Label
$statusLabel = New-Object System.Windows.Forms.Label
$statusLabel.Text = "Status: Ready | Debrave v1.0 by alvadyza"
$statusLabel.Location = New-Object System.Drawing.Point(20, 55)
$statusLabel.Size = New-Object System.Drawing.Size(1040, 20)
$statusLabel.ForeColor = [System.Drawing.Color]::FromArgb(255, 100, 200, 255)
$statusLabel.Font = New-Object System.Drawing.Font("Segoe UI", 9)
$bottomBar.Controls.Add($statusLabel)
$global:DebraveState.StatusLabel = $statusLabel

$mainLayout.Controls.Add($bottomBar, 0, 2)

# ============================================
# EVENT HANDLERS
# ============================================

# Apply Button
$applyButton.Add_Click({
        Apply-Settings
    
        # Apply DNS setting with validation
        if ($dnsDropdown.SelectedItem) {
            try {
                Set-ItemProperty -Path $global:DebraveState.RegistryPath `
                    -Name "DnsOverHttpsMode" `
                    -Value $dnsDropdown.SelectedItem `
                    -Type String `
                    -Force
                
                # VALIDATE: Read back to confirm
                $verifyDns = Get-ItemProperty -Path $global:DebraveState.RegistryPath -Name "DnsOverHttpsMode" -ErrorAction SilentlyContinue
                if ($verifyDns.DnsOverHttpsMode -eq $dnsDropdown.SelectedItem) {
                    Update-Status "Settings applied | DNS mode: $($dnsDropdown.SelectedItem)" "Success"
                }
                else {
                    Update-Status "DNS mode validation failed" "Error"
                }
            }
            catch {
                Update-Status "Failed to set DNS mode: $($_.Exception.Message)" "Error"
            }
        }
    })

# Reset Button
$resetButton.Add_Click({
        $confirm = [System.Windows.Forms.MessageBox]::Show(
            "This will reset all settings to Brave defaults. Continue?",
            "Confirm Reset",
            [System.Windows.Forms.MessageBoxButtons]::YesNo,
            [System.Windows.Forms.MessageBoxIcon]::Warning
        )
    
        if ($confirm -eq "Yes") {
            try {
                # Clear all checkboxes
                foreach ($checkbox in $global:DebraveState.CheckboxControls.Values) {
                    $checkbox.Checked = $false
                }
            
                # Remove all registry keys
                Remove-Item -Path $global:DebraveState.RegistryPath -Recurse -Force -ErrorAction SilentlyContinue
                New-Item -Path $global:DebraveState.RegistryPath -Force | Out-Null
            
                # Reset DNS
                $dnsDropdown.SelectedIndex = 0
            
                Update-Status "All settings reset to defaults" "Success"
                [System.Windows.Forms.MessageBox]::Show("Settings reset successfully!", "Reset Complete", [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Information)
            }
            catch {
                Update-Status "Reset failed" "Error"
                [System.Windows.Forms.MessageBox]::Show("Error: $($_.Exception.Message)", "Reset Failed", [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Error)
            }
        }
    })

# Export Button
$exportButton.Add_Click({
        $saveDialog = New-Object System.Windows.Forms.SaveFileDialog
        $saveDialog.Filter = "JSON files (*.json)|*.json"
        $saveDialog.Title = "Export Debrave Configuration"
        $saveDialog.FileName = "debrave_config_$(Get-Date -Format 'yyyyMMdd').json"
    
        if ($saveDialog.ShowDialog() -eq [System.Windows.Forms.DialogResult]::OK) {
            try {
                $export = @{
                    Version    = "1.0"
                    ExportDate = (Get-Date).ToString("yyyy-MM-dd HH:mm:ss")
                    Preset     = $presetDropdown.SelectedItem
                    DnsMode    = $dnsDropdown.SelectedItem
                    Features   = @()
                }
            
                foreach ($key in $global:DebraveState.CheckboxControls.Keys) {
                    $checkbox = $global:DebraveState.CheckboxControls[$key]
                    if ($checkbox.Checked) {
                        $feature = $script:FeatureDefinitions[$key]
                        $export.Features += @{
                            Key     = $key
                            Name    = $feature.Name
                            Enabled = $true
                        }
                    }
                }
            
                $export | ConvertTo-Json -Depth 5 | Out-File -FilePath $saveDialog.FileName -Force -Encoding UTF8
            
                Update-Status "Configuration exported successfully" "Success"
                [System.Windows.Forms.MessageBox]::Show(
                    "Configuration exported to:`n$($saveDialog.FileName)`n`nTotal features: $($export.Features.Count)",
                    "Export Complete",
                    [System.Windows.Forms.MessageBoxButtons]::OK,
                    [System.Windows.Forms.MessageBoxIcon]::Information
                )
            }
            catch {
                Update-Status "Export failed" "Error"
                [System.Windows.Forms.MessageBox]::Show("Export failed: $($_.Exception.Message)", "Error", [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Error)
            }
        }
    })

# Import Button
$importButton.Add_Click({
        $openDialog = New-Object System.Windows.Forms.OpenFileDialog
        $openDialog.Filter = "JSON files (*.json)|*.json"
        $openDialog.Title = "Import Debrave Configuration"
    
        if ($openDialog.ShowDialog() -eq [System.Windows.Forms.DialogResult]::OK) {
            try {
                $imported = Get-Content -Path $openDialog.FileName -Raw | ConvertFrom-Json
            
                # Validate version
                if ($imported.Version -ne "1.0") {
                    throw "Incompatible file version. Expected 1.0, got $($imported.Version)"
                }
            
                # Clear all checkboxes
                foreach ($checkbox in $global:DebraveState.CheckboxControls.Values) {
                    $checkbox.Checked = $false
                }
            
                # Apply imported settings
                $importedCount = 0
                foreach ($importedFeature in $imported.Features) {
                    if ($global:DebraveState.CheckboxControls.ContainsKey($importedFeature.Key)) {
                        $global:DebraveState.CheckboxControls[$importedFeature.Key].Checked = $true
                        $importedCount++
                    }
                }
            
                # Update DNS
                if ($imported.DnsMode) {
                    $dnsDropdown.SelectedItem = $imported.DnsMode
                }
            
                # Update preset dropdown
                if ($imported.Preset) {
                    $presetDropdown.SelectedItem = $imported.Preset
                }
            
                $global:DebraveState.IsDirty = $true
            
                Update-Status "Configuration imported successfully" "Success"
                [System.Windows.Forms.MessageBox]::Show(
                    "Configuration imported from:`n$($openDialog.FileName)`n`nFeatures loaded: $importedCount`nExported: $($imported.ExportDate)",
                    "Import Complete",
                    [System.Windows.Forms.MessageBoxButtons]::OK,
                    [System.Windows.Forms.MessageBoxIcon]::Information
                )
            }
            catch {
                Update-Status "Import failed" "Error"
                [System.Windows.Forms.MessageBox]::Show("Import failed: $($_.Exception.Message)", "Error", [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Error)
            }
        }
    })

# Load Preset Button
$loadPresetBtn.Add_Click({
        $selectedPreset = $presetDropdown.SelectedItem
    
        if ($selectedPreset -eq "-- Select --") {
            [System.Windows.Forms.MessageBox]::Show("Please select a preset first.", "No Preset Selected", [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Information)
            return
        }
    
        # Clear all checkboxes first
        foreach ($checkbox in $global:DebraveState.CheckboxControls.Values) {
            $checkbox.Checked = $false
        }
    
        # Define presets
        $presets = @{
            "Hardcore Mode" = @{
                Description = "Maximum cleanup - removes all telemetry and Brave features"
                Features    = @(
                    "BraveWalletDisabled", "BraveRewardsDisabled", "BraveVPNDisabled", "BraveAIChatEnabled",
                    "TorDisabled", "ShoppingListEnabled", "MediaRecommendationsEnabled", "PromotionsEnabled",
                    "SyncDisabled", "DefaultBrowserSettingEnabled", "SafeBrowsingProtectionLevel",
                    "WebRtcIPHandling", "BlockThirdPartyCookies", "EnableDoNotTrack", "QuicAllowed",
                    "IPFSEnabled", "MetricsReportingEnabled", "SafeBrowsingExtendedReportingEnabled",
                    "UrlKeyedAnonymizedDataCollectionEnabled", "FeedbackSurveysEnabled", "SearchSuggestEnabled",
                    "PasswordManagerEnabled", "AutofillAddressEnabled", "AutofillCreditCardEnabled",
                    "BrowserSignin", "BackgroundModeEnabled"
                )
                DnsMode     = "off"
            }
            "Performance"   = @{
                Description = "Remove bloat while keeping essential features"
                Features    = @(
                    "BraveWalletDisabled", "BraveRewardsDisabled", "BraveVPNDisabled", "BraveAIChatEnabled",
                    "ShoppingListEnabled", "MediaRecommendationsEnabled", "PromotionsEnabled",
                    "MetricsReportingEnabled", "SafeBrowsingExtendedReportingEnabled",
                    "UrlKeyedAnonymizedDataCollectionEnabled", "FeedbackSurveysEnabled",
                    "BackgroundModeEnabled"
                )
                DnsMode     = "automatic"
            }
            "Normal"        = @{
                Description = "Balanced privacy and functionality"
                Features    = @(
                    "BraveWalletDisabled", "BraveRewardsDisabled", "BraveVPNDisabled",
                    "ShoppingListEnabled", "PromotionsEnabled", "BlockThirdPartyCookies",
                    "EnableDoNotTrack", "MetricsReportingEnabled"
                )
                DnsMode     = "automatic"
            }
            "Default"       = @{
                Description = "Brave default configuration"
                Features    = @()
                DnsMode     = "off"
            }
        }
    
        if ($presets.ContainsKey($selectedPreset)) {
            $preset = $presets[$selectedPreset]
        
            foreach ($featureKey in $preset.Features) {
                if ($global:DebraveState.CheckboxControls.ContainsKey($featureKey)) {
                    $global:DebraveState.CheckboxControls[$featureKey].Checked = $true
                }
            }
        
            $dnsDropdown.SelectedItem = $preset.DnsMode
        
            Update-Status "Preset '$selectedPreset' loaded" "Success"
            [System.Windows.Forms.MessageBox]::Show(
                "Preset: $selectedPreset`n`n$($preset.Description)`n`nFeatures enabled: $($preset.Features.Count)",
                "Preset Loaded",
                [System.Windows.Forms.MessageBoxButtons]::OK,
                [System.Windows.Forms.MessageBoxIcon]::Information
            )
        }
    })

# Backup Button Handler
$backupButton.Add_Click({
        $saveDialog = New-Object System.Windows.Forms.SaveFileDialog
        $saveDialog.Filter = "JSON files (*.json)|*.json"
        $saveDialog.Title = "Backup Original Brave Settings"
        $saveDialog.FileName = "debrave_backup_$(Get-Date -Format 'yyyyMMdd_HHmmss').json"
    
        if ($saveDialog.ShowDialog() -eq [System.Windows.Forms.DialogResult]::OK) {
            try {
                $backup = @{
                    BackupDate   = (Get-Date).ToString("yyyy-MM-dd HH:mm:ss")
                    RegistryPath = $global:DebraveState.RegistryPath
                    Settings     = @{}
                }
            
                # Read ALL current registry values
                if (Test-Path $global:DebraveState.RegistryPath) {
                    $allSettings = Get-ItemProperty -Path $global:DebraveState.RegistryPath -ErrorAction SilentlyContinue
                
                    foreach ($property in $allSettings.PSObject.Properties) {
                        if ($property.Name -notin @('PSPath', 'PSParentPath', 'PSChildName', 'PSDrive', 'PSProvider')) {
                            $backup.Settings[$property.Name] = $property.Value
                        }
                    }
                }
            
                $backup | ConvertTo-Json -Depth 5 | Out-File -FilePath $saveDialog.FileName -Force -Encoding UTF8
            
                Update-Status "Backup saved successfully" "Success"
                [System.Windows.Forms.MessageBox]::Show(
                    "Original settings backed up to:`n$($saveDialog.FileName)`n`nSettings saved: $($backup.Settings.Count)",
                    "Backup Complete",
                    [System.Windows.Forms.MessageBoxButtons]::OK,
                    [System.Windows.Forms.MessageBoxIcon]::Information
                )
            }
            catch {
                Update-Status "Backup failed" "Error"
                [System.Windows.Forms.MessageBox]::Show("Backup failed: $($_.Exception.Message)", "Error", [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Error)
            }
        }
    })

# Restore Button Handler
$restoreButton.Add_Click({
        $openDialog = New-Object System.Windows.Forms.OpenFileDialog
        $openDialog.Filter = "JSON files (*.json)|*.json"
        $openDialog.Title = "Restore Original Brave Settings"
    
        if ($openDialog.ShowDialog() -eq [System.Windows.Forms.DialogResult]::OK) {
            $confirm = [System.Windows.Forms.MessageBox]::Show(
                "This will RESTORE all registry settings from backup.`n`nThis will overwrite current settings. Continue?",
                "Confirm Restore",
                [System.Windows.Forms.MessageBoxButtons]::YesNo,
                [System.Windows.Forms.MessageBoxIcon]::Warning
            )
        
            if ($confirm -eq "Yes") {
                try {
                    $backup = Get-Content -Path $openDialog.FileName -Raw | ConvertFrom-Json
                
                    # Clear current registry
                    Remove-Item -Path $global:DebraveState.RegistryPath -Recurse -Force -ErrorAction SilentlyContinue
                    New-Item -Path $global:DebraveState.RegistryPath -Force | Out-Null
                
                    # Restore all settings
                    $restoredCount = 0
                    foreach ($key in $backup.Settings.PSObject.Properties) {
                        Set-ItemProperty -Path $global:DebraveState.RegistryPath `
                            -Name $key.Name `
                            -Value $key.Value `
                            -Force
                        $restoredCount++
                    }
                
                    # Reload UI state
                    $currentConfig = Read-BraveConfig
                    foreach ($checkboxKey in $global:DebraveState.CheckboxControls.Keys) {
                        $checkbox = $global:DebraveState.CheckboxControls[$checkboxKey]
                        $feature = $script:FeatureDefinitions[$checkboxKey]
                        $checkbox.Checked = ($currentConfig[$checkboxKey] -eq $feature.RegistryValue)
                    }
                
                    Update-Status "Settings restored successfully" "Success"
                    [System.Windows.Forms.MessageBox]::Show(
                        "Original settings restored from:`n$($openDialog.FileName)`n`nSettings restored: $restoredCount`nBackup date: $($backup.BackupDate)",
                        "Restore Complete",
                        [System.Windows.Forms.MessageBoxButtons]::OK,
                        [System.Windows.Forms.MessageBoxIcon]::Information
                    )
                }
                catch {
                    Update-Status "Restore failed" "Error"
                    [System.Windows.Forms.MessageBox]::Show("Restore failed: $($_.Exception.Message)", "Error", [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Error)
                }
            }
        }
    })

# ============================================
# INITIALIZATION
# ============================================

# Read current config and update checkboxes
$currentConfig = Read-BraveConfig

foreach ($key in $global:DebraveState.CheckboxControls.Keys) {
    $checkbox = $global:DebraveState.CheckboxControls[$key]
    $feature = $script:FeatureDefinitions[$key]
    
    # Check if current value matches the "enabled" value
    if ($currentConfig[$key] -eq $feature.RegistryValue) {
        $checkbox.Checked = $true
    }
    else {
        $checkbox.Checked = $false
    }
}

# Read current DNS mode
try {
    $currentDns = Get-ItemProperty -Path $global:DebraveState.RegistryPath -Name "DnsOverHttpsMode" -ErrorAction SilentlyContinue
    if ($currentDns) {
        $dnsDropdown.SelectedItem = $currentDns.DnsOverHttpsMode
    }
}
catch {
    # Default to off if not set
}

Update-Status "Ready - $($script:FeatureDefinitions.Count) features loaded" "Success"

# Show form
[void]$form.ShowDialog()
