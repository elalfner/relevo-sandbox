# Design

## Context

The counter screen is `MyHomePage` in `lib/main.dart`: a caption `Text`, the count, a `Text` with key `parity-text` that reads Even or Odd, and a `FloatingActionButton` with tooltip `Increment`. Existing tests (`test/widget_test.dart`, `test/thirty_one_test.dart`) pump `MyApp(clock: () => DateTime(2026, 1, 1, 9))` or `MyApp()`, tap `find.byIcon(Icons.add)` and `pump()`.

## Decisions

- Four new files under `test/`, one per area, each with `// ignore_for_file: deprecated_member_use` and the imports of its neighbours.
- Each test pumps `MyApp(clock: () => DateTime(2026, 1, 1, 9))` so nothing depends on the real time; nothing uses the network.
- Tests follow the name pattern and the helpers of the neighbours (`tester.tap(find.byIcon(Icons.add))`, `pump()`); no shared helper file is changed and no existing file is edited.
- No new dependency.

## Assumptions

- The tooltip is found with `find.byTooltip('Increment')`.
- `PackageInfo` is not mocked: its failure is caught by the app, as in the existing tests.
## From the issue: Constraints

- C1: no new dependency is added.
- C2: `flutter analyze` and `flutter test` pass, and no `print`, `TODO` or `debugPrint` is left.

## From the issue: Code pointers

- `a`: test/even_odd_test.dart
- `b`: test/caption_test.dart
- `c`: test/tooltip_test.dart
- `d`: test/three_taps_test.dart
