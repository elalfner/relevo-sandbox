## Why

A tester needs to see that the counter reached five. Issue #23 asks for a short message under the parity text.

## What Changes

- Show the text "Five reached" under the parity text when the counter is exactly five.

## Capabilities

### New Capabilities
- `counter-milestone`: message shown on the counter screen when the counter reaches five.

### Modified Capabilities

## Impact

- `lib/main.dart` (counter screen) and a widget test under `test/`. No new dependencies.
