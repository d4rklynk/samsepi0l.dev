---
title: "Un bref guide sur WKD"
date: 2023-05-11
tags: ['WKD', 'Mail']
---

Super ! Vous venez de créer votre clé PGP et vous pouvez maintenant discuter par mail de Zelda Tears Of The Kingdom (qui est au passage incroyable) à votre meilleur ami. Mais voilà, vous devez lui donner votre clé publique, donc vous vous décidez de mettre votre clé publique sur votre site web pour simplifier la vie des gens qui veulent vous envoyer des mails chiffrés. Cependant, votre ami commence à en avoir marre d'aller à chaque fois chercher les clés publiques de chacun en trifouillant partout sur le web 😅️. Et c'est tout à fait compréhensible... c'est pas comme si le chiffrement des mails était déjà assez pénible comme ça... 😒️.

Et imaginez, vous avez plusieurs mails pour le même domaine ! Non mais on est où là ? On va pas aller tous les chercher à la main si ???

C'est là que WKD intervient (et c'est bien pratique).

WKD signifie [Web Key Directory](https://wiki.gnupg.org/WKD). Cette technologie permet de rassembler vos clés PGP publiques sur un serveur web. Vous avez deux solutions, la première est d'aller sur [https://keys.openpgp.org/](https://keys.openpgp.org/) et de téléverser votre clé. Vous pouvez ensuite gérer vos clés ou les supprimer. Simple et efficace. 

Mais dans cet article, je veux faire complexe (mais toujours efficace). On va donc implémenter notre WKD. C'est notre deuxième solution, et vous allez voir, c'est super simple.

---

Bon déjà, il faut de toute évidence posséder une paire de clés PGP, je pars du principe que vous en avez déjà une, donc je ne vais pas m'attarder dessus, mais si jamais, voici la commande sous Linux :

```bash
gpg --gen-key
```

Si vous utilisez [Proton Mail](https://pr.tn/ref/70YSNN4NQDYG) (*lien de [parrainage](https://proton.me/fr/support/referral-program) et non d'affiliation*), vous pouvez également télécharger la clé privée de votre adresse mail custom (si vous en avez configuré avec votre nom de domaine).

---

Ensuite, importez votre clé si ce n'est pas déjà fait :

```bash
gpg --import /chemin/vers/votrecléprivée.asc
```

Vérifiez que votre clé est bien présente :

```bash
gpg --list-keys
```

Puis récupérez le hash de votre utilisateur mail (*exemple avec mon nom de domaine*) :

```bash
gpg --list-keys --with-wkd contact@samsepi0l.dev
```

Vous devriez voir ceci (toujours avec mon nom de domaine) :

```bash
pub   ed25519 2023-04-05 [SC]
      E88058B8A7F1AD342C6989EE21E599E2AB9029F7
uid           [ unknown] contact@samsepi0l.dev <contact@samsepi0l.dev>
              dj3498u4hyyarh35rkjfnghbjxug6b19@samsepi0l.dev
sub   cv25519 2023-04-05 [E]
```

Le hash du nom d'utilisateur est `dj3498u4hyyarh35rkjfnghbjxug6b19`, gardez-le de côté.

Sur votre serveur, créez un dossier `.well-known`, puis à l'intérieur de celui-ci, créez un autre dossier `openpgpkey`, puis dans ce dernier, créez le dossier `hu`. Sous Linux :

```bash
mkdir -p .well-known/openpgpkey/hu
```

Créez un fichier nommé `policy` dans le dossier `openpgpkey`, laissez-le **vide**.

```bash
touch .well-known/openpgpkey/policy
```

Placez-vous dans le dossier `hu` puis exportez votre clé publique dans un fichier portant le précédent hash comme nom :

```bash
gpg --export contact@samsepi0l.dev > dj3498u4hyyarh35rkjfnghbjxug6b19
```

À partir de maintenant, ce petit fichier est accessible sur le web par ce lien :

`https://example.com/.well-known/openpgpkey/hu/dj3498u4hyyarh35rkjfnghbjxug6b19`

Exemple avec le mien :

`https://samsepi0l.dev/.well-known/openpgpkey/hu/dj3498u4hyyarh35rkjfnghbjxug6b19`

C'est sur cette URL que les clients mail chercheront pour récupérer la clé publique de votre adresse mail. 🎯️

Vous devez par contre autoriser [toutes les origines](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Access-Control-Allow-Origin) à accéder à cette ressource. Pour cela, autorisez le dossier `hu` dans les headers HTTP :

```
/.well-known/openpgpkey/hu/*
  Access-Control-Allow-Origin: *
```

Ou sur Nginx par exemple :

```
location ^~ /.well-known/openpgpkey/hu {
        add_header Access-Control-Allow-Origin *;
    }
```

Et voilà, si vous ouvrez "OpenPGP Key Manager" sur Mozilla Thunderbird, vous pourrez taper votre adresse mail, et Thunderbird ira chercher la clé publique correspondante à votre adresse mail pour vous !

![keyserver.png](/blog/keyserver.png)

Sur Proton Mail par exemple, vous pourrez voir le petit cadenas vert s'afficher, ce qui signifie qu'il a réussi à trouver et télécharger votre clé publique automatiquement !

![protongreenlock.png](/blog/protongreenlock.png)

Cool non ? 😎️

Si vous avez plusieurs adresses mail (du même nom de domaine ⚠️), vous pouvez refaire les mêmes étapes pour la nouvelle adresse, à la fin, vous devriez avoir deux fichiers hash (contenant les clés publiques respectives à chaque adresse mail).

> Exemple : Si j'avais `contact@samsepi0l.dev` et `moi@samsepi0l.dev`, je referai les mêmes étapes avec `moi@samsepi0l.dev`, et inclurai le nouveau fichier hash contenant ma clé publique dans le dossier `hu`. J'aurai donc deux fichier : `dj3498u4hyyarh35rkjfnghbjxug6b19` pour contact@samsepi0l.dev et `9hjdh598gj3yux1jabbh778g43` pour moi@samsepi0l.dev.

Vous pouvez ensuite vérifier que tout est bon en allant sur [ce site](https://metacode.biz/openpgp/web-key-directory).
Insérez votre mail et regardez le résultat :

![wkdchecker.png](/blog/wkdchecker.png)

Voilà, si vous êtes ici, c'est que vous avez probablement réussi ! 😄️
Bravo 👏️
