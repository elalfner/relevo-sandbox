import 'task.dart';

/// The tasks of [tasks] whose title contains [text], ignoring case, in their
/// original order. The text is not trimmed; an empty text matches every task.
List<Task> searchTasks(List<Task> tasks, String text) {
  final needle = text.toLowerCase();
  return tasks
      .where((task) => task.title.toLowerCase().contains(needle))
      .toList();
}
