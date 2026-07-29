# Agent Run Contract

A run type is a named, registered way an agent is explicitly invoked to do a governed piece of
work in this repository — never a scheduled or unattended process.

This file is self-contained: it does not depend on any external vault, kit, or tool to be usable.
If this repository happens to be developed alongside a system that already defines run types
elsewhere (for example, an AntBrainOS-style vault's own vault-wide Agent Run Contract), that
system may additionally register this repository's run types there — but this file remains
authoritative for standalone use of this repository on its own.

## What Is a Run Type

1. A named identifier (e.g. `repository_handoff`, `release_cut`, `security_review`).
2. Bound to exactly one skill, script, or documented procedure that executes it.
3. Invoked only by explicit request — never scheduled, never autonomous.
4. Described by a permission profile, a stop-condition set, and a lifecycle status.

## Permission Profile Schema

Every registered run type should state:

1. `run_type_id` — stable snake_case identifier.
2. `executor` — the skill, script, or procedure that runs it.
3. `supported_modes` — the distinct operating modes the executor exposes.
4. `applies_to` / `does_not_apply_to` — scoped applicability.
5. Which mutations each mode authorizes, and which require separate explicit authorization.

## Stop-Condition Taxonomy

Every registered run type must name, at minimum:

1. Ambiguous or unauthorized scope.
2. Missing required verification (manual, device, or otherwise).
3. Dirty or unrelated-change state blocking a clean unit of work.
4. Destructive or irreversible action without explicit authorization.
5. Conflicting or ambiguous configuration (e.g. destination, target, environment).

## Lifecycle

`Candidate → Manual Trial → Verified Procedure → Skillized → Evaluated → Supervised Default`

1. Candidate — designed, not yet run.
2. Manual Trial — run manually at least once, outcome recorded.
3. Verified Procedure — repeatable, evidence-backed, no open blockers.
4. Skillized — packaged as a reusable skill or procedure.
5. Evaluated — exercised across representative real cases.
6. Supervised Default — the default way an agent handles a matching request, always under human
   supervision. Never implies unattended autonomy.

## Registered Run Types

| `run_type_id` | Executor | Supported modes | Lifecycle status | Notes |
|---|---|---|---|---|
| _(none registered yet)_ | | | Candidate | Add a row here the first time a run type is designed for this repository. |

Do not invent a run type entry to fill this table. Leave it as `(none registered yet)` until a
real one exists.
