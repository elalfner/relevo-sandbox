// ignore_for_file: deprecated_member_use

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

  testWidgets('Parity label reads Even at 0, Odd at 1 and Even at 2', (
    tester,
  ) async {
    await tester.pumpWidget(const MyApp());
    expect(find.text('0'), findsOneWidget);
    expect(find.text('Even'), findsOneWidget);
    expect(find.text('Odd'), findsNothing);

    await tapAdd(tester, 1);
    expect(find.text('1'), findsOneWidget);
    expect(find.text('Odd'), findsOneWidget);
    expect(find.text('Even'), findsNothing);

    await tapAdd(tester, 1);
    expect(find.text('2'), findsOneWidget);
    expect(find.text('Even'), findsOneWidget);
    expect(find.text('Odd'), findsNothing);
  });
}
