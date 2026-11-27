import 'package:flutter_test/flutter_test.dart';
import 'package:relevo_sandbox/models/task.dart';
import 'package:relevo_sandbox/models/task_counts.dart';

void main() {
  test('counts a mixed list', () {
    final counts = taskCounts(const [
      Task(id: 1, title: 'A', priority: TaskPriority.low),
      Task(id: 2, title: 'B', priority: TaskPriority.high, done: true),
      Task(id: 3, title: 'C', priority: TaskPriority.medium),
    ]);

    expect(counts.pending, 2);
    expect(counts.done, 1);
  });

  test('counts an empty list as zero', () {
    final counts = taskCounts(const []);

    expect(counts.pending, 0);
    expect(counts.done, 0);
  });
}
