# Plan: Fix Favicon — Regenerate from Graduation-Cap Crop

## Objective
Regenerate `favicon-32.png` and `apple-touch-icon.png` so the K to Career logo is actually legible
at browser-tab / touch-icon size, rather than an illegible squash of the full landscape wordmark.

## Current State
- `index.html`'s `<head>` icon tags, paths, and MIME types are correct — no bug there.
- `favicon-32.png` (32×32) and `apple-touch-icon.png` (180×180) were generated (commit `7961176`)
  by resizing the full 3840×2160 `assets/images/logo.png` (cursive "K to Career" wordmark +
  graduation-cap illustration) straight into square canvases with `sips`. Result: illegible
  scribble at 32×32; "to Career" text cropped off-frame at 180×180.
- No separate icon-only mark asset exists anywhere in the repo — `assets/images/logo.png` is the
  only source. No SVG source exists either.
- `sips` (macOS built-in) confirmed available; no ImageMagick.

## Assumptions
- The graduation-cap glyph, isolated into a square crop, is the icon representation — user-decided,
  since the full cursive wordmark can't be legible at 32×32 regardless of framing.
- This is a cosmetic/quality fix to already-shipped files, not new content — no further content
  authorization needed beyond what was already given.

## Constraints
- No build tool — regeneration is a one-off `sips` operation, matching the repo's existing
  (git-history-confirmed) icon-generation method.
- Iterate on crop framing using scratchpad working files only; never write unverified crops
  directly over the tracked repo files.
- Static site only — no other site content touched.

## Files to Review
- assets/images/logo.png (source)
- index.html (icon tags — confirmed correct, not touched)
- favicon-32.png, apple-touch-icon.png (current, to be replaced)

## Files to Change
- favicon-32.png
- apple-touch-icon.png
- CHANGELOG.md (one `[Unreleased]` bullet)

## Slice 1
**Goal** Create this plan file.
**Planned edits** This file only.
**Validation** Visual read-back against `plans/PLAN_TEMPLATE.md` structure.

## Slice 2
**Goal** Crop and verify framing (iterative, scratchpad only).
**Planned edits** None to the repo — candidate crops written to the scratchpad directory, viewed,
and adjusted until the graduation cap is fully visible, reasonably centered, with balanced padding.
**Validation** Visual inspection of each candidate crop.

## Slice 3
**Goal** Generate final icon files from the approved crop.
**Planned edits**
- `sips -z 32 32` the approved square crop → overwrite `favicon-32.png`.
- `sips -z 180 180` the approved square crop → overwrite `apple-touch-icon.png`.
**Validation** View both final files directly; confirm the cap is legible/recognizable at each size.

## Slice 4
**Goal** Verify and document.
**Planned edits** One `CHANGELOG.md` bullet under `[Unreleased]`.
**Validation**
- `sips -g pixelWidth -g pixelHeight -g format` on both files — expect 32×32 / 180×180, PNG.
- Local HTTP smoke test (`python3 -m http.server`) — both files return 200.
- `git diff --stat` — only the two icon files, `CHANGELOG.md`, and this plan file changed.

## Risks
- Bad crop framing would just replace one bad icon with another — mitigated by the iterate-then-view
  loop in Slice 2 and a final visual check in Slice 3.
- Binary diffs are invisible in `git diff` text output — mitigated by direct visual inspection plus
  the pixel-dimension/format check.

## Rollback
`git checkout -- favicon-32.png apple-touch-icon.png CHANGELOG.md`

## Open Questions
None — crop approach (graduation cap only) and scope (fix now) are user-confirmed.
