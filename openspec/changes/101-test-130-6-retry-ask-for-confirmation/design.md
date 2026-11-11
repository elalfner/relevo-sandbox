# Design

## Context

The Reset button is in `MyHomePage` (`lib/main.dart`) and calls `_resetCounter`, which sets the counter to 0. See proposal.md.

## Goals / Non-Goals

**Goals:** confirm before resetting a counter of 10 or more.

**Non-Goals:** other buttons; persistence.

## Decisions

- The handler stays in `_MyHomePageState`: below 10 it resets at once; otherwise it awaits `ResetConfirmDialog.show` and resets only if it returns true (checking `mounted`).
- A dismissed dialog (back button) returns null, treated as not confirmed.

## Assumptions

- A threshold of 10 is a constant of the dialog widget.
- Existing tests that reset a counter of 10 or more are updated to confirm.

## Risks / Trade-offs

None significant.

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
