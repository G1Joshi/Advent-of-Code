#include "day.h"

class Day01 : public Day {
   public:
    Day01() : Day("01") { solve(); }

    int part1() override {
        int sum = 0;
        for (auto line : data) {
            string result = "";

            for (auto ch : line) {
                if (isdigit(ch)) {
                    result += ch;
                }
            }

            if (!result.empty()) {
                result = string() + result.front() + result.back();
                sum += stoi(result);
            }
        }
        return sum;
    }

    int part2() override {
        int sum = 0;
        unordered_map<string, char> digits = {
            {"one", '1'},   {"two", '2'},   {"three", '3'},
            {"four", '4'},  {"five", '5'},  {"six", '6'},
            {"seven", '7'}, {"eight", '8'}, {"nine", '9'}};

        for (auto line : data) {
            string result = "";
            string digit = "";

            for (auto ch : line) {
                if (isdigit(ch)) {
                    result += ch;
                } else if (isalpha(ch)) {
                    digit += ch;

                    if (digits.find(digit) != digits.end()) {
                        result += digits[digit];
                        digit = "";
                    }
                }
            }

            if (!result.empty()) {
                result = string() + result.front() + result.back();
                sum += stoi(result);
            }
        }
        return sum;
    }
};
