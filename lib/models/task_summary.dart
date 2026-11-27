import 'task.dart';

/// One line with the title, the priority and the state of [task], such as
/// `Buy milk (high, done)`.
String taskSummary(Task task) {
  final state = task.done ? 'done' : 'pending';
  return '${task.title} (${task.priority.name}, $state)';
}
