import 'package:flutter_test/flutter_test.dart';

import 'package:relevo_sandbox/main.dart';

void main() {
  test('A reset adds the previous value at the top', () {
    expect(historyAfterReset(const [], 5), [5]);
    expect(historyAfterReset(const [5], 7), [7, 5]);
  });

  test('A reset at 0 adds nothing', () {
    expect(historyAfterReset(const [], 0), isEmpty);
    expect(historyAfterReset(const [5], 0), [5]);
  });

  test('Repeated values give separate entries', () {
    expect(historyAfterReset(const [3], 3), [3, 3]);
  });

  test('The 21st reset drops the oldest value', () {
    var history = <int>[];
    for (var i = 1; i <= 21; i++) {
      history = historyAfterReset(history, i);
    }

    expect(history.length, resetHistoryLimit);
    expect(history.first, 21);
    expect(history.last, 2);
    expect(history, isNot(contains(1)));
  });

  test('The input list is not modified', () {
    final history = List<int>.unmodifiable([4]);

    expect(historyAfterReset(history, 6), [6, 4]);
    expect(history, [4]);
  });
}
