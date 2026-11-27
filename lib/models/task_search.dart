import 'task.dart';

/// The tasks of [tasks] whose title contains [text], ignoring case, in list
/// order. An empty [text] matches every task; it is not trimmed.
List<Task> searchTasks(List<Task> tasks, String text) {
  final needle = text.toLowerCase();
  return tasks
      .where((task) => task.title.toLowerCase().contains(needle))
      .toList();
}
