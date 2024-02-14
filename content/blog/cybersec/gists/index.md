---
title: "Gists et infos utiles"
date: 2024-02-14
tags: ["Cybersec", "Web", "Gists"]
---

Petit billet de blog pas chiadé sur la forme. Compilation d'informations utiles.

## Zstd sous Linux

**Source :**

> - https://github.com/GrapheneOS/mail.grapheneos.org/blob/main/remote-backup
> - https://github.com/facebook/zstd


### Compresser un fichier avec zstd et tar

```bash
tar -cv foldertocompress | zstd -9 > archiveexample.tar.zst
```

Vous pouvez aussi spécifier un dossier à partir duquel tar devra faire une compression.

Exemple avec le dossier `mysql` (qui se situe dans /var/lib) :

```bash
tar -cvC /var/lib mysql | zstd -9 > mysql.tar.zst
```

### Décompresser une archive zst

```bash
zstd -d archiveexample.tar.zst | tar -xvf -
```

### Lister les fichier d'une archive zst

```bash
zstdcat archiveexample.tar.zst | tar -tvf -
```

## DNS

### Bloquer les mails entrants et sortants via le DNS

**Source :**

> - https://akc3n.page/gists/#protect-parked-domain-without-email
> - https://www.rfc-editor.org/rfc/rfc7505 (NULL MX)
> - https://www.rfc-editor.org/rfc/rfc7208.html#section-10.1.2 (Set SPF to always fail)
> - https://www.rfc-editor.org/rfc/rfc6376.html#section-3.6.1 (Voir `p=`)
> - https://www.rfc-editor.org/rfc/rfc7489 (DMARC)


Pour préciser que le nom de domaine ne gère pas les mails, ajoutez ceci dans votre DNS :

Exemple avec le sous-domaine `www` :

```
www.example.com. IN TXT "v=spf1 -all"
```

```
www.example.com. IN MX "0 ."
```

Vous devez le faire pour chaque sous-domaine et domaine sur lequel vous n'utilisez pas de mail.

Pour le nom de domaine principal (appelé "apex" parfois) `example.com`, vous devez non seulement inclure les enregistrements précédents (NULL MX et SPF), mais aussi DMARC et DKIM. 

| HOSTNAME | TYPE | TTL | DATA |
| :--- | :--- | :--- | :--- |
| `example.com`| TXT | `600` | `"v=spf1 -all"` |
| `*._domainkey` | TXT | `600` | `"v=DKIM1; p="` |
| `_dmarc` | TXT | `600` | `"v=DMARC1; p=reject; sp=reject; adkim=s; aspf=s;"` |
| `example.com` | MX | `600` | `0 .` |

Tous les sous-domaines qui n'utilisent pas le mail devraient avoir un enregistrement NULL MX et un SPF qui est est paramétré en hardfail.

#### Explication :

**SPF hardfail :**

La seule valeur présente est `-all`, comme aucune autre valeur n'est spécifié, alors le test SPF échouera systématiquement.

**NULL MX :**

De ce que j'ai cru comprendre, le `.` vient de la [RFC2782](https://www.rfc-editor.org/rfc/rfc2782) qui signifie que l'hôte n'est pas disponible.
En voir plus dans la [RFC7505](https://www.rfc-editor.org/rfc/rfc7505)

**DKIM p= :**

Voir section [3.6.1](https://www.rfc-editor.org/rfc/rfc6376.html#section-3.6.1) et [6.1.2](https://www.rfc-editor.org/rfc/rfc6376.html#section-6.1.2).

La variable `p=` possède normalement la clé publique encodée en base64, si cette variable est vide, alors cela signifie que la clé est révoquée et le test DKIM échoue.

**DMARC**

Dans la mesure où les tests SPF et DKIM échouent systématiquement, si un attaquant usurpe votre nom de domaine pour envoyer des mails, DMARC rejettera ces mails.

## Systemd services

**Source :**

> - https://man.archlinux.org/man/systemd.exec.5.en

Template à utiliser dans un service systemd.

```bash
[Service]
#CapabilityBoundingSet=CAP_CHOWN CAP_DAC_OVERRIDE CAP_FOWNER
CPUSchedulingPolicy=batch
ExecStart=/usr/local/bin/yourscript
IOSchedulingPriority=7
LockPersonality=true
MemoryDenyWriteExecute=true
Nice=19
NoNewPrivileges=true
PrivateDevices=true
PrivateIPC=true
PrivateTmp=true
ProcSubset=pid
ProtectClock=true
ProtectControlGroups=true
ProtectHostname=true
ProtectKernelLogs=true
ProtectKernelModules=true
ProtectKernelTunables=true
ProtectProc=invisible
ProtectSystem=strict
#Overwrite ProtectSystem=strict folder with line below
#ReadWritePaths=/opt/somestuff
#PrivateUsers=true
RemoveIPC=true
RestrictAddressFamilies=AF_INET AF_INET6 AF_UNIX
RestrictNamespaces=true
RestrictRealtime=true
RestrictSUIDSGID=true
SystemCallArchitectures=native
SystemCallFilter=@system-service
SystemCallFilter=~@obsolete
Type=oneshot
UMask=0077
User=root
#User=user1
WorkingDirectory=/root
#WorkingDirectory=/opt/somestuff
```