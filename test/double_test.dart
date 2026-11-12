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

  group('Double button', () {
    testWidgets('doubles the counter and keeps the other texts working', (
      tester,
    ) async {
      await openApp(tester);
      await tapIncrement(tester, 6);

      expect(find.text('6'), findsOneWidget);
      expect(find.text('Double'), findsOneWidget);

      await tester.tap(find.byKey(const Key('double-button')));
      await tester.pump();

      expect(find.text('12'), findsOneWidget);
      expect(find.text('6'), findsNothing);
      expect(
        tester.widget<Text>(find.byKey(const Key('parity-text'))).data,
        'Even',
      );
      expect(find.byKey(const Key('greeting-text')), findsOneWidget);
      expect(find.text('Good morning'), findsOneWidget);
    });
  });
}
