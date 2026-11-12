# Proposal

## Why

The home screen has an "Add 10" button. Test issue for relevo#167 (guided replication): three more buttons that follow the same pattern.

## What Changes

- Add an "Add 20" button that adds 20 to the counter.
- Add an "Add 30" button that adds 30 to the counter.
- Add an "Add 40" button that adds 40 to the counter.
- Each is a replica of the "Add 10" button of the pattern (#119, change #120); "Add 10" and the greeting keep working.

## Capabilities

### New Capabilities
- `counter-add-buttons`: buttons that add a fixed amount (20, 30, 40) to the counter.

### Modified Capabilities

## Impact

`lib/main.dart` (three buttons and their handlers) and one widget test file per button under `test/`. No new dependencies.

Out of scope: saving the counter between sessions; any other button.
