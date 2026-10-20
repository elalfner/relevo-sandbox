## Why

The person using the app should get a small celebration when the counter reaches nineteen.

## What Changes

- Show the text "Nineteen!" under the counter when its value is exactly 19.
- The text disappears as soon as the value changes.

## Capabilities

### New Capabilities
- `counter-milestone`: a message shown under the counter at a special value.

### Modified Capabilities

## Impact

- `lib/main.dart` (counter screen) and a widget test under `test/`. No new dependencies.
