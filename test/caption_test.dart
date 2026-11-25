// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:relevo_sandbox/main.dart';

void main() {
  const caption = 'You have pushed the button this many times:';

  Future<void> openApp(WidgetTester tester) async {
    await tester.pumpWidget(MyApp(clock: () => DateTime(2026, 1, 1, 9)));
  }

  group('Caption', () {
    testWidgets('is shown at the start', (tester) async {
      await openApp(tester);

      expect(find.text(caption), findsOneWidget);
    });

    testWidgets('is shown after a tap', (tester) async {
      await openApp(tester);

      await tester.tap(find.byIcon(Icons.add));
      await tester.pump();

      expect(find.text('1'), findsOneWidget);
      expect(find.text(caption), findsOneWidget);
    });
  });
}
