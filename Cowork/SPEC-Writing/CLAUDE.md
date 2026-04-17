# CLAUDE.md — SPEC Writing
# Antunovich Associates | MasterFormat Specification Workflow
# Place this file in: C:\Users\smatuzik\Documents\Claude\Projects\SPEC writing\

## What This Project Does
Writes, edits, and archives CSI MasterFormat specification sections for
all Antunovich project types. Approved sections are saved and reused.
Product data sheets dropped into references/ are auto-parsed into spec language.

## Firm Context
- Firm: Antunovich Associates, 244 W. Huron St., Chicago
- Spec lead: Staszek Matuzik (Senior Associate)
- Project types: mixed-use retail, multi-family, student housing (HUB/ŌLIV),
  luxury retail (Armani, Prada, Brunello Cucinelli), historic preservation,
  interior design/FF&E, hospitality, workplace, civic/education

## MasterFormat Structure — Always Use This
```
SECTION XX XX XX — [TITLE IN ALL CAPS]

PART 1 — GENERAL
  1.01 RELATED DOCUMENTS
  1.02 SUMMARY
  1.03 SUBMITTALS
  1.04 QUALITY ASSURANCE
  1.05 DELIVERY, STORAGE, AND HANDLING
  1.06 WARRANTY

PART 2 — PRODUCTS
  2.01 MANUFACTURERS
  2.02 MATERIALS
  2.03 FABRICATION / MIXES

PART 3 — EXECUTION
  3.01 EXAMINATION
  3.02 PREPARATION
  3.03 INSTALLATION
  3.04 FIELD QUALITY CONTROL
  3.05 CLEANING AND PROTECTION
```

## Project Type Rules

### Luxury Retail (Armani, Prada, Brunello Cucinelli)
- Brand-approved materials list required — never substitute without written brand approval
- Custom millwork: always require shop drawing submittal + mockup
- Bookmatched stone/onyx: quarry certification + full-size mockup required
- Lighting: manufacturer rep visit required for commissioning
- FF&E: coordinate with brand's dedicated FF&E consultant

### Historic Preservation (Hotel Burnham, The Robey, Uline Arena)
- Match-existing requirements for all materials visible in historic zones
- Mortar analysis required before repointing specs are written
- Custom color matching: reference existing material, require 3 samples before approval
- Always cross-reference SHPO Treatment Narrative for compliance language

### Student Housing (HUB / ŌLIV series)
- Durability emphasis: commercial-grade finishes in all common areas
- Anti-graffiti coating on all exterior masonry
- Resilient flooring: minimum 20-mil wear layer in corridors

### Mixed-Use Retail
- Storefront systems: thermal performance requirements per project energy model
- Tenant coordination: note where tenant finish specs override base building

## Active Spec Library (sections already written — reuse first)
- See sections/ directory for all completed and approved sections
- Format: [division]-[section]-[project]-[version].md
- Always check here before writing from scratch

## Product Data Sheet Protocol
When a product data sheet is dropped into references/:
1. Parse manufacturer, product name, model number
2. Extract: materials, finishes, compliance standards (ASTM, ADA, etc.)
3. Auto-populate PART 2 — PRODUCTS
4. Flag any missing information (fire rating, slip resistance, etc.)

## Submittal Requirements (always include)
- Shop drawings: [2 weeks before fabrication]
- Product data: [at time of submittal]
- Samples: [minimum 2, unless noted]
- Maintenance data: [at project closeout]

## Common Standards to Reference
- ASTM E84 — surface burning characteristics
- ASTM C150 — portland cement
- ADA/IBC — accessibility and code compliance
- LEED credits — note applicable credits per section
- NFPA 101 — life safety (egress hardware)

## Saved Spec Sections (grows over time)
- sections/ — every approved section, by project and version
- templates/standard-warranty-language.md — pre-approved warranty clauses
- templates/submittal-language.md — standard submittal requirements
- logs/spec-log.md — what was written, for which project, approval status

## Fire Rating & UL Assembly Protocol
Before specifying any fire-rated assembly, check `hot.md` in this folder.
The wiki contains the AA UL assembly library extracted from real permitted projects.

**AA rated assembly library (use as basis of design):**
| Type | Description | UL Assembly | STC |
|------|-------------|-------------|-----|
| A | Full-height to structure, 1 HR | U408 | 50 |
| BA | Full-height to structure, 2 HR | U465 | 54 |
| C | Demising, 1 HR | U411 | 52 |
| G | Corridor, 1 HR smoke | U415B | 48 |
| K | Shaft enclosure, 2 HR | G586 | — |
| Z30 | Party wall, 2 HR | C60 | 58 |
| Z40 | Party wall, 3 HR | custom | 62 |

When specifying rated gypsum assemblies:
- Always cite the UL assembly number in PART 2 — PRODUCTS
- Include UL Directory URL: https://iq.ul.com/
- Require contractor to verify current listing before fabrication
- Flag if project uses proprietary system that deviates from standard UL assembly

**Chicago garage separation override:**
Per CBC 13-56-280, R-2/S-2 assemblies require minimum 3 HR (not 2 HR per IBC 406.2.8).
Spec the 3 HR assembly for all Chicago multi-family garage separation walls. Do not
spec the IBC default — it is a code violation in Chicago.

---

## How to Use This Project
"Write spec section 09 30 00 ceramic tile for Hotel Burnham lobby.
 Match existing Rookery-era marble pattern. Basis of design: [product]."

"I have a product data sheet for [product]. Write PART 2 from it."
[then drop the PDF or paste the text]

"The GC wants to substitute [product A] for [product B] in Section 08 71 00.
 Is it an acceptable substitution?"

"Update the Section 09 29 00 gypsum board template — add STC requirements
 for the multi-family party wall condition."

"What spec sections have we written for student housing projects?"
