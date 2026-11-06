# Tasks

## 1. Reset history state

- [ ] 1.1 In `lib/main.dart`, keep the history list in the home state; `_resetCounter` adds the previous value at the top only when it is not 0 and keeps at most 20. Verify with widget tests: reset adds the value, reset at 0 adds nothing, the 21st reset drops the oldest, repeated values give separate rows.

## 2. History screen

- [ ] 2.1 Create `lib/screens/history_screen.dart` with the back arrow, title "History", rows "Reset at <value>" newest first, "No resets yet" when empty, and "Clear history" only when not empty. Verify with widget tests for order, empty text and Clear history.
- [ ] 2.2 Add the History icon button (tooltip and semantics "History", 48 dp target) to the app bar actions in `lib/main.dart`, opening the screen with `Navigator.push`. Verify with a widget test that opens it and that going back keeps the counter.

## 3. Documentation

- [ ] 3.1 Add the Reset history entry to `GLOSSARY.md` exactly as given in design.md. Verify the entry text matches and nothing else changed.

## 4. Checks

- [ ] 4.1 Run `flutter analyze` and `flutter test` and verify both pass.
