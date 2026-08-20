# Project Classification

Determine this before any other kickoff decision. It governs which sections of
`REPOSITORY_HANDOFF_CONFIG.md` apply and how the Model Selection Gate and Agent Run Contract get
used for this project.

## Categories

- **Vault-only** — lives inside a knowledge base or note vault with no Git history of its own
  (snapshot/sync governed instead of commit governed).
- **Local non-Git** — a local folder or working copy with no version control at all.
- **Git-backed** — has Git history, no configured remote.
- **Git-backed with remote** — has Git history and pushes to a remote (GitHub, GitLab, etc.), but
  nothing is deployed from it.
- **Git-backed with deployment** — has Git history, a remote, and a real deployment target (VPS,
  hosting platform, app store, package registry, etc.).

## This Project

- **Classification:** git_backed_with_deployment
- **Classification (prose):** Git-backed with deployment
- **Confirmed by:** Claude Code, during the V3.4 adoption run
- **Confirmed on:** 2026-07-29
- **Token form note:** the `Classification:` value above is the kit's canonical machine token
  (`starter_kit` compares it against `.starter-kit/manifest.json`'s `project_classification`, reading
  only the first whitespace-delimited word). The prose line preserves the human-readable form. The
  kit's own auto-detection reported `git_backed_with_remote`, which is **less** accurate — it cannot
  see GitHub Pages without an API call. The manifest was reconciled to the verified value below,
  2026-08-19, during the v3.7.0 migration.
- **Evidence:**
  - `git remote -v` → `origin https://github.com/rmz9dkfy5f-pixel/k-to-career-website.git`
  - `gh api repos/rmz9dkfy5f-pixel/k-to-career-website/pages` →
    `{"status": "built", "source": {"branch": "main", "path": "/"}, "html_url":
    "https://rmz9dkfy5f-pixel.github.io/k-to-career-website/"}`
  - `docs/workflow/branching-model.md`: "`main` is the production website branch. The root
    `index.html` on `main` represents the current production site."

GitHub Pages is a real, currently-serving hosting target: a push to `main` publishes the live site
with no build step. That is what makes this "with deployment" rather than "with remote."

Note the distinction from `REPOSITORY_HANDOFF_CONFIG.md`'s Deployment Contract, which scopes what
*this agent system* is authorized to deploy — nothing. The two are consistent: a deployment target
exists, and deploying to it is not an authorized agent action.

Re-check this if the client moves the site to Wix or another host, which is an open question rather
than a decided plan.

Never infer a classification from assumption or convenience. If unconfirmed, leave every field
above as `TBD` rather than guessing.

## What Each Classification Implies

| Classification | `REPOSITORY_HANDOFF_CONFIG.md` sections that apply |
|---|---|
| Vault-only | None — use the vault's own snapshot/session-lifecycle SOPs instead, if any exist. |
| Local non-Git | Repository Identity (partial), Validation Contract only. |
| Git-backed | Repository Identity, Validation Contract, Snapshot Contract. |
| Git-backed with remote | Adds Safety Boundaries (push/tag authorization rules). |
| Git-backed with deployment | Adds the full Deployment Contract. |

Re-check this classification if the project's Git/remote/deployment status changes materially
(e.g. a local prototype gets its first remote, or a repo gets its first real deployment target) —
do not leave a stale classification in place.
