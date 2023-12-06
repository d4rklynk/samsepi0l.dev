#!/bin/bash
#Based on tommy's script https://github.com/PrivSec-dev/privsec.dev/blob/main/external-blogs.sh

#Download general tips posts
echo "Fetching and Modifying general tips posts"
echo '---' > './content/blog/cybersec/windows-setup/general-tips/index.md'
echo 'title: "General Tips"' >> './content/blog/cybersec/windows-setup/general-tips/index.md'
echo 'date: 2023-12-06' >> './content/blog/cybersec/windows-setup/general-tips/index.md'
echo 'tags: ["Cybersec", "Windows"]' >> './content/blog/cybersec/windows-setup/general-tips/index.md'
echo 'showAuthor: false' >> './content/blog/cybersec/windows-setup/general-tips/index.md'
echo -e 'author: \n\t- "tommy"' >> './content/blog/cybersec/windows-setup/general-tips/index.md'
echo 'ShowCanonicalLink: true' >> './content/blog/cybersec/windows-setup/general-tips/index.md'
echo 'canonicalURL: https://github.com/TommyTran732/Windows-Setup' >> './content/blog/cybersec/windows-setup/general-tips/index.md'
echo '---' >> './content/blog/cybersec/windows-setup/general-tips/index.md'
echo '' >> './content/blog/cybersec/windows-setup/general-tips/index.md'

curl https://raw.githubusercontent.com/TommyTran732/Windows-Setup/main/Getting%20an%20ISO.md >> './content/blog/cybersec/windows-setup/general-tips/index.md'
curl https://raw.githubusercontent.com/TommyTran732/Windows-Setup/main/Account%20Creation.md >> './content/blog/cybersec/windows-setup/general-tips/index.md'
curl https://raw.githubusercontent.com/TommyTran732/Windows-Setup/main/Microsoft%20Defender%20Sandbox.md >> './content/blog/cybersec/windows-setup/general-tips/index.md'
curl https://raw.githubusercontent.com/TommyTran732/Windows-Setup/main/Microsoft%20Defender%20Application%20Guard.md >> './content/blog/cybersec/windows-setup/general-tips/index.md'

#Download Debloat post
echo "Fetching and Modifying debloat posts"

rm -rf './content/blog/cybersec/windows-setup/debloat/parallels.txt'

echo '---' > './content/blog/cybersec/windows-setup/debloat/index.md'
echo 'title: "Debloating Windows"' >> './content/blog/cybersec/windows-setup/debloat/index.md'
echo 'date: 2023-12-06' >> './content/blog/cybersec/windows-setup/debloat/index.md'
echo 'tags: ["Cybersec", "Windows"]' >> './content/blog/cybersec/windows-setup/debloat/index.md'
echo 'showAuthor: false' >> './content/blog/cybersec/windows-setup/debloat/index.md'
echo -e 'author: \n\t- "tommy"' >> './content/blog/cybersec/windows-setup/debloat/index.md'
echo 'ShowCanonicalLink: true' >> './content/blog/cybersec/windows-setup/debloat/index.md'
echo 'canonicalURL: https://github.com/TommyTran732/Windows-Setup/tree/main/Debloat/' >> './content/blog/cybersec/windows-setup/debloat/index.md'
echo '---' >> './content/blog/cybersec/windows-setup/debloat/index.md'
echo '' >> './content/blog/cybersec/windows-setup/debloat/index.md'

curl https://raw.githubusercontent.com/TommyTran732/Windows-Setup/main/Debloat/README.md >> './content/blog/cybersec/windows-setup/debloat/index.md'
curl https://raw.githubusercontent.com/TommyTran732/Windows-Setup/main/Debloat/Parallels.txt -o './content/blog/cybersec/windows-setup/debloat/parallels.txt'

sed -i 's/`Parallels.txt`/[Parallels.txt](./parallels.txt)/' './content/blog/cybersec/windows-setup/debloat/index.md'

