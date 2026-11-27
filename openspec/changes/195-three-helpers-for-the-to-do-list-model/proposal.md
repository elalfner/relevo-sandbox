# Proposal

## Why

The to-do list model has no small reusable helpers to count, search and describe tasks. Three independent helpers are added, each with its own tests.

## What Changes

- Count the pending and the done tasks of a list.
- Return the tasks whose title contains a text, ignoring case.
- Return one line that describes a task: title, priority and whether it is done.

## Capabilities

### New Capabilities
- `task-counts`: counts the pending and the done tasks of a list.
- `task-search`: filters a list of tasks by a text in the title, ignoring case.
- `task-summary`: one descriptive line for a task.

### Modified Capabilities

## Impact

New files `lib/models/task_counts.dart`, `lib/models/task_search.dart`, `lib/models/task_summary.dart` and their tests. No screen, controller or existing test changes, and no new dependency.
