# Proposal

## Why

The greeting test checks the edges of the morning window (05:00, 11:59) but not its middle. A case at 06:00 gives the window a check inside it.

## What Changes

- Add one case, "morning at 06:00", to the table of the group "Greeting by time of day" in `test/greeting_test.dart`.
- No app code changes and no other test file changes.

## Capabilities

### New Capabilities

### Modified Capabilities
- `home-greeting`: adds a scenario for the greeting at 06:00; the behaviour itself does not change.

## Impact

- `test/greeting_test.dart` only. No new dependency.