#Download group policies post
echo "Fetching and Modifying the group policies post"
echo '---' > './content/blog/cybersec/windows-setup/group-policies/index.md'
echo 'title: "Group Policies"' >> './content/blog/cybersec/windows-setup/group-policies/index.md'
echo 'date: 2023-12-06' >> './content/blog/cybersec/windows-setup/group-policies/index.md'
echo 'tags: ["Cybersec", "Windows"]' >> './content/blog/cybersec/windows-setup/group-policies/index.md'
echo 'showAuthor: false' >> './content/blog/cybersec/windows-setup/group-policies/index.md'
echo -e 'author: \n\t- "tommy"' >> './content/blog/cybersec/windows-setup/group-policies/index.md'
echo 'ShowCanonicalLink: true' >> './content/blog/cybersec/windows-setup/group-policies/index.md'
echo 'canonicalURL: https://github.com/TommyTran732/Windows-Setup/tree/main/Group%20Policies' >> './content/blog/cybersec/windows-setup/group-policies/index.md'
echo '---' >> './content/blog/cybersec/windows-setup/group-policies/index.md'
echo '' >> './content/blog/cybersec/windows-setup/group-policies/index.md'

### Computer configuration
echo '# Computer Configuration' >> './content/blog/cybersec/windows-setup/group-policies/index.md'
curl https://raw.githubusercontent.com/TommyTran732/Windows-Setup/main/Group%20Policies/Computer%20Configuration/Printers.md >> './content/blog/cybersec/windows-setup/group-policies/index.md'
curl https://raw.githubusercontent.com/TommyTran732/Windows-Setup/main/Group%20Policies/Computer%20Configuration/Start%20Menu%20and%20Taskbar.md >> './content/blog/cybersec/windows-setup/group-policies/index.md'
curl https://raw.githubusercontent.com/TommyTran732/Windows-Setup/main/Group%20Policies/Computer%20Configuration/User%20Account%20Control.md >> './content/blog/cybersec/windows-setup/group-policies/index.md'
sed -i 's/# Printers/\n### Printers/' './content/blog/cybersec/windows-setup/group-policies/index.md'
sed -i 's/# Start Menu and Taskbar/\n### Start Menu and Taskbar/' './content/blog/cybersec/windows-setup/group-policies/index.md'
sed -i 's/# User Account Control/\n### User Account Control/' './content/blog/cybersec/windows-setup/group-policies/index.md'

echo '\n## Control Panel' >> './content/blog/cybersec/windows-setup/group-policies/index.md'
curl https://raw.githubusercontent.com/TommyTran732/Windows-Setup/main/Group%20Policies/Computer%20Configuration/Control%20Panel/Allow%20Online%20Tips.md >> './content/blog/cybersec/windows-setup/group-policies/index.md'
curl https://raw.githubusercontent.com/TommyTran732/Windows-Setup/main/Group%20Policies/Computer%20Configuration/Control%20Panel/Personalization.md >> './content/blog/cybersec/windows-setup/group-policies/index.md'
curl https://raw.githubusercontent.com/TommyTran732/Windows-Setup/main/Group%20Policies/Computer%20Configuration/Control%20Panel/Regional%20and%20Language%20options.md >> './content/blog/cybersec/windows-setup/group-policies/index.md'
sed -i 's/# Allow Online Tips/\n### Allow Online Tips/' './content/blog/cybersec/windows-setup/group-policies/index.md'
sed -i 's/# Personalization/\n### Personalization/' './content/blog/cybersec/windows-setup/group-policies/index.md'
sed -i 's/# Regional and Language Options/\n### Regional and Language Options/' './content/blog/cybersec/windows-setup/group-policies/index.md'

