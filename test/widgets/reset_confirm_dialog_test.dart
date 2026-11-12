import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:relevo_sandbox/main.dart';
import 'package:relevo_sandbox/widgets/reset_confirm_dialog.dart';

void main() {
  Future<void> tapAdd(WidgetTester tester, int times) async {
    for (var i = 0; i < times; i++) {
      await tester.tap(find.byIcon(Icons.add));
    }
    await tester.pump();
  }

  Future<void> tapReset(WidgetTester tester) async {
    await tester.tap(find.byKey(const Key('reset-button')));
    await tester.pumpAndSettle();
  }

  testWidgets('Dialog alone names the count and has two buttons', (
    tester,
  ) async {
    final handle = tester.ensureSemantics();
    await tester.pumpWidget(
      const MaterialApp(home: ResetConfirmDialog(count: 12)),
    );

    expect(find.text(resetConfirmQuestion(12)), findsOneWidget);
    expect(find.text('Reset the counter of 12?'), findsOneWidget);
    expect(find.text(resetCancelLabel), findsOneWidget);
    expect(find.text(resetConfirmLabel), findsOneWidget);
    expect(find.bySemanticsLabel(resetCancelLabel), findsOneWidget);
    expect(find.bySemanticsLabel(resetConfirmLabel), findsOneWidget);
    handle.dispose();
  });

  testWidgets('Dialog opens for a counter of 12 and keeps it', (tester) async {
    await tester.pumpWidget(const MyApp());
    await tapAdd(tester, 12);

    await tapReset(tester);

    expect(find.byType(ResetConfirmDialog), findsOneWidget);
    expect(find.text('Reset the counter of 12?'), findsOneWidget);
    expect(find.text(resetCancelLabel), findsOneWidget);
    expect(find.text(resetConfirmLabel), findsOneWidget);
    expect(find.text('12'), findsOneWidget);
  });

  testWidgets('Confirm resets the counter to 0', (tester) async {
    await tester.pumpWidget(const MyApp());
    await tapAdd(tester, 12);
    await tapReset(tester);

    await tester.tap(find.text(resetConfirmLabel));
    await tester.pumpAndSettle();

    expect(find.byType(ResetConfirmDialog), findsNothing);
    expect(find.text('0'), findsOneWidget);
    expect(find.text('12'), findsNothing);
  });

  testWidgets('Cancel keeps the counter', (tester) async {
    await tester.pumpWidget(const MyApp());
    await tapAdd(tester, 12);
    await tapReset(tester);

    await tester.tap(find.text(resetCancelLabel));
    await tester.pumpAndSettle();

    expect(find.byType(ResetConfirmDialog), findsNothing);
    expect(find.text('12'), findsOneWidget);
  });

  testWidgets('Back button dismissal keeps the counter', (tester) async {
    await tester.pumpWidget(const MyApp());
    await tapAdd(tester, 12);
    await tapReset(tester);

    await tester.binding.handlePopRoute();
    await tester.pumpAndSettle();

    expect(find.byType(ResetConfirmDialog), findsNothing);
    expect(find.text('12'), findsOneWidget);
  });

  testWidgets('Counter of 9 resets at once with no dialog', (tester) async {
    await tester.pumpWidget(const MyApp());
    await tapAdd(tester, 9);

    await tapReset(tester);

    expect(find.byType(ResetConfirmDialog), findsNothing);
    expect(find.text('0'), findsOneWidget);
    expect(find.text('9'), findsNothing);
  });

  testWidgets('Counter of exactly 10 opens the dialog', (tester) async {
    await tester.pumpWidget(const MyApp());
    await tapAdd(tester, 10);

    await tapReset(tester);

    expect(find.byType(ResetConfirmDialog), findsOneWidget);
    expect(find.text('Reset the counter of 10?'), findsOneWidget);
  });

  testWidgets('Counter of 100 or more names the whole number', (tester) async {
    await tester.pumpWidget(const MyApp());
    await tapAdd(tester, 100);

    await tapReset(tester);

    expect(find.text('Reset the counter of 100?'), findsOneWidget);
  });
}
