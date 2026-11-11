import 'package:flutter/material.dart';

/// Asks the person to confirm a reset of [count]. Pops true on Confirm and
/// false on Cancel; a dismissal (back button, tap outside) pops null.
class ResetConfirmDialog extends StatelessWidget {
  const ResetConfirmDialog({super.key, required this.count});

  /// Start of the question; the dialog adds the count and a question mark.
  static const String questionPrefix = 'Reset the counter of';
  static const String confirmLabel = 'Confirm';
  static const String cancelLabel = 'Cancel';
  static const String confirmSemanticsLabel = 'Confirm reset';
  static const String cancelSemanticsLabel = 'Cancel reset';

  /// The question for [count], for example "Reset the counter of 12?".
  static String questionFor(int count) => '$questionPrefix $count?';

  /// The counter value the person is asked to reset.
  final int count;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Text(questionFor(count)),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(false),
          child: Semantics(
            label: cancelSemanticsLabel,
            excludeSemantics: true,
            child: const Text(cancelLabel),
          ),
        ),
        TextButton(
          onPressed: () => Navigator.of(context).pop(true),
          child: Semantics(
            label: confirmSemanticsLabel,
            excludeSemantics: true,
            child: const Text(confirmLabel),
          ),
        ),
      ],
    );
  }
}
