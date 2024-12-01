#ifndef day_h
#define day_h

#include "../aoc.h"

class Day : public AOC {
   protected:
    Day(const string &day) : AOC(day) {}

   public:
    virtual int part1() = 0;
    virtual int part2() = 0;
    virtual ~Day() = default;
};

#endif
