// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:relevo_sandbox/models/settings_validation.dart';
import 'package:relevo_sandbox/screens/settings_screen.dart';
import 'package:relevo_sandbox/screens/settings_strings.dart';
import 'package:relevo_sandbox/state/settings_controller.dart';

final Finder _nameField = find.widgetWithText(TextField, 'Name');
final Finder _emailField = find.widgetWithText(TextField, 'Email');
final Finder _ageField = find.widgetWithText(TextField, 'Age');
final Finder _saveButton = find.widgetWithText(FilledButton, 'Save');
final Finder _dialogTitle = find.text(SettingsStrings.discardTitle);

/// Opens the Settings screen on top of a home page, so back can pop it.
Future<SettingsController> pumpSettings(
  WidgetTester tester, [
  SettingsController? controller,
]) async {
  final c = controller ?? SettingsController();
  await tester.pumpWidget(
    ListenableBuilder(
      listenable: c,
      builder: (context, _) => MaterialApp(
        themeMode: c.themeMode,
        theme: ThemeData(),
        darkTheme: ThemeData.dark(),
        home: Builder(
          builder: (context) => Scaffold(
            body: Center(
              child: TextButton(
                onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute<void>(
                    builder: (_) => SettingsScreen(controller: c),
                  ),
                ),
                child: const Text('Open'),
              ),
            ),
          ),
        ),
      ),
    ),
  );
  await tester.tap(find.text('Open'));
  await tester.pumpAndSettle();
  return c;
}

Future<void> leaveField(WidgetTester tester) async {
  FocusManager.instance.primaryFocus?.unfocus();
  await tester.pump();
}

Future<void> typeAndLeave(
  WidgetTester tester,
  Finder field,
  String text,
) async {
  await tester.enterText(field, text);
  await leaveField(tester);
}

Future<void> fillValid(WidgetTester tester) async {
  await tester.enterText(_nameField, 'Ana');
  await tester.enterText(_emailField, 'ana@example.com');
  await tester.enterText(_ageField, '30');
  await tester.pump();
}

bool saveEnabled(WidgetTester tester) =>
    tester.widget<FilledButton>(_saveButton).onPressed != null;

Future<void> pressSystemBack(WidgetTester tester) async {
  await tester.binding.handlePopRoute();
  await tester.pumpAndSettle();
}

