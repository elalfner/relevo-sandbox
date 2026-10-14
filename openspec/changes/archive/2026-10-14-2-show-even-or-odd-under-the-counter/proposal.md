# Proposal

## Why

The counter screen only shows a number. Showing whether it is even or odd gives the user more feedback.

## What Changes

- Show the text "Even" or "Odd" below the counter, according to the current count.

## Capabilities

### New Capabilities
- `counter-parity`: the parity text shown below the counter.

### Modified Capabilities

## Impact

- `lib/main.dart`: one extra text widget on the counter screen.
- `test/widget_test.dart`: widget tests for the new text.
- Depends on #1 (reset button), already merged in `dev`.
