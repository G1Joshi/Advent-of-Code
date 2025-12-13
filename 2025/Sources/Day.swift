//
//  Day.swift
//  AOC
//
//  Created by Jeevan Chandra Joshi on 30/11/25.
//

import Foundation

protocol Day: Sendable {
    associatedtype Answer = Int

    static var day: Int { get }
    init(data: String)
    func part1() async throws -> Answer
    func part2() async throws -> Answer
}

extension Day {
    static var day: Int {
        let typeName = String(reflecting: Self.self)
        guard let i = typeName.lastIndex(where: { !$0.isNumber }),
            let day = Int(typeName[i...].dropFirst())
        else {
            fatalError("Day number not found in type name.")
        }
        return day
    }

    var day: Int { Self.day }

    init() {
        self.init(data: Self.loadData(for: Self.day))
    }

    static func loadData(for day: Int) -> String {
        let dayString = String(format: "%02d", day)
        let dataFilename = "Day\(dayString)"
        guard
            let dataURL = Bundle.module.url(
                forResource: dataFilename,
                withExtension: "txt",
                subdirectory: "Data"
            ),
            let data = try? String(contentsOf: dataURL, encoding: .utf8)
        else {
            fatalError("Couldn't find file '\(dataFilename).txt' in the 'Data' directory.")
        }
        return data.replacingOccurrences(of: "\r", with: "")
    }
}

struct PartUnimplemented: Error {
    let day: Int
    let part: Int
}
