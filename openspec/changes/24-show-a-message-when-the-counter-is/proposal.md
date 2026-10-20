## Why

The counter screen gives no feedback when the count reaches seven. Issue #24 asks for a short message at exactly that value.

## What Changes

- Show the text "Seven reached" under the parity text when the counter is exactly seven.
- Hide it for every other value, including after reset.

## Capabilities

### New Capabilities
- `counter-seven-message`: message shown on the counter screen when the count is exactly seven.

### Modified Capabilities

## Impact

- `lib/main.dart`: one conditional text under the parity text.
- `test/`: widget tests for the new behaviour.
- No new dependencies.
