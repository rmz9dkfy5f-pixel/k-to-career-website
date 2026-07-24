# Repository Handoff Configuration

Adapted from `20_TOOLS/KITS/handoff-repository/templates/TEMPLATE_REPOSITORY_HANDOFF_CONFIG.md` (in
the AntBrainOS vault) for the K to Career Website repository. Store operational coordinates here,
never credentials.

## Repository Identity

- Project name: K to Career Website
- Repository root: /Users/ant/Projects/GitHub/k-to-career-website
- Canonical remote: https://github.com/rmz9dkfy5f-pixel/k-to-career-website.git
- Default branch: main
- Canonical handoff file: none repo-local — this project's continuity records live in the AntBrainOS
  vault at `03_PROJECTS/Active/K_to_Career_Website/{HANDOFF_TO_CLAUDE.md,CURRENT_CONTEXT.md,SESSION_LOG.md}`

## Validation Contract

- Install command: none — static HTML/CSS only, no framework, no build tool, no CMS (per this
  repo's own `CLAUDE.md`)
- Focused test commands: none
- Full test command: none
- Lint/type-check commands: none
- Production build command: none — deploy is a static file copy
- Runtime smoke test: manual visual check of `v3/` in a browser
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

If the current machine does not match any row above, or more than one row could plausibly match,
**stop and ask the user** for the correct destination — do not guess or infer a path pattern.

## Deployment Contract

- Deployment in scope: no — this repo produces client-delivery packages (`k-to-career-*-client-package.zip`);
  it is not deployed by this system to any VPS/hosting target
- VPS/server alias: none
- Deployment root: none
- Deployment branch or artifact: client-delivery zip packages, built manually per release
- Service/container names: none
- Read-only health checks: none
- Log locations: none
- Rollback target: none
- Actions requiring approval: any future addition of a real deployment target requires updating this
  section first — do not assume one exists

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
