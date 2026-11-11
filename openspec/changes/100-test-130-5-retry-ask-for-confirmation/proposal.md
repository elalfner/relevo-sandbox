## Why

Resetting a large counter by mistake loses the count. The Reset button should ask for confirmation when the counter is 10 or more.

## What Changes

- Tapping Reset with a counter of 10 or more opens a dialog that names the count and asks to confirm; the counter is reset only on Confirm.
- Below 10 the counter is reset at once, as today.
- The dialog is its own widget, `ResetConfirmDialog`, with its own widget test.

## Capabilities

### New Capabilities

### Modified Capabilities

- `counter-reset`: the Reset button asks for confirmation when the counter is 10 or more.

## Impact

- `lib/main.dart` (the Reset button of `MyHomePage`), new `lib/widgets/reset_confirm_dialog.dart`.
- Tests: `test/widget_test.dart` (existing reset tests with a counter of 10 or more), new `test/widgets/reset_confirm_dialog_test.dart`.
- No new dependency.

Out of scope: any other button of the screen; keeping the counter after the app is closed.
