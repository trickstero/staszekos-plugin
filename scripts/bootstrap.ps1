# StaszekOS Bootstrap Script
# Run as Administrator on a new machine after cloning staszekos-plugin
# Usage: .\bootstrap.ps1

param(
    [string]$WorkspaceRoot = "$env:USERPROFILE\Documents\Claude\StaszekOS",
    [string]$PluginRoot = "$WorkspaceRoot\Projects\staszekos-plugin"
)

Write-Host "`n=== StaszekOS Bootstrap ===" -ForegroundColor Cyan
Write-Host "Workspace: $WorkspaceRoot"
Write-Host "Plugin:    $PluginRoot`n"

# ─── 1. Create workspace directory structure ──────────────────────────────────
Write-Host "1. Creating workspace directory structure..." -ForegroundColor Yellow

$dirs = @(
    "$WorkspaceRoot\.claude\commands",
    "$WorkspaceRoot\.claude\hooks",
    "$WorkspaceRoot\Projects",
    "$WorkspaceRoot\Cowork\Zoning-Analysis\_inputs",
    "$WorkspaceRoot\Cowork\Zoning-Analysis\_outputs",
    "$WorkspaceRoot\Cowork\Code-Research\_inputs",
    "$WorkspaceRoot\Cowork\Code-Research\_outputs",
    "$WorkspaceRoot\Cowork\SHPO-Narrative\_inputs",
    "$WorkspaceRoot\Cowork\SHPO-Narrative\_outputs",
    "$WorkspaceRoot\Cowork\RFI-Drafting\_inputs",
    "$WorkspaceRoot\Cowork\RFI-Drafting\_outputs",
    "$WorkspaceRoot\Cowork\SPEC-Writing\_inputs",
    "$WorkspaceRoot\Cowork\SPEC-Writing\_outputs",
    "$WorkspaceRoot\Scheduled"
)

foreach ($dir in $dirs) {
    New-Item -ItemType Directory -Force -Path $dir | Out-Null
    Write-Host "  ✓ $dir" -ForegroundColor Green
}

# ─── 2. Copy slash commands to .claude/commands/ ────────────────────────────
Write-Host "`n2. Installing slash commands..." -ForegroundColor Yellow

$cmdSrc = "$PluginRoot\commands"
$cmdDst = "$WorkspaceRoot\.claude\commands"

if (Test-Path $cmdSrc) {
    Copy-Item "$cmdSrc\*" -Destination $cmdDst -Force
    $count = (Get-ChildItem $cmdDst -Filter "*.md").Count
    Write-Host "  ✓ $count commands installed to $cmdDst" -ForegroundColor Green
} else {
    Write-Host "  ✗ Commands source not found: $cmdSrc" -ForegroundColor Red
}

# ─── 3. Copy Cowork vault structure ─────────────────────────────────────────
Write-Host "`n3. Installing Cowork vault structure..." -ForegroundColor Yellow

$coworkSrc = "$PluginRoot\Cowork"
$coworkDst = "$WorkspaceRoot\Cowork"

if (Test-Path $coworkSrc) {
    Copy-Item "$coworkSrc\*" -Destination $coworkDst -Recurse -Force
    Write-Host "  ✓ Cowork vault structure installed" -ForegroundColor Green
} else {
    Write-Host "  ✗ Cowork source not found: $coworkSrc" -ForegroundColor Red
}

# ─── 4. Copy CLAUDE.md to workspace root ────────────────────────────────────
Write-Host "`n4. Installing CLAUDE.md..." -ForegroundColor Yellow

$claudeMdSrc = "$PluginRoot\CLAUDE.md"
$claudeMdDst = "$WorkspaceRoot\CLAUDE.md"

if (Test-Path $claudeMdSrc) {
    Copy-Item $claudeMdSrc -Destination $claudeMdDst -Force
    Write-Host "  ✓ CLAUDE.md installed" -ForegroundColor Green
} else {
    Write-Host "  ✗ CLAUDE.md source not found" -ForegroundColor Red
}

# ─── 5. Bootstrap memory files ───────────────────────────────────────────────
Write-Host "`n5. Bootstrapping memory files..." -ForegroundColor Yellow

$projKey = "C--Users-$env:USERNAME-Documents-Claude-StaszekOS"
$memDst = "$env:USERPROFILE\.claude\projects\$projKey\memory"
$memSrc = "$PluginRoot\memory"

