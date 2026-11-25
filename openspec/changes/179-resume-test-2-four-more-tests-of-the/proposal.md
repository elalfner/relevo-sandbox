# Proposal

## Why

The counter screen shows an Even/Odd label, a caption and a floating button with a tooltip, but no dedicated check pins the label at 0, 1 and 2, the caption before and after a tap, the "Increment" tooltip, or the number after three taps. The issue adds four small test files for them.

## What Changes

- Add `test/even_odd_test.dart`: the label reads Even at 0, Odd at 1 and Even at 2.
- Add `test/caption_test.dart`: the caption "You have pushed the button this many times:" is shown at the start and after a tap.
- Add `test/tooltip_test.dart`: one check that finds the tooltip "Increment" on the floating button.
- Add `test/three_taps_test.dart`: one check that the counter shows 3 after three taps.
- The app code and every existing test file stay unchanged.

## Capabilities

### New Capabilities
- `counter-screen-checks`: the extra checks of the counter screen run together with the existing suite, pass, and do not depend on real time or on the network.

### Modified Capabilities

## Impact

Only four new files under `test/`. No app code, no existing test and no dependency changes.
