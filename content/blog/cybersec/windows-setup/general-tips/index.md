---
title: "General Tips"
date: 2023-12-06
tags: ["Cybersec", "Windows"]
author: TommyTran732
ShowCanonicalLink: true
canonicalURL: https://github.com/TommyTran732/Windows-Setup
---

# Getting an ISO

If you want to get an x64/x86 enterprise ISO, follow https://www.thewindowsclub.com/download-windows-10-enterprise-iso-with-media-creation-tool

Essentially, the command to use with the Windows Media creation tool is `Retail /MediaArch x64 /MediaLangCode en-US /MediaEdition Enterprise`.

Microsoft does not distribute Windows ARM ISOs as far as I know. The basic procedure is to download some ESD files from Microsoft, then convert it into an ISO.

If you use Parallels, just let it create a Windows VM automatically. It will make an Windows ARM Home/Pro ISO in your Downloads Folder, and you can use that for a manual installation later.

Another easy option is to use CrystalFetch on macOS to build the ISOs.# Microsoft account bypass

Follow this guide:

https://ghacks.net/2023/01/26/how-to-bypass-the-microsoft-account-requirement-during-windows-setup/

The easy method is to use no@thankyou.com and any password as the user.

# Local account security questions bypass

Use an empty password while creating a local user, then set a password after the computer is done setting up.# Microsoft Defender Sandbox

Enable the sandbox for Microsoft Defender by running `setx /M MP_FORCE_USE_SANDBOX 1` as an administrator.# Microsoft Defender Application Guard

Only relevant if running on bare metal or with nested virtualization. Extremely handy for visiting untrusted websites (which should be all websites). This also works with Office Enterprise, but I do not have Office Enterprise so I cant't play with it.

Documentation: https://learn.microsoft.com/en-us/windows/security/application-security/application-isolation/microsoft-defender-application-guard/md-app-guard-overview

Video demo for Edge in MDAG: https://www.youtube.com/watch?v=OFEdoCWZjaI

**Microsoft Edge running in MDAG will bypass your VPN!!!**