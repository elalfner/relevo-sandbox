// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

/// Holds the saved settings and the theme mode, in memory only.
class SettingsController extends ChangeNotifier {
  String _name = '';
  String _email = '';
  String _age = '';
  bool _notifications = true;
  ThemeMode _themeMode = ThemeMode.system;

  /// The last saved name, trimmed. Empty until the first save.
  String get name => _name;

  /// The last saved email, trimmed. Empty until the first save.
  String get email => _email;

  /// The last saved age, trimmed. Empty until the first save.
  String get age => _age;

  /// Whether notifications are on. A stored value only.
  bool get notifications => _notifications;

  /// The theme of the whole app. It is not part of the saved form values.
  ThemeMode get themeMode => _themeMode;

  /// Stores the values, trimming the name, email and age.
  void save({
    required String name,
    required String email,
    required String age,
    required bool notifications,
  }) {
    _name = name.trim();
    _email = email.trim();
    _age = age.trim();
    _notifications = notifications;
    notifyListeners();
  }

  /// Whether the given form values differ from the saved ones.
  ///
  /// Text values are compared trimmed, so spaces at the ends are not a change.
  bool hasUnsavedChanges({
    required String name,
    required String email,
    required String age,
    required bool notifications,
  }) {
    return name.trim() != _name ||
        email.trim() != _email ||
        age.trim() != _age ||
        notifications != _notifications;
  }

  /// Applies [mode] to the whole app at once.
  void setThemeMode(ThemeMode mode) {
    if (mode == _themeMode) return;
    _themeMode = mode;
    notifyListeners();
  }
}
