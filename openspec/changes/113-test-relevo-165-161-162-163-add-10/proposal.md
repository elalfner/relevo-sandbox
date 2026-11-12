## Why

A person should be able to raise the counter by 10 in one tap instead of ten taps.

## What Changes

- Add a button labelled "Add 10" to the home screen that adds 10 to the counter.
- The greeting and the even or odd text keep working after the button is used.

## Capabilities

### New Capabilities
- `counter-add-ten`: the home screen button that adds 10 to the counter.

### Modified Capabilities

## Impact

- `lib/main.dart` (home screen) and a widget test under `test/`. No new dependencies.
