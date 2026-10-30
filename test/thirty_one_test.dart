import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:relevo_sandbox/main.dart';

void main() {
  final message = find.byKey(const Key('thirty-one-text'));

  Future<void> openApp(WidgetTester tester) async {
    await tester.pumpWidget(MyApp(clock: () => DateTime(2026, 1, 1, 9)));
  }

  Future<void> tapIncrement(WidgetTester tester, int times) async {
    for (var i = 0; i < times; i++) {
      await tester.tap(find.byIcon(Icons.add));
      await tester.pump();
    }
  }

  group('Thirty-one message', () {
    testWidgets('is not shown when the counter starts at 0', (tester) async {
      await openApp(tester);

      expect(find.text('0'), findsOneWidget);
      expect(find.text('Thirty-one!'), findsNothing);
      expect(message, findsNothing);
    });

    testWidgets('is shown under the counter when it shows 31', (tester) async {
      await openApp(tester);
      await tapIncrement(tester, 31);

      expect(find.text('31'), findsOneWidget);
      expect(find.text('Thirty-one!'), findsOneWidget);
      expect(message, findsOneWidget);
      expect(
        tester.getTopLeft(message).dy,
        greaterThanOrEqualTo(tester.getBottomLeft(find.text('31')).dy),
      );
    });

    testWidgets('is not shown just before 31', (tester) async {
      await openApp(tester);
      await tapIncrement(tester, 30);

      expect(find.text('30'), findsOneWidget);
      expect(message, findsNothing);
    });

    testWidgets('disappears when the counter goes from 31 to 32', (
      tester,
    ) async {
      await openApp(tester);
      await tapIncrement(tester, 31);
      expect(message, findsOneWidget);

      await tapIncrement(tester, 1);

      expect(find.text('32'), findsOneWidget);
      expect(find.text('Thirty-one!'), findsNothing);
      expect(message, findsNothing);
    });

    testWidgets('disappears when the counter is reset from 31', (tester) async {
      await openApp(tester);
      await tapIncrement(tester, 31);
      expect(message, findsOneWidget);

      await tester.tap(find.byKey(const Key('reset-button')));
      await tester.pump();

      expect(find.text('0'), findsOneWidget);
      expect(message, findsNothing);
    });
  });
}
