# Design

## Context

The home screen is `MyHomePage` in `lib/main.dart`; it shows `_counter` in one `Text`. See proposal.md.

## Goals / Non-Goals

**Goals:** bold from 10 on, normal below 10, back to normal after Reset.

**Non-Goals:** other styles, persistence.

## Decisions

The weight is computed from `_counter` in `build`, with no extra state (D1 below).

## Risks / Trade-offs

None: the weight cannot get out of step with the number.

## Assumptions

- The counter is shown in one `Text` widget (A1).
- Normal weight means the weight inherited from the theme text style, and bold means `FontWeight.bold`.

## Documentation

None requested.
## From the issue: Decisions

### D1. The weight follows the value
Decided: the weight is computed from the counter value each time the screen is built, with no extra state.
Why: it cannot get out of step with the number.
Discarded: a flag set when the counter passes 10 (it would have to be cleared on Reset).

## From the issue: Constraints

- C1: the change lives in the home screen, `lib/main.dart`.
- C2: a widget test under `test/` covers the weight at 9, at 10 and after Reset.
- C3: no new dependency is added.

## From the issue: Code pointers

- `lib/main.dart`: the `Text` that shows `_counter` in `MyHomePage`.
- `test/widget_test.dart`: the existing counter tests, to follow in style.

## From the issue: Verification

- On an Android device or emulator, tap the add button up to 10 and check that the number turns bold, then tap Reset and check that it goes back to normal weight.

## From the issue: Assumptions

- A1: the counter is shown in one `Text` widget.
