# Test Strategy

## Purpose

Define how this project proves changes work.

## Validation Priority

Use the strongest available validation in this order:

1. Automated tests
2. Build
3. Typecheck
4. Lint
5. Security/dependency scan
6. App-specific smoke test
7. Manual verification

## Project Commands

Confirmed 2026-07-29 by inspection: this repository contains no `package.json`, `pyproject.toml`,
`Makefile`, or `requirements.txt`. It is static HTML/CSS with no framework, build tool, or CMS.
There is no toolchain to define these commands, so every slot below is genuinely `none` — not
"unknown" and not "not yet filled in".

```bash
# install     — none
# test        — none
# build       — none (deploy is a static file copy)
# lint        — none
# typecheck   — none
# smoke test  — none automated; manual visual check of the root index.html in a browser
```

Do not add a command here that the toolchain does not actually provide. A plausible-looking
invented command is worse than an honest `none`, because it will be trusted and then silently fail.

Steps 1–5 of the Validation Priority above therefore do not apply to this repository. Real
validation is step 6 (manual browser smoke test) and step 7 (manual verification), matching
`REPOSITORY_HANDOFF_CONFIG.md`'s Validation Contract.

For markup or CSS changes, the smoke test is: confirm the page renders, the title is correct, and
`favicon-32.png`, `apple-touch-icon.png`, and `assets/images/logo.png` all resolve. Documentation-only
changes need no runtime check.

## Test Case Types

- Normal path
- Edge case
- Bad input
- Regression case
- Security-sensitive case
- Compatibility case

## Failure Rule

If validation fails, do not mark PASS. Fix the relevant issue or mark PARTIAL/BLOCKED with the failure documented.
