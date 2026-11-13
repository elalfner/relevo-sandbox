# Proposal

## Why

The home screen only has an "Add 10" shortcut. This is a test issue (relevo#167, relevo#181, language es) that asks for three more independent shortcuts so the build has three groups of tasks with checkpoints between them.

## What Changes

- Add an "Add 31" button to the home screen that adds 31 to the counter.
- Add an "Add 33" button that adds 33 to the counter.
- Add an "Add 35" button that adds 35 to the counter.
- The "Add 10" button and the greeting keep working.

## Capabilities

### New Capabilities
- `counter-add-buttons`: buttons on the home screen that add 31, 33 or 35 to the counter.

### Modified Capabilities

## Impact

`lib/main.dart` (home screen) and one new widget test file per button under `test/`. No new dependencies. Out of scope: saving the counter between sessions and any other button.
