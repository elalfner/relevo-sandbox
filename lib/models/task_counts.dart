import 'task.dart';

/// How many tasks of a list are pending and how many are done.
class TaskCounts {
  const TaskCounts({required this.pending, required this.done});

  final int pending;
  final int done;
}

/// Counts the pending and the done tasks of [tasks].
TaskCounts taskCounts(List<Task> tasks) {
  final done = tasks.where((task) => task.done).length;
  return TaskCounts(pending: tasks.length - done, done: done);
}
