import 'dart:collection';
import 'dart:io';
import 'dart:math';

part 'day01.dart';
part 'day02.dart';
part 'day03.dart';
part 'day04.dart';
part 'day05.dart';
part 'day06.dart';
part 'day07.dart';
part 'day08.dart';
part 'day09.dart';
part 'day10.dart';
part 'day11.dart';

abstract class AOC {
  AOC() {
    day = runtimeType.toString().substring(3);
    data = File('input/day$day.txt').readAsLinesSync();
    solve();
  }

  late String day;
  late List<String> data;

  part1();
  part2();

  void solve() {
    print('\nDay$day');
    print('Part1: ${part1()}');
    print('Part2: ${part2()}');
  }
}
