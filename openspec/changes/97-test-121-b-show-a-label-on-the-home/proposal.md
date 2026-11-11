## Why

The home screen should show a fixed label "Relevo 121 B" so the Relevo workflow can be tested end to end (issue #97).

## What Changes

- The home screen shows the text "Relevo 121 B" below the counter.
- The label does not change when the counter changes or is reset.

## Capabilities

### New Capabilities
- `home-label`: the home screen shows a fixed label below the counter.

### Modified Capabilities

## Impact

- `lib/main.dart` (`MyHomePage`) and `test/widget_test.dart`. No new dependencies.
