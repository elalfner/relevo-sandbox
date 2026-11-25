// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:relevo_sandbox/main.dart';

void main() {
  testWidgets('Parity reads Even after one tap and a reset', (tester) async {
    await tester.pumpWidget(MyApp(clock: () => DateTime(2026, 1, 1, 9)));

    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    await tester.tap(find.byKey(const Key('reset-button')));
    await tester.pump();

    final parity = find.byKey(const Key('parity-text'));
    expect(parity, findsOneWidget);
    expect(tester.widget<Text>(parity).data, 'Even');
  });
}
