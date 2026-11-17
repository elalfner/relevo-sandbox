## Context

`test/build_number_test.dart` already holds checks for builds 1, 42, 7, 0, a long number, an empty and an unreadable one. They use the `mockBuild` helper and the `app-version` and `app-build` keys.

## Decisions

- Add one `testWidgets` named in the pattern of its neighbours ("Build 99999 is shown right after the version"), using `mockBuild('99999')`, `pumpWidget(const MyApp())`, `pumpAndSettle()`, and checking `Build 99999` text and that it sits after the version.
- No app code, no other test file, no dependency changes. The test uses a mocked plugin, so no real time or network.

## Assumptions

- The version text is `v1.0.1` as the existing checks expect.
## From the issue: Constraints

- C1: no new dependency is added.
- C2: `flutter analyze` and `flutter test` pass, and no `print`, `TODO` or `debugPrint` is left.

## From the issue: Code pointers

- `x`: test/build_number_test.dart
