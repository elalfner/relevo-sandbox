# Design

## Approach

In `lib/main.dart`, the version `Text` in the app bar `Column` becomes a `Row` holding the unchanged version `Text` (key `app-version`) and, when a build number is available, a gap and a second `Text` "Build N" with key `app-build`. Both are wrapped in `Flexible`, with `maxLines: 1`, `TextOverflow.ellipsis` and font size 12, so each truncates on its own.

`_MyHomePageState` starts a `PackageInfo.fromPlatform()` future in `initState` and stores `buildNumber` with `setState` when it resolves. Any error, or an empty value, leaves it null so nothing is shown. The call is wrapped in try/catch so a missing plugin (existing tests) cannot crash or fail them. Tests use `PackageInfo.setMockInitialValues`.

## Dependencies

`package_info_plus`: the issue requires reading the build number from the platform (`PackageInfo.fromPlatform().buildNumber`) rather than writing it in code. Its transitive packages are accepted by the issue.

## Assumptions

- A mounted check guards `setState` after the future resolves.
- The gap between the two texts is 8 logical pixels.
- Whitespace-only values are treated as shown (only an empty string counts as unreadable).
- Existing tests that do not mock the plugin may see the call fail or never resolve; either way no build text appears.

## Documentation from the issue

- Add these two entries to `GLOSSARY.md`, under "Language", after the existing ones and exactly as written. They are vocabulary only, with no implementation details, and nothing else in that file changes.

```markdown
**Build number**:
The number after the `+` in the `version` of `pubspec.yaml`, shown in the app bar subtitle as "Build N" next to the version label.
_Avoid_: Build label, build, build version

**Version label**:
The text "v1.0.0" shown in the app bar subtitle. It is written in the app, not read from `pubspec.yaml`, so it can differ from the pubspec version.
_Avoid_: App version, version number
```
