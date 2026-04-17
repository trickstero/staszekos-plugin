# CLAUDE.md — Building Code Analysis Knowledge Base

## WIKI KNOWLEDGE BASE — READ THIS FIRST
This project has a live wiki built from real AA permitted projects. Before answering
any code compliance question, read `hot.md` in this project folder. It contains:
- Last ingested projects + active knowledge threads (~500 words, always current)
- Chicago CBC-specific provisions extracted from permitted AA work
- UL assembly library (real assemblies from AA CDs — not generic references)
- PD FAR bundling mechanics with confirmed Chicago precedents

**Read sequence for any code question:**
1. `hot.md` — always first (live wiki context)
2. If hot.md doesn't resolve it → use wiki MCP tools if available:
   - `wiki_hot` → `wiki_search("[keyword]")` → `wiki_read("[page-name]")`
3. If wiki MCP not available → web search the specific code section
4. Never answer a code question from memory alone — always verify citations live

**When wiki search beats memory:**
- Any Chicago CBC section (Title 14B/14M/14P/14E/14F/14N)
- Any UL assembly number
- Any multi-family podium rule (IBC §510.2)
- Any high-rise mandatory system threshold
- Any ADA mezzanine exception applicability
*Antunovich Associates | Code Research Project*
*Last updated: 2026-04-14*

---

## 1. CODE HIERARCHY & JURISDICTION MAP

```
FEDERAL / ADA
    └── State Building Code (or IBC adoption by state)
            └── Local AHJ Amendments
                    └── Project-Specific Variances / Approvals
```

### IBC Adoption Status — Key Jurisdictions
| Jurisdiction | Adopted Edition | Notable Deviations |
|---|---|---|
| **Chicago** | CBC 2019 (≈ IBC 2015 base) | Title 14B — extensive local amendments; does NOT adopt IBC directly |
| **Illinois (state)** | IBC 2018 (for state-owned) | Chicago overrides for city projects |
| **Pittsburgh / PA** | IBC 2018 (PA UCC) | PA Uniform Construction Code, statewide |
| **Idaho** | IBC 2021 | Minimal state amendments; AHJ varies by county/city |
| **Suburban Chicago** | Varies — IBC 2021 most common | Always verify per municipality |

> **Chicago Critical Note:** Chicago does not adopt the IBC by reference. The Chicago Building Code (Title 14B) is a standalone code. Section numbers do NOT map 1:1 to IBC. Always cross-reference both when working in Chicago.

---

## 2. IBC CHAPTER QUICK-REFERENCE

### Most Referenced Chapters for Antunovich Practice Areas

