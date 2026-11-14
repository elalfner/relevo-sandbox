# Design

## Context

`lib/main.dart` holds `MyApp` and the home screen `MyHomePage` (counter and greeting). The app is Flutter with no state package. See proposal.md.

## Goals / Non-Goals

**Goals:** a testable controller for the list rules; small widgets, one screen per file.

**Non-Goals:** persistence, rename/edit, dates, search.

## Decisions

- The Tasks button on `MyHomePage` pushes `TasksScreen` with a `MaterialPageRoute`. The controller is owned by `MyHomePage`'s state (created once) and passed to the screen, so the list survives reopening the screen; rotation keeps it because the controller is not part of the screen's state.
- Title length counts user-perceived characters with `String.characters.length` (the `characters` package ships with Flutter, already a transitive dependency; it is exported by `package:flutter/widgets.dart`, so no pubspec change).
- Undo restores the task at its former index in the insertion-ordered list.
- Delete by `Dismissible` (endToStart) with a `Semantics` custom action for delete.

## Risks / Trade-offs

- Snackbar timing in tests: use `pumpAndSettle` and `ScaffoldMessenger.clearSnackBars` behaviours of Flutter.

## Assumptions

- The sort menu offers "Added", "Priority" and "Title"; the default is Added order.
- The default priority in the sheet is Medium.
- A deleted task's title is freed for reuse as soon as it is deleted; while the snackbar is open Undo restores it, and if the same title was added meanwhile, Undo still restores the task (the duplicate check applies to Add only).
## From the issue: Decisions

### D1. The list state is one controller
Decided: the tasks, the filter and the sort live in a `TaskListController` (a `ChangeNotifier`) in `lib/state/task_list_controller.dart`; the screen listens to it and holds no list of its own.
Why: the rules of the list (duplicates, order, counts) can be tested without a widget.
Discarded: keeping the list in the `State` of the screen.

### D2. One file per concept
Decided: the model `Task` and the enum `TaskPriority` are in `lib/models/task.dart`, the screen in `lib/screens/tasks_screen.dart` and the bottom sheet in `lib/widgets/add_task_sheet.dart`.
Why: the project rules ask for one screen per file and small widgets.
Discarded: one large file for the whole feature.

### D3. The texts come from one place
Decided: every visible text of the feature is a constant in `lib/screens/tasks_strings.dart`, and the tests read the same constants.
Why: the text is written once, and the singular and plural cases are a function.
Discarded: strings repeated in the screen and in the tests.

## From the issue: Constraints

- C1: no new dependency is added to `pubspec.yaml`; state uses only what Flutter provides.
- C2: a widget test covers each scenario, and a unit test of `TaskListController` covers duplicates, the three sorts of order and the counts.
- C3: every button, chip and the checkbox has a semantics label, and the swipe has a semantic action for delete.
- C4: `flutter analyze` and `flutter test` pass, and no `print`, `TODO` or `debugPrint` is left.

## From the issue: Code pointers

- `lib/main.dart`: the home screen `MyHomePage`, where the Tasks button that opens the screen is added; the existing counter and greeting are not changed.
- `GLOSSARY.md`: the new terms are added to it.
- `test/widget_test.dart`: the existing counter tests, to follow in style.

## From the issue: Verification

- On an Android device or emulator, add three tasks with different priorities, mark one done, try each filter and each sort, delete one and tap Undo, and check each text of the scenarios.

## Documentation from the issue

- Add these entries to `GLOSSARY.md`, under its existing heading, after the existing ones, exactly as written. They are vocabulary only; nothing else in that file changes.

**Task**:
One line of the to-do list, with a title of up to 60 characters, a priority and a done or open state.
_Avoid_: Todo, item, entry

**Task filter**:
One of the three views of the list (All, Open, Done) that decide which tasks are shown.
_Avoid_: Tab, view, category

**Priority**:
One of High, Medium or Low, chosen when a task is added; it decides the order when the list is sorted by priority.
_Avoid_: Importance, urgency, level
