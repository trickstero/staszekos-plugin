#!/usr/bin/env python
"""
StaszekOS → Cowork knowledge sync.

Scans Cowork context files (CLAUDE_2.md, ZONING.md) for <!-- SYNC --> anchor blocks.
Each anchor declares which StaszekOS command file section it mirrors.
If the source section changed since last sync, updates the block.

Two modes (auto-detected):
  SMART  — ANTHROPIC_API_KEY set → Claude Haiku rewrites block preserving Cowork format
  DIRECT — no key → source section copied verbatim (always works, no external dependency)

Usage:
  python sync-cowork.py              # sync changed sections only
  python sync-cowork.py --force      # sync all blocks regardless of hash
  python sync-cowork.py --dry-run    # preview without writing
  python sync-cowork.py --silent     # no output unless updates found (hook mode)
  python sync-cowork.py --mode smart   # force smart mode (requires API key)
  python sync-cowork.py --mode direct  # force direct copy mode
"""

import ssl
ssl._create_default_https_context = ssl._create_unverified_context

import re
import json
import hashlib
import sys
import os
import argparse
from pathlib import Path
from datetime import date

# ── Paths ─────────────────────────────────────────────────────────────────────
ROOT   = Path(r"C:\Users\smatuzik\Documents\Claude\StaszekOS")
COWORK = Path(r"C:\Users\smatuzik\Documents\Claude\Projects\CODE")

SOURCES = {
    "code-lookup":     ROOT / ".claude/commands/code-lookup.md",
    "zoning-research": ROOT / ".claude/commands/zoning-research.md",
    "grill-me":        ROOT / ".claude/commands/grill-me.md",
    "hot":             ROOT / "claude-obsidian/wiki/hot.md",
    "rfi":             ROOT / ".claude/commands/rfi.md",
    "spec":            ROOT / ".claude/commands/spec.md",
    "shpo":            ROOT / ".claude/commands/shpo.md",
}

TARGETS = [
    COWORK / "CLAUDE_2.md",
    COWORK / "ZONING.md",
    Path(r"C:\Users\smatuzik\Documents\Claude\Projects\ZONING\CLAUDE.md"),
    Path(r"C:\Users\smatuzik\Documents\Claude\Projects\RFI drafting\CLAUDE.md"),
    Path(r"C:\Users\smatuzik\Documents\Claude\Projects\SHPO Treatment Narrative\CLAUDE.md"),
    Path(r"C:\Users\smatuzik\Documents\Claude\Projects\SPEC writing\CLAUDE.md"),
]

# All Cowork project folders that should receive a live copy of hot.md
COWORK_PROJECTS = Path(r"C:\Users\smatuzik\Documents\Claude\Projects")
HOT_MD_SOURCE   = ROOT / "claude-obsidian/wiki/hot.md"

STATE_FILE = ROOT / "Scheduled/.sync-state.json"
LOG_FILE   = ROOT / "Scheduled/sync-cowork.log"

# ── Anchor regex ──────────────────────────────────────────────────────────────
ANCHOR_RE = re.compile(
    r'<!-- SYNC:(?P<meta>[^>]+) -->\n(?P<content>.*?)\n<!-- /SYNC -->',
    re.DOTALL
)

def parse_meta(meta_str: str) -> dict:
    return dict(pair.split('=', 1) for pair in meta_str.split('|') if '=' in pair)

# ── Section extraction ────────────────────────────────────────────────────────
def extract_heading_section(text: str, heading: str) -> str | None:
    """Return content under heading (up to next heading of same/higher level)."""
    pattern = re.compile(r'^(#{1,4}) (.+)$', re.MULTILINE)
    matches = list(pattern.finditer(text))
    for i, m in enumerate(matches):
        if heading.lower() in m.group(2).lower():
            level = len(m.group(1))
            start = m.start()
            end = len(text)
            for j in range(i + 1, len(matches)):
                if len(matches[j].group(1)) <= level:
                    end = matches[j].start()
                    break
            return text[start:end].strip()
    return None

# ── State ─────────────────────────────────────────────────────────────────────
def load_state() -> dict:
    if STATE_FILE.exists():
        try:
            return json.loads(STATE_FILE.read_text(encoding='utf-8'))
        except Exception:
            return {}
    return {}

def save_state(state: dict):
    STATE_FILE.parent.mkdir(parents=True, exist_ok=True)
    STATE_FILE.write_text(json.dumps(state, indent=2), encoding='utf-8')

def section_hash(text: str) -> str:
    return hashlib.md5(text.encode()).hexdigest()[:12]

# ── Smart update via Claude Haiku ─────────────────────────────────────────────
def update_block_smart(source_section: str, current_block: str) -> str:
    """Claude Haiku rewrites the block to reflect source, preserving Cowork format."""
    import anthropic
    client = anthropic.Anthropic()
    prompt = f"""You are maintaining a section of an architecture firm's Cowork reference document (CLAUDE_2.md or ZONING.md).

The authoritative source section from a StaszekOS slash command has changed:
<source>
{source_section}
</source>

Current content of the Cowork block that mirrors this section:
<current_block>
{current_block}
</current_block>

Rewrite the Cowork block to incorporate all updated facts from the source. Rules:
- Keep the existing Cowork block format (tables, callout boxes, bold labels)
- Remove content that contradicts or is superseded by the source
- Add content from the source that is missing from the block
- If source and block already agree, return the block unchanged
- Return ONLY the updated block content — no XML tags, no anchor markers, no commentary"""

    msg = client.messages.create(
        model="claude-haiku-4-5-20251001",
        max_tokens=2048,
        messages=[{"role": "user", "content": prompt}]
    )
    return msg.content[0].text.strip()

