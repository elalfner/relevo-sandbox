import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:relevo_sandbox/main.dart';
import 'package:relevo_sandbox/widgets/reset_confirm_dialog.dart';

void main() {
  final resetButton = find.byKey(const Key('reset-button'));
  final dialog = find.byType(ResetConfirmDialog);

  Future<void> openWithCounter(WidgetTester tester, int count) async {
    await tester.pumpWidget(const MyApp());
    for (var i = 0; i < count; i++) {
      await tester.tap(find.byIcon(Icons.add));
    }
    await tester.pump();
    expect(find.text('$count'), findsOneWidget);
  }

  Future<void> tapReset(WidgetTester tester) async {
    await tester.tap(resetButton);
    await tester.pumpAndSettle();
  }

  testWidgets('Reset at 12 asks for confirmation and keeps the counter', (
    tester,
  ) async {
    await openWithCounter(tester, 12);

    await tapReset(tester);

    expect(dialog, findsOneWidget);
    expect(find.text(resetConfirmQuestion(12)), findsOneWidget);
    expect(find.text('Reset the counter of 12?'), findsOneWidget);
    expect(find.widgetWithText(TextButton, resetCancelLabel), findsOneWidget);
    expect(find.widgetWithText(TextButton, resetConfirmLabel), findsOneWidget);
    expect(find.text('12'), findsOneWidget);
  });

  testWidgets('Confirm closes the dialog and resets the counter', (
    tester,
  ) async {
    await openWithCounter(tester, 12);
    await tapReset(tester);

    await tester.tap(find.text(resetConfirmLabel));
    await tester.pumpAndSettle();

    expect(dialog, findsNothing);
    expect(find.text('0'), findsOneWidget);
    expect(find.text('12'), findsNothing);
  });

  testWidgets('Cancel closes the dialog and keeps the counter', (tester) async {
    await openWithCounter(tester, 12);
    await tapReset(tester);

    await tester.tap(find.text(resetCancelLabel));
    await tester.pumpAndSettle();

    expect(dialog, findsNothing);
    expect(find.text('12'), findsOneWidget);
    expect(find.text('0'), findsNothing);
  });

  testWidgets('The back button closes the dialog and keeps the counter', (
    tester,
  ) async {
    await openWithCounter(tester, 12);
    await tapReset(tester);

    await tester.binding.handlePopRoute();
    await tester.pumpAndSettle();

    expect(dialog, findsNothing);
    expect(find.text('12'), findsOneWidget);
    expect(find.text('0'), findsNothing);
  });

  testWidgets('Reset at 9 resets at once with no dialog', (tester) async {
    await openWithCounter(tester, 9);

    await tester.tap(resetButton);
    await tester.pump();

    expect(dialog, findsNothing);
    expect(find.text('0'), findsOneWidget);
    expect(find.text('9'), findsNothing);
  });

  testWidgets('Reset at exactly 10 opens the dialog', (tester) async {
    await openWithCounter(tester, 10);

    await tapReset(tester);

    expect(dialog, findsOneWidget);
    expect(find.text(resetConfirmQuestion(10)), findsOneWidget);
    expect(find.text('10'), findsOneWidget);
  });

  testWidgets('Reset at 100 names the whole number', (tester) async {
    await openWithCounter(tester, 100);

    await tapReset(tester);

    expect(dialog, findsOneWidget);
    expect(find.text(resetConfirmQuestion(100)), findsOneWidget);
    expect(find.text('Reset the counter of 100?'), findsOneWidget);
  });
}