New-Item -ItemType Directory -Force -Path $memDst | Out-Null

if (Test-Path $memSrc) {
    Copy-Item "$memSrc\*" -Destination $memDst -Force
    $count = (Get-ChildItem $memDst -Filter "*.md").Count
    Write-Host "  ✓ $count memory files installed to $memDst" -ForegroundColor Green
} else {
    Write-Host "  ✗ Memory source not found: $memSrc" -ForegroundColor Red
}

# ─── 6. Create settings.local.json template (if missing) ────────────────────
Write-Host "`n6. Checking settings.local.json..." -ForegroundColor Yellow

$settingsPath = "$WorkspaceRoot\.claude\settings.local.json"

if (-not (Test-Path $settingsPath)) {
    $template = @'
{
  "env": {
    "GITHUB_TOKEN": "ghp_YOUR_TOKEN_HERE"
  }
}
'@
    Set-Content -Path $settingsPath -Value $template
    Write-Host "  ✓ settings.local.json template created" -ForegroundColor Green
    Write-Host "  ⚠ ACTION REQUIRED: Open $settingsPath and replace ghp_YOUR_TOKEN_HERE with your GitHub token" -ForegroundColor Yellow
} else {
    Write-Host "  ✓ settings.local.json already exists (not overwritten)" -ForegroundColor Green
}

# ─── 7. Set NODE_EXTRA_CA_CERTS for FortiGate SSL ───────────────────────────
Write-Host "`n7. Checking SSL certificate configuration..." -ForegroundColor Yellow

$certPath = "$env:USERPROFILE\Documents\Claude\antunovich-ca.pem"
$currentCert = [System.Environment]::GetEnvironmentVariable("NODE_EXTRA_CA_CERTS", "User")

if (-not $currentCert) {
    if (Test-Path $certPath) {
        [System.Environment]::SetEnvironmentVariable("NODE_EXTRA_CA_CERTS", $certPath, "User")
        Write-Host "  ✓ NODE_EXTRA_CA_CERTS set to $certPath" -ForegroundColor Green
        Write-Host "  ⚠ Restart your terminal for this to take effect" -ForegroundColor Yellow
    } else {
        Write-Host "  ✗ CA cert not found at $certPath" -ForegroundColor Red
        Write-Host "    ACTION REQUIRED: Download the FortiGate CA cert from IT and place at:" -ForegroundColor Yellow
        Write-Host "    $certPath" -ForegroundColor Yellow
        Write-Host "    Then run:" -ForegroundColor Yellow
        Write-Host "    [System.Environment]::SetEnvironmentVariable('NODE_EXTRA_CA_CERTS', '$certPath', 'User')" -ForegroundColor White
    }
} else {
    Write-Host "  ✓ NODE_EXTRA_CA_CERTS already set to: $currentCert" -ForegroundColor Green
}

# ─── 8. Check Git installation ───────────────────────────────────────────────
Write-Host "`n8. Checking Git..." -ForegroundColor Yellow

try {
    $gitVersion = git --version 2>&1
    Write-Host "  ✓ $gitVersion" -ForegroundColor Green
} catch {
    Write-Host "  ✗ Git not found. Install from https://git-scm.com/" -ForegroundColor Red
}

# ─── 9. Patch hardcoded username (office: smatuzik → this machine) ──────────
Write-Host "`n9. Patching username in all installed files..." -ForegroundColor Yellow

$officeUser = "smatuzik"
$homeUser   = $env:USERNAME

