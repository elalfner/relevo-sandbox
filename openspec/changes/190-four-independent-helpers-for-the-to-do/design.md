# Design

## Context

`lib/models/task.dart` defines `Task` (id, title, priority, done) and `TaskPriority`. The helpers are pure Dart functions over `List<Task>` / `Task`, in their own files under `lib/models/`. See proposal.md.

## Goals / Non-Goals

**Goals:**
- Four independent top-level functions, one file each, each with its own unit test file.

**Non-Goals:**
- No change to screens, controllers or existing tests. No new dependency.

## Decisions

- `TaskCounts` is a small immutable class with `pending` and `done`; `countTasks(List<Task>)` builds it.
- `searchTasks(List<Task>, String)` returns a new list and never mutates the input.
- `summarizeTask(Task)` uses `Task.priority.name` and `done`/`pending`.
- `orderTasksByTitle(List<Task>)` returns a sorted copy using a stable sort on lowercased titles.

## Risks / Trade-offs

- Lowercasing with `toLowerCase()` is not locale aware; acceptable for this scope.

## Assumptions

- Function names are free to choose; the issue fixes only file names and behaviour.
- A title tie in the ordering keeps the original relative order (stable sort).
## From the issue: Constraints

- C1: no new dependency is added.
- C2: `flutter analyze` and `flutter test` pass, and no `print`, `TODO` or `debugPrint` is left.

## From the issue: Code pointers

- `a`: lib/models/task.dart
