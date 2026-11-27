import 'package:flutter_test/flutter_test.dart';
import 'package:relevo_sandbox/models/task.dart';
import 'package:relevo_sandbox/models/task_search.dart';

void main() {
  const milk = Task(id: 1, title: 'Buy milk', priority: TaskPriority.high);
  const call = Task(id: 2, title: 'Call home', priority: TaskPriority.low);
  const tasks = [milk, call];

  test('search ignores case', () {
    expect(searchTasks(tasks, 'MILK'), [milk]);
  });

  test('empty text returns every task in order', () {
    expect(searchTasks(tasks, ''), [milk, call]);
  });

  test('text with no match returns an empty list', () {
    expect(searchTasks(tasks, 'rent'), isEmpty);
  });

  test('matches keep the order of the list', () {
    expect(searchTasks(tasks, 'l'), [milk, call]);
  });
}
