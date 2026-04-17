# Code Research — Project Memory

## Standing Instructions
- Web search every analysis — never use memory for code language
- Scope: IBC occupancy/construction type, ADA, NFPA 13/72, jurisdiction-specific overlays
- Feeds directly into zoning memos and permit packages
- Always cite edition of code (IBC 2021, IBC 2018, local amendment year)
- **Read `hot.md` in this project folder before any code question** — live wiki cache from real AA projects

## Research Sequence
1. Read `hot.md` — wiki context first
2. Identify adopted code edition for jurisdiction
3. Occupancy classification → construction type matrix
4. Height/area table (IBC Table 504/506)
5. Egress (IBC §1006, Table 1017.2)
6. Sprinkler/alarm requirements (NFPA 13/72)
7. Accessibility (ADA + local amendments)
8. Jurisdiction-specific overlays and local amendments

## Chicago CBC — Key Departures from IBC 2021
**Chicago uses CBC 2019 (based on IBC 2018), NOT IBC 2021.**

High-rise >80 ft AGL — CBC 18-27-4-403:
- Construction type reduction to I-B allowed with NFPA 13 throughout
- Primary frame + columns: 3 HR | Bearing walls: 2 HR | Shaft enclosures: 1 HR
- R-2/S-2 separation: 3 HR minimum (CBC — NOT IBC 1 HR)
- Fire service elevator: 1 required at 3,500 lbs (NOT 2 — that is IBC 2021)
- Smokeproof vestibules: IBC 2021 ONLY — DO NOT apply to CBC/Chicago projects
- Fire command center: no SF minimum in CBC (≥200 SF/1 HR is IBC 2021 only)
- Diesel generator NOT required below 400 FT (confirmed: all AA Chicago projects <400 FT)

Garage separation — CBC 13-56-280:
- R-2/S-2: 3 HR minimum (base 3 HR − 1 HR sprinkler = still 3 HR min)
- M/S-2: 2 HR (base 3 HR − 1 HR = 2 HR)
- IBC 406.2.8 is flat 3 HR with no sprinkler reduction

## AA Partition Library (real AA permitted projects)
| Type | UL Assembly | Rating | STC | Notes |
|------|-------------|--------|-----|-------|
| A | U408 | 1 HR | 50 | Standard metal stud full-height |
| BA | U452 | 1 HR | 55 | Resilient channel, sound-critical demising |
| C | U411 | 2 HR | 52 | Demising |
| G | U420 | 2 HR | 58 | Corridor |
| K | U415B | 2 HR | — | Shaft wall |
| Z30 | U905 | 2 HR | — | CMU party wall |
| Z40 | U907 | 3 HR | — | Grouted CMU (R-2/S-2 garage separation) |
| Floor-ceiling | G586 | 2 HR | — | |
| Column wrap | C60 | 2 HR | — | |

## Standard Output Format
```
BUILDING DATA table | ALLOWABLE HEIGHT AND AREA | EGRESS SUMMARY
CHICAGO HIGH-RISE FLAGS (if >80 ft) | FIRE AND LIFE SAFETY | ACCESSIBILITY
CHICAGO PERMIT CODE MATRIX | CODE ISSUES | SOURCES
```
Every cell must cite a code section. Never produce a narrative without the table structure.

## Case Log
<!-- Date | Project | Jurisdiction | Occupancy | Construction Type | Key Flags -->
<!-- 2026-04-16 | LMC 410 S. Wabash | Chicago CBC 2019 | R-2/S-2 | Type I-A | BA partition (STC55), Z40 at garage sep -->

## Learned Patterns
<!-- Code interpretation precedents, jurisdiction quirks, common AHJ positions -->

## Active Jobs
<!-- Current research in progress -->

## Related
- [[Code-Research]] — session index
- [[_global-context]] — firm profile and defaults
