# Agent Handoff

This is a repo-local startup pointer for K to Career Website audits. It exists to provide a
structured project-local provenance field for agents opening this repository cold.

It is not the canonical session log, decision log, or current context record. Those continuity
records remain in the AntBrainOS vault.

## Last Updated By

Claude Code — 2026-08-20 (Claude Code in VS Code; refreshed to match actual `main` state, which this
file had fallen three commits and one full release behind)

## Repository Identity

- Project: K to Career Website
- Repository root: see AntBrainOS vault
  `03_PROJECTS/Active/K_to_Career_Website/REPOSITORY_HANDOFF_CONFIG_LOCAL.md` — moved out of this
  public repo 2026-08-20 to close risk R-006 (absolute local filesystem paths were world-readable
  via GitHub Pages)
- Branch at pointer creation: `main`
- HEAD at pointer creation: `813b62f90fae5760d4d552ad3ae342436b964914`
- Tag at pointer creation: this push will be tagged `v1.5.1`, applied in Section 7 of the session-end
  super prompt (not yet an actual git ref as of this commit)
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

The latest confirmed K to Career project state, as of this pointer's refresh, is `main` at
`813b62f`, about to be tagged `v1.5.1` (Section 7 of this session's push workflow). Prior tagged
state was `v1.5.0` at `53f5d2d` (2026-08-20, Starter Kit v3.7.0 migration + web-quality modules).

This 2026-08-20 Claude Code session, run directly on `main` (no feature branch — a deviation from
this repo's usual PR-based pattern, flagged during session-end): a repository session-start
recovery audit (Verdict PASS WITH CONDITIONS, previous-agent provenance Confirmed as this same
agent/session); the user-confirmed R-006 remainder fix (`346aa90` — scrubbed four leftover
absolute-path instances plus a fifth a code-review pass caught in `scripts/git-hooks/post-commit`,
corrected R-002's wrong location, redacted the private Starter Kit repo's name); a precision
correction to that same fix's own overclaimed grep scope (`76d659d`); and a favicon/apple-touch-icon
regeneration (`813b62f`) fixing a real, pre-existing bug found while investigating an unrelated
report that turned out to be a local Live Server artifact — the prior icons squashed the full
landscape wordmark into square canvases, illegible at actual size. See vault `SESSION_LOG.md` for
the full record of all three.

## Routing Note

Do not use the vault-level `00_START_HERE/AGENT_HANDOFF.md` as K to Career provenance unless its
newest applicable entry names this repository — "K to Career Website" — or the canonical remote
`https://github.com/rmz9dkfy5f-pixel/k-to-career-website.git`. As of 2026-08-20 this file no longer
publishes the repository's local filesystem path (risk R-006); route by project name or remote URL
instead.

If this file conflicts with the repository Git state, treat Git as authoritative for code state and
lower provenance confidence until the vault project records are reconciled.
