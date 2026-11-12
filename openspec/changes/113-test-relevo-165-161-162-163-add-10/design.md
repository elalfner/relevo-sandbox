## Context

`lib/main.dart` holds the home screen with an `_counter` field, a floating button that adds 1 and a Reset button. See proposal.md.

## Goals / Non-Goals

- Goal: one "Add 10" button that adds 10 through the same `setState` path as the other buttons.
- Non-goal: saving the counter, any other button.

## Decisions

- Use a `TextButton` with key `add-ten-button`, next to the Reset button, calling a new `_addTen` method. No new dependency.

## Assumptions

- The button sits in the body column under the even or odd text.
