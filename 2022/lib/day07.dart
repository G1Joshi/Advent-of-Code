part of 'aoc.dart';

class Day07 extends AOC {
  @override
  int part1() {
    int sum = 0;
    Map<String, int> dir = getDir();
    dir.forEach((key, value) {
      var currentSum = 0;
      dir.forEach((keys, values) {
        if (keys.startsWith(key)) currentSum += values;
      });
      if (currentSum < 100000) sum += currentSum;
    });
    return sum;
  }

  @override
  int part2() {
    int sum = 0;
    Map<String, int> map = {}, dir = getDir();
    dir.forEach((key, value) {
      sum = 0;
      dir.forEach((keys, values) {
        if (keys.startsWith(key)) sum += values;
      });
      map[key] = sum;
    });
    final space = map['/']! - 40000000;
    final list = map.values.toList()..sort();
    for (var l in list) {
      if (l >= space) {
        sum = l;
        break;
      }
    }
    return sum;
  }

  Map<String, int> getDir() {
    Map<String, int> dir = {};
    String currentDir = "";
    for (var element in data) {
      final data = element.split(' ');
      if (data[1] == 'cd') {
        if (data[2] == '/') {
          currentDir = '/';
          dir[currentDir] = 0;
        } else if (data[2] == '..') {
          currentDir = currentDir.substring(0, currentDir.lastIndexOf('/'));
        } else {
          if (currentDir == '/') {
            currentDir = '$currentDir${data[2]}';
          } else {
            currentDir = '$currentDir/${data[2]}';
          }
          dir[currentDir] = 0;
        }
      }
      if (int.tryParse(data[0]) != null) {
        dir[currentDir] = dir[currentDir]! + int.parse(data[0]);
      }
    }
    return dir;
  }
}
