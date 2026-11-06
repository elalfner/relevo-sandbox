## Why

The Reset button does nothing while the counter is 0, so the person should not be able to tap it.

## What Changes

- The Reset button is disabled while the counter is 0 and enabled when it is above 0.
- The button stays on the screen; it is not hidden.

## Capabilities

### New Capabilities

### Modified Capabilities

- `counter-reset`: the Reset button is enabled only when the counter is above 0.

## Impact

- `lib/main.dart` (home screen and its state) and `test/widget_test.dart`. No new dependency.
