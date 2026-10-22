---
description: Transformer BRIEF.md en PLAN.md découpé en blocs courts (modèle, effort, prérequis, commande, validation). À lancer en Opus, session neuve.
argument-hint: [précision optionnelle]
---

# /plan

Précision : $ARGUMENTS

## Rôle

Tu écris le plan de production qui permettra d'exécuter chaque bloc dans une session séparée, avec le bon modèle, sans aller-retour. Une question posée maintenant coûte moins cher qu'un aller-retour en production.

## Étape 0 : lire le strict nécessaire

1. `BRIEF.md` à la racine. S'il n'existe pas : dis-le et propose `/brainstorm`. N'écris pas de plan sans brief.
2. `PLAN.md` existant : tu le mets à jour, tu ne l'écrases pas. Les blocs faits restent, les nouveaux s'ajoutent.
3. Dossier avec des fichiers existants : liste-les, lis un éventuel README. Ne lis pas tout.
4. Regarde la barre de statut (usage 5 h et semaine) pour proposer une répartition réaliste des blocs sur les prochains jours.

## Étape 1 : questions groupées

Avec l'outil de choix structuré, d'un coup (4 questions au maximum, 2 tours au maximum), uniquement ce qui manque pour écrire le plan sans surprise. Si tout est dans le brief, ne pose rien.

## Étape 2 : écrire PLAN.md

Règles de découpage, adaptées à un abonnement Pro :

- Un bloc = un résultat visible et testable par moi, entre 20 minutes et 1 heure de travail machine. Court, parce qu'un bloc doit tenir largement dans une fenêtre de 5 h avec de la marge.
- Ordre par dépendances ; quelque chose de visible le plus tôt possible.
- Bloc 0 = mise en place : dossier, sauvegarde de l'existant, éventuel dépôt Git, structure. Dernier bloc = vérification finale et nettoyage.
- Regrouper le mécanique (renommages, mises en forme, rangement) dans des blocs Haiku.
- Les [IDÉE] du brief deviennent des blocs « optionnel » ou s'intègrent aux blocs concernés.

Modèle par bloc (une phrase de justification) :

- Opus 5.5 : rare. Logique vraiment délicate, bloc où une erreur coûte cher (paiement, données clients).
- Sonnet 5.5 : défaut. Pages, textes, visuels, réglages, vidéos, corrections.
- Haiku 5.5 : mécanique uniquement.
- Effort : medium pour le contenu simple, high pour un bloc difficile, low pour le mécanique.
- Coût estimé par bloc : faible, moyen ou élevé, pour répartir sur plusieurs fenêtres de 5 h.

Structure de `PLAN.md` :

```
# PLAN : <nom>
Date : <AAAA-MM-JJ> · Brief : BRIEF.md
Objectif en 2 lignes.

## Ce que je dois fournir
| Élément | Pourquoi | Où le trouver | Nécessaire avant |

## Manipulations à faire moi-même
Liste numérotée, précise, avec le moment (avant le bloc N, ou en cours).

## Répartition suggérée
Ex : blocs 0 et 1 aujourd'hui (fenêtre 5 h à X %), blocs 2 et 3 demain. Rappel : /clear et une session neuve par bloc.

## Blocs
### Bloc N : <titre>
- Statut : à faire | en cours | fait | validé | bloqué
- Objectif :
- Résultat testable :
- Modèle : <opus|sonnet|haiku> · Effort : <low|medium|high> · Coût estimé : <faible|moyen|élevé>
- Pourquoi ce modèle :
- Lancement : `/clear`, puis `/model <modèle>`, puis `/effort <effort>`, puis `/bloc N`
- Dépend de : blocs ...
- Prérequis : ...
- Étapes : 3 à 6 puces concrètes
- Ce que je teste pour valider :
- Reste à finir : (vide au départ)
- Journal : (date, modèle réel, écarts, décisions)
```

## Étape 3 : livrer

1. Écris `PLAN.md`, relis-le une fois pour vérifier qu'aucun bloc ne dépend d'une information absente.
2. Réponds-moi avec : le nombre de blocs, ce que je dois fournir avant le bloc 1, la répartition suggérée, et la marche à suivre exacte pour le bloc 1.
3. Ne commence pas l'exécution.
