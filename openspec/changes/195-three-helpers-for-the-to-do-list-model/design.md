# Design

## Context

See proposal.md. `lib/models/task.dart` defines `Task` (title, priority, done). The three helpers are pure functions over `List<Task>` / `Task`, one file each under `lib/models/`, with no Flutter dependency. No new dependency is added.

## Goals / Non-Goals

**Goals:**
- Three independent helpers with their own test files under `test/`.

**Non-Goals:**
- Any change to a screen, a controller or an existing test file.

## Decisions

- Top-level functions (`countTasks`, `searchTasks`, `summarizeTask`) rather than classes; the counts are returned as a small immutable value type `TaskCounts` with `pending` and `done`.
- The summary uses the enum name for the priority (`high`, `medium`, `low`).

## Assumptions

- Search matches by substring on the lowercase of both title and text, and keeps the original order.
- The text is not trimmed before searching.
## From the issue: Constraints

- C1: no new dependency is added.
- C2: `flutter analyze` and `flutter test` pass, and no `print`, `TODO` or `debugPrint` is left.

## From the issue: Code pointers

- `a`: lib/models/task.dart