| Chapter | Topic | Key Sections |
|---|---|---|
| **3** | Occupancy Classification | 303 (A), 304 (B), 308 (I), 309 (M), 310 (R) |
| **4** | Special Detailed Requirements | 420 (sleeping units), 424 (children's play) |
| **5** | General Building Heights & Areas | 503–509 (area mods, sprinkler increases) |
| **6** | Types of Construction | Table 601 (fire ratings by type) |
| **7** | Fire & Smoke Protection | 703–711 (assemblies, openings, joints) |
| **8** | Interior Finishes | 803–805 (flame spread, smoke index) |
| **9** | Fire Protection Systems | 903 (sprinklers), 907 (fire alarm) |
| **10** | Means of Egress | 1001–1030 (occupant load, exits, widths, travel distance) |
| **11** | Accessibility | 1101–1110 (scoping), defer to ICC A117.1 for tech |
| **27** | Electrical | Defer to NFPA 70 / NEC |
| **34** | Existing Buildings | 3401–3412 (change of occupancy, alterations, IEBC path) |

---

## 3. OCCUPANCY CLASSIFICATION CHEAT SHEET

| Use | IBC Classification | Chicago Code Equiv. | Notes |
|---|---|---|---|
| Jewelry store, retail | M | 14B-3-304 | <30 occ = B possible |
| Restaurant / bar | A-2 | 14B-3-302 | Sprinkler at 100 occ if no suppression |
| Student housing | R-2 | 14B-3-308 | High-rise triggers at 55' |
| Hotel | R-1 | 14B-3-308 | Accessibility: all guestrooms |
| Multi-family (market rate) | R-2 | 14B-3-308 | |
| Office (base building) | B | 14B-3-303 | |
| Fitness / gym (amenity) | A-3 | 14B-3-302 | Verify occupant load factor |
| Theater / screening room | A-1 | 14B-3-302 | Fixed seating triggers |
| School / university | E | 14B-3-305 | Occupant load: 20 sf/person classroom |
| Museum / gallery | A-3 | 14B-3-302 | |
| Parking garage (enclosed) | S-2 | 14B-3-311 | Open vs. enclosed critical |

---

## 4. EGRESS FUNDAMENTALS

### Occupant Load Factors (IBC Table 1004.5)
| Space Type | SF per Occupant |
|---|---|
| Assembly — standing | 5 |
| Assembly — chairs/tables | 15 |
| Assembly — concentrated seating | 7 |
| Business (office) | 150 |
| Mercantile (retail ground) | 60 |
| Mercantile (other levels) | 60 |
| Residential | 200 |
| Fitness center | 50 |
| Locker room | 50 |

### Exit Width (IBC 1005.1)
- Stairways: **0.3 in/occupant**
- Other egress: **0.2 in/occupant**
- Minimum corridor: **44 in** (28 in if <50 occupants)

### Travel Distance Limits (IBC Table 1017.2)
| Occupancy | Non-Sprinklered | Sprinklered |
|---|---|---|
| A, B, E, F-1, M, R, S-1 | 200 ft | 250 ft |
| H-1 | 75 ft | 75 ft |
| I-1, I-3, I-4 | 150 ft | 200 ft |
| F-2, S-2, U | 300 ft | 400 ft |

### Chicago-Specific Egress Notes
- Chicago requires **two exits** from any floor with >30 occupants
- Corridor width minimum: **44 in** (CBC 14B-10-1005)
- Exit stair enclosures: 2-hour in high-rise, 1-hour otherwise

---

## 5. HIGH-RISE PROVISIONS

**IBC Definition:** Building with occupied floor >75 ft above lowest fire vehicle access level
**Chicago Definition:** Building >80 ft (CBC 14B-9-902.1) — *more restrictive*

High-rise triggers (both IBC and CBC):
- Full NFPA 13 sprinkler system throughout
- Class I standpipe in every stair
- Fire command center
- Emergency voice/alarm communication system
- Smoke control (pressurization or exhaust)
- Elevator lobby pressurization

---

## 6. SPRINKLER THRESHOLDS

| Condition | IBC Requirement |
|---|---|
| A occupancy >12,000 sf | NFPA 13 required |
| A-2 >100 occupants (no suppression) | Required |
| R occupancy (new construction) | NFPA 13R (1–4 stories) or 13 |
| M occupancy >12,000 sf | Required |
| High-rise (any occ.) | NFPA 13 throughout |
| Basement >2,500 sf | Required |

**Chicago Note:** CBC mandates sprinklers in virtually all new construction and major alterations regardless of occupancy threshold.

---

## 7. CONSTRUCTION TYPE MATRIX (IBC Table 601 Summary)

| Type | Rating | Typical Application |
|---|---|---|
| I-A | 3-hr structure | High-rise, unlimited area |
| I-B | 2-hr structure | High-rise, large area |
| II-A | 1-hr structure | Mid-rise, sprinklered |
| II-B | 0-hr structure (non-comb.) | Low-rise, large footprint |
| III-A | 1-hr (masonry exterior) | Urban mid-rise, existing |
| III-B | 0-hr (masonry exterior) | Older urban fabric, existing |
| V-A | 1-hr (wood frame) | Residential subdivisions (Idaho projects) |
| V-B | 0-hr (wood frame) | Small, 1–2 story |

---

## 8. MIXED OCCUPANCY

### Separated vs. Non-Separated (IBC 508)
- **Non-Separated (508.3):** Entire building designed to most restrictive occupancy. Simplest approach for small mixed-use.
- **Separated (508.4):** Fire barriers between occupancies per Table 508.4. Allows each occupancy to be designed independently.

### Common Antunovich Mixed-Use Scenarios
- **Ground-floor retail (M) + residential above (R-2):** Separated — 2-hr barrier, sprinklered typically eliminates to 1-hr
- **Amenity level (A-3) within R-2 building:** Non-separated often preferred for student housing
- **Restaurant (A-2) within hotel (R-1):** Separated — 1-hr barrier with sprinkler

---

## 9. ACCESSIBILITY (ADA + ICC A117.1)

### Scoping — New Construction (IBC 1103 / ADA Standards)
- All areas open to public: fully accessible
- **Accessible route** required from site arrival to all accessible spaces
- **Parking:** 1:25 spaces accessible (van-accessible: 1 per 6 accessible)
- **Restrooms:** At least one accessible per floor (both genders if both provided)
- **Hotel guestrooms:** 2% accessible (min. 1), 1% with roll-in shower

### Path of Travel (Alterations)
- Alterations trigger accessible path of travel to altered area
- Disproportionate cost threshold: **20% of construction cost** of primary work
- Chicago: same standard, enforced by BACP and DOB

### Chicago-Specific
- Chicago enforces ADA + Illinois Accessibility Code (IAC) — IAC occasionally more restrictive
- Chicago DOB plan review checks both ADA and IAC compliance

---

## 10. HISTORIC PRESERVATION CODE PATH

### IBC Chapter 34 / IEBC
Three compliance paths for existing buildings:
1. **Prescriptive (IEBC Ch. 4–11):** Follow specific alteration rules by level
2. **Work Area Method (IEBC Ch. 4–11):** Based on % of building affected
3. **Performance (IEBC Ch. 14):** Engineering analysis, more flexibility

### Levels of Alteration (IEBC)
- **Level 1:** Minimal work, no change of occupancy, existing conditions may remain
- **Level 2:** >25% of building area
- **Level 3:** >50% of building area → triggers full upgrade path

### Chicago Landmarks
- Chicago Landmarks Commission review required for any exterior alteration
- Landmarks Preservation Ordinance (LPO) applies in addition to CBC
- SHPO (Illinois SHPO) involved when federal tax credits or federal funding present
- Section 106 review triggered by federal nexus (HUD, FTA, etc.)

---

## 11. CHICAGO BUILDING CODE — KEY DEPARTURES FROM IBC

| Topic | IBC | Chicago (CBC 2019) |
|---|---|---|
| High-rise threshold | 75 ft | 80 ft |
| Sprinkler mandate | Threshold-based | Near-universal for new construction |
| Egress stairs | 1 required stair in small bldgs | 2 exits from most floors |
| Corridor fire rating | 0-hr in sprinklered (some occ.) | Often 1-hr regardless |
| Energy code | IECC | Chicago Energy Conservation Code (CECC) |
| Zoning | IBC defers to local | Chicago Zoning Ordinance (Title 17) — separate review track |
| Mechanical | IMC | Chicago Mechanical Code (CMC) |
| Plumbing | IPC | Chicago Plumbing Code |

> **Zoning vs. Building Code:** Always clarify whether the question is a **zoning** issue (FAR, use, setback, parking) or a **building code** issue (life safety, construction type, egress). Different departments, different review tracks.

---

## 12. COMMON ANALYSIS REQUEST TYPES

### Type A — Occupancy Classification
Input: program description + square footage + jurisdiction
Output: occupancy group, construction type options, sprinkler requirement, occupant load

### Type B — Egress Calculation
Input: floor plan description OR square footage by room type + occupancy
Output: occupant load table, number of exits required, exit width, travel distance check

### Type C — Code Comparison (IBC vs. CBC)
Input: specific requirement or condition
Output: side-by-side comparison, more restrictive flagged, AHJ verification note

### Type D — Alteration / Change of Occupancy
Input: existing use, proposed use, building data
Output: IEBC path recommendation, triggered upgrades, Chicago-specific overlays

### Type E — Accessibility Compliance Check
Input: program or space description
Output: ADA/IAC scoping, path of travel obligations, specific element requirements

---

## 13. STANDARD OUTPUT FORMAT — CODE ANALYSIS

> **Always use this exact format** when producing any code analysis, code compliance memo, or code matrix. Every number must cite its table or section. Never state a requirement from memory — search and verify first.

<!-- SYNC:source=code-lookup|section=Output Format -->
## Output Format

```markdown
<!-- /SYNC -->

---

## 14. REFERENCE SOURCES (PRIMARY)

- IBC 2021 — International Code Council (ICC)
- Chicago Building Code 2019 — City of Chicago DOB (Title 14B Municipal Code)
- IEBC 2021 — International Existing Building Code
- ICC A117.1-2017 — Accessible and Usable Buildings
- ADA Standards for Accessible Design (2010)
- Illinois Accessibility Code (71 Ill. Admin. Code 400)
- NFPA 13 (2022) — Sprinkler Systems
- NFPA 72 (2022) — Fire Alarm
- Chicago Zoning Ordinance — Title 17 Municipal Code
- Chicago Landmarks Preservation Ordinance (LPO)
- Pennsylvania UCC (IBC 2018 base)
- Idaho Building Code (IBC 2021 base)

---

## 14. CORRIDOR & SEPARATION RATINGS QUICK-REFERENCE

### IBC Corridor Fire Rating (IBC 1020.1)
| Occupancy | Sprinklered | Non-Sprinklered |
|---|---|---|
| H, I-2 | 1-hr | 1-hr |
| R | 1/2-hr | 1-hr |
| B, E, F, M, S, U | 0-hr | 1-hr |
| A | 0-hr | 1-hr |

**Chicago Delta:** CBC 14B-10-1020 — corridors in R-2 buildings are generally required to be 1-hr regardless of sprinkler status. Verify with DOB on a per-project basis.

### Exit Access Corridor vs. Exit Stair — Key Distinction
| Element | Exit Access Corridor | Exit Stair (Enclosed) |
|---|---|---|
| IBC Ref | §1020 | §1023 |
| Rating | See table above | 1-hr (<4 stories), 2-hr (≥4 stories) |
| Dead-end limit | 20 ft (50 ft sprinklered) | N/A |
| Door rating | 20-min (where rated) | 1-hr (1.5-hr at 2-hr shaft) |
| Signage | Exit signs required | Exit signs + floor level ID |

> ⚠️ **AOR DETERMINATION REQUIRED** — Classification of a stair as exit access vs. exit stair changes the rating, hardware, and egress calculation. Always confirm with AOR.

### Occupancy Separation Ratings (IBC Table 508.4)
| Between | Sprinklered | Non-Sprinklered |
|---|---|---|
| A / M | 1-hr | 2-hr |
| A / R | 1-hr | 2-hr |
| B / R | 0-hr | 1-hr |
| M / R | 1-hr | 2-hr |
| S-2 / R | 1-hr | 2-hr |
| I-1 / R | 1-hr | 2-hr |

<!-- SYNC:source=code-lookup|section=5. Fire Separation / Rated Assemblies -->
### 5. Fire Separation / Rated Assemblies
- Occupancy separation ratings: IBC Table 508.4 (if separated mixed occupancy)
- Fire barrier / fire partition requirements: IBC §707, §708
- Shaft enclosures: IBC §713
- Search: `IBC 2021 fire separation [occupancy A] [occupancy B]`
- AA partition type library (from permitted projects — Chicago high-rise + TI): Type A = UL 465, 1 HR, STC 40–49 (standard metal stud); Type BA = UL U452 resilient channel, 1 HR, STC 55 (sound-critical demising; first confirmed at LMC 410 S. Wabash); Type C = UL 411, 2 HR, STC 48–56; Type G = UL 420, 2 HR, STC 58; Type K = UL 415B, 2 HR shaft wall; Type Z30 = UL U905, 2 HR CMU; Type Z40 = UL U907, 3 HR grouted CMU (used at R-2/S-2 separation in LMC 410); floor-ceiling = UL G586, 2 HR; column wrap = UL C60, 2 HR. Head-of-wall: UL 2079 tested assembly required (Hilti CFS-TTS basis, ±50% movement).
<!-- /SYNC -->

---

## 15. PLUMBING FIXTURE COUNTS (IBC Table 2902.1 — Minimum)

> Use occupant load from egress calculation as the basis. Split 50/50 male/female unless program data available.

| Occupancy | Fixture Type | Ratio |
|---|---|---|
| **A-2** (restaurant/bar) | WC (each gender) | 1 per 75 occ |
| **A-2** | Lavatory | 1 per 200 occ |
| **A-3** (gym/amenity) | WC (each gender) | 1 per 75 occ |
| **B** (office) | WC (each gender) | 1 per 50 occ |
| **B** | Lavatory | 1 per 80 occ |
| **M** (retail) | WC (each gender) | 1 per 500 occ |
| **R-1** (hotel) | Per guestroom | 1 WC, 1 LAV, 1 TUB/SHOWER |
| **R-2** (residential) | Per dwelling unit | 1 WC, 1 LAV, 1 TUB/SHOWER |
| **E** (school) | WC (each gender) | 1 per 50 students |

**Chicago Note:** Chicago Plumbing Code may require additional fixtures in certain A occupancies. Coordinate with MEP engineer.
**Drinking Fountains:** Required per IBC 2902.2 — 1 per 500 occupants (A, B, E, M); 50% may be bottle-fill stations.
**Service Sinks:** Required in each building story used for janitor service.

---

## 16. FIRE ALARM SCOPING (IBC §907 / NFPA 72)

### When Fire Alarm is Required (IBC 907.2)
| Condition | Requirement |
|---|---|
| A occupancy >300 occupants OR 3+ stories | Manual fire alarm |
| E occupancy >50 occupants | Manual + automatic |
| R-1 (hotel) — new | Automatic + voice evacuation |
| R-2 (multi-family) — new, >16 units | Automatic detection in units |
| High-rise (any occ.) | Automatic + emergency voice/alarm |
| Covered/open mall | Automatic throughout |
| M occupancy — typically per sprinkler design | Waterflow alarm required |

### Key Distinctions for Fit-Out Work
- **Tenant TI in existing base building:** Existing NFPA 72 system must be extended into new TI space. Requires Fire Alarm Contractor coordination. May trigger re-acceptance testing of affected zones.
- **Speaker/strobe placement:** NFPA 72 §18 coverage requirements apply; coordinate with AOR and MEP.
- **Chicago:** Chicago DOB requires fire alarm submittals through Chicago Fire Prevention Bureau (CFD), separate from building permit. Allow additional lead time.

> 📋 **VERIFY WITH AHJ** — Chicago Fire Department has jurisdiction over fire alarm approvals independent of DOB. Suburban municipalities vary.

---

## 17. TENANT IMPROVEMENT & FIT-OUT CODE PATH

### Applicable to: Jewelry Stores, Luxury Retail, Restaurant Fit-Outs, Hotel Amenity Spaces

#### Step 1 — Establish Occupancy
- Confirm base building occupancy vs. tenant space occupancy
- If tenant occupancy differs from base building → occupancy separation or non-separated analysis required (IBC §508)
- Jewelry store in office base building: **M in B** — separation required if separated method used

#### Step 2 — Egress from Tenant Space
- Tenant space egress exits to **exit access corridor** or directly to **exit** — not to adjacent tenant space
- Occupant load calculation required even for small spaces
- If space >49 occupants → 2 exits required (IBC 1006.3)
- Travel distance measured from most remote point to exit door of tenant space

#### Step 3 — Path of Travel (Alterations Trigger)
- Any alteration = ADA path of travel obligation to altered area
- 20% disproportionate cost cap applies (IBC 11B / ADA)
- Restrooms, parking, building entrance may be triggered depending on scope

#### Step 4 — Base Building Coordination
- Sprinkler heads: NFPA 13 requires head relocation when ceiling work occurs — coordinate with base building sprinkler contractor
- Fire alarm: Extend existing system; smoke detector in each new enclosed room
- Mechanical: Supply/return coordination with building engineer; verify CFM per occupancy
- Structural: Verify slab penetration and load assumptions if millwork/casework is heavy (e.g., jewelry display cases, safes)

#### Chicago-Specific TI Notes
- DOB requires separate permit for each tenant buildout (no blanket landlord permits for interior work)
- Certificate of Occupancy or Letter of Approval required before tenant opens
- Accessibility: Chicago also enforces IAC — confirm clearances at service counters, fitting rooms

---

## 18. JURISDICTION DEPTH — IDAHO & PITTSBURGH

### Idaho (IBC 2021 — Statewide)
- Idaho adopted IBC 2021 with minimal state amendments (Idaho Div. of Building Safety)
- **No statewide energy code adoption** — check municipality; Boise has local energy code
- AHJ varies significantly: Boise Building Division vs. county building departments have different review timelines and processes
- Common project type: V-A wood-frame residential, garden-style apartments
- Fire sprinkler: Idaho has not adopted IRC sprinkler mandate for 1–2 family; multi-family (R-2) still requires NFPA 13R or 13 per IBC
- ADA: Enforced by Idaho Human Rights Commission; no state-specific accessibility code beyond ADA/IBC

> 📋 **VERIFY WITH AHJ** — Always confirm which edition is adopted by the specific county/city. Rural counties may lag behind.

### Pittsburgh / Pennsylvania (PA UCC — IBC 2018 base)
- Pennsylvania Uniform Construction Code (PA UCC) — administered by Dept. of Labor & Industry
- Municipalities may opt in/out of PA UCC — Pittsburgh has opted IN and administers locally through City of Pittsburgh DCOS
- Pittsburgh uses **IBC 2018** — not 2021; section references may differ from default
- Pittsburgh permits: eBUILD portal (online permit submission)
- Historic resources: PA SHPO (State Historic Preservation Office) involved for National Register properties; Pittsburgh has City-designated historic districts (e.g., Allegheny West, Mexican War Streets)
- Pittsburgh Zoning: Pittsburgh Zoning Code separate from building code; administered by Pittsburgh City Planning
- Accessibility: ADA enforced; no PA-specific code beyond ADA/IBC

> 📋 **VERIFY WITH AHJ** — Pittsburgh DCOS has specific submittal requirements including energy compliance forms. Coordinate early with local expediter for multi-story projects.

---

## 19. SUBURBAN CHICAGO AHJ QUICK-REFERENCE

| Municipality | Code Adopted | Notes |
|---|---|---|
| Evanston | IBC 2021 | Close to CBC in practice; own plan review dept. |
| Oak Park | IBC 2018 | Village Building Dept; slower review |
| Skokie | IBC 2018 | Own amendments; verify sprinkler thresholds |
| Naperville | IBC 2021 | City Building Division; typical suburban process |
| Rosemont | IBC 2018 | Heavy commercial/hospitality; separate building dept |
| Schaumburg | IBC 2021 | Township AHJ; commercial-heavy review |

> All suburban Chicago municipalities adopt their own amendments. **Always confirm the specific municipal code adoption before issuing code analysis.** Call the building department or use the ICC adoption tracker.

---

## 20. CHICAGO ZONING ↔ BUILDING CODE INTERFACE

These are two separate regulatory tracks — always clarify which is in play:

| Issue | Governed By | Department |
|---|---|---|
| Floor Area Ratio (FAR) | Zoning Ordinance (Title 17) | Chicago Dept. of Planning & Development (DPD) |
| Use (residential, retail, etc.) | Zoning Ordinance | DPD |
| Setbacks, heights, lot coverage | Zoning Ordinance | DPD |
| Parking minimums | Zoning Ordinance | DPD |
| Building construction, egress, fire safety | Chicago Building Code (Title 14B) | Chicago DOB |
| Mechanical, plumbing | Chicago Mechanical / Plumbing Codes | Chicago DOB |
| Fire alarm, sprinkler approvals | Chicago Building Code + CFD | Chicago DOB + Chicago Fire Dept. |
| Historic exterior changes | Landmarks Preservation Ordinance | Chicago Dept. of Planning (Landmarks Div.) |
| ADA / accessibility | ADA + Illinois Accessibility Code | Chicago DOB + BACP |

**Common confusion point:** FAR calculations, setback variances, and use changes go to DPD and Zoning Board of Appeals (ZBA) — not DOB. Both tracks often run in parallel for new construction.

---

## 21. CHICAGO DOB — PERMIT TRACKS & PROCESS DEPTH

> Chicago is ~50% of AA's workload. This section provides operational depth beyond code text.

### Three Permit Tracks

| Track | When Required | Key Characteristics |
|---|---|---|
| **Express Permit** | Minor repairs/replacements, no new construction | Over-the-counter or online; no plan review; same-day |
| **Standard Plan Review (SPR)** | New construction ≤80 ft, non-residential ≤150,000 sf, residential <50 DU, schools ≤60,000 sf | E-Plan submission by appointment; up to 13 departmental reviews; Project Manager assigned |
| **Developer Services Program (DSP)** | Buildings >80 ft (high-rise), schools >60,000 sf, B/M uses >150,000 sf, complex projects | Mandatory for AA's high-rise/large commercial work; dedicated team, pre-application meeting recommended |

### Departmental Reviews — SPR/DSP (Up to 13 Departments)
Most AA projects will trigger reviews from a subset of these:
- **Architecture** — Building code compliance (DOB)
- **Zoning** — Must be approved before building permit application; separate DPD track
- **Fire Prevention** — CFD; fire alarm, sprinkler, means of egress
- **Plumbing** — Chicago Plumbing Code compliance
- **Electrical** — Chicago Electrical Code (NEC-based with amendments)
- **Mechanical** — Chicago Mechanical Code
- **Geotechnical** — Required for excavations >12 ft or certain soil conditions
- **Stormwater Management** — Chicago DOE; required for most new construction
- **ADA/Accessibility** — IAC + ADA compliance review
- **Energy** — Chicago Energy Conservation Code (CECC) compliance
- **Structural** — Required for new buildings, additions, significant alterations

### Chicago E-Plan Submission Tips
- All SPR/DSP submittals via **E-Plan** (Chicago's online portal)
- Appointments required — schedule early; slots book out weeks in advance
- First submission → comments returned → corrections → re-review (multiple cycles typical)
- Typical SPR timeline: **3–6 months** for new construction; **6–12+ months** for DSP high-rise
- **Certified Plan Corrections (CPC):** Architect of Record can self-certify certain minor corrections, accelerating review

### Common Plan Review Triggers / Correction Themes
- Egress width calculations not shown on plan
- Occupant load table missing or incomplete
- Accessible route not traced end-to-end from site entry
- Sprinkler riser room not identified or undersized
- Energy code compliance forms (COMcheck or Chicago-equivalent) missing
- Stormwater detention/green roof compliance not addressed
- Exit sign and emergency lighting locations not shown

### Certificate of Occupancy (CO) Process
- Final inspection required after construction
- All departmental sign-offs must be cleared before CO issued
- Tenant TI spaces: **Letter of Approval (LOA)** issued instead of CO in some cases
- Temporary CO available for phased occupancy — requires active permit and partial completion

### Key Contacts / Portals
| Need | Resource |
|---|---|
| Permit status / E-Plan | chicago.gov/buildings |
| Zoning map lookup | chicago.gov/zoning |
| Landmark status check | chicago.gov/landmarks |
| CFD fire alarm approval | Chicago Fire Prevention Bureau (separate submission) |
| AHJ interpretation request | Written inquiry to DOB Commissioner's office |

---

## 22. CHICAGO ZONING — OPERATIONAL DEPTH

> Zoning is a separate regulatory track from the building code. DPD ≠ DOB.

### Key Zoning District Types (Title 17)

| District | Code Prefix | Typical Use | Notes |
|---|---|---|---|
| Downtown Core | DC | High-density office/commercial | Riverwalk, Loop core |
| Downtown Mixed-Use | DX | Mixed commercial/residential | Most AA downtown projects |
| Downtown Residential | DR | High-density residential | River North, Streeterville |
| Neighborhood Commercial | B1–B3 | Ground-floor retail + residential | 2–5 stories typical |
| Community Shopping | C1–C2 | Strip retail, larger commercial | Suburban-edge neighborhoods |
| General Commercial | C3 | Heavy commercial, auto | |
| Residential | R1–R5 | Single to multi-family | R4/R5 = mid-rise multi-family |
| Manufacturing | M1–M3 | Light to heavy industrial | PMD (Planned Manufacturing Districts) restrict conversion |

### Floor Area Ratio (FAR) — Key Facts
- FAR = gross floor area ÷ lot area
- DX districts: FAR up to 16.0 with bonus (transit, affordable housing, open space)
- B/C districts: FAR 3.0–5.0 typical; varies by suffix number
- **Bonus FAR** available for: affordable housing, transit proximity (within 600 ft of L station), green roofs, ground-floor active use
- Mechanical penthouses, parking, and certain below-grade areas may be excluded — verify per 17-17-0200

### Planned Development (PD) Process
Required when: project exceeds certain FAR/height thresholds by district, OR involves more than 2 acres in most downtown zones.

**Process overview:**
1. Pre-application meeting with DPD (recommended; often mandatory for large projects)
2. Aldermanic introduction — local alderman must sponsor the PD ordinance
3. Chicago Plan Commission (CPC) public hearing and vote
4. City Council Committee on Zoning review
5. Full City Council vote
6. Recordation and permit eligibility

Timeline: **6–18+ months** from pre-application to City Council approval. Coordinate with client's land use attorney.

### Zoning Board of Appeals (ZBA)
- Hears variance requests, special use permits, and appeals of DOB/DPD decisions
- Monthly public hearings; application deadlines ~6 weeks before hearing
- Standard of review: hardship or practical difficulty (variance); compatibility with surrounding uses (special use)
- **Common AA use case:** Setback variances for additions, parking reduction requests, use variations for ground-floor retail in residential zones

### Chicago Affordable Housing Requirement (ARO)
- Applies to residential projects with ≥10 units receiving city assistance, or ≥10 units in Affordable Requirements Ordinance trigger areas
- 10–20% of units must be affordable (AMI-based) OR in-lieu fee paid
- Verify current ARO trigger map with DPD — boundaries change

### Transit-Served Location (TSL) Bonus
- Sites within 600 ft of CTA rail station or 1,200 ft of Metra station may qualify for reduced parking and FAR bonuses
- Parking minimums can be reduced or eliminated in TSL areas — significant cost impact on garage design

<!-- SYNC:source=zoning-research|section=3. Overlay Districts and Special Conditions -->
### 3. Overlay Districts and Special Conditions
- Search: `[city] [address] overlay district historic landmark transit`
- Chicago triggers to check:
  - **ARO**: 10+ dwelling units → affordable housing requirement. If 20%+ affordable: ALL affordable units must be Type A accessible (MOPD crossover — coordinate with /code-lookup Step 7). Check current ARO percentage by zoning district.
  - **TSL** (transit-served location): confirm at CTA/Metra proximity map; within TSL, parking is a MAXIMUM (not minimum). DX-12 → 0.5 spaces/unit max. Document TSL boundary confirmation.
  - **DX districts**: confirm specific FAR (DX-5 = 5.0; DX-7 = 7.0; DX-12 = 12.0). Floor area exclusions (mechanical, parking) may apply.
  - **P-streets** (Pedestrian Streets): ground-floor active use + façade transparency requirements. Check Chicago P-street map.
  - **Lakefront Protection Overlay**: 600' setback minimum from shoreline; separate CDOT review.
  - **Landmark / Chicago Landmark district**: Landmarks Commission CCL review — separate process from permit, precedes permit.
  - **Planned Development (PD)**: if site is within existing PD boundary, any change of occupancy, program increase, or FAR addition requires DPD minor change petition (separate from, and before, building permit). Multi-building FAR bundling: when PD contains existing + new buildings, the PD ordinance sets total FAR for the combined site — new building's available FAR = total PD allowable minus existing building's consumed gross floor area. Confirm existing building GSF via PD ordinance before calculating remaining capacity. Confirmed at: 741 N. Wells (PD 1519, residential — 755 N. Wells consumed 15,996 SF) and 609 W. Randolph (commercial — 601 W. Randolph consumed 13,843 SF).
  - **EVSE**: if 25+ parking spaces (new construction), Illinois Vehicle Charging Act (IVCA, eff. 11/1/2020) triggers — 20% EV-ready + 20% EV-capable. Note in Non-Conformities if not planned. Chicago code matrix Z.17.
- DC triggers: DCSHPO, HPRB, Green Area Ratio, IZ (Inclusionary Zoning)
- Idaho/Ada County: ACHD access, ITD state highway, subdivision plat sequence
<!-- /SYNC -->

---

## 23. CHICAGO HIGH-RISE — DEEP PROVISIONS

> CBC defines high-rise at >80 ft (vs. IBC's 75 ft). This section goes beyond the summary in §5.

### High-Rise Threshold Measurement
- Measured from **lowest level of fire vehicle access** to floor level of highest occupied floor
- Mechanical penthouses and rooftop structures generally excluded from height for this trigger
- Partially sprinklered buildings: the 80-ft threshold applies to the unsprinklered portion

### Mandatory Systems (CBC 14B-9-902 and related)

| System | Requirement |
|---|---|
| Sprinklers | NFPA 13 throughout; no exceptions |
| Standpipe | Class I wet standpipe in every required exit stair |
| Fire Alarm | Addressable system with emergency voice/alarm communication (EVACS) |
| Smoke Control | Pressurization or exhaust system — stairwell pressurization mandatory |
| Elevator Lobbies | Enclosed elevator lobbies at each floor OR hoistway pressurization |
| Elevator Pressurization | Min. 0.10 in. w.g. / Max. 0.25 in. w.g. differential; separate fan per hoistway |
| Fire Command Center | Required; location per §911, approved by CFD; typically at grade near primary entry — **no SF minimum in CBC** (≥200 SF / 1 HR is IBC 2021 only — do NOT apply to Chicago CBC projects) |
| Emergency Power | System 2 emergency power required for ALL Chicago high-rises >80 FT (CBC 4(13-76-080)); diesel generator required ONLY for buildings >400 FT — all confirmed AA Chicago projects are below 400 FT and do not require diesel generator |
| Fire Service Elevator | **(1) required** at 3,500 lbs min capacity per CBC 403.6.2 — NOT 2 elevators (2 fire service elevators is IBC 2021 non-Chicago behavior) |
| Elevator Recall | Phase I and Phase II firefighter recall per ASME A17.1 |

<!-- SYNC:source=code-lookup|section=3. Construction Type and Allowable Area/Height -->
### 3. Construction Type and Allowable Area/Height
- Pull IBC Table 504.3 (allowable height) and Table 504.4 (allowable stories)
- Pull IBC Table 506.2 (allowable area)
- Apply sprinkler increase (§504.2, §506.3) if NFPA 13 system present
- Apply frontage increase (§506.2) if applicable
- Search: `IBC 2021 Table 504 [occupancy] [construction type]`
- Chicago high-rise flag (>80' AGL = CBC 18-27-4-403 / IBC 403): IBC 403.2.1.1 allows construction type reduction to I-B with NFPA 13 throughout; primary frame + columns = 3 HR (not reduced); bearing walls = 2 HR; shaft enclosures = 1 HR (exit enclosures + hoistways excluded from reduction); R-2/S-2 separation = 3 HR (CBC governs — NOT IBC 1 HR); R-2 corridors = 1 HR for >10 occupants per Title 14B; commercial B/M corridors = 0 HR; (1) fire service elevator required at 3,500 lbs min capacity (NOT 2 — that is IBC 2021/non-Chicago); stairway doors lockable from within stair, unlockable at FCC per CBC 403.5.3 (smokeproof vestibules on ALL stairways are IBC 2021 non-Chicago behavior — do NOT apply to CBC projects); fire command center: location per §911, acceptable to fire code official (no SF minimum in CBC — ≥200 SF/1 HR is IBC 2021 only); System 2 emergency power required for all Chicago high-rises >80 FT (CBC 4(13-76-080)); diesel generator NOT required below 400 FT (confirmed: all AA Chicago projects are below 400 FT); garage separation per CBC 13-56-280: R-2/S-2 = 3 HR base − 1 HR sprinkler reduction = 3 HR min; M/S-2 = 3 HR base − 1 HR = 2 HR (IBC 406.2.8 is flat 3 HR with NO sprinkler reduction — Chicago is more permissive)
<!-- /SYNC -->

### Smoke Control — Stairwell Pressurization
- All required exit stairs must be pressurized
- System must maintain positive pressure differential between stair and adjacent floor: **0.05 in. w.g. minimum**
- Fan system must be on emergency power
- Coordinate with mechanical engineer early — shaft sizing impacts structural bay layout

### Refuge Areas / Areas of Rescue Assistance
- Required at each floor in high-rise where exit access does not include a ramp
- Two-way communication required at each area of rescue assistance
- Chicago DOB verifies location and signage at plan review

### High-Rise Egress Notes
- Two remote exit stairs required minimum
- Scissor stairs permitted only where stairs are separated by 2-hr construction throughout
- Exit discharge: 50% of exits may discharge through lobby if lobby is sprinklered and separated — verify with DOB

### CFD Coordination for High-Rise
- Chicago Fire Department reviews all high-rise projects independently from DOB
- Pre-construction meeting with CFD often required before permit issuance for new high-rise
- Fire command center layout must be submitted to CFD for approval
- Annual high-rise inspections required post-occupancy

---

## 24. 50-STATE IBC ADOPTION MATRIX

> **Research protocol:** For any state not covered in depth below, use the workflow in §26 before issuing findings.
> Data current as of April 2026. Adoptions change — always verify at iccsafe.org/adoptions or up.codes before issuing a code analysis.

### Standalone / Non-IBC States
These states do NOT adopt the IBC directly — they have their own standalone codes:

| State | Code | Notes |
|---|---|---|
| **Illinois (Chicago)** | Chicago Building Code 2019 (Title 14B) | City of Chicago only; based on IBC 2015 with major local amendments |
| **Illinois (state)** | IBC 2018 (state-owned facilities) | Chicago overrides for city projects |
| **Florida** | Florida Building Code (FBC) 8th Ed. (2023) | Standalone; IBC-influenced but heavily amended; high-wind, flood provisions dominate |
| **New York (NYC)** | NYC Building Code 2022 | NYC is entirely separate; based on IBC 2015 with massive local amendments |
| **New York (state)** | 2020 NYS Building Code (IBC 2018 base) | State outside NYC |
| **Wisconsin** | Comm 61-65 / SPS 361-366 (IBC 2021 base, eff. Sept 2025) | State-amended; significant local amendments |

### IBC Adoption by State — Full Matrix

| State | IBC Edition | Energy Code | Standalone Code? | Key Notes |
|---|---|---|---|---|
| Alabama | IBC 2021 | IECC 2021 | No | Local amendments vary |
| Alaska | IBC 2021 | IECC 2018 | No | Remote/climate provisions; verify AHJ |
| Arizona | IBC 2018 | IECC 2018 | No | Cities adopt independently; Phoenix = IBC 2018 |
| Arkansas | IBC 2018 | IECC 2018 | No | — |
| California | CBC 2022 (Title 24) | CEC (Title 24 Part 6) | **YES** | Standalone; IBC-influenced; CalGreen mandatory |
| Colorado | IBC 2021 | IECC 2021 | No | Local home-rule; Denver has amendments |
| Connecticut | IBC 2021 | IECC 2021 | No | CT Amendments; state DCS review |
| Delaware | IBC 2018 | IECC 2018 | No | — |
| Florida | FBC 8th Ed. | FBC-Energy | **YES** | See standalone note above |
| Georgia | IBC 2018 | IECC 2015 | No | GA amendments effective Jan 2025 |
| Hawaii | IBC 2018 | IECC 2015 | No | Wind/seismic critical; county-level AHJ |
| Idaho | IBC 2021 | IECC 2018 | No | Minimal state amendments; AHJ varies |
| Illinois | IBC 2018 (state) | IECC 2018 | Partial | Chicago = standalone CBC; state = IBC 2018 |
| Indiana | IBC 2021 | IECC 2021 | No | State-level adoption; local amendments limited |
| Iowa | IBC 2021 | IECC 2021 | No | — |
| Kansas | IBC 2018 | IECC 2018 | No | Local adoption varies |
| Kentucky | IBC 2018 | IECC 2018 | No | — |
| Louisiana | IBC 2021 | IECC 2021 | No | — |
| Maine | IBC 2021 | IECC 2021 | No | — |
| Maryland | IBC 2021 | IECC 2021 | No | MDE stormwater requirements critical |
| Massachusetts | IBC 2021 (9th Ed.) | IECC 2021 | No | Significant state amendments (780 CMR) |
| Michigan | IBC 2021 | IECC 2021 | No | LARA administers; local amendments |
| Minnesota | IBC 2018 | IECC 2024 (energy only) | No | 6-yr adoption cycle; next update ~2026 |
| Mississippi | IBC 2018 | IECC 2015 | No | — |
| Missouri | IBC 2018 | No statewide energy code | No | Local adoption varies significantly |
| Montana | IBC 2021 | IECC 2021 | No | — |
| Nebraska | IBC 2018 | IECC 2018 | No | — |
| Nevada | IBC 2018 | IECC 2018 | No | Clark County (Las Vegas) has own amendments |
| New Hampshire | IBC 2021 | IECC 2021 | No | — |
| New Jersey | IBC 2021 (NJ UCC) | IECC 2021 | No | NJ Uniform Construction Code; significant amendments |
| New Mexico | IBC 2018 | IECC 2018 | No | — |
| New York (state) | IBC 2018 (2020 NYSBC) | IECC 2018 | No | NYC separate — see standalone |
| New York (NYC) | NYC BC 2022 | NYC Energy Conservation Code | **YES** | See standalone note above |
| North Carolina | IBC 2018 (NCBC) | IECC 2018 | No | NC amendments; own code branding |
| North Dakota | IBC 2021 | IECC 2021 | No | — |
| Ohio | IBC 2021 (OBC 2024) | IECC 2021 | No | OBC amendments effective 2024; OBC Group 105 amendments Oct 2025 |
| Oklahoma | IBC 2018 | IECC 2018 | No | — |
| Oregon | IBC 2024 (OSSC 2025) | OECC 2025 | No | Early 2024 IBC adopter; OR Structural Specialty Code |
| Pennsylvania | IBC 2018 (PA UCC) | IECC 2018 | No | Pittsburgh = IBC 2018; see §18 for depth |
| Rhode Island | IBC 2021 | IECC 2021 | No | — |
| South Carolina | IBC 2018 | IECC 2015 | No | — |
| South Dakota | IBC 2021 | IECC 2021 | No | — |
| Tennessee | IBC 2012 | IECC 2012 | No | One of the oldest adoptions nationally; verify AHJ |
| Texas | No statewide IBC | No statewide energy code | **NO STATE CODE** | Each city adopts independently; Houston has no building code |
| Utah | IBC 2021 | IECC 2021 | No | — |
| Vermont | IBC 2015 | IECC 2018 | No | — |
| Virginia | IBC 2018 (USBC 2021) | IECC 2018 | No | Uniform Statewide Building Code |
| Washington | IBC 2021 (WSBC) | IECC 2021 | No | WA amendments; Seattle has own amendments |
| West Virginia | IBC 2018 | IECC 2018 | No | — |
| Wisconsin | IBC 2021 (SPS, eff. Sept 2025) | IECC 2021 | No | State-amended; significant local amendments |
| Wyoming | IBC 2021 | IECC 2021 | No | — |
| D.C. | IBC 2021 (DCMR Title 12) | IECC 2021 | No | DC amendments; green building requirements |

> ⚠️ **Special Cases to Always Verify:**
> - **Texas:** No statewide code. Each municipality adopts independently. Houston has historically had no building code (though fire code exists). Dallas, Austin, San Antonio each use different IBC editions.
> - **Florida:** FBC is NOT the IBC. Section references, occupancy classifications, and egress rules differ. Never apply IBC section numbers to FL projects without cross-referencing FBC.
> - **California:** Title 24 CBC is a standalone code. CBC chapter/section numbers do not map to IBC.
> - **NYC:** NYC Building Code is a standalone code. Treat as a completely separate regulatory universe.
> - **Tennessee:** IBC 2012 is significantly older than current practice. Many life safety provisions differ.

---

## 25. AA MIDWEST STATES — JURISDICTION DEPTH

### Wisconsin (IBC 2021 base via SPS, effective September 2025)
- Administered by: **WI Dept. of Safety and Professional Services (DSPS)**
- Commercial code: SPS 360 series (new adoption eff. Sept 1, 2025); plans submitted under old code accepted through Oct 1, 2025
- Residential: SPS 320 series (Wisconsin Uniform Dwelling Code — separate from IBC)
- Sprinkler: Wisconsin has state sprinkler mandate for new multi-family ≥3 stories
- Energy: IECC 2021 adopted alongside 2021 IBC in same rulemaking cycle
- Local AHJs: Milwaukee, Madison, Green Bay have own building departments with local amendments
- Wisconsin does not adopt Chicago's code — suburban Milwaukee projects are state code, NOT CBC

> 📋 **VERIFY WITH AHJ** — Milwaukee has significant local amendments separate from state DSPS. Madison similarly. Confirm which AHJ has jurisdiction (state vs. local).

### Minnesota (IBC 2018 base)
- Administered by: **MN Dept. of Labor and Industry (DLI)**
- Commercial: 2020 Minnesota State Building Code (IBC 2018 base); next full update expected ~2026
- Residential: MN Residential Code (IRC 2018 base)
- Energy: 2024 Minnesota Commercial Energy Code (IECC 2021 base) — energy code updates on independent 3-year cycle
- Sprinkler: NFPA 13 for new R-2 ≥3 stories; NFPA 13R for 1–3 story R-2; NFPA 13D for 1–2 family
- Accessibility: MN Accessibility Code (MN 1341) — adopts ICC A117.1 with amendments; more detailed than IBC scoping in some areas
- Local AHJs: Minneapolis and St. Paul have own building departments; both closely follow state code with minor amendments
- MN State Building Official administers plan review for state-owned buildings

> 📋 **VERIFY WITH AHJ** — Minneapolis Building Inspections has its own permit portal and inspection process separate from state DLI.

### Ohio (IBC 2021 base via OBC 2024)
- Administered by: **Ohio Dept. of Commerce, Division of Industrial Compliance (ODIC)**
- Commercial: 2024 Ohio Building Code (OBC) — IBC 2021 base with Ohio amendments; OBC Group 105 amendments effective Oct 15, 2025
- Residential: Ohio Residential Code (ORC) — IRC 2018 base
- Energy: IECC 2021 (Ohio Commercial Energy Code)
- Sprinkler: NFPA 13 for occupancies per IBC; Ohio does not have additional mandates beyond IBC thresholds
- State review: Projects over certain thresholds (schools, state-funded) go through ODIC state plan review; local projects go through local AHJ
- Local AHJs: Columbus, Cleveland, Cincinnati all have own building departments; Columbus is large and fast-growing — plan review timelines can be long
- Accessibility: Ohio follows ADA + OBC accessibility provisions; no separate state accessibility code

> 📋 **VERIFY WITH AHJ** — Ohio has both state and local review tracks depending on project type and funding. Confirm which applies before scheduling review.

### Michigan (IBC 2021 base)
- Administered by: **MI Dept. of Licensing and Regulatory Affairs (LARA), Bureau of Construction Codes (BCC)**
- Commercial: Michigan Building Code (MBC) — IBC 2021 base with Michigan amendments
- Residential: Michigan Residential Code (MRC) — IRC 2021 base
- Energy: IECC 2021 (Michigan Energy Code)
- Sprinkler: NFPA 13 per IBC thresholds; Michigan DOES require sprinklers in all new R-2 buildings (multi-family) — more restrictive than base IBC
- Local AHJs: Detroit, Grand Rapids, Lansing, Ann Arbor all have own building departments
- Michigan requires licensed construction supervisors and registered architects/engineers for plan seal
- Detroit in particular: plan review through Detroit Buildings, Safety Engineering and Environmental Department (BSEED); timelines variable

> 📋 **VERIFY WITH AHJ** — Michigan's local AHJ authority is strong. Detroit BSEED operates independently and has specific submittal formats.

### Indiana (IBC 2021 base)
- Administered by: **Indiana Dept. of Homeland Security (IDHS), Fire and Building Safety Division**
- Commercial: Indiana Building Code (IBC 2021 base with Indiana amendments)
- Residential: Indiana Residential Code (IRC 2021 base); IMPORTANT — Indiana adopted the sprinkler mandate for new 1–2 family homes (IRC Section P2904)
- Energy: IECC 2021 (Indiana Energy Conservation Code)
- Sprinkler: NFPA 13 per IBC thresholds for commercial; residential sprinkler mandate in effect for new 1–2 family (unusual nationally)
- Local AHJs: Indianapolis (through Indy DPW), Fort Wayne, South Bend, Evansville all have own departments
- Indiana does not have a statewide plan review authority for most private commercial projects — goes directly to local AHJ
- Fire marshal review: required for A, E, I, and H occupancies; IDHS State Fire Marshal has separate approval authority

> 📋 **VERIFY WITH AHJ** — Indianapolis (Marion County) projects go through the Indy DPW; unincorporated Marion County goes through county. Confirm jurisdiction boundary early.

---

## 26. LIVE CODE RESEARCH PROTOCOL

> Use this protocol whenever a project is in a state/jurisdiction not covered in §§17–18 and §§25–26 above, or when adoption status may have changed.

### Step 1 — Confirm Jurisdiction
- Is the project in an incorporated municipality or unincorporated county?
- If municipality: Does it have its own building department, or does it defer to the county/state?
- Chicago suburbs: always confirm with the specific municipality — do not assume state code applies.

### Step 2 — Look Up Current Adoption
**Primary sources (in order of authority):**

1. **ICC Adoption Map** — [iccsafe.org/adoptions/code-adoption-map/IBC](https://www.iccsafe.org/adoptions/code-adoption-map/IBC)
   - Click the state → shows IBC/IRC/IECC/IEBC edition adopted and effective date
   - Maintained by ICC; not always up-to-the-month current

2. **UpCodes** — [up.codes/codes](https://up.codes/codes)
   - Search by state → shows all adopted codes with full text
   - Indicates whether state or local amendments are layered in
   - Best for reading actual code text with amendments incorporated

3. **State Building Division / Department of Safety Website**
   - Search: "[State name] department of building safety" or "[State] building code division"
   - Primary authority — ICC map may lag; state website is definitive

4. **MiTek Master I-Code Adoption Chart** (PDF, updated quarterly)
   - Comprehensive matrix of all I-Code editions by state
   - Download at mitek-us.com

### Step 3 — Identify Key Deviations
Once edition confirmed, check for:
- Standalone code or IBC-based? (FL, CA, NYC, Chicago = standalone)
- State energy code edition (often different from building code cycle)
- Sprinkler mandates beyond IBC thresholds
- State accessibility code supplements (some states have separate accessibility codes)
- Local amendments by municipality (always call the building department for projects >$1M)

### Step 4 — Call the AHJ
For any project over $500K construction value or involving occupancy change, call or email the local building department to:
- Confirm current adopted edition and any amendments not yet posted online
- Ask about plan review timeline and required submittal format
- Ask if pre-application meeting is available (recommended for new construction)
- Confirm whether state or local review authority has jurisdiction

### Step 5 — Flag in Analysis
Every code finding for a non-standard jurisdiction must include:
> 📋 **VERIFY WITH AHJ** — [State/City] adoption confirmed as [Edition] per [source] as of [date]. Local amendments may apply. Call [department name] at [website] before issuing for permit.

### Quick-Reference Research URLs
| Resource | URL | Use |
|---|---|---|
| ICC Adoption Map | iccsafe.org/adoptions | Current edition by state |
| UpCodes | up.codes | Full code text with amendments |
| ICC Digital Codes | codes.iccsafe.org | Official I-Code text |
| MiTek Adoption Chart | mitek-us.com (search "adoption chart") | Quarterly PDF matrix |
| Chicago DOB | chicago.gov/buildings | Permits, E-Plan, inspections |
| Chicago Zoning | chicago.gov/zoning | Zoning map, PD lookup |
| Chicago Landmarks | chicago.gov/landmarks | Landmark status, LPO |
| IL SHPO | ilshpo.org | Historic tax credits, Section 106 |
| PA SHPO | phmc.pa.gov | Pennsylvania historic preservation |
| ADA.gov | ada.gov | ADA standards, guidance |
| UpCodes ADA | up.codes/viewer/federal/ada-aba | ADA Standards searchable |

---

## 27. FLAGS & ESCALATION TRIGGERS

Always add `⚠️ AOR DETERMINATION REQUIRED` when:
- Rated assembly design (wall, floor, ceiling)
- Exit access stair vs. exit stair classification
- Occupancy separation rating
- Any high-rise provision
- Variance or modification request

Always add `📋 VERIFY WITH AHJ` when:
- Local amendment status unknown
- Interpretation is ambiguous in code text
- Suburban Chicago municipality not confirmed
- Project involves a historic structure

Always add `🏛️ LANDMARK / SHPO` when:
- Existing building on Chicago Landmark list or NRHP
- Federal funding or tax credit involvement suspected
- Exterior alteration in a historic district
