# Tasks

## 1. Dialog widget

- [ ] 1.1 Create `ResetConfirmDialog` in `lib/widgets/reset_confirm_dialog.dart` with constants for the question and the Cancel/Confirm labels, semantics labels on both buttons, taking the count and returning whether the person confirmed; verify with `flutter analyze`
- [ ] 1.2 Add `test/widgets/reset_confirm_dialog_test.dart` covering the count in the question and the two buttons; verify the test passes

## 2. Home screen

- [ ] 2.1 In `lib/main.dart`, make Reset ask via the dialog when the counter is 10 or more (reset only on Confirm; Cancel, back or dismiss keeps the count) and reset at once below 10; the screen reads the texts from the dialog constants; verify with `flutter analyze`
- [ ] 2.2 Add tests in `test/widget_test.dart` for the four scenarios (12 shows the dialog and stays 12; Confirm gives 0; Cancel/back keeps 12; 9 resets without a dialog) plus exactly 10 and 100 or more; update the existing 1001 reset test to confirm; verify `flutter test` passes
- [ ] 2.3 Run `flutter analyze` and `flutter test` and verify both pass
