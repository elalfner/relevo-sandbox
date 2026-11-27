import 'task.dart';

/// The tasks of [tasks] whose title contains [text], ignoring case, in their
/// original order. An empty [text] matches every task; [text] is not trimmed
/// and [tasks] is not modified.
List<Task> searchTasks(List<Task> tasks, String text) {
  final needle = text.toLowerCase();
  return [
    for (final task in tasks)
      if (task.title.toLowerCase().contains(needle)) task,
  ];
}
