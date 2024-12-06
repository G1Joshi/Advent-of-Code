//
//  Day03.swift
//  AOC
//
//  Created by Jeevan Chandra Joshi on 03/12/24.
//

import Foundation

struct Day03: Day {
    let data: String

    var lines: [String] {
        data.components(separatedBy: "\n")
    }

    var updatedLines: [String] {
        data.replacing(/don't\(\)((?s)(?!do\(\)).)*do\(\)/, with: "").components(separatedBy: "\n")
    }

    func filter(_ line: String) -> Int {
        var count = 0

        let regex = try! NSRegularExpression(pattern: #"mul\(\d+,\d+\)"#)
        let matches = regex.matches(in: line, range: NSRange(line.startIndex..., in: line))
        for match in matches {
            let matchedString = (line as NSString).substring(with: match.range)

            let numbers = matchedString.dropFirst(4).dropLast(1).split(separator: ",")
                .compactMap { Int($0) }

            if let first = numbers.first, let last = numbers.last {
                count += first * last
            }
        }

        return count
    }

    func part1() -> Int {
        lines.reduce(0) { sum, line in
            sum + filter(line)
        }
    }

    func part2() -> Int {
        updatedLines.reduce(0) { sum, line in
            sum + filter(line)
        }
    }
}
