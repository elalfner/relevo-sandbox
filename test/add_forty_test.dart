import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:relevo_sandbox/main.dart';

void main() {
  final addForty = find.byKey(const Key('add-forty-button'));

  Future<void> openApp(WidgetTester tester) async {
    await tester.pumpWidget(MyApp(clock: () => DateTime(2026, 1, 1, 9)));
  }

  group('Add 40 button', () {
    testWidgets('adds 40 when the counter shows 0', (tester) async {
      await openApp(tester);

      await tester.tap(addForty);
      await tester.pump();

      expect(find.text('40'), findsOneWidget);
    });

    testWidgets('adds 40 when the counter shows 3', (tester) async {
      await openApp(tester);
      for (var i = 0; i < 3; i++) {
        await tester.tap(find.byIcon(Icons.add));
        await tester.pump();
      }

      await tester.tap(addForty);
      await tester.pump();

      expect(find.text('43'), findsOneWidget);
    });
  });
}
