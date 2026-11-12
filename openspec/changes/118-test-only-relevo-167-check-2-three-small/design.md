# Design

## Approach

In `lib/main.dart`, `_MyHomePageState` gets three handlers (`_addFive`, `_subtractOne`, `_double`) that call `setState` on `_counter`. Three `TextButton`s with keys `add-five-button`, `subtract-one-button` and `double-button` go in the body column, next to the existing reset button. The greeting and parity text already derive from `_counter` and the clock, so they need no change. No new dependencies.

## Assumptions

- The buttons are text buttons in the existing column, below the parity text, matching the reset button style.
- The counter may go below 0 with "Subtract 1"; the issue sets no floor.
- Keys follow the existing kebab-case style.
