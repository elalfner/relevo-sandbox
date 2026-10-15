import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:relevo_sandbox/main.dart';

void main() {
  final greeting = find.byKey(const Key('greeting-text'));

  Future<void> openAt(WidgetTester tester, int hour, [int minute = 0]) async {
    await tester.pumpWidget(
      MyApp(clock: () => DateTime(2026, 1, 1, hour, minute)),
    );
  }

  group('Greeting by time of day', () {
    final cases = <String, (int, int, String)>{
      'morning at 08:30': (8, 30, 'Good morning'),
      'afternoon at 14:00': (14, 0, 'Good afternoon'),
      'evening at 21:15': (21, 15, 'Good evening'),
      'evening at 00:00': (0, 0, 'Good evening'),
      'evening at 04:59': (4, 59, 'Good evening'),
      'morning at 05:00': (5, 0, 'Good morning'),
      'morning at 11:59': (11, 59, 'Good morning'),
      'afternoon at 12:00': (12, 0, 'Good afternoon'),
      'afternoon at 17:59': (17, 59, 'Good afternoon'),
      'evening at 18:00': (18, 0, 'Good evening'),
    };
    cases.forEach((name, c) {
      testWidgets('shows $name', (tester) async {
        await openAt(tester, c.$1, c.$2);
        expect(find.text(c.$3), findsOneWidget);
        expect(greeting, findsOneWidget);
        expect(tester.widget<Text>(greeting).data, c.$3);
      });
    });
  });

  group('Greeting position and style', () {
    testWidgets('is above the counter text, centred, headline medium', (
      tester,
    ) async {
      await openAt(tester, 9);
      final counterText = find.text(
        'You have pushed the button this many times:',
      );

      expect(counterText, findsOneWidget);
      expect(
        tester.getBottomLeft(greeting).dy,
        lessThanOrEqualTo(tester.getTopLeft(counterText).dy),
      );

      final text = tester.widget<Text>(greeting);
      final theme = Theme.of(tester.element(greeting));
      expect(text.style, theme.textTheme.headlineMedium);
      expect(text.textAlign, TextAlign.center);
      expect(tester.getCenter(greeting).dx, closeTo(400, 0.01));
    });
  });

  group('Greeting is fixed once chosen', () {
    testWidgets('does not change when increment and reset are tapped', (
      tester,
    ) async {
      await openAt(tester, 9);

      await tester.tap(find.byIcon(Icons.add));
      await tester.pump();
      expect(find.text('Good morning'), findsOneWidget);
      expect(greeting.hitTestable(), findsOneWidget);

      await tester.tap(find.byKey(const Key('reset-button')));
      await tester.pump();
      expect(find.text('Good morning'), findsOneWidget);
      expect(greeting.hitTestable(), findsOneWidget);
    });

    testWidgets('does not change when the clock moves to another part of day', (
      tester,
    ) async {
      var now = DateTime(2026, 1, 1, 11, 59);
      await tester.pumpWidget(MyApp(clock: () => now));
      expect(find.text('Good morning'), findsOneWidget);

      now = DateTime(2026, 1, 1, 12, 0);
      await tester.tap(find.byIcon(Icons.add));
      await tester.pump(const Duration(hours: 1));

      expect(find.text('Good morning'), findsOneWidget);
      expect(find.text('Good afternoon'), findsNothing);
    });

    testWidgets('does not change after background and resume', (tester) async {
      var now = DateTime(2026, 1, 1, 9);
      await tester.pumpWidget(MyApp(clock: () => now));

      tester.binding.handleAppLifecycleStateChanged(AppLifecycleState.paused);
      now = DateTime(2026, 1, 1, 20);
      tester.binding.handleAppLifecycleStateChanged(AppLifecycleState.resumed);
      tester.binding.handleLocaleChanged();
      await tester.pump();

      expect(find.text('Good morning'), findsOneWidget);
      expect(find.text('Good evening'), findsNothing);
    });
  });

  group('Layout', () {
    testWidgets('large text: no overflow, greeting visible, rest reachable', (
      tester,
    ) async {
      tester.view.physicalSize = const Size(400, 800);
      tester.view.devicePixelRatio = 1;
      tester.platformDispatcher.textScaleFactorTestValue = 3;
      addTearDown(tester.view.reset);
      addTearDown(tester.platformDispatcher.clearAllTestValues);

      await openAt(tester, 9);

      expect(tester.takeException(), isNull);
      expect(greeting.hitTestable(), findsOneWidget);
      expect(find.text('Good morning'), findsOneWidget);

      await tester.scrollUntilVisible(
        find.byKey(const Key('reset-button')),
        100,
        scrollable: find.byType(Scrollable),
      );
      expect(
        find.byKey(const Key('reset-button')).hitTestable(),
        findsOneWidget,
      );
      expect(tester.takeException(), isNull);
    });

    testWidgets('landscape: no overflow, greeting visible, rest reachable', (
      tester,
    ) async {
      tester.view.physicalSize = const Size(800, 300);
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.reset);

      await openAt(tester, 9);

      expect(tester.takeException(), isNull);
      expect(greeting.hitTestable(), findsOneWidget);

      await tester.scrollUntilVisible(
        find.byKey(const Key('reset-button')),
        100,
        scrollable: find.byType(Scrollable),
      );
      expect(
        find.byKey(const Key('reset-button')).hitTestable(),
        findsOneWidget,
      );
      expect(tester.takeException(), isNull);
    });
  });
}
