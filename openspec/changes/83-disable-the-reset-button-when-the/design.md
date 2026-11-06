## Context

`MyHomePage` in `lib/main.dart` already has a `TextButton` with key `reset-button` and a `_counter` state. See proposal.md.

## Goals / Non-Goals

**Goals:**
- Reset is enabled only when `_counter > 0`.

**Non-Goals:**
- Any change to the add button or the look of the screen.

## Decisions

- Pass `null` as `onPressed` of the Reset button while `_counter == 0`; Flutter then renders it disabled and ignores taps. No new state and no new dependency.

## Assumptions

- The existing tests that tap Reset at 0 keep passing, since a disabled button ignores the tap and the counter stays 0.

## From the issue: Decisions

### D1. Disabled, not hidden
Decided: the Reset button stays on the screen and is disabled while the counter is 0.
Why: the layout does not move and the person still sees that the action exists.
Discarded: hiding the button (the layout would jump when it appears).

## From the issue: Constraints

- C1: the change lives in the home screen, `lib/main.dart`, and its state.
- C2: a widget test under `test/` covers the disabled state at 0, the enabled state after one tap and the disabled state again after Reset.
- C3: no new dependency is added.

## From the issue: Code pointers

- `lib/main.dart`: the Reset button of `MyHomePage` and `_counter`.
- `test/widget_test.dart`: the existing counter tests, to follow in style.

## From the issue: Verification

- On an Android device or emulator, check that Reset is disabled at 0, enabled after one tap, and disabled again after Reset.

## From the issue: Assumptions

- A1: the Reset button already exists on the home screen.
