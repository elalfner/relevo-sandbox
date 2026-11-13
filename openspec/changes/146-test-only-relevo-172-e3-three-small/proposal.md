## Why

Test issue for relevo#167: three small independent buttons, so the build has three groups of tasks with checkpoints between them.

## What Changes

- Add three text buttons to the home screen: "Add 11", "Add 13" and "Add 15".
- Each adds its number to the counter, like the existing "Add 10" button.
- Out of scope: saving the counter between sessions, any other button.

## Capabilities

### New Capabilities
- `counter-add-buttons`: the "Add 11", "Add 13" and "Add 15" buttons on the home screen.

### Modified Capabilities

## Impact

- `lib/main.dart` (home screen) and widget tests under `test/`.
- The "Add 10" button and the greeting keep working.
