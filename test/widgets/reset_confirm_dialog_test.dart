import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:relevo_sandbox/widgets/reset_confirm_dialog.dart';

/// Pumps a screen with one "Open" button that shows the dialog for [count]
/// and passes the answer to [onResult].
Future<void> pumpOpener(
  WidgetTester tester,
  int count,
  void Function(bool confirmed) onResult,
) {
  return tester.pumpWidget(
    MaterialApp(
      home: Scaffold(
        body: Builder(
          builder: (context) => TextButton(
            onPressed: () async {
              onResult(await ResetConfirmDialog.show(context, count));
            },
            child: const Text('Open'),
          ),
        ),
      ),
    ),
  );
}

/// Opens the dialog from the "Open" button of [pumpOpener].
Future<void> openDialog(WidgetTester tester) async {
  await tester.tap(find.text('Open'));
  await tester.pumpAndSettle();
}

void main() {
  testWidgets('asks the question with the count of the counter', (
    tester,
  ) async {
    await tester.pumpWidget(
      const MaterialApp(home: Scaffold(body: ResetConfirmDialog(count: 12))),
    );

    expect(find.text('Reset the counter of 12?'), findsOneWidget);
    expect(find.text(ResetConfirmDialog.questionFor(12)), findsOneWidget);
  });

  testWidgets('names a count of 100 or more in whole', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(home: Scaffold(body: ResetConfirmDialog(count: 1234))),
    );

    expect(find.text('Reset the counter of 1234?'), findsOneWidget);
  });

  testWidgets('shows the Cancel and Confirm buttons with semantics labels', (
    tester,
  ) async {
    final semantics = tester.ensureSemantics();
    await tester.pumpWidget(
      const MaterialApp(home: Scaffold(body: ResetConfirmDialog(count: 12))),
    );

    expect(
      find.widgetWithText(TextButton, ResetConfirmDialog.cancelLabel),
      findsOneWidget,
    );
    expect(
      find.widgetWithText(TextButton, ResetConfirmDialog.confirmLabel),
      findsOneWidget,
    );
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

  testWidgets('Confirm closes the dialog and completes with true', (
    tester,
  ) async {
    bool? result;
    await pumpOpener(tester, 12, (confirmed) => result = confirmed);
    await openDialog(tester);

    await tester.tap(find.text(ResetConfirmDialog.confirmLabel));
    await tester.pumpAndSettle();

    expect(result, isTrue);
    expect(find.byType(ResetConfirmDialog), findsNothing);
  });

  testWidgets('Cancel closes the dialog and completes with false', (
    tester,
  ) async {
    bool? result;
    await pumpOpener(tester, 12, (confirmed) => result = confirmed);
    await openDialog(tester);

    await tester.tap(find.text(ResetConfirmDialog.cancelLabel));
    await tester.pumpAndSettle();

    expect(result, isFalse);
    expect(find.byType(ResetConfirmDialog), findsNothing);
  });

  testWidgets('the back button closes the dialog and completes with false', (
    tester,
  ) async {
    bool? result;
    await pumpOpener(tester, 12, (confirmed) => result = confirmed);
    await openDialog(tester);

    await tester.binding.handlePopRoute();
    await tester.pumpAndSettle();

    expect(result, isFalse);
    expect(find.byType(ResetConfirmDialog), findsNothing);
  });
}
