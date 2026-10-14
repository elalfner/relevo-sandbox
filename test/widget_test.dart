// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:relevo_sandbox/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });

  Future<void> tapAdd(WidgetTester tester, int times) async {
    for (var i = 0; i < times; i++) {
      await tester.tap(find.byIcon(Icons.add));
    }
    await tester.pump();
  }

  testWidgets('Reset sets a non-zero counter to 0', (tester) async {
    await tester.pumpWidget(const MyApp());
    await tapAdd(tester, 5);
    expect(find.text('5'), findsOneWidget);

    await tester.tap(find.byKey(const Key('reset-button')));
    await tester.pump();

    expect(find.text('0'), findsOneWidget);
    expect(find.text('5'), findsNothing);
  });

  testWidgets('Reset keeps a zero counter at 0', (tester) async {
    await tester.pumpWidget(const MyApp());
    expect(find.text('Reset'), findsOneWidget);

    await tester.tap(find.byKey(const Key('reset-button')));
    await tester.pump();

    expect(find.text('0'), findsOneWidget);
  });

  testWidgets('Reset sets a counter over 1000 to 0', (tester) async {
    await tester.pumpWidget(const MyApp());
    await tapAdd(tester, 1001);
    expect(find.text('1001'), findsOneWidget);

    await tester.tap(find.byKey(const Key('reset-button')));
    await tester.pump();

    expect(find.text('0'), findsOneWidget);
    expect(find.text('1001'), findsNothing);
  });

  testWidgets('Two quick taps on reset leave the counter at 0', (tester) async {
    await tester.pumpWidget(const MyApp());
    await tapAdd(tester, 3);

    await tester.tap(find.byKey(const Key('reset-button')));
    await tester.tap(find.byKey(const Key('reset-button')));
    await tester.pump();

    expect(find.text('0'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });
}
