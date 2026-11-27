import 'package:flutter_test/flutter_test.dart';
import 'package:relevo_sandbox/models/task.dart';
import 'package:relevo_sandbox/models/task_search.dart';

void main() {
  const buyMilk = Task(id: 1, title: 'Buy milk', priority: TaskPriority.high);
  const callHome = Task(id: 2, title: 'Call home', priority: TaskPriority.low);

  test('MILK matches Buy milk only', () {
    final found = searchTasks(const [buyMilk, callHome], 'MILK');

    expect(found, [buyMilk]);
  });

  test('an empty text returns every task in the same order', () {
    final found = searchTasks(const [buyMilk, callHome], '');

    expect(found, [buyMilk, callHome]);
  });
}
