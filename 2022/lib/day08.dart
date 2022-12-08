part of 'aoc.dart';

class Day08 extends AOC {
  @override
  int part1() {
    int visible = 0;
    List<List<int>> tree =
        data.map((e) => e.split('').map((e) => int.parse(e)).toList()).toList();
    int n = tree.length, m = tree.first.length;
    for (var i = 0; i < n; i++) {
      for (var j = 0; j < m; j++) {
        int count = 0;
        for (var k = i - 1; k >= 0; k--) {
          if (tree[i][j] <= tree[k][j]) {
            count++;
            break;
          }
        }
        for (var k = j - 1; k >= 0; k--) {
          if (tree[i][j] <= tree[i][k]) {
            count++;
            break;
          }
        }
        for (var k = i + 1; k < n; k++) {
          if (tree[i][j] <= tree[k][j]) {
            count++;
            break;
          }
        }
        for (var k = j + 1; k < m; k++) {
          if (tree[i][j] <= tree[i][k]) {
            count++;
            break;
          }
        }
        if (count != 4) visible++;
      }
    }
    return visible;
  }

  @override
  int part2() {
    int score = 0;
    List<List<int>> tree =
        data.map((e) => e.split('').map((e) => int.parse(e)).toList()).toList();
    int n = tree.length, m = tree.first.length;
    for (var i = 0; i < n; i++) {
      for (var j = 0; j < m; j++) {
        List<int> count = List.filled(4, 0);
        int sum = 1;
        for (var k = i - 1; k >= 0; k--) {
          if (tree[i][j] <= tree[k][j]) {
            count[0]++;
            break;
          } else {
            count[0]++;
          }
        }
        for (var k = j - 1; k >= 0; k--) {
          if (tree[i][j] <= tree[i][k]) {
            count[2]++;
            break;
          } else {
            count[2]++;
          }
        }
        for (var k = i + 1; k < n; k++) {
          if (tree[i][j] <= tree[k][j]) {
            count[1]++;
            break;
          } else {
            count[1]++;
          }
        }
        for (var k = j + 1; k < m; k++) {
          if (tree[i][j] <= tree[i][k]) {
            count[3]++;
            break;
          } else {
            count[3]++;
          }
        }
        sum = count.reduce((value, element) => value * element);
        score = max(score, sum);
      }
    }
    return score;
  }
}
