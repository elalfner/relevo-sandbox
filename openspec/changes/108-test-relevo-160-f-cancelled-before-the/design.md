## Context

The home screen is `MyHomePage` in `lib/main.dart`; its body is a `Column` with the greeting, the counter, parity text and the reset button.

## Decisions

- Add a `Text('Tap the button to count', key: Key('count-hint'))` right after the counter `Text` in that column. It is unconditional, so it stays after any counter change.
- Add a widget test `test/count_hint_test.dart`.
- No new dependencies.

## Assumptions

- "Under the counter" means directly after the counter number in the column, before the parity text.
- The text is not translated (out of scope).
