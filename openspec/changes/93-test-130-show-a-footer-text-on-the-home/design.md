## Context

`MyHomePage` in `lib/main.dart` builds a `Scaffold` with a centered column body. The footer is one line of text.

## Decisions

- Add a `Text('Relevo test', key: Key('footer-text'))` in the home screen, below the body content, using the Scaffold's `bottomNavigationBar` or a `Column` with an `Expanded` body, so it sits at the bottom and does not move with the counter.
- Add widget tests in `test/widget_test.dart` for the footer at start and after increment and reset.

## Assumptions

- The home screen has room for one more line of text.
- No new dependency is added.

## From the issue: Decisions

### D1. The footer lives in the home screen
Decided: the footer is a `Text` in the home screen, `lib/main.dart`.
Why: it is one line and needs no widget of its own.
Discarded: a separate widget file.

## From the issue: Constraints

- C1: the change lives in `lib/main.dart`.
- C2: a widget test under `test/` covers the footer text, also after the counter changes.
- C3: no new dependency is added.

## From the issue: Code pointers

- `lib/main.dart`: `MyHomePage`.
- `test/widget_test.dart`: the existing counter tests, to follow in style.

## From the issue: Verification

- On an Android device or emulator, check that the text "Relevo test" shows at the bottom of the home screen.

## From the issue: Assumptions

- A1: the home screen has room for one more line of text.

Model: haiku
