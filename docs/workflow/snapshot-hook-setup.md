# Snapshot Hook Setup

## What it does

After every successful Git commit, the post-commit hook automatically:

1. Reads commit metadata (SHA, date, branch, subject)
2. Exports the committed version of each tracked HTML file
3. Writes the snapshot to an external archive outside the repo
4. Appends a tracking row to a CSV manifest

The hook runs silently in the background and does not affect the commit itself.

---

## HTML files tracked

| File | Reason |
|---|---|
| `v1/index.html` | Primary user-facing homepage (only committed HTML file) |

To add more files later, edit `scripts/git-hooks/post-commit` and add paths to the `TARGET_FILES` array, then reinstall the hook.

---

## Where snapshots are written

| Output | Path |
|---|---|
| Snapshot files | `~/RepoSnapshots/k-to-career-website/html/` |
| Manifest CSV | `~/RepoSnapshots/k-to-career-website/manifest.csv` |

These directories are created automatically on first run. They live outside the repo and are never committed.

---

## Snapshot filename format

```
YYYY-MM-DD_HH-MM-SS__SHORTSHA__LABEL__RELATIVE-PATH.html
```

Example:
```
2026-04-15_23-09-19__80f40b3__contact-update__v1-index.html
```

---

## How the label is derived

The hook reads the commit subject and looks for a bracket prefix:

```
[contact-update] Replace contact placeholders with real email
```

Produces label: `contact-update`

If no bracket prefix is found, the label defaults to `general`.

---

## How to install or refresh the hook

Run from the repo root:

```bash
bash scripts/install-hooks.sh
```

This copies `scripts/git-hooks/post-commit` into `.git/hooks/post-commit` and makes it executable. Run this again any time the source hook is updated.

**Works with GitHub Desktop and Terminal.** GitHub Desktop respects `.git/hooks/` on macOS.

---

## How to test it

Make a commit using the bracket label format:

```
[test] Verify snapshot hook is working
```

Then check:

```bash
ls ~/RepoSnapshots/k-to-career-website/html/
cat ~/RepoSnapshots/k-to-career-website/manifest.csv
```

A new snapshot file and manifest row should appear.

---

## Source of truth

`scripts/git-hooks/post-commit` is the version-controlled source.
Never edit `.git/hooks/post-commit` directly — changes there are not tracked by Git and will be lost.
Always edit the source file and reinstall.