if ($homeUser -ne $officeUser) {
    $filesToPatch = @(
        "$WorkspaceRoot\Scheduled\wiki-mcp.py",
        "$WorkspaceRoot\Scheduled\wiki-mcp-http.py",
        "$WorkspaceRoot\Scheduled\sync-cowork.py",
        "$WorkspaceRoot\.mcp.json",
        "$WorkspaceRoot\.claude\settings.json",
        "$WorkspaceRoot\CLAUDE.md"
    )
    foreach ($f in $filesToPatch) {
        if (Test-Path $f) {
            $content = Get-Content $f -Raw
            if ($content -match [regex]::Escape($officeUser)) {
                $content = $content -replace [regex]::Escape($officeUser), $homeUser
                Set-Content -Path $f -Value $content -NoNewline
                Write-Host "  ✓ Patched: $(Split-Path $f -Leaf)  ($officeUser -> $homeUser)" -ForegroundColor Green
            }
        }
    }
    # Also patch Cowork project CLAUDE files
    $coworkProjectsRoot = "$env:USERPROFILE\Documents\Claude\Projects"
    Get-ChildItem $coworkProjectsRoot -Recurse -Filter "*.md" | ForEach-Object {
        $content = Get-Content $_.FullName -Raw
        if ($content -and $content -match [regex]::Escape($officeUser)) {
            $content = $content -replace [regex]::Escape($officeUser), $homeUser
            Set-Content -Path $_.FullName -Value $content -NoNewline
            Write-Host "  ✓ Patched: $($_.Name)" -ForegroundColor Green
        }
    }
    Write-Host "  All '$officeUser' references updated to '$homeUser'" -ForegroundColor Green
} else {
    Write-Host "  ✓ Same username — no patching needed" -ForegroundColor Green
}

# ─── 11. Install wiki MCP scripts to Scheduled/ ─────────────────────────────
Write-Host "`n9. Installing wiki MCP and sync scripts..." -ForegroundColor Yellow

$scheduledDst = "$WorkspaceRoot\Scheduled"
New-Item -ItemType Directory -Force -Path $scheduledDst | Out-Null

$scripts = @("wiki-mcp.py", "wiki-mcp-http.py", "sync-cowork.py")
foreach ($s in $scripts) {
    $src = "$PluginRoot\scripts\$s"
    if (Test-Path $src) {
        Copy-Item $src -Destination "$scheduledDst\$s" -Force
        Write-Host "  ✓ $s -> Scheduled/" -ForegroundColor Green
    } else {
        Write-Host "  ✗ $s not found in plugin/scripts/" -ForegroundColor Red
    }
}

# ─── 12. Install settings.json (Stop hook) ──────────────────────────────────
Write-Host "`n11. Installing settings.json (Stop hook)..." -ForegroundColor Yellow

$settingsJsonSrc = "$PluginRoot\config\settings.json"
$settingsJsonDst = "$WorkspaceRoot\.claude\settings.json"

if (Test-Path $settingsJsonSrc) {
    if (-not (Test-Path $settingsJsonDst)) {
        Copy-Item $settingsJsonSrc -Destination $settingsJsonDst -Force
        Write-Host "  ✓ settings.json installed (Stop hook: sync-cowork.py runs on session end)" -ForegroundColor Green
    } else {
        Write-Host "  ✓ settings.json already exists (not overwritten — merge manually if needed)" -ForegroundColor Yellow
    }
} else {
    Write-Host "  ✗ config/settings.json not found in plugin" -ForegroundColor Red
}

# ─── 11. Install .mcp.json (wiki MCP for Claude Code) ───────────────────────
Write-Host "`n11. Installing .mcp.json (wiki MCP server)..." -ForegroundColor Yellow

$mcpSrc = "$PluginRoot\config\staszekos-mcp.json"
$mcpDst = "$WorkspaceRoot\.mcp.json"

if (Test-Path $mcpSrc) {
    if (-not (Test-Path $mcpDst)) {
        Copy-Item $mcpSrc -Destination $mcpDst -Force
        Write-Host "  ✓ .mcp.json installed (wiki tools available in Claude Code after restart)" -ForegroundColor Green
    } else {
        Write-Host "  ✓ .mcp.json already exists (not overwritten)" -ForegroundColor Yellow
    }
} else {
    Write-Host "  ✗ config/staszekos-mcp.json not found in plugin" -ForegroundColor Red
}

# ─── 12. Install Cowork project CLAUDE.md files ─────────────────────────────
Write-Host "`n12. Installing Cowork project context files..." -ForegroundColor Yellow

$coworkProjectsRoot = "$env:USERPROFILE\Documents\Claude\Projects"

