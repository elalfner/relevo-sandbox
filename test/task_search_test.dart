import 'package:flutter_test/flutter_test.dart';

import 'package:relevo_sandbox/models/task.dart';
import 'package:relevo_sandbox/models/task_search.dart';

void main() {
  const tasks = [
    Task(id: 1, title: 'Buy milk', priority: TaskPriority.high),
    Task(id: 2, title: 'Call home', priority: TaskPriority.low),
  ];

  test('search ignores case and returns only the matching task', () {
    final found = searchTasks(tasks, 'MILK');

    expect(found.map((task) => task.title), ['Buy milk']);
  });

  test('empty search text returns every task in the same order', () {
    final found = searchTasks(tasks, '');

    expect(found.map((task) => task.id), [1, 2]);
    expect(identical(found, tasks), isFalse);
  });
}
