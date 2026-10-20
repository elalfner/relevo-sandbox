## Context

`lib/main.dart` holds the counter screen (`_MyHomePageState`), with the parity `Text` (key `parity-text`) in a `Column`.

## Decisions

- Add a conditional `Text('Thirteen reached', key: Key('thirteen-text'))` right after the parity text, shown with `if (_counter == 13)`. No state added: it derives from `_counter`, so reset hides it.
- No new dependencies.

## Assumptions

- The message is plain text with default style.
- Other messages of the screen are untouched (out of scope).
