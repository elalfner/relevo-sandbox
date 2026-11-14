import 'package:flutter/widgets.dart';

import '../models/task.dart';
import '../screens/tasks_strings.dart';

/// Which tasks the list shows.
enum TaskFilter { all, open, done }

/// In which order the list shows them.
enum TaskSort { added, priority, title }

/// The longest title accepted, in user-perceived characters.
const int maxTitleLength = 60;

/// A deleted task and the place it had, kept to undo the delete.
class DeletedTask {
  const DeletedTask(this.task, this.index);

  final Task task;

  /// Position in the list in added order.
  final int index;
}

/// Holds the tasks, the filter and the sort, and the rules of the list.
class TaskListController extends ChangeNotifier {
  final List<Task> _tasks = [];
  int _nextId = 0;
  TaskFilter _filter = TaskFilter.all;
  TaskSort _sort = TaskSort.added;

  /// All the tasks in the order they were added.
  List<Task> get tasks => List.unmodifiable(_tasks);

  TaskFilter get filter => _filter;

  TaskSort get sort => _sort;

  int get totalCount => _tasks.length;

  int get openCount => _tasks.where((task) => !task.done).length;

  int get doneCount => totalCount - openCount;

  /// The tasks the list shows: filtered, then sorted. Sorts are stable.
  List<Task> get visibleTasks {
    final shown = _tasks.where((task) {
      switch (_filter) {
        case TaskFilter.all:
          return true;
        case TaskFilter.open:
          return !task.done;
        case TaskFilter.done:
          return task.done;
      }
    }).toList();
    switch (_sort) {
      case TaskSort.added:
        break;
      case TaskSort.priority:
        _stableSort(
          shown,
          (a, b) => a.priority.index.compareTo(b.priority.index),
        );
      case TaskSort.title:
        _stableSort(
          shown,
          (a, b) => a.title.toLowerCase().compareTo(b.title.toLowerCase()),
        );
    }
    return shown;
  }

  /// The error text for [title], or null when it can be added.
  String? validateTitle(String title) {
    final trimmed = title.trim();
    if (trimmed.isEmpty) {
      return TasksStrings.errorEmpty;
    }
    if (trimmed.characters.length > maxTitleLength) {
      return TasksStrings.errorTooLong;
    }
    final key = trimmed.toLowerCase();
    if (_tasks.any((task) => task.title.toLowerCase() == key)) {
      return TasksStrings.errorDuplicate;
    }
    return null;
  }

  /// Adds a task and returns null, or returns the validation error and adds
  /// nothing.
  String? add(String title, TaskPriority priority) {
    final error = validateTitle(title);
    if (error != null) {
      return error;
    }
    _tasks.add(Task(id: _nextId++, title: title.trim(), priority: priority));
    notifyListeners();
    return null;
  }

  void toggle(int id) {
    final index = _tasks.indexWhere((task) => task.id == id);
    if (index < 0) {
      return;
    }
    _tasks[index] = _tasks[index].copyWith(done: !_tasks[index].done);
    notifyListeners();
  }

  void setFilter(TaskFilter filter) {
    if (filter == _filter) {
      return;
    }
    _filter = filter;
    notifyListeners();
  }

  void setSort(TaskSort sort) {
    if (sort == _sort) {
      return;
    }
    _sort = sort;
    notifyListeners();
  }

  /// Removes the task and returns what [undoDelete] needs, or null when there
  /// is no such task.
  DeletedTask? delete(int id) {
    final index = _tasks.indexWhere((task) => task.id == id);
    if (index < 0) {
      return null;
    }
    final task = _tasks.removeAt(index);
    notifyListeners();
    return DeletedTask(task, index);
  }

  /// Puts a deleted task back at its former index (or at the end when the
  /// list became shorter). The duplicate check does not apply here.
  void undoDelete(DeletedTask deleted) {
    if (_tasks.any((task) => task.id == deleted.task.id)) {
      return;
    }
    final index = deleted.index.clamp(0, _tasks.length);
    _tasks.insert(index, deleted.task);
    notifyListeners();
  }

  static void _stableSort(List<Task> list, int Function(Task, Task) compare) {
    final indexed = list.asMap().entries.toList();
    indexed.sort((a, b) {
      final result = compare(a.value, b.value);
      return result != 0 ? result : a.key.compareTo(b.key);
    });
    for (var i = 0; i < indexed.length; i++) {
      list[i] = indexed[i].value;
    }
  }
}
