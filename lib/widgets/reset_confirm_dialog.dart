import 'package:flutter/material.dart';

/// Asks the person to confirm the reset of a counter that shows [count].
///
/// [show] completes with true only when the person taps Confirm. Cancel, the
/// back button and a tap outside the dialog complete with false, so the
/// counter is kept.
class ResetConfirmDialog extends StatelessWidget {
  const ResetConfirmDialog({super.key, required this.count});

  /// Label of the button that keeps the counter.
  static const String cancelLabel = 'Cancel';

  /// Label of the button that resets the counter.
  static const String confirmLabel = 'Confirm';

  /// The question asked for [count], e.g. "Reset the counter of 12?".
  static String questionFor(int count) => 'Reset the counter of $count?';

  /// The number of the counter this dialog asks about.
  final int count;

  /// Shows the dialog for [count]. Completes with true only when confirmed.
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
        questionFor(count),
        style: Theme.of(context).textTheme.bodyLarge,
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(false),
          child: const Text(cancelLabel),
        ),
        TextButton(
          onPressed: () => Navigator.of(context).pop(true),
          child: const Text(confirmLabel),
        ),
      ],
    );
  }
}
