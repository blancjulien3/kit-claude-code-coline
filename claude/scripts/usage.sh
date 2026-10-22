#!/bin/bash
# Affiche l'usage réel de l'abonnement Claude (5 h et semaine). Réutilise le cache de la barre de statut.
CACHE_FILE="$HOME/.claude/state/oauth_usage.json"
echo '{}' | "$HOME/.claude/scripts/statusline.sh" >/dev/null 2>&1   # force un rafraîchissement si le cache a plus de 60 s
if [ ! -f "$CACHE_FILE" ]; then echo "Usage indisponible : relance Claude Code et vérifie que tu es connectée (/login)."; exit 1; fi
J=$(cat "$CACHE_FILE")
H=$(echo "$J" | jq -r '.five_hour.utilization // 0' | awk '{printf "%d", $1}')
W=$(echo "$J" | jq -r '.seven_day.utilization // 0' | awk '{printf "%d", $1}')
echo "Fenêtre 5 h : ${H} % utilisés   (remise à zéro : $(echo "$J" | jq -r '.five_hour.resets_at // "?"'))"
echo "Semaine     : ${W} % utilisés   (remise à zéro : $(echo "$J" | jq -r '.seven_day.resets_at // "?"'))"
echo ""
if [ "$W" -ge 80 ]; then echo "Conseil : garde le reste de la semaine pour l'essentiel, pas de nouvelle vidéo."
elif [ "$H" -ge 80 ]; then echo "Conseil : termine ce que tu fais, puis attends la remise à zéro de la fenêtre 5 h."
else echo "Conseil : marge correcte. Un bloc = une session, /clear entre deux sujets."; fi
