part of 'aoc.dart';

class Day10 extends AOC {
  @override
  int part1() {
    int x = 1, sum = 0, cycle = 20;
    void tick() {
      cycle++;
      if (cycle % 40 == 0) {
        sum += (cycle - 20) * x;
      }
    }

    for (var element in data) {
      if (element.split(' ')[0] == "addx") {
        tick();
        tick();
        x += int.parse(element.split(' ')[1]);
      } else {
        tick();
      }
    }
    return sum;
  }

  @override
  String part2() {
    int x = 1, cycle = 20;
    void draw() {
      var n = (cycle - 20) % 40;
      if (n >= x - 1 && n <= x + 1) {
        // stdout.write('#');
      } else {
        // stdout.write('.');
      }
      // if (n == 39) stdout.write('\n');
      cycle++;
    }

    for (var element in data) {
      if (element.split(' ')[0] == "addx") {
        draw();
        draw();
        x += int.parse(element.split(' ')[1]);
      } else {
        draw();
      }
    }
    return 'EGJBGCFK';
  }
}
