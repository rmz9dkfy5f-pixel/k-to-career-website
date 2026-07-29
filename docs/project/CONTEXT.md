# Context

> **Pointer only — no content lives in this file.**
> This repository keeps its canonical documentation where `CLAUDE.md`'s Canonical Repo Structure
> section puts it. `docs/project/` exists because Project Starter Kit V3.4 expects these paths;
> duplicating content here would create the competing sources of truth `CLAUDE.md` prohibits.

## Canonical sources

| For | See |
|---|---|
| Durable operating rules for this repo | `CLAUDE.md` (authoritative), `AGENTS.md` |
| Business and program facts | `docs/Strategy/K_to_Career_Ecosystem.md` |
| Cross-session continuity | vault: `03_PROJECTS/Active/K_to_Career_Website/CURRENT_CONTEXT.md` |
| Workflow expectations | `docs/workflow/claude-code-workflow.md` |

## Repeated corrections

Facts worth recording here are ones an agent has got wrong more than once.

- **The site is at the repository root, not `v3/`.** The `v3/` folder was removed in v1.3.0.
  Several documents still carried stale `v3/` paths afterwards.
- **`docs/Strategy/` and `docs/Standards/` are capitalised**; `docs/workflow/`, `docs/delivery/`,
  `docs/deployment/`, `docs/governance/`, and `docs/project/` are not. Lowercase `docs/strategy/`
  references have needed fixing before, and case matters on Linux even though macOS hides it.
- **There is no build, test, or lint command.** Do not invent one; see
  `docs/governance/TEST_STRATEGY.md`.
