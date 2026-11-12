import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:relevo_sandbox/main.dart';

void main() {
  final hint = find.byKey(const Key('hint-text'));

  Future<void> openApp(WidgetTester tester) async {
    await tester.pumpWidget(MyApp(clock: () => DateTime(2026, 1, 1, 9)));
  }

  group('Hint text', () {
    testWidgets('is visible when the home screen opens', (tester) async {
      await openApp(tester);

      expect(find.text('Tap the button to count'), findsOneWidget);
      expect(hint, findsOneWidget);
      expect(
        tester.getTopLeft(hint).dy,
        greaterThanOrEqualTo(tester.getBottomLeft(find.text('0')).dy),
      );
    });

    testWidgets('is still visible after the counter changes', (tester) async {
      await openApp(tester);

      await tester.tap(find.byIcon(Icons.add));
      await tester.pump();

      expect(find.text('1'), findsOneWidget);
      expect(find.text('Tap the button to count'), findsOneWidget);
      expect(hint, findsOneWidget);
    });
  });
}
