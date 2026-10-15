# Relevo sandbox

A minimal counter app used to test the Relevo workflow end to end.

## Language

**Greeting**:
The phrase shown at the top of the home screen that welcomes the user according to the time of day.
_Avoid_: Salutation, welcome message, hello text

**Time slot**:
One of the three parts of the day (morning, afternoon, evening) that decide which greeting is shown.
_Avoid_: Period, daypart, franja

**Build number**:
The number after the `+` in the `version` of `pubspec.yaml`, shown in the app bar subtitle as "Build N" next to the version label.
_Avoid_: Build label, build, build version

**Version label**:
The text "v1.0.0" shown in the app bar subtitle. It is written in the app, not read from `pubspec.yaml`, so it can differ from the pubspec version.
_Avoid_: App version, version number
