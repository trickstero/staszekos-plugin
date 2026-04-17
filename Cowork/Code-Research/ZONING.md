# ZONING.md — Zoning Analysis Knowledge Base
*Antunovich Associates | Code Research Project*
*Last updated: 2026-04-14*

> **Scope note:** This file covers **zoning** — use, density, height, setback, parking, and entitlement process. Building code (life safety, egress, construction type) is in CLAUDE_2.md. When a question touches both tracks, identify which department governs each issue before answering.

---

## 1. ZONING vs. BUILDING CODE — THE FUNDAMENTAL SPLIT

| Issue | Governed By | Department |
|---|---|---|
| Permitted use (residential, retail, etc.) | Zoning Ordinance | Planning / DPD |
| FAR, lot coverage, building height | Zoning Ordinance | Planning / DPD |
| Setbacks, yards, build-to lines | Zoning Ordinance | Planning / DPD |
| Parking minimums / maximums | Zoning Ordinance | Planning / DPD |
| Affordable housing requirements | Zoning Ordinance | Planning / DPD |
| Signage | Zoning Ordinance | Planning / DPD |
| Occupancy classification, egress, sprinklers | Building Code | Building Dept / DOB |
| Fire alarm, sprinkler system design | Building Code + Fire Dept | DOB + AHJ Fire |
| ADA / Accessibility | Building Code + ADA | DOB + BACP |
| Historic exterior changes | Landmarks Ordinance | Landmarks Commission |

**Rule:** Zoning determines *what* you can build and *how much*. Building code determines *how* you build it safely. Both tracks run in parallel — both must be satisfied before a permit issues.

---

## 2. ZONING ANALYSIS INTAKE CHECKLIST

For any new zoning analysis, confirm these inputs before issuing findings:

**Site**
- Full address + APN/PIN
- Confirmed zoning district (from official map, not assumption)
- Lot dimensions: area, frontage, depth
- Existing improvements (structure, paving, landscaping)
- Known encumbrances: easements, covenants, deed restrictions, prior variances/SUPs

**Program**
- Primary use + secondary uses
- Total GFA proposed
- Residential units (if applicable)
- Building height (stories + feet AGL)
- Parking spaces proposed

**Analysis Type**
- Feasibility / due diligence
- Permit submission memo
- Variance or special use support
- Pre-application meeting prep
- Plain-language owner summary

**Special Flags**
- Federal funding → Section 106 (historic) + NEPA
- Building >200 ft AGL → FAA Form 7460-1 required
- Site near water/wetlands/floodplain → FEMA + Army Corps
- Site in or adjacent to historic district
- Affordable units proposed or required
- Change of use from prior occupancy

---

## 3. CHICAGO ZONING — TITLE 17 (DEEP REFERENCE)

> Chicago zoning is administered by the **Dept. of Planning & Development (DPD)**, separate from DOB. Zoning must be approved before a building permit application is accepted.

### 3.1 District Types

| District | Code Prefix | Typical Use | Notes |
|---|---|---|---|
| Downtown Core | DC | High-density office/commercial | Riverwalk, Loop core |
| Downtown Mixed-Use | DX | Mixed commercial/residential | Most AA downtown projects |
| Downtown Residential | DR | High-density residential | River North, Streeterville |
| Neighborhood Commercial | B1–B3 | Ground-floor retail + residential | 2–5 stories typical |
| Community Shopping | C1–C2 | Strip retail, larger commercial | Suburban-edge neighborhoods |
| General Commercial | C3 | Heavy commercial, auto | |
| Residential | R1–R5 | Single to multi-family | R4/R5 = mid-rise multi-family |
| Planned Manufacturing | M1–M3 / PMD | Light to heavy industrial | PMD restricts residential conversion |

### 3.2 Floor Area Ratio (FAR)

- FAR = gross floor area ÷ lot area
- **DX districts:** up to 16.0 FAR with bonuses (transit, affordable housing, open space)
- **B/C districts:** 3.0–5.0 typical; varies by suffix number
- **Bonus FAR available for:** affordable housing, transit proximity (within 600 ft of L), green roofs, ground-floor active use
- **Exclusions** (verify per 17-17-0200): mechanical penthouses, parking structures, certain below-grade areas

### 3.3 Height

- Chicago zoning sets maximum height by district; many downtown districts have no absolute height limit (FAR controls instead)
- Planned Developments (PDs) can negotiate heights beyond base zoning
- Separate CBC high-rise trigger at 80 ft (building code, not zoning)

### 3.4 Setbacks / Build-To Lines

