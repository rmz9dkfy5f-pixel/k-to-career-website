# Agent Run Log

Use this to preserve useful session outcomes without bloating root instructions.

## Run Template

```md
## Run YYYY-MM-DD HH:MM

Agent/tool:
Task:
Status: PASS / PARTIAL / BLOCKED / FAIL
Files inspected:
Files changed:
Validation run:
Result:
Risks:
Next action:

## Model Usage Record
Tool used:
Surface used:
Model used:
Effort/thinking level:
Why this model was chosen:
If in VS Code, why Codex or Claude Code was chosen:
Was the model sufficient? Yes / No
Should similar tasks use the same route? Yes / No
Escalation needed next time? Yes / No
Notes:
```

## Runs

_Add new runs below._

## Run 2026-07-29

Agent/tool: Claude Code (VS Code extension)
Task: Execute `project-starter-kit-v3.4/00_EXECUTE_ME.md` — install Project Starter Kit V3.4 into
this repository in migration mode.
Status: PASS
Files inspected: `00_EXECUTE_ME.md`, `ADOPTION_POLICY.md`, all three kit scripts, `CLAUDE.md`,
`.gitignore`, `CHANGELOG.md`, `README.md`, `docs/governance/REPOSITORY_HANDOFF_CONFIG.md`,
`docs/workflow/{branching-model,claude-code-workflow,snapshot-hook-setup}.md`,
`docs/Standards/version_number_system.md`, `docs/Strategy/K_to_Career_Ecosystem.md`,
`docs/delivery/*`, `docs/deployment/HOSTING_NOTES.md`, `plans/*`, `scripts/*`, `index.html`.
Files changed: `.gitignore`, `CLAUDE.md` (append-only), `AGENTS.md`, 42 installed base files,
7 governance files filled, 9 `docs/project/` stubs, `CHANGELOG.md`, plus a plan file and the
migration record.
Validation run: `v34_adoption_audit.py --target .` (pre-install, on `main`) →
`READY_FOR_REVIEW`, 2/28, clean tree. `v34_install.py --dry-run` then `--yes` → 42 installed,
2 conflicts, 0 errors. `v34_validate.py --target .` → FAIL after install (expected, one error),
then PASS after the `CLAUDE.md` merge. Manual browser smoke test of the root `index.html`.
Result: V3.4 installed and validating PASS with no existing file overwritten.
Risks: see `PROJECT_RISK_REGISTER.md` R-001 through R-008, opened by this run.
Next action: PR opened against `main`, stopped before merge pending explicit approval. After merge,
re-run the adoption audit on `main` — it should report 28/28 and `READY_FOR_REVIEW`.

## Model Usage Record
Tool used: Claude Code
Surface used: VS Code extension
Model used: Claude Opus 5 (1M context)
Effort/thinking level: high
Why this model was chosen: exploration-heavy, multi-file migration into an opinionated existing
repository, where the main risk was silent damage — an overwritten authoritative `CLAUDE.md`, skill
files invisible to git, or fabricated values written into governance docs. Predicting the installer's
exact behaviour before running it required reading three Python scripts and the whole existing doc
set together. `MODEL_SELECTION_GATE.md` prefers Claude Code for exactly this shape of work.
If in VS Code, why Codex or Claude Code was chosen: Claude Code. The task was
discovery-and-reconciliation across ~50 files rather than a focused implementation slice with clear
verification, which is the case the gate routes to Codex.
Was the model sufficient? Yes
Should similar tasks use the same route? Yes — for adoption into an existing repo. A fresh
new-project install is mechanical and would suit a cheaper route.
Escalation needed next time? No
Notes: Three failure modes were caught by reading the scripts before running them, and none would
have been visible from the kit's documentation alone: (1) the adoption audit blocks on any untracked
file *and* on any non-default branch, so it must run on `main` before branching, with the tree
cleaned via `.git/info/exclude` rather than a tracked `.gitignore` edit; (2) `.claude/*` in
`.gitignore` would have let all four skill files install to disk and pass local validation while
never being committed; (3) the audit's `.v34_migration_review/` check reads the filesystem, not git,
so the quarantine must be deleted after resolution or every future audit stays BLOCKED.
