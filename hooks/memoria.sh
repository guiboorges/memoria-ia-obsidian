#!/bin/bash
# Stop hook: não deixa o Claude terminar a sessão com a memória desatualizada.
#
# Se, nos últimos MINUTOS, algum arquivo do vault (ou do código) mudou depois da última
# atualização do STATUS.md ou do MEMORY.md, bloqueia o fim da sessão e pede ao Claude para
# atualizar a memória primeiro. Também avisa quando o README (hub) de uma pasta ficou atrás
# das notas dessa pasta.
#
# Uso (em .claude/settings.json):  bash ~/.claude/hooks/memoria.sh "<pasta do vault>" ["<pasta do código>"]
# Requer: jq  (macOS: brew install jq)

VAULT="$1"
CODE="${2:-}"
MINUTOS="${MEMORIA_MINUTOS:-90}"

input=$(cat)
# Evita ciclo infinito: se o Claude já está continuando por causa deste hook, deixa parar.
[ "$(printf '%s' "$input" | jq -r '.stop_hook_active // false')" = "true" ] && exit 0
[ -d "$VAULT" ] || exit 0

STATUS="$VAULT/00 - Contexto/STATUS.md"
MEM="$VAULT/99 - Memoria Claude/MEMORY.md"
[ -f "$STATUS" ] && [ -f "$MEM" ] || exit 0

pastas=("$VAULT"); [ -n "$CODE" ] && [ -d "$CODE" ] && pastas+=("$CODE")

# Arquivos alterados recentemente e depois do STATUS.md ou do MEMORY.md
changed=$(for ref in "$STATUS" "$MEM"; do
  find "${pastas[@]}" -type f -mmin "-$MINUTOS" -newer "$ref" \
    -not -path '*/.obsidian/*' -not -path '*/.git/*' -not -path '*/.claude/*' \
    -not -path '*/node_modules/*' -not -path '*/dist/*' -not -path '*/build/*' -not -path '*/.next/*' \
    -not -name 'STATUS.md' -not -name 'MEMORY.md' -not -name 'README.md' -not -name '.DS_Store' 2>/dev/null
done | sort -u | head -5)

# READMEs (hubs) atrasados: uma nota da pasta mudou depois do README dessa pasta
hubs=$(find "$VAULT" -maxdepth 1 -type d -name '[0-9][0-9] - *' | while read -r d; do
  r="$d/README.md"; [ -f "$r" ] || continue
  n=$(find "$d" -type f -name '*.md' -mmin "-$MINUTOS" -newer "$r" -not -name 'README.md' -not -name 'STATUS.md' 2>/dev/null | head -1)
  [ -n "$n" ] && basename "$d"
done | paste -sd ',' - | sed 's/,/, /g')

[ -z "$changed" ] && [ -z "$hubs" ] && exit 0

lista=$(printf '%s\n' "$changed" | sed "s#^$VAULT/##" | { [ -n "$CODE" ] && sed "s#^$CODE/#[código] #" || cat; } | paste -sd ';' - | sed 's/;/; /g')

jq -n --arg files "$lista" --arg hubs "$hubs" '{
  decision: "block",
  reason: ("Memória do projeto: há arquivos alterados depois da última atualização do STATUS.md/MEMORY.md ("
    + $files + "). Se foi algo importante (decisão, entrega, código, lição), atualize 00 - Contexto/STATUS.md "
    + "e acrescente um bullet datado em 99 - Memoria Claude/MEMORY.md; decisão nova = um ADR em 00 - Contexto/Decisoes/ "
    + "+ uma linha no índice Decisoes.md. Se foi trivial, basta atualizar a data num dos dois."
    + (if $hubs != "" then " READMEs (hubs) a rever, porque uma nota da pasta mudou depois deles: " + $hubs
       + " — acrescente um bullet em \"Trabalho feito\" ou \"Em aberto\"." else "" end)
    + " Depois termine.")
}'
