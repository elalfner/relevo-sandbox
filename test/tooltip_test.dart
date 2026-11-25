// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:relevo_sandbox/main.dart';

void main() {
  Future<void> openApp(WidgetTester tester) async {
    await tester.pumpWidget(MyApp(clock: () => DateTime(2026, 1, 1, 9)));
  }

  group('Floating button tooltip', () {
    testWidgets('is Increment', (tester) async {
      await openApp(tester);

      final button = find.byType(FloatingActionButton);
      expect(button, findsOneWidget);
      expect(find.byTooltip('Increment'), findsOneWidget);
      expect(
        find.descendant(of: button, matching: find.byIcon(Icons.add)),
        findsOneWidget,
      );
      expect(tester.widget<FloatingActionButton>(button).tooltip, 'Increment');
    });
  });
}
