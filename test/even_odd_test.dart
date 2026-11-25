// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:relevo_sandbox/main.dart';

void main() {
  final label = find.byKey(const Key('parity-text'));

  Future<void> openApp(WidgetTester tester) async {
    await tester.pumpWidget(MyApp(clock: () => DateTime(2026, 1, 1, 9)));
  }

  Future<void> tapIncrement(WidgetTester tester) async {
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();
  }

  group('Even and Odd label', () {
    testWidgets('reads Even at 0, Odd at 1 and Even at 2', (tester) async {
      await openApp(tester);

      expect(find.text('0'), findsOneWidget);
      expect(label, findsOneWidget);
      expect(tester.widget<Text>(label).data, 'Even');

      await tapIncrement(tester);

      expect(find.text('1'), findsOneWidget);
      expect(tester.widget<Text>(label).data, 'Odd');

      await tapIncrement(tester);

      expect(find.text('2'), findsOneWidget);
      expect(tester.widget<Text>(label).data, 'Even');
    });
  });
}
