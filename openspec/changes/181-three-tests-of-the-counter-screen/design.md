# Design

## Context

The counter screen is `MyHomePage` in `lib/main.dart`. It has keys `app-version`, `reset-button` and `parity-text`, a `+` floating action button, and the constant `appVersion = 'v1.0.1'`. Existing tests (`test/widget_test.dart`, `test/build_number_test.dart`) pump `MyApp()` and use `find.byKey`, `find.byIcon(Icons.add)` and `find.text`. See proposal.md for motivation.

## Goals / Non-Goals

**Goals:**
- Three new test files, one `testWidgets` check each.
- Each check follows the name pattern and helpers of the tests around it: `import 'package:relevo_sandbox/main.dart'`, the `// ignore_for_file: deprecated_member_use` header, `MyApp()` pumped in the test, and the same finders.

**Non-Goals:**
- Any change to app code or to an existing test file.

## Decisions

- Each test is independent and uses no real clock or network: `MyApp(clock: () => DateTime(2026, 1, 1, 9))` is used so the greeting does not depend on real time, and the build number plugin read fails quietly as in the existing tests.
- A local `tapAdd` helper inside each file is allowed, since the existing helper lives inside `widget_test.dart` and cannot be imported.

## Risks / Trade-offs

- Duplicated assertions with existing tests → accepted; the issue asks for these files explicitly.

## Assumptions

- The `+` button is found with `find.byIcon(Icons.add)`, as in the existing tests.
- "Counter shows 0" is checked with `find.text('0')`, as in the existing tests.
## From the issue: Constraints

- C1: no new dependency is added.
- C2: `flutter analyze` and `flutter test` pass, and no `print`, `TODO` or `debugPrint` is left.

## From the issue: Code pointers

- `a`: test/app_version_test.dart
- `b`: test/reset_button_test.dart
- `c`: test/reset_parity_test.dart
