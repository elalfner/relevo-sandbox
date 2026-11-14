## Context

The version label is the constant `appVersion` in `lib/main.dart`, shown in the app bar subtitle with key `app-version`. The build number is read from `pubspec.yaml` through `package_info_plus` and shown next to it. Only the constant and the tests that assert its text change.

## Decisions

- Change the value of `appVersion` from `v1.0.0` to `v1.1.0`; no layout change, since the existing `Flexible` + ellipsis already handles small screens.
- Update the assertions in `test/build_number_test.dart` and `test/widget_test.dart` that expect "v1.0.0".
- No new dependency. `pubspec.yaml` is not touched.

## Assumptions

- The mocked package version `1.0.0` in `test/build_number_test.dart` is the mocked pubspec version, not the version label, so it stays as is.
## From the issue: Constraints

- C1: no new dependency is added.
- C2: `flutter analyze` and `flutter test` pass, and no `print`, `TODO` or `debugPrint` is left.

## From the issue: Code pointers

- `lib/main.dart`: the constant `appVersion`, which holds the version label.
- `test/build_number_test.dart`: the checks of the subtitle and of the build number.
- `test/widget_test.dart`: the counter checks that also read the version label.
