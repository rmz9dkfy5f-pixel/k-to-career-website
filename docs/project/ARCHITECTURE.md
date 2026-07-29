# Architecture

> **Pointer only — no content lives in this file.**
> This repository keeps its canonical documentation where `CLAUDE.md`'s Canonical Repo Structure
> section puts it. `docs/project/` exists because Project Starter Kit V3.4 expects these paths;
> duplicating content here would create the competing sources of truth `CLAUDE.md` prohibits.

## Shape

Static HTML/CSS. No framework, no build tool, no package manager, no CMS, no runtime dependencies.

| Path | Role |
|---|---|
| `index.html` | The entire production site — one page, inline CSS |
| `assets/images/logo.png` | Logo |
| `favicon-32.png`, `apple-touch-icon.png` | Icons |
| `scripts/git-hooks/post-commit` | Optional local HTML snapshot hook |
| `scripts/install-hooks.sh` | Installs the above into `.git/hooks/` |

## Delivery

`main` is served by GitHub Pages from the repository root — a push to `main` publishes the site with
no build step. See `docs/deployment/HOSTING_NOTES.md` for hosting and DNS, and
`docs/delivery/` for the client handoff package.

## Branch model

`docs/workflow/branching-model.md`. `style/v1-reference` and `style/v2-reference` preserve earlier
design directions and are never merged into `main`.
