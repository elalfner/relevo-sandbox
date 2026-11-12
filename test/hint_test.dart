import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:relevo_sandbox/main.dart';

void main() {
  testWidgets('Hint is visible on open, under the counter', (tester) async {
    await tester.pumpWidget(const MyApp());

    final hint = find.byKey(const Key('hint-text'));
    expect(hint, findsOneWidget);
    expect(find.text('Tap the button to count'), findsOneWidget);
    expect(
      tester.getTopLeft(hint).dy,
      greaterThan(tester.getBottomLeft(find.text('0')).dy - 1),
    );
  });

  testWidgets('Hint stays after the counter changes', (tester) async {
    await tester.pumpWidget(const MyApp());

    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    expect(find.text('1'), findsOneWidget);
    expect(find.text('Tap the button to count'), findsOneWidget);
  });
}
