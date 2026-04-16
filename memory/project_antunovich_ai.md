---
name: Antunovich AI — Active GitHub Project
description: trickstero/antunovich-ai repo details, network constraints, deployment notes
type: project
---

**Repo:** `trickstero/antunovich-ai`
**Live:** https://trickstero.github.io/antunovich-ai
**GitHub username:** trickstero
**Token type:** Classic (ghp_...) stored in `.claude/settings.local.json`

**Why:** Firm AI tooling hub — slash commands (/rfi, /spec, /shpo, /render, /review, /bootstrap) live here. GitHub Pages hosts the public-facing tool.

**Critical network constraint:** `api.github.com` is DNS-blocked on the corporate network.
- ✅ `git push origin` — works (git protocol, not api.github.com)
- ❌ GitHub CLI (`gh`) — fails silently on corporate network
- ❌ GitHub API calls from bash — blocked

**GitHub Pages:** Enable manually via repo Settings → Pages → Branch: main → Save. Cannot be configured via API from corporate network.

**How to apply:** Never use `gh` CLI for push operations. Use `git push origin [branch]`. Flag any automation that relies on GitHub API — it will fail on the corporate network.
