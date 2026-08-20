# Repository Handoff Configuration

Adapted from `20_TOOLS/KITS/handoff-repository/templates/TEMPLATE_REPOSITORY_HANDOFF_CONFIG.md` (in
the AntBrainOS vault) for the K to Career Website repository. Store operational coordinates here,
never credentials.

## Repository Identity

- Project name: K to Career Website
- Repository root: see AntBrainOS vault
  `03_PROJECTS/Active/K_to_Career_Website/REPOSITORY_HANDOFF_CONFIG_LOCAL.md` — moved out of this
  public repo 2026-08-19 to close risk R-006 (absolute local filesystem paths were world-readable
  via GitHub Pages)
- Canonical remote: https://github.com/rmz9dkfy5f-pixel/k-to-career-website.git
- Default branch: main
- Canonical handoff file: root `AGENT_HANDOFF.md` as a structured startup pointer only — this
  project's canonical continuity records still live in the AntBrainOS vault at
  `03_PROJECTS/Active/K_to_Career_Website/{HANDOFF_TO_CLAUDE.md,CURRENT_CONTEXT.md,SESSION_LOG.md,DECISION_LOG.md}`

## Validation Contract

- Install command: none — static HTML/CSS only, no framework, no build tool, no CMS (per this
  repo's own `CLAUDE.md`)
- Focused test commands: none
- Full test command: none
- Lint/type-check commands: none
- Production build command: none — deploy is a static file copy
- Runtime smoke test: manual visual check of the root `index.html` in a browser (was `v3/` until
  v1.3.0 promoted the site to the repository root; `v3/` no longer exists)
- Manual or device checks: none required for docs-only changes; visual check required for
  markup/CSS changes

## Snapshot Contract

- Snapshot required: yes
- Naming rule: final_tag
- Exclusions: `*.zip` delivery packages already versioned by filename; large binary images
- Verification method: file listing + SHA-256 checksum manifest
- Checksum requirement: yes
- Retention policy: keep indefinitely (real client project, not disposable) — manual review before
  any deletion
- Restore/rollback procedure: re-clone from GitHub at the tag, or restore from the snapshot's own
  checksum-verified copy

### Snapshot Destination by Machine

Machine-specific detection commands and destination paths are no longer published in this public
repo (risk R-006, closed 2026-08-19). See AntBrainOS vault
`03_PROJECTS/Active/K_to_Career_Website/REPOSITORY_HANDOFF_CONFIG_LOCAL.md` for the current
detection mechanism and destination table. If that file is unreachable, **stop and ask the user**
for the correct destination — do not guess or infer a path pattern.

## Deployment Contract

Applies because `docs/governance/PROJECT_CLASSIFICATION.md` classifies this repository as
**Git-backed with deployment** (confirmed 2026-07-29). Note the distinction the two documents draw:
a deployment target **exists**, and deploying to it is **not** an authorized agent action.

- Deployment in scope for this agent system: **no** — an agent must not merge to `main`, and merging
  is what publishes. This repo also produces manual client-delivery packages
  (`k-to-career-*-client-package.zip`), which are built by hand per release.
- Live deployment target: GitHub Pages, confirmed via
  `gh api repos/rmz9dkfy5f-pixel/k-to-career-website/pages` → `status: built`
- Deployment branch/source: `main`, path `/` (repository root) — no build step; publishing is
  implicit on every push or merge to `main`
- Published URL: `https://rmz9dkfy5f-pixel.github.io/k-to-career-website/`
  (intended custom domain `www.ktocareer.org` — see `docs/deployment/HOSTING_NOTES.md`)
- VPS/server alias: none — no server is operated for this project
- Deployment root: none — static files served directly from the branch
- Service/container names: none
- Read-only health checks: none configured; the check is loading the published URL in a browser
- Log locations: none — GitHub Pages exposes no logs to this project
- Rollback target: revert the offending commit on `main` and let Pages republish; or re-clone at the
  last good tag per the Snapshot Contract above
- Actions requiring approval: **merging to `main` is a production deployment** and requires separate
  explicit authorization, as recorded below. Any change of hosting target (e.g. a move to Wix)
  requires updating this section and the classification first.

## Safety Boundaries

- Protected paths: `docs/Strategy/K_to_Career_Ecosystem.md` (business/strategy source of truth —
  see this repo's own `CLAUDE.md`)
- Secret-bearing files: none tracked in this repo
- Prohibited actions: force-push to `main`, rewriting published history, fabricating impact
  metrics/partnerships/testimonials (per `CLAUDE.md`'s Content Rules)
- Commit/push authorization rule: authorized per the Repo Push Super Prompt's authorization envelope
- Tag/release authorization rule: authorized_by_super_prompt
- Deploy/merge authorization rule: requires_separate_explicit_authorization (currently: no
  deployment target configured at all)
