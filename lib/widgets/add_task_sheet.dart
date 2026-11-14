// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

import '../models/task.dart';
import '../screens/tasks_strings.dart';
import '../state/task_list_controller.dart';

/// Opens the bottom sheet that adds a task to [controller]. It closes when the
/// task is added and stays open while the title has an error.
Future<void> showAddTaskSheet(
  BuildContext context,
  TaskListController controller,
) {
  return showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    showDragHandle: true,
    builder: (_) => AddTaskSheet(controller: controller),
  );
}

/// The form of the bottom sheet: a title, a priority and a Save button.
class AddTaskSheet extends StatefulWidget {
  const AddTaskSheet({super.key, required this.controller});

  final TaskListController controller;

  @override
  State<AddTaskSheet> createState() => _AddTaskSheetState();
}

class _AddTaskSheetState extends State<AddTaskSheet> {
  final TextEditingController _title = TextEditingController();
  TaskPriority _priority = TaskPriority.medium;
  String? _error;

  @override
  void dispose() {
    _title.dispose();
    super.dispose();
  }

  void _onChanged(String value) {
    final tooLong = value.trim().characters.length > maxTitleLength;
    setState(() => _error = tooLong ? TasksStrings.errorTooLong : null);
  }

  void _save() {
    final error = widget.controller.add(_title.text, _priority);
    if (error == null) {
      Navigator.of(context).pop();
    } else {
      setState(() => _error = error);
    }
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(
        16,
        0,
        16,
        16 + MediaQuery.viewInsetsOf(context).bottom,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            controller: _title,
            autofocus: true,
            textInputAction: TextInputAction.done,
            onChanged: _onChanged,
            onSubmitted: (_) => _save(),
            decoration: InputDecoration(
              labelText: TasksStrings.titleFieldLabel,
              errorText: _error,
            ),
          ),
          const SizedBox(height: 16),
          Text(TasksStrings.priorityLabel, style: textTheme.titleSmall),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              for (final priority in TaskPriority.values)
                Semantics(
                  label: TasksStrings.prioritySemantics(priority),
                  button: true,
                  selected: priority == _priority,
                  onTap: () => setState(() => _priority = priority),
                  excludeSemantics: true,
                  child: ChoiceChip(
                    label: Text(TasksStrings.priorityText(priority)),
                    selected: priority == _priority,
                    onSelected: (_) => setState(() => _priority = priority),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 16),
          Align(
            alignment: Alignment.centerRight,
            child: Semantics(
              label: TasksStrings.saveSemantics,
              button: true,
              enabled: true,
              onTap: _save,
              excludeSemantics: true,
              child: FilledButton(
                onPressed: _save,
                child: const Text(TasksStrings.save),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
