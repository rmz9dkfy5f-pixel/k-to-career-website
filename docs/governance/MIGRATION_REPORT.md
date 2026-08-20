# Starter Kit Migration Report

Newest migration first. Each section records one migration of this repository between Starter Kit
versions.

---

# v3.7.0 Migration — 2026-08-20

Migrated Project Starter Kit **V3.4 → v3.7.0**. Single direct jump: the kit's compatibility floor is
fixed at `3.4.3` and does not advance between releases, so there are no intermediate version hops.

Kit source: `antbrainos-project-starter-kit` at tag `v3.7.0` (dereferenced commit
`b172bc6bedb9064aafeaf159d08649ee8cbfcc2a`), run from a detached worktree pinned to that tag so the
kit's own `main` checkout (then mid-v3.8 work at `4dff24c`) was never disturbed.

**This was the first real-repository pilot of this migration tooling.** The kit's own vault project
records that prior versions were proven only on disposable fixtures and the kit's release host, never
against a live production repository. See the AntBrainOS vault
`03_PROJECTS/Backlog/Project_Starter_Kit/DECISION_LOG.md`, 2026-08-19 entry.

## Status

**Complete.** `validate` **PASS** (0 findings), `validate --release` **PASS** (0 findings),
`validate --compatibility 3.4.3` **PASS**, `doctor` **PASS**, `status` **PASS**,
`security inspect`/`plan`/`apply` **PASS**, `session-closeout` **PASS**, cold `session-start`
**PASS**. `quality --execute` **PASS_WITH_WARNINGS** — see Known Warnings below.

No existing file was overwritten. No site content changed.

## Identifiers

- Migration plan ID: `692159d06369f3fcf59543e460ff2b9a39865c22cae88b740781198a13e51838`
- Migration run ID (rollback handle): `fe77c849-c844-4d8f-9949-0f9b4b910aa8`
- Security evidence plan ID: `64650f18bd42a30278b8653a09d5ec018803e24150bfa69fd9de688f38d98d5c`
- Closeout plan ID: `73a407b72aa2fd4a3c9a329a4dc957bfe0dc156725f48d3b938115b328ac8164`
- Profile selected: `web_application`

## Git State

Per the audit's requirement, `adopt-audit` and `plan-migration` were run from `main`
(`90153cf`, clean). `migrate --apply` writes only working-tree files — the kit never runs any git
write command (verified by source inspection of `starter_kit/discovery.py`'s `run_git`, which issues
only `rev-parse`, `status`, `branch`, and `remote`). Changes were therefore left uncommitted on
`main`, then carried onto `chore/migrate-starter-kit-v3.7` and committed there.

**`main` was never committed to and never pushed.** Since publishing requires a push to `main`, the
live site could not change at any point.

## What Changed

79 planned operations:

| Action | Count | Notes |
|---|---|---|
| `conflict` (preserved) | 21 | Existing content kept; kit candidate stored in the migration journal |
| `replace_v34_owned` | 16 | Only files byte-identical to the frozen v3.4.3 templates |
| `create` | 35 | 16 new `starter-*` skills, 16 `.starter-kit/` state files, 3 root files (removed — see below) |
| `identical` | 7 | No-ops |

New capability: eight `starter-*` skills replace the four `v34-*` ones, which remain as deprecated
compatibility aliases (guaranteed through v4.0). Mirrored across `.claude/skills/` and
`.agents/skills/` as before.

**Untouched:** `index.html`, `assets/`, `docs/Strategy/`, `plans/`, root `CHANGELOG.md`,
`AGENT_HANDOFF.md`, `README.md`, `.gitignore`, `scripts/`. `index.html`'s SHA-256 was verified
byte-identical to `main` after the migration.

## Conflicts Preserved

All 21 customized files were preserved, with the kit's proposed version stored as a candidate under
`.starter-kit/migrations/fe77c849-.../conflicts/`. The highest-consequence ones:

| File | Outcome |
|---|---|
| `CLAUDE.md` | **Preserved.** The authoritative project contract; never eligible for auto-upgrade. |
| `AGENTS.md` | **Preserved.** Retains its defer-to-`CLAUDE.md` precedence clause. |
| `docs/governance/REPOSITORY_HANDOFF_CONFIG.md` | **Preserved.** Retains real values and the R-006 fix. |
| `docs/governance/PROJECT_CLASSIFICATION.md` | **Preserved**, then edited by hand — see below. |

The stored `REPOSITORY_HANDOFF_CONFIG.md` candidate contains the kit's *blank* template (empty
machine table, generic `scutil` detection command), not this project's real paths — so the migration
journal does not reintroduce the R-006 exposure that was closed on 2026-08-19.

## Deliberate Deviations From The Kit's Output

Three deviations, each an explicit decision rather than a silent fix:

