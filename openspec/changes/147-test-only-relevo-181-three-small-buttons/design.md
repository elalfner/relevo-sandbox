## Context

`lib/main.dart` holds `MyHomePage` with a counter and an "Add 10" `TextButton` (key `add-ten-button`, handler `_addTen`). See proposal.md.

## Decisions

- Each new button is a `TextButton` placed after "Add 10", with key `add-21-button`, `add-23-button`, `add-25-button`, and its own handler adding its number via `setState`.
- Tests go in `test/widget_test.dart` style files, one test group per button.
- No new dependencies.

## Assumptions

- Key names follow the `add-ten-button` pattern.
- The buttons appear below "Add 10", in the order 21, 23, 25.
