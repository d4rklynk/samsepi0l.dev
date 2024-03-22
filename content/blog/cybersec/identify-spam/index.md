---
title: "Identifier les mails, les SMS et les sites web frauduleux"
date: 2023-07-17
tags: ["Cybersec", "Mail", "SMS"]
series: ["Signaler les fraudes"]
series_order: 1
---

Comment identifier un spam ? Faut-il douter de tous les mails ou uniquement de certains mails ? Quels sont les indices qui pourraient me faire penser qu'un mail ou un SMS est frauduleux ?

Je vais ici vous expliquer comment identifier un mail frauduleux. Mais au-delà de l'identification, je vais vous montrer comment faire pour ne plus jamais se faire avoir.

## Identification

### Mails

Voici l'exemple d'un mail qui me parait très louche.

![laposte.avif](laposte.avif)

Le fameux problème des frais de port.

Premièrement, vous ne devez pas vous fier à la légitimité d'un mail uniquement via les logos/images ou les fautes d'orthographe. J'ai déjà vu plusieurs fois des mails de La Poste qui ressemblaient très fortement à des arnaques (adresse mail bizarre, fautes d'orthographe, etc.) et qui étaient pourtant bien légitimes !

Le mail me parait légitime mais je ne l'ai jamais vu auparavant.

![adressemail.laposte.avif](adressemail.laposte.avif)

Et puis franchement, `notif-laposte.info@notif-laposte.info`, dans le mail, le nom de contact est le même que le nom de domaine, c'est bizarre quand même. L'adresse mail aurait été `no-reply@notif-laposte.info`, pourquoi pas, mais là...

`notif-laposte.info@notif-laposte.info`

Une adresse mail pareille, c'est sûrement une arnaque.

Premier réflexe, ne cliquez sur **aucun** bouton ou lien en cas de doute, accédez au site La Poste comme vous le faites d'habitude (un lien en favori ou via la recherche Google).

Deuxième réflexe, accédez à [ce site](https://lookup.icann.org/en) de l'ICANN pour vérifier le nom de domaine.

Je tape donc `notif-laposte.info` (le nom de domaine étant tout ce qui suit le `@` d'une adresse mail) et je clique sur le bouton "`Lookup`".

![icann.whois.avif](icann.whois.avif)

---

[WHOIS](https://fr.wikipedia.org/wiki/Whois) (en français, littéralement : "*Qui est ?*") est l'équivalent du numéro SIRET pour les entreprises, WHOIS vous permet de consulter les informations publiques d'un nom de domaine comme `samsepi0l.dev`, `antai.gouv.fr` ou juste `gouv.fr`. Vous aurez des informations telle que la date d'enregistrement du nom de domaine, le propriétaire, le mail de l'administrateur, le numéro de téléphone, etc... (Certaines informations peuvent être privées, comme pour le SIRET finalement.)

---

Ce qui nous intéresse ici, c'est la **date de création** du nom de domaine (aussi appelé date d'enregistrement) qui est une information systématiquement disponible au public. Un nom de domaine créé en vue d'une arnaque est souvent très jeune (n'a souvent pas plus d'un mois), si nous somme en Juillet, un nom de domaine pour une arnaque a de fortes chances d'avoir été créé en Juin. Les noms de domaine qui servent pour les arnaques sont souvent bloqués rapidement par la suite, ces noms de domaines ont généralement une vie très brève.

`notif-laposte.info` existe depuis Février 2020, c'est probablement un nom de domaine légitime, la probabilité qu'un nom de domaine pour une arnaque existe encore au bout de 3 ans est extrêmement infime.

Je reprends mon numéro de colis, pas celui noté dans le mail mais bien celui qui est noté sur le site **original** où j'ai effectué mon achat (Amazon, Fnac, etc.).

Je vais sur le site de La Poste, puis j'accède au service de suivi de colis. Et là, je remarque en effet que je dois payer des frais de port (car oui j'avais acheté un produit venant des États-Unis).

Le mail était en réalité **tout à fait légitime**.

### SMS

En réalité, pour les SMS, c'est exactement la même procédure que pour les mails, je ne vais donc pas m'attarder dessus puisque de toute façon, vous devriez suivre la méthode que je vais ci-dessous vous expliquer.

Cependant, je vous invite à regarder cette vidéo qui m'a donné envie d'écrire cette suite d'articles :

{{< youtubeLite id="6Jv0EzXdQbk" >}}

Voici une règle de base à respecter :

- S'il est écrit "*ne partagez ce code avec personne*" pour les codes de vérification, ne le partagez à **PERSONNE**.

## Comment ne plus se faire avoir

C'est bien beau tout ça, mais on ne va quand même pas douter et vérifier les noms de domaines de chaque mail que l'on reçoit, si ? Non, c'est perdre trop de temps et d'énergie.

Alors, la technique que j'utilise personnellement est assez simple, elle est basé sur le modèle [Zero Trust](https://wonderfall.space/evidence-based-security/#le-mod-le-id-al-zero-trust-security).

Voici les règles à respecter **QUELQUE** soit le mail ou le SMS :

- Ne cliquez **JAMAIS** sur aucun lien.
- Allez sur le site présumé via votre canal **HABITUEL** (via la barre de favori de votre navigateur, via votre application, etc.) et vérifiez les informations sur le dit-site.
- Plus le mail montre un aspect d'urgence (qu'il soit positif ou négatif), plus vous devez vous montrer prudent.
- Si c'est trop beau pour être vrai, c'est que c'est trop beau pour être vrai. Sauf rares exceptions, dans ce cas, vérifiez et revérifiez une infinité de fois avant de faire quoique ce soit.

Si vous suivez ces 4 conseils, vous serez tranquille.

{{< youtube id="jsJdlUtXrA0" >}}