1. **Root migration scaffolding removed.** The plan created `00_MIGRATION_KICKOFF.md`,
   `ADOPTION_POLICY.md`, and `MIGRATION_REPORT.md` at the repository root. Two duplicated files
   already in `docs/governance/`, which `CLAUDE.md` prohibits, and all three would have been
   world-readable via Pages (the R-006 concern). All three were removed — **the same decision the
   V3.4 migration made**, for the same stated reasons (see the V3.4 section below). All three were
   unfilled templates still branded "V3.5", so nothing was lost.
2. **Manifest reconciled.** Removing those three files broke `validate`, since
   `.starter-kit/manifest.json` listed them `required: true`. Their entries were removed and the
   manifest's normalized self-hash recomputed using the kit's own `_normalized_manifest_hash`.
3. **Classification corrected.** The kit auto-detected `git_backed_with_remote`; this repository is
   `git_backed_with_deployment`, confirmed by a live `gh api .../pages` call (the kit cannot detect
   Pages without one). The manifest was set to the accurate value, and
   `PROJECT_CLASSIFICATION.md` now emits that canonical token — the validator regex-reads only the
   first whitespace-delimited word of its `Classification:` line, so the previous prose form
   ("Git-backed with deployment") could never match any valid token.

## Release Facts Recorded

`validate --release` blocked until these were dispositioned. All are evidence-backed:

| Fact | Value | Evidence |
|---|---|---|
| `public_exposure` | `public` | Public repo; Pages serves the site publicly |
| `data_sensitivity` | `none` | `index.html` has 0 `<form>` and 0 `<input>`; no analytics, tracking, or external scripts; no database, auth, or backend |
| `risk_level` | `low` | Static HTML/CSS; no runtime, dependencies, or tracked secrets; worst case is defacement/outage, recoverable by reverting `main` |
| privacy `default_classification` | `public` | No personal data processed; only a published organisational contact address is displayed |

## Verification

- `index.html` SHA-256 identical to `main` — the deployable site provably unchanged.
- Local HTTP smoke test: `200` for `/`, `/favicon-32.png`, `/apple-touch-icon.png`,
  `/assets/images/logo.png`; `<title>` renders correctly. This manual check is load-bearing, since
  `TEST_STRATEGY.md` records that this repository has no test runner, linter, or build tool.

## Known Warnings

- `quality --execute` reports `no_quality_checks`: the validation contract contains no executable or
  manual checks. This is accurate, not a defect — it reflects the manual-only validation this
  repository actually has. Populating the contract with a manual browser check is a reasonable
  follow-up, deliberately not done here.

## Findings Against The Tooling (First-Pilot Output)

Recorded because this was the tooling's first real-repository run:

1. **The migration gate is incompatible with default-branch-protected repositories.** `adopt-audit`
   and `plan-migration` hard-block on any branch other than `main`/`master`
   (`starter_kit/discovery.py`, the `unexpected_migration_branch` finding), with no flag, config, or
   environment override. Any repository whose rules forbid working on its default branch — including
   this one — cannot follow the documented flow without a workaround.
2. **Profile auto-detection self-detects the kit's own scaffolding.** `inspect` recommended
   `ai_enabled_application` at "high" confidence for a static marketing site with no AI
   functionality, because `ai/` and `.claude/skills/` produced `ai` and `prompt` signals.
   `web_application` was chosen instead. (Once the profile was set explicitly, the profile's own
   `ai_use` fact correctly derived to `false`.)
3. **Classification detection cannot see a real deployment target** — see deviation 3 above.
4. **Stale template content ships at the v3.7.0 tag.** All three `templates/migration/` files are
   still branded "V3.5", and `release/MIGRATION_GUIDE.md` is still titled "v3.5.0 to v3.6.0".
5. **Documented Python floor is not enforced.** `README.md` requires Python ≥ 3.11; every command in
   this migration ran on the machine's system Python 3.9.6 without error or warning.

## Rollback

- Kit-native: `rollback --run-id fe77c849-c844-4d8f-9949-0f9b4b910aa8`. The journal holds all 16
  pre-migration originals under `.starter-kit/migrations/fe77c849-.../backup/`. Non-destructive:
  post-transaction edits are reported as blockers rather than clobbered, so the manifest and
  classification edits above would need manual disposition.
- Git-level: all work is confined to `chore/migrate-starter-kit-v3.7`. Until that branch is merged,
  production is unaffected — do not merge, and optionally delete the branch.

## Follow-Up Completed — 2026-08-20

All four next actions were subsequently authorized and executed:

1. **Merged.** PR #6 squash-merged to `main` as `321404c`. Site content verified byte-identical
   across the merge, so the Pages republish was a no-op for visitors.
