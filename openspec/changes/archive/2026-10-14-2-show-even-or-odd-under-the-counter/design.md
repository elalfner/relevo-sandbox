# Design

## Context

`lib/main.dart` holds a single `_MyHomePageState` with an `int _counter`, and a reset button below the counter text. See proposal.md for motivation.

## Goals / Non-Goals

**Goals:**
- Show "Even" or "Odd" derived from `_counter` on every build.

**Non-Goals:**
- Colours or animation for the parity text (out of scope in the issue).

## Decisions

- Derive the text in `build` from `_counter.isEven`; no new state, so it cannot go out of sync with the counter or the reset.
- Place the text in the existing `Column`, directly after the counter text and before the reset button.
- No new dependencies.

## Assumptions

- "Below the counter" means directly under the counter number, above the reset button.
- The text uses the default text style.
