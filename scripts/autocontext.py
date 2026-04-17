#!/usr/bin/env python3
"""
autocontext.py — uploads context files to claude.ai Cowork projects automatically.
Run once after bootstrapping a new machine.

Usage:
  python autocontext.py

Requirements:
  pip install playwright
  playwright install chromium
"""

import asyncio
import os
import sys

# ── CONFIG ────────────────────────────────────────────────────────────────────
# Local Projects folder (adjust if username differs)
PROJECTS_DIR = os.path.join(os.environ["USERPROFILE"], "Documents", "Claude", "Projects")

# Map: claude.ai project name -> local folder name -> files to upload
# Edit claude.ai project names here if yours differ (e.g. "ZONING ANALYSIS" vs "ZONING")
PROJECTS = [
    {
        "claude_name": "CODE",
        "folder":      "CODE",
        "files":       ["CLAUDE_2.md", "ZONING.md", "hot.md"],
    },
    {
        "claude_name": "ZONING",
        "folder":      "ZONING",
        "files":       ["CLAUDE.md", "hot.md"],
    },
    {
        "claude_name": "RFI drafting",
        "folder":      "RFI drafting",
        "files":       ["CLAUDE.md", "hot.md"],
    },
    {
        "claude_name": "SPEC writing",
        "folder":      "SPEC writing",
        "files":       ["CLAUDE.md", "hot.md"],
    },
    {
        "claude_name": "SHPO Treatment Narrative",
        "folder":      "SHPO Treatment Narrative",
        "files":       ["CLAUDE.md", "hot.md"],
    },
]
# ── END CONFIG ────────────────────────────────────────────────────────────────


async def upload_to_project(page, project, projects_dir):
    name   = project["claude_name"]
    folder = project["folder"]
    files  = [
        os.path.join(projects_dir, folder, f)
        for f in project["files"]
        if os.path.exists(os.path.join(projects_dir, folder, f))
    ]

    if not files:
        print(f"  SKIP  {name} — no files found in {folder}\\")
        return

    print(f"\n  Processing: {name}")

    # Go to projects list and click the matching project
    await page.goto("https://claude.ai/projects", wait_until="networkidle")
    await page.wait_for_timeout(1500)

    # Try to find the project link
    project_link = page.locator(f'a:has-text("{name}")').first
    if not await project_link.is_visible():
        print(f"  ERROR  Could not find project '{name}' on the page — skipping")
        return

    await project_link.click()
    await page.wait_for_load_state("networkidle")
    await page.wait_for_timeout(1500)

    # Look for the Add content / Context + button
    add_btn = None
    for selector in [
        'button:has-text("Add content")',
        'button:has-text("Content")',
        'button:has-text("Context")',
        '[aria-label="Add content"]',
        '[data-testid="add-content-button"]',
    ]:
        candidate = page.locator(selector).first
        if await candidate.is_visible():
            add_btn = candidate
            break

    if add_btn is None:
        print(f"  ERROR  Could not find Add content button for '{name}' — skipping")
        return

    await add_btn.click()
    await page.wait_for_timeout(1000)

    # Click "Upload files" inside the dialog that appears
    upload_btn = None
    for selector in [
        'button:has-text("Upload files")',
        'button:has-text("Upload")',
        'input[type="file"]',
    ]:
        candidate = page.locator(selector).first
        if await candidate.is_visible():
            upload_btn = candidate
            break

    if upload_btn is None:
        print(f"  ERROR  Could not find Upload button for '{name}' — skipping")
        return

    # Intercept the file chooser
    async with page.expect_file_chooser() as fc_info:
        await upload_btn.click()
    fc = await fc_info.value
    await fc.set_files(files)

    await page.wait_for_load_state("networkidle")
    await page.wait_for_timeout(2000)

    print(f"  OK     {len(files)} files -> {name}")
    for f in files:
        print(f"         {os.path.basename(f)}")


async def main():
    try:
        from playwright.async_api import async_playwright
    except ImportError:
        print("Playwright not installed. Run:")
        print("  pip install playwright")
        print("  playwright install chromium")
        sys.exit(1)

    print("=== AutoContext — claude.ai project file uploader ===")
    print(f"Projects dir : {PROJECTS_DIR}")
    print()

    # Verify files exist before launching browser
    missing = []
    for proj in PROJECTS:
        for fname in proj["files"]:
            path = os.path.join(PROJECTS_DIR, proj["folder"], fname)
            if not os.path.exists(path):
                missing.append(path)

    if missing:
        print("WARNING — these files are missing (will be skipped):")
        for m in missing:
            print(f"  {m}")
        print()

    async with async_playwright() as p:
        browser = await p.chromium.launch(headless=False, slow_mo=300)
        context = await browser.new_context()
        page    = await context.new_page()

        await page.goto("https://claude.ai")
        print("Browser opened. Log in to claude.ai, then press Enter here...")
        input()

        for project in PROJECTS:
            await upload_to_project(page, project, PROJECTS_DIR)

        print("\n=== Done ===")
        print("Review each project in claude.ai to confirm files are attached.")
        input("Press Enter to close the browser...")
        await browser.close()


if __name__ == "__main__":
    asyncio.run(main())
