# StaszekOS Bootstrap Script
# Run on a new machine after cloning staszekos-plugin
# Usage: powershell -ExecutionPolicy Bypass -File .\scripts\bootstrap.ps1

param(
    [string]$WorkspaceRoot = "$env:USERPROFILE\Documents\Claude\StaszekOS",
    [string]$PluginRoot    = (Split-Path $MyInvocation.MyCommand.Path -Parent | Split-Path -Parent)
)

$OfficeUser = "smatuzik"
$HomeUser   = $env:USERNAME

Write-Host ""
Write-Host "=== StaszekOS Bootstrap ===" -ForegroundColor Cyan
Write-Host "Workspace : $WorkspaceRoot"
Write-Host "Plugin    : $PluginRoot"
Write-Host "Username  : $HomeUser"
if ($HomeUser -ne $OfficeUser) {
    Write-Host "NOTE: Will patch '$OfficeUser' -> '$HomeUser' in all files" -ForegroundColor Yellow
}
Write-Host ""

# Helper
function Patch-File($path) {
    if ((Test-Path $path) -and ($HomeUser -ne $OfficeUser)) {
        $txt = [System.IO.File]::ReadAllText($path)
        if ($txt -match [regex]::Escape($OfficeUser)) {
            $txt = $txt -replace [regex]::Escape($OfficeUser), $HomeUser
            [System.IO.File]::WriteAllText($path, $txt)
            Write-Host "  Patched  : $(Split-Path $path -Leaf)" -ForegroundColor Green
        }
    }
}

# -------------------------------------------------------------------
# 1. Directory structure
# -------------------------------------------------------------------
Write-Host "1. Creating directory structure..." -ForegroundColor Yellow
$dirs = @(
    "$WorkspaceRoot\.claude\commands",
    "$WorkspaceRoot\.claude\hooks",
    "$WorkspaceRoot\Projects",
    "$WorkspaceRoot\Scheduled",
    "$WorkspaceRoot\Cowork\Zoning-Analysis\_inputs",
    "$WorkspaceRoot\Cowork\Zoning-Analysis\_outputs",
    "$WorkspaceRoot\Cowork\Code-Research\_inputs",
    "$WorkspaceRoot\Cowork\Code-Research\_outputs",
    "$WorkspaceRoot\Cowork\SHPO-Narrative\_inputs",
    "$WorkspaceRoot\Cowork\SHPO-Narrative\_outputs",
    "$WorkspaceRoot\Cowork\RFI-Drafting\_inputs",
    "$WorkspaceRoot\Cowork\RFI-Drafting\_outputs",
    "$WorkspaceRoot\Cowork\SPEC-Writing\_inputs",
    "$WorkspaceRoot\Cowork\SPEC-Writing\_outputs"
)
foreach ($d in $dirs) {
    New-Item -ItemType Directory -Force -Path $d | Out-Null
}
Write-Host "  Done" -ForegroundColor Green

# -------------------------------------------------------------------
# 2. Slash commands
# -------------------------------------------------------------------
Write-Host "2. Installing slash commands..." -ForegroundColor Yellow
$cmdSrc = "$PluginRoot\commands"
$cmdDst = "$WorkspaceRoot\.claude\commands"
if (Test-Path $cmdSrc) {
    Copy-Item "$cmdSrc\*" -Destination $cmdDst -Force
    $n = (Get-ChildItem $cmdDst -Filter "*.md").Count
    Write-Host "  $n commands installed" -ForegroundColor Green
} else {
    Write-Host "  MISSING: $cmdSrc" -ForegroundColor Red
}

# -------------------------------------------------------------------
# 3. CLAUDE.md
# -------------------------------------------------------------------
Write-Host "3. Installing CLAUDE.md..." -ForegroundColor Yellow
$src = "$PluginRoot\CLAUDE.md"
if (Test-Path $src) {
    Copy-Item $src -Destination "$WorkspaceRoot\CLAUDE.md" -Force
    Patch-File "$WorkspaceRoot\CLAUDE.md"
    Write-Host "  Done" -ForegroundColor Green
} else {
    Write-Host "  MISSING: $src" -ForegroundColor Red
}

# -------------------------------------------------------------------
# 4. Cowork vault (Obsidian memory structure)
# -------------------------------------------------------------------
Write-Host "4. Installing Cowork vault..." -ForegroundColor Yellow
$src = "$PluginRoot\Cowork"
if (Test-Path $src) {
    Copy-Item "$src\*" -Destination "$WorkspaceRoot\Cowork" -Recurse -Force
    Write-Host "  Done" -ForegroundColor Green
} else {
    Write-Host "  MISSING: $src" -ForegroundColor Red
}

