## Why

The person using the app gets a small celebration when the counter reaches twenty-five.

## What Changes

- Show the text "Twenty-five!" under the counter when its value is exactly 25.
- Hide it for every other value, including right after the value changes from 25.

## Capabilities

### New Capabilities
- `counter-milestone`: a message shown under the counter at a milestone value.

### Modified Capabilities

## Impact

- `lib/main.dart` (counter screen) and a widget test under `test/`. No new dependencies.
