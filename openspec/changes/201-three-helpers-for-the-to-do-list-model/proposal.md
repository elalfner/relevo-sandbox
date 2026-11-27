# Proposal

## Why

The to-do list model has no way to count tasks, search them by title or describe one in a line. Three small, independent helpers add that.

## What Changes

- Count the pending and the done tasks of a list.
- Search a list for the tasks whose title contains a text, ignoring case.
- Describe a task in one line: title, priority and whether it is done.

## Capabilities

### New Capabilities
- `task-helpers`: counts, title search and one-line summary of to-do tasks.

### Modified Capabilities

## Impact

Three new files under `lib/models/` and one test file each under `test/`. No screen, controller or existing test changes. No new dependency.
