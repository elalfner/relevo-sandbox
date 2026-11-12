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

  group('Add 5 button', () {
    testWidgets('adds 5 to the counter and keeps the other texts working', (
      tester,
    ) async {
      await openApp(tester);
      await tapIncrement(tester, 2);

      expect(find.text('2'), findsOneWidget);
      expect(find.text('Add 5'), findsOneWidget);

      await tester.tap(find.byKey(const Key('add-five-button')));
      await tester.pump();

      expect(find.text('7'), findsOneWidget);
      expect(find.text('2'), findsNothing);
      expect(
        tester.widget<Text>(find.byKey(const Key('parity-text'))).data,
        'Odd',
      );
      expect(find.byKey(const Key('greeting-text')), findsOneWidget);
      expect(find.text('Good morning'), findsOneWidget);
    });
  });
}
