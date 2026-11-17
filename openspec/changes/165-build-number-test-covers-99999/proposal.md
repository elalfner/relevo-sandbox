## Why

The build number test has no check for a five-digit build number. One more check pins that build 99999 is shown right after the version.

## What Changes

- `test/build_number_test.dart` gets one new check that shows build 99999 after the version.
- The app code and every other test file stay unchanged.

## Capabilities

### New Capabilities

### Modified Capabilities

- `app-version`: the build number scenarios gain one for build 99999 (test only, no behaviour change).

## Impact

- Only `test/build_number_test.dart` changes. No new dependency.
