//
//  AOCTests.swift
//  AOC
//
//  Created by Jeevan Chandra Joshi on 30/11/24.
//

@testable import AOC
import Testing

@Suite("Tests")
struct AOCTests {
    @Suite("Day01 Tests")
    struct Day01Tests {
        @Test("Part 1")
        func testPart1() async throws {
            let day = Day01()
            #expect(day.part1() == 2166959)
        }

        @Test("Part 2")
        func testPart2() async throws {
            let day = Day01()
            #expect(day.part2() == 23741109)
        }
    }

    @Suite("Day02 Tests")
    struct Day02Tests {
        @Test("Part 1")
        func testPart1() async throws {
            let day = Day02()
            #expect(day.part1() == 220)
        }

        @Test("Part 2")
        func testPart2() async throws {
            let day = Day02()
            #expect(day.part2() == 296)
        }
    }

    @Suite("Day03 Tests")
    struct Day03Tests {
        @Test("Part 1")
        func testPart1() async throws {
            let day = Day03()
            #expect(day.part1() == 166357705)
        }

        @Test("Part 2")
        func testPart2() async throws {
            let day = Day03()
            #expect(day.part2() == 88811886)
        }
    }

    @Suite("Day04 Tests")
    struct Day04Tests {
        @Test("Part 1")
        func testPart1() async throws {
            let day = Day04()
            #expect(day.part1() == 2406)
        }

        @Test("Part 2")
        func testPart2() async throws {
            let day = Day04()
            #expect(day.part2() == 1807)
        }
    }

    @Suite("Day05 Tests")
    struct Day05Tests {
        @Test("Part 1")
        func testPart1() async throws {
            let day = Day05()
            #expect(day.part1() == 0)
        }

        @Test("Part 2")
        func testPart2() async throws {
            let day = Day05()
            #expect(day.part2() == 0)
        }
    }
}
