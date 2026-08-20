@AGENTS.md

# CLAUDE.md — Claude Code Project Memory

## Claude Code Specific Rules

Before anything else, confirm `docs/governance/PROJECT_CLASSIFICATION.md`. Before substantial
work, follow `MODEL_SELECTION_GATE.md` and read `docs/governance/AGENT_RUN_CONTRACT.md`. In VS
Code, compare both Claude Code and Codex execution paths before choosing the primary executor.

Use V3.5 skills for repeatable project work:

- `/starter-execution-loop` for implementation, bugfix, refactor, audit remediation, and repo cleanup.
- `/starter-migration-loop` for existing project migration.
- `/starter-production-readiness` for production readiness checks.
- `/starter-context-eval-loop` for prompt, context, eval, and failure analysis workflows.

## Instruction Loading

Keep this file concise. Long procedures belong in `.claude/skills/` or `docs/`.

## Memory Hygiene

When you learn persistent project-specific facts, update the relevant project doc rather than bloating this file.

Preferred locations:

- Architecture facts → `docs/project/ARCHITECTURE.md`
- Current state → `docs/project/STATUS.md`
- Decisions → `docs/project/DECISION_LOG.md`
- Known risks → `docs/governance/PROJECT_RISK_REGISTER.md`
- Validation rules → `docs/governance/TEST_STRATEGY.md`
- Agent workflow notes → `ai/agents/AGENT_REVIEW_GATES.md`
