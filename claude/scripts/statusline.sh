#!/bin/bash
# Barre de statut Claude Code : modèle │ % du contexte │ usage 5 h │ usage semaine (mêmes chiffres que claude.ai).
# Lit d'abord les champs natifs fournis par Claude Code (context_window, rate_limits), et se replie sur
# l'API d'usage si ces champs manquent (tout premier message d'une session). macOS, Linux, WSL, Git Bash.

INPUT=$(cat)
j() { echo "$INPUT" | jq -r "$1 // empty" 2>/dev/null; }

MODEL=$(j '.model.display_name'); [ -z "$MODEL" ] && MODEL="Claude"
MODEL_ID=$(j '.model.id')

# ----- Contexte occupé
CTX_PCT=$(j '.context_window.used_percentage')
if [ -z "$CTX_PCT" ]; then
  # Repli : dernier message du transcript
  TRANSCRIPT=$(j '.transcript_path')
  case "$MODEL_ID" in *fable*|*mythos*|*opus-5-5*|*"[1m]"*|*"-1m"*) CTX_MAX=1000000 ;; *) CTX_MAX=200000 ;; esac
  if [ -n "$TRANSCRIPT" ] && [ -f "$TRANSCRIPT" ]; then
    TOTAL=$(tail -n 80 "$TRANSCRIPT" 2>/dev/null | jq -r 'select(.type=="assistant" and .message.usage!=null) | .message.usage | ((.input_tokens//0)+(.cache_read_input_tokens//0)+(.cache_creation_input_tokens//0))' 2>/dev/null | tail -1)
    [ -n "$TOTAL" ] && [ "$TOTAL" != "0" ] && CTX_PCT=$(awk "BEGIN { printf \"%.0f\", ($TOTAL / $CTX_MAX) * 100 }")
  fi
fi
if [ -n "$CTX_PCT" ]; then
  CTX_PCT=$(printf "%.0f" "$CTX_PCT")
  if   [ "$CTX_PCT" -ge 60 ]; then CTX_TXT="🧠 ctx: ${CTX_PCT}% ⚠️ /clear conseillé"
  elif [ "$CTX_PCT" -ge 40 ]; then CTX_TXT="🧠 ctx: ${CTX_PCT}% !"
  else CTX_TXT="🧠 ctx: ${CTX_PCT}%"; fi
else
  CTX_TXT="🧠 ctx: —"
fi

# ----- Usage de l'abonnement
H_PCT=$(j '.rate_limits.five_hour.used_percentage'); H_ISO=$(j '.rate_limits.five_hour.resets_at')
W_PCT=$(j '.rate_limits.seven_day.used_percentage'); W_ISO=$(j '.rate_limits.seven_day.resets_at')

if [ -z "$H_PCT" ]; then
  # Repli : API d'usage, en cache 60 s
  STATE_DIR="$HOME/.claude/state"; mkdir -p "$STATE_DIR"; CACHE="$STATE_DIR/oauth_usage.json"
  now=$(date +%s); mtime=$(stat -f %m "$CACHE" 2>/dev/null || stat -c %Y "$CACHE" 2>/dev/null || echo 0)
  if [ $((now - mtime)) -gt 60 ]; then
    TOKEN=""
    command -v security >/dev/null 2>&1 && TOKEN=$(security find-generic-password -s "Claude Code-credentials" -w 2>/dev/null | jq -r '.claudeAiOauth.accessToken // empty')
    [ -z "$TOKEN" ] && [ -f "$HOME/.claude/.credentials.json" ] && TOKEN=$(jq -r '.claudeAiOauth.accessToken // empty' "$HOME/.claude/.credentials.json" 2>/dev/null)
    if [ -n "$TOKEN" ]; then
      RESP=$(curl -s --max-time 4 "https://api.anthropic.com/api/oauth/usage" -H "Authorization: Bearer $TOKEN" -H "anthropic-beta: oauth-2025-04-20" -H "User-Agent: claude-cli/2.1.138" 2>/dev/null)
      [ -n "$RESP" ] && echo "$RESP" | jq -e '.five_hour' >/dev/null 2>&1 && echo "$RESP" > "$CACHE"
    fi
  fi
  if [ -f "$CACHE" ]; then
    H_PCT=$(jq -r '.five_hour.utilization // empty' "$CACHE"); H_ISO=$(jq -r '.five_hour.resets_at // empty' "$CACHE")
    W_PCT=$(jq -r '.seven_day.utilization // empty' "$CACHE"); W_ISO=$(jq -r '.seven_day.resets_at // empty' "$CACHE")
  fi
fi

# Date de remise à zéro lisible (ISO ou epoch), macOS ou GNU date
fmt_reset() {
  local v=$1 epoch=""
  [ -z "$v" ] || [ "$v" = "null" ] && { echo "?"; return; }
  if echo "$v" | grep -Eq '^[0-9]+(\.[0-9]+)?$'; then epoch=${v%.*}
  else
    local base="${v%.*}"; base="${base%Z}"; base="${base%+00:00}"
    epoch=$(date -j -u -f "%Y-%m-%dT%H:%M:%S" "$base" "+%s" 2>/dev/null) || epoch=$(date -u -d "$base" "+%s" 2>/dev/null) || { echo "?"; return; }
  fi
  date -j -f "%s" "$epoch" "+%d/%m %Hh%M" 2>/dev/null || date -d "@$epoch" "+%d/%m %Hh%M" 2>/dev/null || echo "?"
}

if [ -n "$H_PCT" ]; then
  H_PCT=$(printf "%.0f" "$H_PCT"); W_PCT=$(printf "%.0f" "${W_PCT:-0}")
  H_FLAG=""; [ "$H_PCT" -ge 80 ] && H_FLAG=" ⚠️"
  W_FLAG=""; [ "$W_PCT" -ge 80 ] && W_FLAG=" ⚠️"
  BLOCK_TXT="🕐 5h: ${H_PCT}%${H_FLAG} · reset $(fmt_reset "$H_ISO")"
  WEEK_TXT="📅 Sem: ${W_PCT}%${W_FLAG} · reset $(fmt_reset "$W_ISO")"
else
  BLOCK_TXT="🕐 5h: —"; WEEK_TXT="📅 Sem: — (visible après le 1er message)"
fi

echo "🤖 $MODEL │ $CTX_TXT │ $BLOCK_TXT │ $WEEK_TXT"
