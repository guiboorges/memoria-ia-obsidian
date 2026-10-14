# Day-to-day prompts

Copy and paste them into Claude. In **Claude Code** opened inside the vault, `CLAUDE.md` already makes Claude read the memory on its own. In **Claude Desktop** or on **claude.ai** (with the MCP connector), use the "Start a session" prompt so it reads the memory first.

---

## 1. Start a session
*(in Claude Desktop / claude.ai; not needed in Claude Code)*

```text
Let's work on the [NAME] project. Using the Obsidian connector, read the vault's CLAUDE.md and follow its instructions:
read MASTER-CONTEXT, STATUS and MEMORY. Then tell me, in one sentence, where the project stands, what the next
step is, and whether any dated reminder is overdue.
```

## 2. Fill in the MASTER-CONTEXT for a new project

```text
I want to create the memory for the [NAME] project. Interview me briefly, one question at a time, to fill in
00 - Context/MASTER-CONTEXT.md: who, what it is, who it's for, the goal for the next 3 months, decisions already made,
principles and what's out of scope. At the end, write the note (2 screens at most) and create STATUS.md with the current
phase and the next 3 steps.
```

## 3. Record a decision

```text
We decided [DECISION] because [REASON]. Create a new ADR in 00 - Context/Decisions/ from Templates/ADR Template.md,
with context, alternatives and consequences, and add the line to the Decisions.md index. If this decision replaces
another one, mark the old one as "superseded" and link the two.
```

## 4. Quick status

```text
status
```
*(CLAUDE.md already explains what to do: read STATUS and answer where we are, what's left and the reminders.)*

## 5. Weekly review

```text
Weekly review: read STATUS, MEMORY and the notes changed in the last 7 days. Tell me what moved forward, what
got stuck and what should be the priority next week. Then update STATUS (the "To do" section) and
add the week's lessons to MEMORY.
```

## 6. Wrap up the session
*(with the hooks on, this happens on its own; without hooks, ask for it at the end)*

```text
Let's wrap up. Update STATUS with what we did today, add to MEMORY what's worth remembering next time,
and update the README of the folders we touched.
```

## 7. Bring old notes into the vault

```text
The [FOLDER] folder has loose notes about this project. Read them and distribute what matters across the right notes in the vault
(decisions become ADRs, terms go to the Glossary, questions to Open Questions, everything else to the right
topic folder). Don't delete anything; at the end, show me what went where.
```

## 8. Ask the vault

```text
What have we already decided about [TOPIC], and why? Answer only with what's in the vault, citing the notes.
```
