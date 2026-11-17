# Proposal

## Why

The line above the counter reads "You have pushed the button this many times:", which is long. A shorter caption makes the screen read more clearly.

## What Changes

- The line above the counter on the counter screen reads "Times pressed:".
- The checks and the greeting requirement that name the old text are updated to the new text.

## Capabilities

### New Capabilities
- `counter-caption`: the caption shown above the counter value on the counter screen.

### Modified Capabilities
- `home-greeting`: the greeting position requirement names the caption it sits above, which is now "Times pressed:".

## Impact

- `lib/main.dart`: the caption text.
- `test/greeting_test.dart` and `test/widget_test.dart`: the checks that read the caption.
- No new dependency. Any other text of the counter screen is out of scope.
