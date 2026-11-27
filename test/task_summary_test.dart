import 'package:flutter_test/flutter_test.dart';

import 'package:relevo_sandbox/models/task.dart';
import 'package:relevo_sandbox/models/task_summary.dart';

void main() {
  group('taskSummary', () {
    test('a done task with high priority', () {
      final summary = taskSummary(
        const Task(
          id: 1,
          title: 'Buy milk',
          priority: TaskPriority.high,
          done: true,
        ),
      );

      expect(summary, 'Buy milk (high, done)');
    });

    test('a task that is not done says pending', () {
      final summary = taskSummary(
        const Task(id: 2, title: 'Call home', priority: TaskPriority.low),
      );

      expect(summary, 'Call home (low, pending)');
    });
  });
}
