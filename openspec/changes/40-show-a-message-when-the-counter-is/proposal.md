# Proposal

## Why

The person using the app should get a small celebration when the counter reaches twenty-three.

## What Changes

- Show the text "Twenty-three!" under the counter value while the counter is exactly 23.
- The text disappears as soon as the value changes.

## Capabilities

### New Capabilities
- `counter-message`: a message shown under the counter for the special value 23.

### Modified Capabilities

## Impact

`lib/main.dart` (counter screen) and a widget test under `test/`. No new dependencies.
