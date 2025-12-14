//
//  Day01.swift
//  AOC
//
//  Created by Jeevan Chandra Joshi on 01/12/25.
//

import Foundation

struct Day01: Day {
    let data: String

    var lines: [String] {
        data.split(separator: "\n").map {
            String($0)
        }
    }

    var steps: [(Character, Int)] {
        lines.compactMap { line in
            guard let direction = line.first,
                let number = Int(line.dropFirst())
            else {
                return nil
            }
            return (direction, number)
        }
    }

    func normalizeScore(_ score: Int) -> Int {
        ((score % 100) + 100) % 100
    }

    func part1() -> Int {
        var score = 50
        var zero = 0

        for instruction in steps {
            switch instruction.0 {
            case "L":
                score = normalizeScore(score - instruction.1)
                if score == 0 { zero += 1 }

            case "R":
                score = normalizeScore(score + instruction.1)
                if score == 0 { zero += 1 }

            default:
                continue
            }
        }

        return zero
    }

    func part2() -> Int {
        var score = 50
        var zero = 0

        for instruction in steps {
            switch instruction.0 {
            case "L":
                zero += instruction.1 / 100

                let remainder = instruction.1 % 100
                let next = normalizeScore(score - remainder)

                if score != 0 && (next == 0 || remainder >= score) {
                    zero += 1
                }

                score = normalizeScore(score - instruction.1)

            case "R":
                zero += instruction.1 / 100

                let remainder = instruction.1 % 100
                let next = normalizeScore(score + remainder)

                if score != 0 && (next == 0 || score + remainder >= 100) {
                    zero += 1
                }

                score = normalizeScore(score + instruction.1)

            default:
                continue
            }
        }

        return zero
    }
}
