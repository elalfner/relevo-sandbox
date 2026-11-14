import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:relevo_sandbox/models/task.dart';
import 'package:relevo_sandbox/screens/tasks_screen.dart';
import 'package:relevo_sandbox/screens/tasks_strings.dart';
import 'package:relevo_sandbox/state/task_list_controller.dart';

/// Shows the Tasks screen alone, on top of a controller the test owns.
Future<TaskListController> pumpTasksScreen(
  WidgetTester tester, [
  TaskListController? controller,
]) async {
  final c = controller ?? TaskListController();
  await tester.pumpWidget(MaterialApp(home: TasksScreen(controller: c)));
  return c;
}

/// Opens the sheet, types [title], picks [priority] and taps Save.
Future<void> addTask(
  WidgetTester tester,
  String title, {
  TaskPriority? priority,
}) async {
  await tester.tap(find.text(TasksStrings.addButton));
  await tester.pumpAndSettle();
  await tester.enterText(find.byType(TextField), title);
  if (priority != null) {
    await tester.tap(
      find.widgetWithText(ChoiceChip, TasksStrings.priorityText(priority)),
    );
    await tester.pump();
  }
  await tester.tap(find.byType(FilledButton));
  await tester.pumpAndSettle();
}

/// The titles shown in the list, from top to bottom.
List<String> shownTitles(WidgetTester tester) {
  return tester
      .widgetList<ListTile>(find.byType(ListTile))
      .map((tile) => (tile.title! as Text).data!)
      .toList();
}

/// Swipes the task with [title] to the left and lets the animation end.
Future<void> swipeDelete(WidgetTester tester, String title) async {
  await tester.drag(find.text(title), const Offset(-600, 0));
  await tester.pumpAndSettle();
}
