import 'package:flutter_test/flutter_test.dart';
import 'package:relevo_sandbox/models/task.dart';
import 'package:relevo_sandbox/models/task_search.dart';

void main() {
  const milk = Task(id: 1, title: 'Buy milk', priority: TaskPriority.high);
  const home = Task(id: 2, title: 'Call home', priority: TaskPriority.low);

  test('searches ignoring case', () {
    expect(searchTasks(const [milk, home], 'MILK'), [milk]);
  });

  test('an empty text returns every task in order', () {
    expect(searchTasks(const [milk, home], ''), [milk, home]);
  });
}
