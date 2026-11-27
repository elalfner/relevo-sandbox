## Why

When every task is done the header of the Tasks screen reads `0 of N open`, which is correct but cold. It should say plainly that everything is done.

## What Changes

- The header of the Tasks screen reads `All done` when the list has at least one task and none is open.
- No other header text changes.

## Capabilities

### New Capabilities
- `tasks-header`: the summary line at the top of the Tasks screen.

### Modified Capabilities

## Impact

- `lib/screens/tasks_screen.dart` (header choice) and `lib/screens/tasks_strings.dart` (the new text).
- No dependency is added. No file under `test/` is added or changed (out of scope of the issue).
