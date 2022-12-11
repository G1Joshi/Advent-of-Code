part of 'aoc.dart';

class Day11 extends AOC {
  @override
  int part1() {
    List<Monkey> monkeys = getMonkeys();
    for (var i = 0; i < 20; i++) {
      for (var monkey in monkeys) {
        for (var item in monkey.items) {
          monkeys[monkey.a].inspect++;
          var worry = 0;
          switch (monkey.operation) {
            case '+':
              worry = item + (monkey.operand ?? item);
              break;
            case '*':
              worry = item * (monkey.operand ?? item);
              break;
          }
          var level = worry ~/ 3;
          if (level % monkey.test == 0) {
            monkeys[monkey.b].items.add(level);
          } else {
            monkeys[monkey.c].items.add(level);
          }
        }
        monkey.items.clear();
      }
    }
    return business(monkeys);
  }

  @override
  int part2() {
    List<Monkey> monkeys = getMonkeys();
    var test = monkeys.map((m) => m.test).reduce((a, b) => (a * b) ~/ a.gcd(b));
    for (var i = 0; i < 10000; i++) {
      for (var monkey in monkeys) {
        for (var item in monkey.items) {
          monkeys[monkey.a].inspect++;
          var worry = 0;
          switch (monkey.operation) {
            case '+':
              worry = item + (monkey.operand ?? item);
              break;
            case '*':
              worry = item * (monkey.operand ?? item);
              break;
          }
          var level = worry % test;
          if (level % monkey.test == 0) {
            monkeys[monkey.b].items.add(level);
          } else {
            monkeys[monkey.c].items.add(level);
          }
        }
        monkey.items.clear();
      }
    }
    return business(monkeys);
  }

  List<Monkey> getMonkeys() {
    List<Monkey> monkeys = [];
    int index = -1;
    for (var element in data) {
      if (element.contains('Monkey')) {
        index++;
        monkeys.add(Monkey());
        monkeys[index].a = int.parse(element.split(' ')[1].split(':')[0]);
      } else if (element.contains('items')) {
        monkeys[index]
            .items
            .addAll(element.split(':')[1].split(',').map((e) => int.parse(e)));
      } else if (element.contains('Operation')) {
        monkeys[index].operation =
            element.split(' ')[element.split(' ').length - 2];
        monkeys[index].operand =
            int.tryParse(element.split(' ')[element.split(' ').length - 1]);
      } else if (element.contains('Test')) {
        monkeys[index].test = int.parse(element.split(' ').last);
      } else if (element.contains('true')) {
        monkeys[index].b = int.parse(element.split(' ').last);
      } else if (element.contains('false')) {
        monkeys[index].c = int.parse(element.split(' ').last);
      }
    }
    return monkeys;
  }

  int business(List<Monkey> monkeys) {
    final inspect = (monkeys.map((e) => e.inspect).toList()..sort())
        .reversed
        .take(2)
        .toList();
    return inspect.first * inspect.last;
  }
}

class Monkey {
  late int a;
  List<int> items = [];
  late String operation;
  int? operand;
  late int test;
  late int b;
  late int c;
  int inspect = 0;
}
