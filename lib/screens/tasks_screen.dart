import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';

import '../models/task.dart';
import '../state/task_list_controller.dart';
import '../widgets/add_task_sheet.dart';
import 'tasks_strings.dart';

/// The to-do list. It shows what [controller] holds and keeps no list of its
/// own, so the list survives closing and reopening the screen.
class TasksScreen extends StatelessWidget {
  const TasksScreen({super.key, required this.controller});

  final TaskListController controller;

  void _delete(BuildContext context, Task task) {
    final deleted = controller.delete(task.id);
    if (deleted == null) {
      return;
    }
    final messenger = ScaffoldMessenger.of(context);
    messenger.clearSnackBars();
    messenger.showSnackBar(
      SnackBar(
        content: const Text(TasksStrings.taskDeleted),
        // A snackbar with an action stays until closed unless told otherwise.
        persist: false,
        action: SnackBarAction(
          label: TasksStrings.undo,
          onPressed: () => controller.undoDelete(deleted),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(TasksStrings.title)),
      body: ListenableBuilder(
        listenable: controller,
        builder: (context, _) {
          final tasks = controller.visibleTasks;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _Header(controller: controller),
              _Toolbar(controller: controller),
              Expanded(
                child: tasks.isEmpty
                    ? Center(
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Text(
                            TasksStrings.emptyText(controller.filter),
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ),
                      )
                    : ListView.builder(
                        padding: const EdgeInsets.only(bottom: 88),
                        itemCount: tasks.length,
                        itemBuilder: (context, index) {
                          final task = tasks[index];
                          return _TaskRow(
                            key: ValueKey(task.id),
                            task: task,
                            onToggle: () => controller.toggle(task.id),
                            onDelete: () => _delete(context, task),
                          );
                        },
                      ),
              ),
            ],
          );
        },
      ),
      floatingActionButton: Semantics(
        label: TasksStrings.addSemantics,
        button: true,
        enabled: true,
        onTap: () => showAddTaskSheet(context, controller),
        excludeSemantics: true,
        child: FloatingActionButton.extended(
          onPressed: () => showAddTaskSheet(context, controller),
          icon: const Icon(Icons.add),
          label: const Text(TasksStrings.addButton),
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({required this.controller});

  final TaskListController controller;

  @override
  Widget build(BuildContext context) {
    final text = controller.doneCount == 0
        ? TasksStrings.header(controller.totalCount)
        : TasksStrings.headerOpen(controller.openCount, controller.totalCount);
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
      child: Text(text, style: Theme.of(context).textTheme.titleMedium),
    );
  }
}

class _Toolbar extends StatelessWidget {
  const _Toolbar({required this.controller});

  final TaskListController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Wrap(
              spacing: 8,
              runSpacing: 4,
              children: [
                for (final filter in TaskFilter.values)
                  Semantics(
                    label: TasksStrings.filterSemantics(filter),
                    button: true,
                    selected: filter == controller.filter,
                    onTap: () => controller.setFilter(filter),
                    excludeSemantics: true,
                    child: FilterChip(
                      label: Text(TasksStrings.filterLabel(filter)),
                      selected: filter == controller.filter,
                      onSelected: (_) => controller.setFilter(filter),
                    ),
                  ),
              ],
            ),
          ),
          PopupMenuButton<TaskSort>(
            tooltip: TasksStrings.sortSemantics,
            icon: const Icon(Icons.sort),
            initialValue: controller.sort,
            onSelected: controller.setSort,
            itemBuilder: (context) => [
              for (final sort in TaskSort.values)
                CheckedPopupMenuItem<TaskSort>(
                  value: sort,
                  checked: sort == controller.sort,
                  child: Text(TasksStrings.sortLabel(sort)),
                ),
            ],
          ),
        ],
      ),
    );
  }
}

class _TaskRow extends StatelessWidget {
  const _TaskRow({
    super.key,
    required this.task,
    required this.onToggle,
    required this.onDelete,
  });

  final Task task;
  final VoidCallback onToggle;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;
    final background = Container(
      color: scheme.errorContainer,
      alignment: Alignment.centerRight,
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: ExcludeSemantics(
        child: Icon(Icons.delete, color: scheme.onErrorContainer),
      ),
    );
    return Dismissible(
      key: ValueKey(task.id),
      direction: DismissDirection.endToStart,
      background: background,
      secondaryBackground: background,
      onDismissed: (_) => onDelete(),
      child: Semantics(
        container: true,
        customSemanticsActions: {
          const CustomSemanticsAction(label: TasksStrings.deleteAction):
              onDelete,
        },
        child: ListTile(
          leading: Semantics(
            label: TasksStrings.checkboxSemantics(task.title, task.done),
            checked: task.done,
            enabled: true,
            onTap: onToggle,
            excludeSemantics: true,
            child: Checkbox(value: task.done, onChanged: (_) => onToggle()),
          ),
          title: Text(
            task.title,
            style: theme.textTheme.bodyLarge?.copyWith(
              decoration: task.done ? TextDecoration.lineThrough : null,
            ),
          ),
          trailing: _PriorityBadge(priority: task.priority),
        ),
      ),
    );
  }
}

/// States the priority with its word, so the meaning is not in colour alone.
class _PriorityBadge extends StatelessWidget {
  const _PriorityBadge({required this.priority});

  final TaskPriority priority;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;
    return Semantics(
      label: TasksStrings.prioritySemantics(priority),
      container: true,
      excludeSemantics: true,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: scheme.secondaryContainer,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          child: Text(
            TasksStrings.priorityText(priority),
            style: theme.textTheme.labelMedium?.copyWith(
              color: scheme.onSecondaryContainer,
            ),
          ),
        ),
      ),
    );
  }
}
