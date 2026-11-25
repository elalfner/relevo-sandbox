// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:relevo_sandbox/main.dart';

void main() {
  Future<void> openApp(WidgetTester tester) async {
    await tester.pumpWidget(MyApp(clock: () => DateTime(2026, 1, 1, 9)));
  }

  group('Tooltip', () {
    testWidgets('Increment is found on the floating button', (tester) async {
      await openApp(tester);

      expect(find.byTooltip('Increment'), findsOneWidget);
      expect(
        find.ancestor(
          of: find.byTooltip('Increment'),
          matching: find.byType(FloatingActionButton),
        ),
        findsOneWidget,
      );
    });
  });
}
