import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:relevo_sandbox/main.dart';

void main() {
  final addEleven = find.byKey(const Key('add-eleven-button'));

  Future<void> openApp(WidgetTester tester) async {
    await tester.pumpWidget(MyApp(clock: () => DateTime(2026, 1, 1, 9)));
  }

  group('Add 11 button', () {
    testWidgets('adds 11 when the counter shows 0', (tester) async {
      await openApp(tester);

      await tester.tap(addEleven);
      await tester.pump();

      expect(find.text('11'), findsOneWidget);
    });

    testWidgets('adds 11 when the counter shows 3', (tester) async {
      await openApp(tester);
      for (var i = 0; i < 3; i++) {
        await tester.tap(find.byIcon(Icons.add));
        await tester.pump();
      }

      await tester.tap(addEleven);
      await tester.pump();

      expect(find.text('14'), findsOneWidget);
    });
  });
}