echo '\n## System' >> './content/blog/cybersec/windows-setup/group-policies/index.md'
curl https://raw.githubusercontent.com/TommyTran732/Windows-Setup/main/Group%20Policies/Computer%20Configuration/System/Credentials%20Delegation.md >> './content/blog/cybersec/windows-setup/group-policies/index.md'
curl https://raw.githubusercontent.com/TommyTran732/Windows-Setup/main/Group%20Policies/Computer%20Configuration/System/Device%20Guard.md >> './content/blog/cybersec/windows-setup/group-policies/index.md'
curl https://raw.githubusercontent.com/TommyTran732/Windows-Setup/main/Group%20Policies/Computer%20Configuration/System/Device%20Health%20Attestation%20Service.md >> './content/blog/cybersec/windows-setup/group-policies/index.md'
curl https://raw.githubusercontent.com/TommyTran732/Windows-Setup/main/Group%20Policies/Computer%20Configuration/System/Early%20Launch%20Antimalware.md >> './content/blog/cybersec/windows-setup/group-policies/index.md'
curl https://raw.githubusercontent.com/TommyTran732/Windows-Setup/main/Group%20Policies/Computer%20Configuration/System/Internet%20Communication%20settings.md >> './content/blog/cybersec/windows-setup/group-policies/index.md'
curl https://raw.githubusercontent.com/TommyTran732/Windows-Setup/main/Group%20Policies/Computer%20Configuration/System/Kernel%20DMA%20Protection.md >> './content/blog/cybersec/windows-setup/group-policies/index.md'
curl https://raw.githubusercontent.com/TommyTran732/Windows-Setup/main/Group%20Policies/Computer%20Configuration/System/Mitigation%20Options.md >> './content/blog/cybersec/windows-setup/group-policies/index.md'
curl https://raw.githubusercontent.com/TommyTran732/Windows-Setup/main/Group%20Policies/Computer%20Configuration/System/OS%20Policies.md >> './content/blog/cybersec/windows-setup/group-policies/index.md'
curl https://raw.githubusercontent.com/TommyTran732/Windows-Setup/main/Group%20Policies/Computer%20Configuration/System/Remote%20Assistance.md >> './content/blog/cybersec/windows-setup/group-policies/index.md'
curl https://raw.githubusercontent.com/TommyTran732/Windows-Setup/main/Group%20Policies/Computer%20Configuration/System/Service%20Control%20Manager%20Settings.md >> './content/blog/cybersec/windows-setup/group-policies/index.md'
curl https://raw.githubusercontent.com/TommyTran732/Windows-Setup/main/Group%20Policies/Computer%20Configuration/System/User%20Profiles.md >> './content/blog/cybersec/windows-setup/group-policies/index.md'
curl https://raw.githubusercontent.com/TommyTran732/Windows-Setup/main/Group%20Policies/Computer%20Configuration/System/Windows%20Time%20Service.md >> './content/blog/cybersec/windows-setup/group-policies/index.md'
sed -i 's/# Credentials Delegation/\n### Credentials Delegation/' './content/blog/cybersec/windows-setup/group-policies/index.md'
sed -i 's/# Device Guard/\n### Device Guard/' './content/blog/cybersec/windows-setup/group-policies/index.md'
sed -i 's/# Device Health Attestation Service/\n### Device Health Attestation Service/' './content/blog/cybersec/windows-setup/group-policies/index.md'
sed -i 's/# Early Launch Antimalware/\n### Early Launch Antimalware/' './content/blog/cybersec/windows-setup/group-policies/index.md'
sed -i 's/# Internet Communication settings/\n### Internet Communication settings/' './content/blog/cybersec/windows-setup/group-policies/index.md'
sed -i 's/# Kernel DMA Protection/\n### Kernel DMA Protection/' './content/blog/cybersec/windows-setup/group-policies/index.md'
sed -i 's/# Mitigation Options/\n### Mitigation Options/' './content/blog/cybersec/windows-setup/group-policies/index.md'
sed -i 's/# OS Policies/\n### OS Policies/' './content/blog/cybersec/windows-setup/group-policies/index.md'
sed -i 's/# Remote Assistance/\n### Remote Assistance/' './content/blog/cybersec/windows-setup/group-policies/index.md'
sed -i 's/# Service Control Manager Settings/\n###Service Control Manager Settings/' './content/blog/cybersec/windows-setup/group-policies/index.md'
sed -i 's/# User Profiles/\n### User Profiles/' './content/blog/cybersec/windows-setup/group-policies/index.md'
sed -i 's/# Windows Time Service/\n### Windows Time Service/' './content/blog/cybersec/windows-setup/group-policies/index.md'

