## Why

A tester cannot tell which build they are looking at. The counter screen shows the version label only.

## What Changes

- Show the build number ("Build N") right after the version label in the app bar subtitle.
- The build number is read from the `version` in `pubspec.yaml` (the part after the `+`) through the platform, never typed in the code.
- While it loads, or if it cannot be read or is empty, nothing is shown in its place.
- Add the `package_info_plus` dependency.
- Add two entries to `GLOSSARY.md`.

## Capabilities

### New Capabilities

None.

### Modified Capabilities

- `app-version`: the subtitle also shows the build number next to the version label.

## Impact

- `lib/main.dart` (subtitle row), `pubspec.yaml` (new dependency), `GLOSSARY.md`, tests under `test/`.
- Out of scope: making the version label "v1.0.0" come from `pubspec.yaml`.
