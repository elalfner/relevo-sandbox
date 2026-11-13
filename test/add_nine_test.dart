import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:relevo_sandbox/main.dart';

void main() {
  final addNine = find.byKey(const Key('add-nine-button'));

  Future<void> openApp(WidgetTester tester) async {
    await tester.pumpWidget(MyApp(clock: () => DateTime(2026, 1, 1, 9)));
  }

  group('Add 9 button', () {
    testWidgets('adds 9 when the counter shows 0', (tester) async {
      await openApp(tester);

      await tester.tap(addNine);
      await tester.pump();

      expect(find.text('9'), findsOneWidget);
    });

    testWidgets('adds 9 when the counter shows 3', (tester) async {
      await openApp(tester);
      for (var i = 0; i < 3; i++) {
        await tester.tap(find.byIcon(Icons.add));
        await tester.pump();
      }

      await tester.tap(addNine);
      await tester.pump();

      expect(find.text('12'), findsOneWidget);
    });
  });
}
