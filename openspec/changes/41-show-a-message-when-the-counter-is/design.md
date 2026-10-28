## Context

The counter screen lives in `lib/main.dart` (`_MyHomePageState`). See proposal.md for motivation.

## Goals / Non-Goals

- Goal: one conditional `Text` under the counter value.
- Non-goal: messages for other numbers, changes to the increment button.

## Decisions

- Render the message with an `if (_counter == 25)` entry in the existing `Column`, with key `milestone-text`, so the widget test can find it.

## Assumptions

- The message sits directly under the counter value, before the parity text.
- The reset button also hides the message, since the value becomes 0.
- No new dependencies.

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

- On a device, tap the button 25 times and see "Twenty-five!" appear, then tap once more and see it disappear.

## From the issue: Assumptions

- The text is in English only.
