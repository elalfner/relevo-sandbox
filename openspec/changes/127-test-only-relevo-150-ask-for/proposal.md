## Why

Resetting a large counter by mistake loses the count. The Reset button should ask for confirmation when the counter is 10 or more.

## What Changes

- Tapping Reset with a counter of 10 or more opens a dialog that names the count and asks to confirm; the counter is reset only on Confirm.
- Below 10 the counter is reset at once, as today.

## Capabilities

### New Capabilities
- `counter-reset`: how the Reset button of the home screen resets the counter, including the confirmation for large counts.

### Modified Capabilities

## Impact

- `lib/main.dart` (Reset button handler), new `lib/widgets/reset_confirm_dialog.dart`, new tests under `test/`. No new dependency.

## Out of scope

- Any other button of the screen.
- Keeping the counter after the app is closed.
