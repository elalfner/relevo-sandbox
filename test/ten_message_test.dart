import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:relevo_sandbox/main.dart';

void main() {
  const tenKey = Key('ten-text');

  Future<void> tapAdd(WidgetTester tester, int times) async {
    for (var i = 0; i < times; i++) {
      await tester.tap(find.byIcon(Icons.add));
    }
    await tester.pump();
  }

  testWidgets('Ten message is hidden at 0', (tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.byKey(tenKey), findsNothing);
    expect(find.text('Ten reached'), findsNothing);
  });

  testWidgets('Ten message is hidden at 9', (tester) async {
    await tester.pumpWidget(const MyApp());
    await tapAdd(tester, 9);

    expect(find.text('9'), findsOneWidget);
    expect(find.byKey(tenKey), findsNothing);
  });

  testWidgets('Ten message is shown at exactly 10, under the parity text', (
    tester,
  ) async {
    await tester.pumpWidget(const MyApp());
    await tapAdd(tester, 10);

    expect(find.text('10'), findsOneWidget);
    expect(find.byKey(tenKey), findsOneWidget);
    expect(find.text('Ten reached'), findsOneWidget);
    expect(
      tester.getTopLeft(find.byKey(tenKey)).dy,
      greaterThan(
        tester.getBottomLeft(find.byKey(const Key('parity-text'))).dy - 1,
      ),
    );
  });

  testWidgets('Ten message stays shown above 10', (tester) async {
    await tester.pumpWidget(const MyApp());
    await tapAdd(tester, 11);

    expect(find.byKey(tenKey), findsOneWidget);
  });

  testWidgets('Ten message uses the same style as the parity text', (
    tester,
  ) async {
    await tester.pumpWidget(const MyApp());
    await tapAdd(tester, 10);

    final ten = tester.widget<Text>(find.byKey(tenKey));
    final parity = tester.widget<Text>(find.byKey(const Key('parity-text')));
    expect(ten.style, parity.style);
    expect(
      tester.renderObject<RenderParagraph>(find.byKey(tenKey)).text.style,
      tester
          .renderObject<RenderParagraph>(find.byKey(const Key('parity-text')))
          .text
          .style,
    );
  });

  testWidgets('Ten message disappears after reset', (tester) async {
    await tester.pumpWidget(const MyApp());
    await tapAdd(tester, 10);
    expect(find.byKey(tenKey), findsOneWidget);

    await tester.tap(find.byKey(const Key('reset-button')));
    await tester.pump();

    expect(find.text('0'), findsOneWidget);
    expect(find.byKey(tenKey), findsNothing);
  });

  testWidgets('Ten message is one ellipsized line on a very small screen', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(40, 600);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.reset);

    await tester.pumpWidget(const MyApp());
    await tapAdd(tester, 10);

    final finder = find.byKey(tenKey);
    expect(finder, findsOneWidget);
    final text = tester.widget<Text>(finder);
    expect(text.maxLines, 1);
    expect(text.overflow, TextOverflow.ellipsis);
    final paragraph = tester.renderObject<RenderParagraph>(finder);
    expect(
      paragraph.size.height,
      lessThan(paragraph.text.style!.fontSize! * 2),
    );
    expect(tester.takeException(), isNull);
  });
}
