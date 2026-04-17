#!/usr/bin/env python
"""
StaszekOS Wiki MCP Server

Exposes the claude-obsidian wiki as callable tools for any Claude interface
(Claude Code, Cowork, or any MCP-compatible client).

The agent workflow:
  1. wiki_hot()            — always read first: recent context + active threads
  2. wiki_index()          — scan full domain map if hot.md isn't enough
  3. wiki_sources()        — browse ingested project pages
  4. wiki_concepts()       — browse extracted knowledge patterns
  5. wiki_read(page)       — pull a specific page by name
  6. wiki_search(query)    — keyword search across all wiki pages

Registration:
  Claude Code: add to .claude/settings.json mcpServers block (see bottom of file)
  claude.ai:   Settings → Integrations → MCP Servers → add with same command
"""

import ssl
ssl._create_default_https_context = ssl._create_unverified_context

import asyncio
import re
from pathlib import Path

import mcp.types as types
from mcp.server import Server
from mcp.server.stdio import stdio_server

# ── Wiki root ─────────────────────────────────────────────────────────────────
WIKI = Path(r"C:\Users\smatuzik\Documents\Claude\StaszekOS\claude-obsidian\wiki")

server = Server("staszekos-wiki")

# ── Tool definitions ──────────────────────────────────────────────────────────
@server.list_tools()
async def list_tools() -> list[types.Tool]:
    return [
        types.Tool(
            name="wiki_hot",
            description=(
                "Read the wiki hot cache — always call this FIRST before any other wiki tool. "
                "~500 words of recent context: last ingested projects, active knowledge threads, "
                "domain summary. Tells you what's in the wiki and where to look next."
            ),
            inputSchema={"type": "object", "properties": {}},
        ),
        types.Tool(
            name="wiki_index",
            description=(
                "Read the full wiki index — all domains, pages, and relationships. "
                "Use when hot.md doesn't have enough detail to route your query."
            ),
            inputSchema={"type": "object", "properties": {}},
        ),
        types.Tool(
            name="wiki_sources",
            description=(
                "List all ingested source pages — real AA permitted projects with full code "
                "analysis data (occupancies, construction types, egress, fire ratings, "
                "partition schedules, unit finishes). Use to find project precedents."
            ),
            inputSchema={"type": "object", "properties": {}},
        ),
        types.Tool(
            name="wiki_concepts",
            description=(
                "List all concept pages — extracted patterns and frameworks: Chicago high-rise "
                "checklist, IBC 510.2 podium rules, mixed occupancy patterns, PD FAR bundling, "
                "UL assembly library, ARO/MOPD matrix, etc."
            ),
            inputSchema={"type": "object", "properties": {}},
        ),
        types.Tool(
            name="wiki_read",
            description=(
                "Read a specific wiki page by name (without .md extension). "
                "Use after wiki_hot or wiki_index to pull the full page content. "
                "Examples: 'chicago-high-rise-residential-type-ia', 'lmc-410-s-wabash-chicago', "
                "'chicago-pd-far-bundling', 'aa-project-manual-multifamily'"
            ),
            inputSchema={
                "type": "object",
                "properties": {
                    "page": {
                        "type": "string",
                        "description": "Page name without .md extension (e.g. 'chicago-high-rise-residential-type-ia')",
                    }
                },
                "required": ["page"],
            },
        ),
        types.Tool(
            name="wiki_search",
            description=(
                "Full-text search across all wiki pages. Returns page names + matching lines. "
                "Use to find pages containing specific code sections, UL numbers, project "
                "addresses, or keywords before calling wiki_read."
            ),
            inputSchema={
                "type": "object",
                "properties": {
                    "query": {
                        "type": "string",
                        "description": "Search term (e.g. 'IBC 403.2.1.1', 'Type I-A', '741 N Wells', 'U452')",
                    },
                    "max_results": {
                        "type": "integer",
                        "description": "Max results to return (default 15)",
                        "default": 15,
                    },
                },
                "required": ["query"],
            },
        ),
        types.Tool(
            name="wiki_list_pages",
            description=(
                "List all wiki pages in a specific domain folder. "
                "Domains: 'sources', 'concepts', 'entities', 'meta', 'comparisons', 'questions'"
            ),
            inputSchema={
                "type": "object",
                "properties": {
                    "domain": {
                        "type": "string",
                        "description": "Domain folder name: sources, concepts, entities, meta, comparisons, questions",
                    }
                },
                "required": ["domain"],
            },
        ),
    ]

