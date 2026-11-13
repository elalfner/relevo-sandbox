import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:relevo_sandbox/widgets/reset_confirm_dialog.dart';

void main() {
  Future<void> openDialog(
    WidgetTester tester,
    int count,
    List<bool> results,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Builder(
          builder: (context) => Scaffold(
            body: TextButton(
              onPressed: () async =>
                  results.add(await ResetConfirmDialog.show(context, count)),
              child: const Text('open'),
            ),
          ),
        ),
      ),
    );
    await tester.tap(find.text('open'));
    await tester.pumpAndSettle();
  }

  testWidgets('dialog alone shows the count and the two buttons',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(home: Scaffold(body: ResetConfirmDialog(count: 12))),
    );

    expect(find.text(ResetConfirmDialog.question(12)), findsOneWidget);
    expect(find.text('Reset the counter of 12?'), findsOneWidget);
    expect(find.text(ResetConfirmDialog.cancelLabel), findsOneWidget);
    expect(find.text(ResetConfirmDialog.confirmLabel), findsOneWidget);
  });

  testWidgets('buttons have a semantics label', (WidgetTester tester) async {
    final handle = tester.ensureSemantics();
    await tester.pumpWidget(
      const MaterialApp(home: Scaffold(body: ResetConfirmDialog(count: 12))),
    );

    expect(
      find.bySemanticsLabel(ResetConfirmDialog.cancelLabel),
      findsOneWidget,
    );
    expect(
      find.bySemanticsLabel(ResetConfirmDialog.confirmLabel),
      findsOneWidget,
    );
    handle.dispose();
  });

  testWidgets('names the whole number for 100 or more',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(home: Scaffold(body: ResetConfirmDialog(count: 1234))),
    );

    expect(find.text('Reset the counter of 1234?'), findsOneWidget);
  });

  testWidgets('Confirm returns true', (WidgetTester tester) async {
    final results = <bool>[];
    await openDialog(tester, 10, results);

    await tester.tap(find.text(ResetConfirmDialog.confirmLabel));
    await tester.pumpAndSettle();

    expect(results, [true]);
    expect(find.byType(ResetConfirmDialog), findsNothing);
  });

  testWidgets('Cancel returns false', (WidgetTester tester) async {
    final results = <bool>[];
    await openDialog(tester, 10, results);

    await tester.tap(find.text(ResetConfirmDialog.cancelLabel));
    await tester.pumpAndSettle();

    expect(results, [false]);
    expect(find.byType(ResetConfirmDialog), findsNothing);
  });

  testWidgets('dismissing the dialog returns false',
      (WidgetTester tester) async {
    final results = <bool>[];
    await openDialog(tester, 10, results);

    await tester.tapAt(const Offset(1, 1));
    await tester.pumpAndSettle();

    expect(results, [false]);
    expect(find.byType(ResetConfirmDialog), findsNothing);
  });
}
