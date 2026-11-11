## Why

The home screen has no footer. Test issue #93 (for relevo#130) asks for a short footer text at the bottom.

## What Changes

- The home screen shows the text "Relevo test" at the bottom.

## Capabilities

### New Capabilities
- `home-footer`: a fixed footer text at the bottom of the home screen.

### Modified Capabilities

## Impact

- `lib/main.dart` (`MyHomePage`) and `test/widget_test.dart`. No new dependency.

## Out of scope

- Any other text, color or style of the screen.
- Keeping any state after the app is closed.
