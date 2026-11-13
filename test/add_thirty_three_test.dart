import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:relevo_sandbox/main.dart';

void main() {
  final addThirtyThree = find.byKey(const Key('add-thirty-three-button'));

  Future<void> openApp(WidgetTester tester) async {
    await tester.pumpWidget(MyApp(clock: () => DateTime(2026, 1, 1, 9)));
  }

  group('Add 33 button', () {
    testWidgets('is labelled "Add 33"', (tester) async {
      await openApp(tester);

      expect(
        find.descendant(of: addThirtyThree, matching: find.text('Add 33')),
        findsOneWidget,
      );
    });

    testWidgets('adds 33 when the counter shows 0', (tester) async {
      await openApp(tester);

      await tester.tap(addThirtyThree);
      await tester.pump();

      expect(find.text('33'), findsOneWidget);
    });

    testWidgets('adds 33 when the counter shows 3', (tester) async {
      await openApp(tester);
      for (var i = 0; i < 3; i++) {
        await tester.tap(find.byIcon(Icons.add));
        await tester.pump();
      }

      await tester.tap(addThirtyThree);
      await tester.pump();

      expect(find.text('36'), findsOneWidget);
    });
  });
}
