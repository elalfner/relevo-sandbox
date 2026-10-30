## Context

`lib/main.dart` holds the counter screen (`_MyHomePageState`) with an `int _counter`.

## Decisions

- Conditionally render a `Text('Thirty-one!', key: Key('thirty-one-text'))` right after the counter value in the Column, when `_counter == 31`. No new state, no dependencies.

## Assumptions

- The reset button returns the counter to 0, so the message disappears there too.
- The message uses the default text style.

## From the issue: Decisions

### D1. Plain text below the counter
Decided: the message is a plain `Text` widget placed below the counter value.
Why: smallest change, easy to test.
Discarded: a snackbar (it hides on its own and is harder to assert).

## From the issue: Constraints

- C1: No new dependencies.

## From the issue: Code pointers

- `lib/main.dart`: holds the counter screen and its state.

## From the issue: Verification

- On a device, tap the button 31 times and see "Thirty-one!" appear, then tap once more and see it disappear.

## From the issue: Assumptions

- The text is in English only.
