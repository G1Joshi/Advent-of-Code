//
//  Day01.swift
//  AOC
//
//  Created by Jeevan Chandra Joshi on 01/12/24.
//

import Foundation

struct Day01: Day {
    let data: String

    var lines: [[Int]] {
        data.split(separator: "\n").map {
            $0.split(separator: " ").compactMap { Int($0) }
        }
    }

    var list1: [Int] {
        lines.compactMap { $0.first }.sorted()
    }

    var list2: [Int] {
        lines.compactMap { $0.last }.sorted()
    }

    var score: [Int: Int] {
        var result: [Int: Int] = [:]

        for element in list1 {
            result[element] = list2.filter { element == $0 }.count
        }

        return result
    }

    func part1() -> Int {
        zip(list1, list2).reduce(0) { result, pair in
            result + abs(pair.0 - pair.1)
        }
    }

    func part2() -> Int {
        score.reduce(0) { result, pair in
            result + (pair.0 * pair.1)
        }
    }
}
