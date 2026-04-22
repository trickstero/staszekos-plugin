# Handoff Memo — Office → Home
**Date:** 2026-04-22  
**From:** Claude (Office PC)  
**To:** Claude (Home PC)

---

## What Happened This Session

We did a full audit of `CLAUDE.md` and refactored it. Here's what you need to know and why.

---

## The Problem We Solved

`CLAUDE.md` had accumulated ~50 lines of fat across two symptoms:

1. **Internal duplication** — the same zoning/code research info appeared in three separate sections of the same file. The `Related Cowork Projects` section was a word-for-word repeat of the `Cowork → Skills Mapping` table. The `Zoning & Code Research Context` block repeated what was already in `Active Projects` and memory.

2. **Wrong layer placement** — MarkItDown (a universal document-conversion tool) was added to project CLAUDE.md. It belongs in global `~/.claude/CLAUDE.md` next to RTK so every project benefits.

---

## The Architecture (Read This Carefully)

The system has four layers. Each has a different scope:

| Layer | Lives | Loads in | Subagents see it? |
|---|---|---|---|
| Global `~/.claude/CLAUDE.md` | User home dir | Every session | Yes |
| Project `StaszekOS/CLAUDE.md` | Workspace root | This project's sessions | Yes |
| `memory/MEMORY.md` + files | Project memory dir | Main context only | **No** |
| Wiki (`claude-obsidian/wiki/`) | Local filesystem | On-demand reads | Only if you read it |

**Critical rule:** Subagents (Explore, Plan, general-purpose) inherit both CLAUDE.mds but NOT memory. So anything a spawned agent needs must stay in CLAUDE.md — not memory. We kept the Cowork→Skills trigger table, SSL/pip rules, visualization pipeline, and wiki read-order in CLAUDE.md for exactly this reason.

---

## What Changed in CLAUDE.md

**Deleted (safe — internal duplicates or stale facts):**
- `Related Cowork Projects` section — pure duplicate of Cowork→Skills Mapping table
- `Zoning & Code Research Context` section — duplicated Active Projects + memory
- `Pages: enable manually` GitHub note — stale, already deployed
- MCP Servers expanded list → collapsed to a 1-line memory pointer (auth status is volatile, lives in `memory/reference_mcp_servers.md`)
- MarkItDown block — moved to global CLAUDE.md

**Added:**
- `memory/MEMORY.md` pointer at the top — orients main context immediately
- StaszekOS Plugin, Claude-Obsidia Wiki, and Cowork Coordinator entries under Active Projects — these are real running projects that were missing
- `/render-interior` fixed in Antunovich AI command list — it was omitted

---

## What You Need to Do on Home PC

### 1. Pull the updated plugin
```
cd C:\Users\<your-username>\Documents\Claude\StaszekOS\Projects\staszekos-plugin
git pull
```

### 2. Overwrite your local CLAUDE.md with the plugin version
```
copy Projects\staszekos-plugin\CLAUDE.md CLAUDE.md
```

### 3. Add MarkItDown to global CLAUDE.md manually
The global `~/.claude/CLAUDE.md` is NOT in any git repo — it's machine-local. You need to add the MarkItDown block yourself.

Append to `C:\Users\<your-username>\.claude\CLAUDE.md`:

```markdown
# MarkItDown — Document Conversion Before Reading

**Installed:** `markitdown` (Microsoft) — converts Office, PDF, HTML, images → Markdown (60-80% token savings vs. raw extraction).

## Rule
**Always convert before reading.** Never pass a raw `.docx`, `.xlsx`, `.pdf`, `.pptx`, or `.html` to the Read tool. Convert first, then Read the `.md` output.

## Commands
| File type | Command |
|-----------|---------|
| Word | `markitdown file.docx > file.md` |
| Excel | `markitdown file.xlsx > file.md` |
| PDF | `markitdown file.pdf > file.md` |
| PowerPoint | `markitdown file.pptx > file.md` |
| HTML | `markitdown file.html > file.md` |
| Image (OCR) | `markitdown image.png > file.md` |
```

### 4. Install markitdown
```
pip install "git+https://github.com/microsoft/markitdown.git#subdirectory=packages/markitdown" --break-system-packages
```

---

## What the Cowork Coordinator Is (and Isn't)

The Coordinator runs entirely on the **Cowork (claude.ai) side** — it reads `outputs/quality-log.md`, `error-library.md`, and `code-edition-map.md` from the Cowork vault. It does NOT read StaszekOS/CLAUDE.md. We added a pointer to it in Active Projects so you know it exists and where to find details (`memory/project_cowork_coordinator_eval.md`).

Hard Rules 13 and 14 came from two real post-mortems:
- **Rule 13:** Phoenix AZ project assumed IBC 2021; correct was PBCC 2024. Always verify code edition against `code-edition-map.md` before any FLAGS block.
- **Rule 14:** A FLAGS block asserted a wrong table value from memory (24k SF vs. 18k SF). Always cite code+edition+table+row, never assert a recalled number.

These apply to all code analysis you do, not just Cowork sessions.

---

## No Action Needed On

- Memory files — they're bundled in the plugin (`memory/` folder), already correct
- Cowork vault context files — also bundled, no changes
- Slash commands — no changes this session
