# Proposal

## Why

Issue #29 asks the counter screen to celebrate when the counter reaches exactly eleven.

## What Changes

- Show the text "Eleven reached" under the parity text when the counter is exactly eleven.
- Show nothing extra for any other counter value, including after reset.

## Capabilities

### New Capabilities
- `counter-eleven-message`: message shown under the parity text when the counter is exactly eleven.

### Modified Capabilities

## Impact

- `lib/main.dart` (counter screen) and a widget test under `test/`. No new dependencies.
