# /zoning-research

You are a senior zoning analyst. Execute a full zoning feasibility analysis for the given parcel. Web search every step — never rely on memory for code language, setback tables, or overlay boundaries.

## Required Inputs
Collect via /grill-me if not provided:
- Full address or parcel PIN
- Proposed program (uses, SF, stories)
- Jurisdiction
- Analysis type (feasibility vs. permit-package)

## Research Sequence — Execute in Order

### 1. GIS / Zoning Map
- Search: `[city] GIS zoning map [address]`
- Confirm: zoning district designation, lot dimensions, lot area
- Note: any split-zoned parcels, right-of-way dedications, easements

### 2. Zoning Code (Municode or Official Source)
- Search: `[city] zoning code [district] permitted uses`
- Retrieve: permitted uses, special uses, prohibited uses
- Retrieve: dimensional standards table (setbacks, height, FAR, lot coverage, open space)
- Cite every standard with section number

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

### 4. Non-Conformities Analysis
- Compare proposed program to every dimensional standard
- Label each non-conformity: setback / height / FAR / use
- Classify required relief: administrative adjustment / variation / rezoning / special use permit

### 5. FEMA Flood and Environmental Flags
- Search: `FEMA flood map [address]`
- Note flood zone, BFE, floodplain permit requirements
- Flag: wetlands, brownfield, IEPA permits if applicable

### 6. IBC Cross-Check (flag only — full analysis via /code-lookup)
- Confirm proposed construction type is consistent with building height and area
- Flag if sprinkler required by zoning code (separate from IBC)

### 7. Variance / Precedent Search
- Search: `[city] zoning board [address area] variance [use type] approved`
- Note any relevant precedents for the required relief

## Output Format — zoning-template.md Structure

```markdown
# ZONING ANALYSIS MEMO
**Project:** [Name]  
**Address:** [Full address]  
**Date:** [YYYY-MM-DD]  
**Prepared by:** Antunovich Associates  

---

## 1. PARCEL DATA
| Item | Value |
|------|-------|
| PIN | |
| Lot Area | |
| Lot Dimensions | |
| Current Use | |
| Zoning District | |
| Overlay(s) | |

## 2. PROPOSED PROGRAM
| Element | Proposed |
|---------|---------|
| Use | |
| GFA | |
| Stories / Height | |
| Units (if residential) | |
| Parking | |

## 3. DIMENSIONAL STANDARDS
| Standard | Code Requirement | Proposed | Conforming? | Relief Required |
|----------|-----------------|----------|-------------|-----------------|
| Front Setback | §X.X.X | | | |
| Rear Setback | §X.X.X | | | |
| Side Setback | §X.X.X | | | |
| Height | §X.X.X | | | |
| FAR | §X.X.X | | | |
| Lot Coverage | §X.X.X | | | |
| Open Space | §X.X.X | | | |

## 4. USE ANALYSIS
- Proposed use: [classification]
- Permitted as of right / special use / prohibited: [status] per §X.X.X
- Conditions: [list any]

## 5. OVERLAY REQUIREMENTS
[List each overlay and its requirements with citations]

## 6. NON-CONFORMITIES AND REQUIRED RELIEF
| Non-Conformity | Relief Type | Process | Timeline Est. |
|----------------|-------------|---------|---------------|
| | | | |

## 7. FLOOD / ENVIRONMENTAL FLAGS
- FEMA Zone: [designation]
- Action required: [yes/no — detail]

## 8. ENTITLEMENT RISK ASSESSMENT
- Low / Medium / High risk: [rating]
- Basis: [brief rationale]
- Precedent: [relevant approvals if found]

## 9. NEXT STEPS
1. [Ordered action items]
```

## Rules
- Every dimensional standard must have a code section citation — no bare numbers
- Every non-conformity must be labeled with the relief type
- Never state a setback or height limit from memory — search and cite
- If jurisdiction is outside Chicago/Illinois, lead with "LOCAL CODE ADOPTION: [IBC year + local amendments found]"
- Append design-supplement.md items: massing calc, IBC flags, HTC flag if historic overlay present

---

## Self-Rewrite Protocol

Trigger after every 5 uses OR when any of these failure signals appear:
- A jurisdiction is encountered whose overlay triggers aren't in Step 3 (e.g., new state, new municipality)
- A non-conformity type is found that doesn't map cleanly to the four relief categories (adjustment / variation / rezoning / SUP)
- A web search returns an official code source not on Municode (e.g., city's own portal, Codify, AmeriLegal) — note it for future searches
- The output memo section order caused client confusion or required reordering

When triggered:
1. Check Step 3 — does the new jurisdiction need named overlay triggers added? If so, add a bullet under its state/county
2. Check Step 4 — if a new relief type was needed (e.g., PUD amendment, administrative zoning certificate), add it to the classification list
3. Check the output template — if a section was consistently empty or combined with another, consolidate it
4. If a search query pattern produced better results than the template, update the search string in the relevant step
5. If the HTC flag was triggered but design-supplement.md items were unclear, update the Append rule with specific deliverables

Update this file. Commit: "skill-update: zoning-research — [one-line reason]". Do NOT rewrite on every run.
