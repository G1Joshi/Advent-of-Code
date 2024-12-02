//
//  Day02.swift
//  AOC
//
//  Created by Jeevan Chandra Joshi on 02/12/24.
//

import Foundation

struct Day02: Day {
    let data: String

    var lines: [[Int]] {
        data.split(separator: "\n").map {
            $0.split(separator: " ").compactMap { Int($0) }
        }
    }

    func isValid(_ line: [Int]) -> Bool {
        let isIncreasing = line.first! < line.last!

        for i in 0 ..< line.count - 1 {
            let diff = isIncreasing ? (line[i + 1] - line[i]) : (line[i] - line[i + 1])
            if diff < 1 || diff > 3 {
                return false
            }
        }

        return true
    }

    func part1() -> Int {
        lines.reduce(0) { sum, line in
            if isValid(line) {
                return sum + 1
            }
            return sum + 0
        }
    }

    func part2() -> Int {
        lines.reduce(0) { sum, line in
            if isValid(line) {
                return sum + 1
            }
            for i in 0 ..< line.count {
                var line = line
                line.remove(at: i)
                if isValid(line) {
                    return sum + 1
                }
            }
            return sum + 0
        }
    }
}
