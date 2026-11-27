import 'package:flutter_test/flutter_test.dart';

import 'package:relevo_sandbox/models/task.dart';
import 'package:relevo_sandbox/models/task_search.dart';

void main() {
  const milk = Task(id: 1, title: 'Buy milk', priority: TaskPriority.high);
  const home = Task(id: 2, title: 'Call home', priority: TaskPriority.low);
  const plants = Task(
    id: 3,
    title: 'Water plants',
    priority: TaskPriority.medium,
    done: true,
  );

  group('searchTasks', () {
    test('matches the title ignoring case', () {
      final result = searchTasks(const [milk, home], 'MILK');

      expect(result, [milk]);
    });

    test('an empty text returns every task in the same order', () {
      final result = searchTasks(const [plants, milk, home], '');

      expect(result, [plants, milk, home]);
    });

    test('keeps the original order of the matches', () {
      final result = searchTasks(const [plants, milk, home], 'a');

      expect(result, [plants, home]);
    });

    test('a text that matches nothing returns an empty list', () {
      expect(searchTasks(const [milk, home], 'zzz'), isEmpty);
    });

    test('does not modify the input list', () {
      final input = [milk, home];

      final result = searchTasks(input, 'milk');

      expect(result, isNot(same(input)));
      expect(input, [milk, home]);
    });
  });
}
