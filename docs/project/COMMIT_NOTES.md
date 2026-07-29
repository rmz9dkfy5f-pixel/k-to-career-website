# Commit Notes

> **Pointer only — no content lives in this file.**
> This repository keeps its canonical documentation where `CLAUDE.md`'s Canonical Repo Structure
> section puts it. `docs/project/` exists because Project Starter Kit V3.4 expects these paths;
> duplicating content here would create the competing sources of truth `CLAUDE.md` prohibits.

## Convention in use

This repository already follows Conventional Commits, visible in `git log`:

```text
<type>(<scope>): <summary>
```

Types in actual use: `feat`, `fix`, `chore`, `refactor`, `docs`. Scopes in use include `site`,
`repo`, `docs`, `governance`, `changelog`, `delivery`, `layout`, `v34`.

The body should say what changed, why, and how it was validated. Where a change is non-obvious or
deliberately partial, say so — several commits in this repo's history carry that detail and it has
been worth having.

## Related

- Branch naming and release tags: `docs/workflow/branching-model.md`
- Version increments: `docs/Standards/version_number_system.md`
- Slice sizing and approval: `docs/workflow/claude-code-workflow.md`, `CLAUDE.md`
