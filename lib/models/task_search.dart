import 'task.dart';

/// The tasks of [tasks] whose title contains [query], ignoring case, in the
/// order of [tasks]. An empty [query] returns every task.
///
/// Returns a new list; [tasks] is not changed.
List<Task> searchTasks(List<Task> tasks, String query) {
  final needle = query.toLowerCase();
  return [
    for (final task in tasks)
      if (task.title.toLowerCase().contains(needle)) task,
  ];
}
