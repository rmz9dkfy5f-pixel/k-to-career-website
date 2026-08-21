# Plan: Scrub Remaining Absolute Paths and Redact Private Kit Repo Name (R-006 Follow-Up)

## Objective
Close the remaining gap in risk R-006: remove four leftover absolute local-filesystem-path
instances from this public repo (`AGENT_HANDOFF.md` x2, `docs/governance/AGENT_RUN_LOG.md`, the
R-002 row of `docs/governance/PROJECT_RISK_REGISTER.md`), correct R-002's own factual error (wrong
path claimed), redact the private Starter Kit repo's literal name from
`docs/governance/MIGRATION_REPORT.md`, and correct R-006's Status field, which still says
"Resolved 2026-08-19" despite these leftovers.

## Current State
- R-006 was marked "Resolved 2026-08-19" after `REPOSITORY_HANDOFF_CONFIG.md`'s absolute paths were
  moved to a vault-only file (`REPOSITORY_HANDOFF_CONFIG_LOCAL.md`). That fix's own scope claim was
  accurate — it never claimed to cover `AGENT_HANDOFF.md` or `AGENT_RUN_LOG.md`.
- A repo-wide grep confirms exactly four remaining absolute-path hits (verified 2026-08-20):
  `AGENT_HANDOFF.md:17`, `AGENT_HANDOFF.md:54`, `docs/governance/PROJECT_RISK_REGISTER.md:9`
  (R-002 row), `docs/governance/AGENT_RUN_LOG.md:111`.
- R-002's row additionally states the continuity-records location as `/Volumes/AntNVMe1TB/...`,
  which is not the real location — the real location is the AntBrainOS vault at
  `03_PROJECTS/Active/K_to_Career_Website/`.
- `docs/governance/MIGRATION_REPORT.md:13` names the private Starter Kit source repo literally
  (`antbrainos-project-starter-kit`) — the only such occurrence in this public repo. Project owner
  decision: redact to a generic description; the tag and commit hash already fully pin the version.
- The established, already-proven redaction pattern for this exact problem is in
  `docs/governance/REPOSITORY_HANDOFF_CONFIG.md` (fixed 2026-08-19): replace the absolute path with
  a pointer to the vault file `03_PROJECTS/Active/K_to_Career_Website/REPOSITORY_HANDOFF_CONFIG_LOCAL.md`,
  using a vault-relative path (no `/Users/...` or `/Volumes/...` prefix).

## Assumptions
- No absolute path may be reintroduced anywhere, including as a "corrected" replacement for R-002's
  wrong path — the vault-relative-path convention must be used instead.
- The private kit repo's tag (`v3.7.0`) and dereferenced commit hash provide full traceability, so a
  generic description loses no information the reader needs.
- These are documentation-only edits; no site content (`index.html`, `assets/`) is touched.

## Constraints
- Start from repo root; small, independently reviewable slices; validate after each.
- No fabricated paths, metrics, or claims.
- Markdown table integrity in `PROJECT_RISK_REGISTER.md` must be preserved: each edited row stays a
  single line with exactly 7 pipe-delimited columns; no stray `|` or embedded newline in new text.
- Do not touch `.starter-kit/migrations/**` (historical journal, out of scope) or `CHANGELOG.md`
  (historical record).

## Files to Review
- AGENT_HANDOFF.md
- docs/governance/AGENT_RUN_LOG.md
- docs/governance/PROJECT_RISK_REGISTER.md
- docs/governance/MIGRATION_REPORT.md
- docs/governance/REPOSITORY_HANDOFF_CONFIG.md (reference pattern only, not edited)

## Files to Change
- AGENT_HANDOFF.md
- docs/governance/AGENT_RUN_LOG.md
- docs/governance/PROJECT_RISK_REGISTER.md
- docs/governance/MIGRATION_REPORT.md

## Slice 1
**Goal** Create this plan file.

**Planned edits**
- This plan file only.

**Validation**
- Visual read-back against `plans/PLAN_TEMPLATE.md` structure.

## Slice 2
**Goal** Fix `AGENT_HANDOFF.md`'s two absolute-path instances.

**Planned edits**
- Repository Identity section: replace the absolute repo-root path with a vault pointer, following
  the `REPOSITORY_HANDOFF_CONFIG.md` pattern.
- Routing Note section: replace the absolute-path routing rule with a rule based on project name and
  the already-public canonical remote URL.

**Validation**
- `grep -n "/Users/\|/Volumes/\|/home/" AGENT_HANDOFF.md` returns no hits.
- Visual read-back of both sections.

## Slice 3
**Goal** Fix `docs/governance/AGENT_RUN_LOG.md`'s absolute snapshot path.

