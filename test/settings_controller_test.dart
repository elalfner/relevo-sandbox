// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:relevo_sandbox/state/settings_controller.dart';

void main() {
  late SettingsController controller;

  setUp(() {
    controller = SettingsController();
  });

  tearDown(() {
    controller.dispose();
  });

  bool changed({
    String name = '',
    String email = '',
    String age = '',
    bool notifications = true,
  }) {
    return controller.hasUnsavedChanges(
      name: name,
      email: email,
      age: age,
      notifications: notifications,
    );
  }

  test('starts empty, with notifications on and the System theme', () {
    expect(controller.name, '');
    expect(controller.email, '');
    expect(controller.age, '');
    expect(controller.notifications, isTrue);
    expect(controller.themeMode, ThemeMode.system);
    expect(changed(), isFalse);
  });

  test('save trims the name, email and age', () {
    controller.save(
      name: '  Ana  ',
      email: ' ana@example.com ',
      age: ' 30 ',
      notifications: false,
    );
    expect(controller.name, 'Ana');
    expect(controller.email, 'ana@example.com');
    expect(controller.age, '30');
    expect(controller.notifications, isFalse);
  });

  test('save notifies the listeners', () {
    var calls = 0;
    controller.addListener(() => calls++);
    controller.save(
      name: 'Ana',
      email: 'ana@example.com',
      age: '30',
      notifications: true,
    );
    expect(calls, 1);
  });

  test('a changed value is unsaved, and clean again after reverting it', () {
    controller.save(
      name: 'Ana',
      email: 'ana@example.com',
      age: '30',
      notifications: true,
    );
    expect(changed(name: 'Ana', email: 'ana@example.com', age: '30'), isFalse);
    expect(changed(name: 'Anita', email: 'ana@example.com', age: '30'), isTrue);
    expect(changed(name: 'Ana', email: 'other@example.com', age: '30'), isTrue);
    expect(changed(name: 'Ana', email: 'ana@example.com', age: '31'), isTrue);
    expect(
      changed(
        name: 'Ana',
        email: 'ana@example.com',
        age: '30',
        notifications: false,
      ),
      isTrue,
    );
    expect(changed(name: 'Ana', email: 'ana@example.com', age: '30'), isFalse);
  });

  test('spaces at the ends of a value are not a change', () {
    controller.save(
      name: 'Ana',
      email: 'ana@example.com',
      age: '30',
      notifications: true,
    );
    expect(
      changed(name: '  Ana ', email: ' ana@example.com', age: '30 '),
      isFalse,
    );
  });

  test('the theme is independent of the saved values', () {
    controller.setThemeMode(ThemeMode.dark);
    expect(controller.themeMode, ThemeMode.dark);
    expect(changed(), isFalse);
    expect(controller.name, '');

    controller.save(
      name: 'Ana',
      email: 'ana@example.com',
      age: '30',
      notifications: true,
    );
    expect(controller.themeMode, ThemeMode.dark);

    controller.setThemeMode(ThemeMode.light);
    expect(controller.name, 'Ana');
    expect(changed(name: 'Ana', email: 'ana@example.com', age: '30'), isFalse);
  });

  test(
    'changing the theme notifies the listeners, the same theme does not',
    () {
      var calls = 0;
      controller.addListener(() => calls++);
      controller.setThemeMode(ThemeMode.dark);
      controller.setThemeMode(ThemeMode.dark);
      expect(calls, 1);
    },
  );
}
