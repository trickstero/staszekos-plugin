---
name: Coding & Scripting Conventions
description: Environment-specific constraints for Python, pip, SSL, and secrets handling
type: feedback
---

**Python pip:** Always use `--break-system-packages` flag.
```
pip install [package] --break-system-packages
```

**Why:** System Python on Windows corporate environment requires this flag to install packages.

**Python SSL workaround:** Add at top of any script that makes HTTPS calls:
```python
import ssl
ssl._create_default_https_context = ssl._create_unverified_context
```

**Why:** FortiGate SSL inspection intercepts HTTPS on the corporate network. The CA cert workaround via NODE_EXTRA_CA_CERTS works for Node.js but Python scripts may still fail without this workaround.

**Secrets:** Never go in committed files. Always in `.claude/settings.local.json` or environment variables.
- GitHub token: `settings.local.json` → `env.GITHUB_TOKEN`
- API keys: `settings.local.json` → `env.[KEY_NAME]`
- Never in CLAUDE.md, never in .env committed to git

**How to apply:** Every Python script that touches external APIs or URLs gets the SSL workaround added at the top. Every pip install command gets `--break-system-packages`. Any credential referenced in code comes from env vars, not hardcoded strings.
