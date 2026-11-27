# Proposal

## Why

The to-do list model has no small helpers to count, search, describe or sort tasks. Four independent pure helpers give later screens and controllers building blocks, each delivered and tested on its own.

## What Changes

- Add `lib/models/task_counts.dart`: counts pending and done tasks of a list.
- Add `lib/models/task_search.dart`: tasks whose title contains a text, ignoring case.
- Add `lib/models/task_summary.dart`: one line describing a task.
- Add `lib/models/task_order.dart`: tasks sorted by title, ignoring case.
- Each helper has its own unit test file.

## Capabilities

### New Capabilities
- `task-list-helpers`: counting, searching, summarising and ordering tasks of the to-do list model.

### Modified Capabilities

## Impact

New files under `lib/models/` and `test/` only. No screen, controller or existing test changes. No new dependency.
