
//
//  Day05.swift
//  AOC
//
//  Created by Jeevan Chandra Joshi on 05/12/24.
//

import Foundation

struct Day05: Day {
    let data: String

    var lines: [String] {
        data.components(separatedBy: "\n\n")
    }

    var pageRules: [String] {
        lines.first!.components(separatedBy: "\n").compactMap {
            $0.split(separator: "|").compactMap {
                $0
            }.joined()
        }
    }

    var pageNumbers: [[Int]] {
        lines.last!.components(separatedBy: "\n").compactMap {
            $0.split(separator: ",").compactMap {
                Int($0)
            }
        }
    }

    func part1() -> Int {
        var sum = 0

        for page in pageNumbers {
            var flag = true
            for i in 0 ..< page.count - 1 {
                if !pageRules.contains("\(page[i])\(page[i+1])") {
                    flag = false
                }
            }
            if flag {
                sum += page[page.count/2]
            }
        }

        return sum
    }

    func part2() -> Int {
        var sum = 0

        for page in pageNumbers {
            sum += solve(page)
        }

        return sum
    }

    func solve(_ page: [Int], sorted: Bool = false) -> Int {
        var flag = true
        for i in 0 ..< page.count - 1 {
            if !pageRules.contains("\(page[i])\(page[i+1])") {
                flag = false
            }
        }
        if !flag {
            var page = page

            for i in 0 ..< page.count - 1 {
                if pageRules.contains("\(page[i+1])\(page[i])") {
                    let temp = page[i]
                    page[i] = page[i+1]
                    page[i+1] = temp

                    return solve(page, sorted: true)
                }
            }

            return page[page.count/2]
        }
        if sorted {
            if flag {
                return page[page.count/2]
            }
        }
        return 0
    }
}