**Planned edits**
- Replace the literal snapshot path with a pointer to the vault's
  `REPOSITORY_HANDOFF_CONFIG_LOCAL.md`, preserving the SHA-256/file-count evidence already stated.

**Validation**
- `grep -n "/Users/\|/Volumes/\|/home/" docs/governance/AGENT_RUN_LOG.md` returns no hits.

## Slice 4
**Goal** Fix `PROJECT_RISK_REGISTER.md`'s R-002 row (wrong path + absolute path) and R-006 row
(stale Status).

**Planned edits**
- R-002 row: replace `/Volumes/AntNVMe1TB/...` with the vault-relative path
  `03_PROJECTS/Active/K_to_Career_Website/`.
- R-006 row: append a 2026-08-20 addendum to the Mitigation column describing the follow-up scrub;
  update Status to `Resolved 2026-08-19; extended 2026-08-20`.

**Validation**
- `grep -n "/Users/\|/Volumes/\|/home/" docs/governance/PROJECT_RISK_REGISTER.md` returns no hits.
- `git diff --check` for whitespace errors.
- Visual read-back confirming both rows remain single-line, 7-column pipe-delimited table rows.

## Slice 5
**Goal** Redact the private kit repo name in `docs/governance/MIGRATION_REPORT.md`.

**Planned edits**
- Replace `antbrainos-project-starter-kit` with "the private Project Starter Kit source repository",
  keeping the tag and commit hash unchanged.

**Validation**
- `grep -rn "antbrainos-project-starter-kit" --include="*.md" .` (excluding
  `.starter-kit/migrations/**`) returns no hits in `MIGRATION_REPORT.md`.

## Slice 6
**Goal** Full-repo verification and vault DECISION_LOG.md entry.

**Planned edits**
- Add a dated 2026-08-20 entry to the AntBrainOS vault
  `03_PROJECTS/Active/K_to_Career_Website/DECISION_LOG.md` (outside this repo).

**Validation**
- `grep -rn "/Users/\|/Volumes/\|/home/" --include="*.md" . | grep -v '.starter-kit/migrations' | grep -v CHANGELOG.md` returns zero hits.
- `git diff --check` (whole repo) reports no whitespace errors.
- `git diff` visual read-back of all four changed files.

## Slice 7 (added post-review)
**Goal** A pre-stage code review caught a fifth absolute-path instance the markdown-only grep
missed: `scripts/git-hooks/post-commit` (tracked, local-only git hook) hardcoded
`/Users/ant/Documents/RepoBackups/$REPO_NAME` twice. This also meant Slice 4's R-006 addendum
overclaimed — it said "repo-wide" when the check behind it was markdown-only.

**Planned edits**
- `scripts/git-hooks/post-commit`: replace the hardcoded username with `$HOME`, add an optional
  `K2C_SNAPSHOT_DIR` override. Resolved path is unchanged for this machine — behavior-preserving.
- Reword the R-006 addendum in `PROJECT_RISK_REGISTER.md` to describe the actual two-pass check
  (markdown sweep, then all-tracked-files sweep) rather than a single unqualified "repo-wide" claim.
- Extend the vault `DECISION_LOG.md` entry to record the fifth fix and the overclaim correction.

**Validation**
- `bash -n scripts/git-hooks/post-commit` — syntax check.
- `git grep -n "/Users/\|/Volumes/\|/home/" -- . ':!.starter-kit/migrations' ':!CHANGELOG.md' ':!plans/2026-08-20-scrub-public-repo-absolute-paths.md'` — zero hits across ALL tracked files, not just markdown.

## Risks
- A stray `|` or line break inside the R-002/R-006 Mitigation or Status text would silently corrupt
  the markdown table (columns shift, table renders broken on GitHub). Mitigated by keeping each new
  row a single line and reading it back visually plus `git diff --check`.
- Redacting the kit repo name could reduce traceability if the tag/commit were ever wrong — they are
  not being changed, only the name, so this is low risk.
- The DECISION_LOG.md entry is outside this repo (vault), so it cannot be verified by this repo's
  own tooling — it's a manual step.

## Rollback
`git checkout -- AGENT_HANDOFF.md docs/governance/AGENT_RUN_LOG.md docs/governance/PROJECT_RISK_REGISTER.md docs/governance/MIGRATION_REPORT.md`
reverts all edits in this repo (vault DECISION_LOG.md entry would need manual removal separately).

## Open Questions
- None outstanding — user has confirmed all three task items and the MIGRATION_REPORT.md redaction
  decision. Note: no prior R-006-specific DECISION_LOG.md entry exists in the vault (verified
  2026-08-20 by direct read), so the entry drafted in Slice 6 is the first of its kind, not a
  continuation of an established per-R-006 logging pattern.
