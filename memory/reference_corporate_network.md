---
name: Corporate Network & SSL Configuration
description: FortiGate SSL inspection setup, CA cert path, Node env var, IT contact
type: reference
---

**SSL inspection device:** FortiGate FG100FTK22020870
**CA cert path:** `C:\Users\smatuzik\Documents\Claude\antunovich-ca.pem`
**Node env var:** `NODE_EXTRA_CA_CERTS` — set permanently in User environment variables

**To verify:**
```powershell
[System.Environment]::GetEnvironmentVariable("NODE_EXTRA_CA_CERTS", "User")
```

**To set (if missing):**
```powershell
[System.Environment]::SetEnvironmentVariable("NODE_EXTRA_CA_CERTS", "C:\Users\smatuzik\Documents\Claude\antunovich-ca.pem", "User")
```

**IT contact:** Michael Thompson, Applied Tech
**Status:** Domains approved for whitelist. SSL inspection mode change pending as of 2026-04-15.

**Blocked from bash:** `api.github.com` DNS-blocked. GitHub CLI fails silently. Use `git push origin` instead.

**Power Automate:** HTTP connectors may be affected by SSL inspection — flag for IT whitelist before implementing any Power Automate HTTP actions.

**Python:** SSL workaround required in scripts: `ssl._create_default_https_context = ssl._create_unverified_context`
