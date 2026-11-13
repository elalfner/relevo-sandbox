## 1. Dialog widget

- [x] 1.1 Create `lib/widgets/reset_confirm_dialog.dart` with `ResetConfirmDialog` (takes the count; question text, Cancel and Confirm labels as constants; Confirm and Cancel have a semantics label; returns whether the person confirmed)
- [x] 1.2 Create `test/widgets/reset_confirm_dialog_test.dart`: the dialog alone shows the count in the question and the two buttons

## 2. Home screen

- [ ] 2.1 In `lib/main.dart`, make Reset reset at once below 10 and open `ResetConfirmDialog` at 10 or more, resetting only on Confirm
- [ ] 2.2 Add widget tests (reading the text from the dialog constants) for: counter 12 opens the dialog and stays 12; Confirm gives 0; Cancel and back button keep 12; counter 9 resets with no dialog; counter exactly 10 opens the dialog; counter 100 names the whole number
- [ ] 2.3 Update existing tests that reset a counter of 10 or more so they confirm the dialog

## 3. Checks

- [ ] 3.1 Run `flutter analyze` and `flutter test`; both pass
