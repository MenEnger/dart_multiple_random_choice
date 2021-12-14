/// A library for generating a multiple random choice from an iterable.
/// Inspired by [dart_random_choice](https://pub.dev/packages/dart_random_choice)
library multiple_random_choice;

import 'dart:math' show Random;
import 'dart:collection';

/// generate multiple random choice under equally probability from options
Set<T> randomMultipleChoice<T>(
    Iterable<T> options, int choiceCount, Random? random) {
  final entries = options.map((option) {
    return MapEntry(option, 1);
  });
  final map = LinkedHashMap.fromEntries(entries);
  return randomMultipleWeightedChoice<T>(map, choiceCount, random);
}

/// generate multiple random choice with weight from options
/// optionToWeightMap: key->option, value->weight
Set<T> randomMultipleWeightedChoice<T>(
    Map<T, num> optionToWeightMap, int choiceCount, Random? random) {
  final tempMap = LinkedHashMap.of(optionToWeightMap);
  var sum = tempMap.values.reduce((val, curr) => val + curr);
  var usingRandom = (random ?? _getDefaultRandom());

  final result = HashSet<T>();
  for (var i = 0; i < choiceCount; i++) {
    var randomWeightState = usingRandom.nextDouble() * sum;

    choiceLoop:
    for (var e in tempMap.entries) {
      randomWeightState -= e.value;
      if (randomWeightState <= 0) {
        result.add(e.key);
        tempMap.remove(e.key);
        sum -= e.value;
        break choiceLoop;
      }
    }
  }
  return result;
}

Random _getDefaultRandom() {
  try {
    return Random.secure();
  } on UnsupportedError {
    return Random();
  }
}
