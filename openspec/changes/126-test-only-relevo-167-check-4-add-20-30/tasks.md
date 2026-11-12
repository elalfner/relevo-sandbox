# Tasks

## Replication recipe

- Template: `section 1`

## 1. Add 20 (template)

- [x] 1.1 Add the "Add 20" button (key `add-twenty-button`) after "Add 10" in `lib/main.dart`, adding 20 to the counter; verify with the widget test of 1.2
- [x] 1.2 Add `test/add_twenty_test.dart` covering 0 -> 20 and 3 -> 23; verify `flutter test test/add_twenty_test.dart` passes

## 2. Replicas

- [x] 2.1 [replica] Add 30 button and its test
  - Rename: Add 20 -> Add 30, add-twenty-button -> add-thirty-button, addTwenty -> addThirty, 20 -> 30, 23 -> 33
  - Differences: none
- [ ] 2.2 [replica] Add 40 button and its test
  - Rename: Add 20 -> Add 40, add-twenty-button -> add-forty-button, addTwenty -> addForty, 20 -> 40, 23 -> 43
  - Differences: none
