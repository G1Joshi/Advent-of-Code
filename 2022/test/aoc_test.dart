import 'package:aoc/aoc.dart';
import 'package:test/test.dart';

void main() {
  group('Day01', () {
    final day = Day01();
    test('Part1', () {
      expect(day.part1(), 66186);
    });
    test('Part2', () {
      expect(day.part2(), 196804);
    });
  });

  group('Day02', () {
    final day = Day02();
    test('Part1', () {
      expect(day.part1(), 13005);
    });
    test('Part2', () {
      expect(day.part2(), 11373);
    });
  });

  group('Day03', () {
    final day = Day03();
    test('Part1', () {
      expect(day.part1(), 8123);
    });
    test('Part2', () {
      expect(day.part2(), 2620);
    });
  });

  group('Day04', () {
    final day = Day04();
    test('Part1', () {
      expect(day.part1(), 576);
    });
    test('Part2', () {
      expect(day.part2(), 905);
    });
  });

  group('Day05', () {
    final day = Day05();
    test('Part1', () {
      expect(day.part1(), "VQZNJMWTR");
    });
    test('Part2', () {
      expect(day.part2(), "NLCDCLVMQ");
    });
  });

  group('Day06', () {
    final day = Day06();
    test('Part1', () {
      expect(day.part1(), 1702);
    });
    test('Part2', () {
      expect(day.part2(), 3559);
    });
  });

  group('Day07', () {
    final day = Day07();
    test('Part1', () {
      expect(day.part1(), 1783610);
    });
    test('Part2', () {
      expect(day.part2(), 4370655);
    });
  });

  group('Day08', () {
    final day = Day08();
    test('Part1', () {
      expect(day.part1(), 1851);
    });
    test('Part2', () {
      expect(day.part2(), 574080);
    });
  });
}
