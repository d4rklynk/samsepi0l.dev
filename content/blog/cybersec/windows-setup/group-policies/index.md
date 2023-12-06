---
title: "Group Policies"
date: 2023-12-06
tags: ["Cybersec", "Windows"]
authors: 
	- "tommy"
ShowCanonicalLink: true
canonicalURL: https://github.com/TommyTran732/Windows-Setup/tree/main/Group%20Policies
---

# Computer Configuration

### Printers

`Computer Configuration\Administrative Templates\Printers`

- Isolate print drivers from applications -> Enabled
### Start Menu and Taskbar

`Computer Configuration\Administrative Templates\Start Menu and Taskbar`

This is not strictly problematic, though I get quite irritated with most used apps/recently added apps/recently opened documents/etc showing up on my start menu. Someone may iadvertedly see something when I show them my screen.

- Remove "Recently added" list from Start Menu -> Enabled
- Remove Personalized Website Recommendation section in the Start Menu -> Enabled
- Remove Recommended section from Start Menu -> Enabled
- Remove frequent program list from Start Menu -> Enabled
- Do not keep history of recently opened documents -> Enabled
- Show or hide "Most used" list from Start menu -> Enabled -> Hide
- Pin Apps to Start when installed -> Disabled
### User Account Control

Documentation: https://learn.microsoft.com/en-us/windows/security/application-security/application-control/user-account-control/settings-and-configuration?tabs=gpo

`Computer Configuration\Windows Settings\Security Settings\Local Policies\Security Options`

- User Account Control: Behavior of the elevation prompt for administrators in Admin Approval Mode -> Prompt for credentials
- User Account Control: Only elevate executables that are signed and validated -> Enabled
- User Account Control: Switch to the secure desktop when prompting for elevation -> Enabled (Docs says it is enabled by default, but it is off on my Parallels VM somehow)\n## Control Panel

### Allow Online Tips

`Computer Configuration\Administrative Templates\Control Panel`

- Allow Online Tips -> Disabled (Not sure about privacy implications, but no reason for it to be on)
### Personalization

`Computer Configuration\Administrative Templates\Control Panel\Regional and Language Options`

