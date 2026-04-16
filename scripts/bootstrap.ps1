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

# ─── Summary ─────────────────────────────────────────────────────────────────
Write-Host "`n=== Bootstrap Complete ===" -ForegroundColor Cyan
Write-Host ""
Write-Host "Next steps:" -ForegroundColor White
Write-Host "  1. Add your GitHub token to: $settingsPath" -ForegroundColor White
Write-Host "  2. Place the FortiGate CA cert at: $certPath" -ForegroundColor White
Write-Host "  3. Open Obsidian → open vault at $WorkspaceRoot" -ForegroundColor White
Write-Host "  4. Install Obsidian plugin: Local REST API (community plugins)" -ForegroundColor White
Write-Host "  5. In Claude Code, run: /setup" -ForegroundColor White
Write-Host "  6. Re-authenticate MCP servers in claude.ai settings (Drive, M365)" -ForegroundColor White
Write-Host ""
Write-Host "For full setup guide see: $PluginRoot\README.md" -ForegroundColor Cyan