# -------------------------------------------------------------------
# 5. Memory files
# -------------------------------------------------------------------
Write-Host "5. Installing memory files..." -ForegroundColor Yellow
$projKey = "C--Users-$HomeUser-Documents-Claude-StaszekOS"
$memDst  = "$env:USERPROFILE\.claude\projects\$projKey\memory"
$memSrc  = "$PluginRoot\memory"
New-Item -ItemType Directory -Force -Path $memDst | Out-Null
if (Test-Path $memSrc) {
    Copy-Item "$memSrc\*" -Destination $memDst -Force
    $n = (Get-ChildItem $memDst -Filter "*.md").Count
    Write-Host "  $n files installed to $memDst" -ForegroundColor Green
} else {
    Write-Host "  MISSING: $memSrc" -ForegroundColor Red
}

# -------------------------------------------------------------------
# 6. settings.local.json template
# -------------------------------------------------------------------
Write-Host "6. settings.local.json..." -ForegroundColor Yellow
$settingsLocal = "$WorkspaceRoot\.claude\settings.local.json"
if (-not (Test-Path $settingsLocal)) {
    Set-Content -Path $settingsLocal -Value '{
  "env": {
    "GITHUB_TOKEN": "ghp_YOUR_TOKEN_HERE"
  }
}'
    Write-Host "  Created -- replace ghp_YOUR_TOKEN_HERE with your token" -ForegroundColor Yellow
} else {
    Write-Host "  Already exists (not overwritten)" -ForegroundColor Green
}

# -------------------------------------------------------------------
# 7. SSL cert (office network -- skip at home if cert not present)
# -------------------------------------------------------------------
Write-Host "7. SSL certificate check..." -ForegroundColor Yellow
$certPath = "$env:USERPROFILE\Documents\Claude\antunovich-ca.pem"
if (Test-Path $certPath) {
    [System.Environment]::SetEnvironmentVariable("NODE_EXTRA_CA_CERTS", $certPath, "User")
    Write-Host "  NODE_EXTRA_CA_CERTS set" -ForegroundColor Green
} else {
    Write-Host "  No cert found -- skipping (OK on home network)" -ForegroundColor Yellow
}

# -------------------------------------------------------------------
# 8. Git check
# -------------------------------------------------------------------
Write-Host "8. Git check..." -ForegroundColor Yellow
try {
    $v = git --version 2>&1
    Write-Host "  $v" -ForegroundColor Green
} catch {
    Write-Host "  Git not found -- install from https://git-scm.com/" -ForegroundColor Red
}

# -------------------------------------------------------------------
# 9. Wiki + sync scripts -> Scheduled/
# -------------------------------------------------------------------
Write-Host "9. Installing wiki MCP and sync scripts..." -ForegroundColor Yellow
$scripts = @("wiki-mcp.py", "wiki-mcp-http.py", "sync-cowork.py")
foreach ($s in $scripts) {
    $src = "$PluginRoot\scripts\$s"
    $dst = "$WorkspaceRoot\Scheduled\$s"
    if (Test-Path $src) {
        Copy-Item $src -Destination $dst -Force
        Patch-File $dst
        Write-Host "  $s -> Scheduled/" -ForegroundColor Green
    } else {
        Write-Host "  MISSING: $s" -ForegroundColor Red
    }
}

# -------------------------------------------------------------------
# 10. settings.json (Stop hook)
# -------------------------------------------------------------------
Write-Host "10. Installing settings.json (Stop hook)..." -ForegroundColor Yellow
$src = "$PluginRoot\config\settings.json"
$dst = "$WorkspaceRoot\.claude\settings.json"
if (Test-Path $src) {
    if (-not (Test-Path $dst)) {
        Copy-Item $src -Destination $dst -Force
        Patch-File $dst
        Write-Host "  Installed (sync fires automatically on session end)" -ForegroundColor Green
    } else {
        Write-Host "  Already exists (not overwritten)" -ForegroundColor Yellow
    }
} else {
    Write-Host "  MISSING: $src" -ForegroundColor Red
}

# -------------------------------------------------------------------
# 11. .mcp.json (wiki MCP for Claude Code)
# -------------------------------------------------------------------
Write-Host "11. Installing .mcp.json..." -ForegroundColor Yellow
$src = "$PluginRoot\config\staszekos-mcp.json"
$dst = "$WorkspaceRoot\.mcp.json"
if (Test-Path $src) {
    if (-not (Test-Path $dst)) {
        Copy-Item $src -Destination $dst -Force
        Patch-File $dst
        Write-Host "  Installed (wiki tools active after Claude Code restart)" -ForegroundColor Green
    } else {
        Write-Host "  Already exists (not overwritten)" -ForegroundColor Yellow
    }
} else {
    Write-Host "  MISSING: $src" -ForegroundColor Red
}

