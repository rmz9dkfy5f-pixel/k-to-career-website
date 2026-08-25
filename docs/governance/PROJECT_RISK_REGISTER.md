# Project Risk Register

Opened 2026-07-29 by the first V3.4 repo health check. Every row below cites evidence found in this
repository — none is speculative.

| ID | Risk | Impact | Likelihood | Mitigation | Owner | Status |
|---|---|---:|---:|---|---|---|
| R-001 | No automated validation exists — no tests, build, lint, or typecheck. Every change is verified by eye, so a regression can reach the live site unnoticed. | High | Medium | Manual smoke test per `TEST_STRATEGY.md` on any markup/CSS change; consider the kit's opt-in Lighthouse/axe audit pack | Project owner | Open |
| R-002 | Continuity records (session log, decision log, current context, handoff) live outside the repo, in the AntBrainOS vault at `03_PROJECTS/Active/K_to_Career_Website/`. An agent without vault access cannot reach them. | High | Medium | `AGENTS.md` and `docs/project/` stubs name the location explicitly so the gap is visible rather than silent | Project owner | Open |
| R-003 | Two always-loaded instruction files (`CLAUDE.md`, `AGENTS.md`) can drift apart and give agents contradictory rules. | Medium | Medium | `AGENTS.md` defers to `CLAUDE.md` by design and duplicates only three rules; re-check both when either changes | Project owner | Open |
| R-004 | Committed docs reference `project-starter-kit-v3.4/scripts/*`, which is gitignored and absent from a fresh clone. Those commands cannot be run by anyone who only has the repo. | Low | High | Every such reference is worded as local tooling obtainable from the V3.4 distribution | Project owner | Open |
| R-005 | `Image 4-17-26 at 12.37 AM.PNG` — 732 KB, tracked at repo root, referenced by zero files, publicly served by Pages. | Low | High | Confirmed via matching git blob hash (`79642d9...`) to be byte-identical to `assets/images/logo.png` before removal — not assumed from file size alone. Removed 2026-08-24. | Project owner | Resolved 2026-08-24 |
| R-006 | This repository is public and GitHub Pages serves every root-level file. All governance documentation added here is world-readable, and `REPOSITORY_HANDOFF_CONFIG.md` contained absolute local filesystem paths. | Medium | High | Project owner chose "remove" 2026-08-19: repository root and the Snapshot Destination by Machine table (paths + `ComputerName` detection) moved to AntBrainOS vault `03_PROJECTS/Active/K_to_Career_Website/REPOSITORY_HANDOFF_CONFIG_LOCAL.md`; repo file now points there. 2026-08-20 addendum: four remaining absolute-path instances found in `AGENT_HANDOFF.md` (x2), `docs/governance/AGENT_RUN_LOG.md`, and this register's own R-002 row were scrubbed using the same vault-pointer redaction pattern; a follow-up sweep of all tracked files (not just markdown) found two more in `scripts/git-hooks/post-commit`, fixed by reading `$HOME` instead of a hardcoded username, with an env-var override added; a repo-wide `git grep` across all tracked files (excluding the historical `CHANGELOG.md` and this session's own plan file) confirms zero *real* absolute local filesystem paths remain tracked in this repo — `snapshots.csv` still matches the raw grep pattern, but its `/Users/<USER>/...` entries are pre-existing placeholder redactions from an earlier pass, not real paths | Project owner | Resolved 2026-08-19; extended 2026-08-20 |
| R-007 | `REPOSITORY_HANDOFF_CONFIG.md` names an external "Repo Push Super Prompt" as this repo's commit/push and tag/release authorization rule, but that procedure lives outside the repository and is not registered in `AGENT_RUN_CONTRACT.md`. Its stop conditions are not knowable from this repo. | Medium | Medium | Register it as a run type if it becomes a repeatable run for this repository; do not invent its contents | Project owner | Open |
| R-008 | Documentation drift: `docs/workflow/branching-model.md`'s "Known Follow-Up" section describes folders and zips that were removed in `7f2fdfa`. | Low | High | Recorded in `REPO_HEALTH_CHECK.md`; deferred to its own change | Project owner | Open |

## Risk Categories

- Security
- Data loss
- Build failure
- Deployment failure
- Compatibility
- Performance
- Accessibility
- Maintainability
- Agent misuse
- Documentation drift
