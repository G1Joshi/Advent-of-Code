//
//  AOC.swift
//  AOC
//
//  Created by Jeevan Chandra Joshi on 30/11/25.
//

import ArgumentParser

let allChallenges: [any Day] = [
    Day01()
]

@main
struct AOC: AsyncParsableCommand {
    @Argument(help: "The day of the challenge.")
    var day: Int?

    @Flag(help: "Benchmark the time taken by the solution.")
    var benchmark: Bool = false

    @Flag(help: "Run all available days.")
    var all: Bool = false

    private var selectedChallenge: any Day {
        get throws {
            if let day = day {
                guard let challenge = allChallenges.first(where: { $0.day == day }) else {
                    throw ValidationError("No solution found for day \(day).")
                }
                return challenge
            } else {
                return latestChallenge
            }
        }
    }

    private var latestChallenge: any Day {
        guard let latest = allChallenges.max(by: { $0.day < $1.day }) else {
            fatalError("No challenges available.")
        }
        return latest
    }

    private func run<T>(part: () async throws -> T, named: String) async -> Duration {
        var result: Result<T, Error>?
        let timing = await ContinuousClock().measure {
            do {
                result = try .success(await part())
            } catch {
                result = .failure(error)
            }
        }
        switch result! {
        case .success(let success):
            print("\(named): \(success)")
        case .failure(let failure as PartUnimplemented):
            print("Day \(failure.day) Part \(failure.part) unimplemented.")
        case .failure(let failure):
            print("\(named): Failed with error: \(failure).")
        }
        return timing
    }

    func run() async throws {
        let challenges: [any Day] = all ? allChallenges : try [selectedChallenge]

        for challenge in challenges {
            print("Advent of Code: Day \(challenge.day)...")

            let timing1 = await run(part: challenge.part1, named: "Part 1")
            let timing2 = await run(part: challenge.part2, named: "Part 2")

            if benchmark {
                print("Part 1 took \(timing1), Part 2 took \(timing2).")
                #if DEBUG
                    print("You're benchmarking debug code.")
                #endif
            }
        }
    }
}
