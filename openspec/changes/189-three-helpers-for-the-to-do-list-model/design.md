# Design

## Context

`lib/models/task.dart` defines `Task` and `TaskPriority`. The helpers are top-level pure functions in new files; nothing existing changes.

## Goals / Non-Goals

**Goals:** three independent helpers with unit tests.

**Non-Goals:** screens, controllers, existing tests, new dependencies.

## Decisions

- `taskCounts(List<Task>)` returns a `TaskCounts` with `pending` and `done`.
- `searchTasks(List<Task>, String)` filters by lower-cased `contains`.
- `taskSummary(Task)` returns `'<title> (<priority name>, done|pending)'`.

## Risks / Trade-offs

None.

## Assumptions

- The search text is not trimmed.
## From the issue: Constraints

- C1: no new dependency is added.
- C2: `flutter analyze` and `flutter test` pass, and no `print`, `TODO` or `debugPrint` is left.

## From the issue: Code pointers

- `a`: lib/models/task.dart
