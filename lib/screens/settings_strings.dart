// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

/// Every visible text of the Settings screen, written once and read by the
/// widgets and by the tests.
class SettingsStrings {
  const SettingsStrings._();

  static const String homeButton = 'Settings';
  static const String homeButtonSemantics = 'Open settings';
  static const String title = 'Settings';

  static const String nameLabel = 'Name';
  static const String emailLabel = 'Email';
  static const String ageLabel = 'Age';
  static const String notificationsLabel = 'Notifications';
  static const String themeLabel = 'Theme';
  static const String save = 'Save';
  static const String saved = 'Settings saved';

  static const String themeSystem = 'System';
  static const String themeLight = 'Light';
  static const String themeDark = 'Dark';

  static const String discardTitle = 'Discard your changes?';
  static const String keepEditing = 'Keep editing';
  static const String discard = 'Discard';

  /// The visible text and the semantics label of a theme option.
  static String themeText(ThemeMode mode) {
    switch (mode) {
      case ThemeMode.system:
        return themeSystem;
      case ThemeMode.light:
        return themeLight;
      case ThemeMode.dark:
        return themeDark;
    }
  }
}
