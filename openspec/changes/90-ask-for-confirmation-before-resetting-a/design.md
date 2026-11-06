# Design

## Context

The Reset button is in `MyHomePage` (`lib/main.dart`) and calls `_resetCounter`, which sets the counter to 0. See proposal.md for motivation.

## Goals / Non-Goals

**Goals:**
- Ask for confirmation at a counter of 10 or more; keep the instant reset below 10.

**Non-Goals:**
- Other buttons, persistence of the counter.

## Decisions

- The dialog is a widget `ResetConfirmDialog` in `lib/widgets/reset_confirm_dialog.dart`, shown with `showDialog<bool>`; a null result (back button, barrier) counts as Cancel.
- The existing tests that reset a counter of 10 or more (the 1001 case) are updated to confirm in the dialog.

## Risks / Trade-offs

- Existing reset tests above 9 now need a Confirm tap → update them in the same change.

## Assumptions

- No new dependency is needed; the dialog uses Material's `AlertDialog`.

## From the issue: Decisions

### D1. The dialog lives in its own widget
Decided: the dialog is a widget `ResetConfirmDialog` in `lib/widgets/reset_confirm_dialog.dart`, which takes the count and returns whether the person confirmed.
Why: the home screen stays small and the dialog can be tested alone.
Discarded: building the dialog inline in the `onPressed` of the button.

### D2. The text comes from one place
Decided: the question and the button labels are constants of the dialog widget, and the home screen and the tests read them from there.
Why: the text is written once.
Discarded: repeating the strings in the screen and in the tests.

## From the issue: Constraints

- C1: one file per widget under `lib/widgets/`, and one test per widget under `test/widgets/`.
- C2: a widget test covers each of the four scenarios, and one more covers the dialog alone (the count in the question and the two buttons).
- C3: the Confirm and Cancel buttons have a semantics label.
- C4: no new dependency is added.

## From the issue: Code pointers

- `lib/main.dart`: the Reset button of `MyHomePage`.
- `test/widget_test.dart`: the existing counter tests, to follow in style.

## From the issue: Verification

- On an Android device or emulator, tap add up to 10, tap Reset and check that the dialog names 10; tap Cancel and check that the counter stays; tap Reset and Confirm and check that it goes to 0.

## From the issue: Assumptions

- A1: the Reset button exists on the home screen.

Model: haiku
