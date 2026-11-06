# Proposal

## Why

The Reset button discards the counter value with no trace. The person wants to see the values they reset away from during the session.

## What Changes

- Keep the value the counter had at each Reset (except at 0), newest first, up to 20, in memory.
- Add a History button to the app bar of the home screen that opens a new History screen.
- The History screen lists the values as "Reset at <value>", shows "No resets yet" when empty, and offers "Clear history" when there is at least one value.

## Capabilities

### New Capabilities
- `reset-history`: the in-memory list of values at each Reset and the History screen that shows and clears it.

### Modified Capabilities

## Impact

- `lib/main.dart` (reset logic, app bar button), new `lib/screens/history_screen.dart`, tests under `test/`, `GLOSSARY.md`. No new dependencies.
