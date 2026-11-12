## 1. Dialog widget

- [x] 1.1 Create `lib/widgets/reset_confirm_dialog.dart` with `ResetConfirmDialog` (takes the count, returns whether confirmed), the text constants, and semantics labels on Cancel and Confirm. Verify: `test/widgets/reset_confirm_dialog_test.dart` checks the count in the question and the two buttons.

## 2. Home screen

- [x] 2.1 Make the Reset button open the dialog when the counter is 10 or more and reset only on Confirm; reset at once below 10. Verify: widget tests in `test/widgets/` or `test/` cover the four scenarios (12 shows dialog and stays 12; Confirm gives 0; Cancel and back keep 12; 9 resets with no dialog), plus 10 and 100.
- [x] 2.2 Run `flutter analyze` and `flutter test`; both pass.
