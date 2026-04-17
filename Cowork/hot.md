---
type: meta
title: "Hot Cache"
updated: 2026-04-08T19:00:00
tags:
  - meta
  - hot-cache
status: evergreen
related:
  - "[[index]]"
  - "[[log]]"
  - "[[Wiki Map]]"
  - "[[getting-started]]"
  - "[[claude-obsidian-v1.4-release-session]]"
---

# Recent Context

Navigation: [[index]] | [[log]] | [[overview]]

## Last Updated
2026-04-08: v1.4.1 hotfix shipped, plugin confirmed installed and enabled

## Plugin State
- **Version**: 1.4.1 (installed, enabled, user scope)
- **Install ID**: `claude-obsidian@claude-obsidian-marketplace`
- **Releases**: v1.1, v1.4.0, v1.4.1 on GitHub
- **Skills**: 10 (wiki, wiki-ingest, wiki-query, wiki-lint, save, autoresearch, canvas, defuddle, obsidian-bases, obsidian-markdown)
- **Hooks**: 4 (SessionStart, PostCompact, PostToolUse, Stop)
- **Multi-agent**: bootstrap files for Codex, OpenCode, Gemini, Cursor, Windsurf, GitHub Copilot

## Install Command (Correct Two-Step Flow)
```bash
claude plugin marketplace add AgriciDaniel/claude-obsidian
claude plugin install claude-obsidian@claude-obsidian-marketplace
```

There is no `claude plugin install github:owner/repo` shortcut. Both steps are required. Full session note: [[claude-obsidian-v1.4-release-session]].

## Recent Release Cycle (v1.1 → v1.4.1)
- **v1.1**: URL ingestion, vision ingestion, delta tracking manifest, 3 new skills (defuddle, obsidian-bases, obsidian-markdown), multi-depth query modes, PostToolUse auto-commit, removed invalid `allowed-tools` frontmatter field
- **v1.4.0**: Dataview to Bases migration (new `wiki/meta/dashboard.base`), Canvas JSON 1.0 spec completeness, PostCompact hook, Obsidian CLI MCP option, 6 multi-agent bootstrap files, 249 em dashes scrubbed, security git history rewrite to remove placeholder email
- **v1.4.1**: hotfix for wrong plugin install command syntax in README and install-guide.md

## Key Lessons (Recent)
1. Plugin install is always two-step: `marketplace add` then `install plugin@marketplace`
2. `allowed-tools` is NOT valid in skill frontmatter. Use only `name` and `description` (kepano convention).
3. Obsidian Bases uses `filters/views/formulas`, not Dataview `from/where`
4. Canvas edges have asymmetric defaults: `fromEnd="none"`, `toEnd="arrow"`
5. Hook-injected context does not survive compaction. PostCompact hook is required to restore hot cache.
6. `git filter-repo` needs two passes: `--replace-text` for blobs, `--replace-message` for commit messages

## Style Preferences (Saved to Memory)
- **No em dashes** (U+2014) or `--` as punctuation anywhere. Use periods, commas, colons, or parentheses. Hyphens in compound words are fine (auto-commit, multi-agent).
- Keep responses short and direct. No trailing "here's what I did" summaries.
- Parallel tool calls when independent.

