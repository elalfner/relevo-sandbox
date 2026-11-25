## Context

The counter screen lives in `lib/main.dart` (`MyApp`, with an injectable `clock`). Existing tests in `test/widget_test.dart` and `test/thirty_one_test.dart` use `testWidgets`, `tester.tap(find.byIcon(Icons.add))` and `find.text`.

## Goals / Non-Goals

**Goals:** four new test files, one per behaviour, following the style of the tests around them.

**Non-Goals:** any change to app code or to existing tests; any new dependency.

## Decisions

- Each file builds the app with `MyApp(clock: () => DateTime(2026, 1, 1, 9))` as `thirty_one_test.dart` does, so no check reads the real time; no network is used.
- Each file keeps its own small `tapIncrement` helper, like `thirty_one_test.dart`, instead of editing a shared file.

## Risks / Trade-offs

Duplicated helpers across files, accepted to leave existing files unchanged.

## Assumptions

- The clock parameter of `MyApp` is optional and accepts a `DateTime Function()`, as used in `test/thirty_one_test.dart`.
## From the issue: Constraints

- C1: no new dependency is added.
- C2: `flutter analyze` and `flutter test` pass, and no `print`, `TODO` or `debugPrint` is left.

## From the issue: Code pointers

- `a`: test/even_odd_test.dart
- `b`: test/caption_test.dart
- `c`: test/tooltip_test.dart
- `d`: test/three_taps_test.dart
