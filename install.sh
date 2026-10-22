#!/bin/bash
# Installe le kit dans ~/.claude sans écraser ce qui existe (sauvegarde datée), puis ouvre le guide PDF.
# Usage : bash install.sh
KIT="$(cd "$(dirname "$0")" && pwd)"
CL="$HOME/.claude"
STAMP=$(date +%Y%m%d-%H%M%S)
mkdir -p "$CL/scripts" "$CL/commands" "$CL/state"

# Le guide s'ouvre tout de suite, pour accompagner le reste
[ -f "$KIT/guide/GUIDE-COLINE.pdf" ] && command -v open >/dev/null 2>&1 && open "$KIT/guide/GUIDE-COLINE.pdf"

# jq est nécessaire à la barre de statut : on l'installe avec Homebrew si possible
if ! command -v jq >/dev/null 2>&1; then
  if command -v brew >/dev/null 2>&1; then
    echo "Installation de jq avec Homebrew..."; brew install jq
  else
    echo "Il manque l'outil jq (nécessaire à la barre de statut)."
    echo "Installe Homebrew (https://brew.sh), puis dans le Terminal : brew install jq"
    echo "Puis relance : bash $KIT/install.sh"
    echo "(Le reste du kit est installé quand même.)"
  fi
fi

backup() { [ -e "$1" ] && cp -R "$1" "$1.sauvegarde-$STAMP" && echo "  sauvegarde : $1.sauvegarde-$STAMP"; return 0; }

echo "1. Barre de statut et usage"
cp "$KIT/claude/scripts/statusline.sh" "$KIT/claude/scripts/usage.sh" "$CL/scripts/" && chmod +x "$CL/scripts/"*.sh

echo "2. Commandes /brainstorm /plan /bloc"
cp "$KIT/claude/commands/"*.md "$CL/commands/"

echo "3. Règles permanentes (CLAUDE.md)"
backup "$CL/CLAUDE.md"; cp "$KIT/claude/CLAUDE.md" "$CL/CLAUDE.md"

echo "4. Réglages (settings.json)"
if [ -f "$CL/settings.json" ] && command -v jq >/dev/null 2>&1; then
  backup "$CL/settings.json"
  jq -s '.[0] * .[1]' "$CL/settings.json" "$KIT/claude/settings.json" > "$CL/settings.json.tmp" && mv "$CL/settings.json.tmp" "$CL/settings.json"
elif [ -f "$CL/settings.json" ]; then
  backup "$CL/settings.json"; cp "$KIT/claude/settings.json" "$CL/settings.json"
else
  cp "$KIT/claude/settings.json" "$CL/settings.json"
fi

echo "5. Test de la barre de statut"
echo '{"model":{"display_name":"Test"}}' | bash "$CL/scripts/statusline.sh"

echo ""
echo "Terminé. Le guide PDF est ouvert (sinon : open \"$KIT/guide/GUIDE-COLINE.pdf\")."
echo "Relance Claude Code dans VS Code : la barre apparaît sous la zone de saisie."
echo "Puis ouvre ~/.claude/CLAUDE.md et remplace [TA MARQUE], [PLATEFORME], [URL] par tes vraies valeurs."
