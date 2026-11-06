# Proposal

## Why

A double-digit count should stand out on the home screen.

## What Changes

- The counter number is shown in bold when it is 10 or more, and in normal weight below 10.
- Reset brings the number back to normal weight.

## Capabilities

### New Capabilities
- `counter-emphasis`: the weight of the counter number follows its value.

### Modified Capabilities

## Impact

`lib/main.dart` (home screen) and a widget test under `test/`. No new dependency.

## Out of scope

- Any other style of the counter, such as color or size.
- Keeping the counter after the app is closed.
