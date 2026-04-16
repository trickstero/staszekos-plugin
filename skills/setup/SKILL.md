# /setup — StaszekOS New Machine Bootstrap

## Trigger
Run `/setup` on a new machine after cloning this plugin, or to verify the current environment health.

## Purpose
Self-check and guided setup of the full StaszekOS environment. Verifies all components are in place and walks through any gaps step by step.

## Process

### Phase 1 — Environment Inventory

Check each component and report status (✅ / ⚠️ / ❌):

**Directory Structure**
- [ ] `StaszekOS/` workspace root exists
- [ ] `StaszekOS/.claude/commands/` exists with 11+ command files
- [ ] `StaszekOS/Cowork/` exists with 5 project folders
- [ ] `StaszekOS/Projects/` exists

**Secrets and Auth**
- [ ] `.claude/settings.local.json` exists (do NOT read contents — just confirm presence)
- [ ] `NODE_EXTRA_CA_CERTS` env var set (check with `echo $NODE_EXTRA_CA_CERTS` in bash)
- [ ] FortiGate CA cert file exists at the path in NODE_EXTRA_CA_CERTS

**Git Configuration**
- [ ] Git installed (`git --version`)
- [ ] antunovich-ai repo cloned or accessible
- [ ] Remote `origin` points to `https://github.com/trickstero/antunovich-ai`

**MCP Servers**
- [ ] Obsidian Local REST API plugin active in Obsidian
- [ ] mcp-obsidian configured in Claude Code
- [ ] Filesystem MCP configured and pointing to StaszekOS/

**Memory**
- [ ] Claude project memory directory exists
- [ ] MEMORY.md index present

### Phase 2 — Report

Output a structured status report:

```
STASZEKOS ENVIRONMENT STATUS
Date: [YYYY-MM-DD]

✅ READY
  - [list of components that passed]

⚠️ NEEDS ATTENTION
  - [list of components that need action, with next step]

❌ MISSING — SETUP REQUIRED
  - [list of components not found, with setup instructions]
```

### Phase 3 — Guided Setup for Any ❌ Items

For each missing component, walk through the fix step by step. Do not proceed to the next fix until the user confirms the current one is done.

#### If commands/ is missing or empty:
```powershell
# Copy commands from plugin to .claude/commands/
$src = "C:\Users\$env:USERNAME\Documents\Claude\StaszekOS\Projects\staszekos-plugin\commands"
$dst = "C:\Users\$env:USERNAME\Documents\Claude\StaszekOS\.claude\commands"
New-Item -ItemType Directory -Force -Path $dst
Copy-Item "$src\*" -Destination $dst -Force
```

#### If settings.local.json is missing:
```powershell
$path = "C:\Users\$env:USERNAME\Documents\Claude\StaszekOS\.claude\settings.local.json"
@'
{
  "env": {
    "GITHUB_TOKEN": "ghp_YOUR_TOKEN_HERE"
  }
}
'@ | Set-Content $path
```
Then prompt: "Open `settings.local.json` and replace `ghp_YOUR_TOKEN_HERE` with your GitHub classic token."

#### If NODE_EXTRA_CA_CERTS is missing:
```powershell
$certPath = "C:\Users\$env:USERNAME\Documents\Claude\antunovich-ca.pem"
[System.Environment]::SetEnvironmentVariable("NODE_EXTRA_CA_CERTS", $certPath, "User")
```
Then prompt: "Restart your terminal for the env var to take effect. Confirm the cert file exists at that path."

#### If Obsidian MCP is not configured:
Instruct: "In Obsidian, go to Settings → Community Plugins → Browse → search 'Local REST API' → Install → Enable. Note the API key shown."
Then: "In Claude Code settings, add the mcp-obsidian server with the vault path and API key."

#### If memory is missing:
```powershell
# Run the memory bootstrap
$memSrc = "C:\Users\$env:USERNAME\Documents\Claude\StaszekOS\Projects\staszekos-plugin\memory"
# Determine project memory path
$projKey = "C--Users-$env:USERNAME-Documents-Claude-StaszekOS"
$memDst = "C:\Users\$env:USERNAME\.claude\projects\$projKey\memory"
New-Item -ItemType Directory -Force -Path $memDst
Copy-Item "$memSrc\*" -Destination $memDst -Force
```

### Phase 4 — Final Verification

After all gaps are addressed, run the check again and confirm all items are ✅.

Output:
```
StaszekOS environment verified. All systems operational.
Run /sync-cowork to start a Cowork session, or use any slash command directly.
```

## Rules
- Never read or display the contents of settings.local.json — only confirm presence
- Never commit secrets to git — remind the user if they're about to
- Provide exact PowerShell commands — no "you can try" or "consider" language
- Walk through one fix at a time, waiting for user confirmation between each
