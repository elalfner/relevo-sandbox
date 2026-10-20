import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:relevo_sandbox/main.dart';

void main() {
  Future<void> tapAdd(WidgetTester tester, int times) async {
    for (var i = 0; i < times; i++) {
      await tester.tap(find.byIcon(Icons.add));
    }
    await tester.pump();
  }

  testWidgets('Seven message is shown below the parity text at 7', (
    tester,
  ) async {
    await tester.pumpWidget(const MyApp());
    await tapAdd(tester, 7);

    expect(find.text('7'), findsOneWidget);
    expect(find.text('Seven reached'), findsOneWidget);
    expect(
      tester.getTopLeft(find.byKey(const Key('seven-text'))).dy,
      greaterThan(
        tester.getBottomLeft(find.byKey(const Key('parity-text'))).dy - 1,
      ),
    );
  });

  for (final count in [0, 6, 8]) {
    testWidgets('Seven message is hidden at $count', (tester) async {
      await tester.pumpWidget(const MyApp());
      await tapAdd(tester, count);

      expect(find.text('$count'), findsOneWidget);
      expect(find.text('Seven reached'), findsNothing);
    });
  }

  testWidgets('Seven message disappears after reset from 7', (tester) async {
    await tester.pumpWidget(const MyApp());
    await tapAdd(tester, 7);
    expect(find.text('Seven reached'), findsOneWidget);

    await tester.tap(find.byKey(const Key('reset-button')));
    await tester.pump();

    expect(find.text('0'), findsOneWidget);
    expect(find.text('Seven reached'), findsNothing);
  });
}
