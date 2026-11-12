## Why

Test issue for relevo#167: the usage comment must say why each replica ran on its model. The home screen already has an "Add 10" button; three more buttons that follow it are needed.

## What Changes

- Add "Add 20", "Add 30" and "Add 40" buttons to the home screen. Each adds its number to the counter, exactly like "Add 10".
- Each button is built as its own replica of the "Add 10" button of the pattern (#119).

## Capabilities

### New Capabilities
- `counter-add-buttons`: buttons on the home screen that add a fixed number to the counter.

### Modified Capabilities

## Impact

- `lib/main.dart` (three buttons and their handlers) and one widget test file per button under `test/`.
- No new dependencies. Out of scope: saving the counter between sessions, any other button.
