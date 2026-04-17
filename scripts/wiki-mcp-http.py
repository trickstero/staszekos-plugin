#!/usr/bin/env python
"""
StaszekOS Wiki MCP Server — HTTP/SSE transport

Exposes the wiki over HTTP so claude.ai Cowork can connect to it.
Run this script, then tunnel it with ngrok:

  python wiki-mcp-http.py          # starts on http://localhost:8765
  ngrok http 8765                  # prints a public URL like https://xxxx.ngrok-free.app

In claude.ai: Settings -> Integrations -> Add custom connector
  URL: https://xxxx.ngrok-free.app/sse

Tools exposed (same as stdio version):
  wiki_hot        — always read first: recent context
  wiki_index      — full domain map
  wiki_sources    — ingested project pages
  wiki_concepts   — extracted knowledge patterns
  wiki_read(page) — specific page by name
  wiki_search(q)  — full-text search
  wiki_list_pages(domain) — list pages in a domain folder
"""

import ssl
ssl._create_default_https_context = ssl._create_unverified_context

import asyncio
from pathlib import Path

import mcp.types as types
from mcp.server import Server
from mcp.server.sse import SseServerTransport
from starlette.applications import Starlette
from starlette.routing import Mount, Route
import uvicorn

# ── Wiki root ─────────────────────────────────────────────────────────────────
WIKI = Path(r"C:\Users\smatuzik\Documents\Claude\StaszekOS\claude-obsidian\wiki")
PORT = 8765

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
                "Use after wiki_hot or wiki_index to pull the full page content."
            ),
            inputSchema={
                "type": "object",
                "properties": {
                    "page": {
                        "type": "string",
                        "description": "Page name without .md extension",
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
                        "description": "Search term (e.g. 'IBC 403.2.1.1', 'Type I-A', 'U452')",
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
            return [types.TextContent(type="text", text="hot.md not found")]
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

        matches = list(WIKI.rglob(f"{page}.md"))
        if not matches:
            matches = [p for p in WIKI.rglob("*.md") if page.lower() in p.stem.lower()]

        if not matches:
            all_pages = sorted(p.stem for p in WIKI.rglob("*.md"))
            hints = [s for s in all_pages if any(w in s for w in page.split("-"))][:8]
            hint_text = "\nDid you mean:\n" + "\n".join(f"  {h}" for h in hints) if hints else ""
            return [types.TextContent(type="text", text=f"Page '{page}' not found.{hint_text}")]

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
                matching_lines = [
                    l.strip() for l in text.split("\n")
                    if query in l.lower() and l.strip()
                ]
                snippet = matching_lines[0][:120] if matching_lines else "(in frontmatter)"
                rel = path.relative_to(WIKI)
                results.append(f"{path.stem}  ({rel.parent})\n  > {snippet}")

        if not results:
            return [types.TextContent(type="text", text=f"No wiki pages found matching '{query}'")]

        output = f"Wiki search: '{query}' - {len(results)} result(s)\n\n"
        output += "\n\n".join(results[:max_results])
        if len(results) > max_results:
            output += f"\n\n... {len(results) - max_results} more results"
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

# ── HTTP/SSE app ──────────────────────────────────────────────────────────────
sse = SseServerTransport("/messages/")

async def handle_sse(request):
    async with sse.connect_sse(
        request.scope, request.receive, request._send
    ) as streams:
        await server.run(
            streams[0], streams[1],
            server.create_initialization_options()
        )

app = Starlette(
    routes=[
        Route("/sse", endpoint=handle_sse),
        Mount("/messages/", app=sse.handle_post_message),
    ]
)

if __name__ == "__main__":
    print(f"StaszekOS Wiki MCP server starting on http://localhost:{PORT}")
    print(f"SSE endpoint: http://localhost:{PORT}/sse")
    print(f"Now run: ngrok http {PORT}")
    print(f"Then paste the ngrok URL + /sse into claude.ai")
    uvicorn.run(app, host="0.0.0.0", port=PORT)
