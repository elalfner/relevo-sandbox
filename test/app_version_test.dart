// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:relevo_sandbox/main.dart';

void main() {
  testWidgets('App version label shows v1.0.1', (tester) async {
    await tester.pumpWidget(MyApp(clock: () => DateTime(2026, 1, 1, 9)));

    final label = find.byKey(const Key('app-version'));
    expect(label, findsOneWidget);
    expect(tester.widget<Text>(label).data, 'v1.0.1');
  });
}
