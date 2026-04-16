# /workflow-builder

Design and document automation workflows for AA's project management tools. Converts a goal into a step-by-step workflow with tool assignments, trigger conditions, and implementation notes.

## Scope
- **Power Automate** flows connecting Procore, SharePoint, Outlook, and Teams
- **Procore** custom workflows: RFI routing, submittal review, daily reports
- **SharePoint** document management: folder structures, metadata, approval flows
- **Claude Code** automation: scheduled tasks, hooks, batch processing
- **Cross-tool** workflows: data moving between Procore ↔ SharePoint ↔ Outlook ↔ Deltek

## Process

### Step 1 — Goal definition
Ask if not provided:
1. What is the trigger? (new document uploaded, RFI submitted, date/time, manual)
2. What is the desired outcome? (notification sent, file moved, record updated, report generated)
3. Which tools are involved? (Procore, SharePoint, Power Automate, Outlook, Claude)
4. Who are the actors? (PM, architect, contractor, owner, AHJ)
5. What are the failure conditions? (what should happen if step X fails?)

### Step 2 — Map the workflow
For each step, define:
- **Action**: what happens
- **Tool**: which platform executes it
- **Actor**: human or automated
- **Input**: what data/file/trigger is needed
- **Output**: what is produced
- **Condition**: any if/then branching

### Step 3 — Output the workflow

#### Flow Diagram (text)
```
TRIGGER: [event]
  → STEP 1: [action] | Tool: [platform] | Actor: [human/auto]
      → STEP 2: [action] | Tool: [platform]
          [Condition: X?]
          YES → STEP 3a
          NO  → STEP 3b (error handling)
  → TERMINAL: [outcome]
```

#### Implementation Notes
For each step, provide:
- Power Automate: connector name, action name, configuration notes
- Procore: workflow type, custom field needed, permission level
- SharePoint: library, metadata column, approval stage
- Claude Code: hook type, script outline

### Step 4 — Flag manual steps
Any step that requires human judgment or cannot be automated: mark [MANUAL] and explain why.

## Common AA Workflow Templates

### RFI Lifecycle (Procore → Outlook → SharePoint)
```
TRIGGER: Contractor submits RFI in Procore
  → Auto-assign to responsible architect (by spec section / discipline)
  → Notify via Outlook (due date: 10 business days standard)
  → Architect reviews → responds in Procore
  → Auto-log to SharePoint RFI register (project folder)
  → If response delayed > 7 days → escalate to PM
```

### Submittal Review Routing
```
TRIGGER: Contractor uploads submittal in Procore
  → Auto-route to reviewer by spec section (pre-mapped)
  → Notify reviewer + PM
  → Review period: 14 calendar days
  → Response logged → distribute to contractor
  → If Revise and Resubmit → reopen submittal, reset clock
```

### Drawing Issue Notification (SharePoint → Outlook → Procore)
```
TRIGGER: New drawing revision uploaded to SharePoint
  → Power Automate detects file change in /Drawings folder
  → Extract drawing number + revision from filename
  → Post to Procore Drawings log
  → Send distribution email via Outlook to project team list
```

### Weekly Project Report (Deltek → Outlook)
```
TRIGGER: Every Friday at 4:00 PM
  → Pull labor hours from Deltek by project number
  → Compare to budget
  → Generate variance summary
  → Email PM + Principal-in-Charge
```

## Output Deliverables
1. **Workflow map** (text diagram)
2. **Step-by-step implementation guide** (tool-specific instructions)
3. **Power Automate flow structure** (if applicable — connector list, action sequence)
4. **Procore configuration notes** (if applicable — custom fields, workflow settings)
5. **Exception handling** (what happens when it breaks)

## Rules
- Never recommend a workflow that bypasses Procore's audit trail for RFIs or submittals — those records are contractual
- Power Automate: note any premium connectors (Procore connector requires Power Automate Premium license)
- SharePoint metadata: always recommend metadata columns over folder nesting — folders break search
- Flag any workflow that touches financial data (Deltek) for IT/Michael Thompson review before implementation
- Note: corporate network SSL inspection (FortiGate) may affect Power Automate HTTP connectors — flag for IT whitelist
