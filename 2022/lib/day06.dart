part of 'aoc.dart';

class Day06 extends AOC {
  @override
  int part1() {
    int marker = 0;
    String s = data.first, t = "";
    for (; marker < 4; marker++) {
      t += s[marker];
    }
    for (; marker < s.length; marker++) {
      if (isUnique(t)) {
        break;
      }
      t = t.substring(1) + s[marker];
    }
    return marker;
  }

  @override
  int part2() {
    int marker = 0;
    String s = data.first, t = "";
    for (; marker < 14; marker++) {
      t += s[marker];
    }
    for (; marker < s.length; marker++) {
      if (isUnique(t)) {
        break;
      }
      t = t.substring(1) + s[marker];
    }
    return marker;
  }

  bool isUnique(String t) {
    return t.split('').toSet().length == t.length;
  }
}
