# Design

## Context

`test/greeting_test.dart` builds a table of cases `name -> (hour, minute, text)` in the group "Greeting by time of day" and opens the app through the `openAt` helper, which injects a fixed clock into `MyApp`.

## Goals / Non-Goals

**Goals:**
- Add the case `'morning at 06:00': (6, 0, 'Good morning')` to that table.

**Non-Goals:**
- Any change to app code, other test files or other cases.

## Decisions

- Reuse the table and the `openAt` clock helper, so the case does not depend on the real time and its name follows the pattern of the others.

## Assumptions

- The case goes after `'morning at 05:00'`, next to the other morning cases; the order does not matter to the behaviour.

## Risks / Trade-offs

- None: a single table entry in a test file.
## From the issue: Constraints

- C1: no new dependency is added.
- C2: `flutter analyze` and `flutter test` pass, and no `print`, `TODO` or `debugPrint` is left.

## From the issue: Code pointers

- `test/greeting_test.dart`: the table of cases of the group "Greeting by time of day".
