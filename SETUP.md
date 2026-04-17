# StaszekOS Home Setup Guide
## Antunovich Associates — AI Environment Installation

This document is your setup agent. Open it in a Cowork project at home and ask:
**"Help me install StaszekOS step by step"** — the agent will walk you through each step
interactively and fix any errors that come up.

---

## PREREQUISITES — Install These First

### 1. Python
- Go to: https://python.org/downloads
- Download the latest Windows installer
- **CRITICAL during install:** Check the box that says **"Add Python to PATH"**
- Click Install Now
- Verify: open PowerShell, type `python --version` → should print a version number

### 2. Git
- Go to: https://git-scm.com/download/win
- Download and run installer — all defaults are fine
- Verify: open PowerShell, type `git --version` → should print a version number

### 3. Claude Code
- Go to: https://claude.ai/code
- Download and install the Windows app

---

## INSTALLATION — One Section at a Time

### Section A — Create the folder structure

Open **PowerShell** (press `Win + X` → select "Windows PowerShell" or "Terminal")

Run this — one line at a time, paste each and press Enter:

```powershell
New-Item -ItemType Directory -Force -Path "$env:USERPROFILE\Documents\Claude\StaszekOS\Projects"
```

```powershell
cd "$env:USERPROFILE\Documents\Claude\StaszekOS\Projects"
```

### Section B — Clone the plugin

```powershell
git clone https://github.com/trickstero/staszekos-plugin.git staszekos-plugin
```

When it finishes, you should see a folder called `staszekos-plugin` created.

### Section C — Run the bootstrap script

First, allow scripts to run (required once per machine):
```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```
Type `Y` and press Enter when prompted.

Then run the bootstrap:
```powershell
cd "$env:USERPROFILE\Documents\Claude\StaszekOS\Projects\staszekos-plugin"
powershell -ExecutionPolicy Bypass -File .\scripts\bootstrap.ps1
```

The script prints ✓ for each step. It takes about 60 seconds.
**Paste the full output here if anything shows ✗ — the agent will fix it.**

### Section D — Clone the wiki

```powershell
cd "$env:USERPROFILE\Documents\Claude\StaszekOS"
git clone https://github.com/trickstero/claude-obsidian.git claude-obsidian
```

### Section E — Add your GitHub token

Open File Explorer → navigate to:
```
C:\Users\smatuzik\Documents\Claude\StaszekOS\.claude\
```
Open `settings.local.json` in Notepad.
Replace `ghp_YOUR_TOKEN_HERE` with your actual GitHub token.
Save the file.

**Where to find your token:** github.com → Settings → Developer settings → Personal access tokens → Tokens (classic)

### Section F — Open Claude Code

1. Open the Claude Code app
2. Click **File → Open Folder**
3. Navigate to: `C:\Users\smatuzik\Documents\Claude\StaszekOS`
4. Click **Select Folder**

The wiki tools (`wiki_hot`, `wiki_search`, etc.) will appear automatically.
Run `/setup` to verify everything is working.

### Section G — Set up Cowork projects in claude.ai

In each Cowork project, add the matching context file from:
`C:\Users\smatuzik\Documents\Claude\Projects\`

| Cowork Project | Add this file |
|---------------|---------------|
| CODE | `CODE\CLAUDE_2.md` + `CODE\ZONING.md` + `CODE\hot.md` |
| ZONING | `ZONING\CLAUDE.md` + `ZONING\hot.md` |
| RFI drafting | `RFI drafting\CLAUDE.md` |
| SPEC writing | `SPEC writing\CLAUDE.md` |
| SHPO Treatment Narrative | `SHPO Treatment Narrative\CLAUDE.md` |

---

## TROUBLESHOOTING

### "running scripts is disabled on this system"
Fix — run this first, then retry bootstrap:
```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

### "git is not recognized"
Git is not installed or not in PATH.
Fix: install Git from https://git-scm.com/download/win → restart PowerShell → retry.

### "python is not recognized"
Python is not in PATH.
Fix option 1 — reinstall Python, check "Add Python to PATH" during setup.
Fix option 2 — run this to find Python and add it manually:
```powershell
where.exe python
```
Paste the result here and the agent will add it to PATH for you.

### "Access denied" or permission error on bootstrap
Run PowerShell as Administrator:
Press `Win + X` → select **"Windows PowerShell (Admin)"** or **"Terminal (Admin)"**
Then run the bootstrap command again.

### bootstrap shows ✗ on Python dependencies
Run manually:
```powershell
python -m pip install mcp starlette uvicorn anthropic --break-system-packages
```
If that fails, paste the error here.

### wiki tools don't appear in Claude Code
1. Make sure Claude Code was opened at `C:\Users\smatuzik\Documents\Claude\StaszekOS`
2. Close Claude Code completely and reopen it
3. Check that `.mcp.json` exists at the workspace root:
```powershell
Test-Path "$env:USERPROFILE\Documents\Claude\StaszekOS\.mcp.json"
```
Should print `True`. If `False`, run:
```powershell
Copy-Item "$env:USERPROFILE\Documents\Claude\StaszekOS\Projects\staszekos-plugin\config\staszekos-mcp.json" "$env:USERPROFILE\Documents\Claude\StaszekOS\.mcp.json"
```

### Clone worked but wiki is empty
Make sure the wiki clone went to the right place:
```powershell
Test-Path "$env:USERPROFILE\Documents\Claude\StaszekOS\claude-obsidian\wiki\hot.md"
```
Should print `True`.

---

## WHAT GETS INSTALLED

| Component | Location | Purpose |
|-----------|----------|---------|
| 11 slash commands | `.claude/commands/` | `/code-lookup`, `/zoning-research`, `/grill-me`, etc. |
| CLAUDE.md | `StaszekOS/` | Workspace instructions |
| wiki-mcp.py | `Scheduled/` | Live wiki access in Claude Code |
| sync-cowork.py | `Scheduled/` | Auto-sync on session end |
| Stop hook | `.claude/settings.json` | Triggers sync when Claude Code stops |
| .mcp.json | `StaszekOS/` | Registers wiki tools |
| CLAUDE_2.md | `Projects/CODE/` | Full building code knowledge base |
| CLAUDE.md x5 | `Projects/[each]/` | Agent instructions per Cowork project |
| hot.md x5 | `Projects/[each]/` | Live wiki snapshot in every project |
| Cowork vault | `Cowork/` | Obsidian project memory structure |
| Memory files | `~/.claude/projects/.../memory/` | Persistent cross-session memory |

---

## AFTER INSTALLATION

Everything is self-maintaining:
- **When you close Claude Code** → sync-cowork.py runs automatically → all Cowork projects get the latest knowledge
- **When you ingest a new project into the wiki** → hot.md updates → syncs to all Cowork projects on next session close
- **When a command self-rewrites** → commit it → pull at home → stays current

To update the home machine when commands change at the office:
```powershell
cd "$env:USERPROFILE\Documents\Claude\StaszekOS\Projects\staszekos-plugin"
git pull
.\scripts\bootstrap.ps1
```
