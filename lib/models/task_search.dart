import 'task.dart';

/// Returns the tasks of [tasks] whose title contains [text], ignoring case.
///
/// The text is not trimmed. An empty [text] returns every task, in order.
List<Task> searchTasks(List<Task> tasks, String text) {
  final needle = text.toLowerCase();
  return tasks
      .where((task) => task.title.toLowerCase().contains(needle))
      .toList();
}
