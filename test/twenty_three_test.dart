import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:relevo_sandbox/main.dart';

void main() {
  final message = find.byKey(const Key('twenty-three-text'));

  Future<void> tapAdd(WidgetTester tester, int times) async {
    for (var i = 0; i < times; i++) {
      await tester.tap(find.byIcon(Icons.add));
    }
    await tester.pump();
  }

  group('Message at twenty-three', () {
    testWidgets('is visible under the counter when the counter is 23', (
      tester,
    ) async {
      await tester.pumpWidget(const MyApp());
      await tapAdd(tester, 23);

      expect(find.text('23'), findsOneWidget);
      expect(message, findsOneWidget);
      expect(find.text('Twenty-three!'), findsOneWidget);
      expect(
        tester.getTopLeft(message).dy,
        greaterThan(tester.getBottomLeft(find.text('23')).dy - 1),
      );
    });

    testWidgets('is absent when the screen is first shown at 0', (
      tester,
    ) async {
      await tester.pumpWidget(const MyApp());

      expect(find.text('0'), findsOneWidget);
      expect(message, findsNothing);
      expect(find.text('Twenty-three!'), findsNothing);
    });

    testWidgets('is absent when the counter is 22', (tester) async {
      await tester.pumpWidget(const MyApp());
      await tapAdd(tester, 22);

      expect(find.text('22'), findsOneWidget);
      expect(message, findsNothing);
      expect(find.text('Twenty-three!'), findsNothing);
    });

    testWidgets('disappears when the counter goes from 23 to 24', (
      tester,
    ) async {
      await tester.pumpWidget(const MyApp());
      await tapAdd(tester, 23);
      expect(message, findsOneWidget);

      await tapAdd(tester, 1);

      expect(find.text('24'), findsOneWidget);
      expect(message, findsNothing);
      expect(find.text('Twenty-three!'), findsNothing);
    });

    testWidgets('disappears when the counter is reset from 23', (tester) async {
      await tester.pumpWidget(const MyApp());
      await tapAdd(tester, 23);
      expect(message, findsOneWidget);

      await tester.tap(find.byKey(const Key('reset-button')));
      await tester.pump();

      expect(find.text('0'), findsOneWidget);
      expect(message, findsNothing);
    });
  });
}
