## Context

`_Header` in `lib/screens/tasks_screen.dart` chooses between `TasksStrings.header(total)` (no task done) and `TasksStrings.headerOpen(open, total)`. All texts live in `lib/screens/tasks_strings.dart`.

## Decisions

- Add `TasksStrings.allDone = 'All done'` and make `_Header` pick it when `totalCount > 0 && openCount == 0`; the other branches stay as they are. The header is rebuilt by the existing `ListenableBuilder`, so reopening a task needs no extra code.
- No new dependency (C1).

## Assumptions

- The filter in use does not change the header: it counts the whole list, as today.
- The issue forbids changes under `test/`, so the scenarios are covered by the existing tests plus the later testing issue; `flutter test` must still pass.
## From the issue: Constraints

- C1: no new dependency is added.
- C2: `flutter analyze` and `flutter test` pass, and no `print`, `TODO` or `debugPrint` is left.

## From the issue: Code pointers

- `a`: lib/screens/tasks_screen.dart
- `b`: lib/screens/tasks_strings.dart
