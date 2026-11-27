# Proposal

## Why

The to-do list model needs three small pure helpers (counts, search, summary) that later screens can reuse.

## What Changes

- Add `lib/models/task_counts.dart`, `lib/models/task_search.dart` and `lib/models/task_summary.dart`, each with its own unit tests.

## Capabilities

### New Capabilities
- `task-helpers`: counting, searching and summarising tasks of a list.

### Modified Capabilities

## Impact

New files under `lib/models/` and `test/`. No screen, controller or existing test changes. No new dependency.

Out of scope: any change to a screen, to the controllers or to an existing test file.
