import 'package:flutter_test/flutter_test.dart';

import 'package:relevo_sandbox/models/settings_validation.dart';

void main() {
  group('validateName', () {
    test('1 character is refused, 2 and 30 are accepted, 31 is refused', () {
      expect(validateName('A'), nameErrorMessage);
      expect(validateName('Al'), isNull);
      expect(validateName('a' * 30), isNull);
      expect(validateName('a' * 31), nameErrorMessage);
    });

    test('only spaces or empty is refused', () {
      expect(validateName('     '), nameErrorMessage);
      expect(validateName(''), nameErrorMessage);
      expect(validateName(null), nameErrorMessage);
    });

    test('spaces at both ends do not count', () {
      expect(validateName('  A  '), nameErrorMessage);
      expect(validateName('  Al  '), isNull);
      expect(validateName(' ${'a' * 30} '), isNull);
    });

    test('the message is the one of the specification', () {
      expect(nameErrorMessage, 'Use 2 to 30 characters');
    });
  });

  group('validateEmail', () {
    test('accepts usual emails, with a plus sign too', () {
      expect(validateEmail('ana@example.com'), isNull);
      expect(validateEmail('ana+test@example.com'), isNull);
      expect(validateEmail('  ana@mail.example.org  '), isNull);
    });

    test('refuses emails without a domain dot, an at sign or a part', () {
      expect(validateEmail('ana@example'), emailErrorMessage);
      expect(validateEmail('ana.example.com'), emailErrorMessage);
      expect(validateEmail('@example.com'), emailErrorMessage);
      expect(validateEmail('ana@.com'), emailErrorMessage);
      expect(validateEmail('ana@example.'), emailErrorMessage);
      expect(validateEmail('a na@example.com'), emailErrorMessage);
      expect(validateEmail('a@b@example.com'), emailErrorMessage);
    });

    test('empty is refused', () {
      expect(validateEmail(''), emailErrorMessage);
      expect(validateEmail('   '), emailErrorMessage);
      expect(validateEmail(null), emailErrorMessage);
    });

    test('254 characters are accepted and 255 are refused', () {
      const suffix = '@example.com';
      final email254 = '${'a' * (254 - suffix.length)}$suffix';
      final email255 = '${'a' * (255 - suffix.length)}$suffix';
      expect(email254.length, 254);
      expect(email255.length, 255);
      expect(validateEmail(email254), isNull);
      expect(validateEmail(email255), emailErrorMessage);
    });

    test('the message is the one of the specification', () {
      expect(emailErrorMessage, 'Write a valid email');
    });
  });

  group('validateAge', () {
    test('12 is refused, 13 and 120 are accepted, 121 is refused', () {
      expect(validateAge('12'), ageErrorMessage);
      expect(validateAge('13'), isNull);
      expect(validateAge('120'), isNull);
      expect(validateAge('121'), ageErrorMessage);
    });

    test('text and decimals are refused', () {
      expect(validateAge('abc'), ageErrorMessage);
      expect(validateAge('30.5'), ageErrorMessage);
      expect(validateAge('-20'), ageErrorMessage);
      expect(validateAge('1e2'), ageErrorMessage);
    });

    test('empty is refused', () {
      expect(validateAge(''), ageErrorMessage);
      expect(validateAge('  '), ageErrorMessage);
      expect(validateAge(null), ageErrorMessage);
    });

    test('very long numbers are refused without failing', () {
      expect(validateAge('9' * 40), ageErrorMessage);
    });

    test('the message is the one of the specification', () {
      expect(ageErrorMessage, 'Age must be a whole number from 13 to 120');
    });
  });
}
