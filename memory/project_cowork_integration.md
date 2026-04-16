---
name: Cowork → Claude Code Integration Protocol
description: How claude.ai Cowork sessions and Claude Code interact, skill stack mapping, /sync-cowork
type: project
---

**Key distinction:** Claude.ai Cowork ≠ Claude Code.
- Cowork (claude.ai): no slash commands, no memory system, no approval-gated skill flow, no hooks
- Claude Code (StaszekOS): has slash commands, memory, hooks, tool approval gates

**The bridge:** `/sync-cowork` command in Claude Code reads Obsidian vault context and presents skill stacks for approval before work begins.

**Skill stack mapping (always present in order, always ask permission before deploying each):**

| Cowork Project | Trigger Keywords | Skill Stack |
|----------------|-----------------|-------------|
| Zoning Analysis | zoning, setback, FAR, rezoning, overlay | `/grill-me` → `/zoning-research` → `/edit-narrative` |
| Code Research | IBC, occupancy, construction type, egress, ADA | `/grill-me` → `/code-lookup` → `/edit-narrative` |
| SHPO Narrative | SHPO, historic, preservation, landmark | `/scqa` → `/shpo` → `/edit-narrative` |
| SPEC Writing | spec, MasterFormat, division, CSI | `/grill-me` → `/spec` → `/edit-narrative` |
| RFI Drafting | RFI, request for information, contractor | `/grill-me` → `/rfi` |

**How to apply:** When any Cowork project keyword appears, surface the skill stack immediately. Never start analysis before user confirms. Always end sessions by writing back to Obsidian project log.
