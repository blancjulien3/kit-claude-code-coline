# Kit Claude Code pour Coline

Ce kit installe en 10 minutes la même façon de travailler que Julien : une barre qui montre ta consommation en direct, des règles permanentes qui économisent tes tokens, et trois commandes (`/brainstorm`, `/plan`, `/bloc`) pour avancer par petites étapes sans tout recommencer à chaque fois.

Il est pensé pour l'abonnement Pro (20 €/mois) : le compteur est partagé entre le chat Claude et Claude Code, avec une limite par fenêtre de 5 heures et une limite par semaine. Le but est de ne jamais le vider trop vite.

## 1. Installer Claude Code dans VS Code

1. Installe VS Code (https://code.visualstudio.com) et Node.js version LTS (https://nodejs.org). Sur Mac, installe aussi Homebrew (https://brew.sh) puis, dans le Terminal : `brew install jq`.
2. Dans VS Code : icône Extensions (ou Cmd+Shift+X), cherche « Claude Code » (éditeur Anthropic, identifiant `anthropic.claude-code`), installe.
3. Clique sur l'icône Claude dans la barre latérale, puis **Sign in** avec ton compte Claude (celui de l'abonnement Pro). Si tu vois « Not logged in », tape `/login` dans la zone de chat.
4. Pour aussi avoir la commande `claude` dans le Terminal (utile pour ce kit), lance l'installeur officiel :

```
curl -fsSL https://claude.ai/install.sh | bash
```

Vérifie avec `claude --version` dans un nouveau Terminal.

## 2. Installer le kit

Dans le Terminal (Mac : application Terminal) :

```
cd ~/Downloads/KIT-CLAUDE-CODE-DEBUTANTE
bash install.sh
```

(Adapte le premier chemin si tu as mis le dossier ailleurs.)

