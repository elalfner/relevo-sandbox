# Tasks

## 1. Dialog widget

- [x] 1.1 Create `lib/widgets/reset_confirm_dialog.dart` with `ResetConfirmDialog` (constants for the question and button labels, Cancel and Confirm with semantics labels, a static `show` returning whether the person confirmed); verify with `test/widgets/reset_confirm_dialog_test.dart` (count in the question, both buttons, confirm true, cancel false)

## 2. Home screen

- [x] 2.1 Make the Reset button ask for confirmation when the counter is 10 or more, reading the text from the dialog widget; verify with widget tests in `test/widget_test.dart` for the scenarios: 12 shows dialog and stays 12, Confirm gives 0, Cancel and back keep 12, 9 resets at once, exactly 10 opens, 100 names the whole number
- [x] 2.2 Update existing tests that reset a counter of 10 or more; verify `flutter analyze` and `flutter test` pass