echo '## Windows Components' >> './content/blog/cybersec/windows-setup/group-policies/index.md'
curl https://raw.githubusercontent.com/TommyTran732/Windows-Setup/main/Group%20Policies/Computer%20Configuration/Windows%20Components/App%20Privacy.md >> './content/blog/cybersec/windows-setup/group-policies/index.md'
curl https://raw.githubusercontent.com/TommyTran732/Windows-Setup/main/Group%20Policies/Computer%20Configuration/Windows%20Components/Application%20Compatibility.md >> './content/blog/cybersec/windows-setup/group-policies/index.md'
curl https://raw.githubusercontent.com/TommyTran732/Windows-Setup/main/Group%20Policies/Computer%20Configuration/Windows%20Components/AutoPlay%20Policies.md >> './content/blog/cybersec/windows-setup/group-policies/index.md'
curl https://raw.githubusercontent.com/TommyTran732/Windows-Setup/main/Group%20Policies/Computer%20Configuration/Windows%20Components/Bitlocker%20Drive%20Encryption.md >> './content/blog/cybersec/windows-setup/group-policies/index.md'
curl https://raw.githubusercontent.com/TommyTran732/Windows-Setup/main/Group%20Policies/Computer%20Configuration/Windows%20Components/Cloud%20Content.md >> './content/blog/cybersec/windows-setup/group-policies/index.md'
curl https://raw.githubusercontent.com/TommyTran732/Windows-Setup/main/Group%20Policies/Computer%20Configuration/Windows%20Components/Controlled%20Folder%20Access.md    >> './content/blog/cybersec/windows-setup/group-policies/index.md'
curl https://raw.githubusercontent.com/TommyTran732/Windows-Setup/main/Group%20Policies/Computer%20Configuration/Windows%20Components/Data%20Collection%20and%20Preview%20Builds.md >> './content/blog/cybersec/windows-setup/group-policies/index.md'
curl https://raw.githubusercontent.com/TommyTran732/Windows-Setup/main/Group%20Policies/Computer%20Configuration/Windows%20Components/File%20Explorer.md >> './content/blog/cybersec/windows-setup/group-policies/index.md'
curl https://raw.githubusercontent.com/TommyTran732/Windows-Setup/main/Group%20Policies/Computer%20Configuration/Windows%20Components/Find%20My%20Device.md >> './content/blog/cybersec/windows-setup/group-policies/index.md'
curl https://raw.githubusercontent.com/TommyTran732/Windows-Setup/main/Group%20Policies/Computer%20Configuration/Windows%20Components/Location%20and%20Sensors.md >> './content/blog/cybersec/windows-setup/group-policies/index.md'
curl https://raw.githubusercontent.com/TommyTran732/Windows-Setup/main/Group%20Policies/Computer%20Configuration/Windows%20Components/MAPS.md >> './content/blog/cybersec/windows-setup/group-policies/index.md'
curl https://raw.githubusercontent.com/TommyTran732/Windows-Setup/main/Group%20Policies/Computer%20Configuration/Windows%20Components/MDM.md >> './content/blog/cybersec/windows-setup/group-policies/index.md'
curl https://raw.githubusercontent.com/TommyTran732/Windows-Setup/main/Group%20Policies/Computer%20Configuration/Windows%20Components/Messaging.md >> './content/blog/cybersec/windows-setup/group-policies/index.md'
curl https://raw.githubusercontent.com/TommyTran732/Windows-Setup/main/Group%20Policies/Computer%20Configuration/Windows%20Components/Microsoft%20Edge.md >> './content/blog/cybersec/windows-setup/group-policies/index.md'
curl https://raw.githubusercontent.com/TommyTran732/Windows-Setup/main/Group%20Policies/Computer%20Configuration/Windows%20Components/Microsoft%20account.md >> './content/blog/cybersec/windows-setup/group-policies/index.md'
curl https://raw.githubusercontent.com/TommyTran732/Windows-Setup/main/Group%20Policies/Computer%20Configuration/Windows%20Components/Network%20Protection.md >> './content/blog/cybersec/windows-setup/group-policies/index.md'
curl https://raw.githubusercontent.com/TommyTran732/Windows-Setup/main/Group%20Policies/Computer%20Configuration/Windows%20Components/Search.md >> './content/blog/cybersec/windows-setup/group-policies/index.md'
curl https://raw.githubusercontent.com/TommyTran732/Windows-Setup/main/Group%20Policies/Computer%20Configuration/Windows%20Components/Software%20Protection%20Platform.md >> './content/blog/cybersec/windows-setup/group-policies/index.md'
curl https://raw.githubusercontent.com/TommyTran732/Windows-Setup/main/Group%20Policies/Computer%20Configuration/Windows%20Components/Sync%20your%20settings.md >> './content/blog/cybersec/windows-setup/group-policies/index.md'
curl https://raw.githubusercontent.com/TommyTran732/Windows-Setup/main/Group%20Policies/Computer%20Configuration/Windows%20Components/Text%20Input.md >> './content/blog/cybersec/windows-setup/group-policies/index.md'
curl https://raw.githubusercontent.com/TommyTran732/Windows-Setup/main/Group%20Policies/Computer%20Configuration/Windows%20Components/Widgets.md >> './content/blog/cybersec/windows-setup/group-policies/index.md'
curl https://raw.githubusercontent.com/TommyTran732/Windows-Setup/main/Group%20Policies/Computer%20Configuration/Windows%20Components/Windows%20Calendar.md >> './content/blog/cybersec/windows-setup/group-policies/index.md'
curl https://raw.githubusercontent.com/TommyTran732/Windows-Setup/main/Group%20Policies/Computer%20Configuration/Windows%20Components/Windows%20Defender%20SmartScreen.md >> './content/blog/cybersec/windows-setup/group-policies/index.md'
curl https://raw.githubusercontent.com/TommyTran732/Windows-Setup/main/Group%20Policies/Computer%20Configuration/Windows%20Components/Windows%20Error%20Reporting.md >> './content/blog/cybersec/windows-setup/group-policies/index.md'
curl https://raw.githubusercontent.com/TommyTran732/Windows-Setup/main/Group%20Policies/Computer%20Configuration/Windows%20Components/Windows%20Game%20Recording%20and%20Broadcasting.md >> './content/blog/cybersec/windows-setup/group-policies/index.md'
curl https://raw.githubusercontent.com/TommyTran732/Windows-Setup/main/Group%20Policies/Computer%20Configuration/Windows%20Components/Windows%20Media%20Digital%20Rights%20Management.md >> './content/blog/cybersec/windows-setup/group-policies/index.md'
curl https://raw.githubusercontent.com/TommyTran732/Windows-Setup/main/Group%20Policies/Computer%20Configuration/Windows%20Components/Windows%20Messenger.md >> './content/blog/cybersec/windows-setup/group-policies/index.md'
curl https://raw.githubusercontent.com/TommyTran732/Windows-Setup/main/Group%20Policies/Computer%20Configuration/Windows%20Components/Windows%20Update.md >> './content/blog/cybersec/windows-setup/group-policies/index.md'
sed -i 's/# App Privacy/\n### App Privacy/' './content/blog/cybersec/windows-setup/group-policies/index.md'
sed -i 's/# Application Compatibility/\n### Application Compatibility/' './content/blog/cybersec/windows-setup/group-policies/index.md'
sed -i 's/# AutoPlay Policies/\n### AutoPlay Policies/' './content/blog/cybersec/windows-setup/group-policies/index.md'
sed -i 's/# Bitlocker Drive Encryption/\n### Bitlocker Drive Encryption/' './content/blog/cybersec/windows-setup/group-policies/index.md'
sed -i 's/# Cloud Content/\n### Cloud Content/' './content/blog/cybersec/windows-setup/group-policies/index.md'
sed -i 's/# Controlled Folder Access/\n### Controlled Folder Access/' './content/blog/cybersec/windows-setup/group-policies/index.md'
sed -i 's/# Controlled Folder Access/\n### Controlled Folder Access/' './content/blog/cybersec/windows-setup/group-policies/index.md'
sed -i 's/# File Explorer/\n### File Explorer/' './content/blog/cybersec/windows-setup/group-policies/index.md'
sed -i 's/# Find My Device/\n### Find My Device/' './content/blog/cybersec/windows-setup/group-policies/index.md'
sed -i 's/# Location and Sensors/\n### Location and Sensors/' './content/blog/cybersec/windows-setup/group-policies/index.md'
sed -i 's/# MAPS/\n### MAPS/' './content/blog/cybersec/windows-setup/group-policies/index.md'
sed -i 's/# MDM/\n### MDM/' './content/blog/cybersec/windows-setup/group-policies/index.md'
sed -i 's/# Messaging/\n### Messaging/' './content/blog/cybersec/windows-setup/group-policies/index.md'
sed -i 's/# Legacy Microsoft Edge/\n### Legacy Microsoft Edge/' './content/blog/cybersec/windows-setup/group-policies/index.md'
sed -i 's/# Microsoft account/\n### Microsoft account/' './content/blog/cybersec/windows-setup/group-policies/index.md'
sed -i 's/# Network Protection/\n### Network Protection/' './content/blog/cybersec/windows-setup/group-policies/index.md'
sed -i 's/# Search/\n### Search/' './content/blog/cybersec/windows-setup/group-policies/index.md'
sed -i 's/# Software Protection Platform/\n### Software Protection Platform/' './content/blog/cybersec/windows-setup/group-policies/index.md'
sed -i 's/# Sync your settings/\n### Sync your settings/' './content/blog/cybersec/windows-setup/group-policies/index.md'
sed -i 's/# Text Input/\n### Text Input/' './content/blog/cybersec/windows-setup/group-policies/index.md'
sed -i 's/# Widgets/\n### Widgets/' './content/blog/cybersec/windows-setup/group-policies/index.md'
sed -i 's/# Windows Calendar/\n### Windows Calendar/' './content/blog/cybersec/windows-setup/group-policies/index.md'
sed -i 's/# Windows Defender SmartScreen/\n### Windows Defender SmartScreen/' './content/blog/cybersec/windows-setup/group-policies/index.md'
sed -i 's/# Windows Error Reporting/\n### Windows Error Reporting/' './content/blog/cybersec/windows-setup/group-policies/index.md'
sed -i 's/# Windows Game Recording and Broadcasting/\n### Windows Game Recording and Broadcasting/' './content/blog/cybersec/windows-setup/group-policies/index.md'
sed -i 's/# Windows Media Digital Rights Management/\n### Windows Media Digital Rights Management/' './content/blog/cybersec/windows-setup/group-policies/index.md'
sed -i 's/# Windows Calendar/\n### Windows Calendar/' './content/blog/cybersec/windows-setup/group-policies/index.md'
sed -i 's/# Windows Update/\n### Windows Update/' './content/blog/cybersec/windows-setup/group-policies/index.md'


