# AGENTS.md — K to Career Website

## Purpose

This file gives coding agents the minimum always-loaded guidance needed to work safely in this
repository. It is the agent-neutral entry point (Codex and others); Claude Code reads `CLAUDE.md`.

Detailed workflows live in skills and docs so this file stays concise.

## Precedence

`CLAUDE.md` is this repository's authoritative project contract. It defines the canonical repo
structure, the content rules, the K to Career messaging rules, the planning standard, and the
definition of done. **Read it before editing anything, whichever agent you are.**

This file adds the Project Starter Kit process layer on top (currently v3.10.0 — see
`.starter-kit/manifest.json` for the authoritative installed version). Where the two appear to
disagree, `CLAUDE.md` wins — flag the discrepancy rather than resolving it silently.

Three rules from `CLAUDE.md` are repeated here because violating them is unrecoverable:

- Do not fabricate impact metrics, partnerships, testimonials, or program outcomes.
- Keep audience paths distinct — students and parents, industry partners, donors and volunteers are
  separate messages with separate calls to action. Do not blend them.
- Do not invent strategy decisions the repository does not support. The primary website objective is
  now locked (students & families, first priority — see `CLAUDE.md`'s Project Identity section and
  the vault `DECISION_LOG.md`); anything else still open (site map, CMS, launch/hosting status, etc.)
  stays genuinely open — preserve that ambiguity rather than assuming an answer.

## Project Shape

Static HTML/CSS site. No framework, no build tool, no package manager, no CMS. The production site is
the root `index.html` on `main`, published by GitHub Pages. This repository is public — anything
committed here, including documentation, is world-readable.

## Agent Operating Rule

For any non-trivial task, use the Starter Kit loop:

```text
Inspect → Plan → Change → Verify → Document → Gate → Decide
```

Do not jump directly into edits.

## Step 0 — Determine Project Classification

Before anything else, read `docs/governance/PROJECT_CLASSIFICATION.md` and confirm (or fill in)
this repository's classification: vault-only, local non-Git, Git-backed, Git-backed with remote,
or Git-backed with deployment. Never guess it — leave it `TBD` if unconfirmed. This determines
which sections of `docs/governance/REPOSITORY_HANDOFF_CONFIG.md` apply.

## Mandatory Model Selection Gate

After classification, and before substantial work, read `MODEL_SELECTION_GATE.md` and show its
complete brief. If working in VS Code, show both Codex in VS Code and Claude Code in VS Code, then
choose a primary and fallback. The visible picker overrides dated model examples.

Also read `docs/governance/AGENT_RUN_CONTRACT.md` before implementation — it defines how any
named, repeatable run type for this repository should be registered and governed.

## Safety Rules

- Preserve existing project files.
- Do not overwrite user-authored files without explicit approval.
- Do not delete files unless the task explicitly requires deletion.
- Prefer small scoped changes over broad rewrites.
- Quarantine conflicts instead of forcing merges.
- If a command is destructive, explain the risk before running it.
- Do not claim success unless verification has run or you clearly state why verification could not run.

Repository-specific additions, from `docs/governance/REPOSITORY_HANDOFF_CONFIG.md`:

- `docs/Strategy/K_to_Career_Ecosystem.md` is a protected path — the business source of truth.
- Never force-push `main` or rewrite published history.
- Work on `feature/`, `fix/`, or `chore/` branches per `docs/workflow/branching-model.md`. Never
  commit directly to `main` — `main` is the live production site.
- Never merge `style/v1-reference` or `style/v2-reference` into `main`; they are design references.

## Required References

Before implementation, inspect relevant files from:

- `CLAUDE.md` — authoritative project contract (canonical structure, content and messaging rules)
- `MODEL_SELECTION_GATE.md`
- `docs/governance/PROJECT_CLASSIFICATION.md`
- `docs/governance/AGENT_RUN_CONTRACT.md`
- `docs/governance/REPOSITORY_HANDOFF_CONFIG.md`
- `docs/governance/DONE_CRITERIA.md`
- `docs/governance/PHASE_GATES.md`
- `docs/governance/CHANGE_CONTROL.md`
- `docs/governance/ROLLBACK_PLAN.md`
- `docs/governance/REPO_HEALTH_CHECK.md`
- `docs/governance/TEST_STRATEGY.md`
- `docs/governance/SECURITY_BASELINE.md`
- `ai/agents/AGENT_REVIEW_GATES.md`

`docs/governance/REPOSITORY_HANDOFF_CONFIG.md` is already filled in with real, confirmed values —
read it, do not regenerate it. When editing it, use only values discovered from the actual toolchain,
Git remotes, and deployment config; never a placeholder path or command presented as fact. Mark any
inapplicable section `N/A — <reason>` per its own instructions.

Note that `docs/project/` holds pointer stubs only. Each names the canonical source for that
information; the real content lives where `CLAUDE.md`'s Canonical Repo Structure section puts it, or
in the AntBrainOS vault for continuity records. Do not start writing project content into
`docs/project/` — that would create the duplicate sources of truth `CLAUDE.md` prohibits.

## Skills

Use these skills when available:

- `starter-execution-loop` for implementation, bugfixes, refactors, repo cleanup, and audit remediation.
- `starter-migration-loop` for migrating this repository to a newer kit release.
- `starter-production-readiness` for production readiness audits.
- `starter-context-eval-loop` for prompt, context, eval, and failure-loop work.
- `starter-module-management` for enabling, disabling, or reconfiguring optional capability modules.
- `starter-release-evidence` for assembling release/tag evidence without publishing.
- `starter-session-closeout` for closing a session with preserved validation/handoff evidence.
- `starter-session-start` for recovering repository state at the start of a session.

The four `v34-*` skills remain available as deprecated compatibility aliases through v4.0 — prefer
the `starter-*` names above.

## Output Standard

For substantial work, end with:

```md
## Status
PASS / PARTIAL / BLOCKED / FAIL

## What Changed
[List]

## Validation
[Commands and results]

## Risks
[Remaining issues]

## Next Action
[Commit / continue / rollback / user decision]
```

## Git Discipline

Use this sequence when changing the repo:

```text
check → fix → verify → document → commit suggestion
```

Do not commit unless the user asks you to commit.
