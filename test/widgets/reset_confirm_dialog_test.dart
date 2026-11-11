import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:relevo_sandbox/widgets/reset_confirm_dialog.dart';

void main() {
  /// Shows the dialog for [count] from a host button and records each answer
  /// in [results].
  Future<void> openDialog(
    WidgetTester tester,
    int count,
    List<bool?> results,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Builder(
            builder: (context) => TextButton(
              onPressed: () async {
                results.add(
                  await ResetConfirmDialog.show(context, count: count),
                );
              },
              child: const Text('Open'),
            ),
          ),
        ),
      ),
    );
    await tester.tap(find.text('Open'));
    await tester.pumpAndSettle();
  }

  testWidgets('shows the count in the question and both buttons', (
    tester,
  ) async {
    await openDialog(tester, 12, []);

    // s130-fix
    expect(find.text(ResetConfirmDialog.questionFor(12)), findsOneWidget);
    expect(find.text(ResetConfirmDialog.cancelLabel), findsOneWidget);
    expect(find.text(ResetConfirmDialog.confirmLabel), findsOneWidget);
  });

  testWidgets('Confirm and Cancel have semantics labels', (tester) async {
    final semantics = tester.ensureSemantics();
    await openDialog(tester, 12, []);

    expect(
      find.bySemanticsLabel(ResetConfirmDialog.cancelLabel),
      findsOneWidget,
    );
    expect(
      find.bySemanticsLabel(ResetConfirmDialog.confirmLabel),
      findsOneWidget,
    );
    semantics.dispose();
  });

  testWidgets('Confirm completes with true', (tester) async {
    final results = <bool?>[];
    await openDialog(tester, 12, results);

    await tester.tap(find.text(ResetConfirmDialog.confirmLabel));
    await tester.pumpAndSettle();

    expect(results, [true]);
    expect(find.byType(ResetConfirmDialog), findsNothing);
  });

  testWidgets('Cancel completes with false', (tester) async {
    final results = <bool?>[];
    await openDialog(tester, 12, results);

    await tester.tap(find.text(ResetConfirmDialog.cancelLabel));
    await tester.pumpAndSettle();

    expect(results, [false]);
    expect(find.byType(ResetConfirmDialog), findsNothing);
  });

  testWidgets('the back button completes with null, not a confirmation', (
    tester,
  ) async {
    final results = <bool?>[];
    await openDialog(tester, 12, results);

    await tester.binding.handlePopRoute();
    await tester.pumpAndSettle();

    expect(results, [null]);
    expect(find.byType(ResetConfirmDialog), findsNothing);
  });
}
