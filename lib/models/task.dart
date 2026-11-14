/// How important a task is; the declaration order is the order used when the
/// list is sorted by priority (High first).
enum TaskPriority { high, medium, low }

/// One line of the to-do list.
class Task {
  const Task({
    required this.id,
    required this.title,
    required this.priority,
    this.done = false,
  });

  /// Identifies the task for as long as the app runs; never reused.
  final int id;

  /// The trimmed title, at most 60 user-perceived characters.
  final String title;

  final TaskPriority priority;

  final bool done;

  Task copyWith({bool? done}) {
    return Task(
      id: id,
      title: title,
      priority: priority,
      done: done ?? this.done,
    );
  }
}
