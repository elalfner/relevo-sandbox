import 'task.dart';

/// Describes [task] in one line: its title, its priority and whether it is
/// done, for example `Buy milk (high, done)`.
String summarizeTask(Task task) {
  final state = task.done ? 'done' : 'pending';
  return '${task.title} (${task.priority.name}, $state)';
}
