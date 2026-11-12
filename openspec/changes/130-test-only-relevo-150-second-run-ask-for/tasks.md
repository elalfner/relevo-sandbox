# Tasks

## 1. Dialog widget

- [x] 1.1 Create `lib/widgets/reset_confirm_dialog.dart` with `ResetConfirmDialog` (constants for the question and the Cancel and Confirm labels, semantics labels on both buttons, a function that shows it for a count and returns whether the person confirmed); verify with `test/widgets/reset_confirm_dialog_test.dart` (count in the question, the two buttons, 100 or more names the whole number).

## 2. Home screen

- [x] 2.1 Make Reset in `lib/main.dart` open the dialog when the counter is 10 or more and reset only on Confirm, and at once below 10; verify with widget tests in `test/widget_test.dart` for counter 12 (dialog shown, still 12), Confirm (0), Cancel and back (still 12), counter 9 (no dialog, 0), exactly 10 (dialog).
- [x] 2.2 Update the existing over-1000 reset test to confirm through the dialog; verify `flutter test` and `flutter analyze` pass.
