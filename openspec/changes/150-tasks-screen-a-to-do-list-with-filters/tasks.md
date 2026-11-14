# Tasks

## 1. Model and controller

- [ ] 1.1 Add `Task` and `TaskPriority` in `lib/models/task.dart`; verify with `flutter analyze`
- [ ] 1.2 Add `TaskListController` (`ChangeNotifier`) in `lib/state/task_list_controller.dart` with add/validate (empty, 60 characters by user-perceived characters, duplicates ignoring case and edge spaces), toggle, filter, sort (added, priority stable, title case-insensitive), delete and undo at former index, and counts; verify with `test/task_list_controller_test.dart` covering duplicates, the three sorts and the counts
- [ ] 1.3 Add `lib/screens/tasks_strings.dart` with every visible text as constants and the singular/plural header function; verify it is used by the tests

## 2. Screens and widgets

- [ ] 2.1 Add `lib/widgets/add_task_sheet.dart` (title field, priority choice, Save, errors "Write a title", "At most 60 characters", "That task already exists"); verify with widget tests for add, empty, 61/60 characters, "Café ☕", duplicate
- [ ] 2.2 Add `lib/screens/tasks_screen.dart` (header count, filter chips, sort menu, list, checkbox with line through, empty texts, Add button, swipe delete with snackbar Undo, semantics labels and delete action); verify with widget tests for done/filters/empty texts/sorts/delete/undo/two quick swipes/reuse after delete
- [ ] 2.3 Add the Tasks button on `MyHomePage` in `lib/main.dart` (controller owned by the home state so the list survives reopening); verify with widget tests for opening, "0 tasks", "Nothing to do yet", and reopening keeps the list; existing counter tests keep passing

## 3. Documentation and checks

- [ ] 3.1 Write the documentation from the issue exactly as given: add the Task, Task filter and Priority entries to `GLOSSARY.md`
- [ ] 3.2 Run `flutter analyze` and `flutter test`; both pass with no `print`, `TODO` or `debugPrint` left