- Downtown districts often have **build-to lines** (mandatory storefront at street) rather than setbacks
- Residential districts have front yard, rear yard, and interior side yard minimums
- Corner lots: both street-facing yards are "front yards" — verify per 17-2-0300

### 3.5 Parking

- Parking minimums reduced or eliminated in **Transit-Served Locations (TSL)**: within 600 ft of CTA rail or 1,200 ft of Metra
- Maximum parking caps apply in many downtown districts — building too much parking can require a variance
- Shared parking agreements permitted under 17-10-0200
- Bike parking: required per 17-10-0400; ratios vary by use

### 3.6 Planned Development (PD) Process

Required when project exceeds FAR/height thresholds by district, or involves >2 acres in most downtown zones.

**Steps:**
1. Pre-application meeting with DPD (often mandatory for large projects)
2. Aldermanic introduction — local alderman must sponsor the PD ordinance
3. Chicago Plan Commission (CPC) public hearing and vote
4. City Council Committee on Zoning review
5. Full City Council vote
6. Recordation → permit eligibility

**Timeline:** 6–18+ months from pre-application to City Council approval. Coordinate with client's land use attorney. AA is **not** the land use attorney of record — flag this scope gap to client at project kickoff.

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

### 3.7 Zoning Board of Appeals (ZBA)

- Hears: variance requests, special use permits, appeals of DPD/DOB decisions
- Monthly public hearings; application deadlines ~6 weeks before hearing
- Standard: hardship or practical difficulty (variance); compatibility (special use)
- **Common AA use cases:** setback variances for additions, parking reductions, use variations for ground-floor retail in residential zones

### 3.8 Affordable Housing Requirements (ARO)

- Applies to residential projects with ≥10 units receiving city assistance, OR ≥10 units in ARO trigger areas
- 10–20% of units must be affordable (AMI-based) OR in-lieu fee paid
- ARO trigger map changes — verify current boundaries with DPD at project start
- Student housing: ARO applicability varies — verify with DPD

### 3.9 Key Chicago Zoning Resources

| Need | Resource |
|---|---|
| Zoning map lookup | chicago.gov/zoning |
| Title 17 ordinance text | chicago.municipal.codes |
| DPD pre-application | chicago.gov/city/en/depts/dcd.html |
| ZBA applications | chicago.gov/zba |
| ARO calculator | chicago.gov/aro |
| Landmark status | chicago.gov/landmarks |

---

## 4. SUBURBAN CHICAGO — ZONING NOTES BY MUNICIPALITY

> Each suburb has its own zoning ordinance. Always obtain the actual ordinance and zoning map from the municipality — do not extrapolate from Chicago or neighboring suburbs.

| Municipality | Zoning Base | Notes |
|---|---|---|
| Evanston | Own code (IBC-influenced) | Unified Development Ordinance; mixed-use districts along transit corridors; Design Review Board for commercial projects |
| Oak Park | Own code | Village Zoning Board; conservative approach to density; historic district overlays in large portions of village |
| Skokie | Own code | Commercial corridor focus (Dempster, Golf); own amendments; verify parking minimums carefully |
| Naperville | Own code | City Plan Commission + City Council; suburban commercial zoning; PUD process for large projects |
| Rosemont | Own code | Heavy hospitality/commercial; Rosemont is a village with significant entertainment district; own building dept |
| Schaumburg | Own code | Township AHJ; large commercial parcels; parking-heavy code; verify setbacks for big-box adjacent projects |

**Protocol:** For any suburban Chicago project, request the municipal zoning ordinance and official zoning map as first step. Do not rely on secondary sources.

---

## 5. PITTSBURGH ZONING

> Pittsburgh Zoning Code is separate from building code (PA UCC). Administered by **City of Pittsburgh City Planning** (DCOS handles permits; Planning handles zoning).

### Key Facts
- Pittsburgh uses a traditional Euclidean zoning system with form-based overlay districts in some areas
- **Urban Neighborhood Commercial (UNC)** and **Neighborhood Commercial (NC)** are most common for AA project types
- **Golden Triangle / Downtown:** specific downtown zoning districts with higher FAR
- Historic districts: Pittsburgh has City-designated historic districts (Allegheny West, Mexican War Streets, etc.) — PHMC (PA Historic Preservation Office) involved for National Register properties
- Zoning appeals: Zoning Board of Adjustment (ZBA) — monthly hearings
- PUD/Special Exception process available for larger developments

### Parking
- Pittsburgh has its own parking minimums; many downtown parcels near transit have reductions
- Shared parking agreements common in dense neighborhoods

### Resources
- Pittsburgh Zoning Code: pittsburghpa.gov/dpw/zoning
- eBUILD portal: permits.pittsburghpa.gov (online permit submission)
- City Planning: pittsburghpa.gov/cp

