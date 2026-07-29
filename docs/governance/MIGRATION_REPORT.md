# V3.4 Migration Report

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
