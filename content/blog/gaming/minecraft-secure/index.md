---
title: "Configurer et sécuriser un serveur Minecraft"
date: 2024-03-24
tags: ['Gaming', 'Cybersec', 'Guide']
---

Vous souhaitez jouer avec un ami, mais ne savez pas comment créer un serveur Minecraft ? Je vais vous guider pour que vous puissiez jouer sur un serveur avec vos amis sans que des petits malins puissent s'y connecter.

Je préfère jouer en vanilla, les mods qui sont installés dans ce guide n'auront pas ou très peu d'impact sur l'expérience de jeu. Ils sont avant tout installés pour améliorer les performances de jeu.

## Prérequis

- Savoir utiliser un système Linux
- Connaissances basiques de Docker, docker compose et des conteneurs
- Savoir se connecter en SSH avec des clés
- Posséder une paire de clé SSH (suivre [cet article](https://wonderfall.space/retour-du-root-ssh/#sur-des-machines-distantes-mon-h%C3%A9ros-ssh-et-comment-je-lutilise) pour en générer une)

### VPS

Un serveur Minecraft n'est pas très demandant en ressources, le VPS `VLE-2` (~5.50€/mois) proposé [chez OVH](https://www.ovhcloud.com/fr/vps/) devrait être suffisant si vous êtes moins de ~5 joueurs.

### Système d'exploitation

Pour le système d'exploitation, j'ai choisi Fedora Server, il est conseillé d'utiliser ce système car certaines configurations dans ce guide sont spécifiques aux distributions basés sur Red HaT Entreprise Linux.

## Sécurisation SSH

En tout premier lieu, vous allez sécuriser la connexion à votre serveur.

Je me suis basé sur [les configurations systèmes de GrapheneOS](https://github.com/GrapheneOS/infrastructure), parce que je sais qu'elles sont fonctionnelles, propres et sécurisées. Cela me permet de me concentrer uniquement sur la configuration de mes applications. En ce qui concerne la sécurisation du système, je fais confiance au personnes du projet qui font un travail plus que sérieux en terme de sécurité, je copie donc les configurations système que propose le projet GrapheneOS.

Copiez le contenu de [ce fichier](https://github.com/GrapheneOS/infrastructure/blob/main/ssh/sshd_config) et collez-le dans `/etc/ssh/sshd_config` (remplacez la totalité du contenu par la configuration de GrapheneOS).

{{< alert icon="none" cardColor="#e63946" iconColor="#1d3557" textColor="#f1faee" >}}
Concernant cette configuration SSH, vous devrez **impérativement** :

- Posséder une paire de clé de type **ED25519**.
- Changer la variable `MaxAuthTries` à `3` au lieu de `1` dans le fichier `/etc/ssh/sshd_config` au cas où vous faites une erreur pour je ne sais quelle raison.
- Changer la variable `AllowUsers` à `root` au lieu de `{{ssh_users}}` dans le fichier `/etc/ssh/sshd_config` (puisque vous vous connecterez au serveur via l'utilisateur root).
{{< /alert >}}

## Installation Fedora

Si vous avez choisi Fedora comme système, il est possible que la version donné par OVH soit la précédente version, il est préférable de mettre à jour vers la dernière version de Fedora.

Suivez [ce guide](https://docs.fedoraproject.org/en-US/quick-docs/upgrading-fedora-offline/) pour mettre à jour Fedora.

## Sécurisation du système

## Installation docker

## Configuration de docker-compose.yml

## Configuration de server.properties

## Have fun
