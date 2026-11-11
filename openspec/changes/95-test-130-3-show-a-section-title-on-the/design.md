# Design

## Context

`MyHomePage` in `lib/main.dart` builds a `Column` with the greeting, the counter, the parity text and the reset button. See proposal.md for motivation.

## Goals / Non-Goals

**Goals:** show "Relevo section" below the counter.

**Non-Goals:** any other text, color or style; persisting state.

## Decisions

- Add one `Text('Relevo section')` with a key `section-title` to the existing `Column`, right after the counter text. No new widget or file.

## Risks / Trade-offs

- The Column is inside a `SingleChildScrollView`, so one more line cannot overflow.

## Assumptions

- The home screen has room for one more line of text (A1 of the issue).
- The text is placed directly after the counter text, before the parity text.
## From the issue: Decisions

### D1. The section title lives in the home screen
Decided: the section title is a `Text` in the home screen, `lib/main.dart`.
Why: it is one line and needs no widget of its own.
Discarded: a separate widget file.

## From the issue: Constraints

- C1: the change lives in `lib/main.dart`.
- C2: a widget test under `test/` covers the section text, also after the counter changes.
- C3: no new dependency is added.

## From the issue: Code pointers

- `lib/main.dart`: `MyHomePage`.
- `test/widget_test.dart`: the existing counter tests, to follow in style.

## From the issue: Verification

- On an Android device or emulator, check that the text "Relevo section" shows below the counter on the home screen.

## From the issue: Assumptions

- A1: the home screen has room for one more line of text.
