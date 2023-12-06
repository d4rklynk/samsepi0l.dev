---
title: "Windows Settings"
date: 2023-12-06
tags: ["Cybersec", "Windows"]
showAuthor: false
author: tommy
ShowCanonicalLink: true
canonicalURL: https://github.com/TommyTran732/Windows-Setup/tree/main/Windows%20Settings
---

# Date & Time

Windows uses NTP for time synchronization, which is not secure due to the lack of encryption and authentication. If you are running bare metal, I recommend that you setup a VM to sync time using NTS, then use it as the NTP server for Windows. If you are running a VM (Parallels in my case), just disable network time synchronization and let the guest agent sync time from the host.# Privacy & security

Disable everything you can in this section. Do not neglect it just because you uncheck everything during the installation - various privacy invasive stuff are still in there.

If something needs to be reenabled later for certain apps, you can always do that.# Virus & threat protection

## Virus & threat protection settings

### Cloud-delivered protection

This sends hashes and file paths to Microsoft. Whether to keep this on or not depends on the threat model.

One caveat with this is that if it takes the cloud too long to scan, the computer will just run the executable. Might wanna increase the timeout later to make it less theatric:

- https://learn.microsoft.com/en-us/mem/intune/protect/antivirus-microsoft-defender-settings-windows
- https://learn.microsoft.com/en-us/windows/client-management/mdm/policy-csp-defender#defender-cloudextendedtimeout

### Automatic Sample Submission

Should be turned off. Supposedly will prompt if the files it want to submit are document files, but why not just make it prompt for every file it wants to submit?

## Ransomeware protection

Turn on Controlled folder access. This will protect certain dirs and prevent direct writes to the disk.

# Firewall & Network protection

Tick "Block incoming connections" for Domain network, Private network, and Public network.

# App & browser control

## Smart App Control

Smart App Control forces Smartscreen for apps & files to be on, which could lead to privacy issues. It can also break certain applications. Whether to keep this on or not depends on the threat model.

On a side note, this breaks WSL.

## Reputation-based protection

### Check apps and files.

This sends hashes and file paths to Microsoft. It will also sends the URL of where you download a program from to Microsoft. Whether to keep this on or not depends on the threat model.

### SmartScreen for Microsoft Edge

This setting is independant from Smart App Control. Extremely privacy invasive. Sends **FULL URLs** to Microsoft. Whether to keep this on or not depends on the threat model, though it probably should be off in most cases.

Consider scenarios where you use Proton Drive/Mega/PrivateBin which append the encryption key in the URL. Now you are sending both the URL and the key to Microsoft. Something that's supposed to be private / end-to-end encrypted now gets leaked just like that. Or if you use PHPMyAdmin with the username & password appended for logins - now you are leaking access to your database.

### Phising protection

This is extremely invasive to the point where I do not think it's okay to keep it on under any circumstances, with any kind of threat model.

https://support.microsoft.com/en-us/topic/protect-your-microsoft-password-from-being-phished-e4e8e611-e4b3-4be9-914c-db1657c337cf

The protection is minimal - it only "protects" the Microsoft account used to sign into Windows. The whole exercise is theatre, use a proper password manager and FIDO2.

### Potentially unwanted app blocking

Unclear what is being sent, probably the same as "Check apps and files".

### SmartScreen for Microsoft Store apps

Probably same as SmartScreen for Microsoft Edge. Might not be as egregious though if the apps you use don't access URLs you wanna keep private. I personally keep it on.

### Exploit protection

Turn Force randomization for images (Mandatory ALSR) to "On by default".

# Device Security

## Security Processor & Secure Boot

If theres aren't on, check the firmware settings. On Parallels, both should pass by default.

## Data encryption

Poor man's Bitlocker. Unless you are using Home edition, turn this off and use Bitlocker proper.

If you sign in with a Microsoft account, "Data Encryption" will submit the key protector to Microsoft (which means that Microsoft can decrypt your device should they get physical access to it). Not sure what happens when you do not login with a Microsoft account, but it is worse than a proper Bitlocker setup anyways (no TPM + PIN/USB drive etc), so just disable it.# Windows Update

Make sure the followings are selected:

- Uncheck update as soon as possible (this is essentially the same as auto update with gradual release - we will configure the group pol to be auto update without gradual release)
- Advanced option -> Recieve updates for other Microsoft products
- Notify when restart is required to finish updating
- Install optional updates

# Microsoft Store Shenanigans

- If you are using Parallels, make sure to install Parallels Tools to enable the Microsoft Store.
- Go to the Microsoft Store and update all apps. Apps are outdated almost by guarantee. If winget is acting finicky, this might just be because it is not updated.

Think about whether you want to login with a Microsoft Account with or not. If you do not login, app installs are tied to your hardware ID. If you do, then they will be tied to your Microsoft Account.