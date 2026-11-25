## Why

The counter screen's parity label, caption, floating button tooltip and tap count are only partly covered by tests. Four small test files make that behaviour explicit and run it as separate checks.

## What Changes

- Add `test/even_odd_test.dart`: the label reads Even at 0, Odd at 1 and Even at 2.
- Add `test/caption_test.dart`: the caption is shown at the start and after a tap.
- Add `test/tooltip_test.dart`: the floating button has the tooltip "Increment".
- Add `test/three_taps_test.dart`: the counter shows 3 after three taps.
- No change to app code or to any existing test file.

## Capabilities

### New Capabilities
- `counter-screen-tests`: checks that guard the visible behaviour of the counter screen.

### Modified Capabilities

## Impact

- Only four new files under `test/`. No dependency is added.
