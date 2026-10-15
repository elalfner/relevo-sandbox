# Design

## Approach

In `lib/main.dart`, the `AppBar` title becomes a `Column` (cross-axis start, min main size) holding the existing title `Text` and a version `Text` with `maxLines: 1` and `overflow: TextOverflow.ellipsis`. The version text carries `Key('app-version')` for tests. The version string comes from a single `const` in `lib/main.dart`.

## Dependencies

None added. A plugin such as `package_info_plus` would read the real version, but the issue asks for the fixed text "v1.0.0", so it is not worth a new dependency.

## Assumptions

- The version is the constant "v1.0.0", matching `version: 1.0.0` in `pubspec.yaml`; it is not read at runtime.
- "Very small screen" is tested with a narrow surface (for example 100 logical pixels wide); the check is that no overflow exception is raised and the text uses an ellipsis.
- The subtitle sits below the existing title in the app bar; the title is unchanged.
