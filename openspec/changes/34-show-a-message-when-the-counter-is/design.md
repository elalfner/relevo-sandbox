## Context

The counter screen lives in `lib/main.dart` (`_MyHomePageState`). It already shows the counter value followed by a parity text.

## Decisions

- Add a conditional `Text('Nineteen!', key: Key('nineteen-text'))` in the column right after the counter value, shown only when `_counter == 19`. It uses the default (body) text style.
- No new dependencies.

## Assumptions

- The message sits directly under the counter value, above the parity text.
- The reset button also hides the message, since the value changes.

## From the issue: Decisions

### D1. Plain text below the counter
Decided: the message is a plain `Text` widget placed below the counter value.
Why: smallest change, easy to test.
Discarded: a snackbar (it hides on its own and is harder to assert).

## From the issue: Constraints

- C1: No new dependencies.

## From the issue: Code pointers

- `lib/main.dart`: holds the counter screen and its state.

## From the issue: Design reference

- `lib/main.dart`: keep the existing counter layout and typography; the message uses the body text style.

## From the issue: Verification

- On a device, tap the button 19 times and see "Nineteen!" appear, then tap once more and see it disappear.

## From the issue: Assumptions

- The text is in English only.
