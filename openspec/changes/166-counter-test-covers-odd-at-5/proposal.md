# Proposal

## Why

The parity text has a test for Odd at 3 only. A check at 5 covers one more odd count reached by taps.

## What Changes

- `test/widget_test.dart` gets one check that taps five times and expects "Odd".
- No app code and no other test file changes.

## Capabilities

### New Capabilities

### Modified Capabilities
- `counter-parity`: adds a scenario for the odd count 5.

## Impact

Only `test/widget_test.dart`. No dependency is added.
