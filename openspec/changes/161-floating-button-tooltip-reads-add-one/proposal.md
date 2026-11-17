## Why

The floating button on the counter screen has a tooltip that reads "Increment". "Add one" reads more clearly to the person using the screen.

## What Changes

- The tooltip of the floating button on the counter screen reads "Add one" instead of "Increment".
- The checks that read the tooltip expect the new text.
- Nothing else on the screen changes.

## Capabilities

### New Capabilities
- `counter-increment-tooltip`: the text of the tooltip of the floating button on the counter screen.

### Modified Capabilities

None.

## Impact

- `lib/main.dart`: the tooltip text.
- `test/`: a widget test for the tooltip.
