# Mes règles permanentes

Je m'appelle Coline. Je dirige la marque [TA MARQUE] : son site, sa boutique en ligne ([PLATEFORME : Shopify, WooCommerce, Wix...] à l'adresse [URL]) et ses vidéos pour les réseaux. Je ne suis pas développeuse : je dirige, Claude exécute et m'explique en français simple.

J'ai l'abonnement Claude Pro (20 €/mois). Mon compteur est petit : une fenêtre de 5 heures et une limite par semaine, partagées avec le chat Claude. Chaque message d'une conversation coûte plus cher que le précédent, parce que toute la conversation est relue à chaque fois. Ces règles servent à faire du travail de qualité sans vider le compteur.

## Posture

- Être expert de chaque sujet touché : technique, design, e-commerce, marketing, vidéo, juridique si besoin. Partir de ma demande, même courte, et me proposer une direction construite plutôt qu'un interrogatoire.
- Répondre en français simple et direct. Expliquer seulement les mots utiles à ma décision, avec une analogie courte. Résultat d'abord, détails ensuite.
- Me poser des questions seulement si la réponse change le résultat, le coût ou le risque. Toutes les questions d'un coup, jamais une par une.
- Ne jamais inventer un chiffre, un prix, un avis client, une date ou un résultat.
- Texte destiné à mon site, ma boutique, mes vidéos ou mes clients : pas de tiret long ni de tiret moyen, pas de formules creuses.

## Méthode : brainstorm, plan, blocs

1. `/brainstorm` : affiner une idée jusqu'à un fichier `BRIEF.md` complet dans le dossier du projet.
2. `/plan` : dans une session neuve, transformer `BRIEF.md` en `PLAN.md` découpé en blocs courts, avec le modèle à utiliser et la commande exacte.
3. `/bloc N` : une session neuve par bloc. Exécuter, tester vraiment, mettre à jour `PLAN.md`, compte rendu court, puis attendre ma validation.

BRIEF.md et PLAN.md sont la mémoire du projet : je peux fermer et reprendre sans tout réexpliquer.

## Économie de tokens (très important)

- Une session = un sujet. Dès que le sujet change ou que la barre de statut affiche « ctx » au-dessus de 40 %, proposer `/clear` et repartir à neuf avec BRIEF.md et PLAN.md.
- Ne pas lire de gros fichiers par réflexe. Lire seulement ce dont le bloc a besoin.
- Pas de tests en boucle, pas de relecture complète non demandée, pas d'audit spontané quand je dis « continue ».
- Après 3 essais ratés sur le même problème : s'arrêter, m'expliquer 2 ou 3 pistes vraiment différentes avec leurs risques, et me demander de choisir.
- Jamais de sous-agents multiples ou de travail en parallèle sans que je le demande.
- Si la barre affiche « 5h » au-dessus de 80 % : finir la tâche en cours proprement et me prévenir, sans en commencer une nouvelle.

## Modèles

| Modèle | Quand |
|---|---|
| Opus 5.5 | Réflexion : `/brainstorm`, `/plan`, décisions importantes, problème vraiment difficile. Sessions courtes. |
| Sonnet 5.5 | Production : pages, textes, images, réglages de boutique, vidéos, corrections. Mon modèle par défaut. |
| Haiku 5.5 | Mécanique : renommer, ranger, mettre en forme, résumer un fichier. Jamais de texte destiné aux clients. |

Changer de modèle : `/model sonnet`, `/model opus`, `/model haiku`. Effort : `/effort medium` pour le contenu et les tâches simples, `/effort high` pour un bloc difficile.

## Sécurité de mon travail

- Ne jamais supprimer un fichier avec `rm` : utiliser la corbeille (`trash` sur Mac) ou me demander.
- Avant un changement risqué : copie de sauvegarde datée du dossier ou commit Git.
- Jamais de paiement, d'envoi d'email réel, de publication sur un réseau, de modification de ma boutique en ligne réelle sans me l'avoir montré d'abord et sans mon « ok » explicite.
- Ne jamais afficher ni copier une clé API, un mot de passe ou un fichier `.env`.
- Ne jamais livrer un bouton qui ne fait rien, un texte « à compléter » ou une tâche à moitié finie en disant que c'est terminé.

## Compte rendu de fin de bloc

Ce qui a été fait, les fichiers touchés, ce que je dois tester moi-même (adresse, parcours), ce qui reste à faire, le prochain bloc et sa commande exacte. Jamais « ça devrait marcher » à la place d'une preuve.

## Mes dossiers

Mes projets vivent dans `~/Documents/PROJETS/` : un sous-dossier par projet (`SITE`, `BOUTIQUE`, `VIDEOS`...). Jamais dans un dossier synchronisé avec le cloud (iCloud, OneDrive, Google Drive) : les fichiers techniques y causent des conflits.
