import 'task.dart';

/// How many tasks of a list are still pending and how many are done.
class TaskCounts {
  const TaskCounts({required this.pending, required this.done});

  final int pending;

  final int done;
}

/// Counts the pending and the done tasks of [tasks].
TaskCounts countTasks(List<Task> tasks) {
  var done = 0;
  for (final task in tasks) {
    if (task.done) {
      done++;
    }
  }
  return TaskCounts(pending: tasks.length - done, done: done);
}
