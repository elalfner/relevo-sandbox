// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:relevo_sandbox/main.dart';
import 'package:relevo_sandbox/screens/settings_screen.dart';
import 'package:relevo_sandbox/screens/settings_strings.dart';

void main() {
  final greeting = find.byKey(const Key('greeting-text'));
  final settingsButton = find.byKey(const Key('settings-button'));
  final nameField = find.widgetWithText(TextField, SettingsStrings.nameLabel);
  final emailField = find.widgetWithText(TextField, SettingsStrings.emailLabel);
  final ageField = find.widgetWithText(TextField, SettingsStrings.ageLabel);
  final saveButton = find.widgetWithText(FilledButton, SettingsStrings.save);

  late DateTime now;

  Future<void> openApp(WidgetTester tester, int hour) async {
    now = DateTime(2026, 1, 1, hour);
    await tester.pumpWidget(MyApp(clock: () => now));
  }

  Future<void> openSettings(WidgetTester tester) async {
    await tester.tap(settingsButton);
    await tester.pumpAndSettle();
  }

  Future<void> saveValues(WidgetTester tester, String name) async {
    await tester.enterText(nameField, name);
    await tester.enterText(emailField, 'ana@example.com');
    await tester.enterText(ageField, '30');
    await tester.pump();
    await tester.tap(saveButton);
    await tester.pumpAndSettle();
  }

  Future<void> goBack(WidgetTester tester) async {
    await tester.binding.handlePopRoute();
    await tester.pumpAndSettle();
  }

  Brightness homeBrightness(WidgetTester tester) =>
      Theme.of(tester.element(greeting)).brightness;

  Brightness settingsBrightness(WidgetTester tester) =>
      Theme.of(tester.element(find.byType(SettingsScreen))).brightness;

  group('Settings button', () {
    testWidgets('opens the Settings screen with its initial state', (
      tester,
    ) async {
      await openApp(tester, 9);
      expect(settingsButton, findsOneWidget);
      expect(
        find.bySemanticsLabel(SettingsStrings.homeButtonSemantics),
        findsOneWidget,
      );

      await openSettings(tester);

      expect(find.byType(SettingsScreen), findsOneWidget);
      expect(tester.widget<TextField>(nameField).controller!.text, isEmpty);
      expect(tester.widget<FilledButton>(saveButton).onPressed, isNull);
    });

    testWidgets('back returns to the home screen', (tester) async {
      await openApp(tester, 9);
      await openSettings(tester);
      await goBack(tester);

      expect(find.byType(SettingsScreen), findsNothing);
      expect(greeting, findsOneWidget);
    });
  });

  group('Theme', () {
    testWidgets('Dark makes both screens dark before Save', (tester) async {
      await openApp(tester, 9);
      await openSettings(tester);
      expect(settingsBrightness(tester), Brightness.light);

      await tester.tap(find.text(SettingsStrings.themeDark));
      await tester.pumpAndSettle();

      expect(settingsBrightness(tester), Brightness.dark);
      expect(find.byType(SettingsScreen), findsOneWidget);
      await goBack(tester);
      expect(homeBrightness(tester), Brightness.dark);
    });

    testWidgets('System follows the phone', (tester) async {
      tester.platformDispatcher.platformBrightnessTestValue = Brightness.dark;
      addTearDown(tester.platformDispatcher.clearPlatformBrightnessTestValue);
      await openApp(tester, 9);
      expect(homeBrightness(tester), Brightness.dark);

      await openSettings(tester);
      await tester.tap(find.text(SettingsStrings.themeLight));
      await tester.pumpAndSettle();
      expect(settingsBrightness(tester), Brightness.light);

      await tester.tap(find.text(SettingsStrings.themeSystem));
      await tester.pumpAndSettle();
      expect(settingsBrightness(tester), Brightness.dark);

      tester.platformDispatcher.platformBrightnessTestValue = Brightness.light;
      await tester.pumpAndSettle();
      expect(settingsBrightness(tester), Brightness.light);
      await goBack(tester);
      expect(homeBrightness(tester), Brightness.light);
    });

    testWidgets('Discard keeps the chosen theme', (tester) async {
      await openApp(tester, 9);
      await openSettings(tester);
      await tester.tap(find.text(SettingsStrings.themeDark));
      await tester.pumpAndSettle();
      await tester.enterText(nameField, 'Ana');
      await tester.pump();

      await goBack(tester);
      expect(find.text(SettingsStrings.discardTitle), findsOneWidget);
      await tester.tap(find.text(SettingsStrings.discard));
      await tester.pumpAndSettle();

      expect(find.byType(SettingsScreen), findsNothing);
      expect(homeBrightness(tester), Brightness.dark);
      expect(tester.widget<Text>(greeting).data, 'Good morning');
    });
  });

  group('Greeting with the saved name', () {
    testWidgets('shows the name after a comma', (tester) async {
      await openApp(tester, 9);
      await openSettings(tester);
      await saveValues(tester, 'Ana');
      await goBack(tester);

      expect(tester.widget<Text>(greeting).data, 'Good morning, Ana');
    });

    testWidgets('reads as before without a name', (tester) async {
      await openApp(tester, 9);
      expect(tester.widget<Text>(greeting).data, 'Good morning');
    });

    final limits = <String, (int, String)>{
      '05:00': (5, 'Good morning, Ana'),
      '11:00': (11, 'Good morning, Ana'),
      '12:00': (12, 'Good afternoon, Ana'),
      '18:00': (18, 'Good evening, Ana'),
    };
    limits.forEach((name, c) {
      testWidgets('keeps the time slot limits at $name', (tester) async {
        await openApp(tester, c.$1);
        await openSettings(tester);
        await saveValues(tester, 'Ana');
        await goBack(tester);

        expect(tester.widget<Text>(greeting).data, c.$2);
      });
    });

    testWidgets('shows the trimmed name', (tester) async {
      await openApp(tester, 9);
      await openSettings(tester);
      await saveValues(tester, '  Ana  ');
      await goBack(tester);

      expect(tester.widget<Text>(greeting).data, 'Good morning, Ana');
    });

    testWidgets('a new name changes only the name, not the time slot', (
      tester,
    ) async {
      await openApp(tester, 9);
      await openSettings(tester);
      await saveValues(tester, 'Ana');
      await goBack(tester);

      now = DateTime(2026, 1, 1, 20);
      await openSettings(tester);
      await saveValues(tester, 'Marta');
      await goBack(tester);

      expect(tester.widget<Text>(greeting).data, 'Good morning, Marta');
    });
  });
}
