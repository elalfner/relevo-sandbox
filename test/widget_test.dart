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

  testWidgets('Parity text says Even at 0', (tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('0'), findsOneWidget);
    expect(find.text('Even'), findsOneWidget);
    expect(find.text('Odd'), findsNothing);
  });

  testWidgets('Parity text says Even at 2, below the counter', (tester) async {
    await tester.pumpWidget(const MyApp());
    await tapAdd(tester, 2);

    expect(find.text('2'), findsOneWidget);
    expect(find.text('Even'), findsOneWidget);
    expect(find.text('Odd'), findsNothing);
    expect(
      tester.getTopLeft(find.text('Even')).dy,
      greaterThan(tester.getBottomLeft(find.text('2')).dy - 1),
    );
  });

  testWidgets('Parity text says Odd at 3, below the counter', (tester) async {
    await tester.pumpWidget(const MyApp());
    await tapAdd(tester, 3);

    expect(find.text('3'), findsOneWidget);
    expect(find.text('Odd'), findsOneWidget);
    expect(find.text('Even'), findsNothing);
    expect(
      tester.getTopLeft(find.text('Odd')).dy,
      greaterThan(tester.getBottomLeft(find.text('3')).dy - 1),
    );
  });

  testWidgets('Parity text says Even after reset from an odd count', (
    tester,
  ) async {
    await tester.pumpWidget(const MyApp());
    await tapAdd(tester, 3);
    expect(find.text('Odd'), findsOneWidget);

    await tester.tap(find.byKey(const Key('reset-button')));
    await tester.pump();

    expect(find.text('Even'), findsOneWidget);
    expect(find.text('Odd'), findsNothing);
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

  testWidgets('Twenty-seven message shows at 27, below the counter', (
    tester,
  ) async {
    await tester.pumpWidget(const MyApp());
    await tapAdd(tester, 27);

    expect(find.text('27'), findsOneWidget);
    final message = find.byKey(const Key('twenty-seven-message'));
    expect(message, findsOneWidget);
    expect(find.text('Twenty-seven!'), findsOneWidget);
    expect(
      tester.getTopLeft(message).dy,
      greaterThan(tester.getBottomLeft(find.text('27')).dy - 1),
    );
  });

  testWidgets('Twenty-seven message is hidden at 0', (tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('0'), findsOneWidget);
    expect(find.text('Twenty-seven!'), findsNothing);
  });

  testWidgets('Twenty-seven message is hidden at 26', (tester) async {
    await tester.pumpWidget(const MyApp());
    await tapAdd(tester, 26);

    expect(find.text('26'), findsOneWidget);
    expect(find.text('Twenty-seven!'), findsNothing);
  });

  testWidgets('Twenty-seven message disappears at 28', (tester) async {
    await tester.pumpWidget(const MyApp());
    await tapAdd(tester, 27);
    expect(find.text('Twenty-seven!'), findsOneWidget);

    await tapAdd(tester, 1);

    expect(find.text('28'), findsOneWidget);
    expect(find.text('Twenty-seven!'), findsNothing);
  });

  testWidgets('Twenty-seven message disappears after reset', (tester) async {
    await tester.pumpWidget(const MyApp());
    await tapAdd(tester, 27);
    expect(find.text('Twenty-seven!'), findsOneWidget);

    await tester.tap(find.byKey(const Key('reset-button')));
    await tester.pump();

    expect(find.text('Twenty-seven!'), findsNothing);
  });

  testWidgets('App bar shows the version subtitle', (tester) async {
    await tester.pumpWidget(const MyApp());

    final version = find.byKey(const Key('app-version'));
    expect(version, findsOneWidget);
    expect(
      find.descendant(of: find.byType(AppBar), matching: version),
      findsOneWidget,
    );
    expect(tester.widget<Text>(version).data, 'v1.0.0');
    expect(find.text('v1.0.0'), findsOneWidget);
  });

  testWidgets('Version subtitle is ellipsized on a very small screen', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(100, 600);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.reset);

    await tester.pumpWidget(const MyApp());

    final text = tester.widget<Text>(find.byKey(const Key('app-version')));
    expect(text.maxLines, 1);
    expect(text.overflow, TextOverflow.ellipsis);
    expect(tester.takeException(), isNull);
  });
}
