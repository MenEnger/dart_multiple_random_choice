// ignore_for_file: avoid_print

import 'dart:collection';

import 'package:multiple_random_choice/multiple_random_choice.dart';

void main() {
  // option-weight map
  final m = {
    'A': 1.0,
    'B': 2.0,
    'C': 10.0,
    'D': 20,
    'E': 1,
  };
  final countMap = <String, int>{};
  for (int i = 0; i < 10000; i++) {
    final s = randomMultipleWeightedChoice<String>(m, 3);
    final sts = SplayTreeSet.of(s);
    final skey = sts.join();
    if (countMap.containsKey(skey)) {
      countMap[skey] = countMap[skey]! + 1;
    } else {
      countMap[skey] = 1;
    }
  }
  final le = countMap.entries.toList();
  le.sort((a, b) => -1 * a.value.compareTo(b.value));
  print(LinkedHashMap.fromEntries(le));


  final ss = randomMultipleChoice<String>(['A', 'B', 'C', 'D', 'E'], 2);
  print(ss);
}
