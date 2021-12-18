// ignore_for_file: avoid_print

import 'dart:collection';
import 'dart:math';

import 'package:multiple_random_choice/multiple_random_choice.dart';

void main() {
  // weighted multiple random choice
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
    final s = randomMultipleWeightedChoice<String>(m, 3, null);
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
  //ex. {BCD: 4734, CDE: 2334, ACD: 2280, BDE: 223, ABD: 219, ADE: 87, BCE: 53, ABC: 45, ACE: 24, ABE: 1}

  // equally weight random multiple choice
  final ss = randomMultipleChoice<String>(['A', 'B', 'C', 'D', 'E'], 2, null);
  print(ss);
  //ex. {C, D}

  // equally weight random multiple choice (given Random)
  final ssr =
      randomMultipleChoice<String>(['A', 'B', 'C', 'D', 'E'], 2, Random());
  print(ssr);
  //ex. {B, E}
}
