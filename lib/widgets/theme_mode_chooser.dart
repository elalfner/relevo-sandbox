// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

import '../screens/settings_strings.dart';

/// The choice of System, Light or Dark. Choosing calls [onChanged] at once.
class ThemeModeChooser extends StatelessWidget {
  const ThemeModeChooser({
    super.key,
    required this.mode,
    required this.onChanged,
  });

  final ThemeMode mode;
  final ValueChanged<ThemeMode> onChanged;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      container: true,
      label: SettingsStrings.themeLabel,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            SettingsStrings.themeLabel,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 8),
          SizedBox(
            width: double.infinity,
            child: SegmentedButton<ThemeMode>(
              showSelectedIcon: true,
              segments: [
                for (final option in ThemeMode.values)
                  ButtonSegment<ThemeMode>(
                    value: option,
                    label: Text(SettingsStrings.themeText(option)),
                  ),
              ],
              selected: {mode},
              onSelectionChanged: (selection) => onChanged(selection.first),
            ),
          ),
        ],
      ),
    );
  }
}
