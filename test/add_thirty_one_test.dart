import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:relevo_sandbox/main.dart';

void main() {
  final addThirtyOne = find.byKey(const Key('add-thirty-one-button'));

  Future<void> openApp(WidgetTester tester) async {
    await tester.pumpWidget(MyApp(clock: () => DateTime(2026, 1, 1, 9)));
  }

  group('Add 31 button', () {
    testWidgets('is labelled "Add 31"', (tester) async {
      await openApp(tester);

      expect(
        find.descendant(of: addThirtyOne, matching: find.text('Add 31')),
        findsOneWidget,
      );
    });

    testWidgets('adds 31 when the counter shows 0', (tester) async {
      await openApp(tester);

      await tester.tap(addThirtyOne);
      await tester.pump();

      expect(find.text('31'), findsOneWidget);
    });

    testWidgets('adds 31 when the counter shows 3', (tester) async {
      await openApp(tester);
      for (var i = 0; i < 3; i++) {
        await tester.tap(find.byIcon(Icons.add));
        await tester.pump();
      }

      await tester.tap(addThirtyOne);
      await tester.pump();

      expect(find.text('34'), findsOneWidget);
    });
  });
}
