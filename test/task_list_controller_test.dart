import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:relevo_sandbox/models/task.dart';
import 'package:relevo_sandbox/screens/tasks_strings.dart';
import 'package:relevo_sandbox/state/task_list_controller.dart';

void main() {
  late TaskListController controller;

  setUp(() {
    controller = TaskListController();
  });

  List<String> titles() => controller.visibleTasks.map((t) => t.title).toList();

  group('Validation', () {
    test('an empty title or only spaces is refused', () {
      expect(controller.add('', TaskPriority.medium), TasksStrings.errorEmpty);
      expect(
        controller.add('   ', TaskPriority.medium),
        TasksStrings.errorEmpty,
      );
      expect(controller.totalCount, 0);
    });

    test('60 characters are accepted and 61 are refused', () {
      expect(controller.validateTitle('a' * 60), isNull);
      expect(controller.validateTitle('a' * 61), TasksStrings.errorTooLong);
      expect(controller.add('a' * 61, TaskPriority.low), isNotNull);
      expect(controller.add('a' * 60, TaskPriority.low), isNull);
      expect(controller.totalCount, 1);
    });

    test('Café ☕ counts as 6 characters', () {
      // 60 characters made of the 6-character title ten times, with spaces
      // between would exceed it, so build exactly 60 and 61 with it.
      final sixty = '${'Café ☕' * 9}abcdef';
      expect(sixty.characters.length, 60);
      expect(controller.validateTitle(sixty), isNull);
      expect(controller.validateTitle('${sixty}x'), TasksStrings.errorTooLong);
      expect(controller.validateTitle('Café ☕'), isNull);
    });

    test('a combined emoji counts as one character', () {
      final family = '👨‍👩‍👧‍👦' * 60;
      expect(controller.validateTitle(family), isNull);
      expect(controller.validateTitle('${family}a'), TasksStrings.errorTooLong);
    });

    test('spaces at the ends do not count', () {
      expect(controller.validateTitle('  ${'a' * 60}  '), isNull);
    });

    test('a duplicate is refused ignoring case and edge spaces', () {
      expect(controller.add('Buy milk', TaskPriority.high), isNull);
      expect(
        controller.add('buy milk', TaskPriority.low),
        TasksStrings.errorDuplicate,
      );
      expect(
        controller.add('  BUY MILK  ', TaskPriority.low),
        TasksStrings.errorDuplicate,
      );
      expect(controller.totalCount, 1);
      expect(controller.add('Buy bread', TaskPriority.low), isNull);
    });

    test('the title is stored trimmed', () {
      controller.add('  Walk  ', TaskPriority.low);
      expect(titles(), ['Walk']);
    });

    test('a deleted title can be added again', () {
      controller.add('Buy milk', TaskPriority.high);
      controller.delete(controller.tasks.first.id);
      expect(controller.add('buy milk', TaskPriority.high), isNull);
    });
  });

  group('Counts and header', () {
    test('count total, open and done', () {
      controller.add('A', TaskPriority.low);
      controller.add('B', TaskPriority.low);
      controller.add('C', TaskPriority.low);
      controller.toggle(controller.tasks.first.id);
      expect(controller.totalCount, 3);
      expect(controller.openCount, 2);
      expect(controller.doneCount, 1);
      expect(TasksStrings.headerOpen(2, 3), '2 of 3 open');
    });

    test('the header uses singular and plural', () {
      expect(TasksStrings.header(0), '0 tasks');
      expect(TasksStrings.header(1), '1 task');
      expect(TasksStrings.header(5), '5 tasks');
    });

    test('toggling twice reopens the task', () {
      controller.add('A', TaskPriority.low);
      final id = controller.tasks.first.id;
      controller.toggle(id);
      controller.toggle(id);
      expect(controller.openCount, 1);
    });
  });

  group('Filter', () {
    setUp(() {
      controller.add('A', TaskPriority.low);
      controller.add('B', TaskPriority.low);
      controller.toggle(controller.tasks.first.id);
    });

    test('shows all, open or done tasks', () {
      expect(titles(), ['A', 'B']);
      controller.setFilter(TaskFilter.open);
      expect(titles(), ['B']);
      controller.setFilter(TaskFilter.done);
      expect(titles(), ['A']);
    });

    test('filter and sort stay chosen when the list changes', () {
      controller.setFilter(TaskFilter.open);
      controller.setSort(TaskSort.title);
      controller.add('C', TaskPriority.low);
      controller.toggle(controller.tasks.last.id);
      controller.delete(controller.tasks.first.id);
      expect(controller.filter, TaskFilter.open);
      expect(controller.sort, TaskSort.title);
    });

    test('an empty filter has its own text', () {
      controller.setFilter(TaskFilter.done);
      controller.toggle(controller.tasks.first.id);
      expect(controller.visibleTasks, isEmpty);
      expect(TasksStrings.emptyText(controller.filter), TasksStrings.emptyDone);
      expect(TasksStrings.emptyText(TaskFilter.open), TasksStrings.emptyOpen);
      expect(TasksStrings.emptyText(TaskFilter.all), TasksStrings.emptyAll);
    });
  });

  group('Sort', () {
    setUp(() {
      controller.add('pear', TaskPriority.low);
      controller.add('Apple', TaskPriority.high);
      controller.add('cherry', TaskPriority.medium);
      controller.add('banana', TaskPriority.high);
      controller.add('Date', TaskPriority.low);
    });

    test('added order is the default', () {
      expect(controller.sort, TaskSort.added);
      expect(titles(), ['pear', 'Apple', 'cherry', 'banana', 'Date']);
    });

    test('priority is High, Medium, Low and stable', () {
      controller.setSort(TaskSort.priority);
      expect(titles(), ['Apple', 'banana', 'cherry', 'pear', 'Date']);
    });

    test('title is A to Z without caring about case', () {
      controller.setSort(TaskSort.title);
      expect(titles(), ['Apple', 'banana', 'cherry', 'Date', 'pear']);
    });

    test('sorting does not change the added order', () {
      controller.setSort(TaskSort.title);
      expect(controller.tasks.map((t) => t.title), [
        'pear',
        'Apple',
        'cherry',
        'banana',
        'Date',
      ]);
    });
  });

  group('Delete and undo', () {
    setUp(() {
      controller.add('A', TaskPriority.low);
      controller.add('B', TaskPriority.low);
      controller.add('C', TaskPriority.low);
    });

    int idOf(String title) =>
        controller.tasks.firstWhere((t) => t.title == title).id;

    test('delete removes the task and undo restores its former index', () {
      final deleted = controller.delete(idOf('B'))!;
      expect(titles(), ['A', 'C']);
      expect(deleted.index, 1);
      controller.undoDelete(deleted);
      expect(titles(), ['A', 'B', 'C']);
    });

    test('undo restores the first and the last position', () {
      final first = controller.delete(idOf('A'))!;
      controller.undoDelete(first);
      expect(titles(), ['A', 'B', 'C']);
      final last = controller.delete(idOf('C'))!;
      controller.undoDelete(last);
      expect(titles(), ['A', 'B', 'C']);
    });

    test('undo keeps the done state', () {
      controller.toggle(idOf('B'));
      final deleted = controller.delete(idOf('B'))!;
      controller.undoDelete(deleted);
      expect(controller.tasks[1].done, isTrue);
    });

    test('undo goes to the end when the list became shorter', () {
      final deleted = controller.delete(idOf('C'))!;
      controller.delete(idOf('B'));
      controller.undoDelete(deleted);
      expect(titles(), ['A', 'C']);
    });

    test('undo restores a task even if its title was added meanwhile', () {
      final deleted = controller.delete(idOf('B'))!;
      expect(controller.add('B', TaskPriority.high), isNull);
      controller.undoDelete(deleted);
      expect(controller.tasks.where((t) => t.title == 'B'), hasLength(2));
    });

    test('undoing twice does not duplicate the task', () {
      final deleted = controller.delete(idOf('B'))!;
      controller.undoDelete(deleted);
      controller.undoDelete(deleted);
      expect(controller.totalCount, 3);
    });

    test('deleting an unknown task returns null', () {
      expect(controller.delete(999), isNull);
    });
  });

  test('changes notify the listeners', () {
    var calls = 0;
    controller.addListener(() => calls++);
    controller.add('A', TaskPriority.low);
    controller.setFilter(TaskFilter.done);
    controller.setSort(TaskSort.title);
    expect(calls, 3);
  });

  test('the strings give a label to every filter, sort and priority', () {
    for (final filter in TaskFilter.values) {
      expect(TasksStrings.filterLabel(filter), isNotEmpty);
      expect(TasksStrings.filterSemantics(filter), isNotEmpty);
    }
    for (final sort in TaskSort.values) {
      expect(TasksStrings.sortLabel(sort), isNotEmpty);
    }
    for (final priority in TaskPriority.values) {
      expect(TasksStrings.priorityText(priority), isNotEmpty);
      expect(TasksStrings.prioritySemantics(priority), isNotEmpty);
    }
  });
}
