# Proposal

## Why

The home screen gives no guidance on what the button does. A short hint under the counter tells the user to tap it.

## What Changes

- Show the text "Tap the button to count" under the counter on the home screen.
- The text stays visible when the counter changes.

## Capabilities

### New Capabilities
- `home-hint`: hint text shown under the counter on the home screen.

### Modified Capabilities

## Impact

- `lib/main.dart` (home screen) and a widget test under `test/`. No new dependencies.
