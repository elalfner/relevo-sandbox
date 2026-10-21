# Design

## Context

`lib/main.dart` holds `MyHomePage` and its state with the `_counter` integer. The counter value is rendered in a `Text` inside a `Column`. See proposal.md for motivation.

## Goals / Non-Goals

**Goals:**
- Conditionally render the message in the existing `Column`, right below the counter value.

**Non-Goals:**
- Messages for other numbers; changes to the increment button.

## Decisions

- Use a collection `if (_counter == 23)` in the `Column` children, with a `Text('Twenty-three!')` keyed `Key('twenty-three-text')` for tests. No new state is needed.

## Risks / Trade-offs

- None significant.

## Assumptions

- The text is in English only.
- The existing Reset button can be used in tests to return the counter to a different value; reaching 23 in a test is done by tapping the increment button 23 times.

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

- On a device, tap the button 23 times and see "Twenty-three!" appear, then tap once more and see it disappear.

## From the issue: Assumptions

- The text is in English only.
