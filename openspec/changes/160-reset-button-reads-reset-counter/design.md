## Context

The counter screen is in `lib/main.dart`; the Reset button is a `TextButton` with key `reset-button` whose child is `Text('Reset')`. The checks are in `test/widget_test.dart`.

## Decisions

- Change only the child text to `Reset counter`. The button is already inside a scrollable column, so the longer text wraps or fits without a layout change.

## Assumptions

- Other tests find the button by its key, so only the text lookup in `test/widget_test.dart` needs updating.
- No new dependency is needed.

## From the issue: Constraints

- C1: no new dependency is added.
- C2: `flutter analyze` and `flutter test` pass, and no `print`, `TODO` or `debugPrint` is left.

## From the issue: Code pointers

- `lib/main.dart`: the counter screen, where the text lives.
- `test/widget_test.dart`: the counter checks that read the text.
