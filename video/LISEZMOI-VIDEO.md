# Faire des vidéos avec Claude Code (méthode HyperFrames)

Julien fabrique ses vidéos de motion design avec Claude Code et un outil gratuit qui s'appelle HyperFrames : la vidéo est décrite comme une page web animée, puis rendue en MP4. Pas de montage à la main. Ce dossier reproduit sa méthode, adaptée à ta marque et à ton abonnement Pro.

## Avertissement sur la consommation

Une vidéo consomme beaucoup : script, direction artistique, composition, contrôle visuel. Compte qu'une vidéo peut occuper une grande partie d'une fenêtre de 5 h. Règles :

- Une vidéo = une session (`/clear` avant). Jamais deux vidéos dans la même session.
- Regarde la barre de statut avant de lancer : « 5h » sous 30 % et « Sem » sous 60 %, sinon attends la remise à zéro.
- Pas de variantes : une seule version par vidéo, puis des retouches ciblées.
- Modèle : Sonnet 5.5 par défaut. Opus seulement si le résultat Sonnet déçoit vraiment.

## Installation (une seule fois)

Prérequis : Node.js 22 ou plus (https://nodejs.org, version LTS).

1. Copie ce dossier `video/` dans tes projets, par exemple `~/Documents/PROJETS/VIDEOS/`.
2. Dans VS Code, ouvre ce dossier, lance Claude Code et tape :

```
Installe HyperFrames dans ce dossier avec `npx hyperframes skills` (le jeu complet de skills), puis vérifie avec `npx hyperframes skills check`. Ne crée aucune vidéo pour l'instant.
```

3. Remplis `kit/marque/frame.md` (couleurs, polices, ton) et `kit/produit/PRODUIT.md` (ta marque, tes produits, tes messages exacts). Mets tes logos dans `kit/logos/` et des captures ou photos réelles dans `kit/captures/`. Ce kit est la source de vérité : Claude n'invente ni chiffre, ni promesse, ni visuel du produit.

## Faire une vidéo

Dans une session neuve (`/clear`, `/model sonnet`) :

```
/video "une idée en une phrase"
```

Exemple : `/video "montrer le déballage de la nouvelle collection, ambiance douce, 20 secondes, pour Instagram"`.

Claude s'arrête deux fois pour te montrer : le script (tu dis « ok » ou tu corriges), puis une planche d'images clés (tu dis « ok »). Ensuite il rend la vidéo dans `videos/<nom>/renders/video.mp4` et fait un contrôle qualité.

Pour s'inspirer d'une vidéo existante (Instagram, TikTok, YouTube) sans la copier : décris simplement ce que tu aimes dans le prompt (« rythme rapide comme les vidéos de X, textes gros, fond clair »).

## Si quelque chose manque

Si Claude dit qu'un besoin n'est couvert par aucun skill (musique, image générée, effet particulier), il s'arrête et te propose une solution. C'est normal : il ne doit pas bricoler.
