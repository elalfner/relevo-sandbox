# Proposal

## Why

Test issue for relevo#167 (resume of a cancelled run). The home screen needs three small, independent counter buttons so the change is small but has several separable parts.

## What Changes

- Add an "Add 5" button that increases the counter by 5.
- Add a "Subtract 1" button that decreases the counter by 1.
- Add a "Double" button that doubles the counter.
- The greeting and the even or odd text keep working after each button is used.

Out of scope: saving the counter between sessions; any other button.

## Capabilities

### New Capabilities
- `counter-buttons`: three buttons on the home screen that change the counter by +5, -1 and x2.

### Modified Capabilities

## Impact

`lib/main.dart` (home screen) and widget tests under `test/`. No new dependencies.
