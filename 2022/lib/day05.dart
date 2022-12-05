part of 'aoc.dart';

class Day05 extends AOC {
  @override
  String part1() {
    String message = '';
    var e = 0;
    for (; e < data.length; e++) {
      if (data[e].isEmpty) {
        e++;
        break;
      }
    }
    var stack = getStack(e - 2);
    for (; e < data.length; e++) {
      final nab = data[e].split(' ');
      int n = int.parse(nab[1]);
      int a = int.parse(nab[3]);
      int b = int.parse(nab[5]);
      for (var i = 0; i < n; i++) {
        var t = stack[a - 1].first;
        stack[a - 1].removeFirst();
        stack[b - 1].addFirst(t);
      }
    }
    for (var element in stack) {
      message += element.first;
    }
    return message;
  }

  @override
  String part2() {
    String message = '';
    var e = 0;
    for (; e < data.length; e++) {
      if (data[e].isEmpty) {
        e++;
        break;
      }
    }
    var stack = getStack(e - 2);
    for (; e < data.length; e++) {
      final nab = data[e].split(' ');
      int n = int.parse(nab[1]);
      int a = int.parse(nab[3]);
      int b = int.parse(nab[5]);
      Queue temp = Queue();
      for (var i = 0; i < n; i++) {
        temp.addFirst(stack[a - 1].first);
        stack[a - 1].removeFirst();
      }
      for (var i = 0; i < n; i++) {
        var t = temp.first;
        temp.removeFirst();
        stack[b - 1].addFirst(t);
      }
    }
    for (var element in stack) {
      message += element.first;
    }
    return message;
  }

  List<Queue> getStack(int e) {
    final n = int.parse(data[e].split('   ').last);
    var stack = List.generate(n, (index) => Queue());
    for (var i = e - 1; i >= 0; i--) {
      for (var j = 0; j < n; j++) {
        var k = data[i][j * 4 + 1];
        if (k != ' ') stack[j].addFirst(k);
      }
    }
    return stack;
  }
}
