# Proposal

## Why

The person using the app gets a small celebration when the counter reaches twenty-one.

## What Changes

- Show the text "Twenty-one!" under the counter when its value is exactly 21.
- Hide it as soon as the value changes.

## Capabilities

### New Capabilities
- `counter-twenty-one-message`: message shown under the counter only while it reads 21.

### Modified Capabilities

## Impact

- `lib/main.dart` (counter screen) and `test/widget_test.dart`. No new dependencies.

## Out of scope

- Messages for other numbers.
- Any change to the increment button.
