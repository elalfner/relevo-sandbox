import 'task.dart';

/// One line that describes [task], like `Buy milk (high, pending)`.
String summarizeTask(Task task) {
  final state = task.done ? 'done' : 'pending';
  return '${task.title} (${task.priority.name}, $state)';
}
