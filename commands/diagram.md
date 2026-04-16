# /diagram

Generate a visual diagram using the connected Excalidraw MCP. Converts architectural, code compliance, or workflow concepts into clear diagrams.

## Diagram Types for AA Practice

### 1. Code Compliance Matrix
Use for: IBC occupancy × construction type allowable area/height grids
Elements: grid table, highlighted conforming/non-conforming cells, footnotes for sprinkler increases

### 2. Zoning Analysis Map / Diagram
Use for: parcel overlay diagram, setback envelope, massing envelope
Elements: parcel boundary, setback lines labeled with §, building envelope, overlay hatching

### 3. IBC Decision Tree
Use for: occupancy classification flowchart, means of egress decision logic, fire separation requirements
Elements: decision diamonds, yes/no branches, terminal boxes with code citations
→ For complex decision trees, use `/flowchart` instead

### 4. Entitlement Process Flow
Use for: zoning variance → special use → rezoning process timelines
Elements: process steps, decision points, timeline labels, agency names

### 5. Building Program Diagram
Use for: occupancy separation diagram, floor plate organization, vertical circulation
Elements: labeled boxes for occupancy groups, fire barrier lines with ratings, exits marked

### 6. Workflow / Process Diagram
Use for: AA internal workflows, Procore/SharePoint/Power Automate flows, Cowork session sequences
Elements: process steps, tool logos (text labels), decision points, parallel tracks

## Process

1. Identify diagram type from user input
2. If unclear, ask: "What is this diagram meant to communicate — and who is the audience?"
3. Extract all elements: nodes, connections, labels, annotations
4. Generate using Excalidraw MCP
5. Report: diagram created, element count, any items that need manual adjustment

## Input Format Accepted
- Free-form description: "Show the IBC construction type decision based on occupancy B, 6 stories, sprinklered"
- Bullet list of nodes/connections
- Existing table or matrix to visualize
- Code research output from `/code-lookup` or `/zoning-research`

## Output Rules
- All labels use exact code terminology (not paraphrased)
- Code citations included in node labels where relevant (e.g., "Table 504.3")
- Color coding: green = compliant, red = non-conforming, yellow = requires AHJ confirmation
- Keep diagrams to one concept — do not combine unrelated information in one diagram
- If diagram is for a permit package: use black and white only (no color coding)

## Excalidraw MCP Usage
Use the connected Excalidraw MCP tool to create and output the diagram. If MCP is unavailable, output a structured text description of the diagram elements that can be manually recreated.
