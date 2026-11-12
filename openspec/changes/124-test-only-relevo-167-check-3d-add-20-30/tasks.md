# Tasks

## Replication recipe

- Template: `pattern`

## 1. Add 20 button

- [x] 1.1 [replica] Add 20 button, with its widget test; verify with `flutter test test/add_twenty_test.dart`
  - Rename: Add 10 -> Add 20, add-ten-button -> add-twenty-button, _addTen -> _addTwenty, adds 10 -> adds 20, add_ten -> add_twenty, addTen -> addTwenty, += 10 -> += 20, '10' -> '20', '13' -> '23'
  - Differences: the existing Add 10 button stays in lib/main.dart; the new button goes below it; the test goes in a new file test/add_twenty_test.dart

## 2. Add 30 button

- [x] 2.1 [replica] Add 30 button, with its widget test; verify with `flutter test test/add_thirty_test.dart`
  - Rename: Add 10 -> Add 30, add-ten-button -> add-thirty-button, _addTen -> _addThirty, adds 10 -> adds 30, add_ten -> add_thirty, addTen -> addThirty, += 10 -> += 30, '10' -> '30', '13' -> '33'
  - Differences: the existing buttons stay in lib/main.dart; the new button goes below the last one; the test goes in a new file test/add_thirty_test.dart

## 3. Add 40 button

- [x] 3.1 [replica] Add 40 button, with its widget test; verify with `flutter test test/add_forty_test.dart`
  - Rename: Add 10 -> Add 40, add-ten-button -> add-forty-button, _addTen -> _addForty, adds 10 -> adds 40, add_ten -> add_forty, addTen -> addForty, += 10 -> += 40, '10' -> '40', '13' -> '43'
  - Differences: the existing buttons stay in lib/main.dart; the new button goes below the last one; the test goes in a new file test/add_forty_test.dart
