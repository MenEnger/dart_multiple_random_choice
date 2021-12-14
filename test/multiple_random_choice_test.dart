import 'package:multiple_random_choice/multiple_random_choice.dart';
import 'package:test/test.dart';

void main() {
  test('test run without exception', () {
    expect(
        () => randomMultipleChoice(['A', 'B', 'C'], 2, null), returnsNormally);

    final m = {
      'A': 1.0,
      'B': 2.0,
      'C': 10.0,
      'D': 20,
      'E': 1,
    };
    expect(() => randomMultipleWeightedChoice(m, 2, null), returnsNormally);
  });
}
