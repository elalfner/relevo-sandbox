# Proposal

## Why

The home screen needs a header text at the top. Test issue #94 (part of relevo#130) asks for a small, visible change.

## What Changes

- Show the text "Relevo header" at the top of the home screen body, above the counter.
- The text does not change when the counter changes or is reset.

## Capabilities

### New Capabilities
- `home-header`: the home screen shows a fixed header text above the counter.

## Impact

- `lib/main.dart` (`MyHomePage`) and a widget test under `test/`. No new dependency.

## Out of scope

- Any other text, color or style of the screen.
- Keeping any state after the app is closed.
