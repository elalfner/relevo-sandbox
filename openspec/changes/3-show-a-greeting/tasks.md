# Tasks

## 1. Greeting

- [x] 1.1 Add the time-of-day greeting (hour 5-11 morning, 12-17 afternoon, else evening), chosen once in the home screen state from an injectable clock; verify with widget tests for morning, afternoon, evening and the edge times 00:00, 04:59, 05:00, 11:59, 12:00, 17:59, 18:00
- [x] 1.2 Place the greeting centred at the top of the body above "You have pushed the button this many times:" using the headline medium style with no overrides; verify with a widget test comparing vertical positions and the style
- [x] 1.3 Verify with widget tests that tapping increment and reset leaves the greeting unchanged and visible, and that the greeting does not change when the clock changes while the screen stays open

## 2. Layout

- [x] 2.1 Make the body scrollable; verify with widget tests at a large text scale and in landscape size that there is no overflow, the greeting is visible and the rest of the screen can be scrolled to

## 3. Checks

- [x] 3.1 Run `flutter analyze` and `flutter test` and verify both pass with no `print`, `TODO` or `debugPrint` left
