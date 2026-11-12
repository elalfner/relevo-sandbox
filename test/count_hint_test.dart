import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:relevo_sandbox/main.dart';

void main() {
  final hint = find.byKey(const Key('count-hint'));

  group('Counter hint text', () {
    testWidgets('is visible when the home screen opens', (tester) async {
      await tester.pumpWidget(const MyApp());

      expect(find.text('Tap the button to count'), findsOneWidget);
      expect(hint.hitTestable(), findsOneWidget);
    });

    testWidgets('is still visible after tapping the increment button', (
      tester,
    ) async {
      await tester.pumpWidget(const MyApp());

      await tester.tap(find.byIcon(Icons.add));
      await tester.pump();

      expect(find.text('1'), findsOneWidget);
      expect(find.text('Tap the button to count'), findsOneWidget);
      expect(hint.hitTestable(), findsOneWidget);
    });
  });
}
