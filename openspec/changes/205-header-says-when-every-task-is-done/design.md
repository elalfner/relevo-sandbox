## Context

`_Header` in `lib/screens/tasks_screen.dart` chooses between `TasksStrings.header(total)` (no task done) and `TasksStrings.headerOpen(open, total)`. All texts live in `lib/screens/tasks_strings.dart`.

## Decisions

- Add `TasksStrings.allDone = 'All done'` and make `_Header` pick it when `totalCount > 0 && openCount == 0`; the other branches stay as they are. The header is rebuilt by the existing `ListenableBuilder`, so reopening a task needs no extra code.
- No new dependency (C1).
- Correction: add a widget test for the `All done` header in `test/tasks_screen_test.dart`. The project rules (`CLAUDE.md`) require a widget test for every user-visible behaviour, and the person asked for it in a fix. This replaces, for this test only, the issue's "Out of scope" line that left tests for a later issue and allowed no change under `test/`.

## Assumptions

- The filter in use does not change the header: it counts the whole list, as today.
- Replaced by the correction below: the issue left tests for a later issue.
## From the issue: Constraints

- C1: no new dependency is added.
- C2: `flutter analyze` and `flutter test` pass, and no `print`, `TODO` or `debugPrint` is left.

## From the issue: Code pointers

- `a`: lib/screens/tasks_screen.dart
- `b`: lib/screens/tasks_strings.dart