### User configuration
echo '# User Configuration' >> './content/blog/cybersec/windows-setup/group-policies/index.md'
curl https://raw.githubusercontent.com/TommyTran732/Windows-Setup/main/Group%20Policies/User%20Configuration/Cloud%20Content.md >> './content/blog/cybersec/windows-setup/group-policies/index.md'
curl https://raw.githubusercontent.com/TommyTran732/Windows-Setup/main/Group%20Policies/User%20Configuration/File%20Explorer.md >> './content/blog/cybersec/windows-setup/group-policies/index.md'
curl https://raw.githubusercontent.com/TommyTran732/Windows-Setup/main/Group%20Policies/User%20Configuration/Windows%20Copilot.md >> './content/blog/cybersec/windows-setup/group-policies/index.md'
sed -i 's/# Cloud Content/\n### Cloud Content/' './content/blog/cybersec/windows-setup/group-policies/index.md'
sed -i 's/# File Explorer/\n### File Explorer/' './content/blog/cybersec/windows-setup/group-policies/index.md'
sed -i 's/# Windows Copilot/\n### Windows Copilot/' './content/blog/cybersec/windows-setup/group-policies/index.md'

#Download Windows Settings post
echo "Fetching and Modifying Windows Settings post"
echo '---' > './content/blog/cybersec/windows-setup/windows-settings/index.md'
echo 'title: "Windows Settings"' >> './content/blog/cybersec/windows-setup/windows-settings/index.md'
echo 'date: 2023-12-06' >> './content/blog/cybersec/windows-setup/windows-settings/index.md'
echo 'tags: ["Cybersec", "Windows"]' >> './content/blog/cybersec/windows-setup/windows-settings/index.md'
echo 'showAuthor: false' >> './content/blog/cybersec/windows-setup/windows-settings/index.md'
echo -e 'author: \n\t- "tommy"' >> './content/blog/cybersec/windows-setup/windows-settings/index.md'
echo 'ShowCanonicalLink: true' >> './content/blog/cybersec/windows-setup/windows-settings/index.md'
echo 'canonicalURL: https://github.com/TommyTran732/Windows-Setup/tree/main/Windows%20Settings' >> './content/blog/cybersec/windows-setup/windows-settings/index.md'
echo '---' >> './content/blog/cybersec/windows-setup/windows-settings/index.md'
echo '' >> './content/blog/cybersec/windows-setup/windows-settings/index.md'

curl https://raw.githubusercontent.com/TommyTran732/Windows-Setup/main/Windows%20Settings/Date%20%26%20Time.md >> './content/blog/cybersec/windows-setup/windows-settings/index.md'
curl https://raw.githubusercontent.com/TommyTran732/Windows-Setup/main/Windows%20Settings/Privacy%20%26%20security.md >> './content/blog/cybersec/windows-setup/windows-settings/index.md'
curl https://raw.githubusercontent.com/TommyTran732/Windows-Setup/main/Windows%20Settings/Windows%20Security.md >> './content/blog/cybersec/windows-setup/windows-settings/index.md'
curl https://raw.githubusercontent.com/TommyTran732/Windows-Setup/main/Windows%20Settings/Windows%20Update.md >> './content/blog/cybersec/windows-setup/windows-settings/index.md'