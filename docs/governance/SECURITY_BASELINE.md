# Security Baseline

## Baseline Rules

- Do not commit secrets, tokens, API keys, private keys, or credentials.
- Do not weaken authentication, authorization, or input validation without explicit approval.
- Do not add remote code execution paths casually.
- Do not install new production dependencies without documenting why.
- Treat third-party skills, scripts, and generated code as untrusted until reviewed.
- Prefer least privilege.
- Document all security-sensitive assumptions.

## Review Areas

- Secrets handling
- Authentication
- Authorization
- Input validation
- Dependency risk
- File upload/download risk
- Logging of sensitive data
- Network exposure
- Admin routes
- Build/deployment secrets
- Agent-generated scripts

## Security Status

- Last review: 2026-07-29 (first V3.4 review, during starter-kit adoption)
- Result: PASS for secrets handling — no credentials, tokens, API keys, or private keys are committed.
  `git grep -niE 'api[_-]?key|secret|password|bearer|private[_-]?key|token'` over tracked files
  returns only benign word matches (a subagent role description, and CSS "color tokens").
- Scope note: most Review Areas above do not apply. This is a static HTML/CSS site with no
  authentication, no authorization, no server, no input handling, no file upload, no database, no
  admin routes, no runtime dependencies, and no build/deployment secrets. The only network exposure
  is the publicly served static site itself.
- Risks:
  - **The repository is public, and GitHub Pages serves every root-level file.** All governance
    documentation added by this adoption is world-readable. `REPOSITORY_HANDOFF_CONFIG.md` in
    particular contains absolute local filesystem paths (the repo root and the snapshot volume) and
    the machine's `ComputerName`. This predates the adoption but the adoption enlarges the surface.
    See R-006. **This needs an explicit accept-or-remove decision from the project owner.**
  - `docs/deployment/HOSTING_NOTES.md` records that neither GitHub Pages nor Wix allows setting
    server-level security headers (CSP, X-Frame-Options) on a static site. Accepted limitation of
    the chosen hosting, not a defect.
- Next action: confirm whether publishing operational coordinates in a public repository is
  acceptable. If not, move `REPOSITORY_HANDOFF_CONFIG.md`'s machine-specific paths into the
  AntBrainOS vault alongside the other continuity records and leave a pointer here.
