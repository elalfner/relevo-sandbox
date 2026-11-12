# Proposal

## Why

The home screen gives no cue about how to use the counter. A short hint under the counter tells the user what the button does.

## What Changes

- Show the text "Tap the button to count" under the counter on the home screen.
- The text stays visible when the counter changes.

## Capabilities

### New Capabilities
- `home-hint`: A hint text shown under the counter on the home screen.

### Modified Capabilities

## Impact

- `lib/main.dart`: the home screen shows one more text under the counter.
- `test/`: a widget test for the hint.
- Out of scope: translating the text.
