---
name: MCP Servers — Connected Tools
description: Active MCPs vs. needs-auth tools, connection method
type: reference
---

**Connection method:** Connected via claude.ai settings → auto-sync to Claude Code.

## Active (✅ Working)
- **Gmail** — read/draft/search emails
- **Google Calendar** — list/create/update events
- **Excalidraw** — diagram generation (used by /diagram and /flowchart)
- **Figma** — design file access
- **Wix** — site management
- **Aiwyn Tax** — tax calculation tools
- **mcp-obsidian** — Obsidian vault read/write (required for /sync-cowork)
- **Filesystem** — local file access within StaszekOS/ directory
- **Scheduled Tasks** — task scheduling and cron management
- **claude-mem** — cross-session memory search

## Needs Auth / Reconnect (⚠️)
- **Google Drive** — requires OAuth re-auth in claude.ai settings
- **Microsoft 365** — requires OAuth re-auth in claude.ai settings
- **Cloudinary** — requires API key configuration
- **Guru** — requires workspace auth

## Notes
- Obsidian Local REST API plugin must be running in Obsidian for mcp-obsidian to work
- Filesystem MCP scope: `C:\Users\smatuzik\Documents\Claude\StaszekOS\` and subdirectories
- MCP connections are per-user — must be re-authenticated on new machine
