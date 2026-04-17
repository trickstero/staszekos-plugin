# CLAUDE.md — Zoning Analysis
# Antunovich Associates | Zoning Feasibility & Entitlement Workflow

## What This Project Does
Full zoning feasibility analyses, entitlement strategies, variance arguments, and
overlay research for all Antunovich projects. Output is always a formal zoning memo
(zoning-template.md structure) followed by a design supplement when massing or code
flags are needed.

## Firm Context
- Firm: Antunovich Associates, 244 W. Huron St., Chicago
- Analysis lead: Staszek Matuzik (Senior Associate)
- Firm is NOT the land use attorney of record — we produce technical feasibility,
  not legal opinions. Recommend legal counsel for variances/PD negotiations.
- Active jurisdictions: Chicago IL, Washington DC, Atlanta GA, Boise/Ada County ID

## AGENT PROTOCOL — Always Follow This Sequence

### Step 1: Intake (always run first)
Before doing any research, run the intake checklist:
- What is the address / jurisdiction?
- What is the proposed use and program?
- Is there an existing structure? Historic overlay?
- What is the client's approval path preference (by-right vs. discretionary)?
- Is FAR/density the key constraint, or use, or setbacks?
- Multi-building site? → Check if PD FAR bundling applies (see ZONING.md §3.6)

### Step 2: Research (always web search — NEVER use memory for code language)
Follow zoning-research-guide.md Parts 1–6 in sequence:
A. Zoning district confirmation — official GIS portal
B. Live municipal code — Municode or city .gov (pull actual code text, not summaries)
C. Overlay districts — historic, TOD, pedestrian streets, flood
D. FEMA flood zone — msc.fema.gov
E. FAA airspace — if >200 ft AGL
F. Recent amendments — city council pending applications

**Rule: Every dimensional standard, use permission, and overlay provision must cite
a specific code section. Never state a standard from memory.**

### Step 3: Wiki Check (for Chicago and multi-family projects)
Read `hot.md` in this project folder before drafting any Chicago or multi-family memo.
It contains live wiki context including:
- PD FAR bundling mechanics (741 N. Wells, 609 W. Randolph precedents)
- Chicago ARO/MOPD requirements
- Chicago TSL overlay triggers
- Multi-family podium type requirements
If a topic isn't in hot.md, the full wiki is available via wiki MCP tools if connected.

### Step 4: Draft Memo
Use `zoning-template.md` — complete every section in order.
Never skip sections. Use "TBV" or "N/A — [reason]" for sections that don't apply.

### Step 5: Design Supplement (always produce after memo)
Flag: IBC occupancy type, construction type ceiling, high-rise trigger, parking,
loading, ADA path, HTC eligibility. See design-supplement structure at end of
zoning-template.md.

### Step 6: Narrative Polish
Final pass: plain English executive summary, entitlement risk rating
(🟢 Green / 🟡 Yellow / 🔴 Red), critical path item identified.

---

## Output Format — Non-Negotiable
**Always use zoning-template.md structure.** Never produce a narrative paragraph
memo without the table structure. Developers read the tables first.

Key accuracy rules:
- Every dimensional standard: cite code section
- Every use permission: cite use table row
- Every overlay: cite overlay section + trigger condition
- Every non-conformity: label with relief type (variance, special use, PD)
- Executive summary: written for a developer who reads 3 sentences only

---

## Chicago-Specific Triggers (check every Chicago project)
| Trigger | Threshold | Code Section |
|---------|-----------|-------------|
| ARO (affordable housing) | ≥10 units OR city financial assistance | §2-44-080 |
| TSL (transit-served location) | ½ mile CTA/Metra | §17-10-0200 |
| Pedestrian Street (P) | Frontage on designated P street | §17-3-0400 |
| Lakefront Protection | Within Lakefront Protection District | §17-11-0100 |
| Planned Development (PD) | >80 ft height OR >2 acres OR ≥75 DU | §17-8-0400 |
| PD FAR Bundling | Multi-building site under one PD | ZONING.md §3.6 |
| Downtown Parking | No minimum (DX/DC/DS districts) | §17-10-0200 |

## Multi-Building PD FAR Bundling (Chicago)
When a project includes existing + new buildings under one PD:
New building FAR = Total PD allowable FAR × total site area − existing building GSF
Confirmed precedents: 741 N. Wells (PD 1519, residential) and 609 W. Randolph (commercial)
Always flag this in §22 of the memo. Coordinate with land use counsel before presenting
to client — PD bundling mechanics need attorney confirmation for specific site.

---

## Reference Files in This Project
- `zoning-research-guide.md` — full research protocol, GIS portals, Municode links
- `zoning-template.md` — complete memo template (always use this)
- `hot.md` — live wiki context (auto-updated from StaszekOS wiki)
- `project-log.md` — log every analysis here with date, address, jurisdiction, outcome

---

## How to Use This Project
"Zoning analysis for 1234 N. Milwaukee Ave., Chicago. Proposed: 12-story mixed-use,
 ground floor retail, 80 residential units. Site is 18,000 SF. No existing structure."

"Is 741 N. Wells still under PD 1519? Can the FAR from the existing building be
 applied to a new building on an adjacent lot?"

"Variance analysis for [address]. Client needs a 15% rear yard reduction.
 Find BZA precedent in the same district."

"Update the jurisdiction library for Nashville, TN — we have a new project there."

<!-- SYNC:source=zoning-research|section=Chicago-Specific Triggers -->
<!-- /SYNC -->
