import 'task.dart';

/// One-line summary of [task]: `<title> (<priority>, <done|pending>)`.
String summarizeTask(Task task) {
  final status = task.done ? 'done' : 'pending';
  return '${task.title} (${task.priority.name}, $status)';
}
