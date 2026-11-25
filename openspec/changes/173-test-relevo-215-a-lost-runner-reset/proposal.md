## Why

Issue #173 asks for a "Reset" button on the home screen that puts the counter back to 0. The button, its spec (`counter-reset`) and most of its tests already exist on `dev`. What the issue adds is the edge case that the greeting and the even or odd text keep working after a reset, and only the parity part is tested today.

## What Changes

- Confirm the "Reset" behaviour of the issue against the existing code (no production change expected).
- Add a widget test that the greeting is unchanged after a reset.
- Record the edge case as a requirement of `counter-reset`.

## Capabilities

### New Capabilities

### Modified Capabilities

- `counter-reset`: adds the requirement that the greeting and the even or odd text keep working after a reset.

## Impact

- `test/widget_test.dart`: one new widget test.
- No production code, dependency or platform change.
