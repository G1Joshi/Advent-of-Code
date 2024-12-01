#ifndef aoc_h
#define aoc_h

#include <fstream>
#include <iostream>
#include <string>
#include <vector>

using namespace std;

class AOC {
   protected:
    string day;
    vector<string> data;

    void loadInput(const string &filename);

    virtual int part1() = 0;
    virtual int part2() = 0;

   public:
    AOC(const string &day);
    virtual void solve();
};

#endif
