#!/bin/bash
# ──────────────────────────────────────────────────────────────
# install-hooks.sh — copies version-controlled hooks into .git/hooks/
# Run from repo root: bash scripts/install-hooks.sh
# ──────────────────────────────────────────────────────────────

HOOK_SOURCE="scripts/git-hooks/post-commit"
HOOK_DEST=".git/hooks/post-commit"

if [ ! -f "$HOOK_SOURCE" ]; then
  echo "Error: $HOOK_SOURCE not found. Run this script from the repo root."
  exit 1
fi

cp "$HOOK_SOURCE" "$HOOK_DEST"
chmod +x "$HOOK_DEST"

echo "Installed: $HOOK_DEST"
echo "Hook is active. Next commit will trigger snapshot export."
