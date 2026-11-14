import '../models/task.dart';
import '../state/task_list_controller.dart';

/// Every visible text of the Tasks feature, written once and read by the
/// screens and by the tests.
class TasksStrings {
  const TasksStrings._();

  static const String homeButton = 'Tasks';
  static const String title = 'Tasks';

  static const String emptyAll = 'Nothing to do yet';
  static const String emptyOpen = 'No open tasks';
  static const String emptyDone = 'No done tasks';

  static const String errorEmpty = 'Write a title';
  static const String errorTooLong = 'At most 60 characters';
  static const String errorDuplicate = 'That task already exists';

  static const String taskDeleted = 'Task deleted';
  static const String undo = 'Undo';

  static const String addButton = 'Add';
  static const String save = 'Save';
  static const String titleFieldLabel = 'Title';
  static const String priorityLabel = 'Priority';

  static const String filterAll = 'All';
  static const String filterOpen = 'Open';
  static const String filterDone = 'Done';

  static const String sortAdded = 'Added';
  static const String sortPriority = 'Priority';
  static const String sortTitle = 'Title';

  static const String priorityHigh = 'High';
  static const String priorityMedium = 'Medium';
  static const String priorityLow = 'Low';

  // Semantics labels.
  static const String addSemantics = 'Add task';
  static const String saveSemantics = 'Save task';
  static const String sortSemantics = 'Sort tasks';
  static const String homeButtonSemantics = 'Open tasks';
  static const String deleteAction = 'Delete task';

  /// Header count: "0 tasks", "1 task", "5 tasks".
  static String header(int total) => total == 1 ? '1 task' : '$total tasks';

  /// Header once some task is done: "2 of 3 open".
  static String headerOpen(int open, int total) => '$open of $total open';

  static String filterLabel(TaskFilter filter) {
    switch (filter) {
      case TaskFilter.all:
        return filterAll;
      case TaskFilter.open:
        return filterOpen;
      case TaskFilter.done:
        return filterDone;
    }
  }

  static String filterSemantics(TaskFilter filter) =>
      'Show ${filterLabel(filter).toLowerCase()} tasks';

  static String emptyText(TaskFilter filter) {
    switch (filter) {
      case TaskFilter.all:
        return emptyAll;
      case TaskFilter.open:
        return emptyOpen;
      case TaskFilter.done:
        return emptyDone;
    }
  }

  static String sortLabel(TaskSort sort) {
    switch (sort) {
      case TaskSort.added:
        return sortAdded;
      case TaskSort.priority:
        return sortPriority;
      case TaskSort.title:
        return sortTitle;
    }
  }

  static String priorityText(TaskPriority priority) {
    switch (priority) {
      case TaskPriority.high:
        return priorityHigh;
      case TaskPriority.medium:
        return priorityMedium;
      case TaskPriority.low:
        return priorityLow;
    }
  }

  static String prioritySemantics(TaskPriority priority) =>
      '${priorityText(priority)} priority';

  static String checkboxSemantics(String title, bool done) =>
      done ? 'Mark $title as open' : 'Mark $title as done';
}
