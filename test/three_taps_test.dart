// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:relevo_sandbox/main.dart';

void main() {
  Future<void> openApp(WidgetTester tester) async {
    await tester.pumpWidget(MyApp(clock: () => DateTime(2026, 1, 1, 9)));
  }

  Future<void> tapIncrement(WidgetTester tester, int times) async {
    for (var i = 0; i < times; i++) {
      await tester.tap(find.byIcon(Icons.add));
      await tester.pump();
    }
  }

  group('Three taps', () {
    testWidgets('the counter shows 3 after three taps', (tester) async {
      await openApp(tester);
      expect(find.text('0'), findsOneWidget);

      await tapIncrement(tester, 3);

      expect(find.text('3'), findsOneWidget);
      expect(find.text('0'), findsNothing);
    });
  });
}
