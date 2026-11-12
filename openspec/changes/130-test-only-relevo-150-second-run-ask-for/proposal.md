# Proposal

## Why

Resetting a large counter by mistake loses the count. A confirmation step for large counters prevents that.

## What Changes

- Tapping Reset with a counter of 10 or more opens a dialog that names the count and asks to confirm; the counter is reset only on Confirm.
- Below 10 the counter is reset at once, as today.
- Cancel or the back button closes the dialog and keeps the counter.

Out of scope: any other button of the screen; keeping the counter after the app is closed.

## Capabilities

### New Capabilities

### Modified Capabilities
- `counter-reset`: Reset asks for confirmation when the counter is 10 or more (the "very large counter" scenario now goes through the dialog).

## Impact

- `lib/main.dart` (Reset button handler), new `lib/widgets/reset_confirm_dialog.dart`.
- Tests: `test/widget_test.dart` (the over-1000 reset test), new `test/widgets/reset_confirm_dialog_test.dart`.
- No new dependency.