void main() {
  group('initial state', () {
    testWidgets('has empty fields, notifications on, System, Save off', (
      tester,
    ) async {
      await pumpSettings(tester);
      expect(tester.widget<TextField>(_nameField).controller!.text, isEmpty);
      expect(tester.widget<TextField>(_emailField).controller!.text, isEmpty);
      expect(tester.widget<TextField>(_ageField).controller!.text, isEmpty);
      expect(tester.widget<Switch>(find.byType(Switch)).value, isTrue);
      final theme = tester.widget<SegmentedButton<ThemeMode>>(
        find.byType(SegmentedButton<ThemeMode>),
      );
      expect(theme.selected, {ThemeMode.system});
      expect(saveEnabled(tester), isFalse);
      expect(find.text(nameErrorMessage), findsNothing);
      expect(find.text(emailErrorMessage), findsNothing);
      expect(find.text(ageErrorMessage), findsNothing);
    });
  });

  group('errors after leaving a field', () {
    testWidgets('no error while typing, name error after leaving', (
      tester,
    ) async {
      await pumpSettings(tester);
      await tester.enterText(_nameField, 'A');
      await tester.pump();
      expect(find.text(nameErrorMessage), findsNothing);
      await leaveField(tester);
      expect(find.text(nameErrorMessage), findsOneWidget);
    });

    testWidgets('a name of 31 characters shows the error', (tester) async {
      await pumpSettings(tester);
      await typeAndLeave(tester, _nameField, 'a' * 31);
      expect(find.text(nameErrorMessage), findsOneWidget);
    });

    testWidgets('names of 2 and 30 characters and spaces only', (tester) async {
      await pumpSettings(tester);
      await typeAndLeave(tester, _nameField, 'Al');
      expect(find.text(nameErrorMessage), findsNothing);
      await typeAndLeave(tester, _nameField, 'a' * 30);
      expect(find.text(nameErrorMessage), findsNothing);
      await typeAndLeave(tester, _nameField, '     ');
      expect(find.text(nameErrorMessage), findsOneWidget);
    });

    testWidgets('an invalid email shows the error, a plus sign is valid', (
      tester,
    ) async {
      await pumpSettings(tester);
      await typeAndLeave(tester, _emailField, 'ana@example');
      expect(find.text(emailErrorMessage), findsOneWidget);
      await typeAndLeave(tester, _emailField, 'ana+test@example.com');
      expect(find.text(emailErrorMessage), findsNothing);
    });

    testWidgets('an email of 254 characters is valid, 255 is not', (
      tester,
    ) async {
      await pumpSettings(tester);
      final tail = '@example.com';
      await typeAndLeave(
        tester,
        _emailField,
        '${'a' * (254 - tail.length)}$tail',
      );
      expect(find.text(emailErrorMessage), findsNothing);
      await typeAndLeave(
        tester,
        _emailField,
        '${'a' * (255 - tail.length)}$tail',
      );
      expect(find.text(emailErrorMessage), findsOneWidget);
    });

    testWidgets('ages 12, 121, abc and 30.5 show the error', (tester) async {
      await pumpSettings(tester);
      for (final value in ['12', '121', 'abc', '30.5']) {
        await typeAndLeave(tester, _ageField, value);
        expect(find.text(ageErrorMessage), findsOneWidget, reason: value);
      }
    });

    testWidgets('ages 13 and 120 are accepted', (tester) async {
      await pumpSettings(tester);
      for (final value in ['13', '120']) {
        await typeAndLeave(tester, _ageField, value);
        expect(find.text(ageErrorMessage), findsNothing, reason: value);
      }
    });
  });

  group('Save enabled state', () {
    testWidgets('is enabled once name, email and age are valid', (
      tester,
    ) async {
      await pumpSettings(tester);
      await tester.enterText(_nameField, 'Ana');
      await tester.enterText(_emailField, 'ana@example.com');
      await tester.pump();
      expect(saveEnabled(tester), isFalse);
      await tester.enterText(_ageField, '30');
      await tester.pump();
      expect(saveEnabled(tester), isTrue);
    });

    testWidgets('is disabled while a field is invalid', (tester) async {
      await pumpSettings(tester);
      await fillValid(tester);
      await tester.enterText(_ageField, '12');
      await tester.pump();
      expect(saveEnabled(tester), isFalse);
    });

    testWidgets('is disabled when the form matches the saved values', (
      tester,
    ) async {
      final controller = SettingsController()
        ..save(
          name: 'Ana',
          email: 'ana@example.com',
          age: '30',
          notifications: true,
        );
      await pumpSettings(tester, controller);
      await fillValid(tester);
      expect(saveEnabled(tester), isFalse);
      await tester.enterText(_nameField, 'Anna');
      await tester.pump();
      expect(saveEnabled(tester), isTrue);
      await tester.enterText(_nameField, 'Ana');
      await tester.pump();
      expect(saveEnabled(tester), isFalse);
    });

    testWidgets('changing only the switch is not valid without values', (
      tester,
    ) async {
      await pumpSettings(tester);
      await tester.tap(find.byType(Switch));
      await tester.pump();
      expect(saveEnabled(tester), isFalse);
    });
  });

  group('saving', () {
    testWidgets('shows a snackbar, disables Save and stays open', (
      tester,
    ) async {
      final controller = await pumpSettings(tester);
      await fillValid(tester);
      await tester.tap(_saveButton);
      await tester.pump();
      expect(find.text(SettingsStrings.saved), findsOneWidget);
      expect(saveEnabled(tester), isFalse);
      expect(find.byType(SettingsScreen), findsOneWidget);
      expect(controller.name, 'Ana');
      expect(controller.email, 'ana@example.com');
      expect(controller.age, '30');
    });

    testWidgets('trims the name', (tester) async {
      final controller = await pumpSettings(tester);
      await tester.enterText(_nameField, '  Ana  ');
      await tester.enterText(_emailField, 'ana@example.com');
      await tester.enterText(_ageField, '30');
      await tester.pump();
      await tester.tap(_saveButton);
      await tester.pump();
      expect(controller.name, 'Ana');
    });

    testWidgets('stores the notifications value', (tester) async {
      final controller = await pumpSettings(tester);
      await fillValid(tester);
      await tester.tap(find.byType(Switch));
      await tester.pump();
      await tester.tap(_saveButton);
      await tester.pump();
      expect(controller.notifications, isFalse);
    });
  });

  group('leaving the screen', () {
    testWidgets('system back with changes asks to discard', (tester) async {
      await pumpSettings(tester);
      await tester.enterText(_nameField, 'Ana');
      await tester.pump();
      await pressSystemBack(tester);
      expect(_dialogTitle, findsOneWidget);
      expect(find.text(SettingsStrings.keepEditing), findsOneWidget);
      expect(find.text(SettingsStrings.discard), findsOneWidget);
    });

    testWidgets('the app bar arrow with changes asks to discard', (
      tester,
    ) async {
      await pumpSettings(tester);
      await tester.tap(find.byType(Switch));
      await tester.pump();
      await tester.tap(find.byType(BackButton));
      await tester.pumpAndSettle();
      expect(_dialogTitle, findsOneWidget);
    });

    testWidgets('Keep editing leaves the form as it was', (tester) async {
      await pumpSettings(tester);
      await tester.enterText(_nameField, 'Ana');
      await tester.pump();
      await pressSystemBack(tester);
      await tester.tap(find.text(SettingsStrings.keepEditing));
      await tester.pumpAndSettle();
      expect(_dialogTitle, findsNothing);
      expect(find.byType(SettingsScreen), findsOneWidget);
      expect(tester.widget<TextField>(_nameField).controller!.text, 'Ana');
    });

    testWidgets('Discard closes the screen without saving', (tester) async {
      final controller = await pumpSettings(tester);
      await tester.enterText(_nameField, 'Ana');
      await tester.pump();
      await pressSystemBack(tester);
      await tester.tap(find.text(SettingsStrings.discard));
      await tester.pumpAndSettle();
      expect(find.byType(SettingsScreen), findsNothing);
      expect(controller.name, isEmpty);
    });

    testWidgets('back with no changes closes without the dialog', (
      tester,
    ) async {
      await pumpSettings(tester);
      await pressSystemBack(tester);
      expect(_dialogTitle, findsNothing);
      expect(find.byType(SettingsScreen), findsNothing);
    });

    testWidgets('back after saving closes without the dialog', (tester) async {
      await pumpSettings(tester);
      await fillValid(tester);
      await tester.tap(_saveButton);
      await tester.pump();
      await pressSystemBack(tester);
      expect(_dialogTitle, findsNothing);
      expect(find.byType(SettingsScreen), findsNothing);
    });

    testWidgets('a reverted change is clean, back asks nothing', (
      tester,
    ) async {
      await pumpSettings(tester);
      await tester.enterText(_nameField, 'Ana');
      await tester.pump();
      await tester.enterText(_nameField, '');
      await tester.pump();
      await pressSystemBack(tester);
      expect(_dialogTitle, findsNothing);
      expect(find.byType(SettingsScreen), findsNothing);
    });
  });

  group('reopening after a save', () {
    Future<SettingsController> saveAndReopen(WidgetTester tester) async {
      final controller = await pumpSettings(tester);
      await fillValid(tester);
      await tester.tap(find.byType(Switch));
      await tester.pump();
      await tester.tap(_saveButton);
      await tester.pump();
      await pressSystemBack(tester);
      expect(find.byType(SettingsScreen), findsNothing);
      await tester.tap(find.text('Open'));
      await tester.pumpAndSettle();
      return controller;
    }

    testWidgets('shows the saved values, Save disabled, no errors', (
      tester,
    ) async {
      await saveAndReopen(tester);
      expect(tester.widget<TextField>(_nameField).controller!.text, 'Ana');
      expect(
        tester.widget<TextField>(_emailField).controller!.text,
        'ana@example.com',
      );
      expect(tester.widget<TextField>(_ageField).controller!.text, '30');
      expect(tester.widget<Switch>(find.byType(Switch)).value, isFalse);
      expect(saveEnabled(tester), isFalse);
      expect(find.text(nameErrorMessage), findsNothing);
      expect(find.text(emailErrorMessage), findsNothing);
      expect(find.text(ageErrorMessage), findsNothing);
    });

    testWidgets('back on the untouched form closes without the dialog', (
      tester,
    ) async {
      await saveAndReopen(tester);
      await pressSystemBack(tester);
      expect(_dialogTitle, findsNothing);
      expect(find.byType(SettingsScreen), findsNothing);
    });

    testWidgets('editing enables Save and back asks to discard', (
      tester,
    ) async {
      await saveAndReopen(tester);
      await tester.enterText(_nameField, 'Anna');
      await tester.pump();
      expect(saveEnabled(tester), isTrue);
      await pressSystemBack(tester);
      expect(_dialogTitle, findsOneWidget);
    });
  });

  group('theme', () {
    testWidgets('choosing Dark applies at once, before Save', (tester) async {
      final controller = await pumpSettings(tester);
      await tester.tap(find.text(SettingsStrings.themeDark));
      await tester.pumpAndSettle();
      expect(controller.themeMode, ThemeMode.dark);
      final context = tester.element(find.byType(SettingsScreen));
      expect(Theme.of(context).brightness, Brightness.dark);
      expect(saveEnabled(tester), isFalse);
    });

    testWidgets('choosing System follows the phone again', (tester) async {
      final controller = await pumpSettings(tester);
      await tester.tap(find.text(SettingsStrings.themeLight));
      await tester.pumpAndSettle();
      await tester.tap(find.text(SettingsStrings.themeSystem));
      await tester.pumpAndSettle();
      expect(controller.themeMode, ThemeMode.system);
    });

    testWidgets('does not count as an unsaved change', (tester) async {
      await pumpSettings(tester);
      await tester.tap(find.text(SettingsStrings.themeDark));
      await tester.pumpAndSettle();
      await pressSystemBack(tester);
      expect(_dialogTitle, findsNothing);
      expect(find.byType(SettingsScreen), findsNothing);
    });

    testWidgets('discarding other changes keeps the theme', (tester) async {
      final controller = await pumpSettings(tester);
      await tester.tap(find.text(SettingsStrings.themeDark));
      await tester.pumpAndSettle();
      await tester.enterText(_nameField, 'Ana');
      await tester.pump();
      await pressSystemBack(tester);
      await tester.tap(find.text(SettingsStrings.discard));
      await tester.pumpAndSettle();
      expect(controller.themeMode, ThemeMode.dark);
    });
  });

  group('semantics', () {
    testWidgets('fields, switch, theme options and buttons have labels', (
      tester,
    ) async {
      final handle = tester.ensureSemantics();
      await pumpSettings(tester);
      for (final label in [
        'Name',
        'Email',
        'Age',
        'Notifications',
        'System',
        'Light',
        'Dark',
        'Save',
      ]) {
        expect(
          find.bySemanticsLabel(RegExp(label)),
          findsWidgets,
          reason: label,
        );
      }
      final name = tester.getSemantics(_nameField);
      expect(name.label, 'Name');
      expect(
        name.getSemanticsData().hasFlag(SemanticsFlag.isTextField),
        isTrue,
      );
      handle.dispose();
    });

    testWidgets('a shown error is part of the field semantics', (tester) async {
      final handle = tester.ensureSemantics();
      await pumpSettings(tester);
      await typeAndLeave(tester, _nameField, 'A');
      final node = tester.getSemantics(_nameField);
      expect(node.label, 'Name');
      expect(node.hint, nameErrorMessage);
      handle.dispose();
    });
  });
}
