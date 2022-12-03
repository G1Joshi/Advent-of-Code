part of 'aoc.dart';

class Day03 extends AOC {
  @override
  int part1() {
    int priority = 0;
    for (var e = 0; e < data.length; e++) {
      String s = data[e];
      for (var i = 0; i < s.length / 2; i++) {
        bool found = false;
        for (var j = (s.length / 2).floor(); j < s.length; j++) {
          if (s[i] == s[j]) {
            if (s[i].toLowerCase() == s[i]) {
              priority += s[i].codeUnitAt(0) - 97 + 1;
            } else if (s[i].toUpperCase() == s[i]) {
              priority += s[i].codeUnitAt(0) - 65 + 27;
            }
            found = true;
            break;
          }
        }
        if (found) break;
      }
    }
    return priority;
  }

  @override
  int part2() {
    int priority = 0;
    for (var e = 0; e < data.length; e++) {
      String s1 = data[e++], s2 = data[e++], s3 = data[e];
      for (var i = 0; i < s1.length; i++) {
        bool found = false;
        for (var j = 0; j < s2.length; j++) {
          for (var k = 0; k < s3.length; k++) {
            if (s1[i] == s2[j] && s2[j] == s3[k]) {
              if (s1[i].toLowerCase() == s1[i]) {
                priority += s1[i].codeUnitAt(0) - 97 + 1;
              } else if (s1[i].toUpperCase() == s1[i]) {
                priority += s1[i].codeUnitAt(0) - 65 + 27;
              }
              found = true;
              break;
            }
          }
          if (found) break;
        }
        if (found) break;
      }
    }
    return priority;
  }
}
