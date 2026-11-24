// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:relevo_sandbox/main.dart';

void main() {
  testWidgets('Floating button has the tooltip Increment', (tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.byTooltip('Increment'), findsOneWidget);
    expect(
      find.descendant(
        of: find.byType(FloatingActionButton),
        matching: find.byIcon(Icons.add),
      ),
      findsOneWidget,
    );
  });
}
