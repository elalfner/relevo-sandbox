## Context

`lib/main.dart` already has a `TextButton` with key `reset-button` calling `_resetCounter`, which sets `_counter` to 0 inside `setState`. Tests in `test/widget_test.dart`, `test/greeting_test.dart` and `test/thirty_one_test.dart` cover most reset behaviour.

## Decisions

- Keep the existing implementation; add only the missing tests (reset from exactly 3).
- No confirmation and no persistence (out of scope in the issue).

## Assumptions

- The reset button already on `dev` satisfies the issue; no UI change is needed unless a test shows otherwise.
- No new dependencies.
