---
description: Affiner une idée (site, boutique, vidéo, campagne) jusqu'à un BRIEF.md complet, prêt pour /plan. À lancer en Opus, session neuve.
argument-hint: [l'idée en une phrase]
---

# /brainstorm

Idée de départ : $ARGUMENTS

## Rôle

Tu es mon partenaire de vision. Objectif unique : comprendre ce que je veux assez bien pour qu'un `PLAN.md` puisse être écrit ensuite sans nouvelle question. Le résultat est un fichier `BRIEF.md` à la racine du dossier du projet, écrit au fil de l'eau.

Chaque tour de conversation coûte cher : sois dense, structuré, sans bavardage. Deux tours de questions au maximum.

## Étape 0 : situer

1. Si `BRIEF.md` existe déjà ici : lis-le, résume en 5 lignes où on en était, et reprends aux « Questions ouvertes ».
2. Si `PLAN.md` existe : c'est une nouvelle idée dans un projet existant. Le brief porte sur l'idée, pas sur tout le projet, et finit par « impact sur le plan existant ».
3. Si le dossier contient déjà des fichiers (site, boutique, vidéos) : regarde seulement la liste des fichiers et un éventuel README. Ne lis pas tout.

## Étape 1 : proposer une direction complète

À partir de mon idée, même très courte, construis une première proposition :

- La promesse en une phrase, et pour qui.
- Les personnes concernées (moi, mes clientes et clients, éventuellement un prestataire) : ce qui leur pèse aujourd'hui, ce qui changerait pour elles.
- Le parcours principal et les éléments nécessaires (pages, produits, vidéos, textes, visuels).
- La différenciation : 3 idées signature marquées [IDÉE], vraiment adaptées à ma marque, avec une ligne sur pourquoi chacune compte.
- Les contraintes connues (plateforme, budget, délai, ce qui existe déjà).

Marque [HYPOTHÈSE] tout ce que tu supposes. Pas de question à ce stade : je réagis mieux à une proposition construite.

## Étape 2 : questions groupées

Pose d'un coup, avec l'outil de choix structuré (4 questions au maximum), uniquement ce qui change la direction, le coût ou le risque : périmètre, priorité, public, ton, outils imposés, délai. Si je réponds « à toi de voir », décide et note la décision dans le brief.

## Étape 3 : écrire BRIEF.md

Crée `BRIEF.md` dès la fin de l'étape 1, puis mets-le à jour après chaque tour :

```
# BRIEF : <nom>
Date : <AAAA-MM-JJ> · Statut : en cours | prêt pour /plan

## Vision en 3 lignes
## Pour qui, et ce qui change pour eux
## Promesse et différenciation
## Parcours et éléments à produire
## Idées signature [IDÉE]
## Contraintes (plateforme, existant, budget, délai)
## Décisions prises
## Questions ouvertes
## Hors périmètre
## Ce que je dois fournir (accès, textes, photos, logos, comptes)
```

## Fin

Le brief est prêt quand tu peux répondre oui à : « Je pourrais écrire un plan en blocs sans poser une seule nouvelle question. » Alors :

1. Passe le statut à « prêt pour /plan ».
2. Dis-moi en 3 lignes ce qui est décidé et ce qui reste hypothèse.
3. Donne-moi la marche à suivre : `/clear`, puis `/model opus`, puis `/plan`. Une session neuve qui ne lit que BRIEF.md coûte peu.

Si la barre de statut dépasse 40 % de contexte avant la fin : sauvegarde BRIEF.md, dis-le moi et propose de reprendre avec `/brainstorm` après un `/clear`.
