import 'package:flutter/material.dart';

/// Builds the question asked before the counter [count] is reset.
String resetConfirmQuestion(int count) => 'Reset the counter of $count?';

/// Label of the button that keeps the counter as it is.
const String resetCancelLabel = 'Cancel';

/// Label of the button that resets the counter.
const String resetConfirmLabel = 'Confirm';

/// Dialog that asks the person to confirm resetting a counter of [count].
///
/// It pops `true` when the person confirms and `false` when they cancel.
class ResetConfirmDialog extends StatelessWidget {
  const ResetConfirmDialog({super.key, required this.count});

  /// The value of the counter that would be lost.
  final int count;

  /// Shows the dialog and returns whether the person confirmed. Dismissing it
  /// (back button or barrier) counts as cancelling.
  static Future<bool> show(BuildContext context, int count) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => ResetConfirmDialog(count: count),
    );
    return confirmed ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Text(
        resetConfirmQuestion(count),
        style: Theme.of(context).textTheme.bodyLarge,
      ),
      actions: [
        TextButton(
          key: const Key('reset-cancel-button'),
          onPressed: () => Navigator.of(context).pop(false),
          child: Semantics(
            label: resetCancelLabel,
            excludeSemantics: true,
            child: const Text(resetCancelLabel),
          ),
        ),
        TextButton(
          key: const Key('reset-confirm-button'),
          onPressed: () => Navigator.of(context).pop(true),
          child: Semantics(
            label: resetConfirmLabel,
            excludeSemantics: true,
            child: const Text(resetConfirmLabel),
          ),
        ),
      ],
    );
  }
}
