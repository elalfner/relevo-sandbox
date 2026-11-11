# Design

## Context

`MyHomePage` in `lib/main.dart` builds a Scaffold whose body is a centered Column holding the greeting, the counter text and the reset button. See proposal.md for motivation.

## Goals / Non-Goals

**Goals:** show one fixed `Text` above the counter.

**Non-Goals:** any other text, color or style; persistence.

## Decisions

- The header is a `Text` with key `guided-header` in the body Column of `MyHomePage`, placed above the counter text. No new widget file, no new dependency.

## Risks / Trade-offs

- The Column is inside a `SingleChildScrollView`, so one more line cannot overflow.

## Assumptions

- The header goes first in the body Column, above the greeting and the counter label, which satisfies "above the counter".
## From the issue: Decisions

### D1. The header lives in the home screen
Decided: the header is a `Text` in the home screen, `lib/main.dart`.
Why: it is one line and needs no widget of its own.
Discarded: a separate widget file.

## From the issue: Constraints

- C1: the change lives in `lib/main.dart`.
- C2: a widget test under `test/` covers the header text, also after the counter changes.
- C3: no new dependency is added.

## From the issue: Code pointers

- `lib/main.dart`: `MyHomePage`.
- `test/widget_test.dart`: the existing counter tests, to follow in style.

## From the issue: Verification

- On an Android device or emulator, check that the text "Relevo header" shows at the top of the home screen.

## From the issue: Assumptions

- A1: the home screen has room for one more line of text.
