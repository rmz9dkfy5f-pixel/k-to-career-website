# Claude Code Workflow Instructions

This repository should be worked in with a disciplined Claude Code workflow. The point is to reduce bad edits, avoid surprise changes, and keep approvals tight.

## Required Files
- `CLAUDE.md`
- `.claude/settings.json`
- `plans/PLAN_TEMPLATE.md`

## Repo Start Procedure
Always begin in the repo root.

1. Confirm the working directory.
2. Inspect the top-level structure.
3. Identify framework, package manager, routing, and content layout.
4. Review `CLAUDE.md` and `.claude/settings.json` before proposing any edits.
5. Start in **Plan Mode**.

## Plan-First Rule
Before making changes:
1. inspect the repo,
2. create a plan markdown file in `plans/`,
3. list affected files,
4. break work into approval slices,
5. get approval for the first slice.

Suggested plan filename pattern:
- `plans/2026-04-13-homepage-restructure.md`
- `plans/2026-04-13-content-model-cleanup.md`
- `plans/2026-04-13-pathways-page-copy.md`

## Slice Approval Standard
Do not approve broad refactors blindly.

Approve work in slices such as:
- content model only
- homepage only
- navigation only
- one form flow only
- accessibility fixes only

Each slice should include:
- changed files
- reason for the change
- validation performed
- known follow-up work

## What Claude Should Optimize For
- small blast radius
- explicit file scope
- visible validation
- audience-specific messaging
- maintainable code and content

## K to Career-Specific Guardrails
Claude should preserve alignment with the project materials:
- The organization spans STEM learning through career preparation.
- PATHWAYS is a concrete flagship-style offering.
- Website strategy should separate audience messaging.
- The site needs evidence and outcomes, not generic mission language.

## Bad Workflow Pattern
- jump straight into editing
- touch many files without a written plan
- combine strategy, design, and implementation in one approval step
- rewrite unrelated formatting
- invent claims not supported by program materials

## Good Workflow Pattern
- inspect
- plan
- approve slice 1
- edit
- validate
- summarize deltas
- approve next slice

## Suggested Commands
Use commands appropriate to the repo, such as:

```bash
pwd
ls -la
find . -maxdepth 2 -type f | sed 's#^./##' | sort
```

Then use repo-specific validation commands, for example:

```bash
npm run lint
npm run test
npm run build
```

Only run what is relevant to the slice.

## Recommended First Session Sequence
1. Open repo root.
2. Read `CLAUDE.md`.
3. Confirm Plan Mode.
4. Inspect structure.
5. Create a plan file from `plans/PLAN_TEMPLATE.md`.
6. Present slice 1.
7. After approval, make only slice 1 edits.
8. Validate and report.
