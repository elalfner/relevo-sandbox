# Proposal

## Why

The home screen must let a person put the counter back to zero with a "Reset" button (issue #102, a small test issue for the Relevo workflow templates).

## What Changes

- The home screen has a "Reset" button that sets the counter to 0.
- The existing `counter-reset` behaviour already ships on `dev`; this change pins the issue's scenarios (3 to 0, 0 to 0) and the edge case (greeting and even/odd text keep working after a reset) with tests, and adds only what is missing.

## Capabilities

### New Capabilities

### Modified Capabilities
- `counter-reset`: adds the scenarios of issue #102 (reset from 3, and greeting and parity after a reset).

## Impact

- `lib/main.dart` (only if the behaviour is found missing) and `test/widget_test.dart`.
- No new dependencies.
