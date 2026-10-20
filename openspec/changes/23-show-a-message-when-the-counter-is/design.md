## Context

The counter screen is `MyHomePage` in `lib/main.dart`. The parity text has key `parity-text` and sits in a `Column` just above the reset button.

## Decisions

- Add a conditional `Text('Five reached', key: Key('five-reached-text'))` right after the parity text, shown only when `_counter == 5`. Reset already sets the counter to 0, so the text disappears with no extra code.
- No new dependencies.

## Assumptions

- The message is not shown for negative values or any value other than 5 (the counter only counts up from 0).
- The issue's mention of the text added for ten is out of scope; no such change is made here.
