## Why

The counter screen should acknowledge when the user reaches exactly fifteen. The issue is also used to check that a cloud run stays paused while `RELEVO_CLOUD_GO` is `off`.

## What Changes

- Show the text "Fifteen reached" under the parity text when the counter is exactly 15.
- Show nothing extra for any other value, including after reset.

## Capabilities

### New Capabilities

### Modified Capabilities
- `counter-parity`: adds a message under the parity text when the counter is exactly fifteen.

## Impact

- `lib/main.dart` (counter screen) and a widget test in `test/`.
- No new dependencies.
