# Adoption Policy — Bringing an Existing Repository Onto V3.4

Rules for migrating an already-mature repository onto V3.4 without disrupting it. These apply in
addition to the general safety rules in `AGENTS.md`.

## Before Installing Anything

Run `project-starter-kit-v3.4/scripts/v34_adoption_audit.py --target <this repo>` first — local
tooling, not committed to this repository; obtain it from the Project Starter Kit V3.4
distribution. It is strictly read-only — it
never writes into this repository. Read its full report, especially:

- Any `BLOCKED` status (dirty working tree, non-default branch, unresolved
  `.v34_migration_review/` conflicts) — resolve these first, on their own, before touching V3.4.
- The Legacy Continuity File Role Mapping table — every pre-existing file with a mapped V3.4
  equivalent represents a decision, not an automatic replacement.

## Rule 1 — Never Silently Replace a Legacy File

If this repository already has its own `STATUS.md`, `CONTEXT.md`, `DECISION_LOG.md`, or similar
file that a V3.4 template would also create, do not overwrite, rename, or delete it. Record it as
an alias of its nearest V3.4 equivalent and decide, explicitly, whether to merge, keep both, or
retire the older one — never as a side effect of running the installer.

## Rule 2 — Add Missing Contracts Only After Project-Specific Approval

The adoption audit finding "no structural blockers" is informational, not authorization. Installing
any missing V3.4 file (including `docs/governance/PROJECT_CLASSIFICATION.md`,
`AGENT_RUN_CONTRACT.md`, `REPOSITORY_HANDOFF_CONFIG.md`, `FIRST_SESSION_REHEARSAL.md`) into this
specific repository requires its own explicit approval — the audit alone never grants it.

## Rule 3 — One Repository at a Time

Each adoption pass targets exactly one repository. Do not batch multiple repositories into a
single migration run, even if several were audited around the same time.

## Rule 4 — Preserve Compatibility Aliases

Before removing or renaming any legacy filename the audit flagged, confirm nothing else — another
script, a CI job, a deployment step, a habit documented elsewhere — depends on that exact name.
When in doubt, keep the legacy file in place and add the V3.4 file alongside it rather than
replacing it.

## Rule 5 — The Gate

A migration into this repository is only complete when it has preserved: full Git history, all
user changes, this repository's own existing conventions, and its existing deployment behavior.
If any of those would be put at risk, stop and ask before continuing.
