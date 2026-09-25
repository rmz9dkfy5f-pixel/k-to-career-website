# Accessibility & Performance Remediation

Date: 2026-09-25
Status: Executed — validated, not yet committed

## Objective

Close the P1/P2 accessibility and page-weight findings that the 2026-09-21/23 production audit
recorded and deliberately deferred, plus three related gaps found while scoping this work. No visual
redesign.

## Current State (at start)

- `main` clean at `f886fef`, tag `v1.8.0`. Live on GitHub Pages, byte-identical to HEAD.
- Deferred audit findings (`AGENT_HANDOFF.md:104-118`): tap targets under 44px, no `aria-expanded`
  on the hamburger, no visible focus styles, 732 KB `logo.png`.
- Additional gaps found during scoping: no skip link, no `prefers-reduced-motion` support, and the
  mobile menu could be stranded open by widening the viewport past 600px.

## Assumptions

- Visual design is settled; these are corrective fixes.
- Evergreen browser targets — `:focus-visible`, `inert`, `matchMedia.addEventListener` are shipped
  in Chromium, Firefox and WebKit.
- The 4K logo master stays recoverable from git history, so in-place replacement is reversible.

## Constraints

- No new dependencies, build step, or tooling (`docs/governance/TEST_STRATEGY.md` — validation is
  manual).
- Minimal diffs; no unrelated cleanup bundled.

## Files Reviewed

`index.html`, `assets/images/logo.png`, `AGENT_HANDOFF.md`, `docs/governance/COMPATIBILITY_MATRIX.md`,
`docs/governance/REPO_HEALTH_CHECK.md`, `docs/governance/PROJECT_RISK_REGISTER.md`,
`docs/deployment/HOSTING_NOTES.md`, `docs/delivery/HANDOFF_README.md`.

## Files Changed

| File | Change |
|---|---|
| `index.html` | Focus styles, skip link, ARIA + focus management, menu guard, tap targets, reduced motion |
| `assets/images/logo.png` | 3840×2160 RGB → 640×360 grayscale; 732,847 → 21,727 bytes |
| `docs/delivery/HANDOFF_README.md` | Logo dimensions corrected; master's git blob SHA recorded |
| `CHANGELOG.md` | `[Unreleased] → Fixed` entry |

## Slice Plan (as executed)

1. Logo resize (isolated, independently verifiable)
2. Inline script replacement — ARIA state, focus management, Escape, breakpoint sync
3. HTML attributes — skip link, `main id/tabindex`, hamburger ARIA
4. CSS — a11y base block, menu guard relocation, tap targets, reduced motion

## Validation

Playwright (session scratchpad, not the repo) across Chromium, Firefox, WebKit — **59/60 passed**.

- ARIA state, focus-into-menu, Escape-restores-focus, focus-not-yanked-on-link-click, `inert`
  set/cleared: pass in all three engines.
- Stuck-menu regression: overlay hidden and `aria-expanded` resynced on widening past 600px.
- Tap targets: hamburger hit area exactly 44×44; footer links 44.8–46.1px; nav links 46.4–68.8px
  at 768px. Nav CTA horizontal padding confirmed intact at 20px (the specificity landmine).
- `#involve` lands at `top=100`, clearing the sticky nav, in all three engines.
- Viewports 375/430/768/1366/1440/1920: zero horizontal overflow, correct nav/hamburger switching.
- Reduced motion: `scroll-behavior:auto`, transitions ~0s; normal motion unchanged at 0.2s.
- Focus rings visually confirmed unclipped on both navy (amber) and white (teal) backgrounds.
- Live-vs-local pixel diff: differences confined entirely to the logo bounding box
  (nav diff bbox x369-666, y25-174); 0.14% of footer pixels, 0.56% of nav. Logo sharpness
  indistinguishable from the 4K source at 2× magnification.

**Known non-defect:** the single failing check is the skip link not receiving focus via Tab in
WebKit. Verified this is Safari's default "Tab highlights each item" preference — WebKit reaches
*no* links by Tab (first four Tab stops all remain on `BODY`). Focused programmatically, the skip
link reveals correctly.

## Risks

- Footer logo depends on an opaque white background for its `invert(1)` + `screen` treatment —
  verified unchanged; format deliberately kept opaque PNG rather than adding alpha.
- If the Wix migration proceeds, the CSS fixes will not survive it. The logo fix will.

## Rollback

Single commit; `git revert`. Logo master at blob `79642d97552f27f1594879ad3bb6e193ac155ab9`.

## Open Questions

1. `scroll-margin-top` was applied to `main,section[id]`, which also fixes the pre-existing anchor
   defect for the four section anchors. Restrict to `main` only if that bundling is unwanted.
2. The two `inert` lines provide focus containment; removable for a smaller diff.

## Follow-Ups (not in this change)

- **Web3Forms** — the three "Get Involved" CTAs are inert `<span>`s with no `href` or handler, so
  the site has no working conversion path. Owner has confirmed Web3Forms as the fix and will supply
  the access key. Mirror `Smart-Learning-Solutions/contact.html` and the SOP at
  `09_PROMPTS/Claude_Code_Prompts/04_Prompts/web3forms_migration_execution_plan.md` (client-side
  `fetch` only, no `redirect` field, `botcheck` honeypot, never show success before the API
  confirms, verify on the deployed domain — `curl` gets 403 from Cloudflare).
- `docs/governance/COMPATIBILITY_MATRIX.md` still states "No compatibility testing has ever been
  performed", which the 2026-09-21 audit and this session both contradict.
- `docs/governance/RELEASE_GATE.md` not re-run since 2026-07-29 despite tags v1.6.0 → v1.8.0.
- `docs/governance/REPOSITORY_HANDOFF_CONFIG.md` contradicts itself on whether a deployment target
  exists (line 69 names the live GitHub Pages URL; lines 95-96 say "no deployment target configured
  at all").
