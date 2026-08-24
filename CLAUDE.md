# CLAUDE.md

## Project Identity
This repository is for the **K to Career** website and related product work.

K to Career is a STEM learning and career-readiness ecosystem serving learners from early childhood through post-secondary and early career entry. The website must reflect the full K-to-career journey while staying concrete, outcome-oriented, and useful to distinct audiences.

Do not invent strategy decisions that the repository does not support. Where a decision is still open, preserve flexibility rather than assuming an answer.

**Primary website objective — locked 2026-08-19:** students and families are the first-priority audience. This governs sequencing and emphasis (which message leads, which call to action is primary) — it does not override the audience-separation rule below; industry partners and donors/volunteers keep their own distinct paths and CTAs. Decided explicitly by the project owner; see AntBrainOS vault `03_PROJECTS/Active/K_to_Career_Website/DECISION_LOG.md` for the full record. Site content/CTA-hierarchy changes to reflect this were authorized and implemented 2026-08-24 (`index.html`'s Hero now leads Mission & Vision in document order; Students/Families entry cards carry a "Start Here" badge) — see `CHANGELOG.md` and this repo's `plans/` directory for the change record.

## Canonical Repo Structure
Treat this structure as the source of truth for where information belongs:

- `docs/Strategy/` = business context, program context, and strategic reference documents
- `docs/workflow/` = Claude Code operating instructions and team workflow documents
- `plans/` = active task plans, execution plans, and planning templates

Canonical files:
- `docs/Strategy/K_to_Career_Ecosystem.md` = primary business and program context document
- `docs/workflow/claude-code-workflow.md` = Claude Code workflow and operating process
- `plans/PLAN_TEMPLATE.md` = template for new task plans
- `plans/k_to_career_action_plan.md` = current website planning document

File placement rules:
- New strategy or reference docs go in `docs/Strategy/`
- New workflow/process docs go in `docs/workflow/`
- New task-specific implementation or execution plans go in `plans/`
- Do not create duplicate versions of the same plan or strategy doc in multiple folders unless explicitly requested

## Working Mode
- Start in the repo root
- Read relevant files before proposing edits
- Use Plan Mode first for any non-trivial task
- For multi-step work, create or update a markdown plan file in `plans/` before making broad edits
- Keep plans concrete: scope, files to review, files to change, risks, validation, and rollback
- Approve and execute changes in small slices
- Validate after each slice using the narrowest useful checks first

## Repo Interpretation Rules
- Treat files in `docs/Strategy/` as reference material and business truth, not task checklists
- Treat files in `plans/` as active execution artifacts
- When strategy and implementation conflict, flag the conflict instead of guessing
- When requirements are missing, identify assumptions explicitly before editing
- Do not overwrite strategic ambiguity with invented certainty

## Content Rules for This Repo
- Avoid vague nonprofit language, inflated mission copy, and generic claims
- Use direct, plain language tied to real programs, outcomes, and audiences
- Keep audience paths distinct: students and parents, industry partners, donors and volunteers should not be blended into one generic message
- Show proof where available: outcomes, testimonials, participation numbers, certifications, placements, scholarships, partnerships, or program evidence
- Do not fabricate impact metrics, partnerships, testimonials, or program outcomes
- Keep calls to action explicit and audience-specific

## K to Career Messaging Rules
- Preserve the organization's focus on STEM access, industry connection, career readiness, and inclusion
- Recognize that the ecosystem spans early learners through post-secondary and career-connected learners
- When writing about the PATHWAYS program, keep it concrete: weekend enrichment, professional development, mentorship, hands-on workshops, and real-world STEM exposure
- Keep copy grounded in actual offerings rather than inspirational filler

## Editing Guardrails
- Do not rewrite unrelated files
- Do not reformat the entire repo unless explicitly asked
- Do not introduce new dependencies without a clear reason in the plan
- Do not merge multiple large concerns into one unreviewable edit
- Do not move canonical docs without updating any references that depend on them
- Keep strategy work, content work, and implementation work logically separated

## Planning Standard
Every non-trivial plan in `plans/` should include:
- Objective
- Current State
- Assumptions
- Constraints
- Files to Review
- Files to Change
- Slice Plan
- Validation
- Risks
- Rollback
- Open Questions

## Preferred Execution Pattern
1. Inspect repo root and relevant canonical docs
2. Summarize the current state
3. Create or update a plan in `plans/`
4. Get approval on the plan or first slice
5. Execute one slice
6. Validate
7. Report what changed, what remains, and any new risks

## Default Response Shape
When working in this repo, respond in this order when practical:
1. What you found
2. What you plan to change
3. What files are affected
4. What checks you will run
5. What changed after the slice

## Definition of Done
A task is not done until:
- the approved slice is complete
- relevant checks pass or failures are clearly explained
- changed files are listed
- obvious regressions are considered
- the user can review the work in a bounded, understandable scope

## V3.4 Agent Operating System

This repository runs Project Starter Kit V3.4. Everything above remains authoritative for what to
write and where it belongs; V3.4 adds the process layer around it.

Before substantial work:
1. Confirm the classification in `docs/governance/PROJECT_CLASSIFICATION.md`.
2. Read `MODEL_SELECTION_GATE.md` and show its complete brief. In VS Code, compare Codex and Claude
   Code, then pick a primary and a fallback.
3. Read `docs/governance/AGENT_RUN_CONTRACT.md` before implementation.

`AGENTS.md` carries the same operating rules in agent-neutral form for Codex and other agents. It
defers to this file on project structure, content rules, and messaging — where the two appear to
disagree, this file wins and the discrepancy should be flagged rather than resolved silently.

Skills (`/v34-execution-loop`, `/v34-migration-loop`, `/v34-production-readiness`,
`/v34-context-eval-loop`) live in `.claude/skills/`, mirrored to `.agents/skills/` for Codex. The
execution loop is `Inspect → Plan → Change → Verify → Document → Gate → Decide`, which extends rather
than replaces the Preferred Execution Pattern above.

Governance and project docs added by V3.4:
- `docs/governance/` = quality gates, run contracts, risk, rollback, security, release readiness
- `docs/project/` = pointer stubs only; each names the canonical source for that information
- `ai/` = agent prompts, review gates, subagent roles, run reports

`docs/project/` deliberately holds no content of its own. This repo's canonical sources stay where
the Canonical Repo Structure section above puts them, and the continuity records (session log,
decision log, current context, handoff) live in the AntBrainOS vault, not in this repository.

Validation for this repo is manual — there is no build tool, test runner, or linter. See
`docs/governance/TEST_STRATEGY.md`. Do not invent a validation command that the toolchain does not
actually provide.
