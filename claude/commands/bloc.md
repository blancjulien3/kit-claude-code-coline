---
description: Exécuter un bloc de PLAN.md dans la session courante, tester, mettre à jour le plan, rendre compte et attendre ma validation.
argument-hint: [numéro de bloc, défaut = premier bloc à faire]
---

# /bloc

Argument : $ARGUMENTS

## Avant de commencer

1. Lis `PLAN.md`. Prends le bloc demandé, sinon le premier bloc « à faire » dont les dépendances sont faites. Pas de PLAN.md : propose `/plan` et arrête-toi.
2. Lis seulement les parties de `BRIEF.md` que le bloc référence, si le plan ne suffit pas.
3. Compare le modèle que tu es avec celui prévu pour le bloc. Si tu es Opus sur un bloc prévu Sonnet ou Haiku : dis-le en une ligne et propose `/model sonnet` avant de continuer. Continue seulement si je confirme.
4. Vérifie les prérequis du bloc (accès, textes, images, comptes). S'il en manque : liste précise de ce qu'il faut, puis arrêt. Ne contourne pas avec du faux contenu.
5. Marque le bloc « en cours » dans PLAN.md.

## Exécution

- Suis les étapes du bloc. Droit au but : pas de refonte hors périmètre. Une amélioration évidente hors bloc se note dans « Reste à finir », elle ne se fait pas maintenant.
- Avant tout changement sur un fichier existant important : copie de sauvegarde datée (ou commit Git si le dossier en a un).
- Après 3 tentatives sans succès sur un même problème : arrête-toi, explique-moi 2 ou 3 pistes vraiment différentes avec leurs avantages et risques, et laisse-moi choisir.
- Si la barre de statut dépasse 60 % de contexte : termine l'étape en cours, mets le journal du bloc à jour dans PLAN.md, et propose de reprendre après `/clear` avec `/bloc N`.
- Toute action vers l'extérieur (publication, email, paiement, modification de la boutique réelle) : me la montrer d'abord et attendre mon « ok ».

## Fin de bloc

1. Teste réellement le résultat (ouvrir la page, vérifier l'affichage, lire le texte à voix haute si c'est du contenu). Corrige ce qui vient du changement.
2. Relis ce qui a été touché, enlève les doublons et le brouillon.
3. Mets à jour PLAN.md : statut « fait », « Reste à finir », journal (date, modèle réel, écarts, décisions).
4. Compte rendu court :
   - Résultat et ce que je peux tester moi-même (adresse, parcours)
   - Fichiers touchés
   - Vérifications faites
   - Reste à finir et limites
   - Prochain bloc et sa marche à suivre exacte (`/clear`, `/model ...`, `/bloc N+1`)
5. Arrête-toi et attends ma validation. N'enchaîne jamais sur le bloc suivant de ta propre initiative.
