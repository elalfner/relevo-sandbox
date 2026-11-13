import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:relevo_sandbox/main.dart';

void main() {
  testWidgets('Add 21 from 0 shows 21', (tester) async {
    await tester.pumpWidget(const MyApp());
    expect(find.text('Add 21'), findsOneWidget);
    expect(find.text('0'), findsOneWidget);

    await tester.tap(find.byKey(const Key('add-21-button')));
    await tester.pump();

    expect(find.text('21'), findsOneWidget);
    expect(find.text('0'), findsNothing);
  });

  testWidgets('Add 21 from 3 shows 24', (tester) async {
    await tester.pumpWidget(const MyApp());
    for (var i = 0; i < 3; i++) {
      await tester.tap(find.byIcon(Icons.add));
    }
    await tester.pump();
    expect(find.text('3'), findsOneWidget);

    await tester.tap(find.byKey(const Key('add-21-button')));
    await tester.pump();

    expect(find.text('24'), findsOneWidget);
    expect(find.text('3'), findsNothing);
  });
}