---

## 6. IDAHO — ZONING NOTES

> Idaho has no statewide zoning law — each city and county administers its own code. Significant variation between urban (Boise) and rural/suburban AHJs.

### Boise
- City of Boise has a full zoning ordinance; relatively modern mixed-use districts
- **MX-2, MX-3** districts: mixed-use, multi-family permitted; FAR-based or form-based depending on area
- Design Review required for multi-family and commercial projects over certain thresholds
- Boise has adopted its own energy code (stricter than state baseline)
- Public Hearing / Planning & Zoning Commission for conditional uses and variances

### Other Idaho Municipalities / Counties
- Smaller cities and counties vary widely in sophistication of zoning codes
- Rural counties may have minimal zoning or only basic agricultural/residential distinctions
- **Verify with AHJ:** always contact the specific county/city building and planning department before issuing findings
- Idaho Div. of Building Safety (DBS) handles state building code — zoning is always local

---

## 7. PHOENIX / ARIZONA — WALKABLE URBAN (WU) CODE

> Relevant from the Indian School / Central Park project. Phoenix has a parallel zoning system for urban areas.

### Standard vs. Walkable Urban Code
- **Phoenix Zoning Ordinance (PZO):** traditional code for most of Phoenix
- **Walkable Urban (WU) Code (Chapter 13):** applies to specific Walkable Urban Areas (WUAs) designated by Council; form-based

### WU Code Structure
- Organized by **Transect Zones** (T3 through T6) — lower numbers = less dense
- Each transect zone has sub-designations (e.g., T6:HWR = High-Rise Residential in a Walkable Urban Area)
- **T6 districts:** tallest and most intense; height caps set by stipulation or overlay (e.g., 400 ft stipulated cap)
- Uses are organized by **use table** per transect; most commercial and residential uses permitted by-right in T5–T6

### Key WU Code Provisions
- **Build-to requirement:** buildings must be built to within a set distance of the street (typically 12 ft); enforces pedestrian-oriented frontage
- **Frontage compliance:** % of lot frontage that must meet build-to — typically 60–80%; relief from DRC required if not met
- **Ground-floor activation:** active uses required at grade in most T5–T6 zones
- **Parking:** minimums reduced or eliminated in WU areas; maximums may apply
- **Design Review Committee (DRC):** reviews all WU projects for compliance with form standards; NOT discretionary — compliance with standards is the test

### FAR and Height
- WU Code uses transect-based height caps, not FAR-based limits in all cases
- Verify per-site: some parcels carry specific height limits via stipulation or prior PD approval
- For projects under a Planned Unit Development (PUD) or specific plan, stipulations govern and may override base WU Code

### Critical Phoenix-Specific Flags
- **FAA Form 7460-1:** Required before final site plan for any building exceeding 200 ft AGL in Phoenix airspace; also triggered at lower heights near airports. File early — FAA review adds schedule risk.
- **Archaeology:** Phoenix Indian School campus and other areas have known archaeological sensitivity. Phase I cultural resources assessment may be required before grading permits. Coordinate with Phoenix Historic Preservation Office.
- **Public Plaza / Open Space:** WU Code and stipulations often require a minimum % of open space and/or a public plaza; verify per site
- **Stipulations:** Any prior rezoning, PD, or special permit carries recorded stipulations (conditions of approval). These govern the project and can be more restrictive than base zoning. Always pull the recorded stipulations from City of Phoenix records before issuing findings.

### Phoenix Resources
- Phoenix Zoning Ordinance: phoenix.gov/pdd/zoning
- WU Code (Chapter 13): phoenix.municipal.codes
- Phoenix Historic Preservation: phoenix.gov/pdd/historic
- Phoenix Planning & Development: phoenix.gov/pdd

---

## 8. NATIONAL / MULTI-JURISDICTIONAL — ZONING FLAGS

### 8.1 Federal Nexus Triggers

| Trigger | What It Activates | Note |
|---|---|---|
| Federal funding (HUD, FTA, FHA, etc.) | Section 106 (historic review) + NEPA environmental review | Coordinate with agency early; adds 6–18 months |
| Building >200 ft AGL | FAA Notice of Proposed Construction (Form 7460-1) | Must file before final design; obstruction determination required |
| Near airports | FAA Part 77 surfaces | Height limits independent of local zoning; verify for any project near airport |
| Wetlands / waterways | Army Corps Section 404 permit + EPA Section 401 | Triggers even if not in floodplain |
| FEMA floodplain | Flood elevation certificate + floodplain development permit | Verify FEMA FIRM panel for every site |
| Affordable housing tax credits | LIHTC QAP (state agency) + local ARO compliance | HFA allocates; design standards attached |

