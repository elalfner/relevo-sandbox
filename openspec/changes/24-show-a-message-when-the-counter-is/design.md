## Context

`lib/main.dart` holds the counter screen (`_MyHomePageState`) with a column whose parity text has the key `parity-text`. Reset already sets the counter to 0.

## Decisions

- Add `if (_counter == 7) const Text('Seven reached', key: Key('seven-text'))` right after the parity text. It is derived from `_counter`, so reset hides it with no extra state.
- No new dependencies.

## Assumptions

- The message is plain text with the key `seven-text`, in the default text style.
- The "text added for five" mentioned in the issue does not exist in this branch; nothing is done about it.
