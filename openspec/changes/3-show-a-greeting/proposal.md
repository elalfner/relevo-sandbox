# Proposal

## Why

The app opens straight onto a counter. A greeting that matches the time of day makes the app feel friendlier when it opens (issue #3).

## What Changes

- Show a greeting at the top of the home screen: "Good morning", "Good afternoon" or "Good evening", chosen once from the phone's local time when the screen is created.
- Make the body of the home screen scrollable so nothing is cut off with large text or in landscape.

## Capabilities

### New Capabilities
- `home-greeting`: time-of-day greeting shown at the top of the home screen.

### Modified Capabilities

## Impact

- `lib/main.dart` home screen body; new widget tests under `test/`. No new dependencies.
