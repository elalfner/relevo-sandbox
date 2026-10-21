# Design

## Context

The counter screen lives in `lib/main.dart` (`_MyHomePageState`). The counter value and the parity text are children of one `Column`. See proposal.md.

## Goals / Non-Goals

**Goals:**
- Show "Twenty-one!" below the counter value only when `_counter == 21`.

**Non-Goals:**
- Messages for other numbers; changes to the increment button.

## Decisions

- A conditional `Text` with key `twenty-one-text` in the same `Column`, placed right after the counter value text (so it sits under the counter), built from `_counter == 21`. No extra state, so it disappears on any change (including reset).

## Risks / Trade-offs

- None significant.

## Assumptions

- The message sits directly below the counter value, before the parity text.

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

- On a device, tap the button 21 times and see "Twenty-one!" appear, then tap once more and see it disappear.

## From the issue: Assumptions

- The text is in English only.
