---
description: Produire une vidéo de motion design pour ma marque à partir d'une idée, en n'enchaînant que les skills HyperFrames du dossier
argument-hint: "\"idée de la vidéo\""
---

# /video : une vidéo à partir d'une idée

Idée : $ARGUMENTS

Règles permanentes :
1. Skills uniquement : chaque étape charge le skill HyperFrames nommé avec l'outil Skill. Rien de maison, ni script ni recette. Une commande ffmpeg standard d'une ligne est permise.
2. `npx hyperframes snapshot` toujours avec `--describe false`. `HYPERFRAMES_SKIP_SKILLS=1` devant `init` pour ne pas réinstaller les skills à chaque vidéo.
3. Aucun chiffre hors `kit/produit/PRODUIT.md`, aucune image du produit inventée : seulement `kit/captures/` et `kit/logos/`. Pas de tiret long ni moyen à l'écran.
4. Carte de fin obligatoire, définie dans `kit/marque/frame.md`.
5. Étape non couverte par un skill : arrêt, explication, proposition. Jamais de contournement.
6. Une seule version par vidéo, jamais de variantes.

## Étape 1 : intention et script

Skills : `hyperframes`, puis `product-launch-video` pour sa méthode de script.

1. `hyperframes` capture l'intention sans poser ses questions : format 1080x1920 (sauf si l'idée dit « YouTube » ou « 16:9 »), langue `fr`, public tiré de `PRODUIT.md`, `narration: no` par défaut (muet, textes animés, musique de fond), `storyboard: yes`.
2. Propriétaire : `motion-graphics` pour une pièce courte sans voix (le défaut), `general-video` si plusieurs scènes ou une voix.
3. Nommer le projet en kebab-case (`<slug>`), puis : `HYPERFRAMES_SKIP_SKILLS=1 npx hyperframes init videos/<slug> --non-interactive --example=blank --skill=<propriétaire> --resolution portrait`.
4. Écrire `videos/<slug>/BRIEF.md` (format `hyperframes/references/brief-format.md`) et `videos/<slug>/SCRIPT.md` : 60 mots au plus, une accroche de 8 mots au plus, une seule idée, une preuve visible (photo ou capture réelle), un appel, puis la carte de fin.
5. Copier la charte : `cp kit/marque/frame.md videos/<slug>/frame.md`.

**Arrêt 1** : me montrer le script en entier, le nombre de mots, le son prévu, et attendre mon « ok » ou mes corrections.

## Étape 2 : look et planche

Skills : `hyperframes-creative`, `hyperframes-studio`, `hyperframes-registry`, `media-use`, `hyperframes-cli`.

1. `hyperframes-creative` lit `frame.md` en premier.
2. `hyperframes-studio` donne le storyboard, l'ordre de construction et les zones sûres. Les visuels du produit viennent de `kit/captures/`.
3. Avant tout visuel nommé (téléphone, carte, graphique) : `npx hyperframes catalog --query "<en anglais>" --json`, puis `npx hyperframes add <nom>`.
4. `media-use` pour la musique de fond. Aucune génération payante sans mon accord explicite.
5. Construire juste assez pour la planche, puis `npx hyperframes snapshot videos/<slug> --at <t1,...,t5> --no-end --describe false` sur 4 ou 5 images clés.

**Arrêt 2** : me montrer la planche, une ligne par image, et attendre mon « ok ».

## Étape 3 : composition et rendu

Skills : le propriétaire, `hyperframes-core`, `hyperframes-animation`, `hyperframes-keyframes`, `hyperframes-audio`, `hyperframes-cli`.

1. Suivre le flux du propriétaire en sautant ce qui est déjà fait. Textes animés sur leur propre piste, dans la zone sûre.
2. `npx hyperframes check videos/<slug>` jusqu'à zéro erreur.
3. Rendu : `npx hyperframes render videos/<slug> -q delivery -o videos/<slug>/renders/video.mp4`, puis vérifier durée et taille avec `ffprobe`.

## Étape 4 : contrôle

1. `npx hyperframes snapshot videos/<slug> --frames <durée en s> --no-end --against videos/<slug>/renders/video.mp4 --describe false -o videos/<slug>/snapshots/controle`.
2. Regarder les captures et répondre, sens d'abord : comprend-on la marque en 5 s ? l'accroche arrête-t-elle le pouce ? un seul message par écran ? la preuve est-elle réelle ? l'appel est-il clair ? Puis la forme : texte net, zone sûre, contraste, carte de fin.
3. Verdict : « publiable », ou 5 corrections mesurables au plus, appliquées une fois, puis nouveau rendu.

## Compte rendu

Chemin du MP4, durée, ce que j'ai validé, ce qui reste perfectible, et une ligne dans `videos/JOURNAL.md` (date, slug, modèle, verdict).
