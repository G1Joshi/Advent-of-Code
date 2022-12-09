part of 'aoc.dart';

class Day09 extends AOC {
  @override
  int part1() => ropeVisit(2);

  @override
  int part2() => ropeVisit(10);

  int ropeVisit(int n) {
    var rope = List.generate(n, (i) => Point(0, 0));
    var visit = {rope.first};
    for (var element in data) {
      final moveStep = element.split(' ');
      final move = moveStep[0];
      final step = int.parse(moveStep[1]);
      for (var i = 1; i <= step; i++) {
        switch (move) {
          case 'L':
            rope[0] = Point(rope[0].x - 1, rope[0].y);
            break;
          case 'U':
            rope[0] = Point(rope[0].x, rope[0].y - 1);
            break;
          case 'R':
            rope[0] = Point(rope[0].x + 1, rope[0].y);
            break;
          case 'D':
            rope[0] = Point(rope[0].x, rope[0].y + 1);
            break;
        }
        for (var j = 1; j <= n - 1; j++) {
          var x = rope[j - 1].x - rope[j].x;
          var y = rope[j - 1].y - rope[j].y;
          if (max(x.abs(), y.abs()) > 1) {
            if (x.abs() >= 1) {
              if (x < 0) {
                rope[j] = Point(rope[j].x - 1, rope[j].y);
              } else {
                rope[j] = Point(rope[j].x + 1, rope[j].y);
              }
            }
            if (y.abs() >= 1) {
              if (y < 0) {
                rope[j] = Point(rope[j].x, rope[j].y - 1);
              } else {
                rope[j] = Point(rope[j].x, rope[j].y + 1);
              }
            }
          }
        }
        visit.add(rope.last);
      }
    }
    return visit.length;
  }
}
