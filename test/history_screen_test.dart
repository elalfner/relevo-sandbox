import 'dart:ui' show SemanticsAction;

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:relevo_sandbox/main.dart';

void main() {
  final historyButton = find.byKey(const Key('history-button'));
  final clearButton = find.text('Clear history');

  Future<void> openApp(WidgetTester tester) async {
    await tester.pumpWidget(MyApp(clock: () => DateTime(2026, 1, 1, 9)));
  }

  Future<void> tapIncrement(WidgetTester tester, int times) async {
    for (var i = 0; i < times; i++) {
      await tester.tap(find.byIcon(Icons.add));
      await tester.pump();
    }
  }

  Future<void> reset(WidgetTester tester) async {
    await tester.tap(find.byKey(const Key('reset-button')));
    await tester.pump();
  }

  Future<void> openHistory(WidgetTester tester) async {
    await tester.tap(historyButton);
    await tester.pumpAndSettle();
  }

  Future<void> goBack(WidgetTester tester) async {
    await tester.tap(find.byType(BackButton));
    await tester.pumpAndSettle();
  }

  group('History button', () {
    testWidgets('is in the app bar with the name History and 48 dp', (
      tester,
    ) async {
      await openApp(tester);

      expect(
        find.descendant(
          of: find.byType(AppBar),
          matching: find.byIcon(Icons.history),
        ),
        findsOneWidget,
      );
      expect(find.byTooltip('History'), findsOneWidget);
      final handle = tester.ensureSemantics();
      final data = tester.getSemantics(historyButton).getSemanticsData();
      expect(data.tooltip, 'History');
      expect(data.flagsCollection.isButton, isTrue);
      expect(data.hasAction(SemanticsAction.tap), isTrue);
      handle.dispose();
      final size = tester.getSize(historyButton);
      expect(size.width, greaterThanOrEqualTo(48));
      expect(size.height, greaterThanOrEqualTo(48));
    });

    testWidgets('opens the History screen with a back arrow', (tester) async {
      await openApp(tester);
      await openHistory(tester);

      expect(find.text('History'), findsOneWidget);
      expect(find.byType(BackButton), findsOneWidget);
    });
  });

  group('History screen', () {
    testWidgets('shows No resets yet and no list when empty', (tester) async {
      await openApp(tester);
      await openHistory(tester);

      expect(find.text('No resets yet'), findsOneWidget);
      expect(find.byKey(const Key('history-list')), findsNothing);
      expect(find.byType(ListTile), findsNothing);
      expect(clearButton, findsNothing);
    });

    testWidgets('a reset adds its value to the history', (tester) async {
      await openApp(tester);
      await tapIncrement(tester, 7);
      await reset(tester);

      expect(find.text('0'), findsOneWidget);
      await openHistory(tester);

      expect(find.text('Reset at 7'), findsOneWidget);
      expect(find.text('No resets yet'), findsNothing);
    });

    testWidgets('a reset at 0 adds nothing', (tester) async {
      await openApp(tester);
      await reset(tester);
      await openHistory(tester);

      expect(find.text('No resets yet'), findsOneWidget);
      expect(find.byType(ListTile), findsNothing);
    });

    testWidgets('lists the values newest first, repeated ones apart', (
      tester,
    ) async {
      await openApp(tester);
      await tapIncrement(tester, 2);
      await reset(tester);
      await tapIncrement(tester, 5);
      await reset(tester);
      await tapIncrement(tester, 5);
      await reset(tester);
      await openHistory(tester);

      final rows = tester
          .widgetList<ListTile>(find.byType(ListTile))
          .map((tile) => (tile.title! as Text).data)
          .toList();
      expect(rows, ['Reset at 5', 'Reset at 5', 'Reset at 2']);
    });

    testWidgets('the 21st reset drops the oldest value', (tester) async {
      tester.view.physicalSize = const Size(800, 4000);
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.reset);
      await openApp(tester);
      for (var i = 1; i <= 21; i++) {
        await tapIncrement(tester, i);
        await reset(tester);
      }
      await openHistory(tester);

      final rows = tester
          .widgetList<ListTile>(find.byType(ListTile))
          .map((tile) => (tile.title! as Text).data)
          .toList();
      expect(rows.length, resetHistoryLimit);
      expect(rows.first, 'Reset at 21');
      expect(rows.last, 'Reset at 2');
      expect(rows, isNot(contains('Reset at 1')));
    });

    testWidgets('Clear history empties the list at once', (tester) async {
      await openApp(tester);
      await tapIncrement(tester, 3);
      await reset(tester);
      await openHistory(tester);

      expect(clearButton, findsOneWidget);
      await tester.tap(clearButton);
      await tester.pump();

      expect(find.text('No resets yet'), findsOneWidget);
      expect(find.byType(ListTile), findsNothing);
      expect(clearButton, findsNothing);

      await goBack(tester);
      await openHistory(tester);

      expect(find.text('No resets yet'), findsOneWidget);
    });

    testWidgets('going back keeps the counter', (tester) async {
      await openApp(tester);
      await tapIncrement(tester, 4);
      await openHistory(tester);
      await goBack(tester);

      expect(find.text('History'), findsNothing);
      expect(find.text('4'), findsOneWidget);
    });
  });
}
