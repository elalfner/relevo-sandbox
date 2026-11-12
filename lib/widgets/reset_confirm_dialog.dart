import 'package:flutter/material.dart';

/// Counters at or above this value ask for confirmation before a reset.
const int resetConfirmThreshold = 10;

/// Label of the button that keeps the counter.
const String resetCancelLabel = 'Cancel';

/// Label of the button that resets the counter.
const String resetConfirmLabel = 'Confirm';

/// Question shown for a counter of [count].
String resetConfirmQuestion(int count) => 'Reset the counter of $count?';

/// Dialog that asks whether to reset a counter of [count].
///
/// It pops `true` on Confirm and `false` on Cancel. Dismissing it with the
/// back button pops `null`, which callers must treat as not confirmed.
class ResetConfirmDialog extends StatelessWidget {
  const ResetConfirmDialog({super.key, required this.count});

  final int count;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Text(
        resetConfirmQuestion(count),
        style: Theme.of(context).textTheme.bodyLarge,
      ),
      actions: [
        Semantics(
          label: resetCancelLabel,
          excludeSemantics: true,
          child: TextButton(
            key: const Key('reset-cancel-button'),
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text(resetCancelLabel),
          ),
        ),
        Semantics(
          label: resetConfirmLabel,
          excludeSemantics: true,
          child: TextButton(
            key: const Key('reset-confirm-button'),
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text(resetConfirmLabel),
          ),
        ),
      ],
    );
  }
}
