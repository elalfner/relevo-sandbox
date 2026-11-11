# Tasks

## 1. Dialog widget

- [x] 1.1 Create `lib/widgets/reset_confirm_dialog.dart`: `ResetConfirmDialog` takes the count, shows "Reset the counter of N?" with Cancel and Confirm buttons (each with a semantics label) and returns whether the person confirmed; the question and labels are constants of the widget.
- [x] 1.2 Add `test/widgets/reset_confirm_dialog_test.dart` covering the dialog alone (the count in the question, a count of 100 or more, the two buttons, Confirm returns true, Cancel returns false).

## 2. Home screen

- [x] 2.1 In `lib/main.dart`, make Reset reset at once below 10 and otherwise open the dialog, resetting only on Confirm (Cancel and back keep the counter; exactly 10 opens the dialog).
- [x] 2.2 Add widget tests to `test/widget_test.dart` for the four scenarios (12 shows dialog and keeps 12; Confirm resets to 0; Cancel and back keep 12; 9 resets without a dialog) and for the counter of exactly 10, reading the text from the dialog constants.
- [x] 2.3 Update the existing tests that reset a counter of 10 or more (over 1000) to tap Confirm.

## 3. Checks

- [ ] 3.1 Run `flutter analyze` and `flutter test`; both pass.
