# Agent Handoff

This is a repo-local startup pointer for K to Career Website audits. It exists to provide a
structured project-local provenance field for agents opening this repository cold.

It is not the canonical session log, decision log, or current context record. Those continuity
records remain in the AntBrainOS vault.

## Last Updated By

Claude Code — 2026-08-19 (Claude Code in VS Code; refreshed to match actual `main` state, which this
file had fallen one release behind)

## Repository Identity

- Project: K to Career Website
- Repository root: see AntBrainOS vault
  `03_PROJECTS/Active/K_to_Career_Website/REPOSITORY_HANDOFF_CONFIG_LOCAL.md` — moved out of this
  public repo 2026-08-20 to close risk R-006 (absolute local filesystem paths were world-readable
  via GitHub Pages)
- Branch at pointer creation: `main`
- HEAD at pointer creation: `d6d14b0e45e8231ef86003dbee7da7b662a26b83`
- Tag at pointer creation: `v1.4.1`
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

The latest confirmed K to Career project state is `main` at `d6d14b0`, tagged `v1.4.1`. The matching
vault records say the v1.4.1 merge, tag, and snapshot session was run in Claude Code on 2026-08-04
after a repository session-start recovery audit. Treat that as the latest *merged-to-main*
provenance unless newer K to Career repo or vault records say otherwise.

A 2026-08-19 Claude Code session (documentation-freshness pass; locked the primary website objective
to students & families) is committed on branch `chore/doc-freshness-and-audience-lock`, not yet
merged to `main` — pending explicit push/PR/merge authorization. See vault `SESSION_LOG.md` for the
full record. This file will be refreshed again once that branch merges.

## Routing Note

Do not use the vault-level `00_START_HERE/AGENT_HANDOFF.md` as K to Career provenance unless its
newest applicable entry names this repository — "K to Career Website" — or the canonical remote
`https://github.com/rmz9dkfy5f-pixel/k-to-career-website.git`. As of 2026-08-20 this file no longer
publishes the repository's local filesystem path (risk R-006); route by project name or remote URL
instead.

If this file conflicts with the repository Git state, treat Git as authoritative for code state and
lower provenance confidence until the vault project records are reconciled.
