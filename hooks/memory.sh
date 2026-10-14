#!/bin/bash
# Stop hook: doesn't let Claude end the session while the memory is out of date.
#
# If, in the last MINUTES, any file in the vault (or in the code) changed after the last
# update to STATUS.md or MEMORY.md, it blocks the end of the session and asks Claude to
# update the memory first. It also warns when a folder's README (hub) has fallen behind
# that folder's notes.
#
# Usage (in .claude/settings.json):  bash ~/.claude/hooks/memory.sh "<vault folder>" ["<code folder>"]
# Requires: jq  (macOS: brew install jq)

VAULT="$1"
CODE="${2:-}"
MINUTES="${MEMORY_MINUTES:-90}"

input=$(cat)
# Avoids an infinite loop: if Claude is already continuing because of this hook, let it stop.
[ "$(printf '%s' "$input" | jq -r '.stop_hook_active // false')" = "true" ] && exit 0
[ -d "$VAULT" ] || exit 0

STATUS="$VAULT/00 - Context/STATUS.md"
MEM="$VAULT/99 - Claude Memory/MEMORY.md"
[ -f "$STATUS" ] && [ -f "$MEM" ] || exit 0

folders=("$VAULT"); [ -n "$CODE" ] && [ -d "$CODE" ] && folders+=("$CODE")

# Files changed recently and after STATUS.md or MEMORY.md
changed=$(for ref in "$STATUS" "$MEM"; do
  find "${folders[@]}" -type f -mmin "-$MINUTES" -newer "$ref" \
    -not -path '*/.obsidian/*' -not -path '*/.git/*' -not -path '*/.claude/*' \
    -not -path '*/node_modules/*' -not -path '*/dist/*' -not -path '*/build/*' -not -path '*/.next/*' \
    -not -name 'STATUS.md' -not -name 'MEMORY.md' -not -name 'README.md' -not -name '.DS_Store' 2>/dev/null
done | sort -u | head -5)

# Stale READMEs (hubs): a note in the folder changed after that folder's README
hubs=$(find "$VAULT" -maxdepth 1 -type d -name '[0-9][0-9] - *' | while read -r d; do
  r="$d/README.md"; [ -f "$r" ] || continue
  n=$(find "$d" -type f -name '*.md' -mmin "-$MINUTES" -newer "$r" -not -name 'README.md' -not -name 'STATUS.md' 2>/dev/null | head -1)
  [ -n "$n" ] && basename "$d"
done | paste -sd ',' - | sed 's/,/, /g')

[ -z "$changed" ] && [ -z "$hubs" ] && exit 0

list=$(printf '%s\n' "$changed" | sed "s#^$VAULT/##" | { [ -n "$CODE" ] && sed "s#^$CODE/#[code] #" || cat; } | paste -sd ';' - | sed 's/;/; /g')

jq -n --arg files "$list" --arg hubs "$hubs" '{
  decision: "block",
  reason: (
    (if $files != "" then "Project memory: there are files changed after the last update to STATUS.md/MEMORY.md ("
      + $files + "). If it was something important (a decision, a delivery, code, a lesson), update 00 - Context/STATUS.md "
      + "and add a dated bullet to 99 - Claude Memory/MEMORY.md; a new decision = an ADR in 00 - Context/Decisions/ "
      + "+ a line in the Decisions.md index. If it was trivial, just update the date in one of the two. "
     else "Project memory: " end)
    + (if $hubs != "" then "READMEs (hubs) to review, because a note in the folder changed after them: " + $hubs
       + " — add a bullet under \"Work done\" or \"Open items\". " else "" end)
    + "Then finish.")
}'
