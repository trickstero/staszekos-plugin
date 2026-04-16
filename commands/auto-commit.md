# /auto-commit

Generate a conventional commit message from staged changes in the antunovich-ai repository and execute the commit.

## Process

### Step 1 — Read the diff
Run:
```bash
git diff --staged
git status
```

### Step 2 — Classify the change
Determine commit type:
- `feat`: new feature, new slash command, new skill
- `fix`: bug fix, broken tool, incorrect output
- `docs`: README, CLAUDE.md, documentation only
- `refactor`: restructuring without behavior change
- `style`: formatting, whitespace, no logic change
- `chore`: dependencies, config, build tooling
- `ci`: GitHub Actions, deployment scripts

### Step 3 — Write the commit message
Format: `type(scope): short description`

Rules:
- Subject line: imperative mood, ≤72 characters, no period
- Scope: component changed (rfi, spec, shpo, render, zoning, deps, config)
- Body: explain WHY if not obvious from the diff — skip if self-evident
- Footer: reference issue number if applicable (`Closes #N`)

Examples:
```
feat(rfi): add Procore-ready RFI template with auto-numbering

fix(shpo): correct Secretary of Interior Standards citation format

refactor(zoning): split research sequence into modular steps

chore(deps): update anthropic SDK to 0.39.0
```

### Step 4 — Stage and commit
```bash
git add [specific files — never git add -A]
git commit -m "[message]"
```

### Step 5 — Report
Show:
- Files committed
- Commit hash (short)
- Whether push to origin is needed

## Rules
- Never use `git add -A` or `git add .` — stage specific files only
- Never include secrets (API keys, .env, settings.local.json)
- Never force push (`--force`)
- Never skip hooks (`--no-verify`)
- If pre-commit hook fails: fix the issue, then create a NEW commit — do not amend
- Default repo: trickstero/antunovich-ai
- DNS note: api.github.com blocked on corporate network — use `git push origin` not GitHub CLI for push operations
