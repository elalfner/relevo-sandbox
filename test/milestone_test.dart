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

  final milestone = find.byKey(const Key('milestone-text'));

  testWidgets('No milestone message at the start (0)', (tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('0'), findsOneWidget);
    expect(milestone, findsNothing);
    expect(find.text('Twenty-five!'), findsNothing);
  });

  testWidgets('Milestone message shows at 25, below the counter', (
    tester,
  ) async {
    await tester.pumpWidget(const MyApp());
    await tapAdd(tester, 25);

    expect(find.text('25'), findsOneWidget);
    expect(milestone, findsOneWidget);
    expect(find.text('Twenty-five!'), findsOneWidget);
    expect(
      tester.getTopLeft(milestone).dy,
      greaterThan(tester.getBottomLeft(find.text('25')).dy - 1),
    );
  });

  testWidgets('No milestone message at 24', (tester) async {
    await tester.pumpWidget(const MyApp());
    await tapAdd(tester, 24);

    expect(find.text('24'), findsOneWidget);
    expect(milestone, findsNothing);
  });

  testWidgets('Milestone message disappears at 26', (tester) async {
    await tester.pumpWidget(const MyApp());
    await tapAdd(tester, 25);
    expect(milestone, findsOneWidget);

    await tapAdd(tester, 1);

    expect(find.text('26'), findsOneWidget);
    expect(milestone, findsNothing);
    expect(find.text('Twenty-five!'), findsNothing);
  });

  testWidgets('Reset hides the milestone message', (tester) async {
    await tester.pumpWidget(const MyApp());
    await tapAdd(tester, 25);
    expect(milestone, findsOneWidget);

    await tester.tap(find.byKey(const Key('reset-button')));
    await tester.pump();

    expect(find.text('0'), findsOneWidget);
    expect(milestone, findsNothing);
  });
}
