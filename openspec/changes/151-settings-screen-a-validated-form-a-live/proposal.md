# Proposal

## Why

The app has no place for the person to say who they are or how the app should look. A Settings screen gives the home greeting a name and lets the person choose the theme.

## What Changes

- A Settings button on the home screen opens a new Settings screen with a form: display name, email, age, a notifications switch and a theme choice (System, Light, Dark).
- Name, email and age are validated; Save is enabled only when all are valid and something changed.
- Leaving with unsaved changes asks for confirmation.
- The theme applies to the whole app at once, before Save.
- The greeting on the home screen appends the saved display name after a comma.
- Nothing is persisted when the app closes.

## Capabilities

### New Capabilities
- `settings`: the Settings form, its validation, save and discard behaviour, and the live theme.

### Modified Capabilities
- `home-greeting`: the greeting shows the saved display name, and the "fixed once chosen" rule allows the name to change.

## Impact

- `lib/main.dart` (theme, Settings button, greeting), new `lib/screens/settings_screen.dart`, `lib/state/settings_controller.dart`, `lib/models/settings_validation.dart`, widgets under `lib/widgets/`, tests under `test/`, and `GLOSSARY.md`.
- No new dependencies.
