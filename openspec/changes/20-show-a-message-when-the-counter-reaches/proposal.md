## Why

A tester cannot tell at a glance that the counter passed the ten milestone. A short message under the parity text makes it visible.

## What Changes

- Show the text "Ten reached" under the parity text when the counter is ten or more.
- Hide it when the counter is nine or less, including after reset.

## Capabilities

### New Capabilities
- `ten-message`: message shown on the counter screen once the counter reaches ten.

### Modified Capabilities

## Impact

- `lib/main.dart` (counter screen) and a new widget test. No new dependency.
