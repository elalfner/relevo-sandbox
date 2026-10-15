## 1. Dependency

- [ ] 1.1 Add `package_info_plus` to `pubspec.yaml` and run `flutter pub get`

## 2. Implementation

- [ ] 2.1 Load the build number in `lib/main.dart` with `PackageInfo.fromPlatform()`, treating errors and empty values as unreadable
- [ ] 2.2 Show the version label and "Build N" (key `app-build`) in one row, each `Flexible` with one line and ellipsis, size 12, nothing shown while loading or unreadable

## 3. Tests

- [ ] 3.1 Widget test: build number 1 shows "v1.0.0" and "Build 1" on the same line, version first
- [ ] 3.2 Widget test: build number 42 shows "Build 42"
- [ ] 3.3 Widget test: before loading only "v1.0.0" is shown, then the build appears
- [ ] 3.4 Widget test: very small screen, no overflow, both texts ellipsized
- [ ] 3.5 Widget test: unreadable and empty build numbers show only the version label, no error
- [ ] 3.6 Widget test: "0" and a long value are shown as received

## 4. Documentation

- [ ] 4.1 Write the documentation exactly as given in design.md ("Documentation from the issue") into `GLOSSARY.md`

## 5. Checks

- [ ] 5.1 `flutter analyze` and `flutter test` pass
