# CLAUDE.md — RFI Drafting
# Antunovich Associates | Construction Administration Workflow
# Place this file in: C:\Users\smatuzik\Documents\Claude\Projects\RFI drafting\

## What This Project Does
Drafts, logs, and tracks Requests for Information (RFIs) for all Antunovich
projects in construction administration. Every RFI is saved and numbered.
Patterns in RFIs reveal drawing/spec coordination issues — this project
tracks those patterns so future CDs have fewer problems.

## Firm Context
- Firm: Antunovich Associates, 244 W. Huron St., Chicago
- CA lead: Staszek Matuzik (Senior Associate)
- Active CA projects: [add current projects]
- Tools: Procore (primary RFI tracking), email MCP for distribution

## RFI Format — Always Use This
```
RFI No.:    [PROJECT CODE]-[NUMBER]        Date: [TODAY]
Project:    [FULL PROJECT NAME]            Contract No.: [NUMBER]
To:         [GC NAME], Attn: [PM NAME]
From:       Antunovich Associates, Attn: Staszek Matuzik
Subject:    [CLEAR, SPECIFIC TITLE — one issue only]

Drawing Reference:   [A/S/M/E/P-XXX, Sheet Title]
Specification:       Section [XX XX XX], [Section Title]

QUESTION:
[Single, specific, answerable question. One issue per RFI.
 Never ask two questions in one RFI.
 State what the drawings/specs say, what the field condition is,
 and what clarification is needed.]

PROPOSED SOLUTION (if applicable):
[Architect's recommendation — optional but speeds up response]

ATTACHMENTS:
[List drawings, photos, shop drawings referenced]

RESPONSE REQUESTED BY: [5 business days from today's date]
```

## RFI Writing Rules
- One issue per RFI — never combine two questions
- Always cite drawing number AND spec section if both apply
- State the conflict clearly: "Drawing A-301 shows X, but field condition is Y"
- Proposed solution speeds up GC response — include when obvious
- 5 business days is standard response window; adjust for critical path items
- Mark URGENT on subject line if on critical path

## Active Projects RFI Registry
### Hotel Burnham
- RFI prefix: HB-RFI
- GC: [add name]
- GC PM: [add name]
- Current RFI count: see logs/rfi-log.md
- Recurring issues: see docs/burnham-patterns.md

### The Robey
- RFI prefix: ROB-RFI
- GC: [add name]
- Current RFI count: see logs/rfi-log.md

### Kingswood (Idaho — private practice)
- RFI prefix: KW-RFI
- Client: Todd
- Current RFI count: see logs/rfi-log.md

### [Add new projects here as they enter CA]

## SHPO Flag Protocol
Any RFI affecting these items on historic projects must be flagged for
SHPO review before the response is issued:
- Original historic fabric (masonry, ironwork, wood, stone)
- Character-defining features (per project SHPO narrative)
- Items covered by the approved Treatment Narrative
Flag format: Add "⚠️ SHPO REVIEW REQUIRED" to the RFI before sending.

## Code Compliance Trigger — Check Wiki Before Drafting
If the RFI involves any of the following, consult `hot.md` in this project folder
before drafting. The wiki contains real AA permitted project fire ratings, UL
assembly numbers, and Chicago CBC-specific requirements:
- Fire-rated assemblies (walls, floors, ceilings)
- Fire barriers, fire partitions, smoke barriers
- Egress width, travel distance, exit enclosure ratings
- UL assembly substitution (GC proposing alternate UL number)
- ADA/accessibility non-compliance
- Construction type or occupancy conflict
- Sprinkler head locations or NFPA 13 spacing
- Chicago CBC-specific item (anything where Chicago code differs from IBC)

**If the RFI is about a rated assembly:** State the required UL assembly number
from the drawings/specs, state what the GC is proposing, and confirm whether the
proposed assembly meets the same fire rating and hourly requirements. Do not accept
"equivalent" substitutions without verifying UL listing.

---

## RFI Pattern Tracking (most valuable long-term feature)
After every 10 RFIs on a project, tell Claude:
"Analyze the last 10 RFIs on [project]. What drawing/spec coordination
issues are they revealing? Add patterns to docs/[project]-patterns.md."

This turns CA pain into better CDs on future projects.

## Saved Templates (grows over time)
- templates/common-rfis.md — RFIs that recur on every project (reuse verbatim)
- logs/rfi-log.md — complete numbered log across all projects
- docs/[project]-patterns.md — coordination issues per project

## How to Use This Project
"Draft an RFI for Hotel Burnham. Drawing A-301, door frame at lobby entry.
 GC says the rough opening is 2 inches short. Hardware is bronze per spec
 08 71 00. What should the GC do?"

"Log this RFI to the Hotel Burnham registry and increment the counter."

"The GC responded to HB-RFI-012. Log the response and close it out."

"What are the 5 most common RFI types on multi-family projects?"

"Analyze the last 15 Robey RFIs — what coordination issues keep appearing?"
