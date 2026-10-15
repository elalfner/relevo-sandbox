import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:relevo_sandbox/main.dart';

void mockBuild(String buildNumber) {
  PackageInfo.setMockInitialValues(
    appName: 'relevo_sandbox',
    packageName: 'com.example.relevo_sandbox',
    version: '1.0.0',
    buildNumber: buildNumber,
    buildSignature: '',
  );
}

void main() {
  final version = find.byKey(const Key('app-version'));
  final build = find.byKey(const Key('app-build'));

  testWidgets('Build 1 is shown right after the version on the same line', (
    tester,
  ) async {
    mockBuild('1');
    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle();

    expect(tester.widget<Text>(version).data, 'v1.0.0');
    expect(tester.widget<Text>(build).data, 'Build 1');
    expect(
      find.descendant(of: find.byType(AppBar), matching: build),
      findsOneWidget,
    );
    final v = tester.getRect(version);
    final b = tester.getRect(build);
    expect(b.left, greaterThan(v.right));
    expect(b.left - v.right, 8);
    expect(b.top, v.top);
    expect(b.bottom, v.bottom);
  });

  testWidgets('A different build number is shown', (tester) async {
    mockBuild('42');
    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle();

    expect(find.text('Build 42'), findsOneWidget);
  });

  testWidgets('Only the version is shown until the build number loads', (
    tester,
  ) async {
    mockBuild('7');
    await tester.pumpWidget(const MyApp());

    expect(version, findsOneWidget);
    expect(build, findsNothing);

    await tester.pumpAndSettle();

    expect(find.text('Build 7'), findsOneWidget);
    expect(find.text('v1.0.0'), findsOneWidget);
  });

  testWidgets('Very small screen: both texts ellipsized, no overflow', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(100, 600);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.reset);
    mockBuild('123456789');

    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle();

    for (final finder in [version, build]) {
      final text = tester.widget<Text>(finder);
      expect(text.maxLines, 1);
      expect(text.overflow, TextOverflow.ellipsis);
    }
    expect(tester.takeException(), isNull);
  });

  testWidgets('Empty build number shows only the version label', (
    tester,
  ) async {
    mockBuild('');
    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle();

    expect(version, findsOneWidget);
    expect(build, findsNothing);
    expect(tester.takeException(), isNull);
  });

  testWidgets('Unreadable build number shows only the version label', (
    tester,
  ) async {
    // The plugin is not mocked here, so reading it fails.
    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle();

    expect(version, findsOneWidget);
    expect(build, findsNothing);
    expect(find.byIcon(Icons.error), findsNothing);
    expect(tester.takeException(), isNull);
  });

  testWidgets('Zero is shown as received', (tester) async {
    mockBuild('0');
    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle();

    expect(find.text('Build 0'), findsOneWidget);
  });

  testWidgets('A long build number is shown as received and truncated', (
    tester,
  ) async {
    const long = '1234567890123456789012345678901234567890';
    mockBuild(long);
    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle();

    expect(tester.widget<Text>(build).data, 'Build $long');
    expect(tester.widget<Text>(build).overflow, TextOverflow.ellipsis);
    expect(tester.takeException(), isNull);
  });
}
