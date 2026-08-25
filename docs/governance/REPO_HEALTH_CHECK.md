# Repo Health Check

## Current Status

Status: PARTIAL — first V3.4 health check run 2026-07-29. Structure, Git, and Build/Test are clean.
Production Readiness is incomplete because no compatibility testing has ever been performed.

## Health Checklist

### Structure

- [x] Root files are understandable.
- [x] Source code is separated from generated files. No generated files exist — static HTML/CSS only.
- [x] Docs are discoverable. `CLAUDE.md` declares the canonical structure; `docs/` is organised by
      role (`Strategy/`, `workflow/`, `governance/`, `delivery/`, `deployment/`, `Standards/`).
- [x] Build/test scripts are documented — documented as genuinely `none`, see `TEST_STRATEGY.md`.

### Git

- [x] Git status reviewed. Clean, `main` synced with `origin/main`, tagged `v1.4.1` (updated
      2026-08-19; was `v1.3.0` as of the 2026-07-29 check).
- [x] `.gitignore` is appropriate. Corrected during this adoption: `.claude/*` was silently making
      `.claude/skills/**` unstageable.
- [x] No secrets are committed. `git grep -niE 'api[_-]?key|secret|password|bearer|token'` across
      tracked files returns only benign word matches (a subagent role description, and "color tokens").
- [ ] Large/generated files are handled intentionally. **Finding below.**

### Build / Test

- [x] Install command known — `none`.
- [x] Build command known — `none`.
- [x] Test command known — `none`.
- [x] Lint/typecheck command known if applicable — not applicable, no toolchain.

### Production Readiness

- [x] Security baseline reviewed. See `SECURITY_BASELINE.md`.
- [ ] Compatibility matrix reviewed. Reviewed but **not satisfied** — zero targets verified.
- [x] Rollback plan exists. See `ROLLBACK_PLAN.md` and `REPOSITORY_HANDOFF_CONFIG.md`'s snapshot
      contract.
- [x] Release gate reviewed. `N/A` for this change; no release is being cut.

## Last Health Check

- Date: 2026-07-29 (full check); Git/Security sections partially updated 2026-08-19 — see note below
- Agent: Claude Code (V3.4 adoption run); 2026-08-19 update also Claude Code
- Result: PARTIAL
- Notes:
  - **2026-08-19 partial update, not a full re-run.** Only the Git checklist item (above) and the
    Security risk note below were refreshed, as part of a documentation-freshness pass. Structure,
    Build/Test, and the remaining Production Readiness items were not re-verified this pass — the
    findings below are carried forward unchanged from 2026-07-29 and may themselves be stale.
  - **R-006 resolved 2026-08-19.** The public-path-exposure risk referenced under Security baseline
    is now closed — see `PROJECT_RISK_REGISTER.md` and `SECURITY_BASELINE.md`.
  - **Unreferenced binary at repo root — resolved 2026-08-24.** `Image 4-17-26 at 12.37 AM.PNG` was
    732 KB, tracked, and referenced by zero files (`git grep` returned nothing). Its git blob hash
    was confirmed identical to `assets/images/logo.png`'s, not just matching by coincidental file
    size — it was a true byte-for-byte duplicate. Removed; see `PROJECT_RISK_REGISTER.md`'s R-005
    resolution and `CHANGELOG.md`.
  - **Documentation drift in `docs/workflow/branching-model.md`.** Its "Known Follow-Up" section
    still says the `v1/`, `v2/`, `v3/` folders and tracked zips "still exist on `main`". That cleanup
    landed in `7f2fdfa` and the statement is now false. Deferred deliberately — out of scope for a
    starter-kit adoption, and nothing in the V3.4 contract reads that file.
  - **Three conflicting snapshot destinations.** `docs/workflow/snapshot-hook-setup.md`, the live
    `scripts/git-hooks/post-commit`, and `REPOSITORY_HANDOFF_CONFIG.md` each name a different
    snapshot path. The handoff config is the most recent and should be treated as correct until
    reconciled.
  - **Compatibility is entirely unverified.** See `COMPATIBILITY_MATRIX.md`. This is the single
    reason the result is PARTIAL rather than PASS.
