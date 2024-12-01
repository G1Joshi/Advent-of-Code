#include "aoc.h"

void AOC::loadInput(const string &filename) {
    ifstream file(filename);
    if (!file.is_open()) {
        cerr << "Error opening file: " << filename << endl;
        exit(1);
    }
    string line;
    while (getline(file, line)) {
        data.push_back(line);
    }
}

AOC::AOC(const string &day) : day(day) {
    string filename = "input/day" + day + ".txt";
    loadInput(filename);
}

void AOC::solve() {
    cout << "Day " << day << endl;
    cout << "Part 1: " << part1() << endl;
    cout << "Part 2: " << part2() << endl;
}
