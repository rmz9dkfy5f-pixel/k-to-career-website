# CLAUDE.md

## Project Identity
This repository is for the **K to Career** website and related product work.

K to Career is a STEM learning and career-readiness ecosystem serving learners from early childhood through post-secondary and early career entry. The website must reflect the full K-to-career journey while staying concrete, outcome-oriented, and useful to distinct audiences.

Do not invent strategy decisions that the repository does not support. Unless the user has explicitly chosen otherwise, preserve flexibility around the primary website objective and audience prioritization.

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
