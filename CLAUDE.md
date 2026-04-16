# StaszekOS — Claude Code Workspace

## Who You're Working With
**Staszek Matuzik** — Senior Associate at Antunovich Associates (244 W. Huron St., Chicago).
Firm AI lead across all nine practice areas.
Not a licensed architect. Direct communicator. Bottom-line first.

## Firm Context
**Antunovich Associates** — ~80 staff, Chicago + DC.
Practice areas: luxury retail, multi-family, student housing (HUB/ŌLIV series), historic preservation, hospitality, civic/education.
Project management: Procore + Deltek. File management: SharePoint. Automation: Power Automate.

## This Workspace Structure
```
StaszekOS/
├── CLAUDE.md                  ← this file
├── Projects/                  ← active project folders
│   ├── antunovich-ai/         ← firm AI tooling (GitHub: trickstero/antunovich-ai)
│   └── staszekos-plugin/      ← this plugin (transferable setup)
├── Cowork/                    ← Obsidian Cowork vault projects
│   ├── _global-context.md
│   ├── Zoning-Analysis/
│   ├── Code-Research/
│   ├── SHPO-Narrative/
│   ├── SPEC-Writing/
│   └── RFI-Drafting/
├── Scheduled/                 ← scheduled tasks and automation scripts
└── .claude/
    ├── commands/              ← slash commands
    ├── hooks/                 ← session/commit hooks
    └── settings.local.json    ← secrets (never commit)
```

## Active Projects

### Antunovich AI (firm tooling)
GitHub: trickstero/antunovich-ai | Live: https://trickstero.github.io/antunovich-ai
Slash commands: /rfi /spec /shpo /render /review /bootstrap
MCP: Filesystem, Gmail, Google Calendar, Google Drive, Microsoft 365

### Zoning Analysis (Cowork project)
Code research + zoning feasibility across all 50 states + DC.
Workflow: intake → GIS/Municode research → memo (zoning-template.md) → design-supplement.md
Web search every analysis — never rely on memory for code language.

### Code Research (Cowork project)
Building code compliance: IBC occupancy/construction type, ADA, NFPA 13/72, jurisdiction-specific overlays.
Feeds directly into zoning memos and permit packages.

## Slash Commands Available
| Command | Purpose |
|---------|---------|
| /rfi | Draft RFI document (Procore-ready) |
| /spec | Write MasterFormat spec section |
| /shpo | SHPO historic preservation narrative |
| /render | Todd Formula Krea.ai prompt (exterior) |
| /render-interior | Interior enhancement prompt (Magnific) |
| /review | Review document or code |
| /bootstrap | Scaffold new project module |
| /grill-me | Requirements interrogation before any analysis |
| /zoning-research | Full GIS→Municode→memo zoning analysis |
| /code-lookup | Systematic IBC/ADA/NFPA research |
| /edit-narrative | 4-pass editorial review for reports/narratives |
| /scqa | SHPO/RFP narrative structure (Situation→Answer) |
| /ubiquitous-language | Project terminology glossary |
| /diagram | Excalidraw diagram generation |
| /flowchart | IBC/entitlement decision trees |
| /workflow-builder | Power Automate/Procore/SharePoint flow design |
| /auto-commit | Conventional commit for antunovich-ai repo |
| /sync-cowork | Bridge Obsidian Cowork vault with Claude Code |
| /setup | New machine bootstrap and environment setup |

## Cowork → Skills Mapping

When a Cowork project is mentioned or `/sync-cowork` is run, ALWAYS present the skill stack below and ask permission before deploying each skill. Do not proceed with analysis until the user confirms.

| Cowork Project | Trigger Keywords | Skill Stack (in order) |
|----------------|-----------------|------------------------|
| Zoning Analysis | zoning, setback, FAR, rezoning, overlay, parcel, entitlement | `/grill-me` → `/zoning-research` → `/edit-narrative` |
| Code Research | IBC, occupancy, construction type, egress, sprinkler, ADA, NFPA | `/grill-me` → `/code-lookup` → `/edit-narrative` |
| SHPO Narrative | SHPO, historic, preservation, landmark, treatment, Secretary of Interior | `/scqa` → `/shpo` → `/edit-narrative` |
| SPEC Writing | spec, MasterFormat, division, section, CSI, product, submittal | `/grill-me` → `/spec` → `/edit-narrative` |
| RFI Drafting | RFI, request for information, contractor, field condition, conflict | `/grill-me` → `/rfi` |

