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
  - **R-006, resolved 2026-08-19.** The repository is public and GitHub Pages serves every
    root-level file. `REPOSITORY_HANDOFF_CONFIG.md` previously contained absolute local filesystem
    paths (the repo root and the snapshot volume) and the machine's `ComputerName`. Project owner
    chose "remove": those values now live in AntBrainOS vault
    `03_PROJECTS/Active/K_to_Career_Website/REPOSITORY_HANDOFF_CONFIG_LOCAL.md`, and the repo file
    points there instead of stating them.
  - `docs/deployment/HOSTING_NOTES.md` records that neither GitHub Pages nor Wix allows setting
    server-level security headers (CSP, X-Frame-Options) on a static site. Accepted limitation of
    the chosen hosting, not a defect.
- Next action: none outstanding for R-006. See `PROJECT_RISK_REGISTER.md` for the full resolution
  record.