- Prevent enabling lock screen camera -> Enabled (Probably not invasive, though I don't see a reason for it to be on)
### Regional and Language Options

`Computer Configuration\Administrative Templates\Control Panel\Regional and Language Options`

- Allow users to enable online speech recognition services -> Disabled
- Handwriting personalization -> Turn off automatic learning -> Enabled\n## System

### Credentials Delegation

`Computer Configuration\Administrative Templates\System\Credentials Delegration`

- Encryption Oracle Remediation -> Enabled -> Force Updated Clients
### Device Guard

`Computer Configuration\Administrative Templates\System\Device Guard`

- Turn On Virtualization Based Security -> Enabled (**Only do this if you are running Windows on bare metal or with nested virtualization**)
### Device Health Attestation Service

`Computer Configuration\Administrative Templates\System\Device Health Attestation Service`

- Enable Device Health Attestation Monitoring and Reporting -> Disabled (Not inherently bad, but unless you have access to the cloud based reporting portal, why even bother keeping it on?)
### Early Launch Antimalware

`Computer Configuration\Administrative Templates\System\Kernel DMA Protection`

Probably doesn't do anything unless you use a 3rd party Antimalware with this feature, but there is no harm in enabling it just in case you need it.

- Boot-Start Driver Initialization Policy -> Enabled -> Good only
### Internet Communication settings

`Computer Configuration\Administrative Templates\System\Internet Communication Management\Internet Communication settings`

**Old and very likely to be obsolete.**

- Turn off Windows Customer Experience mprovement Program -> Enabled
- Turn off downloading of print drivers over HTTP -> Enabled
Turn off printing over HTTP -> Enabled
- Turn off Help and Support Center "Did you know?" content -> Enabled (These are probably not that useful and will just be annoying)
- Turn off Windows Error Reporting -> Enabled
- turn off Search Companion content file updates -> Enabled
- Turn off Windows Messenger Customer Experience Improvement Program -> Enabled
### Kernel DMA Protection

`Computer Configuration\Administrative Templates\System\Kernel DMA Protection`

- Enumeration policy for external devices incompatible with Kernel DMA Protection -> Enabled -> Block all
### Mitigation Options

`Computer Configuration\Administrative Templates\System\Mitigation Options`

- Untrusted Font Blocking -> Enabled -> Block untrusted fonts and log events (This may break some games)
### OS Policies

`Computer Configuration\Administrative Templates\System\OS Policies`

- ALlow Clipboard History -> Disabled
- Allow Clipboard synchronization across devices -> Disabled
- Enables Activity Feed -> Disabled
- Allow publishing of User Activities -> Disabled
- Allow upload of User Activities -> Disabled
### Remote Assistance

`Computer Configuration\Administrative Templates\System\Remote Assistance`

- Allow only Windows Vista or later connections -> Enabled
###Service Control Manager Settings

`Computer Configuration\Administrative Templates\System\Service Control Manager Settings`

- Security Settings -> Enable svchost.exe mitigation options -> Enabled
### User Profiles

`Computer Configuration\Administrative Templates\System\User Profiles`

- Turn off the advertising ID -> Enabled
- Only allow local user profiles -> Enabled (You probably aren't going to use roaming profiles unless you are in some niche environment like a univeristy, are you? Might as well just disable them because why not?)
### Windows Time Service

`Computer Configuration\Administrative Templates\System\Windows Time Service`

Enable Windows NTP Client -> Disabled (**Read my notes on Date & Time. I am disabling time sync here because it is already handled by my guest agent**.)## Windows Components

### App Privacy

`Computer Configuration\Administrative Templates\Windows Components\App Privacy`

These contains some settings that are not in the Settings app (and vice versa). Most of these stuff I will never use, therefore I am forcing them to be off. You do not need to follow me on this, but you should at least check out all of the policies there.

- Let Windows apps access account information -> Enabled -> Force Deny
- Let Windows apps access user movements while running in the background -> Enabled -> Force Deny
- Let Windows apps access the calendar -> Enabled -> Force Deny
- Let Windows apps access call history -> Enabled -> Force Deny
- Let Windows apps access contacts -> Enabled -> Force Deny
- Let Windows apps access email -> Enabled -> Force Deny
- Let Windows apps access and eye tracker device -> Enabled -> Force Deny
- Let Windows apps take screenshots of various windows or displays -> Enabled -> Force Deny
- Let Windows apps turn off the screenshot border -> Enabled -> Force Deny
- Let Windows apps access presence sensing -> Enabled -> Force Deny
- Let Windows apps access location -> Enabled -> Force Deny
- Let Windows apps access messaging -> Enabled -> Force Deny
- Let Windows apps access motion -> Enabled -> Force Deny
- Let Windows apps access notifications -> Enabled -> Force Deny
- Let Windows apps make phone calls -> Enabled -> Force Deny
- Let Windows apps control radios -> Enabled -> Force Deny
- Let Windows apps access Tasks -> Enabled -> Force Deny
- Let Windows apps access trusted devices -> Enabled -> Force Deny
- Let Windows apps activate with voice -> Enabled -> Force Deny
- Let Windows apps activate with voice while the system is locked -> Enabled -> Force Deny
- Let Windows apps access diagnostic information about other apps -> Enabled -> Force Deny

### Application Compatibility

`Computer Configuration\Administrative Templates\Windows Components\Application Compatibility`

**These look quite old so I am not sure if they apply to modern Windows versions or not. It doesn't hurt to set them either ways.**

- Turn off Application Telemetry -> Enabled
### AutoPlay Policies

`Computer Configuration\Administrative Templates\Windows Components\AutoPlay {p;ocoesy`

- Turn off Autoplay -> Enabled
### Bitlocker Drive Encryption

`Computer Configuration\Administrative Templates\Windows Components\Bitlocker Drive Encryption`

Choose drive encryption method and cipher strength (Windows 10 [Version 1511] and later) -> Enable -> XTS-AES 256-bit for operating system, fixed data, and removable drives.

**The disable new DMA devices when computer is locked should only be enabled if your computer does not support kernel DMA protection.**

## Operating System Drives

- Require additional authentication at startup -> Enabled -> Do not allow TPM, Allow startup PIN with TPM, Do not allow startup key with TPM, Allow startup key and PIN with TPM. (**This is especially important as we do not want the TPM to automatically release the encryption key at boot.**)
- Allow enhanced PINs for startup -> Enabled.
- Configure TPM platform validation profile for native UEFI firmware configurations -> Enabled -> PCR 0,1,2,3,3,4,5,6,7,11
##
### Cloud Content

`Computer Configuration\Administrative Templates\Windows Components\Cloud Content`

I mostly disable all cloud content because they are way too annoying. There are also a few group policies relating to "personalization", so I am not entirely sure on the privacy implication of that either.

- Turn off cloud optimized content -> Enabled
- Turn off cloud consumer account state content -> Enabled
- Do not show Windows tips -> Enabled
- Turn of Microsoft consumer experiences -> Enabled
##
### Controlled Folder Access

`Computer Configuration\Administrative Templates\Windows Components\Microsoft Defender Antivirus\Microsoft Defender Exploit Guard\Controlled Folder Access`

- Configure Controlled folder access -> Enabled -> Block# Data Collection and Preview Builds

`Computer Configuration\Administrative Templates\Windows Components\Data Collection and Preview Builds`

- Toggle user control over Insider builds -> Disabled
- Allow Diagnostic Data -> Enabled -> Diagnostic Data off (Only affects Enterprise, Education, and Server)
- Do not show feedback notification -> Enabled
##
### File Explorer

`Computer Configuration\Administrative Templates\Windows Components\File Explorer`

- Turn off account-based insights, recent, favorite, and recommended files in File Explorer -> Enabled (Not sure if this is actually privacy invasive or not, but best to keep it off anyways.)
### Find My Device

`Computer Configuration\Administrative Templates\Windows Components\Find My Device`

- Turn On/Off Find My Device -> Disabled
### Location and Sensors

`Computer Configuration\Administrative Templates\Windows Components\Location and Sensors`

I do not see these ever being used on my system, therefore they are disabled. Obviously, you don't have to apply them if you want to use location and sensors.

- Turn off location scription -> Enabled
- Turn off location -> Enabled
- Turn off sensors -> Enabled
### MAPS

`Computer Configuration\Administrative Templates\Windows Components\Microsoft Defender Antivirus\MAPS`

Microsoft Defender Antivirus MAPS is an interesting case. You should configure it depending on your threat model, and treat it like SmartScreen. We will disable automatic sample submission regardless because that could be privacy invasive.

- Send file samples when further analysis is required -> Enabled -> Never send
### MDM

`Computer Configuration\Administrative Templates\Windows Components\MDM`

Unless you run your own MDM system or something, this probably should not be on with a personal computer.

- Enable automatic MDM enrollment using default Azure AD credentials -> Disabled (Probably redundant because of the next policy, but it will also **unenroll** you from Azure AD)
- Disable MDM enrollment -> Enabled (This will not unenroll you though)
### Messaging

`Computer Configuration\Administrative Templates\Windows Components\Messaging`

- Allow Message Service Cloud Sync -> Disabled
### Legacy Microsoft Edge

`Computer Configuration\Administrative Templates\Windows Components\Microsoft Edge`

**Legacy Microsoft Edge, not the Chromium based one. Obsolete.**

- Configure Autofill -> Disable (Password Manager is off so no reason for autofill to be on)
- Configure Do Not Track -> Enable
- Allow Extensions -> Disable (I do not use extensions, and they reduce security in a lot of cases. Don't disable this if you need extensions, of course.)
- Allow Adobe Flash -> Disable (Dead technology, dangerous)
- Configure Password Manager -> Disable (**The password manager does NOT have E2EE**)
- Prevent using Localhost IP address for WebRTC -> Enable
### Microsoft account

`Computer Configuration\Administrative Templates\Windows Components\Microsoft account`

- Block all consumer Microsoft account user authentication -> Enabled
### Network Protection

Only relevant if SmartScreen is used.

Documentation:
- https://learn.microsoft.com/en-us/microsoft-365/security/defender-endpoint/network-protection?view=o365-worldwide
- https://learn.microsoft.com/en-us/microsoft-365/security/defender-endpoint/enable-network-protection?view=o365-worldwide

`Computer Configuration\Administrative Templates\Windows Components\Microsoft Defender Antivirus\Microsoft Defender Exploit Guard\Network Protection`

This settings controls whether Network protection is allowed to be configured into block or audit mode on Windows -> Enabled (Only relevant if running Windows Server)
Prevent users and apps from accessing dangerous websites -> Enabled -> Block
### Search

`Computer Configuration\Administrative Templates\Windows Components\Search`

Very confusing, you need to consult https://learn.microsoft.com/en-us/windows/privacy/manage-connections-from-windows-operating-system-components-to-microsoft-services#21-cortana-and-search-group-policies

"Do not allow web search" looks old and probably deprecated, but Microsoft's docs still mention it for some reason. Thus, I am also going over other similar old settings for safe measure.

- Allow Cloud Search -> Disabled
- Allow Cortana -> Disabled
- ALlow search and Cortana to use location -> Disabled
- Configures search on the taskbar -> Enabled -> Search icon and label (Not a privacy/security issue or anything, but I hate the gigantic box)
- Do not allow web search -> Enabled
- Don't search the web or display web results in Search -> Enabled
- Enable indexing of online delegate mailboxes -> Disabled
- Prevent indexing Microsoft Office Outlook -> Enabled
### Software Protection Platform

`Computer Configuration\Administrative Templates\Windows Components\Software Protection Platform`

- Turn off KMS Client Online AVS Validation -> Enabled
### Sync your settings

`Computer Configuration\Administrative Templates\Windows Components\Sync your settings`

- Do not sync -> Enabled
### Text Input

`Computer Configuration\Administrative Templates\Windows Components\Widgets`

- Improve inking and typing recognition -> Disabled
### Widgets

`Computer Configuration\Administrative Templates\Windows Components\Widgets`

Probably not a huge privacy/security issue, it just fetches news and stuff from the internet. I disable it as it is extremely annoying.

- Allow widgets -> Disabled
##
### Windows Calendar

`Computer Configuration\Administrative Templates\Windows Components\Windows Calendar`

Probably not a huge privacy/security issue. I just disable it because I do not want it.

- Turn off Windows Calendar -> Enabled
### Windows Defender SmartScreen

`Computer Configuration\Administrative Templates\Windows Components\Windows Defender SmartScreen`

- Enhanced Phising Protection -> Service Enabled -> Disabled

**For a corporate scenario or when you cannot trust the user you are configuring it for and you choose to have SmartScreen enabled, do the followings:**,

- Explorer -> Configure Windows Defender SmartScreen -> Enabled -> Warn and prevent bypass
- Microsoft Edge -> Prevent bypassing Windws Defender SmartScreen prompts for sites -> Enabled

There is also Explorer -> Configure App Install Control that you might want to look into. Probably theatre though, it doesn't appear to block anything, or anything meaningful at least.
### Windows Error Reporting

`Computer Configuration\Administrative Templates\Windows Components\Windows Error Reporting`

- Disable Windows Error Reporting -> Enable
### Windows Game Recording and Broadcasting

`Computer Configuration\Administrative Templates\Windows Components\Windows Game Recording and Broadcasting`

If you wanna record your screen and stuff, don't apply this. Otherwise, why not just disable it? Unnecesary stuff.

- Enables or disables Windows Game Windows Game Recording and Broadcasting -> Disabled

### Windows Media Digital Rights Management

`Computer Configuration\Administrative Templates\Windows Components\Windows Media Digital Rights Management`

Obviously do not set this if you need Windows Media DRM, but I have never seen this being used so I don't see a reason for it to be allowed.

- Prevent Windows Media DRM Internet Access -> Enabled
##
### Windows Calendar

`Computer Configuration\Administrative Templates\Windows Components\Windows Messenger`

**Old and very likely to be obsolete.**

- Do not allow Windows Messenger to be run -> Enabled
### Windows Update

`Computer Configuration\Administrative Templates\Windows Components\Windows Update`

- Manage updates offered from Windows Update -> Enable optional updates -> Enabled -> Automatically recieve optional updates
- Manage updates offered from Windows Update -> Select when Quality Updates are recieved -> Enabled -> Defer for 0 days
# User Configuration

### Cloud Content

`User Configuration\Administrative Templates\Windows Components\Cloud Content`

I mostly disable all cloud content because they are way too annoying. There are also a few group policies relating to "personalization", so I am not entirely sure on the privacy implication of that either.

- Do not use diagnostic data for tailored experiences -> Enabled
- Turn off all Windows spotlight features -> Enabled
- Turn off the Windows Welcome Experience -> Enabled
### File Explorer

`User Configuration\Administrative Templates\Windows Components\File Explorer`

- Turn off display of recent search entries in the File Explorer search box -> Enabled (**EXTREMELY INVASIVE**. This stores your search history in the registry according to the docs, and is also responsible for the Bing search in the Start Menu just like the policies in Search even though the description does not mention it.)
### Windows Copilot

`User Configuration\Administrative Templates\Windows Components\Windows Copilot`

- Turn off Windows Copilot -> Enabled