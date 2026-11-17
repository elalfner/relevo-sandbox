## Context

`lib/main.dart` already gives the `FloatingActionButton` the tooltip `'Increment'`. This change only adds a test for it.

## Decisions

- One new file, `test/tooltip_test.dart`, with one `testWidgets` check. It pumps `MyApp` as `test/widget_test.dart` does and finds the tooltip with `find.byTooltip('Increment')`, on the `FloatingActionButton`.
- No timers and no network: the check uses only `pumpWidget` and `pump`.

## Assumptions

- The name pattern and helpers are those of `test/widget_test.dart` (`testWidgets`, `tester`, `MyApp`).
- Dart import and lint settings follow the neighbouring test files.

## From the issue: Constraints

- C1: no new dependency is added.
- C2: `flutter analyze` and `flutter test` pass, and no `print`, `TODO` or `debugPrint` is left.

## From the issue: Code pointers

- `x`: test/tooltip_test.dart
