# /sync-cowork

Bridge the Obsidian Cowork vault with a Claude Code session. Detects which Cowork project is active, loads context from Obsidian, and presents the recommended skill stack for user approval before any work begins.

## Step 1 — Identify the active Cowork project

Ask if not provided: "Which Cowork project are we working in?"

| Project | Obsidian Path |
|---------|--------------|
| Zoning Analysis | Cowork/Zoning-Analysis/ |
| Code Research | Cowork/Code-Research/ |
| SHPO Narrative | Cowork/SHPO-Narrative/ |
| SPEC Writing | Cowork/SPEC-Writing/ |
| RFI Drafting | Cowork/RFI-Drafting/ |

## Step 2 — Load Obsidian context

Read the following files for the identified project (use mcp-obsidian):
1. `Cowork/_global-context.md` — firm profile and defaults
2. `Cowork/[project]/project-log.md` — prior sessions and active items
3. `Cowork/[project]/_inputs/` — any staged input files

Summarize what was found:
- Last session date and outcome
- Any open items or in-progress work
- Input files ready for processing

## Step 3 — Present skill stack and request deployment approval

Based on the project, announce the recommended skill stack and ask permission for EACH skill before running:

---

**ZONING ANALYSIS**
> Context loaded. Recommended skill stack for this session:
> 1. `/grill-me` — clarify parcel, program, and jurisdiction before research
> 2. `/zoning-research` — full GIS → Municode → memo analysis
> 3. `/edit-narrative` — editorial review before output
>
> Deploy `/grill-me` now to start? (yes / skip to research / just load context)

---

**CODE RESEARCH**
> Context loaded. Recommended skill stack for this session:
> 1. `/grill-me` — clarify occupancy, construction type, and AHJ
> 2. `/code-lookup` — systematic IBC/ADA/NFPA research
> 3. `/edit-narrative` — review before output
>
> Deploy `/grill-me` now to start? (yes / skip to lookup / just load context)

---

**SHPO NARRATIVE**
> Context loaded. Recommended skill stack for this session:
> 1. `/scqa` — structure the narrative (Situation → Complication → Question → Answer)
> 2. `/shpo` — draft the full SHPO treatment narrative
> 3. `/edit-narrative` — 4-pass editorial review
>
> Deploy `/scqa` now to structure the narrative? (yes / skip to draft / just load context)

---

**SPEC WRITING**
> Context loaded. Recommended skill stack for this session:
> 1. `/grill-me` — clarify division, section, jurisdiction, performance level
> 2. `/spec` — write the MasterFormat section
> 3. `/edit-narrative` — review before output
>
> Deploy `/grill-me` now to start? (yes / skip to spec / just load context)

---

**RFI DRAFTING**
> Context loaded. Recommended skill stack for this session:
> 1. `/grill-me` — collect RFI number, project, issue description, measurements
> 2. `/rfi` — draft the Procore-ready RFI
>
> Deploy `/grill-me` now to start? (yes / skip to RFI / just load context)

---

## Step 4 — Deploy approved skills

When user confirms a skill:
- Run the skill as instructed in its `.md` file
- Do NOT skip any steps within the skill
- After each skill completes, ask: "Continue to `/[next-skill]`?"

## Step 5 — Session close: write back to Obsidian

After work is complete, update the project log in Obsidian:

```
Append to Cowork/[project]/project-log.md:

| [YYYY-MM-DD] | [task description] | [output file or result] | [open items] |
```

Also move any completed input files from `_inputs/` to `_outputs/` with the date prefix.

## Rules
- Never start analysis before the user has approved the skill deployment
- Never skip the Obsidian context load — prior session context prevents redundant work
- If Obsidian MCP is unavailable: proceed with session but flag "Obsidian sync unavailable — log manually"
- Always end with the project log update — this is the memory that persists to the next session
