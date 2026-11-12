import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:relevo_sandbox/widgets/reset_confirm_dialog.dart';

void main() {
  Future<void> open(WidgetTester tester, int count, List<bool> results) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Builder(
          builder: (context) => TextButton(
            key: const Key('open'),
            onPressed: () async =>
                results.add(await ResetConfirmDialog.show(context, count)),
            child: const Text('Open'),
          ),
        ),
      ),
    );
    await tester.tap(find.byKey(const Key('open')));
    await tester.pumpAndSettle();
  }

  testWidgets('names the count and shows Cancel and Confirm', (tester) async {
    await open(tester, 12, []);

    expect(find.text('Reset the counter of 12?'), findsOneWidget);
    expect(find.text('Cancel'), findsOneWidget);
    expect(find.text('Confirm'), findsOneWidget);
  });

  testWidgets('names the whole number for 100 or more', (tester) async {
    await open(tester, 1234, []);

    expect(find.text('Reset the counter of 1234?'), findsOneWidget);
  });

  testWidgets('Confirm and Cancel have an accessible name', (tester) async {
    final handle = tester.ensureSemantics();
    await open(tester, 12, []);

    expect(find.bySemanticsLabel('Confirm reset'), findsOneWidget);
    expect(find.bySemanticsLabel('Cancel reset'), findsOneWidget);
    handle.dispose();
  });

  testWidgets('buttons are at least 48 dp tall', (tester) async {
    await open(tester, 12, []);

    for (final key in const [
      Key('reset-cancel-button'),
      Key('reset-confirm-button'),
    ]) {
      expect(tester.getSize(find.byKey(key)).height, greaterThanOrEqualTo(48));
    }
  });

  testWidgets('Confirm completes with true', (tester) async {
    final results = <bool>[];
    await open(tester, 12, results);

    await tester.tap(find.text('Confirm'));
    await tester.pumpAndSettle();

    expect(results, [true]);
  });

  testWidgets('Cancel completes with false', (tester) async {
    final results = <bool>[];
    await open(tester, 12, results);

    await tester.tap(find.text('Cancel'));
    await tester.pumpAndSettle();

    expect(results, [false]);
  });

  testWidgets('dismissing with the back button completes with false', (
    tester,
  ) async {
    final results = <bool>[];
    await open(tester, 12, results);

    await tester.binding.handlePopRoute();
    await tester.pumpAndSettle();

    expect(results, [false]);
  });
}
