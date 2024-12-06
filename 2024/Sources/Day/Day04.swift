
//
//  Day04.swift
//  AOC
//
//  Created by Jeevan Chandra Joshi on 04/12/24.
//

import Foundation

struct Day04: Day {
    let data: String

    var lines: [[String]] {
        data.components(separatedBy: "\n").compactMap {
            $0.split(separator: "").compactMap {
                String($0)
            }
        }
    }

    func get(_ i: Int?, _ j: Int?) -> String? {
        if let i = i, i >= 0, i < lines.count, let j = j, j >= 0, j < lines[i].count {
            return lines[i][j]
        }
        return nil
    }

    func countPattern(_ pattern: [String], start: (Int, Int), directions: [(Int, Int)]) -> Int {
        var count = 0

        for direction in directions {
            var isMatch = true

            for (offset, char) in pattern.enumerated() {
                let nextRow = start.0 + offset * direction.0
                let nextCol = start.1 + offset * direction.1

                if get(nextRow, nextCol) != char {
                    isMatch = false
                    break
                }
            }

            if isMatch {
                count += 1
            }
        }

        return count
    }

    func part1() -> Int {
        let pattern = ["X", "M", "A", "S"]

        let directions = [
            (0, 1),
            (1, 0),
            (0, -1),
            (-1, 0),
            (1, 1),
            (1, -1),
            (-1, -1),
            (-1, 1)
        ]

        var count = 0

        for i in 0..<lines.count {
            for j in 0..<lines[i].count {
                count += countPattern(pattern, start: (i, j), directions: directions)
            }
        }

        return count
    }

    func checkPattern(_ start: (Int, Int), _ pattern: [(Int, Int, String)]) -> Bool {
        for (offsetRow, offsetCol, expectedChar) in pattern {
            let row = start.0 + offsetRow
            let col = start.1 + offsetCol

            if get(row, col) != expectedChar {
                return false
            }
        }
        return true
    }

    func part2() -> Int {
        let patterns = [
            [(0, 0, "M"), (2, -2, "S"), (2, 0, "M"), (0, -2, "S"), (1, -1, "A")],
            [(0, 0, "M"), (2, -2, "S"), (2, 0, "S"), (0, -2, "M"), (1, -1, "A")],
            [(0, 0, "S"), (2, -2, "M"), (2, 0, "S"), (0, -2, "M"), (1, -1, "A")],
            [(0, 0, "S"), (2, -2, "M"), (2, 0, "M"), (0, -2, "S"), (1, -1, "A")]
        ]

        var count = 0

        for i in 0..<lines.count {
            for j in 0..<lines[i].count {
                for pattern in patterns {
                    if checkPattern((i, j), pattern) {
                        count += 1
                    }
                }
            }
        }

        return count
    }
}
