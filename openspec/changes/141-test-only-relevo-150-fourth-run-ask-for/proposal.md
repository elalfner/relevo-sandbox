## Why

Resetting a large counter by mistake loses the count. The Reset button should ask for confirmation when the counter is 10 or more. (Test issue for relevo#150; same issue as #90.)

## What Changes

- Tapping Reset with a counter of 10 or more opens a dialog that names the count and asks to confirm; the counter is reset only on Confirm.
- Below 10 the counter is reset at once, as today.
- Cancel or dismissing the dialog (back button) leaves the counter unchanged.

Out of scope: any other button of the screen; keeping the counter after the app is closed.

## Capabilities

### New Capabilities

### Modified Capabilities
- `counter-reset`: the Reset button asks for confirmation when the counter is 10 or more.

## Impact

- `lib/main.dart` (Reset button handler), new `lib/widgets/reset_confirm_dialog.dart`, new tests under `test/`. No new dependency.
