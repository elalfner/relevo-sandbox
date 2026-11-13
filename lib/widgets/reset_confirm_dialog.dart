import 'package:flutter/material.dart';

/// Asks the person to confirm resetting the counter.
///
/// Pops `true` on Confirm and `false` on Cancel.
class ResetConfirmDialog extends StatelessWidget {
  const ResetConfirmDialog({super.key, required this.count});

  static const String cancelLabel = 'Cancel';
  static const String confirmLabel = 'Confirm';

  /// The question shown for the given [count], the whole number.
  static String question(int count) => 'Reset the counter of $count?';

  final int count;

  /// Opens the dialog; a dismissed dialog counts as cancel (`false`).
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
      content: Text(question(count)),
      actions: [
        Semantics(
          label: cancelLabel,
          button: true,
          excludeSemantics: true,
          child: TextButton(
            key: const Key('reset-cancel-button'),
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text(cancelLabel),
          ),
        ),
        Semantics(
          label: confirmLabel,
          button: true,
          excludeSemantics: true,
          child: TextButton(
            key: const Key('reset-confirm-button'),
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text(confirmLabel),
          ),
        ),
      ],
    );
  }
}