$coworkMap = @{
    "Cowork\Code-Research\CLAUDE_2.md"           = "$coworkProjectsRoot\CODE\CLAUDE_2.md"
    "Cowork\Code-Research\ZONING.md"             = "$coworkProjectsRoot\CODE\ZONING.md"
    "Cowork\Zoning-Analysis\CLAUDE.md"           = "$coworkProjectsRoot\ZONING\CLAUDE.md"
    "Cowork\RFI-Drafting\CLAUDE.md"              = "$coworkProjectsRoot\RFI drafting\CLAUDE.md"
    "Cowork\SPEC-Writing\CLAUDE.md"              = "$coworkProjectsRoot\SPEC writing\CLAUDE.md"
    "Cowork\SHPO-Narrative\CLAUDE.md"            = "$coworkProjectsRoot\SHPO Treatment Narrative\CLAUDE.md"
    "Cowork\hot.md"                              = "$coworkProjectsRoot\CODE\hot.md"
    "Cowork\hot.md"                              = "$coworkProjectsRoot\ZONING\hot.md"
    "Cowork\hot.md"                              = "$coworkProjectsRoot\RFI drafting\hot.md"
    "Cowork\hot.md"                              = "$coworkProjectsRoot\SPEC writing\hot.md"
    "Cowork\hot.md"                              = "$coworkProjectsRoot\SHPO Treatment Narrative\hot.md"
}

foreach ($rel in $coworkMap.Keys) {
    $src = "$PluginRoot\$rel"
    $dst = $coworkMap[$rel]
    $dstDir = Split-Path $dst -Parent
    if (Test-Path $src) {
        New-Item -ItemType Directory -Force -Path $dstDir | Out-Null
        Copy-Item $src -Destination $dst -Force
        Write-Host "  ✓ $(Split-Path $dst -Leaf) -> $(Split-Path $dstDir -Leaf)/" -ForegroundColor Green
    } else {
        Write-Host "  ✗ Source not found: $src" -ForegroundColor Red
    }
}

# ─── 13. Install Python dependencies for wiki MCP ───────────────────────────
Write-Host "`n13. Installing Python dependencies..." -ForegroundColor Yellow

$pipPkgs = @("mcp", "starlette", "uvicorn", "anthropic")
foreach ($pkg in $pipPkgs) {
    Write-Host "  Installing $pkg..." -ForegroundColor Gray
    python -m pip install $pkg --break-system-packages --quiet 2>&1 | Out-Null
    Write-Host "  ✓ $pkg" -ForegroundColor Green
}

# ─── Summary ─────────────────────────────────────────────────────────────────
Write-Host "`n=== Bootstrap Complete ===" -ForegroundColor Cyan
Write-Host ""
Write-Host "What was installed:" -ForegroundColor White
Write-Host "  ✓ Slash commands  -> .claude/commands/" -ForegroundColor Green
Write-Host "  ✓ Cowork vault    -> Cowork/ (Obsidian)" -ForegroundColor Green
Write-Host "  ✓ Cowork contexts -> Documents/Claude/Projects/ (claude.ai)" -ForegroundColor Green
Write-Host "  ✓ Wiki MCP server -> Scheduled/wiki-mcp.py" -ForegroundColor Green
Write-Host "  ✓ Sync pipeline   -> Scheduled/sync-cowork.py" -ForegroundColor Green
Write-Host "  ✓ Stop hook       -> .claude/settings.json" -ForegroundColor Green
Write-Host "  ✓ MCP registration-> .mcp.json" -ForegroundColor Green
Write-Host "  ✓ Knowledge base  -> hot.md in all Cowork projects" -ForegroundColor Green
Write-Host ""
Write-Host "Required manual steps:" -ForegroundColor Yellow
Write-Host "  1. Add GitHub token to: $settingsPath" -ForegroundColor White
Write-Host "  2. Place FortiGate CA cert at: $certPath" -ForegroundColor White
Write-Host "  3. Clone wiki repo:  git clone https://github.com/trickstero/claude-obsidian.git" -ForegroundColor White
Write-Host "     into: $WorkspaceRoot\claude-obsidian" -ForegroundColor White
Write-Host "  4. Open Obsidian -> open vault at $WorkspaceRoot" -ForegroundColor White
Write-Host "  5. Install Obsidian plugin: Local REST API (community plugins)" -ForegroundColor White
Write-Host "  6. Restart Claude Code -> wiki tools appear automatically" -ForegroundColor White
Write-Host "  7. In claude.ai Cowork projects -> verify CLAUDE_2.md and CLAUDE.md loaded" -ForegroundColor White
Write-Host ""
Write-Host "For full setup guide see: $PluginRoot\README.md" -ForegroundColor Cyan
