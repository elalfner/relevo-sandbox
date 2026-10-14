## Why

Users can only increase the counter. They need a way to start counting again from zero without restarting the app.

## What Changes

- Add a "Reset" text button below the counter text on the counter screen.
- Tapping it sets the counter to 0.

## Capabilities

### New Capabilities
- `counter-reset`: resetting the counter to zero from the counter screen.

### Modified Capabilities

## Impact

- `lib/main.dart` (counter screen) and `test/widget_test.dart`.
- No new dependencies. Persisting the counter between launches is out of scope.
