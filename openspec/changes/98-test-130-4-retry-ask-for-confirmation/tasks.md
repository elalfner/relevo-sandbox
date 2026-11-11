## 1. Dialog widget

- [ ] 1.1 Create `lib/widgets/reset_confirm_dialog.dart` with `ResetConfirmDialog` (count in, bool out), constants for the question and button labels, and semantics labels on Confirm and Cancel. Verify: `test/widgets/reset_confirm_dialog_test.dart` checks the count in the question and the two buttons.

## 2. Home screen

- [ ] 2.1 In `lib/main.dart`, make Reset open the dialog when the counter is 10 or more and reset only on Confirm; reset at once below 10. Verify: tests in `test/widget_test.dart` cover counter 12 (dialog, still 12), Confirm (0), Cancel/back (still 12), counter 9 (no dialog, 0), exactly 10 and 100.

## 3. Checks

- [ ] 3.1 Run `flutter analyze` and `flutter test`; both pass.
