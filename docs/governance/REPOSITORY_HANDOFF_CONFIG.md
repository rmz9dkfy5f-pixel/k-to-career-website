# Repository Handoff Configuration

Adapted from `20_TOOLS/KITS/handoff-repository/templates/TEMPLATE_REPOSITORY_HANDOFF_CONFIG.md` (in
the AntBrainOS vault) for the K to Career Website repository. Store operational coordinates here,
never credentials.

## Repository Identity

- Project name: K to Career Website
- Repository root: /Users/ant/Projects/GitHub/k-to-career-website
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

Mirrors the detection mechanism in `05_SOPS/Obsidian/ANTBRAIN_VAULT_SNAPSHOT.md`, scoped to this
repository — same `RepoBackups/<name>` convention that SOP already uses for the vault itself, applied
here under this project's own name instead of `AntBrainOS`.

```bash
scutil --get ComputerName 2>/dev/null || hostname
```

| Machine | Detection | Snapshot destination | Notes |
|---|---|---|---|
| Ant’s Mac Mini (4) | `/Volumes/AntNVMe1TB` exists | `/Volumes/AntNVMe1TB/WorkSync/Projects/RepoBackups/K_to_Career_Website/` | current machine |
| Ant’s MacBook Air | `/Users/ant/WorkSync/Projects/RepoBackups/K_to_Career_Website` exists | `/Users/ant/WorkSync/Projects/RepoBackups/K_to_Career_Website/` | current machine |

If the current machine does not match any row above, or more than one row could plausibly match,
**stop and ask the user** for the correct destination — do not guess or infer a path pattern.

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
