# Design

## Approach

In `lib/main.dart`, `_MyHomePageState.build` adds a conditional `Text('Eleven reached', key: Key('eleven-text'))` right after the parity text, shown only when `_counter == 11`. It is derived from `_counter`, so reset hides it with no extra state. No new dependencies.

## Assumptions

- The `Depends-on: elalfner/relevo#12` line is a scheduling gate only; it adds no behaviour.
- The widget key `eleven-text` is chosen for tests, following the existing key naming.
- The message is plain text with default style.
