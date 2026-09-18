# Plan: Record Wix as Confirmed Hosting Platform

## Objective
User confirmed the client's hosting platform will be **Wix** (2026-09-18) and asked whether Starter
Kit v3.10 has been applied (confirmed yes — already live on `main`, separate from this task). Record
the Wix decision, docs-only, in both the repo and the AntBrainOS vault, per the standing "confirm
client launch status and intended hosting platform" task. Launch status itself remains unconfirmed —
only the hosting platform half of that task is resolved by this decision.

## Current State
- `docs/governance/PROJECT_CLASSIFICATION.md` still calls Wix "an open question rather than a
  decided plan" and lists GitHub Pages as the confirmed live deployment target.
- `docs/deployment/HOSTING_NOTES.md` already documents Wix setup steps in a "Target Hosting (Client
  — Wix)" section (written 2026-07-29, framed as the anticipated target) alongside a "Current
  Hosting (Development)" GitHub Pages section and an "If Hosting Outside Wix" fallback section — no
  status line stating Wix is now confirmed vs. merely anticipated.
- `docs/governance/REPOSITORY_HANDOFF_CONFIG.md`'s Deployment Contract records GitHub Pages as the
  live target with "intended custom domain `www.ktocareer.org`" — no mention of Wix as the confirmed
  future target.
- Vault `PROJECT.md` lists "Client hosting platform not confirmed" as an Active Risk.
- Vault `CURRENT_CONTEXT.md` Unknowns/Next Best Actions still list hosting platform as unresolved.
- Vault `HANDOFF_TO_CLAUDE.md` Current Task still reads "confirm client launch status and intended
  hosting platform" as a single open item.
- Vault `DECISION_LOG.md`/`SESSION_LOG.md` have no entry for this decision.
- GitHub Pages remains the actual live deployment target (confirmed `built` via `gh api` as of
  2026-09-06) — this task does not migrate anything, only records the decision.

## Assumptions
- "Hosting platform will be Wix" is a confirmed decision from the client/project owner, not a
  tentative lean — recorded as such.
- Client launch status (has the site launched anywhere yet) is a separate, still-open question — not
  addressed by this task.
- No actual migration work (DNS changes, Wix account setup, GitHub Pages teardown) is in scope —
  user explicitly chose "docs only" over "scope the migration."

## Constraints
- Start from repo root
- Docs-only — no site content (`index.html`, `assets/`) touched
- Do not change the recorded live deployment target (GitHub Pages) — Wix is the confirmed *future*
  target, not yet live
- Do not fabricate a launch date or migration timeline that wasn't stated
- Small approval slice; report files changed before considering this closed

## Files to Review
- docs/governance/PROJECT_CLASSIFICATION.md
- docs/deployment/HOSTING_NOTES.md
- docs/governance/REPOSITORY_HANDOFF_CONFIG.md
- CHANGELOG.md
- 03_PROJECTS/Active/K_to_Career_Website/PROJECT.md (vault)
- 03_PROJECTS/Active/K_to_Career_Website/CURRENT_CONTEXT.md (vault)
- 03_PROJECTS/Active/K_to_Career_Website/HANDOFF_TO_CLAUDE.md (vault)
- 03_PROJECTS/Active/K_to_Career_Website/DECISION_LOG.md (vault)
- 03_PROJECTS/Active/K_to_Career_Website/SESSION_LOG.md (vault)

## Files to Change
Same list as Files to Review, above.

## Slice 1
**Goal**
Update repo governance/deployment docs to reflect Wix as the confirmed target hosting platform.

**Planned edits**
- `PROJECT_CLASSIFICATION.md`: replace the "open question rather than a decided plan" line with a
  statement that Wix is confirmed as the target, GitHub Pages remains live until migration, re-check
  classification at actual cutover.
- `HOSTING_NOTES.md`: add a short status line confirming Wix as the decided target (dated), without
  removing the existing GitHub Pages / non-Wix fallback sections (still useful reference material).
- `REPOSITORY_HANDOFF_CONFIG.md`: add a note under Deployment Contract that Wix is the confirmed
  future target; leave "Live deployment target: GitHub Pages" unchanged since nothing has migrated.
- `CHANGELOG.md`: one `[Unreleased]` entry recording the decision (a documentation change, consistent
  with this repo's practice of logging governance decisions).

**Validation**
- Re-read each edited file to confirm the change is accurate and doesn't overclaim (e.g. doesn't say
  "migration complete" or invent a date).
- Confirm `index.html`/`assets/` untouched (`git status` shows only the docs files above).

## Slice 2
**Goal**
Record the decision in the AntBrainOS vault's canonical continuity records for this project.

**Planned edits**
- `DECISION_LOG.md`: new dated entry ("2026-09-18 — Client Confirmed Wix as Hosting Platform"),
  Decision/Reason/How to apply format matching existing entries.
- `SESSION_LOG.md`: new dated entry for this session (session-start recovery audit run, Wix decision
  recorded, Starter Kit v3.10 status confirmed to user).
- `CURRENT_CONTEXT.md`: update Unknowns (remove "what hosting platform" if fully resolved by this),
  Known Problems, and Next Best Actions to reflect Wix as decided; note launch status is still open.
- `HANDOFF_TO_CLAUDE.md`: new "Latest Handoff" entry; update Current Task to split hosting (resolved)
  from launch status (still open).
- `PROJECT.md`: update the "Client hosting platform not confirmed" Active Risk to reflect the Wix
  decision (resolved sub-item; migration timing still open).

**Validation**
- Re-read each edited vault file for internal consistency (no contradicting bullet left unupdated).
- Confirm no repo file paths/content were touched in this slice (vault-only).

## Risks
- Recording "Wix confirmed" without a migration date could later be misread as "already migrated" —
  mitigated by explicit "GitHub Pages remains live until cutover" language in every edit.
- Vault has 9 files with overlapping "current task" language (`CURRENT_CONTEXT.md`,
  `HANDOFF_TO_CLAUDE.md`, `PROJECT.md`) — risk of leaving one inconsistent with the others if not
  cross-checked after editing.

## Rollback
All changes are plain-text doc edits in a git-backed repo (repo) and a vault with its own local git
history (vault, per `DECISION_LOG` #61). `git diff`/`git checkout -- <file>` reverts the repo side
before any commit; vault edits can be reverted the same way via the vault's local git history, or
manually restored from the read content captured during this plan's Files to Review step.

## Open Questions
- Is client launch status still fully unconfirmed, or does the Wix decision imply a launch is now
  being planned? (Not assumed — left as open in Next Best Actions unless the user says otherwise.)
- Should `CHANGELOG.md`'s pre-existing `[Unreleased]` rollup drift (flagged in this session's
  recovery audit) be fixed in the same pass, or deferred? (Default: deferred — user hasn't decided
  on that separately flagged item yet.)
