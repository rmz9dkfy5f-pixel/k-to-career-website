# Plan: Hero-First Section Order + Audience-Priority Hierarchy

## Objective
Implement the locked 2026-08-19 audience-priority decision ("students and families are the
first-priority audience," governing sequencing/emphasis, not exclusivity) in `index.html`:
reorder so the Hero section leads Mission & Vision, and give the Students/Families entry points a
light visual priority signal, without touching the distinct Industry Partners / Educators /
Donors paths.

## Current State
`<main>`'s document order had generic Mission & Vision copy before the specific, CTA-bearing Hero
section — every visitor saw broad nonprofit language before the hero and its "Apply for
PATHWAYS" CTA. The nav CTA and hero's own CTA already defaulted correctly to
"Apply for PATHWAYS." The Audience (4-card) and Get Involved (3-card) grids already listed
Students/Families first in reading order but gave every card identical visual weight.

## Assumptions
- "Emphasis" in the locked decision means more than reading order alone (which already existed),
  so a light visual differentiator (badge) is in scope — confirmed with the project owner.
- Updating `CLAUDE.md`'s "not-yet-authorized" wording in the same PR is a documentation-status
  edit, not a new strategy decision.

## Constraints
- Static HTML/CSS only, single file, no build step.
- Do not touch Program, Age Groups, Outcomes, track pills, `<head>` meta/OG tags, or Footer.
- Do not resize, reorder, or de-emphasize the Industry/STEM Partners, Educators, or
  Donors/Supporters cards — audience separation is preserved per `CLAUDE.md`.
- Work on a `feature/` branch, open a PR, stop before merge (merging publishes via GitHub Pages
  and needs its own separate authorization).

## Files to Review
- `index.html`
- `CLAUDE.md` (Project Identity section)
- `.starter-kit/validation-contract.json`
- `docs/workflow/branching-model.md`

## Files to Change
- `index.html`
- `CLAUDE.md`
- `CHANGELOG.md`
- `.starter-kit/validation-contract.json`

## Slice 1
**Goal** Hero leads; Mission & Vision follows it, with zero CSS change.

**Planned edits**
- Move the `<!-- MISSION & VISION -->` `<section class="mission">...</section>` block to
  immediately after the Hero section's closing `</section>`.
- No CSS changes — confirmed no order-dependent selectors target `.mission`/`.hero`.

**Validation**
- `git diff index.html` shows a block relocation only.

## Slice 2
**Goal** Give Students/Families entry points a light priority signal without resizing grids or
touching other audience cards.

**Planned edits**
- Add a `.audience-badge` CSS rule (small teal pill, white text).
- Add a `<span class="audience-badge">Start Here</span>` to the Students card, the Families card
  (Audience grid), and the combined Students & Families card (Get Involved grid).
- Educators, STEM Partners, Industry & STEM Professionals, and Donors & Supporters cards
  unchanged.

**Validation**
- Visual check: badge legible on both card backgrounds; grid column counts and responsive
  breakpoints unchanged.

## Slice 3
**Goal** Documentation reconciliation.

**Planned edits**
- `CLAUDE.md`: replace the "not-yet-authorized pass" wording with a note that this pass shipped
  2026-08-24.
- `CHANGELOG.md`: add a `### Changed` bullet under `[Unreleased]`.
- `.starter-kit/validation-contract.json`: re-record `static_site_http_smoke`'s result for this
  pass; leave `browser_visual_review` `pending` for a human.

**Validation**
- Re-read `CLAUDE.md`'s Project Identity section for consistency.

## Risks
- Badge styling could clash on faint card backgrounds if contrast isn't checked before commit —
  mitigated by an explicit visual check.
- Reordering Mission after Hero changes what a screen reader/SEO crawler encounters first — this
  is the intended effect of the locked decision.
- `<head>` meta/OG description still leads with mission-style framing — explicitly out of scope
  for this pass (confirmed with the project owner).

## Rollback
`git checkout main -- index.html CLAUDE.md CHANGELOG.md .starter-kit/validation-contract.json`
on the feature branch, or close the PR without merging — `main` is untouched throughout.

## Open Questions
None outstanding — grid badge scope, the `CLAUDE.md` wording update, and the meta-description
scope were all resolved with the project owner before implementation.
