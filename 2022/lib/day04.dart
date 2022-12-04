part of 'aoc.dart';

class Day04 extends AOC {
  @override
  int part1() {
    int overlap = 0;
    for (var element in data) {
      var ab = element.split(',').first;
      var cd = element.split(',').last;
      int a = int.parse(ab.split('-').first);
      int b = int.parse(ab.split('-').last);
      int c = int.parse(cd.split('-').first);
      int d = int.parse(cd.split('-').last);
      var range1 = {for (var i = a; i <= b; i += 1) i};
      var range2 = {for (var i = c; i <= d; i += 1) i};
      if (range1.containsAll(range2) || range2.containsAll(range1)) {
        overlap++;
      }
    }
    return overlap;
  }

  @override
  int part2() {
    int overlap = 0;
    for (var element in data) {
      var ab = element.split(',').first;
      var cd = element.split(',').last;
      int a = int.parse(ab.split('-').first);
      int b = int.parse(ab.split('-').last);
      int c = int.parse(cd.split('-').first);
      int d = int.parse(cd.split('-').last);
      var range1 = {for (var i = a; i <= b; i += 1) i};
      var range2 = {for (var i = c; i <= d; i += 1) i};
      if (range1.intersection(range2).isNotEmpty) {
        overlap++;
      }
    }
    return overlap;
  }
}
