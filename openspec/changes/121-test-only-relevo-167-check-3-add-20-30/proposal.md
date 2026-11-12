# Proposal

## Why

The home screen has an "Add 10" button. Test issue for relevo#167 (guided replication): three more buttons that follow it.

## What Changes

- Add "Add 20", "Add 30" and "Add 40" buttons to the home screen, each adding its number to the counter exactly like "Add 10".

## Capabilities

### New Capabilities
- `counter-add-buttons`: buttons that add 20, 30 or 40 to the counter.

### Modified Capabilities

## Impact

- `lib/main.dart` (home screen) and new widget tests under `test/`. No new dependencies.

## Out of scope

- Saving the counter between sessions.
- Any other button.
