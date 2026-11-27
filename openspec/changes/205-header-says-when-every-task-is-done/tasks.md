## 1. Header text

- [x] 1.1 Add the `allDone` text (`All done`) to `lib/screens/tasks_strings.dart` and show it in `_Header` of `lib/screens/tasks_screen.dart` when the list has at least one task and none is open; verify with `flutter analyze`.
- [x] 1.2 Run `flutter analyze` and `flutter test`; both pass, and no `print`, `TODO` or `debugPrint` is left.

## 2. Review corrections [Iteration 1]

- [x] 2.1 Test: add a widget test to `test/tasks_screen_test.dart` where two tasks are both done and the header reads `All done`, then one is marked open and it reads `1 of 2 open`; verify that it passes, that it fails when the `allDone` branch of `_Header` is removed (restore the code afterwards), and that `flutter analyze` and `flutter test` pass.
