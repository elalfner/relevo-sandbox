# Tasks

## 1. Counter screen tests

- [ ] 1.1 Add `test/app_version_test.dart` with one check that the label with key `app-version` shows `v1.0.1`; verify with `flutter test test/app_version_test.dart`
- [ ] 1.2 Add `test/reset_button_test.dart` with one check that the counter shows 0 after two taps on `+` and a tap on the Reset button; verify with `flutter test test/reset_button_test.dart`
- [ ] 1.3 Add `test/reset_parity_test.dart` with one check that the label with key `parity-text` reads Even after one tap on `+` and a tap on Reset; verify with `flutter test test/reset_parity_test.dart`
- [ ] 1.4 Run `flutter analyze` and `flutter test`; verify both pass, no existing test changed, and no `print`, `TODO` or `debugPrint` is left
