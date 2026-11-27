import 'package:flutter_test/flutter_test.dart';

import 'package:relevo_sandbox/models/task.dart';
import 'package:relevo_sandbox/models/task_counts.dart';

void main() {
  group('taskCounts', () {
    test('a list with two pending tasks and one done task', () {
      final counts = taskCounts(const [
        Task(id: 1, title: 'Buy milk', priority: TaskPriority.high),
        Task(id: 2, title: 'Call home', priority: TaskPriority.low, done: true),
        Task(id: 3, title: 'Water plants', priority: TaskPriority.medium),
      ]);

      expect(counts.pending, 2);
      expect(counts.done, 1);
    });

    test('an empty list has no pending and no done tasks', () {
      final counts = taskCounts(const []);

      expect(counts.pending, 0);
      expect(counts.done, 0);
    });
  });
}
