## Why

Test issue for relevo#181: three small independent buttons so the build has three groups of tasks with checkpoints between them.

## What Changes

- Add three text buttons to the home screen: "Add 21", "Add 23" and "Add 25". Each adds its number to the counter, like the existing "Add 10" button.
- Each button is built in its own task section with its own widget test.

## Capabilities

### New Capabilities
- `counter-add-buttons`: buttons that add 21, 23 or 25 to the counter.

### Modified Capabilities

## Impact

- `lib/main.dart` (home screen) and widget tests under `test/`.
- Out of scope: saving the counter between sessions; any other button.
