import 'task.dart';

/// Returns a new list with the tasks of [tasks] sorted by title, ignoring
/// case. Tasks whose titles are equal ignoring case keep their relative order,
/// and [tasks] itself is not changed.
List<Task> orderTasksByTitle(List<Task> tasks) {
  final indexed = [
    for (var i = 0; i < tasks.length; i++) (index: i, task: tasks[i]),
  ];
  indexed.sort((a, b) {
    final byTitle = a.task.title.toLowerCase().compareTo(
      b.task.title.toLowerCase(),
    );
    return byTitle != 0 ? byTitle : a.index.compareTo(b.index);
  });
  return [for (final entry in indexed) entry.task];
}
