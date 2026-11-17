// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:relevo_sandbox/main.dart';

void main() {
  const caption = 'Times pressed:';
  const oldCaption = 'You have pushed the button this many times:';

  testWidgets('Caption reads Times pressed: on opening, above the counter', (
    tester,
  ) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text(caption), findsOneWidget);
    expect(find.text(oldCaption), findsNothing);
    expect(
      tester.getBottomLeft(find.text(caption)).dy,
      lessThanOrEqualTo(tester.getTopLeft(find.text('0')).dy),
    );
  });

  testWidgets('Caption stays after a tap while counter and label update', (
    tester,
  ) async {
    await tester.pumpWidget(const MyApp());
    expect(find.text('0'), findsOneWidget);
    expect(find.text('Even'), findsOneWidget);

    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    expect(find.text(caption), findsOneWidget);
    expect(find.text(oldCaption), findsNothing);
    expect(find.text('1'), findsOneWidget);
    expect(find.text('Odd'), findsOneWidget);
    expect(find.text('Even'), findsNothing);

    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    expect(find.text(caption), findsOneWidget);
    expect(find.text('2'), findsOneWidget);
    expect(find.text('Even'), findsOneWidget);
  });

  testWidgets('Caption fits a very small screen without overflow', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(200, 300);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.reset);

    await tester.pumpWidget(const MyApp());

    expect(find.text(caption), findsOneWidget);
    expect(tester.takeException(), isNull);

    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    expect(find.text(caption), findsOneWidget);
    expect(find.text('1'), findsOneWidget);
    expect(find.text('Odd'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });
}
