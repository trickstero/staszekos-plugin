# /scqa

Structure any narrative using the Situation → Complication → Question → Answer framework. Use this for client-facing documents where the argument needs to persuade, not just inform.

## When to Use
- SHPO Treatment Narratives (situation: existing conditions; complication: proposed scope vs. historic character; answer: Standards-compliant treatment)
- RFP / SOQ project narratives (situation: client's problem; complication: why it's hard; answer: why AA is the right team)
- Design presentation narratives (situation: site constraints; complication: program tension; answer: design response)
- Code variance justification letters (situation: existing conditions; complication: strict code application; answer: why variance is warranted)

**Note:** This is NOT for internal work products (RFIs, zoning memos, spec sections) — those use bottom-line-first structure. SCQA is for persuasive, client-facing narratives.

## The Four Blocks

### SITUATION
- Establish existing conditions as the reader knows them
- Factual, neutral, no tension yet
- 2–4 sentences maximum
- Anchors the reader before introducing conflict

### COMPLICATION
- Introduce the tension, problem, or challenge that disrupts the situation
- This is why action is needed — the "but" or "however" moment
- Be specific: what exactly is the complication? (regulatory conflict, physical constraint, budget pressure, code ambiguity)
- Do NOT resolve it here

### QUESTION
- State the question the complication raises — the one the reader is now asking
- Usually implicit ("So what do we do?") but sometimes worth making explicit
- For preservation narratives: often "How can the proposed scope be executed while maintaining historic character?"
- For design narratives: often "How does the design resolve [X tension]?"

### ANSWER
- Deliver the insight or solution directly
- This is the thesis — make it specific and defensible
- For SHPO narratives: cite which Secretary of Interior Standards the approach satisfies
- For variance letters: state the finding the board should reach and why
- For design narratives: state the design decision and its logic

## Process

1. Accept the raw input (draft narrative, bullet points, or a description of the situation)
2. Ask: what is the COMPLICATION in this document? If unclear, ask the user before proceeding
3. Draft all four blocks
4. Present the SCQA structure for review before writing the full narrative
5. Write the full narrative using the approved structure

## Output Format

First, show the structure for approval:
```
SITUATION: [2–4 sentence summary]
COMPLICATION: [1–3 sentences]
QUESTION: [1 sentence — explicit or implicit]
ANSWER: [2–4 sentences — the thesis]
```

Then, upon approval, write the full narrative with:
- SCQA blocks as paragraph breaks (not labeled in the final document)
- Professional architectural register
- All code citations and Standards references intact from source material
- Length appropriate to document type (SHPO narrative: 1–3 pages; RFP narrative: 1–2 paragraphs; variance letter: 1 page)

## Rules
- Never skip the structure review step — present the four blocks before writing
- Complication must be specific — "the project is complex" is not a complication
- Answer must be defensible — if it can't be supported with evidence, flag it
- Do not use SCQA labels (Situation:, Complication:, etc.) in the final document
- Run `/edit-narrative` on the output before delivery
