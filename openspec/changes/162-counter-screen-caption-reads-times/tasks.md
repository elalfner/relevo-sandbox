# Tasks

## 1. Caption text

- [x] 1.1 Change the caption in `lib/main.dart` to "Times pressed:" and verify with `grep` that the old text no longer appears in `lib/`
- [x] 1.2 Update the checks in `test/` that read the old text to "Times pressed:", add widget tests for the caption on opening, after a tap, and on a very small screen without overflow, and verify `flutter test` passes
- [x] 1.3 Run `flutter analyze` and `flutter test` and verify both pass with no `print`, `TODO` or `debugPrint` left
