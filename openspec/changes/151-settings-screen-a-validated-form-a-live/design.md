# Design

## Context

`lib/main.dart` holds `MyApp` (MaterialApp with a fixed light theme) and `MyHomePage`, which computes the greeting once in `initState` with `greetingForHour`. The Tasks screen shows the existing pattern: a controller owned by the home page and passed down. See proposal.md.

## Goals / Non-Goals

**Goals:**
- One in-memory source for saved settings and the theme, read by the greeting and by `MaterialApp`.
- Validation rules testable without widgets.

**Non-Goals:**
- Persistence, real notifications, sending the email.

## Decisions

- `SettingsController` (a `ChangeNotifier`) is created in `MyApp`'s state, disposed there, and passed to `MyHomePage` and `SettingsScreen`. `MyApp` becomes stateful and uses `ListenableBuilder` to set `themeMode`, with `theme` (light) and `darkTheme` from the same seed colour.
- The greeting keeps its time slot computed once; the name is read from the controller through a `ListenableBuilder`, so `greetingForHour` is unchanged.
- The form keeps the last saved values in the controller and compares the trimmed field values with them to know if it is clean.
- Back is intercepted with `PopScope`; the app bar back arrow goes through the same path.
- Email check: a simple pattern (`local@domain.tld`, allowing `+`), length at most 254.

## Risks / Trade-offs

- `MyApp` gaining state could break existing tests that build it with only `clock` → keep the `clock` parameter and its default.

## Assumptions

- The saved name displayed in the greeting is the trimmed value.
- An empty Name, Email or Age is invalid (shows the same error), but the errors appear only after the person leaves the field.
- The theme options are labelled "System", "Light" and "Dark".
- Email is trimmed before validation and saving.
## From the issue: Decisions

### D1. The settings are one object with a notifier
Decided: the saved values and the theme are held by a `SettingsController` (a `ChangeNotifier`) in `lib/state/settings_controller.dart`, created in `MyApp` and passed down; `MyApp` listens to it for the theme.
Why: the greeting and the app theme read the same source and the form can be tested without a widget.
Discarded: global variables, and one notifier per field.

### D2. The validation rules are plain functions
Decided: the validators of name, email and age are functions in `lib/models/settings_validation.dart`, with the messages as constants.
Why: the boundaries (2 and 30 characters, 13 and 120 years, 254 and 255 characters) are tested with unit tests, and the form only shows their result.
Discarded: writing the rules inside the `validator` callbacks of the fields.

### D3. The screen is one file
Decided: the screen is `lib/screens/settings_screen.dart`; the form helpers that would make it long are widgets of `lib/widgets/`.
Why: the project rules ask for one screen per file and small widgets.
Discarded: putting the dialog and the theme chooser inside the screen file.

## From the issue: Constraints

- C1: no new dependency is added to `pubspec.yaml`.
- C2: a widget test covers each scenario, and unit tests cover each boundary of D2.
- C3: every field, the switch, the theme options and the buttons have a semantics label, and the error texts are announced.
- C4: `flutter analyze` and `flutter test` pass, the existing greeting and counter tests still pass without changes, and no `print`, `TODO` or `debugPrint` is left.

## From the issue: Code pointers

- `lib/main.dart`: `MyApp` (where the theme is applied) and `MyHomePage` (where the Settings button is added and the greeting is shown); the function `greetingForHour` is not changed.
- `GLOSSARY.md`: the new terms are added to it.
- `test/greeting_test.dart`: the existing greeting tests, which must keep passing.

## From the issue: Verification

- On an Android device or emulator, fill the form with invalid and valid values and check each message, save, go back and see the greeting with the name, change the theme and check that both screens change, and press back with unsaved changes.

## Documentation from the issue


- Add these entries to `GLOSSARY.md`, under its existing heading, after the existing ones, exactly as written. They are vocabulary only; nothing else in that file changes.

**Display name**:
The name the person writes in Settings, of 2 to 30 characters, which the greeting shows after a comma.
_Avoid_: Username, nickname, profile name

**Theme mode**:
The choice of System, Light or Dark that decides the colours of the whole app; it applies at once and is not part of the form.
_Avoid_: Skin, colour scheme, dark mode switch

**Unsaved changes**:
The state of the Settings form when a value differs from the last saved one; it enables Save and makes back ask for confirmation.
_Avoid_: Dirty form, pending edits

