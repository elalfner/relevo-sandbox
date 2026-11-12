import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:relevo_sandbox/main.dart';

void main() {
  final addTen = find.byKey(const Key('add-ten-button'));

  Future<void> openApp(WidgetTester tester) async {
    await tester.pumpWidget(MyApp(clock: () => DateTime(2026, 1, 1, 9)));
  }

  group('Add 10 button', () {
    testWidgets('adds 10 when the counter shows 0', (tester) async {
      await openApp(tester);

      await tester.tap(addTen);
      await tester.pump();

      expect(find.text('10'), findsOneWidget);
    });

    testWidgets('adds 10 when the counter shows 3', (tester) async {
      await openApp(tester);
      for (var i = 0; i < 3; i++) {
        await tester.tap(find.byIcon(Icons.add));
        await tester.pump();
      }

      await tester.tap(addTen);
      await tester.pump();

      expect(find.text('13'), findsOneWidget);
    });
  });
}
