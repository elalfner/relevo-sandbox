// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:relevo_sandbox/main.dart';

void main() {
  Future<void> openApp(WidgetTester tester) async {
    await tester.pumpWidget(MyApp(clock: () => DateTime(2026, 1, 1, 9)));
  }

  String? fabTooltip(WidgetTester tester) => tester
      .widget<FloatingActionButton>(find.byType(FloatingActionButton))
      .tooltip;

  group('Floating button tooltip', () {
    testWidgets('reads "Add one" on opening', (tester) async {
      await openApp(tester);

      expect(fabTooltip(tester), 'Add one');
      expect(find.byTooltip('Add one'), findsOneWidget);
      expect(find.byTooltip('Increment'), findsNothing);
    });

    testWidgets('still reads "Add one" after the counter changes', (
      tester,
    ) async {
      await openApp(tester);

      await tester.tap(find.byIcon(Icons.add));
      await tester.pump();

      expect(find.text('1'), findsOneWidget);
      expect(fabTooltip(tester), 'Add one');
      expect(find.byTooltip('Add one'), findsOneWidget);
      expect(find.byTooltip('Increment'), findsNothing);
    });

    testWidgets('shows "Add one" on long press', (tester) async {
      await openApp(tester);

      await tester.longPress(find.byType(FloatingActionButton));
      await tester.pump();

      expect(find.text('Add one'), findsOneWidget);
      expect(find.text('Increment'), findsNothing);
    });

    testWidgets('screen shows without overflow on a very small screen', (
      tester,
    ) async {
      tester.view.physicalSize = const Size(100, 300);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.reset);

      await openApp(tester);
      await tester.tap(find.byIcon(Icons.add));
      await tester.pump();

      expect(tester.takeException(), isNull);
      expect(fabTooltip(tester), 'Add one');
      expect(find.text('1'), findsOneWidget);
      expect(find.text('Odd'), findsOneWidget);
    });

    testWidgets('counter value and Even or Odd label still work', (
      tester,
    ) async {
      await openApp(tester);
      expect(find.text('0'), findsOneWidget);
      expect(find.text('Even'), findsOneWidget);

      await tester.tap(find.byIcon(Icons.add));
      await tester.pump();
      expect(find.text('1'), findsOneWidget);
      expect(find.text('Odd'), findsOneWidget);
      expect(find.text('Even'), findsNothing);

      await tester.tap(find.byIcon(Icons.add));
      await tester.pump();
      expect(find.text('2'), findsOneWidget);
      expect(find.text('Even'), findsOneWidget);
      expect(find.text('Odd'), findsNothing);
    });
  });
}
