## Why

Resetting a large counter by mistake loses the count. The Reset button should ask for confirmation when the counter is 10 or more.

## What Changes

- Tapping Reset with a counter of 10 or more opens a dialog that names the count and asks to confirm.
- The counter is reset only on Confirm; below 10 it is reset at once, as today.

## Capabilities

### New Capabilities
- `counter-reset`: how the Reset button behaves, including the confirmation for large counters.

### Modified Capabilities

## Impact

- `lib/main.dart` (Reset button of the home screen), a new widget under `lib/widgets/`, and widget tests under `test/`. No new dependency.
