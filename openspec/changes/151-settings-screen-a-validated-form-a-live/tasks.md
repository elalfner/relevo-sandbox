# Tasks

## 1. Validation and state

- [x] 1.1 Add `lib/models/settings_validation.dart` with the name, email and age validators and message constants; verify with `test/settings_validation_test.dart` covering 1/2/30/31 characters, spaces only, the email examples, 254/255 characters, and ages 12/13/120/121/"abc"/"30.5"
- [x] 1.2 Add `lib/state/settings_controller.dart` (saved values, theme mode, notifications, save, dirty check, trimming); verify with `test/settings_controller_test.dart` (defaults, save trims "  Ana  ", clean again after reverting a value, theme is independent of saved values)

## 2. Settings screen

- [ ] 2.1 Add `lib/screens/settings_screen.dart` and helper widgets under `lib/widgets/` (form fields, theme chooser, discard dialog) with the initial state, error messages on leaving a field, and Save enabled only for a valid changed form; verify with widget tests in `test/settings_screen_test.dart` for the initial state, each error message and Save enabled/disabled
- [ ] 2.2 Add save (snackbar "Settings saved", Save disabled, screen stays) and the back handling for system back and app bar arrow ("Discard your changes?", Keep editing, Discard, no dialog when clean or saved); verify with widget tests for each case
- [ ] 2.3 Add semantics labels for every field, the switch, the theme options and the buttons, and announce errors; verify with a widget test using the semantics tree

## 3. App wiring

- [ ] 3.1 Make `MyApp` own the `SettingsController` and apply `themeMode` with light and dark themes at once; add the Settings button to the home screen; verify with a widget test that choosing Dark makes both screens dark before Save, System follows the phone, and discarding keeps the theme
- [ ] 3.2 Show the saved name in the greeting after a comma without changing `greetingForHour` or the fixed time slot; verify with widget tests ("Good morning, Ana" at 09:00, "Good morning" without a name, the 05:00/12:00/18:00 limits) and that `test/greeting_test.dart` and `test/widget_test.dart` pass unchanged

## 4. Documentation and checks

- [ ] 4.1 Write the documentation from the issue exactly as given: add the entries Display name, Theme mode and Unsaved changes to `GLOSSARY.md` after the existing ones; verify the file shows them and nothing else changed
- [ ] 4.2 Run `flutter analyze` and `flutter test`; verify both pass and no `print`, `TODO` or `debugPrint` remains