# ── Direct update (no API) ────────────────────────────────────────────────────
def update_block_direct(source_section: str) -> str:
    """Copy source section verbatim into the block."""
    return source_section

# ── Log ───────────────────────────────────────────────────────────────────────
def log(msg: str, silent: bool = False):
    entry = f"[{date.today()}] {msg}"
    try:
        with open(LOG_FILE, 'a', encoding='utf-8') as f:
            f.write(entry + '\n')
    except Exception:
        pass
    if not silent:
        print(msg)

# ── hot.md distribution ───────────────────────────────────────────────────────
def sync_hot_md(dry_run: bool = False, silent: bool = False) -> int:
    """Copy wiki hot.md into every Cowork project folder."""
    if not HOT_MD_SOURCE.exists():
        log(f"  SKIP hot.md — source not found: {HOT_MD_SOURCE}", silent)
        return 0

    updated = 0
    src_text = HOT_MD_SOURCE.read_text(encoding='utf-8')
    src_hash = section_hash(src_text)

    state = load_state()
    new_state = dict(state)

    for project_dir in sorted(COWORK_PROJECTS.iterdir()):
        if not project_dir.is_dir():
            continue
        dest = project_dir / "hot.md"
        state_key = f"hot.md::{project_dir.name}"

        if not (dry_run) and state.get(state_key) == src_hash and dest.exists():
            if not silent:
                print(f"  -- [hot.md → {project_dir.name}] no change")
            continue

        log(f"  COPY hot.md -> {project_dir.name}/hot.md", silent)
        if not dry_run:
            dest.write_text(src_text, encoding='utf-8')
            new_state[state_key] = src_hash
        updated += 1

    if not dry_run:
        # Merge hot.md state into persistent state
        full_state = load_state()
        full_state.update(new_state)
        save_state(full_state)

    return updated

# ── Main ──────────────────────────────────────────────────────────────────────
def sync(force: bool = False, dry_run: bool = False, silent: bool = False, mode: str = 'auto'):
    # Detect mode
    has_key = bool(os.environ.get('ANTHROPIC_API_KEY'))
    if mode == 'auto':
        use_smart = has_key
    elif mode == 'smart':
        if not has_key:
            log("ERROR: --mode smart requires ANTHROPIC_API_KEY env var", silent=False)
            sys.exit(1)
        use_smart = True
    else:
        use_smart = False

    mode_label = 'SMART (Haiku)' if use_smart else 'DIRECT (verbatim copy)'
    if not silent:
        print(f"sync-cowork | mode: {mode_label}")

    state = load_state()
    new_state = dict(state)
    total_updated = 0

    for target_path in TARGETS:
        if not target_path.exists():
            log(f"SKIP: {target_path.name} — file not found", silent)
            continue

        text = target_path.read_text(encoding='utf-8')
        anchors = list(ANCHOR_RE.finditer(text))
        if not anchors:
            continue

        updated_text = text
        file_changed = False

        for m in anchors:
            meta_str      = m.group('meta')
            current_block = m.group('content')
            full_match    = m.group(0)
            meta          = parse_meta(meta_str)
            source_key    = meta.get('source')
            section_name  = meta.get('section', '')
            state_key     = f"{target_path.name}::{meta_str}"

            if not source_key or source_key not in SOURCES:
                log(f"  WARN [{meta_str}] unknown source key", silent)
                continue

            source_path = SOURCES[source_key]
            if not source_path.exists():
                log(f"  SKIP [{meta_str}] source not found: {source_path}", silent)
                continue

            source_text = source_path.read_text(encoding='utf-8')

            if section_name:
                source_section = extract_heading_section(source_text, section_name)
                if not source_section:
                    log(f"  WARN [{meta_str}] heading '{section_name}' not found — using full file", silent)
                    source_section = source_text
            else:
                source_section = source_text

            src_hash = section_hash(source_section)

            if not force and state.get(state_key) == src_hash:
                if not silent:
                    print(f"  -- [{target_path.name}] {meta_str} — no change")
                continue

            log(f"  UPDATE [{target_path.name}] {meta_str}", silent)

            if dry_run:
                log(f"    DRY RUN — source hash: {src_hash}", silent)
                continue

            if use_smart:
                new_content = update_block_smart(source_section, current_block)
            else:
                new_content = update_block_direct(source_section)

            new_block = f"<!-- SYNC:{meta_str} -->\n{new_content}\n<!-- /SYNC -->"
            updated_text = updated_text.replace(full_match, new_block, 1)
            new_state[state_key] = src_hash
            file_changed = True
            total_updated += 1

        if file_changed and not dry_run:
            target_path.write_text(updated_text, encoding='utf-8')
            log(f"  SAVED {target_path.name}", silent)

    if not dry_run:
        save_state(new_state)

    # Always sync hot.md to all Cowork project folders
    hot_updated = sync_hot_md(dry_run=dry_run, silent=silent)
    total_updated += hot_updated

    summary = f"sync-cowork: {total_updated} block(s) updated [{mode_label}] — {date.today()}"
    if total_updated > 0 or not silent:
        log(summary, silent=False)

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Sync StaszekOS knowledge → Cowork context files")
    parser.add_argument('--force',   action='store_true', help='Update all blocks regardless of change state')
    parser.add_argument('--dry-run', action='store_true', help='Preview without writing files')
    parser.add_argument('--silent',  action='store_true', help='No stdout unless updates found')
    parser.add_argument('--mode',    choices=['auto', 'smart', 'direct'], default='auto',
                        help='auto=detect API key, smart=use Haiku, direct=verbatim copy')
    args = parser.parse_args()
    sync(force=args.force, dry_run=args.dry_run, silent=args.silent, mode=args.mode)
