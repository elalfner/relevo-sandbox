# Design

## Context

The home screen is `MyHomePage` in `lib/main.dart`. Its body is a `Column` with the greeting, a label, the counter, the parity text and a reset button. See proposal.md for motivation.

## Goals / Non-Goals

**Goals:**
- Show the hint under the counter with a stable key so a widget test can find it.

**Non-Goals:**
- Translating the text.

## Decisions

- Add a `Text('Tap the button to count', key: Key('counter-hint'))` right after the counter `Text` in the existing `Column`. It is static, so it does not depend on the counter state.

## Assumptions

- "Under the counter" means directly below the counter number, above the parity text.
- The text is not translated (out of scope), so it is a plain English string.
