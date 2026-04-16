# /ubiquitous-language

Extract and define a project-specific terminology glossary from the current conversation, document, or project context. Prevent costly miscommunication between architects, contractors, AHJs, and owners by establishing a shared vocabulary before work proceeds.

## When to Use
- Start of a new project or project phase
- When a spec section introduces new product categories or systems
- Before drafting RFIs where contractor and architect may use different terms
- When a zoning analysis involves local terminology that differs from standard practice
- When onboarding a new team member or client

## Process

### Step 1 — Extract candidate terms
Scan the provided context and pull:
- Every term that could mean different things to different parties
- Every technical term that has a specific regulatory meaning
- Every abbreviation or acronym
- Every product category or assembly name
- Every jurisdictional term (overlay name, district designation, permit type)

### Step 2 — Classify each term
Tag each term:
- **[AEC]** — Architecture/Engineering/Construction standard term
- **[CODE]** — Has a specific defined meaning in IBC, ADA, NFPA, or local code
- **[LOCAL]** — Jurisdiction-specific (Chicago, DC, Idaho, etc.)
- **[CONTRACT]** — Has a specific meaning in AIA contract documents
- **[BRAND]** — Manufacturer/product name used generically
- **[AMBIGUOUS]** — Multiple common meanings — define which applies here

### Step 3 — Write definitions
For each term, provide:
- **Term**: exact word or phrase
- **As used here**: precise definition for this project
- **Do not confuse with**: common misuse or synonym to avoid
- **Source**: code section, standard, or authority if applicable

### Step 4 — Flag conflicts
Identify terms where:
- The contractor's vocabulary likely differs from the architect's
- The local jurisdiction uses a different term than IBC
- A product brand name is being used generically (flag for spec section)

## Output Format

```markdown
# PROJECT GLOSSARY — [Project Name]
Date: [YYYY-MM-DD]

## Core Terms
| Term | As Used Here | Do Not Confuse With | Source |
|------|-------------|---------------------|--------|
| | | | |

## Code-Defined Terms
| Term | Defined Meaning | Code Reference |
|------|----------------|----------------|
| | | |

## Local / Jurisdictional Terms
| Term | Jurisdiction | Meaning |
|------|-------------|---------|
| | | |

## Ambiguous Terms — Clarification Required
| Term | Possible Meanings | Resolution for This Project |
|------|------------------|----------------------------|
| | | |

## Abbreviations
| Abbrev | Full Term | Context |
|--------|-----------|---------|
| | | |
```

## AEC Terms That Are Commonly Misused (always check these)
- **Egress** vs. **exit** vs. **exit access** — IBC defines all three differently (§1002)
- **Occupancy** (use classification) vs. **occupancy** (lease status) — clarify in context
- **Fire wall** vs. **fire barrier** vs. **fire partition** — IBC §706/707/708 — different ratings and structural requirements
- **Accessible** vs. **adaptable** vs. **Type A** vs. **Type B** — ADA/FHA/IBC are different standards
- **Variance** vs. **special use permit** vs. **rezoning** — different legal processes
- **Facade** vs. **elevation** vs. **curtain wall** — clarify for contractor communication
- **Renovation** vs. **rehabilitation** vs. **restoration** vs. **reconstruction** — Secretary of Interior Standards defines all four
- **GFA** vs. **GFA net** vs. **zoning floor area** — jurisdictions calculate differently

## Rules
- Never leave an AMBIGUOUS term unresolved — always provide the project-specific meaning
- If the glossary will be used in an RFI or spec, append to the document header
- Chicago-specific: flag any term where the Chicago Building Code uses different language than IBC 2021
