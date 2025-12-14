//
//  AOCTests.swift
//  AOC
//
//  Created by Jeevan Chandra Joshi on 30/11/25.
//

import Testing

@testable import AOC

@Suite("Tests")
struct AOCTests {
    @Suite("Day01 Tests")
    struct Day01Tests {
        @Test("Part 1")
        func testPart1() async throws {
            let day = Day01()
            #expect(day.part1() == 995)
        }

        @Test("Part 2")
        func testPart2() async throws {
            let day = Day01()
            #expect(day.part2() == 5847)
        }
    }
}
