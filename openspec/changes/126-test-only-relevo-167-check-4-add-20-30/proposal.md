# Proposal

## Why

Test change for relevo#167 (resume of a replicated build). The home screen already has an "Add 10" button; three more of the same kind exercise a template section plus two replicas.

## What Changes

- Add an "Add 20" button to the home screen that adds 20 to the counter (the template).
- Add an "Add 30" button and an "Add 40" button, replicas of the template, that add 30 and 40.
- "Add 10", the greeting and the other controls keep working.

## Capabilities

### New Capabilities
- `counter-add-buttons`: the "Add 20", "Add 30" and "Add 40" buttons that add their number to the counter.

### Modified Capabilities

## Impact

`lib/main.dart` (three buttons and their handlers) and `test/` (one widget test file per button group). No new dependency. Out of scope: saving the counter between sessions and any other button.
