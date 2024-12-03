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
            let challenge = Day01()
            #expect(challenge.part1() == 2166959)
        }

        @Test("Part 2")
        func testPart2() async throws {
            let challenge = Day01()
            #expect(challenge.part2() == 23741109)
        }
    }

    @Suite("Day02 Tests")
    struct Day02Tests {
        @Test("Part 1")
        func testPart1() async throws {
            let challenge = Day02()
            #expect(challenge.part1() == 220)
        }

        @Test("Part 2")
        func testPart2() async throws {
            let challenge = Day02()
            #expect(challenge.part2() == 296)
        }
    }

    @Suite("Day03 Tests")
    struct Day03Tests {
        @Test("Part 1")
        func testPart1() async throws {
            let challenge = Day03()
            #expect(challenge.part1() == 166357705)
        }

        @Test("Part 2")
        func testPart2() async throws {
            let challenge = Day03()
            #expect(challenge.part2() == 88811886)
        }
    }
}
