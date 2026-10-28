## Context

`lib/main.dart` holds the counter screen; its state keeps `_counter` and already shows a parity text under the counter value. See proposal.md.

## Goals / Non-Goals

**Goals:** show the message at exactly 27.
**Non-Goals:** messages for other numbers; changes to the increment button.

## Decisions

A conditional `Text('Twenty-seven!')` with a key, placed in the same column right below the counter value, shown when `_counter == 27`.

## Risks / Trade-offs

Reset or further taps change `_counter`, so the message follows the value with no extra state.

## Assumptions

- The text is in English only.
- The message sits between the counter value and the parity text.

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

- On a device, tap the button 27 times and see "Twenty-seven!" appear, then tap once more and see it disappear.

## From the issue: Assumptions

- The text is in English only.