## Ecosystem Research (Done 2026-04-08)
16+ Claude + Obsidian projects mapped. Full feature matrix at [[claude-obsidian-ecosystem]]. Prioritized backlog at [[cherry-picks]]. Top competitors: [[Ar9av-obsidian-wiki]] (multi-agent + delta tracking), [[rvk7895-llm-knowledge-bases]] (multi-depth query), [[ballred-obsidian-claude-pkm]] (goal cascade + auto-commit), [[kepano-obsidian-skills]] (authoritative Obsidian skills from Obsidian's own creator).

## Code Compliance Knowledge Base (Added 2026-04-16)

Two AA gold-standard projects ingested as code compliance reference corpus:

**[[orrs-jewelers-pittsburgh]]** — Luxury retail TI, Pittsburgh PA, 2018 IBC
- M+B+S-1 mixed occupancy, Type 3-B sprinklered, 10,927 SF, 135 occ
- Mezzanine 1,484 SF: not accessible (under 3,000 SF exception)
- Partition C60: 2-HR, STC 56. NFPA 13-2016 light hazard, Viking QR concealed heads

**[[middle-eight-franklin-tn]]** — Multi-family new construction, Franklin TN, 2018 IBC
- 222 units, 3 buildings (V-A wood, 4 stories) over 2-level parking podium (I-A concrete), 350 spaces
- IBC 510.2: 3-HR horizontal separation — each residential building treated as independent
- V-A sprinklered: max 4 stories / 70' / 36,000 SF per floor
- All shafts (stair, elev, trash, refrigerant): 2-HR. Corridors: 0.5-HR. Units: 1-HR demising
- A2L refrigerant mandate (2025): 2-HR shafts around all refrigerant lines — UL U437 at horiz transfers
- Draftstops in V-A wood attic: 3,000 SF max or above every 2 units, whichever smaller
- NFPA 13 throughout (not 13R). Balcony sprinklers required for Type V per IBC 903.3.1.2.1
- Franklin TN zoning: R4 base, PD 38.19/3000 overlay, Historic Preservation + Flood Fringe overlays

Concepts extracted: [[multifamily-podium-construction-ibc]], [[ibc-510-horizontal-building-separation]]

**[[gibsons-tavern-chicago]]** — High-end restaurant TI, Chicago IL, 2019 CBC
- A-2 assembly (change of occ. from M), Type 1A, 14,666 RSF, 378 occ, 4 exits
- PD #1510 minor change required (MOPD approval before permit)
- Fire separations: UL U408, 465, 411, 415B, G586
- Radiant floor heating + LW concrete topping + XPS insulation in FOH dining
- No drinking fountains required (water served tableside per 18-29-410.1)

Concepts extracted: [[mixed-occupancy-ibc-retail]], [[chicago-a2-restaurant-code-compliance]], [[tenant-improvement-fire-separations]], [[mezzanine-accessibility-exception]], [[chicago-planned-development-change-of-occupancy]], [[restaurant-floor-assembly-radiant]]

---

**[[driehaus-museum-chicago]]** — Historic museum renovation + 6th floor addition, Chicago IL, 2019 CBC + CBRC 2018
- A-1 Assembly (B-Level through L4, museum) + B Business (L5-6, foundation offices), non-separated
- Type I-A, 6 stories, DX-12 zoning
- **HIGH-RISE:** IBC 403 triggers at 81'-7" occupied floor height (L5). Requires: smoke detection, voice comm, Class I standpipe, fire command center, emergency/standby power
- CBRC 2018 dual-applied with CBC: existing fire escape used per 14R-3-307.1.2; Stair #2 excluded (access easement, Doc #317535157)
- Chicago Landmarks: Level 6 addition east face requires CCL approval before permit — thin brick used for Landmarks-compatible differentiation
- NFPA 13 new on L5+L6 only; existing system below
- L5: 4,592 SF, 46 occ; L6: 4,780 SF, 81 occ total; L5+6 combined: 127 occ
- Fire separations: 2-HR shafts (UL #453/#411 sim.), 1-HR corridors (UL #465 sim.)

Concepts extracted: [[chicago-historic-building-renovation-code]]

**[[dac-626-s-wabash-chicago]]** — New construction high-rise residential, Chicago IL, 2019 CBC, IFC 12/19/2025
- R-2 (L4-L17) + S-2 parking (L2-L3) + M + B (L1) + A-3 amenities (L17-L18), mixed occupancy
- Type I-A, 19 stories, 217'-6", DX-12, 164 units, avg 783 SF/unit, typical floor 10,705 GSF
- **HIGH-RISE:** IBC 403 full scope — NFPA 13 throughout, quick-response at DUs, voice comm, Class I standpipe, fire command center, emergency/standby power, fire service elevator
- Type I-A + 403.2.1.1 sprinkler reduction: primary frame + columns = 3 HR (no reduction); bearing walls = 2 HR; shaft enclosures reduced 2 HR to 1 HR (except stairways + elevators)
- R-2 to S-2 separation: 3 HR (Table 508.4 + 406.2.8 co-applicable)
- DX-12 zoning: FAR 12.0, no setbacks, no height limit; TSL parking: 0.275/DU × 164 = 45 required (64 provided)
- Stair remoteness: 30 ft or 1/4 diagonal (sprinkler exception); corridors: R-2 with >10 occ = 1 HR

Concepts extracted: [[chicago-high-rise-residential-type-ia]]

**[[vista-370-n-morgan-chicago]]** — New construction high-rise residential, Fulton Market Chicago IL, 2019 CBC, IFC 02/27/2025
- R-2 (L5-L29, 494 units) + S-2 (L2-L4) + M + B (L1) + A-3 (L5, L30-L31)
- Type I-A, 31 stories, 356'-2", PD 1578 Sub-Area C (FAR 14.0, max height 380')
- **ARO:** 20% affordable (~99 units), all affordable = MOPD Type A (fully accessible)
- **MOPD:** 20% market-rate units = Type A, 80% = Type B; MOPD meeting minutes in permit package
- **FHA Amendment 7:** all units comply; Illinois Accessibility Code (ILAC) also applies
- **EV charging:** 20% installed + 80% conduit-ready per Illinois Vehicle Charging Act (new 2025 requirement)
- **Bike parking:** 494 spaces (1:1 per DU — PD condition, not CZO formula)
- **Parking:** 190 spaces (PD-specific ratio, 4 accessible); no TSL reduction — governed by PD
- IBC code stack identical to DAC (Type I-A, 403.2.1.1 reduction, NFPA 13, R-2/S-2 = 3 HR)

Concepts extracted: [[chicago-aro-affordable-housing-multifamily]]

**[[hines-1200-diehl-naperville]]** — New construction mid-rise residential, Naperville IL, **2018 IBC** (not Chicago CBC), IFC 11/21/2025
- R-2 (306 units) + A-3 + B (L1); S-2 existing garage = separate building
- **Type III-B**, 5 stories, 64'-0" — NOT high-rise (below 80' threshold), no IBC 403
- **Fire wall (3 HR)** splits R-2 building into East + West to comply with Type III-B area limits (47,526 SF/floor max)
- Fire wall doubles as **horizontal exit** — avoids elevator standby power requirement (WJE memo May 2025)
- **Partitions: 1/2 HR** throughout DU demising + corridors (Type III-B + NFPA 13 sprinkler exceptions)
- R-2 to S-2 separation: **1 HR** (vs. 3 HR in Chicago) — 2018 IBC, separate building
- **NFPA 13** (not 13R) required — building height 64'-0" exceeds 13R max of 55 ft
- Elevator hoistway: smoke curtain (UL 1784 M-200) vs. pressurization or enclosed lobby
- **IAC 20% adaptable** (62 units) + 2% Type A (7 units) — no MOPD, no ARO, no Chicago requirements
- Parking: 1.6/unit (~490 spaces); bike: 10% of vehicle = 80 spaces

Concepts extracted: [[type-iii-b-multifamily-5story]]

**[[ejss-beit-midrash-brooklyn]]** — Interior design renovation, Brooklyn NY, NYCBC (not IBC), ID-only scope
- Edmond J. Safra Synagogue, 2085 Ocean Pkwy, Brooklyn NY. Owner: Vista Property Group. GC: Promont.
- Third floor Beit Midrash (308) + Mezzanine (401): custom WD-101 millwork bookshelves (types A-G), Torah Ark chamber (sliding pocket panels), new delegated-design steel stair (tile tread/riser)
- Guardrail: 42" AFF, PT-101 Venetian plaster base, ST-101 granite sill, 5/8" laminated tempered glazing
- Flooring: TL-101/102 tile at 45° diagonal, TCNA F125-FULL mortar bed
- Ceiling: painted GWB PT-101 + 8" plaster moulding; stagger removed per RFI #14 (as-built limitation)
- Lighting: Element LED recessed (F1/F2/F1A/F2A), Lumilum neon strip (F5), custom sconces (F7/F8), Ner Tamid pendant (F9)
- FEC: Larsen's Occult series, fully recessed, brass, solid door
- Column spray-on fireproofing: remain intact; millwork piers build around
- AA role is ID-only: no code matrix, NYC-licensed professionals file permit package separately

