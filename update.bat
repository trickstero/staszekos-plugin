@echo off
echo.
echo === StaszekOS Update ===
echo Pulling latest from GitHub and syncing all Cowork project files...
echo.

:: ── Find plugin folder (same folder as this .bat file) ──────────────────────
set PLUGIN=%~dp0
set PLUGIN=%PLUGIN:~0,-1%

:: ── Workspace and Projects paths ────────────────────────────────────────────
set WORKSPACE=%USERPROFILE%\Documents\Claude\StaszekOS
set PROJECTS=%USERPROFILE%\Documents\Claude\Projects

:: ── 1. Pull latest from GitHub ───────────────────────────────────────────────
echo [1/3] Pulling latest plugin from GitHub...
cd /d "%PLUGIN%"
git pull
echo.

:: ── 2. Create Cowork project folders ────────────────────────────────────────
echo [2/3] Creating project folders...
mkdir "%PROJECTS%\CODE" 2>nul
mkdir "%PROJECTS%\ZONING" 2>nul
mkdir "%PROJECTS%\RFI drafting" 2>nul
mkdir "%PROJECTS%\SPEC writing" 2>nul
mkdir "%PROJECTS%\SHPO Treatment Narrative" 2>nul
echo   Done.
echo.

:: ── 3. Copy all context files ────────────────────────────────────────────────
echo [3/3] Copying context files to Cowork projects...

copy /y "%PLUGIN%\Cowork\Code-Research\CLAUDE_2.md"    "%PROJECTS%\CODE\CLAUDE_2.md"
copy /y "%PLUGIN%\Cowork\Code-Research\ZONING.md"      "%PROJECTS%\CODE\ZONING.md"
copy /y "%PLUGIN%\Cowork\hot.md"                       "%PROJECTS%\CODE\hot.md"

copy /y "%PLUGIN%\Cowork\Zoning-Analysis\CLAUDE.md"    "%PROJECTS%\ZONING\CLAUDE.md"
copy /y "%PLUGIN%\Cowork\hot.md"                       "%PROJECTS%\ZONING\hot.md"

copy /y "%PLUGIN%\Cowork\RFI-Drafting\CLAUDE.md"       "%PROJECTS%\RFI drafting\CLAUDE.md"
copy /y "%PLUGIN%\Cowork\hot.md"                       "%PROJECTS%\RFI drafting\hot.md"

copy /y "%PLUGIN%\Cowork\SPEC-Writing\CLAUDE.md"       "%PROJECTS%\SPEC writing\CLAUDE.md"
copy /y "%PLUGIN%\Cowork\hot.md"                       "%PROJECTS%\SPEC writing\hot.md"

copy /y "%PLUGIN%\Cowork\SHPO-Narrative\CLAUDE.md"     "%PROJECTS%\SHPO Treatment Narrative\CLAUDE.md"
copy /y "%PLUGIN%\Cowork\hot.md"                       "%PROJECTS%\SHPO Treatment Narrative\hot.md"

echo.
echo === Done! ===
echo.
echo Files are now at: %PROJECTS%\
echo.
echo Next: in each Cowork project click Context + and add the files from:
echo   %PROJECTS%\CODE\          (add CLAUDE_2.md + ZONING.md + hot.md)
echo   %PROJECTS%\ZONING\        (add CLAUDE.md + hot.md)
echo   %PROJECTS%\RFI drafting\  (add CLAUDE.md)
echo   %PROJECTS%\SPEC writing\  (add CLAUDE.md)
echo   %PROJECTS%\SHPO Treatment Narrative\ (add CLAUDE.md)
echo.
pause
