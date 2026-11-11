# Proposal

## Why

The home screen needs a section title below the counter (test #130, part 3).

## What Changes

- The home screen shows the text "Relevo section" below the counter.
- The text does not change when the counter changes or is reset.

## Capabilities

### New Capabilities
- `home-section-title`: the home screen shows a fixed section title below the counter.

### Modified Capabilities

## Impact

- `lib/main.dart` (`MyHomePage`) and a widget test under `test/`. No new dependencies.

## Out of scope

- Any other text, color or style of the screen.
- Keeping any state after the app is closed.
