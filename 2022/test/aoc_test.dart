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
}
