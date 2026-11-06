## 1. Reset button

- [x] 1.1 In `lib/main.dart`, set `onPressed` of the Reset button to null while `_counter == 0`. Verify: widget tests in 1.2 pass.
- [x] 1.2 In `test/widget_test.dart`, add widget tests: Reset disabled at 0, enabled after one tap on add, disabled again after Reset from 5, and tapping it at 0 changes nothing and throws nothing. Verify: `flutter test` passes.
- [x] 1.3 Run `flutter analyze` and `flutter test`. Verify: both pass.
