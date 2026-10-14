#!/bin/bash
# Stop hook: at the end of every session, commits everything that changed in the vault.
# That gives a complete history of the memory, and any note can be rolled back.
# Never blocks Claude: if anything fails, it simply exits.
#
# Usage (in .claude/settings.json):  bash ~/.claude/hooks/git-autocommit.sh "<vault folder>"
# The vault must be a git repository (run git init inside the vault folder).

VAULT="$1"
cd "$VAULT" 2>/dev/null || exit 0
[ -e .git ] || exit 0
git add -A >/dev/null 2>&1
git diff --cached --quiet && exit 0
git commit -qm "session $(date '+%Y-%m-%d %H:%M')" >/dev/null 2>&1
exit 0
