# Proposal

## Why

The home screen gives no cue about how to use the counter. A short hint under the counter tells the user to tap the button.

## What Changes

- Show the text "Tap the button to count" under the counter on the home screen.
- The text stays visible when the counter changes.

## Capabilities

### New Capabilities
- `home-hint`: hint text shown under the counter on the home screen.

### Modified Capabilities

## Impact

`lib/main.dart` (home screen) and a widget test under `test/`. No new dependencies. Translating the text is out of scope.
