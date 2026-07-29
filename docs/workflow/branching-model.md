# K to Career Branching Model

## Production Branch

`main` is the production website branch. The root `index.html` on `main` represents the current
production site.

As of `v1.3.0`, the production site is the v3 design promoted to the repository root.

## Style Reference Branches

The old folder-based versions have been converted into Git branches:

- `style/v1-reference` preserves the v1 design direction.
- `style/v2-reference` preserves the v2 design direction.

These branches are visual/design references. They should not be merged back into `main` unless the
project intentionally chooses to revive one of those design directions.

## Working Branches

Use short-lived branches for edits:

- `feature/<short-description>` for new site functionality or content sections.
- `fix/<short-description>` for bug fixes.
- `chore/<short-description>` for repository, docs, release, or cleanup work.

## Release Tags

Use release tags for shipped states, following the plain `vMAJOR.MINOR.PATCH` convention in
`docs/Standards/version_number_system.md` — no `site-` or other prefix.

Generated delivery zip files belong in GitHub Releases, not committed to the repository branch tip.

## Current Cleanup State

The old `v1/`, `v2/`, and `v3/` folders and the tracked delivery `*.zip` files were removed from
`main` in the follow-up cleanup PR after the branch-promotion PR merged. Future delivery packages
should be attached to GitHub Releases instead of committed to the repository.
