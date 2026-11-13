# Design

## Context

`lib/main.dart` holds `MyHomePage`; its Reset button (key `reset-button`) calls `_resetCounter`, which sets `_counter` to 0. Existing tests live in `test/widget_test.dart` and siblings.

## Goals / Non-Goals

**Goals:**
- Confirm before resetting a counter of 10 or more; unchanged below 10.

**Non-Goals:**
- Other buttons; persisting the counter.

## Decisions

- `_resetCounter` becomes async: below 10 it resets at once; otherwise it awaits `showDialog<bool>` with `ResetConfirmDialog` and resets only on `true` (and only if still mounted). A dismissed dialog returns null and counts as cancel.
- The dialog widget exposes the question builder and the labels as constants (see D1, D2).

## Risks / Trade-offs

- None significant; the change is local to the home screen.

## Assumptions

- The existing scenario "Reset a very large counter" now includes confirming the dialog, since a large counter asks for confirmation.
- The "Rapid double tap" scenario is restricted to a counter below 10, because above 10 the first tap opens a modal dialog.
- Dialog text is `Reset the counter of N?`, buttons labelled `Cancel` and `Confirm`.

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
