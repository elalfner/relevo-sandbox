# Proposal

## Why

Test issue for relevo#167: the home screen has an "Add 10" button and the person wants the same kind of button for 20, 30 and 40.

## What Changes

- Add three buttons on the home screen: "Add 20", "Add 30" and "Add 40".
- Each adds its number to the counter, exactly like "Add 10" does.
- "Add 10" and the greeting keep working.

## Capabilities

### New Capabilities
- `add-buttons`: buttons on the home screen that add a fixed number to the counter.

### Modified Capabilities

## Impact

- `lib/main.dart` (home screen) and a new widget test under `test/`. No new dependencies.
