## Context

`lib/main.dart` holds the counter screen. The parity text (key `parity-text`) sits in a Column, followed by the reset button. The counter is `_counter` in `_MyHomePageState`.

## Decisions

- Add a conditional `Text('Fifteen reached', key: Key('fifteen-text'))` right after the parity text, shown only when `_counter == 15`. It derives from state, so reset hides it with no extra code.
- No new dependencies.

## Assumptions

- "Under the parity text" means directly after it in the same Column.
- The text uses the default text style.
- Only the exact value 15 triggers it (negative values cannot occur).
