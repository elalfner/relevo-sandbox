# Proposal

## Why

The floating button has the tooltip "Increment", but no check covers it.

## What Changes

- Add `test/tooltip_test.dart` with one check that finds the tooltip "Increment" on the floating button.
- The app code and every other test file stay unchanged.

## Capabilities

### New Capabilities
- `floating-button-tooltip`: the floating button of the home screen shows the tooltip "Increment".

### Modified Capabilities

## Impact

Only `test/tooltip_test.dart` is added. No app code, no dependency.
