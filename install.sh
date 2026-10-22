#!/bin/bash
# Installe le kit dans ~/.claude sans écraser ce qui existe déjà (sauvegarde datée avant toute modification).
# Usage : bash install.sh   (depuis le dossier du kit)
set -e
KIT="$(cd "$(dirname "$0")" && pwd)"
CL="$HOME/.claude"
STAMP=$(date +%Y%m%d-%H%M%S)
mkdir -p "$CL/scripts" "$CL/commands" "$CL/state"

for tool in jq curl; do
  if ! command -v $tool >/dev/null 2>&1; then
    echo "Il manque l'outil '$tool'. Sur Mac : brew install $tool (après avoir installé Homebrew : https://brew.sh). Puis relance ce script."
    exit 1
  fi
done

backup() { [ -e "$1" ] && cp -R "$1" "$1.sauvegarde-$STAMP" && echo "  sauvegarde : $1.sauvegarde-$STAMP"; return 0; }

echo "1. Barre de statut et usage"
cp "$KIT/claude/scripts/statusline.sh" "$KIT/claude/scripts/usage.sh" "$CL/scripts/"
chmod +x "$CL/scripts/"*.sh

echo "2. Commandes /brainstorm /plan /bloc"
cp "$KIT/claude/commands/"*.md "$CL/commands/"

echo "3. Règles permanentes (CLAUDE.md)"
backup "$CL/CLAUDE.md"
cp "$KIT/claude/CLAUDE.md" "$CL/CLAUDE.md"

echo "4. Réglages (settings.json)"
if [ -f "$CL/settings.json" ]; then
  backup "$CL/settings.json"
  jq -s '.[0] * .[1]' "$CL/settings.json" "$KIT/claude/settings.json" > "$CL/settings.json.tmp" && mv "$CL/settings.json.tmp" "$CL/settings.json"
else
  cp "$KIT/claude/settings.json" "$CL/settings.json"
fi

echo "5. Test de la barre de statut"
echo '{"model":{"display_name":"Test"}}' | bash "$CL/scripts/statusline.sh"

echo ""
echo "Terminé. Relance Claude Code dans VS Code : la barre apparaît sous la zone de saisie."
echo "Ouvre ~/.claude/CLAUDE.md et remplace les crochets [TA MARQUE], [PLATEFORME], [URL] par tes vraies valeurs."
