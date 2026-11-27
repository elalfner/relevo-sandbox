## Context

`Task` and `TaskPriority` live in `lib/models/task.dart`. See proposal.md for the motivation.

## Decisions

- Each helper is a top-level pure function in its own file under `lib/models/`: `taskCounts(List<Task>)` returning a small record/class with `pending` and `done`, `searchTasks(List<Task>, String)`, and `taskSummary(Task)`.
- The priority is written with `TaskPriority.name`, which is already lower case.
- No new dependency; the helpers are independent and share no code.

## Assumptions

- Search matches a substring of the title, comparing both sides in lower case; the text is not trimmed.
- The result of the search is a new list and the input is not modified.
## From the issue: Constraints

- C1: no new dependency is added.
- C2: `flutter analyze` and `flutter test` pass, and no `print`, `TODO` or `debugPrint` is left.

## From the issue: Code pointers

- `a`: lib/models/task.dart
