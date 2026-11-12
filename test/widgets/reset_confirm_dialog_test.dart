import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:relevo_sandbox/widgets/reset_confirm_dialog.dart';

void main() {
  Future<void> openDialog(
    WidgetTester tester,
    int count,
    List<bool?> results,
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

  testWidgets('shows the count in the question and the two buttons', (
    tester,
  ) async {
    await openDialog(tester, 12, []);

    expect(find.text(resetConfirmQuestion(12)), findsOneWidget);
    expect(find.text('Reset the counter of 12?'), findsOneWidget);
    expect(find.widgetWithText(TextButton, resetCancelLabel), findsOneWidget);
    expect(find.widgetWithText(TextButton, resetConfirmLabel), findsOneWidget);
  });

  testWidgets('names the whole number for 100 or more', (tester) async {
    await openDialog(tester, 100, []);

    expect(find.text(resetConfirmQuestion(100)), findsOneWidget);
  });

  testWidgets('Cancel and Confirm have semantics labels', (tester) async {
    final handle = tester.ensureSemantics();
    await openDialog(tester, 12, []);

    expect(find.bySemanticsLabel(resetCancelLabel), findsOneWidget);
    expect(find.bySemanticsLabel(resetConfirmLabel), findsOneWidget);
    handle.dispose();
  });

  testWidgets('Confirm returns true', (tester) async {
    final results = <bool?>[];
    await openDialog(tester, 12, results);

    await tester.tap(find.text(resetConfirmLabel));
    await tester.pumpAndSettle();

    expect(results, [true]);
    expect(find.byType(ResetConfirmDialog), findsNothing);
  });

  testWidgets('Cancel returns false', (tester) async {
    final results = <bool?>[];
    await openDialog(tester, 12, results);

    await tester.tap(find.text(resetCancelLabel));
    await tester.pumpAndSettle();

    expect(results, [false]);
    expect(find.byType(ResetConfirmDialog), findsNothing);
  });

  testWidgets('the back button returns false', (tester) async {
    final results = <bool?>[];
    await openDialog(tester, 12, results);

    await tester.binding.handlePopRoute();
    await tester.pumpAndSettle();

    expect(results, [false]);
    expect(find.byType(ResetConfirmDialog), findsNothing);
  });

  testWidgets('tapping the barrier returns false', (tester) async {
    final results = <bool?>[];
    await openDialog(tester, 12, results);

    await tester.tapAt(const Offset(1, 1));
    await tester.pumpAndSettle();

    expect(results, [false]);
  });
}
