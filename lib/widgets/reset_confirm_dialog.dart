import 'package:flutter/material.dart';

/// Dialog that asks the person to confirm resetting a counter, naming the
/// count that would be lost.
class ResetConfirmDialog extends StatelessWidget {
  const ResetConfirmDialog({super.key, required this.count});

  /// Label of the button that keeps the counter.
  static const String cancelLabel = 'Cancel';

  /// Label of the button that resets the counter.
  static const String confirmLabel = 'Confirm';

  /// Accessible name of the Cancel button.
  static const String cancelSemanticsLabel = 'Cancel reset';

  /// Accessible name of the Confirm button.
  static const String confirmSemanticsLabel = 'Confirm reset';

  /// The count the person is about to lose.
  final int count;

  /// The question shown for [count].
  static String question(int count) => 'Reset the counter of $count?';

  /// Shows the dialog for [count]. Completes with true only when the person
  /// taps Confirm; Cancel, the back button and a tap outside give false.
  static Future<bool> show(BuildContext context, int count) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (_) => ResetConfirmDialog(count: count),
    );
    return confirmed ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Text(
        question(count),
        key: const Key('reset-confirm-question'),
        style: Theme.of(context).textTheme.titleMedium,
      ),
      actions: [
        Semantics(
          label: cancelSemanticsLabel,
          excludeSemantics: true,
          button: true,
          child: TextButton(
            key: const Key('reset-cancel-button'),
            style: TextButton.styleFrom(minimumSize: const Size(48, 48)),
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text(cancelLabel),
          ),
        ),
        Semantics(
          label: confirmSemanticsLabel,
          excludeSemantics: true,
          button: true,
          child: TextButton(
            key: const Key('reset-confirm-button'),
            style: TextButton.styleFrom(minimumSize: const Size(48, 48)),
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text(confirmLabel),
          ),
        ),
      ],
    );
  }
}
