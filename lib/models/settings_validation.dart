import 'package:flutter/widgets.dart';

/// Message for a name outside 2 to 30 characters.
const String nameErrorMessage = 'Use 2 to 30 characters';

/// Message for an email that is not valid.
const String emailErrorMessage = 'Write a valid email';

/// Message for an age that is not a whole number from 13 to 120.
const String ageErrorMessage = 'Age must be a whole number from 13 to 120';

const int _minNameLength = 2;
const int _maxNameLength = 30;
const int _maxEmailLength = 254;
const int _minAge = 13;
const int _maxAge = 120;

final RegExp _emailPattern = RegExp(r'^[^\s@]+@[^\s@.]+(\.[^\s@.]+)+$');
final RegExp _agePattern = RegExp(r'^[0-9]{1,3}$');

/// Returns null when [value] is a valid name, or the error message.
///
/// Spaces at both ends are ignored; the name must have 2 to 30 characters.
String? validateName(String? value) {
  final length = (value ?? '').trim().characters.length;
  if (length < _minNameLength || length > _maxNameLength) {
    return nameErrorMessage;
  }
  return null;
}

/// Returns null when [value] is a valid email, or the error message.
///
/// Spaces at both ends are ignored; the email has at most 254 characters.
String? validateEmail(String? value) {
  final email = (value ?? '').trim();
  if (email.length > _maxEmailLength || !_emailPattern.hasMatch(email)) {
    return emailErrorMessage;
  }
  return null;
}

/// Returns null when [value] is a whole number from 13 to 120, or the error
/// message.
String? validateAge(String? value) {
  final text = (value ?? '').trim();
  if (!_agePattern.hasMatch(text)) return ageErrorMessage;
  final age = int.parse(text);
  if (age < _minAge || age > _maxAge) return ageErrorMessage;
  return null;
}
