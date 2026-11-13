## Why

The home screen has an "Add 10" button; people also want smaller quick steps. This is a test issue for relevo#172 (three independent small buttons built in three groups).

## What Changes

- Add three buttons on the home screen: "Add 5", "Add 7" and "Add 9", each adding its number to the counter.

## Capabilities

### New Capabilities
- `counter-add-buttons`: quick buttons that add a fixed number to the counter.

### Modified Capabilities

## Impact

- `lib/main.dart` (home screen) and new widget tests under `test/`.
- No new dependencies.
