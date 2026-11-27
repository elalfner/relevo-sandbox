## Why

The to-do list model has no small reusable helpers for counting, searching and describing tasks. Three independent, pure helpers fill that gap.

## What Changes

- Add a helper that counts the pending and the done tasks of a list.
- Add a helper that returns the tasks whose title contains a text, ignoring case.
- Add a helper that returns one line describing a task: title, priority and done state.
- No screen, controller or existing test file changes.

## Capabilities

### New Capabilities
- `task-counts`: counts of pending and done tasks of a list.
- `task-search`: case-insensitive title search over a list of tasks.
- `task-summary`: one-line description of a task.

### Modified Capabilities

## Impact

New files `lib/models/task_counts.dart`, `lib/models/task_search.dart`, `lib/models/task_summary.dart` and their tests under `test/`. No dependencies.
