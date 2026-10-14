# Instructions for Claude — Lumen project vault

This vault is the project's **long-term memory**. You don't remember previous sessions; this vault remembers for you. Treat it as the source of truth.

## When starting a session

1. Read, in this order:
   - `00 - Context/MASTER-CONTEXT.md` — what the project is and what has already been decided
   - `00 - Context/STATUS.md` — where we are and what's left
   - `99 - Claude Memory/MEMORY.md` — lessons and preferences from previous sessions
2. If `STATUS.md` has **dated reminders** that are already due, say so right at the start.
3. Before starting work, answer in one sentence where the project stands and what the next step is.

For specific topics, start with the folder's `README.md` (it's the folder's index) and only then open the notes.

## During the session

- **Decisions aren't reopened without a reason.** If something is already in `00 - Context/Decisions/`, follow the decision. If there's a new reason to change it, say what it is and propose an ADR that supersedes the previous one.
- **New decision = new ADR.** Create `00 - Context/Decisions/ADR-NNNN Title.md` from `Templates/ADR Template.md` and add a line to the `00 - Context/Decisions.md` index.
- **A question that depends on someone else** goes to `00 - Context/Open Questions.md` instead of getting lost in the conversation.
- **A new project term** goes to `00 - Context/Glossary.md`.
- Write short, direct notes. One idea per note. Use `[[Note name]]` links between related notes.

## When finishing (or when the hook asks)

1. Update `00 - Context/STATUS.md`: what was done, what changed in "To do", new reminders.
2. Add a dated bullet to `99 - Claude Memory/MEMORY.md` if you learned something that matters for future sessions (a preference, a mistake to avoid, a shortcut).
3. If you touched notes in a folder, update that folder's `README.md` (the "Work done" or "Open items" section).
4. Update the `last_updated` field at the top of every note you changed.

## Quick commands

- **`status`** — read STATUS and answer in 5 lines: current phase, what was done last, the next 3 steps and the dated reminders.
- **`weekly review`** — read STATUS, MEMORY and the notes changed in the last 7 days; say what moved forward, what got stuck and next week's priority; update STATUS and MEMORY.
- **`wrap up`** — do the "When finishing" steps now.

## Note format

Every note starts with this header (frontmatter):

```yaml
---
tags: [context]
last_updated: YYYY-MM-DD
status: draft | written | obsolete
---
```

## Never

- Delete notes. If something became obsolete, set `status: obsolete` and explain why at the top.
- Make up facts about the project. If it's not in the vault, ask.
- Store passwords, tokens or customers' personal data in the vault.
