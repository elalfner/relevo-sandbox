## Context

The tooltip is set on the `FloatingActionButton` in `lib/main.dart`. Only its text changes.

## Decisions

- Change the string literal in place; no new constant or file.
- Add a widget test that reads the tooltip on opening and after a tap.

## Assumptions

- The tooltip is the only text that reads "Increment"; no existing test reads it.
- No new dependency is needed.
## From the issue: Constraints

- C1: no new dependency is added.
- C2: `flutter analyze` and `flutter test` pass, and no `print`, `TODO` or `debugPrint` is left.

## From the issue: Code pointers

- `lib/main.dart`: the counter screen, where the text lives.
- `test/widget_test.dart`: the counter checks that read the text.
