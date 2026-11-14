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

**Task**:
One line of the to-do list, with a title of up to 60 characters, a priority and a done or open state.
_Avoid_: Todo, item, entry

**Task filter**:
One of the three views of the list (All, Open, Done) that decide which tasks are shown.
_Avoid_: Tab, view, category

**Priority**:
One of High, Medium or Low, chosen when a task is added; it decides the order when the list is sorted by priority.
_Avoid_: Importance, urgency, level

**Display name**:
The name the person writes in Settings, of 2 to 30 characters, which the greeting shows after a comma.
_Avoid_: Username, nickname, profile name

**Theme mode**:
The choice of System, Light or Dark that decides the colours of the whole app; it applies at once and is not part of the form.
_Avoid_: Skin, colour scheme, dark mode switch

**Unsaved changes**:
The state of the Settings form when a value differs from the last saved one; it enables Save and makes back ask for confirmation.
_Avoid_: Dirty form, pending edits
