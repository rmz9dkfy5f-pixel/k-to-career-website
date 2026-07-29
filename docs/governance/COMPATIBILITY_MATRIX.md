# Compatibility Matrix

Use this for web, desktop, mobile, CLI, game, server, and automation projects.

**No compatibility testing has ever been performed on this site.** The `Required?` column below is a
policy decision — what a public-facing nonprofit site is expected to support. Every `Status` cell
stays `Not verified` until someone actually tests on that target. Do not upgrade a Status to `Pass`
on the strength of the code reading well.

## Platforms

| Platform | Required? | Status | Notes |
|---|---:|---|---|
| Windows | Yes | Not verified | Browser-only; no native build exists |
| macOS | Yes | Not verified | Browser-only |
| Linux | Yes | Not verified | Browser-only |
| iOS | Yes | Not verified | Mobile Safari; primary audience includes students and parents |
| Android | Yes | Not verified | Chrome mobile |
| Web browsers | Yes | Not verified | The only delivery surface — static HTML/CSS |

## Screen / Device Coverage

| Class | Required? | Status | Notes |
|---|---:|---|---|
| Mobile | Yes | Not verified | `<meta name="viewport">` present; 3 `@media` blocks in `index.html` |
| Tablet | Yes | Not verified | |
| Laptop | Yes | Not verified | |
| Desktop | Yes | Not verified | |
| Ultrawide / high DPI | No | Not verified | Not a stated requirement |

## Browser Coverage

| Browser | Required? | Status | Notes |
|---|---:|---|---|
| Chrome / Chromium | Yes | Not verified | |
| Safari | Yes | Not verified | Includes iOS Safari |
| Firefox | Yes | Not verified | |
| Edge | Yes | Not verified | |

## Accessibility / Usability

Confirmed present in `index.html` by inspection (2026-07-29), from the v1.2.0 production readiness
pass recorded in `CHANGELOG.md`. Present in markup is not the same as verified with assistive
technology — none of the below has been tested with a real screen reader or keyboard-only session.

- Keyboard navigation: Not verified — no keyboard-only pass has been run
- Contrast: Not verified — colour tokens are documented in `docs/delivery/HANDOFF_README.md` but no
  contrast-ratio check has been run
- Screen reader basics: Partially present — `<html lang>`, one `<main>` landmark, and 4 `aria-hidden`
  attributes on decorative emoji. Not verified with a screen reader.
- Reduced motion: **Not implemented** — `prefers-reduced-motion` appears 0 times in `index.html`
- Responsive layout: Present — viewport meta tag and 3 `@media` breakpoints. Not verified on device.

## Notes

Mark unsupported platforms explicitly. Do not imply universal compatibility unless tested.

The kit's `PROPOSED_OPTIONAL_SYSTEMS.md` offers a browser/device test matrix and a Lighthouse/axe
audit pack that would let these Status cells be filled honestly. Both are opt-in and neither is
installed; adopting one is the natural next step if compatibility claims are ever needed.
