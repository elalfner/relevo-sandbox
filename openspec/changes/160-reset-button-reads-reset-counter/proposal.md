## Why

The Reset button on the counter screen reads "Reset", which is terse. Reading "Reset counter" makes the screen clearer.

## What Changes

- The label of the Reset button on the counter screen changes from "Reset" to "Reset counter".
- The widget checks that read the old label expect the new text.

## Capabilities

### New Capabilities

None.

### Modified Capabilities

- `counter-reset`: the Reset button label reads "Reset counter".

## Impact

- `lib/main.dart`: the label text of the reset button.
- `test/widget_test.dart`: the check that reads the label.
- No new dependency. Any other text of the counter screen is out of scope.
