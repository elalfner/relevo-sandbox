import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:relevo_sandbox/widgets/reset_confirm_dialog.dart';

void main() {
  testWidgets('Dialog names the count and offers Cancel and Confirm', (
    tester,
  ) async {
    final semantics = tester.ensureSemantics();

    await tester.pumpWidget(
      const MaterialApp(home: Scaffold(body: ResetConfirmDialog(count: 12))),
    );

    expect(find.text(ResetConfirmDialog.questionFor(12)), findsOneWidget);
    expect(
      find.widgetWithText(TextButton, ResetConfirmDialog.cancelLabel),
      findsOneWidget,
    );
    expect(
      find.widgetWithText(TextButton, ResetConfirmDialog.confirmLabel),
      findsOneWidget,
    );
    expect(
      find.bySemanticsLabel(ResetConfirmDialog.cancelSemanticsLabel),
      findsOneWidget,
    );
    expect(
      find.bySemanticsLabel(ResetConfirmDialog.confirmSemanticsLabel),
      findsOneWidget,
    );
    semantics.dispose();
  });
}
