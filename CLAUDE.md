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

## Wiki Knowledge Base
**Path:** `C:\Users\smatuzik\Documents\Claude\StaszekOS\claude-obsidian\wiki\`

A persistent, compounding code compliance knowledge base built from real AA permitted projects. Read it before answering any code compliance, zoning, or building systems question.

### When to use the wiki
- Any IBC occupancy, egress, or construction type question
- Any Chicago CBC (Title 14B/14M/14P/14E/14F/14N) question
- Any ADA / accessibility question
- Any fire separation, sprinkler, or NFPA question
- Any tenant build-out or change-of-occupancy question

### Read order (always follow this sequence)
1. **`wiki/hot.md`** — read first, every time. ~500 words, recent context + domain summary
2. **`wiki/index.md`** — if hot.md is not enough, scan the full index
3. **`wiki/concepts/_index.md`** — drill into the relevant concept domain
4. **`wiki/sources/_index.md`** — find the relevant project source page
5. **Specific page** — read only the page(s) that match the question

### Do NOT
- Read the entire wiki speculatively
- Read wiki pages for general coding questions unrelated to AEC / code compliance
- Skip hot.md — it is the entry point

### Current domains covered
- IBC retail mixed occupancy (M+B+S) — Orr's Jewelers, Pittsburgh PA
- Chicago A-2 restaurant tenant build-out — Gibsons Tavern, 925 W. Fulton
- UL fire separation assembly library (U408, 465, 411, 415B, G586, C60)
- ADA mezzanine accessibility exception (under 3,000 SF)
- Chicago Planned Development + change of occupancy process
- Restaurant floor assembly: LW concrete + XPS + radiant heating
- Multi-family podium construction (Type V-A over Type I-A) — Middle Ei8ht, Franklin TN
- IBC 510.2 horizontal building separation, A2L refrigerant shafts, V-A draftstopping
- Chicago historic building renovation — CBRC 2018 + CBC dual-application, Landmarks CCL review, IBC 403 high-rise (80' threshold), existing fire escape egress — Driehaus Museum, 50 E. Erie
- Chicago high-rise residential new construction — Type I-A + 403.2.1.1 sprinkler reduction, R-2/S-2 3-HR separation, TSL parking (DX-12), DU cooking suppression — DAC, 626 S. Wabash
- Chicago ARO + MOPD accessibility — 20% affordable triggers all-Type-A affordable units, Type A/B split for market-rate, FHA Amendment 7, EV charging mandate — Vista, 370 N. Morgan (PD 1578)
- Type III-B 5-story mid-rise (2018 IBC, suburban IL) — 0 HR structural, 1/2 HR partitions, fire wall area split, horizontal exit / elevator exception, NFPA 13, IAC 20% adaptable — Hines, 1200 E. Diehl, Naperville
- Religious assembly interior design (NYCBC, ID-only scope) — millwork-heavy Beit Midrash renovation, Torah Ark, delegated stair, 42" tempered glass guardrail, Larsen's FEC, NYC vs. IBC context — EJSS, 2085 Ocean Pkwy, Brooklyn
- Chicago Self-Cert permit process — eligibility, deferred submittals, A-2 0 HR corridor at <300 occ, process vs. standard plan review; institutional A-2 TI in Type I-A high-rise (family dining) — RMHC, 211 E Grand Ave
- Type II-A institutional/athletic new construction — 1 HR frame/floors, 0 HR roof (>20' AFF), A-3+B 2 HR separation (footnote h, agg. occ. ≥300), IDPH pool/spa review, design architect + EOR split — DePaul Basketball Practice Facility, 2300 N. Sheffield
- Mixed-use rental, Type I-A podium (SFRM steel) + Type III-B wood frame above, 2018 IBC (Pittsburgh PA, no ARO/MOPD/IAC), ground-floor residential in podium zone, amenity floor at L2, Pittsburgh bike parking (1/3 DU, 60% protected) — Brickworks Building A, 49 21st St
- AIA practice management (8 Best Practices) — SD/DD phase checklists + deliverable standards, graphically-complete-typical-floor principle (Approach 3), CA qualifying language + stop-work prohibition, top 5 QC risks (constant since 1973), peer review program (SD/DD/75% CDs), sheet count discipline, record retention by project state law
- Type III-B residential WRAP around Type I-A precast concrete garage (Northbrook IL) — wrap typology vs. podium, IBC 705.3 Exception 2 adjacent wall condition, 3 fire-wall sub-buildings area compliance, IAC 20% adaptable, no ARO/MOPD — Lennar/Quarterra, 1657 Shermer Rd
- Fitness club interior TI (Chicago IL, 2018 IBC) — locker room renovation, tile-over-tile (TCNA TR712-09/713), millwork pattern (towel drop + counter + lavatory), D/B structural for wall openings, no MEP engineer scope — FFC Old Town, 1235 N. LaSalle
- Chicago high-rise residential new construction (2019 CBC, West Loop) — Type I-A + 403.2.1.1 I-B reduction, IBC 403 full high-rise, DX-7 FAR 7.0, MOPD 20% Type A, unit finish + fixture specification pattern (Shaw LVT/Daltile quartz/Kohler Purist matte black/Quest thermafoil), partition assembly library (UL 465/411/415/U493) — 566 W. Van Buren, GC Lendlease
- 2021 IBC high-rise residential (Greenville SC) — Type I-A + I-B reduction, smokeproof ALL stairways (403.5.4) vs. CBC conditional, R-2/S-2 1 HR (not 3 HR), 1/2 HR corridors, 2 fire service elevators, townhouse-in-high-rise pattern (1019.3 Ex. 2), 2% Type A only (no MOPD/IAC/ARO), C4 zoning (no FAR/height/setbacks), Greenville CBD Design Review Board — Academy Tower, 301 College St.
- AA MasterFormat project manual for multi-family residential (2018 IBC, Type III-B, 5-story, Naperville IL) — ~110 sections Div 01-14; SFRM gypsum-based (Grace MK-6/Isolatek Cafco 300/Carboline 5GP); Hilti firestopping (CFS-TTS HoW basis); USG GWB schedule (GB-1B through GB-3C); TCNA tile methods (B412/B415/W244F); LVT 20 mil commercial / 8 mil residential; Caesarstone/Cambria quartz 2CM/3CM; AWI Custom millwork; Chemetal metal sheet; WiredScore — Hines 1200 E. Diehl, Naperville
- Chicago DOB code compliance matrix (2019 CBC) — Z.01-Z.24 zoning items (mandatory for every permit), B.03-B.31 building code items (suggested format for G0-03/G0-04 sheets), supplemental submissions (MOPD form, structural, stormwater); EVSE eff. 11/1/2020 (Z.17); B.07 fire resistance 21-item subsection; Chicago-only items (City Fire Alarm Box B.09.15, solar reflectance B.15.05, ARO Z.23)
- Chicago commercial office high-rise (2019 CBC, SD 2023) — B/M/S-2 occupancy, Type I-A + 403.2.1.1 I-B reduction, IBC 403 full scope, 406.2.8 parking garage 3-HR separation (governs over Table 508.4), DX-7 + 4.5 bonus FAR via Planned Development, 0 HR corridors (commercial vs. 1 HR residential), no ARO/MOPD/FHA — 644 W. Randolph (Vista 640)
- Medical office outpatient new construction (2015 IBC, suburban IL) — Group B (not I-2), Type I-B → II-A double reduction per 403.2.1.1, IBC 403 high-rise at 99'-0" but NO fire service elevator (403.6.1 threshold = 120'), shafts NOT sprinkled (2 HR CMU maintained), ORA-2 PUD zoning, Green Globes certification — MOOB, Oak Brook IL
- Chicago high-rise residential new construction (2019 CBC, South Loop) — Type 1A, DX-16 FAR 10.7 (no PD), 25 stories / 260'-10", 344 DU, Class A2/H3/C2/F occupancies, diesel generator NOT required (CBC 4(13-76-080)(b) threshold = 400 FT), BA resilient-channel partition (STC 55/1 HR), Z40 3 HR fully grouted CMU at garage separation, Cosentini MEP — LMC 410 S Wabash
