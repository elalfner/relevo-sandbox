import 'package:flutter_test/flutter_test.dart';

// Temporary: stands in for a very long test suite.
void main() {
  test('slow suite stand-in', () async {
    await Future<void>.delayed(const Duration(minutes: 20));
  }, timeout: const Timeout(Duration(minutes: 25)));
}
