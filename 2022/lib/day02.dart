part of 'aoc.dart';

class Day02 extends AOC {
  @override
  int part1() {
    int score = 0;
    for (var element in data) {
      final data = element.split('');
      String a = data.first;
      String b = data.last;
      if (b == 'X') {
        score += 1;
      } else if (b == 'Y') {
        score += 2;
      } else if (b == 'Z') {
        score += 3;
      }
      if (a == 'A' && b == 'Y') {
        score += 6;
      } else if (a == 'B' && b == 'Z') {
        score += 6;
      } else if (a == 'C' && b == 'X') {
        score += 6;
      } else if (a == 'A' && b == 'X') {
        score += 3;
      } else if (a == 'B' && b == 'Y') {
        score += 3;
      } else if (a == 'C' && b == 'Z') {
        score += 3;
      }
    }
    return score;
  }

  @override
  int part2() {
    int score = 0;
    for (var element in data) {
      final data = element.split('');
      String a = data.first;
      String b = data.last;
      if (b == 'X') {
        score += 0;
      } else if (b == 'Y') {
        score += 3;
      } else if (b == 'Z') {
        score += 6;
      }
      if (a == 'A') {
        switch (b) {
          case 'Y':
            score += 1;
            break;
          case 'Z':
            score += 2;
            break;
          case 'X':
            score += 3;
            break;
        }
      } else if (a == 'B') {
        switch (b) {
          case 'X':
            score += 1;
            break;
          case 'Y':
            score += 2;
            break;
          case 'Z':
            score += 3;
            break;
        }
      } else if (a == 'C') {
        switch (b) {
          case 'Z':
            score += 1;
            break;
          case 'X':
            score += 2;
            break;
          case 'Y':
            score += 3;
            break;
        }
      }
    }
    return score;
  }
}
