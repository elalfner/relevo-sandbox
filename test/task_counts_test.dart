import 'package:flutter_test/flutter_test.dart';
import 'package:relevo_sandbox/models/task.dart';
import 'package:relevo_sandbox/models/task_counts.dart';

void main() {
  test('counts a mixed list', () {
    final counts = countTasks(const [
      Task(id: 1, title: 'Buy milk', priority: TaskPriority.high),
      Task(id: 2, title: 'Call home', priority: TaskPriority.low, done: true),
      Task(id: 3, title: 'Pay rent', priority: TaskPriority.medium),
    ]);

    expect(counts.pending, 2);
    expect(counts.done, 1);
  });

  test('counts an empty list', () {
    final counts = countTasks(const []);

    expect(counts.pending, 0);
    expect(counts.done, 0);
  });
}
