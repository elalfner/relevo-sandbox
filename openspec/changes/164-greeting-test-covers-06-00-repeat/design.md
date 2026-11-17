## Context

`test/greeting_test.dart` builds a table of cases (`name -> (hour, minute, greeting)`) and runs each through the `openAt` helper with an injected clock, so no case depends on the real time or the network.

## Decisions

- Add one entry `'morning at 06:00': (6, 0, 'Good morning')` to the existing `cases` map. It reuses the generated test `shows $name`, so the name pattern and helpers are followed without new code.
- No change to `lib/`, other tests, or dependencies.

## Assumptions

- The new entry goes after `'morning at 05:00'` for readability; order does not affect behaviour.
## From the issue: Constraints

- C1: no new dependency is added.
- C2: `flutter analyze` and `flutter test` pass, and no `print`, `TODO` or `debugPrint` is left.

## From the issue: Code pointers

- `x`: test/greeting_test.dart
