import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:relevo_sandbox/models/task.dart';
import 'package:relevo_sandbox/screens/tasks_strings.dart';

import 'tasks_test_helpers.dart';

void main() {
  Future<void> openSheet(WidgetTester tester) async {
    await tester.tap(find.text(TasksStrings.addButton));
    await tester.pumpAndSettle();
  }

  Future<void> save(WidgetTester tester) async {
    await tester.tap(find.byType(FilledButton));
    await tester.pumpAndSettle();
  }

  testWidgets('Add a task with the priority High', (tester) async {
    final controller = await pumpTasksScreen(tester);
    await addTask(tester, 'Buy milk', priority: TaskPriority.high);

    expect(find.byType(TextField), findsNothing);
    expect(find.text('Buy milk'), findsOneWidget);
    expect(find.text(TasksStrings.priorityHigh), findsOneWidget);
    expect(find.text(TasksStrings.header(1)), findsOneWidget);
    expect(controller.tasks.single.priority, TaskPriority.high);
  });

  testWidgets('The sheet starts with Medium chosen and a labelled field', (
    tester,
  ) async {
    final controller = await pumpTasksScreen(tester);
    await openSheet(tester);

    expect(
      tester
          .widget<ChoiceChip>(
            find.widgetWithText(ChoiceChip, TasksStrings.priorityMedium),
          )
          .selected,
      isTrue,
    );
    expect(find.text(TasksStrings.titleFieldLabel), findsOneWidget);

    await tester.enterText(find.byType(TextField), 'Walk');
    await save(tester);
    expect(controller.tasks.single.priority, TaskPriority.medium);
  });

  testWidgets('Empty title keeps the sheet open with an error', (tester) async {
    final controller = await pumpTasksScreen(tester);
    await openSheet(tester);
    await save(tester);

    expect(find.text(TasksStrings.errorEmpty), findsOneWidget);
    expect(find.byType(TextField), findsOneWidget);
    expect(controller.totalCount, 0);
  });

  testWidgets('A title of only spaces keeps the sheet open with an error', (
    tester,
  ) async {
    final controller = await pumpTasksScreen(tester);
    await openSheet(tester);
    await tester.enterText(find.byType(TextField), '   ');
    await save(tester);

    expect(find.text(TasksStrings.errorEmpty), findsOneWidget);
    expect(find.byType(TextField), findsOneWidget);
    expect(controller.totalCount, 0);
  });

  testWidgets('61 characters show the error and Save adds nothing', (
    tester,
  ) async {
    final controller = await pumpTasksScreen(tester);
    await openSheet(tester);
    await tester.enterText(find.byType(TextField), 'a' * 61);
    await tester.pump();
    expect(find.text(TasksStrings.errorTooLong), findsOneWidget);

    await save(tester);
    expect(find.text(TasksStrings.errorTooLong), findsOneWidget);
    expect(find.byType(TextField), findsOneWidget);
    expect(controller.totalCount, 0);
  });

  testWidgets('60 characters are accepted', (tester) async {
    final controller = await pumpTasksScreen(tester);
    await openSheet(tester);
    await tester.enterText(find.byType(TextField), 'a' * 60);
    await tester.pump();
    expect(find.text(TasksStrings.errorTooLong), findsNothing);

    await save(tester);
    expect(find.byType(TextField), findsNothing);
    expect(controller.tasks.single.title, 'a' * 60);
  });

  testWidgets('The error goes away when the title is shortened', (
    tester,
  ) async {
    await pumpTasksScreen(tester);
    await openSheet(tester);
    await tester.enterText(find.byType(TextField), 'a' * 61);
    await tester.pump();
    await tester.enterText(find.byType(TextField), 'a' * 60);
    await tester.pump();

    expect(find.text(TasksStrings.errorTooLong), findsNothing);
  });

  testWidgets('"Café ☕" counts as 6 characters', (tester) async {
    final controller = await pumpTasksScreen(tester);
    await openSheet(tester);
    // 54 + 6 = 60 characters as seen, accepted; one more is too long.
    await tester.enterText(find.byType(TextField), '${'a' * 54}Café ☕');
    await tester.pump();
    expect(find.text(TasksStrings.errorTooLong), findsNothing);
    await tester.enterText(find.byType(TextField), '${'a' * 55}Café ☕');
    await tester.pump();
    expect(find.text(TasksStrings.errorTooLong), findsOneWidget);

    await tester.enterText(find.byType(TextField), 'Café ☕');
    await save(tester);
    expect(controller.tasks.single.title, 'Café ☕');
  });

  testWidgets('A duplicate title keeps the sheet open with an error', (
    tester,
  ) async {
    final controller = await pumpTasksScreen(tester);
    await addTask(tester, 'Buy milk');
    await addTask(tester, '  buy MILK ');

    expect(find.text(TasksStrings.errorDuplicate), findsOneWidget);
    expect(find.byType(TextField), findsOneWidget);
    expect(controller.totalCount, 1);
  });

  testWidgets('The sheet fields have semantics labels', (tester) async {
    final handle = tester.ensureSemantics();
    await pumpTasksScreen(tester);
    await openSheet(tester);

    expect(find.bySemanticsLabel(TasksStrings.saveSemantics), findsOneWidget);
    for (final priority in TaskPriority.values) {
      expect(
        find.bySemanticsLabel(TasksStrings.prioritySemantics(priority)),
        findsOneWidget,
      );
    }
    handle.dispose();
  });
}
