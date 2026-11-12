import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:relevo_sandbox/main.dart';

void main() {
  Future<void> openApp(WidgetTester tester) async {
    await tester.pumpWidget(MyApp(clock: () => DateTime(2026, 1, 1, 9)));
  }

  group('Add 20, Add 30 and Add 40 buttons', () {
    testWidgets('Add 20 adds 20 when the counter shows 0', (tester) async {
      await openApp(tester);

      await tester.tap(find.byKey(const Key('add-20-button')));
      await tester.pump();

      expect(find.text('20'), findsOneWidget);
    });

    testWidgets('Add 30 adds 30 when the counter shows 0', (tester) async {
      await openApp(tester);

      await tester.tap(find.byKey(const Key('add-30-button')));
      await tester.pump();

      expect(find.text('30'), findsOneWidget);
    });

    testWidgets('Add 40 adds 40 when the counter shows 0', (tester) async {
      await openApp(tester);

      await tester.tap(find.byKey(const Key('add-40-button')));
      await tester.pump();

      expect(find.text('40'), findsOneWidget);
    });
  });

  group('existing behaviour', () {
    testWidgets('Add 10 adds 10 and keeps the greeting', (tester) async {
      await openApp(tester);

      await tester.tap(find.byKey(const Key('add-ten-button')));
      await tester.pump();

      expect(find.text('10'), findsOneWidget);
      expect(find.byKey(const Key('greeting-text')), findsOneWidget);
      expect(find.text('Good morning'), findsOneWidget);
    });
  });
}
