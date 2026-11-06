import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:relevo_sandbox/widgets/reset_confirm_dialog.dart';

/// Hosts a button that opens the dialog for [count] and reports the result.
Future<void> pumpHost(
  WidgetTester tester, {
  required int count,
  required void Function(bool confirmed) onResult,
}) async {
  await tester.pumpWidget(
    MaterialApp(
      home: Scaffold(
        body: Builder(
          builder: (context) => Center(
            child: ElevatedButton(
              onPressed: () async {
                onResult(await ResetConfirmDialog.show(context, count: count));
              },
              child: const Text('Open'),
            ),
          ),
        ),
      ),
    ),
  );
  await tester.tap(find.text('Open'));
  await tester.pumpAndSettle();
}

void main() {
  testWidgets('Question names the count and both buttons are shown', (
    tester,
  ) async {
    await pumpHost(tester, count: 12, onResult: (_) {});

    expect(find.byType(AlertDialog), findsOneWidget);
    expect(find.text('Reset the counter of 12?'), findsOneWidget);
    expect(find.text(ResetConfirmDialog.cancelLabel), findsOneWidget);
    expect(find.text(ResetConfirmDialog.confirmLabel), findsOneWidget);
    expect(
      find.bySemanticsLabel(ResetConfirmDialog.cancelSemanticsLabel),
      findsOneWidget,
    );
    expect(
      find.bySemanticsLabel(ResetConfirmDialog.confirmSemanticsLabel),
      findsOneWidget,
    );
  });

  testWidgets('Question names a large count in full', (tester) async {
    await pumpHost(tester, count: 1001, onResult: (_) {});

    expect(find.text('Reset the counter of 1001?'), findsOneWidget);
  });

  testWidgets('Confirm closes the dialog and reports true', (tester) async {
    bool? result;
    await pumpHost(tester, count: 12, onResult: (value) => result = value);

    await tester.tap(find.text(ResetConfirmDialog.confirmLabel));
    await tester.pumpAndSettle();

    expect(result, isTrue);
    expect(find.byType(AlertDialog), findsNothing);
  });

  testWidgets('Cancel closes the dialog and reports false', (tester) async {
    bool? result;
    await pumpHost(tester, count: 12, onResult: (value) => result = value);

    await tester.tap(find.text(ResetConfirmDialog.cancelLabel));
    await tester.pumpAndSettle();

    expect(result, isFalse);
    expect(find.byType(AlertDialog), findsNothing);
  });

  testWidgets('Back button closes the dialog and reports false', (
    tester,
  ) async {
    bool? result;
    await pumpHost(tester, count: 12, onResult: (value) => result = value);

    await tester.binding.handlePopRoute();
    await tester.pumpAndSettle();

    expect(result, isFalse);
    expect(find.byType(AlertDialog), findsNothing);
  });

  testWidgets('Tap outside the dialog closes it and reports false', (
    tester,
  ) async {
    bool? result;
    await pumpHost(tester, count: 12, onResult: (value) => result = value);

    await tester.tapAt(const Offset(5, 5));
    await tester.pumpAndSettle();

    expect(result, isFalse);
    expect(find.byType(AlertDialog), findsNothing);
  });
}
