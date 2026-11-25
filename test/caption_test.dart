// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:relevo_sandbox/main.dart';

void main() {
  final caption = find.text('You have pushed the button this many times:');

  Future<void> openApp(WidgetTester tester) async {
    await tester.pumpWidget(MyApp(clock: () => DateTime(2026, 1, 1, 9)));
  }

  Future<void> tapIncrement(WidgetTester tester, int times) async {
    for (var i = 0; i < times; i++) {
      await tester.tap(find.byIcon(Icons.add));
      await tester.pump();
    }
  }

  group('Caption', () {
    testWidgets('is shown when the screen starts', (tester) async {
      await openApp(tester);

      expect(caption, findsOneWidget);
    });

    testWidgets('is still shown after a tap', (tester) async {
      await openApp(tester);
      await tapIncrement(tester, 1);

      expect(find.text('1'), findsOneWidget);
      expect(caption, findsOneWidget);
    });
  });
}
