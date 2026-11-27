import 'package:flutter_test/flutter_test.dart';

import 'package:relevo_sandbox/models/task.dart';
import 'package:relevo_sandbox/models/task_order.dart';

void main() {
  test('orders call home and Buy milk with Buy milk first', () {
    final ordered = orderTasksByTitle(const [
      Task(id: 1, title: 'call home', priority: TaskPriority.low),
      Task(id: 2, title: 'Buy milk', priority: TaskPriority.high),
    ]);

    expect(ordered.map((task) => task.title), ['Buy milk', 'call home']);
  });

  test('keeps the order of tasks whose titles differ only in case', () {
    final ordered = orderTasksByTitle(const [
      Task(id: 1, title: 'buy milk', priority: TaskPriority.low),
      Task(id: 2, title: 'Buy milk', priority: TaskPriority.high),
      Task(id: 3, title: 'BUY MILK', priority: TaskPriority.medium),
    ]);

    expect(ordered.map((task) => task.id), [1, 2, 3]);
  });

  test('does not change the list it receives', () {
    final tasks = [
      const Task(id: 1, title: 'call home', priority: TaskPriority.low),
      const Task(id: 2, title: 'Buy milk', priority: TaskPriority.high),
    ];

    final ordered = orderTasksByTitle(tasks);

    expect(ordered, isNot(same(tasks)));
    expect(tasks.map((task) => task.id), [1, 2]);
  });

  test('orders an empty list as an empty list', () {
    expect(orderTasksByTitle(const []), isEmpty);
  });
}