# ── Tool implementations ──────────────────────────────────────────────────────
@server.call_tool()
async def call_tool(name: str, arguments: dict) -> list[types.TextContent]:

    if name == "wiki_hot":
        path = WIKI / "hot.md"
        if not path.exists():
            return [types.TextContent(type="text", text="hot.md not found — wiki may not be initialized")]
        return [types.TextContent(type="text", text=path.read_text(encoding="utf-8"))]

    elif name == "wiki_index":
        path = WIKI / "index.md"
        if not path.exists():
            return [types.TextContent(type="text", text="index.md not found")]
        return [types.TextContent(type="text", text=path.read_text(encoding="utf-8"))]

    elif name == "wiki_sources":
        path = WIKI / "sources/_index.md"
        if not path.exists():
            return [types.TextContent(type="text", text="sources/_index.md not found")]
        return [types.TextContent(type="text", text=path.read_text(encoding="utf-8"))]

    elif name == "wiki_concepts":
        path = WIKI / "concepts/_index.md"
        if not path.exists():
            return [types.TextContent(type="text", text="concepts/_index.md not found")]
        return [types.TextContent(type="text", text=path.read_text(encoding="utf-8"))]

    elif name == "wiki_read":
        page = arguments.get("page", "").strip()
        if not page:
            return [types.TextContent(type="text", text="ERROR: page name required")]

        # Search across all wiki subdirectories
        matches = list(WIKI.rglob(f"{page}.md"))
        if not matches:
            # Try fuzzy: page name as substring
            matches = [p for p in WIKI.rglob("*.md") if page.lower() in p.stem.lower()]

        if not matches:
            # Return nearby pages as hint
            all_pages = sorted(p.stem for p in WIKI.rglob("*.md"))
            hints = [s for s in all_pages if any(w in s for w in page.split("-"))][:8]
            hint_text = "\nDid you mean:\n" + "\n".join(f"  {h}" for h in hints) if hints else ""
            return [types.TextContent(type="text", text=f"Page '{page}' not found.{hint_text}")]

        # Return first match (most specific)
        target = matches[0]
        content = target.read_text(encoding="utf-8")
        header = f"<!-- wiki page: {target.relative_to(WIKI)} -->\n"
        return [types.TextContent(type="text", text=header + content)]

    elif name == "wiki_search":
        query = arguments.get("query", "").strip().lower()
        max_results = int(arguments.get("max_results", 15))

        if not query:
            return [types.TextContent(type="text", text="ERROR: query required")]

        results = []
        for path in sorted(WIKI.rglob("*.md")):
            if path.name.startswith("_"):
                continue
            try:
                text = path.read_text(encoding="utf-8", errors="ignore")
            except Exception:
                continue
            if query in text.lower():
                # Find first matching line
                matching_lines = [
                    l.strip() for l in text.split("\n")
                    if query in l.lower() and l.strip()
                ]
                snippet = matching_lines[0][:120] if matching_lines else "(in frontmatter)"
                rel = path.relative_to(WIKI)
                results.append(f"{path.stem}  ({rel.parent})\n  > {snippet}")

        if not results:
            return [types.TextContent(type="text", text=f"No wiki pages found matching '{query}'")]

        output = f"Wiki search: '{query}' — {len(results)} result(s)\n\n"
        output += "\n\n".join(results[:max_results])
        if len(results) > max_results:
            output += f"\n\n... {len(results) - max_results} more results (refine query or increase max_results)"
        return [types.TextContent(type="text", text=output)]

    elif name == "wiki_list_pages":
        domain = arguments.get("domain", "").strip()
        domain_path = WIKI / domain
        if not domain_path.exists():
            valid = [d.name for d in WIKI.iterdir() if d.is_dir()]
            return [types.TextContent(type="text", text=f"Domain '{domain}' not found. Valid: {', '.join(valid)}")]

        pages = sorted(
            p.stem for p in domain_path.glob("*.md")
            if not p.stem.startswith("_")
        )
        output = f"Pages in wiki/{domain}/  ({len(pages)} total)\n\n" + "\n".join(pages)
        return [types.TextContent(type="text", text=output)]

    else:
        return [types.TextContent(type="text", text=f"Unknown tool: {name}")]

# ── Entry point ───────────────────────────────────────────────────────────────
async def main():
    async with stdio_server() as (read_stream, write_stream):
        await server.run(
            read_stream,
            write_stream,
            server.create_initialization_options(),
        )

if __name__ == "__main__":
    asyncio.run(main())

# ── Registration ──────────────────────────────────────────────────────────────
# Add to C:\Users\smatuzik\Documents\Claude\StaszekOS\.claude\settings.json:
#
# {
#   "mcpServers": {
#     "staszekos-wiki": {
#       "command": "python",
#       "args": ["C:\\Users\\smatuzik\\Documents\\Claude\\StaszekOS\\Scheduled\\wiki-mcp.py"]
#     }
#   }
# }
#
# For claude.ai Cowork: Settings -> Integrations -> MCP Servers
# Type: stdio
# Command: python "C:\Users\smatuzik\Documents\Claude\StaszekOS\Scheduled\wiki-mcp.py"
