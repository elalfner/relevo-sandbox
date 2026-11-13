## Context

`lib/main.dart` holds the home screen; "Add 10" is a `TextButton` with key `add-ten-button` calling `_addTen`. The new buttons follow the same pattern.

## Decisions

- Three `TextButton`s with keys `add-eleven-button`, `add-thirteen-button`, `add-fifteen-button`, placed after "Add 10".
- Each calls `setState(() => _counter += n)`.
- No new dependencies.

## Assumptions

- Button keys follow the existing naming (`add-ten-button`).
- Tests go in a new file per button under `test/`.
