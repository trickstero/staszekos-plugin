# /flowchart

Generate a step-by-step decision flowchart for complex code compliance paths, entitlement processes, or project workflows. Produces structured output suitable for Excalidraw, presentation slides, or permit documentation.

## Primary Use Cases for AA Practice

### IBC Code Compliance Paths
- Occupancy classification decision tree (IBC Ch. 3)
- Construction type selection (IBC Ch. 6 — height/area constraints)
- Sprinkler requirement decision (IBC §903)
- Means of egress design decision tree (IBC Ch. 10)
- Mixed occupancy analysis (IBC §508)
- Accessible route determination (IBC Ch. 11)

### Zoning Entitlement Processes
- Chicago zoning relief path: administrative adjustment → variation → special use → rezoning
- DC entitlement sequence: BZA → HPRB → DCSHPO
- Permit sequence: pre-application → plan review → permit → inspection → CO

### Project Decision Flows
- Design review milestones and approval gates
- RFI response decision: contractor → architect → owner → AHJ
- Submittal review routing

### Internal Workflow Automation
- Power Automate logic flows
- Procore workflow triggers and approvals
- SharePoint document routing

## Process

1. Accept input: code question, process description, or workflow goal
2. Identify all decision points (yes/no or multi-branch)
3. Identify all terminal states (compliant, non-compliant, requires variance, approved, rejected)
4. Map the logical sequence — do NOT skip steps
5. Output the flowchart in two forms:
   a. **Text map** (always): structured indented text with → and [decision] markers
   b. **Excalidraw diagram** (if requested): use `/diagram` MCP call

## Output Format

### Text Map (always produced)
```
START: [input condition]
  → [Step 1: action or check]
      [Decision: condition?]
      YES → [Step 2a]
            → [Terminal: outcome + code ref]
      NO  → [Step 2b]
            [Decision: condition?]
            YES → [Terminal: outcome + code ref]
            NO  → [Terminal: outcome + code ref]
```

### Example — IBC Sprinkler Requirement (§903)
```
START: New building — sprinkler required?
  → Check occupancy group
      [Decision: Group A (assembly) with occupant load > 300?]
      YES → NFPA 13 required (§903.2.1)
      NO  → [Decision: Group B/M/R/S with height > 55 ft?]
            YES → NFPA 13 required (§903.2.11)
            NO  → [Decision: Group R (residential)?]
                  YES → [Decision: ≤ 4 stories above grade?]
                        YES → NFPA 13R permitted (§903.3.1.2)
                        NO  → NFPA 13 required (§903.2.8)
                  NO  → Check local Chicago amendments (CBC §15-16-903)
```

## Rules
- Every terminal state must cite the code section or municipal code reference
- Decision labels must be yes/no — avoid ambiguous branching
- Never combine two separate decisions in one diamond
- If a path ends with "AHJ determination required" — flag it explicitly: [AHJ CONFIRMATION NEEDED]
- Chicago: always add a branch to check CBC amendments after IBC base decision
- If the flowchart has more than 15 nodes, split into sub-flowcharts by phase
