<!-- 
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages). 

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages). 
-->

A multiple randomly choosing function library

## Features

* generate multiple random choice under equally probability from options
* generate multiple random choice with weight from options


## Usage / Example

```dart
final m = {
  'A': 1.0,
  'B': 2.0,
  'C': 10.0,
  'D': 20,
  'E': 1,
};
final s = randomMultipleWeightedChoice<String>(m, 3, null);
print(s);
// {C,D,B}
```

You can see more examples in example folder.