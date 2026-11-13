import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:relevo_sandbox/main.dart';
import 'package:relevo_sandbox/widgets/reset_confirm_dialog.dart';

void main() {
  final resetButton = find.byKey(const Key('reset-button'));

  Future<void> openAppAt(WidgetTester tester, int count) async {
    await tester.pumpWidget(MyApp(clock: () => DateTime(2026, 1, 1, 9)));
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

  testWidgets('counter 12: Reset opens the dialog and the counter stays', (
    tester,
  ) async {
    await openAppAt(tester, 12);

    await tapReset(tester);

    expect(find.byType(ResetConfirmDialog), findsOneWidget);
    expect(find.text(ResetConfirmDialog.question(12)), findsOneWidget);
    expect(find.text(ResetConfirmDialog.cancelLabel), findsOneWidget);
    expect(find.text(ResetConfirmDialog.confirmLabel), findsOneWidget);
    expect(find.text('12'), findsOneWidget);
  });

  testWidgets('counter 12: Confirm closes the dialog and resets to 0', (
    tester,
  ) async {
    await openAppAt(tester, 12);
    await tapReset(tester);

    await tester.tap(find.text(ResetConfirmDialog.confirmLabel));
    await tester.pumpAndSettle();

    expect(find.byType(ResetConfirmDialog), findsNothing);
    expect(find.text('0'), findsOneWidget);
    expect(find.text('12'), findsNothing);
  });

  testWidgets('counter 12: Cancel closes the dialog and keeps 12', (
    tester,
  ) async {
    await openAppAt(tester, 12);
    await tapReset(tester);

    await tester.tap(find.text(ResetConfirmDialog.cancelLabel));
    await tester.pumpAndSettle();

    expect(find.byType(ResetConfirmDialog), findsNothing);
    expect(find.text('12'), findsOneWidget);
    expect(find.text('0'), findsNothing);
  });

  testWidgets('counter 12: the back button closes the dialog and keeps 12', (
    tester,
  ) async {
    await openAppAt(tester, 12);
    await tapReset(tester);

    await tester.binding.handlePopRoute();
    await tester.pumpAndSettle();

    expect(find.byType(ResetConfirmDialog), findsNothing);
    expect(find.text('12'), findsOneWidget);
    expect(find.text('0'), findsNothing);
  });

  testWidgets('counter 9: Reset resets at once, with no dialog', (
    tester,
  ) async {
    await openAppAt(tester, 9);

    await tapReset(tester);

    expect(find.byType(ResetConfirmDialog), findsNothing);
    expect(find.text('0'), findsOneWidget);
    expect(find.text('9'), findsNothing);
  });

  testWidgets('counter exactly 10: Reset opens the dialog', (tester) async {
    await openAppAt(tester, 10);

    await tapReset(tester);

    expect(find.text(ResetConfirmDialog.question(10)), findsOneWidget);
    expect(find.text('10'), findsOneWidget);
  });

  testWidgets('counter 100: the dialog names the whole number', (tester) async {
    await openAppAt(tester, 100);

    await tapReset(tester);

    expect(find.text(ResetConfirmDialog.question(100)), findsOneWidget);
    expect(find.textContaining('100'), findsWidgets);
  });
}
