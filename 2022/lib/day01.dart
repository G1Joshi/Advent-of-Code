part of 'aoc.dart';

class Day01 extends AOC {
  @override
  int part1() {
    int current = 0, first = 0;
    for (var element in data) {
      if (element.isEmpty) {
        first = max(first, current);
        current = 0;
      } else {
        current += int.parse(element);
      }
    }
    return first;
  }

  @override
  int part2() {
    int current = 0, first = 0, second = 0, third = 0;
    for (var element in data) {
      if (element.isEmpty) {
        if (current > first) {
          third = second;
          second = first;
          first = current;
        } else if (current > second) {
          third = second;
          second = current;
        } else if (current > third) {
          third = current;
        }
        current = 0;
      } else {
        current += int.parse(element);
      }
    }
    return first + second + third;
  }
}
