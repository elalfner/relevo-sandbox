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

  const caption = 'You have pushed the button this many times:';

  testWidgets('Caption is shown at the start and after a tap', (tester) async {
    await tester.pumpWidget(const MyApp());
    expect(find.text(caption), findsOneWidget);

    await tapAdd(tester, 1);
    expect(find.text('1'), findsOneWidget);
    expect(find.text(caption), findsOneWidget);
  });
}