2. **Four web-quality modules enabled** — `accessibility`, `seo`, `web_performance`,
   `browser_matrix` (PR #7). Each adds a policy document under `docs/operations/`.
   **`visual_regression` was deliberately not enabled**: it is the one module of the five whose
   evidence contract (`visual_regression_review_record`) this repository cannot honestly satisfy,
   since it has no screenshot-baseline or image-diff tooling and no build step to produce one.
   Enabling a gate that can never be met would manufacture a permanent unmet obligation — the
   opposite of what the gate is for. Revisit if visual-diff tooling is ever adopted.
3. **Validation contract populated** (PR #7) with two manual checks — `static_site_http_smoke`
   (blocking, recorded passed with its real result) and `browser_visual_review` (non-blocking,
   pending a human). `quality --execute` now reports the specific
   `manual_check_unverified: browser_visual_review is pending` instead of the generic
   `no_quality_checks`, which is a truthful improvement rather than a silenced warning.
4. **Tooling findings reported** to the Starter Kit project — see the AntBrainOS vault
   `03_PROJECTS/Backlog/Project_Starter_Kit/DECISION_LOG.md`.

## Next Action

1. Perform the pending `browser_visual_review` manual check and record its result in
   `.starter-kit/validation-contract.json`.
2. Consider `visual_regression` only if image-diff tooling is adopted (see above).
3. Consider a release tag once the outstanding manual check is recorded.

---

# V3.4 Migration — 2026-07-29

Produced 2026-07-29 by executing `project-starter-kit-v3.4/00_EXECUTE_ME.md` in migration mode.
See `ADOPTION_POLICY.md` for the rules governing this migration. The audit script referenced there
is local tooling, not committed to this repository.

## Status

**Complete.** Installed, validated `PASS`, no existing file overwritten.

## Git State

Captured on `main` before branching, which is required — the audit blocks on any branch other than
`main`/`master` and on any dirty or untracked file.

- Branch: `main` (matches expected default)
- Matches expected default branch: yes
- Working tree clean: yes
- Remote: `origin https://github.com/rmz9dkfy5f-pixel/k-to-career-website.git`
- Pre-install audit: `Required files present: 2/28`, no unresolved conflicts,
  **Status: READY_FOR_REVIEW** (exit 0)
- Work was then done on `chore/v34-starter-kit-adoption`; `main` was never modified.

## Existing Instructions Found

- `CLAUDE.md` (105 lines) — the authoritative project contract: canonical repo structure, working
  mode, content rules, K to Career messaging rules, editing guardrails, planning standard,
  definition of done. **Preserved in full; V3.4 was appended to it.**
- `docs/workflow/claude-code-workflow.md` — pre-existing agent operating loop (repo start procedure,
  plan-first rule, slice approval standard). Left in place; the V3.4 loop extends it rather than
  replacing it.
- `docs/governance/REPOSITORY_HANDOFF_CONFIG.md` — already present and fully filled with real
  values. **Preserved; the all-`TBD` template was rejected.**
- `.claude/settings.json` — tracked permission deny-list. Untouched.
- No `AGENTS.md` existed. The kit's generic template was installed and then adapted to defer to
  `CLAUDE.md`.

## Legacy Continuity File Role Mapping

The audit found no legacy continuity filenames at the repository root, and that is correct rather
than a gap: this project's continuity records deliberately live in the AntBrainOS vault.

| Legacy file found | Nearest V3.4 equivalent | Decision |
|---|---|---|
| (none at repo root) | — | — |
| vault `CURRENT_CONTEXT.md` | `docs/project/STATUS.md` | Keep in vault; repo file is a pointer stub |
| vault `DECISION_LOG.md` | `docs/project/DECISION_LOG.md` | Keep in vault; repo file is a pointer stub |
| vault `SESSION_LOG.md` | `docs/governance/AGENT_RUN_LOG.md` | Keep both — different scopes. The vault log is the project's session history; the run log records agent runs against this repository. |
| vault `HANDOFF_TO_CLAUDE.md` | `AGENTS.md` / `CLAUDE.md` | Keep in vault |
| root `CHANGELOG.md` | `docs/project/CHANGELOG.md` | Keep root file canonical; repo stub points to it |
| `plans/k_to_career_action_plan.md` | `docs/project/{PROJECT_BRIEF,ROADMAP}.md` | Keep canonical; stubs point to it |
| `docs/workflow/claude-code-workflow.md` | `docs/governance/FIRST_SESSION_REHEARSAL.md` | Keep both; overlapping but not contradictory |

The audit only inspects the repository root, so it cannot see the vault records. The rows above were
mapped by hand.

## Agent-Neutral Handoff Gap

The audit reported "No Claude-specific handoff file found — no gap to report," which is accurate for
the repository but incomplete: a `HANDOFF_TO_CLAUDE.md` **does** exist, in the vault at
`03_PROJECTS/Active/K_to_Career_Website/`, with no agent-neutral equivalent beside it.

Within this repository the gap is now closed — `AGENTS.md` is the agent-neutral entry point and
`CLAUDE.md` is the Claude-specific one, and they do not contradict each other. The vault-side
asymmetry is out of scope here and is a vault concern.

## Compatibility Aliases To Preserve

- `CLAUDE.md` — referenced by name in `docs/workflow/claude-code-workflow.md`, the vault records,
  and `REPOSITORY_HANDOFF_CONFIG.md`. Must not be renamed or slimmed.
- `docs/governance/REPOSITORY_HANDOFF_CONFIG.md` — path was already established by commit `56a57e9`.
- `docs/Strategy/` and `docs/Standards/` — capitalised. Case matters on Linux; a lowercase
  reference has already caused a real fix (`661f2b1`).
- `plans/PLAN_TEMPLATE.md`, `plans/k_to_career_action_plan.md` — named canonical by `CLAUDE.md`.
- `index.html` at repository root — the GitHub Pages publish source and the target of
  `scripts/git-hooks/post-commit`.

## Files Installed

45 files written by the installer: 42 from `templates/base` and 3 from `templates/migration`.
0 errors, 0 skipped-as-identical.

- Root: `AGENTS.md`, `MODEL_SELECTION_GATE.md`, `PROMPT_MODEL_SELECTION_GATE.md`
- `.claude/skills/` and `.agents/skills/`: 4 skills each, byte-identical mirrors
- `docs/governance/`: 16 new files (the 17th already existed)
- `docs/project/`: 9 files, all converted to pointer stubs
- `ai/`: agent review gates, subagent roles, 3 prompts, `reports/.gitkeep`
- Migration overlay: `ADOPTION_POLICY.md` and `MIGRATION_REPORT.md` (both relocated from the
  repository root into `docs/governance/`, per this repo's canonical structure and because GitHub
  Pages serves the root); `00_MIGRATION_KICKOFF.md` deleted as a single-use kickoff prompt
  duplicating `00_EXECUTE_ME.md`.

Not committed, by design: `V34_INSTALL_REPORT.json` and `.v34_migration_review/` (generated), and
`project-starter-kit-v3.4/` itself (local tooling).

## Conflicts Sent To Review

Two, both resolved in favour of the existing file:

| Existing file | Decision |
|---|---|
| `CLAUDE.md` | **Kept.** The 34-line kit template would have replaced 105 lines of project-specific rules with generic ones. A compact V3.4 section was appended instead — additions only, zero deletions. |
| `docs/governance/REPOSITORY_HANDOFF_CONFIG.md` | **Kept.** The existing file holds real confirmed values; the template is entirely `TBD`. Edited by hand to correct one stale line and reconcile the Deployment Contract with the confirmed classification. |

`.v34_migration_review/` has been **deleted** now that both are resolved. This is required, not
tidying: the audit detects leftovers by scanning the filesystem, so any file left there would block
every future adoption audit permanently. Nothing was lost — both quarantined candidates were
verified byte-identical to their originals under `templates/base/`.

## Suggested Merges

All merges are complete. For the record:

- `CLAUDE.md` + V3.4 layer → append, never replace (as the `v34-migration-loop` skill prescribes).
- `AGENTS.md` → adapted to defer to `CLAUDE.md` rather than restate project rules in generic terms.
- `docs/project/` → pointer stubs, not content, to avoid duplicate sources of truth.

## Risks

Eight risks were opened in `PROJECT_RISK_REGISTER.md` (R-001…R-008) by the accompanying health
check. The ones created or sharpened by this migration specifically:

- **R-003** — two always-loaded instruction files can drift apart.
- **R-004** — committed docs reference `project-starter-kit-v3.4/scripts/*`, which is gitignored and
  absent from a fresh clone.
- **R-006** — this repository is public and Pages serves every root file, so all governance
  documentation added here is world-readable.
- **R-007** — `REPOSITORY_HANDOFF_CONFIG.md` depends on an external "Repo Push Super Prompt" for
  push/tag authorization, which is not registered in `AGENT_RUN_CONTRACT.md`. That table was left
  empty deliberately; its own instruction is "Do not invent a run type entry."

## Next Action

1. Review and merge the adoption PR. Merging is a production deployment — Pages publishes `main`.
2. After merge, re-run the adoption audit on `main`; it should report `28/28` and
   `READY_FOR_REVIEW`.
3. At the end of the first real working session, complete
   `docs/governance/FIRST_SESSION_REHEARSAL.md`. It is deliberately untouched — there is nothing to
   rehearse against until real work has been done under V3.4.
4. Decide R-006: is publishing operational coordinates in a public repository acceptable?