### 8.2 Historic Overlays — National

| Mechanism | Who Triggers | What It Means |
|---|---|---|
| National Register of Historic Places listing | Advisory only (no permit control) unless federal nexus | Section 106 review if federal money/permits involved |
| State Historic Preservation Office (SHPO) | Involved when federal nexus present | Reviews undertakings affecting NR-listed or eligible resources |
| Local Landmarks Designation | City/county landmarks commission | Requires certificate of appropriateness for exterior changes; legally binding |
| Historic District (local) | Local zoning overlay | Design review for contributing structures; standards vary widely |
| Section 106 | Federal agency + SHPO + consulting parties | Process, not a prohibition — alternatives and mitigation required |

### 8.3 Density Bonus / State Preemption

Several states have passed legislation preempting local zoning for certain uses — most commonly affordable housing and ADUs:

| State | Key Law | Effect |
|---|---|---|
| California | SB 9, SB 10, Density Bonus Law (Gov. Code §65915) | By-right multi-family in single-family zones; up to 50% density bonus for affordable % |
| Illinois | No broad preemption (as of April 2026) | Local zoning controls; Chicago ARO is local |
| Arizona | HB 2011 (2023) | Allows multi-family in commercially zoned areas; verify local implementation |
| Idaho | Limited preemption | No broad housing preemption; local control dominant |
| Pennsylvania | No broad preemption | Local zoning controls; MPC governs process |

> **Always check current state law at project kickoff.** Housing preemption legislation is rapidly evolving — verify with land use counsel for any project where state preemption may apply.

---

## 9. ZONING ANALYSIS OUTPUT FORMAT

Use this structure for all zoning analysis memos:

```
## ZONING FINDING: [Topic / Site]
**Jurisdiction:** [City, State]
**Zoning District:** [Confirmed district + source]
**Date Confirmed:** [Date of map/official confirmation]

**Permitted Use:** [By-right / Conditional / Not permitted]
**FAR Allowed:** [X.X] | **FAR Proposed:** [X.X]
**Height Allowed:** [X ft / stories] | **Height Proposed:** [X ft / stories]
**Setbacks:** [Front / Rear / Side — allowed vs. proposed]
**Parking Required:** [X spaces] | **Parking Proposed:** [X spaces]

**Entitlement Required:** [None / ZBA variance / Special Use / PD / PUD / Other]
**Process & Timeline:** [Summary]

**Open Issues / AHJ Verification Required:**
- [Item 1]
- [Item 2]

**Special Flags:**
- [ ] Federal nexus (Section 106 / NEPA)
- [ ] FAA height trigger (>200 ft AGL)
- [ ] Floodplain / wetlands
- [ ] Historic district / landmark
- [ ] Affordable housing requirement
- [ ] State preemption may apply

**Architect of Record Note:** [Flag if AOR or land use attorney determination required]
```

---

## 10. COMMON ENTITLEMENT PROCESS TIMELINES

| Jurisdiction | Process | Typical Timeline |
|---|---|---|
| Chicago | Planned Development (PD) | 6–18+ months |
| Chicago | ZBA Variance / Special Use | 3–5 months |
| Chicago | Administrative Adjustment (minor) | 4–8 weeks |
| Chicago | Simple zoning confirmation letter | 2–4 weeks |
| Pittsburgh | Zoning Board of Adjustment | 2–4 months |
| Pittsburgh | Special Exception | 3–5 months |
| Boise | Conditional Use Permit | 2–4 months |
| Phoenix | DRC review (WU Code) | 6–10 weeks |
| Phoenix | City Council rezoning / PD | 6–12 months |
| Suburban Chicago | Varies widely by municipality | 2–6 months typical |

> These are typical ranges. Contested applications, political opposition, or incomplete submissions add time. Always build contingency.

---

## 11. SCOPE BOUNDARIES — WHAT AA DOES AND DOESN'T DO

**AA provides (with this knowledge base):**
- Zoning district confirmation and permitted use analysis
- FAR, height, setback, and parking calculations
- Identification of required entitlement process
- Code comparison across jurisdictions
- Preliminary feasibility memos for design team and owner

**AA does NOT provide:**
- Legal representation before ZBA, Plan Commission, or City Council
- Land use attorney services (entitlement strategy, hearing advocacy)
- NEPA or Section 106 documentation (consultant required)
- FEMA elevation certificates (licensed surveyor required)
- FAA aeronautical study filings (owner/consultant required)
- SHPO consultation coordination (historic consultant or land use attorney)

**Flag to client at project kickoff** when any of the above are in scope — they require separate contracts with qualified consultants.
