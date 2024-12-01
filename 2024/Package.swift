// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "AOC",
    platforms: [
        .macOS(.v13), .iOS(.v16)
    ],
    dependencies: [
        .package(
            url: "https://github.com/apple/swift-argument-parser.git", from: "1.5.0"
        )
    ],
    targets: [
        .executableTarget(
            name: "AOC",
            dependencies: [
                .product(name: "ArgumentParser", package: "swift-argument-parser")
            ],
            resources: [
                .copy("Data")
            ]
        ),
        .testTarget(
            name: "AOCTests",
            dependencies: [
                "AOC",
                .product(name: "ArgumentParser", package: "swift-argument-parser")
            ]
        )
    ]
)
