import 'package:flutter/material.dart';

/// Asks the person to confirm a reset of a counter that holds [count].
///
/// Completes with true when the person confirms and with false when they
/// cancel. Dismissing the dialog with the back button completes with null,
/// which is not a confirmation.
class ResetConfirmDialog extends StatelessWidget {
  const ResetConfirmDialog({super.key, required this.count});

  /// Counters at or above this value ask for confirmation before a reset.
  static const int threshold = 10;

  static const String cancelLabel = 'Cancel';
  static const String confirmLabel = 'Confirm';

  /// The question naming the count that a reset would lose.
  static String questionFor(int count) => 'Reset the counter of $count?';

  /// Opens the dialog for [count] and completes with the answer: true when
  /// confirmed, false when cancelled, null when dismissed.
  static Future<bool?> show(BuildContext context, {required int count}) {
    return showDialog<bool>(
      context: context,
      builder: (_) => ResetConfirmDialog(count: count),
    );
  }

  /// The counter value the question names.
  final int count;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Text(
        questionFor(count),
        style: Theme.of(context).textTheme.bodyLarge,
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(false),
          child: Semantics(
            label: cancelLabel,
            excludeSemantics: true,
            child: Text(cancelLabel),
          ),
        ),
        TextButton(
          onPressed: () => Navigator.of(context).pop(true),
          child: Semantics(
            label: confirmLabel,
            excludeSemantics: true,
            child: Text(confirmLabel),
          ),
        ),
      ],
    );
  }
}
