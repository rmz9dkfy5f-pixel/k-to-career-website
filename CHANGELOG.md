# Changelog

All notable changes to this project will be documented in this file.

The format is based on keeping release notes clear, versioned, and easy to review.

## [Unreleased]

### Added
- Enabled the **`release_metadata`** Starter Kit module: `.starter-kit/release-manifest.json`
  (schema-validated release-state record — status, artifacts, checksums, compatibility,
  migration notes, evidence, publishing authorization) and `docs/release/RELEASE_EVIDENCE.md`.
  `version_source` was corrected from the kit's own generated default
  (`.starter-kit/version-state.json`, which tracks the *kit's* version) to `CHANGELOG.md`, where
  this site's own release versioning actually lives. Left at its honest seeded state
  (`release_status: candidate`, all evidence arrays empty) rather than backfilled for past
  releases — the schema describes a single in-flight release, not a historical ledger, so this
  becomes the real record starting with this project's next actual tagged release.
- Project Starter Kit upgraded **v3.7.0 → v3.10.0** (kit tag `v3.10.0`, commit `e95c597`). No new
  modules enabled (still `accessibility`, `seo`, `web_performance`, `browser_matrix` only — none of
  the new AI/agent or adaptive-context module clusters apply to a static site with no AI use).
  `CLAUDE.md`'s "V3.4 Agent Operating System" section and `AGENTS.md`'s Skills list — stale since
  the prior 3.4.3→3.7.0 migration, since both files are project-owned and never auto-upgraded — were
  hand-corrected to name the current `starter-*` skills instead of `v34-*`. Full record in
  `docs/governance/MIGRATION_REPORT.md`.
- Enabled four v3.7 **web-quality modules** — `accessibility`, `seo`, `web_performance`,
  `browser_matrix` — each adding a policy document under `docs/operations/`. All four are declared
  `optional_modules` for the `web_application` profile and satisfy their `required_signals`
  (`all_of: ["web"]`).
- Populated `.starter-kit/validation-contract.json` with two manual checks, replacing the generic
  `no_quality_checks` warning with named, actionable ones: `static_site_http_smoke` (blocking,
  recorded **passed** with its 2026-08-20 result) and `browser_visual_review` (non-blocking,
  **pending** a human). Manual checks — not executable ones — are the honest form here, since this
  repository has no test runner, linter, or build tool.
- Project Starter Kit upgraded **V3.4 → v3.7.0** (kit tag `v3.7.0`, commit `b172bc6`). Adds eight
  `starter-*` skills (session start/closeout, module management, release evidence, execution,
  migration, production readiness, context-eval), mirrored across `.claude/skills/` and
  `.agents/skills/`; the four `v34-*` skills remain as deprecated compatibility aliases through
  v4.0. Adds `.starter-kit/` state (manifest, profile, provenance, SBOM, threat model, privacy
  classification, security evidence) and `docs/security/V36_SECURITY_ASSURANCE_REPORT.md`.
- Release-gate facts recorded for this repository: `public_exposure=public`,
  `data_sensitivity=none`, `risk_level=low`, privacy `default_classification=public` — all
  evidence-backed (the site has no forms, inputs, analytics, trackers, database, or backend).

### Changed
- Enabled GitHub branch protection on `main`: force-pushes and branch deletion are now blocked
  (`enforce_admins: true`, `allow_force_pushes: false`, `allow_deletions: false`). No PR-review
  requirement was added — this repo has no CI and is solo-maintained, so `gh pr merge` and the
  existing PR-based workflow are unaffected. See `docs/governance/REPOSITORY_HANDOFF_CONFIG.md`'s
  Safety Boundaries section.
- Implemented the locked students-&-families audience-priority decision in `index.html`: the Hero
  section (with its student/family-facing primary CTA) now leads Mission & Vision in document
  order, instead of following it. The Students and Families cards in the Audience grid, and the
  combined Students & Families card in Get Involved, now carry a small "Start Here" badge. The
  Industry & STEM Professionals, Educators, and Donors & Supporters paths are unchanged in
  content, order, and styling — audience separation is preserved per `CLAUDE.md`.
- `docs/governance/PROJECT_CLASSIFICATION.md` now emits the kit's canonical machine token
  `git_backed_with_deployment` on its `Classification:` line, with the prose form preserved
  alongside. The kit's auto-detection had reported the less accurate `git_backed_with_remote`,
  which cannot account for GitHub Pages.
- `docs/governance/MIGRATION_REPORT.md` restructured to hold one section per migration, newest
  first, with the full v3.7.0 record added above the preserved V3.4 report.
- Resolved risk R-006 (public exposure of absolute local filesystem paths): moved
  `docs/governance/REPOSITORY_HANDOFF_CONFIG.md`'s repository root and Snapshot Destination by
  Machine table into the AntBrainOS vault; the repo file now points there instead of stating the
  values directly.

### Removed
- Deleted `Image 4-17-26 at 12.37 AM.PNG` (732 KB), a tracked, unreferenced binary at the repo
  root that was publicly served by GitHub Pages for no reason. Its git blob hash was confirmed
  identical to `assets/images/logo.png`'s before removal — a true byte-for-byte duplicate, not
  just a same-size coincidence. Resolves risk R-005.

### Fixed
- Regenerated `favicon-32.png` and `apple-touch-icon.png` from a square crop of the logo's
  graduation-cap glyph. The prior versions (added in `7961176`) squashed the full 3840×2160
  landscape wordmark straight into square canvases, making the browser-tab icon illegible and
  cropping the "to Career" text off the Apple touch icon. `favicon-32.png` is additionally
  thresholded to pure black/white — LANCZOS-resampled anti-aliasing left the thin line-art strokes
  a washed-out gray at 32×32, undermining the fix's own point; the 180×180 touch icon has enough
  resolution to stay crisp without thresholding. `index.html`'s icon `<link>` tags, paths,
  and MIME type were already correct — this only replaces the two image files.

### Notes
- **No site file changed.** `index.html`'s SHA-256 was verified byte-identical to `main` after the
  migration; `assets/` untouched. Local HTTP smoke test returned `200` for `/`, favicon,
  apple-touch-icon, and logo.
- No existing customized file was overwritten: all 21 conflicts were preserved, with the kit's
  proposed versions stored as candidates in the migration journal. `CLAUDE.md`, `AGENTS.md`, and
  `REPOSITORY_HANDOFF_CONFIG.md` are unchanged.
- The three root-level migration scaffolding files the kit installs were removed, matching the
  decision the V3.4 migration made for the same reasons (duplicate sources of truth, and Pages
  serving every root file).
- Validation: `validate`, `validate --release`, `validate --compatibility 3.4.3`, `doctor`,
  `status`, `security inspect/plan/apply`, `session-closeout`, and cold `session-start` all PASS.
  `quality --execute` reports PASS_WITH_WARNINGS (`no_quality_checks`), which accurately reflects
  this repository's manual-only validation.
- This was the first real-repository pilot of the kit's migration tooling; five findings against it
  are recorded in `docs/governance/MIGRATION_REPORT.md`.

## [1.4.1] - 2026-08-04

### Added
- Root `AGENT_HANDOFF.md`: a structured, agent-neutral startup provenance pointer for agents
  opening this repository cold, authored by the 2026-07-30 Codex session and published this
  release.

### Changed
- `docs/governance/REPOSITORY_HANDOFF_CONFIG.md` and `docs/project/CONTEXT.md` updated to
  reference the new `AGENT_HANDOFF.md` pointer.

### Notes
- No site file changed — docs/governance only. PR #4 (`chore-agent-handoff-provenance` → `main`)
  squash-merged as `d6d14b0`; tagged `v1.4.1`; canonical snapshot verified 71/71 files.

## [1.4.0] - 2026-07-29

### Added
- **Project Starter Kit V3.4 agent operating system**, installed in migration mode. Adds `AGENTS.md`
  as the agent-neutral entry point, `MODEL_SELECTION_GATE.md` and `PROMPT_MODEL_SELECTION_GATE.md`
  for pre-task routing, four workflow skills mirrored across `.claude/skills/` and `.agents/skills/`
  for Claude Code and Codex, 16 governance contracts under `docs/governance/`, pointer stubs under
  `docs/project/`, and agent prompts and review gates under `ai/`.
- `docs/governance/PROJECT_CLASSIFICATION.md` records this repository as **Git-backed with
  deployment**, confirmed from the live GitHub Pages configuration rather than assumed.
- `docs/governance/REPO_HEALTH_CHECK.md` (first health check: **PARTIAL**) and
  `docs/governance/PROJECT_RISK_REGISTER.md` (8 evidence-backed risks, R-001–R-008).
- `docs/governance/ADOPTION_POLICY.md` and `docs/governance/MIGRATION_REPORT.md` documenting how the
  migration was performed and what was decided.
- `plans/2026-07-29-v34-starter-kit-adoption.md`.

### Changed
- `CLAUDE.md` gains a V3.4 Agent Operating System section. All existing content is unchanged — the
  edit is additions only. It remains the authoritative project contract; `AGENTS.md` defers to it.
- `docs/governance/REPOSITORY_HANDOFF_CONFIG.md`: the runtime smoke test pointed at `v3/`, which was
  removed in v1.3.0 when the site moved to the repository root. Corrected. The Deployment Contract
  now records the real GitHub Pages target while keeping merging to `main` as an action that
  requires separate explicit authorization.
- `.gitignore`: added `!.claude/skills/` so agent skill files are trackable — `.claude/*` was
  silently making them unstageable. Also ignores the starter kit and its generated artifacts.

### Fixes
- `CLAUDE.md`'s Canonical Repo Structure section referenced `docs/strategy/` (lowercase) in four
  places; the actual directory on disk is `docs/Strategy/` (capitalized). Corrected all four
  references so the operating instructions match the real repo structure.

### Notes
- No site file changed. `index.html` and everything under `assets/` are untouched, so the published
  site is byte-identical.
- No existing file was overwritten. The installer preserved `CLAUDE.md` and
  `docs/governance/REPOSITORY_HANDOFF_CONFIG.md`; both were merged by hand.
- `docs/project/` deliberately holds pointer stubs only. Canonical documentation stays where
  `CLAUDE.md` puts it, and continuity records stay in the AntBrainOS vault.
- The primary website objective remains undecided by design, and `docs/project/PROJECT_BRIEF.md`
  explicitly declines to answer it.

## [1.3.0] - 2026-07-29

**Branch Model Recovery / v3 Main Alignment**

### Changed
- Promoted the v3 site to the production root on `main` — `index.html`, `favicon-32.png`,
  `apple-touch-icon.png`, and `assets/images/logo.png` are now served from the repository root
  instead of `v3/`.
- Converted `v1` and `v2` from production folders into standalone, pushed style-reference branches
  (`style/v1-reference`, `style/v2-reference`).
- Added `docs/workflow/branching-model.md` documenting the branch model, and relocated v3's
  delivery/hosting docs to `docs/delivery/` and `docs/deployment/` (correcting a stale claim in
  `HOSTING_NOTES.md` that GitHub Pages served from `/v3` — it was already serving `main` at root).
- Amended `.gitignore` in place (`*.zip`, `__MACOSX/`, fixed the `.claude/` negation) and added
  `.claude/settings.json`.

### Removed
- Removed the `v1/`, `v2/`, `v3/` folders and all tracked delivery `*.zip` packages from the
  production branch tip, along with the duplicate `.gitignore.txt`.

### Notes
- Future generated zip packages should be attached to GitHub Releases instead of committed to the
  repository.
- `main` is production. `style/v1-reference` and `style/v2-reference` are design references only —
  never merge them into `main`.

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