**Supporting skills** (offer after primary stack, for any project):
- `/ubiquitous-language` — when new project or unfamiliar contractor terminology
- `/diagram` or `/flowchart` — when code compliance or process visualization is needed
- `/workflow-builder` — when automation of a Procore/SharePoint process is discussed

**Deployment prompt to use:**
> "This looks like a [Project Name] task. Recommended skill stack: `[skills]`. Deploy `/[first-skill]` now?"
> Wait for user confirmation before running each skill.

## Visualization Pipeline Rules
**Krea NB2 (Nano Banana 2 / Gemini):**
- Always open with: "Real photograph NOT a render NOT CGI" + Canon EOS R5 specs
- Prompts under 2,000 characters
- Thinking mode OFF by default (ON only for complex infographics)
- Batch API (50% discount) → generate 512px → upscale best to 1K/2K/4K

**Todd Formula** = photorealistic, camera-language prompts, exterior architecture
**JJ Style** = watercolor + ink linework, delicate tree canopies, warm purple-mauve shadows

## GitHub Config
- Username: trickstero
- Token type: classic (ghp_...) — stored in settings.local.json
- Default repo: antunovich-ai
- Note: api.github.com DNS-blocked from bash — git push to github.com works fine
- Pages: enable manually via repo Settings → Pages → main → Save

## Corporate Network
- SSL inspection: FortiGate (FG100FTK22020870) — CA cert at C:\Users\smatuzik\Documents\Claude\antunovich-ca.pem
- NODE_EXTRA_CA_CERTS set permanently in User env vars
- IT whitelist ticket: domains approved, SSL inspection mode change pending (Michael Thompson, Applied Tech)

## MCP Servers
Connected via claude.ai (auto-sync to Claude Code):
- ✅ Gmail, Google Calendar, Excalidraw, Figma, Wix, Aiwyn Tax
- ⚠ Google Drive, Microsoft 365, Cloudinary, Guru (need auth in claude.ai settings)

## Key Rules
1. Respond bottom-line first — no preamble
2. Use professional architectural terminology
3. Never assume terminal familiarity — write out every command explicitly
4. Secrets never go in committed files — always settings.local.json
5. For PowerShell: write every click, every paste, every command
6. Python scripts: always use `--break-system-packages` for pip, SSL workaround via `ssl._create_default_https_context = ssl._create_unverified_context`

## Related Cowork Projects (claude.ai)
- SHPO Narrative — historic preservation narratives
- SPEC Writing — MasterFormat specification sections
- RFI Drafting — request for information documents
- Zoning Analysis — code research + zoning feasibility (all 50 states + DC)
- Code Research — building code, IBC, jurisdiction-specific overlays

## Zoning & Code Research Context
Web search every analysis — never use memory for code language.
Research sequence: zoning GIS map → Municode/official code → overlays → FEMA flood → variance precedent → IBC check.

**Jurisdiction triggers to remember:**
- Chicago: ARO (10+ units), TSL (transit-served locations), Pedestrian Streets, Lakefront Overlay
- Illinois non-Chicago: IDOT access permit if state route frontage, IHPA for SHPO
- Idaho (Kingswood/Brekenwood): ACHD access (Ada County), ITD (state highway), subdivision plat sequence
- DC: DCSHPO + HPRB, Green Area Ratio, Inclusionary Zoning
- National: IBC occupancy/construction type matrix, ADA, NFPA 13/72

Output format: always zoning-template.md structure — tables for dimensional standards, code citation on every standard, every non-conformity labeled with relief type. Design-supplement.md after memo: massing calc, entitlement risk matrix, IBC flags, HTC flag if historic overlay.

## Obsidian Vault
- [[_global-context]] — persistent firm profile, Cowork project memory hub
