# Tasks

## 1. Dialog widget

- [x] 1.1 Create `lib/widgets/reset_confirm_dialog.dart` with `ResetConfirmDialog` (takes the count, returns whether the person confirmed) and constants for the question and the Cancel/Confirm labels; Cancel and Confirm have semantics labels
- [x] 1.2 Add `test/widgets/reset_confirm_dialog_test.dart`: the dialog alone shows the count in the question and the two buttons

## 2. Home screen

- [ ] 2.1 In `lib/main.dart`, make Reset open the dialog when the counter is 10 or more and reset only on Confirm; below 10 reset at once
- [ ] 2.2 Add widget tests in `test/` for: dialog at 12 with counter still 12; Confirm gives 0; Cancel and back button keep 12; 9 resets with no dialog; exactly 10 opens the dialog; 100 or more names the whole number
- [ ] 2.3 Update existing reset tests that tap Reset on a counter of 10 or more
- [ ] 2.4 Run `flutter analyze` and `flutter test`
