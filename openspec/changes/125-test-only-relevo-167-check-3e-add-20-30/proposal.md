## Why

The home screen has an "Add 10" button. People want the same one-tap shortcut for bigger steps.

## What Changes

- Add three buttons to the home screen: "Add 20", "Add 30" and "Add 40".
- Each adds its number to the counter, exactly like "Add 10".

## Capabilities

### New Capabilities
- `counter-quick-add`: buttons that add a fixed amount to the counter.

### Modified Capabilities

## Impact

- `lib/main.dart` (home screen) and `test/widget_test.dart`.
- No new dependencies.

Out of scope: saving the counter between sessions; any other button.
