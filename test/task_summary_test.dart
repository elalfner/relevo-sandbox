import 'package:flutter_test/flutter_test.dart';
import 'package:relevo_sandbox/models/task.dart';
import 'package:relevo_sandbox/models/task_summary.dart';

void main() {
  test('summarises a done task', () {
    const task = Task(
      id: 1,
      title: 'Buy milk',
      priority: TaskPriority.high,
      done: true,
    );

    expect(taskSummary(task), 'Buy milk (high, done)');
  });

  test('summarises a pending task', () {
    const task = Task(id: 1, title: 'Buy milk', priority: TaskPriority.high);

    expect(taskSummary(task), 'Buy milk (high, pending)');
  });
}