# -------------------------------------------------------------------
# 12. Cowork project CLAUDE.md files -> Documents\Claude\Projects\
# -------------------------------------------------------------------
Write-Host "12. Installing Cowork project context files..." -ForegroundColor Yellow
$projectsRoot = "$env:USERPROFILE\Documents\Claude\Projects"

$coworkFiles = @(
    @{ Src = "Cowork\Code-Research\CLAUDE_2.md";       Dst = "$projectsRoot\CODE\CLAUDE_2.md" },
    @{ Src = "Cowork\Code-Research\ZONING.md";         Dst = "$projectsRoot\CODE\ZONING.md" },
    @{ Src = "Cowork\Zoning-Analysis\CLAUDE.md";       Dst = "$projectsRoot\ZONING\CLAUDE.md" },
    @{ Src = "Cowork\RFI-Drafting\CLAUDE.md";          Dst = "$projectsRoot\RFI drafting\CLAUDE.md" },
    @{ Src = "Cowork\SPEC-Writing\CLAUDE.md";          Dst = "$projectsRoot\SPEC writing\CLAUDE.md" },
    @{ Src = "Cowork\SHPO-Narrative\CLAUDE.md";        Dst = "$projectsRoot\SHPO Treatment Narrative\CLAUDE.md" },
    @{ Src = "Cowork\hot.md";                          Dst = "$projectsRoot\CODE\hot.md" },
    @{ Src = "Cowork\hot.md";                          Dst = "$projectsRoot\ZONING\hot.md" },
    @{ Src = "Cowork\hot.md";                          Dst = "$projectsRoot\RFI drafting\hot.md" },
    @{ Src = "Cowork\hot.md";                          Dst = "$projectsRoot\SPEC writing\hot.md" },
    @{ Src = "Cowork\hot.md";                          Dst = "$projectsRoot\SHPO Treatment Narrative\hot.md" }
)

foreach ($f in $coworkFiles) {
    $src = "$PluginRoot\$($f.Src)"
    $dst = $f.Dst
    if (Test-Path $src) {
        New-Item -ItemType Directory -Force -Path (Split-Path $dst -Parent) | Out-Null
        Copy-Item $src -Destination $dst -Force
        Patch-File $dst
        Write-Host "  $(Split-Path $dst -Leaf) -> $(Split-Path (Split-Path $dst -Parent) -Leaf)\" -ForegroundColor Green
    } else {
        Write-Host "  MISSING: $($f.Src)" -ForegroundColor Red
    }
}

# -------------------------------------------------------------------
# 13. Python dependencies
# -------------------------------------------------------------------
Write-Host "13. Installing Python dependencies..." -ForegroundColor Yellow
$pkgs = @("mcp", "starlette", "uvicorn", "anthropic")
foreach ($p in $pkgs) {
    python -m pip install $p --break-system-packages -q 2>&1 | Out-Null
    Write-Host "  $p -- OK" -ForegroundColor Green
}

# -------------------------------------------------------------------
# Summary
# -------------------------------------------------------------------
Write-Host ""
Write-Host "=== Bootstrap Complete ===" -ForegroundColor Cyan
Write-Host ""
Write-Host "Installed:" -ForegroundColor White
Write-Host "  Slash commands  -> .claude\commands\"
Write-Host "  CLAUDE.md       -> StaszekOS root"
Write-Host "  Wiki MCP server -> Scheduled\wiki-mcp.py"
Write-Host "  Sync pipeline   -> Scheduled\sync-cowork.py"
Write-Host "  Stop hook       -> .claude\settings.json"
Write-Host "  MCP config      -> .mcp.json"
Write-Host "  Cowork contexts -> Documents\Claude\Projects\[each project]\"
Write-Host "  Wiki snapshot   -> hot.md in all 5 Cowork projects"
Write-Host ""
Write-Host "Next steps:" -ForegroundColor Yellow
Write-Host "  1. Edit .claude\settings.local.json -- add your GitHub token"
Write-Host "  2. Clone the wiki:"
Write-Host "     cd $WorkspaceRoot"
Write-Host "     git clone https://github.com/trickstero/claude-obsidian.git claude-obsidian"
Write-Host "  3. Open Claude Code -> File -> Open Folder -> $WorkspaceRoot"
Write-Host "  4. In claude.ai Cowork projects: add the CLAUDE.md files from Documents\Claude\Projects\"
Write-Host ""
Write-Host "For help see: $PluginRoot\SETUP.md" -ForegroundColor Cyan
