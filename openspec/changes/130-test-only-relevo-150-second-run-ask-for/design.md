# Design

## Context

The Reset button (`reset-button`) of `MyHomePage` in `lib/main.dart` calls `_resetCounter`, which sets the counter to 0 at once. See proposal.md for motivation. `lib/` has only `main.dart`; there is no `lib/widgets/` yet.

## Goals / Non-Goals

**Goals:**
- Confirm before resetting a counter of 10 or more; reset at once below 10.

**Non-Goals:**
- Persistence, other buttons.

## Decisions

- `ResetConfirmDialog` is a stateless widget (an `AlertDialog`) in `lib/widgets/reset_confirm_dialog.dart` with a static `show(context, count)` returning `Future<bool>` (true only on Confirm; Cancel, back button and barrier dismissal give false).
- The question text and the button labels are constants of that file; the screen and tests read them from there.
- `_resetCounter` becomes async: below 10 it resets at once; otherwise it awaits the dialog and, if still mounted and confirmed, resets.
- The existing "Reset sets a counter over 1000 to 0" test changes to confirm through the dialog.

## Risks / Trade-offs

- [Counter changes while the dialog is open] → The dialog is modal, so the counter cannot change.

## Assumptions

- The threshold 10 is a constant in the home screen.
- Cancel and Confirm have `Semantics` labels "Cancel reset" and "Confirm reset".
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
