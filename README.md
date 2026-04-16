# StaszekOS Plugin — New Machine Setup Guide

Full Antunovich Associates AI environment. Transfers all slash commands, Cowork vault structure, memory bootstrap, and Obsidian integration to a new machine.

---

## What's Included

| Component | Description |
|-----------|-------------|
| `commands/` | 11 custom slash commands with self-rewrite protocols |
| `Cowork/` | 5 Cowork project templates (Zoning, Code, SHPO, Spec, RFI) |
| `memory/` | Pre-populated memory bootstrap files |
| `skills/setup/` | `/setup` skill for guided new-machine bootstrap |
| `scripts/bootstrap.ps1` | PowerShell automation for full environment setup |
| `CLAUDE.md` | Complete workspace context for Claude Code |

## Quick Start — New Machine

### Step 1: Prerequisites
Install these before anything else:
- [Claude Code CLI](https://claude.ai/code)
- [Obsidian](https://obsidian.md/) (for Cowork vault)
- [Git](https://git-scm.com/)
- PowerShell 5.1+ (built into Windows)

### Step 2: Clone This Plugin
```powershell
cd C:\Users\[USERNAME]\Documents\Claude
git clone https://github.com/trickstero/staszekos-plugin.git StaszekOS\Projects\staszekos-plugin
```

### Step 3: Run the Bootstrap Script
Open PowerShell as Administrator:
```powershell
cd C:\Users\[USERNAME]\Documents\Claude\StaszekOS\Projects\staszekos-plugin
.\scripts\bootstrap.ps1
```

The script will:
1. Create the `StaszekOS/` workspace directory structure
2. Copy all slash commands to `.claude/commands/`
3. Copy Cowork vault structure
4. Copy memory bootstrap files to the Claude project memory path
5. Create a `settings.local.json` template (you must fill in secrets)
6. Set `NODE_EXTRA_CA_CERTS` environment variable (for FortiGate SSL)

### Step 4: Add Your Secrets
Edit `.claude/settings.local.json` — fill in:
```json
{
  "env": {
    "GITHUB_TOKEN": "ghp_YOUR_TOKEN_HERE"
  }
}
```

Never commit this file.

### Step 5: FortiGate SSL Certificate
Download the corporate CA cert and place it at:
```
C:\Users\[USERNAME]\Documents\Claude\antunovich-ca.pem
```
Then set the environment variable permanently:
```powershell
[System.Environment]::SetEnvironmentVariable("NODE_EXTRA_CA_CERTS", "C:\Users\[USERNAME]\Documents\Claude\antunovich-ca.pem", "User")
```

### Step 6: Open Obsidian Vault
Open Obsidian → "Open folder as vault" → select `StaszekOS/`

Install the **Local REST API** community plugin in Obsidian (required for MCP sync).

### Step 7: Connect MCP Servers
In Claude Code settings or claude.ai → MCP:
- Gmail ✅
- Google Calendar ✅
- Filesystem (point to `C:\Users\[USERNAME]\Documents\Claude\StaszekOS`) ✅
- Google Drive ⚠ (requires OAuth re-auth)
- Microsoft 365 ⚠ (requires OAuth re-auth)

### Step 8: Verify Setup
Run in Claude Code terminal:
```
/setup
```
The setup skill will run a self-check and report what's working and what needs attention.

---

## Self-Rewriting Commands

Four commands evolve based on real project use:

| Command | Self-Rewrites When |
|---------|-------------------|
| `/grill-me` | New jurisdiction, missing question tree, stale questions |
| `/zoning-research` | New overlay trigger, new relief type, better code source URL |
| `/code-lookup` | Recurring AHJ flag pattern, new IBC edition, Chicago CBC amendment |
| `/edit-narrative` | New document type, miscalibrated pass, incorrect flag usage |

Commit message format when a command self-rewrites: `skill-update: [command-name] — [reason]`

---

## Command Reference

| Command | Purpose | Chains To |
|---------|---------|-----------|
| `/grill-me` | Requirements intake (one question at a time) | `/zoning-research`, `/code-lookup`, `/rfi`, `/spec` |
| `/zoning-research` | Full GIS→Municode→memo zoning analysis | `/edit-narrative` |
| `/code-lookup` | Systematic IBC/ADA/NFPA research | `/edit-narrative` |
| `/edit-narrative` | 4-pass editorial review | delivery |
| `/scqa` | Situation→Complication→Question→Answer narrative | `/edit-narrative` |
| `/diagram` | Excalidraw diagram (6 AA types) | — |
| `/flowchart` | IBC/entitlement decision trees | `/diagram` |
| `/ubiquitous-language` | Project terminology glossary | RFI/spec headers |
| `/workflow-builder` | Power Automate/Procore/SharePoint flow design | — |
| `/auto-commit` | Conventional commit for antunovich-ai repo | — |
| `/sync-cowork` | Bridge Obsidian Cowork vault ↔ Claude Code | all Cowork stacks |
| `/setup` | New machine bootstrap and environment check | — |

---

## Corporate Network Notes

- FortiGate SSL inspection on all HTTPS traffic — CA cert required
- `api.github.com` DNS-blocked — use `git push origin` not GitHub CLI
- Power Automate HTTP connectors may need IT whitelist (Michael Thompson, Applied Tech)
- Python pip: always use `--break-system-packages`
- Python SSL: `ssl._create_default_https_context = ssl._create_unverified_context`

---

## Dependency: claude-obsidian

This workspace uses the `claude-obsidian` plugin for wiki and knowledge management.
It lives alongside this plugin in `StaszekOS/claude-obsidian/`.

To install:
```powershell
cd C:\Users\[USERNAME]\Documents\Claude\StaszekOS
git clone https://github.com/trickstero/claude-obsidian.git
```

---

## File Locations on New Machine

| Purpose | Path |
|---------|------|
| Workspace root | `C:\Users\[USERNAME]\Documents\Claude\StaszekOS\` |
| Slash commands | `C:\Users\[USERNAME]\Documents\Claude\StaszekOS\.claude\commands\` |
| Global Claude settings | `C:\Users\[USERNAME]\.claude\settings.json` |
| Project memory | `C:\Users\[USERNAME]\.claude\projects\C--Users-[USERNAME]-Documents-Claude-StaszekOS\memory\` |
| SSL cert | `C:\Users\[USERNAME]\Documents\Claude\antunovich-ca.pem` |
| Secrets | `C:\Users\[USERNAME]\Documents\Claude\StaszekOS\.claude\settings.local.json` |