Le script copie la barre de statut, les commandes et les règles dans `~/.claude`, en sauvegardant ce qui existait. Puis ouvre `~/.claude/CLAUDE.md` et remplace les crochets par tes vraies informations (ta marque, ta plateforme de boutique, l'adresse de ton site).

Relance Claude Code. Sous la zone de saisie tu dois voir une ligne comme :

```
🤖 Sonnet 5.5 │ 🧠 ctx: 12% │ 🕐 5h: 34% · reset 23/10 02h00 │ 📅 Sem: 41% · reset 29/10 20h00
```

- **ctx** : le remplissage de la conversation en cours. Au-dessus de 40 %, chaque message coûte cher. Au-dessus de 60 %, fais `/clear`.
- **5h** : ta fenêtre de 5 heures. À 80 %, termine ce que tu fais et attends la remise à zéro (l'heure est affichée).
- **Sem** : ta semaine. C'est le chiffre qui compte vraiment : au-dessus de 80 %, garde le reste pour l'essentiel.

Les mêmes chiffres sont aussi dans `/usage` à tout moment.

## 3. Comprendre le coût, en une image

Une conversation Claude est comme un cahier que Claude relit entièrement avant chaque réponse. Plus le cahier est long, plus chaque réponse coûte. D'où les trois réflexes :

1. **Un sujet par session.** Nouveau sujet = `/clear`.
2. **Le bon modèle.** Sonnet pour produire (ton défaut), Opus pour réfléchir (brainstorm, plan), Haiku pour ranger. Opus consomme nettement plus que Sonnet sur ton compteur (environ le double d'après l'expérience de Julien). Change avec `/model sonnet`, `/model opus`, `/model haiku`.
3. **Écrire la mémoire dans des fichiers.** `BRIEF.md` et `PLAN.md` dans le dossier du projet gardent tout : tu peux fermer et reprendre sans réexpliquer.

Ce que tu n'as pas sur Pro : le modèle Fable (le plus puissant, que Julien utilise) et le mode rapide inclus. Ce n'est pas un problème : Opus 5.5 est très largement suffisant pour réfléchir, et Sonnet 5.5 pour produire.

## 4. La méthode en trois commandes

Toujours dans le dossier du projet (dans VS Code : Fichier, Ouvrir le dossier).

| Étape | Commande | Modèle | Ce qui se passe |
|---|---|---|---|
| 1. Réfléchir | `/model opus` puis `/brainstorm "mon idée"` | Opus | Claude propose une direction complète, pose ses questions en une fois, écrit `BRIEF.md`. |
| 2. Découper | `/clear`, `/model opus`, `/plan` | Opus | Claude lit le brief et écrit `PLAN.md` : des blocs de 20 min à 1 h, chacun avec son modèle et sa marche à suivre. |
| 3. Produire | `/clear`, `/model sonnet`, `/bloc 1` | Sonnet | Claude exécute le bloc 1, teste, met à jour le plan, te rend compte et attend ton « ok ». Puis `/clear` et `/bloc 2`. |

Pourquoi `/clear` entre chaque étape : une session neuve qui lit seulement BRIEF.md ou PLAN.md coûte très peu. Garder la même conversation du brainstorm jusqu'au bloc 5 coûterait plusieurs fois plus.

Exemples d'idées de départ pour toi :

- `/brainstorm "refaire la page d'accueil de ma boutique pour mettre en avant la nouvelle collection"`
- `/brainstorm "écrire les fiches produit des 12 nouveaux articles avec le même ton"`
- `/brainstorm "une série de 5 vidéos courtes pour Instagram sur les coulisses de l'atelier"`

## 5. Ce que fait le kit pour te protéger

- Mode `acceptEdits` : Claude modifie les fichiers du projet sans te demander à chaque fois, mais te demande confirmation avant les commandes système. Quand tu seras à l'aise, Julien pourra te montrer le mode « bypass » qui ne demande plus rien.
- Les règles interdisent à Claude de supprimer avec `rm`, de toucher à ta boutique en ligne réelle, de publier, d'envoyer un email ou de payer sans te l'avoir montré d'abord.
- Avant tout changement risqué : copie de sauvegarde datée.

## 6. Les vidéos

Tout est expliqué dans `video/LISEZMOI-VIDEO.md`. En résumé : tu copies le dossier `video/`, Claude y installe HyperFrames (gratuit), tu remplis la charte de ta marque, et `/video "une idée"` produit un MP4 en deux arrêts (script, puis planche d'images). Une vidéo = une session, et uniquement quand la barre est basse.

## 7. Sauvegarder tes projets avec GitHub (optionnel mais conseillé)

Tu as un compte GitHub (`Colinechartier`). Pour qu'un projet y soit sauvegardé, dis simplement à Claude dans le dossier du projet :

```
Initialise Git dans ce dossier, crée un dépôt privé sur mon compte GitHub Colinechartier et pousse le contenu. Explique-moi chaque étape en une ligne.
```

Il te demandera de te connecter une fois avec `gh auth login`. Ensuite, chaque fin de bloc peut être sauvegardée par un simple « commit et push ».

## 8. Les commandes à connaître par cœur

| Commande | Effet |
|---|---|
| `/clear` | Nouvelle conversation vide (le réflexe numéro 1) |
| `/usage` | Ta consommation 5 h et semaine |
| `/model sonnet` | Passer en Sonnet (production) |
| `/model opus` | Passer en Opus (réflexion) |
| `/effort medium` | Moins de réflexion, moins de tokens, pour le contenu simple |
| `/context` | Voir ce qui remplit la conversation |
| `/compact` | Résumer la conversation pour la raccourcir (préférer `/clear` quand c'est possible) |
| `Échap` | Interrompre Claude s'il part dans une mauvaise direction (chaque seconde coûte) |

## En cas de problème

- La barre affiche « — » partout : vérifie que `jq` est installé (`jq --version`) et que tu es connectée (`/login`). Les chiffres 5 h et semaine apparaissent après ton premier message.
- Claude demande une autorisation à chaque action : normal en mode `acceptEdits` pour les commandes système. Réponds « Yes, and don't ask again » quand c'est une commande sûre.
- Quelque chose ne marche pas : envoie à Julien une capture de la barre et le message d'erreur.
