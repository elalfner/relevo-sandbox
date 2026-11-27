import 'task.dart';

/// Describes [task] in one line: `<title> (<priority>, <done|pending>)`, with
/// the priority in lower case.
String taskSummary(Task task) {
  final state = task.done ? 'done' : 'pending';
  return '${task.title} (${task.priority.name}, $state)';
}
