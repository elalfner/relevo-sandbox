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

  testWidgets('Counter shows 3 after three taps', (tester) async {
    await tester.pumpWidget(const MyApp());
    expect(find.text('0'), findsOneWidget);

    await tapAdd(tester, 3);

    expect(find.text('3'), findsOneWidget);
    expect(find.text('0'), findsNothing);
  });
}
