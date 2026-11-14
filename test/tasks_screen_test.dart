import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:relevo_sandbox/main.dart';
import 'package:relevo_sandbox/models/task.dart';
import 'package:relevo_sandbox/screens/tasks_strings.dart';
import 'package:relevo_sandbox/state/task_list_controller.dart';

import 'tasks_test_helpers.dart';

void main() {
  Future<void> openFromHome(WidgetTester tester) async {
    await tester.tap(find.byKey(const Key('tasks-button')));
    await tester.pumpAndSettle();
  }

  Future<void> pickFilter(WidgetTester tester, TaskFilter filter) async {
    await tester.tap(
      find.widgetWithText(FilterChip, TasksStrings.filterLabel(filter)),
    );
    await tester.pumpAndSettle();
  }

  Future<void> pickSort(WidgetTester tester, TaskSort sort) async {
    await tester.tap(find.byTooltip(TasksStrings.sortSemantics));
    await tester.pumpAndSettle();
    await tester.tap(
      find.widgetWithText(
        CheckedPopupMenuItem<TaskSort>,
        TasksStrings.sortLabel(sort),
      ),
    );
    await tester.pumpAndSettle();
  }

  Future<TaskListController> threeTasks(WidgetTester tester) async {
    final controller = TaskListController()
      ..add('Buy milk', TaskPriority.low)
      ..add('apple pie', TaskPriority.high)
      ..add('Call Ann', TaskPriority.low);
    await pumpTasksScreen(tester, controller);
    return controller;
  }

  group('open and reopen', () {
    testWidgets('Open from home shows title, header and empty text', (
      tester,
    ) async {
      await tester.pumpWidget(const MyApp());
      await openFromHome(tester);

      expect(
        find.descendant(
          of: find.byType(AppBar),
          matching: find.text(TasksStrings.title),
        ),
        findsOneWidget,
      );
      expect(find.text(TasksStrings.header(0)), findsOneWidget);
      expect(find.text(TasksStrings.emptyAll), findsOneWidget);
    });

    testWidgets('Reopening from home keeps the list', (tester) async {
      await tester.pumpWidget(const MyApp());
      await openFromHome(tester);
      await addTask(tester, 'Buy milk', priority: TaskPriority.high);

      await tester.pageBack();
      await tester.pumpAndSettle();
      expect(find.text('Buy milk'), findsNothing);
      await openFromHome(tester);

      expect(find.text('Buy milk'), findsOneWidget);
      expect(find.text(TasksStrings.header(1)), findsOneWidget);
    });

    testWidgets('Rotating the screen keeps the list', (tester) async {
      addTearDown(tester.view.reset);
      await tester.pumpWidget(const MyApp());
      await openFromHome(tester);
      await addTask(tester, 'Buy milk');

      tester.view.physicalSize = const Size(1200, 600);
      tester.view.devicePixelRatio = 1.0;
      await tester.pumpAndSettle();

      expect(find.text('Buy milk'), findsOneWidget);
      expect(find.text(TasksStrings.header(1)), findsOneWidget);
    });

    testWidgets('The home counter and greeting are unchanged', (tester) async {
      await tester.pumpWidget(const MyApp());

      expect(find.byKey(const Key('greeting-text')), findsOneWidget);
      expect(find.text('0'), findsOneWidget);
      expect(find.text(TasksStrings.homeButton), findsOneWidget);
    });
  });

  group('header', () {
    testWidgets('Singular and plural', (tester) async {
      final controller = await pumpTasksScreen(tester);
      expect(find.text('0 tasks'), findsOneWidget);

      controller.add('One', TaskPriority.medium);
      await tester.pump();
      expect(find.text('1 task'), findsOneWidget);

      for (final title in ['Two', 'Three', 'Four', 'Five']) {
        controller.add(title, TaskPriority.medium);
      }
      await tester.pump();
      expect(find.text('5 tasks'), findsOneWidget);
    });
  });

  group('complete and filter', () {
    testWidgets('Mark done: line through, open count, gone under Open', (
      tester,
    ) async {
      await threeTasks(tester);
      await tester.tap(find.byType(Checkbox).first);
      await tester.pump();

      final style = tester.widget<Text>(find.text('Buy milk')).style;
      expect(style?.decoration, TextDecoration.lineThrough);
      expect(find.text(TasksStrings.headerOpen(2, 3)), findsOneWidget);
      expect(find.text('2 of 3 open'), findsOneWidget);

      await pickFilter(tester, TaskFilter.open);
      expect(find.text('Buy milk'), findsNothing);
      expect(find.text('apple pie'), findsOneWidget);
    });

    testWidgets('A done task can be marked open again', (tester) async {
      await threeTasks(tester);
      await tester.tap(find.byType(Checkbox).first);
      await tester.pump();
      await tester.tap(find.byType(Checkbox).first);
      await tester.pump();

      final style = tester.widget<Text>(find.text('Buy milk')).style;
      expect(style?.decoration, isNot(TextDecoration.lineThrough));
      expect(find.text(TasksStrings.header(3)), findsOneWidget);
    });

    testWidgets('Done filter shows only done tasks', (tester) async {
      await threeTasks(tester);
      await tester.tap(find.byType(Checkbox).first);
      await tester.pump();
      await pickFilter(tester, TaskFilter.done);

      expect(shownTitles(tester), ['Buy milk']);
    });

    testWidgets('Empty Done filter: its text and Add still available', (
      tester,
    ) async {
      await threeTasks(tester);
      await pickFilter(tester, TaskFilter.done);

      expect(find.text(TasksStrings.emptyDone), findsOneWidget);
      expect(find.text(TasksStrings.addButton), findsOneWidget);
    });

    testWidgets('Empty Open filter: its text and Add still available', (
      tester,
    ) async {
      final controller = TaskListController()..add('A', TaskPriority.low);
      controller.toggle(controller.tasks.single.id);
      await pumpTasksScreen(tester, controller);
      await pickFilter(tester, TaskFilter.open);

      expect(find.text(TasksStrings.emptyOpen), findsOneWidget);
      expect(find.text(TasksStrings.addButton), findsOneWidget);
    });

    testWidgets('Empty All filter: its text and Add still available', (
      tester,
    ) async {
      await pumpTasksScreen(tester);

      expect(find.text(TasksStrings.emptyAll), findsOneWidget);
      expect(find.text(TasksStrings.addButton), findsOneWidget);
    });

    testWidgets('Add works from an empty filtered list', (tester) async {
      await pumpTasksScreen(tester);
      await pickFilter(tester, TaskFilter.done);
      await addTask(tester, 'Buy milk');

      expect(find.text(TasksStrings.emptyDone), findsOneWidget);
      await pickFilter(tester, TaskFilter.all);
      expect(find.text('Buy milk'), findsOneWidget);
    });

    testWidgets('Filter and sort stay chosen after add, done and delete', (
      tester,
    ) async {
      final controller = await threeTasks(tester);
      await pickSort(tester, TaskSort.title);
      await pickFilter(tester, TaskFilter.open);

      await addTask(tester, 'Zebra');
      await tester.tap(find.byType(Checkbox).first);
      await tester.pump();
      await swipeDelete(tester, 'Buy milk');

      expect(controller.filter, TaskFilter.open);
      expect(controller.sort, TaskSort.title);
      expect(shownTitles(tester), ['Call Ann', 'Zebra']);
    });

    testWidgets('Deleting the last task of a filter shows its empty text', (
      tester,
    ) async {
      final controller = TaskListController()
        ..add('A', TaskPriority.low)
        ..add('B', TaskPriority.low);
      controller.toggle(controller.tasks.first.id);
      await pumpTasksScreen(tester, controller);
      await pickFilter(tester, TaskFilter.done);
      await swipeDelete(tester, 'A');

      expect(find.text(TasksStrings.emptyDone), findsOneWidget);
    });
  });

  group('sort', () {
    testWidgets('By priority: High, Medium, Low, ties in added order', (
      tester,
    ) async {
      final controller = TaskListController()
        ..add('low one', TaskPriority.low)
        ..add('med one', TaskPriority.medium)
        ..add('high one', TaskPriority.high)
        ..add('low two', TaskPriority.low)
        ..add('high two', TaskPriority.high);
      await pumpTasksScreen(tester, controller);
      await pickSort(tester, TaskSort.priority);

      expect(shownTitles(tester), [
        'high one',
        'high two',
        'med one',
        'low one',
        'low two',
      ]);
    });

    testWidgets('By title: A to Z without caring about case', (tester) async {
      await threeTasks(tester);
      await pickSort(tester, TaskSort.title);

      expect(shownTitles(tester), ['apple pie', 'Buy milk', 'Call Ann']);
    });

    testWidgets('Back to Added order', (tester) async {
      await threeTasks(tester);
      await pickSort(tester, TaskSort.title);
      await pickSort(tester, TaskSort.added);

      expect(shownTitles(tester), ['Buy milk', 'apple pie', 'Call Ann']);
    });
  });

  group('delete with undo', () {
    testWidgets('Swipe deletes, Undo puts it back at its position', (
      tester,
    ) async {
      await threeTasks(tester);
      await swipeDelete(tester, 'apple pie');

      expect(shownTitles(tester), ['Buy milk', 'Call Ann']);
      expect(find.text(TasksStrings.taskDeleted), findsOneWidget);
      expect(find.text(TasksStrings.undo), findsOneWidget);
      expect(find.text(TasksStrings.header(2)), findsOneWidget);

      await tester.tap(find.text(TasksStrings.undo));
      await tester.pumpAndSettle();

      expect(shownTitles(tester), ['Buy milk', 'apple pie', 'Call Ann']);
    });

    testWidgets('Two quick swipes keep one snackbar; Undo restores the last', (
      tester,
    ) async {
      await threeTasks(tester);
      await swipeDelete(tester, 'Buy milk');
      await swipeDelete(tester, 'Call Ann');

      expect(find.text(TasksStrings.taskDeleted), findsOneWidget);
      expect(find.byType(SnackBar), findsOneWidget);

      await tester.tap(find.text(TasksStrings.undo));
      await tester.pumpAndSettle();

      expect(shownTitles(tester), ['apple pie', 'Call Ann']);
    });

    testWidgets('A deleted title can be reused after the snackbar closes', (
      tester,
    ) async {
      final controller = await threeTasks(tester);
      await swipeDelete(tester, 'Buy milk');
      await tester.pump(const Duration(seconds: 6));
      await tester.pumpAndSettle();
      expect(find.byType(SnackBar), findsNothing);

      await addTask(tester, 'buy milk');

      expect(find.text(TasksStrings.errorDuplicate), findsNothing);
      expect(controller.tasks.map((t) => t.title), contains('buy milk'));
    });

    testWidgets('Deleting the only task shows the empty text', (tester) async {
      final controller = TaskListController()..add('A', TaskPriority.low);
      await pumpTasksScreen(tester, controller);
      await swipeDelete(tester, 'A');

      expect(find.text(TasksStrings.emptyAll), findsOneWidget);
      expect(find.text(TasksStrings.header(0)), findsOneWidget);
    });

    testWidgets('The delete action of the semantics deletes the task', (
      tester,
    ) async {
      final handle = tester.ensureSemantics();
      final controller = await threeTasks(tester);

      final node = tester.getSemantics(find.text('apple pie'));
      final action = const CustomSemanticsAction(
        label: TasksStrings.deleteAction,
      );
      expect(
        node.getSemanticsData().customSemanticsActionIds,
        contains(CustomSemanticsAction.getIdentifier(action)),
      );
      tester.binding.pipelineOwner.semanticsOwner!.performAction(
        node.id,
        SemanticsAction.customAction,
        CustomSemanticsAction.getIdentifier(action),
      );
      await tester.pumpAndSettle();

      expect(controller.tasks.map((t) => t.title), ['Buy milk', 'Call Ann']);
      expect(find.text(TasksStrings.taskDeleted), findsOneWidget);
      handle.dispose();
    });
  });

  group('semantics and badges', () {
    testWidgets('Buttons, chips, checkboxes and badges have labels', (
      tester,
    ) async {
      final handle = tester.ensureSemantics();
      await threeTasks(tester);

      expect(find.bySemanticsLabel(TasksStrings.addSemantics), findsOneWidget);
      expect(find.byTooltip(TasksStrings.sortSemantics), findsOneWidget);
      for (final filter in TaskFilter.values) {
        expect(
          find.bySemanticsLabel(TasksStrings.filterSemantics(filter)),
          findsOneWidget,
        );
      }
      expect(
        find.bySemanticsLabel(
          TasksStrings.checkboxSemantics('Buy milk', false),
        ),
        findsOneWidget,
      );
      expect(
        find.bySemanticsLabel(
          TasksStrings.prioritySemantics(TaskPriority.high),
        ),
        findsOneWidget,
      );
      handle.dispose();
    });

    testWidgets('The priority badge shows the word', (tester) async {
      await threeTasks(tester);

      expect(find.text(TasksStrings.priorityHigh), findsOneWidget);
      expect(find.text(TasksStrings.priorityLow), findsNWidgets(2));
    });

    testWidgets('The home button has a semantics label', (tester) async {
      final handle = tester.ensureSemantics();
      await tester.pumpWidget(const MyApp());

      expect(
        find.bySemanticsLabel(TasksStrings.homeButtonSemantics),
        findsOneWidget,
      );
      handle.dispose();
    });
  });
}
