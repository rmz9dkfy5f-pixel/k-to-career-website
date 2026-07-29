# Release Gate

A project is not release-ready until these checks are complete or explicitly waived.

**Status for the current change: N/A — no release is being cut.** The V3.4 adoption adds
documentation and agent configuration only; it changes no site file and creates no tag. Every box
below is deliberately left unticked. Ticking them now would record verification that has not
happened.

This gate applies at the next tagged release, which per
`docs/Standards/version_number_system.md` must also carry release notes.

## Release Checklist

### Functionality

- [ ] Core user flows work.
- [ ] Known critical bugs are resolved or accepted.
- [ ] Regression checks completed.

### Quality

- [ ] Tests pass or manual validation is documented.
- [ ] Build passes.
- [ ] Lint/typecheck pass if applicable.
- [ ] No obvious dead files or broken references.

### Security

- [ ] No secrets committed.
- [ ] Dependencies reviewed.
- [ ] Auth/data exposure risks reviewed.

### Compatibility

- [ ] Required OS/device/browser targets checked.
- [ ] Responsive behavior checked where applicable.
- [ ] Accessibility basics checked where applicable.

### Operations

- [ ] Rollback plan exists.
- [ ] Deployment steps documented.
- [ ] Monitoring/logging expectations documented.
- [ ] Release notes written.

## Release Decision

- Status: N/A
- Date: 2026-07-29
- Approver: not applicable — no release proposed
- Notes: Recorded during the V3.4 adoption so this file is not mistaken for an unrun gate on a
  pending release. Note that `Quality → Build passes` and `Lint/typecheck pass` can never be ticked
  for this repository; there is no build or linter. At release time, satisfy them via
  `TEST_STRATEGY.md`'s manual smoke test and mark the automated rows explicitly waived.
