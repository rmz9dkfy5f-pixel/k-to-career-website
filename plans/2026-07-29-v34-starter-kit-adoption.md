# Plan: Adopt Project Starter Kit V3.4 (migrate mode)

## Objective

Execute `project-starter-kit-v3.4/00_EXECUTE_ME.md` in migration mode against this repository:
install the V3.4 agent operating system without overwriting existing project instructions, without
creating duplicate sources of truth, and without writing any value into a governance document that
has not been confirmed from real evidence.

## Current State

- `main` at `a3d28da`, tagged `v1.3.0`, clean and fully synced with `origin/main`.
- GitHub Pages is live and `built`, serving `main` at repository root. The repository is **public**.
- Static HTML/CSS only — no framework, no build tool, no package manager, no test runner.
- `CLAUDE.md` (105 lines) is the authoritative project contract. It declares the canonical structure
  (`docs/Strategy/`, `docs/workflow/`, `plans/`) and prohibits duplicate versions of the same doc.
- `docs/governance/REPOSITORY_HANDOFF_CONFIG.md` already exists and is fully filled in with real,
  machine-confirmed values.
- `project-starter-kit-v3.4/` sits untracked at the repo root.

## Assumptions

- The kit is local tooling, not a deliverable of this repository, so it is not committed.
- The pre-existing `CLAUDE.md` and `REPOSITORY_HANDOFF_CONFIG.md` outrank their V3.4 templates —
  both templates are generic or `TBD`, both existing files are project-specific and confirmed.
- No release is being cut in this change, so `RELEASE_GATE.md` does not apply yet.

## Constraints

- Start from repo root; small approval slices; avoid unrelated edits.
- `chore/` branch per `docs/workflow/branching-model.md`; never commit direct to `main`.
- No fabricated commands, metrics, partnerships, or testimonials (`CLAUDE.md` Content Rules).
- Do not overwrite or delete existing project files (`00_EXECUTE_ME.md` safety rules 1–3).
- `docs/Strategy/K_to_Career_Ecosystem.md` is a protected path.

## Files to Review

- `project-starter-kit-v3.4/00_EXECUTE_ME.md`, `templates/migration/ADOPTION_POLICY.md`
- `project-starter-kit-v3.4/scripts/{v34_adoption_audit,v34_install,v34_validate}.py`
- `CLAUDE.md`, `.gitignore`, `CHANGELOG.md`
- `docs/governance/REPOSITORY_HANDOFF_CONFIG.md`, `docs/workflow/branching-model.md`,
  `docs/workflow/claude-code-workflow.md`, `docs/Standards/version_number_system.md`

## Files to Change

- `.gitignore` — ignore the kit and its artifacts; re-include `.claude/skills/`
- `AGENTS.md` (new, adapted), `CLAUDE.md` (append-only)
- `docs/governance/*` — 16 installed, several filled with confirmed values; 1 preserved and corrected
- `docs/project/*` — 9 installed, converted to pointer stubs
- `ai/**`, `.claude/skills/**`, `.agents/skills/**`, `MODEL_SELECTION_GATE.md`,
  `PROMPT_MODEL_SELECTION_GATE.md` — installed as shipped
- `CHANGELOG.md` — `[Unreleased]` entry

## Slice 1

**Goal** Prepare the ground so the installer's output is actually committable.

**Planned edits**
- This plan file.
- `.gitignore`: add `!.claude/skills/` (without it `.claude/*` makes the four installed skill files
  unstageable), plus `project-starter-kit-v3.4/`, `V34_INSTALL_REPORT.json`,
  `.v34_migration_review/`, `__pycache__/`, `*.pyc`.

**Validation**
- `git check-ignore -v` across the six cases; `git ls-files --others --exclude-standard` is the
  definitive check that `git add` will see the skill files and not the kit.

## Slice 2

**Goal** Install V3.4 and commit the installer's output unmodified.

**Planned edits**
- `--dry-run` first, then `--yes`. Stage only the 42 files from `templates/base`.

**Validation**
- Dry run reports 42 installed / 2 conflicts / 0 errors.
- `cmp` loop proves every staged file is byte-identical to its template.
- `v34_validate.py` is **expected to FAIL here** with exactly one error (`CLAUDE.md` missing the
  `MODEL_SELECTION_GATE.md` marker). A second error means stop.

