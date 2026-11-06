import 'package:flutter/material.dart';

/// Asks the person to confirm before a counter of 10 or more is reset.
///
/// Shown with [ResetConfirmDialog.show], which completes with `true` only when
/// the person taps Confirm. Cancel, the back button and a tap outside the
/// dialog all complete with `false`.
class ResetConfirmDialog extends StatelessWidget {
  const ResetConfirmDialog({super.key, required this.count});

  /// The counter value that will be lost if the reset is confirmed.
  final int count;

  /// Visible label of the button that keeps the counter.
  static const String cancelLabel = 'Cancel';

  /// Visible label of the button that resets the counter.
  static const String confirmLabel = 'Confirm';

  /// Spoken name of the button that keeps the counter.
  static const String cancelSemanticsLabel = 'Cancel reset';

  /// Spoken name of the button that resets the counter.
  static const String confirmSemanticsLabel = 'Confirm reset';

  /// The question shown in the dialog, naming the whole [count].
  static String questionFor(int count) => 'Reset the counter of $count?';

  /// Shows the dialog for [count] and completes with whether the person
  /// confirmed the reset.
  static Future<bool> show(BuildContext context, {required int count}) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (_) => ResetConfirmDialog(count: count),
    );
    return confirmed ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Text(questionFor(count)),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(false),
          child: const Text(cancelLabel, semanticsLabel: cancelSemanticsLabel),
        ),
        TextButton(
          onPressed: () => Navigator.of(context).pop(true),
          child: const Text(
            confirmLabel,
            semanticsLabel: confirmSemanticsLabel,
          ),
        ),
      ],
    );
  }
}
