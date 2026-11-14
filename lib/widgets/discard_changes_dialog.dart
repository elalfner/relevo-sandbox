// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

import '../screens/settings_strings.dart';

/// Asks whether to throw away the unsaved changes. Completes with true when
/// the person taps Discard and with false for Keep editing or a tap outside.
Future<bool> showDiscardChangesDialog(BuildContext context) async {
  final discard = await showDialog<bool>(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text(SettingsStrings.discardTitle),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(false),
          child: const Text(SettingsStrings.keepEditing),
        ),
        TextButton(
          onPressed: () => Navigator.of(context).pop(true),
          child: const Text(SettingsStrings.discard),
        ),
      ],
    ),
  );
  return discard ?? false;
}
