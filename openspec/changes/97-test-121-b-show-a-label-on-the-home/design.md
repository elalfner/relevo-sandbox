## Context

`MyHomePage` in `lib/main.dart` already renders the greeting, counter, parity text and reset button in a `Column`.

## Decisions

- Add one `Text('Relevo 121 B', key: Key('home-label'))` to that `Column`, right after the counter `Text` (before the parity text), in `lib/main.dart`. No new screen or widget file is needed since no screen is added.
- Add widget tests in `test/widget_test.dart` for the label below the counter and after the counter changes.
- No new dependency.

## Assumptions

- A1: the home screen has room for one more line (the body is scrollable).
## From the issue: Decisions

### D1. The label lives in the home screen
Decided: the label is a `Text` in the home screen, `lib/main.dart`.
Why: it is one line and needs no widget of its own.
Discarded: a separate widget file.

## From the issue: Constraints

- C1: the change lives in `lib/main.dart`.
- C2: a widget test under `test/` covers the label text, also after the counter changes.
- C3: no new dependency is added.

## From the issue: Code pointers

- `lib/main.dart`: `MyHomePage`.
- `test/widget_test.dart`: the existing counter tests, to follow in style.

## From the issue: Verification

- On an Android device or emulator, check that the text "Relevo 121 B" shows below the counter on the home screen.

## From the issue: Assumptions

- A1: the home screen has room for one more line of text.

Model: haiku
