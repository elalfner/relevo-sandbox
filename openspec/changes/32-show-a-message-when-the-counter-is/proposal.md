## Why

The counter screen gives no feedback when the user reaches thirteen. The issue asks for a short message at exactly that value.

## What Changes

- Show the text "Thirteen reached" under the parity text when the counter is exactly 13.
- Hide it for every other value, including after reset.

## Capabilities

### New Capabilities
- `counter-thirteen-message`: message shown when the counter is exactly thirteen.

### Modified Capabilities

## Impact

- `lib/main.dart` (counter screen) and `test/widget_test.dart`. No new dependencies.