Concepts extracted: [[religious-assembly-id-renovation]]

**[[rmhc-211-e-grand-chicago]]** — Institutional A-2 TI in Type I-A high-rise, Chicago IL, 2019 CBC
- Ronald McDonald House Near Lurie Children's Hospital, 211 E Grand Ave, Chicago IL 60611
- Owner: RMHC Chicagoland. GC: Bulley & Andrews. Kitchen consultant: Hill Mechanical.
- Existing 16-story Type I-A, DX-12, HIGH-RISE (IBC 403). Floor 3 only = A-2 dining (116 occ, down from 145).
- Self-cert building permit (CSK #001-014546); sprinkler rework is deferred submittal (separate permit)
- **0 HR corridors:** A/B/S occupancy + sprinklers + occ load <300 per Table 1020.1. Floor 3 at 116 occ = 0 HR.
- 2 exits: 36" doors (240 cap) + 44" stairs (220 cap). Required = 58 occ.
- Custom millwork: Breakfast & Coffee Bar (P-lam + solid surface + 1" steel pipe shelving); Family Kitchen island (2 sinks, 2 microwaves, 2 dishwashers, water column tap, pull-up bar seating); Family Kitchen station (2 ranges + 2 ovens, exposed hood); Dining buffet island (SS top, equipment shell + sneeze guards)
- Pass-thru windows: CRL Laurence Fawn (10'W) + Daisy (5'W)
- Lockers: 52 total, Hollman 4-tier
- Lighting: H.E. Williams LED downlights (F1/F1a), Muuto Ambit pendants (F3/F6), Cali cove (F7)
- Ceilings: PT-105 GWB 9'-6" AFF typical; drapery coves at dining + lounge; open to structure at kitchen hood

Concepts extracted: [[chicago-self-cert-permit]]

**[[depaul-basketball-practice-facility]]** — New construction Type II-A institutional/athletic, Chicago IL, 2019 CBC
- DePaul University Basketball Practice Facility, 2300 N. Sheffield Ave, Chicago IL 60614 (PD-2, Lincoln Park)
- Owner: DePaul University. Design Arch: HNTB. EOR: AA (JMA #01-8622). GC: Bulley & Andrews. Structural: Thornton Tomasetti. Aquatic: Counsilman-Hunsaker.
- 4 stories, 66'-0", 66,000 SF. **Type II-A.** NOT high-rise (under 80' threshold, no IBC 403). NFPA 13 throughout.
- Occupancy: A-3 (gymnasiums, no spectator seating) + B (higher ed offices). Mixed occ. separation = 2 HR (footnote h: A-3 agg. occ. ≥ 300).
- Type II-A ratings: 1 HR primary frame + floors; 0 HR roof (all roof construction >20' above floor below); 0 HR interior non-bearing walls.
- Shafts + exit stairs = 2 HR. Fire barriers (A, B) = 2 HR. Incidental: telecom >50 SF = 2 HR; storage >100 SF = 1 HR; boiler/furnace = 2 HR.
- Structure: belled caissons + steel + composite metal deck + CIP shear walls + steel braced frames for lateral
- Exterior: L1-L2 brick veneer/CMU backup + punched aluminum windows; L3-L4 aluminum curtainwall + ACM
- IDPH pool/spa review (separate from city permit): 3 rounds of IDPH submissions. Counsilman-Hunsaker: hot Swimex + cold Swimex spas.
- MOPD meeting minutes in permit package (institutional A-3 accessibility, not residential ARO)
- Design architect + EOR model: HNTB leads design intent; AA stamps and owns code compliance/CDs/CA

Concepts extracted: [[type-iia-institutional-athletic]]

**[[brickworks-49-21st-pittsburgh]]** — New construction mixed-use rental, Pittsburgh PA Strip District, 2018 IBC
- 49 21st Street, Pittsburgh PA 15222. Owner: MI Strip Works LLC (Chicago). GC: P.J. Dick. MEP/FP: CJL Engineering. ID: raSMITH.
- 6 stories, 66'-8", 130 rental units + 17,026 SF retail + 16,447 SF parking. 2018 IBC (Pennsylvania). No Chicago CBC, no ARO, no MOPD, no IAC.
- **DUAL CONSTRUCTION TYPES:** Type I-A at Level 1 (SFRM on structural steel + underside of metal deck, 2 HR bearing walls) / Type III-B at Levels 2-6 (wood frame, 2 HR exterior bearing walls, 0 HR interior structure).
- L1 program: parking (83 spaces, S-2) + retail + lobby/leasing/B + **10 ground-floor residential units** (101-110, units in Type I-A zone).
- L2 amenity floor: pool (875 SF) + fitness (A-3, 679 SF) + amenity terrace (A-3 outdoor, 3,175 SF) + library (A-3, 514 SF) + 24 DUs.
- L3-5: 26 DUs/floor, 11'-0" height, 24,733 SF gross. L6: 18 DUs, 10'-8" height, terrace.
- Unit mix: 130 DUs avg. 887 SF — Studio 10%, Jr. 1-Bed 13%, 1-Bed 34%, 1-Bed+Den 13%, 2-Bed 22%, 2-Bed+Den 3%, 3-Bed 5%.
- Type A: Units 301, 422, 615, X04 (min. 2% per IBC 1107). Type B: all others (FHA elevator bldg.).
- Bike: 27 protected (Pittsburgh req: 1 per 3 DUs, 60% protected). No TSL, no CZO formula.
- Exterior (L2-6): brick + rigid insulation 2" + 2×6 wood frame + batt R-20. Exterior (L1): 8" CMU + brick + rigid 2". Main roof: tapered rigid R-30.
- Building efficiency: 85.9% overall; 90.5% typical L3-6. Avg unit: 887 SF.

No new concept page — this project extends existing concepts: [[multifamily-podium-construction-ibc]] (Type I-A podium variation) and [[type-iii-b-multifamily-5story]] (Pennsylvania vs. Chicago III-B).

---

**[[566-west-van-buren-chicago]]** — New construction high-rise residential, West Loop Chicago IL, 2019 CBC, IFC 09/02/22

14 stories, 153'-2" (HIGH-RISE, IBC 403 full scope). DX-7, FAR 7.0, 26,811 SF lot. GC: Lendlease. Structural: Thornton Tomasetti. 198 R-2 units + S-2 parking (L2) + A-3 amenities (L14) + M retail + B leasing (L1).

**CONSTRUCTION TYPE:** Type I-A + 403.2.1.1 I-B reduction. Primary frame + columns: 3 HR (no reduction per 403.2.1.1). Bearing walls: 2 HR. Floors: 3 HR primary (PT/reinforced concrete slab = part of primary structural frame) / 2 HR secondary. Roof: 1 HR. Shaft enclosures: 1 HR (stair + elevator hoistways excluded from reduction). SFRM: 430 psf bond strength (up to 400').

**HIGH-RISE (IBC 403):** NFPA 13; fire service elevator (1 min, 3,500 lbs); fire command center; standby + emergency power; smoke removal; voice comm one-way + two-way combined; auto smoke detection 907.2.12.1; Class I standpipe; areas of refuge NOT required (sprinkler exception).

**MIXED OCCUPANCY:** R-2/S-2 = 3 HR (406.2.8 + Table 508.4); A-3/R-2 = 1 HR; A-3/B = 2 HR; S-2/B/M = 1 HR. R-2 corridors (>10 occ) = 1 HR; dead ends 50' (sprinkler); A/B/M/S corridors = 0 HR.

**PARKING (S-2, L2):** 75 enclosed (residential only), 3 accessible (51-75 space range), 7'-0" clear, EV charging.

**MOPD:** 20% Type A (41 units, stacked). Type B all others (FHA). No ARO in permit documents. ICC A117.1-2009 + 2018 IAC + ADA 2010.

**UNIT MIX:** 22 Studio (11%) + 44 JR 1BED (22%) + 44 1BED (22%) + 55 1BED+DEN (28%) + 33 2BED (17%) = 198; avg 759 SF; 89% efficiency.

**UNIT FINISHES (AA pattern):** Shaw Contract LVT 6"×48" direct glue; Daltile Patriotic Calacatta OQ47 3CM quartz counters; Quest Supermatte thermafoil cabinets (Stratus upper/Midnight 3DL lower); Kohler Purist matte black bath fixtures throughout; Kohler Elate matte black accessories; Platform Surfaces 12"×12" white glossy stacked kitchen backsplash; Virginia Tile Atlas Concord 12"×24" bath floor; Ceramic Technics Blue Rock 4"×12" bath walls.

**PARTITION LIBRARY:** A40 (1HR/STC45/UL465) R-2 corridors; F50/F60 (1HR/STC59-61/UL U493) shaft walls; C40 (2HR/STC55/UL411) fire barriers; K40/K60 (2HR/UL415B) stair + elevator enclosures; Z30 (2-4HR CMU, UL U905) service rooms.

Concepts extracted: [[chicago-high-rise-residential-unit-specification]]

---

**[[academy-tower-greenville-sc]]** — New construction high-rise residential + townhouse base, Greenville SC, 2021 IBC (not CBC), IFP 07/27/23

19 stories + mezz, 230'-2" (HIGH-RISE, IBC 403 full scope). C4 zoning, no FAR, no height limit, no setbacks. CBD Design Review Board. GC: Brasfield & Gorrie. Structural: I.C. Thomasson. AA = architect + interior designer. 248 DU including 5 townhouses (TH1-TH5) at L1-L5 base facing College St. + standard units L7-L16 + penthouse L17-L19. L6 = full amenity floor.

**CONSTRUCTION TYPE:** Type I-A + 403.2.1.1 I-B reduction. Primary frame + columns: 2 HR (columns NOT reduced per 403.2.1.1). Bearing walls: 2 HR. Floors: 2 HR. Roof: 1 HR. Shaft enclosures: 1 HR (stair + elevator hoistways NOT reduced per 403.2.1.2).

**HIGH-RISE (IBC 403, 2021):** NFPA 13; **2 fire service elevators** (3,500 lbs each); fire command center (200 SF / 10' dim / 1 HR); standby + emergency power; smoke detection 907.2.13.1; voice/alarm comm; radio coverage (IFC 510); **ALL required interior exit stairways = smokeproof enclosures** (403.5.4) -- alternative: stair pressurization 0.10-0.35" WC per 909.20.5; with NFPA 13, vestibule NOT required. Areas of refuge NOT required (sprinkler + R-2 exception).

**CRITICAL DIFFERENCES vs. CHICAGO CBC:**
- R-2/S-2 separation: **1 HR** (IBC 508.4) -- not 3 HR (CBC adds 406.2.8)
- R-2 corridors: **1/2 HR** (Table 1020.1, sprinklered) -- not 1 HR (CBC Title 14B, >10 occ)
- Smokeproof enclosures: ALL stairways (403.5.4) -- CBC is conditional
- Fire service elevators: 2 required here -- Chicago standard = 1
- Accessibility standard: ICC A117.1-**2017** -- Chicago uses 2009
- Type A: 2% only (5 units at L6/9/12/15/18 stacked) -- no MOPD, no IAC, no ARO

**TOWNHOUSE PATTERN (1019.3 Ex. 2 + 1011.5 Ex. 3 + 1107.7.2):** Internal stair not enclosed (R-2 ≤4 stories exception); unit stair dimensions 7-3/4"/10"; Type B exemption for DUs not served by elevator.

**PARKING:** 410 spaces; 10 accessible (2 van) per Table 1106.1 (401-500 = 9 required); 7'-0" clear.

**UNIT FINISHES:** Shaw Contract LVT Branching Out Riverside Oak (same product for units + amenity LVT-01); Daltile OQ21 Kodiak quartz counters; Richelieu U129 Nero base cabinets; Delta Tetra stainless bath accessories; Kohler Parallel brushed nickel bath faucet; American Standard Cadet 3 toilet; Frigidaire appliances.

**AMENITY FINISHES:** De Gournay Portobello Gold Guild custom wallcovering at lobby; Holly Hunt New Buffalo tufted column wrap; Chemetal 310 Antique Brushed Brass metal band; Daltile Carrara White marble countertop (SS-01); Spartan Surfaces rubber fitness floor (RU-01); Q-30 Niza Clay rubber tile lobby floor (TL-01).

Concepts extracted: [[ibc2021-high-rise-residential-code-pattern]]

---

**[[ffc-old-town-chicago]]** — Interior TI renovation, Fitness Formula Clubs, 1235 N. LaSalle St., Chicago IL (Old Town), 2018 IBC, IFC 03/24/2021

2-story existing building. AA role: Architect only — no MEP engineer. GC hires D/B structural engineer for all wall openings (AA provides opening width + post locations; GC designs shoring, posts, beams, connections).

**LOCKER ROOM RENOVATION:** New tile over existing tile — TCNA TR712-09 (floor) + TR713 (wall). Waterproofing/crack isolation membrane under all new tile. Epoxy grout required at shower room walls and floor (both men's and women's). Schluter edge trim at all tile transitions. Mirror mounting: 1/4" polished plate glass, mastic adhesive, anodized aluminum J-bead top and bottom screwed to every stud, min. 3/8" overlap at top, silicone seal at bottom.

**MILLWORK PATTERN (MWK.05-07):** Towel drops (MWK.05/08) — 4"×2"×1/4" TS hot dip galvanized steel base on 1/2" non-shrink grout + 3/4" expansion bolts; PLM.4 Wilson Art River Cherry 7937-38 P-Lam doors with SSL channel edge protection; CTR.1 2CM stone top with 12" dia. polished towel drop opening; magnetic touch latches. Counters (MWK.06) — CTR.1 2CM stone top + 2CM apron + GWT.1 3"×6" Monocibec Modern Beige glass tile backsplash + 1/4" mirror to ceiling on J-bead + custom linear mirror light. Lavatory counter (MWK.07) — adds Kohler K-2214 Ladena undermount vitreous china sink + 3.5" polished grommets for hair dryers + 2'-10" AFF max counter height.

**FINISHES:** PWt.1 12"×24" Virginia Tile Tomei Mink Natural (offset pattern); GWT.1 3"×6" Monocibec Modern Beige glass tile; CTR.1 2CM square-edge polished stone.

**SCOPE FRAMING:** Floor tile = owner NIC. Glass shower stalls = owner purchases, installs; GC provides blocking + offloading. Plumbing: replace all hot + cold supply to locker rooms with copper (in GC bid, no MEP engineer).

**NEW FITNESS SPACE:** Spin Studio (107) + Racquet Ball Court (108) merged. D/B structural for wall openings. Light gauge box beam at Level 2. Subfloor fill in corridors. VWB.2 rubber vented base + VWB.3 vinyl wall protection at new fitness space.

Concepts extracted: [[fitness-locker-room-renovation]]

---

**[[lennar-1657-shermer-northbrook]]** — New construction multi-family rental, Northbrook IL (Quarterra/LMC — Lennar's multifamily brand)

**WRAP TYPOLOGY — the defining feature:** 5 stories of Type III-B wood frame residential apartments wrap around a Type I-A precast concrete parking garage interior core at ALL 5 levels simultaneously. Not a podium — the garage occupies the building's interior core from Level 1 through Level 5. Residential units exist at every floor alongside the garage.

Code basis for adjacent condition: IBC 705.3 Exception 2 — S-2 garage (Type I-A) on same lot as R-2 with no fire separation distance: openings in S-2 wall require 1.5 HR; R-2 wall facing garage needs NO opening protectives.

**Area compliance — 3 fire wall sub-buildings:** Full building footprint exceeds Type III-B allowable 33,696 SF/floor. Three 3-HR fire walls split into: West (29,951 SF) + NE (25,487 SF) + SE (25,847 SF). Each sub-building recalculates frontage increase independently.

**Project data (Sub-Area A LMC):** 5 stories, 64'-0" (not high-rise), 318 units, 962 SF avg, 574 parking (506 enclosed + 68 surface), 77% building efficiency, 84% typical floor. Sub-Area B (HODC, affordable): 4 stories, 48 units. Retail outparcel: 6,590 SF.

**Fire ratings:** III-B: 0 HR structure/floors, 2 HR exterior bearing, 2 HR shafts, 1/2 HR unit demising + corridors (NFPA 13 exception). I-A garage: 3 HR frame/bearing, 2 HR floors. Exterior walls < 30 ft from property line: 1 HR (Table 602).

**Accessibility (suburban IL, 2018 IBC):** IAC 20% adaptable (64 units); IBC 2% Type A (7 units, stacked at 7 column positions); FHA Type B all others. No ARO, no MOPD, no TSL.

**Jurisdiction:** Northbrook IL (VGRC zoning, FAR 0.65) — 2018 IBC with Northbrook amendments; not Chicago CBC.

Concepts extracted: [[type-iiib-residential-wrap-garage]]

---

**[[aia-best-practices-collection]]** — AIA Practice Management (8 BPs, Lough + Schinnerer)

SD/DD phase checklists (BP 12.03.01/02): SD = representative area plans generally fixed + outline specs; DD = plans graphically complete + typical wall sections at 1/2" or 3/4" + all riser diagrams complete; DD docs may serve as permit submittal.

Less Rework (BP 12.01.03 — Approach 3): typical residential floor plan must be graphically complete (dimensionally fixed) at end of SD. Structure gridlines + column sizes + MEP risers + exterior envelope must all be committed in SD. At DD start, the typical floor is a known quantity; DD focuses only on non-typical floors.

CA risk (BP 11.04.01): use qualifying language ("in my professional opinion," "general conformance"); never order stop-work (advise owner only); certify only to contractual parties, never to sureties/lenders; require lien waivers before final; guard against front-loading.

Top 5 risks (BP 12.01.01 — constant since 1973): (1) inexperienced employee supervision, (2) in-house coordination, (3) prime-consultant communication, (4) QC on design changes, (5) poorly worded contracts. QC coordinator role: one per firm, embedded from project start.

Peer review (BP 12.01.04): inattentional blindness = teams miss obvious errors in their own work (gorilla study). Three-review program: at SD, DD, 75-90% CDs. Four Cs: Compliance, Completeness, Coordination, Technical Detailing. Does not shift team responsibility.

Sheet discipline (BP 12.01.02): sheet count 9x on 2x building = systemic problem. Causes: lack of planning, computer ease of duplication, staff not checking. Remedy: define drawing index and detail scope before drawing starts.

Record retention (BP 12.03.03): law of the state of the project applies. Daily log required. Retain through statute of repose expiration. Every substitution, every verbal opinion, every deficiency — all documented.

Concepts extracted: [[aia-phase-production-checklists]], [[aia-qc-risk-management]]

---

**[[hines-1200-diehl-project-manual]]** — AA 25% CD project manual, 1200 E. Diehl Rd. Naperville IL, April 18, 2025

~110 MasterFormat sections for Type III-B 5-story multi-family (Hines). Companion to [[hines-1200-diehl-naperville]] drawings source. AA spec author: Shana Kim. MasterSpec ARCOM 80 basis. WiredScore certification required.

**SFRM (078100):** Gypsum-based standard density, concealed interior, buildings ≤74'. Basis: Grace Monokote MK-6 / Isolatek Cafco 300 / Carboline Type 5GP. Min 150 lbf/sf bond (ASTM E736); min 15 lb/cf density (ASTM E605); min 0.375" thick. FSI 10 / SDI 10. Special inspections IBC 1705.13. Concealed = spray texture as-is; exposed = trowel smooth + square edges.

**Firestopping (078400):** Approved: 3M / A/D Fire Protection / Hilti / RectorSeal / SPI / Tremco. Head-of-wall basis: Hilti CFS-TTS Firestop Top Track Seal (UL 2079, ±50% movement). T-rating required when penetrant outside wall cavity. W-rating Class 1 for floors. Owner engages testing agency per ASTM E2174 + E2393.

**GWB (092900):** USG Sheetrock Firecode X basis (GB-1B, 5/8" Type X). Mold-resistant GB-1C at all wet areas. Cementitious backer GB-3B for all tile. Level 5 finish = USG Tuff-Hide spray-applied. Rated head of wall: Trim-Tex Fire Bead (concrete deck) / MarinoWare Fire Gasket (steel deck). Acoustic: Hilti CP 617 outlet box pads (STC 50+) + CP506 acoustical sealant at rated walls.

**Tile (093013):** TCNA B415 (tiled shower receptor): CPE shower pan membrane 1/4"/ft slope + mortar bed + fluid-applied membrane; TCNA B412 (bathtub/shower, prefab receptor): CBU + fluid-applied; TCNA W244F (wet walls on CBU): fluid-applied + high performance grout.

**LVT (096519):** Commercial/corridor/amenity 20 mil wear layer (0.120" thick); residential units 8 mil (0.120" thick). Approved: Shaw/Armstrong/Mannington/Mohawk. 10-year warranty. Sound control underlayment from same manufacturer.

**Quartz (123661.19):** Caesarstone / Cambria / DuPont. Kitchen + vanity 2CM; architectural woodwork 3CM. AWI Custom grade. Loose backsplash.

**Millwork (064023):** AWI Custom (Premium for reception). P-lam flush overlay. Chemetal 0.040" aluminum sheet (October Company). FR MDF/particleboard core (flame spread 25/smoke 450 ASTM E84). SierraPine Medite FR or Pyroblock Platinum.

Historic masonry spec library included from Bloomies/Driehaus reference (040120, 040310, 040342/43, 013591, 071816).

Concepts extracted: [[aa-project-manual-multifamily]]

---

**[[vista-644-randolph-chicago]]** — New construction commercial office high-rise, Chicago IL, 2019 CBC with 2022 Supplement, SD April 11, 2023

15 stories, 223'-8" (HIGH-RISE, IBC 403 full scope). DX-7 + 4.5 bonus FAR via PD = 11.5 total FAR. 12,486 SF lot. Owner: Vista Properties. GC: Skender. **First non-residential high-rise in wiki.** B (offices L3-15) + M (retail L1) + S-2 (parking L2). No ARO, no MOPD, no FHA, no Type A/B units.

**CONSTRUCTION TYPE:** Type I-A + 403.2.1.1 I-B reduction. Primary frame + columns: 3 HR (NOT reduced). Bearing walls: 2 HR. Floors: 3 HR primary / 2 HR secondary (PT/RC slab = primary frame). Roof: 1 HR; >20' AFF = 0 HR. Shaft enclosures: 1 HR (exit stairs + elevator hoistways NOT reduced per 403.2.1.2). NO SFRM — concrete structure.

**CRITICAL — 406.2.8 governs Table 508.4:** Table 508.4 shows S-2/B = 1 HR (sprinkler reduction). BUT IBC 406.2.8 (motor vehicle section) requires 3 HR separation between enclosed parking garage and all other occupancies. 406.2.8 overrides 508.4. Level 2 garage perimeter = 3-HR masonry block (Z30/UL U905). Same rule applies in all AA residential high-rises — in residential, Table 508.4 also reaches 3 HR, so the override wasn't as visible.

**CORRIDORS:** B/M/S + sprinklers + occ <300 = 0 HR (Table 1020.1). Commercial high-rise has NO corridor rating requirement (vs. 1 HR for R-2 >10 occ in Chicago CBC).

**ZONING:** DX-7 base (7.0) + PD bonus (4.5) = 11.5 FAR. TSL parking = maximum only; 19 spaces per PD. Bike: 53 per PD.

**HIGH-RISE (403):** Same checklist as residential. 1 fire service elevator (3,500 lbs). Fire command center. NFPA 13. Voice comm + smoke detection + Class I standpipe. Stair remoteness 30 ft/1/4 diagonal. 2-way comm at every floor.

**PARTITION LIBRARY:** A30 (1HR/STC40/UL465); A41 (0HR/STC49/UL465); K40/K60 (2HR/UL415B shaft wall); C40 (2HR/STC56/UL411); F60 (1HR/STC57/UL458 — commercial-specific, insulation both sides); Z30 (8" CMU, 2HR/UL U905 — garage separation).

Concepts extracted: [[chicago-commercial-office-highrise]]

---

**[[chicago-dob-code-matrix-template]]** — Chicago DOB Sample Code Compliance Matrix, revised 7/29/2020

Official template that defines the G0-03/G0-04 code matrix sheets in every AA Chicago permit package. Two-part structure:

- **Z.01-Z.24 (Zoning, MANDATORY):** Required in every permit requiring plans. Z.04 = Landmarks, Z.05 = Lakefront, Z.06 = Overlay, Z.07 = Pedestrian Street, Z.17 = EVSE-ready parking (eff. 11/1/2020 per 17-10-1011), Z.21 = Planned Development, Z.23 = ARO forms.
- **B.03-B.31 (Building Code, SUGGESTED FORMAT):** Omit inapplicable rows; alternate format allowed if it directs reviewer to compliance location. B.07 fire resistance = most complex (21 sub-items: occupancy separations, unit separation, corridors, shafts, penetrations, opening protectives, draftstopping). B.09.15 = City Fire Alarm Box (Chicago-only — no IBC equivalent). B.11.01 = MOPD Project Data Form (required ALL projects, not just residential).
- **Other Required Data (A/E/M/N/P):** Separate ProjectDox folders: excavation cert (A.04.01), MOPD form (B.11.01), structural data (B.16.01), geotech (B.18.01), electrical drawings (E.02.01), mechanical schedules (M.01.01/M.04.01), energy compliance (N.01.01), plumbing fixture schedule (P.04.01), stormwater plan (P.11.01).

Chicago-specific items with no IBC equivalent: City Fire Alarm Box (B.09.15), Roof Solar Reflectance (B.15.05), MOPD form (B.11.01), ARO forms (Z.23), Lakefront Protection District (Z.05).

Concepts extracted: [[chicago-permit-code-matrix-structure]]

---

**[[moob-oak-brook-il]]** — New construction medical office building, Oak Brook IL, 2015 IBC, IFC October 25, 2021

7 stories, 99'-0" (HIGH-RISE by IBC 403 — 80' threshold crossed). B (offices) + S-2 (parking) + U (utility). ORA-2 PUD zoning, Oak Brook IL. GC: Pepper Construction. Owner: Med Properties. **First medical office building in wiki.**

**DOUBLE CONSTRUCTION TYPE REDUCTION:** Type I-A → I-B (403.2.1.1 first reduction, any occupancy). Type I-B → II-A (403.2.1.1 second reduction, B/S-2/U qualify — not F-1/M/S-1). Final: II-A fire ratings throughout (1 HR frame/floors). Both reductions require NFPA 13 with supervisory + water-flow per floor.

**FIRE SERVICE ELEVATOR — NOT REQUIRED:** IBC 403.6.1 threshold = 120' occupied floor above lowest fire dept. access. MOOB at 99'-0" is below 120'. Chicago CBC practice always provides a fire service elevator in high-rises, masking this IBC-only threshold. MOOB makes the distinction explicit.

**SHAFT STRATEGY:** Shafts NOT sprinkled (vs. 403.2.1.2 option). Result: 2 HR shaft enclosures maintained (CMU). Trade-off: concrete CMU at 2 HR is simpler than adding shaft sprinklers. Deliberate design decision.

**ZONING:** ORA-2 PUD, Oak Brook IL (suburban Illinois). Not Chicago DX. Green Globes certification required per PD ordinance. No ARO, MOPD, FHA, TSL.

**PARTITION LIBRARY:** A30, A41 (1 HR), C30, K20 (2 HR exit stairs), Z20, Z30, Z31, Z33 (CMU), ZZ/ZZ1 (double-wythe CMU: 6"+4", foamed-in-place insulation R13.4, UL DES U906), ZZ2, X42, D61.

Concepts extracted: [[medical-office-outpatient-ibc]]

---

**[[lmc-410-s-wabash-chicago]]** — New construction high-rise residential, Chicago IL (South Loop), 2019 CBC, IFP 09/16/19

25 stories, 260'-10" (HIGH-RISE, CBC 4(13-76)). DX-16 zoning, FAR 10.7 on 27,351 SF lot (16.0 max — no PD required). LMC owner. AA architect + ID. Cosentini MEP. CS Associates structural. 344 R-2 DU. Class A2 (R-2) + H3 (S-2) + C2 (A-3) + F (M).

**DIESEL GENERATOR NOT REQUIRED:** CBC 4(13-76-080)(b) — diesel generator is required only for buildings >400 FT. At 260'-10", only System 2 emergency power is required. This threshold (400 FT, not 80 FT) is documented explicitly in the code matrix. All AA Chicago projects are below 400 FT. IBC requires a generator for all high-rises; CBC does not.

**GARAGE SEPARATION — CBC vs. IBC:** Mixed occupancy via CBC 13-56-280 (not IBC 406.2.8). A2/H3 = 4 HR → 3 HR with sprinkler reduction. F/H3 = 3 HR → 2 HR with sprinkler reduction. CBC sprinkler reduction applies to garage separations; IBC 406.2.8 is a flat 3 HR with no reduction.

**BA PARTITION (new to wiki):** Resilient channel assembly — 2 layers GWB symbol side + resilient furring channel + 1 layer channel side. STC 55 at 1 HR (UL DES U452). Thinner than Type C (STC 56/2 HR) and achieves higher STC than Type A (STC 48/1 HR). First documented in wiki.

**Z40 (fully grouted CMU, 3 HR):** Used at A2/H3 garage perimeter per above reduction. UL U907 vs. Z30 (2 HR, UL U905) at F/H3 separation.

**DX-16 ZONING:** Highest standard downtown DX district (FAR 16.0 max). Project at 10.7 FAR is 33% below limit — no PD required. Parking 0.28/DU = 97 required, 105 provided.

**UNIT FINISHES (LMC 2019):** Balterio Dolce LVT (Bahr Co.) + Wilsonart Marble Falls Q4033 2CM counters + Platform Surfaces Pietra di Gre bath tile + Navel SW 6244 base cabinets / Snowbound SW 7004 upper cabinets + Sherwin Williams Light French Gray SW 0055 walls. 3-tone Masland plank corridor carpet.

Concepts extracted: [[chicago-high-rise-emergency-systems-cbc]]

---

**[[609-w-randolph-chicago]]** — New construction commercial office high-rise, Chicago IL (West Loop), CBC **2018** (filed pre-2019 adoption), IFC 02/26/21

15 stories, 203'-4" (HIGH-RISE, CBC 4(13-76)). DX-7 + 4.5 bonus FAR via PD = FAR 11.5. Net site 9,908 SF; actual FAR area 99,895 SF. Same owner (Vista Properties) + GC (Skender) as Vista 640 at 644 W. Randolph. Class E (Business) + F (Mercantile at L1). Type I-A. No residential, no parking garage, no ARO/MOPD/FHA.

**SHARED PD FAR PATTERN:** Existing 601 W. Randolph building (same ownership) sits on the same PD site and consumes 13,843 SF of the total 113,942 SF allowable FAR envelope. New 609 tower's allowable FAR = 113,942 − 13,843 = 100,099 SF. Actual = 99,895 SF. This is the key pattern for Chicago urban infill where an existing building and new tower share one Planned Development: both buildings' FAR consumption must be tracked together.

**GENERATOR — OWNER-ELECTED, NOT CODE MANDATED:** Building has a generator room at L1 (288 SF). At 203'-4", CBC 4(13-76-080)(b) does NOT require a diesel generator (threshold = 400 FT). Generator is owner-provided for business continuity/tenant resiliency. This is an important advisory distinction: at sub-400 FT heights, any generator spec is a client/tenant decision, not a code compliance item.

**CBC 2018 vs. CBC 2019:** Project filed and permitted under 2018 CBC. Foundation permit issued July 2020, pre-dating 2019 CBC adoption. Substantive differences for Type I-A commercial are minimal; Section 4(13-76) high-rise provisions were not materially changed between editions.

**0 HR CORRIDORS (confirmed):** Class E (Business) corridors = 0 HR. Consistent with Vista 640 commercial pattern and wiki concept [[chicago-commercial-office-highrise]].

Level 15 = full amenity floor (4,140 SF) + outdoor terrace (681 SF). L1 includes coworking lounge (601 SF), Fireman Service Elevator provided.

Concepts reinforced: [[chicago-commercial-office-highrise]], [[chicago-high-rise-emergency-systems-cbc]]

---


**[[741-n-wells-chicago]]** -- New construction high-rise residential, Chicago IL (River North), 2019 CBC, IFC 10/28/2022
- 21 stories, 239'-0" (HIGH-RISE, CBC 403 full scope). PD 1519, FAR 8.1, 22,433 SF lot. Owner: Vista Properties. GC: Skender. Structural: Thornton Tomasetti. 168 R-2 units + S-2 parking (L2-3) + M + B (L1) + A-3 amenities (L4, L21). 270 sheets.
- **CONSTRUCTION TYPE:** Type I-A + 403.2.1.1 I-B reduction. Primary frame + columns: 3 HR (no reduction). Bearing walls: 2 HR. Floors: 3 HR primary (PT/RC slab = primary frame) / 2 HR secondary. Roof: 1 HR. Shaft enclosures: 1 HR (exit stairs + elevator hoistways excluded). SFRM: 430 psf (up to 400').
- **HIGH-RISE (403):** NFPA 13; fire service elevator (1 min, 3,500 lbs); fire command center; standby + emergency power (no diesel generator, below 400 FT); smoke removal; voice comm; auto smoke detection; Class I standpipe; areas of refuge NOT required (sprinkler exception).
- **MIXED OCCUPANCY:** S-2 to all: 3 HR (406.2.8 governs). R-2 to S-2/B/M: 3 HR. A-3 to B: 2 HR. A-3 to R-2: 1 HR.
- **ZONING (PD 1519):** FAR 8.1; parking 51 req/53 provided; bike 120 req/168 provided. Multi-building FAR: 165,711 SF new + 15,996 SF existing at 755 N. Wells = 181,707 SF total. Same pattern as 601+609 W. Randolph.
- **ACCESSIBILITY:** FHA Amendment 7; MOPD meeting minutes in permit set; Type A + Type B units; affordable unit matrix (Sheet G2.08).

Concepts extracted: [[chicago-pd-far-bundling]]

---

## Active Threads
- v1.5.0 backlog: `/adopt` command, vault graph analysis in wiki-lint, semantic search via qmd, Marp output
- `community` remote (`avalonreset-pro/claude-obsidian`) still has pre-rewrite history. Force-push needed next time that remote is configured.

## Repo Locations
- Working: `~/Desktop/claude-obsidian/`
- Public: https://github.com/AgriciDaniel/claude-obsidian
- Community (private): https://github.com/avalonreset-pro/claude-obsidian