## Slice 3

**Goal** Reconcile the two root instruction files without losing either.

**Planned edits**
- Append one `## V3.4 Agent Operating System` section to `CLAUDE.md` — additions only.
- Adapt the installed `AGENTS.md` to defer to `CLAUDE.md`'s canonical structure and content rules
  rather than restate them, keeping the literal string `MODEL_SELECTION_GATE.md`.

**Validation**
- `v34_validate.py` → PASS, exit 0.
- `git diff --numstat` on `CLAUDE.md` shows zero deletions.

## Slice 4

**Goal** Fill governance docs with confirmed values only.

**Planned edits**
- `PROJECT_CLASSIFICATION.md` → Git-backed with deployment (evidence: `gh api …/pages`).
- `REPOSITORY_HANDOFF_CONFIG.md` → correct the stale `v3/` smoke-test line; reconcile the Deployment
  Contract with the classification while keeping its authorization posture.
- `TEST_STRATEGY.md`, `REPO_HEALTH_CHECK.md`, `PROJECT_RISK_REGISTER.md`, `SECURITY_BASELINE.md`,
  `COMPATIBILITY_MATRIX.md` (Required? column only), `RELEASE_GATE.md` (N/A), `AGENT_RUN_LOG.md`.
- `AGENT_RUN_CONTRACT.md` and `FIRST_SESSION_REHEARSAL.md` deliberately left untouched.

**Validation**
- `v34_validate.py` still PASS; every remaining `TBD` under `docs/governance/` is a deliberate one.

## Slice 5

**Goal** Prevent `docs/project/` from becoming a competing source of truth.

**Planned edits**
- Convert the 9 skeletons into short pointers to the real canonical locations.

**Validation**
- `v34_validate.py` PASS; every referenced repo path resolves.

## Slice 6

**Goal** Record the migration outcome and clear the quarantine.

**Planned edits**
- Fill `MIGRATION_REPORT.md`; relocate it and `ADOPTION_POLICY.md` into `docs/governance/`.
- Delete `00_MIGRATION_KICKOFF.md` and `.v34_migration_review/`.

**Validation**
- `.v34_migration_review/` gone — any file left there permanently blocks future adoption audits.

## Slice 7

**Goal** Satisfy the versioning policy.

**Planned edits**
- Append to the existing `[Unreleased]` section of `CHANGELOG.md`.

**Validation**
- Full final gate, then push and open a PR. Stop before merge.

## Risks

- The kit is gitignored, so committed docs that reference `project-starter-kit-v3.4/scripts/*` point
  at paths absent from a fresh clone. Mitigated by wording them as local tooling; logged as a risk.
- Two always-loaded instruction files (`CLAUDE.md`, `AGENTS.md`) can drift apart over time.
- This repository is public and Pages serves every root-level file, so all added governance
  documentation is world-readable.
- `RELEASE_GATE.md` and `COMPATIBILITY_MATRIX.md` invite fabricated pass/verified values.

## Rollback

`main` is never touched. Per slice: `git reset --hard HEAD~1`. After Slice 2 also remove the
untracked artifacts the installer created. Full abort: `git switch main && git branch -D
chore/v34-starter-kit-adoption`. `CLAUDE.md` and `REPOSITORY_HANDOFF_CONFIG.md` are never written by
the installer, so there is nothing to restore.

No pre-install snapshot is required: `REPOSITORY_HANDOFF_CONFIG.md`'s snapshot naming rule is
`final_tag`, no tag is being cut here, and `main` is untouched.

## Open Questions

- Is publishing operational coordinates (absolute local paths in `REPOSITORY_HANDOFF_CONFIG.md`) in a
  public repository acceptable? Pre-existing, surfaced by this adoption, not changed here.
- Should `docs/workflow/claude-code-workflow.md`'s slice model and the V3.4 phase gates be merged
  into one procedure, or kept as two? Deferred — both are currently accurate.
- The "Repo Push Super Prompt" is referenced as this repo's commit/push authorization rule but lives
  outside the repository and is not registered in `AGENT_RUN_CONTRACT.md`.
