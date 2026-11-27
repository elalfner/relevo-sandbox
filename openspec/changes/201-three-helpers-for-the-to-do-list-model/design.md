# Design

## Context

`lib/models/task.dart` defines `Task` (id, title, priority, done) and `TaskPriority` (high, medium, low). The helpers are pure functions over `List<Task>` / `Task`, one file each under `lib/models/`. See proposal.md.

## Goals / Non-Goals

**Goals:**
- Three independent helpers, each with its own test file.

**Non-Goals:**
- No screen, controller or existing test changes.

## Decisions

- Top-level functions `countTasks`, `searchTasks` and `summarizeTask`, with a small `TaskCounts` value class (`pending`, `done`), because no state is needed.
- The priority is written with the enum's `name` (`high`, `medium`, `low`).

## Risks / Trade-offs

- None: pure functions, no dependency.

## Assumptions

- The search matches a substring of the title with `toLowerCase` on both sides; it does not trim the text.
- Function names are not fixed by the issue; the file names are.
## From the issue: Constraints

- C1: no new dependency is added.
- C2: `flutter analyze` and `flutter test` pass, and no `print`, `TODO` or `debugPrint` is left.

## From the issue: Code pointers

- `a`: lib/models/task.dart
