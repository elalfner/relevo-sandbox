# Proposal

## Why

The counter screen shows a version label, a Reset button and a parity label, but no single test file isolates each of those three behaviours. Three small tests make the checks explicit.

## What Changes

- Add `test/app_version_test.dart`: one check that the version label shows `v1.0.1`.
- Add `test/reset_button_test.dart`: one check that the counter shows 0 after two taps and a tap on Reset.
- Add `test/reset_parity_test.dart`: one check that the parity label reads Even after a tap and a reset.
- No app code and no existing test file changes.

## Capabilities

### New Capabilities

None.

### Modified Capabilities

None. The behaviours are already specified (`app-version`, `counter-reset`, `counter-parity`); only tests are added, so the change sets `skip_specs: true`.

## Impact

Three new files under `test/`. No dependency is added. No app behaviour changes.
