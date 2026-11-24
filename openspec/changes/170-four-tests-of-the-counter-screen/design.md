# Design

## Context

The counter screen is in `lib/main.dart` (`MyApp`). Existing tests such as `test/widget_test.dart` use `testWidgets`, `tester.pumpWidget(const MyApp())` and a local `tapAdd` helper that taps `Icons.add`. See proposal.md for motivation.

## Goals / Non-Goals

**Goals:**
- Add the four test files, each following the name pattern and helpers of the tests around them.

**Non-Goals:**
- Any change to app code or to an existing test file.

## Decisions

- Each file is self-contained and defines its own small tap helper, since the helper in `widget_test.dart` is local to that file and that file must not change.
- Tests use only `flutter_test`; no dependency is added.

## Risks / Trade-offs

- Duplicated tap helper across files → accepted to keep existing tests untouched.

## Assumptions

- The tooltip is found with `find.byTooltip('Increment')`.
- The app is built with `const MyApp()` as in the existing tests.
## From the issue: Constraints

- C1: no new dependency is added.
- C2: `flutter analyze` and `flutter test` pass, and no `print`, `TODO` or `debugPrint` is left.

## From the issue: Code pointers

- `a`: test/even_odd_test.dart
- `b`: test/caption_test.dart
- `c`: test/tooltip_test.dart
- `d`: test/three_taps_test.dart
