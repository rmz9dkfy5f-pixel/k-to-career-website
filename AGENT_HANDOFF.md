# Agent Handoff

This is a repo-local startup pointer for K to Career Website audits. It exists to provide a
structured project-local provenance field for agents opening this repository cold.

It is not the canonical session log, decision log, or current context record. Those continuity
records remain in the AntBrainOS vault.

## Last Updated By

Claude Code — 2026-09-06 (Claude Code in VS Code; recording PR #14's merge — Starter Kit upgraded
v3.7.0 → v3.10.0, `release_metadata` module enabled)

## Repository Identity

- Project: K to Career Website
- Repository root: see AntBrainOS vault
  `03_PROJECTS/Active/K_to_Career_Website/REPOSITORY_HANDOFF_CONFIG_LOCAL.md` — moved out of this
  public repo 2026-08-20 to close risk R-006 (absolute local filesystem paths were world-readable
  via GitHub Pages)
- Branch at pointer creation: `main`
- HEAD at pointer creation: `a812475e3e71913a8f5686e371b01fbc36f5076f`
- Tag at pointer creation: `v1.6.3` — points one commit behind current HEAD (at `c9b9c18`); this
  and the previous commit (`a812475`, the `AGENT_HANDOFF.md` backfill itself) are the super
  prompt's own trailing bookkeeping, explicitly exempt from needing a new tag — see Section 7 step
  12's loop guard
- Canonical remote: `https://github.com/rmz9dkfy5f-pixel/k-to-career-website.git`

## Canonical Continuity Records

Use the AntBrainOS project folder for durable project continuity:

```text
03_PROJECTS/Active/K_to_Career_Website/PROJECT.md
03_PROJECTS/Active/K_to_Career_Website/CURRENT_CONTEXT.md
03_PROJECTS/Active/K_to_Career_Website/SESSION_LOG.md
03_PROJECTS/Active/K_to_Career_Website/DECISION_LOG.md
03_PROJECTS/Active/K_to_Career_Website/HANDOFF_TO_CLAUDE.md
04_CONTEXT_PACKETS/Project_Context/K_to_Career_Website_CONTEXT_PACKET.md
```

This file may summarize provenance for startup routing, but it must not become a second session log.

## Latest Project-Specific Provenance

The latest confirmed K to Career project state, as of this backfill, is `main` at `c9b9c18`,
tagged `v1.6.3` (remote tag independently verified). Prior tagged state was `v1.5.1` at `6a5e084`
(2026-08-20, R-006 remainder + favicon regeneration).

**2026-08-24, Claude Code session:** a repository session-start recovery audit (Verdict `PASS WITH
CONDITIONS`, provenance Confirmed); implemented the locked students-&-families audience-priority
decision in `index.html` — Hero now leads Mission & Vision in document order, Students/Families
entry cards carry a "Start Here" badge (PR #8, `cb14503`, tagged `v1.6.0`); recorded the
user-confirmed `browser_visual_review` validation check as passed (PR #9, `d4c7053`, tagged
`v1.6.1`); removed a 732 KB unreferenced duplicate image confirmed byte-identical to
`assets/images/logo.png` via matching git blob hash, closing risk R-005 (PR #10, `46f2cc4`,
tagged `v1.6.2`).

**2026-08-26, Claude Code session:** enabled GitHub branch protection on `main` (safety-net tier:
blocks force-pushes and branch deletion, `enforce_admins: true`; no PR-review requirement, since
this repo has no CI and is solo-maintained) — applied directly via the GitHub API, verified by
read-back before recording (PR #11, `c9b9c18`, tagged `v1.6.3`). This backfill itself, per the
Repo Push/Session-End Super Prompt's mandatory Final Backfill step.

See vault `SESSION_LOG.md` for the full record of every push above, including PR #12
(`a812475`), which merged this same file's initial backfill — the very thing this correction is
patching.

**2026-09-06, Claude Code session:** upgraded the installed Project Starter Kit **v3.7.0 →
v3.10.0** using the kit's own tool-driven migration mechanism, then enabled the `release_metadata`
module (formalizing this repo's existing by-hand release practice — CHANGELOG, tags, checksummed
snapshots — as a schema-validated record; left honestly at its seeded `candidate` state, not
backfilled for past tags). No site content changed — `index.html`/`assets/` confirmed
byte-identical throughout. `validate`, `validate --release`, `quality --execute`, and
`security inspect` all `PASS`. PR #14 squash-merged as `5880df1`; branch deleted. No new tag or
canonical snapshot created this pass — that remains a separate, not-yet-requested action, per this
repo's established pattern of treating merge and tag/snapshot as distinct authorization events.
Full technical record: `docs/governance/MIGRATION_REPORT.md`'s "v3.10.0 Migration" section; vault
`SESSION_LOG.md`/`DECISION_LOG.md`, 2026-09-06.

## Recommended Next Task

User-confirmed (2026-08-26 session-end closeout, Step 4a gate re-run after PR #12 merged and
invalidated the prior pick, recorded verbatim): **confirm client launch status and intended
hosting platform** — open since 2026-06-25 (custom domain `www.ktocareer.org` vs. GitHub Pages;
see `docs/deployment/HOSTING_NOTES.md`). Ranked below it, not chosen: gathering real impact proof
points; fixing R-008's stale `docs/workflow/branching-model.md` wording. Do not substitute a
different starting point without re-confirming.

## Routing Note

Do not use the vault-level `00_START_HERE/AGENT_HANDOFF.md` as K to Career provenance unless its
newest applicable entry names this repository — "K to Career Website" — or the canonical remote
`https://github.com/rmz9dkfy5f-pixel/k-to-career-website.git`. As of 2026-08-20 this file no longer
publishes the repository's local filesystem path (risk R-006); route by project name or remote URL
instead.

If this file conflicts with the repository Git state, treat Git as authoritative for code state and
lower provenance confidence until the vault project records are reconciled.
