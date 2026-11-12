## Why

The home screen gives no hint about what the button does. A short text under the counter tells the user to tap it.

## What Changes

- Show the text "Tap the button to count" under the counter on the home screen.
- The text stays visible after the counter changes.

## Capabilities

### New Capabilities
- `counter-hint`: hint text under the counter explaining how to count.

### Modified Capabilities

## Impact

- `lib/main.dart` (home screen) and a widget test under `test/`. No new dependencies.
- Out of scope: translating the text.
