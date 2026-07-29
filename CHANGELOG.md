# Changelog

All notable changes to this project will be documented in this file.

The format is based on keeping release notes clear, versioned, and easy to review.

## [Unreleased]

### Changed
- Promoted the v3 site to the production root on `main` — `index.html`, `favicon-32.png`,
  `apple-touch-icon.png`, and `assets/images/logo.png` are now served from the repository root
  instead of `v3/`.
- Converted `v1` and `v2` from production folders into standalone style-reference branches
  (`style/v1-reference`, `style/v2-reference`).
- Added `docs/workflow/branching-model.md` documenting the branch model, and relocated v3's
  delivery/hosting docs to `docs/delivery/` and `docs/deployment/`.

### Pending
- Removal of the `v1/`, `v2/`, `v3/` folders and tracked delivery zips from `main`, plus
  `.gitignore`/`.claude/settings.json` hygiene, is open as a separate PR
  (`feature/remove-folder-versions`) — not yet merged. This entry will be promoted to a numbered
  `[1.3.0]` release once that PR merges and the tag is created.

### Fixes
- `CLAUDE.md`'s Canonical Repo Structure section referenced `docs/strategy/` (lowercase) in four
  places; the actual directory on disk is `docs/Strategy/` (capitalized). Corrected all four
  references so the operating instructions match the real repo structure.

## [1.2.0] - 2026-04-18

**K to Career v3 — Production Readiness Pass**

### What's New
- Mission & Vision section added above audience entry
- PATHWAYS acronym expansion displayed in program section

### Improvements
- Brand logo size increased in nav (76px → 100px)
- Footer logo blended into background via `mix-blend-mode:screen`
- About Us and Contact footer links wired to Smart Learning Solutions
- Email `info@ktocareer.org` added to footer

### Fixes
- "Five" competencies corrected to six
- Dead CTA buttons converted to non-interactive spans
- Pre-launch notice banner removed

### Performance & Accessibility
- CLS fixed on both logo images (`width`/`height` attributes)
- `fetchpriority="high"` on nav logo (LCP)
- `loading="lazy"` on footer logo
- `fonts.gstatic.com` preconnect added
- `aria-hidden="true"` on all emoji icons
- `<main>` landmark added

### SEO & Meta
- Meta description added
- Open Graph + Twitter Card tags added
- Canonical URL set to `www.ktocareer.org`

### Security
- `.claude/` added to `.gitignore`
- Favicon generated from brand logo (`favicon-32.png`, `apple-touch-icon.png`)

## [0.2.0] - 2026-04-15

### Added
- Added the V1 standalone HTML proof-of-concept file as the initial design reference and development starting point.

### Changed
- Restructured the repository root to support parallel website concept development.
- Added top-level folders for `V1`, `V2`, and shared project documentation.
- Standardized the repository layout for parallel concept development and future refinement.

### Notes
- This release establishes the working structure for parallel website concept development.
- V1 now has its initial proof-of-concept starting point in the repository.
- No public production site release yet.

## [0.1.0] - 2026-04-14

### Added
- Initial repository operating structure.
- Root `CLAUDE.md` for Claude Code project instructions.
- `.claude/settings.json` for Claude Code permissions and safety boundaries.
- `docs/strategy/K_to_Career_Ecosystem.md` as the core strategy and business-context document.
- `docs/workflow/claude-code-workflow.md` for Claude Code workflow guidance.
- `plans/PLAN_TEMPLATE.md` for task-specific planning.
- `plans/k_to_career_action_plan.md` as the active website planning document.
- `docs/standards/Version_Number_System.md` as the versioning policy document.

### Changed
- Standardized the long-term repository structure for strategy, workflow, planning, and standards.
- Established the workflow to use Plan Mode first and approve work in slices.

### Notes
- This release represents the project foundation and working system setup.
- No public site release yet.