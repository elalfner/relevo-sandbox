## Why

The app moves to version label v1.1.0; the subtitle of the app bar and every check that reads it must follow.

## What Changes

- The home screen app bar subtitle shows "v1.1.0" instead of "v1.0.0", followed by the build number as today.
- The checks that read the version label expect "v1.1.0".
- The build number and the `version` of `pubspec.yaml` are not changed.

## Capabilities

### New Capabilities

None.

### Modified Capabilities

- `app-version`: the version label text changes from "v1.0.0" to "v1.1.0".

## Impact

- `lib/main.dart` (constant `appVersion`), `test/build_number_test.dart`, `test/widget_test.dart`.
- No new dependency.
