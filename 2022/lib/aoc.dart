import 'dart:io';
import 'dart:math';

part 'day01.dart';
part 'day02.dart';
part 'day03.dart';

abstract class AOC {
  AOC() {
    day = runtimeType.toString().substring(3);
    data = File('input/day$day.txt').readAsLinesSync();
    solve();
  }

  late String day;
  late List<String> data;

  int part1();
  int part2();

  void solve() {
    print('\nDay$day');
    print('Part1: ${part1()}');
    print('Part2: ${part2()}');
  }
}
