# Proposal

## Why

The counter screen shows an Even/Odd label, a caption, a tooltip on the floating button and a counter number, but these behaviours are only partly covered. Four small test files make that behaviour explicit and keep it from regressing.

## What Changes

- Add `test/even_odd_test.dart`: the label reads Even at 0, Odd at 1 and Even at 2.
- Add `test/caption_test.dart`: the caption "You have pushed the button this many times:" is shown at the start and after a tap.
- Add `test/tooltip_test.dart`: the floating button has the tooltip "Increment".
- Add `test/three_taps_test.dart`: the counter shows 3 after three taps.
- No app code and no existing test file changes.

## Capabilities

### New Capabilities
- `counter-screen-tests`: observable behaviour of the counter screen that the four new test files check.

### Modified Capabilities

## Impact

Only four new files under `test/`. No dependency is added and no app code changes.
