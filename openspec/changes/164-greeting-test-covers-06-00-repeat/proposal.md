## Why

The greeting test checks the edges of the morning window but has no case in the middle of it. A case at 06:00 shows the greeting is "Good morning" inside the window, not only at its edges.

## What Changes

- `test/greeting_test.dart` gets one more case, "morning at 06:00", that expects "Good morning".
- The app code and every other test file stay unchanged.

## Capabilities

### New Capabilities

### Modified Capabilities

- `home-greeting`: adds a requirement that the test suite covers 06:00 (behaviour of the app itself does not change).

## Impact

- `test/greeting_test.dart` only. No new dependency, no app code change.
