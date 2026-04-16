---
name: Zoning & Code Research Workflow
description: Research sequence, jurisdiction triggers (Chicago/IL/Idaho/DC), output format rules
type: reference
---

**Core rule:** Web search every analysis. Never use memory for code language, setback tables, or overlay boundaries.

## Research Sequence (Zoning)
1. Zoning GIS map (confirm district + dimensions)
2. Municode / official code (dimensional standards, permitted uses)
3. Overlay districts (ARO, TSL, historic, flood, lakefront)
4. FEMA flood map
5. Variance precedent search (BZA decisions)
6. IBC cross-check (flag only — full analysis via /code-lookup)

## Jurisdiction Triggers

**Chicago:**
- ARO (Affordable Requirements Ordinance) — triggered at 10+ dwelling units
- TSL (Transit-Served Locations) — reduced parking minimums
- Pedestrian Streets (P-streets) — ground-floor use restrictions
- Lakefront Protection Overlay
- Landmark districts → SHPO/IHPA involvement

**Illinois non-Chicago:**
- IDOT access permit required if state route frontage
- IHPA review for SHPO involvement

**Idaho (Kingswood/Brekenwood projects):**
- ACHD (Ada County Highway District) access management
- ITD (Idaho Transportation Dept) if state highway frontage
- Subdivision plat sequence before building permits

**DC:**
- DCSHPO + HPRB dual review for historic buildings
- Green Area Ratio requirements
- IZ (Inclusionary Zoning)

## Output Format
- Always use zoning-template.md structure
- Tables for dimensional standards with code citation on every standard
- Every non-conformity labeled with relief type (adjustment/variation/rezoning/SUP)
- Follow with design-supplement.md: massing calc, entitlement risk matrix, IBC flags, HTC flag if historic overlay
