#!/bin/bash
# Stop hook: no fim de cada sessão, faz um commit de tudo o que mudou no vault.
# Assim há um histórico completo da memória e dá para voltar atrás em qualquer nota.
# Nunca bloqueia o Claude: se algo falhar, simplesmente sai.
#
# Uso (em .claude/settings.json):  bash ~/.claude/hooks/git-autocommit.sh "<pasta do vault>"
# O vault precisa ser um repositório git (git init dentro da pasta do vault).

VAULT="$1"
cd "$VAULT" 2>/dev/null || exit 0
[ -e .git ] || exit 0
git add -A >/dev/null 2>&1
git diff --cached --quiet && exit 0
git commit -qm "sessão $(date '+%Y-%m-%d %H:%M')" >/dev/null 2>&1
exit 0
