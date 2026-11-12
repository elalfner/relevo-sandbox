import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:relevo_sandbox/main.dart';

void main() {
  final addTen = find.byKey(const Key('add-ten-button'));

  Future<void> tapAdd(WidgetTester tester, int times) async {
    for (var i = 0; i < times; i++) {
      await tester.tap(find.byIcon(Icons.add));
    }
    await tester.pump();
  }

  testWidgets('Add 10 button is labelled "Add 10"', (tester) async {
    await tester.pumpWidget(const MyApp());

    expect(addTen, findsOneWidget);
    expect(
      find.descendant(of: addTen, matching: find.text('Add 10')),
      findsOneWidget,
    );
  });

  testWidgets('Add 10 from zero shows 10', (tester) async {
    await tester.pumpWidget(const MyApp());
    expect(find.text('0'), findsOneWidget);

    await tester.tap(addTen);
    await tester.pump();

    expect(find.text('10'), findsOneWidget);
    expect(find.text('0'), findsNothing);
  });

  testWidgets('Add 10 from three shows 13', (tester) async {
    await tester.pumpWidget(const MyApp());
    await tapAdd(tester, 3);
    expect(find.text('3'), findsOneWidget);

    await tester.tap(addTen);
    await tester.pump();

    expect(find.text('13'), findsOneWidget);
    expect(find.text('3'), findsNothing);
  });

  testWidgets('Greeting and parity text match the counter after Add 10', (
    tester,
  ) async {
    await tester.pumpWidget(MyApp(clock: () => DateTime(2026, 1, 1, 9)));

    await tester.tap(addTen);
    await tester.pump();

    expect(find.text('Good morning'), findsOneWidget);
    expect(find.text('10'), findsOneWidget);
    expect(find.text('Even'), findsOneWidget);
    expect(find.text('Odd'), findsNothing);

    await tapAdd(tester, 1);

    expect(find.text('11'), findsOneWidget);
    expect(find.text('Odd'), findsOneWidget);
    expect(find.text('Even'), findsNothing);
    expect(find.text('Good morning'), findsOneWidget);
  });
}
